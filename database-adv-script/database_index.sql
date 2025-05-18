
CREATE INDEX idx_user_email ON User(email);

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_host_id ON Property(host_id);

EXPLAIN SELECT * FROM Booking WHERE user_id = 'uuid-1';

EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'uuid-1';

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
