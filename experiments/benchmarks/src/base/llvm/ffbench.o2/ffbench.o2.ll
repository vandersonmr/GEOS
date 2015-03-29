; ModuleID = 'ffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 63, i64 0, metadata !19, metadata !79), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 256, i64 0, metadata !20, metadata !79), !dbg !81
  tail call void @llvm.dbg.value(metadata i64 65536, i64 0, metadata !22, metadata !79), !dbg !82
  tail call void @llvm.dbg.value(metadata i64 1048592, i64 0, metadata !24, metadata !79), !dbg !83
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 2), align 4, !dbg !84, !tbaa !85
  store i32 256, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 1), align 4, !dbg !89, !tbaa !85
  %call = tail call noalias i8* @malloc(i64 1048592) #3, !dbg !90
  %0 = bitcast i8* %call to double*, !dbg !91
  tail call void @llvm.dbg.value(metadata double* %0, i64 0, metadata !21, metadata !79), !dbg !92
  %cmp = icmp eq i8* %call, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !96, !tbaa !98
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %1) #5, !dbg !100
  tail call void @exit(i32 1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 1048592, i32 8, i1 false), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !79), !dbg !103
  br label %for.cond7.preheader, !dbg !104

for.cond7.preheader:                              ; preds = %for.inc22, %if.end
  %indvars.iv198 = phi i64 [ 0, %if.end ], [ %indvars.iv.next199, %for.inc22 ]
  %and = and i64 %indvars.iv198, 15, !dbg !106
  %cmp11 = icmp eq i64 %and, 8, !dbg !106
  %3 = shl i64 %indvars.iv198, 8, !dbg !113
  br label %for.body10, !dbg !114

for.body10:                                       ; preds = %for.inc.1, %for.cond7.preheader
  %indvars.iv192 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next193.1, %for.inc.1 ]
  %and13 = and i64 %indvars.iv192, 15, !dbg !115
  %cmp14 = icmp eq i64 %and13, 8, !dbg !115
  %or.cond = or i1 %cmp11, %cmp14, !dbg !116
  br i1 %or.cond, label %if.then16, label %for.inc, !dbg !116

if.then16:                                        ; preds = %for.body10
  %4 = add nuw nsw i64 %indvars.iv192, %3, !dbg !113
  %5 = shl nsw i64 %4, 1, !dbg !113
  %6 = or i64 %5, 1, !dbg !113
  %arrayidx = getelementptr inbounds double* %0, i64 %6, !dbg !113
  store double 1.280000e+02, double* %arrayidx, align 8, !dbg !113, !tbaa !117
  br label %for.inc, !dbg !113

for.inc:                                          ; preds = %for.body10, %if.then16
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1, !dbg !114
  %and13.1 = and i64 %indvars.iv.next193, 15, !dbg !115
  %cmp14.1 = icmp eq i64 %and13.1, 8, !dbg !115
  %or.cond.1 = or i1 %cmp11, %cmp14.1, !dbg !116
  br i1 %or.cond.1, label %if.then16.1, label %for.inc.1, !dbg !116

for.inc22:                                        ; preds = %for.inc.1
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1, !dbg !104
  %exitcond201 = icmp eq i64 %indvars.iv.next199, 256, !dbg !104
  br i1 %exitcond201, label %for.body28.preheader, label %for.cond7.preheader, !dbg !104

for.body28.preheader:                             ; preds = %for.inc22
  br label %for.body28, !dbg !119

for.body28:                                       ; preds = %for.body28.preheader, %for.body28
  %i.1178 = phi i32 [ %inc30, %for.body28 ], [ 0, %for.body28.preheader ]
  tail call fastcc void @fourn(double* %0, i32 1), !dbg !119
  tail call fastcc void @fourn(double* %0, i32 -1), !dbg !123
  %inc30 = add nuw nsw i32 %i.1178, 1, !dbg !124
  tail call void @llvm.dbg.value(metadata i32 %inc30, i64 0, metadata !14, metadata !79), !dbg !103
  %exitcond191 = icmp eq i32 %inc30, 63, !dbg !125
  br i1 %exitcond191, label %for.body36.preheader, label %for.body28, !dbg !125

for.body36.preheader:                             ; preds = %for.body28
  br label %for.body36, !dbg !126

for.body36:                                       ; preds = %for.body36, %for.body36.preheader
  %indvars.iv188 = phi i64 [ 1, %for.body36.preheader ], [ %indvars.iv.next189.1, %for.body36 ]
  %rmax.0174 = phi double [ -1.000000e+10, %for.body36.preheader ], [ %cond51.1, %for.body36 ]
  %rmin.0173 = phi double [ 1.000000e+10, %for.body36.preheader ], [ %cond.1, %for.body36 ]
  %arrayidx38 = getelementptr inbounds double* %0, i64 %indvars.iv188, !dbg !126
  %7 = load double* %arrayidx38, align 8, !dbg !126, !tbaa !117
  tail call void @llvm.dbg.value(metadata double %7, i64 0, metadata !31, metadata !79), !dbg !130
  %cmp44 = fcmp ole double %7, %rmin.0173, !dbg !131
  %cond = select i1 %cmp44, double %7, double %rmin.0173, !dbg !131
  tail call void @llvm.dbg.value(metadata double %cond, i64 0, metadata !27, metadata !79), !dbg !132
  %cmp46 = fcmp ogt double %7, %rmax.0174, !dbg !133
  %cond51 = select i1 %cmp46, double %7, double %rmax.0174, !dbg !133
  tail call void @llvm.dbg.value(metadata double %cond51, i64 0, metadata !28, metadata !79), !dbg !134
  %indvars.iv.next189 = add nuw nsw i64 %indvars.iv188, 2, !dbg !135
  %arrayidx38.1 = getelementptr inbounds double* %0, i64 %indvars.iv.next189, !dbg !126
  %8 = load double* %arrayidx38.1, align 8, !dbg !126, !tbaa !117
  tail call void @llvm.dbg.value(metadata double %7, i64 0, metadata !31, metadata !79), !dbg !130
  %cmp44.1 = fcmp ole double %8, %cond, !dbg !131
  %cond.1 = select i1 %cmp44.1, double %8, double %cond, !dbg !131
  tail call void @llvm.dbg.value(metadata double %cond, i64 0, metadata !27, metadata !79), !dbg !132
  %cmp46.1 = fcmp ogt double %8, %cond51, !dbg !133
  %cond51.1 = select i1 %cmp46.1, double %8, double %cond51, !dbg !133
  tail call void @llvm.dbg.value(metadata double %cond51, i64 0, metadata !28, metadata !79), !dbg !134
  %indvars.iv.next189.1 = add nuw nsw i64 %indvars.iv.next189, 2, !dbg !135
  %cmp34.1 = icmp slt i64 %indvars.iv.next189.1, 65537, !dbg !136
  br i1 %cmp34.1, label %for.body36, label %for.end66, !dbg !135

for.end66:                                        ; preds = %for.body36
  %cond51.lcssa = phi double [ %cond51.1, %for.body36 ]
  %cond.lcssa = phi double [ %cond.1, %for.body36 ]
  tail call void @llvm.dbg.value(metadata double %cond, i64 0, metadata !25, metadata !79), !dbg !137
  %sub = fsub double %cond51.lcssa, %cond.lcssa, !dbg !138
  %div = fdiv double 2.550000e+02, %sub, !dbg !139
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !26, metadata !79), !dbg !140
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !79), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !79), !dbg !103
  br label %for.cond71.preheader, !dbg !142

for.cond71.preheader:                             ; preds = %for.inc100, %for.end66
  %indvars.iv184 = phi i64 [ 0, %for.end66 ], [ %indvars.iv.next185, %for.inc100 ]
  %m.0171 = phi i32 [ 0, %for.end66 ], [ %m.2.lcssa, %for.inc100 ]
  %9 = shl i64 %indvars.iv184, 8, !dbg !144
  %10 = trunc i64 %indvars.iv184 to i32, !dbg !150
  %and84 = and i32 %10, 15, !dbg !150
  %cmp85 = icmp eq i32 %and84, 8, !dbg !151
  br label %for.body74, !dbg !152

for.body74:                                       ; preds = %for.inc97, %for.cond71.preheader
  %indvars.iv = phi i64 [ 0, %for.cond71.preheader ], [ %indvars.iv.next, %for.inc97 ]
  %m.1169 = phi i32 [ %m.0171, %for.cond71.preheader ], [ %m.2, %for.inc97 ]
  %11 = add nuw nsw i64 %indvars.iv, %9, !dbg !144
  %12 = shl nsw i64 %11, 1, !dbg !144
  %13 = or i64 %12, 1, !dbg !144
  %arrayidx80 = getelementptr inbounds double* %0, i64 %13, !dbg !144
  %14 = load double* %arrayidx80, align 8, !dbg !144, !tbaa !117
  %sub81 = fsub double %14, %cond.lcssa, !dbg !144
  %mul82 = fmul double %div, %sub81, !dbg !153
  %conv83 = fptosi double %mul82 to i32, !dbg !153
  tail call void @llvm.dbg.value(metadata i32 %conv83, i64 0, metadata !16, metadata !79), !dbg !154
  br i1 %cmp85, label %lor.end, label %lor.rhs, !dbg !155

lor.rhs:                                          ; preds = %for.body74
  %and87 = and i64 %indvars.iv, 15, !dbg !156
  %cmp88 = icmp eq i64 %and87, 8, !dbg !156
  br label %lor.end, !dbg !155

lor.end:                                          ; preds = %lor.rhs, %for.body74
  %15 = phi i1 [ true, %for.body74 ], [ %cmp88, %lor.rhs ]
  %cond90 = select i1 %15, i32 255, i32 0, !dbg !157
  tail call void @llvm.dbg.value(metadata i32 %cond90, i64 0, metadata !17, metadata !79), !dbg !160
  %cmp91 = icmp eq i32 %conv83, %cond90, !dbg !161
  br i1 %cmp91, label %for.inc97, label %if.then93, !dbg !163

if.then93:                                        ; preds = %lor.end
  %inc94 = add nsw i32 %m.1169, 1, !dbg !164
  tail call void @llvm.dbg.value(metadata i32 %inc94, i64 0, metadata !18, metadata !79), !dbg !141
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !166, !tbaa !98
  %17 = trunc i64 %indvars.iv to i32, !dbg !167
  %call95 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([48 x i8]* @.str1, i64 0, i64 0), i32 %10, i32 %17, i32 %cond90, i32 %conv83) #7, !dbg !167
  br label %for.inc97, !dbg !168

for.inc97:                                        ; preds = %lor.end, %if.then93
  %m.2 = phi i32 [ %inc94, %if.then93 ], [ %m.1169, %lor.end ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !152
  %exitcond = icmp eq i64 %indvars.iv.next, 256, !dbg !152
  br i1 %exitcond, label %for.inc100, label %for.body74, !dbg !152

for.inc100:                                       ; preds = %for.inc97
  %m.2.lcssa = phi i32 [ %m.2, %for.inc97 ]
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1, !dbg !142
  %exitcond187 = icmp eq i64 %indvars.iv.next185, 256, !dbg !142
  br i1 %exitcond187, label %for.end102, label %for.cond71.preheader, !dbg !142

for.end102:                                       ; preds = %for.inc100
  %m.2.lcssa.lcssa = phi i32 [ %m.2.lcssa, %for.inc100 ]
  %cmp103 = icmp eq i32 %m.2.lcssa.lcssa, 0, !dbg !169
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !171, !tbaa !98
  br i1 %cmp103, label %if.then105, label %if.else, !dbg !173

if.then105:                                       ; preds = %for.end102
  %call106 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([35 x i8]* @.str2, i64 0, i64 0), i32 63) #7, !dbg !174
  br label %if.end108, !dbg !175

if.else:                                          ; preds = %for.end102
  %call107 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([35 x i8]* @.str3, i64 0, i64 0), i32 63, i32 %m.2.lcssa.lcssa) #7, !dbg !176
  br label %if.end108

if.end108:                                        ; preds = %if.else, %if.then105
  ret i32 0, !dbg !178

if.then16.1:                                      ; preds = %for.inc
  %19 = add nuw nsw i64 %indvars.iv.next193, %3, !dbg !113
  %20 = shl nsw i64 %19, 1, !dbg !113
  %21 = or i64 %20, 1, !dbg !113
  %arrayidx.1 = getelementptr inbounds double* %0, i64 %21, !dbg !113
  store double 1.280000e+02, double* %arrayidx.1, align 8, !dbg !113, !tbaa !117
  br label %for.inc.1, !dbg !113

for.inc.1:                                        ; preds = %if.then16.1, %for.inc
  %indvars.iv.next193.1 = add nuw nsw i64 %indvars.iv.next193, 1, !dbg !114
  %exitcond197.1 = icmp eq i64 %indvars.iv.next193.1, 256, !dbg !114
  br i1 %exitcond197.1, label %for.inc22, label %for.body10, !dbg !114
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @fourn(double* nocapture %data, i32 %isign) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !42, metadata !79), !dbg !179
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !43, metadata !79), !dbg !180
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !62, metadata !79), !dbg !181
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !79), !dbg !182
  %0 = load i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 1), align 4, !dbg !183, !tbaa !85
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !62, metadata !79), !dbg !181
  %1 = load i32* getelementptr inbounds ([3 x i32]* @main.nsize, i64 0, i64 2), align 4, !dbg !183, !tbaa !85
  %mul.1 = mul nsw i32 %1, %0, !dbg !186
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !62, metadata !79), !dbg !181
  %conv = sitofp i32 %isign to double, !dbg !187
  %mul59 = fmul double %conv, 0x401921FB54442D1C, !dbg !187
  br label %for.body3, !dbg !192

for.body3:                                        ; preds = %while.end134.for.body3_crit_edge, %entry
  %2 = phi i32 [ %1, %entry ], [ %.pre, %while.end134.for.body3_crit_edge ]
  %indvars.iv38 = phi i64 [ 2, %entry ], [ %indvars.iv.next39, %while.end134.for.body3_crit_edge ]
  %nprev.019 = phi i32 [ 1, %entry ], [ %mul6, %while.end134.for.body3_crit_edge ]
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !59, metadata !79), !dbg !193
  %mul6 = mul nsw i32 %2, %nprev.019, !dbg !194
  %div = sdiv i32 %mul.1, %mul6, !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !61, metadata !79), !dbg !196
  %shl = shl i32 %nprev.019, 1, !dbg !197
  tail call void @llvm.dbg.value(metadata i32 %shl, i64 0, metadata !50, metadata !79), !dbg !198
  %mul7 = mul nsw i32 %2, %shl, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 %mul7, i64 0, metadata !51, metadata !79), !dbg !200
  %mul8 = mul nsw i32 %mul7, %div, !dbg !201
  tail call void @llvm.dbg.value(metadata i32 %mul8, i64 0, metadata !52, metadata !79), !dbg !202
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !48, metadata !79), !dbg !203
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !46, metadata !79), !dbg !204
  %cmp105 = icmp slt i32 %mul7, 1, !dbg !205
  br i1 %cmp105, label %while.cond55.preheader, label %for.body11.lr.ph, !dbg !208

for.body11.lr.ph:                                 ; preds = %for.body3
  %add = add i32 %shl, -2, !dbg !209
  %3 = shl i32 %nprev.019, 1, !dbg !208
  %4 = sext i32 %3 to i64
  %5 = mul i32 %3, %2, !dbg !208
  %6 = sext i32 %5 to i64
  br label %for.body11, !dbg !208

while.cond55.preheader.loopexit:                  ; preds = %while.end
  br label %while.cond55.preheader

while.cond55.preheader:                           ; preds = %while.cond55.preheader.loopexit, %for.body3
  %cmp5616 = icmp slt i32 %shl, %mul7, !dbg !215
  br i1 %cmp5616, label %while.body57.lr.ph, label %while.end134, !dbg !216

while.body57.lr.ph:                               ; preds = %while.cond55.preheader
  %7 = shl i32 %nprev.019, 1, !dbg !216
  %8 = sext i32 %7 to i64
  br label %while.body57, !dbg !216

for.body11:                                       ; preds = %for.body11.lr.ph, %while.end
  %indvars.iv = phi i64 [ 1, %for.body11.lr.ph ], [ %indvars.iv.next, %while.end ]
  %i2.07 = phi i32 [ 1, %for.body11.lr.ph ], [ %add53, %while.end ]
  %i2rev.06 = phi i32 [ 1, %for.body11.lr.ph ], [ %add51, %while.end ]
  %cmp12 = icmp sgt i32 %i2rev.06, %i2.07, !dbg !217
  br i1 %cmp12, label %for.cond13.preheader, label %while.cond.preheader, !dbg !218

for.cond13.preheader:                             ; preds = %for.body11
  %sub = add i32 %add, %i2.07, !dbg !209
  %cmp143 = icmp sgt i32 %i2.07, %sub, !dbg !219
  br i1 %cmp143, label %while.cond.preheader, label %for.cond16.preheader.lr.ph, !dbg !220

for.cond16.preheader.lr.ph:                       ; preds = %for.cond13.preheader
  %add19 = sub i32 %i2rev.06, %i2.07, !dbg !221
  br label %for.cond16.preheader, !dbg !220

for.cond16.preheader:                             ; preds = %for.cond16.preheader.lr.ph, %for.inc44
  %indvars.iv22 = phi i64 [ %indvars.iv, %for.cond16.preheader.lr.ph ], [ %indvars.iv.next23, %for.inc44 ]
  %i1.04 = phi i32 [ %i2.07, %for.cond16.preheader.lr.ph ], [ %add45, %for.inc44 ]
  %cmp171 = icmp sgt i32 %i1.04, %mul8, !dbg !226
  br i1 %cmp171, label %for.inc44, label %for.body18.preheader, !dbg !227

for.body18.preheader:                             ; preds = %for.cond16.preheader
  br label %for.body18, !dbg !221

for.body18:                                       ; preds = %for.body18.preheader, %for.body18
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.body18 ], [ %indvars.iv22, %for.body18.preheader ]
  %i3.02 = phi i32 [ %add42, %for.body18 ], [ %i1.04, %for.body18.preheader ]
  %9 = trunc i64 %indvars.iv24 to i32, !dbg !221
  %sub20 = add i32 %add19, %9, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 %sub20, i64 0, metadata !49, metadata !79), !dbg !228
  %arrayidx22 = getelementptr inbounds double* %data, i64 %indvars.iv24, !dbg !229
  %10 = load double* %arrayidx22, align 8, !dbg !229, !tbaa !117
  tail call void @llvm.dbg.value(metadata double %10, i64 0, metadata !64, metadata !79), !dbg !230
  %idxprom23 = sext i32 %sub20 to i64, !dbg !229
  %arrayidx24 = getelementptr inbounds double* %data, i64 %idxprom23, !dbg !229
  %11 = load double* %arrayidx24, align 8, !dbg !229, !tbaa !117
  store double %11, double* %arrayidx22, align 8, !dbg !229, !tbaa !117
  store double %10, double* %arrayidx24, align 8, !dbg !229, !tbaa !117
  %12 = add nsw i64 %indvars.iv24, 1, !dbg !231
  %arrayidx31 = getelementptr inbounds double* %data, i64 %12, !dbg !231
  %13 = load double* %arrayidx31, align 8, !dbg !231, !tbaa !117
  tail call void @llvm.dbg.value(metadata double %13, i64 0, metadata !64, metadata !79), !dbg !230
  %add32 = add nsw i32 %sub20, 1, !dbg !231
  %idxprom33 = sext i32 %add32 to i64, !dbg !231
  %arrayidx34 = getelementptr inbounds double* %data, i64 %idxprom33, !dbg !231
  %14 = load double* %arrayidx34, align 8, !dbg !231, !tbaa !117
  store double %14, double* %arrayidx31, align 8, !dbg !231, !tbaa !117
  store double %13, double* %arrayidx34, align 8, !dbg !231, !tbaa !117
  %add42 = add nsw i32 %i3.02, %mul7, !dbg !232
  tail call void @llvm.dbg.value(metadata i32 %add42, i64 0, metadata !47, metadata !79), !dbg !233
  %cmp17 = icmp sgt i32 %add42, %mul8, !dbg !226
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, %6, !dbg !227
  br i1 %cmp17, label %for.inc44.loopexit, label %for.body18, !dbg !227

for.inc44.loopexit:                               ; preds = %for.body18
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.cond16.preheader
  %add45 = add nsw i32 %i1.04, 2, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %add45, i64 0, metadata !45, metadata !79), !dbg !235
  %cmp14 = icmp sgt i32 %add45, %sub, !dbg !219
  %indvars.iv.next23 = add nsw i64 %indvars.iv22, 2, !dbg !220
  br i1 %cmp14, label %while.cond.preheader.loopexit, label %for.cond16.preheader, !dbg !220

while.cond.preheader.loopexit:                    ; preds = %for.inc44
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.loopexit, %for.cond13.preheader, %for.body11
  br label %while.cond, !dbg !236

while.cond:                                       ; preds = %while.cond.preheader, %while.cond
  %ibit.0.in = phi i32 [ %ibit.0, %while.cond ], [ %mul7, %while.cond.preheader ]
  %i2rev.1 = phi i32 [ %sub49, %while.cond ], [ %i2rev.06, %while.cond.preheader ]
  %ibit.0 = ashr i32 %ibit.0.in, 1, !dbg !236
  %cmp48 = icmp sgt i32 %i2rev.1, %ibit.0, !dbg !237
  %not.cmp47 = icmp sge i32 %ibit.0, %shl, !dbg !238
  %.cmp48 = and i1 %cmp48, %not.cmp47, !dbg !238
  %sub49 = sub nsw i32 %i2rev.1, %ibit.0, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %sub49, i64 0, metadata !48, metadata !79), !dbg !203
  br i1 %.cmp48, label %while.cond, label %while.end, !dbg !241

while.end:                                        ; preds = %while.cond
  %ibit.0.lcssa = phi i32 [ %ibit.0, %while.cond ]
  %i2rev.1.lcssa = phi i32 [ %i2rev.1, %while.cond ]
  %add51 = add nsw i32 %i2rev.1.lcssa, %ibit.0.lcssa, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 %add51, i64 0, metadata !48, metadata !79), !dbg !203
  %add53 = add nsw i32 %i2.07, %shl, !dbg !244
  tail call void @llvm.dbg.value(metadata i32 %add53, i64 0, metadata !46, metadata !79), !dbg !204
  %cmp10 = icmp sgt i32 %add53, %mul7, !dbg !205
  %indvars.iv.next = add nsw i64 %indvars.iv, %4, !dbg !208
  br i1 %cmp10, label %while.cond55.preheader.loopexit, label %for.body11, !dbg !208

while.cond55.loopexit.loopexit:                   ; preds = %for.end122
  br label %while.cond55.loopexit

while.cond55.loopexit:                            ; preds = %while.cond55.loopexit.loopexit, %while.body57
  %cmp56 = icmp slt i32 %shl58, %mul7, !dbg !215
  br i1 %cmp56, label %while.body57, label %while.end134.loopexit, !dbg !216

while.body57:                                     ; preds = %while.body57.lr.ph, %while.cond55.loopexit
  %ifp1.017 = phi i32 [ %shl, %while.body57.lr.ph ], [ %shl58, %while.cond55.loopexit ]
  %shl58 = shl i32 %ifp1.017, 1, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 %shl58, i64 0, metadata !54, metadata !79), !dbg !246
  %div60 = sdiv i32 %shl58, %shl, !dbg !247
  %conv61 = sitofp i32 %div60 to double, !dbg !248
  %div62 = fdiv double %mul59, %conv61, !dbg !187
  tail call void @llvm.dbg.value(metadata double %div62, i64 0, metadata !65, metadata !79), !dbg !249
  %mul63 = fmul double %div62, 5.000000e-01, !dbg !250
  %call = tail call double @sin(double %mul63) #3, !dbg !251
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !70, metadata !79), !dbg !252
  %mul64 = fmul double %call, -2.000000e+00, !dbg !253
  %mul65 = fmul double %call, %mul64, !dbg !253
  tail call void @llvm.dbg.value(metadata double %mul65, i64 0, metadata !68, metadata !79), !dbg !254
  %call66 = tail call double @sin(double %div62) #3, !dbg !255
  tail call void @llvm.dbg.value(metadata double %call66, i64 0, metadata !67, metadata !79), !dbg !256
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !69, metadata !79), !dbg !257
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !66, metadata !79), !dbg !258
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !47, metadata !79), !dbg !233
  %cmp6812 = icmp slt i32 %ifp1.017, 1, !dbg !259
  br i1 %cmp6812, label %while.cond55.loopexit, label %for.cond71.preheader.lr.ph, !dbg !262

for.cond71.preheader.lr.ph:                       ; preds = %while.body57
  %15 = shl i32 %ifp1.017, 1, !dbg !262
  %16 = sext i32 %15 to i64
  %17 = sext i32 %ifp1.017 to i64, !dbg !262
  %18 = insertelement <2 x double> undef, double %mul65, i32 0, !dbg !263
  %19 = insertelement <2 x double> %18, double %mul65, i32 1, !dbg !263
  %20 = insertelement <2 x double> undef, double %call66, i32 0, !dbg !265
  %21 = insertelement <2 x double> %20, double %call66, i32 1, !dbg !265
  br label %for.cond71.preheader, !dbg !262

for.cond71.preheader:                             ; preds = %for.cond71.preheader.lr.ph, %for.end122
  %indvars.iv28 = phi i64 [ 1, %for.cond71.preheader.lr.ph ], [ %indvars.iv.next29, %for.end122 ]
  %i3.113 = phi i32 [ 1, %for.cond71.preheader.lr.ph ], [ %add72, %for.end122 ]
  %22 = phi <2 x double> [ <double 1.000000e+00, double 0.000000e+00>, %for.cond71.preheader.lr.ph ], [ %52, %for.end122 ]
  %add72 = add nsw i32 %i3.113, %shl, !dbg !266
  %sub73 = add nsw i32 %add72, -2, !dbg !266
  %cmp7410 = icmp sgt i32 %i3.113, %sub73, !dbg !269
  br i1 %cmp7410, label %for.end122, label %for.cond77.preheader.preheader, !dbg !270

for.cond77.preheader.preheader:                   ; preds = %for.cond71.preheader
  br label %for.cond77.preheader, !dbg !271

for.cond77.preheader:                             ; preds = %for.cond77.preheader.preheader, %for.inc120
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc120 ], [ %indvars.iv28, %for.cond77.preheader.preheader ]
  %i1.111 = phi i32 [ %add121, %for.inc120 ], [ %i3.113, %for.cond77.preheader.preheader ]
  %cmp788 = icmp sgt i32 %i1.111, %mul8, !dbg !271
  br i1 %cmp788, label %for.inc120, label %for.body80.preheader, !dbg !275

for.body80.preheader:                             ; preds = %for.cond77.preheader
  br label %for.body80, !dbg !276

for.body80:                                       ; preds = %for.body80.preheader, %for.body80
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.body80 ], [ %indvars.iv30, %for.body80.preheader ]
  %i2.19 = phi i32 [ %add118, %for.body80 ], [ %i1.111, %for.body80.preheader ]
  tail call void @llvm.dbg.value(metadata i32 %add118, i64 0, metadata !57, metadata !79), !dbg !276
  %23 = add nsw i64 %indvars.iv32, %17, !dbg !277
  %arrayidx83 = getelementptr inbounds double* %data, i64 %23, !dbg !279
  %24 = load double* %arrayidx83, align 8, !dbg !279, !tbaa !117
  %25 = add nsw i64 %23, 1, !dbg !280
  %arrayidx87 = getelementptr inbounds double* %data, i64 %25, !dbg !281
  %26 = load double* %arrayidx87, align 8, !dbg !281, !tbaa !117
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !64, metadata !79), !dbg !230
  %27 = insertelement <2 x double> undef, double %26, i32 0, !dbg !282
  %28 = insertelement <2 x double> %27, double %26, i32 1, !dbg !282
  %29 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> <i32 1, i32 0>, !dbg !282
  %30 = fmul <2 x double> %28, %29, !dbg !282
  %31 = insertelement <2 x double> undef, double %24, i32 0, !dbg !283
  %32 = insertelement <2 x double> %31, double %24, i32 1, !dbg !283
  %33 = fmul <2 x double> %32, %22, !dbg !283
  %34 = fsub <2 x double> %33, %30, !dbg !283
  %35 = fadd <2 x double> %33, %30, !dbg !283
  %36 = shufflevector <2 x double> %34, <2 x double> %35, <2 x i32> <i32 0, i32 3>, !dbg !283
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !63, metadata !79), !dbg !284
  %arrayidx99 = getelementptr inbounds double* %data, i64 %indvars.iv32, !dbg !285
  %37 = load double* %arrayidx99, align 8, !dbg !285, !tbaa !117
  %38 = extractelement <2 x double> %34, i32 0, !dbg !285
  %sub100 = fsub double %37, %38, !dbg !285
  store double %sub100, double* %arrayidx83, align 8, !dbg !286, !tbaa !117
  %39 = add nsw i64 %indvars.iv32, 1, !dbg !287
  %arrayidx105 = getelementptr inbounds double* %data, i64 %39, !dbg !288
  %40 = load double* %arrayidx105, align 8, !dbg !288, !tbaa !117
  %41 = extractelement <2 x double> %35, i32 1, !dbg !288
  %sub106 = fsub double %40, %41, !dbg !288
  store double %sub106, double* %arrayidx87, align 8, !dbg !289, !tbaa !117
  %42 = bitcast double* %arrayidx99 to <2 x double>*, !dbg !290
  %43 = load <2 x double>* %42, align 8, !dbg !290, !tbaa !117
  %44 = fadd <2 x double> %36, %43, !dbg !290
  %45 = bitcast double* %arrayidx99 to <2 x double>*, !dbg !290
  store <2 x double> %44, <2 x double>* %45, align 8, !dbg !290, !tbaa !117
  %add118 = add nsw i32 %i2.19, %shl58, !dbg !291
  tail call void @llvm.dbg.value(metadata i32 %add118, i64 0, metadata !46, metadata !79), !dbg !204
  %cmp78 = icmp sgt i32 %add118, %mul8, !dbg !271
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, %16, !dbg !275
  br i1 %cmp78, label %for.inc120.loopexit, label %for.body80, !dbg !275

for.inc120.loopexit:                              ; preds = %for.body80
  br label %for.inc120

for.inc120:                                       ; preds = %for.inc120.loopexit, %for.cond77.preheader
  %add121 = add nsw i32 %i1.111, 2, !dbg !292
  tail call void @llvm.dbg.value(metadata i32 %add121, i64 0, metadata !45, metadata !79), !dbg !235
  %cmp74 = icmp sgt i32 %add121, %sub73, !dbg !269
  %indvars.iv.next31 = add nsw i64 %indvars.iv30, 2, !dbg !270
  br i1 %cmp74, label %for.end122.loopexit, label %for.cond77.preheader, !dbg !270

for.end122.loopexit:                              ; preds = %for.inc120
  br label %for.end122

for.end122:                                       ; preds = %for.end122.loopexit, %for.cond71.preheader
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !70, metadata !79), !dbg !252
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !69, metadata !79), !dbg !257
  %46 = fmul <2 x double> %19, %22, !dbg !263
  %47 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> <i32 1, i32 0>, !dbg !265
  %48 = fmul <2 x double> %47, %21, !dbg !265
  %49 = fsub <2 x double> %46, %48, !dbg !263
  %50 = fadd <2 x double> %46, %48, !dbg !263
  %51 = shufflevector <2 x double> %49, <2 x double> %50, <2 x i32> <i32 0, i32 3>, !dbg !263
  %52 = fadd <2 x double> %22, %51, !dbg !263
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !66, metadata !79), !dbg !258
  tail call void @llvm.dbg.value(metadata i32 %add72, i64 0, metadata !47, metadata !79), !dbg !233
  %cmp68 = icmp sgt i32 %add72, %ifp1.017, !dbg !259
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, %8, !dbg !262
  br i1 %cmp68, label %while.cond55.loopexit.loopexit, label %for.cond71.preheader, !dbg !262

while.end134.loopexit:                            ; preds = %while.cond55.loopexit
  br label %while.end134

while.end134:                                     ; preds = %while.end134.loopexit, %while.cond55.preheader
  tail call void @llvm.dbg.value(metadata i32 %mul6, i64 0, metadata !60, metadata !79), !dbg !293
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, -1, !dbg !192
  %cmp2 = icmp sgt i64 %indvars.iv38, 1, !dbg !294
  br i1 %cmp2, label %while.end134.for.body3_crit_edge, label %for.end137, !dbg !192

while.end134.for.body3_crit_edge:                 ; preds = %while.end134
  %arrayidx5.phi.trans.insert = getelementptr inbounds [3 x i32]* @main.nsize, i64 0, i64 %indvars.iv.next39
  %.pre = load i32* %arrayidx5.phi.trans.insert, align 4, !dbg !297, !tbaa !85
  br label %for.body3, !dbg !192

for.end137:                                       ; preds = %while.end134
  ret void, !dbg !298
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }
attributes #7 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!76, !77}
!llvm.ident = !{!78}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !71, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c] [DW_LANG_C99]
!1 = !{!"ffbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!8, !36}
!8 = !{!"0x2e\00main\00main\00\00227\000\001\000\000\000\001\00228", !1, !9, !10, null, i32 ()* @main, null, null, !13} ; [ DW_TAG_subprogram ] [line 227] [def] [scope 228] [main]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!12}
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!14, !15, !16, !17, !18, !19, !20, !21, !22, !24, !25, !26, !27, !28, !29, !30, !31, !33, !34, !35}
!14 = !{!"0x100\00i\00229\000", !8, !9, !12}      ; [ DW_TAG_auto_variable ] [i] [line 229]
!15 = !{!"0x100\00j\00229\000", !8, !9, !12}      ; [ DW_TAG_auto_variable ] [j] [line 229]
!16 = !{!"0x100\00k\00229\000", !8, !9, !12}      ; [ DW_TAG_auto_variable ] [k] [line 229]
!17 = !{!"0x100\00l\00229\000", !8, !9, !12}      ; [ DW_TAG_auto_variable ] [l] [line 229]
!18 = !{!"0x100\00m\00229\000", !8, !9, !12}      ; [ DW_TAG_auto_variable ] [m] [line 229]
!19 = !{!"0x100\00npasses\00229\000", !8, !9, !12} ; [ DW_TAG_auto_variable ] [npasses] [line 229]
!20 = !{!"0x100\00faedge\00229\000", !8, !9, !12} ; [ DW_TAG_auto_variable ] [faedge] [line 229]
!21 = !{!"0x100\00fdata\00230\000", !8, !9, !4}   ; [ DW_TAG_auto_variable ] [fdata] [line 230]
!22 = !{!"0x100\00fanum\00232\000", !8, !9, !23}  ; [ DW_TAG_auto_variable ] [fanum] [line 232]
!23 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!24 = !{!"0x100\00fasize\00232\000", !8, !9, !23} ; [ DW_TAG_auto_variable ] [fasize] [line 232]
!25 = !{!"0x100\00mapbase\00233\000", !8, !9, !5} ; [ DW_TAG_auto_variable ] [mapbase] [line 233]
!26 = !{!"0x100\00mapscale\00233\000", !8, !9, !5} ; [ DW_TAG_auto_variable ] [mapscale] [line 233]
!27 = !{!"0x100\00rmin\00233\000", !8, !9, !5}    ; [ DW_TAG_auto_variable ] [rmin] [line 233]
!28 = !{!"0x100\00rmax\00233\000", !8, !9, !5}    ; [ DW_TAG_auto_variable ] [rmax] [line 233]
!29 = !{!"0x100\00imin\00233\000", !8, !9, !5}    ; [ DW_TAG_auto_variable ] [imin] [line 233]
!30 = !{!"0x100\00imax\00233\000", !8, !9, !5}    ; [ DW_TAG_auto_variable ] [imax] [line 233]
!31 = !{!"0x100\00r\00269\000", !32, !9, !5}      ; [ DW_TAG_auto_variable ] [r] [line 269]
!32 = !{!"0xb\00268\002\0012", !1, !8}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!33 = !{!"0x100\00ij\00269\000", !32, !9, !5}     ; [ DW_TAG_auto_variable ] [ij] [line 269]
!34 = !{!"0x100\00ar\00269\000", !32, !9, !5}     ; [ DW_TAG_auto_variable ] [ar] [line 269]
!35 = !{!"0x100\00ai\00269\000", !32, !9, !5}     ; [ DW_TAG_auto_variable ] [ai] [line 269]
!36 = !{!"0x2e\00fourn\00fourn\00\00157\001\001\000\000\000\001\00160", !1, !9, !37, null, void (double*, i32)* @fourn, null, null, !40} ; [ DW_TAG_subprogram ] [line 157] [local] [def] [scope 160] [fourn]
!37 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !38, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = !{null, !4, !39, !12, !12}
!39 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!40 = !{!41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!41 = !{!"0x101\00data\0016777374\000", !36, !9, !4} ; [ DW_TAG_arg_variable ] [data] [line 158]
!42 = !{!"0x101\00nn\0033554591\000", !36, !9, !39} ; [ DW_TAG_arg_variable ] [nn] [line 159]
!43 = !{!"0x101\00ndim\0050331807\000", !36, !9, !12} ; [ DW_TAG_arg_variable ] [ndim] [line 159]
!44 = !{!"0x101\00isign\0067109023\000", !36, !9, !12} ; [ DW_TAG_arg_variable ] [isign] [line 159]
!45 = !{!"0x100\00i1\00161\000", !36, !9, !12}    ; [ DW_TAG_auto_variable ] [i1] [line 161]
!46 = !{!"0x100\00i2\00161\000", !36, !9, !12}    ; [ DW_TAG_auto_variable ] [i2] [line 161]
!47 = !{!"0x100\00i3\00161\000", !36, !9, !12}    ; [ DW_TAG_auto_variable ] [i3] [line 161]
!48 = !{!"0x100\00i2rev\00162\000", !36, !9, !12} ; [ DW_TAG_auto_variable ] [i2rev] [line 162]
!49 = !{!"0x100\00i3rev\00162\000", !36, !9, !12} ; [ DW_TAG_auto_variable ] [i3rev] [line 162]
!50 = !{!"0x100\00ip1\00162\000", !36, !9, !12}   ; [ DW_TAG_auto_variable ] [ip1] [line 162]
!51 = !{!"0x100\00ip2\00162\000", !36, !9, !12}   ; [ DW_TAG_auto_variable ] [ip2] [line 162]
!52 = !{!"0x100\00ip3\00162\000", !36, !9, !12}   ; [ DW_TAG_auto_variable ] [ip3] [line 162]
!53 = !{!"0x100\00ifp1\00162\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [ifp1] [line 162]
!54 = !{!"0x100\00ifp2\00162\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [ifp2] [line 162]
!55 = !{!"0x100\00ibit\00163\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [ibit] [line 163]
!56 = !{!"0x100\00idim\00163\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [idim] [line 163]
!57 = !{!"0x100\00k1\00163\000", !36, !9, !12}    ; [ DW_TAG_auto_variable ] [k1] [line 163]
!58 = !{!"0x100\00k2\00163\000", !36, !9, !12}    ; [ DW_TAG_auto_variable ] [k2] [line 163]
!59 = !{!"0x100\00n\00163\000", !36, !9, !12}     ; [ DW_TAG_auto_variable ] [n] [line 163]
!60 = !{!"0x100\00nprev\00163\000", !36, !9, !12} ; [ DW_TAG_auto_variable ] [nprev] [line 163]
!61 = !{!"0x100\00nrem\00163\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [nrem] [line 163]
!62 = !{!"0x100\00ntot\00163\000", !36, !9, !12}  ; [ DW_TAG_auto_variable ] [ntot] [line 163]
!63 = !{!"0x100\00tempi\00164\000", !36, !9, !5}  ; [ DW_TAG_auto_variable ] [tempi] [line 164]
!64 = !{!"0x100\00tempr\00164\000", !36, !9, !5}  ; [ DW_TAG_auto_variable ] [tempr] [line 164]
!65 = !{!"0x100\00theta\00165\000", !36, !9, !5}  ; [ DW_TAG_auto_variable ] [theta] [line 165]
!66 = !{!"0x100\00wi\00165\000", !36, !9, !5}     ; [ DW_TAG_auto_variable ] [wi] [line 165]
!67 = !{!"0x100\00wpi\00165\000", !36, !9, !5}    ; [ DW_TAG_auto_variable ] [wpi] [line 165]
!68 = !{!"0x100\00wpr\00165\000", !36, !9, !5}    ; [ DW_TAG_auto_variable ] [wpr] [line 165]
!69 = !{!"0x100\00wr\00165\000", !36, !9, !5}     ; [ DW_TAG_auto_variable ] [wr] [line 165]
!70 = !{!"0x100\00wtemp\00165\000", !36, !9, !5}  ; [ DW_TAG_auto_variable ] [wtemp] [line 165]
!71 = !{!72}
!72 = !{!"0x34\00nsize\00nsize\00\00231\001\001", !8, !9, !73, [3 x i32]* @main.nsize, null} ; [ DW_TAG_variable ] [nsize] [line 231] [local] [def]
!73 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !12, !74, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!74 = !{!75}
!75 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 2}
!78 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!79 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!80 = !MDLocation(line: 229, column: 21, scope: !8)
!81 = !MDLocation(line: 229, column: 39, scope: !8)
!82 = !MDLocation(line: 232, column: 7, scope: !8)
!83 = !MDLocation(line: 232, column: 14, scope: !8)
!84 = !MDLocation(line: 238, column: 13, scope: !8)
!85 = !{!86, !86, i64 0}
!86 = !{!"int", !87, i64 0}
!87 = !{!"omnipotent char", !88, i64 0}
!88 = !{!"Simple C/C++ TBAA"}
!89 = !MDLocation(line: 238, column: 2, scope: !8)
!90 = !MDLocation(line: 240, column: 20, scope: !8)
!91 = !MDLocation(line: 240, column: 10, scope: !8)
!92 = !MDLocation(line: 230, column: 9, scope: !8)
!93 = !MDLocation(line: 241, column: 6, scope: !94)
!94 = !{!"0xb\00241\006\000", !1, !8}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!95 = !MDLocation(line: 241, column: 6, scope: !8)
!96 = !MDLocation(line: 242, column: 20, scope: !97)
!97 = !{!"0xb\00241\0021\001", !1, !94}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!98 = !{!99, !99, i64 0}
!99 = !{!"any pointer", !87, i64 0}
!100 = !MDLocation(line: 242, column: 12, scope: !97)
!101 = !MDLocation(line: 243, column: 5, scope: !97)
!102 = !MDLocation(line: 251, column: 2, scope: !8)
!103 = !MDLocation(line: 229, column: 6, scope: !8)
!104 = !MDLocation(line: 252, column: 2, scope: !105)
!105 = !{!"0xb\00252\002\002", !1, !8}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!106 = !MDLocation(line: 254, column: 13, scope: !107)
!107 = !{!"0xb\00254\0012\008", !1, !108}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!108 = !{!"0xb\00253\0034\007", !1, !109}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!109 = !{!"0xb\00253\005\006", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!110 = !{!"0xb\00253\005\005", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!111 = !{!"0xb\00252\0031\004", !1, !112}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!112 = !{!"0xb\00252\002\003", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!113 = !MDLocation(line: 255, column: 4, scope: !107)
!114 = !MDLocation(line: 253, column: 5, scope: !110)
!115 = !MDLocation(line: 254, column: 32, scope: !107)
!116 = !MDLocation(line: 254, column: 12, scope: !108)
!117 = !{!118, !118, i64 0}
!118 = !{!"double", !87, i64 0}
!119 = !MDLocation(line: 262, column: 5, scope: !120)
!120 = !{!"0xb\00259\0032\0011", !1, !121}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!121 = !{!"0xb\00259\002\0010", !1, !122}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!122 = !{!"0xb\00259\002\009", !1, !8}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!123 = !MDLocation(line: 265, column: 5, scope: !120)
!124 = !MDLocation(line: 259, column: 27, scope: !121)
!125 = !MDLocation(line: 259, column: 2, scope: !122)
!126 = !MDLocation(line: 276, column: 12, scope: !127)
!127 = !{!"0xb\00275\0037\0015", !1, !128}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!128 = !{!"0xb\00275\005\0014", !1, !129}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!129 = !{!"0xb\00275\005\0013", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!130 = !MDLocation(line: 269, column: 12, scope: !32)
!131 = !MDLocation(line: 280, column: 15, scope: !127)
!132 = !MDLocation(line: 233, column: 28, scope: !8)
!133 = !MDLocation(line: 281, column: 15, scope: !127)
!134 = !MDLocation(line: 233, column: 34, scope: !8)
!135 = !MDLocation(line: 275, column: 5, scope: !129)
!136 = !MDLocation(line: 275, column: 17, scope: !128)
!137 = !MDLocation(line: 233, column: 9, scope: !8)
!138 = !MDLocation(line: 292, column: 23, scope: !32)
!139 = !MDLocation(line: 292, column: 16, scope: !32)
!140 = !MDLocation(line: 233, column: 18, scope: !8)
!141 = !MDLocation(line: 229, column: 18, scope: !8)
!142 = !MDLocation(line: 298, column: 2, scope: !143)
!143 = !{!"0xb\00298\002\0016", !1, !8}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!144 = !MDLocation(line: 300, column: 13, scope: !145)
!145 = !{!"0xb\00299\0034\0021", !1, !146}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!146 = !{!"0xb\00299\005\0020", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!147 = !{!"0xb\00299\005\0019", !1, !148}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!148 = !{!"0xb\00298\0031\0018", !1, !149}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!149 = !{!"0xb\00298\002\0017", !1, !143}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!150 = !MDLocation(line: 301, column: 15, scope: !145)
!151 = !MDLocation(line: 301, column: 14, scope: !145)
!152 = !MDLocation(line: 299, column: 5, scope: !147)
!153 = !MDLocation(line: 300, column: 12, scope: !145)
!154 = !MDLocation(line: 229, column: 12, scope: !8)
!155 = !MDLocation(line: 301, column: 13, scope: !145)
!156 = !MDLocation(line: 301, column: 33, scope: !145)
!157 = !MDLocation(line: 301, column: 12, scope: !158)
!158 = !{!"0xb\003", !1, !159}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!159 = !{!"0xb\001", !1, !145}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!160 = !MDLocation(line: 229, column: 15, scope: !8)
!161 = !MDLocation(line: 302, column: 12, scope: !162)
!162 = !{!"0xb\00302\0012\0022", !1, !145}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!163 = !MDLocation(line: 302, column: 12, scope: !145)
!164 = !MDLocation(line: 303, column: 4, scope: !165)
!165 = !{!"0xb\00302\0020\0023", !1, !162}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!166 = !MDLocation(line: 304, column: 12, scope: !165)
!167 = !MDLocation(line: 304, column: 4, scope: !165)
!168 = !MDLocation(line: 307, column: 8, scope: !165)
!169 = !MDLocation(line: 310, column: 6, scope: !170)
!170 = !{!"0xb\00310\006\0024", !1, !8}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!171 = !MDLocation(line: 311, column: 20, scope: !172)
!172 = !{!"0xb\00310\0014\0025", !1, !170}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!173 = !MDLocation(line: 310, column: 6, scope: !8)
!174 = !MDLocation(line: 311, column: 12, scope: !172)
!175 = !MDLocation(line: 312, column: 2, scope: !172)
!176 = !MDLocation(line: 313, column: 12, scope: !177)
!177 = !{!"0xb\00312\009\0026", !1, !170}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!178 = !MDLocation(line: 360, column: 2, scope: !8)
!179 = !MDLocation(line: 159, column: 7, scope: !36)
!180 = !MDLocation(line: 159, column: 13, scope: !36)
!181 = !MDLocation(line: 163, column: 42, scope: !36)
!182 = !MDLocation(line: 163, column: 12, scope: !36)
!183 = !MDLocation(line: 169, column: 13, scope: !184)
!184 = !{!"0xb\00168\002\0028", !1, !185}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!185 = !{!"0xb\00168\002\0027", !1, !36}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!186 = !MDLocation(line: 169, column: 5, scope: !184)
!187 = !MDLocation(line: 198, column: 16, scope: !188)
!188 = !{!"0xb\00196\0024\0044", !1, !189}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!189 = !{!"0xb\00171\0039\0031", !1, !190}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!190 = !{!"0xb\00171\002\0030", !1, !191}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!191 = !{!"0xb\00171\002\0029", !1, !36}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!192 = !MDLocation(line: 171, column: 2, scope: !191)
!193 = !MDLocation(line: 163, column: 26, scope: !36)
!194 = !MDLocation(line: 173, column: 20, scope: !189)
!195 = !MDLocation(line: 173, column: 12, scope: !189)
!196 = !MDLocation(line: 163, column: 36, scope: !36)
!197 = !MDLocation(line: 174, column: 11, scope: !189)
!198 = !MDLocation(line: 162, column: 20, scope: !36)
!199 = !MDLocation(line: 175, column: 11, scope: !189)
!200 = !MDLocation(line: 162, column: 25, scope: !36)
!201 = !MDLocation(line: 176, column: 11, scope: !189)
!202 = !MDLocation(line: 162, column: 30, scope: !36)
!203 = !MDLocation(line: 162, column: 6, scope: !36)
!204 = !MDLocation(line: 161, column: 19, scope: !36)
!205 = !MDLocation(line: 178, column: 18, scope: !206)
!206 = !{!"0xb\00178\005\0033", !1, !207}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!207 = !{!"0xb\00178\005\0032", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!208 = !MDLocation(line: 178, column: 5, scope: !207)
!209 = !MDLocation(line: 180, column: 24, scope: !210)
!210 = !{!"0xb\00180\004\0038", !1, !211}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!211 = !{!"0xb\00180\004\0037", !1, !212}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!212 = !{!"0xb\00179\0024\0036", !1, !213}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!213 = !{!"0xb\00179\0012\0035", !1, !214}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!214 = !{!"0xb\00178\0040\0034", !1, !206}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!215 = !MDLocation(line: 196, column: 12, scope: !189)
!216 = !MDLocation(line: 196, column: 5, scope: !189)
!217 = !MDLocation(line: 179, column: 12, scope: !213)
!218 = !MDLocation(line: 179, column: 12, scope: !214)
!219 = !MDLocation(line: 180, column: 18, scope: !210)
!220 = !MDLocation(line: 180, column: 4, scope: !211)
!221 = !MDLocation(line: 182, column: 18, scope: !222)
!222 = !{!"0xb\00181\0043\0042", !1, !223}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!223 = !{!"0xb\00181\007\0041", !1, !224}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!224 = !{!"0xb\00181\007\0040", !1, !225}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!225 = !{!"0xb\00180\0047\0039", !1, !210}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!226 = !MDLocation(line: 181, column: 21, scope: !223)
!227 = !MDLocation(line: 181, column: 7, scope: !224)
!228 = !MDLocation(line: 162, column: 13, scope: !36)
!229 = !MDLocation(line: 183, column: 10, scope: !222)
!230 = !MDLocation(line: 164, column: 15, scope: !36)
!231 = !MDLocation(line: 184, column: 10, scope: !222)
!232 = !MDLocation(line: 181, column: 32, scope: !223)
!233 = !MDLocation(line: 161, column: 23, scope: !36)
!234 = !MDLocation(line: 180, column: 38, scope: !210)
!235 = !MDLocation(line: 161, column: 15, scope: !36)
!236 = !MDLocation(line: 188, column: 15, scope: !214)
!237 = !MDLocation(line: 189, column: 30, scope: !214)
!238 = !MDLocation(line: 189, column: 15, scope: !214)
!239 = !MDLocation(line: 190, column: 4, scope: !240)
!240 = !{!"0xb\00189\0044\0043", !1, !214}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!241 = !MDLocation(line: 189, column: 8, scope: !242)
!242 = !{!"0xb\003", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!243 = !MDLocation(line: 193, column: 8, scope: !214)
!244 = !MDLocation(line: 178, column: 29, scope: !206)
!245 = !MDLocation(line: 197, column: 15, scope: !188)
!246 = !MDLocation(line: 162, column: 41, scope: !36)
!247 = !MDLocation(line: 198, column: 44, scope: !188)
!248 = !MDLocation(line: 198, column: 43, scope: !188)
!249 = !MDLocation(line: 165, column: 9, scope: !36)
!250 = !MDLocation(line: 199, column: 20, scope: !188)
!251 = !MDLocation(line: 199, column: 16, scope: !188)
!252 = !MDLocation(line: 165, column: 34, scope: !36)
!253 = !MDLocation(line: 200, column: 14, scope: !188)
!254 = !MDLocation(line: 165, column: 25, scope: !36)
!255 = !MDLocation(line: 201, column: 14, scope: !188)
!256 = !MDLocation(line: 165, column: 20, scope: !36)
!257 = !MDLocation(line: 165, column: 30, scope: !36)
!258 = !MDLocation(line: 165, column: 16, scope: !36)
!259 = !MDLocation(line: 204, column: 21, scope: !260)
!260 = !{!"0xb\00204\008\0046", !1, !261}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!261 = !{!"0xb\00204\008\0045", !1, !188}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!262 = !MDLocation(line: 204, column: 8, scope: !261)
!263 = !MDLocation(line: 217, column: 9, scope: !264)
!264 = !{!"0xb\00204\0044\0047", !1, !260}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!265 = !MDLocation(line: 217, column: 30, scope: !264)
!266 = !MDLocation(line: 205, column: 24, scope: !267)
!267 = !{!"0xb\00205\004\0049", !1, !268}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!268 = !{!"0xb\00205\004\0048", !1, !264}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!269 = !MDLocation(line: 205, column: 18, scope: !267)
!270 = !MDLocation(line: 205, column: 4, scope: !268)
!271 = !MDLocation(line: 206, column: 21, scope: !272)
!272 = !{!"0xb\00206\007\0052", !1, !273}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!273 = !{!"0xb\00206\007\0051", !1, !274}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!274 = !{!"0xb\00205\0047\0050", !1, !267}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!275 = !MDLocation(line: 206, column: 7, scope: !273)
!276 = !MDLocation(line: 163, column: 18, scope: !36)
!277 = !MDLocation(line: 208, column: 15, scope: !278)
!278 = !{!"0xb\00206\0044\0053", !1, !272}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!279 = !MDLocation(line: 209, column: 23, scope: !278)
!280 = !MDLocation(line: 209, column: 44, scope: !278)
!281 = !MDLocation(line: 209, column: 39, scope: !278)
!282 = !MDLocation(line: 209, column: 34, scope: !278)
!283 = !MDLocation(line: 209, column: 18, scope: !278)
!284 = !MDLocation(line: 164, column: 8, scope: !36)
!285 = !MDLocation(line: 211, column: 21, scope: !278)
!286 = !MDLocation(line: 211, column: 10, scope: !278)
!287 = !MDLocation(line: 212, column: 30, scope: !278)
!288 = !MDLocation(line: 212, column: 25, scope: !278)
!289 = !MDLocation(line: 212, column: 10, scope: !278)
!290 = !MDLocation(line: 213, column: 10, scope: !278)
!291 = !MDLocation(line: 206, column: 32, scope: !272)
!292 = !MDLocation(line: 205, column: 38, scope: !267)
!293 = !MDLocation(line: 163, column: 29, scope: !36)
!294 = !MDLocation(line: 171, column: 20, scope: !295)
!295 = !{!"0xb\002", !1, !296}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!296 = !{!"0xb\001", !1, !190}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ffbench.c]
!297 = !MDLocation(line: 172, column: 9, scope: !189)
!298 = !MDLocation(line: 224, column: 1, scope: !36)
