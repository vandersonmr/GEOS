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
  %lftr.wideiv28 = trunc i64 %indvars.iv.next.i to i32, !dbg !174
  %exitcond29 = icmp eq i32 %lftr.wideiv28, %15, !dbg !174
  br i1 %exitcond29, label %FFT_bitreverse.exit.preheader, label %18, !dbg !174

FFT_bitreverse.exit.preheader:                    ; preds = %._crit_edge.i7, %14
  %43 = icmp sgt i32 %log.0.lcssa.i, 0, !dbg !194
  br i1 %43, label %.lr.ph20, label %.loopexit, !dbg !194

.lr.ph20:                                         ; preds = %FFT_bitreverse.exit.preheader
  %44 = sitofp i32 %direction to double, !dbg !195
  %45 = fmul double %44, 2.000000e+00, !dbg !195
  %46 = fmul double %45, 0x400921FB54442D18, !dbg !195
  %47 = icmp sgt i32 %N, 1, !dbg !196
  br label %48, !dbg !194

; <label>:48                                      ; preds = %FFT_bitreverse.exit, %.lr.ph20
  %bit.019 = phi i32 [ 0, %.lr.ph20 ], [ %135, %FFT_bitreverse.exit ]
  %dual.018 = phi i32 [ 1, %.lr.ph20 ], [ %136, %FFT_bitreverse.exit ]
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
  br label %64, !dbg !196

.preheader:                                       ; preds = %64, %48
  %60 = icmp sgt i32 %dual.018, 1, !dbg !204
  br i1 %60, label %.lr.ph16, label %FFT_bitreverse.exit, !dbg !204

.lr.ph16:                                         ; preds = %.preheader
  %61 = shl i32 %dual.018, 1, !dbg !204
  %62 = sext i32 %61 to i64
  %63 = zext i32 %dual.018 to i64, !dbg !204
  br label %92, !dbg !204

; <label>:64                                      ; preds = %.lr.ph, %64
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %64 ]
  %65 = trunc i64 %indvars.iv to i32, !dbg !205
  %66 = shl nsw i32 %65, 1, !dbg !205
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !66), !dbg !205
  %67 = add nsw i64 %indvars.iv, %59, !dbg !206
  %68 = trunc i64 %67 to i32, !dbg !206
  %69 = shl nsw i32 %68, 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !69), !dbg !206
  %70 = sext i32 %69 to i64, !dbg !207
  %71 = getelementptr inbounds double* %data, i64 %70, !dbg !207
  %72 = load double* %71, align 8, !dbg !207, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !70), !dbg !207
  %73 = or i32 %69, 1, !dbg !208
  %74 = sext i32 %73 to i64, !dbg !208
  %75 = getelementptr inbounds double* %data, i64 %74, !dbg !208
  %76 = load double* %75, align 8, !dbg !208, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !71), !dbg !208
  %77 = sext i32 %66 to i64, !dbg !209
  %78 = getelementptr inbounds double* %data, i64 %77, !dbg !209
  %79 = load double* %78, align 8, !dbg !209, !tbaa !125
  %80 = fsub double %79, %72, !dbg !209
  store double %80, double* %71, align 8, !dbg !209, !tbaa !125
  %81 = or i32 %66, 1, !dbg !210
  %82 = sext i32 %81 to i64, !dbg !210
  %83 = getelementptr inbounds double* %data, i64 %82, !dbg !210
  %84 = load double* %83, align 8, !dbg !210, !tbaa !125
  %85 = fsub double %84, %76, !dbg !210
  store double %85, double* %75, align 8, !dbg !210, !tbaa !125
  %86 = load double* %78, align 8, !dbg !211, !tbaa !125
  %87 = fadd double %72, %86, !dbg !211
  store double %87, double* %78, align 8, !dbg !211, !tbaa !125
  %88 = load double* %83, align 8, !dbg !212, !tbaa !125
  %89 = fadd double %76, %88, !dbg !212
  store double %89, double* %83, align 8, !dbg !212, !tbaa !125
  %indvars.iv.next = add nsw i64 %indvars.iv, %58, !dbg !196
  %90 = trunc i64 %indvars.iv.next to i32, !dbg !196
  %91 = icmp slt i32 %90, %1, !dbg !196
  br i1 %91, label %64, label %.preheader, !dbg !196

; <label>:92                                      ; preds = %._crit_edge, %.lr.ph16
  %indvars.iv25 = phi i64 [ 1, %.lr.ph16 ], [ %indvars.iv.next26, %._crit_edge ]
  %w_real.015 = phi double [ 1.000000e+00, %.lr.ph16 ], [ %96, %._crit_edge ]
  %w_imag.014 = phi double [ 0.000000e+00, %.lr.ph16 ], [ %100, %._crit_edge ]
  %93 = fmul double %52, %w_imag.014, !dbg !213
  %94 = fsub double %w_real.015, %93, !dbg !213
  %95 = fmul double %56, %w_real.015, !dbg !213
  %96 = fsub double %94, %95, !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !72), !dbg !213
  %97 = fmul double %52, %w_real.015, !dbg !214
  %98 = fadd double %w_imag.014, %97, !dbg !214
  %99 = fmul double %56, %w_imag.014, !dbg !214
  %100 = fsub double %98, %99, !dbg !214
  tail call void @llvm.dbg.value(metadata !{double %100}, i64 0, metadata !76), !dbg !214
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !56), !dbg !215
  tail call void @llvm.dbg.value(metadata !{double %100}, i64 0, metadata !59), !dbg !216
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !61), !dbg !217
  br i1 %47, label %.lr.ph12, label %._crit_edge, !dbg !217

.lr.ph12:                                         ; preds = %92, %.lr.ph12
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %.lr.ph12 ], [ 0, %92 ]
  %101 = add nsw i64 %indvars.iv23, %indvars.iv25, !dbg !218
  %102 = trunc i64 %101 to i32, !dbg !218
  %103 = shl nsw i32 %102, 1, !dbg !218
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !77), !dbg !218
  %104 = add nsw i64 %101, %63, !dbg !219
  %105 = trunc i64 %104 to i32, !dbg !219
  %106 = shl nsw i32 %105, 1, !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %106}, i64 0, metadata !80), !dbg !219
  %107 = sext i32 %106 to i64, !dbg !220
  %108 = getelementptr inbounds double* %data, i64 %107, !dbg !220
  %109 = load double* %108, align 8, !dbg !220, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !81), !dbg !220
  %110 = or i32 %106, 1, !dbg !221
  %111 = sext i32 %110 to i64, !dbg !221
  %112 = getelementptr inbounds double* %data, i64 %111, !dbg !221
  %113 = load double* %112, align 8, !dbg !221, !tbaa !125
  tail call void @llvm.dbg.value(metadata !{double %113}, i64 0, metadata !82), !dbg !221
  %114 = fmul double %96, %109, !dbg !222
  %115 = fmul double %100, %113, !dbg !222
  %116 = fsub double %114, %115, !dbg !222
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !83), !dbg !222
  %117 = fmul double %96, %113, !dbg !223
  %118 = fmul double %100, %109, !dbg !223
  %119 = fadd double %118, %117, !dbg !223
  tail call void @llvm.dbg.value(metadata !{double %119}, i64 0, metadata !84), !dbg !223
  %120 = sext i32 %103 to i64, !dbg !224
  %121 = getelementptr inbounds double* %data, i64 %120, !dbg !224
  %122 = load double* %121, align 8, !dbg !224, !tbaa !125
  %123 = fsub double %122, %116, !dbg !224
  store double %123, double* %108, align 8, !dbg !224, !tbaa !125
  %124 = or i32 %103, 1, !dbg !225
  %125 = sext i32 %124 to i64, !dbg !225
  %126 = getelementptr inbounds double* %data, i64 %125, !dbg !225
  %127 = load double* %126, align 8, !dbg !225, !tbaa !125
  %128 = fsub double %127, %119, !dbg !225
  store double %128, double* %112, align 8, !dbg !225, !tbaa !125
  %129 = load double* %121, align 8, !dbg !226, !tbaa !125
  %130 = fadd double %116, %129, !dbg !226
  store double %130, double* %121, align 8, !dbg !226, !tbaa !125
  %131 = load double* %126, align 8, !dbg !227, !tbaa !125
  %132 = fadd double %119, %131, !dbg !227
  store double %132, double* %126, align 8, !dbg !227, !tbaa !125
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, %62, !dbg !217
  %133 = trunc i64 %indvars.iv.next24 to i32, !dbg !217
  %134 = icmp slt i32 %133, %1, !dbg !217
  br i1 %134, label %.lr.ph12, label %._crit_edge, !dbg !217

._crit_edge:                                      ; preds = %.lr.ph12, %92
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1, !dbg !204
  %lftr.wideiv = trunc i64 %indvars.iv.next26 to i32, !dbg !204
  %exitcond = icmp eq i32 %lftr.wideiv, %dual.018, !dbg !204
  br i1 %exitcond, label %FFT_bitreverse.exit, label %92, !dbg !204

FFT_bitreverse.exit:                              ; preds = %._crit_edge, %.preheader
  %135 = add nsw i32 %bit.019, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %135}, i64 0, metadata !53), !dbg !194
  %136 = shl nsw i32 %dual.018, 1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %136}, i64 0, metadata !55), !dbg !194
  %exitcond27 = icmp eq i32 %135, %log.0.lcssa.i, !dbg !194
  br i1 %exitcond27, label %.loopexit, label %48, !dbg !194

.loopexit:                                        ; preds = %FFT_bitreverse.exit, %FFT_bitreverse.exit.preheader, %int_log2.exit, %0
  ret void, !dbg !228
}

; Function Attrs: nounwind uwtable
define void @FFT_inverse(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !40), !dbg !229
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !41), !dbg !229
  %1 = sdiv i32 %N, 2, !dbg !230
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !42), !dbg !230
  tail call void @llvm.dbg.value(metadata !199, i64 0, metadata !43), !dbg !231
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !44), !dbg !232
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 1), !dbg !233
  %2 = sitofp i32 %1 to double, !dbg !234
  %3 = fdiv double 1.000000e+00, %2, !dbg !234
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !43), !dbg !234
  tail call void @llvm.dbg.value(metadata !103, i64 0, metadata !44), !dbg !235
  %4 = icmp sgt i32 %N, 0, !dbg !235
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge, !dbg !235

.lr.ph.preheader:                                 ; preds = %0
  %5 = add i32 %N, -1, !dbg !237
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !237
  %end.idx = add i64 %6, 1, !dbg !235
  %n.vec = and i64 %7, 8589934588, !dbg !235
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !235
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !235
  %8 = getelementptr inbounds double* %data, i64 %index, !dbg !237
  %9 = bitcast double* %8 to <2 x double>*, !dbg !237
  %wide.load = load <2 x double>* %9, align 8, !dbg !237
  %.sum8 = or i64 %index, 2, !dbg !237
  %10 = getelementptr double* %data, i64 %.sum8, !dbg !237
  %11 = bitcast double* %10 to <2 x double>*, !dbg !237
  %wide.load3 = load <2 x double>* %11, align 8, !dbg !237
  %12 = fmul <2 x double> %broadcast.splat5, %wide.load, !dbg !237
  %13 = fmul <2 x double> %broadcast.splat5, %wide.load3, !dbg !237
  %14 = bitcast double* %8 to <2 x double>*, !dbg !237
  store <2 x double> %12, <2 x double>* %14, align 8, !dbg !237
  %15 = bitcast double* %10 to <2 x double>*, !dbg !237
  store <2 x double> %13, <2 x double>* %15, align 8, !dbg !237
  %index.next = add i64 %index, 4, !dbg !235
  %16 = icmp eq i64 %index.next, %n.vec, !dbg !235
  br i1 %16, label %middle.block, label %vector.body, !dbg !235, !llvm.loop !238

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val, %middle.block ]
  %17 = getelementptr inbounds double* %data, i64 %indvars.iv, !dbg !237
  %18 = load double* %17, align 8, !dbg !237, !tbaa !125
  %19 = fmul double %3, %18, !dbg !237
  store double %19, double* %17, align 8, !dbg !237, !tbaa !125
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !235
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !235
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !235
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !235, !llvm.loop !241

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret void, !dbg !242
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
!205 = metadata !{i32 64, i32 0, metadata !67, null}
!206 = metadata !{i32 65, i32 0, metadata !67, null}
!207 = metadata !{i32 67, i32 0, metadata !67, null}
!208 = metadata !{i32 68, i32 0, metadata !67, null}
!209 = metadata !{i32 70, i32 0, metadata !67, null}
!210 = metadata !{i32 71, i32 0, metadata !67, null}
!211 = metadata !{i32 72, i32 0, metadata !67, null}
!212 = metadata !{i32 73, i32 0, metadata !67, null}
!213 = metadata !{i32 80, i32 0, metadata !73, null}
!214 = metadata !{i32 81, i32 0, metadata !73, null}
!215 = metadata !{i32 82, i32 0, metadata !73, null}
!216 = metadata !{i32 83, i32 0, metadata !73, null}
!217 = metadata !{i32 85, i32 0, metadata !79, null}
!218 = metadata !{i32 86, i32 0, metadata !78, null}
!219 = metadata !{i32 87, i32 0, metadata !78, null}
!220 = metadata !{i32 89, i32 0, metadata !78, null}
!221 = metadata !{i32 90, i32 0, metadata !78, null}
!222 = metadata !{i32 92, i32 0, metadata !78, null}
!223 = metadata !{i32 93, i32 0, metadata !78, null}
!224 = metadata !{i32 95, i32 0, metadata !78, null}
!225 = metadata !{i32 96, i32 0, metadata !78, null}
!226 = metadata !{i32 97, i32 0, metadata !78, null}
!227 = metadata !{i32 98, i32 0, metadata !78, null}
!228 = metadata !{i32 102, i32 0, metadata !45, null}
!229 = metadata !{i32 149, i32 0, metadata !38, null}
!230 = metadata !{i32 151, i32 0, metadata !38, null}
!231 = metadata !{i32 152, i32 0, metadata !38, null}
!232 = metadata !{i32 153, i32 0, metadata !38, null}
!233 = metadata !{i32 154, i32 0, metadata !38, null}
!234 = metadata !{i32 159, i32 0, metadata !38, null}
!235 = metadata !{i32 160, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !38, i32 160, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!237 = metadata !{i32 161, i32 0, metadata !236, null}
!238 = metadata !{metadata !238, metadata !239, metadata !240}
!239 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!240 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!241 = metadata !{metadata !241, metadata !239, metadata !240}
!242 = metadata !{i32 163, i32 0, metadata !38, null}
