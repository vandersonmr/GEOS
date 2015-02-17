; ModuleID = 'gemver.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !101), !dbg !102
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !101), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !101), !dbg !104
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !105
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !106
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !107
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !108
  %call4 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !109
  %call5 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !110
  %call6 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !111
  %call7 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !112
  %call8 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !113
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !114
  %arraydecay9 = bitcast i8* %call1 to double*, !dbg !115
  %arraydecay10 = bitcast i8* %call2 to double*, !dbg !116
  %arraydecay11 = bitcast i8* %call3 to double*, !dbg !117
  %arraydecay12 = bitcast i8* %call4 to double*, !dbg !118
  %arraydecay13 = bitcast i8* %call5 to double*, !dbg !119
  %arraydecay14 = bitcast i8* %call6 to double*, !dbg !120
  %arraydecay15 = bitcast i8* %call7 to double*, !dbg !121
  %arraydecay16 = bitcast i8* %call8 to double*, !dbg !122
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !123, metadata !101), !dbg !125
  tail call void @llvm.dbg.value(metadata double 4.353200e+04, i64 0, metadata !36, metadata !101), !dbg !126
  tail call void @llvm.dbg.value(metadata double 4.353200e+04, i64 0, metadata !36, metadata !101), !dbg !126
  tail call void @llvm.dbg.value(metadata double 1.231300e+04, i64 0, metadata !37, metadata !101), !dbg !127
  tail call void @llvm.dbg.value(metadata double 1.231300e+04, i64 0, metadata !37, metadata !101), !dbg !127
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !101), !dbg !129
  br label %for.body.i, !dbg !130

for.cond1.preheader.i.preheader:                  ; preds = %middle.block
  %scevgep125 = getelementptr i8* %call2, i64 31992
  %scevgep126 = getelementptr i8* %call4, i64 31992
  br label %for.cond1.preheader.i, !dbg !132

for.body.i:                                       ; preds = %middle.block, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %middle.block ], !dbg !124
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !138
  %conv.i = sitofp i32 %0 to double, !dbg !138
  %arrayidx.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv3.i, !dbg !141
  store double %conv.i, double* %arrayidx.i, align 8, !dbg !141, !tbaa !142
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !130
  %1 = trunc i64 %indvars.iv.next4.i to i32, !dbg !146
  %div.i = sdiv i32 %1, 4000, !dbg !146
  %conv1.i = sitofp i32 %div.i to double, !dbg !146
  %div2.i = fmul double %conv1.i, 5.000000e-01, !dbg !146
  %arrayidx4.i = getelementptr inbounds double* %arraydecay11, i64 %indvars.iv3.i, !dbg !147
  store double %div2.i, double* %arrayidx4.i, align 8, !dbg !147, !tbaa !142
  %div8.i = fmul double %conv1.i, 2.500000e-01, !dbg !148
  %arrayidx10.i = getelementptr inbounds double* %arraydecay10, i64 %indvars.iv3.i, !dbg !149
  store double %div8.i, double* %arrayidx10.i, align 8, !dbg !149, !tbaa !142
  %div14.i = fdiv double %conv1.i, 6.000000e+00, !dbg !150
  %arrayidx16.i = getelementptr inbounds double* %arraydecay12, i64 %indvars.iv3.i, !dbg !151
  store double %div14.i, double* %arrayidx16.i, align 8, !dbg !151, !tbaa !142
  %div20.i = fmul double %conv1.i, 1.250000e-01, !dbg !152
  %arrayidx22.i = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv3.i, !dbg !153
  store double %div20.i, double* %arrayidx22.i, align 8, !dbg !153, !tbaa !142
  %div26.i = fdiv double %conv1.i, 9.000000e+00, !dbg !154
  %arrayidx28.i = getelementptr inbounds double* %arraydecay16, i64 %indvars.iv3.i, !dbg !155
  store double %div26.i, double* %arrayidx28.i, align 8, !dbg !155, !tbaa !142
  %arrayidx30.i = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv3.i, !dbg !156
  store double 0.000000e+00, double* %arrayidx30.i, align 8, !dbg !156, !tbaa !142
  %arrayidx32.i = getelementptr inbounds double* %arraydecay13, i64 %indvars.iv3.i, !dbg !157
  store double 0.000000e+00, double* %arrayidx32.i, align 8, !dbg !157, !tbaa !142
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !158, metadata !101), !dbg !159
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next.1, %vector.body ], !dbg !124
  %induction113183 = or i64 %index, 1, !dbg !124
  %2 = trunc i64 %index to i32, !dbg !160
  %induction115184 = or i32 %2, 1, !dbg !160
  %3 = sitofp i32 %2 to double, !dbg !160
  %4 = sitofp i32 %induction115184 to double, !dbg !160
  %5 = fmul double %conv.i, %3, !dbg !163
  %6 = fmul double %conv.i, %4, !dbg !163
  %7 = fdiv double %5, 4.000000e+03, !dbg !164
  %8 = fdiv double %6, 4.000000e+03, !dbg !164
  %9 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !165
  %10 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction113183, !dbg !165
  store double %7, double* %9, align 8, !dbg !165, !tbaa !142
  store double %8, double* %10, align 8, !dbg !165, !tbaa !142
  %index.next = add nuw nsw i64 %index, 2, !dbg !124
  %induction113183.1 = or i64 %index.next, 1, !dbg !124
  %11 = trunc i64 %index.next to i32, !dbg !160
  %induction115184.1 = or i32 %11, 1, !dbg !160
  %12 = sitofp i32 %11 to double, !dbg !160
  %13 = sitofp i32 %induction115184.1 to double, !dbg !160
  %14 = fmul double %conv.i, %12, !dbg !163
  %15 = fmul double %conv.i, %13, !dbg !163
  %16 = fdiv double %14, 4.000000e+03, !dbg !164
  %17 = fdiv double %15, 4.000000e+03, !dbg !164
  %18 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index.next, !dbg !165
  %19 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction113183.1, !dbg !165
  store double %16, double* %18, align 8, !dbg !165, !tbaa !142
  store double %17, double* %19, align 8, !dbg !165, !tbaa !142
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !124
  %20 = icmp eq i64 %index.next.1, 4000, !dbg !124
  br i1 %20, label %middle.block, label %vector.body, !dbg !124, !llvm.loop !166

middle.block:                                     ; preds = %vector.body
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 4000, !dbg !130
  br i1 %exitcond5.i, label %for.cond1.preheader.i.preheader, label %for.body.i, !dbg !130

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc20.i
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.inc20.i ], [ 0, %for.cond1.preheader.i.preheader ], !dbg !137
  %21 = mul i64 %indvars.iv23.i, 32000, !dbg !132
  %scevgep = getelementptr i8* %call, i64 %21
  %22 = add i64 %21, 31992, !dbg !132
  %scevgep124 = getelementptr i8* %call, i64 %22
  %arrayidx7.i = getelementptr inbounds double* %arraydecay9, i64 %indvars.iv23.i, !dbg !132
  %arrayidx11.i = getelementptr inbounds double* %arraydecay11, i64 %indvars.iv23.i, !dbg !169
  %bc127 = bitcast double* %arrayidx7.i to i8*
  %bound0 = icmp ule i8* %scevgep, %bc127
  %bc = bitcast double* %arrayidx7.i to i8*
  %bound1 = icmp ule i8* %bc, %scevgep124
  %found.conflict = and i1 %bound0, %bound1
  %bound0128 = icmp ule i8* %scevgep, %scevgep125
  %bound1129 = icmp ule i8* %call2, %scevgep124
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx = or i1 %found.conflict, %found.conflict130
  %bc132 = bitcast double* %arrayidx11.i to i8*
  %bound0133 = icmp ule i8* %scevgep, %bc132
  %bc131 = bitcast double* %arrayidx11.i to i8*
  %bound1134 = icmp ule i8* %bc131, %scevgep124
  %found.conflict135 = and i1 %bound0133, %bound1134
  %conflict.rdx136 = or i1 %conflict.rdx, %found.conflict135
  %bound0137 = icmp ule i8* %scevgep, %scevgep126
  %bound1138 = icmp ule i8* %call4, %scevgep124
  %found.conflict139 = and i1 %bound0137, %bound1138
  %conflict.rdx140 = or i1 %conflict.rdx136, %found.conflict139
  br i1 %conflict.rdx140, label %middle.block120, label %vector.body119.preheader

vector.body119.preheader:                         ; preds = %for.cond1.preheader.i
  br label %vector.body119, !dbg !170

vector.body119:                                   ; preds = %vector.body119.preheader, %vector.body119
  %index122 = phi i64 [ %index.next146, %vector.body119 ], [ 0, %vector.body119.preheader ], !dbg !137
  %23 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %index122, !dbg !170
  %24 = bitcast double* %23 to <2 x double>*, !dbg !170
  %wide.load = load <2 x double>* %24, align 8, !dbg !170, !tbaa !142
  %.sum185 = or i64 %index122, 2, !dbg !170
  %25 = getelementptr [4000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %.sum185, !dbg !170
  %26 = bitcast double* %25 to <2 x double>*, !dbg !170
  %wide.load149 = load <2 x double>* %26, align 8, !dbg !170, !tbaa !142
  %27 = load double* %arrayidx7.i, align 8, !dbg !132, !tbaa !142
  %28 = insertelement <2 x double> undef, double %27, i32 0, !dbg !132
  %29 = insertelement <2 x double> %28, double %27, i32 1, !dbg !132
  %30 = insertelement <2 x double> undef, double %27, i32 0, !dbg !132
  %31 = insertelement <2 x double> %30, double %27, i32 1, !dbg !132
  %32 = getelementptr inbounds double* %arraydecay10, i64 %index122, !dbg !171
  %33 = bitcast double* %32 to <2 x double>*, !dbg !171
  %wide.load150 = load <2 x double>* %33, align 8, !dbg !171, !tbaa !142
  %.sum186 = or i64 %index122, 2, !dbg !171
  %34 = getelementptr double* %arraydecay10, i64 %.sum186, !dbg !171
  %35 = bitcast double* %34 to <2 x double>*, !dbg !171
  %wide.load151 = load <2 x double>* %35, align 8, !dbg !171, !tbaa !142
  %36 = fmul <2 x double> %29, %wide.load150, !dbg !132
  %37 = fmul <2 x double> %31, %wide.load151, !dbg !132
  %38 = fadd <2 x double> %wide.load, %36, !dbg !170
  %39 = fadd <2 x double> %wide.load149, %37, !dbg !170
  %40 = load double* %arrayidx11.i, align 8, !dbg !169, !tbaa !142
  %41 = insertelement <2 x double> undef, double %40, i32 0, !dbg !169
  %42 = insertelement <2 x double> %41, double %40, i32 1, !dbg !169
  %43 = insertelement <2 x double> undef, double %40, i32 0, !dbg !169
  %44 = insertelement <2 x double> %43, double %40, i32 1, !dbg !169
  %45 = getelementptr inbounds double* %arraydecay12, i64 %index122, !dbg !172
  %46 = bitcast double* %45 to <2 x double>*, !dbg !172
  %wide.load152 = load <2 x double>* %46, align 8, !dbg !172, !tbaa !142
  %.sum187 = or i64 %index122, 2, !dbg !172
  %47 = getelementptr double* %arraydecay12, i64 %.sum187, !dbg !172
  %48 = bitcast double* %47 to <2 x double>*, !dbg !172
  %wide.load153 = load <2 x double>* %48, align 8, !dbg !172, !tbaa !142
  %49 = fmul <2 x double> %42, %wide.load152, !dbg !169
  %50 = fmul <2 x double> %44, %wide.load153, !dbg !169
  %51 = fadd <2 x double> %38, %49, !dbg !170
  %52 = fadd <2 x double> %39, %50, !dbg !170
  %53 = bitcast double* %23 to <2 x double>*, !dbg !173
  store <2 x double> %51, <2 x double>* %53, align 8, !dbg !173, !tbaa !142
  %54 = bitcast double* %25 to <2 x double>*, !dbg !173
  store <2 x double> %52, <2 x double>* %54, align 8, !dbg !173, !tbaa !142
  %index.next146 = add i64 %index122, 4, !dbg !137
  %55 = icmp eq i64 %index.next146, 4000, !dbg !137
  br i1 %55, label %middle.block120.loopexit, label %vector.body119, !dbg !137, !llvm.loop !174

middle.block120.loopexit:                         ; preds = %vector.body119
  br label %middle.block120

middle.block120:                                  ; preds = %middle.block120.loopexit, %for.cond1.preheader.i
  %resume.val141 = phi i1 [ false, %for.cond1.preheader.i ], [ true, %middle.block120.loopexit ]
  %trunc.resume.val142 = phi i64 [ 0, %for.cond1.preheader.i ], [ 4000, %middle.block120.loopexit ]
  br i1 %resume.val141, label %for.inc20.i, label %for.body3.i.preheader

for.body3.i.preheader:                            ; preds = %middle.block120
  br label %for.body3.i, !dbg !170

for.body3.i:                                      ; preds = %for.body3.i.preheader, %for.body3.i
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.body3.i ], [ %trunc.resume.val142, %for.body3.i.preheader ], !dbg !137
  %arrayidx5.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv20.i, !dbg !170
  %56 = load double* %arrayidx5.i, align 8, !dbg !170, !tbaa !142
  %57 = load double* %arrayidx7.i, align 8, !dbg !132, !tbaa !142
  %arrayidx9.i = getelementptr inbounds double* %arraydecay10, i64 %indvars.iv20.i, !dbg !171
  %58 = load double* %arrayidx9.i, align 8, !dbg !171, !tbaa !142
  %mul.i108 = fmul double %57, %58, !dbg !132
  %add.i = fadd double %56, %mul.i108, !dbg !170
  %59 = load double* %arrayidx11.i, align 8, !dbg !169, !tbaa !142
  %arrayidx13.i = getelementptr inbounds double* %arraydecay12, i64 %indvars.iv20.i, !dbg !172
  %60 = load double* %arrayidx13.i, align 8, !dbg !172, !tbaa !142
  %mul14.i = fmul double %59, %60, !dbg !169
  %add15.i = fadd double %add.i, %mul14.i, !dbg !170
  store double %add15.i, double* %arrayidx5.i, align 8, !dbg !173, !tbaa !142
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !175
  %exitcond22.i = icmp eq i64 %indvars.iv.next21.i, 4000, !dbg !175
  br i1 %exitcond22.i, label %for.inc20.i.loopexit, label %for.body3.i, !dbg !175, !llvm.loop !176

for.inc20.i.loopexit:                             ; preds = %for.body3.i
  br label %for.inc20.i

for.inc20.i:                                      ; preds = %for.inc20.i.loopexit, %middle.block120
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !177
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 4000, !dbg !177
  br i1 %exitcond25.i, label %for.cond26.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !177

for.cond26.preheader.i.preheader:                 ; preds = %for.inc20.i
  br label %for.cond26.preheader.i, !dbg !178

for.cond26.preheader.i:                           ; preds = %for.cond26.preheader.i.preheader, %for.inc45.i
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.inc45.i ], [ 0, %for.cond26.preheader.i.preheader ], !dbg !137
  %arrayidx30.i109 = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv17.i, !dbg !178
  %.pre.i = load double* %arrayidx30.i109, align 8, !dbg !178, !tbaa !142
  br label %for.body28.i, !dbg !183

for.body28.i:                                     ; preds = %for.body28.i, %for.cond26.preheader.i
  %61 = phi double [ %.pre.i, %for.cond26.preheader.i ], [ %add39.i.1, %for.body28.i ], !dbg !178
  %indvars.iv14.i = phi i64 [ 0, %for.cond26.preheader.i ], [ %indvars.iv.next15.i.1, %for.body28.i ], !dbg !137
  %arrayidx34.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv14.i, i64 %indvars.iv17.i, !dbg !184
  %62 = load double* %arrayidx34.i, align 8, !dbg !184, !tbaa !142
  %mul35.i = fmul double %62, 1.231300e+04, !dbg !185
  %arrayidx37.i = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv14.i, !dbg !186
  %63 = load double* %arrayidx37.i, align 8, !dbg !186, !tbaa !142
  %mul38.i = fmul double %mul35.i, %63, !dbg !185
  %add39.i = fadd double %61, %mul38.i, !dbg !178
  store double %add39.i, double* %arrayidx30.i109, align 8, !dbg !187, !tbaa !142
  %indvars.iv.next15.i = add nuw nsw i64 %indvars.iv14.i, 1, !dbg !183
  %arrayidx34.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv.next15.i, i64 %indvars.iv17.i, !dbg !184
  %64 = load double* %arrayidx34.i.1, align 8, !dbg !184, !tbaa !142
  %mul35.i.1 = fmul double %64, 1.231300e+04, !dbg !185
  %arrayidx37.i.1 = getelementptr inbounds double* %arraydecay15, i64 %indvars.iv.next15.i, !dbg !186
  %65 = load double* %arrayidx37.i.1, align 8, !dbg !186, !tbaa !142
  %mul38.i.1 = fmul double %mul35.i.1, %65, !dbg !185
  %add39.i.1 = fadd double %add39.i, %mul38.i.1, !dbg !178
  store double %add39.i.1, double* %arrayidx30.i109, align 8, !dbg !187, !tbaa !142
  %indvars.iv.next15.i.1 = add nuw nsw i64 %indvars.iv.next15.i, 1, !dbg !183
  %exitcond16.i.1 = icmp eq i64 %indvars.iv.next15.i.1, 4000, !dbg !183
  br i1 %exitcond16.i.1, label %for.inc45.i, label %for.body28.i, !dbg !183

for.inc45.i:                                      ; preds = %for.body28.i
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1, !dbg !188
  %exitcond19.i = icmp eq i64 %indvars.iv.next18.i, 4000, !dbg !188
  br i1 %exitcond19.i, label %vector.memcheck168, label %for.cond26.preheader.i, !dbg !188

vector.memcheck168:                               ; preds = %for.inc45.i
  %scevgep163 = getelementptr i8* %call8, i64 31992
  %bound0164 = icmp ule i8* %call6, %scevgep163
  %scevgep162 = getelementptr i8* %call6, i64 31992
  %bound1165 = icmp ule i8* %call8, %scevgep162
  %memcheck.conflict167 = and i1 %bound0164, %bound1165
  br i1 %memcheck.conflict167, label %middle.block158, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %vector.memcheck168
  br label %vector.body157, !dbg !189

vector.body157:                                   ; preds = %vector.body157.preheader, %vector.body157
  %index160 = phi i64 [ %index.next174, %vector.body157 ], [ 0, %vector.body157.preheader ], !dbg !137
  %66 = getelementptr inbounds double* %arraydecay14, i64 %index160, !dbg !189
  %67 = bitcast double* %66 to <2 x double>*, !dbg !189
  %wide.load179 = load <2 x double>* %67, align 8, !dbg !189, !tbaa !142
  %.sum188 = or i64 %index160, 2, !dbg !189
  %68 = getelementptr double* %arraydecay14, i64 %.sum188, !dbg !189
  %69 = bitcast double* %68 to <2 x double>*, !dbg !189
  %wide.load180 = load <2 x double>* %69, align 8, !dbg !189, !tbaa !142
  %70 = getelementptr inbounds double* %arraydecay16, i64 %index160, !dbg !192
  %71 = bitcast double* %70 to <2 x double>*, !dbg !192
  %wide.load181 = load <2 x double>* %71, align 8, !dbg !192, !tbaa !142
  %.sum189 = or i64 %index160, 2, !dbg !192
  %72 = getelementptr double* %arraydecay16, i64 %.sum189, !dbg !192
  %73 = bitcast double* %72 to <2 x double>*, !dbg !192
  %wide.load182 = load <2 x double>* %73, align 8, !dbg !192, !tbaa !142
  %74 = fadd <2 x double> %wide.load179, %wide.load181, !dbg !189
  %75 = fadd <2 x double> %wide.load180, %wide.load182, !dbg !189
  %76 = bitcast double* %66 to <2 x double>*, !dbg !193
  store <2 x double> %74, <2 x double>* %76, align 8, !dbg !193, !tbaa !142
  %77 = bitcast double* %68 to <2 x double>*, !dbg !193
  store <2 x double> %75, <2 x double>* %77, align 8, !dbg !193, !tbaa !142
  %index.next174 = add i64 %index160, 4, !dbg !137
  %78 = icmp eq i64 %index.next174, 4000, !dbg !137
  br i1 %78, label %middle.block158.loopexit, label %vector.body157, !dbg !137, !llvm.loop !194

middle.block158.loopexit:                         ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %middle.block158.loopexit, %vector.memcheck168
  %resume.val169 = phi i1 [ false, %vector.memcheck168 ], [ true, %middle.block158.loopexit ]
  %trunc.resume.val170 = phi i64 [ 0, %vector.memcheck168 ], [ 4000, %middle.block158.loopexit ]
  br i1 %resume.val169, label %for.cond64.preheader.i.preheader, label %for.body50.i.preheader

for.body50.i.preheader:                           ; preds = %middle.block158
  %79 = sub i64 4000, %trunc.resume.val170
  %xtraiter = and i64 %79, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %79, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body50.i.prol, label %for.body50.i.preheader.split

for.body50.i.prol:                                ; preds = %for.body50.i.prol, %for.body50.i.preheader
  %indvars.iv11.i.prol = phi i64 [ %indvars.iv.next12.i.prol, %for.body50.i.prol ], [ %trunc.resume.val170, %for.body50.i.preheader ], !dbg !137
  %prol.iter = phi i64 [ %xtraiter, %for.body50.i.preheader ], [ %prol.iter.sub, %for.body50.i.prol ]
  %arrayidx52.i.prol = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv11.i.prol, !dbg !189
  %80 = load double* %arrayidx52.i.prol, align 8, !dbg !189, !tbaa !142
  %arrayidx54.i.prol = getelementptr inbounds double* %arraydecay16, i64 %indvars.iv11.i.prol, !dbg !192
  %81 = load double* %arrayidx54.i.prol, align 8, !dbg !192, !tbaa !142
  %add55.i.prol = fadd double %80, %81, !dbg !189
  store double %add55.i.prol, double* %arrayidx52.i.prol, align 8, !dbg !193, !tbaa !142
  %indvars.iv.next12.i.prol = add nuw nsw i64 %indvars.iv11.i.prol, 1, !dbg !195
  %exitcond13.i.prol = icmp eq i64 %indvars.iv.next12.i.prol, 4000, !dbg !195
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !195
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !195
  br i1 %prol.iter.cmp, label %for.body50.i.prol, label %for.body50.i.preheader.split, !llvm.loop !196

for.body50.i.preheader.split:                     ; preds = %for.body50.i.prol, %for.body50.i.preheader
  %indvars.iv11.i.unr = phi i64 [ %trunc.resume.val170, %for.body50.i.preheader ], [ %indvars.iv.next12.i.prol, %for.body50.i.prol ]
  %82 = icmp ult i64 %79, 2
  br i1 %82, label %for.cond64.preheader.i.preheader.loopexit, label %for.body50.i.preheader.split.split

for.body50.i.preheader.split.split:               ; preds = %for.body50.i.preheader.split
  br label %for.body50.i, !dbg !189

for.body50.i:                                     ; preds = %for.body50.i, %for.body50.i.preheader.split.split
  %indvars.iv11.i = phi i64 [ %indvars.iv11.i.unr, %for.body50.i.preheader.split.split ], [ %indvars.iv.next12.i.1, %for.body50.i ], !dbg !137
  %arrayidx52.i = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv11.i, !dbg !189
  %83 = load double* %arrayidx52.i, align 8, !dbg !189, !tbaa !142
  %arrayidx54.i = getelementptr inbounds double* %arraydecay16, i64 %indvars.iv11.i, !dbg !192
  %84 = load double* %arrayidx54.i, align 8, !dbg !192, !tbaa !142
  %add55.i = fadd double %83, %84, !dbg !189
  store double %add55.i, double* %arrayidx52.i, align 8, !dbg !193, !tbaa !142
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !195
  %arrayidx52.i.1 = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv.next12.i, !dbg !189
  %85 = load double* %arrayidx52.i.1, align 8, !dbg !189, !tbaa !142
  %arrayidx54.i.1 = getelementptr inbounds double* %arraydecay16, i64 %indvars.iv.next12.i, !dbg !192
  %86 = load double* %arrayidx54.i.1, align 8, !dbg !192, !tbaa !142
  %add55.i.1 = fadd double %85, %86, !dbg !189
  store double %add55.i.1, double* %arrayidx52.i.1, align 8, !dbg !193, !tbaa !142
  %indvars.iv.next12.i.1 = add nuw nsw i64 %indvars.iv.next12.i, 1, !dbg !195
  %exitcond13.i.1 = icmp eq i64 %indvars.iv.next12.i.1, 4000, !dbg !195
  br i1 %exitcond13.i.1, label %for.cond64.preheader.i.preheader.loopexit.unr-lcssa, label %for.body50.i, !dbg !195, !llvm.loop !198

for.cond64.preheader.i.preheader.loopexit.unr-lcssa: ; preds = %for.body50.i
  br label %for.cond64.preheader.i.preheader.loopexit

for.cond64.preheader.i.preheader.loopexit:        ; preds = %for.body50.i.preheader.split, %for.cond64.preheader.i.preheader.loopexit.unr-lcssa
  br label %for.cond64.preheader.i.preheader

for.cond64.preheader.i.preheader:                 ; preds = %for.cond64.preheader.i.preheader.loopexit, %middle.block158
  br label %for.cond64.preheader.i, !dbg !199

for.cond64.preheader.i:                           ; preds = %for.cond64.preheader.i.preheader, %for.inc83.i
  %indvars.iv8.i = phi i64 [ %indvars.iv.next9.i, %for.inc83.i ], [ 0, %for.cond64.preheader.i.preheader ], !dbg !137
  %arrayidx68.i = getelementptr inbounds double* %arraydecay13, i64 %indvars.iv8.i, !dbg !199
  %.pre26.i = load double* %arrayidx68.i, align 8, !dbg !199, !tbaa !142
  br label %for.body66.i, !dbg !204

for.body66.i:                                     ; preds = %for.body66.i, %for.cond64.preheader.i
  %87 = phi double [ %.pre26.i, %for.cond64.preheader.i ], [ %add77.i.1, %for.body66.i ], !dbg !199
  %indvars.iv.i110 = phi i64 [ 0, %for.cond64.preheader.i ], [ %indvars.iv.next.i111.1, %for.body66.i ], !dbg !137
  %arrayidx72.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.i110, !dbg !205
  %88 = load double* %arrayidx72.i, align 8, !dbg !205, !tbaa !142
  %mul73.i = fmul double %88, 4.353200e+04, !dbg !206
  %arrayidx75.i = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv.i110, !dbg !207
  %89 = load double* %arrayidx75.i, align 8, !dbg !207, !tbaa !142
  %mul76.i = fmul double %mul73.i, %89, !dbg !206
  %add77.i = fadd double %87, %mul76.i, !dbg !199
  store double %add77.i, double* %arrayidx68.i, align 8, !dbg !208, !tbaa !142
  %indvars.iv.next.i111 = add nuw nsw i64 %indvars.iv.i110, 1, !dbg !204
  %arrayidx72.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.next.i111, !dbg !205
  %90 = load double* %arrayidx72.i.1, align 8, !dbg !205, !tbaa !142
  %mul73.i.1 = fmul double %90, 4.353200e+04, !dbg !206
  %arrayidx75.i.1 = getelementptr inbounds double* %arraydecay14, i64 %indvars.iv.next.i111, !dbg !207
  %91 = load double* %arrayidx75.i.1, align 8, !dbg !207, !tbaa !142
  %mul76.i.1 = fmul double %mul73.i.1, %91, !dbg !206
  %add77.i.1 = fadd double %add77.i, %mul76.i.1, !dbg !199
  store double %add77.i.1, double* %arrayidx68.i, align 8, !dbg !208, !tbaa !142
  %indvars.iv.next.i111.1 = add nuw nsw i64 %indvars.iv.next.i111, 1, !dbg !204
  %exitcond.i112.1 = icmp eq i64 %indvars.iv.next.i111.1, 4000, !dbg !204
  br i1 %exitcond.i112.1, label %for.inc83.i, label %for.body66.i, !dbg !204

for.inc83.i:                                      ; preds = %for.body66.i
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !209
  %exitcond10.i = icmp eq i64 %indvars.iv.next9.i, 4000, !dbg !209
  br i1 %exitcond10.i, label %kernel_gemver.exit, label %for.cond64.preheader.i, !dbg !209

kernel_gemver.exit:                               ; preds = %for.inc83.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !210
  br i1 %cmp, label %if.end62, label %if.end69, !dbg !211

if.end62:                                         ; preds = %kernel_gemver.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !101), !dbg !212
  tail call void @llvm.dbg.value(metadata i8* %92, i64 0, metadata !51, metadata !101), !dbg !213
  %92 = load i8** %argv, align 8, !dbg !214, !tbaa !216
  %93 = load i8* %92, align 1, !dbg !214, !tbaa !218
  %phitmp = icmp eq i8 %93, 0, !dbg !212
  br i1 %phitmp, label %for.body.i105.preheader, label %if.end69, !dbg !211

for.body.i105.preheader:                          ; preds = %if.end62
  br label %for.body.i105, !dbg !219

for.body.i105:                                    ; preds = %for.body.i105.preheader, %for.inc.i
  %indvars.iv.i103 = phi i64 [ %indvars.iv.next.i106, %for.inc.i ], [ 0, %for.body.i105.preheader ], !dbg !223
  %94 = load %struct._IO_FILE** @stderr, align 8, !dbg !219, !tbaa !216
  %arrayidx.i104 = getelementptr inbounds double* %arraydecay13, i64 %indvars.iv.i103, !dbg !225
  %95 = load double* %arrayidx.i104, align 8, !dbg !225, !tbaa !142
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %95) #5, !dbg !226
  %96 = trunc i64 %indvars.iv.i103 to i32, !dbg !227
  %rem.i = srem i32 %96, 20, !dbg !227
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !227
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !229

if.then.i:                                        ; preds = %for.body.i105
  %97 = load %struct._IO_FILE** @stderr, align 8, !dbg !230, !tbaa !216
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %97) #5, !dbg !232
  br label %for.inc.i, !dbg !232

for.inc.i:                                        ; preds = %if.then.i, %for.body.i105
  %indvars.iv.next.i106 = add nuw nsw i64 %indvars.iv.i103, 1, !dbg !233
  %exitcond.i107 = icmp eq i64 %indvars.iv.next.i106, 4000, !dbg !233
  br i1 %exitcond.i107, label %if.end69.loopexit, label %for.body.i105, !dbg !233

if.end69.loopexit:                                ; preds = %for.inc.i
  br label %if.end69

if.end69:                                         ; preds = %if.end69.loopexit, %if.end62, %kernel_gemver.exit
  tail call void @free(i8* %call) #4, !dbg !234
  tail call void @free(i8* %call1) #4, !dbg !235
  tail call void @free(i8* %call2) #4, !dbg !236
  tail call void @free(i8* %call3) #4, !dbg !237
  tail call void @free(i8* %call4) #4, !dbg !238
  tail call void @free(i8* %call5) #4, !dbg !239
  tail call void @free(i8* %call6) #4, !dbg !240
  tail call void @free(i8* %call7) #4, !dbg !241
  tail call void @free(i8* %call8) #4, !dbg !242
  ret i32 0, !dbg !243
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!98, !99}
!llvm.ident = !{!100}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c] [DW_LANG_C99]
!1 = !{!"gemver.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\001024000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\004000"}                        ; [ DW_TAG_subrange_type ] [0, 3999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\00256000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver"}
!14 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!19 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!"0x26\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!22 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!25, !54, !62, !80}
!25 = !{!"0x2e\00main\00main\00\00111\000\001\000\000\00256\001\00112", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 111] [def] [scope 112] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !50, !51, !53}
!33 = !{!"0x101\00argc\0016777327\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 111]
!34 = !{!"0x101\00argv\0033554543\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 111]
!35 = !{!"0x100\00n\00114\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [n] [line 114]
!36 = !{!"0x100\00alpha\00117\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [alpha] [line 117]
!37 = !{!"0x100\00beta\00118\000", !25, !26, !6}  ; [ DW_TAG_auto_variable ] [beta] [line 118]
!38 = !{!"0x100\00A\00119\000", !25, !26, !4}     ; [ DW_TAG_auto_variable ] [A] [line 119]
!39 = !{!"0x100\00u1\00120\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [u1] [line 120]
!40 = !{!"0x100\00v1\00121\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [v1] [line 121]
!41 = !{!"0x100\00u2\00122\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [u2] [line 122]
!42 = !{!"0x100\00v2\00123\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [v2] [line 123]
!43 = !{!"0x100\00w\00124\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [w] [line 124]
!44 = !{!"0x100\00x\00125\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [x] [line 125]
!45 = !{!"0x100\00y\00126\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [y] [line 126]
!46 = !{!"0x100\00z\00127\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [z] [line 127]
!47 = !{!"0x100\00__s1_len\00163\000", !48, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 163]
!48 = !{!"0xb\00163\003\001", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!49 = !{!"0xb\00163\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!50 = !{!"0x100\00__s2_len\00163\000", !48, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 163]
!51 = !{!"0x100\00__s2\00163\000", !52, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 163]
!52 = !{!"0xb\00163\003\002", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!53 = !{!"0x100\00__result\00163\000", !52, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 163]
!54 = !{!"0x2e\00print_array\00print_array\00\0060\001\001\000\000\00256\001\0062", !1, !26, !55, null, null, null, null, !58} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 62] [print_array]
!55 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !56, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = !{null, !29, !57}
!57 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!58 = !{!59, !60, !61}
!59 = !{!"0x101\00n\0016777276\000", !54, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 60]
!60 = !{!"0x101\00w\0033554493\000", !54, !26, !57} ; [ DW_TAG_arg_variable ] [w] [line 61]
!61 = !{!"0x100\00i\0063\000", !54, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 63]
!62 = !{!"0x2e\00kernel_gemver\00kernel_gemver\00\0075\001\001\000\000\00256\001\0087", !1, !26, !63, null, null, null, null, !65} ; [ DW_TAG_subprogram ] [line 75] [local] [def] [scope 87] [kernel_gemver]
!63 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !64, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = !{null, !29, !6, !6, !9, !57, !57, !57, !57, !57, !57, !57, !57}
!65 = !{!66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79}
!66 = !{!"0x101\00n\0016777291\000", !62, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 75]
!67 = !{!"0x101\00alpha\0033554508\000", !62, !26, !6} ; [ DW_TAG_arg_variable ] [alpha] [line 76]
!68 = !{!"0x101\00beta\0050331725\000", !62, !26, !6} ; [ DW_TAG_arg_variable ] [beta] [line 77]
!69 = !{!"0x101\00A\0067108942\000", !62, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 78]
!70 = !{!"0x101\00u1\0083886159\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [u1] [line 79]
!71 = !{!"0x101\00v1\00100663376\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [v1] [line 80]
!72 = !{!"0x101\00u2\00117440593\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [u2] [line 81]
!73 = !{!"0x101\00v2\00134217810\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [v2] [line 82]
!74 = !{!"0x101\00w\00150995027\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [w] [line 83]
!75 = !{!"0x101\00x\00167772244\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [x] [line 84]
!76 = !{!"0x101\00y\00184549461\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [y] [line 85]
!77 = !{!"0x101\00z\00201326678\000", !62, !26, !57} ; [ DW_TAG_arg_variable ] [z] [line 86]
!78 = !{!"0x100\00i\0088\000", !62, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 88]
!79 = !{!"0x100\00j\0088\000", !62, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 88]
!80 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0035", !1, !26, !81, null, null, null, null, !83} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 35] [init_array]
!81 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !82, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = !{null, !29, !57, !57, !9, !57, !57, !57, !57, !57, !57, !57, !57}
!83 = !{!84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97}
!84 = !{!"0x101\00n\0016777239\000", !80, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!85 = !{!"0x101\00alpha\0033554456\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [alpha] [line 24]
!86 = !{!"0x101\00beta\0050331673\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [beta] [line 25]
!87 = !{!"0x101\00A\0067108890\000", !80, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 26]
!88 = !{!"0x101\00u1\0083886107\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [u1] [line 27]
!89 = !{!"0x101\00v1\00100663324\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [v1] [line 28]
!90 = !{!"0x101\00u2\00117440541\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [u2] [line 29]
!91 = !{!"0x101\00v2\00134217758\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [v2] [line 30]
!92 = !{!"0x101\00w\00150994975\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [w] [line 31]
!93 = !{!"0x101\00x\00167772192\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [x] [line 32]
!94 = !{!"0x101\00y\00184549409\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [y] [line 33]
!95 = !{!"0x101\00z\00201326626\000", !80, !26, !57} ; [ DW_TAG_arg_variable ] [z] [line 34]
!96 = !{!"0x100\00i\0036\000", !80, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 36]
!97 = !{!"0x100\00j\0036\000", !80, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 36]
!98 = !{i32 2, !"Dwarf Version", i32 4}
!99 = !{i32 2, !"Debug Info Version", i32 2}
!100 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!101 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!102 = !MDLocation(line: 111, column: 14, scope: !25)
!103 = !MDLocation(line: 111, column: 27, scope: !25)
!104 = !MDLocation(line: 114, column: 7, scope: !25)
!105 = !MDLocation(line: 119, column: 3, scope: !25)
!106 = !MDLocation(line: 120, column: 3, scope: !25)
!107 = !MDLocation(line: 121, column: 3, scope: !25)
!108 = !MDLocation(line: 122, column: 3, scope: !25)
!109 = !MDLocation(line: 123, column: 3, scope: !25)
!110 = !MDLocation(line: 124, column: 3, scope: !25)
!111 = !MDLocation(line: 125, column: 3, scope: !25)
!112 = !MDLocation(line: 126, column: 3, scope: !25)
!113 = !MDLocation(line: 127, column: 3, scope: !25)
!114 = !MDLocation(line: 132, column: 8, scope: !25)
!115 = !MDLocation(line: 133, column: 8, scope: !25)
!116 = !MDLocation(line: 134, column: 8, scope: !25)
!117 = !MDLocation(line: 135, column: 8, scope: !25)
!118 = !MDLocation(line: 136, column: 8, scope: !25)
!119 = !MDLocation(line: 137, column: 8, scope: !25)
!120 = !MDLocation(line: 138, column: 8, scope: !25)
!121 = !MDLocation(line: 139, column: 8, scope: !25)
!122 = !MDLocation(line: 140, column: 8, scope: !25)
!123 = !{!"0x101\00n\0016777239\000", !80, !26, !29, !124} ; [ DW_TAG_arg_variable ] [n] [line 23]
!124 = !MDLocation(line: 131, column: 3, scope: !25)
!125 = !MDLocation(line: 23, column: 22, scope: !80, inlinedAt: !124)
!126 = !MDLocation(line: 117, column: 13, scope: !25)
!127 = !MDLocation(line: 118, column: 13, scope: !25)
!128 = !{!"0x100\00i\0036\000", !80, !26, !29, !124} ; [ DW_TAG_auto_variable ] [i] [line 36]
!129 = !MDLocation(line: 36, column: 7, scope: !80, inlinedAt: !124)
!130 = !MDLocation(line: 41, column: 3, scope: !131, inlinedAt: !124)
!131 = !{!"0xb\0041\003\0026", !1, !80}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!132 = !MDLocation(line: 94, column: 27, scope: !133, inlinedAt: !137)
!133 = !{!"0xb\0093\005\0015", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!134 = !{!"0xb\0093\005\0014", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!135 = !{!"0xb\0092\003\0013", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!136 = !{!"0xb\0092\003\0012", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!137 = !MDLocation(line: 146, column: 3, scope: !25)
!138 = !MDLocation(line: 43, column: 15, scope: !139, inlinedAt: !124)
!139 = !{!"0xb\0042\005\0028", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!140 = !{!"0xb\0041\003\0027", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!141 = !MDLocation(line: 43, column: 7, scope: !139, inlinedAt: !124)
!142 = !{!143, !143, i64 0}
!143 = !{!"double", !144, i64 0}
!144 = !{!"omnipotent char", !145, i64 0}
!145 = !{!"Simple C/C++ TBAA"}
!146 = !MDLocation(line: 44, column: 15, scope: !139, inlinedAt: !124)
!147 = !MDLocation(line: 44, column: 7, scope: !139, inlinedAt: !124)
!148 = !MDLocation(line: 45, column: 15, scope: !139, inlinedAt: !124)
!149 = !MDLocation(line: 45, column: 7, scope: !139, inlinedAt: !124)
!150 = !MDLocation(line: 46, column: 15, scope: !139, inlinedAt: !124)
!151 = !MDLocation(line: 46, column: 7, scope: !139, inlinedAt: !124)
!152 = !MDLocation(line: 47, column: 14, scope: !139, inlinedAt: !124)
!153 = !MDLocation(line: 47, column: 7, scope: !139, inlinedAt: !124)
!154 = !MDLocation(line: 48, column: 14, scope: !139, inlinedAt: !124)
!155 = !MDLocation(line: 48, column: 7, scope: !139, inlinedAt: !124)
!156 = !MDLocation(line: 49, column: 7, scope: !139, inlinedAt: !124)
!157 = !MDLocation(line: 50, column: 7, scope: !139, inlinedAt: !124)
!158 = !{!"0x100\00j\0036\000", !80, !26, !29, !124} ; [ DW_TAG_auto_variable ] [j] [line 36]
!159 = !MDLocation(line: 36, column: 10, scope: !80, inlinedAt: !124)
!160 = !MDLocation(line: 52, column: 27, scope: !161, inlinedAt: !124)
!161 = !{!"0xb\0051\007\0030", !1, !162}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!162 = !{!"0xb\0051\007\0029", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!163 = !MDLocation(line: 52, column: 13, scope: !161, inlinedAt: !124)
!164 = !MDLocation(line: 52, column: 12, scope: !161, inlinedAt: !124)
!165 = !MDLocation(line: 52, column: 2, scope: !161, inlinedAt: !124)
!166 = distinct !{!166, !167, !168}
!167 = !{!"llvm.loop.vectorize.width", i32 1}
!168 = !{!"llvm.loop.interleave.count", i32 1}
!169 = !MDLocation(line: 94, column: 43, scope: !133, inlinedAt: !137)
!170 = !MDLocation(line: 94, column: 17, scope: !133, inlinedAt: !137)
!171 = !MDLocation(line: 94, column: 35, scope: !133, inlinedAt: !137)
!172 = !MDLocation(line: 94, column: 51, scope: !133, inlinedAt: !137)
!173 = !MDLocation(line: 94, column: 7, scope: !133, inlinedAt: !137)
!174 = distinct !{!174, !167, !168}
!175 = !MDLocation(line: 93, column: 5, scope: !134, inlinedAt: !137)
!176 = distinct !{!176, !167, !168}
!177 = !MDLocation(line: 92, column: 3, scope: !136, inlinedAt: !137)
!178 = !MDLocation(line: 98, column: 14, scope: !179, inlinedAt: !137)
!179 = !{!"0xb\0097\005\0019", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!180 = !{!"0xb\0097\005\0018", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!181 = !{!"0xb\0096\003\0017", !1, !182}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!182 = !{!"0xb\0096\003\0016", !1, !62}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!183 = !MDLocation(line: 97, column: 5, scope: !180, inlinedAt: !137)
!184 = !MDLocation(line: 98, column: 28, scope: !179, inlinedAt: !137)
!185 = !MDLocation(line: 98, column: 21, scope: !179, inlinedAt: !137)
!186 = !MDLocation(line: 98, column: 38, scope: !179, inlinedAt: !137)
!187 = !MDLocation(line: 98, column: 7, scope: !179, inlinedAt: !137)
!188 = !MDLocation(line: 96, column: 3, scope: !182, inlinedAt: !137)
!189 = !MDLocation(line: 101, column: 12, scope: !190, inlinedAt: !137)
!190 = !{!"0xb\00100\003\0021", !1, !191}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!191 = !{!"0xb\00100\003\0020", !1, !62}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!192 = !MDLocation(line: 101, column: 19, scope: !190, inlinedAt: !137)
!193 = !MDLocation(line: 101, column: 5, scope: !190, inlinedAt: !137)
!194 = distinct !{!194, !167, !168}
!195 = !MDLocation(line: 100, column: 3, scope: !191, inlinedAt: !137)
!196 = distinct !{!196, !197}
!197 = !{!"llvm.loop.unroll.disable"}
!198 = distinct !{!198, !167, !168}
!199 = !MDLocation(line: 105, column: 14, scope: !200, inlinedAt: !137)
!200 = !{!"0xb\00104\005\0025", !1, !201}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!201 = !{!"0xb\00104\005\0024", !1, !202}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!202 = !{!"0xb\00103\003\0023", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!203 = !{!"0xb\00103\003\0022", !1, !62}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!204 = !MDLocation(line: 104, column: 5, scope: !201, inlinedAt: !137)
!205 = !MDLocation(line: 105, column: 30, scope: !200, inlinedAt: !137)
!206 = !MDLocation(line: 105, column: 22, scope: !200, inlinedAt: !137)
!207 = !MDLocation(line: 105, column: 40, scope: !200, inlinedAt: !137)
!208 = !MDLocation(line: 105, column: 7, scope: !200, inlinedAt: !137)
!209 = !MDLocation(line: 103, column: 3, scope: !203, inlinedAt: !137)
!210 = !MDLocation(line: 163, column: 3, scope: !49)
!211 = !MDLocation(line: 163, column: 3, scope: !25)
!212 = !MDLocation(line: 163, column: 3, scope: !48)
!213 = !MDLocation(line: 163, column: 3, scope: !52)
!214 = !MDLocation(line: 163, column: 3, scope: !215)
!215 = !{!"0xb\004", !1, !52}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!216 = !{!217, !217, i64 0}
!217 = !{!"any pointer", !144, i64 0}
!218 = !{!144, !144, i64 0}
!219 = !MDLocation(line: 66, column: 14, scope: !220, inlinedAt: !223)
!220 = !{!"0xb\0065\0027\0010", !1, !221}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!221 = !{!"0xb\0065\003\009", !1, !222}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!222 = !{!"0xb\0065\003\008", !1, !54}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!223 = !MDLocation(line: 163, column: 3, scope: !224)
!224 = !{!"0xb\0023", !1, !49}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!225 = !MDLocation(line: 66, column: 44, scope: !220, inlinedAt: !223)
!226 = !MDLocation(line: 66, column: 5, scope: !220, inlinedAt: !223)
!227 = !MDLocation(line: 67, column: 9, scope: !228, inlinedAt: !223)
!228 = !{!"0xb\0067\009\0011", !1, !220}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!229 = !MDLocation(line: 67, column: 9, scope: !220, inlinedAt: !223)
!230 = !MDLocation(line: 67, column: 31, scope: !231, inlinedAt: !223)
!231 = !{!"0xb\001", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/gemver/gemver.c]
!232 = !MDLocation(line: 67, column: 22, scope: !228, inlinedAt: !223)
!233 = !MDLocation(line: 65, column: 3, scope: !222, inlinedAt: !223)
!234 = !MDLocation(line: 166, column: 3, scope: !25)
!235 = !MDLocation(line: 167, column: 3, scope: !25)
!236 = !MDLocation(line: 168, column: 3, scope: !25)
!237 = !MDLocation(line: 169, column: 3, scope: !25)
!238 = !MDLocation(line: 170, column: 3, scope: !25)
!239 = !MDLocation(line: 171, column: 3, scope: !25)
!240 = !MDLocation(line: 172, column: 3, scope: !25)
!241 = !MDLocation(line: 173, column: 3, scope: !25)
!242 = !MDLocation(line: 174, column: 3, scope: !25)
!243 = !MDLocation(line: 176, column: 3, scope: !25)
