# super-coupon-pocket

A web application that users can keep track of all coupons they have received easily so they will never miss free stuff or discounts from their favorite merchants.

## Technologies Used

- React.js
- Node.js
- Express
- PostgreSQL
- Bootstrap 4
- AWS EC2

## Live Demo

Try this application live at https://scp.elvislee.com

## Features

- Users can sign up new account and login
- Users can view a list of all coupons
- Users can search coupon by key word, view selected categories and sort by created or expiration date
- Users can add new coupons with merchant, discount, category and expiration date
- Users can edit coupons they own
- Users can mark coupons as used
- Users can delete coupons

## Preview

### Register new user

![register](preview/register.gif)

### Add coupon

![add-coupon](preview/add-coupon.gif)

### Edit coupon

![edit-coupon](preview/edit-coupon.gif)

### Delete coupon

![delete-coupon](preview/delete-coupon.gif)

## Development

### System Requirements

- Node.js 10 or higher
- React.js 16 or higher
- NPM 6 or higher

### Getting Started

1. Clone the repository.

```
git clone https://github.com/ElvisLee0725/super-coupon-pocket.git
```

2. Install all dependencies with NPM.

```
npm install
```

3. Create a .env file

```
PORT=3001
DEV_SERVER_PORT=3000
DATABASE_URL=   // Your PostgreSQL localhost url
JWTSECRET=      // Use any value
```

4. Import the example database to PostgreSQL

```
npm run db:import
```

5. Start the project. Once started you can view the application by opening http://localhost:3000 in your browser.

```
npm run dev
```
