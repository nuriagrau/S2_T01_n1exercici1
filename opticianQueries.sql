-- Llista el total de factures d'un client/a en un període determinat.
SELECT customers.name, SUM(glasses.price) AS "totalInvoices"
FROM optician.purchases INNER JOIN optician.glasses ON purchases.idGlasses=glasses.glassesId
JOIN optician.customers ON purchases.iDCustomer=customers.customerId
WHERE purchases.purchaseDate BETWEEN "2023-01_01" AND "2023-12-31" GROUP BY purchases.iDCustomer;

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT DISTINCT glasses.* FROM purchases
INNER JOIN glasses ON purchases.idGlasses=glasses.glassesId
JOIN sellers ON purchases.idSeller=sellers.sellerId
WHERE sellers.name LIKE "Peter" AND purchases.purchaseDate BETWEEN "2024-01_01" AND "2024-12-31";

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT suppliers.name, suppliers.adress, suppliers.phone FROM purchases
INNER JOIN glasses ON purchases.iDGlasses=glasses.glassesId
JOIN brands ON glasses.idBrand=brands.brandId
JOIN suppliers ON brands.idSupplier=suppliers.supplierId;
