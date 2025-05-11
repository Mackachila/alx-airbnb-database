-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('uuid-1', 'Alice', 'Johnson', 'alice.johnson@gmail.com', 'hashed_pw_1', '1234567890', 'guest'),
('uuid-2', 'Bob', 'Smith', 'bobsmith@outlook.com', 'hashed_pw_2', '2345678901', 'host'),
('uuid-3', 'Charlie', 'Brown', 'charlie.brown@yahoo.com', 'hashed_pw_3', '3456789012', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('prop-1', 'uuid-2', 'Cozy Cabin', 'A small cozy cabin in the woods', 'Nairobi, Kenya', 75.00),
('prop-2', 'uuid-2', 'Beach House', 'Ocean view beach house', 'Mombasa, Kenya', 150.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-1', 'prop-1', 'uuid-1', '2025-06-01', '2025-06-05', 300.00, 'confirmed'),
('book-2', 'prop-2', 'uuid-1', '2025-07-10', '2025-07-15', 750.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay-1', 'book-1', 300.00, 'credit_card'),
('pay-2', 'book-2', 750.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('rev-1', 'prop-1', 'uuid-1', 5, 'Amazing stay! Will return.'),
('rev-2', 'prop-2', 'uuid-1', 4, 'Beautiful views but a bit noisy.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-1', 'uuid-1', 'uuid-2', 'Hi, is the cabin available for Christmas?'),
('msg-2', 'uuid-2', 'uuid-1', 'Yes, it’s available. I’ll send the booking link shortly.');