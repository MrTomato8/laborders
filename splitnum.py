#!/usr/bin/python
# -*- coding: utf-8 -*-

import random, sys

#число, к которому надо подогнать, 
#размер массива
#минимум
#максимум
#верхняя граница, больше которой числа отбрасываются

s = (0, 30, 1, 1000, 300)

def main(argv):
    num = int(argv[1])
    low = int(argv[2])
    up = int(argv[3])
    cl = int(argv[4])

    def randints(num, low, up):
        return [random.randrange(low,up+1) for i in range(num)]

    def first_test(x):
        #отбираем вся что меньше искомой суммы cl
        if cl <= up:
            t = cl / x 
            return  cl / x >= 1
    
    def test(x):
        if cl <= up:
            t = cl / x
            if t >= 1:
                return (t, x)
        
    def second_test(seq):
        d = {}
        for i in seq:
            if i[0] not in d.keys():
                d[i[0]] = []
                d[i[0]].append(i[1])
            else:
                d[i[0]].append(i[1])
            #print 'на %d вы можете купить %d за %d' % (cl, i[0], i[1])
        return d

    def third_test(dic):
        print 'found: <= %d' % cl, dic
        one = dic.pop(1)

        #del dic[1]
        print "one time", one
        
        print 'first iteration: O(1) + O(n>1)'
        for o in one:
            for k, v in dic.items():
                for i in v:
                    if o + i <= cl:
                        print '%d + %d = %d <= %d' % (o, i, o+i, cl)

        print 'second iteration: O(1) + n*O(n>1)'
        for o in one:
            for k, v in dic.items():
                if len(dic[k]) > 1:
                    if o + sum(dic[k]) <= cl:
                        print '%d + %d = %d <= %d' % (o, sum(dic[k]), o+sum(dic[k]), cl)

        print 'third iteration...'

    s = list(randints(num, low, up))

    seq1 = [] 
    for i in s:
        t = test(i)
        if t:
            seq1.append(t)

    out = second_test(seq1)
    third_test(out)
if __name__ == '__main__':
    main(s)
