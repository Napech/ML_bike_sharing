import matplotlib.pyplot as plt
import numpy
import pylab
from matplotlib.patches import Rectangle
import colorsys
import sys
import csv


def convert_time(time):
    return int((time.split()[1]).split(':')[0])

def convert_date(date):
    day = int(date.split(' ')[0].split('-')[2])
    month = int(date.split(' ')[0].split('-')[1])
    dic = {1:0, 2:31, 3:59, 4:90, 5:120, 6:151, 7:181, 8:212, 9:243, 10:273, 11:304, 12:334}
    return dic[month] + day
    


with open('train.csv', 'rb') as csvfile:
    currentAxis = plt.gca()

    currentAxis.set_xticks(numpy.arange(0,100,1))
    currentAxis.set_yticks(numpy.arange(0,17,1))
    read = csv.reader(csvfile)
    p = {}

    row1 = next(read)
    for row in read:
        print row
        h = convert_time(row[0])
        nb_bikes = int(row[len(row)-1])
        if h in p:
            p[h] += nb_bikes
        else:
            p[h] = nb_bikes

    p_list = p.items()
    p_list.sort()
    x = [t[0] for t in p_list]
    y = [t[1] for t in p_list]
    plt.stem(x,y)
    plt.show()


            
