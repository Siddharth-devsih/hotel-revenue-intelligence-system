-- ==========================================
-- QUERY 1
-- BOOKING SEQUENCE ANALYSIS
-- ==========================================

WITH booking_sequence AS (
    SELECT
        customer_id,
        total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY checkin_date
        ) AS booking_number
    FROM Bookings
    WHERE booking_status = 'Completed'
)

SELECT
    CASE
        WHEN booking_number = 1 THEN 'First Booking'
        WHEN booking_number = 2 THEN 'Second Booking'
        ELSE 'Third or Later'
    END AS sequence_label,

    AVG(total_amount) AS avg_total_amount,
    COUNT(*) AS n

FROM booking_sequence

GROUP BY
    CASE
        WHEN booking_number = 1 THEN 'First Booking'
        WHEN booking_number = 2 THEN 'Second Booking'
        ELSE 'Third or Later'
    END;

-- Corporate Portal ratings are normalized by dividing by 2
-- to account for different rating scales.

-- ==========================================
-- QUERY 2
-- TOP 5 PROPERTIES BY NORMALIZED RATING
-- ==========================================

SELECT TOP 5
    property_name,
    property_city,

    COUNT(review_rating) AS num_reviews,

    AVG(
        CASE
            WHEN customer_segment = 'Corporate'
                THEN review_rating / 2.0
            ELSE review_rating
        END
    ) AS normalized_avg_rating

FROM Bookings

WHERE review_rating IS NOT NULL

GROUP BY
    property_name,
    property_city

HAVING COUNT(review_rating) >= 20

ORDER BY normalized_avg_rating DESC;