create database utimes character set utf8;
use utimes;
drop table register;
drop table user;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `memo` text,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `flag`    int default 0
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

drop table school;
CREATE TABLE school (
	`id` int primary key AUTO_INCREMENT,
	`NAME` VARCHAR(128) DEFAULT NULL,
	`LOCATION` VARCHAR(128) DEFAULT NULL,
	`SINCE` DATE DEFAULT NULL,
	`INTRODUCE` TEXT,
	`multiarea` int
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

drop table course;
CREATE TABLE `course` (
	`id` int(11) not null auto_increment,
	`name` varchar(128) default null,
	`moneyrate` decimal(11,2) default 0,
	`memo` text,
	`area_id` int(11),
	`flag` int(11) default 0,
	primary key (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

drop table schoolarea;
create Table schoolarea (
	`id`	int(11) not null auto_increment,
	`name`	varchar(128) not null,
	`location` text,
	`school_id` int(11),
	`memo` text,
	`flag` int(11) default 0,
	primary key (`id`)
);

/*
  type: 1: per 4 weeks, the real value should multiplex, 0: no other operation
  paytype: 0: before 1: after
*/
drop table schooltuitionitems;
create table schooltuitionitems(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` int(11) DEFAULT '0',
  `money` decimal(12,2) DEFAULT '0.00',
  `schoolarea_id` int(11) DEFAULT NULL,
  `memo` text,
  `school_id` int(11) DEFAULT NULL,
  `paytype` int(11) DEFAULT '0',
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
);

/*
 * Length: minutes
 * */
drop table coursedetail;
CREATE TABLE COURSEDETAIL
(
	`id`	int(11) not null auto_increment,
	`content`	varchar(128),
	`length`	int(11),
	`course_id`	int(11),
	primary key (`id`)
);

/*
* administrators table
*/
drop table admin;
CREATE TABLE `admin` (
  `USER_ID` int(10) unsigned NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table admin_roles;

CREATE TABLE `admin_roles` (
  `USER_ROLE_ID` int(10) unsigned NOT NULL,
  `USER_ID` int(10) unsigned NOT NULL,
  `AUTHORITY` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FK_user_roles` (`USER_ID`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`USER_ID`) REFERENCES `admin` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into admin values(100,'claire','utimesbest',1);
insert into admin_roles values(1,100,'ROLE_ADMIN');

/* 2014.2.12 add flag to delete school
*/
alter table school add flag int default 1;