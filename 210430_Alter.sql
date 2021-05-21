--책 테이블
--컬럼 : bookcode, bookname, publisher, price, discount, regdate

DROP TABLE BOOKLIST;

CREATE TABLE BOOKLIST(
                      BOOKCODE VARCHAR2(20),
                      BOOKNAME VARCHAR2(100),
                      PUBLISHER VARCHAR2(100),
                      PRICE NUMBER(10),
                      DISCOUNT NUMBER(3,1),
                      REGDATE DATE DEFAULT SYSDATE);
                        
ROLLBACK;                        
SELECT * FROM BOOKLIST;

INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-1', '오라클 입문', '국제 출판사', 15000, 0.15);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-2', '이것이 자바다', '국제 출판사', 20000, 0.10);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-1', '한국사', '역사 출판사', 32000, 0.5);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-2', '세계사', '역사 출판사', 28000, 0.5);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-3', '자바 입문 프로그래밍', '국제 출판사', 30000, 0.2);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-3', '세계지리', '역사 출판사', 15000, 0.15);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('C-880-1', '백종원 중화 요리책', '백스 출판사', 10000, 0.1);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('C-880-2', '백종원 한식 요리책', '백스 출판사', 15000, 0.35);

--구조 변경 명령어(DDL)
--이미 만들어진 테이블을 DROP하지 않고 수정할 때.
ALTER TABLE BOOKLIST ADD PRIMARY KEY (BOOKCODE); --북코드를 유일키로 추가하겠다.
ALTER TABLE BOOKLIST ADD (MODIFYDATE DATE DEFAULT SYSDATE); --'MODIFYDATE'라는 컬럼을 추가하겠다.
--북이름을 NOT NULL로 설정하고 싶을 때
ALTER TABLE BOOKLIST MODIFY (BOOKNAME VARCHAR2(100) NOT NULL);
--컬럼을 지우고 싶을 때
ALTER TABLE BOOKLIST DROP COLUMN PUBLISHER;

--인덱스
--PK는 자동적으로 인덱스가 걸린다.
--인덱스를 걸어주면 검색 속도가 빨라진다.
--무분별한 인덱스는 오히려 검색 속도가 저하된다.
--유지보수가 필요하다(정기적 업데이트)

--클라이언트 측에서 책이름으로 검색할 수 있게 해주세요. 라고 요청이 오면
--책이름을 인덱스 걸어두는 설계가 필요하다는 것.


--인덱스 생성하기
CREATE INDEX BOOK_BOOKNAME_IX ON BOOKLIST(BOOKNAME); --북네임만 따로 모아놓겠다.

--인덱스 삭제하기
DROP INDEX BOOK_BOOKNAME_IX;





















