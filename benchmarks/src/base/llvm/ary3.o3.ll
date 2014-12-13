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
  br i1 %14, label %.lr.ph7.preheader, label %vector.body17, !dbg !47

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
  %.sum54 = or i64 %index, 4, !dbg !49
  %24 = getelementptr i32* %11, i64 %.sum54, !dbg !49
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !49
  store <4 x i32> %22, <4 x i32>* %25, align 4, !dbg !49
  %index.next = add i64 %index, 8, !dbg !47
  %26 = icmp eq i64 %index.next, %n.vec, !dbg !47
  br i1 %26, label %middle.block, label %vector.body, !dbg !47, !llvm.loop !51

middle.block:                                     ; preds = %vector.body, %.lr.ph7.preheader
  %resume.val = phi i64 [ 0, %.lr.ph7.preheader ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.preheader1, label %.lr.ph7

vector.body17:                                    ; preds = %.preheader1, %7, %vector.body17
  %index20 = phi i32 [ %index.next24, %vector.body17 ], [ 0, %7 ], [ 0, %.preheader1 ], !dbg !54
  %index.next24 = add i32 %index20, 32, !dbg !54
  %27 = icmp eq i32 %index.next24, 992, !dbg !54
  br i1 %27, label %.preheader1.thread, label %vector.body17, !dbg !54, !llvm.loop !56

.preheader1:                                      ; preds = %middle.block, %.lr.ph7
  br i1 %14, label %.lr.ph.us.preheader, label %vector.body17

.lr.ph.us.preheader:                              ; preds = %.preheader1
  %28 = add i32 %8, -1, !dbg !57
  %29 = zext i32 %28 to i64
  %30 = add i64 %29, 1, !dbg !57
  br label %.lr.ph.us, !dbg !57

; <label>:31                                      ; preds = %middle.block31, %scalar.ph32
  %32 = add nsw i32 %k.04.us, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !17), !dbg !54
  %exitcond11 = icmp eq i32 %32, 1000, !dbg !54
  br i1 %exitcond11, label %.us-lcssa.us, label %.lr.ph.us, !dbg !54

scalar.ph32:                                      ; preds = %middle.block31, %scalar.ph32
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %scalar.ph32 ], [ %resume.val39, %middle.block31 ]
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, -1, !dbg !57
  %33 = getelementptr inbounds i32* %11, i64 %indvars.iv.next10, !dbg !60
  %34 = load i32* %33, align 4, !dbg !60, !tbaa !62
  %35 = getelementptr inbounds i32* %13, i64 %indvars.iv.next10, !dbg !60
  %36 = load i32* %35, align 4, !dbg !60, !tbaa !62
  %37 = add nsw i32 %36, %34, !dbg !60
  store i32 %37, i32* %35, align 4, !dbg !60, !tbaa !62
  %38 = trunc i64 %indvars.iv.next10 to i32, !dbg !57
  %39 = icmp sgt i32 %38, 0, !dbg !57
  br i1 %39, label %scalar.ph32, label %31, !dbg !57, !llvm.loop !64

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %31
  %k.04.us = phi i32 [ %32, %31 ], [ 0, %.lr.ph.us.preheader ]
  %end.idx34 = add i64 %29, 1
  %n.vec36 = and i64 %30, 8589934584
  %cmp.zero38 = icmp eq i64 %n.vec36, 0
  %rev.ind.end = sub i64 %9, %n.vec36
  br i1 %cmp.zero38, label %middle.block31, label %vector.body30

vector.body30:                                    ; preds = %.lr.ph.us, %vector.body30
  %index33 = phi i64 [ %index.next41, %vector.body30 ], [ 0, %.lr.ph.us ]
  %reverse.idx = sub i64 %9, %index33
  %.sum = add i64 %reverse.idx, -4, !dbg !60
  %40 = getelementptr i32* %11, i64 %.sum, !dbg !60
  %41 = bitcast i32* %40 to <4 x i32>*, !dbg !60
  %wide.load = load <4 x i32>* %41, align 4, !dbg !60
  %reverse = shufflevector <4 x i32> %wide.load, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %.sum56 = add i64 %reverse.idx, -8, !dbg !60
  %42 = getelementptr i32* %11, i64 %.sum56, !dbg !60
  %43 = bitcast i32* %42 to <4 x i32>*, !dbg !60
  %wide.load46 = load <4 x i32>* %43, align 4, !dbg !60
  %reverse47 = shufflevector <4 x i32> %wide.load46, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %.sum57 = add i64 %reverse.idx, -4, !dbg !60
  %44 = getelementptr i32* %13, i64 %.sum57, !dbg !60
  %45 = bitcast i32* %44 to <4 x i32>*, !dbg !60
  %wide.load48 = load <4 x i32>* %45, align 4, !dbg !60
  %reverse49 = shufflevector <4 x i32> %wide.load48, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %.sum59 = add i64 %reverse.idx, -8, !dbg !60
  %46 = getelementptr i32* %13, i64 %.sum59, !dbg !60
  %47 = bitcast i32* %46 to <4 x i32>*, !dbg !60
  %wide.load50 = load <4 x i32>* %47, align 4, !dbg !60
  %reverse51 = shufflevector <4 x i32> %wide.load50, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %48 = add nsw <4 x i32> %reverse49, %reverse, !dbg !60
  %49 = add nsw <4 x i32> %reverse51, %reverse47, !dbg !60
  %reverse52 = shufflevector <4 x i32> %48, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %50 = bitcast i32* %44 to <4 x i32>*, !dbg !60
  store <4 x i32> %reverse52, <4 x i32>* %50, align 4, !dbg !60
  %reverse53 = shufflevector <4 x i32> %49, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>, !dbg !60
  %51 = bitcast i32* %46 to <4 x i32>*, !dbg !60
  store <4 x i32> %reverse53, <4 x i32>* %51, align 4, !dbg !60
  %index.next41 = add i64 %index33, 8
  %52 = icmp eq i64 %index.next41, %n.vec36
  br i1 %52, label %middle.block31, label %vector.body30, !llvm.loop !65

middle.block31:                                   ; preds = %vector.body30, %.lr.ph.us
  %resume.val39 = phi i64 [ %9, %.lr.ph.us ], [ %rev.ind.end, %vector.body30 ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.us ], [ %n.vec36, %vector.body30 ]
  %cmp.n40 = icmp eq i64 %end.idx34, %new.indc.resume.val
  br i1 %cmp.n40, label %31, label %scalar.ph32

.lr.ph7:                                          ; preds = %middle.block, %.lr.ph7
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph7 ], [ %resume.val, %middle.block ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !47
  %53 = getelementptr inbounds i32* %11, i64 %indvars.iv, !dbg !49
  %54 = trunc i64 %indvars.iv.next to i32, !dbg !49
  store i32 %54, i32* %53, align 4, !dbg !49, !tbaa !62
  %exitcond8 = icmp eq i32 %54, %8, !dbg !47
  br i1 %exitcond8, label %.preheader1, label %.lr.ph7, !dbg !47, !llvm.loop !66

.preheader1.thread:                               ; preds = %vector.body17, %.preheader1.thread
  %k.04 = phi i32 [ %55, %.preheader1.thread ], [ 992, %vector.body17 ]
  %55 = add nsw i32 %k.04, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !{i32 %55}, i64 0, metadata !17), !dbg !54
  %exitcond = icmp eq i32 %55, 1000, !dbg !54
  br i1 %exitcond, label %.us-lcssa.us, label %.preheader1.thread, !dbg !54, !llvm.loop !67

.us-lcssa.us:                                     ; preds = %.preheader1.thread, %31
  %56 = load i32* %13, align 4, !dbg !68, !tbaa !62
  %57 = add nsw i32 %8, -1, !dbg !68
  %58 = sext i32 %57 to i64, !dbg !68
  %59 = getelementptr inbounds i32* %13, i64 %58, !dbg !68
  %60 = load i32* %59, align 4, !dbg !68, !tbaa !62
  %61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %56, i32 %60) #3, !dbg !68
  tail call void @free(i8* %10) #3, !dbg !69
  tail call void @free(i8* %12) #3, !dbg !70
  ret i32 0, !dbg !71
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
!54 = metadata !{i32 33, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!56 = metadata !{metadata !56, metadata !52, metadata !53}
!57 = metadata !{i32 34, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 34, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!59 = metadata !{i32 786443, metadata !1, metadata !55, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!60 = metadata !{i32 35, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !58, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!62 = metadata !{metadata !63, metadata !63, i64 0}
!63 = metadata !{metadata !"int", metadata !38, i64 0}
!64 = metadata !{metadata !64, metadata !52, metadata !53}
!65 = metadata !{metadata !65, metadata !52, metadata !53}
!66 = metadata !{metadata !66, metadata !52, metadata !53}
!67 = metadata !{metadata !67, metadata !52, metadata !53}
!68 = metadata !{i32 39, i32 0, metadata !4, null}
!69 = metadata !{i32 41, i32 0, metadata !4, null}
!70 = metadata !{i32 42, i32 0, metadata !4, null}
!71 = metadata !{i32 44, i32 0, metadata !4, null}
