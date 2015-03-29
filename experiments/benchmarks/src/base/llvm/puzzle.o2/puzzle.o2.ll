; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next = internal unnamed_addr global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @rand() #0 {
entry:
  %0 = load i64* @next, align 8, !dbg !66, !tbaa !67
  %mul = mul i64 %0, 1103515245, !dbg !66
  %add = add i64 %mul, 12345, !dbg !66
  store i64 %add, i64* @next, align 8, !dbg !71, !tbaa !67
  %div = lshr i64 %add, 16, !dbg !72
  %conv = trunc i64 %div to i32, !dbg !73
  %rem = urem i32 %conv, 32767, !dbg !73
  %add1 = add nuw nsw i32 %rem, 1, !dbg !73
  ret i32 %add1, !dbg !74
}

; Function Attrs: nounwind uwtable
define void @srand(i32 %seed) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %seed, i64 0, metadata !16, metadata !75), !dbg !76
  %conv = zext i32 %seed to i64, !dbg !77
  store i64 %conv, i64* @next, align 8, !dbg !78, !tbaa !67
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %min, i64 0, metadata !21, metadata !75), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %max, i64 0, metadata !22, metadata !75), !dbg !81
  %sub = sub nsw i32 %max, %min, !dbg !82
  %add = add nsw i32 %sub, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !24, metadata !75), !dbg !84
  %conv = sitofp i32 %add to double, !dbg !85
  %0 = load i64* @next, align 8, !dbg !86, !tbaa !67
  %mul.i = mul i64 %0, 1103515245, !dbg !86
  %add.i = add i64 %mul.i, 12345, !dbg !86
  store i64 %add.i, i64* @next, align 8, !dbg !88, !tbaa !67
  %div.i = lshr i64 %add.i, 16, !dbg !89
  %conv.i = trunc i64 %div.i to i32, !dbg !90
  %rem.i = urem i32 %conv.i, 32767, !dbg !90
  %add1.i = add nuw nsw i32 %rem.i, 1, !dbg !90
  %conv1 = sitofp i32 %add1.i to double, !dbg !87
  %div = fmul double %conv1, 0x3F00000000000000, !dbg !87
  %mul = fmul double %conv, %div, !dbg !85
  %conv2 = fptosi double %mul to i32, !dbg !91
  tail call void @llvm.dbg.value(metadata i32 %conv2, i64 0, metadata !23, metadata !75), !dbg !92
  %cmp = icmp eq i32 %conv2, %add, !dbg !93
  %add4 = add nsw i32 %conv2, %min, !dbg !94
  %sub5 = sext i1 %cmp to i32, !dbg !95
  %cond = add nsw i32 %add4, %sub5, !dbg !95
  ret i32 %cond, !dbg !96
}

; Function Attrs: nounwind uwtable
define void @shuffle(i32* nocapture %items, i32 %len) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %items, i64 0, metadata !29, metadata !75), !dbg !99
  tail call void @llvm.dbg.value(metadata i32 %len, i64 0, metadata !30, metadata !75), !dbg !100
  %sub = add nsw i32 %len, -1, !dbg !101
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !36, metadata !75), !dbg !103
  %cmp23 = icmp eq i32 %sub, 0, !dbg !104
  br i1 %cmp23, label %for.end, label %for.body.lr.ph, !dbg !108

for.body.lr.ph:                                   ; preds = %entry
  %conv = sext i32 %sub to i64, !dbg !101
  %next.promoted = load i64* @next, align 8, !dbg !109, !tbaa !67
  br label %for.body, !dbg !108

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %add.i25 = phi i64 [ %next.promoted, %for.body.lr.ph ], [ %add.i, %for.body ], !dbg !112
  %i.024 = phi i64 [ %conv, %for.body.lr.ph ], [ %dec, %for.body ]
  %add = add i64 %i.024, 1, !dbg !112
  %conv2 = uitofp i64 %add to double, !dbg !113
  %mul.i = mul i64 %add.i25, 1103515245, !dbg !114
  %add.i = add i64 %mul.i, 12345, !dbg !114
  %div.i = lshr i64 %add.i, 16, !dbg !115
  %conv.i = trunc i64 %div.i to i32, !dbg !116
  %rem.i = urem i32 %conv.i, 32767, !dbg !116
  %add1.i = add nuw nsw i32 %rem.i, 1, !dbg !116
  %conv3 = sitofp i32 %add1.i to double, !dbg !110
  %div = fmul double %conv3, 0x3F00000000000000, !dbg !110
  %mul = fmul double %conv2, %div, !dbg !113
  %conv4 = fptosi double %mul to i32, !dbg !117
  %conv5 = sext i32 %conv4 to i64, !dbg !117
  tail call void @llvm.dbg.value(metadata i64 %conv5, i64 0, metadata !35, metadata !75), !dbg !118
  %cmp7 = icmp eq i64 %conv5, %add, !dbg !119
  %sub9 = sext i1 %cmp7 to i64, !dbg !120
  %cond = add nsw i64 %sub9, %conv5, !dbg !120
  tail call void @llvm.dbg.value(metadata i64 %cond, i64 0, metadata !31, metadata !75), !dbg !121
  %arrayidx = getelementptr inbounds i32* %items, i64 %i.024, !dbg !122
  %0 = load i32* %arrayidx, align 4, !dbg !122, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !37, metadata !75), !dbg !125
  %arrayidx10 = getelementptr inbounds i32* %items, i64 %cond, !dbg !126
  %1 = load i32* %arrayidx10, align 4, !dbg !126, !tbaa !123
  store i32 %1, i32* %arrayidx, align 4, !dbg !127, !tbaa !123
  store i32 %0, i32* %arrayidx10, align 4, !dbg !128, !tbaa !123
  %dec = add i64 %i.024, -1, !dbg !129
  tail call void @llvm.dbg.value(metadata i64 %dec, i64 0, metadata !36, metadata !75), !dbg !103
  %cmp = icmp eq i64 %dec, 0, !dbg !104
  br i1 %cmp, label %for.cond.for.end_crit_edge, label %for.body, !dbg !108

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %add.i.lcssa = phi i64 [ %add.i, %for.body ]
  store i64 %add.i.lcssa, i64* @next, align 8, !dbg !109, !tbaa !67
  br label %for.end, !dbg !108

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void, !dbg !130
}

; Function Attrs: nounwind uwtable
define noalias i32* @createRandomArray(i32 %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %size, i64 0, metadata !42, metadata !75), !dbg !131
  %add = add nsw i32 %size, 1, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !44, metadata !75), !dbg !133
  %conv = sext i32 %add to i64, !dbg !134
  %mul = shl nsw i64 %conv, 2, !dbg !134
  %call = tail call noalias i8* @malloc(i64 %mul) #4, !dbg !135
  %0 = bitcast i8* %call to i32*, !dbg !136
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !45, metadata !75), !dbg !137
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !75), !dbg !138
  %cmp25 = icmp sgt i32 %size, -1, !dbg !139
  br i1 %cmp25, label %for.body.preheader, label %for.end, !dbg !142

for.body.preheader:                               ; preds = %entry
  %1 = add i32 %size, 1, !dbg !143
  %2 = sext i32 %1 to i64
  %3 = icmp sgt i64 %2, 1
  %smax = select i1 %3, i64 %2, i64 1
  %backedge.overflow = icmp eq i64 %smax, 0
  br i1 %backedge.overflow, label %for.body.preheader35, label %overflow.checked

overflow.checked:                                 ; preds = %for.body.preheader
  %n.vec = and i64 %smax, -8, !dbg !142
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !142
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %4 = add i32 %size, 1
  %5 = sext i32 %4 to i64
  %6 = icmp sgt i64 %5, 1
  %smax37 = select i1 %6, i64 %5, i64 1
  %7 = lshr i64 %smax37, 3
  %8 = mul i64 %7, 8
  %9 = add i64 %8, -8
  %10 = lshr i64 %9, 3
  %11 = add i64 %10, 1
  %xtraiter38 = and i64 %11, 1
  %lcmp.mod39 = icmp ne i64 %xtraiter38, 0
  %lcmp.overflow40 = icmp eq i64 %11, 0
  %lcmp.or41 = or i1 %lcmp.overflow40, %lcmp.mod39
  br i1 %lcmp.or41, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.preheader ], !dbg !142
  %prol.iter42 = phi i64 [ %xtraiter38, %vector.body.preheader ], [ %prol.iter42.sub, %vector.body.prol ]
  %12 = getelementptr inbounds i32* %0, i64 %index.prol, !dbg !143
  %13 = trunc i64 %index.prol to i32, !dbg !143
  %broadcast.splatinsert28.prol = insertelement <4 x i32> undef, i32 %13, i32 0, !dbg !143
  %broadcast.splat29.prol = shufflevector <4 x i32> %broadcast.splatinsert28.prol, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !143
  %induction30.prol = add <4 x i32> %broadcast.splat29.prol, <i32 0, i32 1, i32 2, i32 3>, !dbg !143
  %induction31.prol = add <4 x i32> %broadcast.splat29.prol, <i32 4, i32 5, i32 6, i32 7>, !dbg !143
  %14 = bitcast i32* %12 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction30.prol, <4 x i32>* %14, align 4, !dbg !143, !tbaa !123
  %.sum34.prol = or i64 %index.prol, 4, !dbg !143
  %15 = getelementptr i32* %0, i64 %.sum34.prol, !dbg !143
  %16 = bitcast i32* %15 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction31.prol, <4 x i32>* %16, align 4, !dbg !143, !tbaa !123
  %index.next.prol = add i64 %index.prol, 8, !dbg !142
  %17 = icmp eq i64 %index.next.prol, %n.vec, !dbg !142
  %prol.iter42.sub = sub i64 %prol.iter42, 1, !dbg !142
  %prol.iter42.cmp = icmp ne i64 %prol.iter42.sub, 0, !dbg !142
  br i1 %prol.iter42.cmp, label %vector.body.prol, label %vector.body.preheader.split, !llvm.loop !144

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %18 = icmp ult i64 %11, 2
  br i1 %18, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !143

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !142
  %19 = getelementptr inbounds i32* %0, i64 %index, !dbg !143
  %20 = trunc i64 %index to i32, !dbg !143
  %broadcast.splatinsert28 = insertelement <4 x i32> undef, i32 %20, i32 0, !dbg !143
  %broadcast.splat29 = shufflevector <4 x i32> %broadcast.splatinsert28, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !143
  %induction30 = add <4 x i32> %broadcast.splat29, <i32 0, i32 1, i32 2, i32 3>, !dbg !143
  %induction31 = add <4 x i32> %broadcast.splat29, <i32 4, i32 5, i32 6, i32 7>, !dbg !143
  %21 = bitcast i32* %19 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction30, <4 x i32>* %21, align 4, !dbg !143, !tbaa !123
  %.sum34 = or i64 %index, 4, !dbg !143
  %22 = getelementptr i32* %0, i64 %.sum34, !dbg !143
  %23 = bitcast i32* %22 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction31, <4 x i32>* %23, align 4, !dbg !143, !tbaa !123
  %index.next = add i64 %index, 8, !dbg !142
  %24 = getelementptr inbounds i32* %0, i64 %index.next, !dbg !143
  %25 = trunc i64 %index.next to i32, !dbg !143
  %broadcast.splatinsert28.1 = insertelement <4 x i32> undef, i32 %25, i32 0, !dbg !143
  %broadcast.splat29.1 = shufflevector <4 x i32> %broadcast.splatinsert28.1, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !143
  %induction30.1 = add <4 x i32> %broadcast.splat29.1, <i32 0, i32 1, i32 2, i32 3>, !dbg !143
  %induction31.1 = add <4 x i32> %broadcast.splat29.1, <i32 4, i32 5, i32 6, i32 7>, !dbg !143
  %26 = bitcast i32* %24 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction30.1, <4 x i32>* %26, align 4, !dbg !143, !tbaa !123
  %.sum34.1 = or i64 %index.next, 4, !dbg !143
  %27 = getelementptr i32* %0, i64 %.sum34.1, !dbg !143
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !143
  store <4 x i32> %induction31.1, <4 x i32>* %28, align 4, !dbg !143, !tbaa !123
  %index.next.1 = add i64 %index.next, 8, !dbg !142
  %29 = icmp eq i64 %index.next.1, %n.vec, !dbg !142
  br i1 %29, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !142, !llvm.loop !146

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i64 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %smax, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body.preheader35

for.body.preheader35:                             ; preds = %middle.block, %for.body.preheader
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %resume.val, %middle.block ]
  %30 = add i64 %indvars.iv.ph, 1
  %31 = add i32 %size, 1
  %32 = sext i32 %31 to i64
  %33 = icmp sgt i64 %30, %32
  %smax36 = select i1 %33, i64 %30, i64 %32
  %34 = sub i64 %smax36, %indvars.iv.ph
  %xtraiter = and i64 %34, 7
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %34, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader35.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader35
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %indvars.iv.ph, %for.body.preheader35 ]
  %prol.iter = phi i64 [ %xtraiter, %for.body.preheader35 ], [ %prol.iter.sub, %for.body.prol ]
  %arrayidx.prol = getelementptr inbounds i32* %0, i64 %indvars.iv.prol, !dbg !143
  %35 = trunc i64 %indvars.iv.prol to i32, !dbg !143
  store i32 %35, i32* %arrayidx.prol, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !142
  %cmp.prol = icmp slt i64 %indvars.iv.next.prol, %conv, !dbg !139
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !142
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !142
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader35.split, !llvm.loop !149

for.body.preheader35.split:                       ; preds = %for.body.prol, %for.body.preheader35
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body.preheader35 ], [ %indvars.iv.next.prol, %for.body.prol ]
  %36 = icmp ult i64 %34, 8
  br i1 %36, label %for.end.loopexit, label %for.body.preheader35.split.split

for.body.preheader35.split.split:                 ; preds = %for.body.preheader35.split
  br label %for.body, !dbg !143

for.body:                                         ; preds = %for.body, %for.body.preheader35.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader35.split.split ], [ %indvars.iv.next.7, %for.body ]
  %arrayidx = getelementptr inbounds i32* %0, i64 %indvars.iv, !dbg !143
  %37 = trunc i64 %indvars.iv to i32, !dbg !143
  store i32 %37, i32* %arrayidx, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !142
  %arrayidx.1 = getelementptr inbounds i32* %0, i64 %indvars.iv.next, !dbg !143
  %38 = trunc i64 %indvars.iv.next to i32, !dbg !143
  store i32 %38, i32* %arrayidx.1, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !142
  %arrayidx.2 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.1, !dbg !143
  %39 = trunc i64 %indvars.iv.next.1 to i32, !dbg !143
  store i32 %39, i32* %arrayidx.2, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !142
  %arrayidx.3 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.2, !dbg !143
  %40 = trunc i64 %indvars.iv.next.2 to i32, !dbg !143
  store i32 %40, i32* %arrayidx.3, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !142
  %arrayidx.4 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.3, !dbg !143
  %41 = trunc i64 %indvars.iv.next.3 to i32, !dbg !143
  store i32 %41, i32* %arrayidx.4, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.next.3, 1, !dbg !142
  %arrayidx.5 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.4, !dbg !143
  %42 = trunc i64 %indvars.iv.next.4 to i32, !dbg !143
  store i32 %42, i32* %arrayidx.5, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.next.4, 1, !dbg !142
  %arrayidx.6 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.5, !dbg !143
  %43 = trunc i64 %indvars.iv.next.5 to i32, !dbg !143
  store i32 %43, i32* %arrayidx.6, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.next.5, 1, !dbg !142
  %arrayidx.7 = getelementptr inbounds i32* %0, i64 %indvars.iv.next.6, !dbg !143
  %44 = trunc i64 %indvars.iv.next.6 to i32, !dbg !143
  store i32 %44, i32* %arrayidx.7, align 4, !dbg !143, !tbaa !123
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.next.6, 1, !dbg !142
  %cmp.7 = icmp slt i64 %indvars.iv.next.7, %conv, !dbg !139
  br i1 %cmp.7, label %for.body, label %for.end.loopexit.unr-lcssa, !dbg !142, !llvm.loop !150

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader35.split, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !151, metadata !75), !dbg !153
  tail call void @llvm.dbg.value(metadata i32 %size, i64 0, metadata !154, metadata !75), !dbg !155
  tail call void @llvm.dbg.value(metadata i32 %size, i64 0, metadata !156, metadata !75), !dbg !157
  %conv.i = sitofp i32 %size to double, !dbg !158
  %45 = load i64* @next, align 8, !dbg !159, !tbaa !67
  %mul.i.i = mul i64 %45, 1103515245, !dbg !159
  %add.i.i = add i64 %mul.i.i, 12345, !dbg !159
  store i64 %add.i.i, i64* @next, align 8, !dbg !161, !tbaa !67
  %div.i.i = lshr i64 %add.i.i, 16, !dbg !162
  %conv.i.i = trunc i64 %div.i.i to i32, !dbg !163
  %rem.i.i = urem i32 %conv.i.i, 32767, !dbg !163
  %add1.i.i = add nuw nsw i32 %rem.i.i, 1, !dbg !163
  %conv1.i = sitofp i32 %add1.i.i to double, !dbg !160
  %div.i = fmul double %conv1.i, 0x3F00000000000000, !dbg !160
  %mul.i = fmul double %conv.i, %div.i, !dbg !158
  %conv2.i = fptosi double %mul.i to i32, !dbg !164
  tail call void @llvm.dbg.value(metadata i32 %conv2.i, i64 0, metadata !165, metadata !75), !dbg !166
  %cmp.i = icmp eq i32 %conv2.i, %size, !dbg !167
  %add4.i = add nsw i32 %conv2.i, 1, !dbg !168
  %sub5.i = sext i1 %cmp.i to i32, !dbg !169
  %cond.i = add nsw i32 %add4.i, %sub5.i, !dbg !169
  store i32 %cond.i, i32* %0, align 4, !dbg !170, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !171, metadata !75), !dbg !173
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !174, metadata !75), !dbg !175
  %cmp23.i = icmp eq i32 %size, 0, !dbg !176
  br i1 %cmp23.i, label %shuffle.exit, label %for.body.lr.ph.i, !dbg !177

for.body.lr.ph.i:                                 ; preds = %for.end
  %conv.i13 = sext i32 %size to i64, !dbg !178
  br label %for.body.i, !dbg !177

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %add.i25.i = phi i64 [ %add.i.i, %for.body.lr.ph.i ], [ %add.i.i16, %for.body.i ], !dbg !179
  %i.024.i = phi i64 [ %conv.i13, %for.body.lr.ph.i ], [ %dec.i, %for.body.i ], !dbg !172
  %add.i = add i64 %i.024.i, 1, !dbg !179
  %conv2.i14 = uitofp i64 %add.i to double, !dbg !180
  %mul.i.i15 = mul i64 %add.i25.i, 1103515245, !dbg !181
  %add.i.i16 = add i64 %mul.i.i15, 12345, !dbg !181
  %div.i.i17 = lshr i64 %add.i.i16, 16, !dbg !183
  %conv.i.i18 = trunc i64 %div.i.i17 to i32, !dbg !184
  %rem.i.i19 = urem i32 %conv.i.i18, 32767, !dbg !184
  %add1.i.i20 = add nuw nsw i32 %rem.i.i19, 1, !dbg !184
  %conv3.i = sitofp i32 %add1.i.i20 to double, !dbg !182
  %div.i21 = fmul double %conv3.i, 0x3F00000000000000, !dbg !182
  %mul.i22 = fmul double %conv2.i14, %div.i21, !dbg !180
  %conv4.i = fptosi double %mul.i22 to i32, !dbg !185
  %conv5.i = sext i32 %conv4.i to i64, !dbg !185
  tail call void @llvm.dbg.value(metadata i64 %conv5.i, i64 0, metadata !186, metadata !75), !dbg !187
  %cmp7.i = icmp eq i64 %conv5.i, %add.i, !dbg !188
  %sub9.i = sext i1 %cmp7.i to i64, !dbg !189
  %cond.i23 = add nsw i64 %sub9.i, %conv5.i, !dbg !189
  tail call void @llvm.dbg.value(metadata i64 %cond.i23, i64 0, metadata !190, metadata !75), !dbg !191
  %arrayidx.i = getelementptr inbounds i32* %0, i64 %i.024.i, !dbg !192
  %46 = load i32* %arrayidx.i, align 4, !dbg !192, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32 %46, i64 0, metadata !193, metadata !75), !dbg !194
  %arrayidx10.i = getelementptr inbounds i32* %0, i64 %cond.i23, !dbg !195
  %47 = load i32* %arrayidx10.i, align 4, !dbg !195, !tbaa !123
  store i32 %47, i32* %arrayidx.i, align 4, !dbg !196, !tbaa !123
  store i32 %46, i32* %arrayidx10.i, align 4, !dbg !197, !tbaa !123
  %dec.i = add i64 %i.024.i, -1, !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %dec.i, i64 0, metadata !199, metadata !75), !dbg !200
  %cmp.i24 = icmp eq i64 %dec.i, 0, !dbg !176
  br i1 %cmp.i24, label %for.cond.for.end_crit_edge.i, label %for.body.i, !dbg !177

for.cond.for.end_crit_edge.i:                     ; preds = %for.body.i
  %add.i.i16.lcssa = phi i64 [ %add.i.i16, %for.body.i ]
  store i64 %add.i.i16.lcssa, i64* @next, align 8, !dbg !201, !tbaa !67
  br label %shuffle.exit, !dbg !177

shuffle.exit:                                     ; preds = %for.end, %for.cond.for.end_crit_edge.i
  ret i32* %0, !dbg !202
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readonly uwtable
define i32 @findDuplicate(i32* nocapture readonly %data, i32 %len) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %data, i64 0, metadata !50, metadata !75), !dbg !203
  tail call void @llvm.dbg.value(metadata i32 %len, i64 0, metadata !51, metadata !75), !dbg !204
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !53, metadata !75), !dbg !205
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !75), !dbg !206
  %cmp9 = icmp sgt i32 %len, 0, !dbg !207
  br i1 %cmp9, label %for.body.lr.ph, label %for.end, !dbg !210

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %len, -1, !dbg !210
  %1 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %1, 1, !dbg !210
  %end.idx = add nuw nsw i64 %1, 1, !dbg !210
  %n.vec = and i64 %2, 8589934588, !dbg !210
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !210
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body.lr.ph
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !210
  %vec.phi = phi <2 x i32> [ %13, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %vec.phi13 = phi <2 x i32> [ %14, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %3 = add <2 x i64> %broadcast.splat, <i64 1, i64 2>, !dbg !210
  %4 = add <2 x i64> %broadcast.splat, <i64 3, i64 4>, !dbg !210
  %5 = trunc <2 x i64> %3 to <2 x i32>, !dbg !211
  %6 = trunc <2 x i64> %4 to <2 x i32>, !dbg !211
  %7 = xor <2 x i32> %vec.phi, %5, !dbg !211
  %8 = xor <2 x i32> %vec.phi13, %6, !dbg !211
  %9 = getelementptr inbounds i32* %data, i64 %index, !dbg !212
  %10 = bitcast i32* %9 to <2 x i32>*, !dbg !212
  %wide.load = load <2 x i32>* %10, align 4, !dbg !212, !tbaa !123
  %.sum23 = or i64 %index, 2, !dbg !212
  %11 = getelementptr i32* %data, i64 %.sum23, !dbg !212
  %12 = bitcast i32* %11 to <2 x i32>*, !dbg !212
  %wide.load14 = load <2 x i32>* %12, align 4, !dbg !212, !tbaa !123
  %13 = xor <2 x i32> %7, %wide.load, !dbg !211
  %14 = xor <2 x i32> %8, %wide.load14, !dbg !211
  %index.next = add i64 %index, 4, !dbg !210
  %15 = icmp eq i64 %index.next, %n.vec, !dbg !210
  br i1 %15, label %middle.block.loopexit, label %vector.body, !dbg !210, !llvm.loop !213

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa24 = phi <2 x i32> [ %14, %vector.body ]
  %.lcssa = phi <2 x i32> [ %13, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body.lr.ph
  %resume.val = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <2 x i32> [ zeroinitializer, %for.body.lr.ph ], [ %.lcssa, %middle.block.loopexit ], !dbg !211
  %rdx.vec.exit.phi21 = phi <2 x i32> [ zeroinitializer, %for.body.lr.ph ], [ %.lcssa24, %middle.block.loopexit ], !dbg !211
  %bin.rdx = xor <2 x i32> %rdx.vec.exit.phi21, %rdx.vec.exit.phi, !dbg !211
  %rdx.shuf = shufflevector <2 x i32> %bin.rdx, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !211
  %bin.rdx22 = xor <2 x i32> %bin.rdx, %rdx.shuf, !dbg !211
  %16 = extractelement <2 x i32> %bin.rdx22, i32 0, !dbg !211
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block
  %17 = trunc i64 %resume.val to i32
  %18 = sub i32 %len, %17
  %xtraiter = and i32 %18, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %18, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %resume.val, %for.body.preheader ]
  %result.011.prol = phi i32 [ %xor1.prol, %for.body.prol ], [ %16, %for.body.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.preheader ], [ %prol.iter.sub, %for.body.prol ]
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !210
  %19 = trunc i64 %indvars.iv.next.prol to i32, !dbg !211
  %xor.prol = xor i32 %result.011.prol, %19, !dbg !211
  %arrayidx.prol = getelementptr inbounds i32* %data, i64 %indvars.iv.prol, !dbg !212
  %20 = load i32* %arrayidx.prol, align 4, !dbg !212, !tbaa !123
  %xor1.prol = xor i32 %xor.prol, %20, !dbg !211
  tail call void @llvm.dbg.value(metadata i32 %xor1.prol, i64 0, metadata !53, metadata !75), !dbg !205
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !210
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !210
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !210
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !210
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !214

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %xor1.lcssa.unr = phi i32 [ 0, %for.body.preheader ], [ %xor1.prol, %for.body.prol ]
  %indvars.iv.unr = phi i64 [ %resume.val, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %result.011.unr = phi i32 [ %16, %for.body.preheader ], [ %xor1.prol, %for.body.prol ]
  %21 = icmp ult i32 %18, 4
  br i1 %21, label %for.end.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !210

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader.split.split ], [ %indvars.iv.next.3, %for.body ]
  %result.011 = phi i32 [ %result.011.unr, %for.body.preheader.split.split ], [ %xor1.3, %for.body ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !210
  %22 = trunc i64 %indvars.iv.next to i32, !dbg !211
  %xor = xor i32 %result.011, %22, !dbg !211
  %arrayidx = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !212
  %23 = load i32* %arrayidx, align 4, !dbg !212, !tbaa !123
  %xor1 = xor i32 %xor, %23, !dbg !211
  tail call void @llvm.dbg.value(metadata i32 %xor1, i64 0, metadata !53, metadata !75), !dbg !205
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !210
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !210
  %24 = trunc i64 %indvars.iv.next.1 to i32, !dbg !211
  %xor.1 = xor i32 %xor1, %24, !dbg !211
  %arrayidx.1 = getelementptr inbounds i32* %data, i64 %indvars.iv.next, !dbg !212
  %25 = load i32* %arrayidx.1, align 4, !dbg !212, !tbaa !123
  %xor1.1 = xor i32 %xor.1, %25, !dbg !211
  tail call void @llvm.dbg.value(metadata i32 %xor1, i64 0, metadata !53, metadata !75), !dbg !205
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !210
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !210
  %26 = trunc i64 %indvars.iv.next.2 to i32, !dbg !211
  %xor.2 = xor i32 %xor1.1, %26, !dbg !211
  %arrayidx.2 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.1, !dbg !212
  %27 = load i32* %arrayidx.2, align 4, !dbg !212, !tbaa !123
  %xor1.2 = xor i32 %xor.2, %27, !dbg !211
  tail call void @llvm.dbg.value(metadata i32 %xor1, i64 0, metadata !53, metadata !75), !dbg !205
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !210
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !210
  %28 = trunc i64 %indvars.iv.next.3 to i32, !dbg !211
  %xor.3 = xor i32 %xor1.2, %28, !dbg !211
  %arrayidx.3 = getelementptr inbounds i32* %data, i64 %indvars.iv.next.2, !dbg !212
  %29 = load i32* %arrayidx.3, align 4, !dbg !212, !tbaa !123
  %xor1.3 = xor i32 %xor.3, %29, !dbg !211
  tail call void @llvm.dbg.value(metadata i32 %xor1, i64 0, metadata !53, metadata !75), !dbg !205
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !210
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0, !dbg !210
  br i1 %exitcond.3, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !210, !llvm.loop !215

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %xor1.lcssa.ph = phi i32 [ %xor1.3, %for.body ]
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader.split, %for.end.loopexit.unr-lcssa
  %xor1.lcssa = phi i32 [ %xor1.lcssa.unr, %for.body.preheader.split ], [ %xor1.lcssa.ph, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  %result.0.lcssa = phi i32 [ 0, %entry ], [ %16, %middle.block ], [ %xor1.lcssa, %for.end.loopexit ]
  %xor2 = xor i32 %result.0.lcssa, %len, !dbg !216
  tail call void @llvm.dbg.value(metadata i32 %xor2, i64 0, metadata !53, metadata !75), !dbg !205
  ret i32 %xor2, !dbg !217
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !218, metadata !75), !dbg !220
  store i64 1, i64* @next, align 8, !dbg !221, !tbaa !67
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !75), !dbg !222
  %call = tail call i32* @createRandomArray(i32 500000), !dbg !223
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !228
  br label %vector.ph, !dbg !229

vector.ph:                                        ; preds = %for.body.i, %entry
  %j.011 = phi i32 [ 0, %entry ], [ %inc, %for.body.i ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !231
  %vec.phi = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %10, %vector.body ]
  %vec.phi16 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %11, %vector.body ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0, !dbg !231
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !231
  %0 = add <2 x i64> %broadcast.splat, <i64 1, i64 2>, !dbg !233
  %1 = add <2 x i64> %broadcast.splat, <i64 3, i64 4>, !dbg !233
  %2 = trunc <2 x i64> %0 to <2 x i32>, !dbg !234
  %3 = trunc <2 x i64> %1 to <2 x i32>, !dbg !234
  %4 = xor <2 x i32> %2, %vec.phi, !dbg !234
  %5 = xor <2 x i32> %3, %vec.phi16, !dbg !234
  %6 = getelementptr inbounds i32* %call, i64 %index, !dbg !235
  %7 = bitcast i32* %6 to <2 x i32>*, !dbg !235
  %wide.load = load <2 x i32>* %7, align 4, !dbg !235, !tbaa !123
  %.sum132 = or i64 %index, 2, !dbg !235
  %8 = getelementptr i32* %call, i64 %.sum132, !dbg !235
  %9 = bitcast i32* %8 to <2 x i32>*, !dbg !235
  %wide.load17 = load <2 x i32>* %9, align 4, !dbg !235, !tbaa !123
  %10 = xor <2 x i32> %4, %wide.load, !dbg !234
  %11 = xor <2 x i32> %5, %wide.load17, !dbg !234
  %index.next = add i64 %index, 4, !dbg !231
  %12 = icmp eq i64 %index.next, 500000, !dbg !231
  br i1 %12, label %middle.block, label %vector.body, !dbg !231, !llvm.loop !236

middle.block:                                     ; preds = %vector.body
  %.lcssa145 = phi <2 x i32> [ %11, %vector.body ]
  %.lcssa144 = phi <2 x i32> [ %10, %vector.body ]
  %bin.rdx = xor <2 x i32> %.lcssa145, %.lcssa144, !dbg !234
  %rdx.shuf = shufflevector <2 x i32> %bin.rdx, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !234
  %bin.rdx19 = xor <2 x i32> %bin.rdx, %rdx.shuf, !dbg !234
  %13 = extractelement <2 x i32> %bin.rdx19, i32 0, !dbg !234
  br label %for.body.i, !dbg !233

for.body.i:                                       ; preds = %middle.block
  %xor.i = xor i32 500001, %13, !dbg !234
  %arrayidx.i = getelementptr inbounds i32* %call, i64 500000, !dbg !235
  %14 = load i32* %arrayidx.i, align 4, !dbg !235, !tbaa !123
  %xor1.i = xor i32 %xor.i, %14, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %xor1.i, i64 0, metadata !237, metadata !75), !dbg !238
  %inc = add nuw nsw i32 %j.011, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !75), !dbg !228
  %exitcond13 = icmp eq i32 %inc, 200, !dbg !229
  br i1 %exitcond13, label %for.end, label %vector.ph, !dbg !229

for.end:                                          ; preds = %for.body.i
  %xor1.i.lcssa.lcssa = phi i32 [ %xor1.i, %for.body.i ]
  %xor2.i.le = xor i32 %xor1.i.lcssa.lcssa, 500001, !dbg !240
  %15 = bitcast i32* %call to i8*, !dbg !241
  tail call void @free(i8* %15) #4, !dbg !242
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %xor2.i.le) #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !75), !dbg !222
  %call.1 = tail call i32* @createRandomArray(i32 500000), !dbg !223
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !228
  br label %vector.ph22, !dbg !229

vector.ph22:                                      ; preds = %for.body.i.1, %for.end
  %j.011.1 = phi i32 [ 0, %for.end ], [ %inc.1, %for.body.i.1 ]
  br label %vector.body23

vector.body23:                                    ; preds = %vector.body23, %vector.ph22
  %index26 = phi i64 [ 0, %vector.ph22 ], [ %index.next33, %vector.body23 ], !dbg !231
  %vec.phi38 = phi <2 x i32> [ zeroinitializer, %vector.ph22 ], [ %26, %vector.body23 ]
  %vec.phi39 = phi <2 x i32> [ zeroinitializer, %vector.ph22 ], [ %27, %vector.body23 ]
  %broadcast.splatinsert34 = insertelement <2 x i64> undef, i64 %index26, i32 0, !dbg !231
  %broadcast.splat35 = shufflevector <2 x i64> %broadcast.splatinsert34, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !231
  %16 = add <2 x i64> %broadcast.splat35, <i64 1, i64 2>, !dbg !233
  %17 = add <2 x i64> %broadcast.splat35, <i64 3, i64 4>, !dbg !233
  %18 = trunc <2 x i64> %16 to <2 x i32>, !dbg !234
  %19 = trunc <2 x i64> %17 to <2 x i32>, !dbg !234
  %20 = xor <2 x i32> %18, %vec.phi38, !dbg !234
  %21 = xor <2 x i32> %19, %vec.phi39, !dbg !234
  %22 = getelementptr inbounds i32* %call.1, i64 %index26, !dbg !235
  %23 = bitcast i32* %22 to <2 x i32>*, !dbg !235
  %wide.load40 = load <2 x i32>* %23, align 4, !dbg !235, !tbaa !123
  %.sum133 = or i64 %index26, 2, !dbg !235
  %24 = getelementptr i32* %call.1, i64 %.sum133, !dbg !235
  %25 = bitcast i32* %24 to <2 x i32>*, !dbg !235
  %wide.load41 = load <2 x i32>* %25, align 4, !dbg !235, !tbaa !123
  %26 = xor <2 x i32> %20, %wide.load40, !dbg !234
  %27 = xor <2 x i32> %21, %wide.load41, !dbg !234
  %index.next33 = add i64 %index26, 4, !dbg !231
  %28 = icmp eq i64 %index.next33, 500000, !dbg !231
  br i1 %28, label %middle.block24, label %vector.body23, !dbg !231, !llvm.loop !244

middle.block24:                                   ; preds = %vector.body23
  %.lcssa143 = phi <2 x i32> [ %27, %vector.body23 ]
  %.lcssa142 = phi <2 x i32> [ %26, %vector.body23 ]
  %bin.rdx44 = xor <2 x i32> %.lcssa143, %.lcssa142, !dbg !234
  %rdx.shuf45 = shufflevector <2 x i32> %bin.rdx44, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !234
  %bin.rdx46 = xor <2 x i32> %bin.rdx44, %rdx.shuf45, !dbg !234
  %29 = extractelement <2 x i32> %bin.rdx46, i32 0, !dbg !234
  br label %for.body.i.1, !dbg !233

for.body.i.1:                                     ; preds = %middle.block24
  %xor.i.1 = xor i32 500001, %29, !dbg !234
  %arrayidx.i.1 = getelementptr inbounds i32* %call.1, i64 500000, !dbg !235
  %30 = load i32* %arrayidx.i.1, align 4, !dbg !235, !tbaa !123
  %xor1.i.1 = xor i32 %xor.i.1, %30, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %xor1.i, i64 0, metadata !237, metadata !75), !dbg !238
  %inc.1 = add nuw nsw i32 %j.011.1, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !75), !dbg !228
  %exitcond13.1 = icmp eq i32 %inc.1, 200, !dbg !229
  br i1 %exitcond13.1, label %for.end.1, label %vector.ph22, !dbg !229

for.end.1:                                        ; preds = %for.body.i.1
  %xor1.i.1.lcssa.lcssa = phi i32 [ %xor1.i.1, %for.body.i.1 ]
  %xor2.i.le.1 = xor i32 %xor1.i.1.lcssa.lcssa, 500001, !dbg !240
  %31 = bitcast i32* %call.1 to i8*, !dbg !241
  tail call void @free(i8* %31) #4, !dbg !242
  %call5.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %xor2.i.le.1) #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !75), !dbg !222
  %call.2 = tail call i32* @createRandomArray(i32 500000), !dbg !223
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !228
  br label %vector.ph50, !dbg !229

vector.ph50:                                      ; preds = %for.body.i.2, %for.end.1
  %j.011.2 = phi i32 [ 0, %for.end.1 ], [ %inc.2, %for.body.i.2 ]
  br label %vector.body51

vector.body51:                                    ; preds = %vector.body51, %vector.ph50
  %index54 = phi i64 [ 0, %vector.ph50 ], [ %index.next61, %vector.body51 ], !dbg !231
  %vec.phi66 = phi <2 x i32> [ zeroinitializer, %vector.ph50 ], [ %42, %vector.body51 ]
  %vec.phi67 = phi <2 x i32> [ zeroinitializer, %vector.ph50 ], [ %43, %vector.body51 ]
  %broadcast.splatinsert62 = insertelement <2 x i64> undef, i64 %index54, i32 0, !dbg !231
  %broadcast.splat63 = shufflevector <2 x i64> %broadcast.splatinsert62, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !231
  %32 = add <2 x i64> %broadcast.splat63, <i64 1, i64 2>, !dbg !233
  %33 = add <2 x i64> %broadcast.splat63, <i64 3, i64 4>, !dbg !233
  %34 = trunc <2 x i64> %32 to <2 x i32>, !dbg !234
  %35 = trunc <2 x i64> %33 to <2 x i32>, !dbg !234
  %36 = xor <2 x i32> %34, %vec.phi66, !dbg !234
  %37 = xor <2 x i32> %35, %vec.phi67, !dbg !234
  %38 = getelementptr inbounds i32* %call.2, i64 %index54, !dbg !235
  %39 = bitcast i32* %38 to <2 x i32>*, !dbg !235
  %wide.load68 = load <2 x i32>* %39, align 4, !dbg !235, !tbaa !123
  %.sum134 = or i64 %index54, 2, !dbg !235
  %40 = getelementptr i32* %call.2, i64 %.sum134, !dbg !235
  %41 = bitcast i32* %40 to <2 x i32>*, !dbg !235
  %wide.load69 = load <2 x i32>* %41, align 4, !dbg !235, !tbaa !123
  %42 = xor <2 x i32> %36, %wide.load68, !dbg !234
  %43 = xor <2 x i32> %37, %wide.load69, !dbg !234
  %index.next61 = add i64 %index54, 4, !dbg !231
  %44 = icmp eq i64 %index.next61, 500000, !dbg !231
  br i1 %44, label %middle.block52, label %vector.body51, !dbg !231, !llvm.loop !245

middle.block52:                                   ; preds = %vector.body51
  %.lcssa141 = phi <2 x i32> [ %43, %vector.body51 ]
  %.lcssa140 = phi <2 x i32> [ %42, %vector.body51 ]
  %bin.rdx72 = xor <2 x i32> %.lcssa141, %.lcssa140, !dbg !234
  %rdx.shuf73 = shufflevector <2 x i32> %bin.rdx72, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !234
  %bin.rdx74 = xor <2 x i32> %bin.rdx72, %rdx.shuf73, !dbg !234
  %45 = extractelement <2 x i32> %bin.rdx74, i32 0, !dbg !234
  br label %for.body.i.2, !dbg !233

for.body.i.2:                                     ; preds = %middle.block52
  %xor.i.2 = xor i32 500001, %45, !dbg !234
  %arrayidx.i.2 = getelementptr inbounds i32* %call.2, i64 500000, !dbg !235
  %46 = load i32* %arrayidx.i.2, align 4, !dbg !235, !tbaa !123
  %xor1.i.2 = xor i32 %xor.i.2, %46, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %xor1.i, i64 0, metadata !237, metadata !75), !dbg !238
  %inc.2 = add nuw nsw i32 %j.011.2, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !75), !dbg !228
  %exitcond13.2 = icmp eq i32 %inc.2, 200, !dbg !229
  br i1 %exitcond13.2, label %for.end.2, label %vector.ph50, !dbg !229

for.end.2:                                        ; preds = %for.body.i.2
  %xor1.i.2.lcssa.lcssa = phi i32 [ %xor1.i.2, %for.body.i.2 ]
  %xor2.i.le.2 = xor i32 %xor1.i.2.lcssa.lcssa, 500001, !dbg !240
  %47 = bitcast i32* %call.2 to i8*, !dbg !241
  tail call void @free(i8* %47) #4, !dbg !242
  %call5.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %xor2.i.le.2) #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !75), !dbg !222
  %call.3 = tail call i32* @createRandomArray(i32 500000), !dbg !223
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !228
  br label %vector.ph78, !dbg !229

vector.ph78:                                      ; preds = %for.body.i.3, %for.end.2
  %j.011.3 = phi i32 [ 0, %for.end.2 ], [ %inc.3, %for.body.i.3 ]
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79, %vector.ph78
  %index82 = phi i64 [ 0, %vector.ph78 ], [ %index.next89, %vector.body79 ], !dbg !231
  %vec.phi94 = phi <2 x i32> [ zeroinitializer, %vector.ph78 ], [ %58, %vector.body79 ]
  %vec.phi95 = phi <2 x i32> [ zeroinitializer, %vector.ph78 ], [ %59, %vector.body79 ]
  %broadcast.splatinsert90 = insertelement <2 x i64> undef, i64 %index82, i32 0, !dbg !231
  %broadcast.splat91 = shufflevector <2 x i64> %broadcast.splatinsert90, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !231
  %48 = add <2 x i64> %broadcast.splat91, <i64 1, i64 2>, !dbg !233
  %49 = add <2 x i64> %broadcast.splat91, <i64 3, i64 4>, !dbg !233
  %50 = trunc <2 x i64> %48 to <2 x i32>, !dbg !234
  %51 = trunc <2 x i64> %49 to <2 x i32>, !dbg !234
  %52 = xor <2 x i32> %50, %vec.phi94, !dbg !234
  %53 = xor <2 x i32> %51, %vec.phi95, !dbg !234
  %54 = getelementptr inbounds i32* %call.3, i64 %index82, !dbg !235
  %55 = bitcast i32* %54 to <2 x i32>*, !dbg !235
  %wide.load96 = load <2 x i32>* %55, align 4, !dbg !235, !tbaa !123
  %.sum135 = or i64 %index82, 2, !dbg !235
  %56 = getelementptr i32* %call.3, i64 %.sum135, !dbg !235
  %57 = bitcast i32* %56 to <2 x i32>*, !dbg !235
  %wide.load97 = load <2 x i32>* %57, align 4, !dbg !235, !tbaa !123
  %58 = xor <2 x i32> %52, %wide.load96, !dbg !234
  %59 = xor <2 x i32> %53, %wide.load97, !dbg !234
  %index.next89 = add i64 %index82, 4, !dbg !231
  %60 = icmp eq i64 %index.next89, 500000, !dbg !231
  br i1 %60, label %middle.block80, label %vector.body79, !dbg !231, !llvm.loop !246

middle.block80:                                   ; preds = %vector.body79
  %.lcssa139 = phi <2 x i32> [ %59, %vector.body79 ]
  %.lcssa138 = phi <2 x i32> [ %58, %vector.body79 ]
  %bin.rdx100 = xor <2 x i32> %.lcssa139, %.lcssa138, !dbg !234
  %rdx.shuf101 = shufflevector <2 x i32> %bin.rdx100, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !234
  %bin.rdx102 = xor <2 x i32> %bin.rdx100, %rdx.shuf101, !dbg !234
  %61 = extractelement <2 x i32> %bin.rdx102, i32 0, !dbg !234
  br label %for.body.i.3, !dbg !233

for.body.i.3:                                     ; preds = %middle.block80
  %xor.i.3 = xor i32 500001, %61, !dbg !234
  %arrayidx.i.3 = getelementptr inbounds i32* %call.3, i64 500000, !dbg !235
  %62 = load i32* %arrayidx.i.3, align 4, !dbg !235, !tbaa !123
  %xor1.i.3 = xor i32 %xor.i.3, %62, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %xor1.i, i64 0, metadata !237, metadata !75), !dbg !238
  %inc.3 = add nuw nsw i32 %j.011.3, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !75), !dbg !228
  %exitcond13.3 = icmp eq i32 %inc.3, 200, !dbg !229
  br i1 %exitcond13.3, label %for.end.3, label %vector.ph78, !dbg !229

for.end.3:                                        ; preds = %for.body.i.3
  %xor1.i.3.lcssa.lcssa = phi i32 [ %xor1.i.3, %for.body.i.3 ]
  %xor2.i.le.3 = xor i32 %xor1.i.3.lcssa.lcssa, 500001, !dbg !240
  %63 = bitcast i32* %call.3 to i8*, !dbg !241
  tail call void @free(i8* %63) #4, !dbg !242
  %call5.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %xor2.i.le.3) #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !75), !dbg !222
  %call.4 = tail call i32* @createRandomArray(i32 500000), !dbg !223
  tail call void @llvm.dbg.value(metadata i32* %call, i64 0, metadata !59, metadata !75), !dbg !227
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !57, metadata !75), !dbg !228
  br label %vector.ph106, !dbg !229

vector.ph106:                                     ; preds = %for.body.i.4, %for.end.3
  %j.011.4 = phi i32 [ 0, %for.end.3 ], [ %inc.4, %for.body.i.4 ]
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107, %vector.ph106
  %index110 = phi i64 [ 0, %vector.ph106 ], [ %index.next117, %vector.body107 ], !dbg !231
  %vec.phi122 = phi <2 x i32> [ zeroinitializer, %vector.ph106 ], [ %74, %vector.body107 ]
  %vec.phi123 = phi <2 x i32> [ zeroinitializer, %vector.ph106 ], [ %75, %vector.body107 ]
  %broadcast.splatinsert118 = insertelement <2 x i64> undef, i64 %index110, i32 0, !dbg !231
  %broadcast.splat119 = shufflevector <2 x i64> %broadcast.splatinsert118, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !231
  %64 = add <2 x i64> %broadcast.splat119, <i64 1, i64 2>, !dbg !233
  %65 = add <2 x i64> %broadcast.splat119, <i64 3, i64 4>, !dbg !233
  %66 = trunc <2 x i64> %64 to <2 x i32>, !dbg !234
  %67 = trunc <2 x i64> %65 to <2 x i32>, !dbg !234
  %68 = xor <2 x i32> %66, %vec.phi122, !dbg !234
  %69 = xor <2 x i32> %67, %vec.phi123, !dbg !234
  %70 = getelementptr inbounds i32* %call.4, i64 %index110, !dbg !235
  %71 = bitcast i32* %70 to <2 x i32>*, !dbg !235
  %wide.load124 = load <2 x i32>* %71, align 4, !dbg !235, !tbaa !123
  %.sum136 = or i64 %index110, 2, !dbg !235
  %72 = getelementptr i32* %call.4, i64 %.sum136, !dbg !235
  %73 = bitcast i32* %72 to <2 x i32>*, !dbg !235
  %wide.load125 = load <2 x i32>* %73, align 4, !dbg !235, !tbaa !123
  %74 = xor <2 x i32> %68, %wide.load124, !dbg !234
  %75 = xor <2 x i32> %69, %wide.load125, !dbg !234
  %index.next117 = add i64 %index110, 4, !dbg !231
  %76 = icmp eq i64 %index.next117, 500000, !dbg !231
  br i1 %76, label %middle.block108, label %vector.body107, !dbg !231, !llvm.loop !247

middle.block108:                                  ; preds = %vector.body107
  %.lcssa137 = phi <2 x i32> [ %75, %vector.body107 ]
  %.lcssa = phi <2 x i32> [ %74, %vector.body107 ]
  %bin.rdx128 = xor <2 x i32> %.lcssa137, %.lcssa, !dbg !234
  %rdx.shuf129 = shufflevector <2 x i32> %bin.rdx128, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !234
  %bin.rdx130 = xor <2 x i32> %bin.rdx128, %rdx.shuf129, !dbg !234
  %77 = extractelement <2 x i32> %bin.rdx130, i32 0, !dbg !234
  br label %for.body.i.4, !dbg !233

for.body.i.4:                                     ; preds = %middle.block108
  %xor.i.4 = xor i32 500001, %77, !dbg !234
  %arrayidx.i.4 = getelementptr inbounds i32* %call.4, i64 500000, !dbg !235
  %78 = load i32* %arrayidx.i.4, align 4, !dbg !235, !tbaa !123
  %xor1.i.4 = xor i32 %xor.i.4, %78, !dbg !234
  tail call void @llvm.dbg.value(metadata i32 %xor1.i, i64 0, metadata !237, metadata !75), !dbg !238
  %inc.4 = add nuw nsw i32 %j.011.4, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !57, metadata !75), !dbg !228
  %exitcond13.4 = icmp eq i32 %inc.4, 200, !dbg !229
  br i1 %exitcond13.4, label %for.end.4, label %vector.ph106, !dbg !229

for.end.4:                                        ; preds = %for.body.i.4
  %xor1.i.4.lcssa.lcssa = phi i32 [ %xor1.i.4, %for.body.i.4 ]
  %xor2.i.le.4 = xor i32 %xor1.i.4.lcssa.lcssa, 500001, !dbg !240
  %79 = bitcast i32* %call.4 to i8*, !dbg !241
  tail call void @free(i8* %79) #4, !dbg !242
  %call5.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %xor2.i.le.4) #4, !dbg !243
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !56, metadata !75), !dbg !222
  ret i32 0, !dbg !248
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !60, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = !{!"puzzle.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!7 = !{!8, !12, !17, !25, !38, !46, !54}
!8 = !{!"0x2e\00rand\00rand\00\0015\000\001\000\000\00256\001\0015", !1, !9, !10, null, i32 ()* @rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!5}
!12 = !{!"0x2e\00srand\00srand\00\0020\000\001\000\000\00256\001\0020", !1, !9, !13, null, void (i32)* @srand, null, null, !15} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !4}
!15 = !{!16}
!16 = !{!"0x101\00seed\0016777236\000", !12, !9, !4} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!17 = !{!"0x2e\00randInt\00randInt\00\0025\000\001\000\000\00256\001\0025", !1, !9, !18, null, i32 (i32, i32)* @randInt, null, null, !20} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!5, !5, !5}
!20 = !{!21, !22, !23, !24}
!21 = !{!"0x101\00min\0016777241\000", !17, !9, !5} ; [ DW_TAG_arg_variable ] [min] [line 25]
!22 = !{!"0x101\00max\0033554457\000", !17, !9, !5} ; [ DW_TAG_arg_variable ] [max] [line 25]
!23 = !{!"0x100\00k\0026\000", !17, !9, !5}       ; [ DW_TAG_auto_variable ] [k] [line 26]
!24 = !{!"0x100\00n\0026\000", !17, !9, !5}       ; [ DW_TAG_auto_variable ] [n] [line 26]
!25 = !{!"0x2e\00shuffle\00shuffle\00\0032\000\001\000\000\00256\001\0032", !1, !9, !26, null, void (i32*, i32)* @shuffle, null, null, !28} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{null, !6, !5}
!28 = !{!29, !30, !31, !35, !36, !37}
!29 = !{!"0x101\00items\0016777248\000", !25, !9, !6} ; [ DW_TAG_arg_variable ] [items] [line 32]
!30 = !{!"0x101\00len\0033554464\000", !25, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 32]
!31 = !{!"0x100\00j\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [j] [line 33]
!32 = !{!"0x16\00size_t\0062\000\000\000\000", !33, null, !34} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!33 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!34 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!35 = !{!"0x100\00k\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [k] [line 33]
!36 = !{!"0x100\00i\0033\000", !25, !9, !32}      ; [ DW_TAG_auto_variable ] [i] [line 33]
!37 = !{!"0x100\00aux\0034\000", !25, !9, !5}     ; [ DW_TAG_auto_variable ] [aux] [line 34]
!38 = !{!"0x2e\00createRandomArray\00createRandomArray\00\0046\000\001\000\000\00256\001\0046", !1, !9, !39, null, i32* (i32)* @createRandomArray, null, null, !41} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!39 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !40, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!6, !5}
!41 = !{!42, !43, !44, !45}
!42 = !{!"0x101\00size\0016777262\000", !38, !9, !5} ; [ DW_TAG_arg_variable ] [size] [line 46]
!43 = !{!"0x100\00i\0047\000", !38, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 47]
!44 = !{!"0x100\00len\0047\000", !38, !9, !5}     ; [ DW_TAG_auto_variable ] [len] [line 47]
!45 = !{!"0x100\00result\0048\000", !38, !9, !6}  ; [ DW_TAG_auto_variable ] [result] [line 48]
!46 = !{!"0x2e\00findDuplicate\00findDuplicate\00\0059\000\001\000\000\00256\001\0059", !1, !9, !47, null, i32 (i32*, i32)* @findDuplicate, null, null, !49} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!5, !6, !5}
!49 = !{!50, !51, !52, !53}
!50 = !{!"0x101\00data\0016777275\000", !46, !9, !6} ; [ DW_TAG_arg_variable ] [data] [line 59]
!51 = !{!"0x101\00len\0033554491\000", !46, !9, !5} ; [ DW_TAG_arg_variable ] [len] [line 59]
!52 = !{!"0x100\00i\0060\000", !46, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 60]
!53 = !{!"0x100\00result\0061\000", !46, !9, !5}  ; [ DW_TAG_auto_variable ] [result] [line 61]
!54 = !{!"0x2e\00main\00main\00\0069\000\001\000\000\000\001\0069", !1, !9, !10, null, i32 ()* @main, null, null, !55} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!55 = !{!56, !57, !58, !59}
!56 = !{!"0x100\00i\0070\000", !54, !9, !5}       ; [ DW_TAG_auto_variable ] [i] [line 70]
!57 = !{!"0x100\00j\0070\000", !54, !9, !5}       ; [ DW_TAG_auto_variable ] [j] [line 70]
!58 = !{!"0x100\00duplicate\0070\000", !54, !9, !5} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!59 = !{!"0x100\00rndArr\0071\000", !54, !9, !6}  ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!60 = !{!61}
!61 = !{!"0x34\00next\00next\00\0013\001\001", null, !9, !62, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!62 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!63 = !{i32 2, !"Dwarf Version", i32 4}
!64 = !{i32 2, !"Debug Info Version", i32 2}
!65 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!66 = !MDLocation(line: 16, column: 12, scope: !8)
!67 = !{!68, !68, i64 0}
!68 = !{!"long long", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !MDLocation(line: 16, column: 5, scope: !8)
!72 = !MDLocation(line: 17, column: 27, scope: !8)
!73 = !MDLocation(line: 17, column: 12, scope: !8)
!74 = !MDLocation(line: 17, column: 5, scope: !8)
!75 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!76 = !MDLocation(line: 20, column: 26, scope: !12)
!77 = !MDLocation(line: 21, column: 12, scope: !12)
!78 = !MDLocation(line: 21, column: 5, scope: !12)
!79 = !MDLocation(line: 22, column: 1, scope: !12)
!80 = !MDLocation(line: 25, column: 17, scope: !17)
!81 = !MDLocation(line: 25, column: 26, scope: !17)
!82 = !MDLocation(line: 27, column: 10, scope: !17)
!83 = !MDLocation(line: 27, column: 9, scope: !17)
!84 = !MDLocation(line: 26, column: 12, scope: !17)
!85 = !MDLocation(line: 28, column: 15, scope: !17)
!86 = !MDLocation(line: 16, column: 12, scope: !8, inlinedAt: !87)
!87 = !MDLocation(line: 28, column: 20, scope: !17)
!88 = !MDLocation(line: 16, column: 5, scope: !8, inlinedAt: !87)
!89 = !MDLocation(line: 17, column: 27, scope: !8, inlinedAt: !87)
!90 = !MDLocation(line: 17, column: 12, scope: !8, inlinedAt: !87)
!91 = !MDLocation(line: 28, column: 9, scope: !17)
!92 = !MDLocation(line: 26, column: 9, scope: !17)
!93 = !MDLocation(line: 29, column: 13, scope: !17)
!94 = !MDLocation(line: 29, column: 23, scope: !17)
!95 = !MDLocation(line: 29, column: 12, scope: !17)
!96 = !MDLocation(line: 29, column: 5, scope: !97)
!97 = !{!"0xb\004", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!98 = !{!"0xb\003", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!99 = !MDLocation(line: 32, column: 19, scope: !25)
!100 = !MDLocation(line: 32, column: 30, scope: !25)
!101 = !MDLocation(line: 36, column: 13, scope: !102)
!102 = !{!"0xb\0036\005\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!103 = !MDLocation(line: 33, column: 18, scope: !25)
!104 = !MDLocation(line: 36, column: 20, scope: !105)
!105 = !{!"0xb\002", !1, !106}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!106 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!107 = !{!"0xb\0036\005\001", !1, !102}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!108 = !MDLocation(line: 36, column: 5, scope: !102)
!109 = !MDLocation(line: 16, column: 5, scope: !8, inlinedAt: !110)
!110 = !MDLocation(line: 37, column: 30, scope: !111)
!111 = !{!"0xb\0036\0032\002", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!112 = !MDLocation(line: 37, column: 20, scope: !111)
!113 = !MDLocation(line: 37, column: 19, scope: !111)
!114 = !MDLocation(line: 16, column: 12, scope: !8, inlinedAt: !110)
!115 = !MDLocation(line: 17, column: 27, scope: !8, inlinedAt: !110)
!116 = !MDLocation(line: 17, column: 12, scope: !8, inlinedAt: !110)
!117 = !MDLocation(line: 37, column: 13, scope: !111)
!118 = !MDLocation(line: 33, column: 15, scope: !25)
!119 = !MDLocation(line: 38, column: 14, scope: !111)
!120 = !MDLocation(line: 38, column: 13, scope: !111)
!121 = !MDLocation(line: 33, column: 12, scope: !25)
!122 = !MDLocation(line: 40, column: 15, scope: !111)
!123 = !{!124, !124, i64 0}
!124 = !{!"int", !69, i64 0}
!125 = !MDLocation(line: 34, column: 9, scope: !25)
!126 = !MDLocation(line: 41, column: 20, scope: !111)
!127 = !MDLocation(line: 41, column: 9, scope: !111)
!128 = !MDLocation(line: 42, column: 9, scope: !111)
!129 = !MDLocation(line: 36, column: 27, scope: !107)
!130 = !MDLocation(line: 44, column: 1, scope: !25)
!131 = !MDLocation(line: 46, column: 28, scope: !38)
!132 = !MDLocation(line: 50, column: 11, scope: !38)
!133 = !MDLocation(line: 47, column: 12, scope: !38)
!134 = !MDLocation(line: 51, column: 27, scope: !38)
!135 = !MDLocation(line: 51, column: 20, scope: !38)
!136 = !MDLocation(line: 51, column: 14, scope: !38)
!137 = !MDLocation(line: 48, column: 10, scope: !38)
!138 = !MDLocation(line: 47, column: 9, scope: !38)
!139 = !MDLocation(line: 52, column: 17, scope: !140)
!140 = !{!"0xb\0052\005\004", !1, !141}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!141 = !{!"0xb\0052\005\003", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!142 = !MDLocation(line: 52, column: 5, scope: !141)
!143 = !MDLocation(line: 53, column: 9, scope: !140)
!144 = distinct !{!144, !145}
!145 = !{!"llvm.loop.unroll.disable"}
!146 = distinct !{!146, !147, !148}
!147 = !{!"llvm.loop.vectorize.width", i32 1}
!148 = !{!"llvm.loop.interleave.count", i32 1}
!149 = distinct !{!149, !145}
!150 = distinct !{!150, !147, !148}
!151 = !{!"0x101\00min\0016777241\000", !17, !9, !5, !152} ; [ DW_TAG_arg_variable ] [min] [line 25]
!152 = !MDLocation(line: 54, column: 17, scope: !38)
!153 = !MDLocation(line: 25, column: 17, scope: !17, inlinedAt: !152)
!154 = !{!"0x101\00max\0033554457\000", !17, !9, !5, !152} ; [ DW_TAG_arg_variable ] [max] [line 25]
!155 = !MDLocation(line: 25, column: 26, scope: !17, inlinedAt: !152)
!156 = !{!"0x100\00n\0026\000", !17, !9, !5, !152} ; [ DW_TAG_auto_variable ] [n] [line 26]
!157 = !MDLocation(line: 26, column: 12, scope: !17, inlinedAt: !152)
!158 = !MDLocation(line: 28, column: 15, scope: !17, inlinedAt: !152)
!159 = !MDLocation(line: 16, column: 12, scope: !8, inlinedAt: !160)
!160 = !MDLocation(line: 28, column: 20, scope: !17, inlinedAt: !152)
!161 = !MDLocation(line: 16, column: 5, scope: !8, inlinedAt: !160)
!162 = !MDLocation(line: 17, column: 27, scope: !8, inlinedAt: !160)
!163 = !MDLocation(line: 17, column: 12, scope: !8, inlinedAt: !160)
!164 = !MDLocation(line: 28, column: 9, scope: !17, inlinedAt: !152)
!165 = !{!"0x100\00k\0026\000", !17, !9, !5, !152} ; [ DW_TAG_auto_variable ] [k] [line 26]
!166 = !MDLocation(line: 26, column: 9, scope: !17, inlinedAt: !152)
!167 = !MDLocation(line: 29, column: 13, scope: !17, inlinedAt: !152)
!168 = !MDLocation(line: 29, column: 23, scope: !17, inlinedAt: !152)
!169 = !MDLocation(line: 29, column: 12, scope: !17, inlinedAt: !152)
!170 = !MDLocation(line: 54, column: 5, scope: !38)
!171 = !{!"0x101\00items\0016777248\000", !25, !9, !6, !172} ; [ DW_TAG_arg_variable ] [items] [line 32]
!172 = !MDLocation(line: 55, column: 5, scope: !38)
!173 = !MDLocation(line: 32, column: 19, scope: !25, inlinedAt: !172)
!174 = !{!"0x101\00len\0033554464\000", !25, !9, !5, !172} ; [ DW_TAG_arg_variable ] [len] [line 32]
!175 = !MDLocation(line: 32, column: 30, scope: !25, inlinedAt: !172)
!176 = !MDLocation(line: 36, column: 20, scope: !105, inlinedAt: !172)
!177 = !MDLocation(line: 36, column: 5, scope: !102, inlinedAt: !172)
!178 = !MDLocation(line: 36, column: 13, scope: !102, inlinedAt: !172)
!179 = !MDLocation(line: 37, column: 20, scope: !111, inlinedAt: !172)
!180 = !MDLocation(line: 37, column: 19, scope: !111, inlinedAt: !172)
!181 = !MDLocation(line: 16, column: 12, scope: !8, inlinedAt: !182)
!182 = !MDLocation(line: 37, column: 30, scope: !111, inlinedAt: !172)
!183 = !MDLocation(line: 17, column: 27, scope: !8, inlinedAt: !182)
!184 = !MDLocation(line: 17, column: 12, scope: !8, inlinedAt: !182)
!185 = !MDLocation(line: 37, column: 13, scope: !111, inlinedAt: !172)
!186 = !{!"0x100\00k\0033\000", !25, !9, !32, !172} ; [ DW_TAG_auto_variable ] [k] [line 33]
!187 = !MDLocation(line: 33, column: 15, scope: !25, inlinedAt: !172)
!188 = !MDLocation(line: 38, column: 14, scope: !111, inlinedAt: !172)
!189 = !MDLocation(line: 38, column: 13, scope: !111, inlinedAt: !172)
!190 = !{!"0x100\00j\0033\000", !25, !9, !32, !172} ; [ DW_TAG_auto_variable ] [j] [line 33]
!191 = !MDLocation(line: 33, column: 12, scope: !25, inlinedAt: !172)
!192 = !MDLocation(line: 40, column: 15, scope: !111, inlinedAt: !172)
!193 = !{!"0x100\00aux\0034\000", !25, !9, !5, !172} ; [ DW_TAG_auto_variable ] [aux] [line 34]
!194 = !MDLocation(line: 34, column: 9, scope: !25, inlinedAt: !172)
!195 = !MDLocation(line: 41, column: 20, scope: !111, inlinedAt: !172)
!196 = !MDLocation(line: 41, column: 9, scope: !111, inlinedAt: !172)
!197 = !MDLocation(line: 42, column: 9, scope: !111, inlinedAt: !172)
!198 = !MDLocation(line: 36, column: 27, scope: !107, inlinedAt: !172)
!199 = !{!"0x100\00i\0033\000", !25, !9, !32, !172} ; [ DW_TAG_auto_variable ] [i] [line 33]
!200 = !MDLocation(line: 33, column: 18, scope: !25, inlinedAt: !172)
!201 = !MDLocation(line: 16, column: 5, scope: !8, inlinedAt: !182)
!202 = !MDLocation(line: 56, column: 5, scope: !38)
!203 = !MDLocation(line: 59, column: 24, scope: !46)
!204 = !MDLocation(line: 59, column: 34, scope: !46)
!205 = !MDLocation(line: 61, column: 9, scope: !46)
!206 = !MDLocation(line: 60, column: 9, scope: !46)
!207 = !MDLocation(line: 63, column: 17, scope: !208)
!208 = !{!"0xb\0063\005\006", !1, !209}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!209 = !{!"0xb\0063\005\005", !1, !46}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!210 = !MDLocation(line: 63, column: 5, scope: !209)
!211 = !MDLocation(line: 64, column: 18, scope: !208)
!212 = !MDLocation(line: 64, column: 37, scope: !208)
!213 = distinct !{!213, !147, !148}
!214 = distinct !{!214, !145}
!215 = distinct !{!215, !147, !148}
!216 = !MDLocation(line: 65, column: 5, scope: !46)
!217 = !MDLocation(line: 66, column: 5, scope: !46)
!218 = !{!"0x101\00seed\0016777236\000", !12, !9, !4, !219} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!219 = !MDLocation(line: 73, column: 5, scope: !54)
!220 = !MDLocation(line: 20, column: 26, scope: !12, inlinedAt: !219)
!221 = !MDLocation(line: 21, column: 5, scope: !12, inlinedAt: !219)
!222 = !MDLocation(line: 70, column: 9, scope: !54)
!223 = !MDLocation(line: 76, column: 12, scope: !224)
!224 = !{!"0xb\0075\0032\009", !1, !225}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!225 = !{!"0xb\0075\002\008", !1, !226}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!226 = !{!"0xb\0075\002\007", !1, !54}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!227 = !MDLocation(line: 71, column: 10, scope: !54)
!228 = !MDLocation(line: 70, column: 12, scope: !54)
!229 = !MDLocation(line: 77, column: 3, scope: !230)
!230 = !{!"0xb\0077\003\0010", !1, !224}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!231 = !MDLocation(line: 78, column: 16, scope: !232)
!232 = !{!"0xb\0077\003\0011", !1, !230}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/puzzle.c]
!233 = !MDLocation(line: 63, column: 5, scope: !209, inlinedAt: !231)
!234 = !MDLocation(line: 64, column: 18, scope: !208, inlinedAt: !231)
!235 = !MDLocation(line: 64, column: 37, scope: !208, inlinedAt: !231)
!236 = distinct !{!236, !147, !148}
!237 = !{!"0x100\00result\0061\000", !46, !9, !5, !231} ; [ DW_TAG_auto_variable ] [result] [line 61]
!238 = !MDLocation(line: 61, column: 9, scope: !46, inlinedAt: !231)
!239 = !MDLocation(line: 77, column: 28, scope: !232)
!240 = !MDLocation(line: 65, column: 5, scope: !46, inlinedAt: !231)
!241 = !MDLocation(line: 79, column: 8, scope: !224)
!242 = !MDLocation(line: 79, column: 3, scope: !224)
!243 = !MDLocation(line: 80, column: 3, scope: !224)
!244 = distinct !{!244, !147, !148}
!245 = distinct !{!245, !147, !148}
!246 = distinct !{!246, !147, !148}
!247 = distinct !{!247, !147, !148}
!248 = !MDLocation(line: 83, column: 5, scope: !54)
