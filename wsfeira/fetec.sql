CREATE TABLE `alunos` (
  `ALUCODIGO` int(11) NOT NULL,
  `ALUNNOME` varchar(50) DEFAULT NULL,
  `CODIGOPRO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `alunos` (`ALUCODIGO`, `ALUNNOME`, `CODIGOPRO`) VALUES
(1, 'ANA JÚLIA MARTINS ZANATA', 5);

CREATE TABLE `controle` (
  `CONCODIGO` int(11) NOT NULL,
  `CODIGOUSU` int(11) DEFAULT NULL,
  `PROJ1` int(11) DEFAULT NULL,
  `PROJ2` int(11) DEFAULT NULL,
  `PROJ3` int(11) DEFAULT NULL,
  `PROJ4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `controle` (`CONCODIGO`, `CODIGOUSU`, `PROJ1`, `PROJ2`, `PROJ3`, `PROJ4`) VALUES
(1, 1, 2, 3, 4, 5),
(5, 1, 2, 4, 0, 0);

CREATE TABLE `eixos` (
  `EIXCODIGO` int(11) NOT NULL,
  `EIXONOME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `eixos` (`EIXCODIGO`, `EIXONOME`) VALUES
(1, 'INFORMAÇÃO E COMUNICAÇÃO');

CREATE TABLE `notas` (
  `NOTCODIGO` int(11) NOT NULL,
  `CODIGOALU` int(11) DEFAULT NULL,
  `NOTAIND` varchar(2) NOT NULL,
  `NOTAGRP` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `notas` (`NOTCODIGO`, `CODIGOALU`, `NOTAIND`, `NOTAGRP`) VALUES
(1, 1, 'MB', 'MB');

CREATE TABLE `projetos` (
  `PROCODIGO` int(11) NOT NULL,
  `PRONOME` varchar(50) DEFAULT NULL,
  `PROEIXO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `projetos` (`PROCODIGO`, `PRONOME`, `PROEIXO`) VALUES
(2, 'CNC ROUTER', 'INFORMAÇÃO E COMUNICAÇÃO'),
(3, 'CUBO DE LED', 'INFORMAÇÃO E COMUNICAÇÃO'),
(4, 'CAIXA MÁGICA', 'INFORMAÇÃO E COMUNICAÇÃO'),
(5, 'LUTA DE ROBOS', 'INFORMAÇÃO E COMUNICAÇÃO');

CREATE TABLE `usuarios` (
  `USUCODIGO` int(11) NOT NULL,
  `USUCPF` varchar(50) DEFAULT NULL,
  `USUNOME` varchar(50) DEFAULT NULL,
  `USUDTNASC` date DEFAULT NULL,
  `USUTIPO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuarios` (`USUCODIGO`, `USUCPF`, `USUNOME`, `USUDTNASC`, `USUTIPO`) VALUES
(1, '22554371806', 'ZANATAS', '1984-05-07', 'PROFESSOR'),
(2, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL);

ALTER TABLE `alunos`
  ADD PRIMARY KEY (`ALUCODIGO`),
  ADD KEY `CODIGOPRO` (`CODIGOPRO`);

ALTER TABLE `controle`
  ADD PRIMARY KEY (`CONCODIGO`),
  ADD KEY `CODIGOUSU` (`CODIGOUSU`),
  ADD KEY `fkconproj1` (`PROJ1`),
  ADD KEY `fkconproj2` (`PROJ2`),
  ADD KEY `fkconproj3` (`PROJ3`),
  ADD KEY `fkconproj4` (`PROJ4`);

ALTER TABLE `eixos`
  ADD PRIMARY KEY (`EIXCODIGO`);

ALTER TABLE `notas`
  ADD PRIMARY KEY (`NOTCODIGO`),
  ADD KEY `CODIGOALU` (`CODIGOALU`);

ALTER TABLE `projetos`
  ADD PRIMARY KEY (`PROCODIGO`),
  ADD UNIQUE KEY `PRONOME` (`PRONOME`),
  ADD KEY `PROEIXO` (`PROEIXO`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUCODIGO`),
  ADD UNIQUE KEY `USUCPF` (`USUCPF`);

ALTER TABLE `alunos`
  MODIFY `ALUCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `controle`
  MODIFY `CONCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `eixos`
  MODIFY `EIXCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `notas`
  MODIFY `NOTCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `projetos`
  MODIFY `PROCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `usuarios`
  MODIFY `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`CODIGOPRO`) REFERENCES `projetos` (`PROCODIGO`);

ALTER TABLE `controle`
  ADD CONSTRAINT `controle_ibfk_1` FOREIGN KEY (`CODIGOUSU`) REFERENCES `usuarios` (`USUCODIGO`);

ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`CODIGOALU`) REFERENCES `alunos` (`ALUCODIGO`);


CREATE VIEW `vcontrole`  AS SELECT `controle`.`CONCODIGO` AS `CONCODIGO`, `controle`.`CODIGOUSU` AS `CODIGOUSU`, `usuarios`.`USUNOME` AS `USUNOME`, `controle`.`PROJ1` AS `PROJ1`, (select `projetos`.`PRONOME` from `projetos` where `projetos`.`PROCODIGO` = `controle`.`PROJ1`) AS `PRONOME1`, `controle`.`PROJ2` AS `PROJ2`, (select `projetos`.`PRONOME` from `projetos` where `projetos`.`PROCODIGO` = `controle`.`PROJ2`) AS `PRONOME2`, `controle`.`PROJ3` AS `PROJ3`, (select `projetos`.`PRONOME` from `projetos` where `projetos`.`PROCODIGO` = `controle`.`PROJ3`) AS `PRONOME3`, `controle`.`PROJ4` AS `PROJ4`, (select `projetos`.`PRONOME` from `projetos` where `projetos`.`PROCODIGO` = `controle`.`PROJ4`) AS `PRONOME4` FROM (`controle` join `usuarios`) WHERE `controle`.`CODIGOUSU` = `usuarios`.`USUCODIGO`;

CREATE VIEW `vnotas`  AS SELECT `notas`.`NOTCODIGO` AS `NOTCODIGO`, `notas`.`CODIGOALU` AS `CODIGOALU`, `notas`.`NOTAIND` AS `NOTAIND`, `notas`.`NOTAGRP` AS `NOTAGRP`, `alunos`.`ALUNNOME` AS `ALUNNOME`, `projetos`.`PRONOME` AS `PRONOME` FROM ((`notas` join `alunos` on(`notas`.`CODIGOALU` = `alunos`.`ALUCODIGO`)) join `projetos` on(`alunos`.`CODIGOPRO` = `projetos`.`PROCODIGO`))  ;
