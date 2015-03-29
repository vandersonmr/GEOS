; ModuleID = 'recursive.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @ack(i32 %x, i32 %y) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !31, metadata !32), !dbg !33
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !34, metadata !32), !dbg !35
  %0 = load i32* %x.addr, align 4, !dbg !36
  %cmp = icmp eq i32 %0, 0, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %1 = load i32* %y.addr, align 4, !dbg !39
  %add = add nsw i32 %1, 1, !dbg !39
  store i32 %add, i32* %retval, !dbg !41
  br label %return, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load i32* %x.addr, align 4, !dbg !42
  %sub = sub nsw i32 %2, 1, !dbg !42
  %3 = load i32* %y.addr, align 4, !dbg !43
  %tobool = icmp ne i32 %3, 0, !dbg !44
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !44

cond.true:                                        ; preds = %if.end
  %4 = load i32* %x.addr, align 4, !dbg !45
  %5 = load i32* %y.addr, align 4, !dbg !47
  %sub1 = sub nsw i32 %5, 1, !dbg !47
  %call = call i32 @ack(i32 %4, i32 %sub1), !dbg !48
  br label %cond.end, !dbg !44

cond.false:                                       ; preds = %if.end
  br label %cond.end, !dbg !49

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1, %cond.false ], !dbg !44
  %call2 = call i32 @ack(i32 %sub, i32 %cond), !dbg !51
  store i32 %call2, i32* %retval, !dbg !54
  br label %return, !dbg !54

return:                                           ; preds = %cond.end, %if.then
  %6 = load i32* %retval, !dbg !55
  ret i32 %6, !dbg !55
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %n) #0 {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !56, metadata !32), !dbg !57
  %0 = load i32* %n.addr, align 4, !dbg !58
  %cmp = icmp slt i32 %0, 2, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, !dbg !61
  br label %return, !dbg !61

if.end:                                           ; preds = %entry
  %1 = load i32* %n.addr, align 4, !dbg !63
  %sub = sub nsw i32 %1, 2, !dbg !63
  %call = call i32 @fib(i32 %sub), !dbg !64
  %2 = load i32* %n.addr, align 4, !dbg !65
  %sub1 = sub nsw i32 %2, 1, !dbg !65
  %call2 = call i32 @fib(i32 %sub1), !dbg !66
  %add = add nsw i32 %call, %call2, !dbg !64
  store i32 %add, i32* %retval, !dbg !67
  br label %return, !dbg !67

return:                                           ; preds = %if.end, %if.then
  %3 = load i32* %retval, !dbg !68
  ret i32 %3, !dbg !68
}

; Function Attrs: nounwind uwtable
define double @fibFP(double %n) #0 {
entry:
  %retval = alloca double, align 8
  %n.addr = alloca double, align 8
  store double %n, double* %n.addr, align 8
  call void @llvm.dbg.declare(metadata double* %n.addr, metadata !69, metadata !32), !dbg !70
  %0 = load double* %n.addr, align 8, !dbg !71
  %cmp = fcmp olt double %0, 2.000000e+00, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  store double 1.000000e+00, double* %retval, !dbg !74
  br label %return, !dbg !74

if.end:                                           ; preds = %entry
  %1 = load double* %n.addr, align 8, !dbg !76
  %sub = fsub double %1, 2.000000e+00, !dbg !76
  %call = call double @fibFP(double %sub), !dbg !77
  %2 = load double* %n.addr, align 8, !dbg !78
  %sub1 = fsub double %2, 1.000000e+00, !dbg !78
  %call2 = call double @fibFP(double %sub1), !dbg !79
  %add = fadd double %call, %call2, !dbg !77
  store double %add, double* %retval, !dbg !80
  br label %return, !dbg !80

return:                                           ; preds = %if.end, %if.then
  %3 = load double* %retval, !dbg !81
  ret double %3, !dbg !81
}

; Function Attrs: nounwind uwtable
define i32 @tak(i32 %x, i32 %y, i32 %z) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !82, metadata !32), !dbg !83
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !84, metadata !32), !dbg !85
  store i32 %z, i32* %z.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %z.addr, metadata !86, metadata !32), !dbg !87
  %0 = load i32* %y.addr, align 4, !dbg !88
  %1 = load i32* %x.addr, align 4, !dbg !90
  %cmp = icmp slt i32 %0, %1, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  %2 = load i32* %x.addr, align 4, !dbg !92
  %sub = sub nsw i32 %2, 1, !dbg !92
  %3 = load i32* %y.addr, align 4, !dbg !94
  %4 = load i32* %z.addr, align 4, !dbg !95
  %call = call i32 @tak(i32 %sub, i32 %3, i32 %4), !dbg !96
  %5 = load i32* %y.addr, align 4, !dbg !97
  %sub1 = sub nsw i32 %5, 1, !dbg !97
  %6 = load i32* %z.addr, align 4, !dbg !98
  %7 = load i32* %x.addr, align 4, !dbg !99
  %call2 = call i32 @tak(i32 %sub1, i32 %6, i32 %7), !dbg !100
  %8 = load i32* %z.addr, align 4, !dbg !101
  %sub3 = sub nsw i32 %8, 1, !dbg !101
  %9 = load i32* %x.addr, align 4, !dbg !102
  %10 = load i32* %y.addr, align 4, !dbg !103
  %call4 = call i32 @tak(i32 %sub3, i32 %9, i32 %10), !dbg !104
  %call5 = call i32 @tak(i32 %call, i32 %call2, i32 %call4), !dbg !105
  store i32 %call5, i32* %retval, !dbg !106
  br label %return, !dbg !106

if.end:                                           ; preds = %entry
  %11 = load i32* %z.addr, align 4, !dbg !107
  store i32 %11, i32* %retval, !dbg !108
  br label %return, !dbg !108

return:                                           ; preds = %if.end, %if.then
  %12 = load i32* %retval, !dbg !109
  ret i32 %12, !dbg !109
}

; Function Attrs: nounwind uwtable
define double @takFP(double %x, double %y, double %z) #0 {
entry:
  %retval = alloca double, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %z.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !110, metadata !32), !dbg !111
  store double %y, double* %y.addr, align 8
  call void @llvm.dbg.declare(metadata double* %y.addr, metadata !112, metadata !32), !dbg !113
  store double %z, double* %z.addr, align 8
  call void @llvm.dbg.declare(metadata double* %z.addr, metadata !114, metadata !32), !dbg !115
  %0 = load double* %y.addr, align 8, !dbg !116
  %1 = load double* %x.addr, align 8, !dbg !118
  %cmp = fcmp olt double %0, %1, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %2 = load double* %x.addr, align 8, !dbg !120
  %sub = fsub double %2, 1.000000e+00, !dbg !120
  %3 = load double* %y.addr, align 8, !dbg !121
  %4 = load double* %z.addr, align 8, !dbg !122
  %call = call double @takFP(double %sub, double %3, double %4), !dbg !123
  %5 = load double* %y.addr, align 8, !dbg !124
  %sub1 = fsub double %5, 1.000000e+00, !dbg !124
  %6 = load double* %z.addr, align 8, !dbg !125
  %7 = load double* %x.addr, align 8, !dbg !126
  %call2 = call double @takFP(double %sub1, double %6, double %7), !dbg !127
  %8 = load double* %z.addr, align 8, !dbg !128
  %sub3 = fsub double %8, 1.000000e+00, !dbg !128
  %9 = load double* %x.addr, align 8, !dbg !129
  %10 = load double* %y.addr, align 8, !dbg !130
  %call4 = call double @takFP(double %sub3, double %9, double %10), !dbg !131
  %call5 = call double @takFP(double %call, double %call2, double %call4), !dbg !132
  store double %call5, double* %retval, !dbg !133
  br label %return, !dbg !133

if.end:                                           ; preds = %entry
  %11 = load double* %z.addr, align 8, !dbg !134
  store double %11, double* %retval, !dbg !135
  br label %return, !dbg !135

return:                                           ; preds = %if.end, %if.then
  %12 = load double* %retval, !dbg !136
  ret double %12, !dbg !136
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !137, metadata !32), !dbg !138
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !139, metadata !32), !dbg !140
  call void @llvm.dbg.declare(metadata i32* %n, metadata !141, metadata !32), !dbg !142
  store i32 10, i32* %n, align 4, !dbg !142
  %0 = load i32* %n, align 4, !dbg !143
  %add = add nsw i32 %0, 1, !dbg !143
  %1 = load i32* %n, align 4, !dbg !144
  %add1 = add nsw i32 %1, 1, !dbg !144
  %call = call i32 @ack(i32 3, i32 %add1), !dbg !145
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %add, i32 %call), !dbg !146
  %2 = load i32* %n, align 4, !dbg !147
  %conv = sitofp i32 %2 to double, !dbg !147
  %add3 = fadd double 2.800000e+01, %conv, !dbg !148
  %3 = load i32* %n, align 4, !dbg !149
  %conv4 = sitofp i32 %3 to double, !dbg !149
  %add5 = fadd double 2.800000e+01, %conv4, !dbg !150
  %call6 = call double @fibFP(double %add5), !dbg !151
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0), double %add3, double %call6), !dbg !152
  %4 = load i32* %n, align 4, !dbg !153
  %mul = mul nsw i32 3, %4, !dbg !154
  %5 = load i32* %n, align 4, !dbg !155
  %mul8 = mul nsw i32 2, %5, !dbg !156
  %6 = load i32* %n, align 4, !dbg !157
  %7 = load i32* %n, align 4, !dbg !158
  %mul9 = mul nsw i32 3, %7, !dbg !159
  %8 = load i32* %n, align 4, !dbg !160
  %mul10 = mul nsw i32 2, %8, !dbg !161
  %9 = load i32* %n, align 4, !dbg !162
  %call11 = call i32 @tak(i32 %mul9, i32 %mul10, i32 %9), !dbg !163
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 %mul, i32 %mul8, i32 %6, i32 %call11), !dbg !164
  %call13 = call i32 @fib(i32 3), !dbg !165
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i32 %call13), !dbg !166
  %call15 = call double @takFP(double 3.000000e+00, double 2.000000e+00, double 1.000000e+00), !dbg !167
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str4, i32 0, i32 0), double %call15), !dbg !168
  ret i32 0, !dbg !169
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c] [DW_LANG_C99]
!1 = !{!"recursive.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9, !12, !16, !19, !22}
!4 = !{!"0x2e\00ack\00ack\00\0010\000\001\000\000\00256\000\0010", !1, !5, !6, null, i32 (i32, i32)* @ack, null, null, !2} ; [ DW_TAG_subprogram ] [line 10] [def] [ack]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !8}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0x2e\00fib\00fib\00\0018\000\001\000\000\00256\000\0018", !1, !5, !10, null, i32 (i32)* @fib, null, null, !2} ; [ DW_TAG_subprogram ] [line 18] [def] [fib]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!8, !8}
!12 = !{!"0x2e\00fibFP\00fibFP\00\0025\000\001\000\000\00256\000\0025", !1, !5, !13, null, double (double)* @fibFP, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [fibFP]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!15, !15}
!15 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!16 = !{!"0x2e\00tak\00tak\00\0032\000\001\000\000\00256\000\0032", !1, !5, !17, null, i32 (i32, i32, i32)* @tak, null, null, !2} ; [ DW_TAG_subprogram ] [line 32] [def] [tak]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!8, !8, !8, !8}
!19 = !{!"0x2e\00takFP\00takFP\00\0039\000\001\000\000\00256\000\0039", !1, !5, !20, null, double (double, double, double)* @takFP, null, null, !2} ; [ DW_TAG_subprogram ] [line 39] [def] [takFP]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!15, !15, !15, !15}
!22 = !{!"0x2e\00main\00main\00\0045\000\001\000\000\00256\000\0045", !1, !5, !23, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 45] [def] [main]
!23 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !24, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = !{!8, !8, !25}
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !26} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!27 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = !{i32 2, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 2}
!30 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!31 = !{!"0x101\00x\0016777226\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [x] [line 10]
!32 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!33 = !MDLocation(line: 10, column: 13, scope: !4)
!34 = !{!"0x101\00y\0033554442\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [y] [line 10]
!35 = !MDLocation(line: 10, column: 20, scope: !4)
!36 = !MDLocation(line: 11, column: 7, scope: !37)
!37 = !{!"0xb\0011\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!38 = !MDLocation(line: 11, column: 7, scope: !4)
!39 = !MDLocation(line: 12, column: 12, scope: !40)
!40 = !{!"0xb\0011\0015\001", !1, !37}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!41 = !MDLocation(line: 12, column: 5, scope: !40)
!42 = !MDLocation(line: 15, column: 14, scope: !4)
!43 = !MDLocation(line: 15, column: 23, scope: !4)
!44 = !MDLocation(line: 15, column: 22, scope: !4)
!45 = !MDLocation(line: 15, column: 36, scope: !46)
!46 = !{!"0xb\001", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!47 = !MDLocation(line: 15, column: 39, scope: !4)
!48 = !MDLocation(line: 15, column: 32, scope: !4)
!49 = !MDLocation(line: 15, column: 22, scope: !50)
!50 = !{!"0xb\002", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!51 = !MDLocation(line: 15, column: 10, scope: !52)
!52 = !{!"0xb\004", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!53 = !{!"0xb\003", !1, !4}                       ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!54 = !MDLocation(line: 15, column: 3, scope: !4)
!55 = !MDLocation(line: 16, column: 1, scope: !4)
!56 = !{!"0x101\00n\0016777234\000", !9, !5, !8}  ; [ DW_TAG_arg_variable ] [n] [line 18]
!57 = !MDLocation(line: 18, column: 13, scope: !9)
!58 = !MDLocation(line: 19, column: 7, scope: !59)
!59 = !{!"0xb\0019\007\002", !1, !9}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!60 = !MDLocation(line: 19, column: 7, scope: !9)
!61 = !MDLocation(line: 20, column: 5, scope: !62)
!62 = !{!"0xb\0019\0014\003", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!63 = !MDLocation(line: 22, column: 14, scope: !9)
!64 = !MDLocation(line: 22, column: 10, scope: !9)
!65 = !MDLocation(line: 22, column: 27, scope: !9)
!66 = !MDLocation(line: 22, column: 23, scope: !9)
!67 = !MDLocation(line: 22, column: 3, scope: !9)
!68 = !MDLocation(line: 23, column: 1, scope: !9)
!69 = !{!"0x101\00n\0016777241\000", !12, !5, !15} ; [ DW_TAG_arg_variable ] [n] [line 25]
!70 = !MDLocation(line: 25, column: 21, scope: !12)
!71 = !MDLocation(line: 26, column: 7, scope: !72)
!72 = !{!"0xb\0026\007\004", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!73 = !MDLocation(line: 26, column: 7, scope: !12)
!74 = !MDLocation(line: 27, column: 5, scope: !75)
!75 = !{!"0xb\0026\0016\005", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!76 = !MDLocation(line: 29, column: 16, scope: !12)
!77 = !MDLocation(line: 29, column: 10, scope: !12)
!78 = !MDLocation(line: 29, column: 33, scope: !12)
!79 = !MDLocation(line: 29, column: 27, scope: !12)
!80 = !MDLocation(line: 29, column: 3, scope: !12)
!81 = !MDLocation(line: 30, column: 1, scope: !12)
!82 = !{!"0x101\00x\0016777248\000", !16, !5, !8} ; [ DW_TAG_arg_variable ] [x] [line 32]
!83 = !MDLocation(line: 32, column: 13, scope: !16)
!84 = !{!"0x101\00y\0033554464\000", !16, !5, !8} ; [ DW_TAG_arg_variable ] [y] [line 32]
!85 = !MDLocation(line: 32, column: 20, scope: !16)
!86 = !{!"0x101\00z\0050331680\000", !16, !5, !8} ; [ DW_TAG_arg_variable ] [z] [line 32]
!87 = !MDLocation(line: 32, column: 27, scope: !16)
!88 = !MDLocation(line: 33, column: 7, scope: !89)
!89 = !{!"0xb\0033\007\006", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!90 = !MDLocation(line: 33, column: 11, scope: !89)
!91 = !MDLocation(line: 33, column: 7, scope: !16)
!92 = !MDLocation(line: 34, column: 20, scope: !93)
!93 = !{!"0xb\0033\0014\007", !1, !89}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!94 = !MDLocation(line: 34, column: 27, scope: !93)
!95 = !MDLocation(line: 34, column: 30, scope: !93)
!96 = !MDLocation(line: 34, column: 16, scope: !93)
!97 = !MDLocation(line: 34, column: 38, scope: !93)
!98 = !MDLocation(line: 34, column: 45, scope: !93)
!99 = !MDLocation(line: 34, column: 48, scope: !93)
!100 = !MDLocation(line: 34, column: 34, scope: !93)
!101 = !MDLocation(line: 34, column: 56, scope: !93)
!102 = !MDLocation(line: 34, column: 63, scope: !93)
!103 = !MDLocation(line: 34, column: 66, scope: !93)
!104 = !MDLocation(line: 34, column: 52, scope: !93)
!105 = !MDLocation(line: 34, column: 12, scope: !93)
!106 = !MDLocation(line: 34, column: 5, scope: !93)
!107 = !MDLocation(line: 36, column: 10, scope: !16)
!108 = !MDLocation(line: 36, column: 3, scope: !16)
!109 = !MDLocation(line: 37, column: 1, scope: !16)
!110 = !{!"0x101\00x\0016777255\000", !19, !5, !15} ; [ DW_TAG_arg_variable ] [x] [line 39]
!111 = !MDLocation(line: 39, column: 21, scope: !19)
!112 = !{!"0x101\00y\0033554471\000", !19, !5, !15} ; [ DW_TAG_arg_variable ] [y] [line 39]
!113 = !MDLocation(line: 39, column: 31, scope: !19)
!114 = !{!"0x101\00z\0050331687\000", !19, !5, !15} ; [ DW_TAG_arg_variable ] [z] [line 39]
!115 = !MDLocation(line: 39, column: 41, scope: !19)
!116 = !MDLocation(line: 40, column: 9, scope: !117)
!117 = !{!"0xb\0040\009\008", !1, !19}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/recursive.c]
!118 = !MDLocation(line: 40, column: 13, scope: !117)
!119 = !MDLocation(line: 40, column: 9, scope: !19)
!120 = !MDLocation(line: 41, column: 29, scope: !117)
!121 = !MDLocation(line: 41, column: 36, scope: !117)
!122 = !MDLocation(line: 41, column: 39, scope: !117)
!123 = !MDLocation(line: 41, column: 23, scope: !117)
!124 = !MDLocation(line: 41, column: 49, scope: !117)
!125 = !MDLocation(line: 41, column: 56, scope: !117)
!126 = !MDLocation(line: 41, column: 59, scope: !117)
!127 = !MDLocation(line: 41, column: 43, scope: !117)
!128 = !MDLocation(line: 41, column: 69, scope: !117)
!129 = !MDLocation(line: 41, column: 76, scope: !117)
!130 = !MDLocation(line: 41, column: 79, scope: !117)
!131 = !MDLocation(line: 41, column: 63, scope: !117)
!132 = !MDLocation(line: 41, column: 16, scope: !117)
!133 = !MDLocation(line: 41, column: 9, scope: !117)
!134 = !MDLocation(line: 42, column: 12, scope: !19)
!135 = !MDLocation(line: 42, column: 5, scope: !19)
!136 = !MDLocation(line: 43, column: 1, scope: !19)
!137 = !{!"0x101\00argc\0016777261\000", !22, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 45]
!138 = !MDLocation(line: 45, column: 14, scope: !22)
!139 = !{!"0x101\00argv\0033554477\000", !22, !5, !25} ; [ DW_TAG_arg_variable ] [argv] [line 45]
!140 = !MDLocation(line: 45, column: 28, scope: !22)
!141 = !{!"0x100\00n\0046\000", !22, !5, !8}      ; [ DW_TAG_auto_variable ] [n] [line 46]
!142 = !MDLocation(line: 46, column: 7, scope: !22)
!143 = !MDLocation(line: 48, column: 29, scope: !22)
!144 = !MDLocation(line: 48, column: 43, scope: !22)
!145 = !MDLocation(line: 48, column: 36, scope: !22)
!146 = !MDLocation(line: 48, column: 3, scope: !22)
!147 = !MDLocation(line: 49, column: 38, scope: !22)
!148 = !MDLocation(line: 49, column: 31, scope: !22)
!149 = !MDLocation(line: 49, column: 52, scope: !22)
!150 = !MDLocation(line: 49, column: 47, scope: !22)
!151 = !MDLocation(line: 49, column: 41, scope: !22)
!152 = !MDLocation(line: 49, column: 3, scope: !22)
!153 = !MDLocation(line: 50, column: 37, scope: !22)
!154 = !MDLocation(line: 50, column: 33, scope: !22)
!155 = !MDLocation(line: 50, column: 44, scope: !22)
!156 = !MDLocation(line: 50, column: 40, scope: !22)
!157 = !MDLocation(line: 50, column: 47, scope: !22)
!158 = !MDLocation(line: 50, column: 56, scope: !22)
!159 = !MDLocation(line: 50, column: 54, scope: !22)
!160 = !MDLocation(line: 50, column: 61, scope: !22)
!161 = !MDLocation(line: 50, column: 59, scope: !22)
!162 = !MDLocation(line: 50, column: 64, scope: !22)
!163 = !MDLocation(line: 50, column: 50, scope: !22)
!164 = !MDLocation(line: 50, column: 3, scope: !22)
!165 = !MDLocation(line: 51, column: 26, scope: !22)
!166 = !MDLocation(line: 51, column: 3, scope: !22)
!167 = !MDLocation(line: 52, column: 38, scope: !22)
!168 = !MDLocation(line: 52, column: 3, scope: !22)
!169 = !MDLocation(line: 54, column: 3, scope: !22)
