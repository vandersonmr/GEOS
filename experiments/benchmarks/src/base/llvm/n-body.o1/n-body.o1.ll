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

for.cond.loopexit:                                ; preds = %for.body3, %for.body
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1, !dbg !99
  %lftr.wideiv134 = trunc i64 %indvars.iv132 to i32, !dbg !99
  %exitcond135 = icmp eq i32 %lftr.wideiv134, %0, !dbg !99
  br i1 %exitcond135, label %for.cond46.preheader, label %for.body, !dbg !99

for.cond46.preheader:                             ; preds = %for.cond.loopexit
  %cmp47119 = icmp sgt i32 %nbodies, 0, !dbg !100
  br i1 %cmp47119, label %for.body48.lr.ph, label %for.end66, !dbg !101

for.body48.lr.ph:                                 ; preds = %for.cond46.preheader
  %2 = add i32 %nbodies, -1, !dbg !101
  br label %for.body48, !dbg !101

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
  %3 = load double* %x, align 8, !dbg !104, !tbaa !111
  %x6 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 0, !dbg !116
  %4 = load double* %x6, align 8, !dbg !116, !tbaa !111
  %sub = fsub double %3, %4, !dbg !104
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !34, metadata !93), !dbg !117
  %5 = load double* %y, align 8, !dbg !105, !tbaa !118
  %y7 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 1, !dbg !119
  %6 = load double* %y7, align 8, !dbg !119, !tbaa !118
  %sub8 = fsub double %5, %6, !dbg !105
  tail call void @llvm.dbg.value(metadata double %sub8, i64 0, metadata !35, metadata !93), !dbg !120
  %7 = load double* %z, align 8, !dbg !106, !tbaa !121
  %z9 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 2, !dbg !122
  %8 = load double* %z9, align 8, !dbg !122, !tbaa !121
  %sub10 = fsub double %7, %8, !dbg !106
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
  %9 = load double* %mass, align 8, !dbg !132, !tbaa !133
  %mul17 = fmul double %sub, %9, !dbg !134
  %mul18 = fmul double %div, %mul17, !dbg !134
  %10 = load double* %vx, align 8, !dbg !107, !tbaa !135
  %sub19 = fsub double %10, %mul18, !dbg !107
  store double %sub19, double* %vx, align 8, !dbg !107, !tbaa !135
  %11 = load double* %mass, align 8, !dbg !136, !tbaa !133
  %mul21 = fmul double %sub8, %11, !dbg !137
  %mul22 = fmul double %div, %mul21, !dbg !137
  %12 = load double* %vy, align 8, !dbg !108, !tbaa !138
  %sub23 = fsub double %12, %mul22, !dbg !108
  store double %sub23, double* %vy, align 8, !dbg !108, !tbaa !138
  %13 = load double* %mass, align 8, !dbg !139, !tbaa !133
  %mul25 = fmul double %sub10, %13, !dbg !140
  %mul26 = fmul double %div, %mul25, !dbg !140
  %14 = load double* %vz, align 8, !dbg !109, !tbaa !141
  %sub27 = fsub double %14, %mul26, !dbg !109
  store double %sub27, double* %vz, align 8, !dbg !109, !tbaa !141
  %15 = load double* %mass28, align 8, !dbg !110, !tbaa !133
  %mul29 = fmul double %sub, %15, !dbg !142
  %mul30 = fmul double %div, %mul29, !dbg !142
  %vx31 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 3, !dbg !143
  %16 = load double* %vx31, align 8, !dbg !143, !tbaa !135
  %add32 = fadd double %16, %mul30, !dbg !143
  store double %add32, double* %vx31, align 8, !dbg !143, !tbaa !135
  %17 = load double* %mass28, align 8, !dbg !144, !tbaa !133
  %mul34 = fmul double %sub8, %17, !dbg !145
  %mul35 = fmul double %div, %mul34, !dbg !145
  %vy36 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 4, !dbg !146
  %18 = load double* %vy36, align 8, !dbg !146, !tbaa !138
  %add37 = fadd double %18, %mul35, !dbg !146
  store double %add37, double* %vy36, align 8, !dbg !146, !tbaa !138
  %19 = load double* %mass28, align 8, !dbg !147, !tbaa !133
  %mul39 = fmul double %sub10, %19, !dbg !148
  %mul40 = fmul double %div, %mul39, !dbg !148
  %vz41 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv127, i32 5, !dbg !149
  %20 = load double* %vz41, align 8, !dbg !149, !tbaa !141
  %add42 = fadd double %20, %mul40, !dbg !149
  store double %add42, double* %vz41, align 8, !dbg !149, !tbaa !141
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1, !dbg !103
  %lftr.wideiv130 = trunc i64 %indvars.iv127 to i32, !dbg !103
  %exitcond131 = icmp eq i32 %lftr.wideiv130, %0, !dbg !103
  br i1 %exitcond131, label %for.cond.loopexit, label %for.body3, !dbg !103

for.body48:                                       ; preds = %for.body48, %for.body48.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body48.lr.ph ], [ %indvars.iv.next, %for.body48 ]
  %vx52 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !150
  %21 = load double* %vx52, align 8, !dbg !150, !tbaa !135
  %mul53 = fmul double %21, %dt, !dbg !151
  %x54 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 0, !dbg !152
  %22 = load double* %x54, align 8, !dbg !152, !tbaa !111
  %add55 = fadd double %22, %mul53, !dbg !152
  store double %add55, double* %x54, align 8, !dbg !152, !tbaa !111
  %vy56 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 4, !dbg !153
  %23 = load double* %vy56, align 8, !dbg !153, !tbaa !138
  %mul57 = fmul double %23, %dt, !dbg !154
  %y58 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 1, !dbg !155
  %24 = load double* %y58, align 8, !dbg !155, !tbaa !118
  %add59 = fadd double %24, %mul57, !dbg !155
  store double %add59, double* %y58, align 8, !dbg !155, !tbaa !118
  %vz60 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !156
  %25 = load double* %vz60, align 8, !dbg !156, !tbaa !141
  %mul61 = fmul double %25, %dt, !dbg !157
  %z62 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 2, !dbg !158
  %26 = load double* %z62, align 8, !dbg !158, !tbaa !121
  %add63 = fadd double %26, %mul61, !dbg !158
  store double %add63, double* %z62, align 8, !dbg !158, !tbaa !121
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !101
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !101
  %exitcond = icmp eq i32 %lftr.wideiv, %2, !dbg !101
  br i1 %exitcond, label %for.end66, label %for.body48, !dbg !101

for.end66:                                        ; preds = %for.body48, %entry, %for.cond46.preheader
  ret void, !dbg !159
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define double @energy(i32 %nbodies, %struct.planet* nocapture readonly %bodies) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !47, metadata !93), !dbg !160
  tail call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !48, metadata !93), !dbg !161
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !49, metadata !93), !dbg !162
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !50, metadata !93), !dbg !163
  %cmp61 = icmp sgt i32 %nbodies, 0, !dbg !164
  br i1 %cmp61, label %for.body.lr.ph, label %for.end32, !dbg !165

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %nbodies, -1, !dbg !165
  %1 = sext i32 %nbodies to i64, !dbg !165
  br label %for.body, !dbg !165

for.cond.loopexit:                                ; preds = %for.body13, %for.body
  %e.1.lcssa = phi double [ %add9, %for.body ], [ %sub29, %for.body13 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !165
  %lftr.wideiv70 = trunc i64 %indvars.iv68 to i32, !dbg !165
  %exitcond71 = icmp eq i32 %lftr.wideiv70, %0, !dbg !165
  br i1 %exitcond71, label %for.end32, label %for.body, !dbg !165

for.body:                                         ; preds = %for.cond.loopexit, %for.body.lr.ph
  %indvars.iv68 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next69, %for.cond.loopexit ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.cond.loopexit ]
  %e.063 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %e.1.lcssa, %for.cond.loopexit ]
  %mass = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 6, !dbg !166
  %2 = load double* %mass, align 8, !dbg !166, !tbaa !133
  %mul = fmul double %2, 5.000000e-01, !dbg !167
  %vx = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 3, !dbg !168
  %3 = load double* %vx, align 8, !dbg !168, !tbaa !135
  %mul2 = fmul double %3, %3, !dbg !168
  %vy = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 4, !dbg !169
  %4 = load double* %vy, align 8, !dbg !169, !tbaa !138
  %mul4 = fmul double %4, %4, !dbg !169
  %add = fadd double %mul2, %mul4, !dbg !168
  %vz = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 5, !dbg !170
  %5 = load double* %vz, align 8, !dbg !170, !tbaa !141
  %mul6 = fmul double %5, %5, !dbg !170
  %add7 = fadd double %add, %mul6, !dbg !168
  %mul8 = fmul double %mul, %add7, !dbg !167
  %add9 = fadd double %e.063, %mul8, !dbg !171
  tail call void @llvm.dbg.value(metadata double %add9, i64 0, metadata !49, metadata !93), !dbg !162
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !dbg !165
  %cmp1258 = icmp slt i64 %indvars.iv.next69, %1, !dbg !172
  br i1 %cmp1258, label %for.body13.lr.ph, label %for.cond.loopexit, !dbg !173

for.body13.lr.ph:                                 ; preds = %for.body
  %x = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 0, !dbg !174
  %y = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 1, !dbg !175
  %z = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv68, i32 2, !dbg !176
  br label %for.body13, !dbg !173

for.body13:                                       ; preds = %for.body13, %for.body13.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv, %for.body13.lr.ph ], [ %indvars.iv.next66, %for.body13 ]
  %e.160 = phi double [ %add9, %for.body13.lr.ph ], [ %sub29, %for.body13 ]
  %6 = load double* %x, align 8, !dbg !174, !tbaa !111
  %x16 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 0, !dbg !177
  %7 = load double* %x16, align 8, !dbg !177, !tbaa !111
  %sub = fsub double %6, %7, !dbg !174
  tail call void @llvm.dbg.value(metadata double %sub, i64 0, metadata !60, metadata !93), !dbg !178
  %8 = load double* %y, align 8, !dbg !175, !tbaa !118
  %y17 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 1, !dbg !179
  %9 = load double* %y17, align 8, !dbg !179, !tbaa !118
  %sub18 = fsub double %8, %9, !dbg !175
  tail call void @llvm.dbg.value(metadata double %sub18, i64 0, metadata !61, metadata !93), !dbg !180
  %10 = load double* %z, align 8, !dbg !176, !tbaa !121
  %z19 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 2, !dbg !181
  %11 = load double* %z19, align 8, !dbg !181, !tbaa !121
  %sub20 = fsub double %10, %11, !dbg !176
  tail call void @llvm.dbg.value(metadata double %sub20, i64 0, metadata !62, metadata !93), !dbg !182
  %mul21 = fmul double %sub, %sub, !dbg !183
  %mul22 = fmul double %sub18, %sub18, !dbg !184
  %add23 = fadd double %mul21, %mul22, !dbg !183
  %mul24 = fmul double %sub20, %sub20, !dbg !185
  %add25 = fadd double %add23, %mul24, !dbg !183
  %call = tail call double @sqrt(double %add25) #3, !dbg !186
  tail call void @llvm.dbg.value(metadata double %call, i64 0, metadata !63, metadata !93), !dbg !187
  %12 = load double* %mass, align 8, !dbg !188, !tbaa !133
  %mass27 = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv65, i32 6, !dbg !189
  %13 = load double* %mass27, align 8, !dbg !189, !tbaa !133
  %mul28 = fmul double %12, %13, !dbg !188
  %div = fdiv double %mul28, %call, !dbg !190
  %sub29 = fsub double %e.160, %div, !dbg !191
  tail call void @llvm.dbg.value(metadata double %sub29, i64 0, metadata !49, metadata !93), !dbg !162
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1, !dbg !173
  %lftr.wideiv = trunc i64 %indvars.iv65 to i32, !dbg !173
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !173
  br i1 %exitcond, label %for.cond.loopexit, label %for.body13, !dbg !173

for.end32:                                        ; preds = %for.cond.loopexit, %entry
  %e.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %e.1.lcssa, %for.cond.loopexit ]
  ret double %e.0.lcssa, !dbg !192
}

; Function Attrs: nounwind uwtable
define void @offset_momentum(i32 %nbodies, %struct.planet* nocapture %bodies) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nbodies, i64 0, metadata !68, metadata !93), !dbg !193
  tail call void @llvm.dbg.value(metadata %struct.planet* %bodies, i64 0, metadata !69, metadata !93), !dbg !194
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !70, metadata !93), !dbg !195
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !71, metadata !93), !dbg !196
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !72, metadata !93), !dbg !197
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !73, metadata !93), !dbg !198
  %cmp45 = icmp sgt i32 %nbodies, 0, !dbg !199
  br i1 %cmp45, label %for.body.lr.ph, label %for.end, !dbg !202

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %nbodies, -1, !dbg !202
  br label %for.body, !dbg !202

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %pz.048 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add16, %for.body ]
  %py.047 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add9, %for.body ]
  %px.046 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %vx = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 3, !dbg !203
  %1 = load double* %vx, align 8, !dbg !203, !tbaa !135
  %mass = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 6, !dbg !205
  %2 = load double* %mass, align 8, !dbg !205, !tbaa !133
  %mul = fmul double %1, %2, !dbg !203
  %add = fadd double %px.046, %mul, !dbg !206
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !70, metadata !93), !dbg !195
  %vy = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 4, !dbg !207
  %3 = load double* %vy, align 8, !dbg !207, !tbaa !138
  %mul8 = fmul double %2, %3, !dbg !207
  %add9 = fadd double %py.047, %mul8, !dbg !208
  tail call void @llvm.dbg.value(metadata double %add9, i64 0, metadata !71, metadata !93), !dbg !196
  %vz = getelementptr inbounds %struct.planet* %bodies, i64 %indvars.iv, i32 5, !dbg !209
  %4 = load double* %vz, align 8, !dbg !209, !tbaa !141
  %mul15 = fmul double %2, %4, !dbg !209
  %add16 = fadd double %pz.048, %mul15, !dbg !210
  tail call void @llvm.dbg.value(metadata double %add16, i64 0, metadata !72, metadata !93), !dbg !197
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !202
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !202
  %exitcond = icmp eq i32 %lftr.wideiv, %0, !dbg !202
  br i1 %exitcond, label %for.end, label %for.body, !dbg !202

for.end:                                          ; preds = %for.body, %entry
  %pz.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add16, %for.body ]
  %py.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add9, %for.body ]
  %px.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %sub = fsub double -0.000000e+00, %px.0.lcssa, !dbg !211
  %div = fdiv double %sub, 0x4043BD3CC9BE45DE, !dbg !211
  %vx18 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 3, !dbg !212
  store double %div, double* %vx18, align 8, !dbg !212, !tbaa !135
  %sub19 = fsub double -0.000000e+00, %py.0.lcssa, !dbg !213
  %div20 = fdiv double %sub19, 0x4043BD3CC9BE45DE, !dbg !213
  %vy22 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 4, !dbg !214
  store double %div20, double* %vy22, align 8, !dbg !214, !tbaa !138
  %sub23 = fsub double -0.000000e+00, %pz.0.lcssa, !dbg !215
  %div24 = fdiv double %sub23, 0x4043BD3CC9BE45DE, !dbg !215
  %vz26 = getelementptr inbounds %struct.planet* %bodies, i64 0, i32 5, !dbg !216
  store double %div24, double* %vz26, align 8, !dbg !216, !tbaa !141
  ret void, !dbg !217
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !81, metadata !93), !dbg !218
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !82, metadata !93), !dbg !219
  tail call void @llvm.dbg.value(metadata i32 5000000, i64 0, metadata !83, metadata !93), !dbg !220
  tail call void @offset_momentum(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)), !dbg !221
  %call = tail call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)), !dbg !222
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call) #3, !dbg !223
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !84, metadata !93), !dbg !224
  br label %for.body, !dbg !225

for.body:                                         ; preds = %for.body, %entry
  %i.05 = phi i32 [ 1, %entry ], [ %inc, %for.body ]
  tail call void @advance(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0), double 1.000000e-02), !dbg !227
  %inc = add nuw nsw i32 %i.05, 1, !dbg !229
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !84, metadata !93), !dbg !224
  %exitcond = icmp eq i32 %inc, 5000001, !dbg !225
  br i1 %exitcond, label %for.end, label %for.body, !dbg !225

for.end:                                          ; preds = %for.body
  %call2 = tail call double @energy(i32 5, %struct.planet* getelementptr inbounds ([5 x %struct.planet]* @bodies, i64 0, i64 0)), !dbg !230
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), double %call2) #3, !dbg !231
  ret i32 0, !dbg !232
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
!100 = !MDLocation(line: 44, column: 15, scope: !41)
!101 = !MDLocation(line: 44, column: 3, scope: !42)
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
!151 = !MDLocation(line: 46, column: 13, scope: !40)
!152 = !MDLocation(line: 46, column: 5, scope: !40)
!153 = !MDLocation(line: 47, column: 18, scope: !40)
!154 = !MDLocation(line: 47, column: 13, scope: !40)
!155 = !MDLocation(line: 47, column: 5, scope: !40)
!156 = !MDLocation(line: 48, column: 18, scope: !40)
!157 = !MDLocation(line: 48, column: 13, scope: !40)
!158 = !MDLocation(line: 48, column: 5, scope: !40)
!159 = !MDLocation(line: 50, column: 1, scope: !4)
!160 = !MDLocation(line: 52, column: 19, scope: !43)
!161 = !MDLocation(line: 52, column: 44, scope: !43)
!162 = !MDLocation(line: 54, column: 10, scope: !43)
!163 = !MDLocation(line: 55, column: 7, scope: !43)
!164 = !MDLocation(line: 58, column: 15, scope: !54)
!165 = !MDLocation(line: 58, column: 3, scope: !55)
!166 = !MDLocation(line: 60, column: 16, scope: !53)
!167 = !MDLocation(line: 60, column: 10, scope: !53)
!168 = !MDLocation(line: 60, column: 27, scope: !53)
!169 = !MDLocation(line: 60, column: 43, scope: !53)
!170 = !MDLocation(line: 60, column: 59, scope: !53)
!171 = !MDLocation(line: 60, column: 5, scope: !53)
!172 = !MDLocation(line: 61, column: 21, scope: !58)
!173 = !MDLocation(line: 61, column: 5, scope: !59)
!174 = !MDLocation(line: 63, column: 19, scope: !57)
!175 = !MDLocation(line: 64, column: 19, scope: !57)
!176 = !MDLocation(line: 65, column: 19, scope: !57)
!177 = !MDLocation(line: 63, column: 26, scope: !57)
!178 = !MDLocation(line: 63, column: 14, scope: !57)
!179 = !MDLocation(line: 64, column: 26, scope: !57)
!180 = !MDLocation(line: 64, column: 14, scope: !57)
!181 = !MDLocation(line: 65, column: 26, scope: !57)
!182 = !MDLocation(line: 65, column: 14, scope: !57)
!183 = !MDLocation(line: 66, column: 30, scope: !57)
!184 = !MDLocation(line: 66, column: 40, scope: !57)
!185 = !MDLocation(line: 66, column: 50, scope: !57)
!186 = !MDLocation(line: 66, column: 25, scope: !57)
!187 = !MDLocation(line: 66, column: 14, scope: !57)
!188 = !MDLocation(line: 67, column: 13, scope: !57)
!189 = !MDLocation(line: 67, column: 23, scope: !57)
!190 = !MDLocation(line: 67, column: 12, scope: !57)
!191 = !MDLocation(line: 67, column: 7, scope: !57)
!192 = !MDLocation(line: 70, column: 3, scope: !43)
!193 = !MDLocation(line: 73, column: 26, scope: !64)
!194 = !MDLocation(line: 73, column: 51, scope: !64)
!195 = !MDLocation(line: 75, column: 10, scope: !64)
!196 = !MDLocation(line: 75, column: 20, scope: !64)
!197 = !MDLocation(line: 75, column: 30, scope: !64)
!198 = !MDLocation(line: 76, column: 7, scope: !64)
!199 = !MDLocation(line: 77, column: 15, scope: !200)
!200 = !{!"0xb\0077\003\0016", !1, !201}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!201 = !{!"0xb\0077\003\0015", !1, !64}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!202 = !MDLocation(line: 77, column: 3, scope: !201)
!203 = !MDLocation(line: 78, column: 11, scope: !204)
!204 = !{!"0xb\0077\0033\0017", !1, !200}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!205 = !MDLocation(line: 78, column: 26, scope: !204)
!206 = !MDLocation(line: 78, column: 5, scope: !204)
!207 = !MDLocation(line: 79, column: 11, scope: !204)
!208 = !MDLocation(line: 79, column: 5, scope: !204)
!209 = !MDLocation(line: 80, column: 11, scope: !204)
!210 = !MDLocation(line: 80, column: 5, scope: !204)
!211 = !MDLocation(line: 82, column: 18, scope: !64)
!212 = !MDLocation(line: 82, column: 3, scope: !64)
!213 = !MDLocation(line: 83, column: 18, scope: !64)
!214 = !MDLocation(line: 83, column: 3, scope: !64)
!215 = !MDLocation(line: 84, column: 18, scope: !64)
!216 = !MDLocation(line: 84, column: 3, scope: !64)
!217 = !MDLocation(line: 85, column: 1, scope: !64)
!218 = !MDLocation(line: 130, column: 14, scope: !74)
!219 = !MDLocation(line: 130, column: 28, scope: !74)
!220 = !MDLocation(line: 132, column: 7, scope: !74)
!221 = !MDLocation(line: 135, column: 3, scope: !74)
!222 = !MDLocation(line: 136, column: 21, scope: !74)
!223 = !MDLocation(line: 136, column: 3, scope: !74)
!224 = !MDLocation(line: 133, column: 7, scope: !74)
!225 = !MDLocation(line: 137, column: 3, scope: !226)
!226 = !{!"0xb\00137\003\0018", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!227 = !MDLocation(line: 138, column: 5, scope: !228)
!228 = !{!"0xb\00137\003\0019", !1, !226}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/n-body.c]
!229 = !MDLocation(line: 137, column: 23, scope: !228)
!230 = !MDLocation(line: 139, column: 21, scope: !74)
!231 = !MDLocation(line: 139, column: 3, scope: !74)
!232 = !MDLocation(line: 140, column: 3, scope: !74)
