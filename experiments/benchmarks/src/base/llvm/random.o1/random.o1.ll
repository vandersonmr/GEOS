; ModuleID = 'random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1
@gen_random.last = internal unnamed_addr global i64 42, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !15, metadata !39), !dbg !40
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !16, metadata !39), !dbg !41
  %cmp = icmp eq i32 %argc, 2, !dbg !42
  br i1 %cmp, label %cond.true, label %while.cond, !dbg !43

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !44
  %0 = load i8** %arrayidx, align 8, !dbg !44, !tbaa !46
  %call = tail call i32 @atoi(i8* %0) #4, !dbg !50
  %phitmp = add i32 %call, -1, !dbg !43
  br label %while.cond, !dbg !43

while.cond:                                       ; preds = %cond.true, %entry, %while.cond
  %N.0 = phi i32 [ %dec, %while.cond ], [ %phitmp, %cond.true ], [ 399999999, %entry ]
  %dec = add nsw i32 %N.0, -1, !dbg !51
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !17, metadata !39), !dbg !53
  %tobool = icmp eq i32 %N.0, 0, !dbg !54
  %call1 = tail call fastcc double @gen_random(), !dbg !55
  br i1 %tobool, label %while.end, label %while.cond, !dbg !54

while.end:                                        ; preds = %while.cond
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call1) #5, !dbg !57
  ret i32 0, !dbg !58
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture nonnull readonly %__nptr) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %__nptr, i64 0, metadata !32, metadata !39), !dbg !59
  %call = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  ret i32 %conv, !dbg !62
}

; Function Attrs: nounwind uwtable
define internal fastcc double @gen_random() #0 {
entry:
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !23, metadata !39), !dbg !63
  %0 = load i64* @gen_random.last, align 8, !dbg !64, !tbaa !65
  %mul = mul nsw i64 %0, 3877, !dbg !64
  %add = add nsw i64 %mul, 29573, !dbg !64
  %rem = srem i64 %add, 139968, !dbg !67
  store i64 %rem, i64* @gen_random.last, align 8, !dbg !68, !tbaa !65
  %conv = sitofp i64 %rem to double, !dbg !69
  %mul1 = fmul double %conv, 1.000000e+02, !dbg !70
  %div = fdiv double %mul1, 1.399680e+05, !dbg !70
  ret double %div, !dbg !71
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
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !9, !33, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c] [DW_LANG_C99]
!1 = !{!"random.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!7 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!10, !18, !24}
!10 = !{!"0x2e\00main\00main\00\0023\000\001\000\000\00256\001\0023", !1, !11, !12, null, i32 (i32, i8**)* @main, null, null, !14} ; [ DW_TAG_subprogram ] [line 23] [def] [main]
!11 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!4, !4, !5}
!14 = !{!15, !16, !17}
!15 = !{!"0x101\00argc\0016777239\000", !10, !11, !4} ; [ DW_TAG_arg_variable ] [argc] [line 23]
!16 = !{!"0x101\00argv\0033554455\000", !10, !11, !5} ; [ DW_TAG_arg_variable ] [argv] [line 23]
!17 = !{!"0x100\00N\0029\000", !10, !11, !4}      ; [ DW_TAG_auto_variable ] [N] [line 29]
!18 = !{!"0x2e\00gen_random\00gen_random\00\0016\001\001\000\000\00256\001\0016", !1, !11, !19, null, double ()* @gen_random, null, null, !22} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!21, !21}
!21 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!22 = !{!23}
!23 = !{!"0x101\00max\0016777232\000", !18, !11, !21} ; [ DW_TAG_arg_variable ] [max] [line 16]
!24 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !25, !26, !27, null, i32 (i8*)* @atoi, null, null, !31} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!25 = !{!"/usr/include/stdlib.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!26 = !{!"0x29", !25}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/include/stdlib.h]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!4, !29}
!29 = !{!"0xf\00\000\0064\0064\000\000", null, null, !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = !{!"0x26\00\000\000\000\000\000", null, null, !7} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!31 = !{!32}
!32 = !{!"0x101\00__nptr\0016777494\000", !24, !26, !29} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!33 = !{!34}
!34 = !{!"0x34\00last\00last\00\0017\001\001", !18, !11, !35, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!35 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!36 = !{i32 2, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 2}
!38 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!39 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!40 = !MDLocation(line: 23, column: 14, scope: !10)
!41 = !MDLocation(line: 23, column: 26, scope: !10)
!42 = !MDLocation(line: 29, column: 13, scope: !10)
!43 = !MDLocation(line: 29, column: 12, scope: !10)
!44 = !MDLocation(line: 29, column: 31, scope: !45)
!45 = !{!"0xb\001", !1, !10}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!46 = !{!47, !47, i64 0}
!47 = !{!"any pointer", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !MDLocation(line: 29, column: 26, scope: !10)
!51 = !MDLocation(line: 31, column: 10, scope: !52)
!52 = !{!"0xb\002", !1, !45}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!53 = !MDLocation(line: 29, column: 7, scope: !10)
!54 = !MDLocation(line: 31, column: 3, scope: !10)
!55 = !MDLocation(line: 32, column: 5, scope: !56)
!56 = !{!"0xb\0031\0015\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!57 = !MDLocation(line: 34, column: 3, scope: !10)
!58 = !MDLocation(line: 35, column: 3, scope: !10)
!59 = !MDLocation(line: 278, column: 1, scope: !24)
!60 = !MDLocation(line: 280, column: 16, scope: !24)
!61 = !MDLocation(line: 280, column: 10, scope: !24)
!62 = !MDLocation(line: 280, column: 3, scope: !24)
!63 = !MDLocation(line: 16, column: 33, scope: !18)
!64 = !MDLocation(line: 19, column: 11, scope: !18)
!65 = !{!66, !66, i64 0}
!66 = !{!"long", !48, i64 0}
!67 = !MDLocation(line: 19, column: 10, scope: !18)
!68 = !MDLocation(line: 19, column: 3, scope: !18)
!69 = !MDLocation(line: 20, column: 17, scope: !18)
!70 = !MDLocation(line: 20, column: 11, scope: !18)
!71 = !MDLocation(line: 20, column: 3, scope: !18)
