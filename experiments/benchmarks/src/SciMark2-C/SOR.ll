; ModuleID = 'SOR.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define double @SOR_num_flops(i32 %M, i32 %N, i32 %num_iterations) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !12, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !13, metadata !42), !dbg !44
  tail call void @llvm.dbg.value(metadata i32 %num_iterations, i64 0, metadata !14, metadata !42), !dbg !45
  %conv = sitofp i32 %M to double, !dbg !46
  tail call void @llvm.dbg.value(metadata double %conv, i64 0, metadata !15, metadata !42), !dbg !47
  %conv1 = sitofp i32 %N to double, !dbg !48
  tail call void @llvm.dbg.value(metadata double %conv1, i64 0, metadata !16, metadata !42), !dbg !49
  %conv2 = sitofp i32 %num_iterations to double, !dbg !50
  tail call void @llvm.dbg.value(metadata double %conv2, i64 0, metadata !17, metadata !42), !dbg !51
  %sub = fadd double %conv, -1.000000e+00, !dbg !52
  %sub3 = fadd double %conv1, -1.000000e+00, !dbg !53
  %mul = fmul double %sub, %sub3, !dbg !54
  %mul4 = fmul double %conv2, %mul, !dbg !54
  %mul5 = fmul double %mul4, 6.000000e+00, !dbg !54
  ret double %mul5, !dbg !55
}

; Function Attrs: nounwind uwtable
define void @SOR_execute(i32 %M, i32 %N, double %omega, double** nocapture readonly %G, i32 %num_iterations) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !24, metadata !42), !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !25, metadata !42), !dbg !57
  tail call void @llvm.dbg.value(metadata double %omega, i64 0, metadata !26, metadata !42), !dbg !58
  tail call void @llvm.dbg.value(metadata double** %G, i64 0, metadata !27, metadata !42), !dbg !59
  tail call void @llvm.dbg.value(metadata i32 %num_iterations, i64 0, metadata !28, metadata !42), !dbg !60
  %mul = fmul double %omega, 2.500000e-01, !dbg !61
  tail call void @llvm.dbg.value(metadata double %mul, i64 0, metadata !29, metadata !42), !dbg !62
  %sub = fsub double 1.000000e+00, %omega, !dbg !63
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !30, metadata !42), !dbg !64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !42), !dbg !65
  %cmp62 = icmp sgt i32 %num_iterations, 0, !dbg !66
  br i1 %cmp62, label %for.cond3.preheader.lr.ph, label %for.end39, !dbg !69

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %M, -2, !dbg !69
  %1 = add i32 %N, -2, !dbg !69
  %2 = add i32 %num_iterations, -1, !dbg !69
  br label %for.cond3.preheader, !dbg !69

for.cond3.preheader:                              ; preds = %for.inc37, %for.cond3.preheader.lr.ph
  %p.063 = phi i32 [ 0, %for.cond3.preheader.lr.ph ], [ %inc38, %for.inc37 ]
  %cmp460.not = icmp slt i32 %M, 3, !dbg !70
  %cmp1258.not = icmp slt i32 %N, 3, !dbg !70
  %brmerge = or i1 %cmp460.not, %cmp1258.not, !dbg !70
  br i1 %brmerge, label %for.inc37, label %for.body5.lr.ph.split.us, !dbg !70

for.body5.lr.ph.split.us:                         ; preds = %for.cond3.preheader
  %arrayidx.us.phi.trans.insert = getelementptr inbounds double** %G, i64 1
  %.pre = load double** %arrayidx.us.phi.trans.insert, align 8, !dbg !73, !tbaa !76
  br label %for.body13.lr.ph.us, !dbg !70

for.body13.us:                                    ; preds = %for.body13.us, %for.body13.lr.ph.us
  %3 = phi double [ %.pre72, %for.body13.lr.ph.us ], [ %7, %for.body13.us ], !dbg !80
  %4 = phi double [ %.pre71, %for.body13.lr.ph.us ], [ %add31.us, %for.body13.us ], !dbg !80
  %indvars.iv = phi i64 [ 1, %for.body13.lr.ph.us ], [ %indvars.iv.next, %for.body13.us ]
  %arrayidx15.us = getelementptr inbounds double* %10, i64 %indvars.iv, !dbg !80
  %5 = load double* %arrayidx15.us, align 8, !dbg !80, !tbaa !83
  %arrayidx17.us = getelementptr inbounds double* %11, i64 %indvars.iv, !dbg !85
  %6 = load double* %arrayidx17.us, align 8, !dbg !85, !tbaa !83
  %add18.us = fadd double %5, %6, !dbg !80
  %add22.us = fadd double %add18.us, %4, !dbg !80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !86
  %arrayidx25.us = getelementptr inbounds double* %8, i64 %indvars.iv.next, !dbg !87
  %7 = load double* %arrayidx25.us, align 8, !dbg !87, !tbaa !83
  %add26.us = fadd double %add22.us, %7, !dbg !80
  %mul27.us = fmul double %mul, %add26.us, !dbg !88
  %arrayidx29.us = getelementptr inbounds double* %8, i64 %indvars.iv, !dbg !89
  %mul30.us = fmul double %sub, %3, !dbg !90
  %add31.us = fadd double %mul27.us, %mul30.us, !dbg !88
  store double %add31.us, double* %arrayidx29.us, align 8, !dbg !91, !tbaa !83
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !86
  %exitcond = icmp eq i32 %lftr.wideiv, %1, !dbg !86
  br i1 %exitcond, label %for.cond3.loopexit.us, label %for.body13.us, !dbg !86

for.cond3.loopexit.us:                            ; preds = %for.body13.us
  %lftr.wideiv68 = trunc i64 %indvars.iv65 to i32, !dbg !70
  %exitcond69 = icmp eq i32 %lftr.wideiv68, %0, !dbg !70
  br i1 %exitcond69, label %for.inc37.loopexit, label %for.body13.lr.ph.us, !dbg !70

for.body13.lr.ph.us:                              ; preds = %for.body5.lr.ph.split.us, %for.cond3.loopexit.us
  %8 = phi double* [ %11, %for.cond3.loopexit.us ], [ %.pre, %for.body5.lr.ph.split.us ], !dbg !73
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.cond3.loopexit.us ], [ 1, %for.body5.lr.ph.split.us ]
  tail call void @llvm.dbg.value(metadata double* %8, i64 0, metadata !36, metadata !42), !dbg !92
  %9 = add nsw i64 %indvars.iv65, -1, !dbg !93
  %arrayidx8.us = getelementptr inbounds double** %G, i64 %9, !dbg !94
  %10 = load double** %arrayidx8.us, align 8, !dbg !94, !tbaa !76
  tail call void @llvm.dbg.value(metadata double* %10, i64 0, metadata !37, metadata !42), !dbg !95
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1, !dbg !70
  %arrayidx10.us = getelementptr inbounds double** %G, i64 %indvars.iv.next66, !dbg !96
  %11 = load double** %arrayidx10.us, align 8, !dbg !96, !tbaa !76
  tail call void @llvm.dbg.value(metadata double* %11, i64 0, metadata !38, metadata !42), !dbg !97
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !35, metadata !42), !dbg !98
  %.pre71 = load double* %8, align 8, !dbg !99, !tbaa !83
  %arrayidx29.us.phi.trans.insert = getelementptr inbounds double* %8, i64 1
  %.pre72 = load double* %arrayidx29.us.phi.trans.insert, align 8, !dbg !89, !tbaa !83
  br label %for.body13.us, !dbg !86

for.inc37.loopexit:                               ; preds = %for.cond3.loopexit.us
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.loopexit, %for.cond3.preheader
  %inc38 = add nuw nsw i32 %p.063, 1, !dbg !100
  tail call void @llvm.dbg.value(metadata i32 %inc38, i64 0, metadata !33, metadata !42), !dbg !65
  %exitcond70 = icmp eq i32 %p.063, %2, !dbg !69
  br i1 %exitcond70, label %for.end39.loopexit, label %for.cond3.preheader, !dbg !69

for.end39.loopexit:                               ; preds = %for.inc37
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %entry
  ret void, !dbg !101
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c] [DW_LANG_C99]
!1 = !{!"SOR.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !18}
!6 = !{!"0x2e\00SOR_num_flops\00SOR_num_flops\00\003\000\001\000\000\00256\001\004", !1, !7, !8, null, double (i32, i32, i32)* @SOR_num_flops, null, null, !11} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [SOR_num_flops]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !10, !10, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13, !14, !15, !16, !17}
!12 = !{!"0x101\00M\0016777219\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 3]
!13 = !{!"0x101\00N\0033554435\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 3]
!14 = !{!"0x101\00num_iterations\0050331651\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [num_iterations] [line 3]
!15 = !{!"0x100\00Md\005\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [Md] [line 5]
!16 = !{!"0x100\00Nd\006\000", !6, !7, !4}        ; [ DW_TAG_auto_variable ] [Nd] [line 6]
!17 = !{!"0x100\00num_iterD\007\000", !6, !7, !4} ; [ DW_TAG_auto_variable ] [num_iterD] [line 7]
!18 = !{!"0x2e\00SOR_execute\00SOR_execute\00\0012\000\001\000\000\00256\001\0014", !1, !7, !19, null, void (i32, i32, double, double**, i32)* @SOR_execute, null, null, !23} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 14] [SOR_execute]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{null, !10, !10, !4, !21, !10}
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!23 = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!24 = !{!"0x101\00M\0016777228\000", !18, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 12]
!25 = !{!"0x101\00N\0033554444\000", !18, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 12]
!26 = !{!"0x101\00omega\0050331660\000", !18, !7, !4} ; [ DW_TAG_arg_variable ] [omega] [line 12]
!27 = !{!"0x101\00G\0067108876\000", !18, !7, !21} ; [ DW_TAG_arg_variable ] [G] [line 12]
!28 = !{!"0x101\00num_iterations\0083886093\000", !18, !7, !10} ; [ DW_TAG_arg_variable ] [num_iterations] [line 13]
!29 = !{!"0x100\00omega_over_four\0016\000", !18, !7, !4} ; [ DW_TAG_auto_variable ] [omega_over_four] [line 16]
!30 = !{!"0x100\00one_minus_omega\0017\000", !18, !7, !4} ; [ DW_TAG_auto_variable ] [one_minus_omega] [line 17]
!31 = !{!"0x100\00Mm1\0021\000", !18, !7, !10}    ; [ DW_TAG_auto_variable ] [Mm1] [line 21]
!32 = !{!"0x100\00Nm1\0022\000", !18, !7, !10}    ; [ DW_TAG_auto_variable ] [Nm1] [line 22]
!33 = !{!"0x100\00p\0023\000", !18, !7, !10}      ; [ DW_TAG_auto_variable ] [p] [line 23]
!34 = !{!"0x100\00i\0024\000", !18, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 24]
!35 = !{!"0x100\00j\0025\000", !18, !7, !10}      ; [ DW_TAG_auto_variable ] [j] [line 25]
!36 = !{!"0x100\00Gi\0026\000", !18, !7, !22}     ; [ DW_TAG_auto_variable ] [Gi] [line 26]
!37 = !{!"0x100\00Gim1\0027\000", !18, !7, !22}   ; [ DW_TAG_auto_variable ] [Gim1] [line 27]
!38 = !{!"0x100\00Gip1\0028\000", !18, !7, !22}   ; [ DW_TAG_auto_variable ] [Gip1] [line 28]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 3, column: 30, scope: !6)
!44 = !MDLocation(line: 3, column: 37, scope: !6)
!45 = !MDLocation(line: 3, column: 44, scope: !6)
!46 = !MDLocation(line: 5, column: 21, scope: !6)
!47 = !MDLocation(line: 5, column: 16, scope: !6)
!48 = !MDLocation(line: 6, column: 21, scope: !6)
!49 = !MDLocation(line: 6, column: 16, scope: !6)
!50 = !MDLocation(line: 7, column: 28, scope: !6)
!51 = !MDLocation(line: 7, column: 16, scope: !6)
!52 = !MDLocation(line: 9, column: 17, scope: !6)
!53 = !MDLocation(line: 9, column: 24, scope: !6)
!54 = !MDLocation(line: 9, column: 16, scope: !6)
!55 = !MDLocation(line: 9, column: 9, scope: !6)
!56 = !MDLocation(line: 12, column: 26, scope: !18)
!57 = !MDLocation(line: 12, column: 33, scope: !18)
!58 = !MDLocation(line: 12, column: 43, scope: !18)
!59 = !MDLocation(line: 12, column: 59, scope: !18)
!60 = !MDLocation(line: 13, column: 13, scope: !18)
!61 = !MDLocation(line: 16, column: 34, scope: !18)
!62 = !MDLocation(line: 16, column: 16, scope: !18)
!63 = !MDLocation(line: 17, column: 34, scope: !18)
!64 = !MDLocation(line: 17, column: 16, scope: !18)
!65 = !MDLocation(line: 23, column: 13, scope: !18)
!66 = !MDLocation(line: 30, column: 19, scope: !67)
!67 = !{!"0xb\0030\009\001", !1, !68}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!68 = !{!"0xb\0030\009\000", !1, !18}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!69 = !MDLocation(line: 30, column: 9, scope: !68)
!70 = !MDLocation(line: 32, column: 13, scope: !71)
!71 = !{!"0xb\0032\0013\003", !1, !72}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!72 = !{!"0xb\0031\009\002", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!73 = !MDLocation(line: 34, column: 22, scope: !74)
!74 = !{!"0xb\0033\0013\005", !1, !75}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!75 = !{!"0xb\0032\0013\004", !1, !71}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!76 = !{!77, !77, i64 0}
!77 = !{!"any pointer", !78, i64 0}
!78 = !{!"omnipotent char", !79, i64 0}
!79 = !{!"Simple C/C++ TBAA"}
!80 = !MDLocation(line: 38, column: 48, scope: !81)
!81 = !{!"0xb\0037\0017\007", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!82 = !{!"0xb\0037\0017\006", !1, !74}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SOR.c]
!83 = !{!84, !84, i64 0}
!84 = !{!"double", !78, i64 0}
!85 = !MDLocation(line: 38, column: 58, scope: !81)
!86 = !MDLocation(line: 37, column: 17, scope: !82)
!87 = !MDLocation(line: 39, column: 35, scope: !81)
!88 = !MDLocation(line: 38, column: 29, scope: !81)
!89 = !MDLocation(line: 39, column: 64, scope: !81)
!90 = !MDLocation(line: 39, column: 46, scope: !81)
!91 = !MDLocation(line: 38, column: 21, scope: !81)
!92 = !MDLocation(line: 26, column: 17, scope: !18)
!93 = !MDLocation(line: 35, column: 26, scope: !74)
!94 = !MDLocation(line: 35, column: 24, scope: !74)
!95 = !MDLocation(line: 27, column: 17, scope: !18)
!96 = !MDLocation(line: 36, column: 24, scope: !74)
!97 = !MDLocation(line: 28, column: 17, scope: !18)
!98 = !MDLocation(line: 25, column: 13, scope: !18)
!99 = !MDLocation(line: 38, column: 68, scope: !81)
!100 = !MDLocation(line: 30, column: 37, scope: !67)
!101 = !MDLocation(line: 42, column: 5, scope: !18)
