; ModuleID = 'syrk.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !85), !dbg !86
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !85), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !85), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !85), !dbg !89
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !90
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !91
  %arraydecay2 = bitcast i8* %call1 to [1024 x double]*, !dbg !92
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !93, metadata !85), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !96, metadata !85), !dbg !97
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !34, metadata !85), !dbg !98
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !34, metadata !85), !dbg !98
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !35, metadata !85), !dbg !99
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !35, metadata !85), !dbg !99
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !100, metadata !85), !dbg !101
  br label %for.cond1.preheader.i, !dbg !102

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %entry
  %indvars.iv11.i = phi i64 [ 0, %entry ], [ %indvars.iv.next12.i, %for.inc8.i ], !dbg !94
  %0 = trunc i64 %indvars.iv11.i to i32, !dbg !104
  %conv.i = sitofp i32 %0 to double, !dbg !104
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ], !dbg !94
  %induction84122 = or i64 %index, 1, !dbg !94
  %1 = trunc i64 %index to i32, !dbg !108
  %induction86123 = or i32 %1, 1, !dbg !108
  %2 = sitofp i32 %1 to double, !dbg !108
  %3 = sitofp i32 %induction86123 to double, !dbg !108
  %4 = fmul double %conv.i, %2, !dbg !104
  %5 = fmul double %conv.i, %3, !dbg !104
  %6 = fmul double %4, 9.765625e-04, !dbg !109
  %7 = fmul double %5, 9.765625e-04, !dbg !109
  %8 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv11.i, i64 %index, !dbg !110
  %9 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv11.i, i64 %induction84122, !dbg !110
  store double %6, double* %8, align 8, !dbg !110, !tbaa !111
  store double %7, double* %9, align 8, !dbg !110, !tbaa !111
  %index.next = add nuw nsw i64 %index, 2, !dbg !94
  %induction84122.1 = or i64 %index.next, 1, !dbg !94
  %10 = trunc i64 %index.next to i32, !dbg !108
  %induction86123.1 = or i32 %10, 1, !dbg !108
  %11 = sitofp i32 %10 to double, !dbg !108
  %12 = sitofp i32 %induction86123.1 to double, !dbg !108
  %13 = fmul double %conv.i, %11, !dbg !104
  %14 = fmul double %conv.i, %12, !dbg !104
  %15 = fmul double %13, 9.765625e-04, !dbg !109
  %16 = fmul double %14, 9.765625e-04, !dbg !109
  %17 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv11.i, i64 %index.next, !dbg !110
  %18 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv11.i, i64 %induction84122.1, !dbg !110
  store double %15, double* %17, align 8, !dbg !110, !tbaa !111
  store double %16, double* %18, align 8, !dbg !110, !tbaa !111
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !94
  %19 = icmp eq i64 %index.next.1, 1024, !dbg !94
  br i1 %19, label %for.inc8.i, label %vector.body, !dbg !94, !llvm.loop !115

for.inc8.i:                                       ; preds = %vector.body
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !102
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 1024, !dbg !102
  br i1 %exitcond13.i, label %for.cond15.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !102

for.cond15.preheader.i.preheader:                 ; preds = %for.inc8.i
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !118
  br label %for.cond15.preheader.i, !dbg !119

for.cond15.preheader.i:                           ; preds = %for.cond15.preheader.i.preheader, %for.inc31.i
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %for.inc31.i ], [ 0, %for.cond15.preheader.i.preheader ], !dbg !94
  %20 = trunc i64 %indvars.iv5.i to i32, !dbg !119
  %conv19.i = sitofp i32 %20 to double, !dbg !119
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %for.cond15.preheader.i
  %index93 = phi i64 [ 0, %for.cond15.preheader.i ], [ %index.next100.1, %vector.body90 ], !dbg !94
  %induction102124 = or i64 %index93, 1, !dbg !94
  %21 = trunc i64 %index93 to i32, !dbg !124
  %induction104125 = or i32 %21, 1, !dbg !124
  %22 = sitofp i32 %21 to double, !dbg !124
  %23 = sitofp i32 %induction104125 to double, !dbg !124
  %24 = fmul double %conv19.i, %22, !dbg !119
  %25 = fmul double %conv19.i, %23, !dbg !119
  %26 = fmul double %24, 9.765625e-04, !dbg !125
  %27 = fmul double %25, 9.765625e-04, !dbg !125
  %28 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %index93, !dbg !126
  %29 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %induction102124, !dbg !126
  store double %26, double* %28, align 8, !dbg !126, !tbaa !111
  store double %27, double* %29, align 8, !dbg !126, !tbaa !111
  %index.next100 = add nuw nsw i64 %index93, 2, !dbg !94
  %induction102124.1 = or i64 %index.next100, 1, !dbg !94
  %30 = trunc i64 %index.next100 to i32, !dbg !124
  %induction104125.1 = or i32 %30, 1, !dbg !124
  %31 = sitofp i32 %30 to double, !dbg !124
  %32 = sitofp i32 %induction104125.1 to double, !dbg !124
  %33 = fmul double %conv19.i, %31, !dbg !119
  %34 = fmul double %conv19.i, %32, !dbg !119
  %35 = fmul double %33, 9.765625e-04, !dbg !125
  %36 = fmul double %34, 9.765625e-04, !dbg !125
  %37 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %index.next100, !dbg !126
  %38 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %induction102124.1, !dbg !126
  store double %35, double* %37, align 8, !dbg !126, !tbaa !111
  store double %36, double* %38, align 8, !dbg !126, !tbaa !111
  %index.next100.1 = add nuw nsw i64 %index.next100, 2, !dbg !94
  %39 = icmp eq i64 %index.next100.1, 1024, !dbg !94
  br i1 %39, label %for.inc31.i, label %vector.body90, !dbg !94, !llvm.loop !127

for.inc31.i:                                      ; preds = %vector.body90
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !128
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 1024, !dbg !128
  br i1 %exitcond7.i, label %vector.ph107.preheader, label %for.cond15.preheader.i, !dbg !128

vector.ph107.preheader:                           ; preds = %for.inc31.i
  br label %vector.ph107

vector.ph107:                                     ; preds = %vector.ph107.preheader, %for.inc6.i
  %indvars.iv15.i = phi i64 [ %indvars.iv.next16.i, %for.inc6.i ], [ 0, %vector.ph107.preheader ], !dbg !129
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %vector.ph107
  %index111 = phi i64 [ 0, %vector.ph107 ], [ %index.next118.1, %vector.body108 ], !dbg !129
  %40 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %index111, !dbg !130
  %41 = bitcast double* %40 to <2 x double>*, !dbg !130
  %wide.load = load <2 x double>* %41, align 8, !dbg !130, !tbaa !111
  %.sum126 = or i64 %index111, 2, !dbg !130
  %42 = getelementptr [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %.sum126, !dbg !130
  %43 = bitcast double* %42 to <2 x double>*, !dbg !130
  %wide.load121 = load <2 x double>* %43, align 8, !dbg !130, !tbaa !111
  %44 = fmul <2 x double> %wide.load, <double 2.123000e+03, double 2.123000e+03>, !dbg !130
  %45 = fmul <2 x double> %wide.load121, <double 2.123000e+03, double 2.123000e+03>, !dbg !130
  %46 = bitcast double* %40 to <2 x double>*, !dbg !130
  store <2 x double> %44, <2 x double>* %46, align 8, !dbg !130, !tbaa !111
  %47 = bitcast double* %42 to <2 x double>*, !dbg !130
  store <2 x double> %45, <2 x double>* %47, align 8, !dbg !130, !tbaa !111
  %index.next118 = add nuw nsw i64 %index111, 4, !dbg !129
  %48 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %index.next118, !dbg !130
  %49 = bitcast double* %48 to <2 x double>*, !dbg !130
  %wide.load.1 = load <2 x double>* %49, align 8, !dbg !130, !tbaa !111
  %.sum126.1 = or i64 %index.next118, 2, !dbg !130
  %50 = getelementptr [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %.sum126.1, !dbg !130
  %51 = bitcast double* %50 to <2 x double>*, !dbg !130
  %wide.load121.1 = load <2 x double>* %51, align 8, !dbg !130, !tbaa !111
  %52 = fmul <2 x double> %wide.load.1, <double 2.123000e+03, double 2.123000e+03>, !dbg !130
  %53 = fmul <2 x double> %wide.load121.1, <double 2.123000e+03, double 2.123000e+03>, !dbg !130
  %54 = bitcast double* %48 to <2 x double>*, !dbg !130
  store <2 x double> %52, <2 x double>* %54, align 8, !dbg !130, !tbaa !111
  %55 = bitcast double* %50 to <2 x double>*, !dbg !130
  store <2 x double> %53, <2 x double>* %55, align 8, !dbg !130, !tbaa !111
  %index.next118.1 = add nuw nsw i64 %index.next118, 4, !dbg !129
  %56 = icmp eq i64 %index.next118.1, 1024, !dbg !129
  br i1 %56, label %for.inc6.i, label %vector.body108, !dbg !129, !llvm.loop !135

for.inc6.i:                                       ; preds = %vector.body108
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1, !dbg !136
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 1024, !dbg !136
  br i1 %exitcond17.i, label %for.cond12.preheader.i.preheader, label %vector.ph107, !dbg !136

for.cond12.preheader.i.preheader:                 ; preds = %for.inc6.i
  br label %for.cond12.preheader.i, !dbg !137

for.cond12.preheader.i:                           ; preds = %for.cond12.preheader.i.preheader, %for.inc38.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc38.i ], [ 0, %for.cond12.preheader.i.preheader ], !dbg !129
  br label %for.cond15.preheader.i80, !dbg !137

for.cond15.preheader.i80:                         ; preds = %for.inc35.i, %for.cond12.preheader.i
  %indvars.iv6.i = phi i64 [ 0, %for.cond12.preheader.i ], [ %indvars.iv.next7.i, %for.inc35.i ], !dbg !129
  %arrayidx31.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv9.i, i64 %indvars.iv6.i, !dbg !141
  %.pre.i = load double* %arrayidx31.i, align 8, !dbg !141, !tbaa !111
  br label %for.body17.i, !dbg !145

for.body17.i:                                     ; preds = %for.body17.i, %for.cond15.preheader.i80
  %57 = phi double [ %.pre.i, %for.cond15.preheader.i80 ], [ %add.i.1, %for.body17.i ], !dbg !146
  %indvars.iv.i81 = phi i64 [ 0, %for.cond15.preheader.i80 ], [ %indvars.iv.next.i82.1, %for.body17.i ], !dbg !129
  %arrayidx21.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv9.i, i64 %indvars.iv.i81, !dbg !146
  %58 = load double* %arrayidx21.i, align 8, !dbg !146, !tbaa !111
  %mul22.i = fmul double %58, 3.241200e+04, !dbg !147
  %arrayidx26.i = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv6.i, i64 %indvars.iv.i81, !dbg !148
  %59 = load double* %arrayidx26.i, align 8, !dbg !148, !tbaa !111
  %mul27.i = fmul double %mul22.i, %59, !dbg !147
  %add.i = fadd double %57, %mul27.i, !dbg !141
  store double %add.i, double* %arrayidx31.i, align 8, !dbg !141, !tbaa !111
  %indvars.iv.next.i82 = add nuw nsw i64 %indvars.iv.i81, 1, !dbg !145
  %arrayidx21.i.1 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv9.i, i64 %indvars.iv.next.i82, !dbg !146
  %60 = load double* %arrayidx21.i.1, align 8, !dbg !146, !tbaa !111
  %mul22.i.1 = fmul double %60, 3.241200e+04, !dbg !147
  %arrayidx26.i.1 = getelementptr inbounds [1024 x double]* %arraydecay2, i64 %indvars.iv6.i, i64 %indvars.iv.next.i82, !dbg !148
  %61 = load double* %arrayidx26.i.1, align 8, !dbg !148, !tbaa !111
  %mul27.i.1 = fmul double %mul22.i.1, %61, !dbg !147
  %add.i.1 = fadd double %add.i, %mul27.i.1, !dbg !141
  store double %add.i.1, double* %arrayidx31.i, align 8, !dbg !141, !tbaa !111
  %indvars.iv.next.i82.1 = add nuw nsw i64 %indvars.iv.next.i82, 1, !dbg !145
  %exitcond.i83.1 = icmp eq i64 %indvars.iv.next.i82.1, 1024, !dbg !145
  br i1 %exitcond.i83.1, label %for.inc35.i, label %for.body17.i, !dbg !145

for.inc35.i:                                      ; preds = %for.body17.i
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !137
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 1024, !dbg !137
  br i1 %exitcond8.i, label %for.inc38.i, label %for.cond15.preheader.i80, !dbg !137

for.inc38.i:                                      ; preds = %for.inc35.i
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !149
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 1024, !dbg !149
  br i1 %exitcond11.i, label %kernel_syrk.exit, label %for.cond12.preheader.i, !dbg !149

kernel_syrk.exit:                                 ; preds = %for.inc38.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !150
  br i1 %cmp, label %if.end41, label %if.end48, !dbg !151

if.end41:                                         ; preds = %kernel_syrk.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !85), !dbg !152
  tail call void @llvm.dbg.value(metadata i8* %62, i64 0, metadata !42, metadata !85), !dbg !153
  %62 = load i8** %argv, align 8, !dbg !154, !tbaa !156
  %63 = load i8* %62, align 1, !dbg !154, !tbaa !158
  %phitmp = icmp eq i8 %63, 0, !dbg !152
  br i1 %phitmp, label %for.cond1.preheader.i69.preheader, label %if.end48, !dbg !151

for.cond1.preheader.i69.preheader:                ; preds = %if.end41
  br label %for.cond1.preheader.i69, !dbg !159

for.cond1.preheader.i69:                          ; preds = %for.cond1.preheader.i69.preheader, %for.inc8.i75
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i75 ], [ 0, %for.cond1.preheader.i69.preheader ], !dbg !166
  %64 = shl i64 %indvars.iv7.i, 10, !dbg !159
  br label %for.body3.i71, !dbg !168

for.body3.i71:                                    ; preds = %for.inc.i, %for.cond1.preheader.i69
  %indvars.iv.i70 = phi i64 [ 0, %for.cond1.preheader.i69 ], [ %indvars.iv.next.i72, %for.inc.i ], !dbg !166
  %65 = load %struct._IO_FILE** @stderr, align 8, !dbg !169, !tbaa !156
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i70, !dbg !170
  %66 = load double* %arrayidx5.i, align 8, !dbg !170, !tbaa !111
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %66) #5, !dbg !171
  %67 = add nuw nsw i64 %indvars.iv.i70, %64, !dbg !159
  %68 = trunc i64 %67 to i32, !dbg !172
  %rem.i = srem i32 %68, 20, !dbg !172
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !172
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !173

if.then.i:                                        ; preds = %for.body3.i71
  %69 = load %struct._IO_FILE** @stderr, align 8, !dbg !174, !tbaa !156
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %69) #5, !dbg !176
  br label %for.inc.i, !dbg !176

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i71
  %indvars.iv.next.i72 = add nuw nsw i64 %indvars.iv.i70, 1, !dbg !168
  %exitcond.i73 = icmp eq i64 %indvars.iv.next.i72, 1024, !dbg !168
  br i1 %exitcond.i73, label %for.inc8.i75, label %for.body3.i71, !dbg !168

for.inc8.i75:                                     ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !177
  %exitcond10.i74 = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !177
  br i1 %exitcond10.i74, label %print_array.exit, label %for.cond1.preheader.i69, !dbg !177

print_array.exit:                                 ; preds = %for.inc8.i75
  %70 = load %struct._IO_FILE** @stderr, align 8, !dbg !178, !tbaa !156
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %70) #5, !dbg !179
  br label %if.end48, !dbg !166

if.end48:                                         ; preds = %if.end41, %print_array.exit, %kernel_syrk.exit
  tail call void @free(i8* %call) #4, !dbg !180
  tail call void @free(i8* %call1) #4, !dbg !181
  ret i32 0, !dbg !182
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
!llvm.module.flags = !{!82, !83}
!llvm.ident = !{!84}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c] [DW_LANG_C99]
!1 = !{!"syrk.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk"}
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
!21 = !{!22, !45, !56, !69}
!22 = !{!"0x2e\00main\00main\00\0084\000\001\000\000\00256\001\0085", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 84] [def] [scope 85] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !41, !42, !44}
!30 = !{!"0x101\00argc\0016777300\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 84]
!31 = !{!"0x101\00argv\0033554516\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 84]
!32 = !{!"0x100\00ni\0087\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 87]
!33 = !{!"0x100\00nj\0088\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 88]
!34 = !{!"0x100\00alpha\0091\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 91]
!35 = !{!"0x100\00beta\0092\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 92]
!36 = !{!"0x100\00C\0093\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [C] [line 93]
!37 = !{!"0x100\00A\0094\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 94]
!38 = !{!"0x100\00__s1_len\00111\000", !39, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 111]
!39 = !{!"0xb\00111\003\001", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!40 = !{!"0xb\00111\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!41 = !{!"0x100\00__s2_len\00111\000", !39, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 111]
!42 = !{!"0x100\00__s2\00111\000", !43, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 111]
!43 = !{!"0xb\00111\003\002", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!44 = !{!"0x100\00__result\00111\000", !43, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 111]
!45 = !{!"0x2e\00print_array\00print_array\00\0045\001\001\000\000\00256\001\0047", !1, !23, !46, null, null, null, null, !51} ; [ DW_TAG_subprogram ] [line 45] [local] [def] [scope 47] [print_array]
!46 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !47, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = !{null, !26, !48}
!48 = !{!"0xf\00\000\0064\0064\000\000", null, null, !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!49 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !50, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!50 = !{!8}
!51 = !{!52, !53, !54, !55}
!52 = !{!"0x101\00ni\0016777261\000", !45, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 45]
!53 = !{!"0x101\00C\0033554478\000", !45, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 46]
!54 = !{!"0x100\00i\0048\000", !45, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 48]
!55 = !{!"0x100\00j\0048\000", !45, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 48]
!56 = !{!"0x2e\00kernel_syrk\00kernel_syrk\00\0062\001\001\000\000\00256\001\0067", !1, !23, !57, null, null, null, null, !59} ; [ DW_TAG_subprogram ] [line 62] [local] [def] [scope 67] [kernel_syrk]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !26, !26, !6, !6, !48, !48}
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68}
!60 = !{!"0x101\00ni\0016777278\000", !56, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 62]
!61 = !{!"0x101\00nj\0033554494\000", !56, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 62]
!62 = !{!"0x101\00alpha\0050331711\000", !56, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 63]
!63 = !{!"0x101\00beta\0067108928\000", !56, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 64]
!64 = !{!"0x101\00C\0083886145\000", !56, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 65]
!65 = !{!"0x101\00A\00100663362\000", !56, !23, !48} ; [ DW_TAG_arg_variable ] [A] [line 66]
!66 = !{!"0x100\00i\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 68]
!67 = !{!"0x100\00j\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 68]
!68 = !{!"0x100\00k\0068\000", !56, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 68]
!69 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0028", !1, !23, !70, null, null, null, null, !73} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 28] [init_array]
!70 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !71, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = !{null, !26, !26, !72, !72, !48, !48}
!72 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!73 = !{!74, !75, !76, !77, !78, !79, !80, !81}
!74 = !{!"0x101\00ni\0016777239\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!75 = !{!"0x101\00nj\0033554455\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!76 = !{!"0x101\00alpha\0050331672\000", !69, !23, !72} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!77 = !{!"0x101\00beta\0067108889\000", !69, !23, !72} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!78 = !{!"0x101\00C\0083886106\000", !69, !23, !48} ; [ DW_TAG_arg_variable ] [C] [line 26]
!79 = !{!"0x101\00A\00100663323\000", !69, !23, !48} ; [ DW_TAG_arg_variable ] [A] [line 27]
!80 = !{!"0x100\00i\0029\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 29]
!81 = !{!"0x100\00j\0029\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 29]
!82 = !{i32 2, !"Dwarf Version", i32 4}
!83 = !{i32 2, !"Debug Info Version", i32 2}
!84 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!85 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!86 = !MDLocation(line: 84, column: 14, scope: !22)
!87 = !MDLocation(line: 84, column: 27, scope: !22)
!88 = !MDLocation(line: 87, column: 7, scope: !22)
!89 = !MDLocation(line: 88, column: 7, scope: !22)
!90 = !MDLocation(line: 93, column: 3, scope: !22)
!91 = !MDLocation(line: 94, column: 3, scope: !22)
!92 = !MDLocation(line: 97, column: 58, scope: !22)
!93 = !{!"0x101\00ni\0016777239\000", !69, !23, !26, !94} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!94 = !MDLocation(line: 97, column: 3, scope: !22)
!95 = !MDLocation(line: 23, column: 21, scope: !69, inlinedAt: !94)
!96 = !{!"0x101\00nj\0033554455\000", !69, !23, !26, !94} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!97 = !MDLocation(line: 23, column: 29, scope: !69, inlinedAt: !94)
!98 = !MDLocation(line: 91, column: 13, scope: !22)
!99 = !MDLocation(line: 92, column: 13, scope: !22)
!100 = !{!"0x100\00i\0029\000", !69, !23, !26, !94} ; [ DW_TAG_auto_variable ] [i] [line 29]
!101 = !MDLocation(line: 29, column: 7, scope: !69, inlinedAt: !94)
!102 = !MDLocation(line: 33, column: 3, scope: !103, inlinedAt: !94)
!103 = !{!"0xb\0033\003\0024", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!104 = !MDLocation(line: 35, column: 18, scope: !105, inlinedAt: !94)
!105 = !{!"0xb\0034\005\0027", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!106 = !{!"0xb\0034\005\0026", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!107 = !{!"0xb\0033\003\0025", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!108 = !MDLocation(line: 35, column: 32, scope: !105, inlinedAt: !94)
!109 = !MDLocation(line: 35, column: 17, scope: !105, inlinedAt: !94)
!110 = !MDLocation(line: 35, column: 7, scope: !105, inlinedAt: !94)
!111 = !{!112, !112, i64 0}
!112 = !{!"double", !113, i64 0}
!113 = !{!"omnipotent char", !114, i64 0}
!114 = !{!"Simple C/C++ TBAA"}
!115 = distinct !{!115, !116, !117}
!116 = !{!"llvm.loop.vectorize.width", i32 1}
!117 = !{!"llvm.loop.interleave.count", i32 1}
!118 = !MDLocation(line: 97, column: 38, scope: !22)
!119 = !MDLocation(line: 38, column: 18, scope: !120, inlinedAt: !94)
!120 = !{!"0xb\0037\005\0031", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!121 = !{!"0xb\0037\005\0030", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!122 = !{!"0xb\0036\003\0029", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!123 = !{!"0xb\0036\003\0028", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!124 = !MDLocation(line: 38, column: 32, scope: !120, inlinedAt: !94)
!125 = !MDLocation(line: 38, column: 17, scope: !120, inlinedAt: !94)
!126 = !MDLocation(line: 38, column: 7, scope: !120, inlinedAt: !94)
!127 = distinct !{!127, !116, !117}
!128 = !MDLocation(line: 36, column: 3, scope: !123, inlinedAt: !94)
!129 = !MDLocation(line: 103, column: 3, scope: !22)
!130 = !MDLocation(line: 74, column: 7, scope: !131, inlinedAt: !129)
!131 = !{!"0xb\0073\005\0017", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!132 = !{!"0xb\0073\005\0016", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!133 = !{!"0xb\0072\003\0015", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!134 = !{!"0xb\0072\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!135 = distinct !{!135, !116, !117}
!136 = !MDLocation(line: 72, column: 3, scope: !134, inlinedAt: !129)
!137 = !MDLocation(line: 76, column: 5, scope: !138, inlinedAt: !129)
!138 = !{!"0xb\0076\005\0020", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!139 = !{!"0xb\0075\003\0019", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!140 = !{!"0xb\0075\003\0018", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!141 = !MDLocation(line: 78, column: 4, scope: !142, inlinedAt: !129)
!142 = !{!"0xb\0077\007\0023", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!143 = !{!"0xb\0077\007\0022", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!144 = !{!"0xb\0076\005\0021", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!145 = !MDLocation(line: 77, column: 7, scope: !143, inlinedAt: !129)
!146 = !MDLocation(line: 78, column: 23, scope: !142, inlinedAt: !129)
!147 = !MDLocation(line: 78, column: 15, scope: !142, inlinedAt: !129)
!148 = !MDLocation(line: 78, column: 33, scope: !142, inlinedAt: !129)
!149 = !MDLocation(line: 75, column: 3, scope: !140, inlinedAt: !129)
!150 = !MDLocation(line: 111, column: 3, scope: !40)
!151 = !MDLocation(line: 111, column: 3, scope: !22)
!152 = !MDLocation(line: 111, column: 3, scope: !39)
!153 = !MDLocation(line: 111, column: 3, scope: !43)
!154 = !MDLocation(line: 111, column: 3, scope: !155)
!155 = !{!"0xb\004", !1, !43}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!156 = !{!157, !157, i64 0}
!157 = !{!"any pointer", !113, i64 0}
!158 = !{!113, !113, i64 0}
!159 = !MDLocation(line: 53, column: 7, scope: !160, inlinedAt: !166)
!160 = !{!"0xb\0053\006\0013", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!161 = !{!"0xb\0051\0030\0012", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!162 = !{!"0xb\0051\005\0011", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!163 = !{!"0xb\0051\005\0010", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!164 = !{!"0xb\0050\003\009", !1, !165}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!165 = !{!"0xb\0050\003\008", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!166 = !MDLocation(line: 111, column: 3, scope: !167)
!167 = !{!"0xb\0023", !1, !40}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!168 = !MDLocation(line: 51, column: 5, scope: !163, inlinedAt: !166)
!169 = !MDLocation(line: 52, column: 11, scope: !161, inlinedAt: !166)
!170 = !MDLocation(line: 52, column: 41, scope: !161, inlinedAt: !166)
!171 = !MDLocation(line: 52, column: 2, scope: !161, inlinedAt: !166)
!172 = !MDLocation(line: 53, column: 6, scope: !160, inlinedAt: !166)
!173 = !MDLocation(line: 53, column: 6, scope: !161, inlinedAt: !166)
!174 = !MDLocation(line: 53, column: 39, scope: !175, inlinedAt: !166)
!175 = !{!"0xb\001", !1, !160}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syrk/syrk.c]
!176 = !MDLocation(line: 53, column: 30, scope: !160, inlinedAt: !166)
!177 = !MDLocation(line: 50, column: 3, scope: !165, inlinedAt: !166)
!178 = !MDLocation(line: 55, column: 12, scope: !45, inlinedAt: !166)
!179 = !MDLocation(line: 55, column: 3, scope: !45, inlinedAt: !166)
!180 = !MDLocation(line: 114, column: 3, scope: !22)
!181 = !MDLocation(line: 115, column: 3, scope: !22)
!182 = !MDLocation(line: 117, column: 3, scope: !22)
