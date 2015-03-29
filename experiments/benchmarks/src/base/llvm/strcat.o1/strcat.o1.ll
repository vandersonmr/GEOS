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
  %call = tail call i32 @atoi(i8* %0) #7, !dbg !46
  br label %cond.end, !dbg !39

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 10000000, %entry ], !dbg !39
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !17, metadata !35), !dbg !47
  tail call void @llvm.dbg.value(metadata i32 32, i64 0, metadata !19, metadata !35), !dbg !48
  %call1 = tail call noalias i8* @calloc(i64 1, i64 32) #6, !dbg !49
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !20, metadata !35), !dbg !50
  tail call void @llvm.dbg.value(metadata i8* %call1, i64 0, metadata !21, metadata !35), !dbg !51
  tail call void @llvm.dbg.value(metadata i32 6, i64 0, metadata !22, metadata !35), !dbg !52
  %tobool = icmp eq i8* %call1, null, !dbg !53
  br i1 %tobool, label %if.then, label %for.cond.preheader, !dbg !53

for.cond.preheader:                               ; preds = %cond.end
  %cmp237 = icmp sgt i32 %cond, 0, !dbg !54
  br i1 %cmp237, label %for.body, label %for.end, !dbg !57

if.then:                                          ; preds = %cond.end
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0)) #8, !dbg !58
  tail call void @exit(i32 1) #9, !dbg !62
  unreachable, !dbg !62

for.body:                                         ; preds = %for.cond.preheader, %if.end15
  %i.041 = phi i32 [ %inc, %if.end15 ], [ 0, %for.cond.preheader ]
  %strend.040 = phi i8* [ %add.ptr18, %if.end15 ], [ %call1, %for.cond.preheader ]
  %strbuf.039 = phi i8* [ %strbuf.1, %if.end15 ], [ %call1, %for.cond.preheader ]
  %buflen.038 = phi i32 [ %buflen.1, %if.end15 ], [ 32, %for.cond.preheader ]
  %idx.ext = sext i32 %buflen.038 to i64, !dbg !63
  %add.ptr = getelementptr inbounds i8* %strbuf.039, i64 %idx.ext, !dbg !63
  %sub.ptr.lhs.cast = ptrtoint i8* %add.ptr to i64, !dbg !66
  %sub.ptr.rhs.cast = ptrtoint i8* %strend.040 to i64, !dbg !66
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !66
  %cmp5 = icmp slt i64 %sub.ptr.sub, 7, !dbg !67
  br i1 %cmp5, label %if.then7, label %if.end15, !dbg !68

if.then7:                                         ; preds = %for.body
  %mul = shl nsw i32 %buflen.038, 1, !dbg !69
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !19, metadata !35), !dbg !48
  %conv8 = sext i32 %mul to i64, !dbg !71
  %call9 = tail call i8* @realloc(i8* %strbuf.039, i64 %conv8) #6, !dbg !72
  tail call void @llvm.dbg.value(metadata i8* %call9, i64 0, metadata !20, metadata !35), !dbg !50
  %tobool10 = icmp eq i8* %call9, null, !dbg !73
  br i1 %tobool10, label %if.then11, label %if.end12, !dbg !73

if.then11:                                        ; preds = %if.then7
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0)) #8, !dbg !74
  tail call void @exit(i32 1) #9, !dbg !78
  unreachable, !dbg !78

if.end12:                                         ; preds = %if.then7
  %call13 = tail call i64 @strlen(i8* %call9) #7, !dbg !79
  %add.ptr14 = getelementptr inbounds i8* %call9, i64 %call13, !dbg !80
  tail call void @llvm.dbg.value(metadata i8* %add.ptr14, i64 0, metadata !21, metadata !35), !dbg !51
  br label %if.end15, !dbg !81

if.end15:                                         ; preds = %if.end12, %for.body
  %buflen.1 = phi i32 [ %mul, %if.end12 ], [ %buflen.038, %for.body ]
  %strbuf.1 = phi i8* [ %call9, %if.end12 ], [ %strbuf.039, %for.body ]
  %strend.1 = phi i8* [ %add.ptr14, %if.end12 ], [ %strend.040, %for.body ]
  %strlen = tail call i64 @strlen(i8* %strend.1), !dbg !82
  %endptr = getelementptr i8* %strend.1, i64 %strlen, !dbg !82
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %endptr, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !82
  %add.ptr18 = getelementptr inbounds i8* %strend.1, i64 6, !dbg !83
  tail call void @llvm.dbg.value(metadata i8* %add.ptr18, i64 0, metadata !21, metadata !35), !dbg !51
  %inc = add nuw nsw i32 %i.041, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !18, metadata !35), !dbg !85
  %cmp2 = icmp slt i32 %inc, %cond, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !57

for.end:                                          ; preds = %if.end15, %for.cond.preheader
  %strbuf.0.lcssa = phi i8* [ %call1, %for.cond.preheader ], [ %strbuf.1, %if.end15 ]
  %call19 = tail call i64 @strlen(i8* %strbuf.0.lcssa) #7, !dbg !86
  %conv20 = trunc i64 %call19 to i32, !dbg !87
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv20) #6, !dbg !88
  tail call void @free(i8* %strbuf.0.lcssa) #6, !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !31, metadata !35), !dbg !91
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  ret i32 %conv, !dbg !94
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { cold nounwind }
attributes #9 = { noreturn nounwind }

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
!23 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !24, !25, !26, null, i32 (i8*)* @atoi, null, null, !30} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!46 = !MDLocation(line: 14, column: 28, scope: !10)
!47 = !MDLocation(line: 14, column: 9, scope: !10)
!48 = !MDLocation(line: 15, column: 12, scope: !10)
!49 = !MDLocation(line: 16, column: 20, scope: !10)
!50 = !MDLocation(line: 16, column: 11, scope: !10)
!51 = !MDLocation(line: 17, column: 11, scope: !10)
!52 = !MDLocation(line: 18, column: 9, scope: !10)
!53 = !MDLocation(line: 20, column: 9, scope: !10)
!54 = !MDLocation(line: 21, column: 15, scope: !55)
!55 = !{!"0xb\0021\005\003", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!56 = !{!"0xb\0021\005\002", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!57 = !MDLocation(line: 21, column: 5, scope: !56)
!58 = !MDLocation(line: 20, column: 20, scope: !59)
!59 = !{!"0xb\001", !1, !60}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!60 = !{!"0xb\0020\0018\001", !1, !61}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!61 = !{!"0xb\0020\009\000", !1, !10}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!62 = !MDLocation(line: 20, column: 45, scope: !60)
!63 = !MDLocation(line: 22, column: 8, scope: !64)
!64 = !{!"0xb\0022\006\005", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!65 = !{!"0xb\0021\0025\004", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!66 = !MDLocation(line: 22, column: 7, scope: !64)
!67 = !MDLocation(line: 22, column: 6, scope: !64)
!68 = !MDLocation(line: 22, column: 6, scope: !65)
!69 = !MDLocation(line: 23, column: 15, scope: !70)
!70 = !{!"0xb\0022\0047\006", !1, !64}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!71 = !MDLocation(line: 24, column: 31, scope: !70)
!72 = !MDLocation(line: 24, column: 15, scope: !70)
!73 = !MDLocation(line: 25, column: 10, scope: !70)
!74 = !MDLocation(line: 25, column: 21, scope: !75)
!75 = !{!"0xb\001", !1, !76}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!76 = !{!"0xb\0025\0019\008", !1, !77}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!77 = !{!"0xb\0025\0010\007", !1, !70}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/strcat.c]
!78 = !MDLocation(line: 25, column: 47, scope: !76)
!79 = !MDLocation(line: 26, column: 24, scope: !70)
!80 = !MDLocation(line: 26, column: 15, scope: !70)
!81 = !MDLocation(line: 27, column: 2, scope: !70)
!82 = !MDLocation(line: 29, column: 2, scope: !65)
!83 = !MDLocation(line: 30, column: 2, scope: !65)
!84 = !MDLocation(line: 21, column: 20, scope: !55)
!85 = !MDLocation(line: 15, column: 9, scope: !10)
!86 = !MDLocation(line: 32, column: 25, scope: !10)
!87 = !MDLocation(line: 32, column: 20, scope: !10)
!88 = !MDLocation(line: 32, column: 5, scope: !10)
!89 = !MDLocation(line: 33, column: 5, scope: !10)
!90 = !MDLocation(line: 35, column: 5, scope: !10)
!91 = !MDLocation(line: 278, column: 1, scope: !23)
!92 = !MDLocation(line: 280, column: 16, scope: !23)
!93 = !MDLocation(line: 280, column: 10, scope: !23)
!94 = !MDLocation(line: 280, column: 3, scope: !23)
