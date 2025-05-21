-- ORDER BY
-- SELECT 문과 함께 사용하며 결과 집합을 특정 열이나 값들에 따라 정렬하는데 사용됨

select emp_no, first_name, last_name
from employees
order by
    -- emp_no asc;
    -- emp_no desc;
    emp_no; -- 오르차순 (default)


    -- 컬럼에 따라 정렬을 여러번 할 수 있다
select emp_no, first_name, last_name
from employees
order by
    first_name desc,
    last_name;