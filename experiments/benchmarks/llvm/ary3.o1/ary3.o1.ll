; ModuleID = 'ary3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !16, metadata !35), !dbg !36
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !17, metadata !35), !dbg !37
  %cmp = icmp eq i32 %argc, 2, !dbg !38
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !39

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !40
  %0 = load i8** %arrayidx, align 8, !dbg !40, !tbaa !42
  %call = tail call i32 @atoi(i8* %0) #4, !dbg !46
  br label %cond.end, !dbg !39

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1500000, %entry ], !dbg !39
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !18, metadata !35), !dbg !47
  %conv = sext i32 %cond to i64, !dbg !48
  %call1 = tail call noalias i8* @calloc(i64 %conv, i64 4) #5, !dbg !49
  %1 = bitcast i8* %call1 to i32*, !dbg !50
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !21, metadata !35), !dbg !51
  %call3 = tail call noalias i8* @calloc(i64 %conv, i64 4) #5, !dbg !52
  %2 = bitcast i8* %call3 to i32*, !dbg !53
  tail call void @llvm.dbg.value(metadata i32* %2, i64 0, metadata !22, metadata !35), !dbg !54
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !35), !dbg !55
  %cmp451 = icmp sgt i32 %cond, 0, !dbg !56
  br i1 %cmp451, label %for.body.lr.ph, label %for.cond7.preheader, !dbg !59

for.body.lr.ph:                                   ; preds = %cond.end
  %3 = add i32 %cond, -1, !dbg !59
  br label %for.body, !dbg !59

for.cond7.preheader:                              ; preds = %for.body, %cond.end
  %cmp1248 = icmp sgt i32 %cond, 0, !dbg !60
  %4 = sext i32 %cond to i64
  br label %for.cond11.preheader, !dbg !68

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv53 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next54, %for.body ]
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1, !dbg !59
  %arrayidx6 = getelementptr inbounds i32* %1, i64 %indvars.iv53, !dbg !69
  %5 = trunc i64 %indvars.iv.next54 to i32, !dbg !69
  store i32 %5, i32* %arrayidx6, align 4, !dbg !69, !tbaa !71
  %lftr.wideiv = trunc i64 %indvars.iv53 to i32, !dbg !59
  %exitcond55 = icmp eq i32 %lftr.wideiv, %3, !dbg !59
  br i1 %exitcond55, label %for.cond7.preheader, label %for.body, !dbg !59

for.cond11.preheader:                             ; preds = %for.inc22, %for.cond7.preheader
  %k.050 = phi i32 [ 0, %for.cond7.preheader ], [ %inc23, %for.inc22 ]
  br i1 %cmp1248, label %for.body14, label %for.inc22, !dbg !73

for.body14:                                       ; preds = %for.cond11.preheader, %for.body14
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body14 ], [ %4, %for.cond11.preheader ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !73
  %arrayidx16 = getelementptr inbounds i32* %1, i64 %indvars.iv.next, !dbg !74
  %6 = load i32* %arrayidx16, align 4, !dbg !74, !tbaa !71
  %arrayidx18 = getelementptr inbounds i32* %2, i64 %indvars.iv.next, !dbg !76
  %7 = load i32* %arrayidx18, align 4, !dbg !76, !tbaa !71
  %add19 = add nsw i32 %7, %6, !dbg !76
  store i32 %add19, i32* %arrayidx18, align 4, !dbg !76, !tbaa !71
  %cmp12 = icmp sgt i64 %indvars.iv, 1, !dbg !60
  br i1 %cmp12, label %for.body14, label %for.inc22, !dbg !73

for.inc22:                                        ; preds = %for.body14, %for.cond11.preheader
  %inc23 = add nuw nsw i32 %k.050, 1, !dbg !77
  tail call void @llvm.dbg.value(metadata i32 %inc23, i64 0, metadata !20, metadata !35), !dbg !78
  %exitcond = icmp eq i32 %inc23, 1000, !dbg !68
  br i1 %exitcond, label %for.end24, label %for.cond11.preheader, !dbg !68

for.end24:                                        ; preds = %for.inc22
  %8 = load i32* %2, align 4, !dbg !79, !tbaa !71
  %sub26 = add nsw i32 %cond, -1, !dbg !80
  %idxprom27 = sext i32 %sub26 to i64, !dbg !81
  %arrayidx28 = getelementptr inbounds i32* %2, i64 %idxprom27, !dbg !81
  %9 = load i32* %arrayidx28, align 4, !dbg !81, !tbaa !71
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %8, i32 %9) #5, !dbg !82
  tail call void @free(i8* %call1) #5, !dbg !83
  tail call void @free(i8* %call3) #5, !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !31, metadata !35), !dbg !86
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  ret i32 %conv, !dbg !89
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

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
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !10, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c] [DW_LANG_C99]
!1 = !{!"ary3.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6, !9}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!8 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!11, !23}
!11 = !{!"0x2e\00main\00main\00\0017\000\001\000\000\00256\001\0017", !1, !12, !13, null, i32 (i32, i8**)* @main, null, null, !15} ; [ DW_TAG_subprogram ] [line 17] [def] [main]
!12 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!5, !5, !6}
!15 = !{!16, !17, !18, !19, !20, !21, !22}
!16 = !{!"0x101\00argc\0016777233\000", !11, !12, !5} ; [ DW_TAG_arg_variable ] [argc] [line 17]
!17 = !{!"0x101\00argv\0033554449\000", !11, !12, !6} ; [ DW_TAG_arg_variable ] [argv] [line 17]
!18 = !{!"0x100\00n\0023\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [n] [line 23]
!19 = !{!"0x100\00i\0024\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [i] [line 24]
!20 = !{!"0x100\00k\0024\000", !11, !12, !5}      ; [ DW_TAG_auto_variable ] [k] [line 24]
!21 = !{!"0x100\00x\0024\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [x] [line 24]
!22 = !{!"0x100\00y\0024\000", !11, !12, !4}      ; [ DW_TAG_auto_variable ] [y] [line 24]
!23 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !24, !25, !26, null, i32 (i8*)* @atoi, null, null, !30} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!24 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!25 = !{!"0x29", !24}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!5, !28}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0x26\00\000\000\000\000\000", null, null, !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = !{!31}
!31 = !{!"0x101\00__nptr\0016777494\000", !23, !25, !28} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!36 = !MDLocation(line: 17, column: 14, scope: !11)
!37 = !MDLocation(line: 17, column: 26, scope: !11)
!38 = !MDLocation(line: 23, column: 13, scope: !11)
!39 = !MDLocation(line: 23, column: 12, scope: !11)
!40 = !MDLocation(line: 23, column: 31, scope: !41)
!41 = !{!"0xb\001", !1, !11}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !MDLocation(line: 23, column: 26, scope: !11)
!47 = !MDLocation(line: 23, column: 7, scope: !11)
!48 = !MDLocation(line: 26, column: 22, scope: !11)
!49 = !MDLocation(line: 26, column: 15, scope: !11)
!50 = !MDLocation(line: 26, column: 7, scope: !11)
!51 = !MDLocation(line: 24, column: 14, scope: !11)
!52 = !MDLocation(line: 27, column: 15, scope: !11)
!53 = !MDLocation(line: 27, column: 7, scope: !11)
!54 = !MDLocation(line: 24, column: 18, scope: !11)
!55 = !MDLocation(line: 24, column: 7, scope: !11)
!56 = !MDLocation(line: 29, column: 15, scope: !57)
!57 = !{!"0xb\0029\003\001", !1, !58}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!58 = !{!"0xb\0029\003\000", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!59 = !MDLocation(line: 29, column: 3, scope: !58)
!60 = !MDLocation(line: 34, column: 19, scope: !61)
!61 = !{!"0xb\002", !1, !62}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!62 = !{!"0xb\001", !1, !63}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!63 = !{!"0xb\0034\005\007", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!64 = !{!"0xb\0034\005\006", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!65 = !{!"0xb\0033\0026\005", !1, !66}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!66 = !{!"0xb\0033\003\004", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!67 = !{!"0xb\0033\003\003", !1, !11}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!68 = !MDLocation(line: 33, column: 3, scope: !67)
!69 = !MDLocation(line: 30, column: 5, scope: !70)
!70 = !{!"0xb\0029\0027\002", !1, !57}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!71 = !{!72, !72, i64 0}
!72 = !{!"int", !44, i64 0}
!73 = !MDLocation(line: 34, column: 5, scope: !64)
!74 = !MDLocation(line: 35, column: 15, scope: !75)
!75 = !{!"0xb\0034\0032\008", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/ary3.c]
!76 = !MDLocation(line: 35, column: 7, scope: !75)
!77 = !MDLocation(line: 33, column: 21, scope: !66)
!78 = !MDLocation(line: 24, column: 10, scope: !11)
!79 = !MDLocation(line: 39, column: 21, scope: !11)
!80 = !MDLocation(line: 39, column: 29, scope: !11)
!81 = !MDLocation(line: 39, column: 27, scope: !11)
!82 = !MDLocation(line: 39, column: 3, scope: !11)
!83 = !MDLocation(line: 41, column: 3, scope: !11)
!84 = !MDLocation(line: 42, column: 3, scope: !11)
!85 = !MDLocation(line: 44, column: 3, scope: !11)
!86 = !MDLocation(line: 278, column: 1, scope: !23)
!87 = !MDLocation(line: 280, column: 16, scope: !23)
!88 = !MDLocation(line: 280, column: 10, scope: !23)
!89 = !MDLocation(line: 280, column: 3, scope: !23)
