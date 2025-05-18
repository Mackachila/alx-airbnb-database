-- Drop the original Booking table (backup first in real apps)
DROP TABLE IF EXISTS Booking;

-- Create partitioned Booking table
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36),
    user_id CHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Performance test query
EXPLAIN SELECT * FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';


SELECT * FROM Booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';
