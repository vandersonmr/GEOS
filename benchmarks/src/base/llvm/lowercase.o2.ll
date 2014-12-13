; ModuleID = 'lowercase.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !63
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !63
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !15), !dbg !65
  br label %1, !dbg !65

; <label>:1                                       ; preds = %1, %0
  %i.01 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.dbg.value(metadata !{i64 %i.01}, i64 0, metadata !67) #3, !dbg !69
  tail call void @llvm.dbg.value(metadata !{i64 %i.01}, i64 0, metadata !70) #3, !dbg !71
  tail call void @llvm.dbg.value(metadata !72, i64 0, metadata !73) #3, !dbg !74
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !75) #3, !dbg !76
  tail call void @llvm.dbg.value(metadata !72, i64 0, metadata !78) #3, !dbg !79
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str, i64 0, i64 0), i64 %i.01, i64 %i.01) #3, !dbg !80
  tail call void @llvm.dbg.value(metadata !64, i64 0, metadata !75) #3, !dbg !81
  %3 = add i64 %i.01, 1, !dbg !65
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !15), !dbg !65
  %exitcond = icmp eq i64 %3, 32, !dbg !65
  br i1 %exitcond, label %4, label %1, !dbg !65

; <label>:4                                       ; preds = %1
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!60, !61}
!llvm.ident = !{!62}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !54, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lowercase.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !19, metadata !33, metadata !49}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 51, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 52} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777267, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 51]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554483, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 51]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 53, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 53]
!16 = metadata !{i32 786454, metadata !17, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!17 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!18 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!19 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"doTest", metadata !"doTest", metadata !"", i32 30, metadata !20, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !22, i32 31} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [scope 31] [doTest]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{null, metadata !16}
!22 = metadata !{metadata !23, metadata !24, metadata !26, metadata !27, metadata !31, metadata !32}
!23 = metadata !{i32 786689, metadata !19, metadata !"numberOfIterations", metadata !5, i32 16777246, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!24 = metadata !{i32 786688, metadata !19, metadata !"numberOfCharacters", metadata !5, i32 32, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!25 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from size_t]
!26 = metadata !{i32 786688, metadata !19, metadata !"testDataLength", metadata !5, i32 33, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [testDataLength] [line 33]
!27 = metadata !{i32 786688, metadata !19, metadata !"testData", metadata !5, i32 34, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from UChar]
!29 = metadata !{i32 786454, metadata !1, null, metadata !"UChar", i32 6, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [UChar] [line 6, size 0, align 0, offset 0] [from unsigned short]
!30 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!31 = metadata !{i32 786688, metadata !19, metadata !"i", metadata !5, i32 35, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 35]
!32 = metadata !{i32 786688, metadata !19, metadata !"result", metadata !5, i32 39, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 39]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"lower_StringImpl", metadata !"lower_StringImpl", metadata !"", i32 11, metadata !34, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !40, i32 12} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [lower_StringImpl]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !16, metadata !36, metadata !16, metadata !39}
!36 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from UChar]
!39 = metadata !{i32 786487, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46}
!41 = metadata !{i32 786689, metadata !33, metadata !"data", metadata !5, i32 16777227, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 11]
!42 = metadata !{i32 786689, metadata !33, metadata !"length", metadata !5, i32 33554443, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 11]
!43 = metadata !{i32 786689, metadata !33, metadata !"output", metadata !5, i32 50331659, metadata !39, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [output] [line 11]
!44 = metadata !{i32 786688, metadata !33, metadata !"ored", metadata !5, i32 14, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ored] [line 14]
!45 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !5, i32 15, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 15]
!46 = metadata !{i32 786688, metadata !47, metadata !"c", metadata !5, i32 17, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!47 = metadata !{i32 786443, metadata !1, metadata !48, i32 16, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!48 = metadata !{i32 786443, metadata !1, metadata !33, i32 16, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!49 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"toASCIILower", metadata !"toASCIILower", metadata !"", i32 8, metadata !50, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !52, i32 8} ; [ DW_TAG_subprogram ] [line 8] [local] [def] [toASCIILower]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !29, metadata !29}
!52 = metadata !{metadata !53}
!53 = metadata !{i32 786689, metadata !49, metadata !"c", metadata !5, i32 16777224, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 8]
!54 = metadata !{metadata !55, metadata !55, metadata !55, metadata !55, metadata !55, metadata !56}
!55 = metadata !{i32 786484, i32 0, metadata !5, metadata !"staticDataLength", metadata !"staticDataLength", metadata !"staticDataLength", metadata !5, i32 28, metadata !25, i32 1, i32 1, i64 16, null} ; [ DW_TAG_variable ] [staticDataLength] [line 28] [local] [def]
!56 = metadata !{i32 786484, i32 0, null, metadata !"staticData", metadata !"staticData", metadata !"", metadata !5, i32 27, metadata !57, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [staticData] [line 27] [local] [def]
!57 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 16, i32 0, i32 0, metadata !29, metadata !58, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 16, offset 0] [from UChar]
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786465, i64 0, i64 16}       ; [ DW_TAG_subrange_type ] [0, 15]
!60 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!61 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!62 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!63 = metadata !{i32 51, i32 0, metadata !4, null}
!64 = metadata !{i64 0}
!65 = metadata !{i32 54, i32 0, metadata !66, null}
!66 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!67 = metadata !{i32 786689, metadata !19, metadata !"numberOfIterations", metadata !5, i32 16777246, metadata !16, i32 0, metadata !68} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!68 = metadata !{i32 55, i32 0, metadata !66, null}
!69 = metadata !{i32 30, i32 0, metadata !19, metadata !68}
!70 = metadata !{i32 786688, metadata !19, metadata !"numberOfCharacters", metadata !5, i32 32, metadata !25, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!71 = metadata !{i32 32, i32 0, metadata !19, metadata !68}
!72 = metadata !{i16* undef}
!73 = metadata !{i32 786688, metadata !19, metadata !"testData", metadata !5, i32 34, metadata !28, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!74 = metadata !{i32 34, i32 0, metadata !19, metadata !68}
!75 = metadata !{i32 786688, metadata !19, metadata !"i", metadata !5, i32 35, metadata !16, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [i] [line 35]
!76 = metadata !{i32 36, i32 0, metadata !77, metadata !68}
!77 = metadata !{i32 786443, metadata !1, metadata !19, i32 36, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!78 = metadata !{i32 786688, metadata !19, metadata !"result", metadata !5, i32 39, metadata !28, i32 0, metadata !68} ; [ DW_TAG_auto_variable ] [result] [line 39]
!79 = metadata !{i32 39, i32 0, metadata !19, metadata !68}
!80 = metadata !{i32 40, i32 0, metadata !19, metadata !68}
!81 = metadata !{i32 46, i32 0, metadata !82, metadata !68}
!82 = metadata !{i32 786443, metadata !1, metadata !19, i32 46, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lowercase.c]
!83 = metadata !{i32 57, i32 0, metadata !4, null}
