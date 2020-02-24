# EXECUTER TOUTES LES COMMANDES AVANT CHAQUE EXECUTION DU PROGRAME POUR ANULER LES MODIFICATIONS PRESCEDENTES.

DROP DATABASE `peri_hugo` ;
CREATE DATABASE `peri_hugo` ;
#CREATE USER escapade  IDENTIFIED BY PASSWORD 'esilv'; NE FONCTIONNE PAS ...
 
USE `peri_hugo` ;
-- -----------------------------------------------------
-- Table `Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Client` (
  `idClient` VARCHAR(15) NOT NULL,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `adresse` VARCHAR(50) NULL,
  `email` VARCHAR(50) NULL,
  `num_tel` VARCHAR(20) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Parking`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Parking` (
  `idParking` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `adresse` VARCHAR(100) NULL,
  PRIMARY KEY (`idParking`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Controleur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Controleur` (
  `idControleur` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  PRIMARY KEY (`idControleur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Voiture`
-- -----------------------------------------------------
CREATE TABLE  `Voiture` (
  `idVoiture` VARCHAR(20) NOT NULL,
  `num_place` VARCHAR(2) NULL,
  `marque` VARCHAR(25) NULL,
  `model` VARCHAR(45) NULL,
  `etat_location` VARCHAR(45) NULL,
  `Parking_idParking` INT NOT NULL,
  `Controleur_idControleur` INT NOT NULL,
  PRIMARY KEY (`idVoiture`, `Parking_idParking`, `Controleur_idControleur`),
  INDEX `fk_Voiture_Parking1_idx` (`Parking_idParking` ASC),
  INDEX `fk_Voiture_Controleur1_idx` (`Controleur_idControleur` ASC),
  CONSTRAINT `fk_Voiture_Parking1`
    FOREIGN KEY (`Parking_idParking`)
    REFERENCES `Parking` (`idParking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voiture_Controleur1`
    FOREIGN KEY (`Controleur_idControleur`)
    REFERENCES `Controleur` (`idControleur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Logement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Logement` (
  `adresse` VARCHAR(20) NOT NULL,
  `nom_etablissement` VARCHAR(45) NULL,
  PRIMARY KEY (`adresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Theme` (
  `nomTheme` VARCHAR(3) NOT NULL,
  `departement` INT NULL,
  PRIMARY KEY (`nomTheme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sejour`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sejour` (
  `statut` VARCHAR(25) NOT NULL,
  `idSejour` VARCHAR(25) NOT NULL,
  `date` VARCHAR(45) NULL,
  `note` INT NULL,
  `commentaire_sejour` VARCHAR(100) NULL,
  `Voiture_idVoiture` VARCHAR(20) NOT NULL,
  `Logement_adresse` VARCHAR(20) NOT NULL,
  `Client_idClient` VARCHAR(15) NOT NULL,
  `Theme_nomTheme` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`statut`,`idSejour`, `Voiture_idVoiture`, `Logement_adresse`, `Client_idClient`, `Theme_nomTheme`),
  INDEX `fk_Sejour_Voiture1_idx` (`Voiture_idVoiture` ASC),
  INDEX `fk_Sejour_Logement1_idx` (`Logement_adresse` ASC),
  INDEX `fk_Sejour_Client1_idx` (`Client_idClient` ASC),
  INDEX `fk_Sejour_Theme1_idx` (`Theme_nomTheme` ASC),
  CONSTRAINT `fk_Sejour_Voiture1`
    FOREIGN KEY (`Voiture_idVoiture`)
    REFERENCES `Voiture` (`idVoiture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sejour_Logement1`
    FOREIGN KEY (`Logement_adresse`)
    REFERENCES `Logement` (`adresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sejour_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sejour_Theme1`
    FOREIGN KEY (`Theme_nomTheme`)
    REFERENCES `Theme` (`nomTheme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Maintenance` (
  `idMaintenance` INT NOT NULL,
  `motif_maintenance` VARCHAR(45) NULL,
  `modification_par_controleur` VARCHAR(200) NULL,
  `Voiture_idVoiture` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idMaintenance`, `Voiture_idVoiture`),
  INDEX `fk_Maintenance_Voiture1_idx` (`Voiture_idVoiture` ASC),
  CONSTRAINT `fk_Maintenance_Voiture1`
    FOREIGN KEY (`Voiture_idVoiture`)
    REFERENCES `Voiture` (`idVoiture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;









# Peuplement Client :
INSERT INTO `Client` (`idClient`,`nom`,`prenom`,`adresse`,`email`,`num_tel`) VALUES 
("QOZ30GVG9TK","Nasim","Lane","1221 Odio St.","sapien.molestie@Pellentesquehabitantmorbi.org","06 33 17 44 64"),
("QTP17SWC7LO","Nigel","Lang","664-5650 Non Avenue","luctus@Fusce.co.uk","06 96 53 98 29"),
("JTS96KPG2GC","Casey","Newton","Ap #883-2797 Ac, Ave","tellus.Nunc.lectus@interdumNunc.com","06 93 76 71 21"),
("CDC00KZF1HX","Abel","Wolfe","P.O. Box 529, 4011 Tempus Ave","euismod@iaculisnec.co.uk","06 63 55 45 65"),
("USV71WIB4DP","Orla","Riggs","5650 Semper St.","sed@Sedauctor.org","06 68 65 77 77"),
("EHQ06GLN8SQ","Akeem","Stokes","P.O. Box 816, 6150 Phasellus Ave","In.at.pede@purus.com","06 46 41 07 37"),
("SPT22ENW7VC","Kim","Stone","Ap #222-2411 Donec Av.","tempor@rhoncusProin.net","06 59 42 10 50"),
("KZK40AJM7ET","Ashely","Johnson","P.O. Box 882, 6410 Iaculis, Ave","Donec.elementum@Donectincidunt.com","06 60 55 14 51"),
("ASW84QJJ2SX","Aristotle","Fuentes","659-6609 Nulla Ave","lorem@Suspendissealiquetmolestie.co.uk","06 81 06 09 84"),
("YYO27OQM4JW","Brynn","Moses","673-7868 Dui Road","non.luctus@Morbi.ca","06 45 87 04 03");

# Peuplement Parking
INSERT INTO `Parking` (`idParking`,`nom`,`adresse`) VALUES 
("75001","Rivoli","2 Rue Boucher 75001 Paris"),
("75002","Rivoli","2 Rue Boucher 75002 Paris"),
("75003","Beaubourg","31 Rue Beaubourg 75003 Paris"),
("75004","Lobau","4 rue Lobau 75004 Paris"),
("75005","Soufflot","22 Rue Soufflot75005 Paris"),
("75006","Jardin des plantes","25 Rue Geoffroy-Saint-Hilaire 75006 Paris"),
("75007","Maubourg","45 Quai d'Orsay 75007 Paris"),
("75008","Champs-Elysées","77 Avenue Marceau 75008 Paris"),
("75009","Pigalle","10 rue jean-baptiste Pigalle 75009 Paris"),
("75010","Lariboisière","1 bis Rue Ambroise Paré 75010 Paris"),
("75011","Oberkampf","11 Rue Ternaux 75011 Paris"),
("75012","Gare de Lyon","6 rue de Rambouillet 75012 Paris"),
("75013","Italie","25 rue Stephen Pichon 75013 Paris"),
("75014","Raspail","120 Boulevard du Montparnasse 75014 Paris"),
("75015","Beaugrenelle ","5 quai Andre citroen 75015 Paris"),
("75016","Victor Hugo","74 Avenue Victor Hugo 75016 Paris"),
("75017","Ternes","38 Avenue des Ternes 75017 Paris"),
("75018","Stalingrad ","13 rue d'AUbervillier 75018 Paris"),
("75019","Philharmonie","185 Boulevard Sérurier 75019 Paris"),
("75020","Rosa Parks","157 boulevard Macdonald 75020 Paris"),
("94310","Orly","Orly Airport 94310 Orly"),
("95700","Roissy","Roissy Airport 95700 Roissy en France");


# Peuplement Controleurs
INSERT INTO `controleur`(`idControleur`,`nom`,`prenom`) VALUES
("1","Perret","Michel"),
("2","Bichat","Luise"),
("3","Ledore","Bernard");

# Peuplement Voiture
INSERT INTO `Voiture` (`idVoiture`,`num_place`,`marque`,`model`,`etat_location`,`Parking_idParking`,`Controleur_idControleur`) VALUES ("Z9P 2S9","A2","Acura","Cabriolet 2 places","En Maintenance","75002","2"),("H9Y 3C9","1A","Audi","Cabriolet 2 places","Disponible","75010","1"),("E8T 7U0","A4","Kia Motors","Berline 4 places","Disponible","75003","1"),("H1C 2M3","A0","Mazda","Berline 4 places","En cours d'utilisation","75017","1"),("M9R 2X0","A5","BMW","Cabriolet 2 places","A verifier par controleur","75010","2"),("R0J 5N0","A6","Smart","Cabriolet 2 places","Disponible","75010","1"),("B8M 2O8","A5","FAW","Cabriolet 2 places","Disponible","75006","3"),("P9Q 1F1","A4","Daihatsu","Cabriolet 2 places","Disponible","75012","1"),("M6P 8X9","1A","Dongfeng Motor","Berline 4 places","Disponible","75003","1"),("Z1C 3T5","A0","JLR","Berline 4 places","A verifier par controleur","94310","1");
INSERT INTO `Voiture` (`idVoiture`,`num_place`,`marque`,`model`,`etat_location`,`Parking_idParking`,`Controleur_idControleur`) VALUES ("A4X 0O2","A6","Chevrolet","Berline 4 places","A verifier par controleur","75009","3"),("I4N 4A9","A3","Audi","Berline 4 places","A verifier par controleur","75008","3"),("G8C 0F2","A0","Daimler","Cabriolet 2 places","Disponible","75017","2"),("M2J 0H7","A5","Kenworth","Cabriolet 2 places","A verifier par controleur","75009","1"),("M3Y 3W2","A8","Porsche","Cabriolet 2 places","Disponible","75011","3"),("P9P 2M3","A6","Renault","Berline 4 places","A verifier par controleur","75015","1"),("A5R 5E1","A5","Daihatsu","Cabriolet 2 places","A verifier par controleur","75019","3"),("G0E 2G5","A5","Kia Motors","Berline 4 places","A verifier par controleur","75014","2"),("G2Q 3W3","A3","FAW","Berline 4 places","Disponible","75014","1"),("E9Q 0E3","1A","Lexus","Cabriolet 2 places","Disponible","75007","2");
INSERT INTO `Voiture` (`idVoiture`,`num_place`,`marque`,`model`,`etat_location`,`Parking_idParking`,`Controleur_idControleur`) VALUES ("T8S 4Z2","A8","Mazda","Berline 4 places","Disponible","75005","3"),("M4Q 1W8","A8","RAM Trucks","Berline 4 places","A verifier par controleur","95700","2"),("H0I 1E1","A2","Cadillac","Cabriolet 2 places","Disponible","75015","3"),("F8Q 3V3","A0","Hyundai Motors","Cabriolet 2 places","A verifier par controleur","75009","1"),("Z4V 7T6","A2","Tata Motors","Berline 4 places","Disponible","75001","2"),("T2Z 4Z5","A6","Honda","Cabriolet 2 places","En cours d'utilisation","75014","1"),("X5S 6K1","A2","Dacia","Berline 4 places","A verifier par controleur","75001","1"),("E2U 9G6","A6","MINI","Berline 4 places","A verifier par controleur","75017","2"),("Q5W 7J0","1A","Chevrolet","Cabriolet 2 places","A verifier par controleur","75010","1"),("M0R 3Y8","A9","Mitsubishi Motors","Cabriolet 2 places","Disponible","75002","2");
INSERT INTO `Voiture` (`idVoiture`,`num_place`,`marque`,`model`,`etat_location`,`Parking_idParking`,`Controleur_idControleur`) VALUES ("K8J 8C9","A0","Suzuki","Cabriolet 2 places","A verifier par controleur","75005","3"),("P7P 2V3","A3","FAW","Berline 4 places","En Maintenance","94310","1"),("N3F 8W9","A2","Daimler","Berline 4 places","Disponible","75003","2"),("N7R 8I2","1A","Chrysler","Berline 4 places","En cours d'utilisation","75019","3"),("A5E 2S3","A2","Daihatsu","Cabriolet 2 places","Disponible","75006","3"),("S1R 5B6","A6","Nissan","Berline 4 places","Disponible","75013","1"),("D3Q 7G2","A3","Hyundai Motors","Cabriolet 2 places","En Maintenance","75004","3"),("S2U 5A3","A9","Renault","Cabriolet 2 places","Disponible","75007","3"),("F8G 2P9","A9","Maruti Suzuki","Berline 4 places","A verifier par controleur","75009","3"),("G0G 9Q5","1A","Ford","Berline 4 places","Disponible","75006","1");

# Peuplement Logement
INSERT INTO `Logement` (`adresse`,`nom_etablissement`) VALUES ("75001","Concortel"),("75002","Concortel"),("75003","Sheraton"),("75004","Campanil"),("75005","Ibis Hotel"),("75006","Concortel"),("75007","Sheraton"),("75008","Hilton"),("75009","Grand Hotel"),("75010","Hotel Plaza Etoile"),("75011","Hilton"),("75012","Formule 1"),  ("75013","Hilton"),("75014","Campanil"),("75015","Grand Hotel"),("75016","Sheraton"),("75017","Sheraton"),("75018","Formule 1"),("75019","Formule 1"),("75020","Hotel Plaza Etoile"),("95700","Hilton"),("94310","Hilton");

# Peuplement Theme
INSERT INTO `Theme` (`nomTheme`,`departement`) VALUES 
("THE","7501"),("CUL","75002"),("FET","75003"),("MOR","75004"),("DES","75005"),("LAP","75006"),("PAL","75007"),("THX","75008"),("NOE","75009"),
("MAT","75010"),("KAS","75011"),("KOA","75012"),("TEF","75013"),("FOD","75014"),("MOD","75015"),("CRE","75016"),("LEP","75017"),("PIR","75018"),
("CAB","75019"),("MIL","75020"),("ARC","95700"),("POL","94310");

# Peuplement sejour
INSERT INTO `Sejour` (`statut`,`idSejour`,`date`,`note`,`commentaire_sejour`,`Voiture_idVoiture`,`Logement_adresse`,`Client_idClient`,`Theme_nomTheme`) VALUES 
("valide","ZLZ47YNG7OU",4,"5","Sejour genial, tranquille.","Z9P 2S9","75007","QOZ30GVG9TK","PAL"),
("valide","ZOV90UMZ9XK",11,"2","Personnel incopétent, appartement sale.","Z9P 2S9","75017","QTP17SWC7LO","LEP"),
("valide","QJW80VBQ1SP",15,"5","Magnifique séjour, je recommande.","I4N 4A9","75009","QTP17SWC7LO","NOE"),
("valide","GSP70KTS3HF",25,"4.5","Appartement spacieux et épuré.","F8Q 3V3","75020","QTP17SWC7LO","MIL");

# Peuplement maintenance
INSERT INTO `Maintenance` (`idMaintenance`,`motif_maintenance`,`modification_par_controleur`,`Voiture_idVoiture`) VALUES
("1","Freins usés","Changement des freins","Z9P 2S9"),
("2"," Batteries ","Charge des batteries","Z9P 2S9"),
("1","Pare-brise","Changement du pare-brise","P7P 2V3");