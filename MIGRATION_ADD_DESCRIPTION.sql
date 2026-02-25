-- Migration: Add description to tasks table
-- Run this in Supabase SQL Editor to add the description field

ALTER TABLE public.tasks
ADD COLUMN IF NOT EXISTS description text;
