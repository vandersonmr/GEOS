; ModuleID = 'random.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1
@gen_random.last = internal global i64 42, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %N = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !22, metadata !23), !dbg !24
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !25, metadata !23), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %N, metadata !27, metadata !23), !dbg !28
  %0 = load i32* %argc.addr, align 4, !dbg !29
  %cmp = icmp eq i32 %0, 2, !dbg !29
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !30

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8** %1, i64 1, !dbg !31
  %2 = load i8** %arrayidx, align 8, !dbg !31
  %call = call i32 @atoi(i8* %2) #4, !dbg !33
  br label %cond.end, !dbg !30

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !34

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 400000000, %cond.false ], !dbg !30
  %sub = sub nsw i32 %cond, 1, !dbg !36
  store i32 %sub, i32* %N, align 4, !dbg !28
  br label %while.cond, !dbg !39

while.cond:                                       ; preds = %while.body, %cond.end
  %3 = load i32* %N, align 4, !dbg !40
  %dec = add nsw i32 %3, -1, !dbg !40
  store i32 %dec, i32* %N, align 4, !dbg !40
  %tobool = icmp ne i32 %3, 0, !dbg !39
  br i1 %tobool, label %while.body, label %while.end, !dbg !39

while.body:                                       ; preds = %while.cond
  %call1 = call double @gen_random(double 1.000000e+02), !dbg !42
  br label %while.cond, !dbg !39

while.end:                                        ; preds = %while.cond
  %call2 = call double @gen_random(double 1.000000e+02), !dbg !44
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %call2), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

; Function Attrs: nounwind uwtable
define internal double @gen_random(double %max) #0 {
entry:
  %max.addr = alloca double, align 8
  store double %max, double* %max.addr, align 8
  call void @llvm.dbg.declare(metadata double* %max.addr, metadata !47, metadata !23), !dbg !48
  %0 = load i64* @gen_random.last, align 8, !dbg !49
  %mul = mul nsw i64 %0, 3877, !dbg !49
  %add = add nsw i64 %mul, 29573, !dbg !49
  %rem = srem i64 %add, 139968, !dbg !50
  store i64 %rem, i64* @gen_random.last, align 8, !dbg !51
  %1 = load double* %max.addr, align 8, !dbg !52
  %2 = load i64* @gen_random.last, align 8, !dbg !53
  %conv = sitofp i64 %2 to double, !dbg !53
  %mul1 = fmul double %1, %conv, !dbg !52
  %div = fdiv double %mul1, 1.399680e+05, !dbg !52
  ret double %div, !dbg !54
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !16, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c] [DW_LANG_C99]
!1 = !{!"random.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12}
!4 = !{!"0x2e\00main\00main\00\0023\000\001\000\000\00256\000\0023", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 23] [def] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!"0x2e\00gen_random\00gen_random\00\0016\001\001\000\000\00256\000\0016", !1, !5, !13, null, double (double)* @gen_random, null, null, !2} ; [ DW_TAG_subprogram ] [line 16] [local] [def] [gen_random]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15}
!15 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = !{!17}
!17 = !{!"0x34\00last\00last\00\0017\001\001", !12, !5, !18, i64* @gen_random.last, null} ; [ DW_TAG_variable ] [last] [line 17] [local] [def]
!18 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 2}
!21 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!22 = !{!"0x101\00argc\0016777239\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 23]
!23 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!24 = !MDLocation(line: 23, column: 14, scope: !4)
!25 = !{!"0x101\00argv\0033554455\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 23]
!26 = !MDLocation(line: 23, column: 26, scope: !4)
!27 = !{!"0x100\00N\0029\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [N] [line 29]
!28 = !MDLocation(line: 29, column: 7, scope: !4)
!29 = !MDLocation(line: 29, column: 13, scope: !4)
!30 = !MDLocation(line: 29, column: 12, scope: !4)
!31 = !MDLocation(line: 29, column: 31, scope: !32)
!32 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!33 = !MDLocation(line: 29, column: 26, scope: !4)
!34 = !MDLocation(line: 29, column: 12, scope: !35)
!35 = !{!"0xb\002", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!36 = !MDLocation(line: 29, column: 11, scope: !37)
!37 = !{!"0xb\004", !1, !38}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!38 = !{!"0xb\003", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!39 = !MDLocation(line: 31, column: 3, scope: !4)
!40 = !MDLocation(line: 31, column: 10, scope: !41)
!41 = !{!"0xb\002", !1, !32}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!42 = !MDLocation(line: 32, column: 5, scope: !43)
!43 = !{!"0xb\0031\0015\000", !1, !4}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/random.c]
!44 = !MDLocation(line: 34, column: 20, scope: !4)
!45 = !MDLocation(line: 34, column: 3, scope: !4)
!46 = !MDLocation(line: 35, column: 3, scope: !4)
!47 = !{!"0x101\00max\0016777232\000", !12, !5, !15} ; [ DW_TAG_arg_variable ] [max] [line 16]
!48 = !MDLocation(line: 16, column: 33, scope: !12)
!49 = !MDLocation(line: 19, column: 11, scope: !12)
!50 = !MDLocation(line: 19, column: 10, scope: !12)
!51 = !MDLocation(line: 19, column: 3, scope: !12)
!52 = !MDLocation(line: 20, column: 11, scope: !12)
!53 = !MDLocation(line: 20, column: 17, scope: !12)
!54 = !MDLocation(line: 20, column: 3, scope: !12)
