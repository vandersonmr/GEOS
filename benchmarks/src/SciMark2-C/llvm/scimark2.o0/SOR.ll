; ModuleID = 'SOR.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @SOR_num_flops(i32 %M, i32 %N, i32 %num_iterations) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %Md = alloca double, align 8
  %Nd = alloca double, align 8
  %num_iterD = alloca double, align 8
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !18), !dbg !19
  store i32 %N, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !20), !dbg !19
  store i32 %num_iterations, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !21), !dbg !19
  call void @llvm.dbg.declare(metadata !{double* %Md}, metadata !22), !dbg !23
  %4 = load i32* %1, align 4, !dbg !23
  %5 = sitofp i32 %4 to double, !dbg !23
  store double %5, double* %Md, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata !{double* %Nd}, metadata !24), !dbg !25
  %6 = load i32* %2, align 4, !dbg !25
  %7 = sitofp i32 %6 to double, !dbg !25
  store double %7, double* %Nd, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata !{double* %num_iterD}, metadata !26), !dbg !27
  %8 = load i32* %3, align 4, !dbg !27
  %9 = sitofp i32 %8 to double, !dbg !27
  store double %9, double* %num_iterD, align 8, !dbg !27
  %10 = load double* %Md, align 8, !dbg !28
  %11 = fsub double %10, 1.000000e+00, !dbg !28
  %12 = load double* %Nd, align 8, !dbg !28
  %13 = fsub double %12, 1.000000e+00, !dbg !28
  %14 = fmul double %11, %13, !dbg !28
  %15 = load double* %num_iterD, align 8, !dbg !28
  %16 = fmul double %14, %15, !dbg !28
  %17 = fmul double %16, 6.000000e+00, !dbg !28
  ret double %17, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @SOR_execute(i32 %M, i32 %N, double %omega, double** %G, i32 %num_iterations) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double**, align 8
  %5 = alloca i32, align 4
  %omega_over_four = alloca double, align 8
  %one_minus_omega = alloca double, align 8
  %Mm1 = alloca i32, align 4
  %Nm1 = alloca i32, align 4
  %p = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %Gi = alloca double*, align 8
  %Gim1 = alloca double*, align 8
  %Gip1 = alloca double*, align 8
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !29), !dbg !30
  store i32 %N, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !31), !dbg !30
  store double %omega, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !32), !dbg !30
  store double** %G, double*** %4, align 8
  call void @llvm.dbg.declare(metadata !{double*** %4}, metadata !33), !dbg !30
  store i32 %num_iterations, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !34), !dbg !35
  call void @llvm.dbg.declare(metadata !{double* %omega_over_four}, metadata !36), !dbg !37
  %6 = load double* %3, align 8, !dbg !37
  %7 = fmul double %6, 2.500000e-01, !dbg !37
  store double %7, double* %omega_over_four, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata !{double* %one_minus_omega}, metadata !38), !dbg !39
  %8 = load double* %3, align 8, !dbg !39
  %9 = fsub double 1.000000e+00, %8, !dbg !39
  store double %9, double* %one_minus_omega, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata !{i32* %Mm1}, metadata !40), !dbg !41
  %10 = load i32* %1, align 4, !dbg !41
  %11 = sub nsw i32 %10, 1, !dbg !41
  store i32 %11, i32* %Mm1, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata !{i32* %Nm1}, metadata !42), !dbg !43
  %12 = load i32* %2, align 4, !dbg !43
  %13 = sub nsw i32 %12, 1, !dbg !43
  store i32 %13, i32* %Nm1, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata !{i32* %p}, metadata !44), !dbg !45
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !46), !dbg !47
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !48), !dbg !49
  call void @llvm.dbg.declare(metadata !{double** %Gi}, metadata !50), !dbg !51
  call void @llvm.dbg.declare(metadata !{double** %Gim1}, metadata !52), !dbg !53
  call void @llvm.dbg.declare(metadata !{double** %Gip1}, metadata !54), !dbg !55
  store i32 0, i32* %p, align 4, !dbg !56
  br label %14, !dbg !56

; <label>:14                                      ; preds = %93, %0
  %15 = load i32* %p, align 4, !dbg !56
  %16 = load i32* %5, align 4, !dbg !56
  %17 = icmp slt i32 %15, %16, !dbg !56
  br i1 %17, label %18, label %96, !dbg !56

; <label>:18                                      ; preds = %14
  store i32 1, i32* %i, align 4, !dbg !58
  br label %19, !dbg !58

; <label>:19                                      ; preds = %89, %18
  %20 = load i32* %i, align 4, !dbg !58
  %21 = load i32* %Mm1, align 4, !dbg !58
  %22 = icmp slt i32 %20, %21, !dbg !58
  br i1 %22, label %23, label %92, !dbg !58

; <label>:23                                      ; preds = %19
  %24 = load i32* %i, align 4, !dbg !61
  %25 = sext i32 %24 to i64, !dbg !61
  %26 = load double*** %4, align 8, !dbg !61
  %27 = getelementptr inbounds double** %26, i64 %25, !dbg !61
  %28 = load double** %27, align 8, !dbg !61
  store double* %28, double** %Gi, align 8, !dbg !61
  %29 = load i32* %i, align 4, !dbg !63
  %30 = sub nsw i32 %29, 1, !dbg !63
  %31 = sext i32 %30 to i64, !dbg !63
  %32 = load double*** %4, align 8, !dbg !63
  %33 = getelementptr inbounds double** %32, i64 %31, !dbg !63
  %34 = load double** %33, align 8, !dbg !63
  store double* %34, double** %Gim1, align 8, !dbg !63
  %35 = load i32* %i, align 4, !dbg !64
  %36 = add nsw i32 %35, 1, !dbg !64
  %37 = sext i32 %36 to i64, !dbg !64
  %38 = load double*** %4, align 8, !dbg !64
  %39 = getelementptr inbounds double** %38, i64 %37, !dbg !64
  %40 = load double** %39, align 8, !dbg !64
  store double* %40, double** %Gip1, align 8, !dbg !64
  store i32 1, i32* %j, align 4, !dbg !65
  br label %41, !dbg !65

; <label>:41                                      ; preds = %85, %23
  %42 = load i32* %j, align 4, !dbg !65
  %43 = load i32* %Nm1, align 4, !dbg !65
  %44 = icmp slt i32 %42, %43, !dbg !65
  br i1 %44, label %45, label %88, !dbg !65

; <label>:45                                      ; preds = %41
  %46 = load double* %omega_over_four, align 8, !dbg !67
  %47 = load i32* %j, align 4, !dbg !67
  %48 = sext i32 %47 to i64, !dbg !67
  %49 = load double** %Gim1, align 8, !dbg !67
  %50 = getelementptr inbounds double* %49, i64 %48, !dbg !67
  %51 = load double* %50, align 8, !dbg !67
  %52 = load i32* %j, align 4, !dbg !67
  %53 = sext i32 %52 to i64, !dbg !67
  %54 = load double** %Gip1, align 8, !dbg !67
  %55 = getelementptr inbounds double* %54, i64 %53, !dbg !67
  %56 = load double* %55, align 8, !dbg !67
  %57 = fadd double %51, %56, !dbg !67
  %58 = load i32* %j, align 4, !dbg !67
  %59 = sub nsw i32 %58, 1, !dbg !67
  %60 = sext i32 %59 to i64, !dbg !67
  %61 = load double** %Gi, align 8, !dbg !67
  %62 = getelementptr inbounds double* %61, i64 %60, !dbg !67
  %63 = load double* %62, align 8, !dbg !67
  %64 = fadd double %57, %63, !dbg !67
  %65 = load i32* %j, align 4, !dbg !67
  %66 = add nsw i32 %65, 1, !dbg !67
  %67 = sext i32 %66 to i64, !dbg !67
  %68 = load double** %Gi, align 8, !dbg !67
  %69 = getelementptr inbounds double* %68, i64 %67, !dbg !67
  %70 = load double* %69, align 8, !dbg !67
  %71 = fadd double %64, %70, !dbg !67
  %72 = fmul double %46, %71, !dbg !67
  %73 = load double* %one_minus_omega, align 8, !dbg !67
  %74 = load i32* %j, align 4, !dbg !67
  %75 = sext i32 %74 to i64, !dbg !67
  %76 = load double** %Gi, align 8, !dbg !67
  %77 = getelementptr inbounds double* %76, i64 %75, !dbg !67
  %78 = load double* %77, align 8, !dbg !67
  %79 = fmul double %73, %78, !dbg !67
  %80 = fadd double %72, %79, !dbg !67
  %81 = load i32* %j, align 4, !dbg !67
  %82 = sext i32 %81 to i64, !dbg !67
  %83 = load double** %Gi, align 8, !dbg !67
  %84 = getelementptr inbounds double* %83, i64 %82, !dbg !67
  store double %80, double* %84, align 8, !dbg !67
  br label %85, !dbg !67

; <label>:85                                      ; preds = %45
  %86 = load i32* %j, align 4, !dbg !65
  %87 = add nsw i32 %86, 1, !dbg !65
  store i32 %87, i32* %j, align 4, !dbg !65
  br label %41, !dbg !65

; <label>:88                                      ; preds = %41
  br label %89, !dbg !68

; <label>:89                                      ; preds = %88
  %90 = load i32* %i, align 4, !dbg !58
  %91 = add nsw i32 %90, 1, !dbg !58
  store i32 %91, i32* %i, align 4, !dbg !58
  br label %19, !dbg !58

; <label>:92                                      ; preds = %19
  br label %93, !dbg !69

; <label>:93                                      ; preds = %92
  %94 = load i32* %p, align 4, !dbg !56
  %95 = add nsw i32 %94, 1, !dbg !56
  store i32 %95, i32* %p, align 4, !dbg !56
  br label %14, !dbg !56

; <label>:96                                      ; preds = %14
  ret void, !dbg !70
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c] [DW_LANG_C99]
!1 = metadata !{metadata !"SOR.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SOR_num_flops", metadata !"SOR_num_flops", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32, i32)* @SOR_num_flops, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [SOR_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SOR_execute", metadata !"SOR_execute", metadata !"", i32 12, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, double, double**, i32)* @SOR_execute, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 14] [SOR_execute]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !9, metadata !8, metadata !13, metadata !9}
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777219, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 3]
!19 = metadata !{i32 3, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554435, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 3]
!21 = metadata !{i32 786689, metadata !4, metadata !"num_iterations", metadata !5, i32 50331651, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 3]
!22 = metadata !{i32 786688, metadata !4, metadata !"Md", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Md] [line 5]
!23 = metadata !{i32 5, i32 0, metadata !4, null}
!24 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 6]
!25 = metadata !{i32 6, i32 0, metadata !4, null}
!26 = metadata !{i32 786688, metadata !4, metadata !"num_iterD", metadata !5, i32 7, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_iterD] [line 7]
!27 = metadata !{i32 7, i32 0, metadata !4, null}
!28 = metadata !{i32 9, i32 0, metadata !4, null}
!29 = metadata !{i32 786689, metadata !10, metadata !"M", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 12]
!30 = metadata !{i32 12, i32 0, metadata !10, null}
!31 = metadata !{i32 786689, metadata !10, metadata !"N", metadata !5, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 12]
!32 = metadata !{i32 786689, metadata !10, metadata !"omega", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [omega] [line 12]
!33 = metadata !{i32 786689, metadata !10, metadata !"G", metadata !5, i32 67108876, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [G] [line 12]
!34 = metadata !{i32 786689, metadata !10, metadata !"num_iterations", metadata !5, i32 83886093, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 13]
!35 = metadata !{i32 13, i32 0, metadata !10, null}
!36 = metadata !{i32 786688, metadata !10, metadata !"omega_over_four", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [omega_over_four] [line 16]
!37 = metadata !{i32 16, i32 0, metadata !10, null}
!38 = metadata !{i32 786688, metadata !10, metadata !"one_minus_omega", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [one_minus_omega] [line 17]
!39 = metadata !{i32 17, i32 0, metadata !10, null}
!40 = metadata !{i32 786688, metadata !10, metadata !"Mm1", metadata !5, i32 21, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Mm1] [line 21]
!41 = metadata !{i32 21, i32 0, metadata !10, null}
!42 = metadata !{i32 786688, metadata !10, metadata !"Nm1", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nm1] [line 22]
!43 = metadata !{i32 22, i32 0, metadata !10, null}
!44 = metadata !{i32 786688, metadata !10, metadata !"p", metadata !5, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 23]
!45 = metadata !{i32 23, i32 0, metadata !10, null}
!46 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 24, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!47 = metadata !{i32 24, i32 0, metadata !10, null}
!48 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!49 = metadata !{i32 25, i32 0, metadata !10, null}
!50 = metadata !{i32 786688, metadata !10, metadata !"Gi", metadata !5, i32 26, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gi] [line 26]
!51 = metadata !{i32 26, i32 0, metadata !10, null}
!52 = metadata !{i32 786688, metadata !10, metadata !"Gim1", metadata !5, i32 27, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gim1] [line 27]
!53 = metadata !{i32 27, i32 0, metadata !10, null}
!54 = metadata !{i32 786688, metadata !10, metadata !"Gip1", metadata !5, i32 28, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gip1] [line 28]
!55 = metadata !{i32 28, i32 0, metadata !10, null}
!56 = metadata !{i32 30, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !10, i32 30, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!58 = metadata !{i32 32, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!60 = metadata !{i32 786443, metadata !1, metadata !57, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!61 = metadata !{i32 34, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !59, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!63 = metadata !{i32 35, i32 0, metadata !62, null}
!64 = metadata !{i32 36, i32 0, metadata !62, null}
!65 = metadata !{i32 37, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !62, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!67 = metadata !{i32 38, i32 0, metadata !66, null}
!68 = metadata !{i32 40, i32 0, metadata !62, null}
!69 = metadata !{i32 41, i32 0, metadata !60, null}
!70 = metadata !{i32 42, i32 0, metadata !10, null}
