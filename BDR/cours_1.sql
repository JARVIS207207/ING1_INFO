-- Connect as the user root
mysql -u root -p

-- Create a database as ipsl2023 name's 
create database ipsl2023 ;

--Accorder des privileges a ipsldirecteur
-- Create a user name ipsldirecteur password ipsl2022@ and give them all privileges on all database
grant all privileges on *.* to ipsldirecteur@localhost identified by 'jarvis' ;

-- Create a new user ipslEtudiant as password ipslEtudiant@ and give the all privileges on ipsl2023 only 
grant all privileges on ipsl2023.* to ipsletudiant@localhost identified by 'jarvis207' ;

-- Crate a database as ipslSupermarche name's
create database ipslSupermarche ;

-- Connect as the user ipsldirecteur
mysql -u ipsldirecteur -p


---------------------------------CREATION DES TABLES-------------------------------------------

-- Create Table Personne in our Supermarche Information System's
create table personne (
    id_personne int(10) primary key auto_increment,
    nom_pers varchar(50),
    prenom_pers varchar(50),
    mail varchar(50),
    telephone varchar(50),
    age smallint(6)
    sexe varchar(5));

-- Create Table Article in our Supermarche Information System's
create table article (
    id_article int(10) primary key auto_increment,
    nom_article varchar(50),
    prix_article smallint(10),
    date_prod date,
    date_exp date, 
    details varchar(50) ) ;

-- Create Table Gerant in our Supermarche Information System's
create table gerant(
    id_gerant int(10) primary key auto_increment,
    experience varchar(50),
    specialite varchar(50),
    type_de_contrat varchar(50));

-- Create Table  agent-securite in our Supermarche Information System's
create table agent_securite(
    id_agent_sec int(10) primary key auto_increment,
    grade varchar(50),
    experience varchar(50),
    heures_de_services time );

-- Create Table  Etiquette in our Supermarche Information System's
create table  etiquette (
    id_Etiquette int(10) primary key auto_increment,
    nature_Etiquette varchar(50));

-- Create Table  Casier in our Supermarche Information System's
create table  casier (
    id_Casier int(10) primary key auto_increment,
    dimension varchar(50),
    position varchar(50),
    capacite decimal(50));

-- Create Fournisseur  Casier in our Supermarche Information System's
create table  fournisseur (
    id_Fournisseur int(10) primary key auto_increment,
    linea varchar(50),
    agrement varchar(50),
    registre_de_commerce varchar(50));

-- Create Table  Client in our Supermarche Information System's
create table  client (
    id_Client int(10) primary key auto_increment);

-- Create Table Rayonniste  Cas in our Supermarche Information System's
create table  rayonniste (
    id_rayonniste int(10) primary key auto_increment,
    experience varchar(50));

-- Create Table Local  in our Supermarche Information System's
create table local  (
    id_local int(10) primary key auto_increment,
    nom_local varchar(50),
    superficie_local decimal(5,2));

-- Create Table  Rayon in our Supermarche Information System's
create table  rayon (
    id_rayon int(10) primary key auto_increment,
    emplacement varchar(50),
    longueur decimal(50),
    nombre_de_casier int(100),
    le_type varchar(50));

-- Create Table  Caisse in our Supermarche Information System's
create table caisse   (
    id_caisse int(10) primary key auto_increment);

-- Create Table Adresse  in our Supermarche Information System's
create table adresse  (
    id_adresse int(10) primary key auto_increment,
    region  varchar(50),
    ville varchar(50),
    code_postal varchar(50),
    residence varchar(50));

-- Create Table Livreur in our Supermarche Information System's
create table livreur  (
    id_livreur int(10) primary key auto_increment,
    nature_permis varchar(50),
    moyen_de_transport varchar(50));

-- Create Table Facture in our Supermarche Information System's
create table facture (
    id_facture int(10) primary key auto_increment,
    date_facture date,
    montant_facture decimal(10,2),
    montant_donne decimal(10,2),
    montant_de_retour decimal(10,2));

-- Create Table Avoirs in our Supermarche Information System's
create table avoirs (
    id_avoirs int(10) primary key auto_increment,
    montant_avoirs decimal(10,2),
    date_avoirs date,
    duree_de_validite time);

-- Create Table Commande in our Supermarche Information System's
create table commande (
    id_commande int(10) primary key auto_increment);

-- Create Table Categories in our Supermarche Information System's
create table categorie (
    id_categorie int(10) primary key auto_increment);

-- Create Table Technicien de surface in our Supermarche Information System's
create table Tech_surface (
    id_tech_surface int(10) primary key auto_increment,
    nb_heures_services time);

-- Create Table Caissier in our Supermarche Information System's
create table Caissier (
    id_caissier int(10) primary key auto_increment,
    experience varchar(50));

-- Create Table Type_client in our Supermarche Information System's
create table Type_client (
    id_type_client int(10) primary key auto_increment,
    type_client varchar(50));

-------------------------------INSERTION DES CLE ETRANGERES-----------------------------

--Ajouter un attribut (cle etrangere) dans une table
alter table article add id_casier int(10) not null after id_article;

--Definir l'attribut etrangere comme cle etrangere
alter table article add constraint FK_id_caisier_of_article foreign key(id_casier) references casier(id_casier);

--Ajouter un attribut (cle etrangere) dans une table
alter table commande add id_client int(10) not null after id_commande;

--Definir l'attribut etrangere comme cle etrangere
alter table commande add constraint FK_id_client_of_commande foreign key (id_client) references client(id_client);

--Ajouter un attribut (cle etrangere) dans une table
alter table commande add id_livreur int(10)not null after id_commande;

--Definir l'attribut etrangere comme cle etrangere
alter table commande add constraint FK_id_livreur_of_commande foreign key (id_livreur) references livreur(id_livreur);

--Ajouter un attribut (cle etrangere) dans une table
alter table categorie add id_article int(10) NOT NULL after id_categorie;

--Definir l'attribut etrangere comme cle etrangere
alter table categorie add constraint FK_id_article_of_categorie foreign key(id_article) references article(id_article);

--Ajouter un attribut (cle etrangere) dans une table
alter table rayon add id_rayonniste int(10) not null after id_rayon;

--Definir l'attribut etrangere comme cle etrangere
alter table rayon add constraint FK_id_rayonniste_of_rayon foreign key(id_rayonniste) references rayonniste(id_rayonniste);

--Ajouter un attribut (cle etrangere) dans une table
alter table rayon add id_local int(10) not null after id_rayon;

--Definir l'attribut etrangere comme cle etrangere
alter table rayon add constraint FK_id_local_of_rayon foreign key(id_local) references local(id_local);

--Ajouter un attribut (cle etrangere) dans une table
alter table agent_securite add id_local int(10)  not null after id_agent_sec;

--Definir l'attribut etrangere comme cle etrangere
alter table agent_securite add constraint FK_id_local_of_agent_securite foreign key(id_local) references local(id_local);


---------||||||||||||||-----------
--cas heritage de la table personne
alter table agent_securite add id_personne int(10)  not null after id_agent_sec;

alter table agent_securite add constraint FK_id_personne_of_agent_securite foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


--Ajouter un attribut (cle etrangere) dans une table
alter table tech_surface add id_local int(10)  not null after id_tech_surface;

--Definir l'attribut etrangere comme cle etrangere
alter table tech_surface add constraint FK_id_local_of_tech_surf foreign key(id_local) references local(id_local);


---------||||||||||||||-----------
--cas heritage de la table personne
alter table tech_surface add id_personne int(10)  not null after id_tech_surface;

alter table tech_surface add constraint FK_id_personne_of_tech_surface foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


--Ajouter un attribut (cle etrangere) dans une table
alter table gerant add id_local int(10) not null after id_gerant;

--Definir l'attribut etrangere comme cle etrangere
alter table gerant add constraint FK_id_local_of_gerant foreign key(id_local) references local(id_local);


---------||||||||||||||-----------
--cas heritage de la table personne
alter table gerant add id_personne int(10)  not null after id_gerant;

alter table gerant add constraint FK_id_personne_of_gerant foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


--Ajouter un attribut (cle etrangere) dans une table
alter table caisse add id_local int(10) not null after id_caisse;

--Definir l'attribut etrangere comme cle etrangere
alter table caisse add constraint FK_id_local_of_caisse foreign key(id_local) references local(id_local);

--Ajouter un attribut (cle etrangere) dans une table
alter table caissier add id_caisse int(10) not null after id_caissier;

--Definir l'attribut etrangere comme cle etrangere
alter table caissier add constraint FK_id_caisse_of_caissier foreign key(id_caisse) references caisse(id_caisse);

---------||||||||||||||-----------
--cas heritage de la table personne
alter table caissier add id_personne int(10)  not null after id_caissier;

alter table caissier add constraint FK_id_personne_of_caissier foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


--Ajouter un attribut (cle etrangere) dans une table
alter table type_client add id_client int(10) not null after id_type_client;

--Definir l'attribut etrangere comme cle etrangere
alter table type_client add constraint FK_id_client_of_type_client foreign key(id_client) references client(id_client);

--Ajouter un attribut (cle etrangere) dans une table
alter table personne add id_adresse int(10) not null after id_personne;

--Definir l'attribut etrangere comme cle etrangere
alter table personne add constraint FK_id_adresse_of_personne foreign key(id_adresse) references adresse(id_adresse);

--Ajouter un attribut (cle etrangere) dans une table
alter table local add id_adresse int(10) not null after id_local;

--Definir l'attribut etrangere comme cle etrangere
alter table local add constraint FK_id_adresse_of_local foreign key(id_adresse) references adresse(id_adresse);


---------||||||||||||||-----------
--cas heritage de la table personne
alter table rayonniste add id_personne int(10)  not null after id_rayonniste;

alter table rayonniste add constraint FK_id_personne_of_rayonniste foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


---------||||||||||||||-----------
--cas heritage de la table personne
alter table livreur add id_personne int(10)  not null after id_livreur;

alter table livreur add constraint FK_id_personne_of_livreur foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


---------||||||||||||||-----------
--cas heritage de la table personne
alter table client add id_personne int(10)  not null after id_client;

alter table client add constraint FK_id_personne_of_client foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------


---------||||||||||||||-----------
--cas heritage de la table personne
alter table fournisseur add id_personne int(10)  not null after id_Fournisseur;

alter table fournisseur add constraint FK_id_personne_of_fournisseur foreign key(id_personne) references personne(id_personne);
---------||||||||||||||-----------



---------------------------Changer le type des cle plus auto increment-------------------------------

 alter table personne modify id_personne int(10) not null auto_increment;


-----------------------------CHANGER LES NOM DES ENTITE ET  DES ATTRIBUTS-------------------------------

--pour changer le nom de l'attribut
 alter table personne change prenom prenom_pers varchar(50);

 --renommer le nom de la table
 alter table nom_de_la_table rename nom_de_table



-----------------------------Ajout des contraintes-------------------------------

-- table article
alter table article
--alter column nom_article varchar(50) not null;
modify nom_article varchar(50) not null;

--table  Avoirs
alter table avoirs
add constraint CHK_avoirs_montant_avoirs
check(montant_avoirs>=0 AND montant_avoirs<499);

--table personne
alter table personne 
add constraint UQ_personne_nom_prenom_mail
UNIQUE(nom_pers,prenom_pers,mail);





-----------------------------INSERTION DES DONNEES-------------------------------



---------------------------------------------------------------------------------------
-- table adresse
---------------------------------------------------------------------------------------

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) VALUES 
    (NULL, 'Dakar', 'Pikine', '17000', 'SIPERES 5'), 
    (NULL, 'Dakar', 'Guediawaye', '10200', 'Cite Sofraco'),
    (NULL, 'Saint-Louis', 'Saint-Louis', '32000', 'UGB'),
    (NULL, 'Diourbel', 'Diourbel', '22300', 'RESIDENCE CHEIKHOUL KHADIM'),
    (NULL, 'Thies', 'thies', '21000', 'CITE SENGHOR'),
    (NULL, 'Dakar', 'Rufisque', '20000', 'CITE AL AZHAR '), 
    (NULL, 'Dakar', 'BARGNY', '20100', 'CITE EST 1'),
    (NULL, 'Diourbel', 'Touba', '22300', 'DAROU MINAME 1'),
    (NULL, 'Dakar', 'Dakar', '20000', 'CITE Sicaps'), 
    (NULL, 'Dakar', 'Dakar', '11500', 'CITE MILLIONNAIRE'), 
    (NULL, 'Dakar', 'RUFISQUE', '20000', 'CITE SAGESSE'), 
    (NULL, 'SAINT-LOUIS', 'DAGANA', '32800', 'KEUR MBAYE'), 
    (NULL, 'THIES', 'JOAL', '23015', 'VELINGARA'), 
    (NULL, 'THIES', 'TIVAOUANE', '30000', 'KEUR BACAR'), 
    (NULL, 'LOUGA', 'KEBEMER', '30800', 'WAKHAL DIAM'),
    (NULL, 'RUFISQUE', 'RUFISQUE CITES', '20000', 'CITE SOCOCIM'), 
    (NULL, 'Dakar', 'PARCELLES ASSAINIES-HLM ', '14000', 'UNITE 23'), 
    (NULL, 'SAINT-LOUIS', 'RICHARD TOLL', '32600', 'MEDINA CHERIF'),
    (NULL, 'DIOURBEL', 'DIOURBEL', '22100', 'MBACKE'), 
    (NULL, 'Dakar', 'BEL AIR - MARINAS', '10000', 'VILLA HIBISCUS')


----------------------------------------------------------------

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','pikine',17000,'Sipres 5');

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','guediawaye',10200,'Cite Sofraco');

insert into adresse (region,ville,code_postal,residence) 
    values ('Saint-Louis','Saint-Louis',32000,'UGB');

insert into adresse (region,ville,code_postal,residence) 
    values ('Diourbel','Diourbel',22300,'Résidence Cheikhoul Khadim');

insert into adresse (region,ville,code_postal,residence) 
    values ('Thies','thies', 21000,'CITE SENGHOR');

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','Rufisque',20000,'CITE AL AZHAR ');

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','BARGNY',20100,'CITE EST 1');

insert into adresse (region,ville,code_postal,residence) 
    values ('Diourbel','Touba', 22300,'DAROU MINAME 1');

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','Dakar', 20000,'CITE Sicaps');

insert into adresse (region,ville,code_postal,residence) 
    values ('Dakar','Dakar', 11500,'CITE MILLIONNAIRE');

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) 
    VALUES (NULL, 'Dakar', 'RUFISQUE', '20000', 'CITE SAGESSE');

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) 
    VALUES (NULL, ' SAINT-LOUIS', ' DAGANA', '32800', ' KEUR MBAYE');

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) 
    VALUES (NULL, ' RUFISQUE', ' RUFISQUE CITES', '20000', ' CITE SOCOCIM');

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) 
    VALUES (NULL, 'Dakar', 'SEBIKHOTANE', 'CITE PALAIS', 'CITE PALAIS');

INSERT INTO `adresse` (`id_adresse`, `region`, `ville`, `code_postal`, `residence`) 
    VALUES (NULL, 'SAINT-LOUIS', 'RICHARD TOLL', '32600', 'MEDINA CHERIF');





---------------------------------------------------------------------------------------
--Table personne
---------------------------------------------------------------------------------------

INSERT INTO `personne` (`id_personne`, `id_adresse`, `nom_pers`, `prenom_pers`, `mail`, `telephone`, `age`, `sexe`)
 VALUES 
(NULL, '2', 'Koulibaly', ' Kalidou ', ' Kalidou@gmail.com', '77 555 66 99', '31', 'M'),
(NULL, '16', 'Dieng ', 'Pape Abdoulaye ', 'Dieng@gmail.com', '785426589', '28', 'M'), 
(NULL, '17', 'Faty', 'Alioune Badara ', 'Faty@gmail.com', '754625982', '23', 'M'),
(NULL, '16', 'Sy', 'Pape Mamadou ', 'Sy@gmail.com', '785214596', '25', 'M'),
(NULL, '14', 'Diédhiou', 'Abdoulaye ', 'Diédhiou@gmail.com', '745895623', '22', 'M'), 
(NULL, '15', 'Diouf', 'Ousmane ', 'Diouf@gmail.com', '795652548', '28', 'M'),
(NULL, '16', 'Sané', 'Mamadou ', 'Sané@gmail.com', '759862548', '18', 'M'),
(NULL, '19', 'Sidibé', 'Cheikh Tidiane ', 'Sidibé@gmail.com', '759652458', '23', 'M'),
(NULL, '12', 'Wagué', 'Moussa ', 'Wagué@gmail.com', '785469525', '24', 'M'),
(NULL, '4', 'Cissé', 'Pape Abou ', 'Cissé@gmail.com', '785469256', '27', 'M'), 
(NULL, '12', 'Diatta', 'Krépin', 'Diatta@gmail.com', '785423652', '23', 'M'), 
(NULL, '16', 'Sarr', 'Ismaïla', 'Sarr@gmail.com', '759826521', '24', 'M'),
(NULL, '8', 'Kouyaté', 'Cheikhou ', 'Kouyaté@gmail.com', '785426933', '32', 'M'),
(NULL, '5', 'Mendy', 'Nampalys', 'Mendy@gmail.com', '785426963', '30', 'M'), 
(NULL, '14', 'Ndiaye', 'Iliman', 'Ndiaye@gmail.com', '758265748', '22', 'M'), 
(NULL, '4', 'Diédhiou', 'Famara ', 'Diédhiou@gmail.com', '785462953', '29', 'M'), 
(NULL, '17', 'Dia', 'Boulaye ', 'Dia@gmail.com', '756542325', '25', 'M'), 
(NULL, '3', 'Dieng', 'Bamba ', 'Dieng@gmail.com', '785462369', '22', 'M'),
(NULL, '8', 'Mané', 'Sadio ', 'Mané@gmail.com', '756524859', '30', 'M'),
(NULL, '12', 'Cissé', ' Aliou ', 'Cissé@gmail.com', '755213525', '46', 'M'),
(NULL, '17', 'Diallo', 'Babacar', 'Diallo@gmail.com', '754284510', '12', 'M'),
(NULL, '5', 'Diop', 'Moussa', 'Diop@gmail.com', '752184510', '19', 'M'),
(NULL, '11', 'Ndiaye', 'Oumy', 'Ndiaye@gmail.com', '754284510', '12', 'F'),
(NULL, '12', 'Diarra', 'Abdou', 'Diarra@gmail.com', '754212150', '9', 'M'),
(NULL, '2', 'Mboup', 'Tala', 'Mboup@gmail.com', '754953510', '13', 'F'),
(NULL, '9', 'Mane', 'Mor', 'Mane@gmail.com', '754598510', '15', 'M'),
(NULL, '18', 'Traore', 'Astou', 'Astou@gmail.com', '785462585', '32', 'F'), 
(NULL, '5', 'Marie', 'Anne', 'Anne@gmail.com', '754256523', '18', 'F'), 
(NULL, '5', 'Sène', 'Ndèye ', 'Ndèye@gmail.com', '742159865', '24', 'F'), 
(NULL, '9', 'Sarr', 'Oumoul Khairy ', 'Sarr@gmail.com', '754216985', '30', 'F'),
(NULL, '19', 'Ba', 'Mya ', 'ba@gmail.com', '754282210', '28', 'F'),
(NULL, '18', 'Traoré', 'Aya ', 'Aya@gmail.com', '754262210', '28', 'F'),
(NULL, '4', 'Adja', 'Seck', 'Adja@gmail.com', '754213699', '29', 'F'), 
(NULL, '16', 'Dieng', 'Fatou ', 'Fatou@gmail.com', '754623524', '32', 'F'), 
(NULL, '10', 'Diouf', 'Mame Diodio ', 'Diouf@gmail.com', '754126598', '32', 'F'),
(NULL, '17', 'Fall', 'Aminata ', 'Fall@gmail.com', '785421685', '32', 'F'), 
(NULL, '14', 'Daou', 'Ramata ', 'Daou@gmail.com', '754213698', '30', 'F'), 
(NULL, '13', 'Sidibe', 'Aicha ', 'Sidibe@gmail.com', '795321545', '31', 'F'), 
(NULL, '18', 'Thiam', 'Oumoul ', 'Thiam@gmail.com', '754621358', '34', 'F'), 
(NULL, '12', 'Diouf', 'Bineta ', 'Diouf@gmail.com', '754213698', '32', 'F'),
(NULL, '11', 'Diatta', 'Salimata ', 'Diatta@gmail.com', '762135468', '25', 'F'), 
(NULL, '15', 'Diagne', 'Nafissatou ', 'Diagne@gmail.com', '745213598', '22', 'F');

---------------------------------------------------------------------------------------
--Table Local
---------------------------------------------------------------------------------------
INSERT INTO `local` (`id_local`, `id_adresse`, `nom_local`, `superficie_local`) 
VALUES (NULL, '16', 'Local Rufisque', '100'), 
(NULL, '3', 'Local Saint-Louis', '151'), 
(NULL, '5', 'Local  Thies', '140'), 
(NULL, '15', 'Local Louga', '120'), 
(NULL, '8', 'Local Diourbel', '130');

---------------------------------------------------------------------------------------
--Table Gerant
---------------------------------------------------------------------------------------
INSERT INTO `gerant` (`id_gerant`, `id_personne`, `id_local`, `experience`, `specialite`, `type_de_contrat`)
 VALUES 
 (NULL, '19', '1', '4 années d\'expérience', 'Marketing', 'CDI'), (NULL, '12', '2', '2 années d\'expérience', 'Ressources humaines', 'CDI'), 
 (NULL, '1', '3', '1 ans d\'expérience', 'Finance', 'CDD'), (NULL, '18', '4', '1 ans d\'expérience', 'Commerce', 'CDD'), 
 (NULL, '39', '5', '3 ans d\'expérience', 'Marketing digital', 'CDI');     '


---------------------------------------------------------------------------------------
--Table Agent securite
---------------------------------------------------------------------------------------

INSERT INTO `agent_securite` (`id_agent_sec`, `id_personne`, `id_local`, `grade`, `experience`, `heures_de_services`) 
VALUES
(NULL, '31', '1', 'Surveillance', '2 ans ', '5:00:00'),
(NULL, '17', '2', 'Surveillance', '3 années d\'expérience', '04:00:00'),
(NULL, '36', '3', 'Surveillance', '1 ans d\'expérience', '6:00:00'),
(NULL, '13', '4', 'Surveillance', '2 ans d\'expérience', '07:00:00'),
(NULL, '14', '5', 'Surveillance', '3 ans d\'expérience', '04:00:00');

---------------------------------------------------------------------------------------
--Table Technicien de surface
---------------------------------------------------------------------------------------
INSERT INTO `tech_surface` (`id_tech_surface`, `id_personne`, `id_local`, `nb_heures_services`) 
VALUES 
(NULL, '28', '1', '02:00:00'), 
(NULL, '29', '1', '02:00:00'), 
(NULL, '30', '2', '03:00:00'), 
(NULL, '31', '2', '03:00:00'), 
(NULL, '32', '3', '02:00:00'), 
(NULL, '33', '3', '02:00:00'), 
(NULL, '34', '4', '01:30:00'), 
(NULL, '35', '4', '01:30:00'), 
(NULL, '36', '5', '02:30:00'), 
(NULL, '23', '5', '02:30:00');
---------------------------------------------------------------------------------------
--Table rayonniste
---------------------------------------------------------------------------------------
INSERT INTO `rayonniste` (`id_rayonniste`, `id_personne`, `experience`) 
VALUES 
(NULL, '23', '1 années d\'expérience'),
(NULL, '20', '3 années d\'expérience'),
(NULL, '30', '2 années d\'expérience'),
(NULL, '11', '5 années d\'expérience'),
(NULL, '33', '0 année d\'expérience');

---------------------------------------------------------------------------------------
--Table
---------------------------------------------------------------------------------------



insert into personne (id_adresse,nom_pers,prenom_pers,mail,telephone,age,sexe)
    values (1,'Jarvis', 'Stark', 'jarvis@gmail.com', '77 777 77 77', '22','M');

insert into personne (id_adresse,nom_pers,prenom_pers,mail,telephone,age)
    values (9,'John', 'Wick', 'john@gmail.com', '77 555 55 55', '45','M');

insert into personne (id_adresse,nom_pers,prenom_pers,mail,telephone,age)
    values (2,'Khadim', 'Mbow', 'khadim@gmail.com', '77 666 66 77', '27','M');
    
insert into personne (id_adresse,nom_pers,prenom_pers,mail,telephone,age)
    values (6,'Fadel', 'Mouhamed', 'fadel@gmail.com', '77 668 78 77', '10','M');

--Table Local

insert into local (id_adresse,nom_local,superficie_local)
    values (6,'Local Dakar','100 metres carres','');

insert into local (id_adresse,nom_local,superficie_local)
    values (6,'Local Rufisque','60 metres carres');

insert into local (id_adresse,nom_local,superficie_local)
    values (1,'Local Pikine ','60 metres carres');

insert into local (id_adresse,nom_local,superficie_local)
    values (8,'Local Diourbel ','40 metres carres');

insert into local (id_adresse,nom_local,superficie_local)
    values (5,'Local Thies ','50 metres carres');

--Table Gerant

insert into gerant (id_local, experience, specialite, type_de_contrat)
    values (4,'Experence de 4 ans','Marketing','CDI');

insert into gerant (id_local, experience, specialite, type_de_contrat)
    values (2,'Experence de 2 ans','Ressources humaines','CDD');

insert into gerant (id_local, experience, specialite, type_de_contrat)
    values (5,'Experence de 3 ans','Finance','CDI');

insert into gerant (id_local, experience, specialite, type_de_contrat)
    values (3,'Experence de 1 ans','Ressources humaines','CDD');

insert into gerant (id_local, experience, specialite, type_de_contrat)
    values (1,'Experence de 5 ans','Commerce','CDI');

--Table agent de securite
insert into agent_securite(id_local, grade, experience, heures_de_services)
    values('','','','');

insert into agent_securite(id_local, grade, experience, heures_de_services)
    values('','','','');

insert into agent_securite(id_local, grade, experience, heures_de_services)
    values('','','','');

insert into agent_securite(id_local, grade, experience, heures_de_services)
    values('','','','');

insert into agent_securite(id_local, grade, experience, heures_de_services)
    values('','','','');











 ------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------

--La syntaxe pour supprimer des lignes est la suivante :

DELETE FROM `table`
WHERE condition

--Par défaut, l’auto-increment débute à la valeur “1” 
--et s’incrémentera de un pour chaque nouvel enregistrement. 
--Il est possible de modifier la valeur initiale avec la requête SQL suivante :

ALTER TABLE `nom_de__la_table` AUTO_INCREMENT=(v_initial);


-----------------------------CODE POUR AJOUTER LES CONTRAINTES-------------------------------

--Contraintes de valuation obligatoire
ALTER TABLE maTable
ALTER COLUMN maColonne memeType NOT NULL

--Contraintes de clé primaire
ALTER TABLE maTable
ADD CONSTRAINT PK_maTable
  PRIMARY KEY (colonnesConstituantLaCléPrimaire)

--Contraintes de clé étrangère
ALTER TABLE maTable
ADD CONSTRAINT FK_maTable_colonneDeCleEtrangere
  FOREIGN KEY(colonneDeCleEtrangere)
  REFERENCES tableContenantLaClePrimaireAReferencer(colonneDeClePrimaire)

--Contraintes d’unicité
ALTER TABLE maTable
ADD CONSTRAINT UQ_maTable_colonnesConstituantLeTupleQuiDoitEtreUnique
  UNIQUE (colonnesConstituantLeTupleQuiDoitEtreUnique)

--Contraintes de valeur par défaut :
ALTER TABLE maTable
ADD CONSTRAINT DF_maTable_maColonne
  DEFAULT (uneValeur) FOR (maColonne)

--Contraintes de domaine (CHECK)
ALTER TABLE maTable
ADD CONSTRAINT CHK_maTable_maColonne
CHECK(maColonne [formuleDeVerification]);


--supprimer une cle etrangere
 ALTER TABLE personne DROP constraint FK_id_adresse_of_personne;
 alter table personne Drop id_adresse;

 ------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------

