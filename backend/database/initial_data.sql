
    BEGIN;

  
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Séance All Inclusive : Gladiator II', 
          'Venez découvrir en Avant-Première et dans les meilleures conditions, le nouveau chef-d’œuvre de Ridley Scott : Gladiator II. L’offre All Inclusive, c’est un accueil personnalisé par l’équipe de votre cinéma, un verre de bienvenu offert, ainsi qu’une collation gourmande salée et sucrée, pour un moment privilégié exceptionnel !  Synopsis : Des années après avoir assisté à la mort du héros vénéré Maximus aux mains de son oncle, Lucius est forcé d''entrer dans le Colisée lorsque son pays est conquis par les empereurs tyranniques qui gouvernent désormais Rome d''une main de fer. La rage au cœur et l''avenir de l''Empire en jeu, Lucius doit se tourner vers son passé pour trouver la force et l''honneur de rendre la gloire de Rome à son peuple', 
          'https://media.pathe.fr/movie/alex/HO00008557/poster/md/9/movie&uuid=C327BAFF-7F16-47C2-80E9-F49582334CD8',
          'Ridley Scott', 
          '2024-11-09'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Action'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Action' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Action'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Péplum'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Péplum' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Péplum'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pedro Pascal'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Denzel Washington'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Paul Mescal'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Séance All Inclusive : Gladiator II', 
          'Venez découvrir en Avant-Première et dans les meilleures conditions, le nouveau chef-d’œuvre de Ridley Scott : Gladiator II. L’offre All Inclusive, c’est un accueil personnalisé par l’équipe de votre cinéma, un verre de bienvenu offert, ainsi qu’une collation gourmande salée et sucrée, pour un moment privilégié exceptionnel !  Synopsis : Des années après avoir assisté à la mort du héros vénéré Maximus aux mains de son oncle, Lucius est forcé d''entrer dans le Colisée lorsque son pays est conquis par les empereurs tyranniques qui gouvernent désormais Rome d''une main de fer. La rage au cœur et l''avenir de l''Empire en jeu, Lucius doit se tourner vers son passé pour trouver la force et l''honneur de rendre la gloire de Rome à son peuple', 
          'https://media.pathe.fr/movie/alex/HO00008557/poster/md/9/movie&uuid=C327BAFF-7F16-47C2-80E9-F49582334CD8',
          'Ridley Scott', 
          '2024-11-09'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Action'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Action' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Action'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Péplum'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Péplum' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Péplum'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pedro Pascal'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Denzel Washington'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Paul Mescal'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Gladiator II', 
          'L''histoire de Lucius, le fils de Lucilla (Connie Nielsen dans Gladiator) et neveu de Commode (Joaquin Phoenix). Lucius est très admiratif du parcours de Maximus et devrait suivre ses traces.', 
          'https://media.pathe.fr/movie/alex/HO00007481/poster/md/87/movie&uuid=8C8A2897-61A9-4327-8A05-87BB50B355B1',
          'Ridley Scott', 
          '2024-11-12'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Action'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Action' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Action'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Aventure'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Aventure' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Aventure'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Paul Mescal'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Denzel Washington'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pedro Pascal'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'The Substance', 
          'Avez-vous déjà rêvé d’une meilleure version de vous-même ? Vous devriez essayer ce nouveau produit : THE SUBSTANCE Il a changé ma vie. Il permet de générer une autre version de vous-même, plus jeune, plus belle, plus parfaite. Respectez les instructions :VOUS ACTIVEZ une seule fois VOUS STABILISEZ chaque jour VOUS PERMUTEZ tous les sept jours sans exception. Il suffit de partager le temps. C’est si simple, qu’est-ce qui pourrait mal tourner ?', 
          'https://media.pathe.fr/movie/alex/HO00007842/poster/md/35/movie&uuid=D64EEBB3-3E37-41AA-BC26-E21FE566125D',
          'Coralie Fargeat', 
          '2024-11-05'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Epouvante-horreur'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Epouvante-horreur' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Epouvante-horreur'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Dennis Quaid'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Demi Moore'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Margaret Qualley'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'À toute allure', 
          'Elle est officier de sous-marin tactique. Il est steward. Ils se rencontrent lors d''une escale. Mais leur aventure naissante doit subitement s''interrompre. Et le voilà qui s''accroche ! Qui la suit ! Qui la colle ! Comme si on avait le temps d''être amoureuse à bord d''un bâtiment militaire ! Reste que l''océan Pacifique n''est pas assez grand pour le décourager. L''océan Arctique non plus d''ailleurs. Le monde est si petit quand on s''aime d''un si grand amour...', 
          'https://media.pathe.fr/movie/alex/HO00006269/poster/md/40/movie&uuid=9A06F9EF-B612-42C8-AD00-EC347A736622',
          'Lucas Bernard', 
          '2024-11-05'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Comédie'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Comédie' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Comédie'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Romance'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Romance' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Romance'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Eye Haidara'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'José Garcia'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pio Marmaï'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Here - Les plus belles années de notre vie', 
          'Toute l’équipe de FORREST GUMP revient au cinéma, et vous transporte dans un voyage unique à travers le temps.  L’histoire de familles dont les peines, les joies et les moments de doutes se font écho à travers les générations.', 
          'https://media.pathe.fr/movie/alex/HO00008278/poster/md/39/movie&uuid=F9887A57-0F1C-4EA9-BC34-78C0071B1DA8',
          'Robert Zemeckis', 
          '2024-11-05'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Robin Wright'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Tom Hanks'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Paul Bettany'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Trois amies', 
          'Joan n''est plus amoureuse de Victor et souffre de se sentir malhonnête avec lui. Alice, sa meilleure amie, la rassure : elle-même n’éprouve aucune passion pour Eric et pourtant leur couple se porte à merveille ! Elle ignore qu’il a une liaison avec Rebecca, leur amie commune... Quand Joan décide finalement de quitter Victor et que celui-ci disparaît, la vie des trois amies et leurs histoires s’en trouvent bouleversées.', 
          'https://media.pathe.fr/movie/alex/HO00007746/poster/md/30/movie&uuid=8C6D56FE-0E73-4443-AAC5-151BC9757840',
          'Emmanuel Mouret', 
          '2024-11-05'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Camille Cottin'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Vincent Macaigne'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Sara Forestier'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Venom: The Last Dance', 
          'Dans VENOM: THE LAST DANCE, ultime opus de la trilogie, Tom Hardy est de retour sous les traits de Venom, l’un des personnages le plus complexes de l’univers Marvel. Eddie et Venom sont en cavale. Chacun est traqué par ses semblables et alors que l’étau se resserre, le duo doit prendre une décision dévastatrice qui annonce la conclusion des aventures d’Eddie & Venom.', 
          'https://media.pathe.fr/movie/alex/HO00007480/poster/md/58/movie&uuid=EA09B5FD-809D-4111-8D31-D0F173ED5D86',
          'Kelly Marcel', 
          '2024-10-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Action'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Action' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Action'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Aventure'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Aventure' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Aventure'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Chiwetel Ejiofor'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Juno Temple'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Tom Hardy'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'JURE N°2', 
          'Le film suit Justin Kemp, un père de famille ordinaire, qui se retrouve juré dans un procès pour meurtre très médiatisé. Alors qu''il est confronté à un dilemme moral déchirant, Justin réalise qu''il détient le pouvoir d''influencer le verdict du jury, ce qui pourrait soit condamner, soit libérer l''accusé.', 
          'https://media.pathe.fr/movie/alex/HO00008324/poster/md/27/movie&uuid=37655D4B-6E68-4D14-88CB-C94E58DEAD04',
          'Clint Eastwood', 
          '2024-10-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Thriller'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Thriller' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Thriller'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Nicholas Hoult'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Toni Collette'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'J.K Simmons'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Anora', 
          'Anora, jeune strip-teaseuse de Brooklyn, se transforme en Cendrillon des temps modernes lorsqu’elle rencontre le fils d’un oligarque russe. Sans réfléchir, elle épouse avec enthousiasme son prince charmant ; mais lorsque la nouvelle parvient en Russie, le conte de fées est vite menacé : les parents du jeune homme partent pour New York avec la ferme intention de faire annuler le mariage...  Festival de Cannes 2024 - Palme d''Or', 
          'https://media.pathe.fr/movie/alex/HO00007688/poster/md/70/movie&uuid=8965A8F9-D75E-4DFD-A65A-94BBAEE3D9E9',
          'Sean Baker', 
          '2024-10-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Ivy Wolk'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Lindsey Normington'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Karren Karagulian'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Flow, le chat qui n’avait plus peur de l’eau', 
          'Un chat se réveille dans un univers envahi par l’eau où toute vie humaine semble avoir disparu. Il trouve refuge sur un bateau avec un groupe d’autres animaux.  Mais s’entendre avec eux s’avère un défi encore plus grand que de surmonter sa peur de l’eau ! Tous devront désormais apprendre à surmonter leurs différences et à s’adapter au nouveau monde qui s’impose à eux.', 
          'https://media.pathe.fr/movie/alex/HO00007735/poster/md/45/movie&uuid=444119EF-3FC4-49CE-ADAF-5B2A90971BB7',
          'Gints Zilbalodis', 
          '2024-10-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Animation'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Animation' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Animation'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Aventure'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Aventure' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Aventure'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Fantastique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Fantastique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Fantastique'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Nationalité : Lettonie'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Monsieur Aznavour', 
          'Fils de réfugiés, petit, pauvre, à la voix voilée, on disait de lui qu’il n’avait rien pour réussir. À force de travail, de persévérance et d’une volonté hors norme, Charles Aznavour est devenu un monument de la chanson, et un symbole de la culture française. Avec près de 1200 titres interprétés dans le monde entier et dans toutes les langues, il a inspiré des générations entières. Découvrez le parcours exceptionnel et intemporel de MONSIEUR AZNAVOUR.', 
          'https://media.pathe.fr/movie/alex/HO00006381/poster/md/118/movie&uuid=9CD278A5-823C-48CB-8C8E-FC5F6EF9837B',
          'Grand Corps Malade, Mehdi Idir', 
          '2024-10-22'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Biopic'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Biopic' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Biopic'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Musical'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Musical' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Musical'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Lionel Cecilio'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Tahar Rahim'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Bastien Bouillon'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'L''Amour ouf', 
          'Les années 80, dans le nord de la France. Jackie et Clotaire grandissent entre les bancs du lycée et les docks du port. Elle étudie, il traîne. Et puis leurs destins se croisent et c''est l''amour fou. La vie s''efforcera de les séparer mais rien n''y fait, ces deux-là sont comme les deux ventricules du même cœur...', 
          'https://media.pathe.fr/movie/alex/HO00003500/poster/md/153/movie&uuid=57F7FFC4-CA75-458C-A4C6-DE0A4677E815',
          'Gilles Lellouche', 
          '2024-10-15'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Comédie dramatique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Comédie dramatique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Comédie dramatique'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Romance'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Romance' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Romance'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Mallory Wanecque'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Adèle Exarchopoulos'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'François Civil'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Smile 2', 
          'À l’aube d’une nouvelle tournée mondiale, la star de la pop Skye Riley (Naomi Scott) se met à vivre des événements aussi terrifiants qu’inexplicables. Submergée par la pression de la célébrité et devant un quotidien qui bascule de plus en plus dans l’horreur, Skye est forcée de se confronter à son passé obscur pour tenter de reprendre le contrôle de sa vie avant qu’il ne soit trop tard.', 
          'https://media.pathe.fr/movie/alex/HO00007869/poster/md/122/movie&uuid=698F6563-5DAF-4905-83D0-3E76FC7BD898',
          'Parker Finn', 
          '2024-10-15'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Epouvante-horreur'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Epouvante-horreur' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Epouvante-horreur'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Thriller'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Thriller' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Thriller'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Dylan Gelula'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Kyle Gallner'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Lukas Gage'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'The Apprentice', 
          'Véritable plongée dans les arcanes de l''empire américain, THE APPRENTICE retrace l''ascension vers le pouvoir du jeune Donald Trump grâce à un pacte faustien avec l''avocat conservateur et entremetteur politique Roy Cohn.', 
          'https://media.pathe.fr/movie/alex/HO00007687/poster/md/36/movie&uuid=84C55D35-80BC-459B-B6D5-6EB85E5FBB53',
          'Ali Abbasi', 
          '2024-10-08'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Biopic'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Biopic' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Biopic'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Historique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Historique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Historique'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Jeremy Strong'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Maria Bakalova'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Emily Mitchell'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Diamant brut', 
          'Liane, 19 ans, téméraire et incandescente, vit avec sa mère et sa petite sœur sous le soleil poussiéreux de Fréjus. Obsédée par la beauté et le besoin de devenir quelqu’un, elle voit en la télé-réalité la possibilité d’être aimée. Le destin semble enfin lui sourire lorsqu’elle passe un casting pour « Miracle Island ».', 
          'https://media.pathe.fr/movie/alex/HO00007674/poster/md/59/movie&uuid=FC3A6EA7-1EBB-40CD-9E86-B0FD76892A3C',
          'Agathe Riedinger', 
          '2024-11-19'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Alexis Manenti'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Andréa Bescond'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Alexandra Noisier'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Les Rendez-vous de l''Animé : OVERLORD The Sacred Kingdom', 
          'Grâce aux Rendez-vous de l’animé, découvrez le film OVERLORD : The Sacred Kingdom. Synopsis : Pour se protéger des invasions extérieures, le Royaume Sacré a érigé une muraille imprenable, sans imaginer que cette quiétude apparente serait ébranlée par l’armée du démon Jaldabaoth. Refusant de se soumettre à l’ennemi, les dirigeants du pays sollicitent le célèbre sorcier Ainz Ooal Gown afin qu’il leur prête main-forte.', 
          'https://media.pathe.fr/movie/alex/HO00008571/poster/md/2/movie&uuid=521E30CA-17E9-4179-AAB0-051FB3871CF7',
          'Pathé Amiens', 
          '2024-11-15'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Animation'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Animation' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Animation'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Angers'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Sadrak', 
          'Un homme emploie une jeune aide-soignante pour s''occuper de son père, qui souffre de la maladie d''Alzheimer, mais l''aide-soignante elle-même souffre d''une grave maladie rénale.', 
          'https://media.pathe.fr/movie/alex/HO00008528/poster/md/3/movie&uuid=B2846EDA-9986-4FA4-AF65-1DDE070E866A',
          'Narcisse Wandji', 
          '2024-11-14'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Amiens'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Emna', 
          'Daniel, un botaniste suisse, est effrayé par ses pulsions suicidaires. Brisé par sa situation familiale, ne supportant plus la pression sociale, il décide de s’isoler dans la cabane de ses parents pour échapper à sa dépression.  Au même moment, complètement perdues dans les montagnes après avoir été lâchées par un passeur à la frontière Italo-Suisse, Zaineb et sa fille de huit ans essaient de joindre illégalement une ville suisse.', 
          'https://media.pathe.fr/movie/alex/HO00008540/poster/md/3/movie&uuid=6489E363-7796-457B-AFF8-8D22410100DB',
          'Pathé Amiens', 
          '2024-11-13'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Angers'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Shawn Mendes: For Friends & Family Only (A Live Concert Film)', 
          'Avec son concert filmé au théâtre historique de Bearsville à Woodstock, l’auteur compositeur musicien interprète propose un événement totalement exclusif à ses fans. Shawn Mendes : For Friends & Family Only (A Live Concert Film) offre aux fans l’occasion de découvrir son nouvel album en intégralité, juste avant sa sortie.   Tout au long du film, Shawn Mendes partage des histoires personnelles et l''inspiration derrière chaque morceau, offrant un regard intime sur son parcours créatif.', 
          'https://media.pathe.fr/movie/alex/HO00008536/poster/md/3/movie&uuid=FF0794D4-94F1-4748-85C1-F35F1A827F18',
          'Connor Brashier, Anthony Wilson', 
          '2024-11-13'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Concert'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Concert' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Concert'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Shawn Mendes'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Tejiri', 
          'Tejiri, un jeune homme en déplacement se retrouve mystérieusement détenu dans une prison hautement surveillée sans aucune nouvelle de sa famille. Tandis que l’inspecteur Prempeh et son partenaire Baako se lancent dans une course contre la montre pour découvrir le mystère qui se cache derrière sa disparition, il doit se battre pour survivre dans ce nouveau monde s’il veut être retrouvé.', 
          'https://media.pathe.fr/movie/alex/HO00008538/poster/md/3/movie&uuid=3D61E788-C7E0-4149-8D60-1F15E68DC1E0',
          'Pathé Amiens', 
          '2024-11-12'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Angers'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'O Grande Kilapy', 
          'Librement inspirée de faits réels. Joãozinho, escroc doté d’une profonde éthique de l’amitié, « bon vivant » à tout prix, est une personne simple qui réunit en lui un ensemble d’impératifs de « jouissance » indifférents aux contingences de la vie dans une colonie portugaise : couleur de peau et  préjugés sociaux. En raison des circonstances, Joãozinho finit par devenir un personnage inconfortable, subversif et politique pour le régime colonial  portugais.', 
          'https://media.pathe.fr/movie/alex/HO00008527/poster/md/3/movie&uuid=18176078-6A85-48BE-A074-0F0CE877FF03',
          'Zézé Gamboa', 
          '2024-11-06'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Historique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Historique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Historique'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'João Lagarto'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Lázaro Ramos'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pedro Hossi'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Sur un fil', 
          'Jo, une jeune femme, artiste de cirque de rue, découvre le travail des clowns professionnels de "Nez pour rire". Vite - peut-être trop vite - entrée dans l’association, elle se retrouve à l’hôpital au contact des enfants, des malades, des soignants et des familles, à qui ces clowns tentent inlassablement d’apporter de la joie et du réconfort.', 
          'https://media.pathe.fr/movie/alex/HO00007272/poster/md/42/movie&uuid=78FDDF77-696E-4E1E-840E-41210D259FEE',
          'Reda Kateb', 
          '2024-10-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Comédie dramatique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Comédie dramatique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Comédie dramatique'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Aloïse Sauvage'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Philippe Rebbot'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Sara Giraudeau'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          '4 Zéros', 
          'Depuis 3 Zéros, vingt ans ont passé… Sylvie Colonna présidente des célèbres Haricots d’Arpajon qui sont devenus des haricots extra-fins, a refait sa vie avec José Pinto. Ensemble ils tiennent un restaurant portugais à Pontault-Combault : le Churrasco. Mais depuis le covid, les affaires vont mal. Leur fils, Manu, s’improvise « scout » et cherche le nouveau Mbappé pour sortir la famille de la galère. Un jour, lors du « défi de la Lucarne », il tombe sur une pépite : Kidane, un jeune migrant comorien qui a perdu son identité et sa famille lors d’une traversée en Méditerranée. Mais d’autres scouts rôdent, déjà. Manu va-t-il réussir à le garder ? Sylvie prend l’initiative d’appeler son frère à la rescousse. Alain Colonna sort de sa retraite à Tahiti pour aider les Pinto. Mais « le football il a changé », comme dit un célèbre joueur du PSG. 4 Zéros, un coup à quatre bandes qui va permettre à Kidane d’accomplir son rêve et de trouver une famille !', 
          'https://media.pathe.fr/movie/alex/HO00007584/poster/md/29/movie&uuid=5DEE7182-653B-48F6-9518-9F900FA4BD28',
          'Fabien Onteniente', 
          '2024-10-22'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Comédie'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Comédie' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Comédie'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Gérard Lanvin'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Didier Bourdon'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Isabelle Nanty'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Le Robot Sauvage', 
          'DreamWorks Animation présente en exclusivité l’adaptation du roman illustré de Peter Brown, véritable phénomène littéraire, n°1 de la liste des meilleures ventes du New York Times : LE ROBOT SAUVAGE (The Wild Robot).  LE ROBOT SAUVAGE suit l’incroyable épopée d''un robot – l''unité ROZZUM 7134 alias “Roz” – qui après avoir fait naufrage sur une île déserte doit apprendre à s''adapter à un environnement hostile en nouant petit à petit des relations avec les animaux de l''île. Il finit par adopter le petit d’une oie, un oison, qui se retrouve orphelin.  Pour les rôles principaux on retrouve les voix de Lupita Nyong''o® (US, BLACK PANTHER 1 et 2), dans le rôle de Roz le robot, Pedro Pascal (The Last of Us, The Mandalorian) dans celui de Fink le renard, Catherine O''Hara (Schitt''s Creek, ARGYLLE) prête son talent à Pinktail l''opossum, Bill Nighy® (IL ÉTAIT TEMPS, LOVE ACTUALLY) est Longneck l''oie, Kit Connor (HEARTSTOPPER, ROCKETMAN) interprète Brightbill le petit oison orphelin et Stephanie Hsu® (EVERYTHING EVERYWHERE ALL AT ONCE, THE FALL GUY) est Vontra, un autre robot qui va perturber quelque peu la vie de Roz sur l''île.  Dans les rôles secondaires, se distingue une distribution non moins prestigieuse avec les voix de Mark Hamill, légende de la culture pop (la franchise STAR WARS, LE GARÇON ET LE HERON), Matt Berry (What We Do in the Shadows et la franchise BOB L’ÉPONGE) et Ving Rhames (MISSION : IMPOSSIBLE, PULP FICTION).  Cette histoire forte est centrée sur la découverte de soi, une observation passionnante des ponts qui relient nature et technologie tout en explorant avec sensibilité ce que cela signifie d’être au monde et connecté au vivant sous toutes ses formes.   LE ROBOT SAUVAGE est écrit et réalisé par Chris Sanders®, à qui on doit notamment la franchise DRAGON pour DreamWorks Animation, LES CROODS et LILO & STITCH pour Disney. Le film est produit par Jeff Hermann (BABY BOSS 2 pour DreamWorks Animation et coproducteur sur la franchise KUNG FU PANDA).  Le Robot Sauvage de Peter Brown, est un roman illustré pour les 7-8 ans publié pour la première fois en 2016. Le livre a depuis inspiré une trilogie qui comprend désormais The Wild Robot Escapes et The Wild Robot Protects. Peter Brown est un écrivain à succès qui collectionne les récompenses. Il a notamment reçu : le Caldecott Honor, le Horn Book Award, deux E.B. White Awards, deux E.B. White Honors, un Children''s Choice Award en qualité d’Illustrateur de l''année, deux Irma Black Honors, un Golden Kite Award et un New York Times Best Illustrated Book Award.', 
          'https://media.pathe.fr/movie/alex/HO00007217/poster/md/97/movie&uuid=A8AD4AE6-9E11-412A-B97C-7F6C7A1BCEA9',
          'Chris Sanders', 
          '2024-10-08'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Animation'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Animation' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Animation'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Aventure'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Aventure' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Aventure'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Nationalité : Etats-Unis'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'L''histoire de Souleymane', 
          'Tandis qu’il pédale dans les rues de Paris pour livrer des repas, Souleymane répète son histoire. Dans deux jours, il doit passer son entretien de demande d’asile, le sésame pour obtenir des papiers. Mais Souleymane n’est pas prêt.', 
          'https://media.pathe.fr/movie/alex/HO00007682/poster/md/48/movie&uuid=AFD49FCE-BBA7-4C88-93F0-294A24AA8C87',
          'Boris Lojkine', 
          '2024-10-08'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Abou Sangare'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Alpha Oumar Sow'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Emmanuel Yovanie'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Joker : Folie à Deux', 
          'A quelques jours de son procès pour les crimes commis sous les traits du Joker, Arthur Fleck rencontre le grand amour et se trouve entraîné dans une folie à deux...', 
          'https://media.pathe.fr/movie/alex/HO00004911/poster/md/178/movie&uuid=1153B7E8-5F50-4B65-ADE8-B76C2D73B5CA',
          'Todd Phillips', 
          '2024-10-01'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Action'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Action' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Action'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Joaquin Phoenix'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Lady Gaga'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Courts-métrages 1 Festival Africlap', 
          'Programme de courts-métrages.', 
          'https://media.pathe.fr/movie/alex/HO00005419/poster/md/3/movie&uuid=34AAF566-89B4-4912-B502-E24C3051993B',
          'Nationalité : Egypte', 
          '2023-11-09'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Courts-métrages'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Courts-métrages' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Courts-métrages'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Amiens'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Courts-métrages 2 Festival Africlap', 
          'Programme de Courts-métrages.', 
          'https://media.pathe.fr/movie/alex/HO00005420/poster/md/3/movie&uuid=AF503A44-7E4F-4C9A-96C1-77A940113F5B',
          'Nationalité : Egypte', 
          '2023-11-09'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Courts-métrages'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Courts-métrages' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Courts-métrages'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Amiens'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Courts-métrages 3 Festival Africlap', 
          'Programme de courts-métrages.', 
          'https://media.pathe.fr/movie/alex/HO00005421/poster/md/3/movie&uuid=9946C8A5-5BD4-4B35-92DD-C51BC0B62415',
          'Nationalité : Cameroun', 
          '2023-11-09'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Courts-métrages'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Courts-métrages' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Courts-métrages'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Amiens'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Alda et Maria', 
          'Lisbonne, été 1980. Deux sœurs de seize et dix-sept ans arrivent d’Angola pour fuir la guerre. Livrées à elles-mêmes, Alda et Maria vont devoir apprendre à survivre sans argent, dans une banlieue grise et polluée de cette ville étrangère. Avec la complicité d’autres Angolais, les deux adolescentes s’organisent une existence précaire. Cet exil va leur apprendre à choisir leur destin en devenant des femmes fortes et dignes…', 
          'https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg',
          'Pocas Pascoal', 
          '2015-01-13'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Ciomara Morais'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Cheila Lima'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Willion Brandão'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Twilight - Chapitre 2 : tentation', 
          '"Tu ne me reverras plus. Je ne reviendrai pas. Poursuis ta vie, ce sera comme si je n''avais jamais existé." Abandonnée par Edward, celui qu''elle aime passionnément, Bella ne s''en relève pas. Comment oublier son amour pour un vampire et revenir à une vie normale ? Pour combler son vide affectif, Bella court après le danger et prends des risques de plus en plus inconsidérés. Edward n''étant plus là pour la protéger, c''est Jacob, l''ami discret et indéfectible qui va la défendre et veiller sur elle. Mais peu à peu elle réalise l''ambigüité des sentiments qu''ils éprouvent l''un envers l''autre..."', 
          'https://media.pathe.fr/movie/alex/HO00006920/poster/md/3/movie&uuid=A8BC8B0F-B120-4BBB-90C5-B6896273FE32',
          'Chris Weitz', 
          '2009-11-17'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Fantastique'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Fantastique' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Fantastique'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Romance'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Romance' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Romance'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Science fiction'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Science fiction' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Science fiction'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Robert Pattinson'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Taylor Lautner'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Kristen Stewart'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          '(500) JOURS ENSEMBLE', 
          'Tom croit encore en un amour qui transfigure, un amour à la destinée cosmique, un coup de foudre unique. Ce qui n''est pas du tout le cas de Summer. Cela n''empêche pourtant pas Tom de partir à sa conquête, armé de toute sa force et de tout son courage, tel un Don Quichotte des temps modernes. La foudre tombe le premier jour, quand Tom rencontre Summer la nouvelle secrétaire de son patron, une belle jeune fille enjouée.  Au 31ème jour, les choses avancent, lentement. Le 32ème jour, Tom est irrémédiablement conquis, pris dans le tourbillon étourdissant d''une vie avec Summer. 185 jours après leur rencontre, la situation est de plus en plus incertaine – mais pas sans espoir. Alors que l''histoire fait des allers-retours au sein de la relation parfois heureuse, mais souvent tumultueuse de Tom et Summer, le récit couvre tout le spectre de la relation amoureuse, du premier coup de coeur aux rendez-vous, du sexe à la séparation, à la récrimination et à la rédemption et décrit toutes les raisons qui nous poussent à nous battre aussi ardemment pour arriver à trouver un sens à l''amour... Et, avec un peu de chance, à en faire une réalité.', 
          'https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg',
          'Marc Webb', 
          '2009-09-29'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Comédie'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Comédie' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Comédie'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Drame'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drame' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Drame'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Romance'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Romance' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Romance'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Geoffrey Arend'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Zooey Deschanel'
          );
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Joseph Gordon-Levitt'
          );
        
        INSERT INTO movie (movie_name, movie_description, movie_image, movie_producer, release_date) 
        VALUES (
          'Séance cinémathèque - En quatrième vitesse', 
          'Le détective privé Mike Hammer enquête sur la mort d''une jeune femme qu''il a connue furtivement. Ses investigations le mènent vers des enjeux qui le dépassent.', 
          'https://media.pathe.fr/movie/alex/HO00008403/poster/md/3/movie&uuid=BE9B9514-BE73-4121-AFC1-44D568D8F0F8',
          'Pathé Amiens', 
          '1955-09-06'
        );

        -- Get the last inserted movie_id
        SET @movie_id = LAST_INSERT_ID();
      
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Policier'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Policier' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Policier'
          LIMIT 1;
        
          -- Insert genre only if it doesn't exist
          INSERT INTO genre (genre_name)
          SELECT 'Thriller'
          WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Thriller' );

          -- Link the movie and the genre
          INSERT INTO movie_genre (movie_id, genre_id)
          SELECT @movie_id, genre_id
          FROM genre
          WHERE genre_name = 'Thriller'
          LIMIT 1;
        
          INSERT INTO cast (movie_id, cast_name) 
          VALUES (
            @movie_id,
            'Pathé Angers'
          );
        COMMIT;