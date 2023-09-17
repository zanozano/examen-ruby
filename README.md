# Air Conditioning Control Hub (Full Clima App)

![Full Clima App](./app/assets/images/brand.svg)

## Description

The Air Conditioning Control Hub, also known as the Full Clima App, is a robust Ruby-based application designed to revolutionize the management of air conditioning units across various settings. This application leverages SCSS with the BEM methodology to improve scalability and enhance the readability of the style code. It seamlessly integrates PostgreSQL as its database to efficiently oversee equipment and maintenance records. Moreover, it offers a comprehensive user authentication system to ensure secure access to crucial information.

## Key Features and Gems

### Key Features

- **Inventory Management**: The application serves as an MVP (Minimum Viable Product) for a company specializing in air conditioning inventory control. It empowers personnel to effortlessly track the stock of air conditioning units and identify those in need of repair.

- **User Roles**: The Air Conditioning Control Hub incorporates role-based access control, distinguishing between administrators, technicians, and regular users. Each role has access to specific views and functionalities tailored to their responsibilities.

### Gems Utilized

- **Bootstrap**: The application benefits from the Bootstrap gem to create a user-friendly and responsive interface, ensuring a seamless user experience.

- **jQuery-Rails**: jQuery-Rails aids in handling dynamic aspects of the application, making it more interactive and efficient.

- **Devise**: Devise is utilized for user authentication, providing a secure login system with customizable permissions and access levels.

- **Faker**: Faker simplifies the generation of fake data for testing and development purposes, facilitating the creation of realistic equipment and maintenance records.

- **Will Paginate**: Will Paginate is employed to implement pagination for extensive lists of equipment and maintenance records, enhancing the application's usability.

- **CarrierWave**: CarrierWave is used for handling file uploads, particularly for attaching images or documents to equipment profiles.

The Air Conditioning Control Hub represents a crucial tool for air conditioning inventory management, catering to the unique needs of administrators, technicians, and general users. Its feature-rich interface and robust database integration ensure efficient tracking and maintenance of air conditioning units, contributing to enhanced operational efficiency.

Feel free to explore the application and experience its capabilities firsthand.

## Table of Contents

- [Usage](#usage)
- [Contributions](#contributions)
- [Author](#author)
- [Repository](#repository)
- [Live Example](#live-example)

## Usage

### Prerequisites

Ensure you have the following tools installed on your system:

- Ruby: The application is built using Ruby.
- PostgreSQL: PostgreSQL is used as the database for equipment and maintenance data.
- Node.js: Required for managing SCSS files.

### Clone the Repository

Clone this repository using Git. Open your terminal and run the following command:

```bash
git clone https://github.com/zanozano/fullclima-app.git
```

### Install Dependencies

Once you have cloned the repository, navigate to the project folder and install the Ruby gems and Node.js packages:

```bash
cd fullclima-app
bundle install
npm install
```

### Compile SCSS to CSS

To compile SCSS to CSS in real-time, use the provided script:

```bash
npm run scss
```

This script watches for changes in the SCSS files located in `public/assets/scss/style.scss` and compiles them into CSS files located in `public/assets/css/style.css`.

### Start the Application

To run the application, use the provided start script:

```bash
npm start
```

This script can compile SCSS to CSS in real-time while you work on the project.

## Contributions

We welcome contributions to the Air Conditioning Control Hub project. To get involved, follow our guidelines for reporting issues, requesting features, or submitting pull requests in the GitHub repository.

## Author

Author: Cristobal Manzano

## Repository

- Type: Git
- URL: [github.com/zanozano/fullclima-app](https://github.com/zanozano/fullclima-app.git)

## Live Example

See the Air Conditioning Control Hub in action by visiting the following hosted link:

[Full Clima App](https://iguana-fd59e.firebaseapp.com/)
