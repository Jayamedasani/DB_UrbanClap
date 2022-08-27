create database urbanclaporg;
use urbanclaporg;
create table service_category(
	id int not null,
    name varchar(40) unique,
    primary key(id));
create table service(
	id int not null,
    name varchar(40) not null,
    category_id int,
    unique(name,category_id),
    cost int,
    primary key(id),
    foreign key(category_id) references service_category(id));
create table user(
	id int not null,
    name varchar(40),
    email varchar(40) unique,
    phnno varchar(20),
    age int,
    primary key(id));
create table country(
	id int not null,
    name varchar(40) unique,
    primary key(id));
create table state(
	id int not null,
	name varchar(40),
    country_id int not null,
    unique(country_id,name),
    primary key(id),
    foreign key(country_id) references country(id) );
create table city(
	id int not null,
    name varchar(40),
    state_id int not null,
    unique(state_id,name),
    primary key(id),
    foreign key(state_id) references state(id) );
create table address(
	id int not null,
    user_id int not null,
    house_no varchar(10),
    street varchar(40),
    city_id int,
    pincode int,
    primary key(id),
    foreign key(user_id) references user(id),
	foreign key(city_id) references city(id),
    unique(user_id,house_no));
create table order_service(
	id int not null,
    service_id int not null,
    quantity int,
    primary key(id,service_id),
    foreign key(service_id) references service(id));
create table booking(
	id int not null,
    order_service_id int not null unique,
    user_id int not null,
    address_id int not null,
    primary key(id),
    foreign key(user_id) references user(id),
    foreign key(order_service_id) references order_service(id),
    foreign key(address_id) references address(id));
create table professional_category(
	id int not null,
    name varchar(30),
    primary key(id));
create table user_professional_category(
    user_id int not null,
    professional_category_id int not null,
    primary key(user_id),
    foreign key(user_id) references user(id),
    foreign key(professional_category_id) references professional_category(id));
create table professional(
	id int not null,
    name varchar(40),
    service_id int,
    professional_category_id int,
    rating int,
    is_available boolean,
    primary key(id),
    foreign key(service_id) references service(id),
    foreign key(professional_category_id) references professional_category(id));
create table payment_mode(
	id int not null,
    name varchar(30),
    primary key(id));
create table payment_status(
	id int not null,
    name varchar(30) not null unique,
    primary key(id));
create table payment(
	id int not null,
    booking_id int not null unique,
    cost int,
    payment_mode_id int,
    processed_time time,
    payment_status_id int not null,
    primary key(id),
    foreign key(booking_id) references booking(id),
    foreign key(payment_mode_id) references payment_mode(id),
    foreign key(payment_status_id) references payment_status(id));
create table appointment(
	id int not null,
    payment_id int not null,
    professional_id int,
    appointment_date date,
    appointment_start_time time,
    appointment_end_time time,
    appointment_pin int,
    primary key(id),
    foreign key(payment_id) references payment(id),
    foreign key(professional_id) references professional(id));
create table issuecenter(
	id int not null,
    reachout_way varchar(30) unique,
    reachout_value varchar(30),
    primary key(id));
create table issue_status(
	id int not null,
    status varchar(30) unique not null,
    primary key(id));
create table user_issue(
	id int not null,
    user_id int not null,
    issuecenter_id int,
    status_id int,
    primary key(id),
    foreign key(user_id) references user(id),
    foreign key(issuecenter_id) references issuecenter(id),
    foreign key(status_id) references issue_status(id));
insert into service_category values(1,'Personal');
insert into service_category values(2,'Home');
insert into service values(1,'Hair wash',1,500);
insert into service values(2,'Massage',1,2500);
insert into service values(3,'AC repair',2,400);
insert into service values(4,'Facial',1,1500);
insert into service values(5,'cleaning',2,5000);
insert into user values(1,'jaya','jaya@gmail.com','999999999',21);
insert into user values(2,'anu','anu@gmail.com','9999988999',25);
insert into user values(3,'madhu','madhu@gmail.com','977999999',30);
insert into user values(4,'suresh','suresh@gmail.com','966999999',35);
insert into user values(5,'anil','anil@gmail.com','999559999',28);
insert into country values(1,'India');
insert into country values(2,'Indonesia');
insert into country values(3,'USA');
insert into country values(4,'China');
insert into country values(5,'Korea');
insert into state values(1,'ts',1);
insert into state values(2,'ap',1);
insert into state values(3,'kerela',2);
insert into state values(4,'tamilnadu',2);
insert into state values(5,'bihar',3);
insert into city values(1,'ypm',1);
insert into city values(2,'knc',1);
insert into city values(3,'kmr',2);
insert into city values(4,'nzd',3);
insert into city values(5,'vjw',4);
insert into address values(1,1,'1-7-1','highschool',1,507201);
insert into address values(2,1,'1-7-2','highschool',1,507201);
insert into address values(3,2,'1-7-3','highschool',3,507201);
insert into address values(4,3,'1-7-4','highschool',2,507201);
insert into address values(5,4,'1-7-5','highschool',5,507201);
insert into order_service values(1,1,1);
insert into order_service values(1,2,1);
insert into order_service values(2,3,2);
insert into order_service values(3,1,3);
insert into order_service values(3,4,1);
insert into booking values(1,1,1,1);
insert into booking values(2,2,2,2);
insert into booking values(3,3,3,3);
insert into booking values(4,4,2,4);
insert into booking values(5,5,4,5);
insert into professional_category values(1,'economic');
insert into professional_category values(2,'medium');
insert into professional_category values(3,'expert');
insert into user_professional_category values(1,1);
insert into user_professional_category values(2,1);
insert into user_professional_category values(3,2);
insert into user_professional_category values(4,3);
insert into user_professional_category values(5,2);
insert into professional values(1,'ajay',1,2,4,true);
insert into professional values(2,'aman',3,3,5,false);
insert into professional values(3,'vani',2,2,3,true);
insert into professional values(4,'anuskha',4,1,4,true);
insert into professional values(5,'hasini',1,2,5,false);
insert into payment_mode values(1,'COD');
insert into payment_mode values(2,'Net banking');
insert into payment_mode values(3,'UPI');
insert into payment_mode values(4,'credit card');
insert into payment_mode values(5,'debit card');
insert into payment_status values(1,'Completed');
insert into payment_status values(2,'Cancelled');
insert into payment_status values(3,'processing');
insert into payment_status values(4,'initialised');
insert into payment values(1,1,5000,1,'11:27:30',1);
insert into payment values(2,2,5040,2,'15:25:00',2);
insert into payment values(3,3,1000,3,'19:47:50',1);
insert into appointment values(1,1,1,'2022-08-12','20:06:11','21:06:11',3456);
insert into appointment values(2,2,1,'2022-09-12','20:06:11','20:06:11',4354);
insert into appointment values(3,2,2,'2022-08-12','20:06:11','20:06:11',2873);
insert into appointment values(4,3,2,'2022-09-12','20:06:11','20:06:11',7435);
insert into appointment values(5,2,3,'2022-08-12','20:06:11','20:06:11',1635);
insert into issuecenter values(1,'chat','999876735');
insert into issuecenter values(2,'call','999876735');
insert into issuecenter values(3,'email','chat@gmail.com');
insert into issue_status values(1,'solved');
insert into issue_status values(2,'pending');
insert into issue_status values(3,'raised');
insert into issue_status values(4,'cancelled');
insert into issue_status values(5,'checking');
insert into user_issue values(1,1,1,2);
insert into user_issue values(2,1,2,4);
insert into user_issue values(3,2,1,3);
insert into user_issue values(4,3,3,5);
insert into user_issue values(5,4,1,1);