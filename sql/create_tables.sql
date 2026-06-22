-- ==========================================
-- CUSTOMERS TABLE
-- ==========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_signup_date DATE NOT NULL,
    customer_segment VARCHAR(50) NOT NULL,
    customer_loyalty_tier VARCHAR(20),
    customer_home_city VARCHAR(100),
);

-- ==========================================
-- PROPERTIES TABLE
-- ==========================================
CREATE TABLE Properties (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(150) NOT NULL,
    property_city VARCHAR(100) NOT NULL,
    property_type VARCHAR(50) NOT NULL,
    property_star_rating INT,
    property_total_rooms INT,

    UNIQUE(property_name, property_city)
);

-- ==========================================
-- BOOKINGS TABLE
-- ==========================================

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    property_id INT NOT NULL,

   booking_date DATE NOT NULL,
checkin_date DATE NOT NULL,
checkout_date DATE NOT NULL,

CHECK (checkout_date > checkin_date),

room_count INT NOT NULL CHECK(room_count > 0),

    booking_channel VARCHAR(50),
    booking_status VARCHAR(20),

    total_amount DECIMAL(12,2) NOT NULL CHECK(total_amount >= 0),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    FOREIGN KEY (property_id)
        REFERENCES Properties(property_id)
);

-- ==========================================
-- REVIEWS TABLE
-- ==========================================

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE,

    review_rating DECIMAL(4,2)
        CHECK (review_rating BETWEEN 1 AND 5),

    review_text TEXT,

    FOREIGN KEY (booking_id)
        REFERENCES Bookings(booking_id)
);
-- ==========================================
-- INDEXES
-- ==========================================

CREATE INDEX idx_booking_customer
ON Bookings(customer_id);

CREATE INDEX idx_booking_property
ON Bookings(property_id);

CREATE INDEX idx_booking_date
ON Bookings(booking_date);

CREATE INDEX idx_review_rating
ON Reviews(review_rating);