; ModuleID = 'gemm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !92), !dbg !93
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !92), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !92), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !92), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !34, metadata !92), !dbg !97
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !98
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !99
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !100
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !101
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !102
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !103, metadata !92), !dbg !105
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !106, metadata !92), !dbg !107
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !108, metadata !92), !dbg !109
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !35, metadata !92), !dbg !110
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !35, metadata !92), !dbg !110
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !36, metadata !92), !dbg !111
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !36, metadata !92), !dbg !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !112, metadata !92), !dbg !113
  br label %for.cond1.preheader.i, !dbg !114

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %entry
  %indvars.iv19.i = phi i64 [ 0, %entry ], [ %indvars.iv.next20.i, %for.inc8.i ], !dbg !104
  %0 = trunc i64 %indvars.iv19.i to i32, !dbg !116
  %conv.i = sitofp i32 %0 to double, !dbg !116
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ], !dbg !104
  %induction94133 = or i64 %index, 1, !dbg !104
  %1 = trunc i64 %index to i32, !dbg !120
  %induction96134 = or i32 %1, 1, !dbg !120
  %2 = sitofp i32 %1 to double, !dbg !120
  %3 = sitofp i32 %induction96134 to double, !dbg !120
  %4 = fmul double %conv.i, %2, !dbg !116
  %5 = fmul double %conv.i, %3, !dbg !116
  %6 = fmul double %4, 9.765625e-04, !dbg !121
  %7 = fmul double %5, 9.765625e-04, !dbg !121
  %8 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %index, !dbg !122
  %9 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %induction94133, !dbg !122
  store double %6, double* %8, align 8, !dbg !122, !tbaa !123
  store double %7, double* %9, align 8, !dbg !122, !tbaa !123
  %index.next = add nuw nsw i64 %index, 2, !dbg !104
  %induction94133.1 = or i64 %index.next, 1, !dbg !104
  %10 = trunc i64 %index.next to i32, !dbg !120
  %induction96134.1 = or i32 %10, 1, !dbg !120
  %11 = sitofp i32 %10 to double, !dbg !120
  %12 = sitofp i32 %induction96134.1 to double, !dbg !120
  %13 = fmul double %conv.i, %11, !dbg !116
  %14 = fmul double %conv.i, %12, !dbg !116
  %15 = fmul double %13, 9.765625e-04, !dbg !121
  %16 = fmul double %14, 9.765625e-04, !dbg !121
  %17 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %index.next, !dbg !122
  %18 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %induction94133.1, !dbg !122
  store double %15, double* %17, align 8, !dbg !122, !tbaa !123
  store double %16, double* %18, align 8, !dbg !122, !tbaa !123
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !104
  %19 = icmp eq i64 %index.next.1, 1024, !dbg !104
  br i1 %19, label %for.inc8.i, label %vector.body, !dbg !104, !llvm.loop !127

for.inc8.i:                                       ; preds = %vector.body
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1, !dbg !114
  %exitcond21.i = icmp eq i64 %indvars.iv.next20.i, 1024, !dbg !114
  br i1 %exitcond21.i, label %for.cond15.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !114

for.cond15.preheader.i.preheader:                 ; preds = %for.inc8.i
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !130
  br label %for.cond15.preheader.i, !dbg !131

for.cond15.preheader.i:                           ; preds = %for.cond15.preheader.i.preheader, %for.inc31.i
  %indvars.iv13.i = phi i64 [ %indvars.iv.next14.i, %for.inc31.i ], [ 0, %for.cond15.preheader.i.preheader ], !dbg !104
  %20 = trunc i64 %indvars.iv13.i to i32, !dbg !131
  %conv19.i = sitofp i32 %20 to double, !dbg !131
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %for.cond15.preheader.i
  %index103 = phi i64 [ 0, %for.cond15.preheader.i ], [ %index.next110.1, %vector.body100 ], !dbg !104
  %induction112135 = or i64 %index103, 1, !dbg !104
  %21 = trunc i64 %index103 to i32, !dbg !136
  %induction114136 = or i32 %21, 1, !dbg !136
  %22 = sitofp i32 %21 to double, !dbg !136
  %23 = sitofp i32 %induction114136 to double, !dbg !136
  %24 = fmul double %conv19.i, %22, !dbg !131
  %25 = fmul double %conv19.i, %23, !dbg !131
  %26 = fmul double %24, 9.765625e-04, !dbg !137
  %27 = fmul double %25, 9.765625e-04, !dbg !137
  %28 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv13.i, i64 %index103, !dbg !138
  %29 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv13.i, i64 %induction112135, !dbg !138
  store double %26, double* %28, align 8, !dbg !138, !tbaa !123
  store double %27, double* %29, align 8, !dbg !138, !tbaa !123
  %index.next110 = add nuw nsw i64 %index103, 2, !dbg !104
  %induction112135.1 = or i64 %index.next110, 1, !dbg !104
  %30 = trunc i64 %index.next110 to i32, !dbg !136
  %induction114136.1 = or i32 %30, 1, !dbg !136
  %31 = sitofp i32 %30 to double, !dbg !136
  %32 = sitofp i32 %induction114136.1 to double, !dbg !136
  %33 = fmul double %conv19.i, %31, !dbg !131
  %34 = fmul double %conv19.i, %32, !dbg !131
  %35 = fmul double %33, 9.765625e-04, !dbg !137
  %36 = fmul double %34, 9.765625e-04, !dbg !137
  %37 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv13.i, i64 %index.next110, !dbg !138
  %38 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv13.i, i64 %induction112135.1, !dbg !138
  store double %35, double* %37, align 8, !dbg !138, !tbaa !123
  store double %36, double* %38, align 8, !dbg !138, !tbaa !123
  %index.next110.1 = add nuw nsw i64 %index.next110, 2, !dbg !104
  %39 = icmp eq i64 %index.next110.1, 1024, !dbg !104
  br i1 %39, label %for.inc31.i, label %vector.body100, !dbg !104, !llvm.loop !139

for.inc31.i:                                      ; preds = %vector.body100
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !140
  %exitcond15.i = icmp eq i64 %indvars.iv.next14.i, 1024, !dbg !140
  br i1 %exitcond15.i, label %for.cond38.preheader.i.preheader, label %for.cond15.preheader.i, !dbg !140

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  br label %for.cond38.preheader.i, !dbg !141

for.cond38.preheader.i:                           ; preds = %for.cond38.preheader.i.preheader, %for.inc54.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc54.i ], [ 0, %for.cond38.preheader.i.preheader ], !dbg !104
  %40 = trunc i64 %indvars.iv7.i to i32, !dbg !141
  %conv42.i = sitofp i32 %40 to double, !dbg !141
  br label %vector.body118

vector.body118:                                   ; preds = %vector.body118, %for.cond38.preheader.i
  %index121 = phi i64 [ 0, %for.cond38.preheader.i ], [ %index.next128.1, %vector.body118 ], !dbg !104
  %induction130137 = or i64 %index121, 1, !dbg !104
  %41 = trunc i64 %index121 to i32, !dbg !146
  %induction132138 = or i32 %41, 1, !dbg !146
  %42 = sitofp i32 %41 to double, !dbg !146
  %43 = sitofp i32 %induction132138 to double, !dbg !146
  %44 = fmul double %conv42.i, %42, !dbg !141
  %45 = fmul double %conv42.i, %43, !dbg !141
  %46 = fmul double %44, 9.765625e-04, !dbg !147
  %47 = fmul double %45, 9.765625e-04, !dbg !147
  %48 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %index121, !dbg !148
  %49 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %induction130137, !dbg !148
  store double %46, double* %48, align 8, !dbg !148, !tbaa !123
  store double %47, double* %49, align 8, !dbg !148, !tbaa !123
  %index.next128 = add nuw nsw i64 %index121, 2, !dbg !104
  %induction130137.1 = or i64 %index.next128, 1, !dbg !104
  %50 = trunc i64 %index.next128 to i32, !dbg !146
  %induction132138.1 = or i32 %50, 1, !dbg !146
  %51 = sitofp i32 %50 to double, !dbg !146
  %52 = sitofp i32 %induction132138.1 to double, !dbg !146
  %53 = fmul double %conv42.i, %51, !dbg !141
  %54 = fmul double %conv42.i, %52, !dbg !141
  %55 = fmul double %53, 9.765625e-04, !dbg !147
  %56 = fmul double %54, 9.765625e-04, !dbg !147
  %57 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %index.next128, !dbg !148
  %58 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %induction130137.1, !dbg !148
  store double %55, double* %57, align 8, !dbg !148, !tbaa !123
  store double %56, double* %58, align 8, !dbg !148, !tbaa !123
  %index.next128.1 = add nuw nsw i64 %index.next128, 2, !dbg !104
  %59 = icmp eq i64 %index.next128.1, 1024, !dbg !104
  br i1 %59, label %for.inc54.i, label %vector.body118, !dbg !104, !llvm.loop !149

for.inc54.i:                                      ; preds = %vector.body118
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !150
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !150
  br i1 %exitcond9.i, label %for.cond1.preheader.i85.preheader, label %for.cond38.preheader.i, !dbg !150

for.cond1.preheader.i85.preheader:                ; preds = %for.inc54.i
  br label %for.cond1.preheader.i85, !dbg !151

for.cond1.preheader.i85:                          ; preds = %for.cond1.preheader.i85.preheader, %for.inc26.i
  %indvars.iv7.i84 = phi i64 [ %indvars.iv.next8.i92, %for.inc26.i ], [ 0, %for.cond1.preheader.i85.preheader ], !dbg !155
  br label %for.body3.i88, !dbg !151

for.body3.i88:                                    ; preds = %for.inc23.i, %for.cond1.preheader.i85
  %indvars.iv4.i = phi i64 [ 0, %for.cond1.preheader.i85 ], [ %indvars.iv.next5.i, %for.inc23.i ], !dbg !155
  %arrayidx5.i86 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i84, i64 %indvars.iv4.i, !dbg !156
  %60 = load double* %arrayidx5.i86, align 8, !dbg !156, !tbaa !123
  %mul.i87 = fmul double %60, 2.123000e+03, !dbg !156
  store double %mul.i87, double* %arrayidx5.i86, align 8, !dbg !156, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !159, metadata !92), !dbg !160
  br label %for.body8.i, !dbg !161

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i88
  %61 = phi double [ %mul.i87, %for.body3.i88 ], [ %add.i.1, %for.body8.i ], !dbg !163
  %indvars.iv.i89 = phi i64 [ 0, %for.body3.i88 ], [ %indvars.iv.next.i90.1, %for.body8.i ], !dbg !155
  %arrayidx12.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv7.i84, i64 %indvars.iv.i89, !dbg !163
  %62 = load double* %arrayidx12.i, align 8, !dbg !163, !tbaa !123
  %mul13.i = fmul double %62, 3.241200e+04, !dbg !165
  %arrayidx17.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv.i89, i64 %indvars.iv4.i, !dbg !166
  %63 = load double* %arrayidx17.i, align 8, !dbg !166, !tbaa !123
  %mul18.i = fmul double %mul13.i, %63, !dbg !165
  %add.i = fadd double %61, %mul18.i, !dbg !167
  store double %add.i, double* %arrayidx5.i86, align 8, !dbg !167, !tbaa !123
  %indvars.iv.next.i90 = add nuw nsw i64 %indvars.iv.i89, 1, !dbg !161
  %arrayidx12.i.1 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv7.i84, i64 %indvars.iv.next.i90, !dbg !163
  %64 = load double* %arrayidx12.i.1, align 8, !dbg !163, !tbaa !123
  %mul13.i.1 = fmul double %64, 3.241200e+04, !dbg !165
  %arrayidx17.i.1 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv.next.i90, i64 %indvars.iv4.i, !dbg !166
  %65 = load double* %arrayidx17.i.1, align 8, !dbg !166, !tbaa !123
  %mul18.i.1 = fmul double %mul13.i.1, %65, !dbg !165
  %add.i.1 = fadd double %add.i, %mul18.i.1, !dbg !167
  store double %add.i.1, double* %arrayidx5.i86, align 8, !dbg !167, !tbaa !123
  %indvars.iv.next.i90.1 = add nuw nsw i64 %indvars.iv.next.i90, 1, !dbg !161
  %exitcond.i91.1 = icmp eq i64 %indvars.iv.next.i90.1, 1024, !dbg !161
  br i1 %exitcond.i91.1, label %for.inc23.i, label %for.body8.i, !dbg !161

for.inc23.i:                                      ; preds = %for.body8.i
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !151
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 1024, !dbg !151
  br i1 %exitcond6.i, label %for.inc26.i, label %for.body3.i88, !dbg !151

for.inc26.i:                                      ; preds = %for.inc23.i
  %indvars.iv.next8.i92 = add nuw nsw i64 %indvars.iv7.i84, 1, !dbg !168
  %exitcond9.i93 = icmp eq i64 %indvars.iv.next8.i92, 1024, !dbg !168
  br i1 %exitcond9.i93, label %kernel_gemm.exit, label %for.cond1.preheader.i85, !dbg !168

kernel_gemm.exit:                                 ; preds = %for.inc26.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !169
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !170

if.end44:                                         ; preds = %kernel_gemm.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !92), !dbg !171
  tail call void @llvm.dbg.value(metadata i8* %66, i64 0, metadata !44, metadata !92), !dbg !172
  %66 = load i8** %argv, align 8, !dbg !173, !tbaa !175
  %67 = load i8* %66, align 1, !dbg !173, !tbaa !177
  %phitmp = icmp eq i8 %67, 0, !dbg !171
  br i1 %phitmp, label %for.cond1.preheader.i77.preheader, label %if.end51, !dbg !170

for.cond1.preheader.i77.preheader:                ; preds = %if.end44
  br label %for.cond1.preheader.i77, !dbg !178

for.cond1.preheader.i77:                          ; preds = %for.cond1.preheader.i77.preheader, %for.inc8.i83
  %indvars.iv7.i76 = phi i64 [ %indvars.iv.next8.i82, %for.inc8.i83 ], [ 0, %for.cond1.preheader.i77.preheader ], !dbg !185
  %68 = shl i64 %indvars.iv7.i76, 10, !dbg !178
  br label %for.body3.i79, !dbg !187

for.body3.i79:                                    ; preds = %for.inc.i, %for.cond1.preheader.i77
  %indvars.iv.i78 = phi i64 [ 0, %for.cond1.preheader.i77 ], [ %indvars.iv.next.i80, %for.inc.i ], !dbg !185
  %69 = load %struct._IO_FILE** @stderr, align 8, !dbg !188, !tbaa !175
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i76, i64 %indvars.iv.i78, !dbg !189
  %70 = load double* %arrayidx5.i, align 8, !dbg !189, !tbaa !123
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %70) #5, !dbg !190
  %71 = add nuw nsw i64 %indvars.iv.i78, %68, !dbg !178
  %72 = trunc i64 %71 to i32, !dbg !191
  %rem.i = srem i32 %72, 20, !dbg !191
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !191
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !192

if.then.i:                                        ; preds = %for.body3.i79
  %73 = load %struct._IO_FILE** @stderr, align 8, !dbg !193, !tbaa !175
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %73) #5, !dbg !195
  br label %for.inc.i, !dbg !195

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i79
  %indvars.iv.next.i80 = add nuw nsw i64 %indvars.iv.i78, 1, !dbg !187
  %exitcond.i81 = icmp eq i64 %indvars.iv.next.i80, 1024, !dbg !187
  br i1 %exitcond.i81, label %for.inc8.i83, label %for.body3.i79, !dbg !187

for.inc8.i83:                                     ; preds = %for.inc.i
  %indvars.iv.next8.i82 = add nuw nsw i64 %indvars.iv7.i76, 1, !dbg !196
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i82, 1024, !dbg !196
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i77, !dbg !196

print_array.exit:                                 ; preds = %for.inc8.i83
  %74 = load %struct._IO_FILE** @stderr, align 8, !dbg !197, !tbaa !175
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %74) #5, !dbg !198
  br label %if.end51, !dbg !185

if.end51:                                         ; preds = %if.end44, %print_array.exit, %kernel_gemm.exit
  tail call void @free(i8* %call) #4, !dbg !199
  tail call void @free(i8* %call1) #4, !dbg !200
  tail call void @free(i8* %call2) #4, !dbg !201
  ret i32 0, !dbg !202
}

declare i8* @polybench_alloc_data(i32, i32) #1

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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!89, !90}
!llvm.ident = !{!91}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c] [DW_LANG_C99]
!1 = !{!"gemm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm"}
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
!21 = !{!22, !47, !59, !74}
!22 = !{!"0x2e\00main\00main\00\0089\000\001\000\000\00256\001\0090", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 89] [def] [scope 90] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !43, !44, !46}
!30 = !{!"0x101\00argc\0016777305\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 89]
!31 = !{!"0x101\00argv\0033554521\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 89]
!32 = !{!"0x100\00ni\0092\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 92]
!33 = !{!"0x100\00nj\0093\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 93]
!34 = !{!"0x100\00nk\0094\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nk] [line 94]
!35 = !{!"0x100\00alpha\0097\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 97]
!36 = !{!"0x100\00beta\0098\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 98]
!37 = !{!"0x100\00C\0099\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [C] [line 99]
!38 = !{!"0x100\00A\00100\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 100]
!39 = !{!"0x100\00B\00101\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 101]
!40 = !{!"0x100\00__s1_len\00125\000", !41, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 125]
!41 = !{!"0xb\00125\003\001", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!42 = !{!"0xb\00125\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!43 = !{!"0x100\00__s2_len\00125\000", !41, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 125]
!44 = !{!"0x100\00__s2\00125\000", !45, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 125]
!45 = !{!"0xb\00125\003\002", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!46 = !{!"0x100\00__result\00125\000", !45, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 125]
!47 = !{!"0x2e\00print_array\00print_array\00\0049\001\001\000\000\00256\001\0051", !1, !23, !48, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 49] [local] [def] [scope 51] [print_array]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{null, !26, !26, !50}
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !52, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!52 = !{!8}
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00ni\0016777265\000", !47, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 49]
!55 = !{!"0x101\00nj\0033554481\000", !47, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 49]
!56 = !{!"0x101\00C\0050331698\000", !47, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 50]
!57 = !{!"0x100\00i\0052\000", !47, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!58 = !{!"0x100\00j\0052\000", !47, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 52]
!59 = !{!"0x2e\00kernel_gemm\00kernel_gemm\00\0066\001\001\000\000\00256\001\0072", !1, !23, !60, null, null, null, null, !62} ; [ DW_TAG_subprogram ] [line 66] [local] [def] [scope 72] [kernel_gemm]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !26, !26, !26, !6, !6, !50, !50, !50}
!62 = !{!63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!63 = !{!"0x101\00ni\0016777282\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 66]
!64 = !{!"0x101\00nj\0033554498\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 66]
!65 = !{!"0x101\00nk\0050331714\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 66]
!66 = !{!"0x101\00alpha\0067108931\000", !59, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 67]
!67 = !{!"0x101\00beta\0083886148\000", !59, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 68]
!68 = !{!"0x101\00C\00100663365\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 69]
!69 = !{!"0x101\00A\00117440582\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [A] [line 70]
!70 = !{!"0x101\00B\00134217799\000", !59, !23, !50} ; [ DW_TAG_arg_variable ] [B] [line 71]
!71 = !{!"0x100\00i\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 73]
!72 = !{!"0x100\00j\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 73]
!73 = !{!"0x100\00k\0073\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 73]
!74 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !23, !75, null, null, null, null, !78} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{null, !26, !26, !26, !77, !77, !50, !50, !50}
!77 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86, !87, !88}
!79 = !{!"0x101\00ni\0016777239\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!80 = !{!"0x101\00nj\0033554455\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!81 = !{!"0x101\00nk\0050331671\000", !74, !23, !26} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!82 = !{!"0x101\00alpha\0067108888\000", !74, !23, !77} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!83 = !{!"0x101\00beta\0083886105\000", !74, !23, !77} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!84 = !{!"0x101\00C\00100663322\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [C] [line 26]
!85 = !{!"0x101\00A\00117440539\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [A] [line 27]
!86 = !{!"0x101\00B\00134217756\000", !74, !23, !50} ; [ DW_TAG_arg_variable ] [B] [line 28]
!87 = !{!"0x100\00i\0030\000", !74, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!88 = !{!"0x100\00j\0030\000", !74, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!89 = !{i32 2, !"Dwarf Version", i32 4}
!90 = !{i32 2, !"Debug Info Version", i32 2}
!91 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!92 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!93 = !MDLocation(line: 89, column: 14, scope: !22)
!94 = !MDLocation(line: 89, column: 27, scope: !22)
!95 = !MDLocation(line: 92, column: 7, scope: !22)
!96 = !MDLocation(line: 93, column: 7, scope: !22)
!97 = !MDLocation(line: 94, column: 7, scope: !22)
!98 = !MDLocation(line: 99, column: 3, scope: !22)
!99 = !MDLocation(line: 100, column: 3, scope: !22)
!100 = !MDLocation(line: 101, column: 3, scope: !22)
!101 = !MDLocation(line: 105, column: 8, scope: !22)
!102 = !MDLocation(line: 106, column: 8, scope: !22)
!103 = !{!"0x101\00ni\0016777239\000", !74, !23, !26, !104} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!104 = !MDLocation(line: 104, column: 3, scope: !22)
!105 = !MDLocation(line: 23, column: 21, scope: !74, inlinedAt: !104)
!106 = !{!"0x101\00nj\0033554455\000", !74, !23, !26, !104} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!107 = !MDLocation(line: 23, column: 29, scope: !74, inlinedAt: !104)
!108 = !{!"0x101\00nk\0050331671\000", !74, !23, !26, !104} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!109 = !MDLocation(line: 23, column: 37, scope: !74, inlinedAt: !104)
!110 = !MDLocation(line: 97, column: 13, scope: !22)
!111 = !MDLocation(line: 98, column: 13, scope: !22)
!112 = !{!"0x100\00i\0030\000", !74, !23, !26, !104} ; [ DW_TAG_auto_variable ] [i] [line 30]
!113 = !MDLocation(line: 30, column: 7, scope: !74, inlinedAt: !104)
!114 = !MDLocation(line: 34, column: 3, scope: !115, inlinedAt: !104)
!115 = !{!"0xb\0034\003\0021", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!116 = !MDLocation(line: 36, column: 18, scope: !117, inlinedAt: !104)
!117 = !{!"0xb\0035\005\0024", !1, !118}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!118 = !{!"0xb\0035\005\0023", !1, !119}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!119 = !{!"0xb\0034\003\0022", !1, !115}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!120 = !MDLocation(line: 36, column: 32, scope: !117, inlinedAt: !104)
!121 = !MDLocation(line: 36, column: 17, scope: !117, inlinedAt: !104)
!122 = !MDLocation(line: 36, column: 7, scope: !117, inlinedAt: !104)
!123 = !{!124, !124, i64 0}
!124 = !{!"double", !125, i64 0}
!125 = !{!"omnipotent char", !126, i64 0}
!126 = !{!"Simple C/C++ TBAA"}
!127 = distinct !{!127, !128, !129}
!128 = !{!"llvm.loop.vectorize.width", i32 1}
!129 = !{!"llvm.loop.interleave.count", i32 1}
!130 = !MDLocation(line: 107, column: 8, scope: !22)
!131 = !MDLocation(line: 39, column: 18, scope: !132, inlinedAt: !104)
!132 = !{!"0xb\0038\005\0028", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!133 = !{!"0xb\0038\005\0027", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!134 = !{!"0xb\0037\003\0026", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!135 = !{!"0xb\0037\003\0025", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!136 = !MDLocation(line: 39, column: 32, scope: !132, inlinedAt: !104)
!137 = !MDLocation(line: 39, column: 17, scope: !132, inlinedAt: !104)
!138 = !MDLocation(line: 39, column: 7, scope: !132, inlinedAt: !104)
!139 = distinct !{!139, !128, !129}
!140 = !MDLocation(line: 37, column: 3, scope: !135, inlinedAt: !104)
!141 = !MDLocation(line: 42, column: 18, scope: !142, inlinedAt: !104)
!142 = !{!"0xb\0041\005\0032", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!143 = !{!"0xb\0041\005\0031", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!144 = !{!"0xb\0040\003\0030", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!145 = !{!"0xb\0040\003\0029", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!146 = !MDLocation(line: 42, column: 32, scope: !142, inlinedAt: !104)
!147 = !MDLocation(line: 42, column: 17, scope: !142, inlinedAt: !104)
!148 = !MDLocation(line: 42, column: 7, scope: !142, inlinedAt: !104)
!149 = distinct !{!149, !128, !129}
!150 = !MDLocation(line: 40, column: 3, scope: !145, inlinedAt: !104)
!151 = !MDLocation(line: 78, column: 5, scope: !152, inlinedAt: !155)
!152 = !{!"0xb\0078\005\0016", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!153 = !{!"0xb\0077\003\0015", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!154 = !{!"0xb\0077\003\0014", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!155 = !MDLocation(line: 113, column: 3, scope: !22)
!156 = !MDLocation(line: 80, column: 2, scope: !157, inlinedAt: !155)
!157 = !{!"0xb\0079\007\0018", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!158 = !{!"0xb\0078\005\0017", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!159 = !{!"0x100\00k\0073\000", !59, !23, !26, !155} ; [ DW_TAG_auto_variable ] [k] [line 73]
!160 = !MDLocation(line: 73, column: 13, scope: !59, inlinedAt: !155)
!161 = !MDLocation(line: 81, column: 2, scope: !162, inlinedAt: !155)
!162 = !{!"0xb\0081\002\0019", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!163 = !MDLocation(line: 82, column: 23, scope: !164, inlinedAt: !155)
!164 = !{!"0xb\0081\002\0020", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!165 = !MDLocation(line: 82, column: 15, scope: !164, inlinedAt: !155)
!166 = !MDLocation(line: 82, column: 33, scope: !164, inlinedAt: !155)
!167 = !MDLocation(line: 82, column: 4, scope: !164, inlinedAt: !155)
!168 = !MDLocation(line: 77, column: 3, scope: !154, inlinedAt: !155)
!169 = !MDLocation(line: 125, column: 3, scope: !42)
!170 = !MDLocation(line: 125, column: 3, scope: !22)
!171 = !MDLocation(line: 125, column: 3, scope: !41)
!172 = !MDLocation(line: 125, column: 3, scope: !45)
!173 = !MDLocation(line: 125, column: 3, scope: !174)
!174 = !{!"0xb\004", !1, !45}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!175 = !{!176, !176, i64 0}
!176 = !{!"any pointer", !125, i64 0}
!177 = !{!125, !125, i64 0}
!178 = !MDLocation(line: 57, column: 7, scope: !179, inlinedAt: !185)
!179 = !{!"0xb\0057\006\0013", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!180 = !{!"0xb\0055\0030\0012", !1, !181}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!181 = !{!"0xb\0055\005\0011", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!182 = !{!"0xb\0055\005\0010", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!183 = !{!"0xb\0054\003\009", !1, !184}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!184 = !{!"0xb\0054\003\008", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!185 = !MDLocation(line: 125, column: 3, scope: !186)
!186 = !{!"0xb\0023", !1, !42}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!187 = !MDLocation(line: 55, column: 5, scope: !182, inlinedAt: !185)
!188 = !MDLocation(line: 56, column: 11, scope: !180, inlinedAt: !185)
!189 = !MDLocation(line: 56, column: 41, scope: !180, inlinedAt: !185)
!190 = !MDLocation(line: 56, column: 2, scope: !180, inlinedAt: !185)
!191 = !MDLocation(line: 57, column: 6, scope: !179, inlinedAt: !185)
!192 = !MDLocation(line: 57, column: 6, scope: !180, inlinedAt: !185)
!193 = !MDLocation(line: 57, column: 39, scope: !194, inlinedAt: !185)
!194 = !{!"0xb\001", !1, !179}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemm/gemm.c]
!195 = !MDLocation(line: 57, column: 30, scope: !179, inlinedAt: !185)
!196 = !MDLocation(line: 54, column: 3, scope: !184, inlinedAt: !185)
!197 = !MDLocation(line: 59, column: 12, scope: !47, inlinedAt: !185)
!198 = !MDLocation(line: 59, column: 3, scope: !47, inlinedAt: !185)
!199 = !MDLocation(line: 128, column: 3, scope: !22)
!200 = !MDLocation(line: 129, column: 3, scope: !22)
!201 = !MDLocation(line: 130, column: 3, scope: !22)
!202 = !MDLocation(line: 132, column: 3, scope: !22)
