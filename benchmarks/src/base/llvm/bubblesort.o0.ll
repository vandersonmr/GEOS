; ModuleID = 'bubblesort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@top = common global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
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
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !103
  %2 = mul nsw i64 %1, 1309, !dbg !103
  %3 = add nsw i64 %2, 13849, !dbg !103
  %4 = and i64 %3, 65535, !dbg !103
  store i64 %4, i64* @seed, align 8, !dbg !103
  %5 = load i64* @seed, align 8, !dbg !104
  %6 = trunc i64 %5 to i32, !dbg !104
  ret i32 %6, !dbg !104
}

; Function Attrs: nounwind uwtable
define void @bInitarr() #0 {
  %i = alloca i32, align 4
  %temp = alloca i64, align 8
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !105), !dbg !106
  call void @llvm.dbg.declare(metadata !{i64* %temp}, metadata !107), !dbg !108
  call void @Initrand(), !dbg !109
  store i32 0, i32* @biggest, align 4, !dbg !110
  store i32 0, i32* @littlest, align 4, !dbg !110
  store i32 1, i32* %i, align 4, !dbg !111
  br label %1, !dbg !111

; <label>:1                                       ; preds = %42, %0
  %2 = load i32* %i, align 4, !dbg !111
  %3 = icmp sle i32 %2, 500, !dbg !111
  br i1 %3, label %4, label %45, !dbg !111

; <label>:4                                       ; preds = %1
  %5 = call i32 @Rand(), !dbg !113
  %6 = sext i32 %5 to i64, !dbg !113
  store i64 %6, i64* %temp, align 8, !dbg !113
  %7 = load i64* %temp, align 8, !dbg !115
  %8 = load i64* %temp, align 8, !dbg !115
  %9 = sdiv i64 %8, 100000, !dbg !115
  %10 = mul nsw i64 %9, 100000, !dbg !115
  %11 = sub nsw i64 %7, %10, !dbg !115
  %12 = sub nsw i64 %11, 50000, !dbg !115
  %13 = trunc i64 %12 to i32, !dbg !115
  %14 = load i32* %i, align 4, !dbg !115
  %15 = sext i32 %14 to i64, !dbg !115
  %16 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %15, !dbg !115
  store i32 %13, i32* %16, align 4, !dbg !115
  %17 = load i32* %i, align 4, !dbg !116
  %18 = sext i32 %17 to i64, !dbg !116
  %19 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %18, !dbg !116
  %20 = load i32* %19, align 4, !dbg !116
  %21 = load i32* @biggest, align 4, !dbg !116
  %22 = icmp sgt i32 %20, %21, !dbg !116
  br i1 %22, label %23, label %28, !dbg !116

; <label>:23                                      ; preds = %4
  %24 = load i32* %i, align 4, !dbg !116
  %25 = sext i32 %24 to i64, !dbg !116
  %26 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %25, !dbg !116
  %27 = load i32* %26, align 4, !dbg !116
  store i32 %27, i32* @biggest, align 4, !dbg !116
  br label %41, !dbg !116

; <label>:28                                      ; preds = %4
  %29 = load i32* %i, align 4, !dbg !118
  %30 = sext i32 %29 to i64, !dbg !118
  %31 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %30, !dbg !118
  %32 = load i32* %31, align 4, !dbg !118
  %33 = load i32* @littlest, align 4, !dbg !118
  %34 = icmp slt i32 %32, %33, !dbg !118
  br i1 %34, label %35, label %40, !dbg !118

; <label>:35                                      ; preds = %28
  %36 = load i32* %i, align 4, !dbg !118
  %37 = sext i32 %36 to i64, !dbg !118
  %38 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %37, !dbg !118
  %39 = load i32* %38, align 4, !dbg !118
  store i32 %39, i32* @littlest, align 4, !dbg !118
  br label %40, !dbg !118

; <label>:40                                      ; preds = %35, %28
  br label %41

; <label>:41                                      ; preds = %40, %23
  br label %42, !dbg !120

; <label>:42                                      ; preds = %41
  %43 = load i32* %i, align 4, !dbg !111
  %44 = add nsw i32 %43, 1, !dbg !111
  store i32 %44, i32* %i, align 4, !dbg !111
  br label %1, !dbg !111

; <label>:45                                      ; preds = %1
  ret void, !dbg !121
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Bubble(i32 %run) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !122), !dbg !123
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !124), !dbg !125
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !126), !dbg !125
  call void @bInitarr(), !dbg !127
  store i32 500, i32* @top, align 4, !dbg !128
  br label %2, !dbg !129

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* @top, align 4, !dbg !129
  %4 = icmp sgt i32 %3, 1, !dbg !129
  br i1 %4, label %5, label %45, !dbg !129

; <label>:5                                       ; preds = %2
  store i32 1, i32* %i, align 4, !dbg !130
  br label %6, !dbg !132

; <label>:6                                       ; preds = %39, %5
  %7 = load i32* %i, align 4, !dbg !132
  %8 = load i32* @top, align 4, !dbg !132
  %9 = icmp slt i32 %7, %8, !dbg !132
  br i1 %9, label %10, label %42, !dbg !132

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4, !dbg !133
  %12 = sext i32 %11 to i64, !dbg !133
  %13 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %12, !dbg !133
  %14 = load i32* %13, align 4, !dbg !133
  %15 = load i32* %i, align 4, !dbg !133
  %16 = add nsw i32 %15, 1, !dbg !133
  %17 = sext i32 %16 to i64, !dbg !133
  %18 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %17, !dbg !133
  %19 = load i32* %18, align 4, !dbg !133
  %20 = icmp sgt i32 %14, %19, !dbg !133
  br i1 %20, label %21, label %39, !dbg !133

; <label>:21                                      ; preds = %10
  %22 = load i32* %i, align 4, !dbg !136
  %23 = sext i32 %22 to i64, !dbg !136
  %24 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %23, !dbg !136
  %25 = load i32* %24, align 4, !dbg !136
  store i32 %25, i32* %j, align 4, !dbg !136
  %26 = load i32* %i, align 4, !dbg !138
  %27 = add nsw i32 %26, 1, !dbg !138
  %28 = sext i32 %27 to i64, !dbg !138
  %29 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %28, !dbg !138
  %30 = load i32* %29, align 4, !dbg !138
  %31 = load i32* %i, align 4, !dbg !138
  %32 = sext i32 %31 to i64, !dbg !138
  %33 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %32, !dbg !138
  store i32 %30, i32* %33, align 4, !dbg !138
  %34 = load i32* %j, align 4, !dbg !139
  %35 = load i32* %i, align 4, !dbg !139
  %36 = add nsw i32 %35, 1, !dbg !139
  %37 = sext i32 %36 to i64, !dbg !139
  %38 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %37, !dbg !139
  store i32 %34, i32* %38, align 4, !dbg !139
  br label %39, !dbg !140

; <label>:39                                      ; preds = %21, %10
  %40 = load i32* %i, align 4, !dbg !141
  %41 = add nsw i32 %40, 1, !dbg !141
  store i32 %41, i32* %i, align 4, !dbg !141
  br label %6, !dbg !142

; <label>:42                                      ; preds = %6
  %43 = load i32* @top, align 4, !dbg !143
  %44 = sub nsw i32 %43, 1, !dbg !143
  store i32 %44, i32* @top, align 4, !dbg !143
  br label %2, !dbg !144

; <label>:45                                      ; preds = %2
  %46 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 1), align 4, !dbg !145
  %47 = load i32* @littlest, align 4, !dbg !145
  %48 = icmp ne i32 %46, %47, !dbg !145
  br i1 %48, label %53, label %49, !dbg !145

; <label>:49                                      ; preds = %45
  %50 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i32 0, i64 500), align 4, !dbg !145
  %51 = load i32* @biggest, align 4, !dbg !145
  %52 = icmp ne i32 %50, %51, !dbg !145
  br i1 %52, label %53, label %55, !dbg !145

; <label>:53                                      ; preds = %49, %45
  %54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0)), !dbg !147
  br label %55, !dbg !147

; <label>:55                                      ; preds = %53, %49
  %56 = load i32* %1, align 4, !dbg !148
  %57 = add nsw i32 %56, 1, !dbg !148
  %58 = sext i32 %57 to i64, !dbg !148
  %59 = getelementptr inbounds [5001 x i32]* @sortlist, i32 0, i64 %58, !dbg !148
  %60 = load i32* %59, align 4, !dbg !148
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %60), !dbg !148
  ret void, !dbg !149
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !150), !dbg !151
  store i32 0, i32* %i, align 4, !dbg !152
  br label %2, !dbg !152

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4, !dbg !152
  %4 = icmp slt i32 %3, 100, !dbg !152
  br i1 %4, label %5, label %10, !dbg !152

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !152
  call void @Bubble(i32 %6), !dbg !152
  br label %7, !dbg !152

; <label>:7                                       ; preds = %5
  %8 = load i32* %i, align 4, !dbg !152
  %9 = add nsw i32 %8, 1, !dbg !152
  store i32 %9, i32* %i, align 4, !dbg !152
  br label %2, !dbg !152

; <label>:10                                      ; preds = %2
  ret i32 0, !dbg !154
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!98, !99}
!llvm.ident = !{!100}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !17, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"bubblesort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bInitarr", metadata !"bInitarr", metadata !"", i32 127, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @bInitarr, null, null, metadata !2, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [bInitarr]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Bubble", metadata !"Bubble", metadata !"", i32 141, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Bubble, null, null, metadata !2, i32 141} ; [ DW_TAG_subprogram ] [line 141] [def] [Bubble]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !11}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 166, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 167} ; [ DW_TAG_subprogram ] [line 166] [def] [scope 167] [main]
!17 = metadata !{metadata !18, metadata !20, metadata !21, metadata !22, metadata !24, metadata !28, metadata !30, metadata !37, metadata !41, metadata !49, metadata !50, metadata !51, metadata !55, metadata !56, metadata !57, metadata !59, metadata !60, metadata !61, metadata !62, metadata !66, metadata !67, metadata !71, metadata !74, metadata !75, metadata !76, metadata !80, metadata !81, metadata !82, metadata !83, metadata !91, metadata !92, metadata !96, metadata !97}
!18 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !19, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!19 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!20 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !19, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!21 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !19, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!22 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !23, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!23 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!24 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !25, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!25 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !26, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!28 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !29, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!29 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !31, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!32 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!33 = metadata !{metadata !34, metadata !35, metadata !36}
!34 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!35 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !31} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!36 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!37 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !38, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!41 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !42, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!42 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !43, metadata !47, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!43 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786445, metadata !1, metadata !43, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!46 = metadata !{i32 786445, metadata !1, metadata !43, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!49 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!51 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !52, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!52 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !53, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!53 = metadata !{metadata !54, metadata !54}
!54 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!55 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !52, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !52, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !58, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!58 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !19, metadata !53, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!59 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !58, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !58, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !38, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !63, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!63 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !64, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!66 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !63, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !68, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!68 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !69, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!71 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !72, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !73, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!73 = metadata !{metadata !65, metadata !70}
!74 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !77, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!77 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !78, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!78 = metadata !{metadata !79}
!79 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!80 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!82 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !84, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!84 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !85, metadata !89, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!85 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!86 = metadata !{metadata !87, metadata !88}
!87 = metadata !{i32 786445, metadata !1, metadata !85, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!88 = metadata !{i32 786445, metadata !1, metadata !85, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!89 = metadata !{metadata !90}
!90 = metadata !{i32 786465, i64 0, i64 257}      ; [ DW_TAG_subrange_type ] [0, 256]
!91 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !84, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !93, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!93 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !85, metadata !94, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786465, i64 0, i64 130}      ; [ DW_TAG_subrange_type ] [0, 129]
!96 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !19, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!97 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !19, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!98 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!99 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!100 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!101 = metadata !{i32 116, i32 0, metadata !4, null}
!102 = metadata !{i32 117, i32 0, metadata !4, null}
!103 = metadata !{i32 120, i32 0, metadata !8, null}
!104 = metadata !{i32 121, i32 0, metadata !8, null}
!105 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 128]
!106 = metadata !{i32 128, i32 0, metadata !12, null}
!107 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 129, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 129]
!108 = metadata !{i32 129, i32 0, metadata !12, null}
!109 = metadata !{i32 130, i32 0, metadata !12, null}
!110 = metadata !{i32 131, i32 0, metadata !12, null}
!111 = metadata !{i32 132, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !12, i32 132, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!113 = metadata !{i32 133, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !112, i32 132, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!115 = metadata !{i32 135, i32 0, metadata !114, null}
!116 = metadata !{i32 136, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !114, i32 136, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!118 = metadata !{i32 137, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !117, i32 137, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!120 = metadata !{i32 138, i32 0, metadata !114, null}
!121 = metadata !{i32 139, i32 0, metadata !12, null}
!122 = metadata !{i32 786689, metadata !13, metadata !"run", metadata !5, i32 16777357, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 141]
!123 = metadata !{i32 141, i32 0, metadata !13, null}
!124 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 142]
!125 = metadata !{i32 142, i32 0, metadata !13, null}
!126 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 142]
!127 = metadata !{i32 143, i32 0, metadata !13, null}
!128 = metadata !{i32 144, i32 0, metadata !13, null}
!129 = metadata !{i32 146, i32 0, metadata !13, null}
!130 = metadata !{i32 148, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !13, i32 146, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!132 = metadata !{i32 149, i32 0, metadata !131, null}
!133 = metadata !{i32 151, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !135, i32 151, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!135 = metadata !{i32 786443, metadata !1, metadata !131, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!136 = metadata !{i32 152, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !134, i32 151, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!138 = metadata !{i32 153, i32 0, metadata !137, null}
!139 = metadata !{i32 154, i32 0, metadata !137, null}
!140 = metadata !{i32 155, i32 0, metadata !137, null}
!141 = metadata !{i32 156, i32 0, metadata !135, null}
!142 = metadata !{i32 157, i32 0, metadata !135, null}
!143 = metadata !{i32 159, i32 0, metadata !131, null}
!144 = metadata !{i32 160, i32 0, metadata !131, null}
!145 = metadata !{i32 161, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !13, i32 161, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!147 = metadata !{i32 162, i32 0, metadata !146, null}
!148 = metadata !{i32 163, i32 0, metadata !13, null}
!149 = metadata !{i32 164, i32 0, metadata !13, null}
!150 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 168, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 168]
!151 = metadata !{i32 168, i32 0, metadata !16, null}
!152 = metadata !{i32 169, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !16, i32 169, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!154 = metadata !{i32 170, i32 0, metadata !16, null}
