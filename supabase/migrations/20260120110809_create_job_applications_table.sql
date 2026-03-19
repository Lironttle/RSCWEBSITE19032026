/*
  # Create Job Applications Table

  1. New Tables
    - `job_applications`
      - `id` (uuid, primary key) - Unique identifier for each application
      - `full_name` (text, required) - Applicant's full name
      - `email` (text, required) - Applicant's email address
      - `phone` (text, required) - Applicant's phone number
      - `position` (text, required) - Position applying for
      - `cover_letter` (text, optional) - Cover letter/message
      - `hear_about_us` (text, optional) - How they heard about the company
      - `right_to_work_uk` (boolean, required) - Confirms right to work in UK
      - `cv_filename` (text, optional) - Name of uploaded CV file
      - `created_at` (timestamptz) - When application was submitted

  2. Security
    - Enable RLS on `job_applications` table
    - Add policy for inserting applications (public can submit)
    - No public read access (admin only via service role)
*/

CREATE TABLE IF NOT EXISTS job_applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  full_name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  position text NOT NULL,
  cover_letter text DEFAULT '',
  hear_about_us text DEFAULT '',
  right_to_work_uk boolean NOT NULL DEFAULT false,
  cv_filename text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE job_applications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can submit job applications"
  ON job_applications
  FOR INSERT
  TO anon
  WITH CHECK (true);
