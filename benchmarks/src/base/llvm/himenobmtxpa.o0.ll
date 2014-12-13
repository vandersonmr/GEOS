; ModuleID = 'himenobmtxpa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Mat = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@omega = global float 0x3FE99999A0000000, align 4
@.str = private unnamed_addr constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1
@p = common global %struct.Mat zeroinitializer, align 8
@bnd = common global %struct.Mat zeroinitializer, align 8
@wrk1 = common global %struct.Mat zeroinitializer, align 8
@wrk2 = common global %struct.Mat zeroinitializer, align 8
@a = common global %struct.Mat zeroinitializer, align 8
@b = common global %struct.Mat zeroinitializer, align 8
@c = common global %struct.Mat zeroinitializer, align 8
@.str2 = private unnamed_addr constant [29 x i8] c" Loop executed for %d times\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c" Gosa : %e \0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"XS\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"xs\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"xl\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"Invalid input character !!\0A\00", align 1
@second.base_sec = internal global i32 0, align 4
@second.base_usec = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %nn = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %mimax = alloca i32, align 4
  %mjmax = alloca i32, align 4
  %mkmax = alloca i32, align 4
  %msize = alloca [3 x i32], align 4
  %gosa = alloca float, align 4
  %cpu0 = alloca double, align 8
  %cpu1 = alloca double, align 8
  %cpu = alloca double, align 8
  %flop = alloca double, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !64), !dbg !65
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !66), !dbg !65
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !69), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !70), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %nn}, metadata !71), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %imax}, metadata !72), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %jmax}, metadata !74), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %kmax}, metadata !75), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %mimax}, metadata !76), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %mjmax}, metadata !77), !dbg !73
  call void @llvm.dbg.declare(metadata !{i32* %mkmax}, metadata !78), !dbg !73
  call void @llvm.dbg.declare(metadata !{[3 x i32]* %msize}, metadata !79), !dbg !73
  call void @llvm.dbg.declare(metadata !{float* %gosa}, metadata !83), !dbg !84
  call void @llvm.dbg.declare(metadata !{double* %cpu0}, metadata !85), !dbg !86
  call void @llvm.dbg.declare(metadata !{double* %cpu1}, metadata !87), !dbg !86
  call void @llvm.dbg.declare(metadata !{double* %cpu}, metadata !88), !dbg !86
  call void @llvm.dbg.declare(metadata !{double* %flop}, metadata !89), !dbg !86
  %4 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0, !dbg !90
  store i32 64, i32* %4, align 4, !dbg !90
  %5 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1, !dbg !91
  store i32 64, i32* %5, align 4, !dbg !91
  %6 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2, !dbg !92
  store i32 128, i32* %6, align 4, !dbg !92
  %7 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 0, !dbg !93
  %8 = load i32* %7, align 4, !dbg !93
  store i32 %8, i32* %mimax, align 4, !dbg !93
  %9 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 1, !dbg !94
  %10 = load i32* %9, align 4, !dbg !94
  store i32 %10, i32* %mjmax, align 4, !dbg !94
  %11 = getelementptr inbounds [3 x i32]* %msize, i32 0, i64 2, !dbg !95
  %12 = load i32* %11, align 4, !dbg !95
  store i32 %12, i32* %mkmax, align 4, !dbg !95
  %13 = load i32* %mimax, align 4, !dbg !96
  %14 = sub nsw i32 %13, 1, !dbg !96
  store i32 %14, i32* %imax, align 4, !dbg !96
  %15 = load i32* %mjmax, align 4, !dbg !97
  %16 = sub nsw i32 %15, 1, !dbg !97
  store i32 %16, i32* %jmax, align 4, !dbg !97
  %17 = load i32* %mkmax, align 4, !dbg !98
  %18 = sub nsw i32 %17, 1, !dbg !98
  store i32 %18, i32* %kmax, align 4, !dbg !98
  %19 = load i32* %mimax, align 4, !dbg !99
  %20 = load i32* %mjmax, align 4, !dbg !99
  %21 = load i32* %mkmax, align 4, !dbg !99
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i32 %19, i32 %20, i32 %21), !dbg !99
  %23 = load i32* %imax, align 4, !dbg !100
  %24 = load i32* %jmax, align 4, !dbg !100
  %25 = load i32* %kmax, align 4, !dbg !100
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i32 %23, i32 %24, i32 %25), !dbg !100
  %27 = load i32* %mimax, align 4, !dbg !101
  %28 = load i32* %mjmax, align 4, !dbg !101
  %29 = load i32* %mkmax, align 4, !dbg !101
  %30 = call i32 @newMat(%struct.Mat* @p, i32 1, i32 %27, i32 %28, i32 %29), !dbg !101
  %31 = load i32* %mimax, align 4, !dbg !102
  %32 = load i32* %mjmax, align 4, !dbg !102
  %33 = load i32* %mkmax, align 4, !dbg !102
  %34 = call i32 @newMat(%struct.Mat* @bnd, i32 1, i32 %31, i32 %32, i32 %33), !dbg !102
  %35 = load i32* %mimax, align 4, !dbg !103
  %36 = load i32* %mjmax, align 4, !dbg !103
  %37 = load i32* %mkmax, align 4, !dbg !103
  %38 = call i32 @newMat(%struct.Mat* @wrk1, i32 1, i32 %35, i32 %36, i32 %37), !dbg !103
  %39 = load i32* %mimax, align 4, !dbg !104
  %40 = load i32* %mjmax, align 4, !dbg !104
  %41 = load i32* %mkmax, align 4, !dbg !104
  %42 = call i32 @newMat(%struct.Mat* @wrk2, i32 1, i32 %39, i32 %40, i32 %41), !dbg !104
  %43 = load i32* %mimax, align 4, !dbg !105
  %44 = load i32* %mjmax, align 4, !dbg !105
  %45 = load i32* %mkmax, align 4, !dbg !105
  %46 = call i32 @newMat(%struct.Mat* @a, i32 4, i32 %43, i32 %44, i32 %45), !dbg !105
  %47 = load i32* %mimax, align 4, !dbg !106
  %48 = load i32* %mjmax, align 4, !dbg !106
  %49 = load i32* %mkmax, align 4, !dbg !106
  %50 = call i32 @newMat(%struct.Mat* @b, i32 3, i32 %47, i32 %48, i32 %49), !dbg !106
  %51 = load i32* %mimax, align 4, !dbg !107
  %52 = load i32* %mjmax, align 4, !dbg !107
  %53 = load i32* %mkmax, align 4, !dbg !107
  %54 = call i32 @newMat(%struct.Mat* @c, i32 3, i32 %51, i32 %52, i32 %53), !dbg !107
  call void @mat_set_init(%struct.Mat* @p), !dbg !108
  call void @mat_set(%struct.Mat* @bnd, i32 0, float 1.000000e+00), !dbg !109
  call void @mat_set(%struct.Mat* @wrk1, i32 0, float 0.000000e+00), !dbg !110
  call void @mat_set(%struct.Mat* @wrk2, i32 0, float 0.000000e+00), !dbg !111
  call void @mat_set(%struct.Mat* @a, i32 0, float 1.000000e+00), !dbg !112
  call void @mat_set(%struct.Mat* @a, i32 1, float 1.000000e+00), !dbg !113
  call void @mat_set(%struct.Mat* @a, i32 2, float 1.000000e+00), !dbg !114
  call void @mat_set(%struct.Mat* @a, i32 3, float 0x3FC5555560000000), !dbg !115
  call void @mat_set(%struct.Mat* @b, i32 0, float 0.000000e+00), !dbg !116
  call void @mat_set(%struct.Mat* @b, i32 1, float 0.000000e+00), !dbg !117
  call void @mat_set(%struct.Mat* @b, i32 2, float 0.000000e+00), !dbg !118
  call void @mat_set(%struct.Mat* @c, i32 0, float 1.000000e+00), !dbg !119
  call void @mat_set(%struct.Mat* @c, i32 1, float 1.000000e+00), !dbg !120
  call void @mat_set(%struct.Mat* @c, i32 2, float 1.000000e+00), !dbg !121
  store i32 64, i32* %nn, align 4, !dbg !122
  %55 = load i32* %nn, align 4, !dbg !123
  %56 = call float @jacobi(i32 %55, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2), !dbg !123
  store float %56, float* %gosa, align 4, !dbg !123
  %57 = load i32* %nn, align 4, !dbg !124
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i32 %57), !dbg !124
  %59 = load float* %gosa, align 4, !dbg !125
  %60 = fpext float %59 to double, !dbg !125
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), double %60), !dbg !125
  call void @clearMat(%struct.Mat* @p), !dbg !126
  call void @clearMat(%struct.Mat* @bnd), !dbg !127
  call void @clearMat(%struct.Mat* @wrk1), !dbg !128
  call void @clearMat(%struct.Mat* @wrk2), !dbg !129
  call void @clearMat(%struct.Mat* @a), !dbg !130
  call void @clearMat(%struct.Mat* @b), !dbg !131
  call void @clearMat(%struct.Mat* @c), !dbg !132
  ret i32 0, !dbg !133
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
  %1 = alloca %struct.Mat*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %1}, metadata !134), !dbg !135
  store i32 %mnums, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !136), !dbg !135
  store i32 %mrows, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !137), !dbg !135
  store i32 %mcols, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !138), !dbg !135
  store i32 %mdeps, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !139), !dbg !135
  %6 = load i32* %2, align 4, !dbg !140
  %7 = load %struct.Mat** %1, align 8, !dbg !140
  %8 = getelementptr inbounds %struct.Mat* %7, i32 0, i32 1, !dbg !140
  store i32 %6, i32* %8, align 4, !dbg !140
  %9 = load i32* %3, align 4, !dbg !141
  %10 = load %struct.Mat** %1, align 8, !dbg !141
  %11 = getelementptr inbounds %struct.Mat* %10, i32 0, i32 2, !dbg !141
  store i32 %9, i32* %11, align 4, !dbg !141
  %12 = load i32* %4, align 4, !dbg !142
  %13 = load %struct.Mat** %1, align 8, !dbg !142
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3, !dbg !142
  store i32 %12, i32* %14, align 4, !dbg !142
  %15 = load i32* %5, align 4, !dbg !143
  %16 = load %struct.Mat** %1, align 8, !dbg !143
  %17 = getelementptr inbounds %struct.Mat* %16, i32 0, i32 4, !dbg !143
  store i32 %15, i32* %17, align 4, !dbg !143
  %18 = load %struct.Mat** %1, align 8, !dbg !144
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 0, !dbg !144
  store float* null, float** %19, align 8, !dbg !144
  %20 = load i32* %2, align 4, !dbg !145
  %21 = load i32* %3, align 4, !dbg !145
  %22 = mul nsw i32 %20, %21, !dbg !145
  %23 = load i32* %4, align 4, !dbg !145
  %24 = mul nsw i32 %22, %23, !dbg !145
  %25 = load i32* %5, align 4, !dbg !145
  %26 = mul nsw i32 %24, %25, !dbg !145
  %27 = sext i32 %26 to i64, !dbg !145
  %28 = mul i64 %27, 4, !dbg !145
  %29 = call noalias i8* @malloc(i64 %28) #5, !dbg !145
  %30 = bitcast i8* %29 to float*, !dbg !145
  %31 = load %struct.Mat** %1, align 8, !dbg !145
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 0, !dbg !145
  store float* %30, float** %32, align 8, !dbg !145
  %33 = load %struct.Mat** %1, align 8, !dbg !146
  %34 = getelementptr inbounds %struct.Mat* %33, i32 0, i32 0, !dbg !146
  %35 = load float** %34, align 8, !dbg !146
  %36 = icmp ne float* %35, null, !dbg !146
  %37 = select i1 %36, i32 1, i32 0, !dbg !146
  ret i32 %37, !dbg !146
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* %Mat) #0 {
  %1 = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %tt = alloca float, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %1}, metadata !147), !dbg !148
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !149), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !151), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !152), !dbg !150
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !153), !dbg !150
  call void @llvm.dbg.declare(metadata !{float* %tt}, metadata !154), !dbg !155
  store i32 0, i32* %i, align 4, !dbg !156
  br label %2, !dbg !156

; <label>:2                                       ; preds = %81, %0
  %3 = load i32* %i, align 4, !dbg !156
  %4 = load %struct.Mat** %1, align 8, !dbg !156
  %5 = getelementptr inbounds %struct.Mat* %4, i32 0, i32 2, !dbg !156
  %6 = load i32* %5, align 4, !dbg !156
  %7 = icmp slt i32 %3, %6, !dbg !156
  br i1 %7, label %8, label %84, !dbg !156

; <label>:8                                       ; preds = %2
  store i32 0, i32* %j, align 4, !dbg !158
  br label %9, !dbg !158

; <label>:9                                       ; preds = %77, %8
  %10 = load i32* %j, align 4, !dbg !158
  %11 = load %struct.Mat** %1, align 8, !dbg !158
  %12 = getelementptr inbounds %struct.Mat* %11, i32 0, i32 3, !dbg !158
  %13 = load i32* %12, align 4, !dbg !158
  %14 = icmp slt i32 %10, %13, !dbg !158
  br i1 %14, label %15, label %80, !dbg !158

; <label>:15                                      ; preds = %9
  store i32 0, i32* %k, align 4, !dbg !160
  br label %16, !dbg !160

; <label>:16                                      ; preds = %73, %15
  %17 = load i32* %k, align 4, !dbg !160
  %18 = load %struct.Mat** %1, align 8, !dbg !160
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 4, !dbg !160
  %20 = load i32* %19, align 4, !dbg !160
  %21 = icmp slt i32 %17, %20, !dbg !160
  br i1 %21, label %22, label %76, !dbg !160

; <label>:22                                      ; preds = %16
  %23 = load i32* %i, align 4, !dbg !162
  %24 = load i32* %i, align 4, !dbg !162
  %25 = mul nsw i32 %23, %24, !dbg !162
  %26 = sitofp i32 %25 to float, !dbg !162
  %27 = load %struct.Mat** %1, align 8, !dbg !162
  %28 = getelementptr inbounds %struct.Mat* %27, i32 0, i32 2, !dbg !162
  %29 = load i32* %28, align 4, !dbg !162
  %30 = sub nsw i32 %29, 1, !dbg !162
  %31 = load %struct.Mat** %1, align 8, !dbg !162
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 2, !dbg !162
  %33 = load i32* %32, align 4, !dbg !162
  %34 = sub nsw i32 %33, 1, !dbg !162
  %35 = mul nsw i32 %30, %34, !dbg !162
  %36 = sitofp i32 %35 to float, !dbg !162
  %37 = fdiv float %26, %36, !dbg !162
  %38 = load %struct.Mat** %1, align 8, !dbg !162
  %39 = getelementptr inbounds %struct.Mat* %38, i32 0, i32 2, !dbg !162
  %40 = load i32* %39, align 4, !dbg !162
  %41 = mul nsw i32 0, %40, !dbg !162
  %42 = load %struct.Mat** %1, align 8, !dbg !162
  %43 = getelementptr inbounds %struct.Mat* %42, i32 0, i32 3, !dbg !162
  %44 = load i32* %43, align 4, !dbg !162
  %45 = mul nsw i32 %41, %44, !dbg !162
  %46 = load %struct.Mat** %1, align 8, !dbg !162
  %47 = getelementptr inbounds %struct.Mat* %46, i32 0, i32 4, !dbg !162
  %48 = load i32* %47, align 4, !dbg !162
  %49 = mul nsw i32 %45, %48, !dbg !162
  %50 = load i32* %i, align 4, !dbg !162
  %51 = load %struct.Mat** %1, align 8, !dbg !162
  %52 = getelementptr inbounds %struct.Mat* %51, i32 0, i32 3, !dbg !162
  %53 = load i32* %52, align 4, !dbg !162
  %54 = mul nsw i32 %50, %53, !dbg !162
  %55 = load %struct.Mat** %1, align 8, !dbg !162
  %56 = getelementptr inbounds %struct.Mat* %55, i32 0, i32 4, !dbg !162
  %57 = load i32* %56, align 4, !dbg !162
  %58 = mul nsw i32 %54, %57, !dbg !162
  %59 = add nsw i32 %49, %58, !dbg !162
  %60 = load i32* %j, align 4, !dbg !162
  %61 = load %struct.Mat** %1, align 8, !dbg !162
  %62 = getelementptr inbounds %struct.Mat* %61, i32 0, i32 4, !dbg !162
  %63 = load i32* %62, align 4, !dbg !162
  %64 = mul nsw i32 %60, %63, !dbg !162
  %65 = add nsw i32 %59, %64, !dbg !162
  %66 = load i32* %k, align 4, !dbg !162
  %67 = add nsw i32 %65, %66, !dbg !162
  %68 = sext i32 %67 to i64, !dbg !162
  %69 = load %struct.Mat** %1, align 8, !dbg !162
  %70 = getelementptr inbounds %struct.Mat* %69, i32 0, i32 0, !dbg !162
  %71 = load float** %70, align 8, !dbg !162
  %72 = getelementptr inbounds float* %71, i64 %68, !dbg !162
  store float %37, float* %72, align 4, !dbg !162
  br label %73, !dbg !162

; <label>:73                                      ; preds = %22
  %74 = load i32* %k, align 4, !dbg !160
  %75 = add nsw i32 %74, 1, !dbg !160
  store i32 %75, i32* %k, align 4, !dbg !160
  br label %16, !dbg !160

; <label>:76                                      ; preds = %16
  br label %77, !dbg !163

; <label>:77                                      ; preds = %76
  %78 = load i32* %j, align 4, !dbg !158
  %79 = add nsw i32 %78, 1, !dbg !158
  store i32 %79, i32* %j, align 4, !dbg !158
  br label %9, !dbg !158

; <label>:80                                      ; preds = %9
  br label %81, !dbg !164

; <label>:81                                      ; preds = %80
  %82 = load i32* %i, align 4, !dbg !156
  %83 = add nsw i32 %82, 1, !dbg !156
  store i32 %83, i32* %i, align 4, !dbg !156
  br label %2, !dbg !156

; <label>:84                                      ; preds = %2
  ret void, !dbg !165
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* %Mat, i32 %l, float %val) #0 {
  %1 = alloca %struct.Mat*, align 8
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %1}, metadata !166), !dbg !167
  store i32 %l, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !168), !dbg !167
  store float %val, float* %3, align 4
  call void @llvm.dbg.declare(metadata !{float* %3}, metadata !169), !dbg !167
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !170), !dbg !171
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !172), !dbg !171
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !173), !dbg !171
  store i32 0, i32* %i, align 4, !dbg !174
  br label %4, !dbg !174

; <label>:4                                       ; preds = %70, %0
  %5 = load i32* %i, align 4, !dbg !174
  %6 = load %struct.Mat** %1, align 8, !dbg !174
  %7 = getelementptr inbounds %struct.Mat* %6, i32 0, i32 2, !dbg !174
  %8 = load i32* %7, align 4, !dbg !174
  %9 = icmp slt i32 %5, %8, !dbg !174
  br i1 %9, label %10, label %73, !dbg !174

; <label>:10                                      ; preds = %4
  store i32 0, i32* %j, align 4, !dbg !176
  br label %11, !dbg !176

; <label>:11                                      ; preds = %66, %10
  %12 = load i32* %j, align 4, !dbg !176
  %13 = load %struct.Mat** %1, align 8, !dbg !176
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3, !dbg !176
  %15 = load i32* %14, align 4, !dbg !176
  %16 = icmp slt i32 %12, %15, !dbg !176
  br i1 %16, label %17, label %69, !dbg !176

; <label>:17                                      ; preds = %11
  store i32 0, i32* %k, align 4, !dbg !178
  br label %18, !dbg !178

; <label>:18                                      ; preds = %62, %17
  %19 = load i32* %k, align 4, !dbg !178
  %20 = load %struct.Mat** %1, align 8, !dbg !178
  %21 = getelementptr inbounds %struct.Mat* %20, i32 0, i32 4, !dbg !178
  %22 = load i32* %21, align 4, !dbg !178
  %23 = icmp slt i32 %19, %22, !dbg !178
  br i1 %23, label %24, label %65, !dbg !178

; <label>:24                                      ; preds = %18
  %25 = load float* %3, align 4, !dbg !180
  %26 = load i32* %2, align 4, !dbg !180
  %27 = load %struct.Mat** %1, align 8, !dbg !180
  %28 = getelementptr inbounds %struct.Mat* %27, i32 0, i32 2, !dbg !180
  %29 = load i32* %28, align 4, !dbg !180
  %30 = mul nsw i32 %26, %29, !dbg !180
  %31 = load %struct.Mat** %1, align 8, !dbg !180
  %32 = getelementptr inbounds %struct.Mat* %31, i32 0, i32 3, !dbg !180
  %33 = load i32* %32, align 4, !dbg !180
  %34 = mul nsw i32 %30, %33, !dbg !180
  %35 = load %struct.Mat** %1, align 8, !dbg !180
  %36 = getelementptr inbounds %struct.Mat* %35, i32 0, i32 4, !dbg !180
  %37 = load i32* %36, align 4, !dbg !180
  %38 = mul nsw i32 %34, %37, !dbg !180
  %39 = load i32* %i, align 4, !dbg !180
  %40 = load %struct.Mat** %1, align 8, !dbg !180
  %41 = getelementptr inbounds %struct.Mat* %40, i32 0, i32 3, !dbg !180
  %42 = load i32* %41, align 4, !dbg !180
  %43 = mul nsw i32 %39, %42, !dbg !180
  %44 = load %struct.Mat** %1, align 8, !dbg !180
  %45 = getelementptr inbounds %struct.Mat* %44, i32 0, i32 4, !dbg !180
  %46 = load i32* %45, align 4, !dbg !180
  %47 = mul nsw i32 %43, %46, !dbg !180
  %48 = add nsw i32 %38, %47, !dbg !180
  %49 = load i32* %j, align 4, !dbg !180
  %50 = load %struct.Mat** %1, align 8, !dbg !180
  %51 = getelementptr inbounds %struct.Mat* %50, i32 0, i32 4, !dbg !180
  %52 = load i32* %51, align 4, !dbg !180
  %53 = mul nsw i32 %49, %52, !dbg !180
  %54 = add nsw i32 %48, %53, !dbg !180
  %55 = load i32* %k, align 4, !dbg !180
  %56 = add nsw i32 %54, %55, !dbg !180
  %57 = sext i32 %56 to i64, !dbg !180
  %58 = load %struct.Mat** %1, align 8, !dbg !180
  %59 = getelementptr inbounds %struct.Mat* %58, i32 0, i32 0, !dbg !180
  %60 = load float** %59, align 8, !dbg !180
  %61 = getelementptr inbounds float* %60, i64 %57, !dbg !180
  store float %25, float* %61, align 4, !dbg !180
  br label %62, !dbg !180

; <label>:62                                      ; preds = %24
  %63 = load i32* %k, align 4, !dbg !178
  %64 = add nsw i32 %63, 1, !dbg !178
  store i32 %64, i32* %k, align 4, !dbg !178
  br label %18, !dbg !178

; <label>:65                                      ; preds = %18
  br label %66, !dbg !180

; <label>:66                                      ; preds = %65
  %67 = load i32* %j, align 4, !dbg !176
  %68 = add nsw i32 %67, 1, !dbg !176
  store i32 %68, i32* %j, align 4, !dbg !176
  br label %11, !dbg !176

; <label>:69                                      ; preds = %11
  br label %70, !dbg !181

; <label>:70                                      ; preds = %69
  %71 = load i32* %i, align 4, !dbg !174
  %72 = add nsw i32 %71, 1, !dbg !174
  store i32 %72, i32* %i, align 4, !dbg !174
  br label %4, !dbg !174

; <label>:73                                      ; preds = %4
  ret void, !dbg !182
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* %a, %struct.Mat* %b, %struct.Mat* %c, %struct.Mat* %p, %struct.Mat* %bnd, %struct.Mat* %wrk1, %struct.Mat* %wrk2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Mat*, align 8
  %3 = alloca %struct.Mat*, align 8
  %4 = alloca %struct.Mat*, align 8
  %5 = alloca %struct.Mat*, align 8
  %6 = alloca %struct.Mat*, align 8
  %7 = alloca %struct.Mat*, align 8
  %8 = alloca %struct.Mat*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %imax = alloca i32, align 4
  %jmax = alloca i32, align 4
  %kmax = alloca i32, align 4
  %gosa = alloca float, align 4
  %s0 = alloca float, align 4
  %ss = alloca float, align 4
  store i32 %nn, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !183), !dbg !184
  store %struct.Mat* %a, %struct.Mat** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %2}, metadata !185), !dbg !184
  store %struct.Mat* %b, %struct.Mat** %3, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %3}, metadata !186), !dbg !184
  store %struct.Mat* %c, %struct.Mat** %4, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %4}, metadata !187), !dbg !184
  store %struct.Mat* %p, %struct.Mat** %5, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %5}, metadata !188), !dbg !189
  store %struct.Mat* %bnd, %struct.Mat** %6, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %6}, metadata !190), !dbg !189
  store %struct.Mat* %wrk1, %struct.Mat** %7, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %7}, metadata !191), !dbg !189
  store %struct.Mat* %wrk2, %struct.Mat** %8, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %8}, metadata !192), !dbg !189
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !193), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !195), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !196), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !197), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %imax}, metadata !198), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %jmax}, metadata !199), !dbg !194
  call void @llvm.dbg.declare(metadata !{i32* %kmax}, metadata !200), !dbg !194
  call void @llvm.dbg.declare(metadata !{float* %gosa}, metadata !201), !dbg !202
  call void @llvm.dbg.declare(metadata !{float* %s0}, metadata !203), !dbg !202
  call void @llvm.dbg.declare(metadata !{float* %ss}, metadata !204), !dbg !202
  %9 = load %struct.Mat** %5, align 8, !dbg !205
  %10 = getelementptr inbounds %struct.Mat* %9, i32 0, i32 2, !dbg !205
  %11 = load i32* %10, align 4, !dbg !205
  %12 = sub nsw i32 %11, 1, !dbg !205
  store i32 %12, i32* %imax, align 4, !dbg !205
  %13 = load %struct.Mat** %5, align 8, !dbg !206
  %14 = getelementptr inbounds %struct.Mat* %13, i32 0, i32 3, !dbg !206
  %15 = load i32* %14, align 4, !dbg !206
  %16 = sub nsw i32 %15, 1, !dbg !206
  store i32 %16, i32* %jmax, align 4, !dbg !206
  %17 = load %struct.Mat** %5, align 8, !dbg !207
  %18 = getelementptr inbounds %struct.Mat* %17, i32 0, i32 4, !dbg !207
  %19 = load i32* %18, align 4, !dbg !207
  %20 = sub nsw i32 %19, 1, !dbg !207
  store i32 %20, i32* %kmax, align 4, !dbg !207
  store i32 0, i32* %n, align 4, !dbg !208
  br label %21, !dbg !208

; <label>:21                                      ; preds = %1408, %0
  %22 = load i32* %n, align 4, !dbg !208
  %23 = load i32* %1, align 4, !dbg !208
  %24 = icmp slt i32 %22, %23, !dbg !208
  br i1 %24, label %25, label %1411, !dbg !208

; <label>:25                                      ; preds = %21
  store float 0.000000e+00, float* %gosa, align 4, !dbg !210
  store i32 1, i32* %i, align 4, !dbg !212
  br label %26, !dbg !212

; <label>:26                                      ; preds = %1306, %25
  %27 = load i32* %i, align 4, !dbg !212
  %28 = load i32* %imax, align 4, !dbg !212
  %29 = icmp slt i32 %27, %28, !dbg !212
  br i1 %29, label %30, label %1309, !dbg !212

; <label>:30                                      ; preds = %26
  store i32 1, i32* %j, align 4, !dbg !214
  br label %31, !dbg !214

; <label>:31                                      ; preds = %1302, %30
  %32 = load i32* %j, align 4, !dbg !214
  %33 = load i32* %jmax, align 4, !dbg !214
  %34 = icmp slt i32 %32, %33, !dbg !214
  br i1 %34, label %35, label %1305, !dbg !214

; <label>:35                                      ; preds = %31
  store i32 1, i32* %k, align 4, !dbg !216
  br label %36, !dbg !216

; <label>:36                                      ; preds = %1298, %35
  %37 = load i32* %k, align 4, !dbg !216
  %38 = load i32* %kmax, align 4, !dbg !216
  %39 = icmp slt i32 %37, %38, !dbg !216
  br i1 %39, label %40, label %1301, !dbg !216

; <label>:40                                      ; preds = %36
  %41 = load %struct.Mat** %2, align 8, !dbg !218
  %42 = getelementptr inbounds %struct.Mat* %41, i32 0, i32 2, !dbg !218
  %43 = load i32* %42, align 4, !dbg !218
  %44 = mul nsw i32 0, %43, !dbg !218
  %45 = load %struct.Mat** %2, align 8, !dbg !218
  %46 = getelementptr inbounds %struct.Mat* %45, i32 0, i32 3, !dbg !218
  %47 = load i32* %46, align 4, !dbg !218
  %48 = mul nsw i32 %44, %47, !dbg !218
  %49 = load %struct.Mat** %2, align 8, !dbg !218
  %50 = getelementptr inbounds %struct.Mat* %49, i32 0, i32 4, !dbg !218
  %51 = load i32* %50, align 4, !dbg !218
  %52 = mul nsw i32 %48, %51, !dbg !218
  %53 = load i32* %i, align 4, !dbg !218
  %54 = load %struct.Mat** %2, align 8, !dbg !218
  %55 = getelementptr inbounds %struct.Mat* %54, i32 0, i32 3, !dbg !218
  %56 = load i32* %55, align 4, !dbg !218
  %57 = mul nsw i32 %53, %56, !dbg !218
  %58 = load %struct.Mat** %2, align 8, !dbg !218
  %59 = getelementptr inbounds %struct.Mat* %58, i32 0, i32 4, !dbg !218
  %60 = load i32* %59, align 4, !dbg !218
  %61 = mul nsw i32 %57, %60, !dbg !218
  %62 = add nsw i32 %52, %61, !dbg !218
  %63 = load i32* %j, align 4, !dbg !218
  %64 = load %struct.Mat** %2, align 8, !dbg !218
  %65 = getelementptr inbounds %struct.Mat* %64, i32 0, i32 4, !dbg !218
  %66 = load i32* %65, align 4, !dbg !218
  %67 = mul nsw i32 %63, %66, !dbg !218
  %68 = add nsw i32 %62, %67, !dbg !218
  %69 = load i32* %k, align 4, !dbg !218
  %70 = add nsw i32 %68, %69, !dbg !218
  %71 = sext i32 %70 to i64, !dbg !218
  %72 = load %struct.Mat** %2, align 8, !dbg !218
  %73 = getelementptr inbounds %struct.Mat* %72, i32 0, i32 0, !dbg !218
  %74 = load float** %73, align 8, !dbg !218
  %75 = getelementptr inbounds float* %74, i64 %71, !dbg !218
  %76 = load float* %75, align 4, !dbg !218
  %77 = load %struct.Mat** %5, align 8, !dbg !218
  %78 = getelementptr inbounds %struct.Mat* %77, i32 0, i32 2, !dbg !218
  %79 = load i32* %78, align 4, !dbg !218
  %80 = mul nsw i32 0, %79, !dbg !218
  %81 = load %struct.Mat** %5, align 8, !dbg !218
  %82 = getelementptr inbounds %struct.Mat* %81, i32 0, i32 3, !dbg !218
  %83 = load i32* %82, align 4, !dbg !218
  %84 = mul nsw i32 %80, %83, !dbg !218
  %85 = load %struct.Mat** %5, align 8, !dbg !218
  %86 = getelementptr inbounds %struct.Mat* %85, i32 0, i32 4, !dbg !218
  %87 = load i32* %86, align 4, !dbg !218
  %88 = mul nsw i32 %84, %87, !dbg !218
  %89 = load i32* %i, align 4, !dbg !218
  %90 = add nsw i32 %89, 1, !dbg !218
  %91 = load %struct.Mat** %5, align 8, !dbg !218
  %92 = getelementptr inbounds %struct.Mat* %91, i32 0, i32 3, !dbg !218
  %93 = load i32* %92, align 4, !dbg !218
  %94 = mul nsw i32 %90, %93, !dbg !218
  %95 = load %struct.Mat** %5, align 8, !dbg !218
  %96 = getelementptr inbounds %struct.Mat* %95, i32 0, i32 4, !dbg !218
  %97 = load i32* %96, align 4, !dbg !218
  %98 = mul nsw i32 %94, %97, !dbg !218
  %99 = add nsw i32 %88, %98, !dbg !218
  %100 = load i32* %j, align 4, !dbg !218
  %101 = load %struct.Mat** %5, align 8, !dbg !218
  %102 = getelementptr inbounds %struct.Mat* %101, i32 0, i32 4, !dbg !218
  %103 = load i32* %102, align 4, !dbg !218
  %104 = mul nsw i32 %100, %103, !dbg !218
  %105 = add nsw i32 %99, %104, !dbg !218
  %106 = load i32* %k, align 4, !dbg !218
  %107 = add nsw i32 %105, %106, !dbg !218
  %108 = sext i32 %107 to i64, !dbg !218
  %109 = load %struct.Mat** %5, align 8, !dbg !218
  %110 = getelementptr inbounds %struct.Mat* %109, i32 0, i32 0, !dbg !218
  %111 = load float** %110, align 8, !dbg !218
  %112 = getelementptr inbounds float* %111, i64 %108, !dbg !218
  %113 = load float* %112, align 4, !dbg !218
  %114 = fmul float %76, %113, !dbg !218
  %115 = load %struct.Mat** %2, align 8, !dbg !218
  %116 = getelementptr inbounds %struct.Mat* %115, i32 0, i32 2, !dbg !218
  %117 = load i32* %116, align 4, !dbg !218
  %118 = mul nsw i32 1, %117, !dbg !218
  %119 = load %struct.Mat** %2, align 8, !dbg !218
  %120 = getelementptr inbounds %struct.Mat* %119, i32 0, i32 3, !dbg !218
  %121 = load i32* %120, align 4, !dbg !218
  %122 = mul nsw i32 %118, %121, !dbg !218
  %123 = load %struct.Mat** %2, align 8, !dbg !218
  %124 = getelementptr inbounds %struct.Mat* %123, i32 0, i32 4, !dbg !218
  %125 = load i32* %124, align 4, !dbg !218
  %126 = mul nsw i32 %122, %125, !dbg !218
  %127 = load i32* %i, align 4, !dbg !218
  %128 = load %struct.Mat** %2, align 8, !dbg !218
  %129 = getelementptr inbounds %struct.Mat* %128, i32 0, i32 3, !dbg !218
  %130 = load i32* %129, align 4, !dbg !218
  %131 = mul nsw i32 %127, %130, !dbg !218
  %132 = load %struct.Mat** %2, align 8, !dbg !218
  %133 = getelementptr inbounds %struct.Mat* %132, i32 0, i32 4, !dbg !218
  %134 = load i32* %133, align 4, !dbg !218
  %135 = mul nsw i32 %131, %134, !dbg !218
  %136 = add nsw i32 %126, %135, !dbg !218
  %137 = load i32* %j, align 4, !dbg !218
  %138 = load %struct.Mat** %2, align 8, !dbg !218
  %139 = getelementptr inbounds %struct.Mat* %138, i32 0, i32 4, !dbg !218
  %140 = load i32* %139, align 4, !dbg !218
  %141 = mul nsw i32 %137, %140, !dbg !218
  %142 = add nsw i32 %136, %141, !dbg !218
  %143 = load i32* %k, align 4, !dbg !218
  %144 = add nsw i32 %142, %143, !dbg !218
  %145 = sext i32 %144 to i64, !dbg !218
  %146 = load %struct.Mat** %2, align 8, !dbg !218
  %147 = getelementptr inbounds %struct.Mat* %146, i32 0, i32 0, !dbg !218
  %148 = load float** %147, align 8, !dbg !218
  %149 = getelementptr inbounds float* %148, i64 %145, !dbg !218
  %150 = load float* %149, align 4, !dbg !218
  %151 = load %struct.Mat** %5, align 8, !dbg !218
  %152 = getelementptr inbounds %struct.Mat* %151, i32 0, i32 2, !dbg !218
  %153 = load i32* %152, align 4, !dbg !218
  %154 = mul nsw i32 0, %153, !dbg !218
  %155 = load %struct.Mat** %5, align 8, !dbg !218
  %156 = getelementptr inbounds %struct.Mat* %155, i32 0, i32 3, !dbg !218
  %157 = load i32* %156, align 4, !dbg !218
  %158 = mul nsw i32 %154, %157, !dbg !218
  %159 = load %struct.Mat** %5, align 8, !dbg !218
  %160 = getelementptr inbounds %struct.Mat* %159, i32 0, i32 4, !dbg !218
  %161 = load i32* %160, align 4, !dbg !218
  %162 = mul nsw i32 %158, %161, !dbg !218
  %163 = load i32* %i, align 4, !dbg !218
  %164 = load %struct.Mat** %5, align 8, !dbg !218
  %165 = getelementptr inbounds %struct.Mat* %164, i32 0, i32 3, !dbg !218
  %166 = load i32* %165, align 4, !dbg !218
  %167 = mul nsw i32 %163, %166, !dbg !218
  %168 = load %struct.Mat** %5, align 8, !dbg !218
  %169 = getelementptr inbounds %struct.Mat* %168, i32 0, i32 4, !dbg !218
  %170 = load i32* %169, align 4, !dbg !218
  %171 = mul nsw i32 %167, %170, !dbg !218
  %172 = add nsw i32 %162, %171, !dbg !218
  %173 = load i32* %j, align 4, !dbg !218
  %174 = add nsw i32 %173, 1, !dbg !218
  %175 = load %struct.Mat** %5, align 8, !dbg !218
  %176 = getelementptr inbounds %struct.Mat* %175, i32 0, i32 4, !dbg !218
  %177 = load i32* %176, align 4, !dbg !218
  %178 = mul nsw i32 %174, %177, !dbg !218
  %179 = add nsw i32 %172, %178, !dbg !218
  %180 = load i32* %k, align 4, !dbg !218
  %181 = add nsw i32 %179, %180, !dbg !218
  %182 = sext i32 %181 to i64, !dbg !218
  %183 = load %struct.Mat** %5, align 8, !dbg !218
  %184 = getelementptr inbounds %struct.Mat* %183, i32 0, i32 0, !dbg !218
  %185 = load float** %184, align 8, !dbg !218
  %186 = getelementptr inbounds float* %185, i64 %182, !dbg !218
  %187 = load float* %186, align 4, !dbg !218
  %188 = fmul float %150, %187, !dbg !218
  %189 = fadd float %114, %188, !dbg !218
  %190 = load %struct.Mat** %2, align 8, !dbg !218
  %191 = getelementptr inbounds %struct.Mat* %190, i32 0, i32 2, !dbg !218
  %192 = load i32* %191, align 4, !dbg !218
  %193 = mul nsw i32 2, %192, !dbg !218
  %194 = load %struct.Mat** %2, align 8, !dbg !218
  %195 = getelementptr inbounds %struct.Mat* %194, i32 0, i32 3, !dbg !218
  %196 = load i32* %195, align 4, !dbg !218
  %197 = mul nsw i32 %193, %196, !dbg !218
  %198 = load %struct.Mat** %2, align 8, !dbg !218
  %199 = getelementptr inbounds %struct.Mat* %198, i32 0, i32 4, !dbg !218
  %200 = load i32* %199, align 4, !dbg !218
  %201 = mul nsw i32 %197, %200, !dbg !218
  %202 = load i32* %i, align 4, !dbg !218
  %203 = load %struct.Mat** %2, align 8, !dbg !218
  %204 = getelementptr inbounds %struct.Mat* %203, i32 0, i32 3, !dbg !218
  %205 = load i32* %204, align 4, !dbg !218
  %206 = mul nsw i32 %202, %205, !dbg !218
  %207 = load %struct.Mat** %2, align 8, !dbg !218
  %208 = getelementptr inbounds %struct.Mat* %207, i32 0, i32 4, !dbg !218
  %209 = load i32* %208, align 4, !dbg !218
  %210 = mul nsw i32 %206, %209, !dbg !218
  %211 = add nsw i32 %201, %210, !dbg !218
  %212 = load i32* %j, align 4, !dbg !218
  %213 = load %struct.Mat** %2, align 8, !dbg !218
  %214 = getelementptr inbounds %struct.Mat* %213, i32 0, i32 4, !dbg !218
  %215 = load i32* %214, align 4, !dbg !218
  %216 = mul nsw i32 %212, %215, !dbg !218
  %217 = add nsw i32 %211, %216, !dbg !218
  %218 = load i32* %k, align 4, !dbg !218
  %219 = add nsw i32 %217, %218, !dbg !218
  %220 = sext i32 %219 to i64, !dbg !218
  %221 = load %struct.Mat** %2, align 8, !dbg !218
  %222 = getelementptr inbounds %struct.Mat* %221, i32 0, i32 0, !dbg !218
  %223 = load float** %222, align 8, !dbg !218
  %224 = getelementptr inbounds float* %223, i64 %220, !dbg !218
  %225 = load float* %224, align 4, !dbg !218
  %226 = load %struct.Mat** %5, align 8, !dbg !218
  %227 = getelementptr inbounds %struct.Mat* %226, i32 0, i32 2, !dbg !218
  %228 = load i32* %227, align 4, !dbg !218
  %229 = mul nsw i32 0, %228, !dbg !218
  %230 = load %struct.Mat** %5, align 8, !dbg !218
  %231 = getelementptr inbounds %struct.Mat* %230, i32 0, i32 3, !dbg !218
  %232 = load i32* %231, align 4, !dbg !218
  %233 = mul nsw i32 %229, %232, !dbg !218
  %234 = load %struct.Mat** %5, align 8, !dbg !218
  %235 = getelementptr inbounds %struct.Mat* %234, i32 0, i32 4, !dbg !218
  %236 = load i32* %235, align 4, !dbg !218
  %237 = mul nsw i32 %233, %236, !dbg !218
  %238 = load i32* %i, align 4, !dbg !218
  %239 = load %struct.Mat** %5, align 8, !dbg !218
  %240 = getelementptr inbounds %struct.Mat* %239, i32 0, i32 3, !dbg !218
  %241 = load i32* %240, align 4, !dbg !218
  %242 = mul nsw i32 %238, %241, !dbg !218
  %243 = load %struct.Mat** %5, align 8, !dbg !218
  %244 = getelementptr inbounds %struct.Mat* %243, i32 0, i32 4, !dbg !218
  %245 = load i32* %244, align 4, !dbg !218
  %246 = mul nsw i32 %242, %245, !dbg !218
  %247 = add nsw i32 %237, %246, !dbg !218
  %248 = load i32* %j, align 4, !dbg !218
  %249 = load %struct.Mat** %5, align 8, !dbg !218
  %250 = getelementptr inbounds %struct.Mat* %249, i32 0, i32 4, !dbg !218
  %251 = load i32* %250, align 4, !dbg !218
  %252 = mul nsw i32 %248, %251, !dbg !218
  %253 = add nsw i32 %247, %252, !dbg !218
  %254 = load i32* %k, align 4, !dbg !218
  %255 = add nsw i32 %254, 1, !dbg !218
  %256 = add nsw i32 %253, %255, !dbg !218
  %257 = sext i32 %256 to i64, !dbg !218
  %258 = load %struct.Mat** %5, align 8, !dbg !218
  %259 = getelementptr inbounds %struct.Mat* %258, i32 0, i32 0, !dbg !218
  %260 = load float** %259, align 8, !dbg !218
  %261 = getelementptr inbounds float* %260, i64 %257, !dbg !218
  %262 = load float* %261, align 4, !dbg !218
  %263 = fmul float %225, %262, !dbg !218
  %264 = fadd float %189, %263, !dbg !218
  %265 = load %struct.Mat** %3, align 8, !dbg !218
  %266 = getelementptr inbounds %struct.Mat* %265, i32 0, i32 2, !dbg !218
  %267 = load i32* %266, align 4, !dbg !218
  %268 = mul nsw i32 0, %267, !dbg !218
  %269 = load %struct.Mat** %3, align 8, !dbg !218
  %270 = getelementptr inbounds %struct.Mat* %269, i32 0, i32 3, !dbg !218
  %271 = load i32* %270, align 4, !dbg !218
  %272 = mul nsw i32 %268, %271, !dbg !218
  %273 = load %struct.Mat** %3, align 8, !dbg !218
  %274 = getelementptr inbounds %struct.Mat* %273, i32 0, i32 4, !dbg !218
  %275 = load i32* %274, align 4, !dbg !218
  %276 = mul nsw i32 %272, %275, !dbg !218
  %277 = load i32* %i, align 4, !dbg !218
  %278 = load %struct.Mat** %3, align 8, !dbg !218
  %279 = getelementptr inbounds %struct.Mat* %278, i32 0, i32 3, !dbg !218
  %280 = load i32* %279, align 4, !dbg !218
  %281 = mul nsw i32 %277, %280, !dbg !218
  %282 = load %struct.Mat** %3, align 8, !dbg !218
  %283 = getelementptr inbounds %struct.Mat* %282, i32 0, i32 4, !dbg !218
  %284 = load i32* %283, align 4, !dbg !218
  %285 = mul nsw i32 %281, %284, !dbg !218
  %286 = add nsw i32 %276, %285, !dbg !218
  %287 = load i32* %j, align 4, !dbg !218
  %288 = load %struct.Mat** %3, align 8, !dbg !218
  %289 = getelementptr inbounds %struct.Mat* %288, i32 0, i32 4, !dbg !218
  %290 = load i32* %289, align 4, !dbg !218
  %291 = mul nsw i32 %287, %290, !dbg !218
  %292 = add nsw i32 %286, %291, !dbg !218
  %293 = load i32* %k, align 4, !dbg !218
  %294 = add nsw i32 %292, %293, !dbg !218
  %295 = sext i32 %294 to i64, !dbg !218
  %296 = load %struct.Mat** %3, align 8, !dbg !218
  %297 = getelementptr inbounds %struct.Mat* %296, i32 0, i32 0, !dbg !218
  %298 = load float** %297, align 8, !dbg !218
  %299 = getelementptr inbounds float* %298, i64 %295, !dbg !218
  %300 = load float* %299, align 4, !dbg !218
  %301 = load %struct.Mat** %5, align 8, !dbg !218
  %302 = getelementptr inbounds %struct.Mat* %301, i32 0, i32 2, !dbg !218
  %303 = load i32* %302, align 4, !dbg !218
  %304 = mul nsw i32 0, %303, !dbg !218
  %305 = load %struct.Mat** %5, align 8, !dbg !218
  %306 = getelementptr inbounds %struct.Mat* %305, i32 0, i32 3, !dbg !218
  %307 = load i32* %306, align 4, !dbg !218
  %308 = mul nsw i32 %304, %307, !dbg !218
  %309 = load %struct.Mat** %5, align 8, !dbg !218
  %310 = getelementptr inbounds %struct.Mat* %309, i32 0, i32 4, !dbg !218
  %311 = load i32* %310, align 4, !dbg !218
  %312 = mul nsw i32 %308, %311, !dbg !218
  %313 = load i32* %i, align 4, !dbg !218
  %314 = add nsw i32 %313, 1, !dbg !218
  %315 = load %struct.Mat** %5, align 8, !dbg !218
  %316 = getelementptr inbounds %struct.Mat* %315, i32 0, i32 3, !dbg !218
  %317 = load i32* %316, align 4, !dbg !218
  %318 = mul nsw i32 %314, %317, !dbg !218
  %319 = load %struct.Mat** %5, align 8, !dbg !218
  %320 = getelementptr inbounds %struct.Mat* %319, i32 0, i32 4, !dbg !218
  %321 = load i32* %320, align 4, !dbg !218
  %322 = mul nsw i32 %318, %321, !dbg !218
  %323 = add nsw i32 %312, %322, !dbg !218
  %324 = load i32* %j, align 4, !dbg !218
  %325 = add nsw i32 %324, 1, !dbg !218
  %326 = load %struct.Mat** %5, align 8, !dbg !218
  %327 = getelementptr inbounds %struct.Mat* %326, i32 0, i32 4, !dbg !218
  %328 = load i32* %327, align 4, !dbg !218
  %329 = mul nsw i32 %325, %328, !dbg !218
  %330 = add nsw i32 %323, %329, !dbg !218
  %331 = load i32* %k, align 4, !dbg !218
  %332 = add nsw i32 %330, %331, !dbg !218
  %333 = sext i32 %332 to i64, !dbg !218
  %334 = load %struct.Mat** %5, align 8, !dbg !218
  %335 = getelementptr inbounds %struct.Mat* %334, i32 0, i32 0, !dbg !218
  %336 = load float** %335, align 8, !dbg !218
  %337 = getelementptr inbounds float* %336, i64 %333, !dbg !218
  %338 = load float* %337, align 4, !dbg !218
  %339 = load %struct.Mat** %5, align 8, !dbg !218
  %340 = getelementptr inbounds %struct.Mat* %339, i32 0, i32 2, !dbg !218
  %341 = load i32* %340, align 4, !dbg !218
  %342 = mul nsw i32 0, %341, !dbg !218
  %343 = load %struct.Mat** %5, align 8, !dbg !218
  %344 = getelementptr inbounds %struct.Mat* %343, i32 0, i32 3, !dbg !218
  %345 = load i32* %344, align 4, !dbg !218
  %346 = mul nsw i32 %342, %345, !dbg !218
  %347 = load %struct.Mat** %5, align 8, !dbg !218
  %348 = getelementptr inbounds %struct.Mat* %347, i32 0, i32 4, !dbg !218
  %349 = load i32* %348, align 4, !dbg !218
  %350 = mul nsw i32 %346, %349, !dbg !218
  %351 = load i32* %i, align 4, !dbg !218
  %352 = add nsw i32 %351, 1, !dbg !218
  %353 = load %struct.Mat** %5, align 8, !dbg !218
  %354 = getelementptr inbounds %struct.Mat* %353, i32 0, i32 3, !dbg !218
  %355 = load i32* %354, align 4, !dbg !218
  %356 = mul nsw i32 %352, %355, !dbg !218
  %357 = load %struct.Mat** %5, align 8, !dbg !218
  %358 = getelementptr inbounds %struct.Mat* %357, i32 0, i32 4, !dbg !218
  %359 = load i32* %358, align 4, !dbg !218
  %360 = mul nsw i32 %356, %359, !dbg !218
  %361 = add nsw i32 %350, %360, !dbg !218
  %362 = load i32* %j, align 4, !dbg !218
  %363 = sub nsw i32 %362, 1, !dbg !218
  %364 = load %struct.Mat** %5, align 8, !dbg !218
  %365 = getelementptr inbounds %struct.Mat* %364, i32 0, i32 4, !dbg !218
  %366 = load i32* %365, align 4, !dbg !218
  %367 = mul nsw i32 %363, %366, !dbg !218
  %368 = add nsw i32 %361, %367, !dbg !218
  %369 = load i32* %k, align 4, !dbg !218
  %370 = add nsw i32 %368, %369, !dbg !218
  %371 = sext i32 %370 to i64, !dbg !218
  %372 = load %struct.Mat** %5, align 8, !dbg !218
  %373 = getelementptr inbounds %struct.Mat* %372, i32 0, i32 0, !dbg !218
  %374 = load float** %373, align 8, !dbg !218
  %375 = getelementptr inbounds float* %374, i64 %371, !dbg !218
  %376 = load float* %375, align 4, !dbg !218
  %377 = fsub float %338, %376, !dbg !218
  %378 = load %struct.Mat** %5, align 8, !dbg !218
  %379 = getelementptr inbounds %struct.Mat* %378, i32 0, i32 2, !dbg !218
  %380 = load i32* %379, align 4, !dbg !218
  %381 = mul nsw i32 0, %380, !dbg !218
  %382 = load %struct.Mat** %5, align 8, !dbg !218
  %383 = getelementptr inbounds %struct.Mat* %382, i32 0, i32 3, !dbg !218
  %384 = load i32* %383, align 4, !dbg !218
  %385 = mul nsw i32 %381, %384, !dbg !218
  %386 = load %struct.Mat** %5, align 8, !dbg !218
  %387 = getelementptr inbounds %struct.Mat* %386, i32 0, i32 4, !dbg !218
  %388 = load i32* %387, align 4, !dbg !218
  %389 = mul nsw i32 %385, %388, !dbg !218
  %390 = load i32* %i, align 4, !dbg !218
  %391 = sub nsw i32 %390, 1, !dbg !218
  %392 = load %struct.Mat** %5, align 8, !dbg !218
  %393 = getelementptr inbounds %struct.Mat* %392, i32 0, i32 3, !dbg !218
  %394 = load i32* %393, align 4, !dbg !218
  %395 = mul nsw i32 %391, %394, !dbg !218
  %396 = load %struct.Mat** %5, align 8, !dbg !218
  %397 = getelementptr inbounds %struct.Mat* %396, i32 0, i32 4, !dbg !218
  %398 = load i32* %397, align 4, !dbg !218
  %399 = mul nsw i32 %395, %398, !dbg !218
  %400 = add nsw i32 %389, %399, !dbg !218
  %401 = load i32* %j, align 4, !dbg !218
  %402 = add nsw i32 %401, 1, !dbg !218
  %403 = load %struct.Mat** %5, align 8, !dbg !218
  %404 = getelementptr inbounds %struct.Mat* %403, i32 0, i32 4, !dbg !218
  %405 = load i32* %404, align 4, !dbg !218
  %406 = mul nsw i32 %402, %405, !dbg !218
  %407 = add nsw i32 %400, %406, !dbg !218
  %408 = load i32* %k, align 4, !dbg !218
  %409 = add nsw i32 %407, %408, !dbg !218
  %410 = sext i32 %409 to i64, !dbg !218
  %411 = load %struct.Mat** %5, align 8, !dbg !218
  %412 = getelementptr inbounds %struct.Mat* %411, i32 0, i32 0, !dbg !218
  %413 = load float** %412, align 8, !dbg !218
  %414 = getelementptr inbounds float* %413, i64 %410, !dbg !218
  %415 = load float* %414, align 4, !dbg !218
  %416 = fsub float %377, %415, !dbg !218
  %417 = load %struct.Mat** %5, align 8, !dbg !218
  %418 = getelementptr inbounds %struct.Mat* %417, i32 0, i32 2, !dbg !218
  %419 = load i32* %418, align 4, !dbg !218
  %420 = mul nsw i32 0, %419, !dbg !218
  %421 = load %struct.Mat** %5, align 8, !dbg !218
  %422 = getelementptr inbounds %struct.Mat* %421, i32 0, i32 3, !dbg !218
  %423 = load i32* %422, align 4, !dbg !218
  %424 = mul nsw i32 %420, %423, !dbg !218
  %425 = load %struct.Mat** %5, align 8, !dbg !218
  %426 = getelementptr inbounds %struct.Mat* %425, i32 0, i32 4, !dbg !218
  %427 = load i32* %426, align 4, !dbg !218
  %428 = mul nsw i32 %424, %427, !dbg !218
  %429 = load i32* %i, align 4, !dbg !218
  %430 = sub nsw i32 %429, 1, !dbg !218
  %431 = load %struct.Mat** %5, align 8, !dbg !218
  %432 = getelementptr inbounds %struct.Mat* %431, i32 0, i32 3, !dbg !218
  %433 = load i32* %432, align 4, !dbg !218
  %434 = mul nsw i32 %430, %433, !dbg !218
  %435 = load %struct.Mat** %5, align 8, !dbg !218
  %436 = getelementptr inbounds %struct.Mat* %435, i32 0, i32 4, !dbg !218
  %437 = load i32* %436, align 4, !dbg !218
  %438 = mul nsw i32 %434, %437, !dbg !218
  %439 = add nsw i32 %428, %438, !dbg !218
  %440 = load i32* %j, align 4, !dbg !218
  %441 = sub nsw i32 %440, 1, !dbg !218
  %442 = load %struct.Mat** %5, align 8, !dbg !218
  %443 = getelementptr inbounds %struct.Mat* %442, i32 0, i32 4, !dbg !218
  %444 = load i32* %443, align 4, !dbg !218
  %445 = mul nsw i32 %441, %444, !dbg !218
  %446 = add nsw i32 %439, %445, !dbg !218
  %447 = load i32* %k, align 4, !dbg !218
  %448 = add nsw i32 %446, %447, !dbg !218
  %449 = sext i32 %448 to i64, !dbg !218
  %450 = load %struct.Mat** %5, align 8, !dbg !218
  %451 = getelementptr inbounds %struct.Mat* %450, i32 0, i32 0, !dbg !218
  %452 = load float** %451, align 8, !dbg !218
  %453 = getelementptr inbounds float* %452, i64 %449, !dbg !218
  %454 = load float* %453, align 4, !dbg !218
  %455 = fadd float %416, %454, !dbg !218
  %456 = fmul float %300, %455, !dbg !218
  %457 = fadd float %264, %456, !dbg !218
  %458 = load %struct.Mat** %3, align 8, !dbg !218
  %459 = getelementptr inbounds %struct.Mat* %458, i32 0, i32 2, !dbg !218
  %460 = load i32* %459, align 4, !dbg !218
  %461 = mul nsw i32 1, %460, !dbg !218
  %462 = load %struct.Mat** %3, align 8, !dbg !218
  %463 = getelementptr inbounds %struct.Mat* %462, i32 0, i32 3, !dbg !218
  %464 = load i32* %463, align 4, !dbg !218
  %465 = mul nsw i32 %461, %464, !dbg !218
  %466 = load %struct.Mat** %3, align 8, !dbg !218
  %467 = getelementptr inbounds %struct.Mat* %466, i32 0, i32 4, !dbg !218
  %468 = load i32* %467, align 4, !dbg !218
  %469 = mul nsw i32 %465, %468, !dbg !218
  %470 = load i32* %i, align 4, !dbg !218
  %471 = load %struct.Mat** %3, align 8, !dbg !218
  %472 = getelementptr inbounds %struct.Mat* %471, i32 0, i32 3, !dbg !218
  %473 = load i32* %472, align 4, !dbg !218
  %474 = mul nsw i32 %470, %473, !dbg !218
  %475 = load %struct.Mat** %3, align 8, !dbg !218
  %476 = getelementptr inbounds %struct.Mat* %475, i32 0, i32 4, !dbg !218
  %477 = load i32* %476, align 4, !dbg !218
  %478 = mul nsw i32 %474, %477, !dbg !218
  %479 = add nsw i32 %469, %478, !dbg !218
  %480 = load i32* %j, align 4, !dbg !218
  %481 = load %struct.Mat** %3, align 8, !dbg !218
  %482 = getelementptr inbounds %struct.Mat* %481, i32 0, i32 4, !dbg !218
  %483 = load i32* %482, align 4, !dbg !218
  %484 = mul nsw i32 %480, %483, !dbg !218
  %485 = add nsw i32 %479, %484, !dbg !218
  %486 = load i32* %k, align 4, !dbg !218
  %487 = add nsw i32 %485, %486, !dbg !218
  %488 = sext i32 %487 to i64, !dbg !218
  %489 = load %struct.Mat** %3, align 8, !dbg !218
  %490 = getelementptr inbounds %struct.Mat* %489, i32 0, i32 0, !dbg !218
  %491 = load float** %490, align 8, !dbg !218
  %492 = getelementptr inbounds float* %491, i64 %488, !dbg !218
  %493 = load float* %492, align 4, !dbg !218
  %494 = load %struct.Mat** %5, align 8, !dbg !218
  %495 = getelementptr inbounds %struct.Mat* %494, i32 0, i32 2, !dbg !218
  %496 = load i32* %495, align 4, !dbg !218
  %497 = mul nsw i32 0, %496, !dbg !218
  %498 = load %struct.Mat** %5, align 8, !dbg !218
  %499 = getelementptr inbounds %struct.Mat* %498, i32 0, i32 3, !dbg !218
  %500 = load i32* %499, align 4, !dbg !218
  %501 = mul nsw i32 %497, %500, !dbg !218
  %502 = load %struct.Mat** %5, align 8, !dbg !218
  %503 = getelementptr inbounds %struct.Mat* %502, i32 0, i32 4, !dbg !218
  %504 = load i32* %503, align 4, !dbg !218
  %505 = mul nsw i32 %501, %504, !dbg !218
  %506 = load i32* %i, align 4, !dbg !218
  %507 = load %struct.Mat** %5, align 8, !dbg !218
  %508 = getelementptr inbounds %struct.Mat* %507, i32 0, i32 3, !dbg !218
  %509 = load i32* %508, align 4, !dbg !218
  %510 = mul nsw i32 %506, %509, !dbg !218
  %511 = load %struct.Mat** %5, align 8, !dbg !218
  %512 = getelementptr inbounds %struct.Mat* %511, i32 0, i32 4, !dbg !218
  %513 = load i32* %512, align 4, !dbg !218
  %514 = mul nsw i32 %510, %513, !dbg !218
  %515 = add nsw i32 %505, %514, !dbg !218
  %516 = load i32* %j, align 4, !dbg !218
  %517 = add nsw i32 %516, 1, !dbg !218
  %518 = load %struct.Mat** %5, align 8, !dbg !218
  %519 = getelementptr inbounds %struct.Mat* %518, i32 0, i32 4, !dbg !218
  %520 = load i32* %519, align 4, !dbg !218
  %521 = mul nsw i32 %517, %520, !dbg !218
  %522 = add nsw i32 %515, %521, !dbg !218
  %523 = load i32* %k, align 4, !dbg !218
  %524 = add nsw i32 %523, 1, !dbg !218
  %525 = add nsw i32 %522, %524, !dbg !218
  %526 = sext i32 %525 to i64, !dbg !218
  %527 = load %struct.Mat** %5, align 8, !dbg !218
  %528 = getelementptr inbounds %struct.Mat* %527, i32 0, i32 0, !dbg !218
  %529 = load float** %528, align 8, !dbg !218
  %530 = getelementptr inbounds float* %529, i64 %526, !dbg !218
  %531 = load float* %530, align 4, !dbg !218
  %532 = load %struct.Mat** %5, align 8, !dbg !218
  %533 = getelementptr inbounds %struct.Mat* %532, i32 0, i32 2, !dbg !218
  %534 = load i32* %533, align 4, !dbg !218
  %535 = mul nsw i32 0, %534, !dbg !218
  %536 = load %struct.Mat** %5, align 8, !dbg !218
  %537 = getelementptr inbounds %struct.Mat* %536, i32 0, i32 3, !dbg !218
  %538 = load i32* %537, align 4, !dbg !218
  %539 = mul nsw i32 %535, %538, !dbg !218
  %540 = load %struct.Mat** %5, align 8, !dbg !218
  %541 = getelementptr inbounds %struct.Mat* %540, i32 0, i32 4, !dbg !218
  %542 = load i32* %541, align 4, !dbg !218
  %543 = mul nsw i32 %539, %542, !dbg !218
  %544 = load i32* %i, align 4, !dbg !218
  %545 = load %struct.Mat** %5, align 8, !dbg !218
  %546 = getelementptr inbounds %struct.Mat* %545, i32 0, i32 3, !dbg !218
  %547 = load i32* %546, align 4, !dbg !218
  %548 = mul nsw i32 %544, %547, !dbg !218
  %549 = load %struct.Mat** %5, align 8, !dbg !218
  %550 = getelementptr inbounds %struct.Mat* %549, i32 0, i32 4, !dbg !218
  %551 = load i32* %550, align 4, !dbg !218
  %552 = mul nsw i32 %548, %551, !dbg !218
  %553 = add nsw i32 %543, %552, !dbg !218
  %554 = load i32* %j, align 4, !dbg !218
  %555 = sub nsw i32 %554, 1, !dbg !218
  %556 = load %struct.Mat** %5, align 8, !dbg !218
  %557 = getelementptr inbounds %struct.Mat* %556, i32 0, i32 4, !dbg !218
  %558 = load i32* %557, align 4, !dbg !218
  %559 = mul nsw i32 %555, %558, !dbg !218
  %560 = add nsw i32 %553, %559, !dbg !218
  %561 = load i32* %k, align 4, !dbg !218
  %562 = add nsw i32 %561, 1, !dbg !218
  %563 = add nsw i32 %560, %562, !dbg !218
  %564 = sext i32 %563 to i64, !dbg !218
  %565 = load %struct.Mat** %5, align 8, !dbg !218
  %566 = getelementptr inbounds %struct.Mat* %565, i32 0, i32 0, !dbg !218
  %567 = load float** %566, align 8, !dbg !218
  %568 = getelementptr inbounds float* %567, i64 %564, !dbg !218
  %569 = load float* %568, align 4, !dbg !218
  %570 = fsub float %531, %569, !dbg !218
  %571 = load %struct.Mat** %5, align 8, !dbg !218
  %572 = getelementptr inbounds %struct.Mat* %571, i32 0, i32 2, !dbg !218
  %573 = load i32* %572, align 4, !dbg !218
  %574 = mul nsw i32 0, %573, !dbg !218
  %575 = load %struct.Mat** %5, align 8, !dbg !218
  %576 = getelementptr inbounds %struct.Mat* %575, i32 0, i32 3, !dbg !218
  %577 = load i32* %576, align 4, !dbg !218
  %578 = mul nsw i32 %574, %577, !dbg !218
  %579 = load %struct.Mat** %5, align 8, !dbg !218
  %580 = getelementptr inbounds %struct.Mat* %579, i32 0, i32 4, !dbg !218
  %581 = load i32* %580, align 4, !dbg !218
  %582 = mul nsw i32 %578, %581, !dbg !218
  %583 = load i32* %i, align 4, !dbg !218
  %584 = load %struct.Mat** %5, align 8, !dbg !218
  %585 = getelementptr inbounds %struct.Mat* %584, i32 0, i32 3, !dbg !218
  %586 = load i32* %585, align 4, !dbg !218
  %587 = mul nsw i32 %583, %586, !dbg !218
  %588 = load %struct.Mat** %5, align 8, !dbg !218
  %589 = getelementptr inbounds %struct.Mat* %588, i32 0, i32 4, !dbg !218
  %590 = load i32* %589, align 4, !dbg !218
  %591 = mul nsw i32 %587, %590, !dbg !218
  %592 = add nsw i32 %582, %591, !dbg !218
  %593 = load i32* %j, align 4, !dbg !218
  %594 = add nsw i32 %593, 1, !dbg !218
  %595 = load %struct.Mat** %5, align 8, !dbg !218
  %596 = getelementptr inbounds %struct.Mat* %595, i32 0, i32 4, !dbg !218
  %597 = load i32* %596, align 4, !dbg !218
  %598 = mul nsw i32 %594, %597, !dbg !218
  %599 = add nsw i32 %592, %598, !dbg !218
  %600 = load i32* %k, align 4, !dbg !218
  %601 = sub nsw i32 %600, 1, !dbg !218
  %602 = add nsw i32 %599, %601, !dbg !218
  %603 = sext i32 %602 to i64, !dbg !218
  %604 = load %struct.Mat** %5, align 8, !dbg !218
  %605 = getelementptr inbounds %struct.Mat* %604, i32 0, i32 0, !dbg !218
  %606 = load float** %605, align 8, !dbg !218
  %607 = getelementptr inbounds float* %606, i64 %603, !dbg !218
  %608 = load float* %607, align 4, !dbg !218
  %609 = fsub float %570, %608, !dbg !218
  %610 = load %struct.Mat** %5, align 8, !dbg !218
  %611 = getelementptr inbounds %struct.Mat* %610, i32 0, i32 2, !dbg !218
  %612 = load i32* %611, align 4, !dbg !218
  %613 = mul nsw i32 0, %612, !dbg !218
  %614 = load %struct.Mat** %5, align 8, !dbg !218
  %615 = getelementptr inbounds %struct.Mat* %614, i32 0, i32 3, !dbg !218
  %616 = load i32* %615, align 4, !dbg !218
  %617 = mul nsw i32 %613, %616, !dbg !218
  %618 = load %struct.Mat** %5, align 8, !dbg !218
  %619 = getelementptr inbounds %struct.Mat* %618, i32 0, i32 4, !dbg !218
  %620 = load i32* %619, align 4, !dbg !218
  %621 = mul nsw i32 %617, %620, !dbg !218
  %622 = load i32* %i, align 4, !dbg !218
  %623 = load %struct.Mat** %5, align 8, !dbg !218
  %624 = getelementptr inbounds %struct.Mat* %623, i32 0, i32 3, !dbg !218
  %625 = load i32* %624, align 4, !dbg !218
  %626 = mul nsw i32 %622, %625, !dbg !218
  %627 = load %struct.Mat** %5, align 8, !dbg !218
  %628 = getelementptr inbounds %struct.Mat* %627, i32 0, i32 4, !dbg !218
  %629 = load i32* %628, align 4, !dbg !218
  %630 = mul nsw i32 %626, %629, !dbg !218
  %631 = add nsw i32 %621, %630, !dbg !218
  %632 = load i32* %j, align 4, !dbg !218
  %633 = sub nsw i32 %632, 1, !dbg !218
  %634 = load %struct.Mat** %5, align 8, !dbg !218
  %635 = getelementptr inbounds %struct.Mat* %634, i32 0, i32 4, !dbg !218
  %636 = load i32* %635, align 4, !dbg !218
  %637 = mul nsw i32 %633, %636, !dbg !218
  %638 = add nsw i32 %631, %637, !dbg !218
  %639 = load i32* %k, align 4, !dbg !218
  %640 = sub nsw i32 %639, 1, !dbg !218
  %641 = add nsw i32 %638, %640, !dbg !218
  %642 = sext i32 %641 to i64, !dbg !218
  %643 = load %struct.Mat** %5, align 8, !dbg !218
  %644 = getelementptr inbounds %struct.Mat* %643, i32 0, i32 0, !dbg !218
  %645 = load float** %644, align 8, !dbg !218
  %646 = getelementptr inbounds float* %645, i64 %642, !dbg !218
  %647 = load float* %646, align 4, !dbg !218
  %648 = fadd float %609, %647, !dbg !218
  %649 = fmul float %493, %648, !dbg !218
  %650 = fadd float %457, %649, !dbg !218
  %651 = load %struct.Mat** %3, align 8, !dbg !218
  %652 = getelementptr inbounds %struct.Mat* %651, i32 0, i32 2, !dbg !218
  %653 = load i32* %652, align 4, !dbg !218
  %654 = mul nsw i32 2, %653, !dbg !218
  %655 = load %struct.Mat** %3, align 8, !dbg !218
  %656 = getelementptr inbounds %struct.Mat* %655, i32 0, i32 3, !dbg !218
  %657 = load i32* %656, align 4, !dbg !218
  %658 = mul nsw i32 %654, %657, !dbg !218
  %659 = load %struct.Mat** %3, align 8, !dbg !218
  %660 = getelementptr inbounds %struct.Mat* %659, i32 0, i32 4, !dbg !218
  %661 = load i32* %660, align 4, !dbg !218
  %662 = mul nsw i32 %658, %661, !dbg !218
  %663 = load i32* %i, align 4, !dbg !218
  %664 = load %struct.Mat** %3, align 8, !dbg !218
  %665 = getelementptr inbounds %struct.Mat* %664, i32 0, i32 3, !dbg !218
  %666 = load i32* %665, align 4, !dbg !218
  %667 = mul nsw i32 %663, %666, !dbg !218
  %668 = load %struct.Mat** %3, align 8, !dbg !218
  %669 = getelementptr inbounds %struct.Mat* %668, i32 0, i32 4, !dbg !218
  %670 = load i32* %669, align 4, !dbg !218
  %671 = mul nsw i32 %667, %670, !dbg !218
  %672 = add nsw i32 %662, %671, !dbg !218
  %673 = load i32* %j, align 4, !dbg !218
  %674 = load %struct.Mat** %3, align 8, !dbg !218
  %675 = getelementptr inbounds %struct.Mat* %674, i32 0, i32 4, !dbg !218
  %676 = load i32* %675, align 4, !dbg !218
  %677 = mul nsw i32 %673, %676, !dbg !218
  %678 = add nsw i32 %672, %677, !dbg !218
  %679 = load i32* %k, align 4, !dbg !218
  %680 = add nsw i32 %678, %679, !dbg !218
  %681 = sext i32 %680 to i64, !dbg !218
  %682 = load %struct.Mat** %3, align 8, !dbg !218
  %683 = getelementptr inbounds %struct.Mat* %682, i32 0, i32 0, !dbg !218
  %684 = load float** %683, align 8, !dbg !218
  %685 = getelementptr inbounds float* %684, i64 %681, !dbg !218
  %686 = load float* %685, align 4, !dbg !218
  %687 = load %struct.Mat** %5, align 8, !dbg !218
  %688 = getelementptr inbounds %struct.Mat* %687, i32 0, i32 2, !dbg !218
  %689 = load i32* %688, align 4, !dbg !218
  %690 = mul nsw i32 0, %689, !dbg !218
  %691 = load %struct.Mat** %5, align 8, !dbg !218
  %692 = getelementptr inbounds %struct.Mat* %691, i32 0, i32 3, !dbg !218
  %693 = load i32* %692, align 4, !dbg !218
  %694 = mul nsw i32 %690, %693, !dbg !218
  %695 = load %struct.Mat** %5, align 8, !dbg !218
  %696 = getelementptr inbounds %struct.Mat* %695, i32 0, i32 4, !dbg !218
  %697 = load i32* %696, align 4, !dbg !218
  %698 = mul nsw i32 %694, %697, !dbg !218
  %699 = load i32* %i, align 4, !dbg !218
  %700 = add nsw i32 %699, 1, !dbg !218
  %701 = load %struct.Mat** %5, align 8, !dbg !218
  %702 = getelementptr inbounds %struct.Mat* %701, i32 0, i32 3, !dbg !218
  %703 = load i32* %702, align 4, !dbg !218
  %704 = mul nsw i32 %700, %703, !dbg !218
  %705 = load %struct.Mat** %5, align 8, !dbg !218
  %706 = getelementptr inbounds %struct.Mat* %705, i32 0, i32 4, !dbg !218
  %707 = load i32* %706, align 4, !dbg !218
  %708 = mul nsw i32 %704, %707, !dbg !218
  %709 = add nsw i32 %698, %708, !dbg !218
  %710 = load i32* %j, align 4, !dbg !218
  %711 = load %struct.Mat** %5, align 8, !dbg !218
  %712 = getelementptr inbounds %struct.Mat* %711, i32 0, i32 4, !dbg !218
  %713 = load i32* %712, align 4, !dbg !218
  %714 = mul nsw i32 %710, %713, !dbg !218
  %715 = add nsw i32 %709, %714, !dbg !218
  %716 = load i32* %k, align 4, !dbg !218
  %717 = add nsw i32 %716, 1, !dbg !218
  %718 = add nsw i32 %715, %717, !dbg !218
  %719 = sext i32 %718 to i64, !dbg !218
  %720 = load %struct.Mat** %5, align 8, !dbg !218
  %721 = getelementptr inbounds %struct.Mat* %720, i32 0, i32 0, !dbg !218
  %722 = load float** %721, align 8, !dbg !218
  %723 = getelementptr inbounds float* %722, i64 %719, !dbg !218
  %724 = load float* %723, align 4, !dbg !218
  %725 = load %struct.Mat** %5, align 8, !dbg !218
  %726 = getelementptr inbounds %struct.Mat* %725, i32 0, i32 2, !dbg !218
  %727 = load i32* %726, align 4, !dbg !218
  %728 = mul nsw i32 0, %727, !dbg !218
  %729 = load %struct.Mat** %5, align 8, !dbg !218
  %730 = getelementptr inbounds %struct.Mat* %729, i32 0, i32 3, !dbg !218
  %731 = load i32* %730, align 4, !dbg !218
  %732 = mul nsw i32 %728, %731, !dbg !218
  %733 = load %struct.Mat** %5, align 8, !dbg !218
  %734 = getelementptr inbounds %struct.Mat* %733, i32 0, i32 4, !dbg !218
  %735 = load i32* %734, align 4, !dbg !218
  %736 = mul nsw i32 %732, %735, !dbg !218
  %737 = load i32* %i, align 4, !dbg !218
  %738 = sub nsw i32 %737, 1, !dbg !218
  %739 = load %struct.Mat** %5, align 8, !dbg !218
  %740 = getelementptr inbounds %struct.Mat* %739, i32 0, i32 3, !dbg !218
  %741 = load i32* %740, align 4, !dbg !218
  %742 = mul nsw i32 %738, %741, !dbg !218
  %743 = load %struct.Mat** %5, align 8, !dbg !218
  %744 = getelementptr inbounds %struct.Mat* %743, i32 0, i32 4, !dbg !218
  %745 = load i32* %744, align 4, !dbg !218
  %746 = mul nsw i32 %742, %745, !dbg !218
  %747 = add nsw i32 %736, %746, !dbg !218
  %748 = load i32* %j, align 4, !dbg !218
  %749 = load %struct.Mat** %5, align 8, !dbg !218
  %750 = getelementptr inbounds %struct.Mat* %749, i32 0, i32 4, !dbg !218
  %751 = load i32* %750, align 4, !dbg !218
  %752 = mul nsw i32 %748, %751, !dbg !218
  %753 = add nsw i32 %747, %752, !dbg !218
  %754 = load i32* %k, align 4, !dbg !218
  %755 = add nsw i32 %754, 1, !dbg !218
  %756 = add nsw i32 %753, %755, !dbg !218
  %757 = sext i32 %756 to i64, !dbg !218
  %758 = load %struct.Mat** %5, align 8, !dbg !218
  %759 = getelementptr inbounds %struct.Mat* %758, i32 0, i32 0, !dbg !218
  %760 = load float** %759, align 8, !dbg !218
  %761 = getelementptr inbounds float* %760, i64 %757, !dbg !218
  %762 = load float* %761, align 4, !dbg !218
  %763 = fsub float %724, %762, !dbg !218
  %764 = load %struct.Mat** %5, align 8, !dbg !218
  %765 = getelementptr inbounds %struct.Mat* %764, i32 0, i32 2, !dbg !218
  %766 = load i32* %765, align 4, !dbg !218
  %767 = mul nsw i32 0, %766, !dbg !218
  %768 = load %struct.Mat** %5, align 8, !dbg !218
  %769 = getelementptr inbounds %struct.Mat* %768, i32 0, i32 3, !dbg !218
  %770 = load i32* %769, align 4, !dbg !218
  %771 = mul nsw i32 %767, %770, !dbg !218
  %772 = load %struct.Mat** %5, align 8, !dbg !218
  %773 = getelementptr inbounds %struct.Mat* %772, i32 0, i32 4, !dbg !218
  %774 = load i32* %773, align 4, !dbg !218
  %775 = mul nsw i32 %771, %774, !dbg !218
  %776 = load i32* %i, align 4, !dbg !218
  %777 = add nsw i32 %776, 1, !dbg !218
  %778 = load %struct.Mat** %5, align 8, !dbg !218
  %779 = getelementptr inbounds %struct.Mat* %778, i32 0, i32 3, !dbg !218
  %780 = load i32* %779, align 4, !dbg !218
  %781 = mul nsw i32 %777, %780, !dbg !218
  %782 = load %struct.Mat** %5, align 8, !dbg !218
  %783 = getelementptr inbounds %struct.Mat* %782, i32 0, i32 4, !dbg !218
  %784 = load i32* %783, align 4, !dbg !218
  %785 = mul nsw i32 %781, %784, !dbg !218
  %786 = add nsw i32 %775, %785, !dbg !218
  %787 = load i32* %j, align 4, !dbg !218
  %788 = load %struct.Mat** %5, align 8, !dbg !218
  %789 = getelementptr inbounds %struct.Mat* %788, i32 0, i32 4, !dbg !218
  %790 = load i32* %789, align 4, !dbg !218
  %791 = mul nsw i32 %787, %790, !dbg !218
  %792 = add nsw i32 %786, %791, !dbg !218
  %793 = load i32* %k, align 4, !dbg !218
  %794 = sub nsw i32 %793, 1, !dbg !218
  %795 = add nsw i32 %792, %794, !dbg !218
  %796 = sext i32 %795 to i64, !dbg !218
  %797 = load %struct.Mat** %5, align 8, !dbg !218
  %798 = getelementptr inbounds %struct.Mat* %797, i32 0, i32 0, !dbg !218
  %799 = load float** %798, align 8, !dbg !218
  %800 = getelementptr inbounds float* %799, i64 %796, !dbg !218
  %801 = load float* %800, align 4, !dbg !218
  %802 = fsub float %763, %801, !dbg !218
  %803 = load %struct.Mat** %5, align 8, !dbg !218
  %804 = getelementptr inbounds %struct.Mat* %803, i32 0, i32 2, !dbg !218
  %805 = load i32* %804, align 4, !dbg !218
  %806 = mul nsw i32 0, %805, !dbg !218
  %807 = load %struct.Mat** %5, align 8, !dbg !218
  %808 = getelementptr inbounds %struct.Mat* %807, i32 0, i32 3, !dbg !218
  %809 = load i32* %808, align 4, !dbg !218
  %810 = mul nsw i32 %806, %809, !dbg !218
  %811 = load %struct.Mat** %5, align 8, !dbg !218
  %812 = getelementptr inbounds %struct.Mat* %811, i32 0, i32 4, !dbg !218
  %813 = load i32* %812, align 4, !dbg !218
  %814 = mul nsw i32 %810, %813, !dbg !218
  %815 = load i32* %i, align 4, !dbg !218
  %816 = sub nsw i32 %815, 1, !dbg !218
  %817 = load %struct.Mat** %5, align 8, !dbg !218
  %818 = getelementptr inbounds %struct.Mat* %817, i32 0, i32 3, !dbg !218
  %819 = load i32* %818, align 4, !dbg !218
  %820 = mul nsw i32 %816, %819, !dbg !218
  %821 = load %struct.Mat** %5, align 8, !dbg !218
  %822 = getelementptr inbounds %struct.Mat* %821, i32 0, i32 4, !dbg !218
  %823 = load i32* %822, align 4, !dbg !218
  %824 = mul nsw i32 %820, %823, !dbg !218
  %825 = add nsw i32 %814, %824, !dbg !218
  %826 = load i32* %j, align 4, !dbg !218
  %827 = load %struct.Mat** %5, align 8, !dbg !218
  %828 = getelementptr inbounds %struct.Mat* %827, i32 0, i32 4, !dbg !218
  %829 = load i32* %828, align 4, !dbg !218
  %830 = mul nsw i32 %826, %829, !dbg !218
  %831 = add nsw i32 %825, %830, !dbg !218
  %832 = load i32* %k, align 4, !dbg !218
  %833 = sub nsw i32 %832, 1, !dbg !218
  %834 = add nsw i32 %831, %833, !dbg !218
  %835 = sext i32 %834 to i64, !dbg !218
  %836 = load %struct.Mat** %5, align 8, !dbg !218
  %837 = getelementptr inbounds %struct.Mat* %836, i32 0, i32 0, !dbg !218
  %838 = load float** %837, align 8, !dbg !218
  %839 = getelementptr inbounds float* %838, i64 %835, !dbg !218
  %840 = load float* %839, align 4, !dbg !218
  %841 = fadd float %802, %840, !dbg !218
  %842 = fmul float %686, %841, !dbg !218
  %843 = fadd float %650, %842, !dbg !218
  %844 = load %struct.Mat** %4, align 8, !dbg !218
  %845 = getelementptr inbounds %struct.Mat* %844, i32 0, i32 2, !dbg !218
  %846 = load i32* %845, align 4, !dbg !218
  %847 = mul nsw i32 0, %846, !dbg !218
  %848 = load %struct.Mat** %4, align 8, !dbg !218
  %849 = getelementptr inbounds %struct.Mat* %848, i32 0, i32 3, !dbg !218
  %850 = load i32* %849, align 4, !dbg !218
  %851 = mul nsw i32 %847, %850, !dbg !218
  %852 = load %struct.Mat** %4, align 8, !dbg !218
  %853 = getelementptr inbounds %struct.Mat* %852, i32 0, i32 4, !dbg !218
  %854 = load i32* %853, align 4, !dbg !218
  %855 = mul nsw i32 %851, %854, !dbg !218
  %856 = load i32* %i, align 4, !dbg !218
  %857 = load %struct.Mat** %4, align 8, !dbg !218
  %858 = getelementptr inbounds %struct.Mat* %857, i32 0, i32 3, !dbg !218
  %859 = load i32* %858, align 4, !dbg !218
  %860 = mul nsw i32 %856, %859, !dbg !218
  %861 = load %struct.Mat** %4, align 8, !dbg !218
  %862 = getelementptr inbounds %struct.Mat* %861, i32 0, i32 4, !dbg !218
  %863 = load i32* %862, align 4, !dbg !218
  %864 = mul nsw i32 %860, %863, !dbg !218
  %865 = add nsw i32 %855, %864, !dbg !218
  %866 = load i32* %j, align 4, !dbg !218
  %867 = load %struct.Mat** %4, align 8, !dbg !218
  %868 = getelementptr inbounds %struct.Mat* %867, i32 0, i32 4, !dbg !218
  %869 = load i32* %868, align 4, !dbg !218
  %870 = mul nsw i32 %866, %869, !dbg !218
  %871 = add nsw i32 %865, %870, !dbg !218
  %872 = load i32* %k, align 4, !dbg !218
  %873 = add nsw i32 %871, %872, !dbg !218
  %874 = sext i32 %873 to i64, !dbg !218
  %875 = load %struct.Mat** %4, align 8, !dbg !218
  %876 = getelementptr inbounds %struct.Mat* %875, i32 0, i32 0, !dbg !218
  %877 = load float** %876, align 8, !dbg !218
  %878 = getelementptr inbounds float* %877, i64 %874, !dbg !218
  %879 = load float* %878, align 4, !dbg !218
  %880 = load %struct.Mat** %5, align 8, !dbg !218
  %881 = getelementptr inbounds %struct.Mat* %880, i32 0, i32 2, !dbg !218
  %882 = load i32* %881, align 4, !dbg !218
  %883 = mul nsw i32 0, %882, !dbg !218
  %884 = load %struct.Mat** %5, align 8, !dbg !218
  %885 = getelementptr inbounds %struct.Mat* %884, i32 0, i32 3, !dbg !218
  %886 = load i32* %885, align 4, !dbg !218
  %887 = mul nsw i32 %883, %886, !dbg !218
  %888 = load %struct.Mat** %5, align 8, !dbg !218
  %889 = getelementptr inbounds %struct.Mat* %888, i32 0, i32 4, !dbg !218
  %890 = load i32* %889, align 4, !dbg !218
  %891 = mul nsw i32 %887, %890, !dbg !218
  %892 = load i32* %i, align 4, !dbg !218
  %893 = sub nsw i32 %892, 1, !dbg !218
  %894 = load %struct.Mat** %5, align 8, !dbg !218
  %895 = getelementptr inbounds %struct.Mat* %894, i32 0, i32 3, !dbg !218
  %896 = load i32* %895, align 4, !dbg !218
  %897 = mul nsw i32 %893, %896, !dbg !218
  %898 = load %struct.Mat** %5, align 8, !dbg !218
  %899 = getelementptr inbounds %struct.Mat* %898, i32 0, i32 4, !dbg !218
  %900 = load i32* %899, align 4, !dbg !218
  %901 = mul nsw i32 %897, %900, !dbg !218
  %902 = add nsw i32 %891, %901, !dbg !218
  %903 = load i32* %j, align 4, !dbg !218
  %904 = load %struct.Mat** %5, align 8, !dbg !218
  %905 = getelementptr inbounds %struct.Mat* %904, i32 0, i32 4, !dbg !218
  %906 = load i32* %905, align 4, !dbg !218
  %907 = mul nsw i32 %903, %906, !dbg !218
  %908 = add nsw i32 %902, %907, !dbg !218
  %909 = load i32* %k, align 4, !dbg !218
  %910 = add nsw i32 %908, %909, !dbg !218
  %911 = sext i32 %910 to i64, !dbg !218
  %912 = load %struct.Mat** %5, align 8, !dbg !218
  %913 = getelementptr inbounds %struct.Mat* %912, i32 0, i32 0, !dbg !218
  %914 = load float** %913, align 8, !dbg !218
  %915 = getelementptr inbounds float* %914, i64 %911, !dbg !218
  %916 = load float* %915, align 4, !dbg !218
  %917 = fmul float %879, %916, !dbg !218
  %918 = fadd float %843, %917, !dbg !218
  %919 = load %struct.Mat** %4, align 8, !dbg !218
  %920 = getelementptr inbounds %struct.Mat* %919, i32 0, i32 2, !dbg !218
  %921 = load i32* %920, align 4, !dbg !218
  %922 = mul nsw i32 1, %921, !dbg !218
  %923 = load %struct.Mat** %4, align 8, !dbg !218
  %924 = getelementptr inbounds %struct.Mat* %923, i32 0, i32 3, !dbg !218
  %925 = load i32* %924, align 4, !dbg !218
  %926 = mul nsw i32 %922, %925, !dbg !218
  %927 = load %struct.Mat** %4, align 8, !dbg !218
  %928 = getelementptr inbounds %struct.Mat* %927, i32 0, i32 4, !dbg !218
  %929 = load i32* %928, align 4, !dbg !218
  %930 = mul nsw i32 %926, %929, !dbg !218
  %931 = load i32* %i, align 4, !dbg !218
  %932 = load %struct.Mat** %4, align 8, !dbg !218
  %933 = getelementptr inbounds %struct.Mat* %932, i32 0, i32 3, !dbg !218
  %934 = load i32* %933, align 4, !dbg !218
  %935 = mul nsw i32 %931, %934, !dbg !218
  %936 = load %struct.Mat** %4, align 8, !dbg !218
  %937 = getelementptr inbounds %struct.Mat* %936, i32 0, i32 4, !dbg !218
  %938 = load i32* %937, align 4, !dbg !218
  %939 = mul nsw i32 %935, %938, !dbg !218
  %940 = add nsw i32 %930, %939, !dbg !218
  %941 = load i32* %j, align 4, !dbg !218
  %942 = load %struct.Mat** %4, align 8, !dbg !218
  %943 = getelementptr inbounds %struct.Mat* %942, i32 0, i32 4, !dbg !218
  %944 = load i32* %943, align 4, !dbg !218
  %945 = mul nsw i32 %941, %944, !dbg !218
  %946 = add nsw i32 %940, %945, !dbg !218
  %947 = load i32* %k, align 4, !dbg !218
  %948 = add nsw i32 %946, %947, !dbg !218
  %949 = sext i32 %948 to i64, !dbg !218
  %950 = load %struct.Mat** %4, align 8, !dbg !218
  %951 = getelementptr inbounds %struct.Mat* %950, i32 0, i32 0, !dbg !218
  %952 = load float** %951, align 8, !dbg !218
  %953 = getelementptr inbounds float* %952, i64 %949, !dbg !218
  %954 = load float* %953, align 4, !dbg !218
  %955 = load %struct.Mat** %5, align 8, !dbg !218
  %956 = getelementptr inbounds %struct.Mat* %955, i32 0, i32 2, !dbg !218
  %957 = load i32* %956, align 4, !dbg !218
  %958 = mul nsw i32 0, %957, !dbg !218
  %959 = load %struct.Mat** %5, align 8, !dbg !218
  %960 = getelementptr inbounds %struct.Mat* %959, i32 0, i32 3, !dbg !218
  %961 = load i32* %960, align 4, !dbg !218
  %962 = mul nsw i32 %958, %961, !dbg !218
  %963 = load %struct.Mat** %5, align 8, !dbg !218
  %964 = getelementptr inbounds %struct.Mat* %963, i32 0, i32 4, !dbg !218
  %965 = load i32* %964, align 4, !dbg !218
  %966 = mul nsw i32 %962, %965, !dbg !218
  %967 = load i32* %i, align 4, !dbg !218
  %968 = load %struct.Mat** %5, align 8, !dbg !218
  %969 = getelementptr inbounds %struct.Mat* %968, i32 0, i32 3, !dbg !218
  %970 = load i32* %969, align 4, !dbg !218
  %971 = mul nsw i32 %967, %970, !dbg !218
  %972 = load %struct.Mat** %5, align 8, !dbg !218
  %973 = getelementptr inbounds %struct.Mat* %972, i32 0, i32 4, !dbg !218
  %974 = load i32* %973, align 4, !dbg !218
  %975 = mul nsw i32 %971, %974, !dbg !218
  %976 = add nsw i32 %966, %975, !dbg !218
  %977 = load i32* %j, align 4, !dbg !218
  %978 = sub nsw i32 %977, 1, !dbg !218
  %979 = load %struct.Mat** %5, align 8, !dbg !218
  %980 = getelementptr inbounds %struct.Mat* %979, i32 0, i32 4, !dbg !218
  %981 = load i32* %980, align 4, !dbg !218
  %982 = mul nsw i32 %978, %981, !dbg !218
  %983 = add nsw i32 %976, %982, !dbg !218
  %984 = load i32* %k, align 4, !dbg !218
  %985 = add nsw i32 %983, %984, !dbg !218
  %986 = sext i32 %985 to i64, !dbg !218
  %987 = load %struct.Mat** %5, align 8, !dbg !218
  %988 = getelementptr inbounds %struct.Mat* %987, i32 0, i32 0, !dbg !218
  %989 = load float** %988, align 8, !dbg !218
  %990 = getelementptr inbounds float* %989, i64 %986, !dbg !218
  %991 = load float* %990, align 4, !dbg !218
  %992 = fmul float %954, %991, !dbg !218
  %993 = fadd float %918, %992, !dbg !218
  %994 = load %struct.Mat** %4, align 8, !dbg !218
  %995 = getelementptr inbounds %struct.Mat* %994, i32 0, i32 2, !dbg !218
  %996 = load i32* %995, align 4, !dbg !218
  %997 = mul nsw i32 2, %996, !dbg !218
  %998 = load %struct.Mat** %4, align 8, !dbg !218
  %999 = getelementptr inbounds %struct.Mat* %998, i32 0, i32 3, !dbg !218
  %1000 = load i32* %999, align 4, !dbg !218
  %1001 = mul nsw i32 %997, %1000, !dbg !218
  %1002 = load %struct.Mat** %4, align 8, !dbg !218
  %1003 = getelementptr inbounds %struct.Mat* %1002, i32 0, i32 4, !dbg !218
  %1004 = load i32* %1003, align 4, !dbg !218
  %1005 = mul nsw i32 %1001, %1004, !dbg !218
  %1006 = load i32* %i, align 4, !dbg !218
  %1007 = load %struct.Mat** %4, align 8, !dbg !218
  %1008 = getelementptr inbounds %struct.Mat* %1007, i32 0, i32 3, !dbg !218
  %1009 = load i32* %1008, align 4, !dbg !218
  %1010 = mul nsw i32 %1006, %1009, !dbg !218
  %1011 = load %struct.Mat** %4, align 8, !dbg !218
  %1012 = getelementptr inbounds %struct.Mat* %1011, i32 0, i32 4, !dbg !218
  %1013 = load i32* %1012, align 4, !dbg !218
  %1014 = mul nsw i32 %1010, %1013, !dbg !218
  %1015 = add nsw i32 %1005, %1014, !dbg !218
  %1016 = load i32* %j, align 4, !dbg !218
  %1017 = load %struct.Mat** %4, align 8, !dbg !218
  %1018 = getelementptr inbounds %struct.Mat* %1017, i32 0, i32 4, !dbg !218
  %1019 = load i32* %1018, align 4, !dbg !218
  %1020 = mul nsw i32 %1016, %1019, !dbg !218
  %1021 = add nsw i32 %1015, %1020, !dbg !218
  %1022 = load i32* %k, align 4, !dbg !218
  %1023 = add nsw i32 %1021, %1022, !dbg !218
  %1024 = sext i32 %1023 to i64, !dbg !218
  %1025 = load %struct.Mat** %4, align 8, !dbg !218
  %1026 = getelementptr inbounds %struct.Mat* %1025, i32 0, i32 0, !dbg !218
  %1027 = load float** %1026, align 8, !dbg !218
  %1028 = getelementptr inbounds float* %1027, i64 %1024, !dbg !218
  %1029 = load float* %1028, align 4, !dbg !218
  %1030 = load %struct.Mat** %5, align 8, !dbg !218
  %1031 = getelementptr inbounds %struct.Mat* %1030, i32 0, i32 2, !dbg !218
  %1032 = load i32* %1031, align 4, !dbg !218
  %1033 = mul nsw i32 0, %1032, !dbg !218
  %1034 = load %struct.Mat** %5, align 8, !dbg !218
  %1035 = getelementptr inbounds %struct.Mat* %1034, i32 0, i32 3, !dbg !218
  %1036 = load i32* %1035, align 4, !dbg !218
  %1037 = mul nsw i32 %1033, %1036, !dbg !218
  %1038 = load %struct.Mat** %5, align 8, !dbg !218
  %1039 = getelementptr inbounds %struct.Mat* %1038, i32 0, i32 4, !dbg !218
  %1040 = load i32* %1039, align 4, !dbg !218
  %1041 = mul nsw i32 %1037, %1040, !dbg !218
  %1042 = load i32* %i, align 4, !dbg !218
  %1043 = load %struct.Mat** %5, align 8, !dbg !218
  %1044 = getelementptr inbounds %struct.Mat* %1043, i32 0, i32 3, !dbg !218
  %1045 = load i32* %1044, align 4, !dbg !218
  %1046 = mul nsw i32 %1042, %1045, !dbg !218
  %1047 = load %struct.Mat** %5, align 8, !dbg !218
  %1048 = getelementptr inbounds %struct.Mat* %1047, i32 0, i32 4, !dbg !218
  %1049 = load i32* %1048, align 4, !dbg !218
  %1050 = mul nsw i32 %1046, %1049, !dbg !218
  %1051 = add nsw i32 %1041, %1050, !dbg !218
  %1052 = load i32* %j, align 4, !dbg !218
  %1053 = load %struct.Mat** %5, align 8, !dbg !218
  %1054 = getelementptr inbounds %struct.Mat* %1053, i32 0, i32 4, !dbg !218
  %1055 = load i32* %1054, align 4, !dbg !218
  %1056 = mul nsw i32 %1052, %1055, !dbg !218
  %1057 = add nsw i32 %1051, %1056, !dbg !218
  %1058 = load i32* %k, align 4, !dbg !218
  %1059 = sub nsw i32 %1058, 1, !dbg !218
  %1060 = add nsw i32 %1057, %1059, !dbg !218
  %1061 = sext i32 %1060 to i64, !dbg !218
  %1062 = load %struct.Mat** %5, align 8, !dbg !218
  %1063 = getelementptr inbounds %struct.Mat* %1062, i32 0, i32 0, !dbg !218
  %1064 = load float** %1063, align 8, !dbg !218
  %1065 = getelementptr inbounds float* %1064, i64 %1061, !dbg !218
  %1066 = load float* %1065, align 4, !dbg !218
  %1067 = fmul float %1029, %1066, !dbg !218
  %1068 = fadd float %993, %1067, !dbg !218
  %1069 = load %struct.Mat** %7, align 8, !dbg !218
  %1070 = getelementptr inbounds %struct.Mat* %1069, i32 0, i32 2, !dbg !218
  %1071 = load i32* %1070, align 4, !dbg !218
  %1072 = mul nsw i32 0, %1071, !dbg !218
  %1073 = load %struct.Mat** %7, align 8, !dbg !218
  %1074 = getelementptr inbounds %struct.Mat* %1073, i32 0, i32 3, !dbg !218
  %1075 = load i32* %1074, align 4, !dbg !218
  %1076 = mul nsw i32 %1072, %1075, !dbg !218
  %1077 = load %struct.Mat** %7, align 8, !dbg !218
  %1078 = getelementptr inbounds %struct.Mat* %1077, i32 0, i32 4, !dbg !218
  %1079 = load i32* %1078, align 4, !dbg !218
  %1080 = mul nsw i32 %1076, %1079, !dbg !218
  %1081 = load i32* %i, align 4, !dbg !218
  %1082 = load %struct.Mat** %7, align 8, !dbg !218
  %1083 = getelementptr inbounds %struct.Mat* %1082, i32 0, i32 3, !dbg !218
  %1084 = load i32* %1083, align 4, !dbg !218
  %1085 = mul nsw i32 %1081, %1084, !dbg !218
  %1086 = load %struct.Mat** %7, align 8, !dbg !218
  %1087 = getelementptr inbounds %struct.Mat* %1086, i32 0, i32 4, !dbg !218
  %1088 = load i32* %1087, align 4, !dbg !218
  %1089 = mul nsw i32 %1085, %1088, !dbg !218
  %1090 = add nsw i32 %1080, %1089, !dbg !218
  %1091 = load i32* %j, align 4, !dbg !218
  %1092 = load %struct.Mat** %7, align 8, !dbg !218
  %1093 = getelementptr inbounds %struct.Mat* %1092, i32 0, i32 4, !dbg !218
  %1094 = load i32* %1093, align 4, !dbg !218
  %1095 = mul nsw i32 %1091, %1094, !dbg !218
  %1096 = add nsw i32 %1090, %1095, !dbg !218
  %1097 = load i32* %k, align 4, !dbg !218
  %1098 = add nsw i32 %1096, %1097, !dbg !218
  %1099 = sext i32 %1098 to i64, !dbg !218
  %1100 = load %struct.Mat** %7, align 8, !dbg !218
  %1101 = getelementptr inbounds %struct.Mat* %1100, i32 0, i32 0, !dbg !218
  %1102 = load float** %1101, align 8, !dbg !218
  %1103 = getelementptr inbounds float* %1102, i64 %1099, !dbg !218
  %1104 = load float* %1103, align 4, !dbg !218
  %1105 = fadd float %1068, %1104, !dbg !218
  store float %1105, float* %s0, align 4, !dbg !218
  %1106 = load float* %s0, align 4, !dbg !220
  %1107 = load %struct.Mat** %2, align 8, !dbg !220
  %1108 = getelementptr inbounds %struct.Mat* %1107, i32 0, i32 2, !dbg !220
  %1109 = load i32* %1108, align 4, !dbg !220
  %1110 = mul nsw i32 3, %1109, !dbg !220
  %1111 = load %struct.Mat** %2, align 8, !dbg !220
  %1112 = getelementptr inbounds %struct.Mat* %1111, i32 0, i32 3, !dbg !220
  %1113 = load i32* %1112, align 4, !dbg !220
  %1114 = mul nsw i32 %1110, %1113, !dbg !220
  %1115 = load %struct.Mat** %2, align 8, !dbg !220
  %1116 = getelementptr inbounds %struct.Mat* %1115, i32 0, i32 4, !dbg !220
  %1117 = load i32* %1116, align 4, !dbg !220
  %1118 = mul nsw i32 %1114, %1117, !dbg !220
  %1119 = load i32* %i, align 4, !dbg !220
  %1120 = load %struct.Mat** %2, align 8, !dbg !220
  %1121 = getelementptr inbounds %struct.Mat* %1120, i32 0, i32 3, !dbg !220
  %1122 = load i32* %1121, align 4, !dbg !220
  %1123 = mul nsw i32 %1119, %1122, !dbg !220
  %1124 = load %struct.Mat** %2, align 8, !dbg !220
  %1125 = getelementptr inbounds %struct.Mat* %1124, i32 0, i32 4, !dbg !220
  %1126 = load i32* %1125, align 4, !dbg !220
  %1127 = mul nsw i32 %1123, %1126, !dbg !220
  %1128 = add nsw i32 %1118, %1127, !dbg !220
  %1129 = load i32* %j, align 4, !dbg !220
  %1130 = load %struct.Mat** %2, align 8, !dbg !220
  %1131 = getelementptr inbounds %struct.Mat* %1130, i32 0, i32 4, !dbg !220
  %1132 = load i32* %1131, align 4, !dbg !220
  %1133 = mul nsw i32 %1129, %1132, !dbg !220
  %1134 = add nsw i32 %1128, %1133, !dbg !220
  %1135 = load i32* %k, align 4, !dbg !220
  %1136 = add nsw i32 %1134, %1135, !dbg !220
  %1137 = sext i32 %1136 to i64, !dbg !220
  %1138 = load %struct.Mat** %2, align 8, !dbg !220
  %1139 = getelementptr inbounds %struct.Mat* %1138, i32 0, i32 0, !dbg !220
  %1140 = load float** %1139, align 8, !dbg !220
  %1141 = getelementptr inbounds float* %1140, i64 %1137, !dbg !220
  %1142 = load float* %1141, align 4, !dbg !220
  %1143 = fmul float %1106, %1142, !dbg !220
  %1144 = load %struct.Mat** %5, align 8, !dbg !220
  %1145 = getelementptr inbounds %struct.Mat* %1144, i32 0, i32 2, !dbg !220
  %1146 = load i32* %1145, align 4, !dbg !220
  %1147 = mul nsw i32 0, %1146, !dbg !220
  %1148 = load %struct.Mat** %5, align 8, !dbg !220
  %1149 = getelementptr inbounds %struct.Mat* %1148, i32 0, i32 3, !dbg !220
  %1150 = load i32* %1149, align 4, !dbg !220
  %1151 = mul nsw i32 %1147, %1150, !dbg !220
  %1152 = load %struct.Mat** %5, align 8, !dbg !220
  %1153 = getelementptr inbounds %struct.Mat* %1152, i32 0, i32 4, !dbg !220
  %1154 = load i32* %1153, align 4, !dbg !220
  %1155 = mul nsw i32 %1151, %1154, !dbg !220
  %1156 = load i32* %i, align 4, !dbg !220
  %1157 = load %struct.Mat** %5, align 8, !dbg !220
  %1158 = getelementptr inbounds %struct.Mat* %1157, i32 0, i32 3, !dbg !220
  %1159 = load i32* %1158, align 4, !dbg !220
  %1160 = mul nsw i32 %1156, %1159, !dbg !220
  %1161 = load %struct.Mat** %5, align 8, !dbg !220
  %1162 = getelementptr inbounds %struct.Mat* %1161, i32 0, i32 4, !dbg !220
  %1163 = load i32* %1162, align 4, !dbg !220
  %1164 = mul nsw i32 %1160, %1163, !dbg !220
  %1165 = add nsw i32 %1155, %1164, !dbg !220
  %1166 = load i32* %j, align 4, !dbg !220
  %1167 = load %struct.Mat** %5, align 8, !dbg !220
  %1168 = getelementptr inbounds %struct.Mat* %1167, i32 0, i32 4, !dbg !220
  %1169 = load i32* %1168, align 4, !dbg !220
  %1170 = mul nsw i32 %1166, %1169, !dbg !220
  %1171 = add nsw i32 %1165, %1170, !dbg !220
  %1172 = load i32* %k, align 4, !dbg !220
  %1173 = add nsw i32 %1171, %1172, !dbg !220
  %1174 = sext i32 %1173 to i64, !dbg !220
  %1175 = load %struct.Mat** %5, align 8, !dbg !220
  %1176 = getelementptr inbounds %struct.Mat* %1175, i32 0, i32 0, !dbg !220
  %1177 = load float** %1176, align 8, !dbg !220
  %1178 = getelementptr inbounds float* %1177, i64 %1174, !dbg !220
  %1179 = load float* %1178, align 4, !dbg !220
  %1180 = fsub float %1143, %1179, !dbg !220
  %1181 = load %struct.Mat** %6, align 8, !dbg !220
  %1182 = getelementptr inbounds %struct.Mat* %1181, i32 0, i32 2, !dbg !220
  %1183 = load i32* %1182, align 4, !dbg !220
  %1184 = mul nsw i32 0, %1183, !dbg !220
  %1185 = load %struct.Mat** %6, align 8, !dbg !220
  %1186 = getelementptr inbounds %struct.Mat* %1185, i32 0, i32 3, !dbg !220
  %1187 = load i32* %1186, align 4, !dbg !220
  %1188 = mul nsw i32 %1184, %1187, !dbg !220
  %1189 = load %struct.Mat** %6, align 8, !dbg !220
  %1190 = getelementptr inbounds %struct.Mat* %1189, i32 0, i32 4, !dbg !220
  %1191 = load i32* %1190, align 4, !dbg !220
  %1192 = mul nsw i32 %1188, %1191, !dbg !220
  %1193 = load i32* %i, align 4, !dbg !220
  %1194 = load %struct.Mat** %6, align 8, !dbg !220
  %1195 = getelementptr inbounds %struct.Mat* %1194, i32 0, i32 3, !dbg !220
  %1196 = load i32* %1195, align 4, !dbg !220
  %1197 = mul nsw i32 %1193, %1196, !dbg !220
  %1198 = load %struct.Mat** %6, align 8, !dbg !220
  %1199 = getelementptr inbounds %struct.Mat* %1198, i32 0, i32 4, !dbg !220
  %1200 = load i32* %1199, align 4, !dbg !220
  %1201 = mul nsw i32 %1197, %1200, !dbg !220
  %1202 = add nsw i32 %1192, %1201, !dbg !220
  %1203 = load i32* %j, align 4, !dbg !220
  %1204 = load %struct.Mat** %6, align 8, !dbg !220
  %1205 = getelementptr inbounds %struct.Mat* %1204, i32 0, i32 4, !dbg !220
  %1206 = load i32* %1205, align 4, !dbg !220
  %1207 = mul nsw i32 %1203, %1206, !dbg !220
  %1208 = add nsw i32 %1202, %1207, !dbg !220
  %1209 = load i32* %k, align 4, !dbg !220
  %1210 = add nsw i32 %1208, %1209, !dbg !220
  %1211 = sext i32 %1210 to i64, !dbg !220
  %1212 = load %struct.Mat** %6, align 8, !dbg !220
  %1213 = getelementptr inbounds %struct.Mat* %1212, i32 0, i32 0, !dbg !220
  %1214 = load float** %1213, align 8, !dbg !220
  %1215 = getelementptr inbounds float* %1214, i64 %1211, !dbg !220
  %1216 = load float* %1215, align 4, !dbg !220
  %1217 = fmul float %1180, %1216, !dbg !220
  store float %1217, float* %ss, align 4, !dbg !220
  %1218 = load float* %ss, align 4, !dbg !221
  %1219 = load float* %ss, align 4, !dbg !221
  %1220 = fmul float %1218, %1219, !dbg !221
  %1221 = load float* %gosa, align 4, !dbg !221
  %1222 = fadd float %1221, %1220, !dbg !221
  store float %1222, float* %gosa, align 4, !dbg !221
  %1223 = load %struct.Mat** %5, align 8, !dbg !222
  %1224 = getelementptr inbounds %struct.Mat* %1223, i32 0, i32 2, !dbg !222
  %1225 = load i32* %1224, align 4, !dbg !222
  %1226 = mul nsw i32 0, %1225, !dbg !222
  %1227 = load %struct.Mat** %5, align 8, !dbg !222
  %1228 = getelementptr inbounds %struct.Mat* %1227, i32 0, i32 3, !dbg !222
  %1229 = load i32* %1228, align 4, !dbg !222
  %1230 = mul nsw i32 %1226, %1229, !dbg !222
  %1231 = load %struct.Mat** %5, align 8, !dbg !222
  %1232 = getelementptr inbounds %struct.Mat* %1231, i32 0, i32 4, !dbg !222
  %1233 = load i32* %1232, align 4, !dbg !222
  %1234 = mul nsw i32 %1230, %1233, !dbg !222
  %1235 = load i32* %i, align 4, !dbg !222
  %1236 = load %struct.Mat** %5, align 8, !dbg !222
  %1237 = getelementptr inbounds %struct.Mat* %1236, i32 0, i32 3, !dbg !222
  %1238 = load i32* %1237, align 4, !dbg !222
  %1239 = mul nsw i32 %1235, %1238, !dbg !222
  %1240 = load %struct.Mat** %5, align 8, !dbg !222
  %1241 = getelementptr inbounds %struct.Mat* %1240, i32 0, i32 4, !dbg !222
  %1242 = load i32* %1241, align 4, !dbg !222
  %1243 = mul nsw i32 %1239, %1242, !dbg !222
  %1244 = add nsw i32 %1234, %1243, !dbg !222
  %1245 = load i32* %j, align 4, !dbg !222
  %1246 = load %struct.Mat** %5, align 8, !dbg !222
  %1247 = getelementptr inbounds %struct.Mat* %1246, i32 0, i32 4, !dbg !222
  %1248 = load i32* %1247, align 4, !dbg !222
  %1249 = mul nsw i32 %1245, %1248, !dbg !222
  %1250 = add nsw i32 %1244, %1249, !dbg !222
  %1251 = load i32* %k, align 4, !dbg !222
  %1252 = add nsw i32 %1250, %1251, !dbg !222
  %1253 = sext i32 %1252 to i64, !dbg !222
  %1254 = load %struct.Mat** %5, align 8, !dbg !222
  %1255 = getelementptr inbounds %struct.Mat* %1254, i32 0, i32 0, !dbg !222
  %1256 = load float** %1255, align 8, !dbg !222
  %1257 = getelementptr inbounds float* %1256, i64 %1253, !dbg !222
  %1258 = load float* %1257, align 4, !dbg !222
  %1259 = load float* @omega, align 4, !dbg !222
  %1260 = load float* %ss, align 4, !dbg !222
  %1261 = fmul float %1259, %1260, !dbg !222
  %1262 = fadd float %1258, %1261, !dbg !222
  %1263 = load %struct.Mat** %8, align 8, !dbg !222
  %1264 = getelementptr inbounds %struct.Mat* %1263, i32 0, i32 2, !dbg !222
  %1265 = load i32* %1264, align 4, !dbg !222
  %1266 = mul nsw i32 0, %1265, !dbg !222
  %1267 = load %struct.Mat** %8, align 8, !dbg !222
  %1268 = getelementptr inbounds %struct.Mat* %1267, i32 0, i32 3, !dbg !222
  %1269 = load i32* %1268, align 4, !dbg !222
  %1270 = mul nsw i32 %1266, %1269, !dbg !222
  %1271 = load %struct.Mat** %8, align 8, !dbg !222
  %1272 = getelementptr inbounds %struct.Mat* %1271, i32 0, i32 4, !dbg !222
  %1273 = load i32* %1272, align 4, !dbg !222
  %1274 = mul nsw i32 %1270, %1273, !dbg !222
  %1275 = load i32* %i, align 4, !dbg !222
  %1276 = load %struct.Mat** %8, align 8, !dbg !222
  %1277 = getelementptr inbounds %struct.Mat* %1276, i32 0, i32 3, !dbg !222
  %1278 = load i32* %1277, align 4, !dbg !222
  %1279 = mul nsw i32 %1275, %1278, !dbg !222
  %1280 = load %struct.Mat** %8, align 8, !dbg !222
  %1281 = getelementptr inbounds %struct.Mat* %1280, i32 0, i32 4, !dbg !222
  %1282 = load i32* %1281, align 4, !dbg !222
  %1283 = mul nsw i32 %1279, %1282, !dbg !222
  %1284 = add nsw i32 %1274, %1283, !dbg !222
  %1285 = load i32* %j, align 4, !dbg !222
  %1286 = load %struct.Mat** %8, align 8, !dbg !222
  %1287 = getelementptr inbounds %struct.Mat* %1286, i32 0, i32 4, !dbg !222
  %1288 = load i32* %1287, align 4, !dbg !222
  %1289 = mul nsw i32 %1285, %1288, !dbg !222
  %1290 = add nsw i32 %1284, %1289, !dbg !222
  %1291 = load i32* %k, align 4, !dbg !222
  %1292 = add nsw i32 %1290, %1291, !dbg !222
  %1293 = sext i32 %1292 to i64, !dbg !222
  %1294 = load %struct.Mat** %8, align 8, !dbg !222
  %1295 = getelementptr inbounds %struct.Mat* %1294, i32 0, i32 0, !dbg !222
  %1296 = load float** %1295, align 8, !dbg !222
  %1297 = getelementptr inbounds float* %1296, i64 %1293, !dbg !222
  store float %1262, float* %1297, align 4, !dbg !222
  br label %1298, !dbg !223

; <label>:1298                                    ; preds = %40
  %1299 = load i32* %k, align 4, !dbg !216
  %1300 = add nsw i32 %1299, 1, !dbg !216
  store i32 %1300, i32* %k, align 4, !dbg !216
  br label %36, !dbg !216

; <label>:1301                                    ; preds = %36
  br label %1302, !dbg !224

; <label>:1302                                    ; preds = %1301
  %1303 = load i32* %j, align 4, !dbg !214
  %1304 = add nsw i32 %1303, 1, !dbg !214
  store i32 %1304, i32* %j, align 4, !dbg !214
  br label %31, !dbg !214

; <label>:1305                                    ; preds = %31
  br label %1306, !dbg !225

; <label>:1306                                    ; preds = %1305
  %1307 = load i32* %i, align 4, !dbg !212
  %1308 = add nsw i32 %1307, 1, !dbg !212
  store i32 %1308, i32* %i, align 4, !dbg !212
  br label %26, !dbg !212

; <label>:1309                                    ; preds = %26
  store i32 1, i32* %i, align 4, !dbg !226
  br label %1310, !dbg !226

; <label>:1310                                    ; preds = %1404, %1309
  %1311 = load i32* %i, align 4, !dbg !226
  %1312 = load i32* %imax, align 4, !dbg !226
  %1313 = icmp slt i32 %1311, %1312, !dbg !226
  br i1 %1313, label %1314, label %1407, !dbg !226

; <label>:1314                                    ; preds = %1310
  store i32 1, i32* %j, align 4, !dbg !228
  br label %1315, !dbg !228

; <label>:1315                                    ; preds = %1400, %1314
  %1316 = load i32* %j, align 4, !dbg !228
  %1317 = load i32* %jmax, align 4, !dbg !228
  %1318 = icmp slt i32 %1316, %1317, !dbg !228
  br i1 %1318, label %1319, label %1403, !dbg !228

; <label>:1319                                    ; preds = %1315
  store i32 1, i32* %k, align 4, !dbg !230
  br label %1320, !dbg !230

; <label>:1320                                    ; preds = %1396, %1319
  %1321 = load i32* %k, align 4, !dbg !230
  %1322 = load i32* %kmax, align 4, !dbg !230
  %1323 = icmp slt i32 %1321, %1322, !dbg !230
  br i1 %1323, label %1324, label %1399, !dbg !230

; <label>:1324                                    ; preds = %1320
  %1325 = load %struct.Mat** %8, align 8, !dbg !232
  %1326 = getelementptr inbounds %struct.Mat* %1325, i32 0, i32 2, !dbg !232
  %1327 = load i32* %1326, align 4, !dbg !232
  %1328 = mul nsw i32 0, %1327, !dbg !232
  %1329 = load %struct.Mat** %8, align 8, !dbg !232
  %1330 = getelementptr inbounds %struct.Mat* %1329, i32 0, i32 3, !dbg !232
  %1331 = load i32* %1330, align 4, !dbg !232
  %1332 = mul nsw i32 %1328, %1331, !dbg !232
  %1333 = load %struct.Mat** %8, align 8, !dbg !232
  %1334 = getelementptr inbounds %struct.Mat* %1333, i32 0, i32 4, !dbg !232
  %1335 = load i32* %1334, align 4, !dbg !232
  %1336 = mul nsw i32 %1332, %1335, !dbg !232
  %1337 = load i32* %i, align 4, !dbg !232
  %1338 = load %struct.Mat** %8, align 8, !dbg !232
  %1339 = getelementptr inbounds %struct.Mat* %1338, i32 0, i32 3, !dbg !232
  %1340 = load i32* %1339, align 4, !dbg !232
  %1341 = mul nsw i32 %1337, %1340, !dbg !232
  %1342 = load %struct.Mat** %8, align 8, !dbg !232
  %1343 = getelementptr inbounds %struct.Mat* %1342, i32 0, i32 4, !dbg !232
  %1344 = load i32* %1343, align 4, !dbg !232
  %1345 = mul nsw i32 %1341, %1344, !dbg !232
  %1346 = add nsw i32 %1336, %1345, !dbg !232
  %1347 = load i32* %j, align 4, !dbg !232
  %1348 = load %struct.Mat** %8, align 8, !dbg !232
  %1349 = getelementptr inbounds %struct.Mat* %1348, i32 0, i32 4, !dbg !232
  %1350 = load i32* %1349, align 4, !dbg !232
  %1351 = mul nsw i32 %1347, %1350, !dbg !232
  %1352 = add nsw i32 %1346, %1351, !dbg !232
  %1353 = load i32* %k, align 4, !dbg !232
  %1354 = add nsw i32 %1352, %1353, !dbg !232
  %1355 = sext i32 %1354 to i64, !dbg !232
  %1356 = load %struct.Mat** %8, align 8, !dbg !232
  %1357 = getelementptr inbounds %struct.Mat* %1356, i32 0, i32 0, !dbg !232
  %1358 = load float** %1357, align 8, !dbg !232
  %1359 = getelementptr inbounds float* %1358, i64 %1355, !dbg !232
  %1360 = load float* %1359, align 4, !dbg !232
  %1361 = load %struct.Mat** %5, align 8, !dbg !232
  %1362 = getelementptr inbounds %struct.Mat* %1361, i32 0, i32 2, !dbg !232
  %1363 = load i32* %1362, align 4, !dbg !232
  %1364 = mul nsw i32 0, %1363, !dbg !232
  %1365 = load %struct.Mat** %5, align 8, !dbg !232
  %1366 = getelementptr inbounds %struct.Mat* %1365, i32 0, i32 3, !dbg !232
  %1367 = load i32* %1366, align 4, !dbg !232
  %1368 = mul nsw i32 %1364, %1367, !dbg !232
  %1369 = load %struct.Mat** %5, align 8, !dbg !232
  %1370 = getelementptr inbounds %struct.Mat* %1369, i32 0, i32 4, !dbg !232
  %1371 = load i32* %1370, align 4, !dbg !232
  %1372 = mul nsw i32 %1368, %1371, !dbg !232
  %1373 = load i32* %i, align 4, !dbg !232
  %1374 = load %struct.Mat** %5, align 8, !dbg !232
  %1375 = getelementptr inbounds %struct.Mat* %1374, i32 0, i32 3, !dbg !232
  %1376 = load i32* %1375, align 4, !dbg !232
  %1377 = mul nsw i32 %1373, %1376, !dbg !232
  %1378 = load %struct.Mat** %5, align 8, !dbg !232
  %1379 = getelementptr inbounds %struct.Mat* %1378, i32 0, i32 4, !dbg !232
  %1380 = load i32* %1379, align 4, !dbg !232
  %1381 = mul nsw i32 %1377, %1380, !dbg !232
  %1382 = add nsw i32 %1372, %1381, !dbg !232
  %1383 = load i32* %j, align 4, !dbg !232
  %1384 = load %struct.Mat** %5, align 8, !dbg !232
  %1385 = getelementptr inbounds %struct.Mat* %1384, i32 0, i32 4, !dbg !232
  %1386 = load i32* %1385, align 4, !dbg !232
  %1387 = mul nsw i32 %1383, %1386, !dbg !232
  %1388 = add nsw i32 %1382, %1387, !dbg !232
  %1389 = load i32* %k, align 4, !dbg !232
  %1390 = add nsw i32 %1388, %1389, !dbg !232
  %1391 = sext i32 %1390 to i64, !dbg !232
  %1392 = load %struct.Mat** %5, align 8, !dbg !232
  %1393 = getelementptr inbounds %struct.Mat* %1392, i32 0, i32 0, !dbg !232
  %1394 = load float** %1393, align 8, !dbg !232
  %1395 = getelementptr inbounds float* %1394, i64 %1391, !dbg !232
  store float %1360, float* %1395, align 4, !dbg !232
  br label %1396, !dbg !232

; <label>:1396                                    ; preds = %1324
  %1397 = load i32* %k, align 4, !dbg !230
  %1398 = add nsw i32 %1397, 1, !dbg !230
  store i32 %1398, i32* %k, align 4, !dbg !230
  br label %1320, !dbg !230

; <label>:1399                                    ; preds = %1320
  br label %1400, !dbg !232

; <label>:1400                                    ; preds = %1399
  %1401 = load i32* %j, align 4, !dbg !228
  %1402 = add nsw i32 %1401, 1, !dbg !228
  store i32 %1402, i32* %j, align 4, !dbg !228
  br label %1315, !dbg !228

; <label>:1403                                    ; preds = %1315
  br label %1404, !dbg !233

; <label>:1404                                    ; preds = %1403
  %1405 = load i32* %i, align 4, !dbg !226
  %1406 = add nsw i32 %1405, 1, !dbg !226
  store i32 %1406, i32* %i, align 4, !dbg !226
  br label %1310, !dbg !226

; <label>:1407                                    ; preds = %1310
  br label %1408, !dbg !234

; <label>:1408                                    ; preds = %1407
  %1409 = load i32* %n, align 4, !dbg !208
  %1410 = add nsw i32 %1409, 1, !dbg !208
  store i32 %1410, i32* %n, align 4, !dbg !208
  br label %21, !dbg !208

; <label>:1411                                    ; preds = %21
  %1412 = load float* %gosa, align 4, !dbg !235
  ret float %1412, !dbg !235
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* %Mat) #0 {
  %1 = alloca %struct.Mat*, align 8
  store %struct.Mat* %Mat, %struct.Mat** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Mat** %1}, metadata !236), !dbg !237
  %2 = load %struct.Mat** %1, align 8, !dbg !238
  %3 = getelementptr inbounds %struct.Mat* %2, i32 0, i32 0, !dbg !238
  %4 = load float** %3, align 8, !dbg !238
  %5 = icmp ne float* %4, null, !dbg !238
  br i1 %5, label %6, label %11, !dbg !238

; <label>:6                                       ; preds = %0
  %7 = load %struct.Mat** %1, align 8, !dbg !240
  %8 = getelementptr inbounds %struct.Mat* %7, i32 0, i32 0, !dbg !240
  %9 = load float** %8, align 8, !dbg !240
  %10 = bitcast float* %9 to i8*, !dbg !240
  call void @free(i8* %10) #5, !dbg !240
  br label %11, !dbg !240

; <label>:11                                      ; preds = %6, %0
  %12 = load %struct.Mat** %1, align 8, !dbg !241
  %13 = getelementptr inbounds %struct.Mat* %12, i32 0, i32 0, !dbg !241
  store float* null, float** %13, align 8, !dbg !241
  %14 = load %struct.Mat** %1, align 8, !dbg !242
  %15 = getelementptr inbounds %struct.Mat* %14, i32 0, i32 1, !dbg !242
  store i32 0, i32* %15, align 4, !dbg !242
  %16 = load %struct.Mat** %1, align 8, !dbg !243
  %17 = getelementptr inbounds %struct.Mat* %16, i32 0, i32 3, !dbg !243
  store i32 0, i32* %17, align 4, !dbg !243
  %18 = load %struct.Mat** %1, align 8, !dbg !244
  %19 = getelementptr inbounds %struct.Mat* %18, i32 0, i32 2, !dbg !244
  store i32 0, i32* %19, align 4, !dbg !244
  %20 = load %struct.Mat** %1, align 8, !dbg !245
  %21 = getelementptr inbounds %struct.Mat* %20, i32 0, i32 4, !dbg !245
  store i32 0, i32* %21, align 4, !dbg !245
  ret void, !dbg !246
}

; Function Attrs: nounwind uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %mx, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !247), !dbg !248
  store i32 %my, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !249), !dbg !248
  store i32 %mz, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !250), !dbg !248
  %4 = load i32* %3, align 4, !dbg !251
  %5 = sub nsw i32 %4, 2, !dbg !251
  %6 = sitofp i32 %5 to double, !dbg !251
  %7 = load i32* %2, align 4, !dbg !251
  %8 = sub nsw i32 %7, 2, !dbg !251
  %9 = sitofp i32 %8 to double, !dbg !251
  %10 = fmul double %6, %9, !dbg !251
  %11 = load i32* %1, align 4, !dbg !251
  %12 = sub nsw i32 %11, 2, !dbg !251
  %13 = sitofp i32 %12 to double, !dbg !251
  %14 = fmul double %10, %13, !dbg !251
  %15 = fmul double %14, 3.400000e+01, !dbg !251
  ret double %15, !dbg !251
}

; Function Attrs: nounwind uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store i32 %nn, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !252), !dbg !253
  store double %cpu, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !254), !dbg !253
  store double %flop, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !255), !dbg !253
  %4 = load double* %3, align 8, !dbg !256
  %5 = load double* %2, align 8, !dbg !256
  %6 = fdiv double %4, %5, !dbg !256
  %7 = fmul double %6, 1.000000e-06, !dbg !256
  %8 = load i32* %1, align 4, !dbg !256
  %9 = sitofp i32 %8 to double, !dbg !256
  %10 = fmul double %7, %9, !dbg !256
  ret double %10, !dbg !256
}

; Function Attrs: nounwind uwtable
define void @set_param(i32* %is, i8* %size) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i8*, align 8
  store i32* %is, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !257), !dbg !258
  store i8* %size, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !259), !dbg !258
  %3 = load i8** %2, align 8, !dbg !260
  %4 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !260
  %5 = icmp ne i32 %4, 0, !dbg !260
  br i1 %5, label %6, label %10, !dbg !260

; <label>:6                                       ; preds = %0
  %7 = load i8** %2, align 8, !dbg !260
  %8 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0)), !dbg !260
  %9 = icmp ne i32 %8, 0, !dbg !260
  br i1 %9, label %17, label %10, !dbg !260

; <label>:10                                      ; preds = %6, %0
  %11 = load i32** %1, align 8, !dbg !262
  %12 = getelementptr inbounds i32* %11, i64 0, !dbg !262
  store i32 32, i32* %12, align 4, !dbg !262
  %13 = load i32** %1, align 8, !dbg !264
  %14 = getelementptr inbounds i32* %13, i64 1, !dbg !264
  store i32 32, i32* %14, align 4, !dbg !264
  %15 = load i32** %1, align 8, !dbg !265
  %16 = getelementptr inbounds i32* %15, i64 2, !dbg !265
  store i32 64, i32* %16, align 4, !dbg !265
  br label %79, !dbg !266

; <label>:17                                      ; preds = %6
  %18 = load i8** %2, align 8, !dbg !267
  %19 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0)), !dbg !267
  %20 = icmp ne i32 %19, 0, !dbg !267
  br i1 %20, label %21, label %25, !dbg !267

; <label>:21                                      ; preds = %17
  %22 = load i8** %2, align 8, !dbg !267
  %23 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0)), !dbg !267
  %24 = icmp ne i32 %23, 0, !dbg !267
  br i1 %24, label %32, label %25, !dbg !267

; <label>:25                                      ; preds = %21, %17
  %26 = load i32** %1, align 8, !dbg !269
  %27 = getelementptr inbounds i32* %26, i64 0, !dbg !269
  store i32 64, i32* %27, align 4, !dbg !269
  %28 = load i32** %1, align 8, !dbg !271
  %29 = getelementptr inbounds i32* %28, i64 1, !dbg !271
  store i32 64, i32* %29, align 4, !dbg !271
  %30 = load i32** %1, align 8, !dbg !272
  %31 = getelementptr inbounds i32* %30, i64 2, !dbg !272
  store i32 128, i32* %31, align 4, !dbg !272
  br label %79, !dbg !273

; <label>:32                                      ; preds = %21
  %33 = load i8** %2, align 8, !dbg !274
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0)), !dbg !274
  %35 = icmp ne i32 %34, 0, !dbg !274
  br i1 %35, label %36, label %40, !dbg !274

; <label>:36                                      ; preds = %32
  %37 = load i8** %2, align 8, !dbg !274
  %38 = call i32 @strcmp(i8* %37, i8* getelementptr inbounds ([2 x i8]* @.str9, i32 0, i32 0)), !dbg !274
  %39 = icmp ne i32 %38, 0, !dbg !274
  br i1 %39, label %47, label %40, !dbg !274

; <label>:40                                      ; preds = %36, %32
  %41 = load i32** %1, align 8, !dbg !276
  %42 = getelementptr inbounds i32* %41, i64 0, !dbg !276
  store i32 128, i32* %42, align 4, !dbg !276
  %43 = load i32** %1, align 8, !dbg !278
  %44 = getelementptr inbounds i32* %43, i64 1, !dbg !278
  store i32 128, i32* %44, align 4, !dbg !278
  %45 = load i32** %1, align 8, !dbg !279
  %46 = getelementptr inbounds i32* %45, i64 2, !dbg !279
  store i32 256, i32* %46, align 4, !dbg !279
  br label %79, !dbg !280

; <label>:47                                      ; preds = %36
  %48 = load i8** %2, align 8, !dbg !281
  %49 = call i32 @strcmp(i8* %48, i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !dbg !281
  %50 = icmp ne i32 %49, 0, !dbg !281
  br i1 %50, label %51, label %55, !dbg !281

; <label>:51                                      ; preds = %47
  %52 = load i8** %2, align 8, !dbg !281
  %53 = call i32 @strcmp(i8* %52, i8* getelementptr inbounds ([2 x i8]* @.str11, i32 0, i32 0)), !dbg !281
  %54 = icmp ne i32 %53, 0, !dbg !281
  br i1 %54, label %62, label %55, !dbg !281

; <label>:55                                      ; preds = %51, %47
  %56 = load i32** %1, align 8, !dbg !283
  %57 = getelementptr inbounds i32* %56, i64 0, !dbg !283
  store i32 256, i32* %57, align 4, !dbg !283
  %58 = load i32** %1, align 8, !dbg !285
  %59 = getelementptr inbounds i32* %58, i64 1, !dbg !285
  store i32 256, i32* %59, align 4, !dbg !285
  %60 = load i32** %1, align 8, !dbg !286
  %61 = getelementptr inbounds i32* %60, i64 2, !dbg !286
  store i32 512, i32* %61, align 4, !dbg !286
  br label %79, !dbg !287

; <label>:62                                      ; preds = %51
  %63 = load i8** %2, align 8, !dbg !288
  %64 = call i32 @strcmp(i8* %63, i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0)), !dbg !288
  %65 = icmp ne i32 %64, 0, !dbg !288
  br i1 %65, label %66, label %70, !dbg !288

; <label>:66                                      ; preds = %62
  %67 = load i8** %2, align 8, !dbg !288
  %68 = call i32 @strcmp(i8* %67, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0)), !dbg !288
  %69 = icmp ne i32 %68, 0, !dbg !288
  br i1 %69, label %77, label %70, !dbg !288

; <label>:70                                      ; preds = %66, %62
  %71 = load i32** %1, align 8, !dbg !290
  %72 = getelementptr inbounds i32* %71, i64 0, !dbg !290
  store i32 512, i32* %72, align 4, !dbg !290
  %73 = load i32** %1, align 8, !dbg !292
  %74 = getelementptr inbounds i32* %73, i64 1, !dbg !292
  store i32 512, i32* %74, align 4, !dbg !292
  %75 = load i32** %1, align 8, !dbg !293
  %76 = getelementptr inbounds i32* %75, i64 2, !dbg !293
  store i32 1024, i32* %76, align 4, !dbg !293
  br label %79, !dbg !294

; <label>:77                                      ; preds = %66
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0)), !dbg !295
  call void @exit(i32 6) #6, !dbg !297
  unreachable, !dbg !297

; <label>:79                                      ; preds = %70, %55, %40, %25, %10
  ret void, !dbg !298
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare void @free(i8*) #4

; Function Attrs: nounwind uwtable
define double @second() #0 {
  %tm = alloca %struct.timeval, align 8
  %t = alloca double, align 8
  call void @llvm.dbg.declare(metadata !{%struct.timeval* %tm}, metadata !299), !dbg !309
  call void @llvm.dbg.declare(metadata !{double* %t}, metadata !310), !dbg !311
  %1 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #5, !dbg !312
  %2 = load i32* @second.base_sec, align 4, !dbg !313
  %3 = icmp eq i32 %2, 0, !dbg !313
  br i1 %3, label %4, label %14, !dbg !313

; <label>:4                                       ; preds = %0
  %5 = load i32* @second.base_usec, align 4, !dbg !313
  %6 = icmp eq i32 %5, 0, !dbg !313
  br i1 %6, label %7, label %14, !dbg !313

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0, !dbg !315
  %9 = load i64* %8, align 8, !dbg !315
  %10 = trunc i64 %9 to i32, !dbg !315
  store i32 %10, i32* @second.base_sec, align 4, !dbg !315
  %11 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1, !dbg !317
  %12 = load i64* %11, align 8, !dbg !317
  %13 = trunc i64 %12 to i32, !dbg !317
  store i32 %13, i32* @second.base_usec, align 4, !dbg !317
  store double 0.000000e+00, double* %t, align 8, !dbg !318
  br label %29, !dbg !319

; <label>:14                                      ; preds = %4, %0
  %15 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 0, !dbg !320
  %16 = load i64* %15, align 8, !dbg !320
  %17 = load i32* @second.base_sec, align 4, !dbg !320
  %18 = sext i32 %17 to i64, !dbg !320
  %19 = sub nsw i64 %16, %18, !dbg !320
  %20 = sitofp i64 %19 to double, !dbg !320
  %21 = getelementptr inbounds %struct.timeval* %tm, i32 0, i32 1, !dbg !320
  %22 = load i64* %21, align 8, !dbg !320
  %23 = load i32* @second.base_usec, align 4, !dbg !320
  %24 = sext i32 %23 to i64, !dbg !320
  %25 = sub nsw i64 %22, %24, !dbg !320
  %26 = sitofp i64 %25 to double, !dbg !320
  %27 = fdiv double %26, 1.000000e+06, !dbg !320
  %28 = fadd double %20, %27, !dbg !320
  store double %28, double* %t, align 8, !dbg !320
  br label %29

; <label>:29                                      ; preds = %14, %7
  %30 = load double* %t, align 8, !dbg !322
  ret double %30, !dbg !322
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!61, !62}
!llvm.ident = !{!63}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !50, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"himenobmtxpa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !16, metadata !19, metadata !23, metadata !37, metadata !40, metadata !43, metadata !44, metadata !47}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 71, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 72} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fflop", metadata !"fflop", metadata !"", i32 144, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, i32, i32)* @fflop, null, null, metadata !2, i32 145} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [fflop]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !8, metadata !8, metadata !8}
!15 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mflops", metadata !"mflops", metadata !"", i32 150, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (i32, double, double)* @mflops, null, null, metadata !2, i32 151} ; [ DW_TAG_subprogram ] [line 150] [def] [scope 151] [mflops]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !15, metadata !8, metadata !15, metadata !15}
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"set_param", metadata !"set_param", metadata !"", i32 156, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i8*)* @set_param, null, null, metadata !2, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [set_param]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{null, metadata !22, metadata !10}
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"newMat", metadata !"newMat", metadata !"", i32 194, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (%struct.Mat*, i32, i32, i32, i32)* @newMat, null, null, metadata !2, i32 195} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [newMat]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !26, metadata !8, metadata !8, metadata !8, metadata !8}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Matrix]
!27 = metadata !{i32 786454, metadata !1, null, metadata !"Matrix", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ] [Matrix] [line 54, size 0, align 0, offset 0] [from Mat]
!28 = metadata !{i32 786451, metadata !1, null, metadata !"Mat", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Mat] [line 45, size 192, align 64, offset 0] [def] [from ]
!29 = metadata !{metadata !30, metadata !33, metadata !34, metadata !35, metadata !36}
!30 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"m", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ] [m] [line 46, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!32 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!33 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"mnums", i32 47, i64 32, i64 32, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [mnums] [line 47, size 32, align 32, offset 64] [from int]
!34 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"mrows", i32 48, i64 32, i64 32, i64 96, i32 0, metadata !8} ; [ DW_TAG_member ] [mrows] [line 48, size 32, align 32, offset 96] [from int]
!35 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"mcols", i32 49, i64 32, i64 32, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [mcols] [line 49, size 32, align 32, offset 128] [from int]
!36 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"mdeps", i32 50, i64 32, i64 32, i64 160, i32 0, metadata !8} ; [ DW_TAG_member ] [mdeps] [line 50, size 32, align 32, offset 160] [from int]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"clearMat", metadata !"clearMat", metadata !"", i32 208, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Mat*)* @clearMat, null, null, metadata !2, i32 209} ; [ DW_TAG_subprogram ] [line 208] [def] [scope 209] [clearMat]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !26}
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set", metadata !"mat_set", metadata !"", i32 220, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Mat*, i32, float)* @mat_set, null, null, metadata !2, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [mat_set]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{null, metadata !26, metadata !8, metadata !32}
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set_init", metadata !"mat_set_init", metadata !"", i32 231, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Mat*)* @mat_set_init, null, null, metadata !2, i32 232} ; [ DW_TAG_subprogram ] [line 231] [def] [scope 232] [mat_set_init]
!44 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"jacobi", metadata !"jacobi", metadata !"", i32 244, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, float (i32, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*)* @jacobi, null, null, metadata !2, i32 246} ; [ DW_TAG_subprogram ] [line 244] [def] [scope 246] [jacobi]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{metadata !32, metadata !8, metadata !26, metadata !26, metadata !26, metadata !26, metadata !26, metadata !26, metadata !26}
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"second", metadata !"second", metadata !"", i32 294, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, double ()* @second, null, null, metadata !2, i32 295} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [second]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !15}
!50 = metadata !{metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59, metadata !60}
!51 = metadata !{i32 786484, i32 0, null, metadata !"omega", metadata !"omega", metadata !"", metadata !5, i32 67, metadata !32, i32 0, i32 1, float* @omega, null} ; [ DW_TAG_variable ] [omega] [line 67] [def]
!52 = metadata !{i32 786484, i32 0, metadata !47, metadata !"base_sec", metadata !"base_sec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_sec, null} ; [ DW_TAG_variable ] [base_sec] [line 300] [local] [def]
!53 = metadata !{i32 786484, i32 0, metadata !47, metadata !"base_usec", metadata !"base_usec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_usec, null} ; [ DW_TAG_variable ] [base_usec] [line 300] [local] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"a", metadata !"a", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @a, null} ; [ DW_TAG_variable ] [a] [line 68] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"b", metadata !"b", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @b, null} ; [ DW_TAG_variable ] [b] [line 68] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @c, null} ; [ DW_TAG_variable ] [c] [line 68] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @p, null} ; [ DW_TAG_variable ] [p] [line 68] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"bnd", metadata !"bnd", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @bnd, null} ; [ DW_TAG_variable ] [bnd] [line 68] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"wrk1", metadata !"wrk1", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @wrk1, null} ; [ DW_TAG_variable ] [wrk1] [line 68] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"wrk2", metadata !"wrk2", metadata !"", metadata !5, i32 68, metadata !27, i32 0, i32 1, %struct.Mat* @wrk2, null} ; [ DW_TAG_variable ] [wrk2] [line 68] [def]
!61 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!62 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!63 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!64 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777287, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 71]
!65 = metadata !{i32 71, i32 0, metadata !4, null}
!66 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554503, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 71]
!67 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 73]
!68 = metadata !{i32 73, i32 0, metadata !4, null}
!69 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 73]
!70 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 73]
!71 = metadata !{i32 786688, metadata !4, metadata !"nn", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nn] [line 73]
!72 = metadata !{i32 786688, metadata !4, metadata !"imax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 74]
!73 = metadata !{i32 74, i32 0, metadata !4, null}
!74 = metadata !{i32 786688, metadata !4, metadata !"jmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 74]
!75 = metadata !{i32 786688, metadata !4, metadata !"kmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 74]
!76 = metadata !{i32 786688, metadata !4, metadata !"mimax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mimax] [line 74]
!77 = metadata !{i32 786688, metadata !4, metadata !"mjmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mjmax] [line 74]
!78 = metadata !{i32 786688, metadata !4, metadata !"mkmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mkmax] [line 74]
!79 = metadata !{i32 786688, metadata !4, metadata !"msize", metadata !5, i32 74, metadata !80, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msize] [line 74]
!80 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !8, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!83 = metadata !{i32 786688, metadata !4, metadata !"gosa", metadata !5, i32 75, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 75]
!84 = metadata !{i32 75, i32 0, metadata !4, null}
!85 = metadata !{i32 786688, metadata !4, metadata !"cpu0", metadata !5, i32 76, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu0] [line 76]
!86 = metadata !{i32 76, i32 0, metadata !4, null}
!87 = metadata !{i32 786688, metadata !4, metadata !"cpu1", metadata !5, i32 76, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu1] [line 76]
!88 = metadata !{i32 786688, metadata !4, metadata !"cpu", metadata !5, i32 76, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu] [line 76]
!89 = metadata !{i32 786688, metadata !4, metadata !"flop", metadata !5, i32 76, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flop] [line 76]
!90 = metadata !{i32 79, i32 0, metadata !4, null}
!91 = metadata !{i32 80, i32 0, metadata !4, null}
!92 = metadata !{i32 81, i32 0, metadata !4, null}
!93 = metadata !{i32 83, i32 0, metadata !4, null}
!94 = metadata !{i32 84, i32 0, metadata !4, null}
!95 = metadata !{i32 85, i32 0, metadata !4, null}
!96 = metadata !{i32 86, i32 0, metadata !4, null}
!97 = metadata !{i32 87, i32 0, metadata !4, null}
!98 = metadata !{i32 88, i32 0, metadata !4, null}
!99 = metadata !{i32 90, i32 0, metadata !4, null}
!100 = metadata !{i32 91, i32 0, metadata !4, null}
!101 = metadata !{i32 96, i32 0, metadata !4, null}
!102 = metadata !{i32 97, i32 0, metadata !4, null}
!103 = metadata !{i32 98, i32 0, metadata !4, null}
!104 = metadata !{i32 99, i32 0, metadata !4, null}
!105 = metadata !{i32 100, i32 0, metadata !4, null}
!106 = metadata !{i32 101, i32 0, metadata !4, null}
!107 = metadata !{i32 102, i32 0, metadata !4, null}
!108 = metadata !{i32 104, i32 0, metadata !4, null}
!109 = metadata !{i32 105, i32 0, metadata !4, null}
!110 = metadata !{i32 106, i32 0, metadata !4, null}
!111 = metadata !{i32 107, i32 0, metadata !4, null}
!112 = metadata !{i32 108, i32 0, metadata !4, null}
!113 = metadata !{i32 109, i32 0, metadata !4, null}
!114 = metadata !{i32 110, i32 0, metadata !4, null}
!115 = metadata !{i32 111, i32 0, metadata !4, null}
!116 = metadata !{i32 112, i32 0, metadata !4, null}
!117 = metadata !{i32 113, i32 0, metadata !4, null}
!118 = metadata !{i32 114, i32 0, metadata !4, null}
!119 = metadata !{i32 115, i32 0, metadata !4, null}
!120 = metadata !{i32 116, i32 0, metadata !4, null}
!121 = metadata !{i32 117, i32 0, metadata !4, null}
!122 = metadata !{i32 122, i32 0, metadata !4, null}
!123 = metadata !{i32 124, i32 0, metadata !4, null}
!124 = metadata !{i32 126, i32 0, metadata !4, null}
!125 = metadata !{i32 127, i32 0, metadata !4, null}
!126 = metadata !{i32 132, i32 0, metadata !4, null}
!127 = metadata !{i32 133, i32 0, metadata !4, null}
!128 = metadata !{i32 134, i32 0, metadata !4, null}
!129 = metadata !{i32 135, i32 0, metadata !4, null}
!130 = metadata !{i32 136, i32 0, metadata !4, null}
!131 = metadata !{i32 137, i32 0, metadata !4, null}
!132 = metadata !{i32 138, i32 0, metadata !4, null}
!133 = metadata !{i32 140, i32 0, metadata !4, null}
!134 = metadata !{i32 786689, metadata !23, metadata !"Mat", metadata !5, i32 16777410, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!135 = metadata !{i32 194, i32 0, metadata !23, null}
!136 = metadata !{i32 786689, metadata !23, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!137 = metadata !{i32 786689, metadata !23, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!138 = metadata !{i32 786689, metadata !23, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!139 = metadata !{i32 786689, metadata !23, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!140 = metadata !{i32 196, i32 0, metadata !23, null}
!141 = metadata !{i32 197, i32 0, metadata !23, null}
!142 = metadata !{i32 198, i32 0, metadata !23, null}
!143 = metadata !{i32 199, i32 0, metadata !23, null}
!144 = metadata !{i32 200, i32 0, metadata !23, null}
!145 = metadata !{i32 202, i32 0, metadata !23, null}
!146 = metadata !{i32 204, i32 0, metadata !23, null}
!147 = metadata !{i32 786689, metadata !43, metadata !"Mat", metadata !5, i32 16777447, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!148 = metadata !{i32 231, i32 0, metadata !43, null}
!149 = metadata !{i32 786688, metadata !43, metadata !"i", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 233]
!150 = metadata !{i32 233, i32 0, metadata !43, null}
!151 = metadata !{i32 786688, metadata !43, metadata !"j", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 233]
!152 = metadata !{i32 786688, metadata !43, metadata !"k", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 233]
!153 = metadata !{i32 786688, metadata !43, metadata !"l", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 233]
!154 = metadata !{i32 786688, metadata !43, metadata !"tt", metadata !5, i32 234, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tt] [line 234]
!155 = metadata !{i32 234, i32 0, metadata !43, null}
!156 = metadata !{i32 236, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !43, i32 236, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!158 = metadata !{i32 237, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !157, i32 237, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!160 = metadata !{i32 238, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !159, i32 238, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!162 = metadata !{i32 239, i32 0, metadata !161, null}
!163 = metadata !{i32 240, i32 0, metadata !161, null}
!164 = metadata !{i32 240, i32 0, metadata !159, null}
!165 = metadata !{i32 241, i32 0, metadata !43, null}
!166 = metadata !{i32 786689, metadata !40, metadata !"Mat", metadata !5, i32 16777436, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!167 = metadata !{i32 220, i32 0, metadata !40, null}
!168 = metadata !{i32 786689, metadata !40, metadata !"l", metadata !5, i32 33554652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 220]
!169 = metadata !{i32 786689, metadata !40, metadata !"val", metadata !5, i32 50331868, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 220]
!170 = metadata !{i32 786688, metadata !40, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 222]
!171 = metadata !{i32 222, i32 0, metadata !40, null}
!172 = metadata !{i32 786688, metadata !40, metadata !"j", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 222]
!173 = metadata !{i32 786688, metadata !40, metadata !"k", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 222]
!174 = metadata !{i32 224, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !40, i32 224, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!176 = metadata !{i32 225, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !175, i32 225, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!178 = metadata !{i32 226, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !177, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!180 = metadata !{i32 227, i32 0, metadata !179, null}
!181 = metadata !{i32 227, i32 0, metadata !177, null}
!182 = metadata !{i32 228, i32 0, metadata !40, null}
!183 = metadata !{i32 786689, metadata !44, metadata !"nn", metadata !5, i32 16777460, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 244]
!184 = metadata !{i32 244, i32 0, metadata !44, null}
!185 = metadata !{i32 786689, metadata !44, metadata !"a", metadata !5, i32 33554676, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 244]
!186 = metadata !{i32 786689, metadata !44, metadata !"b", metadata !5, i32 50331892, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 244]
!187 = metadata !{i32 786689, metadata !44, metadata !"c", metadata !5, i32 67109108, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 244]
!188 = metadata !{i32 786689, metadata !44, metadata !"p", metadata !5, i32 83886325, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 245]
!189 = metadata !{i32 245, i32 0, metadata !44, null}
!190 = metadata !{i32 786689, metadata !44, metadata !"bnd", metadata !5, i32 100663541, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bnd] [line 245]
!191 = metadata !{i32 786689, metadata !44, metadata !"wrk1", metadata !5, i32 117440757, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk1] [line 245]
!192 = metadata !{i32 786689, metadata !44, metadata !"wrk2", metadata !5, i32 134217973, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk2] [line 245]
!193 = metadata !{i32 786688, metadata !44, metadata !"i", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 247]
!194 = metadata !{i32 247, i32 0, metadata !44, null}
!195 = metadata !{i32 786688, metadata !44, metadata !"j", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 247]
!196 = metadata !{i32 786688, metadata !44, metadata !"k", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 247]
!197 = metadata !{i32 786688, metadata !44, metadata !"n", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 247]
!198 = metadata !{i32 786688, metadata !44, metadata !"imax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 247]
!199 = metadata !{i32 786688, metadata !44, metadata !"jmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 247]
!200 = metadata !{i32 786688, metadata !44, metadata !"kmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 247]
!201 = metadata !{i32 786688, metadata !44, metadata !"gosa", metadata !5, i32 248, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 248]
!202 = metadata !{i32 248, i32 0, metadata !44, null}
!203 = metadata !{i32 786688, metadata !44, metadata !"s0", metadata !5, i32 248, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s0] [line 248]
!204 = metadata !{i32 786688, metadata !44, metadata !"ss", metadata !5, i32 248, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ss] [line 248]
!205 = metadata !{i32 250, i32 0, metadata !44, null}
!206 = metadata !{i32 251, i32 0, metadata !44, null}
!207 = metadata !{i32 252, i32 0, metadata !44, null}
!208 = metadata !{i32 254, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !44, i32 254, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!210 = metadata !{i32 255, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !209, i32 254, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!212 = metadata !{i32 257, i32 0, metadata !213, null}
!213 = metadata !{i32 786443, metadata !1, metadata !211, i32 257, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!214 = metadata !{i32 258, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !213, i32 258, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!216 = metadata !{i32 259, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !215, i32 259, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!218 = metadata !{i32 260, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !217, i32 259, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!220 = metadata !{i32 277, i32 0, metadata !219, null}
!221 = metadata !{i32 279, i32 0, metadata !219, null}
!222 = metadata !{i32 280, i32 0, metadata !219, null}
!223 = metadata !{i32 281, i32 0, metadata !219, null}
!224 = metadata !{i32 281, i32 0, metadata !217, null}
!225 = metadata !{i32 281, i32 0, metadata !215, null}
!226 = metadata !{i32 283, i32 0, metadata !227, null}
!227 = metadata !{i32 786443, metadata !1, metadata !211, i32 283, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!228 = metadata !{i32 284, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !227, i32 284, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!230 = metadata !{i32 285, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !229, i32 285, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!232 = metadata !{i32 286, i32 0, metadata !231, null}
!233 = metadata !{i32 286, i32 0, metadata !229, null}
!234 = metadata !{i32 288, i32 0, metadata !211, null}
!235 = metadata !{i32 290, i32 0, metadata !44, null}
!236 = metadata !{i32 786689, metadata !37, metadata !"Mat", metadata !5, i32 16777424, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!237 = metadata !{i32 208, i32 0, metadata !37, null}
!238 = metadata !{i32 210, i32 0, metadata !239, null}
!239 = metadata !{i32 786443, metadata !1, metadata !37, i32 210, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!240 = metadata !{i32 211, i32 0, metadata !239, null}
!241 = metadata !{i32 212, i32 0, metadata !37, null}
!242 = metadata !{i32 213, i32 0, metadata !37, null}
!243 = metadata !{i32 214, i32 0, metadata !37, null}
!244 = metadata !{i32 215, i32 0, metadata !37, null}
!245 = metadata !{i32 216, i32 0, metadata !37, null}
!246 = metadata !{i32 217, i32 0, metadata !37, null}
!247 = metadata !{i32 786689, metadata !12, metadata !"mx", metadata !5, i32 16777360, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mx] [line 144]
!248 = metadata !{i32 144, i32 0, metadata !12, null}
!249 = metadata !{i32 786689, metadata !12, metadata !"my", metadata !5, i32 33554576, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [my] [line 144]
!250 = metadata !{i32 786689, metadata !12, metadata !"mz", metadata !5, i32 50331792, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mz] [line 144]
!251 = metadata !{i32 146, i32 0, metadata !12, null}
!252 = metadata !{i32 786689, metadata !16, metadata !"nn", metadata !5, i32 16777366, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 150]
!253 = metadata !{i32 150, i32 0, metadata !16, null}
!254 = metadata !{i32 786689, metadata !16, metadata !"cpu", metadata !5, i32 33554582, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cpu] [line 150]
!255 = metadata !{i32 786689, metadata !16, metadata !"flop", metadata !5, i32 50331798, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flop] [line 150]
!256 = metadata !{i32 152, i32 0, metadata !16, null}
!257 = metadata !{i32 786689, metadata !19, metadata !"is", metadata !5, i32 16777372, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [is] [line 156]
!258 = metadata !{i32 156, i32 0, metadata !19, null}
!259 = metadata !{i32 786689, metadata !19, metadata !"size", metadata !5, i32 33554588, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 156]
!260 = metadata !{i32 158, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !1, metadata !19, i32 158, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!262 = metadata !{i32 159, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !1, metadata !261, i32 158, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!264 = metadata !{i32 160, i32 0, metadata !263, null}
!265 = metadata !{i32 161, i32 0, metadata !263, null}
!266 = metadata !{i32 162, i32 0, metadata !263, null}
!267 = metadata !{i32 164, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !19, i32 164, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!269 = metadata !{i32 165, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !268, i32 164, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!271 = metadata !{i32 166, i32 0, metadata !270, null}
!272 = metadata !{i32 167, i32 0, metadata !270, null}
!273 = metadata !{i32 168, i32 0, metadata !270, null}
!274 = metadata !{i32 170, i32 0, metadata !275, null}
!275 = metadata !{i32 786443, metadata !1, metadata !19, i32 170, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!276 = metadata !{i32 171, i32 0, metadata !277, null}
!277 = metadata !{i32 786443, metadata !1, metadata !275, i32 170, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!278 = metadata !{i32 172, i32 0, metadata !277, null}
!279 = metadata !{i32 173, i32 0, metadata !277, null}
!280 = metadata !{i32 174, i32 0, metadata !277, null}
!281 = metadata !{i32 176, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !19, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!283 = metadata !{i32 177, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !282, i32 176, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!285 = metadata !{i32 178, i32 0, metadata !284, null}
!286 = metadata !{i32 179, i32 0, metadata !284, null}
!287 = metadata !{i32 180, i32 0, metadata !284, null}
!288 = metadata !{i32 182, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !19, i32 182, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!290 = metadata !{i32 183, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !289, i32 182, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!292 = metadata !{i32 184, i32 0, metadata !291, null}
!293 = metadata !{i32 185, i32 0, metadata !291, null}
!294 = metadata !{i32 186, i32 0, metadata !291, null}
!295 = metadata !{i32 188, i32 0, metadata !296, null}
!296 = metadata !{i32 786443, metadata !1, metadata !289, i32 187, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!297 = metadata !{i32 189, i32 0, metadata !296, null}
!298 = metadata !{i32 191, i32 0, metadata !19, null}
!299 = metadata !{i32 786688, metadata !47, metadata !"tm", metadata !5, i32 297, metadata !300, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tm] [line 297]
!300 = metadata !{i32 786451, metadata !301, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !302, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!301 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!302 = metadata !{metadata !303, metadata !307}
!303 = metadata !{i32 786445, metadata !301, metadata !300, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !304} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!304 = metadata !{i32 786454, metadata !305, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !306} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!305 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!306 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!307 = metadata !{i32 786445, metadata !301, metadata !300, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !308} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!308 = metadata !{i32 786454, metadata !305, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !306} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!309 = metadata !{i32 297, i32 0, metadata !47, null}
!310 = metadata !{i32 786688, metadata !47, metadata !"t", metadata !5, i32 298, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 298]
!311 = metadata !{i32 298, i32 0, metadata !47, null}
!312 = metadata !{i32 302, i32 0, metadata !47, null}
!313 = metadata !{i32 304, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !47, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!315 = metadata !{i32 306, i32 0, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !314, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!317 = metadata !{i32 307, i32 0, metadata !316, null}
!318 = metadata !{i32 308, i32 0, metadata !316, null}
!319 = metadata !{i32 309, i32 0, metadata !316, null}
!320 = metadata !{i32 310, i32 0, metadata !321, null}
!321 = metadata !{i32 786443, metadata !1, metadata !314, i32 309, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!322 = metadata !{i32 314, i32 0, metadata !47, null}
