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
@.str3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !98), !dbg !99
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !98), !dbg !100
  tail call void @llvm.dbg.value(metadata i64 100000, i64 0, metadata !40, metadata !98), !dbg !101
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !98), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !98), !dbg !103
  %cmp447 = icmp sgt i32 %argc, 1, !dbg !104
  br i1 %cmp447, label %while.body.lr.ph, label %LCONT.preheader, !dbg !105

while.body.lr.ph:                                 ; preds = %entry
  %0 = sext i32 %argc to i64, !dbg !105
  br label %while.body, !dbg !105

LCONT.preheader.loopexit:                         ; preds = %if.end18
  %continuous.1.lcssa = phi i32 [ %continuous.1, %if.end18 ]
  %loopstart.1.lcssa = phi i64 [ %loopstart.1, %if.end18 ]
  br label %LCONT.preheader

LCONT.preheader:                                  ; preds = %LCONT.preheader.loopexit, %entry
  %continuous.0.lcssa = phi i32 [ 0, %entry ], [ %continuous.1.lcssa, %LCONT.preheader.loopexit ]
  %loopstart.0.lcssa = phi i64 [ 100000, %entry ], [ %loopstart.1.lcssa, %LCONT.preheader.loopexit ]
  %mul = mul nsw i64 %loopstart.0.lcssa, 12, !dbg !106
  %mul20 = mul nsw i64 %loopstart.0.lcssa, 14, !dbg !107
  %mul21 = mul nsw i64 %loopstart.0.lcssa, 345, !dbg !108
  %mul22 = mul nsw i64 %loopstart.0.lcssa, 210, !dbg !109
  %mul23 = shl nsw i64 %loopstart.0.lcssa, 5, !dbg !110
  %mul24 = mul nsw i64 %loopstart.0.lcssa, 899, !dbg !111
  %mul25 = mul nsw i64 %loopstart.0.lcssa, 616, !dbg !112
  %mul26 = mul nsw i64 %loopstart.0.lcssa, 93, !dbg !113
  %cmp50400 = icmp slt i64 %loopstart.0.lcssa, 1, !dbg !114
  %tobool = icmp eq i32 %continuous.0.lcssa, 0, !dbg !117
  %1 = mul i64 %loopstart.0.lcssa, 345, !dbg !118
  %2 = icmp sgt i64 %1, 1
  %smax = select i1 %2, i64 %1, i64 1
  %3 = icmp sgt i64 %1, 1
  %smax473 = select i1 %3, i64 %1, i64 1
  %4 = lshr i64 %smax473, 2, !dbg !118
  %5 = mul i64 %4, 4, !dbg !118
  %6 = add i64 %5, -4, !dbg !118
  %7 = lshr i64 %6, 2, !dbg !118
  %8 = add i64 %7, 1, !dbg !118
  %9 = mul i64 %loopstart.0.lcssa, 345, !dbg !118
  %10 = mul i64 %loopstart.0.lcssa, 210, !dbg !118
  %11 = icmp sgt i64 %10, 1
  %smax480 = select i1 %11, i64 %10, i64 1
  %12 = mul i64 %loopstart.0.lcssa, 616, !dbg !118
  %13 = icmp sgt i64 %12, 1
  %smax486 = select i1 %13, i64 %12, i64 1
  br label %LCONT, !dbg !118

while.body:                                       ; preds = %while.body.lr.ph, %if.end18
  %indvars.iv = phi i64 [ 1, %while.body.lr.ph ], [ %indvars.iv.next, %if.end18 ]
  %continuous.0450 = phi i32 [ 0, %while.body.lr.ph ], [ %continuous.1, %if.end18 ]
  %loopstart.0449 = phi i64 [ 100000, %while.body.lr.ph ], [ %loopstart.1, %if.end18 ]
  %arrayidx = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !119
  %14 = load i8** %arrayidx, align 8, !dbg !119, !tbaa !122
  %call = tail call i32 @strncmp(i8* %14, i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i64 2) #5, !dbg !119
  %cmp1 = icmp eq i32 %call, 0, !dbg !119
  br i1 %cmp1, label %if.end18, label %lor.lhs.false, !dbg !126

lor.lhs.false:                                    ; preds = %while.body
  %15 = load i8* %14, align 1, !dbg !127, !tbaa !128
  %cmp5 = icmp eq i8 %15, 99, !dbg !127
  br i1 %cmp5, label %if.end18, label %if.else, !dbg !126

if.else:                                          ; preds = %lor.lhs.false
  tail call void @llvm.dbg.value(metadata i8* %14, i64 0, metadata !129, metadata !98) #4, !dbg !132
  %call.i = tail call i64 @strtol(i8* nocapture %14, i8** null, i32 10) #4, !dbg !133
  %cmp10 = icmp sgt i64 %call.i, 0, !dbg !130
  br i1 %cmp10, label %if.end18, label %if.else16, !dbg !134

if.else16:                                        ; preds = %if.else
  %16 = load %struct._IO_FILE** @stderr, align 8, !dbg !135, !tbaa !122
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %16) #6, !dbg !137
  br label %return, !dbg !138

if.end18:                                         ; preds = %if.else, %while.body, %lor.lhs.false
  %loopstart.1 = phi i64 [ %loopstart.0449, %lor.lhs.false ], [ %loopstart.0449, %while.body ], [ %call.i, %if.else ]
  %continuous.1 = phi i32 [ 1, %lor.lhs.false ], [ 1, %while.body ], [ %continuous.0450, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !105
  %cmp = icmp slt i64 %indvars.iv.next, %0, !dbg !104
  br i1 %cmp, label %while.body, label %LCONT.preheader.loopexit, !dbg !105

LCONT:                                            ; preds = %LCONT.preheader, %if.then247
  %call19 = tail call i64 @time(i64* null) #4, !dbg !118
  tail call void @llvm.dbg.value(metadata i64 %call19, i64 0, metadata !41, metadata !98), !dbg !139
  store double 4.999750e-01, double* @T, align 8, !dbg !140, !tbaa !141
  store double 5.002500e-01, double* @T1, align 8, !dbg !143, !tbaa !141
  store double 2.000000e+00, double* @T2, align 8, !dbg !144, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %loopstart.1, i64 0, metadata !37, metadata !98), !dbg !145
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !38, metadata !98), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !39, metadata !98), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !19, metadata !98), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !20, metadata !98), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !21, metadata !98), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 %mul21, i64 0, metadata !22, metadata !98), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %mul22, i64 0, metadata !23, metadata !98), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !24, metadata !98), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 %mul24, i64 0, metadata !25, metadata !98), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 %mul25, i64 0, metadata !26, metadata !98), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !98), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %mul26, i64 0, metadata !28, metadata !98), !dbg !156
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !29, metadata !98), !dbg !157
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !31, metadata !98), !dbg !158
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !32, metadata !98), !dbg !159
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !33, metadata !98), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !98) #4, !dbg !165
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !98) #4, !dbg !167
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !168, metadata !98) #4, !dbg !169
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !170, metadata !98) #4, !dbg !171
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !172, metadata !98) #4, !dbg !173
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !174, metadata !98) #4, !dbg !175
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !176, metadata !98) #4, !dbg !177
  %call.i381 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 0, i64 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !178
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !179, !tbaa !141
  store <2 x double> <double -1.000000e+00, double -1.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2) to <2 x double>*), align 16, !dbg !180, !tbaa !141
  store double -1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !181, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then75.thread, label %for.body52.lr.ph, !dbg !182

if.then75.thread:                                 ; preds = %LCONT
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !183, metadata !98) #4, !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !187, metadata !98) #4, !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !189, metadata !98) #4, !dbg !190
  tail call void @llvm.dbg.value(metadata double %mul56, i64 0, metadata !191, metadata !98) #4, !dbg !192
  tail call void @llvm.dbg.value(metadata double %mul60, i64 0, metadata !193, metadata !98) #4, !dbg !194
  tail call void @llvm.dbg.value(metadata double %mul64, i64 0, metadata !195, metadata !98) #4, !dbg !196
  tail call void @llvm.dbg.value(metadata double %mul69, i64 0, metadata !197, metadata !98) #4, !dbg !198
  %call.i382457 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul, i64 %mul20, i64 %mul, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then86.thread, !dbg !200

for.body52.lr.ph:                                 ; preds = %LCONT
  %18 = load double* @T, align 8, !dbg !202, !tbaa !141
  br label %for.body52, !dbg !182

for.body52:                                       ; preds = %for.body52, %for.body52.lr.ph
  %19 = phi double [ -1.000000e+00, %for.body52.lr.ph ], [ %mul60, %for.body52 ], !dbg !204
  %mul69405 = phi double [ -1.000000e+00, %for.body52.lr.ph ], [ %mul69, %for.body52 ], !dbg !204
  %mul64403 = phi double [ -1.000000e+00, %for.body52.lr.ph ], [ %mul64, %for.body52 ], !dbg !204
  %20 = phi double [ 1.000000e+00, %for.body52.lr.ph ], [ %mul56, %for.body52 ]
  %I.1401 = phi i64 [ 1, %for.body52.lr.ph ], [ %inc71, %for.body52 ]
  %add53 = fadd double %20, %19, !dbg !204
  %add54 = fadd double %add53, %mul64403, !dbg !204
  %sub55 = fsub double %add54, %mul69405, !dbg !204
  %mul56 = fmul double %sub55, %18, !dbg !205
  %add57 = fadd double %mul56, %19, !dbg !206
  %sub58 = fsub double %add57, %mul64403, !dbg !206
  %add59 = fadd double %sub58, %mul69405, !dbg !206
  %mul60 = fmul double %add59, %18, !dbg !207
  %sub61 = fsub double %mul56, %mul60, !dbg !208
  %add62 = fadd double %sub61, %mul64403, !dbg !208
  %add63 = fadd double %add62, %mul69405, !dbg !208
  %mul64 = fmul double %add63, %18, !dbg !209
  %add66 = fsub double %mul60, %mul56, !dbg !210
  %add67 = fadd double %mul64, %add66, !dbg !210
  %add68 = fadd double %mul69405, %add67, !dbg !210
  %mul69 = fmul double %18, %add68, !dbg !211
  %inc71 = add nuw nsw i64 %I.1401, 1, !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %inc71, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp50 = icmp slt i64 %I.1401, %mul, !dbg !114
  br i1 %cmp50, label %for.body52, label %if.then75, !dbg !182

if.then75:                                        ; preds = %for.body52
  %mul69.lcssa = phi double [ %mul69, %for.body52 ]
  %mul64.lcssa = phi double [ %mul64, %for.body52 ]
  %mul60.lcssa = phi double [ %mul60, %for.body52 ]
  %mul56.lcssa = phi double [ %mul56, %for.body52 ]
  store double %mul64.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !213, !tbaa !141
  store double %mul69.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !214, !tbaa !141
  store double %mul56.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !215, !tbaa !141
  store double %mul60.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !216, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !183, metadata !98) #4, !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !187, metadata !98) #4, !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !189, metadata !98) #4, !dbg !190
  tail call void @llvm.dbg.value(metadata double %mul56, i64 0, metadata !191, metadata !98) #4, !dbg !192
  tail call void @llvm.dbg.value(metadata double %mul60, i64 0, metadata !193, metadata !98) #4, !dbg !194
  tail call void @llvm.dbg.value(metadata double %mul64, i64 0, metadata !195, metadata !98) #4, !dbg !196
  tail call void @llvm.dbg.value(metadata double %mul69, i64 0, metadata !197, metadata !98) #4, !dbg !198
  %call.i382 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul, i64 %mul20, i64 %mul, double %mul56.lcssa, double %mul60.lcssa, double %mul64.lcssa, double %mul69.lcssa) #4, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then86.thread, label %for.body80.lr.ph, !dbg !200

if.then86.thread:                                 ; preds = %if.then75, %if.then75.thread
  %.pre = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !217, !tbaa !141
  %.pre454 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !219, !tbaa !141
  %.pre455 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !220, !tbaa !141
  %.pre456 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !221, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !222, metadata !98) #4, !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !225, metadata !98) #4, !dbg !226
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !227, metadata !98) #4, !dbg !228
  tail call void @llvm.dbg.value(metadata double %mul.i.5, i64 0, metadata !229, metadata !98) #4, !dbg !230
  tail call void @llvm.dbg.value(metadata double %mul13.i.5, i64 0, metadata !231, metadata !98) #4, !dbg !232
  tail call void @llvm.dbg.value(metadata double %mul22.i.5, i64 0, metadata !233, metadata !98) #4, !dbg !234
  tail call void @llvm.dbg.value(metadata double %div.i.5, i64 0, metadata !235, metadata !98) #4, !dbg !236
  %call.i384458 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul20, i64 %mul, i64 %mul, double %.pre, double %.pre454, double %.pre455, double %.pre456) #4, !dbg !237
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then112, !dbg !238

for.body80.lr.ph:                                 ; preds = %if.then75
  %21 = load double* @T, align 8, !dbg !240, !tbaa !141
  %22 = load double* @T2, align 8, !dbg !243, !tbaa !141
  %.promoted414 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !244, !tbaa !141
  %.promoted416 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !245, !tbaa !141
  %.promoted418 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !246, !tbaa !141
  %.promoted420 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !247, !tbaa !141
  br label %for.body80, !dbg !200

for.body80:                                       ; preds = %for.body80, %for.body80.lr.ph
  %div.i.lcssa421 = phi double [ %.promoted420, %for.body80.lr.ph ], [ %div.i.5, %for.body80 ]
  %mul22.i.lcssa419 = phi double [ %.promoted418, %for.body80.lr.ph ], [ %mul22.i.5, %for.body80 ]
  %mul13.i.lcssa417 = phi double [ %.promoted416, %for.body80.lr.ph ], [ %mul13.i.5, %for.body80 ]
  %mul.i.lcssa415 = phi double [ %.promoted414, %for.body80.lr.ph ], [ %mul.i.5, %for.body80 ]
  %I.2413 = phi i64 [ 1, %for.body80.lr.ph ], [ %inc82, %for.body80 ]
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !248, metadata !98), !dbg !249
  %add.i = fadd double %mul13.i.lcssa417, %mul.i.lcssa415, !dbg !250
  %add3.i = fadd double %mul22.i.lcssa419, %add.i, !dbg !250
  %sub.i = fsub double %add3.i, %div.i.lcssa421, !dbg !250
  %mul.i = fmul double %21, %sub.i, !dbg !251
  %add8.i = fadd double %mul13.i.lcssa417, %mul.i, !dbg !252
  %sub10.i = fsub double %add8.i, %mul22.i.lcssa419, !dbg !252
  %add12.i = fadd double %div.i.lcssa421, %sub10.i, !dbg !252
  %mul13.i = fmul double %21, %add12.i, !dbg !253
  %sub17.i = fsub double %mul.i, %mul13.i, !dbg !254
  %add19.i = fadd double %mul22.i.lcssa419, %sub17.i, !dbg !254
  %add21.i = fadd double %div.i.lcssa421, %add19.i, !dbg !254
  %mul22.i = fmul double %21, %add21.i, !dbg !255
  %add27.i = fsub double %mul13.i, %mul.i, !dbg !256
  %add29.i = fadd double %add27.i, %mul22.i, !dbg !256
  %add31.i = fadd double %div.i.lcssa421, %add29.i, !dbg !256
  %div.i = fdiv double %add31.i, %22, !dbg !257
  %add.i.1 = fadd double %mul13.i, %mul.i, !dbg !250
  %add3.i.1 = fadd double %mul22.i, %add.i.1, !dbg !250
  %sub.i.1 = fsub double %add3.i.1, %div.i, !dbg !250
  %mul.i.1 = fmul double %21, %sub.i.1, !dbg !251
  %add8.i.1 = fadd double %mul13.i, %mul.i.1, !dbg !252
  %sub10.i.1 = fsub double %add8.i.1, %mul22.i, !dbg !252
  %add12.i.1 = fadd double %div.i, %sub10.i.1, !dbg !252
  %mul13.i.1 = fmul double %21, %add12.i.1, !dbg !253
  %sub17.i.1 = fsub double %mul.i.1, %mul13.i.1, !dbg !254
  %add19.i.1 = fadd double %mul22.i, %sub17.i.1, !dbg !254
  %add21.i.1 = fadd double %div.i, %add19.i.1, !dbg !254
  %mul22.i.1 = fmul double %21, %add21.i.1, !dbg !255
  %add27.i.1 = fsub double %mul13.i.1, %mul.i.1, !dbg !256
  %add29.i.1 = fadd double %add27.i.1, %mul22.i.1, !dbg !256
  %add31.i.1 = fadd double %div.i, %add29.i.1, !dbg !256
  %div.i.1 = fdiv double %add31.i.1, %22, !dbg !257
  %add.i.2 = fadd double %mul13.i.1, %mul.i.1, !dbg !250
  %add3.i.2 = fadd double %mul22.i.1, %add.i.2, !dbg !250
  %sub.i.2 = fsub double %add3.i.2, %div.i.1, !dbg !250
  %mul.i.2 = fmul double %21, %sub.i.2, !dbg !251
  %add8.i.2 = fadd double %mul13.i.1, %mul.i.2, !dbg !252
  %sub10.i.2 = fsub double %add8.i.2, %mul22.i.1, !dbg !252
  %add12.i.2 = fadd double %div.i.1, %sub10.i.2, !dbg !252
  %mul13.i.2 = fmul double %21, %add12.i.2, !dbg !253
  %sub17.i.2 = fsub double %mul.i.2, %mul13.i.2, !dbg !254
  %add19.i.2 = fadd double %mul22.i.1, %sub17.i.2, !dbg !254
  %add21.i.2 = fadd double %div.i.1, %add19.i.2, !dbg !254
  %mul22.i.2 = fmul double %21, %add21.i.2, !dbg !255
  %add27.i.2 = fsub double %mul13.i.2, %mul.i.2, !dbg !256
  %add29.i.2 = fadd double %add27.i.2, %mul22.i.2, !dbg !256
  %add31.i.2 = fadd double %div.i.1, %add29.i.2, !dbg !256
  %div.i.2 = fdiv double %add31.i.2, %22, !dbg !257
  %add.i.3 = fadd double %mul13.i.2, %mul.i.2, !dbg !250
  %add3.i.3 = fadd double %mul22.i.2, %add.i.3, !dbg !250
  %sub.i.3 = fsub double %add3.i.3, %div.i.2, !dbg !250
  %mul.i.3 = fmul double %21, %sub.i.3, !dbg !251
  %add8.i.3 = fadd double %mul13.i.2, %mul.i.3, !dbg !252
  %sub10.i.3 = fsub double %add8.i.3, %mul22.i.2, !dbg !252
  %add12.i.3 = fadd double %div.i.2, %sub10.i.3, !dbg !252
  %mul13.i.3 = fmul double %21, %add12.i.3, !dbg !253
  %sub17.i.3 = fsub double %mul.i.3, %mul13.i.3, !dbg !254
  %add19.i.3 = fadd double %mul22.i.2, %sub17.i.3, !dbg !254
  %add21.i.3 = fadd double %div.i.2, %add19.i.3, !dbg !254
  %mul22.i.3 = fmul double %21, %add21.i.3, !dbg !255
  %add27.i.3 = fsub double %mul13.i.3, %mul.i.3, !dbg !256
  %add29.i.3 = fadd double %add27.i.3, %mul22.i.3, !dbg !256
  %add31.i.3 = fadd double %div.i.2, %add29.i.3, !dbg !256
  %div.i.3 = fdiv double %add31.i.3, %22, !dbg !257
  %add.i.4 = fadd double %mul13.i.3, %mul.i.3, !dbg !250
  %add3.i.4 = fadd double %mul22.i.3, %add.i.4, !dbg !250
  %sub.i.4 = fsub double %add3.i.4, %div.i.3, !dbg !250
  %mul.i.4 = fmul double %21, %sub.i.4, !dbg !251
  %add8.i.4 = fadd double %mul13.i.3, %mul.i.4, !dbg !252
  %sub10.i.4 = fsub double %add8.i.4, %mul22.i.3, !dbg !252
  %add12.i.4 = fadd double %div.i.3, %sub10.i.4, !dbg !252
  %mul13.i.4 = fmul double %21, %add12.i.4, !dbg !253
  %sub17.i.4 = fsub double %mul.i.4, %mul13.i.4, !dbg !254
  %add19.i.4 = fadd double %mul22.i.3, %sub17.i.4, !dbg !254
  %add21.i.4 = fadd double %div.i.3, %add19.i.4, !dbg !254
  %mul22.i.4 = fmul double %21, %add21.i.4, !dbg !255
  %add27.i.4 = fsub double %mul13.i.4, %mul.i.4, !dbg !256
  %add29.i.4 = fadd double %add27.i.4, %mul22.i.4, !dbg !256
  %add31.i.4 = fadd double %div.i.3, %add29.i.4, !dbg !256
  %div.i.4 = fdiv double %add31.i.4, %22, !dbg !257
  %add.i.5 = fadd double %mul13.i.4, %mul.i.4, !dbg !250
  %add3.i.5 = fadd double %mul22.i.4, %add.i.5, !dbg !250
  %sub.i.5 = fsub double %add3.i.5, %div.i.4, !dbg !250
  %mul.i.5 = fmul double %21, %sub.i.5, !dbg !251
  %add8.i.5 = fadd double %mul13.i.4, %mul.i.5, !dbg !252
  %sub10.i.5 = fsub double %add8.i.5, %mul22.i.4, !dbg !252
  %add12.i.5 = fadd double %div.i.4, %sub10.i.5, !dbg !252
  %mul13.i.5 = fmul double %21, %add12.i.5, !dbg !253
  %sub17.i.5 = fsub double %mul.i.5, %mul13.i.5, !dbg !254
  %add19.i.5 = fadd double %mul22.i.4, %sub17.i.5, !dbg !254
  %add21.i.5 = fadd double %div.i.4, %add19.i.5, !dbg !254
  %mul22.i.5 = fmul double %21, %add21.i.5, !dbg !255
  %add27.i.5 = fsub double %mul13.i.5, %mul.i.5, !dbg !256
  %add29.i.5 = fadd double %add27.i.5, %mul22.i.5, !dbg !256
  %add31.i.5 = fadd double %div.i.4, %add29.i.5, !dbg !256
  %div.i.5 = fdiv double %add31.i.5, %22, !dbg !257
  %inc82 = add nuw nsw i64 %I.2413, 1, !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %inc82, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp78 = icmp slt i64 %I.2413, %mul20, !dbg !259
  br i1 %cmp78, label %for.body80, label %if.then86, !dbg !200

if.then86:                                        ; preds = %for.body80
  %div.i.5.lcssa = phi double [ %div.i.5, %for.body80 ]
  %mul22.i.5.lcssa = phi double [ %mul22.i.5, %for.body80 ]
  %mul13.i.5.lcssa = phi double [ %mul13.i.5, %for.body80 ]
  %mul.i.5.lcssa = phi double [ %mul.i.5, %for.body80 ]
  store double %mul.i.5.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !244, !tbaa !141
  store double %mul13.i.5.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !245, !tbaa !141
  store double %mul22.i.5.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !246, !tbaa !141
  store double %div.i.5.lcssa, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !247, !tbaa !141
  store i32 6, i32* @J, align 4, !dbg !260, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !222, metadata !98) #4, !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !225, metadata !98) #4, !dbg !226
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !227, metadata !98) #4, !dbg !228
  tail call void @llvm.dbg.value(metadata double %mul.i.5, i64 0, metadata !229, metadata !98) #4, !dbg !230
  tail call void @llvm.dbg.value(metadata double %mul13.i.5, i64 0, metadata !231, metadata !98) #4, !dbg !232
  tail call void @llvm.dbg.value(metadata double %mul22.i.5, i64 0, metadata !233, metadata !98) #4, !dbg !234
  tail call void @llvm.dbg.value(metadata double %div.i.5, i64 0, metadata !235, metadata !98) #4, !dbg !236
  %call.i384 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul20, i64 %mul, i64 %mul, double %mul.i.5.lcssa, double %mul13.i.5.lcssa, double %mul22.i.5.lcssa, double %div.i.5.lcssa) #4, !dbg !237
  store i32 1, i32* @J, align 4, !dbg !263, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then148.critedge, label %for.body91.preheader, !dbg !238

for.body91.preheader:                             ; preds = %if.then86
  %backedge.overflow = icmp eq i64 %smax, 0
  br i1 %backedge.overflow, label %for.body91.preheader468, label %overflow.checked

overflow.checked:                                 ; preds = %for.body91.preheader
  %end.idx = add i64 %smax, 1, !dbg !264
  %n.vec = and i64 %smax, -4, !dbg !264
  %end.idx.rnd.down467 = or i64 %n.vec, 1, !dbg !264
  %cmp.zero = icmp eq i64 %end.idx.rnd.down467, 1, !dbg !264
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %8, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 1, %vector.body.prol.preheader ], !dbg !264
  %vec.phi.prol = phi <2 x i32> [ %23, %vector.body.prol ], [ <i32 1, i32 0>, %vector.body.prol.preheader ]
  %vec.phi461.prol = phi <2 x i32> [ %24, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %23 = xor <2 x i32> %vec.phi.prol, <i32 1, i32 1>
  %24 = xor <2 x i32> %vec.phi461.prol, <i32 1, i32 1>
  %index.next.prol = add i64 %index.prol, 4, !dbg !264
  %25 = icmp eq i64 %index.next.prol, %end.idx.rnd.down467, !dbg !264
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !264
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !264
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !266

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %.lcssa469.unr.ph = phi <2 x i32> [ %24, %vector.body.prol ]
  %.lcssa.unr.ph = phi <2 x i32> [ %23, %vector.body.prol ]
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  %vec.phi.unr.ph = phi <2 x i32> [ %23, %vector.body.prol ]
  %vec.phi461.unr.ph = phi <2 x i32> [ %24, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %.lcssa469.unr = phi <2 x i32> [ zeroinitializer, %vector.body.preheader ], [ %.lcssa469.unr.ph, %vector.body.preheader.split.loopexit ]
  %.lcssa.unr = phi <2 x i32> [ zeroinitializer, %vector.body.preheader ], [ %.lcssa.unr.ph, %vector.body.preheader.split.loopexit ]
  %index.unr = phi i64 [ 1, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %vec.phi.unr = phi <2 x i32> [ <i32 1, i32 0>, %vector.body.preheader ], [ %vec.phi.unr.ph, %vector.body.preheader.split.loopexit ]
  %vec.phi461.unr = phi <2 x i32> [ zeroinitializer, %vector.body.preheader ], [ %vec.phi461.unr.ph, %vector.body.preheader.split.loopexit ]
  %26 = icmp ult i64 %8, 8
  br i1 %26, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.7, %vector.body ], !dbg !264
  %27 = xor <2 x i32> %vec.phi.unr, <i32 1, i32 1>
  %28 = xor <2 x i32> %vec.phi461.unr, <i32 1, i32 1>
  %index.next = add i64 %index, 4, !dbg !264
  %index.next.1 = add i64 %index.next, 4, !dbg !264
  %29 = xor <2 x i32> %vec.phi.unr, <i32 1, i32 1>
  %30 = xor <2 x i32> %vec.phi461.unr, <i32 1, i32 1>
  %index.next.2 = add i64 %index.next.1, 4, !dbg !264
  %index.next.3 = add i64 %index.next.2, 4, !dbg !264
  %31 = xor <2 x i32> %vec.phi.unr, <i32 1, i32 1>
  %32 = xor <2 x i32> %vec.phi461.unr, <i32 1, i32 1>
  %index.next.4 = add i64 %index.next.3, 4, !dbg !264
  %index.next.5 = add i64 %index.next.4, 4, !dbg !264
  %33 = xor <2 x i32> %vec.phi.unr, <i32 1, i32 1>
  %34 = xor <2 x i32> %vec.phi461.unr, <i32 1, i32 1>
  %index.next.6 = add i64 %index.next.5, 4, !dbg !264
  %index.next.7 = add i64 %index.next.6, 4, !dbg !264
  %35 = icmp eq i64 %index.next.7, %end.idx.rnd.down467, !dbg !264
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !264, !llvm.loop !268

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  %.lcssa469.ph = phi <2 x i32> [ %vec.phi461.unr, %vector.body ]
  %.lcssa.ph = phi <2 x i32> [ %vec.phi.unr, %vector.body ]
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  %.lcssa469 = phi <2 x i32> [ %.lcssa469.unr, %vector.body.preheader.split ], [ %.lcssa469.ph, %middle.block.loopexit.unr-lcssa ]
  %.lcssa = phi <2 x i32> [ %.lcssa.unr, %vector.body.preheader.split ], [ %.lcssa.ph, %middle.block.loopexit.unr-lcssa ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i64 [ 1, %overflow.checked ], [ %end.idx.rnd.down467, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <2 x i32> [ <i32 1, i32 0>, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.vec.exit.phi465 = phi <2 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa469, %middle.block.loopexit ]
  %bin.rdx = xor <2 x i32> %rdx.vec.exit.phi465, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <2 x i32> %bin.rdx, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx466 = xor <2 x i32> %bin.rdx, %rdx.shuf
  %36 = extractelement <2 x i32> %bin.rdx466, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %if.then112, label %for.body91.preheader468

for.body91.preheader468:                          ; preds = %middle.block, %for.body91.preheader
  %.ph = phi i32 [ 1, %for.body91.preheader ], [ %36, %middle.block ]
  %I.3423.ph = phi i64 [ 1, %for.body91.preheader ], [ %resume.val, %middle.block ]
  %37 = icmp sgt i64 %I.3423.ph, %9
  %smax474 = select i1 %37, i64 %I.3423.ph, i64 %9
  %38 = add i64 %smax474, 1
  %39 = sub i64 %38, %I.3423.ph
  %xtraiter475 = and i64 %39, 7
  %lcmp.mod476 = icmp ne i64 %xtraiter475, 0
  %lcmp.overflow477 = icmp eq i64 %39, 0
  %lcmp.or478 = or i1 %lcmp.overflow477, %lcmp.mod476
  br i1 %lcmp.or478, label %for.body91.prol.preheader, label %for.body91.preheader468.split

for.body91.prol.preheader:                        ; preds = %for.body91.preheader468
  br label %for.body91.prol

for.body91.prol:                                  ; preds = %for.body91.prol.preheader, %for.body91.prol
  %40 = phi i32 [ %41, %for.body91.prol ], [ %.ph, %for.body91.prol.preheader ]
  %I.3423.prol = phi i64 [ %inc108.prol, %for.body91.prol ], [ %I.3423.ph, %for.body91.prol.preheader ]
  %prol.iter479 = phi i64 [ %prol.iter479.sub, %for.body91.prol ], [ %xtraiter475, %for.body91.prol.preheader ]
  %41 = xor i32 %40, 1
  %inc108.prol = add nuw nsw i64 %I.3423.prol, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108.prol, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp89.prol = icmp slt i64 %I.3423.prol, %mul21, !dbg !271
  %prol.iter479.sub = sub i64 %prol.iter479, 1, !dbg !238
  %prol.iter479.cmp = icmp ne i64 %prol.iter479.sub, 0, !dbg !238
  br i1 %prol.iter479.cmp, label %for.body91.prol, label %for.body91.preheader468.split.loopexit, !llvm.loop !272

for.body91.preheader468.split.loopexit:           ; preds = %for.body91.prol
  %.unr.ph = phi i32 [ %41, %for.body91.prol ]
  %I.3423.unr.ph = phi i64 [ %inc108.prol, %for.body91.prol ]
  %.lcssa470.unr.ph = phi i32 [ %41, %for.body91.prol ]
  br label %for.body91.preheader468.split

for.body91.preheader468.split:                    ; preds = %for.body91.preheader468.split.loopexit, %for.body91.preheader468
  %.unr = phi i32 [ %.ph, %for.body91.preheader468 ], [ %.unr.ph, %for.body91.preheader468.split.loopexit ]
  %I.3423.unr = phi i64 [ %I.3423.ph, %for.body91.preheader468 ], [ %I.3423.unr.ph, %for.body91.preheader468.split.loopexit ]
  %.lcssa470.unr = phi i32 [ 0, %for.body91.preheader468 ], [ %.lcssa470.unr.ph, %for.body91.preheader468.split.loopexit ]
  %42 = icmp ult i64 %39, 8
  br i1 %42, label %if.then112.loopexit, label %for.body91.preheader468.split.split

for.body91.preheader468.split.split:              ; preds = %for.body91.preheader468.split
  br label %for.body91

for.body91:                                       ; preds = %for.body91, %for.body91.preheader468.split.split
  %I.3423 = phi i64 [ %I.3423.unr, %for.body91.preheader468.split.split ], [ %inc108.7, %for.body91 ]
  %43 = xor i32 %.unr, 1
  %inc108 = add nuw nsw i64 %I.3423, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %inc108.1 = add nuw nsw i64 %inc108, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %44 = xor i32 %.unr, 1
  %inc108.2 = add nuw nsw i64 %inc108.1, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %inc108.3 = add nuw nsw i64 %inc108.2, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %45 = xor i32 %.unr, 1
  %inc108.4 = add nuw nsw i64 %inc108.3, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %inc108.5 = add nuw nsw i64 %inc108.4, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %46 = xor i32 %.unr, 1
  %inc108.6 = add nuw nsw i64 %inc108.5, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %inc108.7 = add nuw nsw i64 %inc108.6, 1, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %inc108, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp89.7 = icmp slt i64 %inc108.6, %mul21, !dbg !271
  br i1 %cmp89.7, label %for.body91, label %if.then112.loopexit.unr-lcssa, !dbg !238, !llvm.loop !273

if.then112.loopexit.unr-lcssa:                    ; preds = %for.body91
  %.lcssa470.ph = phi i32 [ %.unr, %for.body91 ]
  br label %if.then112.loopexit

if.then112.loopexit:                              ; preds = %for.body91.preheader468.split, %if.then112.loopexit.unr-lcssa
  %.lcssa470 = phi i32 [ %.lcssa470.unr, %for.body91.preheader468.split ], [ %.lcssa470.ph, %if.then112.loopexit.unr-lcssa ]
  br label %if.then112

if.then112:                                       ; preds = %if.then112.loopexit, %middle.block, %if.then86.thread
  %storemerge = phi i32 [ 1, %if.then86.thread ], [ %36, %middle.block ], [ %.lcssa470, %if.then112.loopexit ]
  store i32 %storemerge, i32* @J, align 4, !dbg !263, !tbaa !261
  %conv113 = sext i32 %storemerge to i64, !dbg !274
  tail call void @llvm.dbg.value(metadata i64 %mul21, i64 0, metadata !276, metadata !98) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %conv113, i64 0, metadata !279, metadata !98) #4, !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %conv113, i64 0, metadata !281, metadata !98) #4, !dbg !282
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !283, metadata !98) #4, !dbg !284
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !285, metadata !98) #4, !dbg !286
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !287, metadata !98) #4, !dbg !288
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !289, metadata !98) #4, !dbg !290
  %call.i385 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul21, i64 %conv113, i64 %conv113, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !291
  store i32 1, i32* @J, align 4, !dbg !292, !tbaa !261
  store i32 2, i32* @K, align 4, !dbg !293, !tbaa !261
  store i32 3, i32* @L, align 4, !dbg !294, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then186.critedge, label %for.body119.preheader, !dbg !295

for.body119.preheader:                            ; preds = %if.then112
  %xtraiter481 = and i64 %smax480, 7
  %lcmp.mod482 = icmp ne i64 %xtraiter481, 0
  %lcmp.overflow483 = icmp eq i64 %smax480, 0
  %lcmp.or484 = or i1 %lcmp.overflow483, %lcmp.mod482
  br i1 %lcmp.or484, label %for.body119.prol.preheader, label %for.body119.preheader.split

for.body119.prol.preheader:                       ; preds = %for.body119.preheader
  br label %for.body119.prol, !dbg !297

for.body119.prol:                                 ; preds = %for.body119.prol.preheader, %for.body119.prol
  %I.4426.prol = phi i64 [ %inc144.prol, %for.body119.prol ], [ 1, %for.body119.prol.preheader ]
  %prol.iter485 = phi i64 [ %prol.iter485.sub, %for.body119.prol ], [ %xtraiter481, %for.body119.prol.preheader ]
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.prol = add nuw nsw i64 %I.4426.prol, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144.prol, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp117.prol = icmp slt i64 %I.4426.prol, %mul22, !dbg !301
  %prol.iter485.sub = sub i64 %prol.iter485, 1, !dbg !295
  %prol.iter485.cmp = icmp ne i64 %prol.iter485.sub, 0, !dbg !295
  br i1 %prol.iter485.cmp, label %for.body119.prol, label %for.body119.preheader.split.loopexit, !llvm.loop !302

for.body119.preheader.split.loopexit:             ; preds = %for.body119.prol
  %I.4426.unr.ph = phi i64 [ %inc144.prol, %for.body119.prol ]
  br label %for.body119.preheader.split

for.body119.preheader.split:                      ; preds = %for.body119.preheader.split.loopexit, %for.body119.preheader
  %I.4426.unr = phi i64 [ 1, %for.body119.preheader ], [ %I.4426.unr.ph, %for.body119.preheader.split.loopexit ]
  %47 = icmp ult i64 %smax480, 8
  br i1 %47, label %for.cond116.if.then148_crit_edge, label %for.body119.preheader.split.split

for.body119.preheader.split.split:                ; preds = %for.body119.preheader.split
  br label %for.body119, !dbg !297

for.body119:                                      ; preds = %for.body119, %for.body119.preheader.split.split
  %I.4426 = phi i64 [ %I.4426.unr, %for.body119.preheader.split.split ], [ %inc144.7, %for.body119 ]
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144 = add nuw nsw i64 %I.4426, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.1 = add nuw nsw i64 %inc144, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.2 = add nuw nsw i64 %inc144.1, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.3 = add nuw nsw i64 %inc144.2, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.4 = add nuw nsw i64 %inc144.3, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.5 = add nuw nsw i64 %inc144.4, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.6 = add nuw nsw i64 %inc144.5, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  store <2 x double> <double 6.000000e+00, double 6.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1) to <2 x double>*), align 8, !dbg !297, !tbaa !141
  %inc144.7 = add nuw nsw i64 %inc144.6, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata i64 %inc144, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp117.7 = icmp slt i64 %inc144.6, %mul22, !dbg !301
  br i1 %cmp117.7, label %for.body119, label %for.cond116.if.then148_crit_edge.unr-lcssa, !dbg !295

for.cond116.if.then148_crit_edge.unr-lcssa:       ; preds = %for.body119
  br label %for.cond116.if.then148_crit_edge

for.cond116.if.then148_crit_edge:                 ; preds = %for.body119.preheader.split, %for.cond116.if.then148_crit_edge.unr-lcssa
  store i32 2, i32* @K, align 4, !dbg !303, !tbaa !261
  store i32 3, i32* @L, align 4, !dbg !304, !tbaa !261
  store i32 1, i32* @J, align 4, !dbg !305, !tbaa !261
  br label %if.then148, !dbg !295

if.then148.critedge:                              ; preds = %if.then86
  tail call void @llvm.dbg.value(metadata i64 %mul21, i64 0, metadata !276, metadata !98) #4, !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %conv113, i64 0, metadata !279, metadata !98) #4, !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %conv113, i64 0, metadata !281, metadata !98) #4, !dbg !282
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !283, metadata !98) #4, !dbg !284
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !285, metadata !98) #4, !dbg !286
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !287, metadata !98) #4, !dbg !288
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !289, metadata !98) #4, !dbg !290
  %call.i385.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul21, i64 1, i64 1, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !291
  store i32 1, i32* @J, align 4, !dbg !292, !tbaa !261
  store i32 2, i32* @K, align 4, !dbg !293, !tbaa !261
  store i32 3, i32* @L, align 4, !dbg !294, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then148

if.then148:                                       ; preds = %if.then148.critedge, %for.cond116.if.then148_crit_edge
  %48 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !307, !tbaa !141
  %49 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !308, !tbaa !141
  %50 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !309, !tbaa !141
  %51 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !310, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul22, i64 0, metadata !311, metadata !98) #4, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !314, metadata !98) #4, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !316, metadata !98) #4, !dbg !317
  tail call void @llvm.dbg.value(metadata double %48, i64 0, metadata !318, metadata !98) #4, !dbg !319
  tail call void @llvm.dbg.value(metadata double %49, i64 0, metadata !320, metadata !98) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata double %50, i64 0, metadata !322, metadata !98) #4, !dbg !323
  tail call void @llvm.dbg.value(metadata double %51, i64 0, metadata !324, metadata !98) #4, !dbg !325
  %call.i386 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul22, i64 1, i64 2, double %48, double %49, double %50, double %51) #4, !dbg !326
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !35, metadata !98), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then199.critedge, label %for.body155.preheader, !dbg !329

for.body155.preheader:                            ; preds = %if.then148
  br label %for.body155, !dbg !331

for.body155:                                      ; preds = %for.body155.preheader, %for.body155
  %I.5431 = phi i64 [ %inc182, %for.body155 ], [ 1, %for.body155.preheader ]
  %Y.0430 = phi double [ %mul180, %for.body155 ], [ 5.000000e-01, %for.body155.preheader ]
  %X.0429 = phi double [ %mul167, %for.body155 ], [ 5.000000e-01, %for.body155.preheader ]
  %52 = load double* @T, align 8, !dbg !331, !tbaa !141
  %53 = load double* @T2, align 8, !dbg !334, !tbaa !141
  %call156 = tail call double @sin(double %X.0429) #4, !dbg !335
  %mul157 = fmul double %53, %call156, !dbg !334
  %call158 = tail call double @cos(double %X.0429) #4, !dbg !336
  %mul159 = fmul double %mul157, %call158, !dbg !334
  %add160 = fadd double %X.0429, %Y.0430, !dbg !337
  %call161 = tail call double @cos(double %add160) #4, !dbg !338
  %sub162 = fsub double %X.0429, %Y.0430, !dbg !339
  %call163 = tail call double @cos(double %sub162) #4, !dbg !340
  %add164 = fadd double %call161, %call163, !dbg !338
  %sub165 = fadd double %add164, -1.000000e+00, !dbg !338
  %div = fdiv double %mul159, %sub165, !dbg !334
  %call166 = tail call double @atan(double %div) #4, !dbg !341
  %mul167 = fmul double %52, %call166, !dbg !331
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !34, metadata !98), !dbg !327
  %54 = load double* @T, align 8, !dbg !342, !tbaa !141
  %55 = load double* @T2, align 8, !dbg !343, !tbaa !141
  %call168 = tail call double @sin(double %Y.0430) #4, !dbg !344
  %mul169 = fmul double %55, %call168, !dbg !343
  %call170 = tail call double @cos(double %Y.0430) #4, !dbg !345
  %mul171 = fmul double %mul169, %call170, !dbg !343
  %add172 = fadd double %Y.0430, %mul167, !dbg !346
  %call173 = tail call double @cos(double %add172) #4, !dbg !347
  %sub174 = fsub double %mul167, %Y.0430, !dbg !348
  %call175 = tail call double @cos(double %sub174) #4, !dbg !349
  %add176 = fadd double %call173, %call175, !dbg !347
  %sub177 = fadd double %add176, -1.000000e+00, !dbg !347
  %div178 = fdiv double %mul171, %sub177, !dbg !343
  %call179 = tail call double @atan(double %div178) #4, !dbg !350
  %mul180 = fmul double %54, %call179, !dbg !342
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !35, metadata !98), !dbg !328
  %inc182 = add nuw nsw i64 %I.5431, 1, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 %inc182, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp153 = icmp slt i64 %I.5431, %mul23, !dbg !352
  br i1 %cmp153, label %for.body155, label %if.then186.loopexit, !dbg !329

if.then186.critedge:                              ; preds = %if.then112
  %56 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !307, !tbaa !141
  %57 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !308, !tbaa !141
  %58 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !309, !tbaa !141
  %59 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !310, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul22, i64 0, metadata !311, metadata !98) #4, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !314, metadata !98) #4, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !316, metadata !98) #4, !dbg !317
  tail call void @llvm.dbg.value(metadata double %48, i64 0, metadata !318, metadata !98) #4, !dbg !319
  tail call void @llvm.dbg.value(metadata double %49, i64 0, metadata !320, metadata !98) #4, !dbg !321
  tail call void @llvm.dbg.value(metadata double %50, i64 0, metadata !322, metadata !98) #4, !dbg !323
  tail call void @llvm.dbg.value(metadata double %51, i64 0, metadata !324, metadata !98) #4, !dbg !325
  %call.i386.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul22, i64 1, i64 2, double %56, double %57, double %58, double %59) #4, !dbg !326
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !35, metadata !98), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then186

if.then186.loopexit:                              ; preds = %for.body155
  %mul180.lcssa = phi double [ %mul180, %for.body155 ]
  %mul167.lcssa = phi double [ %mul167, %for.body155 ]
  br label %if.then186

if.then186:                                       ; preds = %if.then186.loopexit, %if.then186.critedge
  %Y.0.lcssa = phi double [ 5.000000e-01, %if.then186.critedge ], [ %mul180.lcssa, %if.then186.loopexit ]
  %X.0.lcssa = phi double [ 5.000000e-01, %if.then186.critedge ], [ %mul167.lcssa, %if.then186.loopexit ]
  %60 = load i32* @J, align 4, !dbg !353, !tbaa !261
  %conv187 = sext i32 %60 to i64, !dbg !353
  %61 = load i32* @K, align 4, !dbg !355, !tbaa !261
  %conv188 = sext i32 %61 to i64, !dbg !355
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !356, metadata !98) #4, !dbg !358
  tail call void @llvm.dbg.value(metadata i64 %conv187, i64 0, metadata !359, metadata !98) #4, !dbg !360
  tail call void @llvm.dbg.value(metadata i64 %conv188, i64 0, metadata !361, metadata !98) #4, !dbg !362
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !363, metadata !98) #4, !dbg !364
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !365, metadata !98) #4, !dbg !366
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !367, metadata !98) #4, !dbg !368
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !369, metadata !98) #4, !dbg !370
  %call.i387 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul23, i64 %conv187, i64 %conv188, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !35, metadata !98), !dbg !328
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !373, metadata !98), !dbg !377
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then199, label %for.body193.lr.ph, !dbg !378

for.body193.lr.ph:                                ; preds = %if.then186
  %62 = load double* @T, align 8, !dbg !379, !tbaa !141
  %mul.i388.le = fmul double %62, 2.000000e+00, !dbg !379
  %add1.i.le = fadd double %mul.i388.le, 1.000000e+00, !dbg !380
  %mul2.i.le = fmul double %62, %add1.i.le, !dbg !381
  %add3.i389.le = fadd double %mul.i388.le, %mul2.i.le, !dbg !382
  %63 = load double* @T2, align 8, !dbg !383, !tbaa !141
  %div.i390.le = fdiv double %add3.i389.le, %63, !dbg !384
  br label %if.then199, !dbg !378

if.then199.critedge:                              ; preds = %if.then148
  %64 = load i32* @J, align 4, !dbg !353, !tbaa !261
  %conv187.c = sext i32 %64 to i64, !dbg !353
  %65 = load i32* @K, align 4, !dbg !355, !tbaa !261
  %conv188.c = sext i32 %65 to i64, !dbg !355
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !356, metadata !98) #4, !dbg !358
  tail call void @llvm.dbg.value(metadata i64 %conv187, i64 0, metadata !359, metadata !98) #4, !dbg !360
  tail call void @llvm.dbg.value(metadata i64 %conv188, i64 0, metadata !361, metadata !98) #4, !dbg !362
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !363, metadata !98) #4, !dbg !364
  tail call void @llvm.dbg.value(metadata double %mul167, i64 0, metadata !365, metadata !98) #4, !dbg !366
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !367, metadata !98) #4, !dbg !368
  tail call void @llvm.dbg.value(metadata double %mul180, i64 0, metadata !369, metadata !98) #4, !dbg !370
  %call.i387.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul23, i64 %conv187.c, i64 %conv188.c, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01) #4, !dbg !371
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !35, metadata !98), !dbg !328
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !373, metadata !98), !dbg !377
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !36, metadata !98), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then199

if.then199:                                       ; preds = %if.then199.critedge, %for.body193.lr.ph, %if.then186
  %.lcssa397 = phi double [ %div.i390.le, %for.body193.lr.ph ], [ 1.000000e+00, %if.then186 ], [ 1.000000e+00, %if.then199.critedge ]
  %66 = load i32* @J, align 4, !dbg !385, !tbaa !261
  %conv200 = sext i32 %66 to i64, !dbg !385
  %67 = load i32* @K, align 4, !dbg !387, !tbaa !261
  %conv201 = sext i32 %67 to i64, !dbg !387
  tail call void @llvm.dbg.value(metadata i64 %mul24, i64 0, metadata !388, metadata !98) #4, !dbg !390
  tail call void @llvm.dbg.value(metadata i64 %conv200, i64 0, metadata !391, metadata !98) #4, !dbg !392
  tail call void @llvm.dbg.value(metadata i64 %conv201, i64 0, metadata !393, metadata !98) #4, !dbg !394
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !395, metadata !98) #4, !dbg !396
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !397, metadata !98) #4, !dbg !398
  %call.i392 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul24, i64 %conv200, i64 %conv201, double 1.000000e+00, double 1.000000e+00, double %.lcssa397, double %.lcssa397) #4, !dbg !399
  store i32 1, i32* @J, align 4, !dbg !400, !tbaa !261
  store i32 2, i32* @K, align 4, !dbg !401, !tbaa !261
  store i32 3, i32* @L, align 4, !dbg !402, !tbaa !261
  store double 1.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !403, !tbaa !141
  store double 2.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !404, !tbaa !141
  store double 3.000000e+00, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !405, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then247.critedge, label %for.body206.preheader, !dbg !406

for.body206.preheader:                            ; preds = %if.then199
  %xtraiter487 = and i64 %smax486, 3
  %lcmp.mod488 = icmp ne i64 %xtraiter487, 0
  %lcmp.overflow489 = icmp eq i64 %smax486, 0
  %lcmp.or490 = or i1 %lcmp.overflow489, %lcmp.mod488
  br i1 %lcmp.or490, label %for.body206.prol.preheader, label %for.body206.preheader.split

for.body206.prol.preheader:                       ; preds = %for.body206.preheader
  br label %for.body206.prol, !dbg !408

for.body206.prol:                                 ; preds = %for.body206.prol.preheader, %for.body206.prol
  %68 = phi double [ %69, %for.body206.prol ], [ 3.000000e+00, %for.body206.prol.preheader ], !dbg !408
  %69 = phi double [ %68, %for.body206.prol ], [ 2.000000e+00, %for.body206.prol.preheader ], !dbg !411
  %I.7442.prol = phi i64 [ %inc208.prol, %for.body206.prol ], [ 1, %for.body206.prol.preheader ]
  %prol.iter491 = phi i64 [ %prol.iter491.sub, %for.body206.prol ], [ %xtraiter487, %for.body206.prol.preheader ]
  store double %69, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !408, !tbaa !141
  store double %68, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !412, !tbaa !141
  store double %69, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !413, !tbaa !141
  %inc208.prol = add nuw nsw i64 %I.7442.prol, 1, !dbg !414
  tail call void @llvm.dbg.value(metadata i64 %inc208.prol, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp204.prol = icmp slt i64 %I.7442.prol, %mul25, !dbg !415
  %prol.iter491.sub = sub i64 %prol.iter491, 1, !dbg !406
  %prol.iter491.cmp = icmp ne i64 %prol.iter491.sub, 0, !dbg !406
  br i1 %prol.iter491.cmp, label %for.body206.prol, label %for.body206.preheader.split.loopexit, !llvm.loop !416

for.body206.preheader.split.loopexit:             ; preds = %for.body206.prol
  %.unr492.ph = phi double [ %69, %for.body206.prol ]
  %.unr493.ph = phi double [ %68, %for.body206.prol ]
  %I.7442.unr.ph = phi i64 [ %inc208.prol, %for.body206.prol ]
  %.lcssa472.unr.ph = phi double [ %69, %for.body206.prol ]
  %.lcssa471.unr.ph = phi double [ %68, %for.body206.prol ]
  br label %for.body206.preheader.split

for.body206.preheader.split:                      ; preds = %for.body206.preheader.split.loopexit, %for.body206.preheader
  %.unr492 = phi double [ 3.000000e+00, %for.body206.preheader ], [ %.unr492.ph, %for.body206.preheader.split.loopexit ]
  %.unr493 = phi double [ 2.000000e+00, %for.body206.preheader ], [ %.unr493.ph, %for.body206.preheader.split.loopexit ]
  %I.7442.unr = phi i64 [ 1, %for.body206.preheader ], [ %I.7442.unr.ph, %for.body206.preheader.split.loopexit ]
  %.lcssa472.unr = phi double [ 0.000000e+00, %for.body206.preheader ], [ %.lcssa472.unr.ph, %for.body206.preheader.split.loopexit ]
  %.lcssa471.unr = phi double [ 0.000000e+00, %for.body206.preheader ], [ %.lcssa471.unr.ph, %for.body206.preheader.split.loopexit ]
  %70 = icmp ult i64 %smax486, 4
  br i1 %70, label %if.then212, label %for.body206.preheader.split.split

for.body206.preheader.split.split:                ; preds = %for.body206.preheader.split
  br label %for.body206, !dbg !408

for.body206:                                      ; preds = %for.body206, %for.body206.preheader.split.split
  %I.7442 = phi i64 [ %I.7442.unr, %for.body206.preheader.split.split ], [ %inc208.3, %for.body206 ]
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !408, !tbaa !141
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !412, !tbaa !141
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !413, !tbaa !141
  %inc208 = add nuw nsw i64 %I.7442, 1, !dbg !414
  tail call void @llvm.dbg.value(metadata i64 %inc208, i64 0, metadata !17, metadata !98), !dbg !161
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !408, !tbaa !141
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !412, !tbaa !141
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !413, !tbaa !141
  %inc208.1 = add nuw nsw i64 %inc208, 1, !dbg !414
  tail call void @llvm.dbg.value(metadata i64 %inc208, i64 0, metadata !17, metadata !98), !dbg !161
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !408, !tbaa !141
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !412, !tbaa !141
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !413, !tbaa !141
  %inc208.2 = add nuw nsw i64 %inc208.1, 1, !dbg !414
  tail call void @llvm.dbg.value(metadata i64 %inc208, i64 0, metadata !17, metadata !98), !dbg !161
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 1), align 8, !dbg !408, !tbaa !141
  store double %.unr493, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 2), align 16, !dbg !412, !tbaa !141
  store double %.unr492, double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 3), align 8, !dbg !413, !tbaa !141
  %inc208.3 = add nuw nsw i64 %inc208.2, 1, !dbg !414
  tail call void @llvm.dbg.value(metadata i64 %inc208, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp204.3 = icmp slt i64 %inc208.2, %mul25, !dbg !415
  br i1 %cmp204.3, label %for.body206, label %if.then212.unr-lcssa, !dbg !406

if.then212.unr-lcssa:                             ; preds = %for.body206
  %.lcssa472.ph = phi double [ %.unr492, %for.body206 ]
  %.lcssa471.ph = phi double [ %.unr493, %for.body206 ]
  br label %if.then212

if.then212:                                       ; preds = %for.body206.preheader.split, %if.then212.unr-lcssa
  %.lcssa472 = phi double [ %.lcssa472.unr, %for.body206.preheader.split ], [ %.lcssa472.ph, %if.then212.unr-lcssa ]
  %.lcssa471 = phi double [ %.lcssa471.unr, %for.body206.preheader.split ], [ %.lcssa471.ph, %if.then212.unr-lcssa ]
  %71 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !417, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul25, i64 0, metadata !419, metadata !98) #4, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !422, metadata !98) #4, !dbg !423
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !424, metadata !98) #4, !dbg !425
  tail call void @llvm.dbg.value(metadata double %.unr493, i64 0, metadata !426, metadata !98) #4, !dbg !427
  tail call void @llvm.dbg.value(metadata double %.unr492, i64 0, metadata !428, metadata !98) #4, !dbg !429
  tail call void @llvm.dbg.value(metadata double %.unr493, i64 0, metadata !430, metadata !98) #4, !dbg !431
  tail call void @llvm.dbg.value(metadata double %71, i64 0, metadata !432, metadata !98) #4, !dbg !433
  %call.i393 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul25, i64 1, i64 2, double %.lcssa472, double %.lcssa471, double %.lcssa472, double %71) #4, !dbg !434
  store i32 2, i32* @J, align 4, !dbg !435, !tbaa !261
  store i32 3, i32* @K, align 4, !dbg !436, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !437, metadata !98) #4, !dbg !440
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !441, metadata !98) #4, !dbg !442
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !443, metadata !98) #4, !dbg !444
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !445, metadata !98) #4, !dbg !446
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !447, metadata !98) #4, !dbg !448
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !449, metadata !98) #4, !dbg !450
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !451, metadata !98) #4, !dbg !452
  %call.i391 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !453
  tail call void @llvm.dbg.value(metadata double 7.500000e-01, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br i1 %cmp50400, label %if.then247, label %for.body237.preheader, !dbg !454

for.body237.preheader:                            ; preds = %if.then212
  br label %for.body237, !dbg !456

for.body237:                                      ; preds = %for.body237.preheader, %for.body237
  %I.9445 = phi i64 [ %inc243, %for.body237 ], [ 1, %for.body237.preheader ]
  %X.1444 = phi double [ %call241, %for.body237 ], [ 7.500000e-01, %for.body237.preheader ]
  %call238 = tail call double @log(double %X.1444) #4, !dbg !456
  %72 = load double* @T1, align 8, !dbg !458, !tbaa !141
  %div239 = fdiv double %call238, %72, !dbg !456
  %call240 = tail call double @exp(double %div239) #4, !dbg !459
  %call241 = tail call double @sqrt(double %call240) #4, !dbg !460
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !34, metadata !98), !dbg !327
  %inc243 = add nuw nsw i64 %I.9445, 1, !dbg !461
  tail call void @llvm.dbg.value(metadata i64 %inc243, i64 0, metadata !17, metadata !98), !dbg !161
  %cmp235 = icmp slt i64 %I.9445, %mul26, !dbg !462
  br i1 %cmp235, label %for.body237, label %if.then247.loopexit, !dbg !454

if.then247.critedge:                              ; preds = %if.then199
  %73 = load double* getelementptr inbounds ([5 x double]* @E1, i64 0, i64 4), align 16, !dbg !417, !tbaa !141
  tail call void @llvm.dbg.value(metadata i64 %mul25, i64 0, metadata !419, metadata !98) #4, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !422, metadata !98) #4, !dbg !423
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !424, metadata !98) #4, !dbg !425
  tail call void @llvm.dbg.value(metadata double %.unr493, i64 0, metadata !426, metadata !98) #4, !dbg !427
  tail call void @llvm.dbg.value(metadata double %.unr492, i64 0, metadata !428, metadata !98) #4, !dbg !429
  tail call void @llvm.dbg.value(metadata double %.unr493, i64 0, metadata !430, metadata !98) #4, !dbg !431
  tail call void @llvm.dbg.value(metadata double %71, i64 0, metadata !432, metadata !98) #4, !dbg !433
  %call.i393.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul25, i64 1, i64 2, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double %73) #4, !dbg !434
  store i32 2, i32* @J, align 4, !dbg !435, !tbaa !261
  store i32 3, i32* @K, align 4, !dbg !436, !tbaa !261
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !437, metadata !98) #4, !dbg !440
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !441, metadata !98) #4, !dbg !442
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !443, metadata !98) #4, !dbg !444
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !445, metadata !98) #4, !dbg !446
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !447, metadata !98) #4, !dbg !448
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !449, metadata !98) #4, !dbg !450
  tail call void @llvm.dbg.value(metadata double -1.000000e+00, i64 0, metadata !451, metadata !98) #4, !dbg !452
  %call.i391.c = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 0, i64 2, i64 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) #4, !dbg !453
  tail call void @llvm.dbg.value(metadata double 7.500000e-01, i64 0, metadata !34, metadata !98), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !17, metadata !98), !dbg !161
  br label %if.then247

if.then247.loopexit:                              ; preds = %for.body237
  %call241.lcssa = phi double [ %call241, %for.body237 ]
  br label %if.then247

if.then247:                                       ; preds = %if.then247.loopexit, %if.then247.critedge, %if.then212
  %X.1.lcssa = phi double [ 7.500000e-01, %if.then212 ], [ 7.500000e-01, %if.then247.critedge ], [ %call241.lcssa, %if.then247.loopexit ]
  %74 = load i32* @J, align 4, !dbg !463, !tbaa !261
  %conv248 = sext i32 %74 to i64, !dbg !463
  %75 = load i32* @K, align 4, !dbg !465, !tbaa !261
  %conv249 = sext i32 %75 to i64, !dbg !465
  tail call void @llvm.dbg.value(metadata i64 %mul26, i64 0, metadata !466, metadata !98) #4, !dbg !468
  tail call void @llvm.dbg.value(metadata i64 %conv248, i64 0, metadata !469, metadata !98) #4, !dbg !470
  tail call void @llvm.dbg.value(metadata i64 %conv249, i64 0, metadata !471, metadata !98) #4, !dbg !472
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !473, metadata !98) #4, !dbg !474
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !475, metadata !98) #4, !dbg !476
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !477, metadata !98) #4, !dbg !478
  tail call void @llvm.dbg.value(metadata double %call241, i64 0, metadata !479, metadata !98) #4, !dbg !480
  %call.i383 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %mul26, i64 %conv248, i64 %conv249, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa) #4, !dbg !481
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !39, metadata !98), !dbg !146
  %call256 = tail call i64 @time(i64* null) #4, !dbg !482
  tail call void @llvm.dbg.value(metadata i64 %call256, i64 0, metadata !42, metadata !98), !dbg !483
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !484
  br i1 %tobool, label %return.loopexit, label %LCONT, !dbg !117

return.loopexit:                                  ; preds = %if.then247
  br label %return

return:                                           ; preds = %return.loopexit, %if.else16
  %retval.0 = phi i32 [ 1, %if.else16 ], [ 0, %return.loopexit ]
  ret i32 %retval.0, !dbg !485
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind uwtable
define void @POUT(i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %N, i64 0, metadata !68, metadata !98), !dbg !486
  tail call void @llvm.dbg.value(metadata i64 %J, i64 0, metadata !69, metadata !98), !dbg !487
  tail call void @llvm.dbg.value(metadata i64 %K, i64 0, metadata !70, metadata !98), !dbg !488
  tail call void @llvm.dbg.value(metadata double %X1, i64 0, metadata !71, metadata !98), !dbg !489
  tail call void @llvm.dbg.value(metadata double %X2, i64 0, metadata !72, metadata !98), !dbg !490
  tail call void @llvm.dbg.value(metadata double %X3, i64 0, metadata !73, metadata !98), !dbg !491
  tail call void @llvm.dbg.value(metadata double %X4, i64 0, metadata !74, metadata !98), !dbg !492
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str3, i64 0, i64 0), i64 %N, i64 %J, i64 %K, double %X1, double %X2, double %X3, double %X4) #4, !dbg !493
  ret void, !dbg !494
}

; Function Attrs: nounwind uwtable
define void @PA(double* nocapture %E) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %E, i64 0, metadata !51, metadata !98), !dbg !495
  store i32 0, i32* @J, align 4, !dbg !496, !tbaa !261
  %arrayidx = getelementptr inbounds double* %E, i64 1, !dbg !497
  %arrayidx1 = getelementptr inbounds double* %E, i64 2, !dbg !498
  %arrayidx2 = getelementptr inbounds double* %E, i64 3, !dbg !499
  %arrayidx4 = getelementptr inbounds double* %E, i64 4, !dbg !500
  %.pre = load double* %arrayidx, align 8, !dbg !497, !tbaa !141
  %.pre54 = load double* %arrayidx1, align 8, !dbg !498, !tbaa !141
  %.pre55 = load double* %arrayidx2, align 8, !dbg !499, !tbaa !141
  %.pre56 = load double* %arrayidx4, align 8, !dbg !500, !tbaa !141
  br label %L10, !dbg !496

L10:                                              ; preds = %L10, %entry
  %0 = phi double [ %div, %L10 ], [ %.pre56, %entry ], !dbg !497
  %1 = phi double [ %mul22, %L10 ], [ %.pre55, %entry ], !dbg !497
  %2 = phi double [ %mul13, %L10 ], [ %.pre54, %entry ], !dbg !498
  %3 = phi double [ %mul, %L10 ], [ %.pre, %entry ], !dbg !497
  %add3353 = phi i32 [ %add33, %L10 ], [ 0, %entry ], !dbg !497
  %add = fadd double %3, %2, !dbg !497
  %add3 = fadd double %add, %1, !dbg !497
  %sub = fsub double %add3, %0, !dbg !497
  %4 = load double* @T, align 8, !dbg !501, !tbaa !141
  %mul = fmul double %sub, %4, !dbg !502
  store double %mul, double* %arrayidx, align 8, !dbg !503, !tbaa !141
  %add8 = fadd double %mul, %2, !dbg !504
  %sub10 = fsub double %add8, %1, !dbg !504
  %add12 = fadd double %sub10, %0, !dbg !504
  %5 = load double* @T, align 8, !dbg !505, !tbaa !141
  %mul13 = fmul double %add12, %5, !dbg !506
  store double %mul13, double* %arrayidx1, align 8, !dbg !507, !tbaa !141
  %sub17 = fsub double %mul, %mul13, !dbg !508
  %add19 = fadd double %sub17, %1, !dbg !508
  %add21 = fadd double %add19, %0, !dbg !508
  %6 = load double* @T, align 8, !dbg !509, !tbaa !141
  %mul22 = fmul double %add21, %6, !dbg !510
  store double %mul22, double* %arrayidx2, align 8, !dbg !511, !tbaa !141
  %add27 = fsub double %mul13, %mul, !dbg !512
  %add29 = fadd double %mul22, %add27, !dbg !512
  %add31 = fadd double %0, %add29, !dbg !512
  %7 = load double* @T2, align 8, !dbg !513, !tbaa !141
  %div = fdiv double %add31, %7, !dbg !514
  store double %div, double* %arrayidx4, align 8, !dbg !515, !tbaa !141
  %add33 = add nuw nsw i32 %add3353, 1, !dbg !516
  %exitcond = icmp eq i32 %add33, 6, !dbg !517
  br i1 %exitcond, label %if.end, label %L10, !dbg !517

if.end:                                           ; preds = %L10
  store i32 6, i32* @J, align 4, !dbg !516, !tbaa !261
  ret void, !dbg !518
}

; Function Attrs: nounwind
declare double @atan(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind uwtable
define void @P3(double %X, double %Y, double* nocapture %Z) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %X, i64 0, metadata !59, metadata !98), !dbg !519
  tail call void @llvm.dbg.value(metadata double %Y, i64 0, metadata !60, metadata !98), !dbg !520
  tail call void @llvm.dbg.value(metadata double* %Z, i64 0, metadata !61, metadata !98), !dbg !521
  tail call void @llvm.dbg.value(metadata double %X, i64 0, metadata !62, metadata !98), !dbg !522
  tail call void @llvm.dbg.value(metadata double %Y, i64 0, metadata !63, metadata !98), !dbg !523
  %0 = load double* @T, align 8, !dbg !524, !tbaa !141
  %add = fadd double %X, %Y, !dbg !525
  %mul = fmul double %add, %0, !dbg !524
  tail call void @llvm.dbg.value(metadata double %mul, i64 0, metadata !62, metadata !98), !dbg !522
  %add1 = fadd double %mul, %Y, !dbg !526
  %mul2 = fmul double %0, %add1, !dbg !527
  tail call void @llvm.dbg.value(metadata double %mul2, i64 0, metadata !63, metadata !98), !dbg !523
  %add3 = fadd double %mul, %mul2, !dbg !528
  %1 = load double* @T2, align 8, !dbg !529, !tbaa !141
  %div = fdiv double %add3, %1, !dbg !530
  store double %div, double* %Z, align 8, !dbg !531, !tbaa !141
  ret void, !dbg !532
}

; Function Attrs: nounwind uwtable
define void @P0() #0 {
entry:
  %0 = load i32* @K, align 4, !dbg !533, !tbaa !261
  %idxprom = sext i32 %0 to i64, !dbg !534
  %arrayidx = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom, !dbg !534
  %1 = load double* %arrayidx, align 8, !dbg !534, !tbaa !141
  %2 = load i32* @J, align 4, !dbg !535, !tbaa !261
  %idxprom1 = sext i32 %2 to i64, !dbg !536
  %arrayidx2 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom1, !dbg !536
  store double %1, double* %arrayidx2, align 8, !dbg !536, !tbaa !141
  %3 = load i32* @L, align 4, !dbg !537, !tbaa !261
  %idxprom3 = sext i32 %3 to i64, !dbg !538
  %arrayidx4 = getelementptr inbounds [5 x double]* @E1, i64 0, i64 %idxprom3, !dbg !538
  %4 = load double* %arrayidx4, align 8, !dbg !538, !tbaa !141
  store double %4, double* %arrayidx, align 8, !dbg !539, !tbaa !141
  %5 = load double* %arrayidx2, align 8, !dbg !540, !tbaa !141
  store double %5, double* %arrayidx4, align 8, !dbg !541, !tbaa !141
  ret void, !dbg !542
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @exp(double) #2

; Function Attrs: nounwind
declare double @log(double) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { cold }

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
!75 = !{!"0x2e\00atol\00atol\00\00283\000\001\000\000\00256\001\00284", !76, !77, !78, null, null, null, null, !82} ; [ DW_TAG_subprogram ] [line 283] [def] [scope 284] [atol]
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
!117 = !MDLocation(line: 390, column: 6, scope: !9)
!118 = !MDLocation(line: 128, column: 13, scope: !9)
!119 = !MDLocation(line: 111, column: 7, scope: !120)
!120 = !{!"0xb\00111\007\001", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!121 = !{!"0xb\00110\0020\000", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!122 = !{!123, !123, i64 0}
!123 = !{!"any pointer", !124, i64 0}
!124 = !{!"omnipotent char", !125, i64 0}
!125 = !{!"Simple C/C++ TBAA"}
!126 = !MDLocation(line: 111, column: 7, scope: !121)
!127 = !MDLocation(line: 111, column: 42, scope: !120)
!128 = !{!124, !124, i64 0}
!129 = !{!"0x101\00__nptr\0016777499\000", !75, !77, !80, !130} ; [ DW_TAG_arg_variable ] [__nptr] [line 283]
!130 = !MDLocation(line: 113, column: 14, scope: !131)
!131 = !{!"0xb\00113\0014\003", !1, !120}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!132 = !MDLocation(line: 283, column: 1, scope: !75, inlinedAt: !130)
!133 = !MDLocation(line: 285, column: 10, scope: !75, inlinedAt: !130)
!134 = !MDLocation(line: 113, column: 14, scope: !120)
!135 = !MDLocation(line: 116, column: 12, scope: !136)
!136 = !{!"0xb\00115\0010\005", !1, !131}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!137 = !MDLocation(line: 116, column: 4, scope: !136)
!138 = !MDLocation(line: 117, column: 4, scope: !136)
!139 = !MDLocation(line: 98, column: 7, scope: !9)
!140 = !MDLocation(line: 135, column: 2, scope: !9)
!141 = !{!142, !142, i64 0}
!142 = !{!"double", !124, i64 0}
!143 = !MDLocation(line: 136, column: 2, scope: !9)
!144 = !MDLocation(line: 137, column: 2, scope: !9)
!145 = !MDLocation(line: 93, column: 7, scope: !9)
!146 = !MDLocation(line: 94, column: 10, scope: !9)
!147 = !MDLocation(line: 91, column: 7, scope: !9)
!148 = !MDLocation(line: 91, column: 11, scope: !9)
!149 = !MDLocation(line: 91, column: 15, scope: !9)
!150 = !MDLocation(line: 91, column: 19, scope: !9)
!151 = !MDLocation(line: 91, column: 23, scope: !9)
!152 = !MDLocation(line: 91, column: 27, scope: !9)
!153 = !MDLocation(line: 91, column: 31, scope: !9)
!154 = !MDLocation(line: 91, column: 35, scope: !9)
!155 = !MDLocation(line: 91, column: 39, scope: !9)
!156 = !MDLocation(line: 91, column: 44, scope: !9)
!157 = !MDLocation(line: 92, column: 9, scope: !9)
!158 = !MDLocation(line: 92, column: 12, scope: !9)
!159 = !MDLocation(line: 92, column: 15, scope: !9)
!160 = !MDLocation(line: 92, column: 18, scope: !9)
!161 = !MDLocation(line: 90, column: 7, scope: !9)
!162 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !163} ; [ DW_TAG_arg_variable ] [N] [line 434]
!163 = !MDLocation(line: 179, column: 13, scope: !164)
!164 = !{!"0xb\00179\006\009", !1, !9}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!165 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !163)
!166 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !163} ; [ DW_TAG_arg_variable ] [J] [line 434]
!167 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !163)
!168 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !163} ; [ DW_TAG_arg_variable ] [K] [line 434]
!169 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !163)
!170 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !163} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!171 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !163)
!172 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !163} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!173 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !163)
!174 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !163} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!175 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !163)
!176 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !163} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!177 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !163)
!178 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !163)
!179 = !MDLocation(line: 187, column: 2, scope: !9)
!180 = !MDLocation(line: 188, column: 2, scope: !9)
!181 = !MDLocation(line: 190, column: 2, scope: !9)
!182 = !MDLocation(line: 192, column: 2, scope: !116)
!183 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !184} ; [ DW_TAG_arg_variable ] [N] [line 434]
!184 = !MDLocation(line: 200, column: 13, scope: !185)
!185 = !{!"0xb\00200\006\0013", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!186 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !184)
!187 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !184} ; [ DW_TAG_arg_variable ] [J] [line 434]
!188 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !184)
!189 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !184} ; [ DW_TAG_arg_variable ] [K] [line 434]
!190 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !184)
!191 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !184} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!192 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !184)
!193 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !184} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!194 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !184)
!195 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !184} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!196 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !184)
!197 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !184} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!198 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !184)
!199 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !184)
!200 = !MDLocation(line: 208, column: 2, scope: !201)
!201 = !{!"0xb\00208\002\0014", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!202 = !MDLocation(line: 193, column: 49, scope: !203)
!203 = !{!"0xb\00192\0028\0012", !1, !115}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!204 = !MDLocation(line: 193, column: 16, scope: !203)
!205 = !MDLocation(line: 193, column: 14, scope: !203)
!206 = !MDLocation(line: 194, column: 16, scope: !203)
!207 = !MDLocation(line: 194, column: 14, scope: !203)
!208 = !MDLocation(line: 195, column: 16, scope: !203)
!209 = !MDLocation(line: 195, column: 14, scope: !203)
!210 = !MDLocation(line: 196, column: 15, scope: !203)
!211 = !MDLocation(line: 196, column: 14, scope: !203)
!212 = !MDLocation(line: 192, column: 23, scope: !115)
!213 = !MDLocation(line: 195, column: 6, scope: !203)
!214 = !MDLocation(line: 196, column: 6, scope: !203)
!215 = !MDLocation(line: 196, column: 16, scope: !203)
!216 = !MDLocation(line: 196, column: 24, scope: !203)
!217 = !MDLocation(line: 212, column: 27, scope: !218)
!218 = !{!"0xb\00212\006\0016", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!219 = !MDLocation(line: 212, column: 33, scope: !218)
!220 = !MDLocation(line: 212, column: 39, scope: !218)
!221 = !MDLocation(line: 212, column: 45, scope: !218)
!222 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !223} ; [ DW_TAG_arg_variable ] [N] [line 434]
!223 = !MDLocation(line: 212, column: 13, scope: !218)
!224 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !223)
!225 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !223} ; [ DW_TAG_arg_variable ] [J] [line 434]
!226 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !223)
!227 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !223} ; [ DW_TAG_arg_variable ] [K] [line 434]
!228 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !223)
!229 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !223} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!230 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !223)
!231 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !223} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!232 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !223)
!233 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !223} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!234 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !223)
!235 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !223} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!236 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !223)
!237 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !223)
!238 = !MDLocation(line: 221, column: 2, scope: !239)
!239 = !{!"0xb\00221\002\0017", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!240 = !MDLocation(line: 402, column: 40, scope: !46, inlinedAt: !241)
!241 = !MDLocation(line: 209, column: 3, scope: !242)
!242 = !{!"0xb\00208\002\0015", !1, !201}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!243 = !MDLocation(line: 405, column: 40, scope: !46, inlinedAt: !241)
!244 = !MDLocation(line: 402, column: 2, scope: !46, inlinedAt: !241)
!245 = !MDLocation(line: 403, column: 2, scope: !46, inlinedAt: !241)
!246 = !MDLocation(line: 404, column: 2, scope: !46, inlinedAt: !241)
!247 = !MDLocation(line: 405, column: 2, scope: !46, inlinedAt: !241)
!248 = !{!"0x101\00E\0016777613\000", !46, !10, !49, !241} ; [ DW_TAG_arg_variable ] [E] [line 397]
!249 = !MDLocation(line: 397, column: 11, scope: !46, inlinedAt: !241)
!250 = !MDLocation(line: 402, column: 11, scope: !46, inlinedAt: !241)
!251 = !MDLocation(line: 402, column: 9, scope: !46, inlinedAt: !241)
!252 = !MDLocation(line: 403, column: 11, scope: !46, inlinedAt: !241)
!253 = !MDLocation(line: 403, column: 9, scope: !46, inlinedAt: !241)
!254 = !MDLocation(line: 404, column: 11, scope: !46, inlinedAt: !241)
!255 = !MDLocation(line: 404, column: 9, scope: !46, inlinedAt: !241)
!256 = !MDLocation(line: 405, column: 10, scope: !46, inlinedAt: !241)
!257 = !MDLocation(line: 405, column: 9, scope: !46, inlinedAt: !241)
!258 = !MDLocation(line: 208, column: 23, scope: !242)
!259 = !MDLocation(line: 208, column: 14, scope: !242)
!260 = !MDLocation(line: 406, column: 2, scope: !46, inlinedAt: !241)
!261 = !{!262, !262, i64 0}
!262 = !{!"int", !124, i64 0}
!263 = !MDLocation(line: 220, column: 2, scope: !9)
!264 = !MDLocation(line: 221, column: 23, scope: !265)
!265 = !{!"0xb\00221\002\0018", !1, !239}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!266 = distinct !{!266, !267}
!267 = !{!"llvm.loop.unroll.disable"}
!268 = distinct !{!268, !269, !270}
!269 = !{!"llvm.loop.vectorize.width", i32 1}
!270 = !{!"llvm.loop.interleave.count", i32 1}
!271 = !MDLocation(line: 221, column: 14, scope: !265)
!272 = distinct !{!272, !267}
!273 = distinct !{!273, !269, !270}
!274 = !MDLocation(line: 239, column: 21, scope: !275)
!275 = !{!"0xb\00239\006\0023", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!276 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !277} ; [ DW_TAG_arg_variable ] [N] [line 434]
!277 = !MDLocation(line: 239, column: 13, scope: !275)
!278 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !277)
!279 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !277} ; [ DW_TAG_arg_variable ] [J] [line 434]
!280 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !277)
!281 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !277} ; [ DW_TAG_arg_variable ] [K] [line 434]
!282 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !277)
!283 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !277} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!284 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !277)
!285 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !277} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!286 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !277)
!287 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !277} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!288 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !277)
!289 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !277} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!290 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !277)
!291 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !277)
!292 = !MDLocation(line: 249, column: 2, scope: !9)
!293 = !MDLocation(line: 250, column: 2, scope: !9)
!294 = !MDLocation(line: 251, column: 2, scope: !9)
!295 = !MDLocation(line: 253, column: 2, scope: !296)
!296 = !{!"0xb\00253\002\0024", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!297 = !MDLocation(line: 258, column: 6, scope: !298)
!298 = !{!"0xb\00253\0028\0026", !1, !299}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!299 = !{!"0xb\00253\002\0025", !1, !296}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!300 = !MDLocation(line: 253, column: 23, scope: !299)
!301 = !MDLocation(line: 253, column: 14, scope: !299)
!302 = distinct !{!302, !267}
!303 = !MDLocation(line: 258, column: 20, scope: !298)
!304 = !MDLocation(line: 258, column: 24, scope: !298)
!305 = !MDLocation(line: 262, column: 21, scope: !306)
!306 = !{!"0xb\00262\006\0027", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!307 = !MDLocation(line: 262, column: 25, scope: !306)
!308 = !MDLocation(line: 262, column: 31, scope: !306)
!309 = !MDLocation(line: 262, column: 37, scope: !306)
!310 = !MDLocation(line: 262, column: 43, scope: !306)
!311 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !312} ; [ DW_TAG_arg_variable ] [N] [line 434]
!312 = !MDLocation(line: 262, column: 13, scope: !306)
!313 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !312)
!314 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !312} ; [ DW_TAG_arg_variable ] [J] [line 434]
!315 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !312)
!316 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !312} ; [ DW_TAG_arg_variable ] [K] [line 434]
!317 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !312)
!318 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !312} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!319 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !312)
!320 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !312} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!321 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !312)
!322 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !312} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!323 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !312)
!324 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !312} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!325 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !312)
!326 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !312)
!327 = !MDLocation(line: 92, column: 21, scope: !9)
!328 = !MDLocation(line: 92, column: 23, scope: !9)
!329 = !MDLocation(line: 273, column: 2, scope: !330)
!330 = !{!"0xb\00273\002\0028", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!331 = !MDLocation(line: 274, column: 7, scope: !332)
!332 = !{!"0xb\00273\0028\0030", !1, !333}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!333 = !{!"0xb\00273\002\0029", !1, !330}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!334 = !MDLocation(line: 274, column: 17, scope: !332)
!335 = !MDLocation(line: 274, column: 20, scope: !332)
!336 = !MDLocation(line: 274, column: 28, scope: !332)
!337 = !MDLocation(line: 274, column: 42, scope: !332)
!338 = !MDLocation(line: 274, column: 37, scope: !332)
!339 = !MDLocation(line: 274, column: 52, scope: !332)
!340 = !MDLocation(line: 274, column: 47, scope: !332)
!341 = !MDLocation(line: 274, column: 11, scope: !332)
!342 = !MDLocation(line: 275, column: 7, scope: !332)
!343 = !MDLocation(line: 275, column: 17, scope: !332)
!344 = !MDLocation(line: 275, column: 20, scope: !332)
!345 = !MDLocation(line: 275, column: 28, scope: !332)
!346 = !MDLocation(line: 275, column: 42, scope: !332)
!347 = !MDLocation(line: 275, column: 37, scope: !332)
!348 = !MDLocation(line: 275, column: 52, scope: !332)
!349 = !MDLocation(line: 275, column: 47, scope: !332)
!350 = !MDLocation(line: 275, column: 11, scope: !332)
!351 = !MDLocation(line: 273, column: 23, scope: !333)
!352 = !MDLocation(line: 273, column: 14, scope: !333)
!353 = !MDLocation(line: 279, column: 21, scope: !354)
!354 = !{!"0xb\00279\006\0031", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!355 = !MDLocation(line: 279, column: 23, scope: !354)
!356 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !357} ; [ DW_TAG_arg_variable ] [N] [line 434]
!357 = !MDLocation(line: 279, column: 13, scope: !354)
!358 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !357)
!359 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !357} ; [ DW_TAG_arg_variable ] [J] [line 434]
!360 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !357)
!361 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !357} ; [ DW_TAG_arg_variable ] [K] [line 434]
!362 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !357)
!363 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !357} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!364 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !357)
!365 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !357} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!366 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !357)
!367 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !357} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!368 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !357)
!369 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !357} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!370 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !357)
!371 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !357)
!372 = !MDLocation(line: 92, column: 25, scope: !9)
!373 = !{!"0x101\00Z\0050332069\000", !55, !10, !49, !374} ; [ DW_TAG_arg_variable ] [Z] [line 421]
!374 = !MDLocation(line: 292, column: 3, scope: !375)
!375 = !{!"0xb\00291\002\0033", !1, !376}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!376 = !{!"0xb\00291\002\0032", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!377 = !MDLocation(line: 421, column: 32, scope: !55, inlinedAt: !374)
!378 = !MDLocation(line: 291, column: 2, scope: !376)
!379 = !MDLocation(line: 427, column: 7, scope: !55, inlinedAt: !374)
!380 = !MDLocation(line: 428, column: 12, scope: !55, inlinedAt: !374)
!381 = !MDLocation(line: 428, column: 7, scope: !55, inlinedAt: !374)
!382 = !MDLocation(line: 429, column: 9, scope: !55, inlinedAt: !374)
!383 = !MDLocation(line: 429, column: 20, scope: !55, inlinedAt: !374)
!384 = !MDLocation(line: 429, column: 8, scope: !55, inlinedAt: !374)
!385 = !MDLocation(line: 295, column: 21, scope: !386)
!386 = !{!"0xb\00295\006\0034", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!387 = !MDLocation(line: 295, column: 23, scope: !386)
!388 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !389} ; [ DW_TAG_arg_variable ] [N] [line 434]
!389 = !MDLocation(line: 295, column: 13, scope: !386)
!390 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !389)
!391 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !389} ; [ DW_TAG_arg_variable ] [J] [line 434]
!392 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !389)
!393 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !389} ; [ DW_TAG_arg_variable ] [K] [line 434]
!394 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !389)
!395 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !389} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!396 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !389)
!397 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !389} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!398 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !389)
!399 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !389)
!400 = !MDLocation(line: 303, column: 2, scope: !9)
!401 = !MDLocation(line: 304, column: 2, scope: !9)
!402 = !MDLocation(line: 305, column: 2, scope: !9)
!403 = !MDLocation(line: 306, column: 2, scope: !9)
!404 = !MDLocation(line: 307, column: 2, scope: !9)
!405 = !MDLocation(line: 308, column: 2, scope: !9)
!406 = !MDLocation(line: 310, column: 2, scope: !407)
!407 = !{!"0xb\00310\002\0035", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!408 = !MDLocation(line: 415, column: 2, scope: !52, inlinedAt: !409)
!409 = !MDLocation(line: 311, column: 3, scope: !410)
!410 = !{!"0xb\00310\002\0036", !1, !407}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!411 = !MDLocation(line: 415, column: 10, scope: !52, inlinedAt: !409)
!412 = !MDLocation(line: 416, column: 2, scope: !52, inlinedAt: !409)
!413 = !MDLocation(line: 417, column: 2, scope: !52, inlinedAt: !409)
!414 = !MDLocation(line: 310, column: 23, scope: !410)
!415 = !MDLocation(line: 310, column: 14, scope: !410)
!416 = distinct !{!416, !267}
!417 = !MDLocation(line: 314, column: 43, scope: !418)
!418 = !{!"0xb\00314\006\0037", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!419 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !420} ; [ DW_TAG_arg_variable ] [N] [line 434]
!420 = !MDLocation(line: 314, column: 13, scope: !418)
!421 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !420)
!422 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !420} ; [ DW_TAG_arg_variable ] [J] [line 434]
!423 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !420)
!424 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !420} ; [ DW_TAG_arg_variable ] [K] [line 434]
!425 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !420)
!426 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !420} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!427 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !420)
!428 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !420} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!429 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !420)
!430 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !420} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!431 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !420)
!432 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !420} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!433 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !420)
!434 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !420)
!435 = !MDLocation(line: 322, column: 2, scope: !9)
!436 = !MDLocation(line: 323, column: 2, scope: !9)
!437 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !438} ; [ DW_TAG_arg_variable ] [N] [line 434]
!438 = !MDLocation(line: 333, column: 13, scope: !439)
!439 = !{!"0xb\00333\006\0041", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!440 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !438)
!441 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !438} ; [ DW_TAG_arg_variable ] [J] [line 434]
!442 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !438)
!443 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !438} ; [ DW_TAG_arg_variable ] [K] [line 434]
!444 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !438)
!445 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !438} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!446 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !438)
!447 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !438} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!448 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !438)
!449 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !438} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!450 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !438)
!451 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !438} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!452 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !438)
!453 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !438)
!454 = !MDLocation(line: 343, column: 2, scope: !455)
!455 = !{!"0xb\00343\002\0042", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!456 = !MDLocation(line: 344, column: 18, scope: !457)
!457 = !{!"0xb\00343\002\0043", !1, !455}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!458 = !MDLocation(line: 344, column: 26, scope: !457)
!459 = !MDLocation(line: 344, column: 13, scope: !457)
!460 = !MDLocation(line: 344, column: 7, scope: !457)
!461 = !MDLocation(line: 343, column: 24, scope: !457)
!462 = !MDLocation(line: 343, column: 14, scope: !457)
!463 = !MDLocation(line: 347, column: 22, scope: !464)
!464 = !{!"0xb\00347\006\0044", !1, !9}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/whetstone.c]
!465 = !MDLocation(line: 347, column: 24, scope: !464)
!466 = !{!"0x101\00N\0016777650\000", !64, !10, !18, !467} ; [ DW_TAG_arg_variable ] [N] [line 434]
!467 = !MDLocation(line: 347, column: 13, scope: !464)
!468 = !MDLocation(line: 434, column: 11, scope: !64, inlinedAt: !467)
!469 = !{!"0x101\00J\0033554866\000", !64, !10, !18, !467} ; [ DW_TAG_arg_variable ] [J] [line 434]
!470 = !MDLocation(line: 434, column: 19, scope: !64, inlinedAt: !467)
!471 = !{!"0x101\00K\0050332082\000", !64, !10, !18, !467} ; [ DW_TAG_arg_variable ] [K] [line 434]
!472 = !MDLocation(line: 434, column: 27, scope: !64, inlinedAt: !467)
!473 = !{!"0x101\00X1\0067109298\000", !64, !10, !30, !467} ; [ DW_TAG_arg_variable ] [X1] [line 434]
!474 = !MDLocation(line: 434, column: 37, scope: !64, inlinedAt: !467)
!475 = !{!"0x101\00X2\0083886514\000", !64, !10, !30, !467} ; [ DW_TAG_arg_variable ] [X2] [line 434]
!476 = !MDLocation(line: 434, column: 48, scope: !64, inlinedAt: !467)
!477 = !{!"0x101\00X3\00100663730\000", !64, !10, !30, !467} ; [ DW_TAG_arg_variable ] [X3] [line 434]
!478 = !MDLocation(line: 434, column: 59, scope: !64, inlinedAt: !467)
!479 = !{!"0x101\00X4\00117440946\000", !64, !10, !30, !467} ; [ DW_TAG_arg_variable ] [X4] [line 434]
!480 = !MDLocation(line: 434, column: 70, scope: !64, inlinedAt: !467)
!481 = !MDLocation(line: 436, column: 2, scope: !64, inlinedAt: !467)
!482 = !MDLocation(line: 363, column: 12, scope: !9)
!483 = !MDLocation(line: 98, column: 17, scope: !9)
!484 = !MDLocation(line: 374, column: 2, scope: !9)
!485 = !MDLocation(line: 394, column: 1, scope: !9)
!486 = !MDLocation(line: 434, column: 11, scope: !64)
!487 = !MDLocation(line: 434, column: 19, scope: !64)
!488 = !MDLocation(line: 434, column: 27, scope: !64)
!489 = !MDLocation(line: 434, column: 37, scope: !64)
!490 = !MDLocation(line: 434, column: 48, scope: !64)
!491 = !MDLocation(line: 434, column: 59, scope: !64)
!492 = !MDLocation(line: 434, column: 70, scope: !64)
!493 = !MDLocation(line: 436, column: 2, scope: !64)
!494 = !MDLocation(line: 438, column: 1, scope: !64)
!495 = !MDLocation(line: 397, column: 11, scope: !46)
!496 = !MDLocation(line: 399, column: 2, scope: !46)
!497 = !MDLocation(line: 402, column: 11, scope: !46)
!498 = !MDLocation(line: 402, column: 18, scope: !46)
!499 = !MDLocation(line: 402, column: 25, scope: !46)
!500 = !MDLocation(line: 402, column: 32, scope: !46)
!501 = !MDLocation(line: 402, column: 40, scope: !46)
!502 = !MDLocation(line: 402, column: 9, scope: !46)
!503 = !MDLocation(line: 402, column: 2, scope: !46)
!504 = !MDLocation(line: 403, column: 11, scope: !46)
!505 = !MDLocation(line: 403, column: 40, scope: !46)
!506 = !MDLocation(line: 403, column: 9, scope: !46)
!507 = !MDLocation(line: 403, column: 2, scope: !46)
!508 = !MDLocation(line: 404, column: 11, scope: !46)
!509 = !MDLocation(line: 404, column: 40, scope: !46)
!510 = !MDLocation(line: 404, column: 9, scope: !46)
!511 = !MDLocation(line: 404, column: 2, scope: !46)
!512 = !MDLocation(line: 405, column: 10, scope: !46)
!513 = !MDLocation(line: 405, column: 40, scope: !46)
!514 = !MDLocation(line: 405, column: 9, scope: !46)
!515 = !MDLocation(line: 405, column: 2, scope: !46)
!516 = !MDLocation(line: 406, column: 2, scope: !46)
!517 = !MDLocation(line: 408, column: 6, scope: !46)
!518 = !MDLocation(line: 410, column: 1, scope: !46)
!519 = !MDLocation(line: 421, column: 11, scope: !55)
!520 = !MDLocation(line: 421, column: 21, scope: !55)
!521 = !MDLocation(line: 421, column: 32, scope: !55)
!522 = !MDLocation(line: 423, column: 9, scope: !55)
!523 = !MDLocation(line: 423, column: 13, scope: !55)
!524 = !MDLocation(line: 427, column: 7, scope: !55)
!525 = !MDLocation(line: 427, column: 12, scope: !55)
!526 = !MDLocation(line: 428, column: 12, scope: !55)
!527 = !MDLocation(line: 428, column: 7, scope: !55)
!528 = !MDLocation(line: 429, column: 9, scope: !55)
!529 = !MDLocation(line: 429, column: 20, scope: !55)
!530 = !MDLocation(line: 429, column: 8, scope: !55)
!531 = !MDLocation(line: 429, column: 2, scope: !55)
!532 = !MDLocation(line: 430, column: 1, scope: !55)
!533 = !MDLocation(line: 415, column: 13, scope: !52)
!534 = !MDLocation(line: 415, column: 10, scope: !52)
!535 = !MDLocation(line: 415, column: 5, scope: !52)
!536 = !MDLocation(line: 415, column: 2, scope: !52)
!537 = !MDLocation(line: 416, column: 13, scope: !52)
!538 = !MDLocation(line: 416, column: 10, scope: !52)
!539 = !MDLocation(line: 416, column: 2, scope: !52)
!540 = !MDLocation(line: 417, column: 10, scope: !52)
!541 = !MDLocation(line: 417, column: 2, scope: !52)
!542 = !MDLocation(line: 418, column: 1, scope: !52)
