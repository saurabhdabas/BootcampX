--List each assignment with the total number of assistance requests with it.

--Select the assignment's id, day, chapter, name and the total assistances.
--Order by total assistances in order of most to least.
SELECT 
  assignments.id AS id,
  assignments.name AS name,
  assignments.day As day,
  assignments.chapter As chapter,
  SUM(assistance_requests.id) AS total_assistances
  FROM assignments
  JOIN assistance_requests ON assignments.id = assignment_id
  GROUP BY assignments.id
  ORDER BY total_assistances
  DESC;
