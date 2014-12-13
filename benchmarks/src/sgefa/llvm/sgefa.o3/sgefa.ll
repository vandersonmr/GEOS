; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !42
  %2 = load i32* %1, align 4, !dbg !42, !tbaa !44
  %3 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !42
  %4 = load i32* %3, align 4, !dbg !42, !tbaa !49
  %5 = icmp eq i32 %2, %4, !dbg !42
  br i1 %5, label %6, label %126, !dbg !42

; <label>:6                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !31), !dbg !50
  %7 = add i32 %2, -1, !dbg !51
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !29), !dbg !51
  %8 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !52
  %9 = load float** %8, align 8, !dbg !52, !tbaa !53
  tail call void @llvm.dbg.value(metadata !{float* %9}, i64 0, metadata !33), !dbg !52
  tail call void @llvm.dbg.value(metadata !55, i64 0, metadata !30), !dbg !56
  %10 = icmp sgt i32 %2, 1, !dbg !57
  %11 = icmp sgt i32 %7, 0, !dbg !59
  %or.cond = and i1 %10, %11, !dbg !57
  br i1 %or.cond, label %.lr.ph24, label %.loopexit4, !dbg !57

.lr.ph24:                                         ; preds = %6
  %12 = add i32 %2, -2, !dbg !59
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 1, !dbg !59
  %15 = add i32 %2, -1, !dbg !61
  %16 = add i32 %2, -1, !dbg !61
  %17 = add i32 %2, -1, !dbg !61
  %18 = add i32 %2, -1, !dbg !61
  %19 = add i32 %2, -1, !dbg !65
  br label %20, !dbg !59

; <label>:20                                      ; preds = %._crit_edge50, %.lr.ph24
  %21 = phi float* [ %9, %.lr.ph24 ], [ %.pre, %._crit_edge50 ]
  %indvars.iv46 = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next47.pre-phi, %._crit_edge50 ]
  %indvars.iv40 = phi i64 [ 1, %.lr.ph24 ], [ %indvars.iv.next41, %._crit_edge50 ]
  %.0123 = phi i32* [ %ipvt, %.lr.ph24 ], [ %123, %._crit_edge50 ]
  %info.022 = phi i32 [ 0, %.lr.ph24 ], [ %info.1, %._crit_edge50 ]
  %22 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv46, !dbg !67
  %23 = getelementptr inbounds float* %21, i64 %indvars.iv46, !dbg !67
  tail call void @llvm.dbg.value(metadata !{float* %23}, i64 0, metadata !33), !dbg !67
  %24 = trunc i64 %indvars.iv46 to i32, !dbg !68
  %25 = sub nsw i32 %2, %24, !dbg !68
  %26 = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %25, float* %23, i32 1) #3, !dbg !68
  %27 = add nsw i32 %26, %24, !dbg !68
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !28), !dbg !68
  store i32 %27, i32* %.0123, align 4, !dbg !69, !tbaa !70
  %28 = load float** %22, align 8, !dbg !71, !tbaa !53
  %29 = sext i32 %27 to i64, !dbg !71
  %30 = getelementptr inbounds float* %28, i64 %29, !dbg !71
  tail call void @llvm.dbg.value(metadata !{float* %30}, i64 0, metadata !34), !dbg !71
  %31 = load float* %30, align 4, !dbg !72, !tbaa !74
  %32 = fcmp oeq float %31, 0.000000e+00, !dbg !72
  br i1 %32, label %._crit_edge56, label %33, !dbg !72

._crit_edge56:                                    ; preds = %20
  %indvars.iv.next47.pre = add nuw nsw i64 %indvars.iv46, 1, !dbg !59
  %lftr.wideiv48.pre = trunc i64 %indvars.iv.next47.pre to i32, !dbg !59
  br label %.loopexit, !dbg !72

; <label>:33                                      ; preds = %20
  %34 = icmp ne i32 %26, 0, !dbg !76
  %35 = load float* %23, align 4, !dbg !78, !tbaa !74
  br i1 %34, label %36, label %._crit_edge51, !dbg !76

; <label>:36                                      ; preds = %33
  tail call void @llvm.dbg.value(metadata !{float %31}, i64 0, metadata !32), !dbg !80
  store float %35, float* %30, align 4, !dbg !78, !tbaa !74
  store float %31, float* %23, align 4, !dbg !81, !tbaa !74
  br label %._crit_edge51, !dbg !82

._crit_edge51:                                    ; preds = %33, %36
  %37 = phi float [ %31, %36 ], [ %35, %33 ]
  %38 = fdiv float -1.000000e+00, %37, !dbg !83
  tail call void @llvm.dbg.value(metadata !{float %38}, i64 0, metadata !32), !dbg !83
  %39 = add i64 %indvars.iv46, 1, !dbg !84
  %40 = getelementptr inbounds float* %21, i64 %39, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %40}, i64 0, metadata !36), !dbg !84
  %41 = trunc i64 %39 to i32, !dbg !84
  %42 = icmp slt i32 %41, %2, !dbg !84
  br i1 %42, label %.lr.ph.preheader, label %.loopexit, !dbg !84

.lr.ph.preheader:                                 ; preds = %._crit_edge51
  %43 = add i64 %indvars.iv46, 1, !dbg !65
  %44 = trunc i64 %43 to i32
  %45 = sub i32 %19, %44, !dbg !65
  %46 = zext i32 %45 to i64
  %47 = add i64 %46, 1, !dbg !65
  %48 = and i64 %39, 4294967295, !dbg !65
  %end.idx175 = add i64 %47, %48, !dbg !84
  %n.vec177 = and i64 %47, -8, !dbg !84
  %end.idx.rnd.down178 = add i64 %n.vec177, %48, !dbg !84
  %cmp.zero179 = icmp eq i64 %n.vec177, 0, !dbg !84
  %.sum = add i64 %39, %n.vec177
  %ptr.ind.end181 = getelementptr float* %21, i64 %.sum
  %49 = trunc i64 %end.idx.rnd.down178 to i32
  br i1 %cmp.zero179, label %middle.block172, label %vector.ph170

vector.ph170:                                     ; preds = %.lr.ph.preheader
  %broadcast.splatinsert217 = insertelement <4 x float> undef, float %38, i32 0
  %broadcast.splat218 = shufflevector <4 x float> %broadcast.splatinsert217, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body171

vector.body171:                                   ; preds = %vector.body171, %vector.ph170
  %index174 = phi i64 [ %48, %vector.ph170 ], [ %index.next185, %vector.body171 ], !dbg !84
  %normalized.idx186 = sub i64 %index174, %48
  %.sum221 = add i64 %39, %normalized.idx186
  %next.gep188 = getelementptr float* %21, i64 %.sum221
  %50 = bitcast float* %next.gep188 to <4 x float>*, !dbg !65
  %wide.load215 = load <4 x float>* %50, align 4, !dbg !65
  %next.gep188.sum = add i64 %.sum221, 4, !dbg !65
  %51 = getelementptr float* %21, i64 %next.gep188.sum, !dbg !65
  %52 = bitcast float* %51 to <4 x float>*, !dbg !65
  %wide.load216 = load <4 x float>* %52, align 4, !dbg !65
  %53 = fmul <4 x float> %broadcast.splat218, %wide.load215, !dbg !65
  %54 = fmul <4 x float> %broadcast.splat218, %wide.load216, !dbg !65
  %55 = bitcast float* %next.gep188 to <4 x float>*, !dbg !65
  store <4 x float> %53, <4 x float>* %55, align 4, !dbg !65
  %56 = bitcast float* %51 to <4 x float>*, !dbg !65
  store <4 x float> %54, <4 x float>* %56, align 4, !dbg !65
  %index.next185 = add i64 %index174, 8, !dbg !84
  %57 = icmp eq i64 %index.next185, %end.idx.rnd.down178, !dbg !84
  br i1 %57, label %middle.block172, label %vector.body171, !dbg !84, !llvm.loop !85

middle.block172:                                  ; preds = %vector.body171, %.lr.ph.preheader
  %resume.val180 = phi float* [ %40, %.lr.ph.preheader ], [ %ptr.ind.end181, %vector.body171 ]
  %resume.val182 = phi i64 [ %48, %.lr.ph.preheader ], [ %end.idx.rnd.down178, %vector.body171 ]
  %trunc.resume.val183 = phi i32 [ %41, %.lr.ph.preheader ], [ %49, %vector.body171 ]
  %cmp.n184 = icmp eq i64 %end.idx175, %resume.val182
  br i1 %cmp.n184, label %.preheader, label %.lr.ph

.preheader:                                       ; preds = %middle.block172, %.lr.ph
  br i1 %42, label %.lr.ph12, label %.loopexit, !dbg !88

.lr.ph12:                                         ; preds = %.preheader
  %58 = add i64 %indvars.iv46, 1, !dbg !61
  %59 = trunc i64 %58 to i32
  br i1 %34, label %.lr.ph10.us.us.preheader, label %.lr.ph10.us18.preheader

.lr.ph10.us18.preheader:                          ; preds = %.lr.ph12
  %60 = sub i32 %17, %59, !dbg !61
  %61 = zext i32 %60 to i64
  %62 = add i64 %61, 1, !dbg !61
  %63 = trunc i64 %58 to i32
  %64 = sub i32 %18, %63, !dbg !61
  %65 = zext i32 %64 to i64
  %66 = add i64 %indvars.iv46, %65, !dbg !61
  %scevgep116.sum = add i64 %indvars.iv46, 1
  %scevgep117 = getelementptr float* %21, i64 %scevgep116.sum
  %scevgep119.sum = add i64 %66, 1
  %scevgep120 = getelementptr float* %21, i64 %scevgep119.sum
  br label %.lr.ph10.us18, !dbg !61

.lr.ph10.us.us.preheader:                         ; preds = %.lr.ph12
  %67 = sub i32 %15, %59, !dbg !61
  %68 = zext i32 %67 to i64
  %69 = add i64 %68, 1, !dbg !61
  %70 = trunc i64 %58 to i32
  %71 = sub i32 %16, %70, !dbg !61
  %72 = zext i32 %71 to i64
  %73 = add i64 %indvars.iv46, %72, !dbg !61
  %scevgep64.sum = add i64 %indvars.iv46, 1
  %scevgep65 = getelementptr float* %21, i64 %scevgep64.sum
  %scevgep67.sum = add i64 %73, 1
  %scevgep68 = getelementptr float* %21, i64 %scevgep67.sum
  br label %.lr.ph10.us.us, !dbg !61

; <label>:74                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !88
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !88
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %2, !dbg !88
  br i1 %exitcond45, label %.loopexit, label %.lr.ph10.us.us, !dbg !88

.lr.ph10.us.us:                                   ; preds = %.lr.ph10.us.us.preheader, %74
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %74 ], [ %indvars.iv40, %.lr.ph10.us.us.preheader ]
  %75 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv42, !dbg !61
  %76 = load float** %75, align 8, !dbg !61, !tbaa !53
  %77 = getelementptr inbounds float* %76, i64 %indvars.iv46, !dbg !61
  tail call void @llvm.dbg.value(metadata !{float %78}, i64 0, metadata !32), !dbg !61
  %78 = load float* %77, align 4, !dbg !61, !tbaa !74
  %79 = getelementptr inbounds float* %76, i64 %29, !dbg !89
  %80 = load float* %79, align 4, !dbg !89, !tbaa !74
  store float %80, float* %77, align 4, !dbg !89, !tbaa !74
  store float %78, float* %79, align 4, !dbg !92, !tbaa !74
  %81 = load float* %77, align 4, !dbg !93, !tbaa !74
  tail call void @llvm.dbg.value(metadata !{float %81}, i64 0, metadata !32), !dbg !93
  tail call void @llvm.dbg.value(metadata !{float* %82}, i64 0, metadata !35), !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %40}, i64 0, metadata !36), !dbg !94
  %82 = getelementptr inbounds float* %76, i64 %39, !dbg !94
  %83 = and i64 %39, 4294967295, !dbg !94
  %end.idx = add i64 %69, %83, !dbg !84
  %n.vec = and i64 %69, -4, !dbg !84
  %end.idx.rnd.down = add i64 %n.vec, %83, !dbg !84
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !84
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph10.us.us
  %scevgep61.sum = add i64 %73, 1
  %scevgep58.sum = add i64 %indvars.iv46, 1
  %scevgep62 = getelementptr float* %76, i64 %scevgep61.sum
  %scevgep59 = getelementptr float* %76, i64 %scevgep58.sum
  %bound1 = icmp ule float* %scevgep65, %scevgep62
  %bound0 = icmp ule float* %scevgep59, %scevgep68
  %memcheck.conflict = and i1 %bound0, %bound1
  %.sum240 = add i64 %39, %n.vec
  %ptr.ind.end = getelementptr float* %21, i64 %.sum240
  %.sum241 = add i64 %39, %n.vec
  %ptr.ind.end71 = getelementptr float* %76, i64 %.sum241
  %84 = trunc i64 %end.idx.rnd.down to i32
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert95 = insertelement <4 x float> undef, float %81, i32 0
  %broadcast.splat96 = shufflevector <4 x float> %broadcast.splatinsert95, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %83, %vector.ph ], [ %index.next, %vector.body ], !dbg !84
  %normalized.idx = sub i64 %index, %83
  %.sum242 = add i64 %39, %normalized.idx
  %next.gep = getelementptr float* %21, i64 %.sum242
  %normalized.idx82 = sub i64 %index, %83
  %.sum246 = add i64 %39, %normalized.idx82
  %next.gep84 = getelementptr float* %76, i64 %.sum246
  %85 = bitcast float* %next.gep to <4 x float>*, !dbg !96
  %wide.load = load <4 x float>* %85, align 4, !dbg !96
  %86 = fmul <4 x float> %broadcast.splat96, %wide.load, !dbg !96
  %87 = bitcast float* %next.gep84 to <4 x float>*, !dbg !96
  %wide.load97 = load <4 x float>* %87, align 4, !dbg !96
  %88 = fadd <4 x float> %wide.load97, %86, !dbg !96
  %89 = bitcast float* %next.gep84 to <4 x float>*, !dbg !96
  store <4 x float> %88, <4 x float>* %89, align 4, !dbg !96
  %index.next = add i64 %index, 4, !dbg !84
  %90 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !84
  br i1 %90, label %middle.block, label %vector.body, !dbg !84, !llvm.loop !97

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph10.us.us
  %resume.val = phi float* [ %40, %.lr.ph10.us.us ], [ %40, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val70 = phi float* [ %82, %.lr.ph10.us.us ], [ %82, %vector.memcheck ], [ %ptr.ind.end71, %vector.body ]
  %resume.val72 = phi i64 [ %83, %.lr.ph10.us.us ], [ %83, %vector.memcheck ], [ %end.idx.rnd.down, %vector.body ]
  %trunc.resume.val = phi i32 [ %41, %.lr.ph10.us.us ], [ %41, %vector.memcheck ], [ %84, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val72
  br i1 %cmp.n, label %74, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %mik.19.us.us = phi float* [ %97, %scalar.ph ], [ %resume.val, %middle.block ]
  %aij.08.us.us = phi float* [ %96, %scalar.ph ], [ %resume.val70, %middle.block ]
  %i.17.us.us = phi i32 [ %95, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %91 = load float* %mik.19.us.us, align 4, !dbg !96, !tbaa !74
  %92 = fmul float %81, %91, !dbg !96
  %93 = load float* %aij.08.us.us, align 4, !dbg !96, !tbaa !74
  %94 = fadd float %93, %92, !dbg !96
  store float %94, float* %aij.08.us.us, align 4, !dbg !96, !tbaa !74
  %95 = add nsw i32 %i.17.us.us, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !25), !dbg !94
  %96 = getelementptr inbounds float* %aij.08.us.us, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %96}, i64 0, metadata !35), !dbg !94
  %97 = getelementptr inbounds float* %mik.19.us.us, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %97}, i64 0, metadata !36), !dbg !94
  %exitcond39 = icmp eq i32 %95, %2, !dbg !94
  br i1 %exitcond39, label %74, label %scalar.ph, !dbg !94, !llvm.loop !98

; <label>:98                                      ; preds = %middle.block102, %scalar.ph103
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1, !dbg !88
  %lftr.wideiv37 = trunc i64 %indvars.iv.next36 to i32, !dbg !88
  %exitcond38 = icmp eq i32 %lftr.wideiv37, %2, !dbg !88
  br i1 %exitcond38, label %.loopexit, label %.lr.ph10.us18, !dbg !88

scalar.ph103:                                     ; preds = %middle.block102, %scalar.ph103
  %mik.19.us15 = phi float* [ %105, %scalar.ph103 ], [ %resume.val127, %middle.block102 ]
  %aij.08.us16 = phi float* [ %104, %scalar.ph103 ], [ %resume.val129, %middle.block102 ]
  %i.17.us17 = phi i32 [ %103, %scalar.ph103 ], [ %trunc.resume.val132, %middle.block102 ]
  %99 = load float* %mik.19.us15, align 4, !dbg !96, !tbaa !74
  %100 = fmul float %109, %99, !dbg !96
  %101 = load float* %aij.08.us16, align 4, !dbg !96, !tbaa !74
  %102 = fadd float %101, %100, !dbg !96
  store float %102, float* %aij.08.us16, align 4, !dbg !96, !tbaa !74
  %103 = add nsw i32 %i.17.us17, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !25), !dbg !94
  %104 = getelementptr inbounds float* %aij.08.us16, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %104}, i64 0, metadata !35), !dbg !94
  %105 = getelementptr inbounds float* %mik.19.us15, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %105}, i64 0, metadata !36), !dbg !94
  %exitcond32 = icmp eq i32 %103, %2, !dbg !94
  br i1 %exitcond32, label %98, label %scalar.ph103, !dbg !94, !llvm.loop !99

.lr.ph10.us18:                                    ; preds = %.lr.ph10.us18.preheader, %98
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %98 ], [ %indvars.iv40, %.lr.ph10.us18.preheader ]
  %106 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv35, !dbg !61
  %107 = load float** %106, align 8, !dbg !61, !tbaa !53
  %108 = getelementptr inbounds float* %107, i64 %indvars.iv46, !dbg !61
  %109 = load float* %108, align 4, !dbg !61, !tbaa !74
  tail call void @llvm.dbg.value(metadata !{float %109}, i64 0, metadata !32), !dbg !61
  tail call void @llvm.dbg.value(metadata !{float* %110}, i64 0, metadata !35), !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %40}, i64 0, metadata !36), !dbg !94
  %110 = getelementptr inbounds float* %107, i64 %39, !dbg !94
  %111 = and i64 %39, 4294967295, !dbg !94
  %end.idx105 = add i64 %62, %111, !dbg !84
  %n.vec107 = and i64 %62, -4, !dbg !84
  %end.idx.rnd.down108 = add i64 %n.vec107, %111, !dbg !84
  %cmp.zero109 = icmp eq i64 %n.vec107, 0, !dbg !84
  br i1 %cmp.zero109, label %middle.block102, label %vector.memcheck126

vector.memcheck126:                               ; preds = %.lr.ph10.us18
  %scevgep113.sum = add i64 %66, 1
  %scevgep110.sum = add i64 %indvars.iv46, 1
  %scevgep114 = getelementptr float* %107, i64 %scevgep113.sum
  %scevgep111 = getelementptr float* %107, i64 %scevgep110.sum
  %bound1123 = icmp ule float* %scevgep117, %scevgep114
  %bound0122 = icmp ule float* %scevgep111, %scevgep120
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  %.sum230 = add i64 %39, %n.vec107
  %ptr.ind.end128 = getelementptr float* %21, i64 %.sum230
  %.sum231 = add i64 %39, %n.vec107
  %ptr.ind.end130 = getelementptr float* %107, i64 %.sum231
  %112 = trunc i64 %end.idx.rnd.down108 to i32
  br i1 %memcheck.conflict125, label %middle.block102, label %vector.ph100

vector.ph100:                                     ; preds = %vector.memcheck126
  %broadcast.splatinsert165 = insertelement <4 x float> undef, float %109, i32 0
  %broadcast.splat166 = shufflevector <4 x float> %broadcast.splatinsert165, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph100
  %index104 = phi i64 [ %111, %vector.ph100 ], [ %index.next134, %vector.body101 ], !dbg !84
  %normalized.idx135 = sub i64 %index104, %111
  %.sum232 = add i64 %39, %normalized.idx135
  %next.gep137 = getelementptr float* %21, i64 %.sum232
  %normalized.idx148 = sub i64 %index104, %111
  %.sum236 = add i64 %39, %normalized.idx148
  %next.gep150 = getelementptr float* %107, i64 %.sum236
  %113 = bitcast float* %next.gep137 to <4 x float>*, !dbg !96
  %wide.load164 = load <4 x float>* %113, align 4, !dbg !96
  %114 = fmul <4 x float> %broadcast.splat166, %wide.load164, !dbg !96
  %115 = bitcast float* %next.gep150 to <4 x float>*, !dbg !96
  %wide.load167 = load <4 x float>* %115, align 4, !dbg !96
  %116 = fadd <4 x float> %wide.load167, %114, !dbg !96
  %117 = bitcast float* %next.gep150 to <4 x float>*, !dbg !96
  store <4 x float> %116, <4 x float>* %117, align 4, !dbg !96
  %index.next134 = add i64 %index104, 4, !dbg !84
  %118 = icmp eq i64 %index.next134, %end.idx.rnd.down108, !dbg !84
  br i1 %118, label %middle.block102, label %vector.body101, !dbg !84, !llvm.loop !100

middle.block102:                                  ; preds = %vector.body101, %vector.memcheck126, %.lr.ph10.us18
  %resume.val127 = phi float* [ %40, %.lr.ph10.us18 ], [ %40, %vector.memcheck126 ], [ %ptr.ind.end128, %vector.body101 ]
  %resume.val129 = phi float* [ %110, %.lr.ph10.us18 ], [ %110, %vector.memcheck126 ], [ %ptr.ind.end130, %vector.body101 ]
  %resume.val131 = phi i64 [ %111, %.lr.ph10.us18 ], [ %111, %vector.memcheck126 ], [ %end.idx.rnd.down108, %vector.body101 ]
  %trunc.resume.val132 = phi i32 [ %41, %.lr.ph10.us18 ], [ %41, %vector.memcheck126 ], [ %112, %vector.body101 ]
  %cmp.n133 = icmp eq i64 %end.idx105, %resume.val131
  br i1 %cmp.n133, label %98, label %scalar.ph103

.lr.ph:                                           ; preds = %middle.block172, %.lr.ph
  %mik.06 = phi float* [ %122, %.lr.ph ], [ %resume.val180, %middle.block172 ]
  %i.05 = phi i32 [ %121, %.lr.ph ], [ %trunc.resume.val183, %middle.block172 ]
  %119 = load float* %mik.06, align 4, !dbg !65, !tbaa !74
  %120 = fmul float %38, %119, !dbg !65
  store float %120, float* %mik.06, align 4, !dbg !65, !tbaa !74
  %121 = add nsw i32 %i.05, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32 %121}, i64 0, metadata !25), !dbg !84
  %122 = getelementptr inbounds float* %mik.06, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %122}, i64 0, metadata !36), !dbg !84
  %exitcond = icmp eq i32 %121, %2, !dbg !84
  br i1 %exitcond, label %.preheader, label %.lr.ph, !dbg !84, !llvm.loop !101

.loopexit:                                        ; preds = %98, %74, %._crit_edge51, %.preheader, %._crit_edge56
  %lftr.wideiv48.pre-phi = phi i32 [ %lftr.wideiv48.pre, %._crit_edge56 ], [ %41, %.preheader ], [ %41, %._crit_edge51 ], [ %41, %74 ], [ %41, %98 ], !dbg !59
  %indvars.iv.next47.pre-phi = phi i64 [ %indvars.iv.next47.pre, %._crit_edge56 ], [ %39, %.preheader ], [ %39, %._crit_edge51 ], [ %39, %74 ], [ %39, %98 ], !dbg !59
  %info.1 = phi i32 [ %24, %._crit_edge56 ], [ %info.022, %.preheader ], [ %info.022, %._crit_edge51 ], [ %info.022, %74 ], [ %info.022, %98 ]
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep}, i64 0, metadata !24), !dbg !59
  %exitcond49 = icmp eq i32 %lftr.wideiv48.pre-phi, %7, !dbg !59
  br i1 %exitcond49, label %..loopexit4_crit_edge, label %._crit_edge50, !dbg !59

._crit_edge50:                                    ; preds = %.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1, !dbg !59
  %123 = getelementptr inbounds i32* %.0123, i64 1, !dbg !59
  %.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next47.pre-phi
  %.pre = load float** %.phi.trans.insert, align 8, !dbg !67, !tbaa !53
  br label %20, !dbg !59

..loopexit4_crit_edge:                            ; preds = %.loopexit
  %scevgep = getelementptr i32* %ipvt, i64 %14
  br label %.loopexit4, !dbg !59

.loopexit4:                                       ; preds = %6, %..loopexit4_crit_edge
  %info.2 = phi i32 [ 0, %6 ], [ %info.1, %..loopexit4_crit_edge ]
  %.1 = phi i32* [ %ipvt, %6 ], [ %scevgep, %..loopexit4_crit_edge ]
  %akk.1 = phi float* [ %9, %6 ], [ %23, %..loopexit4_crit_edge ]
  store i32 %7, i32* %.1, align 4, !dbg !102, !tbaa !70
  %124 = load float* %akk.1, align 4, !dbg !103, !tbaa !74
  %125 = fcmp oeq float %124, 0.000000e+00, !dbg !103
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !30), !dbg !103
  %info.3 = select i1 %125, i32 %2, i32 %info.2, !dbg !103
  br label %126, !dbg !103

; <label>:126                                     ; preds = %.loopexit4, %0
  %.0 = phi i32 [ -1, %0 ], [ %info.3, %.loopexit4 ]
  ret i32 %.0, !dbg !105
}

declare i32 @isamax(...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sgefa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sgefa", metadata !"sgefa", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, i32*)* @sgefa, null, null, metadata !22, i32 48} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !21}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = metadata !{i32 786451, metadata !11, null, metadata !"FULL", i32 31, i64 64064, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !"./ge.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"cd", i32 32, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"rd", i32 33, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"pd", i32 34, i64 64000, i64 64, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64000, i64 64, i32 0, i32 0, metadata !17, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 1000}     ; [ DW_TAG_subrange_type ] [0, 999]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = metadata !{metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36}
!23 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = metadata !{i32 786689, metadata !4, metadata !"ipvt", metadata !5, i32 33554445, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 49]
!26 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 49]
!27 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 50]
!28 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 50]
!29 = metadata !{i32 786688, metadata !4, metadata !"nm1", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!30 = metadata !{i32 786688, metadata !4, metadata !"info", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [info] [line 50]
!31 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 50]
!32 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 51, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 51]
!33 = metadata !{i32 786688, metadata !4, metadata !"akk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [akk] [line 51]
!34 = metadata !{i32 786688, metadata !4, metadata !"alk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alk] [line 51]
!35 = metadata !{i32 786688, metadata !4, metadata !"aij", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aij] [line 51]
!36 = metadata !{i32 786688, metadata !4, metadata !"mik", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mik] [line 51]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 12, i32 0, metadata !4, null}
!41 = metadata !{i32 13, i32 0, metadata !4, null}
!42 = metadata !{i32 54, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!44 = metadata !{metadata !45, metadata !46, i64 0}
!45 = metadata !{metadata !"FULL", metadata !46, i64 0, metadata !46, i64 4, metadata !47, i64 8}
!46 = metadata !{metadata !"int", metadata !47, i64 0}
!47 = metadata !{metadata !"omnipotent char", metadata !48, i64 0}
!48 = metadata !{metadata !"Simple C/C++ TBAA"}
!49 = metadata !{metadata !45, metadata !46, i64 4}
!50 = metadata !{i32 55, i32 0, metadata !4, null}
!51 = metadata !{i32 56, i32 0, metadata !4, null}
!52 = metadata !{i32 57, i32 0, metadata !4, null}
!53 = metadata !{metadata !54, metadata !54, i64 0}
!54 = metadata !{metadata !"any pointer", metadata !47, i64 0}
!55 = metadata !{i32 0}
!56 = metadata !{i32 58, i32 0, metadata !4, null} ; [ DW_TAG_imported_module ]
!57 = metadata !{i32 59, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !4, i32 59, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!59 = metadata !{i32 62, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !4, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!61 = metadata !{i32 92, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !63, i32 89, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!63 = metadata !{i32 786443, metadata !1, metadata !64, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!64 = metadata !{i32 786443, metadata !1, metadata !60, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!65 = metadata !{i32 86, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !64, i32 85, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!67 = metadata !{i32 65, i32 0, metadata !64, null}
!68 = metadata !{i32 66, i32 0, metadata !64, null}
!69 = metadata !{i32 67, i32 0, metadata !64, null}
!70 = metadata !{metadata !46, metadata !46, i64 0}
!71 = metadata !{i32 70, i32 0, metadata !64, null}
!72 = metadata !{i32 71, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !64, i32 71, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!74 = metadata !{metadata !75, metadata !75, i64 0}
!75 = metadata !{metadata !"float", metadata !47, i64 0}
!76 = metadata !{i32 77, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !64, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!78 = metadata !{i32 79, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !77, i32 77, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!80 = metadata !{i32 78, i32 0, metadata !79, null}
!81 = metadata !{i32 80, i32 0, metadata !79, null}
!82 = metadata !{i32 81, i32 0, metadata !79, null}
!83 = metadata !{i32 84, i32 0, metadata !64, null}
!84 = metadata !{i32 85, i32 0, metadata !66, null}
!85 = metadata !{metadata !85, metadata !86, metadata !87}
!86 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!87 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!88 = metadata !{i32 89, i32 0, metadata !63, null}
!89 = metadata !{i32 94, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !91, i32 93, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!91 = metadata !{i32 786443, metadata !1, metadata !62, i32 93, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!92 = metadata !{i32 95, i32 0, metadata !90, null}
!93 = metadata !{i32 96, i32 0, metadata !90, null}
!94 = metadata !{i32 98, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !62, i32 98, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!96 = metadata !{i32 99, i32 0, metadata !95, null}
!97 = metadata !{metadata !97, metadata !86, metadata !87}
!98 = metadata !{metadata !98, metadata !86, metadata !87}
!99 = metadata !{metadata !99, metadata !86, metadata !87}
!100 = metadata !{metadata !100, metadata !86, metadata !87}
!101 = metadata !{metadata !101, metadata !86, metadata !87}
!102 = metadata !{i32 104, i32 0, metadata !4, null}
!103 = metadata !{i32 105, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!105 = metadata !{i32 107, i32 0, metadata !4, null}
