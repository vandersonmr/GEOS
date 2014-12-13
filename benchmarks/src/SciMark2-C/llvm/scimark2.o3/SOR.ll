; ModuleID = 'SOR.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define double @SOR_num_flops(i32 %M, i32 %N, i32 %num_iterations) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !11), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !12), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32 %num_iterations}, i64 0, metadata !13), !dbg !41
  %1 = sitofp i32 %M to double, !dbg !42
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !14), !dbg !42
  %2 = sitofp i32 %N to double, !dbg !43
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !15), !dbg !43
  %3 = sitofp i32 %num_iterations to double, !dbg !44
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !16), !dbg !44
  %4 = fadd double %1, -1.000000e+00, !dbg !45
  %5 = fadd double %2, -1.000000e+00, !dbg !45
  %6 = fmul double %4, %5, !dbg !45
  %7 = fmul double %3, %6, !dbg !45
  %8 = fmul double %7, 6.000000e+00, !dbg !45
  ret double %8, !dbg !45
}

; Function Attrs: nounwind uwtable
define void @SOR_execute(i32 %M, i32 %N, double %omega, double** nocapture readonly %G, i32 %num_iterations) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %M}, i64 0, metadata !23), !dbg !46
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !24), !dbg !46
  tail call void @llvm.dbg.value(metadata !{double %omega}, i64 0, metadata !25), !dbg !46
  tail call void @llvm.dbg.value(metadata !{double** %G}, i64 0, metadata !26), !dbg !46
  tail call void @llvm.dbg.value(metadata !{i32 %num_iterations}, i64 0, metadata !27), !dbg !47
  %1 = fmul double %omega, 2.500000e-01, !dbg !48
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !28), !dbg !48
  %2 = fsub double 1.000000e+00, %omega, !dbg !49
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !29), !dbg !49
  %3 = add i32 %M, -1, !dbg !50
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !30), !dbg !50
  %4 = add i32 %N, -1, !dbg !51
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !31), !dbg !51
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !53
  %5 = icmp sgt i32 %num_iterations, 0, !dbg !53
  br i1 %5, label %.preheader.lr.ph, label %._crit_edge5, !dbg !53

.preheader.lr.ph:                                 ; preds = %0
  %6 = icmp sgt i32 %3, 1, !dbg !55
  %7 = icmp sgt i32 %4, 1, !dbg !58
  %8 = add i32 %M, -2, !dbg !53
  br label %.preheader, !dbg !53

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %p.04 = phi i32 [ 0, %.preheader.lr.ph ], [ %33, %._crit_edge ]
  br i1 %6, label %.lr.ph3, label %._crit_edge, !dbg !55

.lr.ph3:                                          ; preds = %.preheader
  br i1 %7, label %.lr.ph3.split.us, label %.loopexit.preheader

.loopexit.preheader:                              ; preds = %.lr.ph3
  %end.idx = add i32 %M, -1, !dbg !61
  %n.vec = and i32 %8, -32, !dbg !61
  %end.idx.rnd.down19 = or i32 %n.vec, 1, !dbg !61
  %cmp.zero = icmp eq i32 %end.idx.rnd.down19, 1, !dbg !61
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.loopexit.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 1, %.loopexit.preheader ], !dbg !61
  %index.next = add i32 %index, 32, !dbg !61
  %9 = icmp eq i32 %index.next, %end.idx.rnd.down19, !dbg !61
  br i1 %9, label %middle.block, label %vector.body, !dbg !61, !llvm.loop !62

middle.block:                                     ; preds = %vector.body, %.loopexit.preheader
  %resume.val = phi i32 [ 1, %.loopexit.preheader ], [ %end.idx.rnd.down19, %vector.body ]
  %cmp.n = icmp eq i32 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %.loopexit

.lr.ph3.split.us:                                 ; preds = %.lr.ph3
  %.phi.trans.insert = getelementptr inbounds double** %G, i64 1
  %.pre = load double** %.phi.trans.insert, align 8, !dbg !65, !tbaa !66
  br label %.lr.ph.us, !dbg !55

; <label>:10                                      ; preds = %10, %.lr.ph.us
  %11 = phi double [ %.pre14, %.lr.ph.us ], [ %20, %10 ], !dbg !70
  %12 = phi double [ %.pre12, %.lr.ph.us ], [ %25, %10 ], !dbg !70
  %indvars.iv = phi i64 [ 1, %.lr.ph.us ], [ %indvars.iv.next, %10 ]
  %13 = getelementptr inbounds double* %29, i64 %indvars.iv, !dbg !70
  %14 = load double* %13, align 8, !dbg !70, !tbaa !71
  %15 = getelementptr inbounds double* %31, i64 %indvars.iv, !dbg !70
  %16 = load double* %15, align 8, !dbg !70, !tbaa !71
  %17 = fadd double %14, %16, !dbg !70
  %18 = fadd double %17, %12, !dbg !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !58
  %19 = getelementptr inbounds double* %26, i64 %indvars.iv.next, !dbg !70
  %20 = load double* %19, align 8, !dbg !70, !tbaa !71
  %21 = fadd double %18, %20, !dbg !70
  %22 = fmul double %1, %21, !dbg !70
  %23 = getelementptr inbounds double* %26, i64 %indvars.iv, !dbg !70
  %24 = fmul double %2, %11, !dbg !70
  %25 = fadd double %22, %24, !dbg !70
  store double %25, double* %23, align 8, !dbg !70, !tbaa !71
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !58
  %exitcond6 = icmp eq i32 %lftr.wideiv, %4, !dbg !58
  br i1 %exitcond6, label %.loopexit.us, label %10, !dbg !58

.loopexit.us:                                     ; preds = %10
  %lftr.wideiv9 = trunc i64 %indvars.iv.next8 to i32, !dbg !55
  %exitcond10 = icmp eq i32 %lftr.wideiv9, %3, !dbg !55
  br i1 %exitcond10, label %._crit_edge, label %.lr.ph.us, !dbg !55

.lr.ph.us:                                        ; preds = %.lr.ph3.split.us, %.loopexit.us
  %26 = phi double* [ %31, %.loopexit.us ], [ %.pre, %.lr.ph3.split.us ], !dbg !65
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %.loopexit.us ], [ 1, %.lr.ph3.split.us ]
  tail call void @llvm.dbg.value(metadata !{double* %26}, i64 0, metadata !35), !dbg !65
  %27 = add nsw i64 %indvars.iv7, -1, !dbg !73
  %28 = getelementptr inbounds double** %G, i64 %27, !dbg !73
  %29 = load double** %28, align 8, !dbg !73, !tbaa !66
  tail call void @llvm.dbg.value(metadata !{double* %29}, i64 0, metadata !36), !dbg !73
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !55
  %30 = getelementptr inbounds double** %G, i64 %indvars.iv.next8, !dbg !61
  %31 = load double** %30, align 8, !dbg !61, !tbaa !66
  tail call void @llvm.dbg.value(metadata !{double* %31}, i64 0, metadata !37), !dbg !61
  tail call void @llvm.dbg.value(metadata !74, i64 0, metadata !34), !dbg !58
  %.pre12 = load double* %26, align 8, !dbg !70, !tbaa !71
  %.phi.trans.insert13 = getelementptr inbounds double* %26, i64 1
  %.pre14 = load double* %.phi.trans.insert13, align 8, !dbg !70, !tbaa !71
  br label %10, !dbg !58

.loopexit:                                        ; preds = %middle.block, %.loopexit
  %i.02 = phi i32 [ %32, %.loopexit ], [ %resume.val, %middle.block ]
  %32 = add nsw i32 %i.02, 1, !dbg !61
  tail call void @llvm.dbg.value(metadata !74, i64 0, metadata !34), !dbg !58
  %exitcond = icmp eq i32 %32, %3, !dbg !55
  br i1 %exitcond, label %._crit_edge, label %.loopexit, !dbg !55, !llvm.loop !75

._crit_edge:                                      ; preds = %.loopexit, %middle.block, %.loopexit.us, %.preheader
  %33 = add nsw i32 %p.04, 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !32), !dbg !53
  %exitcond11 = icmp eq i32 %33, %num_iterations, !dbg !53
  br i1 %exitcond11, label %._crit_edge5, label %.preheader, !dbg !53

._crit_edge5:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !76
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c] [DW_LANG_C99]
!1 = metadata !{metadata !"SOR.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !17}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SOR_num_flops", metadata !"SOR_num_flops", metadata !"", i32 3, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, i32)* @SOR_num_flops, null, null, metadata !10, i32 4} ; [ DW_TAG_subprogram ] [line 3] [def] [scope 4] [SOR_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16}
!11 = metadata !{i32 786689, metadata !4, metadata !"M", metadata !5, i32 16777219, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 3]
!12 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 33554435, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 3]
!13 = metadata !{i32 786689, metadata !4, metadata !"num_iterations", metadata !5, i32 50331651, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 3]
!14 = metadata !{i32 786688, metadata !4, metadata !"Md", metadata !5, i32 5, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Md] [line 5]
!15 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 6, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 6]
!16 = metadata !{i32 786688, metadata !4, metadata !"num_iterD", metadata !5, i32 7, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num_iterD] [line 7]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"SOR_execute", metadata !"SOR_execute", metadata !"", i32 12, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double, double**, i32)* @SOR_execute, null, null, metadata !22, i32 14} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 14] [SOR_execute]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !9, metadata !9, metadata !8, metadata !20, metadata !9}
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!22 = metadata !{metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37}
!23 = metadata !{i32 786689, metadata !17, metadata !"M", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [M] [line 12]
!24 = metadata !{i32 786689, metadata !17, metadata !"N", metadata !5, i32 33554444, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 12]
!25 = metadata !{i32 786689, metadata !17, metadata !"omega", metadata !5, i32 50331660, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [omega] [line 12]
!26 = metadata !{i32 786689, metadata !17, metadata !"G", metadata !5, i32 67108876, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [G] [line 12]
!27 = metadata !{i32 786689, metadata !17, metadata !"num_iterations", metadata !5, i32 83886093, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_iterations] [line 13]
!28 = metadata !{i32 786688, metadata !17, metadata !"omega_over_four", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [omega_over_four] [line 16]
!29 = metadata !{i32 786688, metadata !17, metadata !"one_minus_omega", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [one_minus_omega] [line 17]
!30 = metadata !{i32 786688, metadata !17, metadata !"Mm1", metadata !5, i32 21, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Mm1] [line 21]
!31 = metadata !{i32 786688, metadata !17, metadata !"Nm1", metadata !5, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nm1] [line 22]
!32 = metadata !{i32 786688, metadata !17, metadata !"p", metadata !5, i32 23, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 23]
!33 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 24, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 24]
!34 = metadata !{i32 786688, metadata !17, metadata !"j", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!35 = metadata !{i32 786688, metadata !17, metadata !"Gi", metadata !5, i32 26, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gi] [line 26]
!36 = metadata !{i32 786688, metadata !17, metadata !"Gim1", metadata !5, i32 27, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gim1] [line 27]
!37 = metadata !{i32 786688, metadata !17, metadata !"Gip1", metadata !5, i32 28, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Gip1] [line 28]
!38 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!39 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!40 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!41 = metadata !{i32 3, i32 0, metadata !4, null}
!42 = metadata !{i32 5, i32 0, metadata !4, null}
!43 = metadata !{i32 6, i32 0, metadata !4, null}
!44 = metadata !{i32 7, i32 0, metadata !4, null}
!45 = metadata !{i32 9, i32 0, metadata !4, null}
!46 = metadata !{i32 12, i32 0, metadata !17, null}
!47 = metadata !{i32 13, i32 0, metadata !17, null}
!48 = metadata !{i32 16, i32 0, metadata !17, null}
!49 = metadata !{i32 17, i32 0, metadata !17, null}
!50 = metadata !{i32 21, i32 0, metadata !17, null}
!51 = metadata !{i32 22, i32 0, metadata !17, null}
!52 = metadata !{i32 0}
!53 = metadata !{i32 30, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !17, i32 30, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!55 = metadata !{i32 32, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !57, i32 32, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!57 = metadata !{i32 786443, metadata !1, metadata !54, i32 31, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!58 = metadata !{i32 37, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 37, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!60 = metadata !{i32 786443, metadata !1, metadata !56, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/SOR.c]
!61 = metadata !{i32 36, i32 0, metadata !60, null}
!62 = metadata !{metadata !62, metadata !63, metadata !64}
!63 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!64 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!65 = metadata !{i32 34, i32 0, metadata !60, null}
!66 = metadata !{metadata !67, metadata !67, i64 0}
!67 = metadata !{metadata !"any pointer", metadata !68, i64 0}
!68 = metadata !{metadata !"omnipotent char", metadata !69, i64 0}
!69 = metadata !{metadata !"Simple C/C++ TBAA"}
!70 = metadata !{i32 38, i32 0, metadata !59, null}
!71 = metadata !{metadata !72, metadata !72, i64 0}
!72 = metadata !{metadata !"double", metadata !68, i64 0}
!73 = metadata !{i32 35, i32 0, metadata !60, null}
!74 = metadata !{i32 1}
!75 = metadata !{metadata !75, metadata !63, metadata !64}
!76 = metadata !{i32 42, i32 0, metadata !17, null}
