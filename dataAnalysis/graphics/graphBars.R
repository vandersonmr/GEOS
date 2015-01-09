#!/usr/bin/Rscript

require(ggplot2)

tHashPlusInstM = read.table("../timeHashPlusInstM")
tInstCostM     = read.table("../timeInstCostM")
tInstM         = read.table("../timeInstM")
tRandM         = read.table("../timeRandM")

to0 = read.table("../timeO0"); 
to2 = read.table("../timeO2"); 

supHashPlusInstM = to0[, 2] / tHashPlusInstM[, 5]
supInstCostM = to0[, 2] / tInstCostM[, 5]
supInstM = to0[, 2] / tInstM[, 5]
supRandM = to0[, 2] / tRandM[, 5]

validos = tHashPlusInstM[, 4] < 5

data = data.frame(Benchmarks=factor(as.character(to0[validos, 1])),
                  Speedup=c(tRandM[validos,4],
                            supRandM[validos]),
                  Tipo=c(rep("Estimated", 75), rep("Real",75)))

data1 = data[c(seq(1,nrow(data)/2, 2), seq(nrow(data)/2+1, nrow(data), 2)), ]
data2 = data[c(seq(2,nrow(data)/2, 2), seq(nrow(data)/2+2, nrow(data), 2)), ]

p1 <- ggplot(data1, aes(x = Benchmarks, y = Speedup, fill=Tipo)) 
p1 <- p1  + geom_bar(stat="identity", width=.9, position="dodge") 
p1 <- p1  + theme(axis.text.x = element_text(angle = 75, hjust = 1, size=15, color="black"), text=element_text(size=15))

p2 <- ggplot(data2, aes(x = Benchmarks, y = Speedup, fill=Tipo)) 
p2 <- p2 + geom_bar(stat="identity", width=.9, position="dodge") 
p2 <- p2 + theme(axis.text.x = element_text(angle = 75, hjust = 1, size=15, color="black"), text=element_text(size=15))

ggsave(file="barplot1.pdf", plot = p1, scale=2)
ggsave(file="barplot2.pdf", plot = p2, scale=2)
