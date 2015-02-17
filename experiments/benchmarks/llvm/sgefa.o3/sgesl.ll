; ModuleID = 'sgesl.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgesl(%struct.FULL* nocapture readonly %a, i32* nocapture readonly %ipvt, float* nocapture %b, i32 %job) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.FULL* %a, i64 0, metadata !23, metadata !40), !dbg !41
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !24, metadata !40), !dbg !42
  tail call void @llvm.dbg.value(metadata float* %b, i64 0, metadata !25, metadata !40), !dbg !43
  tail call void @llvm.dbg.value(metadata i32 %job, i64 0, metadata !26, metadata !40), !dbg !44
  %cd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !45
  %0 = load i32* %cd, align 4, !dbg !45, !tbaa !46
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !35, metadata !40), !dbg !51
  %sub = add i32 %0, -1, !dbg !52
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !36, metadata !40), !dbg !53
  %cmp = icmp eq i32 %job, 0, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !40), !dbg !56
  br i1 %cmp, label %for.cond.preheader, label %for.cond52.preheader, !dbg !57

for.cond52.preheader:                             ; preds = %entry
  %cmp53250 = icmp sgt i32 %0, 0, !dbg !58
  br i1 %cmp53250, label %for.body54.preheader, label %for.end81, !dbg !61

for.body54.preheader:                             ; preds = %for.cond52.preheader
  br label %for.body54, !dbg !62

for.cond.preheader:                               ; preds = %entry
  %cmp1232 = icmp sgt i32 %0, 1, !dbg !64
  br i1 %cmp1232, label %for.body.lr.ph, label %for.cond23.preheader, !dbg !68

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %1 = sext i32 %0 to i64, !dbg !68
  %2 = sext i32 %sub to i64, !dbg !68
  %3 = add i32 %0, -2, !dbg !68
  %4 = zext i32 %3 to i64
  %5 = zext i32 %3 to i64
  br label %for.body, !dbg !68

for.cond23.preheader.loopexit:                    ; preds = %for.inc19
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.loopexit, %for.cond.preheader
  %cmp24227 = icmp sgt i32 %0, 0, !dbg !69
  br i1 %cmp24227, label %for.body25.lr.ph, label %return, !dbg !74

for.body25.lr.ph:                                 ; preds = %for.cond23.preheader
  %6 = add i32 %0, -2, !dbg !74
  %7 = sext i32 %0 to i64
  br label %for.body25, !dbg !74

for.body:                                         ; preds = %for.body.lr.ph, %for.inc19
  %indvars.iv264 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next265, %for.inc19 ]
  %indvars.iv257 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next258, %for.inc19 ]
  %ipvt.addr.0234 = phi i32* [ %ipvt, %for.body.lr.ph ], [ %incdec.ptr21, %for.inc19 ]
  %8 = add i64 %indvars.iv264, 1, !dbg !75
  %scevgep = getelementptr float* %b, i64 %8
  %9 = sub i64 %5, %indvars.iv264, !dbg !75
  %10 = and i64 %9, 4294967295
  %scevgep.sum = add i64 %8, %10
  %scevgep281 = getelementptr float* %b, i64 %scevgep.sum
  %11 = add i64 %8, %10, !dbg !75
  %12 = sub i64 %4, %indvars.iv264, !dbg !75
  %13 = and i64 %12, 4294967295
  %14 = add nuw nsw i64 %13, 1, !dbg !75
  %arrayidx = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv264, !dbg !75
  %15 = load float** %arrayidx, align 8, !dbg !75, !tbaa !77
  %16 = load i32* %ipvt.addr.0234, align 4, !dbg !79, !tbaa !80
  tail call void @llvm.dbg.value(metadata i32 %16, i64 0, metadata !34, metadata !40), !dbg !81
  %idxprom2 = sext i32 %16 to i64, !dbg !82
  %arrayidx3 = getelementptr inbounds float* %b, i64 %idxprom2, !dbg !82
  %17 = load float* %arrayidx3, align 4, !dbg !82, !tbaa !83
  tail call void @llvm.dbg.value(metadata float %17, i64 0, metadata !27, metadata !40), !dbg !85
  %18 = trunc i64 %indvars.iv264 to i32, !dbg !86
  %cmp4 = icmp eq i32 %16, %18, !dbg !86
  br i1 %cmp4, label %if.end, label %if.then5, !dbg !88

if.then5:                                         ; preds = %for.body
  %arrayidx7 = getelementptr inbounds float* %b, i64 %indvars.iv264, !dbg !89
  %19 = load float* %arrayidx7, align 4, !dbg !89, !tbaa !83
  store float %19, float* %arrayidx3, align 4, !dbg !91, !tbaa !83
  store float %17, float* %arrayidx7, align 4, !dbg !92, !tbaa !83
  br label %if.end, !dbg !93

if.end:                                           ; preds = %for.body, %if.then5
  %indvars.iv.next265 = add nuw nsw i64 %indvars.iv264, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata float* %add.ptr12, i64 0, metadata !29, metadata !40), !dbg !94
  %cmp14229 = icmp slt i64 %indvars.iv.next265, %1, !dbg !95
  br i1 %cmp14229, label %for.body15.lr.ph, label %for.inc19, !dbg !98

for.body15.lr.ph:                                 ; preds = %if.end
  %add.ptr12 = getelementptr inbounds float* %15, i64 %indvars.iv.next265, !dbg !99
  %end.idx = add i64 %14, %indvars.iv257, !dbg !98
  %fold = add i64 %12, 1, !dbg !98
  %n.mod.vf = and i64 %fold, 7, !dbg !98
  %n.vec = sub nsw i64 %14, %n.mod.vf, !dbg !98
  %end.idx.rnd.down = add i64 %n.vec, %indvars.iv257, !dbg !98
  %cmp.zero = icmp eq i64 %14, %n.mod.vf, !dbg !98
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body15.lr.ph
  %scevgep285 = getelementptr float* %15, i64 %11
  %bound0 = icmp ule float* %scevgep, %scevgep285
  %scevgep283 = getelementptr float* %15, i64 %8
  %bound1 = icmp ule float* %scevgep283, %scevgep281
  %memcheck.conflict = and i1 %bound0, %bound1
  %add.ptr12.sum = add i64 %indvars.iv.next265, %n.vec
  %ptr.ind.end = getelementptr float* %15, i64 %add.ptr12.sum
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert312 = insertelement <4 x float> undef, float %17, i32 0
  %broadcast.splat313 = shufflevector <4 x float> %broadcast.splatinsert312, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %indvars.iv257, %vector.ph ], [ %index.next, %vector.body ], !dbg !98
  %normalized.idx = sub i64 %index, %indvars.iv257
  %add.ptr12.sum322 = add i64 %indvars.iv.next265, %normalized.idx
  %next.gep = getelementptr float* %15, i64 %add.ptr12.sum322
  %20 = bitcast float* %next.gep to <4 x float>*, !dbg !100
  %wide.load = load <4 x float>* %20, align 4, !dbg !100, !tbaa !83
  %next.gep.sum = add i64 %add.ptr12.sum322, 4, !dbg !100
  %21 = getelementptr float* %15, i64 %next.gep.sum, !dbg !100
  %22 = bitcast float* %21 to <4 x float>*, !dbg !100
  %wide.load311 = load <4 x float>* %22, align 4, !dbg !100, !tbaa !83
  %23 = fmul <4 x float> %broadcast.splat313, %wide.load, !dbg !101
  %24 = fmul <4 x float> %broadcast.splat313, %wide.load311, !dbg !101
  %25 = getelementptr inbounds float* %b, i64 %index, !dbg !102
  %26 = bitcast float* %25 to <4 x float>*, !dbg !102
  %wide.load314 = load <4 x float>* %26, align 4, !dbg !102, !tbaa !83
  %.sum = add i64 %index, 4, !dbg !102
  %27 = getelementptr float* %b, i64 %.sum, !dbg !102
  %28 = bitcast float* %27 to <4 x float>*, !dbg !102
  %wide.load315 = load <4 x float>* %28, align 4, !dbg !102, !tbaa !83
  %29 = fadd <4 x float> %wide.load314, %23, !dbg !102
  %30 = fadd <4 x float> %wide.load315, %24, !dbg !102
  %31 = bitcast float* %25 to <4 x float>*, !dbg !102
  store <4 x float> %29, <4 x float>* %31, align 4, !dbg !102, !tbaa !83
  %32 = bitcast float* %27 to <4 x float>*, !dbg !102
  store <4 x float> %30, <4 x float>* %32, align 4, !dbg !102, !tbaa !83
  %index.next = add i64 %index, 8, !dbg !98
  %33 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !98
  br i1 %33, label %middle.block.loopexit, label %vector.body, !dbg !98, !llvm.loop !103

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body15.lr.ph
  %resume.val = phi i64 [ %indvars.iv257, %for.body15.lr.ph ], [ %indvars.iv257, %vector.memcheck ], [ %end.idx.rnd.down, %middle.block.loopexit ]
  %resume.val287 = phi float* [ %add.ptr12, %for.body15.lr.ph ], [ %add.ptr12, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.inc19, label %for.body15.preheader

for.body15.preheader:                             ; preds = %middle.block
  %34 = trunc i64 %resume.val to i32
  %35 = sub i32 %0, %34
  %xtraiter = and i32 %35, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %35, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body15.prol.preheader, label %for.body15.preheader.split

for.body15.prol.preheader:                        ; preds = %for.body15.preheader
  br label %for.body15.prol, !dbg !100

for.body15.prol:                                  ; preds = %for.body15.prol.preheader, %for.body15.prol
  %indvars.iv259.prol = phi i64 [ %indvars.iv.next260.prol, %for.body15.prol ], [ %resume.val, %for.body15.prol.preheader ]
  %mik.0230.prol = phi float* [ %incdec.ptr.prol, %for.body15.prol ], [ %resume.val287, %for.body15.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body15.prol ], [ %xtraiter, %for.body15.prol.preheader ]
  %36 = load float* %mik.0230.prol, align 4, !dbg !100, !tbaa !83
  %mul.prol = fmul float %17, %36, !dbg !101
  %arrayidx17.prol = getelementptr inbounds float* %b, i64 %indvars.iv259.prol, !dbg !102
  %37 = load float* %arrayidx17.prol, align 4, !dbg !102, !tbaa !83
  %add18.prol = fadd float %37, %mul.prol, !dbg !102
  store float %add18.prol, float* %arrayidx17.prol, align 4, !dbg !102, !tbaa !83
  %incdec.ptr.prol = getelementptr inbounds float* %mik.0230.prol, i64 1, !dbg !106
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr.prol, i64 0, metadata !29, metadata !40), !dbg !94
  %indvars.iv.next260.prol = add nuw nsw i64 %indvars.iv259.prol, 1, !dbg !98
  %lftr.wideiv262.prol = trunc i64 %indvars.iv259.prol to i32, !dbg !98
  %exitcond263.prol = icmp eq i32 %lftr.wideiv262.prol, %sub, !dbg !98
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !98
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !98
  br i1 %prol.iter.cmp, label %for.body15.prol, label %for.body15.preheader.split.loopexit, !llvm.loop !107

for.body15.preheader.split.loopexit:              ; preds = %for.body15.prol
  %indvars.iv259.unr.ph = phi i64 [ %indvars.iv.next260.prol, %for.body15.prol ]
  %mik.0230.unr.ph = phi float* [ %incdec.ptr.prol, %for.body15.prol ]
  br label %for.body15.preheader.split

for.body15.preheader.split:                       ; preds = %for.body15.preheader.split.loopexit, %for.body15.preheader
  %indvars.iv259.unr = phi i64 [ %resume.val, %for.body15.preheader ], [ %indvars.iv259.unr.ph, %for.body15.preheader.split.loopexit ]
  %mik.0230.unr = phi float* [ %resume.val287, %for.body15.preheader ], [ %mik.0230.unr.ph, %for.body15.preheader.split.loopexit ]
  %38 = icmp ult i32 %35, 2
  br i1 %38, label %for.inc19.loopexit, label %for.body15.preheader.split.split

for.body15.preheader.split.split:                 ; preds = %for.body15.preheader.split
  br label %for.body15, !dbg !100

for.body15:                                       ; preds = %for.body15, %for.body15.preheader.split.split
  %indvars.iv259 = phi i64 [ %indvars.iv259.unr, %for.body15.preheader.split.split ], [ %indvars.iv.next260.1, %for.body15 ]
  %mik.0230 = phi float* [ %mik.0230.unr, %for.body15.preheader.split.split ], [ %incdec.ptr.1, %for.body15 ]
  %39 = load float* %mik.0230, align 4, !dbg !100, !tbaa !83
  %mul = fmul float %17, %39, !dbg !101
  %arrayidx17 = getelementptr inbounds float* %b, i64 %indvars.iv259, !dbg !102
  %40 = load float* %arrayidx17, align 4, !dbg !102, !tbaa !83
  %add18 = fadd float %40, %mul, !dbg !102
  store float %add18, float* %arrayidx17, align 4, !dbg !102, !tbaa !83
  %incdec.ptr = getelementptr inbounds float* %mik.0230, i64 1, !dbg !106
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !29, metadata !40), !dbg !94
  %indvars.iv.next260 = add nuw nsw i64 %indvars.iv259, 1, !dbg !98
  %lftr.wideiv262 = trunc i64 %indvars.iv259 to i32, !dbg !98
  %41 = load float* %incdec.ptr, align 4, !dbg !100, !tbaa !83
  %mul.1 = fmul float %17, %41, !dbg !101
  %arrayidx17.1 = getelementptr inbounds float* %b, i64 %indvars.iv.next260, !dbg !102
  %42 = load float* %arrayidx17.1, align 4, !dbg !102, !tbaa !83
  %add18.1 = fadd float %42, %mul.1, !dbg !102
  store float %add18.1, float* %arrayidx17.1, align 4, !dbg !102, !tbaa !83
  %incdec.ptr.1 = getelementptr inbounds float* %incdec.ptr, i64 1, !dbg !106
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !29, metadata !40), !dbg !94
  %indvars.iv.next260.1 = add nuw nsw i64 %indvars.iv.next260, 1, !dbg !98
  %lftr.wideiv262.1 = trunc i64 %indvars.iv.next260 to i32, !dbg !98
  %exitcond263.1 = icmp eq i32 %lftr.wideiv262.1, %sub, !dbg !98
  br i1 %exitcond263.1, label %for.inc19.loopexit.unr-lcssa, label %for.body15, !dbg !98, !llvm.loop !109

for.inc19.loopexit.unr-lcssa:                     ; preds = %for.body15
  br label %for.inc19.loopexit

for.inc19.loopexit:                               ; preds = %for.body15.preheader.split, %for.inc19.loopexit.unr-lcssa
  br label %for.inc19

for.inc19:                                        ; preds = %for.inc19.loopexit, %middle.block, %if.end
  %incdec.ptr21 = getelementptr inbounds i32* %ipvt.addr.0234, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr21, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp1 = icmp slt i64 %indvars.iv.next265, %2, !dbg !64
  %indvars.iv.next258 = add nuw nsw i64 %indvars.iv257, 1, !dbg !68
  br i1 %cmp1, label %for.body, label %for.cond23.preheader.loopexit, !dbg !68

for.body25:                                       ; preds = %for.body25.lr.ph, %for.inc49
  %indvars.iv254.in = phi i64 [ %7, %for.body25.lr.ph ], [ %indvars.iv254, %for.inc49 ]
  %indvars.iv252 = phi i32 [ %6, %for.body25.lr.ph ], [ %indvars.iv.next253, %for.inc49 ]
  %indvars.iv254 = add nsw i64 %indvars.iv254.in, -1, !dbg !74
  %arrayidx28 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv254, !dbg !111
  %43 = load float** %arrayidx28, align 8, !dbg !111, !tbaa !77
  %add.ptr30 = getelementptr inbounds float* %43, i64 %indvars.iv254, !dbg !111
  tail call void @llvm.dbg.value(metadata float* %add.ptr30, i64 0, metadata !28, metadata !40), !dbg !113
  %44 = load float* %add.ptr30, align 4, !dbg !114, !tbaa !83
  %arrayidx32 = getelementptr inbounds float* %b, i64 %indvars.iv254, !dbg !115
  %45 = load float* %arrayidx32, align 4, !dbg !115, !tbaa !83
  %div = fdiv float %45, %44, !dbg !115
  store float %div, float* %arrayidx32, align 4, !dbg !115, !tbaa !83
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !40), !dbg !116
  tail call void @llvm.dbg.value(metadata float* %43, i64 0, metadata !30, metadata !40), !dbg !117
  %cmp37224 = icmp sgt i64 %indvars.iv254.in, 1, !dbg !118
  br i1 %cmp37224, label %for.body38.preheader, label %return.loopexit, !dbg !121

for.body38.preheader:                             ; preds = %for.body25
  br label %for.body38, !dbg !122

for.body38:                                       ; preds = %for.body38.preheader, %for.body38.for.body38_crit_edge
  %46 = phi float [ %.pre, %for.body38.for.body38_crit_edge ], [ %div, %for.body38.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body38.for.body38_crit_edge ], [ 0, %for.body38.preheader ]
  %uik.0225 = phi float* [ %incdec.ptr47, %for.body38.for.body38_crit_edge ], [ %43, %for.body38.preheader ]
  %47 = load float* %uik.0225, align 4, !dbg !122, !tbaa !83
  %mul41 = fmul float %47, %46, !dbg !123
  %arrayidx43 = getelementptr inbounds float* %b, i64 %indvars.iv, !dbg !124
  %48 = load float* %arrayidx43, align 4, !dbg !124, !tbaa !83
  %sub44 = fsub float %48, %mul41, !dbg !124
  store float %sub44, float* %arrayidx43, align 4, !dbg !124, !tbaa !83
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr47, i64 0, metadata !30, metadata !40), !dbg !117
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !121
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv252, !dbg !121
  br i1 %exitcond, label %for.inc49, label %for.body38.for.body38_crit_edge, !dbg !121

for.body38.for.body38_crit_edge:                  ; preds = %for.body38
  %incdec.ptr47 = getelementptr inbounds float* %uik.0225, i64 1, !dbg !125
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !121
  %.pre = load float* %arrayidx32, align 4, !dbg !126, !tbaa !83
  br label %for.body38, !dbg !121

for.inc49:                                        ; preds = %for.body38
  %indvars.iv.next253 = add nsw i32 %indvars.iv252, -1, !dbg !74
  br i1 %cmp37224, label %for.body25, label %return.loopexit, !dbg !74

for.body54:                                       ; preds = %for.body54.preheader, %for.end72
  %indvars.iv274 = phi i64 [ %indvars.iv.next275, %for.end72 ], [ 0, %for.body54.preheader ]
  %indvars.iv271 = phi i32 [ %indvars.iv.next272, %for.end72 ], [ -1, %for.body54.preheader ]
  %49 = trunc i64 %indvars.iv274 to i32
  %arrayidx57 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv274, !dbg !62
  %50 = load float** %arrayidx57, align 8, !dbg !62, !tbaa !77
  %add.ptr59 = getelementptr inbounds float* %50, i64 %indvars.iv274, !dbg !62
  tail call void @llvm.dbg.value(metadata float* %add.ptr59, i64 0, metadata !28, metadata !40), !dbg !113
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !40), !dbg !116
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !27, metadata !40), !dbg !85
  tail call void @llvm.dbg.value(metadata float* %50, i64 0, metadata !30, metadata !40), !dbg !117
  tail call void @llvm.dbg.value(metadata float* %b, i64 0, metadata !31, metadata !40), !dbg !127
  %cmp64244 = icmp sgt i64 %indvars.iv274, 0, !dbg !128
  br i1 %cmp64244, label %for.body65.preheader, label %for.end72, !dbg !131

for.body65.preheader:                             ; preds = %for.body54
  %xtraiter337 = and i32 %49, 3
  %lcmp.mod338 = icmp ne i32 %xtraiter337, 0
  %lcmp.overflow339 = icmp eq i32 %49, 0
  %lcmp.or340 = or i1 %lcmp.overflow339, %lcmp.mod338
  br i1 %lcmp.or340, label %for.body65.prol.preheader, label %for.body65.preheader.split

for.body65.prol.preheader:                        ; preds = %for.body65.preheader
  br label %for.body65.prol, !dbg !132

for.body65.prol:                                  ; preds = %for.body65.prol.preheader, %for.body65.prol
  %i.2248.prol = phi i32 [ %inc69.prol, %for.body65.prol ], [ 0, %for.body65.prol.preheader ]
  %bi.0247.prol = phi float* [ %incdec.ptr71.prol, %for.body65.prol ], [ %b, %for.body65.prol.preheader ]
  %uik.1246.prol = phi float* [ %incdec.ptr70.prol, %for.body65.prol ], [ %50, %for.body65.prol.preheader ]
  %t.0245.prol = phi float [ %add67.prol, %for.body65.prol ], [ 0.000000e+00, %for.body65.prol.preheader ]
  %prol.iter341 = phi i32 [ %prol.iter341.sub, %for.body65.prol ], [ %xtraiter337, %for.body65.prol.preheader ]
  %51 = load float* %uik.1246.prol, align 4, !dbg !132, !tbaa !83
  %52 = load float* %bi.0247.prol, align 4, !dbg !133, !tbaa !83
  %mul66.prol = fmul float %51, %52, !dbg !134
  %add67.prol = fadd float %t.0245.prol, %mul66.prol, !dbg !135
  tail call void @llvm.dbg.value(metadata float %add67.prol, i64 0, metadata !27, metadata !40), !dbg !85
  %inc69.prol = add nuw nsw i32 %i.2248.prol, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %inc69.prol, i64 0, metadata !32, metadata !40), !dbg !116
  %incdec.ptr70.prol = getelementptr inbounds float* %uik.1246.prol, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70.prol, i64 0, metadata !30, metadata !40), !dbg !117
  %incdec.ptr71.prol = getelementptr inbounds float* %bi.0247.prol, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71.prol, i64 0, metadata !31, metadata !40), !dbg !127
  %exitcond273.prol = icmp eq i32 %i.2248.prol, %indvars.iv271, !dbg !131
  %prol.iter341.sub = sub i32 %prol.iter341, 1, !dbg !131
  %prol.iter341.cmp = icmp ne i32 %prol.iter341.sub, 0, !dbg !131
  br i1 %prol.iter341.cmp, label %for.body65.prol, label %for.body65.preheader.split.loopexit, !llvm.loop !139

for.body65.preheader.split.loopexit:              ; preds = %for.body65.prol
  %add67.lcssa.unr.ph = phi float [ %add67.prol, %for.body65.prol ]
  %i.2248.unr.ph = phi i32 [ %inc69.prol, %for.body65.prol ]
  %bi.0247.unr.ph = phi float* [ %incdec.ptr71.prol, %for.body65.prol ]
  %uik.1246.unr.ph = phi float* [ %incdec.ptr70.prol, %for.body65.prol ]
  %t.0245.unr.ph = phi float [ %add67.prol, %for.body65.prol ]
  br label %for.body65.preheader.split

for.body65.preheader.split:                       ; preds = %for.body65.preheader.split.loopexit, %for.body65.preheader
  %add67.lcssa.unr = phi float [ 0.000000e+00, %for.body65.preheader ], [ %add67.lcssa.unr.ph, %for.body65.preheader.split.loopexit ]
  %i.2248.unr = phi i32 [ 0, %for.body65.preheader ], [ %i.2248.unr.ph, %for.body65.preheader.split.loopexit ]
  %bi.0247.unr = phi float* [ %b, %for.body65.preheader ], [ %bi.0247.unr.ph, %for.body65.preheader.split.loopexit ]
  %uik.1246.unr = phi float* [ %50, %for.body65.preheader ], [ %uik.1246.unr.ph, %for.body65.preheader.split.loopexit ]
  %t.0245.unr = phi float [ 0.000000e+00, %for.body65.preheader ], [ %t.0245.unr.ph, %for.body65.preheader.split.loopexit ]
  %53 = icmp ult i32 %49, 4
  br i1 %53, label %for.end72.loopexit, label %for.body65.preheader.split.split

for.body65.preheader.split.split:                 ; preds = %for.body65.preheader.split
  br label %for.body65, !dbg !132

for.body65:                                       ; preds = %for.body65, %for.body65.preheader.split.split
  %i.2248 = phi i32 [ %i.2248.unr, %for.body65.preheader.split.split ], [ %inc69.3, %for.body65 ]
  %bi.0247 = phi float* [ %bi.0247.unr, %for.body65.preheader.split.split ], [ %incdec.ptr71.3, %for.body65 ]
  %uik.1246 = phi float* [ %uik.1246.unr, %for.body65.preheader.split.split ], [ %incdec.ptr70.3, %for.body65 ]
  %t.0245 = phi float [ %t.0245.unr, %for.body65.preheader.split.split ], [ %add67.3, %for.body65 ]
  %54 = load float* %uik.1246, align 4, !dbg !132, !tbaa !83
  %55 = load float* %bi.0247, align 4, !dbg !133, !tbaa !83
  %mul66 = fmul float %54, %55, !dbg !134
  %add67 = fadd float %t.0245, %mul66, !dbg !135
  tail call void @llvm.dbg.value(metadata float %add67, i64 0, metadata !27, metadata !40), !dbg !85
  %inc69 = add nuw nsw i32 %i.2248, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %inc69, i64 0, metadata !32, metadata !40), !dbg !116
  %incdec.ptr70 = getelementptr inbounds float* %uik.1246, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70, i64 0, metadata !30, metadata !40), !dbg !117
  %incdec.ptr71 = getelementptr inbounds float* %bi.0247, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71, i64 0, metadata !31, metadata !40), !dbg !127
  %56 = load float* %incdec.ptr70, align 4, !dbg !132, !tbaa !83
  %57 = load float* %incdec.ptr71, align 4, !dbg !133, !tbaa !83
  %mul66.1 = fmul float %56, %57, !dbg !134
  %add67.1 = fadd float %add67, %mul66.1, !dbg !135
  tail call void @llvm.dbg.value(metadata float %add67, i64 0, metadata !27, metadata !40), !dbg !85
  %inc69.1 = add nuw nsw i32 %inc69, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %inc69, i64 0, metadata !32, metadata !40), !dbg !116
  %incdec.ptr70.1 = getelementptr inbounds float* %incdec.ptr70, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70, i64 0, metadata !30, metadata !40), !dbg !117
  %incdec.ptr71.1 = getelementptr inbounds float* %incdec.ptr71, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71, i64 0, metadata !31, metadata !40), !dbg !127
  %58 = load float* %incdec.ptr70.1, align 4, !dbg !132, !tbaa !83
  %59 = load float* %incdec.ptr71.1, align 4, !dbg !133, !tbaa !83
  %mul66.2 = fmul float %58, %59, !dbg !134
  %add67.2 = fadd float %add67.1, %mul66.2, !dbg !135
  tail call void @llvm.dbg.value(metadata float %add67, i64 0, metadata !27, metadata !40), !dbg !85
  %inc69.2 = add nuw nsw i32 %inc69.1, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %inc69, i64 0, metadata !32, metadata !40), !dbg !116
  %incdec.ptr70.2 = getelementptr inbounds float* %incdec.ptr70.1, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70, i64 0, metadata !30, metadata !40), !dbg !117
  %incdec.ptr71.2 = getelementptr inbounds float* %incdec.ptr71.1, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71, i64 0, metadata !31, metadata !40), !dbg !127
  %60 = load float* %incdec.ptr70.2, align 4, !dbg !132, !tbaa !83
  %61 = load float* %incdec.ptr71.2, align 4, !dbg !133, !tbaa !83
  %mul66.3 = fmul float %60, %61, !dbg !134
  %add67.3 = fadd float %add67.2, %mul66.3, !dbg !135
  tail call void @llvm.dbg.value(metadata float %add67, i64 0, metadata !27, metadata !40), !dbg !85
  %inc69.3 = add nuw nsw i32 %inc69.2, 1, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 %inc69, i64 0, metadata !32, metadata !40), !dbg !116
  %incdec.ptr70.3 = getelementptr inbounds float* %incdec.ptr70.2, i64 1, !dbg !137
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr70, i64 0, metadata !30, metadata !40), !dbg !117
  %incdec.ptr71.3 = getelementptr inbounds float* %incdec.ptr71.2, i64 1, !dbg !138
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr71, i64 0, metadata !31, metadata !40), !dbg !127
  %exitcond273.3 = icmp eq i32 %inc69.2, %indvars.iv271, !dbg !131
  br i1 %exitcond273.3, label %for.end72.loopexit.unr-lcssa, label %for.body65, !dbg !131

for.end72.loopexit.unr-lcssa:                     ; preds = %for.body65
  %add67.lcssa.ph = phi float [ %add67.3, %for.body65 ]
  br label %for.end72.loopexit

for.end72.loopexit:                               ; preds = %for.body65.preheader.split, %for.end72.loopexit.unr-lcssa
  %add67.lcssa = phi float [ %add67.lcssa.unr, %for.body65.preheader.split ], [ %add67.lcssa.ph, %for.end72.loopexit.unr-lcssa ]
  br label %for.end72

for.end72:                                        ; preds = %for.end72.loopexit, %for.body54
  %t.0.lcssa = phi float [ 0.000000e+00, %for.body54 ], [ %add67.lcssa, %for.end72.loopexit ]
  %arrayidx74 = getelementptr inbounds float* %b, i64 %indvars.iv274, !dbg !140
  %62 = load float* %arrayidx74, align 4, !dbg !140, !tbaa !83
  %sub75 = fsub float %62, %t.0.lcssa, !dbg !140
  %63 = load float* %add.ptr59, align 4, !dbg !141, !tbaa !83
  %div76 = fdiv float %sub75, %63, !dbg !142
  store float %div76, float* %arrayidx74, align 4, !dbg !143, !tbaa !83
  %indvars.iv.next275 = add nuw nsw i64 %indvars.iv274, 1, !dbg !61
  %indvars.iv.next272 = add nsw i32 %indvars.iv271, 1, !dbg !61
  %lftr.wideiv276 = trunc i64 %indvars.iv274 to i32, !dbg !61
  %exitcond277 = icmp eq i32 %lftr.wideiv276, %sub, !dbg !61
  br i1 %exitcond277, label %for.end81.loopexit, label %for.body54, !dbg !61

for.end81.loopexit:                               ; preds = %for.end72
  br label %for.end81

for.end81:                                        ; preds = %for.end81.loopexit, %for.cond52.preheader
  %sub82 = add i32 %0, -2, !dbg !144
  tail call void @llvm.dbg.value(metadata i32* %add.ptr84, i64 0, metadata !24, metadata !40), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 %sub82, i64 0, metadata !33, metadata !40), !dbg !56
  %cmp87241 = icmp sgt i32 %sub82, -1, !dbg !145
  br i1 %cmp87241, label %for.body88.lr.ph, label %return, !dbg !150

for.body88.lr.ph:                                 ; preds = %for.end81
  %idx.ext83 = sext i32 %sub82 to i64, !dbg !151
  %add.ptr84 = getelementptr inbounds i32* %ipvt, i64 %idx.ext83, !dbg !151
  %64 = sext i32 %0 to i64, !dbg !150
  br label %for.body88, !dbg !150

for.body88:                                       ; preds = %for.body88.lr.ph, %for.inc123
  %indvar = phi i32 [ 0, %for.body88.lr.ph ], [ %indvar.next, %for.inc123 ]
  %indvars.iv267 = phi i64 [ %idx.ext83, %for.body88.lr.ph ], [ %indvars.iv.next268, %for.inc123 ]
  %ipvt.addr.1243 = phi i32* [ %add.ptr84, %for.body88.lr.ph ], [ %incdec.ptr125, %for.inc123 ]
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !27, metadata !40), !dbg !85
  %65 = add i32 %indvar, 1, !dbg !152
  %add.ptr94.sum = add nsw i64 %indvars.iv267, 1, !dbg !152
  tail call void @llvm.dbg.value(metadata float* %add.ptr95, i64 0, metadata !29, metadata !40), !dbg !94
  %add.ptr97 = getelementptr inbounds float* %b, i64 %indvars.iv267, !dbg !155
  tail call void @llvm.dbg.value(metadata float* %add.ptr98, i64 0, metadata !31, metadata !40), !dbg !127
  %cmp100236 = icmp slt i64 %add.ptr94.sum, %64, !dbg !156
  br i1 %cmp100236, label %for.body101.lr.ph, label %for.end108, !dbg !158

for.body101.lr.ph:                                ; preds = %for.body88
  %add.ptr98 = getelementptr inbounds float* %b, i64 %add.ptr94.sum, !dbg !155
  %arrayidx92 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv267, !dbg !152
  %66 = load float** %arrayidx92, align 8, !dbg !152, !tbaa !77
  %add.ptr95 = getelementptr inbounds float* %66, i64 %add.ptr94.sum, !dbg !152
  %67 = trunc i64 %add.ptr94.sum to i32, !dbg !158
  %xtraiter332 = and i32 %65, 3
  %lcmp.mod333 = icmp ne i32 %xtraiter332, 0
  %lcmp.overflow334 = icmp eq i32 %65, 0
  %lcmp.or335 = or i1 %lcmp.overflow334, %lcmp.mod333
  br i1 %lcmp.or335, label %for.body101.prol.preheader, label %for.body101.lr.ph.split

for.body101.prol.preheader:                       ; preds = %for.body101.lr.ph
  br label %for.body101.prol, !dbg !159

for.body101.prol:                                 ; preds = %for.body101.prol.preheader, %for.body101.prol
  %i.3240.prol = phi i32 [ %i.3.prol, %for.body101.prol ], [ %67, %for.body101.prol.preheader ]
  %bi.1239.prol = phi float* [ %incdec.ptr107.prol, %for.body101.prol ], [ %add.ptr98, %for.body101.prol.preheader ]
  %mik.1238.prol = phi float* [ %incdec.ptr106.prol, %for.body101.prol ], [ %add.ptr95, %for.body101.prol.preheader ]
  %t.1237.prol = phi float [ %add103.prol, %for.body101.prol ], [ 0.000000e+00, %for.body101.prol.preheader ]
  %prol.iter336 = phi i32 [ %prol.iter336.sub, %for.body101.prol ], [ %xtraiter332, %for.body101.prol.preheader ]
  %68 = load float* %mik.1238.prol, align 4, !dbg !159, !tbaa !83
  %69 = load float* %bi.1239.prol, align 4, !dbg !160, !tbaa !83
  %mul102.prol = fmul float %68, %69, !dbg !161
  %add103.prol = fadd float %t.1237.prol, %mul102.prol, !dbg !162
  tail call void @llvm.dbg.value(metadata float %add103.prol, i64 0, metadata !27, metadata !40), !dbg !85
  %incdec.ptr106.prol = getelementptr inbounds float* %mik.1238.prol, i64 1, !dbg !163
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106.prol, i64 0, metadata !29, metadata !40), !dbg !94
  %incdec.ptr107.prol = getelementptr inbounds float* %bi.1239.prol, i64 1, !dbg !164
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107.prol, i64 0, metadata !31, metadata !40), !dbg !127
  %i.3.prol = add nsw i32 %i.3240.prol, 1, !dbg !165
  %exitcond266.prol = icmp eq i32 %i.3240.prol, %sub, !dbg !158
  %prol.iter336.sub = sub i32 %prol.iter336, 1, !dbg !158
  %prol.iter336.cmp = icmp ne i32 %prol.iter336.sub, 0, !dbg !158
  br i1 %prol.iter336.cmp, label %for.body101.prol, label %for.body101.lr.ph.split.loopexit, !llvm.loop !166

for.body101.lr.ph.split.loopexit:                 ; preds = %for.body101.prol
  %add103.lcssa.unr.ph = phi float [ %add103.prol, %for.body101.prol ]
  %i.3240.unr.ph = phi i32 [ %i.3.prol, %for.body101.prol ]
  %bi.1239.unr.ph = phi float* [ %incdec.ptr107.prol, %for.body101.prol ]
  %mik.1238.unr.ph = phi float* [ %incdec.ptr106.prol, %for.body101.prol ]
  %t.1237.unr.ph = phi float [ %add103.prol, %for.body101.prol ]
  br label %for.body101.lr.ph.split

for.body101.lr.ph.split:                          ; preds = %for.body101.lr.ph.split.loopexit, %for.body101.lr.ph
  %add103.lcssa.unr = phi float [ 0.000000e+00, %for.body101.lr.ph ], [ %add103.lcssa.unr.ph, %for.body101.lr.ph.split.loopexit ]
  %i.3240.unr = phi i32 [ %67, %for.body101.lr.ph ], [ %i.3240.unr.ph, %for.body101.lr.ph.split.loopexit ]
  %bi.1239.unr = phi float* [ %add.ptr98, %for.body101.lr.ph ], [ %bi.1239.unr.ph, %for.body101.lr.ph.split.loopexit ]
  %mik.1238.unr = phi float* [ %add.ptr95, %for.body101.lr.ph ], [ %mik.1238.unr.ph, %for.body101.lr.ph.split.loopexit ]
  %t.1237.unr = phi float [ 0.000000e+00, %for.body101.lr.ph ], [ %t.1237.unr.ph, %for.body101.lr.ph.split.loopexit ]
  %70 = icmp ult i32 %65, 4
  br i1 %70, label %for.end108.loopexit, label %for.body101.lr.ph.split.split

for.body101.lr.ph.split.split:                    ; preds = %for.body101.lr.ph.split
  br label %for.body101, !dbg !158

for.body101:                                      ; preds = %for.body101, %for.body101.lr.ph.split.split
  %i.3240 = phi i32 [ %i.3240.unr, %for.body101.lr.ph.split.split ], [ %i.3.3, %for.body101 ]
  %bi.1239 = phi float* [ %bi.1239.unr, %for.body101.lr.ph.split.split ], [ %incdec.ptr107.3, %for.body101 ]
  %mik.1238 = phi float* [ %mik.1238.unr, %for.body101.lr.ph.split.split ], [ %incdec.ptr106.3, %for.body101 ]
  %t.1237 = phi float [ %t.1237.unr, %for.body101.lr.ph.split.split ], [ %add103.3, %for.body101 ]
  %71 = load float* %mik.1238, align 4, !dbg !159, !tbaa !83
  %72 = load float* %bi.1239, align 4, !dbg !160, !tbaa !83
  %mul102 = fmul float %71, %72, !dbg !161
  %add103 = fadd float %t.1237, %mul102, !dbg !162
  tail call void @llvm.dbg.value(metadata float %add103, i64 0, metadata !27, metadata !40), !dbg !85
  %incdec.ptr106 = getelementptr inbounds float* %mik.1238, i64 1, !dbg !163
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106, i64 0, metadata !29, metadata !40), !dbg !94
  %incdec.ptr107 = getelementptr inbounds float* %bi.1239, i64 1, !dbg !164
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107, i64 0, metadata !31, metadata !40), !dbg !127
  %i.3 = add nsw i32 %i.3240, 1, !dbg !165
  %73 = load float* %incdec.ptr106, align 4, !dbg !159, !tbaa !83
  %74 = load float* %incdec.ptr107, align 4, !dbg !160, !tbaa !83
  %mul102.1 = fmul float %73, %74, !dbg !161
  %add103.1 = fadd float %add103, %mul102.1, !dbg !162
  tail call void @llvm.dbg.value(metadata float %add103, i64 0, metadata !27, metadata !40), !dbg !85
  %incdec.ptr106.1 = getelementptr inbounds float* %incdec.ptr106, i64 1, !dbg !163
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106, i64 0, metadata !29, metadata !40), !dbg !94
  %incdec.ptr107.1 = getelementptr inbounds float* %incdec.ptr107, i64 1, !dbg !164
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107, i64 0, metadata !31, metadata !40), !dbg !127
  %i.3.1 = add nsw i32 %i.3, 1, !dbg !165
  %75 = load float* %incdec.ptr106.1, align 4, !dbg !159, !tbaa !83
  %76 = load float* %incdec.ptr107.1, align 4, !dbg !160, !tbaa !83
  %mul102.2 = fmul float %75, %76, !dbg !161
  %add103.2 = fadd float %add103.1, %mul102.2, !dbg !162
  tail call void @llvm.dbg.value(metadata float %add103, i64 0, metadata !27, metadata !40), !dbg !85
  %incdec.ptr106.2 = getelementptr inbounds float* %incdec.ptr106.1, i64 1, !dbg !163
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106, i64 0, metadata !29, metadata !40), !dbg !94
  %incdec.ptr107.2 = getelementptr inbounds float* %incdec.ptr107.1, i64 1, !dbg !164
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107, i64 0, metadata !31, metadata !40), !dbg !127
  %i.3.2 = add nsw i32 %i.3.1, 1, !dbg !165
  %77 = load float* %incdec.ptr106.2, align 4, !dbg !159, !tbaa !83
  %78 = load float* %incdec.ptr107.2, align 4, !dbg !160, !tbaa !83
  %mul102.3 = fmul float %77, %78, !dbg !161
  %add103.3 = fadd float %add103.2, %mul102.3, !dbg !162
  tail call void @llvm.dbg.value(metadata float %add103, i64 0, metadata !27, metadata !40), !dbg !85
  %incdec.ptr106.3 = getelementptr inbounds float* %incdec.ptr106.2, i64 1, !dbg !163
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr106, i64 0, metadata !29, metadata !40), !dbg !94
  %incdec.ptr107.3 = getelementptr inbounds float* %incdec.ptr107.2, i64 1, !dbg !164
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr107, i64 0, metadata !31, metadata !40), !dbg !127
  %i.3.3 = add nsw i32 %i.3.2, 1, !dbg !165
  %exitcond266.3 = icmp eq i32 %i.3.2, %sub, !dbg !158
  br i1 %exitcond266.3, label %for.end108.loopexit.unr-lcssa, label %for.body101, !dbg !158

for.end108.loopexit.unr-lcssa:                    ; preds = %for.body101
  %add103.lcssa.ph = phi float [ %add103.3, %for.body101 ]
  br label %for.end108.loopexit

for.end108.loopexit:                              ; preds = %for.body101.lr.ph.split, %for.end108.loopexit.unr-lcssa
  %add103.lcssa = phi float [ %add103.lcssa.unr, %for.body101.lr.ph.split ], [ %add103.lcssa.ph, %for.end108.loopexit.unr-lcssa ]
  br label %for.end108

for.end108:                                       ; preds = %for.end108.loopexit, %for.body88
  %t.1.lcssa = phi float [ 0.000000e+00, %for.body88 ], [ %add103.lcssa, %for.end108.loopexit ]
  %79 = load float* %add.ptr97, align 4, !dbg !167, !tbaa !83
  %add111 = fadd float %t.1.lcssa, %79, !dbg !167
  store float %add111, float* %add.ptr97, align 4, !dbg !167, !tbaa !83
  %80 = load i32* %ipvt.addr.1243, align 4, !dbg !168, !tbaa !80
  tail call void @llvm.dbg.value(metadata i32 %80, i64 0, metadata !34, metadata !40), !dbg !81
  %81 = trunc i64 %indvars.iv267 to i32, !dbg !169
  %cmp112 = icmp eq i32 %80, %81, !dbg !169
  br i1 %cmp112, label %for.inc123, label %if.end114, !dbg !171

if.end114:                                        ; preds = %for.end108
  %idxprom115 = sext i32 %80 to i64, !dbg !172
  %arrayidx116 = getelementptr inbounds float* %b, i64 %idxprom115, !dbg !172
  %82 = load float* %arrayidx116, align 4, !dbg !172, !tbaa !83
  tail call void @llvm.dbg.value(metadata float %82, i64 0, metadata !27, metadata !40), !dbg !85
  store float %add111, float* %arrayidx116, align 4, !dbg !173, !tbaa !83
  store float %82, float* %add.ptr97, align 4, !dbg !174, !tbaa !83
  br label %for.inc123, !dbg !175

for.inc123:                                       ; preds = %for.end108, %if.end114
  %incdec.ptr125 = getelementptr inbounds i32* %ipvt.addr.1243, i64 -1, !dbg !176
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr125, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp87 = icmp sgt i64 %indvars.iv267, 0, !dbg !145
  %indvars.iv.next268 = add nsw i64 %indvars.iv267, -1, !dbg !150
  %indvar.next = add i32 %indvar, 1, !dbg !150
  br i1 %cmp87, label %for.body88, label %return.loopexit331, !dbg !150

return.loopexit:                                  ; preds = %for.inc49, %for.body25
  br label %return

return.loopexit331:                               ; preds = %for.inc123
  br label %return

return:                                           ; preds = %return.loopexit331, %return.loopexit, %for.end81, %for.cond23.preheader
  ret i32 0, !dbg !177
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c] [DW_LANG_C99]
!1 = !{!"sgesl.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00sgesl\00sgesl\00\0011\000\001\000\000\000\001\0042", !1, !5, !6, null, i32 (%struct.FULL*, i32*, float*, i32)* @sgesl, null, null, !22} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 42] [sgesl]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !21, !17, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = !{!"0x13\00FULL\0031\0064064\0064\000\000\000", !11, null, null, !12, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = !{!"./ge.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!12 = !{!13, !14, !15}
!13 = !{!"0xd\00cd\0032\0032\0032\000\000", !11, !10, !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = !{!"0xd\00rd\0033\0032\0032\0032\000", !11, !10, !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = !{!"0xd\00pd\0034\0064000\0064\0064\000", !11, !10, !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !17, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = !{!20}
!20 = !{!"0x21\000\001000"}                       ; [ DW_TAG_subrange_type ] [0, 999]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!23 = !{!"0x101\00a\0016777228\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = !{!"0x101\00ipvt\0033554445\000", !4, !5, !21} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = !{!"0x101\00b\0050331662\000", !4, !5, !17} ; [ DW_TAG_arg_variable ] [b] [line 14]
!26 = !{!"0x101\00job\0067108877\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [job] [line 13]
!27 = !{!"0x100\00t\0043\000", !4, !5, !18}       ; [ DW_TAG_auto_variable ] [t] [line 43]
!28 = !{!"0x100\00akk\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [akk] [line 44]
!29 = !{!"0x100\00mik\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [mik] [line 44]
!30 = !{!"0x100\00uik\0044\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [uik] [line 44]
!31 = !{!"0x100\00bi\0044\000", !4, !5, !17}      ; [ DW_TAG_auto_variable ] [bi] [line 44]
!32 = !{!"0x100\00i\0045\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 45]
!33 = !{!"0x100\00k\0045\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [k] [line 45]
!34 = !{!"0x100\00l\0046\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [l] [line 46]
!35 = !{!"0x100\00n\0046\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 46]
!36 = !{!"0x100\00nm1\0046\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [nm1] [line 46]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!41 = !MDLocation(line: 12, column: 14, scope: !4)
!42 = !MDLocation(line: 13, column: 11, scope: !4)
!43 = !MDLocation(line: 14, column: 11, scope: !4)
!44 = !MDLocation(line: 13, column: 17, scope: !4)
!45 = !MDLocation(line: 48, column: 9, scope: !4)
!46 = !{!47, !48, i64 0}
!47 = !{!"FULL", !48, i64 0, !48, i64 4, !49, i64 8}
!48 = !{!"int", !49, i64 0}
!49 = !{!"omnipotent char", !50, i64 0}
!50 = !{!"Simple C/C++ TBAA"}
!51 = !MDLocation(line: 46, column: 10, scope: !4)
!52 = !MDLocation(line: 49, column: 9, scope: !4)
!53 = !MDLocation(line: 46, column: 13, scope: !4)
!54 = !MDLocation(line: 52, column: 7, scope: !55)
!55 = !{!"0xb\0052\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!56 = !MDLocation(line: 45, column: 19, scope: !4)
!57 = !MDLocation(line: 52, column: 7, scope: !4)
!58 = !MDLocation(line: 80, column: 13, scope: !59)
!59 = !{!"0xb\0080\003\0015", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!60 = !{!"0xb\0080\003\0014", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!61 = !MDLocation(line: 80, column: 3, scope: !60)
!62 = !MDLocation(line: 81, column: 11, scope: !63)
!63 = !{!"0xb\0080\0024\0016", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!64 = !MDLocation(line: 54, column: 15, scope: !65)
!65 = !{!"0xb\0054\005\003", !1, !66}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!66 = !{!"0xb\0054\005\002", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!67 = !{!"0xb\0052\0018\001", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!68 = !MDLocation(line: 54, column: 5, scope: !66)
!69 = !MDLocation(line: 69, column: 17, scope: !70)
!70 = !{!"0xb\002", !1, !71}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!71 = !{!"0xb\001", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!72 = !{!"0xb\0069\005\0010", !1, !73}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!73 = !{!"0xb\0069\005\009", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!74 = !MDLocation(line: 69, column: 5, scope: !73)
!75 = !MDLocation(line: 55, column: 13, scope: !76)
!76 = !{!"0xb\0054\0036\004", !1, !65}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!77 = !{!78, !78, i64 0}
!78 = !{!"any pointer", !49, i64 0}
!79 = !MDLocation(line: 58, column: 11, scope: !76)
!80 = !{!48, !48, i64 0}
!81 = !MDLocation(line: 46, column: 7, scope: !4)
!82 = !MDLocation(line: 59, column: 11, scope: !76)
!83 = !{!84, !84, i64 0}
!84 = !{!"float", !49, i64 0}
!85 = !MDLocation(line: 43, column: 9, scope: !4)
!86 = !MDLocation(line: 60, column: 11, scope: !87)
!87 = !{!"0xb\0060\0011\005", !1, !76}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!88 = !MDLocation(line: 60, column: 11, scope: !76)
!89 = !MDLocation(line: 61, column: 9, scope: !90)
!90 = !{!"0xb\0060\0020\006", !1, !87}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!91 = !MDLocation(line: 61, column: 2, scope: !90)
!92 = !MDLocation(line: 62, column: 2, scope: !90)
!93 = !MDLocation(line: 63, column: 7, scope: !90)
!94 = !MDLocation(line: 44, column: 16, scope: !4)
!95 = !MDLocation(line: 64, column: 30, scope: !96)
!96 = !{!"0xb\0064\007\008", !1, !97}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!97 = !{!"0xb\0064\007\007", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!98 = !MDLocation(line: 64, column: 7, scope: !97)
!99 = !MDLocation(line: 64, column: 23, scope: !97)
!100 = !MDLocation(line: 65, column: 11, scope: !96)
!101 = !MDLocation(line: 65, column: 10, scope: !96)
!102 = !MDLocation(line: 65, column: 2, scope: !96)
!103 = distinct !{!103, !104, !105}
!104 = !{!"llvm.loop.vectorize.width", i32 1}
!105 = !{!"llvm.loop.interleave.count", i32 1}
!106 = !MDLocation(line: 64, column: 40, scope: !96)
!107 = distinct !{!107, !108}
!108 = !{!"llvm.loop.unroll.disable"}
!109 = distinct !{!109, !104, !105}
!110 = !MDLocation(line: 54, column: 27, scope: !65)
!111 = !MDLocation(line: 70, column: 13, scope: !112)
!112 = !{!"0xb\0069\0029\0011", !1, !72}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!113 = !MDLocation(line: 44, column: 10, scope: !4)
!114 = !MDLocation(line: 71, column: 16, scope: !112)
!115 = !MDLocation(line: 71, column: 7, scope: !112)
!116 = !MDLocation(line: 45, column: 16, scope: !4)
!117 = !MDLocation(line: 44, column: 22, scope: !4)
!118 = !MDLocation(line: 72, column: 31, scope: !119)
!119 = !{!"0xb\0072\007\0013", !1, !120}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!120 = !{!"0xb\0072\007\0012", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!121 = !MDLocation(line: 72, column: 7, scope: !120)
!122 = !MDLocation(line: 73, column: 11, scope: !119)
!123 = !MDLocation(line: 73, column: 10, scope: !119)
!124 = !MDLocation(line: 73, column: 2, scope: !119)
!125 = !MDLocation(line: 72, column: 41, scope: !119)
!126 = !MDLocation(line: 73, column: 17, scope: !119)
!127 = !MDLocation(line: 44, column: 28, scope: !4)
!128 = !MDLocation(line: 82, column: 42, scope: !129)
!129 = !{!"0xb\0082\005\0018", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!130 = !{!"0xb\0082\005\0017", !1, !63}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!131 = !MDLocation(line: 82, column: 5, scope: !130)
!132 = !MDLocation(line: 83, column: 13, scope: !129)
!133 = !MDLocation(line: 83, column: 20, scope: !129)
!134 = !MDLocation(line: 83, column: 12, scope: !129)
!135 = !MDLocation(line: 83, column: 7, scope: !129)
!136 = !MDLocation(line: 82, column: 47, scope: !129)
!137 = !MDLocation(line: 82, column: 52, scope: !129)
!138 = !MDLocation(line: 82, column: 59, scope: !129)
!139 = distinct !{!139, !108}
!140 = !MDLocation(line: 84, column: 13, scope: !63)
!141 = !MDLocation(line: 84, column: 26, scope: !63)
!142 = !MDLocation(line: 84, column: 12, scope: !63)
!143 = !MDLocation(line: 84, column: 5, scope: !63)
!144 = !MDLocation(line: 89, column: 11, scope: !4)
!145 = !MDLocation(line: 90, column: 15, scope: !146)
!146 = !{!"0xb\002", !1, !147}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!147 = !{!"0xb\001", !1, !148}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!148 = !{!"0xb\0090\003\0020", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!149 = !{!"0xb\0090\003\0019", !1, !4}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!150 = !MDLocation(line: 90, column: 3, scope: !149)
!151 = !MDLocation(line: 89, column: 3, scope: !4)
!152 = !MDLocation(line: 91, column: 28, scope: !153)
!153 = !{!"0xb\0091\005\0022", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!154 = !{!"0xb\0090\0035\0021", !1, !148}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!155 = !MDLocation(line: 91, column: 45, scope: !153)
!156 = !MDLocation(line: 91, column: 52, scope: !157)
!157 = !{!"0xb\0091\005\0023", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!158 = !MDLocation(line: 91, column: 5, scope: !153)
!159 = !MDLocation(line: 92, column: 13, scope: !157)
!160 = !MDLocation(line: 92, column: 20, scope: !157)
!161 = !MDLocation(line: 92, column: 12, scope: !157)
!162 = !MDLocation(line: 92, column: 7, scope: !157)
!163 = !MDLocation(line: 91, column: 62, scope: !157)
!164 = !MDLocation(line: 91, column: 69, scope: !157)
!165 = !MDLocation(line: 91, column: 12, scope: !153)
!166 = distinct !{!166, !108}
!167 = !MDLocation(line: 93, column: 5, scope: !154)
!168 = !MDLocation(line: 96, column: 12, scope: !154)
!169 = !MDLocation(line: 97, column: 9, scope: !170)
!170 = !{!"0xb\0097\009\0024", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgesl.c]
!171 = !MDLocation(line: 97, column: 9, scope: !154)
!172 = !MDLocation(line: 98, column: 12, scope: !154)
!173 = !MDLocation(line: 99, column: 5, scope: !154)
!174 = !MDLocation(line: 100, column: 5, scope: !154)
!175 = !MDLocation(line: 101, column: 3, scope: !154)
!176 = !MDLocation(line: 90, column: 26, scope: !148)
!177 = !MDLocation(line: 103, column: 1, scope: !4)
