; ModuleID = 'spectral-norm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define double @eval_A(i32 %i, i32 %j) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !11), !dbg !68
  tail call void @llvm.dbg.value(metadata !{i32 %j}, i64 0, metadata !12), !dbg !68
  %1 = add nsw i32 %j, %i, !dbg !68
  %2 = add nsw i32 %1, 1, !dbg !68
  %3 = mul nsw i32 %2, %1, !dbg !68
  %4 = sdiv i32 %3, 2, !dbg !68
  %5 = add i32 %i, 1, !dbg !68
  %6 = add i32 %5, %4, !dbg !68
  %7 = sitofp i32 %6 to double, !dbg !68
  %8 = fdiv double 1.000000e+00, %7, !dbg !68
  ret double %8, !dbg !68
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @eval_A_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !20), !dbg !69
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !21), !dbg !69
  tail call void @llvm.dbg.value(metadata !{double* %Au}, i64 0, metadata !22), !dbg !69
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !23), !dbg !71
  %1 = icmp sgt i32 %N, 0, !dbg !71
  br i1 %1, label %.lr.ph4, label %._crit_edge5, !dbg !71

.lr.ph4:                                          ; preds = %0, %._crit_edge
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge ], [ 0, %0 ]
  %2 = getelementptr inbounds double* %Au, i64 %indvars.iv6, !dbg !73
  store double 0.000000e+00, double* %2, align 8, !dbg !73, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !24), !dbg !79
  br label %.lr.ph, !dbg !79

.lr.ph:                                           ; preds = %.lr.ph4, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph4 ]
  %3 = trunc i64 %indvars.iv to i32, !dbg !79
  %4 = trunc i64 %indvars.iv6 to i32, !dbg !79
  %5 = tail call double @eval_A(i32 %4, i32 %3), !dbg !79
  %6 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !79
  %7 = load double* %6, align 8, !dbg !79, !tbaa !75
  %8 = fmul double %5, %7, !dbg !79
  %9 = load double* %2, align 8, !dbg !79, !tbaa !75
  %10 = fadd double %9, %8, !dbg !79
  store double %10, double* %2, align 8, !dbg !79, !tbaa !75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !79
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !79
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !79
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !79

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !71
  %lftr.wideiv8 = trunc i64 %indvars.iv.next7 to i32, !dbg !71
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %N, !dbg !71
  br i1 %exitcond9, label %._crit_edge5, label %.lr.ph4, !dbg !71

._crit_edge5:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !81
}

; Function Attrs: nounwind uwtable
define void @eval_At_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %Au) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !27), !dbg !82
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !28), !dbg !82
  tail call void @llvm.dbg.value(metadata !{double* %Au}, i64 0, metadata !29), !dbg !82
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !30), !dbg !83
  %1 = icmp sgt i32 %N, 0, !dbg !83
  br i1 %1, label %.lr.ph4, label %._crit_edge5, !dbg !83

.lr.ph4:                                          ; preds = %0, %._crit_edge
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge ], [ 0, %0 ]
  %2 = getelementptr inbounds double* %Au, i64 %indvars.iv6, !dbg !85
  store double 0.000000e+00, double* %2, align 8, !dbg !85, !tbaa !75
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !31), !dbg !87
  br label %.lr.ph, !dbg !87

.lr.ph:                                           ; preds = %.lr.ph4, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.lr.ph4 ]
  %3 = trunc i64 %indvars.iv to i32, !dbg !87
  %4 = trunc i64 %indvars.iv6 to i32, !dbg !87
  %5 = tail call double @eval_A(i32 %3, i32 %4), !dbg !87
  %6 = getelementptr inbounds double* %u, i64 %indvars.iv, !dbg !87
  %7 = load double* %6, align 8, !dbg !87, !tbaa !75
  %8 = fmul double %5, %7, !dbg !87
  %9 = load double* %2, align 8, !dbg !87, !tbaa !75
  %10 = fadd double %9, %8, !dbg !87
  store double %10, double* %2, align 8, !dbg !87, !tbaa !75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !87
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !87
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !87
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !87

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !83
  %lftr.wideiv8 = trunc i64 %indvars.iv.next7 to i32, !dbg !83
  %exitcond9 = icmp eq i32 %lftr.wideiv8, %N, !dbg !83
  br i1 %exitcond9, label %._crit_edge5, label %.lr.ph4, !dbg !83

._crit_edge5:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @eval_AtA_times_u(i32 %N, double* nocapture readonly %u, double* nocapture %AtAu) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !34), !dbg !90
  tail call void @llvm.dbg.value(metadata !{double* %u}, i64 0, metadata !35), !dbg !90
  tail call void @llvm.dbg.value(metadata !{double* %AtAu}, i64 0, metadata !36), !dbg !90
  %1 = zext i32 %N to i64, !dbg !91
  %2 = alloca double, i64 %1, align 16, !dbg !91
  tail call void @llvm.dbg.declare(metadata !{double* %2}, metadata !37), !dbg !91
  call void @eval_A_times_u(i32 %N, double* %u, double* %2), !dbg !91
  call void @eval_At_times_u(i32 %N, double* %2, double* %AtAu), !dbg !91
  ret void, !dbg !91
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #2 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !48), !dbg !92
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !49), !dbg !92
  %1 = icmp eq i32 %argc, 2, !dbg !93
  br i1 %1, label %4, label %.thread, !dbg !93

.thread:                                          ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !51), !dbg !94
  %2 = alloca [2000 x double], align 16, !dbg !95
  tail call void @llvm.dbg.declare(metadata !{double* %13}, metadata !52), !dbg !95
  %3 = alloca [2000 x double], align 16, !dbg !95
  tail call void @llvm.dbg.declare(metadata !{double* %15}, metadata !53), !dbg !95
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !50), !dbg !96
  %.sub16 = getelementptr inbounds [2000 x double]* %3, i64 0, i64 0
  %.sub = getelementptr inbounds [2000 x double]* %2, i64 0, i64 0
  br label %.lr.ph9, !dbg !96

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8** %argv, i64 1, !dbg !94
  %6 = load i8** %5, align 8, !dbg !94, !tbaa !98
  %7 = tail call i32 @atoi(i8* %6) #5, !dbg !94
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !51), !dbg !94
  %8 = zext i32 %7 to i64, !dbg !95
  %9 = alloca double, i64 %8, align 16, !dbg !95
  tail call void @llvm.dbg.declare(metadata !{double* %13}, metadata !52), !dbg !95
  %10 = alloca double, i64 %8, align 16, !dbg !95
  tail call void @llvm.dbg.declare(metadata !{double* %15}, metadata !53), !dbg !95
  tail call void @llvm.dbg.value(metadata !70, i64 0, metadata !50), !dbg !96
  %11 = icmp sgt i32 %7, 0, !dbg !96
  br i1 %11, label %.lr.ph9, label %.preheader1, !dbg !96

.lr.ph9:                                          ; preds = %.thread, %4
  %12 = phi double* [ %.sub16, %.thread ], [ %10, %4 ]
  %13 = phi double* [ %.sub, %.thread ], [ %9, %4 ]
  %14 = phi i32 [ 2000, %.thread ], [ %7, %4 ]
  br label %18, !dbg !96

.preheader1:                                      ; preds = %18, %4
  %15 = phi double* [ %10, %4 ], [ %12, %18 ]
  %16 = phi double* [ %9, %4 ], [ %13, %18 ]
  %17 = phi i32 [ %7, %4 ], [ %14, %18 ]
  br label %21, !dbg !100

; <label>:18                                      ; preds = %18, %.lr.ph9
  %indvars.iv12 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next13, %18 ]
  %19 = getelementptr inbounds double* %13, i64 %indvars.iv12, !dbg !96
  store double 1.000000e+00, double* %19, align 8, !dbg !96, !tbaa !75
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !96
  %lftr.wideiv14 = trunc i64 %indvars.iv.next13 to i32, !dbg !96
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %14, !dbg !96
  br i1 %exitcond15, label %.preheader1, label %18, !dbg !96

.preheader:                                       ; preds = %21
  %20 = icmp sgt i32 %17, 0, !dbg !102
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !102

; <label>:21                                      ; preds = %21, %.preheader1
  %i.16 = phi i32 [ 0, %.preheader1 ], [ %22, %21 ]
  call void @eval_AtA_times_u(i32 %17, double* %16, double* %15), !dbg !104
  call void @eval_AtA_times_u(i32 %17, double* %15, double* %16), !dbg !106
  %22 = add nsw i32 %i.16, 1, !dbg !100
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !50), !dbg !100
  %exitcond11 = icmp eq i32 %22, 10, !dbg !100
  br i1 %exitcond11, label %.preheader, label %21, !dbg !100

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %23 = phi <2 x double> [ %32, %.lr.ph ], [ zeroinitializer, %.preheader ]
  %24 = getelementptr inbounds double* %16, i64 %indvars.iv, !dbg !107
  %25 = load double* %24, align 8, !dbg !107, !tbaa !75
  %26 = getelementptr inbounds double* %15, i64 %indvars.iv, !dbg !107
  %27 = load double* %26, align 8, !dbg !107, !tbaa !75
  tail call void @llvm.dbg.value(metadata !109, i64 0, metadata !54), !dbg !107
  %28 = insertelement <2 x double> undef, double %27, i32 0, !dbg !107
  %29 = insertelement <2 x double> %28, double %27, i32 1, !dbg !107
  %30 = insertelement <2 x double> %28, double %25, i32 1, !dbg !107
  %31 = fmul <2 x double> %29, %30, !dbg !107
  %32 = fadd <2 x double> %23, %31, !dbg !107
  tail call void @llvm.dbg.value(metadata !109, i64 0, metadata !55), !dbg !107
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !102
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !102
  %exitcond = icmp eq i32 %lftr.wideiv, %17, !dbg !102
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !102

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %33 = phi <2 x double> [ zeroinitializer, %.preheader ], [ %32, %.lr.ph ]
  %34 = extractelement <2 x double> %33, i32 1, !dbg !110
  %35 = extractelement <2 x double> %33, i32 0, !dbg !110
  %36 = fdiv double %34, %35, !dbg !110
  %37 = tail call double @sqrt(double %36) #6, !dbg !110
  %38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), double %37) #6, !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally i32 @atoi(i8* nocapture readonly %__nptr) #3 {
  tail call void @llvm.dbg.value(metadata !{i8* %__nptr}, i64 0, metadata !64), !dbg !112
  %1 = tail call i64 @strtol(i8* nocapture %__nptr, i8** null, i32 10) #6, !dbg !113
  %2 = trunc i64 %1 to i32, !dbg !113
  ret i32 %2, !dbg !113
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!65, !66}
!llvm.ident = !{!67}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c] [DW_LANG_C99]
!1 = metadata !{metadata !"spectral-norm.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !13, metadata !25, metadata !32, metadata !41, metadata !56}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A", metadata !"eval_A", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32)* @eval_A, null, null, metadata !10, i32 13} ; [ DW_TAG_subprogram ] [line 13] [def] [eval_A]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"i", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [i] [line 13]
!12 = metadata !{i32 786689, metadata !4, metadata !"j", metadata !5, i32 33554445, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [j] [line 13]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_A_times_u", metadata !"eval_A_times_u", metadata !"", i32 15, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_A_times_u, null, null, metadata !19, i32 16} ; [ DW_TAG_subprogram ] [line 15] [def] [scope 16] [eval_A_times_u]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{null, metadata !9, metadata !16, metadata !18}
!16 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!17 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!19 = metadata !{metadata !20, metadata !21, metadata !22, metadata !23, metadata !24}
!20 = metadata !{i32 786689, metadata !13, metadata !"N", metadata !5, i32 16777231, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 15]
!21 = metadata !{i32 786689, metadata !13, metadata !"u", metadata !5, i32 33554447, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 15]
!22 = metadata !{i32 786689, metadata !13, metadata !"Au", metadata !5, i32 50331663, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 15]
!23 = metadata !{i32 786688, metadata !13, metadata !"i", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!24 = metadata !{i32 786688, metadata !13, metadata !"j", metadata !5, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 17]
!25 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_At_times_u", metadata !"eval_At_times_u", metadata !"", i32 25, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_At_times_u, null, null, metadata !26, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [eval_At_times_u]
!26 = metadata !{metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!27 = metadata !{i32 786689, metadata !25, metadata !"N", metadata !5, i32 16777241, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 25]
!28 = metadata !{i32 786689, metadata !25, metadata !"u", metadata !5, i32 33554457, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 25]
!29 = metadata !{i32 786689, metadata !25, metadata !"Au", metadata !5, i32 50331673, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Au] [line 25]
!30 = metadata !{i32 786688, metadata !25, metadata !"i", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 27]
!31 = metadata !{i32 786688, metadata !25, metadata !"j", metadata !5, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 27]
!32 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"eval_AtA_times_u", metadata !"eval_AtA_times_u", metadata !"", i32 35, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @eval_AtA_times_u, null, null, metadata !33, i32 36} ; [ DW_TAG_subprogram ] [line 35] [def] [scope 36] [eval_AtA_times_u]
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !37}
!34 = metadata !{i32 786689, metadata !32, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!35 = metadata !{i32 786689, metadata !32, metadata !"u", metadata !5, i32 33554467, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [u] [line 35]
!36 = metadata !{i32 786689, metadata !32, metadata !"AtAu", metadata !5, i32 50331683, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [AtAu] [line 35]
!37 = metadata !{i32 786688, metadata !32, metadata !"v", metadata !5, i32 36, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 36]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 0, i64 64, i32 0, i32 0, metadata !8, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 0, align 64, offset 0] [from double]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 -1}       ; [ DW_TAG_subrange_type ] [unbounded]
!41 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 38, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !47, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [main]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !9, metadata !9, metadata !44}
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!47 = metadata !{metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55}
!48 = metadata !{i32 786689, metadata !41, metadata !"argc", metadata !5, i32 16777254, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 38]
!49 = metadata !{i32 786689, metadata !41, metadata !"argv", metadata !5, i32 33554470, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 38]
!50 = metadata !{i32 786688, metadata !41, metadata !"i", metadata !5, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 40]
!51 = metadata !{i32 786688, metadata !41, metadata !"N", metadata !5, i32 41, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 41]
!52 = metadata !{i32 786688, metadata !41, metadata !"u", metadata !5, i32 42, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [u] [line 42]
!53 = metadata !{i32 786688, metadata !41, metadata !"v", metadata !5, i32 42, metadata !38, i32 8192, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 42]
!54 = metadata !{i32 786688, metadata !41, metadata !"vBv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vBv] [line 42]
!55 = metadata !{i32 786688, metadata !41, metadata !"vv", metadata !5, i32 42, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [vv] [line 42]
!56 = metadata !{i32 786478, metadata !57, metadata !58, metadata !"atoi", metadata !"atoi", metadata !"", i32 278, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @atoi, null, null, metadata !63, i32 279} ; [ DW_TAG_subprogram ] [line 278] [def] [scope 279] [atoi]
!57 = metadata !{metadata !"/usr/include/stdlib.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!58 = metadata !{i32 786473, metadata !57}        ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !9, metadata !61}
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786689, metadata !56, metadata !"__nptr", metadata !58, i32 16777494, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__nptr] [line 278]
!65 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!66 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!67 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!68 = metadata !{i32 13, i32 0, metadata !4, null}
!69 = metadata !{i32 15, i32 0, metadata !13, null}
!70 = metadata !{i32 0}
!71 = metadata !{i32 18, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !13, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!73 = metadata !{i32 20, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !1, metadata !72, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!75 = metadata !{metadata !76, metadata !76, i64 0}
!76 = metadata !{metadata !"double", metadata !77, i64 0}
!77 = metadata !{metadata !"omnipotent char", metadata !78, i64 0}
!78 = metadata !{metadata !"Simple C/C++ TBAA"}
!79 = metadata !{i32 21, i32 0, metadata !80, null}
!80 = metadata !{i32 786443, metadata !1, metadata !74, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!81 = metadata !{i32 23, i32 0, metadata !13, null}
!82 = metadata !{i32 25, i32 0, metadata !25, null}
!83 = metadata !{i32 28, i32 0, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !25, i32 28, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!85 = metadata !{i32 30, i32 0, metadata !86, null}
!86 = metadata !{i32 786443, metadata !1, metadata !84, i32 29, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!87 = metadata !{i32 31, i32 0, metadata !88, null}
!88 = metadata !{i32 786443, metadata !1, metadata !86, i32 31, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!89 = metadata !{i32 33, i32 0, metadata !25, null}
!90 = metadata !{i32 35, i32 0, metadata !32, null}
!91 = metadata !{i32 36, i32 0, metadata !32, null}
!92 = metadata !{i32 38, i32 0, metadata !41, null}
!93 = metadata !{i32 41, i32 0, metadata !41, null}
!94 = metadata !{i32 41, i32 26, metadata !41, null}
!95 = metadata !{i32 42, i32 0, metadata !41, null}
!96 = metadata !{i32 43, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !1, metadata !41, i32 43, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!98 = metadata !{metadata !99, metadata !99, i64 0}
!99 = metadata !{metadata !"any pointer", metadata !77, i64 0}
!100 = metadata !{i32 44, i32 0, metadata !101, null}
!101 = metadata !{i32 786443, metadata !1, metadata !41, i32 44, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!102 = metadata !{i32 50, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !41, i32 50, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!104 = metadata !{i32 46, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !101, i32 45, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!106 = metadata !{i32 47, i32 0, metadata !105, null}
!107 = metadata !{i32 50, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !103, i32 50, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/spectral-norm.c]
!109 = metadata !{double undef}
!110 = metadata !{i32 51, i32 0, metadata !41, null}
!111 = metadata !{i32 53, i32 0, metadata !41, null}
!112 = metadata !{i32 278, i32 0, metadata !56, null}
!113 = metadata !{i32 280, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !57, metadata !56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base//usr/include/stdlib.h]
