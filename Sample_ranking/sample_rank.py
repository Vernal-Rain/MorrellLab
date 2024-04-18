#!/usr/bin/env python3
'''
Sample ranks for cowpea SNPs by temperature
'''


def load_data(file):  
    data = []
    with open(file, "r") as file:
        for line in file:
            x = line.split()
            data.append((x[0], x[1]))
    return data


def load_snps(file):
    data = {}
    with open(file, "r") as file:
        for line in file:
            x = line.split()
            snp = x[0]
            sample = x[1]

            if snp not in data.keys():
                data[snp] = [sample]
            else:
                smpl_list = data[snp] + [sample]
                data[snp] = smpl_list
    return data


def write_output(result, outfile):
    with open(outfile, 'w') as file:
        for i in result:
            file.write('\t'.join(str(s) for s in i) + '\n')
    return


def sample_rank(snps_file, data_files, outfile):
    snps = load_snps(snps_file)
    data = []
    result = []

    for file in data_files:
        data = data + load_data(file)

    for snp in snps.keys():
        samples = snps[snp]
        labeled_data = []
        for i in data: 
            if i[0] in samples:
                labeled_data.append((snp, i[0], i[1]))
        result = result + labeled_data
    result.sort(key= lambda x: x[2], reverse= True)

    rank = 1
    val = result[0][2]
    for i in range(len(result)):
        if result[i][2] == val:
            result[i] = (result[i][0], result[i][1], rank)
        elif result[i][2] < val:
            rank = rank + 1
            val = result[i][2]
            result[i] = (result[i][0], result[i][1], rank)
        else:
            print('Warning: file not sorted.')

    write_output(result, outfile)
    return



if __name__ == '__main__':

    snps_file = 'samples_alt_SNP.txt'
    data_files = ['Cowpea_Bioclim01.txt', 'Cowpea_Bioclim05.txt', 'Cowpea_Bioclim08.txt']
    outfile = 'sample_rank.txt'
    sample_rank(snps_file, data_files, outfile)

  