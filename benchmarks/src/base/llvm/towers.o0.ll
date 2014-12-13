; ModuleID = 'towers.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = common global [4 x i32] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = common global i32 0, align 4
@.str4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
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
  store i64 74755, i64* @seed, align 8, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !120
  %2 = mul nsw i64 %1, 1309, !dbg !120
  %3 = add nsw i64 %2, 13849, !dbg !120
  %4 = and i64 %3, 65535, !dbg !120
  store i64 %4, i64* @seed, align 8, !dbg !120
  %5 = load i64* @seed, align 8, !dbg !121
  %6 = trunc i64 %5 to i32, !dbg !121
  ret i32 %6, !dbg !121
}

; Function Attrs: nounwind uwtable
define void @Error(i8* %emsg) #0 {
  %1 = alloca i8*, align 8
  store i8* %emsg, i8** %1, align 8
  call void @llvm.dbg.declare(metadata !{i8** %1}, metadata !122), !dbg !123
  %2 = load i8** %1, align 8, !dbg !124
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* %2), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @Makenull(i32 %s) #0 {
  %1 = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !126), !dbg !127
  %2 = load i32* %1, align 4, !dbg !128
  %3 = sext i32 %2 to i64, !dbg !128
  %4 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %3, !dbg !128
  store i32 0, i32* %4, align 4, !dbg !128
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define i32 @Getelement() #0 {
  %temp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %temp}, metadata !130), !dbg !131
  store i32 0, i32* %temp, align 4, !dbg !131
  %1 = load i32* @freelist, align 4, !dbg !132
  %2 = icmp sgt i32 %1, 0, !dbg !132
  br i1 %2, label %3, label %10, !dbg !132

; <label>:3                                       ; preds = %0
  %4 = load i32* @freelist, align 4, !dbg !134
  store i32 %4, i32* %temp, align 4, !dbg !134
  %5 = load i32* @freelist, align 4, !dbg !136
  %6 = sext i32 %5 to i64, !dbg !136
  %7 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %6, !dbg !136
  %8 = getelementptr inbounds %struct.element* %7, i32 0, i32 1, !dbg !136
  %9 = load i32* %8, align 4, !dbg !136
  store i32 %9, i32* @freelist, align 4, !dbg !136
  br label %11, !dbg !137

; <label>:10                                      ; preds = %0
  call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0)), !dbg !138
  br label %11

; <label>:11                                      ; preds = %10, %3
  %12 = load i32* %temp, align 4, !dbg !139
  ret i32 %12, !dbg !139
}

; Function Attrs: nounwind uwtable
define void @Push(i32 %i, i32 %s) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %errorfound = alloca i32, align 4
  %localel = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !140), !dbg !141
  store i32 %s, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !142), !dbg !141
  call void @llvm.dbg.declare(metadata !{i32* %errorfound}, metadata !143), !dbg !144
  call void @llvm.dbg.declare(metadata !{i32* %localel}, metadata !145), !dbg !144
  store i32 0, i32* %errorfound, align 4, !dbg !146
  %3 = load i32* %2, align 4, !dbg !147
  %4 = sext i32 %3 to i64, !dbg !147
  %5 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %4, !dbg !147
  %6 = load i32* %5, align 4, !dbg !147
  %7 = icmp sgt i32 %6, 0, !dbg !147
  br i1 %7, label %8, label %21, !dbg !147

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !149
  %10 = sext i32 %9 to i64, !dbg !149
  %11 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %10, !dbg !149
  %12 = load i32* %11, align 4, !dbg !149
  %13 = sext i32 %12 to i64, !dbg !149
  %14 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %13, !dbg !149
  %15 = getelementptr inbounds %struct.element* %14, i32 0, i32 0, !dbg !149
  %16 = load i32* %15, align 4, !dbg !149
  %17 = load i32* %1, align 4, !dbg !149
  %18 = icmp sle i32 %16, %17, !dbg !149
  br i1 %18, label %19, label %20, !dbg !149

; <label>:19                                      ; preds = %8
  store i32 1, i32* %errorfound, align 4, !dbg !151
  call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0)), !dbg !153
  br label %20, !dbg !154

; <label>:20                                      ; preds = %19, %8
  br label %21, !dbg !155

; <label>:21                                      ; preds = %20, %0
  %22 = load i32* %errorfound, align 4, !dbg !156
  %23 = icmp ne i32 %22, 0, !dbg !156
  br i1 %23, label %43, label %24, !dbg !156

; <label>:24                                      ; preds = %21
  %25 = call i32 @Getelement(), !dbg !158
  store i32 %25, i32* %localel, align 4, !dbg !158
  %26 = load i32* %2, align 4, !dbg !160
  %27 = sext i32 %26 to i64, !dbg !160
  %28 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %27, !dbg !160
  %29 = load i32* %28, align 4, !dbg !160
  %30 = load i32* %localel, align 4, !dbg !160
  %31 = sext i32 %30 to i64, !dbg !160
  %32 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %31, !dbg !160
  %33 = getelementptr inbounds %struct.element* %32, i32 0, i32 1, !dbg !160
  store i32 %29, i32* %33, align 4, !dbg !160
  %34 = load i32* %localel, align 4, !dbg !161
  %35 = load i32* %2, align 4, !dbg !161
  %36 = sext i32 %35 to i64, !dbg !161
  %37 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %36, !dbg !161
  store i32 %34, i32* %37, align 4, !dbg !161
  %38 = load i32* %1, align 4, !dbg !162
  %39 = load i32* %localel, align 4, !dbg !162
  %40 = sext i32 %39 to i64, !dbg !162
  %41 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %40, !dbg !162
  %42 = getelementptr inbounds %struct.element* %41, i32 0, i32 0, !dbg !162
  store i32 %38, i32* %42, align 4, !dbg !162
  br label %43, !dbg !163

; <label>:43                                      ; preds = %24, %21
  ret void, !dbg !164
}

; Function Attrs: nounwind uwtable
define void @Init(i32 %s, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %discctr = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !165), !dbg !166
  store i32 %n, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !167), !dbg !166
  call void @llvm.dbg.declare(metadata !{i32* %discctr}, metadata !168), !dbg !169
  %3 = load i32* %1, align 4, !dbg !170
  call void @Makenull(i32 %3), !dbg !170
  %4 = load i32* %2, align 4, !dbg !171
  store i32 %4, i32* %discctr, align 4, !dbg !171
  br label %5, !dbg !171

; <label>:5                                       ; preds = %11, %0
  %6 = load i32* %discctr, align 4, !dbg !171
  %7 = icmp sge i32 %6, 1, !dbg !171
  br i1 %7, label %8, label %14, !dbg !171

; <label>:8                                       ; preds = %5
  %9 = load i32* %discctr, align 4, !dbg !173
  %10 = load i32* %1, align 4, !dbg !173
  call void @Push(i32 %9, i32 %10), !dbg !173
  br label %11, !dbg !173

; <label>:11                                      ; preds = %8
  %12 = load i32* %discctr, align 4, !dbg !171
  %13 = add nsw i32 %12, -1, !dbg !171
  store i32 %13, i32* %discctr, align 4, !dbg !171
  br label %5, !dbg !171

; <label>:14                                      ; preds = %5
  ret void, !dbg !174
}

; Function Attrs: nounwind uwtable
define i32 @Pop(i32 %s) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %temp = alloca i32, align 4
  %temp1 = alloca i32, align 4
  store i32 %s, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !175), !dbg !176
  call void @llvm.dbg.declare(metadata !{i32* %temp}, metadata !177), !dbg !178
  call void @llvm.dbg.declare(metadata !{i32* %temp1}, metadata !179), !dbg !178
  %3 = load i32* %2, align 4, !dbg !180
  %4 = sext i32 %3 to i64, !dbg !180
  %5 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %4, !dbg !180
  %6 = load i32* %5, align 4, !dbg !180
  %7 = icmp sgt i32 %6, 0, !dbg !180
  br i1 %7, label %8, label %42, !dbg !180

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !182
  %10 = sext i32 %9 to i64, !dbg !182
  %11 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %10, !dbg !182
  %12 = load i32* %11, align 4, !dbg !182
  %13 = sext i32 %12 to i64, !dbg !182
  %14 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %13, !dbg !182
  %15 = getelementptr inbounds %struct.element* %14, i32 0, i32 0, !dbg !182
  %16 = load i32* %15, align 4, !dbg !182
  store i32 %16, i32* %temp1, align 4, !dbg !182
  %17 = load i32* %2, align 4, !dbg !184
  %18 = sext i32 %17 to i64, !dbg !184
  %19 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %18, !dbg !184
  %20 = load i32* %19, align 4, !dbg !184
  %21 = sext i32 %20 to i64, !dbg !184
  %22 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %21, !dbg !184
  %23 = getelementptr inbounds %struct.element* %22, i32 0, i32 1, !dbg !184
  %24 = load i32* %23, align 4, !dbg !184
  store i32 %24, i32* %temp, align 4, !dbg !184
  %25 = load i32* @freelist, align 4, !dbg !185
  %26 = load i32* %2, align 4, !dbg !185
  %27 = sext i32 %26 to i64, !dbg !185
  %28 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %27, !dbg !185
  %29 = load i32* %28, align 4, !dbg !185
  %30 = sext i32 %29 to i64, !dbg !185
  %31 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %30, !dbg !185
  %32 = getelementptr inbounds %struct.element* %31, i32 0, i32 1, !dbg !185
  store i32 %25, i32* %32, align 4, !dbg !185
  %33 = load i32* %2, align 4, !dbg !186
  %34 = sext i32 %33 to i64, !dbg !186
  %35 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %34, !dbg !186
  %36 = load i32* %35, align 4, !dbg !186
  store i32 %36, i32* @freelist, align 4, !dbg !186
  %37 = load i32* %temp, align 4, !dbg !187
  %38 = load i32* %2, align 4, !dbg !187
  %39 = sext i32 %38 to i64, !dbg !187
  %40 = getelementptr inbounds [4 x i32]* @stack, i32 0, i64 %39, !dbg !187
  store i32 %37, i32* %40, align 4, !dbg !187
  %41 = load i32* %temp1, align 4, !dbg !188
  store i32 %41, i32* %1, !dbg !188
  br label %44, !dbg !188

; <label>:42                                      ; preds = %0
  call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0)), !dbg !189
  br label %43

; <label>:43                                      ; preds = %42
  store i32 0, i32* %1, !dbg !190
  br label %44, !dbg !190

; <label>:44                                      ; preds = %43, %8
  %45 = load i32* %1, !dbg !191
  ret i32 %45, !dbg !191
}

; Function Attrs: nounwind uwtable
define void @Move(i32 %s1, i32 %s2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %s1, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !192), !dbg !193
  store i32 %s2, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !194), !dbg !193
  %3 = load i32* %1, align 4, !dbg !195
  %4 = call i32 @Pop(i32 %3), !dbg !195
  %5 = load i32* %2, align 4, !dbg !195
  call void @Push(i32 %4, i32 %5), !dbg !195
  %6 = load i32* @movesdone, align 4, !dbg !196
  %7 = add nsw i32 %6, 1, !dbg !196
  store i32 %7, i32* @movesdone, align 4, !dbg !196
  ret void, !dbg !197
}

; Function Attrs: nounwind uwtable
define void @tower(i32 %i, i32 %j, i32 %k) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %other = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !198), !dbg !199
  store i32 %j, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !200), !dbg !199
  store i32 %k, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !201), !dbg !199
  call void @llvm.dbg.declare(metadata !{i32* %other}, metadata !202), !dbg !203
  %4 = load i32* %3, align 4, !dbg !204
  %5 = icmp eq i32 %4, 1, !dbg !204
  br i1 %5, label %6, label %9, !dbg !204

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !204
  %8 = load i32* %2, align 4, !dbg !204
  call void @Move(i32 %7, i32 %8), !dbg !204
  br label %24, !dbg !204

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4, !dbg !206
  %11 = sub nsw i32 6, %10, !dbg !206
  %12 = load i32* %2, align 4, !dbg !206
  %13 = sub nsw i32 %11, %12, !dbg !206
  store i32 %13, i32* %other, align 4, !dbg !206
  %14 = load i32* %1, align 4, !dbg !208
  %15 = load i32* %other, align 4, !dbg !208
  %16 = load i32* %3, align 4, !dbg !208
  %17 = sub nsw i32 %16, 1, !dbg !208
  call void @tower(i32 %14, i32 %15, i32 %17), !dbg !208
  %18 = load i32* %1, align 4, !dbg !209
  %19 = load i32* %2, align 4, !dbg !209
  call void @Move(i32 %18, i32 %19), !dbg !209
  %20 = load i32* %other, align 4, !dbg !210
  %21 = load i32* %2, align 4, !dbg !210
  %22 = load i32* %3, align 4, !dbg !210
  %23 = sub nsw i32 %22, 1, !dbg !210
  call void @tower(i32 %20, i32 %21, i32 %23), !dbg !210
  br label %24

; <label>:24                                      ; preds = %9, %6
  ret void, !dbg !211
}

; Function Attrs: nounwind uwtable
define void @Towers() #0 {
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !212), !dbg !213
  store i32 1, i32* %i, align 4, !dbg !214
  br label %1, !dbg !214

; <label>:1                                       ; preds = %11, %0
  %2 = load i32* %i, align 4, !dbg !214
  %3 = icmp sle i32 %2, 18, !dbg !214
  br i1 %3, label %4, label %14, !dbg !214

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4, !dbg !214
  %6 = sub nsw i32 %5, 1, !dbg !214
  %7 = load i32* %i, align 4, !dbg !214
  %8 = sext i32 %7 to i64, !dbg !214
  %9 = getelementptr inbounds [19 x %struct.element]* @cellspace, i32 0, i64 %8, !dbg !214
  %10 = getelementptr inbounds %struct.element* %9, i32 0, i32 1, !dbg !214
  store i32 %6, i32* %10, align 4, !dbg !214
  br label %11, !dbg !214

; <label>:11                                      ; preds = %4
  %12 = load i32* %i, align 4, !dbg !214
  %13 = add nsw i32 %12, 1, !dbg !214
  store i32 %13, i32* %i, align 4, !dbg !214
  br label %1, !dbg !214

; <label>:14                                      ; preds = %1
  store i32 18, i32* @freelist, align 4, !dbg !216
  call void @Init(i32 1, i32 14), !dbg !217
  call void @Makenull(i32 2), !dbg !218
  call void @Makenull(i32 3), !dbg !219
  store i32 0, i32* @movesdone, align 4, !dbg !220
  call void @tower(i32 1, i32 2, i32 14), !dbg !221
  %15 = load i32* @movesdone, align 4, !dbg !222
  %16 = icmp ne i32 %15, 16383, !dbg !222
  br i1 %16, label %17, label %19, !dbg !222

; <label>:17                                      ; preds = %14
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0)), !dbg !222
  br label %19, !dbg !222

; <label>:19                                      ; preds = %17, %14
  %20 = load i32* @movesdone, align 4, !dbg !224
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %20), !dbg !224
  ret void, !dbg !225
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !226), !dbg !227
  store i32 0, i32* %i, align 4, !dbg !228
  br label %2, !dbg !228

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4, !dbg !228
  %4 = icmp slt i32 %3, 100, !dbg !228
  br i1 %4, label %5, label %9, !dbg !228

; <label>:5                                       ; preds = %2
  call void @Towers(), !dbg !228
  br label %6, !dbg !228

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4, !dbg !228
  %8 = add nsw i32 %7, 1, !dbg !228
  store i32 %8, i32* %i, align 4, !dbg !228
  br label %2, !dbg !228

; <label>:9                                       ; preds = %2
  ret i32 0, !dbg !230
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!115, !116}
!llvm.ident = !{!117}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !34, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c] [DW_LANG_C99]
!1 = metadata !{metadata !"towers.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !17, metadata !20, metadata !21, metadata !24, metadata !25, metadata !28, metadata !29, metadata !32, metadata !33}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Error", metadata !"Error", metadata !"", i32 127, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @Error, null, null, metadata !2, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [Error]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Makenull", metadata !"Makenull", metadata !"", i32 131, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Makenull, null, null, metadata !2, i32 131} ; [ DW_TAG_subprogram ] [line 131] [def] [Makenull]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !11}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Getelement", metadata !"Getelement", metadata !"", i32 135, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Getelement, null, null, metadata !2, i32 135} ; [ DW_TAG_subprogram ] [line 135] [def] [Getelement]
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Push", metadata !"Push", metadata !"", i32 146, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @Push, null, null, metadata !2, i32 146} ; [ DW_TAG_subprogram ] [line 146] [def] [Push]
!22 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = metadata !{null, metadata !11, metadata !11}
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Init", metadata !"Init", metadata !"", i32 162, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @Init, null, null, metadata !2, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Init]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Pop", metadata !"Pop", metadata !"", i32 169, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @Pop, null, null, metadata !2, i32 169} ; [ DW_TAG_subprogram ] [line 169] [def] [Pop]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !11, metadata !11}
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Move", metadata !"Move", metadata !"", i32 184, metadata !22, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @Move, null, null, metadata !2, i32 184} ; [ DW_TAG_subprogram ] [line 184] [def] [Move]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"tower", metadata !"tower", metadata !"", i32 189, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32, i32)* @tower, null, null, metadata !2, i32 189} ; [ DW_TAG_subprogram ] [line 189] [def] [tower]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !11, metadata !11, metadata !11}
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Towers", metadata !"Towers", metadata !"", i32 200, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Towers, null, null, metadata !2, i32 200} ; [ DW_TAG_subprogram ] [line 200] [def] [Towers]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 213, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 214} ; [ DW_TAG_subprogram ] [line 213] [def] [scope 214] [main]
!34 = metadata !{metadata !35, metadata !37, metadata !38, metadata !39, metadata !41, metadata !45, metadata !47, metadata !54, metadata !58, metadata !66, metadata !67, metadata !68, metadata !72, metadata !73, metadata !74, metadata !76, metadata !77, metadata !78, metadata !79, metadata !83, metadata !84, metadata !88, metadata !91, metadata !92, metadata !93, metadata !97, metadata !98, metadata !99, metadata !100, metadata !108, metadata !109, metadata !113, metadata !114}
!35 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !36, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!36 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!37 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !36, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!38 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !36, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !40, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!40 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!41 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !42, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!42 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !43, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!45 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !46, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!46 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!47 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !48, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!48 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!49 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!50 = metadata !{metadata !51, metadata !52, metadata !53}
!51 = metadata !{i32 786445, metadata !1, metadata !49, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!52 = metadata !{i32 786445, metadata !1, metadata !49, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !48} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!53 = metadata !{i32 786445, metadata !1, metadata !49, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!54 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !55, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!55 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!58 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !59, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !60, metadata !64, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!60 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!61 = metadata !{metadata !62, metadata !63}
!62 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!63 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!66 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!68 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !69, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!69 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !70, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!70 = metadata !{metadata !71, metadata !71}
!71 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!72 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !69, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!73 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !69, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !75, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!75 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !36, metadata !70, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!76 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !75, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!77 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !75, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !55, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !80, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!80 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!83 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !80, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !85, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !86, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!88 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !89, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !90, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!90 = metadata !{metadata !82, metadata !87}
!91 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!93 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !94, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!94 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !95, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!97 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!98 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!100 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !101, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!101 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !102, metadata !106, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!102 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!103 = metadata !{metadata !104, metadata !105}
!104 = metadata !{i32 786445, metadata !1, metadata !102, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!105 = metadata !{i32 786445, metadata !1, metadata !102, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !36} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!106 = metadata !{metadata !107}
!107 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!108 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !101, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!109 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !110, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!110 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !102, metadata !111, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!113 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !36, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!114 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !36, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!115 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!116 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!117 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!118 = metadata !{i32 116, i32 0, metadata !4, null}
!119 = metadata !{i32 117, i32 0, metadata !4, null}
!120 = metadata !{i32 120, i32 0, metadata !8, null}
!121 = metadata !{i32 121, i32 0, metadata !8, null}
!122 = metadata !{i32 786689, metadata !12, metadata !"emsg", metadata !5, i32 16777343, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [emsg] [line 127]
!123 = metadata !{i32 127, i32 0, metadata !12, null}
!124 = metadata !{i32 128, i32 0, metadata !12, null}
!125 = metadata !{i32 129, i32 0, metadata !12, null}
!126 = metadata !{i32 786689, metadata !17, metadata !"s", metadata !5, i32 16777347, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 131]
!127 = metadata !{i32 131, i32 0, metadata !17, null}
!128 = metadata !{i32 132, i32 0, metadata !17, null}
!129 = metadata !{i32 133, i32 0, metadata !17, null}
!130 = metadata !{i32 786688, metadata !20, metadata !"temp", metadata !5, i32 136, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 136]
!131 = metadata !{i32 136, i32 0, metadata !20, null}
!132 = metadata !{i32 137, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !20, i32 137, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!134 = metadata !{i32 138, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !133, i32 137, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!136 = metadata !{i32 139, i32 0, metadata !135, null}
!137 = metadata !{i32 140, i32 0, metadata !135, null}
!138 = metadata !{i32 142, i32 0, metadata !133, null}
!139 = metadata !{i32 143, i32 0, metadata !20, null}
!140 = metadata !{i32 786689, metadata !21, metadata !"i", metadata !5, i32 16777362, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 146]
!141 = metadata !{i32 146, i32 0, metadata !21, null}
!142 = metadata !{i32 786689, metadata !21, metadata !"s", metadata !5, i32 33554578, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 146]
!143 = metadata !{i32 786688, metadata !21, metadata !"errorfound", metadata !5, i32 147, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errorfound] [line 147]
!144 = metadata !{i32 147, i32 0, metadata !21, null}
!145 = metadata !{i32 786688, metadata !21, metadata !"localel", metadata !5, i32 147, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [localel] [line 147]
!146 = metadata !{i32 148, i32 0, metadata !21, null}
!147 = metadata !{i32 149, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !21, i32 149, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!149 = metadata !{i32 150, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !148, i32 150, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!151 = metadata !{i32 151, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !150, i32 150, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!153 = metadata !{i32 152, i32 0, metadata !152, null}
!154 = metadata !{i32 153, i32 0, metadata !152, null}
!155 = metadata !{i32 153, i32 0, metadata !150, null}
!156 = metadata !{i32 154, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !21, i32 154, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!158 = metadata !{i32 155, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !1, metadata !157, i32 154, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!160 = metadata !{i32 156, i32 0, metadata !159, null}
!161 = metadata !{i32 157, i32 0, metadata !159, null}
!162 = metadata !{i32 158, i32 0, metadata !159, null}
!163 = metadata !{i32 159, i32 0, metadata !159, null}
!164 = metadata !{i32 160, i32 0, metadata !21, null}
!165 = metadata !{i32 786689, metadata !24, metadata !"s", metadata !5, i32 16777378, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 162]
!166 = metadata !{i32 162, i32 0, metadata !24, null}
!167 = metadata !{i32 786689, metadata !24, metadata !"n", metadata !5, i32 33554594, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 162]
!168 = metadata !{i32 786688, metadata !24, metadata !"discctr", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [discctr] [line 163]
!169 = metadata !{i32 163, i32 0, metadata !24, null}
!170 = metadata !{i32 164, i32 0, metadata !24, null}
!171 = metadata !{i32 165, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !24, i32 165, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!173 = metadata !{i32 166, i32 0, metadata !172, null}
!174 = metadata !{i32 167, i32 0, metadata !24, null}
!175 = metadata !{i32 786689, metadata !25, metadata !"s", metadata !5, i32 16777385, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 169]
!176 = metadata !{i32 169, i32 0, metadata !25, null}
!177 = metadata !{i32 786688, metadata !25, metadata !"temp", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 170]
!178 = metadata !{i32 170, i32 0, metadata !25, null}
!179 = metadata !{i32 786688, metadata !25, metadata !"temp1", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp1] [line 170]
!180 = metadata !{i32 171, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !25, i32 171, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!182 = metadata !{i32 172, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !181, i32 171, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!184 = metadata !{i32 173, i32 0, metadata !183, null}
!185 = metadata !{i32 174, i32 0, metadata !183, null}
!186 = metadata !{i32 175, i32 0, metadata !183, null}
!187 = metadata !{i32 176, i32 0, metadata !183, null}
!188 = metadata !{i32 177, i32 0, metadata !183, null}
!189 = metadata !{i32 180, i32 0, metadata !181, null}
!190 = metadata !{i32 181, i32 0, metadata !25, null}
!191 = metadata !{i32 182, i32 0, metadata !25, null}
!192 = metadata !{i32 786689, metadata !28, metadata !"s1", metadata !5, i32 16777400, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s1] [line 184]
!193 = metadata !{i32 184, i32 0, metadata !28, null}
!194 = metadata !{i32 786689, metadata !28, metadata !"s2", metadata !5, i32 33554616, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s2] [line 184]
!195 = metadata !{i32 185, i32 0, metadata !28, null}
!196 = metadata !{i32 186, i32 0, metadata !28, null}
!197 = metadata !{i32 187, i32 0, metadata !28, null}
!198 = metadata !{i32 786689, metadata !29, metadata !"i", metadata !5, i32 16777405, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 189]
!199 = metadata !{i32 189, i32 0, metadata !29, null}
!200 = metadata !{i32 786689, metadata !29, metadata !"j", metadata !5, i32 33554621, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 189]
!201 = metadata !{i32 786689, metadata !29, metadata !"k", metadata !5, i32 50331837, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 189]
!202 = metadata !{i32 786688, metadata !29, metadata !"other", metadata !5, i32 190, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [other] [line 190]
!203 = metadata !{i32 190, i32 0, metadata !29, null}
!204 = metadata !{i32 191, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !29, i32 191, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!206 = metadata !{i32 193, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 192, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!208 = metadata !{i32 194, i32 0, metadata !207, null}
!209 = metadata !{i32 195, i32 0, metadata !207, null}
!210 = metadata !{i32 196, i32 0, metadata !207, null}
!211 = metadata !{i32 198, i32 0, metadata !29, null}
!212 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 201, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 201]
!213 = metadata !{i32 201, i32 0, metadata !32, null}
!214 = metadata !{i32 202, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !32, i32 202, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!216 = metadata !{i32 203, i32 0, metadata !32, null}
!217 = metadata !{i32 204, i32 0, metadata !32, null}
!218 = metadata !{i32 205, i32 0, metadata !32, null}
!219 = metadata !{i32 206, i32 0, metadata !32, null}
!220 = metadata !{i32 207, i32 0, metadata !32, null}
!221 = metadata !{i32 208, i32 0, metadata !32, null}
!222 = metadata !{i32 209, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !32, i32 209, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!224 = metadata !{i32 210, i32 0, metadata !32, null}
!225 = metadata !{i32 211, i32 0, metadata !32, null}
!226 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 215]
!227 = metadata !{i32 215, i32 0, metadata !33, null}
!228 = metadata !{i32 216, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !33, i32 216, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!230 = metadata !{i32 217, i32 0, metadata !33, null}
