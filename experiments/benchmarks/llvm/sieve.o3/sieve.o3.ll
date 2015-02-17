; ModuleID = 'sieve.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.flags = internal unnamed_addr global [8193 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"Count: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !39), !dbg !40
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !39), !dbg !41
  %cmp = icmp eq i32 %argc, 2, !dbg !42
  br i1 %cmp, label %while.cond.preheader, label %for.cond.preheader.preheader, !dbg !43

while.cond.preheader:                             ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !44
  %0 = load i8** %arrayidx, align 8, !dbg !44, !tbaa !46
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !50, metadata !39) #3, !dbg !52
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !53
  %conv.i = trunc i64 %call.i to i32, !dbg !54
  %tobool39 = icmp eq i32 %conv.i, 0, !dbg !55
  br i1 %tobool39, label %while.end, label %for.cond.preheader.preheader, !dbg !55

for.cond.preheader.preheader:                     ; preds = %while.cond.preheader, %entry
  %dec40.in.ph = phi i32 [ %conv.i, %while.cond.preheader ], [ 170000, %entry ]
  br label %for.cond.preheader, !dbg !56

while.cond.loopexit:                              ; preds = %for.inc16
  %count.2.lcssa = phi i32 [ %count.2, %for.inc16 ]
  %dec40 = add nsw i32 %dec40.in, -1, !dbg !61
  %tobool = icmp eq i32 %dec40, 0, !dbg !55
  br i1 %tobool, label %while.end.loopexit, label %for.cond.preheader, !dbg !55

for.cond.preheader:                               ; preds = %for.cond.preheader.preheader, %while.cond.loopexit
  %dec40.in = phi i32 [ %dec40, %while.cond.loopexit ], [ %dec40.in.ph, %for.cond.preheader.preheader ]
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([8193 x i8]* @main.flags, i64 0, i64 2), i8 1, i64 8191, i32 2, i1 false), !dbg !56
  br label %for.body5, !dbg !63

for.body5:                                        ; preds = %for.inc16.for.body5_crit_edge, %for.cond.preheader
  %1 = phi i8 [ 1, %for.cond.preheader ], [ %.pre, %for.inc16.for.body5_crit_edge ]
  %count.137 = phi i32 [ 0, %for.cond.preheader ], [ %count.2, %for.inc16.for.body5_crit_edge ]
  %i.134 = phi i64 [ 2, %for.cond.preheader ], [ %inc17, %for.inc16.for.body5_crit_edge ]
  %tobool7 = icmp eq i8 %1, 0, !dbg !65
  br i1 %tobool7, label %for.inc16, label %if.then, !dbg !65

if.then:                                          ; preds = %for.body5
  %add = shl nsw i64 %i.134, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !20, metadata !39), !dbg !72
  %cmp932 = icmp slt i64 %add, 8193, !dbg !73
  br i1 %cmp932, label %for.body10.preheader, label %for.end14, !dbg !77

for.body10.preheader:                             ; preds = %if.then
  br label %for.body10, !dbg !78

for.body10:                                       ; preds = %for.body10.preheader, %for.body10
  %k.033 = phi i64 [ %add13, %for.body10 ], [ %add, %for.body10.preheader ]
  %arrayidx11 = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %k.033, !dbg !78
  store i8 0, i8* %arrayidx11, align 1, !dbg !78, !tbaa !80
  %add13 = add nuw nsw i64 %k.033, %i.134, !dbg !81
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !20, metadata !39), !dbg !72
  %cmp9 = icmp slt i64 %add13, 8193, !dbg !73
  br i1 %cmp9, label %for.body10, label %for.end14.loopexit, !dbg !77

for.end14.loopexit:                               ; preds = %for.body10
  br label %for.end14

for.end14:                                        ; preds = %for.end14.loopexit, %if.then
  %inc15 = add nsw i32 %count.137, 1, !dbg !82
  tail call void @llvm.dbg.value(metadata i32 %inc15, i64 0, metadata !21, metadata !39), !dbg !83
  br label %for.inc16, !dbg !84

for.inc16:                                        ; preds = %for.body5, %for.end14
  %count.2 = phi i32 [ %inc15, %for.end14 ], [ %count.137, %for.body5 ]
  %inc17 = add nuw nsw i64 %i.134, 1, !dbg !85
  tail call void @llvm.dbg.value(metadata i64 %inc17, i64 0, metadata !18, metadata !39), !dbg !86
  %exitcond = icmp eq i64 %inc17, 8193, !dbg !63
  br i1 %exitcond, label %while.cond.loopexit, label %for.inc16.for.body5_crit_edge, !dbg !63

for.inc16.for.body5_crit_edge:                    ; preds = %for.inc16
  %arrayidx6.phi.trans.insert = getelementptr inbounds [8193 x i8]* @main.flags, i64 0, i64 %inc17
  %.pre = load i8* %arrayidx6.phi.trans.insert, align 1, !dbg !87, !tbaa !80
  br label %for.body5, !dbg !63

while.end.loopexit:                               ; preds = %while.cond.loopexit
  %count.2.lcssa.lcssa = phi i32 [ %count.2.lcssa, %while.cond.loopexit ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %count.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %count.2.lcssa.lcssa, %while.end.loopexit ]
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %count.0.lcssa) #3, !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !31, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c] [DW_LANG_C99]
!1 = !{!"sieve.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !22}
!10 = !{!"0x2e\00main\00main\00\0010\000\001\000\000\00256\001\0010", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !5}
!14 = !{!15, !16, !17, !18, !20, !21}
!15 = !{!"0x101\00argc\0016777226\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!16 = !{!"0x101\00argv\0033554442\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!17 = !{!"0x100\00NUM\0016\000", !10, !11, !4}    ; [ DW_TAG_auto_variable ] [NUM] [line 16]
!18 = !{!"0x100\00i\0018\000", !10, !11, !19}     ; [ DW_TAG_auto_variable ] [i] [line 18]
!19 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!20 = !{!"0x100\00k\0018\000", !10, !11, !19}     ; [ DW_TAG_auto_variable ] [k] [line 18]
!21 = !{!"0x100\00count\0019\000", !10, !11, !4}  ; [ DW_TAG_auto_variable ] [count] [line 19]
!22 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !23, !24, !25, null, null, null, null, !29} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!23 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!24 = !{!"0x29", !23}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{!4, !27}
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!29 = !{!30}
!30 = !{!"0x101\00__nptr\0016777494\000", !22, !24, !27} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!31 = !{!32}
!32 = !{!"0x34\00flags\00flags\00\0017\001\001", !10, !11, !33, [8193 x i8]* @main.flags, null} ; [ DW_TAG_variable ] [flags] [line 17] [local] [def]
!33 = !{!"0x1\00\000\0065544\008\000\000\000", null, null, !7, !34, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65544, align 8, offset 0] [from char]
!34 = !{!35}
!35 = !{!"0x21\000\008193"}                       ; [ DW_TAG_subrange_type ] [0, 8192]
!36 = !{i32 2, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 2}
!38 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!39 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!40 = !MDLocation(line: 10, column: 10, scope: !10)
!41 = !MDLocation(line: 10, column: 22, scope: !10)
!42 = !MDLocation(line: 16, column: 17, scope: !10)
!43 = !MDLocation(line: 16, column: 16, scope: !10)
!44 = !MDLocation(line: 16, column: 35, scope: !45)
!45 = !{!"0xb\001", !1, !10}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!46 = !{!47, !47, i64 0}
!47 = !{!"any pointer", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !{!"0x101\00__nptr\0016777494\000", !22, !24, !27, !51} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!51 = !MDLocation(line: 16, column: 30, scope: !10)
!52 = !MDLocation(line: 278, column: 1, scope: !22, inlinedAt: !51)
!53 = !MDLocation(line: 280, column: 16, scope: !22, inlinedAt: !51)
!54 = !MDLocation(line: 280, column: 10, scope: !22, inlinedAt: !51)
!55 = !MDLocation(line: 21, column: 5, scope: !10)
!56 = !MDLocation(line: 24, column: 6, scope: !57)
!57 = !{!"0xb\0023\0028\003", !1, !58}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!58 = !{!"0xb\0023\002\002", !1, !59}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!59 = !{!"0xb\0023\002\001", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!60 = !{!"0xb\0021\0019\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!61 = !MDLocation(line: 21, column: 12, scope: !62)
!62 = !{!"0xb\002", !1, !45}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!63 = !MDLocation(line: 26, column: 2, scope: !64)
!64 = !{!"0xb\0026\002\004", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!65 = !MDLocation(line: 27, column: 10, scope: !66)
!66 = !{!"0xb\0026\0028\006", !1, !67}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!67 = !{!"0xb\0026\002\005", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!68 = !MDLocation(line: 29, column: 10, scope: !69)
!69 = !{!"0xb\0029\003\009", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!70 = !{!"0xb\0027\0020\008", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!71 = !{!"0xb\0027\0010\007", !1, !66}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!72 = !MDLocation(line: 18, column: 13, scope: !10)
!73 = !MDLocation(line: 29, column: 15, scope: !74)
!74 = !{!"0xb\002", !1, !75}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!75 = !{!"0xb\001", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!76 = !{!"0xb\0029\003\0010", !1, !69}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!77 = !MDLocation(line: 29, column: 3, scope: !69)
!78 = !MDLocation(line: 30, column: 7, scope: !79)
!79 = !{!"0xb\0029\0032\0011", !1, !76}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/sieve.c]
!80 = !{!48, !48, i64 0}
!81 = !MDLocation(line: 29, column: 26, scope: !76)
!82 = !MDLocation(line: 32, column: 3, scope: !70)
!83 = !MDLocation(line: 19, column: 9, scope: !10)
!84 = !MDLocation(line: 33, column: 6, scope: !70)
!85 = !MDLocation(line: 26, column: 23, scope: !67)
!86 = !MDLocation(line: 18, column: 10, scope: !10)
!87 = !MDLocation(line: 27, column: 10, scope: !71)
!88 = !MDLocation(line: 36, column: 5, scope: !10)
!89 = !MDLocation(line: 37, column: 5, scope: !10)
