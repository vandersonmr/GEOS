#!/usr/bin/Rscript
library(ggplot2)
library(scales)

stamp        = read.table("../stamp")
stampCacheO  = read.table("../stampCache")[,2]
stampCache13 = read.table("../stampCache12")[,2]
stampCall    = read.table("../stampCall")[,2]
stampBranch  = read.table("../stampBranch")[,2]
stampTTI     = read.table("../stampTTIInstruction")[,2]
stampConst   = read.table("../stampConstInst")[,2]
Otest        = read.table("../Otest2")[,2]

O0 = grep("o0", stamp[,1])
O1 = grep("o3", stamp[,1])
O2 = grep("o2", stamp[,1])
O3 = grep("o3", stamp[,1])

stamp = stamp[,2]

f <- function(a , b) {
  t = 0
  l = 0
  for (i in 1:length(a)) {
    for (j in 1:length(a)) {
      if (a[i] > a[j]) {
        if (b[i] >= b[j]) {
          l = l + 1
        }
        t = t + 1
      }
    }
  }
  print(l/t)
}
ts = stampCacheO#((0.1*stampCache13 + 0.9*stampTTI + 1.3*stampCacheO)/4 + 0.8*stampBranch + 0.05*stampCall)
cor(stamp, ts)
f(stamp, ts)

t = 0;
o0 = 0;
o1 = 0;
o2 = 0;
o3 = 0;

or0 = 0;
or1 = 0;
or2 = 0;
or3 = 0;

realO2 = 0;

spt = 0
spt1 = 0
spt2 = 0
spt3 = 0
for (i in 1:length(Otest)) {
  if (stamp[O0][i] > 1 && stamp[O0][i]/stamp[O2][i] < 10) {
  sp = 0;
  if (length(grep("O0", Otest[i])) != 0) {
    sp = 1;
    o0 = o0 + 1
  } else if (length(grep("O1", Otest[i])) != 0) {
    sp = (stamp[O0][i]/stamp[O1][i]);
    o1 = o1 + 1
  } else if (length(grep("O2", Otest[i])) != 0) {
    sp = (stamp[O0][i]/stamp[O2][i]);
    o2 = o2 + 1
  } else if (length(grep("O3", Otest[i])) != 0) {
    sp = (stamp[O0][i]/stamp[O3][i]);
    o3 = o3 + 1
  }

  spt = spt + sp
  spt1 = spt1 + (stamp[O0][i]/stamp[O1][i])
  spt2 = spt2 + (stamp[O0][i]/stamp[O2][i])
  spt3 = spt3 + (stamp[O0][i]/stamp[O3][i])

  Obest = 3
  Tbest = stamp[O0][i]
  for (j in 1:2) {
    stm = ifelse(j == 1, stamp[O1][i], stamp[O2][i])
    if (Tbest >= stm) {
      Obest = j
      Tbest = stm
    }
  }

  if (Obest == 3) or3 = or3 + 1
  if (Obest == 2) or2 = or2 + 1
  if (Obest == 1) or1 = or1 + 1

  t = t + 1
  }
}

print("t")
print(t)

print("Os est")
print(o1)
print(o2)
print(o3)

print("Os real")
print(or1)
print(or2)
print(or3)

print("sp")
print(spt/t)
print(spt1/t)
print(spt2/t)
print(spt3/t)

#pdf("box.pdf")
g <- ggplot(data = data.frame(x = c("O1", "O2", "O3"), y = c(o1, o2, o3)), aes(x = x, y = y))
#boxplot(stamp, stampCacheO, 0.1*stampCache13, stampTTI, stampConst, ylim=c(0, 100), ylab="Desempenho")
g <- g + geom_bar(stat="identity") + theme_bw() + xlab("Conjunto de Otimizações") + scale_y_continuous(limits=c(0, 50),oob = rescale_none) + 
ylab("Quantidade de Benchmarks") + theme(text = element_text(size=22)) 
ggsave("CacheInstr.pdf", g)
#dev.off()
