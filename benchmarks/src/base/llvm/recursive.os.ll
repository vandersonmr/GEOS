; ModuleID = 'recursive.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: nounwind optsize readnone uwtable
define i32 @ack(i32 %x, i32 %y) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !10), !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %y.tr.lcssa}, i64 0, metadata !11), !dbg !50
  %1 = icmp eq i32 %x, 0, !dbg !51
  br i1 %1, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !51

tailrecurse._crit_edge:                           ; preds = %tailrecurse.backedge, %0
  %y.tr.lcssa = phi i32 [ %y, %0 ], [ %y.tr.be, %tailrecurse.backedge ]
  %2 = add nsw i32 %y.tr.lcssa, 1, !dbg !53
  ret i32 %2, !dbg !55

.lr.ph:                                           ; preds = %0, %tailrecurse.backedge
  %y.tr2 = phi i32 [ %y.tr.be, %tailrecurse.backedge ], [ %y, %0 ]
  %x.tr1 = phi i32 [ %3, %tailrecurse.backedge ], [ %x, %0 ]
  %3 = add nsw i32 %x.tr1, -1, !dbg !56
  %4 = icmp eq i32 %y.tr2, 0, !dbg !56
  br i1 %4, label %tailrecurse.backedge, label %6, !dbg !56

tailrecurse.backedge:                             ; preds = %.lr.ph, %6
  %y.tr.be = phi i32 [ %8, %6 ], [ 1, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %x.tr1}, i64 0, metadata !10), !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %y.tr.lcssa}, i64 0, metadata !11), !dbg !50
  %5 = icmp eq i32 %3, 0, !dbg !51
  br i1 %5, label %tailrecurse._crit_edge, label %.lr.ph, !dbg !51

; <label>:6                                       ; preds = %.lr.ph
  %7 = add nsw i32 %y.tr2, -1, !dbg !56
  %8 = tail call i32 @ack(i32 %x.tr1, i32 %7) #4, !dbg !56
  br label %tailrecurse.backedge, !dbg !56
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @fib(i32 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !16), !dbg !57
  %1 = icmp slt i32 %n, 2, !dbg !58
  br i1 %1, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !58

tailrecurse:                                      ; preds = %0, %tailrecurse
  %n.tr2 = phi i32 [ %4, %tailrecurse ], [ %n, %0 ]
  %accumulator.tr1 = phi i32 [ %5, %tailrecurse ], [ 1, %0 ]
  %2 = add nsw i32 %n.tr2, -2, !dbg !60
  %3 = tail call i32 @fib(i32 %2) #4, !dbg !60
  %4 = add nsw i32 %n.tr2, -1, !dbg !60
  %5 = add nsw i32 %3, %accumulator.tr1, !dbg !60
  tail call void @llvm.dbg.value(metadata !{i32 %n.tr2}, i64 0, metadata !16), !dbg !57
  %6 = icmp slt i32 %n.tr2, 3, !dbg !58
  br i1 %6, label %tailrecurse._crit_edge, label %tailrecurse, !dbg !58

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %accumulator.tr.lcssa = phi i32 [ 1, %0 ], [ %5, %tailrecurse ]
  ret i32 %accumulator.tr.lcssa, !dbg !61
}

; Function Attrs: nounwind optsize readnone uwtable
define double @fibFP(double %n) #0 {
  tail call void @llvm.dbg.value(metadata !{double %n}, i64 0, metadata !22), !dbg !62
  %1 = fcmp olt double %n, 2.000000e+00, !dbg !63
  br i1 %1, label %8, label %2, !dbg !63

; <label>:2                                       ; preds = %0
  %3 = fadd double %n, -2.000000e+00, !dbg !65
  %4 = tail call double @fibFP(double %3) #4, !dbg !65
  %5 = fadd double %n, -1.000000e+00, !dbg !65
  %6 = tail call double @fibFP(double %5) #4, !dbg !65
  %7 = fadd double %4, %6, !dbg !65
  ret double %7, !dbg !66

; <label>:8                                       ; preds = %0
  ret double 1.000000e+00, !dbg !66
}

; Function Attrs: nounwind optsize readnone uwtable
define i32 @tak(i32 %x, i32 %y, i32 %z) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !27), !dbg !67
  tail call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !28), !dbg !67
  tail call void @llvm.dbg.value(metadata !{i32 %z.tr.lcssa}, i64 0, metadata !29), !dbg !67
  %1 = icmp slt i32 %y, %x, !dbg !68
  br i1 %1, label %tailrecurse, label %tailrecurse._crit_edge, !dbg !68

tailrecurse:                                      ; preds = %0, %tailrecurse
  %z.tr3 = phi i32 [ %7, %tailrecurse ], [ %z, %0 ]
  %y.tr2 = phi i32 [ %5, %tailrecurse ], [ %y, %0 ]
  %x.tr1 = phi i32 [ %3, %tailrecurse ], [ %x, %0 ]
  %2 = add nsw i32 %x.tr1, -1, !dbg !70
  %3 = tail call i32 @tak(i32 %2, i32 %y.tr2, i32 %z.tr3) #4, !dbg !70
  %4 = add nsw i32 %y.tr2, -1, !dbg !70
  %5 = tail call i32 @tak(i32 %4, i32 %z.tr3, i32 %x.tr1) #4, !dbg !70
  %6 = add nsw i32 %z.tr3, -1, !dbg !70
  %7 = tail call i32 @tak(i32 %6, i32 %x.tr1, i32 %y.tr2) #4, !dbg !70
  tail call void @llvm.dbg.value(metadata !{i32 %x.tr1}, i64 0, metadata !27), !dbg !67
  tail call void @llvm.dbg.value(metadata !{i32 %y.tr2}, i64 0, metadata !28), !dbg !67
  tail call void @llvm.dbg.value(metadata !{i32 %z.tr.lcssa}, i64 0, metadata !29), !dbg !67
  %8 = icmp slt i32 %5, %3, !dbg !68
  br i1 %8, label %tailrecurse, label %tailrecurse._crit_edge, !dbg !68

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %z.tr.lcssa = phi i32 [ %z, %0 ], [ %7, %tailrecurse ]
  ret i32 %z.tr.lcssa, !dbg !72
}

; Function Attrs: nounwind optsize readnone uwtable
define double @takFP(double %x, double %y, double %z) #0 {
  tail call void @llvm.dbg.value(metadata !{double %x}, i64 0, metadata !34), !dbg !73
  tail call void @llvm.dbg.value(metadata !{double %y}, i64 0, metadata !35), !dbg !73
  tail call void @llvm.dbg.value(metadata !{double %z.tr.lcssa}, i64 0, metadata !36), !dbg !73
  %1 = fcmp olt double %y, %x, !dbg !74
  br i1 %1, label %tailrecurse, label %tailrecurse._crit_edge, !dbg !74

tailrecurse:                                      ; preds = %0, %tailrecurse
  %z.tr3 = phi double [ %7, %tailrecurse ], [ %z, %0 ]
  %y.tr2 = phi double [ %5, %tailrecurse ], [ %y, %0 ]
  %x.tr1 = phi double [ %3, %tailrecurse ], [ %x, %0 ]
  %2 = fadd double %x.tr1, -1.000000e+00, !dbg !76
  %3 = tail call double @takFP(double %2, double %y.tr2, double %z.tr3) #4, !dbg !76
  %4 = fadd double %y.tr2, -1.000000e+00, !dbg !76
  %5 = tail call double @takFP(double %4, double %z.tr3, double %x.tr1) #4, !dbg !76
  %6 = fadd double %z.tr3, -1.000000e+00, !dbg !76
  %7 = tail call double @takFP(double %6, double %x.tr1, double %y.tr2) #4, !dbg !76
  tail call void @llvm.dbg.value(metadata !{double %x.tr1}, i64 0, metadata !34), !dbg !73
  tail call void @llvm.dbg.value(metadata !{double %y.tr2}, i64 0, metadata !35), !dbg !73
  tail call void @llvm.dbg.value(metadata !{double %z.tr.lcssa}, i64 0, metadata !36), !dbg !73
  %8 = fcmp olt double %5, %3, !dbg !74
  br i1 %8, label %tailrecurse, label %tailrecurse._crit_edge, !dbg !74

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %z.tr.lcssa = phi double [ %z, %0 ], [ %7, %tailrecurse ]
  ret double %z.tr.lcssa, !dbg !77
}

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !44), !dbg !78
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !45), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !46), !dbg !80
  %1 = tail call i32 @ack(i32 3, i32 11) #4, !dbg !81
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 11, i32 %1) #5, !dbg !81
  %3 = tail call double @fibFP(double 3.800000e+01) #4, !dbg !82
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0), double 3.800000e+01, double %3) #5, !dbg !82
  %5 = tail call i32 @tak(i32 30, i32 20, i32 10) #4, !dbg !83
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 30, i32 20, i32 10, i32 %5) #5, !dbg !83
  %7 = tail call i32 @fib(i32 3) #4, !dbg !84
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0), i32 %7) #5, !dbg !84
  %9 = tail call double @takFP(double 3.000000e+00, double 2.000000e+00, double 1.000000e+00) #4, !dbg !85
  %10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str4, i64 0, i64 0), double %9) #5, !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind optsize readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { optsize }
attributes #5 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!47, !48}
!llvm.ident = !{!49}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c] [DW_LANG_C99]
!1 = metadata !{metadata !"recursive.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !12, metadata !17, metadata !23, metadata !30, metadata !37}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"ack", metadata !"ack", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @ack, null, null, metadata !9, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [ack]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !11}
!10 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777226, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 10]
!11 = metadata !{i32 786689, metadata !4, metadata !"y", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 10]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fib", metadata !"fib", metadata !"", i32 18, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fib, null, null, metadata !15, i32 18} ; [ DW_TAG_subprogram ] [line 18] [def] [fib]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8, metadata !8}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786689, metadata !12, metadata !"n", metadata !5, i32 16777234, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 18]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fibFP", metadata !"fibFP", metadata !"", i32 25, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double)* @fibFP, null, null, metadata !21, i32 25} ; [ DW_TAG_subprogram ] [line 25] [def] [fibFP]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !20}
!20 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786689, metadata !17, metadata !"n", metadata !5, i32 16777241, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 25]
!23 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"tak", metadata !"tak", metadata !"", i32 32, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @tak, null, null, metadata !26, i32 32} ; [ DW_TAG_subprogram ] [line 32] [def] [tak]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8}
!26 = metadata !{metadata !27, metadata !28, metadata !29}
!27 = metadata !{i32 786689, metadata !23, metadata !"x", metadata !5, i32 16777248, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 32]
!28 = metadata !{i32 786689, metadata !23, metadata !"y", metadata !5, i32 33554464, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 32]
!29 = metadata !{i32 786689, metadata !23, metadata !"z", metadata !5, i32 50331680, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 32]
!30 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"takFP", metadata !"takFP", metadata !"", i32 39, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (double, double, double)* @takFP, null, null, metadata !33, i32 39} ; [ DW_TAG_subprogram ] [line 39] [def] [takFP]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !20, metadata !20, metadata !20, metadata !20}
!33 = metadata !{metadata !34, metadata !35, metadata !36}
!34 = metadata !{i32 786689, metadata !30, metadata !"x", metadata !5, i32 16777255, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 39]
!35 = metadata !{i32 786689, metadata !30, metadata !"y", metadata !5, i32 33554471, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y] [line 39]
!36 = metadata !{i32 786689, metadata !30, metadata !"z", metadata !5, i32 50331687, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 39]
!37 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 45, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !43, i32 45} ; [ DW_TAG_subprogram ] [line 45] [def] [main]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !8, metadata !8, metadata !40}
!40 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!42 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!43 = metadata !{metadata !44, metadata !45, metadata !46}
!44 = metadata !{i32 786689, metadata !37, metadata !"argc", metadata !5, i32 16777261, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 45]
!45 = metadata !{i32 786689, metadata !37, metadata !"argv", metadata !5, i32 33554477, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 45]
!46 = metadata !{i32 786688, metadata !37, metadata !"n", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 46]
!47 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!48 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!49 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!50 = metadata !{i32 10, i32 0, metadata !4, null}
!51 = metadata !{i32 11, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!53 = metadata !{i32 12, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !52, i32 11, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!55 = metadata !{i32 16, i32 0, metadata !4, null}
!56 = metadata !{i32 15, i32 0, metadata !4, null}
!57 = metadata !{i32 18, i32 0, metadata !12, null}
!58 = metadata !{i32 19, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !12, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!60 = metadata !{i32 22, i32 0, metadata !12, null}
!61 = metadata !{i32 23, i32 0, metadata !12, null}
!62 = metadata !{i32 25, i32 0, metadata !17, null}
!63 = metadata !{i32 26, i32 0, metadata !64, null}
!64 = metadata !{i32 786443, metadata !1, metadata !17, i32 26, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!65 = metadata !{i32 29, i32 0, metadata !17, null}
!66 = metadata !{i32 30, i32 0, metadata !17, null}
!67 = metadata !{i32 32, i32 0, metadata !23, null}
!68 = metadata !{i32 33, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !23, i32 33, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!70 = metadata !{i32 34, i32 0, metadata !71, null}
!71 = metadata !{i32 786443, metadata !1, metadata !69, i32 33, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!72 = metadata !{i32 37, i32 0, metadata !23, null}
!73 = metadata !{i32 39, i32 0, metadata !30, null}
!74 = metadata !{i32 40, i32 0, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !30, i32 40, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/recursive.c]
!76 = metadata !{i32 41, i32 0, metadata !75, null}
!77 = metadata !{i32 43, i32 0, metadata !30, null}
!78 = metadata !{i32 45, i32 0, metadata !37, null}
!79 = metadata !{i32 10}
!80 = metadata !{i32 46, i32 0, metadata !37, null}
!81 = metadata !{i32 48, i32 0, metadata !37, null}
!82 = metadata !{i32 49, i32 0, metadata !37, null}
!83 = metadata !{i32 50, i32 0, metadata !37, null}
!84 = metadata !{i32 51, i32 0, metadata !37, null}
!85 = metadata !{i32 52, i32 0, metadata !37, null}
!86 = metadata !{i32 54, i32 0, metadata !37, null}
