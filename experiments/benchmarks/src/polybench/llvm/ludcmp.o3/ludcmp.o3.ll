; ModuleID = 'ludcmp.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !80), !dbg !81
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !80), !dbg !82
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !35, metadata !80), !dbg !83
  %call = tail call i8* @polybench_alloc_data(i32 1050625, i32 8) #4, !dbg !84
  %call1 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4, !dbg !85
  %call2 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4, !dbg !86
  %call3 = tail call i8* @polybench_alloc_data(i32 1025, i32 8) #4, !dbg !87
  %arraydecay = bitcast i8* %call to [1025 x double]*, !dbg !88
  %arraydecay4 = bitcast i8* %call1 to double*, !dbg !89
  %arraydecay5 = bitcast i8* %call2 to double*, !dbg !90
  %arraydecay6 = bitcast i8* %call3 to double*, !dbg !91
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !92, metadata !80), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !95, metadata !80), !dbg !96
  br label %for.body.i, !dbg !97

for.body.i:                                       ; preds = %for.body17.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.body17.i ], !dbg !93
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !97
  %0 = trunc i64 %indvars.iv.next4.i to i32, !dbg !99
  %conv.i = sitofp i32 %0 to double, !dbg !99
  %arrayidx.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv3.i, !dbg !102
  store double %conv.i, double* %arrayidx.i, align 8, !dbg !102, !tbaa !103
  %div.i = sdiv i32 %0, 1024, !dbg !107
  %conv2.i = sitofp i32 %div.i to double, !dbg !107
  %div3.i = fmul double %conv2.i, 5.000000e-01, !dbg !107
  %add4.i = fadd double %div3.i, 1.000000e+00, !dbg !107
  %arrayidx6.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv3.i, !dbg !108
  store double %add4.i, double* %arrayidx6.i, align 8, !dbg !108, !tbaa !103
  %add11.i = fadd double %div3.i, 4.200000e+01, !dbg !109
  %arrayidx13.i = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv3.i, !dbg !110
  store double %add11.i, double* %arrayidx13.i, align 8, !dbg !110, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !111, metadata !80), !dbg !112
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next, %vector.body ], !dbg !93
  %induction107108 = or i64 %index, 1, !dbg !93
  %1 = or i64 %index, 1, !dbg !113
  %2 = add nuw nsw i64 %induction107108, 1, !dbg !113
  %3 = trunc i64 %1 to i32, !dbg !115
  %4 = trunc i64 %2 to i32, !dbg !115
  %5 = sitofp i32 %3 to double, !dbg !115
  %6 = sitofp i32 %4 to double, !dbg !115
  %7 = fmul double %conv.i, %5, !dbg !118
  %8 = fmul double %conv.i, %6, !dbg !118
  %9 = fmul double %7, 9.765625e-04, !dbg !119
  %10 = fmul double %8, 9.765625e-04, !dbg !119
  %11 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !120
  %12 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction107108, !dbg !120
  store double %9, double* %11, align 8, !dbg !120, !tbaa !103
  store double %10, double* %12, align 8, !dbg !120, !tbaa !103
  %index.next = add i64 %index, 2, !dbg !93
  %13 = icmp eq i64 %index.next, 1024, !dbg !93
  br i1 %13, label %for.body17.i.preheader, label %vector.body, !dbg !93, !llvm.loop !121

for.body17.i.preheader:                           ; preds = %vector.body
  br label %for.body17.i, !dbg !113

for.body17.i:                                     ; preds = %for.body17.i.preheader
  %mul.i = fmul double %conv.i, 1.025000e+03, !dbg !118
  %div23.i = fmul double %mul.i, 9.765625e-04, !dbg !119
  %arrayidx27.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv3.i, i64 1024, !dbg !120
  store double %div23.i, double* %arrayidx27.i, align 8, !dbg !120, !tbaa !103
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1025, !dbg !97
  br i1 %exitcond5.i, label %init_array.exit, label %for.body.i, !dbg !97

init_array.exit:                                  ; preds = %for.body17.i
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !124, metadata !80), !dbg !126
  store double 1.000000e+00, double* %arraydecay4, align 8, !dbg !127, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !80), !dbg !129
  br label %for.body3.lr.ph.i, !dbg !130

for.cond.loopexit.i83:                            ; preds = %for.end54.i
  %indvars.iv.next70.i = add nuw nsw i64 %indvars.iv69.i, 1, !dbg !130
  %indvars.iv.next101 = add nuw nsw i32 %indvars.iv100, 1, !dbg !130
  %indvars.iv.next95 = add nsw i32 %indvars.iv94, 1, !dbg !130
  %exitcond78.i = icmp eq i64 %indvars.iv.next77.i, 1024, !dbg !130
  br i1 %exitcond78.i, label %for.end65.i, label %for.body3.lr.ph.i, !dbg !130

for.body3.lr.ph.i:                                ; preds = %for.cond.loopexit.i83, %init_array.exit
  %indvars.iv100 = phi i32 [ %indvars.iv.next101, %for.cond.loopexit.i83 ], [ 1, %init_array.exit ]
  %indvars.iv94 = phi i32 [ %indvars.iv.next95, %for.cond.loopexit.i83 ], [ -1, %init_array.exit ]
  %indvars.iv76.i = phi i64 [ %indvars.iv.next77.i, %for.cond.loopexit.i83 ], [ 0, %init_array.exit ], !dbg !125
  %indvars.iv69.i = phi i64 [ %indvars.iv.next70.i, %for.cond.loopexit.i83 ], [ 1, %init_array.exit ], !dbg !125
  %14 = add i64 %indvars.iv76.i, 1
  %15 = trunc i64 %14 to i32
  %16 = trunc i64 %indvars.iv76.i to i32
  %17 = mul i64 %indvars.iv76.i, -1, !dbg !130
  %18 = add i64 %17, 1024, !dbg !130
  %19 = trunc i64 %18 to i32
  %indvars.iv.next77.i = add nuw nsw i64 %indvars.iv76.i, 1, !dbg !130
  %cmp810.i = icmp sgt i64 %indvars.iv76.i, 0, !dbg !132
  %arrayidx21.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv76.i, i64 %indvars.iv76.i, !dbg !140
  br i1 %cmp810.i, label %for.body9.lr.ph.us.i.preheader, label %for.end.i.preheader, !dbg !125

for.end.i.preheader:                              ; preds = %for.body3.lr.ph.i
  %xtraiter115 = and i32 %19, 3
  %lcmp.mod116 = icmp ne i32 %xtraiter115, 0
  %lcmp.overflow117 = icmp eq i32 %19, 0
  %lcmp.or118 = or i1 %lcmp.overflow117, %lcmp.mod116
  br i1 %lcmp.or118, label %for.end.i.prol.preheader, label %for.end.i.preheader.split

for.end.i.prol.preheader:                         ; preds = %for.end.i.preheader
  br label %for.end.i.prol, !dbg !141

for.end.i.prol:                                   ; preds = %for.end.i.prol.preheader, %for.end.i.prol
  %indvars.iv41.i.prol = phi i64 [ %indvars.iv.next42.i.prol, %for.end.i.prol ], [ %indvars.iv69.i, %for.end.i.prol.preheader ], !dbg !125
  %prol.iter119 = phi i32 [ %prol.iter119.sub, %for.end.i.prol ], [ %xtraiter115, %for.end.i.prol.preheader ]
  %arrayidx6.i84.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv41.i.prol, i64 %indvars.iv76.i, !dbg !141
  %20 = load double* %arrayidx6.i84.prol, align 8, !dbg !141, !tbaa !103
  tail call void @llvm.dbg.value(metadata double %20, i64 0, metadata !142, metadata !80), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %21 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.i85.prol = fdiv double %20, %21, !dbg !146
  store double %div.i85.prol, double* %arrayidx6.i84.prol, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next42.i.prol = add nuw nsw i64 %indvars.iv41.i.prol, 1, !dbg !148
  %lftr.wideiv92.prol = trunc i64 %indvars.iv.next42.i.prol to i32, !dbg !148
  %exitcond93.prol = icmp eq i32 %lftr.wideiv92.prol, 1025, !dbg !148
  %prol.iter119.sub = sub i32 %prol.iter119, 1, !dbg !148
  %prol.iter119.cmp = icmp ne i32 %prol.iter119.sub, 0, !dbg !148
  br i1 %prol.iter119.cmp, label %for.end.i.prol, label %for.end.i.preheader.split.loopexit, !llvm.loop !149

for.end.i.preheader.split.loopexit:               ; preds = %for.end.i.prol
  %indvars.iv41.i.unr.ph = phi i64 [ %indvars.iv.next42.i.prol, %for.end.i.prol ]
  br label %for.end.i.preheader.split

for.end.i.preheader.split:                        ; preds = %for.end.i.preheader.split.loopexit, %for.end.i.preheader
  %indvars.iv41.i.unr = phi i64 [ %indvars.iv69.i, %for.end.i.preheader ], [ %indvars.iv41.i.unr.ph, %for.end.i.preheader.split.loopexit ]
  %22 = icmp ult i32 %19, 4
  br i1 %22, label %for.body40.lr.ph.i.preheader.loopexit109, label %for.end.i.preheader.split.split

for.end.i.preheader.split.split:                  ; preds = %for.end.i.preheader.split
  br label %for.end.i, !dbg !141

for.body9.lr.ph.us.i.preheader:                   ; preds = %for.body3.lr.ph.i
  br label %for.body9.lr.ph.us.i, !dbg !141

for.end.us.i.unr-lcssa:                           ; preds = %for.body9.us.i
  %sub.us.i.lcssa.ph = phi double [ %sub.us.i.1, %for.body9.us.i ]
  br label %for.end.us.i

for.end.us.i:                                     ; preds = %for.body9.lr.ph.us.i.split, %for.end.us.i.unr-lcssa
  %sub.us.i.lcssa = phi double [ %sub.us.i.lcssa.unr, %for.body9.lr.ph.us.i.split ], [ %sub.us.i.lcssa.ph, %for.end.us.i.unr-lcssa ]
  %23 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.us.i = fdiv double %sub.us.i.lcssa, %23, !dbg !146
  store double %div.us.i, double* %arrayidx6.us.i, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next66.i = add nuw nsw i64 %indvars.iv65.i, 1, !dbg !148
  %lftr.wideiv98 = trunc i64 %indvars.iv.next66.i to i32, !dbg !148
  %exitcond99 = icmp eq i32 %lftr.wideiv98, 1025, !dbg !148
  br i1 %exitcond99, label %for.body40.lr.ph.i.preheader.loopexit, label %for.body9.lr.ph.us.i, !dbg !148

for.body9.us.i:                                   ; preds = %for.body9.us.i, %for.body9.lr.ph.us.i.split.split
  %indvars.iv57.i = phi i64 [ %indvars.iv57.i.unr, %for.body9.lr.ph.us.i.split.split ], [ %indvars.iv.next58.i.1, %for.body9.us.i ], !dbg !125
  %w.012.us.i = phi double [ %w.012.us.i.unr, %for.body9.lr.ph.us.i.split.split ], [ %sub.us.i.1, %for.body9.us.i ], !dbg !125
  %arrayidx13.us.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv65.i, i64 %indvars.iv57.i, !dbg !151
  %24 = load double* %arrayidx13.us.i, align 8, !dbg !151, !tbaa !103
  %arrayidx17.us.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv57.i, i64 %indvars.iv76.i, !dbg !152
  %25 = load double* %arrayidx17.us.i, align 8, !dbg !152, !tbaa !103
  %mul.us.i = fmul double %24, %25, !dbg !151
  %sub.us.i = fsub double %w.012.us.i, %mul.us.i, !dbg !153
  tail call void @llvm.dbg.value(metadata double %sub.us.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next58.i = add nuw nsw i64 %indvars.iv57.i, 1, !dbg !154
  %lftr.wideiv96 = trunc i64 %indvars.iv57.i to i32, !dbg !154
  %arrayidx13.us.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv65.i, i64 %indvars.iv.next58.i, !dbg !151
  %26 = load double* %arrayidx13.us.i.1, align 8, !dbg !151, !tbaa !103
  %arrayidx17.us.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next58.i, i64 %indvars.iv76.i, !dbg !152
  %27 = load double* %arrayidx17.us.i.1, align 8, !dbg !152, !tbaa !103
  %mul.us.i.1 = fmul double %26, %27, !dbg !151
  %sub.us.i.1 = fsub double %sub.us.i, %mul.us.i.1, !dbg !153
  tail call void @llvm.dbg.value(metadata double %sub.us.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next58.i.1 = add nuw nsw i64 %indvars.iv.next58.i, 1, !dbg !154
  %lftr.wideiv96.1 = trunc i64 %indvars.iv.next58.i to i32, !dbg !154
  %exitcond97.1 = icmp eq i32 %lftr.wideiv96.1, %indvars.iv94, !dbg !154
  br i1 %exitcond97.1, label %for.end.us.i.unr-lcssa, label %for.body9.us.i, !dbg !154

for.body9.lr.ph.us.i:                             ; preds = %for.body9.lr.ph.us.i.preheader, %for.end.us.i
  %indvars.iv65.i = phi i64 [ %indvars.iv.next66.i, %for.end.us.i ], [ %indvars.iv69.i, %for.body9.lr.ph.us.i.preheader ], !dbg !125
  %arrayidx6.us.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv65.i, i64 %indvars.iv76.i, !dbg !141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %28 = load double* %arrayidx6.us.i, align 8, !dbg !141, !tbaa !103
  %xtraiter120 = and i32 %16, 1
  %lcmp.mod121 = icmp ne i32 %xtraiter120, 0
  %lcmp.overflow122 = icmp eq i32 %16, 0
  %lcmp.or123 = or i1 %lcmp.overflow122, %lcmp.mod121
  br i1 %lcmp.or123, label %for.body9.us.i.prol.preheader, label %for.body9.lr.ph.us.i.split

for.body9.us.i.prol.preheader:                    ; preds = %for.body9.lr.ph.us.i
  br label %for.body9.us.i.prol, !dbg !151

for.body9.us.i.prol:                              ; preds = %for.body9.us.i.prol.preheader, %for.body9.us.i.prol
  %indvars.iv57.i.prol = phi i64 [ %indvars.iv.next58.i.prol, %for.body9.us.i.prol ], [ 0, %for.body9.us.i.prol.preheader ], !dbg !125
  %w.012.us.i.prol = phi double [ %sub.us.i.prol, %for.body9.us.i.prol ], [ %28, %for.body9.us.i.prol.preheader ], !dbg !125
  %prol.iter124 = phi i32 [ %prol.iter124.sub, %for.body9.us.i.prol ], [ %xtraiter120, %for.body9.us.i.prol.preheader ]
  %arrayidx13.us.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv65.i, i64 %indvars.iv57.i.prol, !dbg !151
  %29 = load double* %arrayidx13.us.i.prol, align 8, !dbg !151, !tbaa !103
  %arrayidx17.us.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv57.i.prol, i64 %indvars.iv76.i, !dbg !152
  %30 = load double* %arrayidx17.us.i.prol, align 8, !dbg !152, !tbaa !103
  %mul.us.i.prol = fmul double %29, %30, !dbg !151
  %sub.us.i.prol = fsub double %w.012.us.i.prol, %mul.us.i.prol, !dbg !153
  tail call void @llvm.dbg.value(metadata double %sub.us.i.prol, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next58.i.prol = add nuw nsw i64 %indvars.iv57.i.prol, 1, !dbg !154
  %lftr.wideiv96.prol = trunc i64 %indvars.iv57.i.prol to i32, !dbg !154
  %exitcond97.prol = icmp eq i32 %lftr.wideiv96.prol, %indvars.iv94, !dbg !154
  %prol.iter124.sub = sub i32 %prol.iter124, 1, !dbg !154
  %prol.iter124.cmp = icmp ne i32 %prol.iter124.sub, 0, !dbg !154
  br i1 %prol.iter124.cmp, label %for.body9.us.i.prol, label %for.body9.lr.ph.us.i.split.loopexit, !llvm.loop !155

for.body9.lr.ph.us.i.split.loopexit:              ; preds = %for.body9.us.i.prol
  %sub.us.i.lcssa.unr.ph = phi double [ %sub.us.i.prol, %for.body9.us.i.prol ]
  %indvars.iv57.i.unr.ph = phi i64 [ %indvars.iv.next58.i.prol, %for.body9.us.i.prol ]
  %w.012.us.i.unr.ph = phi double [ %sub.us.i.prol, %for.body9.us.i.prol ]
  br label %for.body9.lr.ph.us.i.split

for.body9.lr.ph.us.i.split:                       ; preds = %for.body9.lr.ph.us.i.split.loopexit, %for.body9.lr.ph.us.i
  %sub.us.i.lcssa.unr = phi double [ 0.000000e+00, %for.body9.lr.ph.us.i ], [ %sub.us.i.lcssa.unr.ph, %for.body9.lr.ph.us.i.split.loopexit ]
  %indvars.iv57.i.unr = phi i64 [ 0, %for.body9.lr.ph.us.i ], [ %indvars.iv57.i.unr.ph, %for.body9.lr.ph.us.i.split.loopexit ]
  %w.012.us.i.unr = phi double [ %28, %for.body9.lr.ph.us.i ], [ %w.012.us.i.unr.ph, %for.body9.lr.ph.us.i.split.loopexit ]
  %31 = icmp ult i32 %16, 2
  br i1 %31, label %for.end.us.i, label %for.body9.lr.ph.us.i.split.split

for.body9.lr.ph.us.i.split.split:                 ; preds = %for.body9.lr.ph.us.i.split
  br label %for.body9.us.i, !dbg !154

for.end.i:                                        ; preds = %for.end.i, %for.end.i.preheader.split.split
  %indvars.iv41.i = phi i64 [ %indvars.iv41.i.unr, %for.end.i.preheader.split.split ], [ %indvars.iv.next42.i.3, %for.end.i ], !dbg !125
  %arrayidx6.i84 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv41.i, i64 %indvars.iv76.i, !dbg !141
  %32 = load double* %arrayidx6.i84, align 8, !dbg !141, !tbaa !103
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !142, metadata !80), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %33 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.i85 = fdiv double %32, %33, !dbg !146
  store double %div.i85, double* %arrayidx6.i84, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !148
  %lftr.wideiv92 = trunc i64 %indvars.iv.next42.i to i32, !dbg !148
  %arrayidx6.i84.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next42.i, i64 %indvars.iv76.i, !dbg !141
  %34 = load double* %arrayidx6.i84.1, align 8, !dbg !141, !tbaa !103
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !142, metadata !80), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %35 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.i85.1 = fdiv double %34, %35, !dbg !146
  store double %div.i85.1, double* %arrayidx6.i84.1, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next42.i.1 = add nuw nsw i64 %indvars.iv.next42.i, 1, !dbg !148
  %lftr.wideiv92.1 = trunc i64 %indvars.iv.next42.i.1 to i32, !dbg !148
  %arrayidx6.i84.2 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next42.i.1, i64 %indvars.iv76.i, !dbg !141
  %36 = load double* %arrayidx6.i84.2, align 8, !dbg !141, !tbaa !103
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !142, metadata !80), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %37 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.i85.2 = fdiv double %36, %37, !dbg !146
  store double %div.i85.2, double* %arrayidx6.i84.2, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next42.i.2 = add nuw nsw i64 %indvars.iv.next42.i.1, 1, !dbg !148
  %lftr.wideiv92.2 = trunc i64 %indvars.iv.next42.i.2 to i32, !dbg !148
  %arrayidx6.i84.3 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next42.i.2, i64 %indvars.iv76.i, !dbg !141
  %38 = load double* %arrayidx6.i84.3, align 8, !dbg !141, !tbaa !103
  tail call void @llvm.dbg.value(metadata double %32, i64 0, metadata !142, metadata !80), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %39 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !103
  %div.i85.3 = fdiv double %38, %39, !dbg !146
  store double %div.i85.3, double* %arrayidx6.i84.3, align 8, !dbg !147, !tbaa !103
  %indvars.iv.next42.i.3 = add nuw nsw i64 %indvars.iv.next42.i.2, 1, !dbg !148
  %lftr.wideiv92.3 = trunc i64 %indvars.iv.next42.i.3 to i32, !dbg !148
  %exitcond93.3 = icmp eq i32 %lftr.wideiv92.3, 1025, !dbg !148
  br i1 %exitcond93.3, label %for.body40.lr.ph.i.preheader.loopexit109.unr-lcssa, label %for.end.i, !dbg !148

for.body40.lr.ph.i.preheader.loopexit:            ; preds = %for.end.us.i
  br label %for.body40.lr.ph.i.preheader

for.body40.lr.ph.i.preheader.loopexit109.unr-lcssa: ; preds = %for.end.i
  br label %for.body40.lr.ph.i.preheader.loopexit109

for.body40.lr.ph.i.preheader.loopexit109:         ; preds = %for.end.i.preheader.split, %for.body40.lr.ph.i.preheader.loopexit109.unr-lcssa
  br label %for.body40.lr.ph.i.preheader

for.body40.lr.ph.i.preheader:                     ; preds = %for.body40.lr.ph.i.preheader.loopexit109, %for.body40.lr.ph.i.preheader.loopexit
  br label %for.body40.lr.ph.i, !dbg !156

for.body40.lr.ph.i:                               ; preds = %for.body40.lr.ph.i.preheader, %for.end54.i
  %indvars.iv53.i = phi i64 [ %indvars.iv.next54.i, %for.end54.i ], [ %indvars.iv69.i, %for.body40.lr.ph.i.preheader ], !dbg !125
  %arrayidx37.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next77.i, i64 %indvars.iv53.i, !dbg !156
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !144, metadata !80), !dbg !145
  %40 = load double* %arrayidx37.i, align 8, !dbg !156, !tbaa !103
  %xtraiter125 = and i32 %15, 1
  %lcmp.mod126 = icmp ne i32 %xtraiter125, 0
  %lcmp.overflow127 = icmp eq i32 %15, 0
  %lcmp.or128 = or i1 %lcmp.overflow127, %lcmp.mod126
  br i1 %lcmp.or128, label %for.body40.i.prol.preheader, label %for.body40.lr.ph.i.split

for.body40.i.prol.preheader:                      ; preds = %for.body40.lr.ph.i
  br label %for.body40.i.prol, !dbg !160

for.body40.i.prol:                                ; preds = %for.body40.i.prol.preheader, %for.body40.i.prol
  %indvars.iv45.i.prol = phi i64 [ %indvars.iv.next46.i.prol, %for.body40.i.prol ], [ 0, %for.body40.i.prol.preheader ], !dbg !125
  %w.118.i.prol = phi double [ %sub51.i.prol, %for.body40.i.prol ], [ %40, %for.body40.i.prol.preheader ], !dbg !125
  %prol.iter129 = phi i32 [ %prol.iter129.sub, %for.body40.i.prol ], [ %xtraiter125, %for.body40.i.prol.preheader ]
  %arrayidx45.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next77.i, i64 %indvars.iv45.i.prol, !dbg !160
  %41 = load double* %arrayidx45.i.prol, align 8, !dbg !160, !tbaa !103
  %arrayidx49.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv45.i.prol, i64 %indvars.iv53.i, !dbg !163
  %42 = load double* %arrayidx49.i.prol, align 8, !dbg !163, !tbaa !103
  %mul50.i.prol = fmul double %41, %42, !dbg !160
  %sub51.i.prol = fsub double %w.118.i.prol, %mul50.i.prol, !dbg !164
  tail call void @llvm.dbg.value(metadata double %sub51.i.prol, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next46.i.prol = add nuw nsw i64 %indvars.iv45.i.prol, 1, !dbg !165
  %lftr.wideiv102.prol = trunc i64 %indvars.iv.next46.i.prol to i32, !dbg !165
  %exitcond103.prol = icmp eq i32 %lftr.wideiv102.prol, %indvars.iv100, !dbg !165
  %prol.iter129.sub = sub i32 %prol.iter129, 1, !dbg !165
  %prol.iter129.cmp = icmp ne i32 %prol.iter129.sub, 0, !dbg !165
  br i1 %prol.iter129.cmp, label %for.body40.i.prol, label %for.body40.lr.ph.i.split.loopexit, !llvm.loop !166

for.body40.lr.ph.i.split.loopexit:                ; preds = %for.body40.i.prol
  %sub51.i.lcssa.unr.ph = phi double [ %sub51.i.prol, %for.body40.i.prol ]
  %indvars.iv45.i.unr.ph = phi i64 [ %indvars.iv.next46.i.prol, %for.body40.i.prol ]
  %w.118.i.unr.ph = phi double [ %sub51.i.prol, %for.body40.i.prol ]
  br label %for.body40.lr.ph.i.split

for.body40.lr.ph.i.split:                         ; preds = %for.body40.lr.ph.i.split.loopexit, %for.body40.lr.ph.i
  %sub51.i.lcssa.unr = phi double [ 0.000000e+00, %for.body40.lr.ph.i ], [ %sub51.i.lcssa.unr.ph, %for.body40.lr.ph.i.split.loopexit ]
  %indvars.iv45.i.unr = phi i64 [ 0, %for.body40.lr.ph.i ], [ %indvars.iv45.i.unr.ph, %for.body40.lr.ph.i.split.loopexit ]
  %w.118.i.unr = phi double [ %40, %for.body40.lr.ph.i ], [ %w.118.i.unr.ph, %for.body40.lr.ph.i.split.loopexit ]
  %43 = icmp ult i32 %15, 2
  br i1 %43, label %for.end54.i, label %for.body40.lr.ph.i.split.split

for.body40.lr.ph.i.split.split:                   ; preds = %for.body40.lr.ph.i.split
  br label %for.body40.i, !dbg !165

for.body40.i:                                     ; preds = %for.body40.i, %for.body40.lr.ph.i.split.split
  %indvars.iv45.i = phi i64 [ %indvars.iv45.i.unr, %for.body40.lr.ph.i.split.split ], [ %indvars.iv.next46.i.1, %for.body40.i ], !dbg !125
  %w.118.i = phi double [ %w.118.i.unr, %for.body40.lr.ph.i.split.split ], [ %sub51.i.1, %for.body40.i ], !dbg !125
  %arrayidx45.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next77.i, i64 %indvars.iv45.i, !dbg !160
  %44 = load double* %arrayidx45.i, align 8, !dbg !160, !tbaa !103
  %arrayidx49.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv45.i, i64 %indvars.iv53.i, !dbg !163
  %45 = load double* %arrayidx49.i, align 8, !dbg !163, !tbaa !103
  %mul50.i = fmul double %44, %45, !dbg !160
  %sub51.i = fsub double %w.118.i, %mul50.i, !dbg !164
  tail call void @llvm.dbg.value(metadata double %sub51.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next46.i = add nuw nsw i64 %indvars.iv45.i, 1, !dbg !165
  %lftr.wideiv102 = trunc i64 %indvars.iv.next46.i to i32, !dbg !165
  %arrayidx45.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next77.i, i64 %indvars.iv.next46.i, !dbg !160
  %46 = load double* %arrayidx45.i.1, align 8, !dbg !160, !tbaa !103
  %arrayidx49.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv.next46.i, i64 %indvars.iv53.i, !dbg !163
  %47 = load double* %arrayidx49.i.1, align 8, !dbg !163, !tbaa !103
  %mul50.i.1 = fmul double %46, %47, !dbg !160
  %sub51.i.1 = fsub double %sub51.i, %mul50.i.1, !dbg !164
  tail call void @llvm.dbg.value(metadata double %sub51.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next46.i.1 = add nuw nsw i64 %indvars.iv.next46.i, 1, !dbg !165
  %lftr.wideiv102.1 = trunc i64 %indvars.iv.next46.i.1 to i32, !dbg !165
  %exitcond103.1 = icmp eq i32 %lftr.wideiv102.1, %indvars.iv100, !dbg !165
  br i1 %exitcond103.1, label %for.end54.i.unr-lcssa, label %for.body40.i, !dbg !165

for.end54.i.unr-lcssa:                            ; preds = %for.body40.i
  %sub51.i.lcssa.ph = phi double [ %sub51.i.1, %for.body40.i ]
  br label %for.end54.i

for.end54.i:                                      ; preds = %for.body40.lr.ph.i.split, %for.end54.i.unr-lcssa
  %sub51.i.lcssa = phi double [ %sub51.i.lcssa.unr, %for.body40.lr.ph.i.split ], [ %sub51.i.lcssa.ph, %for.end54.i.unr-lcssa ]
  store double %sub51.i.lcssa, double* %arrayidx37.i, align 8, !dbg !167, !tbaa !103
  %indvars.iv.next54.i = add nuw nsw i64 %indvars.iv53.i, 1, !dbg !168
  %lftr.wideiv104 = trunc i64 %indvars.iv.next54.i to i32, !dbg !168
  %exitcond105 = icmp eq i32 %lftr.wideiv104, 1025, !dbg !168
  br i1 %exitcond105, label %for.cond.loopexit.i83, label %for.body40.lr.ph.i, !dbg !168

for.end65.i:                                      ; preds = %for.cond.loopexit.i83
  %48 = load double* %arraydecay4, align 8, !dbg !169, !tbaa !103
  store double %48, double* %arraydecay6, align 8, !dbg !170, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !128, metadata !80), !dbg !129
  br label %for.body75.lr.ph.i, !dbg !171

for.body75.lr.ph.i:                               ; preds = %for.end86.i, %for.end65.i
  %indvar = phi i32 [ %indvar.next, %for.end86.i ], [ 0, %for.end65.i ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.end86.i ], [ 1, %for.end65.i ]
  %indvars.iv36.i = phi i64 [ %indvars.iv.next37.i, %for.end86.i ], [ 1, %for.end65.i ], !dbg !125
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !173, metadata !80), !dbg !174
  %49 = add i32 %indvar, 1, !dbg !175
  %arrayidx72.i = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv36.i, !dbg !175
  %50 = load double* %arrayidx72.i, align 8, !dbg !175, !tbaa !103
  %xtraiter110 = and i32 %49, 1
  %lcmp.mod111 = icmp ne i32 %xtraiter110, 0
  %lcmp.overflow112 = icmp eq i32 %49, 0
  %lcmp.or113 = or i1 %lcmp.overflow112, %lcmp.mod111
  br i1 %lcmp.or113, label %for.body75.i.prol.preheader, label %for.body75.lr.ph.i.split

for.body75.i.prol.preheader:                      ; preds = %for.body75.lr.ph.i
  br label %for.body75.i.prol, !dbg !178

for.body75.i.prol:                                ; preds = %for.body75.i.prol.preheader, %for.body75.i.prol
  %indvars.iv30.i.prol = phi i64 [ %indvars.iv.next31.i.prol, %for.body75.i.prol ], [ 0, %for.body75.i.prol.preheader ], !dbg !125
  %w.27.i.prol = phi double [ %sub83.i.prol, %for.body75.i.prol ], [ %50, %for.body75.i.prol.preheader ], !dbg !125
  %prol.iter114 = phi i32 [ %prol.iter114.sub, %for.body75.i.prol ], [ %xtraiter110, %for.body75.i.prol.preheader ]
  %arrayidx79.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv36.i, i64 %indvars.iv30.i.prol, !dbg !178
  %51 = load double* %arrayidx79.i.prol, align 8, !dbg !178, !tbaa !103
  %arrayidx81.i.prol = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv30.i.prol, !dbg !181
  %52 = load double* %arrayidx81.i.prol, align 8, !dbg !181, !tbaa !103
  %mul82.i.prol = fmul double %51, %52, !dbg !178
  %sub83.i.prol = fsub double %w.27.i.prol, %mul82.i.prol, !dbg !182
  tail call void @llvm.dbg.value(metadata double %sub83.i.prol, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next31.i.prol = add nuw nsw i64 %indvars.iv30.i.prol, 1, !dbg !183
  %lftr.wideiv90.prol = trunc i64 %indvars.iv.next31.i.prol to i32, !dbg !183
  %exitcond91.prol = icmp eq i32 %lftr.wideiv90.prol, %indvars.iv, !dbg !183
  %prol.iter114.sub = sub i32 %prol.iter114, 1, !dbg !183
  %prol.iter114.cmp = icmp ne i32 %prol.iter114.sub, 0, !dbg !183
  br i1 %prol.iter114.cmp, label %for.body75.i.prol, label %for.body75.lr.ph.i.split.loopexit, !llvm.loop !184

for.body75.lr.ph.i.split.loopexit:                ; preds = %for.body75.i.prol
  %sub83.i.lcssa.unr.ph = phi double [ %sub83.i.prol, %for.body75.i.prol ]
  %indvars.iv30.i.unr.ph = phi i64 [ %indvars.iv.next31.i.prol, %for.body75.i.prol ]
  %w.27.i.unr.ph = phi double [ %sub83.i.prol, %for.body75.i.prol ]
  br label %for.body75.lr.ph.i.split

for.body75.lr.ph.i.split:                         ; preds = %for.body75.lr.ph.i.split.loopexit, %for.body75.lr.ph.i
  %sub83.i.lcssa.unr = phi double [ 0.000000e+00, %for.body75.lr.ph.i ], [ %sub83.i.lcssa.unr.ph, %for.body75.lr.ph.i.split.loopexit ]
  %indvars.iv30.i.unr = phi i64 [ 0, %for.body75.lr.ph.i ], [ %indvars.iv30.i.unr.ph, %for.body75.lr.ph.i.split.loopexit ]
  %w.27.i.unr = phi double [ %50, %for.body75.lr.ph.i ], [ %w.27.i.unr.ph, %for.body75.lr.ph.i.split.loopexit ]
  %53 = icmp ult i32 %49, 2
  br i1 %53, label %for.end86.i, label %for.body75.lr.ph.i.split.split

for.body75.lr.ph.i.split.split:                   ; preds = %for.body75.lr.ph.i.split
  br label %for.body75.i, !dbg !183

for.body75.i:                                     ; preds = %for.body75.i, %for.body75.lr.ph.i.split.split
  %indvars.iv30.i = phi i64 [ %indvars.iv30.i.unr, %for.body75.lr.ph.i.split.split ], [ %indvars.iv.next31.i.1, %for.body75.i ], !dbg !125
  %w.27.i = phi double [ %w.27.i.unr, %for.body75.lr.ph.i.split.split ], [ %sub83.i.1, %for.body75.i ], !dbg !125
  %arrayidx79.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv36.i, i64 %indvars.iv30.i, !dbg !178
  %54 = load double* %arrayidx79.i, align 8, !dbg !178, !tbaa !103
  %arrayidx81.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv30.i, !dbg !181
  %55 = load double* %arrayidx81.i, align 8, !dbg !181, !tbaa !103
  %mul82.i = fmul double %54, %55, !dbg !178
  %sub83.i = fsub double %w.27.i, %mul82.i, !dbg !182
  tail call void @llvm.dbg.value(metadata double %sub83.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next31.i = add nuw nsw i64 %indvars.iv30.i, 1, !dbg !183
  %lftr.wideiv90 = trunc i64 %indvars.iv.next31.i to i32, !dbg !183
  %arrayidx79.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %indvars.iv36.i, i64 %indvars.iv.next31.i, !dbg !178
  %56 = load double* %arrayidx79.i.1, align 8, !dbg !178, !tbaa !103
  %arrayidx81.i.1 = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv.next31.i, !dbg !181
  %57 = load double* %arrayidx81.i.1, align 8, !dbg !181, !tbaa !103
  %mul82.i.1 = fmul double %56, %57, !dbg !178
  %sub83.i.1 = fsub double %sub83.i, %mul82.i.1, !dbg !182
  tail call void @llvm.dbg.value(metadata double %sub83.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next31.i.1 = add nuw nsw i64 %indvars.iv.next31.i, 1, !dbg !183
  %lftr.wideiv90.1 = trunc i64 %indvars.iv.next31.i.1 to i32, !dbg !183
  %exitcond91.1 = icmp eq i32 %lftr.wideiv90.1, %indvars.iv, !dbg !183
  br i1 %exitcond91.1, label %for.end86.i.unr-lcssa, label %for.body75.i, !dbg !183

for.end86.i.unr-lcssa:                            ; preds = %for.body75.i
  %sub83.i.lcssa.ph = phi double [ %sub83.i.1, %for.body75.i ]
  br label %for.end86.i

for.end86.i:                                      ; preds = %for.body75.lr.ph.i.split, %for.end86.i.unr-lcssa
  %sub83.i.lcssa = phi double [ %sub83.i.lcssa.unr, %for.body75.lr.ph.i.split ], [ %sub83.i.lcssa.ph, %for.end86.i.unr-lcssa ]
  %arrayidx88.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv36.i, !dbg !185
  store double %sub83.i.lcssa, double* %arrayidx88.i, align 8, !dbg !185, !tbaa !103
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1, !dbg !171
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !171
  tail call void @llvm.dbg.value(metadata i32 %indvars.iv.next, i64 0, metadata !128, metadata !80), !dbg !129
  %exitcond38.i = icmp eq i64 %indvars.iv.next37.i, 1025, !dbg !171
  %indvar.next = add i32 %indvar, 1, !dbg !171
  br i1 %exitcond38.i, label %for.end91.i, label %for.body75.lr.ph.i, !dbg !171

for.end91.i:                                      ; preds = %for.end86.i
  %arrayidx93.i = getelementptr inbounds i8* %call3, i64 8192, !dbg !186
  %58 = bitcast i8* %arrayidx93.i to double*, !dbg !186
  %59 = load double* %58, align 8, !dbg !186, !tbaa !103
  %arrayidx97.i = getelementptr inbounds i8* %call, i64 8404992, !dbg !187
  %60 = bitcast i8* %arrayidx97.i to double*, !dbg !187
  %61 = load double* %60, align 8, !dbg !187, !tbaa !103
  %div98.i = fdiv double %59, %61, !dbg !186
  %arrayidx100.i = getelementptr inbounds i8* %call2, i64 8192, !dbg !188
  %62 = bitcast i8* %arrayidx100.i to double*, !dbg !188
  store double %div98.i, double* %62, align 8, !dbg !188, !tbaa !103
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !80), !dbg !129
  br label %for.body112.lr.ph.i, !dbg !189

for.body112.lr.ph.i:                              ; preds = %for.end125.i, %for.end91.i
  %indvars.iv25.i = phi i64 [ 0, %for.end91.i ], [ %indvars.iv.next26.i, %for.end125.i ], !dbg !125
  %indvars.iv.i86 = phi i64 [ 1024, %for.end91.i ], [ %indvars.iv.next.i88, %for.end125.i ], !dbg !125
  %63 = add i64 %indvars.iv25.i, 1, !dbg !191
  %64 = trunc i64 %63 to i32
  %65 = sub nsw i64 1023, %indvars.iv25.i, !dbg !191
  %arrayidx108.i = getelementptr inbounds double* %arraydecay6, i64 %65, !dbg !194
  %66 = load double* %arrayidx108.i, align 8, !dbg !194, !tbaa !103
  %xtraiter = and i32 %64, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %64, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body112.i.prol.preheader, label %for.body112.lr.ph.i.split

for.body112.i.prol.preheader:                     ; preds = %for.body112.lr.ph.i
  br label %for.body112.i.prol, !dbg !195

for.body112.i.prol:                               ; preds = %for.body112.i.prol.preheader, %for.body112.i.prol
  %indvars.iv23.i.prol = phi i64 [ %indvars.iv.next24.i.prol, %for.body112.i.prol ], [ %indvars.iv.i86, %for.body112.i.prol.preheader ], !dbg !125
  %w.33.i.prol = phi double [ %sub122.i.prol, %for.body112.i.prol ], [ %66, %for.body112.i.prol.preheader ], !dbg !125
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body112.i.prol ], [ %xtraiter, %for.body112.i.prol.preheader ]
  %arrayidx118.i.prol = getelementptr inbounds [1025 x double]* %arraydecay, i64 %65, i64 %indvars.iv23.i.prol, !dbg !195
  %67 = load double* %arrayidx118.i.prol, align 8, !dbg !195, !tbaa !103
  %arrayidx120.i.prol = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv23.i.prol, !dbg !198
  %68 = load double* %arrayidx120.i.prol, align 8, !dbg !198, !tbaa !103
  %mul121.i.prol = fmul double %67, %68, !dbg !195
  %sub122.i.prol = fsub double %w.33.i.prol, %mul121.i.prol, !dbg !199
  tail call void @llvm.dbg.value(metadata double %sub122.i.prol, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next24.i.prol = add nuw nsw i64 %indvars.iv23.i.prol, 1, !dbg !200
  %lftr.wideiv.prol = trunc i64 %indvars.iv.next24.i.prol to i32, !dbg !200
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, 1025, !dbg !200
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !200
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !200
  br i1 %prol.iter.cmp, label %for.body112.i.prol, label %for.body112.lr.ph.i.split.loopexit, !llvm.loop !201

for.body112.lr.ph.i.split.loopexit:               ; preds = %for.body112.i.prol
  %sub122.i.lcssa.unr.ph = phi double [ %sub122.i.prol, %for.body112.i.prol ]
  %indvars.iv23.i.unr.ph = phi i64 [ %indvars.iv.next24.i.prol, %for.body112.i.prol ]
  %w.33.i.unr.ph = phi double [ %sub122.i.prol, %for.body112.i.prol ]
  br label %for.body112.lr.ph.i.split

for.body112.lr.ph.i.split:                        ; preds = %for.body112.lr.ph.i.split.loopexit, %for.body112.lr.ph.i
  %sub122.i.lcssa.unr = phi double [ 0.000000e+00, %for.body112.lr.ph.i ], [ %sub122.i.lcssa.unr.ph, %for.body112.lr.ph.i.split.loopexit ]
  %indvars.iv23.i.unr = phi i64 [ %indvars.iv.i86, %for.body112.lr.ph.i ], [ %indvars.iv23.i.unr.ph, %for.body112.lr.ph.i.split.loopexit ]
  %w.33.i.unr = phi double [ %66, %for.body112.lr.ph.i ], [ %w.33.i.unr.ph, %for.body112.lr.ph.i.split.loopexit ]
  %69 = icmp ult i32 %64, 2
  br i1 %69, label %for.end125.i, label %for.body112.lr.ph.i.split.split

for.body112.lr.ph.i.split.split:                  ; preds = %for.body112.lr.ph.i.split
  br label %for.body112.i, !dbg !200

for.body112.i:                                    ; preds = %for.body112.i, %for.body112.lr.ph.i.split.split
  %indvars.iv23.i = phi i64 [ %indvars.iv23.i.unr, %for.body112.lr.ph.i.split.split ], [ %indvars.iv.next24.i.1, %for.body112.i ], !dbg !125
  %w.33.i = phi double [ %w.33.i.unr, %for.body112.lr.ph.i.split.split ], [ %sub122.i.1, %for.body112.i ], !dbg !125
  %arrayidx118.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %65, i64 %indvars.iv23.i, !dbg !195
  %70 = load double* %arrayidx118.i, align 8, !dbg !195, !tbaa !103
  %arrayidx120.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv23.i, !dbg !198
  %71 = load double* %arrayidx120.i, align 8, !dbg !198, !tbaa !103
  %mul121.i = fmul double %70, %71, !dbg !195
  %sub122.i = fsub double %w.33.i, %mul121.i, !dbg !199
  tail call void @llvm.dbg.value(metadata double %sub122.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !200
  %lftr.wideiv = trunc i64 %indvars.iv.next24.i to i32, !dbg !200
  %arrayidx118.i.1 = getelementptr inbounds [1025 x double]* %arraydecay, i64 %65, i64 %indvars.iv.next24.i, !dbg !195
  %72 = load double* %arrayidx118.i.1, align 8, !dbg !195, !tbaa !103
  %arrayidx120.i.1 = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv.next24.i, !dbg !198
  %73 = load double* %arrayidx120.i.1, align 8, !dbg !198, !tbaa !103
  %mul121.i.1 = fmul double %72, %73, !dbg !195
  %sub122.i.1 = fsub double %sub122.i, %mul121.i.1, !dbg !199
  tail call void @llvm.dbg.value(metadata double %sub122.i, i64 0, metadata !142, metadata !80), !dbg !143
  %indvars.iv.next24.i.1 = add nuw nsw i64 %indvars.iv.next24.i, 1, !dbg !200
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next24.i.1 to i32, !dbg !200
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1025, !dbg !200
  br i1 %exitcond.1, label %for.end125.i.unr-lcssa, label %for.body112.i, !dbg !200

for.end125.i.unr-lcssa:                           ; preds = %for.body112.i
  %sub122.i.lcssa.ph = phi double [ %sub122.i.1, %for.body112.i ]
  br label %for.end125.i

for.end125.i:                                     ; preds = %for.body112.lr.ph.i.split, %for.end125.i.unr-lcssa
  %sub122.i.lcssa = phi double [ %sub122.i.lcssa.unr, %for.body112.lr.ph.i.split ], [ %sub122.i.lcssa.ph, %for.end125.i.unr-lcssa ]
  %arrayidx133.i = getelementptr inbounds [1025 x double]* %arraydecay, i64 %65, i64 %65, !dbg !202
  %74 = load double* %arrayidx133.i, align 8, !dbg !202, !tbaa !103
  %div134.i = fdiv double %sub122.i.lcssa, %74, !dbg !203
  %arrayidx138.i = getelementptr inbounds double* %arraydecay5, i64 %65, !dbg !204
  store double %div134.i, double* %arrayidx138.i, align 8, !dbg !204, !tbaa !103
  %indvars.iv.next26.i = add nuw nsw i64 %indvars.iv25.i, 1, !dbg !189
  %indvars.iv.next.i88 = add nsw i64 %indvars.iv.i86, -1, !dbg !189
  %exitcond29.i = icmp eq i64 %indvars.iv.next26.i, 1024, !dbg !189
  br i1 %exitcond29.i, label %kernel_ludcmp.exit, label %for.body112.lr.ph.i, !dbg !189

kernel_ludcmp.exit:                               ; preds = %for.end125.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !205
  br i1 %cmp, label %if.end47, label %if.end54, !dbg !206

if.end47:                                         ; preds = %kernel_ludcmp.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !80), !dbg !207
  tail call void @llvm.dbg.value(metadata i8* %75, i64 0, metadata !44, metadata !80), !dbg !208
  %75 = load i8** %argv, align 8, !dbg !209, !tbaa !211
  %76 = load i8* %75, align 1, !dbg !209, !tbaa !213
  %phitmp = icmp eq i8 %76, 0, !dbg !207
  br i1 %phitmp, label %for.body.i80.preheader, label %if.end54, !dbg !206

for.body.i80.preheader:                           ; preds = %if.end47
  br label %for.body.i80, !dbg !214

for.body.i80:                                     ; preds = %for.body.i80.preheader, %for.inc.i
  %indvars.iv.i78 = phi i64 [ %indvars.iv.next.i81, %for.inc.i ], [ 0, %for.body.i80.preheader ], !dbg !218
  %77 = load %struct._IO_FILE** @stderr, align 8, !dbg !214, !tbaa !211
  %arrayidx.i79 = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv.i78, !dbg !220
  %78 = load double* %arrayidx.i79, align 8, !dbg !220, !tbaa !103
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %78) #5, !dbg !221
  %79 = trunc i64 %indvars.iv.i78 to i32, !dbg !222
  %rem.i = srem i32 %79, 20, !dbg !222
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !222
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !224

if.then.i:                                        ; preds = %for.body.i80
  %80 = load %struct._IO_FILE** @stderr, align 8, !dbg !225, !tbaa !211
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %80) #5, !dbg !227
  br label %for.inc.i, !dbg !227

for.inc.i:                                        ; preds = %if.then.i, %for.body.i80
  %indvars.iv.next.i81 = add nuw nsw i64 %indvars.iv.i78, 1, !dbg !228
  %exitcond.i82 = icmp eq i64 %indvars.iv.next.i81, 1025, !dbg !228
  br i1 %exitcond.i82, label %if.end54.loopexit, label %for.body.i80, !dbg !228

if.end54.loopexit:                                ; preds = %for.inc.i
  br label %if.end54

if.end54:                                         ; preds = %if.end54.loopexit, %if.end47, %kernel_ludcmp.exit
  tail call void @free(i8* %call) #4, !dbg !229
  tail call void @free(i8* %call1) #4, !dbg !230
  tail call void @free(i8* %call2) #4, !dbg !231
  tail call void @free(i8* %call3) #4, !dbg !232
  ret i32 0, !dbg !233
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
!llvm.module.flags = !{!77, !78}
!llvm.ident = !{!79}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c] [DW_LANG_C99]
!1 = !{!"ludcmp.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067240000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67240000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001025"}                        ; [ DW_TAG_subrange_type ] [0, 1024]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0065600\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65600, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp"}
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
!24 = !{!25, !47, !55, !68}
!25 = !{!"0x2e\00main\00main\00\00112\000\001\000\000\00256\001\00113", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 113] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !43, !44, !46}
!33 = !{!"0x101\00argc\0016777328\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 112]
!34 = !{!"0x101\00argv\0033554544\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 112]
!35 = !{!"0x100\00n\00115\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [n] [line 115]
!36 = !{!"0x100\00A\00118\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [A] [line 118]
!37 = !{!"0x100\00b\00119\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [b] [line 119]
!38 = !{!"0x100\00x\00120\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [x] [line 120]
!39 = !{!"0x100\00y\00121\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [y] [line 121]
!40 = !{!"0x100\00__s1_len\00147\000", !41, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 147]
!41 = !{!"0xb\00147\003\001", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!42 = !{!"0xb\00147\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!43 = !{!"0x100\00__s2_len\00147\000", !41, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 147]
!44 = !{!"0x100\00__s2\00147\000", !45, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 147]
!45 = !{!"0xb\00147\003\002", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!46 = !{!"0x100\00__result\00147\000", !45, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 147]
!47 = !{!"0x2e\00print_array\00print_array\00\0046\001\001\000\000\00256\001\0049", !1, !26, !48, null, null, null, null, !51} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [scope 49] [print_array]
!48 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !49, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = !{null, !29, !50}
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!51 = !{!52, !53, !54}
!52 = !{!"0x101\00n\0016777262\000", !47, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 46]
!53 = !{!"0x101\00x\0033554479\000", !47, !26, !50} ; [ DW_TAG_arg_variable ] [x] [line 47]
!54 = !{!"0x100\00i\0050\000", !47, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 50]
!55 = !{!"0x2e\00kernel_ludcmp\00kernel_ludcmp\00\0062\001\001\000\000\00256\001\0067", !1, !26, !56, null, null, null, null, !58} ; [ DW_TAG_subprogram ] [line 62] [local] [def] [scope 67] [kernel_ludcmp]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{null, !29, !9, !50, !50, !50}
!58 = !{!59, !60, !61, !62, !63, !64, !65, !66, !67}
!59 = !{!"0x101\00n\0016777278\000", !55, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 62]
!60 = !{!"0x101\00A\0033554495\000", !55, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 63]
!61 = !{!"0x101\00b\0050331712\000", !55, !26, !50} ; [ DW_TAG_arg_variable ] [b] [line 64]
!62 = !{!"0x101\00x\0067108929\000", !55, !26, !50} ; [ DW_TAG_arg_variable ] [x] [line 65]
!63 = !{!"0x101\00y\0083886146\000", !55, !26, !50} ; [ DW_TAG_arg_variable ] [y] [line 66]
!64 = !{!"0x100\00i\0068\000", !55, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 68]
!65 = !{!"0x100\00j\0068\000", !55, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 68]
!66 = !{!"0x100\00k\0068\000", !55, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 68]
!67 = !{!"0x100\00w\0070\000", !55, !26, !6}      ; [ DW_TAG_auto_variable ] [w] [line 70]
!68 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0028", !1, !26, !56, null, null, null, null, !69} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 28] [init_array]
!69 = !{!70, !71, !72, !73, !74, !75, !76}
!70 = !{!"0x101\00n\0016777239\000", !68, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!71 = !{!"0x101\00A\0033554456\000", !68, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!72 = !{!"0x101\00b\0050331673\000", !68, !26, !50} ; [ DW_TAG_arg_variable ] [b] [line 25]
!73 = !{!"0x101\00x\0067108890\000", !68, !26, !50} ; [ DW_TAG_arg_variable ] [x] [line 26]
!74 = !{!"0x101\00y\0083886107\000", !68, !26, !50} ; [ DW_TAG_arg_variable ] [y] [line 27]
!75 = !{!"0x100\00i\0029\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 29]
!76 = !{!"0x100\00j\0029\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 29]
!77 = !{i32 2, !"Dwarf Version", i32 4}
!78 = !{i32 2, !"Debug Info Version", i32 2}
!79 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!80 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!81 = !MDLocation(line: 112, column: 14, scope: !25)
!82 = !MDLocation(line: 112, column: 27, scope: !25)
!83 = !MDLocation(line: 115, column: 7, scope: !25)
!84 = !MDLocation(line: 118, column: 3, scope: !25)
!85 = !MDLocation(line: 119, column: 3, scope: !25)
!86 = !MDLocation(line: 120, column: 3, scope: !25)
!87 = !MDLocation(line: 121, column: 3, scope: !25)
!88 = !MDLocation(line: 126, column: 8, scope: !25)
!89 = !MDLocation(line: 127, column: 8, scope: !25)
!90 = !MDLocation(line: 128, column: 8, scope: !25)
!91 = !MDLocation(line: 129, column: 8, scope: !25)
!92 = !{!"0x101\00n\0016777239\000", !68, !26, !29, !93} ; [ DW_TAG_arg_variable ] [n] [line 23]
!93 = !MDLocation(line: 125, column: 3, scope: !25)
!94 = !MDLocation(line: 23, column: 22, scope: !68, inlinedAt: !93)
!95 = !{!"0x100\00i\0029\000", !68, !26, !29, !93} ; [ DW_TAG_auto_variable ] [i] [line 29]
!96 = !MDLocation(line: 29, column: 7, scope: !68, inlinedAt: !93)
!97 = !MDLocation(line: 31, column: 3, scope: !98, inlinedAt: !93)
!98 = !{!"0xb\0031\003\0035", !1, !68}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!99 = !MDLocation(line: 33, column: 14, scope: !100, inlinedAt: !93)
!100 = !{!"0xb\0032\005\0037", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!101 = !{!"0xb\0031\003\0036", !1, !98}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!102 = !MDLocation(line: 33, column: 7, scope: !100, inlinedAt: !93)
!103 = !{!104, !104, i64 0}
!104 = !{!"double", !105, i64 0}
!105 = !{!"omnipotent char", !106, i64 0}
!106 = !{!"Simple C/C++ TBAA"}
!107 = !MDLocation(line: 34, column: 14, scope: !100, inlinedAt: !93)
!108 = !MDLocation(line: 34, column: 7, scope: !100, inlinedAt: !93)
!109 = !MDLocation(line: 35, column: 14, scope: !100, inlinedAt: !93)
!110 = !MDLocation(line: 35, column: 7, scope: !100, inlinedAt: !93)
!111 = !{!"0x100\00j\0029\000", !68, !26, !29, !93} ; [ DW_TAG_auto_variable ] [j] [line 29]
!112 = !MDLocation(line: 29, column: 10, scope: !68, inlinedAt: !93)
!113 = !MDLocation(line: 36, column: 7, scope: !114, inlinedAt: !93)
!114 = !{!"0xb\0036\007\0038", !1, !100}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!115 = !MDLocation(line: 37, column: 31, scope: !116, inlinedAt: !93)
!116 = !{!"0xb\0036\0032\0040", !1, !117}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!117 = !{!"0xb\0036\007\0039", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!118 = !MDLocation(line: 37, column: 13, scope: !116, inlinedAt: !93)
!119 = !MDLocation(line: 37, column: 12, scope: !116, inlinedAt: !93)
!120 = !MDLocation(line: 37, column: 2, scope: !116, inlinedAt: !93)
!121 = distinct !{!121, !122, !123}
!122 = !{!"llvm.loop.vectorize.width", i32 1}
!123 = !{!"llvm.loop.interleave.count", i32 1}
!124 = !{!"0x101\00n\0016777278\000", !55, !26, !29, !125} ; [ DW_TAG_arg_variable ] [n] [line 62]
!125 = !MDLocation(line: 135, column: 3, scope: !25)
!126 = !MDLocation(line: 62, column: 24, scope: !55, inlinedAt: !125)
!127 = !MDLocation(line: 73, column: 3, scope: !55, inlinedAt: !125)
!128 = !{!"0x100\00i\0068\000", !55, !26, !29, !125} ; [ DW_TAG_auto_variable ] [i] [line 68]
!129 = !MDLocation(line: 68, column: 7, scope: !55, inlinedAt: !125)
!130 = !MDLocation(line: 74, column: 3, scope: !131, inlinedAt: !125)
!131 = !{!"0xb\0074\003\0012", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!132 = !MDLocation(line: 79, column: 16, scope: !133, inlinedAt: !125)
!133 = !{!"0xb\0079\004\0019", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!134 = !{!"0xb\0079\004\0018", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!135 = !{!"0xb\0077\009\0017", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!136 = !{!"0xb\0076\007\0016", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!137 = !{!"0xb\0076\007\0015", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!138 = !{!"0xb\0075\005\0014", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!139 = !{!"0xb\0074\003\0013", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!140 = !MDLocation(line: 81, column: 18, scope: !135, inlinedAt: !125)
!141 = !MDLocation(line: 78, column: 8, scope: !135, inlinedAt: !125)
!142 = !{!"0x100\00w\0070\000", !55, !26, !6, !125} ; [ DW_TAG_auto_variable ] [w] [line 70]
!143 = !MDLocation(line: 70, column: 13, scope: !55, inlinedAt: !125)
!144 = !{!"0x100\00k\0068\000", !55, !26, !29, !125} ; [ DW_TAG_auto_variable ] [k] [line 68]
!145 = !MDLocation(line: 68, column: 13, scope: !55, inlinedAt: !125)
!146 = !MDLocation(line: 81, column: 14, scope: !135, inlinedAt: !125)
!147 = !MDLocation(line: 81, column: 4, scope: !135, inlinedAt: !125)
!148 = !MDLocation(line: 76, column: 7, scope: !137, inlinedAt: !125)
!149 = distinct !{!149, !150}
!150 = !{!"llvm.loop.unroll.disable"}
!151 = !MDLocation(line: 80, column: 13, scope: !133, inlinedAt: !125)
!152 = !MDLocation(line: 80, column: 23, scope: !133, inlinedAt: !125)
!153 = !MDLocation(line: 80, column: 10, scope: !133, inlinedAt: !125)
!154 = !MDLocation(line: 79, column: 4, scope: !134, inlinedAt: !125)
!155 = distinct !{!155, !150}
!156 = !MDLocation(line: 85, column: 8, scope: !157, inlinedAt: !125)
!157 = !{!"0xb\0084\009\0022", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!158 = !{!"0xb\0083\007\0021", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!159 = !{!"0xb\0083\007\0020", !1, !138}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!160 = !MDLocation(line: 87, column: 15, scope: !161, inlinedAt: !125)
!161 = !{!"0xb\0086\004\0024", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!162 = !{!"0xb\0086\004\0023", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!163 = !MDLocation(line: 87, column: 27, scope: !161, inlinedAt: !125)
!164 = !MDLocation(line: 87, column: 10, scope: !161, inlinedAt: !125)
!165 = !MDLocation(line: 86, column: 4, scope: !162, inlinedAt: !125)
!166 = distinct !{!166, !150}
!167 = !MDLocation(line: 88, column: 4, scope: !157, inlinedAt: !125)
!168 = !MDLocation(line: 83, column: 7, scope: !159, inlinedAt: !125)
!169 = !MDLocation(line: 91, column: 10, scope: !55, inlinedAt: !125)
!170 = !MDLocation(line: 91, column: 3, scope: !55, inlinedAt: !125)
!171 = !MDLocation(line: 92, column: 3, scope: !172, inlinedAt: !125)
!172 = !{!"0xb\0092\003\0025", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!173 = !{!"0x100\00j\0068\000", !55, !26, !29, !125} ; [ DW_TAG_auto_variable ] [j] [line 68]
!174 = !MDLocation(line: 68, column: 10, scope: !55, inlinedAt: !125)
!175 = !MDLocation(line: 94, column: 11, scope: !176, inlinedAt: !125)
!176 = !{!"0xb\0093\005\0027", !1, !177}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!177 = !{!"0xb\0092\003\0026", !1, !172}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!178 = !MDLocation(line: 96, column: 10, scope: !179, inlinedAt: !125)
!179 = !{!"0xb\0095\007\0029", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!180 = !{!"0xb\0095\007\0028", !1, !176}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!181 = !MDLocation(line: 96, column: 20, scope: !179, inlinedAt: !125)
!182 = !MDLocation(line: 96, column: 6, scope: !179, inlinedAt: !125)
!183 = !MDLocation(line: 95, column: 7, scope: !180, inlinedAt: !125)
!184 = distinct !{!184, !150}
!185 = !MDLocation(line: 97, column: 7, scope: !176, inlinedAt: !125)
!186 = !MDLocation(line: 99, column: 10, scope: !55, inlinedAt: !125)
!187 = !MDLocation(line: 99, column: 17, scope: !55, inlinedAt: !125)
!188 = !MDLocation(line: 99, column: 3, scope: !55, inlinedAt: !125)
!189 = !MDLocation(line: 100, column: 3, scope: !190, inlinedAt: !125)
!190 = !{!"0xb\00100\003\0030", !1, !55}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!191 = !MDLocation(line: 102, column: 13, scope: !192, inlinedAt: !125)
!192 = !{!"0xb\00101\005\0032", !1, !193}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!193 = !{!"0xb\00100\003\0031", !1, !190}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!194 = !MDLocation(line: 102, column: 11, scope: !192, inlinedAt: !125)
!195 = !MDLocation(line: 104, column: 10, scope: !196, inlinedAt: !125)
!196 = !{!"0xb\00103\007\0034", !1, !197}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!197 = !{!"0xb\00103\007\0033", !1, !192}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!198 = !MDLocation(line: 104, column: 28, scope: !196, inlinedAt: !125)
!199 = !MDLocation(line: 104, column: 6, scope: !196, inlinedAt: !125)
!200 = !MDLocation(line: 103, column: 7, scope: !197, inlinedAt: !125)
!201 = distinct !{!201, !150}
!202 = !MDLocation(line: 105, column: 26, scope: !192, inlinedAt: !125)
!203 = !MDLocation(line: 105, column: 22, scope: !192, inlinedAt: !125)
!204 = !MDLocation(line: 105, column: 7, scope: !192, inlinedAt: !125)
!205 = !MDLocation(line: 147, column: 3, scope: !42)
!206 = !MDLocation(line: 147, column: 3, scope: !25)
!207 = !MDLocation(line: 147, column: 3, scope: !41)
!208 = !MDLocation(line: 147, column: 3, scope: !45)
!209 = !MDLocation(line: 147, column: 3, scope: !210)
!210 = !{!"0xb\004", !1, !45}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!211 = !{!212, !212, i64 0}
!212 = !{!"any pointer", !105, i64 0}
!213 = !{!105, !105, i64 0}
!214 = !MDLocation(line: 53, column: 14, scope: !215, inlinedAt: !218)
!215 = !{!"0xb\0052\0028\0010", !1, !216}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!216 = !{!"0xb\0052\003\009", !1, !217}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!217 = !{!"0xb\0052\003\008", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!218 = !MDLocation(line: 147, column: 3, scope: !219)
!219 = !{!"0xb\0023", !1, !42}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!220 = !MDLocation(line: 53, column: 44, scope: !215, inlinedAt: !218)
!221 = !MDLocation(line: 53, column: 5, scope: !215, inlinedAt: !218)
!222 = !MDLocation(line: 54, column: 9, scope: !223, inlinedAt: !218)
!223 = !{!"0xb\0054\009\0011", !1, !215}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!224 = !MDLocation(line: 54, column: 9, scope: !215, inlinedAt: !218)
!225 = !MDLocation(line: 54, column: 31, scope: !226, inlinedAt: !218)
!226 = !{!"0xb\001", !1, !223}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/ludcmp/ludcmp.c]
!227 = !MDLocation(line: 54, column: 22, scope: !223, inlinedAt: !218)
!228 = !MDLocation(line: 52, column: 3, scope: !217, inlinedAt: !218)
!229 = !MDLocation(line: 150, column: 3, scope: !25)
!230 = !MDLocation(line: 151, column: 3, scope: !25)
!231 = !MDLocation(line: 152, column: 3, scope: !25)
!232 = !MDLocation(line: 153, column: 3, scope: !25)
!233 = !MDLocation(line: 155, column: 3, scope: !25)
