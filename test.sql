--sanctionner

DELIMITER $
CREATE PROCEDURE insert_sanction(id_emprunt int,id_liv int)
BEGIN 
    declare d date;
    declare id int;

    SELECT date_fin,id_emprunte INTO d,id 
    FROM emprunter 
    WHERE id_emprunteur=id_emprunt
    AND id_Livre=id_liv
    AND date_rendu IS NULL;

    IF sysdate()-d<10 
        THEN 
            INSERT INTO Sanctionner (id_emprunteur,motif)
                values (id_emprunt,"l'emprunteur a dépassé la date de moins de 10 jours");
    end if;

    IF sysdate()-d>10 
        THEN 
            INSERT INTO Sanctionner (id_emprunteur,motif)
                values (id_emprunt,"l'emprunteur a dépassé la date de plus de 10 jours");
    end if; 

    update emprunter 
    SET date_rendu = sysdate()
    where id_emprunte = id;

end $
call insert_sanction1(1,2)$
call insert_sanction(5,3)$ --




--------------------------------------------------------

--reservation
create procedure insert_reservation2 (id_emp int,titre varchar(250))
begin 
declare c int;
declare l int;

select id_livre into l
from Livre
where titreL=titre;

select count(1) into c
from emprunter 
where id_livre=l
and date_rendu is null;

if c>0
    then 
        insert into Reservation (id_emprunteur,titreL,dateR)
        values (id_emp,titre,sysdate());
end if;

if c=0
    then 
        insert into emprunter(id_emprunteur,id_Livre,date_debut,date_fin)
        values(id_emp,l,sysdate(),Date_ADD(sysdate(), interval 10 day));
end if;
end $

call insert_reservation2(1,"La jeune fille et la nuit");$
call insert_reservation2 (3,"parceque je t'aime");$

-------------------priorite emprunteur -------------------
Create procedure priorite_emprunte(titre varchar(250),idemp int) 
Begin
Declare idE int;
Declare idL int;
declare msg varchar(250);
 set idE=(Select r.id_emprunteur From reservation r Where r.titreL=titre Order by r.dateR asc Limit 1);
set idL= (Select id_Livre  From Livre  Where titreL=titre);
if idE=idemp
then
Insert into emprunter(id_emprunteur, id_Livre, date_debut, date_fin) values(idE, idL, Now(), Date_ADD(sysdate(), interval 10 day)) ;
else
set msg='vous avez pas la priorite d emprunter ce livre';
select msg;
end if;
End 
$

call priorite_emprunte("la jeune fille et la nuit ",2)$ --pas de priorite
call priorite_emprunte("la jeune fille et la nuit ",1)$ --insertion emprunter