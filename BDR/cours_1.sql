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
    age smallint(6),
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
    Ninea varchar(50),
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
    id_categorie int(10) primary key auto_increment,
    nom_categorie varchar(50));

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

-- Create Table fournir (relation N*N ) 
create table fournir (
    id_fournisseur int(10)  ,
    id_article int(10), 
   primary key( id_fournisseur,id_article) );


-- Create Table contenir (relation N*N ) 
create table contenir (
    id_article int(10)  ,
    id_commande int(10), 
   primary key(  id_article,id_commande) );

-------------------------------INSERTION DES CLE ETRANGERES-----------------------------

--Ajouter un attribut (cle etrangere) dans une table
alter table facture add id_commande int(10) not null after id_facture;

--Definir l'attribut etrangere comme cle etrangere
alter table facture add constraint FK_id_commande_of_facture foreign key(id_commande) references commande(id_commande);
--
--Ajouter un attribut (cle etrangere) dans une table
alter table avoirs add id_facture int(10) not null after id_avoirs;

--Definir l'attribut etrangere comme cle etrangere
alter table avoirs add constraint FK_id_facture_of_avoirs foreign key(id_facture) references facture(id_facture);
--
--Ajouter un attribut (cle etrangere) dans une table
alter table casier add id_rayon int(10) not null after id_casier ;

--Definir l'attribut etrangere comme cle etrangere
alter table casier add constraint FK_id_rayon_of_casier foreign key(id_rayon) references rayon(id_rayon);

--Ajouter un attribut (cle etrangere) dans une table
alter table facture add id_caisse int(10) not null after id_facture;

--Definir l'attribut etrangere comme cle etrangere
alter table facture add constraint FK_id_caisse_of_facture foreign key(id_caisse) references caisse(id_caisse);

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
(NULL, '4', 'Seck', 'Adja', 'Adja@gmail.com', '754213699', '29', 'F'), 
(NULL, '16', 'Dieng', 'Fatou ', 'Fatou@gmail.com', '754623524', '32', 'F'), 
(NULL, '10', 'Diouf', 'Mame Diodio ', 'Diouf@gmail.com', '754126598', '32', 'F'),
(NULL, '17', 'Fall', 'Aminata ', 'Fall@gmail.com', '785421685', '32', 'F'), 
(NULL, '14', 'Daou', 'Ramata ', 'Daou@gmail.com', '754213698', '30', 'F'), 
(NULL, '13', 'Sidibe', 'Aicha ', 'Sidibe@gmail.com', '795321545', '31', 'F'), 
(NULL, '18', 'Thiam', 'Oumoul ', 'Thiam@gmail.com', '754621358', '34', 'F'), 
(NULL, '12', 'Diouf', 'Bineta ', 'Diouf@gmail.com', '754213698', '32', 'F'),
(NULL, '11', 'Diatta', 'Salimata ', 'Diatta@gmail.com', '762135468', '25', 'F'), 
(NULL, '15', 'Diagne', 'Nafissatou ', 'Diagne@gmail.com', '745213598', '22', 'F'),
(NULL, '20', 'Ndour', 'Maurice ', 'Ndour@gmail.com', '754213598', '26', 'M'), 
(NULL, '15', 'Thiam', 'Djibril ', 'Djibril@gmail.com', '745125987', '27', 'M'), 
(NULL, '13', 'Diop', 'Pape ', 'Pape@gmail.com', '785412365', '29', 'M'), 
(NULL, '15', 'Sambe', 'Lamine', 'Lamine@gmail.com', '741258963', '29', 'M'),
(NULL, '18', 'Faye', 'Mouhammad', 'Faye@gmail.com', '785413214', '27', 'M'), 
(NULL, '16', 'Ndoye', 'Youssou ', 'Ndoye@gmail.com', '745215874', '26', 'M'), 
(NULL, '8', 'Faye', 'Amina', 'Faye@gmail.com', '752145982', '24', 'F'), 
(NULL, '6', 'Sam', 'Fanta', 'Fanta@gmail', '789654124', '25', 'F'), 
(NULL, '16', 'Ndour', 'Lana', 'lana@gmail.com', '742589632', '28', 'F'), 
(NULL, '18', 'Gueye', 'Aby', 'Aby@gmail.com', '789652587', '27', 'F');

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


'

---------------------------------------------------------------------------------------
--Table fournisseur
---------------------------------------------------------------------------------------
INSERT INTO `fournisseur` (`id_Fournisseur`, `id_personne`, `ninea`, `agrement`, `registre_de_commerce`)
VALUES 
(NULL, '17', 'nin-56521482', 'OUI', 'valide'),
(NULL, '37', 'nin-21548965', 'oui', 'Valide'), 
(NULL, '18', 'nin-54698723', 'OUI', 'Valide'), 
(NULL, '6', 'nin-84652152', 'OUI', 'Valide'), 
(NULL, '27', 'nin-54982361', 'OUI', 'Valide');


---------------------------------------------------------------------------------------
--Table
---------------------------------------------------------------------------------------
INSERT INTO `personne` (`id_personne`, `id_adresse`, `nom_pers`, `prenom_pers`, `mail`, `telephone`, `age`, `sexe`) 
VALUES 
(NULL, '11', 'Diallo', 'Aya ', 'DialloAya@gmail.com', '754896524', '12', 'M'), 
(NULL, '15', 'Seck', 'Mamy', 'SeckMamy@gmail.com', '754862135', '24', 'F'), 
(NULL, '4', 'Gomis', 'Marie', 'Gomis@gmail.com', '754215895', '26', 'F'), 
(NULL, '18', 'Sène', 'John', 'JohnSène@gmail.com', '745698523', '25', 'F'), 
(NULL, '13', 'Sarr', 'Keba', 'Keba@gmail.com', '789654231', '12', 'M'), 
(NULL, '15', 'Mar', 'Oumar', 'Oumar@gmail.com', '742159856', '28', 'M'), 
(NULL, '2', 'Diop', 'Abdou', 'Abdou@gmail.com', '745215896', '14', 'M'), 
(NULL, '16', 'Mane', 'Papis', 'Papis@gmail.com', '756253125', '25', 'M'), 
(NULL, '16', 'Bouye', 'Abdou', 'abdou@gmail.com', '745215985', '27', 'M'), 
(NULL, '3', 'Diakite', 'Nabou', 'nabou@gmail.com', '754213598', '13', 'F'), 
(NULL, '16', 'Rassoul', 'Aicha', 'aicha@gmail.com', '789546325', '21', 'F'), 
(NULL, '2', 'Mboup', 'Fadel', 'fadel@gmail.com', '745213259', '10', 'M'), 
(NULL, '13', 'Ba', 'Fatim', 'ba@gmail.com', '712321589', '16', 'F'), 
(NULL, '2', 'Amar', 'Fallou', 'amar@gmail.com', '723215987', '21', 'M');

---------------------------------------------------------------------------------------
--Table
---------------------------------------------------------------------------------------
INSERT INTO `client` (`id_Client`, `id_personne`) 
VALUES 
(NULL, '43'), 
(NULL, '44'), 
(NULL, '45'), 
(NULL, '46'), 
(NULL, '47'),
(NULL, '48'), 
(NULL, '49'), 
(NULL, '50'), 
(NULL, '51'), 
(NULL, '52'), 
(NULL, '53'), 
(NULL, '54'), 
(NULL, '55'), 
(NULL, '56'), 
(NULL, '57');


---------------------------------------------------------------------------------------
--Table Livreur
---------------------------------------------------------------------------------------
INSERT INTO `livreur` (`id_livreur`, `id_personne`, `nature_permis`, `moyen_de_transport`) 
VALUES (
NULL, '48', 'Permis B1', 'Vehicule'), 
(NULL, '50', 'Permis B2', 'Véhicule'), 
(NULL, '40', 'Permis A', 'Moto'), 
(NULL, '36', 'Permis A2', 'Moto'), 
(NULL, '3', 'Permis B2', 'Véhicule'), 
(NULL, '56', 'Permis B1', 'Véhicule');

---------------------------------------------------------------------------------------
--Table Caisse
---------------------------------------------------------------------------------------
INSERT INTO `caisse` (`id_caisse`, `id_local`)
VALUES (NULL, '1'), 
(NULL, '1'), (NULL, '3'), 
(NULL, '2'), (NULL, '3'), 
(NULL, '2'), (NULL, '5'), 
(NULL, '4'), (NULL, '4'), 
(NULL, '5');


---------------------------------------------------------------------------------------
--Table Caissier
---------------------------------------------------------------------------------------
INSERT INTO `caissier` (`id_caissier`, `id_personne`, `id_caisse`, `experience`) 
VALUES
(NULL, '67', '10', '2 années d\'expérience'), 
(NULL, '66', '9', '5 années d\'expérience'), 
(NULL, '65', '8', '3 années d\'expérience'), 
(NULL, '64', '7', '7 années d\'expérience'), 
(NULL, '63', '6', '4 années d\'expérience'), 
(NULL, '62', '5', '3 années d\'expérience'), 
(NULL, '61', '4', '1 ans d\'expérience'), 
(NULL, '60', '3', '5 années d\'expérience'), 
(NULL, '59', '2', '3 années d\'expérience'), 
(NULL, '58', '1', '6 années d\'expérience');

---------------------------------------------------------------------------------------
--Table Rayon
---------------------------------------------------------------------------------------
INSERT INTO `rayon` (`id_rayon`, `id_rayonniste`, `id_local`, `emplacement`, `longueur`, `nombre_de_casier`, `le_type`) 
VALUES 
(NULL, '1', '5', 'Zone 1', '120', '100', 'Boulangerie'), 
(NULL, '2', '4', 'Zone 2', '30', '99', 'Poissonnerie'), 
(NULL, '3', '3', 'Zone 2', '25', '95', 'Charcuterie'), 
(NULL, '4', '2', 'Zone B', '19', '120', 'Fruits et Légumes'), 
(NULL, '5', '1', 'Zone A', '70', '68', 'Pâtisserie');


---------------------------------------------------------------------------------------
--Table Casier
---------------------------------------------------------------------------------------
INSERT INTO `casier` (`id_Casier`, `id_rayon`, `dimension`, `position`, `capacite`) 
VALUES (NULL, '1', '3 m', '1er etage', '50'), 
(NULL, '2', '2 m', '1er etage', '40'),
(NULL, '3', '3 m', '2eme étage', '23'), 
(NULL, '4', '3 m', '3eme étage', '35'), 
(NULL, '5', '3 m', '2eme étage', '29'), 
(NULL, '2', '3 m', '1er étage', '54'),
(NULL, '3', '3 m', '2eme étage', '29'), 
(NULL, '1', '3 m', '2eme étage', '42'), 
(NULL, '5', '3 m', '2eme étage', '36'), 
(NULL, '1', '3 m', '3eme étage', '25');
---------------------------------------------------------------------------------------
--Table Article
---------------------------------------------------------------------------------------
INSERT INTO `article` (`id_article`, `id_casier`, `nom_article`, `prix_article`, `date_prod`, `date_exp`, `details`) 
VALUES 
(NULL, '1', 'Beurre', '2000', '2022-10-03', '2024-10-03', 'Beurre Sofia'), 
(NULL, '1', 'Riz', '10895', '2022-09-03', '2022-10-03', 'Riz de la vallée'), 
(NULL, '2', 'Bouteille d\'eau', '1300', '2022-05-03', '2024-04-03', 'Eau minérale'), 
(NULL, '2', 'Glace', '950', '2022-06-03', '2024-08-03', 'Glace a l\'amandes'), 
(NULL, '3', 'Jus', '500', '2022-09-05', '2024-10-03', 'Coca Cola'), 
(NULL, '3', 'Huile', '1000', '2022-05-17', '2024-10-03', 'Jador'), 
(NULL, '4', 'Café Touba', '500', '2022-12-03', '2024-10-03', 'Café Touba'), 
(NULL, '4', 'Lait', '400', '2022-10-03', '2024-12-03', 'Nido'), 
(NULL, '5', 'Sucre', '420', '2022-05-14', '2024-12-17', NULL), 
(NULL, '6', 'Farine', '600', '2022-02-03', '2024-12-08', 'Fati'), 
(NULL, '7', 'The', '200', '2022-12-15', '2024-12-06', 'Flecha'), 
(NULL, '8', 'Petit pois', '652', '2022-12-15', '2024-12-10', 'Le soleil'), 
(NULL, '9', 'Cereals', '654', '2022-03-15', '2024-02-15', 'Pops'), 
(NULL, '10', 'Confiture', '500', '2022-02-14', '2024-12-15', 'Confiture brut'), 
(NULL, '8', 'Miel', '700', '2022-07-14', '2024-02-14', 'Miel brut');


---------------------------------------------------------------------------------------
--Table Categorie
---------------------------------------------------------------------------------------

INSERT INTO `categorie` (`id_categorie`, `id_article`, `nom_categorie`) 
VALUES 
(NULL, '4', 'Gâteaux'), 
(NULL, '12', 'Aliments d\'origine végétale'), 
(NULL, '12', 'Conserves'), 
(NULL, '13', 'Aliments à base de Cereals'), 
(NULL, '5', 'Fruits au sirop'), 
(NULL, '5', 'Boissons'), 
(NULL, '7', 'Petit-déjeuners'), 
(NULL, '3', 'Water'), 
(NULL, '9', 'Sucres'), 
(NULL, '8', 'Frais'), 
(NULL, '14', 'Amuse-gueules');


---------------------------------------------------------------------------------------
--Table commande
---------------------------------------------------------------------------------------


INSERT INTO `commande` (`id_commande`, `id_livreur`, `id_client`) 
VALUES 
(NULL, '1', '1'), 
(NULL, '2', '13'), 
(NULL, '3', '15'), 
(NULL, '4', '10'), 
(NULL, '5', '2'), 
(NULL, '4', '14'), 
(NULL, '6', '8'), 
(NULL, '5', '10'), 
(NULL, '4', '14'), 
(NULL, '5', '3');

---------------------------------------------------------------------------------------
--Table Facture
---------------------------------------------------------------------------------------


INSERT INTO `facture` (`id_facture`, `id_caisse`, `id_commande`, `date_facture`, `montant_facture`, `montant_donne`, `montant_de_retour`) 
VALUES (NULL, '1', '10', '2023-01-04', '5000', '10000', '5000'), 
(NULL, '2', '9', '2023-01-04', '4500', '5000', '500'), 
(NULL, '3', '8', '2022-09-04', '6500', '10000', '3500'), 
(NULL, '4', '7', '2023-02-17', '8500', '10000', '1500'), 
(NULL, '5', '8', '2023-12-08', '9000', '10000', '1000');

'
 ------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------
--Modifier un ou plusieurs enregistrement existant
UPDATE personne SET nom_pers='Kouli baly' where id_personne=1; 

--adresse des rayonnistes
select p.nom_pers ,  p.prenom_pers, a.region, a.ville ,a.code_postal from personne p,rayonniste r, adresse a where p.id_personne = r.id_personne and p.id_adresse = a.id_adresse;

--nom prenom du rayonniste qui gere le rayon charcuterie
select p.prenom_pers, p.nom_pers 
from personne p, rayon r, rayonniste ry 
where ry.id_rayonniste=r.id_rayonniste and ry.id_personne=p.id_personne and r.le_type='charcuterie';


--toutes les articles du fournisseur qui sappelle mamadou ndiaye
select prenom_pers, nom_pers, nom_article
from article , fournisseur, personne , fournir 
where (personne.id_personne=fournisseur.id_personne and article.id_article=fournir.id_article) and
fournisseur.id_fournisseur=fournir.id_fournisseur  and personne.prenom_pers='S%';


--le prix de chaque article achete par Aliou
select a.prix_article 
from article a ,personne ps,fournisseur f 
where (ps.id_personne=f.id_fournisseur and f.id_fournisseur=a.id_article) and (ps.nom_pers='Aliou');



----------------------------
--------------------------

select p.nom_pers , p.prenom_pers from personne p , fournisseur f where p.id_personne=f.id_Fournisseur and p.nom_pers='aliou';

--
--les client qui ont commander le meme produit a une date donne
select pe.nom_pers, pe.prenom_pers from client cl ,personne pe, fournisseur fo , article ar, commande co, facture fac
------------------------------------
--liste des avoirs de tous les client

-- MAME KHADY MBACKE LEYE09:37
-- les personnes qui ont commander tout les produits(nom,prenom)
-- Région ou il y'a de client mais pas de local

select p.nom_pers, p.prenom_pers from personne p ,commande c , article a, contenir con, client cl 
where
 (cl.id_client=p.id_personne and cl.id_client=c.id_commande) 
 and  ((c.id_commande=con.id_article and c.id_commande= con.id_commande) and  (con.id_article=a.id_article and con.id_commande= a.id_article ));



mettez dans une seule colonne que vous nommerez par Nom Complet, 
tous les noms et prénoms de toutes les personnes,
 en précisant dans une autre colonne
  s'il est rayonniste ou pas, ajoutez une autre colonne traitement pour voir s'il
   peut être pris ou pas, selon son age et son sexe, dans le cas où il est feminin, 
   si elle a plus de 18 ans, elle peut etre un agent, dans le cas d'un garçon,
    s'il a plus de 20 ans, il peut etre un agent, et un autre colonne pour afficher sa date de naissance.

select p.nom_pers, p.prenom_pers, p.age ,p.sexe 
from personne p, rayonniste r , agent_securite ag
where (p.id_personne=r.id_rayonniste and  p.id_personne=ag.id_agent_sec ) and ( age > 18 and sexe= 'F');
agen



Boye Elhadji Abdou10:35
SELECT nom, prenom,date from personne A, rayonniste B if A.id_personne=B.id_personne 
then 'oui' else 'non' end as NOM COMPLET if sexe='masculin' when age>20 
THEN 'c'est bon' ELSE 'c'est pas bon' END AS sexe masculin if sexe='feminin'
when  age>18 then 'c'est bon' ELSE 'c'est pas bon' END AS sexe feminin FROM personne;

--  Bakar SECK10:13
-- Donnez le nom, prenom des personnes dans une colonne qui habite dans une région où le nom de la région est un palindrome
select concat(nom,prenom) 
from personne ,adresse 
where personne.idadresse=adresse.idadresse intersect(select case where region=reverse(region));

Bakar SECK10:47
select concat(prenom_pers, ' ', nom_pers) as NomComplet
from adresse, personne
where adresse.id_adresse = personne.id_adresse
and reverse(region) = region ;


Bakar SECK10:50
select concat(Trim(prenom_pers), ' ', nom_pers) as NomComplet, coalesce(id_rayonniste, "Il n'est pas rayonniste"),
case 
  when sexe="F" and age > 18 then "Il peut etre agent"
  when sexe="M" and age > 20 then "Il peut etre agent"
  else "Il ne peut être agent"
end as Traitement
from personne
left join rayonniste
on rayonniste.id_personne = personne.id_personne ;







---------------------------------------------------------------------'


Mor Talla Mboup11:18
Afficher (prenom et nom) des clients des différentes factures.
liste des fournisseurs (nom,prénom) qui sont en même temps des clients dans une région donnée.
-------------
select p.prenom_pers, p.nom_pers
from personne p, client cl, commande co, facture f
where (p.id_personne = cl.id_client and cl.id_client= co.id_commande) and (co.id_commande=f.id_facture);
------------
select distinct p.prenom_pers, p.nom_pers, a.region
from personne p, fournisseur f , client cl, adresse a
where (p.id_personne=f.id_fournisseur and p.id_personne= cl.id_client) ;


select distinct p.prenom_pers, p.nom_pers, a.region
from personne p, fournisseur f , client cl, adresse a
where (p.id_personne=f.id_fournisseur and p.id_personne= cl.id_client)  and a.region= 'Louga';


-------------------------------
nom et le prenom et le nombre d'article commander par client pour les client ayant commander plus de 2 articles.'

select distinct p.prenom_pers, p.nom_pers, a.region
from personne p, fournisseur f , client cl, adresse a
where (p.id_personne=cl.id_personne and p.id_personne= cl.id_personne)  and a.region= 'Louga';


donner le nom du du fournisseur  qui a fourni le prix de l'article le plus chers et le nom de l'article

----------------------------------

Bakar SECK11:46
select nom_pers, prenom_pers
    from fournisseur, personne, adresse, client
    where fournisseur.id_personne = personne.id_personne
    and client.id_personne = personne.id_personne
    and personne.id_adresse = adresse.id_adresse 
    and region like 'm%';


RAMATOULAYE CAMARA12:40
SELECT nom,prenom, SUM(nbr_articles) FROM personnel, client, commande WHERE personnel.id_personne = client.id_personne GROUP BY  nom,prenom HAVING SUM(nbr_articles) >= 2;
MAME KHADY MBACKE LEYE12:40
select nom,prenom,nomArt from personnes,fournisseur,fournir,article where fournisseur.idPers=personnes.idpersonne and fournisseur.idfourni=fournir.idFournir and fournir.idArt=article.idArt and prix>= all(select prix from article);
MOMAR TALLA SALLA12:41
select P.nom,P.prenom A.nombre_article from personne P,client C, commande F,article A
    -> where P.id_personn=P.idclient and A.id_commande=F.id_article and F.id_client=C.id_client and A.nombre_article > 2;
select nom , nom_article  from personne C,fournisseur A ,article B where C.id_personne=A.id_personne and B.id_fournisseur=A.id_fournisseur and prix_article >= ALL (SELECT prix_article FROM article);
RAMATOULAYE CAMARA12:41
SELECT nom from personnel,fournisseur, articles where personnel.id_personne=fournisseur.id_personne and fournisseur.id_fournisseur=articles.id_fournisseur and prix_article >= all(select prix_article from articles);

--listes des casier d'une rayon
--les avoirs non rembousse..

 ------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------

------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------



--les noms des article acheter par les client dune ville donne
SELECT nom_article
FROM article 
JOIN fournir ON fournir.id_article=article.id_article
JOIN fournisseur ON fournir.id_fournisseur=fournisseur.id_fournisseur
JOIN  personne ON fournisseur.id_personne=personne.id_personne
JOIN  adresse ON personne.id_adresse=adresse.id_adresse
WHERE ville = 'Dakar';

--les client qui sont dans le systeme qui nont pas efectuer dachat et il faut donne leurs region


SELECT concat(Trim(prenom_pers), ' ', nom_pers) as NomComplet, id_client
FROM client
JOIN personne ON client.id_personne=personne.id_personne
JOIN  adresse ON personne.id_adresse=adresse.id_adresse
WHERE client.id_personne NOT IN 
(SELECT concat(Trim(prenom_pers), ' ', nom_pers) as NomComplet, id_client
FROM  client 
JOIN personne  ON client.id_personne=personne.id_personne
JOIN commande ON commande.id_client=client.id_client
JOIN facture ON facture.id_commande=commande.id_commande);


--le nombre de fois que le produit X est vendu

SELECT COUNT(*)
FROM 
WHERE product = 'X'

--liste des client qui ont commande entre deux date_avoir

SELECT concat(Trim(prenom_pers), ' ', nom_pers) as NomComplet
FROM  client 
JOIN personne  ON client.id_personne=personne.id_personne
JOIN commande ON commande.id_client=client.id_client
JOIN facture ON facture.id_commande=commande.id_commande
WHERE date_facture BETWEEN '2022-01-01' AND '2022-12-31';

--les 2 clients qui ont commande le plus d'article

SELECT concat(Trim(prenom_pers), ' ', nom_pers) AS total_quantity
FROM client
JOIN personne  ON client.id_personne=personne.id_personne
JOIN commande ON commande.id_client=client.id_client
JOIN facture ON facture.id_commande=commande.id_commande
GROUP BY nombre_article
ORDER BY total_quantity DESC
LIMIT 2

----------------------------------------------------------------------------------------


select concat(Trim(prenom_pers), ' ', nom_pers) as NomComplet,
case 
  when sexe="F" and age > 18 then "Il peut etre agent"
  when sexe="M" and age > 20 then "Il peut etre agent"
  else "Il ne peut être agent"
end as Traitement
from client 
left join personne
on rayonniste.id_personne = personne.id_personne ;




 ------||||||||||||||||||||||||||||||--------||||||||||||||||||||||||||||||-----------

--La syntaxe pour supprimer des lignes est la suivante :

DELETE FROM table
WHERE condition

--Par défaut, lauto-increment débute à la valeur “1” 
--et sincrémentera de un pour chaque nouvel enregistrement. 
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

