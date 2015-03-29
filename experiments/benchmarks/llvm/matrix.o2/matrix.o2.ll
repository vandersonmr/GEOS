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
  %1 = add i32 %cols, -1, !dbg !86
  %2 = add i32 %rows, -1, !dbg !86
  %3 = zext i32 %1 to i64
  %4 = add nuw nsw i64 %3, 1, !dbg !86
  %5 = zext i32 %1 to i64
  %6 = add i64 %5, 1, !dbg !86
  %7 = lshr i64 %6, 3, !dbg !86
  %8 = mul i64 %7, 8, !dbg !86
  %9 = add i64 %8, -8, !dbg !86
  %10 = lshr i64 %9, 3, !dbg !86
  %11 = add i64 %10, 1, !dbg !86
  br label %for.body, !dbg !86

for.body:                                         ; preds = %for.inc14, %for.body.lr.ph
  %indvars.iv32 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next33, %for.inc14 ]
  %count.030 = phi i32 [ 1, %for.body.lr.ph ], [ %count.1.lcssa, %for.inc14 ]
  %call4 = tail call noalias i8* @malloc(i64 %mul3) #3, !dbg !92
  %arrayidx = getelementptr inbounds i32** %0, i64 %indvars.iv32, !dbg !93
  %12 = bitcast i32** %arrayidx to i8**, !dbg !93
  store i8* %call4, i8** %12, align 8, !dbg !93, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !74), !dbg !98
  %13 = bitcast i8* %call4 to i32*
  br i1 %cmp626, label %overflow.checked, label %for.inc14, !dbg !99

overflow.checked:                                 ; preds = %for.body
  %end.idx = add nuw nsw i64 %3, 1, !dbg !99
  %n.vec = and i64 %4, 8589934584, !dbg !99
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !99
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end = add i32 %cast.crd, %count.030
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %xtraiter = and i64 %11, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %11, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !99
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %14 = trunc i64 %index.prol to i32
  %offset.idx.prol = add i32 %count.030, %14
  %broadcast.splatinsert39.prol = insertelement <4 x i32> undef, i32 %offset.idx.prol, i32 0
  %broadcast.splat40.prol = shufflevector <4 x i32> %broadcast.splatinsert39.prol, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction41.prol = add <4 x i32> %broadcast.splat40.prol, <i32 0, i32 1, i32 2, i32 3>
  %induction42.prol = add <4 x i32> %broadcast.splat40.prol, <i32 4, i32 5, i32 6, i32 7>
  %15 = getelementptr inbounds i32* %13, i64 %index.prol, !dbg !100
  %16 = bitcast i32* %15 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction41.prol, <4 x i32>* %16, align 4, !dbg !100, !tbaa !102
  %.sum49.prol = or i64 %index.prol, 4, !dbg !100
  %17 = getelementptr i32* %13, i64 %.sum49.prol, !dbg !100
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction42.prol, <4 x i32>* %18, align 4, !dbg !100, !tbaa !102
  %index.next.prol = add i64 %index.prol, 8, !dbg !99
  %19 = icmp eq i64 %index.next.prol, %n.vec, !dbg !99
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !99
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !99
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !104

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %20 = icmp ult i64 %11, 2
  br i1 %20, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !99
  %21 = trunc i64 %index to i32
  %offset.idx = add i32 %count.030, %21
  %broadcast.splatinsert39 = insertelement <4 x i32> undef, i32 %offset.idx, i32 0
  %broadcast.splat40 = shufflevector <4 x i32> %broadcast.splatinsert39, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction41 = add <4 x i32> %broadcast.splat40, <i32 0, i32 1, i32 2, i32 3>
  %induction42 = add <4 x i32> %broadcast.splat40, <i32 4, i32 5, i32 6, i32 7>
  %22 = getelementptr inbounds i32* %13, i64 %index, !dbg !100
  %23 = bitcast i32* %22 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction41, <4 x i32>* %23, align 4, !dbg !100, !tbaa !102
  %.sum49 = or i64 %index, 4, !dbg !100
  %24 = getelementptr i32* %13, i64 %.sum49, !dbg !100
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction42, <4 x i32>* %25, align 4, !dbg !100, !tbaa !102
  %index.next = add i64 %index, 8, !dbg !99
  %26 = trunc i64 %index.next to i32
  %offset.idx.1 = add i32 %count.030, %26
  %broadcast.splatinsert39.1 = insertelement <4 x i32> undef, i32 %offset.idx.1, i32 0
  %broadcast.splat40.1 = shufflevector <4 x i32> %broadcast.splatinsert39.1, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction41.1 = add <4 x i32> %broadcast.splat40.1, <i32 0, i32 1, i32 2, i32 3>
  %induction42.1 = add <4 x i32> %broadcast.splat40.1, <i32 4, i32 5, i32 6, i32 7>
  %27 = getelementptr inbounds i32* %13, i64 %index.next, !dbg !100
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction41.1, <4 x i32>* %28, align 4, !dbg !100, !tbaa !102
  %.sum49.1 = or i64 %index.next, 4, !dbg !100
  %29 = getelementptr i32* %13, i64 %.sum49.1, !dbg !100
  %30 = bitcast i32* %29 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction42.1, <4 x i32>* %30, align 4, !dbg !100, !tbaa !102
  %index.next.1 = add i64 %index.next, 8, !dbg !99
  %31 = icmp eq i64 %index.next.1, %n.vec, !dbg !99
  br i1 %31, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !99, !llvm.loop !106

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %resume.val36 = phi i32 [ %count.030, %overflow.checked ], [ %ind.end, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond5.for.inc14_crit_edge, label %for.body8.preheader

for.body8.preheader:                              ; preds = %middle.block
  %32 = trunc i64 %resume.val to i32
  %33 = sub i32 %cols, %32
  %xtraiter50 = and i32 %33, 3
  %lcmp.mod51 = icmp ne i32 %xtraiter50, 0
  %lcmp.overflow52 = icmp eq i32 %33, 0
  %lcmp.or53 = or i1 %lcmp.overflow52, %lcmp.mod51
  br i1 %lcmp.or53, label %for.body8.prol.preheader, label %for.body8.preheader.split

for.body8.prol.preheader:                         ; preds = %for.body8.preheader
  br label %for.body8.prol, !dbg !109

for.body8.prol:                                   ; preds = %for.body8.prol.preheader, %for.body8.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ %resume.val, %for.body8.prol.preheader ]
  %count.128.prol = phi i32 [ %inc.prol, %for.body8.prol ], [ %resume.val36, %for.body8.prol.preheader ]
  %prol.iter54 = phi i32 [ %prol.iter54.sub, %for.body8.prol ], [ %xtraiter50, %for.body8.prol.preheader ]
  %inc.prol = add nsw i32 %count.128.prol, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.prol = getelementptr inbounds i32* %13, i64 %indvars.iv.prol, !dbg !100
  store i32 %count.128.prol, i32* %arrayidx12.prol, align 4, !dbg !100, !tbaa !102
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !99
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !99
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %1, !dbg !99
  %prol.iter54.sub = sub i32 %prol.iter54, 1, !dbg !99
  %prol.iter54.cmp = icmp ne i32 %prol.iter54.sub, 0, !dbg !99
  br i1 %prol.iter54.cmp, label %for.body8.prol, label %for.body8.preheader.split.loopexit, !llvm.loop !110

for.body8.preheader.split.loopexit:               ; preds = %for.body8.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ]
  %count.128.unr.ph = phi i32 [ %inc.prol, %for.body8.prol ]
  br label %for.body8.preheader.split

for.body8.preheader.split:                        ; preds = %for.body8.preheader.split.loopexit, %for.body8.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body8.preheader ], [ %indvars.iv.unr.ph, %for.body8.preheader.split.loopexit ]
  %count.128.unr = phi i32 [ %resume.val36, %for.body8.preheader ], [ %count.128.unr.ph, %for.body8.preheader.split.loopexit ]
  %34 = icmp ult i32 %33, 4
  br i1 %34, label %for.cond5.for.inc14_crit_edge.loopexit, label %for.body8.preheader.split.split

for.body8.preheader.split.split:                  ; preds = %for.body8.preheader.split
  br label %for.body8, !dbg !109

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body8.preheader.split.split ], [ %indvars.iv.next.3, %for.body8 ]
  %count.128 = phi i32 [ %count.128.unr, %for.body8.preheader.split.split ], [ %inc.3, %for.body8 ]
  %inc = add nsw i32 %count.128, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12 = getelementptr inbounds i32* %13, i64 %indvars.iv, !dbg !100
  store i32 %count.128, i32* %arrayidx12, align 4, !dbg !100, !tbaa !102
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !99
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !99
  %inc.1 = add nsw i32 %inc, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.1 = getelementptr inbounds i32* %13, i64 %indvars.iv.next, !dbg !100
  store i32 %inc, i32* %arrayidx12.1, align 4, !dbg !100, !tbaa !102
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !99
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !99
  %inc.2 = add nsw i32 %inc.1, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.2 = getelementptr inbounds i32* %13, i64 %indvars.iv.next.1, !dbg !100
  store i32 %inc.1, i32* %arrayidx12.2, align 4, !dbg !100, !tbaa !102
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !99
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !99
  %inc.3 = add nsw i32 %inc.2, 1, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !21, metadata !74), !dbg !77
  %arrayidx12.3 = getelementptr inbounds i32* %13, i64 %indvars.iv.next.2, !dbg !100
  store i32 %inc.2, i32* %arrayidx12.3, align 4, !dbg !100, !tbaa !102
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !99
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !99
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %1, !dbg !99
  br i1 %exitcond.3, label %for.cond5.for.inc14_crit_edge.loopexit.unr-lcssa, label %for.body8, !dbg !99, !llvm.loop !111

for.cond5.for.inc14_crit_edge.loopexit.unr-lcssa: ; preds = %for.body8
  br label %for.cond5.for.inc14_crit_edge.loopexit

for.cond5.for.inc14_crit_edge.loopexit:           ; preds = %for.body8.preheader.split, %for.cond5.for.inc14_crit_edge.loopexit.unr-lcssa
  br label %for.cond5.for.inc14_crit_edge

for.cond5.for.inc14_crit_edge:                    ; preds = %for.cond5.for.inc14_crit_edge.loopexit, %middle.block
  %35 = add i32 %count.030, %cols, !dbg !99
  br label %for.inc14, !dbg !99

for.inc14:                                        ; preds = %for.cond5.for.inc14_crit_edge, %for.body
  %count.1.lcssa = phi i32 [ %35, %for.cond5.for.inc14_crit_edge ], [ %count.030, %for.body ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !86
  %lftr.wideiv34 = trunc i64 %indvars.iv32 to i32, !dbg !86
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %2, !dbg !86
  br i1 %exitcond35, label %for.end16.loopexit, label %for.body, !dbg !86

for.end16.loopexit:                               ; preds = %for.inc14
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit, %entry
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
  br i1 %cmp15, label %for.cond1.preheader.lr.ph, label %for.end8, !dbg !120

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp213 = icmp sgt i32 %cols, 0, !dbg !121
  %0 = add i32 %cols, -1, !dbg !120
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 2, !dbg !120
  %3 = add nuw nsw i64 %2, 4, !dbg !120
  %4 = add i32 %rows, -1, !dbg !120
  %xtraiter = and i32 %rows, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %rows, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.cond1.preheader.prol, label %for.cond1.preheader.lr.ph.split

for.cond1.preheader.prol:                         ; preds = %for.inc6.prol, %for.cond1.preheader.lr.ph
  %indvars.iv.prol = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next.prol, %for.inc6.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.cond1.preheader.lr.ph ], [ %prol.iter.sub, %for.inc6.prol ]
  br i1 %cmp213, label %for.body3.lr.ph.prol, label %for.inc6.prol, !dbg !124

for.body3.lr.ph.prol:                             ; preds = %for.cond1.preheader.prol
  %arrayidx.prol = getelementptr inbounds i32** %m, i64 %indvars.iv.prol, !dbg !125
  %5 = bitcast i32** %arrayidx.prol to i8**, !dbg !125
  %6 = load i8** %5, align 8, !dbg !125, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %3, i32 4, i1 false), !dbg !125
  br label %for.inc6.prol, !dbg !124

for.inc6.prol:                                    ; preds = %for.body3.lr.ph.prol, %for.cond1.preheader.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !120
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !120
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %4, !dbg !120
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !120
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !120
  br i1 %prol.iter.cmp, label %for.cond1.preheader.prol, label %for.cond1.preheader.lr.ph.split, !llvm.loop !126

for.cond1.preheader.lr.ph.split:                  ; preds = %for.inc6.prol, %for.cond1.preheader.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next.prol, %for.inc6.prol ]
  %7 = icmp ult i32 %rows, 4
  br i1 %7, label %for.end8.loopexit, label %for.cond1.preheader.lr.ph.split.split

for.cond1.preheader.lr.ph.split.split:            ; preds = %for.cond1.preheader.lr.ph.split
  br label %for.cond1.preheader, !dbg !120

for.cond1.preheader:                              ; preds = %for.inc6.3, %for.cond1.preheader.lr.ph.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.cond1.preheader.lr.ph.split.split ], [ %indvars.iv.next.3, %for.inc6.3 ]
  br i1 %cmp213, label %for.body3.lr.ph, label %for.inc6, !dbg !124

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !125
  %8 = bitcast i32** %arrayidx to i8**, !dbg !125
  %9 = load i8** %8, align 8, !dbg !125, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %3, i32 4, i1 false), !dbg !125
  br label %for.inc6, !dbg !124

for.inc6:                                         ; preds = %for.body3.lr.ph, %for.cond1.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !120
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !120
  br i1 %cmp213, label %for.body3.lr.ph.1, label %for.inc6.1, !dbg !124

for.end8.loopexit.unr-lcssa:                      ; preds = %for.inc6.3
  br label %for.end8.loopexit

for.end8.loopexit:                                ; preds = %for.cond1.preheader.lr.ph.split, %for.end8.loopexit.unr-lcssa
  br label %for.end8

for.end8:                                         ; preds = %for.end8.loopexit, %entry
  ret void, !dbg !127

for.body3.lr.ph.1:                                ; preds = %for.inc6
  %arrayidx.1 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !125
  %10 = bitcast i32** %arrayidx.1 to i8**, !dbg !125
  %11 = load i8** %10, align 8, !dbg !125, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %3, i32 4, i1 false), !dbg !125
  br label %for.inc6.1, !dbg !124

for.inc6.1:                                       ; preds = %for.body3.lr.ph.1, %for.inc6
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !120
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !120
  br i1 %cmp213, label %for.body3.lr.ph.2, label %for.inc6.2, !dbg !124

for.body3.lr.ph.2:                                ; preds = %for.inc6.1
  %arrayidx.2 = getelementptr inbounds i32** %m, i64 %indvars.iv.next.1, !dbg !125
  %12 = bitcast i32** %arrayidx.2 to i8**, !dbg !125
  %13 = load i8** %12, align 8, !dbg !125, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 %3, i32 4, i1 false), !dbg !125
  br label %for.inc6.2, !dbg !124

for.inc6.2:                                       ; preds = %for.body3.lr.ph.2, %for.inc6.1
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !120
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !120
  br i1 %cmp213, label %for.body3.lr.ph.3, label %for.inc6.3, !dbg !124

for.body3.lr.ph.3:                                ; preds = %for.inc6.2
  %arrayidx.3 = getelementptr inbounds i32** %m, i64 %indvars.iv.next.2, !dbg !125
  %14 = bitcast i32** %arrayidx.3 to i8**, !dbg !125
  %15 = load i8** %14, align 8, !dbg !125, !tbaa !94
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %3, i32 4, i1 false), !dbg !125
  br label %for.inc6.3, !dbg !124

for.inc6.3:                                       ; preds = %for.body3.lr.ph.3, %for.inc6.2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !120
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !120
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %4, !dbg !120
  br i1 %exitcond.3, label %for.end8.loopexit.unr-lcssa, label %for.cond1.preheader, !dbg !120
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !36, metadata !74), !dbg !128
  tail call void @llvm.dbg.value(metadata i32** %m, i64 0, metadata !37, metadata !74), !dbg !129
  %cmp4 = icmp sgt i32 %rows, 0, !dbg !130
  br i1 %cmp4, label %while.body.lr.ph, label %while.end, !dbg !133

while.body.lr.ph:                                 ; preds = %entry
  %0 = sext i32 %rows to i64
  br label %while.body, !dbg !133

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvars.iv = phi i64 [ %0, %while.body.lr.ph ], [ %indvars.iv.next, %while.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !133
  %arrayidx = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !134
  %1 = bitcast i32** %arrayidx to i8**, !dbg !134
  %2 = load i8** %1, align 8, !dbg !134, !tbaa !94
  tail call void @free(i8* %2) #3, !dbg !136
  %cmp = icmp sgt i64 %indvars.iv, 1, !dbg !130
  br i1 %cmp, label %while.body, label %while.end.loopexit, !dbg !133

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %3 = bitcast i32** %m to i8*, !dbg !137
  tail call void @free(i8* %3) #3, !dbg !138
  ret void, !dbg !139
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !42, metadata !74), !dbg !140
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !43, metadata !74), !dbg !141
  tail call void @llvm.dbg.value(metadata i32** %m1, i64 0, metadata !44, metadata !74), !dbg !142
  tail call void @llvm.dbg.value(metadata i32** %m2, i64 0, metadata !45, metadata !74), !dbg !143
  tail call void @llvm.dbg.value(metadata i32** %m3, i64 0, metadata !46, metadata !74), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !74), !dbg !145
  %cmp40 = icmp sgt i32 %rows, 0, !dbg !146
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end22, !dbg !149

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp238 = icmp sgt i32 %cols, 0, !dbg !150
  %0 = add i32 %cols, -1, !dbg !149
  %1 = add i32 %rows, -1, !dbg !149
  %2 = zext i32 %0 to i64
  %3 = add nuw nsw i64 %2, 1, !dbg !149
  br label %for.cond1.preheader, !dbg !149

for.cond1.preheader:                              ; preds = %for.inc20, %for.cond1.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next47, %for.inc20 ]
  br i1 %cmp238, label %for.cond4.preheader.lr.ph, label %for.inc20, !dbg !154

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %arrayidx15 = getelementptr inbounds i32** %m3, i64 %indvars.iv46, !dbg !155
  %4 = load i32** %arrayidx15, align 8, !dbg !155, !tbaa !94
  %arrayidx = getelementptr inbounds i32** %m1, i64 %indvars.iv46, !dbg !157
  br label %for.body6.lr.ph, !dbg !154

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader.lr.ph, %for.end
  %indvars.iv42 = phi i64 [ 0, %for.cond4.preheader.lr.ph ], [ %indvars.iv.next43, %for.end ]
  %5 = load i32** %arrayidx, align 8, !dbg !157, !tbaa !94
  %end.idx = add nuw nsw i64 %2, 1, !dbg !161
  %n.vec = and i64 %3, 8589934590, !dbg !161
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !161
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body6.lr.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !161
  %vec.phi = phi i32 [ %20, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi51 = phi i32 [ %21, %vector.body ], [ 0, %vector.body.preheader ]
  %induction5055 = or i64 %index, 1
  %6 = getelementptr inbounds i32* %5, i64 %index, !dbg !157
  %7 = getelementptr inbounds i32* %5, i64 %induction5055, !dbg !157
  %8 = load i32* %6, align 4, !dbg !157, !tbaa !102
  %9 = load i32* %7, align 4, !dbg !157, !tbaa !102
  %10 = getelementptr inbounds i32** %m2, i64 %index, !dbg !162
  %11 = getelementptr inbounds i32** %m2, i64 %induction5055, !dbg !162
  %12 = load i32** %10, align 8, !dbg !162, !tbaa !94
  %13 = load i32** %11, align 8, !dbg !162, !tbaa !94
  %14 = getelementptr inbounds i32* %12, i64 %indvars.iv42, !dbg !162
  %15 = getelementptr inbounds i32* %13, i64 %indvars.iv42, !dbg !162
  %16 = load i32* %14, align 4, !dbg !162, !tbaa !102
  %17 = load i32* %15, align 4, !dbg !162, !tbaa !102
  %18 = mul nsw i32 %16, %8, !dbg !157
  %19 = mul nsw i32 %17, %9, !dbg !157
  %20 = add nsw i32 %18, %vec.phi, !dbg !163
  %21 = add nsw i32 %19, %vec.phi51, !dbg !163
  %index.next = add i64 %index, 2, !dbg !161
  %22 = icmp eq i64 %index.next, %n.vec, !dbg !161
  br i1 %22, label %middle.block.loopexit, label %vector.body, !dbg !161, !llvm.loop !164

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa56 = phi i32 [ %21, %vector.body ]
  %.lcssa = phi i32 [ %20, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body6.lr.ph
  %resume.val = phi i64 [ 0, %for.body6.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi i32 [ 0, %for.body6.lr.ph ], [ %.lcssa, %middle.block.loopexit ], !dbg !163
  %rdx.vec.exit.phi54 = phi i32 [ 0, %for.body6.lr.ph ], [ %.lcssa56, %middle.block.loopexit ], !dbg !163
  %bin.rdx = add i32 %rdx.vec.exit.phi54, %rdx.vec.exit.phi, !dbg !163
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %middle.block
  %23 = trunc i64 %resume.val to i32
  %24 = sub i32 %cols, %23
  %xtraiter = and i32 %24, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %24, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.prol.preheader, label %for.body6.preheader.split

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol, !dbg !157

for.body6.prol:                                   ; preds = %for.body6.prol.preheader, %for.body6.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body6.prol ], [ %resume.val, %for.body6.prol.preheader ]
  %val.037.prol = phi i32 [ %add.prol, %for.body6.prol ], [ %bin.rdx, %for.body6.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.prol ], [ %xtraiter, %for.body6.prol.preheader ]
  %arrayidx8.prol = getelementptr inbounds i32* %5, i64 %indvars.iv.prol, !dbg !157
  %25 = load i32* %arrayidx8.prol, align 4, !dbg !157, !tbaa !102
  %arrayidx11.prol = getelementptr inbounds i32** %m2, i64 %indvars.iv.prol, !dbg !162
  %26 = load i32** %arrayidx11.prol, align 8, !dbg !162, !tbaa !94
  %arrayidx12.prol = getelementptr inbounds i32* %26, i64 %indvars.iv42, !dbg !162
  %27 = load i32* %arrayidx12.prol, align 4, !dbg !162, !tbaa !102
  %mul.prol = mul nsw i32 %27, %25, !dbg !157
  %add.prol = add nsw i32 %mul.prol, %val.037.prol, !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %add.prol, i64 0, metadata !50, metadata !74), !dbg !165
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !161
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !161
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !161
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !161
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !161
  br i1 %prol.iter.cmp, label %for.body6.prol, label %for.body6.preheader.split.loopexit, !llvm.loop !166

for.body6.preheader.split.loopexit:               ; preds = %for.body6.prol
  %add.lcssa57.unr.ph = phi i32 [ %add.prol, %for.body6.prol ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body6.prol ]
  %val.037.unr.ph = phi i32 [ %add.prol, %for.body6.prol ]
  br label %for.body6.preheader.split

for.body6.preheader.split:                        ; preds = %for.body6.preheader.split.loopexit, %for.body6.preheader
  %add.lcssa57.unr = phi i32 [ 0, %for.body6.preheader ], [ %add.lcssa57.unr.ph, %for.body6.preheader.split.loopexit ]
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body6.preheader ], [ %indvars.iv.unr.ph, %for.body6.preheader.split.loopexit ]
  %val.037.unr = phi i32 [ %bin.rdx, %for.body6.preheader ], [ %val.037.unr.ph, %for.body6.preheader.split.loopexit ]
  %28 = icmp ult i32 %24, 2
  br i1 %28, label %for.end.loopexit, label %for.body6.preheader.split.split

for.body6.preheader.split.split:                  ; preds = %for.body6.preheader.split
  br label %for.body6, !dbg !157

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body6.preheader.split.split ], [ %indvars.iv.next.1, %for.body6 ]
  %val.037 = phi i32 [ %val.037.unr, %for.body6.preheader.split.split ], [ %add.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !157
  %29 = load i32* %arrayidx8, align 4, !dbg !157, !tbaa !102
  %arrayidx11 = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !162
  %30 = load i32** %arrayidx11, align 8, !dbg !162, !tbaa !94
  %arrayidx12 = getelementptr inbounds i32* %30, i64 %indvars.iv42, !dbg !162
  %31 = load i32* %arrayidx12, align 4, !dbg !162, !tbaa !102
  %mul = mul nsw i32 %31, %29, !dbg !157
  %add = add nsw i32 %mul, %val.037, !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !50, metadata !74), !dbg !165
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !161
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !161
  %arrayidx8.1 = getelementptr inbounds i32* %5, i64 %indvars.iv.next, !dbg !157
  %32 = load i32* %arrayidx8.1, align 4, !dbg !157, !tbaa !102
  %arrayidx11.1 = getelementptr inbounds i32** %m2, i64 %indvars.iv.next, !dbg !162
  %33 = load i32** %arrayidx11.1, align 8, !dbg !162, !tbaa !94
  %arrayidx12.1 = getelementptr inbounds i32* %33, i64 %indvars.iv42, !dbg !162
  %34 = load i32* %arrayidx12.1, align 4, !dbg !162, !tbaa !102
  %mul.1 = mul nsw i32 %34, %32, !dbg !157
  %add.1 = add nsw i32 %mul.1, %add, !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !50, metadata !74), !dbg !165
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !161
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !161
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !161
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6, !dbg !161, !llvm.loop !167

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  %add.lcssa57.ph = phi i32 [ %add.1, %for.body6 ]
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.preheader.split, %for.end.loopexit.unr-lcssa
  %add.lcssa57 = phi i32 [ %add.lcssa57.unr, %for.body6.preheader.split ], [ %add.lcssa57.ph, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block
  %add.lcssa = phi i32 [ %bin.rdx, %middle.block ], [ %add.lcssa57, %for.end.loopexit ]
  %arrayidx16 = getelementptr inbounds i32* %4, i64 %indvars.iv42, !dbg !155
  store i32 %add.lcssa, i32* %arrayidx16, align 4, !dbg !155, !tbaa !102
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !154
  %lftr.wideiv44 = trunc i64 %indvars.iv42 to i32, !dbg !154
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %0, !dbg !154
  br i1 %exitcond45, label %for.inc20.loopexit, label %for.body6.lr.ph, !dbg !154

for.inc20.loopexit:                               ; preds = %for.end
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit, %for.cond1.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1, !dbg !149
  %lftr.wideiv48 = trunc i64 %indvars.iv46 to i32, !dbg !149
  %exitcond49 = icmp eq i32 %lftr.wideiv48, %1, !dbg !149
  br i1 %exitcond49, label %for.end22.loopexit, label %for.cond1.preheader, !dbg !149

for.end22.loopexit:                               ; preds = %for.inc20
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret i32** %m3, !dbg !168
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !55, metadata !74), !dbg !169
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !56, metadata !74), !dbg !170
  %cmp = icmp eq i32 %argc, 2, !dbg !171
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !172

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !173
  %0 = load i8** %arrayidx, align 8, !dbg !173, !tbaa !94
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !175, metadata !74) #3, !dbg !177
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !178
  %conv.i = trunc i64 %call.i to i32, !dbg !179
  br label %cond.end, !dbg !172

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 3000000, %entry ], !dbg !172
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !58, metadata !74), !dbg !180
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !181, metadata !74) #3, !dbg !183
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !184, metadata !74) #3, !dbg !185
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %call.i23 = tail call noalias i8* @malloc(i64 80) #3, !dbg !188
  %1 = bitcast i8* %call.i23 to i32**, !dbg !189
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !190, metadata !74) #3, !dbg !191
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !192, metadata !74) #3, !dbg !193
  br label %for.body.i, !dbg !194

for.body.i:                                       ; preds = %for.body.i, %cond.end
  %indvars.iv32.i = phi i64 [ 0, %cond.end ], [ %indvars.iv.next33.i, %for.body.i ], !dbg !182
  %count.030.i = phi i32 [ 1, %cond.end ], [ %13, %for.body.i ], !dbg !182
  %call4.i = tail call noalias i8* @malloc(i64 40) #3, !dbg !195
  %arrayidx.i = getelementptr inbounds i32** %1, i64 %indvars.iv32.i, !dbg !196
  %2 = bitcast i32** %arrayidx.i to i8**, !dbg !196
  store i8* %call4.i, i8** %2, align 8, !dbg !196, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !197, metadata !74) #3, !dbg !198
  %3 = bitcast i8* %call4.i to i32*, !dbg !182
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  store i32 %count.030.i, i32* %3, align 4, !dbg !199, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %arrayidx12.i.1 = getelementptr inbounds i8* %call4.i, i64 4, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %4 = insertelement <4 x i32> undef, i32 %count.030.i, i32 0, !dbg !200
  %5 = insertelement <4 x i32> %4, i32 %count.030.i, i32 1, !dbg !200
  %6 = insertelement <4 x i32> %5, i32 %count.030.i, i32 2, !dbg !200
  %7 = insertelement <4 x i32> %6, i32 %count.030.i, i32 3, !dbg !200
  %8 = add nsw <4 x i32> %7, <i32 1, i32 2, i32 3, i32 4>, !dbg !200
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %9 = bitcast i8* %arrayidx12.i.1 to <4 x i32>*, !dbg !199
  store <4 x i32> %8, <4 x i32>* %9, align 4, !dbg !199, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %arrayidx12.i.5 = getelementptr inbounds i8* %call4.i, i64 20, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %10 = add nsw <4 x i32> %7, <i32 5, i32 6, i32 7, i32 8>, !dbg !200
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %inc.i.8 = add nsw i32 %count.030.i, 9, !dbg !200
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %11 = bitcast i8* %arrayidx12.i.5 to <4 x i32>*, !dbg !199
  store <4 x i32> %10, <4 x i32>* %11, align 4, !dbg !199, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !186, metadata !74) #3, !dbg !187
  %arrayidx12.i.9 = getelementptr inbounds i8* %call4.i, i64 36, !dbg !199
  %12 = bitcast i8* %arrayidx12.i.9 to i32*, !dbg !199
  store i32 %inc.i.8, i32* %12, align 4, !dbg !199, !tbaa !102
  %13 = add nuw nsw i32 %count.030.i, 10, !dbg !201
  %indvars.iv.next33.i = add nuw nsw i64 %indvars.iv32.i, 1, !dbg !194
  %exitcond93 = icmp eq i64 %indvars.iv.next33.i, 10, !dbg !194
  br i1 %exitcond93, label %mkmatrix.exit, label %for.body.i, !dbg !194

mkmatrix.exit:                                    ; preds = %for.body.i
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !59, metadata !74), !dbg !202
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !203, metadata !74) #3, !dbg !205
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !206, metadata !74) #3, !dbg !207
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %call.i24 = tail call noalias i8* @malloc(i64 80) #3, !dbg !210
  %14 = bitcast i8* %call.i24 to i32**, !dbg !211
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !212, metadata !74) #3, !dbg !213
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !214, metadata !74) #3, !dbg !215
  br label %for.body.i29, !dbg !216

for.body.i29:                                     ; preds = %for.body.i29, %mkmatrix.exit
  %indvars.iv32.i25 = phi i64 [ 0, %mkmatrix.exit ], [ %indvars.iv.next33.i39, %for.body.i29 ], !dbg !204
  %count.030.i26 = phi i32 [ 1, %mkmatrix.exit ], [ %26, %for.body.i29 ], !dbg !204
  %call4.i27 = tail call noalias i8* @malloc(i64 40) #3, !dbg !217
  %arrayidx.i28 = getelementptr inbounds i32** %14, i64 %indvars.iv32.i25, !dbg !218
  %15 = bitcast i32** %arrayidx.i28 to i8**, !dbg !218
  store i8* %call4.i27, i8** %15, align 8, !dbg !218, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !219, metadata !74) #3, !dbg !220
  %16 = bitcast i8* %call4.i27 to i32*, !dbg !204
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  store i32 %count.030.i26, i32* %16, align 4, !dbg !221, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %arrayidx12.i33.1 = getelementptr inbounds i8* %call4.i27, i64 4, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %17 = insertelement <4 x i32> undef, i32 %count.030.i26, i32 0, !dbg !222
  %18 = insertelement <4 x i32> %17, i32 %count.030.i26, i32 1, !dbg !222
  %19 = insertelement <4 x i32> %18, i32 %count.030.i26, i32 2, !dbg !222
  %20 = insertelement <4 x i32> %19, i32 %count.030.i26, i32 3, !dbg !222
  %21 = add nsw <4 x i32> %20, <i32 1, i32 2, i32 3, i32 4>, !dbg !222
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %22 = bitcast i8* %arrayidx12.i33.1 to <4 x i32>*, !dbg !221
  store <4 x i32> %21, <4 x i32>* %22, align 4, !dbg !221, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %arrayidx12.i33.5 = getelementptr inbounds i8* %call4.i27, i64 20, !dbg !221
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %23 = add nsw <4 x i32> %20, <i32 5, i32 6, i32 7, i32 8>, !dbg !222
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %inc.i32.8 = add nsw i32 %count.030.i26, 9, !dbg !222
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %24 = bitcast i8* %arrayidx12.i33.5 to <4 x i32>*, !dbg !221
  store <4 x i32> %23, <4 x i32>* %24, align 4, !dbg !221, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !208, metadata !74) #3, !dbg !209
  %arrayidx12.i33.9 = getelementptr inbounds i8* %call4.i27, i64 36, !dbg !221
  %25 = bitcast i8* %arrayidx12.i33.9 to i32*, !dbg !221
  store i32 %inc.i32.8, i32* %25, align 4, !dbg !221, !tbaa !102
  %26 = add nuw nsw i32 %count.030.i26, 10, !dbg !223
  %indvars.iv.next33.i39 = add nuw nsw i64 %indvars.iv32.i25, 1, !dbg !216
  %exitcond91 = icmp eq i64 %indvars.iv.next33.i39, 10, !dbg !216
  br i1 %exitcond91, label %mkmatrix.exit42, label %for.body.i29, !dbg !216

mkmatrix.exit42:                                  ; preds = %for.body.i29
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !60, metadata !74), !dbg !224
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !225, metadata !74) #3, !dbg !227
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !228, metadata !74) #3, !dbg !229
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %call.i43 = tail call noalias i8* @malloc(i64 80) #3, !dbg !232
  %27 = bitcast i8* %call.i43 to i32**, !dbg !233
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !234, metadata !74) #3, !dbg !235
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !236, metadata !74) #3, !dbg !237
  br label %for.body.i48, !dbg !238

for.body.i48:                                     ; preds = %for.body.i48, %mkmatrix.exit42
  %indvars.iv32.i44 = phi i64 [ 0, %mkmatrix.exit42 ], [ %indvars.iv.next33.i58, %for.body.i48 ], !dbg !226
  %count.030.i45 = phi i32 [ 1, %mkmatrix.exit42 ], [ %39, %for.body.i48 ], !dbg !226
  %call4.i46 = tail call noalias i8* @malloc(i64 40) #3, !dbg !239
  %arrayidx.i47 = getelementptr inbounds i32** %27, i64 %indvars.iv32.i44, !dbg !240
  %28 = bitcast i32** %arrayidx.i47 to i8**, !dbg !240
  store i8* %call4.i46, i8** %28, align 8, !dbg !240, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !241, metadata !74) #3, !dbg !242
  %29 = bitcast i8* %call4.i46 to i32*, !dbg !226
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  store i32 %count.030.i45, i32* %29, align 4, !dbg !243, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %arrayidx12.i52.1 = getelementptr inbounds i8* %call4.i46, i64 4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %30 = insertelement <4 x i32> undef, i32 %count.030.i45, i32 0, !dbg !244
  %31 = insertelement <4 x i32> %30, i32 %count.030.i45, i32 1, !dbg !244
  %32 = insertelement <4 x i32> %31, i32 %count.030.i45, i32 2, !dbg !244
  %33 = insertelement <4 x i32> %32, i32 %count.030.i45, i32 3, !dbg !244
  %34 = add nsw <4 x i32> %33, <i32 1, i32 2, i32 3, i32 4>, !dbg !244
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %35 = bitcast i8* %arrayidx12.i52.1 to <4 x i32>*, !dbg !243
  store <4 x i32> %34, <4 x i32>* %35, align 4, !dbg !243, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %arrayidx12.i52.5 = getelementptr inbounds i8* %call4.i46, i64 20, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %36 = add nsw <4 x i32> %33, <i32 5, i32 6, i32 7, i32 8>, !dbg !244
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %inc.i51.8 = add nsw i32 %count.030.i45, 9, !dbg !244
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %37 = bitcast i8* %arrayidx12.i52.5 to <4 x i32>*, !dbg !243
  store <4 x i32> %36, <4 x i32>* %37, align 4, !dbg !243, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !230, metadata !74) #3, !dbg !231
  %arrayidx12.i52.9 = getelementptr inbounds i8* %call4.i46, i64 36, !dbg !243
  %38 = bitcast i8* %arrayidx12.i52.9 to i32*, !dbg !243
  store i32 %inc.i51.8, i32* %38, align 4, !dbg !243, !tbaa !102
  %39 = add nuw nsw i32 %count.030.i45, 10, !dbg !245
  %indvars.iv.next33.i58 = add nuw nsw i64 %indvars.iv32.i44, 1, !dbg !238
  %exitcond89 = icmp eq i64 %indvars.iv.next33.i58, 10, !dbg !238
  br i1 %exitcond89, label %for.cond.preheader, label %for.body.i48, !dbg !238

for.cond.preheader:                               ; preds = %for.body.i48
  %cmp483 = icmp sgt i32 %cond, 0, !dbg !246
  br i1 %cmp483, label %for.cond1.preheader.i.preheader.lr.ph, label %for.cond.preheader.for.end_crit_edge, !dbg !249

for.cond.preheader.for.end_crit_edge:             ; preds = %for.cond.preheader
  %arrayidx.i73.pre = getelementptr inbounds i8* %call.i24, i64 72, !dbg !250
  %40 = bitcast i8* %arrayidx.i73.pre to i32**, !dbg !250
  %arrayidx.i73.1.pre = getelementptr inbounds i8* %call.i24, i64 64, !dbg !250
  %41 = bitcast i8* %arrayidx.i73.1.pre to i32**, !dbg !250
  %arrayidx.i73.2.pre = getelementptr inbounds i8* %call.i24, i64 56, !dbg !250
  %42 = bitcast i8* %arrayidx.i73.2.pre to i32**, !dbg !250
  %arrayidx.i73.3.pre = getelementptr inbounds i8* %call.i24, i64 48, !dbg !250
  %43 = bitcast i8* %arrayidx.i73.3.pre to i32**, !dbg !250
  %arrayidx.i73.4.pre = getelementptr inbounds i8* %call.i24, i64 40, !dbg !250
  %44 = bitcast i8* %arrayidx.i73.4.pre to i32**, !dbg !250
  %arrayidx.i73.5.pre = getelementptr inbounds i8* %call.i24, i64 32, !dbg !250
  %45 = bitcast i8* %arrayidx.i73.5.pre to i32**, !dbg !250
  %arrayidx.i73.6.pre = getelementptr inbounds i8* %call.i24, i64 24, !dbg !250
  %46 = bitcast i8* %arrayidx.i73.6.pre to i32**, !dbg !250
  %arrayidx.i73.7.pre = getelementptr inbounds i8* %call.i24, i64 16, !dbg !250
  %47 = bitcast i8* %arrayidx.i73.7.pre to i32**, !dbg !250
  %arrayidx.i73.8.pre = getelementptr inbounds i8* %call.i24, i64 8, !dbg !250
  %48 = bitcast i8* %arrayidx.i73.8.pre to i32**, !dbg !250
  br label %for.end, !dbg !249

for.cond1.preheader.i.preheader.lr.ph:            ; preds = %for.cond.preheader
  %49 = add i32 %cond, -1, !dbg !249
  br label %for.cond1.preheader.i.preheader, !dbg !249

for.cond1.preheader.i.preheader:                  ; preds = %mmult.exit, %for.cond1.preheader.i.preheader.lr.ph
  %i.084 = phi i32 [ 0, %for.cond1.preheader.i.preheader.lr.ph ], [ %inc, %mmult.exit ]
  br label %for.cond1.preheader.i, !dbg !252

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc20.i
  %indvars.iv46.i = phi i64 [ %indvars.iv.next47.i, %for.inc20.i ], [ 0, %for.cond1.preheader.i.preheader ], !dbg !253
  %arrayidx15.i = getelementptr inbounds i32** %27, i64 %indvars.iv46.i, !dbg !252
  %50 = load i32** %arrayidx15.i, align 8, !dbg !252, !tbaa !94
  %arrayidx.i62 = getelementptr inbounds i32** %1, i64 %indvars.iv46.i, !dbg !255
  %51 = load i32** %arrayidx.i62, align 8, !dbg !255, !tbaa !94
  %.pre = load i32** %14, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.1.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 8
  %52 = bitcast i8* %arrayidx11.i.1.phi.trans.insert to i32**
  %.pre94 = load i32** %52, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.2.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 16
  %53 = bitcast i8* %arrayidx11.i.2.phi.trans.insert to i32**
  %.pre95 = load i32** %53, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.3.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 24
  %54 = bitcast i8* %arrayidx11.i.3.phi.trans.insert to i32**
  %.pre96 = load i32** %54, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.4.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 32
  %55 = bitcast i8* %arrayidx11.i.4.phi.trans.insert to i32**
  %.pre97 = load i32** %55, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.5.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 40
  %56 = bitcast i8* %arrayidx11.i.5.phi.trans.insert to i32**
  %.pre98 = load i32** %56, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.6.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 48
  %57 = bitcast i8* %arrayidx11.i.6.phi.trans.insert to i32**
  %.pre99 = load i32** %57, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.7.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 56
  %58 = bitcast i8* %arrayidx11.i.7.phi.trans.insert to i32**
  %.pre100 = load i32** %58, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.8.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 64
  %59 = bitcast i8* %arrayidx11.i.8.phi.trans.insert to i32**
  %.pre101 = load i32** %59, align 8, !dbg !256, !tbaa !94
  %arrayidx11.i.9.phi.trans.insert = getelementptr inbounds i8* %call.i24, i64 72
  %60 = bitcast i8* %arrayidx11.i.9.phi.trans.insert to i32**
  %.pre102 = load i32** %60, align 8, !dbg !256, !tbaa !94
  br label %for.body6.lr.ph.i, !dbg !257

for.body6.lr.ph.i:                                ; preds = %for.body6.lr.ph.i, %for.cond1.preheader.i
  %indvars.iv42.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next43.i, %for.body6.lr.ph.i ], !dbg !253
  %61 = load i32* %51, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64 = getelementptr inbounds i32* %.pre, i64 %indvars.iv42.i, !dbg !256
  %62 = load i32* %arrayidx12.i64, align 4, !dbg !256, !tbaa !102
  %mul.i = mul nsw i32 %62, %61, !dbg !255
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.1 = getelementptr inbounds i32* %51, i64 1, !dbg !255
  %63 = load i32* %arrayidx8.i.1, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.1 = getelementptr inbounds i32* %.pre94, i64 %indvars.iv42.i, !dbg !256
  %64 = load i32* %arrayidx12.i64.1, align 4, !dbg !256, !tbaa !102
  %mul.i.1 = mul nsw i32 %64, %63, !dbg !255
  %add.i.1 = add nsw i32 %mul.i.1, %mul.i, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.2 = getelementptr inbounds i32* %51, i64 2, !dbg !255
  %65 = load i32* %arrayidx8.i.2, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.2 = getelementptr inbounds i32* %.pre95, i64 %indvars.iv42.i, !dbg !256
  %66 = load i32* %arrayidx12.i64.2, align 4, !dbg !256, !tbaa !102
  %mul.i.2 = mul nsw i32 %66, %65, !dbg !255
  %add.i.2 = add nsw i32 %mul.i.2, %add.i.1, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.3 = getelementptr inbounds i32* %51, i64 3, !dbg !255
  %67 = load i32* %arrayidx8.i.3, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.3 = getelementptr inbounds i32* %.pre96, i64 %indvars.iv42.i, !dbg !256
  %68 = load i32* %arrayidx12.i64.3, align 4, !dbg !256, !tbaa !102
  %mul.i.3 = mul nsw i32 %68, %67, !dbg !255
  %add.i.3 = add nsw i32 %mul.i.3, %add.i.2, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.4 = getelementptr inbounds i32* %51, i64 4, !dbg !255
  %69 = load i32* %arrayidx8.i.4, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.4 = getelementptr inbounds i32* %.pre97, i64 %indvars.iv42.i, !dbg !256
  %70 = load i32* %arrayidx12.i64.4, align 4, !dbg !256, !tbaa !102
  %mul.i.4 = mul nsw i32 %70, %69, !dbg !255
  %add.i.4 = add nsw i32 %mul.i.4, %add.i.3, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.5 = getelementptr inbounds i32* %51, i64 5, !dbg !255
  %71 = load i32* %arrayidx8.i.5, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.5 = getelementptr inbounds i32* %.pre98, i64 %indvars.iv42.i, !dbg !256
  %72 = load i32* %arrayidx12.i64.5, align 4, !dbg !256, !tbaa !102
  %mul.i.5 = mul nsw i32 %72, %71, !dbg !255
  %add.i.5 = add nsw i32 %mul.i.5, %add.i.4, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.6 = getelementptr inbounds i32* %51, i64 6, !dbg !255
  %73 = load i32* %arrayidx8.i.6, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.6 = getelementptr inbounds i32* %.pre99, i64 %indvars.iv42.i, !dbg !256
  %74 = load i32* %arrayidx12.i64.6, align 4, !dbg !256, !tbaa !102
  %mul.i.6 = mul nsw i32 %74, %73, !dbg !255
  %add.i.6 = add nsw i32 %mul.i.6, %add.i.5, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.7 = getelementptr inbounds i32* %51, i64 7, !dbg !255
  %75 = load i32* %arrayidx8.i.7, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.7 = getelementptr inbounds i32* %.pre100, i64 %indvars.iv42.i, !dbg !256
  %76 = load i32* %arrayidx12.i64.7, align 4, !dbg !256, !tbaa !102
  %mul.i.7 = mul nsw i32 %76, %75, !dbg !255
  %add.i.7 = add nsw i32 %mul.i.7, %add.i.6, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.8 = getelementptr inbounds i32* %51, i64 8, !dbg !255
  %77 = load i32* %arrayidx8.i.8, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.8 = getelementptr inbounds i32* %.pre101, i64 %indvars.iv42.i, !dbg !256
  %78 = load i32* %arrayidx12.i64.8, align 4, !dbg !256, !tbaa !102
  %mul.i.8 = mul nsw i32 %78, %77, !dbg !255
  %add.i.8 = add nsw i32 %mul.i.8, %add.i.7, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx8.i.9 = getelementptr inbounds i32* %51, i64 9, !dbg !255
  %79 = load i32* %arrayidx8.i.9, align 4, !dbg !255, !tbaa !102
  %arrayidx12.i64.9 = getelementptr inbounds i32* %.pre102, i64 %indvars.iv42.i, !dbg !256
  %80 = load i32* %arrayidx12.i64.9, align 4, !dbg !256, !tbaa !102
  %mul.i.9 = mul nsw i32 %80, %79, !dbg !255
  %add.i.9 = add nsw i32 %mul.i.9, %add.i.8, !dbg !260
  tail call void @llvm.dbg.value(metadata i32 %mul.i, i64 0, metadata !258, metadata !74), !dbg !259
  %arrayidx16.i = getelementptr inbounds i32* %50, i64 %indvars.iv42.i, !dbg !252
  store i32 %add.i.9, i32* %arrayidx16.i, align 4, !dbg !252, !tbaa !102
  %indvars.iv.next43.i = add nuw nsw i64 %indvars.iv42.i, 1, !dbg !257
  %exitcond85 = icmp eq i64 %indvars.iv.next43.i, 10, !dbg !257
  br i1 %exitcond85, label %for.inc20.i, label %for.body6.lr.ph.i, !dbg !257

for.inc20.i:                                      ; preds = %for.body6.lr.ph.i
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1, !dbg !261
  %exitcond86 = icmp eq i64 %indvars.iv.next47.i, 10, !dbg !261
  br i1 %exitcond86, label %mmult.exit, label %for.cond1.preheader.i, !dbg !261

mmult.exit:                                       ; preds = %for.inc20.i
  %.lcssa118 = phi i32** [ %60, %for.inc20.i ]
  %.lcssa117 = phi i32** [ %59, %for.inc20.i ]
  %.lcssa116 = phi i32** [ %58, %for.inc20.i ]
  %.lcssa115 = phi i32** [ %57, %for.inc20.i ]
  %.lcssa114 = phi i32** [ %56, %for.inc20.i ]
  %.lcssa113 = phi i32** [ %55, %for.inc20.i ]
  %.lcssa112 = phi i32** [ %54, %for.inc20.i ]
  %.lcssa111 = phi i32** [ %53, %for.inc20.i ]
  %.lcssa = phi i32** [ %52, %for.inc20.i ]
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !61, metadata !74), !dbg !262
  %inc = add nuw nsw i32 %i.084, 1, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !74), !dbg !264
  %exitcond87 = icmp eq i32 %i.084, %49, !dbg !249
  br i1 %exitcond87, label %for.end.loopexit, label %for.cond1.preheader.i.preheader, !dbg !249

for.end.loopexit:                                 ; preds = %mmult.exit
  %.lcssa118.lcssa = phi i32** [ %.lcssa118, %mmult.exit ]
  %.lcssa117.lcssa = phi i32** [ %.lcssa117, %mmult.exit ]
  %.lcssa116.lcssa = phi i32** [ %.lcssa116, %mmult.exit ]
  %.lcssa115.lcssa = phi i32** [ %.lcssa115, %mmult.exit ]
  %.lcssa114.lcssa = phi i32** [ %.lcssa114, %mmult.exit ]
  %.lcssa113.lcssa = phi i32** [ %.lcssa113, %mmult.exit ]
  %.lcssa112.lcssa = phi i32** [ %.lcssa112, %mmult.exit ]
  %.lcssa111.lcssa = phi i32** [ %.lcssa111, %mmult.exit ]
  %.lcssa.lcssa = phi i32** [ %.lcssa, %mmult.exit ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader.for.end_crit_edge
  %arrayidx.i73.8.pre-phi = phi i32** [ %48, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.7.pre-phi = phi i32** [ %47, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa111.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.6.pre-phi = phi i32** [ %46, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa112.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.5.pre-phi = phi i32** [ %45, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa113.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.4.pre-phi = phi i32** [ %44, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa114.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.3.pre-phi = phi i32** [ %43, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa115.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.2.pre-phi = phi i32** [ %42, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa116.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.1.pre-phi = phi i32** [ %41, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa117.lcssa, %for.end.loopexit ], !dbg !250
  %arrayidx.i73.pre-phi = phi i32** [ %40, %for.cond.preheader.for.end_crit_edge ], [ %.lcssa118.lcssa, %for.end.loopexit ], !dbg !250
  %81 = load i32** %27, align 8, !dbg !265, !tbaa !94
  %82 = load i32* %81, align 4, !dbg !265, !tbaa !102
  %arrayidx8 = getelementptr inbounds i8* %call.i43, i64 16, !dbg !266
  %83 = bitcast i8* %arrayidx8 to i32**, !dbg !266
  %84 = load i32** %83, align 8, !dbg !266, !tbaa !94
  %arrayidx9 = getelementptr inbounds i32* %84, i64 3, !dbg !266
  %85 = load i32* %arrayidx9, align 4, !dbg !266, !tbaa !102
  %arrayidx10 = getelementptr inbounds i8* %call.i43, i64 24, !dbg !267
  %86 = bitcast i8* %arrayidx10 to i32**, !dbg !267
  %87 = load i32** %86, align 8, !dbg !267, !tbaa !94
  %arrayidx11 = getelementptr inbounds i32* %87, i64 2, !dbg !267
  %88 = load i32* %arrayidx11, align 4, !dbg !267, !tbaa !102
  %arrayidx12 = getelementptr inbounds i8* %call.i43, i64 32, !dbg !268
  %89 = bitcast i8* %arrayidx12 to i32**, !dbg !268
  %90 = load i32** %89, align 8, !dbg !268, !tbaa !94
  %arrayidx13 = getelementptr inbounds i32* %90, i64 4, !dbg !268
  %91 = load i32* %arrayidx13, align 4, !dbg !268, !tbaa !102
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %82, i32 %85, i32 %88, i32 %91) #3, !dbg !269
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !270, metadata !74) #3, !dbg !272
  tail call void @llvm.dbg.value(metadata i32** %1, i64 0, metadata !273, metadata !74) #3, !dbg !274
  %arrayidx.i70 = getelementptr inbounds i8* %call.i23, i64 72, !dbg !275
  %92 = bitcast i8* %arrayidx.i70 to i8**, !dbg !275
  %93 = load i8** %92, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %93) #3, !dbg !276
  %arrayidx.i70.1 = getelementptr inbounds i8* %call.i23, i64 64, !dbg !275
  %94 = bitcast i8* %arrayidx.i70.1 to i8**, !dbg !275
  %95 = load i8** %94, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %95) #3, !dbg !276
  %arrayidx.i70.2 = getelementptr inbounds i8* %call.i23, i64 56, !dbg !275
  %96 = bitcast i8* %arrayidx.i70.2 to i8**, !dbg !275
  %97 = load i8** %96, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %97) #3, !dbg !276
  %arrayidx.i70.3 = getelementptr inbounds i8* %call.i23, i64 48, !dbg !275
  %98 = bitcast i8* %arrayidx.i70.3 to i8**, !dbg !275
  %99 = load i8** %98, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %99) #3, !dbg !276
  %arrayidx.i70.4 = getelementptr inbounds i8* %call.i23, i64 40, !dbg !275
  %100 = bitcast i8* %arrayidx.i70.4 to i8**, !dbg !275
  %101 = load i8** %100, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %101) #3, !dbg !276
  %arrayidx.i70.5 = getelementptr inbounds i8* %call.i23, i64 32, !dbg !275
  %102 = bitcast i8* %arrayidx.i70.5 to i8**, !dbg !275
  %103 = load i8** %102, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %103) #3, !dbg !276
  %arrayidx.i70.6 = getelementptr inbounds i8* %call.i23, i64 24, !dbg !275
  %104 = bitcast i8* %arrayidx.i70.6 to i8**, !dbg !275
  %105 = load i8** %104, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %105) #3, !dbg !276
  %arrayidx.i70.7 = getelementptr inbounds i8* %call.i23, i64 16, !dbg !275
  %106 = bitcast i8* %arrayidx.i70.7 to i8**, !dbg !275
  %107 = load i8** %106, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %107) #3, !dbg !276
  %arrayidx.i70.8 = getelementptr inbounds i8* %call.i23, i64 8, !dbg !275
  %108 = bitcast i8* %arrayidx.i70.8 to i8**, !dbg !275
  %109 = load i8** %108, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %109) #3, !dbg !276
  %110 = bitcast i8* %call.i23 to i8**, !dbg !275
  %111 = load i8** %110, align 8, !dbg !275, !tbaa !94
  tail call void @free(i8* %111) #3, !dbg !276
  tail call void @free(i8* %call.i23) #3, !dbg !277
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !278, metadata !74) #3, !dbg !279
  tail call void @llvm.dbg.value(metadata i32** %14, i64 0, metadata !280, metadata !74) #3, !dbg !281
  %112 = bitcast i32** %arrayidx.i73.pre-phi to i8**, !dbg !250
  %113 = load i8** %112, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %113) #3, !dbg !282
  %114 = bitcast i32** %arrayidx.i73.1.pre-phi to i8**, !dbg !250
  %115 = load i8** %114, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %115) #3, !dbg !282
  %116 = bitcast i32** %arrayidx.i73.2.pre-phi to i8**, !dbg !250
  %117 = load i8** %116, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %117) #3, !dbg !282
  %118 = bitcast i32** %arrayidx.i73.3.pre-phi to i8**, !dbg !250
  %119 = load i8** %118, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %119) #3, !dbg !282
  %120 = bitcast i32** %arrayidx.i73.4.pre-phi to i8**, !dbg !250
  %121 = load i8** %120, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %121) #3, !dbg !282
  %122 = bitcast i32** %arrayidx.i73.5.pre-phi to i8**, !dbg !250
  %123 = load i8** %122, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %123) #3, !dbg !282
  %124 = bitcast i32** %arrayidx.i73.6.pre-phi to i8**, !dbg !250
  %125 = load i8** %124, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %125) #3, !dbg !282
  %126 = bitcast i32** %arrayidx.i73.7.pre-phi to i8**, !dbg !250
  %127 = load i8** %126, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %127) #3, !dbg !282
  %128 = bitcast i32** %arrayidx.i73.8.pre-phi to i8**, !dbg !250
  %129 = load i8** %128, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %129) #3, !dbg !282
  %130 = bitcast i8* %call.i24 to i8**, !dbg !250
  %131 = load i8** %130, align 8, !dbg !250, !tbaa !94
  tail call void @free(i8* %131) #3, !dbg !282
  tail call void @free(i8* %call.i24) #3, !dbg !283
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !284, metadata !74) #3, !dbg !286
  tail call void @llvm.dbg.value(metadata i32** %27, i64 0, metadata !287, metadata !74) #3, !dbg !288
  %arrayidx.i79 = getelementptr inbounds i8* %call.i43, i64 72, !dbg !289
  %132 = bitcast i8* %arrayidx.i79 to i8**, !dbg !289
  %133 = load i8** %132, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %133) #3, !dbg !290
  %arrayidx.i79.1 = getelementptr inbounds i8* %call.i43, i64 64, !dbg !289
  %134 = bitcast i8* %arrayidx.i79.1 to i8**, !dbg !289
  %135 = load i8** %134, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %135) #3, !dbg !290
  %arrayidx.i79.2 = getelementptr inbounds i8* %call.i43, i64 56, !dbg !289
  %136 = bitcast i8* %arrayidx.i79.2 to i8**, !dbg !289
  %137 = load i8** %136, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %137) #3, !dbg !290
  %arrayidx.i79.3 = getelementptr inbounds i8* %call.i43, i64 48, !dbg !289
  %138 = bitcast i8* %arrayidx.i79.3 to i8**, !dbg !289
  %139 = load i8** %138, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %139) #3, !dbg !290
  %arrayidx.i79.4 = getelementptr inbounds i8* %call.i43, i64 40, !dbg !289
  %140 = bitcast i8* %arrayidx.i79.4 to i8**, !dbg !289
  %141 = load i8** %140, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %141) #3, !dbg !290
  %arrayidx.i79.5 = getelementptr inbounds i8* %call.i43, i64 32, !dbg !289
  %142 = bitcast i8* %arrayidx.i79.5 to i8**, !dbg !289
  %143 = load i8** %142, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %143) #3, !dbg !290
  %arrayidx.i79.6 = getelementptr inbounds i8* %call.i43, i64 24, !dbg !289
  %144 = bitcast i8* %arrayidx.i79.6 to i8**, !dbg !289
  %145 = load i8** %144, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %145) #3, !dbg !290
  %arrayidx.i79.7 = getelementptr inbounds i8* %call.i43, i64 16, !dbg !289
  %146 = bitcast i8* %arrayidx.i79.7 to i8**, !dbg !289
  %147 = load i8** %146, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %147) #3, !dbg !290
  %arrayidx.i79.8 = getelementptr inbounds i8* %call.i43, i64 8, !dbg !289
  %148 = bitcast i8* %arrayidx.i79.8 to i8**, !dbg !289
  %149 = load i8** %148, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %149) #3, !dbg !290
  %150 = bitcast i8* %call.i43 to i8**, !dbg !289
  %151 = load i8** %150, align 8, !dbg !289, !tbaa !94
  tail call void @free(i8* %151) #3, !dbg !290
  tail call void @free(i8* %call.i43) #3, !dbg !291
  ret i32 0, !dbg !292
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
!92 = !MDLocation(line: 16, column: 17, scope: !88)
!93 = !MDLocation(line: 16, column: 2, scope: !88)
!94 = !{!95, !95, i64 0}
!95 = !{!"any pointer", !96, i64 0}
!96 = !{!"omnipotent char", !97, i64 0}
!97 = !{!"Simple C/C++ TBAA"}
!98 = !MDLocation(line: 13, column: 12, scope: !12)
!99 = !MDLocation(line: 17, column: 2, scope: !91)
!100 = !MDLocation(line: 18, column: 6, scope: !101)
!101 = !{!"0xb\0017\0025\005", !1, !90}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!102 = !{!103, !103, i64 0}
!103 = !{!"int", !96, i64 0}
!104 = distinct !{!104, !105}
!105 = !{!"llvm.loop.unroll.disable"}
!106 = distinct !{!106, !107, !108}
!107 = !{!"llvm.loop.vectorize.width", i32 1}
!108 = !{!"llvm.loop.interleave.count", i32 1}
!109 = !MDLocation(line: 18, column: 16, scope: !101)
!110 = distinct !{!110, !105}
!111 = distinct !{!111, !107, !108}
!112 = !MDLocation(line: 21, column: 5, scope: !12)
!113 = !MDLocation(line: 24, column: 21, scope: !23)
!114 = !MDLocation(line: 24, column: 31, scope: !23)
!115 = !MDLocation(line: 24, column: 43, scope: !23)
!116 = !MDLocation(line: 25, column: 9, scope: !23)
!117 = !MDLocation(line: 26, column: 15, scope: !118)
!118 = !{!"0xb\0026\005\007", !1, !119}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!119 = !{!"0xb\0026\005\006", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!120 = !MDLocation(line: 26, column: 5, scope: !119)
!121 = !MDLocation(line: 27, column: 12, scope: !122)
!122 = !{!"0xb\0027\002\009", !1, !123}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!123 = !{!"0xb\0027\002\008", !1, !118}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!124 = !MDLocation(line: 27, column: 2, scope: !123)
!125 = !MDLocation(line: 28, column: 6, scope: !122)
!126 = distinct !{!126, !105}
!127 = !MDLocation(line: 29, column: 1, scope: !23)
!128 = !MDLocation(line: 31, column: 21, scope: !32)
!129 = !MDLocation(line: 31, column: 33, scope: !32)
!130 = !MDLocation(line: 32, column: 12, scope: !131)
!131 = !{!"0xb\003", !1, !132}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!132 = !{!"0xb\001", !1, !32}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!133 = !MDLocation(line: 32, column: 5, scope: !32)
!134 = !MDLocation(line: 32, column: 32, scope: !135)
!135 = !{!"0xb\0032\0025\0010", !1, !32}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!136 = !MDLocation(line: 32, column: 27, scope: !135)
!137 = !MDLocation(line: 33, column: 10, scope: !32)
!138 = !MDLocation(line: 33, column: 5, scope: !32)
!139 = !MDLocation(line: 34, column: 1, scope: !32)
!140 = !MDLocation(line: 36, column: 17, scope: !38)
!141 = !MDLocation(line: 36, column: 27, scope: !38)
!142 = !MDLocation(line: 36, column: 39, scope: !38)
!143 = !MDLocation(line: 36, column: 49, scope: !38)
!144 = !MDLocation(line: 36, column: 59, scope: !38)
!145 = !MDLocation(line: 37, column: 9, scope: !38)
!146 = !MDLocation(line: 38, column: 15, scope: !147)
!147 = !{!"0xb\0038\005\0012", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!148 = !{!"0xb\0038\005\0011", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!149 = !MDLocation(line: 38, column: 5, scope: !148)
!150 = !MDLocation(line: 39, column: 12, scope: !151)
!151 = !{!"0xb\0039\002\0015", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!152 = !{!"0xb\0039\002\0014", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!153 = !{!"0xb\0038\0028\0013", !1, !147}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!154 = !MDLocation(line: 39, column: 2, scope: !152)
!155 = !MDLocation(line: 44, column: 6, scope: !156)
!156 = !{!"0xb\0039\0025\0016", !1, !151}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!157 = !MDLocation(line: 42, column: 10, scope: !158)
!158 = !{!"0xb\0041\0029\0019", !1, !159}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!159 = !{!"0xb\0041\006\0018", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!160 = !{!"0xb\0041\006\0017", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!161 = !MDLocation(line: 41, column: 6, scope: !160)
!162 = !MDLocation(line: 42, column: 21, scope: !158)
!163 = !MDLocation(line: 42, column: 3, scope: !158)
!164 = distinct !{!164, !107, !108}
!165 = !MDLocation(line: 37, column: 18, scope: !38)
!166 = distinct !{!166, !105}
!167 = distinct !{!167, !107, !108}
!168 = !MDLocation(line: 47, column: 5, scope: !38)
!169 = !MDLocation(line: 50, column: 14, scope: !51)
!170 = !MDLocation(line: 50, column: 26, scope: !51)
!171 = !MDLocation(line: 56, column: 18, scope: !51)
!172 = !MDLocation(line: 56, column: 17, scope: !51)
!173 = !MDLocation(line: 56, column: 36, scope: !174)
!174 = !{!"0xb\001", !1, !51}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!175 = !{!"0x101\00__nptr\0016777494\000", !62, !64, !67, !176} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!176 = !MDLocation(line: 56, column: 31, scope: !51)
!177 = !MDLocation(line: 278, column: 1, scope: !62, inlinedAt: !176)
!178 = !MDLocation(line: 280, column: 16, scope: !62, inlinedAt: !176)
!179 = !MDLocation(line: 280, column: 10, scope: !62, inlinedAt: !176)
!180 = !MDLocation(line: 56, column: 12, scope: !51)
!181 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !182} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!182 = !MDLocation(line: 58, column: 16, scope: !51)
!183 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !182)
!184 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !182} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!185 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !182)
!186 = !{!"0x100\00count\0013\000", !12, !13, !6, !182} ; [ DW_TAG_auto_variable ] [count] [line 13]
!187 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !182)
!188 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !182)
!189 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !182)
!190 = !{!"0x100\00m\0014\000", !12, !13, !4, !182} ; [ DW_TAG_auto_variable ] [m] [line 14]
!191 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !182)
!192 = !{!"0x100\00i\0013\000", !12, !13, !6, !182} ; [ DW_TAG_auto_variable ] [i] [line 13]
!193 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !182)
!194 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !182)
!195 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !182)
!196 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !182)
!197 = !{!"0x100\00j\0013\000", !12, !13, !6, !182} ; [ DW_TAG_auto_variable ] [j] [line 13]
!198 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !182)
!199 = !MDLocation(line: 18, column: 6, scope: !101, inlinedAt: !182)
!200 = !MDLocation(line: 18, column: 16, scope: !101, inlinedAt: !182)
!201 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !182)
!202 = !MDLocation(line: 58, column: 11, scope: !51)
!203 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !204} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!204 = !MDLocation(line: 59, column: 16, scope: !51)
!205 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !204)
!206 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !204} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!207 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !204)
!208 = !{!"0x100\00count\0013\000", !12, !13, !6, !204} ; [ DW_TAG_auto_variable ] [count] [line 13]
!209 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !204)
!210 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !204)
!211 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !204)
!212 = !{!"0x100\00m\0014\000", !12, !13, !4, !204} ; [ DW_TAG_auto_variable ] [m] [line 14]
!213 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !204)
!214 = !{!"0x100\00i\0013\000", !12, !13, !6, !204} ; [ DW_TAG_auto_variable ] [i] [line 13]
!215 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !204)
!216 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !204)
!217 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !204)
!218 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !204)
!219 = !{!"0x100\00j\0013\000", !12, !13, !6, !204} ; [ DW_TAG_auto_variable ] [j] [line 13]
!220 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !204)
!221 = !MDLocation(line: 18, column: 6, scope: !101, inlinedAt: !204)
!222 = !MDLocation(line: 18, column: 16, scope: !101, inlinedAt: !204)
!223 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !204)
!224 = !MDLocation(line: 59, column: 11, scope: !51)
!225 = !{!"0x101\00rows\0016777228\000", !12, !13, !6, !226} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!226 = !MDLocation(line: 60, column: 16, scope: !51)
!227 = !MDLocation(line: 12, column: 20, scope: !12, inlinedAt: !226)
!228 = !{!"0x101\00cols\0033554444\000", !12, !13, !6, !226} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!229 = !MDLocation(line: 12, column: 30, scope: !12, inlinedAt: !226)
!230 = !{!"0x100\00count\0013\000", !12, !13, !6, !226} ; [ DW_TAG_auto_variable ] [count] [line 13]
!231 = !MDLocation(line: 13, column: 15, scope: !12, inlinedAt: !226)
!232 = !MDLocation(line: 14, column: 24, scope: !12, inlinedAt: !226)
!233 = !MDLocation(line: 14, column: 15, scope: !12, inlinedAt: !226)
!234 = !{!"0x100\00m\0014\000", !12, !13, !4, !226} ; [ DW_TAG_auto_variable ] [m] [line 14]
!235 = !MDLocation(line: 14, column: 11, scope: !12, inlinedAt: !226)
!236 = !{!"0x100\00i\0013\000", !12, !13, !6, !226} ; [ DW_TAG_auto_variable ] [i] [line 13]
!237 = !MDLocation(line: 13, column: 9, scope: !12, inlinedAt: !226)
!238 = !MDLocation(line: 15, column: 5, scope: !85, inlinedAt: !226)
!239 = !MDLocation(line: 16, column: 17, scope: !88, inlinedAt: !226)
!240 = !MDLocation(line: 16, column: 2, scope: !88, inlinedAt: !226)
!241 = !{!"0x100\00j\0013\000", !12, !13, !6, !226} ; [ DW_TAG_auto_variable ] [j] [line 13]
!242 = !MDLocation(line: 13, column: 12, scope: !12, inlinedAt: !226)
!243 = !MDLocation(line: 18, column: 6, scope: !101, inlinedAt: !226)
!244 = !MDLocation(line: 18, column: 16, scope: !101, inlinedAt: !226)
!245 = !MDLocation(line: 17, column: 2, scope: !91, inlinedAt: !226)
!246 = !MDLocation(line: 62, column: 15, scope: !247)
!247 = !{!"0xb\0062\005\0021", !1, !248}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!248 = !{!"0xb\0062\005\0020", !1, !51}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!249 = !MDLocation(line: 62, column: 5, scope: !248)
!250 = !MDLocation(line: 32, column: 32, scope: !135, inlinedAt: !251)
!251 = !MDLocation(line: 68, column: 5, scope: !51)
!252 = !MDLocation(line: 44, column: 6, scope: !156, inlinedAt: !253)
!253 = !MDLocation(line: 63, column: 7, scope: !254)
!254 = !{!"0xb\0062\0025\0022", !1, !247}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/matrix.c]
!255 = !MDLocation(line: 42, column: 10, scope: !158, inlinedAt: !253)
!256 = !MDLocation(line: 42, column: 21, scope: !158, inlinedAt: !253)
!257 = !MDLocation(line: 39, column: 2, scope: !152, inlinedAt: !253)
!258 = !{!"0x100\00val\0037\000", !38, !13, !6, !253} ; [ DW_TAG_auto_variable ] [val] [line 37]
!259 = !MDLocation(line: 37, column: 18, scope: !38, inlinedAt: !253)
!260 = !MDLocation(line: 42, column: 3, scope: !158, inlinedAt: !253)
!261 = !MDLocation(line: 38, column: 5, scope: !148, inlinedAt: !253)
!262 = !MDLocation(line: 60, column: 11, scope: !51)
!263 = !MDLocation(line: 62, column: 20, scope: !247)
!264 = !MDLocation(line: 56, column: 9, scope: !51)
!265 = !MDLocation(line: 65, column: 29, scope: !51)
!266 = !MDLocation(line: 65, column: 39, scope: !51)
!267 = !MDLocation(line: 65, column: 49, scope: !51)
!268 = !MDLocation(line: 65, column: 59, scope: !51)
!269 = !MDLocation(line: 65, column: 5, scope: !51)
!270 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !271} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!271 = !MDLocation(line: 67, column: 5, scope: !51)
!272 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !271)
!273 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !271} ; [ DW_TAG_arg_variable ] [m] [line 31]
!274 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !271)
!275 = !MDLocation(line: 32, column: 32, scope: !135, inlinedAt: !271)
!276 = !MDLocation(line: 32, column: 27, scope: !135, inlinedAt: !271)
!277 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !271)
!278 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !251} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!279 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !251)
!280 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !251} ; [ DW_TAG_arg_variable ] [m] [line 31]
!281 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !251)
!282 = !MDLocation(line: 32, column: 27, scope: !135, inlinedAt: !251)
!283 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !251)
!284 = !{!"0x101\00rows\0016777247\000", !32, !13, !6, !285} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!285 = !MDLocation(line: 69, column: 5, scope: !51)
!286 = !MDLocation(line: 31, column: 21, scope: !32, inlinedAt: !285)
!287 = !{!"0x101\00m\0033554463\000", !32, !13, !4, !285} ; [ DW_TAG_arg_variable ] [m] [line 31]
!288 = !MDLocation(line: 31, column: 33, scope: !32, inlinedAt: !285)
!289 = !MDLocation(line: 32, column: 32, scope: !135, inlinedAt: !285)
!290 = !MDLocation(line: 32, column: 27, scope: !135, inlinedAt: !285)
!291 = !MDLocation(line: 33, column: 5, scope: !32, inlinedAt: !285)
!292 = !MDLocation(line: 70, column: 5, scope: !51)
