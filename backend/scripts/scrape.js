import puppeteer from "puppeteer";
import fs from "fs";

const getMovieLinks = async () => {
  const browser = await puppeteer.launch({
    headless: false,
    defaultViewport: null,
  });

  const page = await browser.newPage();

  await page.goto("https://www.pathe.fr/cinemas/cinema-pathe-wilson", {
    waitUntil: "domcontentloaded",
    timeout: 90000,
  });

  const movieLinks = await page.evaluate(() => {
    const movieElements = document.querySelectorAll(".card-screening__content .h3.ft-700.mt-1.mb-04 a");
    return Array.from(movieElements).map((movie) => ({
      link: movie.href,
    }));
  });

  let sqlCommands = `
    BEGIN;

  `;

  for (const movie of movieLinks) {
    try {
      await page.goto(movie.link, { waitUntil: "domcontentloaded", timeout: 60000 });

      const details = await page.evaluate(() => {
        const title = document.querySelector(".container .row .h1.mb-0.ft-800")?.innerText || "Title not available";
        const genres = Array.from(document.querySelectorAll(".container .row .label.label--dark"))
          .slice(0, -1)
          .map((element) => element.innerText);
        const description = document.querySelector(".container .row .ft-primary")?.innerText || "Description not available";
        const people = document.querySelectorAll(".container .row li");
        const producerRaw = people[0]?.innerText || "Producer not available";
        const castRaw = people[1]?.innerText || "Cast not available";
        const releaseDate = document.querySelector(".ft-default.c-white-70.mb-0.mb-md-0")?.innerText || "Release date not available";
        const image = document.querySelector(".hero-film__poster.desktop-only")?.src || "Image not available";

        // Clean up producer and cast
        const producer = producerRaw.replace("Réalisé par :", "").trim();
        const cast = castRaw.replace("Avec :", "").split(",").map(name => name.trim());
        const release_date = releaseDate.replace("Sortie :", "").trim();

        return { title, genres, description, producer, cast, release_date, image };
      });

      // Convert the release_date to MySQL-compatible format (YYYY-MM-DD)
      const releaseDateFormatted = new Date(details.release_date);
      const releaseDateString = isNaN(releaseDateFormatted.getTime())
        ? null
        : releaseDateFormatted.toISOString().split("T")[0];

      // Skip movie if release date is null
      if (!releaseDateString) {
        console.log(`Skipping movie with no release date: ${details.title}`);
        continue;
      }

      // Insert movie record
      sqlCommands += `
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          '${details.title.replace(/'/g, "''")}', 
          '${details.description.replace(/'/g, "''")}', 
          '${details.image.replace(/'/g, "''")}',
          '${details.producer.replace(/'/g, "''")}', 
          '${releaseDateString}'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      `;

      // Insert unique genres and populate the movie_genre table
      const uniqueGenres = [...new Set(details.genres)]; // Ensures only unique genres are included
      uniqueGenres.forEach((genre) => {
        sqlCommands += `
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT '${genre.replace(/'/g, "''")}'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = '${genre.replace(/'/g, "''")}' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = '${genre.replace(/'/g, "''")}'
          LIMIT 1;
        `;
      });

      // Insert cast members into the cast table and associate with the movie
      details.cast.forEach((actor) => {
        sqlCommands += `
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            '${actor.replace(/'/g, "''")}'
          );
        `;
      });

    } catch (error) {
      console.error(`Failed to retrieve data for ${movie.link}:`, error);
    }
  }

  sqlCommands += "COMMIT;";

  fs.writeFileSync("./database/initial_data.sql", sqlCommands, "utf-8");
  console.log("SQL script saved to initial_data.sql");

  await browser.close();
};

// Start the scraping
getMovieLinks();
