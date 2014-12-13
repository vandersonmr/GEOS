; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !42
  %2 = load i32* %1, align 4, !dbg !42, !tbaa !44
  %3 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !42
  %4 = load i32* %3, align 4, !dbg !42, !tbaa !49
  %5 = icmp eq i32 %2, %4, !dbg !42
  br i1 %5, label %6, label %80, !dbg !42

; <label>:6                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !31), !dbg !50
  %7 = add nsw i32 %2, -1, !dbg !51
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
  %15 = add i32 %2, -1, !dbg !59
  br label %16, !dbg !59

; <label>:16                                      ; preds = %.loopexit, %.lr.ph17
  %indvars.iv25 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next26, %.loopexit ]
  %indvars.iv = phi i64 [ 1, %.lr.ph17 ], [ %indvars.iv.next, %.loopexit ]
  %.0116 = phi i32* [ %ipvt, %.lr.ph17 ], [ %77, %.loopexit ]
  %info.015 = phi i32 [ 0, %.lr.ph17 ], [ %info.1, %.loopexit ]
  %17 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv25, !dbg !61
  %18 = load float** %17, align 8, !dbg !61, !tbaa !53
  %19 = getelementptr inbounds float* %18, i64 %indvars.iv25, !dbg !61
  tail call void @llvm.dbg.value(metadata !{float* %19}, i64 0, metadata !33), !dbg !61
  %20 = trunc i64 %indvars.iv25 to i32, !dbg !63
  %21 = sub nsw i32 %2, %20, !dbg !63
  %22 = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %21, float* %19, i32 1) #3, !dbg !63
  %23 = trunc i64 %indvars.iv25 to i32, !dbg !63
  %24 = add nsw i32 %22, %23, !dbg !63
  tail call void @llvm.dbg.value(metadata !{i32 %24}, i64 0, metadata !28), !dbg !63
  store i32 %24, i32* %.0116, align 4, !dbg !64, !tbaa !65
  %25 = load float** %17, align 8, !dbg !66, !tbaa !53
  %26 = sext i32 %24 to i64, !dbg !66
  %27 = getelementptr inbounds float* %25, i64 %26, !dbg !66
  tail call void @llvm.dbg.value(metadata !{float* %27}, i64 0, metadata !34), !dbg !66
  %28 = load float* %27, align 4, !dbg !67, !tbaa !69
  %29 = fcmp oeq float %28, 0.000000e+00, !dbg !67
  %30 = trunc i64 %indvars.iv25 to i32, !dbg !67
  br i1 %29, label %.loopexit, label %31, !dbg !67

; <label>:31                                      ; preds = %16
  %32 = icmp ne i32 %22, 0, !dbg !71
  br i1 %32, label %33, label %35, !dbg !71

; <label>:33                                      ; preds = %31
  tail call void @llvm.dbg.value(metadata !{float %28}, i64 0, metadata !32), !dbg !73
  %34 = load float* %19, align 4, !dbg !75, !tbaa !69
  store float %34, float* %27, align 4, !dbg !75, !tbaa !69
  store float %28, float* %19, align 4, !dbg !76, !tbaa !69
  br label %35, !dbg !77

; <label>:35                                      ; preds = %33, %31
  %36 = load float* %19, align 4, !dbg !78, !tbaa !69
  %37 = fdiv float -1.000000e+00, %36, !dbg !78
  tail call void @llvm.dbg.value(metadata !{float %37}, i64 0, metadata !32), !dbg !78
  %38 = add nsw i64 %indvars.iv25, 1, !dbg !79
  %.sum = add i64 %indvars.iv25, 1, !dbg !79
  %39 = getelementptr inbounds float* %18, i64 %.sum, !dbg !79
  tail call void @llvm.dbg.value(metadata !{float* %39}, i64 0, metadata !36), !dbg !79
  %40 = trunc i64 %38 to i32, !dbg !79
  %41 = icmp slt i32 %40, %2, !dbg !79
  br i1 %41, label %.lr.ph, label %.preheader, !dbg !79

.lr.ph:                                           ; preds = %35
  %42 = trunc i64 %38 to i32, !dbg !79
  br label %47, !dbg !79

.preheader:                                       ; preds = %47, %35
  %43 = trunc i64 %38 to i32, !dbg !81
  %44 = icmp slt i32 %43, %2, !dbg !81
  br i1 %44, label %.lr.ph12, label %.loopexit, !dbg !81

.lr.ph12:                                         ; preds = %.preheader
  %45 = trunc i64 %38 to i32, !dbg !83
  %46 = icmp slt i32 %45, %2, !dbg !83
  br label %52, !dbg !81

; <label>:47                                      ; preds = %47, %.lr.ph
  %mik.06 = phi float* [ %39, %.lr.ph ], [ %51, %47 ]
  %i.05 = phi i32 [ %42, %.lr.ph ], [ %50, %47 ]
  %48 = load float* %mik.06, align 4, !dbg !86, !tbaa !69
  %49 = fmul float %37, %48, !dbg !86
  store float %49, float* %mik.06, align 4, !dbg !86, !tbaa !69
  %50 = add nsw i32 %i.05, 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !25), !dbg !79
  %51 = getelementptr inbounds float* %mik.06, i64 1, !dbg !79
  tail call void @llvm.dbg.value(metadata !{float* %51}, i64 0, metadata !36), !dbg !79
  %exitcond = icmp eq i32 %50, %2, !dbg !79
  br i1 %exitcond, label %.preheader, label %47, !dbg !79

; <label>:52                                      ; preds = %._crit_edge, %.lr.ph12
  %indvars.iv22 = phi i64 [ %indvars.iv, %.lr.ph12 ], [ %indvars.iv.next23, %._crit_edge ]
  %53 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv22, !dbg !87
  %54 = load float** %53, align 8, !dbg !87, !tbaa !53
  %55 = getelementptr inbounds float* %54, i64 %indvars.iv25, !dbg !87
  %56 = load float* %55, align 4, !dbg !87, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{float %56}, i64 0, metadata !32), !dbg !87
  br i1 %32, label %57, label %65, !dbg !88

; <label>:57                                      ; preds = %52
  %58 = getelementptr inbounds float* %54, i64 %26, !dbg !90
  %59 = load float* %58, align 4, !dbg !90, !tbaa !69
  store float %59, float* %55, align 4, !dbg !90, !tbaa !69
  %60 = load float** %53, align 8, !dbg !92, !tbaa !53
  %61 = getelementptr inbounds float* %60, i64 %26, !dbg !92
  store float %56, float* %61, align 4, !dbg !92, !tbaa !69
  %62 = load float** %53, align 8, !dbg !93, !tbaa !53
  %63 = getelementptr inbounds float* %62, i64 %indvars.iv25, !dbg !93
  %64 = load float* %63, align 4, !dbg !93, !tbaa !69
  tail call void @llvm.dbg.value(metadata !{float %64}, i64 0, metadata !32), !dbg !93
  br label %65, !dbg !94

; <label>:65                                      ; preds = %57, %52
  %t.0 = phi float [ %64, %57 ], [ %56, %52 ]
  tail call void @llvm.dbg.value(metadata !{float* %67}, i64 0, metadata !35), !dbg !83
  tail call void @llvm.dbg.value(metadata !{float* %39}, i64 0, metadata !36), !dbg !83
  br i1 %46, label %.lr.ph10, label %._crit_edge, !dbg !83

.lr.ph10:                                         ; preds = %65
  %66 = load float** %53, align 8, !dbg !83, !tbaa !53
  %67 = getelementptr inbounds float* %66, i64 %.sum, !dbg !83
  %68 = trunc i64 %38 to i32, !dbg !83
  br label %69, !dbg !83

; <label>:69                                      ; preds = %69, %.lr.ph10
  %mik.19 = phi float* [ %39, %.lr.ph10 ], [ %76, %69 ]
  %aij.08 = phi float* [ %67, %.lr.ph10 ], [ %75, %69 ]
  %i.17 = phi i32 [ %68, %.lr.ph10 ], [ %74, %69 ]
  %70 = load float* %mik.19, align 4, !dbg !95, !tbaa !69
  %71 = fmul float %t.0, %70, !dbg !95
  %72 = load float* %aij.08, align 4, !dbg !95, !tbaa !69
  %73 = fadd float %72, %71, !dbg !95
  store float %73, float* %aij.08, align 4, !dbg !95, !tbaa !69
  %74 = add nsw i32 %i.17, 1, !dbg !83
  tail call void @llvm.dbg.value(metadata !{i32 %74}, i64 0, metadata !25), !dbg !83
  %75 = getelementptr inbounds float* %aij.08, i64 1, !dbg !83
  tail call void @llvm.dbg.value(metadata !{float* %75}, i64 0, metadata !35), !dbg !83
  %76 = getelementptr inbounds float* %mik.19, i64 1, !dbg !83
  tail call void @llvm.dbg.value(metadata !{float* %76}, i64 0, metadata !36), !dbg !83
  %exitcond21 = icmp eq i32 %74, %2, !dbg !83
  br i1 %exitcond21, label %._crit_edge, label %69, !dbg !83

._crit_edge:                                      ; preds = %69, %65
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next23 to i32, !dbg !81
  %exitcond24 = icmp eq i32 %lftr.wideiv, %2, !dbg !81
  br i1 %exitcond24, label %.loopexit, label %52, !dbg !81

.loopexit:                                        ; preds = %._crit_edge, %.preheader, %16
  %info.1 = phi i32 [ %30, %16 ], [ %info.015, %.preheader ], [ %info.015, %._crit_edge ]
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1, !dbg !59
  %77 = getelementptr inbounds i32* %.0116, i64 1, !dbg !59
  tail call void @llvm.dbg.value(metadata !{i32* %scevgep}, i64 0, metadata !24), !dbg !59
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !59
  %lftr.wideiv27 = trunc i64 %indvars.iv.next26 to i32, !dbg !59
  %exitcond28 = icmp eq i32 %lftr.wideiv27, %15, !dbg !59
  br i1 %exitcond28, label %..loopexit4_crit_edge, label %16, !dbg !59

..loopexit4_crit_edge:                            ; preds = %.loopexit
  %scevgep = getelementptr i32* %ipvt, i64 %14
  br label %.loopexit4, !dbg !59

.loopexit4:                                       ; preds = %6, %..loopexit4_crit_edge
  %info.2 = phi i32 [ 0, %6 ], [ %info.1, %..loopexit4_crit_edge ]
  %.1 = phi i32* [ %ipvt, %6 ], [ %scevgep, %..loopexit4_crit_edge ]
  %akk.1 = phi float* [ %9, %6 ], [ %19, %..loopexit4_crit_edge ]
  store i32 %7, i32* %.1, align 4, !dbg !96, !tbaa !65
  %78 = load float* %akk.1, align 4, !dbg !97, !tbaa !69
  %79 = fcmp oeq float %78, 0.000000e+00, !dbg !97
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !30), !dbg !97
  %info.3 = select i1 %79, i32 %2, i32 %info.2, !dbg !97
  br label %80, !dbg !97

; <label>:80                                      ; preds = %.loopexit4, %0
  %.0 = phi i32 [ -1, %0 ], [ %info.3, %.loopexit4 ]
  ret i32 %.0, !dbg !99
}

declare i32 @isamax(...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

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
!73 = metadata !{i32 78, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 77, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!75 = metadata !{i32 79, i32 0, metadata !74, null}
!76 = metadata !{i32 80, i32 0, metadata !74, null}
!77 = metadata !{i32 81, i32 0, metadata !74, null}
!78 = metadata !{i32 84, i32 0, metadata !62, null}
!79 = metadata !{i32 85, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !62, i32 85, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!81 = metadata !{i32 89, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !62, i32 89, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!83 = metadata !{i32 98, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !85, i32 98, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!85 = metadata !{i32 786443, metadata !1, metadata !82, i32 89, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!86 = metadata !{i32 86, i32 0, metadata !80, null}
!87 = metadata !{i32 92, i32 0, metadata !85, null}
!88 = metadata !{i32 93, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !1, metadata !85, i32 93, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!90 = metadata !{i32 94, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !1, metadata !89, i32 93, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!92 = metadata !{i32 95, i32 0, metadata !91, null}
!93 = metadata !{i32 96, i32 0, metadata !91, null}
!94 = metadata !{i32 97, i32 0, metadata !91, null}
!95 = metadata !{i32 99, i32 0, metadata !84, null}
!96 = metadata !{i32 104, i32 0, metadata !4, null}
!97 = metadata !{i32 105, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgefa.c]
!99 = metadata !{i32 107, i32 0, metadata !4, null}
