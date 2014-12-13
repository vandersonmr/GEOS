; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind optsize uwtable
define i32 @sgefa(%struct.FULL* nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !42
  %2 = load i32* %1, align 4, !dbg !42, !tbaa !44
  %3 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !42
  %4 = load i32* %3, align 4, !dbg !42, !tbaa !49
  %5 = icmp eq i32 %2, %4, !dbg !42
  br i1 %5, label %6, label %62, !dbg !42

; <label>:6                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !31), !dbg !50
  %7 = add i32 %2, -1, !dbg !51
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !29), !dbg !51
  %8 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !52
  %9 = load float** %8, align 8, !dbg !52, !tbaa !53
  tail call void @llvm.dbg.value(metadata !{float* %9}, i64 0, metadata !33), !dbg !52
  tail call void @llvm.dbg.value(metadata !55, i64 0, metadata !30), !dbg !56
  %10 = icmp sgt i32 %2, 1, !dbg !57
  %11 = icmp sgt i32 %7, 0, !dbg !59
  %or.cond = and i1 %10, %11, !dbg !57
  br i1 %or.cond, label %.lr.ph17, label %.loopexit4, !dbg !57

.lr.ph17:                                         ; preds = %6
  %12 = add i32 %2, -2, !dbg !59
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 1, !dbg !59
  br label %15, !dbg !59

; <label>:15                                      ; preds = %._crit_edge29, %.lr.ph17
  %16 = phi float* [ %9, %.lr.ph17 ], [ %.pre, %._crit_edge29 ]
  %indvars.iv25 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next26.pre-phi, %._crit_edge29 ]
  %indvars.iv = phi i64 [ 1, %.lr.ph17 ], [ %indvars.iv.next, %._crit_edge29 ]
  %.0116 = phi i32* [ %ipvt, %.lr.ph17 ], [ %59, %._crit_edge29 ]
  %info.015 = phi i32 [ 0, %.lr.ph17 ], [ %info.1, %._crit_edge29 ]
  %17 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv25, !dbg !61
  %18 = getelementptr inbounds float* %16, i64 %indvars.iv25, !dbg !61
  tail call void @llvm.dbg.value(metadata !{float* %18}, i64 0, metadata !33), !dbg !61
  %19 = trunc i64 %indvars.iv25 to i32, !dbg !63
  %20 = sub nsw i32 %2, %19, !dbg !63
  %21 = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %20, float* %18, i32 1) #3, !dbg !63
  %22 = add nsw i32 %21, %19, !dbg !63
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !28), !dbg !63
  store i32 %22, i32* %.0116, align 4, !dbg !64, !tbaa !65
  %23 = load float** %17, align 8, !dbg !66, !tbaa !53
  %24 = sext i32 %22 to i64, !dbg !66
  %25 = getelementptr inbounds float* %23, i64 %24, !dbg !66
  tail call void @llvm.dbg.value(metadata !{float* %25}, i64 0, metadata !34), !dbg !66
  %26 = load float* %25, align 4, !dbg !67, !tbaa !69
  %27 = fcmp oeq float %26, 0.000000e+00, !dbg !67
  br i1 %27, label %._crit_edge33, label %28, !dbg !67

._crit_edge33:                                    ; preds = %15
  %indvars.iv.next26.pre = add nuw nsw i64 %indvars.iv25, 1, !dbg !59
  %lftr.wideiv27.pre = trunc i64 %indvars.iv.next26.pre to i32, !dbg !59
  br label %.loopexit, !dbg !67

; <label>:28                                      ; preds = %15
  %29 = icmp ne i32 %21, 0, !dbg !71
  %30 = load float* %18, align 4, !dbg !73, !tbaa !69
  br i1 %29, label %31, label %._crit_edge30, !dbg !71

; <label>:31                                      ; preds = %28
  tail call void @llvm.dbg.value(metadata !{float %26}, i64 0, metadata !32), !dbg !75
  store float %30, float* %25, align 4, !dbg !73, !tbaa !69
  store float %26, float* %18, align 4, !dbg !76, !tbaa !69
  br label %._crit_edge30, !dbg !77

._crit_edge30:                                    ; preds = %28, %31
  %32 = phi float [ %26, %31 ], [ %30, %28 ]
  %33 = fdiv float -1.000000e+00, %32, !dbg !78
  tail call void @llvm.dbg.value(metadata !{float %33}, i64 0, metadata !32), !dbg !78
  %34 = add i64 %indvars.iv25, 1, !dbg !79
  %35 = getelementptr inbounds float* %16, i64 %34, !dbg !79
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !36), !dbg !79
  %36 = trunc i64 %34 to i32, !dbg !79
  %37 = icmp slt i32 %36, %2, !dbg !79
  br i1 %37, label %.lr.ph, label %.loopexit, !dbg !79

.preheader:                                       ; preds = %.lr.ph
  br i1 %37, label %.lr.ph12, label %.loopexit, !dbg !81

.lr.ph:                                           ; preds = %._crit_edge30, %.lr.ph
  %mik.06 = phi float* [ %41, %.lr.ph ], [ %35, %._crit_edge30 ]
  %i.05 = phi i32 [ %40, %.lr.ph ], [ %36, %._crit_edge30 ]
  %38 = load float* %mik.06, align 4, !dbg !83, !tbaa !69
  %39 = fmul float %33, %38, !dbg !83
  store float %39, float* %mik.06, align 4, !dbg !83, !tbaa !69
  %40 = add nsw i32 %i.05, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !25), !dbg !79
  %41 = getelementptr inbounds float* %mik.06, i64 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{float* %41}, i64 0, metadata !36), !dbg !79
  %exitcond = icmp eq i32 %40, %2, !dbg !79
  br i1 %exitcond, label %.preheader, label %.lr.ph, !dbg !79

.lr.ph12:                                         ; preds = %.preheader, %._crit_edge
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ %indvars.iv, %.preheader ]
  %42 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv22, !dbg !84
  %43 = load float** %42, align 8, !dbg !84, !tbaa !53
  %44 = getelementptr inbounds float* %43, i64 %indvars.iv25, !dbg !84
  %45 = load float* %44, align 4, !dbg !84, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{float %45}, i64 0, metadata !32), !dbg !84
  br i1 %29, label %46, label %.lr.ph10, !dbg !86

; <label>:46                                      ; preds = %.lr.ph12
  %47 = getelementptr inbounds float* %43, i64 %24, !dbg !88
  %48 = load float* %47, align 4, !dbg !88, !tbaa !69
  store float %48, float* %44, align 4, !dbg !88, !tbaa !69
  store float %45, float* %47, align 4, !dbg !90, !tbaa !69
  %49 = load float* %44, align 4, !dbg !91, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{float %49}, i64 0, metadata !32), !dbg !91
  br label %.lr.ph10, !dbg !92

.lr.ph10:                                         ; preds = %.lr.ph12, %46
  %t.0 = phi float [ %49, %46 ], [ %45, %.lr.ph12 ]
  tail call void @llvm.dbg.value(metadata !{float* %50}, i64 0, metadata !35), !dbg !93
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !36), !dbg !93
  %50 = getelementptr inbounds float* %43, i64 %34, !dbg !93
  br label %51, !dbg !93

; <label>:51                                      ; preds = %51, %.lr.ph10
  %mik.19 = phi float* [ %35, %.lr.ph10 ], [ %58, %51 ]
  %aij.08 = phi float* [ %50, %.lr.ph10 ], [ %57, %51 ]
  %i.17 = phi i32 [ %36, %.lr.ph10 ], [ %56, %51 ]
  %52 = load float* %mik.19, align 4, !dbg !95, !tbaa !69
  %53 = fmul float %t.0, %52, !dbg !95
  %54 = load float* %aij.08, align 4, !dbg !95, !tbaa !69
  %55 = fadd float %54, %53, !dbg !95
  store float %55, float* %aij.08, align 4, !dbg !95, !tbaa !69
  %56 = add nsw i32 %i.17, 1, !dbg !93
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !25), !dbg !93
  %57 = getelementptr inbounds float* %aij.08, i64 1, !dbg !93
  tail call void @llvm.dbg.value(metadata !{float* %57}, i64 0, metadata !35), !dbg !93
  %58 = getelementptr inbounds float* %mik.19, i64 1, !dbg !93
  tail call void @llvm.dbg.value(metadata !{float* %58}, i64 0, metadata !36), !dbg !93
  %exitcond21 = icmp eq i32 %56, %2, !dbg !93
  br i1 %exitcond21, label %._crit_edge, label %51, !dbg !93

._crit_edge:                                      ; preds = %51
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next23 to i32, !dbg !81
  %exitcond24 = icmp eq i32 %lftr.wideiv, %2, !dbg !81
  br i1 %exitcond24, label %.loopexit, label %.lr.ph12, !dbg !81

.loopexit:                                        ; preds = %._crit_edge, %._crit_edge30, %.preheader, %._crit_edge33
  %lftr.wideiv27.pre-phi = phi i32 [ %lftr.wideiv27.pre, %._crit_edge33 ], [ %36, %.preheader ], [ %36, %._crit_edge30 ], [ %36, %._crit_edge ], !dbg !59
  %indvars.iv.next26.pre-phi = phi i64 [ %indvars.iv.next26.pre, %._crit_edge33 ], [ %34, %.preheader ], [ %34, %._crit_edge30 ], [ %34, %._crit_edge ], !dbg !59
  %info.1 = phi i32 [ %19, %._crit_edge33 ], [ %info.015, %.preheader ], [ %info.015, %._crit_edge30 ], [ %info.015, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep}, i64 0, metadata !24), !dbg !59
  %exitcond28 = icmp eq i32 %lftr.wideiv27.pre-phi, %7, !dbg !59
  br i1 %exitcond28, label %..loopexit4_crit_edge, label %._crit_edge29, !dbg !59

._crit_edge29:                                    ; preds = %.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !59
  %59 = getelementptr inbounds i32* %.0116, i64 1, !dbg !59
  %.phi.trans.insert = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv.next26.pre-phi
  %.pre = load float** %.phi.trans.insert, align 8, !dbg !61, !tbaa !53
  br label %15, !dbg !59

..loopexit4_crit_edge:                            ; preds = %.loopexit
  %scevgep = getelementptr i32* %ipvt, i64 %14
  br label %.loopexit4, !dbg !59

.loopexit4:                                       ; preds = %6, %..loopexit4_crit_edge
  %info.2 = phi i32 [ 0, %6 ], [ %info.1, %..loopexit4_crit_edge ]
  %.1 = phi i32* [ %ipvt, %6 ], [ %scevgep, %..loopexit4_crit_edge ]
  %akk.1 = phi float* [ %9, %6 ], [ %18, %..loopexit4_crit_edge ]
  store i32 %7, i32* %.1, align 4, !dbg !96, !tbaa !65
  %60 = load float* %akk.1, align 4, !dbg !97, !tbaa !69
  %61 = fcmp oeq float %60, 0.000000e+00, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !30), !dbg !97
  %info.3 = select i1 %61, i32 %2, i32 %info.2, !dbg !97
  br label %62, !dbg !97

; <label>:62                                      ; preds = %.loopexit4, %0
  %.0 = phi i32 [ -1, %0 ], [ %info.3, %.loopexit4 ]
  ret i32 %.0, !dbg !99
}

; Function Attrs: optsize
declare i32 @isamax(...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sgefa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sgefa", metadata !"sgefa", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, i32*)* @sgefa, null, null, metadata !22, i32 48} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !21}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = metadata !{i32 786451, metadata !11, null, metadata !"FULL", i32 31, i64 64064, i64 64, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !"./ge.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!12 = metadata !{metadata !13, metadata !14, metadata !15}
!13 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"cd", i32 32, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"rd", i32 33, i64 32, i64 32, i64 32, i32 0, metadata !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = metadata !{i32 786445, metadata !11, metadata !10, metadata !"pd", i32 34, i64 64000, i64 64, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64000, i64 64, i32 0, i32 0, metadata !17, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 1000}     ; [ DW_TAG_subrange_type ] [0, 999]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = metadata !{metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36}
!23 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = metadata !{i32 786689, metadata !4, metadata !"ipvt", metadata !5, i32 33554445, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 49]
!26 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 49, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 49]
!27 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 50]
!28 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 50]
!29 = metadata !{i32 786688, metadata !4, metadata !"nm1", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!30 = metadata !{i32 786688, metadata !4, metadata !"info", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [info] [line 50]
!31 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 50, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 50]
!32 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 51, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 51]
!33 = metadata !{i32 786688, metadata !4, metadata !"akk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [akk] [line 51]
!34 = metadata !{i32 786688, metadata !4, metadata !"alk", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alk] [line 51]
!35 = metadata !{i32 786688, metadata !4, metadata !"aij", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [aij] [line 51]
!36 = metadata !{i32 786688, metadata !4, metadata !"mik", metadata !5, i32 51, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mik] [line 51]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 12, i32 0, metadata !4, null}
!41 = metadata !{i32 13, i32 0, metadata !4, null}
!42 = metadata !{i32 54, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !4, i32 54, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!44 = metadata !{metadata !45, metadata !46, i64 0}
!45 = metadata !{metadata !"FULL", metadata !46, i64 0, metadata !46, i64 4, metadata !47, i64 8}
!46 = metadata !{metadata !"int", metadata !47, i64 0}
!47 = metadata !{metadata !"omnipotent char", metadata !48, i64 0}
!48 = metadata !{metadata !"Simple C/C++ TBAA"}
!49 = metadata !{metadata !45, metadata !46, i64 4}
!50 = metadata !{i32 55, i32 0, metadata !4, null}
!51 = metadata !{i32 56, i32 0, metadata !4, null}
!52 = metadata !{i32 57, i32 0, metadata !4, null}
!53 = metadata !{metadata !54, metadata !54, i64 0}
!54 = metadata !{metadata !"any pointer", metadata !47, i64 0}
!55 = metadata !{i32 0}
!56 = metadata !{i32 58, i32 0, metadata !4, null} ; [ DW_TAG_imported_module ]
!57 = metadata !{i32 59, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !4, i32 59, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!59 = metadata !{i32 62, i32 0, metadata !60, null}
!60 = metadata !{i32 786443, metadata !1, metadata !4, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!61 = metadata !{i32 65, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !1, metadata !60, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!63 = metadata !{i32 66, i32 0, metadata !62, null}
!64 = metadata !{i32 67, i32 0, metadata !62, null}
!65 = metadata !{metadata !46, metadata !46, i64 0}
!66 = metadata !{i32 70, i32 0, metadata !62, null}
!67 = metadata !{i32 71, i32 0, metadata !68, null}
!68 = metadata !{i32 786443, metadata !1, metadata !62, i32 71, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!69 = metadata !{metadata !70, metadata !70, i64 0}
!70 = metadata !{metadata !"float", metadata !47, i64 0}
!71 = metadata !{i32 77, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !62, i32 77, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!73 = metadata !{i32 79, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 77, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!75 = metadata !{i32 78, i32 0, metadata !74, null}
!76 = metadata !{i32 80, i32 0, metadata !74, null}
!77 = metadata !{i32 81, i32 0, metadata !74, null}
!78 = metadata !{i32 84, i32 0, metadata !62, null}
!79 = metadata !{i32 85, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !62, i32 85, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!81 = metadata !{i32 89, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !62, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!83 = metadata !{i32 86, i32 0, metadata !80, null}
!84 = metadata !{i32 92, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 89, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!86 = metadata !{i32 93, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 93, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!88 = metadata !{i32 94, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !87, i32 93, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!90 = metadata !{i32 95, i32 0, metadata !89, null}
!91 = metadata !{i32 96, i32 0, metadata !89, null}
!92 = metadata !{i32 97, i32 0, metadata !89, null}
!93 = metadata !{i32 98, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !85, i32 98, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!95 = metadata !{i32 99, i32 0, metadata !94, null}
!96 = metadata !{i32 104, i32 0, metadata !4, null}
!97 = metadata !{i32 105, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!99 = metadata !{i32 107, i32 0, metadata !4, null}
