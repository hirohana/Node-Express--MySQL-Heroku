-- -- # database myportfolio作成
-- CREATE DATABASE myportfolio;

-- # usersのテーブル作成
CREATE TABLE users(id int not null auto_increment primary key, 
username varchar(32) not null, email varchar(64) not null, password varchar(255) not null, 
profile varchar(255), photo_url text not null, created_at datetime not null, lock_status datetime);

-- # articlesのテーブル作成
CREATE TABLE articles(id int not null auto_increment primary key, user_id int not null,
title varchar(32) not null, letter_body text not null, created_at datetime not null, 
public tinyint not null, article_id_storage varchar(255), file_names text, images_url text);

-- # users_login_historyのテーブル作成
CREATE TABLE users_login_history(id int not null auto_increment primary key, user_id int not null, 
login_status tinyint not null, login datetime not null);

-- # categoryのテーブル作成
CREATE TABLE category(id int not null auto_increment primary key, 
name varchar(32) not null);
-- # categoryのデータ挿入
INSERT INTO category(name) 
  VALUES
  ("Windows"),
  ("Mac"),
  ("Linux"),
  ("VisualStudioCode"),
  ("Html"),
  ("Css"),
  ("Scss"),
  ("JavaScript"),
  ("TypeScript"),
  ("React"),
  ("Redux"),
  ("Next.js"),
  ("Node.js"),
  ("Express"),
  ("Go"),
  ("Java"),
  ("Sql"),
  ("MySql"),
  ("Mongo"),
  ("Git"),
  ("GitHub"),
  ("Docker"),
  ("Babel"),
  ("Webpack"),
  ("ESlint"),
  ("Prettier"),
  ("Firebase"),
  ("Heroku"),
  ("Aws"),
  ("Netlify");

-- # articles_categoryテーブルの作成
CREATE TABLE articles_category(id int not null auto_increment primary key, 
articles_id int not null, category_id int not null);

-- # articles_commentsテーブルの作成
CREATE TABLE articles_comments(id int not null auto_increment primary key, article_id int not null, 
user_id int not null, comment text not null, created_at datetime not null);

-- # draftArticlesのテーブル作成
CREATE TABLE draft_articles(id int not null auto_increment primary key, user_id int not null,
title varchar(32) not null, letter_body text, photo_url varchar(255), 
created_at datetime not null);

