; ModuleID = 'strcat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"calloc strbuf\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"realloc strbuf\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !35), !dbg !36
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !35), !dbg !37
  %cmp = icmp eq i32 %argc, 2, !dbg !38
  br i1 %cmp, label %cond.true, label %cond.end, !dbg !39

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !40
  %0 = load i8** %arrayidx, align 8, !dbg !40, !tbaa !42
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !46, metadata !35) #5, !dbg !48
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #5, !dbg !49
  %conv.i = trunc i64 %call.i to i32, !dbg !50
  br label %cond.end, !dbg !39

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %conv.i, %cond.true ], [ 10000000, %entry ], !dbg !39
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !17, metadata !35), !dbg !51
  tail call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !19, metadata !35), !dbg !52
  %call1 = tail call noalias i8* @calloc(i64 1, i64 32) #5, !dbg !53
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !20, metadata !35), !dbg !54
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !21, metadata !35), !dbg !55
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !22, metadata !35), !dbg !56
  %tobool = icmp eq i8* %call1, null, !dbg !57
  br i1 %tobool, label %if.then, label %for.cond.preheader, !dbg !57

for.cond.preheader:                               ; preds = %cond.end
  %cmp237 = icmp sgt i32 %cond, 0, !dbg !58
  br i1 %cmp237, label %for.body.preheader, label %for.end, !dbg !61

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body, !dbg !62

if.then:                                          ; preds = %cond.end
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0)) #6, !dbg !65
  tail call void @exit(i32 1) #7, !dbg !69
  unreachable, !dbg !69

for.body:                                         ; preds = %for.body.preheader, %if.end15
  %i.041 = phi i32 [ %inc, %if.end15 ], [ 0, %for.body.preheader ]
  %strend.040 = phi i8* [ %add.ptr18, %if.end15 ], [ %call1, %for.body.preheader ]
  %strbuf.039 = phi i8* [ %strbuf.1, %if.end15 ], [ %call1, %for.body.preheader ]
  %buflen.038 = phi i32 [ %buflen.1, %if.end15 ], [ 32, %for.body.preheader ]
  %idx.ext = sext i32 %buflen.038 to i64, !dbg !62
  %add.ptr = getelementptr inbounds i8* %strbuf.039, i64 %idx.ext, !dbg !62
  %sub.ptr.lhs.cast = ptrtoint i8* %add.ptr to i64, !dbg !70
  %sub.ptr.rhs.cast = ptrtoint i8* %strend.040 to i64, !dbg !70
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !70
  %cmp5 = icmp slt i64 %sub.ptr.sub, 7, !dbg !71
  br i1 %cmp5, label %if.then7, label %if.end15, !dbg !72

if.then7:                                         ; preds = %for.body
  %mul = shl nsw i32 %buflen.038, 1, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !19, metadata !35), !dbg !52
  %conv8 = sext i32 %mul to i64, !dbg !75
  %call9 = tail call i8* @realloc(i8* %strbuf.039, i64 %conv8) #5, !dbg !76
  tail call void @llvm.dbg.value(metadata i8* %call9, i64 0, metadata !20, metadata !35), !dbg !54
  %tobool10 = icmp eq i8* %call9, null, !dbg !77
  br i1 %tobool10, label %if.then11, label %if.end12, !dbg !77

if.then11:                                        ; preds = %if.then7
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0)) #6, !dbg !78
  tail call void @exit(i32 1) #7, !dbg !82
  unreachable, !dbg !82

if.end12:                                         ; preds = %if.then7
  %call13 = tail call i64 @strlen(i8* %call9) #8, !dbg !83
  %add.ptr14 = getelementptr inbounds i8* %call9, i64 %call13, !dbg !84
  tail call void @llvm.dbg.value(metadata i8* %add.ptr14, i64 0, metadata !21, metadata !35), !dbg !55
  br label %if.end15, !dbg !85

if.end15:                                         ; preds = %if.end12, %for.body
  %buflen.1 = phi i32 [ %mul, %if.end12 ], [ %buflen.038, %for.body ]
  %strbuf.1 = phi i8* [ %call9, %if.end12 ], [ %strbuf.039, %for.body ]
  %strend.1 = phi i8* [ %add.ptr14, %if.end12 ], [ %strend.040, %for.body ]
  %strlen = tail call i64 @strlen(i8* %strend.1), !dbg !86
  %endptr = getelementptr i8* %strend.1, i64 %strlen, !dbg !86
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !86
  %add.ptr18 = getelementptr inbounds i8* %strend.1, i64 6, !dbg !87
  tail call void @llvm.dbg.value(metadata i8* %add.ptr18, i64 0, metadata !21, metadata !35), !dbg !55
  %inc = add nuw nsw i32 %i.041, 1, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !18, metadata !35), !dbg !89
  %cmp2 = icmp slt i32 %inc, %cond, !dbg !58
  br i1 %cmp2, label %for.body, label %for.end.loopexit, !dbg !61

for.end.loopexit:                                 ; preds = %if.end15
  %strbuf.1.lcssa = phi i8* [ %strbuf.1, %if.end15 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader
  %strbuf.0.lcssa = phi i8* [ %call1, %for.cond.preheader ], [ %strbuf.1.lcssa, %for.end.loopexit ]
  %call19 = tail call i64 @strlen(i8* %strbuf.0.lcssa) #8, !dbg !90
  %conv20 = trunc i64 %call19 to i32, !dbg !91
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv20) #5, !dbg !92
  tail call void @free(i8* %strbuf.0.lcssa) #5, !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c] [DW_LANG_C99]
!1 = !{!"strcat.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !23}
!10 = !{!"0x2e\00main\00main\00\0013\000\001\000\000\00256\001\0013", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 13] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !5}
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22}
!15 = !{!"0x101\00argc\0016777229\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 13]
!16 = !{!"0x101\00argv\0033554445\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 13]
!17 = !{!"0x100\00n\0014\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [n] [line 14]
!18 = !{!"0x100\00i\0015\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [i] [line 15]
!19 = !{!"0x100\00buflen\0015\000", !10, !11, !4} ; [ DW_TAG_auto_variable ] [buflen] [line 15]
!20 = !{!"0x100\00strbuf\0016\000", !10, !11, !6} ; [ DW_TAG_auto_variable ] [strbuf] [line 16]
!21 = !{!"0x100\00strend\0017\000", !10, !11, !6} ; [ DW_TAG_auto_variable ] [strend] [line 17]
!22 = !{!"0x100\00stufflen\0018\000", !10, !11, !4} ; [ DW_TAG_auto_variable ] [stufflen] [line 18]
!23 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !24, !25, !26, null, null, null, null, !30} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!24 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!25 = !{!"0x29", !24}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!4, !28}
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = !{!31}
!31 = !{!"0x101\00__nptr\0016777494\000", !23, !25, !28} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 2}
!34 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!35 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!36 = !MDLocation(line: 13, column: 10, scope: !10)
!37 = !MDLocation(line: 13, column: 22, scope: !10)
!38 = !MDLocation(line: 14, column: 15, scope: !10)
!39 = !MDLocation(line: 14, column: 14, scope: !10)
!40 = !MDLocation(line: 14, column: 33, scope: !41)
!41 = !{!"0xb\001", !1, !10}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !{!"0x101\00__nptr\0016777494\000", !23, !25, !28, !47} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!47 = !MDLocation(line: 14, column: 28, scope: !10)
!48 = !MDLocation(line: 278, column: 1, scope: !23, inlinedAt: !47)
!49 = !MDLocation(line: 280, column: 16, scope: !23, inlinedAt: !47)
!50 = !MDLocation(line: 280, column: 10, scope: !23, inlinedAt: !47)
!51 = !MDLocation(line: 14, column: 9, scope: !10)
!52 = !MDLocation(line: 15, column: 12, scope: !10)
!53 = !MDLocation(line: 16, column: 20, scope: !10)
!54 = !MDLocation(line: 16, column: 11, scope: !10)
!55 = !MDLocation(line: 17, column: 11, scope: !10)
!56 = !MDLocation(line: 18, column: 9, scope: !10)
!57 = !MDLocation(line: 20, column: 9, scope: !10)
!58 = !MDLocation(line: 21, column: 15, scope: !59)
!59 = !{!"0xb\0021\005\003", !1, !60}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!60 = !{!"0xb\0021\005\002", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!61 = !MDLocation(line: 21, column: 5, scope: !60)
!62 = !MDLocation(line: 22, column: 8, scope: !63)
!63 = !{!"0xb\0022\006\005", !1, !64}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!64 = !{!"0xb\0021\0025\004", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!65 = !MDLocation(line: 20, column: 20, scope: !66)
!66 = !{!"0xb\001", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!67 = !{!"0xb\0020\0018\001", !1, !68}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!68 = !{!"0xb\0020\009\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!69 = !MDLocation(line: 20, column: 45, scope: !67)
!70 = !MDLocation(line: 22, column: 7, scope: !63)
!71 = !MDLocation(line: 22, column: 6, scope: !63)
!72 = !MDLocation(line: 22, column: 6, scope: !64)
!73 = !MDLocation(line: 23, column: 15, scope: !74)
!74 = !{!"0xb\0022\0047\006", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!75 = !MDLocation(line: 24, column: 31, scope: !74)
!76 = !MDLocation(line: 24, column: 15, scope: !74)
!77 = !MDLocation(line: 25, column: 10, scope: !74)
!78 = !MDLocation(line: 25, column: 21, scope: !79)
!79 = !{!"0xb\001", !1, !80}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!80 = !{!"0xb\0025\0019\008", !1, !81}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!81 = !{!"0xb\0025\0010\007", !1, !74}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!82 = !MDLocation(line: 25, column: 47, scope: !80)
!83 = !MDLocation(line: 26, column: 24, scope: !74)
!84 = !MDLocation(line: 26, column: 15, scope: !74)
!85 = !MDLocation(line: 27, column: 2, scope: !74)
!86 = !MDLocation(line: 29, column: 2, scope: !64)
!87 = !MDLocation(line: 30, column: 2, scope: !64)
!88 = !MDLocation(line: 21, column: 20, scope: !59)
!89 = !MDLocation(line: 15, column: 9, scope: !10)
!90 = !MDLocation(line: 32, column: 25, scope: !10)
!91 = !MDLocation(line: 32, column: 20, scope: !10)
!92 = !MDLocation(line: 32, column: 5, scope: !10)
!93 = !MDLocation(line: 33, column: 5, scope: !10)
!94 = !MDLocation(line: 35, column: 5, scope: !10)
