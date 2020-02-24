# 1. Liste des clients (par numéro de client) 
SELECT * FROM Client ORDER BY idClient ;

# 2. Saisie d'un nouveau client 
INSERT INTO `ESCAPADE`.`Client` (`idClient`,`nom`,`prenom`,`adresse`,`email`,`num_tel`) 
VALUES ("BSS90ROP3SR","Mathilde","Fauchoing","249-9923 A Av.","mathilde@Sedauctor.edu","07 23 79 58 10") ;

# 3. Liste des voitures, de leur position et de leur disponibilité
SELECT v.marque, v.model, v.etat_location ,v.num_place, p.adresse
FROM Voiture v JOIN Parking p ON v.Parking_idParking = p.idParking ;

# 4. Sélection d'une voiture disponible dans un arrondissement 
SELECT * from Voiture v JOIN Parking p ON v.Parking_idParking = p.idParking 
		  WHERE p.adresse LIKE '%75007%' AND v.etat_location LIKE '%Disponible%';
          
# 5. Requête de mise à jour de la place de parking d'un véhicule identifié par son immatriculation 
UPDATE Voiture SET num_place = 'A2'
	WHERE idVoiture = "E9Q 0E3" ;

# 6. Combien d'opérations de maintenance sur une voiture identifiée par son immatriculation ?
SELECT count(*) from maintenance m JOIN voiture v ON m.Voiture_idVoiture = v.idVoiture;

# 7. Enregistrement du retour d'une voiture 
UPDATE Voiture SET num_place = 'A9' WHERE idVoiture = "N7R 8I2" ; #changement numero de place
UPDATE Voiture SET etat_location = 'A verifier par controleur' WHERE idVoiture = "N7R 8I2" ; #changement etat de la voiture

# 8. Nombre de voitures contrôlées par chacun des contrôleurs 
SELECT Controleur_idControleur, count(*) FROM Voiture  GROUP BY Controleur_idControleur ;

# 9. Liste des voitures indisponible et du motif correspondant 
SELECT v.idVoiture, v.etat_location, m.motif_maintenance from Voiture v JOIN Maintenance m ON m.Voiture_idVoiture = v.idVoiture;

# 10. Enregistrement d'une opération de maintenance par un des contrôleurs sur une voiture identifiée par son immatriculation
INSERT INTO `Maintenance` (`idMaintenance`,`motif_maintenance`,`modification_par_controleur`,`Voiture_idVoiture`) VALUES
("1","Poignée cassée","Changement de toutes les poignets","M2J 0H7");
UPDATE Voiture SET etat_location = 'En maintenance' WHERE idVoiture = "M2J 0H7" ; #changement etat de la voiture



# - Fin -