create database utimes character set utf8;
CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `memo` text,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE school (
	`id` int primary key AUTO_INCREMENT,
	`NAME` VARCHAR(128) DEFAULT NULL,
	`LOCATION` VARCHAR(128) DEFAULT NULL,
	`SINCE` DATE DEFAULT NULL,
	`INTRODUCE` TEXT,
	`multiarea` int
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `course` (
	`id` int(11) not null auto_increment,
	`name` varchar(128) default null,
	`area_id` int(11),
	primary key (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

create Table schoolarea (
	`id`	int(11) not null auto_increment,
	`name`	varchar(128) not null,
	`location` text,
	`school_id` int(11),
	primary key (`id`)
)

/*
 * Length: minutes
 * */
CREATE TABLE COURSEDETAIL
(
	`id`	int(11) not null auto_increment,
	`content`	varchar(128),
	`length`	int(11),
	`course_id`	int(11),
	primary key (`id`)
)
