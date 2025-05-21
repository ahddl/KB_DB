/*
 SELECT
 특정 테이블에서 원하는 데이터를 조회할 수 있다.
 */

select -- 조회해줘
       * -- 모든 컬럼을
from  -- buytbl 에서
    buytbl;


select (5+5);
select now();  -- 현재 시간 출력
-- 컬럼에 별칭 사용
select concat('mj', '안녕','kb') as 인사;   -- as (컬럼명, 공백 원할 떈 ''로 묶어주기)

-- userbl의 name, mobile1, mobile2 를 조회
-- mobile1, mobile2은 붙어서 전화번호 라는 컬럼으로 조회 되어야함
select name, concat(mobile1, mobile2) as 전화번호
from usertbl;

