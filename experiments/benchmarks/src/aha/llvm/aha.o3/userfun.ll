; ModuleID = 'userfun.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @userfun(i32 %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !10, metadata !14), !dbg !15
  %and = and i32 %x, -4, !dbg !16
  %and1 = shl i32 %x, 1, !dbg !17
  %shl = and i32 %and1, 2, !dbg !17
  %or = or i32 %shl, %and, !dbg !18
  %and2 = lshr i32 %x, 1, !dbg !19
  %shr6 = and i32 %and2, 1, !dbg !19
  %or3 = or i32 %or, %shr6, !dbg !18
  ret i32 %or3, !dbg !20
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12}
!llvm.ident = !{!13}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/aha/userfun.c] [DW_LANG_C99]
!1 = !{!"userfun.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/aha"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00userfun\00userfun\00\005\000\001\000\000\00256\001\005", !1, !5, !6, null, i32 (i32)* @userfun, null, null, !9} ; [ DW_TAG_subprogram ] [line 5] [def] [userfun]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/aha/userfun.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!10}
!10 = !{!"0x101\00x\0016777221\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [x] [line 5]
!11 = !{i32 2, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 2}
!13 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!14 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!15 = !MDLocation(line: 5, column: 17, scope: !4)
!16 = !MDLocation(line: 18, column: 10, scope: !4)
!17 = !MDLocation(line: 18, column: 29, scope: !4)
!18 = !MDLocation(line: 18, column: 9, scope: !4)
!19 = !MDLocation(line: 18, column: 46, scope: !4)
!20 = !MDLocation(line: 18, column: 2, scope: !4)
