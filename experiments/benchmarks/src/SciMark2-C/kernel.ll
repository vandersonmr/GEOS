; ModuleID = 'kernel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }
%struct.Stopwatch_struct = type { i32, double, double }

; Function Attrs: nounwind uwtable
define double @kernel_measureFFT(i32 %N, double %mintime, %struct.Random_struct* %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !31, metadata !108), !dbg !109
  tail call void @llvm.dbg.value(metadata double %mintime, i64 0, metadata !32, metadata !108), !dbg !110
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !33, metadata !108), !dbg !111
  %mul = shl nsw i32 %N, 1, !dbg !112
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !34, metadata !108), !dbg !113
  %call = tail call double* @RandomVector(i32 %mul, %struct.Random_struct* %R) #5, !dbg !114
  tail call void @llvm.dbg.value(metadata double* %call, i64 0, metadata !35, metadata !108), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !36, metadata !108), !dbg !116
  %call1 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !117
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %call1, i64 0, metadata !38, metadata !108), !dbg !118
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !108), !dbg !119
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !48, metadata !108), !dbg !120
  br label %while.body, !dbg !121

while.body:                                       ; preds = %while.body.backedge, %entry
  %cycles.0 = phi i64 [ 1, %entry ], [ %cycles.0.be, %while.body.backedge ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call1) #5, !dbg !122
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !108), !dbg !119
  %mul2 = shl nsw i64 %cycles.0, 3, !dbg !124
  %cmp24 = icmp sgt i64 %cycles.0, 0, !dbg !127
  br i1 %cmp24, label %for.body.preheader, label %for.end.thread, !dbg !128

for.body.preheader:                               ; preds = %while.body
  br label %for.body, !dbg !129

for.end.thread:                                   ; preds = %while.body
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call1) #5, !dbg !131
  br label %while.body.backedge, !dbg !132

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  tail call void @FFT_transform(i32 %mul, double* %call) #5, !dbg !129
  tail call void @FFT_inverse(i32 %mul, double* %call) #5, !dbg !133
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !128
  %cmp = icmp slt i64 %indvars.iv.next, %mul2, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.end:                                          ; preds = %for.body
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call1) #5, !dbg !131
  %cmp4 = icmp sgt i64 %cycles.0, 4096, !dbg !134
  br i1 %cmp4, label %while.end, label %while.body.backedge, !dbg !132

while.body.backedge:                              ; preds = %for.end, %for.end.thread
  %cycles.0.be = shl nsw i64 %cycles.0, 1, !dbg !136
  br label %while.body

while.end:                                        ; preds = %for.end
  %call7 = tail call double @FFT_num_flops(i32 %N) #5, !dbg !137
  %mul9 = fmul double %call7, 8.192000e+03, !dbg !137
  %call10 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %call1) #5, !dbg !138
  %div = fdiv double %mul9, %call10, !dbg !137
  %mul11 = fmul double %div, 1.000000e-06, !dbg !137
  tail call void @llvm.dbg.value(metadata double %mul11, i64 0, metadata !48, metadata !108), !dbg !120
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %call1) #5, !dbg !139
  %0 = bitcast double* %call to i8*, !dbg !140
  tail call void @free(i8* %0) #5, !dbg !141
  ret double %mul11, !dbg !142
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
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !51, metadata !108), !dbg !143
  tail call void @llvm.dbg.value(metadata double %min_time, i64 0, metadata !52, metadata !108), !dbg !144
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !53, metadata !108), !dbg !145
  %call = tail call double** @RandomMatrix(i32 %N, i32 %N, %struct.Random_struct* %R) #5, !dbg !146
  tail call void @llvm.dbg.value(metadata double** %call, i64 0, metadata !54, metadata !108), !dbg !147
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !56, metadata !108), !dbg !148
  %call1 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !149
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %call1, i64 0, metadata !57, metadata !108), !dbg !150
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !58, metadata !108), !dbg !151
  br label %while.body, !dbg !152

while.body:                                       ; preds = %while.body, %entry
  %cycles.0 = phi i32 [ 1, %entry ], [ %mul2, %while.body ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call1) #5, !dbg !153
  %mul = shl nsw i32 %cycles.0, 4, !dbg !155
  tail call void @SOR_execute(i32 %N, i32 %N, double 1.250000e+00, double** %call, i32 %mul) #5, !dbg !156
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call1) #5, !dbg !157
  %cmp = icmp sgt i32 %cycles.0, 4096, !dbg !158
  %mul2 = shl nsw i32 %cycles.0, 1, !dbg !160
  tail call void @llvm.dbg.value(metadata i32 %mul2, i64 0, metadata !58, metadata !108), !dbg !151
  br i1 %cmp, label %while.end, label %while.body, !dbg !161

while.end:                                        ; preds = %while.body
  %call3 = tail call double @SOR_num_flops(i32 %N, i32 %N, i32 8192) #5, !dbg !162
  %call4 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %call1) #5, !dbg !163
  %div = fdiv double %call3, %call4, !dbg !162
  %mul5 = fmul double %div, 1.000000e-06, !dbg !162
  tail call void @llvm.dbg.value(metadata double %mul5, i64 0, metadata !56, metadata !108), !dbg !148
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %call1) #5, !dbg !164
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %call) #5, !dbg !165
  ret double %mul5, !dbg !166
}

declare double** @RandomMatrix(i32, i32, %struct.Random_struct*) #1

declare void @SOR_execute(i32, i32, double, double**, i32) #1

declare double @SOR_num_flops(i32, i32, i32) #1

declare void @Array2D_double_delete(i32, i32, double**) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureMonteCarlo(double %min_time, %struct.Random_struct* nocapture readnone %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %min_time, i64 0, metadata !63, metadata !108), !dbg !167
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !64, metadata !108), !dbg !168
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !65, metadata !108), !dbg !169
  %call = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !170
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %call, i64 0, metadata !66, metadata !108), !dbg !171
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1 = tail call double @MonteCarlo_integrate(i32 65536) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.1 = tail call double @MonteCarlo_integrate(i32 131072) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.2 = tail call double @MonteCarlo_integrate(i32 262144) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.3 = tail call double @MonteCarlo_integrate(i32 524288) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.4 = tail call double @MonteCarlo_integrate(i32 1048576) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.5 = tail call double @MonteCarlo_integrate(i32 2097152) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.6 = tail call double @MonteCarlo_integrate(i32 4194304) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.7 = tail call double @MonteCarlo_integrate(i32 8388608) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.8 = tail call double @MonteCarlo_integrate(i32 16777216) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.9 = tail call double @MonteCarlo_integrate(i32 33554432) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.10 = tail call double @MonteCarlo_integrate(i32 67108864) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.11 = tail call double @MonteCarlo_integrate(i32 134217728) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.12 = tail call double @MonteCarlo_integrate(i32 268435456) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !173
  %call1.13 = tail call double @MonteCarlo_integrate(i32 536870912) #5, !dbg !175
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !67, metadata !108), !dbg !172
  %call3 = tail call double @MonteCarlo_num_flops(i32 8192) #5, !dbg !177
  %call4 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %call) #5, !dbg !178
  %div = fdiv double %call3, %call4, !dbg !177
  %mul5 = fmul double %div, 1.000000e-06, !dbg !177
  tail call void @llvm.dbg.value(metadata double %mul5, i64 0, metadata !65, metadata !108), !dbg !169
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %call) #5, !dbg !179
  ret double %mul5, !dbg !180
}

declare double @MonteCarlo_integrate(i32) #1

declare double @MonteCarlo_num_flops(i32) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureSparseMatMult(i32 %N, i32 %nz, double %min_time, %struct.Random_struct* %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !72, metadata !108), !dbg !181
  tail call void @llvm.dbg.value(metadata i32 %nz, i64 0, metadata !73, metadata !108), !dbg !182
  tail call void @llvm.dbg.value(metadata double %min_time, i64 0, metadata !74, metadata !108), !dbg !183
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !75, metadata !108), !dbg !184
  %call = tail call double* @RandomVector(i32 %N, %struct.Random_struct* %R) #5, !dbg !185
  tail call void @llvm.dbg.value(metadata double* %call, i64 0, metadata !76, metadata !108), !dbg !186
  %conv = sext i32 %N to i64, !dbg !187
  %mul = shl nsw i64 %conv, 3, !dbg !188
  %call1 = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !189
  %0 = bitcast i8* %call1 to double*, !dbg !190
  tail call void @llvm.dbg.value(metadata double* %0, i64 0, metadata !77, metadata !108), !dbg !191
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !78, metadata !108), !dbg !192
  %div = sdiv i32 %nz, %N, !dbg !193
  tail call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !79, metadata !108), !dbg !194
  %mul2 = mul nsw i32 %div, %N, !dbg !195
  tail call void @llvm.dbg.value(metadata i32 %mul2, i64 0, metadata !80, metadata !108), !dbg !196
  %call3 = tail call double* @RandomVector(i32 %mul2, %struct.Random_struct* %R) #5, !dbg !197
  tail call void @llvm.dbg.value(metadata double* %call3, i64 0, metadata !81, metadata !108), !dbg !198
  %conv4 = sext i32 %nz to i64, !dbg !199
  %mul5 = shl nsw i64 %conv4, 2, !dbg !200
  %call6 = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !201
  %1 = bitcast i8* %call6 to i32*, !dbg !202
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !82, metadata !108), !dbg !203
  %add = add nsw i32 %N, 1, !dbg !204
  %conv7 = sext i32 %add to i64, !dbg !205
  %mul8 = shl nsw i64 %conv7, 2, !dbg !206
  %call9 = tail call noalias i8* @malloc(i64 %mul8) #5, !dbg !207
  %2 = bitcast i8* %call9 to i32*, !dbg !208
  tail call void @llvm.dbg.value(metadata i32* %2, i64 0, metadata !83, metadata !108), !dbg !209
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !84, metadata !108), !dbg !210
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !85, metadata !108), !dbg !211
  %call10 = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !212
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %call10, i64 0, metadata !86, metadata !108), !dbg !213
  store i32 0, i32* %2, align 4, !dbg !214, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !84, metadata !108), !dbg !210
  %cmp80 = icmp sgt i32 %N, 0, !dbg !219
  br i1 %cmp80, label %for.body.lr.ph, label %while.body.preheader, !dbg !220

for.body.lr.ph:                                   ; preds = %entry
  %cmp2178 = icmp sgt i32 %div, 0, !dbg !221
  br i1 %cmp2178, label %for.body.lr.ph.split.us, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge

for.body.lr.ph.for.body.lr.ph.split_crit_edge:    ; preds = %for.body.lr.ph
  %3 = add i32 %N, -1, !dbg !220
  %xtraiter103 = and i32 %N, 3
  %lcmp.mod104 = icmp ne i32 %xtraiter103, 0
  %lcmp.overflow105 = icmp eq i32 %N, 0
  %lcmp.or106 = or i1 %lcmp.overflow105, %lcmp.mod104
  br i1 %lcmp.or106, label %for.cond.loopexit.prol, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split

for.cond.loopexit.prol:                           ; preds = %for.cond.loopexit.prol, %for.body.lr.ph.for.body.lr.ph.split_crit_edge
  %4 = phi i32 [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %add14.prol, %for.cond.loopexit.prol ], !dbg !224
  %indvars.iv.prol = phi i64 [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %indvars.iv.next.prol, %for.cond.loopexit.prol ]
  %prol.iter107 = phi i32 [ %xtraiter103, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %prol.iter107.sub, %for.cond.loopexit.prol ]
  tail call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !87, metadata !108), !dbg !225
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14.prol = add nsw i32 %4, %div, !dbg !227
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !220
  %arrayidx17.prol = getelementptr inbounds i32* %2, i64 %indvars.iv.next.prol, !dbg !228
  store i32 %add14.prol, i32* %arrayidx17.prol, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !220
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %3, !dbg !220
  %prol.iter107.sub = sub i32 %prol.iter107, 1, !dbg !220
  %prol.iter107.cmp = icmp ne i32 %prol.iter107.sub, 0, !dbg !220
  br i1 %prol.iter107.cmp, label %for.cond.loopexit.prol, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split, !llvm.loop !230

for.body.lr.ph.for.body.lr.ph.split_crit_edge.split: ; preds = %for.cond.loopexit.prol, %for.body.lr.ph.for.body.lr.ph.split_crit_edge
  %.unr = phi i32 [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %add14.prol, %for.cond.loopexit.prol ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph.for.body.lr.ph.split_crit_edge ], [ %indvars.iv.next.prol, %for.cond.loopexit.prol ]
  %5 = icmp ult i32 %N, 4
  br i1 %5, label %while.body.preheader.loopexit97, label %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split.split

for.body.lr.ph.for.body.lr.ph.split_crit_edge.split.split: ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split
  br label %for.cond.loopexit, !dbg !220

for.body.lr.ph.split.us:                          ; preds = %for.body.lr.ph
  %6 = add i32 %div, -1, !dbg !220
  %7 = add i32 %N, -1, !dbg !220
  %8 = zext i32 %6 to i64
  %9 = add nuw nsw i64 %8, 1, !dbg !220
  %10 = zext i32 %6 to i64
  %11 = add i64 %10, 1, !dbg !220
  %12 = lshr i64 %11, 1, !dbg !220
  %13 = mul i64 %12, 2, !dbg !220
  %14 = add i64 %13, -2, !dbg !220
  %15 = lshr i64 %14, 1, !dbg !220
  %16 = add i64 %15, 1, !dbg !220
  br label %for.body23.lr.ph.us, !dbg !220

for.body23.us:                                    ; preds = %for.body23.us, %for.body23.us.preheader.split.split
  %indvars.iv82 = phi i64 [ %indvars.iv82.unr, %for.body23.us.preheader.split.split ], [ %indvars.iv.next83.3, %for.body23.us ]
  %17 = mul nsw i64 %indvars.iv82, %32, !dbg !232
  %18 = add nsw i64 %indvars.iv82, %33, !dbg !233
  %arrayidx27.us = getelementptr inbounds i32* %1, i64 %18, !dbg !234
  %19 = trunc i64 %17 to i32, !dbg !234
  store i32 %19, i32* %arrayidx27.us, align 4, !dbg !234, !tbaa !215
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1, !dbg !235
  %lftr.wideiv86 = trunc i64 %indvars.iv82 to i32, !dbg !235
  %20 = mul nsw i64 %indvars.iv.next83, %32, !dbg !232
  %21 = add nsw i64 %indvars.iv.next83, %33, !dbg !233
  %arrayidx27.us.1 = getelementptr inbounds i32* %1, i64 %21, !dbg !234
  %22 = trunc i64 %20 to i32, !dbg !234
  store i32 %22, i32* %arrayidx27.us.1, align 4, !dbg !234, !tbaa !215
  %indvars.iv.next83.1 = add nuw nsw i64 %indvars.iv.next83, 1, !dbg !235
  %lftr.wideiv86.1 = trunc i64 %indvars.iv.next83 to i32, !dbg !235
  %23 = mul nsw i64 %indvars.iv.next83.1, %32, !dbg !232
  %24 = add nsw i64 %indvars.iv.next83.1, %33, !dbg !233
  %arrayidx27.us.2 = getelementptr inbounds i32* %1, i64 %24, !dbg !234
  %25 = trunc i64 %23 to i32, !dbg !234
  store i32 %25, i32* %arrayidx27.us.2, align 4, !dbg !234, !tbaa !215
  %indvars.iv.next83.2 = add nuw nsw i64 %indvars.iv.next83.1, 1, !dbg !235
  %lftr.wideiv86.2 = trunc i64 %indvars.iv.next83.1 to i32, !dbg !235
  %26 = mul nsw i64 %indvars.iv.next83.2, %32, !dbg !232
  %27 = add nsw i64 %indvars.iv.next83.2, %33, !dbg !233
  %arrayidx27.us.3 = getelementptr inbounds i32* %1, i64 %27, !dbg !234
  %28 = trunc i64 %26 to i32, !dbg !234
  store i32 %28, i32* %arrayidx27.us.3, align 4, !dbg !234, !tbaa !215
  %indvars.iv.next83.3 = add nuw nsw i64 %indvars.iv.next83.2, 1, !dbg !235
  %lftr.wideiv86.3 = trunc i64 %indvars.iv.next83.2 to i32, !dbg !235
  %exitcond87.3 = icmp eq i32 %lftr.wideiv86.3, %6, !dbg !235
  br i1 %exitcond87.3, label %for.cond.loopexit.us.loopexit.unr-lcssa, label %for.body23.us, !dbg !235, !llvm.loop !236

for.cond.loopexit.us.loopexit.unr-lcssa:          ; preds = %for.body23.us
  br label %for.cond.loopexit.us.loopexit

for.cond.loopexit.us.loopexit:                    ; preds = %for.body23.us.preheader.split, %for.cond.loopexit.us.loopexit.unr-lcssa
  br label %for.cond.loopexit.us

for.cond.loopexit.us:                             ; preds = %for.cond.loopexit.us.loopexit, %middle.block
  %exitcond91 = icmp eq i32 %30, %7, !dbg !220
  br i1 %exitcond91, label %while.body.preheader.loopexit, label %for.body23.lr.ph.us, !dbg !220

for.body23.lr.ph.us:                              ; preds = %for.body.lr.ph.split.us, %for.cond.loopexit.us
  %29 = phi i32 [ %add14.us, %for.cond.loopexit.us ], [ 0, %for.body.lr.ph.split.us ], !dbg !224
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.cond.loopexit.us ], [ 0, %for.body.lr.ph.split.us ]
  tail call void @llvm.dbg.value(metadata i32 %29, i64 0, metadata !87, metadata !108), !dbg !225
  %30 = trunc i64 %indvars.iv88 to i32, !dbg !239
  %div13.us = sdiv i32 %30, %div, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 %div13.us, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14.us = add nsw i32 %29, %div, !dbg !227
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1, !dbg !220
  %arrayidx17.us = getelementptr inbounds i32* %2, i64 %indvars.iv.next89, !dbg !228
  store i32 %add14.us, i32* %arrayidx17.us, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %cmp18.us = icmp slt i32 %div13.us, 1, !dbg !240
  %31 = sext i32 %div13.us to i64, !dbg !235
  %32 = select i1 %cmp18.us, i64 1, i64 %31, !dbg !235
  %33 = sext i32 %29 to i64, !dbg !235
  %end.idx = add nuw nsw i64 %8, 1, !dbg !235
  %n.vec = and i64 %9, 8589934590, !dbg !235
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !235
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body23.lr.ph.us
  %xtraiter = and i64 %16, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %16, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !235
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %induction9396.prol = or i64 %index.prol, 1
  %34 = mul nsw i64 %index.prol, %32, !dbg !232
  %35 = mul nsw i64 %induction9396.prol, %32, !dbg !232
  %36 = add nsw i64 %index.prol, %33, !dbg !233
  %37 = add nsw i64 %induction9396.prol, %33, !dbg !233
  %38 = getelementptr inbounds i32* %1, i64 %36, !dbg !234
  %39 = getelementptr inbounds i32* %1, i64 %37, !dbg !234
  %40 = trunc i64 %34 to i32, !dbg !234
  %41 = trunc i64 %35 to i32, !dbg !234
  store i32 %40, i32* %38, align 4, !dbg !234, !tbaa !215
  store i32 %41, i32* %39, align 4, !dbg !234, !tbaa !215
  %index.next.prol = add i64 %index.prol, 2, !dbg !235
  %42 = icmp eq i64 %index.next.prol, %n.vec, !dbg !235
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !235
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !235
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !242

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %43 = icmp ult i64 %16, 2
  br i1 %43, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !235
  %induction9396 = or i64 %index, 1
  %44 = mul nsw i64 %index, %32, !dbg !232
  %45 = mul nsw i64 %induction9396, %32, !dbg !232
  %46 = add nsw i64 %index, %33, !dbg !233
  %47 = add nsw i64 %induction9396, %33, !dbg !233
  %48 = getelementptr inbounds i32* %1, i64 %46, !dbg !234
  %49 = getelementptr inbounds i32* %1, i64 %47, !dbg !234
  %50 = trunc i64 %44 to i32, !dbg !234
  %51 = trunc i64 %45 to i32, !dbg !234
  store i32 %50, i32* %48, align 4, !dbg !234, !tbaa !215
  store i32 %51, i32* %49, align 4, !dbg !234, !tbaa !215
  %index.next = add i64 %index, 2, !dbg !235
  %induction9396.1 = or i64 %index.next, 1
  %52 = mul nsw i64 %index.next, %32, !dbg !232
  %53 = mul nsw i64 %induction9396.1, %32, !dbg !232
  %54 = add nsw i64 %index.next, %33, !dbg !233
  %55 = add nsw i64 %induction9396.1, %33, !dbg !233
  %56 = getelementptr inbounds i32* %1, i64 %54, !dbg !234
  %57 = getelementptr inbounds i32* %1, i64 %55, !dbg !234
  %58 = trunc i64 %52 to i32, !dbg !234
  %59 = trunc i64 %53 to i32, !dbg !234
  store i32 %58, i32* %56, align 4, !dbg !234, !tbaa !215
  store i32 %59, i32* %57, align 4, !dbg !234, !tbaa !215
  %index.next.1 = add i64 %index.next, 2, !dbg !235
  %60 = icmp eq i64 %index.next.1, %n.vec, !dbg !235
  br i1 %60, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !235, !llvm.loop !243

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.body23.lr.ph.us
  %resume.val = phi i64 [ 0, %for.body23.lr.ph.us ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.cond.loopexit.us, label %for.body23.us.preheader

for.body23.us.preheader:                          ; preds = %middle.block
  %61 = trunc i64 %resume.val to i32
  %62 = sub i32 %div, %61
  %xtraiter98 = and i32 %62, 3
  %lcmp.mod99 = icmp ne i32 %xtraiter98, 0
  %lcmp.overflow100 = icmp eq i32 %62, 0
  %lcmp.or101 = or i1 %lcmp.overflow100, %lcmp.mod99
  br i1 %lcmp.or101, label %for.body23.us.prol.preheader, label %for.body23.us.preheader.split

for.body23.us.prol.preheader:                     ; preds = %for.body23.us.preheader
  br label %for.body23.us.prol, !dbg !232

for.body23.us.prol:                               ; preds = %for.body23.us.prol.preheader, %for.body23.us.prol
  %indvars.iv82.prol = phi i64 [ %indvars.iv.next83.prol, %for.body23.us.prol ], [ %resume.val, %for.body23.us.prol.preheader ]
  %prol.iter102 = phi i32 [ %prol.iter102.sub, %for.body23.us.prol ], [ %xtraiter98, %for.body23.us.prol.preheader ]
  %63 = mul nsw i64 %indvars.iv82.prol, %32, !dbg !232
  %64 = add nsw i64 %indvars.iv82.prol, %33, !dbg !233
  %arrayidx27.us.prol = getelementptr inbounds i32* %1, i64 %64, !dbg !234
  %65 = trunc i64 %63 to i32, !dbg !234
  store i32 %65, i32* %arrayidx27.us.prol, align 4, !dbg !234, !tbaa !215
  %indvars.iv.next83.prol = add nuw nsw i64 %indvars.iv82.prol, 1, !dbg !235
  %lftr.wideiv86.prol = trunc i64 %indvars.iv82.prol to i32, !dbg !235
  %exitcond87.prol = icmp eq i32 %lftr.wideiv86.prol, %6, !dbg !235
  %prol.iter102.sub = sub i32 %prol.iter102, 1, !dbg !235
  %prol.iter102.cmp = icmp ne i32 %prol.iter102.sub, 0, !dbg !235
  br i1 %prol.iter102.cmp, label %for.body23.us.prol, label %for.body23.us.preheader.split.loopexit, !llvm.loop !244

for.body23.us.preheader.split.loopexit:           ; preds = %for.body23.us.prol
  %indvars.iv82.unr.ph = phi i64 [ %indvars.iv.next83.prol, %for.body23.us.prol ]
  br label %for.body23.us.preheader.split

for.body23.us.preheader.split:                    ; preds = %for.body23.us.preheader.split.loopexit, %for.body23.us.preheader
  %indvars.iv82.unr = phi i64 [ %resume.val, %for.body23.us.preheader ], [ %indvars.iv82.unr.ph, %for.body23.us.preheader.split.loopexit ]
  %66 = icmp ult i32 %62, 4
  br i1 %66, label %for.cond.loopexit.us.loopexit, label %for.body23.us.preheader.split.split

for.body23.us.preheader.split.split:              ; preds = %for.body23.us.preheader.split
  br label %for.body23.us, !dbg !232

for.cond.loopexit:                                ; preds = %for.cond.loopexit, %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split.split
  %67 = phi i32 [ %.unr, %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split.split ], [ %add14.3, %for.cond.loopexit ], !dbg !224
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split.split ], [ %indvars.iv.next.3, %for.cond.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !87, metadata !108), !dbg !225
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14 = add nsw i32 %67, %div, !dbg !227
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !220
  %arrayidx17 = getelementptr inbounds i32* %2, i64 %indvars.iv.next, !dbg !228
  store i32 %add14, i32* %arrayidx17, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !87, metadata !108), !dbg !225
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14.1 = add nsw i32 %add14, %div, !dbg !227
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !220
  %arrayidx17.1 = getelementptr inbounds i32* %2, i64 %indvars.iv.next.1, !dbg !228
  store i32 %add14.1, i32* %arrayidx17.1, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !87, metadata !108), !dbg !225
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14.2 = add nsw i32 %add14.1, %div, !dbg !227
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !220
  %arrayidx17.2 = getelementptr inbounds i32* %2, i64 %indvars.iv.next.2, !dbg !228
  store i32 %add14.2, i32* %arrayidx17.2, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !220
  tail call void @llvm.dbg.value(metadata i32 %67, i64 0, metadata !87, metadata !108), !dbg !225
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %add14.3 = add nsw i32 %add14.2, %div, !dbg !227
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !220
  %arrayidx17.3 = getelementptr inbounds i32* %2, i64 %indvars.iv.next.3, !dbg !228
  store i32 %add14.3, i32* %arrayidx17.3, align 4, !dbg !228, !tbaa !215
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !91, metadata !108), !dbg !229
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !92, metadata !108), !dbg !226
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !220
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %3, !dbg !220
  br i1 %exitcond.3, label %while.body.preheader.loopexit97.unr-lcssa, label %for.cond.loopexit, !dbg !220

while.body.preheader.loopexit:                    ; preds = %for.cond.loopexit.us
  br label %while.body.preheader

while.body.preheader.loopexit97.unr-lcssa:        ; preds = %for.cond.loopexit
  br label %while.body.preheader.loopexit97

while.body.preheader.loopexit97:                  ; preds = %for.body.lr.ph.for.body.lr.ph.split_crit_edge.split, %while.body.preheader.loopexit97.unr-lcssa
  br label %while.body.preheader

while.body.preheader:                             ; preds = %while.body.preheader.loopexit97, %while.body.preheader.loopexit, %entry
  br label %while.body, !dbg !245

while.body:                                       ; preds = %while.body.preheader, %while.body
  %cycles.0 = phi i32 [ %mul36, %while.body ], [ 1, %while.body.preheader ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call10) #5, !dbg !245
  %mul31 = shl nsw i32 %cycles.0, 6, !dbg !247
  tail call void @SparseCompRow_matmult(i32 %N, double* %0, double* %call3, i32* %2, i32* %1, double* %call, i32 %mul31) #5, !dbg !248
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call10) #5, !dbg !249
  %cmp32 = icmp sgt i32 %cycles.0, 4096, !dbg !250
  %mul36 = shl nsw i32 %cycles.0, 1, !dbg !252
  tail call void @llvm.dbg.value(metadata i32 %mul36, i64 0, metadata !85, metadata !108), !dbg !211
  br i1 %cmp32, label %while.end, label %while.body, !dbg !253

while.end:                                        ; preds = %while.body
  %call37 = tail call double @SparseCompRow_num_flops(i32 %N, i32 %nz, i32 8192) #5, !dbg !254
  %call38 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %call10) #5, !dbg !255
  %div39 = fdiv double %call37, %call38, !dbg !254
  %mul40 = fmul double %div39, 1.000000e-06, !dbg !254
  tail call void @llvm.dbg.value(metadata double %mul40, i64 0, metadata !78, metadata !108), !dbg !192
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %call10) #5, !dbg !256
  tail call void @free(i8* %call9) #5, !dbg !257
  tail call void @free(i8* %call6) #5, !dbg !258
  %68 = bitcast double* %call3 to i8*, !dbg !259
  tail call void @free(i8* %68) #5, !dbg !260
  tail call void @free(i8* %call1) #5, !dbg !261
  %69 = bitcast double* %call to i8*, !dbg !262
  tail call void @free(i8* %69) #5, !dbg !263
  ret double %mul40, !dbg !264
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @SparseCompRow_matmult(i32, double*, double*, i32*, i32*, double*, i32) #1

declare double @SparseCompRow_num_flops(i32, i32, i32) #1

; Function Attrs: nounwind uwtable
define double @kernel_measureLU(i32 %N, double %min_time, %struct.Random_struct* %R) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !95, metadata !108), !dbg !265
  tail call void @llvm.dbg.value(metadata double %min_time, i64 0, metadata !96, metadata !108), !dbg !266
  tail call void @llvm.dbg.value(metadata %struct.Random_struct* %R, i64 0, metadata !97, metadata !108), !dbg !267
  tail call void @llvm.dbg.value(metadata double** null, i64 0, metadata !98, metadata !108), !dbg !268
  tail call void @llvm.dbg.value(metadata double** null, i64 0, metadata !99, metadata !108), !dbg !269
  tail call void @llvm.dbg.value(metadata i32* null, i64 0, metadata !100, metadata !108), !dbg !270
  %call = tail call %struct.Stopwatch_struct* @new_Stopwatch() #5, !dbg !271
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %call, i64 0, metadata !101, metadata !108), !dbg !272
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !102, metadata !108), !dbg !273
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !103, metadata !108), !dbg !274
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !104, metadata !108), !dbg !275
  %call1 = tail call double** @RandomMatrix(i32 %N, i32 %N, %struct.Random_struct* %R) #5, !dbg !276
  tail call void @llvm.dbg.value(metadata double** %call1, i64 0, metadata !98, metadata !108), !dbg !268
  %cmp = icmp eq double** %call1, null, !dbg !278
  br i1 %cmp, label %if.then, label %if.end, !dbg !279

if.then:                                          ; preds = %entry
  tail call void @exit(i32 1) #6, !dbg !280
  unreachable, !dbg !280

if.end:                                           ; preds = %entry
  %call2 = tail call double** @new_Array2D_double(i32 %N, i32 %N) #5, !dbg !282
  tail call void @llvm.dbg.value(metadata double** %call2, i64 0, metadata !99, metadata !108), !dbg !269
  %cmp3 = icmp eq double** %call2, null, !dbg !284
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !285

if.then4:                                         ; preds = %if.end
  tail call void @exit(i32 1) #6, !dbg !286
  unreachable, !dbg !286

if.end5:                                          ; preds = %if.end
  %conv = sext i32 %N to i64, !dbg !288
  %mul = shl nsw i64 %conv, 2, !dbg !288
  %call6 = tail call noalias i8* @malloc(i64 %mul) #5, !dbg !290
  %0 = bitcast i8* %call6 to i32*, !dbg !291
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !100, metadata !108), !dbg !270
  %cmp7 = icmp eq i8* %call6, null, !dbg !292
  br i1 %cmp7, label %if.then9, label %while.body.preheader, !dbg !293

while.body.preheader:                             ; preds = %if.end5
  br label %while.body, !dbg !294

if.then9:                                         ; preds = %if.end5
  tail call void @exit(i32 1) #6, !dbg !296
  unreachable, !dbg !296

while.body:                                       ; preds = %while.body.preheader, %while.body.backedge
  %cycles.0 = phi i32 [ %cycles.0.be, %while.body.backedge ], [ 1, %while.body.preheader ]
  tail call void @Stopwatch_start(%struct.Stopwatch_struct* %call) #5, !dbg !294
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !103, metadata !108), !dbg !274
  %cmp1148 = icmp sgt i32 %cycles.0, 0, !dbg !298
  br i1 %cmp1148, label %for.body.lr.ph, label %for.end.thread, !dbg !301

for.end.thread:                                   ; preds = %while.body
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !302
  br label %while.body.backedge, !dbg !303

for.body.lr.ph:                                   ; preds = %while.body
  %1 = add i32 %cycles.0, -1, !dbg !301
  br label %for.body, !dbg !301

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.049 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  tail call void @Array2D_double_copy(i32 %N, i32 %N, double** %call2, double** %call1) #5, !dbg !304
  %call13 = tail call i32 @LU_factor(i32 %N, i32 %N, double** %call2, i32* %0) #5, !dbg !306
  %inc = add nuw nsw i32 %i.049, 1, !dbg !307
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !103, metadata !108), !dbg !274
  %exitcond = icmp eq i32 %i.049, %1, !dbg !301
  br i1 %exitcond, label %for.end, label %for.body, !dbg !301

for.end:                                          ; preds = %for.body
  tail call void @Stopwatch_stop(%struct.Stopwatch_struct* %call) #5, !dbg !302
  %cmp14 = icmp sgt i32 %cycles.0, 4096, !dbg !308
  br i1 %cmp14, label %while.end, label %while.body.backedge, !dbg !303

while.body.backedge:                              ; preds = %for.end, %for.end.thread
  %cycles.0.be = shl nsw i32 %cycles.0, 1, !dbg !310
  br label %while.body

while.end:                                        ; preds = %for.end
  %call19 = tail call double @LU_num_flops(i32 %N) #5, !dbg !311
  %mul21 = fmul double %call19, 8.192000e+03, !dbg !311
  %call22 = tail call double @Stopwatch_read(%struct.Stopwatch_struct* %call) #5, !dbg !312
  %div = fdiv double %mul21, %call22, !dbg !311
  %mul23 = fmul double %div, 1.000000e-06, !dbg !311
  tail call void @llvm.dbg.value(metadata double %mul23, i64 0, metadata !102, metadata !108), !dbg !273
  tail call void @Stopwatch_delete(%struct.Stopwatch_struct* %call) #5, !dbg !313
  tail call void @free(i8* %call6) #5, !dbg !314
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %call2) #5, !dbg !315
  tail call void @Array2D_double_delete(i32 %N, i32 %N, double** %call1) #5, !dbg !316
  ret double %mul23, !dbg !317
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare double** @new_Array2D_double(i32, i32) #1

declare void @Array2D_double_copy(i32, i32, double**, double**) #1

declare i32 @LU_factor(i32, i32, double**, i32*) #1

declare double @LU_num_flops(i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!105, !106}
!llvm.ident = !{!107}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c] [DW_LANG_C99]
!1 = !{!"kernel.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4, !6, !8}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!7 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !49, !59, !68, !93}
!10 = !{!"0x2e\00kernel_measureFFT\00kernel_measureFFT\00\0019\000\001\000\000\00256\001\0020", !1, !11, !12, null, double (i32, double, %struct.Random_struct*)* @kernel_measureFFT, null, null, !30} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [kernel_measureFFT]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!5, !7, !5, !14}
!14 = !{!"0x16\00Random\0012\000\000\000\000", !15, null, !16} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!15 = !{!"./Random.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0x13\00\001\00896\0064\000\000\000", !15, null, null, !18, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!18 = !{!19, !23, !24, !25, !26, !27, !28, !29}
!19 = !{!"0xd\00m\003\00544\0032\000\000", !15, !17, !20} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!20 = !{!"0x1\00\000\00544\0032\000\000\000", null, null, !7, !21, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!21 = !{!22}
!22 = !{!"0x21\000\0017"}                         ; [ DW_TAG_subrange_type ] [0, 16]
!23 = !{!"0xd\00seed\004\0032\0032\00544\000", !15, !17, !7} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!24 = !{!"0xd\00i\005\0032\0032\00576\000", !15, !17, !7} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!25 = !{!"0xd\00j\006\0032\0032\00608\000", !15, !17, !7} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!26 = !{!"0xd\00haveRange\007\0032\0032\00640\000", !15, !17, !7} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!27 = !{!"0xd\00left\008\0064\0064\00704\000", !15, !17, !5} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!28 = !{!"0xd\00right\009\0064\0064\00768\000", !15, !17, !5} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!29 = !{!"0xd\00width\0010\0064\0064\00832\000", !15, !17, !5} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!30 = !{!31, !32, !33, !34, !35, !36, !38, !47, !48}
!31 = !{!"0x101\00N\0016777235\000", !10, !11, !7} ; [ DW_TAG_arg_variable ] [N] [line 19]
!32 = !{!"0x101\00mintime\0033554451\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [mintime] [line 19]
!33 = !{!"0x101\00R\0050331667\000", !10, !11, !14} ; [ DW_TAG_arg_variable ] [R] [line 19]
!34 = !{!"0x100\00twoN\0023\000", !10, !11, !7}   ; [ DW_TAG_auto_variable ] [twoN] [line 23]
!35 = !{!"0x100\00x\0024\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [x] [line 24]
!36 = !{!"0x100\00cycles\0025\000", !10, !11, !37} ; [ DW_TAG_auto_variable ] [cycles] [line 25]
!37 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!38 = !{!"0x100\00Q\0026\000", !10, !11, !39}     ; [ DW_TAG_auto_variable ] [Q] [line 26]
!39 = !{!"0x16\00Stopwatch\009\000\000\000\000", !40, null, !41} ; [ DW_TAG_typedef ] [Stopwatch] [line 9, size 0, align 0, offset 0] [from ]
!40 = !{!"./Stopwatch.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!41 = !{!"0xf\00\000\0064\0064\000\000", null, null, !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = !{!"0x13\00\004\00192\0064\000\000\000", !40, null, null, !43, null, null, null} ; [ DW_TAG_structure_type ] [line 4, size 192, align 64, offset 0] [def] [from ]
!43 = !{!44, !45, !46}
!44 = !{!"0xd\00running\005\0032\0032\000\000", !40, !42, !7} ; [ DW_TAG_member ] [running] [line 5, size 32, align 32, offset 0] [from int]
!45 = !{!"0xd\00last_time\006\0064\0064\0064\000", !40, !42, !5} ; [ DW_TAG_member ] [last_time] [line 6, size 64, align 64, offset 64] [from double]
!46 = !{!"0xd\00total\007\0064\0064\00128\000", !40, !42, !5} ; [ DW_TAG_member ] [total] [line 7, size 64, align 64, offset 128] [from double]
!47 = !{!"0x100\00i\0027\000", !10, !11, !7}      ; [ DW_TAG_auto_variable ] [i] [line 27]
!48 = !{!"0x100\00result\0028\000", !10, !11, !5} ; [ DW_TAG_auto_variable ] [result] [line 28]
!49 = !{!"0x2e\00kernel_measureSOR\00kernel_measureSOR\00\0053\000\001\000\000\00256\001\0054", !1, !11, !12, null, double (i32, double, %struct.Random_struct*)* @kernel_measureSOR, null, null, !50} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [kernel_measureSOR]
!50 = !{!51, !52, !53, !54, !56, !57, !58}
!51 = !{!"0x101\00N\0016777269\000", !49, !11, !7} ; [ DW_TAG_arg_variable ] [N] [line 53]
!52 = !{!"0x101\00min_time\0033554485\000", !49, !11, !5} ; [ DW_TAG_arg_variable ] [min_time] [line 53]
!53 = !{!"0x101\00R\0050331701\000", !49, !11, !14} ; [ DW_TAG_arg_variable ] [R] [line 53]
!54 = !{!"0x100\00G\0055\000", !49, !11, !55}     ; [ DW_TAG_auto_variable ] [G] [line 55]
!55 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!56 = !{!"0x100\00result\0056\000", !49, !11, !5} ; [ DW_TAG_auto_variable ] [result] [line 56]
!57 = !{!"0x100\00Q\0058\000", !49, !11, !39}     ; [ DW_TAG_auto_variable ] [Q] [line 58]
!58 = !{!"0x100\00cycles\0059\000", !49, !11, !7} ; [ DW_TAG_auto_variable ] [cycles] [line 59]
!59 = !{!"0x2e\00kernel_measureMonteCarlo\00kernel_measureMonteCarlo\00\0082\000\001\000\000\00256\001\0083", !1, !11, !60, null, double (double, %struct.Random_struct*)* @kernel_measureMonteCarlo, null, null, !62} ; [ DW_TAG_subprogram ] [line 82] [def] [scope 83] [kernel_measureMonteCarlo]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{!5, !5, !14}
!62 = !{!63, !64, !65, !66, !67}
!63 = !{!"0x101\00min_time\0016777298\000", !59, !11, !5} ; [ DW_TAG_arg_variable ] [min_time] [line 82]
!64 = !{!"0x101\00R\0033554514\000", !59, !11, !14} ; [ DW_TAG_arg_variable ] [R] [line 82]
!65 = !{!"0x100\00result\0084\000", !59, !11, !5} ; [ DW_TAG_auto_variable ] [result] [line 84]
!66 = !{!"0x100\00Q\0085\000", !59, !11, !39}     ; [ DW_TAG_auto_variable ] [Q] [line 85]
!67 = !{!"0x100\00cycles\0087\000", !59, !11, !7} ; [ DW_TAG_auto_variable ] [cycles] [line 87]
!68 = !{!"0x2e\00kernel_measureSparseMatMult\00kernel_measureSparseMatMult\00\00104\000\001\000\000\00256\001\00106", !1, !11, !69, null, double (i32, i32, double, %struct.Random_struct*)* @kernel_measureSparseMatMult, null, null, !71} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 106] [kernel_measureSparseMatMult]
!69 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !70, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{!5, !7, !7, !5, !14}
!71 = !{!72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !91, !92}
!72 = !{!"0x101\00N\0016777320\000", !68, !11, !7} ; [ DW_TAG_arg_variable ] [N] [line 104]
!73 = !{!"0x101\00nz\0033554536\000", !68, !11, !7} ; [ DW_TAG_arg_variable ] [nz] [line 104]
!74 = !{!"0x101\00min_time\0050331753\000", !68, !11, !5} ; [ DW_TAG_arg_variable ] [min_time] [line 105]
!75 = !{!"0x101\00R\0067108969\000", !68, !11, !14} ; [ DW_TAG_arg_variable ] [R] [line 105]
!76 = !{!"0x100\00x\00110\000", !68, !11, !4}     ; [ DW_TAG_auto_variable ] [x] [line 110]
!77 = !{!"0x100\00y\00111\000", !68, !11, !4}     ; [ DW_TAG_auto_variable ] [y] [line 111]
!78 = !{!"0x100\00result\00113\000", !68, !11, !5} ; [ DW_TAG_auto_variable ] [result] [line 113]
!79 = !{!"0x100\00nr\00138\000", !68, !11, !7}    ; [ DW_TAG_auto_variable ] [nr] [line 138]
!80 = !{!"0x100\00anz\00139\000", !68, !11, !7}   ; [ DW_TAG_auto_variable ] [anz] [line 139]
!81 = !{!"0x100\00val\00142\000", !68, !11, !4}   ; [ DW_TAG_auto_variable ] [val] [line 142]
!82 = !{!"0x100\00col\00143\000", !68, !11, !6}   ; [ DW_TAG_auto_variable ] [col] [line 143]
!83 = !{!"0x100\00row\00144\000", !68, !11, !6}   ; [ DW_TAG_auto_variable ] [row] [line 144]
!84 = !{!"0x100\00r\00145\000", !68, !11, !7}     ; [ DW_TAG_auto_variable ] [r] [line 145]
!85 = !{!"0x100\00cycles\00146\000", !68, !11, !7} ; [ DW_TAG_auto_variable ] [cycles] [line 146]
!86 = !{!"0x100\00Q\00148\000", !68, !11, !39}    ; [ DW_TAG_auto_variable ] [Q] [line 148]
!87 = !{!"0x100\00rowr\00155\000", !88, !11, !7}  ; [ DW_TAG_auto_variable ] [rowr] [line 155]
!88 = !{!"0xb\00152\009\0011", !1, !89}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!89 = !{!"0xb\00151\009\0010", !1, !90}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!90 = !{!"0xb\00151\009\009", !1, !68}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!91 = !{!"0x100\00step\00156\000", !88, !11, !7}  ; [ DW_TAG_auto_variable ] [step] [line 156]
!92 = !{!"0x100\00i\00157\000", !88, !11, !7}     ; [ DW_TAG_auto_variable ] [i] [line 157]
!93 = !{!"0x2e\00kernel_measureLU\00kernel_measureLU\00\00193\000\001\000\000\00256\001\00194", !1, !11, !12, null, double (i32, double, %struct.Random_struct*)* @kernel_measureLU, null, null, !94} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [kernel_measureLU]
!94 = !{!95, !96, !97, !98, !99, !100, !101, !102, !103, !104}
!95 = !{!"0x101\00N\0016777409\000", !93, !11, !7} ; [ DW_TAG_arg_variable ] [N] [line 193]
!96 = !{!"0x101\00min_time\0033554625\000", !93, !11, !5} ; [ DW_TAG_arg_variable ] [min_time] [line 193]
!97 = !{!"0x101\00R\0050331841\000", !93, !11, !14} ; [ DW_TAG_arg_variable ] [R] [line 193]
!98 = !{!"0x100\00A\00196\000", !93, !11, !55}    ; [ DW_TAG_auto_variable ] [A] [line 196]
!99 = !{!"0x100\00lu\00197\000", !93, !11, !55}   ; [ DW_TAG_auto_variable ] [lu] [line 197]
!100 = !{!"0x100\00pivot\00198\000", !93, !11, !6} ; [ DW_TAG_auto_variable ] [pivot] [line 198]
!101 = !{!"0x100\00Q\00202\000", !93, !11, !39}   ; [ DW_TAG_auto_variable ] [Q] [line 202]
!102 = !{!"0x100\00result\00203\000", !93, !11, !5} ; [ DW_TAG_auto_variable ] [result] [line 203]
!103 = !{!"0x100\00i\00204\000", !93, !11, !7}    ; [ DW_TAG_auto_variable ] [i] [line 204]
!104 = !{!"0x100\00cycles\00205\000", !93, !11, !7} ; [ DW_TAG_auto_variable ] [cycles] [line 205]
!105 = !{i32 2, !"Dwarf Version", i32 4}
!106 = !{i32 2, !"Debug Info Version", i32 2}
!107 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!108 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!109 = !MDLocation(line: 19, column: 34, scope: !10)
!110 = !MDLocation(line: 19, column: 44, scope: !10)
!111 = !MDLocation(line: 19, column: 60, scope: !10)
!112 = !MDLocation(line: 23, column: 20, scope: !10)
!113 = !MDLocation(line: 23, column: 13, scope: !10)
!114 = !MDLocation(line: 24, column: 21, scope: !10)
!115 = !MDLocation(line: 24, column: 17, scope: !10)
!116 = !MDLocation(line: 25, column: 14, scope: !10)
!117 = !MDLocation(line: 26, column: 23, scope: !10)
!118 = !MDLocation(line: 26, column: 19, scope: !10)
!119 = !MDLocation(line: 27, column: 13, scope: !10)
!120 = !MDLocation(line: 28, column: 16, scope: !10)
!121 = !MDLocation(line: 30, column: 9, scope: !10)
!122 = !MDLocation(line: 32, column: 13, scope: !123)
!123 = !{!"0xb\0031\009\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!124 = !MDLocation(line: 33, column: 25, scope: !125)
!125 = !{!"0xb\0033\0013\002", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!126 = !{!"0xb\0033\0013\001", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!127 = !MDLocation(line: 33, column: 23, scope: !125)
!128 = !MDLocation(line: 33, column: 13, scope: !126)
!129 = !MDLocation(line: 35, column: 17, scope: !130)
!130 = !{!"0xb\0034\0013\003", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!131 = !MDLocation(line: 38, column: 13, scope: !123)
!132 = !MDLocation(line: 39, column: 17, scope: !123)
!133 = !MDLocation(line: 36, column: 17, scope: !130)
!134 = !MDLocation(line: 39, column: 17, scope: !135)
!135 = !{!"0xb\0039\0017\004", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!136 = !MDLocation(line: 42, column: 13, scope: !123)
!137 = !MDLocation(line: 47, column: 18, scope: !10)
!138 = !MDLocation(line: 47, column: 43, scope: !10)
!139 = !MDLocation(line: 48, column: 9, scope: !10)
!140 = !MDLocation(line: 49, column: 14, scope: !10)
!141 = !MDLocation(line: 49, column: 9, scope: !10)
!142 = !MDLocation(line: 50, column: 9, scope: !10)
!143 = !MDLocation(line: 53, column: 34, scope: !49)
!144 = !MDLocation(line: 53, column: 44, scope: !49)
!145 = !MDLocation(line: 53, column: 61, scope: !49)
!146 = !MDLocation(line: 55, column: 22, scope: !49)
!147 = !MDLocation(line: 55, column: 18, scope: !49)
!148 = !MDLocation(line: 56, column: 16, scope: !49)
!149 = !MDLocation(line: 58, column: 23, scope: !49)
!150 = !MDLocation(line: 58, column: 19, scope: !49)
!151 = !MDLocation(line: 59, column: 13, scope: !49)
!152 = !MDLocation(line: 60, column: 9, scope: !49)
!153 = !MDLocation(line: 62, column: 13, scope: !154)
!154 = !{!"0xb\0061\009\005", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!155 = !MDLocation(line: 63, column: 40, scope: !154)
!156 = !MDLocation(line: 63, column: 13, scope: !154)
!157 = !MDLocation(line: 64, column: 13, scope: !154)
!158 = !MDLocation(line: 66, column: 17, scope: !159)
!159 = !{!"0xb\0066\0017\006", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!160 = !MDLocation(line: 69, column: 13, scope: !154)
!161 = !MDLocation(line: 66, column: 17, scope: !154)
!162 = !MDLocation(line: 73, column: 18, scope: !49)
!163 = !MDLocation(line: 73, column: 48, scope: !49)
!164 = !MDLocation(line: 74, column: 9, scope: !49)
!165 = !MDLocation(line: 75, column: 9, scope: !49)
!166 = !MDLocation(line: 76, column: 9, scope: !49)
!167 = !MDLocation(line: 82, column: 44, scope: !59)
!168 = !MDLocation(line: 82, column: 61, scope: !59)
!169 = !MDLocation(line: 84, column: 16, scope: !59)
!170 = !MDLocation(line: 85, column: 23, scope: !59)
!171 = !MDLocation(line: 85, column: 19, scope: !59)
!172 = !MDLocation(line: 87, column: 13, scope: !59)
!173 = !MDLocation(line: 90, column: 13, scope: !174)
!174 = !{!"0xb\0089\009\007", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!175 = !MDLocation(line: 91, column: 13, scope: !174)
!176 = !MDLocation(line: 92, column: 13, scope: !174)
!177 = !MDLocation(line: 98, column: 18, scope: !59)
!178 = !MDLocation(line: 98, column: 49, scope: !59)
!179 = !MDLocation(line: 99, column: 9, scope: !59)
!180 = !MDLocation(line: 100, column: 9, scope: !59)
!181 = !MDLocation(line: 104, column: 44, scope: !68)
!182 = !MDLocation(line: 104, column: 51, scope: !68)
!183 = !MDLocation(line: 105, column: 20, scope: !68)
!184 = !MDLocation(line: 105, column: 37, scope: !68)
!185 = !MDLocation(line: 110, column: 21, scope: !68)
!186 = !MDLocation(line: 110, column: 17, scope: !68)
!187 = !MDLocation(line: 111, column: 53, scope: !68)
!188 = !MDLocation(line: 111, column: 38, scope: !68)
!189 = !MDLocation(line: 111, column: 31, scope: !68)
!190 = !MDLocation(line: 111, column: 21, scope: !68)
!191 = !MDLocation(line: 111, column: 17, scope: !68)
!192 = !MDLocation(line: 113, column: 16, scope: !68)
!193 = !MDLocation(line: 138, column: 18, scope: !68)
!194 = !MDLocation(line: 138, column: 13, scope: !68)
!195 = !MDLocation(line: 139, column: 19, scope: !68)
!196 = !MDLocation(line: 139, column: 13, scope: !68)
!197 = !MDLocation(line: 142, column: 23, scope: !68)
!198 = !MDLocation(line: 142, column: 17, scope: !68)
!199 = !MDLocation(line: 143, column: 46, scope: !68)
!200 = !MDLocation(line: 143, column: 34, scope: !68)
!201 = !MDLocation(line: 143, column: 27, scope: !68)
!202 = !MDLocation(line: 143, column: 20, scope: !68)
!203 = !MDLocation(line: 143, column: 14, scope: !68)
!204 = !MDLocation(line: 144, column: 47, scope: !68)
!205 = !MDLocation(line: 144, column: 46, scope: !68)
!206 = !MDLocation(line: 144, column: 34, scope: !68)
!207 = !MDLocation(line: 144, column: 27, scope: !68)
!208 = !MDLocation(line: 144, column: 20, scope: !68)
!209 = !MDLocation(line: 144, column: 14, scope: !68)
!210 = !MDLocation(line: 145, column: 13, scope: !68)
!211 = !MDLocation(line: 146, column: 13, scope: !68)
!212 = !MDLocation(line: 148, column: 23, scope: !68)
!213 = !MDLocation(line: 148, column: 19, scope: !68)
!214 = !MDLocation(line: 150, column: 9, scope: !68)
!215 = !{!216, !216, i64 0}
!216 = !{!"int", !217, i64 0}
!217 = !{!"omnipotent char", !218, i64 0}
!218 = !{!"Simple C/C++ TBAA"}
!219 = !MDLocation(line: 151, column: 19, scope: !89)
!220 = !MDLocation(line: 151, column: 9, scope: !90)
!221 = !MDLocation(line: 163, column: 23, scope: !222)
!222 = !{!"0xb\00163\0013\0014", !1, !223}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!223 = !{!"0xb\00163\0013\0013", !1, !88}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!224 = !MDLocation(line: 155, column: 24, scope: !88)
!225 = !MDLocation(line: 155, column: 17, scope: !88)
!226 = !MDLocation(line: 157, column: 17, scope: !88)
!227 = !MDLocation(line: 159, column: 24, scope: !88)
!228 = !MDLocation(line: 159, column: 13, scope: !88)
!229 = !MDLocation(line: 156, column: 17, scope: !88)
!230 = distinct !{!230, !231}
!231 = !{!"llvm.loop.unroll.disable"}
!232 = !MDLocation(line: 164, column: 31, scope: !222)
!233 = !MDLocation(line: 164, column: 21, scope: !222)
!234 = !MDLocation(line: 164, column: 17, scope: !222)
!235 = !MDLocation(line: 163, column: 13, scope: !223)
!236 = distinct !{!236, !237, !238}
!237 = !{!"llvm.loop.vectorize.width", i32 1}
!238 = !{!"llvm.loop.interleave.count", i32 1}
!239 = !MDLocation(line: 156, column: 24, scope: !88)
!240 = !MDLocation(line: 160, column: 17, scope: !241)
!241 = !{!"0xb\00160\0017\0012", !1, !88}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!242 = distinct !{!242, !231}
!243 = distinct !{!243, !237, !238}
!244 = distinct !{!244, !231}
!245 = !MDLocation(line: 171, column: 13, scope: !246)
!246 = !{!"0xb\00170\009\0015", !1, !68}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!247 = !MDLocation(line: 172, column: 59, scope: !246)
!248 = !MDLocation(line: 172, column: 13, scope: !246)
!249 = !MDLocation(line: 173, column: 13, scope: !246)
!250 = !MDLocation(line: 174, column: 17, scope: !251)
!251 = !{!"0xb\00174\0017\0016", !1, !246}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!252 = !MDLocation(line: 176, column: 13, scope: !246)
!253 = !MDLocation(line: 174, column: 17, scope: !246)
!254 = !MDLocation(line: 179, column: 18, scope: !68)
!255 = !MDLocation(line: 180, column: 25, scope: !68)
!256 = !MDLocation(line: 182, column: 9, scope: !68)
!257 = !MDLocation(line: 183, column: 9, scope: !68)
!258 = !MDLocation(line: 184, column: 9, scope: !68)
!259 = !MDLocation(line: 185, column: 14, scope: !68)
!260 = !MDLocation(line: 185, column: 9, scope: !68)
!261 = !MDLocation(line: 186, column: 9, scope: !68)
!262 = !MDLocation(line: 187, column: 14, scope: !68)
!263 = !MDLocation(line: 187, column: 9, scope: !68)
!264 = !MDLocation(line: 189, column: 9, scope: !68)
!265 = !MDLocation(line: 193, column: 33, scope: !93)
!266 = !MDLocation(line: 193, column: 43, scope: !93)
!267 = !MDLocation(line: 193, column: 60, scope: !93)
!268 = !MDLocation(line: 196, column: 18, scope: !93)
!269 = !MDLocation(line: 197, column: 18, scope: !93)
!270 = !MDLocation(line: 198, column: 14, scope: !93)
!271 = !MDLocation(line: 202, column: 23, scope: !93)
!272 = !MDLocation(line: 202, column: 19, scope: !93)
!273 = !MDLocation(line: 203, column: 16, scope: !93)
!274 = !MDLocation(line: 204, column: 13, scope: !93)
!275 = !MDLocation(line: 205, column: 13, scope: !93)
!276 = !MDLocation(line: 207, column: 18, scope: !277)
!277 = !{!"0xb\00207\0013\0017", !1, !93}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!278 = !MDLocation(line: 207, column: 13, scope: !277)
!279 = !MDLocation(line: 207, column: 13, scope: !93)
!280 = !MDLocation(line: 207, column: 51, scope: !281)
!281 = !{!"0xb\001", !1, !277}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!282 = !MDLocation(line: 208, column: 19, scope: !283)
!283 = !{!"0xb\00208\0013\0018", !1, !93}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!284 = !MDLocation(line: 208, column: 13, scope: !283)
!285 = !MDLocation(line: 208, column: 13, scope: !93)
!286 = !MDLocation(line: 208, column: 54, scope: !287)
!287 = !{!"0xb\001", !1, !283}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!288 = !MDLocation(line: 209, column: 37, scope: !289)
!289 = !{!"0xb\00209\0013\0019", !1, !93}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!290 = !MDLocation(line: 209, column: 30, scope: !289)
!291 = !MDLocation(line: 209, column: 22, scope: !289)
!292 = !MDLocation(line: 209, column: 13, scope: !289)
!293 = !MDLocation(line: 209, column: 13, scope: !93)
!294 = !MDLocation(line: 214, column: 13, scope: !295)
!295 = !{!"0xb\00213\009\0020", !1, !93}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!296 = !MDLocation(line: 209, column: 64, scope: !297)
!297 = !{!"0xb\001", !1, !289}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!298 = !MDLocation(line: 215, column: 23, scope: !299)
!299 = !{!"0xb\00215\0013\0022", !1, !300}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!300 = !{!"0xb\00215\0013\0021", !1, !295}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!301 = !MDLocation(line: 215, column: 13, scope: !300)
!302 = !MDLocation(line: 220, column: 13, scope: !295)
!303 = !MDLocation(line: 221, column: 17, scope: !295)
!304 = !MDLocation(line: 217, column: 17, scope: !305)
!305 = !{!"0xb\00216\0013\0023", !1, !299}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!306 = !MDLocation(line: 218, column: 17, scope: !305)
!307 = !MDLocation(line: 215, column: 33, scope: !299)
!308 = !MDLocation(line: 221, column: 17, scope: !309)
!309 = !{!"0xb\00221\0017\0024", !1, !295}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/kernel.c]
!310 = !MDLocation(line: 223, column: 13, scope: !295)
!311 = !MDLocation(line: 226, column: 18, scope: !93)
!312 = !MDLocation(line: 226, column: 45, scope: !93)
!313 = !MDLocation(line: 228, column: 9, scope: !93)
!314 = !MDLocation(line: 229, column: 9, scope: !93)
!315 = !MDLocation(line: 230, column: 9, scope: !93)
!316 = !MDLocation(line: 231, column: 9, scope: !93)
!317 = !MDLocation(line: 233, column: 9, scope: !93)
