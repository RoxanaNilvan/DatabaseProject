ALTER TABLE PC DROP CONSTRAINT produs_pc_fk;
ALTER TABLE Laptop DROP CONSTRAINT produs_laptop_fk;
ALTER TABLE Imprimanta DROP CONSTRAINT produs_imprimanta_fk;

ALTER TABLE Produs DROP CONSTRAINT categorie_produs_ck;
ALTER TABLE Imprimanta DROP CONSTRAINT culoare_imprimanta_ck;
ALTER TABLE Imprimanta DROP CONSTRAINT tip_imprimanta_ck;

ALTER TABLE PC DROP CONSTRAINT RAM_PC_ck;
ALTER TABLE Laptop DROP CONSTRAINT ecran_laptop_ck;

DROP TABLE Produs;
DROP TABLE PC;
DROP TABLE Laptop;
DROP TABLE Imprimanta;

-- crearea tabelelor
-- 9.01 a)
CREATE TABLE Produs(
    model number NOT NULL,
    fabricant varchar(50) NOT NULL,
    categorie varchar(50) NOT NULL,
    pret number NOT NULL,
    CONSTRAINT produs_pk PRIMARY KEY(model)
);

-- 9.01 b)
CREATE TABLE PC(
    model number NOT NULL,
    viteza number NOT NULL,
    RAM number NOT NULL,
    HD number NOT NULL,
    CONSTRAINT pc_pk PRIMARY KEY(model)
);

-- 9.01 c)
CREATE TABLE Laptop(
    model number NOT NULL,
    viteza number NOT NULL,
    RAM number NOT NULL,
    HD number NOT NULL,
    ecran number NOT NULL,
    CONSTRAINT laptop_pk PRIMARY KEY(model)
);

-- 9.01 d)
CREATE TABLE Imprimanta(
    model number NOT NULL,
    culoare varchar(50) NOT NULL,
    tip varchar(50) NOT NULL,
    CONSTRAINT imprimanta_pk PRIMARY KEY(model)
);

-- 9.01 

-- constrangeri straine
ALTER TABLE PC ADD CONSTRAINT produs_pc_fk FOREIGN KEY (model) REFERENCES Produs(model) ON DELETE CASCADE;
ALTER TABLE Laptop ADD CONSTRAINT produs_laptop_fk FOREIGN KEY (model) REFERENCES Produs(model) ON DELETE CASCADE;
ALTER TABLE Imprimanta ADD CONSTRAINT produs_imprimanta_fk FOREIGN KEY (model) REFERENCES Produs(model) ON DELETE CASCADE;

ALTER TABLE Produs ADD CONSTRAINT categorie_produs_ck CHECK (categorie IN('PC', 'Laptop', 'Imprimanta'));
ALTER TABLE Imprimanta ADD CONSTRAINT culoare_imprimanta_ck CHECK (culoare IN('D', 'N'));
ALTER TABLE Imprimanta ADD CONSTRAINT tip_imprimanta_ck CHECK (tip IN('ace', 'jet', 'laser'));
-- 9.01 f)
ALTER TABLE Produs
ADD moneda varchar(50);

-- 9.02 a)
ALTER TABLE Laptop ADD CONSTRAINT ecran_laptop_ck CHECK (ecran >= 12 and ecran <= 19);

-- 9.02 b)
ALTER TABLE PC ADD CONSTRAINT RAM_PC_ck CHECK((hd > 500 and RAM > 1) or (RAM < 1 and hd < 500));

-- inserare date
-- Inserare in tabelul Produs

  -- pc
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1000, 'Dell', 'PC', 1695, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1001, 'Dell', 'PC', 898, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1002, 'Dell', 'PC', 1295, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1003, 'Dell', 'PC', 1395, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1004, 'Lenovo', 'PC', 2180, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1005, 'Lenovo', 'PC', 2000, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1006, 'Lenovo', 'PC', 1329, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1007, 'Lenovo', 'PC', 1230, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1008, 'HP', 'PC', 700, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1009, 'HP', 'PC', 880, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1010, 'HP', 'PC', 1695, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1011, 'HP', 'PC', 1230, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1012, 'HP', 'PC', 700, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1013, 'Lenovo', 'PC', 880, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1014, 'Dell', 'PC', 600, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1015, 'Lenovo', 'PC', 1000, 'EUR');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1016, 'Dell', 'PC', 1200, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1017, 'HP', 'PC', 880, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1018, 'HP', 'PC', 500, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1019, 'Lenovo', 'PC', 1000, 'RON');

  -- laptopuri
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0000, 'Dell', 'Laptop', 3699, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0001, 'Dell', 'Laptop', 3999, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0002, 'Dell', 'Laptop', 5499, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0003, 'Dell', 'Laptop', 3199, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0004, 'Lenovo', 'Laptop', 3499, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0005, 'Lenovo', 'Laptop', 3799, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0006, 'Lenovo', 'Laptop', 6000, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0007, 'Lenovo', 'Laptop', 5599, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0008, 'ASUS', 'Laptop', 4499, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0009, 'ASUS', 'Laptop', 2699, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0010, 'ASUS', 'Laptop', 3000, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0011, 'ASUS', 'Laptop', 3399, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0012, 'Dell', 'Laptop', 999, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0013, 'Lenovo', 'Laptop', 900, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0014, 'ASUS', 'Laptop', 899, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0015, 'Dell', 'Laptop', 500, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0016, 'Lenovo', 'Laptop', 600, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0017, 'ASUS', 'Laptop', 800, 'EUR');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0018, 'Dell', 'Laptop', 500, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0019, 'Lenovo', 'Laptop', 850, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0020, 'ASUS', 'Laptop', 1000, 'EUR');

  --imprimanta
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(100, 'HP', 'Imprimanta', 479, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(101, 'HP', 'Imprimanta', 699, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(102, 'HP', 'Imprimanta', 239, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(103, 'HP', 'Imprimanta', 349, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(104, 'HP', 'Imprimanta', 289, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(105, 'Canon', 'Imprimanta', 289, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(106, 'Canon', 'Imprimanta', 319, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(107, 'Canon', 'Imprimanta', 519, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(108, 'Canon', 'Imprimanta', 249, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(109, 'Canon', 'Imprimanta', 429, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(110, 'XEROX', 'Imprimanta', 449, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(111, 'XEROX', 'Imprimanta', 663, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(112, 'XEROX', 'Imprimanta', 1105, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(113, 'XEROX', 'Imprimanta', 1773, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(114, 'XEROX', 'Imprimanta', 2000, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(115, 'XEROX', 'Imprimanta', 663, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(116, 'Canon', 'Imprimanta', 663, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(117, 'HP', 'Imprimanta', 663, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(118, 'Canon', 'Imprimanta', 239, 'RON');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(119, 'XEROX', 'Imprimanta', 239, 'RON');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(120, 'HP', 'Imprimanta', 50, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(121, 'HP', 'Imprimanta', 100, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(122, 'HP', 'Imprimanta', 1000, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(123, 'HP', 'Imprimanta', 60, 'EUR');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(124, 'Canon', 'Imprimanta', 200, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(125, 'Canon', 'Imprimanta', 55, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(126, 'Canon', 'Imprimanta', 100, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(127, 'Canon', 'Imprimanta', 1050, 'EUR');

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(128, 'XEROX', 'Imprimanta', 70, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(129, 'XEROX', 'Imprimanta', 250, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(130, 'XEROX', 'Imprimanta', 85, 'EUR');
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(131, 'XEROX', 'Imprimanta', 300, 'EUR');

-- Inserare in tabelul PC
INSERT INTO PC(model, viteza, ram, hd) VALUES(1000,  3.60, 16, 620);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1001,  3.60, 16, 512);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1002,  3.60, 0.50, 240);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1003,  3.60, 0.75, 480);

INSERT INTO PC(model, viteza, ram, hd) VALUES(1004,  3.60, 16, 512);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1005,  4.20, 8, 1000);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1006,  2.80, 0.75, 480);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1007,  2.80, 16, 1000);

INSERT INTO PC(model, viteza, ram, hd) VALUES(1008,  3.60, 0.50, 240);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1009,  3.60, 16, 620);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1010,  3.60, 0.75, 480);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1011,  2.50, 8, 520);

INSERT INTO PC(model, viteza, ram, hd) VALUES(1012,  3.60, 16, 1200);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1013,  4.50, 8, 1200);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1014,  3.60, 16, 1200);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1015,  3.50, 8, 1200);

INSERT INTO PC(model, viteza, ram, hd) VALUES(1016,  3.60, 16, 1200);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1017,  4.50, 8, 1200);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1018,  3.60, 16, 1028);
INSERT INTO PC(model, viteza, ram, hd) VALUES(1019,  3.50, 8, 1200);

-- Inserare in tabelul Laptop
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0000,  4.40, 16, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0001,  4.70, 16, 1000, 19);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0002,  5.00, 16, 1000, 14.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0003,  4.40, 16, 512, 15.6);

INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0004,  4.50, 16, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0005,  4.50, 16, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0006,  5.00, 16, 512, 19.0);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0007,  4.20, 16, 512, 19.0);

INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0008,  4.70, 16, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0009,  4.70, 8, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0010,  4.40, 8, 512, 13.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0011,  4.40, 8, 512, 15.6);

INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0012,  4.40, 8, 512, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0013,  4.40, 8, 512, 12.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0014,  4.40, 8, 512, 15.6);

INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0015,  5.40, 16, 10000, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0016,  4.40, 8, 512, 19.0);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0017,  4.70, 8, 512, 15.6);

INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0018,  5.40, 16, 10000, 15.6);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0019,  4.40, 8, 1000, 19.0);
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0020,  4.70, 8, 512, 15.6);


-- Inserare in tabelul Imprimanta
INSERT INTO Imprimanta(model, culoare, tip) VALUES(100, 'D', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(101, 'N', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(102, 'D', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(103, 'N', 'ace');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(104, 'N', 'ace');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(105, 'D', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(106, 'N', 'ace');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(107, 'D', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(108, 'N', 'ace');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(109, 'N', 'ace');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(110, 'N', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(111, 'N', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(112, 'N', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(113, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(114, 'D', 'laser');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(115, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(116, 'N', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(117, 'N', 'ace');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(118, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(119, 'N', 'jet');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(120, 'N', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(121, 'N', 'ace');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(122, 'N', 'ace');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(123, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(124, 'D', 'laser');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(125, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(126, 'N', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(127, 'N', 'ace');

INSERT INTO Imprimanta(model, culoare, tip) VALUES(128, 'D', 'laser');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(129, 'N', 'jet');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(130, 'N', 'jet');