; ModuleID = 'SparseCompRow.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define double @SparseCompRow_num_flops(i32 %N, i32 %nz, i32 %num_iterations) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %N, i64 0, metadata !12, metadata !44), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 %nz, i64 0, metadata !13, metadata !44), !dbg !46
  tail call void @llvm.dbg.value(metadata i32 %num_iterations, i64 0, metadata !14, metadata !44), !dbg !47
  %div = srem i32 %nz, %N, !dbg !48
  %mul = sub i32 %nz, %div, !dbg !48
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !15, metadata !44), !dbg !49
  %conv = sitofp i32 %mul to double, !dbg !50
  %mul1 = fmul double %conv, 2.000000e+00, !dbg !51
  %conv2 = sitofp i32 %num_iterations to double, !dbg !52
  %mul3 = fmul double %conv2, %mul1, !dbg !51
  ret double %mul3, !dbg !53
}

; Function Attrs: nounwind uwtable
define void @SparseCompRow_matmult(i32 %M, double* nocapture %y, double* nocapture readonly %val, i32* nocapture readonly %row, i32* nocapture readonly %col, double* nocapture readonly %x, i32 %NUM_ITERATIONS) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %M, i64 0, metadata !22, metadata !44), !dbg !54
  tail call void @llvm.dbg.value(metadata double* %y, i64 0, metadata !23, metadata !44), !dbg !55
  tail call void @llvm.dbg.value(metadata double* %val, i64 0, metadata !24, metadata !44), !dbg !56
  tail call void @llvm.dbg.value(metadata i32* %row, i64 0, metadata !25, metadata !44), !dbg !57
  tail call void @llvm.dbg.value(metadata i32* %col, i64 0, metadata !26, metadata !44), !dbg !58
  tail call void @llvm.dbg.value(metadata double* %x, i64 0, metadata !27, metadata !44), !dbg !59
  tail call void @llvm.dbg.value(metadata i32 %NUM_ITERATIONS, i64 0, metadata !28, metadata !44), !dbg !60
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !44), !dbg !61
  %cmp39 = icmp sgt i32 %NUM_ITERATIONS, 0, !dbg !62
  %cmp237 = icmp sgt i32 %M, 0, !dbg !63
  %or.cond = and i1 %cmp39, %cmp237, !dbg !64
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.split.us, label %for.end23, !dbg !64

for.cond1.preheader.lr.ph.split.us:               ; preds = %entry
  %0 = add i32 %M, -1, !dbg !64
  %1 = add i32 %NUM_ITERATIONS, -1, !dbg !64
  br label %for.body3.lr.ph.us, !dbg !64

for.inc21.us:                                     ; preds = %for.end.us
  %inc22.us = add nuw nsw i32 %reps.040.us, 1, !dbg !65
  tail call void @llvm.dbg.value(metadata i32 %inc22.us, i64 0, metadata !29, metadata !44), !dbg !61
  %exitcond45 = icmp eq i32 %reps.040.us, %1, !dbg !64
  br i1 %exitcond45, label %for.end23.loopexit, label %for.body3.lr.ph.us, !dbg !64

for.body3.us:                                     ; preds = %for.end.us, %for.body3.lr.ph.us
  %indvars.iv41 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next42, %for.end.us ]
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !32, metadata !44), !dbg !66
  %arrayidx.us = getelementptr inbounds i32* %row, i64 %indvars.iv41, !dbg !67
  %2 = load i32* %arrayidx.us, align 4, !dbg !67, !tbaa !68
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !39, metadata !44), !dbg !72
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !73
  %arrayidx5.us = getelementptr inbounds i32* %row, i64 %indvars.iv.next42, !dbg !74
  %3 = load i32* %arrayidx5.us, align 4, !dbg !74, !tbaa !68
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !40, metadata !44), !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !31, metadata !44), !dbg !76
  %cmp734.us = icmp slt i32 %2, %3, !dbg !77
  br i1 %cmp734.us, label %for.body8.lr.ph.us, label %for.end.us, !dbg !80

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body8.us
  %add15.us.lcssa.ph = phi double [ %add15.us.1, %for.body8.us ]
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body8.lr.ph.us.split, %for.end.us.loopexit.unr-lcssa
  %add15.us.lcssa = phi double [ %add15.us.lcssa.unr, %for.body8.lr.ph.us.split ], [ %add15.us.lcssa.ph, %for.end.us.loopexit.unr-lcssa ]
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us
  %sum.0.lcssa.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add15.us.lcssa, %for.end.us.loopexit ]
  %arrayidx17.us = getelementptr inbounds double* %y, i64 %indvars.iv41, !dbg !81
  store double %sum.0.lcssa.us, double* %arrayidx17.us, align 8, !dbg !81, !tbaa !82
  %lftr.wideiv43 = trunc i64 %indvars.iv41 to i32, !dbg !73
  %exitcond44 = icmp eq i32 %lftr.wideiv43, %0, !dbg !73
  br i1 %exitcond44, label %for.inc21.us, label %for.body3.us, !dbg !73

for.body8.us:                                     ; preds = %for.body8.us, %for.body8.lr.ph.us.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body8.lr.ph.us.split.split ], [ %indvars.iv.next.1, %for.body8.us ]
  %sum.036.us = phi double [ %sum.036.us.unr, %for.body8.lr.ph.us.split.split ], [ %add15.us.1, %for.body8.us ]
  %arrayidx10.us = getelementptr inbounds i32* %col, i64 %indvars.iv, !dbg !84
  %4 = load i32* %arrayidx10.us, align 4, !dbg !84, !tbaa !68
  %idxprom11.us = sext i32 %4 to i64, !dbg !85
  %arrayidx12.us = getelementptr inbounds double* %x, i64 %idxprom11.us, !dbg !85
  %5 = load double* %arrayidx12.us, align 8, !dbg !85, !tbaa !82
  %arrayidx14.us = getelementptr inbounds double* %val, i64 %indvars.iv, !dbg !86
  %6 = load double* %arrayidx14.us, align 8, !dbg !86, !tbaa !82
  %mul.us = fmul double %5, %6, !dbg !85
  %add15.us = fadd double %sum.036.us, %mul.us, !dbg !87
  tail call void @llvm.dbg.value(metadata double %add15.us, i64 0, metadata !32, metadata !44), !dbg !66
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !80
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !80
  %arrayidx10.us.1 = getelementptr inbounds i32* %col, i64 %indvars.iv.next, !dbg !84
  %7 = load i32* %arrayidx10.us.1, align 4, !dbg !84, !tbaa !68
  %idxprom11.us.1 = sext i32 %7 to i64, !dbg !85
  %arrayidx12.us.1 = getelementptr inbounds double* %x, i64 %idxprom11.us.1, !dbg !85
  %8 = load double* %arrayidx12.us.1, align 8, !dbg !85, !tbaa !82
  %arrayidx14.us.1 = getelementptr inbounds double* %val, i64 %indvars.iv.next, !dbg !86
  %9 = load double* %arrayidx14.us.1, align 8, !dbg !86, !tbaa !82
  %mul.us.1 = fmul double %8, %9, !dbg !85
  %add15.us.1 = fadd double %add15.us, %mul.us.1, !dbg !87
  tail call void @llvm.dbg.value(metadata double %add15.us, i64 0, metadata !32, metadata !44), !dbg !66
  %indvars.iv.next.1 = add nsw i64 %indvars.iv.next, 1, !dbg !80
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !80
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %11, !dbg !80
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body8.us, !dbg !80

for.body8.lr.ph.us:                               ; preds = %for.body3.us
  %10 = sext i32 %2 to i64
  %11 = add i32 %3, -1, !dbg !80
  %12 = sub i32 %3, %2
  %xtraiter = and i32 %12, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %12, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body8.us.prol.preheader, label %for.body8.lr.ph.us.split

for.body8.us.prol.preheader:                      ; preds = %for.body8.lr.ph.us
  br label %for.body8.us.prol, !dbg !84

for.body8.us.prol:                                ; preds = %for.body8.us.prol.preheader, %for.body8.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.us.prol ], [ %10, %for.body8.us.prol.preheader ]
  %sum.036.us.prol = phi double [ %add15.us.prol, %for.body8.us.prol ], [ 0.000000e+00, %for.body8.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body8.us.prol ], [ %xtraiter, %for.body8.us.prol.preheader ]
  %arrayidx10.us.prol = getelementptr inbounds i32* %col, i64 %indvars.iv.prol, !dbg !84
  %13 = load i32* %arrayidx10.us.prol, align 4, !dbg !84, !tbaa !68
  %idxprom11.us.prol = sext i32 %13 to i64, !dbg !85
  %arrayidx12.us.prol = getelementptr inbounds double* %x, i64 %idxprom11.us.prol, !dbg !85
  %14 = load double* %arrayidx12.us.prol, align 8, !dbg !85, !tbaa !82
  %arrayidx14.us.prol = getelementptr inbounds double* %val, i64 %indvars.iv.prol, !dbg !86
  %15 = load double* %arrayidx14.us.prol, align 8, !dbg !86, !tbaa !82
  %mul.us.prol = fmul double %14, %15, !dbg !85
  %add15.us.prol = fadd double %sum.036.us.prol, %mul.us.prol, !dbg !87
  tail call void @llvm.dbg.value(metadata double %add15.us.prol, i64 0, metadata !32, metadata !44), !dbg !66
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1, !dbg !80
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !80
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %11, !dbg !80
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !80
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !80
  br i1 %prol.iter.cmp, label %for.body8.us.prol, label %for.body8.lr.ph.us.split.loopexit, !llvm.loop !88

for.body8.lr.ph.us.split.loopexit:                ; preds = %for.body8.us.prol
  %add15.us.lcssa.unr.ph = phi double [ %add15.us.prol, %for.body8.us.prol ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body8.us.prol ]
  %sum.036.us.unr.ph = phi double [ %add15.us.prol, %for.body8.us.prol ]
  br label %for.body8.lr.ph.us.split

for.body8.lr.ph.us.split:                         ; preds = %for.body8.lr.ph.us.split.loopexit, %for.body8.lr.ph.us
  %add15.us.lcssa.unr = phi double [ 0.000000e+00, %for.body8.lr.ph.us ], [ %add15.us.lcssa.unr.ph, %for.body8.lr.ph.us.split.loopexit ]
  %indvars.iv.unr = phi i64 [ %10, %for.body8.lr.ph.us ], [ %indvars.iv.unr.ph, %for.body8.lr.ph.us.split.loopexit ]
  %sum.036.us.unr = phi double [ 0.000000e+00, %for.body8.lr.ph.us ], [ %sum.036.us.unr.ph, %for.body8.lr.ph.us.split.loopexit ]
  %16 = icmp ult i32 %12, 2
  br i1 %16, label %for.end.us.loopexit, label %for.body8.lr.ph.us.split.split

for.body8.lr.ph.us.split.split:                   ; preds = %for.body8.lr.ph.us.split
  br label %for.body8.us, !dbg !80

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.lr.ph.split.us, %for.inc21.us
  %reps.040.us = phi i32 [ 0, %for.cond1.preheader.lr.ph.split.us ], [ %inc22.us, %for.inc21.us ]
  br label %for.body3.us, !dbg !73

for.end23.loopexit:                               ; preds = %for.inc21.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  ret void, !dbg !90
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!41, !42}
!llvm.ident = !{!43}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c] [DW_LANG_C99]
!1 = !{!"SparseCompRow.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!6, !16}
!6 = !{!"0x2e\00SparseCompRow_num_flops\00SparseCompRow_num_flops\00\004\000\001\000\000\00256\001\005", !1, !7, !8, null, double (i32, i32, i32)* @SparseCompRow_num_flops, null, null, !11} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [SparseCompRow_num_flops]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{!4, !10, !10, !10}
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!12, !13, !14, !15}
!12 = !{!"0x101\00N\0016777220\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [N] [line 4]
!13 = !{!"0x101\00nz\0033554436\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [nz] [line 4]
!14 = !{!"0x101\00num_iterations\0050331652\000", !6, !7, !10} ; [ DW_TAG_arg_variable ] [num_iterations] [line 4]
!15 = !{!"0x100\00actual_nz\009\000", !6, !7, !10} ; [ DW_TAG_auto_variable ] [actual_nz] [line 9]
!16 = !{!"0x2e\00SparseCompRow_matmult\00SparseCompRow_matmult\00\0022\000\001\000\000\00256\001\0024", !1, !7, !17, null, void (i32, double*, double*, i32*, i32*, double*, i32)* @SparseCompRow_matmult, null, null, !21} ; [ DW_TAG_subprogram ] [line 22] [def] [scope 24] [SparseCompRow_matmult]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{null, !10, !19, !19, !20, !20, !19, !10}
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !39, !40}
!22 = !{!"0x101\00M\0016777238\000", !16, !7, !10} ; [ DW_TAG_arg_variable ] [M] [line 22]
!23 = !{!"0x101\00y\0033554454\000", !16, !7, !19} ; [ DW_TAG_arg_variable ] [y] [line 22]
!24 = !{!"0x101\00val\0050331670\000", !16, !7, !19} ; [ DW_TAG_arg_variable ] [val] [line 22]
!25 = !{!"0x101\00row\0067108886\000", !16, !7, !20} ; [ DW_TAG_arg_variable ] [row] [line 22]
!26 = !{!"0x101\00col\0083886103\000", !16, !7, !20} ; [ DW_TAG_arg_variable ] [col] [line 23]
!27 = !{!"0x101\00x\00100663319\000", !16, !7, !19} ; [ DW_TAG_arg_variable ] [x] [line 23]
!28 = !{!"0x101\00NUM_ITERATIONS\00117440535\000", !16, !7, !10} ; [ DW_TAG_arg_variable ] [NUM_ITERATIONS] [line 23]
!29 = !{!"0x100\00reps\0025\000", !16, !7, !10}   ; [ DW_TAG_auto_variable ] [reps] [line 25]
!30 = !{!"0x100\00r\0026\000", !16, !7, !10}      ; [ DW_TAG_auto_variable ] [r] [line 26]
!31 = !{!"0x100\00i\0027\000", !16, !7, !10}      ; [ DW_TAG_auto_variable ] [i] [line 27]
!32 = !{!"0x100\00sum\0034\000", !33, !7, !4}     ; [ DW_TAG_auto_variable ] [sum] [line 34]
!33 = !{!"0xb\0033\0013\005", !1, !34}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!34 = !{!"0xb\0032\0013\004", !1, !35}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!35 = !{!"0xb\0032\0013\003", !1, !36}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!36 = !{!"0xb\0030\009\002", !1, !37}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!37 = !{!"0xb\0029\009\001", !1, !38}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!38 = !{!"0xb\0029\009\000", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!39 = !{!"0x100\00rowR\0035\000", !33, !7, !10}   ; [ DW_TAG_auto_variable ] [rowR] [line 35]
!40 = !{!"0x100\00rowRp1\0036\000", !33, !7, !10} ; [ DW_TAG_auto_variable ] [rowRp1] [line 36]
!41 = !{i32 2, !"Dwarf Version", i32 4}
!42 = !{i32 2, !"Debug Info Version", i32 2}
!43 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!44 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!45 = !MDLocation(line: 4, column: 40, scope: !6)
!46 = !MDLocation(line: 4, column: 47, scope: !6)
!47 = !MDLocation(line: 4, column: 55, scope: !6)
!48 = !MDLocation(line: 9, column: 25, scope: !6)
!49 = !MDLocation(line: 9, column: 13, scope: !6)
!50 = !MDLocation(line: 10, column: 17, scope: !6)
!51 = !MDLocation(line: 10, column: 16, scope: !6)
!52 = !MDLocation(line: 10, column: 45, scope: !6)
!53 = !MDLocation(line: 10, column: 9, scope: !6)
!54 = !MDLocation(line: 22, column: 37, scope: !16)
!55 = !MDLocation(line: 22, column: 48, scope: !16)
!56 = !MDLocation(line: 22, column: 59, scope: !16)
!57 = !MDLocation(line: 22, column: 69, scope: !16)
!58 = !MDLocation(line: 23, column: 14, scope: !16)
!59 = !MDLocation(line: 23, column: 27, scope: !16)
!60 = !MDLocation(line: 23, column: 34, scope: !16)
!61 = !MDLocation(line: 25, column: 13, scope: !16)
!62 = !MDLocation(line: 29, column: 22, scope: !37)
!63 = !MDLocation(line: 32, column: 23, scope: !34)
!64 = !MDLocation(line: 29, column: 9, scope: !38)
!65 = !MDLocation(line: 29, column: 43, scope: !37)
!66 = !MDLocation(line: 34, column: 24, scope: !33)
!67 = !MDLocation(line: 35, column: 28, scope: !33)
!68 = !{!69, !69, i64 0}
!69 = !{!"int", !70, i64 0}
!70 = !{!"omnipotent char", !71, i64 0}
!71 = !{!"Simple C/C++ TBAA"}
!72 = !MDLocation(line: 35, column: 21, scope: !33)
!73 = !MDLocation(line: 32, column: 13, scope: !35)
!74 = !MDLocation(line: 36, column: 30, scope: !33)
!75 = !MDLocation(line: 36, column: 21, scope: !33)
!76 = !MDLocation(line: 27, column: 13, scope: !16)
!77 = !MDLocation(line: 37, column: 30, scope: !78)
!78 = !{!"0xb\0037\0017\007", !1, !79}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!79 = !{!"0xb\0037\0017\006", !1, !33}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/SparseCompRow.c]
!80 = !MDLocation(line: 37, column: 17, scope: !79)
!81 = !MDLocation(line: 39, column: 17, scope: !33)
!82 = !{!83, !83, i64 0}
!83 = !{!"double", !70, i64 0}
!84 = !MDLocation(line: 38, column: 31, scope: !78)
!85 = !MDLocation(line: 38, column: 28, scope: !78)
!86 = !MDLocation(line: 38, column: 42, scope: !78)
!87 = !MDLocation(line: 38, column: 21, scope: !78)
!88 = distinct !{!88, !89}
!89 = !{!"llvm.loop.unroll.disable"}
!90 = !MDLocation(line: 42, column: 5, scope: !16)
