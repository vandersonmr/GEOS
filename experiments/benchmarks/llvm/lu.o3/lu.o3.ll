; ModuleID = 'lu.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !68), !dbg !69
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !68), !dbg !70
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !68), !dbg !71
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !72
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !74, metadata !68), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !77, metadata !68), !dbg !78
  br label %for.cond1.preheader.i, !dbg !79

for.cond1.preheader.i:                            ; preds = %middle.block, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %middle.block ], !dbg !75
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !79
  %0 = trunc i64 %indvars.iv.next4.i to i32, !dbg !81
  %conv.i = sitofp i32 %0 to double, !dbg !81
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next, %vector.body ], !dbg !75
  %induction7778 = or i64 %index, 1, !dbg !75
  %1 = or i64 %index, 1, !dbg !85
  %2 = add nuw nsw i64 %induction7778, 1, !dbg !85
  %3 = trunc i64 %1 to i32, !dbg !86
  %4 = trunc i64 %2 to i32, !dbg !86
  %5 = sitofp i32 %3 to double, !dbg !86
  %6 = sitofp i32 %4 to double, !dbg !86
  %7 = fmul double %conv.i, %5, !dbg !81
  %8 = fmul double %conv.i, %6, !dbg !81
  %9 = fmul double %7, 9.765625e-04, !dbg !87
  %10 = fmul double %8, 9.765625e-04, !dbg !87
  %11 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !88
  %12 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction7778, !dbg !88
  store double %9, double* %11, align 8, !dbg !88, !tbaa !89
  store double %10, double* %12, align 8, !dbg !88, !tbaa !89
  %index.next = add i64 %index, 2, !dbg !75
  %13 = icmp eq i64 %index.next, 1024, !dbg !75
  br i1 %13, label %middle.block, label %vector.body, !dbg !75, !llvm.loop !93

middle.block:                                     ; preds = %vector.body
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1024, !dbg !79
  br i1 %exitcond5.i, label %for.body.i.preheader, label %for.cond1.preheader.i, !dbg !79

for.body.i.preheader:                             ; preds = %middle.block
  br label %for.body.i, !dbg !96

for.cond.loopexit.i68.loopexit:                   ; preds = %for.inc41.us.i
  br label %for.cond.loopexit.i68

for.cond.loopexit.i68:                            ; preds = %for.cond.loopexit.i68.loopexit, %for.body.i
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1, !dbg !96
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 1024, !dbg !96
  br i1 %exitcond25.i, label %kernel_lu.exit, label %for.body.i, !dbg !96

for.body.i:                                       ; preds = %for.body.i.preheader, %for.cond.loopexit.i68
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.cond.loopexit.i68 ], [ 0, %for.body.i.preheader ], !dbg !98
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.cond.loopexit.i68 ], [ 1, %for.body.i.preheader ], !dbg !98
  %14 = mul i64 %indvars.iv23.i, -1, !dbg !96
  %15 = add i64 %14, 1023, !dbg !96
  %16 = trunc i64 %15 to i32
  %17 = mul i64 %indvars.iv23.i, -1, !dbg !96
  %18 = add i64 %17, 1023, !dbg !96
  %19 = trunc i64 %18 to i32
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !96
  %cmp21.i = icmp slt i64 %indvars.iv.next24.i, 1024, !dbg !99
  br i1 %cmp21.i, label %for.body3.lr.ph.i, label %for.cond.loopexit.i68, !dbg !104

for.body3.lr.ph.i:                                ; preds = %for.body.i
  %arrayidx9.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv23.i, !dbg !105
  %xtraiter = and i32 %19, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %19, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body3.i72.prol.preheader, label %for.body3.lr.ph.i.split

for.body3.i72.prol.preheader:                     ; preds = %for.body3.lr.ph.i
  br label %for.body3.i72.prol, !dbg !106

for.body3.i72.prol:                               ; preds = %for.body3.i72.prol.preheader, %for.body3.i72.prol
  %indvars.iv8.i.prol = phi i64 [ %indvars.iv.next9.i.prol, %for.body3.i72.prol ], [ %indvars.iv17.i, %for.body3.i72.prol.preheader ], !dbg !98
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.i72.prol ], [ %xtraiter, %for.body3.i72.prol.preheader ]
  %arrayidx5.i69.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv8.i.prol, !dbg !106
  %20 = load double* %arrayidx5.i69.prol, align 8, !dbg !106, !tbaa !89
  %21 = load double* %arrayidx9.i, align 8, !dbg !105, !tbaa !89
  %div.i70.prol = fdiv double %20, %21, !dbg !106
  store double %div.i70.prol, double* %arrayidx5.i69.prol, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next9.i.prol = add nuw nsw i64 %indvars.iv8.i.prol, 1, !dbg !104
  %lftr.wideiv.prol = trunc i64 %indvars.iv8.i.prol to i32, !dbg !104
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, 1023, !dbg !104
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !104
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !104
  br i1 %prol.iter.cmp, label %for.body3.i72.prol, label %for.body3.lr.ph.i.split.loopexit, !llvm.loop !108

for.body3.lr.ph.i.split.loopexit:                 ; preds = %for.body3.i72.prol
  %indvars.iv8.i.unr.ph = phi i64 [ %indvars.iv.next9.i.prol, %for.body3.i72.prol ]
  br label %for.body3.lr.ph.i.split

for.body3.lr.ph.i.split:                          ; preds = %for.body3.lr.ph.i.split.loopexit, %for.body3.lr.ph.i
  %indvars.iv8.i.unr = phi i64 [ %indvars.iv17.i, %for.body3.lr.ph.i ], [ %indvars.iv8.i.unr.ph, %for.body3.lr.ph.i.split.loopexit ]
  %22 = icmp ult i32 %19, 4
  br i1 %22, label %for.body21.lr.ph.us.i.preheader, label %for.body3.lr.ph.i.split.split

for.body3.lr.ph.i.split.split:                    ; preds = %for.body3.lr.ph.i.split
  br label %for.body3.i72, !dbg !104

for.inc41.us.i.unr-lcssa:                         ; preds = %for.body21.us.i
  br label %for.inc41.us.i

for.inc41.us.i:                                   ; preds = %for.body21.lr.ph.us.i.split, %for.inc41.us.i.unr-lcssa
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1, !dbg !110
  %lftr.wideiv75 = trunc i64 %indvars.iv19.i to i32, !dbg !110
  %exitcond76 = icmp eq i32 %lftr.wideiv75, 1023, !dbg !110
  br i1 %exitcond76, label %for.cond.loopexit.i68.loopexit, label %for.body21.lr.ph.us.i, !dbg !110

for.body21.us.i:                                  ; preds = %for.body21.us.i, %for.body21.lr.ph.us.i.split.split
  %indvars.iv13.i = phi i64 [ %indvars.iv13.i.unr, %for.body21.lr.ph.us.i.split.split ], [ %indvars.iv.next14.i.1, %for.body21.us.i ], !dbg !98
  %arrayidx25.us.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv13.i, !dbg !112
  %23 = load double* %arrayidx25.us.i, align 8, !dbg !112, !tbaa !89
  %24 = load double* %arrayidx29.us.i, align 8, !dbg !116, !tbaa !89
  %arrayidx33.us.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv13.i, !dbg !117
  %25 = load double* %arrayidx33.us.i, align 8, !dbg !117, !tbaa !89
  %mul.us.i = fmul double %24, %25, !dbg !116
  %sub.us.i = fsub double %23, %mul.us.i, !dbg !112
  store double %sub.us.i, double* %arrayidx25.us.i, align 8, !dbg !118, !tbaa !89
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !119
  %lftr.wideiv73 = trunc i64 %indvars.iv13.i to i32, !dbg !119
  %arrayidx25.us.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv.next14.i, !dbg !112
  %26 = load double* %arrayidx25.us.i.1, align 8, !dbg !112, !tbaa !89
  %27 = load double* %arrayidx29.us.i, align 8, !dbg !116, !tbaa !89
  %arrayidx33.us.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv.next14.i, !dbg !117
  %28 = load double* %arrayidx33.us.i.1, align 8, !dbg !117, !tbaa !89
  %mul.us.i.1 = fmul double %27, %28, !dbg !116
  %sub.us.i.1 = fsub double %26, %mul.us.i.1, !dbg !112
  store double %sub.us.i.1, double* %arrayidx25.us.i.1, align 8, !dbg !118, !tbaa !89
  %indvars.iv.next14.i.1 = add nuw nsw i64 %indvars.iv.next14.i, 1, !dbg !119
  %lftr.wideiv73.1 = trunc i64 %indvars.iv.next14.i to i32, !dbg !119
  %exitcond74.1 = icmp eq i32 %lftr.wideiv73.1, 1023, !dbg !119
  br i1 %exitcond74.1, label %for.inc41.us.i.unr-lcssa, label %for.body21.us.i, !dbg !119

for.body21.lr.ph.us.i:                            ; preds = %for.body21.lr.ph.us.i.preheader, %for.inc41.us.i
  %indvars.iv19.i = phi i64 [ %indvars.iv.next20.i, %for.inc41.us.i ], [ %indvars.iv17.i, %for.body21.lr.ph.us.i.preheader ], !dbg !98
  %arrayidx29.us.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv23.i, !dbg !116
  %xtraiter79 = and i32 %16, 1
  %lcmp.mod80 = icmp ne i32 %xtraiter79, 0
  %lcmp.overflow81 = icmp eq i32 %16, 0
  %lcmp.or82 = or i1 %lcmp.overflow81, %lcmp.mod80
  br i1 %lcmp.or82, label %for.body21.us.i.prol.preheader, label %for.body21.lr.ph.us.i.split

for.body21.us.i.prol.preheader:                   ; preds = %for.body21.lr.ph.us.i
  br label %for.body21.us.i.prol, !dbg !112

for.body21.us.i.prol:                             ; preds = %for.body21.us.i.prol.preheader, %for.body21.us.i.prol
  %indvars.iv13.i.prol = phi i64 [ %indvars.iv.next14.i.prol, %for.body21.us.i.prol ], [ %indvars.iv17.i, %for.body21.us.i.prol.preheader ], !dbg !98
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %for.body21.us.i.prol ], [ %xtraiter79, %for.body21.us.i.prol.preheader ]
  %arrayidx25.us.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv13.i.prol, !dbg !112
  %29 = load double* %arrayidx25.us.i.prol, align 8, !dbg !112, !tbaa !89
  %30 = load double* %arrayidx29.us.i, align 8, !dbg !116, !tbaa !89
  %arrayidx33.us.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv13.i.prol, !dbg !117
  %31 = load double* %arrayidx33.us.i.prol, align 8, !dbg !117, !tbaa !89
  %mul.us.i.prol = fmul double %30, %31, !dbg !116
  %sub.us.i.prol = fsub double %29, %mul.us.i.prol, !dbg !112
  store double %sub.us.i.prol, double* %arrayidx25.us.i.prol, align 8, !dbg !118, !tbaa !89
  %indvars.iv.next14.i.prol = add nuw nsw i64 %indvars.iv13.i.prol, 1, !dbg !119
  %lftr.wideiv73.prol = trunc i64 %indvars.iv13.i.prol to i32, !dbg !119
  %exitcond74.prol = icmp eq i32 %lftr.wideiv73.prol, 1023, !dbg !119
  %prol.iter83.sub = sub i32 %prol.iter83, 1, !dbg !119
  %prol.iter83.cmp = icmp ne i32 %prol.iter83.sub, 0, !dbg !119
  br i1 %prol.iter83.cmp, label %for.body21.us.i.prol, label %for.body21.lr.ph.us.i.split.loopexit, !llvm.loop !120

for.body21.lr.ph.us.i.split.loopexit:             ; preds = %for.body21.us.i.prol
  %indvars.iv13.i.unr.ph = phi i64 [ %indvars.iv.next14.i.prol, %for.body21.us.i.prol ]
  br label %for.body21.lr.ph.us.i.split

for.body21.lr.ph.us.i.split:                      ; preds = %for.body21.lr.ph.us.i.split.loopexit, %for.body21.lr.ph.us.i
  %indvars.iv13.i.unr = phi i64 [ %indvars.iv17.i, %for.body21.lr.ph.us.i ], [ %indvars.iv13.i.unr.ph, %for.body21.lr.ph.us.i.split.loopexit ]
  %32 = icmp ult i32 %16, 2
  br i1 %32, label %for.inc41.us.i, label %for.body21.lr.ph.us.i.split.split

for.body21.lr.ph.us.i.split.split:                ; preds = %for.body21.lr.ph.us.i.split
  br label %for.body21.us.i, !dbg !119

for.body3.i72:                                    ; preds = %for.body3.i72, %for.body3.lr.ph.i.split.split
  %indvars.iv8.i = phi i64 [ %indvars.iv8.i.unr, %for.body3.lr.ph.i.split.split ], [ %indvars.iv.next9.i.3, %for.body3.i72 ], !dbg !98
  %arrayidx5.i69 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv8.i, !dbg !106
  %33 = load double* %arrayidx5.i69, align 8, !dbg !106, !tbaa !89
  %34 = load double* %arrayidx9.i, align 8, !dbg !105, !tbaa !89
  %div.i70 = fdiv double %33, %34, !dbg !106
  store double %div.i70, double* %arrayidx5.i69, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !104
  %lftr.wideiv = trunc i64 %indvars.iv8.i to i32, !dbg !104
  %arrayidx5.i69.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv.next9.i, !dbg !106
  %35 = load double* %arrayidx5.i69.1, align 8, !dbg !106, !tbaa !89
  %36 = load double* %arrayidx9.i, align 8, !dbg !105, !tbaa !89
  %div.i70.1 = fdiv double %35, %36, !dbg !106
  store double %div.i70.1, double* %arrayidx5.i69.1, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next9.i.1 = add nuw nsw i64 %indvars.iv.next9.i, 1, !dbg !104
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next9.i to i32, !dbg !104
  %arrayidx5.i69.2 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv.next9.i.1, !dbg !106
  %37 = load double* %arrayidx5.i69.2, align 8, !dbg !106, !tbaa !89
  %38 = load double* %arrayidx9.i, align 8, !dbg !105, !tbaa !89
  %div.i70.2 = fdiv double %37, %38, !dbg !106
  store double %div.i70.2, double* %arrayidx5.i69.2, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next9.i.2 = add nuw nsw i64 %indvars.iv.next9.i.1, 1, !dbg !104
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next9.i.1 to i32, !dbg !104
  %arrayidx5.i69.3 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv.next9.i.2, !dbg !106
  %39 = load double* %arrayidx5.i69.3, align 8, !dbg !106, !tbaa !89
  %40 = load double* %arrayidx9.i, align 8, !dbg !105, !tbaa !89
  %div.i70.3 = fdiv double %39, %40, !dbg !106
  store double %div.i70.3, double* %arrayidx5.i69.3, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next9.i.3 = add nuw nsw i64 %indvars.iv.next9.i.2, 1, !dbg !104
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next9.i.2 to i32, !dbg !104
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 1023, !dbg !104
  br i1 %exitcond.3, label %for.body21.lr.ph.us.i.preheader.unr-lcssa, label %for.body3.i72, !dbg !104

for.body21.lr.ph.us.i.preheader.unr-lcssa:        ; preds = %for.body3.i72
  br label %for.body21.lr.ph.us.i.preheader

for.body21.lr.ph.us.i.preheader:                  ; preds = %for.body3.lr.ph.i.split, %for.body21.lr.ph.us.i.preheader.unr-lcssa
  br label %for.body21.lr.ph.us.i, !dbg !116

kernel_lu.exit:                                   ; preds = %for.cond.loopexit.i68
  %cmp = icmp sgt i32 %argc, 42, !dbg !121
  br i1 %cmp, label %if.end38, label %if.end45, !dbg !122

if.end38:                                         ; preds = %kernel_lu.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !68), !dbg !123
  tail call void @llvm.dbg.value(metadata i8* %41, i64 0, metadata !38, metadata !68), !dbg !124
  %41 = load i8** %argv, align 8, !dbg !125, !tbaa !127
  %42 = load i8* %41, align 1, !dbg !125, !tbaa !129
  %phitmp = icmp eq i8 %42, 0, !dbg !123
  br i1 %phitmp, label %for.cond1.preheader.i63.preheader, label %if.end45, !dbg !122

for.cond1.preheader.i63.preheader:                ; preds = %if.end38
  br label %for.cond1.preheader.i63, !dbg !130

for.cond1.preheader.i63:                          ; preds = %for.cond1.preheader.i63.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i63.preheader ], !dbg !137
  %43 = shl i64 %indvars.iv7.i, 10, !dbg !130
  br label %for.body3.i65, !dbg !139

for.body3.i65:                                    ; preds = %for.inc.i, %for.cond1.preheader.i63
  %indvars.iv.i64 = phi i64 [ 0, %for.cond1.preheader.i63 ], [ %indvars.iv.next.i66, %for.inc.i ], !dbg !137
  %44 = load %struct._IO_FILE** @stderr, align 8, !dbg !140, !tbaa !127
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i64, !dbg !141
  %45 = load double* %arrayidx5.i, align 8, !dbg !141, !tbaa !89
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %45) #5, !dbg !142
  %46 = add nuw nsw i64 %indvars.iv.i64, %43, !dbg !130
  %47 = trunc i64 %46 to i32, !dbg !143
  %rem.i = srem i32 %47, 20, !dbg !143
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !143
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !144

if.then.i:                                        ; preds = %for.body3.i65
  %48 = load %struct._IO_FILE** @stderr, align 8, !dbg !145, !tbaa !127
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %48) #5, !dbg !147
  br label %for.inc.i, !dbg !147

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i65
  %indvars.iv.next.i66 = add nuw nsw i64 %indvars.iv.i64, 1, !dbg !139
  %exitcond.i67 = icmp eq i64 %indvars.iv.next.i66, 1024, !dbg !139
  br i1 %exitcond.i67, label %for.inc8.i, label %for.body3.i65, !dbg !139

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !148
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !148
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i63, !dbg !148

print_array.exit:                                 ; preds = %for.inc8.i
  %49 = load %struct._IO_FILE** @stderr, align 8, !dbg !149, !tbaa !127
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %49) #5, !dbg !150
  br label %if.end45, !dbg !137

if.end45:                                         ; preds = %if.end38, %print_array.exit, %kernel_lu.exit
  tail call void @free(i8* %call) #4, !dbg !151
  ret i32 0, !dbg !152
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
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c] [DW_LANG_C99]
!1 = !{!"lu.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu"}
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
!21 = !{!22, !41, !52, !59}
!22 = !{!"0x2e\00main\00main\00\0074\000\001\000\000\00256\001\0075", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 74] [def] [scope 75] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !37, !38, !40}
!30 = !{!"0x101\00argc\0016777290\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 74]
!31 = !{!"0x101\00argv\0033554506\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 74]
!32 = !{!"0x100\00n\0077\000", !22, !23, !26}     ; [ DW_TAG_auto_variable ] [n] [line 77]
!33 = !{!"0x100\00A\0080\000", !22, !23, !4}      ; [ DW_TAG_auto_variable ] [A] [line 80]
!34 = !{!"0x100\00__s1_len\0098\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 98]
!35 = !{!"0xb\0098\003\001", !1, !36}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!36 = !{!"0xb\0098\003\000", !1, !22}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!37 = !{!"0x100\00__s2_len\0098\000", !35, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 98]
!38 = !{!"0x100\00__s2\0098\000", !39, !23, !14}  ; [ DW_TAG_auto_variable ] [__s2] [line 98]
!39 = !{!"0xb\0098\003\002", !1, !35}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!40 = !{!"0x100\00__result\0098\000", !39, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 98]
!41 = !{!"0x2e\00print_array\00print_array\00\0037\001\001\000\000\00256\001\0040", !1, !23, !42, null, null, null, null, !47} ; [ DW_TAG_subprogram ] [line 37] [local] [def] [scope 40] [print_array]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !26, !44}
!44 = !{!"0xf\00\000\0064\0064\000\000", null, null, !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !46, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!46 = !{!8}
!47 = !{!48, !49, !50, !51}
!48 = !{!"0x101\00n\0016777253\000", !41, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 37]
!49 = !{!"0x101\00A\0033554470\000", !41, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 38]
!50 = !{!"0x100\00i\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 41]
!51 = !{!"0x100\00j\0041\000", !41, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 41]
!52 = !{!"0x2e\00kernel_lu\00kernel_lu\00\0055\001\001\000\000\00256\001\0057", !1, !23, !42, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 55] [local] [def] [scope 57] [kernel_lu]
!53 = !{!54, !55, !56, !57, !58}
!54 = !{!"0x101\00n\0016777271\000", !52, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 55]
!55 = !{!"0x101\00A\0033554488\000", !52, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 56]
!56 = !{!"0x100\00i\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 58]
!57 = !{!"0x100\00j\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 58]
!58 = !{!"0x100\00k\0058\000", !52, !23, !26}     ; [ DW_TAG_auto_variable ] [k] [line 58]
!59 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0025", !1, !23, !42, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 25] [init_array]
!60 = !{!61, !62, !63, !64}
!61 = !{!"0x101\00n\0016777239\000", !59, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!62 = !{!"0x101\00A\0033554456\000", !59, !23, !44} ; [ DW_TAG_arg_variable ] [A] [line 24]
!63 = !{!"0x100\00i\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 26]
!64 = !{!"0x100\00j\0026\000", !59, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 26]
!65 = !{i32 2, !"Dwarf Version", i32 4}
!66 = !{i32 2, !"Debug Info Version", i32 2}
!67 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!68 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!69 = !MDLocation(line: 74, column: 14, scope: !22)
!70 = !MDLocation(line: 74, column: 27, scope: !22)
!71 = !MDLocation(line: 77, column: 7, scope: !22)
!72 = !MDLocation(line: 80, column: 3, scope: !22)
!73 = !MDLocation(line: 84, column: 18, scope: !22)
!74 = !{!"0x101\00n\0016777239\000", !59, !23, !26, !75} ; [ DW_TAG_arg_variable ] [n] [line 23]
!75 = !MDLocation(line: 84, column: 3, scope: !22)
!76 = !MDLocation(line: 23, column: 22, scope: !59, inlinedAt: !75)
!77 = !{!"0x100\00i\0026\000", !59, !23, !26, !75} ; [ DW_TAG_auto_variable ] [i] [line 26]
!78 = !MDLocation(line: 26, column: 7, scope: !59, inlinedAt: !75)
!79 = !MDLocation(line: 28, column: 3, scope: !80, inlinedAt: !75)
!80 = !{!"0xb\0028\003\0023", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!81 = !MDLocation(line: 30, column: 18, scope: !82, inlinedAt: !75)
!82 = !{!"0xb\0029\005\0026", !1, !83}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!83 = !{!"0xb\0029\005\0025", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!84 = !{!"0xb\0028\003\0024", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!85 = !MDLocation(line: 29, column: 5, scope: !83, inlinedAt: !75)
!86 = !MDLocation(line: 30, column: 36, scope: !82, inlinedAt: !75)
!87 = !MDLocation(line: 30, column: 17, scope: !82, inlinedAt: !75)
!88 = !MDLocation(line: 30, column: 7, scope: !82, inlinedAt: !75)
!89 = !{!90, !90, i64 0}
!90 = !{!"double", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = distinct !{!93, !94, !95}
!94 = !{!"llvm.loop.vectorize.width", i32 1}
!95 = !{!"llvm.loop.interleave.count", i32 1}
!96 = !MDLocation(line: 61, column: 3, scope: !97, inlinedAt: !98)
!97 = !{!"0xb\0061\003\0014", !1, !52}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!98 = !MDLocation(line: 90, column: 3, scope: !22)
!99 = !MDLocation(line: 63, column: 23, scope: !100, inlinedAt: !98)
!100 = !{!"0xb\0063\007\0018", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!101 = !{!"0xb\0063\007\0017", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!102 = !{!"0xb\0062\005\0016", !1, !103}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!103 = !{!"0xb\0061\003\0015", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!104 = !MDLocation(line: 63, column: 7, scope: !101, inlinedAt: !98)
!105 = !MDLocation(line: 64, column: 22, scope: !100, inlinedAt: !98)
!106 = !MDLocation(line: 64, column: 12, scope: !100, inlinedAt: !98)
!107 = !MDLocation(line: 64, column: 2, scope: !100, inlinedAt: !98)
!108 = distinct !{!108, !109}
!109 = !{!"llvm.loop.unroll.disable"}
!110 = !MDLocation(line: 65, column: 7, scope: !111, inlinedAt: !98)
!111 = !{!"0xb\0065\007\0019", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!112 = !MDLocation(line: 67, column: 14, scope: !113, inlinedAt: !98)
!113 = !{!"0xb\0066\002\0022", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!114 = !{!"0xb\0066\002\0021", !1, !115}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!115 = !{!"0xb\0065\007\0020", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!116 = !MDLocation(line: 67, column: 24, scope: !113, inlinedAt: !98)
!117 = !MDLocation(line: 67, column: 34, scope: !113, inlinedAt: !98)
!118 = !MDLocation(line: 67, column: 4, scope: !113, inlinedAt: !98)
!119 = !MDLocation(line: 66, column: 2, scope: !114, inlinedAt: !98)
!120 = distinct !{!120, !109}
!121 = !MDLocation(line: 98, column: 3, scope: !36)
!122 = !MDLocation(line: 98, column: 3, scope: !22)
!123 = !MDLocation(line: 98, column: 3, scope: !35)
!124 = !MDLocation(line: 98, column: 3, scope: !39)
!125 = !MDLocation(line: 98, column: 3, scope: !126)
!126 = !{!"0xb\004", !1, !39}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!127 = !{!128, !128, i64 0}
!128 = !{!"any pointer", !91, i64 0}
!129 = !{!91, !91, i64 0}
!130 = !MDLocation(line: 46, column: 12, scope: !131, inlinedAt: !137)
!131 = !{!"0xb\0046\0011\0013", !1, !132}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!132 = !{!"0xb\0044\0029\0012", !1, !133}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!133 = !{!"0xb\0044\005\0011", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!134 = !{!"0xb\0044\005\0010", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!135 = !{!"0xb\0043\003\009", !1, !136}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!136 = !{!"0xb\0043\003\008", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!137 = !MDLocation(line: 98, column: 3, scope: !138)
!138 = !{!"0xb\0023", !1, !36}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!139 = !MDLocation(line: 44, column: 5, scope: !134, inlinedAt: !137)
!140 = !MDLocation(line: 45, column: 16, scope: !132, inlinedAt: !137)
!141 = !MDLocation(line: 45, column: 46, scope: !132, inlinedAt: !137)
!142 = !MDLocation(line: 45, column: 7, scope: !132, inlinedAt: !137)
!143 = !MDLocation(line: 46, column: 11, scope: !131, inlinedAt: !137)
!144 = !MDLocation(line: 46, column: 11, scope: !132, inlinedAt: !137)
!145 = !MDLocation(line: 46, column: 43, scope: !146, inlinedAt: !137)
!146 = !{!"0xb\001", !1, !131}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/solvers/lu/lu.c]
!147 = !MDLocation(line: 46, column: 34, scope: !131, inlinedAt: !137)
!148 = !MDLocation(line: 43, column: 3, scope: !136, inlinedAt: !137)
!149 = !MDLocation(line: 48, column: 12, scope: !41, inlinedAt: !137)
!150 = !MDLocation(line: 48, column: 3, scope: !41, inlinedAt: !137)
!151 = !MDLocation(line: 101, column: 3, scope: !22)
!152 = !MDLocation(line: 103, column: 3, scope: !22)
