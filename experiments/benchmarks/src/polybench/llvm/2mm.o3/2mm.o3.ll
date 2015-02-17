; ModuleID = '2mm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
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
  %arraydecay10 = bitcast i8* %call6 to [1024 x double]*, !dbg !113
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !114, metadata !100), !dbg !116
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !117, metadata !100), !dbg !118
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !119, metadata !100), !dbg !120
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !121, metadata !100), !dbg !122
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !36, metadata !100), !dbg !123
  tail call void @llvm.dbg.value(metadata double 3.241200e+04, i64 0, metadata !36, metadata !100), !dbg !123
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !37, metadata !100), !dbg !124
  tail call void @llvm.dbg.value(metadata double 2.123000e+03, i64 0, metadata !37, metadata !100), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !125, metadata !100), !dbg !126
  br label %for.cond1.preheader.i, !dbg !127

for.cond1.preheader.i:                            ; preds = %for.inc8.i, %entry
  %indvars.iv29.i = phi i64 [ 0, %entry ], [ %indvars.iv.next30.i, %for.inc8.i ], !dbg !115
  %0 = trunc i64 %indvars.iv29.i to i32, !dbg !129
  %conv.i = sitofp i32 %0 to double, !dbg !129
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ], !dbg !115
  %induction112163 = or i64 %index, 1, !dbg !115
  %1 = trunc i64 %index to i32, !dbg !133
  %induction114164 = or i32 %1, 1, !dbg !133
  %2 = sitofp i32 %1 to double, !dbg !133
  %3 = sitofp i32 %induction114164 to double, !dbg !133
  %4 = fmul double %conv.i, %2, !dbg !129
  %5 = fmul double %conv.i, %3, !dbg !129
  %6 = fmul double %4, 9.765625e-04, !dbg !134
  %7 = fmul double %5, 9.765625e-04, !dbg !134
  %8 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %index, !dbg !135
  %9 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %induction112163, !dbg !135
  store double %6, double* %8, align 8, !dbg !135, !tbaa !136
  store double %7, double* %9, align 8, !dbg !135, !tbaa !136
  %index.next = add nuw nsw i64 %index, 2, !dbg !115
  %induction112163.1 = or i64 %index.next, 1, !dbg !115
  %10 = trunc i64 %index.next to i32, !dbg !133
  %induction114164.1 = or i32 %10, 1, !dbg !133
  %11 = sitofp i32 %10 to double, !dbg !133
  %12 = sitofp i32 %induction114164.1 to double, !dbg !133
  %13 = fmul double %conv.i, %11, !dbg !129
  %14 = fmul double %conv.i, %12, !dbg !129
  %15 = fmul double %13, 9.765625e-04, !dbg !134
  %16 = fmul double %14, 9.765625e-04, !dbg !134
  %17 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %index.next, !dbg !135
  %18 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv29.i, i64 %induction112163.1, !dbg !135
  store double %15, double* %17, align 8, !dbg !135, !tbaa !136
  store double %16, double* %18, align 8, !dbg !135, !tbaa !136
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !115
  %19 = icmp eq i64 %index.next.1, 1024, !dbg !115
  br i1 %19, label %for.inc8.i, label %vector.body, !dbg !115, !llvm.loop !140

for.inc8.i:                                       ; preds = %vector.body
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1, !dbg !127
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 1024, !dbg !127
  br i1 %exitcond31.i, label %for.cond15.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !127

for.cond15.preheader.i.preheader:                 ; preds = %for.inc8.i
  %arraydecay9 = bitcast i8* %call4 to [1024 x double]*, !dbg !143
  %arraydecay11 = bitcast i8* %call8 to [1024 x double]*, !dbg !144
  br label %for.cond15.preheader.i, !dbg !145

for.cond15.preheader.i:                           ; preds = %for.cond15.preheader.i.preheader, %for.inc31.i
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.inc31.i ], [ 0, %for.cond15.preheader.i.preheader ], !dbg !115
  %20 = trunc i64 %indvars.iv23.i to i32, !dbg !145
  %conv19.i = sitofp i32 %20 to double, !dbg !145
  br label %vector.body118

vector.body118:                                   ; preds = %vector.body118, %for.cond15.preheader.i
  %index121 = phi i64 [ 0, %for.cond15.preheader.i ], [ %index.next128, %vector.body118 ], !dbg !115
  %induction130165 = or i64 %index121, 1, !dbg !115
  %21 = or i64 %index121, 1, !dbg !150
  %22 = add nuw nsw i64 %induction130165, 1, !dbg !150
  %23 = trunc i64 %21 to i32, !dbg !151
  %24 = trunc i64 %22 to i32, !dbg !151
  %25 = sitofp i32 %23 to double, !dbg !151
  %26 = sitofp i32 %24 to double, !dbg !151
  %27 = fmul double %conv19.i, %25, !dbg !145
  %28 = fmul double %conv19.i, %26, !dbg !145
  %29 = fmul double %27, 9.765625e-04, !dbg !152
  %30 = fmul double %28, 9.765625e-04, !dbg !152
  %31 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv23.i, i64 %index121, !dbg !153
  %32 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv23.i, i64 %induction130165, !dbg !153
  store double %29, double* %31, align 8, !dbg !153, !tbaa !136
  store double %30, double* %32, align 8, !dbg !153, !tbaa !136
  %index.next128 = add i64 %index121, 2, !dbg !115
  %33 = icmp eq i64 %index.next128, 1024, !dbg !115
  br i1 %33, label %for.inc31.i, label %vector.body118, !dbg !115, !llvm.loop !154

for.inc31.i:                                      ; preds = %vector.body118
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !155
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 1024, !dbg !155
  br i1 %exitcond25.i, label %for.cond38.preheader.i.preheader, label %for.cond15.preheader.i, !dbg !155

for.cond38.preheader.i.preheader:                 ; preds = %for.inc31.i
  br label %for.cond38.preheader.i, !dbg !156

for.cond38.preheader.i:                           ; preds = %for.cond38.preheader.i.preheader, %for.inc55.i
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.inc55.i ], [ 0, %for.cond38.preheader.i.preheader ], !dbg !115
  %34 = trunc i64 %indvars.iv17.i to i32, !dbg !156
  %conv42.i = sitofp i32 %34 to double, !dbg !156
  br label %vector.body134

vector.body134:                                   ; preds = %vector.body134, %for.cond38.preheader.i
  %index137 = phi i64 [ 0, %for.cond38.preheader.i ], [ %index.next144, %vector.body134 ], !dbg !115
  %induction146166 = or i64 %index137, 1, !dbg !115
  %35 = add nuw nsw i64 %index137, 3, !dbg !161
  %36 = add nuw nsw i64 %induction146166, 3, !dbg !161
  %37 = trunc i64 %35 to i32, !dbg !162
  %38 = trunc i64 %36 to i32, !dbg !162
  %39 = sitofp i32 %37 to double, !dbg !162
  %40 = sitofp i32 %38 to double, !dbg !162
  %41 = fmul double %conv42.i, %39, !dbg !156
  %42 = fmul double %conv42.i, %40, !dbg !156
  %43 = fmul double %41, 9.765625e-04, !dbg !163
  %44 = fmul double %42, 9.765625e-04, !dbg !163
  %45 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv17.i, i64 %index137, !dbg !164
  %46 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv17.i, i64 %induction146166, !dbg !164
  store double %43, double* %45, align 8, !dbg !164, !tbaa !136
  store double %44, double* %46, align 8, !dbg !164, !tbaa !136
  %index.next144 = add i64 %index137, 2, !dbg !115
  %47 = icmp eq i64 %index.next144, 1024, !dbg !115
  br i1 %47, label %for.inc55.i, label %vector.body134, !dbg !115, !llvm.loop !165

for.inc55.i:                                      ; preds = %vector.body134
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1, !dbg !166
  %exitcond19.i = icmp eq i64 %indvars.iv.next18.i, 1024, !dbg !166
  br i1 %exitcond19.i, label %for.cond62.preheader.i.preheader, label %for.cond38.preheader.i, !dbg !166

for.cond62.preheader.i.preheader:                 ; preds = %for.inc55.i
  br label %for.cond62.preheader.i, !dbg !167

for.cond62.preheader.i:                           ; preds = %for.cond62.preheader.i.preheader, %for.inc79.i
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %for.inc79.i ], [ 0, %for.cond62.preheader.i.preheader ], !dbg !115
  %48 = trunc i64 %indvars.iv10.i to i32, !dbg !167
  %conv66.i = sitofp i32 %48 to double, !dbg !167
  br label %vector.body150

vector.body150:                                   ; preds = %vector.body150, %for.cond62.preheader.i
  %index153 = phi i64 [ 0, %for.cond62.preheader.i ], [ %index.next160, %vector.body150 ], !dbg !115
  %induction162167 = or i64 %index153, 1, !dbg !115
  %49 = add nuw nsw i64 %index153, 2, !dbg !172
  %50 = add nuw nsw i64 %induction162167, 2, !dbg !172
  %51 = trunc i64 %49 to i32, !dbg !173
  %52 = trunc i64 %50 to i32, !dbg !173
  %53 = sitofp i32 %51 to double, !dbg !173
  %54 = sitofp i32 %52 to double, !dbg !173
  %55 = fmul double %conv66.i, %53, !dbg !167
  %56 = fmul double %conv66.i, %54, !dbg !167
  %57 = fmul double %55, 9.765625e-04, !dbg !174
  %58 = fmul double %56, 9.765625e-04, !dbg !174
  %59 = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i, i64 %index153, !dbg !175
  %60 = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i, i64 %induction162167, !dbg !175
  store double %57, double* %59, align 8, !dbg !175, !tbaa !136
  store double %58, double* %60, align 8, !dbg !175, !tbaa !136
  %index.next160 = add i64 %index153, 2, !dbg !115
  %61 = icmp eq i64 %index.next160, 1024, !dbg !115
  br i1 %61, label %for.inc79.i, label %vector.body150, !dbg !115, !llvm.loop !176

for.inc79.i:                                      ; preds = %vector.body150
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !177
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 1024, !dbg !177
  br i1 %exitcond12.i, label %init_array.exit, label %for.cond62.preheader.i, !dbg !177

init_array.exit:                                  ; preds = %for.inc79.i
  %arraydecay12 = bitcast i8* %call to [1024 x double]*, !dbg !178
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !179, metadata !100), !dbg !181
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !182, metadata !100), !dbg !183
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !184, metadata !100), !dbg !185
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !186, metadata !100), !dbg !187
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !188, metadata !100), !dbg !189
  br label %for.cond4.preheader.i, !dbg !190

for.cond4.preheader.i:                            ; preds = %for.inc28.i, %init_array.exit
  %indvars.iv20.i98 = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next21.i102, %for.inc28.i ], !dbg !180
  br label %for.body6.i, !dbg !192

for.body6.i:                                      ; preds = %for.inc25.i, %for.cond4.preheader.i
  %indvars.iv16.i = phi i64 [ 0, %for.cond4.preheader.i ], [ %indvars.iv.next17.i, %for.inc25.i ], !dbg !180
  %arrayidx8.i = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv20.i98, i64 %indvars.iv16.i, !dbg !195
  store double 0.000000e+00, double* %arrayidx8.i, align 8, !dbg !195, !tbaa !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !198, metadata !100), !dbg !199
  br label %for.body11.i, !dbg !200

for.body11.i:                                     ; preds = %for.body11.i, %for.body6.i
  %62 = phi double [ 0.000000e+00, %for.body6.i ], [ %add.i.1, %for.body11.i ], !dbg !202
  %indvars.iv13.i99 = phi i64 [ 0, %for.body6.i ], [ %indvars.iv.next14.i101.1, %for.body11.i ], !dbg !180
  %arrayidx15.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv20.i98, i64 %indvars.iv13.i99, !dbg !202
  %63 = load double* %arrayidx15.i, align 8, !dbg !202, !tbaa !136
  %mul.i100 = fmul double %63, 3.241200e+04, !dbg !204
  %arrayidx19.i = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv13.i99, i64 %indvars.iv16.i, !dbg !205
  %64 = load double* %arrayidx19.i, align 8, !dbg !205, !tbaa !136
  %mul20.i = fmul double %mul.i100, %64, !dbg !204
  %add.i = fadd double %62, %mul20.i, !dbg !206
  store double %add.i, double* %arrayidx8.i, align 8, !dbg !206, !tbaa !136
  %indvars.iv.next14.i101 = add nuw nsw i64 %indvars.iv13.i99, 1, !dbg !200
  %arrayidx15.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv20.i98, i64 %indvars.iv.next14.i101, !dbg !202
  %65 = load double* %arrayidx15.i.1, align 8, !dbg !202, !tbaa !136
  %mul.i100.1 = fmul double %65, 3.241200e+04, !dbg !204
  %arrayidx19.i.1 = getelementptr inbounds [1024 x double]* %arraydecay9, i64 %indvars.iv.next14.i101, i64 %indvars.iv16.i, !dbg !205
  %66 = load double* %arrayidx19.i.1, align 8, !dbg !205, !tbaa !136
  %mul20.i.1 = fmul double %mul.i100.1, %66, !dbg !204
  %add.i.1 = fadd double %add.i, %mul20.i.1, !dbg !206
  store double %add.i.1, double* %arrayidx8.i, align 8, !dbg !206, !tbaa !136
  %indvars.iv.next14.i101.1 = add nuw nsw i64 %indvars.iv.next14.i101, 1, !dbg !200
  %exitcond15.i.1 = icmp eq i64 %indvars.iv.next14.i101.1, 1024, !dbg !200
  br i1 %exitcond15.i.1, label %for.inc25.i, label %for.body11.i, !dbg !200

for.inc25.i:                                      ; preds = %for.body11.i
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !192
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 1024, !dbg !192
  br i1 %exitcond18.i, label %for.inc28.i, label %for.body6.i, !dbg !192

for.inc28.i:                                      ; preds = %for.inc25.i
  %indvars.iv.next21.i102 = add nuw nsw i64 %indvars.iv20.i98, 1, !dbg !190
  %exitcond22.i103 = icmp eq i64 %indvars.iv.next21.i102, 1024, !dbg !190
  br i1 %exitcond22.i103, label %for.cond34.preheader.i.preheader, label %for.cond4.preheader.i, !dbg !190

for.cond34.preheader.i.preheader:                 ; preds = %for.inc28.i
  br label %for.cond34.preheader.i, !dbg !207

for.cond34.preheader.i:                           ; preds = %for.cond34.preheader.i.preheader, %for.inc65.i
  %indvars.iv10.i104 = phi i64 [ %indvars.iv.next11.i110, %for.inc65.i ], [ 0, %for.cond34.preheader.i.preheader ], !dbg !180
  br label %for.body36.i, !dbg !207

for.body36.i:                                     ; preds = %for.inc62.i, %for.cond34.preheader.i
  %indvars.iv7.i105 = phi i64 [ 0, %for.cond34.preheader.i ], [ %indvars.iv.next8.i109, %for.inc62.i ], !dbg !180
  %arrayidx40.i = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv10.i104, i64 %indvars.iv7.i105, !dbg !211
  %67 = load double* %arrayidx40.i, align 8, !dbg !211, !tbaa !136
  %mul41.i = fmul double %67, 2.123000e+03, !dbg !211
  store double %mul41.i, double* %arrayidx40.i, align 8, !dbg !211, !tbaa !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !198, metadata !100), !dbg !199
  br label %for.body44.i, !dbg !214

for.body44.i:                                     ; preds = %for.body44.i, %for.body36.i
  %68 = phi double [ %mul41.i, %for.body36.i ], [ %add58.i.1, %for.body44.i ], !dbg !216
  %indvars.iv.i106 = phi i64 [ 0, %for.body36.i ], [ %indvars.iv.next.i107.1, %for.body44.i ], !dbg !180
  %arrayidx48.i = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv10.i104, i64 %indvars.iv.i106, !dbg !216
  %69 = load double* %arrayidx48.i, align 8, !dbg !216, !tbaa !136
  %arrayidx52.i = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv.i106, i64 %indvars.iv7.i105, !dbg !218
  %70 = load double* %arrayidx52.i, align 8, !dbg !218, !tbaa !136
  %mul53.i = fmul double %69, %70, !dbg !216
  %add58.i = fadd double %68, %mul53.i, !dbg !219
  store double %add58.i, double* %arrayidx40.i, align 8, !dbg !219, !tbaa !136
  %indvars.iv.next.i107 = add nuw nsw i64 %indvars.iv.i106, 1, !dbg !214
  %arrayidx48.i.1 = getelementptr inbounds [1024 x double]* %arraydecay12, i64 %indvars.iv10.i104, i64 %indvars.iv.next.i107, !dbg !216
  %71 = load double* %arrayidx48.i.1, align 8, !dbg !216, !tbaa !136
  %arrayidx52.i.1 = getelementptr inbounds [1024 x double]* %arraydecay10, i64 %indvars.iv.next.i107, i64 %indvars.iv7.i105, !dbg !218
  %72 = load double* %arrayidx52.i.1, align 8, !dbg !218, !tbaa !136
  %mul53.i.1 = fmul double %71, %72, !dbg !216
  %add58.i.1 = fadd double %add58.i, %mul53.i.1, !dbg !219
  store double %add58.i.1, double* %arrayidx40.i, align 8, !dbg !219, !tbaa !136
  %indvars.iv.next.i107.1 = add nuw nsw i64 %indvars.iv.next.i107, 1, !dbg !214
  %exitcond.i108.1 = icmp eq i64 %indvars.iv.next.i107.1, 1024, !dbg !214
  br i1 %exitcond.i108.1, label %for.inc62.i, label %for.body44.i, !dbg !214

for.inc62.i:                                      ; preds = %for.body44.i
  %indvars.iv.next8.i109 = add nuw nsw i64 %indvars.iv7.i105, 1, !dbg !207
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i109, 1024, !dbg !207
  br i1 %exitcond9.i, label %for.inc65.i, label %for.body36.i, !dbg !207

for.inc65.i:                                      ; preds = %for.inc62.i
  %indvars.iv.next11.i110 = add nuw nsw i64 %indvars.iv10.i104, 1, !dbg !220
  %exitcond12.i111 = icmp eq i64 %indvars.iv.next11.i110, 1024, !dbg !220
  br i1 %exitcond12.i111, label %kernel_2mm.exit, label %for.cond34.preheader.i, !dbg !220

kernel_2mm.exit:                                  ; preds = %for.inc65.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !221
  br i1 %cmp, label %if.end56, label %if.end63, !dbg !222

if.end56:                                         ; preds = %kernel_2mm.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !100), !dbg !223
  tail call void @llvm.dbg.value(metadata i8* %73, i64 0, metadata !47, metadata !100), !dbg !224
  %73 = load i8** %argv, align 8, !dbg !225, !tbaa !227
  %74 = load i8* %73, align 1, !dbg !225, !tbaa !229
  %phitmp = icmp eq i8 %74, 0, !dbg !223
  br i1 %phitmp, label %for.cond1.preheader.i92.preheader, label %if.end63, !dbg !222

for.cond1.preheader.i92.preheader:                ; preds = %if.end56
  br label %for.cond1.preheader.i92, !dbg !230

for.cond1.preheader.i92:                          ; preds = %for.cond1.preheader.i92.preheader, %for.inc8.i97
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i97 ], [ 0, %for.cond1.preheader.i92.preheader ], !dbg !237
  %75 = shl i64 %indvars.iv7.i, 10, !dbg !230
  br label %for.body3.i94, !dbg !239

for.body3.i94:                                    ; preds = %for.inc.i, %for.cond1.preheader.i92
  %indvars.iv.i93 = phi i64 [ 0, %for.cond1.preheader.i92 ], [ %indvars.iv.next.i95, %for.inc.i ], !dbg !237
  %76 = load %struct._IO_FILE** @stderr, align 8, !dbg !240, !tbaa !227
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay11, i64 %indvars.iv7.i, i64 %indvars.iv.i93, !dbg !241
  %77 = load double* %arrayidx5.i, align 8, !dbg !241, !tbaa !136
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %77) #5, !dbg !242
  %78 = add nuw nsw i64 %indvars.iv.i93, %75, !dbg !230
  %79 = trunc i64 %78 to i32, !dbg !243
  %rem.i = srem i32 %79, 20, !dbg !243
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !243
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !244

if.then.i:                                        ; preds = %for.body3.i94
  %80 = load %struct._IO_FILE** @stderr, align 8, !dbg !245, !tbaa !227
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %80) #5, !dbg !247
  br label %for.inc.i, !dbg !247

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i94
  %indvars.iv.next.i95 = add nuw nsw i64 %indvars.iv.i93, 1, !dbg !239
  %exitcond.i96 = icmp eq i64 %indvars.iv.next.i95, 1024, !dbg !239
  br i1 %exitcond.i96, label %for.inc8.i97, label %for.body3.i94, !dbg !239

for.inc8.i97:                                     ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !248
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !248
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i92, !dbg !248

print_array.exit:                                 ; preds = %for.inc8.i97
  %81 = load %struct._IO_FILE** @stderr, align 8, !dbg !249, !tbaa !227
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %81) #5, !dbg !250
  br label %if.end63, !dbg !237

if.end63:                                         ; preds = %if.end56, %print_array.exit, %kernel_2mm.exit
  tail call void @free(i8* %call) #4, !dbg !251
  tail call void @free(i8* %call2) #4, !dbg !252
  tail call void @free(i8* %call4) #4, !dbg !253
  tail call void @free(i8* %call6) #4, !dbg !254
  tail call void @free(i8* %call8) #4, !dbg !255
  ret i32 0, !dbg !256
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
!50 = !{!"0x2e\00print_array\00print_array\00\0053\001\001\000\000\00256\001\0055", !1, !23, !51, null, null, null, null, !56} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [scope 55] [print_array]
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
!62 = !{!"0x2e\00kernel_2mm\00kernel_2mm\00\0070\001\001\000\000\00256\001\0078", !1, !23, !63, null, null, null, null, !65} ; [ DW_TAG_subprogram ] [line 70] [local] [def] [scope 78] [kernel_2mm]
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
!80 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0030", !1, !23, !81, null, null, null, null, !84} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 30] [init_array]
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
!113 = !MDLocation(line: 123, column: 8, scope: !22)
!114 = !{!"0x101\00ni\0016777239\000", !80, !23, !26, !115} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!115 = !MDLocation(line: 120, column: 3, scope: !22)
!116 = !MDLocation(line: 23, column: 21, scope: !80, inlinedAt: !115)
!117 = !{!"0x101\00nj\0033554455\000", !80, !23, !26, !115} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!118 = !MDLocation(line: 23, column: 29, scope: !80, inlinedAt: !115)
!119 = !{!"0x101\00nk\0050331671\000", !80, !23, !26, !115} ; [ DW_TAG_arg_variable ] [nk] [line 23]
!120 = !MDLocation(line: 23, column: 37, scope: !80, inlinedAt: !115)
!121 = !{!"0x101\00nl\0067108887\000", !80, !23, !26, !115} ; [ DW_TAG_arg_variable ] [nl] [line 23]
!122 = !MDLocation(line: 23, column: 45, scope: !80, inlinedAt: !115)
!123 = !MDLocation(line: 111, column: 13, scope: !22)
!124 = !MDLocation(line: 112, column: 13, scope: !22)
!125 = !{!"0x100\00i\0031\000", !80, !23, !26, !115} ; [ DW_TAG_auto_variable ] [i] [line 31]
!126 = !MDLocation(line: 31, column: 7, scope: !80, inlinedAt: !115)
!127 = !MDLocation(line: 35, column: 3, scope: !128, inlinedAt: !115)
!128 = !{!"0xb\0035\003\0028", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!129 = !MDLocation(line: 37, column: 18, scope: !130, inlinedAt: !115)
!130 = !{!"0xb\0036\005\0031", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!131 = !{!"0xb\0036\005\0030", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!132 = !{!"0xb\0035\003\0029", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!133 = !MDLocation(line: 37, column: 32, scope: !130, inlinedAt: !115)
!134 = !MDLocation(line: 37, column: 17, scope: !130, inlinedAt: !115)
!135 = !MDLocation(line: 37, column: 7, scope: !130, inlinedAt: !115)
!136 = !{!137, !137, i64 0}
!137 = !{!"double", !138, i64 0}
!138 = !{!"omnipotent char", !139, i64 0}
!139 = !{!"Simple C/C++ TBAA"}
!140 = distinct !{!140, !141, !142}
!141 = !{!"llvm.loop.vectorize.width", i32 1}
!142 = !{!"llvm.loop.interleave.count", i32 1}
!143 = !MDLocation(line: 122, column: 8, scope: !22)
!144 = !MDLocation(line: 124, column: 8, scope: !22)
!145 = !MDLocation(line: 40, column: 18, scope: !146, inlinedAt: !115)
!146 = !{!"0xb\0039\005\0035", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!147 = !{!"0xb\0039\005\0034", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!148 = !{!"0xb\0038\003\0033", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!149 = !{!"0xb\0038\003\0032", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!150 = !MDLocation(line: 39, column: 5, scope: !147, inlinedAt: !115)
!151 = !MDLocation(line: 40, column: 32, scope: !146, inlinedAt: !115)
!152 = !MDLocation(line: 40, column: 17, scope: !146, inlinedAt: !115)
!153 = !MDLocation(line: 40, column: 7, scope: !146, inlinedAt: !115)
!154 = distinct !{!154, !141, !142}
!155 = !MDLocation(line: 38, column: 3, scope: !149, inlinedAt: !115)
!156 = !MDLocation(line: 43, column: 18, scope: !157, inlinedAt: !115)
!157 = !{!"0xb\0042\005\0039", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!158 = !{!"0xb\0042\005\0038", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!159 = !{!"0xb\0041\003\0037", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!160 = !{!"0xb\0041\003\0036", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!161 = !MDLocation(line: 43, column: 33, scope: !157, inlinedAt: !115)
!162 = !MDLocation(line: 43, column: 32, scope: !157, inlinedAt: !115)
!163 = !MDLocation(line: 43, column: 17, scope: !157, inlinedAt: !115)
!164 = !MDLocation(line: 43, column: 7, scope: !157, inlinedAt: !115)
!165 = distinct !{!165, !141, !142}
!166 = !MDLocation(line: 41, column: 3, scope: !160, inlinedAt: !115)
!167 = !MDLocation(line: 46, column: 18, scope: !168, inlinedAt: !115)
!168 = !{!"0xb\0045\005\0043", !1, !169}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!169 = !{!"0xb\0045\005\0042", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!170 = !{!"0xb\0044\003\0041", !1, !171}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!171 = !{!"0xb\0044\003\0040", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!172 = !MDLocation(line: 46, column: 33, scope: !168, inlinedAt: !115)
!173 = !MDLocation(line: 46, column: 32, scope: !168, inlinedAt: !115)
!174 = !MDLocation(line: 46, column: 17, scope: !168, inlinedAt: !115)
!175 = !MDLocation(line: 46, column: 7, scope: !168, inlinedAt: !115)
!176 = distinct !{!176, !141, !142}
!177 = !MDLocation(line: 44, column: 3, scope: !171, inlinedAt: !115)
!178 = !MDLocation(line: 132, column: 8, scope: !22)
!179 = !{!"0x101\00ni\0016777286\000", !62, !23, !26, !180} ; [ DW_TAG_arg_variable ] [ni] [line 70]
!180 = !MDLocation(line: 130, column: 3, scope: !22)
!181 = !MDLocation(line: 70, column: 21, scope: !62, inlinedAt: !180)
!182 = !{!"0x101\00nj\0033554502\000", !62, !23, !26, !180} ; [ DW_TAG_arg_variable ] [nj] [line 70]
!183 = !MDLocation(line: 70, column: 29, scope: !62, inlinedAt: !180)
!184 = !{!"0x101\00nk\0050331718\000", !62, !23, !26, !180} ; [ DW_TAG_arg_variable ] [nk] [line 70]
!185 = !MDLocation(line: 70, column: 37, scope: !62, inlinedAt: !180)
!186 = !{!"0x101\00nl\0067108934\000", !62, !23, !26, !180} ; [ DW_TAG_arg_variable ] [nl] [line 70]
!187 = !MDLocation(line: 70, column: 45, scope: !62, inlinedAt: !180)
!188 = !{!"0x100\00i\0079\000", !62, !23, !26, !180} ; [ DW_TAG_auto_variable ] [i] [line 79]
!189 = !MDLocation(line: 79, column: 7, scope: !62, inlinedAt: !180)
!190 = !MDLocation(line: 83, column: 3, scope: !191, inlinedAt: !180)
!191 = !{!"0xb\0083\003\0014", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!192 = !MDLocation(line: 84, column: 5, scope: !193, inlinedAt: !180)
!193 = !{!"0xb\0084\005\0016", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!194 = !{!"0xb\0083\003\0015", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!195 = !MDLocation(line: 86, column: 2, scope: !196, inlinedAt: !180)
!196 = !{!"0xb\0085\007\0018", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!197 = !{!"0xb\0084\005\0017", !1, !193}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!198 = !{!"0x100\00k\0079\000", !62, !23, !26, !180} ; [ DW_TAG_auto_variable ] [k] [line 79]
!199 = !MDLocation(line: 79, column: 13, scope: !62, inlinedAt: !180)
!200 = !MDLocation(line: 87, column: 2, scope: !201, inlinedAt: !180)
!201 = !{!"0xb\0087\002\0019", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!202 = !MDLocation(line: 88, column: 25, scope: !203, inlinedAt: !180)
!203 = !{!"0xb\0087\002\0020", !1, !201}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!204 = !MDLocation(line: 88, column: 17, scope: !203, inlinedAt: !180)
!205 = !MDLocation(line: 88, column: 35, scope: !203, inlinedAt: !180)
!206 = !MDLocation(line: 88, column: 4, scope: !203, inlinedAt: !180)
!207 = !MDLocation(line: 91, column: 5, scope: !208, inlinedAt: !180)
!208 = !{!"0xb\0091\005\0023", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!209 = !{!"0xb\0090\003\0022", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!210 = !{!"0xb\0090\003\0021", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!211 = !MDLocation(line: 93, column: 2, scope: !212, inlinedAt: !180)
!212 = !{!"0xb\0092\007\0025", !1, !213}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!213 = !{!"0xb\0091\005\0024", !1, !208}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!214 = !MDLocation(line: 94, column: 2, scope: !215, inlinedAt: !180)
!215 = !{!"0xb\0094\002\0026", !1, !212}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!216 = !MDLocation(line: 95, column: 15, scope: !217, inlinedAt: !180)
!217 = !{!"0xb\0094\002\0027", !1, !215}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!218 = !MDLocation(line: 95, column: 27, scope: !217, inlinedAt: !180)
!219 = !MDLocation(line: 95, column: 4, scope: !217, inlinedAt: !180)
!220 = !MDLocation(line: 90, column: 3, scope: !210, inlinedAt: !180)
!221 = !MDLocation(line: 144, column: 3, scope: !45)
!222 = !MDLocation(line: 144, column: 3, scope: !22)
!223 = !MDLocation(line: 144, column: 3, scope: !44)
!224 = !MDLocation(line: 144, column: 3, scope: !48)
!225 = !MDLocation(line: 144, column: 3, scope: !226)
!226 = !{!"0xb\004", !1, !48}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!227 = !{!228, !228, i64 0}
!228 = !{!"any pointer", !138, i64 0}
!229 = !{!138, !138, i64 0}
!230 = !MDLocation(line: 61, column: 7, scope: !231, inlinedAt: !237)
!231 = !{!"0xb\0061\006\0013", !1, !232}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!232 = !{!"0xb\0059\0030\0012", !1, !233}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!233 = !{!"0xb\0059\005\0011", !1, !234}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!234 = !{!"0xb\0059\005\0010", !1, !235}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!235 = !{!"0xb\0058\003\009", !1, !236}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!236 = !{!"0xb\0058\003\008", !1, !50}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!237 = !MDLocation(line: 144, column: 3, scope: !238)
!238 = !{!"0xb\0023", !1, !45}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!239 = !MDLocation(line: 59, column: 5, scope: !234, inlinedAt: !237)
!240 = !MDLocation(line: 60, column: 11, scope: !232, inlinedAt: !237)
!241 = !MDLocation(line: 60, column: 41, scope: !232, inlinedAt: !237)
!242 = !MDLocation(line: 60, column: 2, scope: !232, inlinedAt: !237)
!243 = !MDLocation(line: 61, column: 6, scope: !231, inlinedAt: !237)
!244 = !MDLocation(line: 61, column: 6, scope: !232, inlinedAt: !237)
!245 = !MDLocation(line: 61, column: 39, scope: !246, inlinedAt: !237)
!246 = !{!"0xb\001", !1, !231}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/2mm/2mm.c]
!247 = !MDLocation(line: 61, column: 30, scope: !231, inlinedAt: !237)
!248 = !MDLocation(line: 58, column: 3, scope: !236, inlinedAt: !237)
!249 = !MDLocation(line: 63, column: 12, scope: !50, inlinedAt: !237)
!250 = !MDLocation(line: 63, column: 3, scope: !50, inlinedAt: !237)
!251 = !MDLocation(line: 147, column: 3, scope: !22)
!252 = !MDLocation(line: 148, column: 3, scope: !22)
!253 = !MDLocation(line: 149, column: 3, scope: !22)
!254 = !MDLocation(line: 150, column: 3, scope: !22)
!255 = !MDLocation(line: 151, column: 3, scope: !22)
!256 = !MDLocation(line: 153, column: 3, scope: !22)
