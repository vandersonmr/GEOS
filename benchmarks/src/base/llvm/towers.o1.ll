; ModuleID = 'towers.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.element = type { i32, i32 }
%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = common global [4 x i32] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = common global i32 0, align 4
@.str4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
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
@str = private unnamed_addr constant [18 x i8] c" Error in Towers.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !149, !tbaa !150
  ret void, !dbg !154
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !155, !tbaa !150
  %2 = mul nsw i64 %1, 1309, !dbg !155
  %3 = add nsw i64 %2, 13849, !dbg !155
  %4 = and i64 %3, 65535, !dbg !155
  store i64 %4, i64* @seed, align 8, !dbg !155, !tbaa !150
  %5 = trunc i64 %4 to i32, !dbg !156
  ret i32 %5, !dbg !156
}

; Function Attrs: nounwind uwtable
define void @Error(i8* %emsg) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %emsg}, i64 0, metadata !18), !dbg !157
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i8* %emsg) #3, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define void @Makenull(i32 %s) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !23), !dbg !160
  %1 = sext i32 %s to i64, !dbg !161
  %2 = getelementptr inbounds [4 x i32]* @stack, i64 0, i64 %1, !dbg !161
  store i32 0, i32* %2, align 4, !dbg !161, !tbaa !162
  ret void, !dbg !164
}

; Function Attrs: nounwind uwtable
define i32 @Getelement() #0 {
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !26), !dbg !166
  %1 = load i32* @freelist, align 4, !dbg !167, !tbaa !162
  %2 = icmp sgt i32 %1, 0, !dbg !167
  br i1 %2, label %3, label %7, !dbg !167

; <label>:3                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !26), !dbg !169
  %4 = sext i32 %1 to i64, !dbg !171
  %5 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %4, i32 1, !dbg !171
  %6 = load i32* %5, align 4, !dbg !171, !tbaa !172
  store i32 %6, i32* @freelist, align 4, !dbg !171, !tbaa !162
  br label %8, !dbg !174

; <label>:7                                       ; preds = %0
  tail call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str1, i64 0, i64 0)), !dbg !175
  br label %8

; <label>:8                                       ; preds = %7, %3
  %temp.0 = phi i32 [ %1, %3 ], [ 0, %7 ]
  ret i32 %temp.0, !dbg !176
}

; Function Attrs: nounwind uwtable
define void @Push(i32 %i, i32 %s) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !31), !dbg !177
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !32), !dbg !177
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !33), !dbg !178
  %1 = sext i32 %s to i64, !dbg !179
  %2 = getelementptr inbounds [4 x i32]* @stack, i64 0, i64 %1, !dbg !179
  %3 = load i32* %2, align 4, !dbg !179, !tbaa !162
  %4 = icmp sgt i32 %3, 0, !dbg !179
  br i1 %4, label %5, label %10, !dbg !179

; <label>:5                                       ; preds = %0
  %6 = sext i32 %3 to i64, !dbg !181
  %7 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %6, i32 0, !dbg !181
  %8 = load i32* %7, align 8, !dbg !181, !tbaa !183
  %9 = icmp sgt i32 %8, %i, !dbg !181
  br i1 %9, label %10, label %.critedge, !dbg !181

.critedge:                                        ; preds = %5
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !33), !dbg !185
  tail call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str2, i64 0, i64 0)), !dbg !187
  br label %16

; <label>:10                                      ; preds = %0, %5
  %11 = tail call i32 @Getelement(), !dbg !188
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !34), !dbg !188
  %12 = load i32* %2, align 4, !dbg !191, !tbaa !162
  %13 = sext i32 %11 to i64, !dbg !191
  %14 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %13, i32 1, !dbg !191
  store i32 %12, i32* %14, align 4, !dbg !191, !tbaa !172
  store i32 %11, i32* %2, align 4, !dbg !192, !tbaa !162
  %15 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %13, i32 0, !dbg !193
  store i32 %i, i32* %15, align 8, !dbg !193, !tbaa !183
  br label %16, !dbg !194

; <label>:16                                      ; preds = %.critedge, %10
  ret void, !dbg !195
}

; Function Attrs: nounwind uwtable
define void @Init(i32 %s, i32 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !37), !dbg !196
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !38), !dbg !196
  tail call void @Makenull(i32 %s), !dbg !197
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !39), !dbg !198
  %1 = icmp sgt i32 %n, 0, !dbg !198
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !198

.lr.ph:                                           ; preds = %0, %.lr.ph
  %discctr.01 = phi i32 [ %2, %.lr.ph ], [ %n, %0 ]
  tail call void @Push(i32 %discctr.01, i32 %s), !dbg !200
  %2 = add nsw i32 %discctr.01, -1, !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !39), !dbg !198
  %3 = icmp sgt i32 %2, 0, !dbg !198
  br i1 %3, label %.lr.ph, label %._crit_edge, !dbg !198

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !201
}

; Function Attrs: nounwind uwtable
define i32 @Pop(i32 %s) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !44), !dbg !202
  %1 = sext i32 %s to i64, !dbg !203
  %2 = getelementptr inbounds [4 x i32]* @stack, i64 0, i64 %1, !dbg !203
  %3 = load i32* %2, align 4, !dbg !203, !tbaa !162
  %4 = icmp sgt i32 %3, 0, !dbg !203
  br i1 %4, label %5, label %13, !dbg !203

; <label>:5                                       ; preds = %0
  %6 = sext i32 %3 to i64, !dbg !205
  %7 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %6, i32 0, !dbg !205
  %8 = load i32* %7, align 8, !dbg !205, !tbaa !183
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !46), !dbg !205
  %9 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %6, i32 1, !dbg !207
  %10 = load i32* %9, align 4, !dbg !207, !tbaa !172
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !45), !dbg !207
  %11 = load i32* @freelist, align 4, !dbg !208, !tbaa !162
  store i32 %11, i32* %9, align 4, !dbg !208, !tbaa !172
  %12 = load i32* %2, align 4, !dbg !209, !tbaa !162
  store i32 %12, i32* @freelist, align 4, !dbg !209, !tbaa !162
  store i32 %10, i32* %2, align 4, !dbg !210, !tbaa !162
  br label %14, !dbg !211

; <label>:13                                      ; preds = %0
  tail call void @Error(i8* getelementptr inbounds ([16 x i8]* @.str3, i64 0, i64 0)), !dbg !212
  br label %14, !dbg !213

; <label>:14                                      ; preds = %13, %5
  %.0 = phi i32 [ %8, %5 ], [ 0, %13 ]
  ret i32 %.0, !dbg !214
}

; Function Attrs: nounwind uwtable
define void @Move(i32 %s1, i32 %s2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %s1}, i64 0, metadata !49), !dbg !215
  tail call void @llvm.dbg.value(metadata !{i32 %s2}, i64 0, metadata !50), !dbg !215
  %1 = tail call i32 @Pop(i32 %s1), !dbg !216
  tail call void @Push(i32 %1, i32 %s2), !dbg !216
  %2 = load i32* @movesdone, align 4, !dbg !217, !tbaa !162
  %3 = add nsw i32 %2, 1, !dbg !217
  store i32 %3, i32* @movesdone, align 4, !dbg !217, !tbaa !162
  ret void, !dbg !218
}

; Function Attrs: nounwind uwtable
define void @tower(i32 %i, i32 %j, i32 %k) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i.tr.lcssa}, i64 0, metadata !55), !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !56), !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %k}, i64 0, metadata !57), !dbg !219
  %1 = icmp eq i32 %k, 1, !dbg !220
  br i1 %1, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !220

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %i.tr.lcssa = phi i32 [ %i, %0 ], [ %3, %tailrecurse ]
  tail call void @Move(i32 %i.tr.lcssa, i32 %j), !dbg !220
  ret void, !dbg !222

tailrecurse:                                      ; preds = %0, %tailrecurse
  %k.tr2 = phi i32 [ %4, %tailrecurse ], [ %k, %0 ]
  %i.tr1 = phi i32 [ %3, %tailrecurse ], [ %i, %0 ]
  %2 = sub nsw i32 6, %i.tr1, !dbg !223
  %3 = sub i32 %2, %j, !dbg !223
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !58), !dbg !223
  %4 = add nsw i32 %k.tr2, -1, !dbg !225
  tail call void @tower(i32 %i.tr1, i32 %3, i32 %4), !dbg !225
  tail call void @Move(i32 %i.tr1, i32 %j), !dbg !226
  tail call void @llvm.dbg.value(metadata !{i32 %i.tr.lcssa}, i64 0, metadata !55), !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !56), !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %k.tr2}, i64 0, metadata !57), !dbg !219
  %5 = icmp eq i32 %4, 1, !dbg !220
  br i1 %5, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !220
}

; Function Attrs: nounwind uwtable
define void @Towers() #0 {
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !61), !dbg !227
  br label %1, !dbg !227

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %1 ]
  %2 = add nsw i64 %indvars.iv, 4294967295, !dbg !227
  %3 = getelementptr inbounds [19 x %struct.element]* @cellspace, i64 0, i64 %indvars.iv, i32 1, !dbg !227
  %4 = trunc i64 %2 to i32, !dbg !227
  store i32 %4, i32* %3, align 4, !dbg !227, !tbaa !172
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !227
  %exitcond = icmp eq i64 %indvars.iv.next, 19, !dbg !227
  br i1 %exitcond, label %5, label %1, !dbg !227

; <label>:5                                       ; preds = %1
  store i32 18, i32* @freelist, align 4, !dbg !229, !tbaa !162
  tail call void @Init(i32 1, i32 14), !dbg !230
  tail call void @Makenull(i32 2), !dbg !231
  tail call void @Makenull(i32 3), !dbg !232
  store i32 0, i32* @movesdone, align 4, !dbg !233, !tbaa !162
  tail call void @tower(i32 1, i32 2, i32 14), !dbg !234
  %6 = load i32* @movesdone, align 4, !dbg !235, !tbaa !162
  %7 = icmp eq i32 %6, 16383, !dbg !235
  br i1 %7, label %9, label %8, !dbg !235

; <label>:8                                       ; preds = %5
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !235
  br label %9, !dbg !235

; <label>:9                                       ; preds = %5, %8
  %10 = load i32* @movesdone, align 4, !dbg !237, !tbaa !162
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i64 0, i64 0), i32 %10) #3, !dbg !237
  ret void, !dbg !238
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !64), !dbg !239
  br label %1, !dbg !239

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Towers(), !dbg !239
  %2 = add nsw i32 %i.01, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !64), !dbg !239
  %exitcond = icmp eq i32 %2, 100, !dbg !239
  br i1 %exitcond, label %3, label %1, !dbg !239

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !241
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!146, !147}
!llvm.ident = !{!148}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !65, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c] [DW_LANG_C99]
!1 = metadata !{metadata !"towers.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !19, metadata !24, metadata !27, metadata !35, metadata !40, metadata !47, metadata !51, metadata !59, metadata !62}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Error", metadata !"Error", metadata !"", i32 127, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @Error, null, null, metadata !17, i32 127} ; [ DW_TAG_subprogram ] [line 127] [def] [Error]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786689, metadata !12, metadata !"emsg", metadata !5, i32 16777343, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [emsg] [line 127]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Makenull", metadata !"Makenull", metadata !"", i32 131, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Makenull, null, null, metadata !22, i32 131} ; [ DW_TAG_subprogram ] [line 131] [def] [Makenull]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{null, metadata !11}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786689, metadata !19, metadata !"s", metadata !5, i32 16777347, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 131]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Getelement", metadata !"Getelement", metadata !"", i32 135, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Getelement, null, null, metadata !25, i32 135} ; [ DW_TAG_subprogram ] [line 135] [def] [Getelement]
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786688, metadata !24, metadata !"temp", metadata !5, i32 136, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 136]
!27 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Push", metadata !"Push", metadata !"", i32 146, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32)* @Push, null, null, metadata !30, i32 146} ; [ DW_TAG_subprogram ] [line 146] [def] [Push]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !11, metadata !11}
!30 = metadata !{metadata !31, metadata !32, metadata !33, metadata !34}
!31 = metadata !{i32 786689, metadata !27, metadata !"i", metadata !5, i32 16777362, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 146]
!32 = metadata !{i32 786689, metadata !27, metadata !"s", metadata !5, i32 33554578, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 146]
!33 = metadata !{i32 786688, metadata !27, metadata !"errorfound", metadata !5, i32 147, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [errorfound] [line 147]
!34 = metadata !{i32 786688, metadata !27, metadata !"localel", metadata !5, i32 147, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [localel] [line 147]
!35 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Init", metadata !"Init", metadata !"", i32 162, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32)* @Init, null, null, metadata !36, i32 162} ; [ DW_TAG_subprogram ] [line 162] [def] [Init]
!36 = metadata !{metadata !37, metadata !38, metadata !39}
!37 = metadata !{i32 786689, metadata !35, metadata !"s", metadata !5, i32 16777378, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 162]
!38 = metadata !{i32 786689, metadata !35, metadata !"n", metadata !5, i32 33554594, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 162]
!39 = metadata !{i32 786688, metadata !35, metadata !"discctr", metadata !5, i32 163, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [discctr] [line 163]
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Pop", metadata !"Pop", metadata !"", i32 169, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @Pop, null, null, metadata !43, i32 169} ; [ DW_TAG_subprogram ] [line 169] [def] [Pop]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !11, metadata !11}
!43 = metadata !{metadata !44, metadata !45, metadata !46}
!44 = metadata !{i32 786689, metadata !40, metadata !"s", metadata !5, i32 16777385, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 169]
!45 = metadata !{i32 786688, metadata !40, metadata !"temp", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 170]
!46 = metadata !{i32 786688, metadata !40, metadata !"temp1", metadata !5, i32 170, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp1] [line 170]
!47 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Move", metadata !"Move", metadata !"", i32 184, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32)* @Move, null, null, metadata !48, i32 184} ; [ DW_TAG_subprogram ] [line 184] [def] [Move]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786689, metadata !47, metadata !"s1", metadata !5, i32 16777400, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s1] [line 184]
!50 = metadata !{i32 786689, metadata !47, metadata !"s2", metadata !5, i32 33554616, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s2] [line 184]
!51 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"tower", metadata !"tower", metadata !"", i32 189, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32)* @tower, null, null, metadata !54, i32 189} ; [ DW_TAG_subprogram ] [line 189] [def] [tower]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !11, metadata !11, metadata !11}
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58}
!55 = metadata !{i32 786689, metadata !51, metadata !"i", metadata !5, i32 16777405, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 189]
!56 = metadata !{i32 786689, metadata !51, metadata !"j", metadata !5, i32 33554621, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 189]
!57 = metadata !{i32 786689, metadata !51, metadata !"k", metadata !5, i32 50331837, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [k] [line 189]
!58 = metadata !{i32 786688, metadata !51, metadata !"other", metadata !5, i32 190, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [other] [line 190]
!59 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Towers", metadata !"Towers", metadata !"", i32 200, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Towers, null, null, metadata !60, i32 200} ; [ DW_TAG_subprogram ] [line 200] [def] [Towers]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786688, metadata !59, metadata !"i", metadata !5, i32 201, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 201]
!62 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 213, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !63, i32 214} ; [ DW_TAG_subprogram ] [line 213] [def] [scope 214] [main]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786688, metadata !62, metadata !"i", metadata !5, i32 215, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 215]
!65 = metadata !{metadata !66, metadata !68, metadata !69, metadata !70, metadata !72, metadata !76, metadata !78, metadata !85, metadata !89, metadata !97, metadata !98, metadata !99, metadata !103, metadata !104, metadata !105, metadata !107, metadata !108, metadata !109, metadata !110, metadata !114, metadata !115, metadata !119, metadata !122, metadata !123, metadata !124, metadata !128, metadata !129, metadata !130, metadata !131, metadata !139, metadata !140, metadata !144, metadata !145}
!66 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !67, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!67 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!68 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !67, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !67, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!70 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !71, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!71 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!72 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !73, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!73 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !74, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!76 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !77, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!77 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!78 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !79, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!79 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!80 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !81, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!81 = metadata !{metadata !82, metadata !83, metadata !84}
!82 = metadata !{i32 786445, metadata !1, metadata !80, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!83 = metadata !{i32 786445, metadata !1, metadata !80, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !79} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!84 = metadata !{i32 786445, metadata !1, metadata !80, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!85 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !86, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!86 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !87, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!89 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !90, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!90 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !91, metadata !95, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!91 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !92, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!92 = metadata !{metadata !93, metadata !94}
!93 = metadata !{i32 786445, metadata !1, metadata !91, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!94 = metadata !{i32 786445, metadata !1, metadata !91, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!97 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!98 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !100, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!100 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !101, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!101 = metadata !{metadata !102, metadata !102}
!102 = metadata !{i32 786465, i64 0, i64 41}      ; [ DW_TAG_subrange_type ] [0, 40]
!103 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !100, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!104 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !100, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!105 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !106, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!106 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !67, metadata !101, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!107 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !106, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!108 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !106, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!109 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !86, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!110 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !111, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!111 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !112, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!112 = metadata !{metadata !113}
!113 = metadata !{i32 786465, i64 0, i64 13}      ; [ DW_TAG_subrange_type ] [0, 12]
!114 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !111, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!115 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !116, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!116 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !117, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!117 = metadata !{metadata !118}
!118 = metadata !{i32 786465, i64 0, i64 512}     ; [ DW_TAG_subrange_type ] [0, 511]
!119 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !120, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!121 = metadata !{metadata !113, metadata !118}
!122 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!123 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!124 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !125, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!125 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !126, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!126 = metadata !{metadata !127}
!127 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!128 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!129 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!130 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!131 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !132, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!132 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !133, metadata !137, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!133 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !134, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!134 = metadata !{metadata !135, metadata !136}
!135 = metadata !{i32 786445, metadata !1, metadata !133, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!136 = metadata !{i32 786445, metadata !1, metadata !133, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !67} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!137 = metadata !{metadata !138}
!138 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!139 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !132, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!140 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !141, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!141 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !133, metadata !142, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!144 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !67, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!145 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !67, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!146 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!147 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!148 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!149 = metadata !{i32 116, i32 0, metadata !4, null}
!150 = metadata !{metadata !151, metadata !151, i64 0}
!151 = metadata !{metadata !"long", metadata !152, i64 0}
!152 = metadata !{metadata !"omnipotent char", metadata !153, i64 0}
!153 = metadata !{metadata !"Simple C/C++ TBAA"}
!154 = metadata !{i32 117, i32 0, metadata !4, null}
!155 = metadata !{i32 120, i32 0, metadata !8, null}
!156 = metadata !{i32 121, i32 0, metadata !8, null}
!157 = metadata !{i32 127, i32 0, metadata !12, null}
!158 = metadata !{i32 128, i32 0, metadata !12, null}
!159 = metadata !{i32 129, i32 0, metadata !12, null}
!160 = metadata !{i32 131, i32 0, metadata !19, null}
!161 = metadata !{i32 132, i32 0, metadata !19, null}
!162 = metadata !{metadata !163, metadata !163, i64 0}
!163 = metadata !{metadata !"int", metadata !152, i64 0}
!164 = metadata !{i32 133, i32 0, metadata !19, null}
!165 = metadata !{i32 0}
!166 = metadata !{i32 136, i32 0, metadata !24, null}
!167 = metadata !{i32 137, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !24, i32 137, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!169 = metadata !{i32 138, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !168, i32 137, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!171 = metadata !{i32 139, i32 0, metadata !170, null}
!172 = metadata !{metadata !173, metadata !163, i64 4}
!173 = metadata !{metadata !"element", metadata !163, i64 0, metadata !163, i64 4}
!174 = metadata !{i32 140, i32 0, metadata !170, null}
!175 = metadata !{i32 142, i32 0, metadata !168, null}
!176 = metadata !{i32 143, i32 0, metadata !24, null}
!177 = metadata !{i32 146, i32 0, metadata !27, null}
!178 = metadata !{i32 148, i32 0, metadata !27, null}
!179 = metadata !{i32 149, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !27, i32 149, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!181 = metadata !{i32 150, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !1, metadata !180, i32 150, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!183 = metadata !{metadata !173, metadata !163, i64 0}
!184 = metadata !{i32 1}
!185 = metadata !{i32 151, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !182, i32 150, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!187 = metadata !{i32 152, i32 0, metadata !186, null}
!188 = metadata !{i32 155, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !190, i32 154, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!190 = metadata !{i32 786443, metadata !1, metadata !27, i32 154, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!191 = metadata !{i32 156, i32 0, metadata !189, null}
!192 = metadata !{i32 157, i32 0, metadata !189, null}
!193 = metadata !{i32 158, i32 0, metadata !189, null}
!194 = metadata !{i32 159, i32 0, metadata !189, null}
!195 = metadata !{i32 160, i32 0, metadata !27, null}
!196 = metadata !{i32 162, i32 0, metadata !35, null}
!197 = metadata !{i32 164, i32 0, metadata !35, null}
!198 = metadata !{i32 165, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !35, i32 165, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!200 = metadata !{i32 166, i32 0, metadata !199, null}
!201 = metadata !{i32 167, i32 0, metadata !35, null}
!202 = metadata !{i32 169, i32 0, metadata !40, null}
!203 = metadata !{i32 171, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !40, i32 171, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!205 = metadata !{i32 172, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !1, metadata !204, i32 171, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!207 = metadata !{i32 173, i32 0, metadata !206, null}
!208 = metadata !{i32 174, i32 0, metadata !206, null}
!209 = metadata !{i32 175, i32 0, metadata !206, null}
!210 = metadata !{i32 176, i32 0, metadata !206, null}
!211 = metadata !{i32 177, i32 0, metadata !206, null}
!212 = metadata !{i32 180, i32 0, metadata !204, null}
!213 = metadata !{i32 181, i32 0, metadata !40, null}
!214 = metadata !{i32 182, i32 0, metadata !40, null}
!215 = metadata !{i32 184, i32 0, metadata !47, null}
!216 = metadata !{i32 185, i32 0, metadata !47, null}
!217 = metadata !{i32 186, i32 0, metadata !47, null}
!218 = metadata !{i32 187, i32 0, metadata !47, null}
!219 = metadata !{i32 189, i32 0, metadata !51, null}
!220 = metadata !{i32 191, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !51, i32 191, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!222 = metadata !{i32 198, i32 0, metadata !51, null}
!223 = metadata !{i32 193, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !221, i32 192, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!225 = metadata !{i32 194, i32 0, metadata !224, null}
!226 = metadata !{i32 195, i32 0, metadata !224, null}
!227 = metadata !{i32 202, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !59, i32 202, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!229 = metadata !{i32 203, i32 0, metadata !59, null}
!230 = metadata !{i32 204, i32 0, metadata !59, null}
!231 = metadata !{i32 205, i32 0, metadata !59, null}
!232 = metadata !{i32 206, i32 0, metadata !59, null}
!233 = metadata !{i32 207, i32 0, metadata !59, null}
!234 = metadata !{i32 208, i32 0, metadata !59, null}
!235 = metadata !{i32 209, i32 0, metadata !236, null}
!236 = metadata !{i32 786443, metadata !1, metadata !59, i32 209, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!237 = metadata !{i32 210, i32 0, metadata !59, null}
!238 = metadata !{i32 211, i32 0, metadata !59, null}
!239 = metadata !{i32 216, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !62, i32 216, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/towers.c]
!241 = metadata !{i32 217, i32 0, metadata !62, null}
