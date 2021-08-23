# README

# CN Assignment

Code is written in simple Tech Stack using Ruby on Rails with Rails as a framework and Ruby as a coding language. Mysql database is used for data storage.
To  run the code, please follow following setup procedure in ubuntu environment to complete the setup

- pull the repo
- install rvm, ruby, nodemodules through comand line
- Code runs best in Ruby version ruby-2.5.0
- Run gem install bundler for dependency manager
- Run bundle install - to install all the dependencies
- run rails server using rails server command
- The code would run on http://localhost:3000/ 
- Start Raising Doubt

## Tech

- [HTML] - HTML used to render web page
- [CSS] - Minified CSS for enhanced design view and styling of elements.
- [Javascript] - For UI framework.
- [Ruby on Rails] - for backend server specific module.
- [MVC] - code done following MVC structure on custom framework

## Installation

Assignment Requires Ruby on rails installation and runs best with Google Chrome Version of ubuntu operating system. Installation steps are mentioned above to run the code in localhost:3030 default port.This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database connection in database.yml file for configuration

* Database initialization

* Run Below Create Table Queries to run the code successfully. Not done migrations.

* CREATE TABLE `doubts` (  
  `id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL DEFAULT '',
  `description` TEXT DEFAULT NULL,
  `raised_by` BIGINT(10) NOT NULL DEFAULT 0,
  `answer_by` BIGINT(10) NOT NULL DEFAULT 0,
  `answer` TEXT DEFAULT NULL,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0=> active, 1=>inactive',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idx_title` (`title`),
  KEY `idx_doubt_user_id` (`raised_by`) ,
  KEY `idx_answer_user_id`(`answer_by`)
);

CREATE TABLE `login_users` (  
  `id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL DEFAULT '',
  `email`  VARCHAR(100) NOT NULL DEFAULT '',
  `deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0=> active, 1=>inactive',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idx_usr_login_email` (`email`)
);

CREATE TABLE `comments` (  
  `id` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT(10) NOT NULL DEFAULT 0,
  `comment`  TEXT DEFAULT NULL,
  `comment_by` BIGINT(10) NOT NULL DEFAULT 0,
  `deleted` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0=> active, 1=>inactive',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) 
);