; ModuleID = 'puzzle-stanford.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@piecemax = common global [13 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@kount = common global i32 0, align 4
@n = common global i32 0, align 4
@.str = private unnamed_addr constant [18 x i8] c"Error1 in Puzzle\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"Error2 in Puzzle.\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Error3 in Puzzle.\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@top = common global i32 0, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !110
  %2 = mul nsw i64 %1, 1309, !dbg !110
  %3 = add nsw i64 %2, 13849, !dbg !110
  %4 = and i64 %3, 65535, !dbg !110
  store i64 %4, i64* @seed, align 8, !dbg !110
  %5 = load i64* @seed, align 8, !dbg !111
  %6 = trunc i64 %5 to i32, !dbg !111
  ret i32 %6, !dbg !111
}

; Function Attrs: nounwind uwtable
define i32 @Fit(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !112), !dbg !113
  store i32 %j, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !114), !dbg !113
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !115), !dbg !116
  store i32 0, i32* %k, align 4, !dbg !117
  br label %4, !dbg !117

; <label>:4                                       ; preds = %31, %0
  %5 = load i32* %k, align 4, !dbg !117
  %6 = load i32* %2, align 4, !dbg !117
  %7 = sext i32 %6 to i64, !dbg !117
  %8 = getelementptr inbounds [13 x i32]* @piecemax, i32 0, i64 %7, !dbg !117
  %9 = load i32* %8, align 4, !dbg !117
  %10 = icmp sle i32 %5, %9, !dbg !117
  br i1 %10, label %11, label %34, !dbg !117

; <label>:11                                      ; preds = %4
  %12 = load i32* %k, align 4, !dbg !119
  %13 = sext i32 %12 to i64, !dbg !119
  %14 = load i32* %2, align 4, !dbg !119
  %15 = sext i32 %14 to i64, !dbg !119
  %16 = getelementptr inbounds [13 x [512 x i32]]* @p, i32 0, i64 %15, !dbg !119
  %17 = getelementptr inbounds [512 x i32]* %16, i32 0, i64 %13, !dbg !119
  %18 = load i32* %17, align 4, !dbg !119
  %19 = icmp ne i32 %18, 0, !dbg !119
  br i1 %19, label %20, label %30, !dbg !119

; <label>:20                                      ; preds = %11
  %21 = load i32* %3, align 4, !dbg !121
  %22 = load i32* %k, align 4, !dbg !121
  %23 = add nsw i32 %21, %22, !dbg !121
  %24 = sext i32 %23 to i64, !dbg !121
  %25 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %24, !dbg !121
  %26 = load i32* %25, align 4, !dbg !121
  %27 = icmp ne i32 %26, 0, !dbg !121
  br i1 %27, label %28, label %29, !dbg !121

; <label>:28                                      ; preds = %20
  store i32 0, i32* %1, !dbg !121
  br label %35, !dbg !121

; <label>:29                                      ; preds = %20
  br label %30, !dbg !121

; <label>:30                                      ; preds = %29, %11
  br label %31, !dbg !119

; <label>:31                                      ; preds = %30
  %32 = load i32* %k, align 4, !dbg !117
  %33 = add nsw i32 %32, 1, !dbg !117
  store i32 %33, i32* %k, align 4, !dbg !117
  br label %4, !dbg !117

; <label>:34                                      ; preds = %4
  store i32 1, i32* %1, !dbg !123
  br label %35, !dbg !123

; <label>:35                                      ; preds = %34, %28
  %36 = load i32* %1, !dbg !124
  ret i32 %36, !dbg !124
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @Place(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !125), !dbg !126
  store i32 %j, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !127), !dbg !126
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !128), !dbg !129
  store i32 0, i32* %k, align 4, !dbg !130
  br label %4, !dbg !130

; <label>:4                                       ; preds = %27, %0
  %5 = load i32* %k, align 4, !dbg !130
  %6 = load i32* %2, align 4, !dbg !130
  %7 = sext i32 %6 to i64, !dbg !130
  %8 = getelementptr inbounds [13 x i32]* @piecemax, i32 0, i64 %7, !dbg !130
  %9 = load i32* %8, align 4, !dbg !130
  %10 = icmp sle i32 %5, %9, !dbg !130
  br i1 %10, label %11, label %30, !dbg !130

; <label>:11                                      ; preds = %4
  %12 = load i32* %k, align 4, !dbg !132
  %13 = sext i32 %12 to i64, !dbg !132
  %14 = load i32* %2, align 4, !dbg !132
  %15 = sext i32 %14 to i64, !dbg !132
  %16 = getelementptr inbounds [13 x [512 x i32]]* @p, i32 0, i64 %15, !dbg !132
  %17 = getelementptr inbounds [512 x i32]* %16, i32 0, i64 %13, !dbg !132
  %18 = load i32* %17, align 4, !dbg !132
  %19 = icmp ne i32 %18, 0, !dbg !132
  br i1 %19, label %20, label %26, !dbg !132

; <label>:20                                      ; preds = %11
  %21 = load i32* %3, align 4, !dbg !132
  %22 = load i32* %k, align 4, !dbg !132
  %23 = add nsw i32 %21, %22, !dbg !132
  %24 = sext i32 %23 to i64, !dbg !132
  %25 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %24, !dbg !132
  store i32 1, i32* %25, align 4, !dbg !132
  br label %26, !dbg !132

; <label>:26                                      ; preds = %20, %11
  br label %27, !dbg !132

; <label>:27                                      ; preds = %26
  %28 = load i32* %k, align 4, !dbg !130
  %29 = add nsw i32 %28, 1, !dbg !130
  store i32 %29, i32* %k, align 4, !dbg !130
  br label %4, !dbg !130

; <label>:30                                      ; preds = %4
  %31 = load i32* %2, align 4, !dbg !134
  %32 = sext i32 %31 to i64, !dbg !134
  %33 = getelementptr inbounds [13 x i32]* @class, i32 0, i64 %32, !dbg !134
  %34 = load i32* %33, align 4, !dbg !134
  %35 = sext i32 %34 to i64, !dbg !134
  %36 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i64 %35, !dbg !134
  %37 = load i32* %36, align 4, !dbg !134
  %38 = sub nsw i32 %37, 1, !dbg !134
  %39 = load i32* %2, align 4, !dbg !134
  %40 = sext i32 %39 to i64, !dbg !134
  %41 = getelementptr inbounds [13 x i32]* @class, i32 0, i64 %40, !dbg !134
  %42 = load i32* %41, align 4, !dbg !134
  %43 = sext i32 %42 to i64, !dbg !134
  %44 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i64 %43, !dbg !134
  store i32 %38, i32* %44, align 4, !dbg !134
  %45 = load i32* %3, align 4, !dbg !135
  store i32 %45, i32* %k, align 4, !dbg !135
  br label %46, !dbg !135

; <label>:46                                      ; preds = %58, %30
  %47 = load i32* %k, align 4, !dbg !135
  %48 = icmp sle i32 %47, 511, !dbg !135
  br i1 %48, label %49, label %61, !dbg !135

; <label>:49                                      ; preds = %46
  %50 = load i32* %k, align 4, !dbg !137
  %51 = sext i32 %50 to i64, !dbg !137
  %52 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %51, !dbg !137
  %53 = load i32* %52, align 4, !dbg !137
  %54 = icmp ne i32 %53, 0, !dbg !137
  br i1 %54, label %57, label %55, !dbg !137

; <label>:55                                      ; preds = %49
  %56 = load i32* %k, align 4, !dbg !137
  store i32 %56, i32* %1, !dbg !137
  br label %62, !dbg !137

; <label>:57                                      ; preds = %49
  br label %58, !dbg !137

; <label>:58                                      ; preds = %57
  %59 = load i32* %k, align 4, !dbg !135
  %60 = add nsw i32 %59, 1, !dbg !135
  store i32 %60, i32* %k, align 4, !dbg !135
  br label %46, !dbg !135

; <label>:61                                      ; preds = %46
  store i32 0, i32* %1, !dbg !139
  br label %62, !dbg !139

; <label>:62                                      ; preds = %61, %55
  %63 = load i32* %1, !dbg !140
  ret i32 %63, !dbg !140
}

; Function Attrs: nounwind uwtable
define void @Remove(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !141), !dbg !142
  store i32 %j, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !143), !dbg !142
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !144), !dbg !145
  store i32 0, i32* %k, align 4, !dbg !146
  br label %3, !dbg !146

; <label>:3                                       ; preds = %26, %0
  %4 = load i32* %k, align 4, !dbg !146
  %5 = load i32* %1, align 4, !dbg !146
  %6 = sext i32 %5 to i64, !dbg !146
  %7 = getelementptr inbounds [13 x i32]* @piecemax, i32 0, i64 %6, !dbg !146
  %8 = load i32* %7, align 4, !dbg !146
  %9 = icmp sle i32 %4, %8, !dbg !146
  br i1 %9, label %10, label %29, !dbg !146

; <label>:10                                      ; preds = %3
  %11 = load i32* %k, align 4, !dbg !148
  %12 = sext i32 %11 to i64, !dbg !148
  %13 = load i32* %1, align 4, !dbg !148
  %14 = sext i32 %13 to i64, !dbg !148
  %15 = getelementptr inbounds [13 x [512 x i32]]* @p, i32 0, i64 %14, !dbg !148
  %16 = getelementptr inbounds [512 x i32]* %15, i32 0, i64 %12, !dbg !148
  %17 = load i32* %16, align 4, !dbg !148
  %18 = icmp ne i32 %17, 0, !dbg !148
  br i1 %18, label %19, label %25, !dbg !148

; <label>:19                                      ; preds = %10
  %20 = load i32* %2, align 4, !dbg !148
  %21 = load i32* %k, align 4, !dbg !148
  %22 = add nsw i32 %20, %21, !dbg !148
  %23 = sext i32 %22 to i64, !dbg !148
  %24 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %23, !dbg !148
  store i32 0, i32* %24, align 4, !dbg !148
  br label %25, !dbg !148

; <label>:25                                      ; preds = %19, %10
  br label %26, !dbg !148

; <label>:26                                      ; preds = %25
  %27 = load i32* %k, align 4, !dbg !146
  %28 = add nsw i32 %27, 1, !dbg !146
  store i32 %28, i32* %k, align 4, !dbg !146
  br label %3, !dbg !146

; <label>:29                                      ; preds = %3
  %30 = load i32* %1, align 4, !dbg !150
  %31 = sext i32 %30 to i64, !dbg !150
  %32 = getelementptr inbounds [13 x i32]* @class, i32 0, i64 %31, !dbg !150
  %33 = load i32* %32, align 4, !dbg !150
  %34 = sext i32 %33 to i64, !dbg !150
  %35 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i64 %34, !dbg !150
  %36 = load i32* %35, align 4, !dbg !150
  %37 = add nsw i32 %36, 1, !dbg !150
  %38 = load i32* %1, align 4, !dbg !150
  %39 = sext i32 %38 to i64, !dbg !150
  %40 = getelementptr inbounds [13 x i32]* @class, i32 0, i64 %39, !dbg !150
  %41 = load i32* %40, align 4, !dbg !150
  %42 = sext i32 %41 to i64, !dbg !150
  %43 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i64 %42, !dbg !150
  store i32 %37, i32* %43, align 4, !dbg !150
  ret void, !dbg !151
}

; Function Attrs: nounwind uwtable
define i32 @Trial(i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %j, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !152), !dbg !153
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !154), !dbg !155
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !156), !dbg !155
  %3 = load i32* @kount, align 4, !dbg !157
  %4 = add nsw i32 %3, 1, !dbg !157
  store i32 %4, i32* @kount, align 4, !dbg !157
  store i32 0, i32* %i, align 4, !dbg !158
  br label %5, !dbg !158

; <label>:5                                       ; preds = %39, %0
  %6 = load i32* %i, align 4, !dbg !158
  %7 = icmp sle i32 %6, 12, !dbg !158
  br i1 %7, label %8, label %42, !dbg !158

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4, !dbg !160
  %10 = sext i32 %9 to i64, !dbg !160
  %11 = getelementptr inbounds [13 x i32]* @class, i32 0, i64 %10, !dbg !160
  %12 = load i32* %11, align 4, !dbg !160
  %13 = sext i32 %12 to i64, !dbg !160
  %14 = getelementptr inbounds [4 x i32]* @piececount, i32 0, i64 %13, !dbg !160
  %15 = load i32* %14, align 4, !dbg !160
  %16 = icmp ne i32 %15, 0, !dbg !160
  br i1 %16, label %17, label %38, !dbg !160

; <label>:17                                      ; preds = %8
  %18 = load i32* %i, align 4, !dbg !162
  %19 = load i32* %2, align 4, !dbg !162
  %20 = call i32 @Fit(i32 %18, i32 %19), !dbg !162
  %21 = icmp ne i32 %20, 0, !dbg !162
  br i1 %21, label %22, label %37, !dbg !162

; <label>:22                                      ; preds = %17
  %23 = load i32* %i, align 4, !dbg !164
  %24 = load i32* %2, align 4, !dbg !164
  %25 = call i32 @Place(i32 %23, i32 %24), !dbg !164
  store i32 %25, i32* %k, align 4, !dbg !164
  %26 = load i32* %k, align 4, !dbg !166
  %27 = call i32 @Trial(i32 %26), !dbg !166
  %28 = icmp ne i32 %27, 0, !dbg !166
  br i1 %28, label %32, label %29, !dbg !166

; <label>:29                                      ; preds = %22
  %30 = load i32* %k, align 4, !dbg !166
  %31 = icmp eq i32 %30, 0, !dbg !166
  br i1 %31, label %32, label %33, !dbg !166

; <label>:32                                      ; preds = %29, %22
  store i32 1, i32* %1, !dbg !166
  br label %43, !dbg !166

; <label>:33                                      ; preds = %29
  %34 = load i32* %i, align 4, !dbg !168
  %35 = load i32* %2, align 4, !dbg !168
  call void @Remove(i32 %34, i32 %35), !dbg !168
  br label %36

; <label>:36                                      ; preds = %33
  br label %37, !dbg !169

; <label>:37                                      ; preds = %36, %17
  br label %38, !dbg !170

; <label>:38                                      ; preds = %37, %8
  br label %39, !dbg !171

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4, !dbg !158
  %41 = add nsw i32 %40, 1, !dbg !158
  store i32 %41, i32* %i, align 4, !dbg !158
  br label %5, !dbg !158

; <label>:42                                      ; preds = %5
  store i32 0, i32* %1, !dbg !172
  br label %43, !dbg !172

; <label>:43                                      ; preds = %42, %32
  %44 = load i32* %1, !dbg !173
  ret i32 %44, !dbg !173
}

; Function Attrs: nounwind uwtable
define void @Puzzle() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %m = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !174), !dbg !175
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !176), !dbg !175
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !177), !dbg !175
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !178), !dbg !175
  store i32 0, i32* %m, align 4, !dbg !179
  br label %1, !dbg !179

; <label>:1                                       ; preds = %8, %0
  %2 = load i32* %m, align 4, !dbg !179
  %3 = icmp sle i32 %2, 511, !dbg !179
  br i1 %3, label %4, label %11, !dbg !179

; <label>:4                                       ; preds = %1
  %5 = load i32* %m, align 4, !dbg !179
  %6 = sext i32 %5 to i64, !dbg !179
  %7 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %6, !dbg !179
  store i32 1, i32* %7, align 4, !dbg !179
  br label %8, !dbg !179

; <label>:8                                       ; preds = %4
  %9 = load i32* %m, align 4, !dbg !179
  %10 = add nsw i32 %9, 1, !dbg !179
  store i32 %10, i32* %m, align 4, !dbg !179
  br label %1, !dbg !179

; <label>:11                                      ; preds = %1
  store i32 1, i32* %i, align 4, !dbg !181
  br label %12, !dbg !181

; <label>:12                                      ; preds = %41, %11
  %13 = load i32* %i, align 4, !dbg !181
  %14 = icmp sle i32 %13, 5, !dbg !181
  br i1 %14, label %15, label %44, !dbg !181

; <label>:15                                      ; preds = %12
  store i32 1, i32* %j, align 4, !dbg !183
  br label %16, !dbg !183

; <label>:16                                      ; preds = %37, %15
  %17 = load i32* %j, align 4, !dbg !183
  %18 = icmp sle i32 %17, 5, !dbg !183
  br i1 %18, label %19, label %40, !dbg !183

; <label>:19                                      ; preds = %16
  store i32 1, i32* %k, align 4, !dbg !185
  br label %20, !dbg !185

; <label>:20                                      ; preds = %33, %19
  %21 = load i32* %k, align 4, !dbg !185
  %22 = icmp sle i32 %21, 5, !dbg !185
  br i1 %22, label %23, label %36, !dbg !185

; <label>:23                                      ; preds = %20
  %24 = load i32* %i, align 4, !dbg !185
  %25 = load i32* %j, align 4, !dbg !185
  %26 = load i32* %k, align 4, !dbg !185
  %27 = mul nsw i32 8, %26, !dbg !185
  %28 = add nsw i32 %25, %27, !dbg !185
  %29 = mul nsw i32 8, %28, !dbg !185
  %30 = add nsw i32 %24, %29, !dbg !185
  %31 = sext i32 %30 to i64, !dbg !185
  %32 = getelementptr inbounds [512 x i32]* @puzzl, i32 0, i64 %31, !dbg !185
  store i32 0, i32* %32, align 4, !dbg !185
  br label %33, !dbg !185

; <label>:33                                      ; preds = %23
  %34 = load i32* %k, align 4, !dbg !185
  %35 = add nsw i32 %34, 1, !dbg !185
  store i32 %35, i32* %k, align 4, !dbg !185
  br label %20, !dbg !185

; <label>:36                                      ; preds = %20
  br label %37, !dbg !185

; <label>:37                                      ; preds = %36
  %38 = load i32* %j, align 4, !dbg !183
  %39 = add nsw i32 %38, 1, !dbg !183
  store i32 %39, i32* %j, align 4, !dbg !183
  br label %16, !dbg !183

; <label>:40                                      ; preds = %16
  br label %41, !dbg !183

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4, !dbg !181
  %43 = add nsw i32 %42, 1, !dbg !181
  store i32 %43, i32* %i, align 4, !dbg !181
  br label %12, !dbg !181

; <label>:44                                      ; preds = %12
  store i32 0, i32* %i, align 4, !dbg !187
  br label %45, !dbg !187

; <label>:45                                      ; preds = %63, %44
  %46 = load i32* %i, align 4, !dbg !187
  %47 = icmp sle i32 %46, 12, !dbg !187
  br i1 %47, label %48, label %66, !dbg !187

; <label>:48                                      ; preds = %45
  store i32 0, i32* %m, align 4, !dbg !189
  br label %49, !dbg !189

; <label>:49                                      ; preds = %59, %48
  %50 = load i32* %m, align 4, !dbg !189
  %51 = icmp sle i32 %50, 511, !dbg !189
  br i1 %51, label %52, label %62, !dbg !189

; <label>:52                                      ; preds = %49
  %53 = load i32* %m, align 4, !dbg !189
  %54 = sext i32 %53 to i64, !dbg !189
  %55 = load i32* %i, align 4, !dbg !189
  %56 = sext i32 %55 to i64, !dbg !189
  %57 = getelementptr inbounds [13 x [512 x i32]]* @p, i32 0, i64 %56, !dbg !189
  %58 = getelementptr inbounds [512 x i32]* %57, i32 0, i64 %54, !dbg !189
  store i32 0, i32* %58, align 4, !dbg !189
  br label %59, !dbg !189

; <label>:59                                      ; preds = %52
  %60 = load i32* %m, align 4, !dbg !189
  %61 = add nsw i32 %60, 1, !dbg !189
  store i32 %61, i32* %m, align 4, !dbg !189
  br label %49, !dbg !189

; <label>:62                                      ; preds = %49
  br label %63, !dbg !189

; <label>:63                                      ; preds = %62
  %64 = load i32* %i, align 4, !dbg !187
  %65 = add nsw i32 %64, 1, !dbg !187
  store i32 %65, i32* %i, align 4, !dbg !187
  br label %45, !dbg !187

; <label>:66                                      ; preds = %45
  store i32 0, i32* %i, align 4, !dbg !191
  br label %67, !dbg !191

; <label>:67                                      ; preds = %96, %66
  %68 = load i32* %i, align 4, !dbg !191
  %69 = icmp sle i32 %68, 3, !dbg !191
  br i1 %69, label %70, label %99, !dbg !191

; <label>:70                                      ; preds = %67
  store i32 0, i32* %j, align 4, !dbg !193
  br label %71, !dbg !193

; <label>:71                                      ; preds = %92, %70
  %72 = load i32* %j, align 4, !dbg !193
  %73 = icmp sle i32 %72, 1, !dbg !193
  br i1 %73, label %74, label %95, !dbg !193

; <label>:74                                      ; preds = %71
  store i32 0, i32* %k, align 4, !dbg !195
  br label %75, !dbg !195

; <label>:75                                      ; preds = %88, %74
  %76 = load i32* %k, align 4, !dbg !195
  %77 = icmp sle i32 %76, 0, !dbg !195
  br i1 %77, label %78, label %91, !dbg !195

; <label>:78                                      ; preds = %75
  %79 = load i32* %i, align 4, !dbg !195
  %80 = load i32* %j, align 4, !dbg !195
  %81 = load i32* %k, align 4, !dbg !195
  %82 = mul nsw i32 8, %81, !dbg !195
  %83 = add nsw i32 %80, %82, !dbg !195
  %84 = mul nsw i32 8, %83, !dbg !195
  %85 = add nsw i32 %79, %84, !dbg !195
  %86 = sext i32 %85 to i64, !dbg !195
  %87 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 0), i32 0, i64 %86, !dbg !195
  store i32 1, i32* %87, align 4, !dbg !195
  br label %88, !dbg !195

; <label>:88                                      ; preds = %78
  %89 = load i32* %k, align 4, !dbg !195
  %90 = add nsw i32 %89, 1, !dbg !195
  store i32 %90, i32* %k, align 4, !dbg !195
  br label %75, !dbg !195

; <label>:91                                      ; preds = %75
  br label %92, !dbg !195

; <label>:92                                      ; preds = %91
  %93 = load i32* %j, align 4, !dbg !193
  %94 = add nsw i32 %93, 1, !dbg !193
  store i32 %94, i32* %j, align 4, !dbg !193
  br label %71, !dbg !193

; <label>:95                                      ; preds = %71
  br label %96, !dbg !193

; <label>:96                                      ; preds = %95
  %97 = load i32* %i, align 4, !dbg !191
  %98 = add nsw i32 %97, 1, !dbg !191
  store i32 %98, i32* %i, align 4, !dbg !191
  br label %67, !dbg !191

; <label>:99                                      ; preds = %67
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 0), align 4, !dbg !197
  store i32 11, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 0), align 4, !dbg !198
  store i32 0, i32* %i, align 4, !dbg !199
  br label %100, !dbg !199

; <label>:100                                     ; preds = %129, %99
  %101 = load i32* %i, align 4, !dbg !199
  %102 = icmp sle i32 %101, 1, !dbg !199
  br i1 %102, label %103, label %132, !dbg !199

; <label>:103                                     ; preds = %100
  store i32 0, i32* %j, align 4, !dbg !201
  br label %104, !dbg !201

; <label>:104                                     ; preds = %125, %103
  %105 = load i32* %j, align 4, !dbg !201
  %106 = icmp sle i32 %105, 0, !dbg !201
  br i1 %106, label %107, label %128, !dbg !201

; <label>:107                                     ; preds = %104
  store i32 0, i32* %k, align 4, !dbg !203
  br label %108, !dbg !203

; <label>:108                                     ; preds = %121, %107
  %109 = load i32* %k, align 4, !dbg !203
  %110 = icmp sle i32 %109, 3, !dbg !203
  br i1 %110, label %111, label %124, !dbg !203

; <label>:111                                     ; preds = %108
  %112 = load i32* %i, align 4, !dbg !203
  %113 = load i32* %j, align 4, !dbg !203
  %114 = load i32* %k, align 4, !dbg !203
  %115 = mul nsw i32 8, %114, !dbg !203
  %116 = add nsw i32 %113, %115, !dbg !203
  %117 = mul nsw i32 8, %116, !dbg !203
  %118 = add nsw i32 %112, %117, !dbg !203
  %119 = sext i32 %118 to i64, !dbg !203
  %120 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 1), i32 0, i64 %119, !dbg !203
  store i32 1, i32* %120, align 4, !dbg !203
  br label %121, !dbg !203

; <label>:121                                     ; preds = %111
  %122 = load i32* %k, align 4, !dbg !203
  %123 = add nsw i32 %122, 1, !dbg !203
  store i32 %123, i32* %k, align 4, !dbg !203
  br label %108, !dbg !203

; <label>:124                                     ; preds = %108
  br label %125, !dbg !203

; <label>:125                                     ; preds = %124
  %126 = load i32* %j, align 4, !dbg !201
  %127 = add nsw i32 %126, 1, !dbg !201
  store i32 %127, i32* %j, align 4, !dbg !201
  br label %104, !dbg !201

; <label>:128                                     ; preds = %104
  br label %129, !dbg !201

; <label>:129                                     ; preds = %128
  %130 = load i32* %i, align 4, !dbg !199
  %131 = add nsw i32 %130, 1, !dbg !199
  store i32 %131, i32* %i, align 4, !dbg !199
  br label %100, !dbg !199

; <label>:132                                     ; preds = %100
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 1), align 4, !dbg !205
  store i32 193, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 1), align 4, !dbg !206
  store i32 0, i32* %i, align 4, !dbg !207
  br label %133, !dbg !207

; <label>:133                                     ; preds = %162, %132
  %134 = load i32* %i, align 4, !dbg !207
  %135 = icmp sle i32 %134, 0, !dbg !207
  br i1 %135, label %136, label %165, !dbg !207

; <label>:136                                     ; preds = %133
  store i32 0, i32* %j, align 4, !dbg !209
  br label %137, !dbg !209

; <label>:137                                     ; preds = %158, %136
  %138 = load i32* %j, align 4, !dbg !209
  %139 = icmp sle i32 %138, 3, !dbg !209
  br i1 %139, label %140, label %161, !dbg !209

; <label>:140                                     ; preds = %137
  store i32 0, i32* %k, align 4, !dbg !211
  br label %141, !dbg !211

; <label>:141                                     ; preds = %154, %140
  %142 = load i32* %k, align 4, !dbg !211
  %143 = icmp sle i32 %142, 1, !dbg !211
  br i1 %143, label %144, label %157, !dbg !211

; <label>:144                                     ; preds = %141
  %145 = load i32* %i, align 4, !dbg !211
  %146 = load i32* %j, align 4, !dbg !211
  %147 = load i32* %k, align 4, !dbg !211
  %148 = mul nsw i32 8, %147, !dbg !211
  %149 = add nsw i32 %146, %148, !dbg !211
  %150 = mul nsw i32 8, %149, !dbg !211
  %151 = add nsw i32 %145, %150, !dbg !211
  %152 = sext i32 %151 to i64, !dbg !211
  %153 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 2), i32 0, i64 %152, !dbg !211
  store i32 1, i32* %153, align 4, !dbg !211
  br label %154, !dbg !211

; <label>:154                                     ; preds = %144
  %155 = load i32* %k, align 4, !dbg !211
  %156 = add nsw i32 %155, 1, !dbg !211
  store i32 %156, i32* %k, align 4, !dbg !211
  br label %141, !dbg !211

; <label>:157                                     ; preds = %141
  br label %158, !dbg !211

; <label>:158                                     ; preds = %157
  %159 = load i32* %j, align 4, !dbg !209
  %160 = add nsw i32 %159, 1, !dbg !209
  store i32 %160, i32* %j, align 4, !dbg !209
  br label %137, !dbg !209

; <label>:161                                     ; preds = %137
  br label %162, !dbg !209

; <label>:162                                     ; preds = %161
  %163 = load i32* %i, align 4, !dbg !207
  %164 = add nsw i32 %163, 1, !dbg !207
  store i32 %164, i32* %i, align 4, !dbg !207
  br label %133, !dbg !207

; <label>:165                                     ; preds = %133
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 2), align 4, !dbg !213
  store i32 88, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 2), align 4, !dbg !214
  store i32 0, i32* %i, align 4, !dbg !215
  br label %166, !dbg !215

; <label>:166                                     ; preds = %195, %165
  %167 = load i32* %i, align 4, !dbg !215
  %168 = icmp sle i32 %167, 1, !dbg !215
  br i1 %168, label %169, label %198, !dbg !215

; <label>:169                                     ; preds = %166
  store i32 0, i32* %j, align 4, !dbg !217
  br label %170, !dbg !217

; <label>:170                                     ; preds = %191, %169
  %171 = load i32* %j, align 4, !dbg !217
  %172 = icmp sle i32 %171, 3, !dbg !217
  br i1 %172, label %173, label %194, !dbg !217

; <label>:173                                     ; preds = %170
  store i32 0, i32* %k, align 4, !dbg !219
  br label %174, !dbg !219

; <label>:174                                     ; preds = %187, %173
  %175 = load i32* %k, align 4, !dbg !219
  %176 = icmp sle i32 %175, 0, !dbg !219
  br i1 %176, label %177, label %190, !dbg !219

; <label>:177                                     ; preds = %174
  %178 = load i32* %i, align 4, !dbg !219
  %179 = load i32* %j, align 4, !dbg !219
  %180 = load i32* %k, align 4, !dbg !219
  %181 = mul nsw i32 8, %180, !dbg !219
  %182 = add nsw i32 %179, %181, !dbg !219
  %183 = mul nsw i32 8, %182, !dbg !219
  %184 = add nsw i32 %178, %183, !dbg !219
  %185 = sext i32 %184 to i64, !dbg !219
  %186 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 3), i32 0, i64 %185, !dbg !219
  store i32 1, i32* %186, align 4, !dbg !219
  br label %187, !dbg !219

; <label>:187                                     ; preds = %177
  %188 = load i32* %k, align 4, !dbg !219
  %189 = add nsw i32 %188, 1, !dbg !219
  store i32 %189, i32* %k, align 4, !dbg !219
  br label %174, !dbg !219

; <label>:190                                     ; preds = %174
  br label %191, !dbg !219

; <label>:191                                     ; preds = %190
  %192 = load i32* %j, align 4, !dbg !217
  %193 = add nsw i32 %192, 1, !dbg !217
  store i32 %193, i32* %j, align 4, !dbg !217
  br label %170, !dbg !217

; <label>:194                                     ; preds = %170
  br label %195, !dbg !217

; <label>:195                                     ; preds = %194
  %196 = load i32* %i, align 4, !dbg !215
  %197 = add nsw i32 %196, 1, !dbg !215
  store i32 %197, i32* %i, align 4, !dbg !215
  br label %166, !dbg !215

; <label>:198                                     ; preds = %166
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 3), align 4, !dbg !221
  store i32 25, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 3), align 4, !dbg !222
  store i32 0, i32* %i, align 4, !dbg !223
  br label %199, !dbg !223

; <label>:199                                     ; preds = %228, %198
  %200 = load i32* %i, align 4, !dbg !223
  %201 = icmp sle i32 %200, 3, !dbg !223
  br i1 %201, label %202, label %231, !dbg !223

; <label>:202                                     ; preds = %199
  store i32 0, i32* %j, align 4, !dbg !225
  br label %203, !dbg !225

; <label>:203                                     ; preds = %224, %202
  %204 = load i32* %j, align 4, !dbg !225
  %205 = icmp sle i32 %204, 0, !dbg !225
  br i1 %205, label %206, label %227, !dbg !225

; <label>:206                                     ; preds = %203
  store i32 0, i32* %k, align 4, !dbg !227
  br label %207, !dbg !227

; <label>:207                                     ; preds = %220, %206
  %208 = load i32* %k, align 4, !dbg !227
  %209 = icmp sle i32 %208, 1, !dbg !227
  br i1 %209, label %210, label %223, !dbg !227

; <label>:210                                     ; preds = %207
  %211 = load i32* %i, align 4, !dbg !227
  %212 = load i32* %j, align 4, !dbg !227
  %213 = load i32* %k, align 4, !dbg !227
  %214 = mul nsw i32 8, %213, !dbg !227
  %215 = add nsw i32 %212, %214, !dbg !227
  %216 = mul nsw i32 8, %215, !dbg !227
  %217 = add nsw i32 %211, %216, !dbg !227
  %218 = sext i32 %217 to i64, !dbg !227
  %219 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 4), i32 0, i64 %218, !dbg !227
  store i32 1, i32* %219, align 4, !dbg !227
  br label %220, !dbg !227

; <label>:220                                     ; preds = %210
  %221 = load i32* %k, align 4, !dbg !227
  %222 = add nsw i32 %221, 1, !dbg !227
  store i32 %222, i32* %k, align 4, !dbg !227
  br label %207, !dbg !227

; <label>:223                                     ; preds = %207
  br label %224, !dbg !227

; <label>:224                                     ; preds = %223
  %225 = load i32* %j, align 4, !dbg !225
  %226 = add nsw i32 %225, 1, !dbg !225
  store i32 %226, i32* %j, align 4, !dbg !225
  br label %203, !dbg !225

; <label>:227                                     ; preds = %203
  br label %228, !dbg !225

; <label>:228                                     ; preds = %227
  %229 = load i32* %i, align 4, !dbg !223
  %230 = add nsw i32 %229, 1, !dbg !223
  store i32 %230, i32* %i, align 4, !dbg !223
  br label %199, !dbg !223

; <label>:231                                     ; preds = %199
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 4), align 4, !dbg !229
  store i32 67, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 4), align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %232, !dbg !231

; <label>:232                                     ; preds = %261, %231
  %233 = load i32* %i, align 4, !dbg !231
  %234 = icmp sle i32 %233, 0, !dbg !231
  br i1 %234, label %235, label %264, !dbg !231

; <label>:235                                     ; preds = %232
  store i32 0, i32* %j, align 4, !dbg !233
  br label %236, !dbg !233

; <label>:236                                     ; preds = %257, %235
  %237 = load i32* %j, align 4, !dbg !233
  %238 = icmp sle i32 %237, 1, !dbg !233
  br i1 %238, label %239, label %260, !dbg !233

; <label>:239                                     ; preds = %236
  store i32 0, i32* %k, align 4, !dbg !235
  br label %240, !dbg !235

; <label>:240                                     ; preds = %253, %239
  %241 = load i32* %k, align 4, !dbg !235
  %242 = icmp sle i32 %241, 3, !dbg !235
  br i1 %242, label %243, label %256, !dbg !235

; <label>:243                                     ; preds = %240
  %244 = load i32* %i, align 4, !dbg !235
  %245 = load i32* %j, align 4, !dbg !235
  %246 = load i32* %k, align 4, !dbg !235
  %247 = mul nsw i32 8, %246, !dbg !235
  %248 = add nsw i32 %245, %247, !dbg !235
  %249 = mul nsw i32 8, %248, !dbg !235
  %250 = add nsw i32 %244, %249, !dbg !235
  %251 = sext i32 %250 to i64, !dbg !235
  %252 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 5), i32 0, i64 %251, !dbg !235
  store i32 1, i32* %252, align 4, !dbg !235
  br label %253, !dbg !235

; <label>:253                                     ; preds = %243
  %254 = load i32* %k, align 4, !dbg !235
  %255 = add nsw i32 %254, 1, !dbg !235
  store i32 %255, i32* %k, align 4, !dbg !235
  br label %240, !dbg !235

; <label>:256                                     ; preds = %240
  br label %257, !dbg !235

; <label>:257                                     ; preds = %256
  %258 = load i32* %j, align 4, !dbg !233
  %259 = add nsw i32 %258, 1, !dbg !233
  store i32 %259, i32* %j, align 4, !dbg !233
  br label %236, !dbg !233

; <label>:260                                     ; preds = %236
  br label %261, !dbg !233

; <label>:261                                     ; preds = %260
  %262 = load i32* %i, align 4, !dbg !231
  %263 = add nsw i32 %262, 1, !dbg !231
  store i32 %263, i32* %i, align 4, !dbg !231
  br label %232, !dbg !231

; <label>:264                                     ; preds = %232
  store i32 0, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 5), align 4, !dbg !237
  store i32 200, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 5), align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %265, !dbg !239

; <label>:265                                     ; preds = %294, %264
  %266 = load i32* %i, align 4, !dbg !239
  %267 = icmp sle i32 %266, 2, !dbg !239
  br i1 %267, label %268, label %297, !dbg !239

; <label>:268                                     ; preds = %265
  store i32 0, i32* %j, align 4, !dbg !241
  br label %269, !dbg !241

; <label>:269                                     ; preds = %290, %268
  %270 = load i32* %j, align 4, !dbg !241
  %271 = icmp sle i32 %270, 0, !dbg !241
  br i1 %271, label %272, label %293, !dbg !241

; <label>:272                                     ; preds = %269
  store i32 0, i32* %k, align 4, !dbg !243
  br label %273, !dbg !243

; <label>:273                                     ; preds = %286, %272
  %274 = load i32* %k, align 4, !dbg !243
  %275 = icmp sle i32 %274, 0, !dbg !243
  br i1 %275, label %276, label %289, !dbg !243

; <label>:276                                     ; preds = %273
  %277 = load i32* %i, align 4, !dbg !243
  %278 = load i32* %j, align 4, !dbg !243
  %279 = load i32* %k, align 4, !dbg !243
  %280 = mul nsw i32 8, %279, !dbg !243
  %281 = add nsw i32 %278, %280, !dbg !243
  %282 = mul nsw i32 8, %281, !dbg !243
  %283 = add nsw i32 %277, %282, !dbg !243
  %284 = sext i32 %283 to i64, !dbg !243
  %285 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 6), i32 0, i64 %284, !dbg !243
  store i32 1, i32* %285, align 4, !dbg !243
  br label %286, !dbg !243

; <label>:286                                     ; preds = %276
  %287 = load i32* %k, align 4, !dbg !243
  %288 = add nsw i32 %287, 1, !dbg !243
  store i32 %288, i32* %k, align 4, !dbg !243
  br label %273, !dbg !243

; <label>:289                                     ; preds = %273
  br label %290, !dbg !243

; <label>:290                                     ; preds = %289
  %291 = load i32* %j, align 4, !dbg !241
  %292 = add nsw i32 %291, 1, !dbg !241
  store i32 %292, i32* %j, align 4, !dbg !241
  br label %269, !dbg !241

; <label>:293                                     ; preds = %269
  br label %294, !dbg !241

; <label>:294                                     ; preds = %293
  %295 = load i32* %i, align 4, !dbg !239
  %296 = add nsw i32 %295, 1, !dbg !239
  store i32 %296, i32* %i, align 4, !dbg !239
  br label %265, !dbg !239

; <label>:297                                     ; preds = %265
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 6), align 4, !dbg !245
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 6), align 4, !dbg !246
  store i32 0, i32* %i, align 4, !dbg !247
  br label %298, !dbg !247

; <label>:298                                     ; preds = %327, %297
  %299 = load i32* %i, align 4, !dbg !247
  %300 = icmp sle i32 %299, 0, !dbg !247
  br i1 %300, label %301, label %330, !dbg !247

; <label>:301                                     ; preds = %298
  store i32 0, i32* %j, align 4, !dbg !249
  br label %302, !dbg !249

; <label>:302                                     ; preds = %323, %301
  %303 = load i32* %j, align 4, !dbg !249
  %304 = icmp sle i32 %303, 2, !dbg !249
  br i1 %304, label %305, label %326, !dbg !249

; <label>:305                                     ; preds = %302
  store i32 0, i32* %k, align 4, !dbg !251
  br label %306, !dbg !251

; <label>:306                                     ; preds = %319, %305
  %307 = load i32* %k, align 4, !dbg !251
  %308 = icmp sle i32 %307, 0, !dbg !251
  br i1 %308, label %309, label %322, !dbg !251

; <label>:309                                     ; preds = %306
  %310 = load i32* %i, align 4, !dbg !251
  %311 = load i32* %j, align 4, !dbg !251
  %312 = load i32* %k, align 4, !dbg !251
  %313 = mul nsw i32 8, %312, !dbg !251
  %314 = add nsw i32 %311, %313, !dbg !251
  %315 = mul nsw i32 8, %314, !dbg !251
  %316 = add nsw i32 %310, %315, !dbg !251
  %317 = sext i32 %316 to i64, !dbg !251
  %318 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 7), i32 0, i64 %317, !dbg !251
  store i32 1, i32* %318, align 4, !dbg !251
  br label %319, !dbg !251

; <label>:319                                     ; preds = %309
  %320 = load i32* %k, align 4, !dbg !251
  %321 = add nsw i32 %320, 1, !dbg !251
  store i32 %321, i32* %k, align 4, !dbg !251
  br label %306, !dbg !251

; <label>:322                                     ; preds = %306
  br label %323, !dbg !251

; <label>:323                                     ; preds = %322
  %324 = load i32* %j, align 4, !dbg !249
  %325 = add nsw i32 %324, 1, !dbg !249
  store i32 %325, i32* %j, align 4, !dbg !249
  br label %302, !dbg !249

; <label>:326                                     ; preds = %302
  br label %327, !dbg !249

; <label>:327                                     ; preds = %326
  %328 = load i32* %i, align 4, !dbg !247
  %329 = add nsw i32 %328, 1, !dbg !247
  store i32 %329, i32* %i, align 4, !dbg !247
  br label %298, !dbg !247

; <label>:330                                     ; preds = %298
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 7), align 4, !dbg !253
  store i32 16, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 7), align 4, !dbg !254
  store i32 0, i32* %i, align 4, !dbg !255
  br label %331, !dbg !255

; <label>:331                                     ; preds = %360, %330
  %332 = load i32* %i, align 4, !dbg !255
  %333 = icmp sle i32 %332, 0, !dbg !255
  br i1 %333, label %334, label %363, !dbg !255

; <label>:334                                     ; preds = %331
  store i32 0, i32* %j, align 4, !dbg !257
  br label %335, !dbg !257

; <label>:335                                     ; preds = %356, %334
  %336 = load i32* %j, align 4, !dbg !257
  %337 = icmp sle i32 %336, 0, !dbg !257
  br i1 %337, label %338, label %359, !dbg !257

; <label>:338                                     ; preds = %335
  store i32 0, i32* %k, align 4, !dbg !259
  br label %339, !dbg !259

; <label>:339                                     ; preds = %352, %338
  %340 = load i32* %k, align 4, !dbg !259
  %341 = icmp sle i32 %340, 2, !dbg !259
  br i1 %341, label %342, label %355, !dbg !259

; <label>:342                                     ; preds = %339
  %343 = load i32* %i, align 4, !dbg !259
  %344 = load i32* %j, align 4, !dbg !259
  %345 = load i32* %k, align 4, !dbg !259
  %346 = mul nsw i32 8, %345, !dbg !259
  %347 = add nsw i32 %344, %346, !dbg !259
  %348 = mul nsw i32 8, %347, !dbg !259
  %349 = add nsw i32 %343, %348, !dbg !259
  %350 = sext i32 %349 to i64, !dbg !259
  %351 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 8), i32 0, i64 %350, !dbg !259
  store i32 1, i32* %351, align 4, !dbg !259
  br label %352, !dbg !259

; <label>:352                                     ; preds = %342
  %353 = load i32* %k, align 4, !dbg !259
  %354 = add nsw i32 %353, 1, !dbg !259
  store i32 %354, i32* %k, align 4, !dbg !259
  br label %339, !dbg !259

; <label>:355                                     ; preds = %339
  br label %356, !dbg !259

; <label>:356                                     ; preds = %355
  %357 = load i32* %j, align 4, !dbg !257
  %358 = add nsw i32 %357, 1, !dbg !257
  store i32 %358, i32* %j, align 4, !dbg !257
  br label %335, !dbg !257

; <label>:359                                     ; preds = %335
  br label %360, !dbg !257

; <label>:360                                     ; preds = %359
  %361 = load i32* %i, align 4, !dbg !255
  %362 = add nsw i32 %361, 1, !dbg !255
  store i32 %362, i32* %i, align 4, !dbg !255
  br label %331, !dbg !255

; <label>:363                                     ; preds = %331
  store i32 1, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 8), align 4, !dbg !261
  store i32 128, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 8), align 4, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !263
  br label %364, !dbg !263

; <label>:364                                     ; preds = %393, %363
  %365 = load i32* %i, align 4, !dbg !263
  %366 = icmp sle i32 %365, 1, !dbg !263
  br i1 %366, label %367, label %396, !dbg !263

; <label>:367                                     ; preds = %364
  store i32 0, i32* %j, align 4, !dbg !265
  br label %368, !dbg !265

; <label>:368                                     ; preds = %389, %367
  %369 = load i32* %j, align 4, !dbg !265
  %370 = icmp sle i32 %369, 1, !dbg !265
  br i1 %370, label %371, label %392, !dbg !265

; <label>:371                                     ; preds = %368
  store i32 0, i32* %k, align 4, !dbg !267
  br label %372, !dbg !267

; <label>:372                                     ; preds = %385, %371
  %373 = load i32* %k, align 4, !dbg !267
  %374 = icmp sle i32 %373, 0, !dbg !267
  br i1 %374, label %375, label %388, !dbg !267

; <label>:375                                     ; preds = %372
  %376 = load i32* %i, align 4, !dbg !267
  %377 = load i32* %j, align 4, !dbg !267
  %378 = load i32* %k, align 4, !dbg !267
  %379 = mul nsw i32 8, %378, !dbg !267
  %380 = add nsw i32 %377, %379, !dbg !267
  %381 = mul nsw i32 8, %380, !dbg !267
  %382 = add nsw i32 %376, %381, !dbg !267
  %383 = sext i32 %382 to i64, !dbg !267
  %384 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 9), i32 0, i64 %383, !dbg !267
  store i32 1, i32* %384, align 4, !dbg !267
  br label %385, !dbg !267

; <label>:385                                     ; preds = %375
  %386 = load i32* %k, align 4, !dbg !267
  %387 = add nsw i32 %386, 1, !dbg !267
  store i32 %387, i32* %k, align 4, !dbg !267
  br label %372, !dbg !267

; <label>:388                                     ; preds = %372
  br label %389, !dbg !267

; <label>:389                                     ; preds = %388
  %390 = load i32* %j, align 4, !dbg !265
  %391 = add nsw i32 %390, 1, !dbg !265
  store i32 %391, i32* %j, align 4, !dbg !265
  br label %368, !dbg !265

; <label>:392                                     ; preds = %368
  br label %393, !dbg !265

; <label>:393                                     ; preds = %392
  %394 = load i32* %i, align 4, !dbg !263
  %395 = add nsw i32 %394, 1, !dbg !263
  store i32 %395, i32* %i, align 4, !dbg !263
  br label %364, !dbg !263

; <label>:396                                     ; preds = %364
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 9), align 4, !dbg !269
  store i32 9, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 9), align 4, !dbg !270
  store i32 0, i32* %i, align 4, !dbg !271
  br label %397, !dbg !271

; <label>:397                                     ; preds = %426, %396
  %398 = load i32* %i, align 4, !dbg !271
  %399 = icmp sle i32 %398, 1, !dbg !271
  br i1 %399, label %400, label %429, !dbg !271

; <label>:400                                     ; preds = %397
  store i32 0, i32* %j, align 4, !dbg !273
  br label %401, !dbg !273

; <label>:401                                     ; preds = %422, %400
  %402 = load i32* %j, align 4, !dbg !273
  %403 = icmp sle i32 %402, 0, !dbg !273
  br i1 %403, label %404, label %425, !dbg !273

; <label>:404                                     ; preds = %401
  store i32 0, i32* %k, align 4, !dbg !275
  br label %405, !dbg !275

; <label>:405                                     ; preds = %418, %404
  %406 = load i32* %k, align 4, !dbg !275
  %407 = icmp sle i32 %406, 1, !dbg !275
  br i1 %407, label %408, label %421, !dbg !275

; <label>:408                                     ; preds = %405
  %409 = load i32* %i, align 4, !dbg !275
  %410 = load i32* %j, align 4, !dbg !275
  %411 = load i32* %k, align 4, !dbg !275
  %412 = mul nsw i32 8, %411, !dbg !275
  %413 = add nsw i32 %410, %412, !dbg !275
  %414 = mul nsw i32 8, %413, !dbg !275
  %415 = add nsw i32 %409, %414, !dbg !275
  %416 = sext i32 %415 to i64, !dbg !275
  %417 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 10), i32 0, i64 %416, !dbg !275
  store i32 1, i32* %417, align 4, !dbg !275
  br label %418, !dbg !275

; <label>:418                                     ; preds = %408
  %419 = load i32* %k, align 4, !dbg !275
  %420 = add nsw i32 %419, 1, !dbg !275
  store i32 %420, i32* %k, align 4, !dbg !275
  br label %405, !dbg !275

; <label>:421                                     ; preds = %405
  br label %422, !dbg !275

; <label>:422                                     ; preds = %421
  %423 = load i32* %j, align 4, !dbg !273
  %424 = add nsw i32 %423, 1, !dbg !273
  store i32 %424, i32* %j, align 4, !dbg !273
  br label %401, !dbg !273

; <label>:425                                     ; preds = %401
  br label %426, !dbg !273

; <label>:426                                     ; preds = %425
  %427 = load i32* %i, align 4, !dbg !271
  %428 = add nsw i32 %427, 1, !dbg !271
  store i32 %428, i32* %i, align 4, !dbg !271
  br label %397, !dbg !271

; <label>:429                                     ; preds = %397
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 10), align 4, !dbg !277
  store i32 65, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 10), align 4, !dbg !278
  store i32 0, i32* %i, align 4, !dbg !279
  br label %430, !dbg !279

; <label>:430                                     ; preds = %459, %429
  %431 = load i32* %i, align 4, !dbg !279
  %432 = icmp sle i32 %431, 0, !dbg !279
  br i1 %432, label %433, label %462, !dbg !279

; <label>:433                                     ; preds = %430
  store i32 0, i32* %j, align 4, !dbg !281
  br label %434, !dbg !281

; <label>:434                                     ; preds = %455, %433
  %435 = load i32* %j, align 4, !dbg !281
  %436 = icmp sle i32 %435, 1, !dbg !281
  br i1 %436, label %437, label %458, !dbg !281

; <label>:437                                     ; preds = %434
  store i32 0, i32* %k, align 4, !dbg !283
  br label %438, !dbg !283

; <label>:438                                     ; preds = %451, %437
  %439 = load i32* %k, align 4, !dbg !283
  %440 = icmp sle i32 %439, 1, !dbg !283
  br i1 %440, label %441, label %454, !dbg !283

; <label>:441                                     ; preds = %438
  %442 = load i32* %i, align 4, !dbg !283
  %443 = load i32* %j, align 4, !dbg !283
  %444 = load i32* %k, align 4, !dbg !283
  %445 = mul nsw i32 8, %444, !dbg !283
  %446 = add nsw i32 %443, %445, !dbg !283
  %447 = mul nsw i32 8, %446, !dbg !283
  %448 = add nsw i32 %442, %447, !dbg !283
  %449 = sext i32 %448 to i64, !dbg !283
  %450 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 11), i32 0, i64 %449, !dbg !283
  store i32 1, i32* %450, align 4, !dbg !283
  br label %451, !dbg !283

; <label>:451                                     ; preds = %441
  %452 = load i32* %k, align 4, !dbg !283
  %453 = add nsw i32 %452, 1, !dbg !283
  store i32 %453, i32* %k, align 4, !dbg !283
  br label %438, !dbg !283

; <label>:454                                     ; preds = %438
  br label %455, !dbg !283

; <label>:455                                     ; preds = %454
  %456 = load i32* %j, align 4, !dbg !281
  %457 = add nsw i32 %456, 1, !dbg !281
  store i32 %457, i32* %j, align 4, !dbg !281
  br label %434, !dbg !281

; <label>:458                                     ; preds = %434
  br label %459, !dbg !281

; <label>:459                                     ; preds = %458
  %460 = load i32* %i, align 4, !dbg !279
  %461 = add nsw i32 %460, 1, !dbg !279
  store i32 %461, i32* %i, align 4, !dbg !279
  br label %430, !dbg !279

; <label>:462                                     ; preds = %430
  store i32 2, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 11), align 4, !dbg !285
  store i32 72, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 11), align 4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %463, !dbg !287

; <label>:463                                     ; preds = %492, %462
  %464 = load i32* %i, align 4, !dbg !287
  %465 = icmp sle i32 %464, 1, !dbg !287
  br i1 %465, label %466, label %495, !dbg !287

; <label>:466                                     ; preds = %463
  store i32 0, i32* %j, align 4, !dbg !289
  br label %467, !dbg !289

; <label>:467                                     ; preds = %488, %466
  %468 = load i32* %j, align 4, !dbg !289
  %469 = icmp sle i32 %468, 1, !dbg !289
  br i1 %469, label %470, label %491, !dbg !289

; <label>:470                                     ; preds = %467
  store i32 0, i32* %k, align 4, !dbg !291
  br label %471, !dbg !291

; <label>:471                                     ; preds = %484, %470
  %472 = load i32* %k, align 4, !dbg !291
  %473 = icmp sle i32 %472, 1, !dbg !291
  br i1 %473, label %474, label %487, !dbg !291

; <label>:474                                     ; preds = %471
  %475 = load i32* %i, align 4, !dbg !291
  %476 = load i32* %j, align 4, !dbg !291
  %477 = load i32* %k, align 4, !dbg !291
  %478 = mul nsw i32 8, %477, !dbg !291
  %479 = add nsw i32 %476, %478, !dbg !291
  %480 = mul nsw i32 8, %479, !dbg !291
  %481 = add nsw i32 %475, %480, !dbg !291
  %482 = sext i32 %481 to i64, !dbg !291
  %483 = getelementptr inbounds [512 x i32]* getelementptr inbounds ([13 x [512 x i32]]* @p, i32 0, i64 12), i32 0, i64 %482, !dbg !291
  store i32 1, i32* %483, align 4, !dbg !291
  br label %484, !dbg !291

; <label>:484                                     ; preds = %474
  %485 = load i32* %k, align 4, !dbg !291
  %486 = add nsw i32 %485, 1, !dbg !291
  store i32 %486, i32* %k, align 4, !dbg !291
  br label %471, !dbg !291

; <label>:487                                     ; preds = %471
  br label %488, !dbg !291

; <label>:488                                     ; preds = %487
  %489 = load i32* %j, align 4, !dbg !289
  %490 = add nsw i32 %489, 1, !dbg !289
  store i32 %490, i32* %j, align 4, !dbg !289
  br label %467, !dbg !289

; <label>:491                                     ; preds = %467
  br label %492, !dbg !289

; <label>:492                                     ; preds = %491
  %493 = load i32* %i, align 4, !dbg !287
  %494 = add nsw i32 %493, 1, !dbg !287
  store i32 %494, i32* %i, align 4, !dbg !287
  br label %463, !dbg !287

; <label>:495                                     ; preds = %463
  store i32 3, i32* getelementptr inbounds ([13 x i32]* @class, i32 0, i64 12), align 4, !dbg !293
  store i32 73, i32* getelementptr inbounds ([13 x i32]* @piecemax, i32 0, i64 12), align 4, !dbg !294
  store i32 13, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i64 0), align 4, !dbg !295
  store i32 3, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i64 1), align 4, !dbg !296
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i64 2), align 4, !dbg !297
  store i32 1, i32* getelementptr inbounds ([4 x i32]* @piececount, i32 0, i64 3), align 4, !dbg !298
  store i32 73, i32* %m, align 4, !dbg !299
  store i32 0, i32* @kount, align 4, !dbg !300
  %496 = load i32* %m, align 4, !dbg !301
  %497 = call i32 @Fit(i32 0, i32 %496), !dbg !301
  %498 = icmp ne i32 %497, 0, !dbg !301
  br i1 %498, label %499, label %502, !dbg !301

; <label>:499                                     ; preds = %495
  %500 = load i32* %m, align 4, !dbg !301
  %501 = call i32 @Place(i32 0, i32 %500), !dbg !301
  store i32 %501, i32* @n, align 4, !dbg !301
  br label %504, !dbg !301

; <label>:502                                     ; preds = %495
  %503 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)), !dbg !303
  br label %504

; <label>:504                                     ; preds = %502, %499
  %505 = load i32* @n, align 4, !dbg !304
  %506 = call i32 @Trial(i32 %505), !dbg !304
  %507 = icmp ne i32 %506, 0, !dbg !304
  br i1 %507, label %510, label %508, !dbg !304

; <label>:508                                     ; preds = %504
  %509 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0)), !dbg !304
  br label %516, !dbg !304

; <label>:510                                     ; preds = %504
  %511 = load i32* @kount, align 4, !dbg !306
  %512 = icmp ne i32 %511, 2005, !dbg !306
  br i1 %512, label %513, label %515, !dbg !306

; <label>:513                                     ; preds = %510
  %514 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0)), !dbg !306
  br label %515, !dbg !306

; <label>:515                                     ; preds = %513, %510
  br label %516

; <label>:516                                     ; preds = %515, %508
  %517 = load i32* @n, align 4, !dbg !308
  %518 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %517), !dbg !308
  %519 = load i32* @kount, align 4, !dbg !309
  %520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %519), !dbg !309
  ret void, !dbg !310
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !311), !dbg !312
  store i32 0, i32* %i, align 4, !dbg !313
  br label %2, !dbg !313

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4, !dbg !313
  %4 = icmp slt i32 %3, 100, !dbg !313
  br i1 %4, label %5, label %9, !dbg !313

; <label>:5                                       ; preds = %2
  call void @Puzzle(), !dbg !313
  br label %6, !dbg !313

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4, !dbg !313
  %8 = add nsw i32 %7, 1, !dbg !313
  store i32 %8, i32* %i, align 4, !dbg !313
  br label %2, !dbg !313

; <label>:9                                       ; preds = %2
  ret i32 0, !dbg !315
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!105, !106}
!llvm.ident = !{!107}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !24, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c] [DW_LANG_C99]
!1 = metadata !{metadata !"puzzle-stanford.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !15, metadata !16, metadata !19, metadata !22, metadata !23}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Fit", metadata !"Fit", metadata !"", i32 128, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @Fit, null, null, metadata !2, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [Fit]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !11, metadata !11, metadata !11}
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Place", metadata !"Place", metadata !"", i32 135, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @Place, null, null, metadata !2, i32 135} ; [ DW_TAG_subprogram ] [line 135] [def] [Place]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Remove", metadata !"Remove", metadata !"", i32 143, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @Remove, null, null, metadata !2, i32 143} ; [ DW_TAG_subprogram ] [line 143] [def] [Remove]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{null, metadata !11, metadata !11}
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Trial", metadata !"Trial", metadata !"", i32 149, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @Trial, null, null, metadata !2, i32 149} ; [ DW_TAG_subprogram ] [line 149] [def] [Trial]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !11, metadata !11}
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Puzzle", metadata !"Puzzle", metadata !"", i32 162, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Puzzle, null, null, metadata !2, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Puzzle]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 220, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [main]
!24 = metadata !{metadata !25, metadata !27, metadata !28, metadata !29, metadata !31, metadata !35, metadata !37, metadata !44, metadata !48, metadata !56, metadata !57, metadata !58, metadata !62, metadata !63, metadata !64, metadata !66, metadata !67, metadata !68, metadata !69, metadata !73, metadata !74, metadata !78, metadata !81, metadata !82, metadata !83, metadata !87, metadata !88, metadata !89, metadata !90, metadata !98, metadata !99, metadata !103, metadata !104}
!25 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !26, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!26 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!27 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !26, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!28 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !26, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!29 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !30, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!30 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!31 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !32, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!32 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !33, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!35 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !36, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!36 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!37 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !38, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!38 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!39 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!40 = metadata !{metadata !41, metadata !42, metadata !43}
!41 = metadata !{i32 786445, metadata !1, metadata !39, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786445, metadata !1, metadata !39, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !38} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!43 = metadata !{i32 786445, metadata !1, metadata !39, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!44 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !45, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!45 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !46, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!46 = metadata !{metadata !47}
!47 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!48 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !49, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!49 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !50, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!50 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!51 = metadata !{metadata !52, metadata !53}
!52 = metadata !{i32 786445, metadata !1, metadata !50, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!53 = metadata !{i32 786445, metadata !1, metadata !50, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!56 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!58 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !59, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!60 = metadata !{metadata !61, metadata !61}
!61 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!62 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !59, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!63 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !59, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !65, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!65 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !26, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!66 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !65, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !65, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!68 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !45, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !70, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!70 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !71, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!73 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !70, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !75, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!75 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !76, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!78 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !79, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!79 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !80, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!80 = metadata !{metadata !72, metadata !77}
!81 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!82 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !84, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!84 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !85, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!87 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!90 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !91, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!91 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !92, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!92 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !93, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!93 = metadata !{metadata !94, metadata !95}
!94 = metadata !{i32 786445, metadata !1, metadata !92, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !26} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!95 = metadata !{i32 786445, metadata !1, metadata !92, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !26} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 257}      ; [ DW_TAG_subrange_type ] [0, 256]
!98 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !91, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !100, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!100 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !92, metadata !101, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!101 = metadata !{metadata !102}
!102 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!103 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !26, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!104 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !26, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!105 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!106 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!107 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!108 = metadata !{i32 116, i32 0, metadata !4, null}
!109 = metadata !{i32 117, i32 0, metadata !4, null}
!110 = metadata !{i32 120, i32 0, metadata !8, null}
!111 = metadata !{i32 121, i32 0, metadata !8, null}
!112 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777344, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 128]
!113 = metadata !{i32 128, i32 0, metadata !12, null}
!114 = metadata !{i32 786689, metadata !12, metadata !"j", metadata !5, i32 33554560, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 128]
!115 = metadata !{i32 786688, metadata !12, metadata !"k", metadata !5, i32 129, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 129]
!116 = metadata !{i32 129, i32 0, metadata !12, null}
!117 = metadata !{i32 130, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !12, i32 130, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!119 = metadata !{i32 131, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !118, i32 131, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!121 = metadata !{i32 131, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !120, i32 131, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!123 = metadata !{i32 132, i32 0, metadata !12, null}
!124 = metadata !{i32 133, i32 0, metadata !12, null}
!125 = metadata !{i32 786689, metadata !15, metadata !"i", metadata !5, i32 16777351, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 135]
!126 = metadata !{i32 135, i32 0, metadata !15, null}
!127 = metadata !{i32 786689, metadata !15, metadata !"j", metadata !5, i32 33554567, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 135]
!128 = metadata !{i32 786688, metadata !15, metadata !"k", metadata !5, i32 136, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 136]
!129 = metadata !{i32 136, i32 0, metadata !15, null}
!130 = metadata !{i32 137, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !15, i32 137, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!132 = metadata !{i32 137, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !131, i32 137, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!134 = metadata !{i32 138, i32 0, metadata !15, null}
!135 = metadata !{i32 139, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !15, i32 139, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!137 = metadata !{i32 139, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !136, i32 139, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!139 = metadata !{i32 140, i32 0, metadata !15, null}
!140 = metadata !{i32 141, i32 0, metadata !15, null}
!141 = metadata !{i32 786689, metadata !16, metadata !"i", metadata !5, i32 16777359, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 143]
!142 = metadata !{i32 143, i32 0, metadata !16, null}
!143 = metadata !{i32 786689, metadata !16, metadata !"j", metadata !5, i32 33554575, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 143]
!144 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 144]
!145 = metadata !{i32 144, i32 0, metadata !16, null}
!146 = metadata !{i32 145, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !16, i32 145, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!148 = metadata !{i32 145, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !147, i32 145, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!150 = metadata !{i32 146, i32 0, metadata !16, null}
!151 = metadata !{i32 147, i32 0, metadata !16, null}
!152 = metadata !{i32 786689, metadata !19, metadata !"j", metadata !5, i32 16777365, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 149]
!153 = metadata !{i32 149, i32 0, metadata !19, null}
!154 = metadata !{i32 786688, metadata !19, metadata !"i", metadata !5, i32 150, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 150]
!155 = metadata !{i32 150, i32 0, metadata !19, null}
!156 = metadata !{i32 786688, metadata !19, metadata !"k", metadata !5, i32 150, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 150]
!157 = metadata !{i32 151, i32 0, metadata !19, null}
!158 = metadata !{i32 152, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !19, i32 152, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!160 = metadata !{i32 153, i32 0, metadata !161, null}
!161 = metadata !{i32 786443, metadata !1, metadata !159, i32 153, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!162 = metadata !{i32 154, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !161, i32 154, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!164 = metadata !{i32 155, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !163, i32 154, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!166 = metadata !{i32 156, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !165, i32 156, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!168 = metadata !{i32 157, i32 0, metadata !167, null}
!169 = metadata !{i32 158, i32 0, metadata !165, null}
!170 = metadata !{i32 158, i32 0, metadata !163, null}
!171 = metadata !{i32 158, i32 0, metadata !161, null}
!172 = metadata !{i32 159, i32 0, metadata !19, null}
!173 = metadata !{i32 160, i32 0, metadata !19, null}
!174 = metadata !{i32 786688, metadata !22, metadata !"i", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 163]
!175 = metadata !{i32 163, i32 0, metadata !22, null}
!176 = metadata !{i32 786688, metadata !22, metadata !"j", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 163]
!177 = metadata !{i32 786688, metadata !22, metadata !"k", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 163]
!178 = metadata !{i32 786688, metadata !22, metadata !"m", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 163]
!179 = metadata !{i32 164, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !22, i32 164, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!181 = metadata !{i32 165, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !22, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!183 = metadata !{i32 165, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !182, i32 165, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!185 = metadata !{i32 165, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !184, i32 165, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!187 = metadata !{i32 166, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !22, i32 166, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!189 = metadata !{i32 166, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !188, i32 166, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!191 = metadata !{i32 167, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !22, i32 167, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!193 = metadata !{i32 167, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !192, i32 167, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!195 = metadata !{i32 167, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !194, i32 167, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!197 = metadata !{i32 168, i32 0, metadata !22, null}
!198 = metadata !{i32 169, i32 0, metadata !22, null}
!199 = metadata !{i32 170, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !22, i32 170, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!201 = metadata !{i32 170, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 170, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!203 = metadata !{i32 170, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !202, i32 170, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!205 = metadata !{i32 171, i32 0, metadata !22, null}
!206 = metadata !{i32 172, i32 0, metadata !22, null}
!207 = metadata !{i32 173, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !22, i32 173, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!209 = metadata !{i32 173, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !1, metadata !208, i32 173, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!211 = metadata !{i32 173, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !210, i32 173, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!213 = metadata !{i32 174, i32 0, metadata !22, null}
!214 = metadata !{i32 175, i32 0, metadata !22, null}
!215 = metadata !{i32 176, i32 0, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !22, i32 176, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!217 = metadata !{i32 176, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !216, i32 176, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!219 = metadata !{i32 176, i32 0, metadata !220, null}
!220 = metadata !{i32 786443, metadata !1, metadata !218, i32 176, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!221 = metadata !{i32 177, i32 0, metadata !22, null}
!222 = metadata !{i32 178, i32 0, metadata !22, null}
!223 = metadata !{i32 179, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !22, i32 179, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!225 = metadata !{i32 179, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !224, i32 179, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!227 = metadata !{i32 179, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !226, i32 179, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!229 = metadata !{i32 180, i32 0, metadata !22, null}
!230 = metadata !{i32 181, i32 0, metadata !22, null}
!231 = metadata !{i32 182, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !22, i32 182, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!233 = metadata !{i32 182, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 182, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!235 = metadata !{i32 182, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !234, i32 182, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!237 = metadata !{i32 183, i32 0, metadata !22, null}
!238 = metadata !{i32 184, i32 0, metadata !22, null}
!239 = metadata !{i32 185, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !22, i32 185, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!241 = metadata !{i32 185, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !240, i32 185, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!243 = metadata !{i32 185, i32 0, metadata !244, null}
!244 = metadata !{i32 786443, metadata !1, metadata !242, i32 185, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!245 = metadata !{i32 186, i32 0, metadata !22, null}
!246 = metadata !{i32 187, i32 0, metadata !22, null}
!247 = metadata !{i32 188, i32 0, metadata !248, null}
!248 = metadata !{i32 786443, metadata !1, metadata !22, i32 188, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!249 = metadata !{i32 188, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !248, i32 188, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!251 = metadata !{i32 188, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !250, i32 188, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!253 = metadata !{i32 189, i32 0, metadata !22, null}
!254 = metadata !{i32 190, i32 0, metadata !22, null}
!255 = metadata !{i32 191, i32 0, metadata !256, null}
!256 = metadata !{i32 786443, metadata !1, metadata !22, i32 191, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!257 = metadata !{i32 191, i32 0, metadata !258, null}
!258 = metadata !{i32 786443, metadata !1, metadata !256, i32 191, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!259 = metadata !{i32 191, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !258, i32 191, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!261 = metadata !{i32 192, i32 0, metadata !22, null}
!262 = metadata !{i32 193, i32 0, metadata !22, null}
!263 = metadata !{i32 194, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !1, metadata !22, i32 194, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!265 = metadata !{i32 194, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !264, i32 194, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!267 = metadata !{i32 194, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !266, i32 194, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!269 = metadata !{i32 195, i32 0, metadata !22, null}
!270 = metadata !{i32 196, i32 0, metadata !22, null}
!271 = metadata !{i32 197, i32 0, metadata !272, null}
!272 = metadata !{i32 786443, metadata !1, metadata !22, i32 197, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!273 = metadata !{i32 197, i32 0, metadata !274, null}
!274 = metadata !{i32 786443, metadata !1, metadata !272, i32 197, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!275 = metadata !{i32 197, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !1, metadata !274, i32 197, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!277 = metadata !{i32 198, i32 0, metadata !22, null}
!278 = metadata !{i32 199, i32 0, metadata !22, null}
!279 = metadata !{i32 200, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !22, i32 200, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!281 = metadata !{i32 200, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !280, i32 200, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!283 = metadata !{i32 200, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !282, i32 200, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!285 = metadata !{i32 201, i32 0, metadata !22, null}
!286 = metadata !{i32 202, i32 0, metadata !22, null}
!287 = metadata !{i32 203, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !22, i32 203, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!289 = metadata !{i32 203, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !288, i32 203, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!291 = metadata !{i32 203, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !290, i32 203, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!293 = metadata !{i32 204, i32 0, metadata !22, null}
!294 = metadata !{i32 205, i32 0, metadata !22, null}
!295 = metadata !{i32 206, i32 0, metadata !22, null}
!296 = metadata !{i32 207, i32 0, metadata !22, null}
!297 = metadata !{i32 208, i32 0, metadata !22, null}
!298 = metadata !{i32 209, i32 0, metadata !22, null}
!299 = metadata !{i32 210, i32 0, metadata !22, null}
!300 = metadata !{i32 211, i32 0, metadata !22, null}
!301 = metadata !{i32 212, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !22, i32 212, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!303 = metadata !{i32 213, i32 0, metadata !302, null}
!304 = metadata !{i32 214, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !22, i32 214, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!306 = metadata !{i32 215, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !305, i32 215, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!308 = metadata !{i32 216, i32 0, metadata !22, null}
!309 = metadata !{i32 217, i32 0, metadata !22, null}
!310 = metadata !{i32 218, i32 0, metadata !22, null}
!311 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 222, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 222]
!312 = metadata !{i32 222, i32 0, metadata !23, null}
!313 = metadata !{i32 223, i32 0, metadata !314, null}
!314 = metadata !{i32 786443, metadata !1, metadata !23, i32 223, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/puzzle-stanford.c]
!315 = metadata !{i32 224, i32 0, metadata !23, null}
