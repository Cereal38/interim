

-- CREATE TRIGGER IF NOT EXISTS employe_check_email_regex
--   BEFORE INSERT ON Employes
--   WHEN New.email_employe = 'abc'
-- BEGIN
--   SELECT RAISE(ABORT, 'INVALID EMAIL ADRESS');
-- END;

-- CREATE TRIGGER employe_check_email
--    BEFORE INSERT ON Employes
-- BEGIN
--    SELECT
--       CASE
--         WHEN NEW.email_employe NOT LIKE '%_@__%.__%' THEN
--             RAISE (ABORT,'INVALID EMAIL ADDRESS')
--        END;
-- END;
