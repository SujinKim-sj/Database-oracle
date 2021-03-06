CREATE TABLE MEMBER (
    ID VARCHAR2(100) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
    PW VARCHAR2(100) NOT NULL,
    NAME VARCHAR2(100),
    PHONE VARCHAR2(100),
    EMAIL VARCHAR2(100)
);

CREATE TABLE BANKBOOK (
    BOOK_NUMBER NUMBER CONSTRAINT BOOK_NUMBER_PK PRIMARY KEY,
    BOOK_RATE NUMBER(3, 2),
    BOOK_NAME VARCHAR2(100),
    BOOK_SALE NUMBER(1)
);

CREATE TABLE TRADE (
    TRADE_NUMBER NUMBER CONSTRAINT TRADE_NUMBER_PK PRIMARY KEY,
    ACCOUNT_NUMBER NUMBER CONSTRAINT TRADE_ACNUMBER_FK REFERENCES ACCOUNT (ACCOUNT_NUMBER), 
    TRADE_DATE DATE,
    TRADE_AMOUNT NUMBER,
    TRADE_BALANCE NUMBER,
    TRADE_IO NUMBER(1)
);

CREATE TABLE ACCOUNT (
    ACCOUNT_NUMBER NUMBER CONSTRAINT ACCOUNT_NUMBER_PK PRIMARY KEY,
    ID VARCHAR2(100) CONSTRAINT ACCOUNT_ID_FK REFERENCES MEMBER (ID),
    BOOK_NUMBER NUMBER CONSTRAINT ACCOUNT_BOOKNUM_FK REFERENCES BANKBOOK (BOOK_NUMBER),
    ACCOUNT_BALANCE NUMBER,
    ACCOUNT_DATE DATE

);

SELECT * FROM TAB; 
DESC BANKBOOK;
DESC TRADE;
DESC ACCOUNT;