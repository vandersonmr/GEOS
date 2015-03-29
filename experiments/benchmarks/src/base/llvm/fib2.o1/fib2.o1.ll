; ModuleID = 'fib2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i64 @fib(i64 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !10, metadata !25), !dbg !26
  %cmp5 = icmp ult i64 %n, 2, !dbg !27
  br i1 %cmp5, label %return, label %if.else, !dbg !29

if.else:                                          ; preds = %entry, %if.else
  %n.tr7 = phi i64 [ %sub1, %if.else ], [ %n, %entry ]
  %accumulator.tr6 = phi i64 [ %add, %if.else ], [ 1, %entry ]
  %sub = add i64 %n.tr7, -2, !dbg !30
  %call = tail call i64 @fib(i64 %sub), !dbg !31
  %sub1 = add i64 %n.tr7, -1, !dbg !32
  %add = add i64 %call, %accumulator.tr6, !dbg !31
  tail call void @llvm.dbg.value(metadata i64 %sub1, i64 0, metadata !10, metadata !25), !dbg !26
  %cmp = icmp ult i64 %sub1, 2, !dbg !27
  br i1 %cmp, label %return, label %if.else, !dbg !29

return:                                           ; preds = %if.else, %entry
  %accumulator.tr.lcssa = phi i64 [ 1, %entry ], [ %add, %if.else ]
  ret i64 %accumulator.tr.lcssa, !dbg !33
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !19, metadata !25), !dbg !34
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !20, metadata !25), !dbg !35
  %cmp = icmp eq i32 %argc, 2, !dbg !36
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !37

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !38
  %0 = load i8** %arrayidx, align 8, !dbg !38, !tbaa !40
  %call = tail call i32 @atoi(i8* %0) #5, !dbg !44
  %phitmp = sext i32 %call to i64, !dbg !37
  br label %cond.end, !dbg !37

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i64 [ %phitmp, %cond.true ], [ 43, %entry ]
  %call1 = tail call i64 @fib(i64 %cond), !dbg !45
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i64 %call1) #5, !dbg !46
  ret i32 0, !dbg !47
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c] [DW_LANG_C99]
!1 = !{!"fib2.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !11}
!4 = !{!"0x2e\00fib\00fib\00\0010\000\001\000\000\00256\001\0010", !1, !5, !6, null, i64 (i64)* @fib, null, null, !9} ; [ DW_TAG_subprogram ] [line 10] [def] [fib]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = !{!10}
!10 = !{!"0x101\00n\0016777226\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [n] [line 10]
!11 = !{!"0x2e\00main\00main\00\0018\000\001\000\000\00256\001\0018", !1, !5, !12, null, i32 (i32, i8**)* @main, null, null, !18} ; [ DW_TAG_subprogram ] [line 18] [def] [main]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!14, !14, !15}
!14 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!17 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!18 = !{!19, !20, !21}
!19 = !{!"0x101\00argc\0016777234\000", !11, !5, !14} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!20 = !{!"0x101\00argv\0033554450\000", !11, !5, !15} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!21 = !{!"0x100\00N\0024\000", !11, !5, !14}      ; [ DW_TAG_auto_variable ] [N] [line 24]
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 2}
!24 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!25 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!26 = !MDLocation(line: 10, column: 19, scope: !4)
!27 = !MDLocation(line: 11, column: 9, scope: !28)
!28 = !{!"0xb\0011\009\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!29 = !MDLocation(line: 11, column: 9, scope: !4)
!30 = !MDLocation(line: 14, column: 13, scope: !28)
!31 = !MDLocation(line: 14, column: 9, scope: !28)
!32 = !MDLocation(line: 14, column: 24, scope: !28)
!33 = !MDLocation(line: 15, column: 1, scope: !4)
!34 = !MDLocation(line: 18, column: 10, scope: !11)
!35 = !MDLocation(line: 18, column: 22, scope: !11)
!36 = !MDLocation(line: 24, column: 15, scope: !11)
!37 = !MDLocation(line: 24, column: 14, scope: !11)
!38 = !MDLocation(line: 24, column: 33, scope: !39)
!39 = !{!"0xb\001", !1, !11}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!40 = !{!41, !41, i64 0}
!41 = !{!"any pointer", !42, i64 0}
!42 = !{!"omnipotent char", !43, i64 0}
!43 = !{!"Simple C/C++ TBAA"}
!44 = !MDLocation(line: 24, column: 28, scope: !11)
!45 = !MDLocation(line: 25, column: 21, scope: !11)
!46 = !MDLocation(line: 25, column: 5, scope: !11)
!47 = !MDLocation(line: 26, column: 5, scope: !11)
