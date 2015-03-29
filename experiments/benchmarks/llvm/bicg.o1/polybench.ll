; ModuleID = 'utilities/polybench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@polybench_papi_counters_threadid = global i32 0, align 4
@polybench_program_total_flops = global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [12 x i8] c"tmp <= 10.0\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"utilities/polybench.c\00", align 1
@__PRETTY_FUNCTION__.polybench_flush_cache = private unnamed_addr constant [29 x i8] c"void polybench_flush_cache()\00", align 1
@polybench_t_start = common global double 0.000000e+00, align 8
@polybench_t_end = common global double 0.000000e+00, align 8
@.str2 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@polybench_c_start = common global i64 0, align 8
@polybench_c_end = common global i64 0, align 8
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1

; Function Attrs: nounwind uwtable
define void @polybench_flush_cache() #0 {
entry:
  %cs = alloca i32, align 4
  %flush = alloca double*, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  call void @llvm.dbg.declare(metadata i32* %cs, metadata !40, metadata !41), !dbg !42
  store i32 4194560, i32* %cs, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata double** %flush, metadata !43, metadata !41), !dbg !44
  %0 = load i32* %cs, align 4, !dbg !45
  %conv = sext i32 %0 to i64, !dbg !45
  %call = call noalias i8* @calloc(i64 %conv, i64 8) #5, !dbg !46
  %1 = bitcast i8* %call to double*, !dbg !47
  store double* %1, double** %flush, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %i, metadata !48, metadata !41), !dbg !49
  call void @llvm.dbg.declare(metadata double* %tmp, metadata !50, metadata !41), !dbg !51
  store double 0.000000e+00, double* %tmp, align 8, !dbg !51
  store i32 0, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4, !dbg !54
  %3 = load i32* %cs, align 4, !dbg !58
  %cmp = icmp slt i32 %2, %3, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4, !dbg !61
  %idxprom = sext i32 %4 to i64, !dbg !62
  %5 = load double** %flush, align 8, !dbg !62
  %arrayidx = getelementptr inbounds double* %5, i64 %idxprom, !dbg !62
  %6 = load double* %arrayidx, align 8, !dbg !62
  %7 = load double* %tmp, align 8, !dbg !63
  %add = fadd double %7, %6, !dbg !63
  store double %add, double* %tmp, align 8, !dbg !63
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4, !dbg !64
  %inc = add nsw i32 %8, 1, !dbg !64
  store i32 %inc, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65

for.end:                                          ; preds = %for.cond
  %9 = load double* %tmp, align 8, !dbg !66
  %cmp2 = fcmp ole double %9, 1.000000e+01, !dbg !66
  br i1 %cmp2, label %cond.true, label %cond.false, !dbg !66

cond.true:                                        ; preds = %for.end
  br label %cond.end, !dbg !67

cond.false:                                       ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([29 x i8]* @__PRETTY_FUNCTION__.polybench_flush_cache, i32 0, i32 0)) #6, !dbg !69
  unreachable, !dbg !69
                                                  ; No predecessors!
  br label %cond.end, !dbg !66

cond.end:                                         ; preds = %10, %cond.true
  %11 = load double** %flush, align 8, !dbg !71
  %12 = bitcast double* %11 to i8*, !dbg !71
  call void @free(i8* %12) #5, !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @polybench_prepare_instruments() #0 {
entry:
  call void @polybench_flush_cache(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_start() #0 {
entry:
  call void @polybench_prepare_instruments(), !dbg !76
  %call = call double @rtclock(), !dbg !77
  store double %call, double* @polybench_t_start, align 8, !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_stop() #0 {
entry:
  %call = call double @rtclock(), !dbg !80
  store double %call, double* @polybench_t_end, align 8, !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nounwind uwtable
define void @polybench_timer_print() #0 {
entry:
  %0 = load double* @polybench_t_end, align 8, !dbg !83
  %1 = load double* @polybench_t_start, align 8, !dbg !84
  %sub = fsub double %0, %1, !dbg !83
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), double %sub), !dbg !85
  ret void, !dbg !86
}

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind uwtable
define i8* @polybench_alloc_data(i32 %n, i32 %elt_size) #0 {
entry:
  %n.addr = alloca i32, align 4
  %elt_size.addr = alloca i32, align 4
  %ret = alloca i8*, align 8
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !87, metadata !41), !dbg !88
  store i32 %elt_size, i32* %elt_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %elt_size.addr, metadata !89, metadata !41), !dbg !90
  call void @llvm.dbg.declare(metadata i8** %ret, metadata !91, metadata !41), !dbg !92
  %0 = load i32* %n.addr, align 4, !dbg !93
  %1 = load i32* %elt_size.addr, align 4, !dbg !94
  %mul = mul nsw i32 %0, %1, !dbg !93
  %conv = sext i32 %mul to i64, !dbg !93
  %call = call i8* @xmalloc(i64 %conv), !dbg !95
  store i8* %call, i8** %ret, align 8, !dbg !92
  %2 = load i8** %ret, align 8, !dbg !96
  ret i8* %2, !dbg !97
}

; Function Attrs: nounwind uwtable
define internal i8* @xmalloc(i64 %num) #0 {
entry:
  %num.addr = alloca i64, align 8
  %new = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i64 %num, i64* %num.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %num.addr, metadata !98, metadata !41), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %new, metadata !100, metadata !41), !dbg !101
  store i8* null, i8** %new, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !102, metadata !41), !dbg !103
  %0 = load i64* %num.addr, align 8, !dbg !104
  %call = call i32 @posix_memalign(i8** %new, i64 32, i64 %0) #5, !dbg !105
  store i32 %call, i32* %ret, align 4, !dbg !103
  %1 = load i8** %new, align 8, !dbg !106
  %tobool = icmp ne i8* %1, null, !dbg !108
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !108

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %ret, align 4, !dbg !109
  %tobool1 = icmp ne i32 %2, 0, !dbg !108
  br i1 %tobool1, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load %struct._IO_FILE** @stderr, align 8, !dbg !111
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([51 x i8]* @.str3, i32 0, i32 0)), !dbg !113
  call void @exit(i32 1) #6, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8** %new, align 8, !dbg !115
  ret i8* %4, !dbg !116
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define internal double @rtclock() #0 {
entry:
  ret double 0.000000e+00, !dbg !117
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !7, !29, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c] [DW_LANG_C99]
!1 = !{!"utilities/polybench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench"}
!2 = !{}
!3 = !{!4, null, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!8, !12, !13, !14, !15, !16, !20, !26}
!8 = !{!"0x2e\00polybench_flush_cache\00polybench_flush_cache\00\0086\000\001\000\000\000\000\0087", !1, !9, !10, null, void ()* @polybench_flush_cache, null, null, !2} ; [ DW_TAG_subprogram ] [line 86] [def] [scope 87] [polybench_flush_cache]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null}
!12 = !{!"0x2e\00polybench_prepare_instruments\00polybench_prepare_instruments\00\00322\000\001\000\000\000\000\00323", !1, !9, !10, null, void ()* @polybench_prepare_instruments, null, null, !2} ; [ DW_TAG_subprogram ] [line 322] [def] [scope 323] [polybench_prepare_instruments]
!13 = !{!"0x2e\00polybench_timer_start\00polybench_timer_start\00\00333\000\001\000\000\000\000\00334", !1, !9, !10, null, void ()* @polybench_timer_start, null, null, !2} ; [ DW_TAG_subprogram ] [line 333] [def] [scope 334] [polybench_timer_start]
!14 = !{!"0x2e\00polybench_timer_stop\00polybench_timer_stop\00\00344\000\001\000\000\000\000\00345", !1, !9, !10, null, void ()* @polybench_timer_stop, null, null, !2} ; [ DW_TAG_subprogram ] [line 344] [def] [scope 345] [polybench_timer_stop]
!15 = !{!"0x2e\00polybench_timer_print\00polybench_timer_print\00\00357\000\001\000\000\000\000\00358", !1, !9, !10, null, void ()* @polybench_timer_print, null, null, !2} ; [ DW_TAG_subprogram ] [line 357] [def] [scope 358] [polybench_timer_print]
!16 = !{!"0x2e\00polybench_alloc_data\00polybench_alloc_data\00\00395\000\001\000\000\00256\000\00396", !1, !9, !17, null, i8* (i32, i32)* @polybench_alloc_data, null, null, !2} ; [ DW_TAG_subprogram ] [line 395] [def] [scope 396] [polybench_alloc_data]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!6, !19, !19}
!19 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = !{!"0x2e\00xmalloc\00xmalloc\00\00382\001\001\000\000\00256\000\00383", !1, !9, !21, null, i8* (i64)* @xmalloc, null, null, !2} ; [ DW_TAG_subprogram ] [line 382] [local] [def] [scope 383] [xmalloc]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!6, !23}
!23 = !{!"0x16\00size_t\0062\000\000\000\000", !24, null, !25} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!24 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench"}
!25 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!26 = !{!"0x2e\00rtclock\00rtclock\00\0056\001\001\000\000\000\000\0057", !1, !9, !27, null, double ()* @rtclock, null, null, !2} ; [ DW_TAG_subprogram ] [line 56] [local] [def] [scope 57] [rtclock]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!5}
!29 = !{!30, !31, !32, !33, !34, !36}
!30 = !{!"0x34\00polybench_papi_counters_threadid\00polybench_papi_counters_threadid\00\0033\000\001", null, !9, !19, i32* @polybench_papi_counters_threadid, null} ; [ DW_TAG_variable ] [polybench_papi_counters_threadid] [line 33] [def]
!31 = !{!"0x34\00polybench_program_total_flops\00polybench_program_total_flops\00\0034\000\001", null, !9, !5, double* @polybench_program_total_flops, null} ; [ DW_TAG_variable ] [polybench_program_total_flops] [line 34] [def]
!32 = !{!"0x34\00polybench_t_start\00polybench_t_start\00\0051\000\001", null, !9, !5, double* @polybench_t_start, null} ; [ DW_TAG_variable ] [polybench_t_start] [line 51] [def]
!33 = !{!"0x34\00polybench_t_end\00polybench_t_end\00\0051\000\001", null, !9, !5, double* @polybench_t_end, null} ; [ DW_TAG_variable ] [polybench_t_end] [line 51] [def]
!34 = !{!"0x34\00polybench_c_start\00polybench_c_start\00\0053\000\001", null, !9, !35, i64* @polybench_c_start, null} ; [ DW_TAG_variable ] [polybench_c_start] [line 53] [def]
!35 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!36 = !{!"0x34\00polybench_c_end\00polybench_c_end\00\0053\000\001", null, !9, !35, i64* @polybench_c_end, null} ; [ DW_TAG_variable ] [polybench_c_end] [line 53] [def]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x100\00cs\0088\000", !8, !9, !19}      ; [ DW_TAG_auto_variable ] [cs] [line 88]
!41 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!42 = !MDLocation(line: 88, column: 7, scope: !8)
!43 = !{!"0x100\00flush\0089\000", !8, !9, !4}    ; [ DW_TAG_auto_variable ] [flush] [line 89]
!44 = !MDLocation(line: 89, column: 11, scope: !8)
!45 = !MDLocation(line: 89, column: 37, scope: !8)
!46 = !MDLocation(line: 89, column: 29, scope: !8)
!47 = !MDLocation(line: 89, column: 19, scope: !8)
!48 = !{!"0x100\00i\0090\000", !8, !9, !19}       ; [ DW_TAG_auto_variable ] [i] [line 90]
!49 = !MDLocation(line: 90, column: 7, scope: !8)
!50 = !{!"0x100\00tmp\0091\000", !8, !9, !5}      ; [ DW_TAG_auto_variable ] [tmp] [line 91]
!51 = !MDLocation(line: 91, column: 10, scope: !8)
!52 = !MDLocation(line: 95, column: 8, scope: !53)
!53 = !{!"0xb\0095\003\000", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!54 = !MDLocation(line: 95, column: 15, scope: !55)
!55 = !{!"0xb\002", !1, !56}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!56 = !{!"0xb\001", !1, !57}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!57 = !{!"0xb\0095\003\001", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!58 = !MDLocation(line: 95, column: 19, scope: !57)
!59 = !MDLocation(line: 95, column: 15, scope: !57)
!60 = !MDLocation(line: 95, column: 3, scope: !53)
!61 = !MDLocation(line: 96, column: 18, scope: !57)
!62 = !MDLocation(line: 96, column: 12, scope: !57)
!63 = !MDLocation(line: 96, column: 5, scope: !57)
!64 = !MDLocation(line: 95, column: 23, scope: !57)
!65 = !MDLocation(line: 95, column: 3, scope: !57)
!66 = !MDLocation(line: 97, column: 3, scope: !8)
!67 = !MDLocation(line: 97, column: 3, scope: !68)
!68 = !{!"0xb\001", !1, !8}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!69 = !MDLocation(line: 97, column: 3, scope: !70)
!70 = !{!"0xb\002", !1, !8}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!71 = !MDLocation(line: 98, column: 9, scope: !8)
!72 = !MDLocation(line: 98, column: 3, scope: !8)
!73 = !MDLocation(line: 99, column: 1, scope: !8)
!74 = !MDLocation(line: 325, column: 3, scope: !12)
!75 = !MDLocation(line: 330, column: 1, scope: !12)
!76 = !MDLocation(line: 335, column: 3, scope: !13)
!77 = !MDLocation(line: 337, column: 23, scope: !13)
!78 = !MDLocation(line: 337, column: 3, scope: !13)
!79 = !MDLocation(line: 341, column: 1, scope: !13)
!80 = !MDLocation(line: 347, column: 21, scope: !14)
!81 = !MDLocation(line: 347, column: 3, scope: !14)
!82 = !MDLocation(line: 354, column: 1, scope: !14)
!83 = !MDLocation(line: 371, column: 26, scope: !15)
!84 = !MDLocation(line: 371, column: 44, scope: !15)
!85 = !MDLocation(line: 371, column: 7, scope: !15)
!86 = !MDLocation(line: 376, column: 1, scope: !15)
!87 = !{!"0x101\00n\0016777611\000", !16, !9, !19} ; [ DW_TAG_arg_variable ] [n] [line 395]
!88 = !MDLocation(line: 395, column: 32, scope: !16)
!89 = !{!"0x101\00elt_size\0033554827\000", !16, !9, !19} ; [ DW_TAG_arg_variable ] [elt_size] [line 395]
!90 = !MDLocation(line: 395, column: 39, scope: !16)
!91 = !{!"0x100\00ret\00397\000", !16, !9, !6}    ; [ DW_TAG_auto_variable ] [ret] [line 397]
!92 = !MDLocation(line: 397, column: 9, scope: !16)
!93 = !MDLocation(line: 397, column: 24, scope: !16)
!94 = !MDLocation(line: 397, column: 28, scope: !16)
!95 = !MDLocation(line: 397, column: 15, scope: !16)
!96 = !MDLocation(line: 399, column: 10, scope: !16)
!97 = !MDLocation(line: 399, column: 3, scope: !16)
!98 = !{!"0x101\00num\0016777598\000", !20, !9, !23} ; [ DW_TAG_arg_variable ] [num] [line 382]
!99 = !MDLocation(line: 382, column: 17, scope: !20)
!100 = !{!"0x100\00new\00384\000", !20, !9, !6}   ; [ DW_TAG_auto_variable ] [new] [line 384]
!101 = !MDLocation(line: 384, column: 9, scope: !20)
!102 = !{!"0x100\00ret\00385\000", !20, !9, !19}  ; [ DW_TAG_auto_variable ] [ret] [line 385]
!103 = !MDLocation(line: 385, column: 7, scope: !20)
!104 = !MDLocation(line: 385, column: 39, scope: !20)
!105 = !MDLocation(line: 385, column: 13, scope: !20)
!106 = !MDLocation(line: 386, column: 9, scope: !107)
!107 = !{!"0xb\00386\007\002", !1, !20}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!108 = !MDLocation(line: 386, column: 7, scope: !20)
!109 = !MDLocation(line: 386, column: 16, scope: !110)
!110 = !{!"0xb\001", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!111 = !MDLocation(line: 388, column: 16, scope: !112)
!112 = !{!"0xb\00387\005\003", !1, !107}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/utilities/polybench.c]
!113 = !MDLocation(line: 388, column: 7, scope: !112)
!114 = !MDLocation(line: 389, column: 7, scope: !112)
!115 = !MDLocation(line: 391, column: 10, scope: !20)
!116 = !MDLocation(line: 391, column: 3, scope: !20)
!117 = !MDLocation(line: 66, column: 5, scope: !26)
