; ModuleID = 'MonteCarlo.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

; Function Attrs: minsize nounwind optsize readnone uwtable
define double @MonteCarlo_num_flops(i32 %Num_samples) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %Num_samples}, i64 0, metadata !11), !dbg !44
  %1 = sitofp i32 %Num_samples to double, !dbg !45
  %2 = fmul double %1, 4.000000e+00, !dbg !45
  ret double %2, !dbg !45
}

; Function Attrs: minsize nounwind optsize uwtable
define double @MonteCarlo_integrate(i32 %Num_samples) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %Num_samples}, i64 0, metadata !14), !dbg !46
  %1 = tail call %struct.Random_struct* @new_Random_seed(i32 113) #4, !dbg !47
  tail call void @llvm.dbg.value(metadata !{%struct.Random_struct* %1}, i64 0, metadata !15), !dbg !47
  tail call void @llvm.dbg.value(metadata !48, i64 0, metadata !32), !dbg !49
  tail call void @llvm.dbg.value(metadata !48, i64 0, metadata !33), !dbg !50
  %2 = icmp sgt i32 %Num_samples, 0, !dbg !50
  br i1 %2, label %.lr.ph, label %10, !dbg !50

.lr.ph:                                           ; preds = %0, %.lr.ph
  %under_curve.02 = phi i32 [ %under_curve.1, %.lr.ph ], [ 0, %0 ]
  %count.01 = phi i32 [ %9, %.lr.ph ], [ 0, %0 ]
  %3 = tail call double @Random_nextDouble(%struct.Random_struct* %1) #4, !dbg !51
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !34), !dbg !51
  %4 = tail call double @Random_nextDouble(%struct.Random_struct* %1) #4, !dbg !52
  tail call void @llvm.dbg.value(metadata !{double %4}, i64 0, metadata !37), !dbg !52
  %5 = fmul double %3, %3, !dbg !53
  %6 = fmul double %4, %4, !dbg !53
  %7 = fadd double %5, %6, !dbg !53
  %not. = fcmp ole double %7, 1.000000e+00, !dbg !53
  %8 = zext i1 %not. to i32, !dbg !53
  %under_curve.1 = add nsw i32 %8, %under_curve.02, !dbg !53
  %9 = add nsw i32 %count.01, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !33), !dbg !50
  %exitcond = icmp eq i32 %9, %Num_samples, !dbg !50
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !50

._crit_edge:                                      ; preds = %.lr.ph
  %phitmp = sitofp i32 %under_curve.1 to double, !dbg !50
  br label %10, !dbg !50

; <label>:10                                      ; preds = %._crit_edge, %0
  %under_curve.0.lcssa = phi double [ %phitmp, %._crit_edge ], [ 0.000000e+00, %0 ]
  tail call void @Random_delete(%struct.Random_struct* %1) #4, !dbg !55
  %11 = sitofp i32 %Num_samples to double, !dbg !56
  %12 = fdiv double %under_curve.0.lcssa, %11, !dbg !56
  %13 = fmul double %12, 4.000000e+00, !dbg !56
  ret double %13, !dbg !56
}

; Function Attrs: minsize optsize
declare %struct.Random_struct* @new_Random_seed(i32) #2

; Function Attrs: minsize optsize
declare double @Random_nextDouble(%struct.Random_struct*) #2

; Function Attrs: minsize optsize
declare void @Random_delete(%struct.Random_struct*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { minsize nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!41, !42}
!llvm.ident = !{!43}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !38, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c] [DW_LANG_C99]
!1 = metadata !{metadata !"MonteCarlo.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"MonteCarlo_num_flops", metadata !"MonteCarlo_num_flops", metadata !"", i32 35, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32)* @MonteCarlo_num_flops, null, null, metadata !10, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [MonteCarlo_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786689, metadata !4, metadata !"Num_samples", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Num_samples] [line 35]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"MonteCarlo_integrate", metadata !"MonteCarlo_integrate", metadata !"", i32 45, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32)* @MonteCarlo_integrate, null, null, metadata !13, i32 46} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [MonteCarlo_integrate]
!13 = metadata !{metadata !14, metadata !15, metadata !32, metadata !33, metadata !34, metadata !37}
!14 = metadata !{i32 786689, metadata !12, metadata !"Num_samples", metadata !5, i32 16777261, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Num_samples] [line 45]
!15 = metadata !{i32 786688, metadata !12, metadata !"R", metadata !5, i32 49, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 49]
!16 = metadata !{i32 786454, metadata !17, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!19 = metadata !{i32 786451, metadata !17, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!20 = metadata !{metadata !21, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!21 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!22 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !9, metadata !23, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!25 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !9} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!26 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !9} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!27 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !9} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!28 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !9} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!29 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !8} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!30 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !8} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!31 = metadata !{i32 786445, metadata !17, metadata !19, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !8} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!32 = metadata !{i32 786688, metadata !12, metadata !"under_curve", metadata !5, i32 52, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [under_curve] [line 52]
!33 = metadata !{i32 786688, metadata !12, metadata !"count", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 53]
!34 = metadata !{i32 786688, metadata !35, metadata !"x", metadata !5, i32 57, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 57]
!35 = metadata !{i32 786443, metadata !1, metadata !36, i32 56, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!36 = metadata !{i32 786443, metadata !1, metadata !12, i32 55, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!37 = metadata !{i32 786688, metadata !35, metadata !"y", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 58]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786484, i32 0, metadata !5, metadata !"SEED", metadata !"SEED", metadata !"SEED", metadata !5, i32 32, metadata !40, i32 1, i32 1, i32 113, null} ; [ DW_TAG_variable ] [SEED] [line 32] [local] [def]
!40 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!41 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!42 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!43 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!44 = metadata !{i32 35, i32 0, metadata !4, null}
!45 = metadata !{i32 39, i32 0, metadata !4, null}
!46 = metadata !{i32 45, i32 0, metadata !12, null}
!47 = metadata !{i32 49, i32 0, metadata !12, null}
!48 = metadata !{i32 0}
!49 = metadata !{i32 52, i32 0, metadata !12, null}
!50 = metadata !{i32 55, i32 0, metadata !36, null}
!51 = metadata !{i32 57, i32 0, metadata !35, null}
!52 = metadata !{i32 58, i32 0, metadata !35, null} ; [ DW_TAG_imported_module ]
!53 = metadata !{i32 60, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !35, i32 60, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!55 = metadata !{i32 65, i32 0, metadata !12, null}
!56 = metadata !{i32 67, i32 0, metadata !12, null}
