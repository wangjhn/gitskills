#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sqlite3

conn    = sqlite3.connect('mysqlite.db')
cursor  = conn.cursor()

#update example
sql      =  "update students set name='hello' where id >=5 and id <= 10"
sqldata  =  cursor.execute(sql)

#delete example
sql      =  "delete from students where id = 250"
sqldata  =  cursor.execute(sql)
conn.commit()


# query example 1
sql      = 'select name,score from students where (score >= 80 and score <= 89) and gender = "girl" order by score desc'
sqldata  = cursor.execute(sql)
values   = cursor.fetchall()
totalnum =  len(values)
print("totalnum = ",totalnum)
print(values)

sql      = 'select avg(score) from students where gender = "girl"'
sqldata  = cursor.execute(sql)
values   = cursor.fetchall()
totalnum =  len(values)
print("totalnum = ",totalnum)
print(values)

#students & schoolclass select
sql      = 'select students.name,students.score,schoolclass.classname from students,schoolclass where ((students.score >= 80 and students.score <= 89) and students.gender = "girl" and schoolclass.id = 2) order by students.score desc'
sqldata  = cursor.execute(sql)
values   = cursor.fetchall()
totalnum =  len(values)
print("totalnum = ",totalnum)
print(values)

#join query for multitable
sql      = 'select students.name,students.classid,schoolclass.classname from students inner join schoolclass on students.classid = schoolclass.id'
sqldata  = cursor.execute(sql)
values   = cursor.fetchall()
totalnum =  len(values)
print("totalnum = ",totalnum)
print(values)


#close cursor
cursor.close()
#close connection
conn.close()

