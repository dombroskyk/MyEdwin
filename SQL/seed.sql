if object_id('recipe') is not null
	drop table recipes;

if object_id('myedwin_user') is not null
	drop table users;

create table myedwin_user
(
	uid int not null identity(1,1) primary key,
	fname varchar(64),
	lname varchar(64),
	mi varchar(1),
	encrypted_pass varchar(255),
	salt varchar(255)
);

create table recipe
(
	recipe_id int NOT NULL identity(1,1) PRIMARY KEY,
	name varchar(200) not null,
	descr varchar(200),
	author varchar(64),
	rating decimal(16,2) not null default 0,
	is_private int not null default 0,
	created_by int not null default 0 FOREIGN KEY REFERENCES myedwin_user(uid)
);

create table ingredient
(
	ingredient_id int NOT NULL identity(1,1) PRIMARY KEY,
	name varchar(200) not null default ''

);

--unit of measure for ingredients
create table ingredient_measurement
(
	ingredient_measurement_id int not null identity(1,1) PRIMARY KEY,
	descr varchar(30)
);

--ingredients within recipe
create table recipe_ingredient_list
(
	recipe_ingredient_id int not null identity(1,1) PRIMARY KEY,
	recipe_id int not null foreign key references recipe(recipe_id),
	ingredient_id int not null foreign key references ingredient(ingredient_id),
	--more
)


insert into myedwin_user (fname, lname, mi, encrypted_pass, salt) values ('Kevin', 'D', '', 'foo', 'bar');

insert into recipe (name,descr,author,rating,is_private, created_by) values ('test soup', 'so soupy', 'KD', 5.0, 1, 1);