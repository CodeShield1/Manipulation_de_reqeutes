CREATE DATABASE bibliotheque;
USE bibliotheque;




CREATE TABLE rayons (
    id_rayon INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL   
);


INSERT INTO rayons (nom) VALUES
('Informatique'),
('Mathématiques'),
('Sciences'),
('Littérature'),
('Histoire'),
('Économie'),
('Philosophie');


CREATE TABLE ouvrages (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    date_publication DATE NOT NULL,
    id_rayon INT NOT NULL,
    FOREIGN KEY (id_rayon) REFERENCES rayons(id_rayon)
);


INSERT INTO ouvrages (titre, date_publication, id_rayon) VALUES
('Apprendre SQL',       '2022-01-10', 1),  
('Algorithmique',       '2019-09-01', 2), 
('Physique générale',   '2020-04-12', 3),
('Les Misérables',      '1862-01-01', 4), 
('Histoire du Maroc',   '2018-06-20', 5),
('Microéconomie',       '2021-03-11', 6), 
('Introduction à Kant', '2017-09-05', 7);







CREATE TABLE auteurs (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL
);


INSERT INTO auteurs (nom, prenom) VALUES
('Benali', 'Omar'),
('El Amrani', 'Youssef'),
('Alaoui', 'Hassan'),
('Bennani', 'Khadija'),
('Idrissi', 'Salma'),
('Fassi', 'Mehdi'),
('Zerouali', 'Nadia');


CREATE TABLE lecteurs (
    id_lecteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    CIN VARCHAR(255) NOT NULL UNIQUE);


INSERT INTO lecteurs (nom, prenom, telephone, email, CIN) VALUES
('alae', 'Omar', '0612345678', 'omar@gmail.com', 'AA111111'),
('Alaoui', 'Hassan', '0623456789', 'hassan@gmail.com', 'BB222222'),
('Idrissi', 'Salma', '0634567890', 'salma@gmail.com', 'CC333333'),
('Bennani', 'Khadija', '0645678901', 'khadija@gmail.com', 'DD444444'),
('Fassi', 'Mehdi', '0656789012', 'mehdi@gmail.com', 'EE555555'),
('Zerouali', 'Nadia', '0667890123', 'nadia@gmail.com', 'FF666666'),
('El Amrani', 'Youssef', '0678901234', 'youssef@gmail.com', 'GG777777');
 



CREATE TABLE auteurs_ouvrages (
    id_auteur INT NOT NULL,
    id_ouvrage INT NOT NULL,
    PRIMARY KEY (id_auteur, id_ouvrage),
    FOREIGN KEY (id_auteur) REFERENCES auteurs(id_auteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrages(id_ouvrage)
);


INSERT INTO auteurs_ouvrages (id_auteur, id_ouvrage) VALUES
(1, 1),
(1, 2),
(2, 1), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7); 



CREATE TABLE emprunts (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_lecteur INT NOT NULL,
    id_ouvrage INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevu DATE , 
    date_retour_reelle DATE,
    FOREIGN KEY (id_lecteur) REFERENCES lecteurs(id_lecteur),
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrages(id_ouvrage)
);







INSERT INTO emprunts
(id_lecteur, id_ouvrage, date_emprunt, date_retour_prevu, date_retour_reelle)
VALUES
(1, 3, '2024-01-05', '2024-01-15', '2024-01-14'),
(2, 1, '2024-01-12', '2024-01-22', NULL),
(3, 5, '2024-02-01', '2024-02-10', '2024-02-09'),
(4, 2, '2024-02-08', '2024-02-18', NULL),
(5, 7, '2024-02-20', '2024-03-01', '2024-02-28'),
(6, 4, '2024-03-05', '2024-03-15', NULL),
(7, 6, '2024-03-18', '2024-03-28', '2024-03-27');

SELECT * FROM emprunts;

CREATE TABLE personnel (
    id_personnel INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    id_chef INT NULL,
    FOREIGN KEY (id_chef) REFERENCES personnel(id_personnel)
);









SELECT * FROM rayons;


SELECT nom , prenom FROM auteurs ;


SELECT titre , date_publication FROM ouvrages;


SELECT nom , prenom , email FROM lecteurs;


SELECT date_publication 
FROM ouvrages 
WHERE date_publication>'1862-01-01';


SELECT nom FROM auteurs 
WHERE nom LIKE 'B%';


SELECT date_publication 
FROM ouvrages
ORDER BY date_publication DESC;



SELECT id_ouvrage, date_retour_prevu 
FROM emprunts
WHERE date_retour_reelle IS NULL; 



SELECT ouvrages.id_ouvrage, ouvrages.titre, rayons.nom 
FROM ouvrages
INNER JOIN rayons ON ouvrages.id_rayon = rayons.id_rayon;


SELECT   ouvrages.titre , lecteurs.nom , lecteurs.prenom
FROM emprunts
INNER JOIN ouvrages ON emprunts.id_ouvrage = ouvrages.id_ouvrage
INNER JOIN lecteurs ON emprunts.id_lecteur = lecteurs.id_lecteur;



SELECT  nom
FROM lecteurs 
WHERE EXISTS (
    SELECT 1
     FROM emprunts 
    WHERE emprunts.id_lecteur = lecteurs.id_lecteur
);



SELECT id_rayon, COUNT(id_ouvrage) AS nb_ouvrages
FROM ouvrages
GROUP BY id_rayon;













SELECT * FROM Lecteurs;


SHOW TABLES;
