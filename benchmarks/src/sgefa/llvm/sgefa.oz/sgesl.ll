; ModuleID = 'sgesl.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: minsize nounwind optsize uwtable
define i32 @sgesl(%struct.FULL* nocapture readonly %a, i32* nocapture readonly %ipvt, float* nocapture %b, i32 %job) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !25), !dbg !42
  tail call void @llvm.dbg.value(metadata !{i32 %job}, i64 0, metadata !26), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !43
  %2 = load i32* %1, align 4, !dbg !43, !tbaa !44
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !35), !dbg !43
  %3 = add i32 %2, -1, !dbg !49
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !36), !dbg !49
  %4 = icmp eq i32 %job, 0, !dbg !50
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !33), !dbg !53
  br i1 %4, label %.preheader4, label %.preheader6, !dbg !50

.preheader6:                                      ; preds = %0
  %5 = icmp sgt i32 %2, 0, !dbg !56
  br i1 %5, label %.lr.ph40, label %._crit_edge41, !dbg !56

.preheader4:                                      ; preds = %0
  %6 = icmp sgt i32 %3, 0, !dbg !53
  br i1 %6, label %.lr.ph18, label %.preheader, !dbg !53

.preheader:                                       ; preds = %._crit_edge15, %.preheader4
  %7 = icmp sgt i32 %2, 0, !dbg !58
  br i1 %7, label %.lr.ph10, label %.loopexit, !dbg !58

.lr.ph10:                                         ; preds = %.preheader
  %8 = sext i32 %2 to i64
  br label %32, !dbg !58

.lr.ph18:                                         ; preds = %.preheader4, %._crit_edge15
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge15 ], [ 0, %.preheader4 ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge15 ], [ 1, %.preheader4 ]
  %.0117 = phi i32* [ %31, %._crit_edge15 ], [ %ipvt, %.preheader4 ]
  %9 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv53, !dbg !60
  %10 = load float** %9, align 8, !dbg !60, !tbaa !62
  %11 = load i32* %.0117, align 4, !dbg !64, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !34), !dbg !64
  %12 = sext i32 %11 to i64, !dbg !66
  %13 = getelementptr inbounds float* %b, i64 %12, !dbg !66
  %14 = load float* %13, align 4, !dbg !66, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %14}, i64 0, metadata !27), !dbg !66
  %15 = trunc i64 %indvars.iv53 to i32, !dbg !69
  %16 = icmp eq i32 %11, %15, !dbg !69
  br i1 %16, label %20, label %17, !dbg !69

; <label>:17                                      ; preds = %.lr.ph18
  %18 = getelementptr inbounds float* %b, i64 %indvars.iv53, !dbg !71
  %19 = load float* %18, align 4, !dbg !71, !tbaa !67
  store float %19, float* %13, align 4, !dbg !71, !tbaa !67
  store float %14, float* %18, align 4, !dbg !73, !tbaa !67
  br label %20, !dbg !74

; <label>:20                                      ; preds = %.lr.ph18, %17
  %indvars.iv.next54 = add i64 %indvars.iv53, 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{float* %23}, i64 0, metadata !29), !dbg !75
  %21 = trunc i64 %indvars.iv.next54 to i32, !dbg !75
  %22 = icmp slt i32 %21, %2, !dbg !75
  br i1 %22, label %.lr.ph14, label %._crit_edge15, !dbg !75

.lr.ph14:                                         ; preds = %20
  %23 = getelementptr inbounds float* %10, i64 %indvars.iv.next54, !dbg !75
  br label %24, !dbg !75

; <label>:24                                      ; preds = %24, %.lr.ph14
  %indvars.iv49 = phi i64 [ %indvars.iv47, %.lr.ph14 ], [ %indvars.iv.next50, %24 ]
  %mik.011 = phi float* [ %23, %.lr.ph14 ], [ %30, %24 ]
  %25 = load float* %mik.011, align 4, !dbg !77, !tbaa !67
  %26 = fmul float %14, %25, !dbg !77
  %27 = getelementptr inbounds float* %b, i64 %indvars.iv49, !dbg !77
  %28 = load float* %27, align 4, !dbg !77, !tbaa !67
  %29 = fadd float %28, %26, !dbg !77
  store float %29, float* %27, align 4, !dbg !77, !tbaa !67
  %30 = getelementptr inbounds float* %mik.011, i64 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !{float* %30}, i64 0, metadata !29), !dbg !75
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !75
  %lftr.wideiv51 = trunc i64 %indvars.iv.next50 to i32, !dbg !75
  %exitcond52 = icmp eq i32 %lftr.wideiv51, %2, !dbg !75
  br i1 %exitcond52, label %._crit_edge15, label %24, !dbg !75

._crit_edge15:                                    ; preds = %24, %20
  %31 = getelementptr inbounds i32* %.0117, i64 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{i32* %31}, i64 0, metadata !24), !dbg !53
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1, !dbg !53
  %exitcond56 = icmp eq i32 %21, %3, !dbg !53
  br i1 %exitcond56, label %.preheader, label %.lr.ph18, !dbg !53

; <label>:32                                      ; preds = %.lr.ph10, %._crit_edge
  %indvars.iv45.in = phi i64 [ %8, %.lr.ph10 ], [ %indvars.iv45, %._crit_edge ]
  %indvars.iv43 = phi i32 [ %3, %.lr.ph10 ], [ %indvars.iv.next44, %._crit_edge ]
  %indvars.iv45 = add i64 %indvars.iv45.in, -1, !dbg !58
  %33 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv45, !dbg !78
  %34 = load float** %33, align 8, !dbg !78, !tbaa !62
  %35 = getelementptr inbounds float* %34, i64 %indvars.iv45, !dbg !78
  tail call void @llvm.dbg.value(metadata !{float* %35}, i64 0, metadata !28), !dbg !78
  %36 = load float* %35, align 4, !dbg !80, !tbaa !67
  %37 = getelementptr inbounds float* %b, i64 %indvars.iv45, !dbg !80
  %38 = load float* %37, align 4, !dbg !80, !tbaa !67
  %39 = fdiv float %38, %36, !dbg !80
  store float %39, float* %37, align 4, !dbg !80, !tbaa !67
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !81
  tail call void @llvm.dbg.value(metadata !{float* %34}, i64 0, metadata !30), !dbg !81
  %40 = trunc i64 %indvars.iv45 to i32, !dbg !81
  %41 = icmp sgt i32 %40, 0, !dbg !81
  br i1 %41, label %.lr.ph, label %.loopexit, !dbg !81

.lr.ph:                                           ; preds = %32, %._crit_edge68
  %42 = phi float [ %.pre, %._crit_edge68 ], [ %39, %32 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge68 ], [ 0, %32 ]
  %uik.07 = phi float* [ %48, %._crit_edge68 ], [ %34, %32 ]
  %43 = load float* %uik.07, align 4, !dbg !83, !tbaa !67
  %44 = fmul float %43, %42, !dbg !83
  %45 = getelementptr inbounds float* %b, i64 %indvars.iv, !dbg !83
  %46 = load float* %45, align 4, !dbg !83, !tbaa !67
  %47 = fsub float %46, %44, !dbg !83
  store float %47, float* %45, align 4, !dbg !83, !tbaa !67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{float* %48}, i64 0, metadata !30), !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !81
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv43, !dbg !81
  br i1 %exitcond, label %._crit_edge, label %._crit_edge68, !dbg !81

._crit_edge68:                                    ; preds = %.lr.ph
  %48 = getelementptr inbounds float* %uik.07, i64 1, !dbg !81
  %.pre = load float* %37, align 4, !dbg !83, !tbaa !67
  br label %.lr.ph, !dbg !81

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next44 = add nsw i32 %indvars.iv43, -1, !dbg !58
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next44}, i64 0, metadata !33), !dbg !58
  br i1 %41, label %32, label %.loopexit, !dbg !58

.lr.ph40:                                         ; preds = %.preheader6, %._crit_edge37
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge37 ], [ 0, %.preheader6 ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge37 ], [ 0, %.preheader6 ]
  %49 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv64, !dbg !84
  %50 = load float** %49, align 8, !dbg !84, !tbaa !62
  %51 = getelementptr inbounds float* %50, i64 %indvars.iv64, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %51}, i64 0, metadata !28), !dbg !84
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !86
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %50}, i64 0, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !31), !dbg !86
  %52 = trunc i64 %indvars.iv64 to i32, !dbg !86
  %53 = icmp sgt i32 %52, 0, !dbg !86
  br i1 %53, label %.lr.ph36, label %._crit_edge37, !dbg !86

.lr.ph36:                                         ; preds = %.lr.ph40, %.lr.ph36
  %i.234 = phi i32 [ %58, %.lr.ph36 ], [ 0, %.lr.ph40 ]
  %bi.033 = phi float* [ %60, %.lr.ph36 ], [ %b, %.lr.ph40 ]
  %uik.132 = phi float* [ %59, %.lr.ph36 ], [ %50, %.lr.ph40 ]
  %t.031 = phi float [ %57, %.lr.ph36 ], [ 0.000000e+00, %.lr.ph40 ]
  %54 = load float* %uik.132, align 4, !dbg !89, !tbaa !67
  %55 = load float* %bi.033, align 4, !dbg !89, !tbaa !67
  %56 = fmul float %54, %55, !dbg !89
  %57 = fadd float %t.031, %56, !dbg !89
  tail call void @llvm.dbg.value(metadata !{float %57}, i64 0, metadata !27), !dbg !89
  %58 = add nsw i32 %i.234, 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !32), !dbg !86
  %59 = getelementptr inbounds float* %uik.132, i64 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %59}, i64 0, metadata !30), !dbg !86
  %60 = getelementptr inbounds float* %bi.033, i64 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %60}, i64 0, metadata !31), !dbg !86
  %exitcond63 = icmp eq i32 %58, %indvars.iv61, !dbg !86
  br i1 %exitcond63, label %._crit_edge37, label %.lr.ph36, !dbg !86

._crit_edge37:                                    ; preds = %.lr.ph36, %.lr.ph40
  %t.0.lcssa = phi float [ 0.000000e+00, %.lr.ph40 ], [ %57, %.lr.ph36 ]
  %61 = getelementptr inbounds float* %b, i64 %indvars.iv64, !dbg !90
  %62 = load float* %61, align 4, !dbg !90, !tbaa !67
  %63 = fsub float %62, %t.0.lcssa, !dbg !90
  %64 = load float* %51, align 4, !dbg !90, !tbaa !67
  %65 = fdiv float %63, %64, !dbg !90
  store float %65, float* %61, align 4, !dbg !90, !tbaa !67
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1, !dbg !56
  %indvars.iv.next62 = add nuw nsw i32 %indvars.iv61, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next62}, i64 0, metadata !33), !dbg !56
  %lftr.wideiv66 = trunc i64 %indvars.iv.next65 to i32, !dbg !56
  %exitcond67 = icmp eq i32 %lftr.wideiv66, %2, !dbg !56
  br i1 %exitcond67, label %._crit_edge41, label %.lr.ph40, !dbg !56

._crit_edge41:                                    ; preds = %._crit_edge37, %.preheader6
  %66 = add i32 %2, -2, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32* %69}, i64 0, metadata !24), !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !33), !dbg !92
  %67 = icmp sgt i32 %66, -1, !dbg !92
  br i1 %67, label %.lr.ph30, label %.loopexit, !dbg !92

.lr.ph30:                                         ; preds = %._crit_edge41
  %68 = sext i32 %66 to i64, !dbg !91
  %69 = getelementptr inbounds i32* %ipvt, i64 %68, !dbg !91
  br label %70, !dbg !92

; <label>:70                                      ; preds = %.lr.ph30, %94
  %indvars.iv58 = phi i64 [ %68, %.lr.ph30 ], [ %indvars.iv.next59, %94 ]
  %.128 = phi i32* [ %69, %.lr.ph30 ], [ %95, %94 ]
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !27), !dbg !94
  %.sum = add i64 %indvars.iv58, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %77}, i64 0, metadata !29), !dbg !94
  %71 = getelementptr inbounds float* %b, i64 %indvars.iv58, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %76}, i64 0, metadata !31), !dbg !94
  %72 = trunc i64 %.sum to i32, !dbg !94
  %73 = icmp slt i32 %72, %2, !dbg !94
  br i1 %73, label %.lr.ph25, label %._crit_edge26, !dbg !94

.lr.ph25:                                         ; preds = %70
  %74 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv58, !dbg !94
  %75 = load float** %74, align 8, !dbg !94, !tbaa !62
  %76 = getelementptr inbounds float* %b, i64 %.sum, !dbg !94
  %77 = getelementptr inbounds float* %75, i64 %.sum, !dbg !94
  br label %78, !dbg !94

; <label>:78                                      ; preds = %78, %.lr.ph25
  %i.323 = phi i32 [ %72, %.lr.ph25 ], [ %i.3, %78 ]
  %bi.122 = phi float* [ %76, %.lr.ph25 ], [ %84, %78 ]
  %mik.121 = phi float* [ %77, %.lr.ph25 ], [ %83, %78 ]
  %t.120 = phi float [ 0.000000e+00, %.lr.ph25 ], [ %82, %78 ]
  %79 = load float* %mik.121, align 4, !dbg !97, !tbaa !67
  %80 = load float* %bi.122, align 4, !dbg !97, !tbaa !67
  %81 = fmul float %79, %80, !dbg !97
  %82 = fadd float %t.120, %81, !dbg !97
  tail call void @llvm.dbg.value(metadata !{float %82}, i64 0, metadata !27), !dbg !97
  %83 = getelementptr inbounds float* %mik.121, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %83}, i64 0, metadata !29), !dbg !94
  %84 = getelementptr inbounds float* %bi.122, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %84}, i64 0, metadata !31), !dbg !94
  %i.3 = add nsw i32 %i.323, 1, !dbg !94
  %exitcond57 = icmp eq i32 %i.3, %2, !dbg !94
  br i1 %exitcond57, label %._crit_edge26, label %78, !dbg !94

._crit_edge26:                                    ; preds = %78, %70
  %t.1.lcssa = phi float [ 0.000000e+00, %70 ], [ %82, %78 ]
  %85 = load float* %71, align 4, !dbg !98, !tbaa !67
  %86 = fadd float %t.1.lcssa, %85, !dbg !98
  store float %86, float* %71, align 4, !dbg !98, !tbaa !67
  %87 = load i32* %.128, align 4, !dbg !99, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !34), !dbg !99
  %88 = trunc i64 %indvars.iv58 to i32, !dbg !100
  %89 = icmp eq i32 %87, %88, !dbg !100
  br i1 %89, label %94, label %90, !dbg !100

; <label>:90                                      ; preds = %._crit_edge26
  %91 = sext i32 %87 to i64, !dbg !102
  %92 = getelementptr inbounds float* %b, i64 %91, !dbg !102
  %93 = load float* %92, align 4, !dbg !102, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %93}, i64 0, metadata !27), !dbg !102
  store float %86, float* %92, align 4, !dbg !103, !tbaa !67
  store float %93, float* %71, align 4, !dbg !104, !tbaa !67
  br label %94, !dbg !105

; <label>:94                                      ; preds = %._crit_edge26, %90
  %95 = getelementptr inbounds i32* %.128, i64 -1, !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32* %95}, i64 0, metadata !24), !dbg !92
  %96 = icmp sgt i32 %88, 0, !dbg !92
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, -1, !dbg !92
  br i1 %96, label %70, label %.loopexit, !dbg !92

.loopexit:                                        ; preds = %94, %32, %._crit_edge, %._crit_edge41, %.preheader
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c] [DW_LANG_C99]
!1 = metadata !{metadata !"sgesl.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa"}
!2 = metadata !{}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sgesl", metadata !"sgesl", metadata !"", i32 11, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.FULL*, i32*, float*, i32)* @sgesl, null, null, metadata !22, i32 42} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 42] [sgesl]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !21, metadata !17, metadata !8}
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
!25 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 50331662, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 14]
!26 = metadata !{i32 786689, metadata !4, metadata !"job", metadata !5, i32 67108877, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [job] [line 13]
!27 = metadata !{i32 786688, metadata !4, metadata !"t", metadata !5, i32 43, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 43]
!28 = metadata !{i32 786688, metadata !4, metadata !"akk", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [akk] [line 44]
!29 = metadata !{i32 786688, metadata !4, metadata !"mik", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mik] [line 44]
!30 = metadata !{i32 786688, metadata !4, metadata !"uik", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uik] [line 44]
!31 = metadata !{i32 786688, metadata !4, metadata !"bi", metadata !5, i32 44, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bi] [line 44]
!32 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 45]
!33 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 45, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 45]
!34 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 46]
!35 = metadata !{i32 786688, metadata !4, metadata !"n", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 46]
!36 = metadata !{i32 786688, metadata !4, metadata !"nm1", metadata !5, i32 46, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 46]
!37 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!38 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!39 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!40 = metadata !{i32 12, i32 0, metadata !4, null}
!41 = metadata !{i32 13, i32 0, metadata !4, null}
!42 = metadata !{i32 14, i32 0, metadata !4, null}
!43 = metadata !{i32 48, i32 0, metadata !4, null}
!44 = metadata !{metadata !45, metadata !46, i64 0}
!45 = metadata !{metadata !"FULL", metadata !46, i64 0, metadata !46, i64 4, metadata !47, i64 8}
!46 = metadata !{metadata !"int", metadata !47, i64 0}
!47 = metadata !{metadata !"omnipotent char", metadata !48, i64 0}
!48 = metadata !{metadata !"Simple C/C++ TBAA"}
!49 = metadata !{i32 49, i32 0, metadata !4, null}
!50 = metadata !{i32 52, i32 0, metadata !51, null}
!51 = metadata !{i32 786443, metadata !1, metadata !4, i32 52, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!52 = metadata !{i32 0}
!53 = metadata !{i32 54, i32 0, metadata !54, null}
!54 = metadata !{i32 786443, metadata !1, metadata !55, i32 54, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!55 = metadata !{i32 786443, metadata !1, metadata !51, i32 52, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!56 = metadata !{i32 80, i32 0, metadata !57, null}
!57 = metadata !{i32 786443, metadata !1, metadata !4, i32 80, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!58 = metadata !{i32 69, i32 0, metadata !59, null}
!59 = metadata !{i32 786443, metadata !1, metadata !55, i32 69, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!60 = metadata !{i32 55, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !54, i32 54, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!62 = metadata !{metadata !63, metadata !63, i64 0}
!63 = metadata !{metadata !"any pointer", metadata !47, i64 0}
!64 = metadata !{i32 58, i32 0, metadata !61, null} ; [ DW_TAG_imported_module ]
!65 = metadata !{metadata !46, metadata !46, i64 0}
!66 = metadata !{i32 59, i32 0, metadata !61, null}
!67 = metadata !{metadata !68, metadata !68, i64 0}
!68 = metadata !{metadata !"float", metadata !47, i64 0}
!69 = metadata !{i32 60, i32 0, metadata !70, null}
!70 = metadata !{i32 786443, metadata !1, metadata !61, i32 60, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!71 = metadata !{i32 61, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !70, i32 60, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!73 = metadata !{i32 62, i32 0, metadata !72, null}
!74 = metadata !{i32 63, i32 0, metadata !72, null}
!75 = metadata !{i32 64, i32 0, metadata !76, null}
!76 = metadata !{i32 786443, metadata !1, metadata !61, i32 64, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!77 = metadata !{i32 65, i32 0, metadata !76, null}
!78 = metadata !{i32 70, i32 0, metadata !79, null}
!79 = metadata !{i32 786443, metadata !1, metadata !59, i32 69, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!80 = metadata !{i32 71, i32 0, metadata !79, null}
!81 = metadata !{i32 72, i32 0, metadata !82, null}
!82 = metadata !{i32 786443, metadata !1, metadata !79, i32 72, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!83 = metadata !{i32 73, i32 0, metadata !82, null}
!84 = metadata !{i32 81, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !57, i32 80, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!86 = metadata !{i32 82, i32 0, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !85, i32 82, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!88 = metadata !{float 0.000000e+00}
!89 = metadata !{i32 83, i32 0, metadata !87, null}
!90 = metadata !{i32 84, i32 0, metadata !85, null}
!91 = metadata !{i32 89, i32 0, metadata !4, null}
!92 = metadata !{i32 90, i32 0, metadata !93, null}
!93 = metadata !{i32 786443, metadata !1, metadata !4, i32 90, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!94 = metadata !{i32 91, i32 0, metadata !95, null}
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 91, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!96 = metadata !{i32 786443, metadata !1, metadata !93, i32 90, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!97 = metadata !{i32 92, i32 0, metadata !95, null}
!98 = metadata !{i32 93, i32 0, metadata !96, null}
!99 = metadata !{i32 96, i32 0, metadata !96, null}
!100 = metadata !{i32 97, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !96, i32 97, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/sgefa/sgesl.c]
!102 = metadata !{i32 98, i32 0, metadata !96, null}
!103 = metadata !{i32 99, i32 0, metadata !96, null}
!104 = metadata !{i32 100, i32 0, metadata !96, null}
!105 = metadata !{i32 101, i32 0, metadata !96, null}
!106 = metadata !{i32 103, i32 0, metadata !4, null}
