
-- Migration script to set default version value for existing students with null version
UPDATE students SET version = 0 WHERE version IS NULL;
