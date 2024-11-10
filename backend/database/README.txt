## Database Setup Instructions

To set up the database:

1. Download or clone the project to your local machine.
2. Open **phpMyAdmin** (typically at `http://localhost/phpmyadmin/` if using XAMPP or WAMP).
3. In phpMyAdmin, create a new database (e.g., `your_database_name`).
4. After creating the database, select it from the left panel.
5. Go to the **Import** tab at the top of the phpMyAdmin page.
6. Under **File to Import**, click **Browse** and select the `your_database_name.sql` file that was included in the project.
7. Click **Go** to import the database.
8. Update your connection settings in your PHP project to match the database name, username, and password.

This will create all the tables and insert the necessary data.
