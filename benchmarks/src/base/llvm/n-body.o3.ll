; ModuleID = 'n-body.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* nocapture %bodies, double %dt) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nbodies}, i64 0, metadata !21), !dbg !88
  tail call void @llvm.dbg.value(metadata !{%struct.planet* %bodies}, i64 0, metadata !22), !dbg !88
  tail call void @llvm.dbg.value(metadata !{double %dt}, i64 0, metadata !23), !dbg !88
  tail call void @llvm.dbg.value(metadata !89, i64 0, metadata !24), !dbg !90
  %1 = icmp sgt i32 %nbodies, 0, !dbg !90
  br i1 %1, label %.lr.ph8, label %._crit_edge, !dbg !90

.loopexit:                                        ; preds = %11, %.lr.ph8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !90
  %exitcond18 = icmp eq i32 %2, %nbodies, !dbg !90
  br i1 %exitcond18, label %.preheader, label %.lr.ph8, !dbg !90

.preheader:                                       ; preds = %.loopexit
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !91

.lr.ph8:                                          ; preds = %0, %.loopexit
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.loopexit ], [ 0, %0 ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.loopexit ], [ 1, %0 ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1, !dbg !90
  %2 = trunc i64 %indvars.iv.next16 to i32, !dbg !92
  %3 = icmp slt i32 %2, %nbodies, !dbg !92
  br i1 %3, label %.lr.ph5, label %.loopexit, !dbg !92

.lr.ph5:                                          ; preds = %.lr.ph8
  %4 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 0, !dbg !93
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 1, !dbg !94
  %6 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 2, !dbg !95
  %7 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 3, !dbg !96
  %8 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 4, !dbg !97
  %9 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 5, !dbg !98
  %10 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv15, i32 6, !dbg !99
  br label %11, !dbg !92

; <label>:11                                      ; preds = %11, %.lr.ph5
  %indvars.iv11 = phi i64 [ %indvars.iv9, %.lr.ph5 ], [ %indvars.iv.next12, %11 ]
  %12 = load double* %4, align 8, !dbg !93, !tbaa !100
  %13 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 0, !dbg !93
  %14 = load double* %13, align 8, !dbg !93, !tbaa !100
  %15 = fsub double %12, %14, !dbg !93
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !32), !dbg !93
  %16 = load double* %5, align 8, !dbg !94, !tbaa !105
  %17 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 1, !dbg !94
  %18 = load double* %17, align 8, !dbg !94, !tbaa !105
  %19 = fsub double %16, %18, !dbg !94
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !33), !dbg !94
  %20 = load double* %6, align 8, !dbg !95, !tbaa !106
  %21 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 2, !dbg !95
  %22 = load double* %21, align 8, !dbg !95, !tbaa !106
  %23 = fsub double %20, %22, !dbg !95
  tail call void @llvm.dbg.value(metadata !{double %23}, i64 0, metadata !34), !dbg !95
  %24 = fmul double %15, %15, !dbg !107
  %25 = fmul double %19, %19, !dbg !107
  %26 = fadd double %24, %25, !dbg !107
  %27 = fmul double %23, %23, !dbg !107
  %28 = fadd double %26, %27, !dbg !107
  %29 = tail call double @sqrt(double %28) #3, !dbg !107
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !35), !dbg !107
  %30 = fmul double %29, %29, !dbg !108
  %31 = fmul double %29, %30, !dbg !108
  %32 = fdiv double %dt, %31, !dbg !108
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !36), !dbg !108
  %33 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 6, !dbg !96
  %34 = load double* %33, align 8, !dbg !96, !tbaa !109
  %35 = fmul double %15, %34, !dbg !96
  %36 = fmul double %32, %35, !dbg !96
  %37 = load double* %7, align 8, !dbg !96, !tbaa !110
  %38 = fsub double %37, %36, !dbg !96
  store double %38, double* %7, align 8, !dbg !96, !tbaa !110
  %39 = load double* %33, align 8, !dbg !97, !tbaa !109
  %40 = fmul double %19, %39, !dbg !97
  %41 = fmul double %32, %40, !dbg !97
  %42 = load double* %8, align 8, !dbg !97, !tbaa !111
  %43 = fsub double %42, %41, !dbg !97
  store double %43, double* %8, align 8, !dbg !97, !tbaa !111
  %44 = load double* %33, align 8, !dbg !98, !tbaa !109
  %45 = fmul double %23, %44, !dbg !98
  %46 = fmul double %32, %45, !dbg !98
  %47 = load double* %9, align 8, !dbg !98, !tbaa !112
  %48 = fsub double %47, %46, !dbg !98
  store double %48, double* %9, align 8, !dbg !98, !tbaa !112
  %49 = load double* %10, align 8, !dbg !99, !tbaa !109
  %50 = fmul double %15, %49, !dbg !99
  %51 = fmul double %32, %50, !dbg !99
  %52 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 3, !dbg !99
  %53 = load double* %52, align 8, !dbg !99, !tbaa !110
  %54 = fadd double %53, %51, !dbg !99
  store double %54, double* %52, align 8, !dbg !99, !tbaa !110
  %55 = load double* %10, align 8, !dbg !113, !tbaa !109
  %56 = fmul double %19, %55, !dbg !113
  %57 = fmul double %32, %56, !dbg !113
  %58 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 4, !dbg !113
  %59 = load double* %58, align 8, !dbg !113, !tbaa !111
  %60 = fadd double %59, %57, !dbg !113
  store double %60, double* %58, align 8, !dbg !113, !tbaa !111
  %61 = load double* %10, align 8, !dbg !114, !tbaa !109
  %62 = fmul double %23, %61, !dbg !114
  %63 = fmul double %32, %62, !dbg !114
  %64 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv11, i32 5, !dbg !114
  %65 = load double* %64, align 8, !dbg !114, !tbaa !112
  %66 = fadd double %65, %63, !dbg !114
  store double %66, double* %64, align 8, !dbg !114, !tbaa !112
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !92
  %lftr.wideiv13 = trunc i64 %indvars.iv.next12 to i32, !dbg !92
  %exitcond14 = icmp eq i32 %lftr.wideiv13, %nbodies, !dbg !92
  br i1 %exitcond14, label %.loopexit, label %11, !dbg !92

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %67 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !115
  %68 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 0, !dbg !115
  %69 = bitcast double* %67 to <2 x double>*, !dbg !115
  %70 = load <2 x double>* %69, align 8, !dbg !115, !tbaa !116
  %71 = insertelement <2 x double> undef, double %dt, i32 0, !dbg !115
  %72 = insertelement <2 x double> %71, double %dt, i32 1, !dbg !115
  %73 = fmul <2 x double> %72, %70, !dbg !115
  %74 = bitcast double* %68 to <2 x double>*, !dbg !115
  %75 = load <2 x double>* %74, align 8, !dbg !115, !tbaa !116
  %76 = fadd <2 x double> %75, %73, !dbg !115
  %77 = bitcast double* %68 to <2 x double>*, !dbg !115
  store <2 x double> %76, <2 x double>* %77, align 8, !dbg !115, !tbaa !116
  %78 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !117
  %79 = load double* %78, align 8, !dbg !117, !tbaa !112
  %80 = fmul double %79, %dt, !dbg !117
  %81 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 2, !dbg !117
  %82 = load double* %81, align 8, !dbg !117, !tbaa !106
  %83 = fadd double %82, %80, !dbg !117
  store double %83, double* %81, align 8, !dbg !117, !tbaa !106
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !91
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !91
  %exitcond = icmp eq i32 %lftr.wideiv, %nbodies, !dbg !91
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !91

._crit_edge:                                      ; preds = %.lr.ph, %0, %.preheader
  ret void, !dbg !118
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* nocapture readonly %bodies) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nbodies}, i64 0, metadata !44), !dbg !119
  tail call void @llvm.dbg.value(metadata !{%struct.planet* %bodies}, i64 0, metadata !45), !dbg !119
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !46), !dbg !121
  tail call void @llvm.dbg.value(metadata !89, i64 0, metadata !47), !dbg !122
  %1 = icmp sgt i32 %nbodies, 0, !dbg !122
  br i1 %1, label %.lr.ph5, label %._crit_edge, !dbg !122

.loopexit:                                        ; preds = %23, %.lr.ph5
  %e.1.lcssa = phi double [ %17, %.lr.ph5 ], [ %47, %23 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !122
  %exitcond12 = icmp eq i32 %18, %nbodies, !dbg !122
  br i1 %exitcond12, label %._crit_edge, label %.lr.ph5, !dbg !122

.lr.ph5:                                          ; preds = %0, %.loopexit
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.loopexit ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.loopexit ], [ 1, %0 ]
  %e.04 = phi double [ %e.1.lcssa, %.loopexit ], [ 0.000000e+00, %0 ]
  %2 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 6, !dbg !123
  %3 = load double* %2, align 8, !dbg !123, !tbaa !109
  %4 = fmul double %3, 5.000000e-01, !dbg !123
  %5 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 3, !dbg !123
  %6 = load double* %5, align 8, !dbg !123, !tbaa !110
  %7 = fmul double %6, %6, !dbg !123
  %8 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 4, !dbg !123
  %9 = load double* %8, align 8, !dbg !123, !tbaa !111
  %10 = fmul double %9, %9, !dbg !123
  %11 = fadd double %7, %10, !dbg !123
  %12 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 5, !dbg !123
  %13 = load double* %12, align 8, !dbg !123, !tbaa !112
  %14 = fmul double %13, %13, !dbg !123
  %15 = fadd double %11, %14, !dbg !123
  %16 = fmul double %4, %15, !dbg !123
  %17 = fadd double %e.04, %16, !dbg !123
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !46), !dbg !123
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !122
  %18 = trunc i64 %indvars.iv.next10 to i32, !dbg !124
  %19 = icmp slt i32 %18, %nbodies, !dbg !124
  br i1 %19, label %.lr.ph, label %.loopexit, !dbg !124

.lr.ph:                                           ; preds = %.lr.ph5
  %20 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 0, !dbg !125
  %21 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 1, !dbg !126
  %22 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv9, i32 2, !dbg !127
  br label %23, !dbg !124

; <label>:23                                      ; preds = %23, %.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv, %.lr.ph ], [ %indvars.iv.next8, %23 ]
  %e.12 = phi double [ %17, %.lr.ph ], [ %47, %23 ]
  %24 = load double* %20, align 8, !dbg !125, !tbaa !100
  %25 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv7, i32 0, !dbg !125
  %26 = load double* %25, align 8, !dbg !125, !tbaa !100
  %27 = fsub double %24, %26, !dbg !125
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !55), !dbg !125
  %28 = load double* %21, align 8, !dbg !126, !tbaa !105
  %29 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv7, i32 1, !dbg !126
  %30 = load double* %29, align 8, !dbg !126, !tbaa !105
  %31 = fsub double %28, %30, !dbg !126
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !56), !dbg !126
  %32 = load double* %22, align 8, !dbg !127, !tbaa !106
  %33 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv7, i32 2, !dbg !127
  %34 = load double* %33, align 8, !dbg !127, !tbaa !106
  %35 = fsub double %32, %34, !dbg !127
  tail call void @llvm.dbg.value(metadata !{double %35}, i64 0, metadata !57), !dbg !127
  %36 = fmul double %27, %27, !dbg !128
  %37 = fmul double %31, %31, !dbg !128
  %38 = fadd double %36, %37, !dbg !128
  %39 = fmul double %35, %35, !dbg !128
  %40 = fadd double %38, %39, !dbg !128
  %41 = tail call double @sqrt(double %40) #3, !dbg !128
  tail call void @llvm.dbg.value(metadata !{double %41}, i64 0, metadata !58), !dbg !128
  %42 = load double* %2, align 8, !dbg !129, !tbaa !109
  %43 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv7, i32 6, !dbg !129
  %44 = load double* %43, align 8, !dbg !129, !tbaa !109
  %45 = fmul double %42, %44, !dbg !129
  %46 = fdiv double %45, %41, !dbg !129
  %47 = fsub double %e.12, %46, !dbg !129
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !46), !dbg !129
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !124
  %lftr.wideiv = trunc i64 %indvars.iv.next8 to i32, !dbg !124
  %exitcond = icmp eq i32 %lftr.wideiv, %nbodies, !dbg !124
  br i1 %exitcond, label %.loopexit, label %23, !dbg !124

._crit_edge:                                      ; preds = %.loopexit, %0
  %e.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %e.1.lcssa, %.loopexit ]
  ret double %e.0.lcssa, !dbg !130
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* nocapture %bodies) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nbodies}, i64 0, metadata !63), !dbg !131
  tail call void @llvm.dbg.value(metadata !{%struct.planet* %bodies}, i64 0, metadata !64), !dbg !131
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !65), !dbg !132
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !66), !dbg !132
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !67), !dbg !132
  tail call void @llvm.dbg.value(metadata !89, i64 0, metadata !68), !dbg !133
  %1 = icmp sgt i32 %nbodies, 0, !dbg !133
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !133

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %pz.03 = phi double [ %15, %.lr.ph ], [ 0.000000e+00, %0 ]
  %2 = phi <2 x double> [ %11, %.lr.ph ], [ zeroinitializer, %0 ]
  %3 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !135
  %4 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 6, !dbg !135
  %5 = load double* %4, align 8, !dbg !135, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !65), !dbg !135
  %6 = bitcast double* %3 to <2 x double>*, !dbg !135
  %7 = load <2 x double>* %6, align 8, !dbg !135, !tbaa !116
  %8 = insertelement <2 x double> undef, double %5, i32 0, !dbg !135
  %9 = insertelement <2 x double> %8, double %5, i32 1, !dbg !135
  %10 = fmul <2 x double> %7, %9, !dbg !135
  %11 = fadd <2 x double> %2, %10, !dbg !135
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !66), !dbg !138
  %12 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !139
  %13 = load double* %12, align 8, !dbg !139, !tbaa !112
  %14 = fmul double %5, %13, !dbg !139
  %15 = fadd double %pz.03, %14, !dbg !139
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !67), !dbg !139
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !133
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !133
  %exitcond = icmp eq i32 %lftr.wideiv, %nbodies, !dbg !133
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !133

._crit_edge:                                      ; preds = %.lr.ph, %0
  %pz.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %15, %.lr.ph ]
  %16 = phi <2 x double> [ zeroinitializer, %0 ], [ %11, %.lr.ph ]
  %17 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 3, !dbg !140
  %18 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %16, !dbg !140
  %19 = fdiv <2 x double> %18, <double 0x4043BD3CC9BE45DE, double 0x4043BD3CC9BE45DE>, !dbg !140
  %20 = bitcast double* %17 to <2 x double>*, !dbg !140
  store <2 x double> %19, <2 x double>* %20, align 8, !dbg !140, !tbaa !116
  %21 = fsub double -0.000000e+00, %pz.0.lcssa, !dbg !141
  %22 = fdiv double %21, 0x4043BD3CC9BE45DE, !dbg !141
  %23 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 5, !dbg !141
  store double %22, double* %23, align 8, !dbg !141, !tbaa !112
  ret void, !dbg !142
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
.lr.ph.i:
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !76), !dbg !143
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !77), !dbg !143
  tail call void @llvm.dbg.value(metadata !144, i64 0, metadata !78), !dbg !145
  tail call void @llvm.dbg.value(metadata !146, i64 0, metadata !147), !dbg !149
  tail call void @llvm.dbg.value(metadata !150, i64 0, metadata !151), !dbg !149
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !152), !dbg !153
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !154), !dbg !153
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !155), !dbg !153
  tail call void @llvm.dbg.value(metadata !89, i64 0, metadata !156), !dbg !157
  %0 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 6), align 16, !dbg !158, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !152), !dbg !158
  %1 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 3) to <2 x double>*), align 8, !dbg !158, !tbaa !116
  %2 = insertelement <2 x double> undef, double %0, i32 0, !dbg !158
  %3 = insertelement <2 x double> %2, double %0, i32 1, !dbg !158
  %4 = fmul <2 x double> %1, %3, !dbg !158
  %5 = fadd <2 x double> %4, zeroinitializer, !dbg !158
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !154), !dbg !159
  %6 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 5), align 8, !dbg !160, !tbaa !112
  %7 = fmul double %0, %6, !dbg !160
  %8 = fadd double %7, 0.000000e+00, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !155), !dbg !160
  %9 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 6), align 8, !dbg !158, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !152), !dbg !158
  %10 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 3) to <2 x double>*), align 8, !dbg !158, !tbaa !116
  %11 = insertelement <2 x double> undef, double %9, i32 0, !dbg !158
  %12 = insertelement <2 x double> %11, double %9, i32 1, !dbg !158
  %13 = fmul <2 x double> %10, %12, !dbg !158
  %14 = fadd <2 x double> %5, %13, !dbg !158
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !154), !dbg !159
  %15 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 5), align 8, !dbg !160, !tbaa !112
  %16 = fmul double %9, %15, !dbg !160
  %17 = fadd double %8, %16, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !155), !dbg !160
  %18 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 6), align 16, !dbg !158, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !152), !dbg !158
  %19 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 3) to <2 x double>*), align 8, !dbg !158, !tbaa !116
  %20 = insertelement <2 x double> undef, double %18, i32 0, !dbg !158
  %21 = insertelement <2 x double> %20, double %18, i32 1, !dbg !158
  %22 = fmul <2 x double> %19, %21, !dbg !158
  %23 = fadd <2 x double> %14, %22, !dbg !158
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !154), !dbg !159
  %24 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 5), align 8, !dbg !160, !tbaa !112
  %25 = fmul double %18, %24, !dbg !160
  %26 = fadd double %17, %25, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !155), !dbg !160
  %27 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 6), align 8, !dbg !158, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !152), !dbg !158
  %28 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 3) to <2 x double>*), align 8, !dbg !158, !tbaa !116
  %29 = insertelement <2 x double> undef, double %27, i32 0, !dbg !158
  %30 = insertelement <2 x double> %29, double %27, i32 1, !dbg !158
  %31 = fmul <2 x double> %28, %30, !dbg !158
  %32 = fadd <2 x double> %23, %31, !dbg !158
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !154), !dbg !159
  %33 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 5), align 8, !dbg !160, !tbaa !112
  %34 = fmul double %27, %33, !dbg !160
  %35 = fadd double %26, %34, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !155), !dbg !160
  %36 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 6), align 16, !dbg !158, !tbaa !109
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !152), !dbg !158
  %37 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 3) to <2 x double>*), align 8, !dbg !158, !tbaa !116
  %38 = insertelement <2 x double> undef, double %36, i32 0, !dbg !158
  %39 = insertelement <2 x double> %38, double %36, i32 1, !dbg !158
  %40 = fmul <2 x double> %37, %39, !dbg !158
  %41 = fadd <2 x double> %32, %40, !dbg !158
  tail call void @llvm.dbg.value(metadata !137, i64 0, metadata !154), !dbg !159
  %42 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 5), align 8, !dbg !160, !tbaa !112
  %43 = fmul double %36, %42, !dbg !160
  %44 = fadd double %35, %43, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !155), !dbg !160
  %45 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %41, !dbg !161
  %46 = fdiv <2 x double> %45, <double 0x4043BD3CC9BE45DE, double 0x4043BD3CC9BE45DE>, !dbg !161
  store <2 x double> %46, <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 3) to <2 x double>*), align 8, !dbg !161, !tbaa !116
  %47 = fsub double -0.000000e+00, %44, !dbg !162
  %48 = fdiv double %47, 0x4043BD3CC9BE45DE, !dbg !162
  store double %48, double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 5), align 8, !dbg !162, !tbaa !112
  tail call void @llvm.dbg.value(metadata !146, i64 0, metadata !163) #3, !dbg !165
  tail call void @llvm.dbg.value(metadata !150, i64 0, metadata !166) #3, !dbg !165
  tail call void @llvm.dbg.value(metadata !120, i64 0, metadata !167) #3, !dbg !168
  tail call void @llvm.dbg.value(metadata !89, i64 0, metadata !169) #3, !dbg !170
  %49 = extractelement <2 x double> %46, i32 0
  %50 = extractelement <2 x double> %46, i32 1
  br label %.lr.ph5.i14

.loopexit.i9:                                     ; preds = %69, %.lr.ph5.i14
  %e.1.lcssa.i6 = phi double [ %63, %.lr.ph5.i14 ], [ %93, %69 ]
  %exitcond33 = icmp eq i64 %indvars.iv.next10.i13, 5, !dbg !170
  br i1 %exitcond33, label %energy.exit21, label %.loopexit.i9..lr.ph5.i14_crit_edge, !dbg !170

.loopexit.i9..lr.ph5.i14_crit_edge:               ; preds = %.loopexit.i9
  %indvars.iv.next.i7 = add nuw nsw i64 %indvars.iv.i11, 1, !dbg !170
  %.phi.trans.insert = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv.next10.i13, i32 6
  %.pre = load double* %.phi.trans.insert, align 8, !dbg !171, !tbaa !109
  %.phi.trans.insert35 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv.next10.i13, i32 3
  %.pre36 = load double* %.phi.trans.insert35, align 8, !dbg !171, !tbaa !110
  %.phi.trans.insert37 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv.next10.i13, i32 4
  %.pre38 = load double* %.phi.trans.insert37, align 8, !dbg !171, !tbaa !111
  %.phi.trans.insert39 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv.next10.i13, i32 5
  %.pre40 = load double* %.phi.trans.insert39, align 8, !dbg !171, !tbaa !112
  br label %.lr.ph5.i14, !dbg !170

.lr.ph5.i14:                                      ; preds = %.loopexit.i9..lr.ph5.i14_crit_edge, %.lr.ph.i
  %51 = phi double [ %.pre40, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ %48, %.lr.ph.i ]
  %52 = phi double [ %.pre38, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ %50, %.lr.ph.i ]
  %53 = phi double [ %.pre36, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ %49, %.lr.ph.i ]
  %54 = phi double [ %.pre, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ %0, %.lr.ph.i ]
  %indvars.iv9.i10 = phi i64 [ %indvars.iv.next10.i13, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ 0, %.lr.ph.i ]
  %indvars.iv.i11 = phi i64 [ %indvars.iv.next.i7, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ 1, %.lr.ph.i ]
  %e.04.i12 = phi double [ %e.1.lcssa.i6, %.loopexit.i9..lr.ph5.i14_crit_edge ], [ 0.000000e+00, %.lr.ph.i ]
  %55 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i10, i32 6, !dbg !171
  %56 = fmul double %54, 5.000000e-01, !dbg !171
  %57 = fmul double %53, %53, !dbg !171
  %58 = fmul double %52, %52, !dbg !171
  %59 = fadd double %57, %58, !dbg !171
  %60 = fmul double %51, %51, !dbg !171
  %61 = fadd double %59, %60, !dbg !171
  %62 = fmul double %56, %61, !dbg !171
  %63 = fadd double %e.04.i12, %62, !dbg !171
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !167) #3, !dbg !171
  %indvars.iv.next10.i13 = add nuw nsw i64 %indvars.iv9.i10, 1, !dbg !170
  %64 = trunc i64 %indvars.iv.next10.i13 to i32, !dbg !172
  %65 = icmp slt i32 %64, 5, !dbg !172
  br i1 %65, label %.lr.ph.i15, label %.loopexit.i9, !dbg !172

.lr.ph.i15:                                       ; preds = %.lr.ph5.i14
  %66 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i10, i32 0, !dbg !173
  %67 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i10, i32 1, !dbg !174
  %68 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i10, i32 2, !dbg !175
  br label %69, !dbg !172

; <label>:69                                      ; preds = %69, %.lr.ph.i15
  %indvars.iv7.i16 = phi i64 [ %indvars.iv.i11, %.lr.ph.i15 ], [ %indvars.iv.next8.i18, %69 ]
  %e.12.i17 = phi double [ %63, %.lr.ph.i15 ], [ %93, %69 ]
  %70 = load double* %66, align 8, !dbg !173, !tbaa !100
  %71 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i16, i32 0, !dbg !173
  %72 = load double* %71, align 8, !dbg !173, !tbaa !100
  %73 = fsub double %70, %72, !dbg !173
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !176) #3, !dbg !173
  %74 = load double* %67, align 8, !dbg !174, !tbaa !105
  %75 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i16, i32 1, !dbg !174
  %76 = load double* %75, align 8, !dbg !174, !tbaa !105
  %77 = fsub double %74, %76, !dbg !174
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !177) #3, !dbg !174
  %78 = load double* %68, align 8, !dbg !175, !tbaa !106
  %79 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i16, i32 2, !dbg !175
  %80 = load double* %79, align 8, !dbg !175, !tbaa !106
  %81 = fsub double %78, %80, !dbg !175
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !178) #3, !dbg !175
  %82 = fmul double %73, %73, !dbg !179
  %83 = fmul double %77, %77, !dbg !179
  %84 = fadd double %82, %83, !dbg !179
  %85 = fmul double %81, %81, !dbg !179
  %86 = fadd double %84, %85, !dbg !179
  %87 = tail call double @sqrt(double %86) #3, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !180) #3, !dbg !179
  %88 = load double* %55, align 8, !dbg !181, !tbaa !109
  %89 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i16, i32 6, !dbg !181
  %90 = load double* %89, align 8, !dbg !181, !tbaa !109
  %91 = fmul double %88, %90, !dbg !181
  %92 = fdiv double %91, %87, !dbg !181
  %93 = fsub double %e.12.i17, %92, !dbg !181
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !167) #3, !dbg !181
  %indvars.iv.next8.i18 = add nuw nsw i64 %indvars.iv7.i16, 1, !dbg !172
  %lftr.wideiv31 = trunc i64 %indvars.iv.next8.i18 to i32, !dbg !172
  %exitcond32 = icmp eq i32 %lftr.wideiv31, 5, !dbg !172
  br i1 %exitcond32, label %.loopexit.i9, label %69, !dbg !172

energy.exit21:                                    ; preds = %.loopexit.i9
  %94 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %e.1.lcssa.i6) #3, !dbg !164
  tail call void @llvm.dbg.value(metadata !182, i64 0, metadata !79), !dbg !183
  br label %95, !dbg !183

; <label>:95                                      ; preds = %95, %energy.exit21
  %i.025 = phi i32 [ 1, %energy.exit21 ], [ %96, %95 ]
  tail call void @advance(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0), double 1.000000e-02), !dbg !185
  %96 = add nsw i32 %i.025, 1, !dbg !183
  tail call void @llvm.dbg.value(metadata !{i32 %96}, i64 0, metadata !79), !dbg !183
  %exitcond30 = icmp eq i32 %96, 5000001, !dbg !183
  br i1 %exitcond30, label %.lr.ph5.i, label %95, !dbg !183

.loopexit.i:                                      ; preds = %118, %.lr.ph5.i
  %e.1.lcssa.i = phi double [ %112, %.lr.ph5.i ], [ %142, %118 ]
  %indvars.iv.next.i1 = add nuw nsw i64 %indvars.iv.i2, 1, !dbg !186
  %exitcond29 = icmp eq i64 %indvars.iv.next10.i, 5, !dbg !186
  br i1 %exitcond29, label %energy.exit, label %.lr.ph5.i, !dbg !186

.lr.ph5.i:                                        ; preds = %95, %.loopexit.i
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %.loopexit.i ], [ 0, %95 ]
  %indvars.iv.i2 = phi i64 [ %indvars.iv.next.i1, %.loopexit.i ], [ 1, %95 ]
  %e.04.i = phi double [ %e.1.lcssa.i, %.loopexit.i ], [ 0.000000e+00, %95 ]
  %97 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 6, !dbg !188
  %98 = load double* %97, align 8, !dbg !188, !tbaa !109
  %99 = fmul double %98, 5.000000e-01, !dbg !188
  %100 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 3, !dbg !188
  %101 = load double* %100, align 8, !dbg !188, !tbaa !110
  %102 = fmul double %101, %101, !dbg !188
  %103 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 4, !dbg !188
  %104 = load double* %103, align 8, !dbg !188, !tbaa !111
  %105 = fmul double %104, %104, !dbg !188
  %106 = fadd double %102, %105, !dbg !188
  %107 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 5, !dbg !188
  %108 = load double* %107, align 8, !dbg !188, !tbaa !112
  %109 = fmul double %108, %108, !dbg !188
  %110 = fadd double %106, %109, !dbg !188
  %111 = fmul double %99, %110, !dbg !188
  %112 = fadd double %e.04.i, %111, !dbg !188
  tail call void @llvm.dbg.value(metadata !{double %112}, i64 0, metadata !189) #3, !dbg !188
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !186
  %113 = trunc i64 %indvars.iv.next10.i to i32, !dbg !190
  %114 = icmp slt i32 %113, 5, !dbg !190
  br i1 %114, label %.lr.ph.i3, label %.loopexit.i, !dbg !190

.lr.ph.i3:                                        ; preds = %.lr.ph5.i
  %115 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 0, !dbg !191
  %116 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 1, !dbg !192
  %117 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv9.i, i32 2, !dbg !193
  br label %118, !dbg !190

; <label>:118                                     ; preds = %118, %.lr.ph.i3
  %indvars.iv7.i = phi i64 [ %indvars.iv.i2, %.lr.ph.i3 ], [ %indvars.iv.next8.i, %118 ]
  %e.12.i = phi double [ %112, %.lr.ph.i3 ], [ %142, %118 ]
  %119 = load double* %115, align 8, !dbg !191, !tbaa !100
  %120 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i, i32 0, !dbg !191
  %121 = load double* %120, align 8, !dbg !191, !tbaa !100
  %122 = fsub double %119, %121, !dbg !191
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !194) #3, !dbg !191
  %123 = load double* %116, align 8, !dbg !192, !tbaa !105
  %124 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i, i32 1, !dbg !192
  %125 = load double* %124, align 8, !dbg !192, !tbaa !105
  %126 = fsub double %123, %125, !dbg !192
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !195) #3, !dbg !192
  %127 = load double* %117, align 8, !dbg !193, !tbaa !106
  %128 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i, i32 2, !dbg !193
  %129 = load double* %128, align 8, !dbg !193, !tbaa !106
  %130 = fsub double %127, %129, !dbg !193
  tail call void @llvm.dbg.value(metadata !{double %130}, i64 0, metadata !196) #3, !dbg !193
  %131 = fmul double %122, %122, !dbg !197
  %132 = fmul double %126, %126, !dbg !197
  %133 = fadd double %131, %132, !dbg !197
  %134 = fmul double %130, %130, !dbg !197
  %135 = fadd double %133, %134, !dbg !197
  %136 = tail call double @sqrt(double %135) #3, !dbg !197
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !198) #3, !dbg !197
  %137 = load double* %97, align 8, !dbg !199, !tbaa !109
  %138 = getelementptr inbounds [5 x %struct.planet]* @bodies, i64 0, i64 %indvars.iv7.i, i32 6, !dbg !199
  %139 = load double* %138, align 8, !dbg !199, !tbaa !109
  %140 = fmul double %137, %139, !dbg !199
  %141 = fdiv double %140, %136, !dbg !199
  %142 = fsub double %e.12.i, %141, !dbg !199
  tail call void @llvm.dbg.value(metadata !{double %142}, i64 0, metadata !189) #3, !dbg !199
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !190
  %lftr.wideiv = trunc i64 %indvars.iv.next8.i to i32, !dbg !190
  %exitcond = icmp eq i32 %lftr.wideiv, 5, !dbg !190
  br i1 %exitcond, label %.loopexit.i, label %118, !dbg !190

energy.exit:                                      ; preds = %.loopexit.i
  %143 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %e.1.lcssa.i) #3, !dbg !187
  ret i32 0, !dbg !200
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!85, !86}
!llvm.ident = !{!87}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !80, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c] [DW_LANG_C99]
!1 = metadata !{metadata !"n-body.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !40, metadata !59, metadata !69}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"advance", metadata !"advance", metadata !"", i32 23, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struct.planet*, double)* @advance, null, null, metadata !20, i32 24} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [advance]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9, metadata !13}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from planet]
!10 = metadata !{i32 786451, metadata !1, null, metadata !"planet", i32 17, i64 448, i64 64, i32 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [planet] [line 17, size 448, align 64, offset 0] [def] [from ]
!11 = metadata !{metadata !12, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
!12 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"x", i32 18, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ] [x] [line 18, size 64, align 64, offset 0] [from double]
!13 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"y", i32 18, i64 64, i64 64, i64 64, i32 0, metadata !13} ; [ DW_TAG_member ] [y] [line 18, size 64, align 64, offset 64] [from double]
!15 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"z", i32 18, i64 64, i64 64, i64 128, i32 0, metadata !13} ; [ DW_TAG_member ] [z] [line 18, size 64, align 64, offset 128] [from double]
!16 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vx", i32 19, i64 64, i64 64, i64 192, i32 0, metadata !13} ; [ DW_TAG_member ] [vx] [line 19, size 64, align 64, offset 192] [from double]
!17 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vy", i32 19, i64 64, i64 64, i64 256, i32 0, metadata !13} ; [ DW_TAG_member ] [vy] [line 19, size 64, align 64, offset 256] [from double]
!18 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"vz", i32 19, i64 64, i64 64, i64 320, i32 0, metadata !13} ; [ DW_TAG_member ] [vz] [line 19, size 64, align 64, offset 320] [from double]
!19 = metadata !{i32 786445, metadata !1, metadata !10, metadata !"mass", i32 20, i64 64, i64 64, i64 384, i32 0, metadata !13} ; [ DW_TAG_member ] [mass] [line 20, size 64, align 64, offset 384] [from double]
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !29, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37}
!21 = metadata !{i32 786689, metadata !4, metadata !"nbodies", metadata !5, i32 16777239, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 23]
!22 = metadata !{i32 786689, metadata !4, metadata !"bodies", metadata !5, i32 33554455, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 23]
!23 = metadata !{i32 786689, metadata !4, metadata !"dt", metadata !5, i32 50331671, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dt] [line 23]
!24 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 25]
!25 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 25, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!26 = metadata !{i32 786688, metadata !27, metadata !"b", metadata !5, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 28]
!27 = metadata !{i32 786443, metadata !1, metadata !28, i32 27, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!28 = metadata !{i32 786443, metadata !1, metadata !4, i32 27, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!29 = metadata !{i32 786688, metadata !30, metadata !"b2", metadata !5, i32 30, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b2] [line 30]
!30 = metadata !{i32 786443, metadata !1, metadata !31, i32 29, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!31 = metadata !{i32 786443, metadata !1, metadata !27, i32 29, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!32 = metadata !{i32 786688, metadata !30, metadata !"dx", metadata !5, i32 31, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dx] [line 31]
!33 = metadata !{i32 786688, metadata !30, metadata !"dy", metadata !5, i32 32, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dy] [line 32]
!34 = metadata !{i32 786688, metadata !30, metadata !"dz", metadata !5, i32 33, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dz] [line 33]
!35 = metadata !{i32 786688, metadata !30, metadata !"distance", metadata !5, i32 34, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!36 = metadata !{i32 786688, metadata !30, metadata !"mag", metadata !5, i32 35, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mag] [line 35]
!37 = metadata !{i32 786688, metadata !38, metadata !"b", metadata !5, i32 45, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 45]
!38 = metadata !{i32 786443, metadata !1, metadata !39, i32 44, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 44, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!40 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"energy", metadata !"energy", metadata !"", i32 52, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, %struct.planet*)* @energy, null, null, metadata !43, i32 53} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [energy]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !13, metadata !8, metadata !9}
!43 = metadata !{metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !52, metadata !55, metadata !56, metadata !57, metadata !58}
!44 = metadata !{i32 786689, metadata !40, metadata !"nbodies", metadata !5, i32 16777268, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!45 = metadata !{i32 786689, metadata !40, metadata !"bodies", metadata !5, i32 33554484, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!46 = metadata !{i32 786688, metadata !40, metadata !"e", metadata !5, i32 54, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 54]
!47 = metadata !{i32 786688, metadata !40, metadata !"i", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 55]
!48 = metadata !{i32 786688, metadata !40, metadata !"j", metadata !5, i32 55, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 55]
!49 = metadata !{i32 786688, metadata !50, metadata !"b", metadata !5, i32 59, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 59]
!50 = metadata !{i32 786443, metadata !1, metadata !51, i32 58, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!51 = metadata !{i32 786443, metadata !1, metadata !40, i32 58, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!52 = metadata !{i32 786688, metadata !53, metadata !"b2", metadata !5, i32 62, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b2] [line 62]
!53 = metadata !{i32 786443, metadata !1, metadata !54, i32 61, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!54 = metadata !{i32 786443, metadata !1, metadata !50, i32 61, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!55 = metadata !{i32 786688, metadata !53, metadata !"dx", metadata !5, i32 63, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dx] [line 63]
!56 = metadata !{i32 786688, metadata !53, metadata !"dy", metadata !5, i32 64, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dy] [line 64]
!57 = metadata !{i32 786688, metadata !53, metadata !"dz", metadata !5, i32 65, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dz] [line 65]
!58 = metadata !{i32 786688, metadata !53, metadata !"distance", metadata !5, i32 66, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!59 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"offset_momentum", metadata !"offset_momentum", metadata !"", i32 73, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struct.planet*)* @offset_momentum, null, null, metadata !62, i32 74} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [offset_momentum]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{null, metadata !8, metadata !9}
!62 = metadata !{metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68}
!63 = metadata !{i32 786689, metadata !59, metadata !"nbodies", metadata !5, i32 16777289, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!64 = metadata !{i32 786689, metadata !59, metadata !"bodies", metadata !5, i32 33554505, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!65 = metadata !{i32 786688, metadata !59, metadata !"px", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [px] [line 75]
!66 = metadata !{i32 786688, metadata !59, metadata !"py", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [py] [line 75]
!67 = metadata !{i32 786688, metadata !59, metadata !"pz", metadata !5, i32 75, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pz] [line 75]
!68 = metadata !{i32 786688, metadata !59, metadata !"i", metadata !5, i32 76, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 76]
!69 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 130, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !75, i32 131} ; [ DW_TAG_subprogram ] [line 130] [def] [scope 131] [main]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !8, metadata !8, metadata !72}
!72 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!73 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!74 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!75 = metadata !{metadata !76, metadata !77, metadata !78, metadata !79}
!76 = metadata !{i32 786689, metadata !69, metadata !"argc", metadata !5, i32 16777346, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 130]
!77 = metadata !{i32 786689, metadata !69, metadata !"argv", metadata !5, i32 33554562, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 130]
!78 = metadata !{i32 786688, metadata !69, metadata !"n", metadata !5, i32 132, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 132]
!79 = metadata !{i32 786688, metadata !69, metadata !"i", metadata !5, i32 133, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 133]
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786484, i32 0, null, metadata !"bodies", metadata !"bodies", metadata !"", metadata !5, i32 88, metadata !82, i32 0, i32 1, [5 x %struct.planet]* @bodies, null} ; [ DW_TAG_variable ] [bodies] [line 88] [def]
!82 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2240, i64 64, i32 0, i32 0, metadata !10, metadata !83, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2240, align 64, offset 0] [from planet]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!85 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!86 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!87 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!88 = metadata !{i32 23, i32 0, metadata !4, null}
!89 = metadata !{i32 0}
!90 = metadata !{i32 27, i32 0, metadata !28, null}
!91 = metadata !{i32 44, i32 0, metadata !39, null}
!92 = metadata !{i32 29, i32 0, metadata !31, null}
!93 = metadata !{i32 31, i32 0, metadata !30, null}
!94 = metadata !{i32 32, i32 0, metadata !30, null}
!95 = metadata !{i32 33, i32 0, metadata !30, null}
!96 = metadata !{i32 36, i32 0, metadata !30, null}
!97 = metadata !{i32 37, i32 0, metadata !30, null}
!98 = metadata !{i32 38, i32 0, metadata !30, null}
!99 = metadata !{i32 39, i32 0, metadata !30, null}
!100 = metadata !{metadata !101, metadata !102, i64 0}
!101 = metadata !{metadata !"planet", metadata !102, i64 0, metadata !102, i64 8, metadata !102, i64 16, metadata !102, i64 24, metadata !102, i64 32, metadata !102, i64 40, metadata !102, i64 48}
!102 = metadata !{metadata !"double", metadata !103, i64 0}
!103 = metadata !{metadata !"omnipotent char", metadata !104, i64 0}
!104 = metadata !{metadata !"Simple C/C++ TBAA"}
!105 = metadata !{metadata !101, metadata !102, i64 8}
!106 = metadata !{metadata !101, metadata !102, i64 16}
!107 = metadata !{i32 34, i32 0, metadata !30, null}
!108 = metadata !{i32 35, i32 0, metadata !30, null}
!109 = metadata !{metadata !101, metadata !102, i64 48}
!110 = metadata !{metadata !101, metadata !102, i64 24}
!111 = metadata !{metadata !101, metadata !102, i64 32}
!112 = metadata !{metadata !101, metadata !102, i64 40}
!113 = metadata !{i32 40, i32 0, metadata !30, null}
!114 = metadata !{i32 41, i32 0, metadata !30, null}
!115 = metadata !{i32 46, i32 0, metadata !38, null}
!116 = metadata !{metadata !102, metadata !102, i64 0}
!117 = metadata !{i32 48, i32 0, metadata !38, null}
!118 = metadata !{i32 50, i32 0, metadata !4, null}
!119 = metadata !{i32 52, i32 0, metadata !40, null}
!120 = metadata !{double 0.000000e+00}
!121 = metadata !{i32 57, i32 0, metadata !40, null}
!122 = metadata !{i32 58, i32 0, metadata !51, null} ; [ DW_TAG_imported_module ]
!123 = metadata !{i32 60, i32 0, metadata !50, null}
!124 = metadata !{i32 61, i32 0, metadata !54, null}
!125 = metadata !{i32 63, i32 0, metadata !53, null}
!126 = metadata !{i32 64, i32 0, metadata !53, null}
!127 = metadata !{i32 65, i32 0, metadata !53, null}
!128 = metadata !{i32 66, i32 0, metadata !53, null}
!129 = metadata !{i32 67, i32 0, metadata !53, null}
!130 = metadata !{i32 70, i32 0, metadata !40, null}
!131 = metadata !{i32 73, i32 0, metadata !59, null}
!132 = metadata !{i32 75, i32 0, metadata !59, null}
!133 = metadata !{i32 77, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !59, i32 77, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!135 = metadata !{i32 78, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !134, i32 77, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!137 = metadata !{double undef}
!138 = metadata !{i32 79, i32 0, metadata !136, null}
!139 = metadata !{i32 80, i32 0, metadata !136, null}
!140 = metadata !{i32 82, i32 0, metadata !59, null}
!141 = metadata !{i32 84, i32 0, metadata !59, null}
!142 = metadata !{i32 85, i32 0, metadata !59, null}
!143 = metadata !{i32 130, i32 0, metadata !69, null}
!144 = metadata !{i32 5000000}
!145 = metadata !{i32 132, i32 0, metadata !69, null}
!146 = metadata !{i32 5}
!147 = metadata !{i32 786689, metadata !59, metadata !"nbodies", metadata !5, i32 16777289, metadata !8, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!148 = metadata !{i32 135, i32 0, metadata !69, null}
!149 = metadata !{i32 73, i32 0, metadata !59, metadata !148}
!150 = metadata !{%struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)}
!151 = metadata !{i32 786689, metadata !59, metadata !"bodies", metadata !5, i32 33554505, metadata !9, i32 0, metadata !148} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!152 = metadata !{i32 786688, metadata !59, metadata !"px", metadata !5, i32 75, metadata !13, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [px] [line 75]
!153 = metadata !{i32 75, i32 0, metadata !59, metadata !148}
!154 = metadata !{i32 786688, metadata !59, metadata !"py", metadata !5, i32 75, metadata !13, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [py] [line 75]
!155 = metadata !{i32 786688, metadata !59, metadata !"pz", metadata !5, i32 75, metadata !13, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [pz] [line 75]
!156 = metadata !{i32 786688, metadata !59, metadata !"i", metadata !5, i32 76, metadata !8, i32 0, metadata !148} ; [ DW_TAG_auto_variable ] [i] [line 76]
!157 = metadata !{i32 77, i32 0, metadata !134, metadata !148}
!158 = metadata !{i32 78, i32 0, metadata !136, metadata !148}
!159 = metadata !{i32 79, i32 0, metadata !136, metadata !148}
!160 = metadata !{i32 80, i32 0, metadata !136, metadata !148}
!161 = metadata !{i32 82, i32 0, metadata !59, metadata !148}
!162 = metadata !{i32 84, i32 0, metadata !59, metadata !148}
!163 = metadata !{i32 786689, metadata !40, metadata !"nbodies", metadata !5, i32 16777268, metadata !8, i32 0, metadata !164} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!164 = metadata !{i32 136, i32 0, metadata !69, null}
!165 = metadata !{i32 52, i32 0, metadata !40, metadata !164}
!166 = metadata !{i32 786689, metadata !40, metadata !"bodies", metadata !5, i32 33554484, metadata !9, i32 0, metadata !164} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!167 = metadata !{i32 786688, metadata !40, metadata !"e", metadata !5, i32 54, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [e] [line 54]
!168 = metadata !{i32 57, i32 0, metadata !40, metadata !164}
!169 = metadata !{i32 786688, metadata !40, metadata !"i", metadata !5, i32 55, metadata !8, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [i] [line 55]
!170 = metadata !{i32 58, i32 0, metadata !51, metadata !164} ; [ DW_TAG_imported_module ]
!171 = metadata !{i32 60, i32 0, metadata !50, metadata !164}
!172 = metadata !{i32 61, i32 0, metadata !54, metadata !164}
!173 = metadata !{i32 63, i32 0, metadata !53, metadata !164}
!174 = metadata !{i32 64, i32 0, metadata !53, metadata !164}
!175 = metadata !{i32 65, i32 0, metadata !53, metadata !164}
!176 = metadata !{i32 786688, metadata !53, metadata !"dx", metadata !5, i32 63, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [dx] [line 63]
!177 = metadata !{i32 786688, metadata !53, metadata !"dy", metadata !5, i32 64, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [dy] [line 64]
!178 = metadata !{i32 786688, metadata !53, metadata !"dz", metadata !5, i32 65, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [dz] [line 65]
!179 = metadata !{i32 66, i32 0, metadata !53, metadata !164}
!180 = metadata !{i32 786688, metadata !53, metadata !"distance", metadata !5, i32 66, metadata !13, i32 0, metadata !164} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!181 = metadata !{i32 67, i32 0, metadata !53, metadata !164}
!182 = metadata !{i32 1}
!183 = metadata !{i32 137, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !69, i32 137, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/n-body.c]
!185 = metadata !{i32 138, i32 0, metadata !184, null}
!186 = metadata !{i32 58, i32 0, metadata !51, metadata !187} ; [ DW_TAG_imported_module ]
!187 = metadata !{i32 139, i32 0, metadata !69, null}
!188 = metadata !{i32 60, i32 0, metadata !50, metadata !187}
!189 = metadata !{i32 786688, metadata !40, metadata !"e", metadata !5, i32 54, metadata !13, i32 0, metadata !187} ; [ DW_TAG_auto_variable ] [e] [line 54]
!190 = metadata !{i32 61, i32 0, metadata !54, metadata !187}
!191 = metadata !{i32 63, i32 0, metadata !53, metadata !187}
!192 = metadata !{i32 64, i32 0, metadata !53, metadata !187}
!193 = metadata !{i32 65, i32 0, metadata !53, metadata !187}
!194 = metadata !{i32 786688, metadata !53, metadata !"dx", metadata !5, i32 63, metadata !13, i32 0, metadata !187} ; [ DW_TAG_auto_variable ] [dx] [line 63]
!195 = metadata !{i32 786688, metadata !53, metadata !"dy", metadata !5, i32 64, metadata !13, i32 0, metadata !187} ; [ DW_TAG_auto_variable ] [dy] [line 64]
!196 = metadata !{i32 786688, metadata !53, metadata !"dz", metadata !5, i32 65, metadata !13, i32 0, metadata !187} ; [ DW_TAG_auto_variable ] [dz] [line 65]
!197 = metadata !{i32 66, i32 0, metadata !53, metadata !187}
!198 = metadata !{i32 786688, metadata !53, metadata !"distance", metadata !5, i32 66, metadata !13, i32 0, metadata !187} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!199 = metadata !{i32 67, i32 0, metadata !53, metadata !187}
!200 = metadata !{i32 140, i32 0, metadata !69, null}
