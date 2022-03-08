--Get currently enrolled students' average assignment completion time.

--Select the students name and average time from assignment submissions.
--Order the results from greatest duration to least greatest duration.
--A student will have a null end_date if they are currently enrolled

SELECT students.name, AVG(assignment_submissions.duration) AS average_assignment_duration
  FROM students JOIN assignment_submissions ON students.id = student_id
  WHERE end_date IS NULL
  GROUP BY students.name
  ORDER BY average_assignment_duration;