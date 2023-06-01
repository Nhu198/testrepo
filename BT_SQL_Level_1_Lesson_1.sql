#Tính tuổi của từng sinh viên

select name, year(curdate())-year(birth_date) as Age
from student s 
group by NAME 

select 
	name,
	timestampdiff(year,birth_date,curdate()) as Age
from student s 
group by name

#Tính tổng sinh viên theo giới tính

select gender, count(STUDENT_ID) as Tongsv
from student s 
group by GENDER 

#Tính tổng tuổi của sv theo từng class id 

select Class_ID, SUM(timestampdiff(year,birth_date,curdate())) as Sum_Age
from student
group by CLASS_ID

#Tính tuổi trung bình của sinh viên theo từng class

select class_id, avg(timestampdiff(year,birth_date,curdate())) as AVG_AGE
from student s 
group by CLASS_ID 


#Tính tổng sinh viên theo từng độ tuổi

select timestampdiff(year,birth_date,curdate()) as Age, count(student_id) as Count_Student
from student s 
group by Age

#Tìm lớp có tuổi trung bình sinh viên lớn nhất

select class_id, avg(timestampdiff(year,birth_date,curdate())) as AVG_AGE
from student s 
group by CLASS_ID 
order by AVG_AGE desc 
limit 1

#Đếm tổng sv theo từng lớp và chỉ trả về lớp có 3 sv trở lên

select class_id, count(student_id) as count_student
from student s 
group by CLASS_ID 
having count_student>=3

#Tính tổng số tuổi của sv theo từng lớp và chỉ tính tuổi của sinh viên nữ có tên đệm là "Thị"

select class_id, sum(timestampdiff(year,birth_date,curdate())) as Sum_Age
from student s 
where NAME like "%Thị%" and GENDER = "Female"
group by CLASS_ID 