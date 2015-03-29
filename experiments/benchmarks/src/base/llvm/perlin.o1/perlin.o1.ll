; ModuleID = 'perlin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%e\0A\00", align 1
@p = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@permutation = internal unnamed_addr constant [256 x i32] [i32 151, i32 160, i32 137, i32 91, i32 90, i32 15, i32 131, i32 13, i32 201, i32 95, i32 96, i32 53, i32 194, i32 233, i32 7, i32 225, i32 140, i32 36, i32 103, i32 30, i32 69, i32 142, i32 8, i32 99, i32 37, i32 240, i32 21, i32 10, i32 23, i32 190, i32 6, i32 148, i32 247, i32 120, i32 234, i32 75, i32 0, i32 26, i32 197, i32 62, i32 94, i32 252, i32 219, i32 203, i32 117, i32 35, i32 11, i32 32, i32 57, i32 177, i32 33, i32 88, i32 237, i32 149, i32 56, i32 87, i32 174, i32 20, i32 125, i32 136, i32 171, i32 168, i32 68, i32 175, i32 74, i32 165, i32 71, i32 134, i32 139, i32 48, i32 27, i32 166, i32 77, i32 146, i32 158, i32 231, i32 83, i32 111, i32 229, i32 122, i32 60, i32 211, i32 133, i32 230, i32 220, i32 105, i32 92, i32 41, i32 55, i32 46, i32 245, i32 40, i32 244, i32 102, i32 143, i32 54, i32 65, i32 25, i32 63, i32 161, i32 1, i32 216, i32 80, i32 73, i32 209, i32 76, i32 132, i32 187, i32 208, i32 89, i32 18, i32 169, i32 200, i32 196, i32 135, i32 130, i32 116, i32 188, i32 159, i32 86, i32 164, i32 100, i32 109, i32 198, i32 173, i32 186, i32 3, i32 64, i32 52, i32 217, i32 226, i32 250, i32 124, i32 123, i32 5, i32 202, i32 38, i32 147, i32 118, i32 126, i32 255, i32 82, i32 85, i32 212, i32 207, i32 206, i32 59, i32 227, i32 47, i32 16, i32 58, i32 17, i32 182, i32 189, i32 28, i32 42, i32 223, i32 183, i32 170, i32 213, i32 119, i32 248, i32 152, i32 2, i32 44, i32 154, i32 163, i32 70, i32 221, i32 153, i32 101, i32 155, i32 167, i32 43, i32 172, i32 9, i32 129, i32 22, i32 39, i32 253, i32 19, i32 98, i32 108, i32 110, i32 79, i32 113, i32 224, i32 232, i32 178, i32 185, i32 112, i32 104, i32 218, i32 246, i32 97, i32 228, i32 251, i32 34, i32 242, i32 193, i32 238, i32 210, i32 144, i32 12, i32 191, i32 179, i32 162, i32 241, i32 81, i32 51, i32 145, i32 235, i32 249, i32 14, i32 239, i32 107, i32 49, i32 192, i32 214, i32 31, i32 181, i32 199, i32 106, i32 157, i32 184, i32 84, i32 204, i32 176, i32 115, i32 121, i32 50, i32 45, i32 127, i32 4, i32 150, i32 254, i32 138, i32 236, i32 205, i32 93, i32 222, i32 114, i32 67, i32 29, i32 24, i32 72, i32 243, i32 141, i32 128, i32 195, i32 78, i32 66, i32 215, i32 61, i32 156, i32 180], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call fastcc void @init(), !dbg !70
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !14, metadata !71), !dbg !72
  tail call void @llvm.dbg.value(metadata double -1.135257e+04, i64 0, metadata !10, metadata !71), !dbg !73
  br label %for.cond1.preheader, !dbg !74

for.cond1.preheader:                              ; preds = %entry, %for.inc12
  %sum.030 = phi double [ 0.000000e+00, %entry ], [ %sum.2.lcssa, %for.inc12 ]
  %x.029 = phi double [ -1.135257e+04, %entry ], [ %add13, %for.inc12 ]
  br label %for.cond4.preheader, !dbg !76

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc9
  %sum.128 = phi double [ %sum.030, %for.cond1.preheader ], [ %sum.2.lcssa, %for.inc9 ]
  %y.027 = phi double [ -3.461235e+02, %for.cond1.preheader ], [ %add10, %for.inc9 ]
  %cmp523 = fcmp olt double %y.027, 2.323450e+01, !dbg !79
  br i1 %cmp523, label %for.body6, label %for.inc9, !dbg !85

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %sum.225 = phi double [ %add, %for.body6 ], [ %sum.128, %for.cond4.preheader ]
  %y.124 = phi double [ %add8, %for.body6 ], [ %y.027, %for.cond4.preheader ]
  %call7 = tail call fastcc double @noise(double %x.029, double %y.124), !dbg !86
  %add = fadd double %sum.225, %call7, !dbg !87
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !14, metadata !71), !dbg !72
  %add8 = fadd double %y.124, 2.450000e+00, !dbg !88
  tail call void @llvm.dbg.value(metadata double %add8, i64 0, metadata !12, metadata !71), !dbg !89
  %cmp5 = fcmp olt double %add8, 2.323450e+01, !dbg !79
  br i1 %cmp5, label %for.body6, label %for.inc9, !dbg !85

for.inc9:                                         ; preds = %for.body6, %for.cond4.preheader
  %sum.2.lcssa = phi double [ %sum.128, %for.cond4.preheader ], [ %add, %for.body6 ]
  %y.1.lcssa = phi double [ %y.027, %for.cond4.preheader ], [ %add8, %for.body6 ]
  %add10 = fadd double %y.1.lcssa, 1.432500e+00, !dbg !90
  tail call void @llvm.dbg.value(metadata double %add10, i64 0, metadata !12, metadata !71), !dbg !89
  %cmp2 = fcmp olt double %add10, 1.241240e+02, !dbg !91
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc12, !dbg !76

for.inc12:                                        ; preds = %for.inc9
  %add13 = fadd double %x.029, 1.235000e-01, !dbg !94
  tail call void @llvm.dbg.value(metadata double %add13, i64 0, metadata !10, metadata !71), !dbg !73
  %cmp = fcmp olt double %add13, 2.356157e+04, !dbg !95
  br i1 %cmp, label %for.cond1.preheader, label %for.end14, !dbg !74

for.end14:                                        ; preds = %for.inc12
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %sum.2.lcssa) #6, !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind readonly uwtable
define internal fastcc double @noise(double %x, double %y) #1 {
entry:
  tail call void @llvm.dbg.value(metadata double -1.562350e+02, i64 0, metadata !21, metadata !71), !dbg !100
  %call = tail call double @floor(double %x) #5, !dbg !101
  %conv = fptosi double %call to i32, !dbg !102
  %and = and i32 %conv, 255, !dbg !102
  tail call void @llvm.dbg.value(metadata i32 %and, i64 0, metadata !22, metadata !71), !dbg !103
  %call1 = tail call double @floor(double %y) #5, !dbg !104
  %conv2 = fptosi double %call1 to i32, !dbg !105
  %and3 = and i32 %conv2, 255, !dbg !105
  tail call void @llvm.dbg.value(metadata i32 %and3, i64 0, metadata !23, metadata !71), !dbg !106
  tail call void @llvm.dbg.value(metadata i32 99, i64 0, metadata !24, metadata !71), !dbg !107
  %sub = fsub double %x, %call, !dbg !108
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !19, metadata !71), !dbg !109
  %sub9 = fsub double %y, %call1, !dbg !110
  tail call void @llvm.dbg.value(metadata double %sub9, i64 0, metadata !20, metadata !71), !dbg !111
  tail call void @llvm.dbg.value(metadata double 0x3FE87AE147AE1400, i64 0, metadata !21, metadata !71), !dbg !100
  %call12 = tail call fastcc double @fade(double %sub), !dbg !112
  tail call void @llvm.dbg.value(metadata double %call12, i64 0, metadata !25, metadata !71), !dbg !113
  %call13 = tail call fastcc double @fade(double %sub9), !dbg !114
  tail call void @llvm.dbg.value(metadata double %call13, i64 0, metadata !26, metadata !71), !dbg !115
  %call14 = tail call fastcc double @fade(double 0x3FE87AE147AE1400), !dbg !116
  tail call void @llvm.dbg.value(metadata double %call14, i64 0, metadata !27, metadata !71), !dbg !117
  %idxprom1 = zext i32 %and to i64, !dbg !118
  %arrayidx = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom1, !dbg !118
  %0 = load i32* %arrayidx, align 4, !dbg !118, !tbaa !119
  %add = add nsw i32 %0, %and3, !dbg !118
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !28, metadata !71), !dbg !123
  %idxprom15 = sext i32 %add to i64, !dbg !124
  %arrayidx16 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom15, !dbg !124
  %1 = load i32* %arrayidx16, align 4, !dbg !124, !tbaa !119
  %add17 = add nsw i32 %1, 99, !dbg !124
  tail call void @llvm.dbg.value(metadata i32 %add17, i64 0, metadata !29, metadata !71), !dbg !125
  %add18 = add nsw i32 %add, 1, !dbg !126
  %idxprom19 = sext i32 %add18 to i64, !dbg !127
  %arrayidx20 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom19, !dbg !127
  %2 = load i32* %arrayidx20, align 4, !dbg !127, !tbaa !119
  %add21 = add nsw i32 %2, 99, !dbg !127
  tail call void @llvm.dbg.value(metadata i32 %add21, i64 0, metadata !30, metadata !71), !dbg !128
  %add22 = add nuw nsw i32 %and, 1, !dbg !129
  %idxprom232 = zext i32 %add22 to i64, !dbg !130
  %arrayidx24 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom232, !dbg !130
  %3 = load i32* %arrayidx24, align 4, !dbg !130, !tbaa !119
  %add25 = add nsw i32 %3, %and3, !dbg !130
  tail call void @llvm.dbg.value(metadata i32 %add25, i64 0, metadata !31, metadata !71), !dbg !131
  %idxprom26 = sext i32 %add25 to i64, !dbg !132
  %arrayidx27 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom26, !dbg !132
  %4 = load i32* %arrayidx27, align 4, !dbg !132, !tbaa !119
  %add28 = add nsw i32 %4, 99, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %add28, i64 0, metadata !32, metadata !71), !dbg !133
  %add29 = add nsw i32 %add25, 1, !dbg !134
  %idxprom30 = sext i32 %add29 to i64, !dbg !135
  %arrayidx31 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom30, !dbg !135
  %5 = load i32* %arrayidx31, align 4, !dbg !135, !tbaa !119
  %add32 = add nsw i32 %5, 99, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %add32, i64 0, metadata !33, metadata !71), !dbg !136
  %idxprom33 = sext i32 %add17 to i64, !dbg !137
  %arrayidx34 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom33, !dbg !137
  %6 = load i32* %arrayidx34, align 4, !dbg !137, !tbaa !119
  %call35 = tail call fastcc double @grad(i32 %6, double %sub, double %sub9, double 0x3FE87AE147AE1400), !dbg !138
  %idxprom36 = sext i32 %add28 to i64, !dbg !139
  %arrayidx37 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom36, !dbg !139
  %7 = load i32* %arrayidx37, align 4, !dbg !139, !tbaa !119
  %sub38 = fadd double %sub, -1.000000e+00, !dbg !140
  %call39 = tail call fastcc double @grad(i32 %7, double %sub38, double %sub9, double 0x3FE87AE147AE1400), !dbg !141
  %call40 = tail call fastcc double @lerp(double %call12, double %call35, double %call39), !dbg !142
  %idxprom41 = sext i32 %add21 to i64, !dbg !143
  %arrayidx42 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom41, !dbg !143
  %8 = load i32* %arrayidx42, align 4, !dbg !143, !tbaa !119
  %sub43 = fadd double %sub9, -1.000000e+00, !dbg !144
  %call44 = tail call fastcc double @grad(i32 %8, double %sub, double %sub43, double 0x3FE87AE147AE1400), !dbg !145
  %idxprom45 = sext i32 %add32 to i64, !dbg !146
  %arrayidx46 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom45, !dbg !146
  %9 = load i32* %arrayidx46, align 4, !dbg !146, !tbaa !119
  %call49 = tail call fastcc double @grad(i32 %9, double %sub38, double %sub43, double 0x3FE87AE147AE1400), !dbg !147
  %call50 = tail call fastcc double @lerp(double %call12, double %call44, double %call49), !dbg !148
  %call51 = tail call fastcc double @lerp(double %call13, double %call40, double %call50), !dbg !149
  %add52 = add nsw i32 %1, 100, !dbg !150
  %idxprom53 = sext i32 %add52 to i64, !dbg !151
  %arrayidx54 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom53, !dbg !151
  %10 = load i32* %arrayidx54, align 4, !dbg !151, !tbaa !119
  %call56 = tail call fastcc double @grad(i32 %10, double %sub, double %sub9, double 0xBFCE147AE147B000), !dbg !152
  %add57 = add nsw i32 %4, 100, !dbg !153
  %idxprom58 = sext i32 %add57 to i64, !dbg !154
  %arrayidx59 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom58, !dbg !154
  %11 = load i32* %arrayidx59, align 4, !dbg !154, !tbaa !119
  %call62 = tail call fastcc double @grad(i32 %11, double %sub38, double %sub9, double 0xBFCE147AE147B000), !dbg !155
  %call63 = tail call fastcc double @lerp(double %call12, double %call56, double %call62), !dbg !156
  %add64 = add nsw i32 %2, 100, !dbg !157
  %idxprom65 = sext i32 %add64 to i64, !dbg !158
  %arrayidx66 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom65, !dbg !158
  %12 = load i32* %arrayidx66, align 4, !dbg !158, !tbaa !119
  %call69 = tail call fastcc double @grad(i32 %12, double %sub, double %sub43, double 0xBFCE147AE147B000), !dbg !159
  %add70 = add nsw i32 %5, 100, !dbg !160
  %idxprom71 = sext i32 %add70 to i64, !dbg !161
  %arrayidx72 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %idxprom71, !dbg !161
  %13 = load i32* %arrayidx72, align 4, !dbg !161, !tbaa !119
  %call76 = tail call fastcc double @grad(i32 %13, double %sub38, double %sub43, double 0xBFCE147AE147B000), !dbg !162
  %call77 = tail call fastcc double @lerp(double %call12, double %call69, double %call76), !dbg !163
  %call78 = tail call fastcc double @lerp(double %call13, double %call63, double %call77), !dbg !164
  %call79 = tail call fastcc double @lerp(double %call14, double %call51, double %call78), !dbg !165
  ret double %call79, !dbg !166
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare double @floor(double) #3

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @fade(double %t) #4 {
entry:
  tail call void @llvm.dbg.value(metadata double %t, i64 0, metadata !54, metadata !71), !dbg !167
  %mul = fmul double %t, %t, !dbg !168
  %mul1 = fmul double %mul, %t, !dbg !168
  %mul2 = fmul double %t, 6.000000e+00, !dbg !169
  %sub = fadd double %mul2, -1.500000e+01, !dbg !169
  %mul3 = fmul double %sub, %t, !dbg !170
  %add = fadd double %mul3, 1.000000e+01, !dbg !170
  %mul4 = fmul double %mul1, %add, !dbg !168
  ret double %mul4, !dbg !171
}

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @lerp(double %t, double %a, double %b) #4 {
entry:
  tail call void @llvm.dbg.value(metadata double %t, i64 0, metadata !47, metadata !71), !dbg !172
  tail call void @llvm.dbg.value(metadata double %a, i64 0, metadata !48, metadata !71), !dbg !173
  tail call void @llvm.dbg.value(metadata double %b, i64 0, metadata !49, metadata !71), !dbg !174
  %sub = fsub double %b, %a, !dbg !175
  %mul = fmul double %sub, %t, !dbg !176
  %add = fadd double %mul, %a, !dbg !177
  ret double %add, !dbg !178
}

; Function Attrs: nounwind readnone uwtable
define internal fastcc double @grad(i32 %hash, double %x, double %y, double %z) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %hash, i64 0, metadata !38, metadata !71), !dbg !179
  tail call void @llvm.dbg.value(metadata double %x, i64 0, metadata !39, metadata !71), !dbg !180
  tail call void @llvm.dbg.value(metadata double %y, i64 0, metadata !40, metadata !71), !dbg !181
  tail call void @llvm.dbg.value(metadata double %z, i64 0, metadata !41, metadata !71), !dbg !182
  %and = and i32 %hash, 15, !dbg !183
  tail call void @llvm.dbg.value(metadata i32 %and, i64 0, metadata !42, metadata !71), !dbg !184
  %cmp = icmp ult i32 %and, 8, !dbg !185
  %cond = select i1 %cmp, double %x, double %y, !dbg !185
  tail call void @llvm.dbg.value(metadata double %cond, i64 0, metadata !43, metadata !71), !dbg !186
  %cmp1 = icmp ult i32 %and, 4, !dbg !187
  br i1 %cmp1, label %cond.end10, label %cond.false3, !dbg !187

cond.false3:                                      ; preds = %entry
  %0 = and i32 %hash, 13, !dbg !188
  %1 = icmp eq i32 %0, 12, !dbg !188
  %cond9 = select i1 %1, double %x, double %z, !dbg !188
  br label %cond.end10, !dbg !188

cond.end10:                                       ; preds = %entry, %cond.false3
  %cond11 = phi double [ %cond9, %cond.false3 ], [ %y, %entry ], !dbg !187
  tail call void @llvm.dbg.value(metadata double %cond11, i64 0, metadata !44, metadata !71), !dbg !190
  %and12 = and i32 %hash, 1, !dbg !191
  %cmp13 = icmp eq i32 %and12, 0, !dbg !192
  br i1 %cmp13, label %cond.end16, label %cond.false15, !dbg !192

cond.false15:                                     ; preds = %cond.end10
  %sub = fsub double -0.000000e+00, %cond, !dbg !193
  br label %cond.end16, !dbg !192

cond.end16:                                       ; preds = %cond.end10, %cond.false15
  %cond17 = phi double [ %sub, %cond.false15 ], [ %cond, %cond.end10 ], !dbg !192
  %and18 = and i32 %hash, 2, !dbg !194
  %cmp19 = icmp eq i32 %and18, 0, !dbg !197
  br i1 %cmp19, label %cond.end23, label %cond.false21, !dbg !197

cond.false21:                                     ; preds = %cond.end16
  %sub22 = fsub double -0.000000e+00, %cond11, !dbg !198
  br label %cond.end23, !dbg !197

cond.end23:                                       ; preds = %cond.end16, %cond.false21
  %cond24 = phi double [ %sub22, %cond.false21 ], [ %cond11, %cond.end16 ], !dbg !197
  %add = fadd double %cond17, %cond24, !dbg !199
  ret double %add, !dbg !202
}

; Function Attrs: nounwind uwtable
define internal fastcc void @init() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !71), !dbg !203
  br label %for.body, !dbg !204

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [256 x i32]* @permutation, i64 0, i64 %indvars.iv, !dbg !206
  %0 = load i32* %arrayidx, align 4, !dbg !206, !tbaa !119
  %arrayidx2 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %indvars.iv, !dbg !208
  store i32 %0, i32* %arrayidx2, align 4, !dbg !208, !tbaa !119
  %1 = add nuw nsw i64 %indvars.iv, 256, !dbg !209
  %arrayidx4 = getelementptr inbounds [512 x i32]* @p, i64 0, i64 %1, !dbg !210
  store i32 %0, i32* %arrayidx4, align 4, !dbg !210, !tbaa !119
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !204
  %exitcond = icmp eq i64 %indvars.iv.next, 256, !dbg !204
  br i1 %exitcond, label %for.end, label %for.body, !dbg !204

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68}
!llvm.ident = !{!69}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !58, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c] [DW_LANG_C99]
!1 = !{!"perlin.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !15, !34, !45, !50, !55}
!6 = !{!"0x2e\00main\00main\00\0064\000\001\000\000\000\001\0064", !1, !7, !8, null, i32 ()* @main, null, null, !9} ; [ DW_TAG_subprogram ] [line 64] [def] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!10, !12, !13, !14}
!10 = !{!"0x100\00x\0067\000", !6, !7, !11}       ; [ DW_TAG_auto_variable ] [x] [line 67]
!11 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!12 = !{!"0x100\00y\0067\000", !6, !7, !11}       ; [ DW_TAG_auto_variable ] [y] [line 67]
!13 = !{!"0x100\00z\0067\000", !6, !7, !11}       ; [ DW_TAG_auto_variable ] [z] [line 67]
!14 = !{!"0x100\00sum\0067\000", !6, !7, !11}     ; [ DW_TAG_auto_variable ] [sum] [line 67]
!15 = !{!"0x2e\00noise\00noise\00\0035\001\001\000\000\00256\001\0035", !1, !7, !16, null, double (double, double)* @noise, null, null, !18} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [noise]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!11, !11, !11, !11}
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!19 = !{!"0x101\00x\0016777251\000", !15, !7, !11} ; [ DW_TAG_arg_variable ] [x] [line 35]
!20 = !{!"0x101\00y\0033554467\000", !15, !7, !11} ; [ DW_TAG_arg_variable ] [y] [line 35]
!21 = !{!"0x101\00z\0050331683\000", !15, !7, !11} ; [ DW_TAG_arg_variable ] [z] [line 35]
!22 = !{!"0x100\00X\0036\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [X] [line 36]
!23 = !{!"0x100\00Y\0037\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [Y] [line 37]
!24 = !{!"0x100\00Z\0038\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [Z] [line 38]
!25 = !{!"0x100\00u\0042\000", !15, !7, !11}      ; [ DW_TAG_auto_variable ] [u] [line 42]
!26 = !{!"0x100\00v\0043\000", !15, !7, !11}      ; [ DW_TAG_auto_variable ] [v] [line 43]
!27 = !{!"0x100\00w\0044\000", !15, !7, !11}      ; [ DW_TAG_auto_variable ] [w] [line 44]
!28 = !{!"0x100\00A\0045\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [A] [line 45]
!29 = !{!"0x100\00AA\0045\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [AA] [line 45]
!30 = !{!"0x100\00AB\0045\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [AB] [line 45]
!31 = !{!"0x100\00B\0046\000", !15, !7, !4}       ; [ DW_TAG_auto_variable ] [B] [line 46]
!32 = !{!"0x100\00BA\0046\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [BA] [line 46]
!33 = !{!"0x100\00BB\0046\000", !15, !7, !4}      ; [ DW_TAG_auto_variable ] [BB] [line 46]
!34 = !{!"0x2e\00grad\00grad\00\0028\001\001\000\000\00256\001\0028", !1, !7, !35, null, double (i32, double, double, double)* @grad, null, null, !37} ; [ DW_TAG_subprogram ] [line 28] [local] [def] [grad]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!11, !4, !11, !11, !11}
!37 = !{!38, !39, !40, !41, !42, !43, !44}
!38 = !{!"0x101\00hash\0016777244\000", !34, !7, !4} ; [ DW_TAG_arg_variable ] [hash] [line 28]
!39 = !{!"0x101\00x\0033554460\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [x] [line 28]
!40 = !{!"0x101\00y\0050331676\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [y] [line 28]
!41 = !{!"0x101\00z\0067108892\000", !34, !7, !11} ; [ DW_TAG_arg_variable ] [z] [line 28]
!42 = !{!"0x100\00h\0029\000", !34, !7, !4}       ; [ DW_TAG_auto_variable ] [h] [line 29]
!43 = !{!"0x100\00u\0030\000", !34, !7, !11}      ; [ DW_TAG_auto_variable ] [u] [line 30]
!44 = !{!"0x100\00v\0031\000", !34, !7, !11}      ; [ DW_TAG_auto_variable ] [v] [line 31]
!45 = !{!"0x2e\00lerp\00lerp\00\0026\001\001\000\000\00256\001\0026", !1, !7, !16, null, double (double, double, double)* @lerp, null, null, !46} ; [ DW_TAG_subprogram ] [line 26] [local] [def] [lerp]
!46 = !{!47, !48, !49}
!47 = !{!"0x101\00t\0016777242\000", !45, !7, !11} ; [ DW_TAG_arg_variable ] [t] [line 26]
!48 = !{!"0x101\00a\0033554458\000", !45, !7, !11} ; [ DW_TAG_arg_variable ] [a] [line 26]
!49 = !{!"0x101\00b\0050331674\000", !45, !7, !11} ; [ DW_TAG_arg_variable ] [b] [line 26]
!50 = !{!"0x2e\00fade\00fade\00\0024\001\001\000\000\00256\001\0024", !1, !7, !51, null, double (double)* @fade, null, null, !53} ; [ DW_TAG_subprogram ] [line 24] [local] [def] [fade]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!11, !11}
!53 = !{!54}
!54 = !{!"0x101\00t\0016777240\000", !50, !7, !11} ; [ DW_TAG_arg_variable ] [t] [line 24]
!55 = !{!"0x2e\00init\00init\00\0058\001\001\000\000\000\001\0058", !1, !7, !8, null, void ()* @init, null, null, !56} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [init]
!56 = !{!57}
!57 = !{!"0x100\00i\0059\000", !55, !7, !4}       ; [ DW_TAG_auto_variable ] [i] [line 59]
!58 = !{!59, !63}
!59 = !{!"0x34\00p\00p\00\007\001\001", null, !7, !60, [512 x i32]* @p, null} ; [ DW_TAG_variable ] [p] [line 7] [local] [def]
!60 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !61, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!61 = !{!62}
!62 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!63 = !{!"0x34\00permutation\00permutation\00\009\001\001", null, !7, !64, [256 x i32]* @permutation, null} ; [ DW_TAG_variable ] [permutation] [line 9] [local] [def]
!64 = !{!"0x1\00\000\008192\0032\000\000\000", null, null, !4, !65, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from int]
!65 = !{!66}
!66 = !{!"0x21\000\00256"}                        ; [ DW_TAG_subrange_type ] [0, 255]
!67 = !{i32 2, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 2}
!69 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!70 = !MDLocation(line: 65, column: 3, scope: !6)
!71 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!72 = !MDLocation(line: 67, column: 19, scope: !6)
!73 = !MDLocation(line: 67, column: 10, scope: !6)
!74 = !MDLocation(line: 73, column: 3, scope: !75)
!75 = !{!"0xb\0073\003\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!76 = !MDLocation(line: 74, column: 5, scope: !77)
!77 = !{!"0xb\0074\005\002", !1, !78}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!78 = !{!"0xb\0073\003\001", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!79 = !MDLocation(line: 75, column: 26, scope: !80)
!80 = !{!"0xb\002", !1, !81}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!81 = !{!"0xb\001", !1, !82}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!82 = !{!"0xb\0075\007\005", !1, !83}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!83 = !{!"0xb\0075\007\004", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!84 = !{!"0xb\0074\005\003", !1, !77}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!85 = !MDLocation(line: 75, column: 7, scope: !83)
!86 = !MDLocation(line: 77, column: 16, scope: !82)
!87 = !MDLocation(line: 77, column: 9, scope: !82)
!88 = !MDLocation(line: 75, column: 39, scope: !82)
!89 = !MDLocation(line: 67, column: 13, scope: !6)
!90 = !MDLocation(line: 74, column: 38, scope: !84)
!91 = !MDLocation(line: 74, column: 25, scope: !92)
!92 = !{!"0xb\002", !1, !93}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!93 = !{!"0xb\001", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!94 = !MDLocation(line: 73, column: 37, scope: !78)
!95 = !MDLocation(line: 73, column: 23, scope: !96)
!96 = !{!"0xb\002", !1, !97}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!97 = !{!"0xb\001", !1, !78}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!98 = !MDLocation(line: 79, column: 3, scope: !6)
!99 = !MDLocation(line: 80, column: 3, scope: !6)
!100 = !MDLocation(line: 35, column: 48, scope: !15)
!101 = !MDLocation(line: 36, column: 16, scope: !15)
!102 = !MDLocation(line: 36, column: 11, scope: !15)
!103 = !MDLocation(line: 36, column: 7, scope: !15)
!104 = !MDLocation(line: 37, column: 16, scope: !15)
!105 = !MDLocation(line: 37, column: 11, scope: !15)
!106 = !MDLocation(line: 37, column: 7, scope: !15)
!107 = !MDLocation(line: 38, column: 7, scope: !15)
!108 = !MDLocation(line: 39, column: 3, scope: !15)
!109 = !MDLocation(line: 35, column: 28, scope: !15)
!110 = !MDLocation(line: 40, column: 3, scope: !15)
!111 = !MDLocation(line: 35, column: 38, scope: !15)
!112 = !MDLocation(line: 42, column: 14, scope: !15)
!113 = !MDLocation(line: 42, column: 10, scope: !15)
!114 = !MDLocation(line: 43, column: 14, scope: !15)
!115 = !MDLocation(line: 43, column: 10, scope: !15)
!116 = !MDLocation(line: 44, column: 13, scope: !15)
!117 = !MDLocation(line: 44, column: 9, scope: !15)
!118 = !MDLocation(line: 45, column: 11, scope: !15)
!119 = !{!120, !120, i64 0}
!120 = !{!"int", !121, i64 0}
!121 = !{!"omnipotent char", !122, i64 0}
!122 = !{!"Simple C/C++ TBAA"}
!123 = !MDLocation(line: 45, column: 7, scope: !15)
!124 = !MDLocation(line: 45, column: 26, scope: !15)
!125 = !MDLocation(line: 45, column: 21, scope: !15)
!126 = !MDLocation(line: 45, column: 41, scope: !15)
!127 = !MDLocation(line: 45, column: 39, scope: !15)
!128 = !MDLocation(line: 45, column: 34, scope: !15)
!129 = !MDLocation(line: 46, column: 13, scope: !15)
!130 = !MDLocation(line: 46, column: 11, scope: !15)
!131 = !MDLocation(line: 46, column: 7, scope: !15)
!132 = !MDLocation(line: 46, column: 26, scope: !15)
!133 = !MDLocation(line: 46, column: 21, scope: !15)
!134 = !MDLocation(line: 46, column: 41, scope: !15)
!135 = !MDLocation(line: 46, column: 39, scope: !15)
!136 = !MDLocation(line: 46, column: 34, scope: !15)
!137 = !MDLocation(line: 48, column: 39, scope: !15)
!138 = !MDLocation(line: 48, column: 34, scope: !15)
!139 = !MDLocation(line: 49, column: 39, scope: !15)
!140 = !MDLocation(line: 49, column: 48, scope: !15)
!141 = !MDLocation(line: 49, column: 34, scope: !15)
!142 = !MDLocation(line: 48, column: 26, scope: !15)
!143 = !MDLocation(line: 50, column: 39, scope: !15)
!144 = !MDLocation(line: 50, column: 53, scope: !15)
!145 = !MDLocation(line: 50, column: 34, scope: !15)
!146 = !MDLocation(line: 51, column: 39, scope: !15)
!147 = !MDLocation(line: 51, column: 34, scope: !15)
!148 = !MDLocation(line: 50, column: 26, scope: !15)
!149 = !MDLocation(line: 48, column: 18, scope: !15)
!150 = !MDLocation(line: 52, column: 41, scope: !15)
!151 = !MDLocation(line: 52, column: 39, scope: !15)
!152 = !MDLocation(line: 52, column: 34, scope: !15)
!153 = !MDLocation(line: 53, column: 41, scope: !15)
!154 = !MDLocation(line: 53, column: 39, scope: !15)
!155 = !MDLocation(line: 53, column: 34, scope: !15)
!156 = !MDLocation(line: 52, column: 26, scope: !15)
!157 = !MDLocation(line: 54, column: 41, scope: !15)
!158 = !MDLocation(line: 54, column: 39, scope: !15)
!159 = !MDLocation(line: 54, column: 34, scope: !15)
!160 = !MDLocation(line: 55, column: 41, scope: !15)
!161 = !MDLocation(line: 55, column: 39, scope: !15)
!162 = !MDLocation(line: 55, column: 34, scope: !15)
!163 = !MDLocation(line: 54, column: 26, scope: !15)
!164 = !MDLocation(line: 52, column: 18, scope: !15)
!165 = !MDLocation(line: 48, column: 10, scope: !15)
!166 = !MDLocation(line: 48, column: 3, scope: !15)
!167 = !MDLocation(line: 24, column: 27, scope: !50)
!168 = !MDLocation(line: 24, column: 39, scope: !50)
!169 = !MDLocation(line: 24, column: 57, scope: !50)
!170 = !MDLocation(line: 24, column: 52, scope: !50)
!171 = !MDLocation(line: 24, column: 32, scope: !50)
!172 = !MDLocation(line: 26, column: 27, scope: !45)
!173 = !MDLocation(line: 26, column: 37, scope: !45)
!174 = !MDLocation(line: 26, column: 47, scope: !45)
!175 = !MDLocation(line: 26, column: 68, scope: !45)
!176 = !MDLocation(line: 26, column: 63, scope: !45)
!177 = !MDLocation(line: 26, column: 59, scope: !45)
!178 = !MDLocation(line: 26, column: 52, scope: !45)
!179 = !MDLocation(line: 28, column: 24, scope: !34)
!180 = !MDLocation(line: 28, column: 37, scope: !34)
!181 = !MDLocation(line: 28, column: 47, scope: !34)
!182 = !MDLocation(line: 28, column: 57, scope: !34)
!183 = !MDLocation(line: 29, column: 11, scope: !34)
!184 = !MDLocation(line: 29, column: 7, scope: !34)
!185 = !MDLocation(line: 30, column: 14, scope: !34)
!186 = !MDLocation(line: 30, column: 10, scope: !34)
!187 = !MDLocation(line: 31, column: 14, scope: !34)
!188 = !MDLocation(line: 31, column: 24, scope: !189)
!189 = !{!"0xb\002", !1, !34}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!190 = !MDLocation(line: 31, column: 10, scope: !34)
!191 = !MDLocation(line: 32, column: 12, scope: !34)
!192 = !MDLocation(line: 32, column: 11, scope: !34)
!193 = !MDLocation(line: 32, column: 28, scope: !34)
!194 = !MDLocation(line: 32, column: 36, scope: !195)
!195 = !{!"0xb\004", !1, !196}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!196 = !{!"0xb\003", !1, !34}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!197 = !MDLocation(line: 32, column: 35, scope: !34)
!198 = !MDLocation(line: 32, column: 52, scope: !34)
!199 = !MDLocation(line: 32, column: 10, scope: !200)
!200 = !{!"0xb\008", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!201 = !{!"0xb\007", !1, !34}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!202 = !MDLocation(line: 32, column: 3, scope: !34)
!203 = !MDLocation(line: 59, column: 7, scope: !55)
!204 = !MDLocation(line: 60, column: 3, scope: !205)
!205 = !{!"0xb\0060\003\006", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!206 = !MDLocation(line: 61, column: 23, scope: !207)
!207 = !{!"0xb\0060\003\007", !1, !205}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/perlin.c]
!208 = !MDLocation(line: 61, column: 16, scope: !207)
!209 = !MDLocation(line: 61, column: 7, scope: !207)
!210 = !MDLocation(line: 61, column: 5, scope: !207)
