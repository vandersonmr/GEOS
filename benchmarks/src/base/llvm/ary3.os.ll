; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !24
  %1 = icmp eq i32 %argc, 2, !dbg !25
  br i1 %1, label %2, label %6, !dbg !25

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !25
  %4 = load i8** %3, align 8, !dbg !25, !tbaa !26
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !25
  br label %6, !dbg !25

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 1500000, %0 ], !dbg !25
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !25
  %8 = sext i32 %7 to i64, !dbg !30
  %9 = tail call noalias i8* @calloc(i64 %8, i64 4) #5, !dbg !30
  %10 = bitcast i8* %9 to i32*, !dbg !30
  tail call void @llvm.dbg.value(metadata !{i32* %10}, i64 0, metadata !18), !dbg !30
  %11 = tail call noalias i8* @calloc(i64 %8, i64 4) #5, !dbg !31
  %12 = bitcast i8* %11 to i32*, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i32* %12}, i64 0, metadata !20), !dbg !31
  tail call void @llvm.dbg.value(metadata !32, i64 0, metadata !16), !dbg !33
  %13 = icmp sgt i32 %7, 0, !dbg !33
  br i1 %13, label %.lr.ph7, label %.preheader, !dbg !33

.lr.ph7:                                          ; preds = %6, %.lr.ph7
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %.lr.ph7 ], [ 0, %6 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !33
  %14 = getelementptr inbounds i32* %10, i64 %indvars.iv8, !dbg !35
  %15 = trunc i64 %indvars.iv.next9 to i32, !dbg !35
  store i32 %15, i32* %14, align 4, !dbg !35, !tbaa !37
  %exitcond10 = icmp eq i32 %15, %7, !dbg !33
  br i1 %exitcond10, label %.preheader, label %.lr.ph7, !dbg !33

.preheader:                                       ; preds = %6, %.lr.ph7, %._crit_edge
  %k.04 = phi i32 [ %23, %._crit_edge ], [ 0, %.lr.ph7 ], [ 0, %6 ]
  br i1 %13, label %.lr.ph, label %._crit_edge, !dbg !39

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %8, %.preheader ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !39
  %16 = getelementptr inbounds i32* %10, i64 %indvars.iv.next, !dbg !43
  %17 = load i32* %16, align 4, !dbg !43, !tbaa !37
  %18 = getelementptr inbounds i32* %12, i64 %indvars.iv.next, !dbg !43
  %19 = load i32* %18, align 4, !dbg !43, !tbaa !37
  %20 = add nsw i32 %19, %17, !dbg !43
  store i32 %20, i32* %18, align 4, !dbg !43, !tbaa !37
  %21 = trunc i64 %indvars.iv.next to i32, !dbg !39
  %22 = icmp sgt i32 %21, 0, !dbg !39
  br i1 %22, label %.lr.ph, label %._crit_edge, !dbg !39

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %23 = add nsw i32 %k.04, 1, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !17), !dbg !45
  %exitcond = icmp eq i32 %23, 1000, !dbg !45
  br i1 %exitcond, label %24, label %.preheader, !dbg !45

; <label>:24                                      ; preds = %._crit_edge
  %25 = load i32* %12, align 4, !dbg !46, !tbaa !37
  %26 = add nsw i32 %7, -1, !dbg !46
  %27 = sext i32 %26 to i64, !dbg !46
  %28 = getelementptr inbounds i32* %12, i64 %27, !dbg !46
  %29 = load i32* %28, align 4, !dbg !46, !tbaa !37
  %30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %25, i32 %29) #5, !dbg !46
  tail call void @free(i8* %9) #5, !dbg !47
  tail call void @free(i8* %11) #5, !dbg !48
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #1

; Function Attrs: nounwind optsize
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind optsize readonly }
attributes #5 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ary3.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
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
!21 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!22 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!23 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!24 = metadata !{i32 17, i32 0, metadata !4, null}
!25 = metadata !{i32 23, i32 0, metadata !4, null}
!26 = metadata !{metadata !27, metadata !27, i64 0}
!27 = metadata !{metadata !"any pointer", metadata !28, i64 0}
!28 = metadata !{metadata !"omnipotent char", metadata !29, i64 0}
!29 = metadata !{metadata !"Simple C/C++ TBAA"}
!30 = metadata !{i32 26, i32 0, metadata !4, null}
!31 = metadata !{i32 27, i32 0, metadata !4, null}
!32 = metadata !{i32 0}
!33 = metadata !{i32 29, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !1, metadata !4, i32 29, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!35 = metadata !{i32 30, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !34, i32 29, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!37 = metadata !{metadata !38, metadata !38, i64 0}
!38 = metadata !{metadata !"int", metadata !28, i64 0}
!39 = metadata !{i32 34, i32 0, metadata !40, null}
!40 = metadata !{i32 786443, metadata !1, metadata !41, i32 34, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!41 = metadata !{i32 786443, metadata !1, metadata !42, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!42 = metadata !{i32 786443, metadata !1, metadata !4, i32 33, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!43 = metadata !{i32 35, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !1, metadata !40, i32 34, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ary3.c]
!45 = metadata !{i32 33, i32 0, metadata !42, null}
!46 = metadata !{i32 39, i32 0, metadata !4, null}
!47 = metadata !{i32 41, i32 0, metadata !4, null}
!48 = metadata !{i32 42, i32 0, metadata !4, null}
!49 = metadata !{i32 44, i32 0, metadata !4, null}
