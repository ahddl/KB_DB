/*
GROUP BY
- 결과 집합을 틀정 열의 값에 따라 그룹화 하는데 사용됨
*/

select *
from salaries
limit 1;


-- 직원별로 급여횟수
select emp_no,
       count(*),
       avg(salary) as 평균급여,
       sum(salary) as 총급여
from salaries
group by emp_no;


/*
 HAVING
 - group by 와 함께 사용됨
 - 그룹화된 결과에 조건을 적용할 때 사
 */
-- 직원별로 급여횟수
select emp_no,
       count(*),
       avg(salary) as 평균급여,
       sum(salary) as 총급여
from salaries
group by emp_no
having 평균급여 >= 50000
   and 평균급여 <= 6000;

