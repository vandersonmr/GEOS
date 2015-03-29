; ModuleID = 'dt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c" %i iterations of each test. \00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c" inner loop / array size %i.\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dvec1 = alloca double*, align 8
  %dvec2 = alloca double*, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !30, metadata !31), !dbg !32
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !33, metadata !31), !dbg !34
  call void @llvm.dbg.declare(metadata double** %dvec1, metadata !35, metadata !31), !dbg !36
  call void @llvm.dbg.declare(metadata double** %dvec2, metadata !37, metadata !31), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !31), !dbg !41
  %0 = bitcast double** %dvec1 to i8**, !dbg !42
  %call = call i32 @posix_memalign(i8** %0, i64 16, i64 16384) #5, !dbg !43
  %1 = bitcast double** %dvec2 to i8**, !dbg !44
  %call1 = call i32 @posix_memalign(i8** %1, i64 16, i64 16384) #5, !dbg !45
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0), i32 131072), !dbg !46
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i32 0, i32 0), i32 2048), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64* %i, align 8, !dbg !50
  %cmp = icmp slt i64 %2, 2048, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %3 = load i64* %i, align 8, !dbg !55
  %sub = sub nsw i64 2048, %3, !dbg !57
  %conv = sitofp i64 %sub to float, !dbg !58
  %call4 = call float @cosf(float %conv) #5, !dbg !59
  %conv5 = fpext float %call4 to double, !dbg !59
  %mul = fmul double 0x3FF000001AD7F29B, %conv5, !dbg !60
  %4 = load i64* %i, align 8, !dbg !61
  %5 = load double** %dvec1, align 8, !dbg !62
  %arrayidx = getelementptr inbounds double* %5, i64 %4, !dbg !62
  store double %mul, double* %arrayidx, align 8, !dbg !62
  %6 = load i64* %i, align 8, !dbg !63
  %conv6 = sitofp i64 %6 to float, !dbg !64
  %call7 = call float @sinf(float %conv6) #5, !dbg !65
  %conv8 = fpext float %call7 to double, !dbg !65
  %mul9 = fmul double 1.000000e-10, %conv8, !dbg !66
  %add = fadd double 1.000000e+00, %mul9, !dbg !67
  %7 = load i64* %i, align 8, !dbg !68
  %8 = load double** %dvec2, align 8, !dbg !69
  %arrayidx10 = getelementptr inbounds double* %8, i64 %7, !dbg !69
  store double %add, double* %arrayidx10, align 8, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %9 = load i64* %i, align 8, !dbg !71
  %inc = add nsw i64 %9, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72

for.end:                                          ; preds = %for.cond
  %10 = load double** %dvec1, align 8, !dbg !73
  %11 = load double** %dvec2, align 8, !dbg !74
  call void @double_array_divs_variable(double* %10, double* %11), !dbg !75
  %12 = load double** %dvec1, align 8, !dbg !76
  %arrayidx11 = getelementptr inbounds double* %12, i64 0, !dbg !76
  %13 = load double* %arrayidx11, align 8, !dbg !76
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %13), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind
declare float @cosf(float) #2

; Function Attrs: nounwind
declare float @sinf(float) #2

; Function Attrs: inlinehint nounwind uwtable
define internal void @double_array_divs_variable(double* noalias %dvec1, double* noalias %dvec2) #4 {
entry:
  %dvec1.addr = alloca double*, align 8
  %dvec2.addr = alloca double*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store double* %dvec1, double** %dvec1.addr, align 8
  call void @llvm.dbg.declare(metadata double** %dvec1.addr, metadata !79, metadata !31), !dbg !80
  store double* %dvec2, double** %dvec2.addr, align 8
  call void @llvm.dbg.declare(metadata double** %dvec2.addr, metadata !81, metadata !31), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !31), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %j, metadata !85, metadata !31), !dbg !86
  store i64 0, i64* %j, align 8, !dbg !87
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i64* %j, align 8, !dbg !89
  %cmp = icmp slt i64 %0, 131072, !dbg !89
  br i1 %cmp, label %for.body, label %for.end7, !dbg !93

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond1, !dbg !94

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i64* %i, align 8, !dbg !96
  %cmp2 = icmp slt i64 %1, 2048, !dbg !96
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !100

for.body3:                                        ; preds = %for.cond1
  %2 = load i64* %i, align 8, !dbg !101
  %3 = load double** %dvec2.addr, align 8, !dbg !102
  %arrayidx = getelementptr inbounds double* %3, i64 %2, !dbg !102
  %4 = load double* %arrayidx, align 8, !dbg !102
  %5 = load i64* %i, align 8, !dbg !103
  %6 = load double** %dvec1.addr, align 8, !dbg !104
  %arrayidx4 = getelementptr inbounds double* %6, i64 %5, !dbg !104
  %7 = load double* %arrayidx4, align 8, !dbg !104
  %div = fdiv double %7, %4, !dbg !104
  store double %div, double* %arrayidx4, align 8, !dbg !104
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body3
  %8 = load i64* %i, align 8, !dbg !105
  %inc = add nsw i64 %8, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond1, !dbg !106

for.end:                                          ; preds = %for.cond1
  br label %for.inc5, !dbg !107

for.inc5:                                         ; preds = %for.end
  %9 = load i64* %j, align 8, !dbg !108
  %inc6 = add nsw i64 %9, 1, !dbg !108
  store i64 %inc6, i64* %j, align 8, !dbg !108
  br label %for.cond, !dbg !109

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !110
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !7, !11, !20, !20} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c] [DW_LANG_C99]
!1 = !{!"dt.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\005\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 5, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00ITERATIONS\00131072"}             ; [ DW_TAG_enumerator ] [ITERATIONS :: 131072]
!6 = !{!"0x28\00size\002048"}                     ; [ DW_TAG_enumerator ] [size :: 2048]
!7 = !{!8, !10}
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = !{!12, !21}
!12 = !{!"0x2e\00main\00main\00\0030\000\001\000\000\00256\000\0030", !1, !13, !14, null, i32 (i32, i8**)* @main, null, null, !20} ; [ DW_TAG_subprogram ] [line 30] [def] [main]
!13 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!16, !16, !17}
!16 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{}
!21 = !{!"0x2e\00double_array_divs_variable\00double_array_divs_variable\00\0011\001\001\000\000\00256\000\0012", !1, !13, !22, null, void (double*, double*)* @double_array_divs_variable, null, null, !20} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [double_array_divs_variable]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{null, !24, !24}
!24 = !{!"0x37\00\000\000\000\000\000", null, null, !25} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!26 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 2}
!29 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!30 = !{!"0x101\00argc\0016777246\000", !12, !13, !16} ; [ DW_TAG_arg_variable ] [argc] [line 30]
!31 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!32 = !MDLocation(line: 30, column: 14, scope: !12)
!33 = !{!"0x101\00argv\0033554462\000", !12, !13, !17} ; [ DW_TAG_arg_variable ] [argv] [line 30]
!34 = !MDLocation(line: 30, column: 26, scope: !12)
!35 = !{!"0x100\00dvec1\0031\000", !12, !13, !25} ; [ DW_TAG_auto_variable ] [dvec1] [line 31]
!36 = !MDLocation(line: 31, column: 11, scope: !12)
!37 = !{!"0x100\00dvec2\0031\000", !12, !13, !25} ; [ DW_TAG_auto_variable ] [dvec2] [line 31]
!38 = !MDLocation(line: 31, column: 19, scope: !12)
!39 = !{!"0x100\00i\0032\000", !12, !13, !40}     ; [ DW_TAG_auto_variable ] [i] [line 32]
!40 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!41 = !MDLocation(line: 32, column: 8, scope: !12)
!42 = !MDLocation(line: 34, column: 18, scope: !12)
!43 = !MDLocation(line: 34, column: 3, scope: !12)
!44 = !MDLocation(line: 35, column: 18, scope: !12)
!45 = !MDLocation(line: 35, column: 3, scope: !12)
!46 = !MDLocation(line: 37, column: 3, scope: !12)
!47 = !MDLocation(line: 38, column: 3, scope: !12)
!48 = !MDLocation(line: 42, column: 8, scope: !49)
!49 = !{!"0xb\0042\003\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!50 = !MDLocation(line: 42, column: 15, scope: !51)
!51 = !{!"0xb\002", !1, !52}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!52 = !{!"0xb\001", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!53 = !{!"0xb\0042\003\001", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!54 = !MDLocation(line: 42, column: 3, scope: !49)
!55 = !MDLocation(line: 43, column: 54, scope: !56)
!56 = !{!"0xb\0042\0031\002", !1, !53}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!57 = !MDLocation(line: 43, column: 47, scope: !56)
!58 = !MDLocation(line: 43, column: 39, scope: !56)
!59 = !MDLocation(line: 43, column: 34, scope: !56)
!60 = !MDLocation(line: 43, column: 22, scope: !56)
!61 = !MDLocation(line: 43, column: 17, scope: !56)
!62 = !MDLocation(line: 43, column: 11, scope: !56)
!63 = !MDLocation(line: 44, column: 56, scope: !56)
!64 = !MDLocation(line: 44, column: 49, scope: !56)
!65 = !MDLocation(line: 44, column: 44, scope: !56)
!66 = !MDLocation(line: 44, column: 29, scope: !56)
!67 = !MDLocation(line: 44, column: 22, scope: !56)
!68 = !MDLocation(line: 44, column: 17, scope: !56)
!69 = !MDLocation(line: 44, column: 11, scope: !56)
!70 = !MDLocation(line: 45, column: 3, scope: !56)
!71 = !MDLocation(line: 42, column: 25, scope: !53)
!72 = !MDLocation(line: 42, column: 3, scope: !53)
!73 = !MDLocation(line: 47, column: 31, scope: !12)
!74 = !MDLocation(line: 47, column: 38, scope: !12)
!75 = !MDLocation(line: 47, column: 3, scope: !12)
!76 = !MDLocation(line: 48, column: 18, scope: !12)
!77 = !MDLocation(line: 48, column: 3, scope: !12)
!78 = !MDLocation(line: 49, column: 3, scope: !12)
!79 = !{!"0x101\00dvec1\0016777227\000", !21, !13, !24} ; [ DW_TAG_arg_variable ] [dvec1] [line 11]
!80 = !MDLocation(line: 11, column: 48, scope: !21)
!81 = !{!"0x101\00dvec2\0033554444\000", !21, !13, !24} ; [ DW_TAG_arg_variable ] [dvec2] [line 12]
!82 = !MDLocation(line: 12, column: 48, scope: !21)
!83 = !{!"0x100\00i\0013\000", !21, !13, !40}     ; [ DW_TAG_auto_variable ] [i] [line 13]
!84 = !MDLocation(line: 13, column: 8, scope: !21)
!85 = !{!"0x100\00j\0013\000", !21, !13, !40}     ; [ DW_TAG_auto_variable ] [j] [line 13]
!86 = !MDLocation(line: 13, column: 11, scope: !21)
!87 = !MDLocation(line: 14, column: 7, scope: !88)
!88 = !{!"0xb\0014\003\003", !1, !21}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!89 = !MDLocation(line: 14, column: 14, scope: !90)
!90 = !{!"0xb\002", !1, !91}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!91 = !{!"0xb\001", !1, !92}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!92 = !{!"0xb\0014\003\004", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!93 = !MDLocation(line: 14, column: 3, scope: !88)
!94 = !MDLocation(line: 15, column: 9, scope: !95)
!95 = !{!"0xb\0015\005\005", !1, !92}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!96 = !MDLocation(line: 15, column: 16, scope: !97)
!97 = !{!"0xb\002", !1, !98}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!98 = !{!"0xb\001", !1, !99}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!99 = !{!"0xb\0015\005\006", !1, !95}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!100 = !MDLocation(line: 15, column: 5, scope: !95)
!101 = !MDLocation(line: 16, column: 25, scope: !99)
!102 = !MDLocation(line: 16, column: 19, scope: !99)
!103 = !MDLocation(line: 16, column: 13, scope: !99)
!104 = !MDLocation(line: 16, column: 7, scope: !99)
!105 = !MDLocation(line: 15, column: 26, scope: !99)
!106 = !MDLocation(line: 15, column: 5, scope: !99)
!107 = !MDLocation(line: 16, column: 26, scope: !95)
!108 = !MDLocation(line: 14, column: 30, scope: !92)
!109 = !MDLocation(line: 14, column: 3, scope: !92)
!110 = !MDLocation(line: 28, column: 1, scope: !21)
