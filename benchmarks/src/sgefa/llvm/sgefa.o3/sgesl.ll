; ModuleID = 'sgesl.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgesl(%struct.FULL* nocapture readonly %a, i32* nocapture readonly %ipvt, float* nocapture %b, i32 %job) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !25), !dbg !42
  tail call void @llvm.dbg.value(metadata !{i32 %job}, i64 0, metadata !26), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !43
  %2 = load i32* %1, align 4, !dbg !43, !tbaa !44
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !35), !dbg !43
  %3 = add i32 %2, -1, !dbg !49
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !36), !dbg !49
  %4 = icmp eq i32 %job, 0, !dbg !50
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !33), !dbg !53
  br i1 %4, label %.preheader4, label %.preheader6, !dbg !50

.preheader6:                                      ; preds = %0
  %5 = icmp sgt i32 %2, 0, !dbg !56
  br i1 %5, label %.lr.ph40, label %._crit_edge41, !dbg !56

.preheader4:                                      ; preds = %0
  %6 = icmp sgt i32 %3, 0, !dbg !53
  br i1 %6, label %.lr.ph18.preheader, label %.preheader, !dbg !53

.lr.ph18.preheader:                               ; preds = %.preheader4
  %7 = add i32 %2, -2, !dbg !58
  %8 = zext i32 %7 to i64
  %9 = zext i32 %7 to i64
  br label %.lr.ph18, !dbg !58

.preheader:                                       ; preds = %._crit_edge15, %.preheader4
  %10 = icmp sgt i32 %2, 0, !dbg !60
  br i1 %10, label %.lr.ph10, label %.loopexit, !dbg !60

.lr.ph10:                                         ; preds = %.preheader
  %11 = sext i32 %2 to i64
  br label %55, !dbg !60

.lr.ph18:                                         ; preds = %.lr.ph18.preheader, %._crit_edge15
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge15 ], [ 0, %.lr.ph18.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge15 ], [ 1, %.lr.ph18.preheader ]
  %.0117 = phi i32* [ %54, %._crit_edge15 ], [ %ipvt, %.lr.ph18.preheader ]
  %12 = add i64 %indvars.iv53, 1, !dbg !58
  %scevgep = getelementptr float* %b, i64 %12
  %13 = sub i64 %9, %indvars.iv53, !dbg !58
  %14 = and i64 %13, 4294967295
  %scevgep.sum = add i64 %12, %14
  %scevgep73 = getelementptr float* %b, i64 %scevgep.sum
  %15 = add i64 %12, %14, !dbg !58
  %16 = sub i64 %8, %indvars.iv53, !dbg !58
  %17 = and i64 %16, 4294967295
  %18 = add i64 %17, 1, !dbg !58
  %19 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv53, !dbg !58
  %20 = load float** %19, align 8, !dbg !58, !tbaa !62
  %21 = load i32* %.0117, align 4, !dbg !64, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !34), !dbg !64
  %22 = sext i32 %21 to i64, !dbg !66
  %23 = getelementptr inbounds float* %b, i64 %22, !dbg !66
  %24 = load float* %23, align 4, !dbg !66, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %24}, i64 0, metadata !27), !dbg !66
  %25 = trunc i64 %indvars.iv53 to i32, !dbg !69
  %26 = icmp eq i32 %21, %25, !dbg !69
  br i1 %26, label %30, label %27, !dbg !69

; <label>:27                                      ; preds = %.lr.ph18
  %28 = getelementptr inbounds float* %b, i64 %indvars.iv53, !dbg !71
  %29 = load float* %28, align 4, !dbg !71, !tbaa !67
  store float %29, float* %23, align 4, !dbg !71, !tbaa !67
  store float %24, float* %28, align 4, !dbg !73, !tbaa !67
  br label %30, !dbg !74

; <label>:30                                      ; preds = %.lr.ph18, %27
  %indvars.iv.next54 = add i64 %indvars.iv53, 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{float* %33}, i64 0, metadata !29), !dbg !75
  %31 = trunc i64 %indvars.iv.next54 to i32, !dbg !75
  %32 = icmp slt i32 %31, %2, !dbg !75
  br i1 %32, label %.lr.ph14, label %._crit_edge15, !dbg !75

.lr.ph14:                                         ; preds = %30
  %33 = getelementptr inbounds float* %20, i64 %indvars.iv.next54, !dbg !75
  %end.idx = add i64 %18, %indvars.iv47, !dbg !75
  %fold = add i64 %16, 1, !dbg !75
  %n.mod.vf = and i64 %fold, 7, !dbg !75
  %n.vec = sub i64 %18, %n.mod.vf, !dbg !75
  %end.idx.rnd.down = add i64 %n.vec, %indvars.iv47, !dbg !75
  %cmp.zero = icmp eq i64 %18, %n.mod.vf, !dbg !75
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph14
  %scevgep77 = getelementptr float* %20, i64 %15
  %scevgep75 = getelementptr float* %20, i64 %12
  %bound1 = icmp ule float* %scevgep75, %scevgep73
  %bound0 = icmp ule float* %scevgep, %scevgep77
  %memcheck.conflict = and i1 %bound0, %bound1
  %.sum109 = add i64 %indvars.iv.next54, %n.vec
  %ptr.ind.end = getelementptr float* %20, i64 %.sum109
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert103 = insertelement <4 x float> undef, float %24, i32 0
  %broadcast.splat104 = shufflevector <4 x float> %broadcast.splatinsert103, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %indvars.iv47, %vector.ph ], [ %index.next, %vector.body ], !dbg !75
  %normalized.idx = sub i64 %index, %indvars.iv47
  %.sum110 = add i64 %indvars.iv.next54, %normalized.idx
  %next.gep = getelementptr float* %20, i64 %.sum110
  %34 = bitcast float* %next.gep to <4 x float>*, !dbg !77
  %wide.load = load <4 x float>* %34, align 4, !dbg !77
  %next.gep.sum = add i64 %.sum110, 4, !dbg !77
  %35 = getelementptr float* %20, i64 %next.gep.sum, !dbg !77
  %36 = bitcast float* %35 to <4 x float>*, !dbg !77
  %wide.load102 = load <4 x float>* %36, align 4, !dbg !77
  %37 = fmul <4 x float> %broadcast.splat104, %wide.load, !dbg !77
  %38 = fmul <4 x float> %broadcast.splat104, %wide.load102, !dbg !77
  %39 = getelementptr inbounds float* %b, i64 %index, !dbg !77
  %40 = bitcast float* %39 to <4 x float>*, !dbg !77
  %wide.load105 = load <4 x float>* %40, align 4, !dbg !77
  %.sum118 = add i64 %index, 4, !dbg !77
  %41 = getelementptr float* %b, i64 %.sum118, !dbg !77
  %42 = bitcast float* %41 to <4 x float>*, !dbg !77
  %wide.load106 = load <4 x float>* %42, align 4, !dbg !77
  %43 = fadd <4 x float> %wide.load105, %37, !dbg !77
  %44 = fadd <4 x float> %wide.load106, %38, !dbg !77
  %45 = bitcast float* %39 to <4 x float>*, !dbg !77
  store <4 x float> %43, <4 x float>* %45, align 4, !dbg !77
  %46 = bitcast float* %41 to <4 x float>*, !dbg !77
  store <4 x float> %44, <4 x float>* %46, align 4, !dbg !77
  %index.next = add i64 %index, 8, !dbg !75
  %47 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !75
  br i1 %47, label %middle.block, label %vector.body, !dbg !75, !llvm.loop !78

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph14
  %resume.val = phi i64 [ %indvars.iv47, %.lr.ph14 ], [ %indvars.iv47, %vector.memcheck ], [ %end.idx.rnd.down, %vector.body ]
  %resume.val79 = phi float* [ %33, %.lr.ph14 ], [ %33, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge15, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %scalar.ph ], [ %resume.val, %middle.block ]
  %mik.011 = phi float* [ %53, %scalar.ph ], [ %resume.val79, %middle.block ]
  %48 = load float* %mik.011, align 4, !dbg !77, !tbaa !67
  %49 = fmul float %24, %48, !dbg !77
  %50 = getelementptr inbounds float* %b, i64 %indvars.iv49, !dbg !77
  %51 = load float* %50, align 4, !dbg !77, !tbaa !67
  %52 = fadd float %51, %49, !dbg !77
  store float %52, float* %50, align 4, !dbg !77, !tbaa !67
  %53 = getelementptr inbounds float* %mik.011, i64 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !{float* %53}, i64 0, metadata !29), !dbg !75
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !75
  %lftr.wideiv51 = trunc i64 %indvars.iv.next50 to i32, !dbg !75
  %exitcond52 = icmp eq i32 %lftr.wideiv51, %2, !dbg !75
  br i1 %exitcond52, label %._crit_edge15, label %scalar.ph, !dbg !75, !llvm.loop !81

._crit_edge15:                                    ; preds = %scalar.ph, %middle.block, %30
  %54 = getelementptr inbounds i32* %.0117, i64 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{i32* %54}, i64 0, metadata !24), !dbg !53
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1, !dbg !53
  %exitcond56 = icmp eq i32 %31, %3, !dbg !53
  br i1 %exitcond56, label %.preheader, label %.lr.ph18, !dbg !53

; <label>:55                                      ; preds = %.lr.ph10, %._crit_edge
  %indvars.iv45.in = phi i64 [ %11, %.lr.ph10 ], [ %indvars.iv45, %._crit_edge ]
  %indvars.iv43 = phi i32 [ %3, %.lr.ph10 ], [ %indvars.iv.next44, %._crit_edge ]
  %indvars.iv45 = add i64 %indvars.iv45.in, -1, !dbg !60
  %56 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv45, !dbg !82
  %57 = load float** %56, align 8, !dbg !82, !tbaa !62
  %58 = getelementptr inbounds float* %57, i64 %indvars.iv45, !dbg !82
  tail call void @llvm.dbg.value(metadata !{float* %58}, i64 0, metadata !28), !dbg !82
  %59 = load float* %58, align 4, !dbg !84, !tbaa !67
  %60 = getelementptr inbounds float* %b, i64 %indvars.iv45, !dbg !84
  %61 = load float* %60, align 4, !dbg !84, !tbaa !67
  %62 = fdiv float %61, %59, !dbg !84
  store float %62, float* %60, align 4, !dbg !84, !tbaa !67
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !85
  tail call void @llvm.dbg.value(metadata !{float* %57}, i64 0, metadata !30), !dbg !85
  %63 = trunc i64 %indvars.iv45 to i32, !dbg !85
  %64 = icmp sgt i32 %63, 0, !dbg !85
  br i1 %64, label %.lr.ph, label %.loopexit, !dbg !85

.lr.ph:                                           ; preds = %55, %._crit_edge68
  %65 = phi float [ %.pre, %._crit_edge68 ], [ %62, %55 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge68 ], [ 0, %55 ]
  %uik.07 = phi float* [ %71, %._crit_edge68 ], [ %57, %55 ]
  %66 = load float* %uik.07, align 4, !dbg !87, !tbaa !67
  %67 = fmul float %66, %65, !dbg !87
  %68 = getelementptr inbounds float* %b, i64 %indvars.iv, !dbg !87
  %69 = load float* %68, align 4, !dbg !87, !tbaa !67
  %70 = fsub float %69, %67, !dbg !87
  store float %70, float* %68, align 4, !dbg !87, !tbaa !67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !85
  tail call void @llvm.dbg.value(metadata !{float* %71}, i64 0, metadata !30), !dbg !85
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !85
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv43, !dbg !85
  br i1 %exitcond, label %._crit_edge, label %._crit_edge68, !dbg !85

._crit_edge68:                                    ; preds = %.lr.ph
  %71 = getelementptr inbounds float* %uik.07, i64 1, !dbg !85
  %.pre = load float* %60, align 4, !dbg !87, !tbaa !67
  br label %.lr.ph, !dbg !85

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next44 = add nsw i32 %indvars.iv43, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next44}, i64 0, metadata !33), !dbg !60
  br i1 %64, label %55, label %.loopexit, !dbg !60

.lr.ph40:                                         ; preds = %.preheader6, %._crit_edge37
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge37 ], [ 0, %.preheader6 ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge37 ], [ 0, %.preheader6 ]
  %72 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv64, !dbg !88
  %73 = load float** %72, align 8, !dbg !88, !tbaa !62
  %74 = getelementptr inbounds float* %73, i64 %indvars.iv64, !dbg !88
  tail call void @llvm.dbg.value(metadata !{float* %74}, i64 0, metadata !28), !dbg !88
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !90
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !27), !dbg !90
  tail call void @llvm.dbg.value(metadata !{float* %73}, i64 0, metadata !30), !dbg !90
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !31), !dbg !90
  %75 = trunc i64 %indvars.iv64 to i32, !dbg !90
  %76 = icmp sgt i32 %75, 0, !dbg !90
  br i1 %76, label %.lr.ph36, label %._crit_edge37, !dbg !90

.lr.ph36:                                         ; preds = %.lr.ph40, %.lr.ph36
  %i.234 = phi i32 [ %81, %.lr.ph36 ], [ 0, %.lr.ph40 ]
  %bi.033 = phi float* [ %83, %.lr.ph36 ], [ %b, %.lr.ph40 ]
  %uik.132 = phi float* [ %82, %.lr.ph36 ], [ %73, %.lr.ph40 ]
  %t.031 = phi float [ %80, %.lr.ph36 ], [ 0.000000e+00, %.lr.ph40 ]
  %77 = load float* %uik.132, align 4, !dbg !93, !tbaa !67
  %78 = load float* %bi.033, align 4, !dbg !93, !tbaa !67
  %79 = fmul float %77, %78, !dbg !93
  %80 = fadd float %t.031, %79, !dbg !93
  tail call void @llvm.dbg.value(metadata !{float %80}, i64 0, metadata !27), !dbg !93
  %81 = add nsw i32 %i.234, 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32 %81}, i64 0, metadata !32), !dbg !90
  %82 = getelementptr inbounds float* %uik.132, i64 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !{float* %82}, i64 0, metadata !30), !dbg !90
  %83 = getelementptr inbounds float* %bi.033, i64 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !{float* %83}, i64 0, metadata !31), !dbg !90
  %exitcond63 = icmp eq i32 %81, %indvars.iv61, !dbg !90
  br i1 %exitcond63, label %._crit_edge37, label %.lr.ph36, !dbg !90

._crit_edge37:                                    ; preds = %.lr.ph36, %.lr.ph40
  %t.0.lcssa = phi float [ 0.000000e+00, %.lr.ph40 ], [ %80, %.lr.ph36 ]
  %84 = getelementptr inbounds float* %b, i64 %indvars.iv64, !dbg !94
  %85 = load float* %84, align 4, !dbg !94, !tbaa !67
  %86 = fsub float %85, %t.0.lcssa, !dbg !94
  %87 = load float* %74, align 4, !dbg !94, !tbaa !67
  %88 = fdiv float %86, %87, !dbg !94
  store float %88, float* %84, align 4, !dbg !94, !tbaa !67
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1, !dbg !56
  %indvars.iv.next62 = add nuw nsw i32 %indvars.iv61, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next62}, i64 0, metadata !33), !dbg !56
  %lftr.wideiv66 = trunc i64 %indvars.iv.next65 to i32, !dbg !56
  %exitcond67 = icmp eq i32 %lftr.wideiv66, %2, !dbg !56
  br i1 %exitcond67, label %._crit_edge41, label %.lr.ph40, !dbg !56

._crit_edge41:                                    ; preds = %._crit_edge37, %.preheader6
  %89 = add i32 %2, -2, !dbg !95
  tail call void @llvm.dbg.value(metadata !{i32* %92}, i64 0, metadata !24), !dbg !95
  tail call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !33), !dbg !96
  %90 = icmp sgt i32 %89, -1, !dbg !96
  br i1 %90, label %.lr.ph30, label %.loopexit, !dbg !96

.lr.ph30:                                         ; preds = %._crit_edge41
  %91 = sext i32 %89 to i64, !dbg !95
  %92 = getelementptr inbounds i32* %ipvt, i64 %91, !dbg !95
  br label %93, !dbg !96

; <label>:93                                      ; preds = %.lr.ph30, %117
  %indvars.iv58 = phi i64 [ %91, %.lr.ph30 ], [ %indvars.iv.next59, %117 ]
  %.128 = phi i32* [ %92, %.lr.ph30 ], [ %118, %117 ]
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !27), !dbg !98
  %.sum = add i64 %indvars.iv58, 1, !dbg !98
  tail call void @llvm.dbg.value(metadata !{float* %100}, i64 0, metadata !29), !dbg !98
  %94 = getelementptr inbounds float* %b, i64 %indvars.iv58, !dbg !98
  tail call void @llvm.dbg.value(metadata !{float* %99}, i64 0, metadata !31), !dbg !98
  %95 = trunc i64 %.sum to i32, !dbg !98
  %96 = icmp slt i32 %95, %2, !dbg !98
  br i1 %96, label %.lr.ph25, label %._crit_edge26, !dbg !98

.lr.ph25:                                         ; preds = %93
  %97 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv58, !dbg !98
  %98 = load float** %97, align 8, !dbg !98, !tbaa !62
  %99 = getelementptr inbounds float* %b, i64 %.sum, !dbg !98
  %100 = getelementptr inbounds float* %98, i64 %.sum, !dbg !98
  br label %101, !dbg !98

; <label>:101                                     ; preds = %101, %.lr.ph25
  %i.323 = phi i32 [ %95, %.lr.ph25 ], [ %i.3, %101 ]
  %bi.122 = phi float* [ %99, %.lr.ph25 ], [ %107, %101 ]
  %mik.121 = phi float* [ %100, %.lr.ph25 ], [ %106, %101 ]
  %t.120 = phi float [ 0.000000e+00, %.lr.ph25 ], [ %105, %101 ]
  %102 = load float* %mik.121, align 4, !dbg !101, !tbaa !67
  %103 = load float* %bi.122, align 4, !dbg !101, !tbaa !67
  %104 = fmul float %102, %103, !dbg !101
  %105 = fadd float %t.120, %104, !dbg !101
  tail call void @llvm.dbg.value(metadata !{float %105}, i64 0, metadata !27), !dbg !101
  %106 = getelementptr inbounds float* %mik.121, i64 1, !dbg !98
  tail call void @llvm.dbg.value(metadata !{float* %106}, i64 0, metadata !29), !dbg !98
  %107 = getelementptr inbounds float* %bi.122, i64 1, !dbg !98
  tail call void @llvm.dbg.value(metadata !{float* %107}, i64 0, metadata !31), !dbg !98
  %i.3 = add nsw i32 %i.323, 1, !dbg !98
  %exitcond57 = icmp eq i32 %i.3, %2, !dbg !98
  br i1 %exitcond57, label %._crit_edge26, label %101, !dbg !98

._crit_edge26:                                    ; preds = %101, %93
  %t.1.lcssa = phi float [ 0.000000e+00, %93 ], [ %105, %101 ]
  %108 = load float* %94, align 4, !dbg !102, !tbaa !67
  %109 = fadd float %t.1.lcssa, %108, !dbg !102
  store float %109, float* %94, align 4, !dbg !102, !tbaa !67
  %110 = load i32* %.128, align 4, !dbg !103, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !34), !dbg !103
  %111 = trunc i64 %indvars.iv58 to i32, !dbg !104
  %112 = icmp eq i32 %110, %111, !dbg !104
  br i1 %112, label %117, label %113, !dbg !104

; <label>:113                                     ; preds = %._crit_edge26
  %114 = sext i32 %110 to i64, !dbg !106
  %115 = getelementptr inbounds float* %b, i64 %114, !dbg !106
  %116 = load float* %115, align 4, !dbg !106, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %116}, i64 0, metadata !27), !dbg !106
  store float %109, float* %115, align 4, !dbg !107, !tbaa !67
  store float %116, float* %94, align 4, !dbg !108, !tbaa !67
  br label %117, !dbg !109

; <label>:117                                     ; preds = %._crit_edge26, %113
  %118 = getelementptr inbounds i32* %.128, i64 -1, !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32* %118}, i64 0, metadata !24), !dbg !96
  %119 = icmp sgt i32 %111, 0, !dbg !96
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, -1, !dbg !96
  br i1 %119, label %93, label %.loopexit, !dbg !96

.loopexit:                                        ; preds = %117, %55, %._crit_edge, %._crit_edge41, %.preheader
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sgesl.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sgesl", metadata !"sgesl", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, i32*, float*, i32)* @sgesl, null, null, metadata !22, i32 42} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 42] [sgesl]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !21, metadata !17, metadata !8}
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
!25 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 50331662, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 14]
!26 = metadata !{i32 786689, metadata !4, metadata !"job", metadata !5, i32 67108877, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [job] [line 13]
!27 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 43, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 43]
!28 = metadata !{i32 786688, metadata !4, metadata !"akk", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [akk] [line 44]
!29 = metadata !{i32 786688, metadata !4, metadata !"mik", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mik] [line 44]
!30 = metadata !{i32 786688, metadata !4, metadata !"uik", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uik] [line 44]
!31 = metadata !{i32 786688, metadata !4, metadata !"bi", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bi] [line 44]
!32 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 45]
!33 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 45]
!34 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 46]
!35 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 46]
!36 = metadata !{i32 786688, metadata !4, metadata !"nm1", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 46]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 12, i32 0, metadata !4, null}
!41 = metadata !{i32 13, i32 0, metadata !4, null}
!42 = metadata !{i32 14, i32 0, metadata !4, null}
!43 = metadata !{i32 48, i32 0, metadata !4, null}
!44 = metadata !{metadata !45, metadata !46, i64 0}
!45 = metadata !{metadata !"FULL", metadata !46, i64 0, metadata !46, i64 4, metadata !47, i64 8}
!46 = metadata !{metadata !"int", metadata !47, i64 0}
!47 = metadata !{metadata !"omnipotent char", metadata !48, i64 0}
!48 = metadata !{metadata !"Simple C/C++ TBAA"}
!49 = metadata !{i32 49, i32 0, metadata !4, null}
!50 = metadata !{i32 52, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !4, i32 52, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!52 = metadata !{i32 0}
!53 = metadata !{i32 54, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 54, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!55 = metadata !{i32 786443, metadata !1, metadata !51, i32 52, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!56 = metadata !{i32 80, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !4, i32 80, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!58 = metadata !{i32 55, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !54, i32 54, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!60 = metadata !{i32 69, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !55, i32 69, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!62 = metadata !{metadata !63, metadata !63, i64 0}
!63 = metadata !{metadata !"any pointer", metadata !47, i64 0}
!64 = metadata !{i32 58, i32 0, metadata !59, null} ; [ DW_TAG_imported_module ]
!65 = metadata !{metadata !46, metadata !46, i64 0}
!66 = metadata !{i32 59, i32 0, metadata !59, null}
!67 = metadata !{metadata !68, metadata !68, i64 0}
!68 = metadata !{metadata !"float", metadata !47, i64 0}
!69 = metadata !{i32 60, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !59, i32 60, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!71 = metadata !{i32 61, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !70, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!73 = metadata !{i32 62, i32 0, metadata !72, null}
!74 = metadata !{i32 63, i32 0, metadata !72, null}
!75 = metadata !{i32 64, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !59, i32 64, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!77 = metadata !{i32 65, i32 0, metadata !76, null}
!78 = metadata !{metadata !78, metadata !79, metadata !80}
!79 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!80 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!81 = metadata !{metadata !81, metadata !79, metadata !80}
!82 = metadata !{i32 70, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !61, i32 69, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!84 = metadata !{i32 71, i32 0, metadata !83, null}
!85 = metadata !{i32 72, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !83, i32 72, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!87 = metadata !{i32 73, i32 0, metadata !86, null}
!88 = metadata !{i32 81, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !57, i32 80, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!90 = metadata !{i32 82, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 82, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!92 = metadata !{float 0.000000e+00}
!93 = metadata !{i32 83, i32 0, metadata !91, null}
!94 = metadata !{i32 84, i32 0, metadata !89, null}
!95 = metadata !{i32 89, i32 0, metadata !4, null}
!96 = metadata !{i32 90, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !4, i32 90, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!98 = metadata !{i32 91, i32 0, metadata !99, null}
!99 = metadata !{i32 786443, metadata !1, metadata !100, i32 91, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!100 = metadata !{i32 786443, metadata !1, metadata !97, i32 90, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!101 = metadata !{i32 92, i32 0, metadata !99, null}
!102 = metadata !{i32 93, i32 0, metadata !100, null}
!103 = metadata !{i32 96, i32 0, metadata !100, null}
!104 = metadata !{i32 97, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !100, i32 97, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!106 = metadata !{i32 98, i32 0, metadata !100, null}
!107 = metadata !{i32 99, i32 0, metadata !100, null}
!108 = metadata !{i32 100, i32 0, metadata !100, null}
!109 = metadata !{i32 101, i32 0, metadata !100, null}
!110 = metadata !{i32 103, i32 0, metadata !4, null}
