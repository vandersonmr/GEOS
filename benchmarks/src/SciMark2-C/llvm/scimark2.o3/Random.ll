; ModuleID = 'Random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

@dm1 = internal unnamed_addr global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define noalias %struct.Random_struct* @new_Random_seed(i32 %seed) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !27), !dbg !92
  %1 = tail call noalias i8* @malloc(i64 112) #3, !dbg !93
  %2 = bitcast i8* %1 to %struct.Random_struct*, !dbg !93
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !28), !dbg !93
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !94), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !97), !dbg !96
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !98, !tbaa !99
  %3 = getelementptr inbounds i8* %1, i64 68, !dbg !103
  %4 = bitcast i8* %3 to i32*, !dbg !103
  store i32 %seed, i32* %4, align 4, !dbg !103, !tbaa !104
  %5 = icmp slt i32 %seed, 0, !dbg !107
  %6 = sub nsw i32 0, %seed, !dbg !107
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !97), !dbg !107
  %.seed.i = select i1 %5, i32 %6, i32 %seed, !dbg !107
  tail call void @llvm.dbg.value(metadata !{i32 %.seed.i}, i64 0, metadata !109), !dbg !110
  %7 = and i32 %.seed.i, 1, !dbg !111
  %sext.i = add i32 %.seed.i, -1, !dbg !111
  %jseed.0.i = add i32 %sext.i, %7, !dbg !111
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !114), !dbg !115
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !117), !dbg !118
  %8 = srem i32 %jseed.0.i, 65536, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !120), !dbg !119
  %9 = sdiv i32 %jseed.0.i, 65536, !dbg !121
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !122), !dbg !121
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !123), !dbg !124
  br label %10, !dbg !124

; <label>:10                                      ; preds = %10, %0
  %indvars.iv.i = phi i64 [ 0, %0 ], [ %indvars.iv.next.i, %10 ]
  %j1.02.i = phi i32 [ %9, %0 ], [ %15, %10 ]
  %j0.01.i = phi i32 [ %8, %0 ], [ %16, %10 ]
  %11 = mul nsw i32 %j0.01.i, 9069, !dbg !126
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !109), !dbg !126
  %12 = sdiv i32 %11, 65536, !dbg !128
  %13 = mul nsw i32 %j1.02.i, 9069, !dbg !128
  %14 = add nsw i32 %12, %13, !dbg !128
  %15 = srem i32 %14, 32768, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !122), !dbg !128
  %16 = srem i32 %11, 65536, !dbg !129
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !120), !dbg !129
  %17 = shl i32 %15, 16, !dbg !130
  %18 = add nsw i32 %16, %17, !dbg !130
  %19 = getelementptr inbounds %struct.Random_struct* %2, i64 0, i32 0, i64 %indvars.iv.i, !dbg !130
  store i32 %18, i32* %19, align 4, !dbg !130, !tbaa !131
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !124
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 17, !dbg !124
  br i1 %exitcond.i, label %initialize.exit, label %10, !dbg !124

initialize.exit:                                  ; preds = %10
  %20 = getelementptr inbounds i8* %1, i64 72, !dbg !132
  %21 = bitcast i8* %20 to i32*, !dbg !132
  store i32 4, i32* %21, align 4, !dbg !132, !tbaa !133
  %22 = getelementptr inbounds i8* %1, i64 76, !dbg !134
  %23 = bitcast i8* %22 to i32*, !dbg !134
  store i32 16, i32* %23, align 4, !dbg !134, !tbaa !135
  %24 = getelementptr inbounds i8* %1, i64 88, !dbg !136
  %25 = bitcast i8* %24 to double*, !dbg !136
  store double 0.000000e+00, double* %25, align 8, !dbg !136, !tbaa !137
  %26 = getelementptr inbounds i8* %1, i64 96, !dbg !138
  %27 = bitcast i8* %26 to double*, !dbg !138
  store double 1.000000e+00, double* %27, align 8, !dbg !138, !tbaa !139
  %28 = getelementptr inbounds i8* %1, i64 104, !dbg !140
  %29 = bitcast i8* %28 to double*, !dbg !140
  store double 1.000000e+00, double* %29, align 8, !dbg !140, !tbaa !141
  %30 = getelementptr inbounds i8* %1, i64 80, !dbg !142
  %31 = bitcast i8* %30 to i32*, !dbg !142
  store i32 0, i32* %31, align 4, !dbg !142, !tbaa !143
  ret %struct.Random_struct* %2, !dbg !144
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Random_struct* @new_Random(i32 %seed, double %left, double %right) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !33), !dbg !145
  tail call void @llvm.dbg.value(metadata !{double %left}, i64 0, metadata !34), !dbg !145
  tail call void @llvm.dbg.value(metadata !{double %right}, i64 0, metadata !35), !dbg !145
  %1 = tail call noalias i8* @malloc(i64 112) #3, !dbg !146
  %2 = bitcast i8* %1 to %struct.Random_struct*, !dbg !146
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !36), !dbg !146
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %2}, i64 0, metadata !147), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32 %seed}, i64 0, metadata !150), !dbg !149
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !151, !tbaa !99
  %3 = getelementptr inbounds i8* %1, i64 68, !dbg !152
  %4 = bitcast i8* %3 to i32*, !dbg !152
  store i32 %seed, i32* %4, align 4, !dbg !152, !tbaa !104
  %5 = icmp slt i32 %seed, 0, !dbg !153
  %6 = sub nsw i32 0, %seed, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !150), !dbg !153
  %.seed.i = select i1 %5, i32 %6, i32 %seed, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32 %.seed.i}, i64 0, metadata !154), !dbg !155
  %7 = and i32 %.seed.i, 1, !dbg !156
  %sext.i = add i32 %.seed.i, -1, !dbg !156
  %jseed.0.i = add i32 %sext.i, %7, !dbg !156
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !157), !dbg !158
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !159), !dbg !160
  %8 = srem i32 %jseed.0.i, 65536, !dbg !161
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !162), !dbg !161
  %9 = sdiv i32 %jseed.0.i, 65536, !dbg !163
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !164), !dbg !163
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !165), !dbg !166
  br label %10, !dbg !166

; <label>:10                                      ; preds = %10, %0
  %indvars.iv.i = phi i64 [ 0, %0 ], [ %indvars.iv.next.i, %10 ]
  %j1.02.i = phi i32 [ %9, %0 ], [ %15, %10 ]
  %j0.01.i = phi i32 [ %8, %0 ], [ %16, %10 ]
  %11 = mul nsw i32 %j0.01.i, 9069, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !154), !dbg !167
  %12 = sdiv i32 %11, 65536, !dbg !168
  %13 = mul nsw i32 %j1.02.i, 9069, !dbg !168
  %14 = add nsw i32 %12, %13, !dbg !168
  %15 = srem i32 %14, 32768, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !164), !dbg !168
  %16 = srem i32 %11, 65536, !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !162), !dbg !169
  %17 = shl i32 %15, 16, !dbg !170
  %18 = add nsw i32 %16, %17, !dbg !170
  %19 = getelementptr inbounds %struct.Random_struct* %2, i64 0, i32 0, i64 %indvars.iv.i, !dbg !170
  store i32 %18, i32* %19, align 4, !dbg !170, !tbaa !131
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !166
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 17, !dbg !166
  br i1 %exitcond.i, label %initialize.exit, label %10, !dbg !166

initialize.exit:                                  ; preds = %10
  %20 = getelementptr inbounds i8* %1, i64 72, !dbg !171
  %21 = bitcast i8* %20 to i32*, !dbg !171
  store i32 4, i32* %21, align 4, !dbg !171, !tbaa !133
  %22 = getelementptr inbounds i8* %1, i64 76, !dbg !172
  %23 = bitcast i8* %22 to i32*, !dbg !172
  store i32 16, i32* %23, align 4, !dbg !172, !tbaa !135
  %24 = getelementptr inbounds i8* %1, i64 88, !dbg !173
  %25 = bitcast i8* %24 to double*, !dbg !173
  store double %left, double* %25, align 8, !dbg !173, !tbaa !137
  %26 = getelementptr inbounds i8* %1, i64 96, !dbg !174
  %27 = bitcast i8* %26 to double*, !dbg !174
  store double %right, double* %27, align 8, !dbg !174, !tbaa !139
  %28 = fsub double %right, %left, !dbg !175
  %29 = getelementptr inbounds i8* %1, i64 104, !dbg !175
  %30 = bitcast i8* %29 to double*, !dbg !175
  store double %28, double* %30, align 8, !dbg !175, !tbaa !141
  %31 = getelementptr inbounds i8* %1, i64 80, !dbg !176
  %32 = bitcast i8* %31 to i32*, !dbg !176
  store i32 1, i32* %32, align 4, !dbg !176, !tbaa !143
  ret %struct.Random_struct* %2, !dbg !177
}

; Function Attrs: nounwind uwtable
define void @Random_delete(%struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !41), !dbg !178
  %1 = bitcast %struct.Random_struct* %R to i8*, !dbg !179
  tail call void @free(i8* %1) #3, !dbg !179
  ret void, !dbg !180
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define double @Random_nextDouble(%struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !46), !dbg !181
  %1 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !182
  %2 = load i32* %1, align 4, !dbg !182, !tbaa !133
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !48), !dbg !182
  %3 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !183
  %4 = load i32* %3, align 4, !dbg !183, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !49), !dbg !183
  %5 = sext i32 %2 to i64, !dbg !184
  %6 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %5, !dbg !184
  %7 = load i32* %6, align 4, !dbg !184, !tbaa !131
  %8 = sext i32 %4 to i64, !dbg !184
  %9 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %8, !dbg !184
  %10 = load i32* %9, align 4, !dbg !184, !tbaa !131
  %11 = sub nsw i32 %7, %10, !dbg !184
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !47), !dbg !184
  %12 = icmp slt i32 %11, 0, !dbg !185
  %13 = add nsw i32 %11, 2147483647, !dbg !185
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !47), !dbg !185
  %. = select i1 %12, i32 %13, i32 %11, !dbg !185
  store i32 %., i32* %9, align 4, !dbg !187, !tbaa !131
  %14 = icmp eq i32 %2, 0, !dbg !188
  %15 = add nsw i32 %2, -1, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !48), !dbg !190
  %I.0 = select i1 %14, i32 16, i32 %15, !dbg !188
  store i32 %I.0, i32* %1, align 4, !dbg !191, !tbaa !133
  %16 = icmp eq i32 %4, 0, !dbg !192
  %17 = add nsw i32 %4, -1, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !49), !dbg !194
  %J.0 = select i1 %16, i32 16, i32 %17, !dbg !192
  store i32 %J.0, i32* %3, align 4, !dbg !195, !tbaa !135
  %18 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !196
  %19 = load i32* %18, align 4, !dbg !196, !tbaa !143
  %20 = icmp eq i32 %19, 0, !dbg !196
  br i1 %20, label %31, label %21, !dbg !196

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !198
  %23 = load double* %22, align 8, !dbg !198, !tbaa !137
  %24 = load double* @dm1, align 8, !dbg !198, !tbaa !99
  %25 = sitofp i32 %. to double, !dbg !198
  %26 = fmul double %25, %24, !dbg !198
  %27 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !198
  %28 = load double* %27, align 8, !dbg !198, !tbaa !141
  %29 = fmul double %26, %28, !dbg !198
  %30 = fadd double %23, %29, !dbg !198
  br label %35, !dbg !198

; <label>:31                                      ; preds = %0
  %32 = load double* @dm1, align 8, !dbg !199, !tbaa !99
  %33 = sitofp i32 %. to double, !dbg !199
  %34 = fmul double %33, %32, !dbg !199
  br label %35, !dbg !199

; <label>:35                                      ; preds = %31, %21
  %.0 = phi double [ %30, %21 ], [ %34, %31 ]
  ret double %.0, !dbg !200
}

; Function Attrs: nounwind uwtable
define noalias double* @RandomVector(i32 %N, %struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !57), !dbg !201
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !58), !dbg !201
  %1 = sext i32 %N to i64, !dbg !202
  %2 = shl nsw i64 %1, 3, !dbg !202
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !202
  %4 = bitcast i8* %3 to double*, !dbg !202
  tail call void @llvm.dbg.value(metadata !{double* %4}, i64 0, metadata !60), !dbg !202
  tail call void @llvm.dbg.value(metadata !116, i64 0, metadata !59), !dbg !203
  %5 = icmp sgt i32 %N, 0, !dbg !203
  br i1 %5, label %.lr.ph, label %._crit_edge, !dbg !203

.lr.ph:                                           ; preds = %0
  %6 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !205
  %7 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !207
  %8 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !208
  %9 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !209
  %10 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !209
  %.pre = load i32* %6, align 4, !dbg !205, !tbaa !133
  %.pre2 = load i32* %7, align 4, !dbg !207, !tbaa !135
  br label %11, !dbg !203

; <label>:11                                      ; preds = %Random_nextDouble.exit, %.lr.ph
  %12 = phi i32 [ %.pre2, %.lr.ph ], [ %J.0.i, %Random_nextDouble.exit ], !dbg !210
  %13 = phi i32 [ %.pre, %.lr.ph ], [ %I.0.i, %Random_nextDouble.exit ], !dbg !210
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %Random_nextDouble.exit ]
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !211), !dbg !210
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !212), !dbg !205
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !213), !dbg !207
  %14 = sext i32 %13 to i64, !dbg !214
  %15 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %14, !dbg !214
  %16 = load i32* %15, align 4, !dbg !214, !tbaa !131
  %17 = sext i32 %12 to i64, !dbg !214
  %18 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %17, !dbg !214
  %19 = load i32* %18, align 4, !dbg !214, !tbaa !131
  %20 = sub nsw i32 %16, %19, !dbg !214
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !215), !dbg !214
  %21 = icmp slt i32 %20, 0, !dbg !216
  %22 = add nsw i32 %20, 2147483647, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !215), !dbg !216
  %..i = select i1 %21, i32 %22, i32 %20, !dbg !216
  store i32 %..i, i32* %18, align 4, !dbg !217, !tbaa !131
  %23 = icmp eq i32 %13, 0, !dbg !218
  %24 = add nsw i32 %13, -1, !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !212), !dbg !219
  %I.0.i = select i1 %23, i32 16, i32 %24, !dbg !218
  store i32 %I.0.i, i32* %6, align 4, !dbg !220, !tbaa !133
  %25 = icmp eq i32 %12, 0, !dbg !221
  %26 = add nsw i32 %12, -1, !dbg !222
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !213), !dbg !222
  %J.0.i = select i1 %25, i32 16, i32 %26, !dbg !221
  store i32 %J.0.i, i32* %7, align 4, !dbg !223, !tbaa !135
  %27 = load i32* %8, align 4, !dbg !208, !tbaa !143
  %28 = icmp eq i32 %27, 0, !dbg !208
  br i1 %28, label %37, label %29, !dbg !208

; <label>:29                                      ; preds = %11
  %30 = load double* %9, align 8, !dbg !209, !tbaa !137
  %31 = load double* @dm1, align 8, !dbg !209, !tbaa !99
  %32 = sitofp i32 %..i to double, !dbg !209
  %33 = fmul double %32, %31, !dbg !209
  %34 = load double* %10, align 8, !dbg !209, !tbaa !141
  %35 = fmul double %33, %34, !dbg !209
  %36 = fadd double %30, %35, !dbg !209
  br label %Random_nextDouble.exit, !dbg !209

; <label>:37                                      ; preds = %11
  %38 = load double* @dm1, align 8, !dbg !224, !tbaa !99
  %39 = sitofp i32 %..i to double, !dbg !224
  %40 = fmul double %39, %38, !dbg !224
  br label %Random_nextDouble.exit, !dbg !224

Random_nextDouble.exit:                           ; preds = %29, %37
  %.0.i = phi double [ %36, %29 ], [ %40, %37 ]
  %41 = getelementptr inbounds double* %4, i64 %indvars.iv, !dbg !206
  store double %.0.i, double* %41, align 8, !dbg !206, !tbaa !99
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !203
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !203
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !203
  br i1 %exitcond, label %._crit_edge, label %11, !dbg !203

._crit_edge:                                      ; preds = %Random_nextDouble.exit, %0
  ret double* %4, !dbg !225
}

; Function Attrs: nounwind uwtable
define noalias double** @RandomMatrix(i32 %M, i32 %N, %struct.Random_struct* nocapture %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !66), !dbg !226
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !67), !dbg !226
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !68), !dbg !226
  %1 = sext i32 %M to i64, !dbg !227
  %2 = shl nsw i64 %1, 3, !dbg !227
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !227
  %4 = bitcast i8* %3 to double**, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double** %4}, i64 0, metadata !71), !dbg !227
  %5 = icmp eq i8* %3, null, !dbg !228
  br i1 %5, label %.loopexit, label %.preheader1, !dbg !228

.preheader1:                                      ; preds = %0
  %6 = icmp sgt i32 %M, 0, !dbg !230
  br i1 %6, label %.lr.ph4, label %.loopexit, !dbg !230

.lr.ph4:                                          ; preds = %.preheader1
  %7 = sext i32 %N to i64, !dbg !232
  %8 = shl nsw i64 %7, 3, !dbg !232
  %9 = icmp sgt i32 %N, 0, !dbg !234
  %10 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 2, !dbg !236
  %11 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 3, !dbg !238
  %12 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 4, !dbg !239
  %13 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 5, !dbg !240
  %14 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 7, !dbg !240
  br i1 %9, label %.lr.ph4.split.us, label %.lr.ph4..lr.ph4.split_crit_edge

.lr.ph4.split.us:                                 ; preds = %.lr.ph4, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.lr.ph4 ]
  %15 = tail call noalias i8* @malloc(i64 %8) #3, !dbg !232
  %16 = bitcast i8* %15 to double*, !dbg !232
  %17 = getelementptr inbounds double** %4, i64 %indvars.iv7, !dbg !232
  store double* %16, double** %17, align 8, !dbg !232, !tbaa !241
  %18 = icmp eq i8* %15, null, !dbg !243
  br i1 %18, label %.us-lcssa.us, label %.lr.ph.us, !dbg !243

._crit_edge.us:                                   ; preds = %Random_nextDouble.exit.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !230
  %19 = trunc i64 %indvars.iv.next8 to i32, !dbg !230
  %20 = icmp slt i32 %19, %M, !dbg !230
  br i1 %20, label %.lr.ph4.split.us, label %.loopexit, !dbg !230

.lr.ph.us:                                        ; preds = %.lr.ph4.split.us, %Random_nextDouble.exit.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %Random_nextDouble.exit.us ], [ 0, %.lr.ph4.split.us ]
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !245), !dbg !246
  %21 = load i32* %10, align 4, !dbg !236, !tbaa !133
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !247), !dbg !236
  %22 = load i32* %11, align 4, !dbg !238, !tbaa !135
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !248), !dbg !238
  %23 = sext i32 %21 to i64, !dbg !249
  %24 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %23, !dbg !249
  %25 = load i32* %24, align 4, !dbg !249, !tbaa !131
  %26 = sext i32 %22 to i64, !dbg !249
  %27 = getelementptr inbounds %struct.Random_struct* %R, i64 0, i32 0, i64 %26, !dbg !249
  %28 = load i32* %27, align 4, !dbg !249, !tbaa !131
  %29 = sub nsw i32 %25, %28, !dbg !249
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !250), !dbg !249
  %30 = icmp slt i32 %29, 0, !dbg !251
  %31 = add nsw i32 %29, 2147483647, !dbg !251
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !250), !dbg !251
  %..i.us = select i1 %30, i32 %31, i32 %29, !dbg !251
  store i32 %..i.us, i32* %27, align 4, !dbg !252, !tbaa !131
  %32 = icmp eq i32 %21, 0, !dbg !253
  %33 = add nsw i32 %21, -1, !dbg !254
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !247), !dbg !254
  %I.0.i.us = select i1 %32, i32 16, i32 %33, !dbg !253
  store i32 %I.0.i.us, i32* %10, align 4, !dbg !255, !tbaa !133
  %34 = icmp eq i32 %22, 0, !dbg !256
  %35 = add nsw i32 %22, -1, !dbg !257
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !248), !dbg !257
  %J.0.i.us = select i1 %34, i32 16, i32 %35, !dbg !256
  store i32 %J.0.i.us, i32* %11, align 4, !dbg !258, !tbaa !135
  %36 = load i32* %12, align 4, !dbg !239, !tbaa !143
  %37 = icmp eq i32 %36, 0, !dbg !239
  br i1 %37, label %46, label %38, !dbg !239

; <label>:38                                      ; preds = %.lr.ph.us
  %39 = load double* %13, align 8, !dbg !240, !tbaa !137
  %40 = load double* @dm1, align 8, !dbg !240, !tbaa !99
  %41 = sitofp i32 %..i.us to double, !dbg !240
  %42 = fmul double %41, %40, !dbg !240
  %43 = load double* %14, align 8, !dbg !240, !tbaa !141
  %44 = fmul double %42, %43, !dbg !240
  %45 = fadd double %39, %44, !dbg !240
  br label %Random_nextDouble.exit.us, !dbg !240

; <label>:46                                      ; preds = %.lr.ph.us
  %47 = load double* @dm1, align 8, !dbg !259, !tbaa !99
  %48 = sitofp i32 %..i.us to double, !dbg !259
  %49 = fmul double %48, %47, !dbg !259
  br label %Random_nextDouble.exit.us, !dbg !259

Random_nextDouble.exit.us:                        ; preds = %46, %38
  %.0.i.us = phi double [ %45, %38 ], [ %49, %46 ]
  %50 = getelementptr inbounds double* %16, i64 %indvars.iv5, !dbg !237
  store double %.0.i.us, double* %50, align 8, !dbg !237, !tbaa !99
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !234
  %lftr.wideiv = trunc i64 %indvars.iv.next6 to i32, !dbg !234
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !234
  br i1 %exitcond, label %._crit_edge.us, label %.lr.ph.us, !dbg !234

.lr.ph4..lr.ph4.split_crit_edge:                  ; preds = %.lr.ph4, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.lr.ph4 ]
  %51 = tail call noalias i8* @malloc(i64 %8) #3, !dbg !232
  %52 = bitcast i8* %51 to double*, !dbg !232
  %53 = getelementptr inbounds double** %4, i64 %indvars.iv, !dbg !232
  store double* %52, double** %53, align 8, !dbg !232, !tbaa !241
  %54 = icmp eq i8* %51, null, !dbg !243
  br i1 %54, label %.us-lcssa.us, label %.preheader, !dbg !243

.us-lcssa.us:                                     ; preds = %.lr.ph4..lr.ph4.split_crit_edge, %.lr.ph4.split.us
  tail call void @free(i8* %3) #3, !dbg !260
  br label %.loopexit, !dbg !262

.preheader:                                       ; preds = %.lr.ph4..lr.ph4.split_crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !230
  %55 = trunc i64 %indvars.iv.next to i32, !dbg !230
  %56 = icmp slt i32 %55, %M, !dbg !230
  br i1 %56, label %.lr.ph4..lr.ph4.split_crit_edge, label %.loopexit, !dbg !230

.loopexit:                                        ; preds = %.preheader, %._crit_edge.us, %.preheader1, %0, %.us-lcssa.us
  %.0 = phi double** [ null, %.us-lcssa.us ], [ null, %0 ], [ %4, %.preheader1 ], [ %4, %._crit_edge.us ], [ %4, %.preheader ]
  ret double** %.0, !dbg !263
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!89, !90}
!llvm.ident = !{!91}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !84, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"Random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !29, metadata !37, metadata !42, metadata !52, metadata !61, metadata !72}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random_seed", metadata !"new_Random_seed", metadata !"", i32 35, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Random_struct* (i32)* @new_Random_seed, null, null, metadata !26, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [new_Random_seed]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !15}
!8 = metadata !{i32 786454, metadata !9, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!9 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786451, metadata !9, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!12 = metadata !{metadata !13, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !24, metadata !25}
!13 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!14 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !15, metadata !16, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!18 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !15} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!19 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !15} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!20 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !15} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!21 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !15} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!22 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !23} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!23 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!24 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !23} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!25 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !23} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786689, metadata !4, metadata !"seed", metadata !5, i32 16777251, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 35]
!28 = metadata !{i32 786688, metadata !4, metadata !"R", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 37]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random", metadata !"new_Random", metadata !"", i32 48, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.Random_struct* (i32, double, double)* @new_Random, null, null, metadata !32, i32 49} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [new_Random]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{metadata !8, metadata !15, metadata !23, metadata !23}
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36}
!33 = metadata !{i32 786689, metadata !29, metadata !"seed", metadata !5, i32 16777264, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 48]
!34 = metadata !{i32 786689, metadata !29, metadata !"left", metadata !5, i32 33554480, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [left] [line 48]
!35 = metadata !{i32 786689, metadata !29, metadata !"right", metadata !5, i32 50331696, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [right] [line 48]
!36 = metadata !{i32 786688, metadata !29, metadata !"R", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 50]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_delete", metadata !"Random_delete", metadata !"", i32 61, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Random_struct*)* @Random_delete, null, null, metadata !40, i32 62} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [Random_delete]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !8}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 786689, metadata !37, metadata !"R", metadata !5, i32 16777277, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 61]
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_nextDouble", metadata !"Random_nextDouble", metadata !"", i32 70, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (%struct.Random_struct*)* @Random_nextDouble, null, null, metadata !45, i32 71} ; [ DW_TAG_subprogram ] [line 70] [def] [scope 71] [Random_nextDouble]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{metadata !23, metadata !8}
!45 = metadata !{metadata !46, metadata !47, metadata !48, metadata !49, metadata !50}
!46 = metadata !{i32 786689, metadata !42, metadata !"R", metadata !5, i32 16777286, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 70]
!47 = metadata !{i32 786688, metadata !42, metadata !"k", metadata !5, i32 72, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 72]
!48 = metadata !{i32 786688, metadata !42, metadata !"I", metadata !5, i32 74, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [I] [line 74]
!49 = metadata !{i32 786688, metadata !42, metadata !"J", metadata !5, i32 75, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [J] [line 75]
!50 = metadata !{i32 786688, metadata !42, metadata !"m", metadata !5, i32 76, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 76]
!51 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!52 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomVector", metadata !"RandomVector", metadata !"", i32 134, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double* (i32, %struct.Random_struct*)* @RandomVector, null, null, metadata !56, i32 135} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [RandomVector]
!53 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!54 = metadata !{metadata !55, metadata !15, metadata !8}
!55 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!56 = metadata !{metadata !57, metadata !58, metadata !59, metadata !60}
!57 = metadata !{i32 786689, metadata !52, metadata !"N", metadata !5, i32 16777350, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 134]
!58 = metadata !{i32 786689, metadata !52, metadata !"R", metadata !5, i32 33554566, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 134]
!59 = metadata !{i32 786688, metadata !52, metadata !"i", metadata !5, i32 136, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 136]
!60 = metadata !{i32 786688, metadata !52, metadata !"x", metadata !5, i32 137, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 137]
!61 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomMatrix", metadata !"RandomMatrix", metadata !"", i32 146, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double** (i32, i32, %struct.Random_struct*)* @RandomMatrix, null, null, metadata !65, i32 147} ; [ DW_TAG_subprogram ] [line 146] [def] [scope 147] [RandomMatrix]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !64, metadata !15, metadata !15, metadata !8}
!64 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71}
!66 = metadata !{i32 786689, metadata !61, metadata !"M", metadata !5, i32 16777362, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 146]
!67 = metadata !{i32 786689, metadata !61, metadata !"N", metadata !5, i32 33554578, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 146]
!68 = metadata !{i32 786689, metadata !61, metadata !"R", metadata !5, i32 50331794, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 146]
!69 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !5, i32 148, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 148]
!70 = metadata !{i32 786688, metadata !61, metadata !"j", metadata !5, i32 149, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 149]
!71 = metadata !{i32 786688, metadata !61, metadata !"A", metadata !5, i32 153, metadata !64, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 153]
!72 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"initialize", metadata !"initialize", metadata !"", i32 106, metadata !73, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !75, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [initialize]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{null, metadata !8, metadata !15}
!75 = metadata !{metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83}
!76 = metadata !{i32 786689, metadata !72, metadata !"R", metadata !5, i32 16777322, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 106]
!77 = metadata !{i32 786689, metadata !72, metadata !"seed", metadata !5, i32 33554538, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!78 = metadata !{i32 786688, metadata !72, metadata !"jseed", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!79 = metadata !{i32 786688, metadata !72, metadata !"k0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!80 = metadata !{i32 786688, metadata !72, metadata !"k1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!81 = metadata !{i32 786688, metadata !72, metadata !"j0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!82 = metadata !{i32 786688, metadata !72, metadata !"j1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!83 = metadata !{i32 786688, metadata !72, metadata !"iloop", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!84 = metadata !{metadata !85, metadata !87, metadata !85, metadata !85, metadata !85, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88, metadata !88}
!85 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m1", metadata !"m1", metadata !"m1", metadata !5, i32 17, metadata !86, i32 1, i32 1, i32 2147483647, null} ; [ DW_TAG_variable ] [m1] [line 17] [local] [def]
!86 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!87 = metadata !{i32 786484, i32 0, null, metadata !"dm1", metadata !"dm1", metadata !"", metadata !5, i32 28, metadata !23, i32 1, i32 1, double* @dm1, null} ; [ DW_TAG_variable ] [dm1] [line 28] [local] [def]
!88 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m2", metadata !"m2", metadata !"m2", metadata !5, i32 18, metadata !86, i32 1, i32 1, i32 65536, null} ; [ DW_TAG_variable ] [m2] [line 18] [local] [def]
!89 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!90 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!91 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!92 = metadata !{i32 35, i32 0, metadata !4, null}
!93 = metadata !{i32 37, i32 0, metadata !4, null}
!94 = metadata !{i32 786689, metadata !72, metadata !"R", metadata !5, i32 16777322, metadata !8, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [R] [line 106]
!95 = metadata !{i32 39, i32 0, metadata !4, null}
!96 = metadata !{i32 106, i32 0, metadata !72, metadata !95}
!97 = metadata !{i32 786689, metadata !72, metadata !"seed", metadata !5, i32 33554538, metadata !15, i32 0, metadata !95} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!98 = metadata !{i32 111, i32 0, metadata !72, metadata !95}
!99 = metadata !{metadata !100, metadata !100, i64 0}
!100 = metadata !{metadata !"double", metadata !101, i64 0}
!101 = metadata !{metadata !"omnipotent char", metadata !102, i64 0}
!102 = metadata !{metadata !"Simple C/C++ TBAA"}
!103 = metadata !{i32 113, i32 0, metadata !72, metadata !95}
!104 = metadata !{metadata !105, metadata !106, i64 68}
!105 = metadata !{metadata !"", metadata !101, i64 0, metadata !106, i64 68, metadata !106, i64 72, metadata !106, i64 76, metadata !106, i64 80, metadata !100, i64 88, metadata !100, i64 96, metadata !100, i64 104}
!106 = metadata !{metadata !"int", metadata !101, i64 0}
!107 = metadata !{i32 115, i32 0, metadata !108, metadata !95}
!108 = metadata !{i32 786443, metadata !1, metadata !72, i32 115, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!109 = metadata !{i32 786688, metadata !72, metadata !"jseed", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!110 = metadata !{i32 116, i32 0, metadata !72, metadata !95}
!111 = metadata !{i32 117, i32 0, metadata !112, metadata !95}
!112 = metadata !{i32 786443, metadata !1, metadata !72, i32 117, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!113 = metadata !{i32 9069}
!114 = metadata !{i32 786688, metadata !72, metadata !"k0", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!115 = metadata !{i32 118, i32 0, metadata !72, metadata !95}
!116 = metadata !{i32 0}
!117 = metadata !{i32 786688, metadata !72, metadata !"k1", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!118 = metadata !{i32 119, i32 0, metadata !72, metadata !95}
!119 = metadata !{i32 120, i32 0, metadata !72, metadata !95}
!120 = metadata !{i32 786688, metadata !72, metadata !"j0", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!121 = metadata !{i32 121, i32 0, metadata !72, metadata !95}
!122 = metadata !{i32 786688, metadata !72, metadata !"j1", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!123 = metadata !{i32 786688, metadata !72, metadata !"iloop", metadata !5, i32 109, metadata !15, i32 0, metadata !95} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!124 = metadata !{i32 122, i32 0, metadata !125, metadata !95}
!125 = metadata !{i32 786443, metadata !1, metadata !72, i32 122, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!126 = metadata !{i32 124, i32 0, metadata !127, metadata !95}
!127 = metadata !{i32 786443, metadata !1, metadata !125, i32 123, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!128 = metadata !{i32 125, i32 0, metadata !127, metadata !95}
!129 = metadata !{i32 126, i32 0, metadata !127, metadata !95}
!130 = metadata !{i32 127, i32 0, metadata !127, metadata !95}
!131 = metadata !{metadata !106, metadata !106, i64 0}
!132 = metadata !{i32 129, i32 0, metadata !72, metadata !95}
!133 = metadata !{metadata !105, metadata !106, i64 72}
!134 = metadata !{i32 130, i32 0, metadata !72, metadata !95}
!135 = metadata !{metadata !105, metadata !106, i64 76}
!136 = metadata !{i32 40, i32 0, metadata !4, null}
!137 = metadata !{metadata !105, metadata !100, i64 88}
!138 = metadata !{i32 41, i32 0, metadata !4, null}
!139 = metadata !{metadata !105, metadata !100, i64 96}
!140 = metadata !{i32 42, i32 0, metadata !4, null}
!141 = metadata !{metadata !105, metadata !100, i64 104}
!142 = metadata !{i32 43, i32 0, metadata !4, null}
!143 = metadata !{metadata !105, metadata !106, i64 80}
!144 = metadata !{i32 45, i32 0, metadata !4, null}
!145 = metadata !{i32 48, i32 0, metadata !29, null}
!146 = metadata !{i32 50, i32 0, metadata !29, null}
!147 = metadata !{i32 786689, metadata !72, metadata !"R", metadata !5, i32 16777322, metadata !8, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [R] [line 106]
!148 = metadata !{i32 52, i32 0, metadata !29, null}
!149 = metadata !{i32 106, i32 0, metadata !72, metadata !148}
!150 = metadata !{i32 786689, metadata !72, metadata !"seed", metadata !5, i32 33554538, metadata !15, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!151 = metadata !{i32 111, i32 0, metadata !72, metadata !148}
!152 = metadata !{i32 113, i32 0, metadata !72, metadata !148}
!153 = metadata !{i32 115, i32 0, metadata !108, metadata !148}
!154 = metadata !{i32 786688, metadata !72, metadata !"jseed", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!155 = metadata !{i32 116, i32 0, metadata !72, metadata !148}
!156 = metadata !{i32 117, i32 0, metadata !112, metadata !148}
!157 = metadata !{i32 786688, metadata !72, metadata !"k0", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!158 = metadata !{i32 118, i32 0, metadata !72, metadata !148}
!159 = metadata !{i32 786688, metadata !72, metadata !"k1", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!160 = metadata !{i32 119, i32 0, metadata !72, metadata !148}
!161 = metadata !{i32 120, i32 0, metadata !72, metadata !148}
!162 = metadata !{i32 786688, metadata !72, metadata !"j0", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!163 = metadata !{i32 121, i32 0, metadata !72, metadata !148}
!164 = metadata !{i32 786688, metadata !72, metadata !"j1", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!165 = metadata !{i32 786688, metadata !72, metadata !"iloop", metadata !5, i32 109, metadata !15, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!166 = metadata !{i32 122, i32 0, metadata !125, metadata !148}
!167 = metadata !{i32 124, i32 0, metadata !127, metadata !148}
!168 = metadata !{i32 125, i32 0, metadata !127, metadata !148}
!169 = metadata !{i32 126, i32 0, metadata !127, metadata !148}
!170 = metadata !{i32 127, i32 0, metadata !127, metadata !148}
!171 = metadata !{i32 129, i32 0, metadata !72, metadata !148}
!172 = metadata !{i32 130, i32 0, metadata !72, metadata !148}
!173 = metadata !{i32 53, i32 0, metadata !29, null}
!174 = metadata !{i32 54, i32 0, metadata !29, null}
!175 = metadata !{i32 55, i32 0, metadata !29, null}
!176 = metadata !{i32 56, i32 0, metadata !29, null}
!177 = metadata !{i32 58, i32 0, metadata !29, null} ; [ DW_TAG_imported_module ]
!178 = metadata !{i32 61, i32 0, metadata !37, null}
!179 = metadata !{i32 63, i32 0, metadata !37, null}
!180 = metadata !{i32 64, i32 0, metadata !37, null}
!181 = metadata !{i32 70, i32 0, metadata !42, null}
!182 = metadata !{i32 74, i32 0, metadata !42, null}
!183 = metadata !{i32 75, i32 0, metadata !42, null}
!184 = metadata !{i32 78, i32 0, metadata !42, null}
!185 = metadata !{i32 79, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !42, i32 79, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!187 = metadata !{i32 80, i32 0, metadata !42, null}
!188 = metadata !{i32 82, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !42, i32 82, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!190 = metadata !{i32 84, i32 0, metadata !189, null}
!191 = metadata !{i32 85, i32 0, metadata !42, null}
!192 = metadata !{i32 87, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !42, i32 87, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!194 = metadata !{i32 89, i32 0, metadata !193, null}
!195 = metadata !{i32 90, i32 0, metadata !42, null}
!196 = metadata !{i32 92, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !42, i32 92, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!198 = metadata !{i32 93, i32 0, metadata !197, null}
!199 = metadata !{i32 95, i32 0, metadata !197, null}
!200 = metadata !{i32 97, i32 0, metadata !42, null}
!201 = metadata !{i32 134, i32 0, metadata !52, null}
!202 = metadata !{i32 137, i32 0, metadata !52, null}
!203 = metadata !{i32 139, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !52, i32 139, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!205 = metadata !{i32 74, i32 0, metadata !42, metadata !206}
!206 = metadata !{i32 140, i32 0, metadata !204, null}
!207 = metadata !{i32 75, i32 0, metadata !42, metadata !206}
!208 = metadata !{i32 92, i32 0, metadata !197, metadata !206}
!209 = metadata !{i32 93, i32 0, metadata !197, metadata !206}
!210 = metadata !{i32 70, i32 0, metadata !42, metadata !206}
!211 = metadata !{i32 786689, metadata !42, metadata !"R", metadata !5, i32 16777286, metadata !8, i32 0, metadata !206} ; [ DW_TAG_arg_variable ] [R] [line 70]
!212 = metadata !{i32 786688, metadata !42, metadata !"I", metadata !5, i32 74, metadata !15, i32 0, metadata !206} ; [ DW_TAG_auto_variable ] [I] [line 74]
!213 = metadata !{i32 786688, metadata !42, metadata !"J", metadata !5, i32 75, metadata !15, i32 0, metadata !206} ; [ DW_TAG_auto_variable ] [J] [line 75]
!214 = metadata !{i32 78, i32 0, metadata !42, metadata !206}
!215 = metadata !{i32 786688, metadata !42, metadata !"k", metadata !5, i32 72, metadata !15, i32 0, metadata !206} ; [ DW_TAG_auto_variable ] [k] [line 72]
!216 = metadata !{i32 79, i32 0, metadata !186, metadata !206}
!217 = metadata !{i32 80, i32 0, metadata !42, metadata !206}
!218 = metadata !{i32 82, i32 0, metadata !189, metadata !206}
!219 = metadata !{i32 84, i32 0, metadata !189, metadata !206}
!220 = metadata !{i32 85, i32 0, metadata !42, metadata !206}
!221 = metadata !{i32 87, i32 0, metadata !193, metadata !206}
!222 = metadata !{i32 89, i32 0, metadata !193, metadata !206}
!223 = metadata !{i32 90, i32 0, metadata !42, metadata !206}
!224 = metadata !{i32 95, i32 0, metadata !197, metadata !206}
!225 = metadata !{i32 142, i32 0, metadata !52, null}
!226 = metadata !{i32 146, i32 0, metadata !61, null}
!227 = metadata !{i32 153, i32 0, metadata !61, null}
!228 = metadata !{i32 155, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !61, i32 155, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!230 = metadata !{i32 157, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !61, i32 157, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!232 = metadata !{i32 159, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !231, i32 158, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!234 = metadata !{i32 165, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !233, i32 165, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!236 = metadata !{i32 74, i32 0, metadata !42, metadata !237}
!237 = metadata !{i32 166, i32 0, metadata !235, null}
!238 = metadata !{i32 75, i32 0, metadata !42, metadata !237}
!239 = metadata !{i32 92, i32 0, metadata !197, metadata !237}
!240 = metadata !{i32 93, i32 0, metadata !197, metadata !237}
!241 = metadata !{metadata !242, metadata !242, i64 0}
!242 = metadata !{metadata !"any pointer", metadata !101, i64 0}
!243 = metadata !{i32 160, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !233, i32 160, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!245 = metadata !{i32 786689, metadata !42, metadata !"R", metadata !5, i32 16777286, metadata !8, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [R] [line 70]
!246 = metadata !{i32 70, i32 0, metadata !42, metadata !237}
!247 = metadata !{i32 786688, metadata !42, metadata !"I", metadata !5, i32 74, metadata !15, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [I] [line 74]
!248 = metadata !{i32 786688, metadata !42, metadata !"J", metadata !5, i32 75, metadata !15, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [J] [line 75]
!249 = metadata !{i32 78, i32 0, metadata !42, metadata !237}
!250 = metadata !{i32 786688, metadata !42, metadata !"k", metadata !5, i32 72, metadata !15, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [k] [line 72]
!251 = metadata !{i32 79, i32 0, metadata !186, metadata !237}
!252 = metadata !{i32 80, i32 0, metadata !42, metadata !237}
!253 = metadata !{i32 82, i32 0, metadata !189, metadata !237}
!254 = metadata !{i32 84, i32 0, metadata !189, metadata !237}
!255 = metadata !{i32 85, i32 0, metadata !42, metadata !237}
!256 = metadata !{i32 87, i32 0, metadata !193, metadata !237}
!257 = metadata !{i32 89, i32 0, metadata !193, metadata !237}
!258 = metadata !{i32 90, i32 0, metadata !42, metadata !237}
!259 = metadata !{i32 95, i32 0, metadata !197, metadata !237}
!260 = metadata !{i32 162, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !244, i32 161, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!262 = metadata !{i32 163, i32 0, metadata !261, null}
!263 = metadata !{i32 169, i32 0, metadata !61, null}
