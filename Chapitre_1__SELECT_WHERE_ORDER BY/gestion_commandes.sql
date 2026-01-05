CREATE DATABASE gestion_commandes;
USE gestion_commandes;

CREATE TABLE clients (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date_creation DATE NOT NULL
);



INSERT INTO clients (nom, date_creation) VALUES
('Ahmed', '2023-02-10'),
('Yassine', '2024-08-05'),
('Salma', '2022-12-20'),
('Mohamed', '2023-03-15'),
('Fatima', '2023-04-25'),
('Ali', '2023-04-10'),
('Nadia', '2023-06-20'),
('Hassan', '2023-05-10'),
('Layla', '2023-08-15'),
('Youssef', '2023-10-25');

CREATE TABLE commandes (
    id_commande INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    date_commande DATE NOT NULL,

    FOREIGN KEY (id_client) REFERENCES clients(id_client)
);

INSERT INTO commandes (id_client, date_commande) VALUES
(1, '2024-02-01'),
(2, '2023-12-15'),
(3, '2024-03-10'),
(4, '2023-01-20'),
(5, '2023-10-10'),
(6, '2023-09-15'),
(7, '2023-07-20'),
(8, '2023-04-10'),
(9, '2023-09-15');


CREATE TABLE paiements (
    id_paiement INT AUTO_INCREMENT PRIMARY KEY,
    id_commande INT NOT NULL,
    date_paiement DATE NOT NULL,
    montant DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_commande) REFERENCES commandes(id_commande)
);

INSERT INTO paiements (id_commande, date_paiement, montant) VALUES
(1, '2024-02-02', 250.00),
(2, '2023-12-16', 150.00),
(3, '2024-03-11', 300.00);

SELECT * FROM clients
ORDER BY date_creation ASC;

WHERE date_creation >= '2023-04-01';
LIMIT 1;



