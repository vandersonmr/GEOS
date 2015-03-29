; ModuleID = 'ackermann.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i32 @Ack(i32 %M, i32 %N) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !15, metadata !36), !dbg !37
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !16, metadata !36), !dbg !38
  %cmp11 = icmp eq i32 %M, 0, !dbg !39
  br i1 %cmp11, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %tailrecurse.backedge, %entry
  %N.tr.lcssa = phi i32 [ %N, %entry ], [ %N.tr.be, %tailrecurse.backedge ]
  %add = add nsw i32 %N.tr.lcssa, 1, !dbg !42
  ret i32 %add, !dbg !44

if.end:                                           ; preds = %entry, %tailrecurse.backedge
  %N.tr13 = phi i32 [ %N.tr.be, %tailrecurse.backedge ], [ %N, %entry ]
  %M.tr12 = phi i32 [ %sub, %tailrecurse.backedge ], [ %M, %entry ]
  %cmp1 = icmp eq i32 %N.tr13, 0, !dbg !45
  %sub = add nsw i32 %M.tr12, -1, !dbg !47
  br i1 %cmp1, label %tailrecurse.backedge, label %if.end3, !dbg !49

if.end3:                                          ; preds = %if.end
  %sub5 = add nsw i32 %N.tr13, -1, !dbg !50
  %call6 = tail call i32 @Ack(i32 %M.tr12, i32 %sub5), !dbg !51
  br label %tailrecurse.backedge, !dbg !52

tailrecurse.backedge:                             ; preds = %if.end3, %if.end
  %N.tr.be = phi i32 [ %call6, %if.end3 ], [ 1, %if.end ]
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !15, metadata !36), !dbg !37
  tail call void @llvm.dbg.value(metadata i32 %N.tr.be, i64 0, metadata !16, metadata !36), !dbg !38
  %cmp = icmp eq i32 %sub, 0, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !41
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !21, metadata !36), !dbg !53
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !22, metadata !36), !dbg !54
  %cmp = icmp eq i32 %argc, 2, !dbg !55
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !56

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !57
  %0 = load i8** %arrayidx, align 8, !dbg !57, !tbaa !59
  %call = tail call i32 @atoi(i8* %0) #5, !dbg !63
  br label %cond.end, !dbg !56

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 8, %entry ], !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !23, metadata !36), !dbg !64
  %call1 = tail call i32 @Ack(i32 3, i32 %cond), !dbg !65
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %cond, i32 %call1) #6, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #2 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !32, metadata !36), !dbg !68
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  ret i32 %conv, !dbg !71
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c] [DW_LANG_C99]
!1 = !{!"ackermann.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !17, !24}
!10 = !{!"0x2e\00Ack\00Ack\00\0010\000\001\000\000\00256\001\0010", !1, !11, !12, null, i32 (i32, i32)* @Ack, null, null, !14} ; [ DW_TAG_subprogram ] [line 10] [def] [Ack]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !4}
!14 = !{!15, !16}
!15 = !{!"0x101\00M\0016777226\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [M] [line 10]
!16 = !{!"0x101\00N\0033554442\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [N] [line 10]
!17 = !{!"0x2e\00main\00main\00\0017\000\001\000\000\00256\001\0017", !1, !11, !18, null, i32 (i32, i8**)* @main, null, null, !20} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!4, !4, !5}
!20 = !{!21, !22, !23}
!21 = !{!"0x101\00argc\0016777233\000", !17, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!22 = !{!"0x101\00argv\0033554449\000", !17, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!23 = !{!"0x100\00n\0018\000", !17, !11, !4}      ; [ DW_TAG_auto_variable ] [n] [line 18]
!24 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !25, !26, !27, null, i32 (i8*)* @atoi, null, null, !31} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!25 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!26 = !{!"0x29", !25}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!4, !29}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = !{!32}
!32 = !{!"0x101\00__nptr\0016777494\000", !24, !26, !29} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 2}
!35 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 10, column: 9, scope: !10)
!38 = !MDLocation(line: 10, column: 16, scope: !10)
!39 = !MDLocation(line: 11, column: 9, scope: !40)
!40 = !{!"0xb\0011\009\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!41 = !MDLocation(line: 11, column: 9, scope: !10)
!42 = !MDLocation(line: 11, column: 25, scope: !43)
!43 = !{!"0xb\001", !1, !40}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!44 = !MDLocation(line: 14, column: 1, scope: !10)
!45 = !MDLocation(line: 12, column: 9, scope: !46)
!46 = !{!"0xb\0012\009\001", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!47 = !MDLocation(line: 12, column: 29, scope: !48)
!48 = !{!"0xb\001", !1, !46}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!49 = !MDLocation(line: 12, column: 9, scope: !10)
!50 = !MDLocation(line: 13, column: 32, scope: !10)
!51 = !MDLocation(line: 13, column: 24, scope: !10)
!52 = !MDLocation(line: 13, column: 13, scope: !10)
!53 = !MDLocation(line: 17, column: 10, scope: !17)
!54 = !MDLocation(line: 17, column: 22, scope: !17)
!55 = !MDLocation(line: 18, column: 15, scope: !17)
!56 = !MDLocation(line: 18, column: 14, scope: !17)
!57 = !MDLocation(line: 18, column: 33, scope: !58)
!58 = !{!"0xb\001", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!59 = !{!60, !60, i64 0}
!60 = !{!"any pointer", !61, i64 0}
!61 = !{!"omnipotent char", !62, i64 0}
!62 = !{!"Simple C/C++ TBAA"}
!63 = !MDLocation(line: 18, column: 28, scope: !17)
!64 = !MDLocation(line: 18, column: 9, scope: !17)
!65 = !MDLocation(line: 20, column: 34, scope: !17)
!66 = !MDLocation(line: 20, column: 5, scope: !17)
!67 = !MDLocation(line: 21, column: 5, scope: !17)
!68 = !MDLocation(line: 278, column: 1, scope: !24)
!69 = !MDLocation(line: 280, column: 16, scope: !24)
!70 = !MDLocation(line: 280, column: 10, scope: !24)
!71 = !MDLocation(line: 280, column: 3, scope: !24)
