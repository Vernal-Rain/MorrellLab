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


def sample_rank(snps_file, data_files):
    snps = load_snps(snps_file)
    data = []
    result = []

    for file in data_files:
        data = data + load_data(file)

    for snp in snps.keys():
        samples = snps[snp]
        filtered_data = []
        for i in data: 
            if i[0] in samples:
                filtered_data.append((snp, i[0], i[1]))
        filtered_data.sort(key= lambda x: x[2], reverse= True)
        result = result + filtered_data

    return result



if __name__ == '__main__':

    snps_file = 'samples_alt_SNP.txt'
    data_files = ['Cowpea_Bioclim01.txt', 'Cowpea_Bioclim05.txt', 'Cowpea_Bioclim08.txt']
    
    result = sample_rank(snps_file, data_files)

    with open('sample_rank.txt', 'w') as file:
        for i in result:
            file.write('\t'.join(str(s) for s in i) + '\n')
  