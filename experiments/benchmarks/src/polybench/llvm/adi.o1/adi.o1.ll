; ModuleID = 'adi.c'
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
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !80), !dbg !81
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !80), !dbg !82
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !80), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !33, metadata !80), !dbg !84
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !85
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !86
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !87
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !88
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !89
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !90
  tail call fastcc void @init_array([1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !91
  tail call fastcc void @kernel_adi([1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4), !dbg !92
  %cmp = icmp sgt i32 %argc, 42, !dbg !93
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !94

if.end44:                                         ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !80), !dbg !95
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !41, metadata !80), !dbg !96
  %0 = load i8** %argv, align 8, !dbg !97, !tbaa !99
  %1 = load i8* %0, align 1, !dbg !97, !tbaa !103
  %phitmp = icmp eq i8 %1, 0, !dbg !95
  br i1 %phitmp, label %if.then49, label %if.end51, !dbg !94

if.then49:                                        ; preds = %if.end44
  tail call fastcc void @print_array([1024 x double]* %arraydecay), !dbg !104
  br label %if.end51, !dbg !104

if.end51:                                         ; preds = %if.end44, %if.then49, %entry
  tail call void @free(i8* %call) #4, !dbg !106
  tail call void @free(i8* %call1) #4, !dbg !107
  tail call void @free(i8* %call2) #4, !dbg !108
  ret i32 0, !dbg !109
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind uwtable
define internal fastcc void @init_array([1024 x double]* nocapture %X, [1024 x double]* nocapture %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !71, metadata !80), !dbg !110
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !80), !dbg !111
  br label %for.cond1.preheader, !dbg !112

for.cond1.preheader:                              ; preds = %for.inc31, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc31 ]
  %0 = trunc i64 %indvars.iv5 to i32, !dbg !114
  %conv = sitofp i32 %0 to double, !dbg !114
  br label %for.body3, !dbg !119

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !119
  %1 = trunc i64 %indvars.iv.next to i32, !dbg !120
  %conv4 = sitofp i32 %1 to double, !dbg !120
  %mul = fmul double %conv, %conv4, !dbg !114
  %add5 = fadd double %mul, 1.000000e+00, !dbg !114
  %div = fmul double %add5, 9.765625e-04, !dbg !121
  %arrayidx8 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv5, i64 %indvars.iv, !dbg !122
  store double %div, double* %arrayidx8, align 8, !dbg !122, !tbaa !123
  %2 = add nuw nsw i64 %indvars.iv, 2, !dbg !125
  %3 = trunc i64 %2 to i32, !dbg !126
  %conv11 = sitofp i32 %3 to double, !dbg !126
  %mul12 = fmul double %conv, %conv11, !dbg !127
  %add13 = fadd double %mul12, 2.000000e+00, !dbg !127
  %div15 = fmul double %add13, 9.765625e-04, !dbg !128
  %arrayidx19 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv, !dbg !129
  store double %div15, double* %arrayidx19, align 8, !dbg !129, !tbaa !123
  %4 = add nuw nsw i64 %indvars.iv, 3, !dbg !130
  %5 = trunc i64 %4 to i32, !dbg !131
  %conv22 = sitofp i32 %5 to double, !dbg !131
  %mul23 = fmul double %conv, %conv22, !dbg !132
  %add24 = fadd double %mul23, 3.000000e+00, !dbg !132
  %div26 = fmul double %add24, 9.765625e-04, !dbg !133
  %arrayidx30 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv5, i64 %indvars.iv, !dbg !134
  store double %div26, double* %arrayidx30, align 8, !dbg !134, !tbaa !123
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !119
  br i1 %exitcond, label %for.inc31, label %for.body3, !dbg !119

for.inc31:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !112
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1024, !dbg !112
  br i1 %exitcond7, label %for.end33, label %for.cond1.preheader, !dbg !112

for.end33:                                        ; preds = %for.inc31
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define internal fastcc void @kernel_adi([1024 x double]* nocapture %X, [1024 x double]* nocapture readonly %A, [1024 x double]* nocapture %B) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !59, metadata !80), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !60, metadata !80), !dbg !137
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !64, metadata !80), !dbg !138
  br label %for.cond1.preheader, !dbg !139

for.cond1.preheader:                              ; preds = %for.inc252, %entry
  %t.011 = phi i32 [ 0, %entry ], [ %inc253, %for.inc252 ]
  br label %for.cond4.preheader, !dbg !141

for.cond4.preheader:                              ; preds = %for.inc51, %for.cond1.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next14, %for.inc51 ]
  br label %for.body6, !dbg !145

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv13, i64 %indvars.iv, !dbg !148
  %0 = load double* %arrayidx8, align 8, !dbg !148, !tbaa !123
  %1 = add nsw i64 %indvars.iv, -1, !dbg !151
  %arrayidx12 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv13, i64 %1, !dbg !152
  %2 = load double* %arrayidx12, align 8, !dbg !152, !tbaa !123
  %arrayidx16 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv, !dbg !153
  %3 = load double* %arrayidx16, align 8, !dbg !153, !tbaa !123
  %mul = fmul double %2, %3, !dbg !152
  %arrayidx21 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv13, i64 %1, !dbg !154
  %4 = load double* %arrayidx21, align 8, !dbg !154, !tbaa !123
  %div = fdiv double %mul, %4, !dbg !152
  %sub22 = fsub double %0, %div, !dbg !148
  store double %sub22, double* %arrayidx8, align 8, !dbg !155, !tbaa !123
  %arrayidx30 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv13, i64 %indvars.iv, !dbg !156
  %5 = load double* %arrayidx30, align 8, !dbg !156, !tbaa !123
  %6 = load double* %arrayidx16, align 8, !dbg !157, !tbaa !123
  %mul39 = fmul double %6, %6, !dbg !157
  %7 = load double* %arrayidx21, align 8, !dbg !158, !tbaa !123
  %div45 = fdiv double %mul39, %7, !dbg !157
  %sub46 = fsub double %5, %div45, !dbg !156
  store double %sub46, double* %arrayidx30, align 8, !dbg !159, !tbaa !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !145
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !145
  br i1 %exitcond, label %for.inc51, label %for.body6, !dbg !145

for.inc51:                                        ; preds = %for.body6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !141
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1024, !dbg !141
  br i1 %exitcond15, label %for.body56, label %for.cond4.preheader, !dbg !141

for.body56:                                       ; preds = %for.inc51, %for.body56
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.body56 ], [ 0, %for.inc51 ]
  %arrayidx61 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv16, i64 1023, !dbg !160
  %8 = load double* %arrayidx61, align 8, !dbg !160, !tbaa !123
  %arrayidx66 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv16, i64 1023, !dbg !163
  %9 = load double* %arrayidx66, align 8, !dbg !163, !tbaa !123
  %div67 = fdiv double %8, %9, !dbg !160
  store double %div67, double* %arrayidx61, align 8, !dbg !164, !tbaa !123
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !165
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1024, !dbg !165
  br i1 %exitcond18, label %for.cond79.preheader, label %for.body56, !dbg !165

for.cond79.preheader:                             ; preds = %for.body56, %for.inc120
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc120 ], [ 0, %for.body56 ]
  br label %for.body82, !dbg !166

for.body82:                                       ; preds = %for.body82, %for.cond79.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond79.preheader ], [ %indvars.iv.next20, %for.body82 ]
  %10 = sub nsw i64 1022, %indvars.iv19, !dbg !170
  %arrayidx88 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv28, i64 %10, !dbg !172
  %11 = load double* %arrayidx88, align 8, !dbg !172, !tbaa !123
  %12 = add nsw i64 %10, -1, !dbg !173
  %arrayidx95 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv28, i64 %12, !dbg !174
  %13 = load double* %arrayidx95, align 8, !dbg !174, !tbaa !123
  %14 = sub nsw i64 1024, %indvars.iv19, !dbg !175
  %15 = add nsw i64 %14, -3, !dbg !175
  %arrayidx101 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv28, i64 %15, !dbg !176
  %16 = load double* %arrayidx101, align 8, !dbg !176, !tbaa !123
  %mul102 = fmul double %13, %16, !dbg !174
  %sub103 = fsub double %11, %mul102, !dbg !172
  %17 = sub nsw i64 1021, %indvars.iv19, !dbg !177
  %arrayidx109 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv28, i64 %17, !dbg !178
  %18 = load double* %arrayidx109, align 8, !dbg !178, !tbaa !123
  %div110 = fdiv double %sub103, %18, !dbg !179
  %19 = add nsw i64 %14, -2, !dbg !180
  %arrayidx116 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv28, i64 %19, !dbg !181
  store double %div110, double* %arrayidx116, align 8, !dbg !181, !tbaa !123
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !166
  %exitcond27 = icmp eq i64 %indvars.iv.next20, 1022, !dbg !166
  br i1 %exitcond27, label %for.inc120, label %for.body82, !dbg !166

for.inc120:                                       ; preds = %for.body82
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !182
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1024, !dbg !182
  br i1 %exitcond30, label %for.cond126.preheader, label %for.cond79.preheader, !dbg !182

for.cond126.preheader:                            ; preds = %for.inc120, %for.inc181
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc181 ], [ 1, %for.inc120 ]
  %20 = add nsw i64 %indvars.iv34, -1, !dbg !183
  br label %for.body128, !dbg !189

for.body128:                                      ; preds = %for.body128, %for.cond126.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond126.preheader ], [ %indvars.iv.next32, %for.body128 ]
  %arrayidx132 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv34, i64 %indvars.iv31, !dbg !190
  %21 = load double* %arrayidx132, align 8, !dbg !190, !tbaa !123
  %arrayidx137 = getelementptr inbounds [1024 x double]* %X, i64 %20, i64 %indvars.iv31, !dbg !191
  %22 = load double* %arrayidx137, align 8, !dbg !191, !tbaa !123
  %arrayidx141 = getelementptr inbounds [1024 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv31, !dbg !192
  %23 = load double* %arrayidx141, align 8, !dbg !192, !tbaa !123
  %mul142 = fmul double %22, %23, !dbg !191
  %arrayidx147 = getelementptr inbounds [1024 x double]* %B, i64 %20, i64 %indvars.iv31, !dbg !193
  %24 = load double* %arrayidx147, align 8, !dbg !193, !tbaa !123
  %div148 = fdiv double %mul142, %24, !dbg !191
  %sub149 = fsub double %21, %div148, !dbg !190
  store double %sub149, double* %arrayidx132, align 8, !dbg !194, !tbaa !123
  %arrayidx157 = getelementptr inbounds [1024 x double]* %B, i64 %indvars.iv34, i64 %indvars.iv31, !dbg !195
  %25 = load double* %arrayidx157, align 8, !dbg !195, !tbaa !123
  %26 = load double* %arrayidx141, align 8, !dbg !196, !tbaa !123
  %mul166 = fmul double %26, %26, !dbg !196
  %27 = load double* %arrayidx147, align 8, !dbg !197, !tbaa !123
  %div172 = fdiv double %mul166, %27, !dbg !196
  %sub173 = fsub double %25, %div172, !dbg !195
  store double %sub173, double* %arrayidx157, align 8, !dbg !198, !tbaa !123
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !189
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1024, !dbg !189
  br i1 %exitcond33, label %for.inc181, label %for.body128, !dbg !189

for.inc181:                                       ; preds = %for.body128
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !80), !dbg !200
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 1024, !dbg !199
  br i1 %exitcond37, label %for.body186, label %for.cond126.preheader, !dbg !199

for.body186:                                      ; preds = %for.inc181, %for.body186
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.body186 ], [ 0, %for.inc181 ]
  %arrayidx191 = getelementptr inbounds [1024 x double]* %X, i64 1023, i64 %indvars.iv38, !dbg !201
  %28 = load double* %arrayidx191, align 8, !dbg !201, !tbaa !123
  %arrayidx196 = getelementptr inbounds [1024 x double]* %B, i64 1023, i64 %indvars.iv38, !dbg !204
  %29 = load double* %arrayidx196, align 8, !dbg !204, !tbaa !123
  %div197 = fdiv double %28, %29, !dbg !201
  store double %div197, double* %arrayidx191, align 8, !dbg !205, !tbaa !123
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !206
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1024, !dbg !206
  br i1 %exitcond40, label %for.cond210.preheader, label %for.body186, !dbg !206

for.cond210.preheader:                            ; preds = %for.body186, %for.inc249
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc249 ], [ 0, %for.body186 ]
  %30 = sub nsw i64 1022, %indvars.iv44, !dbg !207
  %31 = sub i64 1021, %indvars.iv44, !dbg !212
  %32 = sub nsw i64 1021, %indvars.iv44, !dbg !213
  br label %for.body212, !dbg !214

for.body212:                                      ; preds = %for.body212, %for.cond210.preheader
  %indvars.iv41 = phi i64 [ 0, %for.cond210.preheader ], [ %indvars.iv.next42, %for.body212 ]
  %arrayidx218 = getelementptr inbounds [1024 x double]* %X, i64 %30, i64 %indvars.iv41, !dbg !215
  %33 = load double* %arrayidx218, align 8, !dbg !215, !tbaa !123
  %arrayidx224 = getelementptr inbounds [1024 x double]* %X, i64 %31, i64 %indvars.iv41, !dbg !216
  %34 = load double* %arrayidx224, align 8, !dbg !216, !tbaa !123
  %arrayidx230 = getelementptr inbounds [1024 x double]* %A, i64 %32, i64 %indvars.iv41, !dbg !217
  %35 = load double* %arrayidx230, align 8, !dbg !217, !tbaa !123
  %mul231 = fmul double %34, %35, !dbg !216
  %sub232 = fsub double %33, %mul231, !dbg !215
  %arrayidx238 = getelementptr inbounds [1024 x double]* %B, i64 %30, i64 %indvars.iv41, !dbg !218
  %36 = load double* %arrayidx238, align 8, !dbg !218, !tbaa !123
  %div239 = fdiv double %sub232, %36, !dbg !219
  store double %div239, double* %arrayidx218, align 8, !dbg !220, !tbaa !123
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !214
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 1024, !dbg !214
  br i1 %exitcond43, label %for.inc249, label %for.body212, !dbg !214

for.inc249:                                       ; preds = %for.body212
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1, !dbg !221
  %exitcond49 = icmp eq i64 %indvars.iv.next45, 1022, !dbg !221
  br i1 %exitcond49, label %for.inc252, label %for.cond210.preheader, !dbg !221

for.inc252:                                       ; preds = %for.inc249
  %inc253 = add nuw nsw i32 %t.011, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata i32 %inc253, i64 0, metadata !64, metadata !80), !dbg !138
  %exitcond50 = icmp eq i32 %inc253, 50, !dbg !139
  br i1 %exitcond50, label %for.end254, label %for.cond1.preheader, !dbg !139

for.end254:                                       ; preds = %for.inc252
  ret void, !dbg !223
}

; Function Attrs: nounwind uwtable
define internal fastcc void @print_array([1024 x double]* nocapture readonly %X) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !51, metadata !80), !dbg !224
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !53, metadata !80), !dbg !225
  br label %for.cond1.preheader, !dbg !226

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc8 ]
  %0 = shl i64 %indvars.iv7, 10, !dbg !228
  br label %for.body3, !dbg !234

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = load %struct._IO_FILE** @stderr, align 8, !dbg !235, !tbaa !99
  %arrayidx5 = getelementptr inbounds [1024 x double]* %X, i64 %indvars.iv7, i64 %indvars.iv, !dbg !236
  %2 = load double* %arrayidx5, align 8, !dbg !236, !tbaa !123
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %2) #5, !dbg !237
  %3 = add nuw nsw i64 %indvars.iv, %0, !dbg !228
  %4 = trunc i64 %3 to i32, !dbg !238
  %rem = srem i32 %4, 20, !dbg !238
  %cmp6 = icmp eq i32 %rem, 0, !dbg !238
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !239

if.then:                                          ; preds = %for.body3
  %5 = load %struct._IO_FILE** @stderr, align 8, !dbg !240, !tbaa !99
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6, !dbg !242
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !234
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !234
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !234

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !226
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1024, !dbg !226
  br i1 %exitcond10, label %for.end10, label %for.cond1.preheader, !dbg !226

for.end10:                                        ; preds = %for.inc8
  %6 = load %struct._IO_FILE** @stderr, align 8, !dbg !243, !tbaa !99
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6, !dbg !244
  ret void, !dbg !245
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
!llvm.module.flags = !{!77, !78}
!llvm.ident = !{!79}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c] [DW_LANG_C99]
!1 = !{!"adi.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi"}
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
!21 = !{!22, !44, !55, !67}
!22 = !{!"0x2e\00main\00main\00\00104\000\001\000\000\00256\001\00105", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 105] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !40, !41, !43}
!30 = !{!"0x101\00argc\0016777320\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 104]
!31 = !{!"0x101\00argv\0033554536\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 104]
!32 = !{!"0x100\00n\00107\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [n] [line 107]
!33 = !{!"0x100\00tsteps\00108\000", !22, !23, !26} ; [ DW_TAG_auto_variable ] [tsteps] [line 108]
!34 = !{!"0x100\00X\00111\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [X] [line 111]
!35 = !{!"0x100\00A\00112\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 112]
!36 = !{!"0x100\00B\00113\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 113]
!37 = !{!"0x100\00__s1_len\00132\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 132]
!38 = !{!"0xb\00132\003\001", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!39 = !{!"0xb\00132\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!40 = !{!"0x100\00__s2_len\00132\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 132]
!41 = !{!"0x100\00__s2\00132\000", !42, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 132]
!42 = !{!"0xb\00132\003\002", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!43 = !{!"0x100\00__result\00132\000", !42, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 132]
!44 = !{!"0x2e\00print_array\00print_array\00\0043\001\001\000\000\00256\001\0046", !1, !23, !45, null, void ([1024 x double]*)* @print_array, null, null, !50} ; [ DW_TAG_subprogram ] [line 43] [local] [def] [scope 46] [print_array]
!45 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !46, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = !{null, !26, !47}
!47 = !{!"0xf\00\000\0064\0064\000\000", null, null, !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!48 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!49 = !{!8}
!50 = !{!51, !52, !53, !54}
!51 = !{!"0x101\00n\0016777259\000", !44, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 43]
!52 = !{!"0x101\00X\0033554476\000", !44, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 44]
!53 = !{!"0x100\00i\0047\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 47]
!54 = !{!"0x100\00j\0047\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 47]
!55 = !{!"0x2e\00kernel_adi\00kernel_adi\00\0061\001\001\000\000\00256\001\0066", !1, !23, !56, null, void ([1024 x double]*, [1024 x double]*, [1024 x double]*)* @kernel_adi, null, null, !58} ; [ DW_TAG_subprogram ] [line 61] [local] [def] [scope 66] [kernel_adi]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{null, !26, !26, !47, !47, !47}
!58 = !{!59, !60, !61, !62, !63, !64, !65, !66}
!59 = !{!"0x101\00tsteps\0016777277\000", !55, !23, !26} ; [ DW_TAG_arg_variable ] [tsteps] [line 61]
!60 = !{!"0x101\00n\0033554494\000", !55, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 62]
!61 = !{!"0x101\00X\0050331711\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 63]
!62 = !{!"0x101\00A\0067108928\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 64]
!63 = !{!"0x101\00B\0083886145\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [B] [line 65]
!64 = !{!"0x100\00t\0067\000", !55, !23, !26}     ; [ DW_TAG_auto_variable ] [t] [line 67]
!65 = !{!"0x100\00i1\0067\000", !55, !23, !26}    ; [ DW_TAG_auto_variable ] [i1] [line 67]
!66 = !{!"0x100\00i2\0067\000", !55, !23, !26}    ; [ DW_TAG_auto_variable ] [i2] [line 67]
!67 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !23, !68, null, void ([1024 x double]*, [1024 x double]*, [1024 x double]*)* @init_array, null, null, !70} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!68 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !69, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = !{null, !26, !47, !47, !47}
!70 = !{!71, !72, !73, !74, !75, !76}
!71 = !{!"0x101\00n\0016777239\000", !67, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!72 = !{!"0x101\00X\0033554456\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 24]
!73 = !{!"0x101\00A\0050331673\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 25]
!74 = !{!"0x101\00B\0067108890\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [B] [line 26]
!75 = !{!"0x100\00i\0028\000", !67, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!76 = !{!"0x100\00j\0028\000", !67, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!77 = !{i32 2, !"Dwarf Version", i32 4}
!78 = !{i32 2, !"Debug Info Version", i32 2}
!79 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!80 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!81 = !MDLocation(line: 104, column: 14, scope: !22)
!82 = !MDLocation(line: 104, column: 27, scope: !22)
!83 = !MDLocation(line: 107, column: 7, scope: !22)
!84 = !MDLocation(line: 108, column: 7, scope: !22)
!85 = !MDLocation(line: 111, column: 3, scope: !22)
!86 = !MDLocation(line: 112, column: 3, scope: !22)
!87 = !MDLocation(line: 113, column: 3, scope: !22)
!88 = !MDLocation(line: 117, column: 18, scope: !22)
!89 = !MDLocation(line: 117, column: 38, scope: !22)
!90 = !MDLocation(line: 117, column: 58, scope: !22)
!91 = !MDLocation(line: 117, column: 3, scope: !22)
!92 = !MDLocation(line: 123, column: 3, scope: !22)
!93 = !MDLocation(line: 132, column: 3, scope: !39)
!94 = !MDLocation(line: 132, column: 3, scope: !22)
!95 = !MDLocation(line: 132, column: 3, scope: !38)
!96 = !MDLocation(line: 132, column: 3, scope: !42)
!97 = !MDLocation(line: 132, column: 3, scope: !98)
!98 = !{!"0xb\004", !1, !42}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!99 = !{!100, !100, i64 0}
!100 = !{!"any pointer", !101, i64 0}
!101 = !{!"omnipotent char", !102, i64 0}
!102 = !{!"Simple C/C++ TBAA"}
!103 = !{!101, !101, i64 0}
!104 = !MDLocation(line: 132, column: 3, scope: !105)
!105 = !{!"0xb\0023", !1, !39}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!106 = !MDLocation(line: 135, column: 3, scope: !22)
!107 = !MDLocation(line: 136, column: 3, scope: !22)
!108 = !MDLocation(line: 137, column: 3, scope: !22)
!109 = !MDLocation(line: 139, column: 3, scope: !22)
!110 = !MDLocation(line: 23, column: 22, scope: !67)
!111 = !MDLocation(line: 28, column: 7, scope: !67)
!112 = !MDLocation(line: 30, column: 3, scope: !113)
!113 = !{!"0xb\0030\003\0039", !1, !67}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!114 = !MDLocation(line: 33, column: 13, scope: !115)
!115 = !{!"0xb\0032\007\0043", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!116 = !{!"0xb\0031\005\0042", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!117 = !{!"0xb\0031\005\0041", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!118 = !{!"0xb\0030\003\0040", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!119 = !MDLocation(line: 31, column: 5, scope: !117)
!120 = !MDLocation(line: 33, column: 27, scope: !115)
!121 = !MDLocation(line: 33, column: 12, scope: !115)
!122 = !MDLocation(line: 33, column: 2, scope: !115)
!123 = !{!124, !124, i64 0}
!124 = !{!"double", !101, i64 0}
!125 = !MDLocation(line: 34, column: 28, scope: !115)
!126 = !MDLocation(line: 34, column: 27, scope: !115)
!127 = !MDLocation(line: 34, column: 13, scope: !115)
!128 = !MDLocation(line: 34, column: 12, scope: !115)
!129 = !MDLocation(line: 34, column: 2, scope: !115)
!130 = !MDLocation(line: 35, column: 28, scope: !115)
!131 = !MDLocation(line: 35, column: 27, scope: !115)
!132 = !MDLocation(line: 35, column: 13, scope: !115)
!133 = !MDLocation(line: 35, column: 12, scope: !115)
!134 = !MDLocation(line: 35, column: 2, scope: !115)
!135 = !MDLocation(line: 37, column: 1, scope: !67)
!136 = !MDLocation(line: 61, column: 21, scope: !55)
!137 = !MDLocation(line: 62, column: 7, scope: !55)
!138 = !MDLocation(line: 67, column: 7, scope: !55)
!139 = !MDLocation(line: 70, column: 3, scope: !140)
!140 = !{!"0xb\0070\003\0014", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!141 = !MDLocation(line: 72, column: 7, scope: !142)
!142 = !{!"0xb\0072\007\0017", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!143 = !{!"0xb\0071\005\0016", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!144 = !{!"0xb\0070\003\0015", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!145 = !MDLocation(line: 73, column: 2, scope: !146)
!146 = !{!"0xb\0073\002\0019", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!147 = !{!"0xb\0072\007\0018", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!148 = !MDLocation(line: 75, column: 18, scope: !149)
!149 = !{!"0xb\0074\004\0021", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!150 = !{!"0xb\0073\002\0020", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!151 = !MDLocation(line: 75, column: 36, scope: !149)
!152 = !MDLocation(line: 75, column: 30, scope: !149)
!153 = !MDLocation(line: 75, column: 44, scope: !149)
!154 = !MDLocation(line: 75, column: 56, scope: !149)
!155 = !MDLocation(line: 75, column: 6, scope: !149)
!156 = !MDLocation(line: 76, column: 18, scope: !149)
!157 = !MDLocation(line: 76, column: 30, scope: !149)
!158 = !MDLocation(line: 76, column: 54, scope: !149)
!159 = !MDLocation(line: 76, column: 6, scope: !149)
!160 = !MDLocation(line: 80, column: 15, scope: !161)
!161 = !{!"0xb\0079\007\0023", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!162 = !{!"0xb\0079\007\0022", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!163 = !MDLocation(line: 80, column: 28, scope: !161)
!164 = !MDLocation(line: 80, column: 2, scope: !161)
!165 = !MDLocation(line: 79, column: 7, scope: !162)
!166 = !MDLocation(line: 83, column: 2, scope: !167)
!167 = !{!"0xb\0083\002\0026", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!168 = !{!"0xb\0082\007\0025", !1, !169}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!169 = !{!"0xb\0082\007\0024", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!170 = !MDLocation(line: 84, column: 27, scope: !171)
!171 = !{!"0xb\0083\002\0027", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!172 = !MDLocation(line: 84, column: 21, scope: !171)
!173 = !MDLocation(line: 84, column: 43, scope: !171)
!174 = !MDLocation(line: 84, column: 37, scope: !171)
!175 = !MDLocation(line: 84, column: 61, scope: !171)
!176 = !MDLocation(line: 84, column: 55, scope: !171)
!177 = !MDLocation(line: 84, column: 78, scope: !171)
!178 = !MDLocation(line: 84, column: 72, scope: !171)
!179 = !MDLocation(line: 84, column: 20, scope: !171)
!180 = !MDLocation(line: 84, column: 10, scope: !171)
!181 = !MDLocation(line: 84, column: 4, scope: !171)
!182 = !MDLocation(line: 82, column: 7, scope: !169)
!183 = !MDLocation(line: 88, column: 30, scope: !184)
!184 = !{!"0xb\0087\0029\0032", !1, !185}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!185 = !{!"0xb\0087\002\0031", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!186 = !{!"0xb\0087\002\0030", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!187 = !{!"0xb\0086\007\0029", !1, !188}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!188 = !{!"0xb\0086\007\0028", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!189 = !MDLocation(line: 87, column: 2, scope: !186)
!190 = !MDLocation(line: 88, column: 16, scope: !184)
!191 = !MDLocation(line: 88, column: 28, scope: !184)
!192 = !MDLocation(line: 88, column: 42, scope: !184)
!193 = !MDLocation(line: 88, column: 54, scope: !184)
!194 = !MDLocation(line: 88, column: 4, scope: !184)
!195 = !MDLocation(line: 89, column: 16, scope: !184)
!196 = !MDLocation(line: 89, column: 28, scope: !184)
!197 = !MDLocation(line: 89, column: 52, scope: !184)
!198 = !MDLocation(line: 89, column: 4, scope: !184)
!199 = !MDLocation(line: 86, column: 7, scope: !188)
!200 = !MDLocation(line: 67, column: 14, scope: !55)
!201 = !MDLocation(line: 93, column: 15, scope: !202)
!202 = !{!"0xb\0092\007\0034", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!203 = !{!"0xb\0092\007\0033", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!204 = !MDLocation(line: 93, column: 28, scope: !202)
!205 = !MDLocation(line: 93, column: 2, scope: !202)
!206 = !MDLocation(line: 92, column: 7, scope: !203)
!207 = !MDLocation(line: 97, column: 23, scope: !208)
!208 = !{!"0xb\0096\002\0038", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!209 = !{!"0xb\0096\002\0037", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!210 = !{!"0xb\0095\007\0036", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!211 = !{!"0xb\0095\007\0035", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!212 = !MDLocation(line: 97, column: 39, scope: !208)
!213 = !MDLocation(line: 97, column: 55, scope: !208)
!214 = !MDLocation(line: 96, column: 2, scope: !209)
!215 = !MDLocation(line: 97, column: 21, scope: !208)
!216 = !MDLocation(line: 97, column: 37, scope: !208)
!217 = !MDLocation(line: 97, column: 53, scope: !208)
!218 = !MDLocation(line: 97, column: 70, scope: !208)
!219 = !MDLocation(line: 97, column: 20, scope: !208)
!220 = !MDLocation(line: 97, column: 4, scope: !208)
!221 = !MDLocation(line: 95, column: 7, scope: !211)
!222 = !MDLocation(line: 70, column: 27, scope: !144)
!223 = !MDLocation(line: 101, column: 1, scope: !55)
!224 = !MDLocation(line: 43, column: 22, scope: !44)
!225 = !MDLocation(line: 47, column: 7, scope: !44)
!226 = !MDLocation(line: 49, column: 3, scope: !227)
!227 = !{!"0xb\0049\003\008", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!228 = !MDLocation(line: 52, column: 12, scope: !229)
!229 = !{!"0xb\0052\0011\0013", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!230 = !{!"0xb\0050\0029\0012", !1, !231}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!231 = !{!"0xb\0050\005\0011", !1, !232}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!232 = !{!"0xb\0050\005\0010", !1, !233}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!233 = !{!"0xb\0049\003\009", !1, !227}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!234 = !MDLocation(line: 50, column: 5, scope: !232)
!235 = !MDLocation(line: 51, column: 15, scope: !230)
!236 = !MDLocation(line: 51, column: 45, scope: !230)
!237 = !MDLocation(line: 51, column: 7, scope: !230)
!238 = !MDLocation(line: 52, column: 11, scope: !229)
!239 = !MDLocation(line: 52, column: 11, scope: !230)
!240 = !MDLocation(line: 52, column: 42, scope: !241)
!241 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!242 = !MDLocation(line: 52, column: 34, scope: !229)
!243 = !MDLocation(line: 54, column: 11, scope: !44)
!244 = !MDLocation(line: 54, column: 3, scope: !44)
!245 = !MDLocation(line: 55, column: 1, scope: !44)
