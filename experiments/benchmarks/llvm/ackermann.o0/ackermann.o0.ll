; ModuleID = 'ackermann.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @Ack(i32 %M, i32 %N) #0 {
entry:
  %retval = alloca i32, align 4
  %M.addr = alloca i32, align 4
  %N.addr = alloca i32, align 4
  store i32 %M, i32* %M.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %M.addr, metadata !18, metadata !19), !dbg !20
  store i32 %N, i32* %N.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %N.addr, metadata !21, metadata !19), !dbg !22
  %0 = load i32* %M.addr, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %1 = load i32* %N.addr, align 4, !dbg !26
  %add = add nsw i32 %1, 1, !dbg !26
  store i32 %add, i32* %retval, !dbg !28
  br label %return, !dbg !28

if.end:                                           ; preds = %entry
  %2 = load i32* %N.addr, align 4, !dbg !29
  %cmp1 = icmp eq i32 %2, 0, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !31

if.then2:                                         ; preds = %if.end
  %3 = load i32* %M.addr, align 4, !dbg !32
  %sub = sub nsw i32 %3, 1, !dbg !32
  %call = call i32 @Ack(i32 %sub, i32 1), !dbg !34
  store i32 %call, i32* %retval, !dbg !35
  br label %return, !dbg !35

if.end3:                                          ; preds = %if.end
  %4 = load i32* %M.addr, align 4, !dbg !36
  %sub4 = sub nsw i32 %4, 1, !dbg !36
  %5 = load i32* %M.addr, align 4, !dbg !37
  %6 = load i32* %N.addr, align 4, !dbg !38
  %sub5 = sub nsw i32 %6, 1, !dbg !38
  %call6 = call i32 @Ack(i32 %5, i32 %sub5), !dbg !39
  %call7 = call i32 @Ack(i32 %sub4, i32 %call6), !dbg !40
  store i32 %call7, i32* %retval, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %7 = load i32* %retval, !dbg !42
  ret i32 %7, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !19), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !19), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %n, metadata !47, metadata !19), !dbg !48
  %0 = load i32* %argc.addr, align 4, !dbg !49
  %cmp = icmp eq i32 %0, 2, !dbg !49
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !50

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !51
  %2 = load i8** %arrayidx, align 8, !dbg !51
  %call = call i32 @atoi(i8* %2) #4, !dbg !53
  br label %cond.end, !dbg !50

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !54

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 8, %cond.false ], !dbg !50
  store i32 %cond, i32* %n, align 4, !dbg !56
  %3 = load i32* %n, align 4, !dbg !59
  %4 = load i32* %n, align 4, !dbg !60
  %call1 = call i32 @Ack(i32 3, i32 %4), !dbg !61
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %call1), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16}
!llvm.ident = !{!17}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c] [DW_LANG_C99]
!1 = !{!"ackermann.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9}
!4 = !{!"0x2e\00Ack\00Ack\00\0010\000\001\000\000\00256\000\0010", !1, !5, !6, null, i32 (i32, i32)* @Ack, null, null, !2} ; [ DW_TAG_subprogram ] [line 10] [def] [Ack]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0x2e\00main\00main\00\0017\000\001\000\000\00256\000\0017", !1, !5, !10, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!8, !8, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = !{i32 2, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 2}
!17 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!18 = !{!"0x101\00M\0016777226\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [M] [line 10]
!19 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!20 = !MDLocation(line: 10, column: 9, scope: !4)
!21 = !{!"0x101\00N\0033554442\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [N] [line 10]
!22 = !MDLocation(line: 10, column: 16, scope: !4)
!23 = !MDLocation(line: 11, column: 9, scope: !24)
!24 = !{!"0xb\0011\009\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!25 = !MDLocation(line: 11, column: 9, scope: !4)
!26 = !MDLocation(line: 11, column: 25, scope: !27)
!27 = !{!"0xb\001", !1, !24}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!28 = !MDLocation(line: 11, column: 17, scope: !24)
!29 = !MDLocation(line: 12, column: 9, scope: !30)
!30 = !{!"0xb\0012\009\001", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!31 = !MDLocation(line: 12, column: 9, scope: !4)
!32 = !MDLocation(line: 12, column: 29, scope: !33)
!33 = !{!"0xb\001", !1, !30}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!34 = !MDLocation(line: 12, column: 25, scope: !30)
!35 = !MDLocation(line: 12, column: 17, scope: !30)
!36 = !MDLocation(line: 13, column: 17, scope: !4)
!37 = !MDLocation(line: 13, column: 28, scope: !4)
!38 = !MDLocation(line: 13, column: 32, scope: !4)
!39 = !MDLocation(line: 13, column: 24, scope: !4)
!40 = !MDLocation(line: 13, column: 13, scope: !4)
!41 = !MDLocation(line: 13, column: 5, scope: !4)
!42 = !MDLocation(line: 14, column: 1, scope: !4)
!43 = !{!"0x101\00argc\0016777233\000", !9, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!44 = !MDLocation(line: 17, column: 10, scope: !9)
!45 = !{!"0x101\00argv\0033554449\000", !9, !5, !12} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!46 = !MDLocation(line: 17, column: 22, scope: !9)
!47 = !{!"0x100\00n\0018\000", !9, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 18]
!48 = !MDLocation(line: 18, column: 9, scope: !9)
!49 = !MDLocation(line: 18, column: 15, scope: !9)
!50 = !MDLocation(line: 18, column: 14, scope: !9)
!51 = !MDLocation(line: 18, column: 33, scope: !52)
!52 = !{!"0xb\001", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!53 = !MDLocation(line: 18, column: 28, scope: !9)
!54 = !MDLocation(line: 18, column: 14, scope: !55)
!55 = !{!"0xb\002", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!56 = !MDLocation(line: 18, column: 9, scope: !57)
!57 = !{!"0xb\004", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!58 = !{!"0xb\003", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ackermann.c]
!59 = !MDLocation(line: 20, column: 31, scope: !9)
!60 = !MDLocation(line: 20, column: 41, scope: !9)
!61 = !MDLocation(line: 20, column: 34, scope: !9)
!62 = !MDLocation(line: 20, column: 5, scope: !9)
!63 = !MDLocation(line: 21, column: 5, scope: !9)
