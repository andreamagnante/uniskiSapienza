-- PrenotaRistorante [ent6]
create table `prenotaristorante` (
   `oid`  integer  not null,
   `stato`  varchar(255),
   `coupon`  varchar(255),
   `tipomenu`  varchar(255),
   `oraprenotazione`  time,
   `dataprenotazione`  date,
  primary key (`oid`)
);


-- UserRegistrato_PrenotaRistorante [rel13]
alter table `prenotaristorante`  add column  `userregistrato_oid_user`  integer;
alter table `prenotaristorante`   add index fk_prenotaristorante_userregis (`userregistrato_oid_user`), add constraint fk_prenotaristorante_userregis foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- Ora_PrenotaRistorante [rel17]
alter table `prenotaristorante`  add column  `ora_oid`  integer;
alter table `prenotaristorante`   add index fk_prenotaristorante_ora (`ora_oid`), add constraint fk_prenotaristorante_ora foreign key (`ora_oid`) references `ora` (`oid`);


-- Amristorazione_PrenotaRistorante [rel6]
alter table `prenotaristorante`  add column  `amristorazione_oid_user`  integer;
alter table `prenotaristorante`   add index fk_prenotaristorante_amristora (`amristorazione_oid_user`), add constraint fk_prenotaristorante_amristora foreign key (`amristorazione_oid_user`) references `amristorazione` (`amministratore_oid_user`);


