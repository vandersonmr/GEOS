; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !33
  %1 = icmp eq i32 %argc, 2, !dbg !34
  br i1 %1, label %2, label %7, !dbg !34

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !35
  %4 = load i8** %3, align 8, !dbg !35, !tbaa !36
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !40) #3, !dbg !41
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #3, !dbg !42
  %6 = trunc i64 %5 to i32, !dbg !42
  br label %7, !dbg !35

; <label>:7                                       ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 1500000, %0 ], !dbg !35
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !15), !dbg !35
  %9 = sext i32 %8 to i64, !dbg !44
  %10 = tail call noalias i8* @calloc(i64 %9, i64 4) #3, !dbg !44
  %11 = bitcast i8* %10 to i32*, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32* %11}, i64 0, metadata !18), !dbg !44
  %12 = tail call noalias i8* @calloc(i64 %9, i64 4) #3, !dbg !45
  %13 = bitcast i8* %12 to i32*, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i32* %13}, i64 0, metadata !20), !dbg !45
  tail call void @llvm.dbg.value(metadata !46, i64 0, metadata !16), !dbg !47
  %14 = icmp sgt i32 %8, 0, !dbg !47
  br i1 %14, label %.lr.ph7.preheader, label %.preheader.preheader, !dbg !47

.lr.ph7.preheader:                                ; preds = %7
  %15 = add i32 %8, -1, !dbg !47
  %16 = zext i32 %15 to i64
  %17 = add i64 %16, 1, !dbg !47
  %end.idx = add i64 %16, 1, !dbg !47
  %n.vec = and i64 %17, 8589934584, !dbg !47
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !47
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph7.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.lr.ph7.preheader ], !dbg !47
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %18 = add <4 x i64> %broadcast.splat, <i64 1, i64 2, i64 3, i64 4>, !dbg !47
  %19 = add <4 x i64> %broadcast.splat, <i64 5, i64 6, i64 7, i64 8>, !dbg !47
  %20 = getelementptr inbounds i32* %11, i64 %index, !dbg !49
  %21 = trunc <4 x i64> %18 to <4 x i32>, !dbg !49
  %22 = trunc <4 x i64> %19 to <4 x i32>, !dbg !49
  %23 = bitcast i32* %20 to <4 x i32>*, !dbg !49
  store <4 x i32> %21, <4 x i32>* %23, align 4, !dbg !49
  %.sum4445 = or i64 %index, 4, !dbg !49
  %24 = getelementptr i32* %11, i64 %.sum4445, !dbg !49
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !49
  store <4 x i32> %22, <4 x i32>* %25, align 4, !dbg !49
  %index.next = add i64 %index, 8, !dbg !47
  %26 = icmp eq i64 %index.next, %n.vec, !dbg !47
  br i1 %26, label %middle.block, label %vector.body, !dbg !47, !llvm.loop !51

middle.block:                                     ; preds = %vector.body, %.lr.ph7.preheader
  %resume.val = phi i64 [ 0, %.lr.ph7.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.preheader.preheader, label %.lr.ph7

.lr.ph7:                                          ; preds = %middle.block, %.lr.ph7
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.lr.ph7 ], [ %resume.val, %middle.block ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !47
  %27 = getelementptr inbounds i32* %11, i64 %indvars.iv8, !dbg !49
  %28 = trunc i64 %indvars.iv.next9 to i32, !dbg !49
  store i32 %28, i32* %27, align 4, !dbg !49, !tbaa !54
  %exitcond10 = icmp eq i32 %28, %8, !dbg !47
  br i1 %exitcond10, label %.preheader.preheader, label %.lr.ph7, !dbg !47, !llvm.loop !56

.preheader.preheader:                             ; preds = %.lr.ph7, %middle.block, %7
  %29 = add i32 %8, -1, !dbg !57
  %30 = zext i32 %29 to i64
  %31 = add i64 %30, 1, !dbg !57
  br label %.preheader, !dbg !57

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %k.04 = phi i32 [ %52, %._crit_edge ], [ 0, %.preheader.preheader ]
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge, !dbg !57

.lr.ph.preheader:                                 ; preds = %.preheader
  %end.idx19 = add i64 %30, 1
  %n.vec21 = and i64 %31, 8589934584
  %cmp.zero23 = icmp eq i64 %n.vec21, 0
  %rev.ind.end = sub i64 %9, %n.vec21
  br i1 %cmp.zero23, label %middle.block16, label %vector.body15

vector.body15:                                    ; preds = %.lr.ph.preheader, %vector.body15
  %index18 = phi i64 [ %index.next26, %vector.body15 ], [ 0, %.lr.ph.preheader ]
  %reverse.idx = sub i64 %9, %index18
  %.sum = add i64 %reverse.idx, -4, !dbg !61
  %32 = getelementptr i32* %11, i64 %.sum, !dbg !61
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !61
  %wide.load = load <4 x i32>* %33, align 4, !dbg !61
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %.sum40 = add i64 %reverse.idx, -8, !dbg !61
  %34 = getelementptr i32* %11, i64 %.sum40, !dbg !61
  %35 = bitcast i32* %34 to <4 x i32>*, !dbg !61
  %wide.load31 = load <4 x i32>* %35, align 4, !dbg !61
  %reverse32 = shufflevector <4 x i32> %wide.load31, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %.sum41 = add i64 %reverse.idx, -4, !dbg !61
  %36 = getelementptr i32* %13, i64 %.sum41, !dbg !61
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !61
  %wide.load33 = load <4 x i32>* %37, align 4, !dbg !61
  %reverse34 = shufflevector <4 x i32> %wide.load33, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %.sum43 = add i64 %reverse.idx, -8, !dbg !61
  %38 = getelementptr i32* %13, i64 %.sum43, !dbg !61
  %39 = bitcast i32* %38 to <4 x i32>*, !dbg !61
  %wide.load35 = load <4 x i32>* %39, align 4, !dbg !61
  %reverse36 = shufflevector <4 x i32> %wide.load35, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %40 = add nsw <4 x i32> %reverse34, %reverse, !dbg !61
  %41 = add nsw <4 x i32> %reverse36, %reverse32, !dbg !61
  %reverse37 = shufflevector <4 x i32> %40, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %42 = bitcast i32* %36 to <4 x i32>*, !dbg !61
  store <4 x i32> %reverse37, <4 x i32>* %42, align 4, !dbg !61
  %reverse38 = shufflevector <4 x i32> %41, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !61
  %43 = bitcast i32* %38 to <4 x i32>*, !dbg !61
  store <4 x i32> %reverse38, <4 x i32>* %43, align 4, !dbg !61
  %index.next26 = add i64 %index18, 8
  %44 = icmp eq i64 %index.next26, %n.vec21
  br i1 %44, label %middle.block16, label %vector.body15, !llvm.loop !63

middle.block16:                                   ; preds = %vector.body15, %.lr.ph.preheader
  %resume.val24 = phi i64 [ %9, %.lr.ph.preheader ], [ %rev.ind.end, %vector.body15 ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec21, %vector.body15 ]
  %cmp.n25 = icmp eq i64 %end.idx19, %new.indc.resume.val
  br i1 %cmp.n25, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block16, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %resume.val24, %middle.block16 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !57
  %45 = getelementptr inbounds i32* %11, i64 %indvars.iv.next, !dbg !61
  %46 = load i32* %45, align 4, !dbg !61, !tbaa !54
  %47 = getelementptr inbounds i32* %13, i64 %indvars.iv.next, !dbg !61
  %48 = load i32* %47, align 4, !dbg !61, !tbaa !54
  %49 = add nsw i32 %48, %46, !dbg !61
  store i32 %49, i32* %47, align 4, !dbg !61, !tbaa !54
  %50 = trunc i64 %indvars.iv.next to i32, !dbg !57
  %51 = icmp sgt i32 %50, 0, !dbg !57
  br i1 %51, label %.lr.ph, label %._crit_edge, !dbg !57, !llvm.loop !64

._crit_edge:                                      ; preds = %.lr.ph, %middle.block16, %.preheader
  %52 = add nsw i32 %k.04, 1, !dbg !65
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !17), !dbg !65
  %exitcond = icmp eq i32 %52, 1000, !dbg !65
  br i1 %exitcond, label %53, label %.preheader, !dbg !65

; <label>:53                                      ; preds = %._crit_edge
  %54 = load i32* %13, align 4, !dbg !66, !tbaa !54
  %55 = add nsw i32 %8, -1, !dbg !66
  %56 = sext i32 %55 to i64, !dbg !66
  %57 = getelementptr inbounds i32* %13, i64 %56, !dbg !66
  %58 = load i32* %57, align 4, !dbg !66, !tbaa !54
  %59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %54, i32 %58) #3, !dbg !66
  tail call void @free(i8* %10) #3, !dbg !67
  tail call void @free(i8* %12) #3, !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

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
!llvm.module.flags = !{!30, !31}
!llvm.ident = !{!32}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ary3.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !21}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !20}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554449, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!15 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 23, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 23]
!16 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!17 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 24, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 24]
!18 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 24]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!20 = metadata !{i32 786688, metadata !4, metadata !"y", metadata !5, i32 24, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 24]
!21 = metadata !{i32 786478, metadata !22, metadata !23, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !28, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!22 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!23 = metadata !{i32 786473, metadata !22}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !26}
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786689, metadata !21, metadata !"__nptr", metadata !23, i32 16777494, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!30 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!31 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!32 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!33 = metadata !{i32 17, i32 0, metadata !4, null}
!34 = metadata !{i32 23, i32 0, metadata !4, null}
!35 = metadata !{i32 23, i32 26, metadata !4, null}
!36 = metadata !{metadata !37, metadata !37, i64 0}
!37 = metadata !{metadata !"any pointer", metadata !38, i64 0}
!38 = metadata !{metadata !"omnipotent char", metadata !39, i64 0}
!39 = metadata !{metadata !"Simple C/C++ TBAA"}
!40 = metadata !{i32 786689, metadata !21, metadata !"__nptr", metadata !23, i32 16777494, metadata !26, i32 0, metadata !35} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!41 = metadata !{i32 278, i32 0, metadata !21, metadata !35}
!42 = metadata !{i32 280, i32 0, metadata !43, metadata !35}
!43 = metadata !{i32 786443, metadata !22, metadata !21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!44 = metadata !{i32 26, i32 0, metadata !4, null}
!45 = metadata !{i32 27, i32 0, metadata !4, null}
!46 = metadata !{i32 0}
!47 = metadata !{i32 29, i32 0, metadata !48, null}
!48 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!49 = metadata !{i32 30, i32 0, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !48, i32 29, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!51 = metadata !{metadata !51, metadata !52, metadata !53}
!52 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!53 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!54 = metadata !{metadata !55, metadata !55, i64 0}
!55 = metadata !{metadata !"int", metadata !38, i64 0}
!56 = metadata !{metadata !56, metadata !52, metadata !53}
!57 = metadata !{i32 34, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 34, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!60 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!61 = metadata !{i32 35, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !58, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!63 = metadata !{metadata !63, metadata !52, metadata !53}
!64 = metadata !{metadata !64, metadata !52, metadata !53}
!65 = metadata !{i32 33, i32 0, metadata !60, null}
!66 = metadata !{i32 39, i32 0, metadata !4, null}
!67 = metadata !{i32 41, i32 0, metadata !4, null}
!68 = metadata !{i32 42, i32 0, metadata !4, null}
!69 = metadata !{i32 44, i32 0, metadata !4, null}
