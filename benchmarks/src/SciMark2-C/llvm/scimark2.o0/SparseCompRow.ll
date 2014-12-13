; ModuleID = 'SparseCompRow.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define double @SparseCompRow_num_flops(i32 %N, i32 %nz, i32 %num_iterations) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %actual_nz = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !18), !dbg !19
  store i32 %nz, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !20), !dbg !19
  store i32 %num_iterations, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !21), !dbg !19
  call void @llvm.dbg.declare(metadata !{i32* %actual_nz}, metadata !22), !dbg !23
  %4 = load i32* %2, align 4, !dbg !23
  %5 = load i32* %1, align 4, !dbg !23
  %6 = sdiv i32 %4, %5, !dbg !23
  %7 = load i32* %1, align 4, !dbg !23
  %8 = mul nsw i32 %6, %7, !dbg !23
  store i32 %8, i32* %actual_nz, align 4, !dbg !23
  %9 = load i32* %actual_nz, align 4, !dbg !24
  %10 = sitofp i32 %9 to double, !dbg !24
  %11 = fmul double %10, 2.000000e+00, !dbg !24
  %12 = load i32* %3, align 4, !dbg !24
  %13 = sitofp i32 %12 to double, !dbg !24
  %14 = fmul double %11, %13, !dbg !24
  ret double %14, !dbg !24
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @SparseCompRow_matmult(i32 %M, double* %y, double* %val, i32* %row, i32* %col, double* %x, i32 %NUM_ITERATIONS) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %reps = alloca i32, align 4
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca double, align 8
  %rowR = alloca i32, align 4
  %rowRp1 = alloca i32, align 4
  store i32 %M, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !25), !dbg !26
  store double* %y, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !27), !dbg !26
  store double* %val, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !28), !dbg !26
  store i32* %row, i32** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32** %4}, metadata !29), !dbg !26
  store i32* %col, i32** %5, align 8
  call void @llvm.dbg.declare(metadata !{i32** %5}, metadata !30), !dbg !31
  store double* %x, double** %6, align 8
  call void @llvm.dbg.declare(metadata !{double** %6}, metadata !32), !dbg !31
  store i32 %NUM_ITERATIONS, i32* %7, align 4
  call void @llvm.dbg.declare(metadata !{i32* %7}, metadata !33), !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %reps}, metadata !34), !dbg !35
  call void @llvm.dbg.declare(metadata !{i32* %r}, metadata !36), !dbg !37
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !38), !dbg !39
  store i32 0, i32* %reps, align 4, !dbg !40
  br label %8, !dbg !40

; <label>:8                                       ; preds = %65, %0
  %9 = load i32* %reps, align 4, !dbg !40
  %10 = load i32* %7, align 4, !dbg !40
  %11 = icmp slt i32 %9, %10, !dbg !40
  br i1 %11, label %12, label %68, !dbg !40

; <label>:12                                      ; preds = %8
  store i32 0, i32* %r, align 4, !dbg !42
  br label %13, !dbg !42

; <label>:13                                      ; preds = %61, %12
  %14 = load i32* %r, align 4, !dbg !42
  %15 = load i32* %1, align 4, !dbg !42
  %16 = icmp slt i32 %14, %15, !dbg !42
  br i1 %16, label %17, label %64, !dbg !42

; <label>:17                                      ; preds = %13
  call void @llvm.dbg.declare(metadata !{double* %sum}, metadata !45), !dbg !47
  store double 0.000000e+00, double* %sum, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata !{i32* %rowR}, metadata !48), !dbg !49
  %18 = load i32* %r, align 4, !dbg !49
  %19 = sext i32 %18 to i64, !dbg !49
  %20 = load i32** %4, align 8, !dbg !49
  %21 = getelementptr inbounds i32* %20, i64 %19, !dbg !49
  %22 = load i32* %21, align 4, !dbg !49
  store i32 %22, i32* %rowR, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata !{i32* %rowRp1}, metadata !50), !dbg !51
  %23 = load i32* %r, align 4, !dbg !51
  %24 = add nsw i32 %23, 1, !dbg !51
  %25 = sext i32 %24 to i64, !dbg !51
  %26 = load i32** %4, align 8, !dbg !51
  %27 = getelementptr inbounds i32* %26, i64 %25, !dbg !51
  %28 = load i32* %27, align 4, !dbg !51
  store i32 %28, i32* %rowRp1, align 4, !dbg !51
  %29 = load i32* %rowR, align 4, !dbg !52
  store i32 %29, i32* %i, align 4, !dbg !52
  br label %30, !dbg !52

; <label>:30                                      ; preds = %52, %17
  %31 = load i32* %i, align 4, !dbg !52
  %32 = load i32* %rowRp1, align 4, !dbg !52
  %33 = icmp slt i32 %31, %32, !dbg !52
  br i1 %33, label %34, label %55, !dbg !52

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4, !dbg !54
  %36 = sext i32 %35 to i64, !dbg !54
  %37 = load i32** %5, align 8, !dbg !54
  %38 = getelementptr inbounds i32* %37, i64 %36, !dbg !54
  %39 = load i32* %38, align 4, !dbg !54
  %40 = sext i32 %39 to i64, !dbg !54
  %41 = load double** %6, align 8, !dbg !54
  %42 = getelementptr inbounds double* %41, i64 %40, !dbg !54
  %43 = load double* %42, align 8, !dbg !54
  %44 = load i32* %i, align 4, !dbg !54
  %45 = sext i32 %44 to i64, !dbg !54
  %46 = load double** %3, align 8, !dbg !54
  %47 = getelementptr inbounds double* %46, i64 %45, !dbg !54
  %48 = load double* %47, align 8, !dbg !54
  %49 = fmul double %43, %48, !dbg !54
  %50 = load double* %sum, align 8, !dbg !54
  %51 = fadd double %50, %49, !dbg !54
  store double %51, double* %sum, align 8, !dbg !54
  br label %52, !dbg !54

; <label>:52                                      ; preds = %34
  %53 = load i32* %i, align 4, !dbg !52
  %54 = add nsw i32 %53, 1, !dbg !52
  store i32 %54, i32* %i, align 4, !dbg !52
  br label %30, !dbg !52

; <label>:55                                      ; preds = %30
  %56 = load double* %sum, align 8, !dbg !55
  %57 = load i32* %r, align 4, !dbg !55
  %58 = sext i32 %57 to i64, !dbg !55
  %59 = load double** %2, align 8, !dbg !55
  %60 = getelementptr inbounds double* %59, i64 %58, !dbg !55
  store double %56, double* %60, align 8, !dbg !55
  br label %61, !dbg !56

; <label>:61                                      ; preds = %55
  %62 = load i32* %r, align 4, !dbg !42
  %63 = add nsw i32 %62, 1, !dbg !42
  store i32 %63, i32* %r, align 4, !dbg !42
  br label %13, !dbg !42

; <label>:64                                      ; preds = %13
  br label %65, !dbg !57

; <label>:65                                      ; preds = %64
  %66 = load i32* %reps, align 4, !dbg !40
  %67 = add nsw i32 %66, 1, !dbg !40
  store i32 %67, i32* %reps, align 4, !dbg !40
  br label %8, !dbg !40

; <label>:68                                      ; preds = %8
  ret void, !dbg !58
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c] [DW_LANG_C99]
!1 = metadata !{metadata !"SparseCompRow.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SparseCompRow_num_flops", metadata !"SparseCompRow_num_flops", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32, i32)* @SparseCompRow_num_flops, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [SparseCompRow_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SparseCompRow_matmult", metadata !"SparseCompRow_matmult", metadata !"", i32 22, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*, double*, i32*, i32*, double*, i32)* @SparseCompRow_matmult, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 24] [SparseCompRow_matmult]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !13, metadata !13, metadata !14, metadata !14, metadata !13, metadata !9}
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!15 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!16 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!17 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!18 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 4]
!19 = metadata !{i32 4, i32 0, metadata !4, null}
!20 = metadata !{i32 786689, metadata !4, metadata !"nz", metadata !5, i32 33554436, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nz] [line 4]
!21 = metadata !{i32 786689, metadata !4, metadata !"num_iterations", metadata !5, i32 50331652, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 4]
!22 = metadata !{i32 786688, metadata !4, metadata !"actual_nz", metadata !5, i32 9, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_nz] [line 9]
!23 = metadata !{i32 9, i32 0, metadata !4, null}
!24 = metadata !{i32 10, i32 0, metadata !4, null}
!25 = metadata !{i32 786689, metadata !10, metadata !"M", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 22]
!26 = metadata !{i32 22, i32 0, metadata !10, null}
!27 = metadata !{i32 786689, metadata !10, metadata !"y", metadata !5, i32 33554454, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 22]
!28 = metadata !{i32 786689, metadata !10, metadata !"val", metadata !5, i32 50331670, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 22]
!29 = metadata !{i32 786689, metadata !10, metadata !"row", metadata !5, i32 67108886, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 22]
!30 = metadata !{i32 786689, metadata !10, metadata !"col", metadata !5, i32 83886103, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [col] [line 23]
!31 = metadata !{i32 23, i32 0, metadata !10, null}
!32 = metadata !{i32 786689, metadata !10, metadata !"x", metadata !5, i32 100663319, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 23]
!33 = metadata !{i32 786689, metadata !10, metadata !"NUM_ITERATIONS", metadata !5, i32 117440535, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [NUM_ITERATIONS] [line 23]
!34 = metadata !{i32 786688, metadata !10, metadata !"reps", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [reps] [line 25]
!35 = metadata !{i32 25, i32 0, metadata !10, null}
!36 = metadata !{i32 786688, metadata !10, metadata !"r", metadata !5, i32 26, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 26]
!37 = metadata !{i32 26, i32 0, metadata !10, null}
!38 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!39 = metadata !{i32 27, i32 0, metadata !10, null}
!40 = metadata !{i32 29, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !10, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!42 = metadata !{i32 32, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !44, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!44 = metadata !{i32 786443, metadata !1, metadata !41, i32 30, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!45 = metadata !{i32 786688, metadata !46, metadata !"sum", metadata !5, i32 34, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 34]
!46 = metadata !{i32 786443, metadata !1, metadata !43, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!47 = metadata !{i32 34, i32 0, metadata !46, null}
!48 = metadata !{i32 786688, metadata !46, metadata !"rowR", metadata !5, i32 35, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowR] [line 35]
!49 = metadata !{i32 35, i32 0, metadata !46, null}
!50 = metadata !{i32 786688, metadata !46, metadata !"rowRp1", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowRp1] [line 36]
!51 = metadata !{i32 36, i32 0, metadata !46, null}
!52 = metadata !{i32 37, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !46, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SparseCompRow.c]
!54 = metadata !{i32 38, i32 0, metadata !53, null}
!55 = metadata !{i32 39, i32 0, metadata !46, null}
!56 = metadata !{i32 40, i32 0, metadata !46, null}
!57 = metadata !{i32 41, i32 0, metadata !44, null}
!58 = metadata !{i32 42, i32 0, metadata !10, null}
