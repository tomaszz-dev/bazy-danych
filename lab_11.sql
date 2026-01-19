#zadanie 1
CREATE table student(
id_studenta int unsigned primary key auto_increment,
imie varchar(100) not null,
nazwisko varchar(100) not null,
rok_studiow int unsigned,
data_urodzenia DATE
);

#zadanie 2
CREATE table kierunek(
id_kierunku int unsigned primary key auto_increment,
nazwa_kierunku varchar(200) not null
);

#zadanie 3
create table student_na_kierunku(
student int unsigned,
kierunek int unsigned,
foreign key (student) REFERENCES student(id_studenta),
foreign key (student) REFERENCES kierunek(id_kierunku)
);

#zadanie 4
create table przedmiot(
id_przedmiotu int primary key auto_increment,
nazwa_przedmiotu varchar(200) not null,
opis longtext
);

#zad 5
create table kierunek_has_przedmioty(
kierunek int unsigned not null,
przedmiot int not null,
obowiazkowy enum('0','1') DEFAULT '1'
);

alter table kierunek_has_przedmioty add FOREIGN KEY (kierunek) references kierunek(id_kierunku);
alter table kierunek_has_przedmioty add FOREIGN KEY (przedmiot) references przedmiot(id_przedmiotu);

#zad 6
insert into student values(null,'janusz','nowak','2003','1980.01.01'),
(null,'adam','nowak','2001','1930.01.01'),
(null,'szymon','nowak','2002','1984.01.01'),
(null,'Sergiej','Novakov','1993','1939.01.01');

insert into kierunek values(null,'Informatyka'),
(null,'Matematyka');

insert into student_na_kierunku values(1,4),
(2,2),
(1,3),
(2,4);

insert into przedmiot values(null,'algebra',null),
(null,'repetyrorium',null),
(null,'programowanie',null),
(null,'logika',null);

insert into kierunek_has_przedmioty values
(1,1,DEFAULT),
(1,2,DEFAULT),
(2,3,DEFAULT),
(2,4,1);

#zadanie 7
alter table przedmiot modify opis VARCHAR(100) DEFAULT 'Brak opisu';

#zadanie 8
alter table kierunek_has_przedmioty 
drop FOREIGN KEY kierunek_has_przedmioty_ibfk_1;

alter table kierunek_has_przedmioty 
drop FOREIGN KEY kierunek_has_przedmioty_ibfk_2;

ALTER TABLE student_na_kierunku DROP FOREIGN KEY student_na_kierunku_ibfk_1;


ALTER TABLE student
modify id_studenta INT unsigned not null;

alter table student
drop PRIMARY KEY;


alter table student
add column indeks int primary key;


#zadanie 9

