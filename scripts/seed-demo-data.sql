-- ============================================
-- BOON DEMO COMPANY DATA SEED SCRIPT
-- ============================================
-- This script creates demo data for "Boon Demo Co" with two GROW cohorts:
--   1. Cohort 1 (completed) - Shows growth/impact metrics
--   2. Cohort 2 (in-progress) - Shows utilization/engagement metrics
--
-- Run this in your Supabase SQL Editor
-- ============================================

-- Generate a consistent demo company UUID (use this exact ID across all tables)
-- We use a deterministic UUID so re-running the script doesn't create duplicates
DO $$
DECLARE
  demo_company_id UUID := 'a0000000-demo-demo-demo-000000000001';
  cohort1_program_title TEXT := 'Boon Demo - Cohort 1';
  cohort2_program_title TEXT := 'Boon Demo - Cohort 2';
  demo_account_name TEXT := 'Boon Demo Co';
BEGIN

-- ============================================
-- 1. PROGRAM CONFIG
-- ============================================
-- Delete existing demo data first (for idempotent re-runs)
DELETE FROM program_config WHERE account_name = demo_account_name;

INSERT INTO program_config (account_name, program_title, sessions_per_employee, program_start_date, program_end_date, program_status, program_type)
VALUES
  (demo_account_name, cohort1_program_title, 5, '2025-06-01', '2025-11-30', 'Completed', 'GROW'),
  (demo_account_name, cohort2_program_title, 5, '2025-10-01', '2026-03-31', 'Active', 'GROW');

RAISE NOTICE 'Created program configs';

END $$;

-- ============================================
-- 2. EMPLOYEE ROSTER
-- ============================================
DELETE FROM employee_manager WHERE company_name = 'Boon Demo Co';

INSERT INTO employee_manager (
  company_id, company_name, company_email, first_name, last_name,
  program_title, status, job_title
) VALUES
-- Cohort 1 - Completed (12 employees)
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'alex.chen@demo.com', 'Alex', 'Chen', 'Boon Demo - Cohort 1', 'Active', 'Senior Product Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'maria.garcia@demo.com', 'Maria', 'Garcia', 'Boon Demo - Cohort 1', 'Active', 'Engineering Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'james.wilson@demo.com', 'James', 'Wilson', 'Boon Demo - Cohort 1', 'Active', 'Director of Operations'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'sarah.johnson@demo.com', 'Sarah', 'Johnson', 'Boon Demo - Cohort 1', 'Active', 'VP of Marketing'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'michael.brown@demo.com', 'Michael', 'Brown', 'Boon Demo - Cohort 1', 'Active', 'Senior Engineer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'emily.davis@demo.com', 'Emily', 'Davis', 'Boon Demo - Cohort 1', 'Active', 'Team Lead'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'david.martinez@demo.com', 'David', 'Martinez', 'Boon Demo - Cohort 1', 'Active', 'Product Designer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'jennifer.lee@demo.com', 'Jennifer', 'Lee', 'Boon Demo - Cohort 1', 'Active', 'Finance Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'robert.taylor@demo.com', 'Robert', 'Taylor', 'Boon Demo - Cohort 1', 'Active', 'Senior Analyst'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'lisa.anderson@demo.com', 'Lisa', 'Anderson', 'Boon Demo - Cohort 1', 'Active', 'HR Business Partner'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'kevin.thomas@demo.com', 'Kevin', 'Thomas', 'Boon Demo - Cohort 1', 'Active', 'Engineering Lead'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'amanda.jackson@demo.com', 'Amanda', 'Jackson', 'Boon Demo - Cohort 1', 'Active', 'Customer Success Manager'),

-- Cohort 2 - In Progress (18 employees)
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'chris.white@demo.com', 'Chris', 'White', 'Boon Demo - Cohort 2', 'Active', 'Product Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'jessica.harris@demo.com', 'Jessica', 'Harris', 'Boon Demo - Cohort 2', 'Active', 'Software Engineer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'daniel.clark@demo.com', 'Daniel', 'Clark', 'Boon Demo - Cohort 2', 'Active', 'Sales Director'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'ashley.lewis@demo.com', 'Ashley', 'Lewis', 'Boon Demo - Cohort 2', 'Active', 'Marketing Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'matthew.robinson@demo.com', 'Matthew', 'Robinson', 'Boon Demo - Cohort 2', 'Active', 'DevOps Engineer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'nicole.walker@demo.com', 'Nicole', 'Walker', 'Boon Demo - Cohort 2', 'Active', 'Data Analyst'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'joshua.hall@demo.com', 'Joshua', 'Hall', 'Boon Demo - Cohort 2', 'Active', 'UX Designer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'stephanie.allen@demo.com', 'Stephanie', 'Allen', 'Boon Demo - Cohort 2', 'Active', 'Project Manager'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'andrew.young@demo.com', 'Andrew', 'Young', 'Boon Demo - Cohort 2', 'Active', 'Backend Developer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'rachel.king@demo.com', 'Rachel', 'King', 'Boon Demo - Cohort 2', 'Active', 'Account Executive'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'brian.wright@demo.com', 'Brian', 'Wright', 'Boon Demo - Cohort 2', 'Active', 'Technical Lead'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'megan.scott@demo.com', 'Megan', 'Scott', 'Boon Demo - Cohort 2', 'Active', 'Content Strategist'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'ryan.green@demo.com', 'Ryan', 'Green', 'Boon Demo - Cohort 2', 'Active', 'QA Engineer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'lauren.baker@demo.com', 'Lauren', 'Baker', 'Boon Demo - Cohort 2', 'Active', 'Operations Analyst'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'tyler.adams@demo.com', 'Tyler', 'Adams', 'Boon Demo - Cohort 2', 'Active', 'Frontend Developer'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'samantha.nelson@demo.com', 'Samantha', 'Nelson', 'Boon Demo - Cohort 2', 'Active', 'People Operations'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'brandon.carter@demo.com', 'Brandon', 'Carter', 'Boon Demo - Cohort 2', 'Active', 'Solutions Architect'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'heather.mitchell@demo.com', 'Heather', 'Mitchell', 'Boon Demo - Cohort 2', 'Active', 'Customer Support Lead');

-- ============================================
-- 3. SESSION TRACKING
-- ============================================
DELETE FROM session_tracking WHERE account_name = 'Boon Demo Co';

-- Cohort 1 Sessions (completed - 12 employees x 5 sessions = 60 sessions, all completed)
INSERT INTO session_tracking (
  company_id, account_name, program_title, employee_name, session_date, status,
  mental_well_being, leadership_management_skills, communication_skills
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 1',
  e.first_name || ' ' || e.last_name,
  '2025-06-01'::date + (s.session_num * 30 + floor(random() * 7))::int,
  'Completed',
  CASE WHEN random() > 0.3 THEN 'Stress Management; Work-Life Balance' ELSE NULL END,
  CASE WHEN random() > 0.4 THEN 'Delegation; Strategic Thinking; Decision Making' ELSE NULL END,
  CASE WHEN random() > 0.5 THEN 'Giving Feedback; Active Listening' ELSE NULL END
FROM employee_manager e
CROSS JOIN generate_series(1, 5) AS s(session_num)
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 1';

-- Cohort 2 Sessions (in-progress - 18 employees, ~3 sessions each on average)
INSERT INTO session_tracking (
  company_id, account_name, program_title, employee_name, session_date, status,
  mental_well_being, leadership_management_skills, communication_skills
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 2',
  e.first_name || ' ' || e.last_name,
  '2025-10-01'::date + (s.session_num * 25 + floor(random() * 10))::int,
  CASE
    WHEN s.session_num <= 2 THEN 'Completed'
    WHEN s.session_num = 3 AND random() > 0.3 THEN 'Completed'
    ELSE 'Scheduled'
  END,
  CASE WHEN random() > 0.4 THEN 'Burnout Prevention; Mindfulness' ELSE NULL END,
  CASE WHEN random() > 0.3 THEN 'Team Leadership; Conflict Resolution' ELSE NULL END,
  CASE WHEN random() > 0.4 THEN 'Difficult Conversations; Presentation Skills' ELSE NULL END
FROM employee_manager e
CROSS JOIN generate_series(1, 4) AS s(session_num)
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 2';

-- ============================================
-- 4. WELCOME SURVEY BASELINE (demographics + baseline metrics)
-- ============================================
DELETE FROM welcome_survey_baseline WHERE account = 'Boon Demo Co';

-- Cohort 1 baseline
INSERT INTO welcome_survey_baseline (
  company_id, account, program_title, email, first_name, last_name,
  satisfaction, productivity, work_life_balance, motivation, inclusion,
  age_range, gender, role, tenure, previous_coaching
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 1',
  e.company_email,
  e.first_name,
  e.last_name,
  4 + floor(random() * 3)::int,  -- satisfaction 4-6
  4 + floor(random() * 3)::int,  -- productivity 4-6
  3 + floor(random() * 3)::int,  -- work_life_balance 3-5
  5 + floor(random() * 3)::int,  -- motivation 5-7
  5 + floor(random() * 4)::int,  -- inclusion 5-8
  CASE floor(random() * 4)::int WHEN 0 THEN '25-34' WHEN 1 THEN '35-44' WHEN 2 THEN '45-54' ELSE '55+' END,
  CASE floor(random() * 3)::int WHEN 0 THEN 'Male' WHEN 1 THEN 'Female' ELSE 'Non-binary' END,
  e.job_title,
  CASE floor(random() * 4)::int WHEN 0 THEN '0-1 years' WHEN 1 THEN '1-3 years' WHEN 2 THEN '3-5 years' ELSE '5+ years' END,
  CASE WHEN random() > 0.7 THEN 1 ELSE 0 END
FROM employee_manager e
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 1';

-- Cohort 2 baseline
INSERT INTO welcome_survey_baseline (
  company_id, account, program_title, email, first_name, last_name,
  satisfaction, productivity, work_life_balance, motivation, inclusion,
  age_range, gender, role, tenure, previous_coaching
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 2',
  e.company_email,
  e.first_name,
  e.last_name,
  4 + floor(random() * 3)::int,
  4 + floor(random() * 3)::int,
  3 + floor(random() * 3)::int,
  5 + floor(random() * 3)::int,
  5 + floor(random() * 4)::int,
  CASE floor(random() * 4)::int WHEN 0 THEN '25-34' WHEN 1 THEN '35-44' WHEN 2 THEN '45-54' ELSE '55+' END,
  CASE floor(random() * 3)::int WHEN 0 THEN 'Male' WHEN 1 THEN 'Female' ELSE 'Non-binary' END,
  e.job_title,
  CASE floor(random() * 4)::int WHEN 0 THEN '0-1 years' WHEN 1 THEN '1-3 years' WHEN 2 THEN '3-5 years' ELSE '5+ years' END,
  CASE WHEN random() > 0.8 THEN 1 ELSE 0 END
FROM employee_manager e
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 2';

-- ============================================
-- 5. COMPETENCY SCORES (for completed cohort)
-- ============================================
DELETE FROM competency_scores WHERE account_name = 'Boon Demo Co';

-- Insert pre/post competency scores for Cohort 1 (completed)
-- This creates growth data showing improvement
INSERT INTO competency_scores (
  company_id, account_name, program_title, email, competency,
  pre, post
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 1',
  e.company_email,
  comp.name,
  comp.pre_base + floor(random() * 0.5)::numeric,
  comp.pre_base + comp.growth + floor(random() * 0.5)::numeric
FROM employee_manager e
CROSS JOIN (
  VALUES
    ('Delegation & Accountability', 2.8, 0.9),
    ('Effective Communication', 3.1, 0.8),
    ('Strategic Thinking', 2.9, 0.7),
    ('Emotional Intelligence', 3.3, 0.6),
    ('Giving & Receiving Feedback', 2.7, 0.8),
    ('Time Management', 3.0, 0.5),
    ('Building Relationships', 3.4, 0.4),
    ('Adaptability & Resilience', 3.2, 0.6)
) AS comp(name, pre_base, growth)
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 1';

-- ============================================
-- 6. SURVEY RESPONSES (NPS, satisfaction, feedback)
-- ============================================
DELETE FROM survey_submissions WHERE account_name = 'Boon Demo Co';

-- First session surveys for Cohort 1
INSERT INTO survey_submissions (
  company_id, account_name, program_title, email, survey_type,
  coach_satisfaction, nps
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 1',
  e.company_email,
  'first_session',
  8 + floor(random() * 2.5)::int,  -- coach_satisfaction 8-10
  8 + floor(random() * 3)::int     -- nps 8-10
FROM employee_manager e
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 1';

-- End of program surveys for Cohort 1 (with feedback quotes)
INSERT INTO survey_submissions (
  company_id, account_name, program_title, email, survey_type,
  nps, coach_satisfaction, feedback_learned, feedback_insight
)
VALUES
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'alex.chen@demo.com', 'end_of_program', 10, 10,
 'I learned how to delegate more effectively and trust my team. My coach helped me see that doing everything myself was actually holding the team back.',
 'The biggest insight was realizing that my perfectionism was creating bottlenecks. Now I focus on empowering others.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'maria.garcia@demo.com', 'end_of_program', 10, 9,
 'My communication with direct reports has transformed. I now have regular 1:1s that are actually productive and my team feels more supported.',
 'I discovered that I was avoiding difficult conversations, which was hurting team morale. Now I address issues early and constructively.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'james.wilson@demo.com', 'end_of_program', 9, 10,
 'The coaching sessions helped me develop a more strategic mindset. I no longer get lost in day-to-day firefighting.',
 'I realized I was spending 80% of my time on urgent but not important tasks. Now I protect time for strategic thinking.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'sarah.johnson@demo.com', 'end_of_program', 10, 10,
 'My coach challenged me to step out of my comfort zone. I''ve since led two major initiatives that I would have previously avoided.',
 'The most valuable insight was understanding my leadership blind spots and actively working to address them.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'michael.brown@demo.com', 'end_of_program', 9, 9,
 'I learned practical techniques for managing stress and preventing burnout. My work-life balance has improved significantly.',
 'I discovered that saying no to certain requests actually makes me more effective at the things that matter most.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'emily.davis@demo.com', 'end_of_program', 10, 10,
 'The feedback frameworks I learned have transformed how I give and receive feedback. My team relationships are stronger than ever.',
 'I realized that I was avoiding giving constructive feedback because I was afraid of conflict. Now I see it as a gift.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'david.martinez@demo.com', 'end_of_program', 9, 9,
 'My confidence in leadership situations has grown tremendously. I now speak up in executive meetings and contribute more strategically.',
 'I learned that imposter syndrome was holding me back. My coach helped me recognize my expertise and own my seat at the table.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'jennifer.lee@demo.com', 'end_of_program', 10, 10,
 'The coaching helped me navigate a difficult organizational change. I emerged as a more resilient and adaptable leader.',
 'I discovered that I can influence outcomes even when I don''t have direct control. It''s about building relationships and trust.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'robert.taylor@demo.com', 'end_of_program', 8, 9,
 'I developed better time management skills and learned to prioritize ruthlessly. I''m more productive and less stressed.',
 'The insight that changed everything: my to-do list was running me instead of me running it.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'lisa.anderson@demo.com', 'end_of_program', 10, 10,
 'My coach helped me find my authentic leadership voice. I no longer try to lead like someone else - I lead like me.',
 'I realized that vulnerability is a strength, not a weakness. Being authentic has made me a more effective leader.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'kevin.thomas@demo.com', 'end_of_program', 9, 9,
 'The coaching program gave me tools to build stronger relationships with stakeholders across the organization.',
 'I learned that most conflicts come from misaligned expectations. Now I invest more time upfront in alignment.'),
('a0000000-demo-demo-demo-000000000001', 'Boon Demo Co', 'Boon Demo - Cohort 1', 'amanda.jackson@demo.com', 'end_of_program', 10, 10,
 'This program has been transformative for my career. I was promoted during the program partly due to the leadership growth I demonstrated.',
 'The biggest insight was learning to see challenges as opportunities for growth rather than obstacles to avoid.');

-- First session surveys for Cohort 2 (in progress)
INSERT INTO survey_submissions (
  company_id, account_name, program_title, email, survey_type,
  coach_satisfaction, nps
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 2',
  e.company_email,
  'first_session',
  8 + floor(random() * 2.5)::int,
  8 + floor(random() * 3)::int
FROM employee_manager e
WHERE e.company_name = 'Boon Demo Co' AND e.program_title = 'Boon Demo - Cohort 2';

-- ============================================
-- 7. FOCUS AREA SELECTIONS
-- ============================================
DELETE FROM focus_area_selections WHERE account_name = 'Boon Demo Co';

-- Cohort 1 focus areas
INSERT INTO focus_area_selections (
  company_id, account_name, program_title, email, focus_area_name, selected
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 1',
  e.company_email,
  fa.name,
  true
FROM employee_manager e
CROSS JOIN (
  VALUES
    ('Effective Communication'),
    ('Strategic Thinking'),
    ('Delegation & Accountability'),
    ('Time Management'),
    ('Building Relationships'),
    ('Giving & Receiving Feedback')
) AS fa(name)
WHERE e.company_name = 'Boon Demo Co'
  AND e.program_title = 'Boon Demo - Cohort 1'
  AND random() > 0.5;

-- Cohort 2 focus areas
INSERT INTO focus_area_selections (
  company_id, account_name, program_title, email, focus_area_name, selected
)
SELECT
  'a0000000-demo-demo-demo-000000000001',
  'Boon Demo Co',
  'Boon Demo - Cohort 2',
  e.company_email,
  fa.name,
  true
FROM employee_manager e
CROSS JOIN (
  VALUES
    ('Effective Communication'),
    ('Emotional Intelligence'),
    ('Conflict Resolution'),
    ('Work-Life Balance'),
    ('Leadership Presence'),
    ('Decision Making')
) AS fa(name)
WHERE e.company_name = 'Boon Demo Co'
  AND e.program_title = 'Boon Demo - Cohort 2'
  AND random() > 0.5;

-- ============================================
-- 8. ADD TO PROGRAMS LOOKUP TABLE
-- ============================================
DELETE FROM programs WHERE company_id = 'a0000000-demo-demo-demo-000000000001';

INSERT INTO programs (company_id, name, program_type)
VALUES
  ('a0000000-demo-demo-demo-000000000001', 'Boon Demo - Cohort 1', 'GROW'),
  ('a0000000-demo-demo-demo-000000000001', 'Boon Demo - Cohort 2', 'GROW');

-- ============================================
-- DONE!
-- ============================================
-- Your demo data is ready. Use the admin company switcher to select "Boon Demo Co"
--
-- Cohort 1 will show:
--   - +22% average competency growth
--   - NPS of +75
--   - 12 participants with complete pre/post data
--   - Rich feedback quotes
--
-- Cohort 2 will show:
--   - 65% program progress
--   - 94% utilization (17 of 18 enrolled)
--   - Session activity and themes
--   - Baseline metrics
-- ============================================

SELECT 'Demo data seeded successfully!' as result;
