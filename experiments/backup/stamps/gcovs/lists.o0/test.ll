; ModuleID = 'lists.o0.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, %0*, %0* }

@0 = private unnamed_addr constant [12 x i8] c"length: %d\0A\00", align 1
@1 = private unnamed_addr constant [28 x i8] c"i:%3d  v:%3d  n:%3d  p:%3d\0A\00", align 1
@2 = private unnamed_addr constant [34 x i8] c"[last entry points to list head]\0A\00", align 1
@3 = private unnamed_addr constant [31 x i8] c"[val of next of tail is:  %d]\0A\00", align 1
@4 = private unnamed_addr constant [27 x i8] c"li2 and li1 are not equal\0A\00", align 1
@5 = private unnamed_addr constant [25 x i8] c"li2 should be empty now\0A\00", align 1
@6 = private unnamed_addr constant [25 x i8] c"li3 should be empty now\0A\00", align 1
@7 = private unnamed_addr constant [42 x i8] c"li1 first value wrong, wanted %d, got %d\0A\00", align 1
@8 = private unnamed_addr constant [37 x i8] c"last value wrong, wanted %d, got %d\0A\00", align 1
@9 = private unnamed_addr constant [42 x i8] c"li2 first value wrong, wanted %d, got %d\0A\00", align 1
@10 = private unnamed_addr constant [35 x i8] c"li1 size wrong, wanted %d, got %d\0A\00", align 1
@11 = private unnamed_addr constant [27 x i8] c"li1 and li2 are not equal\0A\00", align 1
@12 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @list_push_tail(%0*, %0*) #0 {
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  %5 = alloca %0*, align 8
  store %0* %0, %0** %3, align 8
  store %0* %1, %0** %4, align 8
  %6 = load %0** %3, align 8
  %7 = getelementptr inbounds %0* %6, i32 0, i32 2
  %8 = load %0** %7, align 8
  store %0* %8, %0** %5, align 8
  %9 = load %0** %4, align 8
  %10 = load %0** %5, align 8
  %11 = getelementptr inbounds %0* %10, i32 0, i32 1
  store %0* %9, %0** %11, align 8
  %12 = load %0** %3, align 8
  %13 = load %0** %4, align 8
  %14 = getelementptr inbounds %0* %13, i32 0, i32 1
  store %0* %12, %0** %14, align 8
  %15 = load %0** %4, align 8
  %16 = load %0** %3, align 8
  %17 = getelementptr inbounds %0* %16, i32 0, i32 2
  store %0* %15, %0** %17, align 8
  %18 = load %0** %5, align 8
  %19 = load %0** %4, align 8
  %20 = getelementptr inbounds %0* %19, i32 0, i32 2
  store %0* %18, %0** %20, align 8
  %21 = load %0** %3, align 8
  %22 = getelementptr inbounds %0* %21, i32 0, i32 0
  %23 = load i32* %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %22, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %0* @list_pop_tail(%0*) #0 {
  %2 = alloca %0*, align 8
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  %5 = alloca %0*, align 8
  store %0* %0, %0** %3, align 8
  %6 = load %0** %3, align 8
  %7 = call i32 @13(%0* %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %1
  store %0* null, %0** %2
  br label %28

; <label>:10                                      ; preds = %1
  %11 = load %0** %3, align 8
  %12 = getelementptr inbounds %0* %11, i32 0, i32 2
  %13 = load %0** %12, align 8
  store %0* %13, %0** %5, align 8
  %14 = load %0** %5, align 8
  %15 = getelementptr inbounds %0* %14, i32 0, i32 2
  %16 = load %0** %15, align 8
  store %0* %16, %0** %4, align 8
  %17 = load %0** %3, align 8
  %18 = load %0** %4, align 8
  %19 = getelementptr inbounds %0* %18, i32 0, i32 1
  store %0* %17, %0** %19, align 8
  %20 = load %0** %4, align 8
  %21 = load %0** %3, align 8
  %22 = getelementptr inbounds %0* %21, i32 0, i32 2
  store %0* %20, %0** %22, align 8
  %23 = load %0** %3, align 8
  %24 = getelementptr inbounds %0* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* %24, align 4
  %27 = load %0** %5, align 8
  store %0* %27, %0** %2
  br label %28

; <label>:28                                      ; preds = %10, %9
  %29 = load %0** %2
  ret %0* %29
}

; Function Attrs: nounwind uwtable
define void @list_push_head(%0*, %0*) #0 {
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  %5 = alloca %0*, align 8
  store %0* %0, %0** %3, align 8
  store %0* %1, %0** %4, align 8
  %6 = load %0** %3, align 8
  %7 = getelementptr inbounds %0* %6, i32 0, i32 1
  %8 = load %0** %7, align 8
  store %0* %8, %0** %5, align 8
  %9 = load %0** %4, align 8
  %10 = load %0** %3, align 8
  %11 = getelementptr inbounds %0* %10, i32 0, i32 1
  store %0* %9, %0** %11, align 8
  %12 = load %0** %4, align 8
  %13 = load %0** %5, align 8
  %14 = getelementptr inbounds %0* %13, i32 0, i32 2
  store %0* %12, %0** %14, align 8
  %15 = load %0** %5, align 8
  %16 = load %0** %4, align 8
  %17 = getelementptr inbounds %0* %16, i32 0, i32 1
  store %0* %15, %0** %17, align 8
  %18 = load %0** %3, align 8
  %19 = load %0** %4, align 8
  %20 = getelementptr inbounds %0* %19, i32 0, i32 2
  store %0* %18, %0** %20, align 8
  %21 = load %0** %3, align 8
  %22 = getelementptr inbounds %0* %21, i32 0, i32 0
  %23 = load i32* %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %22, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %0* @list_pop_head(%0*) #0 {
  %2 = alloca %0*, align 8
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  store %0* %0, %0** %3, align 8
  %5 = load %0** %3, align 8
  %6 = call i32 @13(%0* %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %1
  store %0* null, %0** %2
  br label %28

; <label>:9                                       ; preds = %1
  %10 = load %0** %3, align 8
  %11 = getelementptr inbounds %0* %10, i32 0, i32 1
  %12 = load %0** %11, align 8
  store %0* %12, %0** %4, align 8
  %13 = load %0** %4, align 8
  %14 = getelementptr inbounds %0* %13, i32 0, i32 1
  %15 = load %0** %14, align 8
  %16 = load %0** %3, align 8
  %17 = getelementptr inbounds %0* %16, i32 0, i32 1
  store %0* %15, %0** %17, align 8
  %18 = load %0** %3, align 8
  %19 = load %0** %4, align 8
  %20 = getelementptr inbounds %0* %19, i32 0, i32 1
  %21 = load %0** %20, align 8
  %22 = getelementptr inbounds %0* %21, i32 0, i32 2
  store %0* %18, %0** %22, align 8
  %23 = load %0** %3, align 8
  %24 = getelementptr inbounds %0* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* %24, align 4
  %27 = load %0** %4, align 8
  store %0* %27, %0** %2
  br label %28

; <label>:28                                      ; preds = %9, %8
  %29 = load %0** %2
  ret %0* %29
}

; Function Attrs: nounwind uwtable
define i32 @list_equal(%0*, %0*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %0*, align 8
  %5 = alloca %0*, align 8
  %6 = alloca %0*, align 8
  %7 = alloca %0*, align 8
  store %0* %0, %0** %4, align 8
  store %0* %1, %0** %5, align 8
  %8 = load %0** %4, align 8
  store %0* %8, %0** %6, align 8
  %9 = load %0** %5, align 8
  store %0* %9, %0** %7, align 8
  br label %10

; <label>:10                                      ; preds = %26, %2
  %11 = load %0** %6, align 8
  %12 = getelementptr inbounds %0* %11, i32 0, i32 1
  %13 = load %0** %12, align 8
  %14 = load %0** %4, align 8
  %15 = icmp ne %0* %13, %14
  br i1 %15, label %16, label %33

; <label>:16                                      ; preds = %10
  %17 = load %0** %6, align 8
  %18 = getelementptr inbounds %0* %17, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = load %0** %7, align 8
  %21 = getelementptr inbounds %0* %20, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %19, %22
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %16
  store i32 0, i32* %3
  br label %49

; <label>:25                                      ; preds = %16
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load %0** %6, align 8
  %28 = getelementptr inbounds %0* %27, i32 0, i32 1
  %29 = load %0** %28, align 8
  store %0* %29, %0** %6, align 8
  %30 = load %0** %7, align 8
  %31 = getelementptr inbounds %0* %30, i32 0, i32 1
  %32 = load %0** %31, align 8
  store %0* %32, %0** %7, align 8
  br label %10

; <label>:33                                      ; preds = %10
  %34 = load %0** %6, align 8
  %35 = getelementptr inbounds %0* %34, i32 0, i32 0
  %36 = load i32* %35, align 4
  %37 = load %0** %7, align 8
  %38 = getelementptr inbounds %0* %37, i32 0, i32 0
  %39 = load i32* %38, align 4
  %40 = icmp ne i32 %36, %39
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %33
  store i32 0, i32* %3
  br label %49

; <label>:42                                      ; preds = %33
  %43 = load %0** %7, align 8
  %44 = getelementptr inbounds %0* %43, i32 0, i32 1
  %45 = load %0** %44, align 8
  %46 = load %0** %5, align 8
  %47 = icmp eq %0* %45, %46
  %48 = zext i1 %47 to i32
  store i32 %48, i32* %3
  br label %49

; <label>:49                                      ; preds = %42, %41, %24
  %50 = load i32* %3
  ret i32 %50
}

; Function Attrs: nounwind uwtable
define void @list_print(i8*, %0*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %0*, align 8
  %5 = alloca %0*, align 8
  %6 = alloca %0*, align 8
  %7 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store %0* %1, %0** %4, align 8
  %8 = load %0** %4, align 8
  %9 = getelementptr inbounds %0* %8, i32 0, i32 1
  %10 = load %0** %9, align 8
  store %0* %10, %0** %6, align 8
  store i32 0, i32* %7, align 4
  %11 = load i8** %3, align 8
  %12 = call i32 @puts(i8* %11)
  %13 = load %0** %4, align 8
  %14 = call i32 @14(%0* %13)
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @0, i32 0, i32 0), i32 %14)
  %16 = load %0** %4, align 8
  %17 = getelementptr inbounds %0* %16, i32 0, i32 1
  %18 = load %0** %17, align 8
  store %0* %18, %0** %5, align 8
  br label %19

; <label>:19                                      ; preds = %42, %2
  %20 = load %0** %5, align 8
  %21 = getelementptr inbounds %0* %20, i32 0, i32 1
  %22 = load %0** %21, align 8
  %23 = load %0** %6, align 8
  %24 = icmp ne %0* %22, %23
  br i1 %24, label %25, label %46

; <label>:25                                      ; preds = %19
  %26 = load i32* %7, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %7, align 4
  %28 = load %0** %5, align 8
  %29 = getelementptr inbounds %0* %28, i32 0, i32 0
  %30 = load i32* %29, align 4
  %31 = load %0** %5, align 8
  %32 = getelementptr inbounds %0* %31, i32 0, i32 1
  %33 = load %0** %32, align 8
  %34 = getelementptr inbounds %0* %33, i32 0, i32 0
  %35 = load i32* %34, align 4
  %36 = load %0** %5, align 8
  %37 = getelementptr inbounds %0* %36, i32 0, i32 2
  %38 = load %0** %37, align 8
  %39 = getelementptr inbounds %0* %38, i32 0, i32 0
  %40 = load i32* %39, align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @1, i32 0, i32 0), i32 %27, i32 %30, i32 %35, i32 %40)
  br label %42

; <label>:42                                      ; preds = %25
  %43 = load %0** %5, align 8
  %44 = getelementptr inbounds %0* %43, i32 0, i32 1
  %45 = load %0** %44, align 8
  store %0* %45, %0** %5, align 8
  br label %19

; <label>:46                                      ; preds = %19
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @2, i32 0, i32 0))
  %48 = load %0** %5, align 8
  %49 = getelementptr inbounds %0* %48, i32 0, i32 1
  %50 = load %0** %49, align 8
  %51 = getelementptr inbounds %0* %50, i32 0, i32 0
  %52 = load i32* %51, align 4
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @3, i32 0, i32 0), i32 %52)
  ret void
}

declare i32 @puts(i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define %0* @list_new() #0 {
  %1 = alloca %0*, align 8
  %2 = call noalias i8* @malloc(i64 24) #5
  %3 = bitcast i8* %2 to %0*
  store %0* %3, %0** %1, align 8
  %4 = load %0** %1, align 8
  %5 = load %0** %1, align 8
  %6 = getelementptr inbounds %0* %5, i32 0, i32 1
  store %0* %4, %0** %6, align 8
  %7 = load %0** %1, align 8
  %8 = load %0** %1, align 8
  %9 = getelementptr inbounds %0* %8, i32 0, i32 2
  store %0* %7, %0** %9, align 8
  %10 = load %0** %1, align 8
  %11 = getelementptr inbounds %0* %10, i32 0, i32 0
  store i32 0, i32* %11, align 4
  %12 = load %0** %1, align 8
  ret %0* %12
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %0* @list_sequence(i32, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %0*, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %10 = load i32* %3, align 4
  %11 = load i32* %4, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %2
  %14 = load i32* %3, align 4
  store i32 %14, i32* %6, align 4
  %15 = load i32* %4, align 4
  store i32 %15, i32* %3, align 4
  %16 = load i32* %6, align 4
  store i32 %16, i32* %4, align 4
  br label %17

; <label>:17                                      ; preds = %13, %2
  %18 = load i32* %4, align 4
  %19 = load i32* %3, align 4
  %20 = sub nsw i32 %18, %19
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %5, align 4
  %22 = load i32* %5, align 4
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 24
  %26 = call noalias i8* @malloc(i64 %25) #5
  %27 = bitcast i8* %26 to %0*
  store %0* %27, %0** %9, align 8
  %28 = load i32* %3, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, i32* %3, align 4
  store i32 0, i32* %7, align 4
  store i32 1, i32* %8, align 4
  br label %30

; <label>:30                                      ; preds = %62, %17
  %31 = load i32* %7, align 4
  %32 = load i32* %5, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %67

; <label>:34                                      ; preds = %30
  %35 = load i32* %7, align 4
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = load %0** %9, align 8
  %39 = getelementptr inbounds %0* %38, i64 %37
  %40 = load i32* %7, align 4
  %41 = sext i32 %40 to i64
  %42 = load %0** %9, align 8
  %43 = getelementptr inbounds %0* %42, i64 %41
  %44 = getelementptr inbounds %0* %43, i32 0, i32 1
  store %0* %39, %0** %44, align 8
  %45 = load i32* %8, align 4
  %46 = sub nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = load %0** %9, align 8
  %49 = getelementptr inbounds %0* %48, i64 %47
  %50 = load i32* %8, align 4
  %51 = sext i32 %50 to i64
  %52 = load %0** %9, align 8
  %53 = getelementptr inbounds %0* %52, i64 %51
  %54 = getelementptr inbounds %0* %53, i32 0, i32 2
  store %0* %49, %0** %54, align 8
  %55 = load i32* %3, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %3, align 4
  %57 = load i32* %7, align 4
  %58 = sext i32 %57 to i64
  %59 = load %0** %9, align 8
  %60 = getelementptr inbounds %0* %59, i64 %58
  %61 = getelementptr inbounds %0* %60, i32 0, i32 0
  store i32 %55, i32* %61, align 4
  br label %62

; <label>:62                                      ; preds = %34
  %63 = load i32* %7, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %7, align 4
  %65 = load i32* %8, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %8, align 4
  br label %30

; <label>:67                                      ; preds = %30
  %68 = load i32* %5, align 4
  %69 = sext i32 %68 to i64
  %70 = load %0** %9, align 8
  %71 = getelementptr inbounds %0* %70, i64 %69
  %72 = load %0** %9, align 8
  %73 = getelementptr inbounds %0* %72, i64 0
  %74 = getelementptr inbounds %0* %73, i32 0, i32 2
  store %0* %71, %0** %74, align 8
  %75 = load %0** %9, align 8
  %76 = getelementptr inbounds %0* %75, i64 0
  %77 = load i32* %5, align 4
  %78 = sext i32 %77 to i64
  %79 = load %0** %9, align 8
  %80 = getelementptr inbounds %0* %79, i64 %78
  %81 = getelementptr inbounds %0* %80, i32 0, i32 1
  store %0* %76, %0** %81, align 8
  %82 = load i32* %5, align 4
  %83 = sub nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = load %0** %9, align 8
  %86 = getelementptr inbounds %0* %85, i64 %84
  %87 = load i32* %5, align 4
  %88 = sext i32 %87 to i64
  %89 = load %0** %9, align 8
  %90 = getelementptr inbounds %0* %89, i64 %88
  %91 = getelementptr inbounds %0* %90, i32 0, i32 2
  store %0* %86, %0** %91, align 8
  %92 = load i32* %3, align 4
  %93 = load i32* %5, align 4
  %94 = sext i32 %93 to i64
  %95 = load %0** %9, align 8
  %96 = getelementptr inbounds %0* %95, i64 %94
  %97 = getelementptr inbounds %0* %96, i32 0, i32 0
  store i32 %92, i32* %97, align 4
  %98 = load i32* %5, align 4
  %99 = load %0** %9, align 8
  %100 = getelementptr inbounds %0* %99, i64 0
  %101 = getelementptr inbounds %0* %100, i32 0, i32 0
  store i32 %98, i32* %101, align 4
  %102 = load %0** %9, align 8
  ret %0* %102
}

; Function Attrs: nounwind uwtable
define %0* @list_copy(%0*) #0 {
  %2 = alloca %0*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %0*, align 8
  %7 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %8 = load %0** %2, align 8
  %9 = call i32 @14(%0* %8)
  store i32 %9, i32* %5, align 4
  %10 = load i32* %5, align 4
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 24
  %14 = call noalias i8* @malloc(i64 %13) #5
  %15 = bitcast i8* %14 to %0*
  store %0* %15, %0** %7, align 8
  store i32 0, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %16 = load %0** %2, align 8
  store %0* %16, %0** %6, align 8
  br label %17

; <label>:17                                      ; preds = %48, %1
  %18 = load i32* %3, align 4
  %19 = load i32* %5, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %56

; <label>:21                                      ; preds = %17
  %22 = load i32* %4, align 4
  %23 = sext i32 %22 to i64
  %24 = load %0** %7, align 8
  %25 = getelementptr inbounds %0* %24, i64 %23
  %26 = load i32* %3, align 4
  %27 = sext i32 %26 to i64
  %28 = load %0** %7, align 8
  %29 = getelementptr inbounds %0* %28, i64 %27
  %30 = getelementptr inbounds %0* %29, i32 0, i32 1
  store %0* %25, %0** %30, align 8
  %31 = load i32* %3, align 4
  %32 = sext i32 %31 to i64
  %33 = load %0** %7, align 8
  %34 = getelementptr inbounds %0* %33, i64 %32
  %35 = load i32* %4, align 4
  %36 = sext i32 %35 to i64
  %37 = load %0** %7, align 8
  %38 = getelementptr inbounds %0* %37, i64 %36
  %39 = getelementptr inbounds %0* %38, i32 0, i32 2
  store %0* %34, %0** %39, align 8
  %40 = load %0** %6, align 8
  %41 = getelementptr inbounds %0* %40, i32 0, i32 0
  %42 = load i32* %41, align 4
  %43 = load i32* %3, align 4
  %44 = sext i32 %43 to i64
  %45 = load %0** %7, align 8
  %46 = getelementptr inbounds %0* %45, i64 %44
  %47 = getelementptr inbounds %0* %46, i32 0, i32 0
  store i32 %42, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %21
  %49 = load i32* %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %3, align 4
  %51 = load i32* %4, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %4, align 4
  %53 = load %0** %6, align 8
  %54 = getelementptr inbounds %0* %53, i32 0, i32 1
  %55 = load %0** %54, align 8
  store %0* %55, %0** %6, align 8
  br label %17

; <label>:56                                      ; preds = %17
  %57 = load i32* %5, align 4
  %58 = sext i32 %57 to i64
  %59 = load %0** %7, align 8
  %60 = getelementptr inbounds %0* %59, i64 %58
  %61 = load %0** %7, align 8
  %62 = getelementptr inbounds %0* %61, i64 0
  %63 = getelementptr inbounds %0* %62, i32 0, i32 2
  store %0* %60, %0** %63, align 8
  %64 = load %0** %7, align 8
  %65 = getelementptr inbounds %0* %64, i64 0
  %66 = load i32* %5, align 4
  %67 = sext i32 %66 to i64
  %68 = load %0** %7, align 8
  %69 = getelementptr inbounds %0* %68, i64 %67
  %70 = getelementptr inbounds %0* %69, i32 0, i32 1
  store %0* %65, %0** %70, align 8
  %71 = load %0** %2, align 8
  %72 = call %0* @15(%0* %71)
  %73 = getelementptr inbounds %0* %72, i32 0, i32 0
  %74 = load i32* %73, align 4
  %75 = load i32* %5, align 4
  %76 = sext i32 %75 to i64
  %77 = load %0** %7, align 8
  %78 = getelementptr inbounds %0* %77, i64 %76
  %79 = getelementptr inbounds %0* %78, i32 0, i32 0
  store i32 %74, i32* %79, align 4
  %80 = load %0** %7, align 8
  ret %0* %80
}

; Function Attrs: nounwind uwtable
define void @list_reverse(%0*) #0 {
  %2 = alloca %0*, align 8
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %5 = load %0** %2, align 8
  store %0* %5, %0** %4, align 8
  br label %6

; <label>:6                                       ; preds = %19, %1
  %7 = load %0** %4, align 8
  %8 = getelementptr inbounds %0* %7, i32 0, i32 1
  %9 = load %0** %8, align 8
  store %0* %9, %0** %3, align 8
  %10 = load %0** %4, align 8
  %11 = getelementptr inbounds %0* %10, i32 0, i32 2
  %12 = load %0** %11, align 8
  %13 = load %0** %4, align 8
  %14 = getelementptr inbounds %0* %13, i32 0, i32 1
  store %0* %12, %0** %14, align 8
  %15 = load %0** %3, align 8
  %16 = load %0** %4, align 8
  %17 = getelementptr inbounds %0* %16, i32 0, i32 2
  store %0* %15, %0** %17, align 8
  %18 = load %0** %3, align 8
  store %0* %18, %0** %4, align 8
  br label %19

; <label>:19                                      ; preds = %6
  %20 = load %0** %4, align 8
  %21 = load %0** %2, align 8
  %22 = icmp ne %0* %20, %21
  br i1 %22, label %6, label %23

; <label>:23                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @test_lists() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %0*, align 8
  %3 = alloca %0*, align 8
  %4 = alloca %0*, align 8
  store i32 0, i32* %1, align 4
  %5 = call %0* @list_sequence(i32 1, i32 100)
  store %0* %5, %0** %2, align 8
  %6 = load %0** %2, align 8
  %7 = call %0* @list_copy(%0* %6)
  store %0* %7, %0** %3, align 8
  %8 = call %0* @list_new()
  store %0* %8, %0** %4, align 8
  %9 = load %0** %3, align 8
  %10 = load %0** %2, align 8
  %11 = call i32 @list_equal(%0* %9, %0* %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13                                      ; preds = %0
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @4, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %21, %15
  %17 = load %0** %3, align 8
  %18 = call i32 @13(%0* %17)
  %19 = icmp ne i32 %18, 0
  %20 = xor i1 %19, true
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %16
  %22 = load %0** %4, align 8
  %23 = load %0** %3, align 8
  %24 = call %0* @list_pop_head(%0* %23)
  call void @list_push_tail(%0* %22, %0* %24)
  br label %16

; <label>:25                                      ; preds = %16
  %26 = load %0** %3, align 8
  %27 = call i32 @13(%0* %26)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29                                      ; preds = %25
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @5, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:31                                      ; preds = %25
  br label %32

; <label>:32                                      ; preds = %37, %31
  %33 = load %0** %4, align 8
  %34 = call i32 @13(%0* %33)
  %35 = icmp ne i32 %34, 0
  %36 = xor i1 %35, true
  br i1 %36, label %37, label %41

; <label>:37                                      ; preds = %32
  %38 = load %0** %3, align 8
  %39 = load %0** %4, align 8
  %40 = call %0* @list_pop_tail(%0* %39)
  call void @list_push_tail(%0* %38, %0* %40)
  br label %32

; <label>:41                                      ; preds = %32
  %42 = load %0** %4, align 8
  %43 = call i32 @13(%0* %42)
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %47, label %45

; <label>:45                                      ; preds = %41
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @6, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:47                                      ; preds = %41
  %48 = load %0** %2, align 8
  call void @list_reverse(%0* %48)
  %49 = load %0** %2, align 8
  %50 = call %0* @16(%0* %49)
  %51 = getelementptr inbounds %0* %50, i32 0, i32 0
  %52 = load i32* %51, align 4
  %53 = icmp ne i32 %52, 100
  br i1 %53, label %54, label %60

; <label>:54                                      ; preds = %47
  %55 = load %0** %2, align 8
  %56 = call %0* @16(%0* %55)
  %57 = getelementptr inbounds %0* %56, i32 0, i32 0
  %58 = load i32* %57, align 4
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @7, i32 0, i32 0), i32 100, i32 %58)
  call void @exit(i32 1) #6
  unreachable

; <label>:60                                      ; preds = %47
  %61 = load %0** %2, align 8
  %62 = call %0* @15(%0* %61)
  %63 = getelementptr inbounds %0* %62, i32 0, i32 0
  %64 = load i32* %63, align 4
  %65 = icmp ne i32 %64, 1
  br i1 %65, label %66, label %72

; <label>:66                                      ; preds = %60
  %67 = load %0** %2, align 8
  %68 = call %0* @15(%0* %67)
  %69 = getelementptr inbounds %0* %68, i32 0, i32 0
  %70 = load i32* %69, align 4
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @8, i32 0, i32 0), i32 100, i32 %70)
  call void @exit(i32 1) #6
  unreachable

; <label>:72                                      ; preds = %60
  %73 = load %0** %3, align 8
  %74 = call %0* @16(%0* %73)
  %75 = getelementptr inbounds %0* %74, i32 0, i32 0
  %76 = load i32* %75, align 4
  %77 = icmp ne i32 %76, 100
  br i1 %77, label %78, label %84

; <label>:78                                      ; preds = %72
  %79 = load %0** %3, align 8
  %80 = call %0* @16(%0* %79)
  %81 = getelementptr inbounds %0* %80, i32 0, i32 0
  %82 = load i32* %81, align 4
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @9, i32 0, i32 0), i32 100, i32 %82)
  call void @exit(i32 1) #6
  unreachable

; <label>:84                                      ; preds = %72
  %85 = load %0** %3, align 8
  %86 = call %0* @15(%0* %85)
  %87 = getelementptr inbounds %0* %86, i32 0, i32 0
  %88 = load i32* %87, align 4
  %89 = icmp ne i32 %88, 1
  br i1 %89, label %90, label %96

; <label>:90                                      ; preds = %84
  %91 = load %0** %3, align 8
  %92 = call %0* @15(%0* %91)
  %93 = getelementptr inbounds %0* %92, i32 0, i32 0
  %94 = load i32* %93, align 4
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @8, i32 0, i32 0), i32 100, i32 %94)
  call void @exit(i32 1) #6
  unreachable

; <label>:96                                      ; preds = %84
  %97 = load %0** %2, align 8
  %98 = call i32 @14(%0* %97)
  %99 = icmp ne i32 %98, 100
  br i1 %99, label %100, label %104

; <label>:100                                     ; preds = %96
  %101 = load %0** %2, align 8
  %102 = call i32 @14(%0* %101)
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @10, i32 0, i32 0), i32 100, i32 %102)
  call void @exit(i32 1) #6
  unreachable

; <label>:104                                     ; preds = %96
  %105 = load %0** %2, align 8
  %106 = load %0** %3, align 8
  %107 = call i32 @list_equal(%0* %105, %0* %106)
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %111, label %109

; <label>:109                                     ; preds = %104
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @11, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:111                                     ; preds = %104
  %112 = load %0** %2, align 8
  %113 = call i32 @14(%0* %112)
  store i32 %113, i32* %1, align 4
  %114 = load %0** %2, align 8
  %115 = bitcast %0* %114 to i8*
  call void @free(i8* %115) #5
  %116 = load %0** %3, align 8
  %117 = bitcast %0* %116 to i8*
  call void @free(i8* %117) #5
  %118 = load %0** %4, align 8
  %119 = bitcast %0* %118 to i8*
  call void @free(i8* %119) #5
  %120 = load i32* %1, align 4
  ret i32 %120
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %3
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %8 = load i32* %4, align 4
  %9 = icmp eq i32 %8, 2
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %2
  %11 = load i8*** %5, align 8
  %12 = getelementptr inbounds i8** %11, i64 1
  %13 = load i8** %12, align 8
  %14 = call i32 @atoi(i8* %13) #7
  br label %16

; <label>:15                                      ; preds = %2
  br label %16

; <label>:16                                      ; preds = %15, %10
  %17 = phi i32 [ %14, %10 ], [ 3000000, %15 ]
  store i32 %17, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %18

; <label>:18                                      ; preds = %22, %16
  %19 = load i32* %6, align 4
  %20 = add nsw i32 %19, -1
  store i32 %20, i32* %6, align 4
  %21 = icmp ne i32 %19, 0
  br i1 %21, label %22, label %24

; <label>:22                                      ; preds = %18
  %23 = call i32 @test_lists()
  store i32 %23, i32* %7, align 4
  br label %18

; <label>:24                                      ; preds = %18
  %25 = load i32* %7, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @12, i32 0, i32 0), i32 %25)
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind uwtable
define internal i32 @13(%0*) #0 {
  %2 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %3 = load %0** %2, align 8
  %4 = call i32 @14(%0* %3)
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define internal i32 @14(%0*) #0 {
  %2 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %3 = load %0** %2, align 8
  %4 = getelementptr inbounds %0* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal %0* @15(%0*) #0 {
  %2 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %3 = load %0** %2, align 8
  %4 = getelementptr inbounds %0* %3, i32 0, i32 2
  %5 = load %0** %4, align 8
  ret %0* %5
}

; Function Attrs: nounwind uwtable
define internal %0* @16(%0*) #0 {
  %2 = alloca %0*, align 8
  store %0* %0, %0** %2, align 8
  %3 = load %0** %2, align 8
  %4 = getelementptr inbounds %0* %3, i32 0, i32 1
  %5 = load %0** %4, align 8
  ret %0* %5
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang 64b6333290f9b7df5a25d4fba34611de3078a792) (llvm/ 0e9a38ba60be659d570af893e05c75b9f6cfe35d)"}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 2}
