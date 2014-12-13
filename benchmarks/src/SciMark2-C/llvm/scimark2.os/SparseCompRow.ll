; ModuleID = 'SparseCompRow.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize readnone uwtable
define double @SparseCompRow_num_flops(i32 %N, i32 %nz, i32 %num_iterations) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !11), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32 %nz}, i64 0, metadata !12), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32 %num_iterations}, i64 0, metadata !13), !dbg !41
  %1 = srem i32 %nz, %N, !dbg !42
  %2 = sub i32 %nz, %1, !dbg !42
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !14), !dbg !42
  %3 = sitofp i32 %2 to double, !dbg !43
  %4 = fmul double %3, 2.000000e+00, !dbg !43
  %5 = sitofp i32 %num_iterations to double, !dbg !43
  %6 = fmul double %5, %4, !dbg !43
  ret double %6, !dbg !43
}

; Function Attrs: nounwind optsize uwtable
define void @SparseCompRow_matmult(i32 %M, double* nocapture %y, double* nocapture readonly %val, i32* nocapture readonly %row, i32* nocapture readonly %col, double* nocapture readonly %x, i32 %NUM_ITERATIONS) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !21), !dbg !44
  tail call void @llvm.dbg.value(metadata !{double* %y}, i64 0, metadata !22), !dbg !44
  tail call void @llvm.dbg.value(metadata !{double* %val}, i64 0, metadata !23), !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32* %row}, i64 0, metadata !24), !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32* %col}, i64 0, metadata !25), !dbg !45
  tail call void @llvm.dbg.value(metadata !{double* %x}, i64 0, metadata !26), !dbg !45
  tail call void @llvm.dbg.value(metadata !{i32 %NUM_ITERATIONS}, i64 0, metadata !27), !dbg !45
  tail call void @llvm.dbg.value(metadata !46, i64 0, metadata !28), !dbg !47
  %1 = icmp sgt i32 %NUM_ITERATIONS, 0, !dbg !47
  br i1 %1, label %.preheader.lr.ph, label %._crit_edge7, !dbg !47

.preheader.lr.ph:                                 ; preds = %0
  %2 = icmp sgt i32 %M, 0, !dbg !48
  br label %.preheader, !dbg !47

.preheader:                                       ; preds = %._crit_edge5, %.preheader.lr.ph
  %reps.06 = phi i32 [ 0, %.preheader.lr.ph ], [ %22, %._crit_edge5 ]
  br i1 %2, label %.lr.ph4, label %._crit_edge5, !dbg !48

.lr.ph4:                                          ; preds = %.preheader
  %.pre = load i32* %row, align 4, !dbg !49, !tbaa !50
  br label %3, !dbg !48

; <label>:3                                       ; preds = %._crit_edge, %.lr.ph4
  %4 = phi i32 [ %.pre, %.lr.ph4 ], [ %6, %._crit_edge ], !dbg !54
  %indvars.iv8 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next9, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !55, i64 0, metadata !31), !dbg !54
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !36), !dbg !49
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !48
  %5 = getelementptr inbounds i32* %row, i64 %indvars.iv.next9, !dbg !56
  %6 = load i32* %5, align 4, !dbg !56, !tbaa !50
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !37), !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !30), !dbg !57
  %7 = icmp slt i32 %4, %6, !dbg !57
  br i1 %7, label %.lr.ph, label %._crit_edge, !dbg !57

.lr.ph:                                           ; preds = %3
  %8 = sext i32 %4 to i64
  br label %9, !dbg !57

; <label>:9                                       ; preds = %.lr.ph, %9
  %indvars.iv = phi i64 [ %8, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %sum.02 = phi double [ 0.000000e+00, %.lr.ph ], [ %18, %9 ]
  %10 = getelementptr inbounds i32* %col, i64 %indvars.iv, !dbg !59
  %11 = load i32* %10, align 4, !dbg !59, !tbaa !50
  %12 = sext i32 %11 to i64, !dbg !59
  %13 = getelementptr inbounds double* %x, i64 %12, !dbg !59
  %14 = load double* %13, align 8, !dbg !59, !tbaa !60
  %15 = getelementptr inbounds double* %val, i64 %indvars.iv, !dbg !59
  %16 = load double* %15, align 8, !dbg !59, !tbaa !60
  %17 = fmul double %14, %16, !dbg !59
  %18 = fadd double %sum.02, %17, !dbg !59
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !31), !dbg !59
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !57
  %19 = trunc i64 %indvars.iv.next to i32, !dbg !57
  %20 = icmp slt i32 %19, %6, !dbg !57
  br i1 %20, label %9, label %._crit_edge, !dbg !57

._crit_edge:                                      ; preds = %9, %3
  %sum.0.lcssa = phi double [ 0.000000e+00, %3 ], [ %18, %9 ]
  %21 = getelementptr inbounds double* %y, i64 %indvars.iv8, !dbg !62
  store double %sum.0.lcssa, double* %21, align 8, !dbg !62, !tbaa !60
  %lftr.wideiv = trunc i64 %indvars.iv.next9 to i32, !dbg !48
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !48
  br i1 %exitcond, label %._crit_edge5, label %3, !dbg !48

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader
  %22 = add nsw i32 %reps.06, 1, !dbg !47
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !28), !dbg !47
  %exitcond10 = icmp eq i32 %22, %NUM_ITERATIONS, !dbg !47
  br i1 %exitcond10, label %._crit_edge7, label %.preheader, !dbg !47

._crit_edge7:                                     ; preds = %._crit_edge5, %0
  ret void, !dbg !63
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c] [DW_LANG_C99]
!1 = metadata !{metadata !"SparseCompRow.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !15}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SparseCompRow_num_flops", metadata !"SparseCompRow_num_flops", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, i32)* @SparseCompRow_num_flops, null, null, metadata !10, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [SparseCompRow_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13, metadata !14}
!11 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 4]
!12 = metadata !{i32 786689, metadata !4, metadata !"nz", metadata !5, i32 33554436, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nz] [line 4]
!13 = metadata !{i32 786689, metadata !4, metadata !"num_iterations", metadata !5, i32 50331652, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 4]
!14 = metadata !{i32 786688, metadata !4, metadata !"actual_nz", metadata !5, i32 9, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_nz] [line 9]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SparseCompRow_matmult", metadata !"SparseCompRow_matmult", metadata !"", i32 22, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*, i32*, i32*, double*, i32)* @SparseCompRow_matmult, null, null, metadata !20, i32 24} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 24] [SparseCompRow_matmult]
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{null, metadata !9, metadata !18, metadata !18, metadata !19, metadata !19, metadata !18, metadata !9}
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !36, metadata !37}
!21 = metadata !{i32 786689, metadata !15, metadata !"M", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 22]
!22 = metadata !{i32 786689, metadata !15, metadata !"y", metadata !5, i32 33554454, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 22]
!23 = metadata !{i32 786689, metadata !15, metadata !"val", metadata !5, i32 50331670, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 22]
!24 = metadata !{i32 786689, metadata !15, metadata !"row", metadata !5, i32 67108886, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 22]
!25 = metadata !{i32 786689, metadata !15, metadata !"col", metadata !5, i32 83886103, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 23]
!26 = metadata !{i32 786689, metadata !15, metadata !"x", metadata !5, i32 100663319, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 23]
!27 = metadata !{i32 786689, metadata !15, metadata !"NUM_ITERATIONS", metadata !5, i32 117440535, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NUM_ITERATIONS] [line 23]
!28 = metadata !{i32 786688, metadata !15, metadata !"reps", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [reps] [line 25]
!29 = metadata !{i32 786688, metadata !15, metadata !"r", metadata !5, i32 26, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 26]
!30 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!31 = metadata !{i32 786688, metadata !32, metadata !"sum", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 34]
!32 = metadata !{i32 786443, metadata !1, metadata !33, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!33 = metadata !{i32 786443, metadata !1, metadata !34, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!34 = metadata !{i32 786443, metadata !1, metadata !35, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!35 = metadata !{i32 786443, metadata !1, metadata !15, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!36 = metadata !{i32 786688, metadata !32, metadata !"rowR", metadata !5, i32 35, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowR] [line 35]
!37 = metadata !{i32 786688, metadata !32, metadata !"rowRp1", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowRp1] [line 36]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 4, i32 0, metadata !4, null}
!42 = metadata !{i32 9, i32 0, metadata !4, null}
!43 = metadata !{i32 10, i32 0, metadata !4, null}
!44 = metadata !{i32 22, i32 0, metadata !15, null}
!45 = metadata !{i32 23, i32 0, metadata !15, null}
!46 = metadata !{i32 0}
!47 = metadata !{i32 29, i32 0, metadata !35, null}
!48 = metadata !{i32 32, i32 0, metadata !33, null}
!49 = metadata !{i32 35, i32 0, metadata !32, null}
!50 = metadata !{metadata !51, metadata !51, i64 0}
!51 = metadata !{metadata !"int", metadata !52, i64 0}
!52 = metadata !{metadata !"omnipotent char", metadata !53, i64 0}
!53 = metadata !{metadata !"Simple C/C++ TBAA"}
!54 = metadata !{i32 34, i32 0, metadata !32, null}
!55 = metadata !{double 0.000000e+00}
!56 = metadata !{i32 36, i32 0, metadata !32, null}
!57 = metadata !{i32 37, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !32, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!59 = metadata !{i32 38, i32 0, metadata !58, null}
!60 = metadata !{metadata !61, metadata !61, i64 0}
!61 = metadata !{metadata !"double", metadata !52, i64 0}
!62 = metadata !{i32 39, i32 0, metadata !32, null}
!63 = metadata !{i32 42, i32 0, metadata !15, null}
