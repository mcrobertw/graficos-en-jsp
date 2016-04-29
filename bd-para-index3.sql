--Nombre de la base de datos: telesup


create table carrera(
	idcarrera int NOT NULL AUTO_INCREMENT,
	nomcarrera varchar(50),
	
	PRIMARY KEY(idcarrera)
	);

create table matricula(
	idmatricula int NOT NULL AUTO_INCREMENT,
	idcarrera int,
	PRIMARY KEY(idmatricula)
);

ALTER TABLE matricula
ADD FOREIGN KEY (idcarrera)
REFERENCES carrera(idcarrera);

	
insert into carrera(idcarrera,nomcarrera)values(1,'Ingenieria en Sistemas'),(2,'Ingenieria Forestal'),(3,'Artes Marciales');

insert into matricula (idcarrera) values(1),(1),(1),(1),(1),(1),(1),(2),(2),(2),(2),(3),(3);