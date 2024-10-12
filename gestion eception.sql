
--trigger suppression:

create table trace (
         user varchar(30),
        id_empreinteur int,
        id_Livre     int,
        date_debut   date, 
       date_fin     date ,
       date_rendu date
)engine=Innodb


create trigger emprunter_D after delete on emprunter for each row
begin
   insert into trace(user,id_empreinteur,id_Livre,date_debut,date_fin,date_rendu)values(current_user(),old.id_emprunteur,old.id_Livre,old.date_debut,old.date_fin,old.date_rendu);
end $

