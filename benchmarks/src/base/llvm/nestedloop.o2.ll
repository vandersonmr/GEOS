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
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !42) #3, !dbg !43
  %5 = tail call i64 @strtol(i8* nocapture %4, i8** null, i32 10) #3, !dbg !44
  %6 = trunc i64 %5 to i32, !dbg !44
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !15), !dbg !37
  tail call void @llvm.dbg.value(metadata !46, i64 0, metadata !22), !dbg !47
  tail call void @llvm.dbg.value(metadata !46, i64 0, metadata !16), !dbg !48
  %7 = icmp sgt i32 %6, 0, !dbg !48
  br i1 %7, label %.preheader4.lr.ph, label %._crit_edge25, !dbg !48

.preheader4.lr.ph:                                ; preds = %0, %2
  %8 = phi i32 [ %6, %2 ], [ 46, %0 ]
  br label %.preheader3.lr.ph, !dbg !48

.preheader3.lr.ph:                                ; preds = %.preheader4.lr.ph, %._crit_edge21
  %x.024 = phi i32 [ 0, %.preheader4.lr.ph ], [ %.lcssa, %._crit_edge21 ]
  %a.023 = phi i32 [ 0, %.preheader4.lr.ph ], [ %19, %._crit_edge21 ]
  br label %.preheader2.lr.ph, !dbg !50

.preheader2.lr.ph:                                ; preds = %.preheader3.lr.ph, %._crit_edge17
  %x.120 = phi i32 [ %x.024, %.preheader3.lr.ph ], [ %.lcssa, %._crit_edge17 ]
  %b.019 = phi i32 [ 0, %.preheader3.lr.ph ], [ %18, %._crit_edge17 ]
  br label %.preheader1.lr.ph, !dbg !52

.preheader1.lr.ph:                                ; preds = %.preheader2.lr.ph, %._crit_edge13
  %x.216 = phi i32 [ %x.120, %.preheader2.lr.ph ], [ %.lcssa, %._crit_edge13 ]
  %c.015 = phi i32 [ 0, %.preheader2.lr.ph ], [ %17, %._crit_edge13 ]
  br label %.preheader.lr.ph, !dbg !54

.preheader.lr.ph:                                 ; preds = %.preheader1.lr.ph, %._crit_edge9
  %x.312 = phi i32 [ %x.216, %.preheader1.lr.ph ], [ %.lcssa, %._crit_edge9 ]
  %d.011 = phi i32 [ 0, %.preheader1.lr.ph ], [ %16, %._crit_edge9 ]
  %n.vec = and i32 %8, -8, !dbg !56
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !56
  %9 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %x.312, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.preheader.lr.ph
  %broadcast.splatinsert33 = insertelement <4 x i32> undef, i32 %8, i32 0
  %broadcast.splat34 = shufflevector <4 x i32> %broadcast.splatinsert33, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !56
  %vec.phi = phi <4 x i32> [ %9, %vector.ph ], [ %10, %vector.body ]
  %vec.phi31 = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %11, %vector.body ]
  %10 = add <4 x i32> %broadcast.splat34, %vec.phi, !dbg !58
  %11 = add <4 x i32> %broadcast.splat34, %vec.phi31, !dbg !58
  %index.next = add i32 %index, 8, !dbg !56
  %12 = icmp eq i32 %index.next, %n.vec, !dbg !56
  br i1 %12, label %middle.block, label %vector.body, !dbg !56, !llvm.loop !60

middle.block:                                     ; preds = %vector.body, %.preheader.lr.ph
  %resume.val = phi i32 [ 0, %.preheader.lr.ph ], [ %n.vec, %vector.body ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %9, %.preheader.lr.ph ], [ %10, %vector.body ], !dbg !58
  %rdx.vec.exit.phi35 = phi <4 x i32> [ zeroinitializer, %.preheader.lr.ph ], [ %11, %vector.body ], !dbg !58
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi35, %rdx.vec.exit.phi, !dbg !58
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !58
  %bin.rdx36 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !58
  %rdx.shuf37 = shufflevector <4 x i32> %bin.rdx36, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !58
  %bin.rdx38 = add <4 x i32> %bin.rdx36, %rdx.shuf37, !dbg !58
  %13 = extractelement <4 x i32> %bin.rdx38, i32 0, !dbg !58
  %cmp.n = icmp eq i32 %8, %resume.val
  br i1 %cmp.n, label %._crit_edge9, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %x.48 = phi i32 [ %14, %scalar.ph ], [ %13, %middle.block ]
  %e.07 = phi i32 [ %15, %scalar.ph ], [ %resume.val, %middle.block ]
  %14 = add i32 %8, %x.48, !dbg !58
  %15 = add nsw i32 %e.07, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !20), !dbg !56
  %exitcond = icmp eq i32 %15, %8, !dbg !56
  br i1 %exitcond, label %._crit_edge9, label %scalar.ph, !dbg !56, !llvm.loop !63

._crit_edge9:                                     ; preds = %middle.block, %scalar.ph
  %.lcssa = phi i32 [ %14, %scalar.ph ], [ %13, %middle.block ]
  %16 = add nsw i32 %d.011, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !19), !dbg !54
  %exitcond27 = icmp eq i32 %16, %8, !dbg !54
  br i1 %exitcond27, label %._crit_edge13, label %.preheader.lr.ph, !dbg !54

._crit_edge13:                                    ; preds = %._crit_edge9
  %17 = add nsw i32 %c.015, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !18), !dbg !52
  %exitcond28 = icmp eq i32 %17, %8, !dbg !52
  br i1 %exitcond28, label %._crit_edge17, label %.preheader1.lr.ph, !dbg !52

._crit_edge17:                                    ; preds = %._crit_edge13
  %18 = add nsw i32 %b.019, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !17), !dbg !50
  %exitcond29 = icmp eq i32 %18, %8, !dbg !50
  br i1 %exitcond29, label %._crit_edge21, label %.preheader2.lr.ph, !dbg !50

._crit_edge21:                                    ; preds = %._crit_edge17
  %19 = add nsw i32 %a.023, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !16), !dbg !48
  %exitcond30 = icmp eq i32 %19, %8, !dbg !48
  br i1 %exitcond30, label %._crit_edge25, label %.preheader3.lr.ph, !dbg !48

._crit_edge25:                                    ; preds = %._crit_edge21, %2
  %x.0.lcssa = phi i32 [ 0, %2 ], [ %.lcssa, %._crit_edge21 ]
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %x.0.lcssa) #3, !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

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
!23 = metadata !{i32 786478, metadata !24, metadata !25, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !30, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!42 = metadata !{i32 786689, metadata !23, metadata !"__nptr", metadata !25, i32 16777494, metadata !28, i32 0, metadata !37} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!43 = metadata !{i32 278, i32 0, metadata !23, metadata !37}
!44 = metadata !{i32 280, i32 0, metadata !45, metadata !37}
!45 = metadata !{i32 786443, metadata !24, metadata !23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!46 = metadata !{i32 0}
!47 = metadata !{i32 17, i32 0, metadata !4, null}
!48 = metadata !{i32 19, i32 0, metadata !49, null}
!49 = metadata !{i32 786443, metadata !1, metadata !4, i32 19, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!50 = metadata !{i32 20, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !49, i32 20, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!52 = metadata !{i32 21, i32 0, metadata !53, null}
!53 = metadata !{i32 786443, metadata !1, metadata !51, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!54 = metadata !{i32 22, i32 0, metadata !55, null}
!55 = metadata !{i32 786443, metadata !1, metadata !53, i32 22, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!56 = metadata !{i32 23, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !55, i32 23, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!58 = metadata !{i32 24, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !57, i32 24, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/nestedloop.c]
!60 = metadata !{metadata !60, metadata !61, metadata !62}
!61 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!62 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!63 = metadata !{metadata !63, metadata !61, metadata !62}
!64 = metadata !{i32 27, i32 0, metadata !4, null}
!65 = metadata !{i32 28, i32 0, metadata !4, null}
