INSERT INTO Branches (branch_id, branch_name, location) VALUES
(1, 'Central Branch', 'Anna Salai, Chennai'),
(2, 'Airport Branch', 'Meenambakkam, Chennai'),
(3, 'South Zone Outlet', 'Tambaram, Chennai'),
(4, 'Tech Park Branch', 'Tidel Park, Chennai'),
(5, 'East Coast Garage', 'ECR, Chennai');

INSERT INTO Customers (customer_id, name, phone, email) VALUES
(1, 'Alice Johnson', '9876543210', 'alice@example.com'),
(2, 'Bob Smith', '9123456789', 'bob@example.com'),
(3, 'Charlie Kumar', '9988776655', 'charlie@example.com'),
(4, 'Divya Patel', '9871234560', 'divya@example.com'),
(5, 'Elan Raj', '9871112233', 'elan@example.com');

INSERT INTO Vehicles (vehicle_id, make, model, year, registration_number, status, branch_id) VALUES
(1, 'Toyota', 'Camry', 2021, 'TN01AB1234', 'available', 1),
(2, 'Honda', 'Activa 6G', 2022, 'TN02BC2345', 'available', 2),
(3, 'Hyundai', 'Creta', 2020, 'TN03CD3456', 'booked', 3),
(4, 'Royal Enfield', 'Classic 350', 2019, 'TN04EF4567', 'under_maintenance', 4),
(5, 'Kia', 'Seltos', 2022, 'TN05GH5678', 'available', 5);

INSERT INTO Pricing (pricing_id, vehicle_type, rate_type, rate_amount) VALUES
(1, 'Car', 'daily', 1500.00),
(2, 'Car', 'hourly', 200.00),
(3, 'Bike', 'daily', 500.00),
(4, 'Bike', 'hourly', 75.00),
(5, 'SUV', 'daily', 1800.00);

INSERT INTO Bookings (booking_id, customer_id, vehicle_id, booking_date, start_date, end_date, status, total_cost) VALUES
(1, 1, 1, '2025-06-10', '2025-06-11', '2025-06-13', 'active', 3000.00),
(2, 2, 2, '2025-06-08', '2025-06-09', '2025-06-10', 'completed', 500.00),
(3, 3, 3, '2025-06-05', '2025-06-06', '2025-06-09', 'completed', 5400.00),
(4, 4, 5, '2025-06-11', '2025-06-12', '2025-06-15', 'cancelled', 0.00),
(5, 5, 1, '2025-06-13', '2025-06-14', '2025-06-15', 'active', 1500.00);

INSERT INTO Payments (payment_id, booking_id, amount, payment_method, payment_date, payment_status) VALUES
(1, 1, 3000.00, 'card', '2025-06-10', 'paid'),
(2, 2, 500.00, 'upi', '2025-06-08', 'paid'),
(3, 3, 5400.00, 'cash', '2025-06-05', 'paid'),
(4, 4, 0.00, 'card', '2025-06-11', 'failed'),  -- fixed this line
(5, 5, 1500.00, 'upi', '2025-06-13', 'pending');

INSERT INTO Damages (damage_id, vehicle_id, type, severity, date_reported, resolution_status) VALUES
(1, 3, 'Scratched Bumper', 'medium', '2025-06-01', 'pending'),
(2, 2, 'Broken Headlight', 'high', '2025-05-28', 'resolved'),
(3, 4, 'Worn Tires', 'low', '2025-06-05', 'pending'),
(4, 5, 'Dented Door', 'medium', '2025-06-03', 'resolved'),
(5, 1, 'Cracked Windshield', 'high', '2025-06-07', 'pending');

INSERT INTO Promotions (promo_id, code, discount_percent, valid_from, valid_to) VALUES
(1, 'SUMMER25', 25.00, '2025-06-01', '2025-06-30'),
(2, 'WEEKEND10', 10.00, '2025-06-14', '2025-06-16'),
(3, 'FIRSTBOOKING50', 50.00, '2025-01-01', '2025-12-31'),
(4, 'LOYALTY20', 20.00, '2025-05-01', '2025-12-31'),
(5, 'REFERRAL15', 15.00, '2025-06-10', '2025-07-10');

INSERT INTO Maintenance (maintenance_id, vehicle_id, maintenance_date, details, status) VALUES
(1, 4, '2025-06-20', 'Oil change and brake inspection', 'scheduled'),
(2, 3, '2025-06-18', 'AC Repair and Wheel Balancing', 'scheduled'),
(3, 1, '2025-06-15', 'Battery check and service', 'completed'),
(4, 2, '2025-06-17', 'Tyre Replacement', 'scheduled'),
(5, 5, '2025-06-19', 'Clutch service', 'scheduled');
