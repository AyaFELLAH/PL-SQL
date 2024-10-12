INSERT INTO Auteur (id_Auteur,nom,prenom,date_naissance)
VALUES (1,"MUSSO","GUILLAUME",'1974-6-7'),
        (2,"HUGO","VICTOR",'1802-02-26'),
        (3,"CHOUKRI","mohamed",'1935-7-15'),
        (4,"hover","collen",'1979-12-05');

INSERT INTO categorie (id_categorie,libelle)
VALUES (1,"autobiographique"),
        (2,"roman"),
        (3,"action");

INSERT INTO Livre (id_Livre,titreL,description,id_Auteur,id_categorie)
VALUES (1,"La jeune fille et la nuit","Une nuit glaciale, alors que le campus de son lycée est paralysé par une tempête de neige, Vinca Rockwell, 19 ans, l'une des plus brillantes élèves de classes prépas, s'enfuit avec son professeur de philo avec qui elle entretenait une relation secrète.",1,3),
        (2,"parceque je t'aime","Layla, une petite fille de cinq ans, disparaît dans un centre commercial de Los Angeles. Brisés, ses parents finissent par se séparer… Cinq ans plus tard, Layla est retrouvée à l'endroit exact où on avait perdu sa trace. Elle est vivante, mais reste plongée dans un étrange mutisme.",1,3),
        (3,"les misérables","Les Misérables est à la fois un roman d'inspiration réaliste, épique et romantique, un hymne à l'amour et un roman politique et social. Roman réaliste, Les Misérables décrit tout un univers de gens humbles. C'est une peinture très précise de la vie dans la France et le Paris pauvre au début du XIX e siècle.",2,2),
        (4,"la pain nu","Dans le Maroc des années 1940, Mohamed assiste terrorisé au meurtre de son frère par son propre père. Fuyant le « monstre », il erre dans les bas-fonds de Tanger, côtoie la famine et la délinquance. De ces nuits à la belle étoile, il gardera le goût du sexe et l'amertume de la prison.",3,1),
        (5,"IT'S END WITH US","Ce sont ceux que nous aimons qui peuvent nous faire le plus de mal. Lily Blossom Bloom n'a pas eu une enfance très facile, entre un père violent et une mère qu'elle trouve soumise, mais elle a su s'en sortir dans la vie et est à l'aube de réaliser le rêve de sa vie : ouvrir, à Boston, une boutique de fleurs.",4,2);



INSERT INTO emprunteur (id_emprunteur,nomE,prenomE,date_naissance,telephone,adresse,mail)
VALUES (1,"FELLAH","AYA","2003-4-2","0767528525","HAY-ELAZHAR","ayafellah03@gmail.com"),
        (2,"EL MERNISSI","HIBA","2002-11-23","0725963482","HAY-ELANDALOUS","hibamernissi@gmail.com"),
        (3,"errouha","ibtissam","2003-6-5-","0621457547","ELadarissa","ibtissamerrouha@gmail.com"),
        (4,"bennaghmouch","zineb","2002-7-9","0608964716","hay-riyad","zinebbennaghmoucg@gmail.com"),
        (5,"kahil","sanae","2002-5-6","0601089751","hay-elfirdaws","sanaekahil@gmail.com");

INSERT INTO emprunter (id_emprunte,id_emprunteur,id_Livre,date_debut,date_fin,date_rendu)
VALUES (1,1,1,"2022-02-15","2022-02-23","2022-02-25"),
        (2,2,3,"2022-03-03","2022-03-10","2022-03-10"),
        (3,3,4,"2022-05-02","2022-02-11",null),
         (4,1,2,"2022-02-15","2022-02-23",null),
         (6,5,3,"2022-11-20","2022-11-30",null), -- sanctionner
         (7,4,2,"2022-11-10","2022-11-20",null), --reservation
         (8,3,4,"2022-11-10","2022-11-20",null),
         (9,1,5,"2022-11-20","2022-11-30",null);
         



INSERT INTO Fournisseur(id_fournisseur,nomF,prenomF,telephone,adresse)
VALUES (1,"kaddar","jad","0721569741","HOUILLE"),
        (2,"bennhadouch","kama","0625971534","RABAT");

INSERT INTO Demande(id_Demande,id_emprunteur,Titre_LivreD)
VALUES (1,2,"IT'S END WITH US"),
        (2,2,"i have a life"),
        (3,1,"IT'S END WITH US"),
        (4,3,"IT'S END WITH US"),
        (5,4,"IT'S END WITH US"),
        (6,5,"IT'S END WITH US"),
        (7,1,"demain"),
        (8,2,"demain"),
        (9,3,"demain"),
        (10,4,"demain"),
        (11,5,"demain"),
        (12,1,"l attentat"),
        (13,2,"l attentat"),
        (14,3,"l attentat"),
        (15,4,"l attentat"),
        (16,5,"l attentat");

INSERT INTO Achat(id_Achat,Titre_LivreA,prix,date_Achat)
VALUES(1,"IT'S END WITH US","250","2022-2-10");

/*INSERT INTO Reservation(id_emprunteur,titreL,dateR) 
VALUES ()*/

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