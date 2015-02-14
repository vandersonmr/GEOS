#!/usr/bin/Rscript

stamp  = read.table("../stamp")
timeO0 = read.table("../timeO0")

speedupreal = (timeO0[,2] + 0.00001)/(stamp[,2] + 0.00001)

inst = read.table("../speedupInst") 
instCost = read.table("../speedupInstCost") 
hashW = read.table("../speedupHashW3") 
hashPlusInst = read.table("../speedupHashPlusInst") 

i = timeO0[,2] > 11.753 & timeO0[,2] <= 260

#print(sort(timeO0[,2]))

print("mean")
a = mean((inst[,1][i] - speedupreal[i]))
b = mean((instCost[,1][i] - speedupreal[i]))
c = mean((hashW[,1][i] - speedupreal[i]))
d = mean((hashPlusInst[,1][i] - speedupreal[i]))
a
b
c
d

print("sd")
sd((inst[,1][i] - speedupreal[i]))
sd((instCost[,1][i] - speedupreal[i]))
sd((hashW[,1][i] - speedupreal[i]))
sd((hashPlusInst[,1][i] - speedupreal[i]))

print("cor")
cor(inst[,1][i], speedupreal[i])
cor(instCost[,1][i], speedupreal[i])
cor(hashW[,1][i] , speedupreal[i])
cor(hashPlusInst[,1][i] , speedupreal[i])

print("false positivo")
length(which((inst[,1][i] > 1) & (speedupreal[i] < 1)))
length(which((instCost[,1][i] > 1) & (speedupreal[i] < 1)))
length(which((hashW[,1][i] > 1) & (speedupreal[i] < 1)))
length(which((hashPlusInst[,1][i] > 1) & (speedupreal[i] < 1)))
print("Total:")
length(which((inst[,1][i] > 1)))
length(which((instCost[,1][i] > 1)))
length(which((hashW[,1][i] > 1)))
length(which((hashPlusInst[,1][i] > 1)))
print("-----------------")

length(which((inst[,1][i] < 1) & (speedupreal[i] > 1)))
length(which((instCost[,1][i] < 1) & (speedupreal[i] > 1)))
length(which((hashW[,1][i] < 1) & (speedupreal[i] > 1)))
length(which((hashPlusInst[,1][i] < 1) & (speedupreal[i] > 1)))
print("Total:")
length(which((inst[,1][i] < 1)))
length(which((instCost[,1][i] < 1)))
length(which((hashW[,1][i] < 1)))
length(which((hashPlusInst[,1][i] < 1)))

