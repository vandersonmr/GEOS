; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !14, metadata !55), !dbg !56
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !15, metadata !55), !dbg !57
  tail call void @llvm.dbg.value(metadata i32 11, i64 0, metadata !16, metadata !55), !dbg !58
  tail call void @llvm.dbg.value(metadata i32 11, i64 0, metadata !59, metadata !55) #3, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !62, metadata !55) #3, !dbg !63
  %call.i = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !64
  %call2.i = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !65
  %0 = bitcast i8* %call2.i to i32*, !dbg !65
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !66, metadata !55) #3, !dbg !67
  %call4.i = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !55) #3, !dbg !70
  store i32 0, i32* %0, align 4, !dbg !71, !tbaa !74
  %arrayidx.1.i = getelementptr inbounds i8* %call2.i, i64 4, !dbg !71
  %1 = bitcast i8* %arrayidx.1.i to i32*, !dbg !71
  store i32 1, i32* %1, align 4, !dbg !71, !tbaa !74
  %arrayidx.2.i = getelementptr inbounds i8* %call2.i, i64 8, !dbg !71
  %2 = bitcast i8* %arrayidx.2.i to i32*, !dbg !71
  store i32 2, i32* %2, align 4, !dbg !71, !tbaa !74
  %arrayidx.3.i = getelementptr inbounds i8* %call2.i, i64 12, !dbg !71
  %3 = bitcast i8* %arrayidx.3.i to i32*, !dbg !71
  store i32 3, i32* %3, align 4, !dbg !71, !tbaa !74
  %arrayidx.4.i = getelementptr inbounds i8* %call2.i, i64 16, !dbg !71
  %4 = bitcast i8* %arrayidx.4.i to i32*, !dbg !71
  store i32 4, i32* %4, align 4, !dbg !71, !tbaa !74
  %arrayidx.5.i = getelementptr inbounds i8* %call2.i, i64 20, !dbg !71
  %5 = bitcast i8* %arrayidx.5.i to i32*, !dbg !71
  store i32 5, i32* %5, align 4, !dbg !71, !tbaa !74
  %arrayidx.6.i = getelementptr inbounds i8* %call2.i, i64 24, !dbg !71
  %6 = bitcast i8* %arrayidx.6.i to i32*, !dbg !71
  store i32 6, i32* %6, align 4, !dbg !71, !tbaa !74
  %arrayidx.7.i = getelementptr inbounds i8* %call2.i, i64 28, !dbg !71
  %7 = bitcast i8* %arrayidx.7.i to i32*, !dbg !71
  store i32 7, i32* %7, align 4, !dbg !71, !tbaa !74
  %arrayidx.8.i = getelementptr inbounds i8* %call2.i, i64 32, !dbg !71
  %8 = bitcast i8* %arrayidx.8.i to i32*, !dbg !71
  store i32 8, i32* %8, align 4, !dbg !71, !tbaa !74
  %arrayidx.9.i = getelementptr inbounds i8* %call2.i, i64 36, !dbg !71
  %9 = bitcast i8* %arrayidx.9.i to i32*, !dbg !71
  store i32 9, i32* %9, align 4, !dbg !71, !tbaa !74
  %arrayidx.10.i = getelementptr inbounds i8* %call2.i, i64 40, !dbg !71
  %10 = bitcast i8* %arrayidx.10.i to i32*, !dbg !71
  store i32 10, i32* %10, align 4, !dbg !71, !tbaa !74
  %11 = bitcast i8* %call.i to i32*, !dbg !64
  %12 = bitcast i8* %call4.i to i32*, !dbg !68
  %scevgep.i = getelementptr i8* %call.i, i64 4, !dbg !60
  br label %for.cond7.i, !dbg !78

for.cond7.loopexit.i:                             ; preds = %while.end.i
  %indvars.iv36.i.lcssa = phi i64 [ %indvars.iv36.i, %while.end.i ]
  %13 = trunc i64 %indvars.iv36.i.lcssa to i32, !dbg !60
  br label %for.cond7.i, !dbg !60

for.cond7.i:                                      ; preds = %for.cond7.loopexit.i, %entry
  %r.0.i = phi i32 [ %13, %for.cond7.loopexit.i ], [ 11, %entry ], !dbg !60
  %didpr.0.i = phi i32 [ %didpr.1.ph.i, %for.cond7.loopexit.i ], [ 0, %entry ], !dbg !60
  %flipsMax.0.i = phi i64 [ %flipsMax.1.ph.i, %for.cond7.loopexit.i ], [ 0, %entry ], !dbg !60
  %cmp8.i = icmp slt i32 %didpr.0.i, 30, !dbg !78
  br i1 %cmp8.i, label %for.cond11.preheader.i, label %for.cond24.preheader.i, !dbg !80

for.cond11.preheader.i:                           ; preds = %for.cond7.i
  %14 = load i32* %0, align 4, !dbg !81, !tbaa !74
  %add.i = add nsw i32 %14, 1, !dbg !85
  %call17.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.i) #3, !dbg !86
  %15 = load i32* %1, align 4, !dbg !81, !tbaa !74
  %add.1.i = add nsw i32 %15, 1, !dbg !85
  %call17.1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.1.i) #3, !dbg !86
  %16 = load i32* %2, align 4, !dbg !81, !tbaa !74
  %add.2.i = add nsw i32 %16, 1, !dbg !85
  %call17.2.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.2.i) #3, !dbg !86
  %17 = load i32* %3, align 4, !dbg !81, !tbaa !74
  %add.3.i = add nsw i32 %17, 1, !dbg !85
  %call17.3.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.3.i) #3, !dbg !86
  %18 = load i32* %4, align 4, !dbg !81, !tbaa !74
  %add.4.i = add nsw i32 %18, 1, !dbg !85
  %call17.4.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.4.i) #3, !dbg !86
  %19 = load i32* %5, align 4, !dbg !81, !tbaa !74
  %add.5.i = add nsw i32 %19, 1, !dbg !85
  %call17.5.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.5.i) #3, !dbg !86
  %20 = load i32* %6, align 4, !dbg !81, !tbaa !74
  %add.6.i = add nsw i32 %20, 1, !dbg !85
  %call17.6.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.6.i) #3, !dbg !86
  %21 = load i32* %7, align 4, !dbg !81, !tbaa !74
  %add.7.i = add nsw i32 %21, 1, !dbg !85
  %call17.7.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.7.i) #3, !dbg !86
  %22 = load i32* %8, align 4, !dbg !81, !tbaa !74
  %add.8.i = add nsw i32 %22, 1, !dbg !85
  %call17.8.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.8.i) #3, !dbg !86
  %23 = load i32* %9, align 4, !dbg !81, !tbaa !74
  %add.9.i = add nsw i32 %23, 1, !dbg !85
  %call17.9.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.9.i) #3, !dbg !86
  %24 = load i32* %10, align 4, !dbg !81, !tbaa !74
  %add.10.i = add nsw i32 %24, 1, !dbg !85
  %call17.10.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %add.10.i) #3, !dbg !86
  %putchar.i = tail call i32 @putchar(i32 10) #3, !dbg !87
  %inc22.i = add nsw i32 %didpr.0.i, 1, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %inc22.i, i64 0, metadata !89, metadata !55) #3, !dbg !90
  br label %for.cond24.preheader.i, !dbg !91

for.cond24.preheader.i:                           ; preds = %for.cond11.preheader.i, %for.cond7.i
  %didpr.1.ph.i = phi i32 [ %didpr.0.i, %for.cond7.i ], [ %inc22.i, %for.cond11.preheader.i ], !dbg !60
  %cmp253.i = icmp eq i32 %r.0.i, 1, !dbg !92
  br i1 %cmp253.i, label %for.end32.i, label %for.body27.lr.ph.i, !dbg !97

for.body27.lr.ph.i:                               ; preds = %for.cond24.preheader.i
  %25 = sext i32 %r.0.i to i64, !dbg !60
  %26 = add i32 %r.0.i, -2, !dbg !97
  %27 = zext i32 %26 to i64
  %28 = add nuw nsw i64 %27, 1, !dbg !97
  %end.idx24 = add nuw nsw i64 %27, 1
  %n.vec26 = and i64 %28, 8589934584
  %cmp.zero28 = icmp eq i64 %n.vec26, 0
  %rev.ind.end = sub nsw i64 %25, %n.vec26
  br i1 %cmp.zero28, label %middle.block21, label %vector.body20.preheader

vector.body20.preheader:                          ; preds = %for.body27.lr.ph.i
  br label %vector.body20, !dbg !60

vector.body20:                                    ; preds = %vector.body20.preheader, %vector.body20
  %index23 = phi i64 [ %index.next33, %vector.body20 ], [ 0, %vector.body20.preheader ]
  %reverse.idx = sub i64 %25, %index23, !dbg !60
  %broadcast.splatinsert34 = insertelement <4 x i64> undef, i64 %reverse.idx, i32 0, !dbg !60
  %broadcast.splat35 = shufflevector <4 x i64> %broadcast.splatinsert34, <4 x i64> undef, <4 x i32> zeroinitializer, !dbg !60
  %induction36 = add <4 x i64> %broadcast.splat35, <i64 0, i64 -1, i64 -2, i64 -3>, !dbg !60
  %induction37 = add <4 x i64> %broadcast.splat35, <i64 -4, i64 -5, i64 -6, i64 -7>, !dbg !60
  %29 = trunc <4 x i64> %induction36 to <4 x i32>, !dbg !98
  %30 = trunc <4 x i64> %induction37 to <4 x i32>, !dbg !98
  %reverse = shufflevector <4 x i32> %29, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !98
  %.sum = add i64 %reverse.idx, -4, !dbg !98
  %31 = getelementptr i32* %12, i64 %.sum, !dbg !98
  %32 = bitcast i32* %31 to <4 x i32>*, !dbg !98
  store <4 x i32> %reverse, <4 x i32>* %32, align 4, !dbg !98, !tbaa !74
  %reverse38 = shufflevector <4 x i32> %30, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !98
  %.sum40 = add i64 %reverse.idx, -8, !dbg !98
  %33 = getelementptr i32* %12, i64 %.sum40, !dbg !98
  %34 = bitcast i32* %33 to <4 x i32>*, !dbg !98
  store <4 x i32> %reverse38, <4 x i32>* %34, align 4, !dbg !98, !tbaa !74
  %index.next33 = add i64 %index23, 8
  %35 = icmp eq i64 %index.next33, %n.vec26
  br i1 %35, label %middle.block21.loopexit, label %vector.body20, !llvm.loop !100

middle.block21.loopexit:                          ; preds = %vector.body20
  br label %middle.block21

middle.block21:                                   ; preds = %middle.block21.loopexit, %for.body27.lr.ph.i
  %resume.val30 = phi i64 [ %25, %for.body27.lr.ph.i ], [ %rev.ind.end, %middle.block21.loopexit ]
  %new.indc.resume.val = phi i64 [ 0, %for.body27.lr.ph.i ], [ %n.vec26, %middle.block21.loopexit ]
  %cmp.n32 = icmp eq i64 %end.idx24, %new.indc.resume.val
  br i1 %cmp.n32, label %for.end32.i, label %for.body27.i.preheader

for.body27.i.preheader:                           ; preds = %middle.block21
  %36 = add i64 %resume.val30, -1
  %37 = trunc i64 %36 to i32
  %xtraiter = and i32 %37, 7
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %37, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body27.i.prol.preheader, label %for.body27.i.preheader.split

for.body27.i.prol.preheader:                      ; preds = %for.body27.i.preheader
  br label %for.body27.i.prol, !dbg !97

for.body27.i.prol:                                ; preds = %for.body27.i.prol.preheader, %for.body27.i.prol
  %indvars.iv20.i.prol = phi i64 [ %indvars.iv.next21.i.prol, %for.body27.i.prol ], [ %resume.val30, %for.body27.i.prol.preheader ], !dbg !60
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body27.i.prol ], [ %xtraiter, %for.body27.i.prol.preheader ]
  %indvars.iv.next21.i.prol = add nsw i64 %indvars.iv20.i.prol, -1, !dbg !97
  %arrayidx30.i.prol = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.prol, !dbg !98
  %38 = trunc i64 %indvars.iv20.i.prol to i32, !dbg !98
  store i32 %38, i32* %arrayidx30.i.prol, align 4, !dbg !98, !tbaa !74
  %39 = trunc i64 %indvars.iv.next21.i.prol to i32, !dbg !92
  %cmp25.i.prol = icmp eq i32 %39, 1, !dbg !92
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !97
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !97
  br i1 %prol.iter.cmp, label %for.body27.i.prol, label %for.body27.i.preheader.split.loopexit, !llvm.loop !103

for.body27.i.preheader.split.loopexit:            ; preds = %for.body27.i.prol
  %indvars.iv20.i.unr.ph = phi i64 [ %indvars.iv.next21.i.prol, %for.body27.i.prol ]
  br label %for.body27.i.preheader.split

for.body27.i.preheader.split:                     ; preds = %for.body27.i.preheader.split.loopexit, %for.body27.i.preheader
  %indvars.iv20.i.unr = phi i64 [ %resume.val30, %for.body27.i.preheader ], [ %indvars.iv20.i.unr.ph, %for.body27.i.preheader.split.loopexit ]
  %40 = icmp ult i32 %37, 8
  br i1 %40, label %for.end32.i.loopexit, label %for.body27.i.preheader.split.split

for.body27.i.preheader.split.split:               ; preds = %for.body27.i.preheader.split
  br label %for.body27.i, !dbg !97

for.body27.i:                                     ; preds = %for.body27.i, %for.body27.i.preheader.split.split
  %indvars.iv20.i = phi i64 [ %indvars.iv20.i.unr, %for.body27.i.preheader.split.split ], [ %indvars.iv.next21.i.7, %for.body27.i ], !dbg !60
  %indvars.iv.next21.i = add nsw i64 %indvars.iv20.i, -1, !dbg !97
  %arrayidx30.i = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i, !dbg !98
  %41 = trunc i64 %indvars.iv20.i to i32, !dbg !98
  store i32 %41, i32* %arrayidx30.i, align 4, !dbg !98, !tbaa !74
  %42 = trunc i64 %indvars.iv.next21.i to i32, !dbg !92
  %indvars.iv.next21.i.1 = add nsw i64 %indvars.iv.next21.i, -1, !dbg !97
  %arrayidx30.i.1 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.1, !dbg !98
  %43 = trunc i64 %indvars.iv.next21.i to i32, !dbg !98
  store i32 %43, i32* %arrayidx30.i.1, align 4, !dbg !98, !tbaa !74
  %44 = trunc i64 %indvars.iv.next21.i.1 to i32, !dbg !92
  %indvars.iv.next21.i.2 = add nsw i64 %indvars.iv.next21.i.1, -1, !dbg !97
  %arrayidx30.i.2 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.2, !dbg !98
  %45 = trunc i64 %indvars.iv.next21.i.1 to i32, !dbg !98
  store i32 %45, i32* %arrayidx30.i.2, align 4, !dbg !98, !tbaa !74
  %46 = trunc i64 %indvars.iv.next21.i.2 to i32, !dbg !92
  %indvars.iv.next21.i.3 = add nsw i64 %indvars.iv.next21.i.2, -1, !dbg !97
  %arrayidx30.i.3 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.3, !dbg !98
  %47 = trunc i64 %indvars.iv.next21.i.2 to i32, !dbg !98
  store i32 %47, i32* %arrayidx30.i.3, align 4, !dbg !98, !tbaa !74
  %48 = trunc i64 %indvars.iv.next21.i.3 to i32, !dbg !92
  %indvars.iv.next21.i.4 = add nsw i64 %indvars.iv.next21.i.3, -1, !dbg !97
  %arrayidx30.i.4 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.4, !dbg !98
  %49 = trunc i64 %indvars.iv.next21.i.3 to i32, !dbg !98
  store i32 %49, i32* %arrayidx30.i.4, align 4, !dbg !98, !tbaa !74
  %50 = trunc i64 %indvars.iv.next21.i.4 to i32, !dbg !92
  %indvars.iv.next21.i.5 = add nsw i64 %indvars.iv.next21.i.4, -1, !dbg !97
  %arrayidx30.i.5 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.5, !dbg !98
  %51 = trunc i64 %indvars.iv.next21.i.4 to i32, !dbg !98
  store i32 %51, i32* %arrayidx30.i.5, align 4, !dbg !98, !tbaa !74
  %52 = trunc i64 %indvars.iv.next21.i.5 to i32, !dbg !92
  %indvars.iv.next21.i.6 = add nsw i64 %indvars.iv.next21.i.5, -1, !dbg !97
  %arrayidx30.i.6 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.6, !dbg !98
  %53 = trunc i64 %indvars.iv.next21.i.5 to i32, !dbg !98
  store i32 %53, i32* %arrayidx30.i.6, align 4, !dbg !98, !tbaa !74
  %54 = trunc i64 %indvars.iv.next21.i.6 to i32, !dbg !92
  %indvars.iv.next21.i.7 = add nsw i64 %indvars.iv.next21.i.6, -1, !dbg !97
  %arrayidx30.i.7 = getelementptr inbounds i32* %12, i64 %indvars.iv.next21.i.7, !dbg !98
  %55 = trunc i64 %indvars.iv.next21.i.6 to i32, !dbg !98
  store i32 %55, i32* %arrayidx30.i.7, align 4, !dbg !98, !tbaa !74
  %56 = trunc i64 %indvars.iv.next21.i.7 to i32, !dbg !92
  %cmp25.i.7 = icmp eq i32 %56, 1, !dbg !92
  br i1 %cmp25.i.7, label %for.end32.i.loopexit.unr-lcssa, label %for.body27.i, !dbg !97, !llvm.loop !105

for.end32.i.loopexit.unr-lcssa:                   ; preds = %for.body27.i
  br label %for.end32.i.loopexit

for.end32.i.loopexit:                             ; preds = %for.body27.i.preheader.split, %for.end32.i.loopexit.unr-lcssa
  br label %for.end32.i

for.end32.i:                                      ; preds = %for.end32.i.loopexit, %middle.block21, %for.cond24.preheader.i
  %57 = load i32* %0, align 4, !dbg !106, !tbaa !74
  %cmp34.i = icmp eq i32 %57, 0, !dbg !106
  br i1 %cmp34.i, label %if.end84.lr.ph.i, label %lor.lhs.false.i, !dbg !107

lor.lhs.false.i:                                  ; preds = %for.end32.i
  %58 = load i32* %10, align 4, !dbg !108, !tbaa !74
  %cmp38.i = icmp eq i32 %58, 10, !dbg !108
  br i1 %cmp38.i, label %if.end84.lr.ph.i, label %for.cond41.preheader.i, !dbg !107

for.cond41.preheader.i:                           ; preds = %lor.lhs.false.i
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep.i, i8* %arrayidx.1.i, i64 40, i32 4, i1 false) #3, !dbg !109
  tail call void @llvm.dbg.value(metadata i32 %57, i64 0, metadata !113, metadata !55) #3, !dbg !114
  br label %do.body.i, !dbg !115

do.body.i:                                        ; preds = %for.end69.i, %for.cond41.preheader.i
  %k.0.i = phi i32 [ %57, %for.cond41.preheader.i ], [ %63, %for.end69.i ], !dbg !60
  %flips.0.i = phi i64 [ 0, %for.cond41.preheader.i ], [ %inc70.i, %for.end69.i ], !dbg !60
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !69, metadata !55) #3, !dbg !70
  %j.06.i = add i32 %k.0.i, -1, !dbg !116
  %cmp557.i = icmp sgt i32 %j.06.i, 1, !dbg !117
  br i1 %cmp557.i, label %for.body57.lr.ph.i, label %for.end69.i, !dbg !118

for.body57.lr.ph.i:                               ; preds = %do.body.i
  %59 = sext i32 %j.06.i to i64
  br label %for.body57.i, !dbg !118

for.body57.i:                                     ; preds = %for.body57.i, %for.body57.lr.ph.i
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body57.i ], [ %59, %for.body57.lr.ph.i ]
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %for.body57.i ], [ 1, %for.body57.lr.ph.i ], !dbg !60
  %j.09.i = phi i32 [ %j.0.i, %for.body57.i ], [ %j.06.i, %for.body57.lr.ph.i ], !dbg !60
  %arrayidx59.i = getelementptr inbounds i32* %11, i64 %indvars.iv29.i, !dbg !119
  %60 = load i32* %arrayidx59.i, align 4, !dbg !119, !tbaa !74
  tail call void @llvm.dbg.value(metadata i32 %60, i64 0, metadata !120, metadata !55) #3, !dbg !119
  %arrayidx61.i = getelementptr inbounds i32* %11, i64 %indvars.iv, !dbg !119
  %61 = load i32* %arrayidx61.i, align 4, !dbg !119, !tbaa !74
  store i32 %61, i32* %arrayidx59.i, align 4, !dbg !119, !tbaa !74
  store i32 %60, i32* %arrayidx61.i, align 4, !dbg !119, !tbaa !74
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1, !dbg !118
  %j.0.i = add nsw i32 %j.09.i, -1, !dbg !116
  %62 = sext i32 %j.0.i to i64, !dbg !117
  %cmp55.i = icmp slt i64 %indvars.iv.next30.i, %62, !dbg !117
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !118
  br i1 %cmp55.i, label %for.body57.i, label %for.end69.i.loopexit, !dbg !118

for.end69.i.loopexit:                             ; preds = %for.body57.i
  br label %for.end69.i

for.end69.i:                                      ; preds = %for.end69.i.loopexit, %do.body.i
  %inc70.i = add nuw nsw i64 %flips.0.i, 1, !dbg !121
  tail call void @llvm.dbg.value(metadata i64 %inc70.i, i64 0, metadata !122, metadata !55) #3, !dbg !123
  %idxprom71.i = sext i32 %k.0.i to i64, !dbg !124
  %arrayidx72.i = getelementptr inbounds i32* %11, i64 %idxprom71.i, !dbg !124
  %63 = load i32* %arrayidx72.i, align 4, !dbg !124, !tbaa !74
  tail call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !125, metadata !55) #3, !dbg !126
  store i32 %k.0.i, i32* %arrayidx72.i, align 4, !dbg !127, !tbaa !74
  tail call void @llvm.dbg.value(metadata i32 %63, i64 0, metadata !113, metadata !55) #3, !dbg !114
  %tobool.i = icmp eq i32 %63, 0, !dbg !128
  br i1 %tobool.i, label %do.end.i, label %do.body.i, !dbg !128

do.end.i:                                         ; preds = %for.end69.i
  %inc70.i.lcssa = phi i64 [ %inc70.i, %for.end69.i ]
  %cmp75.i = icmp slt i64 %flipsMax.0.i, %inc70.i.lcssa, !dbg !129
  tail call void @llvm.dbg.value(metadata i64 %inc70.i, i64 0, metadata !131, metadata !55) #3, !dbg !132
  %inc70.flipsMax.0.i = select i1 %cmp75.i, i64 %inc70.i.lcssa, i64 %flipsMax.0.i, !dbg !133
  br label %if.end84.lr.ph.i, !dbg !133

if.end84.lr.ph.i:                                 ; preds = %do.end.i, %lor.lhs.false.i, %for.end32.i
  %flipsMax.1.ph.i = phi i64 [ %inc70.flipsMax.0.i, %do.end.i ], [ %flipsMax.0.i, %lor.lhs.false.i ], [ %flipsMax.0.i, %for.end32.i ], !dbg !60
  br label %if.end84.i, !dbg !134

if.end84.i:                                       ; preds = %if.end101.if.end84_crit_edge.i, %if.end84.lr.ph.i
  %indvars.iv6 = phi i32 [ %indvars.iv.next7, %if.end101.if.end84_crit_edge.i ], [ 0, %if.end84.lr.ph.i ]
  %64 = phi i32 [ %.pre.i, %if.end101.if.end84_crit_edge.i ], [ %57, %if.end84.lr.ph.i ], !dbg !60
  %indvars.iv36.i = phi i64 [ %indvars.iv.next37.i, %if.end101.if.end84_crit_edge.i ], [ 1, %if.end84.lr.ph.i ], !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %64, i64 0, metadata !135, metadata !55) #3, !dbg !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !55) #3, !dbg !70
  %65 = add i32 %indvars.iv6, 1
  %66 = zext i32 %indvars.iv6 to i64
  %67 = add i64 %66, 1
  %68 = lshr i64 %67, 3
  %69 = mul i64 %68, 8
  %70 = add i64 %69, -8
  %71 = lshr i64 %70, 3
  %72 = add i64 %71, 1
  %73 = zext i32 %indvars.iv6 to i64
  %cmp8610.i = icmp sgt i64 %indvars.iv36.i, 0, !dbg !137
  br i1 %cmp8610.i, label %overflow.checked, label %while.end.i, !dbg !138

overflow.checked:                                 ; preds = %if.end84.i
  %74 = add nuw nsw i64 %73, 1, !dbg !137
  %end.idx = add nuw nsw i64 %73, 1, !dbg !60
  %n.vec = and i64 %74, 8589934584, !dbg !60
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !60
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %xtraiter46 = and i64 %72, 1
  %lcmp.mod47 = icmp ne i64 %xtraiter46, 0
  %lcmp.overflow48 = icmp eq i64 %72, 0
  %lcmp.or49 = or i1 %lcmp.overflow48, %lcmp.mod47
  br i1 %lcmp.or49, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !139

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !60
  %prol.iter50 = phi i64 [ %prol.iter50.sub, %vector.body.prol ], [ %xtraiter46, %vector.body.prol.preheader ]
  %75 = or i64 %index.prol, 1, !dbg !139
  %76 = getelementptr inbounds i32* %0, i64 %75, !dbg !139
  %77 = bitcast i32* %76 to <4 x i32>*, !dbg !139
  %wide.load.prol = load <4 x i32>* %77, align 4, !dbg !139, !tbaa !74
  %.sum4144.prol = or i64 %index.prol, 5, !dbg !139
  %78 = getelementptr i32* %0, i64 %.sum4144.prol, !dbg !139
  %79 = bitcast i32* %78 to <4 x i32>*, !dbg !139
  %wide.load10.prol = load <4 x i32>* %79, align 4, !dbg !139, !tbaa !74
  %80 = getelementptr inbounds i32* %0, i64 %index.prol, !dbg !141
  %81 = bitcast i32* %80 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load.prol, <4 x i32>* %81, align 4, !dbg !141, !tbaa !74
  %.sum4243.prol = or i64 %index.prol, 4, !dbg !141
  %82 = getelementptr i32* %0, i64 %.sum4243.prol, !dbg !141
  %83 = bitcast i32* %82 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load10.prol, <4 x i32>* %83, align 4, !dbg !141, !tbaa !74
  %index.next.prol = add i64 %index.prol, 8, !dbg !60
  %84 = icmp eq i64 %index.next.prol, %n.vec, !dbg !60
  %prol.iter50.sub = sub i64 %prol.iter50, 1, !dbg !60
  %prol.iter50.cmp = icmp ne i64 %prol.iter50.sub, 0, !dbg !60
  br i1 %prol.iter50.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !142

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %85 = icmp ult i64 %72, 2
  br i1 %85, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !139

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !60
  %86 = or i64 %index, 1, !dbg !139
  %87 = getelementptr inbounds i32* %0, i64 %86, !dbg !139
  %88 = bitcast i32* %87 to <4 x i32>*, !dbg !139
  %wide.load = load <4 x i32>* %88, align 4, !dbg !139, !tbaa !74
  %.sum4144 = or i64 %index, 5, !dbg !139
  %89 = getelementptr i32* %0, i64 %.sum4144, !dbg !139
  %90 = bitcast i32* %89 to <4 x i32>*, !dbg !139
  %wide.load10 = load <4 x i32>* %90, align 4, !dbg !139, !tbaa !74
  %91 = getelementptr inbounds i32* %0, i64 %index, !dbg !141
  %92 = bitcast i32* %91 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load, <4 x i32>* %92, align 4, !dbg !141, !tbaa !74
  %.sum4243 = or i64 %index, 4, !dbg !141
  %93 = getelementptr i32* %0, i64 %.sum4243, !dbg !141
  %94 = bitcast i32* %93 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load10, <4 x i32>* %94, align 4, !dbg !141, !tbaa !74
  %index.next = add i64 %index, 8, !dbg !60
  %95 = or i64 %index.next, 1, !dbg !139
  %96 = getelementptr inbounds i32* %0, i64 %95, !dbg !139
  %97 = bitcast i32* %96 to <4 x i32>*, !dbg !139
  %wide.load.1 = load <4 x i32>* %97, align 4, !dbg !139, !tbaa !74
  %.sum4144.1 = or i64 %index.next, 5, !dbg !139
  %98 = getelementptr i32* %0, i64 %.sum4144.1, !dbg !139
  %99 = bitcast i32* %98 to <4 x i32>*, !dbg !139
  %wide.load10.1 = load <4 x i32>* %99, align 4, !dbg !139, !tbaa !74
  %100 = getelementptr inbounds i32* %0, i64 %index.next, !dbg !141
  %101 = bitcast i32* %100 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load.1, <4 x i32>* %101, align 4, !dbg !141, !tbaa !74
  %.sum4243.1 = or i64 %index.next, 4, !dbg !141
  %102 = getelementptr i32* %0, i64 %.sum4243.1, !dbg !141
  %103 = bitcast i32* %102 to <4 x i32>*, !dbg !141
  store <4 x i32> %wide.load10.1, <4 x i32>* %103, align 4, !dbg !141, !tbaa !74
  %index.next.1 = add i64 %index.next, 8, !dbg !60
  %104 = icmp eq i64 %index.next.1, %n.vec, !dbg !60
  br i1 %104, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !60, !llvm.loop !143

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %while.end.i, label %while.body.i.preheader

while.body.i.preheader:                           ; preds = %middle.block
  %105 = trunc i64 %resume.val to i32
  %106 = sub i32 %65, %105
  %xtraiter51 = and i32 %106, 3
  %lcmp.mod52 = icmp ne i32 %xtraiter51, 0
  %lcmp.overflow53 = icmp eq i32 %106, 0
  %lcmp.or54 = or i1 %lcmp.overflow53, %lcmp.mod52
  br i1 %lcmp.or54, label %while.body.i.prol.preheader, label %while.body.i.preheader.split

while.body.i.prol.preheader:                      ; preds = %while.body.i.preheader
  br label %while.body.i.prol, !dbg !138

while.body.i.prol:                                ; preds = %while.body.i.prol.preheader, %while.body.i.prol
  %indvars.iv31.i.prol = phi i64 [ %indvars.iv.next32.i.prol, %while.body.i.prol ], [ %resume.val, %while.body.i.prol.preheader ], !dbg !60
  %prol.iter55 = phi i32 [ %prol.iter55.sub, %while.body.i.prol ], [ %xtraiter51, %while.body.i.prol.preheader ]
  %indvars.iv.next32.i.prol = add nuw nsw i64 %indvars.iv31.i.prol, 1, !dbg !138
  %arrayidx90.i.prol = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.prol, !dbg !139
  %107 = load i32* %arrayidx90.i.prol, align 4, !dbg !139, !tbaa !74
  %arrayidx92.i.prol = getelementptr inbounds i32* %0, i64 %indvars.iv31.i.prol, !dbg !141
  store i32 %107, i32* %arrayidx92.i.prol, align 4, !dbg !141, !tbaa !74
  %lftr.wideiv.prol = trunc i64 %indvars.iv31.i.prol to i32, !dbg !138
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %indvars.iv6, !dbg !138
  %prol.iter55.sub = sub i32 %prol.iter55, 1, !dbg !138
  %prol.iter55.cmp = icmp ne i32 %prol.iter55.sub, 0, !dbg !138
  br i1 %prol.iter55.cmp, label %while.body.i.prol, label %while.body.i.preheader.split.loopexit, !llvm.loop !144

while.body.i.preheader.split.loopexit:            ; preds = %while.body.i.prol
  %indvars.iv31.i.unr.ph = phi i64 [ %indvars.iv.next32.i.prol, %while.body.i.prol ]
  br label %while.body.i.preheader.split

while.body.i.preheader.split:                     ; preds = %while.body.i.preheader.split.loopexit, %while.body.i.preheader
  %indvars.iv31.i.unr = phi i64 [ %resume.val, %while.body.i.preheader ], [ %indvars.iv31.i.unr.ph, %while.body.i.preheader.split.loopexit ]
  %108 = icmp ult i32 %106, 4
  br i1 %108, label %while.end.i.loopexit, label %while.body.i.preheader.split.split

while.body.i.preheader.split.split:               ; preds = %while.body.i.preheader.split
  br label %while.body.i, !dbg !138

while.body.i:                                     ; preds = %while.body.i, %while.body.i.preheader.split.split
  %indvars.iv31.i = phi i64 [ %indvars.iv31.i.unr, %while.body.i.preheader.split.split ], [ %indvars.iv.next32.i.3, %while.body.i ], !dbg !60
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !138
  %arrayidx90.i = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i, !dbg !139
  %109 = load i32* %arrayidx90.i, align 4, !dbg !139, !tbaa !74
  %arrayidx92.i = getelementptr inbounds i32* %0, i64 %indvars.iv31.i, !dbg !141
  store i32 %109, i32* %arrayidx92.i, align 4, !dbg !141, !tbaa !74
  %lftr.wideiv = trunc i64 %indvars.iv31.i to i32, !dbg !138
  %indvars.iv.next32.i.1 = add nuw nsw i64 %indvars.iv.next32.i, 1, !dbg !138
  %arrayidx90.i.1 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.1, !dbg !139
  %110 = load i32* %arrayidx90.i.1, align 4, !dbg !139, !tbaa !74
  %arrayidx92.i.1 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i, !dbg !141
  store i32 %110, i32* %arrayidx92.i.1, align 4, !dbg !141, !tbaa !74
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next32.i to i32, !dbg !138
  %indvars.iv.next32.i.2 = add nuw nsw i64 %indvars.iv.next32.i.1, 1, !dbg !138
  %arrayidx90.i.2 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.2, !dbg !139
  %111 = load i32* %arrayidx90.i.2, align 4, !dbg !139, !tbaa !74
  %arrayidx92.i.2 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.1, !dbg !141
  store i32 %111, i32* %arrayidx92.i.2, align 4, !dbg !141, !tbaa !74
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next32.i.1 to i32, !dbg !138
  %indvars.iv.next32.i.3 = add nuw nsw i64 %indvars.iv.next32.i.2, 1, !dbg !138
  %arrayidx90.i.3 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.3, !dbg !139
  %112 = load i32* %arrayidx90.i.3, align 4, !dbg !139, !tbaa !74
  %arrayidx92.i.3 = getelementptr inbounds i32* %0, i64 %indvars.iv.next32.i.2, !dbg !141
  store i32 %112, i32* %arrayidx92.i.3, align 4, !dbg !141, !tbaa !74
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next32.i.2 to i32, !dbg !138
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %indvars.iv6, !dbg !138
  br i1 %exitcond.3, label %while.end.i.loopexit.unr-lcssa, label %while.body.i, !dbg !138, !llvm.loop !145

while.end.i.loopexit.unr-lcssa:                   ; preds = %while.body.i
  br label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i.preheader.split, %while.end.i.loopexit.unr-lcssa
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %middle.block, %if.end84.i
  %arrayidx94.i = getelementptr inbounds i32* %0, i64 %indvars.iv36.i, !dbg !146
  store i32 %64, i32* %arrayidx94.i, align 4, !dbg !146, !tbaa !74
  %arrayidx96.i = getelementptr inbounds i32* %12, i64 %indvars.iv36.i, !dbg !147
  %113 = load i32* %arrayidx96.i, align 4, !dbg !147, !tbaa !74
  %sub97.i = add nsw i32 %113, -1, !dbg !147
  store i32 %sub97.i, i32* %arrayidx96.i, align 4, !dbg !147, !tbaa !74
  %cmp98.i = icmp sgt i32 %113, 1, !dbg !149
  br i1 %cmp98.i, label %for.cond7.loopexit.i, label %if.end101.i, !dbg !150

if.end101.i:                                      ; preds = %while.end.i
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1, !dbg !134
  %114 = trunc i64 %indvars.iv.next37.i to i32, !dbg !151
  %cmp81.i = icmp eq i32 %114, 11, !dbg !151
  br i1 %cmp81.i, label %fannkuch.exit, label %if.end101.if.end84_crit_edge.i, !dbg !134

if.end101.if.end84_crit_edge.i:                   ; preds = %if.end101.i
  %indvars.iv.next7 = add i32 %indvars.iv6, 1, !dbg !134
  %.pre.i = load i32* %0, align 4, !dbg !153, !tbaa !74
  br label %if.end84.i, !dbg !134

fannkuch.exit:                                    ; preds = %if.end101.i
  %flipsMax.1.ph.i.lcssa = phi i64 [ %flipsMax.1.ph.i, %if.end101.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 11, i64 %flipsMax.1.ph.i.lcssa) #3, !dbg !154
  ret i32 0, !dbg !155
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!52, !53}
!llvm.ident = !{!54}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c] [DW_LANG_C99]
!1 = !{!"fannkuch.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !17}
!6 = !{!"0x2e\00main\00main\00\0099\000\001\000\000\00256\001\00100", !1, !7, !8, null, i32 (i32, i8**)* @main, null, null, !13} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !4, !10}
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = !{!14, !15, !16}
!14 = !{!"0x101\00argc\0016777315\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [argc] [line 99]
!15 = !{!"0x101\00argv\0033554531\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [argv] [line 99]
!16 = !{!"0x100\00n\00101\000", !6, !7, !4}       ; [ DW_TAG_auto_variable ] [n] [line 101]
!17 = !{!"0x2e\00fannkuch\00fannkuch\00\0018\001\001\000\000\00256\001\0019", !1, !7, !18, null, null, null, null, !21} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!20, !4}
!20 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!21 = !{!22, !23, !25, !26, !27, !28, !29, !30, !31, !32, !33, !35, !42, !47}
!22 = !{!"0x101\00n\0016777234\000", !17, !7, !4} ; [ DW_TAG_arg_variable ] [n] [line 18]
!23 = !{!"0x100\00perm\0020\000", !17, !7, !24}   ; [ DW_TAG_auto_variable ] [perm] [line 20]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!25 = !{!"0x100\00perm1\0021\000", !17, !7, !24}  ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!26 = !{!"0x100\00count\0022\000", !17, !7, !24}  ; [ DW_TAG_auto_variable ] [count] [line 22]
!27 = !{!"0x100\00flips\0023\000", !17, !7, !20}  ; [ DW_TAG_auto_variable ] [flips] [line 23]
!28 = !{!"0x100\00flipsMax\0024\000", !17, !7, !20} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!29 = !{!"0x100\00r\0025\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [r] [line 25]
!30 = !{!"0x100\00i\0026\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [i] [line 26]
!31 = !{!"0x100\00k\0027\000", !17, !7, !4}       ; [ DW_TAG_auto_variable ] [k] [line 27]
!32 = !{!"0x100\00didpr\0028\000", !17, !7, !4}   ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!33 = !{!"0x100\00n1\0029\000", !17, !7, !34}     ; [ DW_TAG_auto_variable ] [n1] [line 29]
!34 = !{!"0x26\00\000\000\000\000\000", null, null, !4} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!35 = !{!"0x100\00j\0059\000", !36, !7, !4}       ; [ DW_TAG_auto_variable ] [j] [line 59]
!36 = !{!"0xb\0058\009\0018", !1, !37}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!37 = !{!"0xb\0052\0041\0014", !1, !38}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!38 = !{!"0xb\0052\006\0013", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!39 = !{!"0xb\0040\0013\005", !1, !40}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!40 = !{!"0xb\0040\005\004", !1, !41}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!41 = !{!"0xb\0040\005\003", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!42 = !{!"0x100\00t_mp\0061\000", !43, !7, !4}    ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!43 = !{!"0xb\0061\007\0022", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!44 = !{!"0xb\0060\0038\0021", !1, !45}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!45 = !{!"0xb\0060\003\0020", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!46 = !{!"0xb\0060\003\0019", !1, !36}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!47 = !{!"0x100\00perm0\0081\000", !48, !7, !4}   ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!48 = !{!"0xb\0080\006\0030", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!49 = !{!"0xb\0075\0010\0027", !1, !50}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!50 = !{!"0xb\0075\002\0026", !1, !51}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!51 = !{!"0xb\0075\002\0025", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!52 = !{i32 2, !"Dwarf Version", i32 4}
!53 = !{i32 2, !"Debug Info Version", i32 2}
!54 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!55 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!56 = !MDLocation(line: 99, column: 11, scope: !6)
!57 = !MDLocation(line: 99, column: 23, scope: !6)
!58 = !MDLocation(line: 101, column: 10, scope: !6)
!59 = !{!"0x101\00n\0016777234\000", !17, !7, !4, !60} ; [ DW_TAG_arg_variable ] [n] [line 18]
!60 = !MDLocation(line: 103, column: 42, scope: !6)
!61 = !MDLocation(line: 18, column: 15, scope: !17, inlinedAt: !60)
!62 = !{!"0x100\00n1\0029\000", !17, !7, !34, !60} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!63 = !MDLocation(line: 29, column: 15, scope: !17, inlinedAt: !60)
!64 = !MDLocation(line: 33, column: 13, scope: !17, inlinedAt: !60)
!65 = !MDLocation(line: 34, column: 13, scope: !17, inlinedAt: !60)
!66 = !{!"0x100\00perm1\0021\000", !17, !7, !24, !60} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!67 = !MDLocation(line: 21, column: 11, scope: !17, inlinedAt: !60)
!68 = !MDLocation(line: 35, column: 13, scope: !17, inlinedAt: !60)
!69 = !{!"0x100\00i\0026\000", !17, !7, !4, !60}  ; [ DW_TAG_auto_variable ] [i] [line 26]
!70 = !MDLocation(line: 26, column: 10, scope: !17, inlinedAt: !60)
!71 = !MDLocation(line: 37, column: 28, scope: !72, inlinedAt: !60)
!72 = !{!"0xb\0037\005\002", !1, !73}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!73 = !{!"0xb\0037\005\001", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!74 = !{!75, !75, i64 0}
!75 = !{!"int", !76, i64 0}
!76 = !{!"omnipotent char", !77, i64 0}
!77 = !{!"Simple C/C++ TBAA"}
!78 = !MDLocation(line: 41, column: 6, scope: !79, inlinedAt: !60)
!79 = !{!"0xb\0041\006\006", !1, !39}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!80 = !MDLocation(line: 41, column: 6, scope: !39, inlinedAt: !60)
!81 = !MDLocation(line: 42, column: 50, scope: !82, inlinedAt: !60)
!82 = !{!"0xb\0042\006\009", !1, !83}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!83 = !{!"0xb\0042\006\008", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!84 = !{!"0xb\0041\0019\007", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!85 = !MDLocation(line: 42, column: 48, scope: !82, inlinedAt: !60)
!86 = !MDLocation(line: 42, column: 29, scope: !82, inlinedAt: !60)
!87 = !MDLocation(line: 43, column: 6, scope: !84, inlinedAt: !60)
!88 = !MDLocation(line: 44, column: 6, scope: !84, inlinedAt: !60)
!89 = !{!"0x100\00didpr\0028\000", !17, !7, !4, !60} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!90 = !MDLocation(line: 28, column: 10, scope: !17, inlinedAt: !60)
!91 = !MDLocation(line: 45, column: 2, scope: !84, inlinedAt: !60)
!92 = !MDLocation(line: 46, column: 9, scope: !93, inlinedAt: !60)
!93 = !{!"0xb\002", !1, !94}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!94 = !{!"0xb\001", !1, !95}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!95 = !{!"0xb\0046\002\0011", !1, !96}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!96 = !{!"0xb\0046\002\0010", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!97 = !MDLocation(line: 46, column: 2, scope: !96, inlinedAt: !60)
!98 = !MDLocation(line: 47, column: 6, scope: !99, inlinedAt: !60)
!99 = !{!"0xb\0046\0022\0012", !1, !95}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!100 = distinct !{!100, !101, !102}
!101 = !{!"llvm.loop.vectorize.width", i32 1}
!102 = !{!"llvm.loop.interleave.count", i32 1}
!103 = distinct !{!103, !104}
!104 = !{!"llvm.loop.unroll.disable"}
!105 = distinct !{!105, !101, !102}
!106 = !MDLocation(line: 52, column: 9, scope: !38, inlinedAt: !60)
!107 = !MDLocation(line: 52, column: 6, scope: !39, inlinedAt: !60)
!108 = !MDLocation(line: 52, column: 24, scope: !38, inlinedAt: !60)
!109 = !MDLocation(line: 55, column: 3, scope: !110, inlinedAt: !60)
!110 = !{!"0xb\0054\0029\0017", !1, !111}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!111 = !{!"0xb\0054\006\0016", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!112 = !{!"0xb\0054\006\0015", !1, !37}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!113 = !{!"0x100\00k\0027\000", !17, !7, !4, !60} ; [ DW_TAG_auto_variable ] [k] [line 27]
!114 = !MDLocation(line: 27, column: 10, scope: !17, inlinedAt: !60)
!115 = !MDLocation(line: 58, column: 6, scope: !37, inlinedAt: !60)
!116 = !MDLocation(line: 60, column: 15, scope: !46, inlinedAt: !60)
!117 = !MDLocation(line: 60, column: 21, scope: !45, inlinedAt: !60)
!118 = !MDLocation(line: 60, column: 3, scope: !46, inlinedAt: !60)
!119 = !MDLocation(line: 61, column: 7, scope: !43, inlinedAt: !60)
!120 = !{!"0x100\00t_mp\0061\000", !43, !7, !4, !60} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!121 = !MDLocation(line: 63, column: 3, scope: !36, inlinedAt: !60)
!122 = !{!"0x100\00flips\0023\000", !17, !7, !20, !60} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!123 = !MDLocation(line: 23, column: 10, scope: !17, inlinedAt: !60)
!124 = !MDLocation(line: 68, column: 5, scope: !36, inlinedAt: !60)
!125 = !{!"0x100\00j\0059\000", !36, !7, !4, !60} ; [ DW_TAG_auto_variable ] [j] [line 59]
!126 = !MDLocation(line: 59, column: 7, scope: !36, inlinedAt: !60)
!127 = !MDLocation(line: 68, column: 14, scope: !36, inlinedAt: !60)
!128 = !MDLocation(line: 69, column: 6, scope: !36, inlinedAt: !60)
!129 = !MDLocation(line: 70, column: 10, scope: !130, inlinedAt: !60)
!130 = !{!"0xb\0070\0010\0023", !1, !37}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!131 = !{!"0x100\00flipsMax\0024\000", !17, !7, !20, !60} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!132 = !MDLocation(line: 24, column: 10, scope: !17, inlinedAt: !60)
!133 = !MDLocation(line: 70, column: 10, scope: !37, inlinedAt: !60)
!134 = !MDLocation(line: 76, column: 10, scope: !49, inlinedAt: !60)
!135 = !{!"0x100\00perm0\0081\000", !48, !7, !4, !60} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!136 = !MDLocation(line: 81, column: 7, scope: !48, inlinedAt: !60)
!137 = !MDLocation(line: 83, column: 10, scope: !48, inlinedAt: !60)
!138 = !MDLocation(line: 83, column: 3, scope: !48, inlinedAt: !60)
!139 = !MDLocation(line: 85, column: 18, scope: !140, inlinedAt: !60)
!140 = !{!"0xb\0083\0018\0031", !1, !48}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!141 = !MDLocation(line: 85, column: 7, scope: !140, inlinedAt: !60)
!142 = distinct !{!142, !104}
!143 = distinct !{!143, !101, !102}
!144 = distinct !{!144, !104}
!145 = distinct !{!145, !101, !102}
!146 = !MDLocation(line: 88, column: 3, scope: !48, inlinedAt: !60)
!147 = !MDLocation(line: 90, column: 11, scope: !148, inlinedAt: !60)
!148 = !{!"0xb\0090\0010\0032", !1, !49}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!149 = !MDLocation(line: 90, column: 10, scope: !148, inlinedAt: !60)
!150 = !MDLocation(line: 90, column: 10, scope: !49, inlinedAt: !60)
!151 = !MDLocation(line: 76, column: 10, scope: !152, inlinedAt: !60)
!152 = !{!"0xb\0076\0010\0028", !1, !49}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fannkuch.c]
!153 = !MDLocation(line: 81, column: 15, scope: !48, inlinedAt: !60)
!154 = !MDLocation(line: 103, column: 5, scope: !6)
!155 = !MDLocation(line: 104, column: 5, scope: !6)
