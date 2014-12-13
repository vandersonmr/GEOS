; ModuleID = 'kernel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }
%struct.Stopwatch_struct = type { i32, double, double }

; Function Attrs: nounwind uwtable
define double @kernel_measureFFT(i32 %N, double %mintime, %struct.Random_struct* %R) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca %struct.Random_struct*, align 8
  %twoN = alloca i32, align 4
  %x = alloca double*, align 8
  %cycles = alloca i64, align 8
  %Q = alloca %struct.Stopwatch_struct*, align 8
  %i = alloca i32, align 4
  %result = alloca double, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !37), !dbg !38
  store double %mintime, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !39), !dbg !38
  store %struct.Random_struct* %R, %struct.Random_struct** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %3}, metadata !40), !dbg !38
  call void @llvm.dbg.declare(metadata !{i32* %twoN}, metadata !41), !dbg !42
  %4 = load i32* %1, align 4, !dbg !42
  %5 = mul nsw i32 2, %4, !dbg !42
  store i32 %5, i32* %twoN, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata !{double** %x}, metadata !43), !dbg !45
  %6 = load i32* %twoN, align 4, !dbg !45
  %7 = load %struct.Random_struct** %3, align 8, !dbg !45
  %8 = call double* @RandomVector(i32 %6, %struct.Random_struct* %7), !dbg !45
  store double* %8, double** %x, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata !{i64* %cycles}, metadata !46), !dbg !48
  store i64 1, i64* %cycles, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %Q}, metadata !49), !dbg !58
  %9 = call %struct.Stopwatch_struct* @new_Stopwatch(), !dbg !58
  store %struct.Stopwatch_struct* %9, %struct.Stopwatch_struct** %Q, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !59), !dbg !60
  store i32 0, i32* %i, align 4, !dbg !60
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !61), !dbg !62
  store double 0.000000e+00, double* %result, align 8, !dbg !62
  br label %10, !dbg !63

; <label>:10                                      ; preds = %0, %31
  %11 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !64
  call void @Stopwatch_start(%struct.Stopwatch_struct* %11), !dbg !64
  store i32 0, i32* %i, align 4, !dbg !66
  br label %12, !dbg !66

; <label>:12                                      ; preds = %23, %10
  %13 = load i32* %i, align 4, !dbg !66
  %14 = sext i32 %13 to i64, !dbg !66
  %15 = load i64* %cycles, align 8, !dbg !66
  %16 = mul nsw i64 %15, 8, !dbg !66
  %17 = icmp slt i64 %14, %16, !dbg !66
  br i1 %17, label %18, label %26, !dbg !66

; <label>:18                                      ; preds = %12
  %19 = load i32* %twoN, align 4, !dbg !68
  %20 = load double** %x, align 8, !dbg !68
  call void @FFT_transform(i32 %19, double* %20), !dbg !68
  %21 = load i32* %twoN, align 4, !dbg !70
  %22 = load double** %x, align 8, !dbg !70
  call void @FFT_inverse(i32 %21, double* %22), !dbg !70
  br label %23, !dbg !71

; <label>:23                                      ; preds = %18
  %24 = load i32* %i, align 4, !dbg !66
  %25 = add nsw i32 %24, 1, !dbg !66
  store i32 %25, i32* %i, align 4, !dbg !66
  br label %12, !dbg !66

; <label>:26                                      ; preds = %12
  %27 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !72
  call void @Stopwatch_stop(%struct.Stopwatch_struct* %27), !dbg !72
  %28 = load i64* %cycles, align 8, !dbg !73
  %29 = icmp sgt i64 %28, 4096, !dbg !73
  br i1 %29, label %30, label %31, !dbg !73

; <label>:30                                      ; preds = %26
  br label %34, !dbg !75

; <label>:31                                      ; preds = %26
  %32 = load i64* %cycles, align 8, !dbg !76
  %33 = mul nsw i64 %32, 2, !dbg !76
  store i64 %33, i64* %cycles, align 8, !dbg !76
  br label %10, !dbg !77

; <label>:34                                      ; preds = %30
  %35 = load i32* %1, align 4, !dbg !78
  %36 = call double @FFT_num_flops(i32 %35), !dbg !78
  %37 = load i64* %cycles, align 8, !dbg !78
  %38 = sitofp i64 %37 to double, !dbg !78
  %39 = fmul double %36, %38, !dbg !78
  %40 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !78
  %41 = call double @Stopwatch_read(%struct.Stopwatch_struct* %40), !dbg !78
  %42 = fdiv double %39, %41, !dbg !78
  %43 = fmul double %42, 1.000000e-06, !dbg !78
  store double %43, double* %result, align 8, !dbg !78
  %44 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !79
  call void @Stopwatch_delete(%struct.Stopwatch_struct* %44), !dbg !79
  %45 = load double** %x, align 8, !dbg !80
  %46 = bitcast double* %45 to i8*, !dbg !80
  call void @free(i8* %46) #5, !dbg !80
  %47 = load double* %result, align 8, !dbg !81
  ret double %47, !dbg !81
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare double* @RandomVector(i32, %struct.Random_struct*) #2

declare %struct.Stopwatch_struct* @new_Stopwatch() #2

declare void @Stopwatch_start(%struct.Stopwatch_struct*) #2

declare void @FFT_transform(i32, double*) #2

declare void @FFT_inverse(i32, double*) #2

declare void @Stopwatch_stop(%struct.Stopwatch_struct*) #2

declare double @FFT_num_flops(i32) #2

declare double @Stopwatch_read(%struct.Stopwatch_struct*) #2

declare void @Stopwatch_delete(%struct.Stopwatch_struct*) #2

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define double @kernel_measureSOR(i32 %N, double %min_time, %struct.Random_struct* %R) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca %struct.Random_struct*, align 8
  %G = alloca double**, align 8
  %result = alloca double, align 8
  %Q = alloca %struct.Stopwatch_struct*, align 8
  %cycles = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !82), !dbg !83
  store double %min_time, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !84), !dbg !83
  store %struct.Random_struct* %R, %struct.Random_struct** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %3}, metadata !85), !dbg !83
  call void @llvm.dbg.declare(metadata !{double*** %G}, metadata !86), !dbg !88
  %4 = load i32* %1, align 4, !dbg !88
  %5 = load i32* %1, align 4, !dbg !88
  %6 = load %struct.Random_struct** %3, align 8, !dbg !88
  %7 = call double** @RandomMatrix(i32 %4, i32 %5, %struct.Random_struct* %6), !dbg !88
  store double** %7, double*** %G, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !89), !dbg !90
  store double 0.000000e+00, double* %result, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %Q}, metadata !91), !dbg !92
  %8 = call %struct.Stopwatch_struct* @new_Stopwatch(), !dbg !92
  store %struct.Stopwatch_struct* %8, %struct.Stopwatch_struct** %Q, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata !{i32* %cycles}, metadata !93), !dbg !94
  store i32 1, i32* %cycles, align 4, !dbg !94
  br label %9, !dbg !95

; <label>:9                                       ; preds = %0, %20
  %10 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !96
  call void @Stopwatch_start(%struct.Stopwatch_struct* %10), !dbg !96
  %11 = load i32* %1, align 4, !dbg !98
  %12 = load i32* %1, align 4, !dbg !98
  %13 = load double*** %G, align 8, !dbg !98
  %14 = load i32* %cycles, align 4, !dbg !98
  %15 = mul nsw i32 %14, 16, !dbg !98
  call void @SOR_execute(i32 %11, i32 %12, double 1.250000e+00, double** %13, i32 %15), !dbg !98
  %16 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !99
  call void @Stopwatch_stop(%struct.Stopwatch_struct* %16), !dbg !99
  %17 = load i32* %cycles, align 4, !dbg !100
  %18 = icmp sgt i32 %17, 4096, !dbg !100
  br i1 %18, label %19, label %20, !dbg !100

; <label>:19                                      ; preds = %9
  br label %23, !dbg !102

; <label>:20                                      ; preds = %9
  %21 = load i32* %cycles, align 4, !dbg !103
  %22 = mul nsw i32 %21, 2, !dbg !103
  store i32 %22, i32* %cycles, align 4, !dbg !103
  br label %9, !dbg !104

; <label>:23                                      ; preds = %19
  %24 = load i32* %1, align 4, !dbg !105
  %25 = load i32* %1, align 4, !dbg !105
  %26 = load i32* %cycles, align 4, !dbg !105
  %27 = call double @SOR_num_flops(i32 %24, i32 %25, i32 %26), !dbg !105
  %28 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !105
  %29 = call double @Stopwatch_read(%struct.Stopwatch_struct* %28), !dbg !105
  %30 = fdiv double %27, %29, !dbg !105
  %31 = fmul double %30, 1.000000e-06, !dbg !105
  store double %31, double* %result, align 8, !dbg !105
  %32 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !106
  call void @Stopwatch_delete(%struct.Stopwatch_struct* %32), !dbg !106
  %33 = load i32* %1, align 4, !dbg !107
  %34 = load i32* %1, align 4, !dbg !107
  %35 = load double*** %G, align 8, !dbg !107
  call void @Array2D_double_delete(i32 %33, i32 %34, double** %35), !dbg !107
  %36 = load double* %result, align 8, !dbg !108
  ret double %36, !dbg !108
}

declare double** @RandomMatrix(i32, i32, %struct.Random_struct*) #2

declare void @SOR_execute(i32, i32, double, double**, i32) #2

declare double @SOR_num_flops(i32, i32, i32) #2

declare void @Array2D_double_delete(i32, i32, double**) #2

; Function Attrs: nounwind uwtable
define double @kernel_measureMonteCarlo(double %min_time, %struct.Random_struct* %R) #0 {
  %1 = alloca double, align 8
  %2 = alloca %struct.Random_struct*, align 8
  %result = alloca double, align 8
  %Q = alloca %struct.Stopwatch_struct*, align 8
  %cycles = alloca i32, align 4
  store double %min_time, double* %1, align 8
  call void @llvm.dbg.declare(metadata !{double* %1}, metadata !109), !dbg !110
  store %struct.Random_struct* %R, %struct.Random_struct** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %2}, metadata !111), !dbg !110
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !112), !dbg !113
  store double 0.000000e+00, double* %result, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %Q}, metadata !114), !dbg !115
  %3 = call %struct.Stopwatch_struct* @new_Stopwatch(), !dbg !115
  store %struct.Stopwatch_struct* %3, %struct.Stopwatch_struct** %Q, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %cycles}, metadata !116), !dbg !117
  store i32 1, i32* %cycles, align 4, !dbg !117
  br label %4, !dbg !118

; <label>:4                                       ; preds = %0, %13
  %5 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !119
  call void @Stopwatch_start(%struct.Stopwatch_struct* %5), !dbg !119
  %6 = load i32* %cycles, align 4, !dbg !121
  %7 = mul nsw i32 %6, 65536, !dbg !121
  %8 = call double @MonteCarlo_integrate(i32 %7), !dbg !121
  %9 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !122
  call void @Stopwatch_stop(%struct.Stopwatch_struct* %9), !dbg !122
  %10 = load i32* %cycles, align 4, !dbg !123
  %11 = icmp sgt i32 %10, 4096, !dbg !123
  br i1 %11, label %12, label %13, !dbg !123

; <label>:12                                      ; preds = %4
  br label %16, !dbg !123

; <label>:13                                      ; preds = %4
  %14 = load i32* %cycles, align 4, !dbg !125
  %15 = mul nsw i32 %14, 2, !dbg !125
  store i32 %15, i32* %cycles, align 4, !dbg !125
  br label %4, !dbg !126

; <label>:16                                      ; preds = %12
  %17 = load i32* %cycles, align 4, !dbg !127
  %18 = call double @MonteCarlo_num_flops(i32 %17), !dbg !127
  %19 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !127
  %20 = call double @Stopwatch_read(%struct.Stopwatch_struct* %19), !dbg !127
  %21 = fdiv double %18, %20, !dbg !127
  %22 = fmul double %21, 1.000000e-06, !dbg !127
  store double %22, double* %result, align 8, !dbg !127
  %23 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !128
  call void @Stopwatch_delete(%struct.Stopwatch_struct* %23), !dbg !128
  %24 = load double* %result, align 8, !dbg !129
  ret double %24, !dbg !129
}

declare double @MonteCarlo_integrate(i32) #2

declare double @MonteCarlo_num_flops(i32) #2

; Function Attrs: nounwind uwtable
define double @kernel_measureSparseMatMult(i32 %N, i32 %nz, double %min_time, %struct.Random_struct* %R) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca %struct.Random_struct*, align 8
  %x = alloca double*, align 8
  %y = alloca double*, align 8
  %result = alloca double, align 8
  %nr = alloca i32, align 4
  %anz = alloca i32, align 4
  %val = alloca double*, align 8
  %col = alloca i32*, align 8
  %row = alloca i32*, align 8
  %r = alloca i32, align 4
  %cycles = alloca i32, align 4
  %Q = alloca %struct.Stopwatch_struct*, align 8
  %rowr = alloca i32, align 4
  %step = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !130), !dbg !131
  store i32 %nz, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !132), !dbg !131
  store double %min_time, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !133), !dbg !134
  store %struct.Random_struct* %R, %struct.Random_struct** %4, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %4}, metadata !135), !dbg !134
  call void @llvm.dbg.declare(metadata !{double** %x}, metadata !136), !dbg !137
  %5 = load i32* %1, align 4, !dbg !137
  %6 = load %struct.Random_struct** %4, align 8, !dbg !137
  %7 = call double* @RandomVector(i32 %5, %struct.Random_struct* %6), !dbg !137
  store double* %7, double** %x, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata !{double** %y}, metadata !138), !dbg !139
  %8 = load i32* %1, align 4, !dbg !139
  %9 = sext i32 %8 to i64, !dbg !139
  %10 = mul i64 8, %9, !dbg !139
  %11 = call noalias i8* @malloc(i64 %10) #5, !dbg !139
  %12 = bitcast i8* %11 to double*, !dbg !139
  store double* %12, double** %y, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !140), !dbg !141
  store double 0.000000e+00, double* %result, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata !{i32* %nr}, metadata !142), !dbg !143
  %13 = load i32* %2, align 4, !dbg !143
  %14 = load i32* %1, align 4, !dbg !143
  %15 = sdiv i32 %13, %14, !dbg !143
  store i32 %15, i32* %nr, align 4, !dbg !143
  call void @llvm.dbg.declare(metadata !{i32* %anz}, metadata !144), !dbg !145
  %16 = load i32* %nr, align 4, !dbg !145
  %17 = load i32* %1, align 4, !dbg !145
  %18 = mul nsw i32 %16, %17, !dbg !145
  store i32 %18, i32* %anz, align 4, !dbg !145
  call void @llvm.dbg.declare(metadata !{double** %val}, metadata !146), !dbg !147
  %19 = load i32* %anz, align 4, !dbg !147
  %20 = load %struct.Random_struct** %4, align 8, !dbg !147
  %21 = call double* @RandomVector(i32 %19, %struct.Random_struct* %20), !dbg !147
  store double* %21, double** %val, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata !{i32** %col}, metadata !148), !dbg !150
  %22 = load i32* %2, align 4, !dbg !150
  %23 = sext i32 %22 to i64, !dbg !150
  %24 = mul i64 4, %23, !dbg !150
  %25 = call noalias i8* @malloc(i64 %24) #5, !dbg !150
  %26 = bitcast i8* %25 to i32*, !dbg !150
  store i32* %26, i32** %col, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata !{i32** %row}, metadata !151), !dbg !152
  %27 = load i32* %1, align 4, !dbg !152
  %28 = add nsw i32 %27, 1, !dbg !152
  %29 = sext i32 %28 to i64, !dbg !152
  %30 = mul i64 4, %29, !dbg !152
  %31 = call noalias i8* @malloc(i64 %30) #5, !dbg !152
  %32 = bitcast i8* %31 to i32*, !dbg !152
  store i32* %32, i32** %row, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata !{i32* %r}, metadata !153), !dbg !154
  store i32 0, i32* %r, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %cycles}, metadata !155), !dbg !156
  store i32 1, i32* %cycles, align 4, !dbg !156
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %Q}, metadata !157), !dbg !158
  %33 = call %struct.Stopwatch_struct* @new_Stopwatch(), !dbg !158
  store %struct.Stopwatch_struct* %33, %struct.Stopwatch_struct** %Q, align 8, !dbg !158
  %34 = load i32** %row, align 8, !dbg !159
  %35 = getelementptr inbounds i32* %34, i64 0, !dbg !159
  store i32 0, i32* %35, align 4, !dbg !159
  store i32 0, i32* %r, align 4, !dbg !160
  br label %36, !dbg !160

; <label>:36                                      ; preds = %79, %0
  %37 = load i32* %r, align 4, !dbg !160
  %38 = load i32* %1, align 4, !dbg !160
  %39 = icmp slt i32 %37, %38, !dbg !160
  br i1 %39, label %40, label %82, !dbg !160

; <label>:40                                      ; preds = %36
  call void @llvm.dbg.declare(metadata !{i32* %rowr}, metadata !162), !dbg !164
  %41 = load i32* %r, align 4, !dbg !164
  %42 = sext i32 %41 to i64, !dbg !164
  %43 = load i32** %row, align 8, !dbg !164
  %44 = getelementptr inbounds i32* %43, i64 %42, !dbg !164
  %45 = load i32* %44, align 4, !dbg !164
  store i32 %45, i32* %rowr, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata !{i32* %step}, metadata !165), !dbg !166
  %46 = load i32* %r, align 4, !dbg !166
  %47 = load i32* %nr, align 4, !dbg !166
  %48 = sdiv i32 %46, %47, !dbg !166
  store i32 %48, i32* %step, align 4, !dbg !166
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !167), !dbg !168
  store i32 0, i32* %i, align 4, !dbg !168
  %49 = load i32* %rowr, align 4, !dbg !169
  %50 = load i32* %nr, align 4, !dbg !169
  %51 = add nsw i32 %49, %50, !dbg !169
  %52 = load i32* %r, align 4, !dbg !169
  %53 = add nsw i32 %52, 1, !dbg !169
  %54 = sext i32 %53 to i64, !dbg !169
  %55 = load i32** %row, align 8, !dbg !169
  %56 = getelementptr inbounds i32* %55, i64 %54, !dbg !169
  store i32 %51, i32* %56, align 4, !dbg !169
  %57 = load i32* %step, align 4, !dbg !170
  %58 = icmp slt i32 %57, 1, !dbg !170
  br i1 %58, label %59, label %60, !dbg !170

; <label>:59                                      ; preds = %40
  store i32 1, i32* %step, align 4, !dbg !170
  br label %60, !dbg !170

; <label>:60                                      ; preds = %59, %40
  store i32 0, i32* %i, align 4, !dbg !172
  br label %61, !dbg !172

; <label>:61                                      ; preds = %75, %60
  %62 = load i32* %i, align 4, !dbg !172
  %63 = load i32* %nr, align 4, !dbg !172
  %64 = icmp slt i32 %62, %63, !dbg !172
  br i1 %64, label %65, label %78, !dbg !172

; <label>:65                                      ; preds = %61
  %66 = load i32* %i, align 4, !dbg !174
  %67 = load i32* %step, align 4, !dbg !174
  %68 = mul nsw i32 %66, %67, !dbg !174
  %69 = load i32* %rowr, align 4, !dbg !174
  %70 = load i32* %i, align 4, !dbg !174
  %71 = add nsw i32 %69, %70, !dbg !174
  %72 = sext i32 %71 to i64, !dbg !174
  %73 = load i32** %col, align 8, !dbg !174
  %74 = getelementptr inbounds i32* %73, i64 %72, !dbg !174
  store i32 %68, i32* %74, align 4, !dbg !174
  br label %75, !dbg !174

; <label>:75                                      ; preds = %65
  %76 = load i32* %i, align 4, !dbg !172
  %77 = add nsw i32 %76, 1, !dbg !172
  store i32 %77, i32* %i, align 4, !dbg !172
  br label %61, !dbg !172

; <label>:78                                      ; preds = %61
  br label %79, !dbg !175

; <label>:79                                      ; preds = %78
  %80 = load i32* %r, align 4, !dbg !160
  %81 = add nsw i32 %80, 1, !dbg !160
  store i32 %81, i32* %r, align 4, !dbg !160
  br label %36, !dbg !160

; <label>:82                                      ; preds = %36
  br label %83, !dbg !176

; <label>:83                                      ; preds = %82, %97
  %84 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !177
  call void @Stopwatch_start(%struct.Stopwatch_struct* %84), !dbg !177
  %85 = load i32* %1, align 4, !dbg !179
  %86 = load double** %y, align 8, !dbg !179
  %87 = load double** %val, align 8, !dbg !179
  %88 = load i32** %row, align 8, !dbg !179
  %89 = load i32** %col, align 8, !dbg !179
  %90 = load double** %x, align 8, !dbg !179
  %91 = load i32* %cycles, align 4, !dbg !179
  %92 = mul nsw i32 %91, 64, !dbg !179
  call void @SparseCompRow_matmult(i32 %85, double* %86, double* %87, i32* %88, i32* %89, double* %90, i32 %92), !dbg !179
  %93 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !180
  call void @Stopwatch_stop(%struct.Stopwatch_struct* %93), !dbg !180
  %94 = load i32* %cycles, align 4, !dbg !181
  %95 = icmp sgt i32 %94, 4096, !dbg !181
  br i1 %95, label %96, label %97, !dbg !181

; <label>:96                                      ; preds = %83
  br label %100, !dbg !181

; <label>:97                                      ; preds = %83
  %98 = load i32* %cycles, align 4, !dbg !183
  %99 = mul nsw i32 %98, 2, !dbg !183
  store i32 %99, i32* %cycles, align 4, !dbg !183
  br label %83, !dbg !184

; <label>:100                                     ; preds = %96
  %101 = load i32* %1, align 4, !dbg !185
  %102 = load i32* %2, align 4, !dbg !185
  %103 = load i32* %cycles, align 4, !dbg !185
  %104 = call double @SparseCompRow_num_flops(i32 %101, i32 %102, i32 %103), !dbg !185
  %105 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !186
  %106 = call double @Stopwatch_read(%struct.Stopwatch_struct* %105), !dbg !186
  %107 = fdiv double %104, %106, !dbg !186
  %108 = fmul double %107, 1.000000e-06, !dbg !186
  store double %108, double* %result, align 8, !dbg !186
  %109 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !187
  call void @Stopwatch_delete(%struct.Stopwatch_struct* %109), !dbg !187
  %110 = load i32** %row, align 8, !dbg !188
  %111 = bitcast i32* %110 to i8*, !dbg !188
  call void @free(i8* %111) #5, !dbg !188
  %112 = load i32** %col, align 8, !dbg !189
  %113 = bitcast i32* %112 to i8*, !dbg !189
  call void @free(i8* %113) #5, !dbg !189
  %114 = load double** %val, align 8, !dbg !190
  %115 = bitcast double* %114 to i8*, !dbg !190
  call void @free(i8* %115) #5, !dbg !190
  %116 = load double** %y, align 8, !dbg !191
  %117 = bitcast double* %116 to i8*, !dbg !191
  call void @free(i8* %117) #5, !dbg !191
  %118 = load double** %x, align 8, !dbg !192
  %119 = bitcast double* %118 to i8*, !dbg !192
  call void @free(i8* %119) #5, !dbg !192
  %120 = load double* %result, align 8, !dbg !193
  ret double %120, !dbg !193
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @SparseCompRow_matmult(i32, double*, double*, i32*, i32*, double*, i32) #2

declare double @SparseCompRow_num_flops(i32, i32, i32) #2

; Function Attrs: nounwind uwtable
define double @kernel_measureLU(i32 %N, double %min_time, %struct.Random_struct* %R) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca %struct.Random_struct*, align 8
  %A = alloca double**, align 8
  %lu = alloca double**, align 8
  %pivot = alloca i32*, align 8
  %Q = alloca %struct.Stopwatch_struct*, align 8
  %result = alloca double, align 8
  %i = alloca i32, align 4
  %cycles = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !194), !dbg !195
  store double %min_time, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !196), !dbg !195
  store %struct.Random_struct* %R, %struct.Random_struct** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %3}, metadata !197), !dbg !195
  call void @llvm.dbg.declare(metadata !{double*** %A}, metadata !198), !dbg !199
  store double** null, double*** %A, align 8, !dbg !199
  call void @llvm.dbg.declare(metadata !{double*** %lu}, metadata !200), !dbg !201
  store double** null, double*** %lu, align 8, !dbg !201
  call void @llvm.dbg.declare(metadata !{i32** %pivot}, metadata !202), !dbg !203
  store i32* null, i32** %pivot, align 8, !dbg !203
  call void @llvm.dbg.declare(metadata !{%struct.Stopwatch_struct** %Q}, metadata !204), !dbg !205
  %4 = call %struct.Stopwatch_struct* @new_Stopwatch(), !dbg !205
  store %struct.Stopwatch_struct* %4, %struct.Stopwatch_struct** %Q, align 8, !dbg !205
  call void @llvm.dbg.declare(metadata !{double* %result}, metadata !206), !dbg !207
  store double 0.000000e+00, double* %result, align 8, !dbg !207
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !208), !dbg !209
  store i32 0, i32* %i, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata !{i32* %cycles}, metadata !210), !dbg !211
  store i32 1, i32* %cycles, align 4, !dbg !211
  %5 = load i32* %1, align 4, !dbg !212
  %6 = load i32* %1, align 4, !dbg !212
  %7 = load %struct.Random_struct** %3, align 8, !dbg !212
  %8 = call double** @RandomMatrix(i32 %5, i32 %6, %struct.Random_struct* %7), !dbg !212
  store double** %8, double*** %A, align 8, !dbg !212
  %9 = icmp eq double** %8, null, !dbg !212
  br i1 %9, label %10, label %11, !dbg !212

; <label>:10                                      ; preds = %0
  call void @exit(i32 1) #6, !dbg !212
  unreachable, !dbg !212

; <label>:11                                      ; preds = %0
  %12 = load i32* %1, align 4, !dbg !214
  %13 = load i32* %1, align 4, !dbg !214
  %14 = call double** @new_Array2D_double(i32 %12, i32 %13), !dbg !214
  store double** %14, double*** %lu, align 8, !dbg !214
  %15 = icmp eq double** %14, null, !dbg !214
  br i1 %15, label %16, label %17, !dbg !214

; <label>:16                                      ; preds = %11
  call void @exit(i32 1) #6, !dbg !214
  unreachable, !dbg !214

; <label>:17                                      ; preds = %11
  %18 = load i32* %1, align 4, !dbg !216
  %19 = sext i32 %18 to i64, !dbg !216
  %20 = mul i64 %19, 4, !dbg !216
  %21 = call noalias i8* @malloc(i64 %20) #5, !dbg !216
  %22 = bitcast i8* %21 to i32*, !dbg !216
  store i32* %22, i32** %pivot, align 8, !dbg !216
  %23 = icmp eq i32* %22, null, !dbg !216
  br i1 %23, label %24, label %25, !dbg !216

; <label>:24                                      ; preds = %17
  call void @exit(i32 1) #6, !dbg !216
  unreachable, !dbg !216

; <label>:25                                      ; preds = %17
  br label %26, !dbg !218

; <label>:26                                      ; preds = %25, %50
  %27 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !219
  call void @Stopwatch_start(%struct.Stopwatch_struct* %27), !dbg !219
  store i32 0, i32* %i, align 4, !dbg !221
  br label %28, !dbg !221

; <label>:28                                      ; preds = %42, %26
  %29 = load i32* %i, align 4, !dbg !221
  %30 = load i32* %cycles, align 4, !dbg !221
  %31 = icmp slt i32 %29, %30, !dbg !221
  br i1 %31, label %32, label %45, !dbg !221

; <label>:32                                      ; preds = %28
  %33 = load i32* %1, align 4, !dbg !223
  %34 = load i32* %1, align 4, !dbg !223
  %35 = load double*** %lu, align 8, !dbg !223
  %36 = load double*** %A, align 8, !dbg !223
  call void @Array2D_double_copy(i32 %33, i32 %34, double** %35, double** %36), !dbg !223
  %37 = load i32* %1, align 4, !dbg !225
  %38 = load i32* %1, align 4, !dbg !225
  %39 = load double*** %lu, align 8, !dbg !225
  %40 = load i32** %pivot, align 8, !dbg !225
  %41 = call i32 @LU_factor(i32 %37, i32 %38, double** %39, i32* %40), !dbg !225
  br label %42, !dbg !226

; <label>:42                                      ; preds = %32
  %43 = load i32* %i, align 4, !dbg !221
  %44 = add nsw i32 %43, 1, !dbg !221
  store i32 %44, i32* %i, align 4, !dbg !221
  br label %28, !dbg !221

; <label>:45                                      ; preds = %28
  %46 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !227
  call void @Stopwatch_stop(%struct.Stopwatch_struct* %46), !dbg !227
  %47 = load i32* %cycles, align 4, !dbg !228
  %48 = icmp sgt i32 %47, 4096, !dbg !228
  br i1 %48, label %49, label %50, !dbg !228

; <label>:49                                      ; preds = %45
  br label %53, !dbg !228

; <label>:50                                      ; preds = %45
  %51 = load i32* %cycles, align 4, !dbg !230
  %52 = mul nsw i32 %51, 2, !dbg !230
  store i32 %52, i32* %cycles, align 4, !dbg !230
  br label %26, !dbg !231

; <label>:53                                      ; preds = %49
  %54 = load i32* %1, align 4, !dbg !232
  %55 = call double @LU_num_flops(i32 %54), !dbg !232
  %56 = load i32* %cycles, align 4, !dbg !232
  %57 = sitofp i32 %56 to double, !dbg !232
  %58 = fmul double %55, %57, !dbg !232
  %59 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !232
  %60 = call double @Stopwatch_read(%struct.Stopwatch_struct* %59), !dbg !232
  %61 = fdiv double %58, %60, !dbg !232
  %62 = fmul double %61, 1.000000e-06, !dbg !232
  store double %62, double* %result, align 8, !dbg !232
  %63 = load %struct.Stopwatch_struct** %Q, align 8, !dbg !233
  call void @Stopwatch_delete(%struct.Stopwatch_struct* %63), !dbg !233
  %64 = load i32** %pivot, align 8, !dbg !234
  %65 = bitcast i32* %64 to i8*, !dbg !234
  call void @free(i8* %65) #5, !dbg !234
  %66 = load i32* %1, align 4, !dbg !235
  %67 = load i32* %1, align 4, !dbg !235
  %68 = load double*** %lu, align 8, !dbg !235
  call void @Array2D_double_delete(i32 %66, i32 %67, double** %68), !dbg !235
  %69 = load i32* %1, align 4, !dbg !236
  %70 = load i32* %1, align 4, !dbg !236
  %71 = load double*** %A, align 8, !dbg !236
  call void @Array2D_double_delete(i32 %69, i32 %70, double** %71), !dbg !236
  %72 = load double* %result, align 8, !dbg !237
  ret double %72, !dbg !237
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare double** @new_Array2D_double(i32, i32) #2

declare void @Array2D_double_copy(i32, i32, double**, double**) #2

declare i32 @LU_factor(i32, i32, double**, i32*) #2

declare double @LU_num_flops(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c] [DW_LANG_C99]
!1 = metadata !{metadata !"kernel.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !26, metadata !27, metadata !30, metadata !33}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureFFT", metadata !"kernel_measureFFT", metadata !"", i32 19, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, double, %struct.Random_struct*)* @kernel_measureFFT, null, null, metadata !2, i32 20} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [kernel_measureFFT]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8, metadata !10}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786454, metadata !11, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786451, metadata !11, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!14 = metadata !{metadata !15, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25}
!15 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !9, metadata !17, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!19 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !9} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!20 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !9} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!21 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !9} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!22 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !9} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!23 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !8} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!24 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !8} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!25 = metadata !{i32 786445, metadata !11, metadata !13, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !8} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureSOR", metadata !"kernel_measureSOR", metadata !"", i32 53, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, double, %struct.Random_struct*)* @kernel_measureSOR, null, null, metadata !2, i32 54} ; [ DW_TAG_subprogram ] [line 53] [def] [scope 54] [kernel_measureSOR]
!27 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureMonteCarlo", metadata !"kernel_measureMonteCarlo", metadata !"", i32 82, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (double, %struct.Random_struct*)* @kernel_measureMonteCarlo, null, null, metadata !2, i32 83} ; [ DW_TAG_subprogram ] [line 82] [def] [scope 83] [kernel_measureMonteCarlo]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{metadata !8, metadata !8, metadata !10}
!30 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureSparseMatMult", metadata !"kernel_measureSparseMatMult", metadata !"", i32 104, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32, double, %struct.Random_struct*)* @kernel_measureSparseMatMult, null, null, metadata !2, i32 106} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 106] [kernel_measureSparseMatMult]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !8, metadata !9, metadata !9, metadata !8, metadata !10}
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kernel_measureLU", metadata !"kernel_measureLU", metadata !"", i32 193, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, double, %struct.Random_struct*)* @kernel_measureLU, null, null, metadata !2, i32 194} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [kernel_measureLU]
!34 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!35 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!36 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!37 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777235, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 19]
!38 = metadata !{i32 19, i32 0, metadata !4, null}
!39 = metadata !{i32 786689, metadata !4, metadata !"mintime", metadata !5, i32 33554451, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mintime] [line 19]
!40 = metadata !{i32 786689, metadata !4, metadata !"R", metadata !5, i32 50331667, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 19]
!41 = metadata !{i32 786688, metadata !4, metadata !"twoN", metadata !5, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [twoN] [line 23]
!42 = metadata !{i32 23, i32 0, metadata !4, null}
!43 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 24, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 24]
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!45 = metadata !{i32 24, i32 0, metadata !4, null}
!46 = metadata !{i32 786688, metadata !4, metadata !"cycles", metadata !5, i32 25, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 25]
!47 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!48 = metadata !{i32 25, i32 0, metadata !4, null}
!49 = metadata !{i32 786688, metadata !4, metadata !"Q", metadata !5, i32 26, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 26]
!50 = metadata !{i32 786454, metadata !51, null, metadata !"Stopwatch", i32 9, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [Stopwatch] [line 9, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !"./Stopwatch.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!52 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!53 = metadata !{i32 786451, metadata !51, null, metadata !"", i32 4, i64 192, i64 64, i32 0, i32 0, null, metadata !54, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 4, size 192, align 64, offset 0] [def] [from ]
!54 = metadata !{metadata !55, metadata !56, metadata !57}
!55 = metadata !{i32 786445, metadata !51, metadata !53, metadata !"running", i32 5, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [running] [line 5, size 32, align 32, offset 0] [from int]
!56 = metadata !{i32 786445, metadata !51, metadata !53, metadata !"last_time", i32 6, i64 64, i64 64, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [last_time] [line 6, size 64, align 64, offset 64] [from double]
!57 = metadata !{i32 786445, metadata !51, metadata !53, metadata !"total", i32 7, i64 64, i64 64, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [total] [line 7, size 64, align 64, offset 128] [from double]
!58 = metadata !{i32 26, i32 0, metadata !4, null}
!59 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!60 = metadata !{i32 27, i32 0, metadata !4, null}
!61 = metadata !{i32 786688, metadata !4, metadata !"result", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 28]
!62 = metadata !{i32 28, i32 0, metadata !4, null}
!63 = metadata !{i32 30, i32 0, metadata !4, null}
!64 = metadata !{i32 32, i32 0, metadata !65, null}
!65 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!66 = metadata !{i32 33, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !65, i32 33, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!68 = metadata !{i32 35, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !67, i32 34, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!70 = metadata !{i32 36, i32 0, metadata !69, null}
!71 = metadata !{i32 37, i32 0, metadata !69, null}
!72 = metadata !{i32 38, i32 0, metadata !65, null}
!73 = metadata !{i32 39, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !65, i32 39, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!75 = metadata !{i32 40, i32 0, metadata !74, null}
!76 = metadata !{i32 42, i32 0, metadata !65, null}
!77 = metadata !{i32 44, i32 0, metadata !65, null}
!78 = metadata !{i32 47, i32 0, metadata !4, null}
!79 = metadata !{i32 48, i32 0, metadata !4, null}
!80 = metadata !{i32 49, i32 0, metadata !4, null}
!81 = metadata !{i32 50, i32 0, metadata !4, null}
!82 = metadata !{i32 786689, metadata !26, metadata !"N", metadata !5, i32 16777269, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 53]
!83 = metadata !{i32 53, i32 0, metadata !26, null}
!84 = metadata !{i32 786689, metadata !26, metadata !"min_time", metadata !5, i32 33554485, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 53]
!85 = metadata !{i32 786689, metadata !26, metadata !"R", metadata !5, i32 50331701, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 53]
!86 = metadata !{i32 786688, metadata !26, metadata !"G", metadata !5, i32 55, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [G] [line 55]
!87 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 55, i32 0, metadata !26, null}
!89 = metadata !{i32 786688, metadata !26, metadata !"result", metadata !5, i32 56, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 56]
!90 = metadata !{i32 56, i32 0, metadata !26, null}
!91 = metadata !{i32 786688, metadata !26, metadata !"Q", metadata !5, i32 58, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 58]
!92 = metadata !{i32 58, i32 0, metadata !26, null} ; [ DW_TAG_imported_module ]
!93 = metadata !{i32 786688, metadata !26, metadata !"cycles", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 59]
!94 = metadata !{i32 59, i32 0, metadata !26, null}
!95 = metadata !{i32 60, i32 0, metadata !26, null}
!96 = metadata !{i32 62, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !26, i32 61, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!98 = metadata !{i32 63, i32 0, metadata !97, null}
!99 = metadata !{i32 64, i32 0, metadata !97, null}
!100 = metadata !{i32 66, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !97, i32 66, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!102 = metadata !{i32 67, i32 0, metadata !101, null}
!103 = metadata !{i32 69, i32 0, metadata !97, null}
!104 = metadata !{i32 70, i32 0, metadata !97, null}
!105 = metadata !{i32 73, i32 0, metadata !26, null}
!106 = metadata !{i32 74, i32 0, metadata !26, null}
!107 = metadata !{i32 75, i32 0, metadata !26, null}
!108 = metadata !{i32 76, i32 0, metadata !26, null}
!109 = metadata !{i32 786689, metadata !27, metadata !"min_time", metadata !5, i32 16777298, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 82]
!110 = metadata !{i32 82, i32 0, metadata !27, null}
!111 = metadata !{i32 786689, metadata !27, metadata !"R", metadata !5, i32 33554514, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 82]
!112 = metadata !{i32 786688, metadata !27, metadata !"result", metadata !5, i32 84, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 84]
!113 = metadata !{i32 84, i32 0, metadata !27, null}
!114 = metadata !{i32 786688, metadata !27, metadata !"Q", metadata !5, i32 85, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 85]
!115 = metadata !{i32 85, i32 0, metadata !27, null}
!116 = metadata !{i32 786688, metadata !27, metadata !"cycles", metadata !5, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 87]
!117 = metadata !{i32 87, i32 0, metadata !27, null}
!118 = metadata !{i32 88, i32 0, metadata !27, null}
!119 = metadata !{i32 90, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !27, i32 89, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!121 = metadata !{i32 91, i32 0, metadata !120, null}
!122 = metadata !{i32 92, i32 0, metadata !120, null}
!123 = metadata !{i32 93, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !1, metadata !120, i32 93, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!125 = metadata !{i32 95, i32 0, metadata !120, null}
!126 = metadata !{i32 96, i32 0, metadata !120, null}
!127 = metadata !{i32 98, i32 0, metadata !27, null}
!128 = metadata !{i32 99, i32 0, metadata !27, null}
!129 = metadata !{i32 100, i32 0, metadata !27, null}
!130 = metadata !{i32 786689, metadata !30, metadata !"N", metadata !5, i32 16777320, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 104]
!131 = metadata !{i32 104, i32 0, metadata !30, null}
!132 = metadata !{i32 786689, metadata !30, metadata !"nz", metadata !5, i32 33554536, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nz] [line 104]
!133 = metadata !{i32 786689, metadata !30, metadata !"min_time", metadata !5, i32 50331753, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 105]
!134 = metadata !{i32 105, i32 0, metadata !30, null}
!135 = metadata !{i32 786689, metadata !30, metadata !"R", metadata !5, i32 67108969, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 105]
!136 = metadata !{i32 786688, metadata !30, metadata !"x", metadata !5, i32 110, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 110]
!137 = metadata !{i32 110, i32 0, metadata !30, null}
!138 = metadata !{i32 786688, metadata !30, metadata !"y", metadata !5, i32 111, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 111]
!139 = metadata !{i32 111, i32 0, metadata !30, null}
!140 = metadata !{i32 786688, metadata !30, metadata !"result", metadata !5, i32 113, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 113]
!141 = metadata !{i32 113, i32 0, metadata !30, null}
!142 = metadata !{i32 786688, metadata !30, metadata !"nr", metadata !5, i32 138, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nr] [line 138]
!143 = metadata !{i32 138, i32 0, metadata !30, null}
!144 = metadata !{i32 786688, metadata !30, metadata !"anz", metadata !5, i32 139, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [anz] [line 139]
!145 = metadata !{i32 139, i32 0, metadata !30, null}
!146 = metadata !{i32 786688, metadata !30, metadata !"val", metadata !5, i32 142, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 142]
!147 = metadata !{i32 142, i32 0, metadata !30, null}
!148 = metadata !{i32 786688, metadata !30, metadata !"col", metadata !5, i32 143, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col] [line 143]
!149 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!150 = metadata !{i32 143, i32 0, metadata !30, null}
!151 = metadata !{i32 786688, metadata !30, metadata !"row", metadata !5, i32 144, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [row] [line 144]
!152 = metadata !{i32 144, i32 0, metadata !30, null}
!153 = metadata !{i32 786688, metadata !30, metadata !"r", metadata !5, i32 145, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 145]
!154 = metadata !{i32 145, i32 0, metadata !30, null}
!155 = metadata !{i32 786688, metadata !30, metadata !"cycles", metadata !5, i32 146, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 146]
!156 = metadata !{i32 146, i32 0, metadata !30, null}
!157 = metadata !{i32 786688, metadata !30, metadata !"Q", metadata !5, i32 148, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 148]
!158 = metadata !{i32 148, i32 0, metadata !30, null}
!159 = metadata !{i32 150, i32 0, metadata !30, null}
!160 = metadata !{i32 151, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !30, i32 151, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!162 = metadata !{i32 786688, metadata !163, metadata !"rowr", metadata !5, i32 155, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rowr] [line 155]
!163 = metadata !{i32 786443, metadata !1, metadata !161, i32 152, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!164 = metadata !{i32 155, i32 0, metadata !163, null}
!165 = metadata !{i32 786688, metadata !163, metadata !"step", metadata !5, i32 156, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [step] [line 156]
!166 = metadata !{i32 156, i32 0, metadata !163, null}
!167 = metadata !{i32 786688, metadata !163, metadata !"i", metadata !5, i32 157, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 157]
!168 = metadata !{i32 157, i32 0, metadata !163, null}
!169 = metadata !{i32 159, i32 0, metadata !163, null}
!170 = metadata !{i32 160, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !163, i32 160, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!172 = metadata !{i32 163, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !163, i32 163, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!174 = metadata !{i32 164, i32 0, metadata !173, null}
!175 = metadata !{i32 166, i32 0, metadata !163, null}
!176 = metadata !{i32 169, i32 0, metadata !30, null}
!177 = metadata !{i32 171, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !30, i32 170, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!179 = metadata !{i32 172, i32 0, metadata !178, null}
!180 = metadata !{i32 173, i32 0, metadata !178, null}
!181 = metadata !{i32 174, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !178, i32 174, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!183 = metadata !{i32 176, i32 0, metadata !178, null}
!184 = metadata !{i32 177, i32 0, metadata !178, null}
!185 = metadata !{i32 179, i32 0, metadata !30, null}
!186 = metadata !{i32 180, i32 0, metadata !30, null}
!187 = metadata !{i32 182, i32 0, metadata !30, null}
!188 = metadata !{i32 183, i32 0, metadata !30, null}
!189 = metadata !{i32 184, i32 0, metadata !30, null}
!190 = metadata !{i32 185, i32 0, metadata !30, null}
!191 = metadata !{i32 186, i32 0, metadata !30, null}
!192 = metadata !{i32 187, i32 0, metadata !30, null}
!193 = metadata !{i32 189, i32 0, metadata !30, null}
!194 = metadata !{i32 786689, metadata !33, metadata !"N", metadata !5, i32 16777409, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 193]
!195 = metadata !{i32 193, i32 0, metadata !33, null}
!196 = metadata !{i32 786689, metadata !33, metadata !"min_time", metadata !5, i32 33554625, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [min_time] [line 193]
!197 = metadata !{i32 786689, metadata !33, metadata !"R", metadata !5, i32 50331841, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 193]
!198 = metadata !{i32 786688, metadata !33, metadata !"A", metadata !5, i32 196, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 196]
!199 = metadata !{i32 196, i32 0, metadata !33, null}
!200 = metadata !{i32 786688, metadata !33, metadata !"lu", metadata !5, i32 197, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lu] [line 197]
!201 = metadata !{i32 197, i32 0, metadata !33, null}
!202 = metadata !{i32 786688, metadata !33, metadata !"pivot", metadata !5, i32 198, metadata !149, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pivot] [line 198]
!203 = metadata !{i32 198, i32 0, metadata !33, null}
!204 = metadata !{i32 786688, metadata !33, metadata !"Q", metadata !5, i32 202, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Q] [line 202]
!205 = metadata !{i32 202, i32 0, metadata !33, null}
!206 = metadata !{i32 786688, metadata !33, metadata !"result", metadata !5, i32 203, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 203]
!207 = metadata !{i32 203, i32 0, metadata !33, null}
!208 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 204, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 204]
!209 = metadata !{i32 204, i32 0, metadata !33, null}
!210 = metadata !{i32 786688, metadata !33, metadata !"cycles", metadata !5, i32 205, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cycles] [line 205]
!211 = metadata !{i32 205, i32 0, metadata !33, null}
!212 = metadata !{i32 207, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !33, i32 207, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!214 = metadata !{i32 208, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !33, i32 208, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!216 = metadata !{i32 209, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !33, i32 209, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!218 = metadata !{i32 212, i32 0, metadata !33, null}
!219 = metadata !{i32 214, i32 0, metadata !220, null}
!220 = metadata !{i32 786443, metadata !1, metadata !33, i32 213, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!221 = metadata !{i32 215, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !1, metadata !220, i32 215, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!223 = metadata !{i32 217, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !222, i32 216, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!225 = metadata !{i32 218, i32 0, metadata !224, null}
!226 = metadata !{i32 219, i32 0, metadata !224, null}
!227 = metadata !{i32 220, i32 0, metadata !220, null}
!228 = metadata !{i32 221, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !220, i32 221, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/kernel.c]
!230 = metadata !{i32 223, i32 0, metadata !220, null}
!231 = metadata !{i32 224, i32 0, metadata !220, null}
!232 = metadata !{i32 226, i32 0, metadata !33, null}
!233 = metadata !{i32 228, i32 0, metadata !33, null}
!234 = metadata !{i32 229, i32 0, metadata !33, null}
!235 = metadata !{i32 230, i32 0, metadata !33, null}
!236 = metadata !{i32 231, i32 0, metadata !33, null}
!237 = metadata !{i32 233, i32 0, metadata !33, null}
