-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql.mylab.local
-- Generation Time: Jun 18, 2021 at 05:56 AM
-- Server version: 10.5.9-MariaDB-1:10.5.9+maria~focal
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `Bank`
--
CREATE DATABASE Bank;

USE Bank;
-- --------------------------------------------------------

--
-- Table structure for table `Cabang`
--

CREATE TABLE IF NOT EXISTS `Cabang` (
  `IDCabang` int(11) NOT NULL AUTO_INCREMENT,
  `AlamatCabang` varchar(100) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDCabang`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Cabang`
--

INSERT INTO `Cabang` (`IDCabang`, `AlamatCabang`, `CITY`) VALUES
(10001, 'Jakarta Barat', 'Jakarta'),
(10002, 'Jakarta Timur', 'Jakarta'),
(10003, 'Bogor', 'Bogor'),
(10004, 'Depok', 'Depok');

-- --------------------------------------------------------

--
-- Table structure for table `Nasabah`
--

CREATE TABLE IF NOT EXISTS `Nasabah` (
  `NIK` int(11) NOT NULL AUTO_INCREMENT,
  `NamaNasabah` varchar(30) DEFAULT NULL,
  `AlamatNasabah` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Nasabah`
--

INSERT INTO `Nasabah` (`NIK`, `NamaNasabah`, `AlamatNasabah`) VALUES
(3021001, 'Andi Surya', 'Kebon Jeruk, Jakarta Barat'),
(3121001, 'Chaila Top', 'Depok, Jawa Barat'),
(3121002, 'Ester Go', 'Meruya, Jakarta Barat'),
(3121005, 'Galih Gong', 'Depok, Jawa Barat'),
(3221002, 'Bagus Kurnia', 'Meruya, Jakarta Barat'),
(3321002, 'Denny Sip', 'Bogor, Jawa Barat'),
(3421001, 'Roland Zou', 'Matraman, Jakarta Timur'),
(3421002, 'Firli Hop', 'Cilincing, Jakarta Timur'),
(3421003, 'Jerry Bah', 'Cilangkap, Jakarta Timur'),
(3521002, 'Santa Ulfa', 'Menteng, Jakarta Pusat'),
(3621001, 'Putra Su', 'Blok M, Jakarta Selatan'),
(3721001, 'Tiur Fee', 'Ciledug, Tangerang');

-- --------------------------------------------------------

--
-- Table structure for table `Rekening`
--

CREATE TABLE IF NOT EXISTS `Rekening` (
  `NoRekening` int(11) NOT NULL AUTO_INCREMENT,
  `SALDO` float DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `NIK` int(11) NOT NULL,
  `IDCabang` int(11) NOT NULL,
  PRIMARY KEY (`NoRekening`),
  KEY `IDCabang` (`IDCabang`),
  KEY `NIK` (`NIK`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7890003 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rekening`
--

INSERT INTO `Rekening` (`NoRekening`, `SALDO`, `STATUS`, `NIK`, `IDCabang`) VALUES
(7890001, 1000, 'Active', 3021001, 10001),
(7890002, 1000, 'Aktive', 3121001, 10004);

-- --------------------------------------------------------

--
-- Table structure for table `Teller`
--

CREATE TABLE IF NOT EXISTS `Teller` (
  `IDTeller` int(11) NOT NULL AUTO_INCREMENT,
  `NamaTeller` varchar(30) DEFAULT NULL,
  `AlamatTeller` varchar(100) DEFAULT NULL,
  `TipeTeller` varchar(1) DEFAULT NULL,
  `IDCabang` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTeller`),
  KEY `IDCabang` (`IDCabang`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200009 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Teller`
--

INSERT INTO `Teller` (`IDTeller`, `NamaTeller`, `AlamatTeller`, `TipeTeller`, `IDCabang`) VALUES
(200001, 'ATM-JAKBAR', 'Mall Puri', 'M', 10001),
(200002, 'ATM-JAKTIM', 'Mall Baru', 'M', 10002),
(200003, 'ATM-BOGOR', 'Mall Depok', 'M', 10004),
(200004, 'ATM-DEPOK', 'Mall Kebon Raya', 'M', 10003),
(200005, 'Indah Per', 'Kelapa Dua, Jakarta Barat', 'H', 10001),
(200006, 'Listi Ya', 'Cawang, Jakarta Timur', 'H', 10002),
(200007, 'Nano Multi', 'Cibinong', 'H', 10004),
(200008, 'Well Lin', 'Jl. Veteran, Bogor', 'H', 10003);

-- --------------------------------------------------------

--
-- Table structure for table `Transaksi`
--

CREATE TABLE IF NOT EXISTS `Transaksi` (
  `IDTransaksi` int(11) NOT NULL AUTO_INCREMENT,
  `NoRekening` int(11) NOT NULL,
  `AMOUNT` float NOT NULL,
  `TipeTransaksi` varchar(1) DEFAULT NULL,
  `IDTeller` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTransaksi`),
  KEY `NoRekening` (`NoRekening`),
  KEY `IDTeller` (`IDTeller`)
) ENGINE=InnoDB AUTO_INCREMENT=30001 DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Rekening`
--
ALTER TABLE `Rekening`
  ADD CONSTRAINT `IDCabang` FOREIGN KEY (`IDCabang`) REFERENCES `Cabang` (`IDCabang`),
  ADD CONSTRAINT `NIK` FOREIGN KEY (`NIK`) REFERENCES `Nasabah` (`NIK`);

--
-- Constraints for table `Teller`
--
ALTER TABLE `Teller`
  ADD CONSTRAINT `ID-Cabang` FOREIGN KEY (`IDCabang`) REFERENCES `Cabang` (`IDCabang`);

--
-- Constraints for table `Transaksi`
--
ALTER TABLE `Transaksi`
  ADD CONSTRAINT `IDTeller` FOREIGN KEY (`IDTeller`) REFERENCES `Teller` (`IDTeller`),
  ADD CONSTRAINT `NoRekening` FOREIGN KEY (`NoRekening`) REFERENCES `Rekening` (`NoRekening`);
COMMIT;

