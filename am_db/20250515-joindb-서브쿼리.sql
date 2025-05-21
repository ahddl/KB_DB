
use joindb;


-- 가장 비싼 상품의 이름과 가격을 출력
SELECT NAME, PRICE
FROM PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCT);

-- maria라는 이름의 회사가 만든 상품들의 이름과 가격
SELECT NAME, PRICE
FROM PRODUCT
WHERE COMPANY IN (SELECT ID FROM COMPANY WHERE NAME = 'maria');

-- 특정 회사들(c100, c300)의 상품만 출력하기
SELECT NAME, COMPANY
FROM PRODUCT
WHERE COMPANY IN (
    SELECT ID FROM COMPANY WHERE ID IN ('c100', 'c300')
);
-- 서브쿼리는 ('c100', 'c300')만 반환
-- 해당 회사의 제품만 메인 쿼리에서 출력


-- 회사 정보가 없는 제품만 출력하기
SELECT NAME, COMPANY
FROM PRODUCT
WHERE COMPANY NOT IN (
    SELECT ID FROM COMPANY
);
-- 서브쿼리는 모든 실제 존재하는 회사 ID를 반환
-- 그 회사에 속하지 않은, 즉 NULL이거나 연결되지 않은 상품만 출력됨 → food11, food12 등이 나옴


-- 가장 저렴한 회사 제품보다 비싼 제품 모두 출력하기
SELECT NAME, PRICE
FROM PRODUCT
WHERE PRICE > ANY (
    SELECT PRICE FROM PRODUCT WHERE COMPANY = 'c100'
);
/*
•	서브쿼리는 c100 회사 제품의 가격 목록을 반환 (1000, 5000, 6000, 9000 등)
•	그 중 어느 하나라도 초과하면 출력됨
• 결국, 서브쿼리 결과 중 가장 작은 값보다 큰 값이 조건이 됨. 부등호가 반대이면 조건도 반대
→ 즉, 가장 저렴한 c100 상품인 1000보다 비싼 상품 전부 나옴
*/


-- c100 회사의 모든 제품보다 가격이 더 높은 상품만 출력하기
SELECT NAME, PRICE
FROM PRODUCT
WHERE PRICE > ALL (
    SELECT PRICE FROM PRODUCT WHERE COMPANY = 'c100'
);
/*
•	서브쿼리는 c100의 모든 가격을 반환
•	그 모든 값보다 커야 결과에 포함됨
반환
• 결국, 서브쿼리 결과 중 가장 큰 값보다 큰 값이 조건이 됨.
→ 즉, c100에서 가장 비싼 상품이 10000이라면, 10000 초과인 상품만 출력됨
→ food11, food12만 해당
*/
-- ----------------------------------------------------

-- 조인

-- inner join
-- 제품과 그 제품을 만든 회사의 이름을 조회하세요. 회사 정보가 없는 제품은 제외합니다.
SELECT P.ID AS Product_ID, P.NAME AS Product_Name, C.NAME AS Company_Name
FROM PRODUCT P
INNER JOIN COMPANY C ON P.COMPANY = C.ID;


-- left outer join
-- 모든 제품과 그 제품을 만든 회사의 이름을 조회하세요. 회사 정보가 없는 제품도 포함합니다.
SELECT 
P.ID AS Product_ID, 
P.NAME AS Product_Name, C.NAME AS Company_Name
FROM PRODUCT P
LEFT OUTER JOIN COMPANY C 
ON P.COMPANY = C.ID;


-- right outer join
-- 제품과 그 제품을 만든 회사의 이름을 조회하세요. 회사 정보가 없는 제품은 제외합니다.
SELECT 
P.ID AS Product_ID, 
P.NAME AS Product_Name, C.NAME AS Company_Name
FROM PRODUCT P
RIGHT OUTER JOIN COMPANY C 
ON P.COMPANY = C.ID;


-- self join
CREATE TABLE emptbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl (emp, manager, empTel) VALUES
('나사장', NULL, '0000'),
('김재무', '나사장', '2222'),
('김부장', '김재무', '2222-1'),
('이부장', '김재무', '2222-2'),
('우대리', '이부장', '2222-2-1'),
('지사원', '이부장', '2222-2-2'),
('이영업', '나사장', '1111'),
('한과장', '이영업', '1111-1'),
('최정보', '나사장', '5355'),
('윤차장', '최정보', '3355-1'),
('이주임', '윤자장', '5335-1-1');

select * from empTbl;

-- 우대리 상관의 연락처 검색
SELECT 
	A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM empTbl A
INNER JOIN empTbl B
ON A.manager = B.emp
WHERE A.emp = '우대리';

