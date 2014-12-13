; ModuleID = 'perm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@.str = private unnamed_addr constant [17 x i8] c" Error in Perm.\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
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
  store i64 74755, i64* @seed, align 8, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !108
  %2 = mul nsw i64 %1, 1309, !dbg !108
  %3 = add nsw i64 %2, 13849, !dbg !108
  %4 = and i64 %3, 65535, !dbg !108
  store i64 %4, i64* @seed, align 8, !dbg !108
  %5 = load i64* @seed, align 8, !dbg !109
  %6 = trunc i64 %5 to i32, !dbg !109
  ret i32 %6, !dbg !109
}

; Function Attrs: nounwind uwtable
define void @Swap(i32* %a, i32* %b) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %t = alloca i32, align 4
  store i32* %a, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !110), !dbg !111
  store i32* %b, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !112), !dbg !111
  call void @llvm.dbg.declare(metadata !{i32* %t}, metadata !113), !dbg !114
  %3 = load i32** %1, align 8, !dbg !115
  %4 = load i32* %3, align 4, !dbg !115
  store i32 %4, i32* %t, align 4, !dbg !115
  %5 = load i32** %2, align 8, !dbg !115
  %6 = load i32* %5, align 4, !dbg !115
  %7 = load i32** %1, align 8, !dbg !115
  store i32 %6, i32* %7, align 4, !dbg !115
  %8 = load i32* %t, align 4, !dbg !115
  %9 = load i32** %2, align 8, !dbg !115
  store i32 %8, i32* %9, align 4, !dbg !115
  ret void, !dbg !116
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Initialize() #0 {
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !117), !dbg !118
  store i32 1, i32* %i, align 4, !dbg !119
  br label %1, !dbg !119

; <label>:1                                       ; preds = %10, %0
  %2 = load i32* %i, align 4, !dbg !119
  %3 = icmp sle i32 %2, 7, !dbg !119
  br i1 %3, label %4, label %13, !dbg !119

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4, !dbg !121
  %6 = sub nsw i32 %5, 1, !dbg !121
  %7 = load i32* %i, align 4, !dbg !121
  %8 = sext i32 %7 to i64, !dbg !121
  %9 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %8, !dbg !121
  store i32 %6, i32* %9, align 4, !dbg !121
  br label %10, !dbg !123

; <label>:10                                      ; preds = %4
  %11 = load i32* %i, align 4, !dbg !119
  %12 = add nsw i32 %11, 1, !dbg !119
  store i32 %12, i32* %i, align 4, !dbg !119
  br label %1, !dbg !119

; <label>:13                                      ; preds = %1
  ret void, !dbg !124
}

; Function Attrs: nounwind uwtable
define void @Permute(i32 %n) #0 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !125), !dbg !126
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !127), !dbg !128
  %2 = load i32* @pctr, align 4, !dbg !129
  %3 = add i32 %2, 1, !dbg !129
  store i32 %3, i32* @pctr, align 4, !dbg !129
  %4 = load i32* %1, align 4, !dbg !130
  %5 = icmp ne i32 %4, 1, !dbg !130
  br i1 %5, label %6, label %33, !dbg !130

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4, !dbg !132
  %8 = sub nsw i32 %7, 1, !dbg !132
  call void @Permute(i32 %8), !dbg !132
  %9 = load i32* %1, align 4, !dbg !134
  %10 = sub nsw i32 %9, 1, !dbg !134
  store i32 %10, i32* %k, align 4, !dbg !134
  br label %11, !dbg !134

; <label>:11                                      ; preds = %29, %6
  %12 = load i32* %k, align 4, !dbg !134
  %13 = icmp sge i32 %12, 1, !dbg !134
  br i1 %13, label %14, label %32, !dbg !134

; <label>:14                                      ; preds = %11
  %15 = load i32* %1, align 4, !dbg !136
  %16 = sext i32 %15 to i64, !dbg !136
  %17 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %16, !dbg !136
  %18 = load i32* %k, align 4, !dbg !136
  %19 = sext i32 %18 to i64, !dbg !136
  %20 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %19, !dbg !136
  call void @Swap(i32* %17, i32* %20), !dbg !136
  %21 = load i32* %1, align 4, !dbg !138
  %22 = sub nsw i32 %21, 1, !dbg !138
  call void @Permute(i32 %22), !dbg !138
  %23 = load i32* %1, align 4, !dbg !139
  %24 = sext i32 %23 to i64, !dbg !139
  %25 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %24, !dbg !139
  %26 = load i32* %k, align 4, !dbg !139
  %27 = sext i32 %26 to i64, !dbg !139
  %28 = getelementptr inbounds [11 x i32]* @permarray, i32 0, i64 %27, !dbg !139
  call void @Swap(i32* %25, i32* %28), !dbg !139
  br label %29, !dbg !140

; <label>:29                                      ; preds = %14
  %30 = load i32* %k, align 4, !dbg !134
  %31 = add nsw i32 %30, -1, !dbg !134
  store i32 %31, i32* %k, align 4, !dbg !134
  br label %11, !dbg !134

; <label>:32                                      ; preds = %11
  br label %33, !dbg !141

; <label>:33                                      ; preds = %32, %0
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define void @Perm() #0 {
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !143), !dbg !144
  store i32 0, i32* @pctr, align 4, !dbg !145
  store i32 1, i32* %i, align 4, !dbg !146
  br label %1, !dbg !146

; <label>:1                                       ; preds = %5, %0
  %2 = load i32* %i, align 4, !dbg !146
  %3 = icmp sle i32 %2, 5, !dbg !146
  br i1 %3, label %4, label %8, !dbg !146

; <label>:4                                       ; preds = %1
  call void @Initialize(), !dbg !148
  call void @Permute(i32 7), !dbg !150
  br label %5, !dbg !151

; <label>:5                                       ; preds = %4
  %6 = load i32* %i, align 4, !dbg !146
  %7 = add nsw i32 %6, 1, !dbg !146
  store i32 %7, i32* %i, align 4, !dbg !146
  br label %1, !dbg !146

; <label>:8                                       ; preds = %1
  %9 = load i32* @pctr, align 4, !dbg !152
  %10 = icmp ne i32 %9, 43300, !dbg !152
  br i1 %10, label %11, label %13, !dbg !152

; <label>:11                                      ; preds = %8
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0)), !dbg !154
  br label %13, !dbg !154

; <label>:13                                      ; preds = %11, %8
  %14 = load i32* @pctr, align 4, !dbg !155
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %14), !dbg !155
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

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4, !dbg !159
  %4 = icmp slt i32 %3, 100, !dbg !159
  br i1 %4, label %5, label %9, !dbg !159

; <label>:5                                       ; preds = %2
  call void @Perm(), !dbg !159
  br label %6, !dbg !159

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4, !dbg !159
  %8 = add nsw i32 %7, 1, !dbg !159
  store i32 %8, i32* %i, align 4, !dbg !159
  br label %2, !dbg !159

; <label>:9                                       ; preds = %2
  ret i32 0, !dbg !161
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!103, !104}
!llvm.ident = !{!105}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !22, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"perm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !16, metadata !17, metadata !20, metadata !21}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Swap", metadata !"Swap", metadata !"", i32 126, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*)* @Swap, null, null, metadata !2, i32 126} ; [ DW_TAG_subprogram ] [line 126] [def] [Swap]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initialize", metadata !"Initialize", metadata !"", i32 131, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Initialize, null, null, metadata !2, i32 131} ; [ DW_TAG_subprogram ] [line 131] [def] [Initialize]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Permute", metadata !"Permute", metadata !"", i32 138, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32)* @Permute, null, null, metadata !2, i32 138} ; [ DW_TAG_subprogram ] [line 138] [def] [Permute]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !11}
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Perm", metadata !"Perm", metadata !"", i32 151, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @Perm, null, null, metadata !2, i32 151} ; [ DW_TAG_subprogram ] [line 151] [def] [Perm]
!21 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 163, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 164} ; [ DW_TAG_subprogram ] [line 163] [def] [scope 164] [main]
!22 = metadata !{metadata !23, metadata !25, metadata !26, metadata !27, metadata !29, metadata !33, metadata !35, metadata !42, metadata !46, metadata !54, metadata !55, metadata !56, metadata !60, metadata !61, metadata !62, metadata !64, metadata !65, metadata !66, metadata !67, metadata !71, metadata !72, metadata !76, metadata !79, metadata !80, metadata !81, metadata !85, metadata !86, metadata !87, metadata !88, metadata !96, metadata !97, metadata !101, metadata !102}
!23 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !24, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!24 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!25 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !24, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!26 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !24, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!27 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !28, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!28 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!29 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !30, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!30 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!33 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !34, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!34 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!35 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !36, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!36 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!37 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!38 = metadata !{metadata !39, metadata !40, metadata !41}
!39 = metadata !{i32 786445, metadata !1, metadata !37, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!40 = metadata !{i32 786445, metadata !1, metadata !37, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !36} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!41 = metadata !{i32 786445, metadata !1, metadata !37, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!42 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !43, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!46 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !47, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !48, metadata !52, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!48 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!49 = metadata !{metadata !50, metadata !51}
!50 = metadata !{i32 786445, metadata !1, metadata !48, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!51 = metadata !{i32 786445, metadata !1, metadata !48, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!54 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !57, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!57 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !58, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!58 = metadata !{metadata !59, metadata !59}
!59 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!60 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !57, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!61 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !57, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!62 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !63, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!63 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !24, metadata !58, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!64 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !63, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !63, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !43, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!67 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !68, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!68 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !69, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!71 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !68, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!72 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !73, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!73 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !74, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!76 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !77, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!77 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !78, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!78 = metadata !{metadata !70, metadata !75}
!79 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !82, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!85 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !89, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!89 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !90, metadata !94, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!90 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !91, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!91 = metadata !{metadata !92, metadata !93}
!92 = metadata !{i32 786445, metadata !1, metadata !90, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!93 = metadata !{i32 786445, metadata !1, metadata !90, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !24} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786465, i64 0, i64 257}      ; [ DW_TAG_subrange_type ] [0, 256]
!96 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !89, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!97 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !98, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!98 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !90, metadata !99, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!99 = metadata !{metadata !100}
!100 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!101 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !24, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!102 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !24, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!103 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!104 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!105 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!106 = metadata !{i32 116, i32 0, metadata !4, null}
!107 = metadata !{i32 117, i32 0, metadata !4, null}
!108 = metadata !{i32 120, i32 0, metadata !8, null}
!109 = metadata !{i32 121, i32 0, metadata !8, null}
!110 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 16777342, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 126]
!111 = metadata !{i32 126, i32 0, metadata !12, null}
!112 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 33554558, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 126]
!113 = metadata !{i32 786688, metadata !12, metadata !"t", metadata !5, i32 127, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 127]
!114 = metadata !{i32 127, i32 0, metadata !12, null}
!115 = metadata !{i32 128, i32 0, metadata !12, null}
!116 = metadata !{i32 129, i32 0, metadata !12, null}
!117 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 132, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 132]
!118 = metadata !{i32 132, i32 0, metadata !16, null}
!119 = metadata !{i32 133, i32 0, metadata !120, null}
!120 = metadata !{i32 786443, metadata !1, metadata !16, i32 133, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!121 = metadata !{i32 134, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !1, metadata !120, i32 133, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!123 = metadata !{i32 135, i32 0, metadata !122, null}
!124 = metadata !{i32 136, i32 0, metadata !16, null}
!125 = metadata !{i32 786689, metadata !17, metadata !"n", metadata !5, i32 16777354, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 138]
!126 = metadata !{i32 138, i32 0, metadata !17, null}
!127 = metadata !{i32 786688, metadata !17, metadata !"k", metadata !5, i32 139, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 139]
!128 = metadata !{i32 139, i32 0, metadata !17, null}
!129 = metadata !{i32 140, i32 0, metadata !17, null}
!130 = metadata !{i32 141, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !17, i32 141, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!132 = metadata !{i32 142, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !131, i32 141, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!134 = metadata !{i32 143, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !133, i32 143, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!136 = metadata !{i32 144, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !135, i32 143, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!138 = metadata !{i32 145, i32 0, metadata !137, null}
!139 = metadata !{i32 146, i32 0, metadata !137, null}
!140 = metadata !{i32 147, i32 0, metadata !137, null}
!141 = metadata !{i32 148, i32 0, metadata !133, null}
!142 = metadata !{i32 149, i32 0, metadata !17, null}
!143 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 152, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 152]
!144 = metadata !{i32 152, i32 0, metadata !20, null}
!145 = metadata !{i32 153, i32 0, metadata !20, null}
!146 = metadata !{i32 154, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !20, i32 154, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!148 = metadata !{i32 155, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !147, i32 154, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!150 = metadata !{i32 156, i32 0, metadata !149, null}
!151 = metadata !{i32 157, i32 0, metadata !149, null}
!152 = metadata !{i32 158, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !20, i32 158, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!154 = metadata !{i32 159, i32 0, metadata !153, null}
!155 = metadata !{i32 160, i32 0, metadata !20, null}
!156 = metadata !{i32 161, i32 0, metadata !20, null}
!157 = metadata !{i32 786688, metadata !21, metadata !"i", metadata !5, i32 165, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 165]
!158 = metadata !{i32 165, i32 0, metadata !21, null}
!159 = metadata !{i32 166, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !21, i32 166, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!161 = metadata !{i32 167, i32 0, metadata !21, null}
