; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !35
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !35
  %1 = icmp eq i32 %argc, 2, !dbg !36
  br i1 %1, label %2, label %.preheader4.lr.ph, !dbg !36

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i8** %argv, i64 1, !dbg !37
  %4 = load i8** %3, align 8, !dbg !37, !tbaa !38
  %5 = tail call i32 @atoi(i8* %4) #4, !dbg !37
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !15), !dbg !37
  tail call void @llvm.dbg.value(metadata !42, i64 0, metadata !22), !dbg !43
  tail call void @llvm.dbg.value(metadata !42, i64 0, metadata !16), !dbg !44
  %6 = icmp sgt i32 %5, 0, !dbg !44
  br i1 %6, label %.preheader4.lr.ph, label %._crit_edge25, !dbg !44

.preheader4.lr.ph:                                ; preds = %0, %2
  %7 = phi i32 [ %5, %2 ], [ 46, %0 ]
  %8 = icmp sgt i32 %7, 0, !dbg !46
  %9 = icmp sgt i32 %7, 0, !dbg !48
  %10 = icmp sgt i32 %7, 0, !dbg !50
  %11 = icmp sgt i32 %7, 0, !dbg !52
  %12 = icmp sgt i32 %7, 0, !dbg !54
  br label %.preheader4, !dbg !44

.preheader4:                                      ; preds = %._crit_edge21, %.preheader4.lr.ph
  %x.024 = phi i32 [ 0, %.preheader4.lr.ph ], [ %x.1.lcssa, %._crit_edge21 ]
  %a.023 = phi i32 [ 0, %.preheader4.lr.ph ], [ %18, %._crit_edge21 ]
  br i1 %8, label %.preheader3, label %._crit_edge21, !dbg !46

.preheader3:                                      ; preds = %.preheader4, %._crit_edge17
  %x.120 = phi i32 [ %x.2.lcssa, %._crit_edge17 ], [ %x.024, %.preheader4 ]
  %b.019 = phi i32 [ %17, %._crit_edge17 ], [ 0, %.preheader4 ]
  br i1 %9, label %.preheader2, label %._crit_edge17, !dbg !48

.preheader2:                                      ; preds = %.preheader3, %._crit_edge13
  %x.216 = phi i32 [ %x.3.lcssa, %._crit_edge13 ], [ %x.120, %.preheader3 ]
  %c.015 = phi i32 [ %16, %._crit_edge13 ], [ 0, %.preheader3 ]
  br i1 %10, label %.preheader1, label %._crit_edge13, !dbg !50

.preheader1:                                      ; preds = %.preheader2, %._crit_edge9
  %x.312 = phi i32 [ %x.4.lcssa, %._crit_edge9 ], [ %x.216, %.preheader2 ]
  %d.011 = phi i32 [ %15, %._crit_edge9 ], [ 0, %.preheader2 ]
  br i1 %11, label %.preheader, label %._crit_edge9, !dbg !52

.preheader:                                       ; preds = %.preheader1, %.preheader
  %x.48 = phi i32 [ %.x.48, %.preheader ], [ %x.312, %.preheader1 ]
  %e.07 = phi i32 [ %14, %.preheader ], [ 0, %.preheader1 ]
  %13 = select i1 %12, i32 %7, i32 0, !dbg !54
  %.x.48 = add i32 %x.48, %13, !dbg !54
  %14 = add nsw i32 %e.07, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !20), !dbg !52
  %exitcond = icmp eq i32 %14, %7, !dbg !52
  br i1 %exitcond, label %._crit_edge9, label %.preheader, !dbg !52

._crit_edge9:                                     ; preds = %.preheader, %.preheader1
  %x.4.lcssa = phi i32 [ %x.312, %.preheader1 ], [ %.x.48, %.preheader ]
  %15 = add nsw i32 %d.011, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !19), !dbg !50
  %exitcond27 = icmp eq i32 %15, %7, !dbg !50
  br i1 %exitcond27, label %._crit_edge13, label %.preheader1, !dbg !50

._crit_edge13:                                    ; preds = %._crit_edge9, %.preheader2
  %x.3.lcssa = phi i32 [ %x.216, %.preheader2 ], [ %x.4.lcssa, %._crit_edge9 ]
  %16 = add nsw i32 %c.015, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !18), !dbg !48
  %exitcond28 = icmp eq i32 %16, %7, !dbg !48
  br i1 %exitcond28, label %._crit_edge17, label %.preheader2, !dbg !48

._crit_edge17:                                    ; preds = %._crit_edge13, %.preheader3
  %x.2.lcssa = phi i32 [ %x.120, %.preheader3 ], [ %x.3.lcssa, %._crit_edge13 ]
  %17 = add nsw i32 %b.019, 1, !dbg !46
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !17), !dbg !46
  %exitcond29 = icmp eq i32 %17, %7, !dbg !46
  br i1 %exitcond29, label %._crit_edge21, label %.preheader3, !dbg !46

._crit_edge21:                                    ; preds = %._crit_edge17, %.preheader4
  %x.1.lcssa = phi i32 [ %x.024, %.preheader4 ], [ %x.2.lcssa, %._crit_edge17 ]
  %18 = add nsw i32 %a.023, 1, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !16), !dbg !44
  %exitcond30 = icmp eq i32 %18, %7, !dbg !44
  br i1 %exitcond30, label %._crit_edge25, label %.preheader4, !dbg !44

._crit_edge25:                                    ; preds = %._crit_edge21, %2
  %x.0.lcssa = phi i32 [ 0, %2 ], [ %x.1.lcssa, %._crit_edge21 ]
  %19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %x.0.lcssa) #5, !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #1 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !31), !dbg !58
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !59
  %2 = trunc i64 %1 to i32, !dbg !59
  ret i32 %2, !dbg !59
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
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nestedloop.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !23}
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
!23 = metadata !{i32 786478, metadata !24, metadata !25, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !30, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!24 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!25 = metadata !{i32 786473, metadata !24}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !8, metadata !28}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786689, metadata !23, metadata !"__nptr", metadata !25, i32 16777494, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!32 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!33 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!34 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!35 = metadata !{i32 10, i32 0, metadata !4, null}
!36 = metadata !{i32 16, i32 0, metadata !4, null}
!37 = metadata !{i32 16, i32 28, metadata !4, null}
!38 = metadata !{metadata !39, metadata !39, i64 0}
!39 = metadata !{metadata !"any pointer", metadata !40, i64 0}
!40 = metadata !{metadata !"omnipotent char", metadata !41, i64 0}
!41 = metadata !{metadata !"Simple C/C++ TBAA"}
!42 = metadata !{i32 0}
!43 = metadata !{i32 17, i32 0, metadata !4, null}
!44 = metadata !{i32 19, i32 0, metadata !45, null}
!45 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!46 = metadata !{i32 20, i32 0, metadata !47, null}
!47 = metadata !{i32 786443, metadata !1, metadata !45, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!48 = metadata !{i32 21, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !47, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!50 = metadata !{i32 22, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!52 = metadata !{i32 23, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 23, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!54 = metadata !{i32 24, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 24, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!56 = metadata !{i32 27, i32 0, metadata !4, null}
!57 = metadata !{i32 28, i32 0, metadata !4, null}
!58 = metadata !{i32 278, i32 0, metadata !23, null}
!59 = metadata !{i32 280, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !24, metadata !23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
