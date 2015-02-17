; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @sqr(double %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %x, i64 0, metadata !10, metadata !36), !dbg !37
  %mul = fmul double %x, %x, !dbg !38
  ret double %mul, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone uwtable
define double @cnorm2(double %z.coerce0, double %z.coerce1) #0 {
entry:
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !16, metadata !36), !dbg !40
  %call = tail call double @sqr(double %z.coerce0), !dbg !41
  %call5 = tail call double @sqr(double %z.coerce1), !dbg !42
  %add = fadd double %call, %call5, !dbg !41
  ret double %add, !dbg !43
}

; Function Attrs: nounwind uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #2 {
entry:
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !22, metadata !36), !dbg !44
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !23, metadata !36), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !24, metadata !36), !dbg !46
  %call21 = tail call double @cnorm2(double %c.coerce0, double %c.coerce1), !dbg !47
  %cmp22 = fcmp ugt double %call21, 4.000000e+00, !dbg !47
  br i1 %cmp22, label %while.end, label %land.rhs, !dbg !47

land.rhs:                                         ; preds = %entry, %complex_mul_cont
  %z.sroa.5.025 = phi double [ %add.i, %complex_mul_cont ], [ %c.coerce1, %entry ]
  %z.sroa.0.024 = phi double [ %add.r, %complex_mul_cont ], [ %c.coerce0, %entry ]
  %i.023 = phi i32 [ %inc, %complex_mul_cont ], [ 1, %entry ]
  %inc = add nuw nsw i32 %i.023, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !24, metadata !36), !dbg !46
  %0 = load i32* @max_i, align 4, !dbg !52, !tbaa !53
  %cmp3 = icmp slt i32 %i.023, %0, !dbg !57
  br i1 %cmp3, label %while.body, label %while.end, !dbg !58

while.body:                                       ; preds = %land.rhs
  %mul_ac = fmul double %z.sroa.0.024, %z.sroa.0.024, !dbg !60
  %mul_bd = fmul double %z.sroa.5.025, %z.sroa.5.025, !dbg !60
  %mul_ad = fmul double %z.sroa.0.024, %z.sroa.5.025, !dbg !60
  %mul_r = fsub double %mul_ac, %mul_bd, !dbg !60
  %mul_i = fadd double %mul_ad, %mul_ad, !dbg !60
  %isnan_cmp = fcmp uno double %mul_r, 0.000000e+00, !dbg !60
  %isnan_cmp12 = fcmp uno double %mul_i, 0.000000e+00, !dbg !61
  %or.cond = and i1 %isnan_cmp, %isnan_cmp12, !dbg !60
  br i1 %or.cond, label %complex_mul_libcall, label %complex_mul_cont, !dbg !60, !prof !62

complex_mul_libcall:                              ; preds = %while.body
  %call13 = tail call { double, double } @__muldc3(double %z.sroa.0.024, double %z.sroa.5.025, double %z.sroa.0.024, double %z.sroa.5.025) #4, !dbg !63
  %1 = extractvalue { double, double } %call13, 0, !dbg !63
  %2 = extractvalue { double, double } %call13, 1, !dbg !63
  br label %complex_mul_cont, !dbg !63

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %while.body
  %real_mul_phi = phi double [ %mul_r, %while.body ], [ %1, %complex_mul_libcall ], !dbg !60
  %imag_mul_phi = phi double [ %mul_i, %while.body ], [ %2, %complex_mul_libcall ], !dbg !60
  %add.r = fadd double %real_mul_phi, %c.coerce0, !dbg !64
  %add.i = fadd double %imag_mul_phi, %c.coerce1, !dbg !64
  %call = tail call double @cnorm2(double %add.r, double %add.i), !dbg !47
  %cmp = fcmp ugt double %call, 4.000000e+00, !dbg !47
  br i1 %cmp, label %while.end, label %land.rhs, !dbg !47

while.end:                                        ; preds = %land.rhs, %complex_mul_cont, %entry
  %i.1 = phi i32 [ 1, %entry ], [ %inc, %complex_mul_cont ], [ %inc, %land.rhs ]
  ret i32 %i.1, !dbg !67
}

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 -39, i64 0, metadata !30, metadata !36), !dbg !68
  br label %for.cond1.preheader, !dbg !69

for.cond1.preheader:                              ; preds = %for.end, %entry
  %j.018 = phi i32 [ -39, %entry ], [ %inc11, %for.end ]
  %conv = sitofp i32 %j.018 to double, !dbg !71
  %div = fdiv double %conv, 4.000000e+01, !dbg !71
  %sub = fadd double %div, -5.000000e-01, !dbg !71
  br label %for.body3, !dbg !76

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %i.017 = phi i32 [ -39, %for.cond1.preheader ], [ %inc, %for.body3 ]
  %conv4 = sitofp i32 %i.017 to double, !dbg !77
  %div5 = fdiv double %conv4, 4.000000e+01, !dbg !77
  %mul.rl = fmul double %div5, 0.000000e+00, !dbg !78
  %add.r = fadd double %sub, %mul.rl, !dbg !78
  %call = tail call i32 @loop(double %add.r, double %div5), !dbg !78
  %0 = load i32* @max_i, align 4, !dbg !79, !tbaa !53
  %cmp6 = icmp sgt i32 %call, %0, !dbg !78
  %cond = select i1 %cmp6, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), !dbg !78
  %call8 = tail call i32 (i8*, ...)* @printf(i8* %cond) #4, !dbg !80
  %inc = add nsw i32 %i.017, 1, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !29, metadata !36), !dbg !82
  %exitcond = icmp eq i32 %inc, 39, !dbg !76
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !76

for.end:                                          ; preds = %for.body3
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !83
  %inc11 = add nsw i32 %j.018, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata i32 %inc11, i64 0, metadata !30, metadata !36), !dbg !68
  %exitcond19 = icmp eq i32 %inc11, 39, !dbg !69
  br i1 %exitcond19, label %for.end12, label %for.cond1.preheader, !dbg !69

for.end12:                                        ; preds = %for.end
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !31, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c] [DW_LANG_C99]
!1 = !{!"mandel-2.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !11, !17, !25}
!4 = !{!"0x2e\00sqr\00sqr\00\007\000\001\000\000\00256\001\007", !1, !5, !6, null, double (double)* @sqr, null, null, !9} ; [ DW_TAG_subprogram ] [line 7] [def] [sqr]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8}
!8 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = !{!10}
!10 = !{!"0x101\00x\0016777223\000", !4, !5, !8}  ; [ DW_TAG_arg_variable ] [x] [line 7]
!11 = !{!"0x2e\00cnorm2\00cnorm2\00\009\000\001\000\000\00256\001\009", !1, !5, !12, null, double (double, double)* @cnorm2, null, null, !15} ; [ DW_TAG_subprogram ] [line 9] [def] [cnorm2]
!12 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !13, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!8, !14}
!14 = !{!"0x24\00complex\000\00128\0064\000\000\003", null, null} ; [ DW_TAG_base_type ] [complex] [line 0, size 128, align 64, offset 0, enc DW_ATE_complex_float]
!15 = !{!16}
!16 = !{!"0x101\00z\0016777225\000", !11, !5, !14} ; [ DW_TAG_arg_variable ] [z] [line 9]
!17 = !{!"0x2e\00loop\00loop\00\0011\000\001\000\000\00256\001\0011", !1, !5, !18, null, i32 (double, double)* @loop, null, null, !21} ; [ DW_TAG_subprogram ] [line 11] [def] [loop]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!20, !14}
!20 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = !{!22, !23, !24}
!22 = !{!"0x101\00c\0016777227\000", !17, !5, !14} ; [ DW_TAG_arg_variable ] [c] [line 11]
!23 = !{!"0x100\00z\0012\000", !17, !5, !14}      ; [ DW_TAG_auto_variable ] [z] [line 12]
!24 = !{!"0x100\00i\0013\000", !17, !5, !20}      ; [ DW_TAG_auto_variable ] [i] [line 13]
!25 = !{!"0x2e\00main\00main\00\0019\000\001\000\000\000\001\0019", !1, !5, !26, null, i32 ()* @main, null, null, !28} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!20}
!28 = !{!29, !30}
!29 = !{!"0x100\00i\0020\000", !25, !5, !20}      ; [ DW_TAG_auto_variable ] [i] [line 20]
!30 = !{!"0x100\00j\0020\000", !25, !5, !20}      ; [ DW_TAG_auto_variable ] [j] [line 20]
!31 = !{!32}
!32 = !{!"0x34\00max_i\00max_i\00\005\000\001", null, !5, !20, i32* @max_i, null} ; [ DW_TAG_variable ] [max_i] [line 5] [def]
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 2}
!35 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!36 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!37 = !MDLocation(line: 7, column: 19, scope: !4)
!38 = !MDLocation(line: 7, column: 31, scope: !4)
!39 = !MDLocation(line: 7, column: 24, scope: !4)
!40 = !MDLocation(line: 9, column: 23, scope: !11)
!41 = !MDLocation(line: 9, column: 35, scope: !11)
!42 = !MDLocation(line: 9, column: 51, scope: !11)
!43 = !MDLocation(line: 9, column: 28, scope: !11)
!44 = !MDLocation(line: 11, column: 18, scope: !17)
!45 = !MDLocation(line: 12, column: 13, scope: !17)
!46 = !MDLocation(line: 13, column: 9, scope: !17)
!47 = !MDLocation(line: 14, column: 12, scope: !48)
!48 = !{!"0xb\004", !1, !49}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!49 = !{!"0xb\001", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!50 = !MDLocation(line: 14, column: 32, scope: !51)
!51 = !{!"0xb\002", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!52 = !MDLocation(line: 14, column: 38, scope: !17)
!53 = !{!54, !54, i64 0}
!54 = !{!"int", !55, i64 0}
!55 = !{!"omnipotent char", !56, i64 0}
!56 = !{!"Simple C/C++ TBAA"}
!57 = !MDLocation(line: 14, column: 32, scope: !17)
!58 = !MDLocation(line: 14, column: 5, scope: !59)
!59 = !{!"0xb\003", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!60 = !MDLocation(line: 15, column: 9, scope: !17)
!61 = !MDLocation(line: 15, column: 9, scope: !49)
!62 = !{!"branch_weights", i32 0, i32 -1}
!63 = !MDLocation(line: 15, column: 9, scope: !59)
!64 = !MDLocation(line: 15, column: 9, scope: !65)
!65 = !{!"0xb\005", !1, !66}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!66 = !{!"0xb\004", !1, !51}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!67 = !MDLocation(line: 16, column: 5, scope: !17)
!68 = !MDLocation(line: 20, column: 10, scope: !25)
!69 = !MDLocation(line: 21, column: 5, scope: !70)
!70 = !{!"0xb\0021\005\000", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!71 = !MDLocation(line: 23, column: 25, scope: !72)
!72 = !{!"0xb\0022\009\004", !1, !73}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!73 = !{!"0xb\0022\009\003", !1, !74}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!74 = !{!"0xb\0021\0032\002", !1, !75}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!75 = !{!"0xb\0021\005\001", !1, !70}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!76 = !MDLocation(line: 22, column: 9, scope: !73)
!77 = !MDLocation(line: 23, column: 38, scope: !72)
!78 = !MDLocation(line: 23, column: 20, scope: !72)
!79 = !MDLocation(line: 23, column: 50, scope: !72)
!80 = !MDLocation(line: 23, column: 13, scope: !72)
!81 = !MDLocation(line: 22, column: 31, scope: !72)
!82 = !MDLocation(line: 20, column: 7, scope: !25)
!83 = !MDLocation(line: 24, column: 9, scope: !74)
!84 = !MDLocation(line: 21, column: 27, scope: !75)
!85 = !MDLocation(line: 26, column: 5, scope: !25)
