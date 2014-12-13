; ModuleID = 'array.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define noalias double** @new_Array2D_double(i32 %M, i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !13), !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !14), !dbg !44
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !15), !dbg !46
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !16), !dbg !47
  %1 = sext i32 %M to i64, !dbg !48
  %2 = shl nsw i64 %1, 3, !dbg !48
  %3 = tail call noalias i8* @malloc(i64 %2) #3, !dbg !48
  %4 = bitcast i8* %3 to double**, !dbg !48
  tail call void @llvm.dbg.value(metadata !{double** %4}, i64 0, metadata !17), !dbg !48
  %5 = icmp eq i8* %3, null, !dbg !49
  br i1 %5, label %.critedge, label %.preheader1, !dbg !49

.preheader1:                                      ; preds = %0
  %6 = icmp sgt i32 %M, 0, !dbg !51
  br i1 %6, label %.lr.ph6, label %.critedge, !dbg !51

.lr.ph6:                                          ; preds = %.preheader1
  %7 = sext i32 %N to i64, !dbg !53
  %8 = shl nsw i64 %7, 3, !dbg !53
  br label %12, !dbg !51

; <label>:9                                       ; preds = %12
  %10 = trunc i64 %indvars.iv.next9 to i32, !dbg !51
  %11 = icmp slt i32 %10, %M, !dbg !51
  br i1 %11, label %12, label %.critedge, !dbg !51

; <label>:12                                      ; preds = %.lr.ph6, %9
  %indvars.iv8 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next9, %9 ]
  %13 = tail call noalias i8* @malloc(i64 %8) #3, !dbg !53
  %14 = bitcast i8* %13 to double*, !dbg !53
  %15 = getelementptr inbounds double** %4, i64 %indvars.iv8, !dbg !53
  store double* %14, double** %15, align 8, !dbg !53, !tbaa !55
  %16 = icmp eq i8* %13, null, !dbg !59
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !51
  br i1 %16, label %.preheader, label %9, !dbg !59

.preheader:                                       ; preds = %12
  %17 = trunc i64 %indvars.iv8 to i32, !dbg !61
  %18 = icmp slt i32 %17, 2, !dbg !61
  br i1 %18, label %.lr.ph, label %._crit_edge, !dbg !61

.lr.ph:                                           ; preds = %.preheader
  %sext = shl i64 %indvars.iv8, 32
  %19 = ashr exact i64 %sext, 32
  br label %20, !dbg !61

; <label>:20                                      ; preds = %.lr.ph, %20
  %indvars.iv = phi i64 [ %19, %.lr.ph ], [ %indvars.iv.next, %20 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !61
  %21 = getelementptr inbounds double** %4, i64 %indvars.iv.next, !dbg !65
  %22 = load double** %21, align 8, !dbg !65, !tbaa !55
  %23 = bitcast double* %22 to i8*, !dbg !65
  tail call void @free(i8* %23) #3, !dbg !65
  %24 = trunc i64 %indvars.iv to i32, !dbg !61
  %25 = icmp slt i32 %24, 3, !dbg !61
  br i1 %25, label %20, label %._crit_edge, !dbg !61

._crit_edge:                                      ; preds = %20, %.preheader
  tail call void @free(i8* %3) #3, !dbg !66
  br label %.critedge, !dbg !67

.critedge:                                        ; preds = %9, %.preheader1, %0, %._crit_edge
  %.0 = phi double** [ null, %._crit_edge ], [ null, %0 ], [ %4, %.preheader1 ], [ %4, %9 ]
  ret double** %.0, !dbg !68
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @Array2D_double_delete(i32 %M, i32 %N, double** %A) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !22), !dbg !69
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !23), !dbg !69
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !24), !dbg !69
  %1 = icmp eq double** %A, null, !dbg !70
  br i1 %1, label %7, label %.preheader, !dbg !70

.preheader:                                       ; preds = %0
  %2 = icmp sgt i32 %M, 0, !dbg !72
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !72

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %3 = getelementptr inbounds double** %A, i64 %indvars.iv, !dbg !74
  %4 = load double** %3, align 8, !dbg !74, !tbaa !55
  %5 = bitcast double* %4 to i8*, !dbg !74
  tail call void @free(i8* %5) #3, !dbg !74
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !72
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !72
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !72

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %6 = bitcast double** %A to i8*, !dbg !75
  tail call void @free(i8* %6) #3, !dbg !75
  br label %7, !dbg !76

; <label>:7                                       ; preds = %0, %._crit_edge
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @Array2D_double_copy(i32 %M, i32 %N, double** nocapture readonly %B, double** nocapture readonly %A) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !30), !dbg !77
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !31), !dbg !77
  tail call void @llvm.dbg.value(metadata !{double** %B}, i64 0, metadata !32), !dbg !77
  tail call void @llvm.dbg.value(metadata !{double** %A}, i64 0, metadata !33), !dbg !77
  %1 = and i32 %N, 3, !dbg !78
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !34), !dbg !78
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !35), !dbg !79
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !36), !dbg !80
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !35), !dbg !81
  %2 = icmp sgt i32 %M, 0, !dbg !81
  br i1 %2, label %.lr.ph6, label %._crit_edge7, !dbg !81

.lr.ph6:                                          ; preds = %0
  %3 = icmp eq i32 %1, 0, !dbg !82
  %4 = icmp slt i32 %1, %N, !dbg !84
  %5 = zext i32 %N to i64
  %6 = and i64 %5, 3
  br label %7, !dbg !81

; <label>:7                                       ; preds = %._crit_edge, %.lr.ph6
  %indvars.iv10 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next11, %._crit_edge ]
  %8 = getelementptr inbounds double** %B, i64 %indvars.iv10, !dbg !86
  %9 = load double** %8, align 8, !dbg !86, !tbaa !55
  tail call void @llvm.dbg.value(metadata !{double* %9}, i64 0, metadata !37), !dbg !86
  %10 = getelementptr inbounds double** %A, i64 %indvars.iv10, !dbg !87
  %11 = load double** %10, align 8, !dbg !87, !tbaa !55
  tail call void @llvm.dbg.value(metadata !{double* %11}, i64 0, metadata !40), !dbg !87
  tail call void @llvm.dbg.value(metadata !45, i64 0, metadata !36), !dbg !82
  br i1 %3, label %.preheader, label %.lr.ph, !dbg !82

.preheader:                                       ; preds = %.lr.ph, %7
  br i1 %4, label %.lr.ph3, label %._crit_edge, !dbg !84

.lr.ph:                                           ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %7 ]
  %12 = getelementptr inbounds double* %11, i64 %indvars.iv, !dbg !88
  %13 = load double* %12, align 8, !dbg !88, !tbaa !89
  %14 = getelementptr inbounds double* %9, i64 %indvars.iv, !dbg !88
  store double %13, double* %14, align 8, !dbg !88, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !82
  %15 = trunc i64 %indvars.iv.next to i32, !dbg !82
  %16 = icmp slt i32 %15, %1, !dbg !82
  br i1 %16, label %.lr.ph, label %.preheader, !dbg !82

.lr.ph3:                                          ; preds = %.preheader, %.lr.ph3
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.lr.ph3 ], [ %6, %.preheader ]
  %j.12 = phi i32 [ %32, %.lr.ph3 ], [ %1, %.preheader ]
  %17 = getelementptr inbounds double* %11, i64 %indvars.iv8, !dbg !91
  %18 = load double* %17, align 8, !dbg !91, !tbaa !89
  %19 = getelementptr inbounds double* %9, i64 %indvars.iv8, !dbg !91
  store double %18, double* %19, align 8, !dbg !91, !tbaa !89
  %20 = add nsw i64 %indvars.iv8, 1, !dbg !93
  %21 = getelementptr inbounds double* %11, i64 %20, !dbg !93
  %22 = load double* %21, align 8, !dbg !93, !tbaa !89
  %23 = getelementptr inbounds double* %9, i64 %20, !dbg !93
  store double %22, double* %23, align 8, !dbg !93, !tbaa !89
  %24 = add nsw i64 %indvars.iv8, 2, !dbg !94
  %25 = getelementptr inbounds double* %11, i64 %24, !dbg !94
  %26 = load double* %25, align 8, !dbg !94, !tbaa !89
  %27 = getelementptr inbounds double* %9, i64 %24, !dbg !94
  store double %26, double* %27, align 8, !dbg !94, !tbaa !89
  %28 = add nsw i64 %indvars.iv8, 3, !dbg !95
  %29 = getelementptr inbounds double* %11, i64 %28, !dbg !95
  %30 = load double* %29, align 8, !dbg !95, !tbaa !89
  %31 = getelementptr inbounds double* %9, i64 %28, !dbg !95
  store double %30, double* %31, align 8, !dbg !95, !tbaa !89
  %32 = add nsw i32 %j.12, 4, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !36), !dbg !84
  %33 = icmp slt i32 %32, %N, !dbg !84
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 4, !dbg !84
  br i1 %33, label %.lr.ph3, label %._crit_edge, !dbg !84

._crit_edge:                                      ; preds = %.lr.ph3, %.preheader
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next11 to i32, !dbg !81
  %exitcond = icmp eq i32 %lftr.wideiv, %M, !dbg !81
  br i1 %exitcond, label %._crit_edge7, label %7, !dbg !81

._crit_edge7:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !96
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!41, !42}
!llvm.ident = !{!43}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c] [DW_LANG_C99]
!1 = metadata !{metadata !"array.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !26}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"new_Array2D_double", metadata !"new_Array2D_double", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double** (i32, i32)* @new_Array2D_double, null, null, metadata !12, i32 11} ; [ DW_TAG_subprogram ] [line 10] [def] [scope 11] [new_Array2D_double]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !11, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!13 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777226, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 10]
!14 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554442, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 10]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 12]
!16 = metadata !{i32 786688, metadata !4, metadata !"failed", metadata !5, i32 13, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [failed] [line 13]
!17 = metadata !{i32 786688, metadata !4, metadata !"A", metadata !5, i32 15, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [A] [line 15]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Array2D_double_delete", metadata !"Array2D_double_delete", metadata !"", i32 44, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double**)* @Array2D_double_delete, null, null, metadata !21, i32 45} ; [ DW_TAG_subprogram ] [line 44] [def] [scope 45] [Array2D_double_delete]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null, metadata !11, metadata !11, metadata !8}
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25}
!22 = metadata !{i32 786689, metadata !18, metadata !"M", metadata !5, i32 16777260, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 44]
!23 = metadata !{i32 786689, metadata !18, metadata !"N", metadata !5, i32 33554476, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 44]
!24 = metadata !{i32 786689, metadata !18, metadata !"A", metadata !5, i32 50331692, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 44]
!25 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 46, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 46]
!26 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Array2D_double_copy", metadata !"Array2D_double_copy", metadata !"", i32 56, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double**, double**)* @Array2D_double_copy, null, null, metadata !29, i32 57} ; [ DW_TAG_subprogram ] [line 56] [def] [scope 57] [Array2D_double_copy]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !11, metadata !11, metadata !8, metadata !8}
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !40}
!30 = metadata !{i32 786689, metadata !26, metadata !"M", metadata !5, i32 16777272, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 56]
!31 = metadata !{i32 786689, metadata !26, metadata !"N", metadata !5, i32 33554488, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 56]
!32 = metadata !{i32 786689, metadata !26, metadata !"B", metadata !5, i32 50331704, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [B] [line 56]
!33 = metadata !{i32 786689, metadata !26, metadata !"A", metadata !5, i32 67108920, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [A] [line 56]
!34 = metadata !{i32 786688, metadata !26, metadata !"remainder", metadata !5, i32 59, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [remainder] [line 59]
!35 = metadata !{i32 786688, metadata !26, metadata !"i", metadata !5, i32 60, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 60]
!36 = metadata !{i32 786688, metadata !26, metadata !"j", metadata !5, i32 61, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 61]
!37 = metadata !{i32 786688, metadata !38, metadata !"Bi", metadata !5, i32 65, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Bi] [line 65]
!38 = metadata !{i32 786443, metadata !1, metadata !39, i32 64, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!39 = metadata !{i32 786443, metadata !1, metadata !26, i32 63, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!40 = metadata !{i32 786688, metadata !38, metadata !"Ai", metadata !5, i32 66, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Ai] [line 66]
!41 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!42 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!43 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!44 = metadata !{i32 10, i32 0, metadata !4, null}
!45 = metadata !{i32 0}
!46 = metadata !{i32 12, i32 0, metadata !4, null}
!47 = metadata !{i32 13, i32 0, metadata !4, null}
!48 = metadata !{i32 15, i32 0, metadata !4, null}
!49 = metadata !{i32 16, i32 0, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!51 = metadata !{i32 19, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!53 = metadata !{i32 21, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !52, i32 20, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!55 = metadata !{metadata !56, metadata !56, i64 0}
!56 = metadata !{metadata !"any pointer", metadata !57, i64 0}
!57 = metadata !{metadata !"omnipotent char", metadata !58, i64 0}
!58 = metadata !{metadata !"Simple C/C++ TBAA"}
!59 = metadata !{i32 22, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !54, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!61 = metadata !{i32 36, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !63, i32 36, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!63 = metadata !{i32 786443, metadata !1, metadata !64, i32 34, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!64 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!65 = metadata !{i32 37, i32 0, metadata !62, null}
!66 = metadata !{i32 38, i32 0, metadata !63, null}
!67 = metadata !{i32 39, i32 0, metadata !63, null}
!68 = metadata !{i32 43, i32 0, metadata !4, null}
!69 = metadata !{i32 44, i32 0, metadata !18, null}
!70 = metadata !{i32 47, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !18, i32 47, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!72 = metadata !{i32 49, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !18, i32 49, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!74 = metadata !{i32 50, i32 0, metadata !73, null}
!75 = metadata !{i32 52, i32 0, metadata !18, null}
!76 = metadata !{i32 53, i32 0, metadata !18, null}
!77 = metadata !{i32 56, i32 0, metadata !26, null}
!78 = metadata !{i32 59, i32 0, metadata !26, null}
!79 = metadata !{i32 60, i32 0, metadata !26, null}
!80 = metadata !{i32 61, i32 0, metadata !26, null}
!81 = metadata !{i32 63, i32 0, metadata !39, null}
!82 = metadata !{i32 67, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !38, i32 67, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!84 = metadata !{i32 69, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !38, i32 69, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!86 = metadata !{i32 65, i32 0, metadata !38, null}
!87 = metadata !{i32 66, i32 0, metadata !38, null}
!88 = metadata !{i32 68, i32 0, metadata !83, null}
!89 = metadata !{metadata !90, metadata !90, i64 0}
!90 = metadata !{metadata !"double", metadata !57, i64 0}
!91 = metadata !{i32 71, i32 0, metadata !92, null}
!92 = metadata !{i32 786443, metadata !1, metadata !85, i32 70, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/array.c]
!93 = metadata !{i32 72, i32 0, metadata !92, null}
!94 = metadata !{i32 73, i32 0, metadata !92, null}
!95 = metadata !{i32 74, i32 0, metadata !92, null}
!96 = metadata !{i32 77, i32 0, metadata !26, null}
