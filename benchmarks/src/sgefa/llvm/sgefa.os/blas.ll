; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize readonly uwtable
define i32 @isamax(i32 %n, float* nocapture readonly %sx, i32 %incx) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !12), !dbg !131
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !13), !dbg !132
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !14), !dbg !131
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !15), !dbg !134
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !17), !dbg !136
  %1 = icmp slt i32 %n, 2, !dbg !137
  br i1 %1, label %.loopexit, label %2, !dbg !137

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, 1, !dbg !139
  br i1 %3, label %31, label %4, !dbg !139

; <label>:4                                       ; preds = %2
  %5 = icmp slt i32 %incx, 0, !dbg !141
  br i1 %5, label %6, label %12, !dbg !141

; <label>:6                                       ; preds = %4
  %7 = sub i32 1, %n, !dbg !141
  %8 = mul nsw i32 %7, %incx, !dbg !141
  %9 = add nsw i32 %8, 1, !dbg !141
  %10 = sext i32 %9 to i64, !dbg !141
  %11 = getelementptr inbounds float* %sx, i64 %10, !dbg !141
  tail call void @llvm.dbg.value(metadata !{float* %11}, i64 0, metadata !13), !dbg !141
  br label %12, !dbg !141

; <label>:12                                      ; preds = %6, %4
  %.01 = phi float* [ %11, %6 ], [ %sx, %4 ]
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !17), !dbg !144
  %13 = load float* %.01, align 4, !dbg !145, !tbaa !146
  %14 = fcmp ogt float %13, 0.000000e+00, !dbg !145
  br i1 %14, label %17, label %15, !dbg !145

; <label>:15                                      ; preds = %12
  %16 = fsub float -0.000000e+00, %13, !dbg !145
  br label %17, !dbg !145

; <label>:17                                      ; preds = %12, %15
  %18 = phi float [ %16, %15 ], [ %13, %12 ], !dbg !145
  tail call void @llvm.dbg.value(metadata !{float %18}, i64 0, metadata !15), !dbg !145
  %19 = sext i32 %incx to i64, !dbg !150
  tail call void @llvm.dbg.value(metadata !151, i64 0, metadata !16), !dbg !152
  %20 = icmp sgt i32 %n, 1, !dbg !152
  br i1 %20, label %.lr.ph13, label %.loopexit, !dbg !152

.lr.ph13:                                         ; preds = %17, %29
  %.01.pn = phi float* [ %.112, %29 ], [ %.01, %17 ]
  %istmp.011 = phi i32 [ %istmp.1, %29 ], [ 0, %17 ]
  %i.010 = phi i32 [ %30, %29 ], [ 1, %17 ]
  %smax.09 = phi float [ %smax.1, %29 ], [ %18, %17 ]
  %.112 = getelementptr inbounds float* %.01.pn, i64 %19, !dbg !150
  %21 = load float* %.112, align 4, !dbg !154, !tbaa !146
  %22 = fcmp ogt float %21, 0.000000e+00, !dbg !154
  br i1 %22, label %25, label %23, !dbg !154

; <label>:23                                      ; preds = %.lr.ph13
  %24 = fsub float -0.000000e+00, %21, !dbg !154
  br label %25, !dbg !154

; <label>:25                                      ; preds = %.lr.ph13, %23
  %26 = phi float [ %24, %23 ], [ %21, %.lr.ph13 ], !dbg !154
  %.not = fcmp ule float %26, %smax.09, !dbg !154
  %brmerge = or i1 %.not, %22, !dbg !154
  %smax.09.mux = select i1 %.not, float %smax.09, float %21, !dbg !154
  %istmp.011.mux = select i1 %.not, i32 %istmp.011, i32 %i.010, !dbg !154
  br i1 %brmerge, label %29, label %27, !dbg !154

; <label>:27                                      ; preds = %25
  %28 = fsub float -0.000000e+00, %21, !dbg !156
  br label %29, !dbg !156

; <label>:29                                      ; preds = %25, %27
  %smax.1 = phi float [ %smax.09.mux, %25 ], [ %28, %27 ]
  %istmp.1 = phi i32 [ %istmp.011.mux, %25 ], [ %i.010, %27 ]
  %30 = add nsw i32 %i.010, 1, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !16), !dbg !152
  %exitcond15 = icmp eq i32 %30, %n, !dbg !152
  br i1 %exitcond15, label %.loopexit, label %.lr.ph13, !dbg !152

; <label>:31                                      ; preds = %2
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !17), !dbg !158
  %32 = load float* %sx, align 4, !dbg !159, !tbaa !146
  %33 = fcmp ogt float %32, 0.000000e+00, !dbg !159
  br i1 %33, label %.preheader, label %34, !dbg !159

; <label>:34                                      ; preds = %31
  %35 = fsub float -0.000000e+00, %32, !dbg !159
  br label %.preheader, !dbg !159

.preheader:                                       ; preds = %31, %34
  %smax.2.ph = phi float [ %35, %34 ], [ %32, %31 ]
  %36 = icmp sgt i32 %n, 1, !dbg !160
  br i1 %36, label %.lr.ph, label %.loopexit, !dbg !160

.lr.ph:                                           ; preds = %.preheader, %45
  %sx.pn = phi float* [ %.27, %45 ], [ %sx, %.preheader ]
  %istmp.26 = phi i32 [ %istmp.3, %45 ], [ 0, %.preheader ]
  %i.15 = phi i32 [ %46, %45 ], [ 1, %.preheader ]
  %smax.24 = phi float [ %smax.3, %45 ], [ %smax.2.ph, %.preheader ]
  %.27 = getelementptr inbounds float* %sx.pn, i64 1, !dbg !162
  %37 = load float* %.27, align 4, !dbg !163, !tbaa !146
  %38 = fcmp ogt float %37, 0.000000e+00, !dbg !163
  br i1 %38, label %41, label %39, !dbg !163

; <label>:39                                      ; preds = %.lr.ph
  %40 = fsub float -0.000000e+00, %37, !dbg !163
  br label %41, !dbg !163

; <label>:41                                      ; preds = %.lr.ph, %39
  %42 = phi float [ %40, %39 ], [ %37, %.lr.ph ], !dbg !163
  %.not16 = fcmp ule float %42, %smax.24, !dbg !163
  %brmerge17 = or i1 %.not16, %38, !dbg !163
  %smax.24.mux = select i1 %.not16, float %smax.24, float %37, !dbg !163
  %istmp.26.mux = select i1 %.not16, i32 %istmp.26, i32 %i.15, !dbg !163
  br i1 %brmerge17, label %45, label %43, !dbg !163

; <label>:43                                      ; preds = %41
  %44 = fsub float -0.000000e+00, %37, !dbg !165
  br label %45, !dbg !165

; <label>:45                                      ; preds = %41, %43
  %smax.3 = phi float [ %smax.24.mux, %41 ], [ %44, %43 ]
  %istmp.3 = phi i32 [ %istmp.26.mux, %41 ], [ %i.15, %43 ]
  %46 = add nsw i32 %i.15, 1, !dbg !160
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !16), !dbg !160
  %exitcond = icmp eq i32 %46, %n, !dbg !160
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !160

.loopexit:                                        ; preds = %29, %45, %17, %.preheader, %0
  %.0 = phi i32 [ 0, %0 ], [ 0, %.preheader ], [ 0, %17 ], [ %istmp.3, %45 ], [ %istmp.1, %29 ]
  ret i32 %.0, !dbg !167
}

; Function Attrs: nounwind optsize uwtable
define void @saxpy(i32 %n, double, float* nocapture readonly %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !22), !dbg !168
  tail call void @llvm.dbg.value(metadata !{float %sa}, i64 0, metadata !23), !dbg !169
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !24), !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !25), !dbg !168
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !26), !dbg !169
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !27), !dbg !168
  %2 = icmp slt i32 %n, 1, !dbg !170
  %3 = fcmp oeq float %sa, 0.000000e+00, !dbg !170
  %or.cond = or i1 %2, %3, !dbg !170
  br i1 %or.cond, label %.loopexit, label %4, !dbg !170

; <label>:4                                       ; preds = %1
  %5 = icmp eq i32 %incx, %incy, !dbg !172
  br i1 %5, label %6, label %28, !dbg !172

; <label>:6                                       ; preds = %4
  %7 = icmp eq i32 %incx, 1, !dbg !174
  br i1 %7, label %.preheader, label %16, !dbg !174

.preheader:                                       ; preds = %6
  %8 = icmp sgt i32 %n, 0, !dbg !177
  br i1 %8, label %.lr.ph, label %.loopexit, !dbg !177

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.011 = phi i32 [ %13, %.lr.ph ], [ 0, %.preheader ]
  %.010 = phi float* [ %15, %.lr.ph ], [ %sx, %.preheader ]
  %.019 = phi float* [ %14, %.lr.ph ], [ %sy, %.preheader ]
  %9 = load float* %.010, align 4, !dbg !180, !tbaa !146
  %10 = fmul float %sa, %9, !dbg !180
  %11 = load float* %.019, align 4, !dbg !180, !tbaa !146
  %12 = fadd float %11, %10, !dbg !180
  store float %12, float* %.019, align 4, !dbg !180, !tbaa !146
  %13 = add nsw i32 %i.011, 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !28), !dbg !177
  %14 = getelementptr inbounds float* %.019, i64 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{float* %14}, i64 0, metadata !26), !dbg !177
  %15 = getelementptr inbounds float* %.010, i64 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{float* %15}, i64 0, metadata !24), !dbg !177
  %exitcond = icmp eq i32 %13, %n, !dbg !177
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !177

; <label>:16                                      ; preds = %6
  %17 = icmp sgt i32 %incx, 0, !dbg !181
  br i1 %17, label %.preheader5, label %28, !dbg !181

.preheader5:                                      ; preds = %16
  %18 = icmp sgt i32 %n, 0, !dbg !183
  br i1 %18, label %.lr.ph15, label %.loopexit, !dbg !183

.lr.ph15:                                         ; preds = %.preheader5
  %19 = sext i32 %incx to i64, !dbg !183
  br label %20, !dbg !183

; <label>:20                                      ; preds = %20, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %25, %20 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %26, %20 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %27, %20 ]
  %21 = load float* %.113, align 4, !dbg !186, !tbaa !146
  %22 = fmul float %sa, %21, !dbg !186
  %23 = load float* %.1212, align 4, !dbg !186, !tbaa !146
  %24 = fadd float %23, %22, !dbg !186
  store float %24, float* %.1212, align 4, !dbg !186, !tbaa !146
  %25 = add nsw i32 %i.114, 1, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !28), !dbg !183
  %26 = getelementptr inbounds float* %.113, i64 %19, !dbg !183
  tail call void @llvm.dbg.value(metadata !{float* %26}, i64 0, metadata !24), !dbg !183
  %27 = getelementptr inbounds float* %.1212, i64 %19, !dbg !183
  tail call void @llvm.dbg.value(metadata !{float* %27}, i64 0, metadata !26), !dbg !183
  %exitcond20 = icmp eq i32 %25, %n, !dbg !183
  br i1 %exitcond20, label %.loopexit, label %20, !dbg !183

; <label>:28                                      ; preds = %16, %4
  %29 = icmp slt i32 %incx, 0, !dbg !187
  br i1 %29, label %30, label %36, !dbg !187

; <label>:30                                      ; preds = %28
  %31 = sub i32 1, %n, !dbg !187
  %32 = mul nsw i32 %31, %incx, !dbg !187
  %33 = add nsw i32 %32, 1, !dbg !187
  %34 = sext i32 %33 to i64, !dbg !187
  %35 = getelementptr inbounds float* %sx, i64 %34, !dbg !187
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !24), !dbg !187
  br label %36, !dbg !187

; <label>:36                                      ; preds = %30, %28
  %.2 = phi float* [ %35, %30 ], [ %sx, %28 ]
  %37 = icmp slt i32 %incy, 0, !dbg !189
  br i1 %37, label %38, label %.preheader7, !dbg !189

; <label>:38                                      ; preds = %36
  %39 = sub i32 1, %n, !dbg !189
  %40 = mul nsw i32 %39, %incy, !dbg !189
  %41 = add nsw i32 %40, 1, !dbg !189
  %42 = sext i32 %41 to i64, !dbg !189
  %43 = getelementptr inbounds float* %sy, i64 %42, !dbg !189
  tail call void @llvm.dbg.value(metadata !{float* %43}, i64 0, metadata !26), !dbg !189
  br label %.preheader7, !dbg !189

.preheader7:                                      ; preds = %38, %36
  %.34.ph = phi float* [ %sy, %36 ], [ %43, %38 ]
  %44 = icmp sgt i32 %n, 0, !dbg !191
  br i1 %44, label %.lr.ph19, label %.loopexit, !dbg !191

.lr.ph19:                                         ; preds = %.preheader7
  %45 = sext i32 %incx to i64, !dbg !191
  %46 = sext i32 %incy to i64, !dbg !191
  br label %47, !dbg !191

; <label>:47                                      ; preds = %47, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %52, %47 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %53, %47 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %54, %47 ]
  %48 = load float* %.317, align 4, !dbg !193, !tbaa !146
  %49 = fmul float %sa, %48, !dbg !193
  %50 = load float* %.3416, align 4, !dbg !193, !tbaa !146
  %51 = fadd float %50, %49, !dbg !193
  store float %51, float* %.3416, align 4, !dbg !193, !tbaa !146
  %52 = add nsw i32 %i.218, 1, !dbg !191
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !28), !dbg !191
  %53 = getelementptr inbounds float* %.317, i64 %45, !dbg !191
  tail call void @llvm.dbg.value(metadata !{float* %53}, i64 0, metadata !24), !dbg !191
  %54 = getelementptr inbounds float* %.3416, i64 %46, !dbg !191
  tail call void @llvm.dbg.value(metadata !{float* %54}, i64 0, metadata !26), !dbg !191
  %exitcond21 = icmp eq i32 %52, %n, !dbg !191
  br i1 %exitcond21, label %.loopexit, label %47, !dbg !191

.loopexit:                                        ; preds = %47, %20, %.lr.ph, %.preheader7, %.preheader5, %.preheader, %1
  ret void, !dbg !194
}

; Function Attrs: nounwind optsize uwtable
define void @saxpyx(i32 %n, double, float* nocapture %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #1 {
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !31), !dbg !195
  tail call void @llvm.dbg.value(metadata !{float %sa}, i64 0, metadata !32), !dbg !196
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !33), !dbg !196
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !34), !dbg !195
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !35), !dbg !196
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !36), !dbg !195
  %2 = icmp slt i32 %n, 1, !dbg !197
  %3 = fcmp oeq float %sa, 0.000000e+00, !dbg !197
  %or.cond = or i1 %2, %3, !dbg !197
  br i1 %or.cond, label %.loopexit, label %4, !dbg !197

; <label>:4                                       ; preds = %1
  %5 = icmp eq i32 %incx, %incy, !dbg !199
  br i1 %5, label %6, label %28, !dbg !199

; <label>:6                                       ; preds = %4
  %7 = icmp eq i32 %incx, 1, !dbg !201
  br i1 %7, label %.preheader, label %16, !dbg !201

.preheader:                                       ; preds = %6
  %8 = icmp sgt i32 %n, 0, !dbg !204
  br i1 %8, label %.lr.ph, label %.loopexit, !dbg !204

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.011 = phi i32 [ %13, %.lr.ph ], [ 0, %.preheader ]
  %.010 = phi float* [ %14, %.lr.ph ], [ %sx, %.preheader ]
  %.019 = phi float* [ %15, %.lr.ph ], [ %sy, %.preheader ]
  %9 = load float* %.019, align 4, !dbg !207, !tbaa !146
  %10 = load float* %.010, align 4, !dbg !207, !tbaa !146
  %11 = fmul float %sa, %10, !dbg !207
  %12 = fadd float %9, %11, !dbg !207
  store float %12, float* %.010, align 4, !dbg !207, !tbaa !146
  %13 = add nsw i32 %i.011, 1, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !37), !dbg !204
  %14 = getelementptr inbounds float* %.010, i64 1, !dbg !204
  tail call void @llvm.dbg.value(metadata !{float* %14}, i64 0, metadata !33), !dbg !204
  %15 = getelementptr inbounds float* %.019, i64 1, !dbg !204
  tail call void @llvm.dbg.value(metadata !{float* %15}, i64 0, metadata !35), !dbg !204
  %exitcond = icmp eq i32 %13, %n, !dbg !204
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !204

; <label>:16                                      ; preds = %6
  %17 = icmp sgt i32 %incx, 0, !dbg !208
  br i1 %17, label %.preheader5, label %28, !dbg !208

.preheader5:                                      ; preds = %16
  %18 = icmp sgt i32 %n, 0, !dbg !210
  br i1 %18, label %.lr.ph15, label %.loopexit, !dbg !210

.lr.ph15:                                         ; preds = %.preheader5
  %19 = sext i32 %incx to i64, !dbg !210
  br label %20, !dbg !210

; <label>:20                                      ; preds = %20, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %25, %20 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %26, %20 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %27, %20 ]
  %21 = load float* %.1212, align 4, !dbg !213, !tbaa !146
  %22 = load float* %.113, align 4, !dbg !213, !tbaa !146
  %23 = fmul float %sa, %22, !dbg !213
  %24 = fadd float %21, %23, !dbg !213
  store float %24, float* %.113, align 4, !dbg !213, !tbaa !146
  %25 = add nsw i32 %i.114, 1, !dbg !210
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !37), !dbg !210
  %26 = getelementptr inbounds float* %.113, i64 %19, !dbg !210
  tail call void @llvm.dbg.value(metadata !{float* %26}, i64 0, metadata !33), !dbg !210
  %27 = getelementptr inbounds float* %.1212, i64 %19, !dbg !210
  tail call void @llvm.dbg.value(metadata !{float* %27}, i64 0, metadata !35), !dbg !210
  %exitcond20 = icmp eq i32 %25, %n, !dbg !210
  br i1 %exitcond20, label %.loopexit, label %20, !dbg !210

; <label>:28                                      ; preds = %16, %4
  %29 = icmp slt i32 %incx, 0, !dbg !214
  br i1 %29, label %30, label %36, !dbg !214

; <label>:30                                      ; preds = %28
  %31 = sub i32 1, %n, !dbg !214
  %32 = mul nsw i32 %31, %incx, !dbg !214
  %33 = add nsw i32 %32, 1, !dbg !214
  %34 = sext i32 %33 to i64, !dbg !214
  %35 = getelementptr inbounds float* %sx, i64 %34, !dbg !214
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !33), !dbg !214
  br label %36, !dbg !214

; <label>:36                                      ; preds = %30, %28
  %.2 = phi float* [ %35, %30 ], [ %sx, %28 ]
  %37 = icmp slt i32 %incy, 0, !dbg !216
  br i1 %37, label %38, label %.preheader7, !dbg !216

; <label>:38                                      ; preds = %36
  %39 = sub i32 1, %n, !dbg !216
  %40 = mul nsw i32 %39, %incy, !dbg !216
  %41 = add nsw i32 %40, 1, !dbg !216
  %42 = sext i32 %41 to i64, !dbg !216
  %43 = getelementptr inbounds float* %sy, i64 %42, !dbg !216
  tail call void @llvm.dbg.value(metadata !{float* %43}, i64 0, metadata !35), !dbg !216
  br label %.preheader7, !dbg !216

.preheader7:                                      ; preds = %38, %36
  %.34.ph = phi float* [ %sy, %36 ], [ %43, %38 ]
  %44 = icmp sgt i32 %n, 0, !dbg !218
  br i1 %44, label %.lr.ph19, label %.loopexit, !dbg !218

.lr.ph19:                                         ; preds = %.preheader7
  %45 = sext i32 %incx to i64, !dbg !218
  %46 = sext i32 %incy to i64, !dbg !218
  br label %47, !dbg !218

; <label>:47                                      ; preds = %47, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %52, %47 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %53, %47 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %54, %47 ]
  %48 = load float* %.3416, align 4, !dbg !220, !tbaa !146
  %49 = load float* %.317, align 4, !dbg !220, !tbaa !146
  %50 = fmul float %sa, %49, !dbg !220
  %51 = fadd float %48, %50, !dbg !220
  store float %51, float* %.317, align 4, !dbg !220, !tbaa !146
  %52 = add nsw i32 %i.218, 1, !dbg !218
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !37), !dbg !218
  %53 = getelementptr inbounds float* %.317, i64 %45, !dbg !218
  tail call void @llvm.dbg.value(metadata !{float* %53}, i64 0, metadata !33), !dbg !218
  %54 = getelementptr inbounds float* %.3416, i64 %46, !dbg !218
  tail call void @llvm.dbg.value(metadata !{float* %54}, i64 0, metadata !35), !dbg !218
  %exitcond21 = icmp eq i32 %52, %n, !dbg !218
  br i1 %exitcond21, label %.loopexit, label %47, !dbg !218

.loopexit:                                        ; preds = %47, %20, %.lr.ph, %.preheader7, %.preheader5, %.preheader, %1
  ret void, !dbg !221
}

; Function Attrs: nounwind optsize uwtable
define void @scopy(i32 %n, float* nocapture %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !42), !dbg !222
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !43), !dbg !223
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !44), !dbg !222
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !45), !dbg !223
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !46), !dbg !222
  %1 = icmp slt i32 %n, 1, !dbg !224
  br i1 %1, label %.loopexit, label %2, !dbg !224

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, %incy, !dbg !226
  br i1 %3, label %4, label %20, !dbg !226

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !228
  br i1 %5, label %.preheader, label %11, !dbg !228

.preheader:                                       ; preds = %4
  %6 = icmp sgt i32 %n, 0, !dbg !231
  br i1 %6, label %.lr.ph, label %.loopexit, !dbg !231

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.011 = phi i32 [ %10, %.lr.ph ], [ 0, %.preheader ]
  %.010 = phi float* [ %7, %.lr.ph ], [ %sx, %.preheader ]
  %.019 = phi float* [ %9, %.lr.ph ], [ %sy, %.preheader ]
  %7 = getelementptr inbounds float* %.010, i64 1, !dbg !234
  tail call void @llvm.dbg.value(metadata !{float* %7}, i64 0, metadata !43), !dbg !234
  %8 = load float* %.010, align 4, !dbg !234, !tbaa !146
  %9 = getelementptr inbounds float* %.019, i64 1, !dbg !234
  tail call void @llvm.dbg.value(metadata !{float* %9}, i64 0, metadata !45), !dbg !234
  store float %8, float* %.019, align 4, !dbg !234, !tbaa !146
  %10 = add nsw i32 %i.011, 1, !dbg !231
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !47), !dbg !231
  %exitcond = icmp eq i32 %10, %n, !dbg !231
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !231

; <label>:11                                      ; preds = %4
  %12 = icmp sgt i32 %incx, 0, !dbg !235
  br i1 %12, label %.preheader5, label %20, !dbg !235

.preheader5:                                      ; preds = %11
  %13 = icmp sgt i32 %n, 0, !dbg !237
  br i1 %13, label %.lr.ph15, label %.loopexit, !dbg !237

.lr.ph15:                                         ; preds = %.preheader5
  %14 = sext i32 %incx to i64, !dbg !237
  br label %15, !dbg !237

; <label>:15                                      ; preds = %15, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %17, %15 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %18, %15 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %19, %15 ]
  %16 = load float* %.113, align 4, !dbg !240, !tbaa !146
  store float %16, float* %.1212, align 4, !dbg !240, !tbaa !146
  %17 = add nsw i32 %i.114, 1, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !47), !dbg !237
  %18 = getelementptr inbounds float* %.113, i64 %14, !dbg !237
  tail call void @llvm.dbg.value(metadata !{float* %18}, i64 0, metadata !43), !dbg !237
  %19 = getelementptr inbounds float* %.1212, i64 %14, !dbg !237
  tail call void @llvm.dbg.value(metadata !{float* %19}, i64 0, metadata !45), !dbg !237
  %exitcond21 = icmp eq i32 %17, %n, !dbg !237
  br i1 %exitcond21, label %.loopexit, label %15, !dbg !237

; <label>:20                                      ; preds = %11, %2
  %21 = icmp slt i32 %incx, 0, !dbg !241
  br i1 %21, label %22, label %28, !dbg !241

; <label>:22                                      ; preds = %20
  %23 = sub i32 1, %n, !dbg !241
  %24 = mul nsw i32 %23, %incx, !dbg !241
  %25 = add nsw i32 %24, 1, !dbg !241
  %26 = sext i32 %25 to i64, !dbg !241
  %27 = getelementptr inbounds float* %sx, i64 %26, !dbg !241
  tail call void @llvm.dbg.value(metadata !{float* %27}, i64 0, metadata !43), !dbg !241
  br label %28, !dbg !241

; <label>:28                                      ; preds = %22, %20
  %.2 = phi float* [ %27, %22 ], [ %sx, %20 ]
  %29 = icmp slt i32 %incy, 0, !dbg !243
  br i1 %29, label %30, label %.preheader7, !dbg !243

; <label>:30                                      ; preds = %28
  %31 = sub i32 1, %n, !dbg !243
  %32 = mul nsw i32 %31, %incy, !dbg !243
  %33 = add nsw i32 %32, 1, !dbg !243
  %34 = sext i32 %33 to i64, !dbg !243
  %35 = getelementptr inbounds float* %sy, i64 %34, !dbg !243
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !45), !dbg !243
  br label %.preheader7, !dbg !243

.preheader7:                                      ; preds = %30, %28
  %.34.ph = phi float* [ %sy, %28 ], [ %35, %30 ]
  %36 = icmp sgt i32 %n, 0, !dbg !245
  br i1 %36, label %.lr.ph19, label %.loopexit, !dbg !245

.lr.ph19:                                         ; preds = %.preheader7
  %37 = sext i32 %incx to i64, !dbg !245
  %38 = sext i32 %incy to i64, !dbg !245
  br label %39, !dbg !245

; <label>:39                                      ; preds = %39, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %41, %39 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %42, %39 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %43, %39 ]
  %40 = load float* %.3416, align 4, !dbg !247, !tbaa !146
  store float %40, float* %.317, align 4, !dbg !247, !tbaa !146
  %41 = add nsw i32 %i.218, 1, !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !47), !dbg !245
  %42 = getelementptr inbounds float* %.317, i64 %37, !dbg !245
  tail call void @llvm.dbg.value(metadata !{float* %42}, i64 0, metadata !43), !dbg !245
  %43 = getelementptr inbounds float* %.3416, i64 %38, !dbg !245
  tail call void @llvm.dbg.value(metadata !{float* %43}, i64 0, metadata !45), !dbg !245
  %exitcond22 = icmp eq i32 %41, %n, !dbg !245
  br i1 %exitcond22, label %.loopexit, label %39, !dbg !245

.loopexit:                                        ; preds = %39, %15, %.lr.ph, %.preheader7, %.preheader5, %.preheader, %0
  ret void, !dbg !248
}

; Function Attrs: nounwind optsize readonly uwtable
define double @sdot(i32 %n, float* nocapture readonly %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !53), !dbg !249
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !54), !dbg !250
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !55), !dbg !249
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !56), !dbg !250
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !57), !dbg !249
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !59), !dbg !251
  %1 = icmp slt i32 %n, 1, !dbg !252
  br i1 %1, label %53, label %2, !dbg !252

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, %incy, !dbg !254
  br i1 %3, label %4, label %26, !dbg !254

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !256
  br i1 %5, label %.preheader, label %14, !dbg !256

.preheader:                                       ; preds = %4
  %6 = icmp sgt i32 %n, 0, !dbg !259
  br i1 %6, label %.lr.ph, label %53, !dbg !259

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %stemp.011 = phi float [ %10, %.lr.ph ], [ 0.000000e+00, %.preheader ]
  %i.010 = phi i32 [ %11, %.lr.ph ], [ 0, %.preheader ]
  %.019 = phi float* [ %13, %.lr.ph ], [ %sy, %.preheader ]
  %.028 = phi float* [ %12, %.lr.ph ], [ %sx, %.preheader ]
  %7 = load float* %.028, align 4, !dbg !262, !tbaa !146
  %8 = load float* %.019, align 4, !dbg !262, !tbaa !146
  %9 = fmul float %7, %8, !dbg !262
  %10 = fadd float %stemp.011, %9, !dbg !262
  tail call void @llvm.dbg.value(metadata !{float %10}, i64 0, metadata !59), !dbg !262
  %11 = add nsw i32 %i.010, 1, !dbg !259
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !58), !dbg !259
  %12 = getelementptr inbounds float* %.028, i64 1, !dbg !259
  tail call void @llvm.dbg.value(metadata !{float* %12}, i64 0, metadata !54), !dbg !259
  %13 = getelementptr inbounds float* %.019, i64 1, !dbg !259
  tail call void @llvm.dbg.value(metadata !{float* %13}, i64 0, metadata !56), !dbg !259
  %exitcond = icmp eq i32 %11, %n, !dbg !259
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !259

._crit_edge:                                      ; preds = %.lr.ph
  %phitmp27 = fpext float %10 to double, !dbg !259
  br label %53, !dbg !259

; <label>:14                                      ; preds = %4
  %15 = icmp sgt i32 %incx, 0, !dbg !263
  br i1 %15, label %.preheader6, label %26, !dbg !263

.preheader6:                                      ; preds = %14
  %16 = icmp sgt i32 %n, 0, !dbg !265
  br i1 %16, label %.lr.ph16, label %53, !dbg !265

.lr.ph16:                                         ; preds = %.preheader6
  %17 = sext i32 %incx to i64, !dbg !265
  br label %18, !dbg !265

; <label>:18                                      ; preds = %18, %.lr.ph16
  %stemp.115 = phi float [ 0.000000e+00, %.lr.ph16 ], [ %22, %18 ]
  %i.114 = phi i32 [ 0, %.lr.ph16 ], [ %23, %18 ]
  %.113 = phi float* [ %sy, %.lr.ph16 ], [ %25, %18 ]
  %.1312 = phi float* [ %sx, %.lr.ph16 ], [ %24, %18 ]
  %19 = load float* %.1312, align 4, !dbg !268, !tbaa !146
  %20 = load float* %.113, align 4, !dbg !268, !tbaa !146
  %21 = fmul float %19, %20, !dbg !268
  %22 = fadd float %stemp.115, %21, !dbg !268
  tail call void @llvm.dbg.value(metadata !{float %22}, i64 0, metadata !59), !dbg !268
  %23 = add nsw i32 %i.114, 1, !dbg !265
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !58), !dbg !265
  %24 = getelementptr inbounds float* %.1312, i64 %17, !dbg !265
  tail call void @llvm.dbg.value(metadata !{float* %24}, i64 0, metadata !54), !dbg !265
  %25 = getelementptr inbounds float* %.113, i64 %17, !dbg !265
  tail call void @llvm.dbg.value(metadata !{float* %25}, i64 0, metadata !56), !dbg !265
  %exitcond30 = icmp eq i32 %23, %n, !dbg !265
  br i1 %exitcond30, label %._crit_edge17, label %18, !dbg !265

._crit_edge17:                                    ; preds = %18
  %phitmp26 = fpext float %22 to double, !dbg !265
  br label %53, !dbg !265

; <label>:26                                      ; preds = %14, %2
  %27 = icmp slt i32 %incx, 0, !dbg !269
  br i1 %27, label %28, label %34, !dbg !269

; <label>:28                                      ; preds = %26
  %29 = sub i32 1, %n, !dbg !269
  %30 = mul nsw i32 %29, %incx, !dbg !269
  %31 = add nsw i32 %30, 1, !dbg !269
  %32 = sext i32 %31 to i64, !dbg !269
  %33 = getelementptr inbounds float* %sx, i64 %32, !dbg !269
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !54), !dbg !269
  br label %34, !dbg !269

; <label>:34                                      ; preds = %28, %26
  %.24 = phi float* [ %33, %28 ], [ %sx, %26 ]
  %35 = icmp slt i32 %incy, 0, !dbg !271
  br i1 %35, label %36, label %.preheader7, !dbg !271

; <label>:36                                      ; preds = %34
  %37 = sub i32 1, %n, !dbg !271
  %38 = mul nsw i32 %37, %incy, !dbg !271
  %39 = add nsw i32 %38, 1, !dbg !271
  %40 = sext i32 %39 to i64, !dbg !271
  %41 = getelementptr inbounds float* %sy, i64 %40, !dbg !271
  tail call void @llvm.dbg.value(metadata !{float* %41}, i64 0, metadata !56), !dbg !271
  br label %.preheader7, !dbg !271

.preheader7:                                      ; preds = %36, %34
  %.3.ph = phi float* [ %sy, %34 ], [ %41, %36 ]
  %42 = icmp sgt i32 %n, 0, !dbg !273
  br i1 %42, label %.lr.ph23, label %53, !dbg !273

.lr.ph23:                                         ; preds = %.preheader7
  %43 = sext i32 %incx to i64, !dbg !273
  %44 = sext i32 %incy to i64, !dbg !273
  br label %45, !dbg !273

; <label>:45                                      ; preds = %45, %.lr.ph23
  %stemp.222 = phi float [ 0.000000e+00, %.lr.ph23 ], [ %49, %45 ]
  %i.221 = phi i32 [ 0, %.lr.ph23 ], [ %50, %45 ]
  %.320 = phi float* [ %.3.ph, %.lr.ph23 ], [ %52, %45 ]
  %.3519 = phi float* [ %.24, %.lr.ph23 ], [ %51, %45 ]
  %46 = load float* %.3519, align 4, !dbg !275, !tbaa !146
  %47 = load float* %.320, align 4, !dbg !275, !tbaa !146
  %48 = fmul float %46, %47, !dbg !275
  %49 = fadd float %stemp.222, %48, !dbg !275
  tail call void @llvm.dbg.value(metadata !{float %49}, i64 0, metadata !59), !dbg !275
  %50 = add nsw i32 %i.221, 1, !dbg !273
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !58), !dbg !273
  %51 = getelementptr inbounds float* %.3519, i64 %43, !dbg !273
  tail call void @llvm.dbg.value(metadata !{float* %51}, i64 0, metadata !54), !dbg !273
  %52 = getelementptr inbounds float* %.320, i64 %44, !dbg !273
  tail call void @llvm.dbg.value(metadata !{float* %52}, i64 0, metadata !56), !dbg !273
  %exitcond31 = icmp eq i32 %50, %n, !dbg !273
  br i1 %exitcond31, label %._crit_edge24, label %45, !dbg !273

._crit_edge24:                                    ; preds = %45
  %phitmp = fpext float %49 to double, !dbg !273
  br label %53, !dbg !273

; <label>:53                                      ; preds = %.preheader7, %._crit_edge24, %.preheader6, %._crit_edge17, %.preheader, %._crit_edge, %0
  %.0 = phi double [ 0.000000e+00, %0 ], [ %phitmp27, %._crit_edge ], [ 0.000000e+00, %.preheader ], [ %phitmp26, %._crit_edge17 ], [ 0.000000e+00, %.preheader6 ], [ %phitmp, %._crit_edge24 ], [ 0.000000e+00, %.preheader7 ]
  ret double %.0, !dbg !276
}

; Function Attrs: nounwind optsize uwtable
define double @snrm2(i32 %n, float* nocapture readonly %sx, i32 %incx) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !64), !dbg !277
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !65), !dbg !278
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !66), !dbg !277
  tail call void @llvm.dbg.value(metadata !279, i64 0, metadata !68), !dbg !280
  tail call void @llvm.dbg.value(metadata !281, i64 0, metadata !69), !dbg !282
  %1 = icmp slt i32 %n, 1, !dbg !283
  %2 = icmp slt i32 %incx, 1, !dbg !283
  %or.cond = or i1 %1, %2, !dbg !283
  br i1 %or.cond, label %.critedge.thread3, label %.preheader7, !dbg !283

.preheader7:                                      ; preds = %0, %.preheader7
  %u.0.i = phi float [ %3, %.preheader7 ], [ 1.000000e+00, %0 ]
  %3 = fmul float %u.0.i, 5.000000e-01, !dbg !285
  tail call void @llvm.dbg.value(metadata !{float %3}, i64 0, metadata !288), !dbg !285
  %4 = fadd float %3, 1.000000e+00, !dbg !289
  tail call void @llvm.dbg.value(metadata !{float %4}, i64 0, metadata !290), !dbg !289
  %5 = fcmp une float %4, 1.000000e+00, !dbg !291
  br i1 %5, label %.preheader7, label %r1mach.exit, !dbg !291

r1mach.exit:                                      ; preds = %.preheader7
  %6 = fpext float %3 to double, !dbg !289
  %7 = fmul double %6, 2.000000e+00, !dbg !292
  %8 = fdiv double 1.000000e-45, %7, !dbg !287
  %9 = tail call double @sqrt(double %8) #5, !dbg !287
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !70), !dbg !287
  tail call void @llvm.dbg.value(metadata !293, i64 0, metadata !71), !dbg !294
  %10 = sitofp i32 %n to double, !dbg !295
  %11 = fdiv double 1.000000e+19, %10, !dbg !295
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !72), !dbg !295
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !67), !dbg !296
  %12 = icmp sgt i32 %n, 0, !dbg !297
  br i1 %12, label %.lr.ph74, label %.critedge.thread3, !dbg !297

.lr.ph74:                                         ; preds = %r1mach.exit
  %13 = sext i32 %incx to i64, !dbg !298
  br label %14, !dbg !297

; <label>:14                                      ; preds = %.lr.ph74, %17
  %.0273 = phi float* [ %sx, %.lr.ph74 ], [ %19, %17 ]
  %i.072 = phi i32 [ 0, %.lr.ph74 ], [ %18, %17 ]
  %15 = load float* %.0273, align 4, !dbg !297, !tbaa !146
  %16 = fcmp oeq float %15, 0.000000e+00, !dbg !297
  br i1 %16, label %17, label %.critedge.thread

; <label>:17                                      ; preds = %14
  %18 = add nsw i32 %i.072, 1, !dbg !300
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !67), !dbg !300
  %19 = getelementptr inbounds float* %.0273, i64 %13, !dbg !298
  tail call void @llvm.dbg.value(metadata !{float* %19}, i64 0, metadata !65), !dbg !298
  %20 = icmp slt i32 %18, %n, !dbg !297
  br i1 %20, label %14, label %.critedge.thread3, !dbg !297

.critedge.thread:                                 ; preds = %14, %61
  %21 = phi float [ %53, %61 ], [ %15, %14 ]
  %sum.0 = phi double [ %64, %61 ], [ 0.000000e+00, %14 ]
  %i.1 = phi i32 [ %i.355, %61 ], [ %i.072, %14 ]
  %.1 = phi float* [ %.354, %61 ], [ %.0273, %14 ]
  %22 = fcmp ogt float %21, 0.000000e+00, !dbg !301
  br i1 %22, label %25, label %23, !dbg !301

; <label>:23                                      ; preds = %.critedge.thread
  %24 = fsub float -0.000000e+00, %21, !dbg !301
  br label %25, !dbg !301

; <label>:25                                      ; preds = %.critedge.thread, %23
  %26 = phi float [ %24, %23 ], [ %21, %.critedge.thread ], !dbg !301
  %27 = fpext float %26 to double, !dbg !301
  %28 = fcmp ogt double %27, %9, !dbg !301
  br i1 %28, label %.preheader, label %45, !dbg !301

.preheader:                                       ; preds = %25
  %29 = icmp slt i32 %i.1, %n, !dbg !303
  br i1 %29, label %.lr.ph48, label %._crit_edge49, !dbg !303

.lr.ph48:                                         ; preds = %.preheader, %._crit_edge118
  %.pr4 = phi float [ %.pre, %._crit_edge118 ], [ %21, %.preheader ]
  %.247 = phi float* [ %42, %._crit_edge118 ], [ %.1, %.preheader ]
  %i.246 = phi i32 [ %41, %._crit_edge118 ], [ %i.1, %.preheader ]
  %sum.145 = phi double [ %40, %._crit_edge118 ], [ %sum.0, %.preheader ]
  %30 = fcmp ogt float %.pr4, 0.000000e+00, !dbg !306
  br i1 %30, label %33, label %31, !dbg !306

; <label>:31                                      ; preds = %.lr.ph48
  %32 = fsub float -0.000000e+00, %.pr4, !dbg !306
  br label %33, !dbg !306

; <label>:33                                      ; preds = %.lr.ph48, %31
  %34 = phi float [ %.pr4, %.lr.ph48 ], [ %32, %31 ], !dbg !306
  %35 = fpext float %34 to double, !dbg !306
  %36 = fcmp ogt double %35, %11, !dbg !306
  br i1 %36, label %89, label %37, !dbg !306

; <label>:37                                      ; preds = %33
  %38 = fmul float %.pr4, %.pr4, !dbg !309
  %39 = fpext float %38 to double, !dbg !309
  %40 = fadd double %sum.145, %39, !dbg !309
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !69), !dbg !309
  %41 = add nsw i32 %i.246, 1, !dbg !303
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !67), !dbg !303
  %42 = getelementptr inbounds float* %.247, i64 %13, !dbg !303
  tail call void @llvm.dbg.value(metadata !{float* %42}, i64 0, metadata !65), !dbg !303
  %43 = icmp slt i32 %41, %n, !dbg !303
  br i1 %43, label %._crit_edge118, label %._crit_edge49, !dbg !303

._crit_edge118:                                   ; preds = %37
  %.pre = load float* %42, align 4, !dbg !306, !tbaa !146
  br label %.lr.ph48, !dbg !303

._crit_edge49:                                    ; preds = %37, %.preheader
  %sum.1.lcssa = phi double [ %sum.0, %.preheader ], [ %40, %37 ]
  %44 = tail call double @sqrt(double %sum.1.lcssa) #5, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !69), !dbg !310
  br label %.critedge.thread3, !dbg !311

; <label>:45                                      ; preds = %25
  br i1 %22, label %48, label %46, !dbg !312

; <label>:46                                      ; preds = %45
  %47 = fsub float -0.000000e+00, %21, !dbg !312
  br label %48, !dbg !312

; <label>:48                                      ; preds = %45, %46
  %49 = phi float [ %47, %46 ], [ %21, %45 ], !dbg !312
  tail call void @llvm.dbg.value(metadata !{float %49}, i64 0, metadata !73), !dbg !312
  %50 = fadd double %sum.0, 1.000000e+00, !dbg !314
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !69), !dbg !314
  %i.35263 = add nsw i32 %i.1, 1, !dbg !315
  %51 = icmp slt i32 %i.35263, %n, !dbg !316
  br i1 %51, label %.lr.ph56, label %.outer6._crit_edge, !dbg !316

.lr.ph56:                                         ; preds = %48, %.outer6.backedge
  %i.35267 = phi i32 [ %i.352, %.outer6.backedge ], [ %i.35263, %48 ]
  %.1.pn = phi float* [ %.354, %.outer6.backedge ], [ %.1, %48 ]
  %xmax.0.ph65 = phi float [ %xmax.0.ph.be, %.outer6.backedge ], [ %49, %48 ]
  %sum.2.ph64 = phi double [ %76, %.outer6.backedge ], [ %50, %48 ]
  br label %52, !dbg !316

; <label>:52                                      ; preds = %.lr.ph56, %80
  %i.355 = phi i32 [ %i.35267, %.lr.ph56 ], [ %i.3, %80 ]
  %.1.pn.pn = phi float* [ %.1.pn, %.lr.ph56 ], [ %.354, %80 ]
  %sum.253 = phi double [ %sum.2.ph64, %.lr.ph56 ], [ %84, %80 ]
  %.354 = getelementptr inbounds float* %.1.pn.pn, i64 %13, !dbg !318
  %53 = load float* %.354, align 4, !dbg !319, !tbaa !146
  %54 = fcmp ogt float %53, 0.000000e+00, !dbg !319
  br i1 %54, label %57, label %55, !dbg !319

; <label>:55                                      ; preds = %52
  %56 = fsub float -0.000000e+00, %53, !dbg !319
  br label %57, !dbg !319

; <label>:57                                      ; preds = %52, %55
  %58 = phi float [ %56, %55 ], [ %53, %52 ], !dbg !319
  %59 = fpext float %58 to double, !dbg !319
  %60 = fcmp ogt double %59, %9, !dbg !319
  br i1 %60, label %61, label %65, !dbg !319

; <label>:61                                      ; preds = %57
  %62 = fpext float %xmax.0.ph65 to double, !dbg !322
  %63 = fmul double %sum.253, %62, !dbg !322
  %64 = fmul double %62, %63, !dbg !322
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !69), !dbg !322
  br label %.critedge.thread, !dbg !324

; <label>:65                                      ; preds = %57
  br i1 %54, label %68, label %66, !dbg !325

; <label>:66                                      ; preds = %65
  %67 = fsub float -0.000000e+00, %53, !dbg !325
  br label %68, !dbg !325

; <label>:68                                      ; preds = %65, %66
  %69 = phi float [ %53, %65 ], [ %67, %66 ], !dbg !325
  %70 = fcmp ogt float %69, %xmax.0.ph65, !dbg !325
  br i1 %70, label %71, label %80, !dbg !325

; <label>:71                                      ; preds = %68
  %72 = fdiv float %xmax.0.ph65, %53, !dbg !327
  %73 = fpext float %72 to double, !dbg !327
  %74 = fmul double %sum.253, %73, !dbg !327
  %75 = fmul double %73, %74, !dbg !327
  %76 = fadd double %75, 1.000000e+00, !dbg !327
  tail call void @llvm.dbg.value(metadata !{double %76}, i64 0, metadata !69), !dbg !327
  br i1 %54, label %.outer6.backedge, label %78, !dbg !329

.outer6.backedge:                                 ; preds = %71, %78
  %xmax.0.ph.be = phi float [ %53, %71 ], [ %79, %78 ]
  %i.352 = add nsw i32 %i.355, 1, !dbg !315
  %77 = icmp slt i32 %i.352, %n, !dbg !316
  br i1 %77, label %.lr.ph56, label %.outer6._crit_edge, !dbg !316

; <label>:78                                      ; preds = %71
  %79 = fsub float -0.000000e+00, %53, !dbg !329
  br label %.outer6.backedge, !dbg !329

; <label>:80                                      ; preds = %68
  %81 = fdiv float %53, %xmax.0.ph65, !dbg !330
  %82 = fmul float %81, %81, !dbg !330
  %83 = fpext float %82 to double, !dbg !330
  %84 = fadd double %sum.253, %83, !dbg !330
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !69), !dbg !330
  %i.3 = add nsw i32 %i.355, 1, !dbg !315
  %85 = icmp slt i32 %i.3, %n, !dbg !316
  br i1 %85, label %52, label %.outer6._crit_edge, !dbg !316

.outer6._crit_edge:                               ; preds = %48, %.outer6.backedge, %80
  %xmax.0.ph.lcssa22 = phi float [ %xmax.0.ph65, %80 ], [ %xmax.0.ph.be, %.outer6.backedge ], [ %49, %48 ]
  %sum.2.lcssa = phi double [ %84, %80 ], [ %76, %.outer6.backedge ], [ %50, %48 ]
  %86 = fpext float %xmax.0.ph.lcssa22 to double, !dbg !331
  %87 = tail call double @sqrt(double %sum.2.lcssa) #5, !dbg !331
  %88 = fmul double %86, %87, !dbg !331
  br label %.critedge.thread3, !dbg !331

; <label>:89                                      ; preds = %33
  %90 = fpext float %.pr4 to double, !dbg !332
  %91 = fdiv double %sum.145, %90, !dbg !332
  %92 = fdiv double %91, %90, !dbg !332
  %93 = fadd double %92, 1.000000e+00, !dbg !332
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !69), !dbg !332
  br i1 %30, label %96, label %94, !dbg !333

; <label>:94                                      ; preds = %89
  %95 = fsub float -0.000000e+00, %.pr4, !dbg !333
  br label %96, !dbg !333

; <label>:96                                      ; preds = %89, %94
  %97 = phi float [ %95, %94 ], [ %.pr4, %89 ], !dbg !333
  tail call void @llvm.dbg.value(metadata !{float %97}, i64 0, metadata !73), !dbg !333
  %i.43038 = add nsw i32 %i.246, 1, !dbg !334
  %98 = icmp slt i32 %i.43038, %n, !dbg !335
  br i1 %98, label %.lr.ph, label %.outer._crit_edge, !dbg !335

.lr.ph:                                           ; preds = %96, %.outer.backedge
  %i.43042 = phi i32 [ %i.430, %.outer.backedge ], [ %i.43038, %96 ]
  %.247.pn = phi float* [ %.432, %.outer.backedge ], [ %.247, %96 ]
  %xmax.2.ph40 = phi float [ %xmax.2.ph.be, %.outer.backedge ], [ %97, %96 ]
  %sum.4.ph39 = phi double [ %112, %.outer.backedge ], [ %93, %96 ]
  br label %99, !dbg !335

; <label>:99                                      ; preds = %.lr.ph, %116
  %i.433 = phi i32 [ %i.43042, %.lr.ph ], [ %i.4, %116 ]
  %.247.pn.pn = phi float* [ %.247.pn, %.lr.ph ], [ %.432, %116 ]
  %sum.431 = phi double [ %sum.4.ph39, %.lr.ph ], [ %120, %116 ]
  %.432 = getelementptr inbounds float* %.247.pn.pn, i64 %13, !dbg !337
  %100 = load float* %.432, align 4, !dbg !338, !tbaa !146
  %101 = fcmp ogt float %100, 0.000000e+00, !dbg !338
  br i1 %101, label %104, label %102, !dbg !338

; <label>:102                                     ; preds = %99
  %103 = fsub float -0.000000e+00, %100, !dbg !338
  br label %104, !dbg !338

; <label>:104                                     ; preds = %99, %102
  %105 = phi float [ %100, %99 ], [ %103, %102 ], !dbg !338
  %106 = fcmp ogt float %105, %xmax.2.ph40, !dbg !338
  br i1 %106, label %107, label %116, !dbg !338

; <label>:107                                     ; preds = %104
  %108 = fdiv float %xmax.2.ph40, %100, !dbg !341
  %109 = fpext float %108 to double, !dbg !341
  %110 = fmul double %sum.431, %109, !dbg !341
  %111 = fmul double %109, %110, !dbg !341
  %112 = fadd double %111, 1.000000e+00, !dbg !341
  tail call void @llvm.dbg.value(metadata !{double %112}, i64 0, metadata !69), !dbg !341
  br i1 %101, label %.outer.backedge, label %114, !dbg !343

.outer.backedge:                                  ; preds = %107, %114
  %xmax.2.ph.be = phi float [ %100, %107 ], [ %115, %114 ]
  %i.430 = add nsw i32 %i.433, 1, !dbg !334
  %113 = icmp slt i32 %i.430, %n, !dbg !335
  br i1 %113, label %.lr.ph, label %.outer._crit_edge, !dbg !335

; <label>:114                                     ; preds = %107
  %115 = fsub float -0.000000e+00, %100, !dbg !343
  br label %.outer.backedge, !dbg !343

; <label>:116                                     ; preds = %104
  %117 = fdiv float %100, %xmax.2.ph40, !dbg !344
  %118 = fmul float %117, %117, !dbg !344
  %119 = fpext float %118 to double, !dbg !344
  %120 = fadd double %sum.431, %119, !dbg !344
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !69), !dbg !344
  %i.4 = add nsw i32 %i.433, 1, !dbg !334
  %121 = icmp slt i32 %i.4, %n, !dbg !335
  br i1 %121, label %99, label %.outer._crit_edge, !dbg !335

.outer._crit_edge:                                ; preds = %.outer.backedge, %116, %96
  %xmax.2.ph.lcssa = phi float [ %97, %96 ], [ %xmax.2.ph40, %116 ], [ %xmax.2.ph.be, %.outer.backedge ]
  %sum.4.lcssa = phi double [ %93, %96 ], [ %120, %116 ], [ %112, %.outer.backedge ]
  %122 = fpext float %xmax.2.ph.lcssa to double, !dbg !345
  %123 = tail call double @sqrt(double %sum.4.lcssa) #5, !dbg !345
  %124 = fmul double %122, %123, !dbg !345
  br label %.critedge.thread3, !dbg !345

.critedge.thread3:                                ; preds = %17, %r1mach.exit, %0, %.outer._crit_edge, %.outer6._crit_edge, %._crit_edge49
  %.0 = phi double [ %124, %.outer._crit_edge ], [ %44, %._crit_edge49 ], [ %88, %.outer6._crit_edge ], [ 0.000000e+00, %0 ], [ 0.000000e+00, %r1mach.exit ], [ 0.000000e+00, %17 ]
  ret double %.0, !dbg !346
}

; Function Attrs: nounwind optsize
declare double @sqrt(double) #2

; Function Attrs: nounwind optsize readnone uwtable
define double @r1mach() #3 {
  tail call void @llvm.dbg.value(metadata !347, i64 0, metadata !78), !dbg !348
  br label %1, !dbg !349

; <label>:1                                       ; preds = %1, %0
  %u.0 = phi float [ 1.000000e+00, %0 ], [ %2, %1 ]
  %2 = fmul float %u.0, 5.000000e-01, !dbg !350
  tail call void @llvm.dbg.value(metadata !{float %2}, i64 0, metadata !78), !dbg !350
  %3 = fadd float %2, 1.000000e+00, !dbg !351
  tail call void @llvm.dbg.value(metadata !{float %3}, i64 0, metadata !79), !dbg !351
  %4 = fcmp une float %3, 1.000000e+00, !dbg !352
  br i1 %4, label %1, label %5, !dbg !352

; <label>:5                                       ; preds = %1
  %6 = fpext float %2 to double, !dbg !351
  %7 = fmul double %6, 2.000000e+00, !dbg !353
  ret double %7, !dbg !353
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !84), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !85), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !86), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !87), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %d}, i64 0, metadata !88), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %e}, i64 0, metadata !89), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %f}, i64 0, metadata !90), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %g}, i64 0, metadata !91), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %h}, i64 0, metadata !92), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !93), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !94), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !95), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !96), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %m}, i64 0, metadata !97), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %o}, i64 0, metadata !98), !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %p}, i64 0, metadata !99), !dbg !354
  %n.off = add i32 %n, -1, !dbg !355
  %1 = icmp ugt i32 %n.off, 14, !dbg !355
  br i1 %1, label %45, label %2, !dbg !355

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !100), !dbg !357
  %3 = icmp eq i32 %n, 1, !dbg !358
  br i1 %3, label %45, label %4, !dbg !358

; <label>:4                                       ; preds = %2
  %5 = icmp sgt i32 %a, %b, !dbg !360
  tail call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !100), !dbg !360
  %b.a = select i1 %5, i32 %b, i32 %a, !dbg !360
  %6 = icmp eq i32 %n, 2, !dbg !362
  br i1 %6, label %45, label %7, !dbg !362

; <label>:7                                       ; preds = %4
  %8 = icmp sgt i32 %b.a, %c, !dbg !364
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !100), !dbg !364
  %c.b.a = select i1 %8, i32 %c, i32 %b.a, !dbg !364
  %9 = icmp eq i32 %n, 3, !dbg !366
  br i1 %9, label %45, label %10, !dbg !366

; <label>:10                                      ; preds = %7
  %11 = icmp sgt i32 %c.b.a, %d, !dbg !368
  tail call void @llvm.dbg.value(metadata !{i32 %d}, i64 0, metadata !100), !dbg !368
  %d.c.b.a = select i1 %11, i32 %d, i32 %c.b.a, !dbg !368
  %12 = icmp eq i32 %n, 4, !dbg !370
  br i1 %12, label %45, label %13, !dbg !370

; <label>:13                                      ; preds = %10
  %14 = icmp sgt i32 %d.c.b.a, %e, !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %e}, i64 0, metadata !100), !dbg !372
  %e.d.c.b.a = select i1 %14, i32 %e, i32 %d.c.b.a, !dbg !372
  %15 = icmp eq i32 %n, 5, !dbg !374
  br i1 %15, label %45, label %16, !dbg !374

; <label>:16                                      ; preds = %13
  %17 = icmp sgt i32 %e.d.c.b.a, %f, !dbg !376
  tail call void @llvm.dbg.value(metadata !{i32 %f}, i64 0, metadata !100), !dbg !376
  %f.e.d.c.b.a = select i1 %17, i32 %f, i32 %e.d.c.b.a, !dbg !376
  %18 = icmp eq i32 %n, 6, !dbg !378
  br i1 %18, label %45, label %19, !dbg !378

; <label>:19                                      ; preds = %16
  %20 = icmp sgt i32 %f.e.d.c.b.a, %g, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i32 %g}, i64 0, metadata !100), !dbg !380
  %g.f.e.d.c.b.a = select i1 %20, i32 %g, i32 %f.e.d.c.b.a, !dbg !380
  %21 = icmp eq i32 %n, 7, !dbg !382
  br i1 %21, label %45, label %22, !dbg !382

; <label>:22                                      ; preds = %19
  %23 = icmp sgt i32 %g.f.e.d.c.b.a, %h, !dbg !384
  tail call void @llvm.dbg.value(metadata !{i32 %h}, i64 0, metadata !100), !dbg !384
  %h.g.f.e.d.c.b.a = select i1 %23, i32 %h, i32 %g.f.e.d.c.b.a, !dbg !384
  %24 = icmp eq i32 %n, 8, !dbg !386
  br i1 %24, label %45, label %25, !dbg !386

; <label>:25                                      ; preds = %22
  %26 = icmp sgt i32 %h.g.f.e.d.c.b.a, %i, !dbg !388
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !100), !dbg !388
  %i.h.g.f.e.d.c.b.a = select i1 %26, i32 %i, i32 %h.g.f.e.d.c.b.a, !dbg !388
  %27 = icmp eq i32 %n, 9, !dbg !390
  br i1 %27, label %45, label %28, !dbg !390

; <label>:28                                      ; preds = %25
  %29 = icmp sgt i32 %i.h.g.f.e.d.c.b.a, %j, !dbg !392
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !100), !dbg !392
  %j.i.h.g.f.e.d.c.b.a = select i1 %29, i32 %j, i32 %i.h.g.f.e.d.c.b.a, !dbg !392
  %30 = icmp eq i32 %n, 10, !dbg !394
  br i1 %30, label %45, label %31, !dbg !394

; <label>:31                                      ; preds = %28
  %32 = icmp sgt i32 %j.i.h.g.f.e.d.c.b.a, %k, !dbg !396
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !100), !dbg !396
  %k.j.i.h.g.f.e.d.c.b.a = select i1 %32, i32 %k, i32 %j.i.h.g.f.e.d.c.b.a, !dbg !396
  %33 = icmp eq i32 %n, 11, !dbg !398
  br i1 %33, label %45, label %34, !dbg !398

; <label>:34                                      ; preds = %31
  %35 = icmp sgt i32 %k.j.i.h.g.f.e.d.c.b.a, %l, !dbg !400
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !100), !dbg !400
  %l.k.j.i.h.g.f.e.d.c.b.a = select i1 %35, i32 %l, i32 %k.j.i.h.g.f.e.d.c.b.a, !dbg !400
  %36 = icmp eq i32 %n, 12, !dbg !402
  br i1 %36, label %45, label %37, !dbg !402

; <label>:37                                      ; preds = %34
  %38 = icmp sgt i32 %l.k.j.i.h.g.f.e.d.c.b.a, %m, !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32 %m}, i64 0, metadata !100), !dbg !404
  %m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %38, i32 %m, i32 %l.k.j.i.h.g.f.e.d.c.b.a, !dbg !404
  %39 = icmp eq i32 %n, 13, !dbg !406
  br i1 %39, label %45, label %40, !dbg !406

; <label>:40                                      ; preds = %37
  %41 = icmp sgt i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, %o, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i32 %o}, i64 0, metadata !100), !dbg !408
  %o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %41, i32 %o, i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !408
  %42 = icmp eq i32 %n, 14, !dbg !410
  br i1 %42, label %45, label %43, !dbg !410

; <label>:43                                      ; preds = %40
  %44 = icmp sgt i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %p, !dbg !412
  tail call void @llvm.dbg.value(metadata !{i32 %p}, i64 0, metadata !100), !dbg !412
  %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %44, i32 %p, i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !412
  br label %45, !dbg !414

; <label>:45                                      ; preds = %40, %37, %34, %31, %28, %25, %22, %19, %16, %13, %10, %7, %4, %2, %0, %43
  %.0 = phi i32 [ %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a, %43 ], [ -1, %0 ], [ %a, %2 ], [ %b.a, %4 ], [ %c.b.a, %7 ], [ %d.c.b.a, %10 ], [ %e.d.c.b.a, %13 ], [ %f.e.d.c.b.a, %16 ], [ %g.f.e.d.c.b.a, %19 ], [ %h.g.f.e.d.c.b.a, %22 ], [ %i.h.g.f.e.d.c.b.a, %25 ], [ %j.i.h.g.f.e.d.c.b.a, %28 ], [ %k.j.i.h.g.f.e.d.c.b.a, %31 ], [ %l.k.j.i.h.g.f.e.d.c.b.a, %34 ], [ %m.l.k.j.i.h.g.f.e.d.c.b.a, %37 ], [ %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %40 ]
  ret i32 %.0, !dbg !415
}

; Function Attrs: nounwind optsize uwtable
define i32 @sscal(i32 %n, double, float* nocapture %sx, i32 %incx) #1 {
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !105), !dbg !416
  tail call void @llvm.dbg.value(metadata !{float %sa}, i64 0, metadata !106), !dbg !417
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !107), !dbg !417
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !108), !dbg !416
  %2 = icmp slt i32 %n, 1, !dbg !418
  br i1 %2, label %.loopexit, label %3, !dbg !418

; <label>:3                                       ; preds = %1
  %4 = icmp eq i32 %incx, 1, !dbg !420
  br i1 %4, label %.preheader, label %6, !dbg !420

.preheader:                                       ; preds = %3
  %5 = icmp sgt i32 %n, 0, !dbg !422
  br i1 %5, label %.lr.ph, label %.loopexit, !dbg !422

; <label>:6                                       ; preds = %3
  %7 = icmp slt i32 %incx, 0, !dbg !424
  br i1 %7, label %8, label %.preheader2, !dbg !424

; <label>:8                                       ; preds = %6
  %9 = sub i32 1, %n, !dbg !424
  %10 = mul nsw i32 %9, %incx, !dbg !424
  %11 = sext i32 %10 to i64, !dbg !424
  %12 = getelementptr inbounds float* %sx, i64 %11, !dbg !424
  tail call void @llvm.dbg.value(metadata !{float* %12}, i64 0, metadata !107), !dbg !424
  br label %.preheader2, !dbg !424

.preheader2:                                      ; preds = %8, %6
  %.1.ph = phi float* [ %sx, %6 ], [ %12, %8 ]
  %13 = icmp sgt i32 %n, 0, !dbg !427
  br i1 %13, label %.lr.ph8, label %.loopexit, !dbg !427

.lr.ph8:                                          ; preds = %.preheader2
  %14 = sext i32 %incx to i64, !dbg !427
  br label %15, !dbg !427

; <label>:15                                      ; preds = %15, %.lr.ph8
  %i.07 = phi i32 [ 0, %.lr.ph8 ], [ %18, %15 ]
  %.16 = phi float* [ %.1.ph, %.lr.ph8 ], [ %19, %15 ]
  %16 = load float* %.16, align 4, !dbg !429, !tbaa !146
  %17 = fmul float %sa, %16, !dbg !429
  store float %17, float* %.16, align 4, !dbg !429, !tbaa !146
  %18 = add nsw i32 %i.07, 1, !dbg !427
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !109), !dbg !427
  %19 = getelementptr inbounds float* %.16, i64 %14, !dbg !427
  tail call void @llvm.dbg.value(metadata !{float* %19}, i64 0, metadata !107), !dbg !427
  %exitcond9 = icmp eq i32 %18, %n, !dbg !427
  br i1 %exitcond9, label %.loopexit, label %15, !dbg !427

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.15 = phi i32 [ %22, %.lr.ph ], [ 0, %.preheader ]
  %.24 = phi float* [ %23, %.lr.ph ], [ %sx, %.preheader ]
  %20 = load float* %.24, align 4, !dbg !430, !tbaa !146
  %21 = fmul float %sa, %20, !dbg !430
  store float %21, float* %.24, align 4, !dbg !430, !tbaa !146
  %22 = add nsw i32 %i.15, 1, !dbg !422
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !109), !dbg !422
  %23 = getelementptr inbounds float* %.24, i64 1, !dbg !422
  tail call void @llvm.dbg.value(metadata !{float* %23}, i64 0, metadata !107), !dbg !422
  %exitcond = icmp eq i32 %22, %n, !dbg !422
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !422

.loopexit:                                        ; preds = %15, %.lr.ph, %.preheader2, %.preheader, %1
  %.0 = phi i32 [ 1, %1 ], [ 0, %.preheader ], [ 0, %.preheader2 ], [ 0, %.lr.ph ], [ 0, %15 ]
  ret i32 %.0, !dbg !431
}

; Function Attrs: nounwind optsize uwtable
define void @vexopy(i32 %n, float* nocapture %v, float* nocapture readonly %x, float* nocapture readonly %y, i32 %itype) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !432
  tail call void @llvm.dbg.value(metadata !{float* %v}, i64 0, metadata !115), !dbg !433
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !116), !dbg !433
  tail call void @llvm.dbg.value(metadata !{float* %y}, i64 0, metadata !117), !dbg !433
  tail call void @llvm.dbg.value(metadata !{i32 %itype}, i64 0, metadata !118), !dbg !432
  %1 = icmp slt i32 %n, 1, !dbg !434
  br i1 %1, label %.loopexit, label %2, !dbg !434

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %itype, 1, !dbg !436
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !119), !dbg !438
  %4 = icmp sgt i32 %n, 0, !dbg !438
  br i1 %3, label %.preheader, label %.preheader5, !dbg !436

.preheader5:                                      ; preds = %2
  br i1 %4, label %.lr.ph15, label %.loopexit, !dbg !440

.preheader:                                       ; preds = %2
  br i1 %4, label %.lr.ph, label %.loopexit, !dbg !438

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %i.010 = phi i32 [ %8, %.lr.ph ], [ 0, %.preheader ]
  %.09 = phi float* [ %11, %.lr.ph ], [ %v, %.preheader ]
  %.018 = phi float* [ %10, %.lr.ph ], [ %y, %.preheader ]
  %.037 = phi float* [ %9, %.lr.ph ], [ %x, %.preheader ]
  %5 = load float* %.037, align 4, !dbg !442, !tbaa !146
  %6 = load float* %.018, align 4, !dbg !442, !tbaa !146
  %7 = fadd float %5, %6, !dbg !442
  store float %7, float* %.09, align 4, !dbg !442, !tbaa !146
  %8 = add nsw i32 %i.010, 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !119), !dbg !438
  %9 = getelementptr inbounds float* %.037, i64 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %9}, i64 0, metadata !116), !dbg !438
  %10 = getelementptr inbounds float* %.018, i64 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %10}, i64 0, metadata !117), !dbg !438
  %11 = getelementptr inbounds float* %.09, i64 1, !dbg !438
  tail call void @llvm.dbg.value(metadata !{float* %11}, i64 0, metadata !115), !dbg !438
  %exitcond = icmp eq i32 %8, %n, !dbg !438
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !438

.lr.ph15:                                         ; preds = %.preheader5, %.lr.ph15
  %i.114 = phi i32 [ %15, %.lr.ph15 ], [ 0, %.preheader5 ]
  %.113 = phi float* [ %18, %.lr.ph15 ], [ %v, %.preheader5 ]
  %.1212 = phi float* [ %17, %.lr.ph15 ], [ %y, %.preheader5 ]
  %.1411 = phi float* [ %16, %.lr.ph15 ], [ %x, %.preheader5 ]
  %12 = load float* %.1411, align 4, !dbg !443, !tbaa !146
  %13 = load float* %.1212, align 4, !dbg !443, !tbaa !146
  %14 = fsub float %12, %13, !dbg !443
  store float %14, float* %.113, align 4, !dbg !443, !tbaa !146
  %15 = add nsw i32 %i.114, 1, !dbg !440
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !119), !dbg !440
  %16 = getelementptr inbounds float* %.1411, i64 1, !dbg !440
  tail call void @llvm.dbg.value(metadata !{float* %16}, i64 0, metadata !116), !dbg !440
  %17 = getelementptr inbounds float* %.1212, i64 1, !dbg !440
  tail call void @llvm.dbg.value(metadata !{float* %17}, i64 0, metadata !117), !dbg !440
  %18 = getelementptr inbounds float* %.113, i64 1, !dbg !440
  tail call void @llvm.dbg.value(metadata !{float* %18}, i64 0, metadata !115), !dbg !440
  %exitcond16 = icmp eq i32 %15, %n, !dbg !440
  br i1 %exitcond16, label %.loopexit, label %.lr.ph15, !dbg !440

.loopexit:                                        ; preds = %.lr.ph15, %.lr.ph, %.preheader5, %.preheader, %0
  ret void, !dbg !444
}

; Function Attrs: nounwind optsize uwtable
define void @vfill(i32 %n, float* nocapture %v, double) #1 {
  %val = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !124), !dbg !445
  tail call void @llvm.dbg.value(metadata !{float* %v}, i64 0, metadata !125), !dbg !446
  tail call void @llvm.dbg.value(metadata !{float %val}, i64 0, metadata !126), !dbg !446
  %2 = icmp slt i32 %n, 1, !dbg !447
  br i1 %2, label %.loopexit, label %.lr.ph, !dbg !447

.lr.ph:                                           ; preds = %1, %.lr.ph
  %i.02 = phi i32 [ %3, %.lr.ph ], [ 0, %1 ]
  %.01 = phi float* [ %4, %.lr.ph ], [ %v, %1 ]
  store float %val, float* %.01, align 4, !dbg !449, !tbaa !146
  %3 = add nsw i32 %i.02, 1, !dbg !451
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !127), !dbg !451
  %4 = getelementptr inbounds float* %.01, i64 1, !dbg !451
  tail call void @llvm.dbg.value(metadata !{float* %4}, i64 0, metadata !125), !dbg !451
  %exitcond = icmp eq i32 %3, %n, !dbg !451
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !451

.loopexit:                                        ; preds = %.lr.ph, %1
  ret void, !dbg !452
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c] [DW_LANG_C99]
!1 = metadata !{metadata !"blas.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !29, metadata !38, metadata !48, metadata !60, metadata !74, metadata !80, metadata !101, metadata !110, metadata !120}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"isamax", metadata !"isamax", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, float*, i32)* @isamax, null, null, metadata !11, i32 36} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 36] [isamax]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!10 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!12 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777241, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 25]
!13 = metadata !{i32 786689, metadata !4, metadata !"sx", metadata !5, i32 33554456, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 24]
!14 = metadata !{i32 786689, metadata !4, metadata !"incx", metadata !5, i32 50331673, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 25]
!15 = metadata !{i32 786688, metadata !4, metadata !"smax", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [smax] [line 37]
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 38]
!17 = metadata !{i32 786688, metadata !4, metadata !"istmp", metadata !5, i32 38, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [istmp] [line 38]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"saxpy", metadata !"saxpy", metadata !"", i32 69, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, double, float*, i32, float*, i32)* @saxpy, null, null, metadata !21, i32 87} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 87] [saxpy]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null, metadata !8, metadata !10, metadata !9, metadata !8, metadata !9, metadata !8}
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28}
!22 = metadata !{i32 786689, metadata !18, metadata !"n", metadata !5, i32 16777287, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 71]
!23 = metadata !{i32 786689, metadata !18, metadata !"sa", metadata !5, i32 33554502, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 70]
!24 = metadata !{i32 786689, metadata !18, metadata !"sx", metadata !5, i32 50331718, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 70]
!25 = metadata !{i32 786689, metadata !18, metadata !"incx", metadata !5, i32 67108935, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 71]
!26 = metadata !{i32 786689, metadata !18, metadata !"sy", metadata !5, i32 83886150, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 70]
!27 = metadata !{i32 786689, metadata !18, metadata !"incy", metadata !5, i32 100663367, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 71]
!28 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 88, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 88]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"saxpyx", metadata !"saxpyx", metadata !"", i32 112, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, double, float*, i32, float*, i32)* @saxpyx, null, null, metadata !30, i32 130} ; [ DW_TAG_subprogram ] [line 112] [def] [scope 130] [saxpyx]
!30 = metadata !{metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37}
!31 = metadata !{i32 786689, metadata !29, metadata !"n", metadata !5, i32 16777330, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 114]
!32 = metadata !{i32 786689, metadata !29, metadata !"sa", metadata !5, i32 33554545, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 113]
!33 = metadata !{i32 786689, metadata !29, metadata !"sx", metadata !5, i32 50331761, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 113]
!34 = metadata !{i32 786689, metadata !29, metadata !"incx", metadata !5, i32 67108978, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 114]
!35 = metadata !{i32 786689, metadata !29, metadata !"sy", metadata !5, i32 83886193, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 113]
!36 = metadata !{i32 786689, metadata !29, metadata !"incy", metadata !5, i32 100663410, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 114]
!37 = metadata !{i32 786688, metadata !29, metadata !"i", metadata !5, i32 131, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 131]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"scopy", metadata !"scopy", metadata !"", i32 155, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, float*, i32, float*, i32)* @scopy, null, null, metadata !41, i32 171} ; [ DW_TAG_subprogram ] [line 155] [def] [scope 171] [scopy]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{null, metadata !8, metadata !9, metadata !8, metadata !9, metadata !8}
!41 = metadata !{metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47}
!42 = metadata !{i32 786689, metadata !38, metadata !"n", metadata !5, i32 16777373, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 157]
!43 = metadata !{i32 786689, metadata !38, metadata !"sx", metadata !5, i32 33554588, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 156]
!44 = metadata !{i32 786689, metadata !38, metadata !"incx", metadata !5, i32 50331805, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 157]
!45 = metadata !{i32 786689, metadata !38, metadata !"sy", metadata !5, i32 67109020, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 156]
!46 = metadata !{i32 786689, metadata !38, metadata !"incy", metadata !5, i32 83886237, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 157]
!47 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 172, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 172]
!48 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sdot", metadata !"sdot", metadata !"", i32 196, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double (i32, float*, i32, float*, i32)* @sdot, null, null, metadata !52, i32 214} ; [ DW_TAG_subprogram ] [line 196] [def] [scope 214] [sdot]
!49 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{metadata !51, metadata !8, metadata !9, metadata !8, metadata !9, metadata !8}
!51 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!52 = metadata !{metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59}
!53 = metadata !{i32 786689, metadata !48, metadata !"n", metadata !5, i32 16777414, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 198]
!54 = metadata !{i32 786689, metadata !48, metadata !"sx", metadata !5, i32 33554629, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 197]
!55 = metadata !{i32 786689, metadata !48, metadata !"incx", metadata !5, i32 50331846, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 198]
!56 = metadata !{i32 786689, metadata !48, metadata !"sy", metadata !5, i32 67109061, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sy] [line 197]
!57 = metadata !{i32 786689, metadata !48, metadata !"incy", metadata !5, i32 83886278, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 198]
!58 = metadata !{i32 786688, metadata !48, metadata !"i", metadata !5, i32 215, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 215]
!59 = metadata !{i32 786688, metadata !48, metadata !"stemp", metadata !5, i32 216, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stemp] [line 216]
!60 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"snrm2", metadata !"snrm2", metadata !"", i32 241, metadata !61, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double (i32, float*, i32)* @snrm2, null, null, metadata !63, i32 262} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 262] [snrm2]
!61 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{metadata !51, metadata !8, metadata !9, metadata !8}
!63 = metadata !{metadata !64, metadata !65, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !71, metadata !72, metadata !73}
!64 = metadata !{i32 786689, metadata !60, metadata !"n", metadata !5, i32 16777459, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 243]
!65 = metadata !{i32 786689, metadata !60, metadata !"sx", metadata !5, i32 33554674, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 242]
!66 = metadata !{i32 786689, metadata !60, metadata !"incx", metadata !5, i32 50331891, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 243]
!67 = metadata !{i32 786688, metadata !60, metadata !"i", metadata !5, i32 263, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 263]
!68 = metadata !{i32 786688, metadata !60, metadata !"phase", metadata !5, i32 264, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [phase] [line 264]
!69 = metadata !{i32 786688, metadata !60, metadata !"sum", metadata !5, i32 265, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 265]
!70 = metadata !{i32 786688, metadata !60, metadata !"cutlo", metadata !5, i32 265, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutlo] [line 265]
!71 = metadata !{i32 786688, metadata !60, metadata !"cuthi", metadata !5, i32 265, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cuthi] [line 265]
!72 = metadata !{i32 786688, metadata !60, metadata !"hitst", metadata !5, i32 265, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hitst] [line 265]
!73 = metadata !{i32 786688, metadata !60, metadata !"xmax", metadata !5, i32 266, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xmax] [line 266]
!74 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"r1mach", metadata !"r1mach", metadata !"", i32 327, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double ()* @r1mach, null, null, metadata !77, i32 334} ; [ DW_TAG_subprogram ] [line 327] [def] [scope 334] [r1mach]
!75 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !51}
!77 = metadata !{metadata !78, metadata !79}
!78 = metadata !{i32 786688, metadata !74, metadata !"u", metadata !5, i32 335, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 335]
!79 = metadata !{i32 786688, metadata !74, metadata !"comp", metadata !5, i32 335, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!80 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"min0", metadata !"min0", metadata !"", i32 346, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32)* @min0, null, null, metadata !83, i32 359} ; [ DW_TAG_subprogram ] [line 346] [def] [scope 359] [min0]
!81 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8}
!83 = metadata !{metadata !84, metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94, metadata !95, metadata !96, metadata !97, metadata !98, metadata !99, metadata !100}
!84 = metadata !{i32 786689, metadata !80, metadata !"n", metadata !5, i32 16777574, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 358]
!85 = metadata !{i32 786689, metadata !80, metadata !"a", metadata !5, i32 33554790, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 358]
!86 = metadata !{i32 786689, metadata !80, metadata !"b", metadata !5, i32 50332006, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 358]
!87 = metadata !{i32 786689, metadata !80, metadata !"c", metadata !5, i32 67109222, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 358]
!88 = metadata !{i32 786689, metadata !80, metadata !"d", metadata !5, i32 83886438, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 358]
!89 = metadata !{i32 786689, metadata !80, metadata !"e", metadata !5, i32 100663654, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [e] [line 358]
!90 = metadata !{i32 786689, metadata !80, metadata !"f", metadata !5, i32 117440870, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 358]
!91 = metadata !{i32 786689, metadata !80, metadata !"g", metadata !5, i32 134218086, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [g] [line 358]
!92 = metadata !{i32 786689, metadata !80, metadata !"h", metadata !5, i32 150995302, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [h] [line 358]
!93 = metadata !{i32 786689, metadata !80, metadata !"i", metadata !5, i32 167772518, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 358]
!94 = metadata !{i32 786689, metadata !80, metadata !"j", metadata !5, i32 184549734, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 358]
!95 = metadata !{i32 786689, metadata !80, metadata !"k", metadata !5, i32 201326950, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 358]
!96 = metadata !{i32 786689, metadata !80, metadata !"l", metadata !5, i32 218104166, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 358]
!97 = metadata !{i32 786689, metadata !80, metadata !"m", metadata !5, i32 234881382, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 358]
!98 = metadata !{i32 786689, metadata !80, metadata !"o", metadata !5, i32 251658598, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [o] [line 358]
!99 = metadata !{i32 786689, metadata !80, metadata !"p", metadata !5, i32 268435814, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 358]
!100 = metadata !{i32 786688, metadata !80, metadata !"mt", metadata !5, i32 360, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mt] [line 360]
!101 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sscal", metadata !"sscal", metadata !"", i32 408, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, double, float*, i32)* @sscal, null, null, metadata !104, i32 424} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 424] [sscal]
!102 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = metadata !{metadata !8, metadata !8, metadata !10, metadata !9, metadata !8}
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !108, metadata !109}
!105 = metadata !{i32 786689, metadata !101, metadata !"n", metadata !5, i32 16777625, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 409]
!106 = metadata !{i32 786689, metadata !101, metadata !"sa", metadata !5, i32 33554842, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sa] [line 410]
!107 = metadata !{i32 786689, metadata !101, metadata !"sx", metadata !5, i32 50332058, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sx] [line 410]
!108 = metadata !{i32 786689, metadata !101, metadata !"incx", metadata !5, i32 67109273, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 409]
!109 = metadata !{i32 786688, metadata !101, metadata !"i", metadata !5, i32 425, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 425]
!110 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"vexopy", metadata !"vexopy", metadata !"", i32 441, metadata !111, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, float*, float*, float*, i32)* @vexopy, null, null, metadata !113, i32 459} ; [ DW_TAG_subprogram ] [line 441] [def] [scope 459] [vexopy]
!111 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !112, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = metadata !{null, metadata !8, metadata !9, metadata !9, metadata !9, metadata !8}
!113 = metadata !{metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119}
!114 = metadata !{i32 786689, metadata !110, metadata !"n", metadata !5, i32 16777658, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 442]
!115 = metadata !{i32 786689, metadata !110, metadata !"v", metadata !5, i32 33554875, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 443]
!116 = metadata !{i32 786689, metadata !110, metadata !"x", metadata !5, i32 50332091, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 443]
!117 = metadata !{i32 786689, metadata !110, metadata !"y", metadata !5, i32 67109307, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 443]
!118 = metadata !{i32 786689, metadata !110, metadata !"itype", metadata !5, i32 83886522, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [itype] [line 442]
!119 = metadata !{i32 786688, metadata !110, metadata !"i", metadata !5, i32 460, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 460]
!120 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"vfill", metadata !"vfill", metadata !"", i32 471, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void (i32, float*, double)* @vfill, null, null, metadata !123, i32 481} ; [ DW_TAG_subprogram ] [line 471] [def] [scope 481] [vfill]
!121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{null, metadata !8, metadata !9, metadata !10}
!123 = metadata !{metadata !124, metadata !125, metadata !126, metadata !127}
!124 = metadata !{i32 786689, metadata !120, metadata !"n", metadata !5, i32 16777688, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 472]
!125 = metadata !{i32 786689, metadata !120, metadata !"v", metadata !5, i32 33554905, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 473]
!126 = metadata !{i32 786689, metadata !120, metadata !"val", metadata !5, i32 50332121, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 473]
!127 = metadata !{i32 786688, metadata !120, metadata !"i", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 482]
!128 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!129 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!130 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!131 = metadata !{i32 25, i32 0, metadata !4, null}
!132 = metadata !{i32 24, i32 0, metadata !4, null}
!133 = metadata !{float 0.000000e+00}
!134 = metadata !{i32 37, i32 0, metadata !4, null}
!135 = metadata !{i32 0}
!136 = metadata !{i32 38, i32 0, metadata !4, null}
!137 = metadata !{i32 43, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !4, i32 43, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!139 = metadata !{i32 44, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!141 = metadata !{i32 46, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 46, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!143 = metadata !{i32 786443, metadata !1, metadata !140, i32 44, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!144 = metadata !{i32 47, i32 0, metadata !143, null}
!145 = metadata !{i32 48, i32 0, metadata !143, null}
!146 = metadata !{metadata !147, metadata !147, i64 0}
!147 = metadata !{metadata !"float", metadata !148, i64 0}
!148 = metadata !{metadata !"omnipotent char", metadata !149, i64 0}
!149 = metadata !{metadata !"Simple C/C++ TBAA"}
!150 = metadata !{i32 49, i32 0, metadata !143, null}
!151 = metadata !{i32 1}
!152 = metadata !{i32 50, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !143, i32 50, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!154 = metadata !{i32 51, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !153, i32 51, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!156 = metadata !{i32 53, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !155, i32 51, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!158 = metadata !{i32 58, i32 0, metadata !4, null} ; [ DW_TAG_imported_module ]
!159 = metadata !{i32 59, i32 0, metadata !4, null}
!160 = metadata !{i32 61, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !4, i32 61, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!162 = metadata !{i32 60, i32 0, metadata !4, null}
!163 = metadata !{i32 62, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !161, i32 62, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!165 = metadata !{i32 64, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 62, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!167 = metadata !{i32 67, i32 0, metadata !4, null}
!168 = metadata !{i32 71, i32 0, metadata !18, null}
!169 = metadata !{i32 70, i32 0, metadata !18, null}
!170 = metadata !{i32 90, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !18, i32 90, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!172 = metadata !{i32 91, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !18, i32 91, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!174 = metadata !{i32 92, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !176, i32 92, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!176 = metadata !{i32 786443, metadata !1, metadata !173, i32 91, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!177 = metadata !{i32 94, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !179, i32 94, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!179 = metadata !{i32 786443, metadata !1, metadata !175, i32 92, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!180 = metadata !{i32 95, i32 0, metadata !178, null}
!181 = metadata !{i32 98, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !176, i32 98, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!183 = metadata !{i32 100, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !185, i32 100, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!185 = metadata !{i32 786443, metadata !1, metadata !182, i32 98, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!186 = metadata !{i32 101, i32 0, metadata !184, null}
!187 = metadata !{i32 106, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !18, i32 106, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!189 = metadata !{i32 107, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !18, i32 107, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!191 = metadata !{i32 108, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !18, i32 108, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!193 = metadata !{i32 109, i32 0, metadata !192, null}
!194 = metadata !{i32 110, i32 0, metadata !18, null}
!195 = metadata !{i32 114, i32 0, metadata !29, null}
!196 = metadata !{i32 113, i32 0, metadata !29, null}
!197 = metadata !{i32 133, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !29, i32 133, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!199 = metadata !{i32 134, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !29, i32 134, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!201 = metadata !{i32 135, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !203, i32 135, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!203 = metadata !{i32 786443, metadata !1, metadata !200, i32 134, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!204 = metadata !{i32 137, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !206, i32 137, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!206 = metadata !{i32 786443, metadata !1, metadata !202, i32 135, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!207 = metadata !{i32 138, i32 0, metadata !205, null}
!208 = metadata !{i32 141, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !203, i32 141, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!210 = metadata !{i32 143, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !212, i32 143, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!212 = metadata !{i32 786443, metadata !1, metadata !209, i32 141, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!213 = metadata !{i32 144, i32 0, metadata !211, null}
!214 = metadata !{i32 149, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !29, i32 149, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!216 = metadata !{i32 150, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !29, i32 150, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!218 = metadata !{i32 151, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !29, i32 151, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!220 = metadata !{i32 152, i32 0, metadata !219, null}
!221 = metadata !{i32 153, i32 0, metadata !29, null}
!222 = metadata !{i32 157, i32 0, metadata !38, null}
!223 = metadata !{i32 156, i32 0, metadata !38, null}
!224 = metadata !{i32 174, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !38, i32 174, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!226 = metadata !{i32 175, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !38, i32 175, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!228 = metadata !{i32 176, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !230, i32 176, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!230 = metadata !{i32 786443, metadata !1, metadata !227, i32 175, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!231 = metadata !{i32 178, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !233, i32 178, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!233 = metadata !{i32 786443, metadata !1, metadata !229, i32 176, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!234 = metadata !{i32 179, i32 0, metadata !232, null}
!235 = metadata !{i32 182, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !230, i32 182, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!237 = metadata !{i32 184, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !239, i32 184, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!239 = metadata !{i32 786443, metadata !1, metadata !236, i32 182, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!240 = metadata !{i32 185, i32 0, metadata !238, null}
!241 = metadata !{i32 190, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !38, i32 190, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!243 = metadata !{i32 191, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !38, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!245 = metadata !{i32 192, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !38, i32 192, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!247 = metadata !{i32 193, i32 0, metadata !246, null}
!248 = metadata !{i32 195, i32 0, metadata !38, null}
!249 = metadata !{i32 198, i32 0, metadata !48, null}
!250 = metadata !{i32 197, i32 0, metadata !48, null}
!251 = metadata !{i32 216, i32 0, metadata !48, null}
!252 = metadata !{i32 218, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !1, metadata !48, i32 218, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!254 = metadata !{i32 219, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !48, i32 219, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!256 = metadata !{i32 220, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !258, i32 220, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!258 = metadata !{i32 786443, metadata !1, metadata !255, i32 219, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!259 = metadata !{i32 222, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !261, i32 222, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!261 = metadata !{i32 786443, metadata !1, metadata !257, i32 220, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!262 = metadata !{i32 223, i32 0, metadata !260, null}
!263 = metadata !{i32 226, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !1, metadata !258, i32 226, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!265 = metadata !{i32 228, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !267, i32 228, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!267 = metadata !{i32 786443, metadata !1, metadata !264, i32 226, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!268 = metadata !{i32 229, i32 0, metadata !266, null}
!269 = metadata !{i32 234, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !48, i32 234, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!271 = metadata !{i32 235, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !48, i32 235, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!273 = metadata !{i32 236, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !48, i32 236, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!275 = metadata !{i32 237, i32 0, metadata !274, null}
!276 = metadata !{i32 239, i32 0, metadata !48, null}
!277 = metadata !{i32 243, i32 0, metadata !60, null}
!278 = metadata !{i32 242, i32 0, metadata !60, null}
!279 = metadata !{i32 3}
!280 = metadata !{i32 264, i32 0, metadata !60, null}
!281 = metadata !{double 0.000000e+00}
!282 = metadata !{i32 265, i32 0, metadata !60, null}
!283 = metadata !{i32 268, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !60, i32 268, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!285 = metadata !{i32 338, i32 0, metadata !286, metadata !287}
!286 = metadata !{i32 786443, metadata !1, metadata !74, i32 337, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!287 = metadata !{i32 270, i32 0, metadata !60, null}
!288 = metadata !{i32 786688, metadata !74, metadata !"u", metadata !5, i32 335, metadata !10, i32 0, metadata !287} ; [ DW_TAG_auto_variable ] [u] [line 335]
!289 = metadata !{i32 339, i32 0, metadata !286, metadata !287}
!290 = metadata !{i32 786688, metadata !74, metadata !"comp", metadata !5, i32 335, metadata !10, i32 0, metadata !287} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!291 = metadata !{i32 340, i32 0, metadata !286, metadata !287}
!292 = metadata !{i32 342, i32 0, metadata !74, metadata !287}
!293 = metadata !{double 1.000000e+19}
!294 = metadata !{i32 271, i32 0, metadata !60, null}
!295 = metadata !{i32 272, i32 0, metadata !60, null}
!296 = metadata !{i32 273, i32 0, metadata !60, null}
!297 = metadata !{i32 276, i32 0, metadata !60, null}
!298 = metadata !{i32 278, i32 0, metadata !299, null}
!299 = metadata !{i32 786443, metadata !1, metadata !60, i32 276, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!300 = metadata !{i32 277, i32 0, metadata !299, null}
!301 = metadata !{i32 283, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !60, i32 283, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!303 = metadata !{i32 284, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !305, i32 284, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!305 = metadata !{i32 786443, metadata !1, metadata !302, i32 283, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!306 = metadata !{i32 285, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !308, i32 285, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!308 = metadata !{i32 786443, metadata !1, metadata !304, i32 284, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!309 = metadata !{i32 286, i32 0, metadata !308, null}
!310 = metadata !{i32 288, i32 0, metadata !305, null}
!311 = metadata !{i32 289, i32 0, metadata !305, null}
!312 = metadata !{i32 292, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !1, metadata !302, i32 291, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!314 = metadata !{i32 295, i32 0, metadata !313, null}
!315 = metadata !{i32 294, i32 0, metadata !313, null}
!316 = metadata !{i32 296, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !313, i32 296, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!318 = metadata !{i32 293, i32 0, metadata !313, null}
!319 = metadata !{i32 297, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !321, i32 297, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!321 = metadata !{i32 786443, metadata !1, metadata !317, i32 296, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!322 = metadata !{i32 298, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !320, i32 297, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!324 = metadata !{i32 299, i32 0, metadata !323, null}
!325 = metadata !{i32 301, i32 0, metadata !326, null}
!326 = metadata !{i32 786443, metadata !1, metadata !321, i32 301, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!327 = metadata !{i32 302, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !326, i32 301, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!329 = metadata !{i32 303, i32 0, metadata !328, null}
!330 = metadata !{i32 306, i32 0, metadata !321, null}
!331 = metadata !{i32 308, i32 0, metadata !313, null}
!332 = metadata !{i32 312, i32 0, metadata !60, null}
!333 = metadata !{i32 313, i32 0, metadata !60, null}
!334 = metadata !{i32 315, i32 0, metadata !60, null}
!335 = metadata !{i32 316, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !60, i32 316, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!337 = metadata !{i32 314, i32 0, metadata !60, null}
!338 = metadata !{i32 317, i32 0, metadata !339, null}
!339 = metadata !{i32 786443, metadata !1, metadata !340, i32 317, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!340 = metadata !{i32 786443, metadata !1, metadata !336, i32 316, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!341 = metadata !{i32 318, i32 0, metadata !342, null}
!342 = metadata !{i32 786443, metadata !1, metadata !339, i32 317, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!343 = metadata !{i32 319, i32 0, metadata !342, null}
!344 = metadata !{i32 322, i32 0, metadata !340, null}
!345 = metadata !{i32 324, i32 0, metadata !60, null}
!346 = metadata !{i32 325, i32 0, metadata !60, null}
!347 = metadata !{float 1.000000e+00}
!348 = metadata !{i32 335, i32 0, metadata !74, null}
!349 = metadata !{i32 337, i32 0, metadata !74, null}
!350 = metadata !{i32 338, i32 0, metadata !286, null}
!351 = metadata !{i32 339, i32 0, metadata !286, null}
!352 = metadata !{i32 340, i32 0, metadata !286, null}
!353 = metadata !{i32 342, i32 0, metadata !74, null}
!354 = metadata !{i32 358, i32 0, metadata !80, null}
!355 = metadata !{i32 362, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !80, i32 362, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!357 = metadata !{i32 363, i32 0, metadata !80, null}
!358 = metadata !{i32 364, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !80, i32 364, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!360 = metadata !{i32 366, i32 0, metadata !361, null}
!361 = metadata !{i32 786443, metadata !1, metadata !80, i32 366, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!362 = metadata !{i32 367, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !1, metadata !80, i32 367, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!364 = metadata !{i32 369, i32 0, metadata !365, null}
!365 = metadata !{i32 786443, metadata !1, metadata !80, i32 369, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!366 = metadata !{i32 370, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !80, i32 370, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!368 = metadata !{i32 372, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !80, i32 372, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!370 = metadata !{i32 373, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !80, i32 373, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!372 = metadata !{i32 375, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !80, i32 375, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!374 = metadata !{i32 376, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !80, i32 376, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!376 = metadata !{i32 378, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !80, i32 378, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!378 = metadata !{i32 379, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !80, i32 379, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!380 = metadata !{i32 381, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !80, i32 381, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!382 = metadata !{i32 382, i32 0, metadata !383, null}
!383 = metadata !{i32 786443, metadata !1, metadata !80, i32 382, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!384 = metadata !{i32 384, i32 0, metadata !385, null}
!385 = metadata !{i32 786443, metadata !1, metadata !80, i32 384, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!386 = metadata !{i32 385, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !80, i32 385, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!388 = metadata !{i32 387, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !80, i32 387, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!390 = metadata !{i32 388, i32 0, metadata !391, null}
!391 = metadata !{i32 786443, metadata !1, metadata !80, i32 388, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!392 = metadata !{i32 390, i32 0, metadata !393, null}
!393 = metadata !{i32 786443, metadata !1, metadata !80, i32 390, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!394 = metadata !{i32 391, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !80, i32 391, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!396 = metadata !{i32 393, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !80, i32 393, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!398 = metadata !{i32 394, i32 0, metadata !399, null}
!399 = metadata !{i32 786443, metadata !1, metadata !80, i32 394, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!400 = metadata !{i32 396, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !80, i32 396, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!402 = metadata !{i32 397, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !80, i32 397, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!404 = metadata !{i32 399, i32 0, metadata !405, null}
!405 = metadata !{i32 786443, metadata !1, metadata !80, i32 399, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!406 = metadata !{i32 400, i32 0, metadata !407, null}
!407 = metadata !{i32 786443, metadata !1, metadata !80, i32 400, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!408 = metadata !{i32 402, i32 0, metadata !409, null}
!409 = metadata !{i32 786443, metadata !1, metadata !80, i32 402, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!410 = metadata !{i32 403, i32 0, metadata !411, null}
!411 = metadata !{i32 786443, metadata !1, metadata !80, i32 403, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!412 = metadata !{i32 405, i32 0, metadata !413, null}
!413 = metadata !{i32 786443, metadata !1, metadata !80, i32 405, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!414 = metadata !{i32 406, i32 0, metadata !80, null}
!415 = metadata !{i32 407, i32 0, metadata !80, null}
!416 = metadata !{i32 409, i32 0, metadata !101, null}
!417 = metadata !{i32 410, i32 0, metadata !101, null}
!418 = metadata !{i32 427, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !101, i32 427, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!420 = metadata !{i32 430, i32 0, metadata !421, null}
!421 = metadata !{i32 786443, metadata !1, metadata !101, i32 430, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!422 = metadata !{i32 437, i32 0, metadata !423, null}
!423 = metadata !{i32 786443, metadata !1, metadata !101, i32 437, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!424 = metadata !{i32 431, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !426, i32 431, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!426 = metadata !{i32 786443, metadata !1, metadata !421, i32 430, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!427 = metadata !{i32 432, i32 0, metadata !428, null}
!428 = metadata !{i32 786443, metadata !1, metadata !426, i32 432, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!429 = metadata !{i32 433, i32 0, metadata !428, null}
!430 = metadata !{i32 438, i32 0, metadata !423, null}
!431 = metadata !{i32 440, i32 0, metadata !101, null}
!432 = metadata !{i32 442, i32 0, metadata !110, null}
!433 = metadata !{i32 443, i32 0, metadata !110, null}
!434 = metadata !{i32 462, i32 0, metadata !435, null}
!435 = metadata !{i32 786443, metadata !1, metadata !110, i32 462, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!436 = metadata !{i32 464, i32 0, metadata !437, null}
!437 = metadata !{i32 786443, metadata !1, metadata !110, i32 464, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!438 = metadata !{i32 465, i32 0, metadata !439, null}
!439 = metadata !{i32 786443, metadata !1, metadata !437, i32 465, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!440 = metadata !{i32 468, i32 0, metadata !441, null}
!441 = metadata !{i32 786443, metadata !1, metadata !437, i32 468, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!442 = metadata !{i32 466, i32 0, metadata !439, null}
!443 = metadata !{i32 469, i32 0, metadata !441, null}
!444 = metadata !{i32 470, i32 0, metadata !110, null}
!445 = metadata !{i32 472, i32 0, metadata !120, null}
!446 = metadata !{i32 473, i32 0, metadata !120, null}
!447 = metadata !{i32 484, i32 0, metadata !448, null}
!448 = metadata !{i32 786443, metadata !1, metadata !120, i32 484, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!449 = metadata !{i32 486, i32 0, metadata !450, null}
!450 = metadata !{i32 786443, metadata !1, metadata !120, i32 485, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!451 = metadata !{i32 485, i32 0, metadata !450, null}
!452 = metadata !{i32 487, i32 0, metadata !120, null}
