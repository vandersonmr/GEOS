; ModuleID = 'perm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
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
@str = private unnamed_addr constant [16 x i8] c" Error in Perm.\00"

; Function Attrs: nounwind optsize uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !119, !tbaa !120
  ret void, !dbg !124
}

; Function Attrs: nounwind optsize uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !125, !tbaa !120
  %2 = mul nsw i64 %1, 1309, !dbg !125
  %3 = add nsw i64 %2, 13849, !dbg !125
  %4 = and i64 %3, 65535, !dbg !125
  store i64 %4, i64* @seed, align 8, !dbg !125, !tbaa !120
  %5 = trunc i64 %4 to i32, !dbg !126
  ret i32 %5, !dbg !126
}

; Function Attrs: nounwind optsize uwtable
define void @Swap(i32* nocapture %a, i32* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !17), !dbg !127
  tail call void @llvm.dbg.value(metadata !{i32* %b}, i64 0, metadata !18), !dbg !127
  %1 = load i32* %a, align 4, !dbg !128, !tbaa !129
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !19), !dbg !128
  %2 = load i32* %b, align 4, !dbg !128, !tbaa !129
  store i32 %2, i32* %a, align 4, !dbg !128, !tbaa !129
  store i32 %1, i32* %b, align 4, !dbg !128, !tbaa !129
  ret void, !dbg !131
}

; Function Attrs: nounwind optsize uwtable
define void @Initialize() #0 {
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !22), !dbg !133
  br label %1, !dbg !133

; <label>:1                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %1 ]
  %2 = add nsw i64 %indvars.iv, 4294967295, !dbg !135
  %3 = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %indvars.iv, !dbg !135
  %4 = trunc i64 %2 to i32, !dbg !135
  store i32 %4, i32* %3, align 4, !dbg !135, !tbaa !129
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !133
  %exitcond = icmp eq i64 %indvars.iv.next, 8, !dbg !133
  br i1 %exitcond, label %5, label %1, !dbg !133

; <label>:5                                       ; preds = %1
  ret void, !dbg !137
}

; Function Attrs: nounwind optsize uwtable
define void @Permute(i32 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !27), !dbg !138
  %1 = load i32* @pctr, align 4, !dbg !139, !tbaa !129
  %2 = add i32 %1, 1, !dbg !139
  store i32 %2, i32* @pctr, align 4, !dbg !139, !tbaa !129
  %3 = icmp eq i32 %n, 1, !dbg !140
  br i1 %3, label %.loopexit, label %4, !dbg !140

; <label>:4                                       ; preds = %0
  %5 = add i32 %n, -1, !dbg !142
  tail call void @Permute(i32 %5) #4, !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !28), !dbg !144
  %6 = icmp sgt i32 %5, 0, !dbg !144
  br i1 %6, label %.lr.ph, label %.loopexit, !dbg !144

.lr.ph:                                           ; preds = %4
  %7 = sext i32 %n to i64, !dbg !146
  %8 = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %7, !dbg !146
  %9 = sext i32 %5 to i64
  br label %10, !dbg !144

; <label>:10                                      ; preds = %.lr.ph, %10
  %indvars.iv = phi i64 [ %9, %.lr.ph ], [ %indvars.iv.next, %10 ]
  %k.01 = phi i32 [ %5, %.lr.ph ], [ %16, %10 ]
  %11 = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %indvars.iv, !dbg !146
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !148), !dbg !149
  tail call void @llvm.dbg.value(metadata !{i32* %11}, i64 0, metadata !150), !dbg !149
  %12 = load i32* %8, align 4, !dbg !151, !tbaa !129
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !152), !dbg !151
  %13 = load i32* %11, align 4, !dbg !151, !tbaa !129
  store i32 %13, i32* %8, align 4, !dbg !151, !tbaa !129
  store i32 %12, i32* %11, align 4, !dbg !151, !tbaa !129
  tail call void @Permute(i32 %5) #4, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i32* %8}, i64 0, metadata !154), !dbg !156
  tail call void @llvm.dbg.value(metadata !{i32* %11}, i64 0, metadata !157), !dbg !156
  %14 = load i32* %8, align 4, !dbg !158, !tbaa !129
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !159), !dbg !158
  %15 = load i32* %11, align 4, !dbg !158, !tbaa !129
  store i32 %15, i32* %8, align 4, !dbg !158, !tbaa !129
  store i32 %14, i32* %11, align 4, !dbg !158, !tbaa !129
  %16 = add nsw i32 %k.01, -1, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !28), !dbg !144
  %17 = icmp sgt i32 %16, 0, !dbg !144
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !144
  br i1 %17, label %10, label %.loopexit, !dbg !144

.loopexit:                                        ; preds = %10, %4, %0
  ret void, !dbg !160
}

; Function Attrs: nounwind optsize uwtable
define void @Perm() #0 {
  store i32 0, i32* @pctr, align 4, !dbg !161, !tbaa !129
  tail call void @llvm.dbg.value(metadata !132, i64 0, metadata !31), !dbg !162
  br label %.preheader, !dbg !162

.preheader:                                       ; preds = %Initialize.exit, %0
  %i.01 = phi i32 [ 1, %0 ], [ %5, %Initialize.exit ]
  br label %1, !dbg !164

; <label>:1                                       ; preds = %.preheader, %1
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %1 ], [ 1, %.preheader ]
  %2 = add nsw i64 %indvars.iv.i, 4294967295, !dbg !164
  %3 = getelementptr inbounds [11 x i32]* @permarray, i64 0, i64 %indvars.iv.i, !dbg !164
  %4 = trunc i64 %2 to i32, !dbg !164
  store i32 %4, i32* %3, align 4, !dbg !164, !tbaa !129
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !167
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 8, !dbg !167
  br i1 %exitcond.i, label %Initialize.exit, label %1, !dbg !167

Initialize.exit:                                  ; preds = %1
  tail call void @Permute(i32 7) #4, !dbg !168
  %5 = add nsw i32 %i.01, 1, !dbg !162
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !31), !dbg !162
  %exitcond = icmp eq i32 %5, 6, !dbg !162
  br i1 %exitcond, label %6, label %.preheader, !dbg !162

; <label>:6                                       ; preds = %Initialize.exit
  %7 = load i32* @pctr, align 4, !dbg !169, !tbaa !129
  %8 = icmp eq i32 %7, 43300, !dbg !169
  br i1 %8, label %10, label %9, !dbg !169

; <label>:9                                       ; preds = %6
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8]* @str, i64 0, i64 0)), !dbg !171
  %.pre = load i32* @pctr, align 4, !dbg !172, !tbaa !129
  br label %10, !dbg !171

; <label>:10                                      ; preds = %6, %9
  %11 = phi i32 [ 43300, %6 ], [ %.pre, %9 ]
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %11) #5, !dbg !172
  ret void, !dbg !173
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !174, i64 0, metadata !34), !dbg !175
  br label %1, !dbg !175

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Perm() #4, !dbg !175
  %2 = add nsw i32 %i.01, 1, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !34), !dbg !175
  %exitcond = icmp eq i32 %2, 100, !dbg !175
  br i1 %exitcond, label %3, label %1, !dbg !175

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !177
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { optsize }
attributes #5 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!116, !117}
!llvm.ident = !{!118}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !35, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"perm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !20, metadata !23, metadata !29, metadata !32}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 115, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 115} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 119, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 119} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Swap", metadata !"Swap", metadata !"", i32 126, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*)* @Swap, null, null, metadata !16, i32 126} ; [ DW_TAG_subprogram ] [line 126] [def] [Swap]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = metadata !{metadata !17, metadata !18, metadata !19}
!17 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 16777342, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 126]
!18 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 33554558, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 126]
!19 = metadata !{i32 786688, metadata !12, metadata !"t", metadata !5, i32 127, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 127]
!20 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initialize", metadata !"Initialize", metadata !"", i32 131, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initialize, null, null, metadata !21, i32 131} ; [ DW_TAG_subprogram ] [line 131] [def] [Initialize]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786688, metadata !20, metadata !"i", metadata !5, i32 132, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 132]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Permute", metadata !"Permute", metadata !"", i32 138, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Permute, null, null, metadata !26, i32 138} ; [ DW_TAG_subprogram ] [line 138] [def] [Permute]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !11}
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786689, metadata !23, metadata !"n", metadata !5, i32 16777354, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 138]
!28 = metadata !{i32 786688, metadata !23, metadata !"k", metadata !5, i32 139, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 139]
!29 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Perm", metadata !"Perm", metadata !"", i32 151, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Perm, null, null, metadata !30, i32 151} ; [ DW_TAG_subprogram ] [line 151] [def] [Perm]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786688, metadata !29, metadata !"i", metadata !5, i32 152, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 152]
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 163, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !33, i32 164} ; [ DW_TAG_subprogram ] [line 163] [def] [scope 164] [main]
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !5, i32 165, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 165]
!35 = metadata !{metadata !36, metadata !38, metadata !39, metadata !40, metadata !42, metadata !46, metadata !48, metadata !55, metadata !59, metadata !67, metadata !68, metadata !69, metadata !73, metadata !74, metadata !75, metadata !77, metadata !78, metadata !79, metadata !80, metadata !84, metadata !85, metadata !89, metadata !92, metadata !93, metadata !94, metadata !98, metadata !99, metadata !100, metadata !101, metadata !109, metadata !110, metadata !114, metadata !115}
!36 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 81, metadata !37, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!37 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!38 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 81, metadata !37, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!39 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 81, metadata !37, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!40 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 84, metadata !41, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!41 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!42 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 87, metadata !43, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!43 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !44, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!46 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 89, metadata !47, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!47 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!48 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 92, metadata !49, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!50 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!51 = metadata !{metadata !52, metadata !53, metadata !54}
!52 = metadata !{i32 786445, metadata !1, metadata !50, metadata !"left", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!53 = metadata !{i32 786445, metadata !1, metadata !50, metadata !"right", i32 46, i64 64, i64 64, i64 64, i32 0, metadata !49} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!54 = metadata !{i32 786445, metadata !1, metadata !50, metadata !"val", i32 47, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!55 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 95, metadata !56, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!56 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !57, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!59 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 96, metadata !60, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !61, metadata !65, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!61 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 54, i64 64, i64 32, i32 0, i32 0, null, metadata !62, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!62 = metadata !{metadata !63, metadata !64}
!63 = metadata !{i32 786445, metadata !1, metadata !61, metadata !"discsize", i32 55, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!64 = metadata !{i32 786445, metadata !1, metadata !61, metadata !"next", i32 56, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!65 = metadata !{metadata !66}
!66 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!67 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!68 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 97, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!69 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 101, metadata !70, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!70 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !71, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!71 = metadata !{metadata !72, metadata !72}
!72 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!73 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 101, metadata !70, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!74 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 101, metadata !70, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!75 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 102, metadata !76, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!76 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !37, metadata !71, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!77 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 102, metadata !76, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 102, metadata !76, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 105, metadata !56, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!80 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 105, metadata !81, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!81 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !82, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!84 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 105, metadata !81, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!85 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 106, metadata !86, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!86 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !87, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!89 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 106, metadata !90, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!90 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !91, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!91 = metadata !{metadata !83, metadata !88}
!92 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!93 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 106, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 109, metadata !95, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 5001}     ; [ DW_TAG_subrange_type ] [0, 5000]
!98 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!99 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!100 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 109, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!101 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 112, metadata !102, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!102 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !103, metadata !107, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!103 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 75, i64 64, i64 32, i32 0, i32 0, null, metadata !104, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!104 = metadata !{metadata !105, metadata !106}
!105 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"rp", i32 75, i64 32, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!106 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"ip", i32 75, i64 32, i64 32, i64 32, i32 0, metadata !37} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!107 = metadata !{metadata !108}
!108 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!109 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 112, metadata !102, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!110 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 112, metadata !111, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!111 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !103, metadata !112, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!112 = metadata !{metadata !113}
!113 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!114 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 113, metadata !37, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!115 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 113, metadata !37, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!116 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!117 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!118 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!119 = metadata !{i32 116, i32 0, metadata !4, null}
!120 = metadata !{metadata !121, metadata !121, i64 0}
!121 = metadata !{metadata !"long", metadata !122, i64 0}
!122 = metadata !{metadata !"omnipotent char", metadata !123, i64 0}
!123 = metadata !{metadata !"Simple C/C++ TBAA"}
!124 = metadata !{i32 117, i32 0, metadata !4, null}
!125 = metadata !{i32 120, i32 0, metadata !8, null}
!126 = metadata !{i32 121, i32 0, metadata !8, null}
!127 = metadata !{i32 126, i32 0, metadata !12, null}
!128 = metadata !{i32 128, i32 0, metadata !12, null}
!129 = metadata !{metadata !130, metadata !130, i64 0}
!130 = metadata !{metadata !"int", metadata !122, i64 0}
!131 = metadata !{i32 129, i32 0, metadata !12, null}
!132 = metadata !{i32 1}
!133 = metadata !{i32 133, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !20, i32 133, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!135 = metadata !{i32 134, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !134, i32 133, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!137 = metadata !{i32 136, i32 0, metadata !20, null}
!138 = metadata !{i32 138, i32 0, metadata !23, null}
!139 = metadata !{i32 140, i32 0, metadata !23, null}
!140 = metadata !{i32 141, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !23, i32 141, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!142 = metadata !{i32 142, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !141, i32 141, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!144 = metadata !{i32 143, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !143, i32 143, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!146 = metadata !{i32 144, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !145, i32 143, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!148 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 16777342, metadata !15, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [a] [line 126]
!149 = metadata !{i32 126, i32 0, metadata !12, metadata !146}
!150 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 33554558, metadata !15, i32 0, metadata !146} ; [ DW_TAG_arg_variable ] [b] [line 126]
!151 = metadata !{i32 128, i32 0, metadata !12, metadata !146}
!152 = metadata !{i32 786688, metadata !12, metadata !"t", metadata !5, i32 127, metadata !11, i32 0, metadata !146} ; [ DW_TAG_auto_variable ] [t] [line 127]
!153 = metadata !{i32 145, i32 0, metadata !147, null}
!154 = metadata !{i32 786689, metadata !12, metadata !"a", metadata !5, i32 16777342, metadata !15, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [a] [line 126]
!155 = metadata !{i32 146, i32 0, metadata !147, null}
!156 = metadata !{i32 126, i32 0, metadata !12, metadata !155}
!157 = metadata !{i32 786689, metadata !12, metadata !"b", metadata !5, i32 33554558, metadata !15, i32 0, metadata !155} ; [ DW_TAG_arg_variable ] [b] [line 126]
!158 = metadata !{i32 128, i32 0, metadata !12, metadata !155}
!159 = metadata !{i32 786688, metadata !12, metadata !"t", metadata !5, i32 127, metadata !11, i32 0, metadata !155} ; [ DW_TAG_auto_variable ] [t] [line 127]
!160 = metadata !{i32 149, i32 0, metadata !23, null}
!161 = metadata !{i32 153, i32 0, metadata !29, null}
!162 = metadata !{i32 154, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !29, i32 154, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!164 = metadata !{i32 134, i32 0, metadata !136, metadata !165}
!165 = metadata !{i32 155, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !163, i32 154, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!167 = metadata !{i32 133, i32 0, metadata !134, metadata !165}
!168 = metadata !{i32 156, i32 0, metadata !166, null}
!169 = metadata !{i32 158, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !29, i32 158, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!171 = metadata !{i32 159, i32 0, metadata !170, null}
!172 = metadata !{i32 160, i32 0, metadata !29, null}
!173 = metadata !{i32 161, i32 0, metadata !29, null}
!174 = metadata !{i32 0}
!175 = metadata !{i32 166, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !32, i32 166, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/perm.c]
!177 = metadata !{i32 167, i32 0, metadata !32, null}
