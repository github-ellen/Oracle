--å ���̺�
--�÷� : bookcode, bookname, publisher, price, discount, regdate

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

INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-1', '����Ŭ �Թ�', '���� ���ǻ�', 15000, 0.15);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-2', '�̰��� �ڹٴ�', '���� ���ǻ�', 20000, 0.10);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-1', '�ѱ���', '���� ���ǻ�', 32000, 0.5);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-2', '�����', '���� ���ǻ�', 28000, 0.5);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('D-880-3', '�ڹ� �Թ� ���α׷���', '���� ���ǻ�', 30000, 0.2);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('H-880-3', '��������', '���� ���ǻ�', 15000, 0.15);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('C-880-1', '������ ��ȭ �丮å', '�齺 ���ǻ�', 10000, 0.1);
INSERT INTO BOOKLIST (BOOKCODE, BOOKNAME, PUBLISHER, PRICE, DISCOUNT) VALUES('C-880-2', '������ �ѽ� �丮å', '�齺 ���ǻ�', 15000, 0.35);

--���� ���� ��ɾ�(DDL)
--�̹� ������� ���̺��� DROP���� �ʰ� ������ ��.
ALTER TABLE BOOKLIST ADD PRIMARY KEY (BOOKCODE); --���ڵ带 ����Ű�� �߰��ϰڴ�.
ALTER TABLE BOOKLIST ADD (MODIFYDATE DATE DEFAULT SYSDATE); --'MODIFYDATE'��� �÷��� �߰��ϰڴ�.
--���̸��� NOT NULL�� �����ϰ� ���� ��
ALTER TABLE BOOKLIST MODIFY (BOOKNAME VARCHAR2(100) NOT NULL);
--�÷��� ����� ���� ��
ALTER TABLE BOOKLIST DROP COLUMN PUBLISHER;

--�ε���
--PK�� �ڵ������� �ε����� �ɸ���.
--�ε����� �ɾ��ָ� �˻� �ӵ��� ��������.
--���к��� �ε����� ������ �˻� �ӵ��� ���ϵȴ�.
--���������� �ʿ��ϴ�(������ ������Ʈ)

--Ŭ���̾�Ʈ ������ å�̸����� �˻��� �� �ְ� ���ּ���. ��� ��û�� ����
--å�̸��� �ε��� �ɾ�δ� ���谡 �ʿ��ϴٴ� ��.


--�ε��� �����ϱ�
CREATE INDEX BOOK_BOOKNAME_IX ON BOOKLIST(BOOKNAME); --�ϳ��Ӹ� ���� ��Ƴ��ڴ�.

--�ε��� �����ϱ�
DROP INDEX BOOK_BOOKNAME_IX;





















