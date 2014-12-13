; ModuleID = 'blas.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readonly uwtable
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

; Function Attrs: nounwind uwtable
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
  br i1 %5, label %6, label %47, !dbg !172

; <label>:6                                       ; preds = %4
  %7 = icmp eq i32 %incx, 1, !dbg !174
  br i1 %7, label %.preheader, label %35, !dbg !174

.preheader:                                       ; preds = %6
  %8 = icmp sgt i32 %n, 0, !dbg !177
  br i1 %8, label %.lr.ph.preheader, label %.loopexit, !dbg !177

.lr.ph.preheader:                                 ; preds = %.preheader
  %9 = add i32 %n, -1, !dbg !180
  %10 = zext i32 %9 to i64
  %11 = add i64 %10, 1, !dbg !180
  %end.idx = add i64 %10, 1, !dbg !177
  %n.vec = and i64 %11, 8589934584, !dbg !177
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !177
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep27 = getelementptr float* %sx, i64 %13
  %scevgep = getelementptr float* %sy, i64 %13
  %bound1 = icmp uge float* %scevgep, %sx
  %bound0 = icmp uge float* %scevgep27, %sy
  %memcheck.conflict = and i1 %bound0, %bound1
  %14 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end31 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert80 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat81 = shufflevector <4 x float> %broadcast.splatinsert80, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !177
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep56 = getelementptr float* %sy, i64 %index
  %15 = bitcast float* %next.gep to <4 x float>*, !dbg !180
  %wide.load = load <4 x float>* %15, align 4, !dbg !180
  %next.gep.sum100 = or i64 %index, 4, !dbg !180
  %16 = getelementptr float* %sx, i64 %next.gep.sum100, !dbg !180
  %17 = bitcast float* %16 to <4 x float>*, !dbg !180
  %wide.load79 = load <4 x float>* %17, align 4, !dbg !180
  %18 = fmul <4 x float> %broadcast.splat81, %wide.load, !dbg !180
  %19 = fmul <4 x float> %broadcast.splat81, %wide.load79, !dbg !180
  %20 = bitcast float* %next.gep56 to <4 x float>*, !dbg !180
  %wide.load82 = load <4 x float>* %20, align 4, !dbg !180
  %next.gep56.sum101 = or i64 %index, 4, !dbg !180
  %21 = getelementptr float* %sy, i64 %next.gep56.sum101, !dbg !180
  %22 = bitcast float* %21 to <4 x float>*, !dbg !180
  %wide.load83 = load <4 x float>* %22, align 4, !dbg !180
  %23 = fadd <4 x float> %wide.load82, %18, !dbg !180
  %24 = fadd <4 x float> %wide.load83, %19, !dbg !180
  %25 = bitcast float* %next.gep56 to <4 x float>*, !dbg !180
  store <4 x float> %23, <4 x float>* %25, align 4, !dbg !180
  %26 = bitcast float* %21 to <4 x float>*, !dbg !180
  store <4 x float> %24, <4 x float>* %26, align 4, !dbg !180
  %index.next = add i64 %index, 8, !dbg !177
  %27 = icmp eq i64 %index.next, %n.vec, !dbg !177
  br i1 %27, label %middle.block, label %vector.body, !dbg !177, !llvm.loop !181

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %14, %vector.body ]
  %resume.val29 = phi float* [ %sx, %.lr.ph.preheader ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val30 = phi float* [ %sy, %.lr.ph.preheader ], [ %sy, %vector.memcheck ], [ %ptr.ind.end31, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %i.011 = phi i32 [ %32, %.lr.ph ], [ %trunc.resume.val, %middle.block ]
  %.010 = phi float* [ %34, %.lr.ph ], [ %resume.val29, %middle.block ]
  %.019 = phi float* [ %33, %.lr.ph ], [ %resume.val30, %middle.block ]
  %28 = load float* %.010, align 4, !dbg !180, !tbaa !146
  %29 = fmul float %sa, %28, !dbg !180
  %30 = load float* %.019, align 4, !dbg !180, !tbaa !146
  %31 = fadd float %30, %29, !dbg !180
  store float %31, float* %.019, align 4, !dbg !180, !tbaa !146
  %32 = add nsw i32 %i.011, 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !28), !dbg !177
  %33 = getelementptr inbounds float* %.019, i64 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !26), !dbg !177
  %34 = getelementptr inbounds float* %.010, i64 1, !dbg !177
  tail call void @llvm.dbg.value(metadata !{float* %34}, i64 0, metadata !24), !dbg !177
  %exitcond = icmp eq i32 %32, %n, !dbg !177
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !177, !llvm.loop !184

; <label>:35                                      ; preds = %6
  %36 = icmp sgt i32 %incx, 0, !dbg !185
  br i1 %36, label %.preheader5, label %47, !dbg !185

.preheader5:                                      ; preds = %35
  %37 = icmp sgt i32 %n, 0, !dbg !187
  br i1 %37, label %.lr.ph15, label %.loopexit, !dbg !187

.lr.ph15:                                         ; preds = %.preheader5
  %38 = sext i32 %incx to i64, !dbg !187
  br label %39, !dbg !187

; <label>:39                                      ; preds = %39, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %44, %39 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %45, %39 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %46, %39 ]
  %40 = load float* %.113, align 4, !dbg !190, !tbaa !146
  %41 = fmul float %sa, %40, !dbg !190
  %42 = load float* %.1212, align 4, !dbg !190, !tbaa !146
  %43 = fadd float %42, %41, !dbg !190
  store float %43, float* %.1212, align 4, !dbg !190, !tbaa !146
  %44 = add nsw i32 %i.114, 1, !dbg !187
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !28), !dbg !187
  %45 = getelementptr inbounds float* %.113, i64 %38, !dbg !187
  tail call void @llvm.dbg.value(metadata !{float* %45}, i64 0, metadata !24), !dbg !187
  %46 = getelementptr inbounds float* %.1212, i64 %38, !dbg !187
  tail call void @llvm.dbg.value(metadata !{float* %46}, i64 0, metadata !26), !dbg !187
  %exitcond20 = icmp eq i32 %44, %n, !dbg !187
  br i1 %exitcond20, label %.loopexit, label %39, !dbg !187

; <label>:47                                      ; preds = %35, %4
  %48 = icmp slt i32 %incx, 0, !dbg !191
  br i1 %48, label %49, label %55, !dbg !191

; <label>:49                                      ; preds = %47
  %50 = sub i32 1, %n, !dbg !191
  %51 = mul nsw i32 %50, %incx, !dbg !191
  %52 = add nsw i32 %51, 1, !dbg !191
  %53 = sext i32 %52 to i64, !dbg !191
  %54 = getelementptr inbounds float* %sx, i64 %53, !dbg !191
  tail call void @llvm.dbg.value(metadata !{float* %54}, i64 0, metadata !24), !dbg !191
  br label %55, !dbg !191

; <label>:55                                      ; preds = %49, %47
  %.2 = phi float* [ %54, %49 ], [ %sx, %47 ]
  %56 = icmp slt i32 %incy, 0, !dbg !193
  br i1 %56, label %57, label %.preheader7, !dbg !193

; <label>:57                                      ; preds = %55
  %58 = sub i32 1, %n, !dbg !193
  %59 = mul nsw i32 %58, %incy, !dbg !193
  %60 = add nsw i32 %59, 1, !dbg !193
  %61 = sext i32 %60 to i64, !dbg !193
  %62 = getelementptr inbounds float* %sy, i64 %61, !dbg !193
  tail call void @llvm.dbg.value(metadata !{float* %62}, i64 0, metadata !26), !dbg !193
  br label %.preheader7, !dbg !193

.preheader7:                                      ; preds = %57, %55
  %.34.ph = phi float* [ %sy, %55 ], [ %62, %57 ]
  %63 = icmp sgt i32 %n, 0, !dbg !195
  br i1 %63, label %.lr.ph19, label %.loopexit, !dbg !195

.lr.ph19:                                         ; preds = %.preheader7
  %64 = sext i32 %incx to i64, !dbg !195
  %65 = sext i32 %incy to i64, !dbg !195
  br label %66, !dbg !195

; <label>:66                                      ; preds = %66, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %71, %66 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %72, %66 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %73, %66 ]
  %67 = load float* %.317, align 4, !dbg !197, !tbaa !146
  %68 = fmul float %sa, %67, !dbg !197
  %69 = load float* %.3416, align 4, !dbg !197, !tbaa !146
  %70 = fadd float %69, %68, !dbg !197
  store float %70, float* %.3416, align 4, !dbg !197, !tbaa !146
  %71 = add nsw i32 %i.218, 1, !dbg !195
  tail call void @llvm.dbg.value(metadata !{i32 %71}, i64 0, metadata !28), !dbg !195
  %72 = getelementptr inbounds float* %.317, i64 %64, !dbg !195
  tail call void @llvm.dbg.value(metadata !{float* %72}, i64 0, metadata !24), !dbg !195
  %73 = getelementptr inbounds float* %.3416, i64 %65, !dbg !195
  tail call void @llvm.dbg.value(metadata !{float* %73}, i64 0, metadata !26), !dbg !195
  %exitcond21 = icmp eq i32 %71, %n, !dbg !195
  br i1 %exitcond21, label %.loopexit, label %66, !dbg !195

.loopexit:                                        ; preds = %66, %39, %.lr.ph, %middle.block, %.preheader7, %.preheader5, %.preheader, %1
  ret void, !dbg !198
}

; Function Attrs: nounwind uwtable
define void @saxpyx(i32 %n, double, float* nocapture %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #1 {
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !31), !dbg !199
  tail call void @llvm.dbg.value(metadata !{float %sa}, i64 0, metadata !32), !dbg !200
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !33), !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !34), !dbg !199
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !35), !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !36), !dbg !199
  %2 = icmp slt i32 %n, 1, !dbg !201
  %3 = fcmp oeq float %sa, 0.000000e+00, !dbg !201
  %or.cond = or i1 %2, %3, !dbg !201
  br i1 %or.cond, label %.loopexit, label %4, !dbg !201

; <label>:4                                       ; preds = %1
  %5 = icmp eq i32 %incx, %incy, !dbg !203
  br i1 %5, label %6, label %47, !dbg !203

; <label>:6                                       ; preds = %4
  %7 = icmp eq i32 %incx, 1, !dbg !205
  br i1 %7, label %.preheader, label %35, !dbg !205

.preheader:                                       ; preds = %6
  %8 = icmp sgt i32 %n, 0, !dbg !208
  br i1 %8, label %.lr.ph.preheader, label %.loopexit, !dbg !208

.lr.ph.preheader:                                 ; preds = %.preheader
  %9 = add i32 %n, -1, !dbg !211
  %10 = zext i32 %9 to i64
  %11 = add i64 %10, 1, !dbg !211
  %end.idx = add i64 %10, 1, !dbg !208
  %n.vec = and i64 %11, 8589934584, !dbg !208
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !208
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep27 = getelementptr float* %sy, i64 %13
  %scevgep = getelementptr float* %sx, i64 %13
  %bound1 = icmp uge float* %scevgep, %sy
  %bound0 = icmp uge float* %scevgep27, %sx
  %memcheck.conflict = and i1 %bound0, %bound1
  %14 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end31 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert82 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat83 = shufflevector <4 x float> %broadcast.splatinsert82, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !208
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep56 = getelementptr float* %sy, i64 %index
  %15 = bitcast float* %next.gep56 to <4 x float>*, !dbg !211
  %wide.load = load <4 x float>* %15, align 4, !dbg !211
  %next.gep56.sum100 = or i64 %index, 4, !dbg !211
  %16 = getelementptr float* %sy, i64 %next.gep56.sum100, !dbg !211
  %17 = bitcast float* %16 to <4 x float>*, !dbg !211
  %wide.load79 = load <4 x float>* %17, align 4, !dbg !211
  %18 = bitcast float* %next.gep to <4 x float>*, !dbg !211
  %wide.load80 = load <4 x float>* %18, align 4, !dbg !211
  %next.gep.sum101 = or i64 %index, 4, !dbg !211
  %19 = getelementptr float* %sx, i64 %next.gep.sum101, !dbg !211
  %20 = bitcast float* %19 to <4 x float>*, !dbg !211
  %wide.load81 = load <4 x float>* %20, align 4, !dbg !211
  %21 = fmul <4 x float> %broadcast.splat83, %wide.load80, !dbg !211
  %22 = fmul <4 x float> %broadcast.splat83, %wide.load81, !dbg !211
  %23 = fadd <4 x float> %wide.load, %21, !dbg !211
  %24 = fadd <4 x float> %wide.load79, %22, !dbg !211
  %25 = bitcast float* %next.gep to <4 x float>*, !dbg !211
  store <4 x float> %23, <4 x float>* %25, align 4, !dbg !211
  %26 = bitcast float* %19 to <4 x float>*, !dbg !211
  store <4 x float> %24, <4 x float>* %26, align 4, !dbg !211
  %index.next = add i64 %index, 8, !dbg !208
  %27 = icmp eq i64 %index.next, %n.vec, !dbg !208
  br i1 %27, label %middle.block, label %vector.body, !dbg !208, !llvm.loop !212

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %14, %vector.body ]
  %resume.val29 = phi float* [ %sx, %.lr.ph.preheader ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val30 = phi float* [ %sy, %.lr.ph.preheader ], [ %sy, %vector.memcheck ], [ %ptr.ind.end31, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %i.011 = phi i32 [ %32, %.lr.ph ], [ %trunc.resume.val, %middle.block ]
  %.010 = phi float* [ %33, %.lr.ph ], [ %resume.val29, %middle.block ]
  %.019 = phi float* [ %34, %.lr.ph ], [ %resume.val30, %middle.block ]
  %28 = load float* %.019, align 4, !dbg !211, !tbaa !146
  %29 = load float* %.010, align 4, !dbg !211, !tbaa !146
  %30 = fmul float %sa, %29, !dbg !211
  %31 = fadd float %28, %30, !dbg !211
  store float %31, float* %.010, align 4, !dbg !211, !tbaa !146
  %32 = add nsw i32 %i.011, 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !37), !dbg !208
  %33 = getelementptr inbounds float* %.010, i64 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !33), !dbg !208
  %34 = getelementptr inbounds float* %.019, i64 1, !dbg !208
  tail call void @llvm.dbg.value(metadata !{float* %34}, i64 0, metadata !35), !dbg !208
  %exitcond = icmp eq i32 %32, %n, !dbg !208
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !208, !llvm.loop !213

; <label>:35                                      ; preds = %6
  %36 = icmp sgt i32 %incx, 0, !dbg !214
  br i1 %36, label %.preheader5, label %47, !dbg !214

.preheader5:                                      ; preds = %35
  %37 = icmp sgt i32 %n, 0, !dbg !216
  br i1 %37, label %.lr.ph15, label %.loopexit, !dbg !216

.lr.ph15:                                         ; preds = %.preheader5
  %38 = sext i32 %incx to i64, !dbg !216
  br label %39, !dbg !216

; <label>:39                                      ; preds = %39, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %44, %39 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %45, %39 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %46, %39 ]
  %40 = load float* %.1212, align 4, !dbg !219, !tbaa !146
  %41 = load float* %.113, align 4, !dbg !219, !tbaa !146
  %42 = fmul float %sa, %41, !dbg !219
  %43 = fadd float %40, %42, !dbg !219
  store float %43, float* %.113, align 4, !dbg !219, !tbaa !146
  %44 = add nsw i32 %i.114, 1, !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !37), !dbg !216
  %45 = getelementptr inbounds float* %.113, i64 %38, !dbg !216
  tail call void @llvm.dbg.value(metadata !{float* %45}, i64 0, metadata !33), !dbg !216
  %46 = getelementptr inbounds float* %.1212, i64 %38, !dbg !216
  tail call void @llvm.dbg.value(metadata !{float* %46}, i64 0, metadata !35), !dbg !216
  %exitcond20 = icmp eq i32 %44, %n, !dbg !216
  br i1 %exitcond20, label %.loopexit, label %39, !dbg !216

; <label>:47                                      ; preds = %35, %4
  %48 = icmp slt i32 %incx, 0, !dbg !220
  br i1 %48, label %49, label %55, !dbg !220

; <label>:49                                      ; preds = %47
  %50 = sub i32 1, %n, !dbg !220
  %51 = mul nsw i32 %50, %incx, !dbg !220
  %52 = add nsw i32 %51, 1, !dbg !220
  %53 = sext i32 %52 to i64, !dbg !220
  %54 = getelementptr inbounds float* %sx, i64 %53, !dbg !220
  tail call void @llvm.dbg.value(metadata !{float* %54}, i64 0, metadata !33), !dbg !220
  br label %55, !dbg !220

; <label>:55                                      ; preds = %49, %47
  %.2 = phi float* [ %54, %49 ], [ %sx, %47 ]
  %56 = icmp slt i32 %incy, 0, !dbg !222
  br i1 %56, label %57, label %.preheader7, !dbg !222

; <label>:57                                      ; preds = %55
  %58 = sub i32 1, %n, !dbg !222
  %59 = mul nsw i32 %58, %incy, !dbg !222
  %60 = add nsw i32 %59, 1, !dbg !222
  %61 = sext i32 %60 to i64, !dbg !222
  %62 = getelementptr inbounds float* %sy, i64 %61, !dbg !222
  tail call void @llvm.dbg.value(metadata !{float* %62}, i64 0, metadata !35), !dbg !222
  br label %.preheader7, !dbg !222

.preheader7:                                      ; preds = %57, %55
  %.34.ph = phi float* [ %sy, %55 ], [ %62, %57 ]
  %63 = icmp sgt i32 %n, 0, !dbg !224
  br i1 %63, label %.lr.ph19, label %.loopexit, !dbg !224

.lr.ph19:                                         ; preds = %.preheader7
  %64 = sext i32 %incx to i64, !dbg !224
  %65 = sext i32 %incy to i64, !dbg !224
  br label %66, !dbg !224

; <label>:66                                      ; preds = %66, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %71, %66 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %72, %66 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %73, %66 ]
  %67 = load float* %.3416, align 4, !dbg !226, !tbaa !146
  %68 = load float* %.317, align 4, !dbg !226, !tbaa !146
  %69 = fmul float %sa, %68, !dbg !226
  %70 = fadd float %67, %69, !dbg !226
  store float %70, float* %.317, align 4, !dbg !226, !tbaa !146
  %71 = add nsw i32 %i.218, 1, !dbg !224
  tail call void @llvm.dbg.value(metadata !{i32 %71}, i64 0, metadata !37), !dbg !224
  %72 = getelementptr inbounds float* %.317, i64 %64, !dbg !224
  tail call void @llvm.dbg.value(metadata !{float* %72}, i64 0, metadata !33), !dbg !224
  %73 = getelementptr inbounds float* %.3416, i64 %65, !dbg !224
  tail call void @llvm.dbg.value(metadata !{float* %73}, i64 0, metadata !35), !dbg !224
  %exitcond21 = icmp eq i32 %71, %n, !dbg !224
  br i1 %exitcond21, label %.loopexit, label %66, !dbg !224

.loopexit:                                        ; preds = %66, %39, %.lr.ph, %middle.block, %.preheader7, %.preheader5, %.preheader, %1
  ret void, !dbg !227
}

; Function Attrs: nounwind uwtable
define void @scopy(i32 %n, float* nocapture %sx, i32 %incx, float* nocapture %sy, i32 %incy) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !42), !dbg !228
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !43), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !44), !dbg !228
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !45), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !46), !dbg !228
  %1 = icmp slt i32 %n, 1, !dbg !230
  br i1 %1, label %.loopexit, label %2, !dbg !230

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, %incy, !dbg !232
  br i1 %3, label %4, label %33, !dbg !232

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !234
  br i1 %5, label %.preheader, label %24, !dbg !234

.preheader:                                       ; preds = %4
  %6 = icmp sgt i32 %n, 0, !dbg !237
  br i1 %6, label %.lr.ph.preheader, label %.loopexit, !dbg !237

.lr.ph.preheader:                                 ; preds = %.preheader
  %7 = add i32 %n, -1, !dbg !240
  %8 = zext i32 %7 to i64
  %9 = add i64 %8, 1, !dbg !240
  %end.idx = add i64 %8, 1, !dbg !237
  %n.vec = and i64 %9, 8589934584, !dbg !237
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !237
  %10 = add i32 %n, -1
  %11 = zext i32 %10 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep28 = getelementptr float* %sx, i64 %11
  %scevgep = getelementptr float* %sy, i64 %11
  %bound1 = icmp uge float* %scevgep, %sx
  %bound0 = icmp uge float* %scevgep28, %sy
  %memcheck.conflict = and i1 %bound0, %bound1
  %12 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  %ptr.ind.end32 = getelementptr float* %sy, i64 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ], !dbg !237
  %next.gep = getelementptr float* %sx, i64 %index
  %next.gep57 = getelementptr float* %sy, i64 %index
  %13 = bitcast float* %next.gep to <4 x float>*, !dbg !240
  %wide.load = load <4 x float>* %13, align 4, !dbg !240
  %next.gep.sum101 = or i64 %index, 4, !dbg !240
  %14 = getelementptr float* %sx, i64 %next.gep.sum101, !dbg !240
  %15 = bitcast float* %14 to <4 x float>*, !dbg !240
  %wide.load80 = load <4 x float>* %15, align 4, !dbg !240
  %16 = bitcast float* %next.gep57 to <4 x float>*, !dbg !240
  store <4 x float> %wide.load, <4 x float>* %16, align 4, !dbg !240
  %next.gep57.sum106 = or i64 %index, 4, !dbg !240
  %17 = getelementptr float* %sy, i64 %next.gep57.sum106, !dbg !240
  %18 = bitcast float* %17 to <4 x float>*, !dbg !240
  store <4 x float> %wide.load80, <4 x float>* %18, align 4, !dbg !240
  %index.next = add i64 %index, 8, !dbg !237
  %19 = icmp eq i64 %index.next, %n.vec, !dbg !237
  br i1 %19, label %middle.block, label %vector.body, !dbg !237, !llvm.loop !241

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %12, %vector.body ]
  %resume.val30 = phi float* [ %sx, %.lr.ph.preheader ], [ %sx, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val31 = phi float* [ %sy, %.lr.ph.preheader ], [ %sy, %vector.memcheck ], [ %ptr.ind.end32, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %i.011 = phi i32 [ %23, %.lr.ph ], [ %trunc.resume.val, %middle.block ]
  %.010 = phi float* [ %20, %.lr.ph ], [ %resume.val30, %middle.block ]
  %.019 = phi float* [ %22, %.lr.ph ], [ %resume.val31, %middle.block ]
  %20 = getelementptr inbounds float* %.010, i64 1, !dbg !240
  tail call void @llvm.dbg.value(metadata !{float* %20}, i64 0, metadata !43), !dbg !240
  %21 = load float* %.010, align 4, !dbg !240, !tbaa !146
  %22 = getelementptr inbounds float* %.019, i64 1, !dbg !240
  tail call void @llvm.dbg.value(metadata !{float* %22}, i64 0, metadata !45), !dbg !240
  store float %21, float* %.019, align 4, !dbg !240, !tbaa !146
  %23 = add nsw i32 %i.011, 1, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !47), !dbg !237
  %exitcond = icmp eq i32 %23, %n, !dbg !237
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !237, !llvm.loop !242

; <label>:24                                      ; preds = %4
  %25 = icmp sgt i32 %incx, 0, !dbg !243
  br i1 %25, label %.preheader5, label %33, !dbg !243

.preheader5:                                      ; preds = %24
  %26 = icmp sgt i32 %n, 0, !dbg !245
  br i1 %26, label %.lr.ph15, label %.loopexit, !dbg !245

.lr.ph15:                                         ; preds = %.preheader5
  %27 = sext i32 %incx to i64, !dbg !245
  br label %28, !dbg !245

; <label>:28                                      ; preds = %28, %.lr.ph15
  %i.114 = phi i32 [ 0, %.lr.ph15 ], [ %30, %28 ]
  %.113 = phi float* [ %sx, %.lr.ph15 ], [ %31, %28 ]
  %.1212 = phi float* [ %sy, %.lr.ph15 ], [ %32, %28 ]
  %29 = load float* %.113, align 4, !dbg !248, !tbaa !146
  store float %29, float* %.1212, align 4, !dbg !248, !tbaa !146
  %30 = add nsw i32 %i.114, 1, !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !47), !dbg !245
  %31 = getelementptr inbounds float* %.113, i64 %27, !dbg !245
  tail call void @llvm.dbg.value(metadata !{float* %31}, i64 0, metadata !43), !dbg !245
  %32 = getelementptr inbounds float* %.1212, i64 %27, !dbg !245
  tail call void @llvm.dbg.value(metadata !{float* %32}, i64 0, metadata !45), !dbg !245
  %exitcond21 = icmp eq i32 %30, %n, !dbg !245
  br i1 %exitcond21, label %.loopexit, label %28, !dbg !245

; <label>:33                                      ; preds = %24, %2
  %34 = icmp slt i32 %incx, 0, !dbg !249
  br i1 %34, label %35, label %41, !dbg !249

; <label>:35                                      ; preds = %33
  %36 = sub i32 1, %n, !dbg !249
  %37 = mul nsw i32 %36, %incx, !dbg !249
  %38 = add nsw i32 %37, 1, !dbg !249
  %39 = sext i32 %38 to i64, !dbg !249
  %40 = getelementptr inbounds float* %sx, i64 %39, !dbg !249
  tail call void @llvm.dbg.value(metadata !{float* %40}, i64 0, metadata !43), !dbg !249
  br label %41, !dbg !249

; <label>:41                                      ; preds = %35, %33
  %.2 = phi float* [ %40, %35 ], [ %sx, %33 ]
  %42 = icmp slt i32 %incy, 0, !dbg !251
  br i1 %42, label %43, label %.preheader7, !dbg !251

; <label>:43                                      ; preds = %41
  %44 = sub i32 1, %n, !dbg !251
  %45 = mul nsw i32 %44, %incy, !dbg !251
  %46 = add nsw i32 %45, 1, !dbg !251
  %47 = sext i32 %46 to i64, !dbg !251
  %48 = getelementptr inbounds float* %sy, i64 %47, !dbg !251
  tail call void @llvm.dbg.value(metadata !{float* %48}, i64 0, metadata !45), !dbg !251
  br label %.preheader7, !dbg !251

.preheader7:                                      ; preds = %43, %41
  %.34.ph = phi float* [ %sy, %41 ], [ %48, %43 ]
  %49 = icmp sgt i32 %n, 0, !dbg !253
  br i1 %49, label %.lr.ph19, label %.loopexit, !dbg !253

.lr.ph19:                                         ; preds = %.preheader7
  %50 = sext i32 %incx to i64, !dbg !253
  %51 = sext i32 %incy to i64, !dbg !253
  br label %52, !dbg !253

; <label>:52                                      ; preds = %52, %.lr.ph19
  %i.218 = phi i32 [ 0, %.lr.ph19 ], [ %54, %52 ]
  %.317 = phi float* [ %.2, %.lr.ph19 ], [ %55, %52 ]
  %.3416 = phi float* [ %.34.ph, %.lr.ph19 ], [ %56, %52 ]
  %53 = load float* %.3416, align 4, !dbg !255, !tbaa !146
  store float %53, float* %.317, align 4, !dbg !255, !tbaa !146
  %54 = add nsw i32 %i.218, 1, !dbg !253
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !47), !dbg !253
  %55 = getelementptr inbounds float* %.317, i64 %50, !dbg !253
  tail call void @llvm.dbg.value(metadata !{float* %55}, i64 0, metadata !43), !dbg !253
  %56 = getelementptr inbounds float* %.3416, i64 %51, !dbg !253
  tail call void @llvm.dbg.value(metadata !{float* %56}, i64 0, metadata !45), !dbg !253
  %exitcond22 = icmp eq i32 %54, %n, !dbg !253
  br i1 %exitcond22, label %.loopexit, label %52, !dbg !253

.loopexit:                                        ; preds = %52, %28, %.lr.ph, %middle.block, %.preheader7, %.preheader5, %.preheader, %0
  ret void, !dbg !256
}

; Function Attrs: nounwind readonly uwtable
define double @sdot(i32 %n, float* nocapture readonly %sx, i32 %incx, float* nocapture readonly %sy, i32 %incy) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !53), !dbg !257
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !54), !dbg !258
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !55), !dbg !257
  tail call void @llvm.dbg.value(metadata !{float* %sy}, i64 0, metadata !56), !dbg !258
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !57), !dbg !257
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !59), !dbg !259
  %1 = icmp slt i32 %n, 1, !dbg !260
  br i1 %1, label %53, label %2, !dbg !260

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, %incy, !dbg !262
  br i1 %3, label %4, label %26, !dbg !262

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !264
  br i1 %5, label %.preheader, label %14, !dbg !264

.preheader:                                       ; preds = %4
  %6 = icmp sgt i32 %n, 0, !dbg !267
  br i1 %6, label %.lr.ph, label %53, !dbg !267

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %stemp.011 = phi float [ %10, %.lr.ph ], [ 0.000000e+00, %.preheader ]
  %i.010 = phi i32 [ %11, %.lr.ph ], [ 0, %.preheader ]
  %.019 = phi float* [ %13, %.lr.ph ], [ %sy, %.preheader ]
  %.028 = phi float* [ %12, %.lr.ph ], [ %sx, %.preheader ]
  %7 = load float* %.028, align 4, !dbg !270, !tbaa !146
  %8 = load float* %.019, align 4, !dbg !270, !tbaa !146
  %9 = fmul float %7, %8, !dbg !270
  %10 = fadd float %stemp.011, %9, !dbg !270
  tail call void @llvm.dbg.value(metadata !{float %10}, i64 0, metadata !59), !dbg !270
  %11 = add nsw i32 %i.010, 1, !dbg !267
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !58), !dbg !267
  %12 = getelementptr inbounds float* %.028, i64 1, !dbg !267
  tail call void @llvm.dbg.value(metadata !{float* %12}, i64 0, metadata !54), !dbg !267
  %13 = getelementptr inbounds float* %.019, i64 1, !dbg !267
  tail call void @llvm.dbg.value(metadata !{float* %13}, i64 0, metadata !56), !dbg !267
  %exitcond = icmp eq i32 %11, %n, !dbg !267
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !267

._crit_edge:                                      ; preds = %.lr.ph
  %phitmp27 = fpext float %10 to double, !dbg !267
  br label %53, !dbg !267

; <label>:14                                      ; preds = %4
  %15 = icmp sgt i32 %incx, 0, !dbg !271
  br i1 %15, label %.preheader6, label %26, !dbg !271

.preheader6:                                      ; preds = %14
  %16 = icmp sgt i32 %n, 0, !dbg !273
  br i1 %16, label %.lr.ph16, label %53, !dbg !273

.lr.ph16:                                         ; preds = %.preheader6
  %17 = sext i32 %incx to i64, !dbg !273
  br label %18, !dbg !273

; <label>:18                                      ; preds = %18, %.lr.ph16
  %stemp.115 = phi float [ 0.000000e+00, %.lr.ph16 ], [ %22, %18 ]
  %i.114 = phi i32 [ 0, %.lr.ph16 ], [ %23, %18 ]
  %.113 = phi float* [ %sy, %.lr.ph16 ], [ %25, %18 ]
  %.1312 = phi float* [ %sx, %.lr.ph16 ], [ %24, %18 ]
  %19 = load float* %.1312, align 4, !dbg !276, !tbaa !146
  %20 = load float* %.113, align 4, !dbg !276, !tbaa !146
  %21 = fmul float %19, %20, !dbg !276
  %22 = fadd float %stemp.115, %21, !dbg !276
  tail call void @llvm.dbg.value(metadata !{float %22}, i64 0, metadata !59), !dbg !276
  %23 = add nsw i32 %i.114, 1, !dbg !273
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !58), !dbg !273
  %24 = getelementptr inbounds float* %.1312, i64 %17, !dbg !273
  tail call void @llvm.dbg.value(metadata !{float* %24}, i64 0, metadata !54), !dbg !273
  %25 = getelementptr inbounds float* %.113, i64 %17, !dbg !273
  tail call void @llvm.dbg.value(metadata !{float* %25}, i64 0, metadata !56), !dbg !273
  %exitcond30 = icmp eq i32 %23, %n, !dbg !273
  br i1 %exitcond30, label %._crit_edge17, label %18, !dbg !273

._crit_edge17:                                    ; preds = %18
  %phitmp26 = fpext float %22 to double, !dbg !273
  br label %53, !dbg !273

; <label>:26                                      ; preds = %14, %2
  %27 = icmp slt i32 %incx, 0, !dbg !277
  br i1 %27, label %28, label %34, !dbg !277

; <label>:28                                      ; preds = %26
  %29 = sub i32 1, %n, !dbg !277
  %30 = mul nsw i32 %29, %incx, !dbg !277
  %31 = add nsw i32 %30, 1, !dbg !277
  %32 = sext i32 %31 to i64, !dbg !277
  %33 = getelementptr inbounds float* %sx, i64 %32, !dbg !277
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !54), !dbg !277
  br label %34, !dbg !277

; <label>:34                                      ; preds = %28, %26
  %.24 = phi float* [ %33, %28 ], [ %sx, %26 ]
  %35 = icmp slt i32 %incy, 0, !dbg !279
  br i1 %35, label %36, label %.preheader7, !dbg !279

; <label>:36                                      ; preds = %34
  %37 = sub i32 1, %n, !dbg !279
  %38 = mul nsw i32 %37, %incy, !dbg !279
  %39 = add nsw i32 %38, 1, !dbg !279
  %40 = sext i32 %39 to i64, !dbg !279
  %41 = getelementptr inbounds float* %sy, i64 %40, !dbg !279
  tail call void @llvm.dbg.value(metadata !{float* %41}, i64 0, metadata !56), !dbg !279
  br label %.preheader7, !dbg !279

.preheader7:                                      ; preds = %36, %34
  %.3.ph = phi float* [ %sy, %34 ], [ %41, %36 ]
  %42 = icmp sgt i32 %n, 0, !dbg !281
  br i1 %42, label %.lr.ph23, label %53, !dbg !281

.lr.ph23:                                         ; preds = %.preheader7
  %43 = sext i32 %incx to i64, !dbg !281
  %44 = sext i32 %incy to i64, !dbg !281
  br label %45, !dbg !281

; <label>:45                                      ; preds = %45, %.lr.ph23
  %stemp.222 = phi float [ 0.000000e+00, %.lr.ph23 ], [ %49, %45 ]
  %i.221 = phi i32 [ 0, %.lr.ph23 ], [ %50, %45 ]
  %.320 = phi float* [ %.3.ph, %.lr.ph23 ], [ %52, %45 ]
  %.3519 = phi float* [ %.24, %.lr.ph23 ], [ %51, %45 ]
  %46 = load float* %.3519, align 4, !dbg !283, !tbaa !146
  %47 = load float* %.320, align 4, !dbg !283, !tbaa !146
  %48 = fmul float %46, %47, !dbg !283
  %49 = fadd float %stemp.222, %48, !dbg !283
  tail call void @llvm.dbg.value(metadata !{float %49}, i64 0, metadata !59), !dbg !283
  %50 = add nsw i32 %i.221, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !58), !dbg !281
  %51 = getelementptr inbounds float* %.3519, i64 %43, !dbg !281
  tail call void @llvm.dbg.value(metadata !{float* %51}, i64 0, metadata !54), !dbg !281
  %52 = getelementptr inbounds float* %.320, i64 %44, !dbg !281
  tail call void @llvm.dbg.value(metadata !{float* %52}, i64 0, metadata !56), !dbg !281
  %exitcond31 = icmp eq i32 %50, %n, !dbg !281
  br i1 %exitcond31, label %._crit_edge24, label %45, !dbg !281

._crit_edge24:                                    ; preds = %45
  %phitmp = fpext float %49 to double, !dbg !281
  br label %53, !dbg !281

; <label>:53                                      ; preds = %.preheader7, %._crit_edge24, %.preheader6, %._crit_edge17, %.preheader, %._crit_edge, %0
  %.0 = phi double [ 0.000000e+00, %0 ], [ %phitmp27, %._crit_edge ], [ 0.000000e+00, %.preheader ], [ %phitmp26, %._crit_edge17 ], [ 0.000000e+00, %.preheader6 ], [ %phitmp, %._crit_edge24 ], [ 0.000000e+00, %.preheader7 ]
  ret double %.0, !dbg !284
}

; Function Attrs: nounwind uwtable
define double @snrm2(i32 %n, float* nocapture readonly %sx, i32 %incx) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !64), !dbg !285
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !65), !dbg !286
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !66), !dbg !285
  tail call void @llvm.dbg.value(metadata !287, i64 0, metadata !68), !dbg !288
  tail call void @llvm.dbg.value(metadata !289, i64 0, metadata !69), !dbg !290
  %1 = icmp slt i32 %n, 1, !dbg !291
  %2 = icmp slt i32 %incx, 1, !dbg !291
  %or.cond = or i1 %1, %2, !dbg !291
  br i1 %or.cond, label %.critedge.thread3, label %3, !dbg !291

; <label>:3                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !293, i64 0, metadata !294), !dbg !296
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !294), !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301), !dbg !302
  tail call void @llvm.dbg.value(metadata !303, i64 0, metadata !70), !dbg !295
  tail call void @llvm.dbg.value(metadata !304, i64 0, metadata !71), !dbg !305
  %4 = sitofp i32 %n to double, !dbg !306
  %5 = fdiv double 1.000000e+19, %4, !dbg !306
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !72), !dbg !306
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !67), !dbg !307
  %6 = icmp sgt i32 %n, 0, !dbg !308
  br i1 %6, label %.lr.ph73, label %.critedge.thread3, !dbg !308

.lr.ph73:                                         ; preds = %3
  %7 = sext i32 %incx to i64, !dbg !309
  br label %8, !dbg !308

; <label>:8                                       ; preds = %.lr.ph73, %11
  %.0271 = phi float* [ %sx, %.lr.ph73 ], [ %13, %11 ]
  %i.070 = phi i32 [ 0, %.lr.ph73 ], [ %12, %11 ]
  %9 = load float* %.0271, align 4, !dbg !308, !tbaa !146
  %10 = fcmp oeq float %9, 0.000000e+00, !dbg !308
  br i1 %10, label %11, label %.critedge.thread

; <label>:11                                      ; preds = %8
  %12 = add nsw i32 %i.070, 1, !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !67), !dbg !311
  %13 = getelementptr inbounds float* %.0271, i64 %7, !dbg !309
  tail call void @llvm.dbg.value(metadata !{float* %13}, i64 0, metadata !65), !dbg !309
  %14 = icmp slt i32 %12, %n, !dbg !308
  br i1 %14, label %8, label %.critedge.thread3, !dbg !308

.critedge.thread:                                 ; preds = %8, %55
  %15 = phi float [ %47, %55 ], [ %9, %8 ]
  %sum.0 = phi double [ %58, %55 ], [ 0.000000e+00, %8 ]
  %i.1 = phi i32 [ %i.353, %55 ], [ %i.070, %8 ]
  %.1 = phi float* [ %.352, %55 ], [ %.0271, %8 ]
  %16 = fcmp ogt float %15, 0.000000e+00, !dbg !312
  br i1 %16, label %19, label %17, !dbg !312

; <label>:17                                      ; preds = %.critedge.thread
  %18 = fsub float -0.000000e+00, %15, !dbg !312
  br label %19, !dbg !312

; <label>:19                                      ; preds = %.critedge.thread, %17
  %20 = phi float [ %18, %17 ], [ %15, %.critedge.thread ], !dbg !312
  %21 = fpext float %20 to double, !dbg !312
  %22 = fcmp ogt double %21, 0x3BFB084B92366CC2, !dbg !312
  br i1 %22, label %.preheader, label %39, !dbg !312

.preheader:                                       ; preds = %19
  %23 = icmp slt i32 %i.1, %n, !dbg !314
  br i1 %23, label %.lr.ph46, label %._crit_edge47, !dbg !314

.lr.ph46:                                         ; preds = %.preheader, %._crit_edge116
  %.pr4 = phi float [ %.pre, %._crit_edge116 ], [ %15, %.preheader ]
  %.245 = phi float* [ %36, %._crit_edge116 ], [ %.1, %.preheader ]
  %i.244 = phi i32 [ %35, %._crit_edge116 ], [ %i.1, %.preheader ]
  %sum.143 = phi double [ %34, %._crit_edge116 ], [ %sum.0, %.preheader ]
  %24 = fcmp ogt float %.pr4, 0.000000e+00, !dbg !317
  br i1 %24, label %27, label %25, !dbg !317

; <label>:25                                      ; preds = %.lr.ph46
  %26 = fsub float -0.000000e+00, %.pr4, !dbg !317
  br label %27, !dbg !317

; <label>:27                                      ; preds = %.lr.ph46, %25
  %28 = phi float [ %.pr4, %.lr.ph46 ], [ %26, %25 ], !dbg !317
  %29 = fpext float %28 to double, !dbg !317
  %30 = fcmp ogt double %29, %5, !dbg !317
  br i1 %30, label %83, label %31, !dbg !317

; <label>:31                                      ; preds = %27
  %32 = fmul float %.pr4, %.pr4, !dbg !320
  %33 = fpext float %32 to double, !dbg !320
  %34 = fadd double %sum.143, %33, !dbg !320
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !69), !dbg !320
  %35 = add nsw i32 %i.244, 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !67), !dbg !314
  %36 = getelementptr inbounds float* %.245, i64 %7, !dbg !314
  tail call void @llvm.dbg.value(metadata !{float* %36}, i64 0, metadata !65), !dbg !314
  %37 = icmp slt i32 %35, %n, !dbg !314
  br i1 %37, label %._crit_edge116, label %._crit_edge47, !dbg !314

._crit_edge116:                                   ; preds = %31
  %.pre = load float* %36, align 4, !dbg !317, !tbaa !146
  br label %.lr.ph46, !dbg !314

._crit_edge47:                                    ; preds = %31, %.preheader
  %sum.1.lcssa = phi double [ %sum.0, %.preheader ], [ %34, %31 ]
  %38 = tail call double @sqrt(double %sum.1.lcssa) #5, !dbg !321
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !69), !dbg !321
  br label %.critedge.thread3, !dbg !322

; <label>:39                                      ; preds = %19
  br i1 %16, label %42, label %40, !dbg !323

; <label>:40                                      ; preds = %39
  %41 = fsub float -0.000000e+00, %15, !dbg !323
  br label %42, !dbg !323

; <label>:42                                      ; preds = %39, %40
  %43 = phi float [ %41, %40 ], [ %15, %39 ], !dbg !323
  tail call void @llvm.dbg.value(metadata !{float %43}, i64 0, metadata !73), !dbg !323
  %44 = fadd double %sum.0, 1.000000e+00, !dbg !325
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !69), !dbg !325
  %i.35061 = add nsw i32 %i.1, 1, !dbg !326
  %45 = icmp slt i32 %i.35061, %n, !dbg !327
  br i1 %45, label %.lr.ph54, label %.outer6._crit_edge, !dbg !327

.lr.ph54:                                         ; preds = %42, %.outer6.backedge
  %i.35065 = phi i32 [ %i.350, %.outer6.backedge ], [ %i.35061, %42 ]
  %.1.pn = phi float* [ %.352, %.outer6.backedge ], [ %.1, %42 ]
  %xmax.0.ph63 = phi float [ %xmax.0.ph.be, %.outer6.backedge ], [ %43, %42 ]
  %sum.2.ph62 = phi double [ %70, %.outer6.backedge ], [ %44, %42 ]
  br label %46, !dbg !327

; <label>:46                                      ; preds = %.lr.ph54, %74
  %i.353 = phi i32 [ %i.35065, %.lr.ph54 ], [ %i.3, %74 ]
  %.1.pn.pn = phi float* [ %.1.pn, %.lr.ph54 ], [ %.352, %74 ]
  %sum.251 = phi double [ %sum.2.ph62, %.lr.ph54 ], [ %78, %74 ]
  %.352 = getelementptr inbounds float* %.1.pn.pn, i64 %7, !dbg !329
  %47 = load float* %.352, align 4, !dbg !330, !tbaa !146
  %48 = fcmp ogt float %47, 0.000000e+00, !dbg !330
  br i1 %48, label %51, label %49, !dbg !330

; <label>:49                                      ; preds = %46
  %50 = fsub float -0.000000e+00, %47, !dbg !330
  br label %51, !dbg !330

; <label>:51                                      ; preds = %46, %49
  %52 = phi float [ %50, %49 ], [ %47, %46 ], !dbg !330
  %53 = fpext float %52 to double, !dbg !330
  %54 = fcmp ogt double %53, 0x3BFB084B92366CC2, !dbg !330
  br i1 %54, label %55, label %59, !dbg !330

; <label>:55                                      ; preds = %51
  %56 = fpext float %xmax.0.ph63 to double, !dbg !333
  %57 = fmul double %sum.251, %56, !dbg !333
  %58 = fmul double %56, %57, !dbg !333
  tail call void @llvm.dbg.value(metadata !{double %58}, i64 0, metadata !69), !dbg !333
  br label %.critedge.thread, !dbg !335

; <label>:59                                      ; preds = %51
  br i1 %48, label %62, label %60, !dbg !336

; <label>:60                                      ; preds = %59
  %61 = fsub float -0.000000e+00, %47, !dbg !336
  br label %62, !dbg !336

; <label>:62                                      ; preds = %59, %60
  %63 = phi float [ %47, %59 ], [ %61, %60 ], !dbg !336
  %64 = fcmp ogt float %63, %xmax.0.ph63, !dbg !336
  br i1 %64, label %65, label %74, !dbg !336

; <label>:65                                      ; preds = %62
  %66 = fdiv float %xmax.0.ph63, %47, !dbg !338
  %67 = fpext float %66 to double, !dbg !338
  %68 = fmul double %sum.251, %67, !dbg !338
  %69 = fmul double %67, %68, !dbg !338
  %70 = fadd double %69, 1.000000e+00, !dbg !338
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !69), !dbg !338
  br i1 %48, label %.outer6.backedge, label %72, !dbg !340

.outer6.backedge:                                 ; preds = %65, %72
  %xmax.0.ph.be = phi float [ %47, %65 ], [ %73, %72 ]
  %i.350 = add nsw i32 %i.353, 1, !dbg !326
  %71 = icmp slt i32 %i.350, %n, !dbg !327
  br i1 %71, label %.lr.ph54, label %.outer6._crit_edge, !dbg !327

; <label>:72                                      ; preds = %65
  %73 = fsub float -0.000000e+00, %47, !dbg !340
  br label %.outer6.backedge, !dbg !340

; <label>:74                                      ; preds = %62
  %75 = fdiv float %47, %xmax.0.ph63, !dbg !341
  %76 = fmul float %75, %75, !dbg !341
  %77 = fpext float %76 to double, !dbg !341
  %78 = fadd double %sum.251, %77, !dbg !341
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !69), !dbg !341
  %i.3 = add nsw i32 %i.353, 1, !dbg !326
  %79 = icmp slt i32 %i.3, %n, !dbg !327
  br i1 %79, label %46, label %.outer6._crit_edge, !dbg !327

.outer6._crit_edge:                               ; preds = %42, %.outer6.backedge, %74
  %xmax.0.ph.lcssa21 = phi float [ %xmax.0.ph63, %74 ], [ %xmax.0.ph.be, %.outer6.backedge ], [ %43, %42 ]
  %sum.2.lcssa = phi double [ %78, %74 ], [ %70, %.outer6.backedge ], [ %44, %42 ]
  %80 = fpext float %xmax.0.ph.lcssa21 to double, !dbg !342
  %81 = tail call double @sqrt(double %sum.2.lcssa) #5, !dbg !342
  %82 = fmul double %80, %81, !dbg !342
  br label %.critedge.thread3, !dbg !342

; <label>:83                                      ; preds = %27
  %84 = fpext float %.pr4 to double, !dbg !343
  %85 = fdiv double %sum.143, %84, !dbg !343
  %86 = fdiv double %85, %84, !dbg !343
  %87 = fadd double %86, 1.000000e+00, !dbg !343
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !69), !dbg !343
  br i1 %24, label %90, label %88, !dbg !344

; <label>:88                                      ; preds = %83
  %89 = fsub float -0.000000e+00, %.pr4, !dbg !344
  br label %90, !dbg !344

; <label>:90                                      ; preds = %83, %88
  %91 = phi float [ %89, %88 ], [ %.pr4, %83 ], !dbg !344
  tail call void @llvm.dbg.value(metadata !{float %91}, i64 0, metadata !73), !dbg !344
  %i.42836 = add nsw i32 %i.244, 1, !dbg !345
  %92 = icmp slt i32 %i.42836, %n, !dbg !346
  br i1 %92, label %.lr.ph, label %.outer._crit_edge, !dbg !346

.lr.ph:                                           ; preds = %90, %.outer.backedge
  %i.42840 = phi i32 [ %i.428, %.outer.backedge ], [ %i.42836, %90 ]
  %.245.pn = phi float* [ %.430, %.outer.backedge ], [ %.245, %90 ]
  %xmax.2.ph38 = phi float [ %xmax.2.ph.be, %.outer.backedge ], [ %91, %90 ]
  %sum.4.ph37 = phi double [ %106, %.outer.backedge ], [ %87, %90 ]
  br label %93, !dbg !346

; <label>:93                                      ; preds = %.lr.ph, %110
  %i.431 = phi i32 [ %i.42840, %.lr.ph ], [ %i.4, %110 ]
  %.245.pn.pn = phi float* [ %.245.pn, %.lr.ph ], [ %.430, %110 ]
  %sum.429 = phi double [ %sum.4.ph37, %.lr.ph ], [ %114, %110 ]
  %.430 = getelementptr inbounds float* %.245.pn.pn, i64 %7, !dbg !348
  %94 = load float* %.430, align 4, !dbg !349, !tbaa !146
  %95 = fcmp ogt float %94, 0.000000e+00, !dbg !349
  br i1 %95, label %98, label %96, !dbg !349

; <label>:96                                      ; preds = %93
  %97 = fsub float -0.000000e+00, %94, !dbg !349
  br label %98, !dbg !349

; <label>:98                                      ; preds = %93, %96
  %99 = phi float [ %94, %93 ], [ %97, %96 ], !dbg !349
  %100 = fcmp ogt float %99, %xmax.2.ph38, !dbg !349
  br i1 %100, label %101, label %110, !dbg !349

; <label>:101                                     ; preds = %98
  %102 = fdiv float %xmax.2.ph38, %94, !dbg !352
  %103 = fpext float %102 to double, !dbg !352
  %104 = fmul double %sum.429, %103, !dbg !352
  %105 = fmul double %103, %104, !dbg !352
  %106 = fadd double %105, 1.000000e+00, !dbg !352
  tail call void @llvm.dbg.value(metadata !{double %106}, i64 0, metadata !69), !dbg !352
  br i1 %95, label %.outer.backedge, label %108, !dbg !354

.outer.backedge:                                  ; preds = %101, %108
  %xmax.2.ph.be = phi float [ %94, %101 ], [ %109, %108 ]
  %i.428 = add nsw i32 %i.431, 1, !dbg !345
  %107 = icmp slt i32 %i.428, %n, !dbg !346
  br i1 %107, label %.lr.ph, label %.outer._crit_edge, !dbg !346

; <label>:108                                     ; preds = %101
  %109 = fsub float -0.000000e+00, %94, !dbg !354
  br label %.outer.backedge, !dbg !354

; <label>:110                                     ; preds = %98
  %111 = fdiv float %94, %xmax.2.ph38, !dbg !355
  %112 = fmul float %111, %111, !dbg !355
  %113 = fpext float %112 to double, !dbg !355
  %114 = fadd double %sum.429, %113, !dbg !355
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !69), !dbg !355
  %i.4 = add nsw i32 %i.431, 1, !dbg !345
  %115 = icmp slt i32 %i.4, %n, !dbg !346
  br i1 %115, label %93, label %.outer._crit_edge, !dbg !346

.outer._crit_edge:                                ; preds = %.outer.backedge, %110, %90
  %xmax.2.ph.lcssa = phi float [ %91, %90 ], [ %xmax.2.ph38, %110 ], [ %xmax.2.ph.be, %.outer.backedge ]
  %sum.4.lcssa = phi double [ %87, %90 ], [ %114, %110 ], [ %106, %.outer.backedge ]
  %116 = fpext float %xmax.2.ph.lcssa to double, !dbg !356
  %117 = tail call double @sqrt(double %sum.4.lcssa) #5, !dbg !356
  %118 = fmul double %116, %117, !dbg !356
  br label %.critedge.thread3, !dbg !356

.critedge.thread3:                                ; preds = %11, %3, %0, %.outer._crit_edge, %.outer6._crit_edge, %._crit_edge47
  %.0 = phi double [ %118, %.outer._crit_edge ], [ %38, %._crit_edge47 ], [ %82, %.outer6._crit_edge ], [ 0.000000e+00, %0 ], [ 0.000000e+00, %3 ], [ 0.000000e+00, %11 ]
  ret double %.0, !dbg !357
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind readnone uwtable
define double @r1mach() #3 {
  tail call void @llvm.dbg.value(metadata !293, i64 0, metadata !78), !dbg !358
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  tail call void @llvm.dbg.value(metadata !297, i64 0, metadata !78), !dbg !359
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !79), !dbg !360
  ret double 0x3E80000000000000, !dbg !361
}

; Function Attrs: nounwind readnone uwtable
define i32 @min0(i32 %n, i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %o, i32 %p) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !84), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !85), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !86), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !87), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %d}, i64 0, metadata !88), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %e}, i64 0, metadata !89), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %f}, i64 0, metadata !90), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %g}, i64 0, metadata !91), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %h}, i64 0, metadata !92), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !93), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !94), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !95), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !96), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %m}, i64 0, metadata !97), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %o}, i64 0, metadata !98), !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32 %p}, i64 0, metadata !99), !dbg !362
  %n.off = add i32 %n, -1, !dbg !363
  %1 = icmp ugt i32 %n.off, 14, !dbg !363
  br i1 %1, label %45, label %2, !dbg !363

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !100), !dbg !365
  %3 = icmp eq i32 %n, 1, !dbg !366
  br i1 %3, label %45, label %4, !dbg !366

; <label>:4                                       ; preds = %2
  %5 = icmp sgt i32 %a, %b, !dbg !368
  tail call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !100), !dbg !368
  %b.a = select i1 %5, i32 %b, i32 %a, !dbg !368
  %6 = icmp eq i32 %n, 2, !dbg !370
  br i1 %6, label %45, label %7, !dbg !370

; <label>:7                                       ; preds = %4
  %8 = icmp sgt i32 %b.a, %c, !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !100), !dbg !372
  %c.b.a = select i1 %8, i32 %c, i32 %b.a, !dbg !372
  %9 = icmp eq i32 %n, 3, !dbg !374
  br i1 %9, label %45, label %10, !dbg !374

; <label>:10                                      ; preds = %7
  %11 = icmp sgt i32 %c.b.a, %d, !dbg !376
  tail call void @llvm.dbg.value(metadata !{i32 %d}, i64 0, metadata !100), !dbg !376
  %d.c.b.a = select i1 %11, i32 %d, i32 %c.b.a, !dbg !376
  %12 = icmp eq i32 %n, 4, !dbg !378
  br i1 %12, label %45, label %13, !dbg !378

; <label>:13                                      ; preds = %10
  %14 = icmp sgt i32 %d.c.b.a, %e, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i32 %e}, i64 0, metadata !100), !dbg !380
  %e.d.c.b.a = select i1 %14, i32 %e, i32 %d.c.b.a, !dbg !380
  %15 = icmp eq i32 %n, 5, !dbg !382
  br i1 %15, label %45, label %16, !dbg !382

; <label>:16                                      ; preds = %13
  %17 = icmp sgt i32 %e.d.c.b.a, %f, !dbg !384
  tail call void @llvm.dbg.value(metadata !{i32 %f}, i64 0, metadata !100), !dbg !384
  %f.e.d.c.b.a = select i1 %17, i32 %f, i32 %e.d.c.b.a, !dbg !384
  %18 = icmp eq i32 %n, 6, !dbg !386
  br i1 %18, label %45, label %19, !dbg !386

; <label>:19                                      ; preds = %16
  %20 = icmp sgt i32 %f.e.d.c.b.a, %g, !dbg !388
  tail call void @llvm.dbg.value(metadata !{i32 %g}, i64 0, metadata !100), !dbg !388
  %g.f.e.d.c.b.a = select i1 %20, i32 %g, i32 %f.e.d.c.b.a, !dbg !388
  %21 = icmp eq i32 %n, 7, !dbg !390
  br i1 %21, label %45, label %22, !dbg !390

; <label>:22                                      ; preds = %19
  %23 = icmp sgt i32 %g.f.e.d.c.b.a, %h, !dbg !392
  tail call void @llvm.dbg.value(metadata !{i32 %h}, i64 0, metadata !100), !dbg !392
  %h.g.f.e.d.c.b.a = select i1 %23, i32 %h, i32 %g.f.e.d.c.b.a, !dbg !392
  %24 = icmp eq i32 %n, 8, !dbg !394
  br i1 %24, label %45, label %25, !dbg !394

; <label>:25                                      ; preds = %22
  %26 = icmp sgt i32 %h.g.f.e.d.c.b.a, %i, !dbg !396
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !100), !dbg !396
  %i.h.g.f.e.d.c.b.a = select i1 %26, i32 %i, i32 %h.g.f.e.d.c.b.a, !dbg !396
  %27 = icmp eq i32 %n, 9, !dbg !398
  br i1 %27, label %45, label %28, !dbg !398

; <label>:28                                      ; preds = %25
  %29 = icmp sgt i32 %i.h.g.f.e.d.c.b.a, %j, !dbg !400
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !100), !dbg !400
  %j.i.h.g.f.e.d.c.b.a = select i1 %29, i32 %j, i32 %i.h.g.f.e.d.c.b.a, !dbg !400
  %30 = icmp eq i32 %n, 10, !dbg !402
  br i1 %30, label %45, label %31, !dbg !402

; <label>:31                                      ; preds = %28
  %32 = icmp sgt i32 %j.i.h.g.f.e.d.c.b.a, %k, !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !100), !dbg !404
  %k.j.i.h.g.f.e.d.c.b.a = select i1 %32, i32 %k, i32 %j.i.h.g.f.e.d.c.b.a, !dbg !404
  %33 = icmp eq i32 %n, 11, !dbg !406
  br i1 %33, label %45, label %34, !dbg !406

; <label>:34                                      ; preds = %31
  %35 = icmp sgt i32 %k.j.i.h.g.f.e.d.c.b.a, %l, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !100), !dbg !408
  %l.k.j.i.h.g.f.e.d.c.b.a = select i1 %35, i32 %l, i32 %k.j.i.h.g.f.e.d.c.b.a, !dbg !408
  %36 = icmp eq i32 %n, 12, !dbg !410
  br i1 %36, label %45, label %37, !dbg !410

; <label>:37                                      ; preds = %34
  %38 = icmp sgt i32 %l.k.j.i.h.g.f.e.d.c.b.a, %m, !dbg !412
  tail call void @llvm.dbg.value(metadata !{i32 %m}, i64 0, metadata !100), !dbg !412
  %m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %38, i32 %m, i32 %l.k.j.i.h.g.f.e.d.c.b.a, !dbg !412
  %39 = icmp eq i32 %n, 13, !dbg !414
  br i1 %39, label %45, label %40, !dbg !414

; <label>:40                                      ; preds = %37
  %41 = icmp sgt i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, %o, !dbg !416
  tail call void @llvm.dbg.value(metadata !{i32 %o}, i64 0, metadata !100), !dbg !416
  %o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %41, i32 %o, i32 %m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !416
  %42 = icmp eq i32 %n, 14, !dbg !418
  br i1 %42, label %45, label %43, !dbg !418

; <label>:43                                      ; preds = %40
  %44 = icmp sgt i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %p, !dbg !420
  tail call void @llvm.dbg.value(metadata !{i32 %p}, i64 0, metadata !100), !dbg !420
  %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a = select i1 %44, i32 %p, i32 %o.m.l.k.j.i.h.g.f.e.d.c.b.a, !dbg !420
  br label %45, !dbg !422

; <label>:45                                      ; preds = %40, %37, %34, %31, %28, %25, %22, %19, %16, %13, %10, %7, %4, %2, %0, %43
  %.0 = phi i32 [ %p.o.m.l.k.j.i.h.g.f.e.d.c.b.a, %43 ], [ -1, %0 ], [ %a, %2 ], [ %b.a, %4 ], [ %c.b.a, %7 ], [ %d.c.b.a, %10 ], [ %e.d.c.b.a, %13 ], [ %f.e.d.c.b.a, %16 ], [ %g.f.e.d.c.b.a, %19 ], [ %h.g.f.e.d.c.b.a, %22 ], [ %i.h.g.f.e.d.c.b.a, %25 ], [ %j.i.h.g.f.e.d.c.b.a, %28 ], [ %k.j.i.h.g.f.e.d.c.b.a, %31 ], [ %l.k.j.i.h.g.f.e.d.c.b.a, %34 ], [ %m.l.k.j.i.h.g.f.e.d.c.b.a, %37 ], [ %o.m.l.k.j.i.h.g.f.e.d.c.b.a, %40 ]
  ret i32 %.0, !dbg !423
}

; Function Attrs: nounwind uwtable
define i32 @sscal(i32 %n, double, float* nocapture %sx, i32 %incx) #1 {
  %sa = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !105), !dbg !424
  tail call void @llvm.dbg.value(metadata !{float %sa}, i64 0, metadata !106), !dbg !425
  tail call void @llvm.dbg.value(metadata !{float* %sx}, i64 0, metadata !107), !dbg !425
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !108), !dbg !424
  %2 = icmp slt i32 %n, 1, !dbg !426
  br i1 %2, label %.loopexit, label %3, !dbg !426

; <label>:3                                       ; preds = %1
  %4 = icmp eq i32 %incx, 1, !dbg !428
  br i1 %4, label %.preheader, label %18, !dbg !428

.preheader:                                       ; preds = %3
  %5 = icmp sgt i32 %n, 0, !dbg !430
  br i1 %5, label %.lr.ph.preheader, label %.loopexit, !dbg !430

.lr.ph.preheader:                                 ; preds = %.preheader
  %6 = add i32 %n, -1, !dbg !432
  %7 = zext i32 %6 to i64
  %8 = add i64 %7, 1, !dbg !432
  %end.idx = add i64 %7, 1, !dbg !430
  %n.vec = and i64 %8, 8589934584, !dbg !430
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !430
  %9 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %sx, i64 %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %broadcast.splatinsert35 = insertelement <4 x float> undef, float %sa, i32 0
  %broadcast.splat36 = shufflevector <4 x float> %broadcast.splatinsert35, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !430
  %next.gep = getelementptr float* %sx, i64 %index
  %10 = bitcast float* %next.gep to <4 x float>*, !dbg !432
  %wide.load = load <4 x float>* %10, align 4, !dbg !432
  %next.gep.sum46 = or i64 %index, 4, !dbg !432
  %11 = getelementptr float* %sx, i64 %next.gep.sum46, !dbg !432
  %12 = bitcast float* %11 to <4 x float>*, !dbg !432
  %wide.load34 = load <4 x float>* %12, align 4, !dbg !432
  %13 = fmul <4 x float> %broadcast.splat36, %wide.load, !dbg !432
  %14 = fmul <4 x float> %broadcast.splat36, %wide.load34, !dbg !432
  %15 = bitcast float* %next.gep to <4 x float>*, !dbg !432
  store <4 x float> %13, <4 x float>* %15, align 4, !dbg !432
  %16 = bitcast float* %11 to <4 x float>*, !dbg !432
  store <4 x float> %14, <4 x float>* %16, align 4, !dbg !432
  %index.next = add i64 %index, 8, !dbg !430
  %17 = icmp eq i64 %index.next, %n.vec, !dbg !430
  br i1 %17, label %middle.block, label %vector.body, !dbg !430, !llvm.loop !433

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph.preheader ], [ %9, %vector.body ]
  %resume.val11 = phi float* [ %sx, %.lr.ph.preheader ], [ %ptr.ind.end, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

; <label>:18                                      ; preds = %3
  %19 = icmp slt i32 %incx, 0, !dbg !434
  br i1 %19, label %20, label %.preheader2, !dbg !434

; <label>:20                                      ; preds = %18
  %21 = sub i32 1, %n, !dbg !434
  %22 = mul nsw i32 %21, %incx, !dbg !434
  %23 = sext i32 %22 to i64, !dbg !434
  %24 = getelementptr inbounds float* %sx, i64 %23, !dbg !434
  tail call void @llvm.dbg.value(metadata !{float* %24}, i64 0, metadata !107), !dbg !434
  br label %.preheader2, !dbg !434

.preheader2:                                      ; preds = %20, %18
  %.1.ph = phi float* [ %sx, %18 ], [ %24, %20 ]
  %25 = icmp sgt i32 %n, 0, !dbg !437
  br i1 %25, label %.lr.ph8, label %.loopexit, !dbg !437

.lr.ph8:                                          ; preds = %.preheader2
  %26 = sext i32 %incx to i64, !dbg !437
  br label %27, !dbg !437

; <label>:27                                      ; preds = %27, %.lr.ph8
  %i.07 = phi i32 [ 0, %.lr.ph8 ], [ %30, %27 ]
  %.16 = phi float* [ %.1.ph, %.lr.ph8 ], [ %31, %27 ]
  %28 = load float* %.16, align 4, !dbg !439, !tbaa !146
  %29 = fmul float %sa, %28, !dbg !439
  store float %29, float* %.16, align 4, !dbg !439, !tbaa !146
  %30 = add nsw i32 %i.07, 1, !dbg !437
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !109), !dbg !437
  %31 = getelementptr inbounds float* %.16, i64 %26, !dbg !437
  tail call void @llvm.dbg.value(metadata !{float* %31}, i64 0, metadata !107), !dbg !437
  %exitcond9 = icmp eq i32 %30, %n, !dbg !437
  br i1 %exitcond9, label %.loopexit, label %27, !dbg !437

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %i.15 = phi i32 [ %34, %.lr.ph ], [ %trunc.resume.val, %middle.block ]
  %.24 = phi float* [ %35, %.lr.ph ], [ %resume.val11, %middle.block ]
  %32 = load float* %.24, align 4, !dbg !432, !tbaa !146
  %33 = fmul float %sa, %32, !dbg !432
  store float %33, float* %.24, align 4, !dbg !432, !tbaa !146
  %34 = add nsw i32 %i.15, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !109), !dbg !430
  %35 = getelementptr inbounds float* %.24, i64 1, !dbg !430
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !107), !dbg !430
  %exitcond = icmp eq i32 %34, %n, !dbg !430
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !430, !llvm.loop !440

.loopexit:                                        ; preds = %27, %.lr.ph, %middle.block, %.preheader2, %.preheader, %1
  %.0 = phi i32 [ 1, %1 ], [ 0, %.preheader ], [ 0, %.preheader2 ], [ 0, %middle.block ], [ 0, %.lr.ph ], [ 0, %27 ]
  ret i32 %.0, !dbg !441
}

; Function Attrs: nounwind uwtable
define void @vexopy(i32 %n, float* nocapture %v, float* nocapture readonly %x, float* nocapture readonly %y, i32 %itype) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !442
  tail call void @llvm.dbg.value(metadata !{float* %v}, i64 0, metadata !115), !dbg !443
  tail call void @llvm.dbg.value(metadata !{float* %x}, i64 0, metadata !116), !dbg !443
  tail call void @llvm.dbg.value(metadata !{float* %y}, i64 0, metadata !117), !dbg !443
  tail call void @llvm.dbg.value(metadata !{i32 %itype}, i64 0, metadata !118), !dbg !442
  %1 = icmp slt i32 %n, 1, !dbg !444
  br i1 %1, label %.loopexit, label %2, !dbg !444

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %itype, 1, !dbg !446
  tail call void @llvm.dbg.value(metadata !135, i64 0, metadata !119), !dbg !448
  %4 = icmp sgt i32 %n, 0, !dbg !448
  br i1 %3, label %.preheader, label %.preheader5, !dbg !446

.preheader5:                                      ; preds = %2
  br i1 %4, label %.lr.ph15.preheader, label %.loopexit, !dbg !450

.lr.ph15.preheader:                               ; preds = %.preheader5
  %5 = add i32 %n, -1, !dbg !452
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !452
  %end.idx = add i64 %6, 1, !dbg !450
  %n.vec = and i64 %7, 8589934588, !dbg !450
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !450
  %8 = add i32 %n, -1
  %9 = zext i32 %8 to i64
  %scevgep = getelementptr float* %v, i64 %9
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph15.preheader
  %scevgep24 = getelementptr float* %y, i64 %9
  %scevgep21 = getelementptr float* %x, i64 %9
  %bound127 = icmp uge float* %scevgep, %y
  %bound026 = icmp uge float* %scevgep24, %v
  %bound1 = icmp uge float* %scevgep, %x
  %bound0 = icmp uge float* %scevgep21, %v
  %found.conflict28 = and i1 %bound026, %bound127
  %found.conflict = and i1 %bound0, %bound1
  %conflict.rdx = or i1 %found.conflict, %found.conflict28
  %10 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %v, i64 %n.vec
  %ptr.ind.end31 = getelementptr float* %y, i64 %n.vec
  %ptr.ind.end33 = getelementptr float* %x, i64 %n.vec
  br i1 %conflict.rdx, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ], !dbg !450
  %next.gep = getelementptr float* %v, i64 %index
  %next.gep45 = getelementptr float* %y, i64 %index
  %next.gep58 = getelementptr float* %x, i64 %index
  %11 = bitcast float* %next.gep58 to <4 x float>*, !dbg !452
  %wide.load = load <4 x float>* %11, align 4, !dbg !452
  %12 = bitcast float* %next.gep45 to <4 x float>*, !dbg !452
  %wide.load69 = load <4 x float>* %12, align 4, !dbg !452
  %13 = fsub <4 x float> %wide.load, %wide.load69, !dbg !452
  %14 = bitcast float* %next.gep to <4 x float>*, !dbg !452
  store <4 x float> %13, <4 x float>* %14, align 4, !dbg !452
  %index.next = add i64 %index, 4, !dbg !450
  %15 = icmp eq i64 %index.next, %n.vec, !dbg !450
  br i1 %15, label %middle.block, label %vector.body, !dbg !450, !llvm.loop !453

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph15.preheader
  %resume.val = phi i64 [ 0, %.lr.ph15.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph15.preheader ], [ 0, %vector.memcheck ], [ %10, %vector.body ]
  %resume.val29 = phi float* [ %v, %.lr.ph15.preheader ], [ %v, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val30 = phi float* [ %y, %.lr.ph15.preheader ], [ %y, %vector.memcheck ], [ %ptr.ind.end31, %vector.body ]
  %resume.val32 = phi float* [ %x, %.lr.ph15.preheader ], [ %x, %vector.memcheck ], [ %ptr.ind.end33, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph15

.preheader:                                       ; preds = %2
  br i1 %4, label %.lr.ph.preheader, label %.loopexit, !dbg !448

.lr.ph.preheader:                                 ; preds = %.preheader
  %16 = add i32 %n, -1, !dbg !454
  %17 = zext i32 %16 to i64
  %18 = add i64 %17, 1, !dbg !454
  %end.idx77 = add i64 %17, 1, !dbg !448
  %n.vec79 = and i64 %18, 8589934588, !dbg !448
  %cmp.zero81 = icmp eq i64 %n.vec79, 0, !dbg !448
  %19 = add i32 %n, -1
  %20 = zext i32 %19 to i64
  %scevgep82 = getelementptr float* %v, i64 %20
  br i1 %cmp.zero81, label %middle.block74, label %vector.memcheck96

vector.memcheck96:                                ; preds = %.lr.ph.preheader
  %scevgep86 = getelementptr float* %y, i64 %20
  %scevgep84 = getelementptr float* %x, i64 %20
  %bound192 = icmp uge float* %scevgep82, %y
  %bound091 = icmp uge float* %scevgep86, %v
  %bound189 = icmp uge float* %scevgep82, %x
  %bound088 = icmp uge float* %scevgep84, %v
  %found.conflict93 = and i1 %bound091, %bound192
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx94 = or i1 %found.conflict90, %found.conflict93
  %21 = trunc i64 %n.vec79 to i32
  %ptr.ind.end100 = getelementptr float* %v, i64 %n.vec79
  %ptr.ind.end102 = getelementptr float* %y, i64 %n.vec79
  %ptr.ind.end104 = getelementptr float* %x, i64 %n.vec79
  br i1 %conflict.rdx94, label %middle.block74, label %vector.body73

vector.body73:                                    ; preds = %vector.memcheck96, %vector.body73
  %index76 = phi i64 [ %index.next106, %vector.body73 ], [ 0, %vector.memcheck96 ], !dbg !448
  %next.gep112 = getelementptr float* %v, i64 %index76
  %next.gep125 = getelementptr float* %y, i64 %index76
  %next.gep138 = getelementptr float* %x, i64 %index76
  %22 = bitcast float* %next.gep138 to <4 x float>*, !dbg !454
  %wide.load149 = load <4 x float>* %22, align 4, !dbg !454
  %23 = bitcast float* %next.gep125 to <4 x float>*, !dbg !454
  %wide.load150 = load <4 x float>* %23, align 4, !dbg !454
  %24 = fadd <4 x float> %wide.load149, %wide.load150, !dbg !454
  %25 = bitcast float* %next.gep112 to <4 x float>*, !dbg !454
  store <4 x float> %24, <4 x float>* %25, align 4, !dbg !454
  %index.next106 = add i64 %index76, 4, !dbg !448
  %26 = icmp eq i64 %index.next106, %n.vec79, !dbg !448
  br i1 %26, label %middle.block74, label %vector.body73, !dbg !448, !llvm.loop !455

middle.block74:                                   ; preds = %vector.body73, %vector.memcheck96, %.lr.ph.preheader
  %resume.val97 = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck96 ], [ %n.vec79, %vector.body73 ]
  %trunc.resume.val98 = phi i32 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck96 ], [ %21, %vector.body73 ]
  %resume.val99 = phi float* [ %v, %.lr.ph.preheader ], [ %v, %vector.memcheck96 ], [ %ptr.ind.end100, %vector.body73 ]
  %resume.val101 = phi float* [ %y, %.lr.ph.preheader ], [ %y, %vector.memcheck96 ], [ %ptr.ind.end102, %vector.body73 ]
  %resume.val103 = phi float* [ %x, %.lr.ph.preheader ], [ %x, %vector.memcheck96 ], [ %ptr.ind.end104, %vector.body73 ]
  %cmp.n105 = icmp eq i64 %end.idx77, %resume.val97
  br i1 %cmp.n105, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block74, %.lr.ph
  %i.010 = phi i32 [ %30, %.lr.ph ], [ %trunc.resume.val98, %middle.block74 ]
  %.09 = phi float* [ %33, %.lr.ph ], [ %resume.val99, %middle.block74 ]
  %.018 = phi float* [ %32, %.lr.ph ], [ %resume.val101, %middle.block74 ]
  %.037 = phi float* [ %31, %.lr.ph ], [ %resume.val103, %middle.block74 ]
  %27 = load float* %.037, align 4, !dbg !454, !tbaa !146
  %28 = load float* %.018, align 4, !dbg !454, !tbaa !146
  %29 = fadd float %27, %28, !dbg !454
  store float %29, float* %.09, align 4, !dbg !454, !tbaa !146
  %30 = add nsw i32 %i.010, 1, !dbg !448
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !119), !dbg !448
  %31 = getelementptr inbounds float* %.037, i64 1, !dbg !448
  tail call void @llvm.dbg.value(metadata !{float* %31}, i64 0, metadata !116), !dbg !448
  %32 = getelementptr inbounds float* %.018, i64 1, !dbg !448
  tail call void @llvm.dbg.value(metadata !{float* %32}, i64 0, metadata !117), !dbg !448
  %33 = getelementptr inbounds float* %.09, i64 1, !dbg !448
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !115), !dbg !448
  %exitcond = icmp eq i32 %30, %n, !dbg !448
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !448, !llvm.loop !456

.lr.ph15:                                         ; preds = %middle.block, %.lr.ph15
  %i.114 = phi i32 [ %37, %.lr.ph15 ], [ %trunc.resume.val, %middle.block ]
  %.113 = phi float* [ %40, %.lr.ph15 ], [ %resume.val29, %middle.block ]
  %.1212 = phi float* [ %39, %.lr.ph15 ], [ %resume.val30, %middle.block ]
  %.1411 = phi float* [ %38, %.lr.ph15 ], [ %resume.val32, %middle.block ]
  %34 = load float* %.1411, align 4, !dbg !452, !tbaa !146
  %35 = load float* %.1212, align 4, !dbg !452, !tbaa !146
  %36 = fsub float %34, %35, !dbg !452
  store float %36, float* %.113, align 4, !dbg !452, !tbaa !146
  %37 = add nsw i32 %i.114, 1, !dbg !450
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !119), !dbg !450
  %38 = getelementptr inbounds float* %.1411, i64 1, !dbg !450
  tail call void @llvm.dbg.value(metadata !{float* %38}, i64 0, metadata !116), !dbg !450
  %39 = getelementptr inbounds float* %.1212, i64 1, !dbg !450
  tail call void @llvm.dbg.value(metadata !{float* %39}, i64 0, metadata !117), !dbg !450
  %40 = getelementptr inbounds float* %.113, i64 1, !dbg !450
  tail call void @llvm.dbg.value(metadata !{float* %40}, i64 0, metadata !115), !dbg !450
  %exitcond16 = icmp eq i32 %37, %n, !dbg !450
  br i1 %exitcond16, label %.loopexit, label %.lr.ph15, !dbg !450, !llvm.loop !457

.loopexit:                                        ; preds = %.lr.ph15, %middle.block, %.lr.ph, %middle.block74, %.preheader5, %.preheader, %0
  ret void, !dbg !458
}

; Function Attrs: nounwind uwtable
define void @vfill(i32 %n, float* nocapture %v, double) #1 {
  %val = fptrunc double %0 to float
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !124), !dbg !459
  tail call void @llvm.dbg.value(metadata !{float* %v}, i64 0, metadata !125), !dbg !460
  tail call void @llvm.dbg.value(metadata !{float %val}, i64 0, metadata !126), !dbg !460
  %2 = icmp slt i32 %n, 1, !dbg !461
  br i1 %2, label %.loopexit, label %.lr.ph.preheader, !dbg !461

.lr.ph.preheader:                                 ; preds = %1
  %3 = add i32 %n, -1, !dbg !463
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1, !dbg !463
  %end.idx = add i64 %4, 1, !dbg !465
  %n.vec = and i64 %5, 8589934584, !dbg !465
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !465
  %6 = trunc i64 %n.vec to i32
  %ptr.ind.end = getelementptr float* %v, i64 %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %broadcast.splatinsert26 = insertelement <4 x float> undef, float %val, i32 0
  %broadcast.splat27 = shufflevector <4 x float> %broadcast.splatinsert26, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !465
  %next.gep = getelementptr float* %v, i64 %index
  %7 = bitcast float* %next.gep to <4 x float>*, !dbg !463
  store <4 x float> %broadcast.splat27, <4 x float>* %7, align 4, !dbg !463
  %next.gep.sum37 = or i64 %index, 4, !dbg !463
  %8 = getelementptr float* %v, i64 %next.gep.sum37, !dbg !463
  %9 = bitcast float* %8 to <4 x float>*, !dbg !463
  store <4 x float> %broadcast.splat27, <4 x float>* %9, align 4, !dbg !463
  %index.next = add i64 %index, 8, !dbg !465
  %10 = icmp eq i64 %index.next, %n.vec, !dbg !465
  br i1 %10, label %middle.block, label %vector.body, !dbg !465, !llvm.loop !466

middle.block:                                     ; preds = %vector.body, %.lr.ph.preheader
  %resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %.lr.ph.preheader ], [ %6, %vector.body ]
  %resume.val3 = phi float* [ %v, %.lr.ph.preheader ], [ %ptr.ind.end, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %i.02 = phi i32 [ %11, %.lr.ph ], [ %trunc.resume.val, %middle.block ]
  %.01 = phi float* [ %12, %.lr.ph ], [ %resume.val3, %middle.block ]
  store float %val, float* %.01, align 4, !dbg !463, !tbaa !146
  %11 = add nsw i32 %i.02, 1, !dbg !465
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !127), !dbg !465
  %12 = getelementptr inbounds float* %.01, i64 1, !dbg !465
  tail call void @llvm.dbg.value(metadata !{float* %12}, i64 0, metadata !125), !dbg !465
  %exitcond = icmp eq i32 %11, %n, !dbg !465
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !465, !llvm.loop !467

.loopexit:                                        ; preds = %.lr.ph, %middle.block, %1
  ret void, !dbg !468
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

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
!181 = metadata !{metadata !181, metadata !182, metadata !183}
!182 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!183 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!184 = metadata !{metadata !184, metadata !182, metadata !183}
!185 = metadata !{i32 98, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !176, i32 98, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!187 = metadata !{i32 100, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !189, i32 100, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!189 = metadata !{i32 786443, metadata !1, metadata !186, i32 98, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!190 = metadata !{i32 101, i32 0, metadata !188, null}
!191 = metadata !{i32 106, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !18, i32 106, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!193 = metadata !{i32 107, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !18, i32 107, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!195 = metadata !{i32 108, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !18, i32 108, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!197 = metadata !{i32 109, i32 0, metadata !196, null}
!198 = metadata !{i32 110, i32 0, metadata !18, null}
!199 = metadata !{i32 114, i32 0, metadata !29, null}
!200 = metadata !{i32 113, i32 0, metadata !29, null}
!201 = metadata !{i32 133, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !29, i32 133, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!203 = metadata !{i32 134, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !29, i32 134, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!205 = metadata !{i32 135, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !207, i32 135, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!207 = metadata !{i32 786443, metadata !1, metadata !204, i32 134, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!208 = metadata !{i32 137, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !210, i32 137, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!210 = metadata !{i32 786443, metadata !1, metadata !206, i32 135, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!211 = metadata !{i32 138, i32 0, metadata !209, null}
!212 = metadata !{metadata !212, metadata !182, metadata !183}
!213 = metadata !{metadata !213, metadata !182, metadata !183}
!214 = metadata !{i32 141, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !207, i32 141, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!216 = metadata !{i32 143, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !218, i32 143, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!218 = metadata !{i32 786443, metadata !1, metadata !215, i32 141, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!219 = metadata !{i32 144, i32 0, metadata !217, null}
!220 = metadata !{i32 149, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !29, i32 149, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!222 = metadata !{i32 150, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !29, i32 150, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!224 = metadata !{i32 151, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !29, i32 151, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!226 = metadata !{i32 152, i32 0, metadata !225, null}
!227 = metadata !{i32 153, i32 0, metadata !29, null}
!228 = metadata !{i32 157, i32 0, metadata !38, null}
!229 = metadata !{i32 156, i32 0, metadata !38, null}
!230 = metadata !{i32 174, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !38, i32 174, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!232 = metadata !{i32 175, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !38, i32 175, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!234 = metadata !{i32 176, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !236, i32 176, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!236 = metadata !{i32 786443, metadata !1, metadata !233, i32 175, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!237 = metadata !{i32 178, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !1, metadata !239, i32 178, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!239 = metadata !{i32 786443, metadata !1, metadata !235, i32 176, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!240 = metadata !{i32 179, i32 0, metadata !238, null}
!241 = metadata !{metadata !241, metadata !182, metadata !183}
!242 = metadata !{metadata !242, metadata !182, metadata !183}
!243 = metadata !{i32 182, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !236, i32 182, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!245 = metadata !{i32 184, i32 0, metadata !246, null}
!246 = metadata !{i32 786443, metadata !1, metadata !247, i32 184, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!247 = metadata !{i32 786443, metadata !1, metadata !244, i32 182, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!248 = metadata !{i32 185, i32 0, metadata !246, null}
!249 = metadata !{i32 190, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !38, i32 190, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!251 = metadata !{i32 191, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !38, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!253 = metadata !{i32 192, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !38, i32 192, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!255 = metadata !{i32 193, i32 0, metadata !254, null}
!256 = metadata !{i32 195, i32 0, metadata !38, null}
!257 = metadata !{i32 198, i32 0, metadata !48, null}
!258 = metadata !{i32 197, i32 0, metadata !48, null}
!259 = metadata !{i32 216, i32 0, metadata !48, null}
!260 = metadata !{i32 218, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !48, i32 218, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!262 = metadata !{i32 219, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !1, metadata !48, i32 219, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!264 = metadata !{i32 220, i32 0, metadata !265, null}
!265 = metadata !{i32 786443, metadata !1, metadata !266, i32 220, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!266 = metadata !{i32 786443, metadata !1, metadata !263, i32 219, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!267 = metadata !{i32 222, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !269, i32 222, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!269 = metadata !{i32 786443, metadata !1, metadata !265, i32 220, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!270 = metadata !{i32 223, i32 0, metadata !268, null}
!271 = metadata !{i32 226, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !266, i32 226, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!273 = metadata !{i32 228, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !275, i32 228, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!275 = metadata !{i32 786443, metadata !1, metadata !272, i32 226, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!276 = metadata !{i32 229, i32 0, metadata !274, null}
!277 = metadata !{i32 234, i32 0, metadata !278, null}
!278 = metadata !{i32 786443, metadata !1, metadata !48, i32 234, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!279 = metadata !{i32 235, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !48, i32 235, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!281 = metadata !{i32 236, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !48, i32 236, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!283 = metadata !{i32 237, i32 0, metadata !282, null}
!284 = metadata !{i32 239, i32 0, metadata !48, null}
!285 = metadata !{i32 243, i32 0, metadata !60, null}
!286 = metadata !{i32 242, i32 0, metadata !60, null}
!287 = metadata !{i32 3}
!288 = metadata !{i32 264, i32 0, metadata !60, null}
!289 = metadata !{double 0.000000e+00}
!290 = metadata !{i32 265, i32 0, metadata !60, null}
!291 = metadata !{i32 268, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !60, i32 268, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!293 = metadata !{float 1.000000e+00}
!294 = metadata !{i32 786688, metadata !74, metadata !"u", metadata !5, i32 335, metadata !10, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [u] [line 335]
!295 = metadata !{i32 270, i32 0, metadata !60, null}
!296 = metadata !{i32 335, i32 0, metadata !74, metadata !295}
!297 = metadata !{float 0x3E70000000000000}
!298 = metadata !{i32 338, i32 0, metadata !299, metadata !295}
!299 = metadata !{i32 786443, metadata !1, metadata !74, i32 337, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!300 = metadata !{float 1.500000e+00}
!301 = metadata !{i32 786688, metadata !74, metadata !"comp", metadata !5, i32 335, metadata !10, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [comp] [line 335]
!302 = metadata !{i32 339, i32 0, metadata !299, metadata !295}
!303 = metadata !{double 0x3BFB084B92366CC2}
!304 = metadata !{double 1.000000e+19}
!305 = metadata !{i32 271, i32 0, metadata !60, null}
!306 = metadata !{i32 272, i32 0, metadata !60, null}
!307 = metadata !{i32 273, i32 0, metadata !60, null}
!308 = metadata !{i32 276, i32 0, metadata !60, null}
!309 = metadata !{i32 278, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !60, i32 276, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!311 = metadata !{i32 277, i32 0, metadata !310, null}
!312 = metadata !{i32 283, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !1, metadata !60, i32 283, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!314 = metadata !{i32 284, i32 0, metadata !315, null}
!315 = metadata !{i32 786443, metadata !1, metadata !316, i32 284, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!316 = metadata !{i32 786443, metadata !1, metadata !313, i32 283, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!317 = metadata !{i32 285, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !319, i32 285, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!319 = metadata !{i32 786443, metadata !1, metadata !315, i32 284, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!320 = metadata !{i32 286, i32 0, metadata !319, null}
!321 = metadata !{i32 288, i32 0, metadata !316, null}
!322 = metadata !{i32 289, i32 0, metadata !316, null}
!323 = metadata !{i32 292, i32 0, metadata !324, null}
!324 = metadata !{i32 786443, metadata !1, metadata !313, i32 291, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!325 = metadata !{i32 295, i32 0, metadata !324, null}
!326 = metadata !{i32 294, i32 0, metadata !324, null}
!327 = metadata !{i32 296, i32 0, metadata !328, null}
!328 = metadata !{i32 786443, metadata !1, metadata !324, i32 296, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!329 = metadata !{i32 293, i32 0, metadata !324, null}
!330 = metadata !{i32 297, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !332, i32 297, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!332 = metadata !{i32 786443, metadata !1, metadata !328, i32 296, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!333 = metadata !{i32 298, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !331, i32 297, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!335 = metadata !{i32 299, i32 0, metadata !334, null}
!336 = metadata !{i32 301, i32 0, metadata !337, null}
!337 = metadata !{i32 786443, metadata !1, metadata !332, i32 301, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!338 = metadata !{i32 302, i32 0, metadata !339, null}
!339 = metadata !{i32 786443, metadata !1, metadata !337, i32 301, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!340 = metadata !{i32 303, i32 0, metadata !339, null}
!341 = metadata !{i32 306, i32 0, metadata !332, null}
!342 = metadata !{i32 308, i32 0, metadata !324, null}
!343 = metadata !{i32 312, i32 0, metadata !60, null}
!344 = metadata !{i32 313, i32 0, metadata !60, null}
!345 = metadata !{i32 315, i32 0, metadata !60, null}
!346 = metadata !{i32 316, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !60, i32 316, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!348 = metadata !{i32 314, i32 0, metadata !60, null}
!349 = metadata !{i32 317, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !351, i32 317, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!351 = metadata !{i32 786443, metadata !1, metadata !347, i32 316, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!352 = metadata !{i32 318, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !350, i32 317, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!354 = metadata !{i32 319, i32 0, metadata !353, null}
!355 = metadata !{i32 322, i32 0, metadata !351, null}
!356 = metadata !{i32 324, i32 0, metadata !60, null}
!357 = metadata !{i32 325, i32 0, metadata !60, null}
!358 = metadata !{i32 335, i32 0, metadata !74, null}
!359 = metadata !{i32 338, i32 0, metadata !299, null}
!360 = metadata !{i32 339, i32 0, metadata !299, null}
!361 = metadata !{i32 342, i32 0, metadata !74, null}
!362 = metadata !{i32 358, i32 0, metadata !80, null}
!363 = metadata !{i32 362, i32 0, metadata !364, null}
!364 = metadata !{i32 786443, metadata !1, metadata !80, i32 362, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!365 = metadata !{i32 363, i32 0, metadata !80, null}
!366 = metadata !{i32 364, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !80, i32 364, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!368 = metadata !{i32 366, i32 0, metadata !369, null}
!369 = metadata !{i32 786443, metadata !1, metadata !80, i32 366, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!370 = metadata !{i32 367, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !80, i32 367, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!372 = metadata !{i32 369, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !80, i32 369, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!374 = metadata !{i32 370, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !80, i32 370, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!376 = metadata !{i32 372, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !80, i32 372, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!378 = metadata !{i32 373, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !80, i32 373, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!380 = metadata !{i32 375, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !1, metadata !80, i32 375, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!382 = metadata !{i32 376, i32 0, metadata !383, null}
!383 = metadata !{i32 786443, metadata !1, metadata !80, i32 376, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!384 = metadata !{i32 378, i32 0, metadata !385, null}
!385 = metadata !{i32 786443, metadata !1, metadata !80, i32 378, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!386 = metadata !{i32 379, i32 0, metadata !387, null}
!387 = metadata !{i32 786443, metadata !1, metadata !80, i32 379, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!388 = metadata !{i32 381, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !80, i32 381, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!390 = metadata !{i32 382, i32 0, metadata !391, null}
!391 = metadata !{i32 786443, metadata !1, metadata !80, i32 382, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!392 = metadata !{i32 384, i32 0, metadata !393, null}
!393 = metadata !{i32 786443, metadata !1, metadata !80, i32 384, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!394 = metadata !{i32 385, i32 0, metadata !395, null}
!395 = metadata !{i32 786443, metadata !1, metadata !80, i32 385, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!396 = metadata !{i32 387, i32 0, metadata !397, null}
!397 = metadata !{i32 786443, metadata !1, metadata !80, i32 387, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!398 = metadata !{i32 388, i32 0, metadata !399, null}
!399 = metadata !{i32 786443, metadata !1, metadata !80, i32 388, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!400 = metadata !{i32 390, i32 0, metadata !401, null}
!401 = metadata !{i32 786443, metadata !1, metadata !80, i32 390, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!402 = metadata !{i32 391, i32 0, metadata !403, null}
!403 = metadata !{i32 786443, metadata !1, metadata !80, i32 391, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!404 = metadata !{i32 393, i32 0, metadata !405, null}
!405 = metadata !{i32 786443, metadata !1, metadata !80, i32 393, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!406 = metadata !{i32 394, i32 0, metadata !407, null}
!407 = metadata !{i32 786443, metadata !1, metadata !80, i32 394, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!408 = metadata !{i32 396, i32 0, metadata !409, null}
!409 = metadata !{i32 786443, metadata !1, metadata !80, i32 396, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!410 = metadata !{i32 397, i32 0, metadata !411, null}
!411 = metadata !{i32 786443, metadata !1, metadata !80, i32 397, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!412 = metadata !{i32 399, i32 0, metadata !413, null}
!413 = metadata !{i32 786443, metadata !1, metadata !80, i32 399, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!414 = metadata !{i32 400, i32 0, metadata !415, null}
!415 = metadata !{i32 786443, metadata !1, metadata !80, i32 400, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!416 = metadata !{i32 402, i32 0, metadata !417, null}
!417 = metadata !{i32 786443, metadata !1, metadata !80, i32 402, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!418 = metadata !{i32 403, i32 0, metadata !419, null}
!419 = metadata !{i32 786443, metadata !1, metadata !80, i32 403, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!420 = metadata !{i32 405, i32 0, metadata !421, null}
!421 = metadata !{i32 786443, metadata !1, metadata !80, i32 405, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!422 = metadata !{i32 406, i32 0, metadata !80, null}
!423 = metadata !{i32 407, i32 0, metadata !80, null}
!424 = metadata !{i32 409, i32 0, metadata !101, null}
!425 = metadata !{i32 410, i32 0, metadata !101, null}
!426 = metadata !{i32 427, i32 0, metadata !427, null}
!427 = metadata !{i32 786443, metadata !1, metadata !101, i32 427, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!428 = metadata !{i32 430, i32 0, metadata !429, null}
!429 = metadata !{i32 786443, metadata !1, metadata !101, i32 430, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!430 = metadata !{i32 437, i32 0, metadata !431, null}
!431 = metadata !{i32 786443, metadata !1, metadata !101, i32 437, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!432 = metadata !{i32 438, i32 0, metadata !431, null}
!433 = metadata !{metadata !433, metadata !182, metadata !183}
!434 = metadata !{i32 431, i32 0, metadata !435, null}
!435 = metadata !{i32 786443, metadata !1, metadata !436, i32 431, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!436 = metadata !{i32 786443, metadata !1, metadata !429, i32 430, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!437 = metadata !{i32 432, i32 0, metadata !438, null}
!438 = metadata !{i32 786443, metadata !1, metadata !436, i32 432, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!439 = metadata !{i32 433, i32 0, metadata !438, null}
!440 = metadata !{metadata !440, metadata !182, metadata !183}
!441 = metadata !{i32 440, i32 0, metadata !101, null}
!442 = metadata !{i32 442, i32 0, metadata !110, null}
!443 = metadata !{i32 443, i32 0, metadata !110, null}
!444 = metadata !{i32 462, i32 0, metadata !445, null}
!445 = metadata !{i32 786443, metadata !1, metadata !110, i32 462, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!446 = metadata !{i32 464, i32 0, metadata !447, null}
!447 = metadata !{i32 786443, metadata !1, metadata !110, i32 464, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!448 = metadata !{i32 465, i32 0, metadata !449, null}
!449 = metadata !{i32 786443, metadata !1, metadata !447, i32 465, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!450 = metadata !{i32 468, i32 0, metadata !451, null}
!451 = metadata !{i32 786443, metadata !1, metadata !447, i32 468, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!452 = metadata !{i32 469, i32 0, metadata !451, null}
!453 = metadata !{metadata !453, metadata !182, metadata !183}
!454 = metadata !{i32 466, i32 0, metadata !449, null}
!455 = metadata !{metadata !455, metadata !182, metadata !183}
!456 = metadata !{metadata !456, metadata !182, metadata !183}
!457 = metadata !{metadata !457, metadata !182, metadata !183}
!458 = metadata !{i32 470, i32 0, metadata !110, null}
!459 = metadata !{i32 472, i32 0, metadata !120, null}
!460 = metadata !{i32 473, i32 0, metadata !120, null}
!461 = metadata !{i32 484, i32 0, metadata !462, null}
!462 = metadata !{i32 786443, metadata !1, metadata !120, i32 484, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!463 = metadata !{i32 486, i32 0, metadata !464, null}
!464 = metadata !{i32 786443, metadata !1, metadata !120, i32 485, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/blas.c]
!465 = metadata !{i32 485, i32 0, metadata !464, null}
!466 = metadata !{metadata !466, metadata !182, metadata !183}
!467 = metadata !{metadata !467, metadata !182, metadata !183}
!468 = metadata !{i32 487, i32 0, metadata !120, null}
