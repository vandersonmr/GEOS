; ModuleID = 'realmm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { double, double }

@seed = common global i64 0, align 8
@rma = common global [41 x [41 x double]] zeroinitializer, align 16
@rmb = common global [41 x [41 x double]] zeroinitializer, align 16
@rmr = common global [41 x [41 x double]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@value = common global double 0.000000e+00, align 8
@fixed = common global double 0.000000e+00, align 8
@floated = common global double 0.000000e+00, align 8
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
@zr = common global double 0.000000e+00, align 8
@zi = common global double 0.000000e+00, align 8

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
define void @rInitmatrix([41 x double]* nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{[41 x double]* %m}, i64 0, metadata !21), !dbg !136
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !23), !dbg !138
  br label %.preheader, !dbg !138

.preheader:                                       ; preds = %8, %0
  %indvars.iv3 = phi i64 [ 1, %0 ], [ %indvars.iv.next4, %8 ]
  br label %1, !dbg !140

; <label>:1                                       ; preds = %1, %.preheader
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %1 ]
  %2 = tail call i32 @Rand(), !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !142
  %3 = srem i32 %2, 120, !dbg !144
  %4 = add nsw i32 %3, -60, !dbg !144
  %5 = sitofp i32 %4 to double, !dbg !144
  %6 = fdiv double %5, 3.000000e+00, !dbg !144
  %7 = getelementptr inbounds [41 x double]* %m, i64 %indvars.iv3, i64 %indvars.iv, !dbg !144
  store double %6, double* %7, align 8, !dbg !144, !tbaa !145
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !140
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !140
  br i1 %exitcond, label %8, label %1, !dbg !140

; <label>:8                                       ; preds = %1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !138
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 41, !dbg !138
  br i1 %exitcond5, label %9, label %.preheader, !dbg !138

; <label>:9                                       ; preds = %8
  ret void, !dbg !147
}

; Function Attrs: nounwind uwtable
define void @rInnerproduct(double* nocapture %result, [41 x double]* nocapture readonly %a, [41 x double]* nocapture readonly %b, i32 %row, i32 %column) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %result}, i64 0, metadata !30), !dbg !148
  tail call void @llvm.dbg.value(metadata !{[41 x double]* %a}, i64 0, metadata !31), !dbg !148
  tail call void @llvm.dbg.value(metadata !{[41 x double]* %b}, i64 0, metadata !32), !dbg !148
  tail call void @llvm.dbg.value(metadata !{i32 %row}, i64 0, metadata !33), !dbg !148
  tail call void @llvm.dbg.value(metadata !{i32 %column}, i64 0, metadata !34), !dbg !148
  store double 0.000000e+00, double* %result, align 8, !dbg !149, !tbaa !145
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !35), !dbg !150
  %1 = sext i32 %row to i64, !dbg !150
  %2 = sext i32 %column to i64, !dbg !150
  br label %3, !dbg !150

; <label>:3                                       ; preds = %3, %0
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %3 ]
  %4 = load double* %result, align 8, !dbg !150, !tbaa !145
  %5 = getelementptr inbounds [41 x double]* %a, i64 %1, i64 %indvars.iv, !dbg !150
  %6 = load double* %5, align 8, !dbg !150, !tbaa !145
  %7 = getelementptr inbounds [41 x double]* %b, i64 %indvars.iv, i64 %2, !dbg !150
  %8 = load double* %7, align 8, !dbg !150, !tbaa !145
  %9 = fmul double %6, %8, !dbg !150
  %10 = fadd double %4, %9, !dbg !150
  store double %10, double* %result, align 8, !dbg !150, !tbaa !145
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !150
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !150
  br i1 %exitcond, label %11, label %3, !dbg !150

; <label>:11                                      ; preds = %3
  ret void, !dbg !152
}

; Function Attrs: nounwind uwtable
define void @Mm(i32 %run) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %run}, i64 0, metadata !40), !dbg !153
  tail call void @Initrand(), !dbg !154
  tail call void @rInitmatrix([41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rma, i64 0, i64 0)), !dbg !155
  tail call void @rInitmatrix([41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rmb, i64 0, i64 0)), !dbg !156
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !41), !dbg !157
  br label %.preheader, !dbg !157

.preheader:                                       ; preds = %5, %0
  %indvars.iv3 = phi i64 [ 1, %0 ], [ %indvars.iv.next4, %5 ]
  br label %1, !dbg !159

; <label>:1                                       ; preds = %1, %.preheader
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %1 ]
  %2 = getelementptr inbounds [41 x [41 x double]]* @rmr, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !161
  %3 = trunc i64 %indvars.iv to i32, !dbg !161
  %4 = trunc i64 %indvars.iv3 to i32, !dbg !161
  tail call void @rInnerproduct(double* %2, [41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rma, i64 0, i64 0), [41 x double]* getelementptr inbounds ([41 x [41 x double]]* @rmb, i64 0, i64 0), i32 %4, i32 %3), !dbg !161
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !159
  %exitcond = icmp eq i64 %indvars.iv.next, 41, !dbg !159
  br i1 %exitcond, label %5, label %1, !dbg !159

; <label>:5                                       ; preds = %1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !157
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 41, !dbg !157
  br i1 %exitcond5, label %6, label %.preheader, !dbg !157

; <label>:6                                       ; preds = %5
  %7 = add nsw i32 %run, 1, !dbg !162
  %8 = sext i32 %7 to i64, !dbg !162
  %9 = getelementptr inbounds [41 x [41 x double]]* @rmr, i64 0, i64 %8, i64 %8, !dbg !162
  %10 = load double* %9, align 8, !dbg !162, !tbaa !145
  %11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %10) #3, !dbg !162
  ret void, !dbg !163
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !164, i64 0, metadata !45), !dbg !165
  br label %1, !dbg !165

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i32 [ 0, %0 ], [ %2, %1 ]
  tail call void @Mm(i32 %i.01), !dbg !165
  %2 = add nsw i32 %i.01, 1, !dbg !165
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !45), !dbg !165
  %exitcond = icmp eq i32 %2, 10, !dbg !165
  br i1 %exitcond, label %3, label %1, !dbg !165

; <label>:3                                       ; preds = %1
  ret i32 0, !dbg !167
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

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !46, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"realmm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !25, metadata !36, metadata !43}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 117, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 117} ; [ DW_TAG_subprogram ] [line 117] [def] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 121, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 121} ; [ DW_TAG_subprogram ] [line 121] [def] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rInitmatrix", metadata !"rInitmatrix", metadata !"", i32 129, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ([41 x double]*)* @rInitmatrix, null, null, metadata !20, i32 129} ; [ DW_TAG_subprogram ] [line 129] [def] [rInitmatrix]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2624, i64 64, i32 0, i32 0, metadata !17, metadata !18, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2624, align 64, offset 0] [from double]
!17 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786465, i64 0, i64 41}       ; [ DW_TAG_subrange_type ] [0, 40]
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24}
!21 = metadata !{i32 786689, metadata !12, metadata !"m", metadata !5, i32 16777345, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 129]
!22 = metadata !{i32 786688, metadata !12, metadata !"temp", metadata !5, i32 130, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 130]
!23 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 130, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 130]
!24 = metadata !{i32 786688, metadata !12, metadata !"j", metadata !5, i32 130, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 130]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"rInnerproduct", metadata !"rInnerproduct", metadata !"", i32 138, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double*, [41 x double]*, [41 x double]*, i32, i32)* @rInnerproduct, null, null, metadata !29, i32 138} ; [ DW_TAG_subprogram ] [line 138] [def] [rInnerproduct]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{null, metadata !28, metadata !15, metadata !15, metadata !11, metadata !11}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35}
!30 = metadata !{i32 786689, metadata !25, metadata !"result", metadata !5, i32 16777354, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [result] [line 138]
!31 = metadata !{i32 786689, metadata !25, metadata !"a", metadata !5, i32 33554570, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 138]
!32 = metadata !{i32 786689, metadata !25, metadata !"b", metadata !5, i32 50331786, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 138]
!33 = metadata !{i32 786689, metadata !25, metadata !"row", metadata !5, i32 67109002, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [row] [line 138]
!34 = metadata !{i32 786689, metadata !25, metadata !"column", metadata !5, i32 83886218, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [column] [line 138]
!35 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 140, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 140]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Mm", metadata !"Mm", metadata !"", i32 145, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @Mm, null, null, metadata !39, i32 145} ; [ DW_TAG_subprogram ] [line 145] [def] [Mm]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{null, metadata !11}
!39 = metadata !{metadata !40, metadata !41, metadata !42}
!40 = metadata !{i32 786689, metadata !36, metadata !"run", metadata !5, i32 16777361, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [run] [line 145]
!41 = metadata !{i32 786688, metadata !36, metadata !"i", metadata !5, i32 146, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 146]
!42 = metadata !{i32 786688, metadata !36, metadata !"j", metadata !5, i32 146, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 146]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 156, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !44, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [main]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786688, metadata !43, metadata !"i", metadata !5, i32 158, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 158]
!46 = metadata !{metadata !47, metadata !48, metadata !49, metadata !50, metadata !52, metadata !56, metadata !58, metadata !65, metadata !69, metadata !77, metadata !78, metadata !79, metadata !82, metadata !83, metadata !84, metadata !86, metadata !87, metadata !88, metadata !89, metadata !93, metadata !94, metadata !98, metadata !101, metadata !102, metadata !103, metadata !107, metadata !108, metadata !109, metadata !110, metadata !118, metadata !119, metadata !123, metadata !124}
!47 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 83, metadata !17, i32 0, i32 1, double* @value, null} ; [ DW_TAG_variable ] [value] [line 83] [def]
!48 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 83, metadata !17, i32 0, i32 1, double* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 83] [def]
!49 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 83, metadata !17, i32 0, i32 1, double* @floated, null} ; [ DW_TAG_variable ] [floated] [line 83] [def]
!50 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 86, metadata !51, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 86] [def]
!51 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!52 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 89, metadata !53, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 89] [def]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !54, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786465, i64 0, i64 11}       ; [ DW_TAG_subrange_type ] [0, 10]
!56 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 91, metadata !57, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 91] [def]
!57 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!58 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 94, metadata !59, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 94] [def]
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!60 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 47, i64 192, i64 64, i32 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 47, size 192, align 64, offset 0] [def] [from ]
!61 = metadata !{metadata !62, metadata !63, metadata !64}
!62 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"left", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_member ] [left] [line 48, size 64, align 64, offset 0] [from ]
!63 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"right", i32 48, i64 64, i64 64, i64 64, i32 0, metadata !59} ; [ DW_TAG_member ] [right] [line 48, size 64, align 64, offset 64] [from ]
!64 = metadata !{i32 786445, metadata !1, metadata !60, metadata !"val", i32 49, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 49, size 32, align 32, offset 128] [from int]
!65 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 97, metadata !66, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 97] [def]
!66 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !67, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786465, i64 0, i64 4}        ; [ DW_TAG_subrange_type ] [0, 3]
!69 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 98, metadata !70, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 98] [def]
!70 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !71, metadata !75, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!71 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 56, i64 64, i64 32, i32 0, i32 0, null, metadata !72, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 56, size 64, align 32, offset 0] [def] [from ]
!72 = metadata !{metadata !73, metadata !74}
!73 = metadata !{i32 786445, metadata !1, metadata !71, metadata !"discsize", i32 57, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 57, size 32, align 32, offset 0] [from int]
!74 = metadata !{i32 786445, metadata !1, metadata !71, metadata !"next", i32 58, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 58, size 32, align 32, offset 32] [from int]
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786465, i64 0, i64 19}       ; [ DW_TAG_subrange_type ] [0, 18]
!77 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 99, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 99] [def]
!78 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 99, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 99] [def]
!79 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 103, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 103] [def]
!80 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!81 = metadata !{metadata !19, metadata !19}
!82 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 103, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 103] [def]
!83 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 103, metadata !80, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 103] [def]
!84 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 104, metadata !85, i32 0, i32 1, [41 x [41 x double]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 104] [def]
!85 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 107584, i64 64, i32 0, i32 0, metadata !17, metadata !81, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 107584, align 64, offset 0] [from double]
!86 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 104, metadata !85, i32 0, i32 1, [41 x [41 x double]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 104] [def]
!87 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 104, metadata !85, i32 0, i32 1, [41 x [41 x double]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 104] [def]
!88 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 107, metadata !66, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 107] [def]
!89 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 107, metadata !90, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 107] [def]
!90 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !91, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786465, i64 0, i64 13}       ; [ DW_TAG_subrange_type ] [0, 12]
!93 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 107, metadata !90, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 107] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 108, metadata !95, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 108] [def]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!98 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 108, metadata !99, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 108] [def]
!99 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !100, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!100 = metadata !{metadata !92, metadata !97}
!101 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 108, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 108] [def]
!102 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 108, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 108] [def]
!103 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 111, metadata !104, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 111] [def]
!104 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !105, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!107 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 111, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 111] [def]
!108 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 111, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 111] [def]
!109 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 111, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 111] [def]
!110 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 114, metadata !111, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 114] [def]
!111 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32896, i64 64, i32 0, i32 0, metadata !112, metadata !116, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32896, align 64, offset 0] [from complex]
!112 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 77, i64 128, i64 64, i32 0, i32 0, null, metadata !113, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 77, size 128, align 64, offset 0] [def] [from ]
!113 = metadata !{metadata !114, metadata !115}
!114 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"rp", i32 77, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_member ] [rp] [line 77, size 64, align 64, offset 0] [from double]
!115 = metadata !{i32 786445, metadata !1, metadata !112, metadata !"ip", i32 77, i64 64, i64 64, i64 64, i32 0, metadata !17} ; [ DW_TAG_member ] [ip] [line 77, size 64, align 64, offset 64] [from double]
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!118 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 114, metadata !111, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 114] [def]
!119 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 114, metadata !120, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 114] [def]
!120 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16640, i64 64, i32 0, i32 0, metadata !112, metadata !121, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16640, align 64, offset 0] [from complex]
!121 = metadata !{metadata !122}
!122 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!123 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 115, metadata !17, i32 0, i32 1, double* @zr, null} ; [ DW_TAG_variable ] [zr] [line 115] [def]
!124 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 115, metadata !17, i32 0, i32 1, double* @zi, null} ; [ DW_TAG_variable ] [zi] [line 115] [def]
!125 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!126 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!127 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!128 = metadata !{i32 118, i32 0, metadata !4, null}
!129 = metadata !{metadata !130, metadata !130, i64 0}
!130 = metadata !{metadata !"long", metadata !131, i64 0}
!131 = metadata !{metadata !"omnipotent char", metadata !132, i64 0}
!132 = metadata !{metadata !"Simple C/C++ TBAA"}
!133 = metadata !{i32 119, i32 0, metadata !4, null}
!134 = metadata !{i32 122, i32 0, metadata !8, null}
!135 = metadata !{i32 123, i32 0, metadata !8, null}
!136 = metadata !{i32 129, i32 0, metadata !12, null}
!137 = metadata !{i32 1}
!138 = metadata !{i32 131, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !12, i32 131, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!140 = metadata !{i32 132, i32 0, metadata !141, null}
!141 = metadata !{i32 786443, metadata !1, metadata !139, i32 132, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!142 = metadata !{i32 133, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !141, i32 132, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!144 = metadata !{i32 134, i32 0, metadata !143, null}
!145 = metadata !{metadata !146, metadata !146, i64 0}
!146 = metadata !{metadata !"double", metadata !131, i64 0}
!147 = metadata !{i32 136, i32 0, metadata !12, null}
!148 = metadata !{i32 138, i32 0, metadata !25, null}
!149 = metadata !{i32 141, i32 0, metadata !25, null}
!150 = metadata !{i32 142, i32 0, metadata !151, null}
!151 = metadata !{i32 786443, metadata !1, metadata !25, i32 142, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!152 = metadata !{i32 143, i32 0, metadata !25, null}
!153 = metadata !{i32 145, i32 0, metadata !36, null}
!154 = metadata !{i32 147, i32 0, metadata !36, null}
!155 = metadata !{i32 148, i32 0, metadata !36, null}
!156 = metadata !{i32 149, i32 0, metadata !36, null}
!157 = metadata !{i32 150, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !36, i32 150, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!159 = metadata !{i32 151, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !158, i32 151, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!161 = metadata !{i32 152, i32 0, metadata !160, null}
!162 = metadata !{i32 153, i32 0, metadata !36, null}
!163 = metadata !{i32 154, i32 0, metadata !36, null}
!164 = metadata !{i32 0}
!165 = metadata !{i32 159, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !43, i32 159, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/realmm.c]
!167 = metadata !{i32 160, i32 0, metadata !43, null}
