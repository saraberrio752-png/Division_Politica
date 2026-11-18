create database divisionpolitica
go

use divisionpolitica
go

create table continente(
    id     int identity(1,1) primary key,
    nombre varchar(50) not null
)

create table tiporegion(
    id         int identity(1,1) primary key,
    tiporegion varchar(50) not null
)

create table pais(
    id           int identity(1,1) primary key,
    nombre       varchar(50) not null,
    idcontinente int not null references continente(id),
    idtiporegion int not null references tiporegion(id),
    moneda       varchar(50) null
)

create table region(
    id        int identity(1,1) primary key,
    nombre    varchar(50) not null,
    idpais    int not null references pais(id),
    area      float null,
    poblacion int null
)

create table ciudad(
    id                int identity(1,1) primary key,
    nombre            varchar(50) not null,
    idregion          int not null references region(id),
    capitalregion     bit null,
    capitalpais       bit null,
    areametropolitana float null,
    area              float null,
    poblacion         int null
)
go