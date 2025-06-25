-- CUSTOMERS TABLE
-- CREATE
INSERT INTO Customers (name, phone, email)
VALUES ('Ravi Kumar', '9876543211', 'ravi@example.com');

-- READ
SELECT * FROM Customers;

-- UPDATE
UPDATE Customers SET phone = '9870001111' WHERE customer_id = 1;

-- DELETE
DELETE FROM Customers WHERE customer_id = 5;


-- VEHICLES TABLE
-- CREATE
INSERT INTO Vehicles (make, model, year, registration_number, status, branch_id)
VALUES ('Suzuki', 'Dzire', 2021, 'TN10JK8888', 'available', 1);

-- READ
SELECT * FROM Vehicles;

-- UPDATE
UPDATE Vehicles SET status = 'booked' WHERE vehicle_id = 2;

-- DELETE
DELETE FROM Vehicles WHERE vehicle_id = 5;


-- BOOKINGS TABLE
-- CREATE 
INSERT INTO Bookings (customer_id, vehicle_id, booking_date, start_date, end_date, status, total_cost, promo_code)
VALUES (2, 1, CURDATE(), '2025-06-14', '2025-06-15', 'active', 1500.00, NULL);

-- READ
SELECT * FROM Bookings;

-- UPDATE
UPDATE Bookings SET status = 'completed' WHERE booking_id = 1;

-- DELETE
DELETE FROM Bookings WHERE booking_id = 4;


-- PAYMENTS TABLE
-- CREATE
INSERT INTO Payments (booking_id, amount, payment_method, payment_date, payment_status)
VALUES (1, 1500.00, 'upi', CURDATE(), 'paid');

-- READ
SELECT * FROM Payments;

-- UPDATE
UPDATE Payments SET payment_status = 'paid' WHERE payment_id = 2;

-- DELETE
DELETE FROM Payments WHERE payment_id = 5;


-- DAMAGES TABLE
-- CREATE
INSERT INTO Damages (vehicle_id, type, severity, date_reported, resolution_status)
VALUES (2, 'Broken Mirror', 'low', CURDATE(), 'pending');

-- READ
SELECT * FROM Damages;

-- UPDATE
UPDATE Damages SET resolution_status = 'resolved' WHERE damage_id = 1;

-- DELETE
DELETE FROM Damages WHERE damage_id = 2;


-- PROMOTIONS TABLE
-- CREATE
INSERT INTO Promotions (code, discount_percent, valid_from, valid_to)
VALUES ('SUMMER25', 25.00, '2025-06-01', '2025-06-30');

-- READ
SELECT * FROM Promotions;

-- UPDATE
UPDATE Promotions SET discount_percent = 30.00 WHERE code = 'SUMMER25';

-- DELETE
DELETE FROM Promotions WHERE code = 'REFERRAL15';


-- MAINTENANCE TABLE
-- CREATE
INSERT INTO Maintenance (vehicle_id, maintenance_date, details, status)
VALUES (4, '2025-06-20', 'Oil change and brake inspection', 'scheduled');

-- READ
SELECT * FROM Maintenance;

-- UPDATE
UPDATE Maintenance SET status = 'completed' WHERE maintenance_id = 1;

-- DELETE
DELETE FROM Maintenance WHERE maintenance_id = 3;


-- BONUS FEATURES

-- Check Vehicle Availability
SELECT * FROM Vehicles
WHERE vehicle_id NOT IN (
  SELECT vehicle_id FROM Bookings
  WHERE status = 'active'
    AND (
      (start_date <= '2025-06-15' AND end_date >= '2025-06-13')
    )
)
AND status = 'available';

-- Top 3 Rental Vehicles
SELECT v.make, v.model, COUNT(*) AS rental_count
FROM Bookings b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY b.vehicle_id
ORDER BY rental_count DESC
LIMIT 3;

-- Top Customer (based on totla spending)
SELECT c.name, SUM(b.total_cost) AS total_spent
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;

-- Discount based on promo code
SELECT 
  b.booking_id,
  b.total_cost,
  p.discount_percent,
  (b.total_cost * (1 - p.discount_percent / 100)) AS discounted_total
FROM Bookings b
JOIN Promotions p ON b.promo_code = p.code
WHERE b.booking_id = 1;

-- Booking History of Customer
SELECT b.*, v.make, v.model
FROM Bookings b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
WHERE b.customer_id = 1;

-- Booking History of a Vehicle
SELECT b.*, c.name
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
WHERE b.vehicle_id = 2;

-- Total Revenue based on Vehicle types
SELECT v.make, v.model, SUM(b.total_cost) AS total_earned
FROM Bookings b
JOIN Vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.make, v.model;

-- Upcoming maintenances
SELECT v.make, v.model, m.maintenance_date, m.details
FROM Maintenance m
JOIN Vehicles v ON m.vehicle_id = v.vehicle_id
WHERE m.maintenance_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- Monthly Revenue Report
SELECT DATE_FORMAT(booking_date, '%Y-%m') AS month, SUM(total_cost) AS revenue
FROM Bookings
GROUP BY month
ORDER BY month;
