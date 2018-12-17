create database MusicShop;
use MusicShop;

create table brands
(
  id    int         not null identity (1,1),
  brand varchar(50) not null,
  primary key (id)
);

create table strings
(
  id       int         not null identity (1,1),
  brand_id int         not null,
  model    varchar(50) not null,
  price    int         not null,
  primary key (id),
  foreign key (brand_id) references brands (id)
);

create table corpora
(
  id          int         not null identity (1,1),
  model       varchar(50) not null,
  wood        varchar(50) not null,
  fret_number int         not null,
  price       int         not null,
  primary key (id)
);

create table guitars
(
  id        int not null identity (1,1),
  brand_id  int not null,
  string_id int not null,
  corpus_id int not null,
  foreign key (string_id) references strings (id),
  foreign key (corpus_id) references corpora (id),
  foreign key (brand_id) references brands (id),
  primary key (id)
);

create table buyers
(
  id      int         not null identity (1,1),
  name    varchar(50) not null,
  surname varchar(50) not null,
  primary key (id)
);

create table guitars_trade
(
  id        int  not null identity (1,1),
  guitar_id int  not null,
  buyer_id  int  not null,
  date      date not null default getdate(),
  primary key (id, guitar_id, buyer_id),
  foreign key (guitar_id) references guitars (id),
  foreign key (buyer_id) references buyers (id)
);
