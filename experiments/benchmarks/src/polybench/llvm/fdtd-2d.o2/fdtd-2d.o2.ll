; ModuleID = 'fdtd-2d.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !90), !dbg !91
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !90), !dbg !92
  tail call void @llvm.dbg.value(metadata i32 50, i64 0, metadata !35, metadata !90), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !36, metadata !90), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !37, metadata !90), !dbg !95
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !96
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !97
  %call2 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !98
  %call3 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !99
  %arraydecay4 = bitcast i8* %call1 to [1000 x double]*, !dbg !100
  %arraydecay6 = bitcast i8* %call3 to double*, !dbg !101
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !102, metadata !90), !dbg !104
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !105, metadata !90), !dbg !106
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !107, metadata !90), !dbg !108
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.1, %vector.body ], !dbg !103
  %induction97248 = or i64 %index, 1, !dbg !103
  %0 = trunc i64 %index to i32, !dbg !109
  %induction99249 = or i32 %0, 1, !dbg !109
  %1 = sitofp i32 %0 to double, !dbg !109
  %2 = sitofp i32 %induction99249 to double, !dbg !109
  %3 = getelementptr inbounds double* %arraydecay6, i64 %index, !dbg !112
  %4 = getelementptr inbounds double* %arraydecay6, i64 %induction97248, !dbg !112
  store double %1, double* %3, align 8, !dbg !112, !tbaa !113
  store double %2, double* %4, align 8, !dbg !112, !tbaa !113
  %index.next = add nuw nsw i64 %index, 2, !dbg !103
  %induction97248.1 = or i64 %index.next, 1, !dbg !103
  %5 = trunc i64 %index.next to i32, !dbg !109
  %induction99249.1 = or i32 %5, 1, !dbg !109
  %6 = sitofp i32 %5 to double, !dbg !109
  %7 = sitofp i32 %induction99249.1 to double, !dbg !109
  %8 = getelementptr inbounds double* %arraydecay6, i64 %index.next, !dbg !112
  %9 = getelementptr inbounds double* %arraydecay6, i64 %induction97248.1, !dbg !112
  store double %6, double* %8, align 8, !dbg !112, !tbaa !113
  store double %7, double* %9, align 8, !dbg !112, !tbaa !113
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !103
  %10 = icmp eq i64 %index.next.1, 1000, !dbg !103
  br i1 %10, label %for.cond5.preheader.i.preheader, label %vector.body, !dbg !103, !llvm.loop !117

for.cond5.preheader.i.preheader:                  ; preds = %vector.body
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !120
  %arraydecay5 = bitcast i8* %call2 to [1000 x double]*, !dbg !121
  br label %for.cond5.preheader.i, !dbg !122

for.cond5.preheader.i:                            ; preds = %for.cond5.preheader.i.preheader, %for.inc39.i
  %indvars.iv6.i = phi i64 [ %indvars.iv.next7.i, %for.inc39.i ], [ 0, %for.cond5.preheader.i.preheader ], !dbg !103
  %11 = trunc i64 %indvars.iv6.i to i32, !dbg !122
  %conv9.i = sitofp i32 %11 to double, !dbg !122
  br label %for.body8.i, !dbg !128

for.body8.i:                                      ; preds = %for.body8.i, %for.cond5.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond5.preheader.i ], [ %indvars.iv.next.i, %for.body8.i ], !dbg !103
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !128
  %12 = trunc i64 %indvars.iv.next.i to i32, !dbg !129
  %conv10.i = sitofp i32 %12 to double, !dbg !129
  %mul.i = fmul double %conv9.i, %conv10.i, !dbg !122
  %div.i = fdiv double %mul.i, 1.000000e+03, !dbg !130
  %arrayidx15.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv6.i, i64 %indvars.iv.i, !dbg !131
  store double %div.i, double* %arrayidx15.i, align 8, !dbg !131, !tbaa !113
  %13 = add nuw nsw i64 %indvars.iv.i, 2, !dbg !132
  %14 = trunc i64 %13 to i32, !dbg !133
  %conv18.i = sitofp i32 %14 to double, !dbg !133
  %mul19.i = fmul double %conv9.i, %conv18.i, !dbg !134
  %div21.i = fdiv double %mul19.i, 1.000000e+03, !dbg !135
  %arrayidx25.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv6.i, i64 %indvars.iv.i, !dbg !136
  store double %div21.i, double* %arrayidx25.i, align 8, !dbg !136, !tbaa !113
  %15 = add nuw nsw i64 %indvars.iv.i, 3, !dbg !137
  %16 = trunc i64 %15 to i32, !dbg !138
  %conv28.i = sitofp i32 %16 to double, !dbg !138
  %mul29.i = fmul double %conv9.i, %conv28.i, !dbg !139
  %div31.i = fdiv double %mul29.i, 1.000000e+03, !dbg !140
  %arrayidx35.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv6.i, i64 %indvars.iv.i, !dbg !141
  store double %div31.i, double* %arrayidx35.i, align 8, !dbg !141, !tbaa !113
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000, !dbg !128
  br i1 %exitcond.i, label %for.inc39.i, label %for.body8.i, !dbg !128

for.inc39.i:                                      ; preds = %for.body8.i
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !142
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 1000, !dbg !142
  br i1 %exitcond8.i, label %for.cond1.preheader.i88.preheader, label %for.cond5.preheader.i, !dbg !142

for.cond1.preheader.i88.preheader:                ; preds = %for.inc39.i
  %scevgep231 = getelementptr i8* %call1, i64 7992
  br label %for.cond1.preheader.i88, !dbg !143

for.cond1.preheader.i88:                          ; preds = %for.cond1.preheader.i88.preheader, %for.inc113.i
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %for.inc113.i ], [ 0, %for.cond1.preheader.i88.preheader ], !dbg !149
  %arrayidx.i87 = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv29.i, !dbg !143
  %bc232 = bitcast double* %arrayidx.i87 to i8*
  %bound0233 = icmp ule i8* %call1, %bc232
  %bc = bitcast double* %arrayidx.i87 to i8*
  %bound1234 = icmp ule i8* %bc, %scevgep231
  %memcheck.conflict236 = and i1 %bound0233, %bound1234
  br i1 %memcheck.conflict236, label %middle.block227, label %vector.body226.preheader

vector.body226.preheader:                         ; preds = %for.cond1.preheader.i88
  br label %vector.body226, !dbg !143

vector.body226:                                   ; preds = %vector.body226, %vector.body226.preheader
  %index229 = phi i64 [ 0, %vector.body226.preheader ], [ %index.next243.1, %vector.body226 ], !dbg !149
  %17 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %18 = insertelement <2 x double> undef, double %17, i32 0, !dbg !143
  %19 = insertelement <2 x double> %18, double %17, i32 1, !dbg !143
  %20 = insertelement <2 x double> undef, double %17, i32 0, !dbg !143
  %21 = insertelement <2 x double> %20, double %17, i32 1, !dbg !143
  %22 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %index229, !dbg !150
  %23 = bitcast double* %22 to <2 x double>*, !dbg !150
  store <2 x double> %19, <2 x double>* %23, align 8, !dbg !150, !tbaa !113
  %.sum250 = or i64 %index229, 2, !dbg !150
  %24 = getelementptr [1000 x double]* %arraydecay4, i64 0, i64 %.sum250, !dbg !150
  %25 = bitcast double* %24 to <2 x double>*, !dbg !150
  store <2 x double> %21, <2 x double>* %25, align 8, !dbg !150, !tbaa !113
  %index.next243 = add nuw nsw i64 %index229, 4, !dbg !149
  %26 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %27 = insertelement <2 x double> undef, double %26, i32 0, !dbg !143
  %28 = insertelement <2 x double> %27, double %26, i32 1, !dbg !143
  %29 = insertelement <2 x double> undef, double %26, i32 0, !dbg !143
  %30 = insertelement <2 x double> %29, double %26, i32 1, !dbg !143
  %31 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %index.next243, !dbg !150
  %32 = bitcast double* %31 to <2 x double>*, !dbg !150
  store <2 x double> %28, <2 x double>* %32, align 8, !dbg !150, !tbaa !113
  %.sum250.1 = or i64 %index.next243, 2, !dbg !150
  %33 = getelementptr [1000 x double]* %arraydecay4, i64 0, i64 %.sum250.1, !dbg !150
  %34 = bitcast double* %33 to <2 x double>*, !dbg !150
  store <2 x double> %30, <2 x double>* %34, align 8, !dbg !150, !tbaa !113
  %index.next243.1 = add nuw nsw i64 %index.next243, 4, !dbg !149
  %35 = icmp eq i64 %index.next243.1, 1000, !dbg !149
  br i1 %35, label %middle.block227.loopexit, label %vector.body226, !dbg !149, !llvm.loop !151

middle.block227.loopexit:                         ; preds = %vector.body226
  br label %middle.block227

middle.block227:                                  ; preds = %middle.block227.loopexit, %for.cond1.preheader.i88
  %resume.val238 = phi i1 [ false, %for.cond1.preheader.i88 ], [ true, %middle.block227.loopexit ]
  %trunc.resume.val239 = phi i64 [ 0, %for.cond1.preheader.i88 ], [ 1000, %middle.block227.loopexit ]
  br i1 %resume.val238, label %for.cond10.preheader.i.preheader, label %for.body3.i92.preheader

for.body3.i92.preheader:                          ; preds = %middle.block227
  %36 = sub i64 1000, %trunc.resume.val239
  %xtraiter = and i64 %36, 3
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %36, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body3.i92.prol.preheader, label %for.body3.i92.preheader.split

for.body3.i92.prol.preheader:                     ; preds = %for.body3.i92.preheader
  br label %for.body3.i92.prol, !dbg !143

for.body3.i92.prol:                               ; preds = %for.body3.i92.prol.preheader, %for.body3.i92.prol
  %indvars.iv.i89.prol = phi i64 [ %indvars.iv.next.i90.prol, %for.body3.i92.prol ], [ %trunc.resume.val239, %for.body3.i92.prol.preheader ], !dbg !149
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.i92.prol ], [ %xtraiter, %for.body3.i92.prol.preheader ]
  %37 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %arrayidx6.i.prol = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %indvars.iv.i89.prol, !dbg !150
  store double %37, double* %arrayidx6.i.prol, align 8, !dbg !150, !tbaa !113
  %indvars.iv.next.i90.prol = add nuw nsw i64 %indvars.iv.i89.prol, 1, !dbg !152
  %exitcond.i91.prol = icmp eq i64 %indvars.iv.next.i90.prol, 1000, !dbg !152
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !152
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !152
  br i1 %prol.iter.cmp, label %for.body3.i92.prol, label %for.body3.i92.preheader.split.loopexit, !llvm.loop !153

for.body3.i92.preheader.split.loopexit:           ; preds = %for.body3.i92.prol
  %indvars.iv.i89.unr.ph = phi i64 [ %indvars.iv.next.i90.prol, %for.body3.i92.prol ]
  br label %for.body3.i92.preheader.split

for.body3.i92.preheader.split:                    ; preds = %for.body3.i92.preheader.split.loopexit, %for.body3.i92.preheader
  %indvars.iv.i89.unr = phi i64 [ %trunc.resume.val239, %for.body3.i92.preheader ], [ %indvars.iv.i89.unr.ph, %for.body3.i92.preheader.split.loopexit ]
  %38 = icmp ult i64 %36, 4
  br i1 %38, label %for.cond10.preheader.i.preheader.loopexit, label %for.body3.i92.preheader.split.split

for.body3.i92.preheader.split.split:              ; preds = %for.body3.i92.preheader.split
  br label %for.body3.i92, !dbg !143

for.body3.i92:                                    ; preds = %for.body3.i92, %for.body3.i92.preheader.split.split
  %indvars.iv.i89 = phi i64 [ %indvars.iv.i89.unr, %for.body3.i92.preheader.split.split ], [ %indvars.iv.next.i90.3, %for.body3.i92 ], !dbg !149
  %39 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %arrayidx6.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %indvars.iv.i89, !dbg !150
  store double %39, double* %arrayidx6.i, align 8, !dbg !150, !tbaa !113
  %indvars.iv.next.i90 = add nuw nsw i64 %indvars.iv.i89, 1, !dbg !152
  %40 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %arrayidx6.i.1 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %indvars.iv.next.i90, !dbg !150
  store double %40, double* %arrayidx6.i.1, align 8, !dbg !150, !tbaa !113
  %indvars.iv.next.i90.1 = add nuw nsw i64 %indvars.iv.next.i90, 1, !dbg !152
  %41 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %arrayidx6.i.2 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %indvars.iv.next.i90.1, !dbg !150
  store double %41, double* %arrayidx6.i.2, align 8, !dbg !150, !tbaa !113
  %indvars.iv.next.i90.2 = add nuw nsw i64 %indvars.iv.next.i90.1, 1, !dbg !152
  %42 = load double* %arrayidx.i87, align 8, !dbg !143, !tbaa !113
  %arrayidx6.i.3 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 0, i64 %indvars.iv.next.i90.2, !dbg !150
  store double %42, double* %arrayidx6.i.3, align 8, !dbg !150, !tbaa !113
  %indvars.iv.next.i90.3 = add nuw nsw i64 %indvars.iv.next.i90.2, 1, !dbg !152
  %exitcond.i91.3 = icmp eq i64 %indvars.iv.next.i90.3, 1000, !dbg !152
  br i1 %exitcond.i91.3, label %for.cond10.preheader.i.preheader.loopexit.unr-lcssa, label %for.body3.i92, !dbg !152, !llvm.loop !155

for.cond10.preheader.i.preheader.loopexit.unr-lcssa: ; preds = %for.body3.i92
  br label %for.cond10.preheader.i.preheader.loopexit

for.cond10.preheader.i.preheader.loopexit:        ; preds = %for.body3.i92.preheader.split, %for.cond10.preheader.i.preheader.loopexit.unr-lcssa
  br label %for.cond10.preheader.i.preheader

for.cond10.preheader.i.preheader:                 ; preds = %for.cond10.preheader.i.preheader.loopexit, %middle.block227
  br label %for.cond10.preheader.i, !dbg !156

for.cond10.preheader.i:                           ; preds = %for.cond10.preheader.i.preheader, %for.inc34.i
  %indvar = phi i64 [ %indvar.next, %for.inc34.i ], [ 0, %for.cond10.preheader.i.preheader ]
  %indvars.iv12.i = phi i64 [ %indvars.iv.next13.i, %for.inc34.i ], [ 1, %for.cond10.preheader.i.preheader ], !dbg !149
  %43 = mul i64 %indvar, 8000, !dbg !156
  %44 = add i64 %43, 8000, !dbg !156
  %scevgep192 = getelementptr i8* %call1, i64 %44
  %45 = add i64 %43, 15992, !dbg !156
  %scevgep193 = getelementptr i8* %call1, i64 %45
  %46 = add nsw i64 %indvars.iv12.i, -1, !dbg !156
  %scevgep195 = getelementptr i8* %call2, i64 %45
  %bound0198 = icmp ule i8* %scevgep192, %scevgep195
  %scevgep194 = getelementptr i8* %call2, i64 %44
  %bound1199 = icmp ule i8* %scevgep194, %scevgep193
  %found.conflict200 = and i1 %bound0198, %bound1199
  %47 = add i64 %43, 7992, !dbg !156
  %scevgep197 = getelementptr i8* %call2, i64 %47
  %bound0201 = icmp ule i8* %scevgep192, %scevgep197
  %scevgep196 = getelementptr i8* %call2, i64 %43
  %bound1202 = icmp ule i8* %scevgep196, %scevgep193
  %found.conflict203 = and i1 %bound0201, %bound1202
  %conflict.rdx204 = or i1 %found.conflict200, %found.conflict203
  br i1 %conflict.rdx204, label %middle.block188, label %vector.body187.preheader

vector.body187.preheader:                         ; preds = %for.cond10.preheader.i
  br label %vector.body187, !dbg !161

vector.body187:                                   ; preds = %vector.body187.preheader, %vector.body187
  %index190 = phi i64 [ %index.next212, %vector.body187 ], [ 0, %vector.body187.preheader ], !dbg !149
  %48 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %index190, !dbg !161
  %49 = bitcast double* %48 to <2 x double>*, !dbg !161
  %wide.load217 = load <2 x double>* %49, align 8, !dbg !161, !tbaa !113
  %.sum251 = or i64 %index190, 2, !dbg !161
  %50 = getelementptr [1000 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %.sum251, !dbg !161
  %51 = bitcast double* %50 to <2 x double>*, !dbg !161
  %wide.load218 = load <2 x double>* %51, align 8, !dbg !161, !tbaa !113
  %52 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv12.i, i64 %index190, !dbg !162
  %53 = bitcast double* %52 to <2 x double>*, !dbg !162
  %wide.load219 = load <2 x double>* %53, align 8, !dbg !162, !tbaa !113
  %.sum252 = or i64 %index190, 2, !dbg !162
  %54 = getelementptr [1000 x double]* %arraydecay5, i64 %indvars.iv12.i, i64 %.sum252, !dbg !162
  %55 = bitcast double* %54 to <2 x double>*, !dbg !162
  %wide.load220 = load <2 x double>* %55, align 8, !dbg !162, !tbaa !113
  %56 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %46, i64 %index190, !dbg !163
  %57 = bitcast double* %56 to <2 x double>*, !dbg !163
  %wide.load221 = load <2 x double>* %57, align 8, !dbg !163, !tbaa !113
  %.sum253 = or i64 %index190, 2, !dbg !163
  %58 = getelementptr [1000 x double]* %arraydecay5, i64 %46, i64 %.sum253, !dbg !163
  %59 = bitcast double* %58 to <2 x double>*, !dbg !163
  %wide.load222 = load <2 x double>* %59, align 8, !dbg !163, !tbaa !113
  %60 = fsub <2 x double> %wide.load219, %wide.load221, !dbg !162
  %61 = fsub <2 x double> %wide.load220, %wide.load222, !dbg !162
  %62 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>, !dbg !164
  %63 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>, !dbg !164
  %64 = fsub <2 x double> %wide.load217, %62, !dbg !161
  %65 = fsub <2 x double> %wide.load218, %63, !dbg !161
  %66 = bitcast double* %48 to <2 x double>*, !dbg !165
  store <2 x double> %64, <2 x double>* %66, align 8, !dbg !165, !tbaa !113
  %67 = bitcast double* %50 to <2 x double>*, !dbg !165
  store <2 x double> %65, <2 x double>* %67, align 8, !dbg !165, !tbaa !113
  %index.next212 = add i64 %index190, 4, !dbg !149
  %68 = icmp eq i64 %index.next212, 1000, !dbg !149
  br i1 %68, label %middle.block188.loopexit, label %vector.body187, !dbg !149, !llvm.loop !166

middle.block188.loopexit:                         ; preds = %vector.body187
  br label %middle.block188

middle.block188:                                  ; preds = %middle.block188.loopexit, %for.cond10.preheader.i
  %resume.val207 = phi i1 [ false, %for.cond10.preheader.i ], [ true, %middle.block188.loopexit ]
  %trunc.resume.val208 = phi i64 [ 0, %for.cond10.preheader.i ], [ 1000, %middle.block188.loopexit ]
  br i1 %resume.val207, label %for.inc34.i, label %for.body12.i.preheader

for.body12.i.preheader:                           ; preds = %middle.block188
  %69 = sub i64 1000, %trunc.resume.val208
  %xtraiter266 = and i64 %69, 1
  %lcmp.mod267 = icmp ne i64 %xtraiter266, 0
  %lcmp.overflow268 = icmp eq i64 %69, 0
  %lcmp.or269 = or i1 %lcmp.overflow268, %lcmp.mod267
  br i1 %lcmp.or269, label %for.body12.i.prol.preheader, label %for.body12.i.preheader.split

for.body12.i.prol.preheader:                      ; preds = %for.body12.i.preheader
  br label %for.body12.i.prol, !dbg !161

for.body12.i.prol:                                ; preds = %for.body12.i.prol.preheader, %for.body12.i.prol
  %indvars.iv9.i93.prol = phi i64 [ %indvars.iv.next10.i95.prol, %for.body12.i.prol ], [ %trunc.resume.val208, %for.body12.i.prol.preheader ], !dbg !149
  %prol.iter270 = phi i64 [ %prol.iter270.sub, %for.body12.i.prol ], [ %xtraiter266, %for.body12.i.prol.preheader ]
  %arrayidx16.i.prol = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv9.i93.prol, !dbg !161
  %70 = load double* %arrayidx16.i.prol, align 8, !dbg !161, !tbaa !113
  %arrayidx20.i.prol = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv12.i, i64 %indvars.iv9.i93.prol, !dbg !162
  %71 = load double* %arrayidx20.i.prol, align 8, !dbg !162, !tbaa !113
  %arrayidx24.i.prol = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %46, i64 %indvars.iv9.i93.prol, !dbg !163
  %72 = load double* %arrayidx24.i.prol, align 8, !dbg !163, !tbaa !113
  %sub25.i.prol = fsub double %71, %72, !dbg !162
  %mul.i94.prol = fmul double %sub25.i.prol, 5.000000e-01, !dbg !164
  %sub26.i.prol = fsub double %70, %mul.i94.prol, !dbg !161
  store double %sub26.i.prol, double* %arrayidx16.i.prol, align 8, !dbg !165, !tbaa !113
  %indvars.iv.next10.i95.prol = add nuw nsw i64 %indvars.iv9.i93.prol, 1, !dbg !167
  %exitcond11.i96.prol = icmp eq i64 %indvars.iv.next10.i95.prol, 1000, !dbg !167
  %prol.iter270.sub = sub i64 %prol.iter270, 1, !dbg !167
  %prol.iter270.cmp = icmp ne i64 %prol.iter270.sub, 0, !dbg !167
  br i1 %prol.iter270.cmp, label %for.body12.i.prol, label %for.body12.i.preheader.split.loopexit, !llvm.loop !168

for.body12.i.preheader.split.loopexit:            ; preds = %for.body12.i.prol
  %indvars.iv9.i93.unr.ph = phi i64 [ %indvars.iv.next10.i95.prol, %for.body12.i.prol ]
  br label %for.body12.i.preheader.split

for.body12.i.preheader.split:                     ; preds = %for.body12.i.preheader.split.loopexit, %for.body12.i.preheader
  %indvars.iv9.i93.unr = phi i64 [ %trunc.resume.val208, %for.body12.i.preheader ], [ %indvars.iv9.i93.unr.ph, %for.body12.i.preheader.split.loopexit ]
  %73 = icmp ult i64 %69, 2
  br i1 %73, label %for.inc34.i.loopexit, label %for.body12.i.preheader.split.split

for.body12.i.preheader.split.split:               ; preds = %for.body12.i.preheader.split
  br label %for.body12.i, !dbg !161

for.body12.i:                                     ; preds = %for.body12.i, %for.body12.i.preheader.split.split
  %indvars.iv9.i93 = phi i64 [ %indvars.iv9.i93.unr, %for.body12.i.preheader.split.split ], [ %indvars.iv.next10.i95.1, %for.body12.i ], !dbg !149
  %arrayidx16.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv9.i93, !dbg !161
  %74 = load double* %arrayidx16.i, align 8, !dbg !161, !tbaa !113
  %arrayidx20.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv12.i, i64 %indvars.iv9.i93, !dbg !162
  %75 = load double* %arrayidx20.i, align 8, !dbg !162, !tbaa !113
  %arrayidx24.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %46, i64 %indvars.iv9.i93, !dbg !163
  %76 = load double* %arrayidx24.i, align 8, !dbg !163, !tbaa !113
  %sub25.i = fsub double %75, %76, !dbg !162
  %mul.i94 = fmul double %sub25.i, 5.000000e-01, !dbg !164
  %sub26.i = fsub double %74, %mul.i94, !dbg !161
  store double %sub26.i, double* %arrayidx16.i, align 8, !dbg !165, !tbaa !113
  %indvars.iv.next10.i95 = add nuw nsw i64 %indvars.iv9.i93, 1, !dbg !167
  %arrayidx16.i.1 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i95, !dbg !161
  %77 = load double* %arrayidx16.i.1, align 8, !dbg !161, !tbaa !113
  %arrayidx20.i.1 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv12.i, i64 %indvars.iv.next10.i95, !dbg !162
  %78 = load double* %arrayidx20.i.1, align 8, !dbg !162, !tbaa !113
  %arrayidx24.i.1 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %46, i64 %indvars.iv.next10.i95, !dbg !163
  %79 = load double* %arrayidx24.i.1, align 8, !dbg !163, !tbaa !113
  %sub25.i.1 = fsub double %78, %79, !dbg !162
  %mul.i94.1 = fmul double %sub25.i.1, 5.000000e-01, !dbg !164
  %sub26.i.1 = fsub double %77, %mul.i94.1, !dbg !161
  store double %sub26.i.1, double* %arrayidx16.i.1, align 8, !dbg !165, !tbaa !113
  %indvars.iv.next10.i95.1 = add nuw nsw i64 %indvars.iv.next10.i95, 1, !dbg !167
  %exitcond11.i96.1 = icmp eq i64 %indvars.iv.next10.i95.1, 1000, !dbg !167
  br i1 %exitcond11.i96.1, label %for.inc34.i.loopexit.unr-lcssa, label %for.body12.i, !dbg !167, !llvm.loop !169

for.inc34.i.loopexit.unr-lcssa:                   ; preds = %for.body12.i
  br label %for.inc34.i.loopexit

for.inc34.i.loopexit:                             ; preds = %for.body12.i.preheader.split, %for.inc34.i.loopexit.unr-lcssa
  br label %for.inc34.i

for.inc34.i:                                      ; preds = %for.inc34.i.loopexit, %middle.block188
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1, !dbg !170
  %exitcond15.i = icmp eq i64 %indvars.iv.next13.i, 1000, !dbg !170
  %indvar.next = add i64 %indvar, 1, !dbg !170
  br i1 %exitcond15.i, label %for.cond40.preheader.i.preheader, label %for.cond10.preheader.i, !dbg !170

for.cond40.preheader.i.preheader:                 ; preds = %for.inc34.i
  br label %for.cond40.preheader.i

for.cond40.preheader.i:                           ; preds = %for.cond40.preheader.i.preheader, %for.inc66.i
  %indvars.iv20.i = phi i64 [ %indvars.iv.next21.i, %for.inc66.i ], [ 0, %for.cond40.preheader.i.preheader ], !dbg !149
  %80 = mul i64 %indvars.iv20.i, 8000
  %81 = or i64 %80, 8
  %scevgep153 = getelementptr i8* %call, i64 %81
  %82 = add i64 %80, 7992
  %scevgep154 = getelementptr i8* %call, i64 %82
  %scevgep156 = getelementptr i8* %call2, i64 %82
  %bound0159 = icmp ule i8* %scevgep153, %scevgep156
  %scevgep155 = getelementptr i8* %call2, i64 %81
  %bound1160 = icmp ule i8* %scevgep155, %scevgep154
  %found.conflict161 = and i1 %bound0159, %bound1160
  %83 = add i64 %80, 7984
  %scevgep158 = getelementptr i8* %call2, i64 %83
  %bound0162 = icmp ule i8* %scevgep153, %scevgep158
  %scevgep157 = getelementptr i8* %call2, i64 %80
  %bound1163 = icmp ule i8* %scevgep157, %scevgep154
  %found.conflict164 = and i1 %bound0162, %bound1163
  %conflict.rdx165 = or i1 %found.conflict161, %found.conflict164
  br i1 %conflict.rdx165, label %for.body42.i.preheader, label %vector.body148.preheader

vector.body148.preheader:                         ; preds = %for.cond40.preheader.i
  br label %vector.body148, !dbg !171

vector.body148:                                   ; preds = %vector.body148.preheader, %vector.body148
  %index151 = phi i64 [ %index.next173, %vector.body148 ], [ 1, %vector.body148.preheader ], !dbg !149
  %84 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %index151, !dbg !171
  %85 = bitcast double* %84 to <2 x double>*, !dbg !171
  %wide.load178 = load <2 x double>* %85, align 8, !dbg !171, !tbaa !113
  %.sum = add i64 %index151, 2, !dbg !171
  %86 = getelementptr [1000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %.sum, !dbg !171
  %87 = bitcast double* %86 to <2 x double>*, !dbg !171
  %wide.load179 = load <2 x double>* %87, align 8, !dbg !171, !tbaa !113
  %88 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %index151, !dbg !176
  %89 = bitcast double* %88 to <2 x double>*, !dbg !176
  %wide.load180 = load <2 x double>* %89, align 8, !dbg !176, !tbaa !113
  %.sum254 = add i64 %index151, 2, !dbg !176
  %90 = getelementptr [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %.sum254, !dbg !176
  %91 = bitcast double* %90 to <2 x double>*, !dbg !176
  %wide.load181 = load <2 x double>* %91, align 8, !dbg !176, !tbaa !113
  %92 = add i64 %index151, -1, !dbg !177
  %93 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %92, !dbg !177
  %94 = bitcast double* %93 to <2 x double>*, !dbg !177
  %wide.load182 = load <2 x double>* %94, align 8, !dbg !177, !tbaa !113
  %.sum255 = add i64 %index151, 1, !dbg !177
  %95 = getelementptr [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %.sum255, !dbg !177
  %96 = bitcast double* %95 to <2 x double>*, !dbg !177
  %wide.load183 = load <2 x double>* %96, align 8, !dbg !177, !tbaa !113
  %97 = fsub <2 x double> %wide.load180, %wide.load182, !dbg !176
  %98 = fsub <2 x double> %wide.load181, %wide.load183, !dbg !176
  %99 = fmul <2 x double> %97, <double 5.000000e-01, double 5.000000e-01>, !dbg !178
  %100 = fmul <2 x double> %98, <double 5.000000e-01, double 5.000000e-01>, !dbg !178
  %101 = fsub <2 x double> %wide.load178, %99, !dbg !171
  %102 = fsub <2 x double> %wide.load179, %100, !dbg !171
  %103 = bitcast double* %84 to <2 x double>*, !dbg !179
  store <2 x double> %101, <2 x double>* %103, align 8, !dbg !179, !tbaa !113
  %104 = bitcast double* %86 to <2 x double>*, !dbg !179
  store <2 x double> %102, <2 x double>* %104, align 8, !dbg !179, !tbaa !113
  %index.next173 = add i64 %index151, 4, !dbg !149
  %105 = icmp eq i64 %index.next173, 997, !dbg !149
  br i1 %105, label %for.body42.i.preheader.loopexit, label %vector.body148, !dbg !149, !llvm.loop !180

for.body42.i.preheader.loopexit:                  ; preds = %vector.body148
  br label %for.body42.i.preheader

for.body42.i.preheader:                           ; preds = %for.body42.i.preheader.loopexit, %for.cond40.preheader.i
  %indvars.iv16.i.ph = phi i64 [ 1, %for.cond40.preheader.i ], [ 997, %for.body42.i.preheader.loopexit ]
  %106 = sub i64 1000, %indvars.iv16.i.ph
  %xtraiter271 = and i64 %106, 1
  %lcmp.mod272 = icmp ne i64 %xtraiter271, 0
  %lcmp.overflow273 = icmp eq i64 %106, 0
  %lcmp.or274 = or i1 %lcmp.overflow273, %lcmp.mod272
  br i1 %lcmp.or274, label %for.body42.i.prol.preheader, label %for.body42.i.preheader.split

for.body42.i.prol.preheader:                      ; preds = %for.body42.i.preheader
  br label %for.body42.i.prol, !dbg !171

for.body42.i.prol:                                ; preds = %for.body42.i.prol.preheader, %for.body42.i.prol
  %indvars.iv16.i.prol = phi i64 [ %indvars.iv.next17.i.prol, %for.body42.i.prol ], [ %indvars.iv16.i.ph, %for.body42.i.prol.preheader ], !dbg !149
  %prol.iter275 = phi i64 [ %prol.iter275.sub, %for.body42.i.prol ], [ %xtraiter271, %for.body42.i.prol.preheader ]
  %arrayidx46.i.prol = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %indvars.iv16.i.prol, !dbg !171
  %107 = load double* %arrayidx46.i.prol, align 8, !dbg !171, !tbaa !113
  %arrayidx50.i.prol = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %indvars.iv16.i.prol, !dbg !176
  %108 = load double* %arrayidx50.i.prol, align 8, !dbg !176, !tbaa !113
  %109 = add nsw i64 %indvars.iv16.i.prol, -1, !dbg !181
  %arrayidx55.i.prol = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %109, !dbg !177
  %110 = load double* %arrayidx55.i.prol, align 8, !dbg !177, !tbaa !113
  %sub56.i.prol = fsub double %108, %110, !dbg !176
  %mul57.i.prol = fmul double %sub56.i.prol, 5.000000e-01, !dbg !178
  %sub58.i.prol = fsub double %107, %mul57.i.prol, !dbg !171
  store double %sub58.i.prol, double* %arrayidx46.i.prol, align 8, !dbg !179, !tbaa !113
  %indvars.iv.next17.i.prol = add nuw nsw i64 %indvars.iv16.i.prol, 1, !dbg !182
  %exitcond19.i.prol = icmp eq i64 %indvars.iv.next17.i.prol, 1000, !dbg !182
  %prol.iter275.sub = sub i64 %prol.iter275, 1, !dbg !182
  %prol.iter275.cmp = icmp ne i64 %prol.iter275.sub, 0, !dbg !182
  br i1 %prol.iter275.cmp, label %for.body42.i.prol, label %for.body42.i.preheader.split.loopexit, !llvm.loop !183

for.body42.i.preheader.split.loopexit:            ; preds = %for.body42.i.prol
  %indvars.iv16.i.unr.ph = phi i64 [ %indvars.iv.next17.i.prol, %for.body42.i.prol ]
  br label %for.body42.i.preheader.split

for.body42.i.preheader.split:                     ; preds = %for.body42.i.preheader.split.loopexit, %for.body42.i.preheader
  %indvars.iv16.i.unr = phi i64 [ %indvars.iv16.i.ph, %for.body42.i.preheader ], [ %indvars.iv16.i.unr.ph, %for.body42.i.preheader.split.loopexit ]
  %111 = icmp ult i64 %106, 2
  br i1 %111, label %for.inc66.i, label %for.body42.i.preheader.split.split

for.body42.i.preheader.split.split:               ; preds = %for.body42.i.preheader.split
  br label %for.body42.i, !dbg !171

for.body42.i:                                     ; preds = %for.body42.i, %for.body42.i.preheader.split.split
  %indvars.iv16.i = phi i64 [ %indvars.iv16.i.unr, %for.body42.i.preheader.split.split ], [ %indvars.iv.next17.i.1, %for.body42.i ], !dbg !149
  %arrayidx46.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %indvars.iv16.i, !dbg !171
  %112 = load double* %arrayidx46.i, align 8, !dbg !171, !tbaa !113
  %arrayidx50.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %indvars.iv16.i, !dbg !176
  %113 = load double* %arrayidx50.i, align 8, !dbg !176, !tbaa !113
  %114 = add nsw i64 %indvars.iv16.i, -1, !dbg !181
  %arrayidx55.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %114, !dbg !177
  %115 = load double* %arrayidx55.i, align 8, !dbg !177, !tbaa !113
  %sub56.i = fsub double %113, %115, !dbg !176
  %mul57.i = fmul double %sub56.i, 5.000000e-01, !dbg !178
  %sub58.i = fsub double %112, %mul57.i, !dbg !171
  store double %sub58.i, double* %arrayidx46.i, align 8, !dbg !179, !tbaa !113
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !182
  %arrayidx46.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv20.i, i64 %indvars.iv.next17.i, !dbg !171
  %116 = load double* %arrayidx46.i.1, align 8, !dbg !171, !tbaa !113
  %arrayidx50.i.1 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %indvars.iv.next17.i, !dbg !176
  %117 = load double* %arrayidx50.i.1, align 8, !dbg !176, !tbaa !113
  %arrayidx55.i.1 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv20.i, i64 %indvars.iv16.i, !dbg !177
  %118 = load double* %arrayidx55.i.1, align 8, !dbg !177, !tbaa !113
  %sub56.i.1 = fsub double %117, %118, !dbg !176
  %mul57.i.1 = fmul double %sub56.i.1, 5.000000e-01, !dbg !178
  %sub58.i.1 = fsub double %116, %mul57.i.1, !dbg !171
  store double %sub58.i.1, double* %arrayidx46.i.1, align 8, !dbg !179, !tbaa !113
  %indvars.iv.next17.i.1 = add nuw nsw i64 %indvars.iv.next17.i, 1, !dbg !182
  %exitcond19.i.1 = icmp eq i64 %indvars.iv.next17.i.1, 1000, !dbg !182
  br i1 %exitcond19.i.1, label %for.inc66.i.unr-lcssa, label %for.body42.i, !dbg !182, !llvm.loop !184

for.inc66.i.unr-lcssa:                            ; preds = %for.body42.i
  br label %for.inc66.i

for.inc66.i:                                      ; preds = %for.body42.i.preheader.split, %for.inc66.i.unr-lcssa
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !185
  %exitcond22.i = icmp eq i64 %indvars.iv.next21.i, 1000, !dbg !185
  br i1 %exitcond22.i, label %for.cond73.preheader.i.preheader, label %for.cond40.preheader.i, !dbg !185

for.cond73.preheader.i.preheader:                 ; preds = %for.inc66.i
  br label %for.cond73.preheader.i, !dbg !186

for.cond73.preheader.i:                           ; preds = %for.cond73.preheader.i.preheader, %for.inc110.i
  %indvars.iv26.i = phi i64 [ %indvars.iv.next27.i, %for.inc110.i ], [ 0, %for.cond73.preheader.i.preheader ], !dbg !149
  %119 = mul i64 %indvars.iv26.i, 8000, !dbg !186
  %scevgep = getelementptr i8* %call2, i64 %119
  %120 = add i64 %119, 7984, !dbg !186
  %scevgep108 = getelementptr i8* %call2, i64 %120
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1, !dbg !186
  %121 = add i64 %119, 7992, !dbg !186
  %scevgep110 = getelementptr i8* %call, i64 %121
  %bound0 = icmp ule i8* %scevgep, %scevgep110
  %122 = or i64 %119, 8, !dbg !186
  %scevgep109 = getelementptr i8* %call, i64 %122
  %bound1 = icmp ule i8* %scevgep109, %scevgep108
  %found.conflict = and i1 %bound0, %bound1
  %scevgep112 = getelementptr i8* %call, i64 %120
  %bound0117 = icmp ule i8* %scevgep, %scevgep112
  %scevgep111 = getelementptr i8* %call, i64 %119
  %bound1118 = icmp ule i8* %scevgep111, %scevgep108
  %found.conflict119 = and i1 %bound0117, %bound1118
  %conflict.rdx = or i1 %found.conflict, %found.conflict119
  %123 = add i64 %119, 15984, !dbg !186
  %scevgep114 = getelementptr i8* %call1, i64 %123
  %bound0120 = icmp ule i8* %scevgep, %scevgep114
  %124 = add i64 %119, 8000, !dbg !186
  %scevgep113 = getelementptr i8* %call1, i64 %124
  %bound1121 = icmp ule i8* %scevgep113, %scevgep108
  %found.conflict122 = and i1 %bound0120, %bound1121
  %conflict.rdx123 = or i1 %conflict.rdx, %found.conflict122
  %scevgep116 = getelementptr i8* %call1, i64 %120
  %bound0124 = icmp ule i8* %scevgep, %scevgep116
  %scevgep115 = getelementptr i8* %call1, i64 %119
  %bound1125 = icmp ule i8* %scevgep115, %scevgep108
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx127 = or i1 %conflict.rdx123, %found.conflict126
  br i1 %conflict.rdx127, label %for.body76.i.preheader, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %for.cond73.preheader.i
  br label %vector.body103, !dbg !188

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index106 = phi i64 [ %index.next133, %vector.body103 ], [ 0, %vector.body103.preheader ], !dbg !149
  %125 = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv26.i, i64 %index106, !dbg !188
  %126 = bitcast double* %125 to <2 x double>*, !dbg !188
  %wide.load = load <2 x double>* %126, align 8, !dbg !188, !tbaa !113
  %.sum256257 = or i64 %index106, 2, !dbg !188
  %127 = getelementptr [1000 x double]* %arraydecay5, i64 %indvars.iv26.i, i64 %.sum256257, !dbg !188
  %128 = bitcast double* %127 to <2 x double>*, !dbg !188
  %wide.load136 = load <2 x double>* %128, align 8, !dbg !188, !tbaa !113
  %129 = or i64 %index106, 1, !dbg !192
  %130 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %129, !dbg !192
  %131 = bitcast double* %130 to <2 x double>*, !dbg !192
  %wide.load137 = load <2 x double>* %131, align 8, !dbg !192, !tbaa !113
  %.sum258265 = or i64 %index106, 3, !dbg !192
  %132 = getelementptr [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %.sum258265, !dbg !192
  %133 = bitcast double* %132 to <2 x double>*, !dbg !192
  %wide.load138 = load <2 x double>* %133, align 8, !dbg !192, !tbaa !113
  %134 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %index106, !dbg !193
  %135 = bitcast double* %134 to <2 x double>*, !dbg !193
  %wide.load139 = load <2 x double>* %135, align 8, !dbg !193, !tbaa !113
  %.sum259260 = or i64 %index106, 2, !dbg !193
  %136 = getelementptr [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %.sum259260, !dbg !193
  %137 = bitcast double* %136 to <2 x double>*, !dbg !193
  %wide.load140 = load <2 x double>* %137, align 8, !dbg !193, !tbaa !113
  %138 = fsub <2 x double> %wide.load137, %wide.load139, !dbg !192
  %139 = fsub <2 x double> %wide.load138, %wide.load140, !dbg !192
  %140 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv.next27.i, i64 %index106, !dbg !194
  %141 = bitcast double* %140 to <2 x double>*, !dbg !194
  %wide.load141 = load <2 x double>* %141, align 8, !dbg !194, !tbaa !113
  %.sum261262 = or i64 %index106, 2, !dbg !194
  %142 = getelementptr [1000 x double]* %arraydecay4, i64 %indvars.iv.next27.i, i64 %.sum261262, !dbg !194
  %143 = bitcast double* %142 to <2 x double>*, !dbg !194
  %wide.load142 = load <2 x double>* %143, align 8, !dbg !194, !tbaa !113
  %144 = fadd <2 x double> %138, %wide.load141, !dbg !192
  %145 = fadd <2 x double> %139, %wide.load142, !dbg !192
  %146 = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv26.i, i64 %index106, !dbg !195
  %147 = bitcast double* %146 to <2 x double>*, !dbg !195
  %wide.load143 = load <2 x double>* %147, align 8, !dbg !195, !tbaa !113
  %.sum263264 = or i64 %index106, 2, !dbg !195
  %148 = getelementptr [1000 x double]* %arraydecay4, i64 %indvars.iv26.i, i64 %.sum263264, !dbg !195
  %149 = bitcast double* %148 to <2 x double>*, !dbg !195
  %wide.load144 = load <2 x double>* %149, align 8, !dbg !195, !tbaa !113
  %150 = fsub <2 x double> %144, %wide.load143, !dbg !192
  %151 = fsub <2 x double> %145, %wide.load144, !dbg !192
  %152 = fmul <2 x double> %150, <double 7.000000e-01, double 7.000000e-01>, !dbg !196
  %153 = fmul <2 x double> %151, <double 7.000000e-01, double 7.000000e-01>, !dbg !196
  %154 = fsub <2 x double> %wide.load, %152, !dbg !188
  %155 = fsub <2 x double> %wide.load136, %153, !dbg !188
  %156 = bitcast double* %125 to <2 x double>*, !dbg !197
  store <2 x double> %154, <2 x double>* %156, align 8, !dbg !197, !tbaa !113
  %157 = bitcast double* %127 to <2 x double>*, !dbg !197
  store <2 x double> %155, <2 x double>* %157, align 8, !dbg !197, !tbaa !113
  %index.next133 = add i64 %index106, 4, !dbg !149
  %158 = icmp eq i64 %index.next133, 996, !dbg !149
  br i1 %158, label %for.body76.i.preheader.loopexit, label %vector.body103, !dbg !149, !llvm.loop !198

for.body76.i.preheader.loopexit:                  ; preds = %vector.body103
  br label %for.body76.i.preheader

for.body76.i.preheader:                           ; preds = %for.body76.i.preheader.loopexit, %for.cond73.preheader.i
  %indvars.iv23.i.ph = phi i64 [ 0, %for.cond73.preheader.i ], [ 996, %for.body76.i.preheader.loopexit ]
  br label %for.body76.i, !dbg !188

for.body76.i:                                     ; preds = %for.body76.i.preheader, %for.body76.i
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.body76.i ], [ %indvars.iv23.i.ph, %for.body76.i.preheader ], !dbg !149
  %arrayidx80.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv26.i, i64 %indvars.iv23.i, !dbg !188
  %159 = load double* %arrayidx80.i, align 8, !dbg !188, !tbaa !113
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !199
  %arrayidx84.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %indvars.iv.next24.i, !dbg !192
  %160 = load double* %arrayidx84.i, align 8, !dbg !192, !tbaa !113
  %arrayidx88.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %indvars.iv23.i, !dbg !193
  %161 = load double* %arrayidx88.i, align 8, !dbg !193, !tbaa !113
  %sub89.i = fsub double %160, %161, !dbg !192
  %arrayidx94.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv.next27.i, i64 %indvars.iv23.i, !dbg !194
  %162 = load double* %arrayidx94.i, align 8, !dbg !194, !tbaa !113
  %add95.i = fadd double %sub89.i, %162, !dbg !192
  %arrayidx99.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv26.i, i64 %indvars.iv23.i, !dbg !195
  %163 = load double* %arrayidx99.i, align 8, !dbg !195, !tbaa !113
  %sub100.i = fsub double %add95.i, %163, !dbg !192
  %mul101.i = fmul double %sub100.i, 7.000000e-01, !dbg !196
  %sub102.i = fsub double %159, %mul101.i, !dbg !188
  store double %sub102.i, double* %arrayidx80.i, align 8, !dbg !197, !tbaa !113
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 999, !dbg !199
  br i1 %exitcond25.i, label %for.inc110.i, label %for.body76.i, !dbg !199, !llvm.loop !200

for.inc110.i:                                     ; preds = %for.body76.i
  %exitcond28.i = icmp eq i64 %indvars.iv.next27.i, 999, !dbg !186
  br i1 %exitcond28.i, label %for.inc113.i, label %for.cond73.preheader.i, !dbg !186

for.inc113.i:                                     ; preds = %for.inc110.i
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1, !dbg !201
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 50, !dbg !201
  br i1 %exitcond31.i, label %kernel_fdtd_2d.exit, label %for.cond1.preheader.i88, !dbg !201

kernel_fdtd_2d.exit:                              ; preds = %for.inc113.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !202
  br i1 %cmp, label %if.end47, label %if.end56, !dbg !203

if.end47:                                         ; preds = %kernel_fdtd_2d.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !90), !dbg !204
  tail call void @llvm.dbg.value(metadata i8* %164, i64 0, metadata !46, metadata !90), !dbg !205
  %164 = load i8** %argv, align 8, !dbg !206, !tbaa !208
  %165 = load i8* %164, align 1, !dbg !206, !tbaa !210
  %phitmp = icmp eq i8 %165, 0, !dbg !204
  br i1 %phitmp, label %for.cond1.preheader.i.preheader, label %if.end56, !dbg !203

for.cond1.preheader.i.preheader:                  ; preds = %if.end47
  br label %for.cond1.preheader.i, !dbg !211

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc18.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc18.i ], [ 0, %for.cond1.preheader.i.preheader ], !dbg !218
  %166 = mul nsw i64 %indvars.iv7.i, 1000, !dbg !211
  br label %for.body3.i, !dbg !220

for.body3.i:                                      ; preds = %for.inc.i, %for.cond1.preheader.i
  %indvars.iv.i84 = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i85, %for.inc.i ], !dbg !218
  %167 = load %struct._IO_FILE** @stderr, align 8, !dbg !221, !tbaa !208
  %arrayidx5.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv7.i, i64 %indvars.iv.i84, !dbg !222
  %168 = load double* %arrayidx5.i, align 8, !dbg !222, !tbaa !113
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %168) #5, !dbg !223
  %169 = load %struct._IO_FILE** @stderr, align 8, !dbg !224, !tbaa !208
  %arrayidx9.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %indvars.iv.i84, !dbg !225
  %170 = load double* %arrayidx9.i, align 8, !dbg !225, !tbaa !113
  %call10.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %170) #5, !dbg !226
  %171 = load %struct._IO_FILE** @stderr, align 8, !dbg !227, !tbaa !208
  %arrayidx14.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv7.i, i64 %indvars.iv.i84, !dbg !228
  %172 = load double* %arrayidx14.i, align 8, !dbg !228, !tbaa !113
  %call15.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %171, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %172) #5, !dbg !229
  %173 = add nuw nsw i64 %indvars.iv.i84, %166, !dbg !211
  %174 = trunc i64 %173 to i32, !dbg !230
  %rem.i = srem i32 %174, 20, !dbg !230
  %cmp16.i = icmp eq i32 %rem.i, 0, !dbg !230
  br i1 %cmp16.i, label %if.then.i, label %for.inc.i, !dbg !231

if.then.i:                                        ; preds = %for.body3.i
  %175 = load %struct._IO_FILE** @stderr, align 8, !dbg !232, !tbaa !208
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %175) #5, !dbg !234
  br label %for.inc.i, !dbg !234

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i
  %indvars.iv.next.i85 = add nuw nsw i64 %indvars.iv.i84, 1, !dbg !220
  %exitcond.i86 = icmp eq i64 %indvars.iv.next.i85, 1000, !dbg !220
  br i1 %exitcond.i86, label %for.inc18.i, label %for.body3.i, !dbg !220

for.inc18.i:                                      ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !235
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1000, !dbg !235
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i, !dbg !235

print_array.exit:                                 ; preds = %for.inc18.i
  %176 = load %struct._IO_FILE** @stderr, align 8, !dbg !236, !tbaa !208
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %176) #5, !dbg !237
  br label %if.end56, !dbg !218

if.end56:                                         ; preds = %if.end47, %print_array.exit, %kernel_fdtd_2d.exit
  tail call void @free(i8* %call) #4, !dbg !238
  tail call void @free(i8* %call1) #4, !dbg !239
  tail call void @free(i8* %call2) #4, !dbg !240
  tail call void @free(i8* %call3) #4, !dbg !241
  ret i32 0, !dbg !242
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
!llvm.module.flags = !{!87, !88}
!llvm.ident = !{!89}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c] [DW_LANG_C99]
!1 = !{!"fdtd-2d.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\0064000000\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000000, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8}
!8 = !{!"0x21\000\001000"}                        ; [ DW_TAG_subrange_type ] [0, 999]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from double]
!11 = !{!8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d"}
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
!24 = !{!25, !49, !60, !75}
!25 = !{!"0x2e\00main\00main\00\00101\000\001\000\000\00256\001\00102", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 101] [def] [scope 102] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777317\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 101]
!34 = !{!"0x101\00argv\0033554533\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 101]
!35 = !{!"0x100\00tmax\00104\000", !25, !26, !29} ; [ DW_TAG_auto_variable ] [tmax] [line 104]
!36 = !{!"0x100\00nx\00105\000", !25, !26, !29}   ; [ DW_TAG_auto_variable ] [nx] [line 105]
!37 = !{!"0x100\00ny\00106\000", !25, !26, !29}   ; [ DW_TAG_auto_variable ] [ny] [line 106]
!38 = !{!"0x100\00ex\00109\000", !25, !26, !4}    ; [ DW_TAG_auto_variable ] [ex] [line 109]
!39 = !{!"0x100\00ey\00110\000", !25, !26, !4}    ; [ DW_TAG_auto_variable ] [ey] [line 110]
!40 = !{!"0x100\00hz\00111\000", !25, !26, !4}    ; [ DW_TAG_auto_variable ] [hz] [line 111]
!41 = !{!"0x100\00_fict_\00112\000", !25, !26, !9} ; [ DW_TAG_auto_variable ] [_fict_] [line 112]
!42 = !{!"0x100\00__s1_len\00138\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 138]
!43 = !{!"0xb\00138\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!44 = !{!"0xb\00138\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!45 = !{!"0x100\00__s2_len\00138\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 138]
!46 = !{!"0x100\00__s2\00138\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 138]
!47 = !{!"0xb\00138\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!48 = !{!"0x100\00__result\00138\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 138]
!49 = !{!"0x2e\00print_array\00print_array\00\0047\001\001\000\000\00256\001\0052", !1, !26, !50, null, null, null, null, !52} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 52] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !29, !9, !9, !9}
!52 = !{!53, !54, !55, !56, !57, !58, !59}
!53 = !{!"0x101\00nx\0016777263\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 47]
!54 = !{!"0x101\00ny\0033554480\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 48]
!55 = !{!"0x101\00ex\0050331697\000", !49, !26, !9} ; [ DW_TAG_arg_variable ] [ex] [line 49]
!56 = !{!"0x101\00ey\0067108914\000", !49, !26, !9} ; [ DW_TAG_arg_variable ] [ey] [line 50]
!57 = !{!"0x101\00hz\0083886131\000", !49, !26, !9} ; [ DW_TAG_arg_variable ] [hz] [line 51]
!58 = !{!"0x100\00i\0053\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 53]
!59 = !{!"0x100\00j\0053\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 53]
!60 = !{!"0x2e\00kernel_fdtd_2d\00kernel_fdtd_2d\00\0069\001\001\000\000\00256\001\0076", !1, !26, !61, null, null, null, null, !64} ; [ DW_TAG_subprogram ] [line 69] [local] [def] [scope 76] [kernel_fdtd_2d]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{null, !29, !29, !29, !9, !9, !9, !63}
!63 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!64 = !{!65, !66, !67, !68, !69, !70, !71, !72, !73, !74}
!65 = !{!"0x101\00tmax\0016777285\000", !60, !26, !29} ; [ DW_TAG_arg_variable ] [tmax] [line 69]
!66 = !{!"0x101\00nx\0033554502\000", !60, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 70]
!67 = !{!"0x101\00ny\0050331719\000", !60, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 71]
!68 = !{!"0x101\00ex\0067108936\000", !60, !26, !9} ; [ DW_TAG_arg_variable ] [ex] [line 72]
!69 = !{!"0x101\00ey\0083886153\000", !60, !26, !9} ; [ DW_TAG_arg_variable ] [ey] [line 73]
!70 = !{!"0x101\00hz\00100663370\000", !60, !26, !9} ; [ DW_TAG_arg_variable ] [hz] [line 74]
!71 = !{!"0x101\00_fict_\00117440587\000", !60, !26, !63} ; [ DW_TAG_arg_variable ] [_fict_] [line 75]
!72 = !{!"0x100\00t\0077\000", !60, !26, !29}     ; [ DW_TAG_auto_variable ] [t] [line 77]
!73 = !{!"0x100\00i\0077\000", !60, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 77]
!74 = !{!"0x100\00j\0077\000", !60, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 77]
!75 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0029", !1, !26, !76, null, null, null, null, !78} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 29] [init_array]
!76 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !77, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = !{null, !29, !29, !9, !9, !9, !63}
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86}
!79 = !{!"0x101\00nx\0016777239\000", !75, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!80 = !{!"0x101\00ny\0033554456\000", !75, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 24]
!81 = !{!"0x101\00ex\0050331673\000", !75, !26, !9} ; [ DW_TAG_arg_variable ] [ex] [line 25]
!82 = !{!"0x101\00ey\0067108890\000", !75, !26, !9} ; [ DW_TAG_arg_variable ] [ey] [line 26]
!83 = !{!"0x101\00hz\0083886107\000", !75, !26, !9} ; [ DW_TAG_arg_variable ] [hz] [line 27]
!84 = !{!"0x101\00_fict_\00100663324\000", !75, !26, !63} ; [ DW_TAG_arg_variable ] [_fict_] [line 28]
!85 = !{!"0x100\00i\0030\000", !75, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 30]
!86 = !{!"0x100\00j\0030\000", !75, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 30]
!87 = !{i32 2, !"Dwarf Version", i32 4}
!88 = !{i32 2, !"Debug Info Version", i32 2}
!89 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!90 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!91 = !MDLocation(line: 101, column: 14, scope: !25)
!92 = !MDLocation(line: 101, column: 27, scope: !25)
!93 = !MDLocation(line: 104, column: 7, scope: !25)
!94 = !MDLocation(line: 105, column: 7, scope: !25)
!95 = !MDLocation(line: 106, column: 7, scope: !25)
!96 = !MDLocation(line: 109, column: 3, scope: !25)
!97 = !MDLocation(line: 110, column: 3, scope: !25)
!98 = !MDLocation(line: 111, column: 3, scope: !25)
!99 = !MDLocation(line: 112, column: 3, scope: !25)
!100 = !MDLocation(line: 117, column: 8, scope: !25)
!101 = !MDLocation(line: 119, column: 8, scope: !25)
!102 = !{!"0x101\00nx\0016777239\000", !75, !26, !29, !103} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!103 = !MDLocation(line: 115, column: 3, scope: !25)
!104 = !MDLocation(line: 23, column: 22, scope: !75, inlinedAt: !103)
!105 = !{!"0x101\00ny\0033554456\000", !75, !26, !29, !103} ; [ DW_TAG_arg_variable ] [ny] [line 24]
!106 = !MDLocation(line: 24, column: 8, scope: !75, inlinedAt: !103)
!107 = !{!"0x100\00i\0030\000", !75, !26, !29, !103} ; [ DW_TAG_auto_variable ] [i] [line 30]
!108 = !MDLocation(line: 30, column: 7, scope: !75, inlinedAt: !103)
!109 = !MDLocation(line: 33, column: 17, scope: !110, inlinedAt: !103)
!110 = !{!"0xb\0032\003\0032", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!111 = !{!"0xb\0032\003\0031", !1, !75}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!112 = !MDLocation(line: 33, column: 5, scope: !110, inlinedAt: !103)
!113 = !{!114, !114, i64 0}
!114 = !{!"double", !115, i64 0}
!115 = !{!"omnipotent char", !116, i64 0}
!116 = !{!"Simple C/C++ TBAA"}
!117 = distinct !{!117, !118, !119}
!118 = !{!"llvm.loop.vectorize.width", i32 1}
!119 = !{!"llvm.loop.interleave.count", i32 1}
!120 = !MDLocation(line: 116, column: 8, scope: !25)
!121 = !MDLocation(line: 118, column: 8, scope: !25)
!122 = !MDLocation(line: 37, column: 14, scope: !123, inlinedAt: !103)
!123 = !{!"0xb\0036\007\0037", !1, !124}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!124 = !{!"0xb\0035\005\0036", !1, !125}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!125 = !{!"0xb\0035\005\0035", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!126 = !{!"0xb\0034\003\0034", !1, !127}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!127 = !{!"0xb\0034\003\0033", !1, !75}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!128 = !MDLocation(line: 35, column: 5, scope: !125, inlinedAt: !103)
!129 = !MDLocation(line: 37, column: 28, scope: !123, inlinedAt: !103)
!130 = !MDLocation(line: 37, column: 13, scope: !123, inlinedAt: !103)
!131 = !MDLocation(line: 37, column: 2, scope: !123, inlinedAt: !103)
!132 = !MDLocation(line: 38, column: 29, scope: !123, inlinedAt: !103)
!133 = !MDLocation(line: 38, column: 28, scope: !123, inlinedAt: !103)
!134 = !MDLocation(line: 38, column: 14, scope: !123, inlinedAt: !103)
!135 = !MDLocation(line: 38, column: 13, scope: !123, inlinedAt: !103)
!136 = !MDLocation(line: 38, column: 2, scope: !123, inlinedAt: !103)
!137 = !MDLocation(line: 39, column: 29, scope: !123, inlinedAt: !103)
!138 = !MDLocation(line: 39, column: 28, scope: !123, inlinedAt: !103)
!139 = !MDLocation(line: 39, column: 14, scope: !123, inlinedAt: !103)
!140 = !MDLocation(line: 39, column: 13, scope: !123, inlinedAt: !103)
!141 = !MDLocation(line: 39, column: 2, scope: !123, inlinedAt: !103)
!142 = !MDLocation(line: 34, column: 3, scope: !127, inlinedAt: !103)
!143 = !MDLocation(line: 84, column: 13, scope: !144, inlinedAt: !149)
!144 = !{!"0xb\0083\007\0018", !1, !145}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!145 = !{!"0xb\0083\007\0017", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!146 = !{!"0xb\0082\005\0016", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!147 = !{!"0xb\0081\003\0015", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!148 = !{!"0xb\0081\003\0014", !1, !60}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!149 = !MDLocation(line: 125, column: 3, scope: !25)
!150 = !MDLocation(line: 84, column: 2, scope: !144, inlinedAt: !149)
!151 = distinct !{!151, !118, !119}
!152 = !MDLocation(line: 83, column: 7, scope: !145, inlinedAt: !149)
!153 = distinct !{!153, !154}
!154 = !{!"llvm.loop.unroll.disable"}
!155 = distinct !{!155, !118, !119}
!156 = !MDLocation(line: 87, column: 43, scope: !157, inlinedAt: !149)
!157 = !{!"0xb\0086\002\0022", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!158 = !{!"0xb\0086\002\0021", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!159 = !{!"0xb\0085\007\0020", !1, !160}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!160 = !{!"0xb\0085\007\0019", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!161 = !MDLocation(line: 87, column: 15, scope: !157, inlinedAt: !149)
!162 = !MDLocation(line: 87, column: 31, scope: !157, inlinedAt: !149)
!163 = !MDLocation(line: 87, column: 40, scope: !157, inlinedAt: !149)
!164 = !MDLocation(line: 87, column: 26, scope: !157, inlinedAt: !149)
!165 = !MDLocation(line: 87, column: 4, scope: !157, inlinedAt: !149)
!166 = distinct !{!166, !118, !119}
!167 = !MDLocation(line: 86, column: 2, scope: !158, inlinedAt: !149)
!168 = distinct !{!168, !154}
!169 = distinct !{!169, !118, !119}
!170 = !MDLocation(line: 85, column: 7, scope: !160, inlinedAt: !149)
!171 = !MDLocation(line: 90, column: 15, scope: !172, inlinedAt: !149)
!172 = !{!"0xb\0089\002\0026", !1, !173}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!173 = !{!"0xb\0089\002\0025", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!174 = !{!"0xb\0088\007\0024", !1, !175}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!175 = !{!"0xb\0088\007\0023", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!176 = !MDLocation(line: 90, column: 31, scope: !172, inlinedAt: !149)
!177 = !MDLocation(line: 90, column: 40, scope: !172, inlinedAt: !149)
!178 = !MDLocation(line: 90, column: 26, scope: !172, inlinedAt: !149)
!179 = !MDLocation(line: 90, column: 4, scope: !172, inlinedAt: !149)
!180 = distinct !{!180, !118, !119}
!181 = !MDLocation(line: 90, column: 46, scope: !172, inlinedAt: !149)
!182 = !MDLocation(line: 89, column: 2, scope: !173, inlinedAt: !149)
!183 = distinct !{!183, !154}
!184 = distinct !{!184, !118, !119}
!185 = !MDLocation(line: 88, column: 7, scope: !175, inlinedAt: !149)
!186 = !MDLocation(line: 91, column: 7, scope: !187, inlinedAt: !149)
!187 = !{!"0xb\0091\007\0027", !1, !146}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!188 = !MDLocation(line: 93, column: 15, scope: !189, inlinedAt: !149)
!189 = !{!"0xb\0092\002\0030", !1, !190}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!190 = !{!"0xb\0092\002\0029", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!191 = !{!"0xb\0091\007\0028", !1, !187}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!192 = !MDLocation(line: 93, column: 33, scope: !189, inlinedAt: !149)
!193 = !MDLocation(line: 93, column: 46, scope: !189, inlinedAt: !149)
!194 = !MDLocation(line: 94, column: 12, scope: !189, inlinedAt: !149)
!195 = !MDLocation(line: 94, column: 25, scope: !189, inlinedAt: !149)
!196 = !MDLocation(line: 93, column: 26, scope: !189, inlinedAt: !149)
!197 = !MDLocation(line: 93, column: 4, scope: !189, inlinedAt: !149)
!198 = distinct !{!198, !118, !119}
!199 = !MDLocation(line: 92, column: 2, scope: !190, inlinedAt: !149)
!200 = distinct !{!200, !118, !119}
!201 = !MDLocation(line: 81, column: 3, scope: !148, inlinedAt: !149)
!202 = !MDLocation(line: 138, column: 3, scope: !44)
!203 = !MDLocation(line: 138, column: 3, scope: !25)
!204 = !MDLocation(line: 138, column: 3, scope: !43)
!205 = !MDLocation(line: 138, column: 3, scope: !47)
!206 = !MDLocation(line: 138, column: 3, scope: !207)
!207 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!208 = !{!209, !209, i64 0}
!209 = !{!"any pointer", !115, i64 0}
!210 = !{!115, !115, i64 0}
!211 = !MDLocation(line: 60, column: 12, scope: !212, inlinedAt: !218)
!212 = !{!"0xb\0060\0011\0013", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!213 = !{!"0xb\0056\0030\0012", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!214 = !{!"0xb\0056\005\0011", !1, !215}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!215 = !{!"0xb\0056\005\0010", !1, !216}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!216 = !{!"0xb\0055\003\009", !1, !217}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!217 = !{!"0xb\0055\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!218 = !MDLocation(line: 138, column: 3, scope: !219)
!219 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!220 = !MDLocation(line: 56, column: 5, scope: !215, inlinedAt: !218)
!221 = !MDLocation(line: 57, column: 15, scope: !213, inlinedAt: !218)
!222 = !MDLocation(line: 57, column: 45, scope: !213, inlinedAt: !218)
!223 = !MDLocation(line: 57, column: 7, scope: !213, inlinedAt: !218)
!224 = !MDLocation(line: 58, column: 15, scope: !213, inlinedAt: !218)
!225 = !MDLocation(line: 58, column: 45, scope: !213, inlinedAt: !218)
!226 = !MDLocation(line: 58, column: 7, scope: !213, inlinedAt: !218)
!227 = !MDLocation(line: 59, column: 15, scope: !213, inlinedAt: !218)
!228 = !MDLocation(line: 59, column: 45, scope: !213, inlinedAt: !218)
!229 = !MDLocation(line: 59, column: 7, scope: !213, inlinedAt: !218)
!230 = !MDLocation(line: 60, column: 11, scope: !212, inlinedAt: !218)
!231 = !MDLocation(line: 60, column: 11, scope: !213, inlinedAt: !218)
!232 = !MDLocation(line: 60, column: 43, scope: !233, inlinedAt: !218)
!233 = !{!"0xb\001", !1, !212}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/stencils/fdtd-2d/fdtd-2d.c]
!234 = !MDLocation(line: 60, column: 35, scope: !212, inlinedAt: !218)
!235 = !MDLocation(line: 55, column: 3, scope: !217, inlinedAt: !218)
!236 = !MDLocation(line: 62, column: 11, scope: !49, inlinedAt: !218)
!237 = !MDLocation(line: 62, column: 3, scope: !49, inlinedAt: !218)
!238 = !MDLocation(line: 143, column: 3, scope: !25)
!239 = !MDLocation(line: 144, column: 3, scope: !25)
!240 = !MDLocation(line: 145, column: 3, scope: !25)
!241 = !MDLocation(line: 146, column: 3, scope: !25)
!242 = !MDLocation(line: 148, column: 3, scope: !25)
