; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !27), !dbg !28
  store i32 %j, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !29), !dbg !28
  %3 = load i32* %1, align 4, !dbg !28
  %4 = load i32* %2, align 4, !dbg !28
  %5 = add nsw i32 %3, %4, !dbg !28
  %6 = load i32* %1, align 4, !dbg !28
  %7 = load i32* %2, align 4, !dbg !28
  %8 = add nsw i32 %6, %7, !dbg !28
  %9 = add nsw i32 %8, 1, !dbg !28
  %10 = mul nsw i32 %5, %9, !dbg !28
  %11 = sdiv i32 %10, 2, !dbg !28
  %12 = load i32* %1, align 4, !dbg !28
  %13 = add nsw i32 %11, %12, !dbg !28
  %14 = add nsw i32 %13, 1, !dbg !28
  %15 = sitofp i32 %14 to double, !dbg !28
  %16 = fdiv double 1.000000e+00, %15, !dbg !28
  ret double %16, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !30), !dbg !31
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !32), !dbg !31
  store double* %Au, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !33), !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !34), !dbg !35
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !36), !dbg !35
  store i32 0, i32* %i, align 4, !dbg !37
  br label %4, !dbg !37

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4, !dbg !37
  %6 = load i32* %1, align 4, !dbg !37
  %7 = icmp slt i32 %5, %6, !dbg !37
  br i1 %7, label %8, label %40, !dbg !37

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !39
  %10 = sext i32 %9 to i64, !dbg !39
  %11 = load double** %3, align 8, !dbg !39
  %12 = getelementptr inbounds double* %11, i64 %10, !dbg !39
  store double 0.000000e+00, double* %12, align 8, !dbg !39
  store i32 0, i32* %j, align 4, !dbg !41
  br label %13, !dbg !41

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4, !dbg !41
  %15 = load i32* %1, align 4, !dbg !41
  %16 = icmp slt i32 %14, %15, !dbg !41
  br i1 %16, label %17, label %36, !dbg !41

; <label>:17                                      ; preds = %13
  %18 = load i32* %i, align 4, !dbg !41
  %19 = load i32* %j, align 4, !dbg !41
  %20 = call double @eval_A(i32 %18, i32 %19), !dbg !41
  %21 = load i32* %j, align 4, !dbg !41
  %22 = sext i32 %21 to i64, !dbg !41
  %23 = load double** %2, align 8, !dbg !41
  %24 = getelementptr inbounds double* %23, i64 %22, !dbg !41
  %25 = load double* %24, align 8, !dbg !41
  %26 = fmul double %20, %25, !dbg !41
  %27 = load i32* %i, align 4, !dbg !41
  %28 = sext i32 %27 to i64, !dbg !41
  %29 = load double** %3, align 8, !dbg !41
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !41
  %31 = load double* %30, align 8, !dbg !41
  %32 = fadd double %31, %26, !dbg !41
  store double %32, double* %30, align 8, !dbg !41
  br label %33, !dbg !41

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4, !dbg !41
  %35 = add nsw i32 %34, 1, !dbg !41
  store i32 %35, i32* %j, align 4, !dbg !41
  br label %13, !dbg !41

; <label>:36                                      ; preds = %13
  br label %37, !dbg !43

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4, !dbg !37
  %39 = add nsw i32 %38, 1, !dbg !37
  store i32 %39, i32* %i, align 4, !dbg !37
  br label %4, !dbg !37

; <label>:40                                      ; preds = %4
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* %u, double* %Au) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !45), !dbg !46
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !47), !dbg !46
  store double* %Au, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !48), !dbg !46
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !49), !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !51), !dbg !50
  store i32 0, i32* %i, align 4, !dbg !52
  br label %4, !dbg !52

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %i, align 4, !dbg !52
  %6 = load i32* %1, align 4, !dbg !52
  %7 = icmp slt i32 %5, %6, !dbg !52
  br i1 %7, label %8, label %40, !dbg !52

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !54
  %10 = sext i32 %9 to i64, !dbg !54
  %11 = load double** %3, align 8, !dbg !54
  %12 = getelementptr inbounds double* %11, i64 %10, !dbg !54
  store double 0.000000e+00, double* %12, align 8, !dbg !54
  store i32 0, i32* %j, align 4, !dbg !56
  br label %13, !dbg !56

; <label>:13                                      ; preds = %33, %8
  %14 = load i32* %j, align 4, !dbg !56
  %15 = load i32* %1, align 4, !dbg !56
  %16 = icmp slt i32 %14, %15, !dbg !56
  br i1 %16, label %17, label %36, !dbg !56

; <label>:17                                      ; preds = %13
  %18 = load i32* %j, align 4, !dbg !56
  %19 = load i32* %i, align 4, !dbg !56
  %20 = call double @eval_A(i32 %18, i32 %19), !dbg !56
  %21 = load i32* %j, align 4, !dbg !56
  %22 = sext i32 %21 to i64, !dbg !56
  %23 = load double** %2, align 8, !dbg !56
  %24 = getelementptr inbounds double* %23, i64 %22, !dbg !56
  %25 = load double* %24, align 8, !dbg !56
  %26 = fmul double %20, %25, !dbg !56
  %27 = load i32* %i, align 4, !dbg !56
  %28 = sext i32 %27 to i64, !dbg !56
  %29 = load double** %3, align 8, !dbg !56
  %30 = getelementptr inbounds double* %29, i64 %28, !dbg !56
  %31 = load double* %30, align 8, !dbg !56
  %32 = fadd double %31, %26, !dbg !56
  store double %32, double* %30, align 8, !dbg !56
  br label %33, !dbg !56

; <label>:33                                      ; preds = %17
  %34 = load i32* %j, align 4, !dbg !56
  %35 = add nsw i32 %34, 1, !dbg !56
  store i32 %35, i32* %j, align 4, !dbg !56
  br label %13, !dbg !56

; <label>:36                                      ; preds = %13
  br label %37, !dbg !58

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4, !dbg !52
  %39 = add nsw i32 %38, 1, !dbg !52
  store i32 %39, i32* %i, align 4, !dbg !52
  br label %4, !dbg !52

; <label>:40                                      ; preds = %4
  ret void, !dbg !59
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* %u, double* %AtAu) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %4 = alloca i8*
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !60), !dbg !61
  store double* %u, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !62), !dbg !61
  store double* %AtAu, double** %3, align 8
  call void @llvm.dbg.declare(metadata !{double** %3}, metadata !63), !dbg !61
  %5 = load i32* %1, align 4, !dbg !64
  %6 = zext i32 %5 to i64, !dbg !64
  %7 = call i8* @llvm.stacksave(), !dbg !64
  store i8* %7, i8** %4, !dbg !64
  %8 = alloca double, i64 %6, align 16, !dbg !64
  call void @llvm.dbg.declare(metadata !{double* %8}, metadata !65), !dbg !64
  %9 = load i32* %1, align 4, !dbg !64
  %10 = load double** %2, align 8, !dbg !64
  call void @eval_A_times_u(i32 %9, double* %10, double* %8), !dbg !64
  %11 = load i32* %1, align 4, !dbg !64
  %12 = load double** %3, align 8, !dbg !64
  call void @eval_At_times_u(i32 %11, double* %8, double* %12), !dbg !64
  %13 = load i8** %4, !dbg !64
  call void @llvm.stackrestore(i8* %13), !dbg !64
  ret void, !dbg !64
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %N = alloca i32, align 4
  %4 = alloca i8*
  %vBv = alloca double, align 8
  %vv = alloca double, align 8
  %5 = alloca i32
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !69), !dbg !70
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !71), !dbg !70
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %N}, metadata !74), !dbg !75
  %6 = load i32* %2, align 4, !dbg !75
  %7 = icmp eq i32 %6, 2, !dbg !75
  br i1 %7, label %8, label %13, !dbg !75

; <label>:8                                       ; preds = %0
  %9 = load i8*** %3, align 8, !dbg !75
  %10 = getelementptr inbounds i8** %9, i64 1, !dbg !75
  %11 = load i8** %10, align 8, !dbg !75
  %12 = call i32 @atoi(i8* %11) #6, !dbg !75
  br label %14, !dbg !75

; <label>:13                                      ; preds = %0
  br label %14, !dbg !75

; <label>:14                                      ; preds = %13, %8
  %15 = phi i32 [ %12, %8 ], [ 2000, %13 ], !dbg !75
  store i32 %15, i32* %N, align 4, !dbg !75
  %16 = load i32* %N, align 4, !dbg !76
  %17 = zext i32 %16 to i64, !dbg !76
  %18 = call i8* @llvm.stacksave(), !dbg !76
  store i8* %18, i8** %4, !dbg !76
  %19 = alloca double, i64 %17, align 16, !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %19}, metadata !77), !dbg !76
  %20 = load i32* %N, align 4, !dbg !76
  %21 = zext i32 %20 to i64, !dbg !76
  %22 = alloca double, i64 %21, align 16, !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %22}, metadata !78), !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %vBv}, metadata !79), !dbg !76
  call void @llvm.dbg.declare(metadata !{double* %vv}, metadata !80), !dbg !76
  store i32 0, i32* %i, align 4, !dbg !81
  br label %23, !dbg !81

; <label>:23                                      ; preds = %31, %14
  %24 = load i32* %i, align 4, !dbg !81
  %25 = load i32* %N, align 4, !dbg !81
  %26 = icmp slt i32 %24, %25, !dbg !81
  br i1 %26, label %27, label %34, !dbg !81

; <label>:27                                      ; preds = %23
  %28 = load i32* %i, align 4, !dbg !81
  %29 = sext i32 %28 to i64, !dbg !81
  %30 = getelementptr inbounds double* %19, i64 %29, !dbg !81
  store double 1.000000e+00, double* %30, align 8, !dbg !81
  br label %31, !dbg !81

; <label>:31                                      ; preds = %27
  %32 = load i32* %i, align 4, !dbg !81
  %33 = add nsw i32 %32, 1, !dbg !81
  store i32 %33, i32* %i, align 4, !dbg !81
  br label %23, !dbg !81

; <label>:34                                      ; preds = %23
  store i32 0, i32* %i, align 4, !dbg !83
  br label %35, !dbg !83

; <label>:35                                      ; preds = %41, %34
  %36 = load i32* %i, align 4, !dbg !83
  %37 = icmp slt i32 %36, 10, !dbg !83
  br i1 %37, label %38, label %44, !dbg !83

; <label>:38                                      ; preds = %35
  %39 = load i32* %N, align 4, !dbg !85
  call void @eval_AtA_times_u(i32 %39, double* %19, double* %22), !dbg !85
  %40 = load i32* %N, align 4, !dbg !87
  call void @eval_AtA_times_u(i32 %40, double* %22, double* %19), !dbg !87
  br label %41, !dbg !88

; <label>:41                                      ; preds = %38
  %42 = load i32* %i, align 4, !dbg !83
  %43 = add nsw i32 %42, 1, !dbg !83
  store i32 %43, i32* %i, align 4, !dbg !83
  br label %35, !dbg !83

; <label>:44                                      ; preds = %35
  store double 0.000000e+00, double* %vv, align 8, !dbg !89
  store double 0.000000e+00, double* %vBv, align 8, !dbg !89
  store i32 0, i32* %i, align 4, !dbg !90
  br label %45, !dbg !90

; <label>:45                                      ; preds = %72, %44
  %46 = load i32* %i, align 4, !dbg !90
  %47 = load i32* %N, align 4, !dbg !90
  %48 = icmp slt i32 %46, %47, !dbg !90
  br i1 %48, label %49, label %75, !dbg !90

; <label>:49                                      ; preds = %45
  %50 = load i32* %i, align 4, !dbg !92
  %51 = sext i32 %50 to i64, !dbg !92
  %52 = getelementptr inbounds double* %19, i64 %51, !dbg !92
  %53 = load double* %52, align 8, !dbg !92
  %54 = load i32* %i, align 4, !dbg !92
  %55 = sext i32 %54 to i64, !dbg !92
  %56 = getelementptr inbounds double* %22, i64 %55, !dbg !92
  %57 = load double* %56, align 8, !dbg !92
  %58 = fmul double %53, %57, !dbg !92
  %59 = load double* %vBv, align 8, !dbg !92
  %60 = fadd double %59, %58, !dbg !92
  store double %60, double* %vBv, align 8, !dbg !92
  %61 = load i32* %i, align 4, !dbg !92
  %62 = sext i32 %61 to i64, !dbg !92
  %63 = getelementptr inbounds double* %22, i64 %62, !dbg !92
  %64 = load double* %63, align 8, !dbg !92
  %65 = load i32* %i, align 4, !dbg !92
  %66 = sext i32 %65 to i64, !dbg !92
  %67 = getelementptr inbounds double* %22, i64 %66, !dbg !92
  %68 = load double* %67, align 8, !dbg !92
  %69 = fmul double %64, %68, !dbg !92
  %70 = load double* %vv, align 8, !dbg !92
  %71 = fadd double %70, %69, !dbg !92
  store double %71, double* %vv, align 8, !dbg !92
  br label %72, !dbg !92

; <label>:72                                      ; preds = %49
  %73 = load i32* %i, align 4, !dbg !90
  %74 = add nsw i32 %73, 1, !dbg !90
  store i32 %74, i32* %i, align 4, !dbg !90
  br label %45, !dbg !90

; <label>:75                                      ; preds = %45
  %76 = load double* %vBv, align 8, !dbg !94
  %77 = load double* %vv, align 8, !dbg !94
  %78 = fdiv double %76, %77, !dbg !94
  %79 = call double @sqrt(double %78) #2, !dbg !94
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), double %79), !dbg !94
  store i32 0, i32* %1, !dbg !95
  store i32 1, i32* %5
  %81 = load i8** %4, !dbg !95
  call void @llvm.stackrestore(i8* %81), !dbg !95
  %82 = load i32* %1, !dbg !96
  ret i32 %82, !dbg !96
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"spectral-norm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !16, metadata !17, metadata !18}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A", metadata !"eval_A", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32)* @eval_A, null, null, metadata !2, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A_times_u", metadata !"eval_A_times_u", metadata !"", i32 15, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*, double*)* @eval_A_times_u, null, null, metadata !2, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !13, metadata !15}
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_At_times_u", metadata !"eval_At_times_u", metadata !"", i32 25, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*, double*)* @eval_At_times_u, null, null, metadata !2, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_AtA_times_u", metadata !"eval_AtA_times_u", metadata !"", i32 35, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*, double*)* @eval_AtA_times_u, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !9, metadata !9, metadata !21}
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!23 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!27 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 13]
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 13]
!30 = metadata !{i32 786689, metadata !10, metadata !"N", metadata !5, i32 16777231, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 15]
!31 = metadata !{i32 15, i32 0, metadata !10, null}
!32 = metadata !{i32 786689, metadata !10, metadata !"u", metadata !5, i32 33554447, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 15]
!33 = metadata !{i32 786689, metadata !10, metadata !"Au", metadata !5, i32 50331663, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!34 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!35 = metadata !{i32 17, i32 0, metadata !10, null}
!36 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!37 = metadata !{i32 18, i32 0, metadata !38, null}
!38 = metadata !{i32 786443, metadata !1, metadata !10, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!39 = metadata !{i32 20, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !38, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!41 = metadata !{i32 21, i32 0, metadata !42, null}
!42 = metadata !{i32 786443, metadata !1, metadata !40, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!43 = metadata !{i32 22, i32 0, metadata !40, null}
!44 = metadata !{i32 23, i32 0, metadata !10, null}
!45 = metadata !{i32 786689, metadata !16, metadata !"N", metadata !5, i32 16777241, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 25]
!46 = metadata !{i32 25, i32 0, metadata !16, null}
!47 = metadata !{i32 786689, metadata !16, metadata !"u", metadata !5, i32 33554457, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 25]
!48 = metadata !{i32 786689, metadata !16, metadata !"Au", metadata !5, i32 50331673, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!49 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!50 = metadata !{i32 27, i32 0, metadata !16, null}
!51 = metadata !{i32 786688, metadata !16, metadata !"j", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 27]
!52 = metadata !{i32 28, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !16, i32 28, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!54 = metadata !{i32 30, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 29, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!56 = metadata !{i32 31, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 31, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!58 = metadata !{i32 32, i32 0, metadata !55, null}
!59 = metadata !{i32 33, i32 0, metadata !16, null}
!60 = metadata !{i32 786689, metadata !17, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!61 = metadata !{i32 35, i32 0, metadata !17, null}
!62 = metadata !{i32 786689, metadata !17, metadata !"u", metadata !5, i32 33554467, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 35]
!63 = metadata !{i32 786689, metadata !17, metadata !"AtAu", metadata !5, i32 50331683, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!64 = metadata !{i32 36, i32 0, metadata !17, null}
!65 = metadata !{i32 786688, metadata !17, metadata !"v", metadata !5, i32 36, metadata !66, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 36]
!66 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 0, i64 64, i32 0, i32 0, metadata !8, metadata !67, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 -1}       ; [ DW_TAG_subrange_type ] [unbounded]
!69 = metadata !{i32 786689, metadata !18, metadata !"argc", metadata !5, i32 16777254, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!70 = metadata !{i32 38, i32 0, metadata !18, null}
!71 = metadata !{i32 786689, metadata !18, metadata !"argv", metadata !5, i32 33554470, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!72 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!73 = metadata !{i32 40, i32 0, metadata !18, null}
!74 = metadata !{i32 786688, metadata !18, metadata !"N", metadata !5, i32 41, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 41]
!75 = metadata !{i32 41, i32 0, metadata !18, null}
!76 = metadata !{i32 42, i32 0, metadata !18, null}
!77 = metadata !{i32 786688, metadata !18, metadata !"u", metadata !5, i32 42, metadata !66, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 42]
!78 = metadata !{i32 786688, metadata !18, metadata !"v", metadata !5, i32 42, metadata !66, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 42]
!79 = metadata !{i32 786688, metadata !18, metadata !"vBv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!80 = metadata !{i32 786688, metadata !18, metadata !"vv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vv] [line 42]
!81 = metadata !{i32 43, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !18, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!83 = metadata !{i32 44, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !18, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!85 = metadata !{i32 46, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !84, i32 45, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!87 = metadata !{i32 47, i32 0, metadata !86, null}
!88 = metadata !{i32 48, i32 0, metadata !86, null}
!89 = metadata !{i32 49, i32 0, metadata !18, null}
!90 = metadata !{i32 50, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !18, i32 50, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!92 = metadata !{i32 50, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !91, i32 50, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!94 = metadata !{i32 51, i32 0, metadata !18, null}
!95 = metadata !{i32 52, i32 0, metadata !18, null}
!96 = metadata !{i32 53, i32 0, metadata !18, null}
