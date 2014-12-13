; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !11), !dbg !68
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !12), !dbg !68
  %1 = add nsw i32 %j, %i, !dbg !68
  %2 = add nsw i32 %1, 1, !dbg !68
  %3 = mul nsw i32 %2, %1, !dbg !68
  %4 = sdiv i32 %3, 2, !dbg !68
  %5 = add i32 %i, 1, !dbg !68
  %6 = add i32 %5, %4, !dbg !68
  %7 = sitofp i32 %6 to double, !dbg !68
  %8 = fdiv double 1.000000e+00, %7, !dbg !68
  ret double %8, !dbg !68
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !20), !dbg !69
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !21), !dbg !69
  tail call void @llvm.dbg.value(metadata !{double* %Au}, i64 0, metadata !22), !dbg !69
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !23), !dbg !71
  %1 = icmp sgt i32 %N, 0, !dbg !71
  br i1 %1, label %.lr.ph, label %._crit_edge6, !dbg !71

.lr.ph:                                           ; preds = %0, %._crit_edge
  %indvars.iv7 = phi i64 [ %3, %._crit_edge ], [ 0, %0 ]
  %2 = getelementptr inbounds double* %Au, i64 %indvars.iv7, !dbg !73
  store double 0.000000e+00, double* %2, align 8, !dbg !73, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !24), !dbg !79
  %3 = add i64 %indvars.iv7, 1, !dbg !81
  br label %4, !dbg !79

; <label>:4                                       ; preds = %4, %.lr.ph
  %5 = phi double [ 0.000000e+00, %.lr.ph ], [ %20, %4 ], !dbg !81
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %4 ]
  %j.01 = phi i32 [ 0, %.lr.ph ], [ %21, %4 ]
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !83), !dbg !81
  tail call void @llvm.dbg.value(metadata !{i32 %j.01}, i64 0, metadata !84), !dbg !81
  %6 = add nsw i64 %indvars.iv, %indvars.iv7, !dbg !81
  %7 = trunc i64 %indvars.iv7 to i32, !dbg !81
  %8 = add nsw i32 %j.01, %7, !dbg !81
  %9 = add nsw i32 %8, 1, !dbg !81
  %10 = trunc i64 %6 to i32, !dbg !81
  %11 = mul nsw i32 %9, %10, !dbg !81
  %12 = sdiv i32 %11, 2, !dbg !81
  %13 = trunc i64 %3 to i32, !dbg !81
  %14 = add i32 %13, %12, !dbg !81
  %15 = sitofp i32 %14 to double, !dbg !81
  %16 = fdiv double 1.000000e+00, %15, !dbg !81
  %17 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !79
  %18 = load double* %17, align 8, !dbg !79, !tbaa !75
  %19 = fmul double %16, %18, !dbg !79
  %20 = fadd double %5, %19, !dbg !79
  store double %20, double* %2, align 8, !dbg !79, !tbaa !75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !79
  %21 = add nsw i32 %j.01, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !24), !dbg !79
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !79
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !79
  br i1 %exitcond, label %._crit_edge, label %4, !dbg !79

._crit_edge:                                      ; preds = %4
  %exitcond10 = icmp eq i32 %13, %N, !dbg !71
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph, !dbg !71

._crit_edge6:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !28), !dbg !86
  tail call void @llvm.dbg.value(metadata !{double* %Au}, i64 0, metadata !29), !dbg !86
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !30), !dbg !87
  %1 = icmp sgt i32 %N, 0, !dbg !87
  br i1 %1, label %.lr.ph, label %._crit_edge6, !dbg !87

.lr.ph:                                           ; preds = %0, %._crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge ], [ 0, %0 ]
  %2 = getelementptr inbounds double* %Au, i64 %indvars.iv7, !dbg !89
  store double 0.000000e+00, double* %2, align 8, !dbg !89, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !31), !dbg !91
  br label %3, !dbg !91

; <label>:3                                       ; preds = %3, %.lr.ph
  %4 = phi double [ 0.000000e+00, %.lr.ph ], [ %19, %3 ], !dbg !93
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %j.01 = phi i32 [ 0, %.lr.ph ], [ %20, %3 ]
  tail call void @llvm.dbg.value(metadata !{i32 %j.01}, i64 0, metadata !94), !dbg !93
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !95), !dbg !93
  %5 = add nsw i64 %indvars.iv, %indvars.iv7, !dbg !93
  %6 = trunc i64 %indvars.iv7 to i32, !dbg !93
  %7 = add nsw i32 %j.01, %6, !dbg !93
  %8 = add nsw i32 %7, 1, !dbg !93
  %9 = trunc i64 %5 to i32, !dbg !93
  %10 = mul nsw i32 %8, %9, !dbg !93
  %11 = sdiv i32 %10, 2, !dbg !93
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !91
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !93
  %13 = add i32 %12, %11, !dbg !93
  %14 = sitofp i32 %13 to double, !dbg !93
  %15 = fdiv double 1.000000e+00, %14, !dbg !93
  %16 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !91
  %17 = load double* %16, align 8, !dbg !91, !tbaa !75
  %18 = fmul double %15, %17, !dbg !91
  %19 = fadd double %4, %18, !dbg !91
  store double %19, double* %2, align 8, !dbg !91, !tbaa !75
  %20 = add nsw i32 %j.01, 1, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !31), !dbg !91
  %exitcond = icmp eq i32 %12, %N, !dbg !91
  br i1 %exitcond, label %._crit_edge, label %3, !dbg !91

._crit_edge:                                      ; preds = %3
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !87
  %lftr.wideiv9 = trunc i64 %indvars.iv.next8 to i32, !dbg !87
  %exitcond10 = icmp eq i32 %lftr.wideiv9, %N, !dbg !87
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph, !dbg !87

._crit_edge6:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !96
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %AtAu) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !34), !dbg !97
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !35), !dbg !97
  tail call void @llvm.dbg.value(metadata !{double* %AtAu}, i64 0, metadata !36), !dbg !97
  %1 = zext i32 %N to i64, !dbg !98
  %2 = alloca double, i64 %1, align 16, !dbg !98
  tail call void @llvm.dbg.declare(metadata !{double* %2}, metadata !37), !dbg !98
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !99), !dbg !100
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !101), !dbg !100
  tail call void @llvm.dbg.value(metadata !{double* %2}, i64 0, metadata !102), !dbg !100
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !103), !dbg !104
  %3 = icmp sgt i32 %N, 0, !dbg !104
  br i1 %3, label %.lr.ph.i, label %eval_At_times_u.exit, !dbg !104

.lr.ph.i:                                         ; preds = %0, %._crit_edge.i
  %indvars.iv7.i = phi i64 [ %5, %._crit_edge.i ], [ 0, %0 ]
  %4 = getelementptr inbounds double* %2, i64 %indvars.iv7.i, !dbg !105
  store double 0.000000e+00, double* %4, align 8, !dbg !105, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !106), !dbg !107
  %5 = add i64 %indvars.iv7.i, 1, !dbg !108
  %6 = trunc i64 %indvars.iv7.i to i32, !dbg !108
  %7 = add i32 %6, 1, !dbg !108
  %8 = trunc i64 %5 to i32, !dbg !108
  br label %9, !dbg !107

; <label>:9                                       ; preds = %9, %.lr.ph.i
  %10 = phi double [ 0.000000e+00, %.lr.ph.i ], [ %22, %9 ], !dbg !108
  %indvars.iv.i = phi i64 [ 0, %.lr.ph.i ], [ %indvars.iv.next.i, %9 ]
  %j.01.i = phi i32 [ 0, %.lr.ph.i ], [ %23, %9 ]
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !109), !dbg !108
  tail call void @llvm.dbg.value(metadata !{i32 %j.01.i}, i64 0, metadata !110), !dbg !108
  %11 = add nsw i64 %indvars.iv.i, %indvars.iv7.i, !dbg !108
  %12 = add i32 %7, %j.01.i, !dbg !108
  %13 = trunc i64 %11 to i32, !dbg !108
  %14 = mul nsw i32 %12, %13, !dbg !108
  %15 = sdiv i32 %14, 2, !dbg !108
  %16 = add i32 %15, %8, !dbg !108
  %17 = sitofp i32 %16 to double, !dbg !108
  %18 = fdiv double 1.000000e+00, %17, !dbg !108
  %19 = getelementptr inbounds double* %u, i64 %indvars.iv.i, !dbg !107
  %20 = load double* %19, align 8, !dbg !107, !tbaa !75
  %21 = fmul double %18, %20, !dbg !107
  %22 = fadd double %10, %21, !dbg !107
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !107
  %23 = add nsw i32 %j.01.i, 1, !dbg !107
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !106), !dbg !107
  %lftr.wideiv15 = trunc i64 %indvars.iv.next.i to i32, !dbg !107
  %exitcond16 = icmp eq i32 %lftr.wideiv15, %N, !dbg !107
  br i1 %exitcond16, label %._crit_edge.i, label %9, !dbg !107

._crit_edge.i:                                    ; preds = %9
  store double %22, double* %4, align 8, !dbg !107, !tbaa !75
  %exitcond18 = icmp eq i32 %8, %N, !dbg !104
  br i1 %exitcond18, label %.lr.ph.i2, label %.lr.ph.i, !dbg !104

.lr.ph.i2:                                        ; preds = %._crit_edge.i, %._crit_edge.i8
  %indvars.iv7.i1 = phi i64 [ %indvars.iv.next8.i, %._crit_edge.i8 ], [ 0, %._crit_edge.i ]
  %24 = getelementptr inbounds double* %AtAu, i64 %indvars.iv7.i1, !dbg !111
  store double 0.000000e+00, double* %24, align 8, !dbg !111, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !112), !dbg !113
  %25 = trunc i64 %indvars.iv7.i1 to i32, !dbg !114
  %26 = add i32 %25, 1, !dbg !114
  br label %27, !dbg !113

; <label>:27                                      ; preds = %27, %.lr.ph.i2
  %28 = phi double [ 0.000000e+00, %.lr.ph.i2 ], [ %41, %27 ], !dbg !114
  %indvars.iv.i3 = phi i64 [ 0, %.lr.ph.i2 ], [ %indvars.iv.next.i5, %27 ]
  %j.01.i4 = phi i32 [ 0, %.lr.ph.i2 ], [ %42, %27 ]
  tail call void @llvm.dbg.value(metadata !{i32 %j.01.i4}, i64 0, metadata !115), !dbg !114
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !116), !dbg !114
  %29 = add nsw i64 %indvars.iv.i3, %indvars.iv7.i1, !dbg !114
  %30 = add i32 %26, %j.01.i4, !dbg !114
  %31 = trunc i64 %29 to i32, !dbg !114
  %32 = mul nsw i32 %30, %31, !dbg !114
  %33 = sdiv i32 %32, 2, !dbg !114
  %indvars.iv.next.i5 = add nuw nsw i64 %indvars.iv.i3, 1, !dbg !113
  %34 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !114
  %35 = add i32 %34, %33, !dbg !114
  %36 = sitofp i32 %35 to double, !dbg !114
  %37 = fdiv double 1.000000e+00, %36, !dbg !114
  %38 = getelementptr inbounds double* %2, i64 %indvars.iv.i3, !dbg !113
  %39 = load double* %38, align 8, !dbg !113, !tbaa !75
  %40 = fmul double %37, %39, !dbg !113
  %41 = fadd double %28, %40, !dbg !113
  %42 = add nsw i32 %j.01.i4, 1, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !112), !dbg !113
  %exitcond = icmp eq i32 %34, %N, !dbg !113
  br i1 %exitcond, label %._crit_edge.i8, label %27, !dbg !113

._crit_edge.i8:                                   ; preds = %27
  store double %41, double* %24, align 8, !dbg !113, !tbaa !75
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i1, 1, !dbg !117
  %lftr.wideiv12 = trunc i64 %indvars.iv.next8.i to i32, !dbg !117
  %exitcond13 = icmp eq i32 %lftr.wideiv12, %N, !dbg !117
  br i1 %exitcond13, label %eval_At_times_u.exit, label %.lr.ph.i2, !dbg !117

eval_At_times_u.exit:                             ; preds = %._crit_edge.i8, %0
  ret void, !dbg !98
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !48), !dbg !118
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !49), !dbg !118
  %1 = icmp eq i32 %argc, 2, !dbg !119
  br i1 %1, label %4, label %.thread, !dbg !119

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !51), !dbg !120
  %2 = alloca [2000 x double], align 16, !dbg !121
  tail call void @llvm.dbg.declare(metadata !{double* %14}, metadata !52), !dbg !121
  %3 = alloca [2000 x double], align 16, !dbg !121
  tail call void @llvm.dbg.declare(metadata !{double* %25}, metadata !53), !dbg !121
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !50), !dbg !122
  %.sub17 = getelementptr inbounds [2000 x double]* %3, i64 0, i64 0
  %.sub = getelementptr inbounds [2000 x double]* %2, i64 0, i64 0
  br label %.lr.ph9, !dbg !122

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8** %argv, i64 1, !dbg !120
  %6 = load i8** %5, align 8, !dbg !120, !tbaa !124
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !126) #4, !dbg !127
  %7 = tail call i64 @strtol(i8* nocapture %6, i8** null, i32 10) #4, !dbg !128
  %8 = trunc i64 %7 to i32, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !51), !dbg !120
  %9 = and i64 %7, 4294967295, !dbg !121
  %10 = alloca double, i64 %9, align 16, !dbg !121
  tail call void @llvm.dbg.declare(metadata !{double* %14}, metadata !52), !dbg !121
  %11 = alloca double, i64 %9, align 16, !dbg !121
  tail call void @llvm.dbg.declare(metadata !{double* %25}, metadata !53), !dbg !121
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !50), !dbg !122
  %12 = icmp sgt i32 %8, 0, !dbg !122
  br i1 %12, label %.lr.ph9, label %.preheader1, !dbg !122

.lr.ph9:                                          ; preds = %.thread, %4
  %13 = phi double* [ %.sub17, %.thread ], [ %11, %4 ]
  %14 = phi double* [ %.sub, %.thread ], [ %10, %4 ]
  %15 = phi i32 [ 2000, %.thread ], [ %8, %4 ]
  %16 = add i32 %15, -1, !dbg !122
  %17 = zext i32 %16 to i64
  %18 = add i64 %17, 1, !dbg !122
  %end.idx = add i64 %17, 1, !dbg !122
  %n.vec = and i64 %18, 8589934588, !dbg !122
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !122
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph9, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph9 ], !dbg !122
  %19 = getelementptr inbounds double* %14, i64 %index, !dbg !122
  %20 = bitcast double* %19 to <2 x double>*, !dbg !122
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %20, align 8, !dbg !122
  %.sum21 = or i64 %index, 2, !dbg !122
  %21 = getelementptr double* %14, i64 %.sum21, !dbg !122
  %22 = bitcast double* %21 to <2 x double>*, !dbg !122
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %22, align 8, !dbg !122
  %index.next = add i64 %index, 4, !dbg !122
  %23 = icmp eq i64 %index.next, %n.vec, !dbg !122
  br i1 %23, label %middle.block, label %vector.body, !dbg !122, !llvm.loop !130

middle.block:                                     ; preds = %vector.body, %.lr.ph9
  %resume.val = phi i64 [ 0, %.lr.ph9 ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.preheader1, label %scalar.ph

.preheader1:                                      ; preds = %scalar.ph, %middle.block, %4
  %24 = phi i1 [ false, %4 ], [ true, %middle.block ], [ true, %scalar.ph ]
  %25 = phi double* [ %11, %4 ], [ %13, %middle.block ], [ %13, %scalar.ph ]
  %26 = phi double* [ %10, %4 ], [ %14, %middle.block ], [ %14, %scalar.ph ]
  %27 = phi i32 [ %8, %4 ], [ %15, %middle.block ], [ %15, %scalar.ph ]
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  call void @eval_AtA_times_u(i32 %27, double* %26, double* %25), !dbg !133
  call void @eval_AtA_times_u(i32 %27, double* %25, double* %26), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !50), !dbg !138
  br i1 %24, label %.lr.ph, label %._crit_edge, !dbg !139

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %scalar.ph ], [ %resume.val, %middle.block ]
  %28 = getelementptr inbounds double* %14, i64 %indvars.iv13, !dbg !122
  store double 1.000000e+00, double* %28, align 8, !dbg !122, !tbaa !75
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !122
  %lftr.wideiv15 = trunc i64 %indvars.iv.next14 to i32, !dbg !122
  %exitcond16 = icmp eq i32 %lftr.wideiv15, %15, !dbg !122
  br i1 %exitcond16, label %.preheader1, label %scalar.ph, !dbg !122, !llvm.loop !141

.lr.ph:                                           ; preds = %.preheader1, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader1 ]
  %29 = phi <2 x double> [ %38, %.lr.ph ], [ zeroinitializer, %.preheader1 ]
  %30 = getelementptr inbounds double* %26, i64 %indvars.iv, !dbg !142
  %31 = load double* %30, align 8, !dbg !142, !tbaa !75
  %32 = getelementptr inbounds double* %25, i64 %indvars.iv, !dbg !142
  %33 = load double* %32, align 8, !dbg !142, !tbaa !75
  tail call void @llvm.dbg.value(metadata !144, i64 0, metadata !54), !dbg !142
  %34 = insertelement <2 x double> undef, double %33, i32 0, !dbg !142
  %35 = insertelement <2 x double> %34, double %33, i32 1, !dbg !142
  %36 = insertelement <2 x double> %34, double %31, i32 1, !dbg !142
  %37 = fmul <2 x double> %35, %36, !dbg !142
  %38 = fadd <2 x double> %29, %37, !dbg !142
  tail call void @llvm.dbg.value(metadata !144, i64 0, metadata !55), !dbg !142
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !139
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !139
  %exitcond = icmp eq i32 %lftr.wideiv, %27, !dbg !139
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !139

._crit_edge:                                      ; preds = %.lr.ph, %.preheader1
  %39 = phi <2 x double> [ zeroinitializer, %.preheader1 ], [ %38, %.lr.ph ]
  %40 = extractelement <2 x double> %39, i32 1, !dbg !145
  %41 = extractelement <2 x double> %39, i32 0, !dbg !145
  %42 = fdiv double %40, %41, !dbg !145
  %43 = tail call double @sqrt(double %42) #4, !dbg !145
  %44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), double %43) #4, !dbg !145
  ret i32 0, !dbg !146
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"spectral-norm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13, metadata !25, metadata !32, metadata !41, metadata !56}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A", metadata !"eval_A", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32)* @eval_A, null, null, metadata !10, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 13]
!12 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 13]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A_times_u", metadata !"eval_A_times_u", metadata !"", i32 15, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_A_times_u, null, null, metadata !19, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !9, metadata !16, metadata !18}
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = metadata !{metadata !20, metadata !21, metadata !22, metadata !23, metadata !24}
!20 = metadata !{i32 786689, metadata !13, metadata !"N", metadata !5, i32 16777231, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 15]
!21 = metadata !{i32 786689, metadata !13, metadata !"u", metadata !5, i32 33554447, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 15]
!22 = metadata !{i32 786689, metadata !13, metadata !"Au", metadata !5, i32 50331663, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!23 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!24 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_At_times_u", metadata !"eval_At_times_u", metadata !"", i32 25, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_At_times_u, null, null, metadata !26, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!26 = metadata !{metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!27 = metadata !{i32 786689, metadata !25, metadata !"N", metadata !5, i32 16777241, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 25]
!28 = metadata !{i32 786689, metadata !25, metadata !"u", metadata !5, i32 33554457, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 25]
!29 = metadata !{i32 786689, metadata !25, metadata !"Au", metadata !5, i32 50331673, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!30 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!31 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 27]
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_AtA_times_u", metadata !"eval_AtA_times_u", metadata !"", i32 35, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_AtA_times_u, null, null, metadata !33, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !37}
!34 = metadata !{i32 786689, metadata !32, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!35 = metadata !{i32 786689, metadata !32, metadata !"u", metadata !5, i32 33554467, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 35]
!36 = metadata !{i32 786689, metadata !32, metadata !"AtAu", metadata !5, i32 50331683, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!37 = metadata !{i32 786688, metadata !32, metadata !"v", metadata !5, i32 36, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 36]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 0, i64 64, i32 0, i32 0, metadata !8, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 -1}       ; [ DW_TAG_subrange_type ] [unbounded]
!41 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !47, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !9, metadata !9, metadata !44}
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!47 = metadata !{metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55}
!48 = metadata !{i32 786689, metadata !41, metadata !"argc", metadata !5, i32 16777254, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!49 = metadata !{i32 786689, metadata !41, metadata !"argv", metadata !5, i32 33554470, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!50 = metadata !{i32 786688, metadata !41, metadata !"i", metadata !5, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!51 = metadata !{i32 786688, metadata !41, metadata !"N", metadata !5, i32 41, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 41]
!52 = metadata !{i32 786688, metadata !41, metadata !"u", metadata !5, i32 42, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 42]
!53 = metadata !{i32 786688, metadata !41, metadata !"v", metadata !5, i32 42, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 42]
!54 = metadata !{i32 786688, metadata !41, metadata !"vBv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!55 = metadata !{i32 786688, metadata !41, metadata !"vv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vv] [line 42]
!56 = metadata !{i32 786478, metadata !57, metadata !58, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !63, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!57 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!58 = metadata !{i32 786473, metadata !57}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !9, metadata !61}
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786689, metadata !56, metadata !"__nptr", metadata !58, i32 16777494, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!65 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!66 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!67 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!68 = metadata !{i32 13, i32 0, metadata !4, null}
!69 = metadata !{i32 15, i32 0, metadata !13, null}
!70 = metadata !{i32 0}
!71 = metadata !{i32 18, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !13, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!73 = metadata !{i32 20, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!75 = metadata !{metadata !76, metadata !76, i64 0}
!76 = metadata !{metadata !"double", metadata !77, i64 0}
!77 = metadata !{metadata !"omnipotent char", metadata !78, i64 0}
!78 = metadata !{metadata !"Simple C/C++ TBAA"}
!79 = metadata !{i32 21, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !74, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!81 = metadata !{i32 13, i32 0, metadata !4, metadata !79}
!82 = metadata !{i32 undef}
!83 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [i] [line 13]
!84 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, metadata !79} ; [ DW_TAG_arg_variable ] [j] [line 13]
!85 = metadata !{i32 23, i32 0, metadata !13, null}
!86 = metadata !{i32 25, i32 0, metadata !25, null}
!87 = metadata !{i32 28, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !25, i32 28, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!89 = metadata !{i32 30, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !88, i32 29, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!91 = metadata !{i32 31, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !90, i32 31, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!93 = metadata !{i32 13, i32 0, metadata !4, metadata !91}
!94 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, metadata !91} ; [ DW_TAG_arg_variable ] [i] [line 13]
!95 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, metadata !91} ; [ DW_TAG_arg_variable ] [j] [line 13]
!96 = metadata !{i32 33, i32 0, metadata !25, null}
!97 = metadata !{i32 35, i32 0, metadata !32, null}
!98 = metadata !{i32 36, i32 0, metadata !32, null}
!99 = metadata !{i32 786689, metadata !13, metadata !"N", metadata !5, i32 16777231, metadata !9, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [N] [line 15]
!100 = metadata !{i32 15, i32 0, metadata !13, metadata !98}
!101 = metadata !{i32 786689, metadata !13, metadata !"u", metadata !5, i32 33554447, metadata !16, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [u] [line 15]
!102 = metadata !{i32 786689, metadata !13, metadata !"Au", metadata !5, i32 50331663, metadata !18, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!103 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 17, metadata !9, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [i] [line 17]
!104 = metadata !{i32 18, i32 0, metadata !72, metadata !98}
!105 = metadata !{i32 20, i32 0, metadata !74, metadata !98}
!106 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [j] [line 17]
!107 = metadata !{i32 21, i32 0, metadata !80, metadata !98}
!108 = metadata !{i32 13, i32 0, metadata !4, metadata !107}
!109 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [i] [line 13]
!110 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, metadata !107} ; [ DW_TAG_arg_variable ] [j] [line 13]
!111 = metadata !{i32 30, i32 0, metadata !90, metadata !98}
!112 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 27, metadata !9, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [j] [line 27]
!113 = metadata !{i32 31, i32 0, metadata !92, metadata !98}
!114 = metadata !{i32 13, i32 0, metadata !4, metadata !113}
!115 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [i] [line 13]
!116 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, metadata !113} ; [ DW_TAG_arg_variable ] [j] [line 13]
!117 = metadata !{i32 28, i32 0, metadata !88, metadata !98}
!118 = metadata !{i32 38, i32 0, metadata !41, null}
!119 = metadata !{i32 41, i32 0, metadata !41, null}
!120 = metadata !{i32 41, i32 26, metadata !41, null}
!121 = metadata !{i32 42, i32 0, metadata !41, null}
!122 = metadata !{i32 43, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !41, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!124 = metadata !{metadata !125, metadata !125, i64 0}
!125 = metadata !{metadata !"any pointer", metadata !77, i64 0}
!126 = metadata !{i32 786689, metadata !56, metadata !"__nptr", metadata !58, i32 16777494, metadata !61, i32 0, metadata !120} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!127 = metadata !{i32 278, i32 0, metadata !56, metadata !120}
!128 = metadata !{i32 280, i32 0, metadata !129, metadata !120}
!129 = metadata !{i32 786443, metadata !57, metadata !56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!130 = metadata !{metadata !130, metadata !131, metadata !132}
!131 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!132 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!133 = metadata !{i32 46, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !135, i32 45, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!135 = metadata !{i32 786443, metadata !1, metadata !41, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!136 = metadata !{i32 47, i32 0, metadata !134, null}
!137 = metadata !{i32 1}
!138 = metadata !{i32 44, i32 0, metadata !135, null}
!139 = metadata !{i32 50, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !41, i32 50, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!141 = metadata !{metadata !141, metadata !131, metadata !132}
!142 = metadata !{i32 50, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !140, i32 50, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!144 = metadata !{double undef}
!145 = metadata !{i32 51, i32 0, metadata !41, null}
!146 = metadata !{i32 53, i32 0, metadata !41, null}
