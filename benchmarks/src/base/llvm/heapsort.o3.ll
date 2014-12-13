; ModuleID = 'heapsort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gen_random.last = internal unnamed_addr global i64 42, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @gen_random(double %max) #0 {
  tail call void @llvm.dbg.value(metadata !{double %max}, i64 0, metadata !10), !dbg !51
  %1 = load i64* @gen_random.last, align 8, !dbg !52, !tbaa !53
  %2 = mul nsw i64 %1, 3877, !dbg !52
  %3 = add nsw i64 %2, 29573, !dbg !52
  %4 = srem i64 %3, 139968, !dbg !52
  store i64 %4, i64* @gen_random.last, align 8, !dbg !52, !tbaa !53
  %5 = sitofp i64 %4 to double, !dbg !52
  %6 = fmul double %5, %max, !dbg !52
  %7 = fdiv double %6, 1.399680e+05, !dbg !52
  ret double %7, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @benchmark_heapsort(i32 %n, double* nocapture %ra) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !17), !dbg !57
  tail call void @llvm.dbg.value(metadata !{double* %ra}, i64 0, metadata !18), !dbg !57
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !21), !dbg !58
  %1 = ashr i32 %n, 1, !dbg !59
  %2 = add nsw i32 %1, 1, !dbg !59
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !59
  %3 = getelementptr inbounds double* %ra, i64 1, !dbg !60
  br label %4, !dbg !65

; <label>:4                                       ; preds = %.outer._crit_edge, %0
  %ir.0 = phi i32 [ %n, %0 ], [ %ir.1, %.outer._crit_edge ]
  %l.0 = phi i32 [ %2, %0 ], [ %l.1, %.outer._crit_edge ]
  %5 = icmp sgt i32 %l.0, 1, !dbg !66
  br i1 %5, label %6, label %11, !dbg !66

; <label>:6                                       ; preds = %4
  %7 = add nsw i32 %l.0, -1, !dbg !67
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !22), !dbg !67
  %8 = sext i32 %7 to i64, !dbg !67
  %9 = getelementptr inbounds double* %ra, i64 %8, !dbg !67
  %10 = load double* %9, align 8, !dbg !67, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !23), !dbg !67
  br label %19, !dbg !71

; <label>:11                                      ; preds = %4
  %12 = sext i32 %ir.0 to i64, !dbg !72
  %13 = getelementptr inbounds double* %ra, i64 %12, !dbg !72
  %14 = load double* %13, align 8, !dbg !72, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{double %14}, i64 0, metadata !23), !dbg !72
  %15 = load double* %3, align 8, !dbg !60, !tbaa !69
  store double %15, double* %13, align 8, !dbg !60, !tbaa !69
  %16 = add nsw i32 %ir.0, -1, !dbg !73
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !21), !dbg !73
  %17 = icmp eq i32 %16, 1, !dbg !73
  br i1 %17, label %18, label %19, !dbg !73

; <label>:18                                      ; preds = %11
  store double %14, double* %3, align 8, !dbg !75, !tbaa !69
  ret void, !dbg !77

; <label>:19                                      ; preds = %11, %6
  %ir.1 = phi i32 [ %ir.0, %6 ], [ %16, %11 ]
  %l.1 = phi i32 [ %7, %6 ], [ %l.0, %11 ]
  %rra.0 = phi double [ %10, %6 ], [ %14, %11 ]
  tail call void @llvm.dbg.value(metadata !{i32 %l.1}, i64 0, metadata !19), !dbg !78
  %20 = shl i32 %l.1, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !20), !dbg !79
  %21 = icmp sgt i32 %20, %ir.1, !dbg !80
  br i1 %21, label %.outer._crit_edge, label %.preheader, !dbg !80

.preheader:                                       ; preds = %19, %.outer
  %j.0.ph6 = phi i32 [ %40, %.outer ], [ %20, %19 ]
  %i.0.ph5 = phi i32 [ %j.1, %.outer ], [ %l.1, %19 ]
  %22 = icmp slt i32 %j.0.ph6, %ir.1, !dbg !81
  br i1 %22, label %23, label %33, !dbg !81

; <label>:23                                      ; preds = %.preheader
  %24 = sext i32 %j.0.ph6 to i64, !dbg !81
  %25 = getelementptr inbounds double* %ra, i64 %24, !dbg !81
  %26 = load double* %25, align 8, !dbg !81, !tbaa !69
  %27 = or i32 %j.0.ph6, 1, !dbg !81
  %28 = sext i32 %27 to i64, !dbg !81
  %29 = getelementptr inbounds double* %ra, i64 %28, !dbg !81
  %30 = load double* %29, align 8, !dbg !81, !tbaa !69
  %31 = fcmp olt double %26, %30, !dbg !81
  br i1 %31, label %32, label %33, !dbg !81

; <label>:32                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !20), !dbg !84
  br label %33, !dbg !86

; <label>:33                                      ; preds = %32, %23, %.preheader
  %j.1 = phi i32 [ %27, %32 ], [ %j.0.ph6, %23 ], [ %j.0.ph6, %.preheader ]
  %34 = sext i32 %j.1 to i64, !dbg !87
  %35 = getelementptr inbounds double* %ra, i64 %34, !dbg !87
  %36 = load double* %35, align 8, !dbg !87, !tbaa !69
  %37 = fcmp olt double %rra.0, %36, !dbg !87
  br i1 %37, label %.outer, label %.outer._crit_edge, !dbg !87

.outer:                                           ; preds = %33
  %38 = sext i32 %i.0.ph5 to i64, !dbg !89
  %39 = getelementptr inbounds double* %ra, i64 %38, !dbg !89
  store double %36, double* %39, align 8, !dbg !89, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{i32 %j.1}, i64 0, metadata !19), !dbg !91
  %40 = shl nsw i32 %j.1, 1, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !20), !dbg !91
  %41 = icmp sgt i32 %40, %ir.1, !dbg !80
  br i1 %41, label %.outer._crit_edge, label %.preheader, !dbg !80

.outer._crit_edge:                                ; preds = %33, %.outer, %19
  %i.0.ph.lcssa = phi i32 [ %l.1, %19 ], [ %i.0.ph5, %33 ], [ %j.1, %.outer ]
  %42 = sext i32 %i.0.ph.lcssa to i64, !dbg !92
  %43 = getelementptr inbounds double* %ra, i64 %42, !dbg !92
  store double %rra.0, double* %43, align 8, !dbg !92, !tbaa !69
  br label %4, !dbg !93
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !31), !dbg !94
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !32), !dbg !94
  %1 = icmp eq i32 %argc, 2, !dbg !95
  br i1 %1, label %2, label %7, !dbg !95

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !96
  %4 = load i8** %3, align 8, !dbg !96, !tbaa !97
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !99) #3, !dbg !100
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #3, !dbg !101
  %6 = trunc i64 %5 to i32, !dbg !101
  br label %7, !dbg !96

; <label>:7                                       ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 8000000, %0 ], !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !33), !dbg !96
  %9 = add i32 %8, 1, !dbg !103
  %10 = sext i32 %9 to i64, !dbg !103
  %11 = shl nsw i64 %10, 3, !dbg !103
  %12 = tail call noalias i8* @malloc(i64 %11) #3, !dbg !103
  %13 = bitcast i8* %12 to double*, !dbg !103
  tail call void @llvm.dbg.value(metadata !{double* %13}, i64 0, metadata !34), !dbg !103
  tail call void @llvm.dbg.value(metadata !104, i64 0, metadata !35), !dbg !105
  %14 = icmp slt i32 %8, 1, !dbg !105
  br i1 %14, label %23, label %.lr.ph, !dbg !105

.lr.ph:                                           ; preds = %7
  %gen_random.last.promoted = load i64* @gen_random.last, align 8, !dbg !107, !tbaa !53
  br label %15, !dbg !105

; <label>:15                                      ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 1, %.lr.ph ]
  %16 = phi i64 [ %19, %15 ], [ %gen_random.last.promoted, %.lr.ph ], !dbg !110
  tail call void @llvm.dbg.value(metadata !111, i64 0, metadata !112), !dbg !110
  %17 = mul nsw i64 %16, 3877, !dbg !107
  %18 = add nsw i64 %17, 29573, !dbg !107
  %19 = srem i64 %18, 139968, !dbg !107
  %20 = sitofp i64 %19 to double, !dbg !107
  %21 = fdiv double %20, 1.399680e+05, !dbg !107
  %22 = getelementptr inbounds double* %13, i64 %indvars.iv, !dbg !108
  store double %21, double* %22, align 8, !dbg !108, !tbaa !69
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !105
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !105
  %exitcond = icmp eq i32 %lftr.wideiv, %9, !dbg !105
  br i1 %exitcond, label %._crit_edge, label %15, !dbg !105

._crit_edge:                                      ; preds = %15
  store i64 %19, i64* @gen_random.last, align 8, !dbg !107, !tbaa !53
  br label %23, !dbg !105

; <label>:23                                      ; preds = %._crit_edge, %7
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !113), !dbg !115
  tail call void @llvm.dbg.value(metadata !{double* %13}, i64 0, metadata !116), !dbg !115
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !117), !dbg !118
  %24 = ashr i32 %8, 1, !dbg !119
  %25 = add nsw i32 %24, 1, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !120), !dbg !119
  %26 = getelementptr inbounds i8* %12, i64 8, !dbg !121
  %27 = bitcast i8* %26 to double*, !dbg !121
  br label %28, !dbg !122

; <label>:28                                      ; preds = %.outer._crit_edge.i, %23
  %ir.0.i = phi i32 [ %8, %23 ], [ %ir.1.i, %.outer._crit_edge.i ]
  %l.0.i = phi i32 [ %25, %23 ], [ %l.1.i, %.outer._crit_edge.i ]
  %29 = icmp sgt i32 %l.0.i, 1, !dbg !123
  br i1 %29, label %30, label %35, !dbg !123

; <label>:30                                      ; preds = %28
  %31 = add nsw i32 %l.0.i, -1, !dbg !124
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !120), !dbg !124
  %32 = sext i32 %31 to i64, !dbg !124
  %33 = getelementptr inbounds double* %13, i64 %32, !dbg !124
  %34 = load double* %33, align 8, !dbg !124, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !125), !dbg !124
  br label %42, !dbg !126

; <label>:35                                      ; preds = %28
  %36 = sext i32 %ir.0.i to i64, !dbg !127
  %37 = getelementptr inbounds double* %13, i64 %36, !dbg !127
  %38 = load double* %37, align 8, !dbg !127, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !125), !dbg !127
  %39 = load double* %27, align 8, !dbg !121, !tbaa !69
  store double %39, double* %37, align 8, !dbg !121, !tbaa !69
  %40 = add nsw i32 %ir.0.i, -1, !dbg !128
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !117), !dbg !128
  %41 = icmp eq i32 %40, 1, !dbg !128
  br i1 %41, label %benchmark_heapsort.exit, label %42, !dbg !128

; <label>:42                                      ; preds = %35, %30
  %ir.1.i = phi i32 [ %ir.0.i, %30 ], [ %40, %35 ]
  %l.1.i = phi i32 [ %31, %30 ], [ %l.0.i, %35 ]
  %rra.0.i = phi double [ %34, %30 ], [ %38, %35 ]
  tail call void @llvm.dbg.value(metadata !{i32 %l.1.i}, i64 0, metadata !129), !dbg !130
  %43 = shl i32 %l.1.i, 1, !dbg !131
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !132), !dbg !131
  %44 = icmp sgt i32 %43, %ir.1.i, !dbg !133
  br i1 %44, label %.outer._crit_edge.i, label %.preheader, !dbg !133

.preheader:                                       ; preds = %42, %.outer.i
  %j.0.ph6.i = phi i32 [ %63, %.outer.i ], [ %43, %42 ]
  %i.0.ph5.i = phi i32 [ %j.1.i, %.outer.i ], [ %l.1.i, %42 ]
  %45 = icmp slt i32 %j.0.ph6.i, %ir.1.i, !dbg !134
  br i1 %45, label %46, label %56, !dbg !134

; <label>:46                                      ; preds = %.preheader
  %47 = sext i32 %j.0.ph6.i to i64, !dbg !134
  %48 = getelementptr inbounds double* %13, i64 %47, !dbg !134
  %49 = load double* %48, align 8, !dbg !134, !tbaa !69
  %50 = or i32 %j.0.ph6.i, 1, !dbg !134
  %51 = sext i32 %50 to i64, !dbg !134
  %52 = getelementptr inbounds double* %13, i64 %51, !dbg !134
  %53 = load double* %52, align 8, !dbg !134, !tbaa !69
  %54 = fcmp olt double %49, %53, !dbg !134
  br i1 %54, label %55, label %56, !dbg !134

; <label>:55                                      ; preds = %46
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !132), !dbg !135
  br label %56, !dbg !136

; <label>:56                                      ; preds = %55, %46, %.preheader
  %j.1.i = phi i32 [ %50, %55 ], [ %j.0.ph6.i, %46 ], [ %j.0.ph6.i, %.preheader ]
  %57 = sext i32 %j.1.i to i64, !dbg !137
  %58 = getelementptr inbounds double* %13, i64 %57, !dbg !137
  %59 = load double* %58, align 8, !dbg !137, !tbaa !69
  %60 = fcmp olt double %rra.0.i, %59, !dbg !137
  br i1 %60, label %.outer.i, label %.outer._crit_edge.i, !dbg !137

.outer.i:                                         ; preds = %56
  %61 = sext i32 %i.0.ph5.i to i64, !dbg !138
  %62 = getelementptr inbounds double* %13, i64 %61, !dbg !138
  store double %59, double* %62, align 8, !dbg !138, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{i32 %j.1.i}, i64 0, metadata !129), !dbg !139
  %63 = shl nsw i32 %j.1.i, 1, !dbg !139
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !132), !dbg !139
  %64 = icmp sgt i32 %63, %ir.1.i, !dbg !133
  br i1 %64, label %.outer._crit_edge.i, label %.preheader, !dbg !133

.outer._crit_edge.i:                              ; preds = %.outer.i, %56, %42
  %i.0.ph.lcssa.i = phi i32 [ %l.1.i, %42 ], [ %j.1.i, %.outer.i ], [ %i.0.ph5.i, %56 ]
  %65 = sext i32 %i.0.ph.lcssa.i to i64, !dbg !140
  %66 = getelementptr inbounds double* %13, i64 %65, !dbg !140
  store double %rra.0.i, double* %66, align 8, !dbg !140, !tbaa !69
  br label %28, !dbg !141

benchmark_heapsort.exit:                          ; preds = %35
  store double %38, double* %27, align 8, !dbg !142, !tbaa !69
  %67 = sext i32 %8 to i64, !dbg !143
  %68 = getelementptr inbounds double* %13, i64 %67, !dbg !143
  %69 = load double* %68, align 8, !dbg !143, !tbaa !69
  %70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), double %69) #3, !dbg !143
  tail call void @free(i8* %12) #3, !dbg !144
  ret i32 0, !dbg !145
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!48, !49}
!llvm.ident = !{!50}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !45, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c] [DW_LANG_C99]
!1 = metadata !{metadata !"heapsort.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11, metadata !24, metadata !36}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_random", metadata !"gen_random", metadata !"", i32 16, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @gen_random, null, null, metadata !9, i32 16} ; [ DW_TAG_subprogram ] [line 16] [def] [gen_random]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"max", metadata !5, i32 16777232, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 16]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"benchmark_heapsort", metadata !"benchmark_heapsort", metadata !"", i32 22, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @benchmark_heapsort, null, null, metadata !16, i32 22} ; [ DW_TAG_subprogram ] [line 22] [def] [benchmark_heapsort]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{null, metadata !14, metadata !15}
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = metadata !{metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23}
!17 = metadata !{i32 786689, metadata !11, metadata !"n", metadata !5, i32 16777238, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 22]
!18 = metadata !{i32 786689, metadata !11, metadata !"ra", metadata !5, i32 33554454, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ra] [line 22]
!19 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 23, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 23]
!20 = metadata !{i32 786688, metadata !11, metadata !"j", metadata !5, i32 23, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 23]
!21 = metadata !{i32 786688, metadata !11, metadata !"ir", metadata !5, i32 24, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ir] [line 24]
!22 = metadata !{i32 786688, metadata !11, metadata !"l", metadata !5, i32 25, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 25]
!23 = metadata !{i32 786688, metadata !11, metadata !"rra", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rra] [line 26]
!24 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 58, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !30, i32 58} ; [ DW_TAG_subprogram ] [line 58] [def] [main]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !14, metadata !14, metadata !27}
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!30 = metadata !{metadata !31, metadata !32, metadata !33, metadata !34, metadata !35}
!31 = metadata !{i32 786689, metadata !24, metadata !"argc", metadata !5, i32 16777274, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 58]
!32 = metadata !{i32 786689, metadata !24, metadata !"argv", metadata !5, i32 33554490, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 58]
!33 = metadata !{i32 786688, metadata !24, metadata !"N", metadata !5, i32 64, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 64]
!34 = metadata !{i32 786688, metadata !24, metadata !"ary", metadata !5, i32 65, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ary] [line 65]
!35 = metadata !{i32 786688, metadata !24, metadata !"i", metadata !5, i32 66, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 66]
!36 = metadata !{i32 786478, metadata !37, metadata !38, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !43, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!37 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!38 = metadata !{i32 786473, metadata !37}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !14, metadata !41}
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786689, metadata !36, metadata !"__nptr", metadata !38, i32 16777494, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786484, i32 0, metadata !4, metadata !"last", metadata !"last", metadata !"", metadata !5, i32 17, metadata !47, i32 1, i32 1, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!47 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!48 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!49 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!50 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!51 = metadata !{i32 16, i32 0, metadata !4, null}
!52 = metadata !{i32 18, i32 0, metadata !4, null}
!53 = metadata !{metadata !54, metadata !54, i64 0}
!54 = metadata !{metadata !"long", metadata !55, i64 0}
!55 = metadata !{metadata !"omnipotent char", metadata !56, i64 0}
!56 = metadata !{metadata !"Simple C/C++ TBAA"}
!57 = metadata !{i32 22, i32 0, metadata !11, null}
!58 = metadata !{i32 24, i32 0, metadata !11, null}
!59 = metadata !{i32 25, i32 0, metadata !11, null}
!60 = metadata !{i32 33, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 31, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!62 = metadata !{i32 786443, metadata !1, metadata !63, i32 29, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!63 = metadata !{i32 786443, metadata !1, metadata !64, i32 28, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!64 = metadata !{i32 786443, metadata !1, metadata !11, i32 28, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!65 = metadata !{i32 28, i32 0, metadata !64, null}
!66 = metadata !{i32 29, i32 0, metadata !62, null}
!67 = metadata !{i32 30, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !62, i32 29, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!69 = metadata !{metadata !70, metadata !70, i64 0}
!70 = metadata !{metadata !"double", metadata !55, i64 0}
!71 = metadata !{i32 31, i32 0, metadata !68, null}
!72 = metadata !{i32 32, i32 0, metadata !61, null}
!73 = metadata !{i32 34, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !61, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!75 = metadata !{i32 35, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !74, i32 34, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!77 = metadata !{i32 55, i32 0, metadata !11, null}
!78 = metadata !{i32 40, i32 0, metadata !63, null}
!79 = metadata !{i32 41, i32 0, metadata !63, null}
!80 = metadata !{i32 42, i32 0, metadata !63, null}
!81 = metadata !{i32 43, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !83, i32 43, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!83 = metadata !{i32 786443, metadata !1, metadata !63, i32 42, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!84 = metadata !{i32 44, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 43, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!86 = metadata !{i32 45, i32 0, metadata !85, null}
!87 = metadata !{i32 46, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !83, i32 46, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!89 = metadata !{i32 47, i32 0, metadata !90, null}
!90 = metadata !{i32 786443, metadata !1, metadata !88, i32 46, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!91 = metadata !{i32 48, i32 0, metadata !90, null}
!92 = metadata !{i32 53, i32 0, metadata !63, null}
!93 = metadata !{i32 54, i32 0, metadata !63, null}
!94 = metadata !{i32 58, i32 0, metadata !24, null} ; [ DW_TAG_imported_module ]
!95 = metadata !{i32 64, i32 0, metadata !24, null}
!96 = metadata !{i32 64, i32 28, metadata !24, null}
!97 = metadata !{metadata !98, metadata !98, i64 0}
!98 = metadata !{metadata !"any pointer", metadata !55, i64 0}
!99 = metadata !{i32 786689, metadata !36, metadata !"__nptr", metadata !38, i32 16777494, metadata !41, i32 0, metadata !96} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!100 = metadata !{i32 278, i32 0, metadata !36, metadata !96}
!101 = metadata !{i32 280, i32 0, metadata !102, metadata !96}
!102 = metadata !{i32 786443, metadata !37, metadata !36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!103 = metadata !{i32 69, i32 0, metadata !24, null}
!104 = metadata !{i32 1}
!105 = metadata !{i32 70, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !24, i32 70, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!107 = metadata !{i32 18, i32 0, metadata !4, metadata !108}
!108 = metadata !{i32 71, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !106, i32 70, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/heapsort.c]
!110 = metadata !{i32 16, i32 0, metadata !4, metadata !108}
!111 = metadata !{double 1.000000e+00}
!112 = metadata !{i32 786689, metadata !4, metadata !"max", metadata !5, i32 16777232, metadata !8, i32 0, metadata !108} ; [ DW_TAG_arg_variable ] [max] [line 16]
!113 = metadata !{i32 786689, metadata !11, metadata !"n", metadata !5, i32 16777238, metadata !14, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [n] [line 22]
!114 = metadata !{i32 74, i32 0, metadata !24, null}
!115 = metadata !{i32 22, i32 0, metadata !11, metadata !114}
!116 = metadata !{i32 786689, metadata !11, metadata !"ra", metadata !5, i32 33554454, metadata !15, i32 0, metadata !114} ; [ DW_TAG_arg_variable ] [ra] [line 22]
!117 = metadata !{i32 786688, metadata !11, metadata !"ir", metadata !5, i32 24, metadata !14, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [ir] [line 24]
!118 = metadata !{i32 24, i32 0, metadata !11, metadata !114}
!119 = metadata !{i32 25, i32 0, metadata !11, metadata !114}
!120 = metadata !{i32 786688, metadata !11, metadata !"l", metadata !5, i32 25, metadata !14, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [l] [line 25]
!121 = metadata !{i32 33, i32 0, metadata !61, metadata !114}
!122 = metadata !{i32 28, i32 0, metadata !64, metadata !114}
!123 = metadata !{i32 29, i32 0, metadata !62, metadata !114}
!124 = metadata !{i32 30, i32 0, metadata !68, metadata !114}
!125 = metadata !{i32 786688, metadata !11, metadata !"rra", metadata !5, i32 26, metadata !8, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [rra] [line 26]
!126 = metadata !{i32 31, i32 0, metadata !68, metadata !114}
!127 = metadata !{i32 32, i32 0, metadata !61, metadata !114}
!128 = metadata !{i32 34, i32 0, metadata !74, metadata !114}
!129 = metadata !{i32 786688, metadata !11, metadata !"i", metadata !5, i32 23, metadata !14, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [i] [line 23]
!130 = metadata !{i32 40, i32 0, metadata !63, metadata !114}
!131 = metadata !{i32 41, i32 0, metadata !63, metadata !114}
!132 = metadata !{i32 786688, metadata !11, metadata !"j", metadata !5, i32 23, metadata !14, i32 0, metadata !114} ; [ DW_TAG_auto_variable ] [j] [line 23]
!133 = metadata !{i32 42, i32 0, metadata !63, metadata !114}
!134 = metadata !{i32 43, i32 0, metadata !82, metadata !114}
!135 = metadata !{i32 44, i32 0, metadata !85, metadata !114}
!136 = metadata !{i32 45, i32 0, metadata !85, metadata !114}
!137 = metadata !{i32 46, i32 0, metadata !88, metadata !114}
!138 = metadata !{i32 47, i32 0, metadata !90, metadata !114}
!139 = metadata !{i32 48, i32 0, metadata !90, metadata !114}
!140 = metadata !{i32 53, i32 0, metadata !63, metadata !114}
!141 = metadata !{i32 54, i32 0, metadata !63, metadata !114}
!142 = metadata !{i32 35, i32 0, metadata !76, metadata !114}
!143 = metadata !{i32 76, i32 0, metadata !24, null}
!144 = metadata !{i32 78, i32 0, metadata !24, null}
!145 = metadata !{i32 79, i32 0, metadata !24, null}
