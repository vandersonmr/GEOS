; ModuleID = 'Random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Random_struct = type { [17 x i32], i32, i32, i32, i32, double, double, double }

@dm1 = internal global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define %struct.Random_struct* @new_Random_seed(i32 %seed) #0 {
  %1 = alloca i32, align 4
  %R = alloca %struct.Random_struct*, align 8
  store i32 %seed, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !54), !dbg !55
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %R}, metadata !56), !dbg !57
  %2 = call noalias i8* @malloc(i64 112) #3, !dbg !57
  %3 = bitcast i8* %2 to %struct.Random_struct*, !dbg !57
  store %struct.Random_struct* %3, %struct.Random_struct** %R, align 8, !dbg !57
  %4 = load %struct.Random_struct** %R, align 8, !dbg !58
  %5 = load i32* %1, align 4, !dbg !58
  call void @initialize(%struct.Random_struct* %4, i32 %5), !dbg !58
  %6 = load %struct.Random_struct** %R, align 8, !dbg !59
  %7 = getelementptr inbounds %struct.Random_struct* %6, i32 0, i32 5, !dbg !59
  store double 0.000000e+00, double* %7, align 8, !dbg !59
  %8 = load %struct.Random_struct** %R, align 8, !dbg !60
  %9 = getelementptr inbounds %struct.Random_struct* %8, i32 0, i32 6, !dbg !60
  store double 1.000000e+00, double* %9, align 8, !dbg !60
  %10 = load %struct.Random_struct** %R, align 8, !dbg !61
  %11 = getelementptr inbounds %struct.Random_struct* %10, i32 0, i32 7, !dbg !61
  store double 1.000000e+00, double* %11, align 8, !dbg !61
  %12 = load %struct.Random_struct** %R, align 8, !dbg !62
  %13 = getelementptr inbounds %struct.Random_struct* %12, i32 0, i32 4, !dbg !62
  store i32 0, i32* %13, align 4, !dbg !62
  %14 = load %struct.Random_struct** %R, align 8, !dbg !63
  ret %struct.Random_struct* %14, !dbg !63
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define internal void @initialize(%struct.Random_struct* %R, i32 %seed) #0 {
  %1 = alloca %struct.Random_struct*, align 8
  %2 = alloca i32, align 4
  %jseed = alloca i32, align 4
  %k0 = alloca i32, align 4
  %k1 = alloca i32, align 4
  %j0 = alloca i32, align 4
  %j1 = alloca i32, align 4
  %iloop = alloca i32, align 4
  store %struct.Random_struct* %R, %struct.Random_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %1}, metadata !64), !dbg !65
  store i32 %seed, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !66), !dbg !65
  call void @llvm.dbg.declare(metadata !{i32* %jseed}, metadata !67), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %k0}, metadata !69), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %k1}, metadata !70), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %j0}, metadata !71), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %j1}, metadata !72), !dbg !68
  call void @llvm.dbg.declare(metadata !{i32* %iloop}, metadata !73), !dbg !68
  store double 0x3E00000000200000, double* @dm1, align 8, !dbg !74
  %3 = load i32* %2, align 4, !dbg !75
  %4 = load %struct.Random_struct** %1, align 8, !dbg !75
  %5 = getelementptr inbounds %struct.Random_struct* %4, i32 0, i32 1, !dbg !75
  store i32 %3, i32* %5, align 4, !dbg !75
  %6 = load i32* %2, align 4, !dbg !76
  %7 = icmp slt i32 %6, 0, !dbg !76
  br i1 %7, label %8, label %11, !dbg !76

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !76
  %10 = sub nsw i32 0, %9, !dbg !76
  store i32 %10, i32* %2, align 4, !dbg !76
  br label %11, !dbg !76

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %2, align 4, !dbg !78
  %13 = icmp slt i32 %12, 2147483647, !dbg !78
  br i1 %13, label %14, label %16, !dbg !78

; <label>:14                                      ; preds = %11
  %15 = load i32* %2, align 4, !dbg !78
  br label %17, !dbg !78

; <label>:16                                      ; preds = %11
  br label %17, !dbg !78

; <label>:17                                      ; preds = %16, %14
  %18 = phi i32 [ %15, %14 ], [ 2147483647, %16 ], !dbg !78
  store i32 %18, i32* %jseed, align 4, !dbg !78
  %19 = load i32* %jseed, align 4, !dbg !79
  %20 = srem i32 %19, 2, !dbg !79
  %21 = icmp eq i32 %20, 0, !dbg !79
  br i1 %21, label %22, label %25, !dbg !79

; <label>:22                                      ; preds = %17
  %23 = load i32* %jseed, align 4, !dbg !79
  %24 = add nsw i32 %23, -1, !dbg !79
  store i32 %24, i32* %jseed, align 4, !dbg !79
  br label %25, !dbg !79

; <label>:25                                      ; preds = %22, %17
  store i32 9069, i32* %k0, align 4, !dbg !81
  store i32 0, i32* %k1, align 4, !dbg !82
  %26 = load i32* %jseed, align 4, !dbg !83
  %27 = srem i32 %26, 65536, !dbg !83
  store i32 %27, i32* %j0, align 4, !dbg !83
  %28 = load i32* %jseed, align 4, !dbg !84
  %29 = sdiv i32 %28, 65536, !dbg !84
  store i32 %29, i32* %j1, align 4, !dbg !84
  store i32 0, i32* %iloop, align 4, !dbg !85
  br label %30, !dbg !85

; <label>:30                                      ; preds = %59, %25
  %31 = load i32* %iloop, align 4, !dbg !85
  %32 = icmp slt i32 %31, 17, !dbg !85
  br i1 %32, label %33, label %62, !dbg !85

; <label>:33                                      ; preds = %30
  %34 = load i32* %j0, align 4, !dbg !87
  %35 = load i32* %k0, align 4, !dbg !87
  %36 = mul nsw i32 %34, %35, !dbg !87
  store i32 %36, i32* %jseed, align 4, !dbg !87
  %37 = load i32* %jseed, align 4, !dbg !89
  %38 = sdiv i32 %37, 65536, !dbg !89
  %39 = load i32* %j0, align 4, !dbg !89
  %40 = load i32* %k1, align 4, !dbg !89
  %41 = mul nsw i32 %39, %40, !dbg !89
  %42 = add nsw i32 %38, %41, !dbg !89
  %43 = load i32* %j1, align 4, !dbg !89
  %44 = load i32* %k0, align 4, !dbg !89
  %45 = mul nsw i32 %43, %44, !dbg !89
  %46 = add nsw i32 %42, %45, !dbg !89
  %47 = srem i32 %46, 32768, !dbg !89
  store i32 %47, i32* %j1, align 4, !dbg !89
  %48 = load i32* %jseed, align 4, !dbg !90
  %49 = srem i32 %48, 65536, !dbg !90
  store i32 %49, i32* %j0, align 4, !dbg !90
  %50 = load i32* %j0, align 4, !dbg !91
  %51 = load i32* %j1, align 4, !dbg !91
  %52 = mul nsw i32 65536, %51, !dbg !91
  %53 = add nsw i32 %50, %52, !dbg !91
  %54 = load i32* %iloop, align 4, !dbg !91
  %55 = sext i32 %54 to i64, !dbg !91
  %56 = load %struct.Random_struct** %1, align 8, !dbg !91
  %57 = getelementptr inbounds %struct.Random_struct* %56, i32 0, i32 0, !dbg !91
  %58 = getelementptr inbounds [17 x i32]* %57, i32 0, i64 %55, !dbg !91
  store i32 %53, i32* %58, align 4, !dbg !91
  br label %59, !dbg !92

; <label>:59                                      ; preds = %33
  %60 = load i32* %iloop, align 4, !dbg !85
  %61 = add nsw i32 %60, 1, !dbg !85
  store i32 %61, i32* %iloop, align 4, !dbg !85
  br label %30, !dbg !85

; <label>:62                                      ; preds = %30
  %63 = load %struct.Random_struct** %1, align 8, !dbg !93
  %64 = getelementptr inbounds %struct.Random_struct* %63, i32 0, i32 2, !dbg !93
  store i32 4, i32* %64, align 4, !dbg !93
  %65 = load %struct.Random_struct** %1, align 8, !dbg !94
  %66 = getelementptr inbounds %struct.Random_struct* %65, i32 0, i32 3, !dbg !94
  store i32 16, i32* %66, align 4, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nounwind uwtable
define %struct.Random_struct* @new_Random(i32 %seed, double %left, double %right) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %R = alloca %struct.Random_struct*, align 8
  store i32 %seed, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !96), !dbg !97
  store double %left, double* %2, align 8
  call void @llvm.dbg.declare(metadata !{double* %2}, metadata !98), !dbg !97
  store double %right, double* %3, align 8
  call void @llvm.dbg.declare(metadata !{double* %3}, metadata !99), !dbg !97
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %R}, metadata !100), !dbg !101
  %4 = call noalias i8* @malloc(i64 112) #3, !dbg !101
  %5 = bitcast i8* %4 to %struct.Random_struct*, !dbg !101
  store %struct.Random_struct* %5, %struct.Random_struct** %R, align 8, !dbg !101
  %6 = load %struct.Random_struct** %R, align 8, !dbg !102
  %7 = load i32* %1, align 4, !dbg !102
  call void @initialize(%struct.Random_struct* %6, i32 %7), !dbg !102
  %8 = load double* %2, align 8, !dbg !103
  %9 = load %struct.Random_struct** %R, align 8, !dbg !103
  %10 = getelementptr inbounds %struct.Random_struct* %9, i32 0, i32 5, !dbg !103
  store double %8, double* %10, align 8, !dbg !103
  %11 = load double* %3, align 8, !dbg !104
  %12 = load %struct.Random_struct** %R, align 8, !dbg !104
  %13 = getelementptr inbounds %struct.Random_struct* %12, i32 0, i32 6, !dbg !104
  store double %11, double* %13, align 8, !dbg !104
  %14 = load double* %3, align 8, !dbg !105
  %15 = load double* %2, align 8, !dbg !105
  %16 = fsub double %14, %15, !dbg !105
  %17 = load %struct.Random_struct** %R, align 8, !dbg !105
  %18 = getelementptr inbounds %struct.Random_struct* %17, i32 0, i32 7, !dbg !105
  store double %16, double* %18, align 8, !dbg !105
  %19 = load %struct.Random_struct** %R, align 8, !dbg !106
  %20 = getelementptr inbounds %struct.Random_struct* %19, i32 0, i32 4, !dbg !106
  store i32 1, i32* %20, align 4, !dbg !106
  %21 = load %struct.Random_struct** %R, align 8, !dbg !107
  ret %struct.Random_struct* %21, !dbg !107
}

; Function Attrs: nounwind uwtable
define void @Random_delete(%struct.Random_struct* %R) #0 {
  %1 = alloca %struct.Random_struct*, align 8
  store %struct.Random_struct* %R, %struct.Random_struct** %1, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %1}, metadata !108), !dbg !109
  %2 = load %struct.Random_struct** %1, align 8, !dbg !110
  %3 = bitcast %struct.Random_struct* %2 to i8*, !dbg !110
  call void @free(i8* %3) #3, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define double @Random_nextDouble(%struct.Random_struct* %R) #0 {
  %1 = alloca double, align 8
  %2 = alloca %struct.Random_struct*, align 8
  %k = alloca i32, align 4
  %I = alloca i32, align 4
  %J = alloca i32, align 4
  %m = alloca i32*, align 8
  store %struct.Random_struct* %R, %struct.Random_struct** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %2}, metadata !112), !dbg !113
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !114), !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %I}, metadata !116), !dbg !117
  %3 = load %struct.Random_struct** %2, align 8, !dbg !117
  %4 = getelementptr inbounds %struct.Random_struct* %3, i32 0, i32 2, !dbg !117
  %5 = load i32* %4, align 4, !dbg !117
  store i32 %5, i32* %I, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata !{i32* %J}, metadata !118), !dbg !119
  %6 = load %struct.Random_struct** %2, align 8, !dbg !119
  %7 = getelementptr inbounds %struct.Random_struct* %6, i32 0, i32 3, !dbg !119
  %8 = load i32* %7, align 4, !dbg !119
  store i32 %8, i32* %J, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata !{i32** %m}, metadata !120), !dbg !122
  %9 = load %struct.Random_struct** %2, align 8, !dbg !122
  %10 = getelementptr inbounds %struct.Random_struct* %9, i32 0, i32 0, !dbg !122
  %11 = getelementptr inbounds [17 x i32]* %10, i32 0, i32 0, !dbg !122
  store i32* %11, i32** %m, align 8, !dbg !122
  %12 = load i32* %I, align 4, !dbg !123
  %13 = sext i32 %12 to i64, !dbg !123
  %14 = load i32** %m, align 8, !dbg !123
  %15 = getelementptr inbounds i32* %14, i64 %13, !dbg !123
  %16 = load i32* %15, align 4, !dbg !123
  %17 = load i32* %J, align 4, !dbg !123
  %18 = sext i32 %17 to i64, !dbg !123
  %19 = load i32** %m, align 8, !dbg !123
  %20 = getelementptr inbounds i32* %19, i64 %18, !dbg !123
  %21 = load i32* %20, align 4, !dbg !123
  %22 = sub nsw i32 %16, %21, !dbg !123
  store i32 %22, i32* %k, align 4, !dbg !123
  %23 = load i32* %k, align 4, !dbg !124
  %24 = icmp slt i32 %23, 0, !dbg !124
  br i1 %24, label %25, label %28, !dbg !124

; <label>:25                                      ; preds = %0
  %26 = load i32* %k, align 4, !dbg !124
  %27 = add nsw i32 %26, 2147483647, !dbg !124
  store i32 %27, i32* %k, align 4, !dbg !124
  br label %28, !dbg !124

; <label>:28                                      ; preds = %25, %0
  %29 = load i32* %k, align 4, !dbg !126
  %30 = load i32* %J, align 4, !dbg !126
  %31 = sext i32 %30 to i64, !dbg !126
  %32 = load %struct.Random_struct** %2, align 8, !dbg !126
  %33 = getelementptr inbounds %struct.Random_struct* %32, i32 0, i32 0, !dbg !126
  %34 = getelementptr inbounds [17 x i32]* %33, i32 0, i64 %31, !dbg !126
  store i32 %29, i32* %34, align 4, !dbg !126
  %35 = load i32* %I, align 4, !dbg !127
  %36 = icmp eq i32 %35, 0, !dbg !127
  br i1 %36, label %37, label %38, !dbg !127

; <label>:37                                      ; preds = %28
  store i32 16, i32* %I, align 4, !dbg !129
  br label %41, !dbg !129

; <label>:38                                      ; preds = %28
  %39 = load i32* %I, align 4, !dbg !130
  %40 = add nsw i32 %39, -1, !dbg !130
  store i32 %40, i32* %I, align 4, !dbg !130
  br label %41

; <label>:41                                      ; preds = %38, %37
  %42 = load i32* %I, align 4, !dbg !131
  %43 = load %struct.Random_struct** %2, align 8, !dbg !131
  %44 = getelementptr inbounds %struct.Random_struct* %43, i32 0, i32 2, !dbg !131
  store i32 %42, i32* %44, align 4, !dbg !131
  %45 = load i32* %J, align 4, !dbg !132
  %46 = icmp eq i32 %45, 0, !dbg !132
  br i1 %46, label %47, label %48, !dbg !132

; <label>:47                                      ; preds = %41
  store i32 16, i32* %J, align 4, !dbg !134
  br label %51, !dbg !134

; <label>:48                                      ; preds = %41
  %49 = load i32* %J, align 4, !dbg !135
  %50 = add nsw i32 %49, -1, !dbg !135
  store i32 %50, i32* %J, align 4, !dbg !135
  br label %51

; <label>:51                                      ; preds = %48, %47
  %52 = load i32* %J, align 4, !dbg !136
  %53 = load %struct.Random_struct** %2, align 8, !dbg !136
  %54 = getelementptr inbounds %struct.Random_struct* %53, i32 0, i32 3, !dbg !136
  store i32 %52, i32* %54, align 4, !dbg !136
  %55 = load %struct.Random_struct** %2, align 8, !dbg !137
  %56 = getelementptr inbounds %struct.Random_struct* %55, i32 0, i32 4, !dbg !137
  %57 = load i32* %56, align 4, !dbg !137
  %58 = icmp ne i32 %57, 0, !dbg !137
  br i1 %58, label %59, label %72, !dbg !137

; <label>:59                                      ; preds = %51
  %60 = load %struct.Random_struct** %2, align 8, !dbg !139
  %61 = getelementptr inbounds %struct.Random_struct* %60, i32 0, i32 5, !dbg !139
  %62 = load double* %61, align 8, !dbg !139
  %63 = load double* @dm1, align 8, !dbg !139
  %64 = load i32* %k, align 4, !dbg !139
  %65 = sitofp i32 %64 to double, !dbg !139
  %66 = fmul double %63, %65, !dbg !139
  %67 = load %struct.Random_struct** %2, align 8, !dbg !139
  %68 = getelementptr inbounds %struct.Random_struct* %67, i32 0, i32 7, !dbg !139
  %69 = load double* %68, align 8, !dbg !139
  %70 = fmul double %66, %69, !dbg !139
  %71 = fadd double %62, %70, !dbg !139
  store double %71, double* %1, !dbg !139
  br label %77, !dbg !139

; <label>:72                                      ; preds = %51
  %73 = load double* @dm1, align 8, !dbg !140
  %74 = load i32* %k, align 4, !dbg !140
  %75 = sitofp i32 %74 to double, !dbg !140
  %76 = fmul double %73, %75, !dbg !140
  store double %76, double* %1, !dbg !140
  br label %77, !dbg !140

; <label>:77                                      ; preds = %72, %59
  %78 = load double* %1, !dbg !141
  ret double %78, !dbg !141
}

; Function Attrs: nounwind uwtable
define double* @RandomVector(i32 %N, %struct.Random_struct* %R) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Random_struct*, align 8
  %i = alloca i32, align 4
  %x = alloca double*, align 8
  store i32 %N, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !142), !dbg !143
  store %struct.Random_struct* %R, %struct.Random_struct** %2, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %2}, metadata !144), !dbg !143
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !145), !dbg !146
  call void @llvm.dbg.declare(metadata !{double** %x}, metadata !147), !dbg !148
  %3 = load i32* %1, align 4, !dbg !148
  %4 = sext i32 %3 to i64, !dbg !148
  %5 = mul i64 8, %4, !dbg !148
  %6 = call noalias i8* @malloc(i64 %5) #3, !dbg !148
  %7 = bitcast i8* %6 to double*, !dbg !148
  store double* %7, double** %x, align 8, !dbg !148
  store i32 0, i32* %i, align 4, !dbg !149
  br label %8, !dbg !149

; <label>:8                                       ; preds = %19, %0
  %9 = load i32* %i, align 4, !dbg !149
  %10 = load i32* %1, align 4, !dbg !149
  %11 = icmp slt i32 %9, %10, !dbg !149
  br i1 %11, label %12, label %22, !dbg !149

; <label>:12                                      ; preds = %8
  %13 = load %struct.Random_struct** %2, align 8, !dbg !151
  %14 = call double @Random_nextDouble(%struct.Random_struct* %13), !dbg !151
  %15 = load i32* %i, align 4, !dbg !151
  %16 = sext i32 %15 to i64, !dbg !151
  %17 = load double** %x, align 8, !dbg !151
  %18 = getelementptr inbounds double* %17, i64 %16, !dbg !151
  store double %14, double* %18, align 8, !dbg !151
  br label %19, !dbg !151

; <label>:19                                      ; preds = %12
  %20 = load i32* %i, align 4, !dbg !149
  %21 = add nsw i32 %20, 1, !dbg !149
  store i32 %21, i32* %i, align 4, !dbg !149
  br label %8, !dbg !149

; <label>:22                                      ; preds = %8
  %23 = load double** %x, align 8, !dbg !152
  ret double* %23, !dbg !152
}

; Function Attrs: nounwind uwtable
define double** @RandomMatrix(i32 %M, i32 %N, %struct.Random_struct* %R) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.Random_struct*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %A = alloca double**, align 8
  store i32 %M, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !153), !dbg !154
  store i32 %N, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !155), !dbg !154
  store %struct.Random_struct* %R, %struct.Random_struct** %4, align 8
  call void @llvm.dbg.declare(metadata !{%struct.Random_struct** %4}, metadata !156), !dbg !154
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !157), !dbg !158
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !159), !dbg !160
  call void @llvm.dbg.declare(metadata !{double*** %A}, metadata !161), !dbg !162
  %5 = load i32* %2, align 4, !dbg !162
  %6 = sext i32 %5 to i64, !dbg !162
  %7 = mul i64 8, %6, !dbg !162
  %8 = call noalias i8* @malloc(i64 %7) #3, !dbg !162
  %9 = bitcast i8* %8 to double**, !dbg !162
  store double** %9, double*** %A, align 8, !dbg !162
  %10 = load double*** %A, align 8, !dbg !163
  %11 = icmp eq double** %10, null, !dbg !163
  br i1 %11, label %12, label %13, !dbg !163

; <label>:12                                      ; preds = %0
  store double** null, double*** %1, !dbg !163
  br label %62, !dbg !163

; <label>:13                                      ; preds = %0
  store i32 0, i32* %i, align 4, !dbg !165
  br label %14, !dbg !165

; <label>:14                                      ; preds = %57, %13
  %15 = load i32* %i, align 4, !dbg !165
  %16 = load i32* %2, align 4, !dbg !165
  %17 = icmp slt i32 %15, %16, !dbg !165
  br i1 %17, label %18, label %60, !dbg !165

; <label>:18                                      ; preds = %14
  %19 = load i32* %3, align 4, !dbg !167
  %20 = sext i32 %19 to i64, !dbg !167
  %21 = mul i64 8, %20, !dbg !167
  %22 = call noalias i8* @malloc(i64 %21) #3, !dbg !167
  %23 = bitcast i8* %22 to double*, !dbg !167
  %24 = load i32* %i, align 4, !dbg !167
  %25 = sext i32 %24 to i64, !dbg !167
  %26 = load double*** %A, align 8, !dbg !167
  %27 = getelementptr inbounds double** %26, i64 %25, !dbg !167
  store double* %23, double** %27, align 8, !dbg !167
  %28 = load i32* %i, align 4, !dbg !169
  %29 = sext i32 %28 to i64, !dbg !169
  %30 = load double*** %A, align 8, !dbg !169
  %31 = getelementptr inbounds double** %30, i64 %29, !dbg !169
  %32 = load double** %31, align 8, !dbg !169
  %33 = icmp eq double* %32, null, !dbg !169
  br i1 %33, label %34, label %37, !dbg !169

; <label>:34                                      ; preds = %18
  %35 = load double*** %A, align 8, !dbg !171
  %36 = bitcast double** %35 to i8*, !dbg !171
  call void @free(i8* %36) #3, !dbg !171
  store double** null, double*** %1, !dbg !173
  br label %62, !dbg !173

; <label>:37                                      ; preds = %18
  store i32 0, i32* %j, align 4, !dbg !174
  br label %38, !dbg !174

; <label>:38                                      ; preds = %53, %37
  %39 = load i32* %j, align 4, !dbg !174
  %40 = load i32* %3, align 4, !dbg !174
  %41 = icmp slt i32 %39, %40, !dbg !174
  br i1 %41, label %42, label %56, !dbg !174

; <label>:42                                      ; preds = %38
  %43 = load %struct.Random_struct** %4, align 8, !dbg !176
  %44 = call double @Random_nextDouble(%struct.Random_struct* %43), !dbg !176
  %45 = load i32* %j, align 4, !dbg !176
  %46 = sext i32 %45 to i64, !dbg !176
  %47 = load i32* %i, align 4, !dbg !176
  %48 = sext i32 %47 to i64, !dbg !176
  %49 = load double*** %A, align 8, !dbg !176
  %50 = getelementptr inbounds double** %49, i64 %48, !dbg !176
  %51 = load double** %50, align 8, !dbg !176
  %52 = getelementptr inbounds double* %51, i64 %46, !dbg !176
  store double %44, double* %52, align 8, !dbg !176
  br label %53, !dbg !176

; <label>:53                                      ; preds = %42
  %54 = load i32* %j, align 4, !dbg !174
  %55 = add nsw i32 %54, 1, !dbg !174
  store i32 %55, i32* %j, align 4, !dbg !174
  br label %38, !dbg !174

; <label>:56                                      ; preds = %38
  br label %57, !dbg !177

; <label>:57                                      ; preds = %56
  %58 = load i32* %i, align 4, !dbg !165
  %59 = add nsw i32 %58, 1, !dbg !165
  store i32 %59, i32* %i, align 4, !dbg !165
  br label %14, !dbg !165

; <label>:60                                      ; preds = %14
  %61 = load double*** %A, align 8, !dbg !178
  store double** %61, double*** %1, !dbg !178
  br label %62, !dbg !178

; <label>:62                                      ; preds = %60, %34, %12
  %63 = load double*** %1, !dbg !179
  ret double** %63, !dbg !179
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!51, !52}
!llvm.ident = !{!53}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !46, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"Random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !26, metadata !29, metadata !32, metadata !35, metadata !39, metadata !43}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random_seed", metadata !"new_Random_seed", metadata !"", i32 35, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Random_struct* (i32)* @new_Random_seed, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [new_Random_seed]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !15}
!8 = metadata !{i32 786454, metadata !9, null, metadata !"Random", i32 12, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [Random] [line 12, size 0, align 0, offset 0] [from ]
!9 = metadata !{metadata !"./Random.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786451, metadata !9, null, metadata !"", i32 1, i64 896, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 1, size 896, align 64, offset 0] [def] [from ]
!12 = metadata !{metadata !13, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !24, metadata !25}
!13 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"m", i32 3, i64 544, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ] [m] [line 3, size 544, align 32, offset 0] [from ]
!14 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !15, metadata !16, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{metadata !17}
!17 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!18 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"seed", i32 4, i64 32, i64 32, i64 544, i32 0, metadata !15} ; [ DW_TAG_member ] [seed] [line 4, size 32, align 32, offset 544] [from int]
!19 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"i", i32 5, i64 32, i64 32, i64 576, i32 0, metadata !15} ; [ DW_TAG_member ] [i] [line 5, size 32, align 32, offset 576] [from int]
!20 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"j", i32 6, i64 32, i64 32, i64 608, i32 0, metadata !15} ; [ DW_TAG_member ] [j] [line 6, size 32, align 32, offset 608] [from int]
!21 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"haveRange", i32 7, i64 32, i64 32, i64 640, i32 0, metadata !15} ; [ DW_TAG_member ] [haveRange] [line 7, size 32, align 32, offset 640] [from int]
!22 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"left", i32 8, i64 64, i64 64, i64 704, i32 0, metadata !23} ; [ DW_TAG_member ] [left] [line 8, size 64, align 64, offset 704] [from double]
!23 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!24 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"right", i32 9, i64 64, i64 64, i64 768, i32 0, metadata !23} ; [ DW_TAG_member ] [right] [line 9, size 64, align 64, offset 768] [from double]
!25 = metadata !{i32 786445, metadata !9, metadata !11, metadata !"width", i32 10, i64 64, i64 64, i64 832, i32 0, metadata !23} ; [ DW_TAG_member ] [width] [line 10, size 64, align 64, offset 832] [from double]
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Random", metadata !"new_Random", metadata !"", i32 48, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, %struct.Random_struct* (i32, double, double)* @new_Random, null, null, metadata !2, i32 49} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [new_Random]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !8, metadata !15, metadata !23, metadata !23}
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_delete", metadata !"Random_delete", metadata !"", i32 61, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Random_struct*)* @Random_delete, null, null, metadata !2, i32 62} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [Random_delete]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !8}
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Random_nextDouble", metadata !"Random_nextDouble", metadata !"", i32 70, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double (%struct.Random_struct*)* @Random_nextDouble, null, null, metadata !2, i32 71} ; [ DW_TAG_subprogram ] [line 70] [def] [scope 71] [Random_nextDouble]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{metadata !23, metadata !8}
!35 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomVector", metadata !"RandomVector", metadata !"", i32 134, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double* (i32, %struct.Random_struct*)* @RandomVector, null, null, metadata !2, i32 135} ; [ DW_TAG_subprogram ] [line 134] [def] [scope 135] [RandomVector]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{metadata !38, metadata !15, metadata !8}
!38 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!39 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"RandomMatrix", metadata !"RandomMatrix", metadata !"", i32 146, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, double** (i32, i32, %struct.Random_struct*)* @RandomMatrix, null, null, metadata !2, i32 147} ; [ DW_TAG_subprogram ] [line 146] [def] [scope 147] [RandomMatrix]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{metadata !42, metadata !15, metadata !15, metadata !8}
!42 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"initialize", metadata !"initialize", metadata !"", i32 106, metadata !44, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.Random_struct*, i32)* @initialize, null, null, metadata !2, i32 107} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [initialize]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{null, metadata !8, metadata !15}
!46 = metadata !{metadata !47, metadata !49, metadata !47, metadata !47, metadata !47, metadata !50, metadata !50, metadata !50, metadata !50, metadata !50, metadata !50, metadata !50, metadata !50}
!47 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m1", metadata !"m1", metadata !"m1", metadata !5, i32 17, metadata !48, i32 1, i32 1, i32 2147483647, null} ; [ DW_TAG_variable ] [m1] [line 17] [local] [def]
!48 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!49 = metadata !{i32 786484, i32 0, null, metadata !"dm1", metadata !"dm1", metadata !"", metadata !5, i32 28, metadata !23, i32 1, i32 1, double* @dm1, null} ; [ DW_TAG_variable ] [dm1] [line 28] [local] [def]
!50 = metadata !{i32 786484, i32 0, metadata !5, metadata !"m2", metadata !"m2", metadata !"m2", metadata !5, i32 18, metadata !48, i32 1, i32 1, i32 65536, null} ; [ DW_TAG_variable ] [m2] [line 18] [local] [def]
!51 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!52 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!53 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!54 = metadata !{i32 786689, metadata !4, metadata !"seed", metadata !5, i32 16777251, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 35]
!55 = metadata !{i32 35, i32 0, metadata !4, null}
!56 = metadata !{i32 786688, metadata !4, metadata !"R", metadata !5, i32 37, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 37]
!57 = metadata !{i32 37, i32 0, metadata !4, null}
!58 = metadata !{i32 39, i32 0, metadata !4, null}
!59 = metadata !{i32 40, i32 0, metadata !4, null}
!60 = metadata !{i32 41, i32 0, metadata !4, null}
!61 = metadata !{i32 42, i32 0, metadata !4, null}
!62 = metadata !{i32 43, i32 0, metadata !4, null}
!63 = metadata !{i32 45, i32 0, metadata !4, null}
!64 = metadata !{i32 786689, metadata !43, metadata !"R", metadata !5, i32 16777322, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 106]
!65 = metadata !{i32 106, i32 0, metadata !43, null}
!66 = metadata !{i32 786689, metadata !43, metadata !"seed", metadata !5, i32 33554538, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 106]
!67 = metadata !{i32 786688, metadata !43, metadata !"jseed", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jseed] [line 109]
!68 = metadata !{i32 109, i32 0, metadata !43, null}
!69 = metadata !{i32 786688, metadata !43, metadata !"k0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k0] [line 109]
!70 = metadata !{i32 786688, metadata !43, metadata !"k1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 109]
!71 = metadata !{i32 786688, metadata !43, metadata !"j0", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j0] [line 109]
!72 = metadata !{i32 786688, metadata !43, metadata !"j1", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 109]
!73 = metadata !{i32 786688, metadata !43, metadata !"iloop", metadata !5, i32 109, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iloop] [line 109]
!74 = metadata !{i32 111, i32 0, metadata !43, null}
!75 = metadata !{i32 113, i32 0, metadata !43, null}
!76 = metadata !{i32 115, i32 0, metadata !77, null}
!77 = metadata !{i32 786443, metadata !1, metadata !43, i32 115, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!78 = metadata !{i32 116, i32 0, metadata !43, null}
!79 = metadata !{i32 117, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !43, i32 117, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!81 = metadata !{i32 118, i32 0, metadata !43, null}
!82 = metadata !{i32 119, i32 0, metadata !43, null}
!83 = metadata !{i32 120, i32 0, metadata !43, null}
!84 = metadata !{i32 121, i32 0, metadata !43, null}
!85 = metadata !{i32 122, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !43, i32 122, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!87 = metadata !{i32 124, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !86, i32 123, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!89 = metadata !{i32 125, i32 0, metadata !88, null}
!90 = metadata !{i32 126, i32 0, metadata !88, null}
!91 = metadata !{i32 127, i32 0, metadata !88, null}
!92 = metadata !{i32 128, i32 0, metadata !88, null}
!93 = metadata !{i32 129, i32 0, metadata !43, null}
!94 = metadata !{i32 130, i32 0, metadata !43, null}
!95 = metadata !{i32 132, i32 0, metadata !43, null}
!96 = metadata !{i32 786689, metadata !26, metadata !"seed", metadata !5, i32 16777264, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [seed] [line 48]
!97 = metadata !{i32 48, i32 0, metadata !26, null}
!98 = metadata !{i32 786689, metadata !26, metadata !"left", metadata !5, i32 33554480, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [left] [line 48]
!99 = metadata !{i32 786689, metadata !26, metadata !"right", metadata !5, i32 50331696, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [right] [line 48]
!100 = metadata !{i32 786688, metadata !26, metadata !"R", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [R] [line 50]
!101 = metadata !{i32 50, i32 0, metadata !26, null}
!102 = metadata !{i32 52, i32 0, metadata !26, null}
!103 = metadata !{i32 53, i32 0, metadata !26, null}
!104 = metadata !{i32 54, i32 0, metadata !26, null}
!105 = metadata !{i32 55, i32 0, metadata !26, null}
!106 = metadata !{i32 56, i32 0, metadata !26, null}
!107 = metadata !{i32 58, i32 0, metadata !26, null} ; [ DW_TAG_imported_module ]
!108 = metadata !{i32 786689, metadata !29, metadata !"R", metadata !5, i32 16777277, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 61]
!109 = metadata !{i32 61, i32 0, metadata !29, null}
!110 = metadata !{i32 63, i32 0, metadata !29, null}
!111 = metadata !{i32 64, i32 0, metadata !29, null}
!112 = metadata !{i32 786689, metadata !32, metadata !"R", metadata !5, i32 16777286, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 70]
!113 = metadata !{i32 70, i32 0, metadata !32, null}
!114 = metadata !{i32 786688, metadata !32, metadata !"k", metadata !5, i32 72, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 72]
!115 = metadata !{i32 72, i32 0, metadata !32, null}
!116 = metadata !{i32 786688, metadata !32, metadata !"I", metadata !5, i32 74, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [I] [line 74]
!117 = metadata !{i32 74, i32 0, metadata !32, null}
!118 = metadata !{i32 786688, metadata !32, metadata !"J", metadata !5, i32 75, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [J] [line 75]
!119 = metadata !{i32 75, i32 0, metadata !32, null}
!120 = metadata !{i32 786688, metadata !32, metadata !"m", metadata !5, i32 76, metadata !121, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 76]
!121 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!122 = metadata !{i32 76, i32 0, metadata !32, null}
!123 = metadata !{i32 78, i32 0, metadata !32, null}
!124 = metadata !{i32 79, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !32, i32 79, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!126 = metadata !{i32 80, i32 0, metadata !32, null}
!127 = metadata !{i32 82, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !32, i32 82, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!129 = metadata !{i32 83, i32 0, metadata !128, null}
!130 = metadata !{i32 84, i32 0, metadata !128, null}
!131 = metadata !{i32 85, i32 0, metadata !32, null}
!132 = metadata !{i32 87, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !32, i32 87, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!134 = metadata !{i32 88, i32 0, metadata !133, null}
!135 = metadata !{i32 89, i32 0, metadata !133, null}
!136 = metadata !{i32 90, i32 0, metadata !32, null}
!137 = metadata !{i32 92, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !32, i32 92, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!139 = metadata !{i32 93, i32 0, metadata !138, null}
!140 = metadata !{i32 95, i32 0, metadata !138, null}
!141 = metadata !{i32 97, i32 0, metadata !32, null}
!142 = metadata !{i32 786689, metadata !35, metadata !"N", metadata !5, i32 16777350, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 134]
!143 = metadata !{i32 134, i32 0, metadata !35, null}
!144 = metadata !{i32 786689, metadata !35, metadata !"R", metadata !5, i32 33554566, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 134]
!145 = metadata !{i32 786688, metadata !35, metadata !"i", metadata !5, i32 136, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 136]
!146 = metadata !{i32 136, i32 0, metadata !35, null}
!147 = metadata !{i32 786688, metadata !35, metadata !"x", metadata !5, i32 137, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 137]
!148 = metadata !{i32 137, i32 0, metadata !35, null}
!149 = metadata !{i32 139, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !35, i32 139, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!151 = metadata !{i32 140, i32 0, metadata !150, null}
!152 = metadata !{i32 142, i32 0, metadata !35, null}
!153 = metadata !{i32 786689, metadata !39, metadata !"M", metadata !5, i32 16777362, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 146]
!154 = metadata !{i32 146, i32 0, metadata !39, null}
!155 = metadata !{i32 786689, metadata !39, metadata !"N", metadata !5, i32 33554578, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 146]
!156 = metadata !{i32 786689, metadata !39, metadata !"R", metadata !5, i32 50331794, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [R] [line 146]
!157 = metadata !{i32 786688, metadata !39, metadata !"i", metadata !5, i32 148, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 148]
!158 = metadata !{i32 148, i32 0, metadata !39, null}
!159 = metadata !{i32 786688, metadata !39, metadata !"j", metadata !5, i32 149, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 149]
!160 = metadata !{i32 149, i32 0, metadata !39, null}
!161 = metadata !{i32 786688, metadata !39, metadata !"A", metadata !5, i32 153, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 153]
!162 = metadata !{i32 153, i32 0, metadata !39, null}
!163 = metadata !{i32 155, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !39, i32 155, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!165 = metadata !{i32 157, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !39, i32 157, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!167 = metadata !{i32 159, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !166, i32 158, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!169 = metadata !{i32 160, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 160, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!171 = metadata !{i32 162, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !170, i32 161, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!173 = metadata !{i32 163, i32 0, metadata !172, null}
!174 = metadata !{i32 165, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !168, i32 165, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/Random.c]
!176 = metadata !{i32 166, i32 0, metadata !175, null}
!177 = metadata !{i32 167, i32 0, metadata !168, null}
!178 = metadata !{i32 168, i32 0, metadata !39, null}
!179 = metadata !{i32 169, i32 0, metadata !39, null}
