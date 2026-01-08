
-- Tabela: Obsluga
CREATE TABLE Obsluga (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    pesel VARCHAR(11),
    stanowisko VARCHAR(100),
    wynagrodzenie DECIMAL(10,2),
    email VARCHAR(100),
    aktywny BOOLEAN
);

-- Tabela: Typy_Pojazdow
CREATE TABLE Typy_Pojazdow (
    id_typu INT PRIMARY KEY,
    nazwa VARCHAR(100),
    opis TEXT,
    pojemnosc_pasazerow INT,
    zasieg_km BIGINT,
    predkosc_max_kmh INT
);

-- Tabela: Rakiety
CREATE TABLE Rakiety (
    id_rakiety INT PRIMARY KEY,
    nazwa VARCHAR(100),
    producent VARCHAR(100),
    udzwig_kg INT,
    koszt_startu DECIMAL(12,2),
    liczba_uzyc INT,
    status_operacyjny ENUM('aktywny', 'nieaktywny', 'wycofany')
);

-- Tabela: Kierunki_Wypraw
CREATE TABLE Kierunki_Wypraw (
    id_miejsca INT PRIMARY KEY,
    nazwa VARCHAR(100),
    typ ENUM('planeta', 'orbita', 'stacja', 'ksiezyc', 'pas asteroid'),
    wspolrzedne_x DECIMAL(15,3),
    wspolrzedne_y DECIMAL(15,3),
    wspolrzedne_z DECIMAL(15,3),
    odleglosc_od_ziemi_km BIGINT,
    grawitacja_g DECIMAL(4,2),
    poziom_ryzyka ENUM('niski', 'sredni', 'wysoki', 'ekstremalny')
);

-- Tabela: Pojazdy_Kosmiczne
CREATE TABLE Pojazdy_Kosmiczne (
    id_pojazdu INT PRIMARY KEY,
    nazwa VARCHAR(100),
    id_typu INT,
    data_produkcji DATE,
    ostatni_przeglad DATE,
    status_operacyjny ENUM('aktywny', 'nieaktywny', 'w naprawie'),
    FOREIGN KEY (id_typu) REFERENCES Typy_Pojazdow(id_typu)
);

-- Tabela: Koszty
CREATE TABLE Koszty (
    id_kosztu INT PRIMARY KEY,
    id_wyprawy INT,
    kategoria ENUM('logistyka', 'paliwo', 'sprzet', 'ubezpieczenie', 'inne'),
    opis VARCHAR(200),
    kwota DECIMAL(12,2),
    data_poniesienia DATE
);

-- Tabela: Rodzaje_Wypraw
CREATE TABLE Rodzaje_Wypraw (
    id_rodzaju INT PRIMARY KEY,
    nazwa VARCHAR(100),
    opis TEXT,
    czas_trwania_dni INT,
    id_miejsca_docelowego INT,
    cena_bazowa DECIMAL(12,2),
    poziom_trudnosci ENUM('łatwy', 'umiarkowany', 'trudny', 'ekstremalny'),
    FOREIGN KEY (id_miejsca_docelowego) REFERENCES Kierunki_Wypraw(id_miejsca)
);

-- Tabela: Klienci
CREATE TABLE Klienci (
    id_klienta INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    pesel VARCHAR(11),
    email VARCHAR(100),
    telefon VARCHAR(15),
    wyniki_badan ENUM('dobry', 'zły', 'fatalny')
);

-- Tabela: Wyprawy
CREATE TABLE Wyprawy (
    id_wyprawy INT PRIMARY KEY,
    id_rodzaju_wyprawy INT,
    id_pojazdu INT,
    id_rakiety INT,
    id_pilota INT,
    data_startu DATETIME,
    data_powrotu DATETIME,
    status_wyprawy ENUM('zaplanowana', 'w trakcie', 'zakończona', 'anulowana'),
    FOREIGN KEY (id_rodzaju_wyprawy) REFERENCES Rodzaje_Wypraw(id_rodzaju),
    FOREIGN KEY (id_pojazdu) REFERENCES Pojazdy_Kosmiczne(id_pojazdu),
    FOREIGN KEY (id_rakiety) REFERENCES Rakiety(id_rakiety),
    FOREIGN KEY (id_pilota) REFERENCES Obsluga(id_pracownika)
);

-- Tabela: Kontakty_Awaryjne
CREATE TABLE Kontakty_Awaryjne (
    id_kontaktu INT PRIMARY KEY,
    id_klienta INT,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    stopien_pokrewienstwa VARCHAR(50),
    telefon VARCHAR(15),
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta)
);

-- Tabela: Rezerwacje
CREATE TABLE Rezerwacje (
    id_rezerwacji INT PRIMARY KEY,
    id_klienta INT,
    id_wyprawy INT,
    data_rezerwacji DATE,
    cena_koncowa DECIMAL(12,2),
    status_platnosci ENUM('oczekująca', 'zrealizowana', 'anulowana'),
    metoda_platnosci ENUM('karta', 'przelew', 'blik', 'gotówka', 'kryptowaluta'),
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
    FOREIGN KEY (id_wyprawy) REFERENCES Wyprawy(id_wyprawy)
);

-- Tabela: Opinie_Klientow
CREATE TABLE Opinie_Klientow (
    id_oceny INT PRIMARY KEY,
    id_klienta INT,
    id_wyprawy INT,
    ocena INT,
    komentarz TEXT,
    czy_poleca BOOLEAN,
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
    FOREIGN KEY (id_wyprawy) REFERENCES Wyprawy(id_wyprawy)
);

-- Tabela: Sponsorzy
CREATE TABLE Sponsorzy (
    id_sponsora INT PRIMARY KEY,
    nazwa VARCHAR(100),
    kraj VARCHAR(50),
    typ ENUM('rządowy', 'prywatny', 'organizacja międzynarodowa'),
    kwota_wsparcia DECIMAL(14,2),
    data_poczatku_wspolpracy DATE
);

-- Tabela: Wspieramy
CREATE TABLE Wspieramy (
    id_fundacji INT PRIMARY KEY,
    nazwa VARCHAR(100),
    kraj VARCHAR(50),
    forma_pomocy ENUM('darowizna', 'udział technologiczny', 'kampania medialna'),
    data_rozpoczecia_wspolpracy DATE
);

-- Tabela: Partnerzy_Strategiczni
CREATE TABLE Partnerzy_Strategiczni (
    id_partnera INT PRIMARY KEY,
    nazwa VARCHAR(100),
    branża VARCHAR(50),
    kontakt_email VARCHAR(100),
    status_wspolpracy ENUM('aktywny', 'zawieszony', 'zakończony')
);

