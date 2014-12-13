; ModuleID = 'SparseCompRow.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
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

; Function Attrs: nounwind uwtable
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
  br i1 %2, label %.lr.ph4.us, label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph
  %n.vec = and i32 %NUM_ITERATIONS, -32, !dbg !47
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !47
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %.preheader ], !dbg !47
  %index.next = add i32 %index, 32, !dbg !47
  %3 = icmp eq i32 %index.next, %n.vec, !dbg !47
  br i1 %3, label %middle.block, label %vector.body, !dbg !47, !llvm.loop !49

middle.block:                                     ; preds = %vector.body, %.preheader
  %resume.val = phi i32 [ 0, %.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i32 %resume.val, %NUM_ITERATIONS
  br i1 %cmp.n, label %._crit_edge7, label %scalar.ph

; <label>:4                                       ; preds = %._crit_edge.us
  %5 = add nsw i32 %reps.06.us, 1, !dbg !47
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !28), !dbg !47
  %exitcond11 = icmp eq i32 %5, %NUM_ITERATIONS, !dbg !47
  br i1 %exitcond11, label %._crit_edge7, label %.lr.ph4.us, !dbg !47

; <label>:6                                       ; preds = %._crit_edge.us, %.lr.ph4.us
  %indvars.iv8 = phi i64 [ 0, %.lr.ph4.us ], [ %indvars.iv.next9, %._crit_edge.us ]
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !31), !dbg !53
  %7 = getelementptr inbounds i32* %row, i64 %indvars.iv8, !dbg !54
  %8 = load i32* %7, align 4, !dbg !54, !tbaa !55
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !36), !dbg !54
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !48
  %9 = getelementptr inbounds i32* %row, i64 %indvars.iv.next9, !dbg !59
  %10 = load i32* %9, align 4, !dbg !59, !tbaa !55
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !37), !dbg !59
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !30), !dbg !60
  %11 = icmp slt i32 %8, %10, !dbg !60
  br i1 %11, label %.lr.ph.us, label %._crit_edge.us, !dbg !60

._crit_edge.us:                                   ; preds = %13, %6
  %sum.0.lcssa.us = phi double [ 0.000000e+00, %6 ], [ %22, %13 ]
  %12 = getelementptr inbounds double* %y, i64 %indvars.iv8, !dbg !62
  store double %sum.0.lcssa.us, double* %12, align 8, !dbg !62, !tbaa !63
  %lftr.wideiv = trunc i64 %indvars.iv.next9 to i32, !dbg !48
  %exitcond10 = icmp eq i32 %lftr.wideiv, %M, !dbg !48
  br i1 %exitcond10, label %4, label %6, !dbg !48

; <label>:13                                      ; preds = %.lr.ph.us, %13
  %indvars.iv = phi i64 [ %25, %.lr.ph.us ], [ %indvars.iv.next, %13 ]
  %sum.02.us = phi double [ 0.000000e+00, %.lr.ph.us ], [ %22, %13 ]
  %14 = getelementptr inbounds i32* %col, i64 %indvars.iv, !dbg !65
  %15 = load i32* %14, align 4, !dbg !65, !tbaa !55
  %16 = sext i32 %15 to i64, !dbg !65
  %17 = getelementptr inbounds double* %x, i64 %16, !dbg !65
  %18 = load double* %17, align 8, !dbg !65, !tbaa !63
  %19 = getelementptr inbounds double* %val, i64 %indvars.iv, !dbg !65
  %20 = load double* %19, align 8, !dbg !65, !tbaa !63
  %21 = fmul double %18, %20, !dbg !65
  %22 = fadd double %sum.02.us, %21, !dbg !65
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !31), !dbg !65
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !60
  %23 = trunc i64 %indvars.iv.next to i32, !dbg !60
  %24 = icmp slt i32 %23, %10, !dbg !60
  br i1 %24, label %13, label %._crit_edge.us, !dbg !60

.lr.ph.us:                                        ; preds = %6
  %25 = sext i32 %8 to i64
  br label %13, !dbg !60

.lr.ph4.us:                                       ; preds = %.preheader.lr.ph, %4
  %reps.06.us = phi i32 [ %5, %4 ], [ 0, %.preheader.lr.ph ]
  br label %6, !dbg !48

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %reps.06 = phi i32 [ %26, %scalar.ph ], [ %resume.val, %middle.block ]
  %26 = add nsw i32 %reps.06, 1, !dbg !47
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !28), !dbg !47
  %exitcond = icmp eq i32 %26, %NUM_ITERATIONS, !dbg !47
  br i1 %exitcond, label %._crit_edge7, label %scalar.ph, !dbg !47, !llvm.loop !66

._crit_edge7:                                     ; preds = %scalar.ph, %middle.block, %4, %0
  ret void, !dbg !67
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!49 = metadata !{metadata !49, metadata !50, metadata !51}
!50 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!51 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!52 = metadata !{double 0.000000e+00}
!53 = metadata !{i32 34, i32 0, metadata !32, null}
!54 = metadata !{i32 35, i32 0, metadata !32, null}
!55 = metadata !{metadata !56, metadata !56, i64 0}
!56 = metadata !{metadata !"int", metadata !57, i64 0}
!57 = metadata !{metadata !"omnipotent char", metadata !58, i64 0}
!58 = metadata !{metadata !"Simple C/C++ TBAA"}
!59 = metadata !{i32 36, i32 0, metadata !32, null}
!60 = metadata !{i32 37, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !32, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!62 = metadata !{i32 39, i32 0, metadata !32, null}
!63 = metadata !{metadata !64, metadata !64, i64 0}
!64 = metadata !{metadata !"double", metadata !57, i64 0}
!65 = metadata !{i32 38, i32 0, metadata !61, null}
!66 = metadata !{metadata !66, metadata !50, metadata !51}
!67 = metadata !{i32 42, i32 0, metadata !15, null}
