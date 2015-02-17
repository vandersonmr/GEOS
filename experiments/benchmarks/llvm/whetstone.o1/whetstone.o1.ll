; ModuleID = 'whetstone.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = common global double 0.000000e+00, align 8
@T1 = common global double 0.000000e+00, align 8
@T2 = common global double 0.000000e+00, align 8
@E1 = common global [5 x double] zeroinitializer, align 16
@J = common global i32 0, align 4
@K = common global i32 0, align 4
@L = common global i32 0, align 4
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %Z = alloca double, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !98), !dbg !99
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !98), !dbg !100
  tail call void @llvm.dbg.value(metadata i64 100000, i64 0, metadata !40, metadata !98), !dbg !101
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !98), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !98), !dbg !103
  %cmp416 = icmp sgt i32 %argc, 1, !dbg !104
  br i1 %cmp416, label %while.body.lr.ph, label %LCONT.preheader, !dbg !105

while.body.lr.ph:                                 ; preds = %entry
  %0 = sext i32 %argc to i64, !dbg !105
  br label %while.body, !dbg !105

LCONT.preheader:                                  ; preds = %if.end18, %entry
  %continuous.0.lcssa = phi i32 [ 0, %entry ], [ %continuous.1, %if.end18 ]
  %loopstart.0.lcssa = phi i64 [ 100000, %entry ], [ %loopstart.1, %if.end18 ]
  %mul = mul nsw i64 %loopstart.0.lcssa, 12, !dbg !106
  %mul20 = mul nsw i64 %loopstart.0.lcssa, 14, !dbg !107
  %mul21 = mul nsw i64 %loopstart.0.lcssa, 345, !dbg !108
  %mul22 = mul nsw i64 %loopstart.0.lcssa, 210, !dbg !109
  %mul23 = shl nsw i64 %loopstart.0.lcssa, 5, !dbg !110
  %mul24 = mul nsw i64 %loopstart.0.lcssa, 899, !dbg !111
  %mul25 = mul nsw i64 %loopstart.0.lcssa, 616, !dbg !112
  %mul26 = mul nsw i64 %loopstart.0.lcssa, 93, !dbg !113
  %cmp50386 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !114
  %cmp78394 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !117
  %cmp89396 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !120
  %cmp117399 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !123
  %cmp153402 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !126
  %cmp191408 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !129
  %cmp204410 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !132
  %cmp235412 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !135
  %tobool = icmp eq i32 %continuous.0.lcssa, 0, !dbg !138
  br label %LCONT, !dbg !139

while.body:                                       ; preds = %while.body.lr.ph, %if.end18
  %indvars.iv = phi i64 [ 1, %while.body.lr.ph ], [ %indvars.iv.next, %if.end18 ]
  %continuous.0419 = phi i32 [ 0, %while.body.lr.ph ], [ %continuous.1, %if.end18 ]
  %loopstart.0418 = phi i64 [ 100000, %while.body.lr.ph ], [ %loopstart.1, %if.end18 ]
  %arrayidx = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !140
  %1 = load i8** %arrayidx, align 8, !dbg !140, !tbaa !143
  %call = tail call i32 @strncmp(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i64 2) #6, !dbg !140
  %cmp1 = icmp eq i32 %call, 0, !dbg !140
  br i1 %cmp1, label %if.end18, label %lor.lhs.false, !dbg !147

lor.lhs.false:                                    ; preds = %while.body
  %2 = load i8* %1, align 1, !dbg !148, !tbaa !149
  %cmp5 = icmp eq i8 %2, 99, !dbg !148
  br i1 %cmp5, label %if.end18, label %if.else, !dbg !147

if.else:                                          ; preds = %lor.lhs.false
  %call9 = tail call i64 @atol(i8* %1) #6, !dbg !150
  %cmp10 = icmp sgt i64 %call9, 0, !dbg !150
  br i1 %cmp10, label %if.end18, label %if.else16, !dbg !152

if.else16:                                        ; preds = %if.else
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !153, !tbaa !143
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %3) #7, !dbg !155
  br label %return, !dbg !156

if.end18:                                         ; preds = %if.else, %while.body, %lor.lhs.false
  %loopstart.1 = phi i64 [ %loopstart.0418, %lor.lhs.false ], [ %loopstart.0418, %while.body ], [ %call9, %if.else ]
  %continuous.1 = phi i32 [ 1, %lor.lhs.false ], [ 1, %while.body ], [ %continuous.0419, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !105
  %cmp = icmp slt i64 %indvars.iv.next, %0, !dbg !104
  br i1 %cmp, label %while.body, label %LCONT.preheader, !dbg !105

LCONT:                                            ; preds = %LCONT.preheader, %if.then247
  %call19 = tail call i64 @time(i64* null) #5, !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %call19, i64 0, metadata !41, metadata !98), !dbg !157
  store double 4.999750e-01, double* @T, align 8, !dbg !158, !tbaa !159
  store double 5.002500e-01, double* @T1, align 8, !dbg !161, !tbaa !159
  store double 2.000000e+00, double* @T2, align 8, !dbg !162, !tbaa !159
  tail call void @llvm.dbg.value(metadata i64 %loopstart.1, i64 0, metadata !37, metadata !98), !dbg !163
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !98), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !39, metadata !98), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !19, metadata !98), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !20, metadata !98), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !21, metadata !98), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 %mul21, i64 0, metadata !22, metadata !98), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %mul22, i64 0, metadata !23, metadata !98), !dbg !169
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !24, metadata !98), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %mul24, i64 0, metadata !25, metadata !98), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 %mul25, i64 0, metadata !26, metadata !98), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !98), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 %mul26, i64 0, metadata !28, metadata !98), !dbg !174
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !29, metadata !98), !dbg !175
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !31, metadata !98), !dbg !176
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !32, metadata !98), !dbg !177
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !33, metadata !98), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  tail call void @POUT(i64 0, i64 0, i64 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !180
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !182, !tbaa !159
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !183, !tbaa !159
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !184, !tbaa !159
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !185, !tbaa !159
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  %5 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !186, !tbaa !159
  %6 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !188, !tbaa !159
  br i1 %cmp50386, label %if.then75, label %for.body52.lr.ph, !dbg !189

for.body52.lr.ph:                                 ; preds = %LCONT
  %7 = load double* @T, align 8, !dbg !190, !tbaa !159
  %.promoted = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !192, !tbaa !159
  %.promoted390 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !193, !tbaa !159
  %.promoted393 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !194, !tbaa !159
  br label %for.body52, !dbg !189

for.body52:                                       ; preds = %for.body52, %for.body52.lr.ph
  %8 = phi double [ %.promoted393, %for.body52.lr.ph ], [ %mul60, %for.body52 ], !dbg !195
  %mul69391 = phi double [ %.promoted390, %for.body52.lr.ph ], [ %mul69, %for.body52 ], !dbg !195
  %mul64389 = phi double [ %.promoted, %for.body52.lr.ph ], [ %mul64, %for.body52 ], !dbg !195
  %9 = phi double [ %6, %for.body52.lr.ph ], [ %mul60, %for.body52 ]
  %10 = phi double [ %5, %for.body52.lr.ph ], [ %mul56, %for.body52 ]
  %I.1387 = phi i64 [ 1, %for.body52.lr.ph ], [ %inc71, %for.body52 ]
  %add53 = fadd double %10, %9, !dbg !195
  %add54 = fadd double %add53, %mul64389, !dbg !195
  %sub55 = fsub double %add54, %mul69391, !dbg !195
  %mul56 = fmul double %sub55, %7, !dbg !196
  %add57 = fadd double %mul56, %8, !dbg !197
  %sub58 = fsub double %add57, %mul64389, !dbg !197
  %add59 = fadd double %sub58, %mul69391, !dbg !197
  %mul60 = fmul double %add59, %7, !dbg !198
  %sub61 = fsub double %mul56, %mul60, !dbg !199
  %add62 = fadd double %sub61, %mul64389, !dbg !199
  %add63 = fadd double %add62, %mul69391, !dbg !199
  %mul64 = fmul double %add63, %7, !dbg !200
  %add66 = fsub double %mul60, %mul56, !dbg !201
  %add67 = fadd double %mul64, %add66, !dbg !201
  %add68 = fadd double %mul69391, %add67, !dbg !201
  %mul69 = fmul double %7, %add68, !dbg !202
  %inc71 = add nuw nsw i64 %I.1387, 1, !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %inc71, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp50 = icmp slt i64 %I.1387, %mul, !dbg !114
  br i1 %cmp50, label %for.body52, label %for.cond49.if.then75_crit_edge, !dbg !189

for.cond49.if.then75_crit_edge:                   ; preds = %for.body52
  store double %mul64, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !192, !tbaa !159
  store double %mul69, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !193, !tbaa !159
  store double %mul56, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !204, !tbaa !159
  store double %mul60, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !194, !tbaa !159
  br label %if.then75, !dbg !189

if.then75:                                        ; preds = %for.cond49.if.then75_crit_edge, %LCONT
  %.lcssa381 = phi double [ %mul60, %for.cond49.if.then75_crit_edge ], [ %6, %LCONT ]
  %.lcssa = phi double [ %mul56, %for.cond49.if.then75_crit_edge ], [ %5, %LCONT ]
  %11 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !205, !tbaa !159
  %12 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !206, !tbaa !159
  tail call void @POUT(i64 %mul, i64 %mul20, i64 %mul, double %.lcssa, double %.lcssa381, double %11, double %12), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp78394, label %if.then86, label %for.body80, !dbg !208

for.body80:                                       ; preds = %if.then75, %for.body80
  %I.2395 = phi i64 [ %inc82, %for.body80 ], [ 1, %if.then75 ]
  tail call void @PA(double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 0)), !dbg !209
  %inc82 = add nuw nsw i64 %I.2395, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata i64 %inc82, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp78 = icmp slt i64 %I.2395, %mul20, !dbg !117
  br i1 %cmp78, label %for.body80, label %if.then86, !dbg !208

if.then86:                                        ; preds = %for.body80, %if.then75
  %13 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !211, !tbaa !159
  %14 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !213, !tbaa !159
  %15 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !214, !tbaa !159
  %16 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !215, !tbaa !159
  tail call void @POUT(i64 %mul20, i64 %mul, i64 %mul, double %13, double %14, double %15, double %16), !dbg !216
  store i32 1, i32* @J, align 4, !dbg !217, !tbaa !218
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp89396, label %if.then112, label %for.body91, !dbg !220

for.body91:                                       ; preds = %if.then86, %for.body91
  %17 = phi i32 [ %18, %for.body91 ], [ 1, %if.then86 ]
  %I.3397 = phi i64 [ %inc108, %for.body91 ], [ 1, %if.then86 ]
  %18 = xor i32 %17, 1
  %inc108 = add nuw nsw i64 %I.3397, 1, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp89 = icmp slt i64 %I.3397, %mul21, !dbg !120
  br i1 %cmp89, label %for.body91, label %for.cond88.if.then112_crit_edge, !dbg !220

for.cond88.if.then112_crit_edge:                  ; preds = %for.body91
  store i32 %18, i32* @J, align 4, !dbg !222, !tbaa !218
  br label %if.then112, !dbg !220

if.then112:                                       ; preds = %for.cond88.if.then112_crit_edge, %if.then86
  %.lcssa382 = phi i32 [ %18, %for.cond88.if.then112_crit_edge ], [ 1, %if.then86 ]
  %conv113 = sext i32 %.lcssa382 to i64, !dbg !225
  tail call void @POUT(i64 %mul21, i64 %conv113, i64 %conv113, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !227
  store i32 1, i32* @J, align 4, !dbg !228, !tbaa !218
  store i32 2, i32* @K, align 4, !dbg !229, !tbaa !218
  store i32 3, i32* @L, align 4, !dbg !230, !tbaa !218
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp117399, label %if.then148, label %for.body119.lr.ph, !dbg !231

for.body119.lr.ph:                                ; preds = %if.then112
  %K.promoted = load i32* @K, align 4, !dbg !232, !tbaa !218
  %L.promoted = load i32* @L, align 4, !dbg !234, !tbaa !218
  br label %for.body119, !dbg !231

for.body119:                                      ; preds = %for.body119, %for.body119.lr.ph
  %19 = phi i32 [ %L.promoted, %for.body119.lr.ph ], [ %mul130, %for.body119 ], !dbg !235
  %20 = phi i32 [ %K.promoted, %for.body119.lr.ph ], [ %sub127, %for.body119 ], !dbg !235
  %21 = phi i32 [ 1, %for.body119.lr.ph ], [ %mul123, %for.body119 ]
  %I.4400 = phi i64 [ 1, %for.body119.lr.ph ], [ %inc144, %for.body119 ]
  %sub120 = sub nsw i32 %20, %21, !dbg !235
  %mul121 = mul nsw i32 %sub120, %21, !dbg !236
  %sub122 = sub nsw i32 %19, %20, !dbg !237
  %mul123 = mul nsw i32 %mul121, %sub122, !dbg !236
  %sub127 = mul nsw i32 %mul123, %20, !dbg !238
  %sub128 = sub nsw i32 %19, %sub127, !dbg !239
  %add129 = add nsw i32 %sub127, %mul123, !dbg !240
  %mul130 = mul nsw i32 %sub128, %add129, !dbg !241
  %add131 = add nsw i32 %sub127, %mul123, !dbg !242
  %add132 = add nsw i32 %add131, %mul130, !dbg !242
  %conv133 = sitofp i32 %add132 to double, !dbg !242
  %sub134 = add nsw i32 %mul130, -1, !dbg !243
  %idxprom135 = sext i32 %sub134 to i64, !dbg !244
  %arrayidx136 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom135, !dbg !244
  store double %conv133, double* %arrayidx136, align 8, !dbg !244, !tbaa !159
  %mul137 = mul nsw i32 %sub127, %mul123, !dbg !245
  %mul138 = mul nsw i32 %mul137, %mul130, !dbg !245
  %conv139 = sitofp i32 %mul138 to double, !dbg !245
  %sub140 = add nsw i32 %sub127, -1, !dbg !246
  %idxprom141 = sext i32 %sub140 to i64, !dbg !247
  %arrayidx142 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom141, !dbg !247
  store double %conv139, double* %arrayidx142, align 8, !dbg !247, !tbaa !159
  %inc144 = add nuw nsw i64 %I.4400, 1, !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp117 = icmp slt i64 %I.4400, %mul22, !dbg !123
  br i1 %cmp117, label %for.body119, label %for.cond116.if.then148_crit_edge, !dbg !231

for.cond116.if.then148_crit_edge:                 ; preds = %for.body119
  store i32 %sub127, i32* @K, align 4, !dbg !232, !tbaa !218
  store i32 %mul130, i32* @L, align 4, !dbg !234, !tbaa !218
  store i32 %mul123, i32* @J, align 4, !dbg !249, !tbaa !218
  br label %if.then148, !dbg !231

if.then148:                                       ; preds = %for.cond116.if.then148_crit_edge, %if.then112
  %.lcssa383 = phi i32 [ %mul123, %for.cond116.if.then148_crit_edge ], [ 1, %if.then112 ]
  %conv149 = sext i32 %.lcssa383 to i64, !dbg !249
  %22 = load i32* @K, align 4, !dbg !251, !tbaa !218
  %conv150 = sext i32 %22 to i64, !dbg !251
  %23 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !252, !tbaa !159
  %24 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !253, !tbaa !159
  %25 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !254, !tbaa !159
  %26 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !255, !tbaa !159
  tail call void @POUT(i64 %mul22, i64 %conv149, i64 %conv150, double %23, double %24, double %25, double %26), !dbg !256
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !34, metadata !98), !dbg !257
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !35, metadata !98), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp153402, label %if.then186, label %for.body155, !dbg !259

for.body155:                                      ; preds = %if.then148, %for.body155
  %I.5405 = phi i64 [ %inc182, %for.body155 ], [ 1, %if.then148 ]
  %Y.0404 = phi double [ %mul180, %for.body155 ], [ 5.000000e-01, %if.then148 ]
  %X.0403 = phi double [ %mul167, %for.body155 ], [ 5.000000e-01, %if.then148 ]
  %27 = load double* @T, align 8, !dbg !260, !tbaa !159
  %28 = load double* @T2, align 8, !dbg !262, !tbaa !159
  %call156 = tail call double @sin(double %X.0403) #5, !dbg !263
  %mul157 = fmul double %28, %call156, !dbg !262
  %call158 = tail call double @cos(double %X.0403) #5, !dbg !264
  %mul159 = fmul double %mul157, %call158, !dbg !262
  %add160 = fadd double %X.0403, %Y.0404, !dbg !265
  %call161 = tail call double @cos(double %add160) #5, !dbg !266
  %sub162 = fsub double %X.0403, %Y.0404, !dbg !267
  %call163 = tail call double @cos(double %sub162) #5, !dbg !268
  %add164 = fadd double %call161, %call163, !dbg !266
  %sub165 = fadd double %add164, -1.000000e+00, !dbg !266
  %div = fdiv double %mul159, %sub165, !dbg !262
  %call166 = tail call double @atan(double %div) #5, !dbg !269
  %mul167 = fmul double %27, %call166, !dbg !260
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !34, metadata !98), !dbg !257
  %29 = load double* @T, align 8, !dbg !270, !tbaa !159
  %30 = load double* @T2, align 8, !dbg !271, !tbaa !159
  %call168 = tail call double @sin(double %Y.0404) #5, !dbg !272
  %mul169 = fmul double %30, %call168, !dbg !271
  %call170 = tail call double @cos(double %Y.0404) #5, !dbg !273
  %mul171 = fmul double %mul169, %call170, !dbg !271
  %add172 = fadd double %Y.0404, %mul167, !dbg !274
  %call173 = tail call double @cos(double %add172) #5, !dbg !275
  %sub174 = fsub double %mul167, %Y.0404, !dbg !276
  %call175 = tail call double @cos(double %sub174) #5, !dbg !277
  %add176 = fadd double %call173, %call175, !dbg !275
  %sub177 = fadd double %add176, -1.000000e+00, !dbg !275
  %div178 = fdiv double %mul171, %sub177, !dbg !271
  %call179 = tail call double @atan(double %div178) #5, !dbg !278
  %mul180 = fmul double %29, %call179, !dbg !270
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !35, metadata !98), !dbg !258
  %inc182 = add nuw nsw i64 %I.5405, 1, !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %inc182, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp153 = icmp slt i64 %I.5405, %mul23, !dbg !126
  br i1 %cmp153, label %for.body155, label %if.then186, !dbg !259

if.then186:                                       ; preds = %for.body155, %if.then148
  %Y.0.lcssa = phi double [ 5.000000e-01, %if.then148 ], [ %mul180, %for.body155 ]
  %X.0.lcssa = phi double [ 5.000000e-01, %if.then148 ], [ %mul167, %for.body155 ]
  %31 = load i32* @J, align 4, !dbg !280, !tbaa !218
  %conv187 = sext i32 %31 to i64, !dbg !280
  %32 = load i32* @K, align 4, !dbg !282, !tbaa !218
  %conv188 = sext i32 %32 to i64, !dbg !282
  tail call void @POUT(i64 %mul23, i64 %conv187, i64 %conv188, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa), !dbg !283
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !34, metadata !98), !dbg !257
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !35, metadata !98), !dbg !258
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !284
  store double 1.000000e+00, double* %Z, align 8, !dbg !285, !tbaa !159
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp191408, label %if.then199, label %for.body193, !dbg !286

for.body193:                                      ; preds = %if.then186, %for.body193
  %I.6409 = phi i64 [ %inc195, %for.body193 ], [ 1, %if.then186 ]
  tail call void @llvm.dbg.value(metadata double* %Z, i64 0, metadata !36, metadata !98), !dbg !284
  call void @P3(double 1.000000e+00, double 1.000000e+00, double* %Z), !dbg !287
  %inc195 = add nuw nsw i64 %I.6409, 1, !dbg !288
  tail call void @llvm.dbg.value(metadata i64 %inc195, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp191 = icmp slt i64 %I.6409, %mul24, !dbg !129
  br i1 %cmp191, label %for.body193, label %if.then199, !dbg !286

if.then199:                                       ; preds = %for.body193, %if.then186
  %33 = load i32* @J, align 4, !dbg !289, !tbaa !218
  %conv200 = sext i32 %33 to i64, !dbg !289
  %34 = load i32* @K, align 4, !dbg !291, !tbaa !218
  %conv201 = sext i32 %34 to i64, !dbg !291
  tail call void @llvm.dbg.value(metadata double* %Z, i64 0, metadata !36, metadata !98), !dbg !284
  %35 = load double* %Z, align 8, !dbg !292, !tbaa !159
  tail call void @POUT(i64 %mul24, i64 %conv200, i64 %conv201, double 1.000000e+00, double 1.000000e+00, double %35, double %35), !dbg !293
  store i32 1, i32* @J, align 4, !dbg !294, !tbaa !218
  store i32 2, i32* @K, align 4, !dbg !295, !tbaa !218
  store i32 3, i32* @L, align 4, !dbg !296, !tbaa !218
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !297, !tbaa !159
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !298, !tbaa !159
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !299, !tbaa !159
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp204410, label %if.then212, label %for.body206, !dbg !300

for.body206:                                      ; preds = %if.then199, %for.body206
  %I.7411 = phi i64 [ %inc208, %for.body206 ], [ 1, %if.then199 ]
  tail call void @P0(), !dbg !301
  %inc208 = add nuw nsw i64 %I.7411, 1, !dbg !302
  tail call void @llvm.dbg.value(metadata i64 %inc208, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp204 = icmp slt i64 %I.7411, %mul25, !dbg !132
  br i1 %cmp204, label %for.body206, label %if.then212, !dbg !300

if.then212:                                       ; preds = %for.body206, %if.then199
  %36 = load i32* @J, align 4, !dbg !303, !tbaa !218
  %conv213 = sext i32 %36 to i64, !dbg !303
  %37 = load i32* @K, align 4, !dbg !305, !tbaa !218
  %conv214 = sext i32 %37 to i64, !dbg !305
  %38 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !306, !tbaa !159
  %39 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !307, !tbaa !159
  %40 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !308, !tbaa !159
  %41 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !309, !tbaa !159
  tail call void @POUT(i64 %mul25, i64 %conv213, i64 %conv214, double %38, double %39, double %40, double %41), !dbg !310
  store i32 2, i32* @J, align 4, !dbg !311, !tbaa !218
  store i32 3, i32* @K, align 4, !dbg !312, !tbaa !218
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  tail call void @POUT(i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00), !dbg !313
  tail call void @llvm.dbg.value(metadata double 7.500000e-01, i64 0, metadata !34, metadata !98), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !179
  br i1 %cmp235412, label %if.then247, label %for.body237, !dbg !315

for.body237:                                      ; preds = %if.then212, %for.body237
  %I.9414 = phi i64 [ %inc243, %for.body237 ], [ 1, %if.then212 ]
  %X.1413 = phi double [ %call241, %for.body237 ], [ 7.500000e-01, %if.then212 ]
  %call238 = tail call double @log(double %X.1413) #5, !dbg !316
  %42 = load double* @T1, align 8, !dbg !317, !tbaa !159
  %div239 = fdiv double %call238, %42, !dbg !316
  %call240 = tail call double @exp(double %div239) #5, !dbg !318
  %call241 = tail call double @sqrt(double %call240) #5, !dbg !319
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !34, metadata !98), !dbg !257
  %inc243 = add nuw nsw i64 %I.9414, 1, !dbg !320
  tail call void @llvm.dbg.value(metadata i64 %inc243, i64 0, metadata !17, metadata !98), !dbg !179
  %cmp235 = icmp slt i64 %I.9414, %mul26, !dbg !135
  br i1 %cmp235, label %for.body237, label %if.then247, !dbg !315

if.then247:                                       ; preds = %for.body237, %if.then212
  %X.1.lcssa = phi double [ 7.500000e-01, %if.then212 ], [ %call241, %for.body237 ]
  %43 = load i32* @J, align 4, !dbg !321, !tbaa !218
  %conv248 = sext i32 %43 to i64, !dbg !321
  %44 = load i32* @K, align 4, !dbg !323, !tbaa !218
  %conv249 = sext i32 %44 to i64, !dbg !323
  tail call void @POUT(i64 %mul26, i64 %conv248, i64 %conv249, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa), !dbg !324
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !39, metadata !98), !dbg !164
  %call256 = tail call i64 @time(i64* null) #5, !dbg !325
  tail call void @llvm.dbg.value(metadata i64 %call256, i64 0, metadata !42, metadata !98), !dbg !326
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !327
  br i1 %tobool, label %return, label %LCONT, !dbg !138

return:                                           ; preds = %if.then247, %if.else16
  %retval.0 = phi i32 [ 1, %if.else16 ], [ 0, %if.then247 ]
  ret i32 %retval.0, !dbg !328
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) #1

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i64 @atol(i8* nocapture nonnull readonly %__nptr) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !83, metadata !98), !dbg !329
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !330
  ret i64 %call, !dbg !331
}

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %N, i64 0, metadata !68, metadata !98), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 %J, i64 0, metadata !69, metadata !98), !dbg !333
  tail call void @llvm.dbg.value(metadata i64 %K, i64 0, metadata !70, metadata !98), !dbg !334
  tail call void @llvm.dbg.value(metadata double %X1, i64 0, metadata !71, metadata !98), !dbg !335
  tail call void @llvm.dbg.value(metadata double %X2, i64 0, metadata !72, metadata !98), !dbg !336
  tail call void @llvm.dbg.value(metadata double %X3, i64 0, metadata !73, metadata !98), !dbg !337
  tail call void @llvm.dbg.value(metadata double %X4, i64 0, metadata !74, metadata !98), !dbg !338
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #5, !dbg !339
  ret void, !dbg !340
}

; Function Attrs: nounwind uwtable
define void @PA(double* nocapture %E) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %E, i64 0, metadata !51, metadata !98), !dbg !341
  store i32 0, i32* @J, align 4, !dbg !342, !tbaa !218
  %arrayidx = getelementptr inbounds double* %E, i64 1, !dbg !343
  %arrayidx1 = getelementptr inbounds double* %E, i64 2, !dbg !344
  %arrayidx2 = getelementptr inbounds double* %E, i64 3, !dbg !345
  %arrayidx4 = getelementptr inbounds double* %E, i64 4, !dbg !346
  br label %L10, !dbg !342

L10:                                              ; preds = %L10, %entry
  %add3353 = phi i32 [ %add33, %L10 ], [ 0, %entry ], !dbg !343
  %0 = load double* %arrayidx, align 8, !dbg !343, !tbaa !159
  %1 = load double* %arrayidx1, align 8, !dbg !344, !tbaa !159
  %add = fadd double %0, %1, !dbg !343
  %2 = load double* %arrayidx2, align 8, !dbg !345, !tbaa !159
  %add3 = fadd double %add, %2, !dbg !343
  %3 = load double* %arrayidx4, align 8, !dbg !346, !tbaa !159
  %sub = fsub double %add3, %3, !dbg !343
  %4 = load double* @T, align 8, !dbg !347, !tbaa !159
  %mul = fmul double %sub, %4, !dbg !348
  store double %mul, double* %arrayidx, align 8, !dbg !349, !tbaa !159
  %5 = load double* %arrayidx1, align 8, !dbg !350, !tbaa !159
  %add8 = fadd double %mul, %5, !dbg !351
  %6 = load double* %arrayidx2, align 8, !dbg !352, !tbaa !159
  %sub10 = fsub double %add8, %6, !dbg !351
  %7 = load double* %arrayidx4, align 8, !dbg !353, !tbaa !159
  %add12 = fadd double %sub10, %7, !dbg !351
  %8 = load double* @T, align 8, !dbg !354, !tbaa !159
  %mul13 = fmul double %add12, %8, !dbg !355
  store double %mul13, double* %arrayidx1, align 8, !dbg !356, !tbaa !159
  %9 = load double* %arrayidx, align 8, !dbg !357, !tbaa !159
  %sub17 = fsub double %9, %mul13, !dbg !357
  %10 = load double* %arrayidx2, align 8, !dbg !358, !tbaa !159
  %add19 = fadd double %sub17, %10, !dbg !357
  %11 = load double* %arrayidx4, align 8, !dbg !359, !tbaa !159
  %add21 = fadd double %add19, %11, !dbg !357
  %12 = load double* @T, align 8, !dbg !360, !tbaa !159
  %mul22 = fmul double %add21, %12, !dbg !361
  store double %mul22, double* %arrayidx2, align 8, !dbg !362, !tbaa !159
  %13 = load double* %arrayidx, align 8, !dbg !363, !tbaa !159
  %14 = load double* %arrayidx1, align 8, !dbg !364, !tbaa !159
  %add27 = fsub double %14, %13, !dbg !365
  %add29 = fadd double %mul22, %add27, !dbg !365
  %15 = load double* %arrayidx4, align 8, !dbg !366, !tbaa !159
  %add31 = fadd double %15, %add29, !dbg !365
  %16 = load double* @T2, align 8, !dbg !367, !tbaa !159
  %div = fdiv double %add31, %16, !dbg !368
  store double %div, double* %arrayidx4, align 8, !dbg !369, !tbaa !159
  %add33 = add nuw nsw i32 %add3353, 1, !dbg !370
  %exitcond = icmp eq i32 %add33, 6, !dbg !371
  br i1 %exitcond, label %if.end, label %L10, !dbg !371

if.end:                                           ; preds = %L10
  store i32 6, i32* @J, align 4, !dbg !370, !tbaa !218
  ret void, !dbg !372
}

; Function Attrs: nounwind
declare double @atan(double) #3

; Function Attrs: nounwind
declare double @sin(double) #3

; Function Attrs: nounwind
declare double @cos(double) #3

; Function Attrs: nounwind uwtable
define void @P3(double %X, double %Y, double* nocapture %Z) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %X, i64 0, metadata !59, metadata !98), !dbg !373
  tail call void @llvm.dbg.value(metadata double %Y, i64 0, metadata !60, metadata !98), !dbg !374
  tail call void @llvm.dbg.value(metadata double* %Z, i64 0, metadata !61, metadata !98), !dbg !375
  tail call void @llvm.dbg.value(metadata double %X, i64 0, metadata !62, metadata !98), !dbg !376
  tail call void @llvm.dbg.value(metadata double %Y, i64 0, metadata !63, metadata !98), !dbg !377
  %0 = load double* @T, align 8, !dbg !378, !tbaa !159
  %add = fadd double %X, %Y, !dbg !379
  %mul = fmul double %add, %0, !dbg !378
  tail call void @llvm.dbg.value(metadata double %mul, i64 0, metadata !62, metadata !98), !dbg !376
  %add1 = fadd double %mul, %Y, !dbg !380
  %mul2 = fmul double %0, %add1, !dbg !381
  tail call void @llvm.dbg.value(metadata double %mul2, i64 0, metadata !63, metadata !98), !dbg !377
  %add3 = fadd double %mul, %mul2, !dbg !382
  %1 = load double* @T2, align 8, !dbg !383, !tbaa !159
  %div = fdiv double %add3, %1, !dbg !384
  store double %div, double* %Z, align 8, !dbg !385, !tbaa !159
  ret void, !dbg !386
}

; Function Attrs: nounwind uwtable
define void @P0() #0 {
entry:
  %0 = load i32* @K, align 4, !dbg !387, !tbaa !218
  %idxprom = sext i32 %0 to i64, !dbg !388
  %arrayidx = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom, !dbg !388
  %1 = load double* %arrayidx, align 8, !dbg !388, !tbaa !159
  %2 = load i32* @J, align 4, !dbg !389, !tbaa !218
  %idxprom1 = sext i32 %2 to i64, !dbg !390
  %arrayidx2 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom1, !dbg !390
  store double %1, double* %arrayidx2, align 8, !dbg !390, !tbaa !159
  %3 = load i32* @L, align 4, !dbg !391, !tbaa !218
  %idxprom3 = sext i32 %3 to i64, !dbg !392
  %arrayidx4 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom3, !dbg !392
  %4 = load double* %arrayidx4, align 8, !dbg !392, !tbaa !159
  %5 = load i32* @K, align 4, !dbg !393, !tbaa !218
  %idxprom5 = sext i32 %5 to i64, !dbg !394
  %arrayidx6 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom5, !dbg !394
  store double %4, double* %arrayidx6, align 8, !dbg !394, !tbaa !159
  %6 = load i32* @J, align 4, !dbg !395, !tbaa !218
  %idxprom7 = sext i32 %6 to i64, !dbg !396
  %arrayidx8 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom7, !dbg !396
  %7 = load double* %arrayidx8, align 8, !dbg !396, !tbaa !159
  %8 = load i32* @L, align 4, !dbg !397, !tbaa !218
  %idxprom9 = sext i32 %8 to i64, !dbg !398
  %arrayidx10 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom9, !dbg !398
  store double %7, double* %arrayidx10, align 8, !dbg !398, !tbaa !159
  ret void, !dbg !399
}

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: nounwind
declare double @log(double) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @putchar(i32) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!95, !96}
!llvm.ident = !{!97}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !8, !84, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c] [DW_LANG_C99]
!1 = !{!"whetstone.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !7}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!6 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!9, !46, !52, !55, !64, !75}
!9 = !{!"0x2e\00main\00main\00\0087\000\001\000\000\00256\001\0088", !1, !10, !11, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 87] [def] [scope 88] [main]
!10 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!13, !13, !4}
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!15, !16, !17, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !45}
!15 = !{!"0x101\00argc\0016777303\000", !9, !10, !13} ; [ DW_TAG_arg_variable ] [argc] [line 87]
!16 = !{!"0x101\00argv\0033554519\000", !9, !10, !4} ; [ DW_TAG_arg_variable ] [argv] [line 87]
!17 = !{!"0x100\00I\0090\000", !9, !10, !18}      ; [ DW_TAG_auto_variable ] [I] [line 90]
!18 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!19 = !{!"0x100\00N1\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N1] [line 91]
!20 = !{!"0x100\00N2\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N2] [line 91]
!21 = !{!"0x100\00N3\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N3] [line 91]
!22 = !{!"0x100\00N4\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N4] [line 91]
!23 = !{!"0x100\00N6\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N6] [line 91]
!24 = !{!"0x100\00N7\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N7] [line 91]
!25 = !{!"0x100\00N8\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N8] [line 91]
!26 = !{!"0x100\00N9\0091\000", !9, !10, !18}     ; [ DW_TAG_auto_variable ] [N9] [line 91]
!27 = !{!"0x100\00N10\0091\000", !9, !10, !18}    ; [ DW_TAG_auto_variable ] [N10] [line 91]
!28 = !{!"0x100\00N11\0091\000", !9, !10, !18}    ; [ DW_TAG_auto_variable ] [N11] [line 91]
!29 = !{!"0x100\00X1\0092\000", !9, !10, !30}     ; [ DW_TAG_auto_variable ] [X1] [line 92]
!30 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!31 = !{!"0x100\00X2\0092\000", !9, !10, !30}     ; [ DW_TAG_auto_variable ] [X2] [line 92]
!32 = !{!"0x100\00X3\0092\000", !9, !10, !30}     ; [ DW_TAG_auto_variable ] [X3] [line 92]
!33 = !{!"0x100\00X4\0092\000", !9, !10, !30}     ; [ DW_TAG_auto_variable ] [X4] [line 92]
!34 = !{!"0x100\00X\0092\000", !9, !10, !30}      ; [ DW_TAG_auto_variable ] [X] [line 92]
!35 = !{!"0x100\00Y\0092\000", !9, !10, !30}      ; [ DW_TAG_auto_variable ] [Y] [line 92]
!36 = !{!"0x100\00Z\0092\000", !9, !10, !30}      ; [ DW_TAG_auto_variable ] [Z] [line 92]
!37 = !{!"0x100\00LOOP\0093\000", !9, !10, !18}   ; [ DW_TAG_auto_variable ] [LOOP] [line 93]
!38 = !{!"0x100\00II\0094\000", !9, !10, !13}     ; [ DW_TAG_auto_variable ] [II] [line 94]
!39 = !{!"0x100\00JJ\0094\000", !9, !10, !13}     ; [ DW_TAG_auto_variable ] [JJ] [line 94]
!40 = !{!"0x100\00loopstart\0097\000", !9, !10, !18} ; [ DW_TAG_auto_variable ] [loopstart] [line 97]
!41 = !{!"0x100\00startsec\0098\000", !9, !10, !18} ; [ DW_TAG_auto_variable ] [startsec] [line 98]
!42 = !{!"0x100\00finisec\0098\000", !9, !10, !18} ; [ DW_TAG_auto_variable ] [finisec] [line 98]
!43 = !{!"0x100\00KIPS\0099\000", !9, !10, !44}   ; [ DW_TAG_auto_variable ] [KIPS] [line 99]
!44 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!45 = !{!"0x100\00continuous\00100\000", !9, !10, !13} ; [ DW_TAG_auto_variable ] [continuous] [line 100]
!46 = !{!"0x2e\00PA\00PA\00\00397\000\001\000\000\00256\001\00398", !1, !10, !47, null, void (double*)* @PA, null, null, !50} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 398] [PA]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!50 = !{!51}
!51 = !{!"0x101\00E\0016777613\000", !46, !10, !49} ; [ DW_TAG_arg_variable ] [E] [line 397]
!52 = !{!"0x2e\00P0\00P0\00\00413\000\001\000\000\00256\001\00414", !1, !10, !53, null, void ()* @P0, null, null, !2} ; [ DW_TAG_subprogram ] [line 413] [def] [scope 414] [P0]
!53 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !54, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = !{null}
!55 = !{!"0x2e\00P3\00P3\00\00421\000\001\000\000\00256\001\00422", !1, !10, !56, null, void (double, double, double*)* @P3, null, null, !58} ; [ DW_TAG_subprogram ] [line 421] [def] [scope 422] [P3]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{null, !30, !30, !49}
!58 = !{!59, !60, !61, !62, !63}
!59 = !{!"0x101\00X\0016777637\000", !55, !10, !30} ; [ DW_TAG_arg_variable ] [X] [line 421]
!60 = !{!"0x101\00Y\0033554853\000", !55, !10, !30} ; [ DW_TAG_arg_variable ] [Y] [line 421]
!61 = !{!"0x101\00Z\0050332069\000", !55, !10, !49} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!62 = !{!"0x100\00X1\00423\000", !55, !10, !30}   ; [ DW_TAG_auto_variable ] [X1] [line 423]
!63 = !{!"0x100\00Y1\00423\000", !55, !10, !30}   ; [ DW_TAG_auto_variable ] [Y1] [line 423]
!64 = !{!"0x2e\00POUT\00POUT\00\00434\000\001\000\000\00256\001\00435", !1, !10, !65, null, void (i64, i64, i64, double, double, double, double)* @POUT, null, null, !67} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [POUT]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{null, !18, !18, !18, !30, !30, !30, !30}
!67 = !{!68, !69, !70, !71, !72, !73, !74}
!68 = !{!"0x101\00N\0016777650\000", !64, !10, !18} ; [ DW_TAG_arg_variable ] [N] [line 434]
!69 = !{!"0x101\00J\0033554866\000", !64, !10, !18} ; [ DW_TAG_arg_variable ] [J] [line 434]
!70 = !{!"0x101\00K\0050332082\000", !64, !10, !18} ; [ DW_TAG_arg_variable ] [K] [line 434]
!71 = !{!"0x101\00X1\0067109298\000", !64, !10, !30} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!72 = !{!"0x101\00X2\0083886514\000", !64, !10, !30} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!73 = !{!"0x101\00X3\00100663730\000", !64, !10, !30} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!74 = !{!"0x101\00X4\00117440946\000", !64, !10, !30} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!75 = !{!"0x2e\00atol\00atol\00\00283\000\001\000\000\00256\001\00284", !76, !77, !78, null, i64 (i8*)* @atol, null, null, !82} ; [ DW_TAG_subprogram ] [line 283] [def] [scope 284] [atol]
!76 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!77 = !{!"0x29", !76}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!78 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !79, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = !{!18, !80}
!80 = !{!"0xf\00\000\0064\0064\000\000", null, null, !81} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!81 = !{!"0x26\00\000\000\000\000\000", null, null, !6} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!82 = !{!83}
!83 = !{!"0x101\00__nptr\0016777499\000", !75, !77, !80} ; [ DW_TAG_arg_variable ] [__nptr] [line 283]
!84 = !{!85, !86, !87, !88, !92, !93, !94}
!85 = !{!"0x34\00T\00T\00\0083\000\001", null, !10, !30, double* @T, null} ; [ DW_TAG_variable ] [T] [line 83] [def]
!86 = !{!"0x34\00T1\00T1\00\0083\000\001", null, !10, !30, double* @T1, null} ; [ DW_TAG_variable ] [T1] [line 83] [def]
!87 = !{!"0x34\00T2\00T2\00\0083\000\001", null, !10, !30, double* @T2, null} ; [ DW_TAG_variable ] [T2] [line 83] [def]
!88 = !{!"0x34\00E1\00E1\00\0083\000\001", null, !10, !89, [5 x double]* @E1, null} ; [ DW_TAG_variable ] [E1] [line 83] [def]
!89 = !{!"0x1\00\000\00320\0064\000\000\000", null, null, !30, !90, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 320, align 64, offset 0] [from double]
!90 = !{!91}
!91 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!92 = !{!"0x34\00J\00J\00\0084\000\001", null, !10, !13, i32* @J, null} ; [ DW_TAG_variable ] [J] [line 84] [def]
!93 = !{!"0x34\00K\00K\00\0084\000\001", null, !10, !13, i32* @K, null} ; [ DW_TAG_variable ] [K] [line 84] [def]
!94 = !{!"0x34\00L\00L\00\0084\000\001", null, !10, !13, i32* @L, null} ; [ DW_TAG_variable ] [L] [line 84] [def]
!95 = !{i32 2, !"Dwarf Version", i32 4}
!96 = !{i32 2, !"Debug Info Version", i32 2}
!97 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!98 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!99 = !MDLocation(line: 87, column: 10, scope: !9)
!100 = !MDLocation(line: 87, column: 22, scope: !9)
!101 = !MDLocation(line: 97, column: 7, scope: !9)
!102 = !MDLocation(line: 100, column: 6, scope: !9)
!103 = !MDLocation(line: 94, column: 6, scope: !9)
!104 = !MDLocation(line: 110, column: 9, scope: !9)
!105 = !MDLocation(line: 110, column: 2, scope: !9)
!106 = !MDLocation(line: 153, column: 8, scope: !9)
!107 = !MDLocation(line: 154, column: 8, scope: !9)
!108 = !MDLocation(line: 155, column: 8, scope: !9)
!109 = !MDLocation(line: 156, column: 8, scope: !9)
!110 = !MDLocation(line: 157, column: 8, scope: !9)
!111 = !MDLocation(line: 158, column: 8, scope: !9)
!112 = !MDLocation(line: 159, column: 8, scope: !9)
!113 = !MDLocation(line: 161, column: 8, scope: !9)
!114 = !MDLocation(line: 192, column: 14, scope: !115)
!115 = !{!"0xb\00192\002\0011", !1, !116}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!116 = !{!"0xb\00192\002\0010", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!117 = !MDLocation(line: 208, column: 14, scope: !118)
!118 = !{!"0xb\00208\002\0015", !1, !119}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!119 = !{!"0xb\00208\002\0014", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!120 = !MDLocation(line: 221, column: 14, scope: !121)
!121 = !{!"0xb\00221\002\0018", !1, !122}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!122 = !{!"0xb\00221\002\0017", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!123 = !MDLocation(line: 253, column: 14, scope: !124)
!124 = !{!"0xb\00253\002\0025", !1, !125}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!125 = !{!"0xb\00253\002\0024", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!126 = !MDLocation(line: 273, column: 14, scope: !127)
!127 = !{!"0xb\00273\002\0029", !1, !128}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!128 = !{!"0xb\00273\002\0028", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!129 = !MDLocation(line: 291, column: 14, scope: !130)
!130 = !{!"0xb\00291\002\0033", !1, !131}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!131 = !{!"0xb\00291\002\0032", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!132 = !MDLocation(line: 310, column: 14, scope: !133)
!133 = !{!"0xb\00310\002\0036", !1, !134}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!134 = !{!"0xb\00310\002\0035", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!135 = !MDLocation(line: 343, column: 14, scope: !136)
!136 = !{!"0xb\00343\002\0043", !1, !137}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!137 = !{!"0xb\00343\002\0042", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!138 = !MDLocation(line: 390, column: 6, scope: !9)
!139 = !MDLocation(line: 128, column: 13, scope: !9)
!140 = !MDLocation(line: 111, column: 7, scope: !141)
!141 = !{!"0xb\00111\007\001", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!142 = !{!"0xb\00110\0020\000", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!143 = !{!144, !144, i64 0}
!144 = !{!"any pointer", !145, i64 0}
!145 = !{!"omnipotent char", !146, i64 0}
!146 = !{!"Simple C/C++ TBAA"}
!147 = !MDLocation(line: 111, column: 7, scope: !142)
!148 = !MDLocation(line: 111, column: 42, scope: !141)
!149 = !{!145, !145, i64 0}
!150 = !MDLocation(line: 113, column: 14, scope: !151)
!151 = !{!"0xb\00113\0014\003", !1, !141}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!152 = !MDLocation(line: 113, column: 14, scope: !141)
!153 = !MDLocation(line: 116, column: 12, scope: !154)
!154 = !{!"0xb\00115\0010\005", !1, !151}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!155 = !MDLocation(line: 116, column: 4, scope: !154)
!156 = !MDLocation(line: 117, column: 4, scope: !154)
!157 = !MDLocation(line: 98, column: 7, scope: !9)
!158 = !MDLocation(line: 135, column: 2, scope: !9)
!159 = !{!160, !160, i64 0}
!160 = !{!"double", !145, i64 0}
!161 = !MDLocation(line: 136, column: 2, scope: !9)
!162 = !MDLocation(line: 137, column: 2, scope: !9)
!163 = !MDLocation(line: 93, column: 7, scope: !9)
!164 = !MDLocation(line: 94, column: 10, scope: !9)
!165 = !MDLocation(line: 91, column: 7, scope: !9)
!166 = !MDLocation(line: 91, column: 11, scope: !9)
!167 = !MDLocation(line: 91, column: 15, scope: !9)
!168 = !MDLocation(line: 91, column: 19, scope: !9)
!169 = !MDLocation(line: 91, column: 23, scope: !9)
!170 = !MDLocation(line: 91, column: 27, scope: !9)
!171 = !MDLocation(line: 91, column: 31, scope: !9)
!172 = !MDLocation(line: 91, column: 35, scope: !9)
!173 = !MDLocation(line: 91, column: 39, scope: !9)
!174 = !MDLocation(line: 91, column: 44, scope: !9)
!175 = !MDLocation(line: 92, column: 9, scope: !9)
!176 = !MDLocation(line: 92, column: 12, scope: !9)
!177 = !MDLocation(line: 92, column: 15, scope: !9)
!178 = !MDLocation(line: 92, column: 18, scope: !9)
!179 = !MDLocation(line: 90, column: 7, scope: !9)
!180 = !MDLocation(line: 179, column: 13, scope: !181)
!181 = !{!"0xb\00179\006\009", !1, !9}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!182 = !MDLocation(line: 187, column: 2, scope: !9)
!183 = !MDLocation(line: 188, column: 2, scope: !9)
!184 = !MDLocation(line: 189, column: 2, scope: !9)
!185 = !MDLocation(line: 190, column: 2, scope: !9)
!186 = !MDLocation(line: 200, column: 27, scope: !187)
!187 = !{!"0xb\00200\006\0013", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!188 = !MDLocation(line: 200, column: 33, scope: !187)
!189 = !MDLocation(line: 192, column: 2, scope: !116)
!190 = !MDLocation(line: 193, column: 49, scope: !191)
!191 = !{!"0xb\00192\0028\0012", !1, !115}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!192 = !MDLocation(line: 195, column: 6, scope: !191)
!193 = !MDLocation(line: 196, column: 6, scope: !191)
!194 = !MDLocation(line: 196, column: 24, scope: !191)
!195 = !MDLocation(line: 193, column: 16, scope: !191)
!196 = !MDLocation(line: 193, column: 14, scope: !191)
!197 = !MDLocation(line: 194, column: 16, scope: !191)
!198 = !MDLocation(line: 194, column: 14, scope: !191)
!199 = !MDLocation(line: 195, column: 16, scope: !191)
!200 = !MDLocation(line: 195, column: 14, scope: !191)
!201 = !MDLocation(line: 196, column: 15, scope: !191)
!202 = !MDLocation(line: 196, column: 14, scope: !191)
!203 = !MDLocation(line: 192, column: 23, scope: !115)
!204 = !MDLocation(line: 196, column: 16, scope: !191)
!205 = !MDLocation(line: 200, column: 39, scope: !187)
!206 = !MDLocation(line: 200, column: 45, scope: !187)
!207 = !MDLocation(line: 200, column: 13, scope: !187)
!208 = !MDLocation(line: 208, column: 2, scope: !119)
!209 = !MDLocation(line: 209, column: 3, scope: !118)
!210 = !MDLocation(line: 208, column: 23, scope: !118)
!211 = !MDLocation(line: 212, column: 27, scope: !212)
!212 = !{!"0xb\00212\006\0016", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!213 = !MDLocation(line: 212, column: 33, scope: !212)
!214 = !MDLocation(line: 212, column: 39, scope: !212)
!215 = !MDLocation(line: 212, column: 45, scope: !212)
!216 = !MDLocation(line: 212, column: 13, scope: !212)
!217 = !MDLocation(line: 220, column: 2, scope: !9)
!218 = !{!219, !219, i64 0}
!219 = !{!"int", !145, i64 0}
!220 = !MDLocation(line: 221, column: 2, scope: !122)
!221 = !MDLocation(line: 221, column: 23, scope: !121)
!222 = !MDLocation(line: 233, column: 4, scope: !223)
!223 = !{!"0xb\00232\007\0022", !1, !224}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!224 = !{!"0xb\00221\0028\0019", !1, !121}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!225 = !MDLocation(line: 239, column: 21, scope: !226)
!226 = !{!"0xb\00239\006\0023", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!227 = !MDLocation(line: 239, column: 13, scope: !226)
!228 = !MDLocation(line: 249, column: 2, scope: !9)
!229 = !MDLocation(line: 250, column: 2, scope: !9)
!230 = !MDLocation(line: 251, column: 2, scope: !9)
!231 = !MDLocation(line: 253, column: 2, scope: !125)
!232 = !MDLocation(line: 258, column: 20, scope: !233)
!233 = !{!"0xb\00253\0028\0026", !1, !124}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!234 = !MDLocation(line: 258, column: 24, scope: !233)
!235 = !MDLocation(line: 254, column: 15, scope: !233)
!236 = !MDLocation(line: 254, column: 10, scope: !233)
!237 = !MDLocation(line: 254, column: 23, scope: !233)
!238 = !MDLocation(line: 255, column: 10, scope: !233)
!239 = !MDLocation(line: 256, column: 11, scope: !233)
!240 = !MDLocation(line: 256, column: 19, scope: !233)
!241 = !MDLocation(line: 256, column: 10, scope: !233)
!242 = !MDLocation(line: 257, column: 16, scope: !233)
!243 = !MDLocation(line: 257, column: 9, scope: !233)
!244 = !MDLocation(line: 257, column: 6, scope: !233)
!245 = !MDLocation(line: 258, column: 16, scope: !233)
!246 = !MDLocation(line: 258, column: 9, scope: !233)
!247 = !MDLocation(line: 258, column: 6, scope: !233)
!248 = !MDLocation(line: 253, column: 23, scope: !124)
!249 = !MDLocation(line: 262, column: 21, scope: !250)
!250 = !{!"0xb\00262\006\0027", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!251 = !MDLocation(line: 262, column: 23, scope: !250)
!252 = !MDLocation(line: 262, column: 25, scope: !250)
!253 = !MDLocation(line: 262, column: 31, scope: !250)
!254 = !MDLocation(line: 262, column: 37, scope: !250)
!255 = !MDLocation(line: 262, column: 43, scope: !250)
!256 = !MDLocation(line: 262, column: 13, scope: !250)
!257 = !MDLocation(line: 92, column: 21, scope: !9)
!258 = !MDLocation(line: 92, column: 23, scope: !9)
!259 = !MDLocation(line: 273, column: 2, scope: !128)
!260 = !MDLocation(line: 274, column: 7, scope: !261)
!261 = !{!"0xb\00273\0028\0030", !1, !127}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!262 = !MDLocation(line: 274, column: 17, scope: !261)
!263 = !MDLocation(line: 274, column: 20, scope: !261)
!264 = !MDLocation(line: 274, column: 28, scope: !261)
!265 = !MDLocation(line: 274, column: 42, scope: !261)
!266 = !MDLocation(line: 274, column: 37, scope: !261)
!267 = !MDLocation(line: 274, column: 52, scope: !261)
!268 = !MDLocation(line: 274, column: 47, scope: !261)
!269 = !MDLocation(line: 274, column: 11, scope: !261)
!270 = !MDLocation(line: 275, column: 7, scope: !261)
!271 = !MDLocation(line: 275, column: 17, scope: !261)
!272 = !MDLocation(line: 275, column: 20, scope: !261)
!273 = !MDLocation(line: 275, column: 28, scope: !261)
!274 = !MDLocation(line: 275, column: 42, scope: !261)
!275 = !MDLocation(line: 275, column: 37, scope: !261)
!276 = !MDLocation(line: 275, column: 52, scope: !261)
!277 = !MDLocation(line: 275, column: 47, scope: !261)
!278 = !MDLocation(line: 275, column: 11, scope: !261)
!279 = !MDLocation(line: 273, column: 23, scope: !127)
!280 = !MDLocation(line: 279, column: 21, scope: !281)
!281 = !{!"0xb\00279\006\0031", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!282 = !MDLocation(line: 279, column: 23, scope: !281)
!283 = !MDLocation(line: 279, column: 13, scope: !281)
!284 = !MDLocation(line: 92, column: 25, scope: !9)
!285 = !MDLocation(line: 289, column: 2, scope: !9)
!286 = !MDLocation(line: 291, column: 2, scope: !131)
!287 = !MDLocation(line: 292, column: 3, scope: !130)
!288 = !MDLocation(line: 291, column: 23, scope: !130)
!289 = !MDLocation(line: 295, column: 21, scope: !290)
!290 = !{!"0xb\00295\006\0034", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!291 = !MDLocation(line: 295, column: 23, scope: !290)
!292 = !MDLocation(line: 295, column: 29, scope: !290)
!293 = !MDLocation(line: 295, column: 13, scope: !290)
!294 = !MDLocation(line: 303, column: 2, scope: !9)
!295 = !MDLocation(line: 304, column: 2, scope: !9)
!296 = !MDLocation(line: 305, column: 2, scope: !9)
!297 = !MDLocation(line: 306, column: 2, scope: !9)
!298 = !MDLocation(line: 307, column: 2, scope: !9)
!299 = !MDLocation(line: 308, column: 2, scope: !9)
!300 = !MDLocation(line: 310, column: 2, scope: !134)
!301 = !MDLocation(line: 311, column: 3, scope: !133)
!302 = !MDLocation(line: 310, column: 23, scope: !133)
!303 = !MDLocation(line: 314, column: 21, scope: !304)
!304 = !{!"0xb\00314\006\0037", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!305 = !MDLocation(line: 314, column: 23, scope: !304)
!306 = !MDLocation(line: 314, column: 25, scope: !304)
!307 = !MDLocation(line: 314, column: 31, scope: !304)
!308 = !MDLocation(line: 314, column: 37, scope: !304)
!309 = !MDLocation(line: 314, column: 43, scope: !304)
!310 = !MDLocation(line: 314, column: 13, scope: !304)
!311 = !MDLocation(line: 322, column: 2, scope: !9)
!312 = !MDLocation(line: 323, column: 2, scope: !9)
!313 = !MDLocation(line: 333, column: 13, scope: !314)
!314 = !{!"0xb\00333\006\0041", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!315 = !MDLocation(line: 343, column: 2, scope: !137)
!316 = !MDLocation(line: 344, column: 18, scope: !136)
!317 = !MDLocation(line: 344, column: 26, scope: !136)
!318 = !MDLocation(line: 344, column: 13, scope: !136)
!319 = !MDLocation(line: 344, column: 7, scope: !136)
!320 = !MDLocation(line: 343, column: 24, scope: !136)
!321 = !MDLocation(line: 347, column: 22, scope: !322)
!322 = !{!"0xb\00347\006\0044", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!323 = !MDLocation(line: 347, column: 24, scope: !322)
!324 = !MDLocation(line: 347, column: 13, scope: !322)
!325 = !MDLocation(line: 363, column: 12, scope: !9)
!326 = !MDLocation(line: 98, column: 17, scope: !9)
!327 = !MDLocation(line: 374, column: 2, scope: !9)
!328 = !MDLocation(line: 394, column: 1, scope: !9)
!329 = !MDLocation(line: 283, column: 1, scope: !75)
!330 = !MDLocation(line: 285, column: 10, scope: !75)
!331 = !MDLocation(line: 285, column: 3, scope: !75)
!332 = !MDLocation(line: 434, column: 11, scope: !64)
!333 = !MDLocation(line: 434, column: 19, scope: !64)
!334 = !MDLocation(line: 434, column: 27, scope: !64)
!335 = !MDLocation(line: 434, column: 37, scope: !64)
!336 = !MDLocation(line: 434, column: 48, scope: !64)
!337 = !MDLocation(line: 434, column: 59, scope: !64)
!338 = !MDLocation(line: 434, column: 70, scope: !64)
!339 = !MDLocation(line: 436, column: 2, scope: !64)
!340 = !MDLocation(line: 438, column: 1, scope: !64)
!341 = !MDLocation(line: 397, column: 11, scope: !46)
!342 = !MDLocation(line: 399, column: 2, scope: !46)
!343 = !MDLocation(line: 402, column: 11, scope: !46)
!344 = !MDLocation(line: 402, column: 18, scope: !46)
!345 = !MDLocation(line: 402, column: 25, scope: !46)
!346 = !MDLocation(line: 402, column: 32, scope: !46)
!347 = !MDLocation(line: 402, column: 40, scope: !46)
!348 = !MDLocation(line: 402, column: 9, scope: !46)
!349 = !MDLocation(line: 402, column: 2, scope: !46)
!350 = !MDLocation(line: 403, column: 18, scope: !46)
!351 = !MDLocation(line: 403, column: 11, scope: !46)
!352 = !MDLocation(line: 403, column: 25, scope: !46)
!353 = !MDLocation(line: 403, column: 32, scope: !46)
!354 = !MDLocation(line: 403, column: 40, scope: !46)
!355 = !MDLocation(line: 403, column: 9, scope: !46)
!356 = !MDLocation(line: 403, column: 2, scope: !46)
!357 = !MDLocation(line: 404, column: 11, scope: !46)
!358 = !MDLocation(line: 404, column: 25, scope: !46)
!359 = !MDLocation(line: 404, column: 32, scope: !46)
!360 = !MDLocation(line: 404, column: 40, scope: !46)
!361 = !MDLocation(line: 404, column: 9, scope: !46)
!362 = !MDLocation(line: 404, column: 2, scope: !46)
!363 = !MDLocation(line: 405, column: 11, scope: !46)
!364 = !MDLocation(line: 405, column: 18, scope: !46)
!365 = !MDLocation(line: 405, column: 10, scope: !46)
!366 = !MDLocation(line: 405, column: 32, scope: !46)
!367 = !MDLocation(line: 405, column: 40, scope: !46)
!368 = !MDLocation(line: 405, column: 9, scope: !46)
!369 = !MDLocation(line: 405, column: 2, scope: !46)
!370 = !MDLocation(line: 406, column: 2, scope: !46)
!371 = !MDLocation(line: 408, column: 6, scope: !46)
!372 = !MDLocation(line: 410, column: 1, scope: !46)
!373 = !MDLocation(line: 421, column: 11, scope: !55)
!374 = !MDLocation(line: 421, column: 21, scope: !55)
!375 = !MDLocation(line: 421, column: 32, scope: !55)
!376 = !MDLocation(line: 423, column: 9, scope: !55)
!377 = !MDLocation(line: 423, column: 13, scope: !55)
!378 = !MDLocation(line: 427, column: 7, scope: !55)
!379 = !MDLocation(line: 427, column: 12, scope: !55)
!380 = !MDLocation(line: 428, column: 12, scope: !55)
!381 = !MDLocation(line: 428, column: 7, scope: !55)
!382 = !MDLocation(line: 429, column: 9, scope: !55)
!383 = !MDLocation(line: 429, column: 20, scope: !55)
!384 = !MDLocation(line: 429, column: 8, scope: !55)
!385 = !MDLocation(line: 429, column: 2, scope: !55)
!386 = !MDLocation(line: 430, column: 1, scope: !55)
!387 = !MDLocation(line: 415, column: 13, scope: !52)
!388 = !MDLocation(line: 415, column: 10, scope: !52)
!389 = !MDLocation(line: 415, column: 5, scope: !52)
!390 = !MDLocation(line: 415, column: 2, scope: !52)
!391 = !MDLocation(line: 416, column: 13, scope: !52)
!392 = !MDLocation(line: 416, column: 10, scope: !52)
!393 = !MDLocation(line: 416, column: 5, scope: !52)
!394 = !MDLocation(line: 416, column: 2, scope: !52)
!395 = !MDLocation(line: 417, column: 13, scope: !52)
!396 = !MDLocation(line: 417, column: 10, scope: !52)
!397 = !MDLocation(line: 417, column: 5, scope: !52)
!398 = !MDLocation(line: 417, column: 2, scope: !52)
!399 = !MDLocation(line: 418, column: 1, scope: !52)
