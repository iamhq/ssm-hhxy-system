create table t_super(
	super_id INT primary key NOT NULL,
	super_name VARCHAR(255) NOT NULL,
	super_password VARCHAR(255) NOT NULL

);
insert into t_super values(10548, '超级管理员', 'root');

create table t_department(
	department_id INT(9) primary key NOT NULL AUTO_INCREMENT,
	department_name VARCHAR(255) NOT NULL
)ENGINE=InnoDB AUTO_INCREMENT=1054801 DEFAULT CHARSET=utf8;

insert into t_department values(null,'马克思学院');
insert into t_department values(null,'计算机学院');
insert into t_department values(null,'体育学院');
insert into t_department values(null,'美术学院');
insert into t_department values(null,'经济学院');
insert into t_department values(null,'风景园林学院');
insert into t_department values(null,'商学院');

create table t_manager(
	manager_id INT(9) primary key NOT NULL AUTO_INCREMENT,
	manager_name VARCHAR(255) NOT NULL,
	manager_department_id INT(7) NOT NULL,
	manager_password VARCHAR(255) NOT NULL,
	foreign key (`manager_department_id`) references `t_department`(`department_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1054801 DEFAULT CHARSET=utf8;

insert into t_manager(`manager_name`,`manager_department_id`,`manager_password`) values('彭小宁',1054801, 'root');
insert into t_manager values(null,'李伟迪', 1054802, 'root');
insert into t_manager values(null,'彭庆文', 1054803, 'root');
insert into t_manager values(null,'李昀蹊', 1054804, 'root');
insert into t_manager values(null,'舒晓惠', 1054805, 'root');
insert into t_manager values(null,'皮建辉', 1054806, 'root');
insert into t_manager values(null,'唐德彪', 1054807, 'root');

create table salary_record(
	record_id INT(9) primary key NOT NULL AUTO_INCREMENT,
	teacher_id INT(9) NOT NULL,
	teacher_name VARCHAR(255) NOT NULL,
	datetime DATETIME NOT NULL,
	paid VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into salary_record values(null, 54801, '张显', '2018-05-01', '6000');
insert into salary_record values(null, 54801, '张显', '2018-04-01', '6000');

create table t_teacher(
	teacher_id INT(9) primary key NOT NULL,
	teacher_name VARCHAR(255) NOT NULL,
	manager_department_id INT(7) NOT NULL,
	teacher_password VARCHAR(255) NOT NULL,
	teacher_salary VARCHAR(255) NOT NULL,
	foreign key (`manager_department_id`) references `t_department`(`department_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_manager values(54801,'张显', 1054802, 'root');


--create table `mybatis`.`t_customer`(
-- `id` INT  primary key auto_increment,
-- `username` VARCHAR(50),
-- `jobs` VARCHAR(50),
-- `phone` VARCHAR(16)
-- );
-- 
-- insert into t_customer values(1, '白展堂', '死跑堂的', '110');
--drop table salary_record;
