drop table item;

--��ǰ�������̺�
create table item (
	item_id			number(20) primary key,
	item_name		varchar2(20) not null,
	item_price		number(10) not null,
	item_reg_date 	date default sysdate,
	item_image 		varchar2(200) not null,
	item_deliver	varcahr2(100), --������� ����
	item_seller		varchar2(20) default '�������ø�', --�Ǹ���
	item_package	varchar2(50), --����Ÿ��
	item_expiredate varcahr2(50) ,		--�������
	item_unit 		varchar2(20), --����
	item_weight 	varchar2(10), --�߷�, �뷮
	item_category 	varchar2(20) not null,
	item_intro 		varchar2(200) not null, --��ǰ ���� ����
	item_stock 		number(10) not null
)



select * from item;
select * from tab;