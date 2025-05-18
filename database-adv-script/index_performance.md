High-Usage Columns for Indexing
User Table:
email: Frequently used in WHERE, login filters.

user_id: Used in joins (already has a primary key index).

CREATE INDEX idx_user_email ON User(email);

Booking Table:
user_id, property_id: Frequently used in joins.

status: Likely used in filters (WHERE status = 'confirmed').

created_at: Often used for sorting or filtering by date.

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);


Property Table:
location: Often used in filters.

pricepernight: Used in range filters or sorting.

host_id: Used in joins.

CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_host_id ON Property(host_id);
Measuring Performance with EXPLAIN or ANALYZE
Example before and after index on Booking(user_id):

EXPLAIN SELECT * FROM Booking WHERE user_id = 'uuid-1';
Interpretation:
Before adding an index: Full table scan (rows = total).

After adding index: Index lookup (rows = 1 or few, faster access).

You can run:
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'uuid-1';
To get actual time and cost improvements.

Summary of database_index.sql

-- Indexes on User table
CREATE INDEX idx_user_email ON User(email);

-- Indexes on Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Indexes on Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_host_id ON Property(host_id);
