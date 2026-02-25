-- ========================================================
-- MIGRATION: Add task attachments and due date support
-- ========================================================
-- 
-- Run this SQL in Supabase Dashboard > SQL Editor
-- to add the missing columns to your existing tasks table.

-- Add columns to existing tasks table
ALTER TABLE public.tasks
ADD COLUMN IF NOT EXISTS due_date timestamp with time zone,
ADD COLUMN IF NOT EXISTS attachment_url text;

-- All done! After running this, proceed to create the storage bucket:
-- 1. Go to Supabase Dashboard > Storage
-- 2. Click "Create a new bucket"
-- 3. Set name to: attachments
-- 4. Toggle "Public bucket" ON
-- 5. Click Create
