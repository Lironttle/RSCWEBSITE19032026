/*
  # Create estimate requests table

  1. New Tables
    - `estimate_requests`
      - `id` (uuid, primary key)
      - `name` (text, required)
      - `email` (text, required)
      - `phone` (text, required)
      - `property_type` (text)
      - `service_required` (text)
      - `project_size` (text)
      - `timeline` (text)
      - `budget_range` (text)
      - `description` (text)
      - `agree_to_contact` (boolean)
      - `created_at` (timestamp)

  2. Security
    - Enable RLS on `estimate_requests` table
    - Add policy for inserting new estimate requests (public insert)
*/

CREATE TABLE IF NOT EXISTS estimate_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  property_type text,
  service_required text,
  project_size text,
  timeline text,
  budget_range text,
  description text,
  agree_to_contact boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE estimate_requests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public to submit estimate requests"
  ON estimate_requests
  FOR INSERT
  TO anon
  WITH CHECK (
    name IS NOT NULL AND
    email IS NOT NULL AND
    phone IS NOT NULL
  );
