; ModuleID = 'strcat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"calloc strbuf\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"realloc strbuf\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %buflen = alloca i32, align 4
  %strbuf = alloca i8*, align 8
  %strend = alloca i8*, align 8
  %stufflen = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !16, metadata !17), !dbg !18
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !19, metadata !17), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %n, metadata !21, metadata !17), !dbg !22
  %0 = load i32* %argc.addr, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 2, !dbg !23
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !24

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !25
  %2 = load i8** %arrayidx, align 8, !dbg !25
  %call = call i32 @atoi(i8* %2) #6, !dbg !27
  br label %cond.end, !dbg !24

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 10000000, %cond.false ], !dbg !24
  store i32 %cond, i32* %n, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !17), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %buflen, metadata !35, metadata !17), !dbg !36
  store i32 32, i32* %buflen, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i8** %strbuf, metadata !37, metadata !17), !dbg !38
  %3 = load i32* %buflen, align 4, !dbg !39
  %conv = sext i32 %3 to i64, !dbg !39
  %call1 = call noalias i8* @calloc(i64 1, i64 %conv) #7, !dbg !40
  store i8* %call1, i8** %strbuf, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i8** %strend, metadata !41, metadata !17), !dbg !42
  %4 = load i8** %strbuf, align 8, !dbg !43
  store i8* %4, i8** %strend, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %stufflen, metadata !44, metadata !17), !dbg !45
  store i32 6, i32* %stufflen, align 4, !dbg !45
  %5 = load i8** %strbuf, align 8, !dbg !46
  %tobool = icmp ne i8* %5, null, !dbg !48
  br i1 %tobool, label %if.end, label %if.then, !dbg !48

if.then:                                          ; preds = %cond.end
  call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0)), !dbg !49
  call void @exit(i32 1) #8, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32* %i, align 4, !dbg !55
  %7 = load i32* %n, align 4, !dbg !59
  %cmp2 = icmp slt i32 %6, %7, !dbg !60
  br i1 %cmp2, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %8 = load i8** %strbuf, align 8, !dbg !62
  %9 = load i32* %buflen, align 4, !dbg !65
  %idx.ext = sext i32 %9 to i64, !dbg !62
  %add.ptr = getelementptr inbounds i8* %8, i64 %idx.ext, !dbg !62
  %10 = load i8** %strend, align 8, !dbg !66
  %sub.ptr.lhs.cast = ptrtoint i8* %add.ptr to i64, !dbg !67
  %sub.ptr.rhs.cast = ptrtoint i8* %10 to i64, !dbg !67
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !67
  %11 = load i32* %stufflen, align 4, !dbg !68
  %add = add nsw i32 %11, 1, !dbg !68
  %conv4 = sext i32 %add to i64, !dbg !69
  %cmp5 = icmp slt i64 %sub.ptr.sub, %conv4, !dbg !70
  br i1 %cmp5, label %if.then7, label %if.end15, !dbg !71

if.then7:                                         ; preds = %for.body
  %12 = load i32* %buflen, align 4, !dbg !72
  %mul = mul nsw i32 2, %12, !dbg !74
  store i32 %mul, i32* %buflen, align 4, !dbg !75
  %13 = load i8** %strbuf, align 8, !dbg !76
  %14 = load i32* %buflen, align 4, !dbg !77
  %conv8 = sext i32 %14 to i64, !dbg !77
  %call9 = call i8* @realloc(i8* %13, i64 %conv8) #7, !dbg !78
  store i8* %call9, i8** %strbuf, align 8, !dbg !79
  %15 = load i8** %strbuf, align 8, !dbg !80
  %tobool10 = icmp ne i8* %15, null, !dbg !82
  br i1 %tobool10, label %if.end12, label %if.then11, !dbg !82

if.then11:                                        ; preds = %if.then7
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0)), !dbg !83
  call void @exit(i32 1) #8, !dbg !86
  unreachable, !dbg !86

if.end12:                                         ; preds = %if.then7
  %16 = load i8** %strbuf, align 8, !dbg !87
  %17 = load i8** %strbuf, align 8, !dbg !88
  %call13 = call i64 @strlen(i8* %17) #6, !dbg !89
  %add.ptr14 = getelementptr inbounds i8* %16, i64 %call13, !dbg !87
  store i8* %add.ptr14, i8** %strend, align 8, !dbg !90
  br label %if.end15, !dbg !91

if.end15:                                         ; preds = %if.end12, %for.body
  %18 = load i8** %strend, align 8, !dbg !92
  %call16 = call i8* @strcat(i8* %18, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0)) #7, !dbg !93
  %19 = load i32* %stufflen, align 4, !dbg !94
  %20 = load i8** %strend, align 8, !dbg !95
  %idx.ext17 = sext i32 %19 to i64, !dbg !95
  %add.ptr18 = getelementptr inbounds i8* %20, i64 %idx.ext17, !dbg !95
  store i8* %add.ptr18, i8** %strend, align 8, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %if.end15
  %21 = load i32* %i, align 4, !dbg !97
  %inc = add nsw i32 %21, 1, !dbg !97
  store i32 %inc, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !98

for.end:                                          ; preds = %for.cond
  %22 = load i8** %strbuf, align 8, !dbg !99
  %call19 = call i64 @strlen(i8* %22) #6, !dbg !100
  %conv20 = trunc i64 %call19 to i32, !dbg !101
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %conv20), !dbg !102
  %23 = load i8** %strbuf, align 8, !dbg !103
  call void @free(i8* %23) #7, !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #3

declare void @perror(i8*) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #3

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c] [DW_LANG_C99]
!1 = !{!"strcat.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6}
!6 = !{!"0x2e\00main\00main\00\0013\000\001\000\000\00256\000\0013", !1, !7, !8, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !4, !10}
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!12 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = !{i32 2, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 2}
!15 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!16 = !{!"0x101\00argc\0016777229\000", !6, !7, !4} ; [ DW_TAG_arg_variable ] [argc] [line 13]
!17 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!18 = !MDLocation(line: 13, column: 10, scope: !6)
!19 = !{!"0x101\00argv\0033554445\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [argv] [line 13]
!20 = !MDLocation(line: 13, column: 22, scope: !6)
!21 = !{!"0x100\00n\0014\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [n] [line 14]
!22 = !MDLocation(line: 14, column: 9, scope: !6)
!23 = !MDLocation(line: 14, column: 15, scope: !6)
!24 = !MDLocation(line: 14, column: 14, scope: !6)
!25 = !MDLocation(line: 14, column: 33, scope: !26)
!26 = !{!"0xb\001", !1, !6}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!27 = !MDLocation(line: 14, column: 28, scope: !6)
!28 = !MDLocation(line: 14, column: 14, scope: !29)
!29 = !{!"0xb\002", !1, !6}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!30 = !MDLocation(line: 14, column: 9, scope: !31)
!31 = !{!"0xb\004", !1, !32}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!32 = !{!"0xb\003", !1, !6}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!33 = !{!"0x100\00i\0015\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [i] [line 15]
!34 = !MDLocation(line: 15, column: 9, scope: !6)
!35 = !{!"0x100\00buflen\0015\000", !6, !7, !4}   ; [ DW_TAG_auto_variable ] [buflen] [line 15]
!36 = !MDLocation(line: 15, column: 12, scope: !6)
!37 = !{!"0x100\00strbuf\0016\000", !6, !7, !11}  ; [ DW_TAG_auto_variable ] [strbuf] [line 16]
!38 = !MDLocation(line: 16, column: 11, scope: !6)
!39 = !MDLocation(line: 16, column: 41, scope: !6)
!40 = !MDLocation(line: 16, column: 20, scope: !6)
!41 = !{!"0x100\00strend\0017\000", !6, !7, !11}  ; [ DW_TAG_auto_variable ] [strend] [line 17]
!42 = !MDLocation(line: 17, column: 11, scope: !6)
!43 = !MDLocation(line: 17, column: 20, scope: !6)
!44 = !{!"0x100\00stufflen\0018\000", !6, !7, !4} ; [ DW_TAG_auto_variable ] [stufflen] [line 18]
!45 = !MDLocation(line: 18, column: 9, scope: !6)
!46 = !MDLocation(line: 20, column: 10, scope: !47)
!47 = !{!"0xb\0020\009\000", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!48 = !MDLocation(line: 20, column: 9, scope: !6)
!49 = !MDLocation(line: 20, column: 20, scope: !50)
!50 = !{!"0xb\001", !1, !51}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!51 = !{!"0xb\0020\0018\001", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!52 = !MDLocation(line: 20, column: 45, scope: !51)
!53 = !MDLocation(line: 21, column: 10, scope: !54)
!54 = !{!"0xb\0021\005\002", !1, !6}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!55 = !MDLocation(line: 21, column: 15, scope: !56)
!56 = !{!"0xb\002", !1, !57}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!57 = !{!"0xb\001", !1, !58}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!58 = !{!"0xb\0021\005\003", !1, !54}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!59 = !MDLocation(line: 21, column: 17, scope: !58)
!60 = !MDLocation(line: 21, column: 15, scope: !58)
!61 = !MDLocation(line: 21, column: 5, scope: !54)
!62 = !MDLocation(line: 22, column: 8, scope: !63)
!63 = !{!"0xb\0022\006\005", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!64 = !{!"0xb\0021\0025\004", !1, !58}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!65 = !MDLocation(line: 22, column: 15, scope: !63)
!66 = !MDLocation(line: 22, column: 23, scope: !63)
!67 = !MDLocation(line: 22, column: 7, scope: !63)
!68 = !MDLocation(line: 22, column: 34, scope: !63)
!69 = !MDLocation(line: 22, column: 33, scope: !63)
!70 = !MDLocation(line: 22, column: 6, scope: !63)
!71 = !MDLocation(line: 22, column: 6, scope: !64)
!72 = !MDLocation(line: 23, column: 17, scope: !73)
!73 = !{!"0xb\0022\0047\006", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!74 = !MDLocation(line: 23, column: 15, scope: !73)
!75 = !MDLocation(line: 23, column: 6, scope: !73)
!76 = !MDLocation(line: 24, column: 23, scope: !73)
!77 = !MDLocation(line: 24, column: 31, scope: !73)
!78 = !MDLocation(line: 24, column: 15, scope: !73)
!79 = !MDLocation(line: 24, column: 6, scope: !73)
!80 = !MDLocation(line: 25, column: 11, scope: !81)
!81 = !{!"0xb\0025\0010\007", !1, !73}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!82 = !MDLocation(line: 25, column: 10, scope: !73)
!83 = !MDLocation(line: 25, column: 21, scope: !84)
!84 = !{!"0xb\001", !1, !85}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!85 = !{!"0xb\0025\0019\008", !1, !81}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!86 = !MDLocation(line: 25, column: 47, scope: !85)
!87 = !MDLocation(line: 26, column: 15, scope: !73)
!88 = !MDLocation(line: 26, column: 31, scope: !73)
!89 = !MDLocation(line: 26, column: 24, scope: !73)
!90 = !MDLocation(line: 26, column: 6, scope: !73)
!91 = !MDLocation(line: 27, column: 2, scope: !73)
!92 = !MDLocation(line: 29, column: 9, scope: !64)
!93 = !MDLocation(line: 29, column: 2, scope: !64)
!94 = !MDLocation(line: 30, column: 12, scope: !64)
!95 = !MDLocation(line: 30, column: 2, scope: !64)
!96 = !MDLocation(line: 31, column: 5, scope: !64)
!97 = !MDLocation(line: 21, column: 20, scope: !58)
!98 = !MDLocation(line: 21, column: 5, scope: !58)
!99 = !MDLocation(line: 32, column: 32, scope: !6)
!100 = !MDLocation(line: 32, column: 25, scope: !6)
!101 = !MDLocation(line: 32, column: 20, scope: !6)
!102 = !MDLocation(line: 32, column: 5, scope: !6)
!103 = !MDLocation(line: 33, column: 10, scope: !6)
!104 = !MDLocation(line: 33, column: 5, scope: !6)
!105 = !MDLocation(line: 35, column: 5, scope: !6)
