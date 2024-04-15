USE `optician`;

-- -----------------------------------------------------------------
-- INSERT INTO `suppliers` (name, adress, phone, fax, NIF) VALUES(name, adress, phone, fax, NIF)
-- -----------------------------------------------------------------

INSERT INTO `suppliers` (name, adress, phone, fax, NIF) VALUES("Alium", "Trindsoevej 11, 8000 Aarhus,Denmark", "+45 36 98 28 00", "+45 36 98 28 20", "00000000T");

INSERT INTO `suppliers` (name, adress, phone, fax, NIF) VALUES("Woodys", "c/ Francesc Santcliment 12A, 08500 Vic, Barcelona", "+34 938 869 110", "+34 938 869 120", "11111111A");

INSERT INTO `suppliers` (name, adress, phone, fax, NIF) VALUES("Silhouette", "Ellbognerstraße 24, 4020 Linz, Austria", "+43 732 3848", "+43 732 3868", "22222222B");

INSERT INTO `suppliers` (name, adress, phone, fax, NIF) VALUES("Persol", "Agordo, Turín, Italy", "+39 02 7210 5605", "+39 02 7210 5625", "33333333C");


-- -----------------------------------------------
-- INSERT INTO `brands`(name, idSupplier) VALUES(name, idSupplier)
-- -----------------------------------------------

INSERT INTO `brands` (name, idSupplier) VALUES("Alium", 1);
INSERT INTO `brands` (name, idSupplier) VALUES("Woodys", 2);
INSERT INTO `brands` (name, idSupplier) VALUES("Silhouette", 3);
INSERT INTO `brands` (name, idSupplier) VALUES("Persol", 4);
INSERT INTO `brands` (name, idSupplier) VALUES("RayBan", 4);
INSERT INTO `brands` (name, idSupplier) VALUES("Oakley", 4);


-- ----------------------------------------------------------------------------------------------------------------------
-- INSERT INTO `glasses` (idBrand, prescriptionL, gprescriptionR, frame, frameColour, glassColourL, glassColourL, price) VALUES(idBrand, prescriptionL, gprescriptionR, frame, frameColour, glassColourL, glassColourL, price) 
-- ----------------------------------------------------------------------------------------------------------------------

INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(1, "-1.25", "-1.50", "resin", "black", "transparent", "transparent", 190.00);
INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(3, "+1.50", "+1.50", "resin", "wood", "transparent", "transparent", 90.00);
INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(6, "-0.75", "-0.75", "resin", "black", "polarized", "polarized", 115.00);
INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(3, "+2.50", "+1.50", "rimless", "silver", "blue", "blue", 290.00);
INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(4, "-2.00", "-2.00", "metal", "oldGold", "polarized", "polarized", 150.00);
INSERT INTO `glasses` (idBrand, prescriptionL, prescriptionR, frame, frameColour, glassColourL, glassColourR, price) VALUES(6, "+1.50", "+1.50", "resin", "leopard", "black", "black", 90.00);


-- --------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO `customers` (name, adress, phone, email, idRecomendedFor) VALUES(name, adress, phone, email, idRecomendedFor)
-- -------------------------------------------------------------------------------------------------------------------------
INSERT INTO `customers` (name, adress, phone, email, idRecomendedFor) VALUES("John Doe", "baker street 1, 08000 Barcelona", "465739292", "johndoe@gmail.com", NULL);
INSERT INTO `customers` (name, adress, phone, email, idRecomendedFor) VALUES("Jane Doe", "morgue 2, 08000 Barcelona", "123 456 789", "janedoe@gmail.com", 1);
INSERT INTO `customers` (name, adress, phone, email, idRecomendedFor) VALUES("Rebeca Roe", "dorset street 1, 08000 Barcelona", "987 654 321", "joanapou@gmail.com", 1);
INSERT INTO `customers` (name, adress, phone, email, idRecomendedFor) VALUES("Richard Roe", "dorset street 1, 08000 Barcelona", "987 654 321", "joanpou@gmail.com", 3);


-- -------------------------------------
-- INSERT INTO `sellers`(name) VALUES(name)
-- -------------------------------------

INSERT INTO `sellers` (name) VALUES("Peter");
INSERT INTO `sellers` (name) VALUES("Patricia");

-- ----------------------------------------------------------
-- INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(idCustomer, idGlasses, idSeller, purchaseDate)
-- ----------------------------------------------------------

INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(1, 1, 1, "2022-04-10");
INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(2, 2, 2, "2022-09-15");
INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(4, 3, 2, "2023-03-24");
INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(3, 4, 1, "2023-10-23");
INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(3, 5, 1, "2024-01-26");
INSERT INTO `purchases` (idCustomer, idGlasses, idSeller, purchaseDate) VALUES(2, 6, 1, "2024-03-03");