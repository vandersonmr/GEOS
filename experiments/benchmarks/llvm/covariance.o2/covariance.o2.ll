; ModuleID = 'covariance.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !84), !dbg !85
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !84), !dbg !86
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !35, metadata !84), !dbg !87
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !36, metadata !84), !dbg !88
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !89
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !90
  %call2 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !91
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !92
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !93, metadata !84), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !84), !dbg !97
  tail call void @llvm.dbg.value(metadata double 1.200000e+00, i64 0, metadata !37, metadata !84), !dbg !98
  tail call void @llvm.dbg.value(metadata double 1.200000e+00, i64 0, metadata !37, metadata !84), !dbg !98
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !84), !dbg !100
  br label %for.cond1.preheader.i, !dbg !101

for.cond1.preheader.i:                            ; preds = %for.inc7.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc7.i ], !dbg !94
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !103
  %conv.i = sitofp i32 %0 to double, !dbg !103
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ], !dbg !94
  %induction81105 = or i64 %index, 1, !dbg !94
  %1 = trunc i64 %index to i32, !dbg !107
  %induction83106 = or i32 %1, 1, !dbg !107
  %2 = sitofp i32 %1 to double, !dbg !107
  %3 = sitofp i32 %induction83106 to double, !dbg !107
  %4 = fmul double %conv.i, %2, !dbg !103
  %5 = fmul double %conv.i, %3, !dbg !103
  %6 = fdiv double %4, 1.000000e+03, !dbg !108
  %7 = fdiv double %5, 1.000000e+03, !dbg !108
  %8 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !109
  %9 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction81105, !dbg !109
  store double %6, double* %8, align 8, !dbg !109, !tbaa !110
  store double %7, double* %9, align 8, !dbg !109, !tbaa !110
  %index.next = add nuw nsw i64 %index, 2, !dbg !94
  %induction81105.1 = or i64 %index.next, 1, !dbg !94
  %10 = trunc i64 %index.next to i32, !dbg !107
  %induction83106.1 = or i32 %10, 1, !dbg !107
  %11 = sitofp i32 %10 to double, !dbg !107
  %12 = sitofp i32 %induction83106.1 to double, !dbg !107
  %13 = fmul double %conv.i, %11, !dbg !103
  %14 = fmul double %conv.i, %12, !dbg !103
  %15 = fdiv double %13, 1.000000e+03, !dbg !108
  %16 = fdiv double %14, 1.000000e+03, !dbg !108
  %17 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index.next, !dbg !109
  %18 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction81105.1, !dbg !109
  store double %15, double* %17, align 8, !dbg !109, !tbaa !110
  store double %16, double* %18, align 8, !dbg !109, !tbaa !110
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !94
  %19 = icmp eq i64 %index.next.1, 1000, !dbg !94
  br i1 %19, label %for.inc7.i, label %vector.body, !dbg !94, !llvm.loop !114

for.inc7.i:                                       ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !101
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1000, !dbg !101
  br i1 %exitcond5.i, label %init_array.exit, label %for.cond1.preheader.i, !dbg !101

init_array.exit:                                  ; preds = %for.inc7.i
  %arraydecay5 = bitcast i8* %call2 to double*, !dbg !117
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !118, metadata !84), !dbg !120
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !121, metadata !84), !dbg !122
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !123, metadata !84), !dbg !124
  br label %for.body.i, !dbg !125

for.body.i:                                       ; preds = %for.end.i, %init_array.exit
  %indvars.iv27.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next28.i, %for.end.i ], !dbg !119
  %arrayidx.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv27.i, !dbg !127
  store double 0.000000e+00, double* %arrayidx.i, align 8, !dbg !127, !tbaa !110
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !130, metadata !84), !dbg !131
  br label %for.body3.i75, !dbg !132

for.body3.i75:                                    ; preds = %for.body3.i75, %for.body.i
  %20 = phi double [ 0.000000e+00, %for.body.i ], [ %add.i.4, %for.body3.i75 ], !dbg !134
  %indvars.iv24.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next25.i.4, %for.body3.i75 ], !dbg !119
  %arrayidx7.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv24.i, i64 %indvars.iv27.i, !dbg !134
  %21 = load double* %arrayidx7.i, align 8, !dbg !134, !tbaa !110
  %add.i = fadd double %20, %21, !dbg !136
  store double %add.i, double* %arrayidx.i, align 8, !dbg !136, !tbaa !110
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1, !dbg !132
  %arrayidx7.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next25.i, i64 %indvars.iv27.i, !dbg !134
  %22 = load double* %arrayidx7.i.1, align 8, !dbg !134, !tbaa !110
  %add.i.1 = fadd double %add.i, %22, !dbg !136
  store double %add.i.1, double* %arrayidx.i, align 8, !dbg !136, !tbaa !110
  %indvars.iv.next25.i.1 = add nuw nsw i64 %indvars.iv.next25.i, 1, !dbg !132
  %arrayidx7.i.2 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next25.i.1, i64 %indvars.iv27.i, !dbg !134
  %23 = load double* %arrayidx7.i.2, align 8, !dbg !134, !tbaa !110
  %add.i.2 = fadd double %add.i.1, %23, !dbg !136
  store double %add.i.2, double* %arrayidx.i, align 8, !dbg !136, !tbaa !110
  %indvars.iv.next25.i.2 = add nuw nsw i64 %indvars.iv.next25.i.1, 1, !dbg !132
  %arrayidx7.i.3 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next25.i.2, i64 %indvars.iv27.i, !dbg !134
  %24 = load double* %arrayidx7.i.3, align 8, !dbg !134, !tbaa !110
  %add.i.3 = fadd double %add.i.2, %24, !dbg !136
  store double %add.i.3, double* %arrayidx.i, align 8, !dbg !136, !tbaa !110
  %indvars.iv.next25.i.3 = add nuw nsw i64 %indvars.iv.next25.i.2, 1, !dbg !132
  %arrayidx7.i.4 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next25.i.3, i64 %indvars.iv27.i, !dbg !134
  %25 = load double* %arrayidx7.i.4, align 8, !dbg !134, !tbaa !110
  %add.i.4 = fadd double %add.i.3, %25, !dbg !136
  store double %add.i.4, double* %arrayidx.i, align 8, !dbg !136, !tbaa !110
  %indvars.iv.next25.i.4 = add nuw nsw i64 %indvars.iv.next25.i.3, 1, !dbg !132
  %exitcond26.i.4 = icmp eq i64 %indvars.iv.next25.i.4, 1000, !dbg !132
  br i1 %exitcond26.i.4, label %for.end.i, label %for.body3.i75, !dbg !132

for.end.i:                                        ; preds = %for.body3.i75
  %add.i.lcssa = phi double [ %add.i.4, %for.body3.i75 ]
  %div.i76 = fdiv double %add.i.lcssa, 1.200000e+00, !dbg !137
  store double %div.i76, double* %arrayidx.i, align 8, !dbg !137, !tbaa !110
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !125
  %exitcond29.i = icmp eq i64 %indvars.iv.next28.i, 1000, !dbg !125
  br i1 %exitcond29.i, label %for.cond18.preheader.i.preheader, label %for.body.i, !dbg !125

for.cond18.preheader.i.preheader:                 ; preds = %for.end.i
  %arraydecay4 = bitcast i8* %call1 to [1000 x double]*, !dbg !138
  %scevgep93 = getelementptr i8* %call2, i64 7992
  br label %for.cond18.preheader.i, !dbg !139

for.cond18.preheader.i:                           ; preds = %for.cond18.preheader.i.preheader, %for.inc30.i
  %indvars.iv21.i = phi i64 [ %indvars.iv.next22.i, %for.inc30.i ], [ 0, %for.cond18.preheader.i.preheader ], !dbg !119
  %26 = mul i64 %indvars.iv21.i, 8000
  %scevgep = getelementptr i8* %call, i64 %26
  %bound0 = icmp ule i8* %scevgep, %scevgep93
  %27 = add i64 %26, 7992
  %scevgep92 = getelementptr i8* %call, i64 %27
  %bound1 = icmp ule i8* %call2, %scevgep92
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block88, label %vector.body87.preheader

vector.body87.preheader:                          ; preds = %for.cond18.preheader.i
  br label %vector.body87, !dbg !143

vector.body87:                                    ; preds = %vector.body87.preheader, %vector.body87
  %index90 = phi i64 [ %index.next99, %vector.body87 ], [ 0, %vector.body87.preheader ], !dbg !119
  %28 = getelementptr inbounds double* %arraydecay5, i64 %index90, !dbg !143
  %29 = bitcast double* %28 to <2 x double>*, !dbg !143
  %wide.load = load <2 x double>* %29, align 8, !dbg !143, !tbaa !110
  %.sum107 = or i64 %index90, 2, !dbg !143
  %30 = getelementptr double* %arraydecay5, i64 %.sum107, !dbg !143
  %31 = bitcast double* %30 to <2 x double>*, !dbg !143
  %wide.load102 = load <2 x double>* %31, align 8, !dbg !143, !tbaa !110
  %32 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv21.i, i64 %index90, !dbg !145
  %33 = bitcast double* %32 to <2 x double>*, !dbg !145
  %wide.load103 = load <2 x double>* %33, align 8, !dbg !145, !tbaa !110
  %.sum108 = or i64 %index90, 2, !dbg !145
  %34 = getelementptr [1000 x double]* %arraydecay, i64 %indvars.iv21.i, i64 %.sum108, !dbg !145
  %35 = bitcast double* %34 to <2 x double>*, !dbg !145
  %wide.load104 = load <2 x double>* %35, align 8, !dbg !145, !tbaa !110
  %36 = fsub <2 x double> %wide.load103, %wide.load, !dbg !145
  %37 = fsub <2 x double> %wide.load104, %wide.load102, !dbg !145
  %38 = bitcast double* %32 to <2 x double>*, !dbg !145
  store <2 x double> %36, <2 x double>* %38, align 8, !dbg !145, !tbaa !110
  %39 = bitcast double* %34 to <2 x double>*, !dbg !145
  store <2 x double> %37, <2 x double>* %39, align 8, !dbg !145, !tbaa !110
  %index.next99 = add i64 %index90, 4, !dbg !119
  %40 = icmp eq i64 %index.next99, 1000, !dbg !119
  br i1 %40, label %middle.block88.loopexit, label %vector.body87, !dbg !119, !llvm.loop !146

middle.block88.loopexit:                          ; preds = %vector.body87
  br label %middle.block88

middle.block88:                                   ; preds = %middle.block88.loopexit, %for.cond18.preheader.i
  %resume.val94 = phi i1 [ false, %for.cond18.preheader.i ], [ true, %middle.block88.loopexit ]
  %trunc.resume.val95 = phi i64 [ 0, %for.cond18.preheader.i ], [ 1000, %middle.block88.loopexit ]
  br i1 %resume.val94, label %for.inc30.i, label %for.body20.i.preheader

for.body20.i.preheader:                           ; preds = %middle.block88
  %41 = sub i64 1000, %trunc.resume.val95
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %41, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body20.i.prol.preheader, label %for.body20.i.preheader.split

for.body20.i.prol.preheader:                      ; preds = %for.body20.i.preheader
  br label %for.body20.i.prol, !dbg !143

for.body20.i.prol:                                ; preds = %for.body20.i.prol.preheader, %for.body20.i.prol
  %indvars.iv18.i.prol = phi i64 [ %indvars.iv.next19.i.prol, %for.body20.i.prol ], [ %trunc.resume.val95, %for.body20.i.prol.preheader ], !dbg !119
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body20.i.prol ], [ %xtraiter, %for.body20.i.prol.preheader ]
  %arrayidx22.i.prol = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv18.i.prol, !dbg !143
  %42 = load double* %arrayidx22.i.prol, align 8, !dbg !143, !tbaa !110
  %arrayidx26.i.prol = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv21.i, i64 %indvars.iv18.i.prol, !dbg !145
  %43 = load double* %arrayidx26.i.prol, align 8, !dbg !145, !tbaa !110
  %sub.i.prol = fsub double %43, %42, !dbg !145
  store double %sub.i.prol, double* %arrayidx26.i.prol, align 8, !dbg !145, !tbaa !110
  %indvars.iv.next19.i.prol = add nuw nsw i64 %indvars.iv18.i.prol, 1, !dbg !139
  %exitcond20.i.prol = icmp eq i64 %indvars.iv.next19.i.prol, 1000, !dbg !139
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !139
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !139
  br i1 %prol.iter.cmp, label %for.body20.i.prol, label %for.body20.i.preheader.split.loopexit, !llvm.loop !147

for.body20.i.preheader.split.loopexit:            ; preds = %for.body20.i.prol
  %indvars.iv18.i.unr.ph = phi i64 [ %indvars.iv.next19.i.prol, %for.body20.i.prol ]
  br label %for.body20.i.preheader.split

for.body20.i.preheader.split:                     ; preds = %for.body20.i.preheader.split.loopexit, %for.body20.i.preheader
  %indvars.iv18.i.unr = phi i64 [ %trunc.resume.val95, %for.body20.i.preheader ], [ %indvars.iv18.i.unr.ph, %for.body20.i.preheader.split.loopexit ]
  %44 = icmp ult i64 %41, 2
  br i1 %44, label %for.inc30.i.loopexit, label %for.body20.i.preheader.split.split

for.body20.i.preheader.split.split:               ; preds = %for.body20.i.preheader.split
  br label %for.body20.i, !dbg !143

for.body20.i:                                     ; preds = %for.body20.i, %for.body20.i.preheader.split.split
  %indvars.iv18.i = phi i64 [ %indvars.iv18.i.unr, %for.body20.i.preheader.split.split ], [ %indvars.iv.next19.i.1, %for.body20.i ], !dbg !119
  %arrayidx22.i = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv18.i, !dbg !143
  %45 = load double* %arrayidx22.i, align 8, !dbg !143, !tbaa !110
  %arrayidx26.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv21.i, i64 %indvars.iv18.i, !dbg !145
  %46 = load double* %arrayidx26.i, align 8, !dbg !145, !tbaa !110
  %sub.i = fsub double %46, %45, !dbg !145
  store double %sub.i, double* %arrayidx26.i, align 8, !dbg !145, !tbaa !110
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1, !dbg !139
  %arrayidx22.i.1 = getelementptr inbounds double* %arraydecay5, i64 %indvars.iv.next19.i, !dbg !143
  %47 = load double* %arrayidx22.i.1, align 8, !dbg !143, !tbaa !110
  %arrayidx26.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv21.i, i64 %indvars.iv.next19.i, !dbg !145
  %48 = load double* %arrayidx26.i.1, align 8, !dbg !145, !tbaa !110
  %sub.i.1 = fsub double %48, %47, !dbg !145
  store double %sub.i.1, double* %arrayidx26.i.1, align 8, !dbg !145, !tbaa !110
  %indvars.iv.next19.i.1 = add nuw nsw i64 %indvars.iv.next19.i, 1, !dbg !139
  %exitcond20.i.1 = icmp eq i64 %indvars.iv.next19.i.1, 1000, !dbg !139
  br i1 %exitcond20.i.1, label %for.inc30.i.loopexit.unr-lcssa, label %for.body20.i, !dbg !139, !llvm.loop !149

for.inc30.i.loopexit.unr-lcssa:                   ; preds = %for.body20.i
  br label %for.inc30.i.loopexit

for.inc30.i.loopexit:                             ; preds = %for.body20.i.preheader.split, %for.inc30.i.loopexit.unr-lcssa
  br label %for.inc30.i

for.inc30.i:                                      ; preds = %for.inc30.i.loopexit, %middle.block88
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1, !dbg !150
  %exitcond23.i = icmp eq i64 %indvars.iv.next22.i, 1000, !dbg !150
  br i1 %exitcond23.i, label %for.body38.lr.ph.i.preheader, label %for.cond18.preheader.i, !dbg !150

for.body38.lr.ph.i.preheader:                     ; preds = %for.inc30.i
  br label %for.body38.lr.ph.i, !dbg !151

for.body38.lr.ph.i:                               ; preds = %for.body38.lr.ph.i.preheader, %for.inc73.i
  %indvars.iv15.i = phi i64 [ %indvars.iv.next16.i, %for.inc73.i ], [ 0, %for.body38.lr.ph.i.preheader ], !dbg !119
  br label %for.body38.i, !dbg !151

for.body38.i:                                     ; preds = %for.end61.i, %for.body38.lr.ph.i
  %indvars.iv11.i = phi i64 [ %indvars.iv15.i, %for.body38.lr.ph.i ], [ %indvars.iv.next12.i, %for.end61.i ], !dbg !119
  %arrayidx42.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv15.i, i64 %indvars.iv11.i, !dbg !155
  store double 0.000000e+00, double* %arrayidx42.i, align 8, !dbg !155, !tbaa !110
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !130, metadata !84), !dbg !131
  br label %for.body45.i, !dbg !158

for.body45.i:                                     ; preds = %for.body45.i, %for.body38.i
  %49 = phi double [ 0.000000e+00, %for.body38.i ], [ %add58.i.1, %for.body45.i ], !dbg !160
  %indvars.iv.i77 = phi i64 [ 0, %for.body38.i ], [ %indvars.iv.next.i79.1, %for.body45.i ], !dbg !119
  %arrayidx49.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.i77, i64 %indvars.iv15.i, !dbg !160
  %50 = load double* %arrayidx49.i, align 8, !dbg !160, !tbaa !110
  %arrayidx53.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.i77, i64 %indvars.iv11.i, !dbg !162
  %51 = load double* %arrayidx53.i, align 8, !dbg !162, !tbaa !110
  %mul.i78 = fmul double %50, %51, !dbg !160
  %add58.i = fadd double %49, %mul.i78, !dbg !163
  store double %add58.i, double* %arrayidx42.i, align 8, !dbg !163, !tbaa !110
  %indvars.iv.next.i79 = add nuw nsw i64 %indvars.iv.i77, 1, !dbg !158
  %arrayidx49.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next.i79, i64 %indvars.iv15.i, !dbg !160
  %52 = load double* %arrayidx49.i.1, align 8, !dbg !160, !tbaa !110
  %arrayidx53.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next.i79, i64 %indvars.iv11.i, !dbg !162
  %53 = load double* %arrayidx53.i.1, align 8, !dbg !162, !tbaa !110
  %mul.i78.1 = fmul double %52, %53, !dbg !160
  %add58.i.1 = fadd double %add58.i, %mul.i78.1, !dbg !163
  store double %add58.i.1, double* %arrayidx42.i, align 8, !dbg !163, !tbaa !110
  %indvars.iv.next.i79.1 = add nuw nsw i64 %indvars.iv.next.i79, 1, !dbg !158
  %exitcond.i80.1 = icmp eq i64 %indvars.iv.next.i79.1, 1000, !dbg !158
  br i1 %exitcond.i80.1, label %for.end61.i, label %for.body45.i, !dbg !158

for.end61.i:                                      ; preds = %for.body45.i
  %add58.i.lcssa = phi double [ %add58.i.1, %for.body45.i ]
  %arrayidx69.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv11.i, i64 %indvars.iv15.i, !dbg !164
  store double %add58.i.lcssa, double* %arrayidx69.i, align 8, !dbg !164, !tbaa !110
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !151
  %lftr.wideiv = trunc i64 %indvars.iv.next12.i to i32, !dbg !151
  %exitcond = icmp eq i32 %lftr.wideiv, 1000, !dbg !151
  br i1 %exitcond, label %for.inc73.i, label %for.body38.i, !dbg !151

for.inc73.i:                                      ; preds = %for.end61.i
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1, !dbg !165
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 1000, !dbg !165
  br i1 %exitcond17.i, label %kernel_covariance.exit, label %for.body38.lr.ph.i, !dbg !165

kernel_covariance.exit:                           ; preds = %for.inc73.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !166
  br i1 %cmp, label %if.end42, label %if.end49, !dbg !167

if.end42:                                         ; preds = %kernel_covariance.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !84), !dbg !168
  tail call void @llvm.dbg.value(metadata i8* %54, i64 0, metadata !45, metadata !84), !dbg !169
  %54 = load i8** %argv, align 8, !dbg !170, !tbaa !172
  %55 = load i8* %54, align 1, !dbg !170, !tbaa !174
  %phitmp = icmp eq i8 %55, 0, !dbg !168
  br i1 %phitmp, label %for.cond1.preheader.i70.preheader, label %if.end49, !dbg !167

for.cond1.preheader.i70.preheader:                ; preds = %if.end42
  br label %for.cond1.preheader.i70, !dbg !175

for.cond1.preheader.i70:                          ; preds = %for.cond1.preheader.i70.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i70.preheader ], !dbg !182
  %56 = mul nsw i64 %indvars.iv7.i, 1000, !dbg !175
  br label %for.body3.i72, !dbg !184

for.body3.i72:                                    ; preds = %for.inc.i, %for.cond1.preheader.i70
  %indvars.iv.i71 = phi i64 [ 0, %for.cond1.preheader.i70 ], [ %indvars.iv.next.i73, %for.inc.i ], !dbg !182
  %57 = load %struct._IO_FILE** @stderr, align 8, !dbg !185, !tbaa !172
  %arrayidx5.i = getelementptr inbounds [1000 x double]* %arraydecay4, i64 %indvars.iv7.i, i64 %indvars.iv.i71, !dbg !186
  %58 = load double* %arrayidx5.i, align 8, !dbg !186, !tbaa !110
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %58) #5, !dbg !187
  %59 = add nuw nsw i64 %indvars.iv.i71, %56, !dbg !175
  %60 = trunc i64 %59 to i32, !dbg !188
  %rem.i = srem i32 %60, 20, !dbg !188
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !188
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !189

if.then.i:                                        ; preds = %for.body3.i72
  %61 = load %struct._IO_FILE** @stderr, align 8, !dbg !190, !tbaa !172
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %61) #5, !dbg !192
  br label %for.inc.i, !dbg !192

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i72
  %indvars.iv.next.i73 = add nuw nsw i64 %indvars.iv.i71, 1, !dbg !184
  %exitcond.i74 = icmp eq i64 %indvars.iv.next.i73, 1000, !dbg !184
  br i1 %exitcond.i74, label %for.inc8.i, label %for.body3.i72, !dbg !184

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !193
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1000, !dbg !193
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i70, !dbg !193

print_array.exit:                                 ; preds = %for.inc8.i
  %62 = load %struct._IO_FILE** @stderr, align 8, !dbg !194, !tbaa !172
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %62) #5, !dbg !195
  br label %if.end49, !dbg !182

if.end49:                                         ; preds = %if.end42, %print_array.exit, %kernel_covariance.exit
  tail call void @free(i8* %call) #4, !dbg !196
  tail call void @free(i8* %call1) #4, !dbg !197
  tail call void @free(i8* %call2) #4, !dbg !198
  ret i32 0, !dbg !199
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
!llvm.module.flags = !{!81, !82}
!llvm.ident = !{!83}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c] [DW_LANG_C99]
!1 = !{!"covariance.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance"}
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
!24 = !{!25, !48, !56, !71}
!25 = !{!"0x2e\00main\00main\00\0095\000\001\000\000\00256\001\0096", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 95] [def] [scope 96] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777311\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 95]
!34 = !{!"0x101\00argv\0033554527\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 95]
!35 = !{!"0x100\00n\0098\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [n] [line 98]
!36 = !{!"0x100\00m\0099\000", !25, !26, !29}     ; [ DW_TAG_auto_variable ] [m] [line 99]
!37 = !{!"0x100\00float_n\00102\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 102]
!38 = !{!"0x100\00data\00103\000", !25, !26, !4}  ; [ DW_TAG_auto_variable ] [data] [line 103]
!39 = !{!"0x100\00symmat\00104\000", !25, !26, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 104]
!40 = !{!"0x100\00mean\00105\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 105]
!41 = !{!"0x100\00__s1_len\00126\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 126]
!42 = !{!"0xb\00126\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!43 = !{!"0xb\00126\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!44 = !{!"0x100\00__s2_len\00126\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 126]
!45 = !{!"0x100\00__s2\00126\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 126]
!46 = !{!"0xb\00126\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!47 = !{!"0x100\00__result\00126\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 126]
!48 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\001\0043", !1, !26, !49, null, null, null, null, !51} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !9}
!51 = !{!52, !53, !54, !55}
!52 = !{!"0x101\00m\0016777256\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 40]
!53 = !{!"0x101\00symmat\0033554473\000", !48, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 41]
!54 = !{!"0x100\00i\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 44]
!55 = !{!"0x100\00j\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 44]
!56 = !{!"0x2e\00kernel_covariance\00kernel_covariance\00\0058\001\001\000\000\00256\001\0063", !1, !26, !57, null, null, null, null, !60} ; [ DW_TAG_subprogram ] [line 58] [local] [def] [scope 63] [kernel_covariance]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !29, !29, !6, !9, !9, !59}
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!60 = !{!61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!61 = !{!"0x101\00m\0016777274\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 58]
!62 = !{!"0x101\00n\0033554490\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 58]
!63 = !{!"0x101\00float_n\0050331707\000", !56, !26, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 59]
!64 = !{!"0x101\00data\0067108924\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 60]
!65 = !{!"0x101\00symmat\0083886141\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 61]
!66 = !{!"0x101\00mean\00100663358\000", !56, !26, !59} ; [ DW_TAG_arg_variable ] [mean] [line 62]
!67 = !{!"0x100\00i\0064\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 64]
!68 = !{!"0x100\00j\0064\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 64]
!69 = !{!"0x100\00j1\0064\000", !56, !26, !29}    ; [ DW_TAG_auto_variable ] [j1] [line 64]
!70 = !{!"0x100\00j2\0064\000", !56, !26, !29}    ; [ DW_TAG_auto_variable ] [j2] [line 64]
!71 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !72, null, null, null, null, !74} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!72 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !73, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = !{null, !29, !29, !59, !9}
!74 = !{!75, !76, !77, !78, !79, !80}
!75 = !{!"0x101\00m\0016777239\000", !71, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 23]
!76 = !{!"0x101\00n\0033554455\000", !71, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 23]
!77 = !{!"0x101\00float_n\0050331672\000", !71, !26, !59} ; [ DW_TAG_arg_variable ] [float_n] [line 24]
!78 = !{!"0x101\00data\0067108889\000", !71, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 25]
!79 = !{!"0x100\00i\0027\000", !71, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!80 = !{!"0x100\00j\0027\000", !71, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!81 = !{i32 2, !"Dwarf Version", i32 4}
!82 = !{i32 2, !"Debug Info Version", i32 2}
!83 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!84 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!85 = !MDLocation(line: 95, column: 14, scope: !25)
!86 = !MDLocation(line: 95, column: 27, scope: !25)
!87 = !MDLocation(line: 98, column: 7, scope: !25)
!88 = !MDLocation(line: 99, column: 7, scope: !25)
!89 = !MDLocation(line: 103, column: 3, scope: !25)
!90 = !MDLocation(line: 104, column: 3, scope: !25)
!91 = !MDLocation(line: 105, column: 3, scope: !25)
!92 = !MDLocation(line: 109, column: 31, scope: !25)
!93 = !{!"0x101\00m\0016777239\000", !71, !26, !29, !94} ; [ DW_TAG_arg_variable ] [m] [line 23]
!94 = !MDLocation(line: 109, column: 3, scope: !25)
!95 = !MDLocation(line: 23, column: 22, scope: !71, inlinedAt: !94)
!96 = !{!"0x101\00n\0033554455\000", !71, !26, !29, !94} ; [ DW_TAG_arg_variable ] [n] [line 23]
!97 = !MDLocation(line: 23, column: 29, scope: !71, inlinedAt: !94)
!98 = !MDLocation(line: 102, column: 13, scope: !25)
!99 = !{!"0x100\00i\0027\000", !71, !26, !29, !94} ; [ DW_TAG_auto_variable ] [i] [line 27]
!100 = !MDLocation(line: 27, column: 7, scope: !71, inlinedAt: !94)
!101 = !MDLocation(line: 31, column: 3, scope: !102, inlinedAt: !94)
!102 = !{!"0xb\0031\003\0030", !1, !71}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!103 = !MDLocation(line: 33, column: 21, scope: !104, inlinedAt: !94)
!104 = !{!"0xb\0032\005\0033", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!105 = !{!"0xb\0032\005\0032", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!106 = !{!"0xb\0031\003\0031", !1, !102}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!107 = !MDLocation(line: 33, column: 35, scope: !104, inlinedAt: !94)
!108 = !MDLocation(line: 33, column: 20, scope: !104, inlinedAt: !94)
!109 = !MDLocation(line: 33, column: 7, scope: !104, inlinedAt: !94)
!110 = !{!111, !111, i64 0}
!111 = !{!"double", !112, i64 0}
!112 = !{!"omnipotent char", !113, i64 0}
!113 = !{!"Simple C/C++ TBAA"}
!114 = distinct !{!114, !115, !116}
!115 = !{!"llvm.loop.vectorize.width", i32 1}
!116 = !{!"llvm.loop.interleave.count", i32 1}
!117 = !MDLocation(line: 118, column: 8, scope: !25)
!118 = !{!"0x101\00m\0016777274\000", !56, !26, !29, !119} ; [ DW_TAG_arg_variable ] [m] [line 58]
!119 = !MDLocation(line: 115, column: 3, scope: !25)
!120 = !MDLocation(line: 58, column: 28, scope: !56, inlinedAt: !119)
!121 = !{!"0x101\00n\0033554490\000", !56, !26, !29, !119} ; [ DW_TAG_arg_variable ] [n] [line 58]
!122 = !MDLocation(line: 58, column: 35, scope: !56, inlinedAt: !119)
!123 = !{!"0x100\00j\0064\000", !56, !26, !29, !119} ; [ DW_TAG_auto_variable ] [j] [line 64]
!124 = !MDLocation(line: 64, column: 10, scope: !56, inlinedAt: !119)
!125 = !MDLocation(line: 68, column: 3, scope: !126, inlinedAt: !119)
!126 = !{!"0xb\0068\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!127 = !MDLocation(line: 70, column: 7, scope: !128, inlinedAt: !119)
!128 = !{!"0xb\0069\005\0016", !1, !129}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!129 = !{!"0xb\0068\003\0015", !1, !126}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!130 = !{!"0x100\00i\0064\000", !56, !26, !29, !119} ; [ DW_TAG_auto_variable ] [i] [line 64]
!131 = !MDLocation(line: 64, column: 7, scope: !56, inlinedAt: !119)
!132 = !MDLocation(line: 71, column: 7, scope: !133, inlinedAt: !119)
!133 = !{!"0xb\0071\007\0017", !1, !128}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!134 = !MDLocation(line: 72, column: 20, scope: !135, inlinedAt: !119)
!135 = !{!"0xb\0071\007\0018", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!136 = !MDLocation(line: 72, column: 9, scope: !135, inlinedAt: !119)
!137 = !MDLocation(line: 73, column: 7, scope: !128, inlinedAt: !119)
!138 = !MDLocation(line: 117, column: 8, scope: !25)
!139 = !MDLocation(line: 78, column: 5, scope: !140, inlinedAt: !119)
!140 = !{!"0xb\0078\005\0021", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!141 = !{!"0xb\0077\003\0020", !1, !142}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!142 = !{!"0xb\0077\003\0019", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!143 = !MDLocation(line: 79, column: 21, scope: !144, inlinedAt: !119)
!144 = !{!"0xb\0078\005\0022", !1, !140}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!145 = !MDLocation(line: 79, column: 7, scope: !144, inlinedAt: !119)
!146 = distinct !{!146, !115, !116}
!147 = distinct !{!147, !148}
!148 = !{!"llvm.loop.unroll.disable"}
!149 = distinct !{!149, !115, !116}
!150 = !MDLocation(line: 77, column: 3, scope: !142, inlinedAt: !119)
!151 = !MDLocation(line: 83, column: 5, scope: !152, inlinedAt: !119)
!152 = !{!"0xb\0083\005\0025", !1, !153}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!153 = !{!"0xb\0082\003\0024", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!154 = !{!"0xb\0082\003\0023", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!155 = !MDLocation(line: 85, column: 9, scope: !156, inlinedAt: !119)
!156 = !{!"0xb\0084\007\0027", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!157 = !{!"0xb\0083\005\0026", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!158 = !MDLocation(line: 86, column: 9, scope: !159, inlinedAt: !119)
!159 = !{!"0xb\0086\009\0028", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!160 = !MDLocation(line: 87, column: 22, scope: !161, inlinedAt: !119)
!161 = !{!"0xb\0086\009\0029", !1, !159}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!162 = !MDLocation(line: 87, column: 36, scope: !161, inlinedAt: !119)
!163 = !MDLocation(line: 87, column: 4, scope: !161, inlinedAt: !119)
!164 = !MDLocation(line: 88, column: 9, scope: !156, inlinedAt: !119)
!165 = !MDLocation(line: 82, column: 3, scope: !154, inlinedAt: !119)
!166 = !MDLocation(line: 126, column: 3, scope: !43)
!167 = !MDLocation(line: 126, column: 3, scope: !25)
!168 = !MDLocation(line: 126, column: 3, scope: !42)
!169 = !MDLocation(line: 126, column: 3, scope: !46)
!170 = !MDLocation(line: 126, column: 3, scope: !171)
!171 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!172 = !{!173, !173, i64 0}
!173 = !{!"any pointer", !112, i64 0}
!174 = !{!112, !112, i64 0}
!175 = !MDLocation(line: 49, column: 12, scope: !176, inlinedAt: !182)
!176 = !{!"0xb\0049\0011\0013", !1, !177}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!177 = !{!"0xb\0047\0029\0012", !1, !178}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!178 = !{!"0xb\0047\005\0011", !1, !179}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!179 = !{!"0xb\0047\005\0010", !1, !180}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!180 = !{!"0xb\0046\003\009", !1, !181}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!181 = !{!"0xb\0046\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!182 = !MDLocation(line: 126, column: 3, scope: !183)
!183 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!184 = !MDLocation(line: 47, column: 5, scope: !179, inlinedAt: !182)
!185 = !MDLocation(line: 48, column: 16, scope: !177, inlinedAt: !182)
!186 = !MDLocation(line: 48, column: 46, scope: !177, inlinedAt: !182)
!187 = !MDLocation(line: 48, column: 7, scope: !177, inlinedAt: !182)
!188 = !MDLocation(line: 49, column: 11, scope: !176, inlinedAt: !182)
!189 = !MDLocation(line: 49, column: 11, scope: !177, inlinedAt: !182)
!190 = !MDLocation(line: 49, column: 43, scope: !191, inlinedAt: !182)
!191 = !{!"0xb\001", !1, !176}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/covariance/covariance.c]
!192 = !MDLocation(line: 49, column: 34, scope: !176, inlinedAt: !182)
!193 = !MDLocation(line: 46, column: 3, scope: !181, inlinedAt: !182)
!194 = !MDLocation(line: 51, column: 12, scope: !48, inlinedAt: !182)
!195 = !MDLocation(line: 51, column: 3, scope: !48, inlinedAt: !182)
!196 = !MDLocation(line: 129, column: 3, scope: !25)
!197 = !MDLocation(line: 130, column: 3, scope: !25)
!198 = !MDLocation(line: 131, column: 3, scope: !25)
!199 = !MDLocation(line: 133, column: 3, scope: !25)
