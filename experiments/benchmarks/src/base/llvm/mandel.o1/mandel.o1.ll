; ModuleID = 'mandel.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@accum = common global { double, double } zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @emit(double %X.coerce0, double %X.coerce1) #0 {
entry:
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !13, metadata !46), !dbg !47
  %accum.real = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !48
  %accum.imag = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !48
  %add.r = fadd double %accum.real, %X.coerce0, !dbg !48
  %add.i = fadd double %accum.imag, %X.coerce1, !dbg !48
  store volatile double %add.r, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !48
  store volatile double %add.i, double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @mandel() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !46), !dbg !50
  br label %for.cond1.preheader, !dbg !51

for.cond1.preheader:                              ; preds = %for.inc34, %entry
  %x.045 = phi i32 [ 0, %entry ], [ %inc35, %for.inc34 ]
  %conv = sitofp i32 %x.045 to double, !dbg !52
  %mul = fmul double %conv, 4.000000e+00, !dbg !52
  %div = fdiv double %mul, 5.000000e+03, !dbg !52
  %add = fadd double %div, -2.000000e+00, !dbg !53
  br label %for.body3, !dbg !54

for.body3:                                        ; preds = %for.end, %for.cond1.preheader
  %y.044 = phi i32 [ 0, %for.cond1.preheader ], [ %inc32, %for.end ]
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !21, metadata !46), !dbg !55
  %conv4 = sitofp i32 %y.044 to double, !dbg !56
  %mul5 = fmul double %conv4, 4.000000e+00, !dbg !56
  %div6 = fdiv double %mul5, 5.000000e+03, !dbg !56
  %sub = fsub double -2.000000e+00, %div6, !dbg !57
  %mul.rl = fmul double %sub, 0.000000e+00, !dbg !55
  %add.r = fadd double %add, %mul.rl, !dbg !55
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !28, metadata !46), !dbg !58
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !46), !dbg !59
  br label %for.body12, !dbg !60

for.body12:                                       ; preds = %complex_mul_cont, %for.body3
  %z.sroa.0.043 = phi double [ 0.000000e+00, %for.body3 ], [ %add.r18, %complex_mul_cont ]
  %z.sroa.6.042 = phi double [ 0.000000e+00, %for.body3 ], [ %add.i, %complex_mul_cont ]
  %n.041 = phi i32 [ 0, %for.body3 ], [ %inc, %complex_mul_cont ]
  %mul_ac = fmul double %z.sroa.0.043, %z.sroa.0.043, !dbg !62
  %mul_bd = fmul double %z.sroa.6.042, %z.sroa.6.042, !dbg !62
  %mul_ad = fmul double %z.sroa.6.042, %z.sroa.0.043, !dbg !62
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !62
  %mul_i = fadd double %mul_ad, %mul_ad, !dbg !62
  %isnan_cmp = fcmp uno double %mul_r, 0.000000e+00, !dbg !62
  %isnan_cmp17 = fcmp uno double %mul_i, 0.000000e+00, !dbg !65
  %or.cond = and i1 %isnan_cmp, %isnan_cmp17, !dbg !62
  br i1 %or.cond, label %complex_mul_libcall, label %complex_mul_cont, !dbg !62, !prof !67

complex_mul_libcall:                              ; preds = %for.body12
  %call = tail call { double, double } @__muldc3(double %z.sroa.0.043, double %z.sroa.6.042, double %z.sroa.0.043, double %z.sroa.6.042) #3, !dbg !68
  %0 = extractvalue { double, double } %call, 0, !dbg !68
  %1 = extractvalue { double, double } %call, 1, !dbg !68
  br label %complex_mul_cont, !dbg !68

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %for.body12
  %real_mul_phi = phi double [ %mul_r, %for.body12 ], [ %0, %complex_mul_libcall ], !dbg !62
  %imag_mul_phi = phi double [ %mul_i, %for.body12 ], [ %1, %complex_mul_libcall ], !dbg !62
  %add.r18 = fadd double %add.r, %real_mul_phi, !dbg !70
  %add.i = fadd double %sub, %imag_mul_phi, !dbg !70
  tail call void @llvm.dbg.value(metadata double %add.r18, i64 0, metadata !74, metadata !46) #3, !dbg !77
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !78, metadata !46) #3, !dbg !79
  %call.i = tail call double @hypot(double %add.r18, double %add.i) #3, !dbg !80
  %cmp23 = fcmp ult double %call.i, 2.000000e+00, !dbg !75
  %inc = add nuw nsw i32 %n.041, 1, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !20, metadata !46), !dbg !59
  %cmp10 = icmp slt i32 %inc, 10, !dbg !82
  %or.cond46 = and i1 %cmp23, %cmp10, !dbg !85
  br i1 %or.cond46, label %for.body12, label %for.end, !dbg !85

for.end:                                          ; preds = %complex_mul_cont
  tail call void @emit(double %add.r18, double %add.i), !dbg !86
  %inc32 = add nuw nsw i32 %y.044, 1, !dbg !87
  tail call void @llvm.dbg.value(metadata i32 %inc32, i64 0, metadata !19, metadata !46), !dbg !88
  %exitcond = icmp eq i32 %inc32, 5000, !dbg !54
  br i1 %exitcond, label %for.inc34, label %for.body3, !dbg !54

for.inc34:                                        ; preds = %for.end
  %inc35 = add nuw nsw i32 %x.045, 1, !dbg !89
  tail call void @llvm.dbg.value(metadata i32 %inc35, i64 0, metadata !18, metadata !46), !dbg !50
  %exitcond47 = icmp eq i32 %inc35, 5000, !dbg !51
  br i1 %exitcond47, label %for.end36, label %for.cond1.preheader, !dbg !51

for.end36:                                        ; preds = %for.inc34
  ret void, !dbg !90
}

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @mandel(), !dbg !91
  %accum.real = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 0), align 8, !dbg !92
  %accum.imag = load volatile double* getelementptr inbounds ({ double, double }* @accum, i64 0, i32 1), align 8, !dbg !92
  %conv = fptosi double %accum.real to i32, !dbg !93
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv) #3, !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @hypot(double, double) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!43, !44}
!llvm.ident = !{!45}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !40, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c] [DW_LANG_C99]
!1 = !{!"mandel.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!6 = !{!7, !14, !29, !32}
!7 = !{!"0x2e\00emit\00emit\00\0025\000\001\000\000\00256\001\0025", !1, !8, !9, null, void (double, double)* @emit, null, null, !12} ; [ DW_TAG_subprogram ] [line 25] [def] [emit]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{null, !11}
!11 = !{!"0x24\00complex\000\00128\0064\000\000\003", null, null} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!12 = !{!13}
!13 = !{!"0x101\00X\0016777241\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [X] [line 25]
!14 = !{!"0x2e\00mandel\00mandel\00\0029\000\001\000\000\000\001\0029", !1, !8, !15, null, void ()* @mandel, null, null, !17} ; [ DW_TAG_subprogram ] [line 29] [def] [mandel]
!15 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !16, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = !{null}
!17 = !{!18, !19, !20, !21, !28}
!18 = !{!"0x100\00x\0030\000", !14, !8, !5}       ; [ DW_TAG_auto_variable ] [x] [line 30]
!19 = !{!"0x100\00y\0030\000", !14, !8, !5}       ; [ DW_TAG_auto_variable ] [y] [line 30]
!20 = !{!"0x100\00n\0030\000", !14, !8, !5}       ; [ DW_TAG_auto_variable ] [n] [line 30]
!21 = !{!"0x100\00c\0033\000", !22, !8, !11}      ; [ DW_TAG_auto_variable ] [c] [line 33]
!22 = !{!"0xb\0032\0038\005", !1, !23}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!23 = !{!"0xb\0032\005\004", !1, !24}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!24 = !{!"0xb\0032\005\003", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!25 = !{!"0xb\0031\0036\002", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!26 = !{!"0xb\0031\003\001", !1, !27}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!27 = !{!"0xb\0031\003\000", !1, !14}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!28 = !{!"0x100\00z\0034\000", !22, !8, !11}      ; [ DW_TAG_auto_variable ] [z] [line 34]
!29 = !{!"0x2e\00main\00main\00\0046\000\001\000\000\000\001\0046", !1, !8, !30, null, i32 ()* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 46] [def] [main]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{!5}
!32 = !{!"0x2e\00__tg_hypot\00__tg_hypot\00_ZL10__tg_hypotdd\00833\001\001\000\000\00256\001\00833", !33, !34, !35, null, null, null, null, !37} ; [ DW_TAG_subprogram ] [line 833] [local] [def] [__tg_hypot]
!33 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/tgmath.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!34 = !{!"0x29", !33}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base//usr/local/bin/../lib/clang/3.6.0/include/tgmath.h]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!4, !4, !4}
!37 = !{!38, !39}
!38 = !{!"0x101\00__x\0016778049\000", !32, !34, !4} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!39 = !{!"0x101\00__y\0033555265\000", !32, !34, !4} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!40 = !{!41}
!41 = !{!"0x34\00accum\00accum\00\0024\000\001", null, !8, !42, { double, double }* @accum, null} ; [ DW_TAG_variable ] [accum] [line 24] [def]
!42 = !{!"0x35\00\000\000\000\000\000", null, null, !11} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from complex]
!43 = !{i32 2, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 2}
!45 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!46 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!47 = !MDLocation(line: 25, column: 30, scope: !7)
!48 = !MDLocation(line: 26, column: 3, scope: !7)
!49 = !MDLocation(line: 27, column: 1, scope: !7)
!50 = !MDLocation(line: 30, column: 7, scope: !14)
!51 = !MDLocation(line: 31, column: 3, scope: !27)
!52 = !MDLocation(line: 33, column: 39, scope: !22)
!53 = !MDLocation(line: 33, column: 31, scope: !22)
!54 = !MDLocation(line: 32, column: 5, scope: !24)
!55 = !MDLocation(line: 33, column: 26, scope: !22)
!56 = !MDLocation(line: 33, column: 58, scope: !22)
!57 = !MDLocation(line: 33, column: 50, scope: !22)
!58 = !MDLocation(line: 34, column: 26, scope: !22)
!59 = !MDLocation(line: 30, column: 13, scope: !14)
!60 = !MDLocation(line: 36, column: 7, scope: !61)
!61 = !{!"0xb\0036\007\006", !1, !22}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!62 = !MDLocation(line: 37, column: 9, scope: !63)
!63 = !{!"0xb\0036\0038\008", !1, !64}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!64 = !{!"0xb\0036\007\007", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!65 = !MDLocation(line: 37, column: 9, scope: !66)
!66 = !{!"0xb\001", !1, !63}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!67 = !{!"branch_weights", i32 0, i32 -1}
!68 = !MDLocation(line: 37, column: 9, scope: !69)
!69 = !{!"0xb\003", !1, !63}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!70 = !MDLocation(line: 37, column: 9, scope: !71)
!71 = !{!"0xb\005", !1, !72}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!72 = !{!"0xb\004", !1, !73}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!73 = !{!"0xb\002", !1, !63}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!74 = !{!"0x101\00__x\0016778049\000", !32, !34, !4, !75} ; [ DW_TAG_arg_variable ] [__x] [line 833]
!75 = !MDLocation(line: 38, column: 13, scope: !76)
!76 = !{!"0xb\0038\0013\009", !1, !63}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!77 = !MDLocation(line: 833, column: 23, scope: !32, inlinedAt: !75)
!78 = !{!"0x101\00__y\0033555265\000", !32, !34, !4, !75} ; [ DW_TAG_arg_variable ] [__y] [line 833]
!79 = !MDLocation(line: 833, column: 35, scope: !32, inlinedAt: !75)
!80 = !MDLocation(line: 833, column: 48, scope: !32, inlinedAt: !75)
!81 = !MDLocation(line: 36, column: 33, scope: !64)
!82 = !MDLocation(line: 36, column: 19, scope: !83)
!83 = !{!"0xb\002", !1, !84}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!84 = !{!"0xb\001", !1, !64}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel.c]
!85 = !MDLocation(line: 38, column: 13, scope: !63)
!86 = !MDLocation(line: 41, column: 7, scope: !22)
!87 = !MDLocation(line: 32, column: 33, scope: !23)
!88 = !MDLocation(line: 30, column: 10, scope: !14)
!89 = !MDLocation(line: 31, column: 31, scope: !26)
!90 = !MDLocation(line: 44, column: 1, scope: !14)
!91 = !MDLocation(line: 47, column: 3, scope: !29)
!92 = !MDLocation(line: 48, column: 23, scope: !29)
!93 = !MDLocation(line: 48, column: 18, scope: !29)
!94 = !MDLocation(line: 48, column: 3, scope: !29)
!95 = !MDLocation(line: 49, column: 3, scope: !29)
