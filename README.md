# Full Clima App

![Full Clima App](./app/assets/images/brand.svg)

## Description

The Air Conditioning Control Hub (Full Clima App) is a sophisticated Ruby-based application designed to streamline and optimize the management of air conditioning units in various environments. This application utilizes SCSS with the BEM methodology to enhance scalability and code style readability. It also integrates PostgreSQL as its database to manage equipment and maintenance tables. Additionally, it features user authentication to access critical information.

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
