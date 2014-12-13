; ModuleID = 'FFT.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"FFT: Data length is not a power of 2!: %d \00", align 1

; Function Attrs: nounwind uwtable
define double @FFT_num_flops(i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !11), !dbg !95
  %1 = sitofp i32 %N to double, !dbg !96
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !12), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !97) #4, !dbg !99
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !101) #4, !dbg !102
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !104) #4, !dbg !105
  %2 = icmp sgt i32 %N, 1, !dbg !106
  br i1 %2, label %.lr.ph.i, label %._crit_edge.i, !dbg !106

.lr.ph.i:                                         ; preds = %0, %.lr.ph.i
  %log.02.i = phi i32 [ %4, %.lr.ph.i ], [ 0, %0 ]
  %k.01.i = phi i32 [ %3, %.lr.ph.i ], [ 1, %0 ]
  %3 = shl nsw i32 %k.01.i, 1, !dbg !106
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !101) #4, !dbg !106
  %4 = add nsw i32 %log.02.i, 1, !dbg !106
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !104) #4, !dbg !106
  %5 = icmp slt i32 %3, %N, !dbg !106
  br i1 %5, label %.lr.ph.i, label %._crit_edge.i, !dbg !106

._crit_edge.i:                                    ; preds = %.lr.ph.i, %0
  %log.0.lcssa.i = phi i32 [ 0, %0 ], [ %4, %.lr.ph.i ]
  %6 = shl i32 1, %log.0.lcssa.i, !dbg !108
  %7 = icmp eq i32 %6, %N, !dbg !108
  br i1 %7, label %int_log2.exit, label %8, !dbg !108

; <label>:8                                       ; preds = %._crit_edge.i
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i64 0, i64 0), i32 %N) #4, !dbg !110
  tail call void @exit(i32 1) #5, !dbg !112
  unreachable, !dbg !112

int_log2.exit:                                    ; preds = %._crit_edge.i
  %10 = sitofp i32 %log.0.lcssa.i to double, !dbg !98
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !13), !dbg !98
  %11 = fmul double %1, 5.000000e+00, !dbg !113
  %12 = fadd double %11, -2.000000e+00, !dbg !113
  %13 = fmul double %12, %10, !dbg !113
  %14 = fadd double %1, 1.000000e+00, !dbg !113
  %15 = fmul double %14, 2.000000e+00, !dbg !113
  %16 = fadd double %15, %13, !dbg !113
  ret double %16, !dbg !113
}

; Function Attrs: nounwind uwtable
define void @FFT_bitreverse(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !19), !dbg !114
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !20), !dbg !114
  %1 = sdiv i32 %N, 2, !dbg !115
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !21), !dbg !115
  %2 = add i32 %1, -1, !dbg !116
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !116
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !23), !dbg !117
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !24), !dbg !118
  %3 = icmp sgt i32 %2, 0, !dbg !119
  br i1 %3, label %.lr.ph7, label %._crit_edge8, !dbg !119

.lr.ph7:                                          ; preds = %0
  %4 = ashr i32 %1, 1, !dbg !120
  br label %5, !dbg !119

; <label>:5                                       ; preds = %._crit_edge, %.lr.ph7
  %indvars.iv = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next, %._crit_edge ]
  %j.04 = phi i32 [ 0, %.lr.ph7 ], [ %29, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32, !dbg !121
  %7 = shl i32 %6, 1, !dbg !121
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !25), !dbg !121
  %8 = shl i32 %j.04, 1, !dbg !122
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !28), !dbg !122
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !29), !dbg !120
  %9 = icmp slt i32 %6, %j.04, !dbg !123
  br i1 %9, label %10, label %.preheader, !dbg !123

; <label>:10                                      ; preds = %5
  %11 = sext i32 %7 to i64, !dbg !124
  %12 = getelementptr inbounds double* %data, i64 %11, !dbg !124
  %13 = load double* %12, align 8, !dbg !124, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !30), !dbg !124
  %14 = or i32 %7, 1, !dbg !129
  %15 = sext i32 %14 to i64, !dbg !129
  %16 = getelementptr inbounds double* %data, i64 %15, !dbg !129
  %17 = load double* %16, align 8, !dbg !129, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !33), !dbg !129
  %18 = sext i32 %8 to i64, !dbg !130
  %19 = getelementptr inbounds double* %data, i64 %18, !dbg !130
  %20 = load double* %19, align 8, !dbg !130, !tbaa !125
  store double %20, double* %12, align 8, !dbg !130, !tbaa !125
  %21 = or i32 %8, 1, !dbg !131
  %22 = sext i32 %21 to i64, !dbg !131
  %23 = getelementptr inbounds double* %data, i64 %22, !dbg !131
  %24 = load double* %23, align 8, !dbg !131, !tbaa !125
  store double %24, double* %16, align 8, !dbg !131, !tbaa !125
  store double %13, double* %19, align 8, !dbg !132, !tbaa !125
  store double %17, double* %23, align 8, !dbg !133, !tbaa !125
  br label %.preheader, !dbg !133

.preheader:                                       ; preds = %10, %5
  %25 = icmp slt i32 %j.04, %4, !dbg !134
  br i1 %25, label %._crit_edge, label %.lr.ph, !dbg !134

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %j.12 = phi i32 [ %26, %.lr.ph ], [ %j.04, %.preheader ]
  %k.01 = phi i32 [ %27, %.lr.ph ], [ %4, %.preheader ]
  %26 = sub nsw i32 %j.12, %k.01, !dbg !135
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !24), !dbg !135
  %27 = ashr i32 %k.01, 1, !dbg !137
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !29), !dbg !137
  %28 = icmp slt i32 %26, %27, !dbg !134
  br i1 %28, label %._crit_edge, label %.lr.ph, !dbg !134

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %j.1.lcssa = phi i32 [ %j.04, %.preheader ], [ %26, %.lr.ph ]
  %k.0.lcssa = phi i32 [ %4, %.preheader ], [ %27, %.lr.ph ]
  %29 = add nsw i32 %j.1.lcssa, %k.0.lcssa, !dbg !138
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !24), !dbg !138
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !119
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !119
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !119
  br i1 %exitcond, label %._crit_edge8, label %5, !dbg !119

._crit_edge8:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define void @FFT_transform(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !36), !dbg !140
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !37), !dbg !140
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 -1), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define internal fastcc void @FFT_transform_internal(i32 %N, double* nocapture %data, i32 %direction) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !49), !dbg !143
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !50), !dbg !143
  tail call void @llvm.dbg.value(metadata !{i32 %direction}, i64 0, metadata !51), !dbg !143
  %1 = sdiv i32 %N, 2, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !52), !dbg !144
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !53), !dbg !145
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !55), !dbg !146
  %2 = and i32 %N, -2, !dbg !147
  %3 = icmp eq i32 %2, 2, !dbg !147
  br i1 %3, label %.loopexit, label %4, !dbg !147

; <label>:4                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !149) #4, !dbg !151
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !152) #4, !dbg !153
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !154) #4, !dbg !155
  %5 = icmp sgt i32 %N, 3, !dbg !156
  br i1 %5, label %.lr.ph.i, label %._crit_edge.i, !dbg !156

.lr.ph.i:                                         ; preds = %4, %.lr.ph.i
  %log.02.i = phi i32 [ %7, %.lr.ph.i ], [ 0, %4 ]
  %k.01.i = phi i32 [ %6, %.lr.ph.i ], [ 1, %4 ]
  %6 = shl nsw i32 %k.01.i, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !152) #4, !dbg !156
  %7 = add nsw i32 %log.02.i, 1, !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !154) #4, !dbg !156
  %8 = icmp slt i32 %6, %1, !dbg !156
  br i1 %8, label %.lr.ph.i, label %._crit_edge.i, !dbg !156

._crit_edge.i:                                    ; preds = %.lr.ph.i, %4
  %log.0.lcssa.i = phi i32 [ 0, %4 ], [ %7, %.lr.ph.i ]
  %9 = shl i32 1, %log.0.lcssa.i, !dbg !157
  %10 = icmp eq i32 %9, %1, !dbg !157
  br i1 %10, label %int_log2.exit, label %11, !dbg !157

; <label>:11                                      ; preds = %._crit_edge.i
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i64 0, i64 0), i32 %1) #4, !dbg !158
  tail call void @exit(i32 1) #5, !dbg !159
  unreachable, !dbg !159

int_log2.exit:                                    ; preds = %._crit_edge.i
  tail call void @llvm.dbg.value(metadata !{i32 %log.0.lcssa.i}, i64 0, metadata !54), !dbg !150
  %13 = icmp eq i32 %N, 0, !dbg !160
  br i1 %13, label %.loopexit, label %14, !dbg !160

; <label>:14                                      ; preds = %int_log2.exit
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !162), !dbg !164
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !165), !dbg !164
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !166), !dbg !167
  %15 = add i32 %1, -1, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !169), !dbg !168
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !170), !dbg !171
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !172), !dbg !173
  %16 = icmp sgt i32 %15, 0, !dbg !174
  br i1 %16, label %.lr.ph7.i, label %FFT_bitreverse.exit.preheader, !dbg !174

.lr.ph7.i:                                        ; preds = %14
  %17 = ashr i32 %1, 1, !dbg !175
  br label %18, !dbg !174

; <label>:18                                      ; preds = %._crit_edge.i7, %.lr.ph7.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next.i, %._crit_edge.i7 ]
  %j.04.i = phi i32 [ 0, %.lr.ph7.i ], [ %42, %._crit_edge.i7 ]
  %19 = trunc i64 %indvars.iv.i to i32, !dbg !176
  %20 = shl i32 %19, 1, !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !177), !dbg !176
  %21 = shl i32 %j.04.i, 1, !dbg !178
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !179), !dbg !178
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !180), !dbg !175
  %22 = icmp slt i32 %19, %j.04.i, !dbg !181
  br i1 %22, label %23, label %.preheader.i, !dbg !181

; <label>:23                                      ; preds = %18
  %24 = sext i32 %20 to i64, !dbg !182
  %25 = getelementptr inbounds double* %data, i64 %24, !dbg !182
  %26 = load double* %25, align 8, !dbg !182, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !183), !dbg !182
  %27 = or i32 %20, 1, !dbg !184
  %28 = sext i32 %27 to i64, !dbg !184
  %29 = getelementptr inbounds double* %data, i64 %28, !dbg !184
  %30 = load double* %29, align 8, !dbg !184, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !185), !dbg !184
  %31 = sext i32 %21 to i64, !dbg !186
  %32 = getelementptr inbounds double* %data, i64 %31, !dbg !186
  %33 = load double* %32, align 8, !dbg !186, !tbaa !125
  store double %33, double* %25, align 8, !dbg !186, !tbaa !125
  %34 = or i32 %21, 1, !dbg !187
  %35 = sext i32 %34 to i64, !dbg !187
  %36 = getelementptr inbounds double* %data, i64 %35, !dbg !187
  %37 = load double* %36, align 8, !dbg !187, !tbaa !125
  store double %37, double* %29, align 8, !dbg !187, !tbaa !125
  store double %26, double* %32, align 8, !dbg !188, !tbaa !125
  store double %30, double* %36, align 8, !dbg !189, !tbaa !125
  br label %.preheader.i, !dbg !189

.preheader.i:                                     ; preds = %23, %18
  %38 = icmp slt i32 %j.04.i, %17, !dbg !190
  br i1 %38, label %._crit_edge.i7, label %.lr.ph.i6, !dbg !190

.lr.ph.i6:                                        ; preds = %.preheader.i, %.lr.ph.i6
  %j.12.i = phi i32 [ %39, %.lr.ph.i6 ], [ %j.04.i, %.preheader.i ]
  %k.01.i5 = phi i32 [ %40, %.lr.ph.i6 ], [ %17, %.preheader.i ]
  %39 = sub nsw i32 %j.12.i, %k.01.i5, !dbg !191
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !172), !dbg !191
  %40 = ashr i32 %k.01.i5, 1, !dbg !192
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !180), !dbg !192
  %41 = icmp slt i32 %39, %40, !dbg !190
  br i1 %41, label %._crit_edge.i7, label %.lr.ph.i6, !dbg !190

._crit_edge.i7:                                   ; preds = %.lr.ph.i6, %.preheader.i
  %j.1.lcssa.i = phi i32 [ %j.04.i, %.preheader.i ], [ %39, %.lr.ph.i6 ]
  %k.0.lcssa.i = phi i32 [ %17, %.preheader.i ], [ %40, %.lr.ph.i6 ]
  %42 = add nsw i32 %k.0.lcssa.i, %j.1.lcssa.i, !dbg !193
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !172), !dbg !193
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !174
  %lftr.wideiv31 = trunc i64 %indvars.iv.next.i to i32, !dbg !174
  %exitcond32 = icmp eq i32 %lftr.wideiv31, %15, !dbg !174
  br i1 %exitcond32, label %FFT_bitreverse.exit.preheader, label %18, !dbg !174

FFT_bitreverse.exit.preheader:                    ; preds = %._crit_edge.i7, %14
  %43 = icmp sgt i32 %log.0.lcssa.i, 0, !dbg !194
  br i1 %43, label %.lr.ph22, label %.loopexit, !dbg !194

.lr.ph22:                                         ; preds = %FFT_bitreverse.exit.preheader
  %44 = sitofp i32 %direction to double, !dbg !195
  %45 = fmul double %44, 2.000000e+00, !dbg !195
  %46 = fmul double %45, 0x400921FB54442D18, !dbg !195
  %47 = icmp sgt i32 %N, 1, !dbg !196
  br label %48, !dbg !194

; <label>:48                                      ; preds = %FFT_bitreverse.exit, %.lr.ph22
  %bit.021 = phi i32 [ 0, %.lr.ph22 ], [ %139, %FFT_bitreverse.exit ]
  %dual.018 = phi i32 [ 1, %.lr.ph22 ], [ %140, %FFT_bitreverse.exit ]
  tail call void @llvm.dbg.value(metadata !197, i64 0, metadata !56), !dbg !198
  tail call void @llvm.dbg.value(metadata !199, i64 0, metadata !59), !dbg !200
  %49 = sitofp i32 %dual.018 to double, !dbg !195
  %50 = fmul double %49, 2.000000e+00, !dbg !195
  %51 = fdiv double %46, %50, !dbg !195
  tail call void @llvm.dbg.value(metadata !{double %51}, i64 0, metadata !62), !dbg !195
  %52 = tail call double @sin(double %51) #4, !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %52}, i64 0, metadata !63), !dbg !201
  %53 = fmul double %51, 5.000000e-01, !dbg !202
  %54 = tail call double @sin(double %53) #4, !dbg !202
  tail call void @llvm.dbg.value(metadata !{double %54}, i64 0, metadata !64), !dbg !202
  %55 = fmul double %54, 2.000000e+00, !dbg !203
  %56 = fmul double %54, %55, !dbg !203
  tail call void @llvm.dbg.value(metadata !{double %56}, i64 0, metadata !65), !dbg !203
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !60), !dbg !196
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !61), !dbg !196
  br i1 %47, label %.lr.ph, label %.preheader, !dbg !196

.lr.ph:                                           ; preds = %48
  %57 = shl i32 %dual.018, 1, !dbg !196
  %58 = sext i32 %57 to i64
  %59 = zext i32 %dual.018 to i64, !dbg !196
  br label %110, !dbg !196

.preheader:                                       ; preds = %110, %48
  %60 = icmp sgt i32 %dual.018, 1, !dbg !204
  br i1 %60, label %.lr.ph16, label %FFT_bitreverse.exit, !dbg !204

.lr.ph16:                                         ; preds = %.preheader
  br i1 %47, label %.lr.ph16.split.us, label %.preheader34

.preheader34:                                     ; preds = %.lr.ph16
  %61 = add i32 %dual.018, -1, !dbg !205
  %n.vec = and i32 %61, -32, !dbg !204
  %end.idx.rnd.down41 = or i32 %n.vec, 1, !dbg !204
  %cmp.zero = icmp eq i32 %end.idx.rnd.down41, 1, !dbg !204
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader34, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 1, %.preheader34 ], !dbg !204
  %index.next = add i32 %index, 32, !dbg !204
  %62 = icmp eq i32 %index.next, %end.idx.rnd.down41, !dbg !204
  br i1 %62, label %middle.block, label %vector.body, !dbg !204, !llvm.loop !206

middle.block:                                     ; preds = %vector.body, %.preheader34
  %resume.val = phi i32 [ 1, %.preheader34 ], [ %end.idx.rnd.down41, %vector.body ]
  %cmp.n = icmp eq i32 %dual.018, %resume.val
  br i1 %cmp.n, label %FFT_bitreverse.exit, label %scalar.ph

.lr.ph16.split.us:                                ; preds = %.lr.ph16
  %63 = shl i32 %dual.018, 1, !dbg !204
  %64 = sext i32 %63 to i64
  %65 = zext i32 %dual.018 to i64, !dbg !204
  br label %.lr.ph12.us, !dbg !204

; <label>:66                                      ; preds = %67
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1, !dbg !204
  %lftr.wideiv = trunc i64 %indvars.iv.next28 to i32, !dbg !204
  %exitcond29 = icmp eq i32 %lftr.wideiv, %dual.018, !dbg !204
  br i1 %exitcond29, label %FFT_bitreverse.exit, label %.lr.ph12.us, !dbg !204

; <label>:67                                      ; preds = %.lr.ph12.us, %67
  %indvars.iv25 = phi i64 [ 0, %.lr.ph12.us ], [ %indvars.iv.next26, %67 ]
  %68 = add nsw i64 %indvars.iv25, %indvars.iv27, !dbg !209
  %69 = trunc i64 %68 to i32, !dbg !209
  %70 = shl nsw i32 %69, 1, !dbg !209
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !77), !dbg !209
  %71 = add nsw i64 %68, %65, !dbg !210
  %72 = trunc i64 %71 to i32, !dbg !210
  %73 = shl nsw i32 %72, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i32 %73}, i64 0, metadata !80), !dbg !210
  %74 = sext i32 %73 to i64, !dbg !211
  %75 = getelementptr inbounds double* %data, i64 %74, !dbg !211
  %76 = load double* %75, align 8, !dbg !211, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !81), !dbg !211
  %77 = or i32 %73, 1, !dbg !212
  %78 = sext i32 %77 to i64, !dbg !212
  %79 = getelementptr inbounds double* %data, i64 %78, !dbg !212
  %80 = load double* %79, align 8, !dbg !212, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !82), !dbg !212
  %81 = fmul double %105, %76, !dbg !213
  %82 = fmul double %109, %80, !dbg !213
  %83 = fsub double %81, %82, !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %83}, i64 0, metadata !83), !dbg !213
  %84 = fmul double %105, %80, !dbg !214
  %85 = fmul double %109, %76, !dbg !214
  %86 = fadd double %85, %84, !dbg !214
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !84), !dbg !214
  %87 = sext i32 %70 to i64, !dbg !215
  %88 = getelementptr inbounds double* %data, i64 %87, !dbg !215
  %89 = load double* %88, align 8, !dbg !215, !tbaa !125
  %90 = fsub double %89, %83, !dbg !215
  store double %90, double* %75, align 8, !dbg !215, !tbaa !125
  %91 = or i32 %70, 1, !dbg !216
  %92 = sext i32 %91 to i64, !dbg !216
  %93 = getelementptr inbounds double* %data, i64 %92, !dbg !216
  %94 = load double* %93, align 8, !dbg !216, !tbaa !125
  %95 = fsub double %94, %86, !dbg !216
  store double %95, double* %79, align 8, !dbg !216, !tbaa !125
  %96 = load double* %88, align 8, !dbg !217, !tbaa !125
  %97 = fadd double %83, %96, !dbg !217
  store double %97, double* %88, align 8, !dbg !217, !tbaa !125
  %98 = load double* %93, align 8, !dbg !218, !tbaa !125
  %99 = fadd double %86, %98, !dbg !218
  store double %99, double* %93, align 8, !dbg !218, !tbaa !125
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, %64, !dbg !219
  %100 = trunc i64 %indvars.iv.next26 to i32, !dbg !219
  %101 = icmp slt i32 %100, %1, !dbg !219
  br i1 %101, label %67, label %66, !dbg !219

.lr.ph12.us:                                      ; preds = %.lr.ph16.split.us, %66
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %66 ], [ 1, %.lr.ph16.split.us ]
  %w_real.015.us = phi double [ %105, %66 ], [ 1.000000e+00, %.lr.ph16.split.us ]
  %w_imag.014.us = phi double [ %109, %66 ], [ 0.000000e+00, %.lr.ph16.split.us ]
  %102 = fmul double %52, %w_imag.014.us, !dbg !205
  %103 = fsub double %w_real.015.us, %102, !dbg !205
  %104 = fmul double %56, %w_real.015.us, !dbg !205
  %105 = fsub double %103, %104, !dbg !205
  tail call void @llvm.dbg.value(metadata !{double %105}, i64 0, metadata !72), !dbg !205
  %106 = fmul double %52, %w_real.015.us, !dbg !220
  %107 = fadd double %w_imag.014.us, %106, !dbg !220
  %108 = fmul double %56, %w_imag.014.us, !dbg !220
  %109 = fsub double %107, %108, !dbg !220
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !76), !dbg !220
  tail call void @llvm.dbg.value(metadata !{double %105}, i64 0, metadata !56), !dbg !221
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !59), !dbg !222
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !61), !dbg !219
  br label %67, !dbg !219

; <label>:110                                     ; preds = %.lr.ph, %110
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %110 ]
  %111 = trunc i64 %indvars.iv to i32, !dbg !223
  %112 = shl nsw i32 %111, 1, !dbg !223
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !66), !dbg !223
  %113 = add nsw i64 %indvars.iv, %59, !dbg !224
  %114 = trunc i64 %113 to i32, !dbg !224
  %115 = shl nsw i32 %114, 1, !dbg !224
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !69), !dbg !224
  %116 = sext i32 %115 to i64, !dbg !225
  %117 = getelementptr inbounds double* %data, i64 %116, !dbg !225
  %118 = load double* %117, align 8, !dbg !225, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %118}, i64 0, metadata !70), !dbg !225
  %119 = or i32 %115, 1, !dbg !226
  %120 = sext i32 %119 to i64, !dbg !226
  %121 = getelementptr inbounds double* %data, i64 %120, !dbg !226
  %122 = load double* %121, align 8, !dbg !226, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !71), !dbg !226
  %123 = sext i32 %112 to i64, !dbg !227
  %124 = getelementptr inbounds double* %data, i64 %123, !dbg !227
  %125 = load double* %124, align 8, !dbg !227, !tbaa !125
  %126 = fsub double %125, %118, !dbg !227
  store double %126, double* %117, align 8, !dbg !227, !tbaa !125
  %127 = or i32 %112, 1, !dbg !228
  %128 = sext i32 %127 to i64, !dbg !228
  %129 = getelementptr inbounds double* %data, i64 %128, !dbg !228
  %130 = load double* %129, align 8, !dbg !228, !tbaa !125
  %131 = fsub double %130, %122, !dbg !228
  store double %131, double* %121, align 8, !dbg !228, !tbaa !125
  %132 = load double* %124, align 8, !dbg !229, !tbaa !125
  %133 = fadd double %118, %132, !dbg !229
  store double %133, double* %124, align 8, !dbg !229, !tbaa !125
  %134 = load double* %129, align 8, !dbg !230, !tbaa !125
  %135 = fadd double %122, %134, !dbg !230
  store double %135, double* %129, align 8, !dbg !230, !tbaa !125
  %indvars.iv.next = add nsw i64 %indvars.iv, %58, !dbg !196
  %136 = trunc i64 %indvars.iv.next to i32, !dbg !196
  %137 = icmp slt i32 %136, %1, !dbg !196
  br i1 %137, label %110, label %.preheader, !dbg !196

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %a.013 = phi i32 [ %138, %scalar.ph ], [ %resume.val, %middle.block ]
  tail call void @llvm.dbg.value(metadata !231, i64 0, metadata !72), !dbg !205
  tail call void @llvm.dbg.value(metadata !231, i64 0, metadata !76), !dbg !220
  tail call void @llvm.dbg.value(metadata !231, i64 0, metadata !56), !dbg !221
  tail call void @llvm.dbg.value(metadata !231, i64 0, metadata !59), !dbg !222
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !61), !dbg !219
  %138 = add nsw i32 %a.013, 1, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %138}, i64 0, metadata !60), !dbg !204
  %exitcond = icmp eq i32 %138, %dual.018, !dbg !204
  br i1 %exitcond, label %FFT_bitreverse.exit, label %scalar.ph, !dbg !204, !llvm.loop !232

FFT_bitreverse.exit:                              ; preds = %scalar.ph, %middle.block, %66, %.preheader
  %139 = add nsw i32 %bit.021, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %139}, i64 0, metadata !53), !dbg !194
  %140 = shl nsw i32 %dual.018, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %140}, i64 0, metadata !55), !dbg !194
  %exitcond30 = icmp eq i32 %139, %log.0.lcssa.i, !dbg !194
  br i1 %exitcond30, label %.loopexit, label %48, !dbg !194

.loopexit:                                        ; preds = %FFT_bitreverse.exit, %FFT_bitreverse.exit.preheader, %int_log2.exit, %0
  ret void, !dbg !233
}

; Function Attrs: nounwind uwtable
define void @FFT_inverse(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !40), !dbg !234
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !41), !dbg !234
  %1 = sdiv i32 %N, 2, !dbg !235
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !42), !dbg !235
  tail call void @llvm.dbg.value(metadata !199, i64 0, metadata !43), !dbg !236
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !44), !dbg !237
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 1), !dbg !238
  %2 = sitofp i32 %1 to double, !dbg !239
  %3 = fdiv double 1.000000e+00, %2, !dbg !239
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !43), !dbg !239
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !44), !dbg !240
  %4 = icmp sgt i32 %N, 0, !dbg !240
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge, !dbg !240

.lr.ph.preheader:                                 ; preds = %0
  %5 = add i32 %N, -1, !dbg !242
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !242
  %end.idx = add i64 %6, 1, !dbg !240
  %n.vec = and i64 %7, 8589934588, !dbg !240
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !240
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !240
  %8 = getelementptr inbounds double* %data, i64 %index, !dbg !242
  %9 = bitcast double* %8 to <2 x double>*, !dbg !242
  %wide.load = load <2 x double>* %9, align 8, !dbg !242
  %.sum8 = or i64 %index, 2, !dbg !242
  %10 = getelementptr double* %data, i64 %.sum8, !dbg !242
  %11 = bitcast double* %10 to <2 x double>*, !dbg !242
  %wide.load3 = load <2 x double>* %11, align 8, !dbg !242
  %12 = fmul <2 x double> %broadcast.splat5, %wide.load, !dbg !242
  %13 = fmul <2 x double> %broadcast.splat5, %wide.load3, !dbg !242
  %14 = bitcast double* %8 to <2 x double>*, !dbg !242
  store <2 x double> %12, <2 x double>* %14, align 8, !dbg !242
  %15 = bitcast double* %10 to <2 x double>*, !dbg !242
  store <2 x double> %13, <2 x double>* %15, align 8, !dbg !242
  %index.next = add i64 %index, 4, !dbg !240
  %16 = icmp eq i64 %index.next, %n.vec, !dbg !240
  br i1 %16, label %middle.block, label %vector.body, !dbg !240, !llvm.loop !243

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %17 = getelementptr inbounds double* %data, i64 %indvars.iv, !dbg !242
  %18 = load double* %17, align 8, !dbg !242, !tbaa !125
  %19 = fmul double %3, %18, !dbg !242
  store double %19, double* %17, align 8, !dbg !242, !tbaa !125
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !240
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !240
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !240
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !240, !llvm.loop !244

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret void, !dbg !245
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!92, !93}
!llvm.ident = !{!94}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FFT.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !34, metadata !38, metadata !45, metadata !85}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_num_flops", metadata !"FFT_num_flops", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32)* @FFT_num_flops, null, null, metadata !10, i32 14} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [FFT_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13}
!11 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 13]
!12 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 16]
!13 = metadata !{i32 786688, metadata !4, metadata !"logN", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logN] [line 17]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_bitreverse", metadata !"FFT_bitreverse", metadata !"", i32 105, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_bitreverse, null, null, metadata !18, i32 105} ; [ DW_TAG_subprogram ] [line 105] [def] [FFT_bitreverse]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !9, metadata !17}
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !28, metadata !29, metadata !30, metadata !33}
!19 = metadata !{i32 786689, metadata !14, metadata !"N", metadata !5, i32 16777321, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 105]
!20 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 33554537, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 105]
!21 = metadata !{i32 786688, metadata !14, metadata !"n", metadata !5, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 107]
!22 = metadata !{i32 786688, metadata !14, metadata !"nm1", metadata !5, i32 108, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 108]
!23 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 109]
!24 = metadata !{i32 786688, metadata !14, metadata !"j", metadata !5, i32 110, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 110]
!25 = metadata !{i32 786688, metadata !26, metadata !"ii", metadata !5, i32 114, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ii] [line 114]
!26 = metadata !{i32 786443, metadata !1, metadata !27, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!27 = metadata !{i32 786443, metadata !1, metadata !14, i32 111, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!28 = metadata !{i32 786688, metadata !26, metadata !"jj", metadata !5, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 117]
!29 = metadata !{i32 786688, metadata !26, metadata !"k", metadata !5, i32 120, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 120]
!30 = metadata !{i32 786688, metadata !31, metadata !"tmp_real", metadata !5, i32 123, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!31 = metadata !{i32 786443, metadata !1, metadata !32, i32 122, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!32 = metadata !{i32 786443, metadata !1, metadata !26, i32 122, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!33 = metadata !{i32 786688, metadata !31, metadata !"tmp_imag", metadata !5, i32 124, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform", metadata !"FFT_transform", metadata !"", i32 143, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_transform, null, null, metadata !35, i32 144} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [FFT_transform]
!35 = metadata !{metadata !36, metadata !37}
!36 = metadata !{i32 786689, metadata !34, metadata !"N", metadata !5, i32 16777359, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 143]
!37 = metadata !{i32 786689, metadata !34, metadata !"data", metadata !5, i32 33554575, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 143]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_inverse", metadata !"FFT_inverse", metadata !"", i32 149, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_inverse, null, null, metadata !39, i32 150} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [FFT_inverse]
!39 = metadata !{metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!40 = metadata !{i32 786689, metadata !38, metadata !"N", metadata !5, i32 16777365, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 149]
!41 = metadata !{i32 786689, metadata !38, metadata !"data", metadata !5, i32 33554581, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 149]
!42 = metadata !{i32 786688, metadata !38, metadata !"n", metadata !5, i32 151, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 151]
!43 = metadata !{i32 786688, metadata !38, metadata !"norm", metadata !5, i32 152, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [norm] [line 152]
!44 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 153, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 153]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform_internal", metadata !"FFT_transform_internal", metadata !"", i32 35, metadata !46, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, i32)* @FFT_transform_internal, null, null, metadata !48, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [FFT_transform_internal]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{null, metadata !9, metadata !17, metadata !9}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !69, metadata !70, metadata !71, metadata !72, metadata !76, metadata !77, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84}
!49 = metadata !{i32 786689, metadata !45, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!50 = metadata !{i32 786689, metadata !45, metadata !"data", metadata !5, i32 33554467, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 35]
!51 = metadata !{i32 786689, metadata !45, metadata !"direction", metadata !5, i32 50331683, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [direction] [line 35]
!52 = metadata !{i32 786688, metadata !45, metadata !"n", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 36]
!53 = metadata !{i32 786688, metadata !45, metadata !"bit", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bit] [line 37]
!54 = metadata !{i32 786688, metadata !45, metadata !"logn", metadata !5, i32 38, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logn] [line 38]
!55 = metadata !{i32 786688, metadata !45, metadata !"dual", metadata !5, i32 39, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dual] [line 39]
!56 = metadata !{i32 786688, metadata !57, metadata !"w_real", metadata !5, i32 53, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_real] [line 53]
!57 = metadata !{i32 786443, metadata !1, metadata !58, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!58 = metadata !{i32 786443, metadata !1, metadata !45, i32 52, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!59 = metadata !{i32 786688, metadata !57, metadata !"w_imag", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_imag] [line 54]
!60 = metadata !{i32 786688, metadata !57, metadata !"a", metadata !5, i32 55, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 55]
!61 = metadata !{i32 786688, metadata !57, metadata !"b", metadata !5, i32 56, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 56]
!62 = metadata !{i32 786688, metadata !57, metadata !"theta", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 58]
!63 = metadata !{i32 786688, metadata !57, metadata !"s", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 59]
!64 = metadata !{i32 786688, metadata !57, metadata !"t", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 60]
!65 = metadata !{i32 786688, metadata !57, metadata !"s2", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s2] [line 61]
!66 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !5, i32 64, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!67 = metadata !{i32 786443, metadata !1, metadata !68, i32 63, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!68 = metadata !{i32 786443, metadata !1, metadata !57, i32 63, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!69 = metadata !{i32 786688, metadata !67, metadata !"j", metadata !5, i32 65, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 65]
!70 = metadata !{i32 786688, metadata !67, metadata !"wd_real", metadata !5, i32 67, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 67]
!71 = metadata !{i32 786688, metadata !67, metadata !"wd_imag", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 68]
!72 = metadata !{i32 786688, metadata !73, metadata !"tmp_real", metadata !5, i32 80, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 80]
!73 = metadata !{i32 786443, metadata !1, metadata !74, i32 79, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!74 = metadata !{i32 786443, metadata !1, metadata !75, i32 77, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!75 = metadata !{i32 786443, metadata !1, metadata !57, i32 77, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!76 = metadata !{i32 786688, metadata !73, metadata !"tmp_imag", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 81]
!77 = metadata !{i32 786688, metadata !78, metadata !"i", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!78 = metadata !{i32 786443, metadata !1, metadata !79, i32 85, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!79 = metadata !{i32 786443, metadata !1, metadata !74, i32 85, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!80 = metadata !{i32 786688, metadata !78, metadata !"j", metadata !5, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 87]
!81 = metadata !{i32 786688, metadata !78, metadata !"z1_real", metadata !5, i32 89, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_real] [line 89]
!82 = metadata !{i32 786688, metadata !78, metadata !"z1_imag", metadata !5, i32 90, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_imag] [line 90]
!83 = metadata !{i32 786688, metadata !78, metadata !"wd_real", metadata !5, i32 92, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 92]
!84 = metadata !{i32 786688, metadata !78, metadata !"wd_imag", metadata !5, i32 93, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 93]
!85 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"int_log2", metadata !"int_log2", metadata !"", i32 22, metadata !86, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !88, i32 23} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [scope 23] [int_log2]
!86 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{metadata !9, metadata !9}
!88 = metadata !{metadata !89, metadata !90, metadata !91}
!89 = metadata !{i32 786689, metadata !85, metadata !"n", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 22]
!90 = metadata !{i32 786688, metadata !85, metadata !"k", metadata !5, i32 24, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 24]
!91 = metadata !{i32 786688, metadata !85, metadata !"log", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log] [line 25]
!92 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!93 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!94 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!95 = metadata !{i32 13, i32 0, metadata !4, null}
!96 = metadata !{i32 16, i32 0, metadata !4, null}
!97 = metadata !{i32 786689, metadata !85, metadata !"n", metadata !5, i32 16777238, metadata !9, i32 0, metadata !98} ; [ DW_TAG_arg_variable ] [n] [line 22]
!98 = metadata !{i32 17, i32 0, metadata !4, null}
!99 = metadata !{i32 22, i32 0, metadata !85, metadata !98}
!100 = metadata !{i32 1}
!101 = metadata !{i32 786688, metadata !85, metadata !"k", metadata !5, i32 24, metadata !9, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [k] [line 24]
!102 = metadata !{i32 24, i32 0, metadata !85, metadata !98}
!103 = metadata !{i32 0}
!104 = metadata !{i32 786688, metadata !85, metadata !"log", metadata !5, i32 25, metadata !9, i32 0, metadata !98} ; [ DW_TAG_auto_variable ] [log] [line 25]
!105 = metadata !{i32 25, i32 0, metadata !85, metadata !98}
!106 = metadata !{i32 26, i32 0, metadata !107, metadata !98}
!107 = metadata !{i32 786443, metadata !1, metadata !85, i32 26, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!108 = metadata !{i32 27, i32 0, metadata !109, metadata !98}
!109 = metadata !{i32 786443, metadata !1, metadata !85, i32 27, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!110 = metadata !{i32 29, i32 0, metadata !111, metadata !98}
!111 = metadata !{i32 786443, metadata !1, metadata !109, i32 28, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!112 = metadata !{i32 30, i32 0, metadata !111, metadata !98}
!113 = metadata !{i32 19, i32 0, metadata !4, null}
!114 = metadata !{i32 105, i32 0, metadata !14, null}
!115 = metadata !{i32 107, i32 0, metadata !14, null}
!116 = metadata !{i32 108, i32 0, metadata !14, null}
!117 = metadata !{i32 109, i32 0, metadata !14, null}
!118 = metadata !{i32 110, i32 0, metadata !14, null}
!119 = metadata !{i32 111, i32 0, metadata !27, null}
!120 = metadata !{i32 120, i32 0, metadata !26, null}
!121 = metadata !{i32 114, i32 0, metadata !26, null}
!122 = metadata !{i32 117, i32 0, metadata !26, null}
!123 = metadata !{i32 122, i32 0, metadata !32, null}
!124 = metadata !{i32 123, i32 0, metadata !31, null}
!125 = metadata !{metadata !126, metadata !126, i64 0}
!126 = metadata !{metadata !"double", metadata !127, i64 0}
!127 = metadata !{metadata !"omnipotent char", metadata !128, i64 0}
!128 = metadata !{metadata !"Simple C/C++ TBAA"}
!129 = metadata !{i32 124, i32 0, metadata !31, null}
!130 = metadata !{i32 125, i32 0, metadata !31, null}
!131 = metadata !{i32 126, i32 0, metadata !31, null}
!132 = metadata !{i32 127, i32 0, metadata !31, null}
!133 = metadata !{i32 128, i32 0, metadata !31, null}
!134 = metadata !{i32 130, i32 0, metadata !26, null}
!135 = metadata !{i32 133, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !26, i32 131, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!137 = metadata !{i32 136, i32 0, metadata !136, null}
!138 = metadata !{i32 138, i32 0, metadata !26, null}
!139 = metadata !{i32 140, i32 0, metadata !14, null}
!140 = metadata !{i32 143, i32 0, metadata !34, null}
!141 = metadata !{i32 145, i32 0, metadata !34, null}
!142 = metadata !{i32 146, i32 0, metadata !34, null}
!143 = metadata !{i32 35, i32 0, metadata !45, null}
!144 = metadata !{i32 36, i32 0, metadata !45, null}
!145 = metadata !{i32 37, i32 0, metadata !45, null}
!146 = metadata !{i32 39, i32 0, metadata !45, null}
!147 = metadata !{i32 41, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !45, i32 41, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!149 = metadata !{i32 786689, metadata !85, metadata !"n", metadata !5, i32 16777238, metadata !9, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [n] [line 22]
!150 = metadata !{i32 42, i32 0, metadata !45, null}
!151 = metadata !{i32 22, i32 0, metadata !85, metadata !150}
!152 = metadata !{i32 786688, metadata !85, metadata !"k", metadata !5, i32 24, metadata !9, i32 0, metadata !150} ; [ DW_TAG_auto_variable ] [k] [line 24]
!153 = metadata !{i32 24, i32 0, metadata !85, metadata !150}
!154 = metadata !{i32 786688, metadata !85, metadata !"log", metadata !5, i32 25, metadata !9, i32 0, metadata !150} ; [ DW_TAG_auto_variable ] [log] [line 25]
!155 = metadata !{i32 25, i32 0, metadata !85, metadata !150}
!156 = metadata !{i32 26, i32 0, metadata !107, metadata !150}
!157 = metadata !{i32 27, i32 0, metadata !109, metadata !150}
!158 = metadata !{i32 29, i32 0, metadata !111, metadata !150}
!159 = metadata !{i32 30, i32 0, metadata !111, metadata !150}
!160 = metadata !{i32 45, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !45, i32 45, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!162 = metadata !{i32 786689, metadata !14, metadata !"N", metadata !5, i32 16777321, metadata !9, i32 0, metadata !163} ; [ DW_TAG_arg_variable ] [N] [line 105]
!163 = metadata !{i32 48, i32 0, metadata !45, null}
!164 = metadata !{i32 105, i32 0, metadata !14, metadata !163}
!165 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 33554537, metadata !17, i32 0, metadata !163} ; [ DW_TAG_arg_variable ] [data] [line 105]
!166 = metadata !{i32 786688, metadata !14, metadata !"n", metadata !5, i32 107, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [n] [line 107]
!167 = metadata !{i32 107, i32 0, metadata !14, metadata !163}
!168 = metadata !{i32 108, i32 0, metadata !14, metadata !163}
!169 = metadata !{i32 786688, metadata !14, metadata !"nm1", metadata !5, i32 108, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [nm1] [line 108]
!170 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 109, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [i] [line 109]
!171 = metadata !{i32 109, i32 0, metadata !14, metadata !163}
!172 = metadata !{i32 786688, metadata !14, metadata !"j", metadata !5, i32 110, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [j] [line 110]
!173 = metadata !{i32 110, i32 0, metadata !14, metadata !163}
!174 = metadata !{i32 111, i32 0, metadata !27, metadata !163}
!175 = metadata !{i32 120, i32 0, metadata !26, metadata !163}
!176 = metadata !{i32 114, i32 0, metadata !26, metadata !163}
!177 = metadata !{i32 786688, metadata !26, metadata !"ii", metadata !5, i32 114, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [ii] [line 114]
!178 = metadata !{i32 117, i32 0, metadata !26, metadata !163}
!179 = metadata !{i32 786688, metadata !26, metadata !"jj", metadata !5, i32 117, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [jj] [line 117]
!180 = metadata !{i32 786688, metadata !26, metadata !"k", metadata !5, i32 120, metadata !9, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [k] [line 120]
!181 = metadata !{i32 122, i32 0, metadata !32, metadata !163}
!182 = metadata !{i32 123, i32 0, metadata !31, metadata !163}
!183 = metadata !{i32 786688, metadata !31, metadata !"tmp_real", metadata !5, i32 123, metadata !8, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!184 = metadata !{i32 124, i32 0, metadata !31, metadata !163}
!185 = metadata !{i32 786688, metadata !31, metadata !"tmp_imag", metadata !5, i32 124, metadata !8, i32 0, metadata !163} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!186 = metadata !{i32 125, i32 0, metadata !31, metadata !163}
!187 = metadata !{i32 126, i32 0, metadata !31, metadata !163}
!188 = metadata !{i32 127, i32 0, metadata !31, metadata !163}
!189 = metadata !{i32 128, i32 0, metadata !31, metadata !163}
!190 = metadata !{i32 130, i32 0, metadata !26, metadata !163}
!191 = metadata !{i32 133, i32 0, metadata !136, metadata !163}
!192 = metadata !{i32 136, i32 0, metadata !136, metadata !163}
!193 = metadata !{i32 138, i32 0, metadata !26, metadata !163}
!194 = metadata !{i32 52, i32 0, metadata !58, null}
!195 = metadata !{i32 58, i32 0, metadata !57, null} ; [ DW_TAG_imported_module ]
!196 = metadata !{i32 63, i32 0, metadata !68, null}
!197 = metadata !{double 1.000000e+00}
!198 = metadata !{i32 53, i32 0, metadata !57, null}
!199 = metadata !{double 0.000000e+00}
!200 = metadata !{i32 54, i32 0, metadata !57, null}
!201 = metadata !{i32 59, i32 0, metadata !57, null}
!202 = metadata !{i32 60, i32 0, metadata !57, null}
!203 = metadata !{i32 61, i32 0, metadata !57, null}
!204 = metadata !{i32 77, i32 0, metadata !75, null}
!205 = metadata !{i32 80, i32 0, metadata !73, null}
!206 = metadata !{metadata !206, metadata !207, metadata !208}
!207 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!208 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!209 = metadata !{i32 86, i32 0, metadata !78, null}
!210 = metadata !{i32 87, i32 0, metadata !78, null}
!211 = metadata !{i32 89, i32 0, metadata !78, null}
!212 = metadata !{i32 90, i32 0, metadata !78, null}
!213 = metadata !{i32 92, i32 0, metadata !78, null}
!214 = metadata !{i32 93, i32 0, metadata !78, null}
!215 = metadata !{i32 95, i32 0, metadata !78, null}
!216 = metadata !{i32 96, i32 0, metadata !78, null}
!217 = metadata !{i32 97, i32 0, metadata !78, null}
!218 = metadata !{i32 98, i32 0, metadata !78, null}
!219 = metadata !{i32 85, i32 0, metadata !79, null}
!220 = metadata !{i32 81, i32 0, metadata !73, null}
!221 = metadata !{i32 82, i32 0, metadata !73, null}
!222 = metadata !{i32 83, i32 0, metadata !73, null}
!223 = metadata !{i32 64, i32 0, metadata !67, null}
!224 = metadata !{i32 65, i32 0, metadata !67, null}
!225 = metadata !{i32 67, i32 0, metadata !67, null}
!226 = metadata !{i32 68, i32 0, metadata !67, null}
!227 = metadata !{i32 70, i32 0, metadata !67, null}
!228 = metadata !{i32 71, i32 0, metadata !67, null}
!229 = metadata !{i32 72, i32 0, metadata !67, null}
!230 = metadata !{i32 73, i32 0, metadata !67, null}
!231 = metadata !{double undef}
!232 = metadata !{metadata !232, metadata !207, metadata !208}
!233 = metadata !{i32 102, i32 0, metadata !45, null}
!234 = metadata !{i32 149, i32 0, metadata !38, null}
!235 = metadata !{i32 151, i32 0, metadata !38, null}
!236 = metadata !{i32 152, i32 0, metadata !38, null}
!237 = metadata !{i32 153, i32 0, metadata !38, null}
!238 = metadata !{i32 154, i32 0, metadata !38, null}
!239 = metadata !{i32 159, i32 0, metadata !38, null}
!240 = metadata !{i32 160, i32 0, metadata !241, null}
!241 = metadata !{i32 786443, metadata !1, metadata !38, i32 160, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!242 = metadata !{i32 161, i32 0, metadata !241, null}
!243 = metadata !{metadata !243, metadata !207, metadata !208}
!244 = metadata !{metadata !244, metadata !207, metadata !208}
!245 = metadata !{i32 163, i32 0, metadata !38, null}
