show user;

select *
from tab;

select * from store_raw where addr_new like '%영등포구%' and STORE_NAME like '송죽장';

select * from store_raw

--- 가로수길
select *
from ( select STORE_CODE, DIST_CODE, OPEN_STATUS, store_name, POSTCODE_NEW, POSTCODE_old, business_type, HYGIENE_TYPE, COORDINATES_X, COORDINATES_Y,
case when substr(postcode_old, 1, 1) = 1 then decode(replace(decode(substr(call, 1, 2), '02', call, '02' || call), ' ', ''), '02', null, replace(decode(substr(call, 1, 2), '02', call, '02' || call), ' ', '')) else '서울 외' end as call_localize,
substr(addr_old, 1, instr(addr_old, '시', 1, 1)) as 행정,
substr(addr_old, instr(addr_old, ' ', 1, 1) + 1, instr(addr_old, ' ', 1, 2) - instr(addr_old, ' ', 1, 1) - 1) as 시구,
substr(addr_old, instr(addr_old, ' ', 1, 2) + 1, instr(addr_old, ' ', 1, 3) - instr(addr_old, ' ', 1, 2) - 1) as 동,
substr(addr_old, instr(addr_old, ' ', 1, 3) + 1) as 상세주소, addr_old as addr_old, addr_old || addr_new || store_name as search
from store_raw) local
where OPEN_STATUS != '폐업' and lower(replace(trim(local.search), ' ', ''))
like lower(replace(trim('%%'), ' ', '')) and lower(replace(trim(store_name), ' ', '')) 
like lower(replace(trim('%%'), ' ', ''))
and local.COORDINATES_Y like '446%'
and local.COORDINATES_X like '2016%'
order by local.COORDINATES_X asc;


SELECT * FROM STORE_KOREA
WHERE STATUS_DETAIL = '영업'
AND ADDR_NEW LIKE '%서울%';

select hygine.store_name, hygine.search
from (
SELECT store_name, BUSINESS_TYPE as BUSINESS, HYGIENE_TYPE as HYGIENE, BUSINESS_TYPE || HYGIENE_TYPE as search
FROM STORE_raw
) hygine
where hygine.search like '%분식%';

select hygine.store_name, hygine.search
from (
SELECT store_name, BUSINESS_TYPE || HYGIENE_TYPE as search
FROM STORE_raw
) hygine
where hygine.search like '%분식%';




--- 가로수길 테스트
--- 2. 실제 검색 - 가로수길 - 신사동
SELECT STORE.STORE_CODE, STORE.OPEN_STATUS, STORE.STORE_NAME, STORE.call, STORE.POSTCODE_NEW, STORE.ADDR_NEW, STORE.ADDR_OLD, STORE.COORDINATES_X, STORE.COORDINATES_Y
FROM ( SELECT STORE_CODE, DIST_CODE, OPEN_STATUS, STATUS_DETAIL, CALL, POSTCODE_OLD, ADDR_OLD, POSTCODE_NEW, ADDR_NEW,
STORE_NAME, BUSINESS_TYPE, COORDINATES_X, COORDINATES_Y, HYGIENE_TYPE,
HYGIENE_TYPE, ADDR_OLD || ADDR_NEW || STORE_NAME || BUSINESS_TYPE || HYGIENE_TYPE AS SEARCH_ALL,
ADDR_OLD || ADDR_NEW AS SEARCH_ADDR
FROM STORE_KOREA WHERE STATUS_DETAIL = '영업' ) STORE
WHERE LOWER(REPLACE(TRIM(STORE.SEARCH_ALL), ' ', ''))
LIKE LOWER(REPLACE(TRIM('%%'), ' ', ''))
and regexp_like(COORDINATES_x, '^20[12]') and regexp_like(COORDINATES_y, '^446[123]')
and LOWER(REPLACE(TRIM(STORE.SEARCH_ALL), ' ', ''))
LIKE LOWER(REPLACE(TRIM('%신사동%'), ' ', ''));




--- 테스트 2
--- 2. 일반 검색
SELECT STORE.STORE_CODE, store.hygine, store.business, STORE.OPEN_STATUS, STORE.STORE_NAME, STORE.call, STORE.POSTCODE_NEW, STORE.ADDR_NEW, STORE.ADDR_OLD, STORE.COORDINATES_X, STORE.COORDINATES_Y
FROM ( SELECT STORE_CODE, DIST_CODE, OPEN_STATUS, STATUS_DETAIL, CALL, POSTCODE_OLD, ADDR_OLD, POSTCODE_NEW, ADDR_NEW,
STORE_NAME, BUSINESS_TYPE, COORDINATES_X, COORDINATES_Y, HYGIENE_TYPE as hygine, BUSINESS_TYPE as business,
HYGIENE_TYPE, ADDR_OLD || ADDR_NEW || STORE_NAME || BUSINESS_TYPE || HYGIENE_TYPE AS SEARCH_ALL
FROM STORE_KOREA WHERE STATUS_DETAIL = '영업' ) STORE
WHERE LOWER(REPLACE(TRIM(STORE.SEARCH_ALL), ' ', ''))
LIKE LOWER(REPLACE(TRIM('%세느장%'), ' ', ''));