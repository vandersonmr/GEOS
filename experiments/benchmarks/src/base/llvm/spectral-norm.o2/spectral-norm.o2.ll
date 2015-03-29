; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !16, metadata !70), !dbg !71
  tail call void @llvm.dbg.value(metadata i32 %j, i64 0, metadata !17, metadata !70), !dbg !72
  %add = add nsw i32 %j, %i, !dbg !73
  %add2 = add nsw i32 %add, 1, !dbg !74
  %mul = mul nsw i32 %add2, %add, !dbg !75
  %div = sdiv i32 %mul, 2, !dbg !75
  %add3 = add i32 %i, 1, !dbg !75
  %add4 = add i32 %add3, %div, !dbg !75
  %conv = sitofp i32 %add4 to double, !dbg !76
  %div5 = fdiv double 1.000000e+00, %conv, !dbg !77
  ret double %div5, !dbg !78
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !25, metadata !70), !dbg !79
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !26, metadata !70), !dbg !80
  tail call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !27, metadata !70), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !70), !dbg !82
  %cmp21 = icmp sgt i32 %N, 0, !dbg !83
  br i1 %cmp21, label %for.body.lr.ph, label %for.end10, !dbg !86

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %N, -1, !dbg !86
  br label %for.body3.lr.ph, !dbg !86

for.body3.lr.ph:                                  ; preds = %for.body.lr.ph, %for.inc8
  %indvars.iv26 = phi i64 [ 0, %for.body.lr.ph ], [ %1, %for.inc8 ]
  %arrayidx = getelementptr inbounds double* %Au, i64 %indvars.iv26, !dbg !87
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !87, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !70), !dbg !93
  %1 = add nuw nsw i64 %indvars.iv26, 1, !dbg !94
  br label %for.body3, !dbg !98

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %2 = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add, %for.body3 ], !dbg !99
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.body3 ]
  %j.020 = phi i32 [ 0, %for.body3.lr.ph ], [ %inc, %for.body3 ]
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !100, metadata !70), !dbg !101
  %3 = add nuw nsw i64 %indvars.iv, %indvars.iv26, !dbg !102
  %4 = trunc i64 %indvars.iv26 to i32, !dbg !102
  %add.i = add nuw nsw i32 %j.020, %4, !dbg !102
  %add2.i = add nuw nsw i32 %add.i, 1, !dbg !103
  %5 = trunc i64 %3 to i32, !dbg !94
  %mul.i = mul nsw i32 %add2.i, %5, !dbg !94
  %div.i = sdiv i32 %mul.i, 2, !dbg !94
  %6 = trunc i64 %1 to i32, !dbg !94
  %add4.i = add i32 %6, %div.i, !dbg !94
  %conv.i = sitofp i32 %add4.i to double, !dbg !104
  %div5.i = fdiv double 1.000000e+00, %conv.i, !dbg !105
  %arrayidx5 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !106
  %7 = load double* %arrayidx5, align 8, !dbg !106, !tbaa !89
  %mul = fmul double %div5.i, %7, !dbg !95
  %add = fadd double %2, %mul, !dbg !107
  store double %add, double* %arrayidx, align 8, !dbg !107, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !98
  %inc = add nuw nsw i32 %j.020, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !29, metadata !70), !dbg !93
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !98
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !98
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !98

for.inc8:                                         ; preds = %for.body3
  %.lcssa = phi i32 [ %4, %for.body3 ]
  %exitcond30 = icmp eq i32 %.lcssa, %0, !dbg !86
  br i1 %exitcond30, label %for.end10.loopexit, label %for.body3.lr.ph, !dbg !86

for.end10.loopexit:                               ; preds = %for.inc8
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %entry
  ret void, !dbg !110
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !32, metadata !70), !dbg !111
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !33, metadata !70), !dbg !112
  tail call void @llvm.dbg.value(metadata double* %Au, i64 0, metadata !34, metadata !70), !dbg !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !35, metadata !70), !dbg !114
  %cmp22 = icmp sgt i32 %N, 0, !dbg !115
  br i1 %cmp22, label %for.body.lr.ph, label %for.end10, !dbg !118

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %N, -1, !dbg !118
  br label %for.body3.lr.ph, !dbg !118

for.body3.lr.ph:                                  ; preds = %for.body.lr.ph, %for.inc8
  %indvars.iv27 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next28, %for.inc8 ]
  %arrayidx = getelementptr inbounds double* %Au, i64 %indvars.iv27, !dbg !119
  store double 0.000000e+00, double* %arrayidx, align 8, !dbg !119, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !36, metadata !70), !dbg !121
  br label %for.body3, !dbg !122

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %1 = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add, %for.body3 ], !dbg !124
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next, %for.body3 ]
  %j.021 = phi i32 [ 0, %for.body3.lr.ph ], [ %inc, %for.body3 ]
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !127, metadata !70), !dbg !124
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv27, !dbg !128
  %3 = trunc i64 %indvars.iv27 to i32, !dbg !128
  %add.i = add nuw nsw i32 %j.021, %3, !dbg !128
  %add2.i = add nuw nsw i32 %add.i, 1, !dbg !129
  %4 = trunc i64 %2 to i32, !dbg !130
  %mul.i = mul nsw i32 %add2.i, %4, !dbg !130
  %div.i = sdiv i32 %mul.i, 2, !dbg !130
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !122
  %5 = trunc i64 %indvars.iv.next to i32, !dbg !130
  %add4.i = add i32 %5, %div.i, !dbg !130
  %conv.i = sitofp i32 %add4.i to double, !dbg !131
  %div5.i = fdiv double 1.000000e+00, %conv.i, !dbg !132
  %arrayidx5 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !133
  %6 = load double* %arrayidx5, align 8, !dbg !133, !tbaa !89
  %mul = fmul double %div5.i, %6, !dbg !125
  %add = fadd double %1, %mul, !dbg !134
  store double %add, double* %arrayidx, align 8, !dbg !134, !tbaa !89
  %inc = add nuw nsw i32 %j.021, 1, !dbg !135
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !36, metadata !70), !dbg !121
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !122
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !122
  br i1 %exitcond, label %for.inc8, label %for.body3, !dbg !122

for.inc8:                                         ; preds = %for.body3
  %.lcssa = phi i32 [ %3, %for.body3 ]
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1, !dbg !118
  %exitcond30 = icmp eq i32 %.lcssa, %0, !dbg !118
  br i1 %exitcond30, label %for.end10.loopexit, label %for.body3.lr.ph, !dbg !118

for.end10.loopexit:                               ; preds = %for.inc8
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %entry
  ret void, !dbg !137
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %AtAu) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !39, metadata !70), !dbg !138
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !40, metadata !70), !dbg !139
  tail call void @llvm.dbg.value(metadata double* %AtAu, i64 0, metadata !41, metadata !70), !dbg !140
  %0 = zext i32 %N to i64, !dbg !141
  %vla = alloca double, i64 %0, align 16, !dbg !141
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !42, metadata !70), !dbg !142
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !143, metadata !70), !dbg !145
  tail call void @llvm.dbg.value(metadata double* %u, i64 0, metadata !146, metadata !70), !dbg !147
  tail call void @llvm.dbg.value(metadata double* %vla, i64 0, metadata !148, metadata !70), !dbg !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !150, metadata !70), !dbg !151
  %cmp21.i = icmp sgt i32 %N, 0, !dbg !152
  br i1 %cmp21.i, label %for.body.lr.ph.i, label %eval_At_times_u.exit, !dbg !153

for.body.lr.ph.i:                                 ; preds = %entry
  %1 = add i32 %N, -1, !dbg !153
  br label %for.body3.lr.ph.i, !dbg !153

for.body3.lr.ph.i:                                ; preds = %for.inc8.i, %for.body.lr.ph.i
  %indvars.iv26.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %2, %for.inc8.i ], !dbg !144
  %arrayidx.i = getelementptr inbounds double* %vla, i64 %indvars.iv26.i, !dbg !154
  store double 0.000000e+00, double* %arrayidx.i, align 8, !dbg !154, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !155, metadata !70), !dbg !156
  %2 = add nuw nsw i64 %indvars.iv26.i, 1, !dbg !157
  %3 = trunc i64 %indvars.iv26.i to i32, !dbg !159
  %add.i.i = add i32 %3, 1, !dbg !159
  %4 = trunc i64 %2 to i32, !dbg !157
  %xtraiter33 = and i32 %N, 1
  %lcmp.mod34 = icmp ne i32 %xtraiter33, 0
  %lcmp.overflow35 = icmp eq i32 %N, 0
  %lcmp.or36 = or i1 %lcmp.overflow35, %lcmp.mod34
  br i1 %lcmp.or36, label %for.body3.i.prol.preheader, label %for.body3.lr.ph.i.split

for.body3.i.prol.preheader:                       ; preds = %for.body3.lr.ph.i
  br label %for.body3.i.prol, !dbg !159

for.body3.i.prol:                                 ; preds = %for.body3.i.prol.preheader, %for.body3.i.prol
  %5 = phi double [ %add.i.prol, %for.body3.i.prol ], [ 0.000000e+00, %for.body3.i.prol.preheader ], !dbg !160
  %indvars.iv.i.prol = phi i64 [ %indvars.iv.next.i.prol, %for.body3.i.prol ], [ 0, %for.body3.i.prol.preheader ], !dbg !144
  %j.020.i.prol = phi i32 [ %inc.i.prol, %for.body3.i.prol ], [ 0, %for.body3.i.prol.preheader ], !dbg !144
  %prol.iter37 = phi i32 [ %prol.iter37.sub, %for.body3.i.prol ], [ %xtraiter33, %for.body3.i.prol.preheader ]
  %6 = add nuw nsw i64 %indvars.iv.i.prol, %indvars.iv26.i, !dbg !159
  %add2.i.i.prol = add i32 %add.i.i, %j.020.i.prol, !dbg !161
  %7 = trunc i64 %6 to i32, !dbg !157
  %mul.i.i.prol = mul nsw i32 %add2.i.i.prol, %7, !dbg !157
  %div.i.i.prol = sdiv i32 %mul.i.i.prol, 2, !dbg !157
  %add4.i.i.prol = add i32 %div.i.i.prol, %4, !dbg !157
  %conv.i.i.prol = sitofp i32 %add4.i.i.prol to double, !dbg !162
  %div5.i.i.prol = fdiv double 1.000000e+00, %conv.i.i.prol, !dbg !163
  %arrayidx5.i.prol = getelementptr inbounds double* %u, i64 %indvars.iv.i.prol, !dbg !164
  %8 = load double* %arrayidx5.i.prol, align 8, !dbg !164, !tbaa !89
  %mul.i.prol = fmul double %div5.i.i.prol, %8, !dbg !158
  %add.i.prol = fadd double %5, %mul.i.prol, !dbg !165
  %indvars.iv.next.i.prol = add nuw nsw i64 %indvars.iv.i.prol, 1, !dbg !166
  %inc.i.prol = add nuw nsw i32 %j.020.i.prol, 1, !dbg !167
  %lftr.wideiv28.prol = trunc i64 %indvars.iv.i.prol to i32, !dbg !166
  %exitcond29.prol = icmp eq i32 %lftr.wideiv28.prol, %1, !dbg !166
  %prol.iter37.sub = sub i32 %prol.iter37, 1, !dbg !166
  %prol.iter37.cmp = icmp ne i32 %prol.iter37.sub, 0, !dbg !166
  br i1 %prol.iter37.cmp, label %for.body3.i.prol, label %for.body3.lr.ph.i.split.loopexit, !llvm.loop !168

for.body3.lr.ph.i.split.loopexit:                 ; preds = %for.body3.i.prol
  %add.i.lcssa.unr.ph = phi double [ %add.i.prol, %for.body3.i.prol ]
  %.unr38.ph = phi double [ %add.i.prol, %for.body3.i.prol ]
  %indvars.iv.i.unr.ph = phi i64 [ %indvars.iv.next.i.prol, %for.body3.i.prol ]
  %j.020.i.unr.ph = phi i32 [ %inc.i.prol, %for.body3.i.prol ]
  br label %for.body3.lr.ph.i.split

for.body3.lr.ph.i.split:                          ; preds = %for.body3.lr.ph.i.split.loopexit, %for.body3.lr.ph.i
  %add.i.lcssa.unr = phi double [ 0.000000e+00, %for.body3.lr.ph.i ], [ %add.i.lcssa.unr.ph, %for.body3.lr.ph.i.split.loopexit ]
  %.unr38 = phi double [ 0.000000e+00, %for.body3.lr.ph.i ], [ %.unr38.ph, %for.body3.lr.ph.i.split.loopexit ]
  %indvars.iv.i.unr = phi i64 [ 0, %for.body3.lr.ph.i ], [ %indvars.iv.i.unr.ph, %for.body3.lr.ph.i.split.loopexit ]
  %j.020.i.unr = phi i32 [ 0, %for.body3.lr.ph.i ], [ %j.020.i.unr.ph, %for.body3.lr.ph.i.split.loopexit ]
  %9 = icmp ult i32 %N, 2
  br i1 %9, label %for.inc8.i, label %for.body3.lr.ph.i.split.split

for.body3.lr.ph.i.split.split:                    ; preds = %for.body3.lr.ph.i.split
  br label %for.body3.i, !dbg !166

for.body3.i:                                      ; preds = %for.body3.i, %for.body3.lr.ph.i.split.split
  %10 = phi double [ %.unr38, %for.body3.lr.ph.i.split.split ], [ %add.i.1, %for.body3.i ], !dbg !160
  %indvars.iv.i = phi i64 [ %indvars.iv.i.unr, %for.body3.lr.ph.i.split.split ], [ %indvars.iv.next.i.1, %for.body3.i ], !dbg !144
  %j.020.i = phi i32 [ %j.020.i.unr, %for.body3.lr.ph.i.split.split ], [ %inc.i.1, %for.body3.i ], !dbg !144
  %11 = add nuw nsw i64 %indvars.iv.i, %indvars.iv26.i, !dbg !159
  %add2.i.i = add i32 %add.i.i, %j.020.i, !dbg !161
  %12 = trunc i64 %11 to i32, !dbg !157
  %mul.i.i = mul nsw i32 %add2.i.i, %12, !dbg !157
  %div.i.i = sdiv i32 %mul.i.i, 2, !dbg !157
  %add4.i.i = add i32 %div.i.i, %4, !dbg !157
  %conv.i.i = sitofp i32 %add4.i.i to double, !dbg !162
  %div5.i.i = fdiv double 1.000000e+00, %conv.i.i, !dbg !163
  %arrayidx5.i = getelementptr inbounds double* %u, i64 %indvars.iv.i, !dbg !164
  %13 = load double* %arrayidx5.i, align 8, !dbg !164, !tbaa !89
  %mul.i = fmul double %div5.i.i, %13, !dbg !158
  %add.i = fadd double %10, %mul.i, !dbg !165
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !166
  %inc.i = add nuw nsw i32 %j.020.i, 1, !dbg !167
  %lftr.wideiv28 = trunc i64 %indvars.iv.i to i32, !dbg !166
  %14 = add nuw nsw i64 %indvars.iv.next.i, %indvars.iv26.i, !dbg !159
  %add2.i.i.1 = add i32 %add.i.i, %inc.i, !dbg !161
  %15 = trunc i64 %14 to i32, !dbg !157
  %mul.i.i.1 = mul nsw i32 %add2.i.i.1, %15, !dbg !157
  %div.i.i.1 = sdiv i32 %mul.i.i.1, 2, !dbg !157
  %add4.i.i.1 = add i32 %div.i.i.1, %4, !dbg !157
  %conv.i.i.1 = sitofp i32 %add4.i.i.1 to double, !dbg !162
  %div5.i.i.1 = fdiv double 1.000000e+00, %conv.i.i.1, !dbg !163
  %arrayidx5.i.1 = getelementptr inbounds double* %u, i64 %indvars.iv.next.i, !dbg !164
  %16 = load double* %arrayidx5.i.1, align 8, !dbg !164, !tbaa !89
  %mul.i.1 = fmul double %div5.i.i.1, %16, !dbg !158
  %add.i.1 = fadd double %add.i, %mul.i.1, !dbg !165
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.next.i, 1, !dbg !166
  %inc.i.1 = add nuw nsw i32 %inc.i, 1, !dbg !167
  %lftr.wideiv28.1 = trunc i64 %indvars.iv.next.i to i32, !dbg !166
  %exitcond29.1 = icmp eq i32 %lftr.wideiv28.1, %1, !dbg !166
  br i1 %exitcond29.1, label %for.inc8.i.unr-lcssa, label %for.body3.i, !dbg !166

for.inc8.i.unr-lcssa:                             ; preds = %for.body3.i
  %add.i.lcssa.ph = phi double [ %add.i.1, %for.body3.i ]
  br label %for.inc8.i

for.inc8.i:                                       ; preds = %for.body3.lr.ph.i.split, %for.inc8.i.unr-lcssa
  %add.i.lcssa = phi double [ %add.i.lcssa.unr, %for.body3.lr.ph.i.split ], [ %add.i.lcssa.ph, %for.inc8.i.unr-lcssa ]
  store double %add.i.lcssa, double* %arrayidx.i, align 8, !dbg !165, !tbaa !89
  %exitcond31 = icmp eq i32 %3, %1, !dbg !153
  br i1 %exitcond31, label %for.body3.lr.ph.i5.preheader, label %for.body3.lr.ph.i, !dbg !153

for.body3.lr.ph.i5.preheader:                     ; preds = %for.inc8.i
  br label %for.body3.lr.ph.i5, !dbg !170

for.body3.lr.ph.i5:                               ; preds = %for.body3.lr.ph.i5.preheader, %for.inc8.i23
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %for.inc8.i23 ], [ 0, %for.body3.lr.ph.i5.preheader ], !dbg !171
  %arrayidx.i4 = getelementptr inbounds double* %AtAu, i64 %indvars.iv27.i, !dbg !170
  store double 0.000000e+00, double* %arrayidx.i4, align 8, !dbg !170, !tbaa !89
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !172, metadata !70), !dbg !173
  %17 = trunc i64 %indvars.iv27.i to i32, !dbg !174
  %add.i.i7 = add i32 %17, 1, !dbg !174
  %xtraiter = and i32 %N, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %N, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body3.i21.prol.preheader, label %for.body3.lr.ph.i5.split

for.body3.i21.prol.preheader:                     ; preds = %for.body3.lr.ph.i5
  br label %for.body3.i21.prol, !dbg !174

for.body3.i21.prol:                               ; preds = %for.body3.i21.prol.preheader, %for.body3.i21.prol
  %18 = phi double [ %add.i17.prol, %for.body3.i21.prol ], [ 0.000000e+00, %for.body3.i21.prol.preheader ], !dbg !176
  %indvars.iv.i6.prol = phi i64 [ %indvars.iv.next.i11.prol, %for.body3.i21.prol ], [ 0, %for.body3.i21.prol.preheader ], !dbg !171
  %j.021.i.prol = phi i32 [ %inc.i18.prol, %for.body3.i21.prol ], [ 0, %for.body3.i21.prol.preheader ], !dbg !171
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.i21.prol ], [ %xtraiter, %for.body3.i21.prol.preheader ]
  %19 = add nuw nsw i64 %indvars.iv.i6.prol, %indvars.iv27.i, !dbg !174
  %add2.i.i8.prol = add i32 %add.i.i7, %j.021.i.prol, !dbg !177
  %20 = trunc i64 %19 to i32, !dbg !178
  %mul.i.i9.prol = mul nsw i32 %add2.i.i8.prol, %20, !dbg !178
  %div.i.i10.prol = sdiv i32 %mul.i.i9.prol, 2, !dbg !178
  %indvars.iv.next.i11.prol = add nuw nsw i64 %indvars.iv.i6.prol, 1, !dbg !179
  %21 = trunc i64 %indvars.iv.next.i11.prol to i32, !dbg !178
  %add4.i.i12.prol = add i32 %21, %div.i.i10.prol, !dbg !178
  %conv.i.i13.prol = sitofp i32 %add4.i.i12.prol to double, !dbg !180
  %div5.i.i14.prol = fdiv double 1.000000e+00, %conv.i.i13.prol, !dbg !181
  %arrayidx5.i15.prol = getelementptr inbounds double* %vla, i64 %indvars.iv.i6.prol, !dbg !182
  %22 = load double* %arrayidx5.i15.prol, align 8, !dbg !182, !tbaa !89
  %mul.i16.prol = fmul double %div5.i.i14.prol, %22, !dbg !175
  %add.i17.prol = fadd double %18, %mul.i16.prol, !dbg !183
  %inc.i18.prol = add nuw nsw i32 %j.021.i.prol, 1, !dbg !184
  %lftr.wideiv.prol = trunc i64 %indvars.iv.i6.prol to i32, !dbg !179
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %1, !dbg !179
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !179
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !179
  br i1 %prol.iter.cmp, label %for.body3.i21.prol, label %for.body3.lr.ph.i5.split.loopexit, !llvm.loop !185

for.body3.lr.ph.i5.split.loopexit:                ; preds = %for.body3.i21.prol
  %add.i17.lcssa.unr.ph = phi double [ %add.i17.prol, %for.body3.i21.prol ]
  %.unr.ph = phi double [ %add.i17.prol, %for.body3.i21.prol ]
  %indvars.iv.i6.unr.ph = phi i64 [ %indvars.iv.next.i11.prol, %for.body3.i21.prol ]
  %j.021.i.unr.ph = phi i32 [ %inc.i18.prol, %for.body3.i21.prol ]
  br label %for.body3.lr.ph.i5.split

for.body3.lr.ph.i5.split:                         ; preds = %for.body3.lr.ph.i5.split.loopexit, %for.body3.lr.ph.i5
  %add.i17.lcssa.unr = phi double [ 0.000000e+00, %for.body3.lr.ph.i5 ], [ %add.i17.lcssa.unr.ph, %for.body3.lr.ph.i5.split.loopexit ]
  %.unr = phi double [ 0.000000e+00, %for.body3.lr.ph.i5 ], [ %.unr.ph, %for.body3.lr.ph.i5.split.loopexit ]
  %indvars.iv.i6.unr = phi i64 [ 0, %for.body3.lr.ph.i5 ], [ %indvars.iv.i6.unr.ph, %for.body3.lr.ph.i5.split.loopexit ]
  %j.021.i.unr = phi i32 [ 0, %for.body3.lr.ph.i5 ], [ %j.021.i.unr.ph, %for.body3.lr.ph.i5.split.loopexit ]
  %23 = icmp ult i32 %N, 2
  br i1 %23, label %for.inc8.i23, label %for.body3.lr.ph.i5.split.split

for.body3.lr.ph.i5.split.split:                   ; preds = %for.body3.lr.ph.i5.split
  br label %for.body3.i21, !dbg !179

for.body3.i21:                                    ; preds = %for.body3.i21, %for.body3.lr.ph.i5.split.split
  %24 = phi double [ %.unr, %for.body3.lr.ph.i5.split.split ], [ %add.i17.1, %for.body3.i21 ], !dbg !176
  %indvars.iv.i6 = phi i64 [ %indvars.iv.i6.unr, %for.body3.lr.ph.i5.split.split ], [ %indvars.iv.next.i11.1, %for.body3.i21 ], !dbg !171
  %j.021.i = phi i32 [ %j.021.i.unr, %for.body3.lr.ph.i5.split.split ], [ %inc.i18.1, %for.body3.i21 ], !dbg !171
  %25 = add nuw nsw i64 %indvars.iv.i6, %indvars.iv27.i, !dbg !174
  %add2.i.i8 = add i32 %add.i.i7, %j.021.i, !dbg !177
  %26 = trunc i64 %25 to i32, !dbg !178
  %mul.i.i9 = mul nsw i32 %add2.i.i8, %26, !dbg !178
  %div.i.i10 = sdiv i32 %mul.i.i9, 2, !dbg !178
  %indvars.iv.next.i11 = add nuw nsw i64 %indvars.iv.i6, 1, !dbg !179
  %27 = trunc i64 %indvars.iv.next.i11 to i32, !dbg !178
  %add4.i.i12 = add i32 %27, %div.i.i10, !dbg !178
  %conv.i.i13 = sitofp i32 %add4.i.i12 to double, !dbg !180
  %div5.i.i14 = fdiv double 1.000000e+00, %conv.i.i13, !dbg !181
  %arrayidx5.i15 = getelementptr inbounds double* %vla, i64 %indvars.iv.i6, !dbg !182
  %28 = load double* %arrayidx5.i15, align 8, !dbg !182, !tbaa !89
  %mul.i16 = fmul double %div5.i.i14, %28, !dbg !175
  %add.i17 = fadd double %24, %mul.i16, !dbg !183
  %inc.i18 = add nuw nsw i32 %j.021.i, 1, !dbg !184
  %lftr.wideiv = trunc i64 %indvars.iv.i6 to i32, !dbg !179
  %29 = add nuw nsw i64 %indvars.iv.next.i11, %indvars.iv27.i, !dbg !174
  %add2.i.i8.1 = add i32 %add.i.i7, %inc.i18, !dbg !177
  %30 = trunc i64 %29 to i32, !dbg !178
  %mul.i.i9.1 = mul nsw i32 %add2.i.i8.1, %30, !dbg !178
  %div.i.i10.1 = sdiv i32 %mul.i.i9.1, 2, !dbg !178
  %indvars.iv.next.i11.1 = add nuw nsw i64 %indvars.iv.next.i11, 1, !dbg !179
  %31 = trunc i64 %indvars.iv.next.i11.1 to i32, !dbg !178
  %add4.i.i12.1 = add i32 %31, %div.i.i10.1, !dbg !178
  %conv.i.i13.1 = sitofp i32 %add4.i.i12.1 to double, !dbg !180
  %div5.i.i14.1 = fdiv double 1.000000e+00, %conv.i.i13.1, !dbg !181
  %arrayidx5.i15.1 = getelementptr inbounds double* %vla, i64 %indvars.iv.next.i11, !dbg !182
  %32 = load double* %arrayidx5.i15.1, align 8, !dbg !182, !tbaa !89
  %mul.i16.1 = fmul double %div5.i.i14.1, %32, !dbg !175
  %add.i17.1 = fadd double %add.i17, %mul.i16.1, !dbg !183
  %inc.i18.1 = add nuw nsw i32 %inc.i18, 1, !dbg !184
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.i11 to i32, !dbg !179
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %1, !dbg !179
  br i1 %exitcond.1, label %for.inc8.i23.unr-lcssa, label %for.body3.i21, !dbg !179

for.inc8.i23.unr-lcssa:                           ; preds = %for.body3.i21
  %add.i17.lcssa.ph = phi double [ %add.i17.1, %for.body3.i21 ]
  br label %for.inc8.i23

for.inc8.i23:                                     ; preds = %for.body3.lr.ph.i5.split, %for.inc8.i23.unr-lcssa
  %add.i17.lcssa = phi double [ %add.i17.lcssa.unr, %for.body3.lr.ph.i5.split ], [ %add.i17.lcssa.ph, %for.inc8.i23.unr-lcssa ]
  store double %add.i17.lcssa, double* %arrayidx.i4, align 8, !dbg !183, !tbaa !89
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !186
  %exitcond26 = icmp eq i32 %17, %1, !dbg !186
  br i1 %exitcond26, label %eval_At_times_u.exit.loopexit, label %for.body3.lr.ph.i5, !dbg !186

eval_At_times_u.exit.loopexit:                    ; preds = %for.inc8.i23
  br label %eval_At_times_u.exit

eval_At_times_u.exit:                             ; preds = %eval_At_times_u.exit.loopexit, %entry
  ret void, !dbg !187
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !50, metadata !70), !dbg !188
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !51, metadata !70), !dbg !189
  %cmp = icmp eq i32 %argc, 2, !dbg !190
  br i1 %cmp, label %cond.end, label %cond.end.thread, !dbg !191

cond.end.thread:                                  ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !53, metadata !70), !dbg !192
  %vla5869 = alloca [2000 x double], align 16, !dbg !193
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !54, metadata !70), !dbg !194
  %vla15970 = alloca [2000 x double], align 16, !dbg !193
  tail call void @llvm.dbg.declare(metadata double* %vla1, metadata !55, metadata !70), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !70), !dbg !196
  %vla15970.sub = getelementptr inbounds [2000 x double]* %vla15970, i64 0, i64 0
  %vla5869.sub = getelementptr inbounds [2000 x double]* %vla5869, i64 0, i64 0
  br label %for.body.lr.ph, !dbg !197

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !199
  %0 = load i8** %arrayidx, align 8, !dbg !199, !tbaa !201
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !203, metadata !70) #4, !dbg !205
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #4, !dbg !206
  %conv.i = trunc i64 %call.i to i32, !dbg !207
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !53, metadata !70), !dbg !192
  %1 = and i64 %call.i, 4294967295, !dbg !193
  %vla = alloca double, i64 %1, align 16, !dbg !193
  tail call void @llvm.dbg.declare(metadata double* %vla, metadata !54, metadata !70), !dbg !194
  %vla1 = alloca double, i64 %1, align 16, !dbg !193
  tail call void @llvm.dbg.declare(metadata double* %vla1, metadata !55, metadata !70), !dbg !195
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !70), !dbg !196
  %cmp251 = icmp sgt i32 %conv.i, 0, !dbg !208
  br i1 %cmp251, label %for.body.lr.ph, label %for.cond4.preheader, !dbg !197

for.body.lr.ph:                                   ; preds = %cond.end.thread, %cond.end
  %vla166 = phi double* [ %vla15970.sub, %cond.end.thread ], [ %vla1, %cond.end ]
  %vla63 = phi double* [ %vla5869.sub, %cond.end.thread ], [ %vla, %cond.end ]
  %cond62 = phi i32 [ 2000, %cond.end.thread ], [ %conv.i, %cond.end ]
  %2 = add i32 %cond62, -1, !dbg !197
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1, !dbg !197
  %end.idx = add nuw nsw i64 %3, 1, !dbg !197
  %n.vec = and i64 %4, 8589934588, !dbg !197
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !197
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body.lr.ph
  %5 = add i32 %cond62, -1
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1
  %8 = lshr i64 %7, 2
  %9 = mul i64 %8, 4
  %10 = add i64 %9, -4
  %11 = lshr i64 %10, 2
  %12 = add i64 %11, 1
  %xtraiter84 = and i64 %12, 3
  %lcmp.mod85 = icmp ne i64 %xtraiter84, 0
  %lcmp.overflow86 = icmp eq i64 %12, 0
  %lcmp.or87 = or i1 %lcmp.overflow86, %lcmp.mod85
  br i1 %lcmp.or87, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !197
  %prol.iter88 = phi i64 [ %xtraiter84, %vector.body.preheader ], [ %prol.iter88.sub, %vector.body.prol ]
  %13 = getelementptr inbounds double* %vla63, i64 %index.prol, !dbg !210
  %14 = bitcast double* %13 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %14, align 8, !dbg !210, !tbaa !89
  %.sum78.prol = or i64 %index.prol, 2, !dbg !210
  %15 = getelementptr double* %vla63, i64 %.sum78.prol, !dbg !210
  %16 = bitcast double* %15 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %16, align 8, !dbg !210, !tbaa !89
  %index.next.prol = add i64 %index.prol, 4, !dbg !197
  %17 = icmp eq i64 %index.next.prol, %n.vec, !dbg !197
  %prol.iter88.sub = sub i64 %prol.iter88, 1, !dbg !197
  %prol.iter88.cmp = icmp ne i64 %prol.iter88.sub, 0, !dbg !197
  br i1 %prol.iter88.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !211

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %18 = icmp ult i64 %12, 4
  br i1 %18, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !210

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.3, %vector.body ], !dbg !197
  %19 = getelementptr inbounds double* %vla63, i64 %index, !dbg !210
  %20 = bitcast double* %19 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %20, align 8, !dbg !210, !tbaa !89
  %.sum78 = or i64 %index, 2, !dbg !210
  %21 = getelementptr double* %vla63, i64 %.sum78, !dbg !210
  %22 = bitcast double* %21 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %22, align 8, !dbg !210, !tbaa !89
  %index.next = add i64 %index, 4, !dbg !197
  %23 = getelementptr inbounds double* %vla63, i64 %index.next, !dbg !210
  %24 = bitcast double* %23 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %24, align 8, !dbg !210, !tbaa !89
  %.sum78.1 = or i64 %index.next, 2, !dbg !210
  %25 = getelementptr double* %vla63, i64 %.sum78.1, !dbg !210
  %26 = bitcast double* %25 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %26, align 8, !dbg !210, !tbaa !89
  %index.next.1 = add i64 %index.next, 4, !dbg !197
  %27 = getelementptr inbounds double* %vla63, i64 %index.next.1, !dbg !210
  %28 = bitcast double* %27 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %28, align 8, !dbg !210, !tbaa !89
  %.sum78.2 = or i64 %index.next.1, 2, !dbg !210
  %29 = getelementptr double* %vla63, i64 %.sum78.2, !dbg !210
  %30 = bitcast double* %29 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %30, align 8, !dbg !210, !tbaa !89
  %index.next.2 = add i64 %index.next.1, 4, !dbg !197
  %31 = getelementptr inbounds double* %vla63, i64 %index.next.2, !dbg !210
  %32 = bitcast double* %31 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %32, align 8, !dbg !210, !tbaa !89
  %.sum78.3 = or i64 %index.next.2, 2, !dbg !210
  %33 = getelementptr double* %vla63, i64 %.sum78.3, !dbg !210
  %34 = bitcast double* %33 to <2 x double>*, !dbg !210
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %34, align 8, !dbg !210, !tbaa !89
  %index.next.3 = add i64 %index.next.2, 4, !dbg !197
  %35 = icmp eq i64 %index.next.3, %n.vec, !dbg !197
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !197, !llvm.loop !212

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond4.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %36 = trunc i64 %resume.val to i32
  %37 = sub i32 %cond62, %36
  %xtraiter79 = and i32 %37, 7
  %lcmp.mod80 = icmp ne i32 %xtraiter79, 0
  %lcmp.overflow81 = icmp eq i32 %37, 0
  %lcmp.or82 = or i1 %lcmp.overflow81, %lcmp.mod80
  br i1 %lcmp.or82, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %for.body.prol ], [ %resume.val, %for.body.preheader ]
  %prol.iter83 = phi i32 [ %xtraiter79, %for.body.preheader ], [ %prol.iter83.sub, %for.body.prol ]
  %arrayidx3.prol = getelementptr inbounds double* %vla63, i64 %indvars.iv54.prol, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.prol, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1, !dbg !197
  %lftr.wideiv56.prol = trunc i64 %indvars.iv54.prol to i32, !dbg !197
  %exitcond57.prol = icmp eq i32 %lftr.wideiv56.prol, %2, !dbg !197
  %prol.iter83.sub = sub i32 %prol.iter83, 1, !dbg !197
  %prol.iter83.cmp = icmp ne i32 %prol.iter83.sub, 0, !dbg !197
  br i1 %prol.iter83.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !215

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv54.unr = phi i64 [ %resume.val, %for.body.preheader ], [ %indvars.iv.next55.prol, %for.body.prol ]
  %38 = icmp ult i32 %37, 8
  br i1 %38, label %for.cond4.preheader.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !210

for.cond4.preheader.loopexit.unr-lcssa:           ; preds = %for.body
  br label %for.cond4.preheader.loopexit

for.cond4.preheader.loopexit:                     ; preds = %for.body.preheader.split, %for.cond4.preheader.loopexit.unr-lcssa
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.loopexit, %middle.block, %cond.end
  %cmp25167 = phi i1 [ false, %cond.end ], [ true, %middle.block ], [ true, %for.cond4.preheader.loopexit ]
  %vla165 = phi double* [ %vla1, %cond.end ], [ %vla166, %middle.block ], [ %vla166, %for.cond4.preheader.loopexit ]
  %vla64 = phi double* [ %vla, %cond.end ], [ %vla63, %middle.block ], [ %vla63, %for.cond4.preheader.loopexit ]
  %cond61 = phi i32 [ %conv.i, %cond.end ], [ %cond62, %middle.block ], [ %cond62, %for.cond4.preheader.loopexit ]
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  call void @eval_AtA_times_u(i32 %cond61, double* %vla64, double* %vla165), !dbg !216
  call void @eval_AtA_times_u(i32 %cond61, double* %vla165, double* %vla64), !dbg !220
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !52, metadata !70), !dbg !196
  br i1 %cmp25167, label %for.body12.lr.ph, label %for.end25, !dbg !221

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %for.body.preheader.split.split ], [ %indvars.iv.next55.7, %for.body ]
  %arrayidx3 = getelementptr inbounds double* %vla63, i64 %indvars.iv54, !dbg !210
  store double 1.000000e+00, double* %arrayidx3, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1, !dbg !197
  %lftr.wideiv56 = trunc i64 %indvars.iv54 to i32, !dbg !197
  %arrayidx3.1 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.1, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv.next55, 1, !dbg !197
  %lftr.wideiv56.1 = trunc i64 %indvars.iv.next55 to i32, !dbg !197
  %arrayidx3.2 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.1, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.2, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.2 = add nuw nsw i64 %indvars.iv.next55.1, 1, !dbg !197
  %lftr.wideiv56.2 = trunc i64 %indvars.iv.next55.1 to i32, !dbg !197
  %arrayidx3.3 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.2, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.3, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.3 = add nuw nsw i64 %indvars.iv.next55.2, 1, !dbg !197
  %lftr.wideiv56.3 = trunc i64 %indvars.iv.next55.2 to i32, !dbg !197
  %arrayidx3.4 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.3, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.4, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.4 = add nuw nsw i64 %indvars.iv.next55.3, 1, !dbg !197
  %lftr.wideiv56.4 = trunc i64 %indvars.iv.next55.3 to i32, !dbg !197
  %arrayidx3.5 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.4, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.5, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.5 = add nuw nsw i64 %indvars.iv.next55.4, 1, !dbg !197
  %lftr.wideiv56.5 = trunc i64 %indvars.iv.next55.4 to i32, !dbg !197
  %arrayidx3.6 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.5, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.6, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.6 = add nuw nsw i64 %indvars.iv.next55.5, 1, !dbg !197
  %lftr.wideiv56.6 = trunc i64 %indvars.iv.next55.5 to i32, !dbg !197
  %arrayidx3.7 = getelementptr inbounds double* %vla63, i64 %indvars.iv.next55.6, !dbg !210
  store double 1.000000e+00, double* %arrayidx3.7, align 8, !dbg !210, !tbaa !89
  %indvars.iv.next55.7 = add nuw nsw i64 %indvars.iv.next55.6, 1, !dbg !197
  %lftr.wideiv56.7 = trunc i64 %indvars.iv.next55.6 to i32, !dbg !197
  %exitcond57.7 = icmp eq i32 %lftr.wideiv56.7, %2, !dbg !197
  br i1 %exitcond57.7, label %for.cond4.preheader.loopexit.unr-lcssa, label %for.body, !dbg !197, !llvm.loop !223

for.body12.lr.ph:                                 ; preds = %for.cond4.preheader
  %39 = add i32 %cond61, -1, !dbg !221
  %xtraiter = and i32 %cond61, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %cond61, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body12.prol, label %for.body12.lr.ph.split

for.body12.prol:                                  ; preds = %for.body12.prol, %for.body12.lr.ph
  %indvars.iv.prol = phi i64 [ 0, %for.body12.lr.ph ], [ %indvars.iv.next.prol, %for.body12.prol ]
  %40 = phi <2 x double> [ zeroinitializer, %for.body12.lr.ph ], [ %47, %for.body12.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body12.lr.ph ], [ %prol.iter.sub, %for.body12.prol ]
  %arrayidx14.prol = getelementptr inbounds double* %vla64, i64 %indvars.iv.prol, !dbg !224
  %41 = load double* %arrayidx14.prol, align 8, !dbg !224, !tbaa !89
  %arrayidx16.prol = getelementptr inbounds double* %vla165, i64 %indvars.iv.prol, !dbg !227
  %42 = load double* %arrayidx16.prol, align 8, !dbg !227, !tbaa !89
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !56, metadata !70), !dbg !228
  %43 = insertelement <2 x double> undef, double %42, i32 0, !dbg !229
  %44 = insertelement <2 x double> %43, double %42, i32 1, !dbg !229
  %45 = insertelement <2 x double> %43, double %41, i32 1, !dbg !229
  %46 = fmul <2 x double> %44, %45, !dbg !229
  %47 = fadd <2 x double> %40, %46, !dbg !230
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !57, metadata !70), !dbg !231
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !221
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !221
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %39, !dbg !221
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !221
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !221
  br i1 %prol.iter.cmp, label %for.body12.prol, label %for.body12.lr.ph.split, !llvm.loop !232

for.body12.lr.ph.split:                           ; preds = %for.body12.prol, %for.body12.lr.ph
  %.lcssa.unr = phi <2 x double> [ zeroinitializer, %for.body12.lr.ph ], [ %47, %for.body12.prol ]
  %indvars.iv.unr = phi i64 [ 0, %for.body12.lr.ph ], [ %indvars.iv.next.prol, %for.body12.prol ]
  %.unr = phi <2 x double> [ zeroinitializer, %for.body12.lr.ph ], [ %47, %for.body12.prol ]
  %48 = icmp ult i32 %cond61, 2
  br i1 %48, label %for.end25.loopexit, label %for.body12.lr.ph.split.split

for.body12.lr.ph.split.split:                     ; preds = %for.body12.lr.ph.split
  br label %for.body12, !dbg !221

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body12.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body12 ]
  %49 = phi <2 x double> [ %.unr, %for.body12.lr.ph.split.split ], [ %63, %for.body12 ]
  %arrayidx14 = getelementptr inbounds double* %vla64, i64 %indvars.iv, !dbg !224
  %50 = load double* %arrayidx14, align 8, !dbg !224, !tbaa !89
  %arrayidx16 = getelementptr inbounds double* %vla165, i64 %indvars.iv, !dbg !227
  %51 = load double* %arrayidx16, align 8, !dbg !227, !tbaa !89
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !56, metadata !70), !dbg !228
  %52 = insertelement <2 x double> undef, double %51, i32 0, !dbg !229
  %53 = insertelement <2 x double> %52, double %51, i32 1, !dbg !229
  %54 = insertelement <2 x double> %52, double %50, i32 1, !dbg !229
  %55 = fmul <2 x double> %53, %54, !dbg !229
  %56 = fadd <2 x double> %49, %55, !dbg !230
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !57, metadata !70), !dbg !231
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !221
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !221
  %arrayidx14.1 = getelementptr inbounds double* %vla64, i64 %indvars.iv.next, !dbg !224
  %57 = load double* %arrayidx14.1, align 8, !dbg !224, !tbaa !89
  %arrayidx16.1 = getelementptr inbounds double* %vla165, i64 %indvars.iv.next, !dbg !227
  %58 = load double* %arrayidx16.1, align 8, !dbg !227, !tbaa !89
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !56, metadata !70), !dbg !228
  %59 = insertelement <2 x double> undef, double %58, i32 0, !dbg !229
  %60 = insertelement <2 x double> %59, double %58, i32 1, !dbg !229
  %61 = insertelement <2 x double> %59, double %57, i32 1, !dbg !229
  %62 = fmul <2 x double> %60, %61, !dbg !229
  %63 = fadd <2 x double> %56, %62, !dbg !230
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !57, metadata !70), !dbg !231
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !221
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !221
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %39, !dbg !221
  br i1 %exitcond.1, label %for.end25.loopexit.unr-lcssa, label %for.body12, !dbg !221

for.end25.loopexit.unr-lcssa:                     ; preds = %for.body12
  %.lcssa.ph = phi <2 x double> [ %63, %for.body12 ]
  br label %for.end25.loopexit

for.end25.loopexit:                               ; preds = %for.body12.lr.ph.split, %for.end25.loopexit.unr-lcssa
  %.lcssa = phi <2 x double> [ %.lcssa.unr, %for.body12.lr.ph.split ], [ %.lcssa.ph, %for.end25.loopexit.unr-lcssa ]
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %for.cond4.preheader
  %64 = phi <2 x double> [ zeroinitializer, %for.cond4.preheader ], [ %.lcssa, %for.end25.loopexit ]
  %65 = extractelement <2 x double> %64, i32 0, !dbg !233
  %66 = extractelement <2 x double> %64, i32 1, !dbg !233
  %div = fdiv double %66, %65, !dbg !233
  %call26 = tail call double @sqrt(double %div) #4, !dbg !234
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), double %call26) #4, !dbg !235
  ret i32 0, !dbg !236
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68}
!llvm.ident = !{!69}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = !{!"spectral-norm.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !18, !30, !37, !46, !58}
!10 = !{!"0x2e\00eval_A\00eval_A\00\0013\000\001\000\000\00256\001\0013", !1, !11, !12, null, double (i32, i32)* @eval_A, null, null, !15} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!14, !4, !4}
!14 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!15 = !{!16, !17}
!16 = !{!"0x101\00i\0016777229\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [i] [line 13]
!17 = !{!"0x101\00j\0033554445\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [j] [line 13]
!18 = !{!"0x2e\00eval_A_times_u\00eval_A_times_u\00\0015\000\001\000\000\00256\001\0016", !1, !11, !19, null, void (i32, double*, double*)* @eval_A_times_u, null, null, !24} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{null, !4, !21, !23}
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = !{!"0x26\00\000\000\000\000\000", null, null, !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!24 = !{!25, !26, !27, !28, !29}
!25 = !{!"0x101\00N\0016777231\000", !18, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 15]
!26 = !{!"0x101\00u\0033554447\000", !18, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 15]
!27 = !{!"0x101\00Au\0050331663\000", !18, !11, !23} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!28 = !{!"0x100\00i\0017\000", !18, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 17]
!29 = !{!"0x100\00j\0017\000", !18, !11, !4}      ; [ DW_TAG_auto_variable ] [j] [line 17]
!30 = !{!"0x2e\00eval_At_times_u\00eval_At_times_u\00\0025\000\001\000\000\00256\001\0026", !1, !11, !19, null, void (i32, double*, double*)* @eval_At_times_u, null, null, !31} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!31 = !{!32, !33, !34, !35, !36}
!32 = !{!"0x101\00N\0016777241\000", !30, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 25]
!33 = !{!"0x101\00u\0033554457\000", !30, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 25]
!34 = !{!"0x101\00Au\0050331673\000", !30, !11, !23} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!35 = !{!"0x100\00i\0027\000", !30, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 27]
!36 = !{!"0x100\00j\0027\000", !30, !11, !4}      ; [ DW_TAG_auto_variable ] [j] [line 27]
!37 = !{!"0x2e\00eval_AtA_times_u\00eval_AtA_times_u\00\0035\000\001\000\000\00256\001\0036", !1, !11, !19, null, void (i32, double*, double*)* @eval_AtA_times_u, null, null, !38} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!38 = !{!39, !40, !41, !42}
!39 = !{!"0x101\00N\0016777251\000", !37, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 35]
!40 = !{!"0x101\00u\0033554467\000", !37, !11, !21} ; [ DW_TAG_arg_variable ] [u] [line 35]
!41 = !{!"0x101\00AtAu\0050331683\000", !37, !11, !23} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!42 = !{!"0x100\00v\0036\008192", !37, !11, !43}  ; [ DW_TAG_auto_variable ] [v] [line 36]
!43 = !{!"0x1\00\000\000\0064\000\000\000", null, null, !14, !44, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!44 = !{!45}
!45 = !{!"0x21\000\00-1"}                         ; [ DW_TAG_subrange_type ] [unbounded]
!46 = !{!"0x2e\00main\00main\00\0038\000\001\000\000\00256\001\0039", !1, !11, !47, null, i32 (i32, i8**)* @main, null, null, !49} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!4, !4, !5}
!49 = !{!50, !51, !52, !53, !54, !55, !56, !57}
!50 = !{!"0x101\00argc\0016777254\000", !46, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!51 = !{!"0x101\00argv\0033554470\000", !46, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!52 = !{!"0x100\00i\0040\000", !46, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 40]
!53 = !{!"0x100\00N\0041\000", !46, !11, !4}      ; [ DW_TAG_auto_variable ] [N] [line 41]
!54 = !{!"0x100\00u\0042\008192", !46, !11, !43}  ; [ DW_TAG_auto_variable ] [u] [line 42]
!55 = !{!"0x100\00v\0042\008192", !46, !11, !43}  ; [ DW_TAG_auto_variable ] [v] [line 42]
!56 = !{!"0x100\00vBv\0042\000", !46, !11, !14}   ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!57 = !{!"0x100\00vv\0042\000", !46, !11, !14}    ; [ DW_TAG_auto_variable ] [vv] [line 42]
!58 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !59, !60, !61, null, null, null, null, !65} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!59 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!60 = !{!"0x29", !59}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{!4, !63}
!63 = !{!"0xf\00\000\0064\0064\000\000", null, null, !64} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!64 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!65 = !{!66}
!66 = !{!"0x101\00__nptr\0016777494\000", !58, !60, !63} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!67 = !{i32 2, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 2}
!69 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!70 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!71 = !MDLocation(line: 13, column: 19, scope: !10)
!72 = !MDLocation(line: 13, column: 26, scope: !10)
!73 = !MDLocation(line: 13, column: 44, scope: !10)
!74 = !MDLocation(line: 13, column: 50, scope: !10)
!75 = !MDLocation(line: 13, column: 43, scope: !10)
!76 = !MDLocation(line: 13, column: 42, scope: !10)
!77 = !MDLocation(line: 13, column: 38, scope: !10)
!78 = !MDLocation(line: 13, column: 31, scope: !10)
!79 = !MDLocation(line: 15, column: 25, scope: !18)
!80 = !MDLocation(line: 15, column: 41, scope: !18)
!81 = !MDLocation(line: 15, column: 53, scope: !18)
!82 = !MDLocation(line: 17, column: 7, scope: !18)
!83 = !MDLocation(line: 18, column: 11, scope: !84)
!84 = !{!"0xb\0018\003\001", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!85 = !{!"0xb\0018\003\000", !1, !18}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!86 = !MDLocation(line: 18, column: 3, scope: !85)
!87 = !MDLocation(line: 20, column: 7, scope: !88)
!88 = !{!"0xb\0019\005\002", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!89 = !{!90, !90, i64 0}
!90 = !{!"double", !91, i64 0}
!91 = !{!"omnipotent char", !92, i64 0}
!92 = !{!"Simple C/C++ TBAA"}
!93 = !MDLocation(line: 17, column: 9, scope: !18)
!94 = !MDLocation(line: 13, column: 43, scope: !10, inlinedAt: !95)
!95 = !MDLocation(line: 21, column: 31, scope: !96)
!96 = !{!"0xb\0021\007\004", !1, !97}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!97 = !{!"0xb\0021\007\003", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!98 = !MDLocation(line: 21, column: 7, scope: !97)
!99 = !MDLocation(line: 13, column: 19, scope: !10, inlinedAt: !95)
!100 = !{!"0x101\00j\0033554445\000", !10, !11, !4, !95} ; [ DW_TAG_arg_variable ] [j] [line 13]
!101 = !MDLocation(line: 13, column: 26, scope: !10, inlinedAt: !95)
!102 = !MDLocation(line: 13, column: 44, scope: !10, inlinedAt: !95)
!103 = !MDLocation(line: 13, column: 50, scope: !10, inlinedAt: !95)
!104 = !MDLocation(line: 13, column: 42, scope: !10, inlinedAt: !95)
!105 = !MDLocation(line: 13, column: 38, scope: !10, inlinedAt: !95)
!106 = !MDLocation(line: 21, column: 43, scope: !96)
!107 = !MDLocation(line: 21, column: 24, scope: !96)
!108 = !MDLocation(line: 21, column: 19, scope: !109)
!109 = !{!"0xb\003", !1, !96}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!110 = !MDLocation(line: 23, column: 1, scope: !18)
!111 = !MDLocation(line: 25, column: 26, scope: !30)
!112 = !MDLocation(line: 25, column: 42, scope: !30)
!113 = !MDLocation(line: 25, column: 54, scope: !30)
!114 = !MDLocation(line: 27, column: 7, scope: !30)
!115 = !MDLocation(line: 28, column: 11, scope: !116)
!116 = !{!"0xb\0028\003\006", !1, !117}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!117 = !{!"0xb\0028\003\005", !1, !30}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!118 = !MDLocation(line: 28, column: 3, scope: !117)
!119 = !MDLocation(line: 30, column: 7, scope: !120)
!120 = !{!"0xb\0029\005\007", !1, !116}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!121 = !MDLocation(line: 27, column: 9, scope: !30)
!122 = !MDLocation(line: 31, column: 7, scope: !123)
!123 = !{!"0xb\0031\007\008", !1, !120}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!124 = !MDLocation(line: 13, column: 19, scope: !10, inlinedAt: !125)
!125 = !MDLocation(line: 31, column: 31, scope: !126)
!126 = !{!"0xb\0031\007\009", !1, !123}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!127 = !{!"0x101\00i\0016777229\000", !10, !11, !4, !125} ; [ DW_TAG_arg_variable ] [i] [line 13]
!128 = !MDLocation(line: 13, column: 44, scope: !10, inlinedAt: !125)
!129 = !MDLocation(line: 13, column: 50, scope: !10, inlinedAt: !125)
!130 = !MDLocation(line: 13, column: 43, scope: !10, inlinedAt: !125)
!131 = !MDLocation(line: 13, column: 42, scope: !10, inlinedAt: !125)
!132 = !MDLocation(line: 13, column: 38, scope: !10, inlinedAt: !125)
!133 = !MDLocation(line: 31, column: 43, scope: !126)
!134 = !MDLocation(line: 31, column: 24, scope: !126)
!135 = !MDLocation(line: 31, column: 19, scope: !136)
!136 = !{!"0xb\003", !1, !126}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!137 = !MDLocation(line: 33, column: 1, scope: !30)
!138 = !MDLocation(line: 35, column: 27, scope: !37)
!139 = !MDLocation(line: 35, column: 43, scope: !37)
!140 = !MDLocation(line: 35, column: 55, scope: !37)
!141 = !MDLocation(line: 36, column: 3, scope: !37)
!142 = !MDLocation(line: 36, column: 10, scope: !37)
!143 = !{!"0x101\00N\0016777231\000", !18, !11, !4, !144} ; [ DW_TAG_arg_variable ] [N] [line 15]
!144 = !MDLocation(line: 36, column: 16, scope: !37)
!145 = !MDLocation(line: 15, column: 25, scope: !18, inlinedAt: !144)
!146 = !{!"0x101\00u\0033554447\000", !18, !11, !21, !144} ; [ DW_TAG_arg_variable ] [u] [line 15]
!147 = !MDLocation(line: 15, column: 41, scope: !18, inlinedAt: !144)
!148 = !{!"0x101\00Au\0050331663\000", !18, !11, !23, !144} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!149 = !MDLocation(line: 15, column: 53, scope: !18, inlinedAt: !144)
!150 = !{!"0x100\00i\0017\000", !18, !11, !4, !144} ; [ DW_TAG_auto_variable ] [i] [line 17]
!151 = !MDLocation(line: 17, column: 7, scope: !18, inlinedAt: !144)
!152 = !MDLocation(line: 18, column: 11, scope: !84, inlinedAt: !144)
!153 = !MDLocation(line: 18, column: 3, scope: !85, inlinedAt: !144)
!154 = !MDLocation(line: 20, column: 7, scope: !88, inlinedAt: !144)
!155 = !{!"0x100\00j\0017\000", !18, !11, !4, !144} ; [ DW_TAG_auto_variable ] [j] [line 17]
!156 = !MDLocation(line: 17, column: 9, scope: !18, inlinedAt: !144)
!157 = !MDLocation(line: 13, column: 43, scope: !10, inlinedAt: !158)
!158 = !MDLocation(line: 21, column: 31, scope: !96, inlinedAt: !144)
!159 = !MDLocation(line: 13, column: 44, scope: !10, inlinedAt: !158)
!160 = !MDLocation(line: 13, column: 19, scope: !10, inlinedAt: !158)
!161 = !MDLocation(line: 13, column: 50, scope: !10, inlinedAt: !158)
!162 = !MDLocation(line: 13, column: 42, scope: !10, inlinedAt: !158)
!163 = !MDLocation(line: 13, column: 38, scope: !10, inlinedAt: !158)
!164 = !MDLocation(line: 21, column: 43, scope: !96, inlinedAt: !144)
!165 = !MDLocation(line: 21, column: 24, scope: !96, inlinedAt: !144)
!166 = !MDLocation(line: 21, column: 7, scope: !97, inlinedAt: !144)
!167 = !MDLocation(line: 21, column: 19, scope: !109, inlinedAt: !144)
!168 = distinct !{!168, !169}
!169 = !{!"llvm.loop.unroll.disable"}
!170 = !MDLocation(line: 30, column: 7, scope: !120, inlinedAt: !171)
!171 = !MDLocation(line: 36, column: 39, scope: !37)
!172 = !{!"0x100\00j\0027\000", !30, !11, !4, !171} ; [ DW_TAG_auto_variable ] [j] [line 27]
!173 = !MDLocation(line: 27, column: 9, scope: !30, inlinedAt: !171)
!174 = !MDLocation(line: 13, column: 44, scope: !10, inlinedAt: !175)
!175 = !MDLocation(line: 31, column: 31, scope: !126, inlinedAt: !171)
!176 = !MDLocation(line: 13, column: 19, scope: !10, inlinedAt: !175)
!177 = !MDLocation(line: 13, column: 50, scope: !10, inlinedAt: !175)
!178 = !MDLocation(line: 13, column: 43, scope: !10, inlinedAt: !175)
!179 = !MDLocation(line: 31, column: 7, scope: !123, inlinedAt: !171)
!180 = !MDLocation(line: 13, column: 42, scope: !10, inlinedAt: !175)
!181 = !MDLocation(line: 13, column: 38, scope: !10, inlinedAt: !175)
!182 = !MDLocation(line: 31, column: 43, scope: !126, inlinedAt: !171)
!183 = !MDLocation(line: 31, column: 24, scope: !126, inlinedAt: !171)
!184 = !MDLocation(line: 31, column: 19, scope: !136, inlinedAt: !171)
!185 = distinct !{!185, !169}
!186 = !MDLocation(line: 28, column: 3, scope: !117, inlinedAt: !171)
!187 = !MDLocation(line: 36, column: 66, scope: !37)
!188 = !MDLocation(line: 38, column: 14, scope: !46)
!189 = !MDLocation(line: 38, column: 26, scope: !46)
!190 = !MDLocation(line: 41, column: 13, scope: !46)
!191 = !MDLocation(line: 41, column: 12, scope: !46)
!192 = !MDLocation(line: 41, column: 7, scope: !46)
!193 = !MDLocation(line: 42, column: 3, scope: !46)
!194 = !MDLocation(line: 42, column: 10, scope: !46)
!195 = !MDLocation(line: 42, column: 15, scope: !46)
!196 = !MDLocation(line: 40, column: 7, scope: !46)
!197 = !MDLocation(line: 43, column: 3, scope: !198)
!198 = !{!"0xb\0043\003\0010", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!199 = !MDLocation(line: 41, column: 31, scope: !200)
!200 = !{!"0xb\001", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!201 = !{!202, !202, i64 0}
!202 = !{!"any pointer", !91, i64 0}
!203 = !{!"0x101\00__nptr\0016777494\000", !58, !60, !63, !204} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!204 = !MDLocation(line: 41, column: 26, scope: !46)
!205 = !MDLocation(line: 278, column: 1, scope: !58, inlinedAt: !204)
!206 = !MDLocation(line: 280, column: 16, scope: !58, inlinedAt: !204)
!207 = !MDLocation(line: 280, column: 10, scope: !58, inlinedAt: !204)
!208 = !MDLocation(line: 43, column: 11, scope: !209)
!209 = !{!"0xb\0043\003\0011", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!210 = !MDLocation(line: 43, column: 20, scope: !209)
!211 = distinct !{!211, !169}
!212 = distinct !{!212, !213, !214}
!213 = !{!"llvm.loop.vectorize.width", i32 1}
!214 = !{!"llvm.loop.interleave.count", i32 1}
!215 = distinct !{!215, !169}
!216 = !MDLocation(line: 46, column: 7, scope: !217)
!217 = !{!"0xb\0045\005\0014", !1, !218}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!218 = !{!"0xb\0044\003\0013", !1, !219}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!219 = !{!"0xb\0044\003\0012", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!220 = !MDLocation(line: 47, column: 7, scope: !217)
!221 = !MDLocation(line: 50, column: 3, scope: !222)
!222 = !{!"0xb\0050\003\0015", !1, !46}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!223 = distinct !{!223, !213, !214}
!224 = !MDLocation(line: 50, column: 27, scope: !225)
!225 = !{!"0xb\0050\0020\0017", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!226 = !{!"0xb\0050\003\0016", !1, !222}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/spectral-norm.c]
!227 = !MDLocation(line: 50, column: 32, scope: !225)
!228 = !MDLocation(line: 42, column: 20, scope: !46)
!229 = !MDLocation(line: 50, column: 42, scope: !225)
!230 = !MDLocation(line: 50, column: 38, scope: !225)
!231 = !MDLocation(line: 42, column: 24, scope: !46)
!232 = distinct !{!232, !169}
!233 = !MDLocation(line: 51, column: 25, scope: !46)
!234 = !MDLocation(line: 51, column: 20, scope: !46)
!235 = !MDLocation(line: 51, column: 3, scope: !46)
!236 = !MDLocation(line: 53, column: 1, scope: !46)
