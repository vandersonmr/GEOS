; ModuleID = 'queens.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
  store i64 74755, i64* @seed, align 8, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !107
  %2 = mul nsw i64 %1, 1309, !dbg !107
  %3 = add nsw i64 %2, 13849, !dbg !107
  %4 = and i64 %3, 65535, !dbg !107
  store i64 %4, i64* @seed, align 8, !dbg !107
  %5 = load i64* @seed, align 8, !dbg !108
  %6 = trunc i64 %5 to i32, !dbg !108
  ret i32 %6, !dbg !108
}

; Function Attrs: nounwind uwtable
define void @Try(i32 %i, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %j = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !109), !dbg !110
  store i32* %q, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !111), !dbg !110
  store i32* %a, i32** %3, align 8
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !112), !dbg !110
  store i32* %b, i32** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32** %4}, metadata !113), !dbg !110
  store i32* %c, i32** %5, align 8
  call void @llvm.dbg.declare(metadata !{i32** %5}, metadata !114), !dbg !110
  store i32* %x, i32** %6, align 8
  call void @llvm.dbg.declare(metadata !{i32** %6}, metadata !115), !dbg !110
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !116), !dbg !117
  store i32 0, i32* %j, align 4, !dbg !118
  %7 = load i32** %2, align 8, !dbg !119
  store i32 0, i32* %7, align 4, !dbg !119
  br label %8, !dbg !120

; <label>:8                                       ; preds = %104, %0
  %9 = load i32** %2, align 8, !dbg !120
  %10 = load i32* %9, align 4, !dbg !120
  %11 = icmp ne i32 %10, 0, !dbg !120
  br i1 %11, label %15, label %12, !dbg !120

; <label>:12                                      ; preds = %8
  %13 = load i32* %j, align 4, !dbg !120
  %14 = icmp ne i32 %13, 8, !dbg !120
  br label %15

; <label>:15                                      ; preds = %12, %8
  %16 = phi i1 [ false, %8 ], [ %14, %12 ]
  br i1 %16, label %17, label %105

; <label>:17                                      ; preds = %15
  %18 = load i32* %j, align 4, !dbg !121
  %19 = add nsw i32 %18, 1, !dbg !121
  store i32 %19, i32* %j, align 4, !dbg !121
  %20 = load i32** %2, align 8, !dbg !123
  store i32 0, i32* %20, align 4, !dbg !123
  %21 = load i32* %j, align 4, !dbg !124
  %22 = sext i32 %21 to i64, !dbg !124
  %23 = load i32** %4, align 8, !dbg !124
  %24 = getelementptr inbounds i32* %23, i64 %22, !dbg !124
  %25 = load i32* %24, align 4, !dbg !124
  %26 = icmp ne i32 %25, 0, !dbg !124
  br i1 %26, label %27, label %104, !dbg !124

; <label>:27                                      ; preds = %17
  %28 = load i32* %1, align 4, !dbg !124
  %29 = load i32* %j, align 4, !dbg !124
  %30 = add nsw i32 %28, %29, !dbg !124
  %31 = sext i32 %30 to i64, !dbg !124
  %32 = load i32** %3, align 8, !dbg !124
  %33 = getelementptr inbounds i32* %32, i64 %31, !dbg !124
  %34 = load i32* %33, align 4, !dbg !124
  %35 = icmp ne i32 %34, 0, !dbg !124
  br i1 %35, label %36, label %104, !dbg !124

; <label>:36                                      ; preds = %27
  %37 = load i32* %1, align 4, !dbg !124
  %38 = load i32* %j, align 4, !dbg !124
  %39 = sub nsw i32 %37, %38, !dbg !124
  %40 = add nsw i32 %39, 7, !dbg !124
  %41 = sext i32 %40 to i64, !dbg !124
  %42 = load i32** %5, align 8, !dbg !124
  %43 = getelementptr inbounds i32* %42, i64 %41, !dbg !124
  %44 = load i32* %43, align 4, !dbg !124
  %45 = icmp ne i32 %44, 0, !dbg !124
  br i1 %45, label %46, label %104, !dbg !124

; <label>:46                                      ; preds = %36
  %47 = load i32* %j, align 4, !dbg !126
  %48 = load i32* %1, align 4, !dbg !126
  %49 = sext i32 %48 to i64, !dbg !126
  %50 = load i32** %6, align 8, !dbg !126
  %51 = getelementptr inbounds i32* %50, i64 %49, !dbg !126
  store i32 %47, i32* %51, align 4, !dbg !126
  %52 = load i32* %j, align 4, !dbg !128
  %53 = sext i32 %52 to i64, !dbg !128
  %54 = load i32** %4, align 8, !dbg !128
  %55 = getelementptr inbounds i32* %54, i64 %53, !dbg !128
  store i32 0, i32* %55, align 4, !dbg !128
  %56 = load i32* %1, align 4, !dbg !129
  %57 = load i32* %j, align 4, !dbg !129
  %58 = add nsw i32 %56, %57, !dbg !129
  %59 = sext i32 %58 to i64, !dbg !129
  %60 = load i32** %3, align 8, !dbg !129
  %61 = getelementptr inbounds i32* %60, i64 %59, !dbg !129
  store i32 0, i32* %61, align 4, !dbg !129
  %62 = load i32* %1, align 4, !dbg !130
  %63 = load i32* %j, align 4, !dbg !130
  %64 = sub nsw i32 %62, %63, !dbg !130
  %65 = add nsw i32 %64, 7, !dbg !130
  %66 = sext i32 %65 to i64, !dbg !130
  %67 = load i32** %5, align 8, !dbg !130
  %68 = getelementptr inbounds i32* %67, i64 %66, !dbg !130
  store i32 0, i32* %68, align 4, !dbg !130
  %69 = load i32* %1, align 4, !dbg !131
  %70 = icmp slt i32 %69, 8, !dbg !131
  br i1 %70, label %71, label %101, !dbg !131

; <label>:71                                      ; preds = %46
  %72 = load i32* %1, align 4, !dbg !133
  %73 = add nsw i32 %72, 1, !dbg !133
  %74 = load i32** %2, align 8, !dbg !133
  %75 = load i32** %3, align 8, !dbg !133
  %76 = load i32** %4, align 8, !dbg !133
  %77 = load i32** %5, align 8, !dbg !133
  %78 = load i32** %6, align 8, !dbg !133
  call void @Try(i32 %73, i32* %74, i32* %75, i32* %76, i32* %77, i32* %78), !dbg !133
  %79 = load i32** %2, align 8, !dbg !135
  %80 = load i32* %79, align 4, !dbg !135
  %81 = icmp ne i32 %80, 0, !dbg !135
  br i1 %81, label %100, label %82, !dbg !135

; <label>:82                                      ; preds = %71
  %83 = load i32* %j, align 4, !dbg !137
  %84 = sext i32 %83 to i64, !dbg !137
  %85 = load i32** %4, align 8, !dbg !137
  %86 = getelementptr inbounds i32* %85, i64 %84, !dbg !137
  store i32 1, i32* %86, align 4, !dbg !137
  %87 = load i32* %1, align 4, !dbg !139
  %88 = load i32* %j, align 4, !dbg !139
  %89 = add nsw i32 %87, %88, !dbg !139
  %90 = sext i32 %89 to i64, !dbg !139
  %91 = load i32** %3, align 8, !dbg !139
  %92 = getelementptr inbounds i32* %91, i64 %90, !dbg !139
  store i32 1, i32* %92, align 4, !dbg !139
  %93 = load i32* %1, align 4, !dbg !140
  %94 = load i32* %j, align 4, !dbg !140
  %95 = sub nsw i32 %93, %94, !dbg !140
  %96 = add nsw i32 %95, 7, !dbg !140
  %97 = sext i32 %96 to i64, !dbg !140
  %98 = load i32** %5, align 8, !dbg !140
  %99 = getelementptr inbounds i32* %98, i64 %97, !dbg !140
  store i32 1, i32* %99, align 4, !dbg !140
  br label %100, !dbg !141

; <label>:100                                     ; preds = %82, %71
  br label %103, !dbg !142

; <label>:101                                     ; preds = %46
  %102 = load i32** %2, align 8, !dbg !143
  store i32 1, i32* %102, align 4, !dbg !143
  br label %103

; <label>:103                                     ; preds = %101, %100
  br label %104, !dbg !144

; <label>:104                                     ; preds = %103, %36, %27, %17
  br label %8, !dbg !145

; <label>:105                                     ; preds = %15
  ret void, !dbg !146
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Doit() #0 {
  %i = alloca i32, align 4
  %q = alloca i32, align 4
  %a = alloca [9 x i32], align 16
  %b = alloca [17 x i32], align 16
  %c = alloca [15 x i32], align 16
  %x = alloca [9 x i32], align 16
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !147), !dbg !148
  call void @llvm.dbg.declare(metadata !{i32* %q}, metadata !149), !dbg !148
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %a}, metadata !150), !dbg !154
  call void @llvm.dbg.declare(metadata !{[17 x i32]* %b}, metadata !155), !dbg !154
  call void @llvm.dbg.declare(metadata !{[15 x i32]* %c}, metadata !159), !dbg !154
  call void @llvm.dbg.declare(metadata !{[9 x i32]* %x}, metadata !163), !dbg !154
  store i32 -7, i32* %i, align 4, !dbg !164
  br label %1, !dbg !165

; <label>:1                                       ; preds = %29, %0
  %2 = load i32* %i, align 4, !dbg !165
  %3 = icmp sle i32 %2, 16, !dbg !165
  br i1 %3, label %4, label %32, !dbg !165

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4, !dbg !166
  %6 = icmp sge i32 %5, 1, !dbg !166
  br i1 %6, label %7, label %14, !dbg !166

; <label>:7                                       ; preds = %4
  %8 = load i32* %i, align 4, !dbg !166
  %9 = icmp sle i32 %8, 8, !dbg !166
  br i1 %9, label %10, label %14, !dbg !166

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4, !dbg !166
  %12 = sext i32 %11 to i64, !dbg !166
  %13 = getelementptr inbounds [9 x i32]* %a, i32 0, i64 %12, !dbg !166
  store i32 1, i32* %13, align 4, !dbg !166
  br label %14, !dbg !166

; <label>:14                                      ; preds = %10, %7, %4
  %15 = load i32* %i, align 4, !dbg !169
  %16 = icmp sge i32 %15, 2, !dbg !169
  br i1 %16, label %17, label %21, !dbg !169

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4, !dbg !169
  %19 = sext i32 %18 to i64, !dbg !169
  %20 = getelementptr inbounds [17 x i32]* %b, i32 0, i64 %19, !dbg !169
  store i32 1, i32* %20, align 4, !dbg !169
  br label %21, !dbg !169

; <label>:21                                      ; preds = %17, %14
  %22 = load i32* %i, align 4, !dbg !171
  %23 = icmp sle i32 %22, 7, !dbg !171
  br i1 %23, label %24, label %29, !dbg !171

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4, !dbg !171
  %26 = add nsw i32 %25, 7, !dbg !171
  %27 = sext i32 %26 to i64, !dbg !171
  %28 = getelementptr inbounds [15 x i32]* %c, i32 0, i64 %27, !dbg !171
  store i32 1, i32* %28, align 4, !dbg !171
  br label %29, !dbg !171

; <label>:29                                      ; preds = %24, %21
  %30 = load i32* %i, align 4, !dbg !173
  %31 = add nsw i32 %30, 1, !dbg !173
  store i32 %31, i32* %i, align 4, !dbg !173
  br label %1, !dbg !174

; <label>:32                                      ; preds = %1
  %33 = getelementptr inbounds [17 x i32]* %b, i32 0, i32 0, !dbg !175
  %34 = getelementptr inbounds [9 x i32]* %a, i32 0, i32 0, !dbg !175
  %35 = getelementptr inbounds [15 x i32]* %c, i32 0, i32 0, !dbg !175
  %36 = getelementptr inbounds [9 x i32]* %x, i32 0, i32 0, !dbg !175
  call void @Try(i32 1, i32* %q, i32* %33, i32* %34, i32* %35, i32* %36), !dbg !175
  %37 = load i32* %q, align 4, !dbg !176
  %38 = icmp ne i32 %37, 0, !dbg !176
  br i1 %38, label %41, label %39, !dbg !176

; <label>:39                                      ; preds = %32
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0)), !dbg !176
  br label %41, !dbg !176

; <label>:41                                      ; preds = %39, %32
  ret void, !dbg !178
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @Queens(i32 %run) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %run, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !179), !dbg !180
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !181), !dbg !182
  store i32 1, i32* %i, align 4, !dbg !183
  br label %2, !dbg !183

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4, !dbg !183
  %4 = icmp sle i32 %3, 50, !dbg !183
  br i1 %4, label %5, label %9, !dbg !183

; <label>:5                                       ; preds = %2
  call void @Doit(), !dbg !183
  br label %6, !dbg !183

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4, !dbg !183
  %8 = add nsw i32 %7, 1, !dbg !183
  store i32 %8, i32* %i, align 4, !dbg !183
  br label %2, !dbg !183

; <label>:9                                       ; preds = %2
  %10 = load i32* %1, align 4, !dbg !185
  %11 = add nsw i32 %10, 1, !dbg !185
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %11), !dbg !185
  ret void, !dbg !186
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !187), !dbg !188
  store i32 0, i32* %i, align 4, !dbg !189
  br label %2, !dbg !189

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4, !dbg !189
  %4 = icmp slt i32 %3, 100, !dbg !189
  br i1 %4, label %5, label %10, !dbg !189

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !189
  call void @Queens(i32 %6), !dbg !189
  br label %7, !dbg !189

; <label>:7                                       ; preds = %5
  %8 = load i32* %i, align 4, !dbg !189
  %9 = add nsw i32 %8, 1, !dbg !189
  store i32 %9, i32* %i, align 4, !dbg !189
  br label %2, !dbg !189

; <label>:10                                      ; preds = %2
  ret i32 0, !dbg !191
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !21, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c] [DW_LANG_C99]
!1 = metadata !{metadata !"queens.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !16, metadata !17, metadata !20}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Try", metadata !"Try", metadata !"", i32 137, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32*, i32*, i32*, i32*, i32*)* @Try, null, null, metadata !2, i32 137} ; [ DW_TAG_subprogram ] [line 137] [def] [Try]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !11, metadata !15, metadata !15, metadata !15, metadata !15, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Doit", metadata !"Doit", metadata !"", i32 162, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Doit, null, null, metadata !2, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Doit]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Queens", metadata !"Queens", metadata !"", i32 177, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Queens, null, null, metadata !2, i32 177} ; [ DW_TAG_subprogram ] [line 177] [def] [Queens]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !11}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 183, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 184} ; [ DW_TAG_subprogram ] [line 183] [def] [scope 184] [main]
!21 = metadata !{metadata !22, metadata !24, metadata !25, metadata !26, metadata !28, metadata !32, metadata !34, metadata !41, metadata !45, metadata !53, metadata !54, metadata !55, metadata !59, metadata !60, metadata !61, metadata !63, metadata !64, metadata !65, metadata !66, metadata !70, metadata !71, metadata !75, metadata !78, metadata !79, metadata !80, metadata !84, metadata !85, metadata !86, metadata !87, metadata !95, metadata !96, metadata !100, metadata !101}
!22 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !23, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!23 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!24 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !23, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!25 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !23, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !27, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!27 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!28 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !29, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!29 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !30, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!32 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !33, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!33 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!34 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !35, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!35 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!36 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!37 = metadata !{metadata !38, metadata !39, metadata !40}
!38 = metadata !{i32 786445, metadata !1, metadata !36, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!39 = metadata !{i32 786445, metadata !1, metadata !36, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !35} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!40 = metadata !{i32 786445, metadata !1, metadata !36, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!41 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !42, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!42 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !43, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!45 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !46, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!46 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !47, metadata !51, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!47 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786445, metadata !1, metadata !47, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!50 = metadata !{i32 786445, metadata !1, metadata !47, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!53 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !56, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!56 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!57 = metadata !{metadata !58, metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!59 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !56, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !56, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !62, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!62 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !23, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!63 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !62, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !62, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !42, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !67, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!67 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !68, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!70 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !67, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!71 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !72, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !73, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!75 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !76, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!76 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !77, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!77 = metadata !{metadata !69, metadata !74}
!78 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !81, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!81 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !82, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!84 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !88, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!88 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !89, metadata !93, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!89 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !90, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!90 = metadata !{metadata !91, metadata !92}
!91 = metadata !{i32 786445, metadata !1, metadata !89, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!92 = metadata !{i32 786445, metadata !1, metadata !89, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!93 = metadata !{metadata !94}
!94 = metadata !{i32 786465, i64 0, i64 257}      ; [ DW_TAG_subrange_type ] [0, 256]
!95 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !88, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!96 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !97, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!97 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !89, metadata !98, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!98 = metadata !{metadata !99}
!99 = metadata !{i32 786465, i64 0, i64 130}      ; [ DW_TAG_subrange_type ] [0, 129]
!100 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !23, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!101 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !23, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!102 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!103 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!104 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!105 = metadata !{i32 116, i32 0, metadata !4, null}
!106 = metadata !{i32 117, i32 0, metadata !4, null}
!107 = metadata !{i32 120, i32 0, metadata !8, null}
!108 = metadata !{i32 121, i32 0, metadata !8, null}
!109 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777353, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 137]
!110 = metadata !{i32 137, i32 0, metadata !12, null}
!111 = metadata !{i32 786689, metadata !12, metadata !"q", metadata !5, i32 33554569, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 137]
!112 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 50331785, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 137]
!113 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 67109001, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 137]
!114 = metadata !{i32 786689, metadata !12, metadata !"c", metadata !5, i32 83886217, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 137]
!115 = metadata !{i32 786689, metadata !12, metadata !"x", metadata !5, i32 100663433, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 137]
!116 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 138]
!117 = metadata !{i32 138, i32 0, metadata !12, null}
!118 = metadata !{i32 139, i32 0, metadata !12, null}
!119 = metadata !{i32 140, i32 0, metadata !12, null}
!120 = metadata !{i32 141, i32 0, metadata !12, null}
!121 = metadata !{i32 142, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !12, i32 141, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!123 = metadata !{i32 143, i32 0, metadata !122, null}
!124 = metadata !{i32 144, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !122, i32 144, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!126 = metadata !{i32 145, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !125, i32 144, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!128 = metadata !{i32 146, i32 0, metadata !127, null}
!129 = metadata !{i32 147, i32 0, metadata !127, null}
!130 = metadata !{i32 148, i32 0, metadata !127, null}
!131 = metadata !{i32 149, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !127, i32 149, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!133 = metadata !{i32 150, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !132, i32 149, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!135 = metadata !{i32 151, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !134, i32 151, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!137 = metadata !{i32 152, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !136, i32 151, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!139 = metadata !{i32 153, i32 0, metadata !138, null}
!140 = metadata !{i32 154, i32 0, metadata !138, null}
!141 = metadata !{i32 155, i32 0, metadata !138, null}
!142 = metadata !{i32 156, i32 0, metadata !134, null}
!143 = metadata !{i32 157, i32 0, metadata !132, null}
!144 = metadata !{i32 158, i32 0, metadata !127, null}
!145 = metadata !{i32 159, i32 0, metadata !122, null}
!146 = metadata !{i32 160, i32 0, metadata !12, null}
!147 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 163]
!148 = metadata !{i32 163, i32 0, metadata !16, null}
!149 = metadata !{i32 786688, metadata !16, metadata !"q", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 163]
!150 = metadata !{i32 786688, metadata !16, metadata !"a", metadata !5, i32 164, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 164]
!151 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 288, i64 32, i32 0, i32 0, metadata !11, metadata !152, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from int]
!152 = metadata !{metadata !153}
!153 = metadata !{i32 786465, i64 0, i64 9}       ; [ DW_TAG_subrange_type ] [0, 8]
!154 = metadata !{i32 164, i32 0, metadata !16, null}
!155 = metadata !{i32 786688, metadata !16, metadata !"b", metadata !5, i32 164, metadata !156, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 164]
!156 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !11, metadata !157, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!157 = metadata !{metadata !158}
!158 = metadata !{i32 786465, i64 0, i64 17}      ; [ DW_TAG_subrange_type ] [0, 16]
!159 = metadata !{i32 786688, metadata !16, metadata !"c", metadata !5, i32 164, metadata !160, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 164]
!160 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 480, i64 32, i32 0, i32 0, metadata !11, metadata !161, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 480, align 32, offset 0] [from int]
!161 = metadata !{metadata !162}
!162 = metadata !{i32 786465, i64 0, i64 15}      ; [ DW_TAG_subrange_type ] [0, 14]
!163 = metadata !{i32 786688, metadata !16, metadata !"x", metadata !5, i32 164, metadata !151, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 164]
!164 = metadata !{i32 165, i32 0, metadata !16, null}
!165 = metadata !{i32 166, i32 0, metadata !16, null}
!166 = metadata !{i32 167, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !168, i32 167, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!168 = metadata !{i32 786443, metadata !1, metadata !16, i32 166, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!169 = metadata !{i32 168, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 168, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!171 = metadata !{i32 169, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !168, i32 169, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!173 = metadata !{i32 170, i32 0, metadata !168, null}
!174 = metadata !{i32 171, i32 0, metadata !168, null}
!175 = metadata !{i32 173, i32 0, metadata !16, null}
!176 = metadata !{i32 174, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !16, i32 174, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!178 = metadata !{i32 175, i32 0, metadata !16, null}
!179 = metadata !{i32 786689, metadata !17, metadata !"run", metadata !5, i32 16777393, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 177]
!180 = metadata !{i32 177, i32 0, metadata !17, null}
!181 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 178, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 178]
!182 = metadata !{i32 178, i32 0, metadata !17, null}
!183 = metadata !{i32 179, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !17, i32 179, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!185 = metadata !{i32 180, i32 0, metadata !17, null}
!186 = metadata !{i32 181, i32 0, metadata !17, null}
!187 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 185, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 185]
!188 = metadata !{i32 185, i32 0, metadata !20, null}
!189 = metadata !{i32 186, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !20, i32 186, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!191 = metadata !{i32 187, i32 0, metadata !20, null}
