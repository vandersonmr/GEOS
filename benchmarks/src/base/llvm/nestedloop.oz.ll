; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !26
  %1 = icmp eq i32 %argc, 2, !dbg !27
  br i1 %1, label %2, label %.preheader4.lr.ph, !dbg !27

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !27
  %4 = load i8** %3, align 8, !dbg !27, !tbaa !28
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !27
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !32, i64 0, metadata !22), !dbg !33
  tail call void @llvm.dbg.value(metadata !32, i64 0, metadata !16), !dbg !34
  %6 = icmp sgt i32 %5, 0, !dbg !34
  br i1 %6, label %.preheader4.lr.ph, label %._crit_edge25, !dbg !34

.preheader4.lr.ph:                                ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 46, %0 ]
  br label %.preheader3.lr.ph, !dbg !34

.preheader3.lr.ph:                                ; preds = %.preheader4.lr.ph, %._crit_edge21
  %x.024 = phi i32 [ 0, %.preheader4.lr.ph ], [ %9, %._crit_edge21 ]
  %a.023 = phi i32 [ 0, %.preheader4.lr.ph ], [ %14, %._crit_edge21 ]
  br label %.preheader2.lr.ph, !dbg !36

.preheader2.lr.ph:                                ; preds = %.preheader3.lr.ph, %._crit_edge17
  %x.120 = phi i32 [ %x.024, %.preheader3.lr.ph ], [ %9, %._crit_edge17 ]
  %b.019 = phi i32 [ 0, %.preheader3.lr.ph ], [ %13, %._crit_edge17 ]
  br label %.preheader1.lr.ph, !dbg !38

.preheader1.lr.ph:                                ; preds = %.preheader2.lr.ph, %._crit_edge13
  %x.216 = phi i32 [ %x.120, %.preheader2.lr.ph ], [ %9, %._crit_edge13 ]
  %c.015 = phi i32 [ 0, %.preheader2.lr.ph ], [ %12, %._crit_edge13 ]
  br label %.preheader.lr.ph, !dbg !40

.preheader.lr.ph:                                 ; preds = %.preheader1.lr.ph, %._crit_edge9
  %x.312 = phi i32 [ %x.216, %.preheader1.lr.ph ], [ %9, %._crit_edge9 ]
  %d.011 = phi i32 [ 0, %.preheader1.lr.ph ], [ %11, %._crit_edge9 ]
  br label %8, !dbg !42

; <label>:8                                       ; preds = %8, %.preheader.lr.ph
  %x.48 = phi i32 [ %x.312, %.preheader.lr.ph ], [ %9, %8 ]
  %e.07 = phi i32 [ 0, %.preheader.lr.ph ], [ %10, %8 ]
  %9 = add i32 %7, %x.48, !dbg !44
  %10 = add nsw i32 %e.07, 1, !dbg !42
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !20), !dbg !42
  %exitcond = icmp eq i32 %10, %7, !dbg !42
  br i1 %exitcond, label %._crit_edge9, label %8, !dbg !42

._crit_edge9:                                     ; preds = %8
  %11 = add nsw i32 %d.011, 1, !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !19), !dbg !40
  %exitcond27 = icmp eq i32 %11, %7, !dbg !40
  br i1 %exitcond27, label %._crit_edge13, label %.preheader.lr.ph, !dbg !40

._crit_edge13:                                    ; preds = %._crit_edge9
  %12 = add nsw i32 %c.015, 1, !dbg !38
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !18), !dbg !38
  %exitcond28 = icmp eq i32 %12, %7, !dbg !38
  br i1 %exitcond28, label %._crit_edge17, label %.preheader1.lr.ph, !dbg !38

._crit_edge17:                                    ; preds = %._crit_edge13
  %13 = add nsw i32 %b.019, 1, !dbg !36
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !17), !dbg !36
  %exitcond29 = icmp eq i32 %13, %7, !dbg !36
  br i1 %exitcond29, label %._crit_edge21, label %.preheader2.lr.ph, !dbg !36

._crit_edge21:                                    ; preds = %._crit_edge17
  %14 = add nsw i32 %a.023, 1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !16), !dbg !34
  %exitcond30 = icmp eq i32 %14, %7, !dbg !34
  br i1 %exitcond30, label %._crit_edge25, label %.preheader3.lr.ph, !dbg !34

._crit_edge25:                                    ; preds = %._crit_edge21, %2
  %x.0.lcssa = phi i32 [ 0, %2 ], [ %9, %._crit_edge21 ]
  %15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %x.0.lcssa) #5, !dbg !46
  ret i32 0, !dbg !47
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
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nestedloop.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!15 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 16]
!16 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 17]
!17 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 17]
!18 = metadata !{i32 786688, metadata !4, metadata !"c", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 17]
!19 = metadata !{i32 786688, metadata !4, metadata !"d", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 17]
!20 = metadata !{i32 786688, metadata !4, metadata !"e", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 17]
!21 = metadata !{i32 786688, metadata !4, metadata !"f", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 17]
!22 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 17]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!26 = metadata !{i32 10, i32 0, metadata !4, null}
!27 = metadata !{i32 16, i32 0, metadata !4, null}
!28 = metadata !{metadata !29, metadata !29, i64 0}
!29 = metadata !{metadata !"any pointer", metadata !30, i64 0}
!30 = metadata !{metadata !"omnipotent char", metadata !31, i64 0}
!31 = metadata !{metadata !"Simple C/C++ TBAA"}
!32 = metadata !{i32 0}
!33 = metadata !{i32 17, i32 0, metadata !4, null}
!34 = metadata !{i32 19, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!36 = metadata !{i32 20, i32 0, metadata !37, null}
!37 = metadata !{i32 786443, metadata !1, metadata !35, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!38 = metadata !{i32 21, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !37, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!40 = metadata !{i32 22, i32 0, metadata !41, null}
!41 = metadata !{i32 786443, metadata !1, metadata !39, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!42 = metadata !{i32 23, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !41, i32 23, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!44 = metadata !{i32 24, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !43, i32 24, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!46 = metadata !{i32 27, i32 0, metadata !4, null}
!47 = metadata !{i32 28, i32 0, metadata !4, null}
