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
  %9 = add i32 %cols, -1, !dbg !77
  %10 = zext i32 %9 to i64
  %11 = add i64 %10, 1, !dbg !77
  br label %12, !dbg !77

; <label>:12                                      ; preds = %25, %.lr.ph6
  %indvars.iv8 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next9, %25 ]
  %count.03 = phi i32 [ 1, %.lr.ph6 ], [ %count.1.lcssa, %25 ]
  %13 = tail call noalias i8* @malloc(i64 %7) #3, !dbg !79
  %14 = bitcast i8* %13 to i32*, !dbg !79
  %15 = getelementptr inbounds i32** %4, i64 %indvars.iv8, !dbg !79
  store i32* %14, i32** %15, align 8, !dbg !79, !tbaa !83
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !15), !dbg !81
  br i1 %8, label %.lr.ph.preheader, label %25, !dbg !81

.lr.ph.preheader:                                 ; preds = %12
  %end.idx = add i64 %10, 1, !dbg !81
  %n.vec = and i64 %11, 8589934584, !dbg !81
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !81
  %cast.crd = trunc i64 %n.vec to i32
  %ind.end = add i32 %cast.crd, %count.03
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.preheader ], !dbg !81
  %16 = trunc i64 %index to i32
  %offset.idx = add i32 %count.03, %16
  %broadcast.splatinsert14 = insertelement <4 x i32> undef, i32 %offset.idx, i32 0
  %broadcast.splat15 = shufflevector <4 x i32> %broadcast.splatinsert14, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction16 = add <4 x i32> %broadcast.splat15, <i32 0, i32 1, i32 2, i32 3>
  %induction17 = add <4 x i32> %broadcast.splat15, <i32 4, i32 5, i32 6, i32 7>
  %17 = getelementptr inbounds i32* %14, i64 %index, !dbg !87
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !87
  store <4 x i32> %induction16, <4 x i32>* %18, align 4, !dbg !87
  %.sum20 = or i64 %index, 4, !dbg !87
  %19 = getelementptr i32* %14, i64 %.sum20, !dbg !87
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !87
  store <4 x i32> %induction17, <4 x i32>* %20, align 4, !dbg !87
  %index.next = add i64 %index, 8, !dbg !81
  %21 = icmp eq i64 %index.next, %n.vec, !dbg !81
  br i1 %21, label %middle.block, label %vector.body, !dbg !81, !llvm.loop !89

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %resume.val12 = phi i32 [ %count.03, %.lr.ph.preheader ], [ %ind.end, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %count.12 = phi i32 [ %22, %.lr.ph ], [ %resume.val12, %middle.block ]
  %22 = add nsw i32 %count.12, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !16), !dbg !87
  %23 = getelementptr inbounds i32* %14, i64 %indvars.iv, !dbg !87
  store i32 %count.12, i32* %23, align 4, !dbg !87, !tbaa !92
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !81
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !81
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !81, !llvm.loop !94

._crit_edge:                                      ; preds = %middle.block, %.lr.ph
  %24 = add i32 %count.03, %cols, !dbg !81
  br label %25, !dbg !81

; <label>:25                                      ; preds = %._crit_edge, %12
  %count.1.lcssa = phi i32 [ %24, %._crit_edge ], [ %count.03, %12 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !77
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !77
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %rows, !dbg !77
  br i1 %exitcond11, label %._crit_edge7, label %12, !dbg !77

._crit_edge7:                                     ; preds = %25, %0
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
  %3 = add i32 %cols, -1, !dbg !97
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i64 %4, 2, !dbg !97
  %6 = add i64 %5, 4, !dbg !97
  br label %.preheader, !dbg !97

.preheader:                                       ; preds = %10, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %10 ]
  br i1 %2, label %.lr.ph, label %10, !dbg !99

.lr.ph:                                           ; preds = %.preheader
  %7 = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !101
  %8 = load i32** %7, align 8, !dbg !101, !tbaa !83
  %9 = bitcast i32* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %6, i32 4, i1 false), !dbg !101
  br label %10, !dbg !99

; <label>:10                                      ; preds = %.lr.ph, %.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !97
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !97
  %exitcond = icmp eq i32 %lftr.wideiv, %rows, !dbg !97
  br i1 %exitcond, label %._crit_edge3, label %.preheader, !dbg !97

._crit_edge3:                                     ; preds = %10, %0
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !31), !dbg !103
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !32), !dbg !103
  %1 = icmp sgt i32 %rows, 0, !dbg !104
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !104

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %rows to i64
  br label %3, !dbg !104

; <label>:3                                       ; preds = %.lr.ph, %3
  %indvars.iv = phi i64 [ %2, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !104
  %4 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !105
  %5 = load i32** %4, align 8, !dbg !105, !tbaa !83
  %6 = bitcast i32* %5 to i8*, !dbg !105
  tail call void @free(i8* %6) #3, !dbg !105
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !104
  %8 = icmp sgt i32 %7, 0, !dbg !104
  br i1 %8, label %3, label %._crit_edge, !dbg !104

._crit_edge:                                      ; preds = %3, %0
  %9 = bitcast i32** %m to i8*, !dbg !107
  tail call void @free(i8* %9) #3, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !37), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !38), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i32** %m1}, i64 0, metadata !39), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i32** %m2}, i64 0, metadata !40), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i32** %m3}, i64 0, metadata !41), !dbg !109
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !42), !dbg !110
  %1 = icmp sgt i32 %rows, 0, !dbg !110
  br i1 %1, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !110

.preheader1.lr.ph:                                ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !112
  %3 = add i32 %cols, -1, !dbg !110
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1, !dbg !110
  br label %.preheader1, !dbg !110

.preheader1:                                      ; preds = %._crit_edge5, %.preheader1.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next13, %._crit_edge5 ]
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge5, !dbg !112

.preheader.lr.ph:                                 ; preds = %.preheader1
  %6 = getelementptr inbounds i32** %m3, i64 %indvars.iv12, !dbg !115
  %7 = load i32** %6, align 8, !dbg !115, !tbaa !83
  %8 = getelementptr inbounds i32** %m1, i64 %indvars.iv12, !dbg !117
  br label %.lr.ph, !dbg !112

.lr.ph:                                           ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv8 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next9, %._crit_edge ]
  %9 = load i32** %8, align 8, !dbg !117, !tbaa !83
  %end.idx = add i64 %4, 1, !dbg !120
  %n.vec = and i64 %5, 8589934590, !dbg !120
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !120
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph ], !dbg !120
  %vec.phi = phi i32 [ %24, %vector.body ], [ 0, %.lr.ph ]
  %vec.phi17 = phi i32 [ %25, %vector.body ], [ 0, %.lr.ph ]
  %induction1619 = or i64 %index, 1
  %10 = getelementptr inbounds i32* %9, i64 %index, !dbg !117
  %11 = getelementptr inbounds i32* %9, i64 %induction1619, !dbg !117
  %12 = load i32* %10, align 4, !dbg !117, !tbaa !92
  %13 = load i32* %11, align 4, !dbg !117, !tbaa !92
  %14 = getelementptr inbounds i32** %m2, i64 %index, !dbg !117
  %15 = getelementptr inbounds i32** %m2, i64 %induction1619, !dbg !117
  %16 = load i32** %14, align 8, !dbg !117, !tbaa !83
  %17 = load i32** %15, align 8, !dbg !117, !tbaa !83
  %18 = getelementptr inbounds i32* %16, i64 %indvars.iv8, !dbg !117
  %19 = getelementptr inbounds i32* %17, i64 %indvars.iv8, !dbg !117
  %20 = load i32* %18, align 4, !dbg !117, !tbaa !92
  %21 = load i32* %19, align 4, !dbg !117, !tbaa !92
  %22 = mul nsw i32 %20, %12, !dbg !117
  %23 = mul nsw i32 %21, %13, !dbg !117
  %24 = add nsw i32 %22, %vec.phi, !dbg !117
  %25 = add nsw i32 %23, %vec.phi17, !dbg !117
  %index.next = add i64 %index, 2, !dbg !120
  %26 = icmp eq i64 %index.next, %n.vec, !dbg !120
  br i1 %26, label %middle.block, label %vector.body, !dbg !120, !llvm.loop !121

middle.block:                                     ; preds = %vector.body, %.lr.ph
  %resume.val = phi i64 [ 0, %.lr.ph ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi i32 [ 0, %.lr.ph ], [ %24, %vector.body ], !dbg !117
  %rdx.vec.exit.phi18 = phi i32 [ 0, %.lr.ph ], [ %25, %vector.body ], !dbg !117
  %bin.rdx = add i32 %rdx.vec.exit.phi18, %rdx.vec.exit.phi, !dbg !117
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %resume.val, %middle.block ]
  %val.03 = phi i32 [ %34, %scalar.ph ], [ %bin.rdx, %middle.block ]
  %27 = getelementptr inbounds i32* %9, i64 %indvars.iv, !dbg !117
  %28 = load i32* %27, align 4, !dbg !117, !tbaa !92
  %29 = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !117
  %30 = load i32** %29, align 8, !dbg !117, !tbaa !83
  %31 = getelementptr inbounds i32* %30, i64 %indvars.iv8, !dbg !117
  %32 = load i32* %31, align 4, !dbg !117, !tbaa !92
  %33 = mul nsw i32 %32, %28, !dbg !117
  %34 = add nsw i32 %33, %val.03, !dbg !117
  tail call void @llvm.dbg.value(metadata !{i32 %.lcssa}, i64 0, metadata !45), !dbg !117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !120
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !120
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !120
  br i1 %exitcond, label %._crit_edge, label %scalar.ph, !dbg !120, !llvm.loop !122

._crit_edge:                                      ; preds = %middle.block, %scalar.ph
  %.lcssa = phi i32 [ %34, %scalar.ph ], [ %bin.rdx, %middle.block ]
  %35 = getelementptr inbounds i32* %7, i64 %indvars.iv8, !dbg !115
  store i32 %.lcssa, i32* %35, align 4, !dbg !115, !tbaa !92
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !112
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !112
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %cols, !dbg !112
  br i1 %exitcond11, label %._crit_edge5, label %.lr.ph, !dbg !112

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !110
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !110
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %rows, !dbg !110
  br i1 %exitcond15, label %._crit_edge7, label %.preheader1, !dbg !110

._crit_edge7:                                     ; preds = %._crit_edge5, %0
  ret i32** %m3, !dbg !123
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !53), !dbg !124
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !54), !dbg !124
  %1 = icmp eq i32 %argc, 2, !dbg !125
  br i1 %1, label %2, label %7, !dbg !125

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !126
  %4 = load i8** %3, align 8, !dbg !126, !tbaa !83
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !127) #3, !dbg !128
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #3, !dbg !129
  %6 = trunc i64 %5 to i32, !dbg !129
  br label %7, !dbg !126

; <label>:7                                       ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 3000000, %0 ], !dbg !126
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !56), !dbg !126
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !132) #3, !dbg !134
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !135) #3, !dbg !134
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !136) #3, !dbg !137
  %9 = tail call noalias i8* @malloc(i64 80) #3, !dbg !138
  %10 = bitcast i8* %9 to i32**, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !139) #3, !dbg !138
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !140) #3, !dbg !141
  br label %.lr.ph.i, !dbg !141

.lr.ph.i:                                         ; preds = %.lr.ph.i, %7
  %indvars.iv8.i = phi i64 [ 0, %7 ], [ %indvars.iv.next9.i, %.lr.ph.i ]
  %count.03.i = phi i32 [ 1, %7 ], [ %27, %.lr.ph.i ]
  %11 = tail call noalias i8* @malloc(i64 40) #3, !dbg !142
  %12 = bitcast i8* %11 to i32*, !dbg !142
  %13 = getelementptr inbounds i32** %10, i64 %indvars.iv8.i, !dbg !142
  store i32* %12, i32** %13, align 8, !dbg !142, !tbaa !83
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !143) #3, !dbg !144
  store i32 %count.03.i, i32* %12, align 4, !dbg !145, !tbaa !92
  %14 = getelementptr inbounds i8* %11, i64 4, !dbg !145
  %15 = insertelement <4 x i32> undef, i32 %count.03.i, i32 0, !dbg !145
  %16 = insertelement <4 x i32> %15, i32 %count.03.i, i32 1, !dbg !145
  %17 = insertelement <4 x i32> %16, i32 %count.03.i, i32 2, !dbg !145
  %18 = insertelement <4 x i32> %17, i32 %count.03.i, i32 3, !dbg !145
  %19 = add <4 x i32> %18, <i32 1, i32 2, i32 3, i32 4>, !dbg !145
  %20 = bitcast i8* %14 to <4 x i32>*, !dbg !145
  store <4 x i32> %19, <4 x i32>* %20, align 4, !dbg !145, !tbaa !92
  %21 = getelementptr inbounds i8* %11, i64 20, !dbg !145
  %22 = add <4 x i32> %18, <i32 5, i32 6, i32 7, i32 8>, !dbg !145
  %23 = add nsw i32 %count.03.i, 9, !dbg !145
  %24 = bitcast i8* %21 to <4 x i32>*, !dbg !145
  store <4 x i32> %22, <4 x i32>* %24, align 4, !dbg !145, !tbaa !92
  %25 = getelementptr inbounds i8* %11, i64 36, !dbg !145
  %26 = bitcast i8* %25 to i32*, !dbg !145
  store i32 %23, i32* %26, align 4, !dbg !145, !tbaa !92
  %27 = add i32 %count.03.i, 10, !dbg !144
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !141
  %exitcond63 = icmp eq i64 %indvars.iv.next9.i, 10, !dbg !141
  br i1 %exitcond63, label %mkmatrix.exit, label %.lr.ph.i, !dbg !141

mkmatrix.exit:                                    ; preds = %.lr.ph.i
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !57), !dbg !133
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !146) #3, !dbg !148
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !149) #3, !dbg !148
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !150) #3, !dbg !151
  %28 = tail call noalias i8* @malloc(i64 80) #3, !dbg !152
  %29 = bitcast i8* %28 to i32**, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !153) #3, !dbg !152
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !154) #3, !dbg !155
  br label %.lr.ph.i8, !dbg !155

.lr.ph.i8:                                        ; preds = %.lr.ph.i8, %mkmatrix.exit
  %indvars.iv8.i1 = phi i64 [ 0, %mkmatrix.exit ], [ %indvars.iv.next9.i10, %.lr.ph.i8 ]
  %count.03.i2 = phi i32 [ 1, %mkmatrix.exit ], [ %46, %.lr.ph.i8 ]
  %30 = tail call noalias i8* @malloc(i64 40) #3, !dbg !156
  %31 = bitcast i8* %30 to i32*, !dbg !156
  %32 = getelementptr inbounds i32** %29, i64 %indvars.iv8.i1, !dbg !156
  store i32* %31, i32** %32, align 8, !dbg !156, !tbaa !83
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !157) #3, !dbg !158
  store i32 %count.03.i2, i32* %31, align 4, !dbg !159, !tbaa !92
  %33 = getelementptr inbounds i8* %30, i64 4, !dbg !159
  %34 = insertelement <4 x i32> undef, i32 %count.03.i2, i32 0, !dbg !159
  %35 = insertelement <4 x i32> %34, i32 %count.03.i2, i32 1, !dbg !159
  %36 = insertelement <4 x i32> %35, i32 %count.03.i2, i32 2, !dbg !159
  %37 = insertelement <4 x i32> %36, i32 %count.03.i2, i32 3, !dbg !159
  %38 = add <4 x i32> %37, <i32 1, i32 2, i32 3, i32 4>, !dbg !159
  %39 = bitcast i8* %33 to <4 x i32>*, !dbg !159
  store <4 x i32> %38, <4 x i32>* %39, align 4, !dbg !159, !tbaa !92
  %40 = getelementptr inbounds i8* %30, i64 20, !dbg !159
  %41 = add <4 x i32> %37, <i32 5, i32 6, i32 7, i32 8>, !dbg !159
  %42 = add nsw i32 %count.03.i2, 9, !dbg !159
  %43 = bitcast i8* %40 to <4 x i32>*, !dbg !159
  store <4 x i32> %41, <4 x i32>* %43, align 4, !dbg !159, !tbaa !92
  %44 = getelementptr inbounds i8* %30, i64 36, !dbg !159
  %45 = bitcast i8* %44 to i32*, !dbg !159
  store i32 %42, i32* %45, align 4, !dbg !159, !tbaa !92
  %46 = add i32 %count.03.i2, 10, !dbg !158
  %indvars.iv.next9.i10 = add nuw nsw i64 %indvars.iv8.i1, 1, !dbg !155
  %exitcond61 = icmp eq i64 %indvars.iv.next9.i10, 10, !dbg !155
  br i1 %exitcond61, label %mkmatrix.exit13, label %.lr.ph.i8, !dbg !155

mkmatrix.exit13:                                  ; preds = %.lr.ph.i8
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !58), !dbg !147
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !160) #3, !dbg !162
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !163) #3, !dbg !162
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !164) #3, !dbg !165
  %47 = tail call noalias i8* @malloc(i64 80) #3, !dbg !166
  %48 = bitcast i8* %47 to i32**, !dbg !166
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !167) #3, !dbg !166
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !168) #3, !dbg !169
  br label %.lr.ph.i21, !dbg !169

.lr.ph.i21:                                       ; preds = %.lr.ph.i21, %mkmatrix.exit13
  %indvars.iv8.i14 = phi i64 [ 0, %mkmatrix.exit13 ], [ %indvars.iv.next9.i23, %.lr.ph.i21 ]
  %count.03.i15 = phi i32 [ 1, %mkmatrix.exit13 ], [ %65, %.lr.ph.i21 ]
  %49 = tail call noalias i8* @malloc(i64 40) #3, !dbg !170
  %50 = bitcast i8* %49 to i32*, !dbg !170
  %51 = getelementptr inbounds i32** %48, i64 %indvars.iv8.i14, !dbg !170
  store i32* %50, i32** %51, align 8, !dbg !170, !tbaa !83
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !171) #3, !dbg !172
  store i32 %count.03.i15, i32* %50, align 4, !dbg !173, !tbaa !92
  %52 = getelementptr inbounds i8* %49, i64 4, !dbg !173
  %53 = insertelement <4 x i32> undef, i32 %count.03.i15, i32 0, !dbg !173
  %54 = insertelement <4 x i32> %53, i32 %count.03.i15, i32 1, !dbg !173
  %55 = insertelement <4 x i32> %54, i32 %count.03.i15, i32 2, !dbg !173
  %56 = insertelement <4 x i32> %55, i32 %count.03.i15, i32 3, !dbg !173
  %57 = add <4 x i32> %56, <i32 1, i32 2, i32 3, i32 4>, !dbg !173
  %58 = bitcast i8* %52 to <4 x i32>*, !dbg !173
  store <4 x i32> %57, <4 x i32>* %58, align 4, !dbg !173, !tbaa !92
  %59 = getelementptr inbounds i8* %49, i64 20, !dbg !173
  %60 = add <4 x i32> %56, <i32 5, i32 6, i32 7, i32 8>, !dbg !173
  %61 = add nsw i32 %count.03.i15, 9, !dbg !173
  %62 = bitcast i8* %59 to <4 x i32>*, !dbg !173
  store <4 x i32> %60, <4 x i32>* %62, align 4, !dbg !173, !tbaa !92
  %63 = getelementptr inbounds i8* %49, i64 36, !dbg !173
  %64 = bitcast i8* %63 to i32*, !dbg !173
  store i32 %61, i32* %64, align 4, !dbg !173, !tbaa !92
  %65 = add i32 %count.03.i15, 10, !dbg !172
  %indvars.iv.next9.i23 = add nuw nsw i64 %indvars.iv8.i14, 1, !dbg !169
  %exitcond59 = icmp eq i64 %indvars.iv.next9.i23, 10, !dbg !169
  br i1 %exitcond59, label %mkmatrix.exit26.preheader, label %.lr.ph.i21, !dbg !169

mkmatrix.exit26.preheader:                        ; preds = %.lr.ph.i21
  %66 = icmp sgt i32 %8, 0, !dbg !174
  br i1 %66, label %.preheader1.i.preheader, label %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge, !dbg !174

mkmatrix.exit26.preheader.freematrix.exit54_crit_edge: ; preds = %mkmatrix.exit26.preheader
  %.pre81 = getelementptr inbounds i8* %28, i64 72, !dbg !176
  %67 = bitcast i8* %.pre81 to i32**, !dbg !176
  %.pre82 = getelementptr inbounds i8* %28, i64 64, !dbg !176
  %68 = bitcast i8* %.pre82 to i32**, !dbg !176
  %.pre84 = getelementptr inbounds i8* %28, i64 56, !dbg !176
  %69 = bitcast i8* %.pre84 to i32**, !dbg !176
  %.pre86 = getelementptr inbounds i8* %28, i64 48, !dbg !176
  %70 = bitcast i8* %.pre86 to i32**, !dbg !176
  %.pre88 = getelementptr inbounds i8* %28, i64 40, !dbg !176
  %71 = bitcast i8* %.pre88 to i32**, !dbg !176
  %.pre90 = getelementptr inbounds i8* %28, i64 32, !dbg !176
  %72 = bitcast i8* %.pre90 to i32**, !dbg !176
  %.pre92 = getelementptr inbounds i8* %28, i64 24, !dbg !176
  %73 = bitcast i8* %.pre92 to i32**, !dbg !176
  %.pre94 = getelementptr inbounds i8* %28, i64 16, !dbg !176
  %74 = bitcast i8* %.pre94 to i32**, !dbg !176
  %.pre96 = getelementptr inbounds i8* %28, i64 8, !dbg !176
  %75 = bitcast i8* %.pre96 to i32**, !dbg !176
  br label %freematrix.exit54, !dbg !174

.preheader1.i.preheader:                          ; preds = %mkmatrix.exit26.preheader, %mmult.exit
  %i.051 = phi i32 [ %148, %mmult.exit ], [ 0, %mkmatrix.exit26.preheader ]
  br label %.preheader1.i, !dbg !178

.preheader1.i:                                    ; preds = %.preheader1.i.preheader, %._crit_edge5.i
  %indvars.iv12.i = phi i64 [ %indvars.iv.next13.i, %._crit_edge5.i ], [ 0, %.preheader1.i.preheader ]
  %76 = getelementptr inbounds i32** %48, i64 %indvars.iv12.i, !dbg !178
  %77 = load i32** %76, align 8, !dbg !178, !tbaa !83
  %78 = getelementptr inbounds i32** %10, i64 %indvars.iv12.i, !dbg !181
  %79 = load i32** %78, align 8, !dbg !181, !tbaa !83
  %.pre = load i32** %29, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert = getelementptr inbounds i8* %28, i64 8
  %80 = bitcast i8* %.phi.trans.insert to i32**
  %.pre64 = load i32** %80, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert65 = getelementptr inbounds i8* %28, i64 16
  %81 = bitcast i8* %.phi.trans.insert65 to i32**
  %.pre66 = load i32** %81, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert67 = getelementptr inbounds i8* %28, i64 24
  %82 = bitcast i8* %.phi.trans.insert67 to i32**
  %.pre68 = load i32** %82, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert69 = getelementptr inbounds i8* %28, i64 32
  %83 = bitcast i8* %.phi.trans.insert69 to i32**
  %.pre70 = load i32** %83, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert71 = getelementptr inbounds i8* %28, i64 40
  %84 = bitcast i8* %.phi.trans.insert71 to i32**
  %.pre72 = load i32** %84, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert73 = getelementptr inbounds i8* %28, i64 48
  %85 = bitcast i8* %.phi.trans.insert73 to i32**
  %.pre74 = load i32** %85, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert75 = getelementptr inbounds i8* %28, i64 56
  %86 = bitcast i8* %.phi.trans.insert75 to i32**
  %.pre76 = load i32** %86, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert77 = getelementptr inbounds i8* %28, i64 64
  %87 = bitcast i8* %.phi.trans.insert77 to i32**
  %.pre78 = load i32** %87, align 8, !dbg !181, !tbaa !83
  %.phi.trans.insert79 = getelementptr inbounds i8* %28, i64 72
  %88 = bitcast i8* %.phi.trans.insert79 to i32**
  %.pre80 = load i32** %88, align 8, !dbg !181, !tbaa !83
  br label %.lr.ph.i28, !dbg !182

.lr.ph.i28:                                       ; preds = %.lr.ph.i28, %.preheader1.i
  %indvars.iv8.i27 = phi i64 [ 0, %.preheader1.i ], [ %indvars.iv.next9.i33, %.lr.ph.i28 ]
  %89 = load i32* %79, align 4, !dbg !181, !tbaa !92
  %90 = getelementptr inbounds i32* %.pre, i64 %indvars.iv8.i27, !dbg !181
  %91 = load i32* %90, align 4, !dbg !181, !tbaa !92
  %92 = mul nsw i32 %91, %89, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %93 = getelementptr inbounds i32* %79, i64 1, !dbg !181
  %94 = load i32* %93, align 4, !dbg !181, !tbaa !92
  %95 = getelementptr inbounds i32* %.pre64, i64 %indvars.iv8.i27, !dbg !181
  %96 = load i32* %95, align 4, !dbg !181, !tbaa !92
  %97 = mul nsw i32 %96, %94, !dbg !181
  %98 = add nsw i32 %97, %92, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %99 = getelementptr inbounds i32* %79, i64 2, !dbg !181
  %100 = load i32* %99, align 4, !dbg !181, !tbaa !92
  %101 = getelementptr inbounds i32* %.pre66, i64 %indvars.iv8.i27, !dbg !181
  %102 = load i32* %101, align 4, !dbg !181, !tbaa !92
  %103 = mul nsw i32 %102, %100, !dbg !181
  %104 = add nsw i32 %103, %98, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %105 = getelementptr inbounds i32* %79, i64 3, !dbg !181
  %106 = load i32* %105, align 4, !dbg !181, !tbaa !92
  %107 = getelementptr inbounds i32* %.pre68, i64 %indvars.iv8.i27, !dbg !181
  %108 = load i32* %107, align 4, !dbg !181, !tbaa !92
  %109 = mul nsw i32 %108, %106, !dbg !181
  %110 = add nsw i32 %109, %104, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %111 = getelementptr inbounds i32* %79, i64 4, !dbg !181
  %112 = load i32* %111, align 4, !dbg !181, !tbaa !92
  %113 = getelementptr inbounds i32* %.pre70, i64 %indvars.iv8.i27, !dbg !181
  %114 = load i32* %113, align 4, !dbg !181, !tbaa !92
  %115 = mul nsw i32 %114, %112, !dbg !181
  %116 = add nsw i32 %115, %110, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %117 = getelementptr inbounds i32* %79, i64 5, !dbg !181
  %118 = load i32* %117, align 4, !dbg !181, !tbaa !92
  %119 = getelementptr inbounds i32* %.pre72, i64 %indvars.iv8.i27, !dbg !181
  %120 = load i32* %119, align 4, !dbg !181, !tbaa !92
  %121 = mul nsw i32 %120, %118, !dbg !181
  %122 = add nsw i32 %121, %116, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %123 = getelementptr inbounds i32* %79, i64 6, !dbg !181
  %124 = load i32* %123, align 4, !dbg !181, !tbaa !92
  %125 = getelementptr inbounds i32* %.pre74, i64 %indvars.iv8.i27, !dbg !181
  %126 = load i32* %125, align 4, !dbg !181, !tbaa !92
  %127 = mul nsw i32 %126, %124, !dbg !181
  %128 = add nsw i32 %127, %122, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %129 = getelementptr inbounds i32* %79, i64 7, !dbg !181
  %130 = load i32* %129, align 4, !dbg !181, !tbaa !92
  %131 = getelementptr inbounds i32* %.pre76, i64 %indvars.iv8.i27, !dbg !181
  %132 = load i32* %131, align 4, !dbg !181, !tbaa !92
  %133 = mul nsw i32 %132, %130, !dbg !181
  %134 = add nsw i32 %133, %128, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %135 = getelementptr inbounds i32* %79, i64 8, !dbg !181
  %136 = load i32* %135, align 4, !dbg !181, !tbaa !92
  %137 = getelementptr inbounds i32* %.pre78, i64 %indvars.iv8.i27, !dbg !181
  %138 = load i32* %137, align 4, !dbg !181, !tbaa !92
  %139 = mul nsw i32 %138, %136, !dbg !181
  %140 = add nsw i32 %139, %134, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %141 = getelementptr inbounds i32* %79, i64 9, !dbg !181
  %142 = load i32* %141, align 4, !dbg !181, !tbaa !92
  %143 = getelementptr inbounds i32* %.pre80, i64 %indvars.iv8.i27, !dbg !181
  %144 = load i32* %143, align 4, !dbg !181, !tbaa !92
  %145 = mul nsw i32 %144, %142, !dbg !181
  %146 = add nsw i32 %145, %140, !dbg !181
  tail call void @llvm.dbg.value(metadata !{i32 %146}, i64 0, metadata !183), !dbg !181
  %147 = getelementptr inbounds i32* %77, i64 %indvars.iv8.i27, !dbg !178
  store i32 %146, i32* %147, align 4, !dbg !178, !tbaa !92
  %indvars.iv.next9.i33 = add nuw nsw i64 %indvars.iv8.i27, 1, !dbg !182
  %exitcond = icmp eq i64 %indvars.iv.next9.i33, 10, !dbg !182
  br i1 %exitcond, label %._crit_edge5.i, label %.lr.ph.i28, !dbg !182

._crit_edge5.i:                                   ; preds = %.lr.ph.i28
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1, !dbg !184
  %exitcond56 = icmp eq i64 %indvars.iv.next13.i, 10, !dbg !184
  br i1 %exitcond56, label %mmult.exit, label %.preheader1.i, !dbg !184

mmult.exit:                                       ; preds = %._crit_edge5.i
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !59), !dbg !179
  %148 = add nsw i32 %i.051, 1, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i32 %148}, i64 0, metadata !55), !dbg !174
  %exitcond57 = icmp eq i32 %148, %8, !dbg !174
  br i1 %exitcond57, label %freematrix.exit54, label %.preheader1.i.preheader, !dbg !174

freematrix.exit54:                                ; preds = %mmult.exit, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge
  %.pre-phi97 = phi i32** [ %75, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %80, %mmult.exit ], !dbg !176
  %.pre-phi95 = phi i32** [ %74, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %81, %mmult.exit ], !dbg !176
  %.pre-phi93 = phi i32** [ %73, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %82, %mmult.exit ], !dbg !176
  %.pre-phi91 = phi i32** [ %72, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %83, %mmult.exit ], !dbg !176
  %.pre-phi89 = phi i32** [ %71, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %84, %mmult.exit ], !dbg !176
  %.pre-phi87 = phi i32** [ %70, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %85, %mmult.exit ], !dbg !176
  %.pre-phi85 = phi i32** [ %69, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %86, %mmult.exit ], !dbg !176
  %.pre-phi83 = phi i32** [ %68, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %87, %mmult.exit ], !dbg !176
  %.pre-phi = phi i32** [ %67, %mkmatrix.exit26.preheader.freematrix.exit54_crit_edge ], [ %88, %mmult.exit ], !dbg !176
  %149 = load i32** %48, align 8, !dbg !185, !tbaa !83
  %150 = load i32* %149, align 4, !dbg !185, !tbaa !92
  %151 = getelementptr inbounds i8* %47, i64 16, !dbg !185
  %152 = bitcast i8* %151 to i32**, !dbg !185
  %153 = load i32** %152, align 8, !dbg !185, !tbaa !83
  %154 = getelementptr inbounds i32* %153, i64 3, !dbg !185
  %155 = load i32* %154, align 4, !dbg !185, !tbaa !92
  %156 = getelementptr inbounds i8* %47, i64 24, !dbg !185
  %157 = bitcast i8* %156 to i32**, !dbg !185
  %158 = load i32** %157, align 8, !dbg !185, !tbaa !83
  %159 = getelementptr inbounds i32* %158, i64 2, !dbg !185
  %160 = load i32* %159, align 4, !dbg !185, !tbaa !92
  %161 = getelementptr inbounds i8* %47, i64 32, !dbg !185
  %162 = bitcast i8* %161 to i32**, !dbg !185
  %163 = load i32** %162, align 8, !dbg !185, !tbaa !83
  %164 = getelementptr inbounds i32* %163, i64 4, !dbg !185
  %165 = load i32* %164, align 4, !dbg !185, !tbaa !92
  %166 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %150, i32 %155, i32 %160, i32 %165) #3, !dbg !185
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !186) #3, !dbg !188
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !189) #3, !dbg !188
  %167 = getelementptr inbounds i8* %9, i64 72, !dbg !190
  %168 = bitcast i8* %167 to i32**, !dbg !190
  %169 = load i32** %168, align 8, !dbg !190, !tbaa !83
  %170 = bitcast i32* %169 to i8*, !dbg !190
  tail call void @free(i8* %170) #3, !dbg !190
  %171 = getelementptr inbounds i8* %9, i64 64, !dbg !190
  %172 = bitcast i8* %171 to i32**, !dbg !190
  %173 = load i32** %172, align 8, !dbg !190, !tbaa !83
  %174 = bitcast i32* %173 to i8*, !dbg !190
  tail call void @free(i8* %174) #3, !dbg !190
  %175 = getelementptr inbounds i8* %9, i64 56, !dbg !190
  %176 = bitcast i8* %175 to i32**, !dbg !190
  %177 = load i32** %176, align 8, !dbg !190, !tbaa !83
  %178 = bitcast i32* %177 to i8*, !dbg !190
  tail call void @free(i8* %178) #3, !dbg !190
  %179 = getelementptr inbounds i8* %9, i64 48, !dbg !190
  %180 = bitcast i8* %179 to i32**, !dbg !190
  %181 = load i32** %180, align 8, !dbg !190, !tbaa !83
  %182 = bitcast i32* %181 to i8*, !dbg !190
  tail call void @free(i8* %182) #3, !dbg !190
  %183 = getelementptr inbounds i8* %9, i64 40, !dbg !190
  %184 = bitcast i8* %183 to i32**, !dbg !190
  %185 = load i32** %184, align 8, !dbg !190, !tbaa !83
  %186 = bitcast i32* %185 to i8*, !dbg !190
  tail call void @free(i8* %186) #3, !dbg !190
  %187 = getelementptr inbounds i8* %9, i64 32, !dbg !190
  %188 = bitcast i8* %187 to i32**, !dbg !190
  %189 = load i32** %188, align 8, !dbg !190, !tbaa !83
  %190 = bitcast i32* %189 to i8*, !dbg !190
  tail call void @free(i8* %190) #3, !dbg !190
  %191 = getelementptr inbounds i8* %9, i64 24, !dbg !190
  %192 = bitcast i8* %191 to i32**, !dbg !190
  %193 = load i32** %192, align 8, !dbg !190, !tbaa !83
  %194 = bitcast i32* %193 to i8*, !dbg !190
  tail call void @free(i8* %194) #3, !dbg !190
  %195 = getelementptr inbounds i8* %9, i64 16, !dbg !190
  %196 = bitcast i8* %195 to i32**, !dbg !190
  %197 = load i32** %196, align 8, !dbg !190, !tbaa !83
  %198 = bitcast i32* %197 to i8*, !dbg !190
  tail call void @free(i8* %198) #3, !dbg !190
  %199 = getelementptr inbounds i8* %9, i64 8, !dbg !190
  %200 = bitcast i8* %199 to i32**, !dbg !190
  %201 = load i32** %200, align 8, !dbg !190, !tbaa !83
  %202 = bitcast i32* %201 to i8*, !dbg !190
  tail call void @free(i8* %202) #3, !dbg !190
  %203 = load i32** %10, align 8, !dbg !190, !tbaa !83
  %204 = bitcast i32* %203 to i8*, !dbg !190
  tail call void @free(i8* %204) #3, !dbg !190
  tail call void @free(i8* %9) #3, !dbg !191
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !192) #3, !dbg !193
  tail call void @llvm.dbg.value(metadata !{i32** %29}, i64 0, metadata !194) #3, !dbg !193
  %205 = load i32** %.pre-phi, align 8, !dbg !176, !tbaa !83
  %206 = bitcast i32* %205 to i8*, !dbg !176
  tail call void @free(i8* %206) #3, !dbg !176
  %207 = load i32** %.pre-phi83, align 8, !dbg !176, !tbaa !83
  %208 = bitcast i32* %207 to i8*, !dbg !176
  tail call void @free(i8* %208) #3, !dbg !176
  %209 = load i32** %.pre-phi85, align 8, !dbg !176, !tbaa !83
  %210 = bitcast i32* %209 to i8*, !dbg !176
  tail call void @free(i8* %210) #3, !dbg !176
  %211 = load i32** %.pre-phi87, align 8, !dbg !176, !tbaa !83
  %212 = bitcast i32* %211 to i8*, !dbg !176
  tail call void @free(i8* %212) #3, !dbg !176
  %213 = load i32** %.pre-phi89, align 8, !dbg !176, !tbaa !83
  %214 = bitcast i32* %213 to i8*, !dbg !176
  tail call void @free(i8* %214) #3, !dbg !176
  %215 = load i32** %.pre-phi91, align 8, !dbg !176, !tbaa !83
  %216 = bitcast i32* %215 to i8*, !dbg !176
  tail call void @free(i8* %216) #3, !dbg !176
  %217 = load i32** %.pre-phi93, align 8, !dbg !176, !tbaa !83
  %218 = bitcast i32* %217 to i8*, !dbg !176
  tail call void @free(i8* %218) #3, !dbg !176
  %219 = load i32** %.pre-phi95, align 8, !dbg !176, !tbaa !83
  %220 = bitcast i32* %219 to i8*, !dbg !176
  tail call void @free(i8* %220) #3, !dbg !176
  %221 = load i32** %.pre-phi97, align 8, !dbg !176, !tbaa !83
  %222 = bitcast i32* %221 to i8*, !dbg !176
  tail call void @free(i8* %222) #3, !dbg !176
  %223 = load i32** %29, align 8, !dbg !176, !tbaa !83
  %224 = bitcast i32* %223 to i8*, !dbg !176
  tail call void @free(i8* %224) #3, !dbg !176
  tail call void @free(i8* %28) #3, !dbg !195
  tail call void @llvm.dbg.value(metadata !131, i64 0, metadata !196) #3, !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32** %48}, i64 0, metadata !199) #3, !dbg !198
  %225 = getelementptr inbounds i8* %47, i64 72, !dbg !200
  %226 = bitcast i8* %225 to i32**, !dbg !200
  %227 = load i32** %226, align 8, !dbg !200, !tbaa !83
  %228 = bitcast i32* %227 to i8*, !dbg !200
  tail call void @free(i8* %228) #3, !dbg !200
  %229 = getelementptr inbounds i8* %47, i64 64, !dbg !200
  %230 = bitcast i8* %229 to i32**, !dbg !200
  %231 = load i32** %230, align 8, !dbg !200, !tbaa !83
  %232 = bitcast i32* %231 to i8*, !dbg !200
  tail call void @free(i8* %232) #3, !dbg !200
  %233 = getelementptr inbounds i8* %47, i64 56, !dbg !200
  %234 = bitcast i8* %233 to i32**, !dbg !200
  %235 = load i32** %234, align 8, !dbg !200, !tbaa !83
  %236 = bitcast i32* %235 to i8*, !dbg !200
  tail call void @free(i8* %236) #3, !dbg !200
  %237 = getelementptr inbounds i8* %47, i64 48, !dbg !200
  %238 = bitcast i8* %237 to i32**, !dbg !200
  %239 = load i32** %238, align 8, !dbg !200, !tbaa !83
  %240 = bitcast i32* %239 to i8*, !dbg !200
  tail call void @free(i8* %240) #3, !dbg !200
  %241 = getelementptr inbounds i8* %47, i64 40, !dbg !200
  %242 = bitcast i8* %241 to i32**, !dbg !200
  %243 = load i32** %242, align 8, !dbg !200, !tbaa !83
  %244 = bitcast i32* %243 to i8*, !dbg !200
  tail call void @free(i8* %244) #3, !dbg !200
  %245 = getelementptr inbounds i8* %47, i64 32, !dbg !200
  %246 = bitcast i8* %245 to i32**, !dbg !200
  %247 = load i32** %246, align 8, !dbg !200, !tbaa !83
  %248 = bitcast i32* %247 to i8*, !dbg !200
  tail call void @free(i8* %248) #3, !dbg !200
  %249 = getelementptr inbounds i8* %47, i64 24, !dbg !200
  %250 = bitcast i8* %249 to i32**, !dbg !200
  %251 = load i32** %250, align 8, !dbg !200, !tbaa !83
  %252 = bitcast i32* %251 to i8*, !dbg !200
  tail call void @free(i8* %252) #3, !dbg !200
  %253 = getelementptr inbounds i8* %47, i64 16, !dbg !200
  %254 = bitcast i8* %253 to i32**, !dbg !200
  %255 = load i32** %254, align 8, !dbg !200, !tbaa !83
  %256 = bitcast i32* %255 to i8*, !dbg !200
  tail call void @free(i8* %256) #3, !dbg !200
  %257 = getelementptr inbounds i8* %47, i64 8, !dbg !200
  %258 = bitcast i8* %257 to i32**, !dbg !200
  %259 = load i32** %258, align 8, !dbg !200, !tbaa !83
  %260 = bitcast i32* %259 to i8*, !dbg !200
  tail call void @free(i8* %260) #3, !dbg !200
  %261 = load i32** %48, align 8, !dbg !200, !tbaa !83
  %262 = bitcast i32* %261 to i8*, !dbg !200
  tail call void @free(i8* %262) #3, !dbg !200
  tail call void @free(i8* %47) #3, !dbg !201
  ret i32 0, !dbg !202
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
!83 = metadata !{metadata !84, metadata !84, i64 0}
!84 = metadata !{metadata !"any pointer", metadata !85, i64 0}
!85 = metadata !{metadata !"omnipotent char", metadata !86, i64 0}
!86 = metadata !{metadata !"Simple C/C++ TBAA"}
!87 = metadata !{i32 18, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !82, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!89 = metadata !{metadata !89, metadata !90, metadata !91}
!90 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!91 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!92 = metadata !{metadata !93, metadata !93, i64 0}
!93 = metadata !{metadata !"int", metadata !85, i64 0}
!94 = metadata !{metadata !94, metadata !90, metadata !91}
!95 = metadata !{i32 21, i32 0, metadata !4, null}
!96 = metadata !{i32 24, i32 0, metadata !18, null}
!97 = metadata !{i32 26, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !18, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!99 = metadata !{i32 27, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !98, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!101 = metadata !{i32 28, i32 0, metadata !100, null}
!102 = metadata !{i32 29, i32 0, metadata !18, null}
!103 = metadata !{i32 31, i32 0, metadata !27, null}
!104 = metadata !{i32 32, i32 0, metadata !27, null}
!105 = metadata !{i32 32, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !27, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!107 = metadata !{i32 33, i32 0, metadata !27, null}
!108 = metadata !{i32 34, i32 0, metadata !27, null}
!109 = metadata !{i32 36, i32 0, metadata !33, null}
!110 = metadata !{i32 38, i32 0, metadata !111, null}
!111 = metadata !{i32 786443, metadata !1, metadata !33, i32 38, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!112 = metadata !{i32 39, i32 0, metadata !113, null}
!113 = metadata !{i32 786443, metadata !1, metadata !114, i32 39, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!114 = metadata !{i32 786443, metadata !1, metadata !111, i32 38, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!115 = metadata !{i32 44, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !113, i32 39, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!117 = metadata !{i32 42, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !119, i32 41, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!119 = metadata !{i32 786443, metadata !1, metadata !116, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!120 = metadata !{i32 41, i32 0, metadata !119, null}
!121 = metadata !{metadata !121, metadata !90, metadata !91}
!122 = metadata !{metadata !122, metadata !90, metadata !91}
!123 = metadata !{i32 47, i32 0, metadata !33, null}
!124 = metadata !{i32 50, i32 0, metadata !46, null}
!125 = metadata !{i32 56, i32 0, metadata !46, null}
!126 = metadata !{i32 56, i32 31, metadata !46, null}
!127 = metadata !{i32 786689, metadata !60, metadata !"__nptr", metadata !62, i32 16777494, metadata !65, i32 0, metadata !126} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!128 = metadata !{i32 278, i32 0, metadata !60, metadata !126}
!129 = metadata !{i32 280, i32 0, metadata !130, metadata !126}
!130 = metadata !{i32 786443, metadata !61, metadata !60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!131 = metadata !{i32 10}
!132 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !133} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!133 = metadata !{i32 58, i32 0, metadata !46, null} ; [ DW_TAG_imported_module ]
!134 = metadata !{i32 12, i32 0, metadata !4, metadata !133}
!135 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !133} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!136 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !133} ; [ DW_TAG_auto_variable ] [count] [line 13]
!137 = metadata !{i32 13, i32 0, metadata !4, metadata !133}
!138 = metadata !{i32 14, i32 0, metadata !4, metadata !133}
!139 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !133} ; [ DW_TAG_auto_variable ] [m] [line 14]
!140 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !133} ; [ DW_TAG_auto_variable ] [i] [line 13]
!141 = metadata !{i32 15, i32 0, metadata !78, metadata !133}
!142 = metadata !{i32 16, i32 0, metadata !80, metadata !133}
!143 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !133} ; [ DW_TAG_auto_variable ] [j] [line 13]
!144 = metadata !{i32 17, i32 0, metadata !82, metadata !133}
!145 = metadata !{i32 18, i32 0, metadata !88, metadata !133}
!146 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !147} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!147 = metadata !{i32 59, i32 0, metadata !46, null}
!148 = metadata !{i32 12, i32 0, metadata !4, metadata !147}
!149 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !147} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!150 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !147} ; [ DW_TAG_auto_variable ] [count] [line 13]
!151 = metadata !{i32 13, i32 0, metadata !4, metadata !147}
!152 = metadata !{i32 14, i32 0, metadata !4, metadata !147}
!153 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !147} ; [ DW_TAG_auto_variable ] [m] [line 14]
!154 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !147} ; [ DW_TAG_auto_variable ] [i] [line 13]
!155 = metadata !{i32 15, i32 0, metadata !78, metadata !147}
!156 = metadata !{i32 16, i32 0, metadata !80, metadata !147}
!157 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !147} ; [ DW_TAG_auto_variable ] [j] [line 13]
!158 = metadata !{i32 17, i32 0, metadata !82, metadata !147}
!159 = metadata !{i32 18, i32 0, metadata !88, metadata !147}
!160 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, metadata !161} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!161 = metadata !{i32 60, i32 0, metadata !46, null}
!162 = metadata !{i32 12, i32 0, metadata !4, metadata !161}
!163 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, metadata !161} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!164 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, metadata !161} ; [ DW_TAG_auto_variable ] [count] [line 13]
!165 = metadata !{i32 13, i32 0, metadata !4, metadata !161}
!166 = metadata !{i32 14, i32 0, metadata !4, metadata !161}
!167 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, metadata !161} ; [ DW_TAG_auto_variable ] [m] [line 14]
!168 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, metadata !161} ; [ DW_TAG_auto_variable ] [i] [line 13]
!169 = metadata !{i32 15, i32 0, metadata !78, metadata !161}
!170 = metadata !{i32 16, i32 0, metadata !80, metadata !161}
!171 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, metadata !161} ; [ DW_TAG_auto_variable ] [j] [line 13]
!172 = metadata !{i32 17, i32 0, metadata !82, metadata !161}
!173 = metadata !{i32 18, i32 0, metadata !88, metadata !161}
!174 = metadata !{i32 62, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !46, i32 62, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!176 = metadata !{i32 32, i32 0, metadata !106, metadata !177}
!177 = metadata !{i32 68, i32 0, metadata !46, null}
!178 = metadata !{i32 44, i32 0, metadata !116, metadata !179}
!179 = metadata !{i32 63, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !175, i32 62, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!181 = metadata !{i32 42, i32 0, metadata !118, metadata !179}
!182 = metadata !{i32 39, i32 0, metadata !113, metadata !179}
!183 = metadata !{i32 786688, metadata !33, metadata !"val", metadata !5, i32 37, metadata !10, i32 0, metadata !179} ; [ DW_TAG_auto_variable ] [val] [line 37]
!184 = metadata !{i32 38, i32 0, metadata !111, metadata !179}
!185 = metadata !{i32 65, i32 0, metadata !46, null}
!186 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!187 = metadata !{i32 67, i32 0, metadata !46, null}
!188 = metadata !{i32 31, i32 0, metadata !27, metadata !187}
!189 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !187} ; [ DW_TAG_arg_variable ] [m] [line 31]
!190 = metadata !{i32 32, i32 0, metadata !106, metadata !187}
!191 = metadata !{i32 33, i32 0, metadata !27, metadata !187}
!192 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !177} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!193 = metadata !{i32 31, i32 0, metadata !27, metadata !177}
!194 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !177} ; [ DW_TAG_arg_variable ] [m] [line 31]
!195 = metadata !{i32 33, i32 0, metadata !27, metadata !177}
!196 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, metadata !197} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!197 = metadata !{i32 69, i32 0, metadata !46, null}
!198 = metadata !{i32 31, i32 0, metadata !27, metadata !197}
!199 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, metadata !197} ; [ DW_TAG_arg_variable ] [m] [line 31]
!200 = metadata !{i32 32, i32 0, metadata !106, metadata !197}
!201 = metadata !{i32 33, i32 0, metadata !27, metadata !197}
!202 = metadata !{i32 70, i32 0, metadata !46, null}
