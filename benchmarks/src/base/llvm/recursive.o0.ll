; ModuleID = 'recursive.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @ack(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !31), !dbg !32
  store i32 %y, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !33), !dbg !32
  %4 = load i32* %2, align 4, !dbg !34
  %5 = icmp eq i32 %4, 0, !dbg !34
  br i1 %5, label %6, label %9, !dbg !34

; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4, !dbg !36
  %8 = add nsw i32 %7, 1, !dbg !36
  store i32 %8, i32* %1, !dbg !36
  br label %23, !dbg !36

; <label>:9                                       ; preds = %0
  %10 = load i32* %2, align 4, !dbg !38
  %11 = sub nsw i32 %10, 1, !dbg !38
  %12 = load i32* %3, align 4, !dbg !38
  %13 = icmp ne i32 %12, 0, !dbg !38
  br i1 %13, label %14, label %19, !dbg !38

; <label>:14                                      ; preds = %9
  %15 = load i32* %2, align 4, !dbg !38
  %16 = load i32* %3, align 4, !dbg !38
  %17 = sub nsw i32 %16, 1, !dbg !38
  %18 = call i32 @ack(i32 %15, i32 %17), !dbg !38
  br label %20, !dbg !38

; <label>:19                                      ; preds = %9
  br label %20, !dbg !38

; <label>:20                                      ; preds = %19, %14
  %21 = phi i32 [ %18, %14 ], [ 1, %19 ], !dbg !38
  %22 = call i32 @ack(i32 %11, i32 %21), !dbg !38
  store i32 %22, i32* %1, !dbg !38
  br label %23, !dbg !38

; <label>:23                                      ; preds = %20, %6
  %24 = load i32* %1, !dbg !39
  ret i32 %24, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !40), !dbg !41
  %3 = load i32* %2, align 4, !dbg !42
  %4 = icmp slt i32 %3, 2, !dbg !42
  br i1 %4, label %5, label %6, !dbg !42

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1, !dbg !44
  br label %14, !dbg !44

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4, !dbg !46
  %8 = sub nsw i32 %7, 2, !dbg !46
  %9 = call i32 @fib(i32 %8), !dbg !46
  %10 = load i32* %2, align 4, !dbg !46
  %11 = sub nsw i32 %10, 1, !dbg !46
  %12 = call i32 @fib(i32 %11), !dbg !46
  %13 = add nsw i32 %9, %12, !dbg !46
  store i32 %13, i32* %1, !dbg !46
  br label %14, !dbg !46

; <label>:14                                      ; preds = %6, %5
  %15 = load i32* %1, !dbg !47
  ret i32 %15, !dbg !47
}

; Function Attrs: nounwind uwtable
define double @fibFP(double %n) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %n, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !48), !dbg !49
  %3 = load double* %2, align 8, !dbg !50
  %4 = fcmp olt double %3, 2.000000e+00, !dbg !50
  br i1 %4, label %5, label %6, !dbg !50

; <label>:5                                       ; preds = %0
  store double 1.000000e+00, double* %1, !dbg !52
  br label %14, !dbg !52

; <label>:6                                       ; preds = %0
  %7 = load double* %2, align 8, !dbg !54
  %8 = fsub double %7, 2.000000e+00, !dbg !54
  %9 = call double @fibFP(double %8), !dbg !54
  %10 = load double* %2, align 8, !dbg !54
  %11 = fsub double %10, 1.000000e+00, !dbg !54
  %12 = call double @fibFP(double %11), !dbg !54
  %13 = fadd double %9, %12, !dbg !54
  store double %13, double* %1, !dbg !54
  br label %14, !dbg !54

; <label>:14                                      ; preds = %6, %5
  %15 = load double* %1, !dbg !55
  ret double %15, !dbg !55
}

; Function Attrs: nounwind uwtable
define i32 @tak(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !56), !dbg !57
  store i32 %y, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !58), !dbg !57
  store i32 %z, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !59), !dbg !57
  %5 = load i32* %3, align 4, !dbg !60
  %6 = load i32* %2, align 4, !dbg !60
  %7 = icmp slt i32 %5, %6, !dbg !60
  br i1 %7, label %8, label %25, !dbg !60

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !62
  %10 = sub nsw i32 %9, 1, !dbg !62
  %11 = load i32* %3, align 4, !dbg !62
  %12 = load i32* %4, align 4, !dbg !62
  %13 = call i32 @tak(i32 %10, i32 %11, i32 %12), !dbg !62
  %14 = load i32* %3, align 4, !dbg !62
  %15 = sub nsw i32 %14, 1, !dbg !62
  %16 = load i32* %4, align 4, !dbg !62
  %17 = load i32* %2, align 4, !dbg !62
  %18 = call i32 @tak(i32 %15, i32 %16, i32 %17), !dbg !62
  %19 = load i32* %4, align 4, !dbg !62
  %20 = sub nsw i32 %19, 1, !dbg !62
  %21 = load i32* %2, align 4, !dbg !62
  %22 = load i32* %3, align 4, !dbg !62
  %23 = call i32 @tak(i32 %20, i32 %21, i32 %22), !dbg !62
  %24 = call i32 @tak(i32 %13, i32 %18, i32 %23), !dbg !62
  store i32 %24, i32* %1, !dbg !62
  br label %27, !dbg !62

; <label>:25                                      ; preds = %0
  %26 = load i32* %4, align 4, !dbg !64
  store i32 %26, i32* %1, !dbg !64
  br label %27, !dbg !64

; <label>:27                                      ; preds = %25, %8
  %28 = load i32* %1, !dbg !65
  ret i32 %28, !dbg !65
}

; Function Attrs: nounwind uwtable
define double @takFP(double %x, double %y, double %z) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %x, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !66), !dbg !67
  store double %y, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !68), !dbg !67
  store double %z, double* %4, align 8
  call void @llvm.dbg.declare(metadata !{double* %4}, metadata !69), !dbg !67
  %5 = load double* %3, align 8, !dbg !70
  %6 = load double* %2, align 8, !dbg !70
  %7 = fcmp olt double %5, %6, !dbg !70
  br i1 %7, label %8, label %25, !dbg !70

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8, !dbg !72
  %10 = fsub double %9, 1.000000e+00, !dbg !72
  %11 = load double* %3, align 8, !dbg !72
  %12 = load double* %4, align 8, !dbg !72
  %13 = call double @takFP(double %10, double %11, double %12), !dbg !72
  %14 = load double* %3, align 8, !dbg !72
  %15 = fsub double %14, 1.000000e+00, !dbg !72
  %16 = load double* %4, align 8, !dbg !72
  %17 = load double* %2, align 8, !dbg !72
  %18 = call double @takFP(double %15, double %16, double %17), !dbg !72
  %19 = load double* %4, align 8, !dbg !72
  %20 = fsub double %19, 1.000000e+00, !dbg !72
  %21 = load double* %2, align 8, !dbg !72
  %22 = load double* %3, align 8, !dbg !72
  %23 = call double @takFP(double %20, double %21, double %22), !dbg !72
  %24 = call double @takFP(double %13, double %18, double %23), !dbg !72
  store double %24, double* %1, !dbg !72
  br label %27, !dbg !72

; <label>:25                                      ; preds = %0
  %26 = load double* %4, align 8, !dbg !73
  store double %26, double* %1, !dbg !73
  br label %27, !dbg !73

; <label>:27                                      ; preds = %25, %8
  %28 = load double* %1, !dbg !74
  ret double %28, !dbg !74
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !75), !dbg !76
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !77), !dbg !76
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !78), !dbg !79
  store i32 10, i32* %n, align 4, !dbg !79
  %4 = load i32* %n, align 4, !dbg !80
  %5 = add nsw i32 %4, 1, !dbg !80
  %6 = load i32* %n, align 4, !dbg !80
  %7 = add nsw i32 %6, 1, !dbg !80
  %8 = call i32 @ack(i32 3, i32 %7), !dbg !80
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %5, i32 %8), !dbg !80
  %10 = load i32* %n, align 4, !dbg !81
  %11 = sitofp i32 %10 to double, !dbg !81
  %12 = fadd double 2.800000e+01, %11, !dbg !81
  %13 = load i32* %n, align 4, !dbg !81
  %14 = sitofp i32 %13 to double, !dbg !81
  %15 = fadd double 2.800000e+01, %14, !dbg !81
  %16 = call double @fibFP(double %15), !dbg !81
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0), double %12, double %16), !dbg !81
  %18 = load i32* %n, align 4, !dbg !82
  %19 = mul nsw i32 3, %18, !dbg !82
  %20 = load i32* %n, align 4, !dbg !82
  %21 = mul nsw i32 2, %20, !dbg !82
  %22 = load i32* %n, align 4, !dbg !82
  %23 = load i32* %n, align 4, !dbg !82
  %24 = mul nsw i32 3, %23, !dbg !82
  %25 = load i32* %n, align 4, !dbg !82
  %26 = mul nsw i32 2, %25, !dbg !82
  %27 = load i32* %n, align 4, !dbg !82
  %28 = call i32 @tak(i32 %24, i32 %26, i32 %27), !dbg !82
  %29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %19, i32 %21, i32 %22, i32 %28), !dbg !82
  %30 = call i32 @fib(i32 3), !dbg !83
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i32 %30), !dbg !83
  %32 = call double @takFP(double 3.000000e+00, double 2.000000e+00, double 1.000000e+00), !dbg !84
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str4, i32 0, i32 0), double %32), !dbg !84
  ret i32 0, !dbg !85
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c] [DW_LANG_C99]
!1 = metadata !{metadata !"recursive.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9, metadata !12, metadata !16, metadata !19, metadata !22}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ack", metadata !"ack", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @ack, null, null, metadata !2, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [ack]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fib", metadata !"fib", metadata !"", i32 18, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @fib, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 18] [def] [fib]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8}
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fibFP", metadata !"fibFP", metadata !"", i32 25, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double)* @fibFP, null, null, metadata !2, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [fibFP]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"tak", metadata !"tak", metadata !"", i32 32, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32)* @tak, null, null, metadata !2, i32 32} ; [ DW_TAG_subprogram ] [line 32] [def] [tak]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"takFP", metadata !"takFP", metadata !"", i32 39, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double, double, double)* @takFP, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 39] [def] [takFP]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !15, metadata !15, metadata !15, metadata !15}
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 45, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 45} ; [ DW_TAG_subprogram ] [line 45] [def] [main]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !8, metadata !8, metadata !25}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!27 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!29 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!30 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!31 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 10]
!32 = metadata !{i32 10, i32 0, metadata !4, null}
!33 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 10]
!34 = metadata !{i32 11, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!36 = metadata !{i32 12, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 11, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!38 = metadata !{i32 15, i32 0, metadata !4, null}
!39 = metadata !{i32 16, i32 0, metadata !4, null}
!40 = metadata !{i32 786689, metadata !9, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 18]
!41 = metadata !{i32 18, i32 0, metadata !9, null}
!42 = metadata !{i32 19, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !9, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!44 = metadata !{i32 20, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !43, i32 19, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!46 = metadata !{i32 22, i32 0, metadata !9, null}
!47 = metadata !{i32 23, i32 0, metadata !9, null}
!48 = metadata !{i32 786689, metadata !12, metadata !"n", metadata !5, i32 16777241, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 25]
!49 = metadata !{i32 25, i32 0, metadata !12, null}
!50 = metadata !{i32 26, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !12, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!52 = metadata !{i32 27, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 26, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!54 = metadata !{i32 29, i32 0, metadata !12, null}
!55 = metadata !{i32 30, i32 0, metadata !12, null}
!56 = metadata !{i32 786689, metadata !16, metadata !"x", metadata !5, i32 16777248, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 32]
!57 = metadata !{i32 32, i32 0, metadata !16, null}
!58 = metadata !{i32 786689, metadata !16, metadata !"y", metadata !5, i32 33554464, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 32]
!59 = metadata !{i32 786689, metadata !16, metadata !"z", metadata !5, i32 50331680, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 32]
!60 = metadata !{i32 33, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !16, i32 33, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!62 = metadata !{i32 34, i32 0, metadata !63, null}
!63 = metadata !{i32 786443, metadata !1, metadata !61, i32 33, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!64 = metadata !{i32 36, i32 0, metadata !16, null}
!65 = metadata !{i32 37, i32 0, metadata !16, null}
!66 = metadata !{i32 786689, metadata !19, metadata !"x", metadata !5, i32 16777255, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 39]
!67 = metadata !{i32 39, i32 0, metadata !19, null}
!68 = metadata !{i32 786689, metadata !19, metadata !"y", metadata !5, i32 33554471, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 39]
!69 = metadata !{i32 786689, metadata !19, metadata !"z", metadata !5, i32 50331687, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 39]
!70 = metadata !{i32 40, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !19, i32 40, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!72 = metadata !{i32 41, i32 0, metadata !71, null}
!73 = metadata !{i32 42, i32 0, metadata !19, null}
!74 = metadata !{i32 43, i32 0, metadata !19, null}
!75 = metadata !{i32 786689, metadata !22, metadata !"argc", metadata !5, i32 16777261, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 45]
!76 = metadata !{i32 45, i32 0, metadata !22, null}
!77 = metadata !{i32 786689, metadata !22, metadata !"argv", metadata !5, i32 33554477, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 45]
!78 = metadata !{i32 786688, metadata !22, metadata !"n", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 46]
!79 = metadata !{i32 46, i32 0, metadata !22, null}
!80 = metadata !{i32 48, i32 0, metadata !22, null}
!81 = metadata !{i32 49, i32 0, metadata !22, null}
!82 = metadata !{i32 50, i32 0, metadata !22, null}
!83 = metadata !{i32 51, i32 0, metadata !22, null}
!84 = metadata !{i32 52, i32 0, metadata !22, null}
!85 = metadata !{i32 54, i32 0, metadata !22, null}
