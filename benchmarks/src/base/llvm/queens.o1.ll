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
@str = private unnamed_addr constant [18 x i8] c" Error in Queens.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !134, !tbaa !135
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !140, !tbaa !135
  %2 = mul nsw i64 %1, 1309, !dbg !140
  %3 = add nsw i64 %2, 13849, !dbg !140
  %4 = and i64 %3, 65535, !dbg !140
  store i64 %4, i64* @seed, align 8, !dbg !140, !tbaa !135
  %5 = trunc i64 %4 to i32, !dbg !141
  ret i32 %5, !dbg !141
}

; Function Attrs: nounwind uwtable
define void @Try(i32 %i, i32* nocapture %q, i32* nocapture %a, i32* nocapture %b, i32* nocapture %c, i32* nocapture %x) #0 {
.lr.ph:
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !17), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32* %q}, i64 0, metadata !18), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !19), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32* %b}, i64 0, metadata !20), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32* %c}, i64 0, metadata !21), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32* %x}, i64 0, metadata !22), !dbg !142
  tail call void @llvm.dbg.value(metadata !143, i64 0, metadata !23), !dbg !144
  store i32 0, i32* %q, align 4, !dbg !145, !tbaa !146
  %0 = add i32 %i, 7, !dbg !148
  %1 = sext i32 %i to i64, !dbg !151
  %2 = getelementptr inbounds i32* %x, i64 %1, !dbg !151
  %3 = icmp slt i32 %i, 8, !dbg !153
  %4 = add nsw i32 %i, 1, !dbg !155
  %5 = sext i32 %i to i64, !dbg !157
  br label %6, !dbg !157

; <label>:6                                       ; preds = %.lr.ph, %.backedge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %.backedge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !157
  store i32 0, i32* %q, align 4, !dbg !158, !tbaa !146
  %7 = getelementptr inbounds i32* %b, i64 %indvars.iv.next, !dbg !148
  %8 = load i32* %7, align 4, !dbg !148, !tbaa !146
  %9 = icmp eq i32 %8, 0, !dbg !148
  br i1 %9, label %.backedge, label %10, !dbg !148

; <label>:10                                      ; preds = %6
  %11 = add nsw i64 %indvars.iv.next, %5, !dbg !148
  %12 = getelementptr inbounds i32* %a, i64 %11, !dbg !148
  %13 = load i32* %12, align 4, !dbg !148, !tbaa !146
  %14 = icmp eq i32 %13, 0, !dbg !148
  br i1 %14, label %.backedge, label %15, !dbg !148

; <label>:15                                      ; preds = %10
  %16 = xor i64 %indvars.iv, 4294967295
  %17 = trunc i64 %16 to i32, !dbg !148
  %18 = add i32 %0, %17, !dbg !148
  %19 = sext i32 %18 to i64, !dbg !148
  %20 = getelementptr inbounds i32* %c, i64 %19, !dbg !148
  %21 = load i32* %20, align 4, !dbg !148, !tbaa !146
  %22 = icmp eq i32 %21, 0, !dbg !148
  br i1 %22, label %.backedge, label %23, !dbg !148

; <label>:23                                      ; preds = %15
  %24 = trunc i64 %indvars.iv.next to i32, !dbg !151
  store i32 %24, i32* %2, align 4, !dbg !151, !tbaa !146
  store i32 0, i32* %7, align 4, !dbg !159, !tbaa !146
  store i32 0, i32* %12, align 4, !dbg !160, !tbaa !146
  store i32 0, i32* %20, align 4, !dbg !161, !tbaa !146
  br i1 %3, label %25, label %29, !dbg !153

; <label>:25                                      ; preds = %23
  tail call void @Try(i32 %4, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x), !dbg !155
  %26 = load i32* %q, align 4, !dbg !162, !tbaa !146
  %27 = icmp eq i32 %26, 0, !dbg !162
  br i1 %27, label %28, label %.backedge, !dbg !162

; <label>:28                                      ; preds = %25
  store i32 1, i32* %7, align 4, !dbg !164, !tbaa !146
  store i32 1, i32* %12, align 4, !dbg !166, !tbaa !146
  store i32 1, i32* %20, align 4, !dbg !167, !tbaa !146
  br label %.backedge, !dbg !168

; <label>:29                                      ; preds = %23
  store i32 1, i32* %q, align 4, !dbg !169, !tbaa !146
  br label %.backedge

.backedge:                                        ; preds = %29, %28, %6, %10, %15, %25
  %30 = load i32* %q, align 4, !dbg !157, !tbaa !146
  %31 = icmp eq i32 %30, 0, !dbg !157
  %32 = trunc i64 %indvars.iv.next to i32, !dbg !157
  %33 = icmp ne i32 %32, 8, !dbg !157
  %or.cond = and i1 %31, %33, !dbg !157
  br i1 %or.cond, label %6, label %.critedge, !dbg !157

.critedge:                                        ; preds = %.backedge
  ret void, !dbg !170
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Doit() #0 {
  %q = alloca i32, align 4
  %a = alloca [9 x i32], align 16
  %b = alloca [17 x i32], align 16
  %c = alloca [15 x i32], align 16
  %x = alloca [9 x i32], align 16
  tail call void @llvm.dbg.declare(metadata !{i32* %q}, metadata !27), !dbg !171
  %1 = bitcast [9 x i32]* %a to i8*, !dbg !172
  call void @llvm.lifetime.start(i64 36, i8* %1) #2, !dbg !172
  tail call void @llvm.dbg.declare(metadata !{[9 x i32]* %a}, metadata !28), !dbg !172
  %2 = bitcast [17 x i32]* %b to i8*, !dbg !172
  call void @llvm.lifetime.start(i64 68, i8* %2) #2, !dbg !172
  tail call void @llvm.dbg.declare(metadata !{[17 x i32]* %b}, metadata !32), !dbg !172
  %3 = bitcast [15 x i32]* %c to i8*, !dbg !172
  call void @llvm.lifetime.start(i64 60, i8* %3) #2, !dbg !172
  tail call void @llvm.dbg.declare(metadata !{[15 x i32]* %c}, metadata !36), !dbg !172
  %4 = bitcast [9 x i32]* %x to i8*, !dbg !172
  call void @llvm.lifetime.start(i64 36, i8* %4) #2, !dbg !172
  tail call void @llvm.dbg.declare(metadata !{[9 x i32]* %x}, metadata !40), !dbg !172
  tail call void @llvm.dbg.value(metadata !173, i64 0, metadata !26), !dbg !174
  br label %5, !dbg !175

; <label>:5                                       ; preds = %20, %0
  %indvars.iv = phi i64 [ -7, %0 ], [ %indvars.iv.next, %20 ]
  %6 = add i64 %indvars.iv, 4294967295, !dbg !176
  %7 = trunc i64 %6 to i32, !dbg !176
  %8 = icmp ult i32 %7, 8, !dbg !176
  br i1 %8, label %9, label %11, !dbg !176

; <label>:9                                       ; preds = %5
  %10 = getelementptr inbounds [9 x i32]* %a, i64 0, i64 %indvars.iv, !dbg !176
  store i32 1, i32* %10, align 4, !dbg !176, !tbaa !146
  br label %11, !dbg !176

; <label>:11                                      ; preds = %9, %5
  %12 = trunc i64 %indvars.iv to i32, !dbg !179
  %13 = icmp sgt i32 %12, 1, !dbg !179
  br i1 %13, label %14, label %.thread, !dbg !179

; <label>:14                                      ; preds = %11
  %15 = getelementptr inbounds [17 x i32]* %b, i64 0, i64 %indvars.iv, !dbg !179
  store i32 1, i32* %15, align 4, !dbg !179, !tbaa !146
  %16 = trunc i64 %indvars.iv to i32, !dbg !181
  %17 = icmp slt i32 %16, 8, !dbg !181
  br i1 %17, label %.thread, label %20, !dbg !181

.thread:                                          ; preds = %11, %14
  %18 = add nsw i64 %indvars.iv, 7, !dbg !181
  %19 = getelementptr inbounds [15 x i32]* %c, i64 0, i64 %18, !dbg !181
  store i32 1, i32* %19, align 4, !dbg !181, !tbaa !146
  br label %20, !dbg !181

; <label>:20                                      ; preds = %.thread, %14
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !175
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !175
  br i1 %exitcond, label %21, label %5, !dbg !175

; <label>:21                                      ; preds = %20
  %22 = getelementptr inbounds [17 x i32]* %b, i64 0, i64 0, !dbg !183
  %23 = getelementptr inbounds [9 x i32]* %a, i64 0, i64 0, !dbg !183
  %24 = getelementptr inbounds [15 x i32]* %c, i64 0, i64 0, !dbg !183
  %25 = getelementptr inbounds [9 x i32]* %x, i64 0, i64 0, !dbg !183
  call void @Try(i32 1, i32* %q, i32* %22, i32* %23, i32* %24, i32* %25), !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32* %q}, i64 0, metadata !27), !dbg !184
  %26 = load i32* %q, align 4, !dbg !184, !tbaa !146
  %27 = icmp eq i32 %26, 0, !dbg !184
  br i1 %27, label %28, label %29, !dbg !184

; <label>:28                                      ; preds = %21
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !184
  br label %29, !dbg !184

; <label>:29                                      ; preds = %21, %28
  call void @llvm.lifetime.end(i64 36, i8* %4) #2, !dbg !186
  call void @llvm.lifetime.end(i64 60, i8* %3) #2, !dbg !186
  call void @llvm.lifetime.end(i64 68, i8* %2) #2, !dbg !186
  call void @llvm.lifetime.end(i64 36, i8* %1) #2, !dbg !186
  ret void, !dbg !186
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @Queens(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !45), !dbg !187
  tail call void @llvm.dbg.value(metadata !188, i64 0, metadata !46), !dbg !189
  br label %1, !dbg !189

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 1, %0 ], [ %2, %1 ]
  tail call void @Doit(), !dbg !189
  %2 = add nsw i32 %i.01, 1, !dbg !189
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !46), !dbg !189
  %exitcond = icmp eq i32 %2, 51, !dbg !189
  br i1 %exitcond, label %3, label %1, !dbg !189

; <label>:3                                       ; preds = %1
  %4 = add nsw i32 %run, 1, !dbg !191
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %4) #2, !dbg !191
  ret void, !dbg !192
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !143, i64 0, metadata !49), !dbg !193
  br label %1, !dbg !193

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Queens(i32 %i.01), !dbg !193
  %2 = add nsw i32 %i.01, 1, !dbg !193
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !49), !dbg !193
  %exitcond = icmp eq i32 %2, 100, !dbg !193
  br i1 %exitcond, label %3, label %1, !dbg !193

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !195
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!131, !132}
!llvm.ident = !{!133}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !50, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c] [DW_LANG_C99]
!1 = metadata !{metadata !"queens.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !24, metadata !41, metadata !47}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Try", metadata !"Try", metadata !"", i32 137, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32*, i32*, i32*, i32*, i32*)* @Try, null, null, metadata !16, i32 137} ; [ DW_TAG_subprogram ] [line 137] [def] [Try]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !11, metadata !15, metadata !15, metadata !15, metadata !15, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = metadata !{metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23}
!17 = metadata !{i32 786689, metadata !12, metadata !"i", metadata !5, i32 16777353, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 137]
!18 = metadata !{i32 786689, metadata !12, metadata !"q", metadata !5, i32 33554569, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [q] [line 137]
!19 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 50331785, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 137]
!20 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 67109001, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 137]
!21 = metadata !{i32 786689, metadata !12, metadata !"c", metadata !5, i32 83886217, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 137]
!22 = metadata !{i32 786689, metadata !12, metadata !"x", metadata !5, i32 100663433, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 137]
!23 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 138]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Doit", metadata !"Doit", metadata !"", i32 162, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Doit, null, null, metadata !25, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Doit]
!25 = metadata !{metadata !26, metadata !27, metadata !28, metadata !32, metadata !36, metadata !40}
!26 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 163]
!27 = metadata !{i32 786688, metadata !24, metadata !"q", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [q] [line 163]
!28 = metadata !{i32 786688, metadata !24, metadata !"a", metadata !5, i32 164, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 164]
!29 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 288, i64 32, i32 0, i32 0, metadata !11, metadata !30, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from int]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ] [0, 8]
!32 = metadata !{i32 786688, metadata !24, metadata !"b", metadata !5, i32 164, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 164]
!33 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 544, i64 32, i32 0, i32 0, metadata !11, metadata !34, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786465, i64 0, i64 17}       ; [ DW_TAG_subrange_type ] [0, 16]
!36 = metadata !{i32 786688, metadata !24, metadata !"c", metadata !5, i32 164, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 164]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 480, i64 32, i32 0, i32 0, metadata !11, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 480, align 32, offset 0] [from int]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 15}       ; [ DW_TAG_subrange_type ] [0, 14]
!40 = metadata !{i32 786688, metadata !24, metadata !"x", metadata !5, i32 164, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 164]
!41 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Queens", metadata !"Queens", metadata !"", i32 177, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Queens, null, null, metadata !44, i32 177} ; [ DW_TAG_subprogram ] [line 177] [def] [Queens]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{null, metadata !11}
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786689, metadata !41, metadata !"run", metadata !5, i32 16777393, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 177]
!46 = metadata !{i32 786688, metadata !41, metadata !"i", metadata !5, i32 178, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 178]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 183, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !48, i32 184} ; [ DW_TAG_subprogram ] [line 183] [def] [scope 184] [main]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786688, metadata !47, metadata !"i", metadata !5, i32 185, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 185]
!50 = metadata !{metadata !51, metadata !53, metadata !54, metadata !55, metadata !57, metadata !61, metadata !63, metadata !70, metadata !74, metadata !82, metadata !83, metadata !84, metadata !88, metadata !89, metadata !90, metadata !92, metadata !93, metadata !94, metadata !95, metadata !99, metadata !100, metadata !104, metadata !107, metadata !108, metadata !109, metadata !113, metadata !114, metadata !115, metadata !116, metadata !124, metadata !125, metadata !129, metadata !130}
!51 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !52, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!52 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!53 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !52, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!54 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !52, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!55 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !56, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!56 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!57 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !58, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!58 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !59, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!61 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !62, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!62 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!63 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !64, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!64 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!65 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!66 = metadata !{metadata !67, metadata !68, metadata !69}
!67 = metadata !{i32 786445, metadata !1, metadata !65, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !64} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786445, metadata !1, metadata !65, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !64} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!69 = metadata !{i32 786445, metadata !1, metadata !65, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!70 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !71, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!71 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !72, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!74 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !75, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!75 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !76, metadata !80, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!76 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !77, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!77 = metadata !{metadata !78, metadata !79}
!78 = metadata !{i32 786445, metadata !1, metadata !76, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!79 = metadata !{i32 786445, metadata !1, metadata !76, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!82 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !85, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !86, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!86 = metadata !{metadata !87, metadata !87}
!87 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!88 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !85, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !85, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!90 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !91, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!91 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !52, metadata !86, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!92 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !91, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!93 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !91, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !71, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!95 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !96, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!96 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !97, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!99 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !96, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!100 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !101, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!101 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !102, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!102 = metadata !{metadata !103}
!103 = metadata !{i32 786465, i64 0, i64 512}     ; [ DW_TAG_subrange_type ] [0, 511]
!104 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !105, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!105 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !106, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!106 = metadata !{metadata !98, metadata !103}
!107 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!108 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!109 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !110, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!110 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !111, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!113 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!114 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!115 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!116 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !117, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!117 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !118, metadata !122, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!118 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !119, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!119 = metadata !{metadata !120, metadata !121}
!120 = metadata !{i32 786445, metadata !1, metadata !118, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!121 = metadata !{i32 786445, metadata !1, metadata !118, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !52} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!124 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !117, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!125 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !126, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!126 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !118, metadata !127, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!127 = metadata !{metadata !128}
!128 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!129 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !52, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!130 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !52, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!131 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!132 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!133 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!134 = metadata !{i32 116, i32 0, metadata !4, null}
!135 = metadata !{metadata !136, metadata !136, i64 0}
!136 = metadata !{metadata !"long", metadata !137, i64 0}
!137 = metadata !{metadata !"omnipotent char", metadata !138, i64 0}
!138 = metadata !{metadata !"Simple C/C++ TBAA"}
!139 = metadata !{i32 117, i32 0, metadata !4, null}
!140 = metadata !{i32 120, i32 0, metadata !8, null}
!141 = metadata !{i32 121, i32 0, metadata !8, null}
!142 = metadata !{i32 137, i32 0, metadata !12, null}
!143 = metadata !{i32 0}
!144 = metadata !{i32 139, i32 0, metadata !12, null}
!145 = metadata !{i32 140, i32 0, metadata !12, null}
!146 = metadata !{metadata !147, metadata !147, i64 0}
!147 = metadata !{metadata !"int", metadata !137, i64 0}
!148 = metadata !{i32 144, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !150, i32 144, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!150 = metadata !{i32 786443, metadata !1, metadata !12, i32 141, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!151 = metadata !{i32 145, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !149, i32 144, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!153 = metadata !{i32 149, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !152, i32 149, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!155 = metadata !{i32 150, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !1, metadata !154, i32 149, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!157 = metadata !{i32 141, i32 0, metadata !12, null}
!158 = metadata !{i32 143, i32 0, metadata !150, null}
!159 = metadata !{i32 146, i32 0, metadata !152, null}
!160 = metadata !{i32 147, i32 0, metadata !152, null}
!161 = metadata !{i32 148, i32 0, metadata !152, null}
!162 = metadata !{i32 151, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !156, i32 151, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!164 = metadata !{i32 152, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !163, i32 151, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!166 = metadata !{i32 153, i32 0, metadata !165, null}
!167 = metadata !{i32 154, i32 0, metadata !165, null}
!168 = metadata !{i32 155, i32 0, metadata !165, null}
!169 = metadata !{i32 157, i32 0, metadata !154, null}
!170 = metadata !{i32 160, i32 0, metadata !12, null}
!171 = metadata !{i32 163, i32 0, metadata !24, null}
!172 = metadata !{i32 164, i32 0, metadata !24, null}
!173 = metadata !{i32 -7}
!174 = metadata !{i32 165, i32 0, metadata !24, null}
!175 = metadata !{i32 166, i32 0, metadata !24, null}
!176 = metadata !{i32 167, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !1, metadata !178, i32 167, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!178 = metadata !{i32 786443, metadata !1, metadata !24, i32 166, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!179 = metadata !{i32 168, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !178, i32 168, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!181 = metadata !{i32 169, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !178, i32 169, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!183 = metadata !{i32 173, i32 0, metadata !24, null}
!184 = metadata !{i32 174, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !24, i32 174, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!186 = metadata !{i32 175, i32 0, metadata !24, null}
!187 = metadata !{i32 177, i32 0, metadata !41, null}
!188 = metadata !{i32 1}
!189 = metadata !{i32 179, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !1, metadata !41, i32 179, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!191 = metadata !{i32 180, i32 0, metadata !41, null}
!192 = metadata !{i32 181, i32 0, metadata !41, null}
!193 = metadata !{i32 186, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !47, i32 186, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/queens.c]
!195 = metadata !{i32 187, i32 0, metadata !47, null}
