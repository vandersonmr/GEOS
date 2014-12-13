; ModuleID = 'fannkuch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !51
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !51
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !15), !dbg !53
  %1 = tail call fastcc i64 @fannkuch(), !dbg !54
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 11, i64 %1) #3, !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define internal fastcc i64 @fannkuch() #0 {
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !21), !dbg !56
  tail call void @llvm.dbg.value(metadata !57, i64 0, metadata !32), !dbg !58
  %1 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !59
  tail call void @llvm.dbg.value(metadata !{i32* %5}, i64 0, metadata !22), !dbg !59
  %2 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !60
  %3 = bitcast i8* %2 to i32*, !dbg !60
  tail call void @llvm.dbg.value(metadata !{i32* %3}, i64 0, metadata !24), !dbg !60
  %4 = tail call noalias i8* @calloc(i64 11, i64 4) #3, !dbg !61
  tail call void @llvm.dbg.value(metadata !{i32* %6}, i64 0, metadata !25), !dbg !61
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !29), !dbg !63
  br label %9, !dbg !63

.preheader4:                                      ; preds = %9
  %5 = bitcast i8* %1 to i32*, !dbg !59
  %6 = bitcast i8* %4 to i32*, !dbg !61
  %7 = getelementptr inbounds i8* %2, i64 40, !dbg !65
  %8 = bitcast i8* %7 to i32*, !dbg !65
  %scevgep = getelementptr i8* %1, i64 4
  %scevgep34 = getelementptr i8* %2, i64 4
  br label %13, !dbg !66

; <label>:9                                       ; preds = %9, %0
  %indvars.iv47 = phi i64 [ 0, %0 ], [ %indvars.iv.next48, %9 ]
  %10 = getelementptr inbounds i32* %3, i64 %indvars.iv47, !dbg !63
  %11 = trunc i64 %indvars.iv47 to i32, !dbg !63
  store i32 %11, i32* %10, align 4, !dbg !63, !tbaa !68
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1, !dbg !63
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 11, !dbg !63
  br i1 %exitcond49, label %.preheader4, label %9, !dbg !63

.loopexit:                                        ; preds = %._crit_edge18
  %12 = trunc i64 %indvars.iv45 to i32
  br label %13

; <label>:13                                      ; preds = %.preheader4, %.loopexit
  %r.0 = phi i32 [ %12, %.loopexit ], [ 11, %.preheader4 ]
  %didpr.0 = phi i32 [ %didpr.1.ph, %.loopexit ], [ 0, %.preheader4 ]
  %flipsMax.0 = phi i64 [ %flipsMax.1.ph51, %.loopexit ], [ 0, %.preheader4 ]
  %14 = icmp slt i32 %didpr.0, 30, !dbg !66
  br i1 %14, label %.preheader3, label %.preheader2, !dbg !66

.preheader3:                                      ; preds = %13, %.preheader3
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader3 ], [ 0, %13 ]
  %15 = getelementptr inbounds i32* %3, i64 %indvars.iv, !dbg !72
  %16 = load i32* %15, align 4, !dbg !72, !tbaa !68
  %17 = add nsw i32 %16, 1, !dbg !72
  %18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %17) #3, !dbg !72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  %exitcond = icmp eq i64 %indvars.iv.next, 11, !dbg !72
  br i1 %exitcond, label %19, label %.preheader3, !dbg !72

; <label>:19                                      ; preds = %.preheader3
  %putchar = tail call i32 @putchar(i32 10) #3, !dbg !75
  %20 = add nsw i32 %didpr.0, 1, !dbg !76
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !31), !dbg !76
  br label %.preheader2, !dbg !77

.preheader2:                                      ; preds = %19, %13
  %didpr.1.ph = phi i32 [ %didpr.0, %13 ], [ %20, %19 ]
  %21 = icmp eq i32 %r.0, 1, !dbg !78
  br i1 %21, label %._crit_edge, label %.lr.ph, !dbg !78

.lr.ph:                                           ; preds = %.preheader2
  %22 = sext i32 %r.0 to i64
  br label %23, !dbg !78

; <label>:23                                      ; preds = %.lr.ph, %23
  %indvars.iv29 = phi i64 [ %22, %.lr.ph ], [ %indvars.iv.next30, %23 ]
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, -1, !dbg !78
  %24 = getelementptr inbounds i32* %6, i64 %indvars.iv.next30, !dbg !80
  %25 = trunc i64 %indvars.iv29 to i32, !dbg !80
  store i32 %25, i32* %24, align 4, !dbg !80, !tbaa !68
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !28), !dbg !78
  %26 = trunc i64 %indvars.iv.next30 to i32, !dbg !78
  %27 = icmp eq i32 %26, 1, !dbg !78
  br i1 %27, label %._crit_edge, label %23, !dbg !78

._crit_edge:                                      ; preds = %23, %.preheader2
  %28 = load i32* %3, align 4, !dbg !65, !tbaa !68
  %29 = icmp eq i32 %28, 0, !dbg !65
  br i1 %29, label %.lr.ph20, label %30, !dbg !65

; <label>:30                                      ; preds = %._crit_edge
  %31 = load i32* %8, align 4, !dbg !65, !tbaa !68
  %32 = icmp eq i32 %31, 10, !dbg !65
  br i1 %32, label %.lr.ph20, label %33, !dbg !65

; <label>:33                                      ; preds = %30
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep, i8* %scevgep34, i64 40, i32 4, i1 false), !dbg !83
  %34 = load i32* %3, align 4, !dbg !86, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !30), !dbg !86
  br label %35, !dbg !87

; <label>:35                                      ; preds = %._crit_edge14, %33
  %k.0 = phi i32 [ %34, %33 ], [ %49, %._crit_edge14 ]
  %flips.0 = phi i64 [ 0, %33 ], [ %46, %._crit_edge14 ]
  tail call void @llvm.dbg.value(metadata !82, i64 0, metadata !29), !dbg !88
  %j.09 = add nsw i32 %k.0, -1, !dbg !88
  %36 = icmp sgt i32 %j.09, 1, !dbg !88
  br i1 %36, label %.lr.ph13, label %._crit_edge14, !dbg !88

.lr.ph13:                                         ; preds = %35
  %37 = add i32 %k.0, -1, !dbg !88
  %38 = sext i32 %37 to i64
  br label %39, !dbg !88

; <label>:39                                      ; preds = %.lr.ph13, %39
  %indvars.iv38 = phi i64 [ 1, %.lr.ph13 ], [ %indvars.iv.next39, %39 ]
  %indvars.iv35 = phi i64 [ %38, %.lr.ph13 ], [ %indvars.iv.next36, %39 ]
  %j.011 = phi i32 [ %j.09, %.lr.ph13 ], [ %j.0, %39 ]
  %40 = getelementptr inbounds i32* %5, i64 %indvars.iv38, !dbg !89
  %41 = load i32* %40, align 4, !dbg !89, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !40), !dbg !89
  %42 = getelementptr inbounds i32* %5, i64 %indvars.iv35, !dbg !89
  %43 = load i32* %42, align 4, !dbg !89, !tbaa !68
  store i32 %43, i32* %40, align 4, !dbg !89, !tbaa !68
  store i32 %41, i32* %42, align 4, !dbg !89, !tbaa !68
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !88
  %j.0 = add nsw i32 %j.011, -1, !dbg !88
  %44 = trunc i64 %indvars.iv.next39 to i32, !dbg !88
  %45 = icmp slt i32 %44, %j.0, !dbg !88
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1, !dbg !88
  br i1 %45, label %39, label %._crit_edge14, !dbg !88

._crit_edge14:                                    ; preds = %39, %35
  %46 = add nsw i64 %flips.0, 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !{i64 %46}, i64 0, metadata !26), !dbg !90
  %47 = sext i32 %k.0 to i64, !dbg !91
  %48 = getelementptr inbounds i32* %5, i64 %47, !dbg !91
  %49 = load i32* %48, align 4, !dbg !91, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !34), !dbg !91
  store i32 %k.0, i32* %48, align 4, !dbg !91, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !30), !dbg !91
  %50 = icmp eq i32 %49, 0, !dbg !92
  br i1 %50, label %51, label %35, !dbg !92

; <label>:51                                      ; preds = %._crit_edge14
  %52 = icmp slt i64 %flipsMax.0, %46, !dbg !93
  tail call void @llvm.dbg.value(metadata !{i64 %46}, i64 0, metadata !27), !dbg !95
  %.flipsMax.0 = select i1 %52, i64 %46, i64 %flipsMax.0, !dbg !93
  br label %.lr.ph20, !dbg !93

.lr.ph20:                                         ; preds = %51, %30, %._crit_edge
  %flipsMax.1.ph51 = phi i64 [ %flipsMax.0, %._crit_edge ], [ %.flipsMax.0, %51 ], [ %flipsMax.0, %30 ]
  br label %56, !dbg !97

; <label>:53                                      ; preds = %._crit_edge18
  %indvars.iv.next43 = add nsw i32 %indvars.iv42, 1, !dbg !97
  %54 = trunc i64 %indvars.iv.next46 to i32, !dbg !97
  %55 = icmp eq i32 %54, 11, !dbg !97
  br i1 %55, label %.preheader._crit_edge, label %56, !dbg !97

; <label>:56                                      ; preds = %.lr.ph20, %53
  %indvars.iv45 = phi i64 [ 1, %.lr.ph20 ], [ %indvars.iv.next46, %53 ]
  %indvars.iv42 = phi i32 [ 1, %.lr.ph20 ], [ %indvars.iv.next43, %53 ]
  %57 = load i32* %3, align 4, !dbg !99, !tbaa !68
  tail call void @llvm.dbg.value(metadata !{i32 %57}, i64 0, metadata !44), !dbg !99
  tail call void @llvm.dbg.value(metadata !62, i64 0, metadata !29), !dbg !100
  %58 = trunc i64 %indvars.iv45 to i32, !dbg !101
  %59 = icmp sgt i32 %58, 0, !dbg !101
  br i1 %59, label %.lr.ph17, label %._crit_edge18, !dbg !101

.lr.ph17:                                         ; preds = %56, %.lr.ph17
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %.lr.ph17 ], [ 0, %56 ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1, !dbg !101
  %60 = getelementptr inbounds i32* %3, i64 %indvars.iv.next41, !dbg !102
  %61 = load i32* %60, align 4, !dbg !102, !tbaa !68
  %62 = getelementptr inbounds i32* %3, i64 %indvars.iv40, !dbg !102
  store i32 %61, i32* %62, align 4, !dbg !102, !tbaa !68
  %lftr.wideiv = trunc i64 %indvars.iv.next41 to i32, !dbg !101
  %exitcond44 = icmp eq i32 %lftr.wideiv, %indvars.iv42, !dbg !101
  br i1 %exitcond44, label %._crit_edge18, label %.lr.ph17, !dbg !101

._crit_edge18:                                    ; preds = %.lr.ph17, %56
  %63 = getelementptr inbounds i32* %3, i64 %indvars.iv45, !dbg !104
  store i32 %57, i32* %63, align 4, !dbg !104, !tbaa !68
  %64 = getelementptr inbounds i32* %6, i64 %indvars.iv45, !dbg !105
  %65 = load i32* %64, align 4, !dbg !105, !tbaa !68
  %66 = add nsw i32 %65, -1, !dbg !105
  store i32 %66, i32* %64, align 4, !dbg !105, !tbaa !68
  %67 = icmp sgt i32 %66, 0, !dbg !105
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next43}, i64 0, metadata !28), !dbg !107
  br i1 %67, label %.loopexit, label %53, !dbg !105

.preheader._crit_edge:                            ; preds = %53
  ret i64 %flipsMax.1.ph51, !dbg !108
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

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
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fannkuch", metadata !"fannkuch", metadata !"", i32 18, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 ()* @fannkuch, null, null, metadata !20, i32 19} ; [ DW_TAG_subprogram ] [line 18] [local] [def] [scope 19] [fannkuch]
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
!54 = metadata !{i32 103, i32 0, metadata !4, null}
!55 = metadata !{i32 104, i32 0, metadata !4, null}
!56 = metadata !{i32 18, i32 0, metadata !16, null}
!57 = metadata !{i32 10}
!58 = metadata !{i32 29, i32 0, metadata !16, null}
!59 = metadata !{i32 33, i32 0, metadata !16, null}
!60 = metadata !{i32 34, i32 0, metadata !16, null}
!61 = metadata !{i32 35, i32 0, metadata !16, null}
!62 = metadata !{i32 0}
!63 = metadata !{i32 37, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !16, i32 37, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!65 = metadata !{i32 52, i32 0, metadata !37, null}
!66 = metadata !{i32 41, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !38, i32 41, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!68 = metadata !{metadata !69, metadata !69, i64 0}
!69 = metadata !{metadata !"int", metadata !70, i64 0}
!70 = metadata !{metadata !"omnipotent char", metadata !71, i64 0}
!71 = metadata !{metadata !"Simple C/C++ TBAA"}
!72 = metadata !{i32 42, i32 0, metadata !73, null}
!73 = metadata !{i32 786443, metadata !1, metadata !74, i32 42, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!74 = metadata !{i32 786443, metadata !1, metadata !67, i32 41, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!75 = metadata !{i32 43, i32 0, metadata !74, null}
!76 = metadata !{i32 44, i32 0, metadata !74, null}
!77 = metadata !{i32 45, i32 0, metadata !74, null}
!78 = metadata !{i32 46, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !38, i32 46, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!80 = metadata !{i32 47, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !1, metadata !79, i32 46, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!82 = metadata !{i32 1}
!83 = metadata !{i32 55, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !85, i32 54, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!85 = metadata !{i32 786443, metadata !1, metadata !36, i32 54, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!86 = metadata !{i32 57, i32 0, metadata !36, null}
!87 = metadata !{i32 58, i32 0, metadata !36, null} ; [ DW_TAG_imported_module ]
!88 = metadata !{i32 60, i32 0, metadata !43, null}
!89 = metadata !{i32 61, i32 0, metadata !41, null}
!90 = metadata !{i32 63, i32 0, metadata !35, null}
!91 = metadata !{i32 68, i32 0, metadata !35, null}
!92 = metadata !{i32 69, i32 0, metadata !35, null}
!93 = metadata !{i32 70, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !36, i32 70, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!95 = metadata !{i32 71, i32 0, metadata !96, null}
!96 = metadata !{i32 786443, metadata !1, metadata !94, i32 70, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!97 = metadata !{i32 76, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !46, i32 76, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!99 = metadata !{i32 81, i32 0, metadata !45, null}
!100 = metadata !{i32 82, i32 0, metadata !45, null}
!101 = metadata !{i32 83, i32 0, metadata !45, null}
!102 = metadata !{i32 85, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !45, i32 83, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!104 = metadata !{i32 88, i32 0, metadata !45, null}
!105 = metadata !{i32 90, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !46, i32 90, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fannkuch.c]
!107 = metadata !{i32 93, i32 0, metadata !46, null}
!108 = metadata !{i32 96, i32 0, metadata !16, null}
