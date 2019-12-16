my_genotypes= c("RM11","SK1","WT(ho)")

extract.by.genotype <- function(gzfile,vector) 
  library(rlist)
  barcodes <- read.delim(gzfile("20190616_SS_Data.tsv.gz"))
  barcodes <- barcodes[,6831:6835]
  strains <- barcodes %>% filter(Genotype_Group == "RM11" | Genotype_Group == "SK1" | Genotype_Group =="WT(ho)") %>% arrange(Genotype_Group)

#YPDstrains <- strains %>% filter(Condition == "YPD")

#SDstrains <- strains %>% filter(Condition == "SD")

  genotype_list <- list
  conditions <- levels(strains$Condition)
  file_list <- list()
  
  for (condition in conditions){
    for (genotype in genotype_list){
      assign(paste(condition,genotype,sep=""),strains %>% filter(Condition == condition & Genotype_Group == genotype))
      file_list <- list.append(file_list,paste(condition,genotype,sep=""))
      }
  }
  
  
  for (file in file_list){
    write.table(file, file = paste(file[1,'Condition'],file[1,'Genotype_Group'],".txt", sep =""), sep = "\t",quote = F, row.names = F)
}
  