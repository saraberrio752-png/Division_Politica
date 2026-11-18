create table moneda (
id int identity (1,1) primary key,
moneda varchar (60) not null,
sigla varchar (50)  null,
imagen varbinary (max) null
)

go

insert into moneda (moneda)
select distinct moneda
from pais
where moneda is not null;

go

alter table pais add idmoneda int null

go

alter table pais
add constraint fk_pais_moneda foreign key (idmoneda) references moneda(id)

go

update p
set p.idmoneda = m.id
from pais p
join moneda m on m.moneda = p.moneda

go
select p.nombre, p.moneda as monedavieja, m.moneda as monedanueva
from pais p
left join moneda m on m.id = p.idmoneda

go

alter table pais drop column moneda

go

alter table pais 
add mapa varbinary (max) null,
bandera varbinary (max) null

go

select p.id, p.nombre, m.moneda, p.mapa, p.bandera
from pais  p
left join moneda m on m.id = p.idmoneda 




