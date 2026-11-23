-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260810.843def3cd8
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2026 at 02:16 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `focinho&bicovet`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendamento`
--

CREATE TABLE `agendamento` (
  `id_agendamento` int NOT NULL,
  `id_animal` varchar(100) NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_hora` datetime NOT NULL,
  `status_do_agendamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `id_animal` varchar(100) NOT NULL,
  `id_tutor` int DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `especie` varchar(100) DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aplicacao_vacina`
--

CREATE TABLE `aplicacao_vacina` (
  `id_aplicacao` int NOT NULL,
  `id_animal` varchar(100) NOT NULL,
  `id_vacina` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `data_apricacao` datetime DEFAULT NULL,
  `dose` varchar(100) DEFAULT NULL,
  `data_proxima_dose` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL,
  `id_animal` varchar(100) NOT NULL,
  `id_veterinario` int NOT NULL,
  `id_agendamento` int NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `ficha` varchar(100) DEFAULT NULL,
  `diagnostico` varchar(100) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialidade`
--

CREATE TABLE `especialidade` (
  `id_especialidade` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exame`
--

CREATE TABLE `exame` (
  `id_exame` int NOT NULL,
  `id_consulta` int NOT NULL,
  `tipo_exame` varchar(100) DEFAULT NULL,
  `resultado` varchar(100) DEFAULT NULL,
  `data_realizacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fatura`
--

CREATE TABLE `fatura` (
  `id_fatura` int NOT NULL,
  `id_tutor` int NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status_pagamente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_fatura`
--

CREATE TABLE `item_fatura` (
  `id_item_fatura` int NOT NULL,
  `id_fatura` int NOT NULL,
  `id_consulta` int NOT NULL,
  `id_procedimento` int NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor_cobrado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL,
  `id_fatura` int NOT NULL,
  `data_pagamento` datetime DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  `forma_pagamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescricao`
--

CREATE TABLE `prescricao` (
  `id_recisao` int NOT NULL,
  `id_consulta` int NOT NULL,
  `medicamento` varchar(100) DEFAULT NULL,
  `dosagem` varchar(100) DEFAULT NULL,
  `modo_de_uso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedimento`
--

CREATE TABLE `procedimento` (
  `id_procedimento` int NOT NULL,
  `id_consulta` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id_tutor` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacina`
--

CREATE TABLE `vacina` (
  `id_vacina` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `dias_entre_doses` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario`
--

CREATE TABLE `veterinario` (
  `id_veterinario` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `veterinario_especialidade`
--

CREATE TABLE `veterinario_especialidade` (
  `id_veterinario_especialidade` int NOT NULL,
  `id_veterinario` int DEFAULT NULL,
  `id_especialidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id_agendamento`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indexes for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD PRIMARY KEY (`id_aplicacao`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_vacina` (`id_vacina`),
  ADD KEY `id_veterinario` (`id_veterinario`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indexes for table `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Indexes for table `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`id_exame`);

--
-- Indexes for table `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id_fatura`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indexes for table `item_fatura`
--
ALTER TABLE `item_fatura`
  ADD PRIMARY KEY (`id_item_fatura`),
  ADD KEY `id_fatura` (`id_fatura`),
  ADD KEY `id_consulta` (`id_consulta`),
  ADD KEY `id_procedimento` (`id_procedimento`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_fatura` (`id_fatura`);

--
-- Indexes for table `prescricao`
--
ALTER TABLE `prescricao`
  ADD PRIMARY KEY (`id_recisao`),
  ADD KEY `id_consulta` (`id_consulta`);

--
-- Indexes for table `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`id_procedimento`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`id_vacina`);

--
-- Indexes for table `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id_veterinario`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD PRIMARY KEY (`id_veterinario_especialidade`),
  ADD KEY `id_veterinario` (`id_veterinario`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id_agendamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  MODIFY `id_aplicacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exame`
--
ALTER TABLE `exame`
  MODIFY `id_exame` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id_fatura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_fatura`
--
ALTER TABLE `item_fatura`
  MODIFY `id_item_fatura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescricao`
--
ALTER TABLE `prescricao`
  MODIFY `id_recisao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `id_procedimento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id_tutor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacina`
--
ALTER TABLE `vacina`
  MODIFY `id_vacina` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id_veterinario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  MODIFY `id_veterinario_especialidade` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`);

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Constraints for table `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD CONSTRAINT `aplicacao_vacina_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_2` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id_vacina`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`);

--
-- Constraints for table `fatura`
--
ALTER TABLE `fatura`
  ADD CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`);

--
-- Constraints for table `item_fatura`
--
ALTER TABLE `item_fatura`
  ADD CONSTRAINT `item_fatura_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id_fatura`),
  ADD CONSTRAINT `item_fatura_ibfk_2` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
  ADD CONSTRAINT `item_fatura_ibfk_3` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`);

--
-- Constraints for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_fatura`) REFERENCES `fatura` (`id_fatura`);

--
-- Constraints for table `prescricao`
--
ALTER TABLE `prescricao`
  ADD CONSTRAINT `prescricao_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`);

--
-- Constraints for table `veterinario_especialidade`
--
ALTER TABLE `veterinario_especialidade`
  ADD CONSTRAINT `veterinario_especialidade_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`),
  ADD CONSTRAINT `veterinario_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
