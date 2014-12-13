; ModuleID = 'dt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c" %i iterations of each test. \00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c" inner loop / array size %i.\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %dvec1 = alloca double*, align 8
  %dvec2 = alloca double*, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !26), !dbg !27
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !28), !dbg !27
  call void @llvm.dbg.declare(metadata !{double** %dvec1}, metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata !{double** %dvec2}, metadata !31), !dbg !30
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !32), !dbg !34
  %4 = bitcast double** %dvec1 to i8**, !dbg !35
  %5 = call i32 @posix_memalign(i8** %4, i64 16, i64 16384) #5, !dbg !35
  %6 = bitcast double** %dvec2 to i8**, !dbg !36
  %7 = call i32 @posix_memalign(i8** %6, i64 16, i64 16384) #5, !dbg !36
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0), i32 131072), !dbg !37
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i32 2048), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %10, !dbg !39

; <label>:10                                      ; preds = %32, %0
  %11 = load i64* %i, align 8, !dbg !39
  %12 = icmp slt i64 %11, 2048, !dbg !39
  br i1 %12, label %13, label %35, !dbg !39

; <label>:13                                      ; preds = %10
  %14 = load i64* %i, align 8, !dbg !41
  %15 = sub nsw i64 2048, %14, !dbg !41
  %16 = sitofp i64 %15 to float, !dbg !41
  %17 = call float @cosf(float %16) #5, !dbg !41
  %18 = fpext float %17 to double, !dbg !41
  %19 = fmul double 0x3FF000001AD7F29B, %18, !dbg !41
  %20 = load i64* %i, align 8, !dbg !41
  %21 = load double** %dvec1, align 8, !dbg !41
  %22 = getelementptr inbounds double* %21, i64 %20, !dbg !41
  store double %19, double* %22, align 8, !dbg !41
  %23 = load i64* %i, align 8, !dbg !43
  %24 = sitofp i64 %23 to float, !dbg !43
  %25 = call float @sinf(float %24) #5, !dbg !43
  %26 = fpext float %25 to double, !dbg !43
  %27 = fmul double 1.000000e-10, %26, !dbg !43
  %28 = fadd double 1.000000e+00, %27, !dbg !43
  %29 = load i64* %i, align 8, !dbg !43
  %30 = load double** %dvec2, align 8, !dbg !43
  %31 = getelementptr inbounds double* %30, i64 %29, !dbg !43
  store double %28, double* %31, align 8, !dbg !43
  br label %32, !dbg !44

; <label>:32                                      ; preds = %13
  %33 = load i64* %i, align 8, !dbg !39
  %34 = add nsw i64 %33, 1, !dbg !39
  store i64 %34, i64* %i, align 8, !dbg !39
  br label %10, !dbg !39

; <label>:35                                      ; preds = %10
  %36 = load double** %dvec1, align 8, !dbg !45
  %37 = load double** %dvec2, align 8, !dbg !45
  call void @double_array_divs_variable(double* %36, double* %37), !dbg !45
  %38 = load double** %dvec1, align 8, !dbg !46
  %39 = getelementptr inbounds double* %38, i64 0, !dbg !46
  %40 = load double* %39, align 8, !dbg !46
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %40), !dbg !46
  ret i32 0, !dbg !47
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare float @cosf(float) #2

; Function Attrs: nounwind
declare float @sinf(float) #2

; Function Attrs: inlinehint nounwind uwtable
define internal void @double_array_divs_variable(double* noalias %dvec1, double* noalias %dvec2) #4 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store double* %dvec1, double** %1, align 8
  call void @llvm.dbg.declare(metadata !{double** %1}, metadata !48), !dbg !49
  store double* %dvec2, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !50), !dbg !51
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !52), !dbg !53
  call void @llvm.dbg.declare(metadata !{i64* %j}, metadata !54), !dbg !53
  store i64 0, i64* %j, align 8, !dbg !55
  br label %3, !dbg !55

; <label>:3                                       ; preds = %24, %0
  %4 = load i64* %j, align 8, !dbg !55
  %5 = icmp slt i64 %4, 131072, !dbg !55
  br i1 %5, label %6, label %27, !dbg !55

; <label>:6                                       ; preds = %3
  store i64 0, i64* %i, align 8, !dbg !57
  br label %7, !dbg !57

; <label>:7                                       ; preds = %20, %6
  %8 = load i64* %i, align 8, !dbg !57
  %9 = icmp slt i64 %8, 2048, !dbg !57
  br i1 %9, label %10, label %23, !dbg !57

; <label>:10                                      ; preds = %7
  %11 = load i64* %i, align 8, !dbg !59
  %12 = load double** %2, align 8, !dbg !59
  %13 = getelementptr inbounds double* %12, i64 %11, !dbg !59
  %14 = load double* %13, align 8, !dbg !59
  %15 = load i64* %i, align 8, !dbg !59
  %16 = load double** %1, align 8, !dbg !59
  %17 = getelementptr inbounds double* %16, i64 %15, !dbg !59
  %18 = load double* %17, align 8, !dbg !59
  %19 = fdiv double %18, %14, !dbg !59
  store double %19, double* %17, align 8, !dbg !59
  br label %20, !dbg !59

; <label>:20                                      ; preds = %10
  %21 = load i64* %i, align 8, !dbg !57
  %22 = add nsw i64 %21, 1, !dbg !57
  store i64 %22, i64* %i, align 8, !dbg !57
  br label %7, !dbg !57

; <label>:23                                      ; preds = %7
  br label %24, !dbg !59

; <label>:24                                      ; preds = %23
  %25 = load i64* %j, align 8, !dbg !55
  %26 = add nsw i64 %25, 1, !dbg !55
  store i64 %26, i64* %j, align 8, !dbg !55
  br label %3, !dbg !55

; <label>:27                                      ; preds = %3
  ret void, !dbg !60
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !7, metadata !8, metadata !7, metadata !7, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c] [DW_LANG_C99]
!1 = metadata !{metadata !"dt.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 5, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 5, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6}
!5 = metadata !{i32 786472, metadata !"ITERATIONS", i64 131072} ; [ DW_TAG_enumerator ] [ITERATIONS :: 131072]
!6 = metadata !{i32 786472, metadata !"size", i64 2048} ; [ DW_TAG_enumerator ] [size :: 2048]
!7 = metadata !{}
!8 = metadata !{metadata !9, metadata !17}
!9 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"main", metadata !"main", metadata !"", i32 30, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !7, i32 30} ; [ DW_TAG_subprogram ] [line 30] [def] [main]
!10 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !13, metadata !13, metadata !14}
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{i32 786478, metadata !1, metadata !10, metadata !"double_array_divs_variable", metadata !"double_array_divs_variable", metadata !"", i32 11, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (double*, double*)* @double_array_divs_variable, null, null, metadata !7, i32 12} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [double_array_divs_variable]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !20, metadata !20}
!20 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!22 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!26 = metadata !{i32 786689, metadata !9, metadata !"argc", metadata !10, i32 16777246, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 30]
!27 = metadata !{i32 30, i32 0, metadata !9, null}
!28 = metadata !{i32 786689, metadata !9, metadata !"argv", metadata !10, i32 33554462, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 30]
!29 = metadata !{i32 786688, metadata !9, metadata !"dvec1", metadata !10, i32 31, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dvec1] [line 31]
!30 = metadata !{i32 31, i32 0, metadata !9, null}
!31 = metadata !{i32 786688, metadata !9, metadata !"dvec2", metadata !10, i32 31, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dvec2] [line 31]
!32 = metadata !{i32 786688, metadata !9, metadata !"i", metadata !10, i32 32, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 32]
!33 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 32, i32 0, metadata !9, null}
!35 = metadata !{i32 34, i32 0, metadata !9, null}
!36 = metadata !{i32 35, i32 0, metadata !9, null}
!37 = metadata !{i32 37, i32 0, metadata !9, null}
!38 = metadata !{i32 38, i32 0, metadata !9, null}
!39 = metadata !{i32 42, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !9, i32 42, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!41 = metadata !{i32 43, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 42, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!43 = metadata !{i32 44, i32 0, metadata !42, null}
!44 = metadata !{i32 45, i32 0, metadata !42, null}
!45 = metadata !{i32 47, i32 0, metadata !9, null}
!46 = metadata !{i32 48, i32 0, metadata !9, null}
!47 = metadata !{i32 49, i32 0, metadata !9, null}
!48 = metadata !{i32 786689, metadata !17, metadata !"dvec1", metadata !10, i32 16777227, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dvec1] [line 11]
!49 = metadata !{i32 11, i32 0, metadata !17, null}
!50 = metadata !{i32 786689, metadata !17, metadata !"dvec2", metadata !10, i32 33554444, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dvec2] [line 12]
!51 = metadata !{i32 12, i32 0, metadata !17, null}
!52 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !10, i32 13, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!53 = metadata !{i32 13, i32 0, metadata !17, null}
!54 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !10, i32 13, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!55 = metadata !{i32 14, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !17, i32 14, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!57 = metadata !{i32 15, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !56, i32 15, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dt.c]
!59 = metadata !{i32 16, i32 0, metadata !58, null}
!60 = metadata !{i32 28, i32 0, metadata !17, null}
