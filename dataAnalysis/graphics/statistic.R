#!/usr/bin/Rscript

stamp  = read.table("../stamp")
timeO0 = read.table("../timeO0") + 0.00001

speedupreal = (timeO0[,2] + 0.00001)/(stamp[,2] + 0.00001)

inst = read.table("../speedupInst") 
instCost = read.table("../speedupInstCost") 
hashW = read.table("../speedupHashW") 
hashPlusInst = read.table("../speedupHashPlusInst") 

i = timeO0[,2] > 0 & timeO0[,2] <= 260

print("mean")
mean(abs(inst[,1][i] - speedupreal[i]))
mean(abs(instCost[,1][i] - speedupreal[i]))
mean(abs(hashW[,1][i] - speedupreal[i]))
mean(abs(hashPlusInst[,2][i] - speedupreal[i]))

print("sd")
sd(abs(inst[,1][i] - speedupreal[i]))
sd(abs(instCost[,1][i] - speedupreal[i]))
sd(abs(hashW[,1][i] - speedupreal[i]))
sd(abs(hashPlusInst[,2][i] - speedupreal[i]))

print("cor")
cor(inst[,1][i], speedupreal[i])
cor(instCost[,1][i], speedupreal[i])
cor(hashW[,1][i] , speedupreal[i])
cor(hashPlusInst[,2][i] , speedupreal[i])
print("-----------------")
