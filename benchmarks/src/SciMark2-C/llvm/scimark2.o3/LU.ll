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
  br i1 %2, label %.lr.ph.us.preheader, label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph
  %n.vec = and i32 %M, -32, !dbg !68
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !68
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %.preheader ], !dbg !68
  %index.next = add i32 %index, 32, !dbg !68
  %3 = icmp eq i32 %index.next, %n.vec, !dbg !68
  br i1 %3, label %middle.block, label %vector.body, !dbg !68, !llvm.loop !72

middle.block:                                     ; preds = %vector.body, %.preheader
  %resume.val = phi i32 [ 0, %.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i32 %resume.val, %M
  br i1 %cmp.n, label %._crit_edge3, label %scalar.ph

.lr.ph.us.preheader:                              ; preds = %.preheader.lr.ph
  %4 = add i32 %N, -1, !dbg !75
  %5 = zext i32 %4 to i64
  %6 = add i64 %5, 1, !dbg !75
  %7 = zext i32 %4 to i64
  br label %.lr.ph.us, !dbg !75

; <label>:8                                       ; preds = %middle.block15, %scalar.ph16
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !68
  %lftr.wideiv7 = trunc i64 %indvars.iv.next6 to i32, !dbg !68
  %exitcond8 = icmp eq i32 %lftr.wideiv7, %M, !dbg !68
  br i1 %exitcond8, label %._crit_edge3, label %.lr.ph.us, !dbg !68

scalar.ph16:                                      ; preds = %middle.block15, %scalar.ph16
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph16 ], [ %resume.val26, %middle.block15 ]
  %9 = getelementptr inbounds double* %13, i64 %indvars.iv, !dbg !75
  %10 = load double* %9, align 8, !dbg !75, !tbaa !76
  %11 = getelementptr inbounds double* %15, i64 %indvars.iv, !dbg !75
  store double %10, double* %11, align 8, !dbg !75, !tbaa !76
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !70
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !70
  %exitcond4 = icmp eq i32 %lftr.wideiv, %N, !dbg !70
  br i1 %exitcond4, label %8, label %scalar.ph16, !dbg !70, !llvm.loop !80

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %8
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %8 ], [ 0, %.lr.ph.us.preheader ]
  %12 = getelementptr inbounds double** %A, i64 %indvars.iv5, !dbg !75
  %13 = load double** %12, align 8, !dbg !75, !tbaa !81
  %14 = getelementptr inbounds double** %lu, i64 %indvars.iv5, !dbg !75
  %15 = load double** %14, align 8, !dbg !75, !tbaa !81
  %end.idx18 = add i64 %5, 1, !dbg !70
  %n.vec20 = and i64 %6, 8589934588, !dbg !70
  %cmp.zero22 = icmp eq i64 %n.vec20, 0, !dbg !70
  br i1 %cmp.zero22, label %middle.block15, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.us
  %scevgep24 = getelementptr double* %13, i64 %7
  %scevgep = getelementptr double* %15, i64 %7
  %bound1 = icmp ule double* %13, %scevgep
  %bound0 = icmp ule double* %15, %scevgep24
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block15, label %vector.body14

vector.body14:                                    ; preds = %vector.memcheck, %vector.body14
  %index17 = phi i64 [ %index.next29, %vector.body14 ], [ 0, %vector.memcheck ], !dbg !70
  %16 = getelementptr inbounds double* %13, i64 %index17, !dbg !75
  %17 = bitcast double* %16 to <2 x double>*, !dbg !75
  %wide.load = load <2 x double>* %17, align 8, !dbg !75
  %.sum37 = or i64 %index17, 2, !dbg !75
  %18 = getelementptr double* %13, i64 %.sum37, !dbg !75
  %19 = bitcast double* %18 to <2 x double>*, !dbg !75
  %wide.load34 = load <2 x double>* %19, align 8, !dbg !75
  %20 = getelementptr inbounds double* %15, i64 %index17, !dbg !75
  %21 = bitcast double* %20 to <2 x double>*, !dbg !75
  store <2 x double> %wide.load, <2 x double>* %21, align 8, !dbg !75
  %.sum38 = or i64 %index17, 2, !dbg !75
  %22 = getelementptr double* %15, i64 %.sum38, !dbg !75
  %23 = bitcast double* %22 to <2 x double>*, !dbg !75
  store <2 x double> %wide.load34, <2 x double>* %23, align 8, !dbg !75
  %index.next29 = add i64 %index17, 4, !dbg !70
  %24 = icmp eq i64 %index.next29, %n.vec20, !dbg !70
  br i1 %24, label %middle.block15, label %vector.body14, !dbg !70, !llvm.loop !83

middle.block15:                                   ; preds = %vector.body14, %vector.memcheck, %.lr.ph.us
  %resume.val26 = phi i64 [ 0, %.lr.ph.us ], [ 0, %vector.memcheck ], [ %n.vec20, %vector.body14 ]
  %cmp.n28 = icmp eq i64 %end.idx18, %resume.val26
  br i1 %cmp.n28, label %8, label %scalar.ph16

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %i.02 = phi i32 [ %25, %scalar.ph ], [ %resume.val, %middle.block ]
  %25 = add nsw i32 %i.02, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !23), !dbg !68
  %exitcond = icmp eq i32 %25, %M, !dbg !68
  br i1 %exitcond, label %._crit_edge3, label %scalar.ph, !dbg !68, !llvm.loop !84

._crit_edge3:                                     ; preds = %scalar.ph, %middle.block, %8, %0
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define i32 @LU_factor(i32 %M, i32 %N, double** nocapture %A, i32* nocapture %pivot) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !31), !dbg !86
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !32), !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32* %pivot}, i64 0, metadata !33), !dbg !86
  %1 = icmp slt i32 %M, %N, !dbg !87
  %2 = select i1 %1, i32 %M, i32 %N, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !34), !dbg !87
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !35), !dbg !88
  %3 = icmp sgt i32 %2, 0, !dbg !89
  br i1 %3, label %.lr.ph16, label %._crit_edge17, !dbg !89

.lr.ph16:                                         ; preds = %0
  %4 = add nsw i32 %M, -1, !dbg !90
  %5 = add nsw i32 %2, -1, !dbg !91
  %6 = add i32 %N, -2, !dbg !89
  %7 = zext i32 %6 to i64
  %8 = zext i32 %6 to i64
  %9 = zext i32 %4 to i64
  br label %10, !dbg !89

; <label>:10                                      ; preds = %.lr.ph16, %.backedge
  %indvars.iv42 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next43, %.backedge ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph16 ], [ %indvars.iv.next37, %.backedge ]
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !36), !dbg !93
  %11 = sub i64 %9, %indvars.iv42, !dbg !94
  %12 = trunc i64 %11 to i32
  %13 = add i64 %indvars.iv42, 1, !dbg !94
  %14 = sub i64 %8, %indvars.iv42, !dbg !94
  %15 = and i64 %14, 4294967295
  %16 = add i64 %13, %15, !dbg !94
  %17 = sub i64 %7, %indvars.iv42, !dbg !94
  %18 = and i64 %17, 4294967295
  %19 = add i64 %18, 1, !dbg !94
  %20 = getelementptr inbounds double** %A, i64 %indvars.iv42, !dbg !94
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !40), !dbg !94
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !89
  %21 = trunc i64 %indvars.iv.next43 to i32, !dbg !95
  %22 = icmp slt i32 %21, %M, !dbg !95
  %23 = trunc i64 %indvars.iv42 to i32, !dbg !95
  br i1 %22, label %.lr.ph, label %._crit_edge, !dbg !95

.lr.ph:                                           ; preds = %10
  %24 = load double** %20, align 8, !dbg !94, !tbaa !81
  %25 = getelementptr inbounds double* %24, i64 %indvars.iv42, !dbg !94
  %26 = load double* %25, align 8, !dbg !94, !tbaa !76
  %27 = tail call double @fabs(double %26) #3, !dbg !94
  br label %28, !dbg !95

; <label>:28                                      ; preds = %28, %.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv36, %.lr.ph ], [ %indvars.iv.next22, %28 ]
  %jp.04 = phi i32 [ %23, %.lr.ph ], [ %jp.1, %28 ]
  %t.02 = phi double [ %27, %.lr.ph ], [ %t.1, %28 ]
  %29 = getelementptr inbounds double** %A, i64 %indvars.iv21, !dbg !96
  %30 = load double** %29, align 8, !dbg !96, !tbaa !81
  %31 = getelementptr inbounds double* %30, i64 %indvars.iv42, !dbg !96
  %32 = load double* %31, align 8, !dbg !96, !tbaa !76
  %33 = tail call double @fabs(double %32) #3, !dbg !96
  tail call void @llvm.dbg.value(metadata !{double %33}, i64 0, metadata !41), !dbg !96
  %34 = fcmp ogt double %33, %t.02, !dbg !97
  tail call void @llvm.dbg.value(metadata !92, i64 0, metadata !36), !dbg !99
  tail call void @llvm.dbg.value(metadata !{double %33}, i64 0, metadata !40), !dbg !101
  %t.1 = select i1 %34, double %33, double %t.02, !dbg !97
  %35 = trunc i64 %indvars.iv21 to i32, !dbg !97
  %jp.1 = select i1 %34, i32 %35, i32 %jp.04, !dbg !97
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !95
  %lftr.wideiv = trunc i64 %indvars.iv.next22 to i32, !dbg !95
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !95
  br i1 %exitcond, label %._crit_edge, label %28, !dbg !95

._crit_edge:                                      ; preds = %28, %10
  %jp.0.lcssa = phi i32 [ %23, %10 ], [ %jp.1, %28 ]
  %36 = getelementptr inbounds i32* %pivot, i64 %indvars.iv42, !dbg !102
  store i32 %jp.0.lcssa, i32* %36, align 4, !dbg !102, !tbaa !103
  %37 = sext i32 %jp.0.lcssa to i64, !dbg !105
  %38 = getelementptr inbounds double** %A, i64 %37, !dbg !105
  %39 = load double** %38, align 8, !dbg !105, !tbaa !81
  %40 = getelementptr inbounds double* %39, i64 %indvars.iv42, !dbg !105
  %41 = load double* %40, align 8, !dbg !105, !tbaa !76
  %42 = fcmp oeq double %41, 0.000000e+00, !dbg !105
  br i1 %42, label %._crit_edge17, label %43, !dbg !105

; <label>:43                                      ; preds = %._crit_edge
  %44 = icmp eq i32 %jp.0.lcssa, %23, !dbg !107
  br i1 %44, label %47, label %45, !dbg !107

; <label>:45                                      ; preds = %43
  %46 = load double** %20, align 8, !dbg !108, !tbaa !81
  tail call void @llvm.dbg.value(metadata !{double* %46}, i64 0, metadata !44), !dbg !108
  store double* %39, double** %20, align 8, !dbg !109, !tbaa !81
  store double* %46, double** %38, align 8, !dbg !110, !tbaa !81
  br label %47, !dbg !111

; <label>:47                                      ; preds = %43, %45
  %48 = icmp slt i32 %23, %4, !dbg !90
  br i1 %48, label %49, label %.loopexit1, !dbg !90

; <label>:49                                      ; preds = %47
  %50 = load double** %20, align 8, !dbg !112, !tbaa !81
  %51 = getelementptr inbounds double* %50, i64 %indvars.iv42, !dbg !112
  %52 = load double* %51, align 8, !dbg !112, !tbaa !76
  %53 = fdiv double 1.000000e+00, %52, !dbg !112
  tail call void @llvm.dbg.value(metadata !{double %53}, i64 0, metadata !47), !dbg !112
  br i1 %22, label %.lr.ph7, label %.loopexit1, !dbg !113

.lr.ph7:                                          ; preds = %49, %.lr.ph7
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph7 ], [ %indvars.iv36, %49 ]
  %54 = getelementptr inbounds double** %A, i64 %indvars.iv25, !dbg !115
  %55 = load double** %54, align 8, !dbg !115, !tbaa !81
  %56 = getelementptr inbounds double* %55, i64 %indvars.iv42, !dbg !115
  %57 = load double* %56, align 8, !dbg !115, !tbaa !76
  %58 = fmul double %53, %57, !dbg !115
  store double %58, double* %56, align 8, !dbg !115, !tbaa !76
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1, !dbg !113
  %lftr.wideiv27 = trunc i64 %indvars.iv.next26 to i32, !dbg !113
  %exitcond28 = icmp eq i32 %lftr.wideiv27, %M, !dbg !113
  br i1 %exitcond28, label %.loopexit1, label %.lr.ph7, !dbg !113

.loopexit1:                                       ; preds = %.lr.ph7, %49, %47
  %.not = icmp sge i32 %23, %5, !dbg !91
  %.not45 = xor i1 %22, true, !dbg !91
  %brmerge = or i1 %.not, %.not45, !dbg !91
  br i1 %brmerge, label %.backedge, label %.lr.ph13, !dbg !91

.backedge:                                        ; preds = %scalar.ph65, %middle.block64, %63, %.loopexit1
  %59 = icmp slt i32 %21, %2, !dbg !89
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1, !dbg !89
  br i1 %59, label %10, label %._crit_edge17, !dbg !89

.lr.ph13:                                         ; preds = %.loopexit1
  %60 = load double** %20, align 8, !dbg !116, !tbaa !81
  %61 = icmp slt i32 %21, %N, !dbg !117
  br i1 %61, label %.lr.ph10.us.preheader, label %.preheader

.preheader:                                       ; preds = %.lr.ph13
  %end.idx67 = add i32 %12, %21, !dbg !119
  %n.vec69 = and i32 %12, -32, !dbg !119
  %end.idx.rnd.down70 = add i32 %n.vec69, %21, !dbg !119
  %cmp.zero71 = icmp eq i32 %n.vec69, 0, !dbg !119
  br i1 %cmp.zero71, label %middle.block64, label %vector.body63

vector.body63:                                    ; preds = %.preheader, %vector.body63
  %index66 = phi i32 [ %index.next75, %vector.body63 ], [ %21, %.preheader ], !dbg !119
  %index.next75 = add i32 %index66, 32, !dbg !119
  %62 = icmp eq i32 %index.next75, %end.idx.rnd.down70, !dbg !119
  br i1 %62, label %middle.block64, label %vector.body63, !dbg !119, !llvm.loop !120

middle.block64:                                   ; preds = %vector.body63, %.preheader
  %resume.val72 = phi i32 [ %21, %.preheader ], [ %end.idx.rnd.down70, %vector.body63 ]
  %cmp.n74 = icmp eq i32 %end.idx67, %resume.val72
  br i1 %cmp.n74, label %.backedge, label %scalar.ph65

.lr.ph10.us.preheader:                            ; preds = %.lr.ph13
  %scevgep50 = getelementptr double* %60, i64 %13
  %scevgep52 = getelementptr double* %60, i64 %16
  br label %.lr.ph10.us, !dbg !121

; <label>:63                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !119
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !119
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %M, !dbg !119
  br i1 %exitcond41, label %.backedge, label %.lr.ph10.us, !dbg !119

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %scalar.ph ], [ %resume.val, %middle.block ]
  %64 = getelementptr inbounds double* %60, i64 %indvars.iv32, !dbg !122
  %65 = load double* %64, align 8, !dbg !122, !tbaa !76
  %66 = fmul double %73, %65, !dbg !122
  %67 = getelementptr inbounds double* %71, i64 %indvars.iv32, !dbg !122
  %68 = load double* %67, align 8, !dbg !122, !tbaa !76
  %69 = fsub double %68, %66, !dbg !122
  store double %69, double* %67, align 8, !dbg !122, !tbaa !76
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !117
  %lftr.wideiv34 = trunc i64 %indvars.iv.next33 to i32, !dbg !117
  %exitcond35 = icmp eq i32 %lftr.wideiv34, %N, !dbg !117
  br i1 %exitcond35, label %63, label %scalar.ph, !dbg !117, !llvm.loop !123

.lr.ph10.us:                                      ; preds = %.lr.ph10.us.preheader, %63
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %63 ], [ %indvars.iv36, %.lr.ph10.us.preheader ]
  %70 = getelementptr inbounds double** %A, i64 %indvars.iv38, !dbg !121
  %71 = load double** %70, align 8, !dbg !121, !tbaa !81
  tail call void @llvm.dbg.value(metadata !{double* %71}, i64 0, metadata !54), !dbg !121
  tail call void @llvm.dbg.value(metadata !{double* %60}, i64 0, metadata !57), !dbg !116
  %72 = getelementptr inbounds double* %71, i64 %indvars.iv42, !dbg !124
  %73 = load double* %72, align 8, !dbg !124, !tbaa !76
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !58), !dbg !124
  %end.idx = add i64 %19, %indvars.iv36, !dbg !117
  %fold = add i64 %17, 1, !dbg !117
  %n.mod.vf = and i64 %fold, 3, !dbg !117
  %n.vec = sub i64 %19, %n.mod.vf, !dbg !117
  %end.idx.rnd.down = add i64 %n.vec, %indvars.iv36, !dbg !117
  %cmp.zero = icmp eq i64 %19, %n.mod.vf, !dbg !117
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph10.us
  %scevgep48 = getelementptr double* %71, i64 %16
  %scevgep = getelementptr double* %71, i64 %13
  %bound1 = icmp ule double* %scevgep50, %scevgep48
  %bound0 = icmp ule double* %scevgep, %scevgep52
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %73, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %indvars.iv36, %vector.ph ], [ %index.next, %vector.body ], !dbg !117
  %74 = getelementptr inbounds double* %60, i64 %index, !dbg !122
  %75 = bitcast double* %74 to <2 x double>*, !dbg !122
  %wide.load = load <2 x double>* %75, align 8, !dbg !122
  %.sum = add i64 %index, 2, !dbg !122
  %76 = getelementptr double* %60, i64 %.sum, !dbg !122
  %77 = bitcast double* %76 to <2 x double>*, !dbg !122
  %wide.load55 = load <2 x double>* %77, align 8, !dbg !122
  %78 = fmul <2 x double> %broadcast.splat57, %wide.load, !dbg !122
  %79 = fmul <2 x double> %broadcast.splat57, %wide.load55, !dbg !122
  %80 = getelementptr inbounds double* %71, i64 %index, !dbg !122
  %81 = bitcast double* %80 to <2 x double>*, !dbg !122
  %wide.load58 = load <2 x double>* %81, align 8, !dbg !122
  %.sum82 = add i64 %index, 2, !dbg !122
  %82 = getelementptr double* %71, i64 %.sum82, !dbg !122
  %83 = bitcast double* %82 to <2 x double>*, !dbg !122
  %wide.load59 = load <2 x double>* %83, align 8, !dbg !122
  %84 = fsub <2 x double> %wide.load58, %78, !dbg !122
  %85 = fsub <2 x double> %wide.load59, %79, !dbg !122
  %86 = bitcast double* %80 to <2 x double>*, !dbg !122
  store <2 x double> %84, <2 x double>* %86, align 8, !dbg !122
  %87 = bitcast double* %82 to <2 x double>*, !dbg !122
  store <2 x double> %85, <2 x double>* %87, align 8, !dbg !122
  %index.next = add i64 %index, 4, !dbg !117
  %88 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !117
  br i1 %88, label %middle.block, label %vector.body, !dbg !117, !llvm.loop !125

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph10.us
  %resume.val = phi i64 [ %indvars.iv36, %.lr.ph10.us ], [ %indvars.iv36, %vector.memcheck ], [ %end.idx.rnd.down, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %63, label %scalar.ph

scalar.ph65:                                      ; preds = %middle.block64, %scalar.ph65
  %ii.012 = phi i32 [ %89, %scalar.ph65 ], [ %resume.val72, %middle.block64 ]
  tail call void @llvm.dbg.value(metadata !{double* %60}, i64 0, metadata !57), !dbg !116
  %89 = add nsw i32 %ii.012, 1, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %89}, i64 0, metadata !51), !dbg !119
  %exitcond29 = icmp eq i32 %89, %M, !dbg !119
  br i1 %exitcond29, label %.backedge, label %scalar.ph65, !dbg !119, !llvm.loop !126

._crit_edge17:                                    ; preds = %._crit_edge, %.backedge, %0
  %.0 = phi i32 [ 0, %0 ], [ 1, %._crit_edge ], [ 0, %.backedge ]
  ret i32 %.0, !dbg !127
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
!72 = metadata !{metadata !72, metadata !73, metadata !74}
!73 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!74 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!75 = metadata !{i32 21, i32 0, metadata !71, null}
!76 = metadata !{metadata !77, metadata !77, i64 0}
!77 = metadata !{metadata !"double", metadata !78, i64 0}
!78 = metadata !{metadata !"omnipotent char", metadata !79, i64 0}
!79 = metadata !{metadata !"Simple C/C++ TBAA"}
!80 = metadata !{metadata !80, metadata !73, metadata !74}
!81 = metadata !{metadata !82, metadata !82, i64 0}
!82 = metadata !{metadata !"any pointer", metadata !78, i64 0}
!83 = metadata !{metadata !83, metadata !73, metadata !74}
!84 = metadata !{metadata !84, metadata !73, metadata !74}
!85 = metadata !{i32 22, i32 0, metadata !13, null}
!86 = metadata !{i32 25, i32 0, metadata !25, null}
!87 = metadata !{i32 29, i32 0, metadata !25, null}
!88 = metadata !{i32 30, i32 0, metadata !25, null}
!89 = metadata !{i32 32, i32 0, metadata !38, null}
!90 = metadata !{i32 67, i32 0, metadata !49, null}
!91 = metadata !{i32 79, i32 0, metadata !53, null}
!92 = metadata !{i32 undef}
!93 = metadata !{i32 36, i32 0, metadata !37, null}
!94 = metadata !{i32 39, i32 0, metadata !37, null}
!95 = metadata !{i32 40, i32 0, metadata !43, null}
!96 = metadata !{i32 42, i32 0, metadata !42, null}
!97 = metadata !{i32 43, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !42, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!99 = metadata !{i32 45, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !98, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!101 = metadata !{i32 46, i32 0, metadata !100, null}
!102 = metadata !{i32 50, i32 0, metadata !37, null}
!103 = metadata !{metadata !104, metadata !104, i64 0}
!104 = metadata !{metadata !"int", metadata !78, i64 0}
!105 = metadata !{i32 55, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !37, i32 55, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!107 = metadata !{i32 59, i32 0, metadata !46, null}
!108 = metadata !{i32 62, i32 0, metadata !45, null}
!109 = metadata !{i32 63, i32 0, metadata !45, null}
!110 = metadata !{i32 64, i32 0, metadata !45, null}
!111 = metadata !{i32 65, i32 0, metadata !45, null}
!112 = metadata !{i32 72, i32 0, metadata !48, null}
!113 = metadata !{i32 74, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !48, i32 74, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!115 = metadata !{i32 75, i32 0, metadata !114, null}
!116 = metadata !{i32 90, i32 0, metadata !55, null}
!117 = metadata !{i32 93, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !55, i32 93, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!119 = metadata !{i32 87, i32 0, metadata !56, null}
!120 = metadata !{metadata !120, metadata !73, metadata !74}
!121 = metadata !{i32 89, i32 0, metadata !55, null}
!122 = metadata !{i32 94, i32 0, metadata !118, null}
!123 = metadata !{metadata !123, metadata !73, metadata !74}
!124 = metadata !{i32 91, i32 0, metadata !55, null}
!125 = metadata !{metadata !125, metadata !73, metadata !74}
!126 = metadata !{metadata !126, metadata !73, metadata !74}
!127 = metadata !{i32 101, i32 0, metadata !25, null}
