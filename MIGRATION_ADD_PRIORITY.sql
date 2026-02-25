-- Migration: Add priority to tasks table
-- Run this in Supabase SQL Editor to add the priority field

ALTER TABLE public.tasks
ADD COLUMN IF NOT EXISTS priority text DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high'));

-- Update existing tasks to have medium priority
UPDATE public.tasks
SET priority = 'medium'
WHERE priority IS NULL;