use cfbank;

create table customer(

customer_ID int not null auto_increment primary key,
cust_first_name varchar(45) not null,
cust_last_name varchar(45) not null,
address varchar(60) not null,
city varchar(45) not null,
state varchar(45) not null,
zipcode varchar(10) not null,
email_address varchar (45) null unique,
cell_phone_number varchar(15) not null);

insert into customer(customer_ID,cust_first_name,cust_last_name,address,city,state,
zipcode,email_address,cell_phone_number)values
(1,"Eric","Cartman","210 East 10th st","South Park","CO","80440","mj@yahoo.com","719-362-5886"),
(2,"Kenny","McCormick","220 East 10th st","South Park","CO","80440","kcc@gmail.com","719-855-9632"),
(3,"Kyle","Broflosky","230 East 10th st","South Park","CO","80440","kb@gmail.com","719-369-2544"),
(4,"Stan","Marsh","200 East 10th st","South Park","CO","80440","sm@yahoo.com","719-477-8955"),
(5,"Token","Black","175 E spring st","South Park","CO","80440","tb@yahoo.com","719-655-9877"),
(6,"Wendy","Testaburger","236 E spring st","South Park","CO","80440","wt@gmail.com","719-125-4566"),
(7,"Peter","Griffin","10 River st","Yonkers","NY","10701","pg@outlook.com","914-445-2111"),
(8,"Meg","Griffin","10 River st","Yonkers","NY","10701","mg@outlook.com","914-586-3347"),
(9,"Linda","Belcher","10 West Palm beach","Miami","FL","33132","lb@aol.com","305-990-0122"),
(10,"Galye","Frond","2550 West Palm beach","Miami","FL","33132","","786-789-4561"),
(11,"Bart","Simpson","1500 Broadway","Yonkers","NY","10702","bb@gmail.com","718-584-6933"),
(12,"Lisa","Simpson","1500 Broadway","Yonkers","NY","10702","jazzlife@gmail.com","917-684-6003"),
(13,"Tami","Larson","1500 halaliva","Miami","FL","33132","tami1@gmail.com","305-184-6933"),
(14,"Dr","Yap","2590 West Palm beach","Miami","FL","33132","yaptrap@aol.com","786-254-6322"),
(15,"Mickey","Slammer","1500 long view","Miami","FL","33402","robbank@aol.com","786-104-9822"),
(16,"Kim","Possible","10 Maple drive","Santa monica","CA","90211","kimp@gmail.com","973-744-1022"),
(17,"Ron","Ton","1470 Maple drive","Santa monica","CA","90211","ronton@gmail.com","973-810-7802"),
(18,"Ron","Jeremy","10 Maple drive","Santa monica","CA","90211","ronjery@gmail.com","973-580-3655"),
(19,"Dr","Evil","10 Maple drive","Santa monica","CA","90211","evildr@gmail.com","973-810-7802");



create table accounts(
account_ID int not null auto_increment primary key,
account_number varchar(45) not null,
balance int not null,
customer_ID int not null,
category varchar (45) not null,
foreign key(customer_ID) references customer(customer_ID) on delete cascade
on update cascade);

insert into accounts(account_ID,account_number,balance,customer_ID,category) values
(1,"9104-3652-1244-3666",5000,1,"Checking"),
(2,"9104-3652-1244-3670",10000,1,"Saving"),
(3,"9104-3652--1244-3667",400,2,"Checking"),
(4,"9105-0366-9855-6214",500,3,"Checking"),
(5,"9104-3652-1244-3672",15000,3,"Saving"),
(6,"9106-1566-1423-3698",300,4,"Checking"),
(7,"9110-1234-5678-0909",6000,5,"Checking"),
(8,"9111-4578-3695-5430",12500,9,"Saving"),
(9,"9111-4578-3695-5419",900.5,10,"Checking"),
(10,"9110-1234-5678-0911",250000,7,"Checking"),
(11,"9111-4578-3695-5422",200,8,"Checking"),
(12,"9111-4578-3695-5418",1500,8,"Saving"),
(13,"9001-1478-2536-9031",450000,13,"Checking"),
(14,"9002-5846-2513-5845",15,13,"Saving"),
(15,"9002-5846-2513-5033",15.35,10,"Saving"),
(16,"9111-4578-3695-5417",800,9,"Checking"),
(17,"9111-4578-3695-5412",1000,12,"Checking"),
(18,"9111-4578-3695-5413",250,11,"Saving"),
(19,"9111-4578-3695-5414",8000,6,"Checking");


create table branch(
branch_ID varchar (45) not null primary key,
branch_name varchar(45) not null,
address varchar(100) not null,
city varchar(45) not null,
state varchar(25) not null,
zipcode varchar(10) not null,
office_number varchar(15) not null);

insert into branch(branch_ID,branch_name,address,city,state,zipcode,office_number) values
("CA1","CF Bank","10 River","Santa Monica","CA","90201","973-258-5866"),
("CO1","CF Bank","1500 Alma junction","South Park","CO","80040","719-658-0000"),
("MI1","CF Bank","10 West Palm Beach","Miami","FL","33132","305-444-4477"),
("NY1","CF Bank","30 Broadway","New York","NY","10003","914-358-4755"),
("NY2","CF Bank","100 River Ave","Yonkers","NY","10701","718-333-5000");

create table loan(
loan_number varchar(45) not null primary key,
amount int(15) not null,
customer_ID int not null,
branch_ID varchar(3) not null,
foreign key(customer_ID) references customer(customer_ID) on delete cascade
on update cascade,
foreign key(branch_ID) references branch(branch_ID) on delete cascade
on update cascade);

insert into loan(loan_number, amount, customer_ID, branch_ID) values
("191-250-456-331-2100",25000,7,"MI1"),
("191-250-456-331-4446",5000,7,"MI1"),
("191-458-459-331-2102",100000,9,"NY2"),
("191-458-459-321-0112",1500,4,"CO1"),
("191-458-459-321-6899",5000,8,"NY2"),
("191-458-459-621-4569",1000,3,"CO1"),
("191-458-459-721-1000",15000,2,"CO1"),
("191-458-459-999-6900",5000,10,"NY2"),
("456-191-457-400-5555",45000,10,"MI1"),
("456-191-457-401-7777",1000000,1,"CO1");



CREATE TABLE banker (
    banker_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email_address VARCHAR(45) NOT NULL unique,
    customer_ID INT NOT NULL,
    branch_ID VARCHAR(45) NOT NULL,
    FOREIGN KEY (customer_ID)
        REFERENCES customer(customer_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (branch_ID)
        REFERENCES branch (branch_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

insert into banker(banker_ID, first_name,Last_name, email_address,customer_ID,branch_ID) values
(1,"Francine","Smith","fs@cfbank.com",9,"NY1"),
(2,"Stan","Smith","ss@cfbank.com",1,"CO1"),
(3,"Avery","Bullock","av@cfbank.com",8,"NY2"),
(4,"Klaus","Helser","kh@cfbank.com",5,"NY1"),
(5,"Homer","Simpson","hs@cfbank.com",2,"CO1"),
(6,"Ned","Flanders","nf@cfbank.com",3,"CO1"),
(7,"Louis","Belcher","lb@cfbank.com",7,"MI1"),
(8,"Andy","Pesto","ap@cfbank.com",10,"MI1"),
(9,"Timmy","Tim","tt@cfbank.com",4,"CO1"),
(10,"Crusty","Clown","cc@cfbank.com",6,"NY1");


create table loanpayments(
loan_number varchar(45) not null,
payment_date date not null,
payment_number int(10) not null,
payment_amount decimal(15,2) not null,
foreign key (loan_number) references loan(loan_number) on delete
cascade on update cascade);


insert into loanpayments(loan_number, payment_date, payment_number, payment_amount)values
("191-250-456-331-2100","2018-04-15",123,175),
("191-250-456-331-4446","2018-04-15",124,100.5),
("191-458-459-331-2102","2018-04-25",130,1000),
("191-458-459-621-4569","2018-04-27",131,50.25),
("191-458-459-721-1000","2018-04-27",132,100),
("191-458-459-999-6900","2018-04-30",143,150),
("456-191-457-400-5555","2018-04-30",144,2500),
("456-191-457-401-7777","2018-04-30",145,5000);

CREATE TABLE checking (
    account_number VARCHAR(255) NOT NULL unique,
    over_draft_fee INT NOT NULL,
    account_ID INT NOT NULL,
    FOREIGN KEY (account_ID)
        REFERENCES accounts (account_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

insert into checking(account_number,over_draft_fee,account_ID)values
("9104-3652-1244-3666",35,1),
("9104-3652-1244-3667",35,3),
("9105-0366-9855-6214",35,4),
("9106-1566-1423-3698",35,6),
("9110-1234-5678-0909",35,7),
("9111-4578-3695-5419",35,9),
("9110-1234-5678-0911",35,10),
("9111-4578-3695-5422",35,11),
("9001-1478-2536-9031",35,13),
("9111-4578-3695-5417",35,16),
("9111-4578-3695-5412",35,17),
("9111-4578-3695-5414",35,19);

create table savings(
account_number varchar(45) not null unique,
interest_rate decimal(8,3) not null,
account_ID int not null,
foreign key(account_ID) references accounts(account_ID) on delete cascade
on update cascade);

insert into savings(account_number, interest_rate, account_ID)values
("9104-3652-1244-3670",0.035,2),
("9104-3652-1244-3672",0.035,5),
("9111-4578-3695-5430",0.035,8),
("9111-4578-3695-5418",0.045,12),
("9002-5846-2513-5845",0.045,14),
("9002-5846-2513-5033",0.05,15),
("9111-4578-3695-5413",0.05,18);



create index cell_phone_number ON customer(cell_phone_number);

create index email_address ON banker(email_address);

create index office_number ON branch(office_number);
