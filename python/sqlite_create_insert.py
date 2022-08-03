#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sqlite3

conn    = sqlite3.connect('mysqlite.db')
cursor  = conn.cursor()

# 执行一条SQL语句，创建user表:
sql     = 'create table students (id int primary key, classid int,name varchar(20),gender char(20),score int(10))'
cursor.execute(sql)

# 继续执行一条SQL语句，插入一条记录:
sql     =   'insert into students (id,classid,name,gender,score) values(?,?,?,?,?)'
l       =   list(range(251))
classnum    =   [6,8,3,4,5]
for x in l[1:251]:
    class_id    = classnum[(x % 5)]
    if (0 == x % 4):
        name    = 'wang%d'%(x)
    elif    (1 == x % 4):
        name    = 'chen%d'%(x)
    elif    (2 == x % 4):
        name    = 'lu%d'%(x)
    else    :
        name    = 'zhao%d'%(x)

    gender      = "boy"
    if (x % 2):
        gender  = "girl"

    score   =   (x % 100)
    cursor.execute(sql,(x,class_id,name,gender,score))

#create antoher table
sql     = 'create table schoolclass (id int primary key,classname varchar(40))'
cursor.execute(sql)

# 继续执行一条SQL语句，插入一条记录:
sql     =   'insert into schoolclass (id,classname) values(?,?)'
l       =   list(range(21))
for x in l[1:21]:
    classname   = 'class_%d'%(x)
    cursor.execute(sql,(x,classname))

conn.commit()

#close cursor
cursor.close()
#close connection
conn.close()

