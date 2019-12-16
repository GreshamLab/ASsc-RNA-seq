#bedgraph plotter

file = read.delim("YPDintersect.bed",header=F)

chrom <- levels(file$V1)


starts <- numeric()
ends <- numeric()

for (i in 1:length(chrom)){
  starts[i] <- file %>% filter(V1 == chrom[i]) %>% transmute(V2) %>% min
  ends[i] <- file %>% filter(V1 == chrom[i]) %>% transmute(V3) %>% max
}

#YPD <- read.table("YPD_peaks.narrowPeak")

dev.off()
pdf("YPDcoverage.pdf")
for (i in 1:length(chrom)){
  plotBedgraph(file,chrom[i],starts[i],ends[i])
  labelgenome(chrom[i],starts[i],ends[i],scale = "Mb")
  axis(side=2,las=2,tcl=.2)
  #YPD %>% filter(V1==chrom[i]) -> x
  #abline(v= x$V2   ,lty=2,col = "blue")
  #abline(v= x$V3   ,lty=2, col = "red")
}
dev.off()


