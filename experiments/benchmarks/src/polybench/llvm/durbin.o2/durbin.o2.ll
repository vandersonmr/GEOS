; ModuleID = 'durbin.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !85), !dbg !86
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !85), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !85), !dbg !88
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !89
  %call1 = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !90
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !91
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !92
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !93
  %call5 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !94
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !95
  %arraydecay6 = bitcast i8* %call1 to [4000 x double]*, !dbg !96
  %arraydecay7 = bitcast i8* %call2 to double*, !dbg !97
  %arraydecay8 = bitcast i8* %call3 to double*, !dbg !98
  %arraydecay9 = bitcast i8* %call4 to double*, !dbg !99
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !100, metadata !85), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !103, metadata !85), !dbg !104
  br label %for.body.i, !dbg !105

for.cond.loopexit.i:                              ; preds = %for.body14.i
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 4000, !dbg !105
  br i1 %exitcond5.i, label %init_array.exit, label %for.body.i, !dbg !105

for.body.i:                                       ; preds = %for.cond.loopexit.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.cond.loopexit.i ], !dbg !101
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !107
  %conv.i = sitofp i32 %0 to double, !dbg !107
  %arrayidx.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv3.i, !dbg !110
  store double %conv.i, double* %arrayidx.i, align 8, !dbg !110, !tbaa !111
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !105
  %1 = trunc i64 %indvars.iv.next4.i to i32, !dbg !115
  %div.i = sdiv i32 %1, 4000, !dbg !115
  %conv1.i = sitofp i32 %div.i to double, !dbg !115
  %div2.i = fmul double %conv1.i, 5.000000e-01, !dbg !115
  %arrayidx4.i = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv3.i, !dbg !116
  store double %div2.i, double* %arrayidx4.i, align 8, !dbg !116, !tbaa !111
  %div8.i = fmul double %conv1.i, 2.500000e-01, !dbg !117
  %arrayidx10.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv3.i, !dbg !118
  store double %div8.i, double* %arrayidx10.i, align 8, !dbg !118, !tbaa !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !119, metadata !85), !dbg !120
  br label %for.body14.i, !dbg !121

for.body14.i:                                     ; preds = %for.body14.i, %for.body.i
  %indvars.iv.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next.i.1, %for.body14.i ], !dbg !101
  %2 = trunc i64 %indvars.iv.i to i32, !dbg !123
  %conv16.i = sitofp i32 %2 to double, !dbg !123
  %mul.i = fmul double %conv.i, %conv16.i, !dbg !126
  %div18.i = fdiv double %mul.i, 4.000000e+03, !dbg !127
  %arrayidx22.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !128
  store double %div18.i, double* %arrayidx22.i, align 8, !dbg !128, !tbaa !111
  %arrayidx31.i = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv3.i, i64 %indvars.iv.i, !dbg !129
  store double %div18.i, double* %arrayidx31.i, align 8, !dbg !129, !tbaa !111
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !121
  %3 = trunc i64 %indvars.iv.next.i to i32, !dbg !123
  %conv16.i.1 = sitofp i32 %3 to double, !dbg !123
  %mul.i.1 = fmul double %conv.i, %conv16.i.1, !dbg !126
  %div18.i.1 = fdiv double %mul.i.1, 4.000000e+03, !dbg !127
  %arrayidx22.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !128
  store double %div18.i.1, double* %arrayidx22.i.1, align 8, !dbg !128, !tbaa !111
  %arrayidx31.i.1 = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv3.i, i64 %indvars.iv.next.i, !dbg !129
  store double %div18.i.1, double* %arrayidx31.i.1, align 8, !dbg !129, !tbaa !111
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !121
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4000, !dbg !121
  br i1 %exitcond.i.1, label %for.cond.loopexit.i, label %for.body14.i, !dbg !121

init_array.exit:                                  ; preds = %for.cond.loopexit.i
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !130, metadata !85), !dbg !132
  %4 = load double* %arraydecay9, align 8, !dbg !133, !tbaa !111
  %arrayidx2.i = bitcast i8* %call to double*, !dbg !134
  store double %4, double* %arrayidx2.i, align 8, !dbg !134, !tbaa !111
  store double 1.000000e+00, double* %arraydecay8, align 8, !dbg !135, !tbaa !111
  %5 = load double* %arraydecay9, align 8, !dbg !136, !tbaa !111
  store double %5, double* %arraydecay7, align 8, !dbg !137, !tbaa !111
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !138, metadata !85), !dbg !139
  br label %for.body28.lr.ph.i, !dbg !140

for.body28.lr.ph.i:                               ; preds = %for.end84.for.body_crit_edge.i, %init_array.exit
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end84.for.body_crit_edge.i ], [ 0, %init_array.exit ]
  %6 = phi double [ %.pre.i, %for.end84.for.body_crit_edge.i ], [ %5, %init_array.exit ], !dbg !131
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.end84.for.body_crit_edge.i ], [ 1, %init_array.exit ], !dbg !131
  %7 = add i32 %indvars.iv95, 1, !dbg !142
  %8 = add i32 %indvars.iv95, 1, !dbg !142
  %9 = add nsw i64 %indvars.iv20.i, -1, !dbg !142
  %arrayidx6.i = getelementptr inbounds double* %arraydecay8, i64 %9, !dbg !145
  %10 = load double* %arrayidx6.i, align 8, !dbg !145, !tbaa !111
  %mul.i91 = fmul double %6, %6, !dbg !146
  %mul16.i = fmul double %mul.i91, %10, !dbg !146
  %sub17.i = fsub double %10, %mul16.i, !dbg !145
  %arrayidx19.i = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv20.i, !dbg !147
  store double %sub17.i, double* %arrayidx19.i, align 8, !dbg !147, !tbaa !111
  %arrayidx21.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv20.i, !dbg !148
  %11 = load double* %arrayidx21.i, align 8, !dbg !148, !tbaa !111
  %arrayidx24.i = getelementptr inbounds [4000 x double]* %arraydecay6, i64 0, i64 %indvars.iv20.i, !dbg !149
  store double %11, double* %arrayidx24.i, align 8, !dbg !149, !tbaa !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !150, metadata !85), !dbg !151
  %xtraiter = and i32 %8, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %8, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body28.i.prol.preheader, label %for.body28.lr.ph.i.split

for.body28.i.prol.preheader:                      ; preds = %for.body28.lr.ph.i
  br label %for.body28.i.prol, !dbg !152

for.body28.i.prol:                                ; preds = %for.body28.i.prol.preheader, %for.body28.i.prol
  %12 = phi double [ %add.i.prol, %for.body28.i.prol ], [ %11, %for.body28.i.prol.preheader ], !dbg !155
  %indvars.iv7.i.prol = phi i64 [ %indvars.iv.next8.i.prol, %for.body28.i.prol ], [ 0, %for.body28.i.prol.preheader ], !dbg !131
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body28.i.prol ], [ %xtraiter, %for.body28.i.prol.preheader ]
  %13 = sub i64 %9, %indvars.iv7.i.prol, !dbg !152
  %arrayidx36.i.prol = getelementptr inbounds double* %arraydecay9, i64 %13, !dbg !156
  %14 = load double* %arrayidx36.i.prol, align 8, !dbg !156, !tbaa !111
  %arrayidx41.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv7.i.prol, i64 %9, !dbg !157
  %15 = load double* %arrayidx41.i.prol, align 8, !dbg !157, !tbaa !111
  %mul42.i.prol = fmul double %14, %15, !dbg !156
  %add.i.prol = fadd double %12, %mul42.i.prol, !dbg !155
  %indvars.iv.next8.i.prol = add nuw nsw i64 %indvars.iv7.i.prol, 1, !dbg !158
  %arrayidx47.i.prol = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv.next8.i.prol, i64 %indvars.iv20.i, !dbg !159
  store double %add.i.prol, double* %arrayidx47.i.prol, align 8, !dbg !159, !tbaa !111
  %lftr.wideiv.prol = trunc i64 %indvars.iv7.i.prol to i32, !dbg !158
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv95, !dbg !158
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !158
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !158
  br i1 %prol.iter.cmp, label %for.body28.i.prol, label %for.body28.lr.ph.i.split.loopexit, !llvm.loop !160

for.body28.lr.ph.i.split.loopexit:                ; preds = %for.body28.i.prol
  %.unr.ph = phi double [ %add.i.prol, %for.body28.i.prol ]
  %indvars.iv7.i.unr.ph = phi i64 [ %indvars.iv.next8.i.prol, %for.body28.i.prol ]
  br label %for.body28.lr.ph.i.split

for.body28.lr.ph.i.split:                         ; preds = %for.body28.lr.ph.i.split.loopexit, %for.body28.lr.ph.i
  %.unr = phi double [ %11, %for.body28.lr.ph.i ], [ %.unr.ph, %for.body28.lr.ph.i.split.loopexit ]
  %indvars.iv7.i.unr = phi i64 [ 0, %for.body28.lr.ph.i ], [ %indvars.iv7.i.unr.ph, %for.body28.lr.ph.i.split.loopexit ]
  %16 = icmp ult i32 %8, 2
  br i1 %16, label %for.body61.lr.ph.i, label %for.body28.lr.ph.i.split.split

for.body28.lr.ph.i.split.split:                   ; preds = %for.body28.lr.ph.i.split
  br label %for.body28.i, !dbg !158

for.body28.i:                                     ; preds = %for.body28.i, %for.body28.lr.ph.i.split.split
  %17 = phi double [ %.unr, %for.body28.lr.ph.i.split.split ], [ %add.i.1, %for.body28.i ], !dbg !155
  %indvars.iv7.i = phi i64 [ %indvars.iv7.i.unr, %for.body28.lr.ph.i.split.split ], [ %indvars.iv.next8.i.1, %for.body28.i ], !dbg !131
  %18 = sub i64 %9, %indvars.iv7.i, !dbg !152
  %arrayidx36.i = getelementptr inbounds double* %arraydecay9, i64 %18, !dbg !156
  %19 = load double* %arrayidx36.i, align 8, !dbg !156, !tbaa !111
  %arrayidx41.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %9, !dbg !157
  %20 = load double* %arrayidx41.i, align 8, !dbg !157, !tbaa !111
  %mul42.i = fmul double %19, %20, !dbg !156
  %add.i = fadd double %17, %mul42.i, !dbg !155
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !158
  %arrayidx47.i = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv.next8.i, i64 %indvars.iv20.i, !dbg !159
  store double %add.i, double* %arrayidx47.i, align 8, !dbg !159, !tbaa !111
  %lftr.wideiv = trunc i64 %indvars.iv7.i to i32, !dbg !158
  %21 = sub i64 %9, %indvars.iv.next8.i, !dbg !152
  %arrayidx36.i.1 = getelementptr inbounds double* %arraydecay9, i64 %21, !dbg !156
  %22 = load double* %arrayidx36.i.1, align 8, !dbg !156, !tbaa !111
  %arrayidx41.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next8.i, i64 %9, !dbg !157
  %23 = load double* %arrayidx41.i.1, align 8, !dbg !157, !tbaa !111
  %mul42.i.1 = fmul double %22, %23, !dbg !156
  %add.i.1 = fadd double %add.i, %mul42.i.1, !dbg !155
  %indvars.iv.next8.i.1 = add nuw nsw i64 %indvars.iv.next8.i, 1, !dbg !158
  %arrayidx47.i.1 = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv.next8.i.1, i64 %indvars.iv20.i, !dbg !159
  store double %add.i.1, double* %arrayidx47.i.1, align 8, !dbg !159, !tbaa !111
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next8.i to i32, !dbg !158
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %indvars.iv95, !dbg !158
  br i1 %exitcond.1, label %for.body61.lr.ph.i.unr-lcssa, label %for.body28.i, !dbg !158

for.body61.lr.ph.i.unr-lcssa:                     ; preds = %for.body28.i
  br label %for.body61.lr.ph.i

for.body61.lr.ph.i:                               ; preds = %for.body28.lr.ph.i.split, %for.body61.lr.ph.i.unr-lcssa
  %arrayidx51.i = getelementptr inbounds [4000 x double]* %arraydecay6, i64 %indvars.iv20.i, i64 %indvars.iv20.i, !dbg !162
  %24 = load double* %arrayidx51.i, align 8, !dbg !162, !tbaa !111
  %25 = load double* %arrayidx19.i, align 8, !dbg !163, !tbaa !111
  %26 = fmul double %24, %25, !dbg !164
  %mul55.i = fsub double -0.000000e+00, %26, !dbg !164
  %arrayidx57.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv20.i, !dbg !165
  store double %mul55.i, double* %arrayidx57.i, align 8, !dbg !165, !tbaa !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !150, metadata !85), !dbg !151
  %xtraiter99 = and i32 %7, 1
  %lcmp.mod100 = icmp ne i32 %xtraiter99, 0
  %lcmp.overflow101 = icmp eq i32 %7, 0
  %lcmp.or102 = or i1 %lcmp.overflow101, %lcmp.mod100
  br i1 %lcmp.or102, label %for.body61.i.prol.preheader, label %for.body61.lr.ph.i.split

for.body61.i.prol.preheader:                      ; preds = %for.body61.lr.ph.i
  br label %for.body61.i.prol, !dbg !166

for.body61.i.prol:                                ; preds = %for.body61.i.prol.preheader, %for.body61.i.prol
  %27 = phi double [ %.pre28.i.prol, %for.body61.i.prol ], [ %mul55.i, %for.body61.i.prol.preheader ], !dbg !131
  %indvars.iv13.i.prol = phi i64 [ %indvars.iv.next14.i.prol, %for.body61.i.prol ], [ 0, %for.body61.i.prol.preheader ], !dbg !131
  %prol.iter103 = phi i32 [ %prol.iter103.sub, %for.body61.i.prol ], [ %xtraiter99, %for.body61.i.prol.preheader ]
  %arrayidx66.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv13.i.prol, i64 %9, !dbg !166
  %28 = load double* %arrayidx66.i.prol, align 8, !dbg !166, !tbaa !111
  %29 = sub i64 %9, %indvars.iv13.i.prol, !dbg !169
  %arrayidx75.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %29, i64 %9, !dbg !170
  %30 = load double* %arrayidx75.i.prol, align 8, !dbg !170, !tbaa !111
  %mul76.i.prol = fmul double %27, %30, !dbg !171
  %add77.i.prol = fadd double %28, %mul76.i.prol, !dbg !166
  %arrayidx81.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv13.i.prol, i64 %indvars.iv20.i, !dbg !172
  store double %add77.i.prol, double* %arrayidx81.i.prol, align 8, !dbg !172, !tbaa !111
  %indvars.iv.next14.i.prol = add nuw nsw i64 %indvars.iv13.i.prol, 1, !dbg !173
  %.pre28.i.prol = load double* %arrayidx57.i, align 8, !dbg !174, !tbaa !111
  %lftr.wideiv97.prol = trunc i64 %indvars.iv13.i.prol to i32, !dbg !173
  %exitcond98.prol = icmp eq i32 %lftr.wideiv97.prol, %indvars.iv95, !dbg !173
  %prol.iter103.sub = sub i32 %prol.iter103, 1, !dbg !173
  %prol.iter103.cmp = icmp ne i32 %prol.iter103.sub, 0, !dbg !173
  br i1 %prol.iter103.cmp, label %for.body61.i.prol, label %for.body61.lr.ph.i.split.loopexit, !llvm.loop !175

for.body61.lr.ph.i.split.loopexit:                ; preds = %for.body61.i.prol
  %.pre28.i.lcssa.unr.ph = phi double [ %.pre28.i.prol, %for.body61.i.prol ]
  %.unr104.ph = phi double [ %.pre28.i.prol, %for.body61.i.prol ]
  %indvars.iv13.i.unr.ph = phi i64 [ %indvars.iv.next14.i.prol, %for.body61.i.prol ]
  br label %for.body61.lr.ph.i.split

for.body61.lr.ph.i.split:                         ; preds = %for.body61.lr.ph.i.split.loopexit, %for.body61.lr.ph.i
  %.pre28.i.lcssa.unr = phi double [ 0.000000e+00, %for.body61.lr.ph.i ], [ %.pre28.i.lcssa.unr.ph, %for.body61.lr.ph.i.split.loopexit ]
  %.unr104 = phi double [ %mul55.i, %for.body61.lr.ph.i ], [ %.unr104.ph, %for.body61.lr.ph.i.split.loopexit ]
  %indvars.iv13.i.unr = phi i64 [ 0, %for.body61.lr.ph.i ], [ %indvars.iv13.i.unr.ph, %for.body61.lr.ph.i.split.loopexit ]
  %31 = icmp ult i32 %7, 2
  br i1 %31, label %for.end84.i, label %for.body61.lr.ph.i.split.split

for.body61.lr.ph.i.split.split:                   ; preds = %for.body61.lr.ph.i.split
  br label %for.body61.i, !dbg !173

for.body61.i:                                     ; preds = %for.body61.i, %for.body61.lr.ph.i.split.split
  %32 = phi double [ %.unr104, %for.body61.lr.ph.i.split.split ], [ %.pre28.i.1, %for.body61.i ], !dbg !131
  %indvars.iv13.i = phi i64 [ %indvars.iv13.i.unr, %for.body61.lr.ph.i.split.split ], [ %indvars.iv.next14.i.1, %for.body61.i ], !dbg !131
  %arrayidx66.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv13.i, i64 %9, !dbg !166
  %33 = load double* %arrayidx66.i, align 8, !dbg !166, !tbaa !111
  %34 = sub i64 %9, %indvars.iv13.i, !dbg !169
  %arrayidx75.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %34, i64 %9, !dbg !170
  %35 = load double* %arrayidx75.i, align 8, !dbg !170, !tbaa !111
  %mul76.i = fmul double %32, %35, !dbg !171
  %add77.i = fadd double %33, %mul76.i, !dbg !166
  %arrayidx81.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv13.i, i64 %indvars.iv20.i, !dbg !172
  store double %add77.i, double* %arrayidx81.i, align 8, !dbg !172, !tbaa !111
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !173
  %.pre28.i = load double* %arrayidx57.i, align 8, !dbg !174, !tbaa !111
  %lftr.wideiv97 = trunc i64 %indvars.iv13.i to i32, !dbg !173
  %arrayidx66.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next14.i, i64 %9, !dbg !166
  %36 = load double* %arrayidx66.i.1, align 8, !dbg !166, !tbaa !111
  %37 = sub i64 %9, %indvars.iv.next14.i, !dbg !169
  %arrayidx75.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %37, i64 %9, !dbg !170
  %38 = load double* %arrayidx75.i.1, align 8, !dbg !170, !tbaa !111
  %mul76.i.1 = fmul double %.pre28.i, %38, !dbg !171
  %add77.i.1 = fadd double %36, %mul76.i.1, !dbg !166
  %arrayidx81.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next14.i, i64 %indvars.iv20.i, !dbg !172
  store double %add77.i.1, double* %arrayidx81.i.1, align 8, !dbg !172, !tbaa !111
  %indvars.iv.next14.i.1 = add nuw nsw i64 %indvars.iv.next14.i, 1, !dbg !173
  %.pre28.i.1 = load double* %arrayidx57.i, align 8, !dbg !174, !tbaa !111
  %lftr.wideiv97.1 = trunc i64 %indvars.iv.next14.i to i32, !dbg !173
  %exitcond98.1 = icmp eq i32 %lftr.wideiv97.1, %indvars.iv95, !dbg !173
  br i1 %exitcond98.1, label %for.end84.i.unr-lcssa, label %for.body61.i, !dbg !173

for.end84.i.unr-lcssa:                            ; preds = %for.body61.i
  %.pre28.i.lcssa.ph = phi double [ %.pre28.i.1, %for.body61.i ]
  br label %for.end84.i

for.end84.i:                                      ; preds = %for.body61.lr.ph.i.split, %for.end84.i.unr-lcssa
  %.pre28.i.lcssa = phi double [ %.pre28.i.lcssa.unr, %for.body61.lr.ph.i.split ], [ %.pre28.i.lcssa.ph, %for.end84.i.unr-lcssa ]
  %arrayidx90.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %indvars.iv20.i, !dbg !176
  store double %.pre28.i.lcssa, double* %arrayidx90.i, align 8, !dbg !176, !tbaa !111
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !140
  %exitcond25.i = icmp eq i64 %indvars.iv.next21.i, 4000, !dbg !140
  br i1 %exitcond25.i, label %for.body96.i.preheader, label %for.end84.for.body_crit_edge.i, !dbg !140

for.body96.i.preheader:                           ; preds = %for.end84.i
  %arraydecay15 = bitcast i8* %call5 to double*, !dbg !177
  br label %for.body96.i, !dbg !178

for.end84.for.body_crit_edge.i:                   ; preds = %for.end84.i
  %.pre.i = load double* %arrayidx57.i, align 8, !dbg !146, !tbaa !111
  %indvars.iv.next96 = add nuw i32 %indvars.iv95, 1, !dbg !140
  br label %for.body28.lr.ph.i, !dbg !140

for.body96.i:                                     ; preds = %for.body96.i, %for.body96.i.preheader
  %indvars.iv.i92 = phi i64 [ 0, %for.body96.i.preheader ], [ %indvars.iv.next.i93.4, %for.body96.i ], !dbg !131
  %arrayidx99.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.i92, i64 3999, !dbg !178
  %39 = load double* %arrayidx99.i, align 8, !dbg !178, !tbaa !111
  %arrayidx101.i = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.i92, !dbg !181
  store double %39, double* %arrayidx101.i, align 8, !dbg !181, !tbaa !111
  %indvars.iv.next.i93 = add nuw nsw i64 %indvars.iv.i92, 1, !dbg !182
  %arrayidx99.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next.i93, i64 3999, !dbg !178
  %40 = load double* %arrayidx99.i.1, align 8, !dbg !178, !tbaa !111
  %arrayidx101.i.1 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.next.i93, !dbg !181
  store double %40, double* %arrayidx101.i.1, align 8, !dbg !181, !tbaa !111
  %indvars.iv.next.i93.1 = add nuw nsw i64 %indvars.iv.next.i93, 1, !dbg !182
  %arrayidx99.i.2 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next.i93.1, i64 3999, !dbg !178
  %41 = load double* %arrayidx99.i.2, align 8, !dbg !178, !tbaa !111
  %arrayidx101.i.2 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.next.i93.1, !dbg !181
  store double %41, double* %arrayidx101.i.2, align 8, !dbg !181, !tbaa !111
  %indvars.iv.next.i93.2 = add nuw nsw i64 %indvars.iv.next.i93.1, 1, !dbg !182
  %arrayidx99.i.3 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next.i93.2, i64 3999, !dbg !178
  %42 = load double* %arrayidx99.i.3, align 8, !dbg !178, !tbaa !111
  %arrayidx101.i.3 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.next.i93.2, !dbg !181
  store double %42, double* %arrayidx101.i.3, align 8, !dbg !181, !tbaa !111
  %indvars.iv.next.i93.3 = add nuw nsw i64 %indvars.iv.next.i93.2, 1, !dbg !182
  %arrayidx99.i.4 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next.i93.3, i64 3999, !dbg !178
  %43 = load double* %arrayidx99.i.4, align 8, !dbg !178, !tbaa !111
  %arrayidx101.i.4 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.next.i93.3, !dbg !181
  store double %43, double* %arrayidx101.i.4, align 8, !dbg !181, !tbaa !111
  %indvars.iv.next.i93.4 = add nuw nsw i64 %indvars.iv.next.i93.3, 1, !dbg !182
  %exitcond.i94.4 = icmp eq i64 %indvars.iv.next.i93.4, 4000, !dbg !182
  br i1 %exitcond.i94.4, label %kernel_durbin.exit, label %for.body96.i, !dbg !182

kernel_durbin.exit:                               ; preds = %for.body96.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !183
  br i1 %cmp, label %if.end52, label %if.end59, !dbg !184

if.end52:                                         ; preds = %kernel_durbin.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !85), !dbg !185
  tail call void @llvm.dbg.value(metadata i8* %44, i64 0, metadata !46, metadata !85), !dbg !186
  %44 = load i8** %argv, align 8, !dbg !187, !tbaa !189
  %45 = load i8* %44, align 1, !dbg !187, !tbaa !191
  %phitmp = icmp eq i8 %45, 0, !dbg !185
  br i1 %phitmp, label %for.body.i88.preheader, label %if.end59, !dbg !184

for.body.i88.preheader:                           ; preds = %if.end52
  br label %for.body.i88, !dbg !192

for.body.i88:                                     ; preds = %for.body.i88.preheader, %for.inc.i
  %indvars.iv.i86 = phi i64 [ %indvars.iv.next.i89, %for.inc.i ], [ 0, %for.body.i88.preheader ], !dbg !196
  %46 = load %struct._IO_FILE** @stderr, align 8, !dbg !192, !tbaa !189
  %arrayidx.i87 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.i86, !dbg !198
  %47 = load double* %arrayidx.i87, align 8, !dbg !198, !tbaa !111
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %47) #5, !dbg !199
  %48 = trunc i64 %indvars.iv.i86 to i32, !dbg !200
  %rem.i = srem i32 %48, 20, !dbg !200
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !200
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !202

if.then.i:                                        ; preds = %for.body.i88
  %49 = load %struct._IO_FILE** @stderr, align 8, !dbg !203, !tbaa !189
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %49) #5, !dbg !205
  br label %for.inc.i, !dbg !205

for.inc.i:                                        ; preds = %if.then.i, %for.body.i88
  %indvars.iv.next.i89 = add nuw nsw i64 %indvars.iv.i86, 1, !dbg !206
  %exitcond.i90 = icmp eq i64 %indvars.iv.next.i89, 4000, !dbg !206
  br i1 %exitcond.i90, label %if.end59.loopexit, label %for.body.i88, !dbg !206

if.end59.loopexit:                                ; preds = %for.inc.i
  br label %if.end59

if.end59:                                         ; preds = %if.end59.loopexit, %if.end52, %kernel_durbin.exit
  tail call void @free(i8* %call) #4, !dbg !207
  tail call void @free(i8* %call1) #4, !dbg !208
  tail call void @free(i8* %call2) #4, !dbg !209
  tail call void @free(i8* %call3) #4, !dbg !210
  tail call void @free(i8* %call4) #4, !dbg !211
  tail call void @free(i8* %call5) #4, !dbg !212
  ret i32 0, !dbg !213
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

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c] [DW_LANG_C99]
!1 = !{!"durbin.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001024000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\004000"}                        ; [ DW_TAG_subrange_type ] [0, 3999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\00256000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin"}
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
!24 = !{!25, !49, !57, !70}
!25 = !{!"0x2e\00main\00main\00\0096\000\001\000\000\00256\001\0097", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 96] [def] [scope 97] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777312\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 96]
!34 = !{!"0x101\00argv\0033554528\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 96]
!35 = !{!"0x100\00n\0099\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 99]
!36 = !{!"0x100\00y\00102\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [y] [line 102]
!37 = !{!"0x100\00sum\00103\000", !25, !26, !4}   ; [ DW_TAG_auto_variable ] [sum] [line 103]
!38 = !{!"0x100\00alpha\00104\000", !25, !26, !9} ; [ DW_TAG_auto_variable ] [alpha] [line 104]
!39 = !{!"0x100\00beta\00105\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [beta] [line 105]
!40 = !{!"0x100\00r\00106\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [r] [line 106]
!41 = !{!"0x100\00out\00107\000", !25, !26, !9}   ; [ DW_TAG_auto_variable ] [out] [line 107]
!42 = !{!"0x100\00__s1_len\00136\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 136]
!43 = !{!"0xb\00136\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!44 = !{!"0xb\00136\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!45 = !{!"0x100\00__s2_len\00136\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 136]
!46 = !{!"0x100\00__s2\00136\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 136]
!47 = !{!"0xb\00136\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!48 = !{!"0x100\00__result\00136\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 136]
!49 = !{!"0x2e\00print_array\00print_array\00\0048\001\001\000\000\00256\001\0051", !1, !26, !50, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [scope 51] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !52}
!52 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!53 = !{!54, !55, !56}
!54 = !{!"0x101\00n\0016777264\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 48]
!55 = !{!"0x101\00out\0033554481\000", !49, !26, !52} ; [ DW_TAG_arg_variable ] [out] [line 49]
!56 = !{!"0x100\00i\0052\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 52]
!57 = !{!"0x2e\00kernel_durbin\00kernel_durbin\00\0064\001\001\000\000\00256\001\0071", !1, !26, !58, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 64] [local] [def] [scope 71] [kernel_durbin]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !29, !9, !9, !52, !52, !52, !52}
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69}
!61 = !{!"0x101\00n\0016777280\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 64]
!62 = !{!"0x101\00y\0033554497\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [y] [line 65]
!63 = !{!"0x101\00sum\0050331714\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 66]
!64 = !{!"0x101\00alpha\0067108931\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [alpha] [line 67]
!65 = !{!"0x101\00beta\0083886148\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [beta] [line 68]
!66 = !{!"0x101\00r\00100663365\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 69]
!67 = !{!"0x101\00out\00117440582\000", !57, !26, !52} ; [ DW_TAG_arg_variable ] [out] [line 70]
!68 = !{!"0x100\00i\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 72]
!69 = !{!"0x100\00k\0072\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 72]
!70 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !71, null, null, null, null, !73} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!71 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !72, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = !{null, !29, !9, !9, !52, !52, !52}
!73 = !{!74, !75, !76, !77, !78, !79, !80, !81}
!74 = !{!"0x101\00n\0016777239\000", !70, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!75 = !{!"0x101\00y\0033554456\000", !70, !26, !9} ; [ DW_TAG_arg_variable ] [y] [line 24]
!76 = !{!"0x101\00sum\0050331673\000", !70, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 25]
!77 = !{!"0x101\00alpha\0067108890\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [alpha] [line 26]
!78 = !{!"0x101\00beta\0083886107\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [beta] [line 27]
!79 = !{!"0x101\00r\00100663324\000", !70, !26, !52} ; [ DW_TAG_arg_variable ] [r] [line 28]
!80 = !{!"0x100\00i\0030\000", !70, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!81 = !{!"0x100\00j\0030\000", !70, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!82 = !{i32 2, !"Dwarf Version", i32 4}
!83 = !{i32 2, !"Debug Info Version", i32 2}
!84 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!85 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!86 = !MDLocation(line: 96, column: 14, scope: !25)
!87 = !MDLocation(line: 96, column: 27, scope: !25)
!88 = !MDLocation(line: 99, column: 7, scope: !25)
!89 = !MDLocation(line: 102, column: 3, scope: !25)
!90 = !MDLocation(line: 103, column: 3, scope: !25)
!91 = !MDLocation(line: 104, column: 3, scope: !25)
!92 = !MDLocation(line: 105, column: 3, scope: !25)
!93 = !MDLocation(line: 106, column: 3, scope: !25)
!94 = !MDLocation(line: 107, column: 3, scope: !25)
!95 = !MDLocation(line: 112, column: 8, scope: !25)
!96 = !MDLocation(line: 113, column: 8, scope: !25)
!97 = !MDLocation(line: 114, column: 8, scope: !25)
!98 = !MDLocation(line: 115, column: 8, scope: !25)
!99 = !MDLocation(line: 116, column: 8, scope: !25)
!100 = !{!"0x101\00n\0016777239\000", !70, !26, !29, !101} ; [ DW_TAG_arg_variable ] [n] [line 23]
!101 = !MDLocation(line: 111, column: 3, scope: !25)
!102 = !MDLocation(line: 23, column: 22, scope: !70, inlinedAt: !101)
!103 = !{!"0x100\00i\0030\000", !70, !26, !29, !101} ; [ DW_TAG_auto_variable ] [i] [line 30]
!104 = !MDLocation(line: 30, column: 7, scope: !70, inlinedAt: !101)
!105 = !MDLocation(line: 32, column: 3, scope: !106, inlinedAt: !101)
!106 = !{!"0xb\0032\003\0021", !1, !70}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!107 = !MDLocation(line: 34, column: 18, scope: !108, inlinedAt: !101)
!108 = !{!"0xb\0033\005\0023", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!109 = !{!"0xb\0032\003\0022", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!110 = !MDLocation(line: 34, column: 7, scope: !108, inlinedAt: !101)
!111 = !{!112, !112, i64 0}
!112 = !{!"double", !113, i64 0}
!113 = !{!"omnipotent char", !114, i64 0}
!114 = !{!"Simple C/C++ TBAA"}
!115 = !MDLocation(line: 35, column: 17, scope: !108, inlinedAt: !101)
!116 = !MDLocation(line: 35, column: 7, scope: !108, inlinedAt: !101)
!117 = !MDLocation(line: 36, column: 14, scope: !108, inlinedAt: !101)
!118 = !MDLocation(line: 36, column: 7, scope: !108, inlinedAt: !101)
!119 = !{!"0x100\00j\0030\000", !70, !26, !29, !101} ; [ DW_TAG_auto_variable ] [j] [line 30]
!120 = !MDLocation(line: 30, column: 10, scope: !70, inlinedAt: !101)
!121 = !MDLocation(line: 37, column: 7, scope: !122, inlinedAt: !101)
!122 = !{!"0xb\0037\007\0024", !1, !108}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!123 = !MDLocation(line: 38, column: 27, scope: !124, inlinedAt: !101)
!124 = !{!"0xb\0037\0031\0026", !1, !125}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!125 = !{!"0xb\0037\007\0025", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!126 = !MDLocation(line: 38, column: 13, scope: !124, inlinedAt: !101)
!127 = !MDLocation(line: 38, column: 12, scope: !124, inlinedAt: !101)
!128 = !MDLocation(line: 38, column: 2, scope: !124, inlinedAt: !101)
!129 = !MDLocation(line: 39, column: 2, scope: !124, inlinedAt: !101)
!130 = !{!"0x101\00n\0016777280\000", !57, !26, !29, !131} ; [ DW_TAG_arg_variable ] [n] [line 64]
!131 = !MDLocation(line: 122, column: 3, scope: !25)
!132 = !MDLocation(line: 64, column: 24, scope: !57, inlinedAt: !131)
!133 = !MDLocation(line: 75, column: 13, scope: !57, inlinedAt: !131)
!134 = !MDLocation(line: 75, column: 3, scope: !57, inlinedAt: !131)
!135 = !MDLocation(line: 76, column: 3, scope: !57, inlinedAt: !131)
!136 = !MDLocation(line: 77, column: 14, scope: !57, inlinedAt: !131)
!137 = !MDLocation(line: 77, column: 3, scope: !57, inlinedAt: !131)
!138 = !{!"0x100\00k\0072\000", !57, !26, !29, !131} ; [ DW_TAG_auto_variable ] [k] [line 72]
!139 = !MDLocation(line: 72, column: 10, scope: !57, inlinedAt: !131)
!140 = !MDLocation(line: 78, column: 3, scope: !141, inlinedAt: !131)
!141 = !{!"0xb\0078\003\0012", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!142 = !MDLocation(line: 80, column: 22, scope: !143, inlinedAt: !131)
!143 = !{!"0xb\0079\005\0014", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!144 = !{!"0xb\0078\003\0013", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!145 = !MDLocation(line: 80, column: 17, scope: !143, inlinedAt: !131)
!146 = !MDLocation(line: 80, column: 29, scope: !143, inlinedAt: !131)
!147 = !MDLocation(line: 80, column: 7, scope: !143, inlinedAt: !131)
!148 = !MDLocation(line: 81, column: 19, scope: !143, inlinedAt: !131)
!149 = !MDLocation(line: 81, column: 7, scope: !143, inlinedAt: !131)
!150 = !{!"0x100\00i\0072\000", !57, !26, !29, !131} ; [ DW_TAG_auto_variable ] [i] [line 72]
!151 = !MDLocation(line: 72, column: 7, scope: !57, inlinedAt: !131)
!152 = !MDLocation(line: 83, column: 30, scope: !153, inlinedAt: !131)
!153 = !{!"0xb\0082\007\0016", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!154 = !{!"0xb\0082\007\0015", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!155 = !MDLocation(line: 83, column: 16, scope: !153, inlinedAt: !131)
!156 = !MDLocation(line: 83, column: 28, scope: !153, inlinedAt: !131)
!157 = !MDLocation(line: 83, column: 39, scope: !153, inlinedAt: !131)
!158 = !MDLocation(line: 82, column: 7, scope: !154, inlinedAt: !131)
!159 = !MDLocation(line: 83, column: 2, scope: !153, inlinedAt: !131)
!160 = distinct !{!160, !161}
!161 = !{!"llvm.loop.unroll.disable"}
!162 = !MDLocation(line: 84, column: 19, scope: !143, inlinedAt: !131)
!163 = !MDLocation(line: 84, column: 31, scope: !143, inlinedAt: !131)
!164 = !MDLocation(line: 84, column: 18, scope: !143, inlinedAt: !131)
!165 = !MDLocation(line: 84, column: 7, scope: !143, inlinedAt: !131)
!166 = !MDLocation(line: 86, column: 12, scope: !167, inlinedAt: !131)
!167 = !{!"0xb\0085\007\0018", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!168 = !{!"0xb\0085\007\0017", !1, !143}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!169 = !MDLocation(line: 86, column: 37, scope: !167, inlinedAt: !131)
!170 = !MDLocation(line: 86, column: 35, scope: !167, inlinedAt: !131)
!171 = !MDLocation(line: 86, column: 24, scope: !167, inlinedAt: !131)
!172 = !MDLocation(line: 86, column: 2, scope: !167, inlinedAt: !131)
!173 = !MDLocation(line: 85, column: 7, scope: !168, inlinedAt: !131)
!174 = !MDLocation(line: 87, column: 17, scope: !143, inlinedAt: !131)
!175 = distinct !{!175, !161}
!176 = !MDLocation(line: 87, column: 7, scope: !143, inlinedAt: !131)
!177 = !MDLocation(line: 128, column: 4, scope: !25)
!178 = !MDLocation(line: 90, column: 14, scope: !179, inlinedAt: !131)
!179 = !{!"0xb\0089\003\0020", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!180 = !{!"0xb\0089\003\0019", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!181 = !MDLocation(line: 90, column: 5, scope: !179, inlinedAt: !131)
!182 = !MDLocation(line: 89, column: 3, scope: !180, inlinedAt: !131)
!183 = !MDLocation(line: 136, column: 3, scope: !44)
!184 = !MDLocation(line: 136, column: 3, scope: !25)
!185 = !MDLocation(line: 136, column: 3, scope: !43)
!186 = !MDLocation(line: 136, column: 3, scope: !47)
!187 = !MDLocation(line: 136, column: 3, scope: !188)
!188 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!189 = !{!190, !190, i64 0}
!190 = !{!"any pointer", !113, i64 0}
!191 = !{!113, !113, i64 0}
!192 = !MDLocation(line: 55, column: 14, scope: !193, inlinedAt: !196)
!193 = !{!"0xb\0054\0027\0010", !1, !194}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!194 = !{!"0xb\0054\003\009", !1, !195}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!195 = !{!"0xb\0054\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!196 = !MDLocation(line: 136, column: 3, scope: !197)
!197 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!198 = !MDLocation(line: 55, column: 44, scope: !193, inlinedAt: !196)
!199 = !MDLocation(line: 55, column: 5, scope: !193, inlinedAt: !196)
!200 = !MDLocation(line: 56, column: 9, scope: !201, inlinedAt: !196)
!201 = !{!"0xb\0056\009\0011", !1, !193}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!202 = !MDLocation(line: 56, column: 9, scope: !193, inlinedAt: !196)
!203 = !MDLocation(line: 56, column: 31, scope: !204, inlinedAt: !196)
!204 = !{!"0xb\001", !1, !201}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/durbin/durbin.c]
!205 = !MDLocation(line: 56, column: 22, scope: !201, inlinedAt: !196)
!206 = !MDLocation(line: 54, column: 3, scope: !195, inlinedAt: !196)
!207 = !MDLocation(line: 139, column: 3, scope: !25)
!208 = !MDLocation(line: 140, column: 3, scope: !25)
!209 = !MDLocation(line: 141, column: 3, scope: !25)
!210 = !MDLocation(line: 142, column: 3, scope: !25)
!211 = !MDLocation(line: 143, column: 3, scope: !25)
!212 = !MDLocation(line: 144, column: 3, scope: !25)
!213 = !MDLocation(line: 146, column: 3, scope: !25)
