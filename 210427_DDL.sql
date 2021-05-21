--DDL : 데이터 정의어
--테이블 만들기
 --아이템이라는 이름을 가진 테이블을 만들겠다
--테이블을 다시 만들어야한다면 삭제하고 다시 만들기. DROP 명령어로 테이블 삭제
DROP TABLE ITEM;
CREATE TABLE ITEM (
ITEMCODE VARCHAR2(4) PRIMARY KEY, --가변 길이가 최대 10자리로 만들겠다 / CHAR : 고정 길이
--PRIMARY KEY : for 중복성 배제, NULL 허용 안 함/PRIMARY KEY는 2개 이상 적용 가능(2개 이상의 필드를 하나로 합칠 때)
ITEMNAME VARCHAR2(50) NOT NULL, --NOT NULL이 붙은 속성들은 반드시 값을 채워넣어야함.
PRICE NUMBER(10) NOT NULL,
REGDATE DATE DEFAULT SYSDATE, --등록 일자 / 자동으로 들어가게 만드는 것이 가장 좋음.(->DEFAULT)
NOTE VARCHAR2(100) --비고
--PRIMARY KEY는 여기에 적어도 됨. EX)PRIMARY KEY(ITEMCODE)
);

SELECT * FROM ITEM;

--DML : 데이터 추가 명령문
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8801', '사이다', '1000'); --아이템 코드, 아이템명, 가격만 넣겠다.
INSERT INTO ITEM (ITEMCODE, ITEMNAME,PRICE)VALUES('8802', '젤리', '300'); --아이템코드와 가격만 넣겠다.
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8803', '크림빵', '1000');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8804', '컵라면', '1100');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8805', '우산', '5000');
INSERT INTO ITEM VALUES('8806', '아이스크림', '2000',SYSDATE,'치즈');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8807', '우산', 3000);
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8809', '장우산', 3500);

--이 상태는 아직 표에 적용된 상태가 아니다. 임시적으로 보관된 상태일 뿐.
--아이템코드는 분포도가 낮다(각각 유일함). 가격은 분포도가 높다.

SELECT * FROM ITEM;
--트랜잭션 : 작업의 수행 단위
COMMIT; --내용들을 확정짓겠다. 드디어 표 완성 ! 커밋을 하지 않으면 자바 같은 외부 시스템에서 읽어들일 수 없음.
ROLLBACK; --DML 취소. 임시 보관 상태인 속성들(INSERT, ALTER, UPDATE)을 취소하겠다.
--주의할 점 : 트랜잭션이 종료되어야만 다른 트랜잭션 시작 가능

--DML 를 활용하여 수정하고 싶다면
UPDATE ITEM
SET ITEMNAME = '칠성 사이다'
WHERE ITEMCODE = '8801'; --WHERE 문을 사용하지 않으면 모든 코드의 상품명이 변경됨. PK로 잡아서 수정해야함.(유일해야하니까)

SELECT * FROM ITEM;

--삭제
DELETE FROM ITEM --이것만 실행하면 다 삭제됨.(커밋해도 삭제됨)
WHERE ITEMCODE = '8801';

--여러 건 조회
SELECT * FROM ITEM
WHERE ITEMNAME LIKE '%우산%'; --특정한 단어가 포함되어있다면 조회해라.
--만약 '우산%'이라면 우산으로 시작하는 단어, '%우산%'이라면 앞뒤에 무엇이 붙던 우산이 포함되어 있는 단어 조회

--한 건만 조회
SELECT * FROM ITEM
WHERE ITEMCODE = '8807';







