; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !18), !dbg !19
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !20, metadata !18), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %n, metadata !22, metadata !18), !dbg !23
  %0 = load i32* %argc.addr, align 4, !dbg !24
  %cmp = icmp eq i32 %0, 2, !dbg !24
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !25

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !26
  %2 = load i8** %arrayidx, align 8, !dbg !26
  %call = call i32 @atoi(i8* %2) #5, !dbg !28
  br label %cond.end, !dbg !25

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !29

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1500000, %cond.false ], !dbg !25
  store i32 %cond, i32* %n, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !18), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %k, metadata !36, metadata !18), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %x, metadata !38, metadata !18), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %y, metadata !40, metadata !18), !dbg !41
  %3 = load i32* %n, align 4, !dbg !42
  %conv = sext i32 %3 to i64, !dbg !42
  %call1 = call noalias i8* @calloc(i64 %conv, i64 4) #6, !dbg !43
  %4 = bitcast i8* %call1 to i32*, !dbg !44
  store i32* %4, i32** %x, align 8, !dbg !45
  %5 = load i32* %n, align 4, !dbg !46
  %conv2 = sext i32 %5 to i64, !dbg !46
  %call3 = call noalias i8* @calloc(i64 %conv2, i64 4) #6, !dbg !47
  %6 = bitcast i8* %call3 to i32*, !dbg !48
  store i32* %6, i32** %y, align 8, !dbg !49
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %cond.end
  %7 = load i32* %i, align 4, !dbg !52
  %8 = load i32* %n, align 4, !dbg !56
  %cmp4 = icmp slt i32 %7, %8, !dbg !57
  br i1 %cmp4, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %9 = load i32* %i, align 4, !dbg !59
  %add = add nsw i32 %9, 1, !dbg !59
  %10 = load i32* %i, align 4, !dbg !61
  %idxprom = sext i32 %10 to i64, !dbg !62
  %11 = load i32** %x, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i32* %11, i64 %idxprom, !dbg !62
  store i32 %add, i32* %arrayidx6, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %12 = load i32* %i, align 4, !dbg !64
  %inc = add nsw i32 %12, 1, !dbg !64
  store i32 %inc, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !66
  br label %for.cond7, !dbg !66

for.cond7:                                        ; preds = %for.inc22, %for.end
  %13 = load i32* %k, align 4, !dbg !68
  %cmp8 = icmp slt i32 %13, 1000, !dbg !68
  br i1 %cmp8, label %for.body10, label %for.end24, !dbg !72

for.body10:                                       ; preds = %for.cond7
  %14 = load i32* %n, align 4, !dbg !73
  %sub = sub nsw i32 %14, 1, !dbg !73
  store i32 %sub, i32* %i, align 4, !dbg !76
  br label %for.cond11, !dbg !76

for.cond11:                                       ; preds = %for.inc20, %for.body10
  %15 = load i32* %i, align 4, !dbg !77
  %cmp12 = icmp sge i32 %15, 0, !dbg !77
  br i1 %cmp12, label %for.body14, label %for.end21, !dbg !81

for.body14:                                       ; preds = %for.cond11
  %16 = load i32* %i, align 4, !dbg !82
  %idxprom15 = sext i32 %16 to i64, !dbg !84
  %17 = load i32** %x, align 8, !dbg !84
  %arrayidx16 = getelementptr inbounds i32* %17, i64 %idxprom15, !dbg !84
  %18 = load i32* %arrayidx16, align 4, !dbg !84
  %19 = load i32* %i, align 4, !dbg !85
  %idxprom17 = sext i32 %19 to i64, !dbg !86
  %20 = load i32** %y, align 8, !dbg !86
  %arrayidx18 = getelementptr inbounds i32* %20, i64 %idxprom17, !dbg !86
  %21 = load i32* %arrayidx18, align 4, !dbg !86
  %add19 = add nsw i32 %21, %18, !dbg !86
  store i32 %add19, i32* %arrayidx18, align 4, !dbg !86
  br label %for.inc20, !dbg !87

for.inc20:                                        ; preds = %for.body14
  %22 = load i32* %i, align 4, !dbg !88
  %dec = add nsw i32 %22, -1, !dbg !88
  store i32 %dec, i32* %i, align 4, !dbg !88
  br label %for.cond11, !dbg !89

for.end21:                                        ; preds = %for.cond11
  br label %for.inc22, !dbg !90

for.inc22:                                        ; preds = %for.end21
  %23 = load i32* %k, align 4, !dbg !91
  %inc23 = add nsw i32 %23, 1, !dbg !91
  store i32 %inc23, i32* %k, align 4, !dbg !91
  br label %for.cond7, !dbg !92

for.end24:                                        ; preds = %for.cond7
  %24 = load i32** %y, align 8, !dbg !93
  %arrayidx25 = getelementptr inbounds i32* %24, i64 0, !dbg !93
  %25 = load i32* %arrayidx25, align 4, !dbg !93
  %26 = load i32* %n, align 4, !dbg !94
  %sub26 = sub nsw i32 %26, 1, !dbg !94
  %idxprom27 = sext i32 %sub26 to i64, !dbg !95
  %27 = load i32** %y, align 8, !dbg !95
  %arrayidx28 = getelementptr inbounds i32* %27, i64 %idxprom27, !dbg !95
  %28 = load i32* %arrayidx28, align 4, !dbg !95
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %25, i32 %28), !dbg !96
  %29 = load i32** %x, align 8, !dbg !97
  %30 = bitcast i32* %29 to i8*, !dbg !97
  call void @free(i8* %30) #6, !dbg !98
  %31 = load i32** %y, align 8, !dbg !99
  %32 = bitcast i32* %31 to i8*, !dbg !99
  call void @free(i8* %32) #6, !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = !{!"ary3.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!7}
!7 = !{!"0x2e\00main\00main\00\0017\000\001\000\000\00256\000\0017", !1, !8, !9, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!5, !5, !11}
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!13 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 2}
!16 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!17 = !{!"0x101\00argc\0016777233\000", !7, !8, !5} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!18 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!19 = !MDLocation(line: 17, column: 14, scope: !7)
!20 = !{!"0x101\00argv\0033554449\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!21 = !MDLocation(line: 17, column: 26, scope: !7)
!22 = !{!"0x100\00n\0023\000", !7, !8, !5}        ; [ DW_TAG_auto_variable ] [n] [line 23]
!23 = !MDLocation(line: 23, column: 7, scope: !7)
!24 = !MDLocation(line: 23, column: 13, scope: !7)
!25 = !MDLocation(line: 23, column: 12, scope: !7)
!26 = !MDLocation(line: 23, column: 31, scope: !27)
!27 = !{!"0xb\001", !1, !7}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!28 = !MDLocation(line: 23, column: 26, scope: !7)
!29 = !MDLocation(line: 23, column: 12, scope: !30)
!30 = !{!"0xb\002", !1, !7}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!31 = !MDLocation(line: 23, column: 7, scope: !32)
!32 = !{!"0xb\004", !1, !33}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!33 = !{!"0xb\003", !1, !7}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!34 = !{!"0x100\00i\0024\000", !7, !8, !5}        ; [ DW_TAG_auto_variable ] [i] [line 24]
!35 = !MDLocation(line: 24, column: 7, scope: !7)
!36 = !{!"0x100\00k\0024\000", !7, !8, !5}        ; [ DW_TAG_auto_variable ] [k] [line 24]
!37 = !MDLocation(line: 24, column: 10, scope: !7)
!38 = !{!"0x100\00x\0024\000", !7, !8, !4}        ; [ DW_TAG_auto_variable ] [x] [line 24]
!39 = !MDLocation(line: 24, column: 14, scope: !7)
!40 = !{!"0x100\00y\0024\000", !7, !8, !4}        ; [ DW_TAG_auto_variable ] [y] [line 24]
!41 = !MDLocation(line: 24, column: 18, scope: !7)
!42 = !MDLocation(line: 26, column: 22, scope: !7)
!43 = !MDLocation(line: 26, column: 15, scope: !7)
!44 = !MDLocation(line: 26, column: 7, scope: !7)
!45 = !MDLocation(line: 26, column: 3, scope: !7)
!46 = !MDLocation(line: 27, column: 22, scope: !7)
!47 = !MDLocation(line: 27, column: 15, scope: !7)
!48 = !MDLocation(line: 27, column: 7, scope: !7)
!49 = !MDLocation(line: 27, column: 3, scope: !7)
!50 = !MDLocation(line: 29, column: 8, scope: !51)
!51 = !{!"0xb\0029\003\000", !1, !7}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!52 = !MDLocation(line: 29, column: 15, scope: !53)
!53 = !{!"0xb\002", !1, !54}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!54 = !{!"0xb\001", !1, !55}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!55 = !{!"0xb\0029\003\001", !1, !51}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!56 = !MDLocation(line: 29, column: 19, scope: !55)
!57 = !MDLocation(line: 29, column: 15, scope: !55)
!58 = !MDLocation(line: 29, column: 3, scope: !51)
!59 = !MDLocation(line: 30, column: 12, scope: !60)
!60 = !{!"0xb\0029\0027\002", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!61 = !MDLocation(line: 30, column: 7, scope: !60)
!62 = !MDLocation(line: 30, column: 5, scope: !60)
!63 = !MDLocation(line: 31, column: 3, scope: !60)
!64 = !MDLocation(line: 29, column: 22, scope: !55)
!65 = !MDLocation(line: 29, column: 3, scope: !55)
!66 = !MDLocation(line: 33, column: 8, scope: !67)
!67 = !{!"0xb\0033\003\003", !1, !7}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!68 = !MDLocation(line: 33, column: 13, scope: !69)
!69 = !{!"0xb\002", !1, !70}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!70 = !{!"0xb\001", !1, !71}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!71 = !{!"0xb\0033\003\004", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!72 = !MDLocation(line: 33, column: 3, scope: !67)
!73 = !MDLocation(line: 34, column: 14, scope: !74)
!74 = !{!"0xb\0034\005\006", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!75 = !{!"0xb\0033\0026\005", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!76 = !MDLocation(line: 34, column: 10, scope: !74)
!77 = !MDLocation(line: 34, column: 19, scope: !78)
!78 = !{!"0xb\002", !1, !79}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!79 = !{!"0xb\001", !1, !80}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!80 = !{!"0xb\0034\005\007", !1, !74}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!81 = !MDLocation(line: 34, column: 5, scope: !74)
!82 = !MDLocation(line: 35, column: 17, scope: !83)
!83 = !{!"0xb\0034\0032\008", !1, !80}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!84 = !MDLocation(line: 35, column: 15, scope: !83)
!85 = !MDLocation(line: 35, column: 9, scope: !83)
!86 = !MDLocation(line: 35, column: 7, scope: !83)
!87 = !MDLocation(line: 36, column: 5, scope: !83)
!88 = !MDLocation(line: 34, column: 27, scope: !80)
!89 = !MDLocation(line: 34, column: 5, scope: !80)
!90 = !MDLocation(line: 37, column: 3, scope: !75)
!91 = !MDLocation(line: 33, column: 21, scope: !71)
!92 = !MDLocation(line: 33, column: 3, scope: !71)
!93 = !MDLocation(line: 39, column: 21, scope: !7)
!94 = !MDLocation(line: 39, column: 29, scope: !7)
!95 = !MDLocation(line: 39, column: 27, scope: !7)
!96 = !MDLocation(line: 39, column: 3, scope: !7)
!97 = !MDLocation(line: 41, column: 8, scope: !7)
!98 = !MDLocation(line: 41, column: 3, scope: !7)
!99 = !MDLocation(line: 42, column: 8, scope: !7)
!100 = !MDLocation(line: 42, column: 3, scope: !7)
!101 = !MDLocation(line: 44, column: 3, scope: !7)
