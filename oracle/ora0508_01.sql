select * from employees;

select rownum,emp_name,manager_id from employees;



-- 테이블 사용가능
( select * from employees order by emp_name );

select rownum,a.* from employees a
order by emp_name;

select rownum,a.* from
(select * from employees order by emp_name) a;


- 이름에 a가 들어가 있으면서, 월급이 4800 이상이면서 , manager_id가 103
select * from (select * from employees where emp_name like '%a%')
where salary>=4800 and manager_id=103
;

select * from employees
where salary>=4800 and manager_id=103
;


rownum 순차적인 번호를 매기는 함수
select rownum,a.* from member a
order by id
;

-- 순차적인 번호를 다시 매겨서 출력하시오.
select * from (
select rownum rnum,a.* from (
select * from member order by id) a
) b
where rnum between 11 and 20
;

--
select * from (select rownum rnum,a.* from member a )
where rnum between 51 and 100;


select row_number() over(order by id asc) rnum,a.*
from member a;

select rownum rnum,a.* from (select * from member order by id asc) a;


select * from stuscore;

select rank() over(order by total desc),total from stuscore;
select dense_rank() over(order by total desc),total from stuscore;

---

select * from stuscore;

update stuscore set rank=0, sgrade='F';
commit;

-- rank, sgrade 값에 맞게 입력하시오.
rank() over()
sgrade non-equi join을 해서 해당되는 값을 입력하시오. 
- scoregrade테이블 사용

select sno,rank() over(order by total desc),total,avg,rank,sgrade from stuscore;

select rank() over(order by total desc) ranks from stuscore;

update stuscore a set rank=(    
select ranks from 
(select sno,rank() over(order by total desc) ranks from stuscore) b
where a.sno = b.sno
);

non-equi join 조인을 해야 함
stuscore,scoregrade 

select * from scoregrade;

desc scoregrade;

select * from stuscore;
update stuscore a set rank=(    
select ranks from 
(select sno,rank() over(order by total desc) ranks from stuscore) b
where a.sno = b.sno
);

update stuscore a set rank=(    
select ranks from 
(select sno,rank() over(order by total desc) ranks from stuscore) b
where a.sno = b.sno
);

update stuscore a set sgrade=(
select grade from 
(select sno,grade from stuscore,scoregrade where avg between minscore and maxscore ) b
where a.sno = b.sno
);

select sno,grade from stuscore,scoregrade
where avg between minscore and maxscore;
 
select mdate,to_number(substr(mdate,4,2)) from member
where to_number(substr(mdate,4,2)) not between 3 and 8;

select mdate,to_number(substr(mdate,4,2)) from member
where to_number(substr(mdate,4,2)) not in (3,4,5,6,7,8);


select mdate,substr(mdate,4,2) from member
where substr(mdate,4,2) between '03' and '08';

03~08월까지 출력하시오.

뒤에 있는 3글자를 출력하시오.
select emp_name from employees;

select emp_name,substr(emp_name,1,3),substr(emp_name,-3) from employees;



select '   aaa bbb ccc   ' from dual;
앞뒤 공백제거
select trim('   aaa bbb ccc   ') from dual;

replace 특정문자 변경
select replace('   aaa bbb ccc   ',' ','') from dual;

select replace(emp_name,' ','') from employees;

select phone_number from employees;

select lpad(phone_number) from employees;

desc employees;

char(13) 자리
select rpad(phone,17,'*') from member;

desc member;

전화번호 뒤4자리를 ****출력하시오.

select rpad(substr(phone,1,8),12,'*') from member;

뒤에 1글자를 *로 표시해서 출력하시오.
select name from member;
select name,length(name),rpad(substr(name,1,length(name)-2),length(name)+1,'*') from member;

뒤2글자 *표시 하시오.
select emp_name from employees;
select id from member;

select id,length(id),rpad(substr(id,1,length(id)-2),length(id),'*') from member;

id 모두를 *표시 하시오.
select id,rpad(substr(pw,1,length(pw)-2),length(pw),'*') from member;

select id,rpad(substr(id,-1),length(id),'*') from member;

select id,rpad('*',length(id),'*') from member;



952-***-6953 phone 컬럼을 출력하시오.
select phone from member;

select substr(phone,1,4)||'***-'||substr(phone,9,4) from member;

그달의 첫번째 일, 마지막 일을 출력하시오.
select trunc(mdate,'mm'),mdate,last_day(mdate) from member;

-- 날짜 형태 
yyyy-mm-dd hh:mi:ss 형태로 변경하시오. 24시간으로 표시
select to_char(mdate,'yyyy-mm-dd hh24:mi:ss') from member;

select emp_name, department_id from employees;
select emp_name,department_id,
decode
(department_id,
10,'총무기획부',
20,'마케팅부서',
30,'구매/생산부'
) as depart_name
from employees;

월을 비교해서 decode를 활용하여 계절을 출력하시오.
select mdate from member;
12,1,2 -> 겨울,
3,4,5 -> 봄
6,7,8 -> 여름
9,10,11 -> 가을

select mdate,substr(mdate,4,2),
decode(substr(mdate,4,2),
'01','겨울',
'02','겨울',
'03','봄',
'04','봄',
'05','봄',
'06','여름',
'07','여름',
'08','여름',
'09','가을',
'10','가을',
'11','가을',
'12','겨울'
) season
from member;


select mdate,substr(mdate,4,2),
case 
when substr(mdate,4,2) in ('12','01','02') then '겨울'
when substr(mdate,4,2) in ('03','04','05') then '봄'
when substr(mdate,4,2) in ('06','07','08') then '여름'
when substr(mdate,4,2) in ('09','10','11') then '가을'
end season
from member;

select * from departments;


select avg from stuscore;

90점이상이면 VVIP, 80점 VIP, 70점 GOLD, 60점 SILVER, 그외 BRONE
select avg,
case 
when avg>=90 then 'VVIP'
when avg>=80 then 'VIP'
when avg>=70 then 'gold'
when avg>=60 then 'silver'
when avg<60 then 'brone'
end rank
from stuscore;

그룹함수의 조건문 입력하는 부분 : having
select department_id, avg(salary) from employees
where department_id<50 
group by department_id
having avg(salary)>5000
;

부서이름을 출력하시오.

select emp_name,department_id,salary from employees 
where salary in ( 
select max(salary) from employees
group by department_id
)
;

select employee_id,emp_name,a.department_id,department_name,salary from employees a ,departments c
where salary in ( 
select max(salary) from employees b
where a.department_id = b.department_id
group by department_id
) and a.department_id = c.department_id
;



select department_id,max(salary) from employees
group by department_id;


select * from stuscore;

alter table stuscore add sclass number(2) default 0;


1-10까지 1
11-20까지 2

--
select * from stuscore;

update stuscore set sclass=
case
when sno between 1 and 10 then 1
when sno between 11 and 20 then 2
when sno between 21 and 30 then 3
when sno between 31 and 40 then 4
when sno between 41 and 50 then 5
when sno between 51 and 60 then 6
when sno between 61 and 70 then 7
when sno between 71 and 80 then 8
when sno between 81 and 90 then 9
when sno between 91 and 100 then 10
else 11
end
;

update stuscore a set sclass = (
select rnum from(
select rownum rnum,sno from stuscore
) b
where a.sno=b.sno
);

select * from stuscore;

--
select max(total) maxtotal from stuscore b
group by sclass ;

sclass 반별로 가장 성적이 높은 학생들을 출력하시오.
--
select sno,total,sclass from stuscore a
where total in (
select max(total) maxtotal from stuscore b
where a.sclass = b.sclass
 group by sclass 
) 
;

select sno,total,sclass from stuscore a
where total in (
select max(total) maxtotal from stuscore b
 group by sclass 
) ;



select employee_id,emp_name,a.department_id,department_name,salary from employees a ,departments c
where salary in ( 
select max(salary) from employees b
where a.department_id = b.department_id
group by department_id
) and a.department_id = c.department_id
;

-- 부서별 가장 월급이 높은 사원출력
select emp_name,salary,a.department_id,department_name from employees a,departments c
where salary in (
select max(salary) from employees b
where a.department_id = b.department_id
group by department_id
) and a.department_id = c.department_id
;


sclass 반별로 가장 성적이 낮은 학생들을 출력하시오.



alter table stuscore modify sclass number(3);

select sno,total,avg,sclass,
case
when sno between 1 and 10 then 1
when sno between 11 and 20 then 2
when sno between 21 and 30 then 3
when sno between 31 and 40 then 4
when sno between 41 and 50 then 5
when sno between 51 and 60 then 6
when sno between 61 and 70 then 7
when sno between 71 and 80 then 8
when sno between 81 and 90 then 9
when sno between 91 and 100 then 10
when sno between 100 and 110 then 11
end  as ssclass
from stuscore;

-- 각반의 1등을 출력하시오.

-- 각반의 최하등수를 출력하시오.

부서 12개
select distinct department_id from employees
order by department_id;

부서 27개
select department_id from departments;

employees 없는 부서를 출력하시오.
select department_id,department_name from departments a
where not exists
(select * from employees b where a.department_id = b.department_id)
;

-- 
member테이블에 이름이 존재하는 stuscore 학생성적을 출력하시오.

select * from stuscore a
where not exists
( select * from member b where a.name = b.name);



select * from employees
where (department_id,salary) in 
(select department_id,max(salary) from employees group by department_id)
;

create table stuscore3 as select * from stuscore;
테이블 생성 및 데이터 복사

create table stuscore3 as select * from stuscore where 1=2;
테이블 생성만 됨.

drop table stuscore2;

drop table stuscore3;

create table stuscore2 as select * from stuscore;


select * from stuscore2;

update stuscore2 set sclass = 0;
commit;





