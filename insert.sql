INSERT INTO [CUSTOMER] VALUES
( 
	(SELECT max("id") FROM [CUSTOMER])+ 1,
	'kim Soyeon',
    'South Korean',
    1,
    '01043567755',
    'kim.soyeon@gmail.com',
    'Soyeon',
    'password1',
    'Inha Incheon',
    0
),(
	(SELECT max("id") FROM [CUSTOMER])+ 1,
	'Lee Jimin',
    'South Korean',
    1,
    '01042244115',
    'lee.jmin@gmail.com',
    'jmin',
    'password2',
    'Seoul',
    0
),(
	(SELECT max("id") FROM [CUSTOMER])+ 1,
	'Yeon Ki-yeon',
    'South Korean',
    1,
    '02056390045',
    'yeon.yeon@gmail.com',
    'kiyeon',
    'password3',
    'Seoul',
    0
);


INSERT INTO [DEPARTMENT] VALUES
( 
	(SELECT max("id") FROM [DEPARTMENT])+ 1,
	'transactions',
	(SELECT "id" from [CUSTOMER] where name = "kim Soyeon")
);


INSERT INTO [BRANCH] VALUES
( 
	(SELECT max("id") FROM [BRANCH])+ 1,
	'seoul branch',
    'Seoul',
	(SELECT "id" from [DEPARTMENT] where name = "transactions"),
	(SELECT "id" from [CUSTOMER] where name = "Yeon Ki-yeon")
);


INSERT INTO [LOAN] VALUES
( 
	(SELECT max("id") FROM [LOAN])+ 1,
	1000000,
    1000,
    2000000,
	20220718,
	20230510
);


INSERT INTO [BANK] VALUES
( 
	(SELECT max("id") FROM [BANK])+ 1,
    'bank 1',
	'NATIO',
	(SELECT "id" from [BRANCH] where name = "seoul branch")
);

INSERT INTO [TRANSACTION] VALUES
( 
	(SELECT max("id") FROM [TRANSACTION])+ 1,
    100000,
	20221225,
	(SELECT "id" from [BRANCH] where name = "seoul branch")
);


INSERT INTO [BUSINESS ACCOUNT] VALUES
( 
	(SELECT max("id") FROM [BUSINESS ACCOUNT])+ 1,
    234542122,
	200000,
    'company',
    (SELECT max("id") FROM [LOAN]),
    (SELECT max("id") FROM [TRANSACTION]),
    (SELECT "id" from [CUSTOMER] where name = "kim Soyeon"),
    (SELECT "id" from [CUSTOMER] where name = "Lee Jimin")
);

INSERT INTO [PRIVATE ACCOUNT] VALUES
( 
	(SELECT max("id") FROM [PRIVATE ACCOUNT])+ 1,
    68435154,
	120000,
    (SELECT max("id") FROM [TRANSACTION]),
    (SELECT max("id") FROM [LOAN]),
    (SELECT "id" from [CUSTOMER] where name = "Yeon Ki-yeon")
);