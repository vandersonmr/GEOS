; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define noalias i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !12), !dbg !63
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !13), !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !16), !dbg !65
  %1 = sext i32 %rows to i64, !dbg !66
  %2 = shl nsw i64 %1, 3, !dbg !66
  %3 = tail call noalias i8* @malloc(i64 %2) #5, !dbg !66
  %4 = bitcast i8* %3 to i32**, !dbg !66
  tail call void @llvm.dbg.value(metadata !{i32** %4}, i64 0, metadata !17), !dbg !66
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !14), !dbg !68
  %5 = icmp sgt i32 %rows, 0, !dbg !68
  br i1 %5, label %.lr.ph6, label %._crit_edge7, !dbg !68

.lr.ph6:                                          ; preds = %0
  %6 = sext i32 %cols to i64, !dbg !70
  %7 = shl nsw i64 %6, 2, !dbg !70
  %8 = icmp sgt i32 %cols, 0, !dbg !72
  br label %9, !dbg !68

; <label>:9                                       ; preds = %16, %.lr.ph6
  %indvars.iv8 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next9, %16 ]
  %count.03 = phi i32 [ 1, %.lr.ph6 ], [ %count.1.lcssa, %16 ]
  %10 = tail call noalias i8* @malloc(i64 %7) #5, !dbg !70
  %11 = bitcast i8* %10 to i32*, !dbg !70
  %12 = getelementptr inbounds i32** %4, i64 %indvars.iv8, !dbg !70
  store i32* %11, i32** %12, align 8, !dbg !70, !tbaa !74
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !15), !dbg !72
  br i1 %8, label %.lr.ph, label %16, !dbg !72

.lr.ph:                                           ; preds = %9, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %9 ]
  %count.12 = phi i32 [ %13, %.lr.ph ], [ %count.03, %9 ]
  %13 = add nsw i32 %count.12, 1, !dbg !78
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !16), !dbg !78
  %14 = getelementptr inbounds i32* %11, i64 %indvars.iv, !dbg !78
  store i32 %count.12, i32* %14, align 4, !dbg !78, !tbaa !80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !72
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !72
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !72

._crit_edge:                                      ; preds = %.lr.ph
  %15 = add i32 %count.03, %cols, !dbg !72
  br label %16, !dbg !72

; <label>:16                                      ; preds = %._crit_edge, %9
  %count.1.lcssa = phi i32 [ %15, %._crit_edge ], [ %count.03, %9 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !68
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !68
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %rows, !dbg !68
  br i1 %exitcond11, label %._crit_edge7, label %9, !dbg !68

._crit_edge7:                                     ; preds = %16, %0
  ret i32** %4, !dbg !82
}

; Function Attrs: minsize nounwind optsize
declare noalias i8* @malloc(i64) #1

; Function Attrs: minsize nounwind optsize uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** nocapture readonly %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !22), !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !23), !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !24), !dbg !83
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !25), !dbg !84
  %1 = icmp sgt i32 %rows, 0, !dbg !84
  br i1 %1, label %.preheader.lr.ph, label %._crit_edge3, !dbg !84

.preheader.lr.ph:                                 ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !86
  %3 = add i32 %cols, -1, !dbg !84
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i64 %4, 2, !dbg !84
  %6 = add i64 %5, 4, !dbg !84
  br label %.preheader, !dbg !84

.preheader:                                       ; preds = %10, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %10 ]
  br i1 %2, label %.lr.ph, label %10, !dbg !86

.lr.ph:                                           ; preds = %.preheader
  %7 = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !88
  %8 = load i32** %7, align 8, !dbg !88, !tbaa !74
  %9 = bitcast i32* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %6, i32 4, i1 false), !dbg !88
  br label %10, !dbg !86

; <label>:10                                      ; preds = %.lr.ph, %.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !84
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !84
  %exitcond = icmp eq i32 %lftr.wideiv, %rows, !dbg !84
  br i1 %exitcond, label %._crit_edge3, label %.preheader, !dbg !84

._crit_edge3:                                     ; preds = %10, %0
  ret void, !dbg !89
}

; Function Attrs: minsize nounwind optsize uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !31), !dbg !90
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !32), !dbg !90
  %1 = icmp sgt i32 %rows, 0, !dbg !91
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !91

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %rows to i64
  br label %3, !dbg !91

; <label>:3                                       ; preds = %.lr.ph, %3
  %indvars.iv = phi i64 [ %2, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !91
  %4 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !92
  %5 = load i32** %4, align 8, !dbg !92, !tbaa !74
  %6 = bitcast i32* %5 to i8*, !dbg !92
  tail call void @free(i8* %6) #5, !dbg !92
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !91
  %8 = icmp sgt i32 %7, 0, !dbg !91
  br i1 %8, label %3, label %._crit_edge, !dbg !91

._crit_edge:                                      ; preds = %3, %0
  %9 = bitcast i32** %m to i8*, !dbg !94
  tail call void @free(i8* %9) #5, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !37), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !38), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32** %m1}, i64 0, metadata !39), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32** %m2}, i64 0, metadata !40), !dbg !96
  tail call void @llvm.dbg.value(metadata !{i32** %m3}, i64 0, metadata !41), !dbg !96
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !42), !dbg !97
  %1 = icmp sgt i32 %rows, 0, !dbg !97
  br i1 %1, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !97

.preheader1.lr.ph:                                ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !99
  br label %.preheader1, !dbg !97

.preheader1:                                      ; preds = %._crit_edge5, %.preheader1.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next13, %._crit_edge5 ]
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge5, !dbg !99

.preheader.lr.ph:                                 ; preds = %.preheader1
  %3 = getelementptr inbounds i32** %m3, i64 %indvars.iv12, !dbg !102
  %4 = load i32** %3, align 8, !dbg !102, !tbaa !74
  %5 = getelementptr inbounds i32** %m1, i64 %indvars.iv12, !dbg !104
  br label %.lr.ph, !dbg !99

.lr.ph:                                           ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv8 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next9, %._crit_edge ]
  %6 = load i32** %5, align 8, !dbg !104, !tbaa !74
  br label %7, !dbg !107

; <label>:7                                       ; preds = %7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %7 ]
  %val.03 = phi i32 [ 0, %.lr.ph ], [ %15, %7 ]
  %8 = getelementptr inbounds i32* %6, i64 %indvars.iv, !dbg !104
  %9 = load i32* %8, align 4, !dbg !104, !tbaa !80
  %10 = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !104
  %11 = load i32** %10, align 8, !dbg !104, !tbaa !74
  %12 = getelementptr inbounds i32* %11, i64 %indvars.iv8, !dbg !104
  %13 = load i32* %12, align 4, !dbg !104, !tbaa !80
  %14 = mul nsw i32 %13, %9, !dbg !104
  %15 = add nsw i32 %14, %val.03, !dbg !104
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !45), !dbg !104
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !107
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !107
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !107
  br i1 %exitcond, label %._crit_edge, label %7, !dbg !107

._crit_edge:                                      ; preds = %7
  %16 = getelementptr inbounds i32* %4, i64 %indvars.iv8, !dbg !102
  store i32 %15, i32* %16, align 4, !dbg !102, !tbaa !80
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !99
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !99
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %cols, !dbg !99
  br i1 %exitcond11, label %._crit_edge5, label %.lr.ph, !dbg !99

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !97
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !97
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %rows, !dbg !97
  br i1 %exitcond15, label %._crit_edge7, label %.preheader1, !dbg !97

._crit_edge7:                                     ; preds = %._crit_edge5, %0
  ret i32** %m3, !dbg !108
}

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !53), !dbg !109
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !54), !dbg !109
  %1 = icmp eq i32 %argc, 2, !dbg !110
  br i1 %1, label %2, label %6, !dbg !110

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !110
  %4 = load i8** %3, align 8, !dbg !110, !tbaa !74
  %5 = tail call i32 @atoi(i8* %4) #6, !dbg !110
  br label %6, !dbg !110

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 3000000, %0 ], !dbg !110
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !56), !dbg !110
  %8 = tail call i32** @mkmatrix(i32 10, i32 10) #7, !dbg !111
  tail call void @llvm.dbg.value(metadata !{i32** %8}, i64 0, metadata !57), !dbg !111
  %9 = tail call i32** @mkmatrix(i32 10, i32 10) #7, !dbg !112
  tail call void @llvm.dbg.value(metadata !{i32** %9}, i64 0, metadata !58), !dbg !112
  %10 = tail call i32** @mkmatrix(i32 10, i32 10) #7, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !59), !dbg !113
  tail call void @llvm.dbg.value(metadata !67, i64 0, metadata !55), !dbg !114
  %11 = icmp sgt i32 %7, 0, !dbg !114
  br i1 %11, label %.lr.ph, label %._crit_edge, !dbg !114

.lr.ph:                                           ; preds = %6, %.lr.ph
  %mm.02 = phi i32** [ %12, %.lr.ph ], [ %10, %6 ]
  %i.01 = phi i32 [ %13, %.lr.ph ], [ 0, %6 ]
  %12 = tail call i32** @mmult(i32 10, i32 10, i32** %8, i32** %9, i32** %mm.02) #7, !dbg !116
  tail call void @llvm.dbg.value(metadata !{i32** %12}, i64 0, metadata !59), !dbg !116
  %13 = add nsw i32 %i.01, 1, !dbg !114
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !55), !dbg !114
  %exitcond = icmp eq i32 %13, %7, !dbg !114
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !114

._crit_edge:                                      ; preds = %.lr.ph, %6
  %mm.0.lcssa = phi i32** [ %10, %6 ], [ %12, %.lr.ph ]
  %14 = load i32** %mm.0.lcssa, align 8, !dbg !118, !tbaa !74
  %15 = load i32* %14, align 4, !dbg !118, !tbaa !80
  %16 = getelementptr inbounds i32** %mm.0.lcssa, i64 2, !dbg !118
  %17 = load i32** %16, align 8, !dbg !118, !tbaa !74
  %18 = getelementptr inbounds i32* %17, i64 3, !dbg !118
  %19 = load i32* %18, align 4, !dbg !118, !tbaa !80
  %20 = getelementptr inbounds i32** %mm.0.lcssa, i64 3, !dbg !118
  %21 = load i32** %20, align 8, !dbg !118, !tbaa !74
  %22 = getelementptr inbounds i32* %21, i64 2, !dbg !118
  %23 = load i32* %22, align 4, !dbg !118, !tbaa !80
  %24 = getelementptr inbounds i32** %mm.0.lcssa, i64 4, !dbg !118
  %25 = load i32** %24, align 8, !dbg !118, !tbaa !74
  %26 = getelementptr inbounds i32* %25, i64 4, !dbg !118
  %27 = load i32* %26, align 4, !dbg !118, !tbaa !80
  %28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %15, i32 %19, i32 %23, i32 %27) #5, !dbg !118
  tail call void @freematrix(i32 10, i32** %8) #7, !dbg !119
  tail call void @freematrix(i32 10, i32** %9) #7, !dbg !120
  tail call void @freematrix(i32 10, i32** %mm.0.lcssa) #7, !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize }
attributes #6 = { minsize nounwind optsize readonly }
attributes #7 = { minsize optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!60, !61}
!llvm.ident = !{!62}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = metadata !{metadata !"matrix.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !27, metadata !33, metadata !46}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mkmatrix", metadata !"mkmatrix", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32** (i32, i32)* @mkmatrix, null, null, metadata !11, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [mkmatrix]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !10, metadata !10}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!12 = metadata !{i32 786689, metadata !4, metadata !"rows", metadata !5, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 12]
!13 = metadata !{i32 786689, metadata !4, metadata !"cols", metadata !5, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 12]
!14 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 13]
!15 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 13]
!16 = metadata !{i32 786688, metadata !4, metadata !"count", metadata !5, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 13]
!17 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 14]
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"zeromatrix", metadata !"zeromatrix", metadata !"", i32 24, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32**)* @zeromatrix, null, null, metadata !21, i32 24} ; [ DW_TAG_subprogram ] [line 24] [def] [zeromatrix]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{null, metadata !10, metadata !10, metadata !8}
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26}
!22 = metadata !{i32 786689, metadata !18, metadata !"rows", metadata !5, i32 16777240, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 24]
!23 = metadata !{i32 786689, metadata !18, metadata !"cols", metadata !5, i32 33554456, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 24]
!24 = metadata !{i32 786689, metadata !18, metadata !"m", metadata !5, i32 50331672, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 24]
!25 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!26 = metadata !{i32 786688, metadata !18, metadata !"j", metadata !5, i32 25, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!27 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"freematrix", metadata !"freematrix", metadata !"", i32 31, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32**)* @freematrix, null, null, metadata !30, i32 31} ; [ DW_TAG_subprogram ] [line 31] [def] [freematrix]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{null, metadata !10, metadata !8}
!30 = metadata !{metadata !31, metadata !32}
!31 = metadata !{i32 786689, metadata !27, metadata !"rows", metadata !5, i32 16777247, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 31]
!32 = metadata !{i32 786689, metadata !27, metadata !"m", metadata !5, i32 33554463, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m] [line 31]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mmult", metadata !"mmult", metadata !"", i32 36, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32** (i32, i32, i32**, i32**, i32**)* @mmult, null, null, metadata !36, i32 36} ; [ DW_TAG_subprogram ] [line 36] [def] [mmult]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !8, metadata !10, metadata !10, metadata !8, metadata !8, metadata !8}
!36 = metadata !{metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45}
!37 = metadata !{i32 786689, metadata !33, metadata !"rows", metadata !5, i32 16777252, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rows] [line 36]
!38 = metadata !{i32 786689, metadata !33, metadata !"cols", metadata !5, i32 33554468, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cols] [line 36]
!39 = metadata !{i32 786689, metadata !33, metadata !"m1", metadata !5, i32 50331684, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m1] [line 36]
!40 = metadata !{i32 786689, metadata !33, metadata !"m2", metadata !5, i32 67108900, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m2] [line 36]
!41 = metadata !{i32 786689, metadata !33, metadata !"m3", metadata !5, i32 83886116, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [m3] [line 36]
!42 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 37]
!43 = metadata !{i32 786688, metadata !33, metadata !"j", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 37]
!44 = metadata !{i32 786688, metadata !33, metadata !"k", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 37]
!45 = metadata !{i32 786688, metadata !33, metadata !"val", metadata !5, i32 37, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [val] [line 37]
!46 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 50, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !52, i32 50} ; [ DW_TAG_subprogram ] [line 50] [def] [main]
!47 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = metadata !{metadata !10, metadata !10, metadata !49}
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!51 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!52 = metadata !{metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !59}
!53 = metadata !{i32 786689, metadata !46, metadata !"argc", metadata !5, i32 16777266, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 50]
!54 = metadata !{i32 786689, metadata !46, metadata !"argv", metadata !5, i32 33554482, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 50]
!55 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!56 = metadata !{i32 786688, metadata !46, metadata !"n", metadata !5, i32 56, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 56]
!57 = metadata !{i32 786688, metadata !46, metadata !"m1", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m1] [line 58]
!58 = metadata !{i32 786688, metadata !46, metadata !"m2", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 59]
!59 = metadata !{i32 786688, metadata !46, metadata !"mm", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mm] [line 60]
!60 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!61 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!62 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!63 = metadata !{i32 12, i32 0, metadata !4, null}
!64 = metadata !{i32 1}
!65 = metadata !{i32 13, i32 0, metadata !4, null}
!66 = metadata !{i32 14, i32 0, metadata !4, null}
!67 = metadata !{i32 0}
!68 = metadata !{i32 15, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!70 = metadata !{i32 16, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 15, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!72 = metadata !{i32 17, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !71, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!74 = metadata !{metadata !75, metadata !75, i64 0}
!75 = metadata !{metadata !"any pointer", metadata !76, i64 0}
!76 = metadata !{metadata !"omnipotent char", metadata !77, i64 0}
!77 = metadata !{metadata !"Simple C/C++ TBAA"}
!78 = metadata !{i32 18, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !73, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!80 = metadata !{metadata !81, metadata !81, i64 0}
!81 = metadata !{metadata !"int", metadata !76, i64 0}
!82 = metadata !{i32 21, i32 0, metadata !4, null}
!83 = metadata !{i32 24, i32 0, metadata !18, null}
!84 = metadata !{i32 26, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !18, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!86 = metadata !{i32 27, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!88 = metadata !{i32 28, i32 0, metadata !87, null}
!89 = metadata !{i32 29, i32 0, metadata !18, null}
!90 = metadata !{i32 31, i32 0, metadata !27, null}
!91 = metadata !{i32 32, i32 0, metadata !27, null}
!92 = metadata !{i32 32, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !27, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!94 = metadata !{i32 33, i32 0, metadata !27, null}
!95 = metadata !{i32 34, i32 0, metadata !27, null}
!96 = metadata !{i32 36, i32 0, metadata !33, null}
!97 = metadata !{i32 38, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !33, i32 38, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!99 = metadata !{i32 39, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !101, i32 39, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!101 = metadata !{i32 786443, metadata !1, metadata !98, i32 38, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!102 = metadata !{i32 44, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !100, i32 39, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!104 = metadata !{i32 42, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !106, i32 41, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!106 = metadata !{i32 786443, metadata !1, metadata !103, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!107 = metadata !{i32 41, i32 0, metadata !106, null}
!108 = metadata !{i32 47, i32 0, metadata !33, null}
!109 = metadata !{i32 50, i32 0, metadata !46, null}
!110 = metadata !{i32 56, i32 0, metadata !46, null}
!111 = metadata !{i32 58, i32 0, metadata !46, null} ; [ DW_TAG_imported_module ]
!112 = metadata !{i32 59, i32 0, metadata !46, null}
!113 = metadata !{i32 60, i32 0, metadata !46, null}
!114 = metadata !{i32 62, i32 0, metadata !115, null}
!115 = metadata !{i32 786443, metadata !1, metadata !46, i32 62, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!116 = metadata !{i32 63, i32 0, metadata !117, null}
!117 = metadata !{i32 786443, metadata !1, metadata !115, i32 62, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!118 = metadata !{i32 65, i32 0, metadata !46, null}
!119 = metadata !{i32 67, i32 0, metadata !46, null}
!120 = metadata !{i32 68, i32 0, metadata !46, null}
!121 = metadata !{i32 69, i32 0, metadata !46, null}
!122 = metadata !{i32 70, i32 0, metadata !46, null}
