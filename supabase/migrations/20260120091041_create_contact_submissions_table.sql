/*
  # Create contact submissions table

  1. New Tables
    - `contact_submissions`
      - `id` (uuid, primary key) - Unique identifier for each submission
      - `name` (text, not null) - Contact person's name
      - `email` (text, not null) - Contact email address
      - `phone` (text, nullable) - Optional phone number
      - `service` (text, nullable) - Service type requested
      - `message` (text, not null) - Message content
      - `created_at` (timestamptz) - Submission timestamp
      - `is_read` (boolean) - Whether the submission has been read

  2. Security
    - Enable RLS on `contact_submissions` table
    - Add policy for anonymous users to insert submissions (public form)
    - No select/update/delete policies for anonymous users (admin only)
*/

CREATE TABLE IF NOT EXISTS contact_submissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text,
  service text,
  message text NOT NULL,
  created_at timestamptz DEFAULT now(),
  is_read boolean DEFAULT false
);

ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can submit contact form"
  ON contact_submissions
  FOR INSERT
  TO anon
  WITH CHECK (true);
