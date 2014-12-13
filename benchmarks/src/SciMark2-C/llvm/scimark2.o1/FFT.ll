; ModuleID = 'FFT.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"FFT: Data length is not a power of 2!: %d \00", align 1

; Function Attrs: nounwind uwtable
define double @FFT_num_flops(i32 %N) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !11), !dbg !95
  %1 = sitofp i32 %N to double, !dbg !96
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !12), !dbg !96
  %2 = tail call fastcc i32 @int_log2(i32 %N), !dbg !97
  %3 = sitofp i32 %2 to double, !dbg !97
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !13), !dbg !97
  %4 = fmul double %1, 5.000000e+00, !dbg !98
  %5 = fadd double %4, -2.000000e+00, !dbg !98
  %6 = fmul double %5, %3, !dbg !98
  %7 = fadd double %1, 1.000000e+00, !dbg !98
  %8 = fmul double %7, 2.000000e+00, !dbg !98
  %9 = fadd double %8, %6, !dbg !98
  ret double %9, !dbg !98
}

; Function Attrs: nounwind uwtable
define internal fastcc i32 @int_log2(i32 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !89), !dbg !99
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !90), !dbg !101
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !91), !dbg !103
  %1 = icmp sgt i32 %n, 1, !dbg !104
  br i1 %1, label %.lr.ph, label %._crit_edge, !dbg !104

.lr.ph:                                           ; preds = %0, %.lr.ph
  %log.02 = phi i32 [ %3, %.lr.ph ], [ 0, %0 ]
  %k.01 = phi i32 [ %2, %.lr.ph ], [ 1, %0 ]
  %2 = shl nsw i32 %k.01, 1, !dbg !104
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !90), !dbg !104
  %3 = add nsw i32 %log.02, 1, !dbg !104
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !91), !dbg !104
  %4 = icmp slt i32 %2, %n, !dbg !104
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !104

._crit_edge:                                      ; preds = %.lr.ph, %0
  %log.0.lcssa = phi i32 [ 0, %0 ], [ %3, %.lr.ph ]
  %5 = shl i32 1, %log.0.lcssa, !dbg !106
  %6 = icmp eq i32 %5, %n, !dbg !106
  br i1 %6, label %9, label %7, !dbg !106

; <label>:7                                       ; preds = %._crit_edge
  %8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str, i64 0, i64 0), i32 %n) #4, !dbg !108
  tail call void @exit(i32 1) #5, !dbg !110
  unreachable, !dbg !110

; <label>:9                                       ; preds = %._crit_edge
  ret i32 %log.0.lcssa, !dbg !111
}

; Function Attrs: nounwind uwtable
define void @FFT_bitreverse(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !19), !dbg !112
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !20), !dbg !112
  %1 = sdiv i32 %N, 2, !dbg !113
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !21), !dbg !113
  %2 = add nsw i32 %1, -1, !dbg !114
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !22), !dbg !114
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !23), !dbg !115
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !24), !dbg !116
  %3 = icmp sgt i32 %2, 0, !dbg !117
  br i1 %3, label %.lr.ph7, label %._crit_edge8, !dbg !117

.lr.ph7:                                          ; preds = %0
  %4 = ashr i32 %1, 1, !dbg !118
  %5 = add i32 %1, -1, !dbg !117
  br label %6, !dbg !117

; <label>:6                                       ; preds = %._crit_edge, %.lr.ph7
  %indvars.iv = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next, %._crit_edge ]
  %j.04 = phi i32 [ 0, %.lr.ph7 ], [ %31, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32, !dbg !119
  %8 = shl i32 %7, 1, !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !25), !dbg !119
  %9 = shl i32 %j.04, 1, !dbg !120
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !28), !dbg !120
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !29), !dbg !118
  %10 = trunc i64 %indvars.iv to i32, !dbg !121
  %11 = icmp slt i32 %10, %j.04, !dbg !121
  br i1 %11, label %12, label %.preheader, !dbg !121

; <label>:12                                      ; preds = %6
  %13 = sext i32 %8 to i64, !dbg !122
  %14 = getelementptr inbounds double* %data, i64 %13, !dbg !122
  %15 = load double* %14, align 8, !dbg !122, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !30), !dbg !122
  %16 = or i32 %8, 1, !dbg !127
  %17 = sext i32 %16 to i64, !dbg !127
  %18 = getelementptr inbounds double* %data, i64 %17, !dbg !127
  %19 = load double* %18, align 8, !dbg !127, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !33), !dbg !127
  %20 = sext i32 %9 to i64, !dbg !128
  %21 = getelementptr inbounds double* %data, i64 %20, !dbg !128
  %22 = load double* %21, align 8, !dbg !128, !tbaa !123
  store double %22, double* %14, align 8, !dbg !128, !tbaa !123
  %23 = or i32 %9, 1, !dbg !129
  %24 = sext i32 %23 to i64, !dbg !129
  %25 = getelementptr inbounds double* %data, i64 %24, !dbg !129
  %26 = load double* %25, align 8, !dbg !129, !tbaa !123
  store double %26, double* %18, align 8, !dbg !129, !tbaa !123
  store double %15, double* %21, align 8, !dbg !130, !tbaa !123
  store double %19, double* %25, align 8, !dbg !131, !tbaa !123
  br label %.preheader, !dbg !131

.preheader:                                       ; preds = %12, %6
  %27 = icmp slt i32 %j.04, %4, !dbg !132
  br i1 %27, label %._crit_edge, label %.lr.ph, !dbg !132

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %j.12 = phi i32 [ %28, %.lr.ph ], [ %j.04, %.preheader ]
  %k.01 = phi i32 [ %29, %.lr.ph ], [ %4, %.preheader ]
  %28 = sub nsw i32 %j.12, %k.01, !dbg !133
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !24), !dbg !133
  %29 = ashr i32 %k.01, 1, !dbg !135
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !29), !dbg !135
  %30 = icmp slt i32 %28, %29, !dbg !132
  br i1 %30, label %._crit_edge, label %.lr.ph, !dbg !132

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %j.1.lcssa = phi i32 [ %j.04, %.preheader ], [ %28, %.lr.ph ]
  %k.0.lcssa = phi i32 [ %4, %.preheader ], [ %29, %.lr.ph ]
  %31 = add nsw i32 %j.1.lcssa, %k.0.lcssa, !dbg !136
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !24), !dbg !136
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !117
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !117
  %exitcond = icmp eq i32 %lftr.wideiv, %5, !dbg !117
  br i1 %exitcond, label %._crit_edge8, label %6, !dbg !117

._crit_edge8:                                     ; preds = %._crit_edge, %0
  ret void, !dbg !137
}

; Function Attrs: nounwind uwtable
define void @FFT_transform(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !36), !dbg !138
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !37), !dbg !138
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 -1), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: nounwind uwtable
define internal fastcc void @FFT_transform_internal(i32 %N, double* nocapture %data, i32 %direction) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !49), !dbg !141
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !50), !dbg !141
  tail call void @llvm.dbg.value(metadata !{i32 %direction}, i64 0, metadata !51), !dbg !141
  %1 = sdiv i32 %N, 2, !dbg !142
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !52), !dbg !142
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !53), !dbg !143
  tail call void @llvm.dbg.value(metadata !100, i64 0, metadata !55), !dbg !144
  %2 = and i32 %N, -2, !dbg !145
  %3 = icmp eq i32 %2, 2, !dbg !145
  br i1 %3, label %.loopexit, label %4, !dbg !145

; <label>:4                                       ; preds = %0
  %5 = tail call fastcc i32 @int_log2(i32 %1), !dbg !147
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !54), !dbg !147
  %6 = icmp eq i32 %N, 0, !dbg !148
  br i1 %6, label %.loopexit, label %7, !dbg !148

; <label>:7                                       ; preds = %4
  tail call void @FFT_bitreverse(i32 %N, double* %data), !dbg !150
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !53), !dbg !151
  %8 = icmp sgt i32 %5, 0, !dbg !151
  br i1 %8, label %.lr.ph16, label %.loopexit, !dbg !151

.lr.ph16:                                         ; preds = %7
  %9 = sitofp i32 %direction to double, !dbg !152
  %10 = fmul double %9, 2.000000e+00, !dbg !152
  %11 = fmul double %10, 0x400921FB54442D18, !dbg !152
  %12 = icmp sgt i32 %N, 1, !dbg !153
  %13 = icmp sgt i32 %N, 1, !dbg !154
  br label %14, !dbg !151

; <label>:14                                      ; preds = %._crit_edge12, %.lr.ph16
  %bit.014 = phi i32 [ 0, %.lr.ph16 ], [ %101, %._crit_edge12 ]
  %dual.013 = phi i32 [ 1, %.lr.ph16 ], [ %102, %._crit_edge12 ]
  tail call void @llvm.dbg.value(metadata !155, i64 0, metadata !56), !dbg !156
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !59), !dbg !158
  %15 = sitofp i32 %dual.013 to double, !dbg !152
  %16 = fmul double %15, 2.000000e+00, !dbg !152
  %17 = fdiv double %11, %16, !dbg !152
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !62), !dbg !152
  %18 = tail call double @sin(double %17) #4, !dbg !159
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !63), !dbg !159
  %19 = fmul double %17, 5.000000e-01, !dbg !160
  %20 = tail call double @sin(double %19) #4, !dbg !160
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !64), !dbg !160
  %21 = fmul double %20, 2.000000e+00, !dbg !161
  %22 = fmul double %20, %21, !dbg !161
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !65), !dbg !161
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !60), !dbg !153
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !61), !dbg !153
  br i1 %12, label %.lr.ph, label %.preheader, !dbg !153

.lr.ph:                                           ; preds = %14
  %23 = shl i32 %dual.013, 1, !dbg !153
  %24 = sext i32 %23 to i64
  %25 = zext i32 %dual.013 to i64, !dbg !153
  br label %30, !dbg !153

.preheader:                                       ; preds = %30, %14
  %26 = icmp sgt i32 %dual.013, 1, !dbg !162
  br i1 %26, label %.lr.ph11, label %._crit_edge12, !dbg !162

.lr.ph11:                                         ; preds = %.preheader
  %27 = shl i32 %dual.013, 1, !dbg !162
  %28 = sext i32 %27 to i64
  %29 = zext i32 %dual.013 to i64, !dbg !162
  br label %58, !dbg !162

; <label>:30                                      ; preds = %.lr.ph, %30
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %30 ]
  %31 = trunc i64 %indvars.iv to i32, !dbg !163
  %32 = shl nsw i32 %31, 1, !dbg !163
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !66), !dbg !163
  %33 = add nsw i64 %indvars.iv, %25, !dbg !164
  %34 = trunc i64 %33 to i32, !dbg !164
  %35 = shl nsw i32 %34, 1, !dbg !164
  tail call void @llvm.dbg.value(metadata !{i32 %35}, i64 0, metadata !69), !dbg !164
  %36 = sext i32 %35 to i64, !dbg !165
  %37 = getelementptr inbounds double* %data, i64 %36, !dbg !165
  %38 = load double* %37, align 8, !dbg !165, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !70), !dbg !165
  %39 = or i32 %35, 1, !dbg !166
  %40 = sext i32 %39 to i64, !dbg !166
  %41 = getelementptr inbounds double* %data, i64 %40, !dbg !166
  %42 = load double* %41, align 8, !dbg !166, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !71), !dbg !166
  %43 = sext i32 %32 to i64, !dbg !167
  %44 = getelementptr inbounds double* %data, i64 %43, !dbg !167
  %45 = load double* %44, align 8, !dbg !167, !tbaa !123
  %46 = fsub double %45, %38, !dbg !167
  store double %46, double* %37, align 8, !dbg !167, !tbaa !123
  %47 = or i32 %32, 1, !dbg !168
  %48 = sext i32 %47 to i64, !dbg !168
  %49 = getelementptr inbounds double* %data, i64 %48, !dbg !168
  %50 = load double* %49, align 8, !dbg !168, !tbaa !123
  %51 = fsub double %50, %42, !dbg !168
  store double %51, double* %41, align 8, !dbg !168, !tbaa !123
  %52 = load double* %44, align 8, !dbg !169, !tbaa !123
  %53 = fadd double %38, %52, !dbg !169
  store double %53, double* %44, align 8, !dbg !169, !tbaa !123
  %54 = load double* %49, align 8, !dbg !170, !tbaa !123
  %55 = fadd double %42, %54, !dbg !170
  store double %55, double* %49, align 8, !dbg !170, !tbaa !123
  %indvars.iv.next = add nsw i64 %indvars.iv, %24, !dbg !153
  %56 = trunc i64 %indvars.iv.next to i32, !dbg !153
  %57 = icmp slt i32 %56, %1, !dbg !153
  br i1 %57, label %30, label %.preheader, !dbg !153

; <label>:58                                      ; preds = %._crit_edge, %.lr.ph11
  %indvars.iv19 = phi i64 [ 1, %.lr.ph11 ], [ %indvars.iv.next20, %._crit_edge ]
  %w_real.010 = phi double [ 1.000000e+00, %.lr.ph11 ], [ %62, %._crit_edge ]
  %w_imag.09 = phi double [ 0.000000e+00, %.lr.ph11 ], [ %66, %._crit_edge ]
  %59 = fmul double %18, %w_imag.09, !dbg !171
  %60 = fsub double %w_real.010, %59, !dbg !171
  %61 = fmul double %22, %w_real.010, !dbg !171
  %62 = fsub double %60, %61, !dbg !171
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !72), !dbg !171
  %63 = fmul double %18, %w_real.010, !dbg !172
  %64 = fadd double %w_imag.09, %63, !dbg !172
  %65 = fmul double %22, %w_imag.09, !dbg !172
  %66 = fsub double %64, %65, !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !76), !dbg !172
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !56), !dbg !173
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !59), !dbg !174
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !61), !dbg !154
  br i1 %13, label %.lr.ph7, label %._crit_edge, !dbg !154

.lr.ph7:                                          ; preds = %58, %.lr.ph7
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.lr.ph7 ], [ 0, %58 ]
  %67 = add nsw i64 %indvars.iv17, %indvars.iv19, !dbg !175
  %68 = trunc i64 %67 to i32, !dbg !175
  %69 = shl nsw i32 %68, 1, !dbg !175
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !77), !dbg !175
  %70 = add nsw i64 %67, %29, !dbg !176
  %71 = trunc i64 %70 to i32, !dbg !176
  %72 = shl nsw i32 %71, 1, !dbg !176
  tail call void @llvm.dbg.value(metadata !{i32 %72}, i64 0, metadata !80), !dbg !176
  %73 = sext i32 %72 to i64, !dbg !177
  %74 = getelementptr inbounds double* %data, i64 %73, !dbg !177
  %75 = load double* %74, align 8, !dbg !177, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %75}, i64 0, metadata !81), !dbg !177
  %76 = or i32 %72, 1, !dbg !178
  %77 = sext i32 %76 to i64, !dbg !178
  %78 = getelementptr inbounds double* %data, i64 %77, !dbg !178
  %79 = load double* %78, align 8, !dbg !178, !tbaa !123
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !82), !dbg !178
  %80 = fmul double %62, %75, !dbg !179
  %81 = fmul double %66, %79, !dbg !179
  %82 = fsub double %80, %81, !dbg !179
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !83), !dbg !179
  %83 = fmul double %62, %79, !dbg !180
  %84 = fmul double %66, %75, !dbg !180
  %85 = fadd double %84, %83, !dbg !180
  tail call void @llvm.dbg.value(metadata !{double %85}, i64 0, metadata !84), !dbg !180
  %86 = sext i32 %69 to i64, !dbg !181
  %87 = getelementptr inbounds double* %data, i64 %86, !dbg !181
  %88 = load double* %87, align 8, !dbg !181, !tbaa !123
  %89 = fsub double %88, %82, !dbg !181
  store double %89, double* %74, align 8, !dbg !181, !tbaa !123
  %90 = or i32 %69, 1, !dbg !182
  %91 = sext i32 %90 to i64, !dbg !182
  %92 = getelementptr inbounds double* %data, i64 %91, !dbg !182
  %93 = load double* %92, align 8, !dbg !182, !tbaa !123
  %94 = fsub double %93, %85, !dbg !182
  store double %94, double* %78, align 8, !dbg !182, !tbaa !123
  %95 = load double* %87, align 8, !dbg !183, !tbaa !123
  %96 = fadd double %82, %95, !dbg !183
  store double %96, double* %87, align 8, !dbg !183, !tbaa !123
  %97 = load double* %92, align 8, !dbg !184, !tbaa !123
  %98 = fadd double %85, %97, !dbg !184
  store double %98, double* %92, align 8, !dbg !184, !tbaa !123
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, %28, !dbg !154
  %99 = trunc i64 %indvars.iv.next18 to i32, !dbg !154
  %100 = icmp slt i32 %99, %1, !dbg !154
  br i1 %100, label %.lr.ph7, label %._crit_edge, !dbg !154

._crit_edge:                                      ; preds = %.lr.ph7, %58
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !162
  %lftr.wideiv = trunc i64 %indvars.iv.next20 to i32, !dbg !162
  %exitcond = icmp eq i32 %lftr.wideiv, %dual.013, !dbg !162
  br i1 %exitcond, label %._crit_edge12, label %58, !dbg !162

._crit_edge12:                                    ; preds = %._crit_edge, %.preheader
  %101 = add nsw i32 %bit.014, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %101}, i64 0, metadata !53), !dbg !151
  %102 = shl nsw i32 %dual.013, 1, !dbg !151
  tail call void @llvm.dbg.value(metadata !{i32 %102}, i64 0, metadata !55), !dbg !151
  %exitcond21 = icmp eq i32 %101, %5, !dbg !151
  br i1 %exitcond21, label %.loopexit, label %14, !dbg !151

.loopexit:                                        ; preds = %._crit_edge12, %7, %4, %0
  ret void, !dbg !185
}

; Function Attrs: nounwind uwtable
define void @FFT_inverse(i32 %N, double* nocapture %data) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %N}, i64 0, metadata !40), !dbg !186
  tail call void @llvm.dbg.value(metadata !{double* %data}, i64 0, metadata !41), !dbg !186
  %1 = sdiv i32 %N, 2, !dbg !187
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !42), !dbg !187
  tail call void @llvm.dbg.value(metadata !157, i64 0, metadata !43), !dbg !188
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !44), !dbg !189
  tail call fastcc void @FFT_transform_internal(i32 %N, double* %data, i32 1), !dbg !190
  %2 = sitofp i32 %1 to double, !dbg !191
  %3 = fdiv double 1.000000e+00, %2, !dbg !191
  tail call void @llvm.dbg.value(metadata !{double %3}, i64 0, metadata !43), !dbg !191
  tail call void @llvm.dbg.value(metadata !102, i64 0, metadata !44), !dbg !192
  %4 = icmp sgt i32 %N, 0, !dbg !192
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !192

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %5 = getelementptr inbounds double* %data, i64 %indvars.iv, !dbg !194
  %6 = load double* %5, align 8, !dbg !194, !tbaa !123
  %7 = fmul double %3, %6, !dbg !194
  store double %7, double* %5, align 8, !dbg !194, !tbaa !123
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !192
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !192
  %exitcond = icmp eq i32 %lftr.wideiv, %N, !dbg !192
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !192

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !195
}

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!92, !93}
!llvm.ident = !{!94}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c] [DW_LANG_C99]
!1 = metadata !{metadata !"FFT.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !14, metadata !34, metadata !38, metadata !45, metadata !85}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_num_flops", metadata !"FFT_num_flops", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32)* @FFT_num_flops, null, null, metadata !10, i32 14} ; [ DW_TAG_subprogram ] [line 13] [def] [scope 14] [FFT_num_flops]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12, metadata !13}
!11 = metadata !{i32 786689, metadata !4, metadata !"N", metadata !5, i32 16777229, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 13]
!12 = metadata !{i32 786688, metadata !4, metadata !"Nd", metadata !5, i32 16, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Nd] [line 16]
!13 = metadata !{i32 786688, metadata !4, metadata !"logN", metadata !5, i32 17, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logN] [line 17]
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_bitreverse", metadata !"FFT_bitreverse", metadata !"", i32 105, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_bitreverse, null, null, metadata !18, i32 105} ; [ DW_TAG_subprogram ] [line 105] [def] [FFT_bitreverse]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !9, metadata !17}
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!18 = metadata !{metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !28, metadata !29, metadata !30, metadata !33}
!19 = metadata !{i32 786689, metadata !14, metadata !"N", metadata !5, i32 16777321, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 105]
!20 = metadata !{i32 786689, metadata !14, metadata !"data", metadata !5, i32 33554537, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 105]
!21 = metadata !{i32 786688, metadata !14, metadata !"n", metadata !5, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 107]
!22 = metadata !{i32 786688, metadata !14, metadata !"nm1", metadata !5, i32 108, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nm1] [line 108]
!23 = metadata !{i32 786688, metadata !14, metadata !"i", metadata !5, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 109]
!24 = metadata !{i32 786688, metadata !14, metadata !"j", metadata !5, i32 110, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 110]
!25 = metadata !{i32 786688, metadata !26, metadata !"ii", metadata !5, i32 114, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ii] [line 114]
!26 = metadata !{i32 786443, metadata !1, metadata !27, i32 111, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!27 = metadata !{i32 786443, metadata !1, metadata !14, i32 111, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!28 = metadata !{i32 786688, metadata !26, metadata !"jj", metadata !5, i32 117, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jj] [line 117]
!29 = metadata !{i32 786688, metadata !26, metadata !"k", metadata !5, i32 120, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 120]
!30 = metadata !{i32 786688, metadata !31, metadata !"tmp_real", metadata !5, i32 123, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 123]
!31 = metadata !{i32 786443, metadata !1, metadata !32, i32 122, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!32 = metadata !{i32 786443, metadata !1, metadata !26, i32 122, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!33 = metadata !{i32 786688, metadata !31, metadata !"tmp_imag", metadata !5, i32 124, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 124]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform", metadata !"FFT_transform", metadata !"", i32 143, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_transform, null, null, metadata !35, i32 144} ; [ DW_TAG_subprogram ] [line 143] [def] [scope 144] [FFT_transform]
!35 = metadata !{metadata !36, metadata !37}
!36 = metadata !{i32 786689, metadata !34, metadata !"N", metadata !5, i32 16777359, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 143]
!37 = metadata !{i32 786689, metadata !34, metadata !"data", metadata !5, i32 33554575, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 143]
!38 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_inverse", metadata !"FFT_inverse", metadata !"", i32 149, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*)* @FFT_inverse, null, null, metadata !39, i32 150} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [FFT_inverse]
!39 = metadata !{metadata !40, metadata !41, metadata !42, metadata !43, metadata !44}
!40 = metadata !{i32 786689, metadata !38, metadata !"N", metadata !5, i32 16777365, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 149]
!41 = metadata !{i32 786689, metadata !38, metadata !"data", metadata !5, i32 33554581, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 149]
!42 = metadata !{i32 786688, metadata !38, metadata !"n", metadata !5, i32 151, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 151]
!43 = metadata !{i32 786688, metadata !38, metadata !"norm", metadata !5, i32 152, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [norm] [line 152]
!44 = metadata !{i32 786688, metadata !38, metadata !"i", metadata !5, i32 153, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 153]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"FFT_transform_internal", metadata !"FFT_transform_internal", metadata !"", i32 35, metadata !46, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, i32)* @FFT_transform_internal, null, null, metadata !48, i32 35} ; [ DW_TAG_subprogram ] [line 35] [local] [def] [FFT_transform_internal]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{null, metadata !9, metadata !17, metadata !9}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66, metadata !69, metadata !70, metadata !71, metadata !72, metadata !76, metadata !77, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84}
!49 = metadata !{i32 786689, metadata !45, metadata !"N", metadata !5, i32 16777251, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 35]
!50 = metadata !{i32 786689, metadata !45, metadata !"data", metadata !5, i32 33554467, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 35]
!51 = metadata !{i32 786689, metadata !45, metadata !"direction", metadata !5, i32 50331683, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [direction] [line 35]
!52 = metadata !{i32 786688, metadata !45, metadata !"n", metadata !5, i32 36, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 36]
!53 = metadata !{i32 786688, metadata !45, metadata !"bit", metadata !5, i32 37, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bit] [line 37]
!54 = metadata !{i32 786688, metadata !45, metadata !"logn", metadata !5, i32 38, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [logn] [line 38]
!55 = metadata !{i32 786688, metadata !45, metadata !"dual", metadata !5, i32 39, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dual] [line 39]
!56 = metadata !{i32 786688, metadata !57, metadata !"w_real", metadata !5, i32 53, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_real] [line 53]
!57 = metadata !{i32 786443, metadata !1, metadata !58, i32 52, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!58 = metadata !{i32 786443, metadata !1, metadata !45, i32 52, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!59 = metadata !{i32 786688, metadata !57, metadata !"w_imag", metadata !5, i32 54, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w_imag] [line 54]
!60 = metadata !{i32 786688, metadata !57, metadata !"a", metadata !5, i32 55, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 55]
!61 = metadata !{i32 786688, metadata !57, metadata !"b", metadata !5, i32 56, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 56]
!62 = metadata !{i32 786688, metadata !57, metadata !"theta", metadata !5, i32 58, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 58]
!63 = metadata !{i32 786688, metadata !57, metadata !"s", metadata !5, i32 59, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 59]
!64 = metadata !{i32 786688, metadata !57, metadata !"t", metadata !5, i32 60, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 60]
!65 = metadata !{i32 786688, metadata !57, metadata !"s2", metadata !5, i32 61, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s2] [line 61]
!66 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !5, i32 64, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!67 = metadata !{i32 786443, metadata !1, metadata !68, i32 63, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!68 = metadata !{i32 786443, metadata !1, metadata !57, i32 63, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!69 = metadata !{i32 786688, metadata !67, metadata !"j", metadata !5, i32 65, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 65]
!70 = metadata !{i32 786688, metadata !67, metadata !"wd_real", metadata !5, i32 67, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 67]
!71 = metadata !{i32 786688, metadata !67, metadata !"wd_imag", metadata !5, i32 68, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 68]
!72 = metadata !{i32 786688, metadata !73, metadata !"tmp_real", metadata !5, i32 80, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_real] [line 80]
!73 = metadata !{i32 786443, metadata !1, metadata !74, i32 79, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!74 = metadata !{i32 786443, metadata !1, metadata !75, i32 77, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!75 = metadata !{i32 786443, metadata !1, metadata !57, i32 77, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!76 = metadata !{i32 786688, metadata !73, metadata !"tmp_imag", metadata !5, i32 81, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp_imag] [line 81]
!77 = metadata !{i32 786688, metadata !78, metadata !"i", metadata !5, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!78 = metadata !{i32 786443, metadata !1, metadata !79, i32 85, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!79 = metadata !{i32 786443, metadata !1, metadata !74, i32 85, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!80 = metadata !{i32 786688, metadata !78, metadata !"j", metadata !5, i32 87, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 87]
!81 = metadata !{i32 786688, metadata !78, metadata !"z1_real", metadata !5, i32 89, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_real] [line 89]
!82 = metadata !{i32 786688, metadata !78, metadata !"z1_imag", metadata !5, i32 90, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z1_imag] [line 90]
!83 = metadata !{i32 786688, metadata !78, metadata !"wd_real", metadata !5, i32 92, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_real] [line 92]
!84 = metadata !{i32 786688, metadata !78, metadata !"wd_imag", metadata !5, i32 93, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wd_imag] [line 93]
!85 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"int_log2", metadata !"int_log2", metadata !"", i32 22, metadata !86, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @int_log2, null, null, metadata !88, i32 23} ; [ DW_TAG_subprogram ] [line 22] [local] [def] [scope 23] [int_log2]
!86 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{metadata !9, metadata !9}
!88 = metadata !{metadata !89, metadata !90, metadata !91}
!89 = metadata !{i32 786689, metadata !85, metadata !"n", metadata !5, i32 16777238, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 22]
!90 = metadata !{i32 786688, metadata !85, metadata !"k", metadata !5, i32 24, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 24]
!91 = metadata !{i32 786688, metadata !85, metadata !"log", metadata !5, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log] [line 25]
!92 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!93 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!94 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!95 = metadata !{i32 13, i32 0, metadata !4, null}
!96 = metadata !{i32 16, i32 0, metadata !4, null}
!97 = metadata !{i32 17, i32 0, metadata !4, null}
!98 = metadata !{i32 19, i32 0, metadata !4, null}
!99 = metadata !{i32 22, i32 0, metadata !85, null}
!100 = metadata !{i32 1}
!101 = metadata !{i32 24, i32 0, metadata !85, null}
!102 = metadata !{i32 0}
!103 = metadata !{i32 25, i32 0, metadata !85, null}
!104 = metadata !{i32 26, i32 0, metadata !105, null}
!105 = metadata !{i32 786443, metadata !1, metadata !85, i32 26, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!106 = metadata !{i32 27, i32 0, metadata !107, null}
!107 = metadata !{i32 786443, metadata !1, metadata !85, i32 27, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!108 = metadata !{i32 29, i32 0, metadata !109, null}
!109 = metadata !{i32 786443, metadata !1, metadata !107, i32 28, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!110 = metadata !{i32 30, i32 0, metadata !109, null}
!111 = metadata !{i32 32, i32 0, metadata !85, null}
!112 = metadata !{i32 105, i32 0, metadata !14, null}
!113 = metadata !{i32 107, i32 0, metadata !14, null}
!114 = metadata !{i32 108, i32 0, metadata !14, null}
!115 = metadata !{i32 109, i32 0, metadata !14, null}
!116 = metadata !{i32 110, i32 0, metadata !14, null}
!117 = metadata !{i32 111, i32 0, metadata !27, null}
!118 = metadata !{i32 120, i32 0, metadata !26, null}
!119 = metadata !{i32 114, i32 0, metadata !26, null}
!120 = metadata !{i32 117, i32 0, metadata !26, null}
!121 = metadata !{i32 122, i32 0, metadata !32, null}
!122 = metadata !{i32 123, i32 0, metadata !31, null}
!123 = metadata !{metadata !124, metadata !124, i64 0}
!124 = metadata !{metadata !"double", metadata !125, i64 0}
!125 = metadata !{metadata !"omnipotent char", metadata !126, i64 0}
!126 = metadata !{metadata !"Simple C/C++ TBAA"}
!127 = metadata !{i32 124, i32 0, metadata !31, null}
!128 = metadata !{i32 125, i32 0, metadata !31, null}
!129 = metadata !{i32 126, i32 0, metadata !31, null}
!130 = metadata !{i32 127, i32 0, metadata !31, null}
!131 = metadata !{i32 128, i32 0, metadata !31, null}
!132 = metadata !{i32 130, i32 0, metadata !26, null}
!133 = metadata !{i32 133, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !26, i32 131, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!135 = metadata !{i32 136, i32 0, metadata !134, null}
!136 = metadata !{i32 138, i32 0, metadata !26, null}
!137 = metadata !{i32 140, i32 0, metadata !14, null}
!138 = metadata !{i32 143, i32 0, metadata !34, null}
!139 = metadata !{i32 145, i32 0, metadata !34, null}
!140 = metadata !{i32 146, i32 0, metadata !34, null}
!141 = metadata !{i32 35, i32 0, metadata !45, null}
!142 = metadata !{i32 36, i32 0, metadata !45, null}
!143 = metadata !{i32 37, i32 0, metadata !45, null}
!144 = metadata !{i32 39, i32 0, metadata !45, null}
!145 = metadata !{i32 41, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !45, i32 41, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!147 = metadata !{i32 42, i32 0, metadata !45, null}
!148 = metadata !{i32 45, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !45, i32 45, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!150 = metadata !{i32 48, i32 0, metadata !45, null}
!151 = metadata !{i32 52, i32 0, metadata !58, null}
!152 = metadata !{i32 58, i32 0, metadata !57, null} ; [ DW_TAG_imported_module ]
!153 = metadata !{i32 63, i32 0, metadata !68, null}
!154 = metadata !{i32 85, i32 0, metadata !79, null}
!155 = metadata !{double 1.000000e+00}
!156 = metadata !{i32 53, i32 0, metadata !57, null}
!157 = metadata !{double 0.000000e+00}
!158 = metadata !{i32 54, i32 0, metadata !57, null}
!159 = metadata !{i32 59, i32 0, metadata !57, null}
!160 = metadata !{i32 60, i32 0, metadata !57, null}
!161 = metadata !{i32 61, i32 0, metadata !57, null}
!162 = metadata !{i32 77, i32 0, metadata !75, null}
!163 = metadata !{i32 64, i32 0, metadata !67, null}
!164 = metadata !{i32 65, i32 0, metadata !67, null}
!165 = metadata !{i32 67, i32 0, metadata !67, null}
!166 = metadata !{i32 68, i32 0, metadata !67, null}
!167 = metadata !{i32 70, i32 0, metadata !67, null}
!168 = metadata !{i32 71, i32 0, metadata !67, null}
!169 = metadata !{i32 72, i32 0, metadata !67, null}
!170 = metadata !{i32 73, i32 0, metadata !67, null}
!171 = metadata !{i32 80, i32 0, metadata !73, null}
!172 = metadata !{i32 81, i32 0, metadata !73, null}
!173 = metadata !{i32 82, i32 0, metadata !73, null}
!174 = metadata !{i32 83, i32 0, metadata !73, null}
!175 = metadata !{i32 86, i32 0, metadata !78, null}
!176 = metadata !{i32 87, i32 0, metadata !78, null}
!177 = metadata !{i32 89, i32 0, metadata !78, null}
!178 = metadata !{i32 90, i32 0, metadata !78, null}
!179 = metadata !{i32 92, i32 0, metadata !78, null}
!180 = metadata !{i32 93, i32 0, metadata !78, null}
!181 = metadata !{i32 95, i32 0, metadata !78, null}
!182 = metadata !{i32 96, i32 0, metadata !78, null}
!183 = metadata !{i32 97, i32 0, metadata !78, null}
!184 = metadata !{i32 98, i32 0, metadata !78, null}
!185 = metadata !{i32 102, i32 0, metadata !45, null}
!186 = metadata !{i32 149, i32 0, metadata !38, null}
!187 = metadata !{i32 151, i32 0, metadata !38, null}
!188 = metadata !{i32 152, i32 0, metadata !38, null}
!189 = metadata !{i32 153, i32 0, metadata !38, null}
!190 = metadata !{i32 154, i32 0, metadata !38, null}
!191 = metadata !{i32 159, i32 0, metadata !38, null}
!192 = metadata !{i32 160, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !38, i32 160, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/SciMark2-C/FFT.c]
!194 = metadata !{i32 161, i32 0, metadata !193, null}
!195 = metadata !{i32 163, i32 0, metadata !38, null}
