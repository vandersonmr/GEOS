; ModuleID = 'atax.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !81), !dbg !82
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !81), !dbg !83
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !35, metadata !81), !dbg !84
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !36, metadata !81), !dbg !85
  %call = tail call i8* @polybench_alloc_data(i32 16000000, i32 8) #4, !dbg !86
  %call1 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !87
  %call2 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !88
  %call3 = tail call i8* @polybench_alloc_data(i32 4000, i32 8) #4, !dbg !89
  %arraydecay4 = bitcast i8* %call1 to double*, !dbg !90
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !91, metadata !81), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !94, metadata !81), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !81), !dbg !97
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.1, %vector.body ], !dbg !92
  %induction92137 = or i64 %index, 1, !dbg !92
  %0 = trunc i64 %index to i32, !dbg !98
  %induction94138 = or i32 %0, 1, !dbg !98
  %1 = sitofp i32 %0 to double, !dbg !98
  %2 = sitofp i32 %induction94138 to double, !dbg !98
  %3 = fmul double %1, 0x400921FB54442D18, !dbg !98
  %4 = fmul double %2, 0x400921FB54442D18, !dbg !98
  %5 = getelementptr inbounds double* %arraydecay4, i64 %index, !dbg !101
  %6 = getelementptr inbounds double* %arraydecay4, i64 %induction92137, !dbg !101
  store double %3, double* %5, align 8, !dbg !101, !tbaa !102
  store double %4, double* %6, align 8, !dbg !101, !tbaa !102
  %index.next = add nuw nsw i64 %index, 2, !dbg !92
  %induction92137.1 = or i64 %index.next, 1, !dbg !92
  %7 = trunc i64 %index.next to i32, !dbg !98
  %induction94138.1 = or i32 %7, 1, !dbg !98
  %8 = sitofp i32 %7 to double, !dbg !98
  %9 = sitofp i32 %induction94138.1 to double, !dbg !98
  %10 = fmul double %8, 0x400921FB54442D18, !dbg !98
  %11 = fmul double %9, 0x400921FB54442D18, !dbg !98
  %12 = getelementptr inbounds double* %arraydecay4, i64 %index.next, !dbg !101
  %13 = getelementptr inbounds double* %arraydecay4, i64 %induction92137.1, !dbg !101
  store double %10, double* %12, align 8, !dbg !101, !tbaa !102
  store double %11, double* %13, align 8, !dbg !101, !tbaa !102
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !92
  %14 = icmp eq i64 %index.next.1, 4000, !dbg !92
  br i1 %14, label %for.cond5.preheader.i.preheader, label %vector.body, !dbg !92, !llvm.loop !106

for.cond5.preheader.i.preheader:                  ; preds = %vector.body
  %arraydecay = bitcast i8* %call to [4000 x double]*, !dbg !109
  br label %for.cond5.preheader.i, !dbg !110

for.cond5.preheader.i:                            ; preds = %for.cond5.preheader.i.preheader, %for.inc20.i
  %indvars.iv4.i = phi i64 [ %indvars.iv.next5.i, %for.inc20.i ], [ 0, %for.cond5.preheader.i.preheader ], !dbg !92
  %15 = trunc i64 %indvars.iv4.i to i32, !dbg !110
  %conv9.i = sitofp i32 %15 to double, !dbg !110
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %for.cond5.preheader.i
  %index101 = phi i64 [ 0, %for.cond5.preheader.i ], [ %index.next108, %vector.body98 ], !dbg !92
  %induction110139 = or i64 %index101, 1, !dbg !92
  %16 = or i64 %index101, 1, !dbg !115
  %17 = add nuw nsw i64 %induction110139, 1, !dbg !115
  %18 = trunc i64 %16 to i32, !dbg !116
  %19 = trunc i64 %17 to i32, !dbg !116
  %20 = sitofp i32 %18 to double, !dbg !116
  %21 = sitofp i32 %19 to double, !dbg !116
  %22 = fmul double %conv9.i, %20, !dbg !110
  %23 = fmul double %conv9.i, %21, !dbg !110
  %24 = fdiv double %22, 4.000000e+03, !dbg !117
  %25 = fdiv double %23, 4.000000e+03, !dbg !117
  %26 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %index101, !dbg !118
  %27 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv4.i, i64 %induction110139, !dbg !118
  store double %24, double* %26, align 8, !dbg !118, !tbaa !102
  store double %25, double* %27, align 8, !dbg !118, !tbaa !102
  %index.next108 = add i64 %index101, 2, !dbg !92
  %28 = icmp eq i64 %index.next108, 4000, !dbg !92
  br i1 %28, label %for.inc20.i, label %vector.body98, !dbg !92, !llvm.loop !119

for.inc20.i:                                      ; preds = %vector.body98
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !120
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 4000, !dbg !120
  br i1 %exitcond6.i, label %init_array.exit, label %for.cond5.preheader.i, !dbg !120

init_array.exit:                                  ; preds = %for.inc20.i
  %arraydecay7 = bitcast i8* %call2 to double*, !dbg !121
  %arraydecay8 = bitcast i8* %call3 to double*, !dbg !122
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !123, metadata !81) #4, !dbg !125
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !126, metadata !81) #4, !dbg !127
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !128, metadata !81) #4, !dbg !129
  tail call void @llvm.memset.p0i8.i64(i8* %call2, i8 0, i64 32000, i32 8, i1 false) #4, !dbg !130
  %scevgep = getelementptr i8* %call2, i64 8
  %scevgep119 = getelementptr i8* %call2, i64 31992
  br label %for.body5.i, !dbg !133

for.body5.i:                                      ; preds = %for.inc42.i, %init_array.exit
  %indvars.iv8.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next9.i, %for.inc42.i ], !dbg !124
  %29 = mul i64 %indvars.iv8.i, 32000, !dbg !135
  %30 = or i64 %29, 8, !dbg !135
  %scevgep120 = getelementptr i8* %call, i64 %30
  %31 = add i64 %29, 31992, !dbg !135
  %scevgep121 = getelementptr i8* %call, i64 %31
  %arrayidx7.i = getelementptr inbounds double* %arraydecay8, i64 %indvars.iv8.i, !dbg !135
  store double 0.000000e+00, double* %arrayidx7.i, align 8, !dbg !135, !tbaa !102
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !138, metadata !81) #4, !dbg !139
  br label %for.body10.i, !dbg !140

for.body10.i:                                     ; preds = %for.body10.i, %for.body5.i
  %32 = phi double [ 0.000000e+00, %for.body5.i ], [ %add.i.1, %for.body10.i ], !dbg !142
  %indvars.iv.i83 = phi i64 [ 0, %for.body5.i ], [ %indvars.iv.next.i86.1, %for.body10.i ], !dbg !124
  %arrayidx16.i84 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.i83, !dbg !144
  %33 = load double* %arrayidx16.i84, align 8, !dbg !144, !tbaa !102
  %arrayidx18.i = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv.i83, !dbg !145
  %34 = load double* %arrayidx18.i, align 8, !dbg !145, !tbaa !102
  %mul.i85 = fmul double %33, %34, !dbg !144
  %add.i = fadd double %32, %mul.i85, !dbg !142
  store double %add.i, double* %arrayidx7.i, align 8, !dbg !146, !tbaa !102
  %indvars.iv.next.i86 = add nuw nsw i64 %indvars.iv.i83, 1, !dbg !140
  %arrayidx16.i84.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.next.i86, !dbg !144
  %35 = load double* %arrayidx16.i84.1, align 8, !dbg !144, !tbaa !102
  %arrayidx18.i.1 = getelementptr inbounds double* %arraydecay4, i64 %indvars.iv.next.i86, !dbg !145
  %36 = load double* %arrayidx18.i.1, align 8, !dbg !145, !tbaa !102
  %mul.i85.1 = fmul double %35, %36, !dbg !144
  %add.i.1 = fadd double %add.i, %mul.i85.1, !dbg !142
  store double %add.i.1, double* %arrayidx7.i, align 8, !dbg !146, !tbaa !102
  %indvars.iv.next.i86.1 = add nuw nsw i64 %indvars.iv.next.i86, 1, !dbg !140
  %exitcond.i87.1 = icmp eq i64 %indvars.iv.next.i86.1, 4000, !dbg !140
  br i1 %exitcond.i87.1, label %for.body26.i.preheader, label %for.body10.i, !dbg !140

for.body26.i.preheader:                           ; preds = %for.body10.i
  %add.i.lcssa = phi double [ %add.i.1, %for.body10.i ]
  %37 = load double* %arraydecay7, align 8, !dbg !147, !tbaa !102
  %arrayidx32.i88 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 0, !dbg !150
  %38 = load double* %arrayidx32.i88, align 8, !dbg !150, !tbaa !102
  %mul35.i89 = fmul double %add.i.lcssa, %38, !dbg !150
  %add36.i90 = fadd double %37, %mul35.i89, !dbg !147
  store double %add36.i90, double* %arraydecay7, align 8, !dbg !151, !tbaa !102
  %bc122 = bitcast double* %arrayidx7.i to i8*
  %bound0 = icmp ule i8* %scevgep, %bc122
  %bc = bitcast double* %arrayidx7.i to i8*
  %bound1 = icmp ule i8* %bc, %scevgep119
  %found.conflict = and i1 %bound0, %bound1
  %bound0123 = icmp ule i8* %scevgep, %scevgep121
  %bound1124 = icmp ule i8* %scevgep120, %scevgep119
  %found.conflict125 = and i1 %bound0123, %bound1124
  %conflict.rdx = or i1 %found.conflict, %found.conflict125
  br i1 %conflict.rdx, label %for.body26.for.body26_crit_edge.i.preheader, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %for.body26.i.preheader
  br label %vector.body114, !dbg !152

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index117 = phi i64 [ %index.next131, %vector.body114 ], [ 1, %vector.body114.preheader ], !dbg !153
  %39 = load double* %arrayidx7.i, align 8, !dbg !152, !tbaa !102
  %40 = insertelement <2 x double> undef, double %39, i32 0, !dbg !152
  %41 = insertelement <2 x double> %40, double %39, i32 1, !dbg !152
  %42 = insertelement <2 x double> undef, double %39, i32 0, !dbg !152
  %43 = insertelement <2 x double> %42, double %39, i32 1, !dbg !152
  %44 = getelementptr inbounds double* %arraydecay7, i64 %index117, !dbg !147
  %45 = bitcast double* %44 to <2 x double>*, !dbg !147
  %wide.load = load <2 x double>* %45, align 8, !dbg !147, !tbaa !102
  %.sum = add i64 %index117, 2, !dbg !147
  %46 = getelementptr double* %arraydecay7, i64 %.sum, !dbg !147
  %47 = bitcast double* %46 to <2 x double>*, !dbg !147
  %wide.load134 = load <2 x double>* %47, align 8, !dbg !147, !tbaa !102
  %48 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %index117, !dbg !150
  %49 = bitcast double* %48 to <2 x double>*, !dbg !150
  %wide.load135 = load <2 x double>* %49, align 8, !dbg !150, !tbaa !102
  %.sum140 = add i64 %index117, 2, !dbg !150
  %50 = getelementptr [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %.sum140, !dbg !150
  %51 = bitcast double* %50 to <2 x double>*, !dbg !150
  %wide.load136 = load <2 x double>* %51, align 8, !dbg !150, !tbaa !102
  %52 = fmul <2 x double> %41, %wide.load135, !dbg !150
  %53 = fmul <2 x double> %43, %wide.load136, !dbg !150
  %54 = fadd <2 x double> %wide.load, %52, !dbg !147
  %55 = fadd <2 x double> %wide.load134, %53, !dbg !147
  %56 = bitcast double* %44 to <2 x double>*, !dbg !151
  store <2 x double> %54, <2 x double>* %56, align 8, !dbg !151, !tbaa !102
  %57 = bitcast double* %46 to <2 x double>*, !dbg !151
  store <2 x double> %55, <2 x double>* %57, align 8, !dbg !151, !tbaa !102
  %index.next131 = add i64 %index117, 4, !dbg !153
  %58 = icmp eq i64 %index.next131, 3997, !dbg !153
  br i1 %58, label %for.body26.for.body26_crit_edge.i.preheader.loopexit, label %vector.body114, !dbg !153, !llvm.loop !154

for.body26.for.body26_crit_edge.i.preheader.loopexit: ; preds = %vector.body114
  br label %for.body26.for.body26_crit_edge.i.preheader

for.body26.for.body26_crit_edge.i.preheader:      ; preds = %for.body26.for.body26_crit_edge.i.preheader.loopexit, %for.body26.i.preheader
  %indvars.iv.next6.i91.ph = phi i64 [ 1, %for.body26.i.preheader ], [ 3997, %for.body26.for.body26_crit_edge.i.preheader.loopexit ]
  %59 = sub i64 4000, %indvars.iv.next6.i91.ph
  %xtraiter = and i64 %59, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %59, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body26.for.body26_crit_edge.i.prol.preheader, label %for.body26.for.body26_crit_edge.i.preheader.split

for.body26.for.body26_crit_edge.i.prol.preheader: ; preds = %for.body26.for.body26_crit_edge.i.preheader
  br label %for.body26.for.body26_crit_edge.i.prol, !dbg !152

for.body26.for.body26_crit_edge.i.prol:           ; preds = %for.body26.for.body26_crit_edge.i.prol.preheader, %for.body26.for.body26_crit_edge.i.prol
  %indvars.iv.next6.i91.prol = phi i64 [ %indvars.iv.next6.i.prol, %for.body26.for.body26_crit_edge.i.prol ], [ %indvars.iv.next6.i91.ph, %for.body26.for.body26_crit_edge.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body26.for.body26_crit_edge.i.prol ], [ %xtraiter, %for.body26.for.body26_crit_edge.i.prol.preheader ]
  %.pre.i.prol = load double* %arrayidx7.i, align 8, !dbg !152, !tbaa !102
  %arrayidx28.i.prol = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.next6.i91.prol, !dbg !147
  %60 = load double* %arrayidx28.i.prol, align 8, !dbg !147, !tbaa !102
  %arrayidx32.i.prol = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.next6.i91.prol, !dbg !150
  %61 = load double* %arrayidx32.i.prol, align 8, !dbg !150, !tbaa !102
  %mul35.i.prol = fmul double %.pre.i.prol, %61, !dbg !150
  %add36.i.prol = fadd double %60, %mul35.i.prol, !dbg !147
  store double %add36.i.prol, double* %arrayidx28.i.prol, align 8, !dbg !151, !tbaa !102
  %indvars.iv.next6.i.prol = add nuw nsw i64 %indvars.iv.next6.i91.prol, 1, !dbg !153
  %exitcond7.i.prol = icmp eq i64 %indvars.iv.next6.i.prol, 4000, !dbg !153
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !153
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !153
  br i1 %prol.iter.cmp, label %for.body26.for.body26_crit_edge.i.prol, label %for.body26.for.body26_crit_edge.i.preheader.split.loopexit, !llvm.loop !155

for.body26.for.body26_crit_edge.i.preheader.split.loopexit: ; preds = %for.body26.for.body26_crit_edge.i.prol
  %indvars.iv.next6.i91.unr.ph = phi i64 [ %indvars.iv.next6.i.prol, %for.body26.for.body26_crit_edge.i.prol ]
  br label %for.body26.for.body26_crit_edge.i.preheader.split

for.body26.for.body26_crit_edge.i.preheader.split: ; preds = %for.body26.for.body26_crit_edge.i.preheader.split.loopexit, %for.body26.for.body26_crit_edge.i.preheader
  %indvars.iv.next6.i91.unr = phi i64 [ %indvars.iv.next6.i91.ph, %for.body26.for.body26_crit_edge.i.preheader ], [ %indvars.iv.next6.i91.unr.ph, %for.body26.for.body26_crit_edge.i.preheader.split.loopexit ]
  %62 = icmp ult i64 %59, 2
  br i1 %62, label %for.inc42.i, label %for.body26.for.body26_crit_edge.i.preheader.split.split

for.body26.for.body26_crit_edge.i.preheader.split.split: ; preds = %for.body26.for.body26_crit_edge.i.preheader.split
  br label %for.body26.for.body26_crit_edge.i, !dbg !152

for.body26.for.body26_crit_edge.i:                ; preds = %for.body26.for.body26_crit_edge.i, %for.body26.for.body26_crit_edge.i.preheader.split.split
  %indvars.iv.next6.i91 = phi i64 [ %indvars.iv.next6.i91.unr, %for.body26.for.body26_crit_edge.i.preheader.split.split ], [ %indvars.iv.next6.i.1, %for.body26.for.body26_crit_edge.i ]
  %.pre.i = load double* %arrayidx7.i, align 8, !dbg !152, !tbaa !102
  %arrayidx28.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.next6.i91, !dbg !147
  %63 = load double* %arrayidx28.i, align 8, !dbg !147, !tbaa !102
  %arrayidx32.i = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.next6.i91, !dbg !150
  %64 = load double* %arrayidx32.i, align 8, !dbg !150, !tbaa !102
  %mul35.i = fmul double %.pre.i, %64, !dbg !150
  %add36.i = fadd double %63, %mul35.i, !dbg !147
  store double %add36.i, double* %arrayidx28.i, align 8, !dbg !151, !tbaa !102
  %indvars.iv.next6.i = add nuw nsw i64 %indvars.iv.next6.i91, 1, !dbg !153
  %.pre.i.1 = load double* %arrayidx7.i, align 8, !dbg !152, !tbaa !102
  %arrayidx28.i.1 = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.next6.i, !dbg !147
  %65 = load double* %arrayidx28.i.1, align 8, !dbg !147, !tbaa !102
  %arrayidx32.i.1 = getelementptr inbounds [4000 x double]* %arraydecay, i64 %indvars.iv8.i, i64 %indvars.iv.next6.i, !dbg !150
  %66 = load double* %arrayidx32.i.1, align 8, !dbg !150, !tbaa !102
  %mul35.i.1 = fmul double %.pre.i.1, %66, !dbg !150
  %add36.i.1 = fadd double %65, %mul35.i.1, !dbg !147
  store double %add36.i.1, double* %arrayidx28.i.1, align 8, !dbg !151, !tbaa !102
  %indvars.iv.next6.i.1 = add nuw nsw i64 %indvars.iv.next6.i, 1, !dbg !153
  %exitcond7.i.1 = icmp eq i64 %indvars.iv.next6.i.1, 4000, !dbg !153
  br i1 %exitcond7.i.1, label %for.inc42.i.unr-lcssa, label %for.body26.for.body26_crit_edge.i, !dbg !153, !llvm.loop !157

for.inc42.i.unr-lcssa:                            ; preds = %for.body26.for.body26_crit_edge.i
  br label %for.inc42.i

for.inc42.i:                                      ; preds = %for.body26.for.body26_crit_edge.i.preheader.split, %for.inc42.i.unr-lcssa
  %indvars.iv.next9.i = add nuw nsw i64 %indvars.iv8.i, 1, !dbg !133
  %exitcond10.i = icmp eq i64 %indvars.iv.next9.i, 4000, !dbg !133
  br i1 %exitcond10.i, label %kernel_atax.exit, label %for.body5.i, !dbg !133

kernel_atax.exit:                                 ; preds = %for.inc42.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !158
  br i1 %cmp, label %if.end48, label %if.end55, !dbg !159

if.end48:                                         ; preds = %kernel_atax.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !81), !dbg !160
  tail call void @llvm.dbg.value(metadata i8* %67, i64 0, metadata !45, metadata !81), !dbg !161
  %67 = load i8** %argv, align 8, !dbg !162, !tbaa !164
  %68 = load i8* %67, align 1, !dbg !162, !tbaa !166
  %phitmp = icmp eq i8 %68, 0, !dbg !160
  br i1 %phitmp, label %if.then53, label %if.end55, !dbg !159

if.then53:                                        ; preds = %if.end48
  tail call void @llvm.dbg.value(metadata i32 4000, i64 0, metadata !167, metadata !81) #4, !dbg !170
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !171, metadata !81) #4, !dbg !172
  %69 = load %struct._IO_FILE** @stderr, align 8, !dbg !173, !tbaa !164
  br label %for.body.i80, !dbg !177

for.body.i80:                                     ; preds = %for.inc.i, %if.then53
  %indvars.iv.i78 = phi i64 [ 0, %if.then53 ], [ %indvars.iv.next.i81, %for.inc.i ], !dbg !168
  %70 = phi %struct._IO_FILE* [ %69, %if.then53 ], [ %74, %for.inc.i ], !dbg !168
  %arrayidx.i79 = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.i78, !dbg !178
  %71 = load double* %arrayidx.i79, align 8, !dbg !178, !tbaa !102
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %70, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %71) #5, !dbg !179
  %72 = trunc i64 %indvars.iv.i78 to i32, !dbg !180
  %rem.i = srem i32 %72, 20, !dbg !180
  %cmp1.i = icmp eq i32 %rem.i, 0, !dbg !180
  br i1 %cmp1.i, label %if.then.i, label %for.inc.i, !dbg !182

if.then.i:                                        ; preds = %for.body.i80
  %73 = load %struct._IO_FILE** @stderr, align 8, !dbg !183, !tbaa !164
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %73) #5, !dbg !185
  br label %for.inc.i, !dbg !185

for.inc.i:                                        ; preds = %if.then.i, %for.body.i80
  %indvars.iv.next.i81 = add nuw nsw i64 %indvars.iv.i78, 1, !dbg !177
  %74 = load %struct._IO_FILE** @stderr, align 8, !dbg !173, !tbaa !164
  %exitcond.i82 = icmp eq i64 %indvars.iv.next.i81, 4000, !dbg !177
  br i1 %exitcond.i82, label %print_array.exit, label %for.body.i80, !dbg !177

print_array.exit:                                 ; preds = %for.inc.i
  %.lcssa = phi %struct._IO_FILE* [ %74, %for.inc.i ]
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa) #5, !dbg !186
  br label %if.end55, !dbg !168

if.end55:                                         ; preds = %if.end48, %print_array.exit, %kernel_atax.exit
  tail call void @free(i8* %call) #4, !dbg !187
  tail call void @free(i8* %call1) #4, !dbg !188
  tail call void @free(i8* %call2) #4, !dbg !189
  tail call void @free(i8* %call3) #4, !dbg !190
  ret i32 0, !dbg !191
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

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!78, !79}
!llvm.ident = !{!80}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c] [DW_LANG_C99]
!1 = !{!"atax.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax"}
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
!24 = !{!25, !48, !56, !68}
!25 = !{!"0x2e\00main\00main\00\0081\000\001\000\000\00256\001\0082", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 81] [def] [scope 82] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777297\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 81]
!34 = !{!"0x101\00argv\0033554513\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 81]
!35 = !{!"0x100\00nx\0084\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nx] [line 84]
!36 = !{!"0x100\00ny\0085\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [ny] [line 85]
!37 = !{!"0x100\00A\0088\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 88]
!38 = !{!"0x100\00x\0089\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [x] [line 89]
!39 = !{!"0x100\00y\0090\000", !25, !26, !9}      ; [ DW_TAG_auto_variable ] [y] [line 90]
!40 = !{!"0x100\00tmp\0091\000", !25, !26, !9}    ; [ DW_TAG_auto_variable ] [tmp] [line 91]
!41 = !{!"0x100\00__s1_len\00112\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 112]
!42 = !{!"0xb\00112\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!43 = !{!"0xb\00112\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!44 = !{!"0x100\00__s2_len\00112\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 112]
!45 = !{!"0x100\00__s2\00112\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 112]
!46 = !{!"0xb\00112\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!47 = !{!"0x100\00__result\00112\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 112]
!48 = !{!"0x2e\00print_array\00print_array\00\0040\001\001\000\000\00256\001\0043", !1, !26, !49, null, null, null, null, !52} ; [ DW_TAG_subprogram ] [line 40] [local] [def] [scope 43] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !51}
!51 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!52 = !{!53, !54, !55}
!53 = !{!"0x101\00nx\0016777256\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 40]
!54 = !{!"0x101\00y\0033554473\000", !48, !26, !51} ; [ DW_TAG_arg_variable ] [y] [line 41]
!55 = !{!"0x100\00i\0044\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 44]
!56 = !{!"0x2e\00kernel_atax\00kernel_atax\00\0057\001\001\000\000\00256\001\0062", !1, !26, !57, null, null, null, null, !59} ; [ DW_TAG_subprogram ] [line 57] [local] [def] [scope 62] [kernel_atax]
!57 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !58, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = !{null, !29, !29, !9, !51, !51, !51}
!59 = !{!60, !61, !62, !63, !64, !65, !66, !67}
!60 = !{!"0x101\00nx\0016777273\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 57]
!61 = !{!"0x101\00ny\0033554489\000", !56, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 57]
!62 = !{!"0x101\00A\0050331706\000", !56, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 58]
!63 = !{!"0x101\00x\0067108923\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [x] [line 59]
!64 = !{!"0x101\00y\0083886140\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [y] [line 60]
!65 = !{!"0x101\00tmp\00100663357\000", !56, !26, !51} ; [ DW_TAG_arg_variable ] [tmp] [line 61]
!66 = !{!"0x100\00i\0063\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 63]
!67 = !{!"0x100\00j\0063\000", !56, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 63]
!68 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !69, null, null, null, null, !71} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!69 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !70, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{null, !29, !29, !9, !51}
!71 = !{!72, !73, !74, !75, !76, !77}
!72 = !{!"0x101\00nx\0016777239\000", !68, !26, !29} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!73 = !{!"0x101\00ny\0033554455\000", !68, !26, !29} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!74 = !{!"0x101\00A\0050331672\000", !68, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!75 = !{!"0x101\00x\0067108889\000", !68, !26, !51} ; [ DW_TAG_arg_variable ] [x] [line 25]
!76 = !{!"0x100\00i\0027\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!77 = !{!"0x100\00j\0027\000", !68, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!78 = !{i32 2, !"Dwarf Version", i32 4}
!79 = !{i32 2, !"Debug Info Version", i32 2}
!80 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!81 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!82 = !MDLocation(line: 81, column: 14, scope: !25)
!83 = !MDLocation(line: 81, column: 27, scope: !25)
!84 = !MDLocation(line: 84, column: 7, scope: !25)
!85 = !MDLocation(line: 85, column: 7, scope: !25)
!86 = !MDLocation(line: 88, column: 3, scope: !25)
!87 = !MDLocation(line: 89, column: 3, scope: !25)
!88 = !MDLocation(line: 90, column: 3, scope: !25)
!89 = !MDLocation(line: 91, column: 3, scope: !25)
!90 = !MDLocation(line: 94, column: 43, scope: !25)
!91 = !{!"0x101\00nx\0016777239\000", !68, !26, !29, !92} ; [ DW_TAG_arg_variable ] [nx] [line 23]
!92 = !MDLocation(line: 94, column: 3, scope: !25)
!93 = !MDLocation(line: 23, column: 22, scope: !68, inlinedAt: !92)
!94 = !{!"0x101\00ny\0033554455\000", !68, !26, !29, !92} ; [ DW_TAG_arg_variable ] [ny] [line 23]
!95 = !MDLocation(line: 23, column: 30, scope: !68, inlinedAt: !92)
!96 = !{!"0x100\00i\0027\000", !68, !26, !29, !92} ; [ DW_TAG_auto_variable ] [i] [line 27]
!97 = !MDLocation(line: 27, column: 7, scope: !68, inlinedAt: !92)
!98 = !MDLocation(line: 30, column: 14, scope: !99, inlinedAt: !92)
!99 = !{!"0xb\0029\003\0022", !1, !100}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!100 = !{!"0xb\0029\003\0021", !1, !68}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!101 = !MDLocation(line: 30, column: 7, scope: !99, inlinedAt: !92)
!102 = !{!103, !103, i64 0}
!103 = !{!"double", !104, i64 0}
!104 = !{!"omnipotent char", !105, i64 0}
!105 = !{!"Simple C/C++ TBAA"}
!106 = distinct !{!106, !107, !108}
!107 = !{!"llvm.loop.vectorize.width", i32 1}
!108 = !{!"llvm.loop.interleave.count", i32 1}
!109 = !MDLocation(line: 94, column: 23, scope: !25)
!110 = !MDLocation(line: 33, column: 18, scope: !111, inlinedAt: !92)
!111 = !{!"0xb\0032\005\0026", !1, !112}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!112 = !{!"0xb\0032\005\0025", !1, !113}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!113 = !{!"0xb\0031\003\0024", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!114 = !{!"0xb\0031\003\0023", !1, !68}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!115 = !MDLocation(line: 32, column: 5, scope: !112, inlinedAt: !92)
!116 = !MDLocation(line: 33, column: 32, scope: !111, inlinedAt: !92)
!117 = !MDLocation(line: 33, column: 17, scope: !111, inlinedAt: !92)
!118 = !MDLocation(line: 33, column: 7, scope: !111, inlinedAt: !92)
!119 = distinct !{!119, !107, !108}
!120 = !MDLocation(line: 31, column: 3, scope: !114, inlinedAt: !92)
!121 = !MDLocation(line: 103, column: 9, scope: !25)
!122 = !MDLocation(line: 104, column: 9, scope: !25)
!123 = !{!"0x101\00nx\0016777273\000", !56, !26, !29, !124} ; [ DW_TAG_arg_variable ] [nx] [line 57]
!124 = !MDLocation(line: 100, column: 3, scope: !25)
!125 = !MDLocation(line: 57, column: 22, scope: !56, inlinedAt: !124)
!126 = !{!"0x101\00ny\0033554489\000", !56, !26, !29, !124} ; [ DW_TAG_arg_variable ] [ny] [line 57]
!127 = !MDLocation(line: 57, column: 30, scope: !56, inlinedAt: !124)
!128 = !{!"0x100\00i\0063\000", !56, !26, !29, !124} ; [ DW_TAG_auto_variable ] [i] [line 63]
!129 = !MDLocation(line: 63, column: 7, scope: !56, inlinedAt: !124)
!130 = !MDLocation(line: 67, column: 5, scope: !131, inlinedAt: !124)
!131 = !{!"0xb\0066\003\0013", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!132 = !{!"0xb\0066\003\0012", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!133 = !MDLocation(line: 68, column: 3, scope: !134, inlinedAt: !124)
!134 = !{!"0xb\0068\003\0014", !1, !56}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!135 = !MDLocation(line: 70, column: 7, scope: !136, inlinedAt: !124)
!136 = !{!"0xb\0069\005\0016", !1, !137}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!137 = !{!"0xb\0068\003\0015", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!138 = !{!"0x100\00j\0063\000", !56, !26, !29, !124} ; [ DW_TAG_auto_variable ] [j] [line 63]
!139 = !MDLocation(line: 63, column: 10, scope: !56, inlinedAt: !124)
!140 = !MDLocation(line: 71, column: 7, scope: !141, inlinedAt: !124)
!141 = !{!"0xb\0071\007\0017", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!142 = !MDLocation(line: 72, column: 11, scope: !143, inlinedAt: !124)
!143 = !{!"0xb\0071\007\0018", !1, !141}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!144 = !MDLocation(line: 72, column: 20, scope: !143, inlinedAt: !124)
!145 = !MDLocation(line: 72, column: 30, scope: !143, inlinedAt: !124)
!146 = !MDLocation(line: 72, column: 2, scope: !143, inlinedAt: !124)
!147 = !MDLocation(line: 74, column: 9, scope: !148, inlinedAt: !124)
!148 = !{!"0xb\0073\007\0020", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!149 = !{!"0xb\0073\007\0019", !1, !136}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!150 = !MDLocation(line: 74, column: 16, scope: !148, inlinedAt: !124)
!151 = !MDLocation(line: 74, column: 2, scope: !148, inlinedAt: !124)
!152 = !MDLocation(line: 74, column: 26, scope: !148, inlinedAt: !124)
!153 = !MDLocation(line: 73, column: 7, scope: !149, inlinedAt: !124)
!154 = distinct !{!154, !107, !108}
!155 = distinct !{!155, !156}
!156 = !{!"llvm.loop.unroll.disable"}
!157 = distinct !{!157, !107, !108}
!158 = !MDLocation(line: 112, column: 3, scope: !43)
!159 = !MDLocation(line: 112, column: 3, scope: !25)
!160 = !MDLocation(line: 112, column: 3, scope: !42)
!161 = !MDLocation(line: 112, column: 3, scope: !46)
!162 = !MDLocation(line: 112, column: 3, scope: !163)
!163 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!164 = !{!165, !165, i64 0}
!165 = !{!"any pointer", !104, i64 0}
!166 = !{!104, !104, i64 0}
!167 = !{!"0x101\00nx\0016777256\000", !48, !26, !29, !168} ; [ DW_TAG_arg_variable ] [nx] [line 40]
!168 = !MDLocation(line: 112, column: 3, scope: !169)
!169 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!170 = !MDLocation(line: 40, column: 22, scope: !48, inlinedAt: !168)
!171 = !{!"0x100\00i\0044\000", !48, !26, !29, !168} ; [ DW_TAG_auto_variable ] [i] [line 44]
!172 = !MDLocation(line: 44, column: 7, scope: !48, inlinedAt: !168)
!173 = !MDLocation(line: 47, column: 14, scope: !174, inlinedAt: !168)
!174 = !{!"0xb\0046\0028\0010", !1, !175}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!175 = !{!"0xb\0046\003\009", !1, !176}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!176 = !{!"0xb\0046\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!177 = !MDLocation(line: 46, column: 3, scope: !176, inlinedAt: !168)
!178 = !MDLocation(line: 47, column: 44, scope: !174, inlinedAt: !168)
!179 = !MDLocation(line: 47, column: 5, scope: !174, inlinedAt: !168)
!180 = !MDLocation(line: 48, column: 9, scope: !181, inlinedAt: !168)
!181 = !{!"0xb\0048\009\0011", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!182 = !MDLocation(line: 48, column: 9, scope: !174, inlinedAt: !168)
!183 = !MDLocation(line: 48, column: 31, scope: !184, inlinedAt: !168)
!184 = !{!"0xb\001", !1, !181}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/atax/atax.c]
!185 = !MDLocation(line: 48, column: 22, scope: !181, inlinedAt: !168)
!186 = !MDLocation(line: 50, column: 3, scope: !48, inlinedAt: !168)
!187 = !MDLocation(line: 115, column: 3, scope: !25)
!188 = !MDLocation(line: 116, column: 3, scope: !25)
!189 = !MDLocation(line: 117, column: 3, scope: !25)
!190 = !MDLocation(line: 118, column: 3, scope: !25)
!191 = !MDLocation(line: 120, column: 3, scope: !25)
