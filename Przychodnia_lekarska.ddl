-- Generated by Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   at:        2020-01-03 22:44:28 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE dzien_tygodnia (
    id      INTEGER NOT NULL,
    dzien   VARCHAR2(15) NOT NULL
);

COMMENT ON TABLE dzien_tygodnia IS
    'Dzien tygodnia';

ALTER TABLE dzien_tygodnia ADD CONSTRAINT dzien_tygodnia_pk PRIMARY KEY ( id );

CREATE TABLE godzina_wizyty (
    id        INTEGER NOT NULL,
    godzina   VARCHAR2(25) NOT NULL
);

COMMENT ON TABLE godzina_wizyty IS
    'Godzina wizyty';

ALTER TABLE godzina_wizyty ADD CONSTRAINT godzina_wizyty_pk PRIMARY KEY ( id );

CREATE TABLE grafik_lekarza (
    id                      INTEGER NOT NULL,
    id_uzytkownika_lekarz   INTEGER NOT NULL,
    id_dzien_tygodnia       INTEGER NOT NULL,
    id_godzina_wizyty       INTEGER NOT NULL
);

COMMENT ON TABLE grafik_lekarza IS
    'Grafik lekarza';

ALTER TABLE grafik_lekarza ADD CONSTRAINT grafik_lekarza_pk PRIMARY KEY ( id );

CREATE TABLE rola (
    id      INTEGER NOT NULL,
    nazwa   VARCHAR2(30) NOT NULL
);

COMMENT ON TABLE rola IS
    'Rola';

ALTER TABLE rola ADD CONSTRAINT rola_pk PRIMARY KEY ( id );

CREATE TABLE uzytkownik (
    id         INTEGER NOT NULL,
    id_rola    INTEGER NOT NULL,
    imie       VARCHAR2(20) NOT NULL,
    nazwisko   VARCHAR2(30) NOT NULL,
    pesel      VARCHAR2(11) NOT NULL,
    login      VARCHAR2(30) NOT NULL,
    haslo      VARCHAR2(30) NOT NULL,
    telefon    VARCHAR2(20),
    "E-mail"   VARCHAR2(30)
);

COMMENT ON TABLE uzytkownik IS
    'Uzytkownik';

ALTER TABLE uzytkownik ADD CONSTRAINT uzytkownik_pk PRIMARY KEY ( id );

CREATE TABLE wizyta (
    id                       INTEGER NOT NULL,
    id_uzytkownika_lekarz    INTEGER NOT NULL,
    id_uzytkownika_pacjent   INTEGER NOT NULL,
    data_wizyty              DATE NOT NULL,
    id_dzien_tygodnia        INTEGER NOT NULL,
    id_godzina_wizyty        INTEGER NOT NULL,
    gabinet                  VARCHAR2(20) NOT NULL
);

COMMENT ON TABLE wizyta IS
    'Wizyta';

ALTER TABLE wizyta ADD CONSTRAINT wizyta_pk PRIMARY KEY ( id );

ALTER TABLE grafik_lekarza
    ADD CONSTRAINT grafik_lekarza_dzien_tyg_fk FOREIGN KEY ( id_dzien_tygodnia )
        REFERENCES dzien_tygodnia ( id );

ALTER TABLE grafik_lekarza
    ADD CONSTRAINT grafik_lekarza_godz_wizyty_fk FOREIGN KEY ( id_godzina_wizyty )
        REFERENCES godzina_wizyty ( id );

ALTER TABLE grafik_lekarza
    ADD CONSTRAINT grafik_lekarza_uzytkownik_fk FOREIGN KEY ( id_uzytkownika_lekarz )
        REFERENCES uzytkownik ( id );

ALTER TABLE uzytkownik
    ADD CONSTRAINT uzytkownik_rola_fk FOREIGN KEY ( id_rola )
        REFERENCES rola ( id );

ALTER TABLE wizyta
    ADD CONSTRAINT wizyta_dzien_tygodnia_fk FOREIGN KEY ( id_dzien_tygodnia )
        REFERENCES dzien_tygodnia ( id );

ALTER TABLE wizyta
    ADD CONSTRAINT wizyta_godzina_wizyty_fk FOREIGN KEY ( id_godzina_wizyty )
        REFERENCES godzina_wizyty ( id );

ALTER TABLE wizyta
    ADD CONSTRAINT wizyta_uzytkownik_fk FOREIGN KEY ( id_uzytkownika_lekarz )
        REFERENCES uzytkownik ( id );

ALTER TABLE wizyta
    ADD CONSTRAINT wizyta_uzytkownik_fkv2 FOREIGN KEY ( id_uzytkownika_pacjent )
        REFERENCES uzytkownik ( id );

CREATE SEQUENCE dzien_tygodnia_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER dzien_tygodnia_id_trg BEFORE
    INSERT ON dzien_tygodnia
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := dzien_tygodnia_id_seq.nextval;
END;
/

CREATE SEQUENCE godzina_wizyty_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER godzina_wizyty_id_trg BEFORE
    INSERT ON godzina_wizyty
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := godzina_wizyty_id_seq.nextval;
END;
/

CREATE SEQUENCE grafik_lekarza_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER grafik_lekarza_id_trg BEFORE
    INSERT ON grafik_lekarza
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := grafik_lekarza_id_seq.nextval;
END;
/

CREATE SEQUENCE rola_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rola_id_trg BEFORE
    INSERT ON rola
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := rola_id_seq.nextval;
END;
/

CREATE SEQUENCE uzytkownik_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER uzytkownik_id_trg BEFORE
    INSERT ON uzytkownik
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := uzytkownik_id_seq.nextval;
END;
/

CREATE SEQUENCE wizyta_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER wizyta_id_trg BEFORE
    INSERT ON wizyta
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := wizyta_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           6
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          6
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
