#!/usr/bin/Rscript 

require(ggplot2)

stamp       = read.table("../stamp")
stampBranch = read.table("../stampBranch")
stampCache  = read.table("../stampCache")
stampCall   = read.table("../stampCall")
stampStatic = read.table("../stampStaticInstruction")
stampTTI    = read.table("../stampTTIInstruction")

x0 = grepl(".o0", stamp[,1])
x1 = grepl(".o1", stamp[,1])
x2 = grepl(".o2", stamp[,1])
x3 = grepl(".o3", stamp[,1])

spa1 = stamp[x0,2]/(stamp[x1,2] + 0.00001)
spa2 = stamp[x0,2]/(stamp[x2,2] + 0.00001)
spa3 = stamp[x0,2]/(stamp[x3,2] + 0.00001)
spa4 = stamp[,2]/(stamp[,2] + 0.00001)

sp1 = spa1[spa2 < 10]
sp2 = spa2[spa2 < 10]
sp3 = spa3[spa2 < 10]

estimatedCost = stampCall[,2]*0.5 + stampCache[,2]*4 + stampBranch[,2]*3 + 0.00001 +
   stampTTI[,2]*2;

estimatedsp1 = estimatedCost[x0]/estimatedCost[x1]
estimatedsp2 = estimatedCost[x0]/estimatedCost[x2]
estimatedsp3 = estimatedCost[x0]/estimatedCost[x3]

estimatedsp1 = estimatedsp1[spa2 < 10]
estimatedsp2 = estimatedsp2[spa2 < 10]
estimatedsp3 = estimatedsp3[spa2 < 10]

c1 = cor(sp1, estimatedsp1)
c2 = cor(sp2, estimatedsp2)
c3 = cor(sp3, estimatedsp3)

print("Correlações speedups:")
print(c1)
print(c2)
print(c3)

err1 = mean(abs(sp1 - estimatedsp1))
err2 = mean(abs(sp2 - estimatedsp2))
err3 = mean(abs(sp3 - estimatedsp3))

print("Erro medio speedup");
print(err1)
print(err2)
print(err3)

var1 = sd(abs(sp1 - estimatedsp1))
var2 = sd(abs(sp2 - estimatedsp2))
var3 = sd(abs(sp3 - estimatedsp3))

print("SD speedup");
print(var1)
print(var2)
print(var3)

print("Positivo")
length(which((estimatedsp1 > 1) & (sp1 > 1)))/length(which(sp1 > 1))
length(which((estimatedsp2 > 1) & (sp2 > 1)))/length(which(sp2 > 1))
length(which((estimatedsp3 > 1) & (sp3 > 1)))/length(which(sp3 > 1))

print("Negativo")
length(which((estimatedsp1 < 1) & (sp1 < 1)))/length(which(sp1 < 1))
length(which((estimatedsp2 < 1) & (sp2 < 1)))/length(which(sp2 < 1))
length(which((estimatedsp3 < 1) & (sp3 < 1)))/length(which(sp3 < 1))

print("Total")
length(which((estimatedsp1 < 1) == (sp1 < 1)))/length(sp1)
length(which((estimatedsp2 < 1) == (sp2 < 1)))/length(sp2)
length(which((estimatedsp3 < 1) == (sp3 < 1)))/length(sp3)

print("Choice")
t = 0
t2 = 0
s = 0
for(i in 1:length(stamp[,2])) {
  for(j in 1:length(stamp[,2])) {
    if (stamp[, 2][i] > stamp[, 2][j]) {
      s = s + 1
      if (estimatedCost[i] >= estimatedCost[j]) {
        t = t + 1
      }
    }
  }
}
t/(s)

print("Speed encontrado")
spmean = 0;
for (i in 1:length(sp1)) {
  if (estimatedsp1[i] > estimatedsp2[i]) {
    if (estimatedsp1[i] > estimatedsp3[i]) {
      spmean = spmean + sp1[i]
    } else {
      spmean = spmean + sp3[i]
    }
  } else {
    if (estimatedsp2[i] > estimatedsp3[i]) {
        spmean = spmean + sp2[i]
    } else {
        spmean = spmean + sp3[i]
    }
  }
}
spmean/length(sp1)
mean(sp1)
mean(sp2)
mean(sp3)
