; ModuleID = 'bubblesort.o0.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %0*, %0*, i32 }
%1 = type { i32, i32 }
%2 = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %0* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %1] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@z = common global [257 x %2] zeroinitializer, align 16
@w = common global [257 x %2] zeroinitializer, align 16
@e = common global [130 x %2] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@0 = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, i64* @seed, align 8
  %5 = load i64* @seed, align 8
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  call void @Initrand()
  store i32 0, i32* @biggest, align 4
  store i32 0, i32* @littlest, align 4
  store i32 1, i32* %1, align 4
  br label %3

; <label>:3                                       ; preds = %44, %0
  %4 = load i32* %1, align 4
  %5 = icmp sle i32 %4, 500
  br i1 %5, label %6, label %47

; <label>:6                                       ; preds = %3
  %7 = call i32 @Rand()
  %8 = sext i32 %7 to i64
  store i64 %8, i64* %2, align 8
  %9 = load i64* %2, align 8
  %10 = load i64* %2, align 8
  %11 = sdiv i64 %10, 100000
  %12 = mul nsw i64 %11, 100000
  %13 = sub nsw i64 %9, %12
  %14 = sub nsw i64 %13, 50000
  %15 = trunc i64 %14 to i32
  %16 = load i32* %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %17
  store i32 %15, i32* %18, align 4
  %19 = load i32* %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = load i32* @biggest, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %30

; <label>:25                                      ; preds = %6
  %26 = load i32* %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %27
  %29 = load i32* %28, align 4
  store i32 %29, i32* @biggest, align 4
  br label %43

; <label>:30                                      ; preds = %6
  %31 = load i32* %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = load i32* @littlest, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %42

; <label>:37                                      ; preds = %30
  %38 = load i32* %1, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %39
  %41 = load i32* %40, align 4
  store i32 %41, i32* @littlest, align 4
  br label %42

; <label>:42                                      ; preds = %37, %30
  br label %43

; <label>:43                                      ; preds = %42, %25
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %1, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %1, align 4
  br label %3

; <label>:47                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @Bubble(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @bInitarr()
  store i32 500, i32* @top, align 4
  br label %5

; <label>:5                                       ; preds = %45, %1
  %6 = load i32* @top, align 4
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %8, label %48

; <label>:8                                       ; preds = %5
  store i32 1, i32* %3, align 4
  br label %9

; <label>:9                                       ; preds = %42, %8
  %10 = load i32* %3, align 4
  %11 = load i32* @top, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %45

; <label>:13                                      ; preds = %9
  %14 = load i32* %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = load i32* %3, align 4
  %19 = add nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = icmp sgt i32 %17, %22
  br i1 %23, label %24, label %42

; <label>:24                                      ; preds = %13
  %25 = load i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %26
  %28 = load i32* %27, align 4
  store i32 %28, i32* %4, align 4
  %29 = load i32* %3, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %31
  %33 = load i32* %32, align 4
  %34 = load i32* %3, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %35
  store i32 %33, i32* %36, align 4
  %37 = load i32* %4, align 4
  %38 = load i32* %3, align 4
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %40
  store i32 %37, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %24, %13
  %43 = load i32* %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %3, align 4
  br label %9

; <label>:45                                      ; preds = %9
  %46 = load i32* @top, align 4
  %47 = sub nsw i32 %46, 1
  store i32 %47, i32* @top, align 4
  br label %5

; <label>:48                                      ; preds = %5
  %49 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 1), align 4
  %50 = load i32* @littlest, align 4
  %51 = icmp ne i32 %49, %50
  br i1 %51, label %56, label %52

; <label>:52                                      ; preds = %48
  %53 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 500), align 4
  %54 = load i32* @biggest, align 4
  %55 = icmp ne i32 %53, %54
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %52, %48
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @0, i32 0, i32 0))
  br label %58

; <label>:58                                      ; preds = %56, %52
  %59 = load i32* %2, align 4
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %61
  %63 = load i32* %62, align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @1, i32 0, i32 0), i32 %63)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %2, align 4
  br label %3

; <label>:3                                       ; preds = %8, %0
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %3
  %7 = load i32* %2, align 4
  call void @Bubble(i32 %7)
  br label %8

; <label>:8                                       ; preds = %6
  %9 = load i32* %2, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %2, align 4
  br label %3

; <label>:11                                      ; preds = %3
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
