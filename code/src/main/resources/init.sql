REPLACE INTO ROLE(DESCRIPTION, ID_ROLE) VALUES("role_user", 1);
REPLACE INTO ROLE(DESCRIPTION, ID_ROLE) VALUES("role_admin", 2);
REPLACE INTO USER(`ID_USER`, `ADDRESS`, `BIRTHDAY`, `DATE_RES`, `EMAIL`, `FULL_NAME`, `PASSWORD`, `PHONE`, `SEX`, `TIME_RES`, `USER_NAME`, `ID_ROLE`) VALUES ('1', 'Can Tho', '1995/02/14', '2017/03/14', 'administrator1@email.com', 'Admin', 'MTIzNA==', '092817212', 'Nam', '08:21:12', 'admin', '2');
REPLACE INTO USER(`ID_USER`, `ADDRESS`, `BIRTHDAY`, `DATE_RES`, `EMAIL`, `FULL_NAME`, `PASSWORD`, `PHONE`, `SEX`, `TIME_RES`, `USER_NAME`, `ID_ROLE`) VALUES ('2', 'Can Tho', '1995/02/14', '2017/03/14', 'user1@email.com', 'UserNameA', 'MTIzNDU2Nzg=', '092817212', 'Nam', '08:21:12', 'customer', '1');
#admin(1234)
#customer(12345678)