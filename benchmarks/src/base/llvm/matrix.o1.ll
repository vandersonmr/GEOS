; ModuleID = 'matrix.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias i32** @mkmatrix(i32 %rows, i32 %cols) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !12), !dbg !72
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !13), !dbg !72
  tail call void @llvm.dbg.value(metadata !73, i64 0, metadata !16), !dbg !74
  %1 = sext i32 %rows to i64, !dbg !75
  %2 = shl nsw i64 %1, 3, !dbg !75
  %3 = tail call noalias i8* @malloc(i64 %2) #4, !dbg !75
  %4 = bitcast i8* %3 to i32**, !dbg !75
  tail call void @llvm.dbg.value(metadata !{i32** %4}, i64 0, metadata !17), !dbg !75
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !14), !dbg !77
  %5 = icmp sgt i32 %rows, 0, !dbg !77
  br i1 %5, label %.lr.ph6, label %._crit_edge7, !dbg !77

.lr.ph6:                                          ; preds = %0
  %6 = sext i32 %cols to i64, !dbg !79
  %7 = shl nsw i64 %6, 2, !dbg !79
  %8 = icmp sgt i32 %cols, 0, !dbg !81
  br label %9, !dbg !77

; <label>:9                                       ; preds = %18, %.lr.ph6
  %indvars.iv8 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next9, %18 ]
  %count.03 = phi i32 [ 1, %.lr.ph6 ], [ %count.1.lcssa, %18 ]
  %10 = tail call noalias i8* @malloc(i64 %7) #4, !dbg !79
  %11 = bitcast i8* %10 to i32*, !dbg !79
  %12 = getelementptr inbounds i32** %4, i64 %indvars.iv8, !dbg !79
  store i32* %11, i32** %12, align 8, !dbg !79, !tbaa !83
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !15), !dbg !81
  br i1 %8, label %.lr.ph, label %18, !dbg !81

.lr.ph:                                           ; preds = %9
  %13 = load i32** %12, align 8, !dbg !87, !tbaa !83
  br label %14, !dbg !81

; <label>:14                                      ; preds = %14, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %14 ]
  %count.12 = phi i32 [ %count.03, %.lr.ph ], [ %15, %14 ]
  %15 = add nsw i32 %count.12, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !16), !dbg !87
  %16 = getelementptr inbounds i32* %13, i64 %indvars.iv, !dbg !87
  store i32 %count.12, i32* %16, align 4, !dbg !87, !tbaa !89
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !81
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !81
  br i1 %exitcond, label %._crit_edge, label %14, !dbg !81

._crit_edge:                                      ; preds = %14
  %17 = add i32 %count.03, %cols, !dbg !81
  br label %18, !dbg !81

; <label>:18                                      ; preds = %._crit_edge, %9
  %count.1.lcssa = phi i32 [ %17, %._crit_edge ], [ %count.03, %9 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !77
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !77
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %rows, !dbg !77
  br i1 %exitcond11, label %._crit_edge7, label %9, !dbg !77

._crit_edge7:                                     ; preds = %18, %0
  ret i32** %4, !dbg !91
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @zeromatrix(i32 %rows, i32 %cols, i32** nocapture readonly %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !22), !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !23), !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !24), !dbg !92
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !25), !dbg !93
  %1 = icmp sgt i32 %rows, 0, !dbg !93
  br i1 %1, label %.preheader.lr.ph, label %._crit_edge3, !dbg !93

.preheader.lr.ph:                                 ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !95
  %3 = add i32 %cols, -1, !dbg !93
  %4 = zext i32 %3 to i64
  %5 = shl nuw nsw i64 %4, 2, !dbg !93
  %6 = add i64 %5, 4, !dbg !93
  br label %.preheader, !dbg !93

.preheader:                                       ; preds = %10, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %10 ]
  br i1 %2, label %._crit_edge, label %10, !dbg !95

._crit_edge:                                      ; preds = %.preheader
  %7 = getelementptr inbounds i32** %m, i64 %indvars.iv, !dbg !97
  %8 = load i32** %7, align 8, !dbg !97, !tbaa !83
  %9 = bitcast i32* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %6, i32 4, i1 false), !dbg !97
  br label %10, !dbg !95

; <label>:10                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !93
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !93
  %exitcond = icmp eq i32 %lftr.wideiv, %rows, !dbg !93
  br i1 %exitcond, label %._crit_edge3, label %.preheader, !dbg !93

._crit_edge3:                                     ; preds = %10, %0
  ret void, !dbg !98
}

; Function Attrs: nounwind uwtable
define void @freematrix(i32 %rows, i32** nocapture %m) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !31), !dbg !99
  tail call void @llvm.dbg.value(metadata !{i32** %m}, i64 0, metadata !32), !dbg !99
  %1 = icmp sgt i32 %rows, 0, !dbg !100
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !100

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %rows to i64
  br label %3, !dbg !100

; <label>:3                                       ; preds = %.lr.ph, %3
  %indvars.iv = phi i64 [ %2, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !100
  %4 = getelementptr inbounds i32** %m, i64 %indvars.iv.next, !dbg !101
  %5 = load i32** %4, align 8, !dbg !101, !tbaa !83
  %6 = bitcast i32* %5 to i8*, !dbg !101
  tail call void @free(i8* %6) #4, !dbg !101
  %7 = trunc i64 %indvars.iv.next to i32, !dbg !100
  %8 = icmp sgt i32 %7, 0, !dbg !100
  br i1 %8, label %3, label %._crit_edge, !dbg !100

._crit_edge:                                      ; preds = %3, %0
  %9 = bitcast i32** %m to i8*, !dbg !103
  tail call void @free(i8* %9) #4, !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32** @mmult(i32 %rows, i32 %cols, i32** nocapture readonly %m1, i32** nocapture readonly %m2, i32** readonly %m3) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %rows}, i64 0, metadata !37), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i32 %cols}, i64 0, metadata !38), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i32** %m1}, i64 0, metadata !39), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i32** %m2}, i64 0, metadata !40), !dbg !105
  tail call void @llvm.dbg.value(metadata !{i32** %m3}, i64 0, metadata !41), !dbg !105
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !42), !dbg !106
  %1 = icmp sgt i32 %rows, 0, !dbg !106
  br i1 %1, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !106

.preheader1.lr.ph:                                ; preds = %0
  %2 = icmp sgt i32 %cols, 0, !dbg !108
  %3 = icmp sgt i32 %cols, 0, !dbg !111
  br label %.preheader1, !dbg !106

.preheader1:                                      ; preds = %._crit_edge5, %.preheader1.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next13, %._crit_edge5 ]
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge5, !dbg !108

.preheader.lr.ph:                                 ; preds = %.preheader1
  %4 = getelementptr inbounds i32** %m3, i64 %indvars.iv12, !dbg !114
  %5 = load i32** %4, align 8, !dbg !114, !tbaa !83
  %6 = getelementptr inbounds i32** %m1, i64 %indvars.iv12, !dbg !115
  br label %.preheader, !dbg !108

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv8 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next9, %._crit_edge ]
  br i1 %3, label %.lr.ph, label %._crit_edge, !dbg !111

.lr.ph:                                           ; preds = %.preheader
  %7 = load i32** %6, align 8, !dbg !115, !tbaa !83
  br label %8, !dbg !111

; <label>:8                                       ; preds = %8, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %8 ]
  %val.03 = phi i32 [ 0, %.lr.ph ], [ %16, %8 ]
  %9 = getelementptr inbounds i32* %7, i64 %indvars.iv, !dbg !115
  %10 = load i32* %9, align 4, !dbg !115, !tbaa !89
  %11 = getelementptr inbounds i32** %m2, i64 %indvars.iv, !dbg !115
  %12 = load i32** %11, align 8, !dbg !115, !tbaa !83
  %13 = getelementptr inbounds i32* %12, i64 %indvars.iv8, !dbg !115
  %14 = load i32* %13, align 4, !dbg !115, !tbaa !89
  %15 = mul nsw i32 %14, %10, !dbg !115
  %16 = add nsw i32 %15, %val.03, !dbg !115
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !45), !dbg !115
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !111
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !111
  %exitcond = icmp eq i32 %lftr.wideiv, %cols, !dbg !111
  br i1 %exitcond, label %._crit_edge, label %8, !dbg !111

._crit_edge:                                      ; preds = %8, %.preheader
  %val.0.lcssa = phi i32 [ 0, %.preheader ], [ %16, %8 ]
  %17 = getelementptr inbounds i32* %5, i64 %indvars.iv8, !dbg !114
  store i32 %val.0.lcssa, i32* %17, align 4, !dbg !114, !tbaa !89
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !108
  %lftr.wideiv10 = trunc i64 %indvars.iv.next9 to i32, !dbg !108
  %exitcond11 = icmp eq i32 %lftr.wideiv10, %cols, !dbg !108
  br i1 %exitcond11, label %._crit_edge5, label %.preheader, !dbg !108

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !106
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !106
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %rows, !dbg !106
  br i1 %exitcond15, label %._crit_edge7, label %.preheader1, !dbg !106

._crit_edge7:                                     ; preds = %._crit_edge5, %0
  ret i32** %m3, !dbg !117
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !53), !dbg !118
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !54), !dbg !118
  %1 = icmp eq i32 %argc, 2, !dbg !119
  br i1 %1, label %2, label %6, !dbg !119

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !120
  %4 = load i8** %3, align 8, !dbg !120, !tbaa !83
  %5 = tail call i32 @atoi(i8* %4) #5, !dbg !120
  br label %6, !dbg !120

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 3000000, %0 ], !dbg !120
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !56), !dbg !120
  %8 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !121
  tail call void @llvm.dbg.value(metadata !{i32** %8}, i64 0, metadata !57), !dbg !121
  %9 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !122
  tail call void @llvm.dbg.value(metadata !{i32** %9}, i64 0, metadata !58), !dbg !122
  %10 = tail call i32** @mkmatrix(i32 10, i32 10), !dbg !123
  tail call void @llvm.dbg.value(metadata !{i32** %10}, i64 0, metadata !59), !dbg !123
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !55), !dbg !124
  %11 = icmp sgt i32 %7, 0, !dbg !124
  br i1 %11, label %.lr.ph, label %._crit_edge, !dbg !124

.lr.ph:                                           ; preds = %6, %.lr.ph
  %mm.02 = phi i32** [ %12, %.lr.ph ], [ %10, %6 ]
  %i.01 = phi i32 [ %13, %.lr.ph ], [ 0, %6 ]
  %12 = tail call i32** @mmult(i32 10, i32 10, i32** %8, i32** %9, i32** %mm.02), !dbg !126
  tail call void @llvm.dbg.value(metadata !{i32** %12}, i64 0, metadata !59), !dbg !126
  %13 = add nsw i32 %i.01, 1, !dbg !124
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !55), !dbg !124
  %exitcond = icmp eq i32 %13, %7, !dbg !124
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !124

._crit_edge:                                      ; preds = %.lr.ph, %6
  %mm.0.lcssa = phi i32** [ %10, %6 ], [ %12, %.lr.ph ]
  %14 = load i32** %mm.0.lcssa, align 8, !dbg !128, !tbaa !83
  %15 = load i32* %14, align 4, !dbg !128, !tbaa !89
  %16 = getelementptr inbounds i32** %mm.0.lcssa, i64 2, !dbg !128
  %17 = load i32** %16, align 8, !dbg !128, !tbaa !83
  %18 = getelementptr inbounds i32* %17, i64 3, !dbg !128
  %19 = load i32* %18, align 4, !dbg !128, !tbaa !89
  %20 = getelementptr inbounds i32** %mm.0.lcssa, i64 3, !dbg !128
  %21 = load i32** %20, align 8, !dbg !128, !tbaa !83
  %22 = getelementptr inbounds i32* %21, i64 2, !dbg !128
  %23 = load i32* %22, align 4, !dbg !128, !tbaa !89
  %24 = getelementptr inbounds i32** %mm.0.lcssa, i64 4, !dbg !128
  %25 = load i32** %24, align 8, !dbg !128, !tbaa !83
  %26 = getelementptr inbounds i32* %25, i64 4, !dbg !128
  %27 = load i32* %26, align 4, !dbg !128, !tbaa !89
  %28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %15, i32 %19, i32 %23, i32 %27) #4, !dbg !128
  tail call void @freematrix(i32 10, i32** %8), !dbg !129
  tail call void @freematrix(i32 10, i32** %9), !dbg !130
  tail call void @freematrix(i32 10, i32** %mm.0.lcssa), !dbg !131
  ret i32 0, !dbg !132
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #2 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !68), !dbg !133
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #4, !dbg !134
  %2 = trunc i64 %1 to i32, !dbg !134
  ret i32 %2, !dbg !134
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!69, !70}
!llvm.ident = !{!71}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c] [DW_LANG_C99]
!1 = metadata !{metadata !"matrix.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !18, metadata !27, metadata !33, metadata !46, metadata !60}
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
!60 = metadata !{i32 786478, metadata !61, metadata !62, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !67, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!61 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!62 = metadata !{i32 786473, metadata !61}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !10, metadata !65}
!65 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!66 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786689, metadata !60, metadata !"__nptr", metadata !62, i32 16777494, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!69 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!70 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!71 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!72 = metadata !{i32 12, i32 0, metadata !4, null}
!73 = metadata !{i32 1}
!74 = metadata !{i32 13, i32 0, metadata !4, null}
!75 = metadata !{i32 14, i32 0, metadata !4, null}
!76 = metadata !{i32 0}
!77 = metadata !{i32 15, i32 0, metadata !78, null}
!78 = metadata !{i32 786443, metadata !1, metadata !4, i32 15, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!79 = metadata !{i32 16, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !78, i32 15, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!81 = metadata !{i32 17, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !80, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!83 = metadata !{metadata !84, metadata !84, i64 0}
!84 = metadata !{metadata !"any pointer", metadata !85, i64 0}
!85 = metadata !{metadata !"omnipotent char", metadata !86, i64 0}
!86 = metadata !{metadata !"Simple C/C++ TBAA"}
!87 = metadata !{i32 18, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !82, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!89 = metadata !{metadata !90, metadata !90, i64 0}
!90 = metadata !{metadata !"int", metadata !85, i64 0}
!91 = metadata !{i32 21, i32 0, metadata !4, null}
!92 = metadata !{i32 24, i32 0, metadata !18, null}
!93 = metadata !{i32 26, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !18, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!95 = metadata !{i32 27, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !94, i32 27, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!97 = metadata !{i32 28, i32 0, metadata !96, null}
!98 = metadata !{i32 29, i32 0, metadata !18, null}
!99 = metadata !{i32 31, i32 0, metadata !27, null}
!100 = metadata !{i32 32, i32 0, metadata !27, null}
!101 = metadata !{i32 32, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !1, metadata !27, i32 32, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!103 = metadata !{i32 33, i32 0, metadata !27, null}
!104 = metadata !{i32 34, i32 0, metadata !27, null}
!105 = metadata !{i32 36, i32 0, metadata !33, null}
!106 = metadata !{i32 38, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !33, i32 38, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!108 = metadata !{i32 39, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !110, i32 39, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!110 = metadata !{i32 786443, metadata !1, metadata !107, i32 38, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!111 = metadata !{i32 41, i32 0, metadata !112, null}
!112 = metadata !{i32 786443, metadata !1, metadata !113, i32 41, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!113 = metadata !{i32 786443, metadata !1, metadata !109, i32 39, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!114 = metadata !{i32 44, i32 0, metadata !113, null}
!115 = metadata !{i32 42, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !112, i32 41, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!117 = metadata !{i32 47, i32 0, metadata !33, null}
!118 = metadata !{i32 50, i32 0, metadata !46, null}
!119 = metadata !{i32 56, i32 0, metadata !46, null}
!120 = metadata !{i32 56, i32 31, metadata !46, null}
!121 = metadata !{i32 58, i32 0, metadata !46, null} ; [ DW_TAG_imported_module ]
!122 = metadata !{i32 59, i32 0, metadata !46, null}
!123 = metadata !{i32 60, i32 0, metadata !46, null}
!124 = metadata !{i32 62, i32 0, metadata !125, null}
!125 = metadata !{i32 786443, metadata !1, metadata !46, i32 62, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!126 = metadata !{i32 63, i32 0, metadata !127, null}
!127 = metadata !{i32 786443, metadata !1, metadata !125, i32 62, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/matrix.c]
!128 = metadata !{i32 65, i32 0, metadata !46, null}
!129 = metadata !{i32 67, i32 0, metadata !46, null}
!130 = metadata !{i32 68, i32 0, metadata !46, null}
!131 = metadata !{i32 69, i32 0, metadata !46, null}
!132 = metadata !{i32 70, i32 0, metadata !46, null}
!133 = metadata !{i32 278, i32 0, metadata !60, null}
!134 = metadata !{i32 280, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !61, metadata !60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
