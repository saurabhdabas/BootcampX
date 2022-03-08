
--Get the total duration of all assistance requests for each cohort.

--Select the cohort's name and the total duration the assistance requests.
--Order by total_duration.
SELECT cohorts.name AS name, SUM(completed_at-started_at) AS total_duration
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
  GROUP BY cohorts.name
  ORDER BY total_duration;
