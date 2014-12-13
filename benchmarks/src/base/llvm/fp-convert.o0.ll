; ModuleID = 'fp-convert.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Total is %g\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @loop(float* %x, float* %y, i64 %length) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca i64, align 8
  %i = alloca i64, align 8
  %accumulator = alloca double, align 8
  store float* %x, float** %1, align 8
  call void @llvm.dbg.declare(metadata !{float** %1}, metadata !22), !dbg !23
  store float* %y, float** %2, align 8
  call void @llvm.dbg.declare(metadata !{float** %2}, metadata !24), !dbg !23
  store i64 %length, i64* %3, align 8
  call void @llvm.dbg.declare(metadata !{i64* %3}, metadata !25), !dbg !23
  call void @llvm.dbg.declare(metadata !{i64* %i}, metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata !{double* %accumulator}, metadata !28), !dbg !29
  store double 0.000000e+00, double* %accumulator, align 8, !dbg !29
  store i64 0, i64* %i, align 8, !dbg !30
  br label %4, !dbg !30

; <label>:4                                       ; preds = %22, %0
  %5 = load i64* %i, align 8, !dbg !30
  %6 = load i64* %3, align 8, !dbg !30
  %7 = icmp slt i64 %5, %6, !dbg !30
  br i1 %7, label %8, label %25, !dbg !30

; <label>:8                                       ; preds = %4
  %9 = load i64* %i, align 8, !dbg !32
  %10 = load float** %1, align 8, !dbg !32
  %11 = getelementptr inbounds float* %10, i64 %9, !dbg !32
  %12 = load float* %11, align 4, !dbg !32
  %13 = fpext float %12 to double, !dbg !32
  %14 = load i64* %i, align 8, !dbg !32
  %15 = load float** %2, align 8, !dbg !32
  %16 = getelementptr inbounds float* %15, i64 %14, !dbg !32
  %17 = load float* %16, align 4, !dbg !32
  %18 = fpext float %17 to double, !dbg !32
  %19 = fmul double %13, %18, !dbg !32
  %20 = load double* %accumulator, align 8, !dbg !32
  %21 = fadd double %20, %19, !dbg !32
  store double %21, double* %accumulator, align 8, !dbg !32
  br label %22, !dbg !34

; <label>:22                                      ; preds = %8
  %23 = load i64* %i, align 8, !dbg !30
  %24 = add nsw i64 %23, 1, !dbg !30
  store i64 %24, i64* %i, align 8, !dbg !30
  br label %4, !dbg !30

; <label>:25                                      ; preds = %4
  %26 = load double* %accumulator, align 8, !dbg !35
  ret double %26, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca [2048 x float], align 16
  %y = alloca [2048 x float], align 16
  %total = alloca double, align 8
  %a = alloca float, align 4
  %b = alloca float, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !36), !dbg !37
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !38), !dbg !37
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !41), !dbg !40
  call void @llvm.dbg.declare(metadata !{[2048 x float]* %x}, metadata !42), !dbg !46
  call void @llvm.dbg.declare(metadata !{[2048 x float]* %y}, metadata !47), !dbg !48
  call void @llvm.dbg.declare(metadata !{double* %total}, metadata !49), !dbg !50
  store double 0.000000e+00, double* %total, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata !{float* %a}, metadata !51), !dbg !52
  store float 0.000000e+00, float* %a, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata !{float* %b}, metadata !53), !dbg !54
  store float 1.000000e+00, float* %b, align 4, !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %4, !dbg !55

; <label>:4                                       ; preds = %45, %0
  %5 = load i32* %i, align 4, !dbg !55
  %6 = icmp slt i32 %5, 500000, !dbg !55
  br i1 %6, label %7, label %48, !dbg !55

; <label>:7                                       ; preds = %4
  %8 = load i32* %i, align 4, !dbg !57
  %9 = srem i32 %8, 10, !dbg !57
  %10 = icmp ne i32 %9, 0, !dbg !57
  br i1 %10, label %11, label %12, !dbg !57

; <label>:11                                      ; preds = %7
  store float 0.000000e+00, float* %a, align 4, !dbg !60
  store float 1.000000e+00, float* %b, align 4, !dbg !62
  br label %17, !dbg !63

; <label>:12                                      ; preds = %7
  %13 = load float* %a, align 4, !dbg !64
  %14 = fadd float %13, 0x3FB99999A0000000, !dbg !64
  store float %14, float* %a, align 4, !dbg !64
  %15 = load float* %b, align 4, !dbg !66
  %16 = fadd float %15, 0x3FC99999A0000000, !dbg !66
  store float %16, float* %b, align 4, !dbg !66
  br label %17

; <label>:17                                      ; preds = %12, %11
  store i32 0, i32* %j, align 4, !dbg !67
  br label %18, !dbg !67

; <label>:18                                      ; preds = %36, %17
  %19 = load i32* %j, align 4, !dbg !67
  %20 = icmp slt i32 %19, 2048, !dbg !67
  br i1 %20, label %21, label %39, !dbg !67

; <label>:21                                      ; preds = %18
  %22 = load float* %a, align 4, !dbg !69
  %23 = load i32* %j, align 4, !dbg !69
  %24 = sitofp i32 %23 to float, !dbg !69
  %25 = fadd float %22, %24, !dbg !69
  %26 = load i32* %j, align 4, !dbg !69
  %27 = sext i32 %26 to i64, !dbg !69
  %28 = getelementptr inbounds [2048 x float]* %x, i32 0, i64 %27, !dbg !69
  store float %25, float* %28, align 4, !dbg !69
  %29 = load float* %b, align 4, !dbg !71
  %30 = load i32* %j, align 4, !dbg !71
  %31 = sitofp i32 %30 to float, !dbg !71
  %32 = fadd float %29, %31, !dbg !71
  %33 = load i32* %j, align 4, !dbg !71
  %34 = sext i32 %33 to i64, !dbg !71
  %35 = getelementptr inbounds [2048 x float]* %y, i32 0, i64 %34, !dbg !71
  store float %32, float* %35, align 4, !dbg !71
  br label %36, !dbg !72

; <label>:36                                      ; preds = %21
  %37 = load i32* %j, align 4, !dbg !67
  %38 = add nsw i32 %37, 1, !dbg !67
  store i32 %38, i32* %j, align 4, !dbg !67
  br label %18, !dbg !67

; <label>:39                                      ; preds = %18
  %40 = getelementptr inbounds [2048 x float]* %x, i32 0, i32 0, !dbg !73
  %41 = getelementptr inbounds [2048 x float]* %y, i32 0, i32 0, !dbg !73
  %42 = call double @loop(float* %40, float* %41, i64 2048), !dbg !73
  %43 = load double* %total, align 8, !dbg !73
  %44 = fadd double %43, %42, !dbg !73
  store double %44, double* %total, align 8, !dbg !73
  br label %45, !dbg !74

; <label>:45                                      ; preds = %39
  %46 = load i32* %i, align 4, !dbg !55
  %47 = add nsw i32 %46, 1, !dbg !55
  store i32 %47, i32* %i, align 4, !dbg !55
  br label %4, !dbg !55

; <label>:48                                      ; preds = %4
  %49 = load double* %total, align 8, !dbg !75
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), double %49), !dbg !75
  ret i32 0, !dbg !76
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fp-convert.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"loop", metadata !"loop", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (float*, float*, i64)* @loop, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [loop]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !11}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!10 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 19, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 19} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15, metadata !16}
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!22 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 4]
!23 = metadata !{i32 4, i32 0, metadata !4, null}
!24 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554436, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 4]
!25 = metadata !{i32 786689, metadata !4, metadata !"length", metadata !5, i32 50331652, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 4]
!26 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 5, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 5]
!27 = metadata !{i32 5, i32 0, metadata !4, null}
!28 = metadata !{i32 786688, metadata !4, metadata !"accumulator", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [accumulator] [line 6]
!29 = metadata !{i32 6, i32 0, metadata !4, null}
!30 = metadata !{i32 7, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !1, metadata !4, i32 7, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!32 = metadata !{i32 8, i32 0, metadata !33, null} ; [ DW_TAG_imported_declaration ]
!33 = metadata !{i32 786443, metadata !1, metadata !31, i32 7, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!34 = metadata !{i32 9, i32 0, metadata !33, null}
!35 = metadata !{i32 10, i32 0, metadata !4, null}
!36 = metadata !{i32 786689, metadata !12, metadata !"argc", metadata !5, i32 16777235, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 19]
!37 = metadata !{i32 19, i32 0, metadata !12, null}
!38 = metadata !{i32 786689, metadata !12, metadata !"argv", metadata !5, i32 33554451, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 19]
!39 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 20, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 20]
!40 = metadata !{i32 20, i32 0, metadata !12, null}
!41 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 20, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 20]
!42 = metadata !{i32 786688, metadata !12, metadata !"x", metadata !5, i32 21, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 21]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 32, i32 0, i32 0, metadata !10, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 32, offset 0] [from float]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 2048}     ; [ DW_TAG_subrange_type ] [0, 2047]
!46 = metadata !{i32 21, i32 0, metadata !12, null}
!47 = metadata !{i32 786688, metadata !12, metadata !"y", metadata !5, i32 22, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 22]
!48 = metadata !{i32 22, i32 0, metadata !12, null}
!49 = metadata !{i32 786688, metadata !12, metadata !"total", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [total] [line 23]
!50 = metadata !{i32 23, i32 0, metadata !12, null}
!51 = metadata !{i32 786688, metadata !12, metadata !"a", metadata !5, i32 24, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 24]
!52 = metadata !{i32 24, i32 0, metadata !12, null}
!53 = metadata !{i32 786688, metadata !12, metadata !"b", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 25]
!54 = metadata !{i32 25, i32 0, metadata !12, null}
!55 = metadata !{i32 27, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !12, i32 27, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!57 = metadata !{i32 28, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 28, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!59 = metadata !{i32 786443, metadata !1, metadata !56, i32 27, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!60 = metadata !{i32 29, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !58, i32 28, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!62 = metadata !{i32 30, i32 0, metadata !61, null}
!63 = metadata !{i32 31, i32 0, metadata !61, null}
!64 = metadata !{i32 32, i32 0, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !58, i32 31, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!66 = metadata !{i32 33, i32 0, metadata !65, null}
!67 = metadata !{i32 35, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !59, i32 35, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!69 = metadata !{i32 36, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !68, i32 35, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fp-convert.c]
!71 = metadata !{i32 37, i32 0, metadata !70, null}
!72 = metadata !{i32 38, i32 0, metadata !70, null}
!73 = metadata !{i32 39, i32 0, metadata !59, null}
!74 = metadata !{i32 40, i32 0, metadata !59, null}
!75 = metadata !{i32 42, i32 0, metadata !12, null}
!76 = metadata !{i32 44, i32 0, metadata !12, null}
