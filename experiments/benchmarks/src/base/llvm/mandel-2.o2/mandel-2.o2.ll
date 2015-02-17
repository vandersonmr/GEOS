; ModuleID = 'mandel-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@max_i = global i32 65536, align 4
@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c" \00", align 1

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
  tail call void @llvm.dbg.value(metadata double %z.coerce0, i64 0, metadata !41, metadata !36), !dbg !43
  %mul.i = fmul double %z.coerce0, %z.coerce0, !dbg !44
  tail call void @llvm.dbg.value(metadata double %z.coerce1, i64 0, metadata !45, metadata !36), !dbg !47
  %mul.i6 = fmul double %z.coerce1, %z.coerce1, !dbg !48
  %add = fadd double %mul.i, %mul.i6, !dbg !42
  ret double %add, !dbg !49
}

; Function Attrs: nounwind uwtable
define i32 @loop(double %c.coerce0, double %c.coerce1) #2 {
entry:
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !22, metadata !36), !dbg !50
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !23, metadata !36), !dbg !51
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !24, metadata !36), !dbg !52
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !53, metadata !36), !dbg !57
  tail call void @llvm.dbg.value(metadata double %c.coerce0, i64 0, metadata !58, metadata !36), !dbg !60
  %mul.i.i22 = fmul double %c.coerce0, %c.coerce0, !dbg !61
  tail call void @llvm.dbg.value(metadata double %c.coerce1, i64 0, metadata !62, metadata !36), !dbg !64
  %mul.i6.i23 = fmul double %c.coerce1, %c.coerce1, !dbg !65
  %add.i2124 = fadd double %mul.i.i22, %mul.i6.i23, !dbg !59
  %cmp25 = fcmp ugt double %add.i2124, 4.000000e+00, !dbg !54
  br i1 %cmp25, label %while.end, label %land.rhs.preheader, !dbg !54

land.rhs.preheader:                               ; preds = %entry
  br label %land.rhs, !dbg !66

land.rhs:                                         ; preds = %land.rhs.preheader, %complex_mul_cont
  %mul.i6.i30 = phi double [ %mul.i6.i, %complex_mul_cont ], [ %mul.i6.i23, %land.rhs.preheader ]
  %mul.i.i29 = phi double [ %mul.i.i, %complex_mul_cont ], [ %mul.i.i22, %land.rhs.preheader ]
  %z.sroa.5.028 = phi double [ %add.i, %complex_mul_cont ], [ %c.coerce1, %land.rhs.preheader ]
  %z.sroa.0.027 = phi double [ %add.r, %complex_mul_cont ], [ %c.coerce0, %land.rhs.preheader ]
  %i.026 = phi i32 [ %inc, %complex_mul_cont ], [ 1, %land.rhs.preheader ]
  %inc = add nuw nsw i32 %i.026, 1, !dbg !66
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !24, metadata !36), !dbg !52
  %0 = load i32* @max_i, align 4, !dbg !68, !tbaa !69
  %cmp3 = icmp slt i32 %i.026, %0, !dbg !73
  br i1 %cmp3, label %while.body, label %while.end.loopexit, !dbg !74

while.body:                                       ; preds = %land.rhs
  %mul_ad = fmul double %z.sroa.0.027, %z.sroa.5.028, !dbg !76
  %mul_r = fsub double %mul.i.i29, %mul.i6.i30, !dbg !76
  %mul_i = fadd double %mul_ad, %mul_ad, !dbg !76
  %isnan_cmp = fcmp uno double %mul_r, 0.000000e+00, !dbg !76
  %isnan_cmp12 = fcmp uno double %mul_i, 0.000000e+00, !dbg !77
  %or.cond = and i1 %isnan_cmp, %isnan_cmp12, !dbg !76
  br i1 %or.cond, label %complex_mul_libcall, label %complex_mul_cont, !dbg !76, !prof !78

complex_mul_libcall:                              ; preds = %while.body
  %call13 = tail call { double, double } @__muldc3(double %z.sroa.0.027, double %z.sroa.5.028, double %z.sroa.0.027, double %z.sroa.5.028) #4, !dbg !79
  %1 = extractvalue { double, double } %call13, 0, !dbg !79
  %2 = extractvalue { double, double } %call13, 1, !dbg !79
  br label %complex_mul_cont, !dbg !79

complex_mul_cont:                                 ; preds = %complex_mul_libcall, %while.body
  %real_mul_phi = phi double [ %mul_r, %while.body ], [ %1, %complex_mul_libcall ], !dbg !76
  %imag_mul_phi = phi double [ %mul_i, %while.body ], [ %2, %complex_mul_libcall ], !dbg !76
  %add.r = fadd double %real_mul_phi, %c.coerce0, !dbg !80
  %add.i = fadd double %imag_mul_phi, %c.coerce1, !dbg !80
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !53, metadata !36), !dbg !57
  tail call void @llvm.dbg.value(metadata double %add.r, i64 0, metadata !58, metadata !36), !dbg !60
  %mul.i.i = fmul double %add.r, %add.r, !dbg !61
  tail call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !62, metadata !36), !dbg !64
  %mul.i6.i = fmul double %add.i, %add.i, !dbg !65
  %add.i21 = fadd double %mul.i.i, %mul.i6.i, !dbg !59
  %cmp = fcmp ugt double %add.i21, 4.000000e+00, !dbg !54
  br i1 %cmp, label %while.end.loopexit, label %land.rhs, !dbg !54

while.end.loopexit:                               ; preds = %complex_mul_cont, %land.rhs
  %inc.lcssa = phi i32 [ %inc, %complex_mul_cont ], [ %inc, %land.rhs ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %entry
  %i.1 = phi i32 [ 1, %entry ], [ %inc.lcssa, %while.end.loopexit ]
  ret i32 %i.1, !dbg !83
}

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
entry:
  tail call void @llvm.dbg.value(metadata i32 -39, i64 0, metadata !30, metadata !36), !dbg !84
  br label %for.cond1.preheader, !dbg !85

for.cond1.preheader:                              ; preds = %for.end, %entry
  %j.018 = phi i32 [ -39, %entry ], [ %inc11, %for.end ]
  %conv = sitofp i32 %j.018 to double, !dbg !87
  %div = fdiv double %conv, 4.000000e+01, !dbg !87
  %sub = fadd double %div, -5.000000e-01, !dbg !87
  br label %for.body3, !dbg !92

for.body3:                                        ; preds = %loop.exit, %for.cond1.preheader
  %i.017 = phi i32 [ -39, %for.cond1.preheader ], [ %inc, %loop.exit ]
  %conv4 = sitofp i32 %i.017 to double, !dbg !93
  %div5 = fdiv double %conv4, 4.000000e+01, !dbg !93
  %mul.rl = fmul double %div5, 0.000000e+00, !dbg !94
  %add.r = fadd double %sub, %mul.rl, !dbg !94
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !95, metadata !36) #4, !dbg !96
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !97, metadata !36) #4, !dbg !98
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !99, metadata !36) #4, !dbg !100
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !101, metadata !36) #4, !dbg !103
  tail call void @llvm.dbg.value(metadata double %add.r, i64 0, metadata !104, metadata !36) #4, !dbg !106
  %mul.i.i22.i = fmul double %add.r, %add.r, !dbg !107
  tail call void @llvm.dbg.value(metadata double %div5, i64 0, metadata !108, metadata !36) #4, !dbg !110
  %mul.i6.i23.i = fmul double %div5, %div5, !dbg !111
  %add.i2124.i = fadd double %mul.i6.i23.i, %mul.i.i22.i, !dbg !105
  %cmp25.i = fcmp ugt double %add.i2124.i, 4.000000e+00, !dbg !102
  br i1 %cmp25.i, label %loop.exit, label %land.rhs.i.preheader, !dbg !102

land.rhs.i.preheader:                             ; preds = %for.body3
  br label %land.rhs.i, !dbg !112

land.rhs.i:                                       ; preds = %land.rhs.i.preheader, %complex_mul_cont.i
  %mul.i6.i30.i = phi double [ %mul.i6.i.i, %complex_mul_cont.i ], [ %mul.i6.i23.i, %land.rhs.i.preheader ], !dbg !94
  %mul.i.i29.i = phi double [ %mul.i.i.i, %complex_mul_cont.i ], [ %mul.i.i22.i, %land.rhs.i.preheader ], !dbg !94
  %z.sroa.5.028.i = phi double [ %add.i.i, %complex_mul_cont.i ], [ %div5, %land.rhs.i.preheader ], !dbg !94
  %z.sroa.0.027.i = phi double [ %add.r.i, %complex_mul_cont.i ], [ %add.r, %land.rhs.i.preheader ], !dbg !94
  %i.026.i = phi i32 [ %inc.i, %complex_mul_cont.i ], [ 1, %land.rhs.i.preheader ], !dbg !94
  %inc.i = add nuw nsw i32 %i.026.i, 1, !dbg !112
  tail call void @llvm.dbg.value(metadata i32 %inc.i, i64 0, metadata !99, metadata !36) #4, !dbg !100
  %0 = load i32* @max_i, align 4, !dbg !113, !tbaa !69
  %cmp3.i = icmp slt i32 %i.026.i, %0, !dbg !114
  br i1 %cmp3.i, label %while.body.i, label %loop.exit.loopexit, !dbg !115

while.body.i:                                     ; preds = %land.rhs.i
  %mul_ad.i = fmul double %z.sroa.5.028.i, %z.sroa.0.027.i, !dbg !116
  %mul_r.i = fsub double %mul.i.i29.i, %mul.i6.i30.i, !dbg !116
  %mul_i.i = fadd double %mul_ad.i, %mul_ad.i, !dbg !116
  %isnan_cmp.i = fcmp uno double %mul_r.i, 0.000000e+00, !dbg !116
  %isnan_cmp12.i = fcmp uno double %mul_i.i, 0.000000e+00, !dbg !117
  %or.cond.i = and i1 %isnan_cmp.i, %isnan_cmp12.i, !dbg !116
  br i1 %or.cond.i, label %complex_mul_libcall.i, label %complex_mul_cont.i, !dbg !116, !prof !78

complex_mul_libcall.i:                            ; preds = %while.body.i
  %call13.i = tail call { double, double } @__muldc3(double %z.sroa.0.027.i, double %z.sroa.5.028.i, double %z.sroa.0.027.i, double %z.sroa.5.028.i) #4, !dbg !118
  %1 = extractvalue { double, double } %call13.i, 0, !dbg !118
  %2 = extractvalue { double, double } %call13.i, 1, !dbg !118
  br label %complex_mul_cont.i, !dbg !118

complex_mul_cont.i:                               ; preds = %complex_mul_libcall.i, %while.body.i
  %real_mul_phi.i = phi double [ %mul_r.i, %while.body.i ], [ %1, %complex_mul_libcall.i ], !dbg !116
  %imag_mul_phi.i = phi double [ %mul_i.i, %while.body.i ], [ %2, %complex_mul_libcall.i ], !dbg !116
  %add.r.i = fadd double %add.r, %real_mul_phi.i, !dbg !119
  %add.i.i = fadd double %div5, %imag_mul_phi.i, !dbg !119
  tail call void @llvm.dbg.declare(metadata { double, double }* undef, metadata !101, metadata !36) #4, !dbg !103
  tail call void @llvm.dbg.value(metadata double %add.r.i, i64 0, metadata !104, metadata !36) #4, !dbg !106
  %mul.i.i.i = fmul double %add.r.i, %add.r.i, !dbg !107
  tail call void @llvm.dbg.value(metadata double %add.i.i, i64 0, metadata !108, metadata !36) #4, !dbg !110
  %mul.i6.i.i = fmul double %add.i.i, %add.i.i, !dbg !111
  %add.i21.i = fadd double %mul.i.i.i, %mul.i6.i.i, !dbg !105
  %cmp.i = fcmp ugt double %add.i21.i, 4.000000e+00, !dbg !102
  br i1 %cmp.i, label %loop.exit.loopexit, label %land.rhs.i, !dbg !102

loop.exit.loopexit:                               ; preds = %complex_mul_cont.i, %land.rhs.i
  %inc.i.lcssa = phi i32 [ %inc.i, %complex_mul_cont.i ], [ %inc.i, %land.rhs.i ]
  br label %loop.exit

loop.exit:                                        ; preds = %loop.exit.loopexit, %for.body3
  %i.1.i = phi i32 [ 1, %for.body3 ], [ %inc.i.lcssa, %loop.exit.loopexit ], !dbg !94
  %3 = load i32* @max_i, align 4, !dbg !120, !tbaa !69
  %cmp6 = icmp sgt i32 %i.1.i, %3, !dbg !94
  %cond = select i1 %cmp6, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), !dbg !94
  %call8 = tail call i32 (i8*, ...)* @printf(i8* %cond) #4, !dbg !121
  %inc = add nsw i32 %i.017, 1, !dbg !122
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !29, metadata !36), !dbg !123
  %exitcond = icmp eq i32 %inc, 39, !dbg !92
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !92

for.end:                                          ; preds = %loop.exit
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !124
  %inc11 = add nsw i32 %j.018, 1, !dbg !125
  tail call void @llvm.dbg.value(metadata i32 %inc11, i64 0, metadata !30, metadata !36), !dbg !84
  %exitcond19 = icmp eq i32 %inc11, 39, !dbg !85
  br i1 %exitcond19, label %for.end12, label %for.cond1.preheader, !dbg !85

for.end12:                                        ; preds = %for.end
  ret i32 0, !dbg !126
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
!41 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !42} ; [ DW_TAG_arg_variable ] [x] [line 7]
!42 = !MDLocation(line: 9, column: 35, scope: !11)
!43 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !42)
!44 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !42)
!45 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !46} ; [ DW_TAG_arg_variable ] [x] [line 7]
!46 = !MDLocation(line: 9, column: 51, scope: !11)
!47 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !46)
!48 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !46)
!49 = !MDLocation(line: 9, column: 28, scope: !11)
!50 = !MDLocation(line: 11, column: 18, scope: !17)
!51 = !MDLocation(line: 12, column: 13, scope: !17)
!52 = !MDLocation(line: 13, column: 9, scope: !17)
!53 = !{!"0x101\00z\0016777225\000", !11, !5, !14, !54} ; [ DW_TAG_arg_variable ] [z] [line 9]
!54 = !MDLocation(line: 14, column: 12, scope: !55)
!55 = !{!"0xb\004", !1, !56}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!56 = !{!"0xb\001", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!57 = !MDLocation(line: 9, column: 23, scope: !11, inlinedAt: !54)
!58 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !59} ; [ DW_TAG_arg_variable ] [x] [line 7]
!59 = !MDLocation(line: 9, column: 35, scope: !11, inlinedAt: !54)
!60 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !59)
!61 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !59)
!62 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !63} ; [ DW_TAG_arg_variable ] [x] [line 7]
!63 = !MDLocation(line: 9, column: 51, scope: !11, inlinedAt: !54)
!64 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !63)
!65 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !63)
!66 = !MDLocation(line: 14, column: 32, scope: !67)
!67 = !{!"0xb\002", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!68 = !MDLocation(line: 14, column: 38, scope: !17)
!69 = !{!70, !70, i64 0}
!70 = !{!"int", !71, i64 0}
!71 = !{!"omnipotent char", !72, i64 0}
!72 = !{!"Simple C/C++ TBAA"}
!73 = !MDLocation(line: 14, column: 32, scope: !17)
!74 = !MDLocation(line: 14, column: 5, scope: !75)
!75 = !{!"0xb\003", !1, !17}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!76 = !MDLocation(line: 15, column: 9, scope: !17)
!77 = !MDLocation(line: 15, column: 9, scope: !56)
!78 = !{!"branch_weights", i32 0, i32 -1}
!79 = !MDLocation(line: 15, column: 9, scope: !75)
!80 = !MDLocation(line: 15, column: 9, scope: !81)
!81 = !{!"0xb\005", !1, !82}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!82 = !{!"0xb\004", !1, !67}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!83 = !MDLocation(line: 16, column: 5, scope: !17)
!84 = !MDLocation(line: 20, column: 10, scope: !25)
!85 = !MDLocation(line: 21, column: 5, scope: !86)
!86 = !{!"0xb\0021\005\000", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!87 = !MDLocation(line: 23, column: 25, scope: !88)
!88 = !{!"0xb\0022\009\004", !1, !89}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!89 = !{!"0xb\0022\009\003", !1, !90}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!90 = !{!"0xb\0021\0032\002", !1, !91}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!91 = !{!"0xb\0021\005\001", !1, !86}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/mandel-2.c]
!92 = !MDLocation(line: 22, column: 9, scope: !89)
!93 = !MDLocation(line: 23, column: 38, scope: !88)
!94 = !MDLocation(line: 23, column: 20, scope: !88)
!95 = !{!"0x101\00c\0016777227\000", !17, !5, !14, !94} ; [ DW_TAG_arg_variable ] [c] [line 11]
!96 = !MDLocation(line: 11, column: 18, scope: !17, inlinedAt: !94)
!97 = !{!"0x100\00z\0012\000", !17, !5, !14, !94} ; [ DW_TAG_auto_variable ] [z] [line 12]
!98 = !MDLocation(line: 12, column: 13, scope: !17, inlinedAt: !94)
!99 = !{!"0x100\00i\0013\000", !17, !5, !20, !94} ; [ DW_TAG_auto_variable ] [i] [line 13]
!100 = !MDLocation(line: 13, column: 9, scope: !17, inlinedAt: !94)
!101 = !{!"0x101\00z\0016777225\000", !11, !5, !14, !102} ; [ DW_TAG_arg_variable ] [z] [line 9]
!102 = !MDLocation(line: 14, column: 12, scope: !55, inlinedAt: !94)
!103 = !MDLocation(line: 9, column: 23, scope: !11, inlinedAt: !102)
!104 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !105} ; [ DW_TAG_arg_variable ] [x] [line 7]
!105 = !MDLocation(line: 9, column: 35, scope: !11, inlinedAt: !102)
!106 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !105)
!107 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !105)
!108 = !{!"0x101\00x\0016777223\000", !4, !5, !8, !109} ; [ DW_TAG_arg_variable ] [x] [line 7]
!109 = !MDLocation(line: 9, column: 51, scope: !11, inlinedAt: !102)
!110 = !MDLocation(line: 7, column: 19, scope: !4, inlinedAt: !109)
!111 = !MDLocation(line: 7, column: 31, scope: !4, inlinedAt: !109)
!112 = !MDLocation(line: 14, column: 32, scope: !67, inlinedAt: !94)
!113 = !MDLocation(line: 14, column: 38, scope: !17, inlinedAt: !94)
!114 = !MDLocation(line: 14, column: 32, scope: !17, inlinedAt: !94)
!115 = !MDLocation(line: 14, column: 5, scope: !75, inlinedAt: !94)
!116 = !MDLocation(line: 15, column: 9, scope: !17, inlinedAt: !94)
!117 = !MDLocation(line: 15, column: 9, scope: !56, inlinedAt: !94)
!118 = !MDLocation(line: 15, column: 9, scope: !75, inlinedAt: !94)
!119 = !MDLocation(line: 15, column: 9, scope: !81, inlinedAt: !94)
!120 = !MDLocation(line: 23, column: 50, scope: !88)
!121 = !MDLocation(line: 23, column: 13, scope: !88)
!122 = !MDLocation(line: 22, column: 31, scope: !88)
!123 = !MDLocation(line: 20, column: 7, scope: !25)
!124 = !MDLocation(line: 24, column: 9, scope: !90)
!125 = !MDLocation(line: 21, column: 27, scope: !91)
!126 = !MDLocation(line: 26, column: 5, scope: !25)
