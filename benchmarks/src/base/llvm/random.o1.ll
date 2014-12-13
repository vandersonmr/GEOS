; ModuleID = 'random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1
@gen_random.last = internal unnamed_addr global i64 42, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !37
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !37
  %1 = icmp eq i32 %argc, 2, !dbg !38
  br i1 %1, label %2, label %.preheader, !dbg !38

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !39
  %4 = load i8** %3, align 8, !dbg !39, !tbaa !40
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !39
  %phitmp = add i32 %5, -1, !dbg !39
  br label %.preheader, !dbg !39

.preheader:                                       ; preds = %2, %0, %.preheader
  %N.0 = phi i32 [ %6, %.preheader ], [ %phitmp, %2 ], [ 399999999, %0 ]
  %6 = add nsw i32 %N.0, -1, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !15), !dbg !44
  %7 = icmp eq i32 %N.0, 0, !dbg !44
  %8 = tail call fastcc double @gen_random(), !dbg !45
  br i1 %7, label %9, label %.preheader, !dbg !44

; <label>:9                                       ; preds = %.preheader
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %8) #5, !dbg !47
  ret i32 0, !dbg !48
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #1 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !30), !dbg !49
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !50
  %2 = trunc i64 %1 to i32, !dbg !50
  ret i32 %2, !dbg !50
}

; Function Attrs: nounwind uwtable
define internal fastcc double @gen_random() #0 {
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !21), !dbg !53
  %1 = load i64* @gen_random.last, align 8, !dbg !54, !tbaa !55
  %2 = mul nsw i64 %1, 3877, !dbg !54
  %3 = add nsw i64 %2, 29573, !dbg !54
  %4 = srem i64 %3, 139968, !dbg !54
  store i64 %4, i64* @gen_random.last, align 8, !dbg !54, !tbaa !55
  %5 = sitofp i64 %4 to double, !dbg !57
  %6 = fmul double %5, 1.000000e+02, !dbg !57
  %7 = fdiv double %6, 1.399680e+05, !dbg !57
  ret double %7, !dbg !57
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

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
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !31, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !16, metadata !22}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 23} ; [ DW_TAG_subprogram ] [line 23] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 23]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554455, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 23]
!15 = metadata !{i32 786688, metadata !4, metadata !"N", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 29]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_random", metadata !"gen_random", metadata !"", i32 16, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, double ()* @gen_random, null, null, metadata !20, i32 16} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786689, metadata !16, metadata !"max", metadata !5, i32 16777232, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 16]
!22 = metadata !{i32 786478, metadata !23, metadata !24, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !29, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!23 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!24 = metadata !{i32 786473, metadata !23}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!25 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = metadata !{metadata !8, metadata !27}
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786689, metadata !22, metadata !"__nptr", metadata !24, i32 16777494, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786484, i32 0, metadata !16, metadata !"last", metadata !"last", metadata !"", metadata !5, i32 17, metadata !33, i32 1, i32 1, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!33 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!35 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!36 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!37 = metadata !{i32 23, i32 0, metadata !4, null}
!38 = metadata !{i32 29, i32 0, metadata !4, null}
!39 = metadata !{i32 29, i32 26, metadata !4, null}
!40 = metadata !{metadata !41, metadata !41, i64 0}
!41 = metadata !{metadata !"any pointer", metadata !42, i64 0}
!42 = metadata !{metadata !"omnipotent char", metadata !43, i64 0}
!43 = metadata !{metadata !"Simple C/C++ TBAA"}
!44 = metadata !{i32 31, i32 0, metadata !4, null}
!45 = metadata !{i32 32, i32 0, metadata !46, null}
!46 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c]
!47 = metadata !{i32 34, i32 0, metadata !4, null}
!48 = metadata !{i32 35, i32 0, metadata !4, null}
!49 = metadata !{i32 278, i32 0, metadata !22, null}
!50 = metadata !{i32 280, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !23, metadata !22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!52 = metadata !{double 1.000000e+02}
!53 = metadata !{i32 16, i32 0, metadata !16, null}
!54 = metadata !{i32 19, i32 0, metadata !16, null}
!55 = metadata !{metadata !56, metadata !56, i64 0}
!56 = metadata !{metadata !"long", metadata !42, i64 0}
!57 = metadata !{i32 20, i32 0, metadata !16, null}
