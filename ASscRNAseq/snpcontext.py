import numpy
from Bio import SeqIO


#function to generate dictionary with twenty bases on either side of each SNP
def snpcontext(snptable,fasta):
    sequences = {record.id: [] for record in fasta}
    start = ""
    end = ""
    for i in range(len(snp)):
        for j in range(len(fasta)):
            if snp[i,0] == fasta[j].id:
                start = snp[i,1] - 21
                end = snp[i,1] + 20
                sequences[fasta[j].id].append(fasta[j].seq[start:end])
    return(sequences)


#for unit tests to make later
sequences["chrI"][0][20] == callset['variants/REF'][0]
sequences["chrI"][4][20] == callset['variants/REF'][4]

#function to generate dictionary with twenty bases on left side of each SNP from output of snpcontext()
def snpleftflank(dictionary):
    leftflank = dictionary.copy()
    for k in leftflank:
        leftflank[k] = [x[0:20] for x in leftflank[k]]
    return(leftflank)

leftflank = snpleftflank(sequences)

#function to generate dictionary with twenty bases on right side of each SNP from output of snpcontext()
def snprightflank(dictionary):
    rightflank = dictionary.copy()
    for k in rightflank:
        rightflank[k] = [x[21:41] for x in rightflank[k]]
    return(rightflank)

rightflank = snprightflank(sequences)
      
