; ModuleID = 'recursive.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i32 @ack(i32 %x, i32 %y) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !10, metadata !50), !dbg !51
  tail call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !11, metadata !50), !dbg !52
  %cmp7 = icmp eq i32 %x, 0, !dbg !53
  br i1 %cmp7, label %if.then, label %if.end.preheader, !dbg !55

if.end.preheader:                                 ; preds = %entry
  br label %if.end, !dbg !56

if.then.loopexit:                                 ; preds = %tailrecurse.backedge
  %y.tr.be.lcssa = phi i32 [ %y.tr.be, %tailrecurse.backedge ]
  br label %if.then

if.then:                                          ; preds = %if.then.loopexit, %entry
  %y.tr.lcssa = phi i32 [ %y, %entry ], [ %y.tr.be.lcssa, %if.then.loopexit ]
  %add = add nsw i32 %y.tr.lcssa, 1, !dbg !57
  ret i32 %add, !dbg !59

if.end:                                           ; preds = %if.end.preheader, %tailrecurse.backedge
  %y.tr9 = phi i32 [ %y.tr.be, %tailrecurse.backedge ], [ %y, %if.end.preheader ]
  %x.tr8 = phi i32 [ %sub, %tailrecurse.backedge ], [ %x, %if.end.preheader ]
  %sub = add nsw i32 %x.tr8, -1, !dbg !56
  %tobool = icmp eq i32 %y.tr9, 0, !dbg !60
  br i1 %tobool, label %tailrecurse.backedge, label %cond.true, !dbg !60

tailrecurse.backedge:                             ; preds = %if.end, %cond.true
  %y.tr.be = phi i32 [ %call, %cond.true ], [ 1, %if.end ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !10, metadata !50), !dbg !51
  tail call void @llvm.dbg.value(metadata i32 %y.tr.be, i64 0, metadata !11, metadata !50), !dbg !52
  %cmp = icmp eq i32 %sub, 0, !dbg !53
  br i1 %cmp, label %if.then.loopexit, label %if.end, !dbg !55

cond.true:                                        ; preds = %if.end
  %sub1 = add nsw i32 %y.tr9, -1, !dbg !61
  %call = tail call i32 @ack(i32 %x.tr8, i32 %sub1), !dbg !62
  br label %tailrecurse.backedge, !dbg !60
}

; Function Attrs: nounwind readnone uwtable
define i32 @fib(i32 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %n, i64 0, metadata !16, metadata !50), !dbg !63
  %cmp5 = icmp slt i32 %n, 2, !dbg !64
  br i1 %cmp5, label %return, label %if.end.preheader, !dbg !66

if.end.preheader:                                 ; preds = %entry
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.end.preheader, %if.end
  %n.tr7 = phi i32 [ %sub1, %if.end ], [ %n, %if.end.preheader ]
  %accumulator.tr6 = phi i32 [ %add, %if.end ], [ 1, %if.end.preheader ]
  %sub = add nsw i32 %n.tr7, -2, !dbg !67
  %call = tail call i32 @fib(i32 %sub), !dbg !68
  %sub1 = add nsw i32 %n.tr7, -1, !dbg !69
  %add = add nsw i32 %call, %accumulator.tr6, !dbg !68
  tail call void @llvm.dbg.value(metadata i32 %sub1, i64 0, metadata !16, metadata !50), !dbg !63
  %cmp = icmp slt i32 %n.tr7, 3, !dbg !64
  br i1 %cmp, label %return.loopexit, label %if.end, !dbg !66

return.loopexit:                                  ; preds = %if.end
  %add.lcssa = phi i32 [ %add, %if.end ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %accumulator.tr.lcssa = phi i32 [ 1, %entry ], [ %add.lcssa, %return.loopexit ]
  ret i32 %accumulator.tr.lcssa, !dbg !70
}

; Function Attrs: nounwind readnone uwtable
define double @fibFP(double %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %n, i64 0, metadata !22, metadata !50), !dbg !71
  %cmp = fcmp olt double %n, 2.000000e+00, !dbg !72
  br i1 %cmp, label %return, label %if.end, !dbg !74

if.end:                                           ; preds = %entry
  %sub = fadd double %n, -2.000000e+00, !dbg !75
  %call = tail call double @fibFP(double %sub), !dbg !76
  %sub1 = fadd double %n, -1.000000e+00, !dbg !77
  %call2 = tail call double @fibFP(double %sub1), !dbg !78
  %add = fadd double %call, %call2, !dbg !76
  ret double %add, !dbg !79

return:                                           ; preds = %entry
  ret double 1.000000e+00, !dbg !79
}

; Function Attrs: nounwind readnone uwtable
define i32 @tak(i32 %x, i32 %y, i32 %z) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %x, i64 0, metadata !27, metadata !50), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %y, i64 0, metadata !28, metadata !50), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %z, i64 0, metadata !29, metadata !50), !dbg !82
  %cmp15 = icmp slt i32 %y, %x, !dbg !83
  br i1 %cmp15, label %if.then.preheader, label %return, !dbg !85

if.then.preheader:                                ; preds = %entry
  br label %if.then, !dbg !86

if.then:                                          ; preds = %if.then.preheader, %if.then
  %z.tr18 = phi i32 [ %call4, %if.then ], [ %z, %if.then.preheader ]
  %y.tr17 = phi i32 [ %call2, %if.then ], [ %y, %if.then.preheader ]
  %x.tr16 = phi i32 [ %call, %if.then ], [ %x, %if.then.preheader ]
  %sub = add nsw i32 %x.tr16, -1, !dbg !86
  %call = tail call i32 @tak(i32 %sub, i32 %y.tr17, i32 %z.tr18), !dbg !88
  %sub1 = add nsw i32 %y.tr17, -1, !dbg !89
  %call2 = tail call i32 @tak(i32 %sub1, i32 %z.tr18, i32 %x.tr16), !dbg !90
  %sub3 = add nsw i32 %z.tr18, -1, !dbg !91
  %call4 = tail call i32 @tak(i32 %sub3, i32 %x.tr16, i32 %y.tr17), !dbg !92
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !27, metadata !50), !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %call2, i64 0, metadata !28, metadata !50), !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %call4, i64 0, metadata !29, metadata !50), !dbg !82
  %cmp = icmp slt i32 %call2, %call, !dbg !83
  br i1 %cmp, label %if.then, label %return.loopexit, !dbg !85

return.loopexit:                                  ; preds = %if.then
  %call4.lcssa = phi i32 [ %call4, %if.then ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %z.tr.lcssa = phi i32 [ %z, %entry ], [ %call4.lcssa, %return.loopexit ]
  ret i32 %z.tr.lcssa, !dbg !93
}

; Function Attrs: nounwind readnone uwtable
define double @takFP(double %x, double %y, double %z) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %x, i64 0, metadata !34, metadata !50), !dbg !94
  tail call void @llvm.dbg.value(metadata double %y, i64 0, metadata !35, metadata !50), !dbg !95
  tail call void @llvm.dbg.value(metadata double %z, i64 0, metadata !36, metadata !50), !dbg !96
  %cmp15 = fcmp olt double %y, %x, !dbg !97
  br i1 %cmp15, label %if.then.preheader, label %return, !dbg !99

if.then.preheader:                                ; preds = %entry
  br label %if.then, !dbg !100

if.then:                                          ; preds = %if.then.preheader, %if.then
  %z.tr18 = phi double [ %call4, %if.then ], [ %z, %if.then.preheader ]
  %y.tr17 = phi double [ %call2, %if.then ], [ %y, %if.then.preheader ]
  %x.tr16 = phi double [ %call, %if.then ], [ %x, %if.then.preheader ]
  %sub = fadd double %x.tr16, -1.000000e+00, !dbg !100
  %call = tail call double @takFP(double %sub, double %y.tr17, double %z.tr18), !dbg !101
  %sub1 = fadd double %y.tr17, -1.000000e+00, !dbg !102
  %call2 = tail call double @takFP(double %sub1, double %z.tr18, double %x.tr16), !dbg !103
  %sub3 = fadd double %z.tr18, -1.000000e+00, !dbg !104
  %call4 = tail call double @takFP(double %sub3, double %x.tr16, double %y.tr17), !dbg !105
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !34, metadata !50), !dbg !94
  tail call void @llvm.dbg.value(metadata double %call2, i64 0, metadata !35, metadata !50), !dbg !95
  tail call void @llvm.dbg.value(metadata double %call4, i64 0, metadata !36, metadata !50), !dbg !96
  %cmp = fcmp olt double %call2, %call, !dbg !97
  br i1 %cmp, label %if.then, label %return.loopexit, !dbg !99

return.loopexit:                                  ; preds = %if.then
  %call4.lcssa = phi double [ %call4, %if.then ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %z.tr.lcssa = phi double [ %z, %entry ], [ %call4.lcssa, %return.loopexit ]
  ret double %z.tr.lcssa, !dbg !106
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !44, metadata !50), !dbg !107
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !45, metadata !50), !dbg !108
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !46, metadata !50), !dbg !109
  %call = tail call i32 @ack(i32 3, i32 11), !dbg !110
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 11, i32 %call) #4, !dbg !111
  %call6 = tail call double @fibFP(double 3.800000e+01), !dbg !112
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i64 0, i64 0), double 3.800000e+01, double %call6) #4, !dbg !113
  %call11 = tail call i32 @tak(i32 30, i32 20, i32 10), !dbg !114
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 30, i32 20, i32 10, i32 %call11) #4, !dbg !115
  %call13 = tail call i32 @fib(i32 3), !dbg !116
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0), i32 %call13) #4, !dbg !117
  %call15 = tail call double @takFP(double 3.000000e+00, double 2.000000e+00, double 1.000000e+00), !dbg !118
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str4, i64 0, i64 0), double %call15) #4, !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!47, !48}
!llvm.ident = !{!49}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c] [DW_LANG_C99]
!1 = !{!"recursive.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12, !17, !23, !30, !37}
!4 = !{!"0x2e\00ack\00ack\00\0010\000\001\000\000\00256\001\0010", !1, !5, !6, null, i32 (i32, i32)* @ack, null, null, !9} ; [ DW_TAG_subprogram ] [line 10] [def] [ack]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!10, !11}
!10 = !{!"0x101\00x\0016777226\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [x] [line 10]
!11 = !{!"0x101\00y\0033554442\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [y] [line 10]
!12 = !{!"0x2e\00fib\00fib\00\0018\000\001\000\000\00256\001\0018", !1, !5, !13, null, i32 (i32)* @fib, null, null, !15} ; [ DW_TAG_subprogram ] [line 18] [def] [fib]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!8, !8}
!15 = !{!16}
!16 = !{!"0x101\00n\0016777234\000", !12, !5, !8} ; [ DW_TAG_arg_variable ] [n] [line 18]
!17 = !{!"0x2e\00fibFP\00fibFP\00\0025\000\001\000\000\00256\001\0025", !1, !5, !18, null, double (double)* @fibFP, null, null, !21} ; [ DW_TAG_subprogram ] [line 25] [def] [fibFP]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!20, !20}
!20 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!21 = !{!22}
!22 = !{!"0x101\00n\0016777241\000", !17, !5, !20} ; [ DW_TAG_arg_variable ] [n] [line 25]
!23 = !{!"0x2e\00tak\00tak\00\0032\000\001\000\000\00256\001\0032", !1, !5, !24, null, i32 (i32, i32, i32)* @tak, null, null, !26} ; [ DW_TAG_subprogram ] [line 32] [def] [tak]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!8, !8, !8, !8}
!26 = !{!27, !28, !29}
!27 = !{!"0x101\00x\0016777248\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [x] [line 32]
!28 = !{!"0x101\00y\0033554464\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [y] [line 32]
!29 = !{!"0x101\00z\0050331680\000", !23, !5, !8} ; [ DW_TAG_arg_variable ] [z] [line 32]
!30 = !{!"0x2e\00takFP\00takFP\00\0039\000\001\000\000\00256\001\0039", !1, !5, !31, null, double (double, double, double)* @takFP, null, null, !33} ; [ DW_TAG_subprogram ] [line 39] [def] [takFP]
!31 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !32, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = !{!20, !20, !20, !20}
!33 = !{!34, !35, !36}
!34 = !{!"0x101\00x\0016777255\000", !30, !5, !20} ; [ DW_TAG_arg_variable ] [x] [line 39]
!35 = !{!"0x101\00y\0033554471\000", !30, !5, !20} ; [ DW_TAG_arg_variable ] [y] [line 39]
!36 = !{!"0x101\00z\0050331687\000", !30, !5, !20} ; [ DW_TAG_arg_variable ] [z] [line 39]
!37 = !{!"0x2e\00main\00main\00\0045\000\001\000\000\00256\001\0045", !1, !5, !38, null, i32 (i32, i8**)* @main, null, null, !43} ; [ DW_TAG_subprogram ] [line 45] [def] [main]
!38 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !39, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = !{!8, !8, !40}
!40 = !{!"0xf\00\000\0064\0064\000\000", null, null, !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!41 = !{!"0xf\00\000\0064\0064\000\000", null, null, !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!42 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!43 = !{!44, !45, !46}
!44 = !{!"0x101\00argc\0016777261\000", !37, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 45]
!45 = !{!"0x101\00argv\0033554477\000", !37, !5, !40} ; [ DW_TAG_arg_variable ] [argv] [line 45]
!46 = !{!"0x100\00n\0046\000", !37, !5, !8}       ; [ DW_TAG_auto_variable ] [n] [line 46]
!47 = !{i32 2, !"Dwarf Version", i32 4}
!48 = !{i32 2, !"Debug Info Version", i32 2}
!49 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!50 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!51 = !MDLocation(line: 10, column: 13, scope: !4)
!52 = !MDLocation(line: 10, column: 20, scope: !4)
!53 = !MDLocation(line: 11, column: 7, scope: !54)
!54 = !{!"0xb\0011\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!55 = !MDLocation(line: 11, column: 7, scope: !4)
!56 = !MDLocation(line: 15, column: 14, scope: !4)
!57 = !MDLocation(line: 12, column: 12, scope: !58)
!58 = !{!"0xb\0011\0015\001", !1, !54}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!59 = !MDLocation(line: 16, column: 1, scope: !4)
!60 = !MDLocation(line: 15, column: 22, scope: !4)
!61 = !MDLocation(line: 15, column: 39, scope: !4)
!62 = !MDLocation(line: 15, column: 32, scope: !4)
!63 = !MDLocation(line: 18, column: 13, scope: !12)
!64 = !MDLocation(line: 19, column: 7, scope: !65)
!65 = !{!"0xb\0019\007\002", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!66 = !MDLocation(line: 19, column: 7, scope: !12)
!67 = !MDLocation(line: 22, column: 14, scope: !12)
!68 = !MDLocation(line: 22, column: 10, scope: !12)
!69 = !MDLocation(line: 22, column: 27, scope: !12)
!70 = !MDLocation(line: 23, column: 1, scope: !12)
!71 = !MDLocation(line: 25, column: 21, scope: !17)
!72 = !MDLocation(line: 26, column: 7, scope: !73)
!73 = !{!"0xb\0026\007\004", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!74 = !MDLocation(line: 26, column: 7, scope: !17)
!75 = !MDLocation(line: 29, column: 16, scope: !17)
!76 = !MDLocation(line: 29, column: 10, scope: !17)
!77 = !MDLocation(line: 29, column: 33, scope: !17)
!78 = !MDLocation(line: 29, column: 27, scope: !17)
!79 = !MDLocation(line: 30, column: 1, scope: !17)
!80 = !MDLocation(line: 32, column: 13, scope: !23)
!81 = !MDLocation(line: 32, column: 20, scope: !23)
!82 = !MDLocation(line: 32, column: 27, scope: !23)
!83 = !MDLocation(line: 33, column: 7, scope: !84)
!84 = !{!"0xb\0033\007\006", !1, !23}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!85 = !MDLocation(line: 33, column: 7, scope: !23)
!86 = !MDLocation(line: 34, column: 20, scope: !87)
!87 = !{!"0xb\0033\0014\007", !1, !84}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!88 = !MDLocation(line: 34, column: 16, scope: !87)
!89 = !MDLocation(line: 34, column: 38, scope: !87)
!90 = !MDLocation(line: 34, column: 34, scope: !87)
!91 = !MDLocation(line: 34, column: 56, scope: !87)
!92 = !MDLocation(line: 34, column: 52, scope: !87)
!93 = !MDLocation(line: 37, column: 1, scope: !23)
!94 = !MDLocation(line: 39, column: 21, scope: !30)
!95 = !MDLocation(line: 39, column: 31, scope: !30)
!96 = !MDLocation(line: 39, column: 41, scope: !30)
!97 = !MDLocation(line: 40, column: 9, scope: !98)
!98 = !{!"0xb\0040\009\008", !1, !30}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!99 = !MDLocation(line: 40, column: 9, scope: !30)
!100 = !MDLocation(line: 41, column: 29, scope: !98)
!101 = !MDLocation(line: 41, column: 23, scope: !98)
!102 = !MDLocation(line: 41, column: 49, scope: !98)
!103 = !MDLocation(line: 41, column: 43, scope: !98)
!104 = !MDLocation(line: 41, column: 69, scope: !98)
!105 = !MDLocation(line: 41, column: 63, scope: !98)
!106 = !MDLocation(line: 43, column: 1, scope: !30)
!107 = !MDLocation(line: 45, column: 14, scope: !37)
!108 = !MDLocation(line: 45, column: 28, scope: !37)
!109 = !MDLocation(line: 46, column: 7, scope: !37)
!110 = !MDLocation(line: 48, column: 36, scope: !37)
!111 = !MDLocation(line: 48, column: 3, scope: !37)
!112 = !MDLocation(line: 49, column: 41, scope: !37)
!113 = !MDLocation(line: 49, column: 3, scope: !37)
!114 = !MDLocation(line: 50, column: 50, scope: !37)
!115 = !MDLocation(line: 50, column: 3, scope: !37)
!116 = !MDLocation(line: 51, column: 26, scope: !37)
!117 = !MDLocation(line: 51, column: 3, scope: !37)
!118 = !MDLocation(line: 52, column: 38, scope: !37)
!119 = !MDLocation(line: 52, column: 3, scope: !37)
!120 = !MDLocation(line: 54, column: 3, scope: !37)
