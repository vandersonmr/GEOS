; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @sqr(double %x) #0 {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  call void @llvm.dbg.declare(metadata double* %x.addr, metadata !25, metadata !26), !dbg !27
  %0 = load double* %x.addr, align 8, !dbg !28
  %1 = load double* %x.addr, align 8, !dbg !29
  %mul = fmul double %0, %1, !dbg !28
  ret double %mul, !dbg !30
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @cnorm2(double %z.coerce0, double %z.coerce1) #0 {
entry:
  %z = alloca { double, double }, align 8
  %0 = getelementptr { double, double }* %z, i32 0, i32 0
  store double %z.coerce0, double* %0
  %1 = getelementptr { double, double }* %z, i32 0, i32 1
  store double %z.coerce1, double* %1
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !31, metadata !26), !dbg !32
  %z.realp = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !33
  %z.real = load double* %z.realp, align 8, !dbg !33
  %z.imagp = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !33
  %z.imag = load double* %z.imagp, align 8, !dbg !33
  %call = call double @sqr(double %z.real), !dbg !34
  %z.realp1 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !35
  %z.real2 = load double* %z.realp1, align 8, !dbg !35
  %z.imagp3 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !35
  %z.imag4 = load double* %z.imagp3, align 8, !dbg !35
  %call5 = call double @sqr(double %z.imag4), !dbg !36
  %add = fadd double %call, %call5, !dbg !34
  ret double %add, !dbg !37
}

; Function Attrs: nounwind uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #0 {
entry:
  %c = alloca { double, double }, align 8
  %z = alloca { double, double }, align 8
  %i = alloca i32, align 4
  %coerce = alloca { double, double }, align 8
  %0 = getelementptr { double, double }* %c, i32 0, i32 0
  store double %c.coerce0, double* %0
  %1 = getelementptr { double, double }* %c, i32 0, i32 1
  store double %c.coerce1, double* %1
  call void @llvm.dbg.declare(metadata { double, double }* %c, metadata !38, metadata !26), !dbg !39
  call void @llvm.dbg.declare(metadata { double, double }* %z, metadata !40, metadata !26), !dbg !41
  %c.realp = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !41
  %c.real = load double* %c.realp, align 8, !dbg !41
  %c.imagp = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !41
  %c.imag = load double* %c.imagp, align 8, !dbg !41
  %real = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !41
  %imag = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !41
  store double %c.real, double* %real, align 8, !dbg !41
  store double %c.imag, double* %imag, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !26), !dbg !43
  store i32 1, i32* %i, align 4, !dbg !43
  br label %while.cond, !dbg !44

while.cond:                                       ; preds = %complex_mul_cont, %entry
  %z.realp = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !45
  %z.real = load double* %z.realp, align 8, !dbg !45
  %z.imagp = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !45
  %z.imag = load double* %z.imagp, align 8, !dbg !45
  %real1 = getelementptr inbounds { double, double }* %coerce, i32 0, i32 0, !dbg !45
  %imag2 = getelementptr inbounds { double, double }* %coerce, i32 0, i32 1, !dbg !45
  store double %z.real, double* %real1, align 8, !dbg !45
  store double %z.imag, double* %imag2, align 8, !dbg !45
  %2 = getelementptr { double, double }* %coerce, i32 0, i32 0, !dbg !45
  %3 = load double* %2, align 1, !dbg !45
  %4 = getelementptr { double, double }* %coerce, i32 0, i32 1, !dbg !45
  %5 = load double* %4, align 1, !dbg !45
  %call = call double @cnorm2(double %3, double %5), !dbg !45
  %cmp = fcmp ole double %call, 4.000000e+00, !dbg !45
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !45

land.rhs:                                         ; preds = %while.cond
  %6 = load i32* %i, align 4, !dbg !48
  %inc = add nsw i32 %6, 1, !dbg !48
  store i32 %inc, i32* %i, align 4, !dbg !48
  %7 = load i32* @max_i, align 4, !dbg !50
  %cmp3 = icmp slt i32 %6, %7, !dbg !51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %8 = phi i1 [ false, %while.cond ], [ %cmp3, %land.rhs ]
  br i1 %8, label %while.body, label %while.end, !dbg !52

while.body:                                       ; preds = %land.end
  %z.realp4 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !54
  %z.real5 = load double* %z.realp4, align 8, !dbg !54
  %z.imagp6 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !54
  %z.imag7 = load double* %z.imagp6, align 8, !dbg !54
  %z.realp8 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !54
  %z.real9 = load double* %z.realp8, align 8, !dbg !54
  %z.imagp10 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !54
  %z.imag11 = load double* %z.imagp10, align 8, !dbg !54
  %mul_ac = fmul double %z.real5, %z.real9, !dbg !54
  %mul_bd = fmul double %z.imag7, %z.imag11, !dbg !54
  %mul_ad = fmul double %z.real5, %z.imag11, !dbg !54
  %mul_bc = fmul double %z.imag7, %z.real9, !dbg !54
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !54
  %mul_i = fadd double %mul_ad, %mul_bc, !dbg !54
  %isnan_cmp = fcmp uno double %mul_r, %mul_r, !dbg !54
  br i1 %isnan_cmp, label %complex_mul_imag_nan, label %complex_mul_cont, !dbg !54, !prof !55

complex_mul_imag_nan:                             ; preds = %while.body
  %isnan_cmp12 = fcmp uno double %mul_i, %mul_i, !dbg !56
  br i1 %isnan_cmp12, label %complex_mul_libcall, label %complex_mul_cont, !dbg !56, !prof !55

complex_mul_libcall:                              ; preds = %complex_mul_imag_nan
  %call13 = call { double, double } @__muldc3(double %z.real5, double %z.imag7, double %z.real9, double %z.imag11) #3, !dbg !57
  %9 = extractvalue { double, double } %call13, 0, !dbg !57
  %10 = extractvalue { double, double } %call13, 1, !dbg !57
  br label %complex_mul_cont, !dbg !57

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %complex_mul_imag_nan, %while.body
  %real_mul_phi = phi double [ %mul_r, %while.body ], [ %mul_r, %complex_mul_imag_nan ], [ %9, %complex_mul_libcall ], !dbg !54
  %imag_mul_phi = phi double [ %mul_i, %while.body ], [ %mul_i, %complex_mul_imag_nan ], [ %10, %complex_mul_libcall ], !dbg !54
  %c.realp14 = getelementptr inbounds { double, double }* %c, i32 0, i32 0, !dbg !58
  %c.real15 = load double* %c.realp14, align 8, !dbg !58
  %c.imagp16 = getelementptr inbounds { double, double }* %c, i32 0, i32 1, !dbg !58
  %c.imag17 = load double* %c.imagp16, align 8, !dbg !58
  %add.r = fadd double %real_mul_phi, %c.real15, !dbg !58
  %add.i = fadd double %imag_mul_phi, %c.imag17, !dbg !58
  %real18 = getelementptr inbounds { double, double }* %z, i32 0, i32 0, !dbg !58
  %imag19 = getelementptr inbounds { double, double }* %z, i32 0, i32 1, !dbg !58
  store double %add.r, double* %real18, align 8, !dbg !58
  store double %add.i, double* %imag19, align 8, !dbg !58
  br label %while.cond, !dbg !44

while.end:                                        ; preds = %land.end
  %11 = load i32* %i, align 4, !dbg !61
  ret i32 %11, !dbg !62
}

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %coerce = alloca { double, double }, align 8
  store i32 0, i32* %retval
  call void @llvm.dbg.declare(metadata i32* %i, metadata !63, metadata !26), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %j, metadata !65, metadata !26), !dbg !66
  store i32 -39, i32* %j, align 4, !dbg !67
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32* %j, align 4, !dbg !69
  %cmp = icmp slt i32 %0, 39, !dbg !69
  br i1 %cmp, label %for.body, label %for.end12, !dbg !73

for.body:                                         ; preds = %for.cond
  store i32 -39, i32* %i, align 4, !dbg !74
  br label %for.cond1, !dbg !74

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %i, align 4, !dbg !77
  %cmp2 = icmp slt i32 %1, 39, !dbg !77
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !81

for.body3:                                        ; preds = %for.cond1
  %2 = load i32* %j, align 4, !dbg !82
  %conv = sitofp i32 %2 to double, !dbg !82
  %div = fdiv double %conv, 4.000000e+01, !dbg !82
  %sub = fsub double %div, 5.000000e-01, !dbg !82
  %3 = load i32* %i, align 4, !dbg !83
  %conv4 = sitofp i32 %3 to double, !dbg !83
  %div5 = fdiv double %conv4, 4.000000e+01, !dbg !83
  %mul.rl = fmul double %div5, 0.000000e+00, !dbg !84
  %mul.ir = fmul double %div5, 1.000000e+00, !dbg !84
  %add.r = fadd double %sub, %mul.rl, !dbg !84
  %real = getelementptr inbounds { double, double }* %coerce, i32 0, i32 0, !dbg !84
  %imag = getelementptr inbounds { double, double }* %coerce, i32 0, i32 1, !dbg !84
  store double %add.r, double* %real, align 8, !dbg !84
  store double %mul.ir, double* %imag, align 8, !dbg !84
  %4 = getelementptr { double, double }* %coerce, i32 0, i32 0, !dbg !84
  %5 = load double* %4, align 1, !dbg !84
  %6 = getelementptr { double, double }* %coerce, i32 0, i32 1, !dbg !84
  %7 = load double* %6, align 1, !dbg !84
  %call = call i32 @loop(double %5, double %7), !dbg !84
  %8 = load i32* @max_i, align 4, !dbg !85
  %cmp6 = icmp sgt i32 %call, %8, !dbg !84
  %cond = select i1 %cmp6, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), !dbg !84
  %call8 = call i32 (i8*, ...)* @printf(i8* %cond), !dbg !86
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body3
  %9 = load i32* %i, align 4, !dbg !87
  %inc = add nsw i32 %9, 1, !dbg !87
  store i32 %inc, i32* %i, align 4, !dbg !87
  br label %for.cond1, !dbg !88

for.end:                                          ; preds = %for.cond1
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !89
  br label %for.inc10, !dbg !90

for.inc10:                                        ; preds = %for.end
  %10 = load i32* %j, align 4, !dbg !91
  %inc11 = add nsw i32 %10, 1, !dbg !91
  store i32 %inc11, i32* %j, align 4, !dbg !91
  br label %for.cond, !dbg !92

for.end12:                                        ; preds = %for.cond
  ret i32 0, !dbg !93
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !20, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c] [DW_LANG_C99]
!1 = !{!"mandel-2.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !9, !13, !17}
!4 = !{!"0x2e\00sqr\00sqr\00\007\000\001\000\000\00256\000\007", !1, !5, !6, null, double (double)* @sqr, null, null, !2} ; [ DW_TAG_subprogram ] [line 7] [def] [sqr]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = !{!"0x2e\00cnorm2\00cnorm2\00\009\000\001\000\000\00256\000\009", !1, !5, !10, null, double (double, double)* @cnorm2, null, null, !2} ; [ DW_TAG_subprogram ] [line 9] [def] [cnorm2]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!8, !12}
!12 = !{!"0x24\00complex\000\00128\0064\000\000\003", null, null} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!13 = !{!"0x2e\00loop\00loop\00\0011\000\001\000\000\00256\000\0011", !1, !5, !14, null, i32 (double, double)* @loop, null, null, !2} ; [ DW_TAG_subprogram ] [line 11] [def] [loop]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!16, !12}
!16 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = !{!"0x2e\00main\00main\00\0019\000\001\000\000\000\000\0019", !1, !5, !18, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!16}
!20 = !{!21}
!21 = !{!"0x34\00max_i\00max_i\00\005\000\001", null, !5, !16, i32* @max_i, null} ; [ DW_TAG_variable ] [max_i] [line 5] [def]
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 2}
!24 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!25 = !{!"0x101\00x\0016777223\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [x] [line 7]
!26 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!27 = !MDLocation(line: 7, column: 19, scope: !4)
!28 = !MDLocation(line: 7, column: 31, scope: !4)
!29 = !MDLocation(line: 7, column: 33, scope: !4)
!30 = !MDLocation(line: 7, column: 24, scope: !4)
!31 = !{!"0x101\00z\0016777225\000", !9, !5, !12} ; [ DW_TAG_arg_variable ] [z] [line 9]
!32 = !MDLocation(line: 9, column: 23, scope: !9)
!33 = !MDLocation(line: 9, column: 39, scope: !9)
!34 = !MDLocation(line: 9, column: 35, scope: !9)
!35 = !MDLocation(line: 9, column: 55, scope: !9)
!36 = !MDLocation(line: 9, column: 51, scope: !9)
!37 = !MDLocation(line: 9, column: 28, scope: !9)
!38 = !{!"0x101\00c\0016777227\000", !13, !5, !12} ; [ DW_TAG_arg_variable ] [c] [line 11]
!39 = !MDLocation(line: 11, column: 18, scope: !13)
!40 = !{!"0x100\00z\0012\000", !13, !5, !12}      ; [ DW_TAG_auto_variable ] [z] [line 12]
!41 = !MDLocation(line: 12, column: 13, scope: !13)
!42 = !{!"0x100\00i\0013\000", !13, !5, !16}      ; [ DW_TAG_auto_variable ] [i] [line 13]
!43 = !MDLocation(line: 13, column: 9, scope: !13)
!44 = !MDLocation(line: 14, column: 5, scope: !13)
!45 = !MDLocation(line: 14, column: 12, scope: !46)
!46 = !{!"0xb\004", !1, !47}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!47 = !{!"0xb\001", !1, !13}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!48 = !MDLocation(line: 14, column: 32, scope: !49)
!49 = !{!"0xb\002", !1, !13}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!50 = !MDLocation(line: 14, column: 38, scope: !13)
!51 = !MDLocation(line: 14, column: 32, scope: !13)
!52 = !MDLocation(line: 14, column: 5, scope: !53)
!53 = !{!"0xb\003", !1, !13}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!54 = !MDLocation(line: 15, column: 9, scope: !13)
!55 = !{!"branch_weights", i32 1, i32 1048575}
!56 = !MDLocation(line: 15, column: 9, scope: !47)
!57 = !MDLocation(line: 15, column: 9, scope: !53)
!58 = !MDLocation(line: 15, column: 9, scope: !59)
!59 = !{!"0xb\005", !1, !60}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!60 = !{!"0xb\004", !1, !49}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!61 = !MDLocation(line: 16, column: 12, scope: !13)
!62 = !MDLocation(line: 16, column: 5, scope: !13)
!63 = !{!"0x100\00i\0020\000", !17, !5, !16}      ; [ DW_TAG_auto_variable ] [i] [line 20]
!64 = !MDLocation(line: 20, column: 7, scope: !17)
!65 = !{!"0x100\00j\0020\000", !17, !5, !16}      ; [ DW_TAG_auto_variable ] [j] [line 20]
!66 = !MDLocation(line: 20, column: 10, scope: !17)
!67 = !MDLocation(line: 21, column: 10, scope: !68)
!68 = !{!"0xb\0021\005\000", !1, !17}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!69 = !MDLocation(line: 21, column: 19, scope: !70)
!70 = !{!"0xb\002", !1, !71}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!71 = !{!"0xb\001", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!72 = !{!"0xb\0021\005\001", !1, !68}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!73 = !MDLocation(line: 21, column: 5, scope: !68)
!74 = !MDLocation(line: 22, column: 14, scope: !75)
!75 = !{!"0xb\0022\009\003", !1, !76}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!76 = !{!"0xb\0021\0032\002", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!77 = !MDLocation(line: 22, column: 23, scope: !78)
!78 = !{!"0xb\002", !1, !79}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!79 = !{!"0xb\001", !1, !80}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!80 = !{!"0xb\0022\009\004", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!81 = !MDLocation(line: 22, column: 9, scope: !75)
!82 = !MDLocation(line: 23, column: 25, scope: !80)
!83 = !MDLocation(line: 23, column: 38, scope: !80)
!84 = !MDLocation(line: 23, column: 20, scope: !80)
!85 = !MDLocation(line: 23, column: 50, scope: !80)
!86 = !MDLocation(line: 23, column: 13, scope: !80)
!87 = !MDLocation(line: 22, column: 31, scope: !80)
!88 = !MDLocation(line: 22, column: 9, scope: !80)
!89 = !MDLocation(line: 24, column: 9, scope: !76)
!90 = !MDLocation(line: 25, column: 5, scope: !76)
!91 = !MDLocation(line: 21, column: 27, scope: !72)
!92 = !MDLocation(line: 21, column: 5, scope: !72)
!93 = !MDLocation(line: 26, column: 5, scope: !17)
