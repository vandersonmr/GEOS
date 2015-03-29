; ModuleID = 'adi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !30, metadata !80), !dbg !81
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !31, metadata !80), !dbg !82
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !32, metadata !80), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !33, metadata !80), !dbg !84
  %call = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !85
  %call1 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !86
  %call2 = tail call i8* @polybench_alloc_data(i32 1048576, i32 8) #4, !dbg !87
  %arraydecay = bitcast i8* %call to [1024 x double]*, !dbg !88
  %arraydecay3 = bitcast i8* %call1 to [1024 x double]*, !dbg !89
  %arraydecay4 = bitcast i8* %call2 to [1024 x double]*, !dbg !90
  tail call void @llvm.dbg.value(metadata i32 1024, i64 0, metadata !91, metadata !80), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !94, metadata !80), !dbg !95
  br label %for.cond1.preheader.i, !dbg !96

for.cond1.preheader.i:                            ; preds = %for.inc31.i, %entry
  %indvars.iv5.i = phi i64 [ 0, %entry ], [ %indvars.iv.next6.i, %for.inc31.i ], !dbg !92
  %0 = trunc i64 %indvars.iv5.i to i32, !dbg !98
  %conv.i = sitofp i32 %0 to double, !dbg !98
  br label %for.body3.i, !dbg !103

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ], !dbg !92
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !103
  %1 = trunc i64 %indvars.iv.next.i to i32, !dbg !104
  %conv4.i = sitofp i32 %1 to double, !dbg !104
  %mul.i = fmul double %conv.i, %conv4.i, !dbg !98
  %add5.i = fadd double %mul.i, 1.000000e+00, !dbg !98
  %div.i = fmul double %add5.i, 9.765625e-04, !dbg !105
  %arrayidx8.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv5.i, i64 %indvars.iv.i, !dbg !106
  store double %div.i, double* %arrayidx8.i, align 8, !dbg !106, !tbaa !107
  %2 = add nuw nsw i64 %indvars.iv.i, 2, !dbg !111
  %3 = trunc i64 %2 to i32, !dbg !112
  %conv11.i = sitofp i32 %3 to double, !dbg !112
  %mul12.i = fmul double %conv.i, %conv11.i, !dbg !113
  %add13.i = fadd double %mul12.i, 2.000000e+00, !dbg !113
  %div15.i = fmul double %add13.i, 9.765625e-04, !dbg !114
  %arrayidx19.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv5.i, i64 %indvars.iv.i, !dbg !115
  store double %div15.i, double* %arrayidx19.i, align 8, !dbg !115, !tbaa !107
  %4 = add nuw nsw i64 %indvars.iv.i, 3, !dbg !116
  %5 = trunc i64 %4 to i32, !dbg !117
  %conv22.i = sitofp i32 %5 to double, !dbg !117
  %mul23.i = fmul double %conv.i, %conv22.i, !dbg !118
  %add24.i = fadd double %mul23.i, 3.000000e+00, !dbg !118
  %div26.i = fmul double %add24.i, 9.765625e-04, !dbg !119
  %arrayidx30.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv5.i, i64 %indvars.iv.i, !dbg !120
  store double %div26.i, double* %arrayidx30.i, align 8, !dbg !120, !tbaa !107
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1024, !dbg !103
  br i1 %exitcond.i, label %for.inc31.i, label %for.body3.i, !dbg !103

for.inc31.i:                                      ; preds = %for.body3.i
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv5.i, 1, !dbg !96
  %exitcond7.i = icmp eq i64 %indvars.iv.next6.i, 1024, !dbg !96
  br i1 %exitcond7.i, label %for.cond1.preheader.i78.preheader, label %for.cond1.preheader.i, !dbg !96

for.cond1.preheader.i78.preheader:                ; preds = %for.inc31.i
  %scevgep107 = getelementptr i8* %call, i64 8380416
  %scevgep108 = getelementptr i8* %call, i64 8388600
  %scevgep109 = getelementptr i8* %call2, i64 8380416
  %scevgep110 = getelementptr i8* %call2, i64 8388600
  br label %for.cond1.preheader.i78, !dbg !121

for.cond1.preheader.i78:                          ; preds = %for.cond1.preheader.i78.preheader, %for.inc252.i
  %t.011.i = phi i32 [ %inc253.i, %for.inc252.i ], [ 0, %for.cond1.preheader.i78.preheader ], !dbg !126
  br label %for.cond4.preheader.i, !dbg !121

for.cond4.preheader.i:                            ; preds = %for.inc51.i, %for.cond1.preheader.i78
  %indvars.iv13.i = phi i64 [ 0, %for.cond1.preheader.i78 ], [ %indvars.iv.next14.i, %for.inc51.i ], !dbg !126
  %arrayidx21.phi.trans.insert.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv13.i, i64 0, !dbg !126
  %.pre.i = load double* %arrayidx21.phi.trans.insert.i, align 8, !dbg !127, !tbaa !107
  br label %for.body6.i, !dbg !132

for.body6.i:                                      ; preds = %for.body6.i, %for.cond4.preheader.i
  %6 = phi double [ %.pre.i, %for.cond4.preheader.i ], [ %sub46.i, %for.body6.i ], !dbg !133
  %indvars.iv.i79 = phi i64 [ 1, %for.cond4.preheader.i ], [ %indvars.iv.next.i84, %for.body6.i ], !dbg !126
  %arrayidx8.i80 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv13.i, i64 %indvars.iv.i79, !dbg !133
  %7 = load double* %arrayidx8.i80, align 8, !dbg !133, !tbaa !107
  %8 = add nsw i64 %indvars.iv.i79, -1, !dbg !134
  %arrayidx12.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv13.i, i64 %8, !dbg !135
  %9 = load double* %arrayidx12.i, align 8, !dbg !135, !tbaa !107
  %arrayidx16.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv13.i, i64 %indvars.iv.i79, !dbg !136
  %10 = load double* %arrayidx16.i, align 8, !dbg !136, !tbaa !107
  %mul.i81 = fmul double %9, %10, !dbg !135
  %arrayidx21.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv13.i, i64 %8, !dbg !127
  %div.i82 = fdiv double %mul.i81, %6, !dbg !135
  %sub22.i = fsub double %7, %div.i82, !dbg !133
  store double %sub22.i, double* %arrayidx8.i80, align 8, !dbg !137, !tbaa !107
  %arrayidx30.i83 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv13.i, i64 %indvars.iv.i79, !dbg !138
  %11 = load double* %arrayidx30.i83, align 8, !dbg !138, !tbaa !107
  %12 = load double* %arrayidx16.i, align 8, !dbg !139, !tbaa !107
  %mul39.i = fmul double %12, %12, !dbg !139
  %13 = load double* %arrayidx21.i, align 8, !dbg !140, !tbaa !107
  %div45.i = fdiv double %mul39.i, %13, !dbg !139
  %sub46.i = fsub double %11, %div45.i, !dbg !138
  store double %sub46.i, double* %arrayidx30.i83, align 8, !dbg !141, !tbaa !107
  %indvars.iv.next.i84 = add nuw nsw i64 %indvars.iv.i79, 1, !dbg !132
  %exitcond.i85 = icmp eq i64 %indvars.iv.next.i84, 1024, !dbg !132
  br i1 %exitcond.i85, label %for.inc51.i, label %for.body6.i, !dbg !132

for.inc51.i:                                      ; preds = %for.body6.i
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !121
  %exitcond15.i = icmp eq i64 %indvars.iv.next14.i, 1024, !dbg !121
  br i1 %exitcond15.i, label %for.body56.i.preheader, label %for.cond4.preheader.i, !dbg !121

for.body56.i.preheader:                           ; preds = %for.inc51.i
  br label %for.body56.i, !dbg !142

for.body56.i:                                     ; preds = %for.body56.i, %for.body56.i.preheader
  %indvars.iv16.i = phi i64 [ 0, %for.body56.i.preheader ], [ %indvars.iv.next17.i.1, %for.body56.i ], !dbg !126
  %arrayidx61.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv16.i, i64 1023, !dbg !142
  %14 = load double* %arrayidx61.i, align 8, !dbg !142, !tbaa !107
  %arrayidx66.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv16.i, i64 1023, !dbg !145
  %15 = load double* %arrayidx66.i, align 8, !dbg !145, !tbaa !107
  %div67.i = fdiv double %14, %15, !dbg !142
  store double %div67.i, double* %arrayidx61.i, align 8, !dbg !146, !tbaa !107
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !147
  %arrayidx61.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv.next17.i, i64 1023, !dbg !142
  %16 = load double* %arrayidx61.i.1, align 8, !dbg !142, !tbaa !107
  %arrayidx66.i.1 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv.next17.i, i64 1023, !dbg !145
  %17 = load double* %arrayidx66.i.1, align 8, !dbg !145, !tbaa !107
  %div67.i.1 = fdiv double %16, %17, !dbg !142
  store double %div67.i.1, double* %arrayidx61.i.1, align 8, !dbg !146, !tbaa !107
  %indvars.iv.next17.i.1 = add nuw nsw i64 %indvars.iv.next17.i, 1, !dbg !147
  %exitcond18.i.1 = icmp eq i64 %indvars.iv.next17.i.1, 1024, !dbg !147
  br i1 %exitcond18.i.1, label %for.cond79.preheader.i.preheader, label %for.body56.i, !dbg !147

for.cond79.preheader.i.preheader:                 ; preds = %for.body56.i
  br label %for.cond79.preheader.i, !dbg !148

for.cond79.preheader.i:                           ; preds = %for.cond79.preheader.i.preheader, %for.inc120.i
  %indvars.iv28.i = phi i64 [ %indvars.iv.next29.i, %for.inc120.i ], [ 0, %for.cond79.preheader.i.preheader ], !dbg !126
  br label %for.body82.i, !dbg !148

for.body82.i:                                     ; preds = %for.body82.i, %for.cond79.preheader.i
  %indvars.iv19.i = phi i64 [ 0, %for.cond79.preheader.i ], [ %indvars.iv.next20.i, %for.body82.i ], !dbg !126
  %18 = sub nsw i64 1022, %indvars.iv19.i, !dbg !152
  %arrayidx88.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv28.i, i64 %18, !dbg !154
  %19 = load double* %arrayidx88.i, align 8, !dbg !154, !tbaa !107
  %20 = add nsw i64 %18, -1, !dbg !155
  %arrayidx95.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv28.i, i64 %20, !dbg !156
  %21 = load double* %arrayidx95.i, align 8, !dbg !156, !tbaa !107
  %22 = sub nsw i64 1024, %indvars.iv19.i, !dbg !157
  %23 = add nsw i64 %22, -3, !dbg !157
  %arrayidx101.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv28.i, i64 %23, !dbg !158
  %24 = load double* %arrayidx101.i, align 8, !dbg !158, !tbaa !107
  %mul102.i = fmul double %21, %24, !dbg !156
  %sub103.i = fsub double %19, %mul102.i, !dbg !154
  %25 = sub nsw i64 1021, %indvars.iv19.i, !dbg !159
  %arrayidx109.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv28.i, i64 %25, !dbg !160
  %26 = load double* %arrayidx109.i, align 8, !dbg !160, !tbaa !107
  %div110.i = fdiv double %sub103.i, %26, !dbg !161
  %27 = add nsw i64 %22, -2, !dbg !162
  %arrayidx116.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv28.i, i64 %27, !dbg !163
  store double %div110.i, double* %arrayidx116.i, align 8, !dbg !163, !tbaa !107
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1, !dbg !148
  %exitcond27.i = icmp eq i64 %indvars.iv.next20.i, 1022, !dbg !148
  br i1 %exitcond27.i, label %for.inc120.i, label %for.body82.i, !dbg !148

for.inc120.i:                                     ; preds = %for.body82.i
  %indvars.iv.next29.i = add nuw nsw i64 %indvars.iv28.i, 1, !dbg !164
  %exitcond30.i = icmp eq i64 %indvars.iv.next29.i, 1024, !dbg !164
  br i1 %exitcond30.i, label %for.cond126.preheader.i.preheader, label %for.cond79.preheader.i, !dbg !164

for.cond126.preheader.i.preheader:                ; preds = %for.inc120.i
  br label %for.cond126.preheader.i, !dbg !165

for.cond126.preheader.i:                          ; preds = %for.cond126.preheader.i.preheader, %for.inc181.i
  %indvar = phi i64 [ %indvar.next, %for.inc181.i ], [ 0, %for.cond126.preheader.i.preheader ]
  %indvars.iv34.i = phi i64 [ %indvars.iv.next35.i, %for.inc181.i ], [ 1, %for.cond126.preheader.i.preheader ], !dbg !126
  %28 = shl i64 %indvar, 13, !dbg !165
  %29 = add i64 %28, 8192, !dbg !165
  %scevgep138 = getelementptr i8* %call, i64 %29
  %30 = add i64 %28, 16376, !dbg !165
  %scevgep139 = getelementptr i8* %call, i64 %30
  %scevgep140 = getelementptr i8* %call2, i64 %29
  %scevgep141 = getelementptr i8* %call2, i64 %30
  %31 = or i64 %28, 8184, !dbg !165
  %scevgep144 = getelementptr i8* %call1, i64 %29
  %scevgep145 = getelementptr i8* %call1, i64 %30
  %32 = add nsw i64 %indvars.iv34.i, -1, !dbg !165
  %bound0148 = icmp ule i8* %scevgep138, %scevgep141
  %bound1149 = icmp ule i8* %scevgep140, %scevgep139
  %found.conflict150 = and i1 %bound0148, %bound1149
  %bound0151 = icmp ule i8* %scevgep138, %scevgep145
  %bound1152 = icmp ule i8* %scevgep144, %scevgep139
  %found.conflict153 = and i1 %bound0151, %bound1152
  %conflict.rdx154 = or i1 %found.conflict150, %found.conflict153
  %scevgep147 = getelementptr i8* %call2, i64 %31
  %bound0155 = icmp ule i8* %scevgep138, %scevgep147
  %scevgep146 = getelementptr i8* %call2, i64 %28
  %bound1156 = icmp ule i8* %scevgep146, %scevgep139
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx158 = or i1 %conflict.rdx154, %found.conflict157
  %scevgep143 = getelementptr i8* %call, i64 %31
  %bound0159 = icmp ule i8* %scevgep140, %scevgep143
  %scevgep142 = getelementptr i8* %call, i64 %28
  %bound1160 = icmp ule i8* %scevgep142, %scevgep141
  %found.conflict161 = and i1 %bound0159, %bound1160
  %conflict.rdx162 = or i1 %conflict.rdx158, %found.conflict161
  %bound0163 = icmp ule i8* %scevgep140, %scevgep145
  %bound1164 = icmp ule i8* %scevgep144, %scevgep141
  %found.conflict165 = and i1 %bound0163, %bound1164
  %conflict.rdx166 = or i1 %conflict.rdx162, %found.conflict165
  br i1 %conflict.rdx166, label %middle.block134, label %vector.body133.preheader

vector.body133.preheader:                         ; preds = %for.cond126.preheader.i
  br label %vector.body133, !dbg !171

vector.body133:                                   ; preds = %vector.body133.preheader, %vector.body133
  %index136 = phi i64 [ %index.next174, %vector.body133 ], [ 0, %vector.body133.preheader ], !dbg !126
  %33 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv34.i, i64 %index136, !dbg !171
  %34 = bitcast double* %33 to <2 x double>*, !dbg !171
  %wide.load178 = load <2 x double>* %34, align 8, !dbg !171, !tbaa !107
  %35 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %32, i64 %index136, !dbg !172
  %36 = bitcast double* %35 to <2 x double>*, !dbg !172
  %wide.load179 = load <2 x double>* %36, align 8, !dbg !172, !tbaa !107
  %37 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv34.i, i64 %index136, !dbg !173
  %38 = bitcast double* %37 to <2 x double>*, !dbg !173
  %wide.load180 = load <2 x double>* %38, align 8, !dbg !173, !tbaa !107
  %39 = fmul <2 x double> %wide.load179, %wide.load180, !dbg !172
  %40 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %32, i64 %index136, !dbg !174
  %41 = bitcast double* %40 to <2 x double>*, !dbg !174
  %wide.load181 = load <2 x double>* %41, align 8, !dbg !174, !tbaa !107
  %42 = fdiv <2 x double> %39, %wide.load181, !dbg !172
  %43 = fsub <2 x double> %wide.load178, %42, !dbg !171
  %44 = bitcast double* %33 to <2 x double>*, !dbg !175
  store <2 x double> %43, <2 x double>* %44, align 8, !dbg !175, !tbaa !107
  %45 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv34.i, i64 %index136, !dbg !176
  %46 = bitcast double* %45 to <2 x double>*, !dbg !176
  %wide.load182 = load <2 x double>* %46, align 8, !dbg !176, !tbaa !107
  %47 = bitcast double* %37 to <2 x double>*, !dbg !177
  %wide.load183 = load <2 x double>* %47, align 8, !dbg !177, !tbaa !107
  %48 = fmul <2 x double> %wide.load183, %wide.load183, !dbg !177
  %49 = bitcast double* %40 to <2 x double>*, !dbg !178
  %wide.load184 = load <2 x double>* %49, align 8, !dbg !178, !tbaa !107
  %50 = fdiv <2 x double> %48, %wide.load184, !dbg !177
  %51 = fsub <2 x double> %wide.load182, %50, !dbg !176
  %52 = bitcast double* %45 to <2 x double>*, !dbg !179
  store <2 x double> %51, <2 x double>* %52, align 8, !dbg !179, !tbaa !107
  %index.next174 = add i64 %index136, 2, !dbg !126
  %53 = icmp eq i64 %index.next174, 1024, !dbg !126
  br i1 %53, label %middle.block134.loopexit, label %vector.body133, !dbg !126, !llvm.loop !180

middle.block134.loopexit:                         ; preds = %vector.body133
  br label %middle.block134

middle.block134:                                  ; preds = %middle.block134.loopexit, %for.cond126.preheader.i
  %resume.val169 = phi i1 [ false, %for.cond126.preheader.i ], [ true, %middle.block134.loopexit ]
  %trunc.resume.val170 = phi i64 [ 0, %for.cond126.preheader.i ], [ 1024, %middle.block134.loopexit ]
  br i1 %resume.val169, label %for.inc181.i, label %for.body128.i.preheader

for.body128.i.preheader:                          ; preds = %middle.block134
  br label %for.body128.i, !dbg !171

for.body128.i:                                    ; preds = %for.body128.i.preheader, %for.body128.i
  %indvars.iv31.i = phi i64 [ %indvars.iv.next32.i, %for.body128.i ], [ %trunc.resume.val170, %for.body128.i.preheader ], !dbg !126
  %arrayidx132.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv34.i, i64 %indvars.iv31.i, !dbg !171
  %54 = load double* %arrayidx132.i, align 8, !dbg !171, !tbaa !107
  %arrayidx137.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %32, i64 %indvars.iv31.i, !dbg !172
  %55 = load double* %arrayidx137.i, align 8, !dbg !172, !tbaa !107
  %arrayidx141.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %indvars.iv34.i, i64 %indvars.iv31.i, !dbg !173
  %56 = load double* %arrayidx141.i, align 8, !dbg !173, !tbaa !107
  %mul142.i = fmul double %55, %56, !dbg !172
  %arrayidx147.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %32, i64 %indvars.iv31.i, !dbg !174
  %57 = load double* %arrayidx147.i, align 8, !dbg !174, !tbaa !107
  %div148.i = fdiv double %mul142.i, %57, !dbg !172
  %sub149.i = fsub double %54, %div148.i, !dbg !171
  store double %sub149.i, double* %arrayidx132.i, align 8, !dbg !175, !tbaa !107
  %arrayidx157.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %indvars.iv34.i, i64 %indvars.iv31.i, !dbg !176
  %58 = load double* %arrayidx157.i, align 8, !dbg !176, !tbaa !107
  %59 = load double* %arrayidx141.i, align 8, !dbg !177, !tbaa !107
  %mul166.i = fmul double %59, %59, !dbg !177
  %60 = load double* %arrayidx147.i, align 8, !dbg !178, !tbaa !107
  %div172.i = fdiv double %mul166.i, %60, !dbg !177
  %sub173.i = fsub double %58, %div172.i, !dbg !176
  store double %sub173.i, double* %arrayidx157.i, align 8, !dbg !179, !tbaa !107
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !183
  %exitcond33.i = icmp eq i64 %indvars.iv.next32.i, 1024, !dbg !183
  br i1 %exitcond33.i, label %for.inc181.i.loopexit, label %for.body128.i, !dbg !183, !llvm.loop !184

for.inc181.i.loopexit:                            ; preds = %for.body128.i
  br label %for.inc181.i

for.inc181.i:                                     ; preds = %for.inc181.i.loopexit, %middle.block134
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1, !dbg !185
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !186, metadata !80), !dbg !187
  %exitcond37.i = icmp eq i64 %indvars.iv.next35.i, 1024, !dbg !185
  %indvar.next = add i64 %indvar, 1, !dbg !185
  br i1 %exitcond37.i, label %vector.memcheck115, label %for.cond126.preheader.i, !dbg !185

vector.memcheck115:                               ; preds = %for.inc181.i
  %bound0111 = icmp ule i8* %scevgep107, %scevgep110
  %bound1112 = icmp ule i8* %scevgep109, %scevgep108
  %memcheck.conflict114 = and i1 %bound0111, %bound1112
  br i1 %memcheck.conflict114, label %middle.block103, label %vector.body102.preheader

vector.body102.preheader:                         ; preds = %vector.memcheck115
  br label %vector.body102, !dbg !188

vector.body102:                                   ; preds = %vector.body102.preheader, %vector.body102
  %index105 = phi i64 [ %index.next121, %vector.body102 ], [ 0, %vector.body102.preheader ], !dbg !126
  %61 = getelementptr inbounds [1024 x double]* %arraydecay, i64 1023, i64 %index105, !dbg !188
  %62 = bitcast double* %61 to <2 x double>*, !dbg !188
  %wide.load126 = load <2 x double>* %62, align 8, !dbg !188, !tbaa !107
  %.sum185 = or i64 %index105, 2, !dbg !188
  %63 = getelementptr [1024 x double]* %arraydecay, i64 1023, i64 %.sum185, !dbg !188
  %64 = bitcast double* %63 to <2 x double>*, !dbg !188
  %wide.load127 = load <2 x double>* %64, align 8, !dbg !188, !tbaa !107
  %65 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 1023, i64 %index105, !dbg !191
  %66 = bitcast double* %65 to <2 x double>*, !dbg !191
  %wide.load128 = load <2 x double>* %66, align 8, !dbg !191, !tbaa !107
  %.sum186 = or i64 %index105, 2, !dbg !191
  %67 = getelementptr [1024 x double]* %arraydecay4, i64 1023, i64 %.sum186, !dbg !191
  %68 = bitcast double* %67 to <2 x double>*, !dbg !191
  %wide.load129 = load <2 x double>* %68, align 8, !dbg !191, !tbaa !107
  %69 = fdiv <2 x double> %wide.load126, %wide.load128, !dbg !188
  %70 = fdiv <2 x double> %wide.load127, %wide.load129, !dbg !188
  %71 = bitcast double* %61 to <2 x double>*, !dbg !192
  store <2 x double> %69, <2 x double>* %71, align 8, !dbg !192, !tbaa !107
  %72 = bitcast double* %63 to <2 x double>*, !dbg !192
  store <2 x double> %70, <2 x double>* %72, align 8, !dbg !192, !tbaa !107
  %index.next121 = add i64 %index105, 4, !dbg !126
  %73 = icmp eq i64 %index.next121, 1024, !dbg !126
  br i1 %73, label %middle.block103.loopexit, label %vector.body102, !dbg !126, !llvm.loop !193

middle.block103.loopexit:                         ; preds = %vector.body102
  br label %middle.block103

middle.block103:                                  ; preds = %middle.block103.loopexit, %vector.memcheck115
  %resume.val116 = phi i1 [ false, %vector.memcheck115 ], [ true, %middle.block103.loopexit ]
  %trunc.resume.val117 = phi i64 [ 0, %vector.memcheck115 ], [ 1024, %middle.block103.loopexit ]
  br i1 %resume.val116, label %for.cond210.preheader.i.preheader, label %for.body186.i.preheader

for.body186.i.preheader:                          ; preds = %middle.block103
  %74 = sub i64 1024, %trunc.resume.val117
  %xtraiter = and i64 %74, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %74, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body186.i.prol.preheader, label %for.body186.i.preheader.split

for.body186.i.prol.preheader:                     ; preds = %for.body186.i.preheader
  br label %for.body186.i.prol, !dbg !188

for.body186.i.prol:                               ; preds = %for.body186.i.prol.preheader, %for.body186.i.prol
  %indvars.iv38.i.prol = phi i64 [ %indvars.iv.next39.i.prol, %for.body186.i.prol ], [ %trunc.resume.val117, %for.body186.i.prol.preheader ], !dbg !126
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body186.i.prol ], [ %xtraiter, %for.body186.i.prol.preheader ]
  %arrayidx191.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 1023, i64 %indvars.iv38.i.prol, !dbg !188
  %75 = load double* %arrayidx191.i.prol, align 8, !dbg !188, !tbaa !107
  %arrayidx196.i.prol = getelementptr inbounds [1024 x double]* %arraydecay4, i64 1023, i64 %indvars.iv38.i.prol, !dbg !191
  %76 = load double* %arrayidx196.i.prol, align 8, !dbg !191, !tbaa !107
  %div197.i.prol = fdiv double %75, %76, !dbg !188
  store double %div197.i.prol, double* %arrayidx191.i.prol, align 8, !dbg !192, !tbaa !107
  %indvars.iv.next39.i.prol = add nuw nsw i64 %indvars.iv38.i.prol, 1, !dbg !194
  %exitcond40.i.prol = icmp eq i64 %indvars.iv.next39.i.prol, 1024, !dbg !194
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !194
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !194
  br i1 %prol.iter.cmp, label %for.body186.i.prol, label %for.body186.i.preheader.split.loopexit, !llvm.loop !195

for.body186.i.preheader.split.loopexit:           ; preds = %for.body186.i.prol
  %indvars.iv38.i.unr.ph = phi i64 [ %indvars.iv.next39.i.prol, %for.body186.i.prol ]
  br label %for.body186.i.preheader.split

for.body186.i.preheader.split:                    ; preds = %for.body186.i.preheader.split.loopexit, %for.body186.i.preheader
  %indvars.iv38.i.unr = phi i64 [ %trunc.resume.val117, %for.body186.i.preheader ], [ %indvars.iv38.i.unr.ph, %for.body186.i.preheader.split.loopexit ]
  %77 = icmp ult i64 %74, 2
  br i1 %77, label %for.cond210.preheader.i.preheader.loopexit, label %for.body186.i.preheader.split.split

for.body186.i.preheader.split.split:              ; preds = %for.body186.i.preheader.split
  br label %for.body186.i, !dbg !188

for.body186.i:                                    ; preds = %for.body186.i, %for.body186.i.preheader.split.split
  %indvars.iv38.i = phi i64 [ %indvars.iv38.i.unr, %for.body186.i.preheader.split.split ], [ %indvars.iv.next39.i.1, %for.body186.i ], !dbg !126
  %arrayidx191.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 1023, i64 %indvars.iv38.i, !dbg !188
  %78 = load double* %arrayidx191.i, align 8, !dbg !188, !tbaa !107
  %arrayidx196.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 1023, i64 %indvars.iv38.i, !dbg !191
  %79 = load double* %arrayidx196.i, align 8, !dbg !191, !tbaa !107
  %div197.i = fdiv double %78, %79, !dbg !188
  store double %div197.i, double* %arrayidx191.i, align 8, !dbg !192, !tbaa !107
  %indvars.iv.next39.i = add nuw nsw i64 %indvars.iv38.i, 1, !dbg !194
  %arrayidx191.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 1023, i64 %indvars.iv.next39.i, !dbg !188
  %80 = load double* %arrayidx191.i.1, align 8, !dbg !188, !tbaa !107
  %arrayidx196.i.1 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 1023, i64 %indvars.iv.next39.i, !dbg !191
  %81 = load double* %arrayidx196.i.1, align 8, !dbg !191, !tbaa !107
  %div197.i.1 = fdiv double %80, %81, !dbg !188
  store double %div197.i.1, double* %arrayidx191.i.1, align 8, !dbg !192, !tbaa !107
  %indvars.iv.next39.i.1 = add nuw nsw i64 %indvars.iv.next39.i, 1, !dbg !194
  %exitcond40.i.1 = icmp eq i64 %indvars.iv.next39.i.1, 1024, !dbg !194
  br i1 %exitcond40.i.1, label %for.cond210.preheader.i.preheader.loopexit.unr-lcssa, label %for.body186.i, !dbg !194, !llvm.loop !197

for.cond210.preheader.i.preheader.loopexit.unr-lcssa: ; preds = %for.body186.i
  br label %for.cond210.preheader.i.preheader.loopexit

for.cond210.preheader.i.preheader.loopexit:       ; preds = %for.body186.i.preheader.split, %for.cond210.preheader.i.preheader.loopexit.unr-lcssa
  br label %for.cond210.preheader.i.preheader

for.cond210.preheader.i.preheader:                ; preds = %for.cond210.preheader.i.preheader.loopexit, %middle.block103
  br label %for.cond210.preheader.i, !dbg !198

for.cond210.preheader.i:                          ; preds = %for.cond210.preheader.i.preheader, %for.inc249.i
  %indvars.iv44.i = phi i64 [ %indvars.iv.next45.i, %for.inc249.i ], [ 0, %for.cond210.preheader.i.preheader ], !dbg !126
  %82 = mul i64 %indvars.iv44.i, -8192, !dbg !198
  %83 = add i64 %82, 8372224, !dbg !198
  %scevgep = getelementptr i8* %call, i64 %83
  %84 = add i64 %82, 8380408, !dbg !198
  %scevgep86 = getelementptr i8* %call, i64 %84
  %85 = sub nsw i64 1022, %indvars.iv44.i, !dbg !198
  %86 = sub i64 1021, %indvars.iv44.i, !dbg !203
  %87 = add i64 %82, 8372216, !dbg !198
  %scevgep90 = getelementptr i8* %call1, i64 %87
  %bound0 = icmp ule i8* %scevgep, %scevgep90
  %88 = add i64 %82, 8364032, !dbg !198
  %scevgep89 = getelementptr i8* %call1, i64 %88
  %bound1 = icmp ule i8* %scevgep89, %scevgep86
  %found.conflict = and i1 %bound0, %bound1
  %scevgep92 = getelementptr i8* %call2, i64 %84
  %bound093 = icmp ule i8* %scevgep, %scevgep92
  %scevgep91 = getelementptr i8* %call2, i64 %83
  %bound194 = icmp ule i8* %scevgep91, %scevgep86
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx = or i1 %found.conflict, %found.conflict95
  br i1 %conflict.rdx, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond210.preheader.i
  br label %vector.body, !dbg !204

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ], !dbg !126
  %89 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %85, i64 %index, !dbg !204
  %90 = bitcast double* %89 to <2 x double>*, !dbg !204
  %wide.load = load <2 x double>* %90, align 8, !dbg !204, !tbaa !107
  %91 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %86, i64 %index, !dbg !205
  %92 = bitcast double* %91 to <2 x double>*, !dbg !205
  %wide.load96 = load <2 x double>* %92, align 8, !dbg !205, !tbaa !107
  %93 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %86, i64 %index, !dbg !206
  %94 = bitcast double* %93 to <2 x double>*, !dbg !206
  %wide.load97 = load <2 x double>* %94, align 8, !dbg !206, !tbaa !107
  %95 = fmul <2 x double> %wide.load96, %wide.load97, !dbg !205
  %96 = fsub <2 x double> %wide.load, %95, !dbg !204
  %97 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %85, i64 %index, !dbg !207
  %98 = bitcast double* %97 to <2 x double>*, !dbg !207
  %wide.load98 = load <2 x double>* %98, align 8, !dbg !207, !tbaa !107
  %99 = fdiv <2 x double> %96, %wide.load98, !dbg !208
  %100 = bitcast double* %89 to <2 x double>*, !dbg !209
  store <2 x double> %99, <2 x double>* %100, align 8, !dbg !209, !tbaa !107
  %index.next = add nuw nsw i64 %index, 2, !dbg !126
  %101 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %85, i64 %index.next, !dbg !204
  %102 = bitcast double* %101 to <2 x double>*, !dbg !204
  %wide.load.1 = load <2 x double>* %102, align 8, !dbg !204, !tbaa !107
  %103 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %86, i64 %index.next, !dbg !205
  %104 = bitcast double* %103 to <2 x double>*, !dbg !205
  %wide.load96.1 = load <2 x double>* %104, align 8, !dbg !205, !tbaa !107
  %105 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %86, i64 %index.next, !dbg !206
  %106 = bitcast double* %105 to <2 x double>*, !dbg !206
  %wide.load97.1 = load <2 x double>* %106, align 8, !dbg !206, !tbaa !107
  %107 = fmul <2 x double> %wide.load96.1, %wide.load97.1, !dbg !205
  %108 = fsub <2 x double> %wide.load.1, %107, !dbg !204
  %109 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %85, i64 %index.next, !dbg !207
  %110 = bitcast double* %109 to <2 x double>*, !dbg !207
  %wide.load98.1 = load <2 x double>* %110, align 8, !dbg !207, !tbaa !107
  %111 = fdiv <2 x double> %108, %wide.load98.1, !dbg !208
  %112 = bitcast double* %101 to <2 x double>*, !dbg !209
  store <2 x double> %111, <2 x double>* %112, align 8, !dbg !209, !tbaa !107
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !126
  %113 = icmp eq i64 %index.next.1, 1024, !dbg !126
  br i1 %113, label %middle.block.loopexit, label %vector.body, !dbg !126, !llvm.loop !210

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %for.cond210.preheader.i
  %resume.val = phi i1 [ false, %for.cond210.preheader.i ], [ true, %middle.block.loopexit ]
  %trunc.resume.val = phi i64 [ 0, %for.cond210.preheader.i ], [ 1024, %middle.block.loopexit ]
  br i1 %resume.val, label %for.inc249.i, label %for.body212.i.preheader

for.body212.i.preheader:                          ; preds = %middle.block
  %114 = sub i64 1024, %trunc.resume.val
  %xtraiter187 = and i64 %114, 1
  %lcmp.mod188 = icmp ne i64 %xtraiter187, 0
  %lcmp.overflow189 = icmp eq i64 %114, 0
  %lcmp.or190 = or i1 %lcmp.overflow189, %lcmp.mod188
  br i1 %lcmp.or190, label %for.body212.i.prol.preheader, label %for.body212.i.preheader.split

for.body212.i.prol.preheader:                     ; preds = %for.body212.i.preheader
  br label %for.body212.i.prol, !dbg !204

for.body212.i.prol:                               ; preds = %for.body212.i.prol.preheader, %for.body212.i.prol
  %indvars.iv41.i.prol = phi i64 [ %indvars.iv.next42.i.prol, %for.body212.i.prol ], [ %trunc.resume.val, %for.body212.i.prol.preheader ], !dbg !126
  %prol.iter191 = phi i64 [ %prol.iter191.sub, %for.body212.i.prol ], [ %xtraiter187, %for.body212.i.prol.preheader ]
  %arrayidx218.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %85, i64 %indvars.iv41.i.prol, !dbg !204
  %115 = load double* %arrayidx218.i.prol, align 8, !dbg !204, !tbaa !107
  %arrayidx224.i.prol = getelementptr inbounds [1024 x double]* %arraydecay, i64 %86, i64 %indvars.iv41.i.prol, !dbg !205
  %116 = load double* %arrayidx224.i.prol, align 8, !dbg !205, !tbaa !107
  %arrayidx230.i.prol = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %86, i64 %indvars.iv41.i.prol, !dbg !206
  %117 = load double* %arrayidx230.i.prol, align 8, !dbg !206, !tbaa !107
  %mul231.i.prol = fmul double %116, %117, !dbg !205
  %sub232.i.prol = fsub double %115, %mul231.i.prol, !dbg !204
  %arrayidx238.i.prol = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %85, i64 %indvars.iv41.i.prol, !dbg !207
  %118 = load double* %arrayidx238.i.prol, align 8, !dbg !207, !tbaa !107
  %div239.i.prol = fdiv double %sub232.i.prol, %118, !dbg !208
  store double %div239.i.prol, double* %arrayidx218.i.prol, align 8, !dbg !209, !tbaa !107
  %indvars.iv.next42.i.prol = add nuw nsw i64 %indvars.iv41.i.prol, 1, !dbg !211
  %exitcond43.i.prol = icmp eq i64 %indvars.iv.next42.i.prol, 1024, !dbg !211
  %prol.iter191.sub = sub i64 %prol.iter191, 1, !dbg !211
  %prol.iter191.cmp = icmp ne i64 %prol.iter191.sub, 0, !dbg !211
  br i1 %prol.iter191.cmp, label %for.body212.i.prol, label %for.body212.i.preheader.split.loopexit, !llvm.loop !212

for.body212.i.preheader.split.loopexit:           ; preds = %for.body212.i.prol
  %indvars.iv41.i.unr.ph = phi i64 [ %indvars.iv.next42.i.prol, %for.body212.i.prol ]
  br label %for.body212.i.preheader.split

for.body212.i.preheader.split:                    ; preds = %for.body212.i.preheader.split.loopexit, %for.body212.i.preheader
  %indvars.iv41.i.unr = phi i64 [ %trunc.resume.val, %for.body212.i.preheader ], [ %indvars.iv41.i.unr.ph, %for.body212.i.preheader.split.loopexit ]
  %119 = icmp ult i64 %114, 2
  br i1 %119, label %for.inc249.i.loopexit, label %for.body212.i.preheader.split.split

for.body212.i.preheader.split.split:              ; preds = %for.body212.i.preheader.split
  br label %for.body212.i, !dbg !204

for.body212.i:                                    ; preds = %for.body212.i, %for.body212.i.preheader.split.split
  %indvars.iv41.i = phi i64 [ %indvars.iv41.i.unr, %for.body212.i.preheader.split.split ], [ %indvars.iv.next42.i.1, %for.body212.i ], !dbg !126
  %arrayidx218.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %85, i64 %indvars.iv41.i, !dbg !204
  %120 = load double* %arrayidx218.i, align 8, !dbg !204, !tbaa !107
  %arrayidx224.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %86, i64 %indvars.iv41.i, !dbg !205
  %121 = load double* %arrayidx224.i, align 8, !dbg !205, !tbaa !107
  %arrayidx230.i = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %86, i64 %indvars.iv41.i, !dbg !206
  %122 = load double* %arrayidx230.i, align 8, !dbg !206, !tbaa !107
  %mul231.i = fmul double %121, %122, !dbg !205
  %sub232.i = fsub double %120, %mul231.i, !dbg !204
  %arrayidx238.i = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %85, i64 %indvars.iv41.i, !dbg !207
  %123 = load double* %arrayidx238.i, align 8, !dbg !207, !tbaa !107
  %div239.i = fdiv double %sub232.i, %123, !dbg !208
  store double %div239.i, double* %arrayidx218.i, align 8, !dbg !209, !tbaa !107
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !211
  %arrayidx218.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %85, i64 %indvars.iv.next42.i, !dbg !204
  %124 = load double* %arrayidx218.i.1, align 8, !dbg !204, !tbaa !107
  %arrayidx224.i.1 = getelementptr inbounds [1024 x double]* %arraydecay, i64 %86, i64 %indvars.iv.next42.i, !dbg !205
  %125 = load double* %arrayidx224.i.1, align 8, !dbg !205, !tbaa !107
  %arrayidx230.i.1 = getelementptr inbounds [1024 x double]* %arraydecay3, i64 %86, i64 %indvars.iv.next42.i, !dbg !206
  %126 = load double* %arrayidx230.i.1, align 8, !dbg !206, !tbaa !107
  %mul231.i.1 = fmul double %125, %126, !dbg !205
  %sub232.i.1 = fsub double %124, %mul231.i.1, !dbg !204
  %arrayidx238.i.1 = getelementptr inbounds [1024 x double]* %arraydecay4, i64 %85, i64 %indvars.iv.next42.i, !dbg !207
  %127 = load double* %arrayidx238.i.1, align 8, !dbg !207, !tbaa !107
  %div239.i.1 = fdiv double %sub232.i.1, %127, !dbg !208
  store double %div239.i.1, double* %arrayidx218.i.1, align 8, !dbg !209, !tbaa !107
  %indvars.iv.next42.i.1 = add nuw nsw i64 %indvars.iv.next42.i, 1, !dbg !211
  %exitcond43.i.1 = icmp eq i64 %indvars.iv.next42.i.1, 1024, !dbg !211
  br i1 %exitcond43.i.1, label %for.inc249.i.loopexit.unr-lcssa, label %for.body212.i, !dbg !211, !llvm.loop !213

for.inc249.i.loopexit.unr-lcssa:                  ; preds = %for.body212.i
  br label %for.inc249.i.loopexit

for.inc249.i.loopexit:                            ; preds = %for.body212.i.preheader.split, %for.inc249.i.loopexit.unr-lcssa
  br label %for.inc249.i

for.inc249.i:                                     ; preds = %for.inc249.i.loopexit, %middle.block
  %indvars.iv.next45.i = add nuw nsw i64 %indvars.iv44.i, 1, !dbg !214
  %exitcond49.i = icmp eq i64 %indvars.iv.next45.i, 1022, !dbg !214
  br i1 %exitcond49.i, label %for.inc252.i, label %for.cond210.preheader.i, !dbg !214

for.inc252.i:                                     ; preds = %for.inc249.i
  %inc253.i = add nuw nsw i32 %t.011.i, 1, !dbg !215
  tail call void @llvm.dbg.value(metadata i32 %inc253.i, i64 0, metadata !216, metadata !80), !dbg !217
  %exitcond50.i = icmp eq i32 %inc253.i, 50, !dbg !218
  br i1 %exitcond50.i, label %kernel_adi.exit, label %for.cond1.preheader.i78, !dbg !218

kernel_adi.exit:                                  ; preds = %for.inc252.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !219
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !220

if.end44:                                         ; preds = %kernel_adi.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !80), !dbg !221
  tail call void @llvm.dbg.value(metadata i8* %128, i64 0, metadata !41, metadata !80), !dbg !222
  %128 = load i8** %argv, align 8, !dbg !223, !tbaa !225
  %129 = load i8* %128, align 1, !dbg !223, !tbaa !227
  %phitmp = icmp eq i8 %129, 0, !dbg !221
  br i1 %phitmp, label %for.cond1.preheader.i73.preheader, label %if.end51, !dbg !220

for.cond1.preheader.i73.preheader:                ; preds = %if.end44
  br label %for.cond1.preheader.i73, !dbg !228

for.cond1.preheader.i73:                          ; preds = %for.cond1.preheader.i73.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i73.preheader ], !dbg !235
  %130 = shl i64 %indvars.iv7.i, 10, !dbg !228
  br label %for.body3.i75, !dbg !237

for.body3.i75:                                    ; preds = %for.inc.i, %for.cond1.preheader.i73
  %indvars.iv.i74 = phi i64 [ 0, %for.cond1.preheader.i73 ], [ %indvars.iv.next.i76, %for.inc.i ], !dbg !235
  %131 = load %struct._IO_FILE** @stderr, align 8, !dbg !238, !tbaa !225
  %arrayidx5.i = getelementptr inbounds [1024 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i74, !dbg !239
  %132 = load double* %arrayidx5.i, align 8, !dbg !239, !tbaa !107
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %132) #5, !dbg !240
  %133 = add nuw nsw i64 %indvars.iv.i74, %130, !dbg !228
  %134 = trunc i64 %133 to i32, !dbg !241
  %rem.i = srem i32 %134, 20, !dbg !241
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !241
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !242

if.then.i:                                        ; preds = %for.body3.i75
  %135 = load %struct._IO_FILE** @stderr, align 8, !dbg !243, !tbaa !225
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %135) #5, !dbg !245
  br label %for.inc.i, !dbg !245

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i75
  %indvars.iv.next.i76 = add nuw nsw i64 %indvars.iv.i74, 1, !dbg !237
  %exitcond.i77 = icmp eq i64 %indvars.iv.next.i76, 1024, !dbg !237
  br i1 %exitcond.i77, label %for.inc8.i, label %for.body3.i75, !dbg !237

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !246
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1024, !dbg !246
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i73, !dbg !246

print_array.exit:                                 ; preds = %for.inc8.i
  %136 = load %struct._IO_FILE** @stderr, align 8, !dbg !247, !tbaa !225
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %136) #5, !dbg !248
  br label %if.end51, !dbg !235

if.end51:                                         ; preds = %if.end44, %print_array.exit, %kernel_adi.exit
  tail call void @free(i8* %call) #4, !dbg !249
  tail call void @free(i8* %call1) #4, !dbg !250
  tail call void @free(i8* %call2) #4, !dbg !251
  ret i32 0, !dbg !252
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
!llvm.module.flags = !{!77, !78}
!llvm.ident = !{!79}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !21, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c] [DW_LANG_C99]
!1 = !{!"adi.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi"}
!2 = !{}
!3 = !{!4, !9, !12, !14, !17, !20, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0067108864\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 67108864, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001024"}                        ; [ DW_TAG_subrange_type ] [0, 1023]
!9 = !{!"0x16\00size_t\0062\000\000\000\000", !10, null, !11} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!10 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi"}
!11 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!16 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0x26\00\000\000\000\000\000", null, null, !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = !{!22, !44, !55, !67}
!22 = !{!"0x2e\00main\00main\00\00104\000\001\000\000\00256\001\00105", !1, !23, !24, null, i32 (i32, i8**)* @main, null, null, !29} ; [ DW_TAG_subprogram ] [line 104] [def] [scope 105] [main]
!23 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!24 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !25, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = !{!26, !26, !27}
!26 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !40, !41, !43}
!30 = !{!"0x101\00argc\0016777320\000", !22, !23, !26} ; [ DW_TAG_arg_variable ] [argc] [line 104]
!31 = !{!"0x101\00argv\0033554536\000", !22, !23, !27} ; [ DW_TAG_arg_variable ] [argv] [line 104]
!32 = !{!"0x100\00n\00107\000", !22, !23, !26}    ; [ DW_TAG_auto_variable ] [n] [line 107]
!33 = !{!"0x100\00tsteps\00108\000", !22, !23, !26} ; [ DW_TAG_auto_variable ] [tsteps] [line 108]
!34 = !{!"0x100\00X\00111\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [X] [line 111]
!35 = !{!"0x100\00A\00112\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [A] [line 112]
!36 = !{!"0x100\00B\00113\000", !22, !23, !4}     ; [ DW_TAG_auto_variable ] [B] [line 113]
!37 = !{!"0x100\00__s1_len\00132\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s1_len] [line 132]
!38 = !{!"0xb\00132\003\001", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!39 = !{!"0xb\00132\003\000", !1, !22}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!40 = !{!"0x100\00__s2_len\00132\000", !38, !23, !9} ; [ DW_TAG_auto_variable ] [__s2_len] [line 132]
!41 = !{!"0x100\00__s2\00132\000", !42, !23, !14} ; [ DW_TAG_auto_variable ] [__s2] [line 132]
!42 = !{!"0xb\00132\003\002", !1, !38}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!43 = !{!"0x100\00__result\00132\000", !42, !23, !26} ; [ DW_TAG_auto_variable ] [__result] [line 132]
!44 = !{!"0x2e\00print_array\00print_array\00\0043\001\001\000\000\00256\001\0046", !1, !23, !45, null, null, null, null, !50} ; [ DW_TAG_subprogram ] [line 43] [local] [def] [scope 46] [print_array]
!45 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !46, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = !{null, !26, !47}
!47 = !{!"0xf\00\000\0064\0064\000\000", null, null, !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!48 = !{!"0x1\00\000\0065536\0064\000\000\000", null, null, !6, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from double]
!49 = !{!8}
!50 = !{!51, !52, !53, !54}
!51 = !{!"0x101\00n\0016777259\000", !44, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 43]
!52 = !{!"0x101\00X\0033554476\000", !44, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 44]
!53 = !{!"0x100\00i\0047\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 47]
!54 = !{!"0x100\00j\0047\000", !44, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 47]
!55 = !{!"0x2e\00kernel_adi\00kernel_adi\00\0061\001\001\000\000\00256\001\0066", !1, !23, !56, null, null, null, null, !58} ; [ DW_TAG_subprogram ] [line 61] [local] [def] [scope 66] [kernel_adi]
!56 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !57, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = !{null, !26, !26, !47, !47, !47}
!58 = !{!59, !60, !61, !62, !63, !64, !65, !66}
!59 = !{!"0x101\00tsteps\0016777277\000", !55, !23, !26} ; [ DW_TAG_arg_variable ] [tsteps] [line 61]
!60 = !{!"0x101\00n\0033554494\000", !55, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 62]
!61 = !{!"0x101\00X\0050331711\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 63]
!62 = !{!"0x101\00A\0067108928\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 64]
!63 = !{!"0x101\00B\0083886145\000", !55, !23, !47} ; [ DW_TAG_arg_variable ] [B] [line 65]
!64 = !{!"0x100\00t\0067\000", !55, !23, !26}     ; [ DW_TAG_auto_variable ] [t] [line 67]
!65 = !{!"0x100\00i1\0067\000", !55, !23, !26}    ; [ DW_TAG_auto_variable ] [i1] [line 67]
!66 = !{!"0x100\00i2\0067\000", !55, !23, !26}    ; [ DW_TAG_auto_variable ] [i2] [line 67]
!67 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !23, !68, null, null, null, null, !70} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!68 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !69, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = !{null, !26, !47, !47, !47}
!70 = !{!71, !72, !73, !74, !75, !76}
!71 = !{!"0x101\00n\0016777239\000", !67, !23, !26} ; [ DW_TAG_arg_variable ] [n] [line 23]
!72 = !{!"0x101\00X\0033554456\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [X] [line 24]
!73 = !{!"0x101\00A\0050331673\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [A] [line 25]
!74 = !{!"0x101\00B\0067108890\000", !67, !23, !47} ; [ DW_TAG_arg_variable ] [B] [line 26]
!75 = !{!"0x100\00i\0028\000", !67, !23, !26}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!76 = !{!"0x100\00j\0028\000", !67, !23, !26}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!77 = !{i32 2, !"Dwarf Version", i32 4}
!78 = !{i32 2, !"Debug Info Version", i32 2}
!79 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!80 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!81 = !MDLocation(line: 104, column: 14, scope: !22)
!82 = !MDLocation(line: 104, column: 27, scope: !22)
!83 = !MDLocation(line: 107, column: 7, scope: !22)
!84 = !MDLocation(line: 108, column: 7, scope: !22)
!85 = !MDLocation(line: 111, column: 3, scope: !22)
!86 = !MDLocation(line: 112, column: 3, scope: !22)
!87 = !MDLocation(line: 113, column: 3, scope: !22)
!88 = !MDLocation(line: 117, column: 18, scope: !22)
!89 = !MDLocation(line: 117, column: 38, scope: !22)
!90 = !MDLocation(line: 117, column: 58, scope: !22)
!91 = !{!"0x101\00n\0016777239\000", !67, !23, !26, !92} ; [ DW_TAG_arg_variable ] [n] [line 23]
!92 = !MDLocation(line: 117, column: 3, scope: !22)
!93 = !MDLocation(line: 23, column: 22, scope: !67, inlinedAt: !92)
!94 = !{!"0x100\00i\0028\000", !67, !23, !26, !92} ; [ DW_TAG_auto_variable ] [i] [line 28]
!95 = !MDLocation(line: 28, column: 7, scope: !67, inlinedAt: !92)
!96 = !MDLocation(line: 30, column: 3, scope: !97, inlinedAt: !92)
!97 = !{!"0xb\0030\003\0039", !1, !67}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!98 = !MDLocation(line: 33, column: 13, scope: !99, inlinedAt: !92)
!99 = !{!"0xb\0032\007\0043", !1, !100}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!100 = !{!"0xb\0031\005\0042", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!101 = !{!"0xb\0031\005\0041", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!102 = !{!"0xb\0030\003\0040", !1, !97}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!103 = !MDLocation(line: 31, column: 5, scope: !101, inlinedAt: !92)
!104 = !MDLocation(line: 33, column: 27, scope: !99, inlinedAt: !92)
!105 = !MDLocation(line: 33, column: 12, scope: !99, inlinedAt: !92)
!106 = !MDLocation(line: 33, column: 2, scope: !99, inlinedAt: !92)
!107 = !{!108, !108, i64 0}
!108 = !{!"double", !109, i64 0}
!109 = !{!"omnipotent char", !110, i64 0}
!110 = !{!"Simple C/C++ TBAA"}
!111 = !MDLocation(line: 34, column: 28, scope: !99, inlinedAt: !92)
!112 = !MDLocation(line: 34, column: 27, scope: !99, inlinedAt: !92)
!113 = !MDLocation(line: 34, column: 13, scope: !99, inlinedAt: !92)
!114 = !MDLocation(line: 34, column: 12, scope: !99, inlinedAt: !92)
!115 = !MDLocation(line: 34, column: 2, scope: !99, inlinedAt: !92)
!116 = !MDLocation(line: 35, column: 28, scope: !99, inlinedAt: !92)
!117 = !MDLocation(line: 35, column: 27, scope: !99, inlinedAt: !92)
!118 = !MDLocation(line: 35, column: 13, scope: !99, inlinedAt: !92)
!119 = !MDLocation(line: 35, column: 12, scope: !99, inlinedAt: !92)
!120 = !MDLocation(line: 35, column: 2, scope: !99, inlinedAt: !92)
!121 = !MDLocation(line: 72, column: 7, scope: !122, inlinedAt: !126)
!122 = !{!"0xb\0072\007\0017", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!123 = !{!"0xb\0071\005\0016", !1, !124}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!124 = !{!"0xb\0070\003\0015", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!125 = !{!"0xb\0070\003\0014", !1, !55}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!126 = !MDLocation(line: 123, column: 3, scope: !22)
!127 = !MDLocation(line: 75, column: 56, scope: !128, inlinedAt: !126)
!128 = !{!"0xb\0074\004\0021", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!129 = !{!"0xb\0073\002\0020", !1, !130}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!130 = !{!"0xb\0073\002\0019", !1, !131}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!131 = !{!"0xb\0072\007\0018", !1, !122}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!132 = !MDLocation(line: 73, column: 2, scope: !130, inlinedAt: !126)
!133 = !MDLocation(line: 75, column: 18, scope: !128, inlinedAt: !126)
!134 = !MDLocation(line: 75, column: 36, scope: !128, inlinedAt: !126)
!135 = !MDLocation(line: 75, column: 30, scope: !128, inlinedAt: !126)
!136 = !MDLocation(line: 75, column: 44, scope: !128, inlinedAt: !126)
!137 = !MDLocation(line: 75, column: 6, scope: !128, inlinedAt: !126)
!138 = !MDLocation(line: 76, column: 18, scope: !128, inlinedAt: !126)
!139 = !MDLocation(line: 76, column: 30, scope: !128, inlinedAt: !126)
!140 = !MDLocation(line: 76, column: 54, scope: !128, inlinedAt: !126)
!141 = !MDLocation(line: 76, column: 6, scope: !128, inlinedAt: !126)
!142 = !MDLocation(line: 80, column: 15, scope: !143, inlinedAt: !126)
!143 = !{!"0xb\0079\007\0023", !1, !144}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!144 = !{!"0xb\0079\007\0022", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!145 = !MDLocation(line: 80, column: 28, scope: !143, inlinedAt: !126)
!146 = !MDLocation(line: 80, column: 2, scope: !143, inlinedAt: !126)
!147 = !MDLocation(line: 79, column: 7, scope: !144, inlinedAt: !126)
!148 = !MDLocation(line: 83, column: 2, scope: !149, inlinedAt: !126)
!149 = !{!"0xb\0083\002\0026", !1, !150}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!150 = !{!"0xb\0082\007\0025", !1, !151}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!151 = !{!"0xb\0082\007\0024", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!152 = !MDLocation(line: 84, column: 27, scope: !153, inlinedAt: !126)
!153 = !{!"0xb\0083\002\0027", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!154 = !MDLocation(line: 84, column: 21, scope: !153, inlinedAt: !126)
!155 = !MDLocation(line: 84, column: 43, scope: !153, inlinedAt: !126)
!156 = !MDLocation(line: 84, column: 37, scope: !153, inlinedAt: !126)
!157 = !MDLocation(line: 84, column: 61, scope: !153, inlinedAt: !126)
!158 = !MDLocation(line: 84, column: 55, scope: !153, inlinedAt: !126)
!159 = !MDLocation(line: 84, column: 78, scope: !153, inlinedAt: !126)
!160 = !MDLocation(line: 84, column: 72, scope: !153, inlinedAt: !126)
!161 = !MDLocation(line: 84, column: 20, scope: !153, inlinedAt: !126)
!162 = !MDLocation(line: 84, column: 10, scope: !153, inlinedAt: !126)
!163 = !MDLocation(line: 84, column: 4, scope: !153, inlinedAt: !126)
!164 = !MDLocation(line: 82, column: 7, scope: !151, inlinedAt: !126)
!165 = !MDLocation(line: 88, column: 30, scope: !166, inlinedAt: !126)
!166 = !{!"0xb\0087\0029\0032", !1, !167}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!167 = !{!"0xb\0087\002\0031", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!168 = !{!"0xb\0087\002\0030", !1, !169}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!169 = !{!"0xb\0086\007\0029", !1, !170}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!170 = !{!"0xb\0086\007\0028", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!171 = !MDLocation(line: 88, column: 16, scope: !166, inlinedAt: !126)
!172 = !MDLocation(line: 88, column: 28, scope: !166, inlinedAt: !126)
!173 = !MDLocation(line: 88, column: 42, scope: !166, inlinedAt: !126)
!174 = !MDLocation(line: 88, column: 54, scope: !166, inlinedAt: !126)
!175 = !MDLocation(line: 88, column: 4, scope: !166, inlinedAt: !126)
!176 = !MDLocation(line: 89, column: 16, scope: !166, inlinedAt: !126)
!177 = !MDLocation(line: 89, column: 28, scope: !166, inlinedAt: !126)
!178 = !MDLocation(line: 89, column: 52, scope: !166, inlinedAt: !126)
!179 = !MDLocation(line: 89, column: 4, scope: !166, inlinedAt: !126)
!180 = distinct !{!180, !181, !182}
!181 = !{!"llvm.loop.vectorize.width", i32 1}
!182 = !{!"llvm.loop.interleave.count", i32 1}
!183 = !MDLocation(line: 87, column: 2, scope: !168, inlinedAt: !126)
!184 = distinct !{!184, !181, !182}
!185 = !MDLocation(line: 86, column: 7, scope: !170, inlinedAt: !126)
!186 = !{!"0x100\00i2\0067\000", !55, !23, !26, !126} ; [ DW_TAG_auto_variable ] [i2] [line 67]
!187 = !MDLocation(line: 67, column: 14, scope: !55, inlinedAt: !126)
!188 = !MDLocation(line: 93, column: 15, scope: !189, inlinedAt: !126)
!189 = !{!"0xb\0092\007\0034", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!190 = !{!"0xb\0092\007\0033", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!191 = !MDLocation(line: 93, column: 28, scope: !189, inlinedAt: !126)
!192 = !MDLocation(line: 93, column: 2, scope: !189, inlinedAt: !126)
!193 = distinct !{!193, !181, !182}
!194 = !MDLocation(line: 92, column: 7, scope: !190, inlinedAt: !126)
!195 = distinct !{!195, !196}
!196 = !{!"llvm.loop.unroll.disable"}
!197 = distinct !{!197, !181, !182}
!198 = !MDLocation(line: 97, column: 23, scope: !199, inlinedAt: !126)
!199 = !{!"0xb\0096\002\0038", !1, !200}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!200 = !{!"0xb\0096\002\0037", !1, !201}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!201 = !{!"0xb\0095\007\0036", !1, !202}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!202 = !{!"0xb\0095\007\0035", !1, !123}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!203 = !MDLocation(line: 97, column: 39, scope: !199, inlinedAt: !126)
!204 = !MDLocation(line: 97, column: 21, scope: !199, inlinedAt: !126)
!205 = !MDLocation(line: 97, column: 37, scope: !199, inlinedAt: !126)
!206 = !MDLocation(line: 97, column: 53, scope: !199, inlinedAt: !126)
!207 = !MDLocation(line: 97, column: 70, scope: !199, inlinedAt: !126)
!208 = !MDLocation(line: 97, column: 20, scope: !199, inlinedAt: !126)
!209 = !MDLocation(line: 97, column: 4, scope: !199, inlinedAt: !126)
!210 = distinct !{!210, !181, !182}
!211 = !MDLocation(line: 96, column: 2, scope: !200, inlinedAt: !126)
!212 = distinct !{!212, !196}
!213 = distinct !{!213, !181, !182}
!214 = !MDLocation(line: 95, column: 7, scope: !202, inlinedAt: !126)
!215 = !MDLocation(line: 70, column: 27, scope: !124, inlinedAt: !126)
!216 = !{!"0x100\00t\0067\000", !55, !23, !26, !126} ; [ DW_TAG_auto_variable ] [t] [line 67]
!217 = !MDLocation(line: 67, column: 7, scope: !55, inlinedAt: !126)
!218 = !MDLocation(line: 70, column: 3, scope: !125, inlinedAt: !126)
!219 = !MDLocation(line: 132, column: 3, scope: !39)
!220 = !MDLocation(line: 132, column: 3, scope: !22)
!221 = !MDLocation(line: 132, column: 3, scope: !38)
!222 = !MDLocation(line: 132, column: 3, scope: !42)
!223 = !MDLocation(line: 132, column: 3, scope: !224)
!224 = !{!"0xb\004", !1, !42}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!225 = !{!226, !226, i64 0}
!226 = !{!"any pointer", !109, i64 0}
!227 = !{!109, !109, i64 0}
!228 = !MDLocation(line: 52, column: 12, scope: !229, inlinedAt: !235)
!229 = !{!"0xb\0052\0011\0013", !1, !230}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!230 = !{!"0xb\0050\0029\0012", !1, !231}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!231 = !{!"0xb\0050\005\0011", !1, !232}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!232 = !{!"0xb\0050\005\0010", !1, !233}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!233 = !{!"0xb\0049\003\009", !1, !234}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!234 = !{!"0xb\0049\003\008", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!235 = !MDLocation(line: 132, column: 3, scope: !236)
!236 = !{!"0xb\0023", !1, !39}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!237 = !MDLocation(line: 50, column: 5, scope: !232, inlinedAt: !235)
!238 = !MDLocation(line: 51, column: 15, scope: !230, inlinedAt: !235)
!239 = !MDLocation(line: 51, column: 45, scope: !230, inlinedAt: !235)
!240 = !MDLocation(line: 51, column: 7, scope: !230, inlinedAt: !235)
!241 = !MDLocation(line: 52, column: 11, scope: !229, inlinedAt: !235)
!242 = !MDLocation(line: 52, column: 11, scope: !230, inlinedAt: !235)
!243 = !MDLocation(line: 52, column: 42, scope: !244, inlinedAt: !235)
!244 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/adi/adi.c]
!245 = !MDLocation(line: 52, column: 34, scope: !229, inlinedAt: !235)
!246 = !MDLocation(line: 49, column: 3, scope: !234, inlinedAt: !235)
!247 = !MDLocation(line: 54, column: 11, scope: !44, inlinedAt: !235)
!248 = !MDLocation(line: 54, column: 3, scope: !44, inlinedAt: !235)
!249 = !MDLocation(line: 135, column: 3, scope: !22)
!250 = !MDLocation(line: 136, column: 3, scope: !22)
!251 = !MDLocation(line: 137, column: 3, scope: !22)
!252 = !MDLocation(line: 139, column: 3, scope: !22)
