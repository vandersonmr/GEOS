; ModuleID = 'MonteCarlo.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

; Function Attrs: nounwind uwtable
define double @MonteCarlo_num_flops(i32 %Num_samples) #0 {
  %1 = alloca i32, align 4
  store i32 %Num_samples, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !17), !dbg !18
  %2 = load i32* %1, align 4, !dbg !19
  %3 = sitofp i32 %2 to double, !dbg !19
  %4 = fmul double %3, 4.000000e+00, !dbg !19
  ret double %4, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @MonteCarlo_integrate(i32 %Num_samples) #0 {
  %1 = alloca i32, align 4
  %R = alloca %struct.Random_struct*, align 8
  %under_curve = alloca i32, align 4
  %count = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  store i32 %Num_samples, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !20), !dbg !21
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %R}, metadata !22), !dbg !39
  %2 = call %struct.Random_struct* @new_Random_seed(i32 113), !dbg !39
  store %struct.Random_struct* %2, %struct.Random_struct** %R, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata !{i32* %under_curve}, metadata !40), !dbg !41
  store i32 0, i32* %under_curve, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !42), !dbg !43
  store i32 0, i32* %count, align 4, !dbg !44
  br label %3, !dbg !44

; <label>:3                                       ; preds = %24, %0
  %4 = load i32* %count, align 4, !dbg !44
  %5 = load i32* %1, align 4, !dbg !44
  %6 = icmp slt i32 %4, %5, !dbg !44
  br i1 %6, label %7, label %27, !dbg !44

; <label>:7                                       ; preds = %3
  call void @llvm.dbg.declare(metadata !{double* %x}, metadata !46), !dbg !48
  %8 = load %struct.Random_struct** %R, align 8, !dbg !48
  %9 = call double @Random_nextDouble(%struct.Random_struct* %8), !dbg !48
  store double %9, double* %x, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata !{double* %y}, metadata !49), !dbg !50
  %10 = load %struct.Random_struct** %R, align 8, !dbg !50
  %11 = call double @Random_nextDouble(%struct.Random_struct* %10), !dbg !50
  store double %11, double* %y, align 8, !dbg !50
  %12 = load double* %x, align 8, !dbg !51
  %13 = load double* %x, align 8, !dbg !51
  %14 = fmul double %12, %13, !dbg !51
  %15 = load double* %y, align 8, !dbg !51
  %16 = load double* %y, align 8, !dbg !51
  %17 = fmul double %15, %16, !dbg !51
  %18 = fadd double %14, %17, !dbg !51
  %19 = fcmp ole double %18, 1.000000e+00, !dbg !51
  br i1 %19, label %20, label %23, !dbg !51

; <label>:20                                      ; preds = %7
  %21 = load i32* %under_curve, align 4, !dbg !53
  %22 = add nsw i32 %21, 1, !dbg !53
  store i32 %22, i32* %under_curve, align 4, !dbg !53
  br label %23, !dbg !53

; <label>:23                                      ; preds = %20, %7
  br label %24, !dbg !54

; <label>:24                                      ; preds = %23
  %25 = load i32* %count, align 4, !dbg !44
  %26 = add nsw i32 %25, 1, !dbg !44
  store i32 %26, i32* %count, align 4, !dbg !44
  br label %3, !dbg !44

; <label>:27                                      ; preds = %3
  %28 = load %struct.Random_struct** %R, align 8, !dbg !55
  call void @Random_delete(%struct.Random_struct* %28), !dbg !55
  %29 = load i32* %under_curve, align 4, !dbg !56
  %30 = sitofp i32 %29 to double, !dbg !56
  %31 = load i32* %1, align 4, !dbg !56
  %32 = sitofp i32 %31 to double, !dbg !56
  %33 = fdiv double %30, %32, !dbg !56
  %34 = fmul double %33, 4.000000e+00, !dbg !56
  ret double %34, !dbg !56
}

declare %struct.Random_struct* @new_Random_seed(i32) #2

declare double @Random_nextDouble(%struct.Random_struct*) #2

declare void @Random_delete(%struct.Random_struct*) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !11, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c] [DW_LANG_C99]
!1 = metadata !{metadata !"MonteCarlo.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"MonteCarlo_num_flops", metadata !"MonteCarlo_num_flops", metadata !"", i32 35, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32)* @MonteCarlo_num_flops, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [MonteCarlo_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"MonteCarlo_integrate", metadata !"MonteCarlo_integrate", metadata !"", i32 45, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32)* @MonteCarlo_integrate, null, null, metadata !2, i32 46} ; [ DW_TAG_subprogram ] [line 45] [def] [scope 46] [MonteCarlo_integrate]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786484, i32 0, metadata !5, metadata !"SEED", metadata !"SEED", metadata !"SEED", metadata !5, i32 32, metadata !13, i32 1, i32 1, i32 113, null} ; [ DW_TAG_variable ] [SEED] [line 32] [local] [def]
!13 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!17 = metadata !{i32 786689, metadata !4, metadata !"Num_samples", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Num_samples] [line 35]
!18 = metadata !{i32 35, i32 0, metadata !4, null}
!19 = metadata !{i32 39, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !10, metadata !"Num_samples", metadata !5, i32 16777261, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Num_samples] [line 45]
!21 = metadata !{i32 45, i32 0, metadata !10, null}
!22 = metadata !{i32 786688, metadata !10, metadata !"R", metadata !5, i32 49, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 49]
!23 = metadata !{i32 786454, metadata !24, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786451, metadata !24, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!27 = metadata !{metadata !28, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38}
!28 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!29 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !9, metadata !30, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!32 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !9} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!33 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !9} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!34 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !9} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!35 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !9} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!36 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !8} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!37 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !8} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!38 = metadata !{i32 786445, metadata !24, metadata !26, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !8} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!39 = metadata !{i32 49, i32 0, metadata !10, null}
!40 = metadata !{i32 786688, metadata !10, metadata !"under_curve", metadata !5, i32 52, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [under_curve] [line 52]
!41 = metadata !{i32 52, i32 0, metadata !10, null}
!42 = metadata !{i32 786688, metadata !10, metadata !"count", metadata !5, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 53]
!43 = metadata !{i32 53, i32 0, metadata !10, null}
!44 = metadata !{i32 55, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !10, i32 55, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!46 = metadata !{i32 786688, metadata !47, metadata !"x", metadata !5, i32 57, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 57]
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 56, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!48 = metadata !{i32 57, i32 0, metadata !47, null}
!49 = metadata !{i32 786688, metadata !47, metadata !"y", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 58]
!50 = metadata !{i32 58, i32 0, metadata !47, null} ; [ DW_TAG_imported_module ]
!51 = metadata !{i32 60, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !47, i32 60, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/MonteCarlo.c]
!53 = metadata !{i32 61, i32 0, metadata !52, null}
!54 = metadata !{i32 63, i32 0, metadata !47, null}
!55 = metadata !{i32 65, i32 0, metadata !10, null}
!56 = metadata !{i32 67, i32 0, metadata !10, null}
