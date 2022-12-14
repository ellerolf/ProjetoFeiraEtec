-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Set-2022 às 03:39
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fetec`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `ALUCODIGO` int(11) NOT NULL,
  `ALUNNOME` varchar(50) DEFAULT NULL,
  `CODIGOPRO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`ALUCODIGO`, `ALUNNOME`, `CODIGOPRO`) VALUES
(1, 'ANA JÚLIA MARTINS ZANATA', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `controle`
--

CREATE TABLE `controle` (
  `CONCODIGO` int(11) NOT NULL,
  `CODIGOUSU` int(11) DEFAULT NULL,
  `PROJ1` int(11) DEFAULT NULL,
  `PROJ2` int(11) DEFAULT NULL,
  `PROJ3` int(11) DEFAULT NULL,
  `PROJ4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `controle`
--

INSERT INTO `controle` (`CONCODIGO`, `CODIGOUSU`, `PROJ1`, `PROJ2`, `PROJ3`, `PROJ4`) VALUES
(1, 1, 2, 3, 4, 5),
(5, 1, 2, 4, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eixos`
--

CREATE TABLE `eixos` (
  `EIXCODIGO` int(11) NOT NULL,
  `EIXONOME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `eixos`
--

INSERT INTO `eixos` (`EIXCODIGO`, `EIXONOME`) VALUES
(1, 'INFORMAÇÃO E COMUNICAÇÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas`
--

CREATE TABLE `notas` (
  `NOTCODIGO` int(11) NOT NULL,
  `CODIGOALU` int(11) DEFAULT NULL,
  `NOTAIND` varchar(2) NOT NULL,
  `NOTAGRP` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notas`
--

INSERT INTO `notas` (`NOTCODIGO`, `CODIGOALU`, `NOTAIND`, `NOTAGRP`) VALUES
(1, 1, 'MB', 'MB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projetos`
--

CREATE TABLE `projetos` (
  `PROCODIGO` int(11) NOT NULL,
  `PRONOME` varchar(50) DEFAULT NULL,
  `PROEIXO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projetos`
--

INSERT INTO `projetos` (`PROCODIGO`, `PRONOME`, `PROEIXO`) VALUES
(2, 'CNC ROUTER', 'INFORMAÇÃO E COMUNICAÇÃO'),
(3, 'CUBO DE LED', 'INFORMAÇÃO E COMUNICAÇÃO'),
(4, 'CAIXA MÁGICA', 'INFORMAÇÃO E COMUNICAÇÃO'),
(5, 'LUTA DE ROBOS', 'INFORMAÇÃO E COMUNICAÇÃO'),
(6, 'DEV', 'INFORMAÇÃO E COMUNICAÇÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `USUCODIGO` int(11) NOT NULL,
  `USUCPF` varchar(50) DEFAULT NULL,
  `USUNOME` varchar(50) DEFAULT NULL,
  `USUDTNASC` date DEFAULT NULL,
  `USUTIPO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`USUCODIGO`, `USUCPF`, `USUNOME`, `USUDTNASC`, `USUTIPO`) VALUES
(1, '22554371806', 'ZANATAS', '1984-05-07', 'PROFESSOR'),
(2, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcontrole`
-- (See below for the actual view)
--
CREATE TABLE `vcontrole` (
`CONCODIGO` int(11)
,`CODIGOUSU` int(11)
,`USUNOME` varchar(50)
,`PROJ1` int(11)
,`PRONOME1` varchar(50)
,`PROJ2` int(11)
,`PRONOME2` varchar(50)
,`PROJ3` int(11)
,`PRONOME3` varchar(50)
,`PROJ4` int(11)
,`PRONOME4` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vnotas`
-- (See below for the actual view)
--
CREATE TABLE `vnotas` (
`NOTCODIGO` int(11)
,`CODIGOALU` int(11)
,`NOTAIND` varchar(2)
,`NOTAGRP` varchar(2)
,`ALUNNOME` varchar(50)
,`PRONOME` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `vcontrole`
--
DROP TABLE IF EXISTS `vcontrole`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcontrole`  AS  select `controle`.`CONCODIGO` AS `CONCODIGO`,`controle`.`CODIGOUSU` AS `CODIGOUSU`,`usuarios`.`USUNOME` AS `USUNOME`,`controle`.`PROJ1` AS `PROJ1`,(select `projetos`.`PRONOME` from `projetos` where (`projetos`.`PROCODIGO` = `controle`.`PROJ1`)) AS `PRONOME1`,`controle`.`PROJ2` AS `PROJ2`,(select `projetos`.`PRONOME` from `projetos` where (`projetos`.`PROCODIGO` = `controle`.`PROJ2`)) AS `PRONOME2`,`controle`.`PROJ3` AS `PROJ3`,(select `projetos`.`PRONOME` from `projetos` where (`projetos`.`PROCODIGO` = `controle`.`PROJ3`)) AS `PRONOME3`,`controle`.`PROJ4` AS `PROJ4`,(select `projetos`.`PRONOME` from `projetos` where (`projetos`.`PROCODIGO` = `controle`.`PROJ4`)) AS `PRONOME4` from (`controle` join `usuarios`) where (`controle`.`CODIGOUSU` = `usuarios`.`USUCODIGO`) ;

-- --------------------------------------------------------

--
-- Structure for view `vnotas`
--
DROP TABLE IF EXISTS `vnotas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnotas`  AS  select `notas`.`NOTCODIGO` AS `NOTCODIGO`,`notas`.`CODIGOALU` AS `CODIGOALU`,`notas`.`NOTAIND` AS `NOTAIND`,`notas`.`NOTAGRP` AS `NOTAGRP`,`alunos`.`ALUNNOME` AS `ALUNNOME`,`projetos`.`PRONOME` AS `PRONOME` from ((`notas` join `alunos` on((`notas`.`CODIGOALU` = `alunos`.`ALUCODIGO`))) join `projetos` on((`alunos`.`CODIGOPRO` = `projetos`.`PROCODIGO`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`ALUCODIGO`),
  ADD KEY `CODIGOPRO` (`CODIGOPRO`);

--
-- Indexes for table `controle`
--
ALTER TABLE `controle`
  ADD PRIMARY KEY (`CONCODIGO`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`),
  ADD KEY `fkconproj1` (`PROJ1`),
  ADD KEY `fkconproj2` (`PROJ2`),
  ADD KEY `fkconproj3` (`PROJ3`),
  ADD KEY `fkconproj4` (`PROJ4`);

--
-- Indexes for table `eixos`
--
ALTER TABLE `eixos`
  ADD PRIMARY KEY (`EIXCODIGO`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`NOTCODIGO`),
  ADD KEY `CODIGOALU` (`CODIGOALU`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`PROCODIGO`),
  ADD UNIQUE KEY `PRONOME` (`PRONOME`),
  ADD KEY `PROEIXO` (`PROEIXO`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUCODIGO`),
  ADD UNIQUE KEY `USUCPF` (`USUCPF`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `ALUCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `controle`
--
ALTER TABLE `controle`
  MODIFY `CONCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eixos`
--
ALTER TABLE `eixos`
  MODIFY `EIXCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `NOTCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `PROCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`CODIGOPRO`) REFERENCES `projetos` (`PROCODIGO`);

--
-- Limitadores para a tabela `controle`
--
ALTER TABLE `controle`
  ADD CONSTRAINT `controle_ibfk_1` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuarios` (`USUCODIGO`);

--
-- Limitadores para a tabela `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`CODIGOALU`) REFERENCES `alunos` (`ALUCODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
