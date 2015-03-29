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
  br i1 %cmp, label %cond.true, label %while.cond.preheader, !dbg !43

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !44
  %0 = load i8** %arrayidx, align 8, !dbg !44, !tbaa !46
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !50, metadata !39) #3, !dbg !52
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) #3, !dbg !53
  %conv.i = trunc i64 %call.i to i32, !dbg !54
  %phitmp = add i32 %conv.i, -1, !dbg !43
  br label %while.cond.preheader, !dbg !43

while.cond.preheader:                             ; preds = %entry, %cond.true
  %N.0.ph = phi i32 [ 399999999, %entry ], [ %phitmp, %cond.true ]
  %gen_random.last.promoted = load i64* @gen_random.last, align 8, !dbg !55, !tbaa !58
  %1 = add i32 %N.0.ph, 1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %1, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %while.cond.prol, label %while.cond.preheader.split

while.cond.prol:                                  ; preds = %while.cond.prol, %while.cond.preheader
  %rem.i5.prol = phi i64 [ %rem.i.prol, %while.cond.prol ], [ %gen_random.last.promoted, %while.cond.preheader ], !dbg !60
  %N.0.prol = phi i32 [ %dec.prol, %while.cond.prol ], [ %N.0.ph, %while.cond.preheader ]
  %prol.iter = phi i32 [ %xtraiter, %while.cond.preheader ], [ %prol.iter.sub, %while.cond.prol ]
  %dec.prol = add nsw i32 %N.0.prol, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %dec.prol, i64 0, metadata !17, metadata !39), !dbg !62
  %tobool.prol = icmp eq i32 %N.0.prol, 0, !dbg !63
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !64, metadata !39), !dbg !65
  %mul.i.prol = mul nsw i64 %rem.i5.prol, 3877, !dbg !66
  %add.i.prol = add nsw i64 %mul.i.prol, 29573, !dbg !66
  %rem.i.prol = srem i64 %add.i.prol, 139968, !dbg !67
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !63
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !63
  br i1 %prol.iter.cmp, label %while.cond.prol, label %while.cond.preheader.split, !llvm.loop !68

while.cond.preheader.split:                       ; preds = %while.cond.prol, %while.cond.preheader
  %rem.i.lcssa.unr = phi i64 [ 0, %while.cond.preheader ], [ %rem.i.prol, %while.cond.prol ]
  %rem.i5.unr = phi i64 [ %gen_random.last.promoted, %while.cond.preheader ], [ %rem.i.prol, %while.cond.prol ]
  %N.0.unr = phi i32 [ %N.0.ph, %while.cond.preheader ], [ %dec.prol, %while.cond.prol ]
  %2 = icmp ult i32 %1, 4
  br i1 %2, label %while.end, label %while.cond.preheader.split.split

while.cond.preheader.split.split:                 ; preds = %while.cond.preheader.split
  br label %while.cond, !dbg !60

while.cond:                                       ; preds = %while.cond, %while.cond.preheader.split.split
  %rem.i5 = phi i64 [ %rem.i5.unr, %while.cond.preheader.split.split ], [ %rem.i.3, %while.cond ], !dbg !60
  %N.0 = phi i32 [ %N.0.unr, %while.cond.preheader.split.split ], [ %dec.3, %while.cond ]
  %dec = add nsw i32 %N.0, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !17, metadata !39), !dbg !62
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !64, metadata !39), !dbg !65
  %mul.i = mul nsw i64 %rem.i5, 3877, !dbg !66
  %add.i = add nsw i64 %mul.i, 29573, !dbg !66
  %rem.i = srem i64 %add.i, 139968, !dbg !67
  %dec.1 = add nsw i32 %dec, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !17, metadata !39), !dbg !62
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !64, metadata !39), !dbg !65
  %mul.i.1 = mul nsw i64 %rem.i, 3877, !dbg !66
  %add.i.1 = add nsw i64 %mul.i.1, 29573, !dbg !66
  %rem.i.1 = srem i64 %add.i.1, 139968, !dbg !67
  %dec.2 = add nsw i32 %dec.1, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !17, metadata !39), !dbg !62
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !64, metadata !39), !dbg !65
  %mul.i.2 = mul nsw i64 %rem.i.1, 3877, !dbg !66
  %add.i.2 = add nsw i64 %mul.i.2, 29573, !dbg !66
  %rem.i.2 = srem i64 %add.i.2, 139968, !dbg !67
  %dec.3 = add nsw i32 %dec.2, -1, !dbg !60
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !17, metadata !39), !dbg !62
  %tobool.3 = icmp eq i32 %dec.2, 0, !dbg !63
  tail call void @llvm.dbg.value(metadata double 1.000000e+02, i64 0, metadata !64, metadata !39), !dbg !65
  %mul.i.3 = mul nsw i64 %rem.i.2, 3877, !dbg !66
  %add.i.3 = add nsw i64 %mul.i.3, 29573, !dbg !66
  %rem.i.3 = srem i64 %add.i.3, 139968, !dbg !67
  br i1 %tobool.3, label %while.end.unr-lcssa, label %while.cond, !dbg !63

while.end.unr-lcssa:                              ; preds = %while.cond
  %rem.i.lcssa.ph = phi i64 [ %rem.i.3, %while.cond ]
  br label %while.end

while.end:                                        ; preds = %while.cond.preheader.split, %while.end.unr-lcssa
  %rem.i.lcssa = phi i64 [ %rem.i.lcssa.unr, %while.cond.preheader.split ], [ %rem.i.lcssa.ph, %while.end.unr-lcssa ]
  store i64 %rem.i.lcssa, i64* @gen_random.last, align 8, !dbg !55, !tbaa !58
  %conv.i4 = sitofp i64 %rem.i.lcssa to double, !dbg !70
  %mul1.i = fmul double %conv.i4, 1.000000e+02, !dbg !71
  %div.i = fdiv double %mul1.i, 1.399680e+05, !dbg !71
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %div.i) #3, !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

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
!18 = !{!"0x2e\00gen_random\00gen_random\00\0016\001\001\000\000\00256\001\0016", !1, !11, !19, null, null, null, null, !22} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!21, !21}
!21 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!22 = !{!23}
!23 = !{!"0x101\00max\0016777232\000", !18, !11, !21} ; [ DW_TAG_arg_variable ] [max] [line 16]
!24 = !{!"0x2e\00atoi\00atoi\00\00278\000\001\000\000\00256\001\00279", !25, !26, !27, null, null, null, null, !31} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
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
!50 = !{!"0x101\00__nptr\0016777494\000", !24, !26, !29, !51} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!51 = !MDLocation(line: 29, column: 26, scope: !10)
!52 = !MDLocation(line: 278, column: 1, scope: !24, inlinedAt: !51)
!53 = !MDLocation(line: 280, column: 16, scope: !24, inlinedAt: !51)
!54 = !MDLocation(line: 280, column: 10, scope: !24, inlinedAt: !51)
!55 = !MDLocation(line: 19, column: 3, scope: !18, inlinedAt: !56)
!56 = !MDLocation(line: 32, column: 5, scope: !57)
!57 = !{!"0xb\0031\0015\000", !1, !10}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!58 = !{!59, !59, i64 0}
!59 = !{!"long", !48, i64 0}
!60 = !MDLocation(line: 31, column: 10, scope: !61)
!61 = !{!"0xb\002", !1, !45}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!62 = !MDLocation(line: 29, column: 7, scope: !10)
!63 = !MDLocation(line: 31, column: 3, scope: !10)
!64 = !{!"0x101\00max\0016777232\000", !18, !11, !21, !56} ; [ DW_TAG_arg_variable ] [max] [line 16]
!65 = !MDLocation(line: 16, column: 33, scope: !18, inlinedAt: !56)
!66 = !MDLocation(line: 19, column: 11, scope: !18, inlinedAt: !56)
!67 = !MDLocation(line: 19, column: 10, scope: !18, inlinedAt: !56)
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.unroll.disable"}
!70 = !MDLocation(line: 20, column: 17, scope: !18, inlinedAt: !56)
!71 = !MDLocation(line: 20, column: 11, scope: !18, inlinedAt: !56)
!72 = !MDLocation(line: 34, column: 3, scope: !10)
!73 = !MDLocation(line: 35, column: 3, scope: !10)
