import allel

def snptable(file): #function to read in vcf and generate table with variants
        callset = allel.read_vcf(file)
        chr = callset['variants/CHROM']
        pos = callset['variants/POS']
        ref = callset['variants/REF']
        alt = callset['variants/ALT']
        return(numpy.column_stack((chr,pos,ref,alt)))
    #convert into dataframe

snp = snptable('SK1.gatk.vcf.gz')
