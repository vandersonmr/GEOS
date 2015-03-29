; ModuleID = 'gramschmidt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !81), !dbg !82
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !81), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !32, metadata !81), !dbg !84
  tail call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !33, metadata !81), !dbg !85
  %call = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #4, !dbg !86
  %call1 = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #4, !dbg !87
  %call2 = tail call i8* @polybench_alloc_data(i32 262144, i32 8) #4, !dbg !88
  %arraydecay = bitcast i8* %call to [512 x double]*, !dbg !89
  %arraydecay4 = bitcast i8* %call2 to [512 x double]*, !dbg !90
  tail call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !91, metadata !81), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !94, metadata !81), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !81), !dbg !97
  br label %for.cond1.preheader.i, !dbg !98

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv12.i = phi i64 [ 0, %entry ], [ %indvars.iv.next13.i, %for.inc17.i ], !dbg !92
  %0 = trunc i64 %indvars.iv12.i to i32, !dbg !100
  %conv.i = sitofp i32 %0 to double, !dbg !100
  br label %for.body3.i, !dbg !105

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv9.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next10.i.1, %for.body3.i ], !dbg !92
  %1 = trunc i64 %indvars.iv9.i to i32, !dbg !106
  %conv4.i = sitofp i32 %1 to double, !dbg !106
  %mul.i = fmul double %conv.i, %conv4.i, !dbg !100
  %div.i = fmul double %mul.i, 1.953125e-03, !dbg !107
  %arrayidx7.i = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv12.i, i64 %indvars.iv9.i, !dbg !108
  store double %div.i, double* %arrayidx7.i, align 8, !dbg !108, !tbaa !109
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !105
  %2 = trunc i64 %indvars.iv.next10.i to i32, !dbg !113
  %conv9.i = sitofp i32 %2 to double, !dbg !113
  %mul10.i = fmul double %conv.i, %conv9.i, !dbg !114
  %div12.i = fmul double %mul10.i, 1.953125e-03, !dbg !115
  %arrayidx16.i = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv9.i, !dbg !116
  store double %div12.i, double* %arrayidx16.i, align 8, !dbg !116, !tbaa !109
  %3 = trunc i64 %indvars.iv.next10.i to i32, !dbg !106
  %conv4.i.1 = sitofp i32 %3 to double, !dbg !106
  %mul.i.1 = fmul double %conv.i, %conv4.i.1, !dbg !100
  %div.i.1 = fmul double %mul.i.1, 1.953125e-03, !dbg !107
  %arrayidx7.i.1 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i, !dbg !108
  store double %div.i.1, double* %arrayidx7.i.1, align 8, !dbg !108, !tbaa !109
  %indvars.iv.next10.i.1 = add nuw nsw i64 %indvars.iv.next10.i, 1, !dbg !105
  %4 = trunc i64 %indvars.iv.next10.i.1 to i32, !dbg !113
  %conv9.i.1 = sitofp i32 %4 to double, !dbg !113
  %mul10.i.1 = fmul double %conv.i, %conv9.i.1, !dbg !114
  %div12.i.1 = fmul double %mul10.i.1, 1.953125e-03, !dbg !115
  %arrayidx16.i.1 = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i, !dbg !116
  store double %div12.i.1, double* %arrayidx16.i.1, align 8, !dbg !116, !tbaa !109
  %exitcond11.i.1 = icmp eq i64 %indvars.iv.next10.i.1, 512, !dbg !105
  br i1 %exitcond11.i.1, label %for.inc17.i, label %for.body3.i, !dbg !105

for.inc17.i:                                      ; preds = %for.body3.i
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1, !dbg !98
  %exitcond14.i = icmp eq i64 %indvars.iv.next13.i, 512, !dbg !98
  br i1 %exitcond14.i, label %for.cond24.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !98

for.cond24.preheader.i.preheader:                 ; preds = %for.inc17.i
  %arraydecay3 = bitcast i8* %call1 to [512 x double]*, !dbg !117
  br label %for.cond24.preheader.i, !dbg !118

for.cond24.preheader.i:                           ; preds = %for.cond24.preheader.i.preheader, %for.inc41.i
  %indvars.iv6.i = phi i64 [ %indvars.iv.next7.i, %for.inc41.i ], [ 0, %for.cond24.preheader.i.preheader ], !dbg !92
  %5 = trunc i64 %indvars.iv6.i to i32, !dbg !118
  %conv28.i = sitofp i32 %5 to double, !dbg !118
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond24.preheader.i
  %index = phi i64 [ 0, %for.cond24.preheader.i ], [ %index.next, %vector.body ], !dbg !92
  %induction108109 = or i64 %index, 1, !dbg !92
  %6 = add nuw nsw i64 %index, 2, !dbg !123
  %7 = add nuw nsw i64 %induction108109, 2, !dbg !123
  %8 = trunc i64 %6 to i32, !dbg !124
  %9 = trunc i64 %7 to i32, !dbg !124
  %10 = sitofp i32 %8 to double, !dbg !124
  %11 = sitofp i32 %9 to double, !dbg !124
  %12 = fmul double %conv28.i, %10, !dbg !118
  %13 = fmul double %conv28.i, %11, !dbg !118
  %14 = fmul double %12, 1.953125e-03, !dbg !125
  %15 = fmul double %13, 1.953125e-03, !dbg !125
  %16 = getelementptr inbounds [512 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %index, !dbg !126
  %17 = getelementptr inbounds [512 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %induction108109, !dbg !126
  store double %14, double* %16, align 8, !dbg !126, !tbaa !109
  store double %15, double* %17, align 8, !dbg !126, !tbaa !109
  %index.next = add i64 %index, 2, !dbg !92
  %18 = icmp eq i64 %index.next, 512, !dbg !92
  br i1 %18, label %for.inc41.i, label %vector.body, !dbg !92, !llvm.loop !127

for.inc41.i:                                      ; preds = %vector.body
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !130
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 512, !dbg !130
  br i1 %exitcond8.i, label %for.cond1.preheader.i84.preheader, label %for.cond24.preheader.i, !dbg !130

for.cond1.preheader.i84.preheader:                ; preds = %for.inc41.i
  br label %for.cond1.preheader.i84, !dbg !131

for.cond.loopexit.i.loopexit:                     ; preds = %for.inc83.i
  br label %for.cond.loopexit.i

for.cond.loopexit.i:                              ; preds = %for.cond.loopexit.i.loopexit, %for.end31.i
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1, !dbg !137
  %exitcond26.i = icmp eq i64 %indvars.iv.next25.i, 512, !dbg !137
  br i1 %exitcond26.i, label %kernel_gramschmidt.exit, label %for.cond1.preheader.i84, !dbg !137

for.cond1.preheader.i84:                          ; preds = %for.cond1.preheader.i84.preheader, %for.cond.loopexit.i
  %indvars.iv24.i = phi i64 [ %indvars.iv.next25.i, %for.cond.loopexit.i ], [ 0, %for.cond1.preheader.i84.preheader ], !dbg !136
  %indvars.iv18.i = phi i64 [ %indvars.iv.next19.i, %for.cond.loopexit.i ], [ 1, %for.cond1.preheader.i84.preheader ], !dbg !136
  br label %for.body3.i90, !dbg !131

for.body3.i90:                                    ; preds = %for.body3.i90, %for.cond1.preheader.i84
  %indvars.iv.i85 = phi i64 [ 0, %for.cond1.preheader.i84 ], [ %indvars.iv.next.i88.3, %for.body3.i90 ], !dbg !136
  %nrm.02.i = phi double [ 0.000000e+00, %for.cond1.preheader.i84 ], [ %add.i.3, %for.body3.i90 ], !dbg !136
  %arrayidx5.i86 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.i85, i64 %indvars.iv24.i, !dbg !138
  %19 = load double* %arrayidx5.i86, align 8, !dbg !138, !tbaa !109
  %mul.i87 = fmul double %19, %19, !dbg !138
  %add.i = fadd double %nrm.02.i, %mul.i87, !dbg !140
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !141, metadata !81) #4, !dbg !142
  %indvars.iv.next.i88 = add nuw nsw i64 %indvars.iv.i85, 1, !dbg !131
  %arrayidx5.i86.1 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next.i88, i64 %indvars.iv24.i, !dbg !138
  %20 = load double* %arrayidx5.i86.1, align 8, !dbg !138, !tbaa !109
  %mul.i87.1 = fmul double %20, %20, !dbg !138
  %add.i.1 = fadd double %add.i, %mul.i87.1, !dbg !140
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !141, metadata !81) #4, !dbg !142
  %indvars.iv.next.i88.1 = add nuw nsw i64 %indvars.iv.next.i88, 1, !dbg !131
  %arrayidx5.i86.2 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next.i88.1, i64 %indvars.iv24.i, !dbg !138
  %21 = load double* %arrayidx5.i86.2, align 8, !dbg !138, !tbaa !109
  %mul.i87.2 = fmul double %21, %21, !dbg !138
  %add.i.2 = fadd double %add.i.1, %mul.i87.2, !dbg !140
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !141, metadata !81) #4, !dbg !142
  %indvars.iv.next.i88.2 = add nuw nsw i64 %indvars.iv.next.i88.1, 1, !dbg !131
  %arrayidx5.i86.3 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next.i88.2, i64 %indvars.iv24.i, !dbg !138
  %22 = load double* %arrayidx5.i86.3, align 8, !dbg !138, !tbaa !109
  %mul.i87.3 = fmul double %22, %22, !dbg !138
  %add.i.3 = fadd double %add.i.2, %mul.i87.3, !dbg !140
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !141, metadata !81) #4, !dbg !142
  %indvars.iv.next.i88.3 = add nuw nsw i64 %indvars.iv.next.i88.2, 1, !dbg !131
  %exitcond.i89.3 = icmp eq i64 %indvars.iv.next.i88.3, 512, !dbg !131
  br i1 %exitcond.i89.3, label %for.end.i, label %for.body3.i90, !dbg !131

for.end.i:                                        ; preds = %for.body3.i90
  %add.i.lcssa = phi double [ %add.i.3, %for.body3.i90 ]
  %call.i91 = tail call double @sqrt(double %add.i.lcssa) #4, !dbg !143
  %arrayidx13.i = getelementptr inbounds [512 x double]* %arraydecay3, i64 %indvars.iv24.i, i64 %indvars.iv24.i, !dbg !144
  store double %call.i91, double* %arrayidx13.i, align 8, !dbg !144, !tbaa !109
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !145, metadata !81) #4, !dbg !146
  %arrayidx20.i99 = getelementptr inbounds [512 x double]* %arraydecay, i64 0, i64 %indvars.iv24.i, !dbg !147
  %23 = load double* %arrayidx20.i99, align 8, !dbg !147, !tbaa !109
  %div.i93100 = fdiv double %23, %call.i91, !dbg !147
  %arrayidx28.i101 = getelementptr inbounds [512 x double]* %arraydecay4, i64 0, i64 %indvars.iv24.i, !dbg !150
  store double %div.i93100, double* %arrayidx28.i101, align 8, !dbg !150, !tbaa !109
  br label %for.body16.for.body16_crit_edge.i, !dbg !151

for.body16.for.body16_crit_edge.i:                ; preds = %for.end.i, %for.body16.for.body16_crit_edge.i
  %indvars.iv.next10.i94102 = phi i64 [ 1, %for.end.i ], [ %indvars.iv.next10.i94, %for.body16.for.body16_crit_edge.i ]
  %.pre.i = load double* %arrayidx13.i, align 8, !dbg !152, !tbaa !109
  %arrayidx20.i = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next10.i94102, i64 %indvars.iv24.i, !dbg !147
  %24 = load double* %arrayidx20.i, align 8, !dbg !147, !tbaa !109
  %div.i93 = fdiv double %24, %.pre.i, !dbg !147
  %arrayidx28.i = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv.next10.i94102, i64 %indvars.iv24.i, !dbg !150
  store double %div.i93, double* %arrayidx28.i, align 8, !dbg !150, !tbaa !109
  %indvars.iv.next10.i94 = add nuw nsw i64 %indvars.iv.next10.i94102, 1, !dbg !151
  %exitcond11.i95 = icmp eq i64 %indvars.iv.next10.i94, 512, !dbg !151
  br i1 %exitcond11.i95, label %for.end31.i, label %for.body16.for.body16_crit_edge.i, !dbg !151

for.end31.i:                                      ; preds = %for.body16.for.body16_crit_edge.i
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1, !dbg !137
  %cmp346.i = icmp slt i64 %indvars.iv.next25.i, 512, !dbg !153
  br i1 %cmp346.i, label %for.body35.i.preheader, label %for.cond.loopexit.i, !dbg !156

for.body35.i.preheader:                           ; preds = %for.end31.i
  br label %for.body35.i, !dbg !157

for.body35.i:                                     ; preds = %for.body35.i.preheader, %for.inc83.i
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.inc83.i ], [ %indvars.iv18.i, %for.body35.i.preheader ], !dbg !136
  %arrayidx39.i = getelementptr inbounds [512 x double]* %arraydecay3, i64 %indvars.iv24.i, i64 %indvars.iv20.i, !dbg !157
  store double 0.000000e+00, double* %arrayidx39.i, align 8, !dbg !157, !tbaa !109
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !145, metadata !81) #4, !dbg !146
  br label %for.body42.i, !dbg !159

for.body42.i:                                     ; preds = %for.body42.i, %for.body35.i
  %25 = phi double [ 0.000000e+00, %for.body35.i ], [ %add56.i.1, %for.body42.i ], !dbg !161
  %indvars.iv12.i96 = phi i64 [ 0, %for.body35.i ], [ %indvars.iv.next13.i97.1, %for.body42.i ], !dbg !136
  %arrayidx46.i = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv12.i96, i64 %indvars.iv24.i, !dbg !161
  %26 = load double* %arrayidx46.i, align 8, !dbg !161, !tbaa !109
  %arrayidx50.i = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv12.i96, i64 %indvars.iv20.i, !dbg !163
  %27 = load double* %arrayidx50.i, align 8, !dbg !163, !tbaa !109
  %mul51.i = fmul double %26, %27, !dbg !161
  %add56.i = fadd double %25, %mul51.i, !dbg !164
  store double %add56.i, double* %arrayidx39.i, align 8, !dbg !164, !tbaa !109
  %indvars.iv.next13.i97 = add nuw nsw i64 %indvars.iv12.i96, 1, !dbg !159
  %arrayidx46.i.1 = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv.next13.i97, i64 %indvars.iv24.i, !dbg !161
  %28 = load double* %arrayidx46.i.1, align 8, !dbg !161, !tbaa !109
  %arrayidx50.i.1 = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next13.i97, i64 %indvars.iv20.i, !dbg !163
  %29 = load double* %arrayidx50.i.1, align 8, !dbg !163, !tbaa !109
  %mul51.i.1 = fmul double %28, %29, !dbg !161
  %add56.i.1 = fadd double %add56.i, %mul51.i.1, !dbg !164
  store double %add56.i.1, double* %arrayidx39.i, align 8, !dbg !164, !tbaa !109
  %indvars.iv.next13.i97.1 = add nuw nsw i64 %indvars.iv.next13.i97, 1, !dbg !159
  %exitcond14.i98.1 = icmp eq i64 %indvars.iv.next13.i97.1, 512, !dbg !159
  br i1 %exitcond14.i98.1, label %for.body62.i.preheader, label %for.body42.i, !dbg !159

for.body62.i.preheader:                           ; preds = %for.body42.i
  %add56.i.lcssa = phi double [ %add56.i.1, %for.body42.i ]
  %arrayidx66.i103 = getelementptr inbounds [512 x double]* %arraydecay, i64 0, i64 %indvars.iv20.i, !dbg !165
  %30 = load double* %arrayidx66.i103, align 8, !dbg !165, !tbaa !109
  %31 = load double* %arrayidx28.i101, align 8, !dbg !168, !tbaa !109
  %mul75.i105 = fmul double %add56.i.lcssa, %31, !dbg !168
  %sub.i106 = fsub double %30, %mul75.i105, !dbg !165
  store double %sub.i106, double* %arrayidx66.i103, align 8, !dbg !169, !tbaa !109
  br label %for.body62.for.body62_crit_edge.i, !dbg !170

for.body62.for.body62_crit_edge.i:                ; preds = %for.body62.i.preheader, %for.body62.for.body62_crit_edge.i
  %indvars.iv.next16.i107 = phi i64 [ 1, %for.body62.i.preheader ], [ %indvars.iv.next16.i, %for.body62.for.body62_crit_edge.i ]
  %.pre27.i = load double* %arrayidx39.i, align 8, !dbg !171, !tbaa !109
  %arrayidx66.i = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv.next16.i107, i64 %indvars.iv20.i, !dbg !165
  %32 = load double* %arrayidx66.i, align 8, !dbg !165, !tbaa !109
  %arrayidx70.i = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv.next16.i107, i64 %indvars.iv24.i, !dbg !168
  %33 = load double* %arrayidx70.i, align 8, !dbg !168, !tbaa !109
  %mul75.i = fmul double %.pre27.i, %33, !dbg !168
  %sub.i = fsub double %32, %mul75.i, !dbg !165
  store double %sub.i, double* %arrayidx66.i, align 8, !dbg !169, !tbaa !109
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv.next16.i107, 1, !dbg !170
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 512, !dbg !170
  br i1 %exitcond17.i, label %for.inc83.i, label %for.body62.for.body62_crit_edge.i, !dbg !170

for.inc83.i:                                      ; preds = %for.body62.for.body62_crit_edge.i
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !156
  %lftr.wideiv = trunc i64 %indvars.iv20.i to i32, !dbg !156
  %exitcond = icmp eq i32 %lftr.wideiv, 511, !dbg !156
  br i1 %exitcond, label %for.cond.loopexit.i.loopexit, label %for.body35.i, !dbg !156

kernel_gramschmidt.exit:                          ; preds = %for.cond.loopexit.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !172
  br i1 %cmp, label %if.end44, label %if.end53, !dbg !173

if.end44:                                         ; preds = %kernel_gramschmidt.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !81), !dbg !174
  tail call void @llvm.dbg.value(metadata i8* %34, i64 0, metadata !41, metadata !81), !dbg !175
  %34 = load i8** %argv, align 8, !dbg !176, !tbaa !178
  %35 = load i8* %34, align 1, !dbg !176, !tbaa !180
  %phitmp = icmp eq i8 %35, 0, !dbg !174
  br i1 %phitmp, label %for.cond1.preheader.i79.preheader, label %if.end53, !dbg !173

for.cond1.preheader.i79.preheader:                ; preds = %if.end44
  br label %for.cond1.preheader.i79, !dbg !181

for.cond1.preheader.i79:                          ; preds = %for.cond1.preheader.i79.preheader, %for.inc8.i
  %indvars.iv34.i = phi i64 [ %indvars.iv.next35.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i79.preheader ], !dbg !188
  %36 = trunc i64 %indvars.iv34.i to i32, !dbg !181
  %rem.i = srem i32 %36, 20, !dbg !181
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !181
  br label %for.body3.i80, !dbg !190

for.body3.i80:                                    ; preds = %for.inc.i, %for.cond1.preheader.i79
  %indvars.iv31.i = phi i64 [ 0, %for.cond1.preheader.i79 ], [ %indvars.iv.next32.i, %for.inc.i ], !dbg !188
  %37 = load %struct._IO_FILE** @stderr, align 8, !dbg !191, !tbaa !178
  %arrayidx5.i = getelementptr inbounds [512 x double]* %arraydecay, i64 %indvars.iv34.i, i64 %indvars.iv31.i, !dbg !192
  %38 = load double* %arrayidx5.i, align 8, !dbg !192, !tbaa !109
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %38) #5, !dbg !193
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !194

if.then.i:                                        ; preds = %for.body3.i80
  %39 = load %struct._IO_FILE** @stderr, align 8, !dbg !195, !tbaa !178
  %fputc15.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %39) #5, !dbg !197
  br label %for.inc.i, !dbg !197

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i80
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !190
  %exitcond33.i = icmp eq i64 %indvars.iv.next32.i, 512, !dbg !190
  br i1 %exitcond33.i, label %for.inc8.i, label %for.body3.i80, !dbg !190

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1, !dbg !198
  %exitcond36.i = icmp eq i64 %indvars.iv.next35.i, 512, !dbg !198
  br i1 %exitcond36.i, label %for.end10.i, label %for.cond1.preheader.i79, !dbg !198

for.end10.i:                                      ; preds = %for.inc8.i
  %40 = load %struct._IO_FILE** @stderr, align 8, !dbg !199, !tbaa !178
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %40) #5, !dbg !200
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !201, metadata !81) #4, !dbg !202
  br label %for.cond15.preheader.i, !dbg !203

for.cond15.preheader.i:                           ; preds = %for.inc31.i, %for.end10.i
  %indvars.iv28.i = phi i64 [ 0, %for.end10.i ], [ %indvars.iv.next29.i, %for.inc31.i ], !dbg !188
  %41 = trunc i64 %indvars.iv28.i to i32, !dbg !205
  %rem23.i = srem i32 %41, 20, !dbg !205
  %cmp24.i = icmp eq i32 %rem23.i, 0, !dbg !205
  br label %for.body17.i, !dbg !211

for.body17.i:                                     ; preds = %for.inc28.i, %for.cond15.preheader.i
  %indvars.iv25.i = phi i64 [ 0, %for.cond15.preheader.i ], [ %indvars.iv.next26.i, %for.inc28.i ], !dbg !188
  %42 = load %struct._IO_FILE** @stderr, align 8, !dbg !212, !tbaa !178
  %arrayidx21.i = getelementptr inbounds [512 x double]* %arraydecay3, i64 %indvars.iv28.i, i64 %indvars.iv25.i, !dbg !213
  %43 = load double* %arrayidx21.i, align 8, !dbg !213, !tbaa !109
  %call22.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %43) #5, !dbg !214
  br i1 %cmp24.i, label %if.then25.i, label %for.inc28.i, !dbg !215

if.then25.i:                                      ; preds = %for.body17.i
  %44 = load %struct._IO_FILE** @stderr, align 8, !dbg !216, !tbaa !178
  %fputc12.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %44) #5, !dbg !218
  br label %for.inc28.i, !dbg !218

for.inc28.i:                                      ; preds = %if.then25.i, %for.body17.i
  %indvars.iv.next26.i = add nuw nsw i64 %indvars.iv25.i, 1, !dbg !211
  %exitcond27.i = icmp eq i64 %indvars.iv.next26.i, 512, !dbg !211
  br i1 %exitcond27.i, label %for.inc31.i, label %for.body17.i, !dbg !211

for.inc31.i:                                      ; preds = %for.inc28.i
  %indvars.iv.next29.i = add nuw nsw i64 %indvars.iv28.i, 1, !dbg !203
  %exitcond30.i = icmp eq i64 %indvars.iv.next29.i, 512, !dbg !203
  br i1 %exitcond30.i, label %for.end33.i, label %for.cond15.preheader.i, !dbg !203

for.end33.i:                                      ; preds = %for.inc31.i
  %45 = load %struct._IO_FILE** @stderr, align 8, !dbg !219, !tbaa !178
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !201, metadata !81) #4, !dbg !202
  br label %for.cond38.preheader.i, !dbg !221

for.cond38.preheader.i:                           ; preds = %for.inc54.i, %for.end33.i
  %indvars.iv22.i = phi i64 [ 0, %for.end33.i ], [ %indvars.iv.next23.i, %for.inc54.i ], !dbg !188
  %46 = trunc i64 %indvars.iv22.i to i32, !dbg !223
  %rem46.i = srem i32 %46, 20, !dbg !223
  %cmp47.i = icmp eq i32 %rem46.i, 0, !dbg !223
  br label %for.body40.i, !dbg !229

for.body40.i:                                     ; preds = %for.inc51.i, %for.cond38.preheader.i
  %indvars.iv.i81 = phi i64 [ 0, %for.cond38.preheader.i ], [ %indvars.iv.next.i82, %for.inc51.i ], !dbg !188
  %47 = load %struct._IO_FILE** @stderr, align 8, !dbg !230, !tbaa !178
  %arrayidx44.i = getelementptr inbounds [512 x double]* %arraydecay4, i64 %indvars.iv22.i, i64 %indvars.iv.i81, !dbg !231
  %48 = load double* %arrayidx44.i, align 8, !dbg !231, !tbaa !109
  %call45.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %48) #5, !dbg !232
  br i1 %cmp47.i, label %if.then48.i, label %for.inc51.i, !dbg !233

if.then48.i:                                      ; preds = %for.body40.i
  %49 = load %struct._IO_FILE** @stderr, align 8, !dbg !234, !tbaa !178
  %fputc9.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %49) #5, !dbg !236
  br label %for.inc51.i, !dbg !236

for.inc51.i:                                      ; preds = %if.then48.i, %for.body40.i
  %indvars.iv.next.i82 = add nuw nsw i64 %indvars.iv.i81, 1, !dbg !229
  %exitcond.i83 = icmp eq i64 %indvars.iv.next.i82, 512, !dbg !229
  br i1 %exitcond.i83, label %for.inc54.i, label %for.body40.i, !dbg !229

for.inc54.i:                                      ; preds = %for.inc51.i
  %indvars.iv.next23.i = add nuw nsw i64 %indvars.iv22.i, 1, !dbg !221
  %exitcond24.i = icmp eq i64 %indvars.iv.next23.i, 512, !dbg !221
  br i1 %exitcond24.i, label %print_array.exit, label %for.cond38.preheader.i, !dbg !221

print_array.exit:                                 ; preds = %for.inc54.i
  %50 = load %struct._IO_FILE** @stderr, align 8, !dbg !237, !tbaa !178
  %fputc6.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5, !dbg !238
  br label %if.end53, !dbg !188

if.end53:                                         ; preds = %if.end44, %print_array.exit, %kernel_gramschmidt.exit
  tail call void @free(i8* %call) #4, !dbg !239
  tail call void @free(i8* %call1) #4, !dbg !240
  tail call void @free(i8* %call2) #4, !dbg !241
  ret i32 0, !dbg !242
}

declare i8* @polybench_alloc_data(i32, i32) #1

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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!78, !79}
!llvm.ident = !{!80}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c] [DW_LANG_C99]
!1 = !{!"gramschmidt.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0016777216\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16777216, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\00512"}                         ; [ DW_TAG_subrange_type ] [0, 511]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt"}
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
!21 = !{!22, !44, !58, !69}
!22 = !{!"0x2e\00main\00main\00\00107\000\001\000\000\00256\001\00108", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 107] [def] [scope 108] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !40, !41, !43}
!30 = !{!"0x101\00argc\0016777323\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 107]
!31 = !{!"0x101\00argv\0033554539\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 107]
!32 = !{!"0x100\00ni\00110\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [ni] [line 110]
!33 = !{!"0x100\00nj\00111\000", !22, !23, !26}   ; [ DW_TAG_auto_variable ] [nj] [line 111]
!34 = !{!"0x100\00A\00114\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 114]
!35 = !{!"0x100\00R\00115\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [R] [line 115]
!36 = !{!"0x100\00Q\00116\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [Q] [line 116]
!37 = !{!"0x100\00__s1_len\00139\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 139]
!38 = !{!"0xb\00139\003\001", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!39 = !{!"0xb\00139\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!40 = !{!"0x100\00__s2_len\00139\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 139]
!41 = !{!"0x100\00__s2\00139\000", !42, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 139]
!42 = !{!"0xb\00139\003\002", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!43 = !{!"0x100\00__result\00139\000", !42, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 139]
!44 = !{!"0x2e\00print_array\00print_array\00\0044\001\001\000\000\00256\001\0048", !1, !23, !45, null, null, null, null, !50} ; [ DW_TAG_subprogram ] [line 44] [local] [def] [scope 48] [print_array]
!45 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !46, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = !{null, !26, !26, !47, !47, !47}
!47 = !{!"0xf\00\000\0064\0064\000\000", null, null, !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!48 = !{!"0x1\00\000\0032768\0064\000\000\000", null, null, !6, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from double]
!49 = !{!8}
!50 = !{!51, !52, !53, !54, !55, !56, !57}
!51 = !{!"0x101\00ni\0016777260\000", !44, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 44]
!52 = !{!"0x101\00nj\0033554476\000", !44, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 44]
!53 = !{!"0x101\00A\0050331693\000", !44, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 45]
!54 = !{!"0x101\00R\0067108910\000", !44, !23, !47} ; [ DW_TAG_arg_variable ] [R] [line 46]
!55 = !{!"0x101\00Q\0083886127\000", !44, !23, !47} ; [ DW_TAG_arg_variable ] [Q] [line 47]
!56 = !{!"0x100\00i\0049\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 49]
!57 = !{!"0x100\00j\0049\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 49]
!58 = !{!"0x2e\00kernel_gramschmidt\00kernel_gramschmidt\00\0075\001\001\000\000\00256\001\0079", !1, !23, !45, null, null, null, null, !59} ; [ DW_TAG_subprogram ] [line 75] [local] [def] [scope 79] [kernel_gramschmidt]
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67, !68}
!60 = !{!"0x101\00ni\0016777291\000", !58, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 75]
!61 = !{!"0x101\00nj\0033554507\000", !58, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 75]
!62 = !{!"0x101\00A\0050331724\000", !58, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 76]
!63 = !{!"0x101\00R\0067108941\000", !58, !23, !47} ; [ DW_TAG_arg_variable ] [R] [line 77]
!64 = !{!"0x101\00Q\0083886158\000", !58, !23, !47} ; [ DW_TAG_arg_variable ] [Q] [line 78]
!65 = !{!"0x100\00i\0080\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 80]
!66 = !{!"0x100\00j\0080\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 80]
!67 = !{!"0x100\00k\0080\000", !58, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 80]
!68 = !{!"0x100\00nrm\0082\000", !58, !23, !6}    ; [ DW_TAG_auto_variable ] [nrm] [line 82]
!69 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !23, !45, null, null, null, null, !70} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!70 = !{!71, !72, !73, !74, !75, !76, !77}
!71 = !{!"0x101\00ni\0016777239\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!72 = !{!"0x101\00nj\0033554455\000", !69, !23, !26} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!73 = !{!"0x101\00A\0050331672\000", !69, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 24]
!74 = !{!"0x101\00R\0067108889\000", !69, !23, !47} ; [ DW_TAG_arg_variable ] [R] [line 25]
!75 = !{!"0x101\00Q\0083886106\000", !69, !23, !47} ; [ DW_TAG_arg_variable ] [Q] [line 26]
!76 = !{!"0x100\00i\0028\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!77 = !{!"0x100\00j\0028\000", !69, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!78 = !{i32 2, !"Dwarf Version", i32 4}
!79 = !{i32 2, !"Debug Info Version", i32 2}
!80 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!81 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!82 = !MDLocation(line: 107, column: 14, scope: !22)
!83 = !MDLocation(line: 107, column: 27, scope: !22)
!84 = !MDLocation(line: 110, column: 7, scope: !22)
!85 = !MDLocation(line: 111, column: 7, scope: !22)
!86 = !MDLocation(line: 114, column: 3, scope: !22)
!87 = !MDLocation(line: 115, column: 3, scope: !22)
!88 = !MDLocation(line: 116, column: 3, scope: !22)
!89 = !MDLocation(line: 120, column: 8, scope: !22)
!90 = !MDLocation(line: 122, column: 8, scope: !22)
!91 = !{!"0x101\00ni\0016777239\000", !69, !23, !26, !92} ; [ DW_TAG_arg_variable ] [ni] [line 23]
!92 = !MDLocation(line: 119, column: 3, scope: !22)
!93 = !MDLocation(line: 23, column: 21, scope: !69, inlinedAt: !92)
!94 = !{!"0x101\00nj\0033554455\000", !69, !23, !26, !92} ; [ DW_TAG_arg_variable ] [nj] [line 23]
!95 = !MDLocation(line: 23, column: 29, scope: !69, inlinedAt: !92)
!96 = !{!"0x100\00i\0028\000", !69, !23, !26, !92} ; [ DW_TAG_auto_variable ] [i] [line 28]
!97 = !MDLocation(line: 28, column: 7, scope: !69, inlinedAt: !92)
!98 = !MDLocation(line: 30, column: 3, scope: !99, inlinedAt: !92)
!99 = !{!"0xb\0030\003\0040", !1, !69}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!100 = !MDLocation(line: 32, column: 18, scope: !101, inlinedAt: !92)
!101 = !{!"0xb\0031\0030\0044", !1, !102}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!102 = !{!"0xb\0031\005\0043", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!103 = !{!"0xb\0031\005\0042", !1, !104}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!104 = !{!"0xb\0030\003\0041", !1, !99}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!105 = !MDLocation(line: 31, column: 5, scope: !103, inlinedAt: !92)
!106 = !MDLocation(line: 32, column: 32, scope: !101, inlinedAt: !92)
!107 = !MDLocation(line: 32, column: 17, scope: !101, inlinedAt: !92)
!108 = !MDLocation(line: 32, column: 7, scope: !101, inlinedAt: !92)
!109 = !{!110, !110, i64 0}
!110 = !{!"double", !111, i64 0}
!111 = !{!"omnipotent char", !112, i64 0}
!112 = !{!"Simple C/C++ TBAA"}
!113 = !MDLocation(line: 33, column: 32, scope: !101, inlinedAt: !92)
!114 = !MDLocation(line: 33, column: 18, scope: !101, inlinedAt: !92)
!115 = !MDLocation(line: 33, column: 17, scope: !101, inlinedAt: !92)
!116 = !MDLocation(line: 33, column: 7, scope: !101, inlinedAt: !92)
!117 = !MDLocation(line: 121, column: 8, scope: !22)
!118 = !MDLocation(line: 37, column: 18, scope: !119, inlinedAt: !92)
!119 = !{!"0xb\0036\005\0048", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!120 = !{!"0xb\0036\005\0047", !1, !121}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!121 = !{!"0xb\0035\003\0046", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!122 = !{!"0xb\0035\003\0045", !1, !69}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!123 = !MDLocation(line: 37, column: 33, scope: !119, inlinedAt: !92)
!124 = !MDLocation(line: 37, column: 32, scope: !119, inlinedAt: !92)
!125 = !MDLocation(line: 37, column: 17, scope: !119, inlinedAt: !92)
!126 = !MDLocation(line: 37, column: 7, scope: !119, inlinedAt: !92)
!127 = distinct !{!127, !128, !129}
!128 = !{!"llvm.loop.vectorize.width", i32 1}
!129 = !{!"llvm.loop.interleave.count", i32 1}
!130 = !MDLocation(line: 35, column: 3, scope: !122, inlinedAt: !92)
!131 = !MDLocation(line: 88, column: 7, scope: !132, inlinedAt: !136)
!132 = !{!"0xb\0088\007\0029", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!133 = !{!"0xb\0086\005\0028", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!134 = !{!"0xb\0085\003\0027", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!135 = !{!"0xb\0085\003\0026", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!136 = !MDLocation(line: 128, column: 3, scope: !22)
!137 = !MDLocation(line: 85, column: 3, scope: !135, inlinedAt: !136)
!138 = !MDLocation(line: 89, column: 16, scope: !139, inlinedAt: !136)
!139 = !{!"0xb\0088\007\0030", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!140 = !MDLocation(line: 89, column: 9, scope: !139, inlinedAt: !136)
!141 = !{!"0x100\00nrm\0082\000", !58, !23, !6, !136} ; [ DW_TAG_auto_variable ] [nrm] [line 82]
!142 = !MDLocation(line: 82, column: 13, scope: !58, inlinedAt: !136)
!143 = !MDLocation(line: 90, column: 17, scope: !133, inlinedAt: !136)
!144 = !MDLocation(line: 90, column: 7, scope: !133, inlinedAt: !136)
!145 = !{!"0x100\00i\0080\000", !58, !23, !26, !136} ; [ DW_TAG_auto_variable ] [i] [line 80]
!146 = !MDLocation(line: 80, column: 7, scope: !58, inlinedAt: !136)
!147 = !MDLocation(line: 92, column: 19, scope: !148, inlinedAt: !136)
!148 = !{!"0xb\0091\007\0032", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!149 = !{!"0xb\0091\007\0031", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!150 = !MDLocation(line: 92, column: 9, scope: !148, inlinedAt: !136)
!151 = !MDLocation(line: 91, column: 7, scope: !149, inlinedAt: !136)
!152 = !MDLocation(line: 92, column: 29, scope: !148, inlinedAt: !136)
!153 = !MDLocation(line: 93, column: 23, scope: !154, inlinedAt: !136)
!154 = !{!"0xb\0093\007\0034", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!155 = !{!"0xb\0093\007\0033", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!156 = !MDLocation(line: 93, column: 7, scope: !155, inlinedAt: !136)
!157 = !MDLocation(line: 95, column: 4, scope: !158, inlinedAt: !136)
!158 = !{!"0xb\0094\002\0035", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!159 = !MDLocation(line: 96, column: 4, scope: !160, inlinedAt: !136)
!160 = !{!"0xb\0096\004\0036", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!161 = !MDLocation(line: 97, column: 17, scope: !162, inlinedAt: !136)
!162 = !{!"0xb\0096\004\0037", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!163 = !MDLocation(line: 97, column: 27, scope: !162, inlinedAt: !136)
!164 = !MDLocation(line: 97, column: 6, scope: !162, inlinedAt: !136)
!165 = !MDLocation(line: 99, column: 16, scope: !166, inlinedAt: !136)
!166 = !{!"0xb\0098\004\0039", !1, !167}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!167 = !{!"0xb\0098\004\0038", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!168 = !MDLocation(line: 99, column: 26, scope: !166, inlinedAt: !136)
!169 = !MDLocation(line: 99, column: 6, scope: !166, inlinedAt: !136)
!170 = !MDLocation(line: 98, column: 4, scope: !167, inlinedAt: !136)
!171 = !MDLocation(line: 99, column: 36, scope: !166, inlinedAt: !136)
!172 = !MDLocation(line: 139, column: 3, scope: !39)
!173 = !MDLocation(line: 139, column: 3, scope: !22)
!174 = !MDLocation(line: 139, column: 3, scope: !38)
!175 = !MDLocation(line: 139, column: 3, scope: !42)
!176 = !MDLocation(line: 139, column: 3, scope: !177)
!177 = !{!"0xb\004", !1, !42}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!178 = !{!179, !179, i64 0}
!179 = !{!"any pointer", !111, i64 0}
!180 = !{!111, !111, i64 0}
!181 = !MDLocation(line: 54, column: 6, scope: !182, inlinedAt: !188)
!182 = !{!"0xb\0054\006\0013", !1, !183}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!183 = !{!"0xb\0052\0030\0012", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!184 = !{!"0xb\0052\005\0011", !1, !185}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!185 = !{!"0xb\0052\005\0010", !1, !186}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!186 = !{!"0xb\0051\003\009", !1, !187}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!187 = !{!"0xb\0051\003\008", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!188 = !MDLocation(line: 139, column: 3, scope: !189)
!189 = !{!"0xb\0023", !1, !39}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!190 = !MDLocation(line: 52, column: 5, scope: !185, inlinedAt: !188)
!191 = !MDLocation(line: 53, column: 11, scope: !183, inlinedAt: !188)
!192 = !MDLocation(line: 53, column: 41, scope: !183, inlinedAt: !188)
!193 = !MDLocation(line: 53, column: 2, scope: !183, inlinedAt: !188)
!194 = !MDLocation(line: 54, column: 6, scope: !183, inlinedAt: !188)
!195 = !MDLocation(line: 54, column: 28, scope: !196, inlinedAt: !188)
!196 = !{!"0xb\001", !1, !182}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!197 = !MDLocation(line: 54, column: 19, scope: !182, inlinedAt: !188)
!198 = !MDLocation(line: 51, column: 3, scope: !187, inlinedAt: !188)
!199 = !MDLocation(line: 56, column: 12, scope: !44, inlinedAt: !188)
!200 = !MDLocation(line: 56, column: 3, scope: !44, inlinedAt: !188)
!201 = !{!"0x100\00i\0049\000", !44, !23, !26, !188} ; [ DW_TAG_auto_variable ] [i] [line 49]
!202 = !MDLocation(line: 49, column: 7, scope: !44, inlinedAt: !188)
!203 = !MDLocation(line: 57, column: 3, scope: !204, inlinedAt: !188)
!204 = !{!"0xb\0057\003\0014", !1, !44}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!205 = !MDLocation(line: 60, column: 6, scope: !206, inlinedAt: !188)
!206 = !{!"0xb\0060\006\0019", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!207 = !{!"0xb\0058\0030\0018", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!208 = !{!"0xb\0058\005\0017", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!209 = !{!"0xb\0058\005\0016", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!210 = !{!"0xb\0057\003\0015", !1, !204}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!211 = !MDLocation(line: 58, column: 5, scope: !209, inlinedAt: !188)
!212 = !MDLocation(line: 59, column: 11, scope: !207, inlinedAt: !188)
!213 = !MDLocation(line: 59, column: 41, scope: !207, inlinedAt: !188)
!214 = !MDLocation(line: 59, column: 2, scope: !207, inlinedAt: !188)
!215 = !MDLocation(line: 60, column: 6, scope: !207, inlinedAt: !188)
!216 = !MDLocation(line: 60, column: 28, scope: !217, inlinedAt: !188)
!217 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!218 = !MDLocation(line: 60, column: 19, scope: !206, inlinedAt: !188)
!219 = !MDLocation(line: 62, column: 12, scope: !44, inlinedAt: !188)
!220 = !MDLocation(line: 62, column: 3, scope: !44, inlinedAt: !188)
!221 = !MDLocation(line: 63, column: 3, scope: !222, inlinedAt: !188)
!222 = !{!"0xb\0063\003\0020", !1, !44}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!223 = !MDLocation(line: 66, column: 6, scope: !224, inlinedAt: !188)
!224 = !{!"0xb\0066\006\0025", !1, !225}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!225 = !{!"0xb\0064\0030\0024", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!226 = !{!"0xb\0064\005\0023", !1, !227}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!227 = !{!"0xb\0064\005\0022", !1, !228}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!228 = !{!"0xb\0063\003\0021", !1, !222}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!229 = !MDLocation(line: 64, column: 5, scope: !227, inlinedAt: !188)
!230 = !MDLocation(line: 65, column: 11, scope: !225, inlinedAt: !188)
!231 = !MDLocation(line: 65, column: 41, scope: !225, inlinedAt: !188)
!232 = !MDLocation(line: 65, column: 2, scope: !225, inlinedAt: !188)
!233 = !MDLocation(line: 66, column: 6, scope: !225, inlinedAt: !188)
!234 = !MDLocation(line: 66, column: 28, scope: !235, inlinedAt: !188)
!235 = !{!"0xb\001", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/gramschmidt/gramschmidt.c]
!236 = !MDLocation(line: 66, column: 19, scope: !224, inlinedAt: !188)
!237 = !MDLocation(line: 68, column: 12, scope: !44, inlinedAt: !188)
!238 = !MDLocation(line: 68, column: 3, scope: !44, inlinedAt: !188)
!239 = !MDLocation(line: 142, column: 3, scope: !22)
!240 = !MDLocation(line: 143, column: 3, scope: !22)
!241 = !MDLocation(line: 144, column: 3, scope: !22)
!242 = !MDLocation(line: 146, column: 3, scope: !22)
