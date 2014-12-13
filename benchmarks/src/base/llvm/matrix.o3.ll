; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !12), !dbg !72
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !13), !dbg !72
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !16), !dbg !74
  %1 = sext i32 %rows to i64, !dbg !75
  %2 = shl nsw i64 %1, 3, !dbg !75
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !75
  %4 = bitcast i8* %3 to i32**, !dbg !75
  tail call void @llvm.dbg.value(metadata !{i32** %4}, i64 0, metadata !17), !dbg !75
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !14), !dbg !77
  %5 = icmp sgt i32 %rows, 0, !dbg !77
  br i1 %5, label %.lr.ph6, label %._crit_edge7, !dbg !77

.lr.ph6:                                          ; preds = %0
  %6 = sext i32 %cols to i64, !dbg !79
  %7 = shl nsw i64 %6, 2, !dbg !79
  %8 = icmp sgt i32 %cols, 0, !dbg !81
  br i1 %8, label %.lr.ph.us.preheader, label %.preheader

.lr.ph.us.preheader:                              ; preds = %.lr.ph6
  %9 = add i32 %cols, -1, !dbg !79
  %10 = zext i32 %9 to i64
  %11 = add i64 %10, 1, !dbg !79
  br label %.lr.ph.us, !dbg !79

; <label>:12                                      ; preds = %middle.block, %scalar.ph
  %13 = add i32 %count.03.us, %cols, !dbg !81
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !77
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !77
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %rows, !dbg !77
  br i1 %exitcond15, label %._crit_edge7, label %.lr.ph.us, !dbg !77

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %scalar.ph ], [ %resume.val, %middle.block ]
  %count.12.us = phi i32 [ %14, %scalar.ph ], [ %resume.val18, %middle.block ]
  %14 = add nsw i32 %count.12.us, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !16), !dbg !83
  %15 = getelementptr inbounds i32* %17, i64 %indvars.iv8, !dbg !83
  store i32 %count.12.us, i32* %15, align 4, !dbg !83, !tbaa !85
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !81
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !81
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %cols, !dbg !81
  br i1 %exitcond11, label %12, label %scalar.ph, !dbg !81, !llvm.loop !89

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %12
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %12 ], [ 0, %.lr.ph.us.preheader ]
  %count.03.us = phi i32 [ %13, %12 ], [ 1, %.lr.ph.us.preheader ]
  %16 = tail call noalias i8* @malloc(i64 %7) #3, !dbg !79
  %17 = bitcast i8* %16 to i32*, !dbg !79
  %18 = getelementptr inbounds i32** %4, i64 %indvars.iv12, !dbg !79
  store i32* %17, i32** %18, align 8, !dbg !79, !tbaa !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !15), !dbg !81
  %end.idx = add i64 %10, 1, !dbg !81
  %n.vec = and i64 %11, 8589934584, !dbg !81
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !81
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end = add i32 %cast.crd, %count.03.us
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.us ], !dbg !81
  %19 = trunc i64 %index to i32
  %offset.idx = add i32 %count.03.us, %19
  %broadcast.splatinsert20 = insertelement <4 x i32> undef, i32 %offset.idx, i32 0
  %broadcast.splat21 = shufflevector <4 x i32> %broadcast.splatinsert20, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction22 = add <4 x i32> %broadcast.splat21, <i32 0, i32 1, i32 2, i32 3>
  %induction23 = add <4 x i32> %broadcast.splat21, <i32 4, i32 5, i32 6, i32 7>
  %20 = getelementptr inbounds i32* %17, i64 %index, !dbg !83
  %21 = bitcast i32* %20 to <4 x i32>*, !dbg !83
  store <4 x i32> %induction22, <4 x i32>* %21, align 4, !dbg !83
  %.sum26 = or i64 %index, 4, !dbg !83
  %22 = getelementptr i32* %17, i64 %.sum26, !dbg !83
  %23 = bitcast i32* %22 to <4 x i32>*, !dbg !83
  store <4 x i32> %induction23, <4 x i32>* %23, align 4, !dbg !83
  %index.next = add i64 %index, 8, !dbg !81
  %24 = icmp eq i64 %index.next, %n.vec, !dbg !81
  br i1 %24, label %middle.block, label %vector.body, !dbg !81, !llvm.loop !94

middle.block:                                     ; preds = %vector.body, %.lr.ph.us
  %resume.val = phi i64 [ 0, %.lr.ph.us ], [ %n.vec, %vector.body ]
  %resume.val18 = phi i32 [ %count.03.us, %.lr.ph.us ], [ %ind.end, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %12, label %scalar.ph

.preheader:                                       ; preds = %.lr.ph6, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.lr.ph6 ]
  %25 = tail call noalias i8* @malloc(i64 %7) #3, !dbg !79
  %26 = bitcast i8* %25 to i32*, !dbg !79
  %27 = getelementptr inbounds i32** %4, i64 %indvars.iv, !dbg !79
  store i32* %26, i32** %27, align 8, !dbg !79, !tbaa !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !15), !dbg !81
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !77
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !77
  %exitcond = icmp eq i32 %lftr.wideiv, %rows, !dbg !77
  br i1 %exitcond, label %._crit_edge7, label %.preheader, !dbg !77

._crit_edge7:                                     ; preds = %.preheader, %12, %0
  ret i32** %4, !dbg !95
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** nocapture readonly %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !22), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !23), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !24), !dbg !96
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !25), !dbg !97
  %1 = icmp sgt i32 %rows, 0, !dbg !97
  br i1 %1, label %.preheader.lr.ph, label %._crit_edge3, !dbg !97

.preheader.lr.ph:                                 ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !99
  br i1 %2, label %.preheader.lr.ph.split.us, label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph
  %n.vec = and i32 %rows, -32, !dbg !97
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !97
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %.preheader ], !dbg !97
  %index.next = add i32 %index, 32, !dbg !97
  %3 = icmp eq i32 %index.next, %n.vec, !dbg !97
  br i1 %3, label %middle.block, label %vector.body, !dbg !97, !llvm.loop !101

middle.block:                                     ; preds = %vector.body, %.preheader
  %resume.val = phi i32 [ 0, %.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i32 %resume.val, %rows
  br i1 %cmp.n, label %._crit_edge3, label %scalar.ph

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  %4 = add i32 %cols, -1, !dbg !97
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 2, !dbg !97
  %7 = add i64 %6, 4, !dbg !97
  br label %8, !dbg !97

; <label>:8                                       ; preds = %8, %.preheader.lr.ph.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %8 ], [ 0, %.preheader.lr.ph.split.us ]
  %9 = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !102
  %10 = load i32** %9, align 8, !dbg !102, !tbaa !92
  %11 = bitcast i32* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %7, i32 4, i1 false), !dbg !102
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !97
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !97
  %exitcond5 = icmp eq i32 %lftr.wideiv, %rows, !dbg !97
  br i1 %exitcond5, label %._crit_edge3, label %8, !dbg !97

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %i.02 = phi i32 [ %12, %scalar.ph ], [ %resume.val, %middle.block ]
  %12 = add nsw i32 %i.02, 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !25), !dbg !97
  %exitcond = icmp eq i32 %12, %rows, !dbg !97
  br i1 %exitcond, label %._crit_edge3, label %scalar.ph, !dbg !97, !llvm.loop !103

._crit_edge3:                                     ; preds = %scalar.ph, %middle.block, %8, %0
  ret void, !dbg !104
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !31), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !32), !dbg !105
  %1 = icmp sgt i32 %rows, 0, !dbg !106
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !106

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %rows to i64
  br label %3, !dbg !106

; <label>:3                                       ; preds = %.lr.ph, %3
  %indvars.iv = phi i64 [ %2, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !106
  %4 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !107
  %5 = load i32** %4, align 8, !dbg !107, !tbaa !92
  %6 = bitcast i32* %5 to i8*, !dbg !107
  tail call void @free(i8* %6) #3, !dbg !107
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !106
  %8 = icmp sgt i32 %7, 0, !dbg !106
  br i1 %8, label %3, label %._crit_edge, !dbg !106

._crit_edge:                                      ; preds = %3, %0
  %9 = bitcast i32** %m to i8*, !dbg !109
  tail call void @free(i8* %9) #3, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !37), !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !38), !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32** %m1}, i64 0, metadata !39), !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32** %m2}, i64 0, metadata !40), !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32** %m3}, i64 0, metadata !41), !dbg !111
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !42), !dbg !112
  %1 = icmp sgt i32 %rows, 0, !dbg !112
  br i1 %1, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !112

.preheader1.lr.ph:                                ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !114
  %3 = add i32 %cols, -1, !dbg !112
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1, !dbg !112
  br label %.preheader1, !dbg !112

.preheader1:                                      ; preds = %._crit_edge5, %.preheader1.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next17, %._crit_edge5 ]
  br i1 %2, label %.preheader.lr.ph.split.us, label %._crit_edge5, !dbg !114

.preheader.lr.ph.split.us:                        ; preds = %.preheader1
  %6 = getelementptr inbounds i32** %m3, i64 %indvars.iv16, !dbg !117
  %7 = load i32** %6, align 8, !dbg !117, !tbaa !92
  %8 = getelementptr inbounds i32** %m1, i64 %indvars.iv16, !dbg !119
  br label %.lr.ph.us, !dbg !114

; <label>:9                                       ; preds = %middle.block, %scalar.ph
  %.lcssa = phi i32 [ %18, %scalar.ph ], [ %bin.rdx, %middle.block ]
  %10 = getelementptr inbounds i32* %7, i64 %indvars.iv12, !dbg !117
  store i32 %.lcssa, i32* %10, align 4, !dbg !117, !tbaa !85
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !114
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !114
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %cols, !dbg !114
  br i1 %exitcond15, label %._crit_edge5, label %.lr.ph.us, !dbg !114

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %scalar.ph ], [ %resume.val, %middle.block ]
  %val.03.us = phi i32 [ %18, %scalar.ph ], [ %bin.rdx, %middle.block ]
  %11 = getelementptr inbounds i32* %19, i64 %indvars.iv8, !dbg !119
  %12 = load i32* %11, align 4, !dbg !119, !tbaa !85
  %13 = getelementptr inbounds i32** %m2, i64 %indvars.iv8, !dbg !119
  %14 = load i32** %13, align 8, !dbg !119, !tbaa !92
  %15 = getelementptr inbounds i32* %14, i64 %indvars.iv12, !dbg !119
  %16 = load i32* %15, align 4, !dbg !119, !tbaa !85
  %17 = mul nsw i32 %16, %12, !dbg !119
  %18 = add nsw i32 %17, %val.03.us, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %.lcssa}, i64 0, metadata !45), !dbg !119
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !122
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !122
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %cols, !dbg !122
  br i1 %exitcond11, label %9, label %scalar.ph, !dbg !122, !llvm.loop !123

.lr.ph.us:                                        ; preds = %.preheader.lr.ph.split.us, %9
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %9 ], [ 0, %.preheader.lr.ph.split.us ]
  %19 = load i32** %8, align 8, !dbg !119, !tbaa !92
  %end.idx = add i64 %4, 1, !dbg !122
  %n.vec = and i64 %5, 8589934590, !dbg !122
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !122
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.us ], !dbg !122
  %vec.phi = phi i32 [ %34, %vector.body ], [ 0, %.lr.ph.us ]
  %vec.phi21 = phi i32 [ %35, %vector.body ], [ 0, %.lr.ph.us ]
  %induction2023 = or i64 %index, 1
  %20 = getelementptr inbounds i32* %19, i64 %index, !dbg !119
  %21 = getelementptr inbounds i32* %19, i64 %induction2023, !dbg !119
  %22 = load i32* %20, align 4, !dbg !119, !tbaa !85
  %23 = load i32* %21, align 4, !dbg !119, !tbaa !85
  %24 = getelementptr inbounds i32** %m2, i64 %index, !dbg !119
  %25 = getelementptr inbounds i32** %m2, i64 %induction2023, !dbg !119
  %26 = load i32** %24, align 8, !dbg !119, !tbaa !92
  %27 = load i32** %25, align 8, !dbg !119, !tbaa !92
  %28 = getelementptr inbounds i32* %26, i64 %indvars.iv12, !dbg !119
  %29 = getelementptr inbounds i32* %27, i64 %indvars.iv12, !dbg !119
  %30 = load i32* %28, align 4, !dbg !119, !tbaa !85
  %31 = load i32* %29, align 4, !dbg !119, !tbaa !85
  %32 = mul nsw i32 %30, %22, !dbg !119
  %33 = mul nsw i32 %31, %23, !dbg !119
  %34 = add nsw i32 %32, %vec.phi, !dbg !119
  %35 = add nsw i32 %33, %vec.phi21, !dbg !119
  %index.next = add i64 %index, 2, !dbg !122
  %36 = icmp eq i64 %index.next, %n.vec, !dbg !122
  br i1 %36, label %middle.block, label %vector.body, !dbg !122, !llvm.loop !124

middle.block:                                     ; preds = %vector.body, %.lr.ph.us
  %resume.val = phi i64 [ 0, %.lr.ph.us ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi i32 [ 0, %.lr.ph.us ], [ %34, %vector.body ], !dbg !119
  %rdx.vec.exit.phi22 = phi i32 [ 0, %.lr.ph.us ], [ %35, %vector.body ], !dbg !119
  %bin.rdx = add i32 %rdx.vec.exit.phi22, %rdx.vec.exit.phi, !dbg !119
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %9, label %scalar.ph

._crit_edge5:                                     ; preds = %9, %.preheader1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !112
  %lftr.wideiv18 = trunc i64 %indvars.iv.next17 to i32, !dbg !112
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %rows, !dbg !112
  br i1 %exitcond19, label %._crit_edge7, label %.preheader1, !dbg !112

._crit_edge7:                                     ; preds = %._crit_edge5, %0
  ret i32** %m3, !dbg !125
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !53), !dbg !126
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !54), !dbg !126
  %1 = icmp eq i32 %argc, 2, !dbg !127
  br i1 %1, label %2, label %7, !dbg !127

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !128
  %4 = load i8** %3, align 8, !dbg !128, !tbaa !92
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !129) #3, !dbg !130
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #3, !dbg !131
  %6 = trunc i64 %5 to i32, !dbg !131
  br label %7, !dbg !128

; <label>:7                                       ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 3000000, %0 ], !dbg !128
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !56), !dbg !128
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !134) #3, !dbg !136
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !137) #3, !dbg !136
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !138) #3, !dbg !139
  %9 = tail call noalias i8* @malloc(i64 80) #3, !dbg !140
  %10 = bitcast i8* %9 to i32**, !dbg !140
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !141) #3, !dbg !140
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !142) #3, !dbg !143
  br label %.lr.ph.us.i

.lr.ph.us.i:                                      ; preds = %.lr.ph.us.i, %7
  %indvars.iv12.i = phi i64 [ %indvars.iv.next13.i, %.lr.ph.us.i ], [ 0, %7 ]
  %count.03.us.i = phi i32 [ %27, %.lr.ph.us.i ], [ 1, %7 ]
  %11 = tail call noalias i8* @malloc(i64 40) #3, !dbg !144
  %12 = bitcast i8* %11 to i32*, !dbg !144
  %13 = getelementptr inbounds i32** %10, i64 %indvars.iv12.i, !dbg !144
  store i32* %12, i32** %13, align 8, !dbg !144, !tbaa !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !145) #3, !dbg !146
  store i32 %count.03.us.i, i32* %12, align 4, !dbg !147, !tbaa !85
  %14 = getelementptr inbounds i8* %11, i64 4, !dbg !147
  %15 = insertelement <4 x i32> undef, i32 %count.03.us.i, i32 0, !dbg !147
  %16 = insertelement <4 x i32> %15, i32 %count.03.us.i, i32 1, !dbg !147
  %17 = insertelement <4 x i32> %16, i32 %count.03.us.i, i32 2, !dbg !147
  %18 = insertelement <4 x i32> %17, i32 %count.03.us.i, i32 3, !dbg !147
  %19 = add <4 x i32> %18, <i32 1, i32 2, i32 3, i32 4>, !dbg !147
  %20 = bitcast i8* %14 to <4 x i32>*, !dbg !147
  store <4 x i32> %19, <4 x i32>* %20, align 4, !dbg !147, !tbaa !85
  %21 = getelementptr inbounds i8* %11, i64 20, !dbg !147
  %22 = add <4 x i32> %18, <i32 5, i32 6, i32 7, i32 8>, !dbg !147
  %23 = add nsw i32 %count.03.us.i, 9, !dbg !147
  %24 = bitcast i8* %21 to <4 x i32>*, !dbg !147
  store <4 x i32> %22, <4 x i32>* %24, align 4, !dbg !147, !tbaa !85
  %25 = getelementptr inbounds i8* %11, i64 36, !dbg !147
  %26 = bitcast i8* %25 to i32*, !dbg !147
  store i32 %23, i32* %26, align 4, !dbg !147, !tbaa !85
  %27 = add i32 %count.03.us.i, 10, !dbg !146
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1, !dbg !143
  %exitcond51 = icmp eq i64 %indvars.iv.next13.i, 10, !dbg !143
  br i1 %exitcond51, label %mkmatrix.exit, label %.lr.ph.us.i, !dbg !143

mkmatrix.exit:                                    ; preds = %.lr.ph.us.i
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !57), !dbg !135
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !148) #3, !dbg !150
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !151) #3, !dbg !150
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !152) #3, !dbg !153
  %28 = tail call noalias i8* @malloc(i64 80) #3, !dbg !154
  %29 = bitcast i8* %28 to i32**, !dbg !154
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !155) #3, !dbg !154
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !156) #3, !dbg !157
  br label %.lr.ph.us.i11

.lr.ph.us.i11:                                    ; preds = %.lr.ph.us.i11, %mkmatrix.exit
  %indvars.iv12.i9 = phi i64 [ %indvars.iv.next13.i1, %.lr.ph.us.i11 ], [ 0, %mkmatrix.exit ]
  %count.03.us.i10 = phi i32 [ %46, %.lr.ph.us.i11 ], [ 1, %mkmatrix.exit ]
  %30 = tail call noalias i8* @malloc(i64 40) #3, !dbg !158
  %31 = bitcast i8* %30 to i32*, !dbg !158
  %32 = getelementptr inbounds i32** %29, i64 %indvars.iv12.i9, !dbg !158
  store i32* %31, i32** %32, align 8, !dbg !158, !tbaa !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !159) #3, !dbg !160
  store i32 %count.03.us.i10, i32* %31, align 4, !dbg !161, !tbaa !85
  %33 = getelementptr inbounds i8* %30, i64 4, !dbg !161
  %34 = insertelement <4 x i32> undef, i32 %count.03.us.i10, i32 0, !dbg !161
  %35 = insertelement <4 x i32> %34, i32 %count.03.us.i10, i32 1, !dbg !161
  %36 = insertelement <4 x i32> %35, i32 %count.03.us.i10, i32 2, !dbg !161
  %37 = insertelement <4 x i32> %36, i32 %count.03.us.i10, i32 3, !dbg !161
  %38 = add <4 x i32> %37, <i32 1, i32 2, i32 3, i32 4>, !dbg !161
  %39 = bitcast i8* %33 to <4 x i32>*, !dbg !161
  store <4 x i32> %38, <4 x i32>* %39, align 4, !dbg !161, !tbaa !85
  %40 = getelementptr inbounds i8* %30, i64 20, !dbg !161
  %41 = add <4 x i32> %37, <i32 5, i32 6, i32 7, i32 8>, !dbg !161
  %42 = add nsw i32 %count.03.us.i10, 9, !dbg !161
  %43 = bitcast i8* %40 to <4 x i32>*, !dbg !161
  store <4 x i32> %41, <4 x i32>* %43, align 4, !dbg !161, !tbaa !85
  %44 = getelementptr inbounds i8* %30, i64 36, !dbg !161
  %45 = bitcast i8* %44 to i32*, !dbg !161
  store i32 %42, i32* %45, align 4, !dbg !161, !tbaa !85
  %46 = add i32 %count.03.us.i10, 10, !dbg !160
  %indvars.iv.next13.i1 = add nuw nsw i64 %indvars.iv12.i9, 1, !dbg !157
  %exitcond49 = icmp eq i64 %indvars.iv.next13.i1, 10, !dbg !157
  br i1 %exitcond49, label %mkmatrix.exit12, label %.lr.ph.us.i11, !dbg !157

mkmatrix.exit12:                                  ; preds = %.lr.ph.us.i11
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !162) #3, !dbg !164
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !165) #3, !dbg !164
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !166) #3, !dbg !167
  %47 = tail call noalias i8* @malloc(i64 80) #3, !dbg !168
  %48 = bitcast i8* %47 to i32**, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !169) #3, !dbg !168
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !170) #3, !dbg !171
  br label %.lr.ph.us.i23

mkmatrix.exit24.preheader:                        ; preds = %.lr.ph.us.i23
  %49 = icmp sgt i32 %8, 0, !dbg !172
  br i1 %49, label %.preheader1.i.preheader, label %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge, !dbg !172

mkmatrix.exit24.preheader.freematrix.exit43_crit_edge: ; preds = %mkmatrix.exit24.preheader
  %.pre69 = getelementptr inbounds i8* %28, i64 72, !dbg !174
  %50 = bitcast i8* %.pre69 to i32**, !dbg !174
  %.pre70 = getelementptr inbounds i8* %28, i64 64, !dbg !174
  %51 = bitcast i8* %.pre70 to i32**, !dbg !174
  %.pre72 = getelementptr inbounds i8* %28, i64 56, !dbg !174
  %52 = bitcast i8* %.pre72 to i32**, !dbg !174
  %.pre74 = getelementptr inbounds i8* %28, i64 48, !dbg !174
  %53 = bitcast i8* %.pre74 to i32**, !dbg !174
  %.pre76 = getelementptr inbounds i8* %28, i64 40, !dbg !174
  %54 = bitcast i8* %.pre76 to i32**, !dbg !174
  %.pre78 = getelementptr inbounds i8* %28, i64 32, !dbg !174
  %55 = bitcast i8* %.pre78 to i32**, !dbg !174
  %.pre80 = getelementptr inbounds i8* %28, i64 24, !dbg !174
  %56 = bitcast i8* %.pre80 to i32**, !dbg !174
  %.pre82 = getelementptr inbounds i8* %28, i64 16, !dbg !174
  %57 = bitcast i8* %.pre82 to i32**, !dbg !174
  %.pre84 = getelementptr inbounds i8* %28, i64 8, !dbg !174
  %58 = bitcast i8* %.pre84 to i32**, !dbg !174
  br label %freematrix.exit43, !dbg !172

.lr.ph.us.i23:                                    ; preds = %.lr.ph.us.i23, %mkmatrix.exit12
  %indvars.iv12.i21 = phi i64 [ %indvars.iv.next13.i13, %.lr.ph.us.i23 ], [ 0, %mkmatrix.exit12 ]
  %count.03.us.i22 = phi i32 [ %75, %.lr.ph.us.i23 ], [ 1, %mkmatrix.exit12 ]
  %59 = tail call noalias i8* @malloc(i64 40) #3, !dbg !176
  %60 = bitcast i8* %59 to i32*, !dbg !176
  %61 = getelementptr inbounds i32** %48, i64 %indvars.iv12.i21, !dbg !176
  store i32* %60, i32** %61, align 8, !dbg !176, !tbaa !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !177) #3, !dbg !178
  store i32 %count.03.us.i22, i32* %60, align 4, !dbg !179, !tbaa !85
  %62 = getelementptr inbounds i8* %59, i64 4, !dbg !179
  %63 = insertelement <4 x i32> undef, i32 %count.03.us.i22, i32 0, !dbg !179
  %64 = insertelement <4 x i32> %63, i32 %count.03.us.i22, i32 1, !dbg !179
  %65 = insertelement <4 x i32> %64, i32 %count.03.us.i22, i32 2, !dbg !179
  %66 = insertelement <4 x i32> %65, i32 %count.03.us.i22, i32 3, !dbg !179
  %67 = add <4 x i32> %66, <i32 1, i32 2, i32 3, i32 4>, !dbg !179
  %68 = bitcast i8* %62 to <4 x i32>*, !dbg !179
  store <4 x i32> %67, <4 x i32>* %68, align 4, !dbg !179, !tbaa !85
  %69 = getelementptr inbounds i8* %59, i64 20, !dbg !179
  %70 = add <4 x i32> %66, <i32 5, i32 6, i32 7, i32 8>, !dbg !179
  %71 = add nsw i32 %count.03.us.i22, 9, !dbg !179
  %72 = bitcast i8* %69 to <4 x i32>*, !dbg !179
  store <4 x i32> %70, <4 x i32>* %72, align 4, !dbg !179, !tbaa !85
  %73 = getelementptr inbounds i8* %59, i64 36, !dbg !179
  %74 = bitcast i8* %73 to i32*, !dbg !179
  store i32 %71, i32* %74, align 4, !dbg !179, !tbaa !85
  %75 = add i32 %count.03.us.i22, 10, !dbg !178
  %indvars.iv.next13.i13 = add nuw nsw i64 %indvars.iv12.i21, 1, !dbg !171
  %exitcond47 = icmp eq i64 %indvars.iv.next13.i13, 10, !dbg !171
  br i1 %exitcond47, label %mkmatrix.exit24.preheader, label %.lr.ph.us.i23, !dbg !171

.preheader1.i.preheader:                          ; preds = %mkmatrix.exit24.preheader, %mmult.exit
  %i.040 = phi i32 [ %148, %mmult.exit ], [ 0, %mkmatrix.exit24.preheader ]
  br label %.preheader1.i, !dbg !180

.preheader1.i:                                    ; preds = %.preheader1.i.preheader, %._crit_edge5.i
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %._crit_edge5.i ], [ 0, %.preheader1.i.preheader ]
  %76 = getelementptr inbounds i32** %48, i64 %indvars.iv16.i, !dbg !180
  %77 = load i32** %76, align 8, !dbg !180, !tbaa !92
  %78 = getelementptr inbounds i32** %10, i64 %indvars.iv16.i, !dbg !183
  %79 = load i32** %78, align 8, !dbg !183, !tbaa !92
  %.pre = load i32** %29, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert = getelementptr inbounds i8* %28, i64 8
  %80 = bitcast i8* %.phi.trans.insert to i32**
  %.pre52 = load i32** %80, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert53 = getelementptr inbounds i8* %28, i64 16
  %81 = bitcast i8* %.phi.trans.insert53 to i32**
  %.pre54 = load i32** %81, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert55 = getelementptr inbounds i8* %28, i64 24
  %82 = bitcast i8* %.phi.trans.insert55 to i32**
  %.pre56 = load i32** %82, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert57 = getelementptr inbounds i8* %28, i64 32
  %83 = bitcast i8* %.phi.trans.insert57 to i32**
  %.pre58 = load i32** %83, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert59 = getelementptr inbounds i8* %28, i64 40
  %84 = bitcast i8* %.phi.trans.insert59 to i32**
  %.pre60 = load i32** %84, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert61 = getelementptr inbounds i8* %28, i64 48
  %85 = bitcast i8* %.phi.trans.insert61 to i32**
  %.pre62 = load i32** %85, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert63 = getelementptr inbounds i8* %28, i64 56
  %86 = bitcast i8* %.phi.trans.insert63 to i32**
  %.pre64 = load i32** %86, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert65 = getelementptr inbounds i8* %28, i64 64
  %87 = bitcast i8* %.phi.trans.insert65 to i32**
  %.pre66 = load i32** %87, align 8, !dbg !183, !tbaa !92
  %.phi.trans.insert67 = getelementptr inbounds i8* %28, i64 72
  %88 = bitcast i8* %.phi.trans.insert67 to i32**
  %.pre68 = load i32** %88, align 8, !dbg !183, !tbaa !92
  br label %.lr.ph.us.i33, !dbg !184

.lr.ph.us.i33:                                    ; preds = %.lr.ph.us.i33, %.preheader1.i
  %indvars.iv12.i32 = phi i64 [ %indvars.iv.next13.i25, %.lr.ph.us.i33 ], [ 0, %.preheader1.i ]
  %89 = load i32* %79, align 4, !dbg !183, !tbaa !85
  %90 = getelementptr inbounds i32* %.pre, i64 %indvars.iv12.i32, !dbg !183
  %91 = load i32* %90, align 4, !dbg !183, !tbaa !85
  %92 = mul nsw i32 %91, %89, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %93 = getelementptr inbounds i32* %79, i64 1, !dbg !183
  %94 = load i32* %93, align 4, !dbg !183, !tbaa !85
  %95 = getelementptr inbounds i32* %.pre52, i64 %indvars.iv12.i32, !dbg !183
  %96 = load i32* %95, align 4, !dbg !183, !tbaa !85
  %97 = mul nsw i32 %96, %94, !dbg !183
  %98 = add nsw i32 %97, %92, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %99 = getelementptr inbounds i32* %79, i64 2, !dbg !183
  %100 = load i32* %99, align 4, !dbg !183, !tbaa !85
  %101 = getelementptr inbounds i32* %.pre54, i64 %indvars.iv12.i32, !dbg !183
  %102 = load i32* %101, align 4, !dbg !183, !tbaa !85
  %103 = mul nsw i32 %102, %100, !dbg !183
  %104 = add nsw i32 %103, %98, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %105 = getelementptr inbounds i32* %79, i64 3, !dbg !183
  %106 = load i32* %105, align 4, !dbg !183, !tbaa !85
  %107 = getelementptr inbounds i32* %.pre56, i64 %indvars.iv12.i32, !dbg !183
  %108 = load i32* %107, align 4, !dbg !183, !tbaa !85
  %109 = mul nsw i32 %108, %106, !dbg !183
  %110 = add nsw i32 %109, %104, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %111 = getelementptr inbounds i32* %79, i64 4, !dbg !183
  %112 = load i32* %111, align 4, !dbg !183, !tbaa !85
  %113 = getelementptr inbounds i32* %.pre58, i64 %indvars.iv12.i32, !dbg !183
  %114 = load i32* %113, align 4, !dbg !183, !tbaa !85
  %115 = mul nsw i32 %114, %112, !dbg !183
  %116 = add nsw i32 %115, %110, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %117 = getelementptr inbounds i32* %79, i64 5, !dbg !183
  %118 = load i32* %117, align 4, !dbg !183, !tbaa !85
  %119 = getelementptr inbounds i32* %.pre60, i64 %indvars.iv12.i32, !dbg !183
  %120 = load i32* %119, align 4, !dbg !183, !tbaa !85
  %121 = mul nsw i32 %120, %118, !dbg !183
  %122 = add nsw i32 %121, %116, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %123 = getelementptr inbounds i32* %79, i64 6, !dbg !183
  %124 = load i32* %123, align 4, !dbg !183, !tbaa !85
  %125 = getelementptr inbounds i32* %.pre62, i64 %indvars.iv12.i32, !dbg !183
  %126 = load i32* %125, align 4, !dbg !183, !tbaa !85
  %127 = mul nsw i32 %126, %124, !dbg !183
  %128 = add nsw i32 %127, %122, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %129 = getelementptr inbounds i32* %79, i64 7, !dbg !183
  %130 = load i32* %129, align 4, !dbg !183, !tbaa !85
  %131 = getelementptr inbounds i32* %.pre64, i64 %indvars.iv12.i32, !dbg !183
  %132 = load i32* %131, align 4, !dbg !183, !tbaa !85
  %133 = mul nsw i32 %132, %130, !dbg !183
  %134 = add nsw i32 %133, %128, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %135 = getelementptr inbounds i32* %79, i64 8, !dbg !183
  %136 = load i32* %135, align 4, !dbg !183, !tbaa !85
  %137 = getelementptr inbounds i32* %.pre66, i64 %indvars.iv12.i32, !dbg !183
  %138 = load i32* %137, align 4, !dbg !183, !tbaa !85
  %139 = mul nsw i32 %138, %136, !dbg !183
  %140 = add nsw i32 %139, %134, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %141 = getelementptr inbounds i32* %79, i64 9, !dbg !183
  %142 = load i32* %141, align 4, !dbg !183, !tbaa !85
  %143 = getelementptr inbounds i32* %.pre68, i64 %indvars.iv12.i32, !dbg !183
  %144 = load i32* %143, align 4, !dbg !183, !tbaa !85
  %145 = mul nsw i32 %144, %142, !dbg !183
  %146 = add nsw i32 %145, %140, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !185), !dbg !183
  %147 = getelementptr inbounds i32* %77, i64 %indvars.iv12.i32, !dbg !180
  store i32 %146, i32* %147, align 4, !dbg !180, !tbaa !85
  %indvars.iv.next13.i25 = add nuw nsw i64 %indvars.iv12.i32, 1, !dbg !184
  %exitcond = icmp eq i64 %indvars.iv.next13.i25, 10, !dbg !184
  br i1 %exitcond, label %._crit_edge5.i, label %.lr.ph.us.i33, !dbg !184

._crit_edge5.i:                                   ; preds = %.lr.ph.us.i33
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !186
  %exitcond44 = icmp eq i64 %indvars.iv.next17.i, 10, !dbg !186
  br i1 %exitcond44, label %mmult.exit, label %.preheader1.i, !dbg !186

mmult.exit:                                       ; preds = %._crit_edge5.i
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !59), !dbg !181
  %148 = add nsw i32 %i.040, 1, !dbg !172
  tail call void @llvm.dbg.value(metadata !{i32 %148}, i64 0, metadata !55), !dbg !172
  %exitcond45 = icmp eq i32 %148, %8, !dbg !172
  br i1 %exitcond45, label %freematrix.exit43, label %.preheader1.i.preheader, !dbg !172

freematrix.exit43:                                ; preds = %mmult.exit, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge
  %.pre-phi85 = phi i32** [ %58, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %80, %mmult.exit ], !dbg !174
  %.pre-phi83 = phi i32** [ %57, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %81, %mmult.exit ], !dbg !174
  %.pre-phi81 = phi i32** [ %56, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %82, %mmult.exit ], !dbg !174
  %.pre-phi79 = phi i32** [ %55, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %83, %mmult.exit ], !dbg !174
  %.pre-phi77 = phi i32** [ %54, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %84, %mmult.exit ], !dbg !174
  %.pre-phi75 = phi i32** [ %53, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %85, %mmult.exit ], !dbg !174
  %.pre-phi73 = phi i32** [ %52, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %86, %mmult.exit ], !dbg !174
  %.pre-phi71 = phi i32** [ %51, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %87, %mmult.exit ], !dbg !174
  %.pre-phi = phi i32** [ %50, %mkmatrix.exit24.preheader.freematrix.exit43_crit_edge ], [ %88, %mmult.exit ], !dbg !174
  %149 = load i32** %48, align 8, !dbg !187, !tbaa !92
  %150 = load i32* %149, align 4, !dbg !187, !tbaa !85
  %151 = getelementptr inbounds i8* %47, i64 16, !dbg !187
  %152 = bitcast i8* %151 to i32**, !dbg !187
  %153 = load i32** %152, align 8, !dbg !187, !tbaa !92
  %154 = getelementptr inbounds i32* %153, i64 3, !dbg !187
  %155 = load i32* %154, align 4, !dbg !187, !tbaa !85
  %156 = getelementptr inbounds i8* %47, i64 24, !dbg !187
  %157 = bitcast i8* %156 to i32**, !dbg !187
  %158 = load i32** %157, align 8, !dbg !187, !tbaa !92
  %159 = getelementptr inbounds i32* %158, i64 2, !dbg !187
  %160 = load i32* %159, align 4, !dbg !187, !tbaa !85
  %161 = getelementptr inbounds i8* %47, i64 32, !dbg !187
  %162 = bitcast i8* %161 to i32**, !dbg !187
  %163 = load i32** %162, align 8, !dbg !187, !tbaa !92
  %164 = getelementptr inbounds i32* %163, i64 4, !dbg !187
  %165 = load i32* %164, align 4, !dbg !187, !tbaa !85
  %166 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %150, i32 %155, i32 %160, i32 %165) #3, !dbg !187
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !188) #3, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !191) #3, !dbg !190
  %167 = getelementptr inbounds i8* %9, i64 72, !dbg !192
  %168 = bitcast i8* %167 to i32**, !dbg !192
  %169 = load i32** %168, align 8, !dbg !192, !tbaa !92
  %170 = bitcast i32* %169 to i8*, !dbg !192
  tail call void @free(i8* %170) #3, !dbg !192
  %171 = getelementptr inbounds i8* %9, i64 64, !dbg !192
  %172 = bitcast i8* %171 to i32**, !dbg !192
  %173 = load i32** %172, align 8, !dbg !192, !tbaa !92
  %174 = bitcast i32* %173 to i8*, !dbg !192
  tail call void @free(i8* %174) #3, !dbg !192
  %175 = getelementptr inbounds i8* %9, i64 56, !dbg !192
  %176 = bitcast i8* %175 to i32**, !dbg !192
  %177 = load i32** %176, align 8, !dbg !192, !tbaa !92
  %178 = bitcast i32* %177 to i8*, !dbg !192
  tail call void @free(i8* %178) #3, !dbg !192
  %179 = getelementptr inbounds i8* %9, i64 48, !dbg !192
  %180 = bitcast i8* %179 to i32**, !dbg !192
  %181 = load i32** %180, align 8, !dbg !192, !tbaa !92
  %182 = bitcast i32* %181 to i8*, !dbg !192
  tail call void @free(i8* %182) #3, !dbg !192
  %183 = getelementptr inbounds i8* %9, i64 40, !dbg !192
  %184 = bitcast i8* %183 to i32**, !dbg !192
  %185 = load i32** %184, align 8, !dbg !192, !tbaa !92
  %186 = bitcast i32* %185 to i8*, !dbg !192
  tail call void @free(i8* %186) #3, !dbg !192
  %187 = getelementptr inbounds i8* %9, i64 32, !dbg !192
  %188 = bitcast i8* %187 to i32**, !dbg !192
  %189 = load i32** %188, align 8, !dbg !192, !tbaa !92
  %190 = bitcast i32* %189 to i8*, !dbg !192
  tail call void @free(i8* %190) #3, !dbg !192
  %191 = getelementptr inbounds i8* %9, i64 24, !dbg !192
  %192 = bitcast i8* %191 to i32**, !dbg !192
  %193 = load i32** %192, align 8, !dbg !192, !tbaa !92
  %194 = bitcast i32* %193 to i8*, !dbg !192
  tail call void @free(i8* %194) #3, !dbg !192
  %195 = getelementptr inbounds i8* %9, i64 16, !dbg !192
  %196 = bitcast i8* %195 to i32**, !dbg !192
  %197 = load i32** %196, align 8, !dbg !192, !tbaa !92
  %198 = bitcast i32* %197 to i8*, !dbg !192
  tail call void @free(i8* %198) #3, !dbg !192
  %199 = getelementptr inbounds i8* %9, i64 8, !dbg !192
  %200 = bitcast i8* %199 to i32**, !dbg !192
  %201 = load i32** %200, align 8, !dbg !192, !tbaa !92
  %202 = bitcast i32* %201 to i8*, !dbg !192
  tail call void @free(i8* %202) #3, !dbg !192
  %203 = load i32** %10, align 8, !dbg !192, !tbaa !92
  %204 = bitcast i32* %203 to i8*, !dbg !192
  tail call void @free(i8* %204) #3, !dbg !192
  tail call void @free(i8* %9) #3, !dbg !193
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !194) #3, !dbg !195
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !196) #3, !dbg !195
  %205 = load i32** %.pre-phi, align 8, !dbg !174, !tbaa !92
  %206 = bitcast i32* %205 to i8*, !dbg !174
  tail call void @free(i8* %206) #3, !dbg !174
  %207 = load i32** %.pre-phi71, align 8, !dbg !174, !tbaa !92
  %208 = bitcast i32* %207 to i8*, !dbg !174
  tail call void @free(i8* %208) #3, !dbg !174
  %209 = load i32** %.pre-phi73, align 8, !dbg !174, !tbaa !92
  %210 = bitcast i32* %209 to i8*, !dbg !174
  tail call void @free(i8* %210) #3, !dbg !174
  %211 = load i32** %.pre-phi75, align 8, !dbg !174, !tbaa !92
  %212 = bitcast i32* %211 to i8*, !dbg !174
  tail call void @free(i8* %212) #3, !dbg !174
  %213 = load i32** %.pre-phi77, align 8, !dbg !174, !tbaa !92
  %214 = bitcast i32* %213 to i8*, !dbg !174
  tail call void @free(i8* %214) #3, !dbg !174
  %215 = load i32** %.pre-phi79, align 8, !dbg !174, !tbaa !92
  %216 = bitcast i32* %215 to i8*, !dbg !174
  tail call void @free(i8* %216) #3, !dbg !174
  %217 = load i32** %.pre-phi81, align 8, !dbg !174, !tbaa !92
  %218 = bitcast i32* %217 to i8*, !dbg !174
  tail call void @free(i8* %218) #3, !dbg !174
  %219 = load i32** %.pre-phi83, align 8, !dbg !174, !tbaa !92
  %220 = bitcast i32* %219 to i8*, !dbg !174
  tail call void @free(i8* %220) #3, !dbg !174
  %221 = load i32** %.pre-phi85, align 8, !dbg !174, !tbaa !92
  %222 = bitcast i32* %221 to i8*, !dbg !174
  tail call void @free(i8* %222) #3, !dbg !174
  %223 = load i32** %29, align 8, !dbg !174, !tbaa !92
  %224 = bitcast i32* %223 to i8*, !dbg !174
  tail call void @free(i8* %224) #3, !dbg !174
  tail call void @free(i8* %28) #3, !dbg !197
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !198) #3, !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !201) #3, !dbg !200
  %225 = getelementptr inbounds i8* %47, i64 72, !dbg !202
  %226 = bitcast i8* %225 to i32**, !dbg !202
  %227 = load i32** %226, align 8, !dbg !202, !tbaa !92
  %228 = bitcast i32* %227 to i8*, !dbg !202
  tail call void @free(i8* %228) #3, !dbg !202
  %229 = getelementptr inbounds i8* %47, i64 64, !dbg !202
  %230 = bitcast i8* %229 to i32**, !dbg !202
  %231 = load i32** %230, align 8, !dbg !202, !tbaa !92
  %232 = bitcast i32* %231 to i8*, !dbg !202
  tail call void @free(i8* %232) #3, !dbg !202
  %233 = getelementptr inbounds i8* %47, i64 56, !dbg !202
  %234 = bitcast i8* %233 to i32**, !dbg !202
  %235 = load i32** %234, align 8, !dbg !202, !tbaa !92
  %236 = bitcast i32* %235 to i8*, !dbg !202
  tail call void @free(i8* %236) #3, !dbg !202
  %237 = getelementptr inbounds i8* %47, i64 48, !dbg !202
  %238 = bitcast i8* %237 to i32**, !dbg !202
  %239 = load i32** %238, align 8, !dbg !202, !tbaa !92
  %240 = bitcast i32* %239 to i8*, !dbg !202
  tail call void @free(i8* %240) #3, !dbg !202
  %241 = getelementptr inbounds i8* %47, i64 40, !dbg !202
  %242 = bitcast i8* %241 to i32**, !dbg !202
  %243 = load i32** %242, align 8, !dbg !202, !tbaa !92
  %244 = bitcast i32* %243 to i8*, !dbg !202
  tail call void @free(i8* %244) #3, !dbg !202
  %245 = getelementptr inbounds i8* %47, i64 32, !dbg !202
  %246 = bitcast i8* %245 to i32**, !dbg !202
  %247 = load i32** %246, align 8, !dbg !202, !tbaa !92
  %248 = bitcast i32* %247 to i8*, !dbg !202
  tail call void @free(i8* %248) #3, !dbg !202
  %249 = getelementptr inbounds i8* %47, i64 24, !dbg !202
  %250 = bitcast i8* %249 to i32**, !dbg !202
  %251 = load i32** %250, align 8, !dbg !202, !tbaa !92
  %252 = bitcast i32* %251 to i8*, !dbg !202
  tail call void @free(i8* %252) #3, !dbg !202
  %253 = getelementptr inbounds i8* %47, i64 16, !dbg !202
  %254 = bitcast i8* %253 to i32**, !dbg !202
  %255 = load i32** %254, align 8, !dbg !202, !tbaa !92
  %256 = bitcast i32* %255 to i8*, !dbg !202
  tail call void @free(i8* %256) #3, !dbg !202
  %257 = getelementptr inbounds i8* %47, i64 8, !dbg !202
  %258 = bitcast i8* %257 to i32**, !dbg !202
  %259 = load i32** %258, align 8, !dbg !202, !tbaa !92
  %260 = bitcast i32* %259 to i8*, !dbg !202
  tail call void @free(i8* %260) #3, !dbg !202
  %261 = load i32** %48, align 8, !dbg !202, !tbaa !92
  %262 = bitcast i32* %261 to i8*, !dbg !202
  tail call void @free(i8* %262) #3, !dbg !202
  tail call void @free(i8* %47) #3, !dbg !203
  ret i32 0, !dbg !204
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!69, !70}
!llvm.ident = !{!71}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = metadata !{metadata !"matrix.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !27, metadata !33, metadata !46, metadata !60}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mkmatrix", metadata !"mkmatrix", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32** (i32, i32)* @mkmatrix, null, null, metadata !11, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!12 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!13 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!14 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!15 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!16 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 13]
!17 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 14]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"zeromatrix", metadata !"zeromatrix", metadata !"", i32 24, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32**)* @zeromatrix, null, null, metadata !21, i32 24} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null, metadata !10, metadata !10, metadata !8}
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26}
!22 = metadata !{i32 786689, metadata !18, metadata !"rows", metadata !5, i32 16777240, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!23 = metadata !{i32 786689, metadata !18, metadata !"cols", metadata !5, i32 33554456, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!24 = metadata !{i32 786689, metadata !18, metadata !"m", metadata !5, i32 50331672, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 24]
!25 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!26 = metadata !{i32 786688, metadata !18, metadata !"j", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!27 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"freematrix", metadata !"freematrix", metadata !"", i32 31, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32**)* @freematrix, null, null, metadata !30, i32 31} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !10, metadata !8}
!30 = metadata !{metadata !31, metadata !32}
!31 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!32 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 31]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mmult", metadata !"mmult", metadata !"", i32 36, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, metadata !36, i32 36} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !8, metadata !10, metadata !10, metadata !8, metadata !8, metadata !8}
!36 = metadata !{metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45}
!37 = metadata !{i32 786689, metadata !33, metadata !"rows", metadata !5, i32 16777252, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!38 = metadata !{i32 786689, metadata !33, metadata !"cols", metadata !5, i32 33554468, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!39 = metadata !{i32 786689, metadata !33, metadata !"m1", metadata !5, i32 50331684, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!40 = metadata !{i32 786689, metadata !33, metadata !"m2", metadata !5, i32 67108900, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!41 = metadata !{i32 786689, metadata !33, metadata !"m3", metadata !5, i32 83886116, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!42 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 37]
!43 = metadata !{i32 786688, metadata !33, metadata !"j", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 37]
!44 = metadata !{i32 786688, metadata !33, metadata !"k", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 37]
!45 = metadata !{i32 786688, metadata !33, metadata !"val", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 37]
!46 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 50, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !52, i32 50} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!47 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = metadata !{metadata !10, metadata !10, metadata !49}
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!51 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!52 = metadata !{metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59}
!53 = metadata !{i32 786689, metadata !46, metadata !"argc", metadata !5, i32 16777266, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!54 = metadata !{i32 786689, metadata !46, metadata !"argv", metadata !5, i32 33554482, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!55 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!56 = metadata !{i32 786688, metadata !46, metadata !"n", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 56]
!57 = metadata !{i32 786688, metadata !46, metadata !"m1", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m1] [line 58]
!58 = metadata !{i32 786688, metadata !46, metadata !"m2", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 59]
!59 = metadata !{i32 786688, metadata !46, metadata !"mm", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mm] [line 60]
!60 = metadata !{i32 786478, metadata !61, metadata !62, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !67, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!61 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!62 = metadata !{i32 786473, metadata !61}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !10, metadata !65}
!65 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!66 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786689, metadata !60, metadata !"__nptr", metadata !62, i32 16777494, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!69 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!70 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!71 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!72 = metadata !{i32 12, i32 0, metadata !4, null}
!73 = metadata !{i32 1}
!74 = metadata !{i32 13, i32 0, metadata !4, null}
!75 = metadata !{i32 14, i32 0, metadata !4, null}
!76 = metadata !{i32 0}
!77 = metadata !{i32 15, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!79 = metadata !{i32 16, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 15, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!81 = metadata !{i32 17, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!83 = metadata !{i32 18, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !82, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!85 = metadata !{metadata !86, metadata !86, i64 0}
!86 = metadata !{metadata !"int", metadata !87, i64 0}
!87 = metadata !{metadata !"omnipotent char", metadata !88, i64 0}
!88 = metadata !{metadata !"Simple C/C++ TBAA"}
!89 = metadata !{metadata !89, metadata !90, metadata !91}
!90 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!91 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!92 = metadata !{metadata !93, metadata !93, i64 0}
!93 = metadata !{metadata !"any pointer", metadata !87, i64 0}
!94 = metadata !{metadata !94, metadata !90, metadata !91}
!95 = metadata !{i32 21, i32 0, metadata !4, null}
!96 = metadata !{i32 24, i32 0, metadata !18, null}
!97 = metadata !{i32 26, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !18, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!99 = metadata !{i32 27, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !98, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!101 = metadata !{metadata !101, metadata !90, metadata !91}
!102 = metadata !{i32 28, i32 0, metadata !100, null}
!103 = metadata !{metadata !103, metadata !90, metadata !91}
!104 = metadata !{i32 29, i32 0, metadata !18, null}
!105 = metadata !{i32 31, i32 0, metadata !27, null}
!106 = metadata !{i32 32, i32 0, metadata !27, null}
!107 = metadata !{i32 32, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !27, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!109 = metadata !{i32 33, i32 0, metadata !27, null}
!110 = metadata !{i32 34, i32 0, metadata !27, null}
!111 = metadata !{i32 36, i32 0, metadata !33, null}
!112 = metadata !{i32 38, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !33, i32 38, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!114 = metadata !{i32 39, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !116, i32 39, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!116 = metadata !{i32 786443, metadata !1, metadata !113, i32 38, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!117 = metadata !{i32 44, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !115, i32 39, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!119 = metadata !{i32 42, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !121, i32 41, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!121 = metadata !{i32 786443, metadata !1, metadata !118, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!122 = metadata !{i32 41, i32 0, metadata !121, null}
!123 = metadata !{metadata !123, metadata !90, metadata !91}
!124 = metadata !{metadata !124, metadata !90, metadata !91}
!125 = metadata !{i32 47, i32 0, metadata !33, null}
!126 = metadata !{i32 50, i32 0, metadata !46, null}
!127 = metadata !{i32 56, i32 0, metadata !46, null}
!128 = metadata !{i32 56, i32 31, metadata !46, null}
!129 = metadata !{i32 786689, metadata !60, metadata !"__nptr", metadata !62, i32 16777494, metadata !65, i32 0, metadata !128} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!130 = metadata !{i32 278, i32 0, metadata !60, metadata !128}
!131 = metadata !{i32 280, i32 0, metadata !132, metadata !128}
!132 = metadata !{i32 786443, metadata !61, metadata !60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!133 = metadata !{i32 10}
!134 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!135 = metadata !{i32 58, i32 0, metadata !46, null} ; [ DW_TAG_imported_module ]
!136 = metadata !{i32 12, i32 0, metadata !4, metadata !135}
!137 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !135} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!138 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !135} ; [ DW_TAG_auto_variable ] [count] [line 13]
!139 = metadata !{i32 13, i32 0, metadata !4, metadata !135}
!140 = metadata !{i32 14, i32 0, metadata !4, metadata !135}
!141 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !135} ; [ DW_TAG_auto_variable ] [m] [line 14]
!142 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !135} ; [ DW_TAG_auto_variable ] [i] [line 13]
!143 = metadata !{i32 15, i32 0, metadata !78, metadata !135}
!144 = metadata !{i32 16, i32 0, metadata !80, metadata !135}
!145 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !135} ; [ DW_TAG_auto_variable ] [j] [line 13]
!146 = metadata !{i32 17, i32 0, metadata !82, metadata !135}
!147 = metadata !{i32 18, i32 0, metadata !84, metadata !135}
!148 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !149} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!149 = metadata !{i32 59, i32 0, metadata !46, null}
!150 = metadata !{i32 12, i32 0, metadata !4, metadata !149}
!151 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !149} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!152 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !149} ; [ DW_TAG_auto_variable ] [count] [line 13]
!153 = metadata !{i32 13, i32 0, metadata !4, metadata !149}
!154 = metadata !{i32 14, i32 0, metadata !4, metadata !149}
!155 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !149} ; [ DW_TAG_auto_variable ] [m] [line 14]
!156 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !149} ; [ DW_TAG_auto_variable ] [i] [line 13]
!157 = metadata !{i32 15, i32 0, metadata !78, metadata !149}
!158 = metadata !{i32 16, i32 0, metadata !80, metadata !149}
!159 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !149} ; [ DW_TAG_auto_variable ] [j] [line 13]
!160 = metadata !{i32 17, i32 0, metadata !82, metadata !149}
!161 = metadata !{i32 18, i32 0, metadata !84, metadata !149}
!162 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !163} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!163 = metadata !{i32 60, i32 0, metadata !46, null}
!164 = metadata !{i32 12, i32 0, metadata !4, metadata !163}
!165 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !163} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!166 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [count] [line 13]
!167 = metadata !{i32 13, i32 0, metadata !4, metadata !163}
!168 = metadata !{i32 14, i32 0, metadata !4, metadata !163}
!169 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [m] [line 14]
!170 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [i] [line 13]
!171 = metadata !{i32 15, i32 0, metadata !78, metadata !163}
!172 = metadata !{i32 62, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !46, i32 62, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!174 = metadata !{i32 32, i32 0, metadata !108, metadata !175}
!175 = metadata !{i32 68, i32 0, metadata !46, null}
!176 = metadata !{i32 16, i32 0, metadata !80, metadata !163}
!177 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [j] [line 13]
!178 = metadata !{i32 17, i32 0, metadata !82, metadata !163}
!179 = metadata !{i32 18, i32 0, metadata !84, metadata !163}
!180 = metadata !{i32 44, i32 0, metadata !118, metadata !181}
!181 = metadata !{i32 63, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !173, i32 62, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!183 = metadata !{i32 42, i32 0, metadata !120, metadata !181}
!184 = metadata !{i32 39, i32 0, metadata !115, metadata !181}
!185 = metadata !{i32 786688, metadata !33, metadata !"val", metadata !5, i32 37, metadata !10, i32 0, metadata !181} ; [ DW_TAG_auto_variable ] [val] [line 37]
!186 = metadata !{i32 38, i32 0, metadata !113, metadata !181}
!187 = metadata !{i32 65, i32 0, metadata !46, null}
!188 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !189} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!189 = metadata !{i32 67, i32 0, metadata !46, null}
!190 = metadata !{i32 31, i32 0, metadata !27, metadata !189}
!191 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !189} ; [ DW_TAG_arg_variable ] [m] [line 31]
!192 = metadata !{i32 32, i32 0, metadata !108, metadata !189}
!193 = metadata !{i32 33, i32 0, metadata !27, metadata !189}
!194 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!195 = metadata !{i32 31, i32 0, metadata !27, metadata !175}
!196 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !175} ; [ DW_TAG_arg_variable ] [m] [line 31]
!197 = metadata !{i32 33, i32 0, metadata !27, metadata !175}
!198 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !199} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!199 = metadata !{i32 69, i32 0, metadata !46, null}
!200 = metadata !{i32 31, i32 0, metadata !27, metadata !199}
!201 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !199} ; [ DW_TAG_arg_variable ] [m] [line 31]
!202 = metadata !{i32 32, i32 0, metadata !108, metadata !199}
!203 = metadata !{i32 33, i32 0, metadata !27, metadata !199}
!204 = metadata !{i32 70, i32 0, metadata !46, null}
