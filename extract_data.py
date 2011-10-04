#! /usr/bin/python
# -*- coding: utf-8 -*-   

import xlrd, psycopg2, pg
import sys

conn = psycopg2.connect("dbname='laborders' user='annndrey' host='localhost'  password='andreygon'")
cur = conn.cursor()

b = xlrd.open_workbook(sys.argv[1])
for i in b.sheet_names():
    sh = b.sheet_by_name(i)
    print u"Sheet %s" % i
    if i != 'A':
        for j in xrange(sh.nrows):
            values = sh.row_values(j)[0:5]
            values.append(i)
            if len(values[0]) > 0:
                
                #val =  , values)) + "'"
                print "; ".join(map(unicode, values))
                cur.execute("""insert into orders_stuff (name_rus, name_exact, manuf, cat_num, package, group_) values (%s, %s, %s, %s, %s, %s)""", values)
                
    conn.commit()
