
import os
import gzip
from Bio import SeqIO
import pandas

#to generate fastq files from list of barcodes

def fastqfilterR2(tablewithbarcodes, R1fastq, R2fastq, outputname):
    list = pandas.read_table(tablewithbarcodes)
    list_of_names = list['tenXBarcode']
    set1 = set([line.strip().split(' ')[0] for line in list_of_names])

    output = open(outputname,"w")

    with gzip.open(R1fastq, "rt") as R1, gzip.open(R2fastq, "rt") as R2:
        for record1,record2 in (zip(SeqIO.parse(R1,"fastq"), SeqIO.parse(R2,"fastq"))):
            if str(record1.seq[0:16]) in set1:
                output.write(record2.format("fastq"))

    output.close()

def fastqfilterR1(tablewithbarcodes, R1fastq, R2fastq, outputname):
    list = pandas.read_table(tablewithbarcodes)
    list_of_names = list['tenXBarcode']
    set1 = set([line.strip().split(' ')[0] for line in list_of_names])

    output = open(outputname,"w")

    with gzip.open(R1fastq, "rt") as R1, gzip.open(R2fastq, "rt") as R2:
        for record1,record2 in (zip(SeqIO.parse(R1,"fastq"), SeqIO.parse(R2,"fastq"))):
            if str(record1.seq[0:16]) in set1:
                output.write(record1.format("fastq"))

    output.close()

SDbcfilelist = ["SDRM11.txt","SDSK1.txt","SDWTho.txt"]

YPDbcfilelist = ["YPDRM11.txt","YPDSK1.txt","YPDWTho.txt"]

SDR1list = ["SD_POCPOOL_S2_L001_R1_001.fastq.gz","SD_POCPOOL_S2_L002_R1_001.fastq.gz","SD_POCPOOL_S2_L003_R1_001.fastq.gz","SD_POCPOOL_S2_L004_R1_001.fastq.gz"]

SDR2list = ["SD_POCPOOL_S2_L001_R2_001.fastq.gz","SD_POCPOOL_S2_L002_R2_001.fastq.gz","SD_POCPOOL_S2_L003_R2_001.fastq.gz","SD_POCPOOL_S2_L004_R2_001.fastq.gz"]

YPDR1list = ["YPD_POCPOOL_S1_L001_R1_001.fastq.gz","YPD_POCPOOL_S1_L002_R1_001.fastq.gz","YPD_POCPOOL_S1_L003_R1_001.fastq.gz","YPD_POCPOOL_S1_L004_R1_001.fastq.gz"]

YPDR2list = ["YPD_POCPOOL_S1_L001_R2_001.fastq.gz","YPD_POCPOOL_S1_L002_R2_001.fastq.gz","YPD_POCPOOL_S1_L003_R2_001.fastq.gz","YPD_POCPOOL_S1_L004_R2_001.fastq.gz"]

for i in range(4):
    for file in SDbcfilelist:
        fastqfilterR2(file,SDR1list[i],SDR2list[i],"".join([SDR1list[i][0:22],file[0:4],".fastq"]))
        fastqfilterR1(file,SDR1list[i],SDR2list[i],"".join([SDR1list[i][0:22],file[0:4],".fastq"]))

for i in range(4):
    for file in YPDbcfilelist:
        fastqfilterR2(file,YPDR1list[i],YPDR2list[i],"".join([YPDR1list[i][0:22],file[0:4],".fastq"]))
        fastqfilterR1(file,YPDR1list[i],YPDR2list[i],"".join([YPDR1list[i][0:22],file[0:4],".fastq"]))





