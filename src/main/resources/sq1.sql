DROP TABLE student;
DROP TABLE parents;
DROP TABLE teacher;
DROP TABLE friend;
DROP TABLE myclass;
DROP TABLE gamescore;
DROP TABLE gamestage;
DROP SEQUENCE friend_seq;
DROP SEQUENCE gamescore_seq;
DROP SEQUENCE gamestage_seq;
DROP TABLE mathboard;

-- 학생정보 테이블 생성 --
CREATE TABLE student(
 student_id varchar2(20) primary key
 , student_pw varchar2(50)
 , student_name varchar2(50) not null
 , student_email varchar2(100)
 , student_nickname varchar2(50) unique
 , student_myclass_code varchar2(10) );

 ALTER TABLE student ADD student_myclass_check number(2);
  ALTER TABLE student ADD student_parents_id varchar2(20);
  ALTER TABLE student ADD student_family_check number(2);

-- 학부모정보 테이블 생성 --
CREATE TABLE parents(
parents_id varchar2(20) primary key
, parents_pw varchar2(50)
, parents_name varchar2(50) not null
, parents_email varchar2(100)
, parents_nickname varchar2(50) unique );

-- 선생님정보 테이블 생성
CREATE TABLE teacher(
teacher_id varchar2(20) primary key
, teacher_pw varchar2(50)
, teacher_name varchar2(50) not null
, teacher_email varchar2(100)
, teacher_nickname varchar2(50) unique );

-- 친구 시퀀스 번호 생성
CREATE SEQUENCE friend_seq nocache;

-- 친구 테이블 생성
CREATE TABLE friend(
friend_seq number primary key
, my_id varchar2(20)
, friend_id varchar2(20)
);

-- 우리반 테이블 생성
CREATE TABLE myclass(
myclass_code varchar2(10) primary key
, myclass_name varchar2(20) not null
, myclass_teacher_name varchar2(50) not null
);

-- 게임 스테이지 시퀀스
CREATE SEQUENCE gamestage_seq nocache;

-- 게임 스테이지 테이블
CREATE TABLE gamestage(
gamestage_seq number primary key
, student_id varchar2(20) references student(student_id)
, gamechapter number
, stage1 number default 0
, stage2 number default 0
, stage3 number default 0
, stage4 number default 0
, stage5 number default 0
);

-- 방명록 시퀀스
CREATE SEQUENCE mathboard_seq nocache;

-- 방명록 테이블
CREATE TABLE mathboard(
mathboard_seq number primary key
, host_id varchar2(20)
, guest_id varchar2(20)
, contents varchar2(2000)
);





-- 게임 스코어 테이블 시퀀스
CREATE SEQUENCE gamescore_seq nocache;

-- 게임 스코어 테이블 C
CREATE TABLE gamescore(
gamescore_seq number primary key
, student_id varchar2(20) references student(student_id)
, chapter1_score number

, -- number chapter2_score number, -- calculation chapter3_score number, -- shape chapter4_score number -- life );

