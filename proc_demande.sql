
--DEMANDE 

DELIMITER $
create procedure Demande3 ()
begin  
declare titre varchar(250);
 set titre= (select  Titre_LivreD from Demande  group by Titre_LivreD having count(id_demande)>=5 );
 select titre;
end$


----------------------------------------------------
--ACHAT 
create procedure insert_achat(TitreL varchar(250),p float)
begin
  insert into Achat(Titre_LivreA,prix,date_Achat)values(TitreL,p,NOW());
end$


call insert_achat ("demain","250");$



-----------------------------------------------------------------------
--LIVRE 

create procedure nouveauL3( titre varchar(250),descL varchar(520),nomA varchar(20),prenomA varchar(20),dateN date,cate varchar(20))
begin
declare id_A int;
declare id_C int;
if (select count(id_Auteur) from Auteur where nom=nomA and prenom=prenomA)=0 
   then
    insert into Auteur(nom,prenom,date_naissance)values(nomA,prenomA,dateN);
    set id_A=(select id_Auteur from Auteur where nom=nomA and prenom=prenomA);
else
   set id_A=(select id_Auteur from Auteur where nom=nomA);
end if;

if (select count(id_categorie) from categorie where libelle=cate)=0
 then
    insert into categorie(libelle)values(cate);
    set id_C=(select id_categorie from categorie where libelle=cate);
else
 set id_C=(select id_categorie from categorie where libelle=cate);
end if;

insert into livre(titreL,description,id_Auteur,id_categorie)values(titre,descL,id_A,id_C);
end$


call nouveauL3('demain','salut','MUSSO','GUILLAUME','1974-6-7','roman');
call nouveauL3('livre1','bonjour','CHOUKRI','mohamed','1935-7-15','science');
call nouveauL3('l attentat','bonjour','KHADRA','yasmina','1960-7-4','politique');

-------------------------------------------------------------------------
--MESSAGE
CREATE TRIGGER trigg_msg
AFTER INSERT on Livre for each row
BEGIN 
INSERT INTO message (mail_emprunteur,objetmsg,contenumsg)
(SELECT e.mail,'reception livre demandé','Bonjour,nous avons recu le livre que vous avez demandé.'
FROM Demande d,emprunteur e
WHERE e.id_emprunteur=d.id_emprunteur
AND d.Titre_LivreD = new.titreL);
end;
$

--------------------------------------------------------------------------------