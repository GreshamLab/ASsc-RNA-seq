#preprocessing of fasta file

#read in the reference genome fasta file
fasta = list(SeqIO.parse('S288C_reference_sequence_R64-1-1_20110203.fsa','fasta'))

#this next block just rewrites the chromosome id's to match the snp table
newid = list()

for i in range(len(fasta)):
    description = fasta[i].description
    index1 = description.find("chromosome")
    descriptionsubset = description[index1:]
    index2 = descriptionsubset.find("=")
    index3 = descriptionsubset.find("]")
    left = descriptionsubset[0:3]
    right = descriptionsubset[(index2+1):(index3)]
    newid.append(left+right)

for i in range((len(fasta)-1)):
    fasta[i].id = newid[i]

fasta[16].id = 'chrM' 
