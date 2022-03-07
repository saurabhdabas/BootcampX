-- Sometimes a student's start_date will differ from their cohort's start_date. A student may have started in one cohort, gotten sick, and had to finish in a different cohort. We'll call this type of student a rollover student.
-- Select all rollover students.

-- Get the student's name, student's start_date, cohort's name, and cohort's start_date.
-- Alias the column names to be more descriptive.
-- Order by the start date of the cohort.
SELECT 
  students.name AS students_name,
  cohorts.name AS cohorts_name,
  students.start_date AS students_start_date,
  cohorts.start_date AS cohorts_start_date
  FROM students FULL OUTER JOIN cohorts ON cohort_id = cohorts.id
  WHERE students.start_date != cohorts.start_date
  ORDER BY cohorts_start_date;