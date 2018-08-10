CREATE TABLE `tbl_dept` (
`dept_id` INT ( 11 ) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
`dept_name` VARCHAR ( 255 ) DEFAULT NULL COMMENT '部门名字',
`dept_leader` VARCHAR ( 255 ) DEFAULT NULL COMMENT '部门领导',
PRIMARY KEY ( `dept_id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8
CREATE TABLE `tbl_emp` (
`emp_id` INT ( 11 ) NOT NULL AUTO_INCREMENT COMMENT '职员id',
`emp_name` VARCHAR ( 255 ) NOT NULL COMMENT '职员姓名',
`emp_email` VARCHAR ( 255 ) NOT NULL COMMENT '职员邮箱',
`gender` VARCHAR ( 10 ) NOT NULL COMMENT '性别',
`department_id` INT ( 11 ) NOT NULL COMMENT '部门外键',
PRIMARY KEY ( `emp_id` ),
KEY `department_id` ( `department_id` ),
CONSTRAINT `department_id` FOREIGN KEY ( `department_id` ) REFERENCES `tbl_dept` ( `dept_id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;
CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into tbl_dept (dept_name , dept_leader ) values( "人力资源部","张三");
insert into tbl_dept (dept_name , dept_leader ) values( "人事部","李四");
insert into tbl_dept (dept_name , dept_leader ) values( "战略企划部","王五");
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("王东","253@12345","男",1);
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("王东北","253@123456","女",2);
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("王西","253@1234567","女",3);
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("王西男","253@1234567","男",1);
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("张东","253@1234567","男",2);
insert into tbl_emp (emp_name , emp_email , gender,department_id ) values ("张上","253@12ww567","女",3);
INSERT INTO `management`.`administrator`(`name`, `password`) VALUES ('wang', 'wang');