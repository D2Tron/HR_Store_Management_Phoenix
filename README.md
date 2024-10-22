# HR and Store Management System

This project is a full-stack web application developed using the Phoenix framework (Elixir) with a PostgreSQL database. It manages employees, stores, and products across two interconnected servers.

## Features

- **Port 3000**: Manage employees (CRUD operations) with details such as employee ID, name, hire date, and department.
- **Port 4000**: Manage stores and products with CRUD operations. Employee data is read-only but shared across both servers.
- **CSS Framework**: Tailwind CSS is used for styling the UI.

## Running the Project

To run both servers simultaneously, follow these steps:

1. Navigate to each project folder separately.
2. In one terminal, start the first server (employees management) using:
   ```bash
   mix phx.server
   This will run on `localhost:3000`.

3. In another terminal, start the second server (stores and products management) using:
   ```bash
   mix phx.server
   This will run on `localhost:4000`.

Both servers are interconnected, with one allowing full CRUD operations on employees, and the other using employees in a read-only format while managing stores and products.
