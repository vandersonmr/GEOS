; ModuleID = 'treesort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@tree = common global %struct.node* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
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
@str = private unnamed_addr constant [16 x i8] c" Error in Tree.\00"

; Function Attrs: minsize nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !128, !tbaa !129
  ret void, !dbg !133
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !134, !tbaa !129
  %2 = mul nsw i64 %1, 1309, !dbg !134
  %3 = add nsw i64 %2, 13849, !dbg !134
  %4 = and i64 %3, 65535, !dbg !134
  store i64 %4, i64* @seed, align 8, !dbg !134, !tbaa !129
  %5 = trunc i64 %4 to i32, !dbg !135
  ret i32 %5, !dbg !135
}

; Function Attrs: minsize nounwind optsize uwtable
define void @tInitarr() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !136, !tbaa !129
  store i32 0, i32* @biggest, align 4, !dbg !138, !tbaa !139
  store i32 0, i32* @littlest, align 4, !dbg !138, !tbaa !139
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !14), !dbg !142
  br label %1, !dbg !142

; <label>:1                                       ; preds = %17, %0
  %2 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %3 = phi i32 [ 0, %0 ], [ %19, %17 ], !dbg !144
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %17 ]
  %4 = phi i64 [ 74755, %0 ], [ %7, %17 ], !dbg !144
  %5 = mul nsw i64 %4, 1309, !dbg !144
  %6 = add nsw i64 %5, 13849, !dbg !144
  %7 = and i64 %6, 65535, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !15), !dbg !145
  %8 = urem i64 %7, 100000, !dbg !147
  %9 = add nsw i64 %8, 4294917296, !dbg !147
  %10 = trunc i64 %9 to i32, !dbg !147
  %11 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !147
  store i32 %10, i32* %11, align 4, !dbg !147, !tbaa !139
  %12 = icmp sgt i32 %10, %3, !dbg !148
  br i1 %12, label %13, label %14, !dbg !148

; <label>:13                                      ; preds = %1
  store i32 %10, i32* @biggest, align 4, !dbg !148, !tbaa !139
  br label %17, !dbg !148

; <label>:14                                      ; preds = %1
  %15 = icmp slt i32 %10, %2, !dbg !150
  br i1 %15, label %16, label %17, !dbg !150

; <label>:16                                      ; preds = %14
  store i32 %10, i32* @littlest, align 4, !dbg !150, !tbaa !139
  br label %17, !dbg !150

; <label>:17                                      ; preds = %13, %16, %14
  %18 = phi i32 [ %2, %13 ], [ %10, %16 ], [ %2, %14 ]
  %19 = phi i32 [ %10, %13 ], [ %3, %16 ], [ %3, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !142
  %exitcond = icmp eq i64 %indvars.iv.next, 5001, !dbg !142
  br i1 %exitcond, label %20, label %1, !dbg !142

; <label>:20                                      ; preds = %17
  store i64 %7, i64* @seed, align 8, !dbg !144, !tbaa !129
  ret void, !dbg !152
}

; Function Attrs: minsize nounwind optsize uwtable
define void @CreateNode(%struct.node** nocapture %t, i32 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.node** %t}, i64 0, metadata !28), !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !29), !dbg !153
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !154
  %2 = bitcast i8* %1 to %struct.node*, !dbg !154
  store %struct.node* %2, %struct.node** %t, align 8, !dbg !154, !tbaa !155
  %3 = getelementptr inbounds i8* %1, i64 16, !dbg !157
  %4 = bitcast i8* %3 to i32*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false), !dbg !158
  store i32 %n, i32* %4, align 4, !dbg !157, !tbaa !159
  ret void, !dbg !161
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: minsize nounwind optsize uwtable
define void @Insert(i32 %n, %struct.node* nocapture %t) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %11, %4, %0
  %t.tr = phi %struct.node* [ %t, %0 ], [ %6, %4 ], [ %13, %11 ]
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !34), !dbg !162
  tail call void @llvm.dbg.value(metadata !{%struct.node* %t.tr}, i64 0, metadata !35), !dbg !162
  %1 = getelementptr inbounds %struct.node* %t.tr, i64 0, i32 2, !dbg !163
  %2 = load i32* %1, align 4, !dbg !163, !tbaa !159
  %3 = icmp slt i32 %2, %n, !dbg !163
  br i1 %3, label %4, label %9, !dbg !163

; <label>:4                                       ; preds = %tailrecurse
  %5 = getelementptr inbounds %struct.node* %t.tr, i64 0, i32 0, !dbg !165
  %6 = load %struct.node** %5, align 8, !dbg !165, !tbaa !167
  %7 = icmp eq %struct.node* %6, null, !dbg !165
  br i1 %7, label %8, label %tailrecurse, !dbg !165

; <label>:8                                       ; preds = %4
  tail call void @CreateNode(%struct.node** %5, i32 %n) #6, !dbg !165
  br label %.loopexit, !dbg !165

; <label>:9                                       ; preds = %tailrecurse
  %10 = icmp sgt i32 %2, %n, !dbg !168
  br i1 %10, label %11, label %.loopexit, !dbg !168

; <label>:11                                      ; preds = %9
  %12 = getelementptr inbounds %struct.node* %t.tr, i64 0, i32 1, !dbg !170
  %13 = load %struct.node** %12, align 8, !dbg !170, !tbaa !172
  %14 = icmp eq %struct.node* %13, null, !dbg !170
  br i1 %14, label %15, label %tailrecurse, !dbg !170

; <label>:15                                      ; preds = %11
  tail call void @CreateNode(%struct.node** %12, i32 %n) #6, !dbg !170
  br label %.loopexit, !dbg !170

.loopexit:                                        ; preds = %9, %15, %8
  ret void, !dbg !173
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define i32 @Checktree(%struct.node* nocapture readonly %p) #2 {
  tail call void @llvm.dbg.value(metadata !{%struct.node* %p}, i64 0, metadata !40), !dbg !174
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !41), !dbg !175
  %1 = getelementptr inbounds %struct.node* %p, i64 0, i32 0, !dbg !176
  %2 = load %struct.node** %1, align 8, !dbg !176, !tbaa !167
  %3 = icmp eq %struct.node* %2, null, !dbg !176
  br i1 %3, label %12, label %4, !dbg !176

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.node* %2, i64 0, i32 2, !dbg !178
  %6 = load i32* %5, align 4, !dbg !178, !tbaa !159
  %7 = getelementptr inbounds %struct.node* %p, i64 0, i32 2, !dbg !178
  %8 = load i32* %7, align 4, !dbg !178, !tbaa !159
  %9 = icmp sgt i32 %6, %8, !dbg !178
  br i1 %9, label %10, label %12, !dbg !178

; <label>:10                                      ; preds = %4
  %11 = tail call i32 @Checktree(%struct.node* %2) #6, !dbg !180
  %not.2 = icmp ne i32 %11, 0, !dbg !180
  %. = zext i1 %not.2 to i32, !dbg !180
  tail call void @llvm.dbg.value(metadata !{i32 %.}, i64 0, metadata !41), !dbg !181
  br label %12

; <label>:12                                      ; preds = %4, %0, %10
  %result.0 = phi i32 [ %., %10 ], [ 1, %0 ], [ 0, %4 ]
  %13 = getelementptr inbounds %struct.node* %p, i64 0, i32 1, !dbg !182
  %14 = load %struct.node** %13, align 8, !dbg !182, !tbaa !172
  %15 = icmp eq %struct.node* %14, null, !dbg !182
  br i1 %15, label %26, label %16, !dbg !182

; <label>:16                                      ; preds = %12
  %17 = getelementptr inbounds %struct.node* %14, i64 0, i32 2, !dbg !184
  %18 = load i32* %17, align 4, !dbg !184, !tbaa !159
  %19 = getelementptr inbounds %struct.node* %p, i64 0, i32 2, !dbg !184
  %20 = load i32* %19, align 4, !dbg !184, !tbaa !159
  %21 = icmp slt i32 %18, %20, !dbg !184
  br i1 %21, label %22, label %26, !dbg !184

; <label>:22                                      ; preds = %16
  %23 = tail call i32 @Checktree(%struct.node* %14) #6, !dbg !186
  %24 = icmp ne i32 %result.0, 0, !dbg !186
  %not. = icmp ne i32 %23, 0, !dbg !186
  %.1 = and i1 %24, %not., !dbg !186
  %25 = zext i1 %.1 to i32
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !41), !dbg !181
  ret i32 %25, !dbg !187

; <label>:26                                      ; preds = %16, %12
  %result.1 = phi i32 [ %result.0, %12 ], [ 0, %16 ]
  ret i32 %result.1, !dbg !187
}

; Function Attrs: minsize nounwind optsize uwtable
define void @Trees(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !46), !dbg !188
  tail call void @tInitarr() #6, !dbg !189
  %1 = tail call noalias i8* @malloc(i64 24) #5, !dbg !190
  %2 = bitcast i8* %1 to %struct.node*, !dbg !190
  store %struct.node* %2, %struct.node** @tree, align 8, !dbg !190, !tbaa !155
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false), !dbg !191
  %3 = load i32* getelementptr inbounds ([5001 x i32]* @sortlist, i64 0, i64 1), align 4, !dbg !191, !tbaa !139
  %4 = getelementptr inbounds i8* %1, i64 16, !dbg !191
  %5 = bitcast i8* %4 to i32*, !dbg !191
  store i32 %3, i32* %5, align 4, !dbg !191, !tbaa !159
  tail call void @llvm.dbg.value(metadata !192, i64 0, metadata !47), !dbg !193
  br label %6, !dbg !193

; <label>:6                                       ; preds = %._crit_edge, %0
  %7 = phi %struct.node* [ %2, %0 ], [ %.pre, %._crit_edge ]
  %indvars.iv = phi i64 [ 2, %0 ], [ %indvars.iv.next, %._crit_edge ]
  %8 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %indvars.iv, !dbg !195
  %9 = load i32* %8, align 4, !dbg !195, !tbaa !139
  tail call void @Insert(i32 %9, %struct.node* %7) #6, !dbg !195
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !193
  %exitcond = icmp eq i64 %indvars.iv.next, 5001, !dbg !193
  br i1 %exitcond, label %10, label %._crit_edge, !dbg !193

._crit_edge:                                      ; preds = %6
  %.pre = load %struct.node** @tree, align 8, !dbg !195, !tbaa !155
  br label %6, !dbg !193

; <label>:10                                      ; preds = %6
  %11 = add nsw i32 %run, 2, !dbg !196
  %12 = sext i32 %11 to i64, !dbg !196
  %13 = getelementptr inbounds [5001 x i32]* @sortlist, i64 0, i64 %12, !dbg !196
  %14 = load i32* %13, align 4, !dbg !196, !tbaa !139
  %15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %14) #5, !dbg !196
  %16 = load %struct.node** @tree, align 8, !dbg !197, !tbaa !155
  %17 = tail call i32 @Checktree(%struct.node* %16) #6, !dbg !197
  %18 = icmp eq i32 %17, 0, !dbg !197
  br i1 %18, label %19, label %20, !dbg !197

; <label>:19                                      ; preds = %10
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str, i64 0, i64 0)), !dbg !197
  br label %20, !dbg !197

; <label>:20                                      ; preds = %10, %19
  ret void, !dbg !199
}

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !200, i64 0, metadata !50), !dbg !201
  br label %1, !dbg !201

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Trees(i32 %i.01) #6, !dbg !201
  %2 = add nsw i32 %i.01, 1, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !50), !dbg !201
  %exitcond = icmp eq i32 %2, 100, !dbg !201
  br i1 %exitcond, label %3, label %1, !dbg !201

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !203
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize }
attributes #6 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!125, !126}
!llvm.ident = !{!127}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !51, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"treesort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !17, metadata !30, metadata !36, metadata !42, metadata !48}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"tInitarr", metadata !"tInitarr", metadata !"", i32 128, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @tInitarr, null, null, metadata !13, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [tInitarr]
!13 = metadata !{metadata !14, metadata !15}
!14 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 129, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 129]
!15 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 130, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 130]
!16 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"CreateNode", metadata !"CreateNode", metadata !"", i32 142, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.node**, i32)* @CreateNode, null, null, metadata !27, i32 142} ; [ DW_TAG_subprogram ] [line 142] [def] [CreateNode]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !20, metadata !11}
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!22 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!23 = metadata !{metadata !24, metadata !25, metadata !26}
!24 = metadata !{i32 786445, metadata !1, metadata !22, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!25 = metadata !{i32 786445, metadata !1, metadata !22, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!26 = metadata !{i32 786445, metadata !1, metadata !22, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!27 = metadata !{metadata !28, metadata !29}
!28 = metadata !{i32 786689, metadata !17, metadata !"t", metadata !5, i32 16777358, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 142]
!29 = metadata !{i32 786689, metadata !17, metadata !"n", metadata !5, i32 33554574, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 142]
!30 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Insert", metadata !"Insert", metadata !"", i32 148, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struct.node*)* @Insert, null, null, metadata !33, i32 148} ; [ DW_TAG_subprogram ] [line 148] [def] [Insert]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{null, metadata !11, metadata !21}
!33 = metadata !{metadata !34, metadata !35}
!34 = metadata !{i32 786689, metadata !30, metadata !"n", metadata !5, i32 16777364, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 148]
!35 = metadata !{i32 786689, metadata !30, metadata !"t", metadata !5, i32 33554580, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 148]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Checktree", metadata !"Checktree", metadata !"", i32 158, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.node*)* @Checktree, null, null, metadata !39, i32 158} ; [ DW_TAG_subprogram ] [line 158] [def] [Checktree]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !11, metadata !21}
!39 = metadata !{metadata !40, metadata !41}
!40 = metadata !{i32 786689, metadata !36, metadata !"p", metadata !5, i32 16777374, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 158]
!41 = metadata !{i32 786688, metadata !36, metadata !"result", metadata !5, i32 160, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 160]
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Trees", metadata !"Trees", metadata !"", i32 171, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Trees, null, null, metadata !45, i32 171} ; [ DW_TAG_subprogram ] [line 171] [def] [Trees]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null, metadata !11}
!45 = metadata !{metadata !46, metadata !47}
!46 = metadata !{i32 786689, metadata !42, metadata !"run", metadata !5, i32 16777387, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 171]
!47 = metadata !{i32 786688, metadata !42, metadata !"i", metadata !5, i32 172, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 172]
!48 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 182, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !49, i32 183} ; [ DW_TAG_subprogram ] [line 182] [def] [scope 183] [main]
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786688, metadata !48, metadata !"i", metadata !5, i32 184, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 184]
!51 = metadata !{metadata !52, metadata !54, metadata !55, metadata !56, metadata !57, metadata !61, metadata !63, metadata !64, metadata !68, metadata !76, metadata !77, metadata !78, metadata !82, metadata !83, metadata !84, metadata !86, metadata !87, metadata !88, metadata !89, metadata !93, metadata !94, metadata !98, metadata !101, metadata !102, metadata !103, metadata !107, metadata !108, metadata !109, metadata !110, metadata !118, metadata !119, metadata !123, metadata !124}
!52 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !53, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!53 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!54 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !53, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !53, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !16, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!57 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !58, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!58 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !59, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!61 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !62, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!62 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!63 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !21, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!64 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !65, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!65 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !66, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!68 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !69, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!69 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !70, metadata !74, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!70 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!71 = metadata !{metadata !72, metadata !73}
!72 = metadata !{i32 786445, metadata !1, metadata !70, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!73 = metadata !{i32 786445, metadata !1, metadata !70, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!76 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!77 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !79, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!79 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !80, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!80 = metadata !{metadata !81, metadata !81}
!81 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!82 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !79, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !79, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !53, metadata !80, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!86 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !65, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !90, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!90 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !91, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!93 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !90, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !95, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!98 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !99, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!99 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !100, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!100 = metadata !{metadata !92, metadata !97}
!101 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!102 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!103 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !104, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!104 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !105, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!107 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!108 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!109 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!110 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !111, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!111 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !112, metadata !116, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!112 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !113, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!113 = metadata !{metadata !114, metadata !115}
!114 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!115 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !53} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!118 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !111, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!119 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !120, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !112, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!123 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !53, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!124 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !53, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!125 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!126 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!127 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!128 = metadata !{i32 116, i32 0, metadata !4, null}
!129 = metadata !{metadata !130, metadata !130, i64 0}
!130 = metadata !{metadata !"long", metadata !131, i64 0}
!131 = metadata !{metadata !"omnipotent char", metadata !132, i64 0}
!132 = metadata !{metadata !"Simple C/C++ TBAA"}
!133 = metadata !{i32 117, i32 0, metadata !4, null}
!134 = metadata !{i32 120, i32 0, metadata !8, null}
!135 = metadata !{i32 121, i32 0, metadata !8, null}
!136 = metadata !{i32 116, i32 0, metadata !4, metadata !137}
!137 = metadata !{i32 131, i32 0, metadata !12, null}
!138 = metadata !{i32 132, i32 0, metadata !12, null}
!139 = metadata !{metadata !140, metadata !140, i64 0}
!140 = metadata !{metadata !"int", metadata !131, i64 0}
!141 = metadata !{i32 1}
!142 = metadata !{i32 133, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !12, i32 133, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!144 = metadata !{i32 120, i32 0, metadata !8, metadata !145}
!145 = metadata !{i32 134, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !143, i32 133, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!147 = metadata !{i32 136, i32 0, metadata !146, null}
!148 = metadata !{i32 137, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !146, i32 137, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!150 = metadata !{i32 138, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !149, i32 138, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!152 = metadata !{i32 140, i32 0, metadata !12, null}
!153 = metadata !{i32 142, i32 0, metadata !17, null}
!154 = metadata !{i32 143, i32 0, metadata !17, null}
!155 = metadata !{metadata !156, metadata !156, i64 0}
!156 = metadata !{metadata !"any pointer", metadata !131, i64 0}
!157 = metadata !{i32 145, i32 0, metadata !17, null}
!158 = metadata !{i32 144, i32 0, metadata !17, null}
!159 = metadata !{metadata !160, metadata !140, i64 16}
!160 = metadata !{metadata !"node", metadata !156, i64 0, metadata !156, i64 8, metadata !140, i64 16}
!161 = metadata !{i32 146, i32 0, metadata !17, null}
!162 = metadata !{i32 148, i32 0, metadata !30, null}
!163 = metadata !{i32 150, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !30, i32 150, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!165 = metadata !{i32 151, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 151, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!167 = metadata !{metadata !160, metadata !156, i64 0}
!168 = metadata !{i32 153, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !1, metadata !164, i32 153, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!170 = metadata !{i32 154, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !169, i32 154, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!172 = metadata !{metadata !160, metadata !156, i64 8}
!173 = metadata !{i32 156, i32 0, metadata !30, null}
!174 = metadata !{i32 158, i32 0, metadata !36, null}
!175 = metadata !{i32 161, i32 0, metadata !36, null}
!176 = metadata !{i32 162, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !36, i32 162, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!178 = metadata !{i32 163, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !1, metadata !177, i32 163, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!180 = metadata !{i32 164, i32 0, metadata !179, null}
!181 = metadata !{i32 160, i32 0, metadata !36, null}
!182 = metadata !{i32 165, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !36, i32 165, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!184 = metadata !{i32 166, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !183, i32 166, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!186 = metadata !{i32 167, i32 0, metadata !185, null}
!187 = metadata !{i32 168, i32 0, metadata !36, null}
!188 = metadata !{i32 171, i32 0, metadata !42, null}
!189 = metadata !{i32 173, i32 0, metadata !42, null}
!190 = metadata !{i32 174, i32 0, metadata !42, null}
!191 = metadata !{i32 175, i32 0, metadata !42, null}
!192 = metadata !{i32 2}
!193 = metadata !{i32 176, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !42, i32 176, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!195 = metadata !{i32 177, i32 0, metadata !194, null}
!196 = metadata !{i32 178, i32 0, metadata !42, null}
!197 = metadata !{i32 179, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !42, i32 179, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!199 = metadata !{i32 180, i32 0, metadata !42, null}
!200 = metadata !{i32 0}
!201 = metadata !{i32 185, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !48, i32 185, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/treesort.c]
!203 = metadata !{i32 186, i32 0, metadata !48, null}
