; ModuleID = 'lowercase.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !13, metadata !64), !dbg !65
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !14, metadata !64), !dbg !66
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !64), !dbg !67
  br label %for.body, !dbg !68

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !70, metadata !64) #3, !dbg !73
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !74, metadata !64) #3, !dbg !75
  tail call void @llvm.dbg.value(metadata i16* undef, i64 0, metadata !76, metadata !64) #3, !dbg !77
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !64) #3, !dbg !79
  tail call void @llvm.dbg.value(metadata i16* undef, i64 0, metadata !80, metadata !64) #3, !dbg !81
  %call5.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str, i64 0, i64 0), i64 %i.03, i64 %i.03) #3, !dbg !82
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !64) #3, !dbg !79
  %inc = add nuw nsw i64 %i.03, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !15, metadata !64), !dbg !67
  %exitcond = icmp eq i64 %inc, 32, !dbg !68
  br i1 %exitcond, label %for.end, label %for.body, !dbg !68

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!61, !62}
!llvm.ident = !{!63}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !55, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c] [DW_LANG_C99]
!1 = !{!"lowercase.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !19, !33, !50}
!4 = !{!"0x2e\00main\00main\00\0051\000\001\000\000\00256\001\0052", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !12} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!13, !14, !15}
!13 = !{!"0x101\00argc\0016777267\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 51]
!14 = !{!"0x101\00argv\0033554483\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 51]
!15 = !{!"0x100\00i\0053\000", !4, !5, !16}       ; [ DW_TAG_auto_variable ] [i] [line 53]
!16 = !{!"0x16\00size_t\0062\000\000\000\000", !17, null, !18} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!17 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!18 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!19 = !{!"0x2e\00doTest\00doTest\00\0030\001\001\000\000\00256\001\0031", !1, !5, !20, null, null, null, null, !22} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [scope 31] [doTest]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{null, !16}
!22 = !{!23, !24, !26, !27, !31, !32}
!23 = !{!"0x101\00numberOfIterations\0016777246\000", !19, !5, !16} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!24 = !{!"0x100\00numberOfCharacters\0032\000", !19, !5, !25} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!25 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from size_t]
!26 = !{!"0x100\00testDataLength\0033\000", !19, !5, !25} ; [ DW_TAG_auto_variable ] [testDataLength] [line 33]
!27 = !{!"0x100\00testData\0034\000", !19, !5, !28} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from UChar]
!29 = !{!"0x16\00UChar\006\000\000\000\000", !1, null, !30} ; [ DW_TAG_typedef ] [UChar] [line 6, size 0, align 0, offset 0] [from unsigned short]
!30 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!31 = !{!"0x100\00i\0035\000", !19, !5, !16}      ; [ DW_TAG_auto_variable ] [i] [line 35]
!32 = !{!"0x100\00result\0039\000", !19, !5, !28} ; [ DW_TAG_auto_variable ] [result] [line 39]
!33 = !{!"0x2e\00lower_StringImpl\00lower_StringImpl\00\0011\001\001\000\000\00256\001\0012", !1, !5, !34, null, null, null, null, !40} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [lower_StringImpl]
!34 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !35, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = !{!16, !36, !16, !39}
!36 = !{!"0x37\00\000\000\000\000\000", null, null, !37} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{!"0xf\00\000\0064\0064\000\000", null, null, !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = !{!"0x26\00\000\000\000\000\000", null, null, !29} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from UChar]
!39 = !{!"0x37\00\000\000\000\000\000", null, null, !28} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = !{!41, !42, !43, !44, !45, !46}
!41 = !{!"0x101\00data\0016777227\000", !33, !5, !36} ; [ DW_TAG_arg_variable ] [data] [line 11]
!42 = !{!"0x101\00length\0033554443\000", !33, !5, !16} ; [ DW_TAG_arg_variable ] [length] [line 11]
!43 = !{!"0x101\00output\0050331659\000", !33, !5, !39} ; [ DW_TAG_arg_variable ] [output] [line 11]
!44 = !{!"0x100\00ored\0014\000", !33, !5, !29}   ; [ DW_TAG_auto_variable ] [ored] [line 14]
!45 = !{!"0x100\00i\0015\000", !33, !5, !16}      ; [ DW_TAG_auto_variable ] [i] [line 15]
!46 = !{!"0x100\00c\0017\000", !47, !5, !29}      ; [ DW_TAG_auto_variable ] [c] [line 17]
!47 = !{!"0xb\0016\0032\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!48 = !{!"0xb\0016\003\007", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!49 = !{!"0xb\0016\003\006", !1, !33}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!50 = !{!"0x2e\00toASCIILower\00toASCIILower\00\008\001\001\000\000\00256\001\008", !1, !5, !51, null, null, null, null, !53} ; [ DW_TAG_subprogram ] [line 8] [local] [def] [toASCIILower]
!51 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !52, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = !{!29, !29}
!53 = !{!54}
!54 = !{!"0x101\00c\0016777224\000", !50, !5, !29} ; [ DW_TAG_arg_variable ] [c] [line 8]
!55 = !{!56, !57}
!56 = !{!"0x34\00staticDataLength\00staticDataLength\00\0028\001\001", null, !5, !25, i64 16, null} ; [ DW_TAG_variable ] [staticDataLength] [line 28] [local] [def]
!57 = !{!"0x34\00staticData\00staticData\00\0027\001\001", null, !5, !58, null, null} ; [ DW_TAG_variable ] [staticData] [line 27] [local] [def]
!58 = !{!"0x1\00\000\00256\0016\000\000\000", null, null, !29, !59, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 16, offset 0] [from UChar]
!59 = !{!60}
!60 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!61 = !{i32 2, !"Dwarf Version", i32 4}
!62 = !{i32 2, !"Debug Info Version", i32 2}
!63 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!64 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!65 = !MDLocation(line: 51, column: 14, scope: !4)
!66 = !MDLocation(line: 51, column: 27, scope: !4)
!67 = !MDLocation(line: 53, column: 10, scope: !4)
!68 = !MDLocation(line: 54, column: 3, scope: !69)
!69 = !{!"0xb\0054\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!70 = !{!"0x101\00numberOfIterations\0016777246\000", !19, !5, !16, !71} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!71 = !MDLocation(line: 55, column: 5, scope: !72)
!72 = !{!"0xb\0054\003\001", !1, !69}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!73 = !MDLocation(line: 30, column: 27, scope: !19, inlinedAt: !71)
!74 = !{!"0x100\00numberOfCharacters\0032\000", !19, !5, !25, !71} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!75 = !MDLocation(line: 32, column: 16, scope: !19, inlinedAt: !71)
!76 = !{!"0x100\00testData\0034\000", !19, !5, !28, !71} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!77 = !MDLocation(line: 34, column: 10, scope: !19, inlinedAt: !71)
!78 = !{!"0x100\00i\0035\000", !19, !5, !16, !71} ; [ DW_TAG_auto_variable ] [i] [line 35]
!79 = !MDLocation(line: 35, column: 10, scope: !19, inlinedAt: !71)
!80 = !{!"0x100\00result\0039\000", !19, !5, !28, !71} ; [ DW_TAG_auto_variable ] [result] [line 39]
!81 = !MDLocation(line: 39, column: 10, scope: !19, inlinedAt: !71)
!82 = !MDLocation(line: 40, column: 3, scope: !19, inlinedAt: !71)
!83 = !MDLocation(line: 54, column: 23, scope: !72)
!84 = !MDLocation(line: 57, column: 3, scope: !4)
