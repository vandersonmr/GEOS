; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !51
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !51
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !15), !dbg !53
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !54) #3, !dbg !56
  tail call void @llvm.dbg.value(metadata !57, i64 0, metadata !58) #3, !dbg !59
  %1 = tail call noalias i8* @calloc(i64 11, i64 4) #4, !dbg !60
  %2 = tail call noalias i8* @calloc(i64 11, i64 4) #4, !dbg !61
  %3 = bitcast i8* %2 to i32*, !dbg !61
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !62) #3, !dbg !61
  %4 = tail call noalias i8* @calloc(i64 11, i64 4) #4, !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !65) #3, !dbg !66
  br label %9, !dbg !66

.preheader4.i:                                    ; preds = %9
  %5 = bitcast i8* %1 to i32*, !dbg !60
  %6 = bitcast i8* %4 to i32*, !dbg !63
  %7 = getelementptr inbounds i8* %2, i64 40, !dbg !68
  %8 = bitcast i8* %7 to i32*, !dbg !68
  %scevgep.i = getelementptr i8* %1, i64 4
  %scevgep34.i = getelementptr i8* %2, i64 4
  br label %.loopexit.i, !dbg !69

; <label>:9                                       ; preds = %9, %0
  %indvars.iv47.i = phi i64 [ 0, %0 ], [ %indvars.iv.next48.i, %9 ]
  %10 = getelementptr inbounds i32* %3, i64 %indvars.iv47.i, !dbg !66
  %11 = trunc i64 %indvars.iv47.i to i32, !dbg !66
  store i32 %11, i32* %10, align 4, !dbg !66, !tbaa !71
  %indvars.iv.next48.i = add nuw nsw i64 %indvars.iv47.i, 1, !dbg !66
  %exitcond49.i = icmp eq i64 %indvars.iv.next48.i, 11, !dbg !66
  br i1 %exitcond49.i, label %.preheader4.i, label %9, !dbg !66

.loopexit.i:                                      ; preds = %._crit_edge18.i, %.preheader4.i
  %r.0.i = phi i32 [ 11, %.preheader4.i ], [ %53, %._crit_edge18.i ]
  %didpr.0.i = phi i32 [ 0, %.preheader4.i ], [ %didpr.1.ph.i, %._crit_edge18.i ]
  %flipsMax.0.i = phi i64 [ 0, %.preheader4.i ], [ %flipsMax.1.ph.i, %._crit_edge18.i ]
  %12 = icmp slt i32 %didpr.0.i, 30, !dbg !69
  br i1 %12, label %.preheader3.i, label %.preheader2.i, !dbg !69

.preheader3.i:                                    ; preds = %.loopexit.i, %.preheader3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.preheader3.i ], [ 0, %.loopexit.i ]
  %13 = getelementptr inbounds i32* %3, i64 %indvars.iv.i, !dbg !75
  %14 = load i32* %13, align 4, !dbg !75, !tbaa !71
  %15 = add nsw i32 %14, 1, !dbg !75
  %16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %15) #4, !dbg !75
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !75
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 11, !dbg !75
  br i1 %exitcond.i, label %17, label %.preheader3.i, !dbg !75

; <label>:17                                      ; preds = %.preheader3.i
  %putchar.i = tail call i32 @putchar(i32 10) #3, !dbg !78
  %18 = add nsw i32 %didpr.0.i, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !80) #3, !dbg !79
  br label %.preheader2.i, !dbg !81

.preheader2.i:                                    ; preds = %17, %.loopexit.i
  %didpr.1.ph.i = phi i32 [ %didpr.0.i, %.loopexit.i ], [ %18, %17 ]
  %19 = icmp eq i32 %r.0.i, 1, !dbg !82
  br i1 %19, label %._crit_edge.i, label %.lr.ph.i, !dbg !82

.lr.ph.i:                                         ; preds = %.preheader2.i
  %20 = sext i32 %r.0.i to i64
  br label %21, !dbg !82

; <label>:21                                      ; preds = %21, %.lr.ph.i
  %indvars.iv29.i = phi i64 [ %20, %.lr.ph.i ], [ %indvars.iv.next30.i, %21 ]
  %indvars.iv.next30.i = add nsw i64 %indvars.iv29.i, -1, !dbg !82
  %22 = getelementptr inbounds i32* %6, i64 %indvars.iv.next30.i, !dbg !84
  %23 = trunc i64 %indvars.iv29.i to i32, !dbg !84
  store i32 %23, i32* %22, align 4, !dbg !84, !tbaa !71
  tail call void @llvm.dbg.value(metadata !86, i64 0, metadata !87) #3, !dbg !82
  %24 = trunc i64 %indvars.iv.next30.i to i32, !dbg !82
  %25 = icmp eq i32 %24, 1, !dbg !82
  br i1 %25, label %._crit_edge.i, label %21, !dbg !82

._crit_edge.i:                                    ; preds = %21, %.preheader2.i
  %26 = load i32* %3, align 4, !dbg !68, !tbaa !71
  %27 = icmp eq i32 %26, 0, !dbg !68
  br i1 %27, label %.lr.ph20.i, label %28, !dbg !68

; <label>:28                                      ; preds = %._crit_edge.i
  %29 = load i32* %8, align 4, !dbg !68, !tbaa !71
  %30 = icmp eq i32 %29, 10, !dbg !68
  br i1 %30, label %.lr.ph20.i, label %.preheader1.i, !dbg !68

.preheader1.i:                                    ; preds = %28
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep.i, i8* %scevgep34.i, i64 40, i32 4, i1 false) #3, !dbg !88
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !91) #3, !dbg !92
  br label %31, !dbg !93

; <label>:31                                      ; preds = %._crit_edge14.i, %.preheader1.i
  %k.0.i = phi i32 [ %26, %.preheader1.i ], [ %44, %._crit_edge14.i ]
  %flips.0.i = phi i64 [ 0, %.preheader1.i ], [ %41, %._crit_edge14.i ]
  tail call void @llvm.dbg.value(metadata !86, i64 0, metadata !65) #3, !dbg !94
  %j.09.i = add i32 %k.0.i, -1, !dbg !94
  %32 = icmp sgt i32 %j.09.i, 1, !dbg !94
  br i1 %32, label %.lr.ph13.i, label %._crit_edge14.i, !dbg !94

.lr.ph13.i:                                       ; preds = %31
  %33 = sext i32 %j.09.i to i64
  br label %34, !dbg !94

; <label>:34                                      ; preds = %34, %.lr.ph13.i
  %indvars.iv38.i = phi i64 [ 1, %.lr.ph13.i ], [ %indvars.iv.next39.i, %34 ]
  %indvars.iv35.i = phi i64 [ %33, %.lr.ph13.i ], [ %indvars.iv.next36.i, %34 ]
  %j.011.i = phi i32 [ %j.09.i, %.lr.ph13.i ], [ %j.0.i, %34 ]
  %35 = getelementptr inbounds i32* %5, i64 %indvars.iv38.i, !dbg !95
  %36 = load i32* %35, align 4, !dbg !95, !tbaa !71
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !96) #3, !dbg !95
  %37 = getelementptr inbounds i32* %5, i64 %indvars.iv35.i, !dbg !95
  %38 = load i32* %37, align 4, !dbg !95, !tbaa !71
  store i32 %38, i32* %35, align 4, !dbg !95, !tbaa !71
  store i32 %36, i32* %37, align 4, !dbg !95, !tbaa !71
  %indvars.iv.next39.i = add nuw nsw i64 %indvars.iv38.i, 1, !dbg !94
  %j.0.i = add nsw i32 %j.011.i, -1, !dbg !94
  %39 = trunc i64 %indvars.iv.next39.i to i32, !dbg !94
  %40 = icmp slt i32 %39, %j.0.i, !dbg !94
  %indvars.iv.next36.i = add nsw i64 %indvars.iv35.i, -1, !dbg !94
  br i1 %40, label %34, label %._crit_edge14.i, !dbg !94

._crit_edge14.i:                                  ; preds = %34, %31
  %41 = add nsw i64 %flips.0.i, 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i64 %41}, i64 0, metadata !98) #3, !dbg !97
  %42 = sext i32 %k.0.i to i64, !dbg !99
  %43 = getelementptr inbounds i32* %5, i64 %42, !dbg !99
  %44 = load i32* %43, align 4, !dbg !99, !tbaa !71
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !100) #3, !dbg !99
  store i32 %k.0.i, i32* %43, align 4, !dbg !99, !tbaa !71
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !91) #3, !dbg !99
  %45 = icmp eq i32 %44, 0, !dbg !101
  br i1 %45, label %46, label %31, !dbg !101

; <label>:46                                      ; preds = %._crit_edge14.i
  %47 = icmp slt i64 %flipsMax.0.i, %41, !dbg !102
  tail call void @llvm.dbg.value(metadata !{i64 %41}, i64 0, metadata !104) #3, !dbg !105
  %.flipsMax.0.i = select i1 %47, i64 %41, i64 %flipsMax.0.i, !dbg !102
  br label %.lr.ph20.i, !dbg !102

.lr.ph20.i:                                       ; preds = %46, %28, %._crit_edge.i
  %flipsMax.1.ph.i = phi i64 [ %.flipsMax.0.i, %46 ], [ %flipsMax.0.i, %._crit_edge.i ], [ %flipsMax.0.i, %28 ]
  br label %51, !dbg !107

; <label>:48                                      ; preds = %._crit_edge18.i
  %49 = trunc i64 %indvars.iv.next46.i to i32, !dbg !107
  %50 = icmp eq i32 %49, 11, !dbg !107
  br i1 %50, label %fannkuch.exit, label %._crit_edge50.i, !dbg !107

._crit_edge50.i:                                  ; preds = %48
  %.pre.i = load i32* %3, align 4, !dbg !109, !tbaa !71
  br label %51, !dbg !107

; <label>:51                                      ; preds = %._crit_edge50.i, %.lr.ph20.i
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge50.i ], [ 1, %.lr.ph20.i ]
  %52 = phi i32 [ %.pre.i, %._crit_edge50.i ], [ %26, %.lr.ph20.i ]
  %indvars.iv45.i = phi i64 [ %indvars.iv.next46.i, %._crit_edge50.i ], [ 1, %.lr.ph20.i ]
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !110) #3, !dbg !109
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !65) #3, !dbg !111
  %53 = trunc i64 %indvars.iv45.i to i32, !dbg !112
  %54 = icmp sgt i32 %53, 0, !dbg !112
  br i1 %54, label %.lr.ph17.i, label %._crit_edge18.i, !dbg !112

.lr.ph17.i:                                       ; preds = %51, %.lr.ph17.i
  %indvars.iv40.i = phi i64 [ %indvars.iv.next41.i, %.lr.ph17.i ], [ 0, %51 ]
  %indvars.iv.next41.i = add nuw nsw i64 %indvars.iv40.i, 1, !dbg !112
  %55 = getelementptr inbounds i32* %3, i64 %indvars.iv.next41.i, !dbg !113
  %56 = load i32* %55, align 4, !dbg !113, !tbaa !71
  %57 = getelementptr inbounds i32* %3, i64 %indvars.iv40.i, !dbg !113
  store i32 %56, i32* %57, align 4, !dbg !113, !tbaa !71
  %lftr.wideiv = trunc i64 %indvars.iv.next41.i to i32, !dbg !112
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !112
  br i1 %exitcond, label %._crit_edge18.i, label %.lr.ph17.i, !dbg !112

._crit_edge18.i:                                  ; preds = %.lr.ph17.i, %51
  %58 = getelementptr inbounds i32* %3, i64 %indvars.iv45.i, !dbg !115
  store i32 %52, i32* %58, align 4, !dbg !115, !tbaa !71
  %59 = getelementptr inbounds i32* %6, i64 %indvars.iv45.i, !dbg !116
  %60 = load i32* %59, align 4, !dbg !116, !tbaa !71
  %61 = add nsw i32 %60, -1, !dbg !116
  store i32 %61, i32* %59, align 4, !dbg !116, !tbaa !71
  %62 = icmp sgt i32 %61, 0, !dbg !116
  %indvars.iv.next46.i = add nsw i64 %indvars.iv45.i, 1, !dbg !107
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !107
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !87) #3, !dbg !118
  br i1 %62, label %.loopexit.i, label %48, !dbg !116

fannkuch.exit:                                    ; preds = %48
  %63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 11, i64 %flipsMax.1.ph.i) #4, !dbg !55
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind optsize
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }
attributes #4 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!48, !49}
!llvm.ident = !{!50}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fannkuch.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 99, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 100} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777315, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 99]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554531, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 99]
!15 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 101, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 101]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fannkuch", metadata !"fannkuch", metadata !"", i32 18, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !20, i32 19} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !8}
!19 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!20 = metadata !{metadata !21, metadata !22, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !34, metadata !40, metadata !44}
!21 = metadata !{i32 786689, metadata !16, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 18]
!22 = metadata !{i32 786688, metadata !16, metadata !"perm", metadata !5, i32 20, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm] [line 20]
!23 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!24 = metadata !{i32 786688, metadata !16, metadata !"perm1", metadata !5, i32 21, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!25 = metadata !{i32 786688, metadata !16, metadata !"count", metadata !5, i32 22, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 22]
!26 = metadata !{i32 786688, metadata !16, metadata !"flips", metadata !5, i32 23, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!27 = metadata !{i32 786688, metadata !16, metadata !"flipsMax", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!28 = metadata !{i32 786688, metadata !16, metadata !"r", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 25]
!29 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 26, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 26]
!30 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 27, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 27]
!31 = metadata !{i32 786688, metadata !16, metadata !"didpr", metadata !5, i32 28, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!32 = metadata !{i32 786688, metadata !16, metadata !"n1", metadata !5, i32 29, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!33 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!34 = metadata !{i32 786688, metadata !35, metadata !"j", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 59]
!35 = metadata !{i32 786443, metadata !1, metadata !36, i32 58, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 52, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!37 = metadata !{i32 786443, metadata !1, metadata !38, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!38 = metadata !{i32 786443, metadata !1, metadata !39, i32 40, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!39 = metadata !{i32 786443, metadata !1, metadata !16, i32 40, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!40 = metadata !{i32 786688, metadata !41, metadata !"t_mp", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!41 = metadata !{i32 786443, metadata !1, metadata !42, i32 61, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 60, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!43 = metadata !{i32 786443, metadata !1, metadata !35, i32 60, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!44 = metadata !{i32 786688, metadata !45, metadata !"perm0", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!45 = metadata !{i32 786443, metadata !1, metadata !46, i32 80, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 75, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!47 = metadata !{i32 786443, metadata !1, metadata !38, i32 75, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!48 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!49 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!50 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!51 = metadata !{i32 99, i32 0, metadata !4, null}
!52 = metadata !{i32 11}
!53 = metadata !{i32 101, i32 0, metadata !4, null}
!54 = metadata !{i32 786689, metadata !16, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, metadata !55} ; [ DW_TAG_arg_variable ] [n] [line 18]
!55 = metadata !{i32 103, i32 0, metadata !4, null}
!56 = metadata !{i32 18, i32 0, metadata !16, metadata !55}
!57 = metadata !{i32 10}
!58 = metadata !{i32 786688, metadata !16, metadata !"n1", metadata !5, i32 29, metadata !33, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [n1] [line 29]
!59 = metadata !{i32 29, i32 0, metadata !16, metadata !55}
!60 = metadata !{i32 33, i32 0, metadata !16, metadata !55}
!61 = metadata !{i32 34, i32 0, metadata !16, metadata !55}
!62 = metadata !{i32 786688, metadata !16, metadata !"perm1", metadata !5, i32 21, metadata !23, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [perm1] [line 21]
!63 = metadata !{i32 35, i32 0, metadata !16, metadata !55}
!64 = metadata !{i32 0}
!65 = metadata !{i32 786688, metadata !16, metadata !"i", metadata !5, i32 26, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [i] [line 26]
!66 = metadata !{i32 37, i32 0, metadata !67, metadata !55}
!67 = metadata !{i32 786443, metadata !1, metadata !16, i32 37, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!68 = metadata !{i32 52, i32 0, metadata !37, metadata !55}
!69 = metadata !{i32 41, i32 0, metadata !70, metadata !55}
!70 = metadata !{i32 786443, metadata !1, metadata !38, i32 41, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!71 = metadata !{metadata !72, metadata !72, i64 0}
!72 = metadata !{metadata !"int", metadata !73, i64 0}
!73 = metadata !{metadata !"omnipotent char", metadata !74, i64 0}
!74 = metadata !{metadata !"Simple C/C++ TBAA"}
!75 = metadata !{i32 42, i32 0, metadata !76, metadata !55}
!76 = metadata !{i32 786443, metadata !1, metadata !77, i32 42, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!77 = metadata !{i32 786443, metadata !1, metadata !70, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!78 = metadata !{i32 43, i32 0, metadata !77, metadata !55}
!79 = metadata !{i32 44, i32 0, metadata !77, metadata !55}
!80 = metadata !{i32 786688, metadata !16, metadata !"didpr", metadata !5, i32 28, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [didpr] [line 28]
!81 = metadata !{i32 45, i32 0, metadata !77, metadata !55}
!82 = metadata !{i32 46, i32 0, metadata !83, metadata !55}
!83 = metadata !{i32 786443, metadata !1, metadata !38, i32 46, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!84 = metadata !{i32 47, i32 0, metadata !85, metadata !55}
!85 = metadata !{i32 786443, metadata !1, metadata !83, i32 46, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!86 = metadata !{i32 1}
!87 = metadata !{i32 786688, metadata !16, metadata !"r", metadata !5, i32 25, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [r] [line 25]
!88 = metadata !{i32 55, i32 0, metadata !89, metadata !55}
!89 = metadata !{i32 786443, metadata !1, metadata !90, i32 54, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!90 = metadata !{i32 786443, metadata !1, metadata !36, i32 54, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!91 = metadata !{i32 786688, metadata !16, metadata !"k", metadata !5, i32 27, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [k] [line 27]
!92 = metadata !{i32 57, i32 0, metadata !36, metadata !55}
!93 = metadata !{i32 58, i32 0, metadata !36, metadata !55} ; [ DW_TAG_imported_module ]
!94 = metadata !{i32 60, i32 0, metadata !43, metadata !55}
!95 = metadata !{i32 61, i32 0, metadata !41, metadata !55}
!96 = metadata !{i32 786688, metadata !41, metadata !"t_mp", metadata !5, i32 61, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [t_mp] [line 61]
!97 = metadata !{i32 63, i32 0, metadata !35, metadata !55}
!98 = metadata !{i32 786688, metadata !16, metadata !"flips", metadata !5, i32 23, metadata !19, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [flips] [line 23]
!99 = metadata !{i32 68, i32 0, metadata !35, metadata !55}
!100 = metadata !{i32 786688, metadata !35, metadata !"j", metadata !5, i32 59, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [j] [line 59]
!101 = metadata !{i32 69, i32 0, metadata !35, metadata !55}
!102 = metadata !{i32 70, i32 0, metadata !103, metadata !55}
!103 = metadata !{i32 786443, metadata !1, metadata !36, i32 70, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!104 = metadata !{i32 786688, metadata !16, metadata !"flipsMax", metadata !5, i32 24, metadata !19, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [flipsMax] [line 24]
!105 = metadata !{i32 71, i32 0, metadata !106, metadata !55}
!106 = metadata !{i32 786443, metadata !1, metadata !103, i32 70, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!107 = metadata !{i32 76, i32 0, metadata !108, metadata !55}
!108 = metadata !{i32 786443, metadata !1, metadata !46, i32 76, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!109 = metadata !{i32 81, i32 0, metadata !45, metadata !55}
!110 = metadata !{i32 786688, metadata !45, metadata !"perm0", metadata !5, i32 81, metadata !8, i32 0, metadata !55} ; [ DW_TAG_auto_variable ] [perm0] [line 81]
!111 = metadata !{i32 82, i32 0, metadata !45, metadata !55}
!112 = metadata !{i32 83, i32 0, metadata !45, metadata !55}
!113 = metadata !{i32 85, i32 0, metadata !114, metadata !55}
!114 = metadata !{i32 786443, metadata !1, metadata !45, i32 83, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!115 = metadata !{i32 88, i32 0, metadata !45, metadata !55}
!116 = metadata !{i32 90, i32 0, metadata !117, metadata !55}
!117 = metadata !{i32 786443, metadata !1, metadata !46, i32 90, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!118 = metadata !{i32 93, i32 0, metadata !46, metadata !55}
!119 = metadata !{i32 104, i32 0, metadata !4, null}
