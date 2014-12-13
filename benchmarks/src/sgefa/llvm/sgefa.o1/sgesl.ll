; ModuleID = 'sgesl.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgesl(%struct.FULL* nocapture readonly %a, i32* nocapture readonly %ipvt, float* nocapture %b, i32 %job) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.FULL* %a}, i64 0, metadata !23), !dbg !40
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !24), !dbg !41
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !25), !dbg !42
  tail call void @llvm.dbg.value(metadata !{i32 %job}, i64 0, metadata !26), !dbg !41
  %1 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !43
  %2 = load i32* %1, align 4, !dbg !43, !tbaa !44
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !35), !dbg !43
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !36), !dbg !49
  %3 = icmp eq i32 %job, 0, !dbg !50
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !33), !dbg !53
  br i1 %3, label %.preheader4, label %.preheader6, !dbg !50

.preheader6:                                      ; preds = %0
  %4 = icmp sgt i32 %2, 0, !dbg !56
  br i1 %4, label %.lr.ph40, label %._crit_edge41, !dbg !56

.preheader4:                                      ; preds = %0
  %5 = add nsw i32 %2, -1, !dbg !49
  %6 = icmp sgt i32 %5, 0, !dbg !53
  br i1 %6, label %.lr.ph18, label %.preheader, !dbg !53

.lr.ph18:                                         ; preds = %.preheader4
  %7 = add i32 %2, -1, !dbg !53
  br label %10, !dbg !53

.preheader:                                       ; preds = %._crit_edge15, %.preheader4
  %8 = icmp sgt i32 %2, 0, !dbg !58
  br i1 %8, label %.lr.ph10, label %.loopexit, !dbg !58

.lr.ph10:                                         ; preds = %.preheader
  %9 = sext i32 %2 to i64
  br label %34, !dbg !58

; <label>:10                                      ; preds = %._crit_edge15, %.lr.ph18
  %indvars.iv53 = phi i64 [ 0, %.lr.ph18 ], [ %indvars.iv.next54, %._crit_edge15 ]
  %indvars.iv47 = phi i64 [ 1, %.lr.ph18 ], [ %indvars.iv.next48, %._crit_edge15 ]
  %.0117 = phi i32* [ %ipvt, %.lr.ph18 ], [ %33, %._crit_edge15 ]
  %11 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv53, !dbg !60
  %12 = load float** %11, align 8, !dbg !60, !tbaa !62
  %13 = load i32* %.0117, align 4, !dbg !64, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !34), !dbg !64
  %14 = sext i32 %13 to i64, !dbg !66
  %15 = getelementptr inbounds float* %b, i64 %14, !dbg !66
  %16 = load float* %15, align 4, !dbg !66, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %16}, i64 0, metadata !27), !dbg !66
  %17 = trunc i64 %indvars.iv53 to i32, !dbg !69
  %18 = icmp eq i32 %13, %17, !dbg !69
  br i1 %18, label %22, label %19, !dbg !69

; <label>:19                                      ; preds = %10
  %20 = getelementptr inbounds float* %b, i64 %indvars.iv53, !dbg !71
  %21 = load float* %20, align 4, !dbg !71, !tbaa !67
  store float %21, float* %15, align 4, !dbg !71, !tbaa !67
  store float %16, float* %20, align 4, !dbg !73, !tbaa !67
  br label %22, !dbg !74

; <label>:22                                      ; preds = %10, %19
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{float* %25}, i64 0, metadata !29), !dbg !75
  %23 = trunc i64 %indvars.iv.next54 to i32, !dbg !75
  %24 = icmp slt i32 %23, %2, !dbg !75
  br i1 %24, label %.lr.ph14, label %._crit_edge15, !dbg !75

.lr.ph14:                                         ; preds = %22
  %.sum3 = add i64 %indvars.iv53, 1, !dbg !75
  %25 = getelementptr inbounds float* %12, i64 %.sum3, !dbg !75
  br label %26, !dbg !75

; <label>:26                                      ; preds = %26, %.lr.ph14
  %indvars.iv49 = phi i64 [ %indvars.iv47, %.lr.ph14 ], [ %indvars.iv.next50, %26 ]
  %mik.011 = phi float* [ %25, %.lr.ph14 ], [ %32, %26 ]
  %27 = load float* %mik.011, align 4, !dbg !77, !tbaa !67
  %28 = fmul float %16, %27, !dbg !77
  %29 = getelementptr inbounds float* %b, i64 %indvars.iv49, !dbg !77
  %30 = load float* %29, align 4, !dbg !77, !tbaa !67
  %31 = fadd float %30, %28, !dbg !77
  store float %31, float* %29, align 4, !dbg !77, !tbaa !67
  %32 = getelementptr inbounds float* %mik.011, i64 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !{float* %32}, i64 0, metadata !29), !dbg !75
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !75
  %lftr.wideiv51 = trunc i64 %indvars.iv.next50 to i32, !dbg !75
  %exitcond52 = icmp eq i32 %lftr.wideiv51, %2, !dbg !75
  br i1 %exitcond52, label %._crit_edge15, label %26, !dbg !75

._crit_edge15:                                    ; preds = %26, %22
  %33 = getelementptr inbounds i32* %.0117, i64 1, !dbg !53
  tail call void @llvm.dbg.value(metadata !{i32* %33}, i64 0, metadata !24), !dbg !53
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1, !dbg !53
  %lftr.wideiv55 = trunc i64 %indvars.iv.next54 to i32, !dbg !53
  %exitcond56 = icmp eq i32 %lftr.wideiv55, %7, !dbg !53
  br i1 %exitcond56, label %.preheader, label %10, !dbg !53

; <label>:34                                      ; preds = %.lr.ph10, %._crit_edge
  %indvars.iv45.in = phi i64 [ %9, %.lr.ph10 ], [ %indvars.iv45, %._crit_edge ]
  %indvars.iv43.in = phi i32 [ %2, %.lr.ph10 ], [ %indvars.iv43, %._crit_edge ]
  %indvars.iv43 = add i32 %indvars.iv43.in, -1, !dbg !58
  %indvars.iv45 = add i64 %indvars.iv45.in, -1, !dbg !58
  %35 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv45, !dbg !78
  %36 = load float** %35, align 8, !dbg !78, !tbaa !62
  %37 = getelementptr inbounds float* %36, i64 %indvars.iv45, !dbg !78
  tail call void @llvm.dbg.value(metadata !{float* %37}, i64 0, metadata !28), !dbg !78
  %38 = load float* %37, align 4, !dbg !80, !tbaa !67
  %39 = getelementptr inbounds float* %b, i64 %indvars.iv45, !dbg !80
  %40 = load float* %39, align 4, !dbg !80, !tbaa !67
  %41 = fdiv float %40, %38, !dbg !80
  store float %41, float* %39, align 4, !dbg !80, !tbaa !67
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !81
  tail call void @llvm.dbg.value(metadata !{float* %44}, i64 0, metadata !30), !dbg !81
  %42 = trunc i64 %indvars.iv45 to i32, !dbg !81
  %43 = icmp sgt i32 %42, 0, !dbg !81
  br i1 %43, label %.lr.ph, label %._crit_edge, !dbg !81

.lr.ph:                                           ; preds = %34
  %44 = load float** %35, align 8, !dbg !81, !tbaa !62
  br label %45, !dbg !81

; <label>:45                                      ; preds = %45, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %45 ]
  %uik.07 = phi float* [ %44, %.lr.ph ], [ %52, %45 ]
  %46 = load float* %uik.07, align 4, !dbg !83, !tbaa !67
  %47 = load float* %39, align 4, !dbg !83, !tbaa !67
  %48 = fmul float %46, %47, !dbg !83
  %49 = getelementptr inbounds float* %b, i64 %indvars.iv, !dbg !83
  %50 = load float* %49, align 4, !dbg !83, !tbaa !67
  %51 = fsub float %50, %48, !dbg !83
  store float %51, float* %49, align 4, !dbg !83, !tbaa !67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !81
  %52 = getelementptr inbounds float* %uik.07, i64 1, !dbg !81
  tail call void @llvm.dbg.value(metadata !{float* %52}, i64 0, metadata !30), !dbg !81
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !81
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv43, !dbg !81
  br i1 %exitcond, label %._crit_edge, label %45, !dbg !81

._crit_edge:                                      ; preds = %45, %34
  %53 = trunc i64 %indvars.iv45 to i32, !dbg !58
  %54 = icmp sgt i32 %53, 0, !dbg !58
  br i1 %54, label %34, label %.loopexit, !dbg !58

.lr.ph40:                                         ; preds = %.preheader6, %._crit_edge37
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge37 ], [ 0, %.preheader6 ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge37 ], [ 0, %.preheader6 ]
  %55 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv64, !dbg !84
  %56 = load float** %55, align 8, !dbg !84, !tbaa !62
  %57 = getelementptr inbounds float* %56, i64 %indvars.iv64, !dbg !84
  tail call void @llvm.dbg.value(metadata !{float* %57}, i64 0, metadata !28), !dbg !84
  tail call void @llvm.dbg.value(metadata !52, i64 0, metadata !32), !dbg !86
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !27), !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %56}, i64 0, metadata !30), !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %b}, i64 0, metadata !31), !dbg !86
  %58 = trunc i64 %indvars.iv64 to i32, !dbg !86
  %59 = icmp sgt i32 %58, 0, !dbg !86
  br i1 %59, label %.lr.ph36, label %._crit_edge37, !dbg !86

.lr.ph36:                                         ; preds = %.lr.ph40, %.lr.ph36
  %i.234 = phi i32 [ %64, %.lr.ph36 ], [ 0, %.lr.ph40 ]
  %bi.033 = phi float* [ %66, %.lr.ph36 ], [ %b, %.lr.ph40 ]
  %uik.132 = phi float* [ %65, %.lr.ph36 ], [ %56, %.lr.ph40 ]
  %t.031 = phi float [ %63, %.lr.ph36 ], [ 0.000000e+00, %.lr.ph40 ]
  %60 = load float* %uik.132, align 4, !dbg !89, !tbaa !67
  %61 = load float* %bi.033, align 4, !dbg !89, !tbaa !67
  %62 = fmul float %60, %61, !dbg !89
  %63 = fadd float %t.031, %62, !dbg !89
  tail call void @llvm.dbg.value(metadata !{float %63}, i64 0, metadata !27), !dbg !89
  %64 = add nsw i32 %i.234, 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !32), !dbg !86
  %65 = getelementptr inbounds float* %uik.132, i64 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %65}, i64 0, metadata !30), !dbg !86
  %66 = getelementptr inbounds float* %bi.033, i64 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !{float* %66}, i64 0, metadata !31), !dbg !86
  %exitcond63 = icmp eq i32 %64, %indvars.iv61, !dbg !86
  br i1 %exitcond63, label %._crit_edge37, label %.lr.ph36, !dbg !86

._crit_edge37:                                    ; preds = %.lr.ph36, %.lr.ph40
  %t.0.lcssa = phi float [ 0.000000e+00, %.lr.ph40 ], [ %63, %.lr.ph36 ]
  %67 = getelementptr inbounds float* %b, i64 %indvars.iv64, !dbg !90
  %68 = load float* %67, align 4, !dbg !90, !tbaa !67
  %69 = fsub float %68, %t.0.lcssa, !dbg !90
  %70 = load float* %57, align 4, !dbg !90, !tbaa !67
  %71 = fdiv float %69, %70, !dbg !90
  store float %71, float* %67, align 4, !dbg !90, !tbaa !67
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1, !dbg !56
  %indvars.iv.next62 = add nuw nsw i32 %indvars.iv61, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next62}, i64 0, metadata !33), !dbg !56
  %lftr.wideiv66 = trunc i64 %indvars.iv.next65 to i32, !dbg !56
  %exitcond67 = icmp eq i32 %lftr.wideiv66, %2, !dbg !56
  br i1 %exitcond67, label %._crit_edge41, label %.lr.ph40, !dbg !56

._crit_edge41:                                    ; preds = %._crit_edge37, %.preheader6
  %72 = add nsw i32 %2, -2, !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32* %75}, i64 0, metadata !24), !dbg !91
  tail call void @llvm.dbg.value(metadata !{i32 %72}, i64 0, metadata !33), !dbg !92
  %73 = icmp sgt i32 %72, -1, !dbg !92
  br i1 %73, label %.lr.ph30, label %.loopexit, !dbg !92

.lr.ph30:                                         ; preds = %._crit_edge41
  %74 = sext i32 %72 to i64, !dbg !91
  %75 = getelementptr inbounds i32* %ipvt, i64 %74, !dbg !91
  %76 = add i32 %2, -2, !dbg !92
  %77 = sext i32 %76 to i64
  br label %78, !dbg !92

; <label>:78                                      ; preds = %.lr.ph30, %104
  %indvars.iv58 = phi i64 [ %77, %.lr.ph30 ], [ %indvars.iv.next59, %104 ]
  %.128 = phi i32* [ %75, %.lr.ph30 ], [ %105, %104 ]
  tail call void @llvm.dbg.value(metadata !88, i64 0, metadata !27), !dbg !94
  %.sum = add i64 %indvars.iv58, 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %86}, i64 0, metadata !29), !dbg !94
  %79 = getelementptr inbounds float* %b, i64 %indvars.iv58, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %85}, i64 0, metadata !31), !dbg !94
  %80 = add nsw i64 %indvars.iv58, 1, !dbg !94
  %81 = trunc i64 %80 to i32, !dbg !94
  %82 = icmp slt i32 %81, %2, !dbg !94
  br i1 %82, label %.lr.ph25, label %._crit_edge26, !dbg !94

.lr.ph25:                                         ; preds = %78
  %83 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv58, !dbg !94
  %84 = load float** %83, align 8, !dbg !94, !tbaa !62
  %85 = getelementptr inbounds float* %b, i64 %.sum, !dbg !94
  %86 = getelementptr inbounds float* %84, i64 %.sum, !dbg !94
  %87 = trunc i64 %80 to i32, !dbg !94
  br label %88, !dbg !94

; <label>:88                                      ; preds = %88, %.lr.ph25
  %i.323 = phi i32 [ %87, %.lr.ph25 ], [ %i.3, %88 ]
  %bi.122 = phi float* [ %85, %.lr.ph25 ], [ %94, %88 ]
  %mik.121 = phi float* [ %86, %.lr.ph25 ], [ %93, %88 ]
  %t.120 = phi float [ 0.000000e+00, %.lr.ph25 ], [ %92, %88 ]
  %89 = load float* %mik.121, align 4, !dbg !97, !tbaa !67
  %90 = load float* %bi.122, align 4, !dbg !97, !tbaa !67
  %91 = fmul float %89, %90, !dbg !97
  %92 = fadd float %t.120, %91, !dbg !97
  tail call void @llvm.dbg.value(metadata !{float %92}, i64 0, metadata !27), !dbg !97
  %93 = getelementptr inbounds float* %mik.121, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %93}, i64 0, metadata !29), !dbg !94
  %94 = getelementptr inbounds float* %bi.122, i64 1, !dbg !94
  tail call void @llvm.dbg.value(metadata !{float* %94}, i64 0, metadata !31), !dbg !94
  %i.3 = add nsw i32 %i.323, 1, !dbg !94
  %exitcond57 = icmp eq i32 %i.3, %2, !dbg !94
  br i1 %exitcond57, label %._crit_edge26, label %88, !dbg !94

._crit_edge26:                                    ; preds = %88, %78
  %t.1.lcssa = phi float [ 0.000000e+00, %78 ], [ %92, %88 ]
  %95 = load float* %79, align 4, !dbg !98, !tbaa !67
  %96 = fadd float %t.1.lcssa, %95, !dbg !98
  store float %96, float* %79, align 4, !dbg !98, !tbaa !67
  %97 = load i32* %.128, align 4, !dbg !99, !tbaa !65
  tail call void @llvm.dbg.value(metadata !{i32 %97}, i64 0, metadata !34), !dbg !99
  %98 = trunc i64 %indvars.iv58 to i32, !dbg !100
  %99 = icmp eq i32 %97, %98, !dbg !100
  br i1 %99, label %104, label %100, !dbg !100

; <label>:100                                     ; preds = %._crit_edge26
  %101 = sext i32 %97 to i64, !dbg !102
  %102 = getelementptr inbounds float* %b, i64 %101, !dbg !102
  %103 = load float* %102, align 4, !dbg !102, !tbaa !67
  tail call void @llvm.dbg.value(metadata !{float %103}, i64 0, metadata !27), !dbg !102
  store float %96, float* %102, align 4, !dbg !103, !tbaa !67
  store float %103, float* %79, align 4, !dbg !104, !tbaa !67
  br label %104, !dbg !105

; <label>:104                                     ; preds = %._crit_edge26, %100
  %105 = getelementptr inbounds i32* %.128, i64 -1, !dbg !92
  tail call void @llvm.dbg.value(metadata !{i32* %105}, i64 0, metadata !24), !dbg !92
  %106 = trunc i64 %indvars.iv58 to i32, !dbg !92
  %107 = icmp sgt i32 %106, 0, !dbg !92
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, -1, !dbg !92
  br i1 %107, label %78, label %.loopexit, !dbg !92

.loopexit:                                        ; preds = %104, %._crit_edge, %._crit_edge41, %.preheader
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
