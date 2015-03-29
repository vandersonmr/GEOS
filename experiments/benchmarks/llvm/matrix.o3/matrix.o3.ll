; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !17, metadata !74), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !18, metadata !74), !dbg !76
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !21, metadata !74), !dbg !77
  %conv = sext i32 %rows to i64, !dbg !78
  %mul = shl nsw i64 %conv, 3, !dbg !78
  %call = tail call noalias i8* @malloc(i64 %mul) #3, !dbg !79
  %0 = bitcast i8* %call to i32**, !dbg !80
  tail call void @llvm.dbg.value(metadata i32** %0, i64 0, metadata !22, metadata !74), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !74), !dbg !82
  %cmp29 = icmp sgt i32 %rows, 0, !dbg !83
  br i1 %cmp29, label %for.body.lr.ph, label %for.end16, !dbg !86

for.body.lr.ph:                                   ; preds = %entry
  %conv2 = sext i32 %cols to i64, !dbg !87
  %mul3 = shl nsw i64 %conv2, 2, !dbg !87
  %cmp626 = icmp sgt i32 %cols, 0, !dbg !89
  br i1 %cmp626, label %for.body.lr.ph.split.us, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge

for.body.lr.ph.for.body.lr.ph.split_crit_edge:    ; preds = %for.body.lr.ph
  %1 = add i32 %rows, -1, !dbg !86
  br label %for.inc14, !dbg !86

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %2 = add i32 %cols, -1, !dbg !86
  %3 = add i32 %rows, -1, !dbg !86
  %4 = zext i32 %2 to i64
  %5 = add nuw nsw i64 %4, 1, !dbg !86
  %6 = zext i32 %2 to i64
  %7 = add i64 %6, 1, !dbg !86
  %8 = lshr i64 %7, 3, !dbg !86
  %9 = mul i64 %8, 8, !dbg !86
  %10 = add i64 %9, -8, !dbg !86
  %11 = lshr i64 %10, 3, !dbg !86
  %12 = add i64 %11, 1, !dbg !86
  br label %for.body8.lr.ph.us, !dbg !86

for.inc14.us.loopexit.unr-lcssa:                  ; preds = %for.body8.us
  br label %for.inc14.us.loopexit

for.inc14.us.loopexit:                            ; preds = %for.body8.us.preheader.split, %for.inc14.us.loopexit.unr-lcssa
  br label %for.inc14.us

for.inc14.us:                                     ; preds = %for.inc14.us.loopexit, %middle.block
  %13 = add i32 %count.030.us, %cols, !dbg !92
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1, !dbg !86
  %lftr.wideiv38 = trunc i64 %indvars.iv36 to i32, !dbg !86
  %exitcond39 = icmp eq i32 %lftr.wideiv38, %3, !dbg !86
  br i1 %exitcond39, label %for.end16.loopexit, label %for.body8.lr.ph.us, !dbg !86

for.body8.us:                                     ; preds = %for.body8.us, %for.body8.us.preheader.split.split
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr, %for.body8.us.preheader.split.split ], [ %indvars.iv.next33.3, %for.body8.us ]
  %count.128.us = phi i32 [ %count.128.us.unr, %for.body8.us.preheader.split.split ], [ %inc.us.3, %for.body8.us ]
  %inc.us = add nsw i32 %count.128.us, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %inc.us, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.us = getelementptr inbounds i32* %15, i64 %indvars.iv32, !dbg !95
  store i32 %count.128.us, i32* %arrayidx12.us, align 4, !dbg !95, !tbaa !96
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !92
  %lftr.wideiv34 = trunc i64 %indvars.iv32 to i32, !dbg !92
  %inc.us.1 = add nsw i32 %inc.us, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %inc.us, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.us.1 = getelementptr inbounds i32* %15, i64 %indvars.iv.next33, !dbg !95
  store i32 %inc.us, i32* %arrayidx12.us.1, align 4, !dbg !95, !tbaa !96
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv.next33, 1, !dbg !92
  %lftr.wideiv34.1 = trunc i64 %indvars.iv.next33 to i32, !dbg !92
  %inc.us.2 = add nsw i32 %inc.us.1, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %inc.us, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.us.2 = getelementptr inbounds i32* %15, i64 %indvars.iv.next33.1, !dbg !95
  store i32 %inc.us.1, i32* %arrayidx12.us.2, align 4, !dbg !95, !tbaa !96
  %indvars.iv.next33.2 = add nuw nsw i64 %indvars.iv.next33.1, 1, !dbg !92
  %lftr.wideiv34.2 = trunc i64 %indvars.iv.next33.1 to i32, !dbg !92
  %inc.us.3 = add nsw i32 %inc.us.2, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %inc.us, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.us.3 = getelementptr inbounds i32* %15, i64 %indvars.iv.next33.2, !dbg !95
  store i32 %inc.us.2, i32* %arrayidx12.us.3, align 4, !dbg !95, !tbaa !96
  %indvars.iv.next33.3 = add nuw nsw i64 %indvars.iv.next33.2, 1, !dbg !92
  %lftr.wideiv34.3 = trunc i64 %indvars.iv.next33.2 to i32, !dbg !92
  %exitcond35.3 = icmp eq i32 %lftr.wideiv34.3, %2, !dbg !92
  br i1 %exitcond35.3, label %for.inc14.us.loopexit.unr-lcssa, label %for.body8.us, !dbg !92, !llvm.loop !100

for.body8.lr.ph.us:                               ; preds = %for.body.lr.ph.split.us, %for.inc14.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc14.us ], [ 0, %for.body.lr.ph.split.us ]
  %count.030.us = phi i32 [ %13, %for.inc14.us ], [ 1, %for.body.lr.ph.split.us ]
  %call4.us = tail call noalias i8* @malloc(i64 %mul3) #3, !dbg !103
  %arrayidx.us = getelementptr inbounds i32** %0, i64 %indvars.iv36, !dbg !104
  %14 = bitcast i32** %arrayidx.us to i8**, !dbg !104
  store i8* %call4.us, i8** %14, align 8, !dbg !104, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !74), !dbg !107
  %15 = bitcast i8* %call4.us to i32*
  %end.idx = add nuw nsw i64 %4, 1, !dbg !92
  %n.vec = and i64 %5, 8589934584, !dbg !92
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !92
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end = add i32 %cast.crd, %count.030.us
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body8.lr.ph.us
  %xtraiter = and i64 %12, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %12, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !92
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %16 = trunc i64 %index.prol to i32
  %offset.idx.prol = add i32 %count.030.us, %16
  %broadcast.splatinsert44.prol = insertelement <4 x i32> undef, i32 %offset.idx.prol, i32 0
  %broadcast.splat45.prol = shufflevector <4 x i32> %broadcast.splatinsert44.prol, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction46.prol = add <4 x i32> %broadcast.splat45.prol, <i32 0, i32 1, i32 2, i32 3>
  %induction47.prol = add <4 x i32> %broadcast.splat45.prol, <i32 4, i32 5, i32 6, i32 7>
  %17 = getelementptr inbounds i32* %15, i64 %index.prol, !dbg !95
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction46.prol, <4 x i32>* %18, align 4, !dbg !95, !tbaa !96
  %.sum54.prol = or i64 %index.prol, 4, !dbg !95
  %19 = getelementptr i32* %15, i64 %.sum54.prol, !dbg !95
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction47.prol, <4 x i32>* %20, align 4, !dbg !95, !tbaa !96
  %index.next.prol = add i64 %index.prol, 8, !dbg !92
  %21 = icmp eq i64 %index.next.prol, %n.vec, !dbg !92
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !92
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !92
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !108

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %22 = icmp ult i64 %12, 2
  br i1 %22, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !92
  %23 = trunc i64 %index to i32
  %offset.idx = add i32 %count.030.us, %23
  %broadcast.splatinsert44 = insertelement <4 x i32> undef, i32 %offset.idx, i32 0
  %broadcast.splat45 = shufflevector <4 x i32> %broadcast.splatinsert44, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction46 = add <4 x i32> %broadcast.splat45, <i32 0, i32 1, i32 2, i32 3>
  %induction47 = add <4 x i32> %broadcast.splat45, <i32 4, i32 5, i32 6, i32 7>
  %24 = getelementptr inbounds i32* %15, i64 %index, !dbg !95
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction46, <4 x i32>* %25, align 4, !dbg !95, !tbaa !96
  %.sum54 = or i64 %index, 4, !dbg !95
  %26 = getelementptr i32* %15, i64 %.sum54, !dbg !95
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction47, <4 x i32>* %27, align 4, !dbg !95, !tbaa !96
  %index.next = add i64 %index, 8, !dbg !92
  %28 = trunc i64 %index.next to i32
  %offset.idx.1 = add i32 %count.030.us, %28
  %broadcast.splatinsert44.1 = insertelement <4 x i32> undef, i32 %offset.idx.1, i32 0
  %broadcast.splat45.1 = shufflevector <4 x i32> %broadcast.splatinsert44.1, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction46.1 = add <4 x i32> %broadcast.splat45.1, <i32 0, i32 1, i32 2, i32 3>
  %induction47.1 = add <4 x i32> %broadcast.splat45.1, <i32 4, i32 5, i32 6, i32 7>
  %29 = getelementptr inbounds i32* %15, i64 %index.next, !dbg !95
  %30 = bitcast i32* %29 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction46.1, <4 x i32>* %30, align 4, !dbg !95, !tbaa !96
  %.sum54.1 = or i64 %index.next, 4, !dbg !95
  %31 = getelementptr i32* %15, i64 %.sum54.1, !dbg !95
  %32 = bitcast i32* %31 to <4 x i32>*, !dbg !95
  store <4 x i32> %induction47.1, <4 x i32>* %32, align 4, !dbg !95, !tbaa !96
  %index.next.1 = add i64 %index.next, 8, !dbg !92
  %33 = icmp eq i64 %index.next.1, %n.vec, !dbg !92
  br i1 %33, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !92, !llvm.loop !110

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body8.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body8.lr.ph.us ], [ %n.vec, %middle.block.loopexit ]
  %resume.val41 = phi i32 [ %count.030.us, %for.body8.lr.ph.us ], [ %ind.end, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.inc14.us, label %for.body8.us.preheader

for.body8.us.preheader:                           ; preds = %middle.block
  %34 = trunc i64 %resume.val to i32
  %35 = sub i32 %cols, %34
  %xtraiter56 = and i32 %35, 3
  %lcmp.mod57 = icmp ne i32 %xtraiter56, 0
  %lcmp.overflow58 = icmp eq i32 %35, 0
  %lcmp.or59 = or i1 %lcmp.overflow58, %lcmp.mod57
  br i1 %lcmp.or59, label %for.body8.us.prol.preheader, label %for.body8.us.preheader.split

for.body8.us.prol.preheader:                      ; preds = %for.body8.us.preheader
  br label %for.body8.us.prol, !dbg !93

for.body8.us.prol:                                ; preds = %for.body8.us.prol.preheader, %for.body8.us.prol
  %indvars.iv32.prol = phi i64 [ %indvars.iv.next33.prol, %for.body8.us.prol ], [ %resume.val, %for.body8.us.prol.preheader ]
  %count.128.us.prol = phi i32 [ %inc.us.prol, %for.body8.us.prol ], [ %resume.val41, %for.body8.us.prol.preheader ]
  %prol.iter60 = phi i32 [ %prol.iter60.sub, %for.body8.us.prol ], [ %xtraiter56, %for.body8.us.prol.preheader ]
  %inc.us.prol = add nsw i32 %count.128.us.prol, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata i32 %inc.us.prol, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.us.prol = getelementptr inbounds i32* %15, i64 %indvars.iv32.prol, !dbg !95
  store i32 %count.128.us.prol, i32* %arrayidx12.us.prol, align 4, !dbg !95, !tbaa !96
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.prol, 1, !dbg !92
  %lftr.wideiv34.prol = trunc i64 %indvars.iv32.prol to i32, !dbg !92
  %exitcond35.prol = icmp eq i32 %lftr.wideiv34.prol, %2, !dbg !92
  %prol.iter60.sub = sub i32 %prol.iter60, 1, !dbg !92
  %prol.iter60.cmp = icmp ne i32 %prol.iter60.sub, 0, !dbg !92
  br i1 %prol.iter60.cmp, label %for.body8.us.prol, label %for.body8.us.preheader.split.loopexit, !llvm.loop !111

for.body8.us.preheader.split.loopexit:            ; preds = %for.body8.us.prol
  %indvars.iv32.unr.ph = phi i64 [ %indvars.iv.next33.prol, %for.body8.us.prol ]
  %count.128.us.unr.ph = phi i32 [ %inc.us.prol, %for.body8.us.prol ]
  br label %for.body8.us.preheader.split

for.body8.us.preheader.split:                     ; preds = %for.body8.us.preheader.split.loopexit, %for.body8.us.preheader
  %indvars.iv32.unr = phi i64 [ %resume.val, %for.body8.us.preheader ], [ %indvars.iv32.unr.ph, %for.body8.us.preheader.split.loopexit ]
  %count.128.us.unr = phi i32 [ %resume.val41, %for.body8.us.preheader ], [ %count.128.us.unr.ph, %for.body8.us.preheader.split.loopexit ]
  %36 = icmp ult i32 %35, 4
  br i1 %36, label %for.inc14.us.loopexit, label %for.body8.us.preheader.split.split

for.body8.us.preheader.split.split:               ; preds = %for.body8.us.preheader.split
  br label %for.body8.us, !dbg !93

for.inc14:                                        ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge, %for.inc14
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %indvars.iv.next, %for.inc14 ]
  %call4 = tail call noalias i8* @malloc(i64 %mul3) #3, !dbg !103
  %arrayidx = getelementptr inbounds i32** %0, i64 %indvars.iv, !dbg !104
  %37 = bitcast i32** %arrayidx to i8**, !dbg !104
  store i8* %call4, i8** %37, align 8, !dbg !104, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !74), !dbg !107
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !86
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !86
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !86
  br i1 %exitcond, label %for.end16.loopexit55, label %for.inc14, !dbg !86

for.end16.loopexit:                               ; preds = %for.inc14.us
  br label %for.end16

for.end16.loopexit55:                             ; preds = %for.inc14
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit55, %for.end16.loopexit, %entry
  ret i32** %0, !dbg !112
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** nocapture readonly %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !27, metadata !74), !dbg !113
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !28, metadata !74), !dbg !114
  tail call void @llvm.dbg.value(metadata i32** %m, i64 0, metadata !29, metadata !74), !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !74), !dbg !116
  %cmp15 = icmp sgt i32 %rows, 0, !dbg !117
  %cmp213 = icmp sgt i32 %cols, 0, !dbg !120
  %or.cond = and i1 %cmp15, %cmp213, !dbg !123
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.split.us, label %for.end8, !dbg !123

for.cond1.preheader.lr.ph.split.us:               ; preds = %entry
  %0 = add i32 %cols, -1, !dbg !123
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 2, !dbg !123
  %3 = add nuw nsw i64 %2, 4, !dbg !123
  %4 = add i32 %rows, -1, !dbg !123
  %xtraiter = and i32 %rows, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %rows, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.inc6.us.prol, label %for.cond1.preheader.lr.ph.split.us.split

for.inc6.us.prol:                                 ; preds = %for.inc6.us.prol, %for.cond1.preheader.lr.ph.split.us
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc6.us.prol ], [ 0, %for.cond1.preheader.lr.ph.split.us ]
  %prol.iter = phi i32 [ %xtraiter, %for.cond1.preheader.lr.ph.split.us ], [ %prol.iter.sub, %for.inc6.us.prol ]
  %arrayidx.us.prol = getelementptr inbounds i32** %m, i64 %indvars.iv.prol, !dbg !124
  %5 = bitcast i32** %arrayidx.us.prol to i8**, !dbg !124
  %6 = load i8** %5, align 8, !dbg !124, !tbaa !105
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %3, i32 4, i1 false), !dbg !124
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !123
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !123
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %4, !dbg !123
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !123
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !123
  br i1 %prol.iter.cmp, label %for.inc6.us.prol, label %for.cond1.preheader.lr.ph.split.us.split, !llvm.loop !125

for.cond1.preheader.lr.ph.split.us.split:         ; preds = %for.inc6.us.prol, %for.cond1.preheader.lr.ph.split.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.lr.ph.split.us ], [ %indvars.iv.next.prol, %for.inc6.us.prol ]
  %7 = icmp ult i32 %rows, 4
  br i1 %7, label %for.end8.loopexit, label %for.cond1.preheader.lr.ph.split.us.split.split

for.cond1.preheader.lr.ph.split.us.split.split:   ; preds = %for.cond1.preheader.lr.ph.split.us.split
  br label %for.inc6.us, !dbg !123

for.inc6.us:                                      ; preds = %for.inc6.us, %for.cond1.preheader.lr.ph.split.us.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.cond1.preheader.lr.ph.split.us.split.split ], [ %indvars.iv.next.3, %for.inc6.us ]
  %arrayidx.us = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !124
  %8 = bitcast i32** %arrayidx.us to i8**, !dbg !124
  %9 = load i8** %8, align 8, !dbg !124, !tbaa !105
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %3, i32 4, i1 false), !dbg !124
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !123
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !123
  %arrayidx.us.1 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !124
  %10 = bitcast i32** %arrayidx.us.1 to i8**, !dbg !124
  %11 = load i8** %10, align 8, !dbg !124, !tbaa !105
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %3, i32 4, i1 false), !dbg !124
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !123
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !123
  %arrayidx.us.2 = getelementptr inbounds i32** %m, i64 %indvars.iv.next.1, !dbg !124
  %12 = bitcast i32** %arrayidx.us.2 to i8**, !dbg !124
  %13 = load i8** %12, align 8, !dbg !124, !tbaa !105
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 %3, i32 4, i1 false), !dbg !124
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !123
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !123
  %arrayidx.us.3 = getelementptr inbounds i32** %m, i64 %indvars.iv.next.2, !dbg !124
  %14 = bitcast i32** %arrayidx.us.3 to i8**, !dbg !124
  %15 = load i8** %14, align 8, !dbg !124, !tbaa !105
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %3, i32 4, i1 false), !dbg !124
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !123
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !123
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %4, !dbg !123
  br i1 %exitcond.3, label %for.end8.loopexit.unr-lcssa, label %for.inc6.us, !dbg !123

for.end8.loopexit.unr-lcssa:                      ; preds = %for.inc6.us
  br label %for.end8.loopexit

for.end8.loopexit:                                ; preds = %for.cond1.preheader.lr.ph.split.us.split, %for.end8.loopexit.unr-lcssa
  br label %for.end8

for.end8:                                         ; preds = %for.end8.loopexit, %entry
  ret void, !dbg !126
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !36, metadata !74), !dbg !127
  tail call void @llvm.dbg.value(metadata i32** %m, i64 0, metadata !37, metadata !74), !dbg !128
  %cmp4 = icmp sgt i32 %rows, 0, !dbg !129
  br i1 %cmp4, label %while.body.lr.ph, label %while.end, !dbg !132

while.body.lr.ph:                                 ; preds = %entry
  %0 = sext i32 %rows to i64
  br label %while.body, !dbg !132

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvars.iv = phi i64 [ %0, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !132
  %arrayidx = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !133
  %1 = bitcast i32** %arrayidx to i8**, !dbg !133
  %2 = load i8** %1, align 8, !dbg !133, !tbaa !105
  tail call void @free(i8* %2) #3, !dbg !135
  %cmp = icmp sgt i64 %indvars.iv, 1, !dbg !129
  br i1 %cmp, label %while.body, label %while.end.loopexit, !dbg !132

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %3 = bitcast i32** %m to i8*, !dbg !136
  tail call void @free(i8* %3) #3, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !42, metadata !74), !dbg !139
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !43, metadata !74), !dbg !140
  tail call void @llvm.dbg.value(metadata i32** %m1, i64 0, metadata !44, metadata !74), !dbg !141
  tail call void @llvm.dbg.value(metadata i32** %m2, i64 0, metadata !45, metadata !74), !dbg !142
  tail call void @llvm.dbg.value(metadata i32** %m3, i64 0, metadata !46, metadata !74), !dbg !143
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !74), !dbg !144
  %cmp40 = icmp sgt i32 %rows, 0, !dbg !145
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end22, !dbg !148

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp238 = icmp sgt i32 %cols, 0, !dbg !149
  %0 = add i32 %cols, -1, !dbg !148
  %1 = add i32 %rows, -1, !dbg !148
  %2 = zext i32 %0 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !148
  br label %for.cond1.preheader, !dbg !148

for.cond1.preheader:                              ; preds = %for.inc20, %for.cond1.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next47, %for.inc20 ]
  br i1 %cmp238, label %for.cond4.preheader.lr.ph.split.us, label %for.inc20, !dbg !153

for.cond4.preheader.lr.ph.split.us:               ; preds = %for.cond1.preheader
  %arrayidx15 = getelementptr inbounds i32** %m3, i64 %indvars.iv46, !dbg !154
  %4 = load i32** %arrayidx15, align 8, !dbg !154, !tbaa !105
  %arrayidx = getelementptr inbounds i32** %m1, i64 %indvars.iv46, !dbg !156
  br label %for.body6.lr.ph.us, !dbg !153

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body6.us
  %add.us.lcssa57.ph = phi i32 [ %add.us.1, %for.body6.us ]
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body6.us.preheader.split, %for.end.us.loopexit.unr-lcssa
  %add.us.lcssa57 = phi i32 [ %add.us.lcssa57.unr, %for.body6.us.preheader.split ], [ %add.us.lcssa57.ph, %for.end.us.loopexit.unr-lcssa ]
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %middle.block
  %add.us.lcssa = phi i32 [ %bin.rdx, %middle.block ], [ %add.us.lcssa57, %for.end.us.loopexit ]
  %arrayidx16.us = getelementptr inbounds i32* %4, i64 %indvars.iv42, !dbg !154
  store i32 %add.us.lcssa, i32* %arrayidx16.us, align 4, !dbg !154, !tbaa !96
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !153
  %lftr.wideiv44 = trunc i64 %indvars.iv42 to i32, !dbg !153
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %0, !dbg !153
  br i1 %exitcond45, label %for.inc20.loopexit, label %for.body6.lr.ph.us, !dbg !153

for.body6.us:                                     ; preds = %for.body6.us, %for.body6.us.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body6.us.preheader.split.split ], [ %indvars.iv.next.1, %for.body6.us ]
  %val.037.us = phi i32 [ %val.037.us.unr, %for.body6.us.preheader.split.split ], [ %add.us.1, %for.body6.us ]
  %arrayidx8.us = getelementptr inbounds i32* %11, i64 %indvars.iv, !dbg !156
  %5 = load i32* %arrayidx8.us, align 4, !dbg !156, !tbaa !96
  %arrayidx11.us = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !160
  %6 = load i32** %arrayidx11.us, align 8, !dbg !160, !tbaa !105
  %arrayidx12.us = getelementptr inbounds i32* %6, i64 %indvars.iv42, !dbg !160
  %7 = load i32* %arrayidx12.us, align 4, !dbg !160, !tbaa !96
  %mul.us = mul nsw i32 %7, %5, !dbg !156
  %add.us = add nsw i32 %mul.us, %val.037.us, !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %add.us, i64 0, metadata !50, metadata !74), !dbg !162
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !163
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !163
  %arrayidx8.us.1 = getelementptr inbounds i32* %11, i64 %indvars.iv.next, !dbg !156
  %8 = load i32* %arrayidx8.us.1, align 4, !dbg !156, !tbaa !96
  %arrayidx11.us.1 = getelementptr inbounds i32** %m2, i64 %indvars.iv.next, !dbg !160
  %9 = load i32** %arrayidx11.us.1, align 8, !dbg !160, !tbaa !105
  %arrayidx12.us.1 = getelementptr inbounds i32* %9, i64 %indvars.iv42, !dbg !160
  %10 = load i32* %arrayidx12.us.1, align 4, !dbg !160, !tbaa !96
  %mul.us.1 = mul nsw i32 %10, %8, !dbg !156
  %add.us.1 = add nsw i32 %mul.us.1, %add.us, !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %add.us, i64 0, metadata !50, metadata !74), !dbg !162
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !163
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !163
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !163
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body6.us, !dbg !163, !llvm.loop !164

for.body6.lr.ph.us:                               ; preds = %for.cond4.preheader.lr.ph.split.us, %for.end.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.end.us ], [ 0, %for.cond4.preheader.lr.ph.split.us ]
  %11 = load i32** %arrayidx, align 8, !dbg !156, !tbaa !105
  %end.idx = add nuw nsw i64 %2, 1, !dbg !163
  %n.vec = and i64 %3, 8589934590, !dbg !163
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !163
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body6.lr.ph.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !163
  %vec.phi = phi i32 [ %26, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi51 = phi i32 [ %27, %vector.body ], [ 0, %vector.body.preheader ]
  %induction5055 = or i64 %index, 1
  %12 = getelementptr inbounds i32* %11, i64 %index, !dbg !156
  %13 = getelementptr inbounds i32* %11, i64 %induction5055, !dbg !156
  %14 = load i32* %12, align 4, !dbg !156, !tbaa !96
  %15 = load i32* %13, align 4, !dbg !156, !tbaa !96
  %16 = getelementptr inbounds i32** %m2, i64 %index, !dbg !160
  %17 = getelementptr inbounds i32** %m2, i64 %induction5055, !dbg !160
  %18 = load i32** %16, align 8, !dbg !160, !tbaa !105
  %19 = load i32** %17, align 8, !dbg !160, !tbaa !105
  %20 = getelementptr inbounds i32* %18, i64 %indvars.iv42, !dbg !160
  %21 = getelementptr inbounds i32* %19, i64 %indvars.iv42, !dbg !160
  %22 = load i32* %20, align 4, !dbg !160, !tbaa !96
  %23 = load i32* %21, align 4, !dbg !160, !tbaa !96
  %24 = mul nsw i32 %22, %14, !dbg !156
  %25 = mul nsw i32 %23, %15, !dbg !156
  %26 = add nsw i32 %24, %vec.phi, !dbg !161
  %27 = add nsw i32 %25, %vec.phi51, !dbg !161
  %index.next = add i64 %index, 2, !dbg !163
  %28 = icmp eq i64 %index.next, %n.vec, !dbg !163
  br i1 %28, label %middle.block.loopexit, label %vector.body, !dbg !163, !llvm.loop !165

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa56 = phi i32 [ %27, %vector.body ]
  %.lcssa = phi i32 [ %26, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body6.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body6.lr.ph.us ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi i32 [ 0, %for.body6.lr.ph.us ], [ %.lcssa, %middle.block.loopexit ], !dbg !161
  %rdx.vec.exit.phi54 = phi i32 [ 0, %for.body6.lr.ph.us ], [ %.lcssa56, %middle.block.loopexit ], !dbg !161
  %bin.rdx = add i32 %rdx.vec.exit.phi54, %rdx.vec.exit.phi, !dbg !161
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end.us, label %for.body6.us.preheader

for.body6.us.preheader:                           ; preds = %middle.block
  %29 = trunc i64 %resume.val to i32
  %30 = sub i32 %cols, %29
  %xtraiter = and i32 %30, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %30, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.us.prol.preheader, label %for.body6.us.preheader.split

for.body6.us.prol.preheader:                      ; preds = %for.body6.us.preheader
  br label %for.body6.us.prol, !dbg !156

for.body6.us.prol:                                ; preds = %for.body6.us.prol.preheader, %for.body6.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body6.us.prol ], [ %resume.val, %for.body6.us.prol.preheader ]
  %val.037.us.prol = phi i32 [ %add.us.prol, %for.body6.us.prol ], [ %bin.rdx, %for.body6.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.us.prol ], [ %xtraiter, %for.body6.us.prol.preheader ]
  %arrayidx8.us.prol = getelementptr inbounds i32* %11, i64 %indvars.iv.prol, !dbg !156
  %31 = load i32* %arrayidx8.us.prol, align 4, !dbg !156, !tbaa !96
  %arrayidx11.us.prol = getelementptr inbounds i32** %m2, i64 %indvars.iv.prol, !dbg !160
  %32 = load i32** %arrayidx11.us.prol, align 8, !dbg !160, !tbaa !105
  %arrayidx12.us.prol = getelementptr inbounds i32* %32, i64 %indvars.iv42, !dbg !160
  %33 = load i32* %arrayidx12.us.prol, align 4, !dbg !160, !tbaa !96
  %mul.us.prol = mul nsw i32 %33, %31, !dbg !156
  %add.us.prol = add nsw i32 %mul.us.prol, %val.037.us.prol, !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %add.us.prol, i64 0, metadata !50, metadata !74), !dbg !162
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !163
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !163
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !163
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !163
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !163
  br i1 %prol.iter.cmp, label %for.body6.us.prol, label %for.body6.us.preheader.split.loopexit, !llvm.loop !166

for.body6.us.preheader.split.loopexit:            ; preds = %for.body6.us.prol
  %add.us.lcssa57.unr.ph = phi i32 [ %add.us.prol, %for.body6.us.prol ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body6.us.prol ]
  %val.037.us.unr.ph = phi i32 [ %add.us.prol, %for.body6.us.prol ]
  br label %for.body6.us.preheader.split

for.body6.us.preheader.split:                     ; preds = %for.body6.us.preheader.split.loopexit, %for.body6.us.preheader
  %add.us.lcssa57.unr = phi i32 [ 0, %for.body6.us.preheader ], [ %add.us.lcssa57.unr.ph, %for.body6.us.preheader.split.loopexit ]
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body6.us.preheader ], [ %indvars.iv.unr.ph, %for.body6.us.preheader.split.loopexit ]
  %val.037.us.unr = phi i32 [ %bin.rdx, %for.body6.us.preheader ], [ %val.037.us.unr.ph, %for.body6.us.preheader.split.loopexit ]
  %34 = icmp ult i32 %30, 2
  br i1 %34, label %for.end.us.loopexit, label %for.body6.us.preheader.split.split

for.body6.us.preheader.split.split:               ; preds = %for.body6.us.preheader.split
  br label %for.body6.us, !dbg !156

for.inc20.loopexit:                               ; preds = %for.end.us
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit, %for.cond1.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1, !dbg !148
  %lftr.wideiv48 = trunc i64 %indvars.iv46 to i32, !dbg !148
  %exitcond49 = icmp eq i32 %lftr.wideiv48, %1, !dbg !148
  br i1 %exitcond49, label %for.end22.loopexit, label %for.cond1.preheader, !dbg !148

for.end22.loopexit:                               ; preds = %for.inc20
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret i32** %m3, !dbg !167
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !55, metadata !74), !dbg !168
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !56, metadata !74), !dbg !169
  %cmp = icmp eq i32 %argc, 2, !dbg !170
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !171

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !172
  %0 = load i8** %arrayidx, align 8, !dbg !172, !tbaa !105
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !174, metadata !74) #3, !dbg !176
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !177
  %conv.i = trunc i64 %call.i to i32, !dbg !178
  br label %cond.end, !dbg !171

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 3000000, %entry ], !dbg !171
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !58, metadata !74), !dbg !179
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !180, metadata !74) #3, !dbg !182
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !183, metadata !74) #3, !dbg !184
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %call.i23 = tail call noalias i8* @malloc(i64 80) #3, !dbg !187
  %1 = bitcast i8* %call.i23 to i32**, !dbg !188
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !189, metadata !74) #3, !dbg !190
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !191, metadata !74) #3, !dbg !192
  br label %for.body8.lr.ph.us.i, !dbg !193

for.body8.lr.ph.us.i:                             ; preds = %for.body8.lr.ph.us.i, %cond.end
  %indvars.iv36.i = phi i64 [ %indvars.iv.next37.i, %for.body8.lr.ph.us.i ], [ 0, %cond.end ], !dbg !181
  %count.030.us.i = phi i32 [ %13, %for.body8.lr.ph.us.i ], [ 1, %cond.end ], !dbg !181
  %call4.us.i = tail call noalias i8* @malloc(i64 40) #3, !dbg !194
  %arrayidx.us.i = getelementptr inbounds i32** %1, i64 %indvars.iv36.i, !dbg !195
  %2 = bitcast i32** %arrayidx.us.i to i8**, !dbg !195
  store i8* %call4.us.i, i8** %2, align 8, !dbg !195, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !196, metadata !74) #3, !dbg !197
  %3 = bitcast i8* %call4.us.i to i32*, !dbg !181
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  store i32 %count.030.us.i, i32* %3, align 4, !dbg !198, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %arrayidx12.us.i.1 = getelementptr inbounds i8* %call4.us.i, i64 4, !dbg !198
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %4 = insertelement <4 x i32> undef, i32 %count.030.us.i, i32 0, !dbg !199
  %5 = insertelement <4 x i32> %4, i32 %count.030.us.i, i32 1, !dbg !199
  %6 = insertelement <4 x i32> %5, i32 %count.030.us.i, i32 2, !dbg !199
  %7 = insertelement <4 x i32> %6, i32 %count.030.us.i, i32 3, !dbg !199
  %8 = add nsw <4 x i32> %7, <i32 1, i32 2, i32 3, i32 4>, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %9 = bitcast i8* %arrayidx12.us.i.1 to <4 x i32>*, !dbg !198
  store <4 x i32> %8, <4 x i32>* %9, align 4, !dbg !198, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %arrayidx12.us.i.5 = getelementptr inbounds i8* %call4.us.i, i64 20, !dbg !198
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %10 = add nsw <4 x i32> %7, <i32 5, i32 6, i32 7, i32 8>, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %inc.us.i.8 = add nsw i32 %count.030.us.i, 9, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %11 = bitcast i8* %arrayidx12.us.i.5 to <4 x i32>*, !dbg !198
  store <4 x i32> %10, <4 x i32>* %11, align 4, !dbg !198, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !185, metadata !74) #3, !dbg !186
  %arrayidx12.us.i.9 = getelementptr inbounds i8* %call4.us.i, i64 36, !dbg !198
  %12 = bitcast i8* %arrayidx12.us.i.9 to i32*, !dbg !198
  store i32 %inc.us.i.8, i32* %12, align 4, !dbg !198, !tbaa !96
  %13 = add nuw nsw i32 %count.030.us.i, 10, !dbg !200
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1, !dbg !193
  %exitcond88 = icmp eq i64 %indvars.iv.next37.i, 10, !dbg !193
  br i1 %exitcond88, label %mkmatrix.exit, label %for.body8.lr.ph.us.i, !dbg !193

mkmatrix.exit:                                    ; preds = %for.body8.lr.ph.us.i
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !59, metadata !74), !dbg !201
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !202, metadata !74) #3, !dbg !204
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !205, metadata !74) #3, !dbg !206
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %call.i24 = tail call noalias i8* @malloc(i64 80) #3, !dbg !209
  %14 = bitcast i8* %call.i24 to i32**, !dbg !210
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !211, metadata !74) #3, !dbg !212
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !213, metadata !74) #3, !dbg !214
  br label %for.body8.lr.ph.us.i41, !dbg !215

for.body8.lr.ph.us.i41:                           ; preds = %for.body8.lr.ph.us.i41, %mkmatrix.exit
  %indvars.iv36.i37 = phi i64 [ %indvars.iv.next37.i25, %for.body8.lr.ph.us.i41 ], [ 0, %mkmatrix.exit ], !dbg !203
  %count.030.us.i38 = phi i32 [ %26, %for.body8.lr.ph.us.i41 ], [ 1, %mkmatrix.exit ], !dbg !203
  %call4.us.i39 = tail call noalias i8* @malloc(i64 40) #3, !dbg !216
  %arrayidx.us.i40 = getelementptr inbounds i32** %14, i64 %indvars.iv36.i37, !dbg !217
  %15 = bitcast i32** %arrayidx.us.i40 to i8**, !dbg !217
  store i8* %call4.us.i39, i8** %15, align 8, !dbg !217, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !218, metadata !74) #3, !dbg !219
  %16 = bitcast i8* %call4.us.i39 to i32*, !dbg !203
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  store i32 %count.030.us.i38, i32* %16, align 4, !dbg !220, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %arrayidx12.us.i32.1 = getelementptr inbounds i8* %call4.us.i39, i64 4, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %17 = insertelement <4 x i32> undef, i32 %count.030.us.i38, i32 0, !dbg !221
  %18 = insertelement <4 x i32> %17, i32 %count.030.us.i38, i32 1, !dbg !221
  %19 = insertelement <4 x i32> %18, i32 %count.030.us.i38, i32 2, !dbg !221
  %20 = insertelement <4 x i32> %19, i32 %count.030.us.i38, i32 3, !dbg !221
  %21 = add nsw <4 x i32> %20, <i32 1, i32 2, i32 3, i32 4>, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %22 = bitcast i8* %arrayidx12.us.i32.1 to <4 x i32>*, !dbg !220
  store <4 x i32> %21, <4 x i32>* %22, align 4, !dbg !220, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %arrayidx12.us.i32.5 = getelementptr inbounds i8* %call4.us.i39, i64 20, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %23 = add nsw <4 x i32> %20, <i32 5, i32 6, i32 7, i32 8>, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %inc.us.i31.8 = add nsw i32 %count.030.us.i38, 9, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %24 = bitcast i8* %arrayidx12.us.i32.5 to <4 x i32>*, !dbg !220
  store <4 x i32> %23, <4 x i32>* %24, align 4, !dbg !220, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !207, metadata !74) #3, !dbg !208
  %arrayidx12.us.i32.9 = getelementptr inbounds i8* %call4.us.i39, i64 36, !dbg !220
  %25 = bitcast i8* %arrayidx12.us.i32.9 to i32*, !dbg !220
  store i32 %inc.us.i31.8, i32* %25, align 4, !dbg !220, !tbaa !96
  %26 = add nuw nsw i32 %count.030.us.i38, 10, !dbg !222
  %indvars.iv.next37.i25 = add nuw nsw i64 %indvars.iv36.i37, 1, !dbg !215
  %exitcond86 = icmp eq i64 %indvars.iv.next37.i25, 10, !dbg !215
  br i1 %exitcond86, label %mkmatrix.exit42, label %for.body8.lr.ph.us.i41, !dbg !215

mkmatrix.exit42:                                  ; preds = %for.body8.lr.ph.us.i41
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !60, metadata !74), !dbg !223
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !224, metadata !74) #3, !dbg !226
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !227, metadata !74) #3, !dbg !228
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %call.i43 = tail call noalias i8* @malloc(i64 80) #3, !dbg !231
  %27 = bitcast i8* %call.i43 to i32**, !dbg !232
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !233, metadata !74) #3, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !235, metadata !74) #3, !dbg !236
  br label %for.body8.lr.ph.us.i60, !dbg !237

for.cond.preheader:                               ; preds = %for.body8.lr.ph.us.i60
  %cmp478 = icmp sgt i32 %cond, 0, !dbg !238
  br i1 %cmp478, label %for.cond1.preheader.i.preheader.lr.ph, label %for.cond.preheader.for.end_crit_edge, !dbg !241

for.cond.preheader.for.end_crit_edge:             ; preds = %for.cond.preheader
  %arrayidx.i68.pre = getelementptr inbounds i8* %call.i24, i64 72, !dbg !242
  %28 = bitcast i8* %arrayidx.i68.pre to i32**, !dbg !242
  %arrayidx.i68.1.pre = getelementptr inbounds i8* %call.i24, i64 64, !dbg !242
  %29 = bitcast i8* %arrayidx.i68.1.pre to i32**, !dbg !242
  %arrayidx.i68.2.pre = getelementptr inbounds i8* %call.i24, i64 56, !dbg !242
  %30 = bitcast i8* %arrayidx.i68.2.pre to i32**, !dbg !242
  %arrayidx.i68.3.pre = getelementptr inbounds i8* %call.i24, i64 48, !dbg !242
  %31 = bitcast i8* %arrayidx.i68.3.pre to i32**, !dbg !242
  %arrayidx.i68.4.pre = getelementptr inbounds i8* %call.i24, i64 40, !dbg !242
  %32 = bitcast i8* %arrayidx.i68.4.pre to i32**, !dbg !242
  %arrayidx.i68.5.pre = getelementptr inbounds i8* %call.i24, i64 32, !dbg !242
  %33 = bitcast i8* %arrayidx.i68.5.pre to i32**, !dbg !242
  %arrayidx.i68.6.pre = getelementptr inbounds i8* %call.i24, i64 24, !dbg !242
  %34 = bitcast i8* %arrayidx.i68.6.pre to i32**, !dbg !242
  %arrayidx.i68.7.pre = getelementptr inbounds i8* %call.i24, i64 16, !dbg !242
  %35 = bitcast i8* %arrayidx.i68.7.pre to i32**, !dbg !242
  %arrayidx.i68.8.pre = getelementptr inbounds i8* %call.i24, i64 8, !dbg !242
  %36 = bitcast i8* %arrayidx.i68.8.pre to i32**, !dbg !242
  br label %for.end, !dbg !241

for.cond1.preheader.i.preheader.lr.ph:            ; preds = %for.cond.preheader
  %37 = add i32 %cond, -1, !dbg !241
  br label %for.cond1.preheader.i.preheader, !dbg !241

for.body8.lr.ph.us.i60:                           ; preds = %for.body8.lr.ph.us.i60, %mkmatrix.exit42
  %indvars.iv36.i56 = phi i64 [ %indvars.iv.next37.i44, %for.body8.lr.ph.us.i60 ], [ 0, %mkmatrix.exit42 ], !dbg !225
  %count.030.us.i57 = phi i32 [ %49, %for.body8.lr.ph.us.i60 ], [ 1, %mkmatrix.exit42 ], !dbg !225
  %call4.us.i58 = tail call noalias i8* @malloc(i64 40) #3, !dbg !244
  %arrayidx.us.i59 = getelementptr inbounds i32** %27, i64 %indvars.iv36.i56, !dbg !245
  %38 = bitcast i32** %arrayidx.us.i59 to i8**, !dbg !245
  store i8* %call4.us.i58, i8** %38, align 8, !dbg !245, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !246, metadata !74) #3, !dbg !247
  %39 = bitcast i8* %call4.us.i58 to i32*, !dbg !225
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  store i32 %count.030.us.i57, i32* %39, align 4, !dbg !248, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %arrayidx12.us.i51.1 = getelementptr inbounds i8* %call4.us.i58, i64 4, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %40 = insertelement <4 x i32> undef, i32 %count.030.us.i57, i32 0, !dbg !249
  %41 = insertelement <4 x i32> %40, i32 %count.030.us.i57, i32 1, !dbg !249
  %42 = insertelement <4 x i32> %41, i32 %count.030.us.i57, i32 2, !dbg !249
  %43 = insertelement <4 x i32> %42, i32 %count.030.us.i57, i32 3, !dbg !249
  %44 = add nsw <4 x i32> %43, <i32 1, i32 2, i32 3, i32 4>, !dbg !249
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %45 = bitcast i8* %arrayidx12.us.i51.1 to <4 x i32>*, !dbg !248
  store <4 x i32> %44, <4 x i32>* %45, align 4, !dbg !248, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %arrayidx12.us.i51.5 = getelementptr inbounds i8* %call4.us.i58, i64 20, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %46 = add nsw <4 x i32> %43, <i32 5, i32 6, i32 7, i32 8>, !dbg !249
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %inc.us.i50.8 = add nsw i32 %count.030.us.i57, 9, !dbg !249
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %47 = bitcast i8* %arrayidx12.us.i51.5 to <4 x i32>*, !dbg !248
  store <4 x i32> %46, <4 x i32>* %47, align 4, !dbg !248, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !229, metadata !74) #3, !dbg !230
  %arrayidx12.us.i51.9 = getelementptr inbounds i8* %call4.us.i58, i64 36, !dbg !248
  %48 = bitcast i8* %arrayidx12.us.i51.9 to i32*, !dbg !248
  store i32 %inc.us.i50.8, i32* %48, align 4, !dbg !248, !tbaa !96
  %49 = add nuw nsw i32 %count.030.us.i57, 10, !dbg !250
  %indvars.iv.next37.i44 = add nuw nsw i64 %indvars.iv36.i56, 1, !dbg !237
  %exitcond84 = icmp eq i64 %indvars.iv.next37.i44, 10, !dbg !237
  br i1 %exitcond84, label %for.cond.preheader, label %for.body8.lr.ph.us.i60, !dbg !237

for.cond1.preheader.i.preheader:                  ; preds = %mmult.exit, %for.cond1.preheader.i.preheader.lr.ph
  %i.079 = phi i32 [ 0, %for.cond1.preheader.i.preheader.lr.ph ], [ %inc, %mmult.exit ]
  br label %for.cond1.preheader.i, !dbg !251

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc20.i
  %indvars.iv46.i = phi i64 [ %indvars.iv.next47.i, %for.inc20.i ], [ 0, %for.cond1.preheader.i.preheader ], !dbg !252
  %arrayidx15.i = getelementptr inbounds i32** %27, i64 %indvars.iv46.i, !dbg !251
  %50 = load i32** %arrayidx15.i, align 8, !dbg !251, !tbaa !105
  %arrayidx.i = getelementptr inbounds i32** %1, i64 %indvars.iv46.i, !dbg !254
  %51 = load i32** %arrayidx.i, align 8, !dbg !254, !tbaa !105
  %.pre = load i32** %14, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.1.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 8
  %52 = bitcast i8* %arrayidx11.us.i.1.phi.trans.insert to i32**
  %.pre89 = load i32** %52, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.2.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 16
  %53 = bitcast i8* %arrayidx11.us.i.2.phi.trans.insert to i32**
  %.pre90 = load i32** %53, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.3.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 24
  %54 = bitcast i8* %arrayidx11.us.i.3.phi.trans.insert to i32**
  %.pre91 = load i32** %54, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.4.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 32
  %55 = bitcast i8* %arrayidx11.us.i.4.phi.trans.insert to i32**
  %.pre92 = load i32** %55, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.5.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 40
  %56 = bitcast i8* %arrayidx11.us.i.5.phi.trans.insert to i32**
  %.pre93 = load i32** %56, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.6.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 48
  %57 = bitcast i8* %arrayidx11.us.i.6.phi.trans.insert to i32**
  %.pre94 = load i32** %57, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.7.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 56
  %58 = bitcast i8* %arrayidx11.us.i.7.phi.trans.insert to i32**
  %.pre95 = load i32** %58, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.8.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 64
  %59 = bitcast i8* %arrayidx11.us.i.8.phi.trans.insert to i32**
  %.pre96 = load i32** %59, align 8, !dbg !255, !tbaa !105
  %arrayidx11.us.i.9.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 72
  %60 = bitcast i8* %arrayidx11.us.i.9.phi.trans.insert to i32**
  %.pre97 = load i32** %60, align 8, !dbg !255, !tbaa !105
  br label %for.body6.lr.ph.us.i, !dbg !256

for.body6.lr.ph.us.i:                             ; preds = %for.body6.lr.ph.us.i, %for.cond1.preheader.i
  %indvars.iv42.i = phi i64 [ %indvars.iv.next43.i, %for.body6.lr.ph.us.i ], [ 0, %for.cond1.preheader.i ], !dbg !252
  %61 = load i32* %51, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62 = getelementptr inbounds i32* %.pre, i64 %indvars.iv42.i, !dbg !255
  %62 = load i32* %arrayidx12.us.i62, align 4, !dbg !255, !tbaa !96
  %mul.us.i = mul nsw i32 %62, %61, !dbg !254
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.1 = getelementptr inbounds i32* %51, i64 1, !dbg !254
  %63 = load i32* %arrayidx8.us.i.1, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.1 = getelementptr inbounds i32* %.pre89, i64 %indvars.iv42.i, !dbg !255
  %64 = load i32* %arrayidx12.us.i62.1, align 4, !dbg !255, !tbaa !96
  %mul.us.i.1 = mul nsw i32 %64, %63, !dbg !254
  %add.us.i.1 = add nsw i32 %mul.us.i.1, %mul.us.i, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.2 = getelementptr inbounds i32* %51, i64 2, !dbg !254
  %65 = load i32* %arrayidx8.us.i.2, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.2 = getelementptr inbounds i32* %.pre90, i64 %indvars.iv42.i, !dbg !255
  %66 = load i32* %arrayidx12.us.i62.2, align 4, !dbg !255, !tbaa !96
  %mul.us.i.2 = mul nsw i32 %66, %65, !dbg !254
  %add.us.i.2 = add nsw i32 %mul.us.i.2, %add.us.i.1, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.3 = getelementptr inbounds i32* %51, i64 3, !dbg !254
  %67 = load i32* %arrayidx8.us.i.3, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.3 = getelementptr inbounds i32* %.pre91, i64 %indvars.iv42.i, !dbg !255
  %68 = load i32* %arrayidx12.us.i62.3, align 4, !dbg !255, !tbaa !96
  %mul.us.i.3 = mul nsw i32 %68, %67, !dbg !254
  %add.us.i.3 = add nsw i32 %mul.us.i.3, %add.us.i.2, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.4 = getelementptr inbounds i32* %51, i64 4, !dbg !254
  %69 = load i32* %arrayidx8.us.i.4, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.4 = getelementptr inbounds i32* %.pre92, i64 %indvars.iv42.i, !dbg !255
  %70 = load i32* %arrayidx12.us.i62.4, align 4, !dbg !255, !tbaa !96
  %mul.us.i.4 = mul nsw i32 %70, %69, !dbg !254
  %add.us.i.4 = add nsw i32 %mul.us.i.4, %add.us.i.3, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.5 = getelementptr inbounds i32* %51, i64 5, !dbg !254
  %71 = load i32* %arrayidx8.us.i.5, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.5 = getelementptr inbounds i32* %.pre93, i64 %indvars.iv42.i, !dbg !255
  %72 = load i32* %arrayidx12.us.i62.5, align 4, !dbg !255, !tbaa !96
  %mul.us.i.5 = mul nsw i32 %72, %71, !dbg !254
  %add.us.i.5 = add nsw i32 %mul.us.i.5, %add.us.i.4, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.6 = getelementptr inbounds i32* %51, i64 6, !dbg !254
  %73 = load i32* %arrayidx8.us.i.6, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.6 = getelementptr inbounds i32* %.pre94, i64 %indvars.iv42.i, !dbg !255
  %74 = load i32* %arrayidx12.us.i62.6, align 4, !dbg !255, !tbaa !96
  %mul.us.i.6 = mul nsw i32 %74, %73, !dbg !254
  %add.us.i.6 = add nsw i32 %mul.us.i.6, %add.us.i.5, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.7 = getelementptr inbounds i32* %51, i64 7, !dbg !254
  %75 = load i32* %arrayidx8.us.i.7, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.7 = getelementptr inbounds i32* %.pre95, i64 %indvars.iv42.i, !dbg !255
  %76 = load i32* %arrayidx12.us.i62.7, align 4, !dbg !255, !tbaa !96
  %mul.us.i.7 = mul nsw i32 %76, %75, !dbg !254
  %add.us.i.7 = add nsw i32 %mul.us.i.7, %add.us.i.6, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.8 = getelementptr inbounds i32* %51, i64 8, !dbg !254
  %77 = load i32* %arrayidx8.us.i.8, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.8 = getelementptr inbounds i32* %.pre96, i64 %indvars.iv42.i, !dbg !255
  %78 = load i32* %arrayidx12.us.i62.8, align 4, !dbg !255, !tbaa !96
  %mul.us.i.8 = mul nsw i32 %78, %77, !dbg !254
  %add.us.i.8 = add nsw i32 %mul.us.i.8, %add.us.i.7, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx8.us.i.9 = getelementptr inbounds i32* %51, i64 9, !dbg !254
  %79 = load i32* %arrayidx8.us.i.9, align 4, !dbg !254, !tbaa !96
  %arrayidx12.us.i62.9 = getelementptr inbounds i32* %.pre97, i64 %indvars.iv42.i, !dbg !255
  %80 = load i32* %arrayidx12.us.i62.9, align 4, !dbg !255, !tbaa !96
  %mul.us.i.9 = mul nsw i32 %80, %79, !dbg !254
  %add.us.i.9 = add nsw i32 %mul.us.i.9, %add.us.i.8, !dbg !259
  tail call void @llvm.dbg.value(metadata i32 %mul.us.i, i64 0, metadata !257, metadata !74), !dbg !258
  %arrayidx16.us.i = getelementptr inbounds i32* %50, i64 %indvars.iv42.i, !dbg !251
  store i32 %add.us.i.9, i32* %arrayidx16.us.i, align 4, !dbg !251, !tbaa !96
  %indvars.iv.next43.i = add nuw nsw i64 %indvars.iv42.i, 1, !dbg !256
  %exitcond80 = icmp eq i64 %indvars.iv.next43.i, 10, !dbg !256
  br i1 %exitcond80, label %for.inc20.i, label %for.body6.lr.ph.us.i, !dbg !256

for.inc20.i:                                      ; preds = %for.body6.lr.ph.us.i
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1, !dbg !260
  %exitcond81 = icmp eq i64 %indvars.iv.next47.i, 10, !dbg !260
  br i1 %exitcond81, label %mmult.exit, label %for.cond1.preheader.i, !dbg !260

mmult.exit:                                       ; preds = %for.inc20.i
  %.lcssa113 = phi i32** [ %60, %for.inc20.i ]
  %.lcssa112 = phi i32** [ %59, %for.inc20.i ]
  %.lcssa111 = phi i32** [ %58, %for.inc20.i ]
  %.lcssa110 = phi i32** [ %57, %for.inc20.i ]
  %.lcssa109 = phi i32** [ %56, %for.inc20.i ]
  %.lcssa108 = phi i32** [ %55, %for.inc20.i ]
  %.lcssa107 = phi i32** [ %54, %for.inc20.i ]
  %.lcssa106 = phi i32** [ %53, %for.inc20.i ]
  %.lcssa = phi i32** [ %52, %for.inc20.i ]
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !61, metadata !74), !dbg !261
  %inc = add nuw nsw i32 %i.079, 1, !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !74), !dbg !263
  %exitcond82 = icmp eq i32 %i.079, %37, !dbg !241
  br i1 %exitcond82, label %for.end.loopexit, label %for.cond1.preheader.i.preheader, !dbg !241

for.end.loopexit:                                 ; preds = %mmult.exit
  %.lcssa113.lcssa = phi i32** [ %.lcssa113, %mmult.exit ]
  %.lcssa112.lcssa = phi i32** [ %.lcssa112, %mmult.exit ]
  %.lcssa111.lcssa = phi i32** [ %.lcssa111, %mmult.exit ]
  %.lcssa110.lcssa = phi i32** [ %.lcssa110, %mmult.exit ]
  %.lcssa109.lcssa = phi i32** [ %.lcssa109, %mmult.exit ]
  %.lcssa108.lcssa = phi i32** [ %.lcssa108, %mmult.exit ]
  %.lcssa107.lcssa = phi i32** [ %.lcssa107, %mmult.exit ]
  %.lcssa106.lcssa = phi i32** [ %.lcssa106, %mmult.exit ]
  %.lcssa.lcssa = phi i32** [ %.lcssa, %mmult.exit ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader.for.end_crit_edge
  %arrayidx.i68.8.pre-phi = phi i32** [ %36, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.7.pre-phi = phi i32** [ %35, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa106.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.6.pre-phi = phi i32** [ %34, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa107.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.5.pre-phi = phi i32** [ %33, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa108.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.4.pre-phi = phi i32** [ %32, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa109.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.3.pre-phi = phi i32** [ %31, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa110.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.2.pre-phi = phi i32** [ %30, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa111.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.1.pre-phi = phi i32** [ %29, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa112.lcssa, %for.end.loopexit ], !dbg !242
  %arrayidx.i68.pre-phi = phi i32** [ %28, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa113.lcssa, %for.end.loopexit ], !dbg !242
  %81 = load i32** %27, align 8, !dbg !264, !tbaa !105
  %82 = load i32* %81, align 4, !dbg !264, !tbaa !96
  %arrayidx8 = getelementptr inbounds i8* %call.i43, i64 16, !dbg !265
  %83 = bitcast i8* %arrayidx8 to i32**, !dbg !265
  %84 = load i32** %83, align 8, !dbg !265, !tbaa !105
  %arrayidx9 = getelementptr inbounds i32* %84, i64 3, !dbg !265
  %85 = load i32* %arrayidx9, align 4, !dbg !265, !tbaa !96
  %arrayidx10 = getelementptr inbounds i8* %call.i43, i64 24, !dbg !266
  %86 = bitcast i8* %arrayidx10 to i32**, !dbg !266
  %87 = load i32** %86, align 8, !dbg !266, !tbaa !105
  %arrayidx11 = getelementptr inbounds i32* %87, i64 2, !dbg !266
  %88 = load i32* %arrayidx11, align 4, !dbg !266, !tbaa !96
  %arrayidx12 = getelementptr inbounds i8* %call.i43, i64 32, !dbg !267
  %89 = bitcast i8* %arrayidx12 to i32**, !dbg !267
  %90 = load i32** %89, align 8, !dbg !267, !tbaa !105
  %arrayidx13 = getelementptr inbounds i32* %90, i64 4, !dbg !267
  %91 = load i32* %arrayidx13, align 4, !dbg !267, !tbaa !96
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %82, i32 %85, i32 %88, i32 %91) #3, !dbg !268
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !269, metadata !74) #3, !dbg !271
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !272, metadata !74) #3, !dbg !273
  %arrayidx.i65 = getelementptr inbounds i8* %call.i23, i64 72, !dbg !274
  %92 = bitcast i8* %arrayidx.i65 to i8**, !dbg !274
  %93 = load i8** %92, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %93) #3, !dbg !275
  %arrayidx.i65.1 = getelementptr inbounds i8* %call.i23, i64 64, !dbg !274
  %94 = bitcast i8* %arrayidx.i65.1 to i8**, !dbg !274
  %95 = load i8** %94, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %95) #3, !dbg !275
  %arrayidx.i65.2 = getelementptr inbounds i8* %call.i23, i64 56, !dbg !274
  %96 = bitcast i8* %arrayidx.i65.2 to i8**, !dbg !274
  %97 = load i8** %96, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %97) #3, !dbg !275
  %arrayidx.i65.3 = getelementptr inbounds i8* %call.i23, i64 48, !dbg !274
  %98 = bitcast i8* %arrayidx.i65.3 to i8**, !dbg !274
  %99 = load i8** %98, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %99) #3, !dbg !275
  %arrayidx.i65.4 = getelementptr inbounds i8* %call.i23, i64 40, !dbg !274
  %100 = bitcast i8* %arrayidx.i65.4 to i8**, !dbg !274
  %101 = load i8** %100, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %101) #3, !dbg !275
  %arrayidx.i65.5 = getelementptr inbounds i8* %call.i23, i64 32, !dbg !274
  %102 = bitcast i8* %arrayidx.i65.5 to i8**, !dbg !274
  %103 = load i8** %102, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %103) #3, !dbg !275
  %arrayidx.i65.6 = getelementptr inbounds i8* %call.i23, i64 24, !dbg !274
  %104 = bitcast i8* %arrayidx.i65.6 to i8**, !dbg !274
  %105 = load i8** %104, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %105) #3, !dbg !275
  %arrayidx.i65.7 = getelementptr inbounds i8* %call.i23, i64 16, !dbg !274
  %106 = bitcast i8* %arrayidx.i65.7 to i8**, !dbg !274
  %107 = load i8** %106, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %107) #3, !dbg !275
  %arrayidx.i65.8 = getelementptr inbounds i8* %call.i23, i64 8, !dbg !274
  %108 = bitcast i8* %arrayidx.i65.8 to i8**, !dbg !274
  %109 = load i8** %108, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %109) #3, !dbg !275
  %110 = bitcast i8* %call.i23 to i8**, !dbg !274
  %111 = load i8** %110, align 8, !dbg !274, !tbaa !105
  tail call void @free(i8* %111) #3, !dbg !275
  tail call void @free(i8* %call.i23) #3, !dbg !276
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !277, metadata !74) #3, !dbg !278
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !279, metadata !74) #3, !dbg !280
  %112 = bitcast i32** %arrayidx.i68.pre-phi to i8**, !dbg !242
  %113 = load i8** %112, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %113) #3, !dbg !281
  %114 = bitcast i32** %arrayidx.i68.1.pre-phi to i8**, !dbg !242
  %115 = load i8** %114, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %115) #3, !dbg !281
  %116 = bitcast i32** %arrayidx.i68.2.pre-phi to i8**, !dbg !242
  %117 = load i8** %116, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %117) #3, !dbg !281
  %118 = bitcast i32** %arrayidx.i68.3.pre-phi to i8**, !dbg !242
  %119 = load i8** %118, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %119) #3, !dbg !281
  %120 = bitcast i32** %arrayidx.i68.4.pre-phi to i8**, !dbg !242
  %121 = load i8** %120, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %121) #3, !dbg !281
  %122 = bitcast i32** %arrayidx.i68.5.pre-phi to i8**, !dbg !242
  %123 = load i8** %122, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %123) #3, !dbg !281
  %124 = bitcast i32** %arrayidx.i68.6.pre-phi to i8**, !dbg !242
  %125 = load i8** %124, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %125) #3, !dbg !281
  %126 = bitcast i32** %arrayidx.i68.7.pre-phi to i8**, !dbg !242
  %127 = load i8** %126, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %127) #3, !dbg !281
  %128 = bitcast i32** %arrayidx.i68.8.pre-phi to i8**, !dbg !242
  %129 = load i8** %128, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %129) #3, !dbg !281
  %130 = bitcast i8* %call.i24 to i8**, !dbg !242
  %131 = load i8** %130, align 8, !dbg !242, !tbaa !105
  tail call void @free(i8* %131) #3, !dbg !281
  tail call void @free(i8* %call.i24) #3, !dbg !282
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !283, metadata !74) #3, !dbg !285
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !286, metadata !74) #3, !dbg !287
  %arrayidx.i74 = getelementptr inbounds i8* %call.i43, i64 72, !dbg !288
  %132 = bitcast i8* %arrayidx.i74 to i8**, !dbg !288
  %133 = load i8** %132, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %133) #3, !dbg !289
  %arrayidx.i74.1 = getelementptr inbounds i8* %call.i43, i64 64, !dbg !288
  %134 = bitcast i8* %arrayidx.i74.1 to i8**, !dbg !288
  %135 = load i8** %134, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %135) #3, !dbg !289
  %arrayidx.i74.2 = getelementptr inbounds i8* %call.i43, i64 56, !dbg !288
  %136 = bitcast i8* %arrayidx.i74.2 to i8**, !dbg !288
  %137 = load i8** %136, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %137) #3, !dbg !289
  %arrayidx.i74.3 = getelementptr inbounds i8* %call.i43, i64 48, !dbg !288
  %138 = bitcast i8* %arrayidx.i74.3 to i8**, !dbg !288
  %139 = load i8** %138, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %139) #3, !dbg !289
  %arrayidx.i74.4 = getelementptr inbounds i8* %call.i43, i64 40, !dbg !288
  %140 = bitcast i8* %arrayidx.i74.4 to i8**, !dbg !288
  %141 = load i8** %140, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %141) #3, !dbg !289
  %arrayidx.i74.5 = getelementptr inbounds i8* %call.i43, i64 32, !dbg !288
  %142 = bitcast i8* %arrayidx.i74.5 to i8**, !dbg !288
  %143 = load i8** %142, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %143) #3, !dbg !289
  %arrayidx.i74.6 = getelementptr inbounds i8* %call.i43, i64 24, !dbg !288
  %144 = bitcast i8* %arrayidx.i74.6 to i8**, !dbg !288
  %145 = load i8** %144, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %145) #3, !dbg !289
  %arrayidx.i74.7 = getelementptr inbounds i8* %call.i43, i64 16, !dbg !288
  %146 = bitcast i8* %arrayidx.i74.7 to i8**, !dbg !288
  %147 = load i8** %146, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %147) #3, !dbg !289
  %arrayidx.i74.8 = getelementptr inbounds i8* %call.i43, i64 8, !dbg !288
  %148 = bitcast i8* %arrayidx.i74.8 to i8**, !dbg !288
  %149 = load i8** %148, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %149) #3, !dbg !289
  %150 = bitcast i8* %call.i43 to i8**, !dbg !288
  %151 = load i8** %150, align 8, !dbg !288, !tbaa !105
  tail call void @free(i8* %151) #3, !dbg !289
  tail call void @free(i8* %call.i43) #3, !dbg !290
  ret i32 0, !dbg !291
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!71, !72}
!llvm.ident = !{!73}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !11, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = !{!"matrix.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6, !7, !10}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!9 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!12, !23, !32, !38, !51, !62}
!12 = !{!"0x2e\00mkmatrix\00mkmatrix\00\0012\000\001\000\000\00256\001\0012", !1, !13, !14, null, i32** (i32, i32)* @mkmatrix, null, null, !16} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!13 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!4, !6, !6}
!16 = !{!17, !18, !19, !20, !21, !22}
!17 = !{!"0x101\00rows\0016777228\000", !12, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!18 = !{!"0x101\00cols\0033554444\000", !12, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!19 = !{!"0x100\00i\0013\000", !12, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 13]
!20 = !{!"0x100\00j\0013\000", !12, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 13]
!21 = !{!"0x100\00count\0013\000", !12, !13, !6}  ; [ DW_TAG_auto_variable ] [count] [line 13]
!22 = !{!"0x100\00m\0014\000", !12, !13, !4}      ; [ DW_TAG_auto_variable ] [m] [line 14]
!23 = !{!"0x2e\00zeromatrix\00zeromatrix\00\0024\000\001\000\000\00256\001\0024", !1, !13, !24, null, void (i32, i32, i32**)* @zeromatrix, null, null, !26} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{null, !6, !6, !4}
!26 = !{!27, !28, !29, !30, !31}
!27 = !{!"0x101\00rows\0016777240\000", !23, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!28 = !{!"0x101\00cols\0033554456\000", !23, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!29 = !{!"0x101\00m\0050331672\000", !23, !13, !4} ; [ DW_TAG_arg_variable ] [m] [line 24]
!30 = !{!"0x100\00i\0025\000", !23, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 25]
!31 = !{!"0x100\00j\0025\000", !23, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 25]
!32 = !{!"0x2e\00freematrix\00freematrix\00\0031\000\001\000\000\00256\001\0031", !1, !13, !33, null, void (i32, i32**)* @freematrix, null, null, !35} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{null, !6, !4}
!35 = !{!36, !37}
!36 = !{!"0x101\00rows\0016777247\000", !32, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!37 = !{!"0x101\00m\0033554463\000", !32, !13, !4} ; [ DW_TAG_arg_variable ] [m] [line 31]
!38 = !{!"0x2e\00mmult\00mmult\00\0036\000\001\000\000\00256\001\0036", !1, !13, !39, null, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, !41} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!4, !6, !6, !4, !4, !4}
!41 = !{!42, !43, !44, !45, !46, !47, !48, !49, !50}
!42 = !{!"0x101\00rows\0016777252\000", !38, !13, !6} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!43 = !{!"0x101\00cols\0033554468\000", !38, !13, !6} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!44 = !{!"0x101\00m1\0050331684\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!45 = !{!"0x101\00m2\0067108900\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!46 = !{!"0x101\00m3\0083886116\000", !38, !13, !4} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!47 = !{!"0x100\00i\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 37]
!48 = !{!"0x100\00j\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [j] [line 37]
!49 = !{!"0x100\00k\0037\000", !38, !13, !6}      ; [ DW_TAG_auto_variable ] [k] [line 37]
!50 = !{!"0x100\00val\0037\000", !38, !13, !6}    ; [ DW_TAG_auto_variable ] [val] [line 37]
!51 = !{!"0x2e\00main\00main\00\0050\000\001\000\000\00256\001\0050", !1, !13, !52, null, i32 (i32, i8**)* @main, null, null, !54} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!52 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !53, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = !{!6, !6, !7}
!54 = !{!55, !56, !57, !58, !59, !60, !61}
!55 = !{!"0x101\00argc\0016777266\000", !51, !13, !6} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!56 = !{!"0x101\00argv\0033554482\000", !51, !13, !7} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!57 = !{!"0x100\00i\0056\000", !51, !13, !6}      ; [ DW_TAG_auto_variable ] [i] [line 56]
!58 = !{!"0x100\00n\0056\000", !51, !13, !6}      ; [ DW_TAG_auto_variable ] [n] [line 56]
!59 = !{!"0x100\00m1\0058\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [m1] [line 58]
!60 = !{!"0x100\00m2\0059\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [m2] [line 59]
!61 = !{!"0x100\00mm\0060\000", !51, !13, !4}     ; [ DW_TAG_auto_variable ] [mm] [line 60]
!62 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !63, !64, !65, null, null, null, null, !69} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!63 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!64 = !{!"0x29", !63}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{!6, !67}
!67 = !{!"0xf\00\000\0064\0064\000\000", null, null, !68} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = !{!"0x26\00\000\000\000\000\000", null, null, !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!69 = !{!70}
!70 = !{!"0x101\00__nptr\0016777494\000", !62, !64, !67} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!71 = !{i32 2, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 2}
!73 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!74 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!75 = !MDLocation(line: 12, column: 20, scope: !12)
!76 = !MDLocation(line: 12, column: 30, scope: !12)
!77 = !MDLocation(line: 13, column: 15, scope: !12)
!78 = !MDLocation(line: 14, column: 31, scope: !12)
!79 = !MDLocation(line: 14, column: 24, scope: !12)
!80 = !MDLocation(line: 14, column: 15, scope: !12)
!81 = !MDLocation(line: 14, column: 11, scope: !12)
!82 = !MDLocation(line: 13, column: 9, scope: !12)
!83 = !MDLocation(line: 15, column: 15, scope: !84)
!84 = !{!"0xb\0015\005\001", !1, !85}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!85 = !{!"0xb\0015\005\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!86 = !MDLocation(line: 15, column: 5, scope: !85)
!87 = !MDLocation(line: 16, column: 24, scope: !88)
!88 = !{!"0xb\0015\0028\002", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!89 = !MDLocation(line: 17, column: 12, scope: !90)
!90 = !{!"0xb\0017\002\004", !1, !91}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!91 = !{!"0xb\0017\002\003", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!92 = !MDLocation(line: 17, column: 2, scope: !91)
!93 = !MDLocation(line: 18, column: 16, scope: !94)
!94 = !{!"0xb\0017\0025\005", !1, !90}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!95 = !MDLocation(line: 18, column: 6, scope: !94)
!96 = !{!97, !97, i64 0}
!97 = !{!"int", !98, i64 0}
!98 = !{!"omnipotent char", !99, i64 0}
!99 = !{!"Simple C/C++ TBAA"}
!100 = distinct !{!100, !101, !102}
!101 = !{!"llvm.loop.vectorize.width", i32 1}
!102 = !{!"llvm.loop.interleave.count", i32 1}
!103 = !MDLocation(line: 16, column: 17, scope: !88)
!104 = !MDLocation(line: 16, column: 2, scope: !88)
!105 = !{!106, !106, i64 0}
!106 = !{!"any pointer", !98, i64 0}
!107 = !MDLocation(line: 13, column: 12, scope: !12)
!108 = distinct !{!108, !109}
!109 = !{!"llvm.loop.unroll.disable"}
!110 = distinct !{!110, !101, !102}
!111 = distinct !{!111, !109}
!112 = !MDLocation(line: 21, column: 5, scope: !12)
!113 = !MDLocation(line: 24, column: 21, scope: !23)
!114 = !MDLocation(line: 24, column: 31, scope: !23)
!115 = !MDLocation(line: 24, column: 43, scope: !23)
!116 = !MDLocation(line: 25, column: 9, scope: !23)
!117 = !MDLocation(line: 26, column: 15, scope: !118)
!118 = !{!"0xb\0026\005\007", !1, !119}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!119 = !{!"0xb\0026\005\006", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!120 = !MDLocation(line: 27, column: 12, scope: !121)
!121 = !{!"0xb\0027\002\009", !1, !122}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!122 = !{!"0xb\0027\002\008", !1, !118}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!123 = !MDLocation(line: 26, column: 5, scope: !119)
!124 = !MDLocation(line: 28, column: 6, scope: !121)
!125 = distinct !{!125, !109}
!126 = !MDLocation(line: 29, column: 1, scope: !23)
!127 = !MDLocation(line: 31, column: 21, scope: !32)
!128 = !MDLocation(line: 31, column: 33, scope: !32)
!129 = !MDLocation(line: 32, column: 12, scope: !130)
!130 = !{!"0xb\003", !1, !131}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!131 = !{!"0xb\001", !1, !32}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!132 = !MDLocation(line: 32, column: 5, scope: !32)
!133 = !MDLocation(line: 32, column: 32, scope: !134)
!134 = !{!"0xb\0032\0025\0010", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!135 = !MDLocation(line: 32, column: 27, scope: !134)
!136 = !MDLocation(line: 33, column: 10, scope: !32)
!137 = !MDLocation(line: 33, column: 5, scope: !32)
!138 = !MDLocation(line: 34, column: 1, scope: !32)
!139 = !MDLocation(line: 36, column: 17, scope: !38)
!140 = !MDLocation(line: 36, column: 27, scope: !38)
!141 = !MDLocation(line: 36, column: 39, scope: !38)
!142 = !MDLocation(line: 36, column: 49, scope: !38)
!143 = !MDLocation(line: 36, column: 59, scope: !38)
!144 = !MDLocation(line: 37, column: 9, scope: !38)
!145 = !MDLocation(line: 38, column: 15, scope: !146)
!146 = !{!"0xb\0038\005\0012", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!147 = !{!"0xb\0038\005\0011", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!148 = !MDLocation(line: 38, column: 5, scope: !147)
!149 = !MDLocation(line: 39, column: 12, scope: !150)
!150 = !{!"0xb\0039\002\0015", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!151 = !{!"0xb\0039\002\0014", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!152 = !{!"0xb\0038\0028\0013", !1, !146}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!153 = !MDLocation(line: 39, column: 2, scope: !151)
!154 = !MDLocation(line: 44, column: 6, scope: !155)
!155 = !{!"0xb\0039\0025\0016", !1, !150}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!156 = !MDLocation(line: 42, column: 10, scope: !157)
!157 = !{!"0xb\0041\0029\0019", !1, !158}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!158 = !{!"0xb\0041\006\0018", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!159 = !{!"0xb\0041\006\0017", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!160 = !MDLocation(line: 42, column: 21, scope: !157)
!161 = !MDLocation(line: 42, column: 3, scope: !157)
!162 = !MDLocation(line: 37, column: 18, scope: !38)
!163 = !MDLocation(line: 41, column: 6, scope: !159)
!164 = distinct !{!164, !101, !102}
!165 = distinct !{!165, !101, !102}
!166 = distinct !{!166, !109}
!167 = !MDLocation(line: 47, column: 5, scope: !38)
!168 = !MDLocation(line: 50, column: 14, scope: !51)
!169 = !MDLocation(line: 50, column: 26, scope: !51)
!170 = !MDLocation(line: 56, column: 18, scope: !51)
!171 = !MDLocation(line: 56, column: 17, scope: !51)
!172 = !MDLocation(line: 56, column: 36, scope: !173)
!173 = !{!"0xb\001", !1, !51}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!174 = !{!"0x101\00__nptr\0016777494\000", !62, !64, !67, !175} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!175 = !MDLocation(line: 56, column: 31, scope: !51)
!176 = !MDLocation(line: 278, column: 1, scope: !62, inlinedAt: !175)
!177 = !MDLocation(line: 280, column: 16, scope: !62, inlinedAt: !175)
!178 = !MDLocation(line: 280, column: 10, scope: !62, inlinedAt: !175)
!179 = !MDLocation(line: 56, column: 12, scope: !51)
!180 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !181} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!181 = !MDLocation(line: 58, column: 16, scope: !51)
!182 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !181)
!183 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !181} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!184 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !181)
!185 = !{!"0x100\00count\0013\000", !12, !13, !6, !181} ; [ DW_TAG_auto_variable ] [count] [line 13]
!186 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !181)
!187 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !181)
!188 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !181)
!189 = !{!"0x100\00m\0014\000", !12, !13, !4, !181} ; [ DW_TAG_auto_variable ] [m] [line 14]
!190 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !181)
!191 = !{!"0x100\00i\0013\000", !12, !13, !6, !181} ; [ DW_TAG_auto_variable ] [i] [line 13]
!192 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !181)
!193 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !181)
!194 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !181)
!195 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !181)
!196 = !{!"0x100\00j\0013\000", !12, !13, !6, !181} ; [ DW_TAG_auto_variable ] [j] [line 13]
!197 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !181)
!198 = !MDLocation(line: 18, column: 6, scope: !94, inlinedAt: !181)
!199 = !MDLocation(line: 18, column: 16, scope: !94, inlinedAt: !181)
!200 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !181)
!201 = !MDLocation(line: 58, column: 11, scope: !51)
!202 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !203} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!203 = !MDLocation(line: 59, column: 16, scope: !51)
!204 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !203)
!205 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !203} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!206 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !203)
!207 = !{!"0x100\00count\0013\000", !12, !13, !6, !203} ; [ DW_TAG_auto_variable ] [count] [line 13]
!208 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !203)
!209 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !203)
!210 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !203)
!211 = !{!"0x100\00m\0014\000", !12, !13, !4, !203} ; [ DW_TAG_auto_variable ] [m] [line 14]
!212 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !203)
!213 = !{!"0x100\00i\0013\000", !12, !13, !6, !203} ; [ DW_TAG_auto_variable ] [i] [line 13]
!214 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !203)
!215 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !203)
!216 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !203)
!217 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !203)
!218 = !{!"0x100\00j\0013\000", !12, !13, !6, !203} ; [ DW_TAG_auto_variable ] [j] [line 13]
!219 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !203)
!220 = !MDLocation(line: 18, column: 6, scope: !94, inlinedAt: !203)
!221 = !MDLocation(line: 18, column: 16, scope: !94, inlinedAt: !203)
!222 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !203)
!223 = !MDLocation(line: 59, column: 11, scope: !51)
!224 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !225} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!225 = !MDLocation(line: 60, column: 16, scope: !51)
!226 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !225)
!227 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !225} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!228 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !225)
!229 = !{!"0x100\00count\0013\000", !12, !13, !6, !225} ; [ DW_TAG_auto_variable ] [count] [line 13]
!230 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !225)
!231 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !225)
!232 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !225)
!233 = !{!"0x100\00m\0014\000", !12, !13, !4, !225} ; [ DW_TAG_auto_variable ] [m] [line 14]
!234 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !225)
!235 = !{!"0x100\00i\0013\000", !12, !13, !6, !225} ; [ DW_TAG_auto_variable ] [i] [line 13]
!236 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !225)
!237 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !225)
!238 = !MDLocation(line: 62, column: 15, scope: !239)
!239 = !{!"0xb\0062\005\0021", !1, !240}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!240 = !{!"0xb\0062\005\0020", !1, !51}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!241 = !MDLocation(line: 62, column: 5, scope: !240)
!242 = !MDLocation(line: 32, column: 32, scope: !134, inlinedAt: !243)
!243 = !MDLocation(line: 68, column: 5, scope: !51)
!244 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !225)
!245 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !225)
!246 = !{!"0x100\00j\0013\000", !12, !13, !6, !225} ; [ DW_TAG_auto_variable ] [j] [line 13]
!247 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !225)
!248 = !MDLocation(line: 18, column: 6, scope: !94, inlinedAt: !225)
!249 = !MDLocation(line: 18, column: 16, scope: !94, inlinedAt: !225)
!250 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !225)
!251 = !MDLocation(line: 44, column: 6, scope: !155, inlinedAt: !252)
!252 = !MDLocation(line: 63, column: 7, scope: !253)
!253 = !{!"0xb\0062\0025\0022", !1, !239}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!254 = !MDLocation(line: 42, column: 10, scope: !157, inlinedAt: !252)
!255 = !MDLocation(line: 42, column: 21, scope: !157, inlinedAt: !252)
!256 = !MDLocation(line: 39, column: 2, scope: !151, inlinedAt: !252)
!257 = !{!"0x100\00val\0037\000", !38, !13, !6, !252} ; [ DW_TAG_auto_variable ] [val] [line 37]
!258 = !MDLocation(line: 37, column: 18, scope: !38, inlinedAt: !252)
!259 = !MDLocation(line: 42, column: 3, scope: !157, inlinedAt: !252)
!260 = !MDLocation(line: 38, column: 5, scope: !147, inlinedAt: !252)
!261 = !MDLocation(line: 60, column: 11, scope: !51)
!262 = !MDLocation(line: 62, column: 20, scope: !239)
!263 = !MDLocation(line: 56, column: 9, scope: !51)
!264 = !MDLocation(line: 65, column: 29, scope: !51)
!265 = !MDLocation(line: 65, column: 39, scope: !51)
!266 = !MDLocation(line: 65, column: 49, scope: !51)
!267 = !MDLocation(line: 65, column: 59, scope: !51)
!268 = !MDLocation(line: 65, column: 5, scope: !51)
!269 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !270} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!270 = !MDLocation(line: 67, column: 5, scope: !51)
!271 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !270)
!272 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !270} ; [ DW_TAG_arg_variable ] [m] [line 31]
!273 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !270)
!274 = !MDLocation(line: 32, column: 32, scope: !134, inlinedAt: !270)
!275 = !MDLocation(line: 32, column: 27, scope: !134, inlinedAt: !270)
!276 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !270)
!277 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !243} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!278 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !243)
!279 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !243} ; [ DW_TAG_arg_variable ] [m] [line 31]
!280 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !243)
!281 = !MDLocation(line: 32, column: 27, scope: !134, inlinedAt: !243)
!282 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !243)
!283 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !284} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!284 = !MDLocation(line: 69, column: 5, scope: !51)
!285 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !284)
!286 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !284} ; [ DW_TAG_arg_variable ] [m] [line 31]
!287 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !284)
!288 = !MDLocation(line: 32, column: 32, scope: !134, inlinedAt: !284)
!289 = !MDLocation(line: 32, column: 27, scope: !134, inlinedAt: !284)
!290 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !284)
!291 = !MDLocation(line: 70, column: 5, scope: !51)
