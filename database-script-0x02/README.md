# Airbnb Database Schema

## Directory: `database-script-0x01`

This directory contains the SQL schema for the ALX Airbnb database system. The schema is designed following best normalization practices up to Third Normal Form (3NF) to ensure data consistency, integrity, and performance.

### 📄 Files

- `schema.sql`: SQL script that defines all database tables, constraints, and indexes.
- `README.md`: Documentation describing the purpose and structure of the schema.

### 📦 Tables Defined

- **User**: Stores user information (guests, hosts, admins).
- **Property**: Listings created by hosts.
- **Booking**: Booking records linking users and properties.
- **Payment**: Records payments for bookings.
- **Review**: User-generated property reviews.
- **Message**: Messages exchanged between users.

### 🔐 Constraints

- Primary keys on all tables.
- Foreign keys for all relevant relationships.
- Unique constraint on email.
- ENUM types for roles, statuses, and payment methods.
- Indexes on frequently queried columns for optimization.