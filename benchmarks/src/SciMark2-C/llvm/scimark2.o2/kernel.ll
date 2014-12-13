; ModuleID = 'kernel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }
%struct.Stopwatch_struct = type { i32, double, double }

; Function Attrs: nounwind uwtable
define double @kernel_measureFFT(i32 %N, double %mintime, %struct.Random_struct* %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !27), !dbg !105
  tail call void @llvm.dbg.value(metadata !{double %mintime}, i64 0, metadata !28), !dbg !105
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !29), !dbg !105
  %1 = shl nsw i32 %N, 1, !dbg !106
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !30), !dbg !106
  %2 = tail call double* @RandomVector(i32 %1, %struct.Random_struct* %R) #5, !dbg !107
  tail call void @llvm.dbg.value(metadata !{double* %2}, i64 0, metadata !31), !dbg !107
  tail call void @llvm.dbg.value(metadata !108, i64 0, metadata !33), !dbg !109
  %3 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !110
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %3}, i64 0, metadata !35), !dbg !110
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !44), !dbg !112
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !45), !dbg !114
  br label %4, !dbg !115

; <label>:4                                       ; preds = %.backedge, %0
  %cycles.0 = phi i64 [ 1, %0 ], [ %cycles.0.be, %.backedge ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %3) #5, !dbg !116
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !44), !dbg !118
  %5 = shl nsw i64 %cycles.0, 3, !dbg !118
  %6 = icmp sgt i64 %cycles.0, 0, !dbg !118
  br i1 %6, label %.lr.ph, label %._crit_edge.thread, !dbg !118

._crit_edge.thread:                               ; preds = %4
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %3) #5, !dbg !120
  br label %.backedge, !dbg !121

.lr.ph:                                           ; preds = %4, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %4 ]
  tail call void @FFT_transform(i32 %1, double* %2) #5, !dbg !123
  tail call void @FFT_inverse(i32 %1, double* %2) #5, !dbg !125
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !118
  %7 = icmp slt i64 %indvars.iv.next, %5, !dbg !118
  br i1 %7, label %.lr.ph, label %._crit_edge, !dbg !118

._crit_edge:                                      ; preds = %.lr.ph
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %3) #5, !dbg !120
  %8 = icmp sgt i64 %cycles.0, 4096, !dbg !121
  br i1 %8, label %9, label %.backedge, !dbg !121

.backedge:                                        ; preds = %._crit_edge, %._crit_edge.thread
  %cycles.0.be = shl nsw i64 %cycles.0, 1, !dbg !126
  br label %4

; <label>:9                                       ; preds = %._crit_edge
  %10 = tail call double @FFT_num_flops(i32 %N) #5, !dbg !127
  %11 = fmul double %10, 8.192000e+03, !dbg !127
  %12 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %3) #5, !dbg !127
  %13 = fdiv double %11, %12, !dbg !127
  %14 = fmul double %13, 1.000000e-06, !dbg !127
  tail call void @llvm.dbg.value(metadata !{double %14}, i64 0, metadata !45), !dbg !127
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %3) #5, !dbg !128
  %15 = bitcast double* %2 to i8*, !dbg !129
  tail call void @free(i8* %15) #5, !dbg !129
  ret double %14, !dbg !130
}

declare double* @RandomVector(i32, %struct.Random_struct*) #1

declare %struct.Stopwatch_struct* @new_Stopwatch() #1

declare void @Stopwatch_start(%struct.Stopwatch_struct*) #1

declare void @FFT_transform(i32, double*) #1

declare void @FFT_inverse(i32, double*) #1

declare void @Stopwatch_stop(%struct.Stopwatch_struct*) #1

declare double @FFT_num_flops(i32) #1

declare double @Stopwatch_read(%struct.Stopwatch_struct*) #1

declare void @Stopwatch_delete(%struct.Stopwatch_struct*) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define double @kernel_measureSOR(i32 %N, double %min_time, %struct.Random_struct* %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !48), !dbg !131
  tail call void @llvm.dbg.value(metadata !{double %min_time}, i64 0, metadata !49), !dbg !131
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !50), !dbg !131
  %1 = tail call double** @RandomMatrix(i32 %N, i32 %N, %struct.Random_struct* %R) #5, !dbg !132
  tail call void @llvm.dbg.value(metadata !{double** %1}, i64 0, metadata !51), !dbg !132
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !53), !dbg !133
  %2 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !134
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %2}, i64 0, metadata !54), !dbg !134
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !55), !dbg !136
  br label %3, !dbg !137

; <label>:3                                       ; preds = %3, %0
  %cycles.0 = phi i32 [ 1, %0 ], [ %6, %3 ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %2) #5, !dbg !138
  %4 = shl nsw i32 %cycles.0, 4, !dbg !140
  tail call void @SOR_execute(i32 %N, i32 %N, double 1.250000e+00, double** %1, i32 %4) #5, !dbg !140
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %2) #5, !dbg !141
  %5 = icmp sgt i32 %cycles.0, 4096, !dbg !142
  %6 = shl nsw i32 %cycles.0, 1, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !55), !dbg !144
  br i1 %5, label %7, label %3, !dbg !142

; <label>:7                                       ; preds = %3
  %8 = tail call double @SOR_num_flops(i32 %N, i32 %N, i32 8192) #5, !dbg !145
  %9 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %2) #5, !dbg !145
  %10 = fdiv double %8, %9, !dbg !145
  %11 = fmul double %10, 1.000000e-06, !dbg !145
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !53), !dbg !145
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %2) #5, !dbg !146
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %1) #5, !dbg !147
  ret double %11, !dbg !148
}

declare double** @RandomMatrix(i32, i32, %struct.Random_struct*) #1

declare void @SOR_execute(i32, i32, double, double**, i32) #1

declare double @SOR_num_flops(i32, i32, i32) #1

declare void @Array2D_double_delete(i32, i32, double**) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureMonteCarlo(double %min_time, %struct.Random_struct* nocapture readnone %R) #0 {
  tail call void @llvm.dbg.value(metadata !{double %min_time}, i64 0, metadata !60), !dbg !149
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !61), !dbg !149
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !62), !dbg !150
  %1 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !151
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %1}, i64 0, metadata !63), !dbg !151
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !64), !dbg !152
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %2 = tail call double @MonteCarlo_integrate(i32 65536) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %3 = tail call double @MonteCarlo_integrate(i32 131072) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %4 = tail call double @MonteCarlo_integrate(i32 262144) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %5 = tail call double @MonteCarlo_integrate(i32 524288) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %6 = tail call double @MonteCarlo_integrate(i32 1048576) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %7 = tail call double @MonteCarlo_integrate(i32 2097152) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %8 = tail call double @MonteCarlo_integrate(i32 4194304) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %9 = tail call double @MonteCarlo_integrate(i32 8388608) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %10 = tail call double @MonteCarlo_integrate(i32 16777216) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %11 = tail call double @MonteCarlo_integrate(i32 33554432) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %12 = tail call double @MonteCarlo_integrate(i32 67108864) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %13 = tail call double @MonteCarlo_integrate(i32 134217728) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %14 = tail call double @MonteCarlo_integrate(i32 268435456) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !153
  %15 = tail call double @MonteCarlo_integrate(i32 536870912) #5, !dbg !155
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !64), !dbg !158
  %16 = tail call double @MonteCarlo_num_flops(i32 8192) #5, !dbg !159
  %17 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %1) #5, !dbg !159
  %18 = fdiv double %16, %17, !dbg !159
  %19 = fmul double %18, 1.000000e-06, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !62), !dbg !159
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %1) #5, !dbg !160
  ret double %19, !dbg !161
}

declare double @MonteCarlo_integrate(i32) #1

declare double @MonteCarlo_num_flops(i32) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureSparseMatMult(i32 %N, i32 %nz, double %min_time, %struct.Random_struct* %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !69), !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %nz}, i64 0, metadata !70), !dbg !162
  tail call void @llvm.dbg.value(metadata !{double %min_time}, i64 0, metadata !71), !dbg !163
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !72), !dbg !163
  %1 = tail call double* @RandomVector(i32 %N, %struct.Random_struct* %R) #5, !dbg !164
  tail call void @llvm.dbg.value(metadata !{double* %1}, i64 0, metadata !73), !dbg !164
  %2 = sext i32 %N to i64, !dbg !165
  %3 = shl nsw i64 %2, 3, !dbg !165
  %4 = tail call noalias i8* @malloc(i64 %3) #5, !dbg !165
  %5 = bitcast i8* %4 to double*, !dbg !165
  tail call void @llvm.dbg.value(metadata !{double* %5}, i64 0, metadata !74), !dbg !165
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !75), !dbg !166
  %6 = sdiv i32 %nz, %N, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !76), !dbg !167
  %7 = mul nsw i32 %6, %N, !dbg !168
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !77), !dbg !168
  %8 = tail call double* @RandomVector(i32 %7, %struct.Random_struct* %R) #5, !dbg !169
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !78), !dbg !169
  %9 = sext i32 %nz to i64, !dbg !170
  %10 = shl nsw i64 %9, 2, !dbg !170
  %11 = tail call noalias i8* @malloc(i64 %10) #5, !dbg !170
  %12 = bitcast i8* %11 to i32*, !dbg !170
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !79), !dbg !170
  %13 = add nsw i32 %N, 1, !dbg !171
  %14 = sext i32 %13 to i64, !dbg !171
  %15 = shl nsw i64 %14, 2, !dbg !171
  %16 = tail call noalias i8* @malloc(i64 %15) #5, !dbg !171
  %17 = bitcast i8* %16 to i32*, !dbg !171
  tail call void @llvm.dbg.value(metadata !{i32* %17}, i64 0, metadata !81), !dbg !171
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !82), !dbg !172
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !83), !dbg !173
  %18 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !174
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %18}, i64 0, metadata !84), !dbg !174
  store i32 0, i32* %17, align 4, !dbg !175, !tbaa !176
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !82), !dbg !180
  %19 = icmp sgt i32 %N, 0, !dbg !180
  br i1 %19, label %.lr.ph3, label %.preheader, !dbg !180

.lr.ph3:                                          ; preds = %0
  %20 = icmp sgt i32 %6, 0, !dbg !181
  %21 = add i32 %6, -1, !dbg !180
  %22 = zext i32 %21 to i64
  %23 = add i64 %22, 1, !dbg !180
  br label %24, !dbg !180

.loopexit:                                        ; preds = %scalar.ph, %middle.block, %24
  %lftr.wideiv6 = trunc i64 %indvars.iv.next5 to i32, !dbg !180
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %N, !dbg !180
  br i1 %exitcond7, label %.preheader, label %24, !dbg !180

; <label>:24                                      ; preds = %.loopexit, %.lr.ph3
  %25 = phi i32 [ 0, %.lr.ph3 ], [ %28, %.loopexit ], !dbg !183
  %indvars.iv4 = phi i64 [ 0, %.lr.ph3 ], [ %indvars.iv.next5, %.loopexit ]
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !85), !dbg !183
  %26 = trunc i64 %indvars.iv4 to i32, !dbg !184
  %27 = sdiv i32 %26, %6, !dbg !184
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !88), !dbg !184
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !89), !dbg !185
  %28 = add nsw i32 %25, %6, !dbg !186
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !180
  %29 = getelementptr inbounds i32* %17, i64 %indvars.iv.next5, !dbg !186
  store i32 %28, i32* %29, align 4, !dbg !186, !tbaa !176
  %30 = icmp slt i32 %27, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !88), !dbg !187
  %. = select i1 %30, i32 1, i32 %27, !dbg !187
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !89), !dbg !181
  br i1 %20, label %.lr.ph, label %.loopexit, !dbg !181

.lr.ph:                                           ; preds = %24
  %31 = sext i32 %25 to i64, !dbg !181
  %end.idx = add i64 %22, 1, !dbg !181
  %n.vec = and i64 %23, 8589934584, !dbg !181
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !181
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph
  %broadcast.splatinsert13 = insertelement <4 x i32> undef, i32 %., i32 0
  %broadcast.splat14 = shufflevector <4 x i32> %broadcast.splatinsert13, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !181
  %32 = trunc i64 %index to i32, !dbg !189
  %broadcast.splatinsert9 = insertelement <4 x i32> undef, i32 %32, i32 0, !dbg !189
  %broadcast.splat10 = shufflevector <4 x i32> %broadcast.splatinsert9, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !189
  %induction11 = add <4 x i32> %broadcast.splat10, <i32 0, i32 1, i32 2, i32 3>, !dbg !189
  %induction12 = add <4 x i32> %broadcast.splat10, <i32 4, i32 5, i32 6, i32 7>, !dbg !189
  %33 = mul nsw <4 x i32> %induction11, %broadcast.splat14, !dbg !189
  %34 = mul nsw <4 x i32> %induction12, %broadcast.splat14, !dbg !189
  %35 = add i64 %index, %31, !dbg !189
  %36 = getelementptr inbounds i32* %12, i64 %35, !dbg !189
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !189
  store <4 x i32> %33, <4 x i32>* %37, align 4, !dbg !189
  %.sum = add i64 %35, 4, !dbg !189
  %38 = getelementptr i32* %12, i64 %.sum, !dbg !189
  %39 = bitcast i32* %38 to <4 x i32>*, !dbg !189
  store <4 x i32> %34, <4 x i32>* %39, align 4, !dbg !189
  %index.next = add i64 %index, 8, !dbg !181
  %40 = icmp eq i64 %index.next, %n.vec, !dbg !181
  br i1 %40, label %middle.block, label %vector.body, !dbg !181, !llvm.loop !190

middle.block:                                     ; preds = %vector.body, %.lr.ph
  %resume.val = phi i64 [ 0, %.lr.ph ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %resume.val, %middle.block ]
  %41 = trunc i64 %indvars.iv to i32, !dbg !189
  %42 = mul nsw i32 %41, %., !dbg !189
  %43 = add nsw i64 %indvars.iv, %31, !dbg !189
  %44 = getelementptr inbounds i32* %12, i64 %43, !dbg !189
  store i32 %42, i32* %44, align 4, !dbg !189, !tbaa !176
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !181
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !181
  %exitcond = icmp eq i32 %lftr.wideiv, %6, !dbg !181
  br i1 %exitcond, label %.loopexit, label %scalar.ph, !dbg !181, !llvm.loop !193

.preheader:                                       ; preds = %0, %.loopexit, %.preheader
  %cycles.0 = phi i32 [ %47, %.preheader ], [ 1, %.loopexit ], [ 1, %0 ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %18) #5, !dbg !194
  %45 = shl nsw i32 %cycles.0, 6, !dbg !196
  tail call void @SparseCompRow_matmult(i32 %N, double* %5, double* %8, i32* %17, i32* %12, double* %1, i32 %45) #5, !dbg !196
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %18) #5, !dbg !197
  %46 = icmp sgt i32 %cycles.0, 4096, !dbg !198
  %47 = shl nsw i32 %cycles.0, 1, !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !83), !dbg !200
  br i1 %46, label %48, label %.preheader, !dbg !198

; <label>:48                                      ; preds = %.preheader
  %49 = tail call double @SparseCompRow_num_flops(i32 %N, i32 %nz, i32 8192) #5, !dbg !201
  %50 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %18) #5, !dbg !202
  %51 = fdiv double %49, %50, !dbg !202
  %52 = fmul double %51, 1.000000e-06, !dbg !202
  tail call void @llvm.dbg.value(metadata !{double %52}, i64 0, metadata !75), !dbg !202
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %18) #5, !dbg !203
  tail call void @free(i8* %16) #5, !dbg !204
  tail call void @free(i8* %11) #5, !dbg !205
  %53 = bitcast double* %8 to i8*, !dbg !206
  tail call void @free(i8* %53) #5, !dbg !206
  tail call void @free(i8* %4) #5, !dbg !207
  %54 = bitcast double* %1 to i8*, !dbg !208
  tail call void @free(i8* %54) #5, !dbg !208
  ret double %52, !dbg !209
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @SparseCompRow_matmult(i32, double*, double*, i32*, i32*, double*, i32) #1

declare double @SparseCompRow_num_flops(i32, i32, i32) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureLU(i32 %N, double %min_time, %struct.Random_struct* %R) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !92), !dbg !210
  tail call void @llvm.dbg.value(metadata !{double %min_time}, i64 0, metadata !93), !dbg !210
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %R}, i64 0, metadata !94), !dbg !210
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !95), !dbg !212
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !96), !dbg !213
  tail call void @llvm.dbg.value(metadata !214, i64 0, metadata !97), !dbg !215
  %1 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !216
  tail call void @llvm.dbg.value(metadata !{%struct.Stopwatch_struct* %1}, i64 0, metadata !98), !dbg !216
  tail call void @llvm.dbg.value(metadata !113, i64 0, metadata !99), !dbg !217
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !100), !dbg !218
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !101), !dbg !219
  %2 = tail call double** @RandomMatrix(i32 %N, i32 %N, %struct.Random_struct* %R) #5, !dbg !220
  tail call void @llvm.dbg.value(metadata !{double** %2}, i64 0, metadata !95), !dbg !220
  %3 = icmp eq double** %2, null, !dbg !220
  br i1 %3, label %4, label %5, !dbg !220

; <label>:4                                       ; preds = %0
  tail call void @exit(i32 1) #6, !dbg !220
  unreachable, !dbg !220

; <label>:5                                       ; preds = %0
  %6 = tail call double** @new_Array2D_double(i32 %N, i32 %N) #5, !dbg !222
  tail call void @llvm.dbg.value(metadata !{double** %6}, i64 0, metadata !96), !dbg !222
  %7 = icmp eq double** %6, null, !dbg !222
  br i1 %7, label %8, label %9, !dbg !222

; <label>:8                                       ; preds = %5
  tail call void @exit(i32 1) #6, !dbg !222
  unreachable, !dbg !222

; <label>:9                                       ; preds = %5
  %10 = sext i32 %N to i64, !dbg !224
  %11 = shl nsw i64 %10, 2, !dbg !224
  %12 = tail call noalias i8* @malloc(i64 %11) #5, !dbg !224
  %13 = bitcast i8* %12 to i32*, !dbg !224
  tail call void @llvm.dbg.value(metadata !{i32* %13}, i64 0, metadata !97), !dbg !224
  %14 = icmp eq i8* %12, null, !dbg !224
  br i1 %14, label %15, label %.preheader, !dbg !224

; <label>:15                                      ; preds = %9
  tail call void @exit(i32 1) #6, !dbg !224
  unreachable, !dbg !224

.preheader:                                       ; preds = %9, %.preheader.backedge
  %cycles.0 = phi i32 [ %cycles.0.be, %.preheader.backedge ], [ 1, %9 ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %1) #5, !dbg !226
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !100), !dbg !228
  %16 = icmp sgt i32 %cycles.0, 0, !dbg !228
  br i1 %16, label %.lr.ph, label %._crit_edge.thread, !dbg !228

._crit_edge.thread:                               ; preds = %.preheader
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !230
  br label %.preheader.backedge, !dbg !231

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.01 = phi i32 [ %18, %.lr.ph ], [ 0, %.preheader ]
  tail call void @Array2D_double_copy(i32 %N, i32 %N, double** %6, double** %2) #5, !dbg !233
  %17 = tail call i32 @LU_factor(i32 %N, i32 %N, double** %6, i32* %13) #5, !dbg !235
  %18 = add nsw i32 %i.01, 1, !dbg !228
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !100), !dbg !228
  %exitcond = icmp eq i32 %18, %cycles.0, !dbg !228
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !228

._crit_edge:                                      ; preds = %.lr.ph
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %1) #5, !dbg !230
  %19 = icmp sgt i32 %cycles.0, 4096, !dbg !231
  br i1 %19, label %20, label %.preheader.backedge, !dbg !231

.preheader.backedge:                              ; preds = %._crit_edge, %._crit_edge.thread
  %cycles.0.be = shl nsw i32 %cycles.0, 1, !dbg !236
  br label %.preheader

; <label>:20                                      ; preds = %._crit_edge
  %21 = tail call double @LU_num_flops(i32 %N) #5, !dbg !237
  %22 = fmul double %21, 8.192000e+03, !dbg !237
  %23 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %1) #5, !dbg !237
  %24 = fdiv double %22, %23, !dbg !237
  %25 = fmul double %24, 1.000000e-06, !dbg !237
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !99), !dbg !237
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %1) #5, !dbg !238
  tail call void @free(i8* %12) #5, !dbg !239
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %6) #5, !dbg !240
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %2) #5, !dbg !241
  ret double %25, !dbg !242
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare double** @new_Array2D_double(i32, i32) #1

declare void @Array2D_double_copy(i32, i32, double**, double**) #1

declare i32 @LU_factor(i32, i32, double**, i32*) #1

declare double @LU_num_flops(i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c] [DW_LANG_C99]
!1 = metadata !{metadata !"kernel.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !46, metadata !56, metadata !65, metadata !90}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureFFT", metadata !"kernel_measureFFT", metadata !"", i32 19, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, %struct.Random_struct*)* @kernel_measureFFT, null, null, metadata !26, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [kernel_measureFFT]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8, metadata !10}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!14 = metadata !{metadata !15, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25}
!15 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !9, metadata !17, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!19 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !9} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!20 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !9} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!21 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !9} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!22 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !9} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!23 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !8} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!24 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !8} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!25 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !8} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!26 = metadata !{metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !33, metadata !35, metadata !44, metadata !45}
!27 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777235, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 19]
!28 = metadata !{i32 786689, metadata !4, metadata !"mintime", metadata !5, i32 33554451, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mintime] [line 19]
!29 = metadata !{i32 786689, metadata !4, metadata !"R", metadata !5, i32 50331667, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 19]
!30 = metadata !{i32 786688, metadata !4, metadata !"twoN", metadata !5, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [twoN] [line 23]
!31 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 24, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 24]
!32 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!33 = metadata !{i32 786688, metadata !4, metadata !"cycles", metadata !5, i32 25, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 25]
!34 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!35 = metadata !{i32 786688, metadata !4, metadata !"Q", metadata !5, i32 26, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 26]
!36 = metadata !{i32 786454, metadata !37, null, metadata !"Stopwatch", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [Stopwatch] [line 9, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !"./Stopwatch.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!38 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!39 = metadata !{i32 786451, metadata !37, null, metadata !"", i32 4, i64 192, i64 64, i32 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 4, size 192, align 64, offset 0] [def] [from ]
!40 = metadata !{metadata !41, metadata !42, metadata !43}
!41 = metadata !{i32 786445, metadata !37, metadata !39, metadata !"running", i32 5, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [running] [line 5, size 32, align 32, offset 0] [from int]
!42 = metadata !{i32 786445, metadata !37, metadata !39, metadata !"last_time", i32 6, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [last_time] [line 6, size 64, align 64, offset 64] [from double]
!43 = metadata !{i32 786445, metadata !37, metadata !39, metadata !"total", i32 7, i64 64, i64 64, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [total] [line 7, size 64, align 64, offset 128] [from double]
!44 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!45 = metadata !{i32 786688, metadata !4, metadata !"result", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 28]
!46 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureSOR", metadata !"kernel_measureSOR", metadata !"", i32 53, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, %struct.Random_struct*)* @kernel_measureSOR, null, null, metadata !47, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [kernel_measureSOR]
!47 = metadata !{metadata !48, metadata !49, metadata !50, metadata !51, metadata !53, metadata !54, metadata !55}
!48 = metadata !{i32 786689, metadata !46, metadata !"N", metadata !5, i32 16777269, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 53]
!49 = metadata !{i32 786689, metadata !46, metadata !"min_time", metadata !5, i32 33554485, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 53]
!50 = metadata !{i32 786689, metadata !46, metadata !"R", metadata !5, i32 50331701, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 53]
!51 = metadata !{i32 786688, metadata !46, metadata !"G", metadata !5, i32 55, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [G] [line 55]
!52 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!53 = metadata !{i32 786688, metadata !46, metadata !"result", metadata !5, i32 56, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 56]
!54 = metadata !{i32 786688, metadata !46, metadata !"Q", metadata !5, i32 58, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 58]
!55 = metadata !{i32 786688, metadata !46, metadata !"cycles", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 59]
!56 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureMonteCarlo", metadata !"kernel_measureMonteCarlo", metadata !"", i32 82, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double, %struct.Random_struct*)* @kernel_measureMonteCarlo, null, null, metadata !59, i32 83} ; [ DW_TAG_subprogram ] [line 82] [def] [scope 83] [kernel_measureMonteCarlo]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !8, metadata !8, metadata !10}
!59 = metadata !{metadata !60, metadata !61, metadata !62, metadata !63, metadata !64}
!60 = metadata !{i32 786689, metadata !56, metadata !"min_time", metadata !5, i32 16777298, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 82]
!61 = metadata !{i32 786689, metadata !56, metadata !"R", metadata !5, i32 33554514, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 82]
!62 = metadata !{i32 786688, metadata !56, metadata !"result", metadata !5, i32 84, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 84]
!63 = metadata !{i32 786688, metadata !56, metadata !"Q", metadata !5, i32 85, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 85]
!64 = metadata !{i32 786688, metadata !56, metadata !"cycles", metadata !5, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 87]
!65 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureSparseMatMult", metadata !"kernel_measureSparseMatMult", metadata !"", i32 104, metadata !66, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, double, %struct.Random_struct*)* @kernel_measureSparseMatMult, null, null, metadata !68, i32 106} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 106] [kernel_measureSparseMatMult]
!66 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{metadata !8, metadata !9, metadata !9, metadata !8, metadata !10}
!68 = metadata !{metadata !69, metadata !70, metadata !71, metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !88, metadata !89}
!69 = metadata !{i32 786689, metadata !65, metadata !"N", metadata !5, i32 16777320, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 104]
!70 = metadata !{i32 786689, metadata !65, metadata !"nz", metadata !5, i32 33554536, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nz] [line 104]
!71 = metadata !{i32 786689, metadata !65, metadata !"min_time", metadata !5, i32 50331753, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 105]
!72 = metadata !{i32 786689, metadata !65, metadata !"R", metadata !5, i32 67108969, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 105]
!73 = metadata !{i32 786688, metadata !65, metadata !"x", metadata !5, i32 110, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 110]
!74 = metadata !{i32 786688, metadata !65, metadata !"y", metadata !5, i32 111, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 111]
!75 = metadata !{i32 786688, metadata !65, metadata !"result", metadata !5, i32 113, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 113]
!76 = metadata !{i32 786688, metadata !65, metadata !"nr", metadata !5, i32 138, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nr] [line 138]
!77 = metadata !{i32 786688, metadata !65, metadata !"anz", metadata !5, i32 139, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [anz] [line 139]
!78 = metadata !{i32 786688, metadata !65, metadata !"val", metadata !5, i32 142, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 142]
!79 = metadata !{i32 786688, metadata !65, metadata !"col", metadata !5, i32 143, metadata !80, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 143]
!80 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!81 = metadata !{i32 786688, metadata !65, metadata !"row", metadata !5, i32 144, metadata !80, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 144]
!82 = metadata !{i32 786688, metadata !65, metadata !"r", metadata !5, i32 145, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 145]
!83 = metadata !{i32 786688, metadata !65, metadata !"cycles", metadata !5, i32 146, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 146]
!84 = metadata !{i32 786688, metadata !65, metadata !"Q", metadata !5, i32 148, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 148]
!85 = metadata !{i32 786688, metadata !86, metadata !"rowr", metadata !5, i32 155, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowr] [line 155]
!86 = metadata !{i32 786443, metadata !1, metadata !87, i32 152, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!87 = metadata !{i32 786443, metadata !1, metadata !65, i32 151, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!88 = metadata !{i32 786688, metadata !86, metadata !"step", metadata !5, i32 156, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [step] [line 156]
!89 = metadata !{i32 786688, metadata !86, metadata !"i", metadata !5, i32 157, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 157]
!90 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureLU", metadata !"kernel_measureLU", metadata !"", i32 193, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, %struct.Random_struct*)* @kernel_measureLU, null, null, metadata !91, i32 194} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [kernel_measureLU]
!91 = metadata !{metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!92 = metadata !{i32 786689, metadata !90, metadata !"N", metadata !5, i32 16777409, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 193]
!93 = metadata !{i32 786689, metadata !90, metadata !"min_time", metadata !5, i32 33554625, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 193]
!94 = metadata !{i32 786689, metadata !90, metadata !"R", metadata !5, i32 50331841, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 193]
!95 = metadata !{i32 786688, metadata !90, metadata !"A", metadata !5, i32 196, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 196]
!96 = metadata !{i32 786688, metadata !90, metadata !"lu", metadata !5, i32 197, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lu] [line 197]
!97 = metadata !{i32 786688, metadata !90, metadata !"pivot", metadata !5, i32 198, metadata !80, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pivot] [line 198]
!98 = metadata !{i32 786688, metadata !90, metadata !"Q", metadata !5, i32 202, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 202]
!99 = metadata !{i32 786688, metadata !90, metadata !"result", metadata !5, i32 203, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 203]
!100 = metadata !{i32 786688, metadata !90, metadata !"i", metadata !5, i32 204, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 204]
!101 = metadata !{i32 786688, metadata !90, metadata !"cycles", metadata !5, i32 205, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 205]
!102 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!103 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!104 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!105 = metadata !{i32 19, i32 0, metadata !4, null}
!106 = metadata !{i32 23, i32 0, metadata !4, null}
!107 = metadata !{i32 24, i32 0, metadata !4, null}
!108 = metadata !{i64 1}
!109 = metadata !{i32 25, i32 0, metadata !4, null}
!110 = metadata !{i32 26, i32 0, metadata !4, null}
!111 = metadata !{i32 0}
!112 = metadata !{i32 27, i32 0, metadata !4, null}
!113 = metadata !{double 0.000000e+00}
!114 = metadata !{i32 28, i32 0, metadata !4, null}
!115 = metadata !{i32 30, i32 0, metadata !4, null}
!116 = metadata !{i32 32, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!118 = metadata !{i32 33, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 33, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!120 = metadata !{i32 38, i32 0, metadata !117, null}
!121 = metadata !{i32 39, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !117, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!123 = metadata !{i32 35, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !119, i32 34, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!125 = metadata !{i32 36, i32 0, metadata !124, null}
!126 = metadata !{i32 42, i32 0, metadata !117, null}
!127 = metadata !{i32 47, i32 0, metadata !4, null}
!128 = metadata !{i32 48, i32 0, metadata !4, null}
!129 = metadata !{i32 49, i32 0, metadata !4, null}
!130 = metadata !{i32 50, i32 0, metadata !4, null}
!131 = metadata !{i32 53, i32 0, metadata !46, null}
!132 = metadata !{i32 55, i32 0, metadata !46, null}
!133 = metadata !{i32 56, i32 0, metadata !46, null}
!134 = metadata !{i32 58, i32 0, metadata !46, null} ; [ DW_TAG_imported_module ]
!135 = metadata !{i32 1}
!136 = metadata !{i32 59, i32 0, metadata !46, null}
!137 = metadata !{i32 60, i32 0, metadata !46, null}
!138 = metadata !{i32 62, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !46, i32 61, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!140 = metadata !{i32 63, i32 0, metadata !139, null}
!141 = metadata !{i32 64, i32 0, metadata !139, null}
!142 = metadata !{i32 66, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !139, i32 66, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!144 = metadata !{i32 69, i32 0, metadata !139, null}
!145 = metadata !{i32 73, i32 0, metadata !46, null}
!146 = metadata !{i32 74, i32 0, metadata !46, null}
!147 = metadata !{i32 75, i32 0, metadata !46, null}
!148 = metadata !{i32 76, i32 0, metadata !46, null}
!149 = metadata !{i32 82, i32 0, metadata !56, null}
!150 = metadata !{i32 84, i32 0, metadata !56, null}
!151 = metadata !{i32 85, i32 0, metadata !56, null}
!152 = metadata !{i32 87, i32 0, metadata !56, null}
!153 = metadata !{i32 90, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !56, i32 89, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!155 = metadata !{i32 91, i32 0, metadata !154, null}
!156 = metadata !{i32 92, i32 0, metadata !154, null}
!157 = metadata !{i32 2}
!158 = metadata !{i32 95, i32 0, metadata !154, null}
!159 = metadata !{i32 98, i32 0, metadata !56, null}
!160 = metadata !{i32 99, i32 0, metadata !56, null}
!161 = metadata !{i32 100, i32 0, metadata !56, null}
!162 = metadata !{i32 104, i32 0, metadata !65, null}
!163 = metadata !{i32 105, i32 0, metadata !65, null}
!164 = metadata !{i32 110, i32 0, metadata !65, null}
!165 = metadata !{i32 111, i32 0, metadata !65, null}
!166 = metadata !{i32 113, i32 0, metadata !65, null}
!167 = metadata !{i32 138, i32 0, metadata !65, null}
!168 = metadata !{i32 139, i32 0, metadata !65, null}
!169 = metadata !{i32 142, i32 0, metadata !65, null}
!170 = metadata !{i32 143, i32 0, metadata !65, null}
!171 = metadata !{i32 144, i32 0, metadata !65, null}
!172 = metadata !{i32 145, i32 0, metadata !65, null}
!173 = metadata !{i32 146, i32 0, metadata !65, null}
!174 = metadata !{i32 148, i32 0, metadata !65, null}
!175 = metadata !{i32 150, i32 0, metadata !65, null}
!176 = metadata !{metadata !177, metadata !177, i64 0}
!177 = metadata !{metadata !"int", metadata !178, i64 0}
!178 = metadata !{metadata !"omnipotent char", metadata !179, i64 0}
!179 = metadata !{metadata !"Simple C/C++ TBAA"}
!180 = metadata !{i32 151, i32 0, metadata !87, null}
!181 = metadata !{i32 163, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !86, i32 163, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!183 = metadata !{i32 155, i32 0, metadata !86, null}
!184 = metadata !{i32 156, i32 0, metadata !86, null}
!185 = metadata !{i32 157, i32 0, metadata !86, null}
!186 = metadata !{i32 159, i32 0, metadata !86, null}
!187 = metadata !{i32 160, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !86, i32 160, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!189 = metadata !{i32 164, i32 0, metadata !182, null}
!190 = metadata !{metadata !190, metadata !191, metadata !192}
!191 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!192 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!193 = metadata !{metadata !193, metadata !191, metadata !192}
!194 = metadata !{i32 171, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !65, i32 170, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!196 = metadata !{i32 172, i32 0, metadata !195, null}
!197 = metadata !{i32 173, i32 0, metadata !195, null}
!198 = metadata !{i32 174, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !195, i32 174, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!200 = metadata !{i32 176, i32 0, metadata !195, null}
!201 = metadata !{i32 179, i32 0, metadata !65, null}
!202 = metadata !{i32 180, i32 0, metadata !65, null}
!203 = metadata !{i32 182, i32 0, metadata !65, null}
!204 = metadata !{i32 183, i32 0, metadata !65, null}
!205 = metadata !{i32 184, i32 0, metadata !65, null}
!206 = metadata !{i32 185, i32 0, metadata !65, null}
!207 = metadata !{i32 186, i32 0, metadata !65, null}
!208 = metadata !{i32 187, i32 0, metadata !65, null}
!209 = metadata !{i32 189, i32 0, metadata !65, null}
!210 = metadata !{i32 193, i32 0, metadata !90, null}
!211 = metadata !{double** null}
!212 = metadata !{i32 196, i32 0, metadata !90, null}
!213 = metadata !{i32 197, i32 0, metadata !90, null}
!214 = metadata !{i32* null}
!215 = metadata !{i32 198, i32 0, metadata !90, null}
!216 = metadata !{i32 202, i32 0, metadata !90, null}
!217 = metadata !{i32 203, i32 0, metadata !90, null}
!218 = metadata !{i32 204, i32 0, metadata !90, null}
!219 = metadata !{i32 205, i32 0, metadata !90, null}
!220 = metadata !{i32 207, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !90, i32 207, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!222 = metadata !{i32 208, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !90, i32 208, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!224 = metadata !{i32 209, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !90, i32 209, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!226 = metadata !{i32 214, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !90, i32 213, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!228 = metadata !{i32 215, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !227, i32 215, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!230 = metadata !{i32 220, i32 0, metadata !227, null}
!231 = metadata !{i32 221, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !227, i32 221, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!233 = metadata !{i32 217, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !229, i32 216, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!235 = metadata !{i32 218, i32 0, metadata !234, null}
!236 = metadata !{i32 223, i32 0, metadata !227, null}
!237 = metadata !{i32 226, i32 0, metadata !90, null}
!238 = metadata !{i32 228, i32 0, metadata !90, null}
!239 = metadata !{i32 229, i32 0, metadata !90, null}
!240 = metadata !{i32 230, i32 0, metadata !90, null}
!241 = metadata !{i32 231, i32 0, metadata !90, null}
!242 = metadata !{i32 233, i32 0, metadata !90, null}
