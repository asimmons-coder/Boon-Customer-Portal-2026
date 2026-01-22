-- =============================================
-- CONSOLIDATE PROGRAM TABLES MIGRATION
-- Keeps program_config as the single source of truth
-- Drops redundant companies and programs tables
-- =============================================

-- Step 1: Backup existing tables (just in case)
CREATE TABLE IF NOT EXISTS _backup_companies AS SELECT * FROM companies;
CREATE TABLE IF NOT EXISTS _backup_programs AS SELECT * FROM programs;
CREATE TABLE IF NOT EXISTS _backup_program_config AS SELECT * FROM program_config;

-- Step 2: Add any missing columns to program_config that we need from other tables
-- (program_config already has everything we need)

-- Step 3: Ensure program_config has a name field for dropdowns
-- Use account_name + program_type as the display name
ALTER TABLE program_config ADD COLUMN IF NOT EXISTS name TEXT;

UPDATE program_config
SET name = COALESCE(program_title, account_name || ' ' || program_type)
WHERE name IS NULL;

-- Step 4: Add is_active column if not exists
ALTER TABLE program_config ADD COLUMN IF NOT EXISTS is_active BOOLEAN DEFAULT true;

-- Step 5: Create indexes for common queries
CREATE INDEX IF NOT EXISTS idx_program_config_company_id ON program_config(company_id);
CREATE INDEX IF NOT EXISTS idx_program_config_account_name ON program_config(account_name);
CREATE INDEX IF NOT EXISTS idx_program_config_program_type ON program_config(program_type);
CREATE INDEX IF NOT EXISTS idx_program_config_name ON program_config(name);

-- Step 6: Verify the migration
SELECT 'program_config records:' as check_type, COUNT(*) as count FROM program_config;

-- =============================================
-- AFTER VERIFYING CODE CHANGES WORK, RUN THESE:
-- =============================================

-- Drop old tables (UNCOMMENT WHEN READY)
-- DROP TABLE IF EXISTS programs;
-- DROP TABLE IF EXISTS companies;

-- Rename program_config to programs (UNCOMMENT WHEN READY)
-- ALTER TABLE program_config RENAME TO programs;
