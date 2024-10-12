   
---------------------- les tables ------------------------------------------------
use gestion_bibliotheque;

create  table Auteur(
   id_Auteur int   AUTO_INCREMENT,
   nom  varchar(20),
   prenom varchar(20),
   date_naissance date,
  primary key (id_Auteur)
)engine=Innodb;



create table Livre(
   id_Livre int AUTO_INCREMENT ,
   titreL varchar(20),
    description varchar(250),
    id_Auteur int ,
    id_categorie int ,
    annee date ,
    primary key (id_Livre)
)engine=Innodb;

create table Emprunteur (
     id_emprunteur int AUTO_INCREMENT ,
      nomE varchar(20),
      prenomE varchar(20),
      date_naissance date,
      telephone varchar(20),
    adresse varchar(30),
    mail varchar(40),
   primary key (id_emprunteur)
)engine=Innodb;

create table emprunter (
         id_emprunte int AUTO_INCREMENT,
         id_emprunteur int,
         id_Livre int,
         date_debut date,
         date_fin date,
         date_rendu date,
          primary key (id_emprunte)
)engine =Innodb;
          

create table categorie (
     id_categorie int  AUTO_INCREMENT,
     libelle varchar(20),
    primary key (id_categorie)
)engine=Innodb;

create table Fournisseur (
      id_fournisseur int  AUTO_INCREMENT,
      nomF varchar(20),
      prenomF varchar(20),
      telephone varchar(20),
      adresse varchar(30),
       primary key (id_fournisseur)
)engine=Innodb;

create table Demande (
      id_Demande int  AUTO_INCREMENT,
      id_emprunteur int ,
      Titre_LivreD  varchar(20),
       primary key (id_Demande)
)engine =Innodb;

create table Achat(
      id_Achat int AUTO_INCREMENT ,
      Titre_LivreA varchar(20),
      prix float,
      date_Achat date,
      primary key (id_Achat)
)engine=Innodb;



create table Sanctionner (
      id_sanctionner int AUTO_INCREMENT,
      id_emprunteur int,
       motif  varchar(30),
       primary key (id_sanctionner)
)engine=Innodb;

 create table Reservation (
       id_emprunteur int,
       titreL varchar(20),        
       dateR date,
       primary key (id_emprunteur ,titreL , dateR)
)engine=Innodb;

create table message(
      id_message int AUTO_INCREMENT,
      mail_emprunteur varchar(250),
      objetmsg varchar(250),
      contenumsg varchar(520),
      primary key (id_message) 
)engine=innodb;

-------------------------------------------------------------------------------------------

alter table Livre
modify column titreL varchar(250);

alter table Livre
modify column description varchar(520);

alter table Sanctionner
modify column motif varchar(520);  

alter table Reservation
modify column titreL varchar(250); 

alter table message 
modify column mail_emprunteur varchar(40);

alter table Demande
modify column Titre_LivreD  varchar(250);

ALTER TABLE livre
DROP COLUMN annee;

--------------------------------- les contraintes--------------------------------

alter table Livre
add constraint L_idAuteur_fk  foreign key (id_Auteur) references Auteur (id_Auteur);

alter table Livre 
add constraint L_id_categorie_fk foreign key (id_categorie) references Categorie (id_categorie);

alter table Emprunter 
add constraint E_id_emprunteur_fk foreign key (id_emprunteur) references Emprunteur (id_emprunteur);

alter table Demande 
add constraint D_id_emprunteur_fk foreign key (id_emprunteur) references Emprunteur (id_emprunteur);

alter table Sanctionner
add constraint S_id_emprunteur_fk foreign key (id_emprunteur) references Emprunteur (id_emprunteur);
 
alter table Reservation
add constraint R_id_emprunteur_fk foreign key (id_emprunteur) references Emprunteur (id_emprunteur);


