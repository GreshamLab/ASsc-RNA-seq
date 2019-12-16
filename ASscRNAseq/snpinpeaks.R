

snpinpeaks <- function(snp_file,peak_xls_file){
  read.csv(snp_file,header = F) -> snps
  snps$V1 <- gsub(" ","",snps$V1)
  read.table(peak_xls_file, header = T) -> ranges
  library(GenomicRanges)
  library(IRanges)
  snps.gr <- GRanges(IRanges(start=snps$V2,end=snps$V2),seqnames = snps$V1)
  ranges.gr <- GRanges(IRanges(start=ranges$start,end= ranges$end),seqnames = ranges$chr)
  ranges.git <- GNCList(ranges.gr)
  overlap <- snps.gr %within% ranges.git
  return(snps[overlap,])
}

YPDrm11 <- snpinpeaks("rm11snp.csv","YPD1_peaks.xls")
write.table(YPDrm11, file = "YPDrm11snp.csv", sep = ",", row.names = F, quote = F, col.names = F)

SDrm11 <- snpinpeaks("rm11snp.csv","SD1_peaks.xls")
write.table(SDrm11, file = "SDrm11snp.csv", sep = ",", row.names = F, quote = F, col.names = F)

YPDsk1 <- snpinpeaks("sk1snp.csv","YPD1_peaks.xls")
write.table(YPDsk1, file = "YPDsk1snp.csv", sep = ",", row.names = F, quote = F, col.names = F)

SDsk1 <- snpinpeaks("sk1snp.csv","SD1_peaks.xls")
write.table(SDsk1, file = "SDsk1snp.csv", sep = ",", row.names = F, quote = F, col.names = F)

