import csv

def convert_time(time):
    return int((time.split()[1]).split(':')[0])

def convert_year(date):
    year = int(date.split(' ')[0].split('-')[0])
    if year == 2011:
        return 0
    return 1

def convert_month(date):
    day = int(date.split(' ')[0].split('-')[2])
    month = int(date.split(' ')[0].split('-')[1])
    dic = {1:0, 2:31, 3:59, 4:90, 5:120, 6:151, 7:181, 8:212, 9:243, 10:273, 11:304, 12:334}
    return month-1 # + day

def convert_date(date):
    day = int(date.split(' ')[0].split('-')[2])
    month = int(date.split(' ')[0].split('-')[1])
    dic = {1:0, 2:31, 3:59, 4:90, 5:120, 6:151, 7:181, 8:212, 9:243, 10:273, 11:304, 12:334}
    if convert_year(date) == 0:
        return (dic[month] + day)%7
    return (dic[month] + day+1)%7

def convert2bool(size, i):
    l = ['0']*size
    l[i] = '1' 
    return l

with open('train.csv', 'rb') as csvfile:
    read = csv.reader(csvfile)
    next(read)

    for row in read:
        print convert_year(row[0]),
        print ' '.join(convert2bool(12,convert_month(row[0]))),
        print ' '.join(convert2bool(7,convert_date(row[0]))),
        print ' '.join(convert2bool(24,convert_time(row[0]))),
        print ' '.join(convert2bool(4,int(row[1])-1)),
        print row[2],
        print row[3],
        print ' '.join(convert2bool(4,int(row[4])-1)),
        print row[5],
        print str(abs(float(row[5]) -20)),
        print row[6],
        print str(abs(float(row[6]) -27)),
        print row[7],
        print row[8],
        if len(row) > 10:
            print row[11]

with open('test.csv', 'rb') as csvfile:
    read = csv.reader(csvfile)
    next(read)

    for row in read:
        print convert_year(row[0]),
        print ' '.join(convert2bool(12,convert_month(row[0]))),
        print ' '.join(convert2bool(7,convert_date(row[0]))),
        print ' '.join(convert2bool(24,convert_time(row[0]))),
        print ' '.join(convert2bool(4,int(row[1])-1)),
        print row[2],
        print row[3],
        print ' '.join(convert2bool(4,int(row[4])-1)),
        print row[5],
        print str(abs(float(row[5]) -20)),
        print row[6],
        print str(abs(float(row[6]) -27)),
        print row[7],
        print row[8]



        


                
        
        
    
    
