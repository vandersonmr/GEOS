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
  br i1 %cmp451, label %for.body.lr.ph, label %for.end24, !dbg !63

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
  %xtraiter104 = and i64 %13, 1
  %lcmp.mod105 = icmp ne i64 %xtraiter104, 0
  %lcmp.overflow106 = icmp eq i64 %13, 0
  %lcmp.or107 = or i1 %lcmp.overflow106, %lcmp.mod105
  br i1 %lcmp.or107, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !63
  %prol.iter108 = phi i64 [ %xtraiter104, %vector.body.preheader ], [ %prol.iter108.sub, %vector.body.prol ]
  %broadcast.splatinsert.prol = insertelement <2 x i64> undef, i64 %index.prol, i32 0
  %broadcast.splat.prol = shufflevector <2 x i64> %broadcast.splatinsert.prol, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = add <2 x i64> %broadcast.splat.prol, <i64 1, i64 2>, !dbg !63
  %15 = add <2 x i64> %broadcast.splat.prol, <i64 3, i64 4>, !dbg !63
  %16 = getelementptr inbounds i32* %1, i64 %index.prol, !dbg !64
  %17 = trunc <2 x i64> %14 to <2 x i32>, !dbg !64
  %18 = trunc <2 x i64> %15 to <2 x i32>, !dbg !64
  %19 = bitcast i32* %16 to <2 x i32>*, !dbg !64
  store <2 x i32> %17, <2 x i32>* %19, align 4, !dbg !64, !tbaa !66
  %.sum92.prol = or i64 %index.prol, 2, !dbg !64
  %20 = getelementptr i32* %1, i64 %.sum92.prol, !dbg !64
  %21 = bitcast i32* %20 to <2 x i32>*, !dbg !64
  store <2 x i32> %18, <2 x i32>* %21, align 4, !dbg !64, !tbaa !66
  %index.next.prol = add i64 %index.prol, 4, !dbg !63
  %22 = icmp eq i64 %index.next.prol, %n.vec, !dbg !63
  %prol.iter108.sub = sub i64 %prol.iter108, 1, !dbg !63
  %prol.iter108.cmp = icmp ne i64 %prol.iter108.sub, 0, !dbg !63
  br i1 %prol.iter108.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !68

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
  %.sum92 = or i64 %index, 2, !dbg !64
  %30 = getelementptr i32* %1, i64 %.sum92, !dbg !64
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
  %.sum92.1 = or i64 %index.next, 2, !dbg !64
  %38 = getelementptr i32* %1, i64 %.sum92.1, !dbg !64
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
  br i1 %cmp.n, label %for.cond7.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %41 = trunc i64 %resume.val to i32
  %42 = sub i32 %cond, %41
  %xtraiter99 = and i32 %42, 7
  %lcmp.mod100 = icmp ne i32 %xtraiter99, 0
  %lcmp.overflow101 = icmp eq i32 %42, 0
  %lcmp.or102 = or i1 %lcmp.overflow101, %lcmp.mod100
  br i1 %lcmp.or102, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %resume.val, %for.body.preheader ]
  %prol.iter103 = phi i32 [ %xtraiter99, %for.body.preheader ], [ %prol.iter103.sub, %for.body.prol ]
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !63
  %arrayidx6.prol = getelementptr inbounds i32* %1, i64 %indvars.iv.prol, !dbg !64
  %43 = trunc i64 %indvars.iv.next.prol to i32, !dbg !64
  store i32 %43, i32* %arrayidx6.prol, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !63
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %3, !dbg !63
  %prol.iter103.sub = sub i32 %prol.iter103, 1, !dbg !63
  %prol.iter103.cmp = icmp ne i32 %prol.iter103.sub, 0, !dbg !63
  br i1 %prol.iter103.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !73

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %44 = icmp ult i32 %42, 8
  br i1 %44, label %for.cond7.preheader.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !63

for.cond7.preheader.loopexit.unr-lcssa:           ; preds = %for.body
  br label %for.cond7.preheader.loopexit

for.cond7.preheader.loopexit:                     ; preds = %for.body.preheader.split, %for.cond7.preheader.loopexit.unr-lcssa
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.loopexit, %middle.block
  br i1 %cmp451, label %for.body14.lr.ph.us.preheader, label %for.end24

for.body14.lr.ph.us.preheader:                    ; preds = %for.cond7.preheader
  %45 = sext i32 %cond to i64
  %46 = xor i64 %45, -1, !dbg !74
  %47 = icmp sgt i64 %46, -2
  %smax = select i1 %47, i64 %46, i64 -2
  %48 = add nsw i64 %smax, %45, !dbg !74
  %49 = add nsw i64 %48, 2, !dbg !74
  br label %for.body14.lr.ph.us, !dbg !74

for.inc22.us.loopexit.unr-lcssa:                  ; preds = %for.body14.us
  br label %for.inc22.us.loopexit

for.inc22.us.loopexit:                            ; preds = %for.body14.us.preheader.split, %for.inc22.us.loopexit.unr-lcssa
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.inc22.us.loopexit, %middle.block67
  %inc23.us = add nuw nsw i32 %k.050.us, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata i32 %inc23.us, i64 0, metadata !20, metadata !35), !dbg !80
  %exitcond55 = icmp eq i32 %inc23.us, 1000, !dbg !81
  br i1 %exitcond55, label %for.end24.us-lcssa.us, label %for.body14.lr.ph.us, !dbg !81

for.body14.us:                                    ; preds = %for.body14.us, %for.body14.us.preheader.split.split
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %for.body14.us.preheader.split.split ], [ %indvars.iv.next54.1, %for.body14.us ]
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, -1, !dbg !74
  %arrayidx16.us = getelementptr inbounds i32* %1, i64 %indvars.iv.next54, !dbg !82
  %50 = load i32* %arrayidx16.us, align 4, !dbg !82, !tbaa !66
  %arrayidx18.us = getelementptr inbounds i32* %2, i64 %indvars.iv.next54, !dbg !85
  %51 = load i32* %arrayidx18.us, align 4, !dbg !85, !tbaa !66
  %add19.us = add nsw i32 %51, %50, !dbg !85
  store i32 %add19.us, i32* %arrayidx18.us, align 4, !dbg !85, !tbaa !66
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv.next54, -1, !dbg !74
  %arrayidx16.us.1 = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.1, !dbg !82
  %52 = load i32* %arrayidx16.us.1, align 4, !dbg !82, !tbaa !66
  %arrayidx18.us.1 = getelementptr inbounds i32* %2, i64 %indvars.iv.next54.1, !dbg !85
  %53 = load i32* %arrayidx18.us.1, align 4, !dbg !85, !tbaa !66
  %add19.us.1 = add nsw i32 %53, %52, !dbg !85
  store i32 %add19.us.1, i32* %arrayidx18.us.1, align 4, !dbg !85, !tbaa !66
  %cmp12.us.1 = icmp sgt i64 %indvars.iv.next54, 1, !dbg !86
  br i1 %cmp12.us.1, label %for.body14.us, label %for.inc22.us.loopexit.unr-lcssa, !dbg !74, !llvm.loop !89

for.body14.lr.ph.us:                              ; preds = %for.body14.lr.ph.us.preheader, %for.inc22.us
  %k.050.us = phi i32 [ %inc23.us, %for.inc22.us ], [ 0, %for.body14.lr.ph.us.preheader ]
  %backedge.overflow63 = icmp eq i64 %48, -2
  br i1 %backedge.overflow63, label %for.body14.us.preheader, label %overflow.checked75

for.body14.us.preheader:                          ; preds = %middle.block67, %for.body14.lr.ph.us
  %indvars.iv53.ph = phi i64 [ %conv, %for.body14.lr.ph.us ], [ %resume.val76, %middle.block67 ]
  %54 = add i64 %indvars.iv53.ph, 2
  %55 = sub i64 -1, %indvars.iv53.ph
  %56 = icmp sgt i64 %55, -2
  %smax98 = select i1 %56, i64 %55, i64 -2
  %57 = add i64 %54, %smax98
  %xtraiter = and i64 %57, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %57, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body14.us.prol.preheader, label %for.body14.us.preheader.split

for.body14.us.prol.preheader:                     ; preds = %for.body14.us.preheader
  br label %for.body14.us.prol, !dbg !74

for.body14.us.prol:                               ; preds = %for.body14.us.prol.preheader, %for.body14.us.prol
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %for.body14.us.prol ], [ %indvars.iv53.ph, %for.body14.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body14.us.prol ], [ %xtraiter, %for.body14.us.prol.preheader ]
  %indvars.iv.next54.prol = add nsw i64 %indvars.iv53.prol, -1, !dbg !74
  %arrayidx16.us.prol = getelementptr inbounds i32* %1, i64 %indvars.iv.next54.prol, !dbg !82
  %58 = load i32* %arrayidx16.us.prol, align 4, !dbg !82, !tbaa !66
  %arrayidx18.us.prol = getelementptr inbounds i32* %2, i64 %indvars.iv.next54.prol, !dbg !85
  %59 = load i32* %arrayidx18.us.prol, align 4, !dbg !85, !tbaa !66
  %add19.us.prol = add nsw i32 %59, %58, !dbg !85
  store i32 %add19.us.prol, i32* %arrayidx18.us.prol, align 4, !dbg !85, !tbaa !66
  %cmp12.us.prol = icmp sgt i64 %indvars.iv53.prol, 1, !dbg !86
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !74
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !74
  br i1 %prol.iter.cmp, label %for.body14.us.prol, label %for.body14.us.preheader.split.loopexit, !llvm.loop !90

for.body14.us.preheader.split.loopexit:           ; preds = %for.body14.us.prol
  %indvars.iv53.unr.ph = phi i64 [ %indvars.iv.next54.prol, %for.body14.us.prol ]
  br label %for.body14.us.preheader.split

for.body14.us.preheader.split:                    ; preds = %for.body14.us.preheader.split.loopexit, %for.body14.us.preheader
  %indvars.iv53.unr = phi i64 [ %indvars.iv53.ph, %for.body14.us.preheader ], [ %indvars.iv53.unr.ph, %for.body14.us.preheader.split.loopexit ]
  %60 = icmp ult i64 %57, 2
  br i1 %60, label %for.inc22.us.loopexit, label %for.body14.us.preheader.split.split

for.body14.us.preheader.split.split:              ; preds = %for.body14.us.preheader.split
  br label %for.body14.us, !dbg !74

overflow.checked75:                               ; preds = %for.body14.lr.ph.us
  %end.idx70 = add nsw i64 %48, 2
  %n.vec72 = and i64 %49, -8
  %cmp.zero74 = icmp eq i64 %n.vec72, 0
  %rev.ind.end = sub nsw i64 %conv, %n.vec72
  br i1 %cmp.zero74, label %middle.block67, label %vector.body66.preheader

vector.body66.preheader:                          ; preds = %overflow.checked75
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66.preheader, %vector.body66
  %index69 = phi i64 [ %index.next79, %vector.body66 ], [ 0, %vector.body66.preheader ]
  %reverse.idx = sub i64 %conv, %index69
  %.sum = add i64 %reverse.idx, -4, !dbg !82
  %61 = getelementptr i32* %1, i64 %.sum, !dbg !82
  %62 = bitcast i32* %61 to <4 x i32>*, !dbg !82
  %wide.load = load <4 x i32>* %62, align 4, !dbg !82, !tbaa !66
  %.sum94 = add i64 %reverse.idx, -8, !dbg !82
  %63 = getelementptr i32* %1, i64 %.sum94, !dbg !82
  %64 = bitcast i32* %63 to <4 x i32>*, !dbg !82
  %wide.load84 = load <4 x i32>* %64, align 4, !dbg !82, !tbaa !66
  %.sum95 = add i64 %reverse.idx, -4, !dbg !85
  %65 = getelementptr i32* %2, i64 %.sum95, !dbg !85
  %66 = bitcast i32* %65 to <4 x i32>*, !dbg !85
  %wide.load86 = load <4 x i32>* %66, align 4, !dbg !85, !tbaa !66
  %.sum97 = add i64 %reverse.idx, -8, !dbg !85
  %67 = getelementptr i32* %2, i64 %.sum97, !dbg !85
  %68 = bitcast i32* %67 to <4 x i32>*, !dbg !85
  %wide.load88 = load <4 x i32>* %68, align 4, !dbg !85, !tbaa !66
  %69 = add nsw <4 x i32> %wide.load86, %wide.load, !dbg !85
  %70 = add nsw <4 x i32> %wide.load88, %wide.load84, !dbg !85
  %71 = bitcast i32* %65 to <4 x i32>*, !dbg !85
  store <4 x i32> %69, <4 x i32>* %71, align 4, !dbg !85, !tbaa !66
  %72 = bitcast i32* %67 to <4 x i32>*, !dbg !85
  store <4 x i32> %70, <4 x i32>* %72, align 4, !dbg !85, !tbaa !66
  %index.next79 = add i64 %index69, 8
  %73 = icmp eq i64 %index.next79, %n.vec72
  br i1 %73, label %middle.block67.loopexit, label %vector.body66, !llvm.loop !91

middle.block67.loopexit:                          ; preds = %vector.body66
  br label %middle.block67

middle.block67:                                   ; preds = %middle.block67.loopexit, %overflow.checked75
  %resume.val76 = phi i64 [ %conv, %overflow.checked75 ], [ %rev.ind.end, %middle.block67.loopexit ]
  %new.indc.resume.val = phi i64 [ 0, %overflow.checked75 ], [ %n.vec72, %middle.block67.loopexit ]
  %cmp.n78 = icmp eq i64 %end.idx70, %new.indc.resume.val
  br i1 %cmp.n78, label %for.inc22.us, label %for.body14.us.preheader

for.end24.us-lcssa.us:                            ; preds = %for.inc22.us
  %.pre = load i32* %2, align 4, !dbg !92, !tbaa !66
  br label %for.end24

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader.split.split ], [ %indvars.iv.next.7, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !63
  %arrayidx6 = getelementptr inbounds i32* %1, i64 %indvars.iv, !dbg !64
  %74 = trunc i64 %indvars.iv.next to i32, !dbg !64
  store i32 %74, i32* %arrayidx6, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !63
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !63
  %arrayidx6.1 = getelementptr inbounds i32* %1, i64 %indvars.iv.next, !dbg !64
  %75 = trunc i64 %indvars.iv.next.1 to i32, !dbg !64
  store i32 %75, i32* %arrayidx6.1, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !63
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !63
  %arrayidx6.2 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.1, !dbg !64
  %76 = trunc i64 %indvars.iv.next.2 to i32, !dbg !64
  store i32 %76, i32* %arrayidx6.2, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !63
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !63
  %arrayidx6.3 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.2, !dbg !64
  %77 = trunc i64 %indvars.iv.next.3 to i32, !dbg !64
  store i32 %77, i32* %arrayidx6.3, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !63
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.next.3, 1, !dbg !63
  %arrayidx6.4 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.3, !dbg !64
  %78 = trunc i64 %indvars.iv.next.4 to i32, !dbg !64
  store i32 %78, i32* %arrayidx6.4, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.4 = trunc i64 %indvars.iv.next.3 to i32, !dbg !63
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.next.4, 1, !dbg !63
  %arrayidx6.5 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.4, !dbg !64
  %79 = trunc i64 %indvars.iv.next.5 to i32, !dbg !64
  store i32 %79, i32* %arrayidx6.5, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.5 = trunc i64 %indvars.iv.next.4 to i32, !dbg !63
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.next.5, 1, !dbg !63
  %arrayidx6.6 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.5, !dbg !64
  %80 = trunc i64 %indvars.iv.next.6 to i32, !dbg !64
  store i32 %80, i32* %arrayidx6.6, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.6 = trunc i64 %indvars.iv.next.5 to i32, !dbg !63
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.next.6, 1, !dbg !63
  %arrayidx6.7 = getelementptr inbounds i32* %1, i64 %indvars.iv.next.6, !dbg !64
  %81 = trunc i64 %indvars.iv.next.7 to i32, !dbg !64
  store i32 %81, i32* %arrayidx6.7, align 4, !dbg !64, !tbaa !66
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next.6 to i32, !dbg !63
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %3, !dbg !63
  br i1 %exitcond.7, label %for.cond7.preheader.loopexit.unr-lcssa, label %for.body, !dbg !63, !llvm.loop !93

for.end24:                                        ; preds = %cond.end, %for.cond7.preheader, %for.end24.us-lcssa.us
  %82 = phi i32 [ %.pre, %for.end24.us-lcssa.us ], [ 0, %for.cond7.preheader ], [ 0, %cond.end ]
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
!74 = !MDLocation(line: 34, column: 5, scope: !75)
!75 = !{!"0xb\0034\005\006", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!76 = !{!"0xb\0033\0026\005", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!77 = !{!"0xb\0033\003\004", !1, !78}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!78 = !{!"0xb\0033\003\003", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!79 = !MDLocation(line: 33, column: 21, scope: !77)
!80 = !MDLocation(line: 24, column: 10, scope: !11)
!81 = !MDLocation(line: 33, column: 3, scope: !78)
!82 = !MDLocation(line: 35, column: 15, scope: !83)
!83 = !{!"0xb\0034\0032\008", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!84 = !{!"0xb\0034\005\007", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!85 = !MDLocation(line: 35, column: 7, scope: !83)
!86 = !MDLocation(line: 34, column: 19, scope: !87)
!87 = !{!"0xb\002", !1, !88}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!88 = !{!"0xb\001", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!89 = distinct !{!89, !71, !72}
!90 = distinct !{!90, !69}
!91 = distinct !{!91, !71, !72}
!92 = !MDLocation(line: 39, column: 21, scope: !11)
!93 = distinct !{!93, !71, !72}
!94 = !MDLocation(line: 39, column: 29, scope: !11)
!95 = !MDLocation(line: 39, column: 27, scope: !11)
!96 = !MDLocation(line: 39, column: 3, scope: !11)
!97 = !MDLocation(line: 41, column: 3, scope: !11)
!98 = !MDLocation(line: 42, column: 3, scope: !11)
!99 = !MDLocation(line: 44, column: 3, scope: !11)
