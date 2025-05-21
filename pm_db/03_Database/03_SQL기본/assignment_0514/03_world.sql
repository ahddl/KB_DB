USE world;



-- 국가코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요.
    select Name, Population
    from city
    where CountryCode = 'KOR'
    order by city.Population desc;

-- city 테이블에서 국가코드와 인구수를 출력하라.
-- 정렬은 국가코드별로 오름차순으로, 동일한코드(국가) 안에서는 인구수의 역순으로 표시하세요.
    select city.CountryCode, city.Population
    from city
    order by CountryCode ASC, Population DESC ;


-- city 테이블에서 국가코드가 'KOR'인 도시의 수를 표시하세요.
select city.CountryCode,
       count(*)
from city
where CountryCode ='KOR';


-- city 테이블에서 국가코드가 'KOR', 'CHN', 'JPN'인 도시를 찾으세요.
   select city.Name, CountryCode
   from city
   where CountryCode IN ('KOR','CHN','JPN');


-- 국가코드가 'KOR'이면서 인구가 100만 이상인 도시를 찾으세요.
    select city.Name, city.CountryCode, city.Population
    from city
    where CountryCode='KOR' AND Population >= 1000000;

-- 국가코드가 'KOR'인 도시 중 인구수가 많은 순서로 상위 10개만 표시하세요.
    select city.Name, city.Population, CountryCode
    from city
    where CountryCode ='KOR'
    order by Population desc
    limit 10;

-- city 테이블에서 국가코드가 'KOR'이고, 인구가 100만 이상 500만이하인 도시를 찾으세요.
select city.Name, city.CountryCode, city.Population
from city
where CountryCode = 'KOR' AND Population BETWEEN 1000000 and 5000000;
