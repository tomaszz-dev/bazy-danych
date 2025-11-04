describe zadanie;

#zadanie 1

#usuniecie klucza obcego
alter table projekt drop foreign key projekt_ibfk_1; 
alter table zadanie drop foreign key zadanie_ibfk_2;
alter table projekt drop foreign key projekt;

#usuwanie auto_increment
alter table pracownik change id_pracownika id_pracownika int;
alter table pracownik modify id_pracownika INT;

describe zadanie;
describe pracownik;
describe projekt;
-- alter table projekt add column id_pracownika INT;

SHOW CREATE TABLE zadanie;

#usuwanie klucza glownego
alter table pracownik drop primary key;

#dodanie klucza glownego
alter table pracownik add primary key (id_pracownika);

#odtwarzanie kluczy obcych
alter table zadanie add foreign key (pracownik) references pracownik(id_pracownika) ON DELETE SET NULL;
alter table projekt add foreign key (id_pracownika) references pracownik(id_pracownika) ON DELETE CASCADE;




#zadanie 2

#dodanie kolumny
ALTER TABLE zadanie ADD COLUMN godziny_szacunkowe INT DEFAULT 8;
describe zadanie;

#ustawienie wafrtosci
select * from zadanie;
UPDATE zadanie SET godziny_szacunkowe=4 WHERE id_zadania=1;
UPDATE zadanie SET godziny_szacunkowe=12 WHERE id_zadania=3;

#ustaiwnei defaulta na 6 
ALTER TABLE zadanie change godziny_szacunkowe godziny_szacunkowe INT DEFAULT 6;

#sprawdzenie
insert into zadanie(nazwa_zadania) VALUES('zaparzenie kawy');




#zadanie 3
alter table projekt add column opis_projektu VARCHAR(50);

#zmiana
alter table projekt modify opis_projektu VARCHAR(200);
desc projekt;

#update
SELECT * FROM projekt;
UPDATE projekt SET opis_projektu='pilne wdrożenie!!!' WHERE id_projektu=1;
UPDATE projekt SET opis_projektu='MVP' WHERE id_projektu=2;

#usuniecie opisu
alter table projekt drop column opis_projektu;
desc projekt;




#zadanie 4
#usuniecie
desc zadanie;
show create table zadanie;
alter table zadanie drop foreign key zadanie_ibfk_1;

#dodanie klcza obcego
desc projekt;
ALTER TABLE zadanie add foreign key (projekt) REFERENCES projekt(id_projektu) ON DELETE SET NULL;

#usuniecie projektu
select * from projekt;
delete from projekt where id_projektu=1;

#sprawdzenie
SELECT * FROM zadanie;