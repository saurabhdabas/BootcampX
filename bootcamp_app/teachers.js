const { Pool } = require('pg')
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})
pool.connect((err,res)=>{
  if(err){
    console.log('err:',err);
  }
})
pool.connect().then(
  console.log("You are connected.")
).catch(error =>{console.log("error:",error)})
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.id) AS total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
GROUP BY teachers.name,cohorts.name
ORDER BY teacher;
`)
.then(res => {
  console.table(res.rows);
  res.rows.forEach((user)=>{
    console.log(`${user.cohort}:${user.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));