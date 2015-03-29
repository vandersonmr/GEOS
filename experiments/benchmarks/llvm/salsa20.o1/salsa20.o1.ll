; ModuleID = 'salsa20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ptr = global i32 0, align 4
@outbuf = common global [16 x i32] zeroinitializer, align 16
@STATE = common global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [15 x i8] c"got:       %x\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"should be: %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @salsa20(i32* nocapture %out, i32* nocapture readonly %in) #0 {
for.cond3.preheader:
  %in385 = bitcast i32* %in to i8*
  %x = alloca [16 x i32], align 16
  %0 = bitcast [16 x i32]* %x to i8*
  tail call void @llvm.dbg.value(metadata i32* %out, i64 0, metadata !16, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata i32* %in, i64 0, metadata !17, metadata !42), !dbg !44
  call void @llvm.lifetime.start(i64 64, i8* %0) #2, !dbg !45
  tail call void @llvm.dbg.declare(metadata [16 x i32]* %x, metadata !19, metadata !42), !dbg !46
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !42), !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %in385, i64 64, i32 4, i1 false), !dbg !48
  %arrayidx6 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 0, !dbg !51
  %arrayidx7 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 12, !dbg !51
  %arrayidx11 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 4, !dbg !55
  %arrayidx21 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 8, !dbg !56
  %arrayidx45 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 5, !dbg !57
  %arrayidx46 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 1, !dbg !57
  %arrayidx54 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 9, !dbg !58
  %arrayidx65 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 13, !dbg !59
  %arrayidx89 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 10, !dbg !60
  %arrayidx90 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 6, !dbg !60
  %arrayidx98 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 14, !dbg !61
  %arrayidx109 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 2, !dbg !62
  %arrayidx133 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 15, !dbg !63
  %arrayidx134 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 11, !dbg !63
  %arrayidx142 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 3, !dbg !64
  %arrayidx153 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 7, !dbg !65
  %arrayidx6.promoted = load i32* %arrayidx6, align 16, !dbg !66, !tbaa !67
  %arrayidx7.promoted = load i32* %arrayidx7, align 16, !dbg !71, !tbaa !67
  %arrayidx11.promoted = load i32* %arrayidx11, align 16, !dbg !72, !tbaa !67
  %arrayidx21.promoted = load i32* %arrayidx21, align 16, !dbg !73, !tbaa !67
  %arrayidx45.promoted = load i32* %arrayidx45, align 4, !dbg !74, !tbaa !67
  %arrayidx46.promoted = load i32* %arrayidx46, align 4, !dbg !75, !tbaa !67
  %arrayidx54.promoted = load i32* %arrayidx54, align 4, !dbg !76, !tbaa !67
  %arrayidx65.promoted = load i32* %arrayidx65, align 4, !dbg !77, !tbaa !67
  %arrayidx89.promoted = load i32* %arrayidx89, align 8, !dbg !78, !tbaa !67
  %arrayidx90.promoted = load i32* %arrayidx90, align 8, !dbg !79, !tbaa !67
  %arrayidx98.promoted = load i32* %arrayidx98, align 8, !dbg !80, !tbaa !67
  %arrayidx109.promoted = load i32* %arrayidx109, align 8, !dbg !81, !tbaa !67
  %arrayidx133.promoted = load i32* %arrayidx133, align 4, !dbg !82, !tbaa !67
  %arrayidx134.promoted = load i32* %arrayidx134, align 4, !dbg !83, !tbaa !67
  %arrayidx142.promoted = load i32* %arrayidx142, align 4, !dbg !84, !tbaa !67
  %arrayidx153.promoted = load i32* %arrayidx153, align 4, !dbg !85, !tbaa !67
  br label %for.body5, !dbg !86

for.cond355.preheader:                            ; preds = %for.body5
  store i32 %xor220, i32* %arrayidx6, align 16, !dbg !66, !tbaa !67
  store i32 %xor319, i32* %arrayidx7, align 16, !dbg !71, !tbaa !67
  store i32 %xor253, i32* %arrayidx11, align 16, !dbg !72, !tbaa !67
  store i32 %xor286, i32* %arrayidx21, align 16, !dbg !73, !tbaa !67
  store i32 %xor264, i32* %arrayidx45, align 4, !dbg !74, !tbaa !67
  store i32 %xor187, i32* %arrayidx46, align 4, !dbg !75, !tbaa !67
  store i32 %xor297, i32* %arrayidx54, align 4, !dbg !76, !tbaa !67
  store i32 %xor330, i32* %arrayidx65, align 4, !dbg !77, !tbaa !67
  store i32 %xor308, i32* %arrayidx89, align 8, !dbg !78, !tbaa !67
  store i32 %xor231, i32* %arrayidx90, align 8, !dbg !79, !tbaa !67
  store i32 %xor341, i32* %arrayidx98, align 8, !dbg !80, !tbaa !67
  store i32 %xor198, i32* %arrayidx109, align 8, !dbg !81, !tbaa !67
  store i32 %xor352, i32* %arrayidx133, align 4, !dbg !82, !tbaa !67
  store i32 %xor275, i32* %arrayidx134, align 4, !dbg !83, !tbaa !67
  store i32 %xor209, i32* %arrayidx142, align 4, !dbg !84, !tbaa !67
  store i32 %xor242, i32* %arrayidx153, align 4, !dbg !85, !tbaa !67
  br label %for.body357, !dbg !87

for.body5:                                        ; preds = %for.cond3.preheader, %for.body5
  %1 = phi i32 [ %arrayidx153.promoted, %for.cond3.preheader ], [ %xor242, %for.body5 ], !dbg !51
  %2 = phi i32 [ %arrayidx142.promoted, %for.cond3.preheader ], [ %xor209, %for.body5 ], !dbg !51
  %3 = phi i32 [ %arrayidx134.promoted, %for.cond3.preheader ], [ %xor275, %for.body5 ], !dbg !51
  %4 = phi i32 [ %arrayidx133.promoted, %for.cond3.preheader ], [ %xor352, %for.body5 ], !dbg !51
  %5 = phi i32 [ %arrayidx109.promoted, %for.cond3.preheader ], [ %xor198, %for.body5 ], !dbg !51
  %6 = phi i32 [ %arrayidx98.promoted, %for.cond3.preheader ], [ %xor341, %for.body5 ], !dbg !51
  %7 = phi i32 [ %arrayidx90.promoted, %for.cond3.preheader ], [ %xor231, %for.body5 ], !dbg !51
  %8 = phi i32 [ %arrayidx89.promoted, %for.cond3.preheader ], [ %xor308, %for.body5 ], !dbg !51
  %9 = phi i32 [ %arrayidx65.promoted, %for.cond3.preheader ], [ %xor330, %for.body5 ], !dbg !51
  %10 = phi i32 [ %arrayidx54.promoted, %for.cond3.preheader ], [ %xor297, %for.body5 ], !dbg !51
  %11 = phi i32 [ %arrayidx46.promoted, %for.cond3.preheader ], [ %xor187, %for.body5 ], !dbg !51
  %12 = phi i32 [ %arrayidx45.promoted, %for.cond3.preheader ], [ %xor264, %for.body5 ], !dbg !51
  %13 = phi i32 [ %arrayidx21.promoted, %for.cond3.preheader ], [ %xor286, %for.body5 ], !dbg !51
  %14 = phi i32 [ %arrayidx11.promoted, %for.cond3.preheader ], [ %xor253, %for.body5 ], !dbg !51
  %15 = phi i32 [ %arrayidx7.promoted, %for.cond3.preheader ], [ %xor319, %for.body5 ], !dbg !51
  %16 = phi i32 [ %arrayidx6.promoted, %for.cond3.preheader ], [ %xor220, %for.body5 ], !dbg !51
  %i.1380 = phi i32 [ 20, %for.cond3.preheader ], [ %sub, %for.body5 ]
  %add = add i32 %15, %16, !dbg !51
  %shl = shl i32 %add, 7, !dbg !51
  %shr = lshr i32 %add, 25, !dbg !51
  %or = or i32 %shl, %shr, !dbg !51
  %xor = xor i32 %or, %14, !dbg !55
  %add14 = add i32 %xor, %16, !dbg !89
  %shl15 = shl i32 %add14, 9, !dbg !89
  %shr19 = lshr i32 %add14, 23, !dbg !89
  %or20 = or i32 %shl15, %shr19, !dbg !89
  %xor22 = xor i32 %or20, %13, !dbg !56
  %add25 = add i32 %xor22, %xor, !dbg !90
  %shl26 = shl i32 %add25, 13, !dbg !90
  %shr30 = lshr i32 %add25, 19, !dbg !90
  %or31 = or i32 %shl26, %shr30, !dbg !90
  %xor33 = xor i32 %or31, %15, !dbg !91
  %add36 = add i32 %xor33, %xor22, !dbg !92
  %shl37 = shl i32 %add36, 18, !dbg !92
  %shr41 = lshr i32 %add36, 14, !dbg !92
  %or42 = or i32 %shl37, %shr41, !dbg !92
  %xor44 = xor i32 %or42, %16, !dbg !93
  %add47 = add i32 %11, %12, !dbg !57
  %shl48 = shl i32 %add47, 7, !dbg !57
  %shr52 = lshr i32 %add47, 25, !dbg !57
  %or53 = or i32 %shl48, %shr52, !dbg !57
  %xor55 = xor i32 %or53, %10, !dbg !58
  %add58 = add i32 %xor55, %12, !dbg !94
  %shl59 = shl i32 %add58, 9, !dbg !94
  %shr63 = lshr i32 %add58, 23, !dbg !94
  %or64 = or i32 %shl59, %shr63, !dbg !94
  %xor66 = xor i32 %or64, %9, !dbg !59
  %add69 = add i32 %xor66, %xor55, !dbg !95
  %shl70 = shl i32 %add69, 13, !dbg !95
  %shr74 = lshr i32 %add69, 19, !dbg !95
  %or75 = or i32 %shl70, %shr74, !dbg !95
  %xor77 = xor i32 %or75, %11, !dbg !96
  %add80 = add i32 %xor77, %xor66, !dbg !97
  %shl81 = shl i32 %add80, 18, !dbg !97
  %shr85 = lshr i32 %add80, 14, !dbg !97
  %or86 = or i32 %shl81, %shr85, !dbg !97
  %xor88 = xor i32 %or86, %12, !dbg !98
  %add91 = add i32 %7, %8, !dbg !60
  %shl92 = shl i32 %add91, 7, !dbg !60
  %shr96 = lshr i32 %add91, 25, !dbg !60
  %or97 = or i32 %shl92, %shr96, !dbg !60
  %xor99 = xor i32 %or97, %6, !dbg !61
  %add102 = add i32 %xor99, %8, !dbg !99
  %shl103 = shl i32 %add102, 9, !dbg !99
  %shr107 = lshr i32 %add102, 23, !dbg !99
  %or108 = or i32 %shl103, %shr107, !dbg !99
  %xor110 = xor i32 %or108, %5, !dbg !62
  %add113 = add i32 %xor110, %xor99, !dbg !100
  %shl114 = shl i32 %add113, 13, !dbg !100
  %shr118 = lshr i32 %add113, 19, !dbg !100
  %or119 = or i32 %shl114, %shr118, !dbg !100
  %xor121 = xor i32 %or119, %7, !dbg !101
  %add124 = add i32 %xor121, %xor110, !dbg !102
  %shl125 = shl i32 %add124, 18, !dbg !102
  %shr129 = lshr i32 %add124, 14, !dbg !102
  %or130 = or i32 %shl125, %shr129, !dbg !102
  %xor132 = xor i32 %or130, %8, !dbg !103
  %add135 = add i32 %3, %4, !dbg !63
  %shl136 = shl i32 %add135, 7, !dbg !63
  %shr140 = lshr i32 %add135, 25, !dbg !63
  %or141 = or i32 %shl136, %shr140, !dbg !63
  %xor143 = xor i32 %or141, %2, !dbg !64
  %add146 = add i32 %xor143, %4, !dbg !104
  %shl147 = shl i32 %add146, 9, !dbg !104
  %shr151 = lshr i32 %add146, 23, !dbg !104
  %or152 = or i32 %shl147, %shr151, !dbg !104
  %xor154 = xor i32 %or152, %1, !dbg !65
  %add157 = add i32 %xor154, %xor143, !dbg !105
  %shl158 = shl i32 %add157, 13, !dbg !105
  %shr162 = lshr i32 %add157, 19, !dbg !105
  %or163 = or i32 %shl158, %shr162, !dbg !105
  %xor165 = xor i32 %or163, %3, !dbg !106
  %add168 = add i32 %xor165, %xor154, !dbg !107
  %shl169 = shl i32 %add168, 18, !dbg !107
  %shr173 = lshr i32 %add168, 14, !dbg !107
  %or174 = or i32 %shl169, %shr173, !dbg !107
  %xor176 = xor i32 %or174, %4, !dbg !108
  %add179 = add i32 %xor143, %xor44, !dbg !109
  %shl180 = shl i32 %add179, 7, !dbg !109
  %shr184 = lshr i32 %add179, 25, !dbg !109
  %or185 = or i32 %shl180, %shr184, !dbg !109
  %xor187 = xor i32 %or185, %xor77, !dbg !110
  %add190 = add i32 %xor187, %xor44, !dbg !111
  %shl191 = shl i32 %add190, 9, !dbg !111
  %shr195 = lshr i32 %add190, 23, !dbg !111
  %or196 = or i32 %shl191, %shr195, !dbg !111
  %xor198 = xor i32 %or196, %xor110, !dbg !112
  %add201 = add i32 %xor198, %xor187, !dbg !75
  %shl202 = shl i32 %add201, 13, !dbg !75
  %shr206 = lshr i32 %add201, 19, !dbg !75
  %or207 = or i32 %shl202, %shr206, !dbg !75
  %xor209 = xor i32 %or207, %xor143, !dbg !84
  %add212 = add i32 %xor209, %xor198, !dbg !81
  %shl213 = shl i32 %add212, 18, !dbg !81
  %shr217 = lshr i32 %add212, 14, !dbg !81
  %or218 = or i32 %shl213, %shr217, !dbg !81
  %xor220 = xor i32 %or218, %xor44, !dbg !66
  %add223 = add i32 %xor, %xor88, !dbg !113
  %shl224 = shl i32 %add223, 7, !dbg !113
  %shr228 = lshr i32 %add223, 25, !dbg !113
  %or229 = or i32 %shl224, %shr228, !dbg !113
  %xor231 = xor i32 %or229, %xor121, !dbg !114
  %add234 = add i32 %xor231, %xor88, !dbg !115
  %shl235 = shl i32 %add234, 9, !dbg !115
  %shr239 = lshr i32 %add234, 23, !dbg !115
  %or240 = or i32 %shl235, %shr239, !dbg !115
  %xor242 = xor i32 %or240, %xor154, !dbg !116
  %add245 = add i32 %xor242, %xor231, !dbg !79
  %shl246 = shl i32 %add245, 13, !dbg !79
  %shr250 = lshr i32 %add245, 19, !dbg !79
  %or251 = or i32 %shl246, %shr250, !dbg !79
  %xor253 = xor i32 %or251, %xor, !dbg !72
  %add256 = add i32 %xor253, %xor242, !dbg !85
  %shl257 = shl i32 %add256, 18, !dbg !85
  %shr261 = lshr i32 %add256, 14, !dbg !85
  %or262 = or i32 %shl257, %shr261, !dbg !85
  %xor264 = xor i32 %or262, %xor88, !dbg !74
  %add267 = add i32 %xor55, %xor132, !dbg !117
  %shl268 = shl i32 %add267, 7, !dbg !117
  %shr272 = lshr i32 %add267, 25, !dbg !117
  %or273 = or i32 %shl268, %shr272, !dbg !117
  %xor275 = xor i32 %or273, %xor165, !dbg !118
  %add278 = add i32 %xor275, %xor132, !dbg !119
  %shl279 = shl i32 %add278, 9, !dbg !119
  %shr283 = lshr i32 %add278, 23, !dbg !119
  %or284 = or i32 %shl279, %shr283, !dbg !119
  %xor286 = xor i32 %or284, %xor22, !dbg !120
  %add289 = add i32 %xor286, %xor275, !dbg !83
  %shl290 = shl i32 %add289, 13, !dbg !83
  %shr294 = lshr i32 %add289, 19, !dbg !83
  %or295 = or i32 %shl290, %shr294, !dbg !83
  %xor297 = xor i32 %or295, %xor55, !dbg !76
  %add300 = add i32 %xor297, %xor286, !dbg !73
  %shl301 = shl i32 %add300, 18, !dbg !73
  %shr305 = lshr i32 %add300, 14, !dbg !73
  %or306 = or i32 %shl301, %shr305, !dbg !73
  %xor308 = xor i32 %or306, %xor132, !dbg !78
  %add311 = add i32 %xor99, %xor176, !dbg !121
  %shl312 = shl i32 %add311, 7, !dbg !121
  %shr316 = lshr i32 %add311, 25, !dbg !121
  %or317 = or i32 %shl312, %shr316, !dbg !121
  %xor319 = xor i32 %or317, %xor33, !dbg !122
  %add322 = add i32 %xor319, %xor176, !dbg !123
  %shl323 = shl i32 %add322, 9, !dbg !123
  %shr327 = lshr i32 %add322, 23, !dbg !123
  %or328 = or i32 %shl323, %shr327, !dbg !123
  %xor330 = xor i32 %or328, %xor66, !dbg !124
  %add333 = add i32 %xor330, %xor319, !dbg !71
  %shl334 = shl i32 %add333, 13, !dbg !71
  %shr338 = lshr i32 %add333, 19, !dbg !71
  %or339 = or i32 %shl334, %shr338, !dbg !71
  %xor341 = xor i32 %or339, %xor99, !dbg !80
  %add344 = add i32 %xor341, %xor330, !dbg !77
  %shl345 = shl i32 %add344, 18, !dbg !77
  %shr349 = lshr i32 %add344, 14, !dbg !77
  %or350 = or i32 %shl345, %shr349, !dbg !77
  %xor352 = xor i32 %or350, %xor176, !dbg !82
  %sub = add nsw i32 %i.1380, -2, !dbg !125
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !18, metadata !42), !dbg !47
  %cmp4 = icmp eq i32 %sub, 0, !dbg !126
  br i1 %cmp4, label %for.cond355.preheader, label %for.body5, !dbg !86

for.body357:                                      ; preds = %for.body357, %for.cond355.preheader
  %indvars.iv = phi i64 [ 0, %for.cond355.preheader ], [ %indvars.iv.next, %for.body357 ]
  %arrayidx359 = getelementptr inbounds [16 x i32]* %x, i64 0, i64 %indvars.iv, !dbg !129
  %17 = load i32* %arrayidx359, align 4, !dbg !129, !tbaa !67
  %arrayidx361 = getelementptr inbounds i32* %in, i64 %indvars.iv, !dbg !131
  %18 = load i32* %arrayidx361, align 4, !dbg !131, !tbaa !67
  %add362 = add i32 %18, %17, !dbg !129
  %arrayidx364 = getelementptr inbounds i32* %out, i64 %indvars.iv, !dbg !132
  store i32 %add362, i32* %arrayidx364, align 4, !dbg !132, !tbaa !67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !87
  %exitcond = icmp eq i64 %indvars.iv.next, 16, !dbg !87
  br i1 %exitcond, label %for.end367, label %for.body357, !dbg !87

for.end367:                                       ; preds = %for.body357
  call void @llvm.lifetime.end(i64 64, i8* %0) #2, !dbg !133
  ret void, !dbg !133
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i32 @salsa() #0 {
entry:
  %0 = load i32* @ptr, align 4, !dbg !134, !tbaa !67
  %cmp = icmp eq i32 %0, 0, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  tail call void @salsa20(i32* getelementptr inbounds ([16 x i32]* @outbuf, i64 0, i64 0), i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0)), !dbg !137
  %1 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !139, !tbaa !67
  %inc = add i32 %1, 1, !dbg !139
  store i32 %inc, i32* getelementptr inbounds ([16 x i32]* @STATE, i64 0, i64 0), align 16, !dbg !139, !tbaa !67
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32* @ptr, align 4, !dbg !141, !tbaa !67
  %add = add i32 %2, 1, !dbg !141
  %and = and i32 %add, 15, !dbg !142
  store i32 %and, i32* @ptr, align 4, !dbg !143, !tbaa !67
  %idxprom = zext i32 %and to i64, !dbg !144
  %arrayidx = getelementptr inbounds [16 x i32]* @outbuf, i64 0, i64 %idxprom, !dbg !144
  %3 = load i32* %arrayidx, align 4, !dbg !144, !tbaa !67
  ret i32 %3, !dbg !145
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 537919488, i64 0, metadata !33, metadata !42), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !34, metadata !42), !dbg !147
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !42), !dbg !148
  br label %for.body, !dbg !149

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %i.021 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %0 = add nuw nsw i64 %indvars.iv, 3987450866, !dbg !151
  %sub = sub i32 -559038737, %i.021, !dbg !153
  %1 = trunc i64 %0 to i32, !dbg !154
  %xor = xor i32 %1, %sub, !dbg !154
  %arrayidx = getelementptr inbounds [16 x i32]* @STATE, i64 0, i64 %indvars.iv, !dbg !155
  store i32 %xor, i32* %arrayidx, align 4, !dbg !155, !tbaa !67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !149
  %inc = add nuw nsw i32 %i.021, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !32, metadata !42), !dbg !148
  %exitcond24 = icmp eq i64 %indvars.iv.next, 16, !dbg !149
  br i1 %exitcond24, label %for.cond2, label %for.body, !dbg !149

for.cond2:                                        ; preds = %for.body, %for.cond2
  %i.1 = phi i32 [ %inc6, %for.cond2 ], [ 0, %for.body ]
  %call = tail call i32 @salsa(), !dbg !157
  %inc6 = add nuw nsw i32 %i.1, 1, !dbg !160
  tail call void @llvm.dbg.value(metadata i32 %inc6, i64 0, metadata !32, metadata !42), !dbg !148
  %exitcond = icmp eq i32 %inc6, 537919489, !dbg !161
  br i1 %exitcond, label %for.end7, label %for.cond2, !dbg !161

for.end7:                                         ; preds = %for.cond2
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !31, metadata !42), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !31, metadata !42), !dbg !162
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %call) #2, !dbg !163
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 -162172867) #2, !dbg !164
  %cmp12 = icmp ne i32 %call, -162172867, !dbg !165
  %conv = zext i1 %cmp12 to i32, !dbg !165
  ret i32 %conv, !dbg !166
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !35, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c] [DW_LANG_C99]
!1 = !{!"salsa20.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x16\00uint64_t\0055\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [uint64_t] [line 55, size 0, align 0, offset 0] [from long unsigned int]
!5 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!6 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!7 = !{!8, !23, !26}
!8 = !{!"0x2e\00salsa20\00salsa20\00\0015\000\001\000\000\00256\001\0015", !1, !9, !10, null, void (i32*, i32*)* @salsa20, null, null, !15} ; [ DW_TAG_subprogram ] [line 15] [def] [salsa20]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint32_t]
!13 = !{!"0x16\00uint32_t\0051\000\000\000\000", !5, null, !14} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!14 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!15 = !{!16, !17, !18, !19}
!16 = !{!"0x101\00out\0016777231\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [out] [line 15]
!17 = !{!"0x101\00in\0033554447\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [in] [line 15]
!18 = !{!"0x100\00i\0016\000", !8, !9, !13}       ; [ DW_TAG_auto_variable ] [i] [line 16]
!19 = !{!"0x100\00x\0016\000", !8, !9, !20}       ; [ DW_TAG_auto_variable ] [x] [line 16]
!20 = !{!"0x1\00\000\00512\0032\000\000\000", null, null, !13, !21, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from uint32_t]
!21 = !{!22}
!22 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!23 = !{!"0x2e\00salsa\00salsa\00\0042\000\001\000\000\00256\001\0042", !1, !9, !24, null, i32 ()* @salsa, null, null, !2} ; [ DW_TAG_subprogram ] [line 42] [def] [salsa]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!13}
!26 = !{!"0x2e\00main\00main\00\0052\000\001\000\000\00256\001\0052", !1, !9, !27, null, i32 ()* @main, null, null, !30} ; [ DW_TAG_subprogram ] [line 52] [def] [main]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!31, !32, !33, !34}
!31 = !{!"0x100\00val\0053\000", !26, !9, !13}    ; [ DW_TAG_auto_variable ] [val] [line 53]
!32 = !{!"0x100\00i\0053\000", !26, !9, !13}      ; [ DW_TAG_auto_variable ] [i] [line 53]
!33 = !{!"0x100\00count\0058\000", !26, !9, !13}  ; [ DW_TAG_auto_variable ] [count] [line 58]
!34 = !{!"0x100\00offset\0059\000", !26, !9, !13} ; [ DW_TAG_auto_variable ] [offset] [line 59]
!35 = !{!36, !37, !38}
!36 = !{!"0x34\00ptr\00ptr\00\0012\000\001", null, !9, !13, i32* @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 12] [def]
!37 = !{!"0x34\00STATE\00STATE\00\0010\000\001", null, !9, !20, [16 x i32]* @STATE, null} ; [ DW_TAG_variable ] [STATE] [line 10] [def]
!38 = !{!"0x34\00outbuf\00outbuf\00\0011\000\001", null, !9, !20, [16 x i32]* @outbuf, null} ; [ DW_TAG_variable ] [outbuf] [line 11] [def]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 15, column: 23, scope: !8)
!44 = !MDLocation(line: 15, column: 40, scope: !8)
!45 = !MDLocation(line: 16, column: 3, scope: !8)
!46 = !MDLocation(line: 16, column: 15, scope: !8)
!47 = !MDLocation(line: 16, column: 12, scope: !8)
!48 = !MDLocation(line: 19, column: 5, scope: !49)
!49 = !{!"0xb\0018\003\001", !1, !50}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!50 = !{!"0xb\0018\003\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!51 = !MDLocation(line: 22, column: 14, scope: !52)
!52 = !{!"0xb\0021\0029\004", !1, !53}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!53 = !{!"0xb\0021\003\003", !1, !54}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!54 = !{!"0xb\0021\003\002", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!55 = !MDLocation(line: 22, column: 5, scope: !52)
!56 = !MDLocation(line: 22, column: 34, scope: !52)
!57 = !MDLocation(line: 24, column: 14, scope: !52)
!58 = !MDLocation(line: 24, column: 5, scope: !52)
!59 = !MDLocation(line: 24, column: 34, scope: !52)
!60 = !MDLocation(line: 26, column: 14, scope: !52)
!61 = !MDLocation(line: 26, column: 5, scope: !52)
!62 = !MDLocation(line: 26, column: 34, scope: !52)
!63 = !MDLocation(line: 28, column: 14, scope: !52)
!64 = !MDLocation(line: 28, column: 5, scope: !52)
!65 = !MDLocation(line: 28, column: 34, scope: !52)
!66 = !MDLocation(line: 31, column: 34, scope: !52)
!67 = !{!68, !68, i64 0}
!68 = !{!"int", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !MDLocation(line: 37, column: 14, scope: !52)
!72 = !MDLocation(line: 33, column: 5, scope: !52)
!73 = !MDLocation(line: 35, column: 43, scope: !52)
!74 = !MDLocation(line: 33, column: 34, scope: !52)
!75 = !MDLocation(line: 31, column: 14, scope: !52)
!76 = !MDLocation(line: 35, column: 5, scope: !52)
!77 = !MDLocation(line: 37, column: 43, scope: !52)
!78 = !MDLocation(line: 35, column: 34, scope: !52)
!79 = !MDLocation(line: 33, column: 14, scope: !52)
!80 = !MDLocation(line: 37, column: 5, scope: !52)
!81 = !MDLocation(line: 31, column: 43, scope: !52)
!82 = !MDLocation(line: 37, column: 34, scope: !52)
!83 = !MDLocation(line: 35, column: 14, scope: !52)
!84 = !MDLocation(line: 31, column: 5, scope: !52)
!85 = !MDLocation(line: 33, column: 43, scope: !52)
!86 = !MDLocation(line: 21, column: 3, scope: !54)
!87 = !MDLocation(line: 39, column: 3, scope: !88)
!88 = !{!"0xb\0039\003\005", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!89 = !MDLocation(line: 22, column: 43, scope: !52)
!90 = !MDLocation(line: 23, column: 14, scope: !52)
!91 = !MDLocation(line: 23, column: 5, scope: !52)
!92 = !MDLocation(line: 23, column: 43, scope: !52)
!93 = !MDLocation(line: 23, column: 34, scope: !52)
!94 = !MDLocation(line: 24, column: 43, scope: !52)
!95 = !MDLocation(line: 25, column: 14, scope: !52)
!96 = !MDLocation(line: 25, column: 5, scope: !52)
!97 = !MDLocation(line: 25, column: 43, scope: !52)
!98 = !MDLocation(line: 25, column: 34, scope: !52)
!99 = !MDLocation(line: 26, column: 43, scope: !52)
!100 = !MDLocation(line: 27, column: 14, scope: !52)
!101 = !MDLocation(line: 27, column: 5, scope: !52)
!102 = !MDLocation(line: 27, column: 43, scope: !52)
!103 = !MDLocation(line: 27, column: 34, scope: !52)
!104 = !MDLocation(line: 28, column: 43, scope: !52)
!105 = !MDLocation(line: 29, column: 14, scope: !52)
!106 = !MDLocation(line: 29, column: 5, scope: !52)
!107 = !MDLocation(line: 29, column: 43, scope: !52)
!108 = !MDLocation(line: 29, column: 34, scope: !52)
!109 = !MDLocation(line: 30, column: 14, scope: !52)
!110 = !MDLocation(line: 30, column: 5, scope: !52)
!111 = !MDLocation(line: 30, column: 43, scope: !52)
!112 = !MDLocation(line: 30, column: 34, scope: !52)
!113 = !MDLocation(line: 32, column: 14, scope: !52)
!114 = !MDLocation(line: 32, column: 5, scope: !52)
!115 = !MDLocation(line: 32, column: 43, scope: !52)
!116 = !MDLocation(line: 32, column: 34, scope: !52)
!117 = !MDLocation(line: 34, column: 14, scope: !52)
!118 = !MDLocation(line: 34, column: 5, scope: !52)
!119 = !MDLocation(line: 34, column: 43, scope: !52)
!120 = !MDLocation(line: 34, column: 34, scope: !52)
!121 = !MDLocation(line: 36, column: 14, scope: !52)
!122 = !MDLocation(line: 36, column: 5, scope: !52)
!123 = !MDLocation(line: 36, column: 43, scope: !52)
!124 = !MDLocation(line: 36, column: 34, scope: !52)
!125 = !MDLocation(line: 21, column: 21, scope: !53)
!126 = !MDLocation(line: 21, column: 15, scope: !127)
!127 = !{!"0xb\002", !1, !128}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!128 = !{!"0xb\001", !1, !53}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!129 = !MDLocation(line: 39, column: 35, scope: !130)
!130 = !{!"0xb\0039\003\006", !1, !88}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!131 = !MDLocation(line: 39, column: 42, scope: !130)
!132 = !MDLocation(line: 39, column: 26, scope: !130)
!133 = !MDLocation(line: 40, column: 1, scope: !8)
!134 = !MDLocation(line: 43, column: 6, scope: !135)
!135 = !{!"0xb\0043\006\007", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!136 = !MDLocation(line: 43, column: 6, scope: !23)
!137 = !MDLocation(line: 44, column: 5, scope: !138)
!138 = !{!"0xb\0043\0014\008", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!139 = !MDLocation(line: 45, column: 15, scope: !138)
!140 = !MDLocation(line: 46, column: 3, scope: !138)
!141 = !MDLocation(line: 48, column: 10, scope: !23)
!142 = !MDLocation(line: 48, column: 9, scope: !23)
!143 = !MDLocation(line: 48, column: 3, scope: !23)
!144 = !MDLocation(line: 49, column: 10, scope: !23)
!145 = !MDLocation(line: 49, column: 3, scope: !23)
!146 = !MDLocation(line: 58, column: 12, scope: !26)
!147 = !MDLocation(line: 59, column: 12, scope: !26)
!148 = !MDLocation(line: 53, column: 17, scope: !26)
!149 = !MDLocation(line: 62, column: 3, scope: !150)
!150 = !{!"0xb\0062\003\009", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!151 = !MDLocation(line: 63, column: 17, scope: !152)
!152 = !{!"0xb\0062\003\0010", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!153 = !MDLocation(line: 63, column: 37, scope: !152)
!154 = !MDLocation(line: 63, column: 16, scope: !152)
!155 = !MDLocation(line: 63, column: 5, scope: !152)
!156 = !MDLocation(line: 62, column: 18, scope: !152)
!157 = !MDLocation(line: 66, column: 5, scope: !158)
!158 = !{!"0xb\0065\003\0012", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!159 = !{!"0xb\0065\003\0011", !1, !26}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/salsa20.c]
!160 = !MDLocation(line: 65, column: 21, scope: !158)
!161 = !MDLocation(line: 65, column: 3, scope: !159)
!162 = !MDLocation(line: 53, column: 12, scope: !26)
!163 = !MDLocation(line: 71, column: 3, scope: !26)
!164 = !MDLocation(line: 72, column: 3, scope: !26)
!165 = !MDLocation(line: 73, column: 10, scope: !26)
!166 = !MDLocation(line: 73, column: 3, scope: !26)
