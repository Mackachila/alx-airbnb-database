# Database Requirements - Airbnb System

## Entity Relationship Diagram

![ERD](erd.png)

---

## Entities and Attributes

### 1. **User**
- `user_id` (CHAR(36), Primary Key)
- `first_name` (VARCHAR(255), NOT NULL)
- `last_name` (VARCHAR(255), NOT NULL)
- `email` (VARCHAR(255), UNIQUE, NOT NULL)
- `password_hash` (VARCHAR(255), NOT NULL)
- `phone_number` (VARCHAR(20))
- `role` (ENUM: guest, host, admin)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### 2. **Property**
- `property_id` (CHAR(36), Primary Key)
- `host_id` (CHAR(36), Foreign Key → User.user_id)
- `name` (VARCHAR(255), NOT NULL)
- `description` (TEXT)
- `location` (VARCHAR(255))
- `pricepernight` (DECIMAL(10, 2))
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

---

### 3. **Booking**
- `booking_id` (CHAR(36), Primary Key)
- `property_id` (CHAR(36), Foreign Key → Property.property_id)
- `user_id` (CHAR(36), Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL(10, 2), NOT NULL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP)

---

### 4. **Payment**
- `payment_id` (CHAR(36), Primary Key)
- `booking_id` (CHAR(36), Foreign Key → Booking.booking_id)
- `amount` (DECIMAL(10, 2))
- `payment_date` (TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

---

### 5. **Review**
- `review_id` (CHAR(36), Primary Key)
- `property_id` (CHAR(36), Foreign Key → Property.property_id)
- `user_id` (CHAR(36), Foreign Key → User.user_id)
- `rating` (INT, 1–5)
- `comment` (TEXT)
- `created_at` (TIMESTAMP)

---

### 6. **Message**
- `message_id` (CHAR(36), Primary Key)
- `sender_id` (CHAR(36), Foreign Key → User.user_id)
- `recipient_id` (CHAR(36), Foreign Key → User.user_id)
- `message_body` (TEXT)
- `sent_at` (TIMESTAMP)

---

## Relationships

- **User → Property**: One-to-Many  
  A host (User) can have multiple Properties.

- **User → Booking**: One-to-Many  
  A User can make multiple Bookings.

- **Property → Booking**: One-to-Many  
  A Property can be booked multiple times.

- **Booking → Payment**: One-to-One  
  A Booking has one Payment.

- **User ↔ Review ↔ Property**: Many-to-Many  
  A User can leave many Reviews for different Properties.

- **User ↔ Message (Self-referencing)**:  
  Users can send Messages to other Users.

---

## Notes
- All `CHAR(36)` IDs are assumed to be UUIDs.
- Timestamps are assumed to auto-generate using `DEFAULT CURRENT_TIMESTAMP`.
- Enum values for `role`, `status`, and `payment_method` should be validated on both client and server sides.
