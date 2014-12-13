; ModuleID = 'fib2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i64 @fib(i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !10), !dbg !25
  %1 = icmp ult i64 %n, 2, !dbg !26
  br i1 %1, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !26

tailrecurse:                                      ; preds = %0, %tailrecurse
  %n.tr2 = phi i64 [ %4, %tailrecurse ], [ %n, %0 ]
  %accumulator.tr1 = phi i64 [ %5, %tailrecurse ], [ 1, %0 ]
  %2 = add i64 %n.tr2, -2, !dbg !28
  %3 = tail call i64 @fib(i64 %2), !dbg !28
  %4 = add i64 %n.tr2, -1, !dbg !28
  %5 = add i64 %3, %accumulator.tr1, !dbg !28
  tail call void @llvm.dbg.value(metadata !{i64 %n.tr2}, i64 0, metadata !10), !dbg !25
  %6 = icmp ult i64 %4, 2, !dbg !26
  br i1 %6, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !26

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %accumulator.tr.lcssa = phi i64 [ 1, %0 ], [ %5, %tailrecurse ]
  ret i64 %accumulator.tr.lcssa, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !19), !dbg !30
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !20), !dbg !30
  %1 = icmp eq i32 %argc, 2, !dbg !31
  br i1 %1, label %2, label %6, !dbg !31

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !31
  %4 = load i8** %3, align 8, !dbg !31, !tbaa !32
  %5 = tail call i32 @atoi(i8* %4) #5, !dbg !31
  %phitmp = sext i32 %5 to i64, !dbg !31
  br label %6, !dbg !31

; <label>:6                                       ; preds = %0, %2
  %7 = phi i64 [ %phitmp, %2 ], [ 43, %0 ]
  %8 = tail call i64 @fib(i64 %7), !dbg !36
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i64 %8) #5, !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fib2.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !11}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fib", metadata !"fib", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @fib, null, null, metadata !9, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [fib]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 10]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 18, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !18, i32 18} ; [ DW_TAG_subprogram ] [line 18] [def] [main]
!12 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = metadata !{metadata !14, metadata !14, metadata !15}
!14 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!17 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!18 = metadata !{metadata !19, metadata !20, metadata !21}
!19 = metadata !{i32 786689, metadata !11, metadata !"argc", metadata !5, i32 16777234, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!20 = metadata !{i32 786689, metadata !11, metadata !"argv", metadata !5, i32 33554450, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!21 = metadata !{i32 786688, metadata !11, metadata !"N", metadata !5, i32 24, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 24]
!22 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!23 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!24 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!25 = metadata !{i32 10, i32 0, metadata !4, null}
!26 = metadata !{i32 11, i32 0, metadata !27, null}
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fib2.c]
!28 = metadata !{i32 14, i32 0, metadata !27, null}
!29 = metadata !{i32 15, i32 0, metadata !4, null}
!30 = metadata !{i32 18, i32 0, metadata !11, null}
!31 = metadata !{i32 24, i32 0, metadata !11, null}
!32 = metadata !{metadata !33, metadata !33, i64 0}
!33 = metadata !{metadata !"any pointer", metadata !34, i64 0}
!34 = metadata !{metadata !"omnipotent char", metadata !35, i64 0}
!35 = metadata !{metadata !"Simple C/C++ TBAA"}
!36 = metadata !{i32 25, i32 0, metadata !11, null}
!37 = metadata !{i32 26, i32 0, metadata !11, null}
