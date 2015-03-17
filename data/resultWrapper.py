import math
import csv
import sys


with open('test.csv', 'rb') as test:
    read = csv.reader(test)
    i = 0
    for row in read:
        if i==0:
            i+=1
            print "datetime,count"
            continue
        print row[0]+","+str(math.exp(float(sys.stdin.readline())))
