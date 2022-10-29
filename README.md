# Seven_Diner
## Description
This project is a web application for a made-up restaurant, built using Express.js. There are some features, such as food ordering for customers. Managers and restaurant staff can also do administrative tasks, related to the database. This project is created as part of the CSIT314 course project, in which the Entity-Control-Boundary pattern is a requirement.

### Framework/Library/Database used
- Express.js
- Bootstrap
- MySQL
- EJS

## Demo Video
### Customer


https://user-images.githubusercontent.com/103481357/198850057-07aff000-96d6-4c97-bf80-324841b9bc36.mp4






## User Stories (Simplified)
- As a customer, I want to be able to view the menu, so that I can decide on what menu items to order.
- As a customer, I want to be able to search for specific menu items, so that it will be easier to go through the menu.
- As a customer, I want to be able to delete menu items from my orders, so that I am able to remove unwanted menu items.
- As a customer, I want to be able to make payments from the table, so that I don’t have to queue when making payments at the counter.
- As a user admin/manager/restaurant staff/owner, I want to be able to log in, so that I can access the system.
- As a user admin/manager/restaurant staff/owner, I want to be able to do administrative tasks, so that I can do my job.

For the complete user stories, please visit https://docs.google.com/document/d/14htHyR5VwiHWDEAi2_B0nxJ1Qch23-FwmMMoxKg--Us/edit?usp=sharing.

## Wireframes
### Customer
Landing Page <br />
<img src="https://user-images.githubusercontent.com/103481357/197341862-089cf18c-3c42-42f6-afc0-c8c2efae4f80.png" width="600" />

Make an Order Page <br />
<img src="https://user-images.githubusercontent.com/103481357/197342227-92bc20d1-7536-48e6-bc22-09e1fa142b2f.png" width="600" />

### User Admin/Manager/Restaurant Staff/Owner
Login Page (All) <br />
<img src="https://user-images.githubusercontent.com/103481357/197342563-6ba06c28-2bc4-40da-8eac-d7309f76009a.png" width="600" />

Landing Page (For User Admin) <br />
<img src="https://user-images.githubusercontent.com/103481357/197342624-1a72c548-f6d2-469f-b4a6-c4462b29a8d8.png" width="600" />

Update Menu Item Page (For Manager) <br />
<img src="https://user-images.githubusercontent.com/103481357/197342951-b57a3ec2-61b3-4fb7-849e-fd7ca0aea478.png" width="600" />

Average Spending Page (For Owner) <br />
<img src="https://user-images.githubusercontent.com/103481357/197342789-4d349c09-543a-4a93-9e28-858b13da2075.png" width="600" />

## Program Flow
The Entity-Control-Boundary pattern is used here. So, the Boundary (EJS) usually has a form that does a POST or a GET request to a route (e.g. /Login). This time, I will explain tasks related to POST requests, which are used to send data to the Controller. The index.js file contains all routes, and each of them calls a function inside a Controller (Express.js). The Controller receives the data sent through the POST request through the use of req.body. Then, the Controller sends the data to the Entity (Express.js and MySQL), where it executes database-related tasks (MySQL). Finally, the Entity passes data inside the callback function's parameter and executes the callback function, which is located in the Controller to do a task, usually to display a new page while passing data to the EJS.

Please refer to the Sequence Diagram for user login below for an illustration of the Entity-Control-Boundary pattern. 
<img src="https://user-images.githubusercontent.com/103481357/197354026-73661975-79f9-41e7-a313-59f7e35be98d.png" width="600" />

## Getting Started
- You need to have Git Bash installed in your system
- You need to have node.js installed in your system
- You need to have XAMPP installed in your system

### Cloning the Repository
- Open Git Bash
- Using the cd command, navigate to the directory you want the repository to be cloned on
- Type git clone "https<nolink>://github.com/oswaldoosw/Seven_Diner.git"

### Setting up the Database
- Open XAMPP Control Panel
- Press the Start button for Apache and MySQL Module
- Press the Admin button for MySQL or go to "http<nolink>://localhost/phpmyadmin/"
- Create a new database called "restaurantapp"
- Import the restaurantapp.sql file, which is located inside the database folder (Seven_Diner/database/restaurantapp.sql) to the database "restaurantapp"

### Running the Application
- Open Terminal
- Using the cd command, navigate to the Seven_Diner folder (e.g. cd Desktop/Seven_Diner)
- Type node index.js
- Open your browser and go to "http<nolink>://localhost:3000/"
- The landing page will be shown

### Login Details
User Admin <br/>
Username: useradmin1 <br/>
Password: useradmin123

Manager <br/>
Username: manager1 <br/>
Password: manager123

Staff <br/>
Username: staff1 <br/>
Password: staff123

Restaurant Owner <br/>
Username: owner1 <br/>
Password: owner123

## References
  - <a href="https://getbootstrap.com/docs/4.3/getting-started/download/">Bootstrap v4.3.1</a>
  - <a href="https://expressjs.com/en/guide/routing.html">Express.js Routing Guide</a>
  - CSIT314 lecturers and tutors for helping with the project
  
