; ModuleID = 'syr2k.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !88), !dbg !89
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !88), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !88), !dbg !91
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !33, metadata !88), !dbg !92
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !93
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !94
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !95
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !96
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !97
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !98, metadata !88), !dbg !100
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !101, metadata !88), !dbg !102
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !34, metadata !88), !dbg !103
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !34, metadata !88), !dbg !103
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !35, metadata !88), !dbg !104
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !35, metadata !88), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !105, metadata !88), !dbg !106
  br label %for.cond1.preheader.i, !dbg !107

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv11.i = phi i64 [ 0, %entry ], [ %indvars.iv.next12.i, %for.inc17.i ], !dbg !99
  %0 = trunc i64 %indvars.iv11.i to i32, !dbg !109
  %conv.i = sitofp i32 %0 to double, !dbg !109
  br label %for.body3.i, !dbg !114

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv8.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next9.i.1, %for.body3.i ], !dbg !99
  %1 = trunc i64 %indvars.iv8.i to i32, !dbg !115
  %conv4.i = sitofp i32 %1 to double, !dbg !115
  %mul.i = fmul double %conv.i, %conv4.i, !dbg !109
  %div.i = fmul double %mul.i, 9.765625e-04, !dbg !116
  %arrayidx7.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv11.i, i64 %indvars.iv8.i, !dbg !117
  store double %div.i, double* %arrayidx7.i, align 8, !dbg !117, !tbaa !118
  %arrayidx16.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv11.i, i64 %indvars.iv8.i, !dbg !122
  store double %div.i, double* %arrayidx16.i, align 8, !dbg !122, !tbaa !118
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !114
  %2 = trunc i64 %indvars.iv.next9.i to i32, !dbg !115
  %conv4.i.1 = sitofp i32 %2 to double, !dbg !115
  %mul.i.1 = fmul double %conv.i, %conv4.i.1, !dbg !109
  %div.i.1 = fmul double %mul.i.1, 9.765625e-04, !dbg !116
  %arrayidx7.i.1 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv11.i, i64 %indvars.iv.next9.i, !dbg !117
  store double %div.i.1, double* %arrayidx7.i.1, align 8, !dbg !117, !tbaa !118
  %arrayidx16.i.1 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv11.i, i64 %indvars.iv.next9.i, !dbg !122
  store double %div.i.1, double* %arrayidx16.i.1, align 8, !dbg !122, !tbaa !118
  %indvars.iv.next9.i.1 = add nuw nsw i64 %indvars.iv.next9.i, 1, !dbg !114
  %exitcond10.i.1 = icmp eq i64 %indvars.iv.next9.i.1, 1024, !dbg !114
  br i1 %exitcond10.i.1, label %for.inc17.i, label %for.body3.i, !dbg !114

for.inc17.i:                                      ; preds = %for.body3.i
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !107
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 1024, !dbg !107
  br i1 %exitcond13.i, label %for.cond24.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !107

for.cond24.preheader.i.preheader:                 ; preds = %for.inc17.i
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !123
  br label %for.cond24.preheader.i, !dbg !124

for.cond24.preheader.i:                           ; preds = %for.cond24.preheader.i.preheader, %for.inc40.i
  %indvars.iv5.i = phi i64 [ %indvars.iv.next6.i, %for.inc40.i ], [ 0, %for.cond24.preheader.i.preheader ], !dbg !99
  %3 = trunc i64 %indvars.iv5.i to i32, !dbg !124
  %conv28.i = sitofp i32 %3 to double, !dbg !124
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond24.preheader.i
  %index = phi i64 [ 0, %for.cond24.preheader.i ], [ %index.next.1, %vector.body ], !dbg !99
  %induction87107 = or i64 %index, 1, !dbg !99
  %4 = trunc i64 %index to i32, !dbg !129
  %induction89108 = or i32 %4, 1, !dbg !129
  %5 = sitofp i32 %4 to double, !dbg !129
  %6 = sitofp i32 %induction89108 to double, !dbg !129
  %7 = fmul double %conv28.i, %5, !dbg !124
  %8 = fmul double %conv28.i, %6, !dbg !124
  %9 = fmul double %7, 9.765625e-04, !dbg !130
  %10 = fmul double %8, 9.765625e-04, !dbg !130
  %11 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %index, !dbg !131
  %12 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %induction87107, !dbg !131
  store double %9, double* %11, align 8, !dbg !131, !tbaa !118
  store double %10, double* %12, align 8, !dbg !131, !tbaa !118
  %index.next = add nuw nsw i64 %index, 2, !dbg !99
  %induction87107.1 = or i64 %index.next, 1, !dbg !99
  %13 = trunc i64 %index.next to i32, !dbg !129
  %induction89108.1 = or i32 %13, 1, !dbg !129
  %14 = sitofp i32 %13 to double, !dbg !129
  %15 = sitofp i32 %induction89108.1 to double, !dbg !129
  %16 = fmul double %conv28.i, %14, !dbg !124
  %17 = fmul double %conv28.i, %15, !dbg !124
  %18 = fmul double %16, 9.765625e-04, !dbg !130
  %19 = fmul double %17, 9.765625e-04, !dbg !130
  %20 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %index.next, !dbg !131
  %21 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %induction87107.1, !dbg !131
  store double %18, double* %20, align 8, !dbg !131, !tbaa !118
  store double %19, double* %21, align 8, !dbg !131, !tbaa !118
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !99
  %22 = icmp eq i64 %index.next.1, 1024, !dbg !99
  br i1 %22, label %for.inc40.i, label %vector.body, !dbg !99, !llvm.loop !132

for.inc40.i:                                      ; preds = %vector.body
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !135
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 1024, !dbg !135
  br i1 %exitcond7.i, label %vector.ph92.preheader, label %for.cond24.preheader.i, !dbg !135

vector.ph92.preheader:                            ; preds = %for.inc40.i
  br label %vector.ph92

vector.ph92:                                      ; preds = %vector.ph92.preheader, %for.inc6.i
  %indvars.iv15.i = phi i64 [ %indvars.iv.next16.i, %for.inc6.i ], [ 0, %vector.ph92.preheader ], !dbg !136
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93, %vector.ph92
  %index96 = phi i64 [ 0, %vector.ph92 ], [ %index.next103.1, %vector.body93 ], !dbg !136
  %23 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %index96, !dbg !137
  %24 = bitcast double* %23 to <2 x double>*, !dbg !137
  %wide.load = load <2 x double>* %24, align 8, !dbg !137, !tbaa !118
  %.sum109 = or i64 %index96, 2, !dbg !137
  %25 = getelementptr [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %.sum109, !dbg !137
  %26 = bitcast double* %25 to <2 x double>*, !dbg !137
  %wide.load106 = load <2 x double>* %26, align 8, !dbg !137, !tbaa !118
  %27 = fmul <2 x double> %wide.load, <double 2.123000e+03, double 2.123000e+03>, !dbg !137
  %28 = fmul <2 x double> %wide.load106, <double 2.123000e+03, double 2.123000e+03>, !dbg !137
  %29 = bitcast double* %23 to <2 x double>*, !dbg !137
  store <2 x double> %27, <2 x double>* %29, align 8, !dbg !137, !tbaa !118
  %30 = bitcast double* %25 to <2 x double>*, !dbg !137
  store <2 x double> %28, <2 x double>* %30, align 8, !dbg !137, !tbaa !118
  %index.next103 = add nuw nsw i64 %index96, 4, !dbg !136
  %31 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %index.next103, !dbg !137
  %32 = bitcast double* %31 to <2 x double>*, !dbg !137
  %wide.load.1 = load <2 x double>* %32, align 8, !dbg !137, !tbaa !118
  %.sum109.1 = or i64 %index.next103, 2, !dbg !137
  %33 = getelementptr [1024 x double]* %arraydecay, i64 %indvars.iv15.i, i64 %.sum109.1, !dbg !137
  %34 = bitcast double* %33 to <2 x double>*, !dbg !137
  %wide.load106.1 = load <2 x double>* %34, align 8, !dbg !137, !tbaa !118
  %35 = fmul <2 x double> %wide.load.1, <double 2.123000e+03, double 2.123000e+03>, !dbg !137
  %36 = fmul <2 x double> %wide.load106.1, <double 2.123000e+03, double 2.123000e+03>, !dbg !137
  %37 = bitcast double* %31 to <2 x double>*, !dbg !137
  store <2 x double> %35, <2 x double>* %37, align 8, !dbg !137, !tbaa !118
  %38 = bitcast double* %33 to <2 x double>*, !dbg !137
  store <2 x double> %36, <2 x double>* %38, align 8, !dbg !137, !tbaa !118
  %index.next103.1 = add nuw nsw i64 %index.next103, 4, !dbg !136
  %39 = icmp eq i64 %index.next103.1, 1024, !dbg !136
  br i1 %39, label %for.inc6.i, label %vector.body93, !dbg !136, !llvm.loop !142

for.inc6.i:                                       ; preds = %vector.body93
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1, !dbg !143
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 1024, !dbg !143
  br i1 %exitcond17.i, label %for.cond12.preheader.i.preheader, label %vector.ph92, !dbg !143

for.cond12.preheader.i.preheader:                 ; preds = %for.inc6.i
  br label %for.cond12.preheader.i, !dbg !144

for.cond12.preheader.i:                           ; preds = %for.cond12.preheader.i.preheader, %for.inc53.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %for.inc53.i ], [ 0, %for.cond12.preheader.i.preheader ], !dbg !136
  br label %for.cond15.preheader.i, !dbg !144

for.cond15.preheader.i:                           ; preds = %for.inc50.i, %for.cond12.preheader.i
  %indvars.iv6.i = phi i64 [ 0, %for.cond12.preheader.i ], [ %indvars.iv.next7.i, %for.inc50.i ], !dbg !136
  %arrayidx31.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv9.i, i64 %indvars.iv6.i, !dbg !148
  %.pre.i = load double* %arrayidx31.i, align 8, !dbg !148, !tbaa !118
  br label %for.body17.i, !dbg !153

for.body17.i:                                     ; preds = %for.body17.i, %for.cond15.preheader.i
  %40 = phi double [ %.pre.i, %for.cond15.preheader.i ], [ %add46.i, %for.body17.i ], !dbg !154
  %indvars.iv.i84 = phi i64 [ 0, %for.cond15.preheader.i ], [ %indvars.iv.next.i85, %for.body17.i ], !dbg !136
  %arrayidx21.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv9.i, i64 %indvars.iv.i84, !dbg !154
  %41 = load double* %arrayidx21.i, align 8, !dbg !154, !tbaa !118
  %mul22.i = fmul double %41, 3.241200e+04, !dbg !155
  %arrayidx26.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv6.i, i64 %indvars.iv.i84, !dbg !156
  %42 = load double* %arrayidx26.i, align 8, !dbg !156, !tbaa !118
  %mul27.i = fmul double %mul22.i, %42, !dbg !155
  %add.i = fadd double %40, %mul27.i, !dbg !148
  store double %add.i, double* %arrayidx31.i, align 8, !dbg !148, !tbaa !118
  %arrayidx35.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv9.i, i64 %indvars.iv.i84, !dbg !157
  %43 = load double* %arrayidx35.i, align 8, !dbg !157, !tbaa !118
  %mul36.i = fmul double %43, 3.241200e+04, !dbg !158
  %arrayidx40.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %indvars.iv.i84, !dbg !159
  %44 = load double* %arrayidx40.i, align 8, !dbg !159, !tbaa !118
  %mul41.i = fmul double %mul36.i, %44, !dbg !158
  %add46.i = fadd double %add.i, %mul41.i, !dbg !160
  store double %add46.i, double* %arrayidx31.i, align 8, !dbg !160, !tbaa !118
  %indvars.iv.next.i85 = add nuw nsw i64 %indvars.iv.i84, 1, !dbg !153
  %exitcond.i86 = icmp eq i64 %indvars.iv.next.i85, 1024, !dbg !153
  br i1 %exitcond.i86, label %for.inc50.i, label %for.body17.i, !dbg !153

for.inc50.i:                                      ; preds = %for.body17.i
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !144
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 1024, !dbg !144
  br i1 %exitcond8.i, label %for.inc53.i, label %for.cond15.preheader.i, !dbg !144

for.inc53.i:                                      ; preds = %for.inc50.i
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !161
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 1024, !dbg !161
  br i1 %exitcond11.i, label %kernel_syr2k.exit, label %for.cond12.preheader.i, !dbg !161

kernel_syr2k.exit:                                ; preds = %for.inc53.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !162
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !163

if.end44:                                         ; preds = %kernel_syr2k.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !88), !dbg !164
  tail call void @llvm.dbg.value(metadata i8* %45, i64 0, metadata !43, metadata !88), !dbg !165
  %45 = load i8** %argv, align 8, !dbg !166, !tbaa !168
  %46 = load i8* %45, align 1, !dbg !166, !tbaa !170
  %phitmp = icmp eq i8 %46, 0, !dbg !164
  br i1 %phitmp, label %for.cond1.preheader.i74.preheader, label %if.end51, !dbg !163

for.cond1.preheader.i74.preheader:                ; preds = %if.end44
  br label %for.cond1.preheader.i74, !dbg !171

for.cond1.preheader.i74:                          ; preds = %for.cond1.preheader.i74.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i74.preheader ], !dbg !178
  %47 = shl i64 %indvars.iv7.i, 10, !dbg !171
  br label %for.body3.i76, !dbg !180

for.body3.i76:                                    ; preds = %for.inc.i, %for.cond1.preheader.i74
  %indvars.iv.i75 = phi i64 [ 0, %for.cond1.preheader.i74 ], [ %indvars.iv.next.i77, %for.inc.i ], !dbg !178
  %48 = load %struct._IO_FILE** @stderr, align 8, !dbg !181, !tbaa !168
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i75, !dbg !182
  %49 = load double* %arrayidx5.i, align 8, !dbg !182, !tbaa !118
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %49) #5, !dbg !183
  %50 = add nuw nsw i64 %indvars.iv.i75, %47, !dbg !171
  %51 = trunc i64 %50 to i32, !dbg !184
  %rem.i = srem i32 %51, 20, !dbg !184
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !184
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !185

if.then.i:                                        ; preds = %for.body3.i76
  %52 = load %struct._IO_FILE** @stderr, align 8, !dbg !186, !tbaa !168
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #5, !dbg !188
  br label %for.inc.i, !dbg !188

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i76
  %indvars.iv.next.i77 = add nuw nsw i64 %indvars.iv.i75, 1, !dbg !180
  %exitcond.i78 = icmp eq i64 %indvars.iv.next.i77, 1024, !dbg !180
  br i1 %exitcond.i78, label %for.inc8.i, label %for.body3.i76, !dbg !180

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !189
  %exitcond10.i79 = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !189
  br i1 %exitcond10.i79, label %print_array.exit, label %for.cond1.preheader.i74, !dbg !189

print_array.exit:                                 ; preds = %for.inc8.i
  %53 = load %struct._IO_FILE** @stderr, align 8, !dbg !190, !tbaa !168
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %53) #5, !dbg !191
  br label %if.end51, !dbg !178

if.end51:                                         ; preds = %if.end44, %print_array.exit, %kernel_syr2k.exit
  tail call void @free(i8* %call) #4, !dbg !192
  tail call void @free(i8* %call1) #4, !dbg !193
  tail call void @free(i8* %call2) #4, !dbg !194
  ret i32 0, !dbg !195
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
!llvm.module.flags = !{!85, !86}
!llvm.ident = !{!87}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c] [DW_LANG_C99]
!1 = !{!"syr2k.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k"}
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
!21 = !{!22, !46, !57, !71}
!22 = !{!"0x2e\00main\00main\00\0091\000\001\000\000\00256\001\0092", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 91] [def] [scope 92] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !42, !43, !45}
!30 = !{!"0x101\00argc\0016777307\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!31 = !{!"0x101\00argv\0033554523\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!32 = !{!"0x100\00ni\0094\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [ni] [line 94]
!33 = !{!"0x100\00nj\0095\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [nj] [line 95]
!34 = !{!"0x100\00alpha\0098\000", !22, !23, !6}  ; [ DW_TAG_auto_variable ] [alpha] [line 98]
!35 = !{!"0x100\00beta\0099\000", !22, !23, !6}   ; [ DW_TAG_auto_variable ] [beta] [line 99]
!36 = !{!"0x100\00C\00100\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [C] [line 100]
!37 = !{!"0x100\00A\00101\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 101]
!38 = !{!"0x100\00B\00102\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 102]
!39 = !{!"0x100\00__s1_len\00126\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 126]
!40 = !{!"0xb\00126\003\001", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!41 = !{!"0xb\00126\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!42 = !{!"0x100\00__s2_len\00126\000", !40, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 126]
!43 = !{!"0x100\00__s2\00126\000", !44, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 126]
!44 = !{!"0xb\00126\003\002", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!45 = !{!"0x100\00__result\00126\000", !44, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 126]
!46 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0050", !1, !23, !47, null, null, null, null, !52} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 50] [print_array]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{null, !26, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !51, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!51 = !{!8}
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00ni\0016777264\000", !46, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 48]
!54 = !{!"0x101\00C\0033554481\000", !46, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 49]
!55 = !{!"0x100\00i\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 51]
!56 = !{!"0x100\00j\0051\000", !46, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 51]
!57 = !{!"0x2e\00kernel_syr2k\00kernel_syr2k\00\0065\001\001\000\000\00256\001\0071", !1, !23, !58, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 65] [local] [def] [scope 71] [kernel_syr2k]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !26, !26, !6, !6, !49, !49, !49}
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!61 = !{!"0x101\00ni\0016777281\000", !57, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 65]
!62 = !{!"0x101\00nj\0033554497\000", !57, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 65]
!63 = !{!"0x101\00alpha\0050331714\000", !57, !23, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 66]
!64 = !{!"0x101\00beta\0067108931\000", !57, !23, !6} ; [ DW_TAG_arg_variable ] [beta] [line 67]
!65 = !{!"0x101\00C\0083886148\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 68]
!66 = !{!"0x101\00A\00100663365\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 69]
!67 = !{!"0x101\00B\00117440582\000", !57, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 70]
!68 = !{!"0x100\00i\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!69 = !{!"0x100\00j\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 72]
!70 = !{!"0x100\00k\0072\000", !57, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!71 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !23, !72, null, null, null, null, !75} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !26, !26, !74, !74, !49, !49, !49}
!74 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!75 = !{!76, !77, !78, !79, !80, !81, !82, !83, !84}
!76 = !{!"0x101\00ni\0016777239\000", !71, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!77 = !{!"0x101\00nj\0033554455\000", !71, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!78 = !{!"0x101\00alpha\0050331672\000", !71, !23, !74} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!79 = !{!"0x101\00beta\0067108889\000", !71, !23, !74} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!80 = !{!"0x101\00C\0083886106\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [C] [line 26]
!81 = !{!"0x101\00A\00100663323\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [A] [line 27]
!82 = !{!"0x101\00B\00117440540\000", !71, !23, !49} ; [ DW_TAG_arg_variable ] [B] [line 28]
!83 = !{!"0x100\00i\0030\000", !71, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!84 = !{!"0x100\00j\0030\000", !71, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!85 = !{i32 2, !"Dwarf Version", i32 4}
!86 = !{i32 2, !"Debug Info Version", i32 2}
!87 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!88 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!89 = !MDLocation(line: 91, column: 14, scope: !22)
!90 = !MDLocation(line: 91, column: 27, scope: !22)
!91 = !MDLocation(line: 94, column: 7, scope: !22)
!92 = !MDLocation(line: 95, column: 7, scope: !22)
!93 = !MDLocation(line: 100, column: 3, scope: !22)
!94 = !MDLocation(line: 101, column: 3, scope: !22)
!95 = !MDLocation(line: 102, column: 3, scope: !22)
!96 = !MDLocation(line: 107, column: 8, scope: !22)
!97 = !MDLocation(line: 108, column: 8, scope: !22)
!98 = !{!"0x101\00ni\0016777239\000", !71, !23, !26, !99} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!99 = !MDLocation(line: 105, column: 3, scope: !22)
!100 = !MDLocation(line: 23, column: 21, scope: !71, inlinedAt: !99)
!101 = !{!"0x101\00nj\0033554455\000", !71, !23, !26, !99} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!102 = !MDLocation(line: 23, column: 29, scope: !71, inlinedAt: !99)
!103 = !MDLocation(line: 98, column: 13, scope: !22)
!104 = !MDLocation(line: 99, column: 13, scope: !22)
!105 = !{!"0x100\00i\0030\000", !71, !23, !26, !99} ; [ DW_TAG_auto_variable ] [i] [line 30]
!106 = !MDLocation(line: 30, column: 7, scope: !71, inlinedAt: !99)
!107 = !MDLocation(line: 34, column: 3, scope: !108, inlinedAt: !99)
!108 = !{!"0xb\0034\003\0025", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!109 = !MDLocation(line: 36, column: 18, scope: !110, inlinedAt: !99)
!110 = !{!"0xb\0035\0030\0029", !1, !111}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!111 = !{!"0xb\0035\005\0028", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!112 = !{!"0xb\0035\005\0027", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!113 = !{!"0xb\0034\003\0026", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!114 = !MDLocation(line: 35, column: 5, scope: !112, inlinedAt: !99)
!115 = !MDLocation(line: 36, column: 32, scope: !110, inlinedAt: !99)
!116 = !MDLocation(line: 36, column: 17, scope: !110, inlinedAt: !99)
!117 = !MDLocation(line: 36, column: 7, scope: !110, inlinedAt: !99)
!118 = !{!119, !119, i64 0}
!119 = !{!"double", !120, i64 0}
!120 = !{!"omnipotent char", !121, i64 0}
!121 = !{!"Simple C/C++ TBAA"}
!122 = !MDLocation(line: 37, column: 7, scope: !110, inlinedAt: !99)
!123 = !MDLocation(line: 106, column: 8, scope: !22)
!124 = !MDLocation(line: 41, column: 18, scope: !125, inlinedAt: !99)
!125 = !{!"0xb\0040\005\0033", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!126 = !{!"0xb\0040\005\0032", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!127 = !{!"0xb\0039\003\0031", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!128 = !{!"0xb\0039\003\0030", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!129 = !MDLocation(line: 41, column: 32, scope: !125, inlinedAt: !99)
!130 = !MDLocation(line: 41, column: 17, scope: !125, inlinedAt: !99)
!131 = !MDLocation(line: 41, column: 7, scope: !125, inlinedAt: !99)
!132 = distinct !{!132, !133, !134}
!133 = !{!"llvm.loop.vectorize.width", i32 1}
!134 = !{!"llvm.loop.interleave.count", i32 1}
!135 = !MDLocation(line: 39, column: 3, scope: !128, inlinedAt: !99)
!136 = !MDLocation(line: 114, column: 3, scope: !22)
!137 = !MDLocation(line: 78, column: 7, scope: !138, inlinedAt: !136)
!138 = !{!"0xb\0077\005\0017", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!139 = !{!"0xb\0077\005\0016", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!140 = !{!"0xb\0076\003\0015", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!141 = !{!"0xb\0076\003\0014", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!142 = distinct !{!142, !133, !134}
!143 = !MDLocation(line: 76, column: 3, scope: !141, inlinedAt: !136)
!144 = !MDLocation(line: 80, column: 5, scope: !145, inlinedAt: !136)
!145 = !{!"0xb\0080\005\0020", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!146 = !{!"0xb\0079\003\0019", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!147 = !{!"0xb\0079\003\0018", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!148 = !MDLocation(line: 83, column: 4, scope: !149, inlinedAt: !136)
!149 = !{!"0xb\0082\002\0024", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!150 = !{!"0xb\0081\007\0023", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!151 = !{!"0xb\0081\007\0022", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!152 = !{!"0xb\0080\005\0021", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!153 = !MDLocation(line: 81, column: 7, scope: !151, inlinedAt: !136)
!154 = !MDLocation(line: 83, column: 23, scope: !149, inlinedAt: !136)
!155 = !MDLocation(line: 83, column: 15, scope: !149, inlinedAt: !136)
!156 = !MDLocation(line: 83, column: 33, scope: !149, inlinedAt: !136)
!157 = !MDLocation(line: 84, column: 23, scope: !149, inlinedAt: !136)
!158 = !MDLocation(line: 84, column: 15, scope: !149, inlinedAt: !136)
!159 = !MDLocation(line: 84, column: 33, scope: !149, inlinedAt: !136)
!160 = !MDLocation(line: 84, column: 4, scope: !149, inlinedAt: !136)
!161 = !MDLocation(line: 79, column: 3, scope: !147, inlinedAt: !136)
!162 = !MDLocation(line: 126, column: 3, scope: !41)
!163 = !MDLocation(line: 126, column: 3, scope: !22)
!164 = !MDLocation(line: 126, column: 3, scope: !40)
!165 = !MDLocation(line: 126, column: 3, scope: !44)
!166 = !MDLocation(line: 126, column: 3, scope: !167)
!167 = !{!"0xb\004", !1, !44}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!168 = !{!169, !169, i64 0}
!169 = !{!"any pointer", !120, i64 0}
!170 = !{!120, !120, i64 0}
!171 = !MDLocation(line: 56, column: 7, scope: !172, inlinedAt: !178)
!172 = !{!"0xb\0056\006\0013", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!173 = !{!"0xb\0054\0030\0012", !1, !174}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!174 = !{!"0xb\0054\005\0011", !1, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!175 = !{!"0xb\0054\005\0010", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!176 = !{!"0xb\0053\003\009", !1, !177}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!177 = !{!"0xb\0053\003\008", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!178 = !MDLocation(line: 126, column: 3, scope: !179)
!179 = !{!"0xb\0023", !1, !41}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!180 = !MDLocation(line: 54, column: 5, scope: !175, inlinedAt: !178)
!181 = !MDLocation(line: 55, column: 11, scope: !173, inlinedAt: !178)
!182 = !MDLocation(line: 55, column: 41, scope: !173, inlinedAt: !178)
!183 = !MDLocation(line: 55, column: 2, scope: !173, inlinedAt: !178)
!184 = !MDLocation(line: 56, column: 6, scope: !172, inlinedAt: !178)
!185 = !MDLocation(line: 56, column: 6, scope: !173, inlinedAt: !178)
!186 = !MDLocation(line: 56, column: 39, scope: !187, inlinedAt: !178)
!187 = !{!"0xb\001", !1, !172}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/syr2k/syr2k.c]
!188 = !MDLocation(line: 56, column: 30, scope: !172, inlinedAt: !178)
!189 = !MDLocation(line: 53, column: 3, scope: !177, inlinedAt: !178)
!190 = !MDLocation(line: 58, column: 12, scope: !46, inlinedAt: !178)
!191 = !MDLocation(line: 58, column: 3, scope: !46, inlinedAt: !178)
!192 = !MDLocation(line: 129, column: 3, scope: !22)
!193 = !MDLocation(line: 130, column: 3, scope: !22)
!194 = !MDLocation(line: 131, column: 3, scope: !22)
!195 = !MDLocation(line: 133, column: 3, scope: !22)
