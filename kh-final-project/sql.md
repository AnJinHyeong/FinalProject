#회원 테이블
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

