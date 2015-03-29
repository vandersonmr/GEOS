; ModuleID = 'fib2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @fib(i64 %n) #0 {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n.addr, metadata !19, metadata !20), !dbg !21
  %0 = load i64* %n.addr, align 8, !dbg !22
  %cmp = icmp ult i64 %0, 2, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  store i64 1, i64* %retval, !dbg !25
  br label %return, !dbg !25

if.else:                                          ; preds = %entry
  %1 = load i64* %n.addr, align 8, !dbg !26
  %sub = sub i64 %1, 2, !dbg !26
  %call = call i64 @fib(i64 %sub), !dbg !27
  %2 = load i64* %n.addr, align 8, !dbg !28
  %sub1 = sub i64 %2, 1, !dbg !28
  %call2 = call i64 @fib(i64 %sub1), !dbg !29
  %add = add i64 %call, %call2, !dbg !27
  store i64 %add, i64* %retval, !dbg !30
  br label %return, !dbg !30

return:                                           ; preds = %if.else, %if.then
  %3 = load i64* %retval, !dbg !31
  ret i64 %3, !dbg !31
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %N = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !32, metadata !20), !dbg !33
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !34, metadata !20), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %N, metadata !36, metadata !20), !dbg !37
  %0 = load i32* %argc.addr, align 4, !dbg !38
  %cmp = icmp eq i32 %0, 2, !dbg !38
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !39

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !40
  %2 = load i8** %arrayidx, align 8, !dbg !40
  %call = call i32 @atoi(i8* %2), !dbg !42
  br label %cond.end, !dbg !39

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !43

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 43, %cond.false ], !dbg !39
  store i32 %cond, i32* %N, align 4, !dbg !45
  %3 = load i32* %N, align 4, !dbg !48
  %conv = sext i32 %3 to i64, !dbg !48
  %call1 = call i64 @fib(i64 %conv), !dbg !49
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i64 %call1), !dbg !50
  ret i32 0, !dbg !51
}

declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c] [DW_LANG_C99]
!1 = !{!"fib2.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9}
!4 = !{!"0x2e\00fib\00fib\00\0010\000\001\000\000\00256\000\0010", !1, !5, !6, null, i64 (i64)* @fib, null, null, !2} ; [ DW_TAG_subprogram ] [line 10] [def] [fib]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = !{!"0x2e\00main\00main\00\0018\000\001\000\000\00256\000\0018", !1, !5, !10, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 18] [def] [main]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!12, !12, !13}
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = !{i32 2, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 2}
!18 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!19 = !{!"0x101\00n\0016777226\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [n] [line 10]
!20 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!21 = !MDLocation(line: 10, column: 19, scope: !4)
!22 = !MDLocation(line: 11, column: 9, scope: !23)
!23 = !{!"0xb\0011\009\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!24 = !MDLocation(line: 11, column: 9, scope: !4)
!25 = !MDLocation(line: 12, column: 2, scope: !23)
!26 = !MDLocation(line: 14, column: 13, scope: !23)
!27 = !MDLocation(line: 14, column: 9, scope: !23)
!28 = !MDLocation(line: 14, column: 24, scope: !23)
!29 = !MDLocation(line: 14, column: 20, scope: !23)
!30 = !MDLocation(line: 14, column: 2, scope: !23)
!31 = !MDLocation(line: 15, column: 1, scope: !4)
!32 = !{!"0x101\00argc\0016777234\000", !9, !5, !12} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!33 = !MDLocation(line: 18, column: 10, scope: !9)
!34 = !{!"0x101\00argv\0033554450\000", !9, !5, !13} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!35 = !MDLocation(line: 18, column: 22, scope: !9)
!36 = !{!"0x100\00N\0024\000", !9, !5, !12}       ; [ DW_TAG_auto_variable ] [N] [line 24]
!37 = !MDLocation(line: 24, column: 9, scope: !9)
!38 = !MDLocation(line: 24, column: 15, scope: !9)
!39 = !MDLocation(line: 24, column: 14, scope: !9)
!40 = !MDLocation(line: 24, column: 33, scope: !41)
!41 = !{!"0xb\001", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!42 = !MDLocation(line: 24, column: 28, scope: !9)
!43 = !MDLocation(line: 24, column: 14, scope: !44)
!44 = !{!"0xb\002", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!45 = !MDLocation(line: 24, column: 9, scope: !46)
!46 = !{!"0xb\004", !1, !47}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!47 = !{!"0xb\003", !1, !9}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fib2.c]
!48 = !MDLocation(line: 25, column: 25, scope: !9)
!49 = !MDLocation(line: 25, column: 21, scope: !9)
!50 = !MDLocation(line: 25, column: 5, scope: !9)
!51 = !MDLocation(line: 26, column: 5, scope: !9)
