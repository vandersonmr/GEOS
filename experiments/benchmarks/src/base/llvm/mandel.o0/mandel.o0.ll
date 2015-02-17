; ModuleID = 'mandel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@accum = common global { double, double } zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @emit(double %X.coerce0, double %X.coerce1) #0 {
entry:
  %X = alloca { double, double }, align 8
  %0 = getelementptr { double, double }* %X, i32 0, i32 0
  store double %X.coerce0, double* %0
  %1 = getelementptr { double, double }* %X, i32 0, i32 1
  store double %X.coerce1, double* %1
  call void @llvm.dbg.declare(metadata { double, double }* %X, metadata !29, metadata !30), !dbg !31
  %X.realp = getelementptr inbounds { double, double }* %X, i32 0, i32 0, !dbg !32
  %X.real = load double* %X.realp, align 8, !dbg !32
  %X.imagp = getelementptr inbounds { double, double }* %X, i32 0, i32 1, !dbg !32
  %X.imag = load double* %X.imagp, align 8, !dbg !32
  %accum.real = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !32
  %accum.imag = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !32
  %add.r = fadd double %accum.real, %X.real, !dbg !32
  %add.i = fadd double %accum.imag, %X.imag, !dbg !32
  store volatile double %add.r, double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !32
  store volatile double %add.i, double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @mandel() #0 {
entry:
  %__x.addr.i = alloca double, align 8
  %__y.addr.i = alloca double, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  %c = alloca { double, double }, align 8
  %z = alloca { double, double }, align 8
  %coerce = alloca { double, double }, align 8
  call void @llvm.dbg.declare(metadata i32* %x, metadata !34, metadata !30), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %y, metadata !36, metadata !30), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %n, metadata !38, metadata !30), !dbg !39
  store i32 0, i32* %x, align 4, !dbg !40
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc34, %entry
  %0 = load i32* %x, align 4, !dbg !42
  %cmp = icmp slt i32 %0, 5000, !dbg !42
  br i1 %cmp, label %for.body, label %for.end36, !dbg !46

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4, !dbg !47
  br label %for.cond1, !dbg !47

for.cond1:                                        ; preds = %for.inc31, %for.body
  %1 = load i32* %y, align 4, !dbg !50
  %cmp2 = icmp slt i32 %1, 5000, !dbg !50
  br i1 %cmp2, label %for.body3, label %for.end33, !dbg !54

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata { double, double }* %c, metadata !55, metadata !30), !dbg !57
  %2 = load i32* %x, align 4, !dbg !58
  %conv = sitofp i32 %2 to double, !dbg !58
  %mul = fmul double %conv, 4.000000e+00, !dbg !58
  %div = fdiv double %mul, 5.000000e+03, !dbg !58
  %add = fadd double -2.000000e+00, %div, !dbg !59
  %3 = load i32* %y, align 4, !dbg !60
  %conv4 = sitofp i32 %3 to double, !dbg !60
  %mul5 = fmul double %conv4, 4.000000e+00, !dbg !60
  %div6 = fdiv double %mul5, 5.000000e+03, !dbg !60
  %sub = fsub double -2.000000e+00, %div6, !dbg !61
  %mul.rl = fmul double %sub, 0.000000e+00, !dbg !57
  %mul.ir = fmul double %sub, 1.000000e+00, !dbg !57
  %add.r = fadd double %add, %mul.rl, !dbg !57
  %real = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !57
  %imag = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !57
  store double %add.r, double* %real, align 8, !dbg !57
  store double %mul.ir, double* %imag, align 8, !dbg !57
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !62, metadata !30), !dbg !63
  %real7 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !63
  %imag8 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !63
  store double 0.000000e+00, double* %real7, align 8, !dbg !63
  store double 0.000000e+00, double* %imag8, align 8, !dbg !63
  store i32 0, i32* %n, align 4, !dbg !64
  br label %for.cond9, !dbg !64

for.cond9:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %n, align 4, !dbg !66
  %cmp10 = icmp slt i32 %4, 10, !dbg !66
  br i1 %cmp10, label %for.body12, label %for.end, !dbg !70

for.body12:                                       ; preds = %for.cond9
  %z.realp = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !71
  %z.real = load double* %z.realp, align 8, !dbg !71
  %z.imagp = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !71
  %z.imag = load double* %z.imagp, align 8, !dbg !71
  %z.realp13 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !71
  %z.real14 = load double* %z.realp13, align 8, !dbg !71
  %z.imagp15 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !71
  %z.imag16 = load double* %z.imagp15, align 8, !dbg !71
  %mul_ac = fmul double %z.real, %z.real14, !dbg !71
  %mul_bd = fmul double %z.imag, %z.imag16, !dbg !71
  %mul_ad = fmul double %z.real, %z.imag16, !dbg !71
  %mul_bc = fmul double %z.imag, %z.real14, !dbg !71
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !71
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !71
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !71
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !71, !prof !73

complex_mul_imag_nan:                             ; preds = %for.body12
  %isnan_cmp17 = fcmp uno double %mul_i, %mul_i, !dbg !74
  br i1 %isnan_cmp17, label %complex_mul_libcall, label %complex_mul_cont, !dbg !74, !prof !73

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call = call { double, double } @__muldc3(double %z.real, double %z.imag, double %z.real14, double %z.imag16) #4, !dbg !76
  %5 = extractvalue { double, double } %call, 0, !dbg !76
  %6 = extractvalue { double, double } %call, 1, !dbg !76
  br label %complex_mul_cont, !dbg !76

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %for.body12
  %real_mul_phi = phi double [ %mul_r, %for.body12 ], [ %mul_r, %complex_mul_imag_nan ], [ %5, %complex_mul_libcall ], !dbg !71
  %imag_mul_phi = phi double [ %mul_i, %for.body12 ], [ %mul_i, %complex_mul_imag_nan ], [ %6, %complex_mul_libcall ], !dbg !71
  %c.realp = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !78
  %c.real = load double* %c.realp, align 8, !dbg !78
  %c.imagp = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !78
  %c.imag = load double* %c.imagp, align 8, !dbg !78
  %add.r18 = fadd double %real_mul_phi, %c.real, !dbg !78
  %add.i = fadd double %imag_mul_phi, %c.imag, !dbg !78
  %real19 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !78
  %imag20 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !78
  store double %add.r18, double* %real19, align 8, !dbg !78
  store double %add.i, double* %imag20, align 8, !dbg !78
  %idx = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !82
  %7 = load double* %idx, !dbg !82
  %idx21 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !82
  %8 = load double* %idx21, !dbg !82
  store double %7, double* %__x.addr.i, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata double* %__x.addr.i, metadata !84, metadata !30) #4, !dbg !85
  store double %8, double* %__y.addr.i, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata double* %__y.addr.i, metadata !86, metadata !30) #4, !dbg !87
  %9 = load double* %__x.addr.i, align 8, !dbg !88
  %10 = load double* %__y.addr.i, align 8, !dbg !89
  %call.i = call double @hypot(double %9, double %10) #4, !dbg !90
  %cmp23 = fcmp oge double %call.i, 2.000000e+00, !dbg !82
  br i1 %cmp23, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %complex_mul_cont
  br label %for.end, !dbg !92

if.end:                                           ; preds = %complex_mul_cont
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %if.end
  %11 = load i32* %n, align 4, !dbg !94
  %inc = add nsw i32 %11, 1, !dbg !94
  store i32 %inc, i32* %n, align 4, !dbg !94
  br label %for.cond9, !dbg !95

for.end:                                          ; preds = %if.then, %for.cond9
  %z.realp25 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !96
  %z.real26 = load double* %z.realp25, align 8, !dbg !96
  %z.imagp27 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !96
  %z.imag28 = load double* %z.imagp27, align 8, !dbg !96
  %real29 = getelementptr inbounds { double, double }* %coerce, i32 0, i32 0, !dbg !96
  %imag30 = getelementptr inbounds { double, double }* %coerce, i32 0, i32 1, !dbg !96
  store double %z.real26, double* %real29, align 8, !dbg !96
  store double %z.imag28, double* %imag30, align 8, !dbg !96
  %12 = getelementptr { double, double }* %coerce, i32 0, i32 0, !dbg !96
  %13 = load double* %12, align 1, !dbg !96
  %14 = getelementptr { double, double }* %coerce, i32 0, i32 1, !dbg !96
  %15 = load double* %14, align 1, !dbg !96
  call void @emit(double %13, double %15), !dbg !96
  br label %for.inc31, !dbg !97

for.inc31:                                        ; preds = %for.end
  %16 = load i32* %y, align 4, !dbg !98
  %inc32 = add nsw i32 %16, 1, !dbg !98
  store i32 %inc32, i32* %y, align 4, !dbg !98
  br label %for.cond1, !dbg !99

for.end33:                                        ; preds = %for.cond1
  br label %for.inc34, !dbg !100

for.inc34:                                        ; preds = %for.end33
  %17 = load i32* %x, align 4, !dbg !101
  %inc35 = add nsw i32 %17, 1, !dbg !101
  store i32 %inc35, i32* %x, align 4, !dbg !101
  br label %for.cond, !dbg !102

for.end36:                                        ; preds = %for.cond
  ret void, !dbg !103
}

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @mandel(), !dbg !104
  %accum.real = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 0), align 8, !dbg !105
  %accum.imag = load volatile double* getelementptr inbounds ({ double, double }* @accum, i32 0, i32 1), align 8, !dbg !105
  %conv = fptosi double %accum.real to i32, !dbg !106
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !107
  ret i32 0, !dbg !108
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare double @hypot(double, double) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!26, !27}
!llvm.ident = !{!28}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !6, !23, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c] [DW_LANG_C99]
!1 = !{!"mandel.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!7, !12, !15, !18}
!7 = !{!"0x2e\00emit\00emit\00\0025\000\001\000\000\00256\000\0025", !1, !8, !9, null, void (double, double)* @emit, null, null, !2} ; [ DW_TAG_subprogram ] [line 25] [def] [emit]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{null, !11}
!11 = !{!"0x24\00complex\000\00128\0064\000\000\003", null, null} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!12 = !{!"0x2e\00mandel\00mandel\00\0029\000\001\000\000\000\000\0029", !1, !8, !13, null, void ()* @mandel, null, null, !2} ; [ DW_TAG_subprogram ] [line 29] [def] [mandel]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null}
!15 = !{!"0x2e\00main\00main\00\0046\000\001\000\000\000\000\0046", !1, !8, !16, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 46] [def] [main]
!16 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !17, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!5}
!18 = !{!"0x2e\00__tg_hypot\00__tg_hypot\00_ZL10__tg_hypotdd\00833\001\001\000\000\00256\000\00833", !19, !20, !21, null, null, null, null, !2} ; [ DW_TAG_subprogram ] [line 833] [local] [def] [__tg_hypot]
!19 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/tgmath.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!20 = !{!"0x29", !19}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/local/bin/../lib/clang/3.6.0/include/tgmath.h]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!4, !4, !4}
!23 = !{!24}
!24 = !{!"0x34\00accum\00accum\00\0024\000\001", null, !8, !25, { double, double }* @accum, null} ; [ DW_TAG_variable ] [accum] [line 24] [def]
!25 = !{!"0x35\00\000\000\000\000\000", null, null, !11} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from complex]
!26 = !{i32 2, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 2}
!28 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!29 = !{!"0x101\00X\0016777241\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [X] [line 25]
!30 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!31 = !MDLocation(line: 25, column: 30, scope: !7)
!32 = !MDLocation(line: 26, column: 3, scope: !7)
!33 = !MDLocation(line: 27, column: 1, scope: !7)
!34 = !{!"0x100\00x\0030\000", !12, !8, !5}       ; [ DW_TAG_auto_variable ] [x] [line 30]
!35 = !MDLocation(line: 30, column: 7, scope: !12)
!36 = !{!"0x100\00y\0030\000", !12, !8, !5}       ; [ DW_TAG_auto_variable ] [y] [line 30]
!37 = !MDLocation(line: 30, column: 10, scope: !12)
!38 = !{!"0x100\00n\0030\000", !12, !8, !5}       ; [ DW_TAG_auto_variable ] [n] [line 30]
!39 = !MDLocation(line: 30, column: 13, scope: !12)
!40 = !MDLocation(line: 31, column: 8, scope: !41)
!41 = !{!"0xb\0031\003\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!42 = !MDLocation(line: 31, column: 15, scope: !43)
!43 = !{!"0xb\002", !1, !44}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!44 = !{!"0xb\001", !1, !45}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!45 = !{!"0xb\0031\003\001", !1, !41}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!46 = !MDLocation(line: 31, column: 3, scope: !41)
!47 = !MDLocation(line: 32, column: 10, scope: !48)
!48 = !{!"0xb\0032\005\003", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!49 = !{!"0xb\0031\0036\002", !1, !45}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!50 = !MDLocation(line: 32, column: 17, scope: !51)
!51 = !{!"0xb\002", !1, !52}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!52 = !{!"0xb\001", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!53 = !{!"0xb\0032\005\004", !1, !48}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!54 = !MDLocation(line: 32, column: 5, scope: !48)
!55 = !{!"0x100\00c\0033\000", !56, !8, !11}      ; [ DW_TAG_auto_variable ] [c] [line 33]
!56 = !{!"0xb\0032\0038\005", !1, !53}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!57 = !MDLocation(line: 33, column: 26, scope: !56)
!58 = !MDLocation(line: 33, column: 39, scope: !56)
!59 = !MDLocation(line: 33, column: 31, scope: !56)
!60 = !MDLocation(line: 33, column: 58, scope: !56)
!61 = !MDLocation(line: 33, column: 50, scope: !56)
!62 = !{!"0x100\00z\0034\000", !56, !8, !11}      ; [ DW_TAG_auto_variable ] [z] [line 34]
!63 = !MDLocation(line: 34, column: 26, scope: !56)
!64 = !MDLocation(line: 36, column: 12, scope: !65)
!65 = !{!"0xb\0036\007\006", !1, !56}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!66 = !MDLocation(line: 36, column: 19, scope: !67)
!67 = !{!"0xb\002", !1, !68}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!68 = !{!"0xb\001", !1, !69}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!69 = !{!"0xb\0036\007\007", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!70 = !MDLocation(line: 36, column: 7, scope: !65)
!71 = !MDLocation(line: 37, column: 9, scope: !72)
!72 = !{!"0xb\0036\0038\008", !1, !69}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!73 = !{!"branch_weights", i32 1, i32 1048575}
!74 = !MDLocation(line: 37, column: 9, scope: !75)
!75 = !{!"0xb\001", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!76 = !MDLocation(line: 37, column: 9, scope: !77)
!77 = !{!"0xb\003", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!78 = !MDLocation(line: 37, column: 9, scope: !79)
!79 = !{!"0xb\005", !1, !80}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!80 = !{!"0xb\004", !1, !81}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!81 = !{!"0xb\002", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!82 = !MDLocation(line: 38, column: 13, scope: !83)
!83 = !{!"0xb\0038\0013\009", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!84 = !{!"0x101\00__x\0016778049\000", !18, !20, !4, !82} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!85 = !MDLocation(line: 833, column: 23, scope: !18, inlinedAt: !82)
!86 = !{!"0x101\00__y\0033555265\000", !18, !20, !4, !82} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!87 = !MDLocation(line: 833, column: 35, scope: !18, inlinedAt: !82)
!88 = !MDLocation(line: 833, column: 54, scope: !18, inlinedAt: !82)
!89 = !MDLocation(line: 833, column: 59, scope: !18, inlinedAt: !82)
!90 = !MDLocation(line: 833, column: 48, scope: !18, inlinedAt: !82)
!91 = !MDLocation(line: 38, column: 13, scope: !72)
!92 = !MDLocation(line: 39, column: 11, scope: !83)
!93 = !MDLocation(line: 40, column: 7, scope: !72)
!94 = !MDLocation(line: 36, column: 33, scope: !69)
!95 = !MDLocation(line: 36, column: 7, scope: !69)
!96 = !MDLocation(line: 41, column: 7, scope: !56)
!97 = !MDLocation(line: 42, column: 5, scope: !56)
!98 = !MDLocation(line: 32, column: 33, scope: !53)
!99 = !MDLocation(line: 32, column: 5, scope: !53)
!100 = !MDLocation(line: 43, column: 3, scope: !49)
!101 = !MDLocation(line: 31, column: 31, scope: !45)
!102 = !MDLocation(line: 31, column: 3, scope: !45)
!103 = !MDLocation(line: 44, column: 1, scope: !12)
!104 = !MDLocation(line: 47, column: 3, scope: !15)
!105 = !MDLocation(line: 48, column: 23, scope: !15)
!106 = !MDLocation(line: 48, column: 18, scope: !15)
!107 = !MDLocation(line: 48, column: 3, scope: !15)
!108 = !MDLocation(line: 49, column: 3, scope: !15)
