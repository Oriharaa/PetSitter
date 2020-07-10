create table member(
    MEMBER_ID varchar2(30) primary key, --ID
    MEMBER_NICKNAME varchar2(30) DEFAULT 'N', --닉네임
    MEMBER_PW varchar2(30), --PW
    MEMBER_NAME varchar2(20), --이름
    MEMBER_TEL varchar2(20), --전화번호
    MEMBER_RANK varchar2(30) DEFAULT 'Green', --등급
    MEMBER_COUNT number DEFAULT 0, --이용횟수
    MEMBER_AMOUNT number DEFAULT 0, --총 금액
    MEMBER_DATE date default sysdate, --가입날짜
    MEMBER_PHOTO_FILE varchar2(100) DEFAULT 'N', --프로필사진
    MEMBER_REPORT number DEFAULT 0, --신고누적횟수
    MEMBER_GENDER varchar2(4), -- 성별, 추가
    MEMBER_ADDRESS varchar2(100) DEFAULT 'N'-- 주소, 추가
); 
select * from member;
create table PETSITTER(
    PETSITTER_ID varchar2(30) primary key, --ID
    PETSITTER_NICKNAME varchar2(30) DEFAULT 'N', --닉네임
    PETSITTER_NAME varchar2(20) default 'N', --이름
    PETSITTER_PW varchar2(30) default 'N', --PW
    PETSITTER_TEL varchar2(20) default 'N', --전화번호
    PETSITTER_EMAIL varchar2(30) default 'N', --이메일
    PETSITTER_SCORE number(2,1) DEFAULT 0, --평점
    PETSITTER_COUNT number(5) DEFAULT 0, --활동횟수
    PETSITTER_RANK varchar2(20) DEFAULT 'N', --등급
    PETSITTER_ADDRESS varchar2(100) default 'N', --주소
    PETSITTER_INTRODUCE varchar2(2000) default 'N', --자기소개
    PETSITTER_PRICE_12H varchar2(10), --12시간가격
    PETSITTER_PRICE_24H varchar2(10), --24시간가격
    PETSITTER_PRICE_30M varchar2(10), --30분가격
    PETSITTER_PRICE_60M varchar2(10), --60분가격
    PETSITTER_SERVICE_LIST varchar2(60) default 'N', --가능한 서비스
    PETSITTER_PHOTO_UPFILE varchar2(100) default 'N', --증명 사진
    PETSITTER_PHOTO_PROFILE_FILE varchar2(100) default 'N', --프로필 사진
    PETSITTER_CERT_LIST varchar2(100) default 'N', --자격증이름
    PETSITTER_PHOTO_CERT_FILE varchar2(300) default 'N', --자격증 사진
    PETSITTER_PHOTO_HOME_FILE varchar2(300) default 'N', --집 사진
    PETSITTER_DATE date DEFAULT sysdate, --가입 날짜
    PETSITTER_TYPE varchar2(20) default 'N', -- 케어종류
    PETSITTER_REPORT number(2) default 0, --신고누적횟수, 추가
    PETSITTER_GENDER varchar2(4) default 'N',-- 성별, 추가
    PETSITTER_REVIEWCOUNT number(5) DEFAULT 0 --리뷰 개수
); 

select * from petsitter
where petsitter_type like '%방문%';
select * from petsitter
where petsitter_type like '%위탁%';

insert into petsitter(petsitter_id, petsitter_nickname, petsitter_name, petsitter_pw, petsitter_tel, petsitter_email)
values('asd111', '길동', '홍길동', '123123', '010-1111-2222', 'asd111@naver.com');
insert into petsitter(petsitter_id, petsitter_nickname, petsitter_name, petsitter_pw, petsitter_tel, petsitter_email)
values('asd222', '몽룡', '이몽룡', '123123', '010-2222-4444', 'asd222@naver.com');
insert into petsitter(petsitter_id, petsitter_nickname, petsitter_name, petsitter_pw, petsitter_tel, petsitter_email)
values('asd333', '향', '춘향', '123123', '010-3333-6666', 'asd333@naver.com');
insert into petsitter(petsitter_id, petsitter_nickname, petsitter_name, petsitter_pw, petsitter_tel, petsitter_email)
values('asd444', '흥', '흥부', '123123', '010-4444-8888', 'asd444@naver.com');

<<<<<<< HEAD
=======
create table PET(
	MEMBER_ID varchar2(30),
	PET_CATEGORY varchar2(20),
	PET_KIND varchar2(20),
	PET_NAME varchar2(20), 
	PET_PHOTO varchar2(150), 
	PET_WEIGHT number(3), 
	PET_SIZE varchar2(5), 
	PET_GENDER varchar2(6),
	PET_BIRTH date,
	PET_NEUTERED varchar2(10), 
	PET_POTTYTRAN varchar2(10),
	PET_VAOONE varchar2(10),
	PET_QUESTION varchar2(30), 
	PET_ETC varchar2(200),
	PET_DATE date
);

>>>>>>> 823152b4918d7b962f99c5d7383409f27f7824f4
create table NOTICE_BOARD(
    NOTICE_NUM number(10) primary key, -- 글 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    NOTICE_SUBJECT varchar2(100), -- 제목
    NOTICE_CONTENT varchar2(4000), -- 내용
    NOTICE_PHOTO varchar2(50), -- 사진
    NOTICE_READCOUNT number(6), -- 조회수
    NOTICE_DATE date default sysdate -- 작성일
); -- 생성 안함

create table REVIEW_BOARD(
    LIST_NUM number(10), -- 리뷰 번호
    USINGLIST_NUM number(10), -- 이용내역 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    PETSITTER_ID varchar2(30), -- 펫시터 아이디
    REVIEW_CONTENT varchar2(500), -- 리뷰 내용
    REVIEW_SCORE number(2,1), -- 리뷰 평점
    REVIEW_ORG_PHOTO varchar2(50), -- 리뷰 사진
    REVIEW_UP_PHOTO varchar2(200), -- 업로드된 리뷰 사진
    REVIEW_DATE date default sysdate, -- 리뷰 작성일
    LIKE_COUNT number(6), -- 좋아요 수
    BOARD_TYPE VARCHAR2(20) default 'REVIEW_BOARD' -- 게시판 타입
);

CREATE TABLE LIKE_COUNT(
    LIKE_NUM NUMBER, --좋아요 번호
    LIKE_ID varchar2(2000), -- 좋아요 아이디
    LIKE_TYPE varchar2(20) default 'REVIEW_BOARD' -- 좋아요 타입
);
/
--트리거(REVIEW_BOARD, LIKE_COUNT 트리거)
CREATE OR REPLACE TRIGGER REVIEW_LIKE_INSERT_TRG1
BEFORE INSERT ON REVIEW_BOARD
BEGIN
INSERT into LIKE_COUNT
VALUES ((SELECT NVL(MAX(LIST_NUM),0)+1 FROM REVIEW_BOARD),'N','REVIEW_BOARD');
END;
/

create table PRO_BOARD(
    PRO_NUM number(6) primary key, -- 글 번호
    MEMBER_ID varchar2(30), -- 아이디
    PRO_SUBJECT varchar2(100), -- 제목
    PRO_CONTENT varchar2(4000), -- 내용
    PRO_ORG_FILE varchar2(100), -- 파일이름
    PRO_UP_FILE varchar2(100), -- 업로드된 파일이름
    PRO_READCOUNT number, -- 조회수
    PRO_DATE date default sysdate, -- 작성일
    PRO_LIKECOUNT number -- 좋아요 수
); -- 생성 안함

create table PETSITTER_BOARD(
    PETSITTER_NUM number(10), -- 펫시터 게시판 글 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    PETSITTER_ID varchar2(30), -- 펫시터 아이디
    PETSITTER_SUBJECT varchar2(100), -- 제목
    PETSITTER_CONTENT varchar2(4000), -- 내용
    PETSITTER_DATE date default sysdate -- 작성일
); -- 생성 안함

create table MEMBER_BOARD(
    MEMBER_NUM number(10) PRIMARY KEY, -- 회원 게시판 글 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    MEMBER_SUBJECT varchar2(100), -- 제목
    MEMBER_CONTENT varchar2(4000), -- 내용
    MEMBER_ORG_FILE varchar2(100), -- 파일 이름
    MEMBER_UP_FILE varchar2(100), -- 업로드 파일 이름
    MEMBER_READCOUNT number, -- 조회수
    MEMBER_DATE date default sysdate, -- 작성일
    MEMBER_LIKECOUNT number -- 좋아요 수
); -- 생성 안함

CREATE TABLE BOARD_COMMENT (
    COMMENT_NUM NUMBER,
    COMMENT_BOARD_TYPE VARCHAR2(20),
    COMMENT_BOARD_NUM NUMBER,
    COMMENT_CONTENT VARCHAR2(500),
    COMMENT_WRITER VARCHAR2(20),
    COMMENT_DATE DATE,
    COMMENT_LIKECOUNT NUMBER
); -- 생성 안함


-- 펫시터와의 소통 게시판
create table COMMUNICATION_BOARD(
	BOARD_NUM number(10) PRIMARY KEY, -- 회원 게시판 글 번호
    USINGLIST_NUM number(10), -- 이용 내역 번호
    BOARD_WRITER varchar2(30), -- 작성자(일반 회원 닉네임 or 펫시터 닉네임)
	MEMBER_ID varchar2(30), -- 일반 회원 아이디
	PETSITTER_ID varchar2(30), -- 펫시터 회원 아이디
	BOARD_SUBJECT varchar2(100), -- 제목
	BOARD_CONTENT varchar2(4000), -- 내용
	BOARD_READCOUNT number, -- 조회수
	BOARD_DATE date default sysdate, -- 작성일
	BOARD_CONDITION varchar2(10) default '답변 예정', -- 답변예정/답변완료
	BOARD_TYPE varchar2(10) -- 글 구분(스케줄/기타)
);

create table USINGLIST(
    USINGLIST_NUM number(10) primary key,
    PETSITTER_ID varchar2(30),
    PETSITTER_ADDR varchar2(100),
    MEMBER_ID varchar2(30),
    LIST_PRICE number(8),
    LIST_START_DATE date,
    LIST_END_DATE date,
    LIST_TYPE varchar2(10)
);

-- usinglist 예시 데이터
insert into usinglist
values('1', 'asd222', 'N', 'asdasd@naver.com', '90000', '2020/02/21', '2020/02/22', '위탁');
insert into usinglist
values('2', 'asd111', 'N', 'asdasd@naver.com', '70000', '2020/05/21', '2020/05/22', '위탁');
insert into usinglist
values('3', 'asd444', 'N', 'asdasd@naver.com', '80000', '2020/06/25', '2020/06/26', '위탁');
insert into usinglist
values('4', 'asd333', 'N', 'asdasd@naver.com', '40000', '2020/06/27', '2020/06/28', '위탁');
insert into usinglist
values('5', 'asd111', 'N', 'asdasd@naver.com', '30000', '2020/06/29', '2020/06/30', '위탁');
insert into usinglist
values('6', 'asd111', 'N', 'asdasd@naver.com', '20000', '2020/06/29', '2020/06/29', '방문');
insert into usinglist
values('7', 'asd222', 'N', 'asdasd@naver.com', '60000', '2020/06/30', '2020/07/01', '위탁');
insert into usinglist
values('8', 'asd333', 'N', 'asdasd@naver.com', '80000', '2020/07/01', '2020/07/02', '위탁');
insert into usinglist
values('9', 'asd111', 'N', 'asdasd@naver.com', '70000', '2020/07/02', '2020/07/03', '위탁');
insert into usinglist
values('10', 'asd333', 'N', 'asdasd@naver.com', '120000', '2020/07/02', '2020/07/05', '위탁');
insert into usinglist
values('11', 'asd888', '경기 오산시', 'asdasd@naver.com', '150000', '2020/07/07', '2020/07/17', '위탁');

select * from usinglist where member_id='asdasd@naver.com' order by list_num desc;
select * from petsitter where petsitter_id='asd444';
commit;

select list_num, member_id, petsitter_id, list_price, list_type, petsitter_nickname, petsitter_name, petsitter_tel 
from usinglist natural join petsitter
where member_id='asdasd@naver.com'
order by list_num desc;

select list_num, member_id, list_price, list_start_date, list_end_date, list_type, petsitter_nickname, petsitter_name, petsitter_tel 
from usinglist natural join petsitter  
where member_id='asdasd@naver.com' and list_start_date >= trunc(add_months(sysdate,-1))
order by list_num desc;

select * from usinglist 
where MEMBER_ID='asdasd@naver.com' and list_start_date >= trunc(add_months(sysdate, -1)) 
order by LIST_NUM desc;

select * from usinglist 
where MEMBER_ID='asdasd@naver.com'
order by LIST_NUM desc;

select * from usinglist
where MEMBER_ID='asdasd@naver.com' and 
      (list_start_date between to_date('2020-07-03', 'YYYY-MM-DD') and to_date('2020-07-05', 'YYYY-MM-DD') or
      list_end_date between to_date('2020-07-03', 'YYYY-MM-DD') and to_date('2020-07-05', 'YYYY-MM-DD'));
      
select list_num, member_id, list_price, list_start_date, list_end_date, list_type, petsitter_nickname, petsitter_name, petsitter_tel 
from usinglist , petsitter 
where MEMBER_ID='asdasd@naver.com' and usinglist.PETSITTER_ID=petsitter.PETSITTER_ID and 
      (list_start_date between to_date('2020-07-03', 'YYYY-MM-DD') and to_date('2020-07-04', 'YYYY-MM-DD') or
      list_end_date between to_date('2020-07-03', 'YYYY-MM-DD') and to_date('2020-07-04', 'YYYY-MM-DD'))
order by LIST_NUM desc;

-- review_board 예시 데이터
insert into REVIEW_BOARD
values(2, 2, 'asdasd@naver.com', 'asd111', '2따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다', 
4.5, 'dog01.jpg', '','2020/05/23', 0, 'REVIEW_BOARD');
insert into REVIEW_BOARD
values(1, 1, 'asdasd@naver.com', 'asd222', '2따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다', 
3, 'dog02.jpg', '','2020/03/01', 0, 'REVIEW_BOARD');
insert into REVIEW_BOARD
values(4, 4, 'asdasd@naver.com', 'asd333', '2따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다', 
5, 'dog03.jpg', '','2020/06/29', 0, 'REVIEW_BOARD');
insert into REVIEW_BOARD
values(3, 3, 'asdasd@naver.com', 'asd444', '2따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다', 
4, 'dog04.jpg', '','2020/06/28', 0, 'REVIEW_BOARD');
insert into REVIEW_BOARD
values(5, 9, 'asdasd@naver.com', 'asd111', '2따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다', 
3.5, 'dog05.jpg', '','2020/07/04', 0, 'REVIEW_BOARD');
    
commit;
