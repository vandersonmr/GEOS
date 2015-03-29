; ModuleID = 'nsieve-bits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !17, metadata !32), !dbg !33
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !18, metadata !32), !dbg !34
  tail call void @llvm.dbg.value(metadata i32 40960000, i64 0, metadata !20, metadata !32), !dbg !35
  %call = tail call noalias i8* @malloc(i64 5120004) #2, !dbg !36
  %0 = bitcast i8* %call to i32*, !dbg !37
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !21, metadata !32), !dbg !38
  %tobool = icmp eq i8* %call, null, !dbg !39
  br i1 %tobool, label %return, label %for.body, !dbg !39

for.body:                                         ; preds = %entry, %for.end41
  %m.077 = phi i32 [ %inc44, %for.end41 ], [ 0, %entry ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !32), !dbg !40
  %shr = lshr i32 40960000, %m.077, !dbg !41
  tail call void @llvm.dbg.value(metadata i32 %shr, i64 0, metadata !28, metadata !32), !dbg !42
  %div2 = lshr i32 %shr, 3, !dbg !43
  %conv3 = zext i32 %div2 to i64, !dbg !43
  %add4 = add nuw nsw i64 %conv3, 4, !dbg !43
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 -1, i64 %add4, i32 4, i1 false), !dbg !44
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !22, metadata !32), !dbg !45
  %cmp672 = icmp ult i32 %shr, 2, !dbg !46
  br i1 %cmp672, label %for.end41, label %for.body8, !dbg !49

for.body8:                                        ; preds = %for.body, %for.inc39
  %count.076 = phi i32 [ %count.1, %for.inc39 ], [ 0, %for.body ]
  %i.073 = phi i32 [ %inc40, %for.inc39 ], [ 2, %for.body ]
  %div = lshr i32 %i.073, 5, !dbg !50
  %div10 = zext i32 %div to i64, !dbg !50
  %arrayidx = getelementptr inbounds i32* %0, i64 %div10, !dbg !50
  %1 = load i32* %arrayidx, align 4, !dbg !50, !tbaa !52
  %2 = and i32 %i.073, 31, !dbg !50
  %shl = shl i32 1, %2, !dbg !50
  %and = and i32 %1, %shl, !dbg !50
  %tobool12 = icmp eq i32 %and, 0, !dbg !56
  br i1 %tobool12, label %for.inc39, label %if.then13, !dbg !56

if.then13:                                        ; preds = %for.body8
  %inc = add i32 %count.076, 1, !dbg !57
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !27, metadata !32), !dbg !40
  %add14 = shl i32 %i.073, 1, !dbg !59
  tail call void @llvm.dbg.value(metadata i32 %add14, i64 0, metadata !26, metadata !32), !dbg !61
  %cmp1670 = icmp ugt i32 %add14, %shr, !dbg !62
  br i1 %cmp1670, label %for.inc39, label %for.body18, !dbg !64

for.body18:                                       ; preds = %if.then13, %for.inc
  %j.071 = phi i32 [ %add37, %for.inc ], [ %add14, %if.then13 ]
  %div69 = lshr i32 %j.071, 5, !dbg !65
  %div20 = zext i32 %div69 to i64, !dbg !65
  %arrayidx21 = getelementptr inbounds i32* %0, i64 %div20, !dbg !65
  %3 = load i32* %arrayidx21, align 4, !dbg !65, !tbaa !52
  %4 = and i32 %j.071, 31, !dbg !65
  %shl25 = shl i32 1, %4, !dbg !65
  %and26 = and i32 %3, %shl25, !dbg !65
  %tobool27 = icmp eq i32 %and26, 0, !dbg !67
  br i1 %tobool27, label %for.inc, label %if.then28, !dbg !67

if.then28:                                        ; preds = %for.body18
  %xor = xor i32 %3, %shl25, !dbg !68
  store i32 %xor, i32* %arrayidx21, align 4, !dbg !68, !tbaa !52
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body18, %if.then28
  %add37 = add i32 %j.071, %i.073, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !61
  %cmp16 = icmp ugt i32 %add37, %shr, !dbg !62
  br i1 %cmp16, label %for.inc39, label %for.body18, !dbg !64

for.inc39:                                        ; preds = %for.inc, %if.then13, %for.body8
  %count.1 = phi i32 [ %count.076, %for.body8 ], [ %inc, %if.then13 ], [ %inc, %for.inc ]
  %inc40 = add i32 %i.073, 1, !dbg !71
  tail call void @llvm.dbg.value(metadata i32 %inc40, i64 0, metadata !22, metadata !32), !dbg !45
  %cmp6 = icmp ugt i32 %inc40, %shr, !dbg !46
  br i1 %cmp6, label %for.end41, label %for.body8, !dbg !49

for.end41:                                        ; preds = %for.inc39, %for.body
  %count.0.lcssa = phi i32 [ 0, %for.body ], [ %count.1, %for.inc39 ]
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %shr, i32 %count.0.lcssa) #2, !dbg !72
  %inc44 = add nuw nsw i32 %m.077, 1, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 %inc44, i64 0, metadata !19, metadata !32), !dbg !74
  %exitcond = icmp eq i32 %inc44, 3, !dbg !75
  br i1 %exitcond, label %for.end45, label %for.body, !dbg !75

for.end45:                                        ; preds = %for.end41
  tail call void @free(i8* %call) #2, !dbg !76
  br label %return, !dbg !77

return:                                           ; preds = %entry, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %entry ]
  ret i32 %retval.0, !dbg !78
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c] [DW_LANG_C99]
!1 = !{!"nsieve-bits.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bits]
!5 = !{!"0x16\00bits\0011\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [bits] [line 11, size 0, align 0, offset 0] [from unsigned int]
!6 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!7 = !{!8}
!8 = !{!"0x2e\00main\00main\00\0018\000\001\000\000\00256\001\0019", !1, !9, !10, null, i32 (i32, i8**)* @main, null, null, !16} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!12, !12, !13}
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = !{!17, !18, !19, !20, !21, !22, !26, !27, !28}
!17 = !{!"0x101\00argc\0016777234\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!18 = !{!"0x101\00argv\0033554450\000", !8, !9, !13} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!19 = !{!"0x100\00m\0020\000", !8, !9, !6}        ; [ DW_TAG_auto_variable ] [m] [line 20]
!20 = !{!"0x100\00sz\0020\000", !8, !9, !6}       ; [ DW_TAG_auto_variable ] [sz] [line 20]
!21 = !{!"0x100\00primes\0021\000", !8, !9, !4}   ; [ DW_TAG_auto_variable ] [primes] [line 21]
!22 = !{!"0x100\00i\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [i] [line 24]
!23 = !{!"0xb\0023\0028\003", !1, !24}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!24 = !{!"0xb\0023\003\002", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!25 = !{!"0xb\0023\003\001", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!26 = !{!"0x100\00j\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [j] [line 24]
!27 = !{!"0x100\00count\0024\000", !23, !9, !6}   ; [ DW_TAG_auto_variable ] [count] [line 24]
!28 = !{!"0x100\00n\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [n] [line 24]
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 2}
!31 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!32 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!33 = !MDLocation(line: 18, column: 14, scope: !8)
!34 = !MDLocation(line: 18, column: 27, scope: !8)
!35 = !MDLocation(line: 20, column: 19, scope: !8)
!36 = !MDLocation(line: 21, column: 26, scope: !8)
!37 = !MDLocation(line: 21, column: 18, scope: !8)
!38 = !MDLocation(line: 21, column: 9, scope: !8)
!39 = !MDLocation(line: 22, column: 7, scope: !8)
!40 = !MDLocation(line: 24, column: 24, scope: !23)
!41 = !MDLocation(line: 24, column: 39, scope: !23)
!42 = !MDLocation(line: 24, column: 35, scope: !23)
!43 = !MDLocation(line: 25, column: 26, scope: !23)
!44 = !MDLocation(line: 25, column: 5, scope: !23)
!45 = !MDLocation(line: 24, column: 18, scope: !23)
!46 = !MDLocation(line: 26, column: 17, scope: !47)
!47 = !{!"0xb\0026\005\005", !1, !48}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!48 = !{!"0xb\0026\005\004", !1, !23}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!49 = !MDLocation(line: 26, column: 5, scope: !48)
!50 = !MDLocation(line: 27, column: 11, scope: !51)
!51 = !{!"0xb\0027\0011\006", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !MDLocation(line: 27, column: 11, scope: !47)
!57 = !MDLocation(line: 28, column: 2, scope: !58)
!58 = !{!"0xb\0027\0029\007", !1, !51}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!59 = !MDLocation(line: 29, column: 11, scope: !60)
!60 = !{!"0xb\0029\002\008", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!61 = !MDLocation(line: 24, column: 21, scope: !23)
!62 = !MDLocation(line: 29, column: 18, scope: !63)
!63 = !{!"0xb\0029\002\009", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!64 = !MDLocation(line: 29, column: 2, scope: !60)
!65 = !MDLocation(line: 30, column: 8, scope: !66)
!66 = !{!"0xb\0030\008\0010", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!67 = !MDLocation(line: 30, column: 8, scope: !63)
!68 = !MDLocation(line: 30, column: 26, scope: !69)
!69 = !{!"0xb\001", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!70 = !MDLocation(line: 29, column: 26, scope: !63)
!71 = !MDLocation(line: 26, column: 25, scope: !47)
!72 = !MDLocation(line: 32, column: 5, scope: !23)
!73 = !MDLocation(line: 23, column: 23, scope: !24)
!74 = !MDLocation(line: 20, column: 16, scope: !8)
!75 = !MDLocation(line: 23, column: 3, scope: !25)
!76 = !MDLocation(line: 34, column: 3, scope: !8)
!77 = !MDLocation(line: 35, column: 3, scope: !8)
!78 = !MDLocation(line: 36, column: 1, scope: !8)
