#! /usr/bin/python
# -*- coding: utf-8 -*-   

import xlrd, psycopg2
import sys

conn = psycopg2.connect("dbname='laborders' user='annndrey' host='localhost'  password='andreygon'")
cur = conn.cursor()

b = xlrd.open_workbook(sys.argv[1])
for i in b.sheet_names():
    sh = b.sheet_by_name(i)
    print u"Sheet %s" % i
    for j in xrange(sh.nrows):
        print u" ".join(map(unicode, sh.row_values(j)))
        #тут сделать cur.execute("insert into orders_stuff (colanmes) values (values)")
        #и почистить от лишних строк, пустых и с названиями столбцов
