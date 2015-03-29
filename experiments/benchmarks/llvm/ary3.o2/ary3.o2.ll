; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !16, metadata !35), !dbg !36
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !17, metadata !35), !dbg !37
  %cmp = icmp eq i32 %argc, 2, !dbg !38
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !39

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !40
  %0 = load i8** %arrayidx, align 8, !dbg !40, !tbaa !42
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !46, metadata !35) #3, !dbg !48
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !49
  %conv.i = trunc i64 %call.i to i32, !dbg !50
  br label %cond.end, !dbg !39

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 1500000, %entry ], !dbg !39
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !18, metadata !35), !dbg !51
  %conv = sext i32 %cond to i64, !dbg !52
  %call1 = tail call noalias i8* @calloc(i64 %conv, i64 4) #3, !dbg !53
  %1 = bitcast i8* %call1 to i32*, !dbg !54
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !21, metadata !35), !dbg !55
  %call3 = tail call noalias i8* @calloc(i64 %conv, i64 4) #3, !dbg !56
  %2 = bitcast i8* %call3 to i32*, !dbg !57
  tail call void @llvm.dbg.value(metadata i32* %2, i64 0, metadata !22, metadata !35), !dbg !58
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !35), !dbg !59
  %cmp451 = icmp sgt i32 %cond, 0, !dbg !60
  br i1 %cmp451, label %for.body.lr.ph, label %for.cond11.preheader.preheader, !dbg !63

for.body.lr.ph:                                   ; preds = %cond.end
  %3 = add i32 %cond, -1, !dbg !63
  %4 = zext i32 %3 to i64
  %5 = add nuw nsw i64 %4, 1, !dbg !63
  %end.idx = add nuw nsw i64 %4, 1, !dbg !63
  %n.vec = and i64 %5, 8589934588, !dbg !63
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !63
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body.lr.ph
  %6 = add i32 %cond, -1
  %7 = zext i32 %6 to i64
  %8 = add i64 %7, 1
  %9 = lshr i64 %8, 2
  %10 = mul i64 %9, 4
  %11 = add i64 %10, -4
  %12 = lshr i64 %11, 2
  %13 = add i64 %12, 1
  %xtraiter106 = and i64 %13, 1
  %lcmp.mod107 = icmp ne i64 %xtraiter106, 0
  %lcmp.overflow108 = icmp eq i64 %13, 0
  %lcmp.or109 = or i1 %lcmp.overflow108, %lcmp.mod107
  br i1 %lcmp.or109, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !63
  %prol.iter110 = phi i64 [ %xtraiter106, %vector.body.preheader ], [ %prol.iter110.sub, %vector.body.prol ]
  %broadcast.splatinsert.prol = insertelement <2 x i64> undef, i64 %index.prol, i32 0
  %broadcast.splat.prol = shufflevector <2 x i64> %broadcast.splatinsert.prol, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = add <2 x i64> %broadcast.splat.prol, <i64 1, i64 2>, !dbg !63
  %15 = add <2 x i64> %broadcast.splat.prol, <i64 3, i64 4>, !dbg !63
  %16 = getelementptr inbounds i32* %1, i64 %index.prol, !dbg !64
  %17 = trunc <2 x i64> %14 to <2 x i32>, !dbg !64
  %18 = trunc <2 x i64> %15 to <2 x i32>, !dbg !64
  %19 = bitcast i32* %16 to <2 x i32>*, !dbg !64
  store <2 x i32> %17, <2 x i32>* %19, align 4, !dbg !64, !tbaa !66
  %.sum9798.prol = or i64 %index.prol, 2, !dbg !64
  %20 = getelementptr i32* %1, i64 %.sum9798.prol, !dbg !64
  %21 = bitcast i32* %20 to <2 x i32>*, !dbg !64
  store <2 x i32> %18, <2 x i32>* %21, align 4, !dbg !64, !tbaa !66
  %index.next.prol = add i64 %index.prol, 4, !dbg !63
  %22 = icmp eq i64 %index.next.prol, %n.vec, !dbg !63
  %prol.iter110.sub = sub i64 %prol.iter110, 1, !dbg !63
  %prol.iter110.cmp = icmp ne i64 %prol.iter110.sub, 0, !dbg !63
  br i1 %prol.iter110.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !68

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %23 = icmp ult i64 %13, 2
  br i1 %23, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !63
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %24 = add <2 x i64> %broadcast.splat, <i64 1, i64 2>, !dbg !63
  %25 = add <2 x i64> %broadcast.splat, <i64 3, i64 4>, !dbg !63
  %26 = getelementptr inbounds i32* %1, i64 %index, !dbg !64
  %27 = trunc <2 x i64> %24 to <2 x i32>, !dbg !64
  %28 = trunc <2 x i64> %25 to <2 x i32>, !dbg !64
  %29 = bitcast i32* %26 to <2 x i32>*, !dbg !64
  store <2 x i32> %27, <2 x i32>* %29, align 4, !dbg !64, !tbaa !66
  %.sum9798 = or i64 %index, 2, !dbg !64
  %30 = getelementptr i32* %1, i64 %.sum9798, !dbg !64
  %31 = bitcast i32* %30 to <2 x i32>*, !dbg !64
  store <2 x i32> %28, <2 x i32>* %31, align 4, !dbg !64, !tbaa !66
  %index.next = add i64 %index, 4, !dbg !63
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = add <2 x i64> %broadcast.splat.1, <i64 1, i64 2>, !dbg !63
  %33 = add <2 x i64> %broadcast.splat.1, <i64 3, i64 4>, !dbg !63
  %34 = getelementptr inbounds i32* %1, i64 %index.next, !dbg !64
  %35 = trunc <2 x i64> %32 to <2 x i32>, !dbg !64
  %36 = trunc <2 x i64> %33 to <2 x i32>, !dbg !64
  %37 = bitcast i32* %34 to <2 x i32>*, !dbg !64
  store <2 x i32> %35, <2 x i32>* %37, align 4, !dbg !64, !tbaa !66
  %.sum9798.1 = or i64 %index.next, 2, !dbg !64
  %38 = getelementptr i32* %1, i64 %.sum9798.1, !dbg !64
  %39 = bitcast i32* %38 to <2 x i32>*, !dbg !64
  store <2 x i32> %36, <2 x i32>* %39, align 4, !dbg !64, !tbaa !66
  %index.next.1 = add i64 %index.next, 4, !dbg !63
  %40 = icmp eq i64 %index.next.1, %n.vec, !dbg !63
  br i1 %40, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !63, !llvm.loop !70

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond11.preheader.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %41 = trunc i64 %resume.val to i32
  %42 = sub i32 %cond, %41
  %xtraiter101 = and i32 %42, 7
  %lcmp.mod102 = icmp ne i32 %xtraiter101, 0
  %lcmp.overflow103 = icmp eq i32 %42, 0
  %lcmp.or104 = or i1 %lcmp.overflow103, %lcmp.mod102
  br i1 %lcmp.or104, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %for.body.prol ], [ %resume.val, %for.body.preheader ]
  %prol.iter105 = phi i32 [ %xtraiter101, %for.body.preheader ], [ %prol.iter105.sub, %for.body.prol ]
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1, !dbg !63
  %arrayidx6.prol = getelementptr inbounds i32* %1, i64 %indvars.iv53.prol, !dbg !64
  %43 = trunc i64 %indvars.iv.next54.prol to i32, !dbg !64
  store i32 %43, i32* %arrayidx6.prol, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.prol = trunc i64 %indvars.iv53.prol to i32, !dbg !63
  %exitcond55.prol = icmp eq i32 %lftr.wideiv.prol, %3, !dbg !63
  %prol.iter105.sub = sub i32 %prol.iter105, 1, !dbg !63
  %prol.iter105.cmp = icmp ne i32 %prol.iter105.sub, 0, !dbg !63
  br i1 %prol.iter105.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !73

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv53.unr = phi i64 [ %resume.val, %for.body.preheader ], [ %indvars.iv.next54.prol, %for.body.prol ]
  %44 = icmp ult i32 %42, 8
  br i1 %44, label %for.cond11.preheader.preheader.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !63

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %for.body.preheader.split.split ], [ %indvars.iv.next54.7, %for.body ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1, !dbg !63
  %arrayidx6 = getelementptr inbounds i32* %1, i64 %indvars.iv53, !dbg !64
  %45 = trunc i64 %indvars.iv.next54 to i32, !dbg !64
  store i32 %45, i32* %arrayidx6, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv = trunc i64 %indvars.iv53 to i32, !dbg !63
  %indvars.iv.next54.1 = add nuw nsw i64 %indvars.iv.next54, 1, !dbg !63
  %arrayidx6.1 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54, !dbg !64
  %46 = trunc i64 %indvars.iv.next54.1 to i32, !dbg !64
  store i32 %46, i32* %arrayidx6.1, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next54 to i32, !dbg !63
  %indvars.iv.next54.2 = add nuw nsw i64 %indvars.iv.next54.1, 1, !dbg !63
  %arrayidx6.2 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.1, !dbg !64
  %47 = trunc i64 %indvars.iv.next54.2 to i32, !dbg !64
  store i32 %47, i32* %arrayidx6.2, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next54.1 to i32, !dbg !63
  %indvars.iv.next54.3 = add nuw nsw i64 %indvars.iv.next54.2, 1, !dbg !63
  %arrayidx6.3 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.2, !dbg !64
  %48 = trunc i64 %indvars.iv.next54.3 to i32, !dbg !64
  store i32 %48, i32* %arrayidx6.3, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next54.2 to i32, !dbg !63
  %indvars.iv.next54.4 = add nuw nsw i64 %indvars.iv.next54.3, 1, !dbg !63
  %arrayidx6.4 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.3, !dbg !64
  %49 = trunc i64 %indvars.iv.next54.4 to i32, !dbg !64
  store i32 %49, i32* %arrayidx6.4, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.4 = trunc i64 %indvars.iv.next54.3 to i32, !dbg !63
  %indvars.iv.next54.5 = add nuw nsw i64 %indvars.iv.next54.4, 1, !dbg !63
  %arrayidx6.5 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.4, !dbg !64
  %50 = trunc i64 %indvars.iv.next54.5 to i32, !dbg !64
  store i32 %50, i32* %arrayidx6.5, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.5 = trunc i64 %indvars.iv.next54.4 to i32, !dbg !63
  %indvars.iv.next54.6 = add nuw nsw i64 %indvars.iv.next54.5, 1, !dbg !63
  %arrayidx6.6 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.5, !dbg !64
  %51 = trunc i64 %indvars.iv.next54.6 to i32, !dbg !64
  store i32 %51, i32* %arrayidx6.6, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.6 = trunc i64 %indvars.iv.next54.5 to i32, !dbg !63
  %indvars.iv.next54.7 = add nuw nsw i64 %indvars.iv.next54.6, 1, !dbg !63
  %arrayidx6.7 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.6, !dbg !64
  %52 = trunc i64 %indvars.iv.next54.7 to i32, !dbg !64
  store i32 %52, i32* %arrayidx6.7, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next54.6 to i32, !dbg !63
  %exitcond55.7 = icmp eq i32 %lftr.wideiv.7, %3, !dbg !63
  br i1 %exitcond55.7, label %for.cond11.preheader.preheader.loopexit.unr-lcssa, label %for.body, !dbg !63, !llvm.loop !74

for.cond11.preheader.preheader.loopexit.unr-lcssa: ; preds = %for.body
  br label %for.cond11.preheader.preheader.loopexit

for.cond11.preheader.preheader.loopexit:          ; preds = %for.body.preheader.split, %for.cond11.preheader.preheader.loopexit.unr-lcssa
  br label %for.cond11.preheader.preheader

for.cond11.preheader.preheader:                   ; preds = %for.cond11.preheader.preheader.loopexit, %middle.block, %cond.end
  %53 = sext i32 %cond to i64
  %54 = xor i64 %53, -1, !dbg !75
  %55 = icmp sgt i64 %54, -2
  %smax = select i1 %55, i64 %54, i64 -2
  %56 = add nsw i64 %smax, %53, !dbg !75
  %57 = add nsw i64 %56, 2, !dbg !75
  br label %for.cond11.preheader, !dbg !75

for.cond11.preheader:                             ; preds = %for.cond11.preheader.preheader, %for.inc22
  %k.050 = phi i32 [ %inc23, %for.inc22 ], [ 0, %for.cond11.preheader.preheader ]
  br i1 %cmp451, label %for.body14.preheader, label %for.inc22, !dbg !75

for.body14.preheader:                             ; preds = %for.cond11.preheader
  %backedge.overflow63 = icmp eq i64 %56, -2
  br i1 %backedge.overflow63, label %for.body14.preheader99, label %overflow.checked75

overflow.checked75:                               ; preds = %for.body14.preheader
  %end.idx70 = add nsw i64 %56, 2
  %n.vec72 = and i64 %57, -8
  %cmp.zero74 = icmp eq i64 %n.vec72, 0
  %rev.ind.end = sub nsw i64 %conv, %n.vec72
  br i1 %cmp.zero74, label %middle.block67, label %vector.body66.preheader

vector.body66.preheader:                          ; preds = %overflow.checked75
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66.preheader, %vector.body66
  %index69 = phi i64 [ %index.next79, %vector.body66 ], [ 0, %vector.body66.preheader ]
  %reverse.idx = sub i64 %conv, %index69
  %.sum = add i64 %reverse.idx, -4, !dbg !80
  %58 = getelementptr i32* %1, i64 %.sum, !dbg !80
  %59 = bitcast i32* %58 to <4 x i32>*, !dbg !80
  %wide.load = load <4 x i32>* %59, align 4, !dbg !80, !tbaa !66
  %.sum93 = add i64 %reverse.idx, -8, !dbg !80
  %60 = getelementptr i32* %1, i64 %.sum93, !dbg !80
  %61 = bitcast i32* %60 to <4 x i32>*, !dbg !80
  %wide.load84 = load <4 x i32>* %61, align 4, !dbg !80, !tbaa !66
  %.sum94 = add i64 %reverse.idx, -4, !dbg !83
  %62 = getelementptr i32* %2, i64 %.sum94, !dbg !83
  %63 = bitcast i32* %62 to <4 x i32>*, !dbg !83
  %wide.load86 = load <4 x i32>* %63, align 4, !dbg !83, !tbaa !66
  %.sum96 = add i64 %reverse.idx, -8, !dbg !83
  %64 = getelementptr i32* %2, i64 %.sum96, !dbg !83
  %65 = bitcast i32* %64 to <4 x i32>*, !dbg !83
  %wide.load88 = load <4 x i32>* %65, align 4, !dbg !83, !tbaa !66
  %66 = add nsw <4 x i32> %wide.load86, %wide.load, !dbg !83
  %67 = add nsw <4 x i32> %wide.load88, %wide.load84, !dbg !83
  %68 = bitcast i32* %62 to <4 x i32>*, !dbg !83
  store <4 x i32> %66, <4 x i32>* %68, align 4, !dbg !83, !tbaa !66
  %69 = bitcast i32* %64 to <4 x i32>*, !dbg !83
  store <4 x i32> %67, <4 x i32>* %69, align 4, !dbg !83, !tbaa !66
  %index.next79 = add i64 %index69, 8
  %70 = icmp eq i64 %index.next79, %n.vec72
  br i1 %70, label %middle.block67.loopexit, label %vector.body66, !llvm.loop !84

middle.block67.loopexit:                          ; preds = %vector.body66
  br label %middle.block67

middle.block67:                                   ; preds = %middle.block67.loopexit, %overflow.checked75
  %resume.val76 = phi i64 [ %conv, %overflow.checked75 ], [ %rev.ind.end, %middle.block67.loopexit ]
  %new.indc.resume.val = phi i64 [ 0, %overflow.checked75 ], [ %n.vec72, %middle.block67.loopexit ]
  %cmp.n78 = icmp eq i64 %end.idx70, %new.indc.resume.val
  br i1 %cmp.n78, label %for.inc22, label %for.body14.preheader99

for.body14.preheader99:                           ; preds = %middle.block67, %for.body14.preheader
  %indvars.iv.ph = phi i64 [ %conv, %for.body14.preheader ], [ %resume.val76, %middle.block67 ]
  %71 = add i64 %indvars.iv.ph, 2
  %72 = sub i64 -1, %indvars.iv.ph
  %73 = icmp sgt i64 %72, -2
  %smax100 = select i1 %73, i64 %72, i64 -2
  %74 = add i64 %71, %smax100
  %xtraiter = and i64 %74, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %74, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body14.prol.preheader, label %for.body14.preheader99.split

for.body14.prol.preheader:                        ; preds = %for.body14.preheader99
  br label %for.body14.prol, !dbg !75

for.body14.prol:                                  ; preds = %for.body14.prol.preheader, %for.body14.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body14.prol ], [ %indvars.iv.ph, %for.body14.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body14.prol ], [ %xtraiter, %for.body14.prol.preheader ]
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, -1, !dbg !75
  %arrayidx16.prol = getelementptr inbounds i32* %1, i64 %indvars.iv.next.prol, !dbg !80
  %75 = load i32* %arrayidx16.prol, align 4, !dbg !80, !tbaa !66
  %arrayidx18.prol = getelementptr inbounds i32* %2, i64 %indvars.iv.next.prol, !dbg !83
  %76 = load i32* %arrayidx18.prol, align 4, !dbg !83, !tbaa !66
  %add19.prol = add nsw i32 %76, %75, !dbg !83
  store i32 %add19.prol, i32* %arrayidx18.prol, align 4, !dbg !83, !tbaa !66
  %cmp12.prol = icmp sgt i64 %indvars.iv.prol, 1, !dbg !85
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !75
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !75
  br i1 %prol.iter.cmp, label %for.body14.prol, label %for.body14.preheader99.split.loopexit, !llvm.loop !88

for.body14.preheader99.split.loopexit:            ; preds = %for.body14.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body14.prol ]
  br label %for.body14.preheader99.split

for.body14.preheader99.split:                     ; preds = %for.body14.preheader99.split.loopexit, %for.body14.preheader99
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body14.preheader99 ], [ %indvars.iv.unr.ph, %for.body14.preheader99.split.loopexit ]
  %77 = icmp ult i64 %74, 2
  br i1 %77, label %for.inc22.loopexit, label %for.body14.preheader99.split.split

for.body14.preheader99.split.split:               ; preds = %for.body14.preheader99.split
  br label %for.body14, !dbg !75

for.body14:                                       ; preds = %for.body14, %for.body14.preheader99.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body14.preheader99.split.split ], [ %indvars.iv.next.1, %for.body14 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !75
  %arrayidx16 = getelementptr inbounds i32* %1, i64 %indvars.iv.next, !dbg !80
  %78 = load i32* %arrayidx16, align 4, !dbg !80, !tbaa !66
  %arrayidx18 = getelementptr inbounds i32* %2, i64 %indvars.iv.next, !dbg !83
  %79 = load i32* %arrayidx18, align 4, !dbg !83, !tbaa !66
  %add19 = add nsw i32 %79, %78, !dbg !83
  store i32 %add19, i32* %arrayidx18, align 4, !dbg !83, !tbaa !66
  %indvars.iv.next.1 = add nsw i64 %indvars.iv.next, -1, !dbg !75
  %arrayidx16.1 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.1, !dbg !80
  %80 = load i32* %arrayidx16.1, align 4, !dbg !80, !tbaa !66
  %arrayidx18.1 = getelementptr inbounds i32* %2, i64 %indvars.iv.next.1, !dbg !83
  %81 = load i32* %arrayidx18.1, align 4, !dbg !83, !tbaa !66
  %add19.1 = add nsw i32 %81, %80, !dbg !83
  store i32 %add19.1, i32* %arrayidx18.1, align 4, !dbg !83, !tbaa !66
  %cmp12.1 = icmp sgt i64 %indvars.iv.next, 1, !dbg !85
  br i1 %cmp12.1, label %for.body14, label %for.inc22.loopexit.unr-lcssa, !dbg !75, !llvm.loop !89

for.inc22.loopexit.unr-lcssa:                     ; preds = %for.body14
  br label %for.inc22.loopexit

for.inc22.loopexit:                               ; preds = %for.body14.preheader99.split, %for.inc22.loopexit.unr-lcssa
  br label %for.inc22

for.inc22:                                        ; preds = %for.inc22.loopexit, %middle.block67, %for.cond11.preheader
  %inc23 = add nuw nsw i32 %k.050, 1, !dbg !90
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !20, metadata !35), !dbg !91
  %exitcond = icmp eq i32 %inc23, 1000, !dbg !92
  br i1 %exitcond, label %for.end24, label %for.cond11.preheader, !dbg !92

for.end24:                                        ; preds = %for.inc22
  %82 = load i32* %2, align 4, !dbg !93, !tbaa !66
  %sub26 = add nsw i32 %cond, -1, !dbg !94
  %idxprom27 = sext i32 %sub26 to i64, !dbg !95
  %arrayidx28 = getelementptr inbounds i32* %2, i64 %idxprom27, !dbg !95
  %83 = load i32* %arrayidx28, align 4, !dbg !95, !tbaa !66
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %82, i32 %83) #3, !dbg !96
  tail call void @free(i8* %call1) #3, !dbg !97
  tail call void @free(i8* %call3) #3, !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = !{!"ary3.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6, !9}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!8 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !23}
!11 = !{!"0x2e\00main\00main\00\0017\000\001\000\000\00256\001\0017", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !15} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!5, !5, !6}
!15 = !{!16, !17, !18, !19, !20, !21, !22}
!16 = !{!"0x101\00argc\0016777233\000", !11, !12, !5} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!17 = !{!"0x101\00argv\0033554449\000", !11, !12, !6} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!18 = !{!"0x100\00n\0023\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [n] [line 23]
!19 = !{!"0x100\00i\0024\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [i] [line 24]
!20 = !{!"0x100\00k\0024\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [k] [line 24]
!21 = !{!"0x100\00x\0024\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [x] [line 24]
!22 = !{!"0x100\00y\0024\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [y] [line 24]
!23 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !24, !25, !26, null, null, null, null, !30} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!24 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!25 = !{!"0x29", !24}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!5, !28}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0x26\00\000\000\000\000\000", null, null, !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = !{!31}
!31 = !{!"0x101\00__nptr\0016777494\000", !23, !25, !28} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!36 = !MDLocation(line: 17, column: 14, scope: !11)
!37 = !MDLocation(line: 17, column: 26, scope: !11)
!38 = !MDLocation(line: 23, column: 13, scope: !11)
!39 = !MDLocation(line: 23, column: 12, scope: !11)
!40 = !MDLocation(line: 23, column: 31, scope: !41)
!41 = !{!"0xb\001", !1, !11}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !{!"0x101\00__nptr\0016777494\000", !23, !25, !28, !47} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!47 = !MDLocation(line: 23, column: 26, scope: !11)
!48 = !MDLocation(line: 278, column: 1, scope: !23, inlinedAt: !47)
!49 = !MDLocation(line: 280, column: 16, scope: !23, inlinedAt: !47)
!50 = !MDLocation(line: 280, column: 10, scope: !23, inlinedAt: !47)
!51 = !MDLocation(line: 23, column: 7, scope: !11)
!52 = !MDLocation(line: 26, column: 22, scope: !11)
!53 = !MDLocation(line: 26, column: 15, scope: !11)
!54 = !MDLocation(line: 26, column: 7, scope: !11)
!55 = !MDLocation(line: 24, column: 14, scope: !11)
!56 = !MDLocation(line: 27, column: 15, scope: !11)
!57 = !MDLocation(line: 27, column: 7, scope: !11)
!58 = !MDLocation(line: 24, column: 18, scope: !11)
!59 = !MDLocation(line: 24, column: 7, scope: !11)
!60 = !MDLocation(line: 29, column: 15, scope: !61)
!61 = !{!"0xb\0029\003\001", !1, !62}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!62 = !{!"0xb\0029\003\000", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!63 = !MDLocation(line: 29, column: 3, scope: !62)
!64 = !MDLocation(line: 30, column: 5, scope: !65)
!65 = !{!"0xb\0029\0027\002", !1, !61}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!66 = !{!67, !67, i64 0}
!67 = !{!"int", !44, i64 0}
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.unroll.disable"}
!70 = distinct !{!70, !71, !72}
!71 = !{!"llvm.loop.vectorize.width", i32 1}
!72 = !{!"llvm.loop.interleave.count", i32 1}
!73 = distinct !{!73, !69}
!74 = distinct !{!74, !71, !72}
!75 = !MDLocation(line: 34, column: 5, scope: !76)
!76 = !{!"0xb\0034\005\006", !1, !77}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!77 = !{!"0xb\0033\0026\005", !1, !78}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!78 = !{!"0xb\0033\003\004", !1, !79}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!79 = !{!"0xb\0033\003\003", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!80 = !MDLocation(line: 35, column: 15, scope: !81)
!81 = !{!"0xb\0034\0032\008", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!82 = !{!"0xb\0034\005\007", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!83 = !MDLocation(line: 35, column: 7, scope: !81)
!84 = distinct !{!84, !71, !72}
!85 = !MDLocation(line: 34, column: 19, scope: !86)
!86 = !{!"0xb\002", !1, !87}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!87 = !{!"0xb\001", !1, !82}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!88 = distinct !{!88, !69}
!89 = distinct !{!89, !71, !72}
!90 = !MDLocation(line: 33, column: 21, scope: !78)
!91 = !MDLocation(line: 24, column: 10, scope: !11)
!92 = !MDLocation(line: 33, column: 3, scope: !79)
!93 = !MDLocation(line: 39, column: 21, scope: !11)
!94 = !MDLocation(line: 39, column: 29, scope: !11)
!95 = !MDLocation(line: 39, column: 27, scope: !11)
!96 = !MDLocation(line: 39, column: 3, scope: !11)
!97 = !MDLocation(line: 41, column: 3, scope: !11)
!98 = !MDLocation(line: 42, column: 3, scope: !11)
!99 = !MDLocation(line: 44, column: 3, scope: !11)
