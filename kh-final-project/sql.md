#member table
create table member (
member_no number PRIMARY key,
member_id varchar2(30) not null unique,
member_pw varchar2(30) not null,
member_nick varchar2(30) not null,
member_have_point number(19) default 0,
member_use_point number(19) default 0,
member_email varchar2(30) not null unique,
member_introduce varchar2(1000),
member_grade varchar2(30) check (member_grade in('관리자','사용자','블랙')),   
auth_check varchar2(30)
);

#project table
CREATE TABLE project(
project_no NUMBER(19) PRIMARY KEY,
project_title varchar2(300),
project_content varchar2(4000),
project_target_amount NUMBER(19),
project_percente NUMBER(5),
project_state char(1) CHECK (project_state IN ('X','Y','N')) NOT NULL,
project_regist_date DATE DEFAULT sysdate NOT NULL,
project_start_date DATE,
project_end_date DATE,
project_stop_caues varchar2(4000),
project_summary varchar2(50) not null,
member_no references member(member_no) on delete SET NULL,
category_no REFERENCES category(category_no) ON DELETE SET NULL
);

CREATE SEQUENCE project_seq;


#category table
create table category(
category_no number(19) primary key,
category_theme varchar2(60) not null unique,
category_super number(19)
);

create sequence category_seq;