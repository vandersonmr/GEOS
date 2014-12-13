; ModuleID = 'random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1
@gen_random.last = internal unnamed_addr global i64 42, align 8

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !28
  %1 = icmp eq i32 %argc, 2, !dbg !29
  br i1 %1, label %2, label %.preheader, !dbg !29

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !29
  %4 = load i8** %3, align 8, !dbg !29, !tbaa !30
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !29
  %phitmp = add i32 %5, -1, !dbg !29
  br label %.preheader, !dbg !29

.preheader:                                       ; preds = %0, %2
  %N.0.ph = phi i32 [ %phitmp, %2 ], [ 399999999, %0 ]
  %gen_random.last.promoted = load i64* @gen_random.last, align 8, !dbg !34, !tbaa !37
  br label %6, !dbg !39

; <label>:6                                       ; preds = %.preheader, %6
  %7 = phi i64 [ %12, %6 ], [ %gen_random.last.promoted, %.preheader ], !dbg !39
  %N.0 = phi i32 [ %8, %6 ], [ %N.0.ph, %.preheader ]
  %8 = add nsw i32 %N.0, -1, !dbg !39
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !15), !dbg !39
  %9 = icmp eq i32 %N.0, 0, !dbg !39
  tail call void @llvm.dbg.value(metadata !40, i64 0, metadata !41), !dbg !42
  %10 = mul nsw i64 %7, 3877, !dbg !34
  %11 = add nsw i64 %10, 29573, !dbg !34
  %12 = srem i64 %11, 139968, !dbg !34
  br i1 %9, label %13, label %6, !dbg !39

; <label>:13                                      ; preds = %6
  store i64 %12, i64* @gen_random.last, align 8, !dbg !34, !tbaa !37
  %14 = sitofp i64 %12 to double, !dbg !43
  %15 = fmul double %14, 1.000000e+02, !dbg !43
  %16 = fdiv double %15, 1.399680e+05, !dbg !43
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %16) #5, !dbg !44
  ret i32 0, !dbg !45
}

; Function Attrs: minsize nounwind optsize readonly
declare i32 @atoi(i8* nocapture) #1

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { minsize nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { minsize nounwind optsize readonly }
attributes #5 = { minsize nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !22, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c] [DW_LANG_C99]
!1 = metadata !{metadata !"random.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !16}
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
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"gen_random", metadata !"gen_random", metadata !"", i32 16, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !20, i32 16} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!20 = metadata !{metadata !21}
!21 = metadata !{i32 786689, metadata !16, metadata !"max", metadata !5, i32 16777232, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max] [line 16]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786484, i32 0, metadata !16, metadata !"last", metadata !"last", metadata !"", metadata !5, i32 17, metadata !24, i32 1, i32 1, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!24 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!28 = metadata !{i32 23, i32 0, metadata !4, null}
!29 = metadata !{i32 29, i32 0, metadata !4, null}
!30 = metadata !{metadata !31, metadata !31, i64 0}
!31 = metadata !{metadata !"any pointer", metadata !32, i64 0}
!32 = metadata !{metadata !"omnipotent char", metadata !33, i64 0}
!33 = metadata !{metadata !"Simple C/C++ TBAA"}
!34 = metadata !{i32 19, i32 0, metadata !16, metadata !35}
!35 = metadata !{i32 32, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !4, i32 31, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/random.c]
!37 = metadata !{metadata !38, metadata !38, i64 0}
!38 = metadata !{metadata !"long", metadata !32, i64 0}
!39 = metadata !{i32 31, i32 0, metadata !4, null}
!40 = metadata !{double 1.000000e+02}
!41 = metadata !{i32 786689, metadata !16, metadata !"max", metadata !5, i32 16777232, metadata !19, i32 0, metadata !35} ; [ DW_TAG_arg_variable ] [max] [line 16]
!42 = metadata !{i32 16, i32 0, metadata !16, metadata !35}
!43 = metadata !{i32 20, i32 0, metadata !16, metadata !35}
!44 = metadata !{i32 34, i32 0, metadata !4, null}
!45 = metadata !{i32 35, i32 0, metadata !4, null}
