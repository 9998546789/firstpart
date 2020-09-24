-- counterpartytest.contragent definition

CREATE TABLE `contragent` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentiis definition

CREATE TABLE `contragentiis` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentuser definition

CREATE TABLE `contragentuser` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentvis definition

CREATE TABLE `contragentvis` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentvsvn definition

CREATE TABLE `contragentvsvn` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.`group` definition

CREATE TABLE `group` (
  `Id` char(36) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragenthistoryitem definition

CREATE TABLE `contragenthistoryitem` (
  `Id` char(36) NOT NULL,
  `ContragentGroupId` char(36) NOT NULL,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Name` longtext,
  `Active` bit(1) NOT NULL,
  `Description` longtext,
  `Email` longtext,
  `IsIis` bit(1) NOT NULL DEFAULT b'0',
  `IsVis` bit(1) NOT NULL DEFAULT b'0',
  `IsVsvn` bit(1) NOT NULL DEFAULT b'0',
  `SendNotifications` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_ContragentHistoryItem_ContragentGroupId` (`ContragentGroupId`),
  KEY `IX_ContragentHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  CONSTRAINT `FK_ContragentHistoryItem_Contragent_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `contragent` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ContragentHistoryItem_Group_ContragentGroupId` FOREIGN KEY (`ContragentGroupId`) REFERENCES `group` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentiishistoryitem definition

CREATE TABLE `contragentiishistoryitem` (
  `Id` char(36) NOT NULL,
  `IpAddress` longtext,
  `WebAddress` longtext,
  `Comment` longtext,
  `ContragentId` char(36) NOT NULL,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ContragentIisHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  KEY `IX_ContragentIisHistoryItem_ContragentId` (`ContragentId`),
  CONSTRAINT `FK_ContragentIisHistoryItem_Contragent_ContragentId` FOREIGN KEY (`ContragentId`) REFERENCES `contragent` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ContragentIisHistoryItem_ContragentIis_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `contragentiis` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentuserhistoryitem definition

CREATE TABLE `contragentuserhistoryitem` (
  `Id` char(36) NOT NULL,
  `FullName` longtext,
  `CompanyGuid` char(36) NOT NULL,
  `Position` longtext,
  `Phone` longtext,
  `Email` longtext,
  `Comment` longtext,
  `SendNotifications` bit(1) NOT NULL,
  `ContragentId` char(36) NOT NULL,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ContragentUserHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  KEY `IX_ContragentUserHistoryItem_ContragentId` (`ContragentId`),
  CONSTRAINT `FK_ContragentUserHistoryItem_Contragent_ContragentId` FOREIGN KEY (`ContragentId`) REFERENCES `contragent` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ContragentUserHistoryItem_ContragentUser_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `contragentuser` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentvishistoryitem definition

CREATE TABLE `contragentvishistoryitem` (
  `Id` char(36) NOT NULL,
  `UserId` char(36) DEFAULT NULL,
  `UserFullName` char(36) DEFAULT NULL,
  `UserCount` int DEFAULT NULL,
  `VideoUserCount` int DEFAULT NULL,
  `LiveStreamCount` int NOT NULL,
  `LiveStreamCountPerCamera` int NOT NULL,
  `ArchiveStreamCount` int NOT NULL,
  `ArchiveStreamCountPerCamera` int NOT NULL,
  `Bandwidth` int NOT NULL,
  `IpAddress` longtext,
  `WebAddress` longtext,
  `ContragentId` char(36) NOT NULL,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ContragentVisHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  KEY `IX_ContragentVisHistoryItem_ContragentId` (`ContragentId`),
  CONSTRAINT `FK_ContragentVisHistoryItem_Contragent_ContragentId` FOREIGN KEY (`ContragentId`) REFERENCES `contragent` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ContragentVisHistoryItem_ContragentVis_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `contragentvis` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentvsvncameras definition

CREATE TABLE `contragentvsvncameras` (
  `Id` char(36) NOT NULL,
  `ContragentVsvnId` char(36) NOT NULL,
  `CameraId` char(36) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ContragentVsvnCameras_ContragentVsvnId` (`ContragentVsvnId`),
  CONSTRAINT `FK_ContragentVsvnCameras_ContragentVsvn_ContragentVsvnId` FOREIGN KEY (`ContragentVsvnId`) REFERENCES `contragentvsvn` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.contragentvsvnhistoryitem definition

CREATE TABLE `contragentvsvnhistoryitem` (
  `Id` char(36) NOT NULL,
  `Bandwidth` int NOT NULL,
  `LiveStreamCount` int NOT NULL,
  `ArchiveStreamCount` int NOT NULL,
  `ArchiveCreatingCount` int NOT NULL,
  `HasScou` bit(1) NOT NULL,
  `ContragentId` char(36) NOT NULL,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ContragentVsvnHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  KEY `IX_ContragentVsvnHistoryItem_ContragentId` (`ContragentId`),
  CONSTRAINT `FK_ContragentVsvnHistoryItem_Contragent_ContragentId` FOREIGN KEY (`ContragentId`) REFERENCES `contragent` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ContragentVsvnHistoryItem_ContragentVsvn_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `contragentvsvn` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- counterpartytest.grouphistoryitem definition

CREATE TABLE `grouphistoryitem` (
  `Id` char(36) NOT NULL,
  `UserName` longtext,
  `UserPhone` longtext,
  `UserEmail` longtext,
  `ChangeDateTimeUtc` datetime(6) NOT NULL,
  `AggregateId` char(36) NOT NULL,
  `UserGuid` char(36) NOT NULL,
  `Name` longtext,
  `Active` bit(1) NOT NULL,
  `Description` longtext,
  `ParentId` char(36) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_GroupHistoryItem_AggregateId` (`AggregateId`),
  KEY `IX_ChangeDateTimeUtc` (`ChangeDateTimeUtc`),
  KEY `IX_GroupHistoryItem_ParentId` (`ParentId`),
  CONSTRAINT `FK_GroupHistoryItem_Group_AggregateId` FOREIGN KEY (`AggregateId`) REFERENCES `group` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_GroupHistoryItem_Group_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `group` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;