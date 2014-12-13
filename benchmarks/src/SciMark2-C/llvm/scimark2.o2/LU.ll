; ModuleID = 'LU.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define double @LU_num_flops(i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !11), !dbg !63
  %1 = sitofp i32 %N to double, !dbg !64
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !12), !dbg !64
  %2 = fmul double %1, 2.000000e+00, !dbg !65
  %3 = fmul double %1, %2, !dbg !65
  %4 = fmul double %1, %3, !dbg !65
  %5 = fdiv double %4, 3.000000e+00, !dbg !65
  ret double %5, !dbg !65
}

; Function Attrs: nounwind uwtable
define void @LU_copy_matrix(i32 %M, i32 %N, double** nocapture readonly %lu, double** nocapture readonly %A) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !19), !dbg !66
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !20), !dbg !66
  tail call void @llvm.dbg.value(metadata !{double** %lu}, i64 0, metadata !21), !dbg !66
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !22), !dbg !66
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !23), !dbg !68
  %1 = icmp sgt i32 %M, 0, !dbg !68
  br i1 %1, label %.preheader.lr.ph, label %._crit_edge3, !dbg !68

.preheader.lr.ph:                                 ; preds = %0
  %2 = icmp sgt i32 %N, 0, !dbg !70
  %3 = add i32 %N, -1, !dbg !68
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 1, !dbg !68
  %6 = zext i32 %3 to i64
  br label %.preheader, !dbg !68

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv4 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next5, %._crit_edge ]
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !70

.lr.ph:                                           ; preds = %.preheader
  %7 = getelementptr inbounds double** %A, i64 %indvars.iv4, !dbg !72
  %8 = load double** %7, align 8, !dbg !72, !tbaa !73
  %9 = getelementptr inbounds double** %lu, i64 %indvars.iv4, !dbg !72
  %10 = load double** %9, align 8, !dbg !72, !tbaa !73
  %end.idx = add i64 %4, 1, !dbg !70
  %n.vec = and i64 %5, 8589934588, !dbg !70
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !70
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph
  %scevgep9 = getelementptr double* %8, i64 %6
  %scevgep = getelementptr double* %10, i64 %6
  %bound1 = icmp ule double* %8, %scevgep
  %bound0 = icmp ule double* %10, %scevgep9
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ], !dbg !70
  %11 = getelementptr inbounds double* %8, i64 %index, !dbg !72
  %12 = bitcast double* %11 to <2 x double>*, !dbg !72
  %wide.load = load <2 x double>* %12, align 8, !dbg !72
  %.sum15 = or i64 %index, 2, !dbg !72
  %13 = getelementptr double* %8, i64 %.sum15, !dbg !72
  %14 = bitcast double* %13 to <2 x double>*, !dbg !72
  %wide.load12 = load <2 x double>* %14, align 8, !dbg !72
  %15 = getelementptr inbounds double* %10, i64 %index, !dbg !72
  %16 = bitcast double* %15 to <2 x double>*, !dbg !72
  store <2 x double> %wide.load, <2 x double>* %16, align 8, !dbg !72
  %.sum16 = or i64 %index, 2, !dbg !72
  %17 = getelementptr double* %10, i64 %.sum16, !dbg !72
  %18 = bitcast double* %17 to <2 x double>*, !dbg !72
  store <2 x double> %wide.load12, <2 x double>* %18, align 8, !dbg !72
  %index.next = add i64 %index, 4, !dbg !70
  %19 = icmp eq i64 %index.next, %n.vec, !dbg !70
  br i1 %19, label %middle.block, label %vector.body, !dbg !70, !llvm.loop !77

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph
  %resume.val = phi i64 [ 0, %.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %resume.val, %middle.block ]
  %20 = getelementptr inbounds double* %8, i64 %indvars.iv, !dbg !72
  %21 = load double* %20, align 8, !dbg !72, !tbaa !80
  %22 = getelementptr inbounds double* %10, i64 %indvars.iv, !dbg !72
  store double %21, double* %22, align 8, !dbg !72, !tbaa !80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !70
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !70
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !70
  br i1 %exitcond, label %._crit_edge, label %scalar.ph, !dbg !70, !llvm.loop !82

._crit_edge:                                      ; preds = %scalar.ph, %middle.block, %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !68
  %lftr.wideiv6 = trunc i64 %indvars.iv.next5 to i32, !dbg !68
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %M, !dbg !68
  br i1 %exitcond7, label %._crit_edge3, label %.preheader, !dbg !68

._crit_edge3:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define i32 @LU_factor(i32 %M, i32 %N, double** nocapture %A, i32* nocapture %pivot) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !30), !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !31), !dbg !84
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !32), !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32* %pivot}, i64 0, metadata !33), !dbg !84
  %1 = icmp slt i32 %M, %N, !dbg !85
  %2 = select i1 %1, i32 %M, i32 %N, !dbg !85
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !34), !dbg !85
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !35), !dbg !86
  %3 = icmp sgt i32 %2, 0, !dbg !87
  br i1 %3, label %.lr.ph16, label %._crit_edge17, !dbg !87

.lr.ph16:                                         ; preds = %0
  %4 = add nsw i32 %M, -1, !dbg !88
  %5 = add nsw i32 %2, -1, !dbg !89
  %6 = add i32 %N, -2, !dbg !87
  %7 = zext i32 %6 to i64
  %8 = zext i32 %6 to i64
  br label %9, !dbg !87

; <label>:9                                       ; preds = %.lr.ph16, %.backedge
  %indvars.iv41 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next42, %.backedge ]
  %indvars.iv35 = phi i64 [ 1, %.lr.ph16 ], [ %indvars.iv.next36, %.backedge ]
  tail call void @llvm.dbg.value(metadata !90, i64 0, metadata !36), !dbg !91
  %10 = add i64 %indvars.iv41, 1, !dbg !92
  %11 = sub i64 %8, %indvars.iv41, !dbg !92
  %12 = and i64 %11, 4294967295
  %13 = add i64 %10, %12, !dbg !92
  %14 = sub i64 %7, %indvars.iv41, !dbg !92
  %15 = and i64 %14, 4294967295
  %16 = add i64 %15, 1, !dbg !92
  %17 = getelementptr inbounds double** %A, i64 %indvars.iv41, !dbg !92
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !40), !dbg !92
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !87
  %18 = trunc i64 %indvars.iv.next42 to i32, !dbg !93
  %19 = icmp slt i32 %18, %M, !dbg !93
  %20 = trunc i64 %indvars.iv41 to i32, !dbg !93
  br i1 %19, label %.lr.ph, label %._crit_edge, !dbg !93

.lr.ph:                                           ; preds = %9
  %21 = load double** %17, align 8, !dbg !92, !tbaa !73
  %22 = getelementptr inbounds double* %21, i64 %indvars.iv41, !dbg !92
  %23 = load double* %22, align 8, !dbg !92, !tbaa !80
  %24 = tail call double @fabs(double %23) #3, !dbg !92
  br label %25, !dbg !93

; <label>:25                                      ; preds = %25, %.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv35, %.lr.ph ], [ %indvars.iv.next22, %25 ]
  %jp.04 = phi i32 [ %20, %.lr.ph ], [ %jp.1, %25 ]
  %t.02 = phi double [ %24, %.lr.ph ], [ %t.1, %25 ]
  %26 = getelementptr inbounds double** %A, i64 %indvars.iv21, !dbg !94
  %27 = load double** %26, align 8, !dbg !94, !tbaa !73
  %28 = getelementptr inbounds double* %27, i64 %indvars.iv41, !dbg !94
  %29 = load double* %28, align 8, !dbg !94, !tbaa !80
  %30 = tail call double @fabs(double %29) #3, !dbg !94
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !41), !dbg !94
  %31 = fcmp ogt double %30, %t.02, !dbg !95
  tail call void @llvm.dbg.value(metadata !90, i64 0, metadata !36), !dbg !97
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !40), !dbg !99
  %t.1 = select i1 %31, double %30, double %t.02, !dbg !95
  %32 = trunc i64 %indvars.iv21 to i32, !dbg !95
  %jp.1 = select i1 %31, i32 %32, i32 %jp.04, !dbg !95
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !93
  %lftr.wideiv = trunc i64 %indvars.iv.next22 to i32, !dbg !93
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !93
  br i1 %exitcond, label %._crit_edge, label %25, !dbg !93

._crit_edge:                                      ; preds = %25, %9
  %jp.0.lcssa = phi i32 [ %20, %9 ], [ %jp.1, %25 ]
  %33 = getelementptr inbounds i32* %pivot, i64 %indvars.iv41, !dbg !100
  store i32 %jp.0.lcssa, i32* %33, align 4, !dbg !100, !tbaa !101
  %34 = sext i32 %jp.0.lcssa to i64, !dbg !103
  %35 = getelementptr inbounds double** %A, i64 %34, !dbg !103
  %36 = load double** %35, align 8, !dbg !103, !tbaa !73
  %37 = getelementptr inbounds double* %36, i64 %indvars.iv41, !dbg !103
  %38 = load double* %37, align 8, !dbg !103, !tbaa !80
  %39 = fcmp oeq double %38, 0.000000e+00, !dbg !103
  br i1 %39, label %._crit_edge17, label %40, !dbg !103

; <label>:40                                      ; preds = %._crit_edge
  %41 = icmp eq i32 %jp.0.lcssa, %20, !dbg !105
  br i1 %41, label %44, label %42, !dbg !105

; <label>:42                                      ; preds = %40
  %43 = load double** %17, align 8, !dbg !106, !tbaa !73
  tail call void @llvm.dbg.value(metadata !{double* %43}, i64 0, metadata !44), !dbg !106
  store double* %36, double** %17, align 8, !dbg !107, !tbaa !73
  store double* %43, double** %35, align 8, !dbg !108, !tbaa !73
  br label %44, !dbg !109

; <label>:44                                      ; preds = %40, %42
  %45 = icmp slt i32 %20, %4, !dbg !88
  br i1 %45, label %46, label %.loopexit1, !dbg !88

; <label>:46                                      ; preds = %44
  %47 = load double** %17, align 8, !dbg !110, !tbaa !73
  %48 = getelementptr inbounds double* %47, i64 %indvars.iv41, !dbg !110
  %49 = load double* %48, align 8, !dbg !110, !tbaa !80
  %50 = fdiv double 1.000000e+00, %49, !dbg !110
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !47), !dbg !110
  br i1 %19, label %.lr.ph7, label %.loopexit1, !dbg !111

.lr.ph7:                                          ; preds = %46, %.lr.ph7
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph7 ], [ %indvars.iv35, %46 ]
  %51 = getelementptr inbounds double** %A, i64 %indvars.iv25, !dbg !113
  %52 = load double** %51, align 8, !dbg !113, !tbaa !73
  %53 = getelementptr inbounds double* %52, i64 %indvars.iv41, !dbg !113
  %54 = load double* %53, align 8, !dbg !113, !tbaa !80
  %55 = fmul double %50, %54, !dbg !113
  store double %55, double* %53, align 8, !dbg !113, !tbaa !80
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1, !dbg !111
  %lftr.wideiv27 = trunc i64 %indvars.iv.next26 to i32, !dbg !111
  %exitcond28 = icmp eq i32 %lftr.wideiv27, %M, !dbg !111
  br i1 %exitcond28, label %.loopexit1, label %.lr.ph7, !dbg !111

.loopexit1:                                       ; preds = %.lr.ph7, %46, %44
  %.not = icmp sge i32 %20, %5, !dbg !89
  %.not43 = xor i1 %19, true, !dbg !89
  %brmerge = or i1 %.not, %.not43, !dbg !89
  br i1 %brmerge, label %.backedge, label %.lr.ph13, !dbg !89

.backedge:                                        ; preds = %._crit_edge11, %.loopexit1
  %56 = icmp slt i32 %18, %2, !dbg !87
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1, !dbg !87
  br i1 %56, label %9, label %._crit_edge17, !dbg !87

.lr.ph13:                                         ; preds = %.loopexit1
  %57 = load double** %17, align 8, !dbg !114, !tbaa !73
  %58 = icmp slt i32 %18, %N, !dbg !115
  %scevgep47 = getelementptr double* %57, i64 %10
  %scevgep49 = getelementptr double* %57, i64 %13
  br label %59, !dbg !117

; <label>:59                                      ; preds = %._crit_edge11, %.lr.ph13
  %indvars.iv37 = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38, %._crit_edge11 ]
  %60 = getelementptr inbounds double** %A, i64 %indvars.iv37, !dbg !118
  %61 = load double** %60, align 8, !dbg !118, !tbaa !73
  tail call void @llvm.dbg.value(metadata !{double* %61}, i64 0, metadata !54), !dbg !118
  tail call void @llvm.dbg.value(metadata !{double* %57}, i64 0, metadata !57), !dbg !114
  %62 = getelementptr inbounds double* %61, i64 %indvars.iv41, !dbg !119
  %63 = load double* %62, align 8, !dbg !119, !tbaa !80
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !58), !dbg !119
  br i1 %58, label %.lr.ph10.preheader, label %._crit_edge11, !dbg !115

.lr.ph10.preheader:                               ; preds = %59
  %end.idx = add i64 %16, %indvars.iv35, !dbg !115
  %fold = add i64 %14, 1, !dbg !115
  %n.mod.vf = and i64 %fold, 3, !dbg !115
  %n.vec = sub i64 %16, %n.mod.vf, !dbg !115
  %end.idx.rnd.down = add i64 %n.vec, %indvars.iv35, !dbg !115
  %cmp.zero = icmp eq i64 %16, %n.mod.vf, !dbg !115
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph10.preheader
  %scevgep45 = getelementptr double* %61, i64 %13
  %scevgep = getelementptr double* %61, i64 %10
  %bound1 = icmp ule double* %scevgep47, %scevgep45
  %bound0 = icmp ule double* %scevgep, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %63, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %indvars.iv35, %vector.ph ], [ %index.next, %vector.body ], !dbg !115
  %64 = getelementptr inbounds double* %57, i64 %index, !dbg !120
  %65 = bitcast double* %64 to <2 x double>*, !dbg !120
  %wide.load = load <2 x double>* %65, align 8, !dbg !120
  %.sum = add i64 %index, 2, !dbg !120
  %66 = getelementptr double* %57, i64 %.sum, !dbg !120
  %67 = bitcast double* %66 to <2 x double>*, !dbg !120
  %wide.load52 = load <2 x double>* %67, align 8, !dbg !120
  %68 = fmul <2 x double> %broadcast.splat54, %wide.load, !dbg !120
  %69 = fmul <2 x double> %broadcast.splat54, %wide.load52, !dbg !120
  %70 = getelementptr inbounds double* %61, i64 %index, !dbg !120
  %71 = bitcast double* %70 to <2 x double>*, !dbg !120
  %wide.load55 = load <2 x double>* %71, align 8, !dbg !120
  %.sum59 = add i64 %index, 2, !dbg !120
  %72 = getelementptr double* %61, i64 %.sum59, !dbg !120
  %73 = bitcast double* %72 to <2 x double>*, !dbg !120
  %wide.load56 = load <2 x double>* %73, align 8, !dbg !120
  %74 = fsub <2 x double> %wide.load55, %68, !dbg !120
  %75 = fsub <2 x double> %wide.load56, %69, !dbg !120
  %76 = bitcast double* %70 to <2 x double>*, !dbg !120
  store <2 x double> %74, <2 x double>* %76, align 8, !dbg !120
  %77 = bitcast double* %72 to <2 x double>*, !dbg !120
  store <2 x double> %75, <2 x double>* %77, align 8, !dbg !120
  %index.next = add i64 %index, 4, !dbg !115
  %78 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !115
  br i1 %78, label %middle.block, label %vector.body, !dbg !115, !llvm.loop !121

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph10.preheader
  %resume.val = phi i64 [ %indvars.iv35, %.lr.ph10.preheader ], [ %indvars.iv35, %vector.memcheck ], [ %end.idx.rnd.down, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge11, label %.lr.ph10

.lr.ph10:                                         ; preds = %middle.block, %.lr.ph10
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.lr.ph10 ], [ %resume.val, %middle.block ]
  %79 = getelementptr inbounds double* %57, i64 %indvars.iv31, !dbg !120
  %80 = load double* %79, align 8, !dbg !120, !tbaa !80
  %81 = fmul double %63, %80, !dbg !120
  %82 = getelementptr inbounds double* %61, i64 %indvars.iv31, !dbg !120
  %83 = load double* %82, align 8, !dbg !120, !tbaa !80
  %84 = fsub double %83, %81, !dbg !120
  store double %84, double* %82, align 8, !dbg !120, !tbaa !80
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !115
  %lftr.wideiv33 = trunc i64 %indvars.iv.next32 to i32, !dbg !115
  %exitcond34 = icmp eq i32 %lftr.wideiv33, %N, !dbg !115
  br i1 %exitcond34, label %._crit_edge11, label %.lr.ph10, !dbg !115, !llvm.loop !122

._crit_edge11:                                    ; preds = %.lr.ph10, %middle.block, %59
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1, !dbg !117
  %lftr.wideiv39 = trunc i64 %indvars.iv.next38 to i32, !dbg !117
  %exitcond40 = icmp eq i32 %lftr.wideiv39, %M, !dbg !117
  br i1 %exitcond40, label %.backedge, label %59, !dbg !117

._crit_edge17:                                    ; preds = %._crit_edge, %.backedge, %0
  %.0 = phi i32 [ 0, %0 ], [ 1, %._crit_edge ], [ 0, %.backedge ]
  ret i32 %.0, !dbg !123
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!60, !61}
!llvm.ident = !{!62}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c] [DW_LANG_C99]
!1 = metadata !{metadata !"LU.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13, metadata !25}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_num_flops", metadata !"LU_num_flops", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32)* @LU_num_flops, null, null, metadata !10, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [LU_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 4]
!12 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 8, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 8]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_copy_matrix", metadata !"LU_copy_matrix", metadata !"", i32 14, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double**, double**)* @LU_copy_matrix, null, null, metadata !18, i32 15} ; [ DW_TAG_subprogram ] [line 14] [def] [scope 15] [LU_copy_matrix]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !9, metadata !9, metadata !16, metadata !16}
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24}
!19 = metadata !{i32 786689, metadata !13, metadata !"M", metadata !5, i32 16777230, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 14]
!20 = metadata !{i32 786689, metadata !13, metadata !"N", metadata !5, i32 33554446, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 14]
!21 = metadata !{i32 786689, metadata !13, metadata !"lu", metadata !5, i32 50331662, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lu] [line 14]
!22 = metadata !{i32 786689, metadata !13, metadata !"A", metadata !5, i32 67108878, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 14]
!23 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 16, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 16]
!24 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"LU_factor", metadata !"LU_factor", metadata !"", i32 25, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, double**, i32*)* @LU_factor, null, null, metadata !29, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [LU_factor]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !9, metadata !9, metadata !9, metadata !16, metadata !28}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !39, metadata !40, metadata !41, metadata !44, metadata !47, metadata !50, metadata !51, metadata !54, metadata !57, metadata !58, metadata !59}
!30 = metadata !{i32 786689, metadata !25, metadata !"M", metadata !5, i32 16777241, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 25]
!31 = metadata !{i32 786689, metadata !25, metadata !"N", metadata !5, i32 33554457, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 25]
!32 = metadata !{i32 786689, metadata !25, metadata !"A", metadata !5, i32 50331673, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 25]
!33 = metadata !{i32 786689, metadata !25, metadata !"pivot", metadata !5, i32 67108889, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pivot] [line 25]
!34 = metadata !{i32 786688, metadata !25, metadata !"minMN", metadata !5, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [minMN] [line 29]
!35 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 30, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 30]
!36 = metadata !{i32 786688, metadata !37, metadata !"jp", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jp] [line 36]
!37 = metadata !{i32 786443, metadata !1, metadata !38, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!38 = metadata !{i32 786443, metadata !1, metadata !25, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!39 = metadata !{i32 786688, metadata !37, metadata !"i", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 37]
!40 = metadata !{i32 786688, metadata !37, metadata !"t", metadata !5, i32 39, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 39]
!41 = metadata !{i32 786688, metadata !42, metadata !"ab", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ab] [line 42]
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!43 = metadata !{i32 786443, metadata !1, metadata !37, i32 40, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!44 = metadata !{i32 786688, metadata !45, metadata !"tA", metadata !5, i32 62, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tA] [line 62]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 60, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!46 = metadata !{i32 786443, metadata !1, metadata !37, i32 59, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!47 = metadata !{i32 786688, metadata !48, metadata !"recp", metadata !5, i32 72, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [recp] [line 72]
!48 = metadata !{i32 786443, metadata !1, metadata !49, i32 68, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!49 = metadata !{i32 786443, metadata !1, metadata !37, i32 67, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!50 = metadata !{i32 786688, metadata !48, metadata !"k", metadata !5, i32 73, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 73]
!51 = metadata !{i32 786688, metadata !52, metadata !"ii", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ii] [line 86]
!52 = metadata !{i32 786443, metadata !1, metadata !53, i32 80, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!53 = metadata !{i32 786443, metadata !1, metadata !37, i32 79, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!54 = metadata !{i32 786688, metadata !55, metadata !"Aii", metadata !5, i32 89, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Aii] [line 89]
!55 = metadata !{i32 786443, metadata !1, metadata !56, i32 88, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!56 = metadata !{i32 786443, metadata !1, metadata !52, i32 87, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!57 = metadata !{i32 786688, metadata !55, metadata !"Aj", metadata !5, i32 90, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Aj] [line 90]
!58 = metadata !{i32 786688, metadata !55, metadata !"AiiJ", metadata !5, i32 91, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [AiiJ] [line 91]
!59 = metadata !{i32 786688, metadata !55, metadata !"jj", metadata !5, i32 92, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 92]
!60 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!61 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!62 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!63 = metadata !{i32 4, i32 0, metadata !4, null}
!64 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!65 = metadata !{i32 10, i32 0, metadata !4, null}
!66 = metadata !{i32 14, i32 0, metadata !13, null}
!67 = metadata !{i32 0}
!68 = metadata !{i32 19, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !13, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!70 = metadata !{i32 20, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!72 = metadata !{i32 21, i32 0, metadata !71, null}
!73 = metadata !{metadata !74, metadata !74, i64 0}
!74 = metadata !{metadata !"any pointer", metadata !75, i64 0}
!75 = metadata !{metadata !"omnipotent char", metadata !76, i64 0}
!76 = metadata !{metadata !"Simple C/C++ TBAA"}
!77 = metadata !{metadata !77, metadata !78, metadata !79}
!78 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!79 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!80 = metadata !{metadata !81, metadata !81, i64 0}
!81 = metadata !{metadata !"double", metadata !75, i64 0}
!82 = metadata !{metadata !82, metadata !78, metadata !79}
!83 = metadata !{i32 22, i32 0, metadata !13, null}
!84 = metadata !{i32 25, i32 0, metadata !25, null}
!85 = metadata !{i32 29, i32 0, metadata !25, null}
!86 = metadata !{i32 30, i32 0, metadata !25, null}
!87 = metadata !{i32 32, i32 0, metadata !38, null}
!88 = metadata !{i32 67, i32 0, metadata !49, null}
!89 = metadata !{i32 79, i32 0, metadata !53, null}
!90 = metadata !{i32 undef}
!91 = metadata !{i32 36, i32 0, metadata !37, null}
!92 = metadata !{i32 39, i32 0, metadata !37, null}
!93 = metadata !{i32 40, i32 0, metadata !43, null}
!94 = metadata !{i32 42, i32 0, metadata !42, null}
!95 = metadata !{i32 43, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !42, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!97 = metadata !{i32 45, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !96, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!99 = metadata !{i32 46, i32 0, metadata !98, null}
!100 = metadata !{i32 50, i32 0, metadata !37, null}
!101 = metadata !{metadata !102, metadata !102, i64 0}
!102 = metadata !{metadata !"int", metadata !75, i64 0}
!103 = metadata !{i32 55, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !1, metadata !37, i32 55, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!105 = metadata !{i32 59, i32 0, metadata !46, null}
!106 = metadata !{i32 62, i32 0, metadata !45, null}
!107 = metadata !{i32 63, i32 0, metadata !45, null}
!108 = metadata !{i32 64, i32 0, metadata !45, null}
!109 = metadata !{i32 65, i32 0, metadata !45, null}
!110 = metadata !{i32 72, i32 0, metadata !48, null}
!111 = metadata !{i32 74, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !48, i32 74, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!113 = metadata !{i32 75, i32 0, metadata !112, null}
!114 = metadata !{i32 90, i32 0, metadata !55, null}
!115 = metadata !{i32 93, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !55, i32 93, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!117 = metadata !{i32 87, i32 0, metadata !56, null}
!118 = metadata !{i32 89, i32 0, metadata !55, null}
!119 = metadata !{i32 91, i32 0, metadata !55, null}
!120 = metadata !{i32 94, i32 0, metadata !116, null}
!121 = metadata !{metadata !121, metadata !78, metadata !79}
!122 = metadata !{metadata !122, metadata !78, metadata !79}
!123 = metadata !{i32 101, i32 0, metadata !25, null}
