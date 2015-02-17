; ModuleID = 'nestedloop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !37), !dbg !38
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !37), !dbg !39
  %cmp = icmp eq i32 %argc, 2, !dbg !40
  br i1 %cmp, label %cond.end, label %for.cond2.preheader.lr.ph, !dbg !41

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !42
  %0 = load i8** %arrayidx, align 8, !dbg !42, !tbaa !44
  %call = tail call i32 @atoi(i8* %0) #4, !dbg !48
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !17, metadata !37), !dbg !49
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !37), !dbg !50
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !37), !dbg !51
  %cmp165 = icmp sgt i32 %call, 0, !dbg !52
  br i1 %cmp165, label %for.cond2.preheader.lr.ph, label %for.end32, !dbg !55

for.cond2.preheader.lr.ph:                        ; preds = %entry, %cond.end
  %cond74 = phi i32 [ %call, %cond.end ], [ 46, %entry ]
  %cmp361 = icmp sgt i32 %cond74, 0, !dbg !56
  %cmp657 = icmp sgt i32 %cond74, 0, !dbg !59
  %cmp953 = icmp sgt i32 %cond74, 0, !dbg !62
  %cmp1249 = icmp sgt i32 %cond74, 0, !dbg !65
  %cmp1546 = icmp sgt i32 %cond74, 0, !dbg !68
  %1 = add i32 %cond74, -1, !dbg !55
  br label %for.cond2.preheader, !dbg !55

for.cond2.preheader:                              ; preds = %for.inc30, %for.cond2.preheader.lr.ph
  %x.067 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %x.1.lcssa, %for.inc30 ]
  %a.066 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %inc31, %for.inc30 ]
  br i1 %cmp361, label %for.cond5.preheader, label %for.inc30, !dbg !71

for.cond5.preheader:                              ; preds = %for.cond2.preheader, %for.inc27
  %x.163 = phi i32 [ %x.2.lcssa, %for.inc27 ], [ %x.067, %for.cond2.preheader ]
  %b.062 = phi i32 [ %inc28, %for.inc27 ], [ 0, %for.cond2.preheader ]
  br i1 %cmp657, label %for.cond8.preheader, label %for.inc27, !dbg !72

for.cond8.preheader:                              ; preds = %for.cond5.preheader, %for.inc24
  %x.259 = phi i32 [ %x.3.lcssa, %for.inc24 ], [ %x.163, %for.cond5.preheader ]
  %c.058 = phi i32 [ %inc25, %for.inc24 ], [ 0, %for.cond5.preheader ]
  br i1 %cmp953, label %for.cond11.preheader, label %for.inc24, !dbg !73

for.cond11.preheader:                             ; preds = %for.cond8.preheader, %for.inc21
  %x.355 = phi i32 [ %x.4.lcssa, %for.inc21 ], [ %x.259, %for.cond8.preheader ]
  %d.054 = phi i32 [ %inc22, %for.inc21 ], [ 0, %for.cond8.preheader ]
  br i1 %cmp1249, label %for.cond14.preheader, label %for.inc21, !dbg !74

for.cond14.preheader:                             ; preds = %for.cond11.preheader, %for.cond14.preheader
  %x.451 = phi i32 [ %.x.451, %for.cond14.preheader ], [ %x.355, %for.cond11.preheader ]
  %e.050 = phi i32 [ %inc19, %for.cond14.preheader ], [ 0, %for.cond11.preheader ]
  %2 = select i1 %cmp1546, i32 %cond74, i32 0, !dbg !75
  %.x.451 = add i32 %x.451, %2, !dbg !75
  %inc19 = add nuw nsw i32 %e.050, 1, !dbg !76
  tail call void @llvm.dbg.value(metadata i32 %inc19, i64 0, metadata !22, metadata !37), !dbg !77
  %exitcond = icmp eq i32 %e.050, %1, !dbg !74
  br i1 %exitcond, label %for.inc21, label %for.cond14.preheader, !dbg !74

for.inc21:                                        ; preds = %for.cond14.preheader, %for.cond11.preheader
  %x.4.lcssa = phi i32 [ %x.355, %for.cond11.preheader ], [ %.x.451, %for.cond14.preheader ]
  %inc22 = add nuw nsw i32 %d.054, 1, !dbg !78
  tail call void @llvm.dbg.value(metadata i32 %inc22, i64 0, metadata !21, metadata !37), !dbg !79
  %exitcond69 = icmp eq i32 %d.054, %1, !dbg !73
  br i1 %exitcond69, label %for.inc24, label %for.cond11.preheader, !dbg !73

for.inc24:                                        ; preds = %for.inc21, %for.cond8.preheader
  %x.3.lcssa = phi i32 [ %x.259, %for.cond8.preheader ], [ %x.4.lcssa, %for.inc21 ]
  %inc25 = add nuw nsw i32 %c.058, 1, !dbg !80
  tail call void @llvm.dbg.value(metadata i32 %inc25, i64 0, metadata !20, metadata !37), !dbg !81
  %exitcond70 = icmp eq i32 %c.058, %1, !dbg !72
  br i1 %exitcond70, label %for.inc27, label %for.cond8.preheader, !dbg !72

for.inc27:                                        ; preds = %for.inc24, %for.cond5.preheader
  %x.2.lcssa = phi i32 [ %x.163, %for.cond5.preheader ], [ %x.3.lcssa, %for.inc24 ]
  %inc28 = add nuw nsw i32 %b.062, 1, !dbg !82
  tail call void @llvm.dbg.value(metadata i32 %inc28, i64 0, metadata !19, metadata !37), !dbg !83
  %exitcond71 = icmp eq i32 %b.062, %1, !dbg !71
  br i1 %exitcond71, label %for.inc30, label %for.cond5.preheader, !dbg !71

for.inc30:                                        ; preds = %for.inc27, %for.cond2.preheader
  %x.1.lcssa = phi i32 [ %x.067, %for.cond2.preheader ], [ %x.2.lcssa, %for.inc27 ]
  %inc31 = add nuw nsw i32 %a.066, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata i32 %inc31, i64 0, metadata !18, metadata !37), !dbg !51
  %exitcond72 = icmp eq i32 %a.066, %1, !dbg !55
  br i1 %exitcond72, label %for.end32, label %for.cond2.preheader, !dbg !55

for.end32:                                        ; preds = %for.inc30, %cond.end
  %x.0.lcssa = phi i32 [ 0, %cond.end ], [ %x.1.lcssa, %for.inc30 ]
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %x.0.lcssa) #5, !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !33, metadata !37), !dbg !87
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  ret i32 %conv, !dbg !90
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!34, !35}
!llvm.ident = !{!36}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c] [DW_LANG_C99]
!1 = !{!"nestedloop.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !25}
!10 = !{!"0x2e\00main\00main\00\0010\000\001\000\000\00256\001\0010", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 10] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !5}
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24}
!15 = !{!"0x101\00argc\0016777226\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 10]
!16 = !{!"0x101\00argv\0033554442\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 10]
!17 = !{!"0x100\00n\0016\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [n] [line 16]
!18 = !{!"0x100\00a\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [a] [line 17]
!19 = !{!"0x100\00b\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [b] [line 17]
!20 = !{!"0x100\00c\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [c] [line 17]
!21 = !{!"0x100\00d\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [d] [line 17]
!22 = !{!"0x100\00e\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [e] [line 17]
!23 = !{!"0x100\00f\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [f] [line 17]
!24 = !{!"0x100\00x\0017\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [x] [line 17]
!25 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !26, !27, !28, null, i32 (i8*)* @atoi, null, null, !32} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!26 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!27 = !{!"0x29", !26}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!28 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !29, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = !{!4, !30}
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!32 = !{!33}
!33 = !{!"0x101\00__nptr\0016777494\000", !25, !27, !30} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!34 = !{i32 2, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 2}
!36 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!37 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!38 = !MDLocation(line: 10, column: 10, scope: !10)
!39 = !MDLocation(line: 10, column: 22, scope: !10)
!40 = !MDLocation(line: 16, column: 15, scope: !10)
!41 = !MDLocation(line: 16, column: 14, scope: !10)
!42 = !MDLocation(line: 16, column: 33, scope: !43)
!43 = !{!"0xb\001", !1, !10}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!44 = !{!45, !45, i64 0}
!45 = !{!"any pointer", !46, i64 0}
!46 = !{!"omnipotent char", !47, i64 0}
!47 = !{!"Simple C/C++ TBAA"}
!48 = !MDLocation(line: 16, column: 28, scope: !10)
!49 = !MDLocation(line: 16, column: 9, scope: !10)
!50 = !MDLocation(line: 17, column: 27, scope: !10)
!51 = !MDLocation(line: 17, column: 9, scope: !10)
!52 = !MDLocation(line: 19, column: 15, scope: !53)
!53 = !{!"0xb\0019\005\001", !1, !54}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!54 = !{!"0xb\0019\005\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!55 = !MDLocation(line: 19, column: 5, scope: !54)
!56 = !MDLocation(line: 20, column: 12, scope: !57)
!57 = !{!"0xb\0020\002\003", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!58 = !{!"0xb\0020\002\002", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!59 = !MDLocation(line: 21, column: 16, scope: !60)
!60 = !{!"0xb\0021\006\005", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!61 = !{!"0xb\0021\006\004", !1, !57}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!62 = !MDLocation(line: 22, column: 13, scope: !63)
!63 = !{!"0xb\0022\003\007", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!64 = !{!"0xb\0022\003\006", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!65 = !MDLocation(line: 23, column: 17, scope: !66)
!66 = !{!"0xb\0023\007\009", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!67 = !{!"0xb\0023\007\008", !1, !63}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!68 = !MDLocation(line: 24, column: 14, scope: !69)
!69 = !{!"0xb\0024\004\0011", !1, !70}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!70 = !{!"0xb\0024\004\0010", !1, !66}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nestedloop.c]
!71 = !MDLocation(line: 20, column: 2, scope: !58)
!72 = !MDLocation(line: 21, column: 6, scope: !61)
!73 = !MDLocation(line: 22, column: 3, scope: !64)
!74 = !MDLocation(line: 23, column: 7, scope: !67)
!75 = !MDLocation(line: 24, column: 4, scope: !70)
!76 = !MDLocation(line: 23, column: 22, scope: !66)
!77 = !MDLocation(line: 17, column: 21, scope: !10)
!78 = !MDLocation(line: 22, column: 18, scope: !63)
!79 = !MDLocation(line: 17, column: 18, scope: !10)
!80 = !MDLocation(line: 21, column: 21, scope: !60)
!81 = !MDLocation(line: 17, column: 15, scope: !10)
!82 = !MDLocation(line: 20, column: 17, scope: !57)
!83 = !MDLocation(line: 17, column: 12, scope: !10)
!84 = !MDLocation(line: 19, column: 20, scope: !53)
!85 = !MDLocation(line: 27, column: 5, scope: !10)
!86 = !MDLocation(line: 28, column: 5, scope: !10)
!87 = !MDLocation(line: 278, column: 1, scope: !25)
!88 = !MDLocation(line: 280, column: 16, scope: !25)
!89 = !MDLocation(line: 280, column: 10, scope: !25)
!90 = !MDLocation(line: 280, column: 3, scope: !25)
