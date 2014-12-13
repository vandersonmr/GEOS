; ModuleID = 'puzzle.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@next = internal unnamed_addr global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @rand() #0 {
  %1 = load i64* @next, align 8, !dbg !65, !tbaa !66
  %2 = mul i64 %1, 1103515245, !dbg !65
  %3 = add i64 %2, 12345, !dbg !65
  store i64 %3, i64* @next, align 8, !dbg !65, !tbaa !66
  %4 = lshr i64 %3, 16, !dbg !70
  %5 = trunc i64 %4 to i32, !dbg !70
  %6 = urem i32 %5, 32767, !dbg !70
  %7 = add i32 %6, 1, !dbg !70
  ret i32 %7, !dbg !70
}

; Function Attrs: nounwind uwtable
define void @srand(i32 %seed) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !14), !dbg !71
  %1 = zext i32 %seed to i64, !dbg !72
  store i64 %1, i64* @next, align 8, !dbg !72, !tbaa !66
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define i32 @randInt(i32 %min, i32 %max) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %min}, i64 0, metadata !19), !dbg !74
  tail call void @llvm.dbg.value(metadata !{i32 %max}, i64 0, metadata !20), !dbg !74
  %1 = sub nsw i32 %max, %min, !dbg !75
  %2 = add nsw i32 %1, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !75
  %3 = sitofp i32 %2 to double, !dbg !76
  %4 = load i64* @next, align 8, !dbg !77, !tbaa !66
  %5 = mul i64 %4, 1103515245, !dbg !77
  %6 = add i64 %5, 12345, !dbg !77
  store i64 %6, i64* @next, align 8, !dbg !77, !tbaa !66
  %7 = lshr i64 %6, 16, !dbg !78
  %8 = trunc i64 %7 to i32, !dbg !78
  %9 = urem i32 %8, 32767, !dbg !78
  %10 = add i32 %9, 1, !dbg !78
  %11 = sitofp i32 %10 to double, !dbg !76
  %12 = fmul double %11, 0x3F00000000000000, !dbg !76
  %13 = fmul double %3, %12, !dbg !76
  %14 = fptosi double %13 to i32, !dbg !76
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !21), !dbg !76
  %15 = icmp eq i32 %14, %2, !dbg !79
  %16 = add nsw i32 %14, %min, !dbg !79
  %17 = sext i1 %15 to i32, !dbg !79
  %18 = add nsw i32 %16, %17, !dbg !79
  ret i32 %18, !dbg !79
}

; Function Attrs: nounwind uwtable
define void @shuffle(i32* nocapture %items, i32 %len) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %items}, i64 0, metadata !28), !dbg !80
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !29), !dbg !80
  %1 = add nsw i32 %len, -1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !35), !dbg !81
  %2 = icmp eq i32 %1, 0, !dbg !81
  br i1 %2, label %28, label %.lr.ph, !dbg !81

.lr.ph:                                           ; preds = %0
  %3 = sext i32 %1 to i64, !dbg !81
  %next.promoted = load i64* @next, align 8, !dbg !83, !tbaa !66
  br label %4, !dbg !81

; <label>:4                                       ; preds = %.lr.ph, %4
  %5 = phi i64 [ %next.promoted, %.lr.ph ], [ %9, %4 ], !dbg !84
  %i.01 = phi i64 [ %3, %.lr.ph ], [ %26, %4 ]
  %6 = add i64 %i.01, 1, !dbg !84
  %7 = uitofp i64 %6 to double, !dbg !84
  %8 = mul i64 %5, 1103515245, !dbg !83
  %9 = add i64 %8, 12345, !dbg !83
  %10 = lshr i64 %9, 16, !dbg !86
  %11 = trunc i64 %10 to i32, !dbg !86
  %12 = urem i32 %11, 32767, !dbg !86
  %13 = add i32 %12, 1, !dbg !86
  %14 = sitofp i32 %13 to double, !dbg !84
  %15 = fmul double %14, 0x3F00000000000000, !dbg !84
  %16 = fmul double %7, %15, !dbg !84
  %17 = fptosi double %16 to i32, !dbg !84
  %18 = sext i32 %17 to i64, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i64 %18}, i64 0, metadata !34), !dbg !84
  %19 = icmp eq i64 %18, %6, !dbg !87
  %20 = sext i1 %19 to i64, !dbg !87
  %21 = add i64 %20, %18, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i64 %21}, i64 0, metadata !30), !dbg !87
  %22 = getelementptr inbounds i32* %items, i64 %i.01, !dbg !88
  %23 = load i32* %22, align 4, !dbg !88, !tbaa !89
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !36), !dbg !88
  %24 = getelementptr inbounds i32* %items, i64 %21, !dbg !91
  %25 = load i32* %24, align 4, !dbg !91, !tbaa !89
  store i32 %25, i32* %22, align 4, !dbg !91, !tbaa !89
  store i32 %23, i32* %24, align 4, !dbg !92, !tbaa !89
  %26 = add i64 %i.01, -1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{i64 %26}, i64 0, metadata !35), !dbg !81
  %27 = icmp eq i64 %26, 0, !dbg !81
  br i1 %27, label %._crit_edge, label %4, !dbg !81

._crit_edge:                                      ; preds = %4
  store i64 %9, i64* @next, align 8, !dbg !83, !tbaa !66
  br label %28, !dbg !81

; <label>:28                                      ; preds = %._crit_edge, %0
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define noalias i32* @createRandomArray(i32 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !41), !dbg !94
  %1 = add nsw i32 %size, 1, !dbg !95
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !43), !dbg !95
  %2 = sext i32 %1 to i64, !dbg !96
  %3 = shl nsw i64 %2, 2, !dbg !96
  %4 = tail call noalias i8* @malloc(i64 %3) #4, !dbg !96
  %5 = bitcast i8* %4 to i32*, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !44), !dbg !96
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !42), !dbg !98
  %6 = icmp sgt i32 %size, -1, !dbg !98
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge, !dbg !98

.lr.ph.preheader:                                 ; preds = %0
  %7 = add i32 %size, 1, !dbg !100
  %8 = icmp sgt i32 %7, 1
  %9 = zext i32 %size to i64
  %.op = add i64 %9, 1, !dbg !100
  %10 = select i1 %8, i64 %.op, i64 1, !dbg !100
  %n.vec = and i64 %10, -8, !dbg !98
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !98
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.preheader ], !dbg !98
  %11 = getelementptr inbounds i32* %5, i64 %index, !dbg !100
  %12 = trunc i64 %index to i32, !dbg !100
  %broadcast.splatinsert3 = insertelement <4 x i32> undef, i32 %12, i32 0, !dbg !100
  %broadcast.splat4 = shufflevector <4 x i32> %broadcast.splatinsert3, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !100
  %induction5 = add <4 x i32> %broadcast.splat4, <i32 0, i32 1, i32 2, i32 3>, !dbg !100
  %induction6 = add <4 x i32> %broadcast.splat4, <i32 4, i32 5, i32 6, i32 7>, !dbg !100
  %13 = bitcast i32* %11 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction5, <4 x i32>* %13, align 4, !dbg !100
  %.sum9 = or i64 %index, 4, !dbg !100
  %14 = getelementptr i32* %5, i64 %.sum9, !dbg !100
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !100
  store <4 x i32> %induction6, <4 x i32>* %15, align 4, !dbg !100
  %index.next = add i64 %index, 8, !dbg !98
  %16 = icmp eq i64 %index.next, %n.vec, !dbg !98
  br i1 %16, label %middle.block, label %vector.body, !dbg !98, !llvm.loop !101

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %10, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %17 = getelementptr inbounds i32* %5, i64 %indvars.iv, !dbg !100
  %18 = trunc i64 %indvars.iv to i32, !dbg !100
  store i32 %18, i32* %17, align 4, !dbg !100, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !98
  %19 = trunc i64 %indvars.iv.next to i32, !dbg !98
  %20 = icmp slt i32 %19, %1, !dbg !98
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !98, !llvm.loop !104

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !106), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !109), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !110), !dbg !111
  %21 = sitofp i32 %size to double, !dbg !112
  %22 = load i64* @next, align 8, !dbg !113, !tbaa !66
  %23 = mul i64 %22, 1103515245, !dbg !113
  %24 = add i64 %23, 12345, !dbg !113
  store i64 %24, i64* @next, align 8, !dbg !113, !tbaa !66
  %25 = lshr i64 %24, 16, !dbg !114
  %26 = trunc i64 %25 to i32, !dbg !114
  %27 = urem i32 %26, 32767, !dbg !114
  %28 = add i32 %27, 1, !dbg !114
  %29 = sitofp i32 %28 to double, !dbg !112
  %30 = fmul double %29, 0x3F00000000000000, !dbg !112
  %31 = fmul double %21, %30, !dbg !112
  %32 = fptosi double %31 to i32, !dbg !112
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !115), !dbg !112
  %33 = icmp eq i32 %32, %size, !dbg !116
  %34 = add nsw i32 %32, 1, !dbg !116
  %35 = sext i1 %33 to i32, !dbg !116
  %36 = add nsw i32 %34, %35, !dbg !116
  store i32 %36, i32* %5, align 4, !dbg !107, !tbaa !89
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !117), !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !120), !dbg !119
  %37 = icmp eq i32 %size, 0, !dbg !121
  br i1 %37, label %shuffle.exit, label %.lr.ph.i, !dbg !121

.lr.ph.i:                                         ; preds = %._crit_edge
  %38 = sext i32 %size to i64, !dbg !121
  br label %39, !dbg !121

; <label>:39                                      ; preds = %39, %.lr.ph.i
  %40 = phi i64 [ %24, %.lr.ph.i ], [ %44, %39 ], !dbg !122
  %i.01.i = phi i64 [ %38, %.lr.ph.i ], [ %61, %39 ]
  %41 = add i64 %i.01.i, 1, !dbg !122
  %42 = uitofp i64 %41 to double, !dbg !122
  %43 = mul i64 %40, 1103515245, !dbg !123
  %44 = add i64 %43, 12345, !dbg !123
  %45 = lshr i64 %44, 16, !dbg !124
  %46 = trunc i64 %45 to i32, !dbg !124
  %47 = urem i32 %46, 32767, !dbg !124
  %48 = add i32 %47, 1, !dbg !124
  %49 = sitofp i32 %48 to double, !dbg !122
  %50 = fmul double %49, 0x3F00000000000000, !dbg !122
  %51 = fmul double %42, %50, !dbg !122
  %52 = fptosi double %51 to i32, !dbg !122
  %53 = sext i32 %52 to i64, !dbg !122
  tail call void @llvm.dbg.value(metadata !{i64 %53}, i64 0, metadata !125), !dbg !122
  %54 = icmp eq i64 %53, %41, !dbg !126
  %55 = sext i1 %54 to i64, !dbg !126
  %56 = add i64 %55, %53, !dbg !126
  tail call void @llvm.dbg.value(metadata !{i64 %56}, i64 0, metadata !127), !dbg !126
  %57 = getelementptr inbounds i32* %5, i64 %i.01.i, !dbg !128
  %58 = load i32* %57, align 4, !dbg !128, !tbaa !89
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !129), !dbg !128
  %59 = getelementptr inbounds i32* %5, i64 %56, !dbg !130
  %60 = load i32* %59, align 4, !dbg !130, !tbaa !89
  store i32 %60, i32* %57, align 4, !dbg !130, !tbaa !89
  store i32 %58, i32* %59, align 4, !dbg !131, !tbaa !89
  %61 = add i64 %i.01.i, -1, !dbg !121
  tail call void @llvm.dbg.value(metadata !{i64 %61}, i64 0, metadata !132), !dbg !121
  %62 = icmp eq i64 %61, 0, !dbg !121
  br i1 %62, label %._crit_edge.i, label %39, !dbg !121

._crit_edge.i:                                    ; preds = %39
  store i64 %44, i64* @next, align 8, !dbg !123, !tbaa !66
  br label %shuffle.exit, !dbg !121

shuffle.exit:                                     ; preds = %._crit_edge, %._crit_edge.i
  ret i32* %5, !dbg !133
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readonly uwtable
define i32 @findDuplicate(i32* nocapture readonly %data, i32 %len) #2 {
  tail call void @llvm.dbg.value(metadata !{i32* %data}, i64 0, metadata !49), !dbg !134
  tail call void @llvm.dbg.value(metadata !{i32 %len}, i64 0, metadata !50), !dbg !134
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !52), !dbg !135
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !51), !dbg !136
  %1 = icmp sgt i32 %len, 0, !dbg !136
  br i1 %1, label %.lr.ph.preheader, label %._crit_edge, !dbg !136

.lr.ph.preheader:                                 ; preds = %0
  %2 = add i32 %len, -1, !dbg !136
  %3 = zext i32 %2 to i64
  %4 = add i64 %3, 1, !dbg !136
  %end.idx = add i64 %3, 1, !dbg !136
  %n.vec = and i64 %4, 8589934584, !dbg !136
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !136
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph.preheader ], !dbg !136
  %vec.phi = phi <4 x i32> [ %15, %vector.body ], [ zeroinitializer, %.lr.ph.preheader ]
  %vec.phi4 = phi <4 x i32> [ %16, %vector.body ], [ zeroinitializer, %.lr.ph.preheader ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %5 = add <4 x i64> %broadcast.splat, <i64 1, i64 2, i64 3, i64 4>, !dbg !136
  %6 = add <4 x i64> %broadcast.splat, <i64 5, i64 6, i64 7, i64 8>, !dbg !136
  %7 = trunc <4 x i64> %5 to <4 x i32>, !dbg !138
  %8 = trunc <4 x i64> %6 to <4 x i32>, !dbg !138
  %9 = xor <4 x i32> %vec.phi, %7, !dbg !138
  %10 = xor <4 x i32> %vec.phi4, %8, !dbg !138
  %11 = getelementptr inbounds i32* %data, i64 %index, !dbg !138
  %12 = bitcast i32* %11 to <4 x i32>*, !dbg !138
  %wide.load = load <4 x i32>* %12, align 4, !dbg !138
  %.sum12 = or i64 %index, 4, !dbg !138
  %13 = getelementptr i32* %data, i64 %.sum12, !dbg !138
  %14 = bitcast i32* %13 to <4 x i32>*, !dbg !138
  %wide.load5 = load <4 x i32>* %14, align 4, !dbg !138
  %15 = xor <4 x i32> %9, %wide.load, !dbg !138
  %16 = xor <4 x i32> %10, %wide.load5, !dbg !138
  %index.next = add i64 %index, 8, !dbg !136
  %17 = icmp eq i64 %index.next, %n.vec, !dbg !136
  br i1 %17, label %middle.block, label %vector.body, !dbg !136, !llvm.loop !139

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ zeroinitializer, %.lr.ph.preheader ], [ %15, %vector.body ], !dbg !138
  %rdx.vec.exit.phi8 = phi <4 x i32> [ zeroinitializer, %.lr.ph.preheader ], [ %16, %vector.body ], !dbg !138
  %bin.rdx = xor <4 x i32> %rdx.vec.exit.phi8, %rdx.vec.exit.phi, !dbg !138
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !138
  %bin.rdx9 = xor <4 x i32> %bin.rdx, %rdx.shuf, !dbg !138
  %rdx.shuf10 = shufflevector <4 x i32> %bin.rdx9, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !138
  %bin.rdx11 = xor <4 x i32> %bin.rdx9, %rdx.shuf10, !dbg !138
  %18 = extractelement <4 x i32> %bin.rdx11, i32 0, !dbg !138
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %result.02 = phi i32 [ %23, %.lr.ph ], [ %18, %middle.block ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !136
  %19 = trunc i64 %indvars.iv.next to i32, !dbg !138
  %20 = xor i32 %result.02, %19, !dbg !138
  %21 = getelementptr inbounds i32* %data, i64 %indvars.iv, !dbg !138
  %22 = load i32* %21, align 4, !dbg !138, !tbaa !89
  %23 = xor i32 %20, %22, !dbg !138
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !52), !dbg !138
  %exitcond = icmp eq i32 %19, %len, !dbg !136
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !136, !llvm.loop !140

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  %result.0.lcssa = phi i32 [ 0, %0 ], [ %23, %.lr.ph ], [ %18, %middle.block ]
  %24 = xor i32 %result.0.lcssa, %len, !dbg !141
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !52), !dbg !141
  ret i32 %24, !dbg !142
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !143), !dbg !145
  store i64 1, i64* @next, align 8, !dbg !146, !tbaa !66
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !55), !dbg !147
  %1 = tail call i32* @createRandomArray(i32 500000), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !151
  br label %vector.ph, !dbg !151

vector.ph:                                        ; preds = %0, %findDuplicate.exit
  %j.01 = phi i32 [ 0, %0 ], [ %21, %findDuplicate.exit ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !153
  %vec.phi = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %12, %vector.body ]
  %vec.phi10 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %13, %vector.body ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %2 = add <2 x i64> %broadcast.splat, <i64 1, i64 2>, !dbg !153
  %3 = add <2 x i64> %broadcast.splat, <i64 3, i64 4>, !dbg !153
  %4 = trunc <2 x i64> %2 to <2 x i32>, !dbg !155
  %5 = trunc <2 x i64> %3 to <2 x i32>, !dbg !155
  %6 = xor <2 x i32> %4, %vec.phi, !dbg !155
  %7 = xor <2 x i32> %5, %vec.phi10, !dbg !155
  %8 = getelementptr inbounds i32* %1, i64 %index, !dbg !155
  %9 = bitcast i32* %8 to <2 x i32>*, !dbg !155
  %wide.load = load <2 x i32>* %9, align 4, !dbg !155
  %.sum102 = or i64 %index, 2, !dbg !155
  %10 = getelementptr i32* %1, i64 %.sum102, !dbg !155
  %11 = bitcast i32* %10 to <2 x i32>*, !dbg !155
  %wide.load11 = load <2 x i32>* %11, align 4, !dbg !155
  %12 = xor <2 x i32> %6, %wide.load, !dbg !155
  %13 = xor <2 x i32> %7, %wide.load11, !dbg !155
  %index.next = add i64 %index, 4, !dbg !153
  %14 = icmp eq i64 %index.next, 500000, !dbg !153
  br i1 %14, label %middle.block, label %vector.body, !dbg !153, !llvm.loop !156

middle.block:                                     ; preds = %vector.body
  %bin.rdx = xor <2 x i32> %13, %12, !dbg !155
  %rdx.shuf = shufflevector <2 x i32> %bin.rdx, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !155
  %bin.rdx13 = xor <2 x i32> %bin.rdx, %rdx.shuf, !dbg !155
  %15 = extractelement <2 x i32> %bin.rdx13, i32 0, !dbg !155
  br label %.lr.ph.i, !dbg !153

.lr.ph.i:                                         ; preds = %middle.block, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 500000, %middle.block ]
  %result.02.i = phi i32 [ %20, %.lr.ph.i ], [ %15, %middle.block ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !153
  %16 = trunc i64 %indvars.iv.next.i to i32, !dbg !155
  %17 = xor i32 %16, %result.02.i, !dbg !155
  %18 = getelementptr inbounds i32* %1, i64 %indvars.iv.i, !dbg !155
  %19 = load i32* %18, align 4, !dbg !155, !tbaa !89
  %20 = xor i32 %17, %19, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !157), !dbg !155
  %exitcond = icmp eq i64 %indvars.iv.next.i, 500001, !dbg !153
  br i1 %exitcond, label %findDuplicate.exit, label %.lr.ph.i, !dbg !153, !llvm.loop !158

findDuplicate.exit:                               ; preds = %.lr.ph.i
  %21 = add nsw i32 %j.01, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !56), !dbg !151
  %exitcond3 = icmp eq i32 %21, 200, !dbg !151
  br i1 %exitcond3, label %22, label %vector.ph, !dbg !151

; <label>:22                                      ; preds = %findDuplicate.exit
  %23 = xor i32 %20, 500001, !dbg !159
  %24 = bitcast i32* %1 to i8*, !dbg !160
  tail call void @free(i8* %24) #4, !dbg !160
  %25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %23) #4, !dbg !161
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !55), !dbg !147
  %26 = tail call i32* @createRandomArray(i32 500000), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !151
  br label %vector.ph14, !dbg !151

vector.ph14:                                      ; preds = %22, %findDuplicate.exit.1
  %j.01.1 = phi i32 [ 0, %22 ], [ %46, %findDuplicate.exit.1 ]
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15, %vector.ph14
  %index18 = phi i64 [ 0, %vector.ph14 ], [ %index.next22, %vector.body15 ], !dbg !153
  %vec.phi27 = phi <2 x i32> [ zeroinitializer, %vector.ph14 ], [ %37, %vector.body15 ]
  %vec.phi28 = phi <2 x i32> [ zeroinitializer, %vector.ph14 ], [ %38, %vector.body15 ]
  %broadcast.splatinsert23 = insertelement <2 x i64> undef, i64 %index18, i32 0
  %broadcast.splat24 = shufflevector <2 x i64> %broadcast.splatinsert23, <2 x i64> undef, <2 x i32> zeroinitializer
  %27 = add <2 x i64> %broadcast.splat24, <i64 1, i64 2>, !dbg !153
  %28 = add <2 x i64> %broadcast.splat24, <i64 3, i64 4>, !dbg !153
  %29 = trunc <2 x i64> %27 to <2 x i32>, !dbg !155
  %30 = trunc <2 x i64> %28 to <2 x i32>, !dbg !155
  %31 = xor <2 x i32> %29, %vec.phi27, !dbg !155
  %32 = xor <2 x i32> %30, %vec.phi28, !dbg !155
  %33 = getelementptr inbounds i32* %26, i64 %index18, !dbg !155
  %34 = bitcast i32* %33 to <2 x i32>*, !dbg !155
  %wide.load29 = load <2 x i32>* %34, align 4, !dbg !155
  %.sum103 = or i64 %index18, 2, !dbg !155
  %35 = getelementptr i32* %26, i64 %.sum103, !dbg !155
  %36 = bitcast i32* %35 to <2 x i32>*, !dbg !155
  %wide.load30 = load <2 x i32>* %36, align 4, !dbg !155
  %37 = xor <2 x i32> %31, %wide.load29, !dbg !155
  %38 = xor <2 x i32> %32, %wide.load30, !dbg !155
  %index.next22 = add i64 %index18, 4, !dbg !153
  %39 = icmp eq i64 %index.next22, 500000, !dbg !153
  br i1 %39, label %middle.block16, label %vector.body15, !dbg !153, !llvm.loop !162

middle.block16:                                   ; preds = %vector.body15
  %bin.rdx33 = xor <2 x i32> %38, %37, !dbg !155
  %rdx.shuf34 = shufflevector <2 x i32> %bin.rdx33, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !155
  %bin.rdx35 = xor <2 x i32> %bin.rdx33, %rdx.shuf34, !dbg !155
  %40 = extractelement <2 x i32> %bin.rdx35, i32 0, !dbg !155
  br label %.lr.ph.i.1, !dbg !153

.lr.ph.i.1:                                       ; preds = %.lr.ph.i.1, %middle.block16
  %indvars.iv.i.1 = phi i64 [ %indvars.iv.next.i.1, %.lr.ph.i.1 ], [ 500000, %middle.block16 ]
  %result.02.i.1 = phi i32 [ %45, %.lr.ph.i.1 ], [ %40, %middle.block16 ]
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i.1, 1, !dbg !153
  %41 = trunc i64 %indvars.iv.next.i.1 to i32, !dbg !155
  %42 = xor i32 %41, %result.02.i.1, !dbg !155
  %43 = getelementptr inbounds i32* %26, i64 %indvars.iv.i.1, !dbg !155
  %44 = load i32* %43, align 4, !dbg !155, !tbaa !89
  %45 = xor i32 %42, %44, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !157), !dbg !155
  %exitcond.1 = icmp eq i64 %indvars.iv.next.i.1, 500001, !dbg !153
  br i1 %exitcond.1, label %findDuplicate.exit.1, label %.lr.ph.i.1, !dbg !153, !llvm.loop !163

findDuplicate.exit.1:                             ; preds = %.lr.ph.i.1
  %46 = add nsw i32 %j.01.1, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !56), !dbg !151
  %exitcond3.1 = icmp eq i32 %46, 200, !dbg !151
  br i1 %exitcond3.1, label %47, label %vector.ph14, !dbg !151

; <label>:47                                      ; preds = %findDuplicate.exit.1
  %48 = xor i32 %45, 500001, !dbg !159
  %49 = bitcast i32* %26 to i8*, !dbg !160
  tail call void @free(i8* %49) #4, !dbg !160
  %50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %48) #4, !dbg !161
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !55), !dbg !147
  %51 = tail call i32* @createRandomArray(i32 500000), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !151
  br label %vector.ph36, !dbg !151

vector.ph36:                                      ; preds = %47, %findDuplicate.exit.2
  %j.01.2 = phi i32 [ 0, %47 ], [ %71, %findDuplicate.exit.2 ]
  br label %vector.body37

vector.body37:                                    ; preds = %vector.body37, %vector.ph36
  %index40 = phi i64 [ 0, %vector.ph36 ], [ %index.next44, %vector.body37 ], !dbg !153
  %vec.phi49 = phi <2 x i32> [ zeroinitializer, %vector.ph36 ], [ %62, %vector.body37 ]
  %vec.phi50 = phi <2 x i32> [ zeroinitializer, %vector.ph36 ], [ %63, %vector.body37 ]
  %broadcast.splatinsert45 = insertelement <2 x i64> undef, i64 %index40, i32 0
  %broadcast.splat46 = shufflevector <2 x i64> %broadcast.splatinsert45, <2 x i64> undef, <2 x i32> zeroinitializer
  %52 = add <2 x i64> %broadcast.splat46, <i64 1, i64 2>, !dbg !153
  %53 = add <2 x i64> %broadcast.splat46, <i64 3, i64 4>, !dbg !153
  %54 = trunc <2 x i64> %52 to <2 x i32>, !dbg !155
  %55 = trunc <2 x i64> %53 to <2 x i32>, !dbg !155
  %56 = xor <2 x i32> %54, %vec.phi49, !dbg !155
  %57 = xor <2 x i32> %55, %vec.phi50, !dbg !155
  %58 = getelementptr inbounds i32* %51, i64 %index40, !dbg !155
  %59 = bitcast i32* %58 to <2 x i32>*, !dbg !155
  %wide.load51 = load <2 x i32>* %59, align 4, !dbg !155
  %.sum104 = or i64 %index40, 2, !dbg !155
  %60 = getelementptr i32* %51, i64 %.sum104, !dbg !155
  %61 = bitcast i32* %60 to <2 x i32>*, !dbg !155
  %wide.load52 = load <2 x i32>* %61, align 4, !dbg !155
  %62 = xor <2 x i32> %56, %wide.load51, !dbg !155
  %63 = xor <2 x i32> %57, %wide.load52, !dbg !155
  %index.next44 = add i64 %index40, 4, !dbg !153
  %64 = icmp eq i64 %index.next44, 500000, !dbg !153
  br i1 %64, label %middle.block38, label %vector.body37, !dbg !153, !llvm.loop !164

middle.block38:                                   ; preds = %vector.body37
  %bin.rdx55 = xor <2 x i32> %63, %62, !dbg !155
  %rdx.shuf56 = shufflevector <2 x i32> %bin.rdx55, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !155
  %bin.rdx57 = xor <2 x i32> %bin.rdx55, %rdx.shuf56, !dbg !155
  %65 = extractelement <2 x i32> %bin.rdx57, i32 0, !dbg !155
  br label %.lr.ph.i.2, !dbg !153

.lr.ph.i.2:                                       ; preds = %.lr.ph.i.2, %middle.block38
  %indvars.iv.i.2 = phi i64 [ %indvars.iv.next.i.2, %.lr.ph.i.2 ], [ 500000, %middle.block38 ]
  %result.02.i.2 = phi i32 [ %70, %.lr.ph.i.2 ], [ %65, %middle.block38 ]
  %indvars.iv.next.i.2 = add nuw nsw i64 %indvars.iv.i.2, 1, !dbg !153
  %66 = trunc i64 %indvars.iv.next.i.2 to i32, !dbg !155
  %67 = xor i32 %66, %result.02.i.2, !dbg !155
  %68 = getelementptr inbounds i32* %51, i64 %indvars.iv.i.2, !dbg !155
  %69 = load i32* %68, align 4, !dbg !155, !tbaa !89
  %70 = xor i32 %67, %69, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !157), !dbg !155
  %exitcond.2 = icmp eq i64 %indvars.iv.next.i.2, 500001, !dbg !153
  br i1 %exitcond.2, label %findDuplicate.exit.2, label %.lr.ph.i.2, !dbg !153, !llvm.loop !165

findDuplicate.exit.2:                             ; preds = %.lr.ph.i.2
  %71 = add nsw i32 %j.01.2, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !56), !dbg !151
  %exitcond3.2 = icmp eq i32 %71, 200, !dbg !151
  br i1 %exitcond3.2, label %72, label %vector.ph36, !dbg !151

; <label>:72                                      ; preds = %findDuplicate.exit.2
  %73 = xor i32 %70, 500001, !dbg !159
  %74 = bitcast i32* %51 to i8*, !dbg !160
  tail call void @free(i8* %74) #4, !dbg !160
  %75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %73) #4, !dbg !161
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !55), !dbg !147
  %76 = tail call i32* @createRandomArray(i32 500000), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !151
  br label %vector.ph58, !dbg !151

vector.ph58:                                      ; preds = %72, %findDuplicate.exit.3
  %j.01.3 = phi i32 [ 0, %72 ], [ %96, %findDuplicate.exit.3 ]
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59, %vector.ph58
  %index62 = phi i64 [ 0, %vector.ph58 ], [ %index.next66, %vector.body59 ], !dbg !153
  %vec.phi71 = phi <2 x i32> [ zeroinitializer, %vector.ph58 ], [ %87, %vector.body59 ]
  %vec.phi72 = phi <2 x i32> [ zeroinitializer, %vector.ph58 ], [ %88, %vector.body59 ]
  %broadcast.splatinsert67 = insertelement <2 x i64> undef, i64 %index62, i32 0
  %broadcast.splat68 = shufflevector <2 x i64> %broadcast.splatinsert67, <2 x i64> undef, <2 x i32> zeroinitializer
  %77 = add <2 x i64> %broadcast.splat68, <i64 1, i64 2>, !dbg !153
  %78 = add <2 x i64> %broadcast.splat68, <i64 3, i64 4>, !dbg !153
  %79 = trunc <2 x i64> %77 to <2 x i32>, !dbg !155
  %80 = trunc <2 x i64> %78 to <2 x i32>, !dbg !155
  %81 = xor <2 x i32> %79, %vec.phi71, !dbg !155
  %82 = xor <2 x i32> %80, %vec.phi72, !dbg !155
  %83 = getelementptr inbounds i32* %76, i64 %index62, !dbg !155
  %84 = bitcast i32* %83 to <2 x i32>*, !dbg !155
  %wide.load73 = load <2 x i32>* %84, align 4, !dbg !155
  %.sum105 = or i64 %index62, 2, !dbg !155
  %85 = getelementptr i32* %76, i64 %.sum105, !dbg !155
  %86 = bitcast i32* %85 to <2 x i32>*, !dbg !155
  %wide.load74 = load <2 x i32>* %86, align 4, !dbg !155
  %87 = xor <2 x i32> %81, %wide.load73, !dbg !155
  %88 = xor <2 x i32> %82, %wide.load74, !dbg !155
  %index.next66 = add i64 %index62, 4, !dbg !153
  %89 = icmp eq i64 %index.next66, 500000, !dbg !153
  br i1 %89, label %middle.block60, label %vector.body59, !dbg !153, !llvm.loop !166

middle.block60:                                   ; preds = %vector.body59
  %bin.rdx77 = xor <2 x i32> %88, %87, !dbg !155
  %rdx.shuf78 = shufflevector <2 x i32> %bin.rdx77, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !155
  %bin.rdx79 = xor <2 x i32> %bin.rdx77, %rdx.shuf78, !dbg !155
  %90 = extractelement <2 x i32> %bin.rdx79, i32 0, !dbg !155
  br label %.lr.ph.i.3, !dbg !153

.lr.ph.i.3:                                       ; preds = %.lr.ph.i.3, %middle.block60
  %indvars.iv.i.3 = phi i64 [ %indvars.iv.next.i.3, %.lr.ph.i.3 ], [ 500000, %middle.block60 ]
  %result.02.i.3 = phi i32 [ %95, %.lr.ph.i.3 ], [ %90, %middle.block60 ]
  %indvars.iv.next.i.3 = add nuw nsw i64 %indvars.iv.i.3, 1, !dbg !153
  %91 = trunc i64 %indvars.iv.next.i.3 to i32, !dbg !155
  %92 = xor i32 %91, %result.02.i.3, !dbg !155
  %93 = getelementptr inbounds i32* %76, i64 %indvars.iv.i.3, !dbg !155
  %94 = load i32* %93, align 4, !dbg !155, !tbaa !89
  %95 = xor i32 %92, %94, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !157), !dbg !155
  %exitcond.3 = icmp eq i64 %indvars.iv.next.i.3, 500001, !dbg !153
  br i1 %exitcond.3, label %findDuplicate.exit.3, label %.lr.ph.i.3, !dbg !153, !llvm.loop !167

findDuplicate.exit.3:                             ; preds = %.lr.ph.i.3
  %96 = add nsw i32 %j.01.3, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !56), !dbg !151
  %exitcond3.3 = icmp eq i32 %96, 200, !dbg !151
  br i1 %exitcond3.3, label %97, label %vector.ph58, !dbg !151

; <label>:97                                      ; preds = %findDuplicate.exit.3
  %98 = xor i32 %95, 500001, !dbg !159
  %99 = bitcast i32* %76 to i8*, !dbg !160
  tail call void @free(i8* %99) #4, !dbg !160
  %100 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %98) #4, !dbg !161
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !55), !dbg !147
  %101 = tail call i32* @createRandomArray(i32 500000), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %1}, i64 0, metadata !58), !dbg !149
  tail call void @llvm.dbg.value(metadata !97, i64 0, metadata !56), !dbg !151
  br label %vector.ph80, !dbg !151

vector.ph80:                                      ; preds = %97, %findDuplicate.exit.4
  %j.01.4 = phi i32 [ 0, %97 ], [ %121, %findDuplicate.exit.4 ]
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %vector.ph80
  %index84 = phi i64 [ 0, %vector.ph80 ], [ %index.next88, %vector.body81 ], !dbg !153
  %vec.phi93 = phi <2 x i32> [ zeroinitializer, %vector.ph80 ], [ %112, %vector.body81 ]
  %vec.phi94 = phi <2 x i32> [ zeroinitializer, %vector.ph80 ], [ %113, %vector.body81 ]
  %broadcast.splatinsert89 = insertelement <2 x i64> undef, i64 %index84, i32 0
  %broadcast.splat90 = shufflevector <2 x i64> %broadcast.splatinsert89, <2 x i64> undef, <2 x i32> zeroinitializer
  %102 = add <2 x i64> %broadcast.splat90, <i64 1, i64 2>, !dbg !153
  %103 = add <2 x i64> %broadcast.splat90, <i64 3, i64 4>, !dbg !153
  %104 = trunc <2 x i64> %102 to <2 x i32>, !dbg !155
  %105 = trunc <2 x i64> %103 to <2 x i32>, !dbg !155
  %106 = xor <2 x i32> %104, %vec.phi93, !dbg !155
  %107 = xor <2 x i32> %105, %vec.phi94, !dbg !155
  %108 = getelementptr inbounds i32* %101, i64 %index84, !dbg !155
  %109 = bitcast i32* %108 to <2 x i32>*, !dbg !155
  %wide.load95 = load <2 x i32>* %109, align 4, !dbg !155
  %.sum106 = or i64 %index84, 2, !dbg !155
  %110 = getelementptr i32* %101, i64 %.sum106, !dbg !155
  %111 = bitcast i32* %110 to <2 x i32>*, !dbg !155
  %wide.load96 = load <2 x i32>* %111, align 4, !dbg !155
  %112 = xor <2 x i32> %106, %wide.load95, !dbg !155
  %113 = xor <2 x i32> %107, %wide.load96, !dbg !155
  %index.next88 = add i64 %index84, 4, !dbg !153
  %114 = icmp eq i64 %index.next88, 500000, !dbg !153
  br i1 %114, label %middle.block82, label %vector.body81, !dbg !153, !llvm.loop !168

middle.block82:                                   ; preds = %vector.body81
  %bin.rdx99 = xor <2 x i32> %113, %112, !dbg !155
  %rdx.shuf100 = shufflevector <2 x i32> %bin.rdx99, <2 x i32> undef, <2 x i32> <i32 1, i32 undef>, !dbg !155
  %bin.rdx101 = xor <2 x i32> %bin.rdx99, %rdx.shuf100, !dbg !155
  %115 = extractelement <2 x i32> %bin.rdx101, i32 0, !dbg !155
  br label %.lr.ph.i.4, !dbg !153

.lr.ph.i.4:                                       ; preds = %.lr.ph.i.4, %middle.block82
  %indvars.iv.i.4 = phi i64 [ %indvars.iv.next.i.4, %.lr.ph.i.4 ], [ 500000, %middle.block82 ]
  %result.02.i.4 = phi i32 [ %120, %.lr.ph.i.4 ], [ %115, %middle.block82 ]
  %indvars.iv.next.i.4 = add nuw nsw i64 %indvars.iv.i.4, 1, !dbg !153
  %116 = trunc i64 %indvars.iv.next.i.4 to i32, !dbg !155
  %117 = xor i32 %116, %result.02.i.4, !dbg !155
  %118 = getelementptr inbounds i32* %101, i64 %indvars.iv.i.4, !dbg !155
  %119 = load i32* %118, align 4, !dbg !155, !tbaa !89
  %120 = xor i32 %117, %119, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !157), !dbg !155
  %exitcond.4 = icmp eq i64 %indvars.iv.next.i.4, 500001, !dbg !153
  br i1 %exitcond.4, label %findDuplicate.exit.4, label %.lr.ph.i.4, !dbg !153, !llvm.loop !169

findDuplicate.exit.4:                             ; preds = %.lr.ph.i.4
  %121 = add nsw i32 %j.01.4, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !56), !dbg !151
  %exitcond3.4 = icmp eq i32 %121, 200, !dbg !151
  br i1 %exitcond3.4, label %122, label %vector.ph80, !dbg !151

; <label>:122                                     ; preds = %findDuplicate.exit.4
  %123 = xor i32 %120, 500001, !dbg !159
  %124 = bitcast i32* %101 to i8*, !dbg !160
  tail call void @free(i8* %124) #4, !dbg !160
  %125 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %123) #4, !dbg !161
  tail call void @llvm.dbg.value(metadata !105, i64 0, metadata !55), !dbg !147
  ret i32 0, !dbg !170
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!62, !63}
!llvm.ident = !{!64}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !59, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c] [DW_LANG_C99]
!1 = metadata !{metadata !"puzzle.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !15, metadata !23, metadata !37, metadata !45, metadata !53}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rand", metadata !"rand", metadata !"", i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @rand, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ] [line 15] [def] [rand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"srand", metadata !"srand", metadata !"", i32 20, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @srand, null, null, metadata !13, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [srand]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12}
!12 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786689, metadata !9, metadata !"seed", metadata !5, i32 16777236, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"randInt", metadata !"randInt", metadata !"", i32 25, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @randInt, null, null, metadata !18, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [randInt]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !8, metadata !8, metadata !8}
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22}
!19 = metadata !{i32 786689, metadata !15, metadata !"min", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min] [line 25]
!20 = metadata !{i32 786689, metadata !15, metadata !"max", metadata !5, i32 33554457, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 25]
!21 = metadata !{i32 786688, metadata !15, metadata !"k", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 26]
!22 = metadata !{i32 786688, metadata !15, metadata !"n", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 26]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"shuffle", metadata !"shuffle", metadata !"", i32 32, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32)* @shuffle, null, null, metadata !27, i32 32} ; [ DW_TAG_subprogram ] [line 32] [def] [shuffle]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26, metadata !8}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!27 = metadata !{metadata !28, metadata !29, metadata !30, metadata !34, metadata !35, metadata !36}
!28 = metadata !{i32 786689, metadata !23, metadata !"items", metadata !5, i32 16777248, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [items] [line 32]
!29 = metadata !{i32 786689, metadata !23, metadata !"len", metadata !5, i32 33554464, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!30 = metadata !{i32 786688, metadata !23, metadata !"j", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 33]
!31 = metadata !{i32 786454, metadata !32, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!32 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!33 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!34 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 33]
!35 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 33, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 33]
!36 = metadata !{i32 786688, metadata !23, metadata !"aux", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aux] [line 34]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"createRandomArray", metadata !"createRandomArray", metadata !"", i32 46, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32* (i32)* @createRandomArray, null, null, metadata !40, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [createRandomArray]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !26, metadata !8}
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44}
!41 = metadata !{i32 786689, metadata !37, metadata !"size", metadata !5, i32 16777262, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!42 = metadata !{i32 786688, metadata !37, metadata !"i", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 47]
!43 = metadata !{i32 786688, metadata !37, metadata !"len", metadata !5, i32 47, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 47]
!44 = metadata !{i32 786688, metadata !37, metadata !"result", metadata !5, i32 48, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 48]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"findDuplicate", metadata !"findDuplicate", metadata !"", i32 59, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @findDuplicate, null, null, metadata !48, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [findDuplicate]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !8, metadata !26, metadata !8}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52}
!49 = metadata !{i32 786689, metadata !45, metadata !"data", metadata !5, i32 16777275, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 59]
!50 = metadata !{i32 786689, metadata !45, metadata !"len", metadata !5, i32 33554491, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 59]
!51 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 60]
!52 = metadata !{i32 786688, metadata !45, metadata !"result", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 61]
!53 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 69, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !54, i32 69} ; [ DW_TAG_subprogram ] [line 69] [def] [main]
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58}
!55 = metadata !{i32 786688, metadata !53, metadata !"i", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 70]
!56 = metadata !{i32 786688, metadata !53, metadata !"j", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 70]
!57 = metadata !{i32 786688, metadata !53, metadata !"duplicate", metadata !5, i32 70, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [duplicate] [line 70]
!58 = metadata !{i32 786688, metadata !53, metadata !"rndArr", metadata !5, i32 71, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rndArr] [line 71]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786484, i32 0, null, metadata !"next", metadata !"next", metadata !"", metadata !5, i32 13, metadata !61, i32 1, i32 1, i64* @next, null} ; [ DW_TAG_variable ] [next] [line 13] [local] [def]
!61 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!62 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!63 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!64 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!65 = metadata !{i32 16, i32 0, metadata !4, null}
!66 = metadata !{metadata !67, metadata !67, i64 0}
!67 = metadata !{metadata !"long long", metadata !68, i64 0}
!68 = metadata !{metadata !"omnipotent char", metadata !69, i64 0}
!69 = metadata !{metadata !"Simple C/C++ TBAA"}
!70 = metadata !{i32 17, i32 0, metadata !4, null}
!71 = metadata !{i32 20, i32 0, metadata !9, null}
!72 = metadata !{i32 21, i32 0, metadata !9, null}
!73 = metadata !{i32 22, i32 0, metadata !9, null}
!74 = metadata !{i32 25, i32 0, metadata !15, null}
!75 = metadata !{i32 27, i32 0, metadata !15, null}
!76 = metadata !{i32 28, i32 0, metadata !15, null}
!77 = metadata !{i32 16, i32 0, metadata !4, metadata !76}
!78 = metadata !{i32 17, i32 0, metadata !4, metadata !76}
!79 = metadata !{i32 29, i32 0, metadata !15, null}
!80 = metadata !{i32 32, i32 0, metadata !23, null}
!81 = metadata !{i32 36, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !23, i32 36, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!83 = metadata !{i32 16, i32 0, metadata !4, metadata !84}
!84 = metadata !{i32 37, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 36, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!86 = metadata !{i32 17, i32 0, metadata !4, metadata !84}
!87 = metadata !{i32 38, i32 0, metadata !85, null}
!88 = metadata !{i32 40, i32 0, metadata !85, null}
!89 = metadata !{metadata !90, metadata !90, i64 0}
!90 = metadata !{metadata !"int", metadata !68, i64 0}
!91 = metadata !{i32 41, i32 0, metadata !85, null}
!92 = metadata !{i32 42, i32 0, metadata !85, null}
!93 = metadata !{i32 44, i32 0, metadata !23, null}
!94 = metadata !{i32 46, i32 0, metadata !37, null}
!95 = metadata !{i32 50, i32 0, metadata !37, null}
!96 = metadata !{i32 51, i32 0, metadata !37, null}
!97 = metadata !{i32 0}
!98 = metadata !{i32 52, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !37, i32 52, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!100 = metadata !{i32 53, i32 0, metadata !99, null}
!101 = metadata !{metadata !101, metadata !102, metadata !103}
!102 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!103 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!104 = metadata !{metadata !104, metadata !102, metadata !103}
!105 = metadata !{i32 1}
!106 = metadata !{i32 786689, metadata !15, metadata !"min", metadata !5, i32 16777241, metadata !8, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [min] [line 25]
!107 = metadata !{i32 54, i32 0, metadata !37, null}
!108 = metadata !{i32 25, i32 0, metadata !15, metadata !107}
!109 = metadata !{i32 786689, metadata !15, metadata !"max", metadata !5, i32 33554457, metadata !8, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [max] [line 25]
!110 = metadata !{i32 786688, metadata !15, metadata !"n", metadata !5, i32 26, metadata !8, i32 0, metadata !107} ; [ DW_TAG_auto_variable ] [n] [line 26]
!111 = metadata !{i32 27, i32 0, metadata !15, metadata !107}
!112 = metadata !{i32 28, i32 0, metadata !15, metadata !107}
!113 = metadata !{i32 16, i32 0, metadata !4, metadata !112}
!114 = metadata !{i32 17, i32 0, metadata !4, metadata !112}
!115 = metadata !{i32 786688, metadata !15, metadata !"k", metadata !5, i32 26, metadata !8, i32 0, metadata !107} ; [ DW_TAG_auto_variable ] [k] [line 26]
!116 = metadata !{i32 29, i32 0, metadata !15, metadata !107}
!117 = metadata !{i32 786689, metadata !23, metadata !"items", metadata !5, i32 16777248, metadata !26, i32 0, metadata !118} ; [ DW_TAG_arg_variable ] [items] [line 32]
!118 = metadata !{i32 55, i32 0, metadata !37, null}
!119 = metadata !{i32 32, i32 0, metadata !23, metadata !118}
!120 = metadata !{i32 786689, metadata !23, metadata !"len", metadata !5, i32 33554464, metadata !8, i32 0, metadata !118} ; [ DW_TAG_arg_variable ] [len] [line 32]
!121 = metadata !{i32 36, i32 0, metadata !82, metadata !118}
!122 = metadata !{i32 37, i32 0, metadata !85, metadata !118}
!123 = metadata !{i32 16, i32 0, metadata !4, metadata !122}
!124 = metadata !{i32 17, i32 0, metadata !4, metadata !122}
!125 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !5, i32 33, metadata !31, i32 0, metadata !118} ; [ DW_TAG_auto_variable ] [k] [line 33]
!126 = metadata !{i32 38, i32 0, metadata !85, metadata !118}
!127 = metadata !{i32 786688, metadata !23, metadata !"j", metadata !5, i32 33, metadata !31, i32 0, metadata !118} ; [ DW_TAG_auto_variable ] [j] [line 33]
!128 = metadata !{i32 40, i32 0, metadata !85, metadata !118}
!129 = metadata !{i32 786688, metadata !23, metadata !"aux", metadata !5, i32 34, metadata !8, i32 0, metadata !118} ; [ DW_TAG_auto_variable ] [aux] [line 34]
!130 = metadata !{i32 41, i32 0, metadata !85, metadata !118}
!131 = metadata !{i32 42, i32 0, metadata !85, metadata !118}
!132 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 33, metadata !31, i32 0, metadata !118} ; [ DW_TAG_auto_variable ] [i] [line 33]
!133 = metadata !{i32 56, i32 0, metadata !37, null}
!134 = metadata !{i32 59, i32 0, metadata !45, null}
!135 = metadata !{i32 61, i32 0, metadata !45, null}
!136 = metadata !{i32 63, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !45, i32 63, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!138 = metadata !{i32 64, i32 0, metadata !137, null}
!139 = metadata !{metadata !139, metadata !102, metadata !103}
!140 = metadata !{metadata !140, metadata !102, metadata !103}
!141 = metadata !{i32 65, i32 0, metadata !45, null}
!142 = metadata !{i32 66, i32 0, metadata !45, null}
!143 = metadata !{i32 786689, metadata !9, metadata !"seed", metadata !5, i32 16777236, metadata !12, i32 0, metadata !144} ; [ DW_TAG_arg_variable ] [seed] [line 20]
!144 = metadata !{i32 73, i32 0, metadata !53, null}
!145 = metadata !{i32 20, i32 0, metadata !9, metadata !144}
!146 = metadata !{i32 21, i32 0, metadata !9, metadata !144}
!147 = metadata !{i32 75, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !53, i32 75, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!149 = metadata !{i32 76, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !148, i32 75, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!151 = metadata !{i32 77, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !150, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle.c]
!153 = metadata !{i32 63, i32 0, metadata !137, metadata !154}
!154 = metadata !{i32 78, i32 0, metadata !152, null}
!155 = metadata !{i32 64, i32 0, metadata !137, metadata !154}
!156 = metadata !{metadata !156, metadata !102, metadata !103}
!157 = metadata !{i32 786688, metadata !45, metadata !"result", metadata !5, i32 61, metadata !8, i32 0, metadata !154} ; [ DW_TAG_auto_variable ] [result] [line 61]
!158 = metadata !{metadata !158, metadata !102, metadata !103}
!159 = metadata !{i32 65, i32 0, metadata !45, metadata !154}
!160 = metadata !{i32 79, i32 0, metadata !150, null}
!161 = metadata !{i32 80, i32 0, metadata !150, null}
!162 = metadata !{metadata !162, metadata !102, metadata !103}
!163 = metadata !{metadata !163, metadata !102, metadata !103}
!164 = metadata !{metadata !164, metadata !102, metadata !103}
!165 = metadata !{metadata !165, metadata !102, metadata !103}
!166 = metadata !{metadata !166, metadata !102, metadata !103}
!167 = metadata !{metadata !167, metadata !102, metadata !103}
!168 = metadata !{metadata !168, metadata !102, metadata !103}
!169 = metadata !{metadata !169, metadata !102, metadata !103}
!170 = metadata !{i32 83, i32 0, metadata !53, null}
