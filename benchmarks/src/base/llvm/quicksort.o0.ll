; ModuleID = 'quicksort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [18 x i8] c" Error in Quick.\0A\00", align 1
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
define void @Initarr() #0 {
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !109), !dbg !110
  call void @llvm.dbg.declare(metadata !{i64* %temp}, metadata !111), !dbg !112
  call void @Initrand(), !dbg !113
  store i32 0, i32* @biggest, align 4, !dbg !114
  store i32 0, i32* @littlest, align 4, !dbg !114
  store i32 1, i32* %i, align 4, !dbg !115
  br label %1, !dbg !115

; <label>:1                                       ; preds = %42, %0
  %2 = load i32* %i, align 4, !dbg !115
  %3 = icmp sle i32 %2, 5000, !dbg !115
  br i1 %3, label %4, label %45, !dbg !115

; <label>:4                                       ; preds = %1
  %5 = call i32 @Rand(), !dbg !117
  %6 = sext i32 %5 to i64, !dbg !117
  store i64 %6, i64* %temp, align 8, !dbg !117
  %7 = load i64* %temp, align 8, !dbg !119
  %8 = load i64* %temp, align 8, !dbg !119
  %9 = sdiv i64 %8, 100000, !dbg !119
  %10 = mul nsw i64 %9, 100000, !dbg !119
  %11 = sub nsw i64 %7, %10, !dbg !119
  %12 = sub nsw i64 %11, 50000, !dbg !119
  %13 = trunc i64 %12 to i32, !dbg !119
  %14 = load i32* %i, align 4, !dbg !119
  %15 = sext i32 %14 to i64, !dbg !119
  %16 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %15, !dbg !119
  store i32 %13, i32* %16, align 4, !dbg !119
  %17 = load i32* %i, align 4, !dbg !120
  %18 = sext i32 %17 to i64, !dbg !120
  %19 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %18, !dbg !120
  %20 = load i32* %19, align 4, !dbg !120
  %21 = load i32* @biggest, align 4, !dbg !120
  %22 = icmp sgt i32 %20, %21, !dbg !120
  br i1 %22, label %23, label %28, !dbg !120

; <label>:23                                      ; preds = %4
  %24 = load i32* %i, align 4, !dbg !120
  %25 = sext i32 %24 to i64, !dbg !120
  %26 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %25, !dbg !120
  %27 = load i32* %26, align 4, !dbg !120
  store i32 %27, i32* @biggest, align 4, !dbg !120
  br label %41, !dbg !120

; <label>:28                                      ; preds = %4
  %29 = load i32* %i, align 4, !dbg !122
  %30 = sext i32 %29 to i64, !dbg !122
  %31 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %30, !dbg !122
  %32 = load i32* %31, align 4, !dbg !122
  %33 = load i32* @littlest, align 4, !dbg !122
  %34 = icmp slt i32 %32, %33, !dbg !122
  br i1 %34, label %35, label %40, !dbg !122

; <label>:35                                      ; preds = %28
  %36 = load i32* %i, align 4, !dbg !122
  %37 = sext i32 %36 to i64, !dbg !122
  %38 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %37, !dbg !122
  %39 = load i32* %38, align 4, !dbg !122
  store i32 %39, i32* @littlest, align 4, !dbg !122
  br label %40, !dbg !122

; <label>:40                                      ; preds = %35, %28
  br label %41

; <label>:41                                      ; preds = %40, %23
  br label %42, !dbg !124

; <label>:42                                      ; preds = %41
  %43 = load i32* %i, align 4, !dbg !115
  %44 = add nsw i32 %43, 1, !dbg !115
  store i32 %44, i32* %i, align 4, !dbg !115
  br label %1, !dbg !115

; <label>:45                                      ; preds = %1
  ret void, !dbg !125
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Quicksort(i32* %a, i32 %l, i32 %r) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca i32, align 4
  %w = alloca i32, align 4
  store i32* %a, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !126), !dbg !127
  store i32 %l, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !128), !dbg !127
  store i32 %r, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !129), !dbg !127
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !130), !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !132), !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !133), !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %w}, metadata !134), !dbg !131
  %4 = load i32* %2, align 4, !dbg !135
  store i32 %4, i32* %i, align 4, !dbg !135
  %5 = load i32* %3, align 4, !dbg !135
  store i32 %5, i32* %j, align 4, !dbg !135
  %6 = load i32* %2, align 4, !dbg !136
  %7 = load i32* %3, align 4, !dbg !136
  %8 = add nsw i32 %6, %7, !dbg !136
  %9 = sdiv i32 %8, 2, !dbg !136
  %10 = sext i32 %9 to i64, !dbg !136
  %11 = load i32** %1, align 8, !dbg !136
  %12 = getelementptr inbounds i32* %11, i64 %10, !dbg !136
  %13 = load i32* %12, align 4, !dbg !136
  store i32 %13, i32* %x, align 4, !dbg !136
  br label %14, !dbg !137

; <label>:14                                      ; preds = %67, %0
  br label %15, !dbg !138

; <label>:15                                      ; preds = %23, %14
  %16 = load i32* %i, align 4, !dbg !138
  %17 = sext i32 %16 to i64, !dbg !138
  %18 = load i32** %1, align 8, !dbg !138
  %19 = getelementptr inbounds i32* %18, i64 %17, !dbg !138
  %20 = load i32* %19, align 4, !dbg !138
  %21 = load i32* %x, align 4, !dbg !138
  %22 = icmp slt i32 %20, %21, !dbg !138
  br i1 %22, label %23, label %26, !dbg !138

; <label>:23                                      ; preds = %15
  %24 = load i32* %i, align 4, !dbg !138
  %25 = add nsw i32 %24, 1, !dbg !138
  store i32 %25, i32* %i, align 4, !dbg !138
  br label %15, !dbg !138

; <label>:26                                      ; preds = %15
  br label %27, !dbg !140

; <label>:27                                      ; preds = %35, %26
  %28 = load i32* %x, align 4, !dbg !140
  %29 = load i32* %j, align 4, !dbg !140
  %30 = sext i32 %29 to i64, !dbg !140
  %31 = load i32** %1, align 8, !dbg !140
  %32 = getelementptr inbounds i32* %31, i64 %30, !dbg !140
  %33 = load i32* %32, align 4, !dbg !140
  %34 = icmp slt i32 %28, %33, !dbg !140
  br i1 %34, label %35, label %38, !dbg !140

; <label>:35                                      ; preds = %27
  %36 = load i32* %j, align 4, !dbg !140
  %37 = sub nsw i32 %36, 1, !dbg !140
  store i32 %37, i32* %j, align 4, !dbg !140
  br label %27, !dbg !140

; <label>:38                                      ; preds = %27
  %39 = load i32* %i, align 4, !dbg !141
  %40 = load i32* %j, align 4, !dbg !141
  %41 = icmp sle i32 %39, %40, !dbg !141
  br i1 %41, label %42, label %66, !dbg !141

; <label>:42                                      ; preds = %38
  %43 = load i32* %i, align 4, !dbg !143
  %44 = sext i32 %43 to i64, !dbg !143
  %45 = load i32** %1, align 8, !dbg !143
  %46 = getelementptr inbounds i32* %45, i64 %44, !dbg !143
  %47 = load i32* %46, align 4, !dbg !143
  store i32 %47, i32* %w, align 4, !dbg !143
  %48 = load i32* %j, align 4, !dbg !145
  %49 = sext i32 %48 to i64, !dbg !145
  %50 = load i32** %1, align 8, !dbg !145
  %51 = getelementptr inbounds i32* %50, i64 %49, !dbg !145
  %52 = load i32* %51, align 4, !dbg !145
  %53 = load i32* %i, align 4, !dbg !145
  %54 = sext i32 %53 to i64, !dbg !145
  %55 = load i32** %1, align 8, !dbg !145
  %56 = getelementptr inbounds i32* %55, i64 %54, !dbg !145
  store i32 %52, i32* %56, align 4, !dbg !145
  %57 = load i32* %w, align 4, !dbg !146
  %58 = load i32* %j, align 4, !dbg !146
  %59 = sext i32 %58 to i64, !dbg !146
  %60 = load i32** %1, align 8, !dbg !146
  %61 = getelementptr inbounds i32* %60, i64 %59, !dbg !146
  store i32 %57, i32* %61, align 4, !dbg !146
  %62 = load i32* %i, align 4, !dbg !147
  %63 = add nsw i32 %62, 1, !dbg !147
  store i32 %63, i32* %i, align 4, !dbg !147
  %64 = load i32* %j, align 4, !dbg !147
  %65 = sub nsw i32 %64, 1, !dbg !147
  store i32 %65, i32* %j, align 4, !dbg !147
  br label %66, !dbg !148

; <label>:66                                      ; preds = %42, %38
  br label %67, !dbg !149

; <label>:67                                      ; preds = %66
  %68 = load i32* %i, align 4, !dbg !149
  %69 = load i32* %j, align 4, !dbg !149
  %70 = icmp sle i32 %68, %69, !dbg !149
  br i1 %70, label %14, label %71, !dbg !149

; <label>:71                                      ; preds = %67
  %72 = load i32* %2, align 4, !dbg !150
  %73 = load i32* %j, align 4, !dbg !150
  %74 = icmp slt i32 %72, %73, !dbg !150
  br i1 %74, label %75, label %79, !dbg !150

; <label>:75                                      ; preds = %71
  %76 = load i32** %1, align 8, !dbg !150
  %77 = load i32* %2, align 4, !dbg !150
  %78 = load i32* %j, align 4, !dbg !150
  call void @Quicksort(i32* %76, i32 %77, i32 %78), !dbg !150
  br label %79, !dbg !150

; <label>:79                                      ; preds = %75, %71
  %80 = load i32* %i, align 4, !dbg !152
  %81 = load i32* %3, align 4, !dbg !152
  %82 = icmp slt i32 %80, %81, !dbg !152
  br i1 %82, label %83, label %87, !dbg !152

; <label>:83                                      ; preds = %79
  %84 = load i32** %1, align 8, !dbg !152
  %85 = load i32* %i, align 4, !dbg !152
  %86 = load i32* %3, align 4, !dbg !152
  call void @Quicksort(i32* %84, i32 %85, i32 %86), !dbg !152
  br label %87, !dbg !152

; <label>:87                                      ; preds = %83, %79
  ret void, !dbg !154
}

; Function Attrs: nounwind uwtable
define void @Quick(i32 %run) #0 {
  %1 = alloca i32, align 4
  store i32 %run, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !155), !dbg !156
  call void @Initarr(), !dbg !157
  call void @Quicksort(i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i32 0), i32 1, i32 5000), !dbg !158
  %2 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 1), align 4, !dbg !159
  %3 = load i32* @littlest, align 4, !dbg !159
  %4 = icmp ne i32 %2, %3, !dbg !159
  br i1 %4, label %9, label %5, !dbg !159

; <label>:5                                       ; preds = %0
  %6 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 5000), align 4, !dbg !159
  %7 = load i32* @biggest, align 4, !dbg !159
  %8 = icmp ne i32 %6, %7, !dbg !159
  br i1 %8, label %9, label %11, !dbg !159

; <label>:9                                       ; preds = %5, %0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)), !dbg !159
  br label %11, !dbg !159

; <label>:11                                      ; preds = %9, %5
  %12 = load i32* %1, align 4, !dbg !161
  %13 = add nsw i32 %12, 1, !dbg !161
  %14 = sext i32 %13 to i64, !dbg !161
  %15 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %14, !dbg !161
  %16 = load i32* %15, align 4, !dbg !161
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %16), !dbg !161
  ret void, !dbg !162
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !163), !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %2, !dbg !165

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4, !dbg !165
  %4 = icmp slt i32 %3, 100, !dbg !165
  br i1 %4, label %5, label %10, !dbg !165

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !165
  call void @Quick(i32 %6), !dbg !165
  br label %7, !dbg !165

; <label>:7                                       ; preds = %5
  %8 = load i32* %i, align 4, !dbg !165
  %9 = add nsw i32 %8, 1, !dbg !165
  store i32 %9, i32* %i, align 4, !dbg !165
  br label %2, !dbg !165

; <label>:10                                      ; preds = %2
  ret i32 0, !dbg !167
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !21, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"quicksort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !13, metadata !17, metadata !20}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initarr", metadata !"Initarr", metadata !"", i32 126, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initarr, null, null, metadata !2, i32 126} ; [ DW_TAG_subprogram ] [line 126] [def] [Initarr]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Quicksort", metadata !"Quicksort", metadata !"", i32 140, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i32)* @Quicksort, null, null, metadata !2, i32 140} ; [ DW_TAG_subprogram ] [line 140] [def] [Quicksort]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !16, metadata !11, metadata !11}
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Quick", metadata !"Quick", metadata !"", i32 161, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Quick, null, null, metadata !2, i32 161} ; [ DW_TAG_subprogram ] [line 161] [def] [Quick]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !11}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 168, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 169} ; [ DW_TAG_subprogram ] [line 168] [def] [scope 169] [main]
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
!109 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 127, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 127]
!110 = metadata !{i32 127, i32 0, metadata !12, null}
!111 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!112 = metadata !{i32 128, i32 0, metadata !12, null}
!113 = metadata !{i32 129, i32 0, metadata !12, null}
!114 = metadata !{i32 130, i32 0, metadata !12, null}
!115 = metadata !{i32 131, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !12, i32 131, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!117 = metadata !{i32 132, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !1, metadata !116, i32 131, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!119 = metadata !{i32 134, i32 0, metadata !118, null}
!120 = metadata !{i32 135, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !118, i32 135, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!122 = metadata !{i32 136, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 136, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!124 = metadata !{i32 137, i32 0, metadata !118, null}
!125 = metadata !{i32 138, i32 0, metadata !12, null}
!126 = metadata !{i32 786689, metadata !13, metadata !"a", metadata !5, i32 16777356, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 140]
!127 = metadata !{i32 140, i32 0, metadata !13, null}
!128 = metadata !{i32 786689, metadata !13, metadata !"l", metadata !5, i32 33554572, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 140]
!129 = metadata !{i32 786689, metadata !13, metadata !"r", metadata !5, i32 50331788, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [r] [line 140]
!130 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 142]
!131 = metadata !{i32 142, i32 0, metadata !13, null}
!132 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 142]
!133 = metadata !{i32 786688, metadata !13, metadata !"x", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 142]
!134 = metadata !{i32 786688, metadata !13, metadata !"w", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 142]
!135 = metadata !{i32 144, i32 0, metadata !13, null}
!136 = metadata !{i32 145, i32 0, metadata !13, null}
!137 = metadata !{i32 146, i32 0, metadata !13, null}
!138 = metadata !{i32 147, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !13, i32 146, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!140 = metadata !{i32 148, i32 0, metadata !139, null}
!141 = metadata !{i32 149, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !139, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!143 = metadata !{i32 150, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !1, metadata !142, i32 149, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!145 = metadata !{i32 151, i32 0, metadata !144, null}
!146 = metadata !{i32 152, i32 0, metadata !144, null}
!147 = metadata !{i32 153, i32 0, metadata !144, null}
!148 = metadata !{i32 154, i32 0, metadata !144, null}
!149 = metadata !{i32 155, i32 0, metadata !139, null}
!150 = metadata !{i32 156, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !13, i32 156, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!152 = metadata !{i32 157, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !13, i32 157, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!154 = metadata !{i32 158, i32 0, metadata !13, null}
!155 = metadata !{i32 786689, metadata !17, metadata !"run", metadata !5, i32 16777377, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 161]
!156 = metadata !{i32 161, i32 0, metadata !17, null}
!157 = metadata !{i32 162, i32 0, metadata !17, null}
!158 = metadata !{i32 163, i32 0, metadata !17, null}
!159 = metadata !{i32 164, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !17, i32 164, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!161 = metadata !{i32 165, i32 0, metadata !17, null}
!162 = metadata !{i32 166, i32 0, metadata !17, null}
!163 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 170]
!164 = metadata !{i32 170, i32 0, metadata !20, null}
!165 = metadata !{i32 171, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !20, i32 171, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!167 = metadata !{i32 172, i32 0, metadata !20, null}
