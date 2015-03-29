; ModuleID = '2mm.c'
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !100), !dbg !101
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !100), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !100), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !100), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !34, metadata !100), !dbg !105
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !35, metadata !100), !dbg !106
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !107
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !108
  %call4 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !109
  %call6 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !110
  %call8 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !111
  %arraydecay = bitcast i8* %call2 to [1024 x double]*, !dbg !112
  %arraydecay9 = bitcast i8* %call4 to [1024 x double]*, !dbg !113
  %arraydecay10 = bitcast i8* %call6 to [1024 x double]*, !dbg !114
  %arraydecay11 = bitcast i8* %call8 to [1024 x double]*, !dbg !115
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !36, metadata !100), !dbg !116
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !37, metadata !100), !dbg !117
  call fastcc void @init_array(double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay9, [1024 x double]* %arraydecay10, [1024 x double]* %arraydecay11), !dbg !118
  tail call void @llvm.dbg.value(metadata double* %alpha, i64 0, metadata !36, metadata !100), !dbg !116
  %0 = load double* %alpha, align 8, !dbg !119, !tbaa !120
  tail call void @llvm.dbg.value(metadata double* %beta, i64 0, metadata !37, metadata !100), !dbg !117
  %1 = load double* %beta, align 8, !dbg !124, !tbaa !120
  %arraydecay12 = bitcast i8* %call to [1024 x double]*, !dbg !125
  tail call fastcc void @kernel_2mm(double %0, double %1, [1024 x double]* %arraydecay12, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay9, [1024 x double]* %arraydecay10, [1024 x double]* %arraydecay11), !dbg !126
  %cmp = icmp sgt i32 %argc, 42, !dbg !127
  br i1 %cmp, label %if.end56, label %if.end63, !dbg !128

if.end56:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !100), !dbg !129
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !47, metadata !100), !dbg !130
  %2 = load i8** %argv, align 8, !dbg !131, !tbaa !133
  %3 = load i8* %2, align 1, !dbg !131, !tbaa !135
  %phitmp = icmp eq i8 %3, 0, !dbg !129
  br i1 %phitmp, label %if.then61, label %if.end63, !dbg !128

if.then61:                                        ; preds = %if.end56
  tail call fastcc void @print_array([1024 x double]* %arraydecay11), !dbg !136
  br label %if.end63, !dbg !136

if.end63:                                         ; preds = %if.end56, %if.then61, %entry
  tail call void @free(i8* %call) #4, !dbg !138
  tail call void @free(i8* %call2) #4, !dbg !139
  tail call void @free(i8* %call4) #4, !dbg !140
  tail call void @free(i8* %call6) #4, !dbg !141
  tail call void @free(i8* %call8) #4, !dbg !142
  ret i32 0, !dbg !143
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B, [1024 x double]* nocapture %C, [1024 x double]* nocapture %D) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !85, metadata !100), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !86, metadata !100), !dbg !145
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !87, metadata !100), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !88, metadata !100), !dbg !147
  store double 3.241200e+04, double* %alpha, align 8, !dbg !148, !tbaa !120
  store double 2.123000e+03, double* %beta, align 8, !dbg !149, !tbaa !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !95, metadata !100), !dbg !150
  br label %for.cond1.preheader, !dbg !151

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.inc8 ]
  %0 = trunc i64 %indvars.iv29 to i32, !dbg !153
  %conv = sitofp i32 %0 to double, !dbg !153
  br label %for.body3, !dbg !157

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next27, %for.body3 ]
  %1 = trunc i64 %indvars.iv26 to i32, !dbg !158
  %conv4 = sitofp i32 %1 to double, !dbg !158
  %mul = fmul double %conv, %conv4, !dbg !153
  %div = fmul double %mul, 9.765625e-04, !dbg !159
  %arrayidx7 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv26, !dbg !160
  store double %div, double* %arrayidx7, align 8, !dbg !160, !tbaa !120
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1, !dbg !157
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1024, !dbg !157
  br i1 %exitcond28, label %for.inc8, label %for.body3, !dbg !157

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !151
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1024, !dbg !151
  br i1 %exitcond31, label %for.cond15.preheader, label %for.cond1.preheader, !dbg !151

for.cond15.preheader:                             ; preds = %for.inc8, %for.inc31
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc31 ], [ 0, %for.inc8 ]
  %2 = trunc i64 %indvars.iv23 to i32, !dbg !161
  %conv19 = sitofp i32 %2 to double, !dbg !161
  br label %for.body18, !dbg !166

for.body18:                                       ; preds = %for.body18, %for.cond15.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next21, %for.body18 ]
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !166
  %3 = trunc i64 %indvars.iv.next21 to i32, !dbg !167
  %conv20 = sitofp i32 %3 to double, !dbg !167
  %mul21 = fmul double %conv19, %conv20, !dbg !161
  %div23 = fmul double %mul21, 9.765625e-04, !dbg !168
  %arrayidx27 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv20, !dbg !169
  store double %div23, double* %arrayidx27, align 8, !dbg !169, !tbaa !120
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1024, !dbg !166
  br i1 %exitcond22, label %for.inc31, label %for.body18, !dbg !166

for.inc31:                                        ; preds = %for.body18
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !170
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1024, !dbg !170
  br i1 %exitcond25, label %for.cond38.preheader, label %for.cond15.preheader, !dbg !170

for.cond38.preheader:                             ; preds = %for.inc31, %for.inc55
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc55 ], [ 0, %for.inc31 ]
  %4 = trunc i64 %indvars.iv17 to i32, !dbg !171
  %conv42 = sitofp i32 %4 to double, !dbg !171
  br label %for.body41, !dbg !176

for.body41:                                       ; preds = %for.body41, %for.cond38.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next14, %for.body41 ]
  %5 = add nuw nsw i64 %indvars.iv13, 3, !dbg !177
  %6 = trunc i64 %5 to i32, !dbg !178
  %conv44 = sitofp i32 %6 to double, !dbg !178
  %mul45 = fmul double %conv42, %conv44, !dbg !171
  %div47 = fmul double %mul45, 9.765625e-04, !dbg !179
  %arrayidx51 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv13, !dbg !180
  store double %div47, double* %arrayidx51, align 8, !dbg !180, !tbaa !120
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !176
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1024, !dbg !176
  br i1 %exitcond16, label %for.inc55, label %for.body41, !dbg !176

for.inc55:                                        ; preds = %for.body41
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !181
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1024, !dbg !181
  br i1 %exitcond19, label %for.cond62.preheader, label %for.cond38.preheader, !dbg !181

for.cond62.preheader:                             ; preds = %for.inc55, %for.inc79
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc79 ], [ 0, %for.inc55 ]
  %7 = trunc i64 %indvars.iv10 to i32, !dbg !182
  %conv66 = sitofp i32 %7 to double, !dbg !182
  br label %for.body65, !dbg !187

for.body65:                                       ; preds = %for.body65, %for.cond62.preheader
  %indvars.iv = phi i64 [ 0, %for.cond62.preheader ], [ %indvars.iv.next, %for.body65 ]
  %8 = add nuw nsw i64 %indvars.iv, 2, !dbg !188
  %9 = trunc i64 %8 to i32, !dbg !189
  %conv68 = sitofp i32 %9 to double, !dbg !189
  %mul69 = fmul double %conv66, %conv68, !dbg !182
  %div71 = fmul double %mul69, 9.765625e-04, !dbg !190
  %arrayidx75 = getelementptr inbounds [1024 x double]* %D, i64 %indvars.iv10, i64 %indvars.iv, !dbg !191
  store double %div71, double* %arrayidx75, align 8, !dbg !191, !tbaa !120
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !187
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !187
  br i1 %exitcond, label %for.inc79, label %for.body65, !dbg !187

for.inc79:                                        ; preds = %for.body65
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !192
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1024, !dbg !192
  br i1 %exitcond12, label %for.end81, label %for.cond62.preheader, !dbg !192

for.end81:                                        ; preds = %for.inc79
  ret void, !dbg !193
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_2mm(double %alpha, double %beta, [1024 x double]* nocapture %tmp, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture readonly %B, [1024 x double]* nocapture readonly %C, [1024 x double]* nocapture %D) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !66, metadata !100), !dbg !194
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !67, metadata !100), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !68, metadata !100), !dbg !196
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !69, metadata !100), !dbg !197
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !77, metadata !100), !dbg !198
  br label %for.cond4.preheader, !dbg !199

for.cond4.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.inc28 ]
  br label %for.body6, !dbg !201

for.body6:                                        ; preds = %for.inc25, %for.cond4.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next17, %for.inc25 ]
  %arrayidx8 = getelementptr inbounds [1024 x double]* %tmp, i64 %indvars.iv20, i64 %indvars.iv16, !dbg !204
  store double 0.000000e+00, double* %arrayidx8, align 8, !dbg !204, !tbaa !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !79, metadata !100), !dbg !207
  br label %for.body11, !dbg !208

for.body11:                                       ; preds = %for.body11, %for.body6
  %indvars.iv13 = phi i64 [ 0, %for.body6 ], [ %indvars.iv.next14, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv13, !dbg !210
  %0 = load double* %arrayidx15, align 8, !dbg !210, !tbaa !120
  %mul = fmul double %0, %alpha, !dbg !212
  %arrayidx19 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv13, i64 %indvars.iv16, !dbg !213
  %1 = load double* %arrayidx19, align 8, !dbg !213, !tbaa !120
  %mul20 = fmul double %mul, %1, !dbg !212
  %2 = load double* %arrayidx8, align 8, !dbg !214, !tbaa !120
  %add = fadd double %2, %mul20, !dbg !214
  store double %add, double* %arrayidx8, align 8, !dbg !214, !tbaa !120
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !208
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1024, !dbg !208
  br i1 %exitcond15, label %for.inc25, label %for.body11, !dbg !208

for.inc25:                                        ; preds = %for.body11
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !201
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1024, !dbg !201
  br i1 %exitcond18, label %for.inc28, label %for.body6, !dbg !201

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !199
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1024, !dbg !199
  br i1 %exitcond22, label %for.cond34.preheader, label %for.cond4.preheader, !dbg !199

for.cond34.preheader:                             ; preds = %for.inc28, %for.inc65
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc65 ], [ 0, %for.inc28 ]
  br label %for.body36, !dbg !215

for.body36:                                       ; preds = %for.inc62, %for.cond34.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond34.preheader ], [ %indvars.iv.next8, %for.inc62 ]
  %arrayidx40 = getelementptr inbounds [1024 x double]* %D, i64 %indvars.iv10, i64 %indvars.iv7, !dbg !219
  %3 = load double* %arrayidx40, align 8, !dbg !219, !tbaa !120
  %mul41 = fmul double %3, %beta, !dbg !219
  store double %mul41, double* %arrayidx40, align 8, !dbg !219, !tbaa !120
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !79, metadata !100), !dbg !207
  br label %for.body44, !dbg !222

for.body44:                                       ; preds = %for.body44, %for.body36
  %indvars.iv = phi i64 [ 0, %for.body36 ], [ %indvars.iv.next, %for.body44 ]
  %arrayidx48 = getelementptr inbounds [1024 x double]* %tmp, i64 %indvars.iv10, i64 %indvars.iv, !dbg !224
  %4 = load double* %arrayidx48, align 8, !dbg !224, !tbaa !120
  %arrayidx52 = getelementptr inbounds [1024 x double]* %C, i64 %indvars.iv, i64 %indvars.iv7, !dbg !226
  %5 = load double* %arrayidx52, align 8, !dbg !226, !tbaa !120
  %mul53 = fmul double %4, %5, !dbg !224
  %6 = load double* %arrayidx40, align 8, !dbg !227, !tbaa !120
  %add58 = fadd double %6, %mul53, !dbg !227
  store double %add58, double* %arrayidx40, align 8, !dbg !227, !tbaa !120
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !222
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !222
  br i1 %exitcond, label %for.inc62, label %for.body44, !dbg !222

for.inc62:                                        ; preds = %for.body44
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !215
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !215
  br i1 %exitcond9, label %for.inc65, label %for.body36, !dbg !215

for.inc65:                                        ; preds = %for.inc62
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !228
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1024, !dbg !228
  br i1 %exitcond12, label %for.end67, label %for.cond34.preheader, !dbg !228

for.end67:                                        ; preds = %for.inc65
  ret void, !dbg !229
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %D) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !57, metadata !100), !dbg !230
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !58, metadata !100), !dbg !231
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !60, metadata !100), !dbg !232
  br label %for.cond1.preheader, !dbg !233

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !235
  br label %for.body3, !dbg !241

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !242, !tbaa !133
  %arrayidx5 = getelementptr inbounds [1024 x double]* %D, i64 %indvars.iv7, i64 %indvars.iv, !dbg !243
  %2 = load double* %arrayidx5, align 8, !dbg !243, !tbaa !120
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !244
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !235
  %4 = trunc i64 %3 to i32, !dbg !245
  %rem = srem i32 %4, 20, !dbg !245
  %cmp6 = icmp eq i32 %rem, 0, !dbg !245
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !246

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !247, !tbaa !133
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !249
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !241
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !241
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !241

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !233
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !233
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !233

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !250, !tbaa !133
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !251
  ret void, !dbg !252
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

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
!llvm.module.flags = !{!97, !98}
!llvm.ident = !{!99}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c] [DW_LANG_C99]
!1 = !{!"2mm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm"}
!11 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!16 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!22, !50, !62, !80}
!22 = !{!"0x2e\00main\00main\00\00102\000\001\000\000\00256\001\00103", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 102] [def] [scope 103] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !46, !47, !49}
!30 = !{!"0x101\00argc\0016777318\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 102]
!31 = !{!"0x101\00argv\0033554534\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 102]
!32 = !{!"0x100\00ni\00105\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [ni] [line 105]
!33 = !{!"0x100\00nj\00106\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [nj] [line 106]
!34 = !{!"0x100\00nk\00107\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [nk] [line 107]
!35 = !{!"0x100\00nl\00108\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [nl] [line 108]
!36 = !{!"0x100\00alpha\00111\000", !22, !23, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 111]
!37 = !{!"0x100\00beta\00112\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 112]
!38 = !{!"0x100\00tmp\00113\000", !22, !23, !4}   ; [ DW_TAG_auto_variable ] [tmp] [line 113]
!39 = !{!"0x100\00A\00114\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 114]
!40 = !{!"0x100\00B\00115\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 115]
!41 = !{!"0x100\00C\00116\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [C] [line 116]
!42 = !{!"0x100\00D\00117\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [D] [line 117]
!43 = !{!"0x100\00__s1_len\00144\000", !44, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 144]
!44 = !{!"0xb\00144\003\001", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!45 = !{!"0xb\00144\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!46 = !{!"0x100\00__s2_len\00144\000", !44, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 144]
!47 = !{!"0x100\00__s2\00144\000", !48, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 144]
!48 = !{!"0xb\00144\003\002", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!49 = !{!"0x100\00__result\00144\000", !48, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 144]
!50 = !{!"0x2e\00print_array\00print_array\00\0053\001\001\000\000\00256\001\0055", !1, !23, !51, null, void ([1024 x double]*)* @print_array, null, null, !56} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [scope 55] [print_array]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{null, !26, !26, !53}
!53 = !{!"0xf\00\000\0064\0064\000\000", null, null, !54} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!54 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!55 = !{!8}
!56 = !{!57, !58, !59, !60, !61}
!57 = !{!"0x101\00ni\0016777269\000", !50, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 53]
!58 = !{!"0x101\00nl\0033554485\000", !50, !23, !26} ; [ DW_TAG_arg_variable ] [nl] [line 53]
!59 = !{!"0x101\00D\0050331702\000", !50, !23, !53} ; [ DW_TAG_arg_variable ] [D] [line 54]
!60 = !{!"0x100\00i\0056\000", !50, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 56]
!61 = !{!"0x100\00j\0056\000", !50, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 56]
!62 = !{!"0x2e\00kernel_2mm\00kernel_2mm\00\0070\001\001\000\000\00256\001\0078", !1, !23, !63, null, void (double, double, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_2mm, null, null, !65} ; [ DW_TAG_subprogram ] [line 70] [local] [def] [scope 78] [kernel_2mm]
!63 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !64, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = !{null, !26, !26, !26, !26, !6, !6, !53, !53, !53, !53, !53}
!65 = !{!66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79}
!66 = !{!"0x101\00ni\0016777286\000", !62, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 70]
!67 = !{!"0x101\00nj\0033554502\000", !62, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 70]
!68 = !{!"0x101\00nk\0050331718\000", !62, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 70]
!69 = !{!"0x101\00nl\0067108934\000", !62, !23, !26} ; [ DW_TAG_arg_variable ] [nl] [line 70]
!70 = !{!"0x101\00alpha\0083886151\000", !62, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 71]
!71 = !{!"0x101\00beta\00100663368\000", !62, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 72]
!72 = !{!"0x101\00tmp\00117440585\000", !62, !23, !53} ; [ DW_TAG_arg_variable ] [tmp] [line 73]
!73 = !{!"0x101\00A\00134217802\000", !62, !23, !53} ; [ DW_TAG_arg_variable ] [A] [line 74]
!74 = !{!"0x101\00B\00150995019\000", !62, !23, !53} ; [ DW_TAG_arg_variable ] [B] [line 75]
!75 = !{!"0x101\00C\00167772236\000", !62, !23, !53} ; [ DW_TAG_arg_variable ] [C] [line 76]
!76 = !{!"0x101\00D\00184549453\000", !62, !23, !53} ; [ DW_TAG_arg_variable ] [D] [line 77]
!77 = !{!"0x100\00i\0079\000", !62, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 79]
!78 = !{!"0x100\00j\0079\000", !62, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 79]
!79 = !{!"0x100\00k\0079\000", !62, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 79]
!80 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0030", !1, !23, !81, null, void (double*, double*, [1024 x double]*, [1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !84} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 30] [init_array]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{null, !26, !26, !26, !26, !83, !83, !53, !53, !53, !53}
!83 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!84 = !{!85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96}
!85 = !{!"0x101\00ni\0016777239\000", !80, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!86 = !{!"0x101\00nj\0033554455\000", !80, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!87 = !{!"0x101\00nk\0050331671\000", !80, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!88 = !{!"0x101\00nl\0067108887\000", !80, !23, !26} ; [ DW_TAG_arg_variable ] [nl] [line 23]
!89 = !{!"0x101\00alpha\0083886104\000", !80, !23, !83} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!90 = !{!"0x101\00beta\00100663321\000", !80, !23, !83} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!91 = !{!"0x101\00A\00117440538\000", !80, !23, !53} ; [ DW_TAG_arg_variable ] [A] [line 26]
!92 = !{!"0x101\00B\00134217755\000", !80, !23, !53} ; [ DW_TAG_arg_variable ] [B] [line 27]
!93 = !{!"0x101\00C\00150994972\000", !80, !23, !53} ; [ DW_TAG_arg_variable ] [C] [line 28]
!94 = !{!"0x101\00D\00167772189\000", !80, !23, !53} ; [ DW_TAG_arg_variable ] [D] [line 29]
!95 = !{!"0x100\00i\0031\000", !80, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 31]
!96 = !{!"0x100\00j\0031\000", !80, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 31]
!97 = !{i32 2, !"Dwarf Version", i32 4}
!98 = !{i32 2, !"Debug Info Version", i32 2}
!99 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!100 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!101 = !MDLocation(line: 102, column: 14, scope: !22)
!102 = !MDLocation(line: 102, column: 27, scope: !22)
!103 = !MDLocation(line: 105, column: 7, scope: !22)
!104 = !MDLocation(line: 106, column: 7, scope: !22)
!105 = !MDLocation(line: 107, column: 7, scope: !22)
!106 = !MDLocation(line: 108, column: 7, scope: !22)
!107 = !MDLocation(line: 113, column: 3, scope: !22)
!108 = !MDLocation(line: 114, column: 3, scope: !22)
!109 = !MDLocation(line: 115, column: 3, scope: !22)
!110 = !MDLocation(line: 116, column: 3, scope: !22)
!111 = !MDLocation(line: 117, column: 3, scope: !22)
!112 = !MDLocation(line: 121, column: 8, scope: !22)
!113 = !MDLocation(line: 122, column: 8, scope: !22)
!114 = !MDLocation(line: 123, column: 8, scope: !22)
!115 = !MDLocation(line: 124, column: 8, scope: !22)
!116 = !MDLocation(line: 111, column: 13, scope: !22)
!117 = !MDLocation(line: 112, column: 13, scope: !22)
!118 = !MDLocation(line: 120, column: 3, scope: !22)
!119 = !MDLocation(line: 131, column: 8, scope: !22)
!120 = !{!121, !121, i64 0}
!121 = !{!"double", !122, i64 0}
!122 = !{!"omnipotent char", !123, i64 0}
!123 = !{!"Simple C/C++ TBAA"}
!124 = !MDLocation(line: 131, column: 15, scope: !22)
!125 = !MDLocation(line: 132, column: 8, scope: !22)
!126 = !MDLocation(line: 130, column: 3, scope: !22)
!127 = !MDLocation(line: 144, column: 3, scope: !45)
!128 = !MDLocation(line: 144, column: 3, scope: !22)
!129 = !MDLocation(line: 144, column: 3, scope: !44)
!130 = !MDLocation(line: 144, column: 3, scope: !48)
!131 = !MDLocation(line: 144, column: 3, scope: !132)
!132 = !{!"0xb\004", !1, !48}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!133 = !{!134, !134, i64 0}
!134 = !{!"any pointer", !122, i64 0}
!135 = !{!122, !122, i64 0}
!136 = !MDLocation(line: 144, column: 3, scope: !137)
!137 = !{!"0xb\0023", !1, !45}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!138 = !MDLocation(line: 147, column: 3, scope: !22)
!139 = !MDLocation(line: 148, column: 3, scope: !22)
!140 = !MDLocation(line: 149, column: 3, scope: !22)
!141 = !MDLocation(line: 150, column: 3, scope: !22)
!142 = !MDLocation(line: 151, column: 3, scope: !22)
!143 = !MDLocation(line: 153, column: 3, scope: !22)
!144 = !MDLocation(line: 23, column: 21, scope: !80)
!145 = !MDLocation(line: 23, column: 29, scope: !80)
!146 = !MDLocation(line: 23, column: 37, scope: !80)
!147 = !MDLocation(line: 23, column: 45, scope: !80)
!148 = !MDLocation(line: 33, column: 3, scope: !80)
!149 = !MDLocation(line: 34, column: 3, scope: !80)
!150 = !MDLocation(line: 31, column: 7, scope: !80)
!151 = !MDLocation(line: 35, column: 3, scope: !152)
!152 = !{!"0xb\0035\003\0028", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!153 = !MDLocation(line: 37, column: 18, scope: !154)
!154 = !{!"0xb\0036\005\0031", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!155 = !{!"0xb\0036\005\0030", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!156 = !{!"0xb\0035\003\0029", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!157 = !MDLocation(line: 36, column: 5, scope: !155)
!158 = !MDLocation(line: 37, column: 32, scope: !154)
!159 = !MDLocation(line: 37, column: 17, scope: !154)
!160 = !MDLocation(line: 37, column: 7, scope: !154)
!161 = !MDLocation(line: 40, column: 18, scope: !162)
!162 = !{!"0xb\0039\005\0035", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!163 = !{!"0xb\0039\005\0034", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!164 = !{!"0xb\0038\003\0033", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!165 = !{!"0xb\0038\003\0032", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!166 = !MDLocation(line: 39, column: 5, scope: !163)
!167 = !MDLocation(line: 40, column: 32, scope: !162)
!168 = !MDLocation(line: 40, column: 17, scope: !162)
!169 = !MDLocation(line: 40, column: 7, scope: !162)
!170 = !MDLocation(line: 38, column: 3, scope: !165)
!171 = !MDLocation(line: 43, column: 18, scope: !172)
!172 = !{!"0xb\0042\005\0039", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!173 = !{!"0xb\0042\005\0038", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!174 = !{!"0xb\0041\003\0037", !1, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!175 = !{!"0xb\0041\003\0036", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!176 = !MDLocation(line: 42, column: 5, scope: !173)
!177 = !MDLocation(line: 43, column: 33, scope: !172)
!178 = !MDLocation(line: 43, column: 32, scope: !172)
!179 = !MDLocation(line: 43, column: 17, scope: !172)
!180 = !MDLocation(line: 43, column: 7, scope: !172)
!181 = !MDLocation(line: 41, column: 3, scope: !175)
!182 = !MDLocation(line: 46, column: 18, scope: !183)
!183 = !{!"0xb\0045\005\0043", !1, !184}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!184 = !{!"0xb\0045\005\0042", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!185 = !{!"0xb\0044\003\0041", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!186 = !{!"0xb\0044\003\0040", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!187 = !MDLocation(line: 45, column: 5, scope: !184)
!188 = !MDLocation(line: 46, column: 33, scope: !183)
!189 = !MDLocation(line: 46, column: 32, scope: !183)
!190 = !MDLocation(line: 46, column: 17, scope: !183)
!191 = !MDLocation(line: 46, column: 7, scope: !183)
!192 = !MDLocation(line: 44, column: 3, scope: !186)
!193 = !MDLocation(line: 47, column: 1, scope: !80)
!194 = !MDLocation(line: 70, column: 21, scope: !62)
!195 = !MDLocation(line: 70, column: 29, scope: !62)
!196 = !MDLocation(line: 70, column: 37, scope: !62)
!197 = !MDLocation(line: 70, column: 45, scope: !62)
!198 = !MDLocation(line: 79, column: 7, scope: !62)
!199 = !MDLocation(line: 83, column: 3, scope: !200)
!200 = !{!"0xb\0083\003\0014", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!201 = !MDLocation(line: 84, column: 5, scope: !202)
!202 = !{!"0xb\0084\005\0016", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!203 = !{!"0xb\0083\003\0015", !1, !200}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!204 = !MDLocation(line: 86, column: 2, scope: !205)
!205 = !{!"0xb\0085\007\0018", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!206 = !{!"0xb\0084\005\0017", !1, !202}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!207 = !MDLocation(line: 79, column: 13, scope: !62)
!208 = !MDLocation(line: 87, column: 2, scope: !209)
!209 = !{!"0xb\0087\002\0019", !1, !205}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!210 = !MDLocation(line: 88, column: 25, scope: !211)
!211 = !{!"0xb\0087\002\0020", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!212 = !MDLocation(line: 88, column: 17, scope: !211)
!213 = !MDLocation(line: 88, column: 35, scope: !211)
!214 = !MDLocation(line: 88, column: 4, scope: !211)
!215 = !MDLocation(line: 91, column: 5, scope: !216)
!216 = !{!"0xb\0091\005\0023", !1, !217}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!217 = !{!"0xb\0090\003\0022", !1, !218}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!218 = !{!"0xb\0090\003\0021", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!219 = !MDLocation(line: 93, column: 2, scope: !220)
!220 = !{!"0xb\0092\007\0025", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!221 = !{!"0xb\0091\005\0024", !1, !216}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!222 = !MDLocation(line: 94, column: 2, scope: !223)
!223 = !{!"0xb\0094\002\0026", !1, !220}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!224 = !MDLocation(line: 95, column: 15, scope: !225)
!225 = !{!"0xb\0094\002\0027", !1, !223}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!226 = !MDLocation(line: 95, column: 27, scope: !225)
!227 = !MDLocation(line: 95, column: 4, scope: !225)
!228 = !MDLocation(line: 90, column: 3, scope: !218)
!229 = !MDLocation(line: 99, column: 1, scope: !62)
!230 = !MDLocation(line: 53, column: 22, scope: !50)
!231 = !MDLocation(line: 53, column: 30, scope: !50)
!232 = !MDLocation(line: 56, column: 7, scope: !50)
!233 = !MDLocation(line: 58, column: 3, scope: !234)
!234 = !{!"0xb\0058\003\008", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!235 = !MDLocation(line: 61, column: 7, scope: !236)
!236 = !{!"0xb\0061\006\0013", !1, !237}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!237 = !{!"0xb\0059\0030\0012", !1, !238}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!238 = !{!"0xb\0059\005\0011", !1, !239}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!239 = !{!"0xb\0059\005\0010", !1, !240}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!240 = !{!"0xb\0058\003\009", !1, !234}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!241 = !MDLocation(line: 59, column: 5, scope: !239)
!242 = !MDLocation(line: 60, column: 11, scope: !237)
!243 = !MDLocation(line: 60, column: 41, scope: !237)
!244 = !MDLocation(line: 60, column: 2, scope: !237)
!245 = !MDLocation(line: 61, column: 6, scope: !236)
!246 = !MDLocation(line: 61, column: 6, scope: !237)
!247 = !MDLocation(line: 61, column: 39, scope: !248)
!248 = !{!"0xb\001", !1, !236}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!249 = !MDLocation(line: 61, column: 30, scope: !236)
!250 = !MDLocation(line: 63, column: 12, scope: !50)
!251 = !MDLocation(line: 63, column: 3, scope: !50)
!252 = !MDLocation(line: 64, column: 1, scope: !50)
