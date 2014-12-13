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
  br i1 %5, label %6, label %96, !dbg !42

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
  br i1 %or.cond, label %.lr.ph17, label %.loopexit4, !dbg !57

.lr.ph17:                                         ; preds = %6
  %12 = add i32 %2, -2, !dbg !59
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 1, !dbg !59
  %15 = add i32 %2, -1, !dbg !61
  %16 = add i32 %2, -1, !dbg !61
  %17 = add i32 %2, -1, !dbg !65
  br label %18, !dbg !59

; <label>:18                                      ; preds = %._crit_edge29, %.lr.ph17
  %19 = phi float* [ %9, %.lr.ph17 ], [ %.pre, %._crit_edge29 ]
  %indvars.iv25 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next26.pre-phi, %._crit_edge29 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph17 ], [ %indvars.iv.next, %._crit_edge29 ]
  %.0116 = phi i32* [ %ipvt, %.lr.ph17 ], [ %93, %._crit_edge29 ]
  %info.015 = phi i32 [ 0, %.lr.ph17 ], [ %info.1, %._crit_edge29 ]
  %20 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv25, !dbg !67
  %21 = getelementptr inbounds float* %19, i64 %indvars.iv25, !dbg !67
  tail call void @llvm.dbg.value(metadata !{float* %21}, i64 0, metadata !33), !dbg !67
  %22 = trunc i64 %indvars.iv25 to i32, !dbg !68
  %23 = sub nsw i32 %2, %22, !dbg !68
  %24 = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %23, float* %21, i32 1) #3, !dbg !68
  %25 = add nsw i32 %24, %22, !dbg !68
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !28), !dbg !68
  store i32 %25, i32* %.0116, align 4, !dbg !69, !tbaa !70
  %26 = load float** %20, align 8, !dbg !71, !tbaa !53
  %27 = sext i32 %25 to i64, !dbg !71
  %28 = getelementptr inbounds float* %26, i64 %27, !dbg !71
  tail call void @llvm.dbg.value(metadata !{float* %28}, i64 0, metadata !34), !dbg !71
  %29 = load float* %28, align 4, !dbg !72, !tbaa !74
  %30 = fcmp oeq float %29, 0.000000e+00, !dbg !72
  br i1 %30, label %._crit_edge33, label %31, !dbg !72

._crit_edge33:                                    ; preds = %18
  %indvars.iv.next26.pre = add nuw nsw i64 %indvars.iv25, 1, !dbg !59
  %lftr.wideiv27.pre = trunc i64 %indvars.iv.next26.pre to i32, !dbg !59
  br label %.loopexit, !dbg !72

; <label>:31                                      ; preds = %18
  %32 = icmp ne i32 %24, 0, !dbg !76
  %33 = load float* %21, align 4, !dbg !78, !tbaa !74
  br i1 %32, label %34, label %._crit_edge30, !dbg !76

; <label>:34                                      ; preds = %31
  tail call void @llvm.dbg.value(metadata !{float %29}, i64 0, metadata !32), !dbg !80
  store float %33, float* %28, align 4, !dbg !78, !tbaa !74
  store float %29, float* %21, align 4, !dbg !81, !tbaa !74
  br label %._crit_edge30, !dbg !82

._crit_edge30:                                    ; preds = %31, %34
  %35 = phi float [ %29, %34 ], [ %33, %31 ]
  %36 = fdiv float -1.000000e+00, %35, !dbg !83
  tail call void @llvm.dbg.value(metadata !{float %36}, i64 0, metadata !32), !dbg !83
  %37 = add i64 %indvars.iv25, 1, !dbg !84
  %38 = getelementptr inbounds float* %19, i64 %37, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %38}, i64 0, metadata !36), !dbg !84
  %39 = trunc i64 %37 to i32, !dbg !84
  %40 = icmp slt i32 %39, %2, !dbg !84
  br i1 %40, label %.lr.ph.preheader, label %.loopexit, !dbg !84

.lr.ph.preheader:                                 ; preds = %._crit_edge30
  %41 = add i64 %indvars.iv25, 1, !dbg !65
  %42 = trunc i64 %41 to i32
  %43 = sub i32 %17, %42, !dbg !65
  %44 = zext i32 %43 to i64
  %45 = add i64 %44, 1, !dbg !65
  %46 = and i64 %37, 4294967295, !dbg !65
  %end.idx81 = add i64 %45, %46, !dbg !84
  %n.vec83 = and i64 %45, -8, !dbg !84
  %end.idx.rnd.down84 = add i64 %n.vec83, %46, !dbg !84
  %cmp.zero85 = icmp eq i64 %n.vec83, 0, !dbg !84
  %.sum = add i64 %37, %n.vec83
  %ptr.ind.end87 = getelementptr float* %19, i64 %.sum
  %47 = trunc i64 %end.idx.rnd.down84 to i32
  br i1 %cmp.zero85, label %middle.block78, label %vector.ph76

vector.ph76:                                      ; preds = %.lr.ph.preheader
  %broadcast.splatinsert123 = insertelement <4 x float> undef, float %36, i32 0
  %broadcast.splat124 = shufflevector <4 x float> %broadcast.splatinsert123, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %vector.ph76
  %index80 = phi i64 [ %46, %vector.ph76 ], [ %index.next91, %vector.body77 ], !dbg !84
  %normalized.idx92 = sub i64 %index80, %46
  %.sum127 = add i64 %37, %normalized.idx92
  %next.gep94 = getelementptr float* %19, i64 %.sum127
  %48 = bitcast float* %next.gep94 to <4 x float>*, !dbg !65
  %wide.load121 = load <4 x float>* %48, align 4, !dbg !65
  %next.gep94.sum = add i64 %.sum127, 4, !dbg !65
  %49 = getelementptr float* %19, i64 %next.gep94.sum, !dbg !65
  %50 = bitcast float* %49 to <4 x float>*, !dbg !65
  %wide.load122 = load <4 x float>* %50, align 4, !dbg !65
  %51 = fmul <4 x float> %broadcast.splat124, %wide.load121, !dbg !65
  %52 = fmul <4 x float> %broadcast.splat124, %wide.load122, !dbg !65
  %53 = bitcast float* %next.gep94 to <4 x float>*, !dbg !65
  store <4 x float> %51, <4 x float>* %53, align 4, !dbg !65
  %54 = bitcast float* %49 to <4 x float>*, !dbg !65
  store <4 x float> %52, <4 x float>* %54, align 4, !dbg !65
  %index.next91 = add i64 %index80, 8, !dbg !84
  %55 = icmp eq i64 %index.next91, %end.idx.rnd.down84, !dbg !84
  br i1 %55, label %middle.block78, label %vector.body77, !dbg !84, !llvm.loop !85

middle.block78:                                   ; preds = %vector.body77, %.lr.ph.preheader
  %resume.val86 = phi float* [ %38, %.lr.ph.preheader ], [ %ptr.ind.end87, %vector.body77 ]
  %resume.val88 = phi i64 [ %46, %.lr.ph.preheader ], [ %end.idx.rnd.down84, %vector.body77 ]
  %trunc.resume.val89 = phi i32 [ %39, %.lr.ph.preheader ], [ %47, %vector.body77 ]
  %cmp.n90 = icmp eq i64 %end.idx81, %resume.val88
  br i1 %cmp.n90, label %.preheader, label %.lr.ph

.preheader:                                       ; preds = %middle.block78, %.lr.ph
  br i1 %40, label %.lr.ph12.preheader, label %.loopexit, !dbg !88

.lr.ph12.preheader:                               ; preds = %.preheader
  %56 = add i64 %indvars.iv25, 1, !dbg !61
  %57 = trunc i64 %56 to i32
  %58 = sub i32 %15, %57, !dbg !61
  %59 = zext i32 %58 to i64
  %60 = add i64 %59, 1, !dbg !61
  %61 = trunc i64 %56 to i32
  %62 = sub i32 %16, %61, !dbg !61
  %63 = zext i32 %62 to i64
  %64 = add i64 %indvars.iv25, %63, !dbg !61
  %scevgep40.sum = add i64 %indvars.iv25, 1
  %scevgep41 = getelementptr float* %19, i64 %scevgep40.sum
  %scevgep43.sum = add i64 %64, 1
  %scevgep44 = getelementptr float* %19, i64 %scevgep43.sum
  br label %.lr.ph12, !dbg !61

.lr.ph:                                           ; preds = %middle.block78, %.lr.ph
  %mik.06 = phi float* [ %68, %.lr.ph ], [ %resume.val86, %middle.block78 ]
  %i.05 = phi i32 [ %67, %.lr.ph ], [ %trunc.resume.val89, %middle.block78 ]
  %65 = load float* %mik.06, align 4, !dbg !65, !tbaa !74
  %66 = fmul float %36, %65, !dbg !65
  store float %66, float* %mik.06, align 4, !dbg !65, !tbaa !74
  %67 = add nsw i32 %i.05, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32 %67}, i64 0, metadata !25), !dbg !84
  %68 = getelementptr inbounds float* %mik.06, i64 1, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %68}, i64 0, metadata !36), !dbg !84
  %exitcond = icmp eq i32 %67, %2, !dbg !84
  br i1 %exitcond, label %.preheader, label %.lr.ph, !dbg !84, !llvm.loop !89

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ %indvars.iv, %.lr.ph12.preheader ]
  %69 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv22, !dbg !61
  %70 = load float** %69, align 8, !dbg !61, !tbaa !53
  %71 = getelementptr inbounds float* %70, i64 %indvars.iv25, !dbg !61
  %72 = load float* %71, align 4, !dbg !61, !tbaa !74
  tail call void @llvm.dbg.value(metadata !{float %72}, i64 0, metadata !32), !dbg !61
  br i1 %32, label %73, label %.lr.ph10, !dbg !90

; <label>:73                                      ; preds = %.lr.ph12
  %74 = getelementptr inbounds float* %70, i64 %27, !dbg !92
  %75 = load float* %74, align 4, !dbg !92, !tbaa !74
  store float %75, float* %71, align 4, !dbg !92, !tbaa !74
  store float %72, float* %74, align 4, !dbg !94, !tbaa !74
  %76 = load float* %71, align 4, !dbg !95, !tbaa !74
  tail call void @llvm.dbg.value(metadata !{float %76}, i64 0, metadata !32), !dbg !95
  br label %.lr.ph10, !dbg !96

.lr.ph10:                                         ; preds = %.lr.ph12, %73
  %t.0 = phi float [ %76, %73 ], [ %72, %.lr.ph12 ]
  tail call void @llvm.dbg.value(metadata !{float* %77}, i64 0, metadata !35), !dbg !97
  tail call void @llvm.dbg.value(metadata !{float* %38}, i64 0, metadata !36), !dbg !97
  %77 = getelementptr inbounds float* %70, i64 %37, !dbg !97
  %78 = and i64 %37, 4294967295, !dbg !97
  %end.idx = add i64 %60, %78, !dbg !84
  %n.vec = and i64 %60, -4, !dbg !84
  %end.idx.rnd.down = add i64 %n.vec, %78, !dbg !84
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !84
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph10
  %scevgep37.sum = add i64 %64, 1
  %scevgep34.sum = add i64 %indvars.iv25, 1
  %scevgep38 = getelementptr float* %70, i64 %scevgep37.sum
  %scevgep35 = getelementptr float* %70, i64 %scevgep34.sum
  %bound1 = icmp ule float* %scevgep41, %scevgep38
  %bound0 = icmp ule float* %scevgep35, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  %.sum136 = add i64 %37, %n.vec
  %ptr.ind.end = getelementptr float* %19, i64 %.sum136
  %.sum137 = add i64 %37, %n.vec
  %ptr.ind.end47 = getelementptr float* %70, i64 %.sum137
  %79 = trunc i64 %end.idx.rnd.down to i32
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert71 = insertelement <4 x float> undef, float %t.0, i32 0
  %broadcast.splat72 = shufflevector <4 x float> %broadcast.splatinsert71, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %78, %vector.ph ], [ %index.next, %vector.body ], !dbg !84
  %normalized.idx = sub i64 %index, %78
  %.sum138 = add i64 %37, %normalized.idx
  %next.gep = getelementptr float* %19, i64 %.sum138
  %normalized.idx58 = sub i64 %index, %78
  %.sum142 = add i64 %37, %normalized.idx58
  %next.gep60 = getelementptr float* %70, i64 %.sum142
  %80 = bitcast float* %next.gep to <4 x float>*, !dbg !99
  %wide.load = load <4 x float>* %80, align 4, !dbg !99
  %81 = fmul <4 x float> %broadcast.splat72, %wide.load, !dbg !99
  %82 = bitcast float* %next.gep60 to <4 x float>*, !dbg !99
  %wide.load73 = load <4 x float>* %82, align 4, !dbg !99
  %83 = fadd <4 x float> %wide.load73, %81, !dbg !99
  %84 = bitcast float* %next.gep60 to <4 x float>*, !dbg !99
  store <4 x float> %83, <4 x float>* %84, align 4, !dbg !99
  %index.next = add i64 %index, 4, !dbg !84
  %85 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !84
  br i1 %85, label %middle.block, label %vector.body, !dbg !84, !llvm.loop !100

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph10
  %resume.val = phi float* [ %38, %.lr.ph10 ], [ %38, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val46 = phi float* [ %77, %.lr.ph10 ], [ %77, %vector.memcheck ], [ %ptr.ind.end47, %vector.body ]
  %resume.val48 = phi i64 [ %78, %.lr.ph10 ], [ %78, %vector.memcheck ], [ %end.idx.rnd.down, %vector.body ]
  %trunc.resume.val = phi i32 [ %39, %.lr.ph10 ], [ %39, %vector.memcheck ], [ %79, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val48
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %mik.19 = phi float* [ %92, %scalar.ph ], [ %resume.val, %middle.block ]
  %aij.08 = phi float* [ %91, %scalar.ph ], [ %resume.val46, %middle.block ]
  %i.17 = phi i32 [ %90, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %86 = load float* %mik.19, align 4, !dbg !99, !tbaa !74
  %87 = fmul float %t.0, %86, !dbg !99
  %88 = load float* %aij.08, align 4, !dbg !99, !tbaa !74
  %89 = fadd float %88, %87, !dbg !99
  store float %89, float* %aij.08, align 4, !dbg !99, !tbaa !74
  %90 = add nsw i32 %i.17, 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %90}, i64 0, metadata !25), !dbg !97
  %91 = getelementptr inbounds float* %aij.08, i64 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{float* %91}, i64 0, metadata !35), !dbg !97
  %92 = getelementptr inbounds float* %mik.19, i64 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{float* %92}, i64 0, metadata !36), !dbg !97
  %exitcond21 = icmp eq i32 %90, %2, !dbg !97
  br i1 %exitcond21, label %._crit_edge, label %scalar.ph, !dbg !97, !llvm.loop !101

._crit_edge:                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !88
  %lftr.wideiv = trunc i64 %indvars.iv.next23 to i32, !dbg !88
  %exitcond24 = icmp eq i32 %lftr.wideiv, %2, !dbg !88
  br i1 %exitcond24, label %.loopexit, label %.lr.ph12, !dbg !88

.loopexit:                                        ; preds = %._crit_edge, %._crit_edge30, %.preheader, %._crit_edge33
  %lftr.wideiv27.pre-phi = phi i32 [ %lftr.wideiv27.pre, %._crit_edge33 ], [ %39, %.preheader ], [ %39, %._crit_edge30 ], [ %39, %._crit_edge ], !dbg !59
  %indvars.iv.next26.pre-phi = phi i64 [ %indvars.iv.next26.pre, %._crit_edge33 ], [ %37, %.preheader ], [ %37, %._crit_edge30 ], [ %37, %._crit_edge ], !dbg !59
  %info.1 = phi i32 [ %22, %._crit_edge33 ], [ %info.015, %.preheader ], [ %info.015, %._crit_edge30 ], [ %info.015, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep}, i64 0, metadata !24), !dbg !59
  %exitcond28 = icmp eq i32 %lftr.wideiv27.pre-phi, %7, !dbg !59
  br i1 %exitcond28, label %..loopexit4_crit_edge, label %._crit_edge29, !dbg !59

._crit_edge29:                                    ; preds = %.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !59
  %93 = getelementptr inbounds i32* %.0116, i64 1, !dbg !59
  %.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next26.pre-phi
  %.pre = load float** %.phi.trans.insert, align 8, !dbg !67, !tbaa !53
  br label %18, !dbg !59

..loopexit4_crit_edge:                            ; preds = %.loopexit
  %scevgep = getelementptr i32* %ipvt, i64 %14
  br label %.loopexit4, !dbg !59

.loopexit4:                                       ; preds = %6, %..loopexit4_crit_edge
  %info.2 = phi i32 [ 0, %6 ], [ %info.1, %..loopexit4_crit_edge ]
  %.1 = phi i32* [ %ipvt, %6 ], [ %scevgep, %..loopexit4_crit_edge ]
  %akk.1 = phi float* [ %9, %6 ], [ %21, %..loopexit4_crit_edge ]
  store i32 %7, i32* %.1, align 4, !dbg !102, !tbaa !70
  %94 = load float* %akk.1, align 4, !dbg !103, !tbaa !74
  %95 = fcmp oeq float %94, 0.000000e+00, !dbg !103
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !30), !dbg !103
  %info.3 = select i1 %95, i32 %2, i32 %info.2, !dbg !103
  br label %96, !dbg !103

; <label>:96                                      ; preds = %.loopexit4, %0
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
!89 = metadata !{metadata !89, metadata !86, metadata !87}
!90 = metadata !{i32 93, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !62, i32 93, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!92 = metadata !{i32 94, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !91, i32 93, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!94 = metadata !{i32 95, i32 0, metadata !93, null}
!95 = metadata !{i32 96, i32 0, metadata !93, null}
!96 = metadata !{i32 97, i32 0, metadata !93, null}
!97 = metadata !{i32 98, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !62, i32 98, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!99 = metadata !{i32 99, i32 0, metadata !98, null}
!100 = metadata !{metadata !100, metadata !86, metadata !87}
!101 = metadata !{metadata !101, metadata !86, metadata !87}
!102 = metadata !{i32 104, i32 0, metadata !4, null}
!103 = metadata !{i32 105, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!105 = metadata !{i32 107, i32 0, metadata !4, null}
