CREATE SCHEMA `light_management` ;


  
	/*utworzenie tabeli z typami żarówek*/
  CREATE TABLE `light_management`.`bulb_types` (
  `bulbTypeId` INT NOT NULL AUTO_INCREMENT,
  `bulbType` VARCHAR(45) NOT NULL,
    
   PRIMARY KEY (`bulbTypeId`)
    
  );
	/*utworzenie tabeli z typami oświetlenia*/
  CREATE TABLE `light_management`.`light_types` (
  `lightTypeId` INT NOT NULL AUTO_INCREMENT,
  `lightType` VARCHAR(45) NOT NULL,
    
   PRIMARY KEY (`lightTypeId`)
        
  );
    
      /*utworzenie tabeli z żarówkami*/
CREATE TABLE `light_management`.`bulbs` (
  `bulbId` INT NOT NULL AUTO_INCREMENT,
  `bulbName` VARCHAR(45) NOT NULL,
  `bulbDescription` VARCHAR(45) NOT NULL,
  `bulbStatus` TINYINT NOT NULL,
  `bulbTypeId` INT NOT NULL,
  `bulbPower` INT NOT NULL,
  `bulbProducer` VARCHAR(45) NOT NULL,
  
   PRIMARY KEY (`bulbId`),
   
   FOREIGN KEY (bulbTypeId) REFERENCES bulb_types(bulbTypeId)
   
   
  );
    
    /*utworzenie tabeli z oświetleniem*/
CREATE TABLE `light_management`.`lights` (
  `lightId` INT NOT NULL AUTO_INCREMENT,
  `lightName` VARCHAR(45) NOT NULL,
  `lightDescription` VARCHAR(45) NOT NULL,
  `lightStatus` TINYINT NOT NULL,
  `lightTypeId` INT NOT NULL,
  `lightProducer` VARCHAR(45) NOT NULL,
  `bulbQuantity` INT NOT NULL,
  
  PRIMARY KEY (`lightId`),
  
  FOREIGN KEY (lightTypeId) REFERENCES light_types(lightTypeId)
    
  );
    
    /*utworzenie tabeli z budynkami*/
CREATE TABLE `light_management`.`buildings` (
  `buildingId` INT NOT NULL AUTO_INCREMENT,
  `buildingName` VARCHAR(45) NOT NULL,
  `buildingDescription` VARCHAR(45) NOT NULL,
  `buildingStatus` TINYINT NOT NULL,

  `buildingAddress` VARCHAR(100) NOT NULL,
  
  `buildingDateOfCreation` DATETIME NOT NULL,
  `buildingDateOfModification` DATETIME NOT NULL,
  
   PRIMARY KEY (`buildingId`)
   
   
  );
  
/*utworzenie tabeli z pomieszczeniami*/
CREATE TABLE `light_management`.`rooms` (
  `roomId` INT NOT NULL AUTO_INCREMENT,
  `roomName` VARCHAR(45) NOT NULL,
  `roomDescription` VARCHAR(45) NOT NULL,
  `roomStatus` TINYINT NOT NULL,

  `buildingId` INT,
    
  `roomDateOfCreation` DATETIME NOT NULL,
  `roomDateOfModification` DATETIME NOT NULL,
  
  PRIMARY KEY (`roomId`),
  
  FOREIGN KEY (buildingId) REFERENCES buildings(buildingId)
  
  );
  
  /*utworzenie tabeli z punktami oświetlenia*/
CREATE TABLE `light_management`.`lightPoints` (
  `lightPointId` INT NOT NULL AUTO_INCREMENT,
  `lightPointName` VARCHAR(45) NOT NULL,
  `lightPointDescription` VARCHAR(45) NOT NULL,
  `lightPointStatus` TINYINT NOT NULL,

  `roomId` INT NOT NULL,
  `lightId` INT NOT NULL,
  `bulbId` INT NOT NULL,
    
  `lightPointDateOfCreation` DATETIME NOT NULL,
  `lightPointDateOfModification` DATETIME NOT NULL,
  
  
  PRIMARY KEY (lightPointId),
  
  FOREIGN KEY (roomId) REFERENCES rooms(roomId),
  FOREIGN KEY (lightId) REFERENCES lights(lightId),
  FOREIGN KEY (bulbId) REFERENCES bulbs(bulbId)
  
  );
  

  
  /*utworzenie tabeli z session_log*/
CREATE TABLE `light_management`.`sessionLogs` (
  `sessionLogId` INT NOT NULL AUTO_INCREMENT,
  `roomId` INT NOT NULL,
  `lightPointId` INT NOT NULL,
  
  `sessionLogDateStart` DATETIME NOT NULL,
  `sessionLogDateEnd` DATETIME NOT NULL,
  `sessionLogDuration` INT NOT NULL,
  
  PRIMARY KEY (`sessionLogId`),
  
  FOREIGN KEY (roomId) REFERENCES rooms(roomId),
  FOREIGN KEY (lightPointId) REFERENCES lightPoints(lightPointId)
  
  );
  
    	/*utworzenie tabeli z typami użytkowników*/
  CREATE TABLE `light_management`.`user_types` (
  `userTypeId` INT NOT NULL AUTO_INCREMENT,
  `userType` VARCHAR(45) NOT NULL,
  `add_user` TINYINT NOT NULL,
  `edit_userm` TINYINT NOT NULL,
  `delete_user` TINYINT NOT NULL,
  `add_building` TINYINT NOT NULL,
  `edit_building` TINYINT NOT NULL,
  `delete_building` TINYINT NOT NULL,
  `add_room` TINYINT NOT NULL,
  `edit_room` TINYINT NOT NULL,
  `delete_room` TINYINT NOT NULL,
  `add_lightPoint` TINYINT NOT NULL,
  `edit_lightPoint` TINYINT NOT NULL,
  `delete_lightPoint` TINYINT NOT NULL,
  `control_lightPoint` TINYINT NOT NULL,
    
   PRIMARY KEY (`userTypeId`)  
   
  );

  
      /*utworzenie tabeli z uzytkownikami*/
CREATE TABLE `light_management`.`users` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `userDescription` VARCHAR(45) NOT NULL,
  `userTypeId` INT NOT NULL,
  `userStatus` TINYINT NOT NULL,
  `userLogin` VARCHAR(45) NOT NULL,
  `userPassword` VARCHAR(45) NOT NULL,
  

  `userDateOfCreation` DATETIME NOT NULL,
  `userDateOfModification` DATETIME NOT NULL,
  
   PRIMARY KEY (`userId`),
   
   FOREIGN KEY (userTypeId) REFERENCES user_types(userTypeId)
  );

  
  USE light_management;

insert into bulb_types (bulbType)
                        
VALUES
('Żarówki LED'),
('Świetlówki LED'),
('Świetlówki'),
('Lampy halogenowe'),
('Świetlówki kompaktowe'),
('Lampy wyładowcze'),
('Żarówki LED Spots'),
('Żarówki LED kapsułkowe'),
('Led Panel'),
('Led punktowy');

insert into light_types (lightType)

VALUES
('Sufitowe'),
('Wiszące'),
('Żyrandole'),
('Kinkiety'),
('Podłogowe'),
('Stołowe'),
('Biurkowe'),
('Elewacyjne'),
('Ogrodowe'),
('Słupki oświetleniowe');

insert into bulbs (bulbName, 
						bulbDescription, 
                        bulbStatus, 
                        bulbTypeId, 
                        bulbPower, 
                        bulbProducer)
                        
VALUES
('CorePro LEDspot MV GU10 827 25W','Bardzo Ciepła Biel',true,1,25,'Philips'),
('CorePro LEDspot MV GU10 830 25W','Ciepła Biel',true,1,25,'Philips'),
('CorePro LEDspot MV GU10 840 25W','Zimna Biel',true,1,25,'Philips'),
('CorePro LEDspot MV GU10 827 60W','Bardzo Ciepła Biel',true,1,60,'Philips'),
('CorePro LEDspot MV GU10 830 60W','Ciepła Biel',true,1,60,'Philips'),
('CorePro LEDspot MV GU10 840 60W','Zimna Biel',true,1,60,'Philips'),
('SubstiTUBE Advanced UO EM 830 120cm 22W','Ciepła biel',true,2,22,'Osram'),
('SubstiTUBE Advanced UO EM 840 120cm 22W','Zimna biel',true,2,22,'Osram'),
('SubstiTUBE Advanced UO EM 865 120cm 22W','Światło Dzienne',true,2,22,'Osram'),
('SubstiTUBE Advanced UO EM 830 150cm 22W','Ciepła biel',true,2,22,'Osram'),
('SubstiTUBE Advanced UO EM 840 150cm 22W','Zimna biel',true,2,22,'Osram'),
('SubstiTUBE Advanced UO EM 865 150cm 22W','Światło Dzienne',true,2,22,'Osram');

insert into lights (lightName,
					lightDescription,
					lightStatus,
					lightTypeId,
					lightProducer,
					bulbQuantity)

VALUES
('Lampa sufitowa 5','Kryształowa',true,1,'Zuma Line',5),
('Lampa sufitowa 3','Kryształowa',true,1,'Zuma Line',3),
('Lampa wisząca 7','Kryształowa',true,2,'Zuma Line',7),
('Lampa wisząca 5','Kryształowa',true,2,'Zuma Line',5),
('Żyrandol DIANA 7','Metalowy stelaż',true,3,'TK Lighting',7),
('Żyrandol DIANA 5','Metalowy stelaż',true,3,'TK Lighting',5),
('Żyrandol GRACIA 8','Czarny stelaż',true,3,'Paul Neuhaus',8),
('Żyrandol GRACIA 6','Czarny stelaż',true,3,'Paul Neuhaus',6),
('Kinkiet DIAMOND ','Metalowy stelaż',true,4,'TK Lighting',1),
('Lampa podłogowa ALICE GOLD','Wędka',true,5,'Nowodvorski',1),
('Lampa stołowa GENOVA','Zielone szkło',true,6,'4 Concepts',1),
('Lampa biurkowa TOLOMEO MICRO','Czarne Amelinium',true,7,'ARTEMIDE',1);



insert into buildings (buildingName, 
							buildingDescription, 
							buildingStatus, 
                            buildingAddress,
                            buildingDateOfCreation,
                            buildingDateOfModification)
	VALUES
    ('Budynek1','Budynek1 we Wrocławiu, Rynek 1 ',true,'Wrocław 11-111, Rynek 1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek2','Budynek2 we Wrocławiu, Rynek 2',true,'Wrocław 22-222, Rynek 2',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek3','Budynek3 we Wrocławiu, Rynek 3',true,'Wrocław 33-333, Rynek 3',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek4','Budynek4 we Wrocławiu, Rynek 4',true,'Wrocław 44-444, Rynek 4',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek5','Budynek5 we Wrocławiu, Rynek 5',true,'Wrocław 55-555, Rynek 5',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek6','Budynek6 we Wrocławiu, Rynek 6',true,'Wrocław 66-666, Rynek 6',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek7','Budynek7 we Wrocławiu, Rynek 7',true,'Wrocław 77-777, Rynek 7',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek8','Budynek8 we Wrocławiu, Rynek 8',true,'Wrocław 88-888, Rynek 8',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek9','Budynek9 we Wrocławiu, Rynek 9',true,'Wrocław 99-999, Rynek 9',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
    ('Budynek10','Budynek10 we Wrocławiu, Rynek 10',true,'Wrocław 10-100, Rynek 10',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    

INSERT INTO rooms (roomName, 
						roomDescription, 
                        roomStatus, 
                        buildingId, 
						roomDateOfCreation,
						roomDateOfModification)
  
  VALUES 
  ('Przedpokój','Przedpokój w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Toaleta','Toaleta w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Łazienka','Łazienka w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Kuchnia','Kuchnia w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Jadalnia','Jadalnia w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Salon','Salon w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Sypialnia','Sypialnia w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Gabinet','Gabinet w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Pokój1','Pokój1 w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
  ('Pokój2','Pokój2 w Budynek1',true,'1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
  
  
insert into lightPoints (lightPointName,
						lightPointDescription,
						lightPointStatus,
						roomId,
						lightId,
						bulbId,
						lightPointDateOfCreation,
						lightPointDateOfModification)
						
VALUES
('Lampa w przedpokoju','Sufitowa',true,1,1,6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Kinkiet w przedpokoju','Koło lustra',true,1,9,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Kinkiet w toalecie','Kinkiet',true,2,9,5,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampa w Łazience','Sufitowa',true,3,2,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampa w Kuchni','Sufitowa',true,4,4,2,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Żyrandol w jadalni','Nad stołem',true,5,5,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Żyrandol w salonie','Nad ławą',true,6,7,2,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Kinkiet lewy w salonie','Po lewej od telewizora',true,6,9,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Kinkiet prawy w salonie','Po prawej od telewizora',true,6,9,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Żyrandol w sypialni','Nad Łóżkiem',true,7,8,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampka nocna lewa w sypialni','Po lewej od łóżka',true,7,11,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampka nocna prawa w sypialni','Po prawej od łóżka',true,7,11,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampa biurkowa w gabinecie','Na biurku',true,8,12,6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampa podłogowa w gabinecie','Obok biurka',true,8,10,6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Lampa sufitowa w gabinecie','Na suficie',true,8,1,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);


insert into sessionLogs (roomId,
						lightPointId,
						sessionLogDateStart,
						sessionLogDateEnd,
						sessionLogDuration)
						
VALUES
(1,1,CURRENT_TIMESTAMP,ADDTIME(CURRENT_TIMESTAMP,10),10),
(1,2,ADDTIME(CURRENT_TIMESTAMP,5),ADDTIME(CURRENT_TIMESTAMP,15),10),
(2,3,ADDTIME(CURRENT_TIMESTAMP,7),ADDTIME(CURRENT_TIMESTAMP,27),20),
(3,4,ADDTIME(CURRENT_TIMESTAMP,9),ADDTIME(CURRENT_TIMESTAMP,19),10),
(4,5,ADDTIME(CURRENT_TIMESTAMP,11),ADDTIME(CURRENT_TIMESTAMP,31),20),
(5,6,ADDTIME(CURRENT_TIMESTAMP,13),ADDTIME(CURRENT_TIMESTAMP,48),25),
(6,7,ADDTIME(CURRENT_TIMESTAMP,15),ADDTIME(CURRENT_TIMESTAMP,55),40),
(6,8,ADDTIME(CURRENT_TIMESTAMP,17),ADDTIME(CURRENT_TIMESTAMP,57),40),
(6,9,ADDTIME(CURRENT_TIMESTAMP,19),ADDTIME(CURRENT_TIMESTAMP,59),40),
(7,10,ADDTIME(CURRENT_TIMESTAMP,21),ADDTIME(CURRENT_TIMESTAMP,36),15);


insert into user_types (userType,
						add_user,
						edit_userm,
						delete_user,
						add_building,
						edit_building,
						delete_building,
						add_room,
						edit_room,
						delete_room,
						add_lightPoint,
						edit_lightPoint,
						delete_lightPoint,
						control_lightPoint)
						
VALUES
('Administrator',true,true,true,true,true,true,true,true,true,true,true,true,true),
('Building Administrator',false,false,false,true,true,true,true,true,true,true,true,true,true),
('Room Administrator',false,false,false,false,false,false,true,true,true,true,true,true,true),
('LightPoint Administrator',false,false,false,false,false,false,false,false,false,true,true,true,true),
('User Administrator',true,true,true,false,false,false,false,false,false,false,false,false,false),
('Limited Administrator',true,true,false,true,true,false,true,true,false,true,true,false,true),
('Super User',true,true,true,false,false,false,true,true,true,true,true,true,true),
('Advanced User',true,true,false,false,false,false,true,true,false,true,true,false,true),
('Limited User',false,false,false,false,false,false,true,false,false,true,false,false,true),
('Control User',false,false,false,false,false,false,false,false,false,false,false,false,true);

insert into users (userName,
					userDescription,
					userTypeId,
					userStatus,
					userLogin,
					userPassword,
					userDateOfCreation,
					userDateOfModification)
					
VALUES
('Benek','Administrator',1,true,'ben_k','haslo1',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('Jacek','Administrator',1,true,'jac_w','haslo2',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser1','Building Administrator',2,true,'test_u1','haslo3',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser2','Room Administrator',3,true,'test_u2','haslo4',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser3','LightPoint Administrator',4,true,'test_u3','haslo5',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser4','User Administrator',5,true,'test_u4','haslo6',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser5','Limited Administrator',6,true,'test_u5','haslo7',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser6','Super User',7,true,'test_u6','haslo8',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser7','Advanced User',8,true,'test_u7','haslo9',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser8','Limited User',9,true,'test_u8','haslo10',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('testuser9','Control User',10,true,'test_u9','haslo11',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
