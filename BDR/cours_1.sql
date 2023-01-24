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
    nom varchar(50),
    prenom varchar(50),
    mail varchar(50),
    telephone varchar(50),
    age smallint(6));

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
    superficie_local decimal(50));

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

--Ajouter un attribut (cle etrangere) dans une table
alter table tech_surface add id_local int(10)  not null after id_tech_surface;

--Definir l'attribut etrangere comme cle etrangere
alter table tech_surface add constraint FK_id_local_of_tech_surf foreign key(id_local) references local(id_local);

--Ajouter un attribut (cle etrangere) dans une table
alter table gerant add id_local int(10) not null after id_gerant;

--Definir l'attribut etrangere comme cle etrangere
alter table gerant add constraint FK_id_local_of_gerant foreign key(id_local) references local(id_local);

--Ajouter un attribut (cle etrangere) dans une table
alter table caisse add id_local int(10) not null after id_caisse;

--Definir l'attribut etrangere comme cle etrangere
alter table caisse add constraint FK_id_local_of_caisse foreign key(id_local) references local(id_local);

--Ajouter un attribut (cle etrangere) dans une table
alter table caissier add id_caisse int(10) not null after id_caissier;

--Definir l'attribut etrangere comme cle etrangere
alter table caissier add constraint FK_id_caisse_of_caissier foreign key(id_caisse) references caisse(id_caisse);

--Ajouter un attribut (cle etrangere) dans une table
alter table type_client add id_client int(10) not null after id_type_client;

--Definir l'attribut etrangere comme cle etrangere
alter table type_client add constraint FK_id_client_of_type_client foreign key(id_client) references client(id_client);

--Ajouter un attribut (cle etrangere) dans une table
alter table personne add id_adresse int(10) not null after id_personne;

--Definir l'attribut etrangere comme cle etrangere
alter table personne add constraint FK_id_adresse_of_personne foreign key(id_adresse) references adresse(id_adresse);

--
--Ajouter un attribut (cle etrangere) dans une table
alter table local add id_adresse int(10) not null after id_local;

--Definir l'attribut etrangere comme cle etrangere
alter table local add constraint FK_id_adresse_of_local foreign key(id_adresse) references adresse(id_adresse);

-----------------------------Changer le type des cle plus auto increment-------------------------------

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
UNIQUE(nom,prenom,mail);


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


-----------------------------INSERTION DES DONNEES-------------------------------

--Table personne
insert into personne (id_adresse,nom,prenom_pers,mail,telephone,age) values ('jarvis', 'Stark', 'jarvis@gmail.com', '77 777 77 77', '22');
drop 
delete from personne where nom='jarvis';
