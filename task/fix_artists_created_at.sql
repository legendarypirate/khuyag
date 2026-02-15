-- Fix artists table: Rename createdat to createdAt and fix null values
-- Run these commands in order:

-- Step 1: Rename the column from lowercase "createdat" to camelCase "createdAt"
ALTER TABLE artists 
RENAME COLUMN createdat TO "createdAt";

-- Step 2: Fix null values in the createdAt column
UPDATE artists 
SET "createdAt" = CURRENT_TIMESTAMP 
WHERE "createdAt" IS NULL;

-- Step 3: Also handle updatedAt if it exists (optional - only if you get similar error for updatedAt)
-- ALTER TABLE artists RENAME COLUMN updatedat TO "updatedAt";
-- UPDATE artists SET "updatedAt" = CURRENT_TIMESTAMP WHERE "updatedAt" IS NULL;

-- Verify the fix
SELECT COUNT(*) as null_count 
FROM artists 
WHERE "createdAt" IS NULL;

