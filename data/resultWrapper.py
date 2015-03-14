import math
import csv


with open('test.csv', 'rb') as test:
    with open('testresult.txt', 'r') as res:
        read = csv.reader(test)
        i = 0
        for row in read:
            if i==0:
                i+=1
                print "datetime,count"
                continue
            print row[0]+","+str(math.exp(float(res.readline())))
