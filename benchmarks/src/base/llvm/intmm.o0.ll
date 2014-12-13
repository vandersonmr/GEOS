; ModuleID = 'intmm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
  store i64 74755, i64* @seed, align 8, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !112
  %2 = mul nsw i64 %1, 1309, !dbg !112
  %3 = add nsw i64 %2, 13849, !dbg !112
  %4 = and i64 %3, 65535, !dbg !112
  store i64 %4, i64* @seed, align 8, !dbg !112
  %5 = load i64* @seed, align 8, !dbg !113
  %6 = trunc i64 %5 to i32, !dbg !113
  ret i32 %6, !dbg !113
}

; Function Attrs: nounwind uwtable
define void @Initmatrix([41 x i32]* %m) #0 {
  %1 = alloca [41 x i32]*, align 8
  %temp = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [41 x i32]* %m, [41 x i32]** %1, align 8
  call void @llvm.dbg.declare(metadata !{[41 x i32]** %1}, metadata !114), !dbg !115
  call void @llvm.dbg.declare(metadata !{i32* %temp}, metadata !116), !dbg !117
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !118), !dbg !117
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !119), !dbg !117
  store i32 1, i32* %i, align 4, !dbg !120
  br label %2, !dbg !120

; <label>:2                                       ; preds = %28, %0
  %3 = load i32* %i, align 4, !dbg !120
  %4 = icmp sle i32 %3, 40, !dbg !120
  br i1 %4, label %5, label %31, !dbg !120

; <label>:5                                       ; preds = %2
  store i32 1, i32* %j, align 4, !dbg !122
  br label %6, !dbg !122

; <label>:6                                       ; preds = %24, %5
  %7 = load i32* %j, align 4, !dbg !122
  %8 = icmp sle i32 %7, 40, !dbg !122
  br i1 %8, label %9, label %27, !dbg !122

; <label>:9                                       ; preds = %6
  %10 = call i32 @Rand(), !dbg !124
  store i32 %10, i32* %temp, align 4, !dbg !124
  %11 = load i32* %temp, align 4, !dbg !126
  %12 = load i32* %temp, align 4, !dbg !126
  %13 = sdiv i32 %12, 120, !dbg !126
  %14 = mul nsw i32 %13, 120, !dbg !126
  %15 = sub nsw i32 %11, %14, !dbg !126
  %16 = sub nsw i32 %15, 60, !dbg !126
  %17 = load i32* %j, align 4, !dbg !126
  %18 = sext i32 %17 to i64, !dbg !126
  %19 = load i32* %i, align 4, !dbg !126
  %20 = sext i32 %19 to i64, !dbg !126
  %21 = load [41 x i32]** %1, align 8, !dbg !126
  %22 = getelementptr inbounds [41 x i32]* %21, i64 %20, !dbg !126
  %23 = getelementptr inbounds [41 x i32]* %22, i32 0, i64 %18, !dbg !126
  store i32 %16, i32* %23, align 4, !dbg !126
  br label %24, !dbg !127

; <label>:24                                      ; preds = %9
  %25 = load i32* %j, align 4, !dbg !122
  %26 = add nsw i32 %25, 1, !dbg !122
  store i32 %26, i32* %j, align 4, !dbg !122
  br label %6, !dbg !122

; <label>:27                                      ; preds = %6
  br label %28, !dbg !128

; <label>:28                                      ; preds = %27
  %29 = load i32* %i, align 4, !dbg !120
  %30 = add nsw i32 %29, 1, !dbg !120
  store i32 %30, i32* %i, align 4, !dbg !120
  br label %2, !dbg !120

; <label>:31                                      ; preds = %2
  ret void, !dbg !129
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Innerproduct(i32* %result, [41 x i32]* %a, [41 x i32]* %b, i32 %row, i32 %column) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca [41 x i32]*, align 8
  %3 = alloca [41 x i32]*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %result, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !130), !dbg !131
  store [41 x i32]* %a, [41 x i32]** %2, align 8
  call void @llvm.dbg.declare(metadata !{[41 x i32]** %2}, metadata !132), !dbg !131
  store [41 x i32]* %b, [41 x i32]** %3, align 8
  call void @llvm.dbg.declare(metadata !{[41 x i32]** %3}, metadata !133), !dbg !131
  store i32 %row, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !134), !dbg !131
  store i32 %column, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !135), !dbg !131
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !136), !dbg !137
  %6 = load i32** %1, align 8, !dbg !138
  store i32 0, i32* %6, align 4, !dbg !138
  store i32 1, i32* %i, align 4, !dbg !139
  br label %7, !dbg !139

; <label>:7                                       ; preds = %32, %0
  %8 = load i32* %i, align 4, !dbg !139
  %9 = icmp sle i32 %8, 40, !dbg !139
  br i1 %9, label %10, label %35, !dbg !139

; <label>:10                                      ; preds = %7
  %11 = load i32** %1, align 8, !dbg !139
  %12 = load i32* %11, align 4, !dbg !139
  %13 = load i32* %i, align 4, !dbg !139
  %14 = sext i32 %13 to i64, !dbg !139
  %15 = load i32* %4, align 4, !dbg !139
  %16 = sext i32 %15 to i64, !dbg !139
  %17 = load [41 x i32]** %2, align 8, !dbg !139
  %18 = getelementptr inbounds [41 x i32]* %17, i64 %16, !dbg !139
  %19 = getelementptr inbounds [41 x i32]* %18, i32 0, i64 %14, !dbg !139
  %20 = load i32* %19, align 4, !dbg !139
  %21 = load i32* %5, align 4, !dbg !139
  %22 = sext i32 %21 to i64, !dbg !139
  %23 = load i32* %i, align 4, !dbg !139
  %24 = sext i32 %23 to i64, !dbg !139
  %25 = load [41 x i32]** %3, align 8, !dbg !139
  %26 = getelementptr inbounds [41 x i32]* %25, i64 %24, !dbg !139
  %27 = getelementptr inbounds [41 x i32]* %26, i32 0, i64 %22, !dbg !139
  %28 = load i32* %27, align 4, !dbg !139
  %29 = mul nsw i32 %20, %28, !dbg !139
  %30 = add nsw i32 %12, %29, !dbg !139
  %31 = load i32** %1, align 8, !dbg !139
  store i32 %30, i32* %31, align 4, !dbg !139
  br label %32, !dbg !139

; <label>:32                                      ; preds = %10
  %33 = load i32* %i, align 4, !dbg !139
  %34 = add nsw i32 %33, 1, !dbg !139
  store i32 %34, i32* %i, align 4, !dbg !139
  br label %7, !dbg !139

; <label>:35                                      ; preds = %7
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define void @Intmm(i32 %run) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %run, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !142), !dbg !143
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !144), !dbg !145
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !146), !dbg !145
  call void @Initrand(), !dbg !147
  call void @Initmatrix([41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @ima, i32 0, i32 0)), !dbg !148
  call void @Initmatrix([41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @imb, i32 0, i32 0)), !dbg !149
  store i32 1, i32* %i, align 4, !dbg !150
  br label %2, !dbg !150

; <label>:2                                       ; preds = %22, %0
  %3 = load i32* %i, align 4, !dbg !150
  %4 = icmp sle i32 %3, 40, !dbg !150
  br i1 %4, label %5, label %25, !dbg !150

; <label>:5                                       ; preds = %2
  store i32 1, i32* %j, align 4, !dbg !152
  br label %6, !dbg !152

; <label>:6                                       ; preds = %18, %5
  %7 = load i32* %j, align 4, !dbg !152
  %8 = icmp sle i32 %7, 40, !dbg !152
  br i1 %8, label %9, label %21, !dbg !152

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4, !dbg !154
  %11 = sext i32 %10 to i64, !dbg !154
  %12 = load i32* %i, align 4, !dbg !154
  %13 = sext i32 %12 to i64, !dbg !154
  %14 = getelementptr inbounds [41 x [41 x i32]]* @imr, i32 0, i64 %13, !dbg !154
  %15 = getelementptr inbounds [41 x i32]* %14, i32 0, i64 %11, !dbg !154
  %16 = load i32* %i, align 4, !dbg !154
  %17 = load i32* %j, align 4, !dbg !154
  call void @Innerproduct(i32* %15, [41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @ima, i32 0, i32 0), [41 x i32]* getelementptr inbounds ([41 x [41 x i32]]* @imb, i32 0, i32 0), i32 %16, i32 %17), !dbg !154
  br label %18, !dbg !154

; <label>:18                                      ; preds = %9
  %19 = load i32* %j, align 4, !dbg !152
  %20 = add nsw i32 %19, 1, !dbg !152
  store i32 %20, i32* %j, align 4, !dbg !152
  br label %6, !dbg !152

; <label>:21                                      ; preds = %6
  br label %22, !dbg !154

; <label>:22                                      ; preds = %21
  %23 = load i32* %i, align 4, !dbg !150
  %24 = add nsw i32 %23, 1, !dbg !150
  store i32 %24, i32* %i, align 4, !dbg !150
  br label %2, !dbg !150

; <label>:25                                      ; preds = %2
  %26 = load i32* %1, align 4, !dbg !155
  %27 = add nsw i32 %26, 1, !dbg !155
  %28 = sext i32 %27 to i64, !dbg !155
  %29 = load i32* %1, align 4, !dbg !155
  %30 = add nsw i32 %29, 1, !dbg !155
  %31 = sext i32 %30 to i64, !dbg !155
  %32 = getelementptr inbounds [41 x [41 x i32]]* @imr, i32 0, i64 %31, !dbg !155
  %33 = getelementptr inbounds [41 x i32]* %32, i32 0, i64 %28, !dbg !155
  %34 = load i32* %33, align 4, !dbg !155
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %34), !dbg !155
  ret void, !dbg !156
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !157), !dbg !158
  store i32 0, i32* %i, align 4, !dbg !159
  br label %2, !dbg !159

; <label>:2                                       ; preds = %7, %0
  %3 = load i32* %i, align 4, !dbg !159
  %4 = icmp slt i32 %3, 10, !dbg !159
  br i1 %4, label %5, label %10, !dbg !159

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4, !dbg !159
  call void @Intmm(i32 %6), !dbg !159
  br label %7, !dbg !159

; <label>:7                                       ; preds = %5
  %8 = load i32* %i, align 4, !dbg !159
  %9 = add nsw i32 %8, 1, !dbg !159
  store i32 %9, i32* %i, align 4, !dbg !159
  br label %2, !dbg !159

; <label>:10                                      ; preds = %2
  ret i32 0, !dbg !161
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!107, !108}
!llvm.ident = !{!109}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !27, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"intmm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !19, metadata !23, metadata !26}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initmatrix", metadata !"Initmatrix", metadata !"", i32 127, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([41 x i32]*)* @Initmatrix, null, null, metadata !2, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [Initmatrix]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1312, i64 32, i32 0, i32 0, metadata !11, metadata !17, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1312, align 32, offset 0] [from int]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Innerproduct", metadata !"Innerproduct", metadata !"", i32 136, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, [41 x i32]*, [41 x i32]*, i32, i32)* @Innerproduct, null, null, metadata !2, i32 136} ; [ DW_TAG_subprogram ] [line 136] [def] [Innerproduct]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{null, metadata !22, metadata !15, metadata !15, metadata !11, metadata !11}
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Intmm", metadata !"Intmm", metadata !"", i32 143, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Intmm, null, null, metadata !2, i32 143} ; [ DW_TAG_subprogram ] [line 143] [def] [Intmm]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !11}
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 154, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 155} ; [ DW_TAG_subprogram ] [line 154] [def] [scope 155] [main]
!27 = metadata !{metadata !28, metadata !30, metadata !31, metadata !32, metadata !34, metadata !38, metadata !40, metadata !47, metadata !51, metadata !59, metadata !60, metadata !61, metadata !64, metadata !65, metadata !66, metadata !68, metadata !69, metadata !70, metadata !71, metadata !75, metadata !76, metadata !80, metadata !83, metadata !84, metadata !85, metadata !89, metadata !90, metadata !91, metadata !92, metadata !100, metadata !101, metadata !105, metadata !106}
!28 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!29 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!30 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !33, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!33 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !35, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!35 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !36, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!38 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !39, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!39 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!40 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !41, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!42 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!43 = metadata !{metadata !44, metadata !45, metadata !46}
!44 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !41} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!46 = metadata !{i32 786445, metadata !1, metadata !42, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!47 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !48, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!48 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !49, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!51 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !52, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!52 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !53, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!53 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !54, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!54 = metadata !{metadata !55, metadata !56}
!55 = metadata !{i32 786445, metadata !1, metadata !53, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!56 = metadata !{i32 786445, metadata !1, metadata !53, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!59 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !62, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!62 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !63, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!63 = metadata !{metadata !18, metadata !18}
!64 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !62, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !62, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!67 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !29, metadata !63, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!68 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !48, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!71 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !72, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!72 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !73, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!75 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !72, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !77, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!77 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !78, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!78 = metadata !{metadata !79}
!79 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!80 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !81, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!81 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !82, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!82 = metadata !{metadata !74, metadata !79}
!83 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !86, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!86 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !87, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!89 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!90 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!91 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!92 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !93, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!93 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !94, metadata !98, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!94 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!95 = metadata !{metadata !96, metadata !97}
!96 = metadata !{i32 786445, metadata !1, metadata !94, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!97 = metadata !{i32 786445, metadata !1, metadata !94, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !29} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!98 = metadata !{metadata !99}
!99 = metadata !{i32 786465, i64 0, i64 257}      ; [ DW_TAG_subrange_type ] [0, 256]
!100 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !93, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!101 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !102, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!102 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !94, metadata !103, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!103 = metadata !{metadata !104}
!104 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!105 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !29, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!106 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !29, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!107 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!108 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!109 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!110 = metadata !{i32 116, i32 0, metadata !4, null}
!111 = metadata !{i32 117, i32 0, metadata !4, null}
!112 = metadata !{i32 120, i32 0, metadata !8, null}
!113 = metadata !{i32 121, i32 0, metadata !8, null}
!114 = metadata !{i32 786689, metadata !12, metadata !"m", metadata !5, i32 16777343, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 127]
!115 = metadata !{i32 127, i32 0, metadata !12, null}
!116 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!117 = metadata !{i32 128, i32 0, metadata !12, null}
!118 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 128]
!119 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 128]
!120 = metadata !{i32 129, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !1, metadata !12, i32 129, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!122 = metadata !{i32 130, i32 0, metadata !123, null}
!123 = metadata !{i32 786443, metadata !1, metadata !121, i32 130, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!124 = metadata !{i32 131, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !123, i32 130, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!126 = metadata !{i32 132, i32 0, metadata !125, null}
!127 = metadata !{i32 133, i32 0, metadata !125, null}
!128 = metadata !{i32 133, i32 0, metadata !123, null}
!129 = metadata !{i32 134, i32 0, metadata !12, null}
!130 = metadata !{i32 786689, metadata !19, metadata !"result", metadata !5, i32 16777352, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [result] [line 136]
!131 = metadata !{i32 136, i32 0, metadata !19, null}
!132 = metadata !{i32 786689, metadata !19, metadata !"a", metadata !5, i32 33554568, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 136]
!133 = metadata !{i32 786689, metadata !19, metadata !"b", metadata !5, i32 50331784, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 136]
!134 = metadata !{i32 786689, metadata !19, metadata !"row", metadata !5, i32 67109000, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 136]
!135 = metadata !{i32 786689, metadata !19, metadata !"column", metadata !5, i32 83886216, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [column] [line 136]
!136 = metadata !{i32 786688, metadata !19, metadata !"i", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 138]
!137 = metadata !{i32 138, i32 0, metadata !19, null}
!138 = metadata !{i32 139, i32 0, metadata !19, null}
!139 = metadata !{i32 140, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !19, i32 140, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!141 = metadata !{i32 141, i32 0, metadata !19, null}
!142 = metadata !{i32 786689, metadata !23, metadata !"run", metadata !5, i32 16777359, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 143]
!143 = metadata !{i32 143, i32 0, metadata !23, null}
!144 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 144]
!145 = metadata !{i32 144, i32 0, metadata !23, null}
!146 = metadata !{i32 786688, metadata !23, metadata !"j", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 144]
!147 = metadata !{i32 145, i32 0, metadata !23, null}
!148 = metadata !{i32 146, i32 0, metadata !23, null}
!149 = metadata !{i32 147, i32 0, metadata !23, null}
!150 = metadata !{i32 148, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !23, i32 148, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!152 = metadata !{i32 149, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !151, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!154 = metadata !{i32 150, i32 0, metadata !153, null}
!155 = metadata !{i32 151, i32 0, metadata !23, null}
!156 = metadata !{i32 152, i32 0, metadata !23, null}
!157 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !5, i32 156, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 156]
!158 = metadata !{i32 156, i32 0, metadata !26, null}
!159 = metadata !{i32 157, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !26, i32 157, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!161 = metadata !{i32 158, i32 0, metadata !26, null}
