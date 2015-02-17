; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !15, metadata !16), !dbg !17
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !18, metadata !16), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %n, metadata !20, metadata !16), !dbg !21
  %0 = load i32* %argc.addr, align 4, !dbg !22
  %cmp = icmp eq i32 %0, 2, !dbg !22
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !23

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !24
  %2 = load i8** %arrayidx, align 8, !dbg !24
  %call = call i32 @atoi(i8* %2) #4, !dbg !26
  br label %cond.end, !dbg !23

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !27

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 46, %cond.false ], !dbg !23
  store i32 %cond, i32* %n, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %a, metadata !32, metadata !16), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %b, metadata !34, metadata !16), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %c, metadata !36, metadata !16), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %d, metadata !38, metadata !16), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %e, metadata !40, metadata !16), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %f, metadata !42, metadata !16), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %x, metadata !44, metadata !16), !dbg !45
  store i32 0, i32* %x, align 4, !dbg !45
  store i32 0, i32* %a, align 4, !dbg !46
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc30, %cond.end
  %3 = load i32* %a, align 4, !dbg !48
  %4 = load i32* %n, align 4, !dbg !52
  %cmp1 = icmp slt i32 %3, %4, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end32, !dbg !54

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %b, align 4, !dbg !55
  br label %for.cond2, !dbg !55

for.cond2:                                        ; preds = %for.inc27, %for.body
  %5 = load i32* %b, align 4, !dbg !57
  %6 = load i32* %n, align 4, !dbg !61
  %cmp3 = icmp slt i32 %5, %6, !dbg !62
  br i1 %cmp3, label %for.body4, label %for.end29, !dbg !63

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %c, align 4, !dbg !64
  br label %for.cond5, !dbg !64

for.cond5:                                        ; preds = %for.inc24, %for.body4
  %7 = load i32* %c, align 4, !dbg !66
  %8 = load i32* %n, align 4, !dbg !70
  %cmp6 = icmp slt i32 %7, %8, !dbg !71
  br i1 %cmp6, label %for.body7, label %for.end26, !dbg !72

for.body7:                                        ; preds = %for.cond5
  store i32 0, i32* %d, align 4, !dbg !73
  br label %for.cond8, !dbg !73

for.cond8:                                        ; preds = %for.inc21, %for.body7
  %9 = load i32* %d, align 4, !dbg !75
  %10 = load i32* %n, align 4, !dbg !79
  %cmp9 = icmp slt i32 %9, %10, !dbg !80
  br i1 %cmp9, label %for.body10, label %for.end23, !dbg !81

for.body10:                                       ; preds = %for.cond8
  store i32 0, i32* %e, align 4, !dbg !82
  br label %for.cond11, !dbg !82

for.cond11:                                       ; preds = %for.inc18, %for.body10
  %11 = load i32* %e, align 4, !dbg !84
  %12 = load i32* %n, align 4, !dbg !88
  %cmp12 = icmp slt i32 %11, %12, !dbg !89
  br i1 %cmp12, label %for.body13, label %for.end20, !dbg !90

for.body13:                                       ; preds = %for.cond11
  store i32 0, i32* %f, align 4, !dbg !91
  br label %for.cond14, !dbg !91

for.cond14:                                       ; preds = %for.inc, %for.body13
  %13 = load i32* %f, align 4, !dbg !93
  %14 = load i32* %n, align 4, !dbg !97
  %cmp15 = icmp slt i32 %13, %14, !dbg !98
  br i1 %cmp15, label %for.body16, label %for.end, !dbg !99

for.body16:                                       ; preds = %for.cond14
  %15 = load i32* %x, align 4, !dbg !100
  %inc = add nsw i32 %15, 1, !dbg !100
  store i32 %inc, i32* %x, align 4, !dbg !100
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body16
  %16 = load i32* %f, align 4, !dbg !101
  %inc17 = add nsw i32 %16, 1, !dbg !101
  store i32 %inc17, i32* %f, align 4, !dbg !101
  br label %for.cond14, !dbg !102

for.end:                                          ; preds = %for.cond14
  br label %for.inc18, !dbg !103

for.inc18:                                        ; preds = %for.end
  %17 = load i32* %e, align 4, !dbg !104
  %inc19 = add nsw i32 %17, 1, !dbg !104
  store i32 %inc19, i32* %e, align 4, !dbg !104
  br label %for.cond11, !dbg !105

for.end20:                                        ; preds = %for.cond11
  br label %for.inc21, !dbg !106

for.inc21:                                        ; preds = %for.end20
  %18 = load i32* %d, align 4, !dbg !107
  %inc22 = add nsw i32 %18, 1, !dbg !107
  store i32 %inc22, i32* %d, align 4, !dbg !107
  br label %for.cond8, !dbg !108

for.end23:                                        ; preds = %for.cond8
  br label %for.inc24, !dbg !109

for.inc24:                                        ; preds = %for.end23
  %19 = load i32* %c, align 4, !dbg !110
  %inc25 = add nsw i32 %19, 1, !dbg !110
  store i32 %inc25, i32* %c, align 4, !dbg !110
  br label %for.cond5, !dbg !111

for.end26:                                        ; preds = %for.cond5
  br label %for.inc27, !dbg !112

for.inc27:                                        ; preds = %for.end26
  %20 = load i32* %b, align 4, !dbg !113
  %inc28 = add nsw i32 %20, 1, !dbg !113
  store i32 %inc28, i32* %b, align 4, !dbg !113
  br label %for.cond2, !dbg !114

for.end29:                                        ; preds = %for.cond2
  br label %for.inc30, !dbg !115

for.inc30:                                        ; preds = %for.end29
  %21 = load i32* %a, align 4, !dbg !116
  %inc31 = add nsw i32 %21, 1, !dbg !116
  store i32 %inc31, i32* %a, align 4, !dbg !116
  br label %for.cond, !dbg !117

for.end32:                                        ; preds = %for.cond
  %22 = load i32* %x, align 4, !dbg !118
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %22), !dbg !119
  ret i32 0, !dbg !120
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
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = !{!"nestedloop.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00main\00main\00\0010\000\001\000\000\00256\000\0010", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{i32 2, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 2}
!14 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!15 = !{!"0x101\00argc\0016777226\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!16 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!17 = !MDLocation(line: 10, column: 10, scope: !4)
!18 = !{!"0x101\00argv\0033554442\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!19 = !MDLocation(line: 10, column: 22, scope: !4)
!20 = !{!"0x100\00n\0016\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 16]
!21 = !MDLocation(line: 16, column: 9, scope: !4)
!22 = !MDLocation(line: 16, column: 15, scope: !4)
!23 = !MDLocation(line: 16, column: 14, scope: !4)
!24 = !MDLocation(line: 16, column: 33, scope: !25)
!25 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!26 = !MDLocation(line: 16, column: 28, scope: !4)
!27 = !MDLocation(line: 16, column: 14, scope: !28)
!28 = !{!"0xb\002", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!29 = !MDLocation(line: 16, column: 9, scope: !30)
!30 = !{!"0xb\004", !1, !31}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!31 = !{!"0xb\003", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!32 = !{!"0x100\00a\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [a] [line 17]
!33 = !MDLocation(line: 17, column: 9, scope: !4)
!34 = !{!"0x100\00b\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [b] [line 17]
!35 = !MDLocation(line: 17, column: 12, scope: !4)
!36 = !{!"0x100\00c\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [c] [line 17]
!37 = !MDLocation(line: 17, column: 15, scope: !4)
!38 = !{!"0x100\00d\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [d] [line 17]
!39 = !MDLocation(line: 17, column: 18, scope: !4)
!40 = !{!"0x100\00e\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [e] [line 17]
!41 = !MDLocation(line: 17, column: 21, scope: !4)
!42 = !{!"0x100\00f\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [f] [line 17]
!43 = !MDLocation(line: 17, column: 24, scope: !4)
!44 = !{!"0x100\00x\0017\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [x] [line 17]
!45 = !MDLocation(line: 17, column: 27, scope: !4)
!46 = !MDLocation(line: 19, column: 10, scope: !47)
!47 = !{!"0xb\0019\005\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!48 = !MDLocation(line: 19, column: 15, scope: !49)
!49 = !{!"0xb\002", !1, !50}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!50 = !{!"0xb\001", !1, !51}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!51 = !{!"0xb\0019\005\001", !1, !47}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!52 = !MDLocation(line: 19, column: 17, scope: !51)
!53 = !MDLocation(line: 19, column: 15, scope: !51)
!54 = !MDLocation(line: 19, column: 5, scope: !47)
!55 = !MDLocation(line: 20, column: 7, scope: !56)
!56 = !{!"0xb\0020\002\002", !1, !51}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!57 = !MDLocation(line: 20, column: 12, scope: !58)
!58 = !{!"0xb\002", !1, !59}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!59 = !{!"0xb\001", !1, !60}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!60 = !{!"0xb\0020\002\003", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!61 = !MDLocation(line: 20, column: 14, scope: !60)
!62 = !MDLocation(line: 20, column: 12, scope: !60)
!63 = !MDLocation(line: 20, column: 2, scope: !56)
!64 = !MDLocation(line: 21, column: 11, scope: !65)
!65 = !{!"0xb\0021\006\004", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!66 = !MDLocation(line: 21, column: 16, scope: !67)
!67 = !{!"0xb\002", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!68 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!69 = !{!"0xb\0021\006\005", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!70 = !MDLocation(line: 21, column: 18, scope: !69)
!71 = !MDLocation(line: 21, column: 16, scope: !69)
!72 = !MDLocation(line: 21, column: 6, scope: !65)
!73 = !MDLocation(line: 22, column: 8, scope: !74)
!74 = !{!"0xb\0022\003\006", !1, !69}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!75 = !MDLocation(line: 22, column: 13, scope: !76)
!76 = !{!"0xb\002", !1, !77}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!77 = !{!"0xb\001", !1, !78}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!78 = !{!"0xb\0022\003\007", !1, !74}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!79 = !MDLocation(line: 22, column: 15, scope: !78)
!80 = !MDLocation(line: 22, column: 13, scope: !78)
!81 = !MDLocation(line: 22, column: 3, scope: !74)
!82 = !MDLocation(line: 23, column: 12, scope: !83)
!83 = !{!"0xb\0023\007\008", !1, !78}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!84 = !MDLocation(line: 23, column: 17, scope: !85)
!85 = !{!"0xb\002", !1, !86}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!86 = !{!"0xb\001", !1, !87}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!87 = !{!"0xb\0023\007\009", !1, !83}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!88 = !MDLocation(line: 23, column: 19, scope: !87)
!89 = !MDLocation(line: 23, column: 17, scope: !87)
!90 = !MDLocation(line: 23, column: 7, scope: !83)
!91 = !MDLocation(line: 24, column: 9, scope: !92)
!92 = !{!"0xb\0024\004\0010", !1, !87}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!93 = !MDLocation(line: 24, column: 14, scope: !94)
!94 = !{!"0xb\002", !1, !95}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!95 = !{!"0xb\001", !1, !96}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!96 = !{!"0xb\0024\004\0011", !1, !92}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!97 = !MDLocation(line: 24, column: 16, scope: !96)
!98 = !MDLocation(line: 24, column: 14, scope: !96)
!99 = !MDLocation(line: 24, column: 4, scope: !92)
!100 = !MDLocation(line: 25, column: 8, scope: !96)
!101 = !MDLocation(line: 24, column: 19, scope: !96)
!102 = !MDLocation(line: 24, column: 4, scope: !96)
!103 = !MDLocation(line: 25, column: 9, scope: !92)
!104 = !MDLocation(line: 23, column: 22, scope: !87)
!105 = !MDLocation(line: 23, column: 7, scope: !87)
!106 = !MDLocation(line: 25, column: 9, scope: !83)
!107 = !MDLocation(line: 22, column: 18, scope: !78)
!108 = !MDLocation(line: 22, column: 3, scope: !78)
!109 = !MDLocation(line: 25, column: 9, scope: !74)
!110 = !MDLocation(line: 21, column: 21, scope: !69)
!111 = !MDLocation(line: 21, column: 6, scope: !69)
!112 = !MDLocation(line: 25, column: 9, scope: !65)
!113 = !MDLocation(line: 20, column: 17, scope: !60)
!114 = !MDLocation(line: 20, column: 2, scope: !60)
!115 = !MDLocation(line: 25, column: 9, scope: !56)
!116 = !MDLocation(line: 19, column: 20, scope: !51)
!117 = !MDLocation(line: 19, column: 5, scope: !51)
!118 = !MDLocation(line: 27, column: 20, scope: !4)
!119 = !MDLocation(line: 27, column: 5, scope: !4)
!120 = !MDLocation(line: 28, column: 5, scope: !4)
