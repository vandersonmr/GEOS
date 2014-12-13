; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !33
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !33
  %1 = icmp eq i32 %argc, 2, !dbg !34
  br i1 %1, label %2, label %6, !dbg !34

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !35
  %4 = load i8** %3, align 8, !dbg !35, !tbaa !36
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !35
  br label %6, !dbg !35

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 1500000, %0 ], !dbg !35
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !35
  %8 = sext i32 %7 to i64, !dbg !40
  %9 = tail call noalias i8* @calloc(i64 %8, i64 4) #5, !dbg !40
  %10 = bitcast i8* %9 to i32*, !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !18), !dbg !40
  %11 = tail call noalias i8* @calloc(i64 %8, i64 4) #5, !dbg !41
  %12 = bitcast i8* %11 to i32*, !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !20), !dbg !41
  tail call void @llvm.dbg.value(metadata !42, i64 0, metadata !16), !dbg !43
  %13 = icmp sgt i32 %7, 0, !dbg !43
  br i1 %13, label %.lr.ph7, label %.preheader1, !dbg !43

.preheader1:                                      ; preds = %.lr.ph7, %6
  %14 = icmp sgt i32 %7, 0, !dbg !45
  %15 = sext i32 %7 to i64
  br label %.preheader, !dbg !49

.lr.ph7:                                          ; preds = %6, %.lr.ph7
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.lr.ph7 ], [ 0, %6 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !43
  %16 = getelementptr inbounds i32* %10, i64 %indvars.iv8, !dbg !50
  %17 = trunc i64 %indvars.iv.next9 to i32, !dbg !50
  store i32 %17, i32* %16, align 4, !dbg !50, !tbaa !52
  %lftr.wideiv = trunc i64 %indvars.iv.next9 to i32, !dbg !43
  %exitcond10 = icmp eq i32 %lftr.wideiv, %7, !dbg !43
  br i1 %exitcond10, label %.preheader1, label %.lr.ph7, !dbg !43

.preheader:                                       ; preds = %._crit_edge, %.preheader1
  %k.04 = phi i32 [ 0, %.preheader1 ], [ %25, %._crit_edge ]
  br i1 %14, label %.lr.ph, label %._crit_edge, !dbg !45

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %15, %.preheader ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !45
  %18 = getelementptr inbounds i32* %10, i64 %indvars.iv.next, !dbg !54
  %19 = load i32* %18, align 4, !dbg !54, !tbaa !52
  %20 = getelementptr inbounds i32* %12, i64 %indvars.iv.next, !dbg !54
  %21 = load i32* %20, align 4, !dbg !54, !tbaa !52
  %22 = add nsw i32 %21, %19, !dbg !54
  store i32 %22, i32* %20, align 4, !dbg !54, !tbaa !52
  %23 = trunc i64 %indvars.iv.next to i32, !dbg !45
  %24 = icmp sgt i32 %23, 0, !dbg !45
  br i1 %24, label %.lr.ph, label %._crit_edge, !dbg !45

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %25 = add nsw i32 %k.04, 1, !dbg !49
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !17), !dbg !49
  %exitcond = icmp eq i32 %25, 1000, !dbg !49
  br i1 %exitcond, label %26, label %.preheader, !dbg !49

; <label>:26                                      ; preds = %._crit_edge
  %27 = load i32* %12, align 4, !dbg !56, !tbaa !52
  %28 = add nsw i32 %7, -1, !dbg !56
  %29 = sext i32 %28 to i64, !dbg !56
  %30 = getelementptr inbounds i32* %12, i64 %29, !dbg !56
  %31 = load i32* %30, align 4, !dbg !56, !tbaa !52
  %32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %27, i32 %31) #5, !dbg !56
  tail call void @free(i8* %9) #5, !dbg !57
  tail call void @free(i8* %11) #5, !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #1 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !29), !dbg !60
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !61
  %2 = trunc i64 %1 to i32, !dbg !61
  ret i32 %2, !dbg !61
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

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
!21 = metadata !{i32 786478, metadata !22, metadata !23, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !28, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!40 = metadata !{i32 26, i32 0, metadata !4, null}
!41 = metadata !{i32 27, i32 0, metadata !4, null}
!42 = metadata !{i32 0}
!43 = metadata !{i32 29, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!45 = metadata !{i32 34, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !47, i32 34, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!47 = metadata !{i32 786443, metadata !1, metadata !48, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!48 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!49 = metadata !{i32 33, i32 0, metadata !48, null}
!50 = metadata !{i32 30, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !44, i32 29, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!52 = metadata !{metadata !53, metadata !53, i64 0}
!53 = metadata !{metadata !"int", metadata !38, i64 0}
!54 = metadata !{i32 35, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !46, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!56 = metadata !{i32 39, i32 0, metadata !4, null}
!57 = metadata !{i32 41, i32 0, metadata !4, null}
!58 = metadata !{i32 42, i32 0, metadata !4, null}
!59 = metadata !{i32 44, i32 0, metadata !4, null}
!60 = metadata !{i32 278, i32 0, metadata !21, null}
!61 = metadata !{i32 280, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !22, metadata !21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
