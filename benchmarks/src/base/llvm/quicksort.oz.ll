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
@str = private unnamed_addr constant [17 x i8] c" Error in Quick.\00"

; Function Attrs: minsize nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !120, !tbaa !121
  ret void, !dbg !125
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !126, !tbaa !121
  %2 = mul nsw i64 %1, 1309, !dbg !126
  %3 = add nsw i64 %2, 13849, !dbg !126
  %4 = and i64 %3, 65535, !dbg !126
  store i64 %4, i64* @seed, align 8, !dbg !126, !tbaa !121
  %5 = trunc i64 %4 to i32, !dbg !127
  ret i32 %5, !dbg !127
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Initarr() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !128, !tbaa !121
  store i32 0, i32* @biggest, align 4, !dbg !130, !tbaa !131
  store i32 0, i32* @littlest, align 4, !dbg !130, !tbaa !131
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !14), !dbg !134
  br label %1, !dbg !134

; <label>:1                                       ; preds = %17, %0
  %2 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %3 = phi i32 [ 0, %0 ], [ %19, %17 ], !dbg !136
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %17 ]
  %4 = phi i64 [ 74755, %0 ], [ %7, %17 ], !dbg !136
  %5 = mul nsw i64 %4, 1309, !dbg !136
  %6 = add nsw i64 %5, 13849, !dbg !136
  %7 = and i64 %6, 65535, !dbg !136
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !15), !dbg !137
  %8 = urem i64 %7, 100000, !dbg !139
  %9 = add nsw i64 %8, 4294917296, !dbg !139
  %10 = trunc i64 %9 to i32, !dbg !139
  %11 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !139
  store i32 %10, i32* %11, align 4, !dbg !139, !tbaa !131
  %12 = icmp sgt i32 %10, %3, !dbg !140
  br i1 %12, label %13, label %14, !dbg !140

; <label>:13                                      ; preds = %1
  store i32 %10, i32* @biggest, align 4, !dbg !140, !tbaa !131
  br label %17, !dbg !140

; <label>:14                                      ; preds = %1
  %15 = icmp slt i32 %10, %2, !dbg !142
  br i1 %15, label %16, label %17, !dbg !142

; <label>:16                                      ; preds = %14
  store i32 %10, i32* @littlest, align 4, !dbg !142, !tbaa !131
  br label %17, !dbg !142

; <label>:17                                      ; preds = %13, %16, %14
  %18 = phi i32 [ %2, %13 ], [ %10, %16 ], [ %2, %14 ]
  %19 = phi i32 [ %10, %13 ], [ %3, %16 ], [ %3, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !134
  %exitcond = icmp eq i64 %indvars.iv.next, 5001, !dbg !134
  br i1 %exitcond, label %20, label %1, !dbg !134

; <label>:20                                      ; preds = %17
  store i64 %7, i64* @seed, align 8, !dbg !136, !tbaa !121
  ret void, !dbg !144
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Quicksort(i32* %a, i32 %l, i32 %r) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %28, %0
  %l.tr = phi i32 [ %l, %0 ], [ %i.1, %28 ]
  tail call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !22), !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %l.tr}, i64 0, metadata !23), !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %r}, i64 0, metadata !24), !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %l.tr}, i64 0, metadata !25), !dbg !146
  tail call void @llvm.dbg.value(metadata !{i32 %r}, i64 0, metadata !26), !dbg !146
  %1 = add nsw i32 %l.tr, %r, !dbg !147
  %2 = sdiv i32 %1, 2, !dbg !147
  %3 = sext i32 %2 to i64, !dbg !147
  %4 = getelementptr inbounds i32* %a, i64 %3, !dbg !147
  %5 = load i32* %4, align 4, !dbg !147, !tbaa !131
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !27), !dbg !147
  br label %.outer, !dbg !148

.outer:                                           ; preds = %23, %tailrecurse
  %j.0.ph = phi i32 [ %r, %tailrecurse ], [ %j.2, %23 ]
  %i.0.ph = phi i32 [ %l.tr, %tailrecurse ], [ %i.1, %23 ]
  %6 = sext i32 %i.0.ph to i64
  br label %7

; <label>:7                                       ; preds = %7, %.outer
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ %6, %.outer ]
  %8 = getelementptr inbounds i32* %a, i64 %indvars.iv, !dbg !149
  %9 = load i32* %8, align 4, !dbg !149, !tbaa !131
  %10 = icmp slt i32 %9, %5, !dbg !149
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !149
  br i1 %10, label %7, label %.preheader, !dbg !149

.preheader:                                       ; preds = %7
  %11 = sext i32 %j.0.ph to i64
  br label %12, !dbg !151

; <label>:12                                      ; preds = %12, %.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %12 ], [ %11, %.preheader ]
  %13 = getelementptr inbounds i32* %a, i64 %indvars.iv5, !dbg !151
  %14 = load i32* %13, align 4, !dbg !151, !tbaa !131
  %15 = icmp slt i32 %5, %14, !dbg !151
  %indvars.iv.next6 = add nsw i64 %indvars.iv5, -1, !dbg !151
  br i1 %15, label %12, label %16, !dbg !151

; <label>:16                                      ; preds = %12
  %17 = trunc i64 %indvars.iv to i32, !dbg !151
  %18 = trunc i64 %indvars.iv5 to i32, !dbg !152
  %19 = icmp sgt i32 %17, %18, !dbg !152
  br i1 %19, label %23, label %20, !dbg !152

; <label>:20                                      ; preds = %16
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !28), !dbg !154
  store i32 %14, i32* %8, align 4, !dbg !156, !tbaa !131
  store i32 %9, i32* %13, align 4, !dbg !157, !tbaa !131
  %21 = add nsw i32 %17, 1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !25), !dbg !158
  %22 = add nsw i32 %18, -1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !26), !dbg !158
  br label %23, !dbg !159

; <label>:23                                      ; preds = %16, %20
  %j.2 = phi i32 [ %22, %20 ], [ %18, %16 ]
  %i.1 = phi i32 [ %21, %20 ], [ %17, %16 ]
  %24 = icmp sgt i32 %i.1, %j.2, !dbg !160
  br i1 %24, label %25, label %.outer, !dbg !160

; <label>:25                                      ; preds = %23
  %26 = icmp sgt i32 %j.2, %l.tr, !dbg !161
  br i1 %26, label %27, label %28, !dbg !161

; <label>:27                                      ; preds = %25
  tail call void @Quicksort(i32* %a, i32 %l.tr, i32 %j.2) #4, !dbg !161
  br label %28, !dbg !161

; <label>:28                                      ; preds = %27, %25
  %29 = icmp slt i32 %i.1, %r, !dbg !163
  br i1 %29, label %tailrecurse, label %30, !dbg !163

; <label>:30                                      ; preds = %28
  ret void, !dbg !165
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Quick(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !33), !dbg !166
  tail call void @Initarr() #4, !dbg !167
  tail call void @Quicksort(i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 0), i32 1, i32 5000) #4, !dbg !168
  %1 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !169, !tbaa !131
  %2 = load i32* @littlest, align 4, !dbg !169, !tbaa !131
  %3 = icmp eq i32 %1, %2, !dbg !169
  br i1 %3, label %4, label %8, !dbg !169

; <label>:4                                       ; preds = %0
  %5 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 5000), align 16, !dbg !169, !tbaa !131
  %6 = load i32* @biggest, align 4, !dbg !169, !tbaa !131
  %7 = icmp eq i32 %5, %6, !dbg !169
  br i1 %7, label %9, label %8, !dbg !169

; <label>:8                                       ; preds = %4, %0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str, i64 0, i64 0)), !dbg !169
  br label %9, !dbg !169

; <label>:9                                       ; preds = %4, %8
  %10 = add nsw i32 %run, 1, !dbg !171
  %11 = sext i32 %10 to i64, !dbg !171
  %12 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %11, !dbg !171
  %13 = load i32* %12, align 4, !dbg !171, !tbaa !131
  %14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %13) #5, !dbg !171
  ret void, !dbg !172
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !173, i64 0, metadata !36), !dbg !174
  br label %1, !dbg !174

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Quick(i32 %i.01) #4, !dbg !174
  %2 = add nsw i32 %i.01, 1, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !36), !dbg !174
  %exitcond = icmp eq i32 %2, 100, !dbg !174
  br i1 %exitcond, label %3, label %1, !dbg !174

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !176
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
!llvm.module.flags = !{!117, !118}
!llvm.ident = !{!119}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !37, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"quicksort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !17, metadata !29, metadata !34}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initarr", metadata !"Initarr", metadata !"", i32 126, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initarr, null, null, metadata !13, i32 126} ; [ DW_TAG_subprogram ] [line 126] [def] [Initarr]
!13 = metadata !{metadata !14, metadata !15}
!14 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 127, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 127]
!15 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!16 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Quicksort", metadata !"Quicksort", metadata !"", i32 140, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32, i32)* @Quicksort, null, null, metadata !21, i32 140} ; [ DW_TAG_subprogram ] [line 140] [def] [Quicksort]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !20, metadata !11, metadata !11}
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28}
!22 = metadata !{i32 786689, metadata !17, metadata !"a", metadata !5, i32 16777356, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 140]
!23 = metadata !{i32 786689, metadata !17, metadata !"l", metadata !5, i32 33554572, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 140]
!24 = metadata !{i32 786689, metadata !17, metadata !"r", metadata !5, i32 50331788, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [r] [line 140]
!25 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 142]
!26 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 142]
!27 = metadata !{i32 786688, metadata !17, metadata !"x", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 142]
!28 = metadata !{i32 786688, metadata !17, metadata !"w", metadata !5, i32 142, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 142]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Quick", metadata !"Quick", metadata !"", i32 161, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Quick, null, null, metadata !32, i32 161} ; [ DW_TAG_subprogram ] [line 161] [def] [Quick]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !11}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786689, metadata !29, metadata !"run", metadata !5, i32 16777377, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 161]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 168, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !35, i32 169} ; [ DW_TAG_subprogram ] [line 168] [def] [scope 169] [main]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786688, metadata !34, metadata !"i", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 170]
!37 = metadata !{metadata !38, metadata !40, metadata !41, metadata !42, metadata !43, metadata !47, metadata !49, metadata !56, metadata !60, metadata !68, metadata !69, metadata !70, metadata !74, metadata !75, metadata !76, metadata !78, metadata !79, metadata !80, metadata !81, metadata !85, metadata !86, metadata !90, metadata !93, metadata !94, metadata !95, metadata !99, metadata !100, metadata !101, metadata !102, metadata !110, metadata !111, metadata !115, metadata !116}
!38 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !39, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!39 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!40 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !39, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!41 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !39, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!42 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !16, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!43 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !44, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!44 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !45, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!47 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !48, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!48 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!49 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !50, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!51 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!52 = metadata !{metadata !53, metadata !54, metadata !55}
!53 = metadata !{i32 786445, metadata !1, metadata !51, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!54 = metadata !{i32 786445, metadata !1, metadata !51, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !50} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!55 = metadata !{i32 786445, metadata !1, metadata !51, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!56 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !57, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!57 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !58, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!60 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !61, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!61 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !62, metadata !66, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!62 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!63 = metadata !{metadata !64, metadata !65}
!64 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!65 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!68 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !71, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!71 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!72 = metadata !{metadata !73, metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!74 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !71, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !71, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!76 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !77, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!77 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !39, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!78 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !77, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !77, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !57, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!81 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !82, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!85 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !82, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!86 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !87, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!87 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !88, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!88 = metadata !{metadata !89}
!89 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!90 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !91, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!91 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !92, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!92 = metadata !{metadata !84, metadata !89}
!93 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!95 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !96, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!96 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !97, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!99 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!100 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!101 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!102 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !103, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!103 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !104, metadata !108, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!104 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !105, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!105 = metadata !{metadata !106, metadata !107}
!106 = metadata !{i32 786445, metadata !1, metadata !104, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !39} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!107 = metadata !{i32 786445, metadata !1, metadata !104, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !39} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!108 = metadata !{metadata !109}
!109 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!110 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !103, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!111 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !112, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!112 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !104, metadata !113, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!115 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !39, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!116 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !39, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!117 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!118 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!119 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!120 = metadata !{i32 116, i32 0, metadata !4, null}
!121 = metadata !{metadata !122, metadata !122, i64 0}
!122 = metadata !{metadata !"long", metadata !123, i64 0}
!123 = metadata !{metadata !"omnipotent char", metadata !124, i64 0}
!124 = metadata !{metadata !"Simple C/C++ TBAA"}
!125 = metadata !{i32 117, i32 0, metadata !4, null}
!126 = metadata !{i32 120, i32 0, metadata !8, null}
!127 = metadata !{i32 121, i32 0, metadata !8, null}
!128 = metadata !{i32 116, i32 0, metadata !4, metadata !129}
!129 = metadata !{i32 129, i32 0, metadata !12, null}
!130 = metadata !{i32 130, i32 0, metadata !12, null}
!131 = metadata !{metadata !132, metadata !132, i64 0}
!132 = metadata !{metadata !"int", metadata !123, i64 0}
!133 = metadata !{i32 1}
!134 = metadata !{i32 131, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !12, i32 131, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!136 = metadata !{i32 120, i32 0, metadata !8, metadata !137}
!137 = metadata !{i32 132, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !1, metadata !135, i32 131, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!139 = metadata !{i32 134, i32 0, metadata !138, null}
!140 = metadata !{i32 135, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !138, i32 135, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!142 = metadata !{i32 136, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !141, i32 136, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!144 = metadata !{i32 138, i32 0, metadata !12, null}
!145 = metadata !{i32 140, i32 0, metadata !17, null}
!146 = metadata !{i32 144, i32 0, metadata !17, null}
!147 = metadata !{i32 145, i32 0, metadata !17, null}
!148 = metadata !{i32 146, i32 0, metadata !17, null}
!149 = metadata !{i32 147, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !17, i32 146, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!151 = metadata !{i32 148, i32 0, metadata !150, null}
!152 = metadata !{i32 149, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !150, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!154 = metadata !{i32 150, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !153, i32 149, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!156 = metadata !{i32 151, i32 0, metadata !155, null}
!157 = metadata !{i32 152, i32 0, metadata !155, null}
!158 = metadata !{i32 153, i32 0, metadata !155, null}
!159 = metadata !{i32 154, i32 0, metadata !155, null}
!160 = metadata !{i32 155, i32 0, metadata !150, null}
!161 = metadata !{i32 156, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !17, i32 156, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!163 = metadata !{i32 157, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !17, i32 157, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!165 = metadata !{i32 158, i32 0, metadata !17, null}
!166 = metadata !{i32 161, i32 0, metadata !29, null}
!167 = metadata !{i32 162, i32 0, metadata !29, null}
!168 = metadata !{i32 163, i32 0, metadata !29, null}
!169 = metadata !{i32 164, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !29, i32 164, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!171 = metadata !{i32 165, i32 0, metadata !29, null}
!172 = metadata !{i32 166, i32 0, metadata !29, null}
!173 = metadata !{i32 0}
!174 = metadata !{i32 171, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !34, i32 171, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/quicksort.c]
!176 = metadata !{i32 172, i32 0, metadata !34, null}
