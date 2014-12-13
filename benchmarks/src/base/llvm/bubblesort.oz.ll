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
@str = private unnamed_addr constant [18 x i8] c"Error3 in Bubble.\00"

; Function Attrs: minsize nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !110, !tbaa !111
  ret void, !dbg !115
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !116, !tbaa !111
  %2 = mul nsw i64 %1, 1309, !dbg !116
  %3 = add nsw i64 %2, 13849, !dbg !116
  %4 = and i64 %3, 65535, !dbg !116
  store i64 %4, i64* @seed, align 8, !dbg !116, !tbaa !111
  %5 = trunc i64 %4 to i32, !dbg !117
  ret i32 %5, !dbg !117
}

; Function Attrs: minsize nounwind optsize uwtable
define void @bInitarr() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !118, !tbaa !111
  store i32 0, i32* @biggest, align 4, !dbg !120, !tbaa !121
  store i32 0, i32* @littlest, align 4, !dbg !120, !tbaa !121
  tail call void @llvm.dbg.value(metadata !123, i64 0, metadata !14), !dbg !124
  br label %1, !dbg !124

; <label>:1                                       ; preds = %17, %0
  %2 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %3 = phi i32 [ 0, %0 ], [ %19, %17 ], !dbg !126
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %17 ]
  %4 = phi i64 [ 74755, %0 ], [ %7, %17 ], !dbg !126
  %5 = mul nsw i64 %4, 1309, !dbg !126
  %6 = add nsw i64 %5, 13849, !dbg !126
  %7 = and i64 %6, 65535, !dbg !126
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !15), !dbg !127
  %8 = urem i64 %7, 100000, !dbg !129
  %9 = add nsw i64 %8, 4294917296, !dbg !129
  %10 = trunc i64 %9 to i32, !dbg !129
  %11 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !129
  store i32 %10, i32* %11, align 4, !dbg !129, !tbaa !121
  %12 = icmp sgt i32 %10, %3, !dbg !130
  br i1 %12, label %13, label %14, !dbg !130

; <label>:13                                      ; preds = %1
  store i32 %10, i32* @biggest, align 4, !dbg !130, !tbaa !121
  br label %17, !dbg !130

; <label>:14                                      ; preds = %1
  %15 = icmp slt i32 %10, %2, !dbg !132
  br i1 %15, label %16, label %17, !dbg !132

; <label>:16                                      ; preds = %14
  store i32 %10, i32* @littlest, align 4, !dbg !132, !tbaa !121
  br label %17, !dbg !132

; <label>:17                                      ; preds = %13, %16, %14
  %18 = phi i32 [ %2, %13 ], [ %10, %16 ], [ %2, %14 ]
  %19 = phi i32 [ %10, %13 ], [ %3, %16 ], [ %3, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !124
  %exitcond = icmp eq i64 %indvars.iv.next, 501, !dbg !124
  br i1 %exitcond, label %20, label %1, !dbg !124

; <label>:20                                      ; preds = %17
  store i64 %7, i64* @seed, align 8, !dbg !126, !tbaa !111
  ret void, !dbg !134
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Bubble(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !21), !dbg !135
  tail call void @bInitarr() #4, !dbg !136
  store i32 500, i32* @top, align 4, !dbg !137, !tbaa !121
  br label %.lr.ph, !dbg !139

.lr.ph:                                           ; preds = %._crit_edge, %0
  %indvars.iv3 = phi i32 [ 500, %0 ], [ %indvars.iv.next4, %._crit_edge ]
  %.pre = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !140, !tbaa !121
  br label %1, !dbg !143

; <label>:1                                       ; preds = %.backedge, %.lr.ph
  %2 = phi i32 [ %.pre, %.lr.ph ], [ %8, %.backedge ], !dbg !140
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %.backedge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !143
  %3 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv.next, !dbg !140
  %4 = load i32* %3, align 4, !dbg !140, !tbaa !121
  %5 = icmp sgt i32 %2, %4, !dbg !140
  br i1 %5, label %6, label %.backedge, !dbg !140

; <label>:6                                       ; preds = %1
  %7 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !140
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !23), !dbg !144
  store i32 %4, i32* %7, align 4, !dbg !146, !tbaa !121
  store i32 %2, i32* %3, align 4, !dbg !147, !tbaa !121
  br label %.backedge, !dbg !148

.backedge:                                        ; preds = %6, %1
  %8 = phi i32 [ %2, %6 ], [ %4, %1 ]
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !143
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv3, !dbg !143
  br i1 %exitcond, label %._crit_edge, label %1, !dbg !143

._crit_edge:                                      ; preds = %.backedge
  %indvars.iv.next4 = add nsw i32 %indvars.iv3, -1, !dbg !139
  %9 = icmp sgt i32 %indvars.iv.next4, 1, !dbg !139
  br i1 %9, label %.lr.ph, label %10, !dbg !139

; <label>:10                                      ; preds = %._crit_edge
  store i32 1, i32* @top, align 4, !dbg !143, !tbaa !121
  %11 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !149, !tbaa !121
  %12 = load i32* @littlest, align 4, !dbg !149, !tbaa !121
  %13 = icmp eq i32 %11, %12, !dbg !149
  br i1 %13, label %14, label %18, !dbg !149

; <label>:14                                      ; preds = %10
  %15 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 500), align 16, !dbg !149, !tbaa !121
  %16 = load i32* @biggest, align 4, !dbg !149, !tbaa !121
  %17 = icmp eq i32 %15, %16, !dbg !149
  br i1 %17, label %19, label %18, !dbg !149

; <label>:18                                      ; preds = %14, %10
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !151
  br label %19, !dbg !151

; <label>:19                                      ; preds = %14, %18
  %20 = add nsw i32 %run, 1, !dbg !152
  %21 = sext i32 %20 to i64, !dbg !152
  %22 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %21, !dbg !152
  %23 = load i32* %22, align 4, !dbg !152, !tbaa !121
  %24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %23) #5, !dbg !152
  ret void, !dbg !153
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !26), !dbg !155
  br label %1, !dbg !155

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Bubble(i32 %i.01) #4, !dbg !155
  %2 = add nsw i32 %i.01, 1, !dbg !155
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !26), !dbg !155
  %exitcond = icmp eq i32 %2, 100, !dbg !155
  br i1 %exitcond, label %3, label %1, !dbg !155

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !157
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { minsize optsize }
attributes #5 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!107, !108}
!llvm.ident = !{!109}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !27, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"bubblesort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !17, metadata !24}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bInitarr", metadata !"bInitarr", metadata !"", i32 127, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @bInitarr, null, null, metadata !13, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [bInitarr]
!13 = metadata !{metadata !14, metadata !15}
!14 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 128]
!15 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 129, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 129]
!16 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Bubble", metadata !"Bubble", metadata !"", i32 141, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Bubble, null, null, metadata !20, i32 141} ; [ DW_TAG_subprogram ] [line 141] [def] [Bubble]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !11}
!20 = metadata !{metadata !21, metadata !22, metadata !23}
!21 = metadata !{i32 786689, metadata !17, metadata !"run", metadata !5, i32 16777357, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 141]
!22 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 142]
!23 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 142]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 166, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !25, i32 167} ; [ DW_TAG_subprogram ] [line 166] [def] [scope 167] [main]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 168, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 168]
!27 = metadata !{metadata !28, metadata !30, metadata !31, metadata !32, metadata !33, metadata !37, metadata !39, metadata !46, metadata !50, metadata !58, metadata !59, metadata !60, metadata !64, metadata !65, metadata !66, metadata !68, metadata !69, metadata !70, metadata !71, metadata !75, metadata !76, metadata !80, metadata !83, metadata !84, metadata !85, metadata !89, metadata !90, metadata !91, metadata !92, metadata !100, metadata !101, metadata !105, metadata !106}
!28 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!29 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!30 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!31 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !29, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!32 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !16, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!33 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !34, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!34 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!37 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !38, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!38 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!39 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !40, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!40 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!41 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!42 = metadata !{metadata !43, metadata !44, metadata !45}
!43 = metadata !{i32 786445, metadata !1, metadata !41, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!44 = metadata !{i32 786445, metadata !1, metadata !41, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !40} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!45 = metadata !{i32 786445, metadata !1, metadata !41, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!46 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !47, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!47 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !48, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!50 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !51, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!51 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !52, metadata !56, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!52 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!53 = metadata !{metadata !54, metadata !55}
!54 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!55 = metadata !{i32 786445, metadata !1, metadata !52, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!56 = metadata !{metadata !57}
!57 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!58 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!59 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!60 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !61, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!61 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !62, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!62 = metadata !{metadata !63, metadata !63}
!63 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!64 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !61, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!65 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !61, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!66 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!67 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !29, metadata !62, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!68 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !67, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !47, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
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
!111 = metadata !{metadata !112, metadata !112, i64 0}
!112 = metadata !{metadata !"long", metadata !113, i64 0}
!113 = metadata !{metadata !"omnipotent char", metadata !114, i64 0}
!114 = metadata !{metadata !"Simple C/C++ TBAA"}
!115 = metadata !{i32 117, i32 0, metadata !4, null}
!116 = metadata !{i32 120, i32 0, metadata !8, null}
!117 = metadata !{i32 121, i32 0, metadata !8, null}
!118 = metadata !{i32 116, i32 0, metadata !4, metadata !119}
!119 = metadata !{i32 130, i32 0, metadata !12, null}
!120 = metadata !{i32 131, i32 0, metadata !12, null}
!121 = metadata !{metadata !122, metadata !122, i64 0}
!122 = metadata !{metadata !"int", metadata !113, i64 0}
!123 = metadata !{i32 1}
!124 = metadata !{i32 132, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !12, i32 132, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!126 = metadata !{i32 120, i32 0, metadata !8, metadata !127}
!127 = metadata !{i32 133, i32 0, metadata !128, null}
!128 = metadata !{i32 786443, metadata !1, metadata !125, i32 132, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!129 = metadata !{i32 135, i32 0, metadata !128, null}
!130 = metadata !{i32 136, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !128, i32 136, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!132 = metadata !{i32 137, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !131, i32 137, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!134 = metadata !{i32 139, i32 0, metadata !12, null}
!135 = metadata !{i32 141, i32 0, metadata !17, null}
!136 = metadata !{i32 143, i32 0, metadata !17, null}
!137 = metadata !{i32 159, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !17, i32 146, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!139 = metadata !{i32 146, i32 0, metadata !17, null}
!140 = metadata !{i32 151, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !142, i32 151, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!142 = metadata !{i32 786443, metadata !1, metadata !138, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!143 = metadata !{i32 149, i32 0, metadata !138, null}
!144 = metadata !{i32 152, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !141, i32 151, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!146 = metadata !{i32 153, i32 0, metadata !145, null}
!147 = metadata !{i32 154, i32 0, metadata !145, null}
!148 = metadata !{i32 155, i32 0, metadata !145, null}
!149 = metadata !{i32 161, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !17, i32 161, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!151 = metadata !{i32 162, i32 0, metadata !150, null}
!152 = metadata !{i32 163, i32 0, metadata !17, null}
!153 = metadata !{i32 164, i32 0, metadata !17, null}
!154 = metadata !{i32 0}
!155 = metadata !{i32 169, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !24, i32 169, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/bubblesort.c]
!157 = metadata !{i32 170, i32 0, metadata !24, null}
