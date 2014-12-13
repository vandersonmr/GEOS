; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %count = alloca i32, align 4
  %m = alloca i32**, align 8
  store i32 %rows, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !29), !dbg !30
  store i32 %cols, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !31), !dbg !30
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !34), !dbg !33
  call void @llvm.dbg.declare(metadata !{i32* %count}, metadata !35), !dbg !33
  store i32 1, i32* %count, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata !{i32*** %m}, metadata !36), !dbg !37
  %3 = load i32* %1, align 4, !dbg !37
  %4 = sext i32 %3 to i64, !dbg !37
  %5 = mul i64 %4, 8, !dbg !37
  %6 = call noalias i8* @malloc(i64 %5) #5, !dbg !37
  %7 = bitcast i8* %6 to i32**, !dbg !37
  store i32** %7, i32*** %m, align 8, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %8, !dbg !38

; <label>:8                                       ; preds = %41, %0
  %9 = load i32* %i, align 4, !dbg !38
  %10 = load i32* %1, align 4, !dbg !38
  %11 = icmp slt i32 %9, %10, !dbg !38
  br i1 %11, label %12, label %44, !dbg !38

; <label>:12                                      ; preds = %8
  %13 = load i32* %2, align 4, !dbg !40
  %14 = sext i32 %13 to i64, !dbg !40
  %15 = mul i64 %14, 4, !dbg !40
  %16 = call noalias i8* @malloc(i64 %15) #5, !dbg !40
  %17 = bitcast i8* %16 to i32*, !dbg !40
  %18 = load i32* %i, align 4, !dbg !40
  %19 = sext i32 %18 to i64, !dbg !40
  %20 = load i32*** %m, align 8, !dbg !40
  %21 = getelementptr inbounds i32** %20, i64 %19, !dbg !40
  store i32* %17, i32** %21, align 8, !dbg !40
  store i32 0, i32* %j, align 4, !dbg !42
  br label %22, !dbg !42

; <label>:22                                      ; preds = %37, %12
  %23 = load i32* %j, align 4, !dbg !42
  %24 = load i32* %2, align 4, !dbg !42
  %25 = icmp slt i32 %23, %24, !dbg !42
  br i1 %25, label %26, label %40, !dbg !42

; <label>:26                                      ; preds = %22
  %27 = load i32* %count, align 4, !dbg !44
  %28 = add nsw i32 %27, 1, !dbg !44
  store i32 %28, i32* %count, align 4, !dbg !44
  %29 = load i32* %j, align 4, !dbg !44
  %30 = sext i32 %29 to i64, !dbg !44
  %31 = load i32* %i, align 4, !dbg !44
  %32 = sext i32 %31 to i64, !dbg !44
  %33 = load i32*** %m, align 8, !dbg !44
  %34 = getelementptr inbounds i32** %33, i64 %32, !dbg !44
  %35 = load i32** %34, align 8, !dbg !44
  %36 = getelementptr inbounds i32* %35, i64 %30, !dbg !44
  store i32 %27, i32* %36, align 4, !dbg !44
  br label %37, !dbg !46

; <label>:37                                      ; preds = %26
  %38 = load i32* %j, align 4, !dbg !42
  %39 = add nsw i32 %38, 1, !dbg !42
  store i32 %39, i32* %j, align 4, !dbg !42
  br label %22, !dbg !42

; <label>:40                                      ; preds = %22
  br label %41, !dbg !47

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4, !dbg !38
  %43 = add nsw i32 %42, 1, !dbg !38
  store i32 %43, i32* %i, align 4, !dbg !38
  br label %8, !dbg !38

; <label>:44                                      ; preds = %8
  %45 = load i32*** %m, align 8, !dbg !48
  ret i32** %45, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** %m) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %rows, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !49), !dbg !50
  store i32 %cols, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !51), !dbg !50
  store i32** %m, i32*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32*** %3}, metadata !52), !dbg !50
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !53), !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !55), !dbg !54
  store i32 0, i32* %i, align 4, !dbg !56
  br label %4, !dbg !56

; <label>:4                                       ; preds = %26, %0
  %5 = load i32* %i, align 4, !dbg !56
  %6 = load i32* %1, align 4, !dbg !56
  %7 = icmp slt i32 %5, %6, !dbg !56
  br i1 %7, label %8, label %29, !dbg !56

; <label>:8                                       ; preds = %4
  store i32 0, i32* %j, align 4, !dbg !58
  br label %9, !dbg !58

; <label>:9                                       ; preds = %22, %8
  %10 = load i32* %j, align 4, !dbg !58
  %11 = load i32* %2, align 4, !dbg !58
  %12 = icmp slt i32 %10, %11, !dbg !58
  br i1 %12, label %13, label %25, !dbg !58

; <label>:13                                      ; preds = %9
  %14 = load i32* %j, align 4, !dbg !60
  %15 = sext i32 %14 to i64, !dbg !60
  %16 = load i32* %i, align 4, !dbg !60
  %17 = sext i32 %16 to i64, !dbg !60
  %18 = load i32*** %3, align 8, !dbg !60
  %19 = getelementptr inbounds i32** %18, i64 %17, !dbg !60
  %20 = load i32** %19, align 8, !dbg !60
  %21 = getelementptr inbounds i32* %20, i64 %15, !dbg !60
  store i32 0, i32* %21, align 4, !dbg !60
  br label %22, !dbg !60

; <label>:22                                      ; preds = %13
  %23 = load i32* %j, align 4, !dbg !58
  %24 = add nsw i32 %23, 1, !dbg !58
  store i32 %24, i32* %j, align 4, !dbg !58
  br label %9, !dbg !58

; <label>:25                                      ; preds = %9
  br label %26, !dbg !60

; <label>:26                                      ; preds = %25
  %27 = load i32* %i, align 4, !dbg !56
  %28 = add nsw i32 %27, 1, !dbg !56
  store i32 %28, i32* %i, align 4, !dbg !56
  br label %4, !dbg !56

; <label>:29                                      ; preds = %4
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** %m) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32**, align 8
  store i32 %rows, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !62), !dbg !63
  store i32** %m, i32*** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32*** %2}, metadata !64), !dbg !63
  br label %3, !dbg !65

; <label>:3                                       ; preds = %7, %0
  %4 = load i32* %1, align 4, !dbg !65
  %5 = add nsw i32 %4, -1, !dbg !65
  store i32 %5, i32* %1, align 4, !dbg !65
  %6 = icmp sgt i32 %5, -1, !dbg !65
  br i1 %6, label %7, label %14, !dbg !65

; <label>:7                                       ; preds = %3
  %8 = load i32* %1, align 4, !dbg !66
  %9 = sext i32 %8 to i64, !dbg !66
  %10 = load i32*** %2, align 8, !dbg !66
  %11 = getelementptr inbounds i32** %10, i64 %9, !dbg !66
  %12 = load i32** %11, align 8, !dbg !66
  %13 = bitcast i32* %12 to i8*, !dbg !66
  call void @free(i8* %13) #5, !dbg !66
  br label %3, !dbg !66

; <label>:14                                      ; preds = %3
  %15 = load i32*** %2, align 8, !dbg !68
  %16 = bitcast i32** %15 to i8*, !dbg !68
  call void @free(i8* %16) #5, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** %m1, i32** %m2, i32** %m3) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32**, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 %rows, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !70), !dbg !71
  store i32 %cols, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !72), !dbg !71
  store i32** %m1, i32*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32*** %3}, metadata !73), !dbg !71
  store i32** %m2, i32*** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32*** %4}, metadata !74), !dbg !71
  store i32** %m3, i32*** %5, align 8
  call void @llvm.dbg.declare(metadata !{i32*** %5}, metadata !75), !dbg !71
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !76), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !78), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !79), !dbg !77
  call void @llvm.dbg.declare(metadata !{i32* %val}, metadata !80), !dbg !77
  store i32 0, i32* %i, align 4, !dbg !81
  br label %6, !dbg !81

; <label>:6                                       ; preds = %59, %0
  %7 = load i32* %i, align 4, !dbg !81
  %8 = load i32* %1, align 4, !dbg !81
  %9 = icmp slt i32 %7, %8, !dbg !81
  br i1 %9, label %10, label %62, !dbg !81

; <label>:10                                      ; preds = %6
  store i32 0, i32* %j, align 4, !dbg !83
  br label %11, !dbg !83

; <label>:11                                      ; preds = %55, %10
  %12 = load i32* %j, align 4, !dbg !83
  %13 = load i32* %2, align 4, !dbg !83
  %14 = icmp slt i32 %12, %13, !dbg !83
  br i1 %14, label %15, label %58, !dbg !83

; <label>:15                                      ; preds = %11
  store i32 0, i32* %val, align 4, !dbg !86
  store i32 0, i32* %k, align 4, !dbg !88
  br label %16, !dbg !88

; <label>:16                                      ; preds = %42, %15
  %17 = load i32* %k, align 4, !dbg !88
  %18 = load i32* %2, align 4, !dbg !88
  %19 = icmp slt i32 %17, %18, !dbg !88
  br i1 %19, label %20, label %45, !dbg !88

; <label>:20                                      ; preds = %16
  %21 = load i32* %k, align 4, !dbg !90
  %22 = sext i32 %21 to i64, !dbg !90
  %23 = load i32* %i, align 4, !dbg !90
  %24 = sext i32 %23 to i64, !dbg !90
  %25 = load i32*** %3, align 8, !dbg !90
  %26 = getelementptr inbounds i32** %25, i64 %24, !dbg !90
  %27 = load i32** %26, align 8, !dbg !90
  %28 = getelementptr inbounds i32* %27, i64 %22, !dbg !90
  %29 = load i32* %28, align 4, !dbg !90
  %30 = load i32* %j, align 4, !dbg !90
  %31 = sext i32 %30 to i64, !dbg !90
  %32 = load i32* %k, align 4, !dbg !90
  %33 = sext i32 %32 to i64, !dbg !90
  %34 = load i32*** %4, align 8, !dbg !90
  %35 = getelementptr inbounds i32** %34, i64 %33, !dbg !90
  %36 = load i32** %35, align 8, !dbg !90
  %37 = getelementptr inbounds i32* %36, i64 %31, !dbg !90
  %38 = load i32* %37, align 4, !dbg !90
  %39 = mul nsw i32 %29, %38, !dbg !90
  %40 = load i32* %val, align 4, !dbg !90
  %41 = add nsw i32 %40, %39, !dbg !90
  store i32 %41, i32* %val, align 4, !dbg !90
  br label %42, !dbg !92

; <label>:42                                      ; preds = %20
  %43 = load i32* %k, align 4, !dbg !88
  %44 = add nsw i32 %43, 1, !dbg !88
  store i32 %44, i32* %k, align 4, !dbg !88
  br label %16, !dbg !88

; <label>:45                                      ; preds = %16
  %46 = load i32* %val, align 4, !dbg !93
  %47 = load i32* %j, align 4, !dbg !93
  %48 = sext i32 %47 to i64, !dbg !93
  %49 = load i32* %i, align 4, !dbg !93
  %50 = sext i32 %49 to i64, !dbg !93
  %51 = load i32*** %5, align 8, !dbg !93
  %52 = getelementptr inbounds i32** %51, i64 %50, !dbg !93
  %53 = load i32** %52, align 8, !dbg !93
  %54 = getelementptr inbounds i32* %53, i64 %48, !dbg !93
  store i32 %46, i32* %54, align 4, !dbg !93
  br label %55, !dbg !94

; <label>:55                                      ; preds = %45
  %56 = load i32* %j, align 4, !dbg !83
  %57 = add nsw i32 %56, 1, !dbg !83
  store i32 %57, i32* %j, align 4, !dbg !83
  br label %11, !dbg !83

; <label>:58                                      ; preds = %11
  br label %59, !dbg !95

; <label>:59                                      ; preds = %58
  %60 = load i32* %i, align 4, !dbg !81
  %61 = add nsw i32 %60, 1, !dbg !81
  store i32 %61, i32* %i, align 4, !dbg !81
  br label %6, !dbg !81

; <label>:62                                      ; preds = %6
  %63 = load i32*** %5, align 8, !dbg !96
  ret i32** %63, !dbg !96
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %m1 = alloca i32**, align 8
  %m2 = alloca i32**, align 8
  %mm = alloca i32**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !97), !dbg !98
  store i8** %argv, i8*** %3, align 8
  call void @llvm.dbg.declare(metadata !{i8*** %3}, metadata !99), !dbg !98
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !100), !dbg !101
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !102), !dbg !101
  %4 = load i32* %2, align 4, !dbg !101
  %5 = icmp eq i32 %4, 2, !dbg !101
  br i1 %5, label %6, label %11, !dbg !101

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8, !dbg !101
  %8 = getelementptr inbounds i8** %7, i64 1, !dbg !101
  %9 = load i8** %8, align 8, !dbg !101
  %10 = call i32 @atoi(i8* %9) #6, !dbg !101
  br label %12, !dbg !101

; <label>:11                                      ; preds = %0
  br label %12, !dbg !101

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 3000000, %11 ], !dbg !101
  store i32 %13, i32* %n, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata !{i32*** %m1}, metadata !103), !dbg !104
  %14 = call i32** @mkmatrix(i32 10, i32 10), !dbg !104
  store i32** %14, i32*** %m1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata !{i32*** %m2}, metadata !105), !dbg !106
  %15 = call i32** @mkmatrix(i32 10, i32 10), !dbg !106
  store i32** %15, i32*** %m2, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata !{i32*** %mm}, metadata !107), !dbg !108
  %16 = call i32** @mkmatrix(i32 10, i32 10), !dbg !108
  store i32** %16, i32*** %mm, align 8, !dbg !108
  store i32 0, i32* %i, align 4, !dbg !109
  br label %17, !dbg !109

; <label>:17                                      ; preds = %26, %12
  %18 = load i32* %i, align 4, !dbg !109
  %19 = load i32* %n, align 4, !dbg !109
  %20 = icmp slt i32 %18, %19, !dbg !109
  br i1 %20, label %21, label %29, !dbg !109

; <label>:21                                      ; preds = %17
  %22 = load i32*** %m1, align 8, !dbg !111
  %23 = load i32*** %m2, align 8, !dbg !111
  %24 = load i32*** %mm, align 8, !dbg !111
  %25 = call i32** @mmult(i32 10, i32 10, i32** %22, i32** %23, i32** %24), !dbg !111
  store i32** %25, i32*** %mm, align 8, !dbg !111
  br label %26, !dbg !113

; <label>:26                                      ; preds = %21
  %27 = load i32* %i, align 4, !dbg !109
  %28 = add nsw i32 %27, 1, !dbg !109
  store i32 %28, i32* %i, align 4, !dbg !109
  br label %17, !dbg !109

; <label>:29                                      ; preds = %17
  %30 = load i32*** %mm, align 8, !dbg !114
  %31 = getelementptr inbounds i32** %30, i64 0, !dbg !114
  %32 = load i32** %31, align 8, !dbg !114
  %33 = getelementptr inbounds i32* %32, i64 0, !dbg !114
  %34 = load i32* %33, align 4, !dbg !114
  %35 = load i32*** %mm, align 8, !dbg !114
  %36 = getelementptr inbounds i32** %35, i64 2, !dbg !114
  %37 = load i32** %36, align 8, !dbg !114
  %38 = getelementptr inbounds i32* %37, i64 3, !dbg !114
  %39 = load i32* %38, align 4, !dbg !114
  %40 = load i32*** %mm, align 8, !dbg !114
  %41 = getelementptr inbounds i32** %40, i64 3, !dbg !114
  %42 = load i32** %41, align 8, !dbg !114
  %43 = getelementptr inbounds i32* %42, i64 2, !dbg !114
  %44 = load i32* %43, align 4, !dbg !114
  %45 = load i32*** %mm, align 8, !dbg !114
  %46 = getelementptr inbounds i32** %45, i64 4, !dbg !114
  %47 = load i32** %46, align 8, !dbg !114
  %48 = getelementptr inbounds i32* %47, i64 4, !dbg !114
  %49 = load i32* %48, align 4, !dbg !114
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %34, i32 %39, i32 %44, i32 %49), !dbg !114
  %51 = load i32*** %m1, align 8, !dbg !115
  call void @freematrix(i32 10, i32** %51), !dbg !115
  %52 = load i32*** %m2, align 8, !dbg !116
  call void @freematrix(i32 10, i32** %52), !dbg !116
  %53 = load i32*** %mm, align 8, !dbg !117
  call void @freematrix(i32 10, i32** %53), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @printf(i8*, ...) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!26, !27}
!llvm.ident = !{!28}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = metadata !{metadata !"matrix.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !14, metadata !17, metadata !20}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mkmatrix", metadata !"mkmatrix", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32** (i32, i32)* @mkmatrix, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"zeromatrix", metadata !"zeromatrix", metadata !"", i32 24, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, i32**)* @zeromatrix, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{null, metadata !10, metadata !10, metadata !8}
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"freematrix", metadata !"freematrix", metadata !"", i32 31, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32**)* @freematrix, null, null, metadata !2, i32 31} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !10, metadata !8}
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mmult", metadata !"mmult", metadata !"", i32 36, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, metadata !2, i32 36} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !8, metadata !10, metadata !10, metadata !8, metadata !8, metadata !8}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 50, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 50} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{metadata !10, metadata !10, metadata !23}
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!25 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!26 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!27 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!28 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!29 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!30 = metadata !{i32 12, i32 0, metadata !4, null}
!31 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!32 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!33 = metadata !{i32 13, i32 0, metadata !4, null}
!34 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!35 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 13]
!36 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 14]
!37 = metadata !{i32 14, i32 0, metadata !4, null}
!38 = metadata !{i32 15, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!40 = metadata !{i32 16, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !39, i32 15, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!42 = metadata !{i32 17, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!44 = metadata !{i32 18, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !43, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!46 = metadata !{i32 19, i32 0, metadata !45, null}
!47 = metadata !{i32 20, i32 0, metadata !41, null}
!48 = metadata !{i32 21, i32 0, metadata !4, null}
!49 = metadata !{i32 786689, metadata !11, metadata !"rows", metadata !5, i32 16777240, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!50 = metadata !{i32 24, i32 0, metadata !11, null}
!51 = metadata !{i32 786689, metadata !11, metadata !"cols", metadata !5, i32 33554456, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!52 = metadata !{i32 786689, metadata !11, metadata !"m", metadata !5, i32 50331672, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 24]
!53 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!54 = metadata !{i32 25, i32 0, metadata !11, null}
!55 = metadata !{i32 786688, metadata !11, metadata !"j", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!56 = metadata !{i32 26, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !11, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!58 = metadata !{i32 27, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !57, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!60 = metadata !{i32 28, i32 0, metadata !59, null}
!61 = metadata !{i32 29, i32 0, metadata !11, null}
!62 = metadata !{i32 786689, metadata !14, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!63 = metadata !{i32 31, i32 0, metadata !14, null}
!64 = metadata !{i32 786689, metadata !14, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 31]
!65 = metadata !{i32 32, i32 0, metadata !14, null}
!66 = metadata !{i32 32, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !14, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!68 = metadata !{i32 33, i32 0, metadata !14, null}
!69 = metadata !{i32 34, i32 0, metadata !14, null}
!70 = metadata !{i32 786689, metadata !17, metadata !"rows", metadata !5, i32 16777252, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!71 = metadata !{i32 36, i32 0, metadata !17, null}
!72 = metadata !{i32 786689, metadata !17, metadata !"cols", metadata !5, i32 33554468, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!73 = metadata !{i32 786689, metadata !17, metadata !"m1", metadata !5, i32 50331684, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!74 = metadata !{i32 786689, metadata !17, metadata !"m2", metadata !5, i32 67108900, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!75 = metadata !{i32 786689, metadata !17, metadata !"m3", metadata !5, i32 83886116, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!76 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 37]
!77 = metadata !{i32 37, i32 0, metadata !17, null}
!78 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 37]
!79 = metadata !{i32 786688, metadata !17, metadata !"k", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 37]
!80 = metadata !{i32 786688, metadata !17, metadata !"val", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 37]
!81 = metadata !{i32 38, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !17, i32 38, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!83 = metadata !{i32 39, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !85, i32 39, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 38, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!86 = metadata !{i32 40, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !84, i32 39, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!88 = metadata !{i32 41, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !87, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!90 = metadata !{i32 42, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 41, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!92 = metadata !{i32 43, i32 0, metadata !91, null}
!93 = metadata !{i32 44, i32 0, metadata !87, null}
!94 = metadata !{i32 45, i32 0, metadata !87, null}
!95 = metadata !{i32 46, i32 0, metadata !85, null}
!96 = metadata !{i32 47, i32 0, metadata !17, null}
!97 = metadata !{i32 786689, metadata !20, metadata !"argc", metadata !5, i32 16777266, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!98 = metadata !{i32 50, i32 0, metadata !20, null}
!99 = metadata !{i32 786689, metadata !20, metadata !"argv", metadata !5, i32 33554482, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!100 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!101 = metadata !{i32 56, i32 0, metadata !20, null}
!102 = metadata !{i32 786688, metadata !20, metadata !"n", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 56]
!103 = metadata !{i32 786688, metadata !20, metadata !"m1", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m1] [line 58]
!104 = metadata !{i32 58, i32 0, metadata !20, null} ; [ DW_TAG_imported_module ]
!105 = metadata !{i32 786688, metadata !20, metadata !"m2", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 59]
!106 = metadata !{i32 59, i32 0, metadata !20, null}
!107 = metadata !{i32 786688, metadata !20, metadata !"mm", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mm] [line 60]
!108 = metadata !{i32 60, i32 0, metadata !20, null}
!109 = metadata !{i32 62, i32 0, metadata !110, null}
!110 = metadata !{i32 786443, metadata !1, metadata !20, i32 62, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!111 = metadata !{i32 63, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !110, i32 62, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!113 = metadata !{i32 64, i32 0, metadata !112, null}
!114 = metadata !{i32 65, i32 0, metadata !20, null}
!115 = metadata !{i32 67, i32 0, metadata !20, null}
!116 = metadata !{i32 68, i32 0, metadata !20, null}
!117 = metadata !{i32 69, i32 0, metadata !20, null}
!118 = metadata !{i32 70, i32 0, metadata !20, null}
