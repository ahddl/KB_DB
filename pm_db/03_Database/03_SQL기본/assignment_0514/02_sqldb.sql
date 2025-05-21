-- 배포된 sqldb.sql 파일을 이용하여 sqldb 데이터베이스를 구축하세요.
USE sqldb;

-- usertbl 테이블에서 이름이'김경호'인 행을 출력하세요.
select *
from usertbl
where name = '김경호';

-- usertbl 테이블에서 생년이 1970 이상이고 키가 182 이상인 데이터를 출력하세요.
select *
from usertbl
where birthYear >= 1970
  AND height >= 182;

-- usertbl 테이블에서 키가 180~183 범위인 데이터를 출력하세요.
select *
from usertbl
where height BETWEEN 180 and 183;

-- usertbl 테이블에서 주소가'경남' 또는'전남' 또는'경북'인데이터를 출력하세요.
select *
from usertbl
WHERE addr IN ('경남', '전남', '경북');

-- usertbl 테이블에서 이름이 '김'으로 시작하는 데이터를 출력하세요.
select *
from usertbl
WHERE name LIKE '김%';

-- usertbl에서 김경호보다 큰 사람들의 이름과 키를 출력하세요.
-- 서브쿼리를 이용하여 쿼리를 작성하세요.
select name, height
from usertbl
where height > (select height from usertbl where name='김경호');

-- usertbl 을 mdata의 오름차순으로 정렬하여 출력하세요.
select *
from usertbl
order by mDate ASC;

-- usertbl 을 mdata의 내림차순으로 정렬하여 출력하세요.
select *
from usertbl
order by mDate DESC;

-- usertbl 을 height의 내림차순으로 정렬하고, 동률인 경우 name의 내림차순으로 정렬하여 출력하세요.
select *
from usertbl
order by height DESC, name DESC;

-- usertbl의 주소지를 중복없이 오름차순으로 출력하세요.
select DISTINCT addr
from usertbl
order by usertbl.addr ASC;