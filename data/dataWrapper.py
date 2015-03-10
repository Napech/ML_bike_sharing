import csv

def convert_time(time):
    return int((time.split()[1]).split(':')[0])

def convert_date(date):
    day = int(date.split(' ')[0].split('-')[2])
    month = int(date.split(' ')[0].split('-')[1])
    dic = {1:0, 2:31, 3:59, 4:90, 5:120, 6:151, 7:181, 8:212, 9:243, 10:273, 11:304, 12:334}
    return dic[month] + day
    


with open('data/train.csv', 'rb') as csvfile:
    read = csv.reader(csvfile)
    print "dataset = {};"
    i = 0
    
    for row in read:
        if i == 0:
            i+=1
            continue
        print "dataset["+str(i)+"] = {}" 
        print "dataset["+str(i)+"][1] = torch.Tensor(10)"

        print "dataset["+str(i)+"][1][1] =",
        print convert_date(row[0]), ";"

        print "dataset["+str(i)+"][1][2] =",
        print convert_time(row[0]), ";"

        print "dataset["+str(i)+"][1][3] =",
        print row[1], ";"

        print "dataset["+str(i)+"][1][4] =",
        print row[2], ";"

        print "dataset["+str(i)+"][1][5] =",
        print row[3], ";"

        print "dataset["+str(i)+"][1][6] =",
        print row[4], ";"

        print "dataset["+str(i)+"][1][7] =",
        print row[5], ";"

        print "dataset["+str(i)+"][1][8] =",
        print row[6], ";"

        print "dataset["+str(i)+"][1][9] =",
        print row[7], ";"

        print "dataset["+str(i)+"][1][10] =",
        print row[8], ";"

        print "dataset["+str(i)+"][2] = torch.Tensor(3)"

        print "dataset["+str(i)+"][2][1] =",
        print row[9], ";"

        print "dataset["+str(i)+"][2][2] =",
        print row[10], ";"

        print "dataset["+str(i)+"][2][3] =",
        print row[11], ";"

        i+=1
    print "function dataset:size() return %s end" % (i-1)

