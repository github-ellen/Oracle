--DDL : ������ ���Ǿ�
--���̺� �����
 --�������̶�� �̸��� ���� ���̺��� ����ڴ�
--���̺��� �ٽ� �������Ѵٸ� �����ϰ� �ٽ� �����. DROP ��ɾ�� ���̺� ����
DROP TABLE ITEM;
CREATE TABLE ITEM (
ITEMCODE VARCHAR2(4) PRIMARY KEY, --���� ���̰� �ִ� 10�ڸ��� ����ڴ� / CHAR : ���� ����
--PRIMARY KEY : for �ߺ��� ����, NULL ��� �� ��/PRIMARY KEY�� 2�� �̻� ���� ����(2�� �̻��� �ʵ带 �ϳ��� ��ĥ ��)
ITEMNAME VARCHAR2(50) NOT NULL, --NOT NULL�� ���� �Ӽ����� �ݵ�� ���� ä���־����.
PRICE NUMBER(10) NOT NULL,
REGDATE DATE DEFAULT SYSDATE, --��� ���� / �ڵ����� ���� ����� ���� ���� ����.(->DEFAULT)
NOTE VARCHAR2(100) --���
--PRIMARY KEY�� ���⿡ ��� ��. EX)PRIMARY KEY(ITEMCODE)
);

SELECT * FROM ITEM;

--DML : ������ �߰� ��ɹ�
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8801', '���̴�', '1000'); --������ �ڵ�, �����۸�, ���ݸ� �ְڴ�.
INSERT INTO ITEM (ITEMCODE, ITEMNAME,PRICE)VALUES('8802', '����', '300'); --�������ڵ�� ���ݸ� �ְڴ�.
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8803', 'ũ����', '1000');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8804', '�Ŷ��', '1100');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8805', '���', '5000');
INSERT INTO ITEM VALUES('8806', '���̽�ũ��', '2000',SYSDATE,'ġ��');
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8807', '���', 3000);
INSERT INTO ITEM (ITEMCODE, ITEMNAME, PRICE)VALUES('8809', '����', 3500);

--�� ���´� ���� ǥ�� ����� ���°� �ƴϴ�. �ӽ������� ������ ������ ��.
--�������ڵ�� �������� ����(���� ������). ������ �������� ����.

SELECT * FROM ITEM;
--Ʈ����� : �۾��� ���� ����
COMMIT; --������� Ȯ�����ڴ�. ���� ǥ �ϼ� ! Ŀ���� ���� ������ �ڹ� ���� �ܺ� �ý��ۿ��� �о���� �� ����.
ROLLBACK; --DML ���. �ӽ� ���� ������ �Ӽ���(INSERT, ALTER, UPDATE)�� ����ϰڴ�.
--������ �� : Ʈ������� ����Ǿ�߸� �ٸ� Ʈ����� ���� ����

--DML �� Ȱ���Ͽ� �����ϰ� �ʹٸ�
UPDATE ITEM
SET ITEMNAME = 'ĥ�� ���̴�'
WHERE ITEMCODE = '8801'; --WHERE ���� ������� ������ ��� �ڵ��� ��ǰ���� �����. PK�� ��Ƽ� �����ؾ���.(�����ؾ��ϴϱ�)

SELECT * FROM ITEM;

--����
DELETE FROM ITEM --�̰͸� �����ϸ� �� ������.(Ŀ���ص� ������)
WHERE ITEMCODE = '8801';

--���� �� ��ȸ
SELECT * FROM ITEM
WHERE ITEMNAME LIKE '%���%'; --Ư���� �ܾ ���ԵǾ��ִٸ� ��ȸ�ض�.
--���� '���%'�̶�� ������� �����ϴ� �ܾ�, '%���%'�̶�� �յڿ� ������ �ٴ� ����� ���ԵǾ� �ִ� �ܾ� ��ȸ

--�� �Ǹ� ��ȸ
SELECT * FROM ITEM
WHERE ITEMCODE = '8807';







