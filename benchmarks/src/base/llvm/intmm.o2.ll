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
  store i64 74755, i64* @seed, align 8, !dbg !128, !tbaa !129
  ret void, !dbg !133
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !134, !tbaa !129
  %2 = mul nsw i64 %1, 1309, !dbg !134
  %3 = add nsw i64 %2, 13849, !dbg !134
  %4 = and i64 %3, 65535, !dbg !134
  store i64 %4, i64* @seed, align 8, !dbg !134, !tbaa !129
  %5 = trunc i64 %4 to i32, !dbg !135
  ret i32 %5, !dbg !135
}

; Function Attrs: nounwind uwtable
define void @Initmatrix([41 x i32]* nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{[41 x i32]* %m}, i64 0, metadata !20), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !22), !dbg !138
  %seed.promoted3 = load i64* @seed, align 8, !dbg !140, !tbaa !129
  br label %.preheader, !dbg !138

.preheader:                                       ; preds = %10, %0
  %indvars.iv5 = phi i64 [ 1, %0 ], [ %indvars.iv.next6, %10 ]
  %.lcssa4 = phi i64 [ %seed.promoted3, %0 ], [ %5, %10 ]
  br label %1, !dbg !144

; <label>:1                                       ; preds = %1, %.preheader
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %1 ]
  %2 = phi i64 [ %.lcssa4, %.preheader ], [ %5, %1 ], !dbg !140
  %3 = mul nsw i64 %2, 1309, !dbg !140
  %4 = add nsw i64 %3, 13849, !dbg !140
  %5 = and i64 %4, 65535, !dbg !140
  %6 = trunc i64 %5 to i32, !dbg !145
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !21), !dbg !141
  %7 = urem i32 %6, 120, !dbg !146
  %8 = add nsw i32 %7, -60, !dbg !146
  %9 = getelementptr inbounds [41 x i32]* %m, i64 %indvars.iv5, i64 %indvars.iv, !dbg !146
  store i32 %8, i32* %9, align 4, !dbg !146, !tbaa !147
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !144
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !144
  br i1 %exitcond, label %10, label %1, !dbg !144

; <label>:10                                      ; preds = %1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !138
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 41, !dbg !138
  br i1 %exitcond7, label %11, label %.preheader, !dbg !138

; <label>:11                                      ; preds = %10
  store i64 %5, i64* @seed, align 8, !dbg !140, !tbaa !129
  ret void, !dbg !149
}

; Function Attrs: nounwind uwtable
define void @Innerproduct(i32* nocapture %result, [41 x i32]* nocapture readonly %a, [41 x i32]* nocapture readonly %b, i32 %row, i32 %column) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %result}, i64 0, metadata !29), !dbg !150
  tail call void @llvm.dbg.value(metadata !{[41 x i32]* %a}, i64 0, metadata !30), !dbg !150
  tail call void @llvm.dbg.value(metadata !{[41 x i32]* %b}, i64 0, metadata !31), !dbg !150
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !32), !dbg !150
  tail call void @llvm.dbg.value(metadata !{i32 %column}, i64 0, metadata !33), !dbg !150
  store i32 0, i32* %result, align 4, !dbg !151, !tbaa !147
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !34), !dbg !152
  %1 = sext i32 %row to i64, !dbg !152
  %2 = sext i32 %column to i64, !dbg !152
  br label %3, !dbg !152

; <label>:3                                       ; preds = %3, %0
  %4 = phi i32 [ 0, %0 ], [ %10, %3 ], !dbg !152
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %3 ]
  %5 = getelementptr inbounds [41 x i32]* %a, i64 %1, i64 %indvars.iv, !dbg !152
  %6 = load i32* %5, align 4, !dbg !152, !tbaa !147
  %7 = getelementptr inbounds [41 x i32]* %b, i64 %indvars.iv, i64 %2, !dbg !152
  %8 = load i32* %7, align 4, !dbg !152, !tbaa !147
  %9 = mul nsw i32 %8, %6, !dbg !152
  %10 = add nsw i32 %9, %4, !dbg !152
  store i32 %10, i32* %result, align 4, !dbg !152, !tbaa !147
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !152
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !152
  br i1 %exitcond, label %11, label %3, !dbg !152

; <label>:11                                      ; preds = %3
  ret void, !dbg !154
}

; Function Attrs: nounwind uwtable
define void @Intmm(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !39), !dbg !155
  store i64 74755, i64* @seed, align 8, !dbg !156, !tbaa !129
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !159), !dbg !161
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !162), !dbg !163
  br label %.preheader.i7, !dbg !163

.preheader.i7:                                    ; preds = %10, %0
  %indvars.iv5.i5 = phi i64 [ 1, %0 ], [ %indvars.iv.next6.i11, %10 ]
  %.lcssa4.i6 = phi i64 [ 74755, %0 ], [ %5, %10 ]
  br label %1, !dbg !164

; <label>:1                                       ; preds = %1, %.preheader.i7
  %indvars.iv.i8 = phi i64 [ 1, %.preheader.i7 ], [ %indvars.iv.next.i9, %1 ]
  %2 = phi i64 [ %.lcssa4.i6, %.preheader.i7 ], [ %5, %1 ], !dbg !165
  %3 = mul nsw i64 %2, 1309, !dbg !165
  %4 = add nsw i64 %3, 13849, !dbg !165
  %5 = and i64 %4, 65535, !dbg !165
  %6 = trunc i64 %5 to i32, !dbg !167
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !168), !dbg !166
  %7 = urem i32 %6, 120, !dbg !169
  %8 = add nsw i32 %7, -60, !dbg !169
  %9 = getelementptr inbounds [41 x [41 x i32]]* @ima, i64 0, i64 %indvars.iv5.i5, i64 %indvars.iv.i8, !dbg !169
  store i32 %8, i32* %9, align 4, !dbg !169, !tbaa !147
  %indvars.iv.next.i9 = add nuw nsw i64 %indvars.iv.i8, 1, !dbg !164
  %exitcond.i10 = icmp eq i64 %indvars.iv.next.i9, 41, !dbg !164
  br i1 %exitcond.i10, label %10, label %1, !dbg !164

; <label>:10                                      ; preds = %1
  %indvars.iv.next6.i11 = add nuw nsw i64 %indvars.iv5.i5, 1, !dbg !163
  %exitcond7.i12 = icmp eq i64 %indvars.iv.next6.i11, 41, !dbg !163
  br i1 %exitcond7.i12, label %Initmatrix.exit13, label %.preheader.i7, !dbg !163

Initmatrix.exit13:                                ; preds = %10
  store i64 %5, i64* @seed, align 8, !dbg !165, !tbaa !129
  tail call void @llvm.dbg.value(metadata !170, i64 0, metadata !171), !dbg !173
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !174), !dbg !175
  br label %.preheader.i, !dbg !175

.preheader.i:                                     ; preds = %20, %Initmatrix.exit13
  %indvars.iv5.i = phi i64 [ 1, %Initmatrix.exit13 ], [ %indvars.iv.next6.i, %20 ]
  %.lcssa4.i = phi i64 [ %5, %Initmatrix.exit13 ], [ %15, %20 ]
  br label %11, !dbg !176

; <label>:11                                      ; preds = %11, %.preheader.i
  %indvars.iv.i1 = phi i64 [ 1, %.preheader.i ], [ %indvars.iv.next.i2, %11 ]
  %12 = phi i64 [ %.lcssa4.i, %.preheader.i ], [ %15, %11 ], !dbg !177
  %13 = mul nsw i64 %12, 1309, !dbg !177
  %14 = add nsw i64 %13, 13849, !dbg !177
  %15 = and i64 %14, 65535, !dbg !177
  %16 = trunc i64 %15 to i32, !dbg !179
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !180), !dbg !178
  %17 = urem i32 %16, 120, !dbg !181
  %18 = add nsw i32 %17, -60, !dbg !181
  %19 = getelementptr inbounds [41 x [41 x i32]]* @imb, i64 0, i64 %indvars.iv5.i, i64 %indvars.iv.i1, !dbg !181
  store i32 %18, i32* %19, align 4, !dbg !181, !tbaa !147
  %indvars.iv.next.i2 = add nuw nsw i64 %indvars.iv.i1, 1, !dbg !176
  %exitcond.i3 = icmp eq i64 %indvars.iv.next.i2, 41, !dbg !176
  br i1 %exitcond.i3, label %20, label %11, !dbg !176

; <label>:20                                      ; preds = %11
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !175
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 41, !dbg !175
  br i1 %exitcond7.i, label %Initmatrix.exit, label %.preheader.i, !dbg !175

Initmatrix.exit:                                  ; preds = %20
  store i64 %15, i64* @seed, align 8, !dbg !177, !tbaa !129
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !40), !dbg !182
  br label %.preheader, !dbg !182

.preheader:                                       ; preds = %31, %Initmatrix.exit
  %indvars.iv21 = phi i64 [ 1, %Initmatrix.exit ], [ %indvars.iv.next22, %31 ]
  br label %21, !dbg !184

; <label>:21                                      ; preds = %Innerproduct.exit, %.preheader
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %Innerproduct.exit ]
  %22 = getelementptr inbounds [41 x [41 x i32]]* @imr, i64 0, i64 %indvars.iv21, i64 %indvars.iv, !dbg !186
  tail call void @llvm.dbg.value(metadata !{i32* %22}, i64 0, metadata !187), !dbg !188
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !189), !dbg !188
  tail call void @llvm.dbg.value(metadata !170, i64 0, metadata !190), !dbg !188
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !192), !dbg !188
  tail call void @llvm.dbg.value(metadata !191, i64 0, metadata !193), !dbg !188
  store i32 0, i32* %22, align 4, !dbg !194, !tbaa !147
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !195), !dbg !196
  br label %23, !dbg !196

; <label>:23                                      ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %30, %23 ], !dbg !196
  %indvars.iv.i = phi i64 [ 1, %21 ], [ %indvars.iv.next.i, %23 ]
  %25 = getelementptr inbounds [41 x [41 x i32]]* @ima, i64 0, i64 %indvars.iv21, i64 %indvars.iv.i, !dbg !196
  %26 = load i32* %25, align 4, !dbg !196, !tbaa !147
  %27 = getelementptr inbounds [41 x [41 x i32]]* @imb, i64 0, i64 %indvars.iv.i, i64 %indvars.iv, !dbg !196
  %28 = load i32* %27, align 4, !dbg !196, !tbaa !147
  %29 = mul nsw i32 %28, %26, !dbg !196
  %30 = add nsw i32 %29, %24, !dbg !196
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !196
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 41, !dbg !196
  br i1 %exitcond.i, label %Innerproduct.exit, label %23, !dbg !196

Innerproduct.exit:                                ; preds = %23
  store i32 %30, i32* %22, align 4, !dbg !196, !tbaa !147
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !184
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !184
  br i1 %exitcond, label %31, label %21, !dbg !184

; <label>:31                                      ; preds = %Innerproduct.exit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !182
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 41, !dbg !182
  br i1 %exitcond23, label %32, label %.preheader, !dbg !182

; <label>:32                                      ; preds = %31
  %33 = add nsw i32 %run, 1, !dbg !197
  %34 = sext i32 %33 to i64, !dbg !197
  %35 = getelementptr inbounds [41 x [41 x i32]]* @imr, i64 0, i64 %34, i64 %34, !dbg !197
  %36 = load i32* %35, align 4, !dbg !197, !tbaa !147
  %37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %36) #3, !dbg !197
  ret void, !dbg !198
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !199, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 0), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 1), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 2), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 3), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 4), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 5), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 6), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 7), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 8), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  tail call void @Intmm(i32 9), !dbg !200
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !44), !dbg !200
  ret i32 0, !dbg !202
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!125, !126}
!llvm.ident = !{!127}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !45, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"intmm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !24, metadata !35, metadata !42}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initmatrix", metadata !"Initmatrix", metadata !"", i32 127, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ([41 x i32]*)* @Initmatrix, null, null, metadata !19, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [Initmatrix]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1312, i64 32, i32 0, i32 0, metadata !11, metadata !17, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1312, align 32, offset 0] [from int]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!19 = metadata !{metadata !20, metadata !21, metadata !22, metadata !23}
!20 = metadata !{i32 786689, metadata !12, metadata !"m", metadata !5, i32 16777343, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 127]
!21 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!22 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 128]
!23 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 128, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 128]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Innerproduct", metadata !"Innerproduct", metadata !"", i32 136, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, [41 x i32]*, [41 x i32]*, i32, i32)* @Innerproduct, null, null, metadata !28, i32 136} ; [ DW_TAG_subprogram ] [line 136] [def] [Innerproduct]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{null, metadata !27, metadata !15, metadata !15, metadata !11, metadata !11}
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!28 = metadata !{metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34}
!29 = metadata !{i32 786689, metadata !24, metadata !"result", metadata !5, i32 16777352, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [result] [line 136]
!30 = metadata !{i32 786689, metadata !24, metadata !"a", metadata !5, i32 33554568, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 136]
!31 = metadata !{i32 786689, metadata !24, metadata !"b", metadata !5, i32 50331784, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 136]
!32 = metadata !{i32 786689, metadata !24, metadata !"row", metadata !5, i32 67109000, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 136]
!33 = metadata !{i32 786689, metadata !24, metadata !"column", metadata !5, i32 83886216, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [column] [line 136]
!34 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 138, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 138]
!35 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Intmm", metadata !"Intmm", metadata !"", i32 143, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Intmm, null, null, metadata !38, i32 143} ; [ DW_TAG_subprogram ] [line 143] [def] [Intmm]
!36 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{null, metadata !11}
!38 = metadata !{metadata !39, metadata !40, metadata !41}
!39 = metadata !{i32 786689, metadata !35, metadata !"run", metadata !5, i32 16777359, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 143]
!40 = metadata !{i32 786688, metadata !35, metadata !"i", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 144]
!41 = metadata !{i32 786688, metadata !35, metadata !"j", metadata !5, i32 144, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 144]
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 154, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !43, i32 155} ; [ DW_TAG_subprogram ] [line 154] [def] [scope 155] [main]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786688, metadata !42, metadata !"i", metadata !5, i32 156, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 156]
!45 = metadata !{metadata !46, metadata !48, metadata !49, metadata !50, metadata !52, metadata !56, metadata !58, metadata !65, metadata !69, metadata !77, metadata !78, metadata !79, metadata !82, metadata !83, metadata !84, metadata !86, metadata !87, metadata !88, metadata !89, metadata !93, metadata !94, metadata !98, metadata !101, metadata !102, metadata !103, metadata !107, metadata !108, metadata !109, metadata !110, metadata !118, metadata !119, metadata !123, metadata !124}
!46 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !47, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!47 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!48 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !47, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !47, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !51, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!51 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!52 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !53, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!56 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !57, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!57 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!58 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !59, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!60 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!61 = metadata !{metadata !62, metadata !63, metadata !64}
!62 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!63 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !59} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!64 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!65 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !66, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!66 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !67, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!69 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !70, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!70 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !71, metadata !75, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!71 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !72, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!72 = metadata !{metadata !73, metadata !74}
!73 = metadata !{i32 786445, metadata !1, metadata !71, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!74 = metadata !{i32 786445, metadata !1, metadata !71, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!77 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!80 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!81 = metadata !{metadata !18, metadata !18}
!82 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !47, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!86 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !85, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !66, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
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
!114 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !47} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!115 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!118 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !111, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!119 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !120, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !112, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!123 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !47, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!124 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !47, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
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
!136 = metadata !{i32 127, i32 0, metadata !12, null}
!137 = metadata !{i32 1}
!138 = metadata !{i32 129, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !12, i32 129, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!140 = metadata !{i32 120, i32 0, metadata !8, metadata !141}
!141 = metadata !{i32 131, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 130, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!143 = metadata !{i32 786443, metadata !1, metadata !139, i32 130, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!144 = metadata !{i32 130, i32 0, metadata !143, null}
!145 = metadata !{i32 121, i32 0, metadata !8, metadata !141}
!146 = metadata !{i32 132, i32 0, metadata !142, null}
!147 = metadata !{metadata !148, metadata !148, i64 0}
!148 = metadata !{metadata !"int", metadata !131, i64 0}
!149 = metadata !{i32 134, i32 0, metadata !12, null}
!150 = metadata !{i32 136, i32 0, metadata !24, null}
!151 = metadata !{i32 139, i32 0, metadata !24, null}
!152 = metadata !{i32 140, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !24, i32 140, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!154 = metadata !{i32 141, i32 0, metadata !24, null}
!155 = metadata !{i32 143, i32 0, metadata !35, null}
!156 = metadata !{i32 116, i32 0, metadata !4, metadata !157}
!157 = metadata !{i32 145, i32 0, metadata !35, null}
!158 = metadata !{null}
!159 = metadata !{i32 786689, metadata !12, metadata !"m", metadata !5, i32 16777343, metadata !15, i32 0, metadata !160} ; [ DW_TAG_arg_variable ] [m] [line 127]
!160 = metadata !{i32 146, i32 0, metadata !35, null}
!161 = metadata !{i32 127, i32 0, metadata !12, metadata !160}
!162 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, metadata !160} ; [ DW_TAG_auto_variable ] [i] [line 128]
!163 = metadata !{i32 129, i32 0, metadata !139, metadata !160}
!164 = metadata !{i32 130, i32 0, metadata !143, metadata !160}
!165 = metadata !{i32 120, i32 0, metadata !8, metadata !166}
!166 = metadata !{i32 131, i32 0, metadata !142, metadata !160}
!167 = metadata !{i32 121, i32 0, metadata !8, metadata !166}
!168 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !11, i32 0, metadata !160} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!169 = metadata !{i32 132, i32 0, metadata !142, metadata !160}
!170 = metadata !{null}
!171 = metadata !{i32 786689, metadata !12, metadata !"m", metadata !5, i32 16777343, metadata !15, i32 0, metadata !172} ; [ DW_TAG_arg_variable ] [m] [line 127]
!172 = metadata !{i32 147, i32 0, metadata !35, null}
!173 = metadata !{i32 127, i32 0, metadata !12, metadata !172}
!174 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 128, metadata !11, i32 0, metadata !172} ; [ DW_TAG_auto_variable ] [i] [line 128]
!175 = metadata !{i32 129, i32 0, metadata !139, metadata !172}
!176 = metadata !{i32 130, i32 0, metadata !143, metadata !172}
!177 = metadata !{i32 120, i32 0, metadata !8, metadata !178}
!178 = metadata !{i32 131, i32 0, metadata !142, metadata !172}
!179 = metadata !{i32 121, i32 0, metadata !8, metadata !178}
!180 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 128, metadata !11, i32 0, metadata !172} ; [ DW_TAG_auto_variable ] [temp] [line 128]
!181 = metadata !{i32 132, i32 0, metadata !142, metadata !172}
!182 = metadata !{i32 148, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !35, i32 148, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!184 = metadata !{i32 149, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !1, metadata !183, i32 149, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!186 = metadata !{i32 150, i32 0, metadata !185, null}
!187 = metadata !{i32 786689, metadata !24, metadata !"result", metadata !5, i32 16777352, metadata !27, i32 0, metadata !186} ; [ DW_TAG_arg_variable ] [result] [line 136]
!188 = metadata !{i32 136, i32 0, metadata !24, metadata !186}
!189 = metadata !{i32 786689, metadata !24, metadata !"a", metadata !5, i32 33554568, metadata !15, i32 0, metadata !186} ; [ DW_TAG_arg_variable ] [a] [line 136]
!190 = metadata !{i32 786689, metadata !24, metadata !"b", metadata !5, i32 50331784, metadata !15, i32 0, metadata !186} ; [ DW_TAG_arg_variable ] [b] [line 136]
!191 = metadata !{i32 undef}
!192 = metadata !{i32 786689, metadata !24, metadata !"row", metadata !5, i32 67109000, metadata !11, i32 0, metadata !186} ; [ DW_TAG_arg_variable ] [row] [line 136]
!193 = metadata !{i32 786689, metadata !24, metadata !"column", metadata !5, i32 83886216, metadata !11, i32 0, metadata !186} ; [ DW_TAG_arg_variable ] [column] [line 136]
!194 = metadata !{i32 139, i32 0, metadata !24, metadata !186}
!195 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 138, metadata !11, i32 0, metadata !186} ; [ DW_TAG_auto_variable ] [i] [line 138]
!196 = metadata !{i32 140, i32 0, metadata !153, metadata !186}
!197 = metadata !{i32 151, i32 0, metadata !35, null}
!198 = metadata !{i32 152, i32 0, metadata !35, null}
!199 = metadata !{i32 0}
!200 = metadata !{i32 157, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !1, metadata !42, i32 157, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/intmm.c]
!202 = metadata !{i32 158, i32 0, metadata !42, null}
