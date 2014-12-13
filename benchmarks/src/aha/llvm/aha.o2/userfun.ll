; ModuleID = 'userfun.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @userfun(i32 %x) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !10), !dbg !14
  %1 = and i32 %x, -4, !dbg !15
  %2 = shl i32 %x, 1, !dbg !15
  %3 = and i32 %2, 2, !dbg !15
  %4 = or i32 %3, %1, !dbg !15
  %5 = lshr i32 %x, 1, !dbg !15
  %6 = and i32 %5, 1, !dbg !15
  %7 = or i32 %4, %6, !dbg !15
  ret i32 %7, !dbg !15
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/userfun.c] [DW_LANG_C99]
!1 = metadata !{metadata !"userfun.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"userfun", metadata !"userfun", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @userfun, null, null, metadata !9, i32 5} ; [ DW_TAG_subprogram ] [line 5] [def] [userfun]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/aha/userfun.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 5]
!11 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!12 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!13 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!14 = metadata !{i32 5, i32 0, metadata !4, null}
!15 = metadata !{i32 18, i32 0, metadata !4, null}
