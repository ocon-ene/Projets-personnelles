-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Bien" (
    "BienID" int   NOT NULL,
    "TypeLocal" int   NOT NULL,
    "Address" int   NOT NULL,
    "SurfaceReelle" int   NOT NULL,
    "SurfaceTerrain" int   NOT NULL,
    "NombrePieces" int   NOT NULL,
    CONSTRAINT "pk_Bien" PRIMARY KEY (
        "BienID"
     )
);

CREATE TABLE "TypeLocal" (
    "TypeLocalID" int   NOT NULL,
    "Type" varchar   NOT NULL,
    CONSTRAINT "pk_TypeLocal" PRIMARY KEY (
        "TypeLocalID"
     )
);

CREATE TABLE "Adresse" (
    "AdresseID" int   NOT NULL,
    "NumeroRue" varchar   NOT NULL,
    "Voie" int   NOT NULL,
    "Commune" int   NOT NULL,
    "Departement" int   NOT NULL,
    "Region" int   NOT NULL,
    CONSTRAINT "pk_Adresse" PRIMARY KEY (
        "AdresseID"
     )
);

CREATE TABLE "Transaction" (
    "TransactionID" int   NOT NULL,
    "NatureMutation" int   NOT NULL,
    "Valeur" int   NOT NULL,
    "Bien" int   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "TransactionID"
     )
);

CREATE TABLE "NatureMutation" (
    "NatureMutationID" int   NOT NULL,
    "NatureMutation" varchar   NOT NULL,
    CONSTRAINT "pk_NatureMutation" PRIMARY KEY (
        "NatureMutationID"
     )
);

CREATE TABLE "Voie" (
    "VoieID" int   NOT NULL,
    "Voie" varchar   NOT NULL,
    CONSTRAINT "pk_Voie" PRIMARY KEY (
        "VoieID"
     )
);

CREATE TABLE "Commune" (
    "CommuneID" int   NOT NULL,
    "Commune" varchar   NOT NULL,
    CONSTRAINT "pk_Commune" PRIMARY KEY (
        "CommuneID"
     )
);

CREATE TABLE "Departement" (
    "DepartementID" int   NOT NULL,
    "Departement" varchar   NOT NULL,
    "Population0a19" int   NOT NULL,
    "Population20a39" int   NOT NULL,
    "Population40a59" int   NOT NULL,
    "Population60a75" int   NOT NULL,
    "PopulationPlusDe75" int   NOT NULL,
    CONSTRAINT "pk_Departement" PRIMARY KEY (
        "DepartementID"
     )
);

CREATE TABLE "Region" (
    "RegionID" int   NOT NULL,
    "Region" varchar   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "RegionID"
     )
);

ALTER TABLE "Bien" ADD CONSTRAINT "fk_Bien_TypeLocal" FOREIGN KEY("TypeLocal")
REFERENCES "TypeLocal" ("TypeLocalID");

ALTER TABLE "Bien" ADD CONSTRAINT "fk_Bien_Address" FOREIGN KEY("Address")
REFERENCES "Adresse" ("AdresseID");

ALTER TABLE "Adresse" ADD CONSTRAINT "fk_Adresse_Voie" FOREIGN KEY("Voie")
REFERENCES "Voie" ("VoieID");

ALTER TABLE "Adresse" ADD CONSTRAINT "fk_Adresse_Commune" FOREIGN KEY("Commune")
REFERENCES "Commune" ("CommuneID");

ALTER TABLE "Adresse" ADD CONSTRAINT "fk_Adresse_Departement" FOREIGN KEY("Departement")
REFERENCES "Departement" ("DepartementID");

ALTER TABLE "Adresse" ADD CONSTRAINT "fk_Adresse_Region" FOREIGN KEY("Region")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_NatureMutation" FOREIGN KEY("NatureMutation")
REFERENCES "NatureMutation" ("NatureMutationID");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_Bien" FOREIGN KEY("Bien")
REFERENCES "Bien" ("BienID");

