drop table item;

--��ǰ�������̺�
create table item (
	item_id			number(20) primary key,
	item_name		varchar2(100) not null,
	item_price		number(10) not null,
	item_reg_date 	date default sysdate,
	item_image 		varchar2(200) not null,
	item_deliver	varchar2(200), --������� ����
	item_seller		varchar2(20) default '�������ø�', --�Ǹ���
	item_package	varchar2(100), --����Ÿ��
	item_expiredate varchar2(200), --�������
	item_unit 		varchar2(100), --����
	item_weight 	varchar2(50), --�߷�, �뷮
	item_category 	varchar2(20) not null,
	item_intro 		varchar2(200) not null, --��ǰ ���� ����
	item_stock 		number(10) not null
)

insert into item
values
(1, 'ģȯ�� ��ä�� ���� 30g', 1590, sysdate, 'image/����', '������� 23�� �� �ֹ��� ���� ��ħ 7�� �� ����',
'�������ø�', '����(��������)', '��깰�� ������ ��������� ������ ������ ������ ��ñ� �ٶ��ϴ�.', '1��', '30g', 'ä��', '��ŭ�ϰ� �Խ��� ��� (1��/30g)', 10000);


select * from item;
select * from tab;