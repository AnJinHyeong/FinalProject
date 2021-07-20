#member table
create table member (
member_no number PRIMARY key,
member_id varchar2(30) not null unique,
member_pw varchar2(30) not null,
member_nick varchar2(30) not null,
member_have_point number(19) default 0,
member_email varchar2(30) not null unique,
member_introduce varchar2(1000),
member_grade varchar2(30) default '사용자' check (member_grade in('관리자','사용자','블랙')) ,   
member_address VARCHAR2(200)

CREATE SEQUENCE member_seq;
);

#project table
CREATE TABLE project(
project_no NUMBER(19) PRIMARY KEY,
project_title varchar2(300),
project_content clob default empty_clob();
project_target_amount NUMBER(19),
project_percent NUMBER(5),
project_state char(1) CHECK (project_state IN ('1','2','3','X')) NOT NULL,
project_regist_date DATE DEFAULT sysdate NOT NULL,
project_start_date DATE,
project_end_date DATE,
project_stop_caues varchar2(4000),
project_summary varchar2(150) not null,
member_no references member(member_no) on delete SET NULL,
category_no REFERENCES category(category_no) ON DELETE SET NULL
member_info_nick varchar2(30),
member_info_content varchar2(1000)
);

CREATE SEQUENCE project_seq;


#category table
create table category(
category_no number(19) primary key,
category_theme varchar2(60) not null unique,
category_super references category(category_no),
category_approve char(1) check (category_approve in ('Y'))
);

create sequence category_seq;


#email_auth table
create table email_auth(
    auth_no number(19) primary key,
    auth_key varchar2(30) not null,
    auth_time date not null
);

CREATE SEQUENCE auth_seq nocache;


#item table
create table item(
item_no number(19) primary key,
project_no references project(project_no) on delete cascade,
item_name varchar2(150) not null
);


create sequence item_seq;


#gift table
create table gift(
gift_no number(19) primary key,
project_no references project(project_no) on delete set null,
gift_price number(19) default 0 not null check(gift_price >= 0),
gift_summary varchar2(150)
);

create sequence gift_seq;

#pay table
DROP TABLE pay;
CREATE TABLE pay(
pay_no NUMBER(19) PRIMARY KEY,
pay_tid VARCHAR2(30) NOT NULL,
pay_price NUMBER(19) NOT NULL,
pay_status VARCHAR2(20) CHECK(pay_status IN ('결제 요청','결제 완료')) NOT NULL,
pay_date DATE,
pay_all_price NUMBER(19) DEFALUT 0,
member_no REFERENCES member(member_no) ON DELETE SET NULL
);
DROP SEQUENCE pay_seq;
CREATE SEQUENCE pay_seq;


#giftItem table
create table giftItem(
giftItem_no number(19) primary key,
gift_no references gift(gift_no) on delete cascade,
item_no references item(item_no) on delete cascade,
item_count number(19) not null
);

create sequence giftItem_seq;

#image_file table
CREATE TABLE image_file(
image_no NUMBER(19) PRIMARY KEY,
image_upload_name varchar2(256) NOT NULL,
image_save_name varchar2(256) NOT NULL,
image_content_type varchar2(30),
image_size number(19) DEFAULT 0 NOT NULL,
project_no REFERENCES project(project_no) ON DELETE CASCADE,
project_state char(1) CHECK (project_state IN ('Y')) ,
member_no REFERENCES member(member_no) ON DELETE CASCADE
);

CREATE SEQUENCE image_file_seq;
