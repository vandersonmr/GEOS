; ModuleID = 'n-body.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @advance(i32 %nbodies, %struct.planet* nocapture %bodies, double %dt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !21, metadata !93), !dbg !94
  tail call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !22, metadata !93), !dbg !95
  tail call void @llvm.dbg.value(metadata double %dt, i64 0, metadata !23, metadata !93), !dbg !96
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !93), !dbg !97
  %cmp123 = icmp sgt i32 %nbodies, 0, !dbg !98
  br i1 %cmp123, label %for.body.lr.ph, label %for.end66, !dbg !99

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %nbodies, -1, !dbg !99
  %1 = sext i32 %nbodies to i64, !dbg !99
  br label %for.body, !dbg !99

for.cond.loopexit.loopexit:                       ; preds = %for.body3
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.body
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1, !dbg !99
  %lftr.wideiv134 = trunc i64 %indvars.iv132 to i32, !dbg !99
  %exitcond135 = icmp eq i32 %lftr.wideiv134, %0, !dbg !99
  br i1 %exitcond135, label %for.cond46.preheader, label %for.body, !dbg !99

for.cond46.preheader:                             ; preds = %for.cond.loopexit
  br i1 %cmp123, label %for.body48.lr.ph, label %for.end66, !dbg !100

for.body48.lr.ph:                                 ; preds = %for.cond46.preheader
  %2 = add i32 %nbodies, -1, !dbg !100
  %3 = insertelement <2 x double> undef, double %dt, i32 0, !dbg !101
  %4 = insertelement <2 x double> %3, double %dt, i32 1, !dbg !101
  br label %for.body48, !dbg !100

for.body:                                         ; preds = %for.cond.loopexit, %for.body.lr.ph
  %indvars.iv132 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next133, %for.cond.loopexit ]
  %indvars.iv125 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next126, %for.cond.loopexit ]
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1, !dbg !99
  %cmp2121 = icmp slt i64 %indvars.iv.next133, %1, !dbg !102
  br i1 %cmp2121, label %for.body3.lr.ph, label %for.cond.loopexit, !dbg !103

for.body3.lr.ph:                                  ; preds = %for.body
  %x = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 0, !dbg !104
  %y = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 1, !dbg !105
  %z = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 2, !dbg !106
  %vx = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 3, !dbg !107
  %vy = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 4, !dbg !108
  %vz = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 5, !dbg !109
  %mass28 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv132, i32 6, !dbg !110
  br label %for.body3, !dbg !103

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv127 = phi i64 [ %indvars.iv125, %for.body3.lr.ph ], [ %indvars.iv.next128, %for.body3 ]
  %5 = load double* %x, align 8, !dbg !104, !tbaa !111
  %x6 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 0, !dbg !116
  %6 = load double* %x6, align 8, !dbg !116, !tbaa !111
  %sub = fsub double %5, %6, !dbg !104
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !34, metadata !93), !dbg !117
  %7 = load double* %y, align 8, !dbg !105, !tbaa !118
  %y7 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 1, !dbg !119
  %8 = load double* %y7, align 8, !dbg !119, !tbaa !118
  %sub8 = fsub double %7, %8, !dbg !105
  tail call void @llvm.dbg.value(metadata double %sub8, i64 0, metadata !35, metadata !93), !dbg !120
  %9 = load double* %z, align 8, !dbg !106, !tbaa !121
  %z9 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 2, !dbg !122
  %10 = load double* %z9, align 8, !dbg !122, !tbaa !121
  %sub10 = fsub double %9, %10, !dbg !106
  tail call void @llvm.dbg.value(metadata double %sub10, i64 0, metadata !36, metadata !93), !dbg !123
  %mul = fmul double %sub, %sub, !dbg !124
  %mul11 = fmul double %sub8, %sub8, !dbg !125
  %add12 = fadd double %mul, %mul11, !dbg !124
  %mul13 = fmul double %sub10, %sub10, !dbg !126
  %add14 = fadd double %add12, %mul13, !dbg !124
  %call = tail call double @sqrt(double %add14) #3, !dbg !127
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !37, metadata !93), !dbg !128
  %mul15 = fmul double %call, %call, !dbg !129
  %mul16 = fmul double %call, %mul15, !dbg !129
  %div = fdiv double %dt, %mul16, !dbg !130
  tail call void @llvm.dbg.value(metadata double %div, i64 0, metadata !38, metadata !93), !dbg !131
  %mass = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 6, !dbg !132
  %11 = load double* %mass, align 8, !dbg !132, !tbaa !133
  %mul17 = fmul double %sub, %11, !dbg !134
  %mul18 = fmul double %div, %mul17, !dbg !134
  %12 = load double* %vx, align 8, !dbg !107, !tbaa !135
  %sub19 = fsub double %12, %mul18, !dbg !107
  store double %sub19, double* %vx, align 8, !dbg !107, !tbaa !135
  %13 = load double* %mass, align 8, !dbg !136, !tbaa !133
  %mul21 = fmul double %sub8, %13, !dbg !137
  %mul22 = fmul double %div, %mul21, !dbg !137
  %14 = load double* %vy, align 8, !dbg !108, !tbaa !138
  %sub23 = fsub double %14, %mul22, !dbg !108
  store double %sub23, double* %vy, align 8, !dbg !108, !tbaa !138
  %15 = load double* %mass, align 8, !dbg !139, !tbaa !133
  %mul25 = fmul double %sub10, %15, !dbg !140
  %mul26 = fmul double %div, %mul25, !dbg !140
  %16 = load double* %vz, align 8, !dbg !109, !tbaa !141
  %sub27 = fsub double %16, %mul26, !dbg !109
  store double %sub27, double* %vz, align 8, !dbg !109, !tbaa !141
  %17 = load double* %mass28, align 8, !dbg !110, !tbaa !133
  %mul29 = fmul double %sub, %17, !dbg !142
  %mul30 = fmul double %div, %mul29, !dbg !142
  %vx31 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 3, !dbg !143
  %18 = load double* %vx31, align 8, !dbg !143, !tbaa !135
  %add32 = fadd double %18, %mul30, !dbg !143
  store double %add32, double* %vx31, align 8, !dbg !143, !tbaa !135
  %19 = load double* %mass28, align 8, !dbg !144, !tbaa !133
  %mul34 = fmul double %sub8, %19, !dbg !145
  %mul35 = fmul double %div, %mul34, !dbg !145
  %vy36 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 4, !dbg !146
  %20 = load double* %vy36, align 8, !dbg !146, !tbaa !138
  %add37 = fadd double %20, %mul35, !dbg !146
  store double %add37, double* %vy36, align 8, !dbg !146, !tbaa !138
  %21 = load double* %mass28, align 8, !dbg !147, !tbaa !133
  %mul39 = fmul double %sub10, %21, !dbg !148
  %mul40 = fmul double %div, %mul39, !dbg !148
  %vz41 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 5, !dbg !149
  %22 = load double* %vz41, align 8, !dbg !149, !tbaa !141
  %add42 = fadd double %22, %mul40, !dbg !149
  store double %add42, double* %vz41, align 8, !dbg !149, !tbaa !141
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1, !dbg !103
  %lftr.wideiv130 = trunc i64 %indvars.iv127 to i32, !dbg !103
  %exitcond131 = icmp eq i32 %lftr.wideiv130, %0, !dbg !103
  br i1 %exitcond131, label %for.cond.loopexit.loopexit, label %for.body3, !dbg !103

for.body48:                                       ; preds = %for.body48, %for.body48.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body48.lr.ph ], [ %indvars.iv.next, %for.body48 ]
  %vx52 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !150
  %x54 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 0, !dbg !151
  %23 = bitcast double* %vx52 to <2 x double>*, !dbg !150
  %24 = load <2 x double>* %23, align 8, !dbg !150, !tbaa !152
  %25 = fmul <2 x double> %4, %24, !dbg !101
  %26 = bitcast double* %x54 to <2 x double>*, !dbg !151
  %27 = load <2 x double>* %26, align 8, !dbg !151, !tbaa !152
  %28 = fadd <2 x double> %27, %25, !dbg !151
  %29 = bitcast double* %x54 to <2 x double>*, !dbg !151
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !151, !tbaa !152
  %vz60 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !153
  %30 = load double* %vz60, align 8, !dbg !153, !tbaa !141
  %mul61 = fmul double %30, %dt, !dbg !154
  %z62 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 2, !dbg !155
  %31 = load double* %z62, align 8, !dbg !155, !tbaa !121
  %add63 = fadd double %31, %mul61, !dbg !155
  store double %add63, double* %z62, align 8, !dbg !155, !tbaa !121
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !100
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !100
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !100
  br i1 %exitcond, label %for.end66.loopexit, label %for.body48, !dbg !100

for.end66.loopexit:                               ; preds = %for.body48
  br label %for.end66

for.end66:                                        ; preds = %for.end66.loopexit, %entry, %for.cond46.preheader
  ret void, !dbg !156
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* nocapture readonly %bodies) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !47, metadata !93), !dbg !157
  tail call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !48, metadata !93), !dbg !158
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !49, metadata !93), !dbg !159
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !50, metadata !93), !dbg !160
  %cmp61 = icmp sgt i32 %nbodies, 0, !dbg !161
  br i1 %cmp61, label %for.body.lr.ph, label %for.end32, !dbg !162

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %nbodies, -1, !dbg !162
  %1 = sext i32 %nbodies to i64, !dbg !162
  br label %for.body, !dbg !162

for.cond.loopexit.loopexit:                       ; preds = %for.body13
  %sub29.lcssa = phi double [ %sub29, %for.body13 ]
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.body
  %e.1.lcssa = phi double [ %add9, %for.body ], [ %sub29.lcssa, %for.cond.loopexit.loopexit ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !162
  %lftr.wideiv70 = trunc i64 %indvars.iv68 to i32, !dbg !162
  %exitcond71 = icmp eq i32 %lftr.wideiv70, %0, !dbg !162
  br i1 %exitcond71, label %for.end32.loopexit, label %for.body, !dbg !162

for.body:                                         ; preds = %for.cond.loopexit, %for.body.lr.ph
  %indvars.iv68 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next69, %for.cond.loopexit ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.cond.loopexit ]
  %e.063 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %e.1.lcssa, %for.cond.loopexit ]
  %mass = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 6, !dbg !163
  %2 = load double* %mass, align 8, !dbg !163, !tbaa !133
  %mul = fmul double %2, 5.000000e-01, !dbg !164
  %vx = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 3, !dbg !165
  %3 = load double* %vx, align 8, !dbg !165, !tbaa !135
  %mul2 = fmul double %3, %3, !dbg !165
  %vy = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 4, !dbg !166
  %4 = load double* %vy, align 8, !dbg !166, !tbaa !138
  %mul4 = fmul double %4, %4, !dbg !166
  %add = fadd double %mul2, %mul4, !dbg !165
  %vz = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 5, !dbg !167
  %5 = load double* %vz, align 8, !dbg !167, !tbaa !141
  %mul6 = fmul double %5, %5, !dbg !167
  %add7 = fadd double %add, %mul6, !dbg !165
  %mul8 = fmul double %mul, %add7, !dbg !164
  %add9 = fadd double %e.063, %mul8, !dbg !168
  tail call void @llvm.dbg.value(metadata double %add9, i64 0, metadata !49, metadata !93), !dbg !159
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !dbg !162
  %cmp1258 = icmp slt i64 %indvars.iv.next69, %1, !dbg !169
  br i1 %cmp1258, label %for.body13.lr.ph, label %for.cond.loopexit, !dbg !170

for.body13.lr.ph:                                 ; preds = %for.body
  %x = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 0, !dbg !171
  %y = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 1, !dbg !172
  %z = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 2, !dbg !173
  br label %for.body13, !dbg !170

for.body13:                                       ; preds = %for.body13, %for.body13.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv, %for.body13.lr.ph ], [ %indvars.iv.next66, %for.body13 ]
  %e.160 = phi double [ %add9, %for.body13.lr.ph ], [ %sub29, %for.body13 ]
  %6 = load double* %x, align 8, !dbg !171, !tbaa !111
  %x16 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 0, !dbg !174
  %7 = load double* %x16, align 8, !dbg !174, !tbaa !111
  %sub = fsub double %6, %7, !dbg !171
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !60, metadata !93), !dbg !175
  %8 = load double* %y, align 8, !dbg !172, !tbaa !118
  %y17 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 1, !dbg !176
  %9 = load double* %y17, align 8, !dbg !176, !tbaa !118
  %sub18 = fsub double %8, %9, !dbg !172
  tail call void @llvm.dbg.value(metadata double %sub18, i64 0, metadata !61, metadata !93), !dbg !177
  %10 = load double* %z, align 8, !dbg !173, !tbaa !121
  %z19 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 2, !dbg !178
  %11 = load double* %z19, align 8, !dbg !178, !tbaa !121
  %sub20 = fsub double %10, %11, !dbg !173
  tail call void @llvm.dbg.value(metadata double %sub20, i64 0, metadata !62, metadata !93), !dbg !179
  %mul21 = fmul double %sub, %sub, !dbg !180
  %mul22 = fmul double %sub18, %sub18, !dbg !181
  %add23 = fadd double %mul21, %mul22, !dbg !180
  %mul24 = fmul double %sub20, %sub20, !dbg !182
  %add25 = fadd double %add23, %mul24, !dbg !180
  %call = tail call double @sqrt(double %add25) #3, !dbg !183
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !63, metadata !93), !dbg !184
  %12 = load double* %mass, align 8, !dbg !185, !tbaa !133
  %mass27 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 6, !dbg !186
  %13 = load double* %mass27, align 8, !dbg !186, !tbaa !133
  %mul28 = fmul double %12, %13, !dbg !185
  %div = fdiv double %mul28, %call, !dbg !187
  %sub29 = fsub double %e.160, %div, !dbg !188
  tail call void @llvm.dbg.value(metadata double %sub29, i64 0, metadata !49, metadata !93), !dbg !159
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1, !dbg !170
  %lftr.wideiv = trunc i64 %indvars.iv65 to i32, !dbg !170
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !170
  br i1 %exitcond, label %for.cond.loopexit.loopexit, label %for.body13, !dbg !170

for.end32.loopexit:                               ; preds = %for.cond.loopexit
  %e.1.lcssa.lcssa = phi double [ %e.1.lcssa, %for.cond.loopexit ]
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  %e.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %e.1.lcssa.lcssa, %for.end32.loopexit ]
  ret double %e.0.lcssa, !dbg !189
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* nocapture %bodies) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !68, metadata !93), !dbg !190
  tail call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !69, metadata !93), !dbg !191
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !70, metadata !93), !dbg !192
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !71, metadata !93), !dbg !193
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !72, metadata !93), !dbg !194
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !73, metadata !93), !dbg !195
  %cmp45 = icmp sgt i32 %nbodies, 0, !dbg !196
  br i1 %cmp45, label %for.body.lr.ph, label %for.end, !dbg !199

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %nbodies, -1, !dbg !199
  %xtraiter = and i32 %nbodies, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %nbodies, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body.prol, label %for.body.lr.ph.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv.prol = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %pz.048.prol = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add16.prol, %for.body.prol ]
  %1 = phi <2 x double> [ zeroinitializer, %for.body.lr.ph ], [ %8, %for.body.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.body.lr.ph ], [ %prol.iter.sub, %for.body.prol ]
  %vx.prol = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.prol, i32 3, !dbg !200
  %mass.prol = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.prol, i32 6, !dbg !202
  %2 = load double* %mass.prol, align 8, !dbg !202, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !70, metadata !93), !dbg !192
  %3 = bitcast double* %vx.prol to <2 x double>*, !dbg !200
  %4 = load <2 x double>* %3, align 8, !dbg !200, !tbaa !152
  %5 = insertelement <2 x double> undef, double %2, i32 0, !dbg !200
  %6 = insertelement <2 x double> %5, double %2, i32 1, !dbg !200
  %7 = fmul <2 x double> %4, %6, !dbg !200
  %8 = fadd <2 x double> %1, %7, !dbg !203
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !71, metadata !93), !dbg !193
  %vz.prol = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.prol, i32 5, !dbg !204
  %9 = load double* %vz.prol, align 8, !dbg !204, !tbaa !141
  %mul15.prol = fmul double %2, %9, !dbg !204
  %add16.prol = fadd double %pz.048.prol, %mul15.prol, !dbg !205
  tail call void @llvm.dbg.value(metadata double %add16.prol, i64 0, metadata !72, metadata !93), !dbg !194
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !199
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !199
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %0, !dbg !199
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !199
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !199
  br i1 %prol.iter.cmp, label %for.body.prol, label %for.body.lr.ph.split, !llvm.loop !206

for.body.lr.ph.split:                             ; preds = %for.body.prol, %for.body.lr.ph
  %add16.lcssa.unr = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add16.prol, %for.body.prol ]
  %.lcssa.unr = phi <2 x double> [ zeroinitializer, %for.body.lr.ph ], [ %8, %for.body.prol ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %pz.048.unr = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add16.prol, %for.body.prol ]
  %.unr = phi <2 x double> [ zeroinitializer, %for.body.lr.ph ], [ %8, %for.body.prol ]
  %10 = icmp ult i32 %nbodies, 2
  br i1 %10, label %for.end.loopexit, label %for.body.lr.ph.split.split

for.body.lr.ph.split.split:                       ; preds = %for.body.lr.ph.split
  br label %for.body, !dbg !199

for.body:                                         ; preds = %for.body, %for.body.lr.ph.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.split.split ], [ %indvars.iv.next.1, %for.body ]
  %pz.048 = phi double [ %pz.048.unr, %for.body.lr.ph.split.split ], [ %add16.1, %for.body ]
  %11 = phi <2 x double> [ %.unr, %for.body.lr.ph.split.split ], [ %26, %for.body ]
  %vx = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !200
  %mass = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 6, !dbg !202
  %12 = load double* %mass, align 8, !dbg !202, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !70, metadata !93), !dbg !192
  %13 = bitcast double* %vx to <2 x double>*, !dbg !200
  %14 = load <2 x double>* %13, align 8, !dbg !200, !tbaa !152
  %15 = insertelement <2 x double> undef, double %12, i32 0, !dbg !200
  %16 = insertelement <2 x double> %15, double %12, i32 1, !dbg !200
  %17 = fmul <2 x double> %14, %16, !dbg !200
  %18 = fadd <2 x double> %11, %17, !dbg !203
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !71, metadata !93), !dbg !193
  %vz = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !204
  %19 = load double* %vz, align 8, !dbg !204, !tbaa !141
  %mul15 = fmul double %12, %19, !dbg !204
  %add16 = fadd double %pz.048, %mul15, !dbg !205
  tail call void @llvm.dbg.value(metadata double %add16, i64 0, metadata !72, metadata !93), !dbg !194
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !199
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !199
  %vx.1 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.next, i32 3, !dbg !200
  %mass.1 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.next, i32 6, !dbg !202
  %20 = load double* %mass.1, align 8, !dbg !202, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !70, metadata !93), !dbg !192
  %21 = bitcast double* %vx.1 to <2 x double>*, !dbg !200
  %22 = load <2 x double>* %21, align 8, !dbg !200, !tbaa !152
  %23 = insertelement <2 x double> undef, double %20, i32 0, !dbg !200
  %24 = insertelement <2 x double> %23, double %20, i32 1, !dbg !200
  %25 = fmul <2 x double> %22, %24, !dbg !200
  %26 = fadd <2 x double> %18, %25, !dbg !203
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !71, metadata !93), !dbg !193
  %vz.1 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv.next, i32 5, !dbg !204
  %27 = load double* %vz.1, align 8, !dbg !204, !tbaa !141
  %mul15.1 = fmul double %20, %27, !dbg !204
  %add16.1 = fadd double %add16, %mul15.1, !dbg !205
  tail call void @llvm.dbg.value(metadata double %add16, i64 0, metadata !72, metadata !93), !dbg !194
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !199
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !199
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !199
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !199

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %add16.lcssa.ph = phi double [ %add16.1, %for.body ]
  %.lcssa.ph = phi <2 x double> [ %26, %for.body ]
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.lr.ph.split, %for.end.loopexit.unr-lcssa
  %add16.lcssa = phi double [ %add16.lcssa.unr, %for.body.lr.ph.split ], [ %add16.lcssa.ph, %for.end.loopexit.unr-lcssa ]
  %.lcssa = phi <2 x double> [ %.lcssa.unr, %for.body.lr.ph.split ], [ %.lcssa.ph, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %pz.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add16.lcssa, %for.end.loopexit ]
  %28 = phi <2 x double> [ zeroinitializer, %entry ], [ %.lcssa, %for.end.loopexit ]
  %vx18 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 3, !dbg !208
  %29 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %28, !dbg !209
  %30 = fdiv <2 x double> %29, <double 0x4043BD3CC9BE45DE, double 0x4043BD3CC9BE45DE>, !dbg !209
  %31 = bitcast double* %vx18 to <2 x double>*, !dbg !208
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !208, !tbaa !152
  %sub23 = fsub double -0.000000e+00, %pz.0.lcssa, !dbg !210
  %div24 = fdiv double %sub23, 0x4043BD3CC9BE45DE, !dbg !210
  %vz26 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 5, !dbg !211
  store double %div24, double* %vz26, align 8, !dbg !211, !tbaa !141
  ret void, !dbg !212
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !81, metadata !93), !dbg !213
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !82, metadata !93), !dbg !214
  tail call void @llvm.dbg.value(metadata i32 5000000, i64 0, metadata !83, metadata !93), !dbg !215
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !216, metadata !93), !dbg !218
  tail call void @llvm.dbg.value(metadata %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0), i64 0, metadata !219, metadata !93), !dbg !220
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !221, metadata !93), !dbg !222
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !223, metadata !93), !dbg !224
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !225, metadata !93), !dbg !226
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !227, metadata !93), !dbg !228
  %0 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 6), align 16, !dbg !229, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !221, metadata !93), !dbg !222
  %1 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 3) to <2 x double>*), align 8, !dbg !230, !tbaa !152
  %2 = insertelement <2 x double> undef, double %0, i32 0, !dbg !230
  %3 = insertelement <2 x double> %2, double %0, i32 1, !dbg !230
  %4 = fmul <2 x double> %1, %3, !dbg !230
  %5 = fadd <2 x double> %4, zeroinitializer, !dbg !231
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !223, metadata !93), !dbg !224
  %6 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 5), align 8, !dbg !232, !tbaa !141
  %mul15.i = fmul double %0, %6, !dbg !232
  %add16.i = fadd double %mul15.i, 0.000000e+00, !dbg !233
  tail call void @llvm.dbg.value(metadata double %add16.i, i64 0, metadata !225, metadata !93), !dbg !226
  %7 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 6), align 8, !dbg !229, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !221, metadata !93), !dbg !222
  %8 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 3) to <2 x double>*), align 8, !dbg !230, !tbaa !152
  %9 = insertelement <2 x double> undef, double %7, i32 0, !dbg !230
  %10 = insertelement <2 x double> %9, double %7, i32 1, !dbg !230
  %11 = fmul <2 x double> %8, %10, !dbg !230
  %12 = fadd <2 x double> %5, %11, !dbg !231
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !223, metadata !93), !dbg !224
  %13 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 1, i32 5), align 8, !dbg !232, !tbaa !141
  %mul15.i.1 = fmul double %7, %13, !dbg !232
  %add16.i.1 = fadd double %add16.i, %mul15.i.1, !dbg !233
  tail call void @llvm.dbg.value(metadata double %add16.i, i64 0, metadata !225, metadata !93), !dbg !226
  %14 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 6), align 16, !dbg !229, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !221, metadata !93), !dbg !222
  %15 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 3) to <2 x double>*), align 8, !dbg !230, !tbaa !152
  %16 = insertelement <2 x double> undef, double %14, i32 0, !dbg !230
  %17 = insertelement <2 x double> %16, double %14, i32 1, !dbg !230
  %18 = fmul <2 x double> %15, %17, !dbg !230
  %19 = fadd <2 x double> %12, %18, !dbg !231
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !223, metadata !93), !dbg !224
  %20 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 2, i32 5), align 8, !dbg !232, !tbaa !141
  %mul15.i.2 = fmul double %14, %20, !dbg !232
  %add16.i.2 = fadd double %add16.i.1, %mul15.i.2, !dbg !233
  tail call void @llvm.dbg.value(metadata double %add16.i, i64 0, metadata !225, metadata !93), !dbg !226
  %21 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 6), align 8, !dbg !229, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !221, metadata !93), !dbg !222
  %22 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 3) to <2 x double>*), align 8, !dbg !230, !tbaa !152
  %23 = insertelement <2 x double> undef, double %21, i32 0, !dbg !230
  %24 = insertelement <2 x double> %23, double %21, i32 1, !dbg !230
  %25 = fmul <2 x double> %22, %24, !dbg !230
  %26 = fadd <2 x double> %19, %25, !dbg !231
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !223, metadata !93), !dbg !224
  %27 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 3, i32 5), align 8, !dbg !232, !tbaa !141
  %mul15.i.3 = fmul double %21, %27, !dbg !232
  %add16.i.3 = fadd double %add16.i.2, %mul15.i.3, !dbg !233
  tail call void @llvm.dbg.value(metadata double %add16.i, i64 0, metadata !225, metadata !93), !dbg !226
  %28 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 6), align 16, !dbg !229, !tbaa !133
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !221, metadata !93), !dbg !222
  %29 = load <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 3) to <2 x double>*), align 8, !dbg !230, !tbaa !152
  %30 = insertelement <2 x double> undef, double %28, i32 0, !dbg !230
  %31 = insertelement <2 x double> %30, double %28, i32 1, !dbg !230
  %32 = fmul <2 x double> %29, %31, !dbg !230
  %33 = fadd <2 x double> %26, %32, !dbg !231
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !223, metadata !93), !dbg !224
  %34 = load double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 4, i32 5), align 8, !dbg !232, !tbaa !141
  %mul15.i.4 = fmul double %28, %34, !dbg !232
  %add16.i.4 = fadd double %add16.i.3, %mul15.i.4, !dbg !233
  tail call void @llvm.dbg.value(metadata double %add16.i, i64 0, metadata !225, metadata !93), !dbg !226
  %35 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %33, !dbg !234
  %36 = fdiv <2 x double> %35, <double 0x4043BD3CC9BE45DE, double 0x4043BD3CC9BE45DE>, !dbg !234
  store <2 x double> %36, <2 x double>* bitcast (double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 3) to <2 x double>*), align 8, !dbg !235, !tbaa !152
  %sub23.i = fsub double -0.000000e+00, %add16.i.4, !dbg !236
  %div24.i = fdiv double %sub23.i, 0x4043BD3CC9BE45DE, !dbg !236
  store double %div24.i, double* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0, i32 5), align 8, !dbg !237, !tbaa !141
  %call = tail call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)), !dbg !238
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call) #3, !dbg !239
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !84, metadata !93), !dbg !240
  br label %for.body, !dbg !241

for.body:                                         ; preds = %for.body, %entry
  %i.05 = phi i32 [ 1, %entry ], [ %inc, %for.body ]
  tail call void @advance(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0), double 1.000000e-02), !dbg !243
  %inc = add nuw nsw i32 %i.05, 1, !dbg !245
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !84, metadata !93), !dbg !240
  %exitcond = icmp eq i32 %inc, 5000001, !dbg !241
  br i1 %exitcond, label %for.end, label %for.body, !dbg !241

for.end:                                          ; preds = %for.body
  %call2 = tail call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)), !dbg !246
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call2) #3, !dbg !247
  ret i32 0, !dbg !248
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!90, !91}
!llvm.ident = !{!92}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !85, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c] [DW_LANG_C99]
!1 = !{!"n-body.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !43, !64, !74}
!4 = !{!"0x2e\00advance\00advance\00\0023\000\001\000\000\00256\001\0024", !1, !5, !6, null, void (i32, %struct.planet*, double)* @advance, null, null, !20} ; [ DW_TAG_subprogram ] [line 23] [def] [scope 24] [advance]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{null, !8, !9, !13}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from planet]
!10 = !{!"0x13\00planet\0017\00448\0064\000\000\000", !1, null, null, !11, null, null, null} ; [ DW_TAG_structure_type ] [planet] [line 17, size 448, align 64, offset 0] [def] [from ]
!11 = !{!12, !14, !15, !16, !17, !18, !19}
!12 = !{!"0xd\00x\0018\0064\0064\000\000", !1, !10, !13} ; [ DW_TAG_member ] [x] [line 18, size 64, align 64, offset 0] [from double]
!13 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = !{!"0xd\00y\0018\0064\0064\0064\000", !1, !10, !13} ; [ DW_TAG_member ] [y] [line 18, size 64, align 64, offset 64] [from double]
!15 = !{!"0xd\00z\0018\0064\0064\00128\000", !1, !10, !13} ; [ DW_TAG_member ] [z] [line 18, size 64, align 64, offset 128] [from double]
!16 = !{!"0xd\00vx\0019\0064\0064\00192\000", !1, !10, !13} ; [ DW_TAG_member ] [vx] [line 19, size 64, align 64, offset 192] [from double]
!17 = !{!"0xd\00vy\0019\0064\0064\00256\000", !1, !10, !13} ; [ DW_TAG_member ] [vy] [line 19, size 64, align 64, offset 256] [from double]
!18 = !{!"0xd\00vz\0019\0064\0064\00320\000", !1, !10, !13} ; [ DW_TAG_member ] [vz] [line 19, size 64, align 64, offset 320] [from double]
!19 = !{!"0xd\00mass\0020\0064\0064\00384\000", !1, !10, !13} ; [ DW_TAG_member ] [mass] [line 20, size 64, align 64, offset 384] [from double]
!20 = !{!21, !22, !23, !24, !25, !26, !30, !34, !35, !36, !37, !38, !39}
!21 = !{!"0x101\00nbodies\0016777239\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 23]
!22 = !{!"0x101\00bodies\0033554455\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 23]
!23 = !{!"0x101\00dt\0050331671\000", !4, !5, !13} ; [ DW_TAG_arg_variable ] [dt] [line 23]
!24 = !{!"0x100\00i\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 25]
!25 = !{!"0x100\00j\0025\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 25]
!26 = !{!"0x100\00b\0028\000", !27, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 28]
!27 = !{!"0xb\0027\0033\002", !1, !28}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!28 = !{!"0xb\0027\003\001", !1, !29}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!29 = !{!"0xb\0027\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!30 = !{!"0x100\00b2\0030\000", !31, !5, !9}      ; [ DW_TAG_auto_variable ] [b2] [line 30]
!31 = !{!"0xb\0029\0039\005", !1, !32}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!32 = !{!"0xb\0029\005\004", !1, !33}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!33 = !{!"0xb\0029\005\003", !1, !27}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!34 = !{!"0x100\00dx\0031\000", !31, !5, !13}     ; [ DW_TAG_auto_variable ] [dx] [line 31]
!35 = !{!"0x100\00dy\0032\000", !31, !5, !13}     ; [ DW_TAG_auto_variable ] [dy] [line 32]
!36 = !{!"0x100\00dz\0033\000", !31, !5, !13}     ; [ DW_TAG_auto_variable ] [dz] [line 33]
!37 = !{!"0x100\00distance\0034\000", !31, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 34]
!38 = !{!"0x100\00mag\0035\000", !31, !5, !13}    ; [ DW_TAG_auto_variable ] [mag] [line 35]
!39 = !{!"0x100\00b\0045\000", !40, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 45]
!40 = !{!"0xb\0044\0033\008", !1, !41}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!41 = !{!"0xb\0044\003\007", !1, !42}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!42 = !{!"0xb\0044\003\006", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!43 = !{!"0x2e\00energy\00energy\00\0052\000\001\000\000\00256\001\0053", !1, !5, !44, null, double (i32, %struct.planet*)* @energy, null, null, !46} ; [ DW_TAG_subprogram ] [line 52] [def] [scope 53] [energy]
!44 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !45, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = !{!13, !8, !9}
!46 = !{!47, !48, !49, !50, !51, !52, !56, !60, !61, !62, !63}
!47 = !{!"0x101\00nbodies\0016777268\000", !43, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 52]
!48 = !{!"0x101\00bodies\0033554484\000", !43, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 52]
!49 = !{!"0x100\00e\0054\000", !43, !5, !13}      ; [ DW_TAG_auto_variable ] [e] [line 54]
!50 = !{!"0x100\00i\0055\000", !43, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 55]
!51 = !{!"0x100\00j\0055\000", !43, !5, !8}       ; [ DW_TAG_auto_variable ] [j] [line 55]
!52 = !{!"0x100\00b\0059\000", !53, !5, !9}       ; [ DW_TAG_auto_variable ] [b] [line 59]
!53 = !{!"0xb\0058\0033\0011", !1, !54}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!54 = !{!"0xb\0058\003\0010", !1, !55}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!55 = !{!"0xb\0058\003\009", !1, !43}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!56 = !{!"0x100\00b2\0062\000", !57, !5, !9}      ; [ DW_TAG_auto_variable ] [b2] [line 62]
!57 = !{!"0xb\0061\0039\0014", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!58 = !{!"0xb\0061\005\0013", !1, !59}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!59 = !{!"0xb\0061\005\0012", !1, !53}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!60 = !{!"0x100\00dx\0063\000", !57, !5, !13}     ; [ DW_TAG_auto_variable ] [dx] [line 63]
!61 = !{!"0x100\00dy\0064\000", !57, !5, !13}     ; [ DW_TAG_auto_variable ] [dy] [line 64]
!62 = !{!"0x100\00dz\0065\000", !57, !5, !13}     ; [ DW_TAG_auto_variable ] [dz] [line 65]
!63 = !{!"0x100\00distance\0066\000", !57, !5, !13} ; [ DW_TAG_auto_variable ] [distance] [line 66]
!64 = !{!"0x2e\00offset_momentum\00offset_momentum\00\0073\000\001\000\000\00256\001\0074", !1, !5, !65, null, void (i32, %struct.planet*)* @offset_momentum, null, null, !67} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [offset_momentum]
!65 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !66, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = !{null, !8, !9}
!67 = !{!68, !69, !70, !71, !72, !73}
!68 = !{!"0x101\00nbodies\0016777289\000", !64, !5, !8} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!69 = !{!"0x101\00bodies\0033554505\000", !64, !5, !9} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!70 = !{!"0x100\00px\0075\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [px] [line 75]
!71 = !{!"0x100\00py\0075\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [py] [line 75]
!72 = !{!"0x100\00pz\0075\000", !64, !5, !13}     ; [ DW_TAG_auto_variable ] [pz] [line 75]
!73 = !{!"0x100\00i\0076\000", !64, !5, !8}       ; [ DW_TAG_auto_variable ] [i] [line 76]
!74 = !{!"0x2e\00main\00main\00\00130\000\001\000\000\00256\001\00131", !1, !5, !75, null, i32 (i32, i8**)* @main, null, null, !80} ; [ DW_TAG_subprogram ] [line 130] [def] [scope 131] [main]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{!8, !8, !77}
!77 = !{!"0xf\00\000\0064\0064\000\000", null, null, !78} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = !{!"0xf\00\000\0064\0064\000\000", null, null, !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!79 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!80 = !{!81, !82, !83, !84}
!81 = !{!"0x101\00argc\0016777346\000", !74, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 130]
!82 = !{!"0x101\00argv\0033554562\000", !74, !5, !77} ; [ DW_TAG_arg_variable ] [argv] [line 130]
!83 = !{!"0x100\00n\00132\000", !74, !5, !8}      ; [ DW_TAG_auto_variable ] [n] [line 132]
!84 = !{!"0x100\00i\00133\000", !74, !5, !8}      ; [ DW_TAG_auto_variable ] [i] [line 133]
!85 = !{!86}
!86 = !{!"0x34\00bodies\00bodies\00\0088\000\001", null, !5, !87, [5 x %struct.planet]* @bodies, null} ; [ DW_TAG_variable ] [bodies] [line 88] [def]
!87 = !{!"0x1\00\000\002240\0064\000\000\000", null, null, !10, !88, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2240, align 64, offset 0] [from planet]
!88 = !{!89}
!89 = !{!"0x21\000\005"}                          ; [ DW_TAG_subrange_type ] [0, 4]
!90 = !{i32 2, !"Dwarf Version", i32 4}
!91 = !{i32 2, !"Debug Info Version", i32 2}
!92 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!93 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!94 = !MDLocation(line: 23, column: 18, scope: !4)
!95 = !MDLocation(line: 23, column: 43, scope: !4)
!96 = !MDLocation(line: 23, column: 58, scope: !4)
!97 = !MDLocation(line: 25, column: 7, scope: !4)
!98 = !MDLocation(line: 27, column: 15, scope: !28)
!99 = !MDLocation(line: 27, column: 3, scope: !29)
!100 = !MDLocation(line: 44, column: 3, scope: !42)
!101 = !MDLocation(line: 46, column: 13, scope: !40)
!102 = !MDLocation(line: 29, column: 21, scope: !32)
!103 = !MDLocation(line: 29, column: 5, scope: !33)
!104 = !MDLocation(line: 31, column: 19, scope: !31)
!105 = !MDLocation(line: 32, column: 19, scope: !31)
!106 = !MDLocation(line: 33, column: 19, scope: !31)
!107 = !MDLocation(line: 36, column: 7, scope: !31)
!108 = !MDLocation(line: 37, column: 7, scope: !31)
!109 = !MDLocation(line: 38, column: 7, scope: !31)
!110 = !MDLocation(line: 39, column: 22, scope: !31)
!111 = !{!112, !113, i64 0}
!112 = !{!"planet", !113, i64 0, !113, i64 8, !113, i64 16, !113, i64 24, !113, i64 32, !113, i64 40, !113, i64 48}
!113 = !{!"double", !114, i64 0}
!114 = !{!"omnipotent char", !115, i64 0}
!115 = !{!"Simple C/C++ TBAA"}
!116 = !MDLocation(line: 31, column: 26, scope: !31)
!117 = !MDLocation(line: 31, column: 14, scope: !31)
!118 = !{!112, !113, i64 8}
!119 = !MDLocation(line: 32, column: 26, scope: !31)
!120 = !MDLocation(line: 32, column: 14, scope: !31)
!121 = !{!112, !113, i64 16}
!122 = !MDLocation(line: 33, column: 26, scope: !31)
!123 = !MDLocation(line: 33, column: 14, scope: !31)
!124 = !MDLocation(line: 34, column: 30, scope: !31)
!125 = !MDLocation(line: 34, column: 40, scope: !31)
!126 = !MDLocation(line: 34, column: 50, scope: !31)
!127 = !MDLocation(line: 34, column: 25, scope: !31)
!128 = !MDLocation(line: 34, column: 14, scope: !31)
!129 = !MDLocation(line: 35, column: 26, scope: !31)
!130 = !MDLocation(line: 35, column: 20, scope: !31)
!131 = !MDLocation(line: 35, column: 14, scope: !31)
!132 = !MDLocation(line: 36, column: 21, scope: !31)
!133 = !{!112, !113, i64 48}
!134 = !MDLocation(line: 36, column: 16, scope: !31)
!135 = !{!112, !113, i64 24}
!136 = !MDLocation(line: 37, column: 21, scope: !31)
!137 = !MDLocation(line: 37, column: 16, scope: !31)
!138 = !{!112, !113, i64 32}
!139 = !MDLocation(line: 38, column: 21, scope: !31)
!140 = !MDLocation(line: 38, column: 16, scope: !31)
!141 = !{!112, !113, i64 40}
!142 = !MDLocation(line: 39, column: 17, scope: !31)
!143 = !MDLocation(line: 39, column: 7, scope: !31)
!144 = !MDLocation(line: 40, column: 22, scope: !31)
!145 = !MDLocation(line: 40, column: 17, scope: !31)
!146 = !MDLocation(line: 40, column: 7, scope: !31)
!147 = !MDLocation(line: 41, column: 22, scope: !31)
!148 = !MDLocation(line: 41, column: 17, scope: !31)
!149 = !MDLocation(line: 41, column: 7, scope: !31)
!150 = !MDLocation(line: 46, column: 18, scope: !40)
!151 = !MDLocation(line: 46, column: 5, scope: !40)
!152 = !{!113, !113, i64 0}
!153 = !MDLocation(line: 48, column: 18, scope: !40)
!154 = !MDLocation(line: 48, column: 13, scope: !40)
!155 = !MDLocation(line: 48, column: 5, scope: !40)
!156 = !MDLocation(line: 50, column: 1, scope: !4)
!157 = !MDLocation(line: 52, column: 19, scope: !43)
!158 = !MDLocation(line: 52, column: 44, scope: !43)
!159 = !MDLocation(line: 54, column: 10, scope: !43)
!160 = !MDLocation(line: 55, column: 7, scope: !43)
!161 = !MDLocation(line: 58, column: 15, scope: !54)
!162 = !MDLocation(line: 58, column: 3, scope: !55)
!163 = !MDLocation(line: 60, column: 16, scope: !53)
!164 = !MDLocation(line: 60, column: 10, scope: !53)
!165 = !MDLocation(line: 60, column: 27, scope: !53)
!166 = !MDLocation(line: 60, column: 43, scope: !53)
!167 = !MDLocation(line: 60, column: 59, scope: !53)
!168 = !MDLocation(line: 60, column: 5, scope: !53)
!169 = !MDLocation(line: 61, column: 21, scope: !58)
!170 = !MDLocation(line: 61, column: 5, scope: !59)
!171 = !MDLocation(line: 63, column: 19, scope: !57)
!172 = !MDLocation(line: 64, column: 19, scope: !57)
!173 = !MDLocation(line: 65, column: 19, scope: !57)
!174 = !MDLocation(line: 63, column: 26, scope: !57)
!175 = !MDLocation(line: 63, column: 14, scope: !57)
!176 = !MDLocation(line: 64, column: 26, scope: !57)
!177 = !MDLocation(line: 64, column: 14, scope: !57)
!178 = !MDLocation(line: 65, column: 26, scope: !57)
!179 = !MDLocation(line: 65, column: 14, scope: !57)
!180 = !MDLocation(line: 66, column: 30, scope: !57)
!181 = !MDLocation(line: 66, column: 40, scope: !57)
!182 = !MDLocation(line: 66, column: 50, scope: !57)
!183 = !MDLocation(line: 66, column: 25, scope: !57)
!184 = !MDLocation(line: 66, column: 14, scope: !57)
!185 = !MDLocation(line: 67, column: 13, scope: !57)
!186 = !MDLocation(line: 67, column: 23, scope: !57)
!187 = !MDLocation(line: 67, column: 12, scope: !57)
!188 = !MDLocation(line: 67, column: 7, scope: !57)
!189 = !MDLocation(line: 70, column: 3, scope: !43)
!190 = !MDLocation(line: 73, column: 26, scope: !64)
!191 = !MDLocation(line: 73, column: 51, scope: !64)
!192 = !MDLocation(line: 75, column: 10, scope: !64)
!193 = !MDLocation(line: 75, column: 20, scope: !64)
!194 = !MDLocation(line: 75, column: 30, scope: !64)
!195 = !MDLocation(line: 76, column: 7, scope: !64)
!196 = !MDLocation(line: 77, column: 15, scope: !197)
!197 = !{!"0xb\0077\003\0016", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!198 = !{!"0xb\0077\003\0015", !1, !64}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!199 = !MDLocation(line: 77, column: 3, scope: !198)
!200 = !MDLocation(line: 78, column: 11, scope: !201)
!201 = !{!"0xb\0077\0033\0017", !1, !197}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!202 = !MDLocation(line: 78, column: 26, scope: !201)
!203 = !MDLocation(line: 78, column: 5, scope: !201)
!204 = !MDLocation(line: 80, column: 11, scope: !201)
!205 = !MDLocation(line: 80, column: 5, scope: !201)
!206 = distinct !{!206, !207}
!207 = !{!"llvm.loop.unroll.disable"}
!208 = !MDLocation(line: 82, column: 3, scope: !64)
!209 = !MDLocation(line: 82, column: 18, scope: !64)
!210 = !MDLocation(line: 84, column: 18, scope: !64)
!211 = !MDLocation(line: 84, column: 3, scope: !64)
!212 = !MDLocation(line: 85, column: 1, scope: !64)
!213 = !MDLocation(line: 130, column: 14, scope: !74)
!214 = !MDLocation(line: 130, column: 28, scope: !74)
!215 = !MDLocation(line: 132, column: 7, scope: !74)
!216 = !{!"0x101\00nbodies\0016777289\000", !64, !5, !8, !217} ; [ DW_TAG_arg_variable ] [nbodies] [line 73]
!217 = !MDLocation(line: 135, column: 3, scope: !74)
!218 = !MDLocation(line: 73, column: 26, scope: !64, inlinedAt: !217)
!219 = !{!"0x101\00bodies\0033554505\000", !64, !5, !9, !217} ; [ DW_TAG_arg_variable ] [bodies] [line 73]
!220 = !MDLocation(line: 73, column: 51, scope: !64, inlinedAt: !217)
!221 = !{!"0x100\00px\0075\000", !64, !5, !13, !217} ; [ DW_TAG_auto_variable ] [px] [line 75]
!222 = !MDLocation(line: 75, column: 10, scope: !64, inlinedAt: !217)
!223 = !{!"0x100\00py\0075\000", !64, !5, !13, !217} ; [ DW_TAG_auto_variable ] [py] [line 75]
!224 = !MDLocation(line: 75, column: 20, scope: !64, inlinedAt: !217)
!225 = !{!"0x100\00pz\0075\000", !64, !5, !13, !217} ; [ DW_TAG_auto_variable ] [pz] [line 75]
!226 = !MDLocation(line: 75, column: 30, scope: !64, inlinedAt: !217)
!227 = !{!"0x100\00i\0076\000", !64, !5, !8, !217} ; [ DW_TAG_auto_variable ] [i] [line 76]
!228 = !MDLocation(line: 76, column: 7, scope: !64, inlinedAt: !217)
!229 = !MDLocation(line: 78, column: 26, scope: !201, inlinedAt: !217)
!230 = !MDLocation(line: 78, column: 11, scope: !201, inlinedAt: !217)
!231 = !MDLocation(line: 78, column: 5, scope: !201, inlinedAt: !217)
!232 = !MDLocation(line: 80, column: 11, scope: !201, inlinedAt: !217)
!233 = !MDLocation(line: 80, column: 5, scope: !201, inlinedAt: !217)
!234 = !MDLocation(line: 82, column: 18, scope: !64, inlinedAt: !217)
!235 = !MDLocation(line: 82, column: 3, scope: !64, inlinedAt: !217)
!236 = !MDLocation(line: 84, column: 18, scope: !64, inlinedAt: !217)
!237 = !MDLocation(line: 84, column: 3, scope: !64, inlinedAt: !217)
!238 = !MDLocation(line: 136, column: 21, scope: !74)
!239 = !MDLocation(line: 136, column: 3, scope: !74)
!240 = !MDLocation(line: 133, column: 7, scope: !74)
!241 = !MDLocation(line: 137, column: 3, scope: !242)
!242 = !{!"0xb\00137\003\0018", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!243 = !MDLocation(line: 138, column: 5, scope: !244)
!244 = !{!"0xb\00137\003\0019", !1, !242}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!245 = !MDLocation(line: 137, column: 23, scope: !244)
!246 = !MDLocation(line: 139, column: 21, scope: !74)
!247 = !MDLocation(line: 139, column: 3, scope: !74)
!248 = !MDLocation(line: 140, column: 3, scope: !74)
