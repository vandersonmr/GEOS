; ModuleID = 'correlation.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %float_n = alloca double, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !87), !dbg !88
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !87), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !35, metadata !87), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !36, metadata !87), !dbg !91
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !92
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !93
  %call2 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !94
  %call3 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !95
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !96
  tail call void @llvm.dbg.value(metadata double* %float_n, i64 0, metadata !37, metadata !87), !dbg !97
  call fastcc void @init_array(double* %float_n, [1000 x double]* %arraydecay), !dbg !98
  tail call void @llvm.dbg.value(metadata double* %float_n, i64 0, metadata !37, metadata !87), !dbg !97
  %0 = load double* %float_n, align 8, !dbg !99, !tbaa !100
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*, !dbg !104
  %arraydecay6 = bitcast i8* %call2 to double*, !dbg !105
  %arraydecay7 = bitcast i8* %call3 to double*, !dbg !106
  tail call fastcc void @kernel_correlation(double %0, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7), !dbg !107
  %cmp = icmp sgt i32 %argc, 42, !dbg !108
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !109

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !87), !dbg !110
  tail call void @llvm.dbg.value(metadata i8* %1, i64 0, metadata !46, metadata !87), !dbg !111
  %1 = load i8** %argv, align 8, !dbg !112, !tbaa !114
  %2 = load i8* %1, align 1, !dbg !112, !tbaa !116
  %phitmp = icmp eq i8 %2, 0, !dbg !110
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !109

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array([1000 x double]* %arraydecay5), !dbg !117
  br label %if.end51, !dbg !117

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !119
  tail call void @free(i8* %call1) #4, !dbg !120
  tail call void @free(i8* %call2) #4, !dbg !121
  tail call void @free(i8* %call3) #4, !dbg !122
  ret i32 0, !dbg !123
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %float_n, [1000 x double]* nocapture %data) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !78, metadata !87), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !79, metadata !87), !dbg !125
  store double 1.200000e+00, double* %float_n, align 8, !dbg !126, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !82, metadata !87), !dbg !127
  br label %for.cond1.preheader, !dbg !128

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc7 ]
  %0 = trunc i64 %indvars.iv3 to i32, !dbg !130
  %conv = sitofp i32 %0 to double, !dbg !130
  br label %for.body3, !dbg !134

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = trunc i64 %indvars.iv to i32, !dbg !135
  %conv4 = sitofp i32 %1 to double, !dbg !135
  %mul = fmul double %conv, %conv4, !dbg !130
  %div = fdiv double %mul, 1.000000e+03, !dbg !136
  %arrayidx6 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv3, i64 %indvars.iv, !dbg !137
  store double %div, double* %arrayidx6, align 8, !dbg !137, !tbaa !100
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !134
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !134
  br i1 %exitcond, label %for.inc7, label %for.body3, !dbg !134

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !128
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000, !dbg !128
  br i1 %exitcond5, label %for.end9, label %for.cond1.preheader, !dbg !128

for.end9:                                         ; preds = %for.inc7
  ret void, !dbg !138
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_correlation(double %float_n, [1000 x double]* nocapture %data, [1000 x double]* nocapture %symmat, double* nocapture %mean, double* nocapture %stddev) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !62, metadata !87), !dbg !139
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !63, metadata !87), !dbg !140
  tail call void @llvm.dbg.value(metadata double 0x3FB99999A0000000, i64 0, metadata !73, metadata !87), !dbg !141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !87), !dbg !142
  br label %for.body, !dbg !143

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv36 = phi i64 [ 0, %entry ], [ %indvars.iv.next37, %for.end ]
  %arrayidx = getelementptr inbounds double* %mean, i64 %indvars.iv36, !dbg !145
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !145, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !87), !dbg !148
  br label %for.body3, !dbg !149

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv33 = phi i64 [ 0, %for.body ], [ %indvars.iv.next34, %for.body3 ]
  %arrayidx7 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv33, i64 %indvars.iv36, !dbg !151
  %0 = load double* %arrayidx7, align 8, !dbg !151, !tbaa !100
  %1 = load double* %arrayidx, align 8, !dbg !153, !tbaa !100
  %add = fadd double %0, %1, !dbg !153
  store double %add, double* %arrayidx, align 8, !dbg !153, !tbaa !100
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1, !dbg !149
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 1000, !dbg !149
  br i1 %exitcond35, label %for.end, label %for.body3, !dbg !149

for.end:                                          ; preds = %for.body3
  %2 = load double* %arrayidx, align 8, !dbg !154, !tbaa !100
  %div = fdiv double %2, %float_n, !dbg !154
  store double %div, double* %arrayidx, align 8, !dbg !154, !tbaa !100
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1, !dbg !143
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1000, !dbg !143
  br i1 %exitcond38, label %for.body17, label %for.body, !dbg !143

for.body17:                                       ; preds = %for.end, %for.end41
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.end41 ], [ 0, %for.end ]
  %arrayidx19 = getelementptr inbounds double* %stddev, i64 %indvars.iv29, !dbg !155
  store double 0.000000e+00, double* %arrayidx19, align 8, !dbg !155, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !87), !dbg !148
  %arrayidx28 = getelementptr inbounds double* %mean, i64 %indvars.iv29, !dbg !159
  br label %for.body22, !dbg !162

for.body22:                                       ; preds = %for.body22, %for.body17
  %indvars.iv26 = phi i64 [ 0, %for.body17 ], [ %indvars.iv.next27, %for.body22 ]
  %arrayidx26 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv26, i64 %indvars.iv29, !dbg !163
  %3 = load double* %arrayidx26, align 8, !dbg !163, !tbaa !100
  %4 = load double* %arrayidx28, align 8, !dbg !159, !tbaa !100
  %sub = fsub double %3, %4, !dbg !163
  %mul = fmul double %sub, %sub, !dbg !164
  %5 = load double* %arrayidx19, align 8, !dbg !165, !tbaa !100
  %add38 = fadd double %5, %mul, !dbg !165
  store double %add38, double* %arrayidx19, align 8, !dbg !165, !tbaa !100
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1, !dbg !162
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000, !dbg !162
  br i1 %exitcond28, label %for.end41, label %for.body22, !dbg !162

for.end41:                                        ; preds = %for.body22
  %6 = load double* %arrayidx19, align 8, !dbg !166, !tbaa !100
  %div44 = fdiv double %6, %float_n, !dbg !166
  store double %div44, double* %arrayidx19, align 8, !dbg !166, !tbaa !100
  %call = tail call double @sqrt(double %div44) #4, !dbg !167
  %cmp51 = fcmp ugt double %call, 0x3FB99999A0000000, !dbg !168
  %cond = select i1 %cmp51, double %call, double 1.000000e+00, !dbg !168
  store double %cond, double* %arrayidx19, align 8, !dbg !169, !tbaa !100
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !170
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1000, !dbg !170
  br i1 %exitcond31, label %for.cond62.preheader, label %for.body17, !dbg !170

for.cond62.preheader:                             ; preds = %for.end41, %for.inc84
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc84 ], [ 0, %for.end41 ]
  br label %for.body64, !dbg !171

for.body64:                                       ; preds = %for.body64, %for.cond62.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond62.preheader ], [ %indvars.iv.next21, %for.body64 ]
  %arrayidx66 = getelementptr inbounds double* %mean, i64 %indvars.iv20, !dbg !175
  %7 = load double* %arrayidx66, align 8, !dbg !175, !tbaa !100
  %arrayidx70 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv23, i64 %indvars.iv20, !dbg !178
  %8 = load double* %arrayidx70, align 8, !dbg !178, !tbaa !100
  %sub71 = fsub double %8, %7, !dbg !178
  store double %sub71, double* %arrayidx70, align 8, !dbg !178, !tbaa !100
  %call72 = tail call double @sqrt(double %float_n) #4, !dbg !179
  %arrayidx74 = getelementptr inbounds double* %stddev, i64 %indvars.iv20, !dbg !180
  %9 = load double* %arrayidx74, align 8, !dbg !180, !tbaa !100
  %mul75 = fmul double %call72, %9, !dbg !179
  %10 = load double* %arrayidx70, align 8, !dbg !181, !tbaa !100
  %div80 = fdiv double %10, %mul75, !dbg !181
  store double %div80, double* %arrayidx70, align 8, !dbg !181, !tbaa !100
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !171
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000, !dbg !171
  br i1 %exitcond22, label %for.inc84, label %for.body64, !dbg !171

for.inc84:                                        ; preds = %for.body64
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !182
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1000, !dbg !182
  br i1 %exitcond25, label %for.body98.lr.ph, label %for.cond62.preheader, !dbg !182

for.cond87.loopexit:                              ; preds = %for.end122
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !183
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 999, !dbg !183
  br i1 %exitcond19, label %for.end136, label %for.body98.lr.ph, !dbg !183

for.body98.lr.ph:                                 ; preds = %for.inc84, %for.cond87.loopexit
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond87.loopexit ], [ 0, %for.inc84 ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.cond87.loopexit ], [ 1, %for.inc84 ]
  %arrayidx94 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv17, i64 %indvars.iv17, !dbg !185
  store double 1.000000e+00, double* %arrayidx94, align 8, !dbg !185, !tbaa !100
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !183
  br label %for.body98, !dbg !188

for.body98:                                       ; preds = %for.end122, %for.body98.lr.ph
  %indvars.iv13 = phi i64 [ %indvars.iv11, %for.body98.lr.ph ], [ %indvars.iv.next14, %for.end122 ]
  %arrayidx102 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv17, i64 %indvars.iv13, !dbg !190
  store double 0.000000e+00, double* %arrayidx102, align 8, !dbg !190, !tbaa !100
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !87), !dbg !148
  br label %for.body105, !dbg !193

for.body105:                                      ; preds = %for.body105, %for.body98
  %indvars.iv = phi i64 [ 0, %for.body98 ], [ %indvars.iv.next, %for.body105 ]
  %arrayidx109 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv, i64 %indvars.iv17, !dbg !195
  %11 = load double* %arrayidx109, align 8, !dbg !195, !tbaa !100
  %arrayidx113 = getelementptr inbounds [1000 x double]* %data, i64 %indvars.iv, i64 %indvars.iv13, !dbg !197
  %12 = load double* %arrayidx113, align 8, !dbg !197, !tbaa !100
  %mul114 = fmul double %11, %12, !dbg !195
  %13 = load double* %arrayidx102, align 8, !dbg !198, !tbaa !100
  %add119 = fadd double %13, %mul114, !dbg !198
  store double %add119, double* %arrayidx102, align 8, !dbg !198, !tbaa !100
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !193
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !193
  br i1 %exitcond, label %for.end122, label %for.body105, !dbg !193

for.end122:                                       ; preds = %for.body105
  %14 = load double* %arrayidx102, align 8, !dbg !199, !tbaa !100
  %arrayidx130 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv13, i64 %indvars.iv17, !dbg !200
  store double %14, double* %arrayidx130, align 8, !dbg !200, !tbaa !100
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !188
  %lftr.wideiv = trunc i64 %indvars.iv.next14 to i32, !dbg !188
  %exitcond15 = icmp eq i32 %lftr.wideiv, 1000, !dbg !188
  br i1 %exitcond15, label %for.cond87.loopexit, label %for.body98, !dbg !188

for.end136:                                       ; preds = %for.cond87.loopexit
  %arrayidx140 = getelementptr inbounds [1000 x double]* %symmat, i64 1000, i64 1000, !dbg !201
  store double 1.000000e+00, double* %arrayidx140, align 8, !dbg !201, !tbaa !100
  ret void, !dbg !202
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %symmat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !53, metadata !87), !dbg !203
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !55, metadata !87), !dbg !204
  br label %for.cond1.preheader, !dbg !205

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = mul nsw i64 %indvars.iv7, 1000, !dbg !207
  br label %for.body3, !dbg !213

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !214, !tbaa !114
  %arrayidx5 = getelementptr inbounds [1000 x double]* %symmat, i64 %indvars.iv7, i64 %indvars.iv, !dbg !215
  %2 = load double* %arrayidx5, align 8, !dbg !215, !tbaa !100
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !216
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !207
  %4 = trunc i64 %3 to i32, !dbg !217
  %rem = srem i32 %4, 20, !dbg !217
  %cmp6 = icmp eq i32 %rem, 0, !dbg !217
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !218

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !219, !tbaa !114
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !221
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !213
  %exitcond = icmp eq i64 %indvars.iv.next, 1000, !dbg !213
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !213

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !205
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000, !dbg !205
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !205

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !222, !tbaa !114
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !223
  ret void, !dbg !224
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!84, !85}
!llvm.ident = !{!86}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c] [DW_LANG_C99]
!1 = !{!"correlation.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation"}
!14 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!19 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0x26\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!22 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!25, !49, !57, !74}
!25 = !{!"0x2e\00main\00main\00\00122\000\001\000\000\00256\001\00123", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777338\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 122]
!34 = !{!"0x101\00argv\0033554554\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 122]
!35 = !{!"0x100\00n\00125\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [n] [line 125]
!36 = !{!"0x100\00m\00126\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [m] [line 126]
!37 = !{!"0x100\00float_n\00129\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 129]
!38 = !{!"0x100\00data\00130\000", !25, !26, !4}  ; [ DW_TAG_auto_variable ] [data] [line 130]
!39 = !{!"0x100\00symmat\00131\000", !25, !26, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 131]
!40 = !{!"0x100\00mean\00132\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 132]
!41 = !{!"0x100\00stddev\00133\000", !25, !26, !9} ; [ DW_TAG_auto_variable ] [stddev] [line 133]
!42 = !{!"0x100\00__s1_len\00154\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 154]
!43 = !{!"0xb\00154\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!44 = !{!"0xb\00154\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!45 = !{!"0x100\00__s2_len\00154\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 154]
!46 = !{!"0x100\00__s2\00154\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 154]
!47 = !{!"0xb\00154\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!48 = !{!"0x100\00__result\00154\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 154]
!49 = !{!"0x2e\00print_array\00print_array\00\0041\001\001\000\000\00256\001\0044", !1, !26, !50, null, void ([1000 x double]*)* @print_array, null, null, !52} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [scope 44] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !9}
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00m\0016777257\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 41]
!54 = !{!"0x101\00symmat\0033554474\000", !49, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 42]
!55 = !{!"0x100\00i\0045\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!56 = !{!"0x100\00j\0045\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!57 = !{!"0x2e\00kernel_correlation\00kernel_correlation\00\0059\001\001\000\000\00256\001\0065", !1, !26, !58, null, void (double, [1000 x double]*, [1000 x double]*, double*, double*)* @kernel_correlation, null, null, !61} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 65] [kernel_correlation]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !29, !29, !6, !9, !9, !60, !60}
!60 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!62 = !{!"0x101\00m\0016777275\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 59]
!63 = !{!"0x101\00n\0033554491\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 59]
!64 = !{!"0x101\00float_n\0050331708\000", !57, !26, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 60]
!65 = !{!"0x101\00data\0067108925\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 61]
!66 = !{!"0x101\00symmat\0083886142\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 62]
!67 = !{!"0x101\00mean\00100663359\000", !57, !26, !60} ; [ DW_TAG_arg_variable ] [mean] [line 63]
!68 = !{!"0x101\00stddev\00117440576\000", !57, !26, !60} ; [ DW_TAG_arg_variable ] [stddev] [line 64]
!69 = !{!"0x100\00i\0066\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 66]
!70 = !{!"0x100\00j\0066\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 66]
!71 = !{!"0x100\00j1\0066\000", !57, !26, !29}    ; [ DW_TAG_auto_variable ] [j1] [line 66]
!72 = !{!"0x100\00j2\0066\000", !57, !26, !29}    ; [ DW_TAG_auto_variable ] [j2] [line 66]
!73 = !{!"0x100\00eps\0068\000", !57, !26, !6}    ; [ DW_TAG_auto_variable ] [eps] [line 68]
!74 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !75, null, void (double*, [1000 x double]*)* @init_array, null, null, !77} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{null, !29, !29, !60, !9}
!77 = !{!78, !79, !80, !81, !82, !83}
!78 = !{!"0x101\00m\0016777239\000", !74, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 23]
!79 = !{!"0x101\00n\0033554456\000", !74, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 24]
!80 = !{!"0x101\00float_n\0050331673\000", !74, !26, !60} ; [ DW_TAG_arg_variable ] [float_n] [line 25]
!81 = !{!"0x101\00data\0067108890\000", !74, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 26]
!82 = !{!"0x100\00i\0028\000", !74, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!83 = !{!"0x100\00j\0028\000", !74, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!84 = !{i32 2, !"Dwarf Version", i32 4}
!85 = !{i32 2, !"Debug Info Version", i32 2}
!86 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!87 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!88 = !MDLocation(line: 122, column: 14, scope: !25)
!89 = !MDLocation(line: 122, column: 27, scope: !25)
!90 = !MDLocation(line: 125, column: 7, scope: !25)
!91 = !MDLocation(line: 126, column: 7, scope: !25)
!92 = !MDLocation(line: 130, column: 3, scope: !25)
!93 = !MDLocation(line: 131, column: 3, scope: !25)
!94 = !MDLocation(line: 132, column: 3, scope: !25)
!95 = !MDLocation(line: 133, column: 3, scope: !25)
!96 = !MDLocation(line: 136, column: 31, scope: !25)
!97 = !MDLocation(line: 129, column: 13, scope: !25)
!98 = !MDLocation(line: 136, column: 3, scope: !25)
!99 = !MDLocation(line: 142, column: 29, scope: !25)
!100 = !{!101, !101, i64 0}
!101 = !{!"double", !102, i64 0}
!102 = !{!"omnipotent char", !103, i64 0}
!103 = !{!"Simple C/C++ TBAA"}
!104 = !MDLocation(line: 144, column: 9, scope: !25)
!105 = !MDLocation(line: 145, column: 9, scope: !25)
!106 = !MDLocation(line: 146, column: 9, scope: !25)
!107 = !MDLocation(line: 142, column: 3, scope: !25)
!108 = !MDLocation(line: 154, column: 3, scope: !44)
!109 = !MDLocation(line: 154, column: 3, scope: !25)
!110 = !MDLocation(line: 154, column: 3, scope: !43)
!111 = !MDLocation(line: 154, column: 3, scope: !47)
!112 = !MDLocation(line: 154, column: 3, scope: !113)
!113 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!114 = !{!115, !115, i64 0}
!115 = !{!"any pointer", !102, i64 0}
!116 = !{!102, !102, i64 0}
!117 = !MDLocation(line: 154, column: 3, scope: !118)
!118 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!119 = !MDLocation(line: 157, column: 3, scope: !25)
!120 = !MDLocation(line: 158, column: 3, scope: !25)
!121 = !MDLocation(line: 159, column: 3, scope: !25)
!122 = !MDLocation(line: 160, column: 3, scope: !25)
!123 = !MDLocation(line: 162, column: 3, scope: !25)
!124 = !MDLocation(line: 23, column: 22, scope: !74)
!125 = !MDLocation(line: 24, column: 8, scope: !74)
!126 = !MDLocation(line: 30, column: 3, scope: !74)
!127 = !MDLocation(line: 28, column: 7, scope: !74)
!128 = !MDLocation(line: 32, column: 3, scope: !129)
!129 = !{!"0xb\0032\003\0037", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!130 = !MDLocation(line: 34, column: 21, scope: !131)
!131 = !{!"0xb\0033\005\0040", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!132 = !{!"0xb\0033\005\0039", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!133 = !{!"0xb\0032\003\0038", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!134 = !MDLocation(line: 33, column: 5, scope: !132)
!135 = !MDLocation(line: 34, column: 35, scope: !131)
!136 = !MDLocation(line: 34, column: 20, scope: !131)
!137 = !MDLocation(line: 34, column: 7, scope: !131)
!138 = !MDLocation(line: 35, column: 1, scope: !74)
!139 = !MDLocation(line: 59, column: 29, scope: !57)
!140 = !MDLocation(line: 59, column: 36, scope: !57)
!141 = !MDLocation(line: 68, column: 13, scope: !57)
!142 = !MDLocation(line: 66, column: 10, scope: !57)
!143 = !MDLocation(line: 74, column: 3, scope: !144)
!144 = !{!"0xb\0074\003\0014", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!145 = !MDLocation(line: 76, column: 7, scope: !146)
!146 = !{!"0xb\0075\005\0016", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!147 = !{!"0xb\0074\003\0015", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!148 = !MDLocation(line: 66, column: 7, scope: !57)
!149 = !MDLocation(line: 77, column: 7, scope: !150)
!150 = !{!"0xb\0077\007\0017", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!151 = !MDLocation(line: 78, column: 13, scope: !152)
!152 = !{!"0xb\0077\007\0018", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!153 = !MDLocation(line: 78, column: 2, scope: !152)
!154 = !MDLocation(line: 79, column: 7, scope: !146)
!155 = !MDLocation(line: 85, column: 7, scope: !156)
!156 = !{!"0xb\0084\005\0021", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!157 = !{!"0xb\0083\003\0020", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!158 = !{!"0xb\0083\003\0019", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!159 = !MDLocation(line: 87, column: 29, scope: !160)
!160 = !{!"0xb\0086\007\0023", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!161 = !{!"0xb\0086\007\0022", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!162 = !MDLocation(line: 86, column: 7, scope: !161)
!163 = !MDLocation(line: 87, column: 16, scope: !160)
!164 = !MDLocation(line: 87, column: 15, scope: !160)
!165 = !MDLocation(line: 87, column: 2, scope: !160)
!166 = !MDLocation(line: 88, column: 7, scope: !156)
!167 = !MDLocation(line: 89, column: 19, scope: !156)
!168 = !MDLocation(line: 93, column: 19, scope: !156)
!169 = !MDLocation(line: 93, column: 7, scope: !156)
!170 = !MDLocation(line: 83, column: 3, scope: !158)
!171 = !MDLocation(line: 98, column: 5, scope: !172)
!172 = !{!"0xb\0098\005\0026", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!173 = !{!"0xb\0097\003\0025", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!174 = !{!"0xb\0097\003\0024", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!175 = !MDLocation(line: 100, column: 16, scope: !176)
!176 = !{!"0xb\0099\007\0028", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!177 = !{!"0xb\0098\005\0027", !1, !172}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!178 = !MDLocation(line: 100, column: 2, scope: !176)
!179 = !MDLocation(line: 101, column: 16, scope: !176)
!180 = !MDLocation(line: 101, column: 32, scope: !176)
!181 = !MDLocation(line: 101, column: 2, scope: !176)
!182 = !MDLocation(line: 97, column: 3, scope: !174)
!183 = !MDLocation(line: 105, column: 3, scope: !184)
!184 = !{!"0xb\00105\003\0029", !1, !57}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!185 = !MDLocation(line: 107, column: 7, scope: !186)
!186 = !{!"0xb\00106\005\0031", !1, !187}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!187 = !{!"0xb\00105\003\0030", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!188 = !MDLocation(line: 108, column: 7, scope: !189)
!189 = !{!"0xb\00108\007\0032", !1, !186}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!190 = !MDLocation(line: 110, column: 4, scope: !191)
!191 = !{!"0xb\00109\002\0034", !1, !192}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!192 = !{!"0xb\00108\007\0033", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!193 = !MDLocation(line: 111, column: 4, scope: !194)
!194 = !{!"0xb\00111\004\0035", !1, !191}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!195 = !MDLocation(line: 112, column: 25, scope: !196)
!196 = !{!"0xb\00111\004\0036", !1, !194}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!197 = !MDLocation(line: 112, column: 39, scope: !196)
!198 = !MDLocation(line: 112, column: 6, scope: !196)
!199 = !MDLocation(line: 113, column: 21, scope: !191)
!200 = !MDLocation(line: 113, column: 4, scope: !191)
!201 = !MDLocation(line: 116, column: 3, scope: !57)
!202 = !MDLocation(line: 119, column: 1, scope: !57)
!203 = !MDLocation(line: 41, column: 22, scope: !49)
!204 = !MDLocation(line: 45, column: 7, scope: !49)
!205 = !MDLocation(line: 47, column: 3, scope: !206)
!206 = !{!"0xb\0047\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!207 = !MDLocation(line: 50, column: 12, scope: !208)
!208 = !{!"0xb\0050\0011\0013", !1, !209}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!209 = !{!"0xb\0048\0029\0012", !1, !210}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!210 = !{!"0xb\0048\005\0011", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!211 = !{!"0xb\0048\005\0010", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!212 = !{!"0xb\0047\003\009", !1, !206}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!213 = !MDLocation(line: 48, column: 5, scope: !211)
!214 = !MDLocation(line: 49, column: 16, scope: !209)
!215 = !MDLocation(line: 49, column: 46, scope: !209)
!216 = !MDLocation(line: 49, column: 7, scope: !209)
!217 = !MDLocation(line: 50, column: 11, scope: !208)
!218 = !MDLocation(line: 50, column: 11, scope: !209)
!219 = !MDLocation(line: 50, column: 43, scope: !220)
!220 = !{!"0xb\001", !1, !208}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!221 = !MDLocation(line: 50, column: 34, scope: !208)
!222 = !MDLocation(line: 52, column: 12, scope: !49)
!223 = !MDLocation(line: 52, column: 3, scope: !49)
!224 = !MDLocation(line: 53, column: 1, scope: !49)
