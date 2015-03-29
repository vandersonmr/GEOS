; ModuleID = 'pi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @myadd(float* %sum, float* %addend) #0 {
entry:
  %sum.addr = alloca float*, align 8
  %addend.addr = alloca float*, align 8
  store float* %sum, float** %sum.addr, align 8
  call void @llvm.dbg.declare(metadata float** %sum.addr, metadata !22, metadata !23), !dbg !24
  store float* %addend, float** %addend.addr, align 8
  call void @llvm.dbg.declare(metadata float** %addend.addr, metadata !25, metadata !23), !dbg !26
  %0 = load float** %sum.addr, align 8, !dbg !27
  %1 = load float* %0, align 4, !dbg !28
  %2 = load float** %addend.addr, align 8, !dbg !29
  %3 = load float* %2, align 4, !dbg !30
  %add = fadd float %1, %3, !dbg !28
  %4 = load float** %sum.addr, align 8, !dbg !31
  store float %add, float* %4, align 4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %ztot = alloca float, align 4
  %yran = alloca float, align 4
  %ymult = alloca float, align 4
  %ymod = alloca float, align 4
  %x = alloca float, align 4
  %y = alloca float, align 4
  %z = alloca float, align 4
  %pi = alloca float, align 4
  %prod = alloca float, align 4
  %low = alloca i64, align 8
  %ixran = alloca i64, align 8
  %itot = alloca i64, align 8
  %j = alloca i64, align 8
  %iprod = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !34, metadata !23), !dbg !35
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !36, metadata !23), !dbg !37
  call void @llvm.dbg.declare(metadata float* %ztot, metadata !38, metadata !23), !dbg !39
  call void @llvm.dbg.declare(metadata float* %yran, metadata !40, metadata !23), !dbg !41
  call void @llvm.dbg.declare(metadata float* %ymult, metadata !42, metadata !23), !dbg !43
  call void @llvm.dbg.declare(metadata float* %ymod, metadata !44, metadata !23), !dbg !45
  call void @llvm.dbg.declare(metadata float* %x, metadata !46, metadata !23), !dbg !47
  call void @llvm.dbg.declare(metadata float* %y, metadata !48, metadata !23), !dbg !49
  call void @llvm.dbg.declare(metadata float* %z, metadata !50, metadata !23), !dbg !51
  call void @llvm.dbg.declare(metadata float* %pi, metadata !52, metadata !23), !dbg !53
  call void @llvm.dbg.declare(metadata float* %prod, metadata !54, metadata !23), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %low, metadata !56, metadata !23), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %ixran, metadata !58, metadata !23), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %itot, metadata !60, metadata !23), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %j, metadata !62, metadata !23), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %iprod, metadata !64, metadata !23), !dbg !65
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0)), !dbg !66
  store float 0.000000e+00, float* %ztot, align 4, !dbg !67
  store i64 1, i64* %low, align 8, !dbg !68
  store i64 1907, i64* %ixran, align 8, !dbg !69
  store float 5.813000e+03, float* %yran, align 4, !dbg !70
  store float 1.307000e+03, float* %ymult, align 4, !dbg !71
  store float 5.471000e+03, float* %ymod, align 4, !dbg !72
  store i64 40000000, i64* %itot, align 8, !dbg !73
  store i64 1, i64* %j, align 8, !dbg !74
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64* %j, align 8, !dbg !76
  %1 = load i64* %itot, align 8, !dbg !80
  %cmp = icmp sle i64 %0, %1, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %2 = load i64* %ixran, align 8, !dbg !83
  %mul = mul nsw i64 27611, %2, !dbg !85
  store i64 %mul, i64* %iprod, align 8, !dbg !86
  %3 = load i64* %iprod, align 8, !dbg !87
  %4 = load i64* %iprod, align 8, !dbg !88
  %div = sdiv i64 %4, 74383, !dbg !88
  %mul1 = mul nsw i64 74383, %div, !dbg !89
  %sub = sub nsw i64 %3, %mul1, !dbg !87
  store i64 %sub, i64* %ixran, align 8, !dbg !90
  %5 = load i64* %ixran, align 8, !dbg !91
  %conv = sitofp i64 %5 to float, !dbg !92
  %conv2 = fpext float %conv to double, !dbg !92
  %div3 = fdiv double %conv2, 7.438300e+04, !dbg !92
  %conv4 = fptrunc double %div3 to float, !dbg !92
  store float %conv4, float* %x, align 4, !dbg !93
  %6 = load float* %ymult, align 4, !dbg !94
  %7 = load float* %yran, align 4, !dbg !95
  %mul5 = fmul float %6, %7, !dbg !94
  store float %mul5, float* %prod, align 4, !dbg !96
  %8 = load float* %prod, align 4, !dbg !97
  %9 = load float* %ymod, align 4, !dbg !98
  %10 = load float* %prod, align 4, !dbg !99
  %11 = load float* %ymod, align 4, !dbg !100
  %div6 = fdiv float %10, %11, !dbg !99
  %conv7 = fptosi float %div6 to i64, !dbg !101
  %conv8 = sitofp i64 %conv7 to float, !dbg !101
  %mul9 = fmul float %9, %conv8, !dbg !98
  %sub10 = fsub float %8, %mul9, !dbg !97
  store float %sub10, float* %yran, align 4, !dbg !102
  %12 = load float* %yran, align 4, !dbg !103
  %13 = load float* %ymod, align 4, !dbg !104
  %div11 = fdiv float %12, %13, !dbg !103
  store float %div11, float* %y, align 4, !dbg !105
  %14 = load float* %x, align 4, !dbg !106
  %15 = load float* %x, align 4, !dbg !107
  %mul12 = fmul float %14, %15, !dbg !106
  %16 = load float* %y, align 4, !dbg !108
  %17 = load float* %y, align 4, !dbg !109
  %mul13 = fmul float %16, %17, !dbg !108
  %add = fadd float %mul12, %mul13, !dbg !106
  store float %add, float* %z, align 4, !dbg !110
  call void @myadd(float* %ztot, float* %z), !dbg !111
  %18 = load float* %z, align 4, !dbg !112
  %conv14 = fpext float %18 to double, !dbg !112
  %cmp15 = fcmp ole double %conv14, 1.000000e+00, !dbg !112
  br i1 %cmp15, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %for.body
  %19 = load i64* %low, align 8, !dbg !115
  %add17 = add nsw i64 %19, 1, !dbg !115
  store i64 %add17, i64* %low, align 8, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %if.end
  %20 = load i64* %j, align 8, !dbg !120
  %inc = add nsw i64 %20, 1, !dbg !120
  store i64 %inc, i64* %j, align 8, !dbg !120
  br label %for.cond, !dbg !121

for.end:                                          ; preds = %for.cond
  %21 = load float* %x, align 4, !dbg !122
  %conv18 = fpext float %21 to double, !dbg !122
  %22 = load float* %y, align 4, !dbg !123
  %conv19 = fpext float %22 to double, !dbg !123
  %23 = load i64* %low, align 8, !dbg !124
  %conv20 = trunc i64 %23 to i32, !dbg !125
  %24 = load i64* %j, align 8, !dbg !126
  %conv21 = trunc i64 %24 to i32, !dbg !127
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i32 0, i32 0), double %conv18, double %conv19, i32 %conv20, i32 %conv21), !dbg !128
  %25 = load i64* %low, align 8, !dbg !129
  %conv23 = sitofp i64 %25 to float, !dbg !130
  %conv24 = fpext float %conv23 to double, !dbg !130
  %mul25 = fmul double 4.000000e+00, %conv24, !dbg !131
  %26 = load i64* %itot, align 8, !dbg !132
  %conv26 = sitofp i64 %26 to float, !dbg !133
  %conv27 = fpext float %conv26 to double, !dbg !133
  %div28 = fdiv double %mul25, %conv27, !dbg !131
  %conv29 = fptrunc double %div28 to float, !dbg !131
  store float %conv29, float* %pi, align 4, !dbg !134
  %27 = load float* %pi, align 4, !dbg !135
  %conv30 = fpext float %27 to double, !dbg !135
  %28 = load float* %ztot, align 4, !dbg !136
  %conv31 = fpext float %28 to double, !dbg !136
  %mul32 = fmul double %conv31, 0.000000e+00, !dbg !136
  %29 = load i64* %itot, align 8, !dbg !137
  %conv33 = trunc i64 %29 to i32, !dbg !138
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str2, i32 0, i32 0), double %conv30, double %mul32, i32 %conv33), !dbg !139
  ret i32 0, !dbg !140
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c] [DW_LANG_C99]
!1 = !{!"pi.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!5 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !13}
!8 = !{!"0x2e\00myadd\00myadd\00\0012\000\001\000\000\00256\000\0012", !1, !9, !10, null, void (float*, float*)* @myadd, null, null, !2} ; [ DW_TAG_subprogram ] [line 12] [def] [myadd]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!13 = !{!"0x2e\00main\00main\00\0021\000\001\000\000\00256\000\0021", !1, !9, !14, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 21] [def] [main]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!6, !6, !16}
!16 = !{!"0xf\00\000\0064\0064\000\000", null, null, !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!18 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!19 = !{i32 2, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 2}
!21 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!22 = !{!"0x101\00sum\0016777228\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!23 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!24 = !MDLocation(line: 12, column: 19, scope: !8)
!25 = !{!"0x101\00addend\0033554444\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!26 = !MDLocation(line: 12, column: 30, scope: !8)
!27 = !MDLocation(line: 17, column: 15, scope: !8)
!28 = !MDLocation(line: 17, column: 14, scope: !8)
!29 = !MDLocation(line: 17, column: 22, scope: !8)
!30 = !MDLocation(line: 17, column: 21, scope: !8)
!31 = !MDLocation(line: 17, column: 8, scope: !8)
!32 = !MDLocation(line: 17, column: 7, scope: !8)
!33 = !MDLocation(line: 18, column: 1, scope: !8)
!34 = !{!"0x101\00argc\0016777237\000", !13, !9, !6} ; [ DW_TAG_arg_variable ] [argc] [line 21]
!35 = !MDLocation(line: 21, column: 14, scope: !13)
!36 = !{!"0x101\00argv\0033554453\000", !13, !9, !16} ; [ DW_TAG_arg_variable ] [argv] [line 21]
!37 = !MDLocation(line: 21, column: 26, scope: !13)
!38 = !{!"0x100\00ztot\0022\000", !13, !9, !5}    ; [ DW_TAG_auto_variable ] [ztot] [line 22]
!39 = !MDLocation(line: 22, column: 10, scope: !13)
!40 = !{!"0x100\00yran\0022\000", !13, !9, !5}    ; [ DW_TAG_auto_variable ] [yran] [line 22]
!41 = !MDLocation(line: 22, column: 16, scope: !13)
!42 = !{!"0x100\00ymult\0022\000", !13, !9, !5}   ; [ DW_TAG_auto_variable ] [ymult] [line 22]
!43 = !MDLocation(line: 22, column: 22, scope: !13)
!44 = !{!"0x100\00ymod\0022\000", !13, !9, !5}    ; [ DW_TAG_auto_variable ] [ymod] [line 22]
!45 = !MDLocation(line: 22, column: 29, scope: !13)
!46 = !{!"0x100\00x\0022\000", !13, !9, !5}       ; [ DW_TAG_auto_variable ] [x] [line 22]
!47 = !MDLocation(line: 22, column: 35, scope: !13)
!48 = !{!"0x100\00y\0022\000", !13, !9, !5}       ; [ DW_TAG_auto_variable ] [y] [line 22]
!49 = !MDLocation(line: 22, column: 38, scope: !13)
!50 = !{!"0x100\00z\0022\000", !13, !9, !5}       ; [ DW_TAG_auto_variable ] [z] [line 22]
!51 = !MDLocation(line: 22, column: 41, scope: !13)
!52 = !{!"0x100\00pi\0022\000", !13, !9, !5}      ; [ DW_TAG_auto_variable ] [pi] [line 22]
!53 = !MDLocation(line: 22, column: 44, scope: !13)
!54 = !{!"0x100\00prod\0022\000", !13, !9, !5}    ; [ DW_TAG_auto_variable ] [prod] [line 22]
!55 = !MDLocation(line: 22, column: 48, scope: !13)
!56 = !{!"0x100\00low\0023\000", !13, !9, !4}     ; [ DW_TAG_auto_variable ] [low] [line 23]
!57 = !MDLocation(line: 23, column: 13, scope: !13)
!58 = !{!"0x100\00ixran\0023\000", !13, !9, !4}   ; [ DW_TAG_auto_variable ] [ixran] [line 23]
!59 = !MDLocation(line: 23, column: 18, scope: !13)
!60 = !{!"0x100\00itot\0023\000", !13, !9, !4}    ; [ DW_TAG_auto_variable ] [itot] [line 23]
!61 = !MDLocation(line: 23, column: 25, scope: !13)
!62 = !{!"0x100\00j\0023\000", !13, !9, !4}       ; [ DW_TAG_auto_variable ] [j] [line 23]
!63 = !MDLocation(line: 23, column: 31, scope: !13)
!64 = !{!"0x100\00iprod\0023\000", !13, !9, !4}   ; [ DW_TAG_auto_variable ] [iprod] [line 23]
!65 = !MDLocation(line: 23, column: 34, scope: !13)
!66 = !MDLocation(line: 25, column: 7, scope: !13)
!67 = !MDLocation(line: 26, column: 7, scope: !13)
!68 = !MDLocation(line: 27, column: 7, scope: !13)
!69 = !MDLocation(line: 28, column: 7, scope: !13)
!70 = !MDLocation(line: 29, column: 7, scope: !13)
!71 = !MDLocation(line: 30, column: 7, scope: !13)
!72 = !MDLocation(line: 31, column: 7, scope: !13)
!73 = !MDLocation(line: 35, column: 7, scope: !13)
!74 = !MDLocation(line: 38, column: 11, scope: !75)
!75 = !{!"0xb\0038\007\000", !1, !13}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!76 = !MDLocation(line: 38, column: 16, scope: !77)
!77 = !{!"0xb\002", !1, !78}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!78 = !{!"0xb\001", !1, !79}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!79 = !{!"0xb\0038\007\001", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!80 = !MDLocation(line: 38, column: 19, scope: !79)
!81 = !MDLocation(line: 38, column: 16, scope: !79)
!82 = !MDLocation(line: 38, column: 7, scope: !75)
!83 = !MDLocation(line: 48, column: 25, scope: !84)
!84 = !{!"0xb\0038\0030\002", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!85 = !MDLocation(line: 48, column: 17, scope: !84)
!86 = !MDLocation(line: 48, column: 9, scope: !84)
!87 = !MDLocation(line: 49, column: 17, scope: !84)
!88 = !MDLocation(line: 49, column: 42, scope: !84)
!89 = !MDLocation(line: 49, column: 25, scope: !84)
!90 = !MDLocation(line: 49, column: 9, scope: !84)
!91 = !MDLocation(line: 50, column: 20, scope: !84)
!92 = !MDLocation(line: 50, column: 13, scope: !84)
!93 = !MDLocation(line: 50, column: 9, scope: !84)
!94 = !MDLocation(line: 51, column: 16, scope: !84)
!95 = !MDLocation(line: 51, column: 24, scope: !84)
!96 = !MDLocation(line: 51, column: 9, scope: !84)
!97 = !MDLocation(line: 52, column: 17, scope: !84)
!98 = !MDLocation(line: 52, column: 24, scope: !84)
!99 = !MDLocation(line: 52, column: 40, scope: !84)
!100 = !MDLocation(line: 52, column: 45, scope: !84)
!101 = !MDLocation(line: 52, column: 29, scope: !84)
!102 = !MDLocation(line: 52, column: 9, scope: !84)
!103 = !MDLocation(line: 53, column: 13, scope: !84)
!104 = !MDLocation(line: 53, column: 20, scope: !84)
!105 = !MDLocation(line: 53, column: 9, scope: !84)
!106 = !MDLocation(line: 54, column: 13, scope: !84)
!107 = !MDLocation(line: 54, column: 15, scope: !84)
!108 = !MDLocation(line: 54, column: 19, scope: !84)
!109 = !MDLocation(line: 54, column: 21, scope: !84)
!110 = !MDLocation(line: 54, column: 9, scope: !84)
!111 = !MDLocation(line: 55, column: 9, scope: !84)
!112 = !MDLocation(line: 56, column: 14, scope: !113)
!113 = !{!"0xb\0056\0014\003", !1, !84}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!114 = !MDLocation(line: 56, column: 14, scope: !84)
!115 = !MDLocation(line: 57, column: 17, scope: !116)
!116 = !{!"0xb\0056\0025\004", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!117 = !MDLocation(line: 57, column: 11, scope: !116)
!118 = !MDLocation(line: 58, column: 9, scope: !116)
!119 = !MDLocation(line: 59, column: 7, scope: !84)
!120 = !MDLocation(line: 38, column: 25, scope: !79)
!121 = !MDLocation(line: 38, column: 7, scope: !79)
!122 = !MDLocation(line: 60, column: 62, scope: !13)
!123 = !MDLocation(line: 60, column: 64, scope: !13)
!124 = !MDLocation(line: 60, column: 71, scope: !13)
!125 = !MDLocation(line: 60, column: 66, scope: !13)
!126 = !MDLocation(line: 60, column: 80, scope: !13)
!127 = !MDLocation(line: 60, column: 75, scope: !13)
!128 = !MDLocation(line: 60, column: 7, scope: !13)
!129 = !MDLocation(line: 61, column: 25, scope: !13)
!130 = !MDLocation(line: 61, column: 18, scope: !13)
!131 = !MDLocation(line: 61, column: 12, scope: !13)
!132 = !MDLocation(line: 61, column: 36, scope: !13)
!133 = !MDLocation(line: 61, column: 29, scope: !13)
!134 = !MDLocation(line: 61, column: 7, scope: !13)
!135 = !MDLocation(line: 62, column: 54, scope: !13)
!136 = !MDLocation(line: 62, column: 57, scope: !13)
!137 = !MDLocation(line: 62, column: 71, scope: !13)
!138 = !MDLocation(line: 62, column: 66, scope: !13)
!139 = !MDLocation(line: 62, column: 7, scope: !13)
!140 = !MDLocation(line: 63, column: 7, scope: !13)
