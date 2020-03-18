-- Coupon [ent4]
create table `coupon` (
   `oid`  integer  not null,
   `numerocoupon`  varchar(255),
  primary key (`oid`)
);


-- Coupon_UserRegistrato [rel13]
alter table `userregistrato`  add column  `coupon_oid`  integer;
alter table `userregistrato`   add index fk_userregistrato_coupon (`coupon_oid`), add constraint fk_userregistrato_coupon foreign key (`coupon_oid`) references `coupon` (`oid`);


