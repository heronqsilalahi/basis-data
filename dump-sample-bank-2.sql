-- CREATE DATABASE `your_nik`;
-- USE `your_nik`;

-- --------------------------------------------------------
-- CREATE TABLE -------------------------------------------
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Cabang` (
  `IDCabang` int(5) NOT NULL AUTO_INCREMENT,
  `AlamatCabang` varchar(100) DEFAULT NULL,
  `Kota` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDCabang`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Nasabah` (
  `NIK` int(15) NOT NULL,
  `NamaNasabah` varchar(30) DEFAULT NULL,
  `AlamatNasabah` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Rekening` (
  `NoRekening` int(8) NOT NULL,
  `Saldo` float DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `NIK` int(11) NOT NULL,
  `IDCabang` int(11) NOT NULL,
  PRIMARY KEY (`NoRekening`),
  KEY `IDCabang` (`IDCabang`),
  KEY `NIK` (`NIK`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Teller` (
  `IDTeller` int(11) NOT NULL AUTO_INCREMENT,
  `NamaTeller` varchar(30) DEFAULT NULL,
  `AlamatTeller` varchar(100) DEFAULT NULL,
  `TipeTeller` varchar(1) DEFAULT NULL,
  `IDCabang` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTeller`),
  KEY `IDCabang` (`IDCabang`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20001 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `Transaksi` (
  `IDTransaksi` int(11) NOT NULL AUTO_INCREMENT,
  `NoRekening` int(11) NOT NULL,
  `Jumlah` float NOT NULL,
  `TipeTransaksi` varchar(1) DEFAULT NULL,
  `IDTeller` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTransaksi`),
  KEY `NoRekening` (`NoRekening`),
  KEY `IDTeller` (`IDTeller`)
) ENGINE=InnoDB AUTO_INCREMENT=30001 DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------
-- INSERT DATA --------------------------------------------
-- --------------------------------------------------------

INSERT INTO `Cabang` (`IDCabang`, `AlamatCabang`, `Kota`) VALUES
(Null, 'Jakarta Barat', 'Jakarta'),
(Null, 'Jakarta Timur', 'Jakarta'),
(Null, 'Bogor', 'Bogor'),
(Null, 'Depok', 'Depok');


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


INSERT INTO `Rekening` (`NoRekening`, `Saldo`, `Status`, `NIK`, `IDCabang`) VALUES
(20210101, 1000, 'Active', 3021001, 10001),
(20210102, 1000, 'Active', 3121002, 10002),
(20210103, 1000, 'Active', 3221002, 10003),
(20210104, 1000, 'Active', 3421002, 10003),
(20210105, 1000, 'Aktive', 3721001, 10004);


INSERT INTO `Teller` (`IDTeller`, `NamaTeller`, `AlamatTeller`, `TipeTeller`, `IDCabang`) VALUES
(Null, 'ATM-JAKBAR', 'Mall Puri', 'M', 10001),
(Null, 'ATM-JAKTIM', 'Mall Baru', 'M', 10002),
(Null, 'ATM-BOGOR', 'Mall Depok', 'M', 10004),
(Null, 'ATM-DEPOK', 'Mall Kebon Raya', 'M', 10003),
(Null, 'Indah Per', 'Kelapa Dua, Jakarta Barat', 'H', 10001),
(Null, 'Listi Ya', 'Cawang, Jakarta Timur', 'H', 10002),
(Null, 'Nano Multi', 'Cibinong', 'H', 10004),
(Null, 'Well Lin', 'Jl. Veteran, Bogor', 'H', 10003);


INSERT INTO `Transaksi` (`IDTransaksi`, `NoRekening`, `Jumlah`, `TipeTransaksi`, `IDTeller`) VALUES
(Null, 20210101, 5000, 'D',20005),
(Null, 20210101, 500, 'K',20004),
(Null, 20210102, 5500, 'D',20006),
(Null, 20210101, 520, 'K',20003),
(Null, 20210104, 1200, 'D',20007),
(Null, 20210102, 100, 'K',200052),
(Null, 20210105, 15000, 'D',20007),
(Null, 20210103, 450, 'K',20004);
 
-- --------------------------------------------------------
-- CONSTRAIT TABLE ----------------------------------------
-- --------------------------------------------------------

ALTER TABLE `Rekening`
  ADD CONSTRAINT `IDCabang` FOREIGN KEY (`IDCabang`) REFERENCES `Cabang` (`IDCabang`),
  ADD CONSTRAINT `NIK` FOREIGN KEY (`NIK`) REFERENCES `Nasabah` (`NIK`);

ALTER TABLE `Teller`
  ADD CONSTRAINT `ID-Cabang` FOREIGN KEY (`IDCabang`) REFERENCES `Cabang` (`IDCabang`);

ALTER TABLE `Transaksi`
  ADD CONSTRAINT `IDTeller` FOREIGN KEY (`IDTeller`) REFERENCES `Teller` (`IDTeller`),
  ADD CONSTRAINT `NoRekening` FOREIGN KEY (`NoRekening`) REFERENCES `Rekening` (`NoRekening`);
COMMIT;
