; ModuleID = 'sieve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.flags = internal global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %NUM = alloca i32, align 4
  %i = alloca i64, align 8
  %k = alloca i64, align 8
  %count = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !20, metadata !21), !dbg !22
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !23, metadata !21), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %NUM, metadata !25, metadata !21), !dbg !26
  %0 = load i32* %argc.addr, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 2, !dbg !27
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !29
  %2 = load i8** %arrayidx, align 8, !dbg !29
  %call = call i32 @atoi(i8* %2) #4, !dbg !31
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !32

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 170000, %cond.false ], !dbg !28
  store i32 %cond, i32* %NUM, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !21), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %k, metadata !40, metadata !21), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %count, metadata !42, metadata !21), !dbg !43
  store i32 0, i32* %count, align 4, !dbg !43
  br label %while.cond, !dbg !44

while.cond:                                       ; preds = %for.end18, %cond.end
  %3 = load i32* %NUM, align 4, !dbg !45
  %dec = add nsw i32 %3, -1, !dbg !45
  store i32 %dec, i32* %NUM, align 4, !dbg !45
  %tobool = icmp ne i32 %3, 0, !dbg !44
  br i1 %tobool, label %while.body, label %while.end, !dbg !44

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %count, align 4, !dbg !47
  store i64 2, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %while.body
  %4 = load i64* %i, align 8, !dbg !51
  %cmp1 = icmp sle i64 %4, 8192, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %5 = load i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %5, !dbg !58
  store i8 1, i8* %arrayidx2, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64* %i, align 8, !dbg !60
  %inc = add nsw i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61

for.end:                                          ; preds = %for.cond
  store i64 2, i64* %i, align 8, !dbg !62
  br label %for.cond3, !dbg !62

for.cond3:                                        ; preds = %for.inc16, %for.end
  %7 = load i64* %i, align 8, !dbg !64
  %cmp4 = icmp sle i64 %7, 8192, !dbg !64
  br i1 %cmp4, label %for.body5, label %for.end18, !dbg !68

for.body5:                                        ; preds = %for.cond3
  %8 = load i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %8, !dbg !72
  %9 = load i8* %arrayidx6, align 1, !dbg !72
  %tobool7 = icmp ne i8 %9, 0, !dbg !73
  br i1 %tobool7, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %for.body5
  %10 = load i64* %i, align 8, !dbg !74
  %11 = load i64* %i, align 8, !dbg !77
  %add = add nsw i64 %10, %11, !dbg !74
  store i64 %add, i64* %k, align 8, !dbg !78
  br label %for.cond8, !dbg !78

for.cond8:                                        ; preds = %for.inc12, %if.then
  %12 = load i64* %k, align 8, !dbg !79
  %cmp9 = icmp sle i64 %12, 8192, !dbg !79
  br i1 %cmp9, label %for.body10, label %for.end14, !dbg !83

for.body10:                                       ; preds = %for.cond8
  %13 = load i64* %k, align 8, !dbg !84
  %arrayidx11 = getelementptr inbounds [8193 x i8]* @main.flags, i32 0, i64 %13, !dbg !86
  store i8 0, i8* %arrayidx11, align 1, !dbg !86
  br label %for.inc12, !dbg !87

for.inc12:                                        ; preds = %for.body10
  %14 = load i64* %i, align 8, !dbg !88
  %15 = load i64* %k, align 8, !dbg !89
  %add13 = add nsw i64 %15, %14, !dbg !89
  store i64 %add13, i64* %k, align 8, !dbg !89
  br label %for.cond8, !dbg !90

for.end14:                                        ; preds = %for.cond8
  %16 = load i32* %count, align 4, !dbg !91
  %inc15 = add nsw i32 %16, 1, !dbg !91
  store i32 %inc15, i32* %count, align 4, !dbg !91
  br label %if.end, !dbg !92

if.end:                                           ; preds = %for.end14, %for.body5
  br label %for.inc16, !dbg !93

for.inc16:                                        ; preds = %if.end
  %17 = load i64* %i, align 8, !dbg !94
  %inc17 = add nsw i64 %17, 1, !dbg !94
  store i64 %inc17, i64* %i, align 8, !dbg !94
  br label %for.cond3, !dbg !95

for.end18:                                        ; preds = %for.cond3
  br label %while.cond, !dbg !44

while.end:                                        ; preds = %while.cond
  %18 = load i32* %count, align 4, !dbg !96
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %18), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !12, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c] [DW_LANG_C99]
!1 = !{!"sieve.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00main\00main\00\0010\000\001\000\000\00256\000\0010", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!13}
!13 = !{!"0x34\00flags\00flags\00\0017\001\001", !4, !5, !14, [8193 x i8]* @main.flags, null} ; [ DW_TAG_variable ] [flags] [line 17] [local] [def]
!14 = !{!"0x1\00\000\0065544\008\000\000\000", null, null, !11, !15, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65544, align 8, offset 0] [from char]
!15 = !{!16}
!16 = !{!"0x21\000\008193"}                       ; [ DW_TAG_subrange_type ] [0, 8192]
!17 = !{i32 2, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 2}
!19 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!20 = !{!"0x101\00argc\0016777226\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!21 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!22 = !MDLocation(line: 10, column: 10, scope: !4)
!23 = !{!"0x101\00argv\0033554442\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!24 = !MDLocation(line: 10, column: 22, scope: !4)
!25 = !{!"0x100\00NUM\0016\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [NUM] [line 16]
!26 = !MDLocation(line: 16, column: 9, scope: !4)
!27 = !MDLocation(line: 16, column: 17, scope: !4)
!28 = !MDLocation(line: 16, column: 16, scope: !4)
!29 = !MDLocation(line: 16, column: 35, scope: !30)
!30 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!31 = !MDLocation(line: 16, column: 30, scope: !4)
!32 = !MDLocation(line: 16, column: 16, scope: !33)
!33 = !{!"0xb\002", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!34 = !MDLocation(line: 16, column: 9, scope: !35)
!35 = !{!"0xb\004", !1, !36}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!36 = !{!"0xb\003", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!37 = !{!"0x100\00i\0018\000", !4, !5, !38}       ; [ DW_TAG_auto_variable ] [i] [line 18]
!38 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!39 = !MDLocation(line: 18, column: 10, scope: !4)
!40 = !{!"0x100\00k\0018\000", !4, !5, !38}       ; [ DW_TAG_auto_variable ] [k] [line 18]
!41 = !MDLocation(line: 18, column: 13, scope: !4)
!42 = !{!"0x100\00count\0019\000", !4, !5, !8}    ; [ DW_TAG_auto_variable ] [count] [line 19]
!43 = !MDLocation(line: 19, column: 9, scope: !4)
!44 = !MDLocation(line: 21, column: 5, scope: !4)
!45 = !MDLocation(line: 21, column: 12, scope: !46)
!46 = !{!"0xb\002", !1, !30}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!47 = !MDLocation(line: 22, column: 2, scope: !48)
!48 = !{!"0xb\0021\0019\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!49 = !MDLocation(line: 23, column: 7, scope: !50)
!50 = !{!"0xb\0023\002\001", !1, !48}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!51 = !MDLocation(line: 23, column: 12, scope: !52)
!52 = !{!"0xb\002", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!53 = !{!"0xb\001", !1, !54}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!54 = !{!"0xb\0023\002\002", !1, !50}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!55 = !MDLocation(line: 23, column: 2, scope: !50)
!56 = !MDLocation(line: 24, column: 12, scope: !57)
!57 = !{!"0xb\0023\0028\003", !1, !54}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!58 = !MDLocation(line: 24, column: 6, scope: !57)
!59 = !MDLocation(line: 25, column: 2, scope: !57)
!60 = !MDLocation(line: 23, column: 23, scope: !54)
!61 = !MDLocation(line: 23, column: 2, scope: !54)
!62 = !MDLocation(line: 26, column: 7, scope: !63)
!63 = !{!"0xb\0026\002\004", !1, !48}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!64 = !MDLocation(line: 26, column: 12, scope: !65)
!65 = !{!"0xb\002", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!66 = !{!"0xb\001", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!67 = !{!"0xb\0026\002\005", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!68 = !MDLocation(line: 26, column: 2, scope: !63)
!69 = !MDLocation(line: 27, column: 16, scope: !70)
!70 = !{!"0xb\0027\0010\007", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!71 = !{!"0xb\0026\0028\006", !1, !67}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!72 = !MDLocation(line: 27, column: 10, scope: !70)
!73 = !MDLocation(line: 27, column: 10, scope: !71)
!74 = !MDLocation(line: 29, column: 10, scope: !75)
!75 = !{!"0xb\0029\003\009", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!76 = !{!"0xb\0027\0020\008", !1, !70}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!77 = !MDLocation(line: 29, column: 12, scope: !75)
!78 = !MDLocation(line: 29, column: 8, scope: !75)
!79 = !MDLocation(line: 29, column: 15, scope: !80)
!80 = !{!"0xb\002", !1, !81}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!81 = !{!"0xb\001", !1, !82}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!82 = !{!"0xb\0029\003\0010", !1, !75}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!83 = !MDLocation(line: 29, column: 3, scope: !75)
!84 = !MDLocation(line: 30, column: 13, scope: !85)
!85 = !{!"0xb\0029\0032\0011", !1, !82}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!86 = !MDLocation(line: 30, column: 7, scope: !85)
!87 = !MDLocation(line: 31, column: 3, scope: !85)
!88 = !MDLocation(line: 29, column: 29, scope: !82)
!89 = !MDLocation(line: 29, column: 26, scope: !82)
!90 = !MDLocation(line: 29, column: 3, scope: !82)
!91 = !MDLocation(line: 32, column: 3, scope: !76)
!92 = !MDLocation(line: 33, column: 6, scope: !76)
!93 = !MDLocation(line: 34, column: 2, scope: !71)
!94 = !MDLocation(line: 26, column: 23, scope: !67)
!95 = !MDLocation(line: 26, column: 2, scope: !67)
!96 = !MDLocation(line: 36, column: 27, scope: !4)
!97 = !MDLocation(line: 36, column: 5, scope: !4)
!98 = !MDLocation(line: 37, column: 5, scope: !4)
