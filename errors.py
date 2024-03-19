'''Check mendel errors'''

def load(file):
    dat = []
    with open(file, 'r') as reader:
        reader.readline()
        for i in reader:
            line = i.split(' ')
            if not '*/*' in line:
                short_line = []
                for j in line:
                    if j:
                        short_line.append(j)
                dat.append(short_line)
    return dat

       
if __name__ == '__main__':
    data = load('E15351_X_AR15-158072_family.mendel')
    print(data)