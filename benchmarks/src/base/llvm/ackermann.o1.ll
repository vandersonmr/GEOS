; ModuleID = 'ackermann.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i32 @Ack(i32 %M, i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !10), !dbg !34
  tail call void @llvm.dbg.value(metadata !{i32 %N.tr.lcssa}, i64 0, metadata !11), !dbg !34
  %1 = icmp eq i32 %M, 0, !dbg !35
  br i1 %1, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !35

tailrecurse._crit_edge:                           ; preds = %tailrecurse.backedge, %0
  %N.tr.lcssa = phi i32 [ %N, %0 ], [ %N.tr.be, %tailrecurse.backedge ]
  %2 = add nsw i32 %N.tr.lcssa, 1, !dbg !35
  ret i32 %2, !dbg !37

.lr.ph:                                           ; preds = %0, %tailrecurse.backedge
  %N.tr2 = phi i32 [ %N.tr.be, %tailrecurse.backedge ], [ %N, %0 ]
  %M.tr1 = phi i32 [ %4, %tailrecurse.backedge ], [ %M, %0 ]
  %3 = icmp eq i32 %N.tr2, 0, !dbg !38
  %4 = add nsw i32 %M.tr1, -1, !dbg !38
  br i1 %3, label %tailrecurse.backedge, label %5, !dbg !38

; <label>:5                                       ; preds = %.lr.ph
  %6 = add nsw i32 %N.tr2, -1, !dbg !40
  %7 = tail call i32 @Ack(i32 %M.tr1, i32 %6), !dbg !40
  br label %tailrecurse.backedge, !dbg !40

tailrecurse.backedge:                             ; preds = %5, %.lr.ph
  %N.tr.be = phi i32 [ %7, %5 ], [ 1, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %M.tr1}, i64 0, metadata !10), !dbg !34
  tail call void @llvm.dbg.value(metadata !{i32 %N.tr.lcssa}, i64 0, metadata !11), !dbg !34
  %8 = icmp eq i32 %4, 0, !dbg !35
  br i1 %8, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !35
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !19), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !20), !dbg !41
  %1 = icmp eq i32 %argc, 2, !dbg !42
  br i1 %1, label %2, label %6, !dbg !42

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !43
  %4 = load i8** %3, align 8, !dbg !43, !tbaa !44
  %5 = tail call i32 @atoi(i8* %4) #5, !dbg !43
  br label %6, !dbg !43

; <label>:6                                       ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 8, %0 ], !dbg !43
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !21), !dbg !43
  %8 = tail call i32 @Ack(i32 3, i32 %7), !dbg !48
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %7, i32 %8) #6, !dbg !48
  ret i32 0, !dbg !49
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #2 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !30), !dbg !50
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !51
  %2 = trunc i64 %1 to i32, !dbg !51
  ret i32 %2, !dbg !51
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ackermann.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !22}
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
!22 = metadata !{i32 786478, metadata !23, metadata !24, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !29, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!23 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!24 = metadata !{i32 786473, metadata !23}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !8, metadata !27}
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786689, metadata !22, metadata !"__nptr", metadata !24, i32 16777494, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!31 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!32 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!33 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!34 = metadata !{i32 10, i32 0, metadata !4, null}
!35 = metadata !{i32 11, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!37 = metadata !{i32 14, i32 0, metadata !4, null}
!38 = metadata !{i32 12, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ackermann.c]
!40 = metadata !{i32 13, i32 0, metadata !4, null}
!41 = metadata !{i32 17, i32 0, metadata !12, null}
!42 = metadata !{i32 18, i32 0, metadata !12, null}
!43 = metadata !{i32 18, i32 28, metadata !12, null}
!44 = metadata !{metadata !45, metadata !45, i64 0}
!45 = metadata !{metadata !"any pointer", metadata !46, i64 0}
!46 = metadata !{metadata !"omnipotent char", metadata !47, i64 0}
!47 = metadata !{metadata !"Simple C/C++ TBAA"}
!48 = metadata !{i32 20, i32 0, metadata !12, null}
!49 = metadata !{i32 21, i32 0, metadata !12, null}
!50 = metadata !{i32 278, i32 0, metadata !22, null}
!51 = metadata !{i32 280, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !23, metadata !22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
