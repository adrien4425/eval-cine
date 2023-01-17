-- creation des différentes tables 

CREATE TABLE admin (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    id_user int(10) not null,
    FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE TABLE client (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    nom VARCHAR(50) not NULL,
    prenom varchar(50) not NULL,
    date_de_naissance DATE not null,
    id_tarif int(10) not null,
    id_user int(10) null,
    FOREIGN KEY (id_tarif) REFERENCES tarif (id),
    FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE TABLE user (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    adresse varchar(250) not null,
    email varchar(256) not null,
    identifiant varchar(50) not null,
    mot_de_passe varchar(50) not null
);

CREATE TABLE cinema (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    nom VARCHAR(50) not NULL,
    adresse varchar(250) not null,
    contactmail varchar(250) not null,
    contactphone varchar(20) not null
);

CREATE TABLE film (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    nom VARCHAR(50) not NULL,
    durée TIME not null,
    réalisateur varchar(50) not null,
    date_de_sortie DATE not null,
    description text(2000) not null,
    id_genre int(10) not null,
    FOREIGN KEY (id_genre) REFERENCES genre (id)
);

CREATE TABLE reservation (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    id_client int(10) not null,
    id_seance int(10) not null,
    FOREIGN KEY (id_seance) REFERENCES seance (id)
);

CREATE TABLE tarif (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    status varchar(50) not null,
    prix varchar(5) not null
);

CREATE TABLE salle (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    numero_salle int(10) not null,
    nbplace_total int(10) not null,
    id_cinema int(10) not null,
    FOREIGN KEY (id_cinema) REFERENCES cinema (id)
);

CREATE TABLE seance (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    id_film int(10) not null,
    id_salle int(10) not null,
    date DATETIME not null,
    FOREIGN KEY (id_film) REFERENCES film (id),
    FOREIGN KEY (id_salle) REFERENCES salle (id)
);

CREATE TABLE genre (
    id INTEGER primary key AUTOINCREMENT NOT NULL,
    genre varchar(50) not null
);

--remplissage des tables avec des valeurs factisses

INSERT INTO admin (id_user)
VALUES ('1'),('2'),('3'),('4');

INSERT INTO client (nom,prenom,date_de_naissance,id_tarif,id_user)
VALUES ('porto','fabrice','1986-05-23','1','5'),
('peltier','adrien','2001-05-01','2',''),
('debrave','pierot','2011-02-28','3',''),
('courget','jeanne','1995-11-03','1','6');

INSERT INTO user (adresse,email,identifiant,mot_de_passe)
VALUES ('Villa Primerose - Parc Bordelais - Caudéran 33200 Bordeaux','adminbordeaux@orange.fr','bordadmin332','dtv567@admin'),
('32 Rue de la Feyssine, 69100 Villeurbanne','adminlyon@orange.fr','lyoadmin691','jeyh@543@admin'),
('57-45 Bd Eugène Orieux, 44300 Nantes','adminnantes@orange.fr','nanadmin443','ugsdf76Z@admin'),
('2 Imp. de la Terrasse, 31500 Toulouse','admintoulouse@orange.fr','touadmin443','fhTY650@admin'),
('134 Av. Raymond Naves, 31500 Toulouse','fabiodelporto@outlook.com','fabiolepoto','frty56%'),
('225 Av. Pasteur, 33270 Floirac','Jeanne.Courget@free.com','JEJEcour','5896AZErty@');

INSERT INTO cinema (nom,adresse,contactmail,contactphone)
VALUES ('cinebordeaux','Villa Primerose - Parc Bordelais - Caudéran 33200 Bordeaux','cine.bordeaux@orange.fr','0258986532'),
('cinelyon','32 Rue de la Feyssine, 69100 Villeurbanne','cine.lyon@orange.fr','0269871425'),
('cinenantes','57-45 Bd Eugène Orieux, 44300 Nantes','cine.nantes@orange.fr','0268753214'),
('cinetoulouse','2 Imp. de la Terrasse, 31500 Toulouse','cine.toulouse@orange.fr','0225689754');

INSERT INTO film (nom,durée,réalisateur,date_de_sortie,description,id_genre)
VALUES ('Valorant','02:25:00','laz buhrmann','2023-01-14','description description descriptiondescriptiondescriptiondescriptiondescriptiondescription description','3'),
('inside','06:37:43','tuillermo dell goro','2022-12-14','description description descriptiondescriptiondescriptiondescriptiondescriptiondescription description','2'),
('lapidero massacreur','01:53:00','sartin mcorsese','2023-01-03','description description descriptiondescriptiondescriptiondescriptiondescriptiondescription description','1'),
('meen boys','02:25:00','tintin quarantaine','2023-01-18','description description descriptiondescriptiondescriptiondescriptiondescriptiondescription description','4');

INSERT INTO reservation (id_client,id_seance)
VALUES ('1','12'),
('2','9'),
('3','4'),
('4','17');

INSERT INTO tarif (status,prix)
VALUES ('1','9,20'), ('2','7,60'), ('3','5,90');

INSERT INTO salle (numero_salle,nbplace_total,id_cinema)
VALUES ('1','320','1'), ('2','500','1'), ('3','280','1'), ('4','320','1'),
('1','500','2'), ('2','320','2'), ('3','320','2'), ('4','280','2'),
('1','500','3'), ('2','320','3') ,('3','320','3'), ('4','280','3'),
('1','500','4'), ('2','320','4') ,('3','320','4'), ('4','280','4');

INSERT INTO seance (id_film,id_salle,date)
VALUES ('1','1','2023-01-14 14:30:00'),
('1','5','2023-01-14 10:30:00'),
('1','9','2023-01-16 18:30:00'),
('1','13','2023-01-14 16:00:00'),
('1','3','2023-01-14 14:30:00'),

('2','2','2022-12-14 14:30:00'),
('2','6','2022-12-18 11:30:00'),
('2','10','2022-12-14 10:30:00'),
('2','14','2022-12-14 15:00:00'),

('3','3','2023-01-03 10:30:00'),
('3','7','2023-01-03 11:30:00'),
('3','11','2023-01-04 13:30:00'),
('3','15','2023-01-03 16:00:00'),

('4','4','2023-01-18 14:30:00'),
('4','8','2023-01-18 10:30:00'),
('4','12','2023-01-18 18:30:00'),
('4','16','2023-01-18 16:00:00');

INSERT INTO genre (genre)
VALUES ('horreur'), ('fantastique'), ('animation'), ('romance');

-- Utilisation d'un utilitaire de sauvegarde de la base de données 
sqlite> .dump -u root -p root -h localhost:8889 > bdd.sql