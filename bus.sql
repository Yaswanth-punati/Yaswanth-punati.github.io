-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 09:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `User_id` varchar(20) NOT NULL,
  `Booking_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`User_id`, `Booking_Id`) VALUES
('U001', 'B001'),
('U002', 'B002'),
('U003', 'B003'),
('U004', 'B004'),
('U005', 'B005'),
('U006', 'B006'),
('U007', 'B007'),
('U008', 'B008'),
('U009', 'B009'),
('U010', 'B010');

-- --------------------------------------------------------

--
-- Table structure for table `bus_info`
--

CREATE TABLE `bus_info` (
  `Seat_Number` varchar(20) NOT NULL,
  `ArrivalTime` varchar(20) NOT NULL,
  `Destination` char(20) NOT NULL,
  `Source` char(20) NOT NULL,
  `Bus_Number` varchar(20) NOT NULL,
  `Departure_date` date NOT NULL,
  `Departure_Time` varchar(20) NOT NULL,
  `Departure_Location` char(20) NOT NULL,
  `Total_Seats` int(11) NOT NULL,
  `Available_seats` int(11) NOT NULL,
  `User_id` varchar(20) NOT NULL,
  `Route_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_info`
--

INSERT INTO `bus_info` (`Seat_Number`, `ArrivalTime`, `Destination`, `Source`, `Bus_Number`, `Departure_date`, `Departure_Time`, `Departure_Location`, `Total_Seats`, `Available_seats`, `User_id`, `Route_Id`) VALUES
('Seat001', '2:00 PM', 'Springfield', 'Chicago', 'Bus001', '2024-04-19', '10:00 AM', 'Location A', 50, 45, 'U001', 'R001'),
('Seat002', '3:00 PM', 'Peoria', 'Springfield', 'Bus002', '2024-04-20', '11:00 AM', 'Location B', 50, 48, 'U002', 'R002'),
('Seat003', '4:00 PM', 'Rockford', 'Peoria', 'Bus003', '2024-04-21', '12:00 PM', 'Location C', 50, 50, 'U003', 'R003'),
('Seat004', '5:00 PM', 'Champaign', 'Rockford', 'Bus004', '2024-04-22', '01:00 PM', 'Location D', 50, 49, 'U004', 'R004'),
('Seat005', '6:00 PM', 'Bloomington', 'Champaign', 'Bus005', '2024-04-23', '02:00 PM', 'Location E', 50, 47, 'U005', 'R005'),
('Seat006', '7:00 PM', 'Naperville', 'Bloomington', 'Bus006', '2024-04-24', '03:00 PM', 'Location F', 50, 45, 'U006', 'R006'),
('Seat007', '8:00 PM', 'Aurora', 'Naperville', 'Bus007', '2024-04-25', '04:00 PM', 'Location G', 50, 48, 'U007', 'R007'),
('Seat008', '9:00 PM', 'Joliet', 'Aurora', 'Bus008', '2024-04-26', '05:00 PM', 'Location H', 50, 50, 'U008', 'R008'),
('Seat009', '10:00 PM', 'Decatur', 'Joliet', 'Bus009', '2024-04-27', '06:00 PM', 'Location I', 50, 50, 'U009', 'R009'),
('Seat010', '11:00 PM', 'Chicago', 'Decatur', 'Bus010', '2024-04-28', '07:00 PM', 'Location J', 50, 50, 'U010', 'R010');

-- --------------------------------------------------------

--
-- Table structure for table `checking_buses`
--

CREATE TABLE `checking_buses` (
  `Bus_Number` varchar(20) NOT NULL,
  `User_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checking_buses`
--

INSERT INTO `checking_buses` (`Bus_Number`, `User_id`) VALUES
('Bus001', 'U001'),
('Bus002', 'U002'),
('Bus003', 'U003'),
('Bus004', 'U004'),
('Bus005', 'U005'),
('Bus006', 'U006'),
('Bus007', 'U007'),
('Bus008', 'U008'),
('Bus009', 'U009'),
('Bus010', 'U010');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Card_No` int(11) NOT NULL,
  `Bank` varchar(20) NOT NULL,
  `Transac_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Card_No`, `Bank`, `Transac_Id`) VALUES
(1234567890, 'Bank A', 'T001'),
(2147483647, 'Bank B', 'T002'),
(2147483647, 'Bank C', 'T003'),
(1111111111, 'Bank D', 'T004'),
(2147483647, 'Bank E', 'T005'),
(2147483647, 'Bank F', 'T006'),
(2147483647, 'Bank G', 'T007'),
(2147483647, 'Bank H', 'T008'),
(2147483647, 'Bank I', 'T009'),
(2147483647, 'Bank J', 'T010');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Route_Point` varchar(20) NOT NULL,
  `PickUpPoint` char(20) NOT NULL,
  `Route_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`Route_Point`, `PickUpPoint`, `Route_Id`) VALUES
('Chicago', 'Pickup A', 'R001'),
('Springfield', 'Pickup B', 'R002'),
('Peoria', 'Pickup C', 'R003'),
('Rockford', 'Pickup D', 'R004'),
('Champaign', 'Pickup E', 'R005'),
('Bloomington', 'Pickup F', 'R006'),
('Naperville', 'Pickup G', 'R007'),
('Aurora', 'Pickup H', 'R008'),
('Joliet', 'Pickup I', 'R009'),
('Decatur', 'Pickup J', 'R010'),
('Chicago', 'Pickup A', 'R011'),
('Springfield', 'Pickup B', 'R012'),
('Peoria', 'Pickup C', 'R013'),
('Rockford', 'Pickup D', 'R014'),
('Champaign', 'Pickup E', 'R015'),
('Bloomington', 'Pickup F', 'R016'),
('Naperville', 'Pickup G', 'R017'),
('Aurora', 'Pickup H', 'R018'),
('Joliet', 'Pickup I', 'R019'),
('Decatur', 'Pickup J', 'R020');

-- --------------------------------------------------------

--
-- Table structure for table `route_map`
--

CREATE TABLE `route_map` (
  `Bus_Number` varchar(20) NOT NULL,
  `Route_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_map`
--

INSERT INTO `route_map` (`Bus_Number`, `Route_Id`) VALUES
('Bus001', 'R001'),
('Bus002', 'R002'),
('Bus003', 'R003'),
('Bus004', 'R004'),
('Bus005', 'R005'),
('Bus006', 'R006'),
('Bus007', 'R007'),
('Bus008', 'R008'),
('Bus009', 'R009'),
('Bus010', 'R010');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Destination` char(30) NOT NULL,
  `Source` char(30) NOT NULL,
  `Departure_date` date NOT NULL,
  `Booking_Id` varchar(20) NOT NULL,
  `Departure_Time` varchar(20) NOT NULL,
  `Transac_Id` varchar(20) NOT NULL,
  `Bus_Number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Destination`, `Source`, `Departure_date`, `Booking_Id`, `Departure_Time`, `Transac_Id`, `Bus_Number`) VALUES
('Springfield', 'Chicago', '2024-04-19', 'B001', '10:00 AM', 'T001', 'Bus001'),
('Peoria', 'Springfield', '2024-04-20', 'B002', '11:00 AM', 'T002', 'Bus002'),
('Rockford', 'Peoria', '2024-04-21', 'B003', '12:00 PM', 'T003', 'Bus003'),
('Champaign', 'Rockford', '2024-04-22', 'B004', '01:00 PM', 'T004', 'Bus004'),
('Bloomington', 'Champaign', '2024-04-23', 'B005', '02:00 PM', 'T005', 'Bus005'),
('Naperville', 'Bloomington', '2024-04-24', 'B006', '03:00 PM', 'T006', 'Bus006'),
('Aurora', 'Naperville', '2024-04-25', 'B007', '04:00 PM', 'T007', 'Bus007'),
('Joliet', 'Aurora', '2024-04-26', 'B008', '05:00 PM', 'T008', 'Bus008'),
('Decatur', 'Joliet', '2024-04-27', 'B009', '06:00 PM', 'T009', 'Bus009'),
('Chicago', 'Decatur', '2024-04-28', 'B010', '07:00 PM', 'T010', 'Bus010');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `First_Name` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `User_id` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Booking_Id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`First_Name`, `DOB`, `Gender`, `Last_Name`, `User_id`, `Address`, `Booking_Id`) VALUES
('John', '1990-01-01', 'M', 'Doe', 'U001', '123 Street, Chicago', 'B001'),
('Jane', '1995-05-05', 'F', 'Smith', 'U002', '456 Avenue, Springfi', 'B002'),
('Alice', '1988-08-08', 'F', 'Johnson', 'U003', '789 Road, Peoria', 'B003'),
('Bob', '1987-07-07', 'M', 'Williams', 'U004', '321 Boulevard, Rockf', 'B004'),
('Emma', '1993-03-03', 'F', 'Brown', 'U005', '654 Lane, Champaign', 'B005'),
('Mike', '1985-11-11', 'M', 'Jones', 'U006', '987 Drive, Bloomingt', 'B006'),
('Sarah', '1998-09-09', 'F', 'Davis', 'U007', '741 Court, Napervill', 'B007'),
('David', '1986-06-06', 'M', 'Miller', 'U008', '852 Terrace, Aurora', 'B008'),
('Emily', '1992-02-02', 'F', 'Wilson', 'U009', '159 Way, Joliet', 'B009'),
('Chris', '1991-04-04', 'M', 'Taylor', 'U010', '369 Place, Decatur', 'B010');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_id` int(11) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `phoneNumber` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_id`, `First_Name`, `DOB`, `Gender`, `Last_Name`, `Address`, `phoneNumber`) VALUES
(1, 'John', '2024-04-17', 'm', 'Reddy', '1109 west Russell', '361-806-1970'),
(2, 'Jane', '1995-05-05', 'F', 'Smith', '456 Avenue, Springfi', '234-567-8901'),
(3, 'Alice', '1988-08-08', 'F', 'Johnson', '789 Road, Peoria', '345-678-9012'),
(4, 'Bob', '1987-07-07', 'M', 'Williams', '321 Boulevard, Rockf', '456-789-0123'),
(5, 'Emma', '1993-03-03', 'F', 'Brown', '654 Lane, Champaign', '567-890-1234'),
(6, 'Mike', '1985-11-11', 'M', 'Jones', '987 Drive, Bloomingt', '678-901-2345'),
(7, 'Sarah', '1998-09-09', 'F', 'Davis', '741 Court, Napervill', '789-012-3456'),
(8, 'David', '1986-06-06', 'M', 'Miller', '852 Terrace, Aurora', '890-123-4567'),
(9, 'Emily', '1992-02-02', 'F', 'Wilson', '159 Way, Joliet', '901-234-5678'),
(10, 'Chris', '1991-04-04', 'M', 'Taylor', '369 Place, Decatur', '012-345-6789'),
(17, 'YASWANTH', '2024-04-05', 'm', 'dcsd', '1109 west Russell', '361-806-1970'),
(18, 'Ruthwesh', '2024-05-01', 'm', 'Punati', '1109 west Russell', '361-806-1970');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Booking_Id` (`Booking_Id`);

--
-- Indexes for table `bus_info`
--
ALTER TABLE `bus_info`
  ADD PRIMARY KEY (`Bus_Number`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Route_Id` (`Route_Id`);

--
-- Indexes for table `checking_buses`
--
ALTER TABLE `checking_buses`
  ADD KEY `Bus_Number` (`Bus_Number`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Transac_Id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Route_Id`);

--
-- Indexes for table `route_map`
--
ALTER TABLE `route_map`
  ADD KEY `Bus_Number` (`Bus_Number`),
  ADD KEY `Route_Id` (`Route_Id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Booking_Id`),
  ADD KEY `Transac_Id` (`Transac_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Booking_Id` (`Booking_Id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Booking_Id`) REFERENCES `ticket` (`Booking_Id`);

--
-- Constraints for table `bus_info`
--
ALTER TABLE `bus_info`
  ADD CONSTRAINT `bus_info_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  ADD CONSTRAINT `bus_info_ibfk_2` FOREIGN KEY (`Route_Id`) REFERENCES `route` (`Route_Id`);

--
-- Constraints for table `checking_buses`
--
ALTER TABLE `checking_buses`
  ADD CONSTRAINT `checking_buses_ibfk_1` FOREIGN KEY (`Bus_Number`) REFERENCES `bus_info` (`Bus_Number`),
  ADD CONSTRAINT `checking_buses_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`);

--
-- Constraints for table `route_map`
--
ALTER TABLE `route_map`
  ADD CONSTRAINT `route_map_ibfk_1` FOREIGN KEY (`Bus_Number`) REFERENCES `bus_info` (`Bus_Number`),
  ADD CONSTRAINT `route_map_ibfk_2` FOREIGN KEY (`Route_Id`) REFERENCES `route` (`Route_Id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Transac_Id`) REFERENCES `payment` (`Transac_Id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Booking_Id`) REFERENCES `ticket` (`Booking_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
