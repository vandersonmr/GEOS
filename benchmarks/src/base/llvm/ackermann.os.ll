; ModuleID = 'ackermann.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1

; Function Attrs: nounwind optsize readnone uwtable
define i32 @Ack(i32 %M, i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !10), !dbg !25
  tail call void @llvm.dbg.value(metadata !{i32 %N.tr.lcssa}, i64 0, metadata !11), !dbg !25
  %1 = icmp eq i32 %M, 0, !dbg !26
  br i1 %1, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !26

tailrecurse._crit_edge:                           ; preds = %tailrecurse.backedge, %0
  %N.tr.lcssa = phi i32 [ %N, %0 ], [ %N.tr.be, %tailrecurse.backedge ]
  %2 = add nsw i32 %N.tr.lcssa, 1, !dbg !26
  ret i32 %2, !dbg !28

.lr.ph:                                           ; preds = %0, %tailrecurse.backedge
  %N.tr2 = phi i32 [ %N.tr.be, %tailrecurse.backedge ], [ %N, %0 ]
  %M.tr1 = phi i32 [ %4, %tailrecurse.backedge ], [ %M, %0 ]
  %3 = icmp eq i32 %N.tr2, 0, !dbg !29
  %4 = add nsw i32 %M.tr1, -1, !dbg !29
  br i1 %3, label %tailrecurse.backedge, label %5, !dbg !29

; <label>:5                                       ; preds = %.lr.ph
  %6 = add nsw i32 %N.tr2, -1, !dbg !31
  %7 = tail call i32 @Ack(i32 %M.tr1, i32 %6) #5, !dbg !31
  br label %tailrecurse.backedge, !dbg !31

tailrecurse.backedge:                             ; preds = %5, %.lr.ph
  %N.tr.be = phi i32 [ %7, %5 ], [ 1, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %M.tr1}, i64 0, metadata !10), !dbg !25
  tail call void @llvm.dbg.value(metadata !{i32 %N.tr.lcssa}, i64 0, metadata !11), !dbg !25
  %8 = icmp eq i32 %4, 0, !dbg !26
  br i1 %8, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !26
}

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !19), !dbg !32
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !20), !dbg !32
  %1 = icmp eq i32 %argc, 2, !dbg !33
  br i1 %1, label %2, label %6, !dbg !33

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !33
  %4 = load i8** %3, align 8, !dbg !33, !tbaa !34
  %5 = tail call i32 @atoi(i8* %4) #6, !dbg !33
  br label %6, !dbg !33

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 8, %0 ], !dbg !33
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !21), !dbg !33
  %8 = tail call i32 @Ack(i32 3, i32 %7) #5, !dbg !38
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %7, i32 %8) #7, !dbg !38
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { optsize }
attributes #6 = { nounwind optsize readonly }
attributes #7 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ackermann.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Ack", metadata !"Ack", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @Ack, null, null, metadata !9, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [Ack]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !11}
!10 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 10]
!11 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 10]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !18, i32 17} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8, metadata !8, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!17 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786689, metadata !12, metadata !"argc", metadata !5, i32 16777233, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!20 = metadata !{i32 786689, metadata !12, metadata !"argv", metadata !5, i32 33554449, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!21 = metadata !{i32 786688, metadata !12, metadata !"n", metadata !5, i32 18, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 18]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!25 = metadata !{i32 10, i32 0, metadata !4, null}
!26 = metadata !{i32 11, i32 0, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!28 = metadata !{i32 14, i32 0, metadata !4, null}
!29 = metadata !{i32 12, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!31 = metadata !{i32 13, i32 0, metadata !4, null}
!32 = metadata !{i32 17, i32 0, metadata !12, null}
!33 = metadata !{i32 18, i32 0, metadata !12, null}
!34 = metadata !{metadata !35, metadata !35, i64 0}
!35 = metadata !{metadata !"any pointer", metadata !36, i64 0}
!36 = metadata !{metadata !"omnipotent char", metadata !37, i64 0}
!37 = metadata !{metadata !"Simple C/C++ TBAA"}
!38 = metadata !{i32 20, i32 0, metadata !12, null}
!39 = metadata !{i32 21, i32 0, metadata !12, null}
