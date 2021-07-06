

CREATE DATABASE Koperasi;
USE Koperasi;

CREATE TABLE IF NOT EXISTS `Anggota` (
  `NIK` int(11) NOT NULL AUTO_INCREMENT,
  `NamaAnggota` varchar(30) DEFAULT NULL,
  `AlamatAnggota` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Anggota`
--

INSERT INTO `Anggota` (`NIK`, `NamaAnggota`, `AlamatAnggota`) VALUES
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
-- Table structure for table `Tabungan`
--

CREATE TABLE IF NOT EXISTS `Tabungan` (
  `NoTabungan` int(11) NOT NULL AUTO_INCREMENT,
  `Saldo` float DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `NIK` int(11) NOT NULL,
  PRIMARY KEY (`NoTabungan`),
  KEY `NIK` (`NIK`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7890003 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Tabungan`
--

INSERT INTO `Tabungan` (`NoTabungan`, `Saldo`, `Status`, `NIK`) VALUES
(7890001, 1000, 'Active', 3021001),
(7890002, 1000, 'Aktive', 3121001);

-- --------------------------------------------------------

--
-- Table structure for table `Pegawai`
--

CREATE TABLE IF NOT EXISTS `Pegawai` (
  `IDPegawai` int(11) NOT NULL AUTO_INCREMENT,
  `NamaPegawai` varchar(30) DEFAULT NULL,
  `AlamatPegawai` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDPegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=200009 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `IDPegawai`
--

INSERT INTO `Pegawai` (`IDPegawai`, `NamaPegawai`, `AlamatPegawai`) VALUES
(200001, 'ATM-JAKBAR', 'Mall Puri'),
(200002, 'ATM-JAKTIM', 'Mall Baru'),
(200003, 'ATM-BOGOR', 'Mall Depok'),
(200004, 'ATM-DEPOK', 'Mall Kebon Raya'),
(200005, 'Indah Per', 'Kelapa Dua, Jakarta Barat'),
(200006, 'Listi Ya', 'Cawang, Jakarta Timur'),
(200007, 'Nano Multi', 'Cibinong'),
(200008, 'Well Lin', 'Jl. Veteran, Bogor');

-- --------------------------------------------------------

--
-- Table structure for table `Transaksi`
--

CREATE TABLE IF NOT EXISTS `Transaksi` (
  `IDTransaksi` int(11) NOT NULL AUTO_INCREMENT,
  `NoTabungan` int(11) NOT NULL,
  `Jumlah` float NOT NULL,
  `TipeTransaksi` varchar(1) DEFAULT NULL,
  `IDPegawai` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTransaksi`),
  KEY `NoTabungan` (`NoTabungan`),
  KEY `IDPegawai` (`IDPegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=30001 DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Tabungan`
--
ALTER TABLE `Tabungan`
  ADD CONSTRAINT `NIK` FOREIGN KEY (`NIK`) REFERENCES `Anggota` (`NIK`);


--
-- Constraints for table `Transaksi`
--
ALTER TABLE `Transaksi`
  ADD CONSTRAINT `IDPegawai` FOREIGN KEY (`IDPegawai`) REFERENCES `Pegawai` (`IDPegawai`),
  ADD CONSTRAINT `NoTabungan` FOREIGN KEY (`NoTabungan`) REFERENCES `Tabungan` (`NoTabungan`);
COMMIT;
