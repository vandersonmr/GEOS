; ModuleID = 'LU.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize readnone uwtable
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

; Function Attrs: nounwind optsize uwtable
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
  br label %.preheader, !dbg !68

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv4 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next5, %._crit_edge ]
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !70

.lr.ph:                                           ; preds = %.preheader
  %3 = getelementptr inbounds double** %A, i64 %indvars.iv4, !dbg !72
  %4 = load double** %3, align 8, !dbg !72, !tbaa !73
  %5 = getelementptr inbounds double** %lu, i64 %indvars.iv4, !dbg !72
  %6 = load double** %5, align 8, !dbg !72, !tbaa !73
  br label %7, !dbg !70

; <label>:7                                       ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %7 ]
  %8 = getelementptr inbounds double* %4, i64 %indvars.iv, !dbg !72
  %9 = load double* %8, align 8, !dbg !72, !tbaa !77
  %10 = getelementptr inbounds double* %6, i64 %indvars.iv, !dbg !72
  store double %9, double* %10, align 8, !dbg !72, !tbaa !77
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !70
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !70
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !70
  br i1 %exitcond, label %._crit_edge, label %7, !dbg !70

._crit_edge:                                      ; preds = %7, %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !68
  %lftr.wideiv6 = trunc i64 %indvars.iv.next5 to i32, !dbg !68
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %M, !dbg !68
  br i1 %exitcond7, label %._crit_edge3, label %.preheader, !dbg !68

._crit_edge3:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !79
}

; Function Attrs: nounwind optsize uwtable
define i32 @LU_factor(i32 %M, i32 %N, double** nocapture %A, i32* nocapture %pivot) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !30), !dbg !80
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !31), !dbg !80
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !32), !dbg !80
  tail call void @llvm.dbg.value(metadata !{i32* %pivot}, i64 0, metadata !33), !dbg !80
  %1 = icmp slt i32 %M, %N, !dbg !81
  %2 = select i1 %1, i32 %M, i32 %N, !dbg !81
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !34), !dbg !81
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !35), !dbg !82
  %3 = icmp sgt i32 %2, 0, !dbg !83
  br i1 %3, label %.lr.ph16, label %._crit_edge17, !dbg !83

.lr.ph16:                                         ; preds = %0
  %4 = add nsw i32 %M, -1, !dbg !84
  %5 = add nsw i32 %2, -1, !dbg !85
  br label %6, !dbg !83

; <label>:6                                       ; preds = %.lr.ph16, %.backedge
  %indvars.iv41 = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next42, %.backedge ]
  %indvars.iv35 = phi i64 [ 1, %.lr.ph16 ], [ %indvars.iv.next36, %.backedge ]
  tail call void @llvm.dbg.value(metadata !86, i64 0, metadata !36), !dbg !87
  %7 = getelementptr inbounds double** %A, i64 %indvars.iv41, !dbg !88
  tail call void @llvm.dbg.value(metadata !{double %14}, i64 0, metadata !40), !dbg !88
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !83
  %8 = trunc i64 %indvars.iv.next42 to i32, !dbg !89
  %9 = icmp slt i32 %8, %M, !dbg !89
  %10 = trunc i64 %indvars.iv41 to i32, !dbg !89
  br i1 %9, label %.lr.ph, label %._crit_edge, !dbg !89

.lr.ph:                                           ; preds = %6
  %11 = load double** %7, align 8, !dbg !88, !tbaa !73
  %12 = getelementptr inbounds double* %11, i64 %indvars.iv41, !dbg !88
  %13 = load double* %12, align 8, !dbg !88, !tbaa !77
  %14 = tail call double @fabs(double %13) #4, !dbg !88
  br label %15, !dbg !89

; <label>:15                                      ; preds = %15, %.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv35, %.lr.ph ], [ %indvars.iv.next22, %15 ]
  %jp.04 = phi i32 [ %10, %.lr.ph ], [ %jp.1, %15 ]
  %t.02 = phi double [ %14, %.lr.ph ], [ %t.1, %15 ]
  %16 = getelementptr inbounds double** %A, i64 %indvars.iv21, !dbg !90
  %17 = load double** %16, align 8, !dbg !90, !tbaa !73
  %18 = getelementptr inbounds double* %17, i64 %indvars.iv41, !dbg !90
  %19 = load double* %18, align 8, !dbg !90, !tbaa !77
  %20 = tail call double @fabs(double %19) #4, !dbg !90
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !41), !dbg !90
  %21 = fcmp ogt double %20, %t.02, !dbg !91
  tail call void @llvm.dbg.value(metadata !86, i64 0, metadata !36), !dbg !93
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !40), !dbg !95
  %t.1 = select i1 %21, double %20, double %t.02, !dbg !91
  %22 = trunc i64 %indvars.iv21 to i32, !dbg !91
  %jp.1 = select i1 %21, i32 %22, i32 %jp.04, !dbg !91
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !89
  %lftr.wideiv = trunc i64 %indvars.iv.next22 to i32, !dbg !89
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !89
  br i1 %exitcond, label %._crit_edge, label %15, !dbg !89

._crit_edge:                                      ; preds = %15, %6
  %jp.0.lcssa = phi i32 [ %10, %6 ], [ %jp.1, %15 ]
  %23 = getelementptr inbounds i32* %pivot, i64 %indvars.iv41, !dbg !96
  store i32 %jp.0.lcssa, i32* %23, align 4, !dbg !96, !tbaa !97
  %24 = sext i32 %jp.0.lcssa to i64, !dbg !99
  %25 = getelementptr inbounds double** %A, i64 %24, !dbg !99
  %26 = load double** %25, align 8, !dbg !99, !tbaa !73
  %27 = getelementptr inbounds double* %26, i64 %indvars.iv41, !dbg !99
  %28 = load double* %27, align 8, !dbg !99, !tbaa !77
  %29 = fcmp oeq double %28, 0.000000e+00, !dbg !99
  br i1 %29, label %._crit_edge17, label %30, !dbg !99

; <label>:30                                      ; preds = %._crit_edge
  %31 = icmp eq i32 %jp.0.lcssa, %10, !dbg !101
  br i1 %31, label %34, label %32, !dbg !101

; <label>:32                                      ; preds = %30
  %33 = load double** %7, align 8, !dbg !102, !tbaa !73
  tail call void @llvm.dbg.value(metadata !{double* %33}, i64 0, metadata !44), !dbg !102
  store double* %26, double** %7, align 8, !dbg !103, !tbaa !73
  store double* %33, double** %25, align 8, !dbg !104, !tbaa !73
  br label %34, !dbg !105

; <label>:34                                      ; preds = %30, %32
  %35 = icmp slt i32 %10, %4, !dbg !84
  br i1 %35, label %36, label %.loopexit1, !dbg !84

; <label>:36                                      ; preds = %34
  %37 = load double** %7, align 8, !dbg !106, !tbaa !73
  %38 = getelementptr inbounds double* %37, i64 %indvars.iv41, !dbg !106
  %39 = load double* %38, align 8, !dbg !106, !tbaa !77
  %40 = fdiv double 1.000000e+00, %39, !dbg !106
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !47), !dbg !106
  br i1 %9, label %.lr.ph7, label %.loopexit1, !dbg !107

.lr.ph7:                                          ; preds = %36, %.lr.ph7
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph7 ], [ %indvars.iv35, %36 ]
  %41 = getelementptr inbounds double** %A, i64 %indvars.iv25, !dbg !109
  %42 = load double** %41, align 8, !dbg !109, !tbaa !73
  %43 = getelementptr inbounds double* %42, i64 %indvars.iv41, !dbg !109
  %44 = load double* %43, align 8, !dbg !109, !tbaa !77
  %45 = fmul double %40, %44, !dbg !109
  store double %45, double* %43, align 8, !dbg !109, !tbaa !77
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1, !dbg !107
  %lftr.wideiv27 = trunc i64 %indvars.iv.next26 to i32, !dbg !107
  %exitcond28 = icmp eq i32 %lftr.wideiv27, %M, !dbg !107
  br i1 %exitcond28, label %.loopexit1, label %.lr.ph7, !dbg !107

.loopexit1:                                       ; preds = %.lr.ph7, %36, %34
  %.not = icmp sge i32 %10, %5, !dbg !85
  %.not43 = xor i1 %9, true, !dbg !85
  %brmerge = or i1 %.not, %.not43, !dbg !85
  br i1 %brmerge, label %.backedge, label %.lr.ph13, !dbg !85

.backedge:                                        ; preds = %._crit_edge11, %.loopexit1
  %46 = icmp slt i32 %8, %2, !dbg !83
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1, !dbg !83
  br i1 %46, label %6, label %._crit_edge17, !dbg !83

.lr.ph13:                                         ; preds = %.loopexit1
  %47 = load double** %7, align 8, !dbg !110, !tbaa !73
  %48 = icmp slt i32 %8, %N, !dbg !111
  br label %49, !dbg !113

; <label>:49                                      ; preds = %._crit_edge11, %.lr.ph13
  %indvars.iv37 = phi i64 [ %indvars.iv35, %.lr.ph13 ], [ %indvars.iv.next38, %._crit_edge11 ]
  %50 = getelementptr inbounds double** %A, i64 %indvars.iv37, !dbg !114
  %51 = load double** %50, align 8, !dbg !114, !tbaa !73
  tail call void @llvm.dbg.value(metadata !{double* %51}, i64 0, metadata !54), !dbg !114
  tail call void @llvm.dbg.value(metadata !{double* %47}, i64 0, metadata !57), !dbg !110
  %52 = getelementptr inbounds double* %51, i64 %indvars.iv41, !dbg !115
  %53 = load double* %52, align 8, !dbg !115, !tbaa !77
  tail call void @llvm.dbg.value(metadata !{double %53}, i64 0, metadata !58), !dbg !115
  br i1 %48, label %.lr.ph10, label %._crit_edge11, !dbg !111

.lr.ph10:                                         ; preds = %49, %.lr.ph10
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.lr.ph10 ], [ %indvars.iv35, %49 ]
  %54 = getelementptr inbounds double* %47, i64 %indvars.iv31, !dbg !116
  %55 = load double* %54, align 8, !dbg !116, !tbaa !77
  %56 = fmul double %53, %55, !dbg !116
  %57 = getelementptr inbounds double* %51, i64 %indvars.iv31, !dbg !116
  %58 = load double* %57, align 8, !dbg !116, !tbaa !77
  %59 = fsub double %58, %56, !dbg !116
  store double %59, double* %57, align 8, !dbg !116, !tbaa !77
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !111
  %lftr.wideiv33 = trunc i64 %indvars.iv.next32 to i32, !dbg !111
  %exitcond34 = icmp eq i32 %lftr.wideiv33, %N, !dbg !111
  br i1 %exitcond34, label %._crit_edge11, label %.lr.ph10, !dbg !111

._crit_edge11:                                    ; preds = %.lr.ph10, %49
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1, !dbg !113
  %lftr.wideiv39 = trunc i64 %indvars.iv.next38 to i32, !dbg !113
  %exitcond40 = icmp eq i32 %lftr.wideiv39, %M, !dbg !113
  br i1 %exitcond40, label %.backedge, label %49, !dbg !113

._crit_edge17:                                    ; preds = %._crit_edge, %.backedge, %0
  %.0 = phi i32 [ 0, %0 ], [ 1, %._crit_edge ], [ 0, %.backedge ]
  ret i32 %.0, !dbg !117
}

; Function Attrs: nounwind optsize readnone
declare double @fabs(double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind optsize readnone }

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
!77 = metadata !{metadata !78, metadata !78, i64 0}
!78 = metadata !{metadata !"double", metadata !75, i64 0}
!79 = metadata !{i32 22, i32 0, metadata !13, null}
!80 = metadata !{i32 25, i32 0, metadata !25, null}
!81 = metadata !{i32 29, i32 0, metadata !25, null}
!82 = metadata !{i32 30, i32 0, metadata !25, null}
!83 = metadata !{i32 32, i32 0, metadata !38, null}
!84 = metadata !{i32 67, i32 0, metadata !49, null}
!85 = metadata !{i32 79, i32 0, metadata !53, null}
!86 = metadata !{i32 undef}
!87 = metadata !{i32 36, i32 0, metadata !37, null}
!88 = metadata !{i32 39, i32 0, metadata !37, null}
!89 = metadata !{i32 40, i32 0, metadata !43, null}
!90 = metadata !{i32 42, i32 0, metadata !42, null}
!91 = metadata !{i32 43, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !42, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!93 = metadata !{i32 45, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !92, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!95 = metadata !{i32 46, i32 0, metadata !94, null}
!96 = metadata !{i32 50, i32 0, metadata !37, null}
!97 = metadata !{metadata !98, metadata !98, i64 0}
!98 = metadata !{metadata !"int", metadata !75, i64 0}
!99 = metadata !{i32 55, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !37, i32 55, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!101 = metadata !{i32 59, i32 0, metadata !46, null}
!102 = metadata !{i32 62, i32 0, metadata !45, null}
!103 = metadata !{i32 63, i32 0, metadata !45, null}
!104 = metadata !{i32 64, i32 0, metadata !45, null}
!105 = metadata !{i32 65, i32 0, metadata !45, null}
!106 = metadata !{i32 72, i32 0, metadata !48, null}
!107 = metadata !{i32 74, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !48, i32 74, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!109 = metadata !{i32 75, i32 0, metadata !108, null}
!110 = metadata !{i32 90, i32 0, metadata !55, null}
!111 = metadata !{i32 93, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !55, i32 93, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/LU.c]
!113 = metadata !{i32 87, i32 0, metadata !56, null}
!114 = metadata !{i32 89, i32 0, metadata !55, null}
!115 = metadata !{i32 91, i32 0, metadata !55, null}
!116 = metadata !{i32 94, i32 0, metadata !112, null}
!117 = metadata !{i32 101, i32 0, metadata !25, null}
