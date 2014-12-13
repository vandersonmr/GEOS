; ModuleID = 'FFT.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"FFT: Data length is not a power of 2!: %d \00", align 1

; Function Attrs: nounwind uwtable
define double @FFT_num_flops(i32 %N) #0 {
  %1 = alloca i32, align 4
  %Nd = alloca double, align 8
  %logN = alloca double, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !25), !dbg !26
  call void @llvm.dbg.declare(metadata !{double* %Nd}, metadata !27), !dbg !28
  %2 = load i32* %1, align 4, !dbg !28
  %3 = sitofp i32 %2 to double, !dbg !28
  store double %3, double* %Nd, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata !{double* %logN}, metadata !29), !dbg !30
  %4 = load i32* %1, align 4, !dbg !30
  %5 = call i32 @int_log2(i32 %4), !dbg !30
  %6 = sitofp i32 %5 to double, !dbg !30
  store double %6, double* %logN, align 8, !dbg !30
  %7 = load double* %Nd, align 8, !dbg !31
  %8 = fmul double 5.000000e+00, %7, !dbg !31
  %9 = fsub double %8, 2.000000e+00, !dbg !31
  %10 = load double* %logN, align 8, !dbg !31
  %11 = fmul double %9, %10, !dbg !31
  %12 = load double* %Nd, align 8, !dbg !31
  %13 = fadd double %12, 1.000000e+00, !dbg !31
  %14 = fmul double 2.000000e+00, %13, !dbg !31
  %15 = fadd double %11, %14, !dbg !31
  ret double %15, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal i32 @int_log2(i32 %n) #0 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  %log = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !34), !dbg !35
  store i32 1, i32* %k, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata !{i32* %log}, metadata !36), !dbg !37
  store i32 0, i32* %log, align 4, !dbg !37
  br label %2, !dbg !38

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %k, align 4, !dbg !38
  %4 = load i32* %1, align 4, !dbg !38
  %5 = icmp slt i32 %3, %4, !dbg !38
  br i1 %5, label %6, label %12, !dbg !38

; <label>:6                                       ; preds = %2
  br label %7, !dbg !38

; <label>:7                                       ; preds = %6
  %8 = load i32* %k, align 4, !dbg !38
  %9 = mul nsw i32 %8, 2, !dbg !38
  store i32 %9, i32* %k, align 4, !dbg !38
  %10 = load i32* %log, align 4, !dbg !38
  %11 = add nsw i32 %10, 1, !dbg !38
  store i32 %11, i32* %log, align 4, !dbg !38
  br label %2, !dbg !38

; <label>:12                                      ; preds = %2
  %13 = load i32* %1, align 4, !dbg !40
  %14 = load i32* %log, align 4, !dbg !40
  %15 = shl i32 1, %14, !dbg !40
  %16 = icmp ne i32 %13, %15, !dbg !40
  br i1 %16, label %17, label %20, !dbg !40

; <label>:17                                      ; preds = %12
  %18 = load i32* %1, align 4, !dbg !42
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i32 0, i32 0), i32 %18), !dbg !42
  call void @exit(i32 1) #5, !dbg !44
  unreachable, !dbg !44

; <label>:20                                      ; preds = %12
  %21 = load i32* %log, align 4, !dbg !45
  ret i32 %21, !dbg !45
}

; Function Attrs: nounwind uwtable
define void @FFT_bitreverse(i32 %N, double* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %n = alloca i32, align 4
  %nm1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ii = alloca i32, align 4
  %jj = alloca i32, align 4
  %k = alloca i32, align 4
  %tmp_real = alloca double, align 8
  %tmp_imag = alloca double, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !46), !dbg !47
  store double* %data, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !48), !dbg !47
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !49), !dbg !50
  %3 = load i32* %1, align 4, !dbg !50
  %4 = sdiv i32 %3, 2, !dbg !50
  store i32 %4, i32* %n, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %nm1}, metadata !51), !dbg !52
  %5 = load i32* %n, align 4, !dbg !52
  %6 = sub nsw i32 %5, 1, !dbg !52
  store i32 %6, i32* %nm1, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !53), !dbg !54
  store i32 0, i32* %i, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !55), !dbg !56
  store i32 0, i32* %j, align 4, !dbg !56
  br label %7, !dbg !57

; <label>:7                                       ; preds = %79, %0
  %8 = load i32* %i, align 4, !dbg !57
  %9 = load i32* %nm1, align 4, !dbg !57
  %10 = icmp slt i32 %8, %9, !dbg !57
  br i1 %10, label %11, label %82, !dbg !57

; <label>:11                                      ; preds = %7
  call void @llvm.dbg.declare(metadata !{i32* %ii}, metadata !59), !dbg !61
  %12 = load i32* %i, align 4, !dbg !61
  %13 = shl i32 %12, 1, !dbg !61
  store i32 %13, i32* %ii, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata !{i32* %jj}, metadata !62), !dbg !63
  %14 = load i32* %j, align 4, !dbg !63
  %15 = shl i32 %14, 1, !dbg !63
  store i32 %15, i32* %jj, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !64), !dbg !65
  %16 = load i32* %n, align 4, !dbg !65
  %17 = ashr i32 %16, 1, !dbg !65
  store i32 %17, i32* %k, align 4, !dbg !65
  %18 = load i32* %i, align 4, !dbg !66
  %19 = load i32* %j, align 4, !dbg !66
  %20 = icmp slt i32 %18, %19, !dbg !66
  br i1 %20, label %21, label %64, !dbg !66

; <label>:21                                      ; preds = %11
  call void @llvm.dbg.declare(metadata !{double* %tmp_real}, metadata !68), !dbg !70
  %22 = load i32* %ii, align 4, !dbg !70
  %23 = sext i32 %22 to i64, !dbg !70
  %24 = load double** %2, align 8, !dbg !70
  %25 = getelementptr inbounds double* %24, i64 %23, !dbg !70
  %26 = load double* %25, align 8, !dbg !70
  store double %26, double* %tmp_real, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata !{double* %tmp_imag}, metadata !71), !dbg !72
  %27 = load i32* %ii, align 4, !dbg !72
  %28 = add nsw i32 %27, 1, !dbg !72
  %29 = sext i32 %28 to i64, !dbg !72
  %30 = load double** %2, align 8, !dbg !72
  %31 = getelementptr inbounds double* %30, i64 %29, !dbg !72
  %32 = load double* %31, align 8, !dbg !72
  store double %32, double* %tmp_imag, align 8, !dbg !72
  %33 = load i32* %jj, align 4, !dbg !73
  %34 = sext i32 %33 to i64, !dbg !73
  %35 = load double** %2, align 8, !dbg !73
  %36 = getelementptr inbounds double* %35, i64 %34, !dbg !73
  %37 = load double* %36, align 8, !dbg !73
  %38 = load i32* %ii, align 4, !dbg !73
  %39 = sext i32 %38 to i64, !dbg !73
  %40 = load double** %2, align 8, !dbg !73
  %41 = getelementptr inbounds double* %40, i64 %39, !dbg !73
  store double %37, double* %41, align 8, !dbg !73
  %42 = load i32* %jj, align 4, !dbg !74
  %43 = add nsw i32 %42, 1, !dbg !74
  %44 = sext i32 %43 to i64, !dbg !74
  %45 = load double** %2, align 8, !dbg !74
  %46 = getelementptr inbounds double* %45, i64 %44, !dbg !74
  %47 = load double* %46, align 8, !dbg !74
  %48 = load i32* %ii, align 4, !dbg !74
  %49 = add nsw i32 %48, 1, !dbg !74
  %50 = sext i32 %49 to i64, !dbg !74
  %51 = load double** %2, align 8, !dbg !74
  %52 = getelementptr inbounds double* %51, i64 %50, !dbg !74
  store double %47, double* %52, align 8, !dbg !74
  %53 = load double* %tmp_real, align 8, !dbg !75
  %54 = load i32* %jj, align 4, !dbg !75
  %55 = sext i32 %54 to i64, !dbg !75
  %56 = load double** %2, align 8, !dbg !75
  %57 = getelementptr inbounds double* %56, i64 %55, !dbg !75
  store double %53, double* %57, align 8, !dbg !75
  %58 = load double* %tmp_imag, align 8, !dbg !76
  %59 = load i32* %jj, align 4, !dbg !76
  %60 = add nsw i32 %59, 1, !dbg !76
  %61 = sext i32 %60 to i64, !dbg !76
  %62 = load double** %2, align 8, !dbg !76
  %63 = getelementptr inbounds double* %62, i64 %61, !dbg !76
  store double %58, double* %63, align 8, !dbg !76
  br label %64, !dbg !76

; <label>:64                                      ; preds = %21, %11
  br label %65, !dbg !77

; <label>:65                                      ; preds = %69, %64
  %66 = load i32* %k, align 4, !dbg !77
  %67 = load i32* %j, align 4, !dbg !77
  %68 = icmp sle i32 %66, %67, !dbg !77
  br i1 %68, label %69, label %75, !dbg !77

; <label>:69                                      ; preds = %65
  %70 = load i32* %k, align 4, !dbg !78
  %71 = load i32* %j, align 4, !dbg !78
  %72 = sub nsw i32 %71, %70, !dbg !78
  store i32 %72, i32* %j, align 4, !dbg !78
  %73 = load i32* %k, align 4, !dbg !80
  %74 = ashr i32 %73, 1, !dbg !80
  store i32 %74, i32* %k, align 4, !dbg !80
  br label %65, !dbg !81

; <label>:75                                      ; preds = %65
  %76 = load i32* %k, align 4, !dbg !82
  %77 = load i32* %j, align 4, !dbg !82
  %78 = add nsw i32 %77, %76, !dbg !82
  store i32 %78, i32* %j, align 4, !dbg !82
  br label %79, !dbg !83

; <label>:79                                      ; preds = %75
  %80 = load i32* %i, align 4, !dbg !57
  %81 = add nsw i32 %80, 1, !dbg !57
  store i32 %81, i32* %i, align 4, !dbg !57
  br label %7, !dbg !57

; <label>:82                                      ; preds = %7
  ret void, !dbg !84
}

; Function Attrs: nounwind uwtable
define void @FFT_transform(i32 %N, double* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !85), !dbg !86
  store double* %data, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !87), !dbg !86
  %3 = load i32* %1, align 4, !dbg !88
  %4 = load double** %2, align 8, !dbg !88
  call void @FFT_transform_internal(i32 %3, double* %4, i32 -1), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define internal void @FFT_transform_internal(i32 %N, double* %data, i32 %direction) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %n = alloca i32, align 4
  %bit = alloca i32, align 4
  %logn = alloca i32, align 4
  %dual = alloca i32, align 4
  %w_real = alloca double, align 8
  %w_imag = alloca double, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %theta = alloca double, align 8
  %s = alloca double, align 8
  %t = alloca double, align 8
  %s2 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %wd_real = alloca double, align 8
  %wd_imag = alloca double, align 8
  %tmp_real = alloca double, align 8
  %tmp_imag = alloca double, align 8
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %z1_real = alloca double, align 8
  %z1_imag = alloca double, align 8
  %wd_real3 = alloca double, align 8
  %wd_imag4 = alloca double, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !90), !dbg !91
  store double* %data, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !92), !dbg !91
  store i32 %direction, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !93), !dbg !91
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !94), !dbg !95
  %4 = load i32* %1, align 4, !dbg !95
  %5 = sdiv i32 %4, 2, !dbg !95
  store i32 %5, i32* %n, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata !{i32* %bit}, metadata !96), !dbg !97
  store i32 0, i32* %bit, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata !{i32* %logn}, metadata !98), !dbg !99
  call void @llvm.dbg.declare(metadata !{i32* %dual}, metadata !100), !dbg !101
  store i32 1, i32* %dual, align 4, !dbg !101
  %6 = load i32* %n, align 4, !dbg !102
  %7 = icmp eq i32 %6, 1, !dbg !102
  br i1 %7, label %8, label %9, !dbg !102

; <label>:8                                       ; preds = %0
  br label %226, !dbg !102

; <label>:9                                       ; preds = %0
  %10 = load i32* %n, align 4, !dbg !104
  %11 = call i32 @int_log2(i32 %10), !dbg !104
  store i32 %11, i32* %logn, align 4, !dbg !104
  %12 = load i32* %1, align 4, !dbg !105
  %13 = icmp eq i32 %12, 0, !dbg !105
  br i1 %13, label %14, label %15, !dbg !105

; <label>:14                                      ; preds = %9
  br label %226, !dbg !105

; <label>:15                                      ; preds = %9
  %16 = load i32* %1, align 4, !dbg !107
  %17 = load double** %2, align 8, !dbg !107
  call void @FFT_bitreverse(i32 %16, double* %17), !dbg !107
  store i32 0, i32* %bit, align 4, !dbg !108
  br label %18, !dbg !108

; <label>:18                                      ; preds = %221, %15
  %19 = load i32* %bit, align 4, !dbg !108
  %20 = load i32* %logn, align 4, !dbg !108
  %21 = icmp slt i32 %19, %20, !dbg !108
  br i1 %21, label %22, label %226, !dbg !108

; <label>:22                                      ; preds = %18
  call void @llvm.dbg.declare(metadata !{double* %w_real}, metadata !110), !dbg !112
  store double 1.000000e+00, double* %w_real, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata !{double* %w_imag}, metadata !113), !dbg !114
  store double 0.000000e+00, double* %w_imag, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !115), !dbg !116
  call void @llvm.dbg.declare(metadata !{i32* %b}, metadata !117), !dbg !118
  call void @llvm.dbg.declare(metadata !{double* %theta}, metadata !119), !dbg !120
  %23 = load i32* %3, align 4, !dbg !120
  %24 = sitofp i32 %23 to double, !dbg !120
  %25 = fmul double 2.000000e+00, %24, !dbg !120
  %26 = fmul double %25, 0x400921FB54442D18, !dbg !120
  %27 = load i32* %dual, align 4, !dbg !120
  %28 = sitofp i32 %27 to double, !dbg !120
  %29 = fmul double 2.000000e+00, %28, !dbg !120
  %30 = fdiv double %26, %29, !dbg !120
  store double %30, double* %theta, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata !{double* %s}, metadata !121), !dbg !122
  %31 = load double* %theta, align 8, !dbg !122
  %32 = call double @sin(double %31) #6, !dbg !122
  store double %32, double* %s, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata !{double* %t}, metadata !123), !dbg !124
  %33 = load double* %theta, align 8, !dbg !124
  %34 = fdiv double %33, 2.000000e+00, !dbg !124
  %35 = call double @sin(double %34) #6, !dbg !124
  store double %35, double* %t, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata !{double* %s2}, metadata !125), !dbg !126
  %36 = load double* %t, align 8, !dbg !126
  %37 = fmul double 2.000000e+00, %36, !dbg !126
  %38 = load double* %t, align 8, !dbg !126
  %39 = fmul double %37, %38, !dbg !126
  store double %39, double* %s2, align 8, !dbg !126
  store i32 0, i32* %a, align 4, !dbg !127
  store i32 0, i32* %b, align 4, !dbg !127
  br label %40, !dbg !127

; <label>:40                                      ; preds = %101, %22
  %41 = load i32* %b, align 4, !dbg !127
  %42 = load i32* %n, align 4, !dbg !127
  %43 = icmp slt i32 %41, %42, !dbg !127
  br i1 %43, label %44, label %106, !dbg !127

; <label>:44                                      ; preds = %40
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !129), !dbg !131
  %45 = load i32* %b, align 4, !dbg !131
  %46 = mul nsw i32 2, %45, !dbg !131
  store i32 %46, i32* %i, align 4, !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !132), !dbg !133
  %47 = load i32* %b, align 4, !dbg !133
  %48 = load i32* %dual, align 4, !dbg !133
  %49 = add nsw i32 %47, %48, !dbg !133
  %50 = mul nsw i32 2, %49, !dbg !133
  store i32 %50, i32* %j, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata !{double* %wd_real}, metadata !134), !dbg !135
  %51 = load i32* %j, align 4, !dbg !135
  %52 = sext i32 %51 to i64, !dbg !135
  %53 = load double** %2, align 8, !dbg !135
  %54 = getelementptr inbounds double* %53, i64 %52, !dbg !135
  %55 = load double* %54, align 8, !dbg !135
  store double %55, double* %wd_real, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata !{double* %wd_imag}, metadata !136), !dbg !137
  %56 = load i32* %j, align 4, !dbg !137
  %57 = add nsw i32 %56, 1, !dbg !137
  %58 = sext i32 %57 to i64, !dbg !137
  %59 = load double** %2, align 8, !dbg !137
  %60 = getelementptr inbounds double* %59, i64 %58, !dbg !137
  %61 = load double* %60, align 8, !dbg !137
  store double %61, double* %wd_imag, align 8, !dbg !137
  %62 = load i32* %i, align 4, !dbg !138
  %63 = sext i32 %62 to i64, !dbg !138
  %64 = load double** %2, align 8, !dbg !138
  %65 = getelementptr inbounds double* %64, i64 %63, !dbg !138
  %66 = load double* %65, align 8, !dbg !138
  %67 = load double* %wd_real, align 8, !dbg !138
  %68 = fsub double %66, %67, !dbg !138
  %69 = load i32* %j, align 4, !dbg !138
  %70 = sext i32 %69 to i64, !dbg !138
  %71 = load double** %2, align 8, !dbg !138
  %72 = getelementptr inbounds double* %71, i64 %70, !dbg !138
  store double %68, double* %72, align 8, !dbg !138
  %73 = load i32* %i, align 4, !dbg !139
  %74 = add nsw i32 %73, 1, !dbg !139
  %75 = sext i32 %74 to i64, !dbg !139
  %76 = load double** %2, align 8, !dbg !139
  %77 = getelementptr inbounds double* %76, i64 %75, !dbg !139
  %78 = load double* %77, align 8, !dbg !139
  %79 = load double* %wd_imag, align 8, !dbg !139
  %80 = fsub double %78, %79, !dbg !139
  %81 = load i32* %j, align 4, !dbg !139
  %82 = add nsw i32 %81, 1, !dbg !139
  %83 = sext i32 %82 to i64, !dbg !139
  %84 = load double** %2, align 8, !dbg !139
  %85 = getelementptr inbounds double* %84, i64 %83, !dbg !139
  store double %80, double* %85, align 8, !dbg !139
  %86 = load double* %wd_real, align 8, !dbg !140
  %87 = load i32* %i, align 4, !dbg !140
  %88 = sext i32 %87 to i64, !dbg !140
  %89 = load double** %2, align 8, !dbg !140
  %90 = getelementptr inbounds double* %89, i64 %88, !dbg !140
  %91 = load double* %90, align 8, !dbg !140
  %92 = fadd double %91, %86, !dbg !140
  store double %92, double* %90, align 8, !dbg !140
  %93 = load double* %wd_imag, align 8, !dbg !141
  %94 = load i32* %i, align 4, !dbg !141
  %95 = add nsw i32 %94, 1, !dbg !141
  %96 = sext i32 %95 to i64, !dbg !141
  %97 = load double** %2, align 8, !dbg !141
  %98 = getelementptr inbounds double* %97, i64 %96, !dbg !141
  %99 = load double* %98, align 8, !dbg !141
  %100 = fadd double %99, %93, !dbg !141
  store double %100, double* %98, align 8, !dbg !141
  br label %101, !dbg !142

; <label>:101                                     ; preds = %44
  %102 = load i32* %dual, align 4, !dbg !127
  %103 = mul nsw i32 2, %102, !dbg !127
  %104 = load i32* %b, align 4, !dbg !127
  %105 = add nsw i32 %104, %103, !dbg !127
  store i32 %105, i32* %b, align 4, !dbg !127
  br label %40, !dbg !127

; <label>:106                                     ; preds = %40
  store i32 1, i32* %a, align 4, !dbg !143
  br label %107, !dbg !143

; <label>:107                                     ; preds = %217, %106
  %108 = load i32* %a, align 4, !dbg !143
  %109 = load i32* %dual, align 4, !dbg !143
  %110 = icmp slt i32 %108, %109, !dbg !143
  br i1 %110, label %111, label %220, !dbg !143

; <label>:111                                     ; preds = %107
  call void @llvm.dbg.declare(metadata !{double* %tmp_real}, metadata !145), !dbg !148
  %112 = load double* %w_real, align 8, !dbg !148
  %113 = load double* %s, align 8, !dbg !148
  %114 = load double* %w_imag, align 8, !dbg !148
  %115 = fmul double %113, %114, !dbg !148
  %116 = fsub double %112, %115, !dbg !148
  %117 = load double* %s2, align 8, !dbg !148
  %118 = load double* %w_real, align 8, !dbg !148
  %119 = fmul double %117, %118, !dbg !148
  %120 = fsub double %116, %119, !dbg !148
  store double %120, double* %tmp_real, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata !{double* %tmp_imag}, metadata !149), !dbg !150
  %121 = load double* %w_imag, align 8, !dbg !150
  %122 = load double* %s, align 8, !dbg !150
  %123 = load double* %w_real, align 8, !dbg !150
  %124 = fmul double %122, %123, !dbg !150
  %125 = fadd double %121, %124, !dbg !150
  %126 = load double* %s2, align 8, !dbg !150
  %127 = load double* %w_imag, align 8, !dbg !150
  %128 = fmul double %126, %127, !dbg !150
  %129 = fsub double %125, %128, !dbg !150
  store double %129, double* %tmp_imag, align 8, !dbg !150
  %130 = load double* %tmp_real, align 8, !dbg !151
  store double %130, double* %w_real, align 8, !dbg !151
  %131 = load double* %tmp_imag, align 8, !dbg !152
  store double %131, double* %w_imag, align 8, !dbg !152
  store i32 0, i32* %b, align 4, !dbg !153
  br label %132, !dbg !153

; <label>:132                                     ; preds = %211, %111
  %133 = load i32* %b, align 4, !dbg !153
  %134 = load i32* %n, align 4, !dbg !153
  %135 = icmp slt i32 %133, %134, !dbg !153
  br i1 %135, label %136, label %216, !dbg !153

; <label>:136                                     ; preds = %132
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !155), !dbg !157
  %137 = load i32* %b, align 4, !dbg !157
  %138 = load i32* %a, align 4, !dbg !157
  %139 = add nsw i32 %137, %138, !dbg !157
  %140 = mul nsw i32 2, %139, !dbg !157
  store i32 %140, i32* %i1, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata !{i32* %j2}, metadata !158), !dbg !159
  %141 = load i32* %b, align 4, !dbg !159
  %142 = load i32* %a, align 4, !dbg !159
  %143 = add nsw i32 %141, %142, !dbg !159
  %144 = load i32* %dual, align 4, !dbg !159
  %145 = add nsw i32 %143, %144, !dbg !159
  %146 = mul nsw i32 2, %145, !dbg !159
  store i32 %146, i32* %j2, align 4, !dbg !159
  call void @llvm.dbg.declare(metadata !{double* %z1_real}, metadata !160), !dbg !161
  %147 = load i32* %j2, align 4, !dbg !161
  %148 = sext i32 %147 to i64, !dbg !161
  %149 = load double** %2, align 8, !dbg !161
  %150 = getelementptr inbounds double* %149, i64 %148, !dbg !161
  %151 = load double* %150, align 8, !dbg !161
  store double %151, double* %z1_real, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata !{double* %z1_imag}, metadata !162), !dbg !163
  %152 = load i32* %j2, align 4, !dbg !163
  %153 = add nsw i32 %152, 1, !dbg !163
  %154 = sext i32 %153 to i64, !dbg !163
  %155 = load double** %2, align 8, !dbg !163
  %156 = getelementptr inbounds double* %155, i64 %154, !dbg !163
  %157 = load double* %156, align 8, !dbg !163
  store double %157, double* %z1_imag, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata !{double* %wd_real3}, metadata !164), !dbg !165
  %158 = load double* %w_real, align 8, !dbg !165
  %159 = load double* %z1_real, align 8, !dbg !165
  %160 = fmul double %158, %159, !dbg !165
  %161 = load double* %w_imag, align 8, !dbg !165
  %162 = load double* %z1_imag, align 8, !dbg !165
  %163 = fmul double %161, %162, !dbg !165
  %164 = fsub double %160, %163, !dbg !165
  store double %164, double* %wd_real3, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata !{double* %wd_imag4}, metadata !166), !dbg !167
  %165 = load double* %w_real, align 8, !dbg !167
  %166 = load double* %z1_imag, align 8, !dbg !167
  %167 = fmul double %165, %166, !dbg !167
  %168 = load double* %w_imag, align 8, !dbg !167
  %169 = load double* %z1_real, align 8, !dbg !167
  %170 = fmul double %168, %169, !dbg !167
  %171 = fadd double %167, %170, !dbg !167
  store double %171, double* %wd_imag4, align 8, !dbg !167
  %172 = load i32* %i1, align 4, !dbg !168
  %173 = sext i32 %172 to i64, !dbg !168
  %174 = load double** %2, align 8, !dbg !168
  %175 = getelementptr inbounds double* %174, i64 %173, !dbg !168
  %176 = load double* %175, align 8, !dbg !168
  %177 = load double* %wd_real3, align 8, !dbg !168
  %178 = fsub double %176, %177, !dbg !168
  %179 = load i32* %j2, align 4, !dbg !168
  %180 = sext i32 %179 to i64, !dbg !168
  %181 = load double** %2, align 8, !dbg !168
  %182 = getelementptr inbounds double* %181, i64 %180, !dbg !168
  store double %178, double* %182, align 8, !dbg !168
  %183 = load i32* %i1, align 4, !dbg !169
  %184 = add nsw i32 %183, 1, !dbg !169
  %185 = sext i32 %184 to i64, !dbg !169
  %186 = load double** %2, align 8, !dbg !169
  %187 = getelementptr inbounds double* %186, i64 %185, !dbg !169
  %188 = load double* %187, align 8, !dbg !169
  %189 = load double* %wd_imag4, align 8, !dbg !169
  %190 = fsub double %188, %189, !dbg !169
  %191 = load i32* %j2, align 4, !dbg !169
  %192 = add nsw i32 %191, 1, !dbg !169
  %193 = sext i32 %192 to i64, !dbg !169
  %194 = load double** %2, align 8, !dbg !169
  %195 = getelementptr inbounds double* %194, i64 %193, !dbg !169
  store double %190, double* %195, align 8, !dbg !169
  %196 = load double* %wd_real3, align 8, !dbg !170
  %197 = load i32* %i1, align 4, !dbg !170
  %198 = sext i32 %197 to i64, !dbg !170
  %199 = load double** %2, align 8, !dbg !170
  %200 = getelementptr inbounds double* %199, i64 %198, !dbg !170
  %201 = load double* %200, align 8, !dbg !170
  %202 = fadd double %201, %196, !dbg !170
  store double %202, double* %200, align 8, !dbg !170
  %203 = load double* %wd_imag4, align 8, !dbg !171
  %204 = load i32* %i1, align 4, !dbg !171
  %205 = add nsw i32 %204, 1, !dbg !171
  %206 = sext i32 %205 to i64, !dbg !171
  %207 = load double** %2, align 8, !dbg !171
  %208 = getelementptr inbounds double* %207, i64 %206, !dbg !171
  %209 = load double* %208, align 8, !dbg !171
  %210 = fadd double %209, %203, !dbg !171
  store double %210, double* %208, align 8, !dbg !171
  br label %211, !dbg !172

; <label>:211                                     ; preds = %136
  %212 = load i32* %dual, align 4, !dbg !153
  %213 = mul nsw i32 2, %212, !dbg !153
  %214 = load i32* %b, align 4, !dbg !153
  %215 = add nsw i32 %214, %213, !dbg !153
  store i32 %215, i32* %b, align 4, !dbg !153
  br label %132, !dbg !153

; <label>:216                                     ; preds = %132
  br label %217, !dbg !173

; <label>:217                                     ; preds = %216
  %218 = load i32* %a, align 4, !dbg !143
  %219 = add nsw i32 %218, 1, !dbg !143
  store i32 %219, i32* %a, align 4, !dbg !143
  br label %107, !dbg !143

; <label>:220                                     ; preds = %107
  br label %221, !dbg !174

; <label>:221                                     ; preds = %220
  %222 = load i32* %bit, align 4, !dbg !108
  %223 = add nsw i32 %222, 1, !dbg !108
  store i32 %223, i32* %bit, align 4, !dbg !108
  %224 = load i32* %dual, align 4, !dbg !108
  %225 = mul nsw i32 %224, 2, !dbg !108
  store i32 %225, i32* %dual, align 4, !dbg !108
  br label %18, !dbg !108

; <label>:226                                     ; preds = %8, %14, %18
  ret void, !dbg !175
}

; Function Attrs: nounwind uwtable
define void @FFT_inverse(i32 %N, double* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %n = alloca i32, align 4
  %norm = alloca double, align 8
  %i = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !176), !dbg !177
  store double* %data, double** %2, align 8
  call void @llvm.dbg.declare(metadata !{double** %2}, metadata !178), !dbg !177
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !179), !dbg !180
  %3 = load i32* %1, align 4, !dbg !180
  %4 = sdiv i32 %3, 2, !dbg !180
  store i32 %4, i32* %n, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata !{double* %norm}, metadata !181), !dbg !182
  store double 0.000000e+00, double* %norm, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !183), !dbg !184
  store i32 0, i32* %i, align 4, !dbg !184
  %5 = load i32* %1, align 4, !dbg !185
  %6 = load double** %2, align 8, !dbg !185
  call void @FFT_transform_internal(i32 %5, double* %6, i32 1), !dbg !185
  %7 = load i32* %n, align 4, !dbg !186
  %8 = sitofp i32 %7 to double, !dbg !186
  %9 = fdiv double 1.000000e+00, %8, !dbg !186
  store double %9, double* %norm, align 8, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %10, !dbg !187

; <label>:10                                      ; preds = %22, %0
  %11 = load i32* %i, align 4, !dbg !187
  %12 = load i32* %1, align 4, !dbg !187
  %13 = icmp slt i32 %11, %12, !dbg !187
  br i1 %13, label %14, label %25, !dbg !187

; <label>:14                                      ; preds = %10
  %15 = load double* %norm, align 8, !dbg !189
  %16 = load i32* %i, align 4, !dbg !189
  %17 = sext i32 %16 to i64, !dbg !189
  %18 = load double** %2, align 8, !dbg !189
  %19 = getelementptr inbounds double* %18, i64 %17, !dbg !189
  %20 = load double* %19, align 8, !dbg !189
  %21 = fmul double %20, %15, !dbg !189
  store double %21, double* %19, align 8, !dbg !189
  br label %22, !dbg !189

; <label>:22                                      ; preds = %14
  %23 = load i32* %i, align 4, !dbg !187
  %24 = add nsw i32 %23, 1, !dbg !187
  store i32 %24, i32* %i, align 4, !dbg !187
  br label %10, !dbg !187

; <label>:25                                      ; preds = %10
  ret void, !dbg !190
}

; Function Attrs: nounwind
declare double @sin(double) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FFT.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !10, metadata !14, metadata !15, metadata !16, metadata !19}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_num_flops", metadata !"FFT_num_flops", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32)* @FFT_num_flops, null, null, metadata !2, i32 14} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [FFT_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_bitreverse", metadata !"FFT_bitreverse", metadata !"", i32 105, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*)* @FFT_bitreverse, null, null, metadata !2, i32 105} ; [ DW_TAG_subprogram ] [line 105] [def] [FFT_bitreverse]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{null, metadata !9, metadata !13}
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform", metadata !"FFT_transform", metadata !"", i32 143, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*)* @FFT_transform, null, null, metadata !2, i32 144} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [FFT_transform]
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_inverse", metadata !"FFT_inverse", metadata !"", i32 149, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*)* @FFT_inverse, null, null, metadata !2, i32 150} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [FFT_inverse]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform_internal", metadata !"FFT_transform_internal", metadata !"", i32 35, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, double*, i32)* @FFT_transform_internal, null, null, metadata !2, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [FFT_transform_internal]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !9, metadata !13, metadata !9}
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"int_log2", metadata !"int_log2", metadata !"", i32 22, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @int_log2, null, null, metadata !2, i32 23} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [scope 23] [int_log2]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !9, metadata !9}
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!25 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 13]
!26 = metadata !{i32 13, i32 0, metadata !4, null}
!27 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 16]
!28 = metadata !{i32 16, i32 0, metadata !4, null}
!29 = metadata !{i32 786688, metadata !4, metadata !"logN", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logN] [line 17]
!30 = metadata !{i32 17, i32 0, metadata !4, null}
!31 = metadata !{i32 19, i32 0, metadata !4, null}
!32 = metadata !{i32 786689, metadata !19, metadata !"n", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 22]
!33 = metadata !{i32 22, i32 0, metadata !19, null}
!34 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !5, i32 24, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 24]
!35 = metadata !{i32 24, i32 0, metadata !19, null}
!36 = metadata !{i32 786688, metadata !19, metadata !"log", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log] [line 25]
!37 = metadata !{i32 25, i32 0, metadata !19, null}
!38 = metadata !{i32 26, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !19, i32 26, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!40 = metadata !{i32 27, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !19, i32 27, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!42 = metadata !{i32 29, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 28, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!44 = metadata !{i32 30, i32 0, metadata !43, null}
!45 = metadata !{i32 32, i32 0, metadata !19, null}
!46 = metadata !{i32 786689, metadata !10, metadata !"N", metadata !5, i32 16777321, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 105]
!47 = metadata !{i32 105, i32 0, metadata !10, null}
!48 = metadata !{i32 786689, metadata !10, metadata !"data", metadata !5, i32 33554537, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 105]
!49 = metadata !{i32 786688, metadata !10, metadata !"n", metadata !5, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 107]
!50 = metadata !{i32 107, i32 0, metadata !10, null}
!51 = metadata !{i32 786688, metadata !10, metadata !"nm1", metadata !5, i32 108, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 108]
!52 = metadata !{i32 108, i32 0, metadata !10, null}
!53 = metadata !{i32 786688, metadata !10, metadata !"i", metadata !5, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 109]
!54 = metadata !{i32 109, i32 0, metadata !10, null}
!55 = metadata !{i32 786688, metadata !10, metadata !"j", metadata !5, i32 110, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 110]
!56 = metadata !{i32 110, i32 0, metadata !10, null}
!57 = metadata !{i32 111, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !10, i32 111, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!59 = metadata !{i32 786688, metadata !60, metadata !"ii", metadata !5, i32 114, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ii] [line 114]
!60 = metadata !{i32 786443, metadata !1, metadata !58, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!61 = metadata !{i32 114, i32 0, metadata !60, null}
!62 = metadata !{i32 786688, metadata !60, metadata !"jj", metadata !5, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 117]
!63 = metadata !{i32 117, i32 0, metadata !60, null}
!64 = metadata !{i32 786688, metadata !60, metadata !"k", metadata !5, i32 120, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 120]
!65 = metadata !{i32 120, i32 0, metadata !60, null}
!66 = metadata !{i32 122, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !60, i32 122, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!68 = metadata !{i32 786688, metadata !69, metadata !"tmp_real", metadata !5, i32 123, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!69 = metadata !{i32 786443, metadata !1, metadata !67, i32 122, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!70 = metadata !{i32 123, i32 0, metadata !69, null}
!71 = metadata !{i32 786688, metadata !69, metadata !"tmp_imag", metadata !5, i32 124, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!72 = metadata !{i32 124, i32 0, metadata !69, null}
!73 = metadata !{i32 125, i32 0, metadata !69, null}
!74 = metadata !{i32 126, i32 0, metadata !69, null}
!75 = metadata !{i32 127, i32 0, metadata !69, null}
!76 = metadata !{i32 128, i32 0, metadata !69, null}
!77 = metadata !{i32 130, i32 0, metadata !60, null}
!78 = metadata !{i32 133, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !60, i32 131, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!80 = metadata !{i32 136, i32 0, metadata !79, null}
!81 = metadata !{i32 137, i32 0, metadata !79, null}
!82 = metadata !{i32 138, i32 0, metadata !60, null}
!83 = metadata !{i32 139, i32 0, metadata !60, null}
!84 = metadata !{i32 140, i32 0, metadata !10, null}
!85 = metadata !{i32 786689, metadata !14, metadata !"N", metadata !5, i32 16777359, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 143]
!86 = metadata !{i32 143, i32 0, metadata !14, null}
!87 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 33554575, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 143]
!88 = metadata !{i32 145, i32 0, metadata !14, null}
!89 = metadata !{i32 146, i32 0, metadata !14, null}
!90 = metadata !{i32 786689, metadata !16, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!91 = metadata !{i32 35, i32 0, metadata !16, null}
!92 = metadata !{i32 786689, metadata !16, metadata !"data", metadata !5, i32 33554467, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 35]
!93 = metadata !{i32 786689, metadata !16, metadata !"direction", metadata !5, i32 50331683, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [direction] [line 35]
!94 = metadata !{i32 786688, metadata !16, metadata !"n", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 36]
!95 = metadata !{i32 36, i32 0, metadata !16, null}
!96 = metadata !{i32 786688, metadata !16, metadata !"bit", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bit] [line 37]
!97 = metadata !{i32 37, i32 0, metadata !16, null}
!98 = metadata !{i32 786688, metadata !16, metadata !"logn", metadata !5, i32 38, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logn] [line 38]
!99 = metadata !{i32 38, i32 0, metadata !16, null}
!100 = metadata !{i32 786688, metadata !16, metadata !"dual", metadata !5, i32 39, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dual] [line 39]
!101 = metadata !{i32 39, i32 0, metadata !16, null}
!102 = metadata !{i32 41, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !16, i32 41, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!104 = metadata !{i32 42, i32 0, metadata !16, null}
!105 = metadata !{i32 45, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !16, i32 45, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!107 = metadata !{i32 48, i32 0, metadata !16, null}
!108 = metadata !{i32 52, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !16, i32 52, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!110 = metadata !{i32 786688, metadata !111, metadata !"w_real", metadata !5, i32 53, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_real] [line 53]
!111 = metadata !{i32 786443, metadata !1, metadata !109, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!112 = metadata !{i32 53, i32 0, metadata !111, null}
!113 = metadata !{i32 786688, metadata !111, metadata !"w_imag", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_imag] [line 54]
!114 = metadata !{i32 54, i32 0, metadata !111, null}
!115 = metadata !{i32 786688, metadata !111, metadata !"a", metadata !5, i32 55, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 55]
!116 = metadata !{i32 55, i32 0, metadata !111, null}
!117 = metadata !{i32 786688, metadata !111, metadata !"b", metadata !5, i32 56, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 56]
!118 = metadata !{i32 56, i32 0, metadata !111, null}
!119 = metadata !{i32 786688, metadata !111, metadata !"theta", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 58]
!120 = metadata !{i32 58, i32 0, metadata !111, null} ; [ DW_TAG_imported_module ]
!121 = metadata !{i32 786688, metadata !111, metadata !"s", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 59]
!122 = metadata !{i32 59, i32 0, metadata !111, null}
!123 = metadata !{i32 786688, metadata !111, metadata !"t", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 60]
!124 = metadata !{i32 60, i32 0, metadata !111, null}
!125 = metadata !{i32 786688, metadata !111, metadata !"s2", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s2] [line 61]
!126 = metadata !{i32 61, i32 0, metadata !111, null}
!127 = metadata !{i32 63, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !111, i32 63, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!129 = metadata !{i32 786688, metadata !130, metadata !"i", metadata !5, i32 64, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!130 = metadata !{i32 786443, metadata !1, metadata !128, i32 63, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!131 = metadata !{i32 64, i32 0, metadata !130, null}
!132 = metadata !{i32 786688, metadata !130, metadata !"j", metadata !5, i32 65, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 65]
!133 = metadata !{i32 65, i32 0, metadata !130, null}
!134 = metadata !{i32 786688, metadata !130, metadata !"wd_real", metadata !5, i32 67, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 67]
!135 = metadata !{i32 67, i32 0, metadata !130, null}
!136 = metadata !{i32 786688, metadata !130, metadata !"wd_imag", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 68]
!137 = metadata !{i32 68, i32 0, metadata !130, null}
!138 = metadata !{i32 70, i32 0, metadata !130, null}
!139 = metadata !{i32 71, i32 0, metadata !130, null}
!140 = metadata !{i32 72, i32 0, metadata !130, null}
!141 = metadata !{i32 73, i32 0, metadata !130, null}
!142 = metadata !{i32 74, i32 0, metadata !130, null}
!143 = metadata !{i32 77, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !111, i32 77, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!145 = metadata !{i32 786688, metadata !146, metadata !"tmp_real", metadata !5, i32 80, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 80]
!146 = metadata !{i32 786443, metadata !1, metadata !147, i32 79, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!147 = metadata !{i32 786443, metadata !1, metadata !144, i32 77, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!148 = metadata !{i32 80, i32 0, metadata !146, null}
!149 = metadata !{i32 786688, metadata !146, metadata !"tmp_imag", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 81]
!150 = metadata !{i32 81, i32 0, metadata !146, null}
!151 = metadata !{i32 82, i32 0, metadata !146, null}
!152 = metadata !{i32 83, i32 0, metadata !146, null}
!153 = metadata !{i32 85, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !147, i32 85, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!155 = metadata !{i32 786688, metadata !156, metadata !"i", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!156 = metadata !{i32 786443, metadata !1, metadata !154, i32 85, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!157 = metadata !{i32 86, i32 0, metadata !156, null}
!158 = metadata !{i32 786688, metadata !156, metadata !"j", metadata !5, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 87]
!159 = metadata !{i32 87, i32 0, metadata !156, null}
!160 = metadata !{i32 786688, metadata !156, metadata !"z1_real", metadata !5, i32 89, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_real] [line 89]
!161 = metadata !{i32 89, i32 0, metadata !156, null}
!162 = metadata !{i32 786688, metadata !156, metadata !"z1_imag", metadata !5, i32 90, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_imag] [line 90]
!163 = metadata !{i32 90, i32 0, metadata !156, null}
!164 = metadata !{i32 786688, metadata !156, metadata !"wd_real", metadata !5, i32 92, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 92]
!165 = metadata !{i32 92, i32 0, metadata !156, null}
!166 = metadata !{i32 786688, metadata !156, metadata !"wd_imag", metadata !5, i32 93, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 93]
!167 = metadata !{i32 93, i32 0, metadata !156, null}
!168 = metadata !{i32 95, i32 0, metadata !156, null}
!169 = metadata !{i32 96, i32 0, metadata !156, null}
!170 = metadata !{i32 97, i32 0, metadata !156, null}
!171 = metadata !{i32 98, i32 0, metadata !156, null}
!172 = metadata !{i32 99, i32 0, metadata !156, null}
!173 = metadata !{i32 100, i32 0, metadata !147, null}
!174 = metadata !{i32 101, i32 0, metadata !111, null}
!175 = metadata !{i32 102, i32 0, metadata !16, null}
!176 = metadata !{i32 786689, metadata !15, metadata !"N", metadata !5, i32 16777365, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 149]
!177 = metadata !{i32 149, i32 0, metadata !15, null}
!178 = metadata !{i32 786689, metadata !15, metadata !"data", metadata !5, i32 33554581, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 149]
!179 = metadata !{i32 786688, metadata !15, metadata !"n", metadata !5, i32 151, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 151]
!180 = metadata !{i32 151, i32 0, metadata !15, null}
!181 = metadata !{i32 786688, metadata !15, metadata !"norm", metadata !5, i32 152, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [norm] [line 152]
!182 = metadata !{i32 152, i32 0, metadata !15, null}
!183 = metadata !{i32 786688, metadata !15, metadata !"i", metadata !5, i32 153, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 153]
!184 = metadata !{i32 153, i32 0, metadata !15, null}
!185 = metadata !{i32 154, i32 0, metadata !15, null}
!186 = metadata !{i32 159, i32 0, metadata !15, null}
!187 = metadata !{i32 160, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !15, i32 160, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!189 = metadata !{i32 161, i32 0, metadata !188, null}
!190 = metadata !{i32 163, i32 0, metadata !15, null}
