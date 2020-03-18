-- Group [Group]
create table `group` (
   `oid_group`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid_group`)
);


-- Module [Module]
create table `module` (
   `oid_module`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid_module`)
);


-- User [User]
create table `user` (
   `oid_user`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `codicefiscale`  varchar(255),
   `cognome`  varchar(255),
   `nome`  varchar(255),
   `telefono`  varchar(255),
  primary key (`oid_user`)
);


-- Menufisso [ent1]
create table `menufisso` (
   `nome`  varchar(255)  not null,
   `costo`  double precision,
   `bevanda`  varchar(255),
   `dessert`  varchar(255),
   `contorno`  varchar(255),
   `secondo`  varchar(255),
   `primo`  varchar(255),
   `antipasto`  varchar(255),
   `datainserimento`  date,
  primary key (`nome`)
);


-- Lezione [ent11]
create table `lezione` (
   `id`  integer not null auto_increment,
   `data`  date,
   `prenotazione`  date,
   `ora`  time,
   `tipo`  varchar(255),
  primary key (`id`)
);


-- Impianto [ent15]
create table `impianto` (
   `nome`  varchar(255)  not null,
   `tipologia`  varchar(255),
   `disponibilita`  bit,
   `difficolta`  varchar(255),
  primary key (`nome`)
);


-- Ora [ent2]
create table `ora` (
   `oid`  integer not null auto_increment,
   `ora`  time,
  primary key (`oid`)
);


-- Amministratore [ent20]
create table `amministratore` (
   `user_oid_user`  integer  not null,
  primary key (`user_oid_user`)
);


-- Amimpianto [ent29]
create table `amimpianto` (
   `amministratore_oid_user`  integer  not null,
  primary key (`amministratore_oid_user`)
);


-- Portafoglio [ent3]
create table `portafoglio` (
   `oid`  integer not null auto_increment,
   `punti`  integer,
  primary key (`oid`)
);


-- Prenotazioneskipass [ent30]
create table `prenotazioneskipass` (
   `id`  integer not null auto_increment,
   `dataattivazione`  date,
   `stato`  varchar(255),
   `timeattivazione`  time,
   `timescadenza`  time,
   `datascadenza`  date,
  primary key (`id`)
);


-- Faq [ent31]
create table `faq` (
   `id`  integer not null auto_increment,
   `domanda`  longtext,
   `risposta`  longtext,
  primary key (`id`)
);


-- Amristorazione [ent32]
create table `amristorazione` (
   `amministratore_oid_user`  integer  not null,
  primary key (`amministratore_oid_user`)
);


-- Indisponibileistr [ent33]
create table `indisponibileistr` (
   `datainizio`  date,
   `id`  integer not null auto_increment,
   `datafine`  date,
  primary key (`id`)
);


-- Sconto [ent35]
create table `sconto` (
   `nome`  varchar(255)  not null,
   `datainizio`  date,
   `datafine`  date,
   `percentuale`  integer,
   `descrizione`  longtext,
  primary key (`nome`)
);


-- Amstruttura [ent36]
create table `amstruttura` (
   `amministratore_oid_user`  integer  not null,
  primary key (`amministratore_oid_user`)
);


-- Menucarta [ent37]
create table `menucarta` (
   `nome`  varchar(255)  not null,
   `prezzo`  double precision,
   `tipologia`  varchar(255),
  primary key (`nome`)
);


-- Istruttore [ent38]
create table `istruttore` (
   `user_oid_user`  integer  not null,
   `brevetto`  varchar(255),
   `stipendio`  double precision,
   `iban`  varchar(255),
  primary key (`user_oid_user`)
);


-- Quotasocio [ent39]
create table `quotasocio` (
   `datascadenza`  date,
   `dataacquisto`  date,
   `costo`  double precision,
   `idpagamento`  integer  not null,
  primary key (`idpagamento`)
);


-- CouponSocio [ent5]
create table `couponsocio` (
   `oid`  integer not null auto_increment,
   `utilizzato`  bit,
   `coupon`  varchar(255),
  primary key (`oid`)
);


-- UserRegistrato [ent7]
create table `userregistrato` (
   `user_oid_user`  integer  not null,
   `socio`  bit,
   `numerocarta`  varchar(255),
   `cvv`  integer,
   `mesescadenza`  integer,
   `annoscadenza`  integer,
  primary key (`user_oid_user`)
);


-- Skipass [ent8]
create table `skipass` (
   `tipologia`  varchar(255)  not null,
   `durata`  varchar(255),
   `prezzo`  integer,
   `punti`  integer,
   `targetutenza`  varchar(255),
  primary key (`tipologia`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid_module`  integer;
alter table `group`   add index fk_group_module (`module_oid_module`), add constraint fk_group_module foreign key (`module_oid_module`) references `module` (`oid_module`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid_group`  integer not null,
   `module_oid_module`  integer not null,
  primary key (`group_oid_group`, `module_oid_module`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid_group`), add constraint fk_group_module_group foreign key (`group_oid_group`) references `group` (`oid_group`);
alter table `group_module`   add index fk_group_module_module (`module_oid_module`), add constraint fk_group_module_module foreign key (`module_oid_module`) references `module` (`oid_module`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid_group`  integer;
alter table `user`   add index fk_user_group (`group_oid_group`), add constraint fk_user_group foreign key (`group_oid_group`) references `group` (`oid_group`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid_user`  integer not null,
   `group_oid_group`  integer not null,
  primary key (`user_oid_user`, `group_oid_group`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid_user`), add constraint fk_user_group_user foreign key (`user_oid_user`) references `user` (`oid_user`);
alter table `user_group`   add index fk_user_group_group (`group_oid_group`), add constraint fk_user_group_group foreign key (`group_oid_group`) references `group` (`oid_group`);


-- UserRegistrato_CouponSocio [rel1]
alter table `couponsocio`  add column  `userregistrato_oid_user`  integer;
alter table `couponsocio`   add index fk_couponsocio_userregistrato (`userregistrato_oid_user`), add constraint fk_couponsocio_userregistrato foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- LezioneIstruttore [rel10]
alter table `lezione`  add column  `istruttore_oid_user`  integer;
alter table `lezione`   add index fk_lezione_istruttore (`istruttore_oid_user`), add constraint fk_lezione_istruttore foreign key (`istruttore_oid_user`) references `istruttore` (`user_oid_user`);


-- IndisponibileistrIstruttore [rel11]
alter table `indisponibileistr`  add column  `istruttore_oid_user`  integer;
alter table `indisponibileistr`   add index fk_indisponibileistr_istruttor (`istruttore_oid_user`), add constraint fk_indisponibileistr_istruttor foreign key (`istruttore_oid_user`) references `istruttore` (`user_oid_user`);


-- UserRegistrato_Prenotazioneskipass [rel12]
alter table `prenotazioneskipass`  add column  `userregistrato_oid_user`  integer;
alter table `prenotazioneskipass`   add index fk_prenotazioneskipass_userreg (`userregistrato_oid_user`), add constraint fk_prenotazioneskipass_userreg foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- UserRegistrato_Quotasocio [rel15]
alter table `quotasocio`  add column  `userregistrato_oid_user`  integer;
alter table `quotasocio`   add index fk_quotasocio_userregistrato (`userregistrato_oid_user`), add constraint fk_quotasocio_userregistrato foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- Amristorazione_Sconto [rel19]
alter table `sconto`  add column  `amristorazione_oid_user`  integer;
alter table `sconto`   add index fk_sconto_amristorazione (`amristorazione_oid_user`), add constraint fk_sconto_amristorazione foreign key (`amristorazione_oid_user`) references `amristorazione` (`amministratore_oid_user`);


-- Amristorazione_Menufisso [rel2]
alter table `menufisso`  add column  `amristorazione_oid_user`  integer;
alter table `menufisso`   add index fk_menufisso_amristorazione (`amristorazione_oid_user`), add constraint fk_menufisso_amristorazione foreign key (`amristorazione_oid_user`) references `amristorazione` (`amministratore_oid_user`);


-- Amristorazione_Menucarta [rel23]
alter table `menucarta`  add column  `amristorazione_oid_user`  integer;
alter table `menucarta`   add index fk_menucarta_amristorazione (`amristorazione_oid_user`), add constraint fk_menucarta_amristorazione foreign key (`amristorazione_oid_user`) references `amristorazione` (`amministratore_oid_user`);


-- Ora_Lezione [rel3]
alter table `lezione`  add column  `ora_oid`  integer;
alter table `lezione`   add index fk_lezione_ora (`ora_oid`), add constraint fk_lezione_ora foreign key (`ora_oid`) references `ora` (`oid`);


-- UserRegistrato_Lezione [rel4]
alter table `lezione`  add column  `userregistrato_oid_user`  integer;
alter table `lezione`   add index fk_lezione_userregistrato (`userregistrato_oid_user`), add constraint fk_lezione_userregistrato foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- Ora_Prenotazioneskipass [rel5]
alter table `prenotazioneskipass`  add column  `ora_oid`  integer;
alter table `prenotazioneskipass`   add index fk_prenotazioneskipass_ora (`ora_oid`), add constraint fk_prenotazioneskipass_ora foreign key (`ora_oid`) references `ora` (`oid`);


-- Skipass_Prenotazioneskipass [rel7]
alter table `prenotazioneskipass`  add column  `skipass_tipologia`  varchar(255);
alter table `prenotazioneskipass`   add index fk_prenotazioneskipass_skipass (`skipass_tipologia`), add constraint fk_prenotazioneskipass_skipass foreign key (`skipass_tipologia`) references `skipass` (`tipologia`);


-- UserRegistrato_Portafoglio [rel8]
alter table `portafoglio`  add column  `userregistrato_oid_user`  integer;
alter table `portafoglio`   add index fk_portafoglio_userregistrato (`userregistrato_oid_user`), add constraint fk_portafoglio_userregistrato foreign key (`userregistrato_oid_user`) references `userregistrato` (`user_oid_user`);


-- Amimpianto_Impianto [rel9]
create table `amimpianto_impianto` (
   `amimpianto_oid_user`  integer not null,
   `impianto_nome`  varchar(255) not null,
  primary key (`amimpianto_oid_user`, `impianto_nome`)
);
alter table `amimpianto_impianto`   add index fk_amimpianto_impianto_amimpia (`amimpianto_oid_user`), add constraint fk_amimpianto_impianto_amimpia foreign key (`amimpianto_oid_user`) references `amimpianto` (`amministratore_oid_user`);
alter table `amimpianto_impianto`   add index fk_amimpianto_impianto_impiant (`impianto_nome`), add constraint fk_amimpianto_impianto_impiant foreign key (`impianto_nome`) references `impianto` (`nome`);


-- GEN FK: Amministratore --> User
alter table `amministratore`   add index fk_amministratore_user (`user_oid_user`), add constraint fk_amministratore_user foreign key (`user_oid_user`) references `user` (`oid_user`);


-- GEN FK: Amimpianto --> Amministratore
alter table `amimpianto`   add index fk_amimpianto_amministratore (`amministratore_oid_user`), add constraint fk_amimpianto_amministratore foreign key (`amministratore_oid_user`) references `amministratore` (`user_oid_user`);


-- GEN FK: Amristorazione --> Amministratore
alter table `amristorazione`   add index fk_amristorazione_amministrato (`amministratore_oid_user`), add constraint fk_amristorazione_amministrato foreign key (`amministratore_oid_user`) references `amministratore` (`user_oid_user`);


-- GEN FK: Amstruttura --> Amministratore
alter table `amstruttura`   add index fk_amstruttura_amministratore (`amministratore_oid_user`), add constraint fk_amstruttura_amministratore foreign key (`amministratore_oid_user`) references `amministratore` (`user_oid_user`);


-- GEN FK: Istruttore --> User
alter table `istruttore`   add index fk_istruttore_user (`user_oid_user`), add constraint fk_istruttore_user foreign key (`user_oid_user`) references `user` (`oid_user`);


-- GEN FK: UserRegistrato --> User
alter table `userregistrato`   add index fk_userregistrato_user (`user_oid_user`), add constraint fk_userregistrato_user foreign key (`user_oid_user`) references `user` (`oid_user`);


