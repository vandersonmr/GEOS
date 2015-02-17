; ModuleID = 'LU.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define double @LU_num_flops(i32 %N) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !12, metadata !67), !dbg !68
  %conv = sitofp i32 %N to double, !dbg !69
  tail call void @llvm.dbg.value(metadata double %conv, i64 0, metadata !13, metadata !67), !dbg !70
  %mul = fmul double %conv, 2.000000e+00, !dbg !71
  %mul1 = fmul double %conv, %mul, !dbg !71
  %mul2 = fmul double %conv, %mul1, !dbg !71
  %div = fdiv double %mul2, 3.000000e+00, !dbg !71
  ret double %div, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @LU_copy_matrix(i32 %M, i32 %N, double** nocapture readonly %lu, double** nocapture readonly %A) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !20, metadata !67), !dbg !73
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !21, metadata !67), !dbg !74
  tail call void @llvm.dbg.value(metadata double** %lu, i64 0, metadata !22, metadata !67), !dbg !75
  tail call void @llvm.dbg.value(metadata double** %A, i64 0, metadata !23, metadata !67), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !67), !dbg !77
  %cmp21 = icmp sgt i32 %M, 0, !dbg !78
  %cmp219 = icmp sgt i32 %N, 0, !dbg !81
  %or.cond = and i1 %cmp21, %cmp219, !dbg !84
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.split.us, label %for.end12, !dbg !84

for.cond1.preheader.lr.ph.split.us:               ; preds = %entry
  %0 = add i32 %N, -1, !dbg !84
  %1 = add i32 %M, -1, !dbg !84
  %2 = zext i32 %0 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !84
  %4 = zext i32 %0 to i64
  %5 = zext i32 %0 to i64
  %6 = add i64 %5, 1, !dbg !84
  %7 = lshr i64 %6, 2, !dbg !84
  %8 = mul i64 %7, 4, !dbg !84
  %9 = add i64 %8, -4, !dbg !84
  %10 = lshr i64 %9, 2, !dbg !84
  %11 = add i64 %10, 1, !dbg !84
  br label %for.body3.lr.ph.us, !dbg !84

for.inc10.us.loopexit.unr-lcssa:                  ; preds = %for.body3.us
  br label %for.inc10.us.loopexit

for.inc10.us.loopexit:                            ; preds = %for.body3.us.preheader.split, %for.inc10.us.loopexit.unr-lcssa
  br label %for.inc10.us

for.inc10.us:                                     ; preds = %for.inc10.us.loopexit, %middle.block
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !84
  %lftr.wideiv25 = trunc i64 %indvars.iv23 to i32, !dbg !84
  %exitcond26 = icmp eq i32 %lftr.wideiv25, %1, !dbg !84
  br i1 %exitcond26, label %for.end12.loopexit, label %for.body3.lr.ph.us, !dbg !84

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body3.us.preheader.split.split ], [ %indvars.iv.next.3, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds double* %16, i64 %indvars.iv, !dbg !85
  %12 = load double* %arrayidx5.us, align 8, !dbg !85, !tbaa !86
  %arrayidx9.us = getelementptr inbounds double* %17, i64 %indvars.iv, !dbg !90
  store double %12, double* %arrayidx9.us, align 8, !dbg !90, !tbaa !86
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !91
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !91
  %arrayidx5.us.1 = getelementptr inbounds double* %16, i64 %indvars.iv.next, !dbg !85
  %13 = load double* %arrayidx5.us.1, align 8, !dbg !85, !tbaa !86
  %arrayidx9.us.1 = getelementptr inbounds double* %17, i64 %indvars.iv.next, !dbg !90
  store double %13, double* %arrayidx9.us.1, align 8, !dbg !90, !tbaa !86
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !91
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !91
  %arrayidx5.us.2 = getelementptr inbounds double* %16, i64 %indvars.iv.next.1, !dbg !85
  %14 = load double* %arrayidx5.us.2, align 8, !dbg !85, !tbaa !86
  %arrayidx9.us.2 = getelementptr inbounds double* %17, i64 %indvars.iv.next.1, !dbg !90
  store double %14, double* %arrayidx9.us.2, align 8, !dbg !90, !tbaa !86
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !91
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !91
  %arrayidx5.us.3 = getelementptr inbounds double* %16, i64 %indvars.iv.next.2, !dbg !85
  %15 = load double* %arrayidx5.us.3, align 8, !dbg !85, !tbaa !86
  %arrayidx9.us.3 = getelementptr inbounds double* %17, i64 %indvars.iv.next.2, !dbg !90
  store double %15, double* %arrayidx9.us.3, align 8, !dbg !90, !tbaa !86
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !91
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !91
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0, !dbg !91
  br i1 %exitcond.3, label %for.inc10.us.loopexit.unr-lcssa, label %for.body3.us, !dbg !91, !llvm.loop !92

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.lr.ph.split.us, %for.inc10.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc10.us ], [ 0, %for.cond1.preheader.lr.ph.split.us ]
  %arrayidx.us = getelementptr inbounds double** %A, i64 %indvars.iv23, !dbg !85
  %16 = load double** %arrayidx.us, align 8, !dbg !85, !tbaa !95
  %arrayidx8.us = getelementptr inbounds double** %lu, i64 %indvars.iv23, !dbg !90
  %17 = load double** %arrayidx8.us, align 8, !dbg !90, !tbaa !95
  %end.idx = add nuw nsw i64 %2, 1, !dbg !91
  %n.vec = and i64 %3, 8589934588, !dbg !91
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !91
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body3.lr.ph.us
  %scevgep28 = getelementptr double* %16, i64 %4
  %bound0 = icmp ule double* %17, %scevgep28
  %scevgep = getelementptr double* %17, i64 %4
  %bound1 = icmp ule double* %16, %scevgep
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %xtraiter = and i64 %11, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %11, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !85

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !91
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %18 = getelementptr inbounds double* %16, i64 %index.prol, !dbg !85
  %19 = bitcast double* %18 to <2 x double>*, !dbg !85
  %wide.load.prol = load <2 x double>* %19, align 8, !dbg !85, !tbaa !86
  %.sum38.prol = or i64 %index.prol, 2, !dbg !85
  %20 = getelementptr double* %16, i64 %.sum38.prol, !dbg !85
  %21 = bitcast double* %20 to <2 x double>*, !dbg !85
  %wide.load31.prol = load <2 x double>* %21, align 8, !dbg !85, !tbaa !86
  %22 = getelementptr inbounds double* %17, i64 %index.prol, !dbg !90
  %23 = bitcast double* %22 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load.prol, <2 x double>* %23, align 8, !dbg !90, !tbaa !86
  %.sum39.prol = or i64 %index.prol, 2, !dbg !90
  %24 = getelementptr double* %17, i64 %.sum39.prol, !dbg !90
  %25 = bitcast double* %24 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load31.prol, <2 x double>* %25, align 8, !dbg !90, !tbaa !86
  %index.next.prol = add i64 %index.prol, 4, !dbg !91
  %26 = icmp eq i64 %index.next.prol, %n.vec, !dbg !91
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !91
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !91
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !97

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %27 = icmp ult i64 %11, 2
  br i1 %27, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !85

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !91
  %28 = getelementptr inbounds double* %16, i64 %index, !dbg !85
  %29 = bitcast double* %28 to <2 x double>*, !dbg !85
  %wide.load = load <2 x double>* %29, align 8, !dbg !85, !tbaa !86
  %.sum38 = or i64 %index, 2, !dbg !85
  %30 = getelementptr double* %16, i64 %.sum38, !dbg !85
  %31 = bitcast double* %30 to <2 x double>*, !dbg !85
  %wide.load31 = load <2 x double>* %31, align 8, !dbg !85, !tbaa !86
  %32 = getelementptr inbounds double* %17, i64 %index, !dbg !90
  %33 = bitcast double* %32 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load, <2 x double>* %33, align 8, !dbg !90, !tbaa !86
  %.sum39 = or i64 %index, 2, !dbg !90
  %34 = getelementptr double* %17, i64 %.sum39, !dbg !90
  %35 = bitcast double* %34 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load31, <2 x double>* %35, align 8, !dbg !90, !tbaa !86
  %index.next = add i64 %index, 4, !dbg !91
  %36 = getelementptr inbounds double* %16, i64 %index.next, !dbg !85
  %37 = bitcast double* %36 to <2 x double>*, !dbg !85
  %wide.load.1 = load <2 x double>* %37, align 8, !dbg !85, !tbaa !86
  %.sum38.1 = or i64 %index.next, 2, !dbg !85
  %38 = getelementptr double* %16, i64 %.sum38.1, !dbg !85
  %39 = bitcast double* %38 to <2 x double>*, !dbg !85
  %wide.load31.1 = load <2 x double>* %39, align 8, !dbg !85, !tbaa !86
  %40 = getelementptr inbounds double* %17, i64 %index.next, !dbg !90
  %41 = bitcast double* %40 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load.1, <2 x double>* %41, align 8, !dbg !90, !tbaa !86
  %.sum39.1 = or i64 %index.next, 2, !dbg !90
  %42 = getelementptr double* %17, i64 %.sum39.1, !dbg !90
  %43 = bitcast double* %42 to <2 x double>*, !dbg !90
  store <2 x double> %wide.load31.1, <2 x double>* %43, align 8, !dbg !90, !tbaa !86
  %index.next.1 = add i64 %index.next, 4, !dbg !91
  %44 = icmp eq i64 %index.next.1, %n.vec, !dbg !91
  br i1 %44, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !91, !llvm.loop !99

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body3.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body3.lr.ph.us ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.inc10.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block
  %45 = trunc i64 %resume.val to i32
  %46 = sub i32 %N, %45
  %xtraiter40 = and i32 %46, 3
  %lcmp.mod41 = icmp ne i32 %xtraiter40, 0
  %lcmp.overflow42 = icmp eq i32 %46, 0
  %lcmp.or43 = or i1 %lcmp.overflow42, %lcmp.mod41
  br i1 %lcmp.or43, label %for.body3.us.prol.preheader, label %for.body3.us.preheader.split

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol, !dbg !85

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ %resume.val, %for.body3.us.prol.preheader ]
  %prol.iter44 = phi i32 [ %prol.iter44.sub, %for.body3.us.prol ], [ %xtraiter40, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds double* %16, i64 %indvars.iv.prol, !dbg !85
  %47 = load double* %arrayidx5.us.prol, align 8, !dbg !85, !tbaa !86
  %arrayidx9.us.prol = getelementptr inbounds double* %17, i64 %indvars.iv.prol, !dbg !90
  store double %47, double* %arrayidx9.us.prol, align 8, !dbg !90, !tbaa !86
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !91
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !91
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !91
  %prol.iter44.sub = sub i32 %prol.iter44, 1, !dbg !91
  %prol.iter44.cmp = icmp ne i32 %prol.iter44.sub, 0, !dbg !91
  br i1 %prol.iter44.cmp, label %for.body3.us.prol, label %for.body3.us.preheader.split.loopexit, !llvm.loop !100

for.body3.us.preheader.split.loopexit:            ; preds = %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ]
  br label %for.body3.us.preheader.split

for.body3.us.preheader.split:                     ; preds = %for.body3.us.preheader.split.loopexit, %for.body3.us.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body3.us.preheader ], [ %indvars.iv.unr.ph, %for.body3.us.preheader.split.loopexit ]
  %48 = icmp ult i32 %46, 4
  br i1 %48, label %for.inc10.us.loopexit, label %for.body3.us.preheader.split.split

for.body3.us.preheader.split.split:               ; preds = %for.body3.us.preheader.split
  br label %for.body3.us, !dbg !85

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  ret void, !dbg !101
}

; Function Attrs: nounwind uwtable
define i32 @LU_factor(i32 %M, i32 %N, double** nocapture %A, i32* nocapture %pivot) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !31, metadata !67), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !32, metadata !67), !dbg !103
  tail call void @llvm.dbg.value(metadata double** %A, i64 0, metadata !33, metadata !67), !dbg !104
  tail call void @llvm.dbg.value(metadata i32* %pivot, i64 0, metadata !34, metadata !67), !dbg !105
  %cmp = icmp slt i32 %M, %N, !dbg !106
  %cond = select i1 %cmp, i32 %M, i32 %N, !dbg !106
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !35, metadata !67), !dbg !107
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !36, metadata !67), !dbg !108
  %cmp1149 = icmp sgt i32 %cond, 0, !dbg !109
  br i1 %cmp1149, label %for.body.lr.ph, label %return, !dbg !110

for.body.lr.ph:                                   ; preds = %entry
  %sub = add nsw i32 %M, -1, !dbg !111
  %sub51 = add nsw i32 %cond, -1, !dbg !112
  %0 = add i32 %N, -1, !dbg !110
  %1 = sext i32 %sub51 to i64, !dbg !110
  %2 = sext i32 %sub to i64, !dbg !110
  %3 = sext i32 %M to i64, !dbg !110
  %4 = sext i32 %N to i64, !dbg !110
  %5 = sext i32 %cond to i64, !dbg !110
  %6 = add i32 %N, -2, !dbg !110
  %7 = zext i32 %6 to i64
  %8 = zext i32 %6 to i64
  %9 = add i32 %M, -1, !dbg !110
  %10 = zext i32 %9 to i64
  %11 = zext i32 %9 to i64
  br label %for.body, !dbg !110

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.backedge
  %indvars.iv178 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next179, %for.cond.backedge ]
  %indvars.iv171 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next172, %for.cond.backedge ]
  %12 = mul i64 %indvars.iv178, -1, !dbg !113
  %13 = add i64 %11, %12, !dbg !113
  %14 = trunc i64 %13 to i32
  %15 = mul i64 %indvars.iv178, -1, !dbg !113
  %16 = add i64 %10, %15, !dbg !113
  %17 = trunc i64 %16 to i32
  %18 = add i64 %indvars.iv178, 1, !dbg !113
  %19 = sub i64 %8, %indvars.iv178, !dbg !113
  %20 = and i64 %19, 4294967295
  %21 = add i64 %18, %20, !dbg !113
  %22 = sub i64 %7, %indvars.iv178, !dbg !113
  %23 = and i64 %22, 4294967295
  %24 = add nuw nsw i64 %23, 1, !dbg !113
  %arrayidx = getelementptr inbounds double** %A, i64 %indvars.iv178, !dbg !113
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !42, metadata !67), !dbg !114
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1, !dbg !110
  %cmp5139 = icmp slt i64 %indvars.iv.next179, %3, !dbg !115
  %25 = trunc i64 %indvars.iv178 to i32, !dbg !116
  br i1 %cmp5139, label %for.body6.lr.ph, label %for.end, !dbg !116

for.body6.lr.ph:                                  ; preds = %for.body
  %26 = load double** %arrayidx, align 8, !dbg !113, !tbaa !95
  %arrayidx3 = getelementptr inbounds double* %26, i64 %indvars.iv178, !dbg !113
  %27 = load double* %arrayidx3, align 8, !dbg !113, !tbaa !86
  %call = tail call double @fabs(double %27) #3, !dbg !117
  %xtraiter = and i32 %17, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %17, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.prol.preheader, label %for.body6.lr.ph.split

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol, !dbg !118

for.body6.prol:                                   ; preds = %for.body6.prol.preheader, %for.body6.prol
  %indvars.iv153.prol = phi i64 [ %indvars.iv.next154.prol, %for.body6.prol ], [ %indvars.iv171, %for.body6.prol.preheader ]
  %jp.0142.prol = phi i32 [ %jp.1.prol, %for.body6.prol ], [ %25, %for.body6.prol.preheader ]
  %t.0140.prol = phi double [ %t.1.prol, %for.body6.prol ], [ %call, %for.body6.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.prol ], [ %xtraiter, %for.body6.prol.preheader ]
  %arrayidx9.prol = getelementptr inbounds double** %A, i64 %indvars.iv153.prol, !dbg !118
  %28 = load double** %arrayidx9.prol, align 8, !dbg !118, !tbaa !95
  %arrayidx10.prol = getelementptr inbounds double* %28, i64 %indvars.iv178, !dbg !118
  %29 = load double* %arrayidx10.prol, align 8, !dbg !118, !tbaa !86
  %call11.prol = tail call double @fabs(double %29) #3, !dbg !119
  tail call void @llvm.dbg.value(metadata double %call11.prol, i64 0, metadata !43, metadata !67), !dbg !120
  %cmp12.prol = fcmp ogt double %call11.prol, %t.0140.prol, !dbg !121
  tail call void @llvm.dbg.value(metadata double %call11.prol, i64 0, metadata !42, metadata !67), !dbg !114
  %t.1.prol = select i1 %cmp12.prol, double %call11.prol, double %t.0140.prol, !dbg !123
  %30 = trunc i64 %indvars.iv153.prol to i32, !dbg !123
  %jp.1.prol = select i1 %cmp12.prol, i32 %30, i32 %jp.0142.prol, !dbg !123
  %indvars.iv.next154.prol = add nuw nsw i64 %indvars.iv153.prol, 1, !dbg !116
  %exitcond.prol = icmp eq i32 %30, %sub, !dbg !116
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !116
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !116
  br i1 %prol.iter.cmp, label %for.body6.prol, label %for.body6.lr.ph.split.loopexit, !llvm.loop !124

for.body6.lr.ph.split.loopexit:                   ; preds = %for.body6.prol
  %jp.1.lcssa.unr.ph = phi i32 [ %jp.1.prol, %for.body6.prol ]
  %indvars.iv153.unr.ph = phi i64 [ %indvars.iv.next154.prol, %for.body6.prol ]
  %jp.0142.unr.ph = phi i32 [ %jp.1.prol, %for.body6.prol ]
  %t.0140.unr.ph = phi double [ %t.1.prol, %for.body6.prol ]
  br label %for.body6.lr.ph.split

for.body6.lr.ph.split:                            ; preds = %for.body6.lr.ph.split.loopexit, %for.body6.lr.ph
  %jp.1.lcssa.unr = phi i32 [ 0, %for.body6.lr.ph ], [ %jp.1.lcssa.unr.ph, %for.body6.lr.ph.split.loopexit ]
  %indvars.iv153.unr = phi i64 [ %indvars.iv171, %for.body6.lr.ph ], [ %indvars.iv153.unr.ph, %for.body6.lr.ph.split.loopexit ]
  %jp.0142.unr = phi i32 [ %25, %for.body6.lr.ph ], [ %jp.0142.unr.ph, %for.body6.lr.ph.split.loopexit ]
  %t.0140.unr = phi double [ %call, %for.body6.lr.ph ], [ %t.0140.unr.ph, %for.body6.lr.ph.split.loopexit ]
  %31 = icmp ult i32 %17, 2
  br i1 %31, label %for.end.loopexit, label %for.body6.lr.ph.split.split

for.body6.lr.ph.split.split:                      ; preds = %for.body6.lr.ph.split
  br label %for.body6, !dbg !116

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.split.split
  %indvars.iv153 = phi i64 [ %indvars.iv153.unr, %for.body6.lr.ph.split.split ], [ %indvars.iv.next154.1, %for.body6 ]
  %jp.0142 = phi i32 [ %jp.0142.unr, %for.body6.lr.ph.split.split ], [ %jp.1.1, %for.body6 ]
  %t.0140 = phi double [ %t.0140.unr, %for.body6.lr.ph.split.split ], [ %t.1.1, %for.body6 ]
  %arrayidx9 = getelementptr inbounds double** %A, i64 %indvars.iv153, !dbg !118
  %32 = load double** %arrayidx9, align 8, !dbg !118, !tbaa !95
  %arrayidx10 = getelementptr inbounds double* %32, i64 %indvars.iv178, !dbg !118
  %33 = load double* %arrayidx10, align 8, !dbg !118, !tbaa !86
  %call11 = tail call double @fabs(double %33) #3, !dbg !119
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !43, metadata !67), !dbg !120
  %cmp12 = fcmp ogt double %call11, %t.0140, !dbg !121
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !42, metadata !67), !dbg !114
  %t.1 = select i1 %cmp12, double %call11, double %t.0140, !dbg !123
  %34 = trunc i64 %indvars.iv153 to i32, !dbg !123
  %jp.1 = select i1 %cmp12, i32 %34, i32 %jp.0142, !dbg !123
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1, !dbg !116
  %arrayidx9.1 = getelementptr inbounds double** %A, i64 %indvars.iv.next154, !dbg !118
  %35 = load double** %arrayidx9.1, align 8, !dbg !118, !tbaa !95
  %arrayidx10.1 = getelementptr inbounds double* %35, i64 %indvars.iv178, !dbg !118
  %36 = load double* %arrayidx10.1, align 8, !dbg !118, !tbaa !86
  %call11.1 = tail call double @fabs(double %36) #3, !dbg !119
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !43, metadata !67), !dbg !120
  %cmp12.1 = fcmp ogt double %call11.1, %t.1, !dbg !121
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !42, metadata !67), !dbg !114
  %t.1.1 = select i1 %cmp12.1, double %call11.1, double %t.1, !dbg !123
  %37 = trunc i64 %indvars.iv.next154 to i32, !dbg !123
  %jp.1.1 = select i1 %cmp12.1, i32 %37, i32 %jp.1, !dbg !123
  %indvars.iv.next154.1 = add nuw nsw i64 %indvars.iv.next154, 1, !dbg !116
  %exitcond.1 = icmp eq i32 %37, %sub, !dbg !116
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6, !dbg !116

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  %jp.1.lcssa.ph = phi i32 [ %jp.1.1, %for.body6 ]
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.lr.ph.split, %for.end.loopexit.unr-lcssa
  %jp.1.lcssa = phi i32 [ %jp.1.lcssa.unr, %for.body6.lr.ph.split ], [ %jp.1.lcssa.ph, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %jp.0.lcssa = phi i32 [ %25, %for.body ], [ %jp.1.lcssa, %for.end.loopexit ]
  %arrayidx14 = getelementptr inbounds i32* %pivot, i64 %indvars.iv178, !dbg !125
  store i32 %jp.0.lcssa, i32* %arrayidx14, align 4, !dbg !125, !tbaa !126
  %idxprom16 = sext i32 %jp.0.lcssa to i64, !dbg !128
  %arrayidx17 = getelementptr inbounds double** %A, i64 %idxprom16, !dbg !128
  %38 = load double** %arrayidx17, align 8, !dbg !128, !tbaa !95
  %arrayidx18 = getelementptr inbounds double* %38, i64 %indvars.iv178, !dbg !128
  %39 = load double* %arrayidx18, align 8, !dbg !128, !tbaa !86
  %cmp19 = fcmp oeq double %39, 0.000000e+00, !dbg !128
  br i1 %cmp19, label %return.loopexit, label %if.end21, !dbg !130

if.end21:                                         ; preds = %for.end
  %cmp22 = icmp eq i32 %jp.0.lcssa, %25, !dbg !131
  br i1 %cmp22, label %if.end32, label %if.then23, !dbg !132

if.then23:                                        ; preds = %if.end21
  %40 = load double** %arrayidx, align 8, !dbg !133, !tbaa !95
  tail call void @llvm.dbg.value(metadata double* %40, i64 0, metadata !47, metadata !67), !dbg !134
  store double* %38, double** %arrayidx, align 8, !dbg !135, !tbaa !95
  store double* %40, double** %arrayidx17, align 8, !dbg !136, !tbaa !95
  br label %if.end32, !dbg !137

if.end32:                                         ; preds = %if.end21, %if.then23
  %cmp33 = icmp slt i64 %indvars.iv178, %2, !dbg !138
  br i1 %cmp33, label %if.then34, label %if.end50, !dbg !139

if.then34:                                        ; preds = %if.end32
  %41 = load double** %arrayidx, align 8, !dbg !140, !tbaa !95
  %arrayidx38 = getelementptr inbounds double* %41, i64 %indvars.iv178, !dbg !140
  %42 = load double* %arrayidx38, align 8, !dbg !140, !tbaa !86
  %div = fdiv double 1.000000e+00, %42, !dbg !141
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !50, metadata !67), !dbg !142
  br i1 %cmp5139, label %for.body42.preheader, label %if.end50, !dbg !143

for.body42.preheader:                             ; preds = %if.then34
  %xtraiter200 = and i32 %14, 1
  %lcmp.mod201 = icmp ne i32 %xtraiter200, 0
  %lcmp.overflow202 = icmp eq i32 %14, 0
  %lcmp.or203 = or i1 %lcmp.overflow202, %lcmp.mod201
  br i1 %lcmp.or203, label %for.body42.prol.preheader, label %for.body42.preheader.split

for.body42.prol.preheader:                        ; preds = %for.body42.preheader
  br label %for.body42.prol, !dbg !145

for.body42.prol:                                  ; preds = %for.body42.prol.preheader, %for.body42.prol
  %indvars.iv158.prol = phi i64 [ %indvars.iv.next159.prol, %for.body42.prol ], [ %indvars.iv171, %for.body42.prol.preheader ]
  %prol.iter204 = phi i32 [ %prol.iter204.sub, %for.body42.prol ], [ %xtraiter200, %for.body42.prol.preheader ]
  %arrayidx45.prol = getelementptr inbounds double** %A, i64 %indvars.iv158.prol, !dbg !145
  %43 = load double** %arrayidx45.prol, align 8, !dbg !145, !tbaa !95
  %arrayidx46.prol = getelementptr inbounds double* %43, i64 %indvars.iv178, !dbg !145
  %44 = load double* %arrayidx46.prol, align 8, !dbg !145, !tbaa !86
  %mul.prol = fmul double %div, %44, !dbg !145
  store double %mul.prol, double* %arrayidx46.prol, align 8, !dbg !145, !tbaa !86
  %indvars.iv.next159.prol = add nuw nsw i64 %indvars.iv158.prol, 1, !dbg !143
  %lftr.wideiv161.prol = trunc i64 %indvars.iv158.prol to i32, !dbg !143
  %exitcond162.prol = icmp eq i32 %lftr.wideiv161.prol, %sub, !dbg !143
  %prol.iter204.sub = sub i32 %prol.iter204, 1, !dbg !143
  %prol.iter204.cmp = icmp ne i32 %prol.iter204.sub, 0, !dbg !143
  br i1 %prol.iter204.cmp, label %for.body42.prol, label %for.body42.preheader.split.loopexit, !llvm.loop !147

for.body42.preheader.split.loopexit:              ; preds = %for.body42.prol
  %indvars.iv158.unr.ph = phi i64 [ %indvars.iv.next159.prol, %for.body42.prol ]
  br label %for.body42.preheader.split

for.body42.preheader.split:                       ; preds = %for.body42.preheader.split.loopexit, %for.body42.preheader
  %indvars.iv158.unr = phi i64 [ %indvars.iv171, %for.body42.preheader ], [ %indvars.iv158.unr.ph, %for.body42.preheader.split.loopexit ]
  %45 = icmp ult i32 %14, 2
  br i1 %45, label %if.end50.loopexit, label %for.body42.preheader.split.split

for.body42.preheader.split.split:                 ; preds = %for.body42.preheader.split
  br label %for.body42, !dbg !145

for.body42:                                       ; preds = %for.body42, %for.body42.preheader.split.split
  %indvars.iv158 = phi i64 [ %indvars.iv158.unr, %for.body42.preheader.split.split ], [ %indvars.iv.next159.1, %for.body42 ]
  %arrayidx45 = getelementptr inbounds double** %A, i64 %indvars.iv158, !dbg !145
  %46 = load double** %arrayidx45, align 8, !dbg !145, !tbaa !95
  %arrayidx46 = getelementptr inbounds double* %46, i64 %indvars.iv178, !dbg !145
  %47 = load double* %arrayidx46, align 8, !dbg !145, !tbaa !86
  %mul = fmul double %div, %47, !dbg !145
  store double %mul, double* %arrayidx46, align 8, !dbg !145, !tbaa !86
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1, !dbg !143
  %lftr.wideiv161 = trunc i64 %indvars.iv158 to i32, !dbg !143
  %arrayidx45.1 = getelementptr inbounds double** %A, i64 %indvars.iv.next159, !dbg !145
  %48 = load double** %arrayidx45.1, align 8, !dbg !145, !tbaa !95
  %arrayidx46.1 = getelementptr inbounds double* %48, i64 %indvars.iv178, !dbg !145
  %49 = load double* %arrayidx46.1, align 8, !dbg !145, !tbaa !86
  %mul.1 = fmul double %div, %49, !dbg !145
  store double %mul.1, double* %arrayidx46.1, align 8, !dbg !145, !tbaa !86
  %indvars.iv.next159.1 = add nuw nsw i64 %indvars.iv.next159, 1, !dbg !143
  %lftr.wideiv161.1 = trunc i64 %indvars.iv.next159 to i32, !dbg !143
  %exitcond162.1 = icmp eq i32 %lftr.wideiv161.1, %sub, !dbg !143
  br i1 %exitcond162.1, label %if.end50.loopexit.unr-lcssa, label %for.body42, !dbg !143

if.end50.loopexit.unr-lcssa:                      ; preds = %for.body42
  br label %if.end50.loopexit

if.end50.loopexit:                                ; preds = %for.body42.preheader.split, %if.end50.loopexit.unr-lcssa
  br label %if.end50

if.end50:                                         ; preds = %if.end50.loopexit, %if.then34, %if.end32
  %cmp52.not = icmp sge i64 %indvars.iv178, %1, !dbg !148
  %cmp5139.not = xor i1 %cmp5139, true, !dbg !148
  %brmerge = or i1 %cmp52.not, %cmp5139.not, !dbg !148
  br i1 %brmerge, label %for.cond.backedge, label %for.body57.lr.ph, !dbg !148

for.cond.backedge.loopexit:                       ; preds = %for.inc77.us
  br label %for.cond.backedge

for.cond.backedge:                                ; preds = %for.cond.backedge.loopexit, %if.end50, %for.body57.lr.ph
  %cmp1 = icmp slt i64 %indvars.iv.next179, %5, !dbg !109
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1, !dbg !110
  br i1 %cmp1, label %for.body, label %return.loopexit, !dbg !110

for.body57.lr.ph:                                 ; preds = %if.end50
  %50 = load double** %arrayidx, align 8, !dbg !149, !tbaa !95
  %cmp66145 = icmp slt i64 %indvars.iv.next179, %4, !dbg !150
  br i1 %cmp66145, label %for.body67.lr.ph.us.preheader, label %for.cond.backedge

for.body67.lr.ph.us.preheader:                    ; preds = %for.body57.lr.ph
  %scevgep183 = getelementptr double* %50, i64 %18
  %scevgep185 = getelementptr double* %50, i64 %21
  br label %for.body67.lr.ph.us, !dbg !153

for.inc77.us.loopexit.unr-lcssa:                  ; preds = %for.body67.us
  br label %for.inc77.us.loopexit

for.inc77.us.loopexit:                            ; preds = %for.body67.us.preheader.split, %for.inc77.us.loopexit.unr-lcssa
  br label %for.inc77.us

for.inc77.us:                                     ; preds = %for.inc77.us.loopexit, %middle.block
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1, !dbg !154
  %lftr.wideiv176 = trunc i64 %indvars.iv173 to i32, !dbg !154
  %exitcond177 = icmp eq i32 %lftr.wideiv176, %sub, !dbg !154
  br i1 %exitcond177, label %for.cond.backedge.loopexit, label %for.body67.lr.ph.us, !dbg !154

for.body67.us:                                    ; preds = %for.body67.us, %for.body67.us.preheader.split.split
  %indvars.iv166 = phi i64 [ %indvars.iv166.unr, %for.body67.us.preheader.split.split ], [ %indvars.iv.next167.1, %for.body67.us ]
  %arrayidx69.us = getelementptr inbounds double* %50, i64 %indvars.iv166, !dbg !155
  %51 = load double* %arrayidx69.us, align 8, !dbg !155, !tbaa !86
  %mul70.us = fmul double %56, %51, !dbg !156
  %arrayidx72.us = getelementptr inbounds double* %55, i64 %indvars.iv166, !dbg !157
  %52 = load double* %arrayidx72.us, align 8, !dbg !157, !tbaa !86
  %sub73.us = fsub double %52, %mul70.us, !dbg !157
  store double %sub73.us, double* %arrayidx72.us, align 8, !dbg !157, !tbaa !86
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1, !dbg !158
  %lftr.wideiv169 = trunc i64 %indvars.iv166 to i32, !dbg !158
  %arrayidx69.us.1 = getelementptr inbounds double* %50, i64 %indvars.iv.next167, !dbg !155
  %53 = load double* %arrayidx69.us.1, align 8, !dbg !155, !tbaa !86
  %mul70.us.1 = fmul double %56, %53, !dbg !156
  %arrayidx72.us.1 = getelementptr inbounds double* %55, i64 %indvars.iv.next167, !dbg !157
  %54 = load double* %arrayidx72.us.1, align 8, !dbg !157, !tbaa !86
  %sub73.us.1 = fsub double %54, %mul70.us.1, !dbg !157
  store double %sub73.us.1, double* %arrayidx72.us.1, align 8, !dbg !157, !tbaa !86
  %indvars.iv.next167.1 = add nuw nsw i64 %indvars.iv.next167, 1, !dbg !158
  %lftr.wideiv169.1 = trunc i64 %indvars.iv.next167 to i32, !dbg !158
  %exitcond170.1 = icmp eq i32 %lftr.wideiv169.1, %0, !dbg !158
  br i1 %exitcond170.1, label %for.inc77.us.loopexit.unr-lcssa, label %for.body67.us, !dbg !158, !llvm.loop !159

for.body67.lr.ph.us:                              ; preds = %for.body67.lr.ph.us.preheader, %for.inc77.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.inc77.us ], [ %indvars.iv171, %for.body67.lr.ph.us.preheader ]
  %arrayidx59.us = getelementptr inbounds double** %A, i64 %indvars.iv173, !dbg !153
  %55 = load double** %arrayidx59.us, align 8, !dbg !153, !tbaa !95
  tail call void @llvm.dbg.value(metadata double* %55, i64 0, metadata !57, metadata !67), !dbg !160
  tail call void @llvm.dbg.value(metadata double* %50, i64 0, metadata !61, metadata !67), !dbg !161
  %arrayidx63.us = getelementptr inbounds double* %55, i64 %indvars.iv178, !dbg !162
  %56 = load double* %arrayidx63.us, align 8, !dbg !162, !tbaa !86
  tail call void @llvm.dbg.value(metadata double %56, i64 0, metadata !62, metadata !67), !dbg !163
  %end.idx = add i64 %24, %indvars.iv171, !dbg !158
  %fold = add i64 %22, 1, !dbg !158
  %n.mod.vf = and i64 %fold, 3, !dbg !158
  %n.vec = sub nsw i64 %24, %n.mod.vf, !dbg !158
  %end.idx.rnd.down = add i64 %n.vec, %indvars.iv171, !dbg !158
  %cmp.zero = icmp eq i64 %24, %n.mod.vf, !dbg !158
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body67.lr.ph.us
  %scevgep = getelementptr double* %55, i64 %18
  %bound0 = icmp ule double* %scevgep, %scevgep185
  %scevgep181 = getelementptr double* %55, i64 %21
  %bound1 = icmp ule double* %scevgep183, %scevgep181
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert189 = insertelement <2 x double> undef, double %56, i32 0
  %broadcast.splat190 = shufflevector <2 x double> %broadcast.splatinsert189, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %indvars.iv171, %vector.ph ], [ %index.next, %vector.body ], !dbg !158
  %57 = getelementptr inbounds double* %50, i64 %index, !dbg !155
  %58 = bitcast double* %57 to <2 x double>*, !dbg !155
  %wide.load = load <2 x double>* %58, align 8, !dbg !155, !tbaa !86
  %.sum = add i64 %index, 2, !dbg !155
  %59 = getelementptr double* %50, i64 %.sum, !dbg !155
  %60 = bitcast double* %59 to <2 x double>*, !dbg !155
  %wide.load188 = load <2 x double>* %60, align 8, !dbg !155, !tbaa !86
  %61 = fmul <2 x double> %broadcast.splat190, %wide.load, !dbg !156
  %62 = fmul <2 x double> %broadcast.splat190, %wide.load188, !dbg !156
  %63 = getelementptr inbounds double* %55, i64 %index, !dbg !157
  %64 = bitcast double* %63 to <2 x double>*, !dbg !157
  %wide.load191 = load <2 x double>* %64, align 8, !dbg !157, !tbaa !86
  %.sum199 = add i64 %index, 2, !dbg !157
  %65 = getelementptr double* %55, i64 %.sum199, !dbg !157
  %66 = bitcast double* %65 to <2 x double>*, !dbg !157
  %wide.load192 = load <2 x double>* %66, align 8, !dbg !157, !tbaa !86
  %67 = fsub <2 x double> %wide.load191, %61, !dbg !157
  %68 = fsub <2 x double> %wide.load192, %62, !dbg !157
  %69 = bitcast double* %63 to <2 x double>*, !dbg !157
  store <2 x double> %67, <2 x double>* %69, align 8, !dbg !157, !tbaa !86
  %70 = bitcast double* %65 to <2 x double>*, !dbg !157
  store <2 x double> %68, <2 x double>* %70, align 8, !dbg !157, !tbaa !86
  %index.next = add i64 %index, 4, !dbg !158
  %71 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !158
  br i1 %71, label %middle.block.loopexit, label %vector.body, !dbg !158, !llvm.loop !164

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body67.lr.ph.us
  %resume.val = phi i64 [ %indvars.iv171, %for.body67.lr.ph.us ], [ %indvars.iv171, %vector.memcheck ], [ %end.idx.rnd.down, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.inc77.us, label %for.body67.us.preheader

for.body67.us.preheader:                          ; preds = %middle.block
  %72 = trunc i64 %resume.val to i32
  %73 = sub i32 %N, %72
  %xtraiter205 = and i32 %73, 1
  %lcmp.mod206 = icmp ne i32 %xtraiter205, 0
  %lcmp.overflow207 = icmp eq i32 %73, 0
  %lcmp.or208 = or i1 %lcmp.overflow207, %lcmp.mod206
  br i1 %lcmp.or208, label %for.body67.us.prol.preheader, label %for.body67.us.preheader.split

for.body67.us.prol.preheader:                     ; preds = %for.body67.us.preheader
  br label %for.body67.us.prol, !dbg !155

for.body67.us.prol:                               ; preds = %for.body67.us.prol.preheader, %for.body67.us.prol
  %indvars.iv166.prol = phi i64 [ %indvars.iv.next167.prol, %for.body67.us.prol ], [ %resume.val, %for.body67.us.prol.preheader ]
  %prol.iter209 = phi i32 [ %prol.iter209.sub, %for.body67.us.prol ], [ %xtraiter205, %for.body67.us.prol.preheader ]
  %arrayidx69.us.prol = getelementptr inbounds double* %50, i64 %indvars.iv166.prol, !dbg !155
  %74 = load double* %arrayidx69.us.prol, align 8, !dbg !155, !tbaa !86
  %mul70.us.prol = fmul double %56, %74, !dbg !156
  %arrayidx72.us.prol = getelementptr inbounds double* %55, i64 %indvars.iv166.prol, !dbg !157
  %75 = load double* %arrayidx72.us.prol, align 8, !dbg !157, !tbaa !86
  %sub73.us.prol = fsub double %75, %mul70.us.prol, !dbg !157
  store double %sub73.us.prol, double* %arrayidx72.us.prol, align 8, !dbg !157, !tbaa !86
  %indvars.iv.next167.prol = add nuw nsw i64 %indvars.iv166.prol, 1, !dbg !158
  %lftr.wideiv169.prol = trunc i64 %indvars.iv166.prol to i32, !dbg !158
  %exitcond170.prol = icmp eq i32 %lftr.wideiv169.prol, %0, !dbg !158
  %prol.iter209.sub = sub i32 %prol.iter209, 1, !dbg !158
  %prol.iter209.cmp = icmp ne i32 %prol.iter209.sub, 0, !dbg !158
  br i1 %prol.iter209.cmp, label %for.body67.us.prol, label %for.body67.us.preheader.split.loopexit, !llvm.loop !165

for.body67.us.preheader.split.loopexit:           ; preds = %for.body67.us.prol
  %indvars.iv166.unr.ph = phi i64 [ %indvars.iv.next167.prol, %for.body67.us.prol ]
  br label %for.body67.us.preheader.split

for.body67.us.preheader.split:                    ; preds = %for.body67.us.preheader.split.loopexit, %for.body67.us.preheader
  %indvars.iv166.unr = phi i64 [ %resume.val, %for.body67.us.preheader ], [ %indvars.iv166.unr.ph, %for.body67.us.preheader.split.loopexit ]
  %76 = icmp ult i32 %73, 2
  br i1 %76, label %for.inc77.us.loopexit, label %for.body67.us.preheader.split.split

for.body67.us.preheader.split.split:              ; preds = %for.body67.us.preheader.split
  br label %for.body67.us, !dbg !155

return.loopexit:                                  ; preds = %for.cond.backedge, %for.end
  %retval.0.ph = phi i32 [ 0, %for.cond.backedge ], [ 1, %for.end ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0, !dbg !166
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65}
!llvm.ident = !{!66}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c] [DW_LANG_C99]
!1 = !{!"LU.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !14, !26}
!6 = !{!"0x2e\00LU_num_flops\00LU_num_flops\00\004\000\001\000\000\00256\001\005", !1, !7, !8, null, double (i32)* @LU_num_flops, null, null, !11} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [LU_num_flops]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13}
!12 = !{!"0x101\00N\0016777220\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 4]
!13 = !{!"0x100\00Nd\008\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [Nd] [line 8]
!14 = !{!"0x2e\00LU_copy_matrix\00LU_copy_matrix\00\0014\000\001\000\000\00256\001\0015", !1, !7, !15, null, void (i32, i32, double**, double**)* @LU_copy_matrix, null, null, !19} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [LU_copy_matrix]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{null, !10, !10, !17, !17}
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = !{!20, !21, !22, !23, !24, !25}
!20 = !{!"0x101\00M\0016777230\000", !14, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 14]
!21 = !{!"0x101\00N\0033554446\000", !14, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 14]
!22 = !{!"0x101\00lu\0050331662\000", !14, !7, !17} ; [ DW_TAG_arg_variable ] [lu] [line 14]
!23 = !{!"0x101\00A\0067108878\000", !14, !7, !17} ; [ DW_TAG_arg_variable ] [A] [line 14]
!24 = !{!"0x100\00i\0016\000", !14, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 16]
!25 = !{!"0x100\00j\0017\000", !14, !7, !10}      ; [ DW_TAG_auto_variable ] [j] [line 17]
!26 = !{!"0x2e\00LU_factor\00LU_factor\00\0025\000\001\000\000\00256\001\0026", !1, !7, !27, null, i32 (i32, i32, double**, i32*)* @LU_factor, null, null, !30} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [LU_factor]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!10, !10, !10, !17, !29}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!30 = !{!31, !32, !33, !34, !35, !36, !37, !41, !42, !43, !47, !50, !53, !54, !57, !61, !62, !63}
!31 = !{!"0x101\00M\0016777241\000", !26, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 25]
!32 = !{!"0x101\00N\0033554457\000", !26, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 25]
!33 = !{!"0x101\00A\0050331673\000", !26, !7, !17} ; [ DW_TAG_arg_variable ] [A] [line 25]
!34 = !{!"0x101\00pivot\0067108889\000", !26, !7, !29} ; [ DW_TAG_arg_variable ] [pivot] [line 25]
!35 = !{!"0x100\00minMN\0029\000", !26, !7, !10}  ; [ DW_TAG_auto_variable ] [minMN] [line 29]
!36 = !{!"0x100\00j\0030\000", !26, !7, !10}      ; [ DW_TAG_auto_variable ] [j] [line 30]
!37 = !{!"0x100\00jp\0036\000", !38, !7, !10}     ; [ DW_TAG_auto_variable ] [jp] [line 36]
!38 = !{!"0xb\0033\005\006", !1, !39}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!39 = !{!"0xb\0032\005\005", !1, !40}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!40 = !{!"0xb\0032\005\004", !1, !26}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!41 = !{!"0x100\00i\0037\000", !38, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 37]
!42 = !{!"0x100\00t\0039\000", !38, !7, !4}       ; [ DW_TAG_auto_variable ] [t] [line 39]
!43 = !{!"0x100\00ab\0042\000", !44, !7, !4}      ; [ DW_TAG_auto_variable ] [ab] [line 42]
!44 = !{!"0xb\0041\009\009", !1, !45}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!45 = !{!"0xb\0040\009\008", !1, !46}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!46 = !{!"0xb\0040\009\007", !1, !38}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!47 = !{!"0x100\00tA\0062\000", !48, !7, !18}     ; [ DW_TAG_auto_variable ] [tA] [line 62]
!48 = !{!"0xb\0060\009\0014", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!49 = !{!"0xb\0059\0013\0013", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!50 = !{!"0x100\00recp\0072\000", !51, !7, !4}    ; [ DW_TAG_auto_variable ] [recp] [line 72]
!51 = !{!"0xb\0068\009\0016", !1, !52}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!52 = !{!"0xb\0067\0013\0015", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!53 = !{!"0x100\00k\0073\000", !51, !7, !10}      ; [ DW_TAG_auto_variable ] [k] [line 73]
!54 = !{!"0x100\00ii\0086\000", !55, !7, !10}     ; [ DW_TAG_auto_variable ] [ii] [line 86]
!55 = !{!"0xb\0080\009\0020", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!56 = !{!"0xb\0079\0013\0019", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!57 = !{!"0x100\00Aii\0089\000", !58, !7, !18}    ; [ DW_TAG_auto_variable ] [Aii] [line 89]
!58 = !{!"0xb\0088\0013\0023", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!59 = !{!"0xb\0087\0013\0022", !1, !60}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!60 = !{!"0xb\0087\0013\0021", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!61 = !{!"0x100\00Aj\0090\000", !58, !7, !18}     ; [ DW_TAG_auto_variable ] [Aj] [line 90]
!62 = !{!"0x100\00AiiJ\0091\000", !58, !7, !4}    ; [ DW_TAG_auto_variable ] [AiiJ] [line 91]
!63 = !{!"0x100\00jj\0092\000", !58, !7, !10}     ; [ DW_TAG_auto_variable ] [jj] [line 92]
!64 = !{i32 2, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 2}
!66 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!67 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!68 = !MDLocation(line: 4, column: 25, scope: !6)
!69 = !MDLocation(line: 8, column: 17, scope: !6)
!70 = !MDLocation(line: 8, column: 12, scope: !6)
!71 = !MDLocation(line: 10, column: 13, scope: !6)
!72 = !MDLocation(line: 10, column: 5, scope: !6)
!73 = !MDLocation(line: 14, column: 25, scope: !14)
!74 = !MDLocation(line: 14, column: 32, scope: !14)
!75 = !MDLocation(line: 14, column: 44, scope: !14)
!76 = !MDLocation(line: 14, column: 57, scope: !14)
!77 = !MDLocation(line: 16, column: 9, scope: !14)
!78 = !MDLocation(line: 19, column: 15, scope: !79)
!79 = !{!"0xb\0019\005\001", !1, !80}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!80 = !{!"0xb\0019\005\000", !1, !14}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!81 = !MDLocation(line: 20, column: 19, scope: !82)
!82 = !{!"0xb\0020\009\003", !1, !83}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!83 = !{!"0xb\0020\009\002", !1, !79}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!84 = !MDLocation(line: 19, column: 5, scope: !80)
!85 = !MDLocation(line: 21, column: 24, scope: !82)
!86 = !{!87, !87, i64 0}
!87 = !{!"double", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !MDLocation(line: 21, column: 13, scope: !82)
!91 = !MDLocation(line: 20, column: 9, scope: !83)
!92 = distinct !{!92, !93, !94}
!93 = !{!"llvm.loop.vectorize.width", i32 1}
!94 = !{!"llvm.loop.interleave.count", i32 1}
!95 = !{!96, !96, i64 0}
!96 = !{!"any pointer", !88, i64 0}
!97 = distinct !{!97, !98}
!98 = !{!"llvm.loop.unroll.disable"}
!99 = distinct !{!99, !93, !94}
!100 = distinct !{!100, !98}
!101 = !MDLocation(line: 22, column: 1, scope: !14)
!102 = !MDLocation(line: 25, column: 19, scope: !26)
!103 = !MDLocation(line: 25, column: 26, scope: !26)
!104 = !MDLocation(line: 25, column: 38, scope: !26)
!105 = !MDLocation(line: 25, column: 47, scope: !26)
!106 = !MDLocation(line: 29, column: 18, scope: !26)
!107 = !MDLocation(line: 29, column: 9, scope: !26)
!108 = !MDLocation(line: 30, column: 9, scope: !26)
!109 = !MDLocation(line: 32, column: 15, scope: !39)
!110 = !MDLocation(line: 32, column: 5, scope: !40)
!111 = !MDLocation(line: 67, column: 15, scope: !52)
!112 = !MDLocation(line: 79, column: 17, scope: !56)
!113 = !MDLocation(line: 39, column: 25, scope: !38)
!114 = !MDLocation(line: 39, column: 16, scope: !38)
!115 = !MDLocation(line: 40, column: 21, scope: !45)
!116 = !MDLocation(line: 40, column: 9, scope: !46)
!117 = !MDLocation(line: 39, column: 20, scope: !38)
!118 = !MDLocation(line: 42, column: 30, scope: !44)
!119 = !MDLocation(line: 42, column: 25, scope: !44)
!120 = !MDLocation(line: 42, column: 20, scope: !44)
!121 = !MDLocation(line: 43, column: 18, scope: !122)
!122 = !{!"0xb\0043\0018\0010", !1, !44}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!123 = !MDLocation(line: 43, column: 18, scope: !44)
!124 = distinct !{!124, !98}
!125 = !MDLocation(line: 50, column: 9, scope: !38)
!126 = !{!127, !127, i64 0}
!127 = !{!"int", !88, i64 0}
!128 = !MDLocation(line: 55, column: 14, scope: !129)
!129 = !{!"0xb\0055\0014\0012", !1, !38}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!130 = !MDLocation(line: 55, column: 14, scope: !38)
!131 = !MDLocation(line: 59, column: 13, scope: !49)
!132 = !MDLocation(line: 59, column: 13, scope: !38)
!133 = !MDLocation(line: 62, column: 26, scope: !48)
!134 = !MDLocation(line: 62, column: 21, scope: !48)
!135 = !MDLocation(line: 63, column: 13, scope: !48)
!136 = !MDLocation(line: 64, column: 13, scope: !48)
!137 = !MDLocation(line: 65, column: 9, scope: !48)
!138 = !MDLocation(line: 67, column: 13, scope: !52)
!139 = !MDLocation(line: 67, column: 13, scope: !38)
!140 = !MDLocation(line: 72, column: 34, scope: !51)
!141 = !MDLocation(line: 72, column: 28, scope: !51)
!142 = !MDLocation(line: 72, column: 20, scope: !51)
!143 = !MDLocation(line: 74, column: 13, scope: !144)
!144 = !{!"0xb\0074\0013\0017", !1, !51}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!145 = !MDLocation(line: 75, column: 17, scope: !146)
!146 = !{!"0xb\0074\0013\0018", !1, !144}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!147 = distinct !{!147, !98}
!148 = !MDLocation(line: 79, column: 13, scope: !38)
!149 = !MDLocation(line: 90, column: 30, scope: !58)
!150 = !MDLocation(line: 93, column: 30, scope: !151)
!151 = !{!"0xb\0093\0017\0025", !1, !152}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!152 = !{!"0xb\0093\0017\0024", !1, !58}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/LU.c]
!153 = !MDLocation(line: 89, column: 31, scope: !58)
!154 = !MDLocation(line: 87, column: 13, scope: !60)
!155 = !MDLocation(line: 94, column: 37, scope: !151)
!156 = !MDLocation(line: 94, column: 30, scope: !151)
!157 = !MDLocation(line: 94, column: 19, scope: !151)
!158 = !MDLocation(line: 93, column: 17, scope: !152)
!159 = distinct !{!159, !93, !94}
!160 = !MDLocation(line: 89, column: 25, scope: !58)
!161 = !MDLocation(line: 90, column: 25, scope: !58)
!162 = !MDLocation(line: 91, column: 31, scope: !58)
!163 = !MDLocation(line: 91, column: 24, scope: !58)
!164 = distinct !{!164, !93, !94}
!165 = distinct !{!165, !98}
!166 = !MDLocation(line: 101, column: 1, scope: !26)
