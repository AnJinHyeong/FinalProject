#member table
create table member (
member_no number PRIMARY key,
member_id varchar2(30) not null unique,
member_pw varchar2(30) not null,
member_nick varchar2(30) not null,
member_have_point number(19) default 0 not null check(member_have_point >= 0),
member_email varchar2(30) not null unique,
member_introduce varchar2(1000),
member_grade varchar2(30) default '사용자' not null check (member_grade in('관리자','사용자')),   
member_address VARCHAR2(200)
);

CREATE SEQUENCE member_seq;


##프로젝트
#project table
CREATE TABLE project(
project_no NUMBER(19) PRIMARY KEY,
project_title varchar2(90),
project_content clob default empty_clob(),
project_content_file clob default empty_clob(),
project_target_amount NUMBER(19),
project_percent NUMBER(5) default 0 not null check(project_percent >= 0),
project_state char(1) default '1' CHECK (project_state IN ('1','2','3','4','X')) not null,
project_regist_date DATE DEFAULT sysdate NOT NULL,
project_start_date DATE,
project_end_date DATE,
project_stop_causes varchar2(4000),
project_summary varchar2(150) not null,
member_no references member(member_no) on delete SET NULL,
category_no REFERENCES category(category_no) ON DELETE SET NULL,
member_info_nick varchar2(30),
member_info_content varchar2(1000),
project_amount_give char(1) check(project_amount_give in ('Y')),
project_like_count number(19) DEFAULT 0 not null
);

CREATE SEQUENCE project_seq;


##카테고리
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
    email varchar2(256) primary key,
    no char(9) not null,
    time date default sysdate not null
);


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
member_no REFERENCES member(member_no) ON DELETE CASCADE,
main_banner references banner(banner_no) on delete cascade
);

CREATE SEQUENCE image_file_seq;


#sponsor table
create table sponsor(
sponsor_no number(19) primary key,
member_no references member(member_no) on delete set null,
gift_no references gift(gift_no),
project_no references project(project_no) on delete set null,
sponsor_amount number(19) not null check(sponsor_amount >= 0),
sponsor_date date default sysdate not null,
sponsor_cancel char(1) check (sponsor_cancel ='Y')
);

create sequence sponsor_seq;


##프로젝트 좋아요
#project_like
CREATE TABLE project_like(
like_project_no REFERENCES project(project_no) ON DELETE cascade,
like_member_no references member(member_no) on delete cascade,
like_date DATE DEFAULT sysdate,
constraint project_like_pk primary key(like_project_no, like_member_no) 
);

##프로젝트 커뮤니티 
#project_community
CREATE TABLE project_community(
project_community_no number(19) PRIMARY KEY,
project_community_content varchar2(4000) NOT NULL,
project_community_date DATE DEFAULT sysdate,
member_no references member(member_no) ON DELETE CASCADE,
project_no references project(project_no) ON DELETE CASCADE 
);

CREATE SEQUENCE project_community_seq;


##프로젝트 신고하기
#project_report
CREATE TABLE project_report(
report_no NUMBER(19) PRIMARY KEY,
report_project_no REFERENCES project(project_no) ON DELETE SET NULL,
report_member_no references member(member_no) on delete SET NULL,
report_content varchar2(4000) NOT NULL,
report_date DATE DEFAULT sysdate
);

CREATE SEQUENCE project_report_seq;


#banner
create table banner(
banner_no number(19) primary key,
banner_title varchar2(60) not null,
banner_content varchar2(150) not null, 
banner_background_color char(7) default '#ffffff' not null,
banner_color char(7) default '#000000' not null
);

create sequence banner_seq;

##요청게시판(자유게시판)
#request
CREATE TABLE request(
request_no number(19) PRIMARY KEY,
request_title VARCHAR2(300) NOT NULL,
request_content VARCHAR2(4000) NOT NULL,
request_date DATE DEFAULT sysdate,
request_view NUMBER(19) DEFAULT 0,
request_like_count number(19) DEFAULT 0,
request_reply_count number(19) DEFAULT 0,
request_category_no REFERENCES category(category_no) ON DELETE CASCADE,
request_member_no REFERENCES member(member_no) ON DELETE SET NULL
);

CREATE SEQUENCE request_seq;

##요청게시판 좋아요
#request_like
CREATE TABLE request_like(
request_like_no references request(request_no) ON DELETE CASCADE,
request_like_member_no references member(member_no) ON DELETE CASCADE,
request_like_date DATE DEFAULT sysdate,
constraint request_like_pk primary key(request_like_no, request_like_member_no) 
);

##요청게시판 댓글
#request_reply
CREATE TABLE request_reply(
request_reply_pk_no number(19) PRIMARY KEY,
request_reply_no references request(request_no) ON DELETE CASCADE,
request_reply_member_no references member(member_no) ON DELETE CASCADE,
request_reply_content varchar2(300) NOT NULL,
request_reply_date DATE DEFAULT sysdate
);

CREATE SEQUENCE request_reply_seq;


#Message
create table message(
    msg_no number(19) primary key,
    sender_no references member(member_no) on delete SET NULL,
    msg_title varchar2(50) not null,
    msg_content varchar2(1000),
    msg_date DATE default sysdate not null,
    receiver_no references member(member_no) on delete Set null
);

create sequence msg_seq;

