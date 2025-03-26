Updated Features
User:

View personal profile information.

View educational qualifications (school, college).

View work experience, certifications, and achievements (but cannot edit them).

Admin:

Manage all details of the portfolio (profile, work experience, certifications, school/college).

Admin manages everything (work experience, certifications, educational qualifications, profile) for the user.

Technologies Used
Backend: Java (JSP/Servlets)

Frontend: HTML, CSS, JavaScript

Database: MySQL

IDE: NetBeans 8.0.1

Project Setup and Instructions
Prerequisites
Java: Install JDK 8 or higher.

MySQL: Install MySQL server.

NetBeans: Download and install NetBeans 8.0.1.

Installation
Clone the repository:

bash
Copy
git clone https://github.com/yourusername/portfolio-system.git
cd portfolio-system
Import the project into NetBeans:

Open NetBeans 8.0.1.

Choose File > Open Project and select the project directory.

Configure MySQL Database:

Create a MySQL database for the portfolio system.

Set up the necessary tables using the provided SQL scripts.

Configure Database Connection:

Update the db.properties file with your MySQL credentials (database name, username, password).

Example:

properties
Copy
db.url=jdbc:mysql://localhost:3306/portfolio_system
db.username=root
db.password=yourpassword
Run the Project:

In NetBeans, right-click on the project and select Run.

The server should start, and you can access the application at http://localhost:8080/portfolio-system.

