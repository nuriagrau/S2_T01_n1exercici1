USE `optica`;

-- -----------------------------------------------------------------
-- INSERT INTO `proveidors` (nom, adreça, telefon, fax, NIF) VALUES(nom, adreça, telefon, fax, NIF)
-- -----------------------------------------------------------------

INSERT INTO `proveidors` (nom, adreça, telefon, fax, NIF) VALUES("Alium", "Trindsoevej 11, 8000 Aarhus,Denmark", "+45 36 98 28 00", "+45 36 98 28 20", "00000000T");

INSERT INTO `proveidors` (nom, adreça, telefon, fax, NIF) VALUES("Woodys", "c/ Francesc Santcliment 12A, 08500 Vic, Barcelona", "+34 938 869 110", "+34 938 869 120", "11111111A");

INSERT INTO `proveidors` (nom, adreça, telefon, fax, NIF) VALUES("Silhouette", "Ellbognerstraße 24, 4020 Linz, Austria", "+43 732 3848", "+43 732 3868", "22222222B");

INSERT INTO `proveidors` (nom, adreça, telefon, fax, NIF) VALUES("Persol", "Agordo, Turín, Italy", "+39 02 7210 5605", "+39 02 7210 5625", "33333333C");


-- -----------------------------------------------
-- INSERT INTO `marques`(nom, proveidor) VALUES(nom, proveidor)
-- -----------------------------------------------

INSERT INTO `marques` (nom, proveidor) VALUES("Alium", 1);
INSERT INTO `marques` (nom, proveidor) VALUES("Woodys", 2);
INSERT INTO `marques` (nom, proveidor) VALUES("Silhouette", 3);
INSERT INTO `marques` (nom, proveidor) VALUES("Persol", 4);
INSERT INTO `marques` (nom, proveidor) VALUES("RayBan", 4);
INSERT INTO `marques` (nom, proveidor) VALUES("Oakley", 4);


-- ----------------------------------------------------------------------------------------------------------------------
-- INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu)
-- ----------------------------------------------------------------------------------------------------------------------

INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(1, "-1.25", "-1.50", "pasta", "negre", "transparent", "transparent", 190.00);
INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(2, "+1.50", "+1.50", "pasta", "fusta", "transparent", "transparent", 90.00);
INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(6, "-0.75", "-0.75", "pasta", "negre", "polaritzat", "polaritzat", 115.00);
INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(3, "+2.50", "+1.50", "flotant", "plata", "blau", "blau", 290.00);
INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(4, "-2.00", "-2.00", "metal.lica", "or vell", "polaritzades", "polaritzades", 150.00);
INSERT INTO `ulleres` (marca, graduacio_E, graduacio_D, montura, col_montura, col_vidre_E, col_vidre_D, preu) VALUES(6, "+1.50", "+1.50", "pasta", "leopard", "negre", "negre", 90.00);


-- ----------------------------------------------------------------------------------
-- INSERT INTO `clients` (nom, adreça, telefon, email, recomanat_per_client) VALUES(nom, adreça, telefon, email, recomanat_per_client)
-- ----------------------------------------------------------------------------------
INSERT INTO `clients` (nom, adreça, telefon, email, recomanat_per_client) VALUES("Joan Dou", "carrer del mar 1, 08000 Barcelona", "465739292", "joandou@gmail.com", NULL);
INSERT INTO `clients` (nom, adreça, telefon, email, recomanat_per_client) VALUES("Joana Dou", "carrer de la muntanya 1, 08000 Barcelona", "123 456 789", "joanadou@gmail.com", 1);
INSERT INTO `clients` (nom, adreça, telefon, email, recomanat_per_client) VALUES("Joana Pou", "carrer del mig 1, 08000 Barcelona", "987 654 321", "joanapou@gmail.com", 1);
INSERT INTO `clients` (nom, adreça, telefon, email, recomanat_per_client) VALUES("Joan Pou", "carrer del mig 1, 08000 Barcelona", "987 654 321", "joanpou@gmail.com", 3);


-- -------------------------------------
-- INSERT INTO `venedors`(nom) VALUES(nom)
-- -------------------------------------

INSERT INTO `venedors` (nom) VALUES("Pepita");
INSERT INTO `venedors` (nom) VALUES("Pep");

-- ----------------------------------------------------------
-- INSERT INTO `compres` (client, ullera, venedor) VALUES(client, ullera, venedor)
-- ----------------------------------------------------------

INSERT INTO `compres` (client, ullera, venedor) VALUES(1, 1, 1);
INSERT INTO `compres` (client, ullera, venedor) VALUES(2, 2, 2);
INSERT INTO `compres` (client, ullera, venedor) VALUES(4, 3, 2);
INSERT INTO `compres` (client, ullera, venedor) VALUES(3, 4, 1);
INSERT INTO `compres` (client, ullera, venedor) VALUES(3, 5, 1);
INSERT INTO `compres` (client, ullera, venedor) VALUES(2, 6, 1);