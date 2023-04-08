-- Interogari colocviu partial

-- test primary key
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(0000, 'Dell', 'Laptop', 3699, 'RON');
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(0000,  4.40, 16, 512, 15.6);


-- 9.03 a)
-- Să se găsească fabricanții de laptopuri cu preț sub 1000 RON ordonat alfabetic.

SELECT fabricant
FROM Produs
WHERE categorie = 'Laptop' AND pret < 1000 AND moneda = 'RON'
ORDER BY fabricant;


-- 9.03 b)
-- Să se găsească detaliile laptopurilor cu ecran 19’’ ordonat descrescător după ram
-- și crescător după hd.

SELECT *
FROM Laptop
WHERE ecran = 19 
ORDER BY RAM DESC, hd;


-- 9.04 a)
-- Să se găsească numărul de model, culoarea, tipul şi prețul imprimantelor fabricate de
-- HP ordonat crescător după culoare, tip și preț.

SELECT model, culoare, tip, pret
FROM imprimanta JOIN produs USING(model)
WHERE  fabricant = 'HP'
ORDER BY culoare, tip, pret;


-- 9.04 b) 
-- Să se găsească perechi de modele (model1, model2) de pc-uri cu condiția să aibă aceeași 
-- viteză, ram și hd dar fabricanți diferiți. O pereche este unică în rezultat.

SELECT DISTINCT pc1.model AS model1, pc2.model AS model2
FROM pc pc1, pc pc2, produs p1, produs p2
WHERE pc1.viteza = pc2.viteza AND pc1.ram = pc2.ram AND pc1.hd = pc2.hd AND p1.fabricant <> p2.fabricant AND 
      p1.categorie ='PC' AND p2.categorie = 'PC' AND pc1.model = p1.model AND pc2.model = p2.model AND pc1.model > pc2.model;


-- 9.05
-- Să se exprime în SQL fără funcții de agregare următoarele interogări folosind cel puțin
-- o interogare imbricată și operatori de genul EXISTS, IN, ALL, ANY:
-- a)
-- Să se găsească fabricanții de laptop-uri cu hd 1TB și prețul cel mai mic.

SELECT produs.fabricant
FROM Produs JOIN Laptop USING(model)
WHERE laptop.HD = 1000 and Produs.pret <= ALL (SELECT pret
                                          FROM produs JOIN Laptop USING(model)
                                          WHERE produs.categorie = 'Laptop' AND laptop.HD = 1000);


-- varianta in care se tine cont de moneda in care este exprimant pretul
DROP TABLE ProdusAuxiliar

CREATE TABLE ProdusAuxiliar AS (SELECT * FROM Produs);

ALTER TABLE ProdusAuxiliar 
ADD pret_lei number;

UPDATE ProdusAuxiliar
SET pret_lei =
CASE moneda
        WHEN 'RON' THEN pret
        WHEN 'EUR' THEN pret * 4.9
END 

SELECT fabricant
FROM ProdusAuxiliar JOIN Laptop USING(model)
WHERE laptop.HD = 1000 and ProdusAuxiliar.pret_lei <= ALL (SELECT pret_lei
                                          FROM ProdusAuxiliar JOIN Laptop USING(model)
                                          WHERE ProdusAuxiliar.categorie = 'Laptop' AND laptop.HD = 1000); 

-- b)
-- Să se găsească imprimantele (model, culoare, tip, fabricant, preț) care au
-- același preț ca și imprimanta ce are modelul 111.

SELECT *
FROM imprimanta JOIN produs USING(model)
WHERE pret IN(SELECT pret
               FROM produs
               WHERE model = 111);


-- 9.06 Să se exprime în SQL următoarele interogări folosind funcții de agregare:
-- a) 
-- Să se găsească fabricantul și modelele produselor cu prețul cel mai mic.

-- varianta 1, nu se tine cont de moneda

SELECT produs.fabricant, produs.model
FROM Produs
WHERE produs.pret = (SELECT MIN(pret)
                     FROM Produs);


-- varianta 2, se tine cont de moneda
DROP TABLE ProdusAuxiliar

CREATE TABLE ProdusAuxiliar AS (SELECT * FROM Produs);

ALTER TABLE ProdusAuxiliar 
ADD pret_lei number;

UPDATE ProdusAuxiliar
SET pret_lei =
CASE moneda
        WHEN 'RON' THEN pret
        WHEN 'EUR' THEN pret * 4.9
END 

SELECT fabricant, model
FROM ProdusAuxiliar
WHERE pret_lei = (SELECT MIN(pret_lei)
                     FROM ProdusAuxiliar);


-- b)
-- Să se găsească prețul minim, mediu și maxim al imprimantelor în funcție de
-- culoare și tip.

SELECT MAX(pret) as MaxValue, AVG(pret) as AvgValue, MIN(pret) as MinValue
FROM imprimanta JOIN produs USING(model)
GROUP BY tip, culoare, moneda


-- 9.07
-- a)
-- Să se folosească două instrucțiuni INSERT pentru a stoca în BD faptul că
--modelul 1234 de laptop este produs de fabricantul ‘HP’, are viteza 2.5, RAM 4,
--hard disc 500 și se vinde la prețul de 999 RON.

INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(1234, 'HP', 'Laptop', 999, 'RON');
INSERT INTO Laptop(model, viteza, ram, hd, ecran) VALUES(1234,  2.50, 4, 500, 15.6);


-- b) 
-- Să se șteargă produsele care nu se regăsesc în PC, Laptop sau Imprimanta.
DELETE FROM Produs
WHERE model NOT IN (SELECT model FROM PC) AND model NOT IN(SELECT model FROM Laptop) AND model NOT IN (SELECT model FROM Imprimanta);


-- c)
-- Să se modifice prețul pc-urilor cu hd mai mare de 1TB, crescând cu 100 dacă
-- este exprimat în RON sau cu 20 dacă este exprimat în EUR.

UPDATE Produs
SET pret =
CASE moneda
        WHEN 'RON' THEN  pret + 100
        WHEN 'EUR' THEN pret + 20
END 
WHERE model IN(SELECT model 
               FROM PC 
               WHERE hd > 1000);

SELECT *
FROM produs
WHERE categorie = 'PC' AND  model IN (SELECT model
                                       FROM pc
                                       WHERE hd > 1000);


-- 9.08
-- a)
-- A asigura că la adăugarea în tabela Imprimanta, dacă tip este ’ace’ atunci
-- culoare este ’N’.

CREATE OR REPLACE TRIGGER restrict_imprimanda
BEFORE INSERT OR UPDATE OF tip ON imprimanta FOR EACH ROW
BEGIN
IF (:NEW.tip IN ('ace'))
AND :NEW.culoare IN ('D') THEN
RAISE_APPLICATION_ERROR (-20202, 'O imprimanta de tip ace nu poate avea culaorea D');
END IF;
END;


-- test trigger
INSERT INTO Produs(model, fabricant, categorie, pret, moneda) VALUES(220, 'XEROX', 'Imprimanta', 239, 'RON');
INSERT INTO Imprimanta(model, culoare, tip) VALUES(220, 'D', 'ace');


-- b)
-- A împiedica micșorarea prețului unui laptop dacă are viteza 4,5 GHz.
CREATE OR REPLACE TRIGGER restrict_micsorare_pret
BEFORE UPDATE OF pret ON Produs 
FOR EACH ROW
DECLARE laptop_model Laptop.model%type;
BEGIN
SELECT model INTO laptop_model 
FROM Laptop 
WHERE viteza = 4.5;
IF ((:NEW.pret < :OLD.pret) AND  :NEW.model = laptop_model)
THEN RAISE_APPLICATION_ERROR (-2002, 'Nu se poate modifica pretul');
END IF;
END;


-- test trigger
UPDATE produs
SET pret = pret - 100
WHERE categorie = 'Laptop' AND model IN(SELECT model
                                        FROM laptop
                                        WHERE viteza = 4.5);


-- c)
-- Presupunând vederea:
CREATE OR REPLACE VIEW Produse_HP (model, categorie, viteza, ram, hd, ecran, culoare, tip, pret)
AS
SELECT *
FROM (
  SELECT model, categorie, viteza, ram, hd, NULL AS ecran, NULL AS culoare, NULL AS tip, pret
  FROM Produs NATURAL JOIN PC
  WHERE fabricant = 'HP'
  UNION
  SELECT model, categorie, viteza, ram, hd, ecran, NULL AS culoare, NULL AS tip, pret
  FROM Produs NATURAL JOIN Laptop
  WHERE fabricant = 'HP'
  UNION
  SELECT model, categorie, NULL AS viteza, NULL AS ram, NULL AS hd, NULL AS ecran, culoare, tip, pret
  FROM Produs NATURAL JOIN Imprimanta
  WHERE fabricant = 'HP'
)


-- Să se definească un trigger instead-of pentru a permite adăugare prin această
-- vedere.
CREATE OR REPLACE TRIGGER inserare_produs
INSTEAD OF INSERT ON Produse_HP
FOR EACH ROW
BEGIN
  IF :new.viteza IS NOT NULL THEN
    INSERT INTO Produs (model, categorie, pret, fabricant) VALUES (:new.model, :new.categorie, :new.pret, 'HP');
    INSERT INTO PC (model, viteza, ram, hd) VALUES (:new.model, :new.viteza, :new.ram, :new.hd);
  ELSIF :new.ecran IS NOT NULL THEN
    INSERT INTO Produs (model, categorie, pret, fabricant) VALUES (:new.model, :new.categorie, :new.pret, 'HP');
    INSERT INTO Laptop (model, viteza, ram, hd, ecran)VALUES (:new.model, :new.viteza, :new.ram, :new.hd, :new.ecran);
  ELSE
    INSERT INTO Produs (model, categorie, pret, fabricant) VALUES (:new.model, :new.categorie, :new.pret, 'HP');
    INSERT INTO Imprimanta (model, culoare, tip) VALUES (:new.model, :new.culoare, :new.tip);
  END IF;
END;


-- test trigger
INSERT INTO Produse_HP (model, categorie, viteza, ram, hd, ecran, culoare, tip, pret)
VALUES (1101, 'Laptop', 4.5, 16, 512, 15.6, NULL, NULL, 999.99);

SELECT *
FROM Produse_HP