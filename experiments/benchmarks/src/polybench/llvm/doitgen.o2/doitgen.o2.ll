; ModuleID = 'doitgen.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !91), !dbg !92
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !91), !dbg !93
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !35, metadata !91), !dbg !94
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !36, metadata !91), !dbg !95
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !37, metadata !91), !dbg !96
  %call = tail call i8* @polybench_alloc_data(i32 2097152, i32 8) #4, !dbg !97
  %call1 = tail call i8* @polybench_alloc_data(i32 2097152, i32 8) #4, !dbg !98
  %call2 = tail call i8* @polybench_alloc_data(i32 16384, i32 8) #4, !dbg !99
  %arraydecay = bitcast i8* %call to [128 x [128 x double]]*, !dbg !100
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !101, metadata !91), !dbg !103
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !104, metadata !91), !dbg !105
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !106, metadata !91), !dbg !107
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !108, metadata !91), !dbg !109
  br label %for.cond1.preheader.i, !dbg !110

for.cond1.preheader.i:                            ; preds = %for.inc17.i, %entry
  %indvars.iv15.i = phi i64 [ 0, %entry ], [ %indvars.iv.next16.i, %for.inc17.i ], !dbg !102
  %0 = trunc i64 %indvars.iv15.i to i32, !dbg !112
  %conv.i = sitofp i32 %0 to double, !dbg !112
  br label %for.cond4.preheader.i, !dbg !118

for.cond4.preheader.i:                            ; preds = %for.inc14.i, %for.cond1.preheader.i
  %indvars.iv12.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next13.i, %for.inc14.i ], !dbg !102
  %1 = trunc i64 %indvars.iv12.i to i32, !dbg !119
  %conv7.i = sitofp i32 %1 to double, !dbg !119
  %mul.i = fmul double %conv.i, %conv7.i, !dbg !112
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond4.preheader.i
  %index = phi i64 [ 0, %for.cond4.preheader.i ], [ %index.next.1, %vector.body ], !dbg !102
  %induction96137 = or i64 %index, 1, !dbg !102
  %2 = trunc i64 %index to i32, !dbg !120
  %induction98138 = or i32 %2, 1, !dbg !120
  %3 = sitofp i32 %2 to double, !dbg !120
  %4 = sitofp i32 %induction98138 to double, !dbg !120
  %5 = fadd double %mul.i, %3, !dbg !112
  %6 = fadd double %mul.i, %4, !dbg !112
  %7 = fmul double %5, 7.812500e-03, !dbg !121
  %8 = fmul double %6, 7.812500e-03, !dbg !121
  %9 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv15.i, i64 %indvars.iv12.i, i64 %index, !dbg !122
  %10 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv15.i, i64 %indvars.iv12.i, i64 %induction96137, !dbg !122
  store double %7, double* %9, align 8, !dbg !122, !tbaa !123
  store double %8, double* %10, align 8, !dbg !122, !tbaa !123
  %index.next = add nuw nsw i64 %index, 2, !dbg !102
  %induction96137.1 = or i64 %index.next, 1, !dbg !102
  %11 = trunc i64 %index.next to i32, !dbg !120
  %induction98138.1 = or i32 %11, 1, !dbg !120
  %12 = sitofp i32 %11 to double, !dbg !120
  %13 = sitofp i32 %induction98138.1 to double, !dbg !120
  %14 = fadd double %mul.i, %12, !dbg !112
  %15 = fadd double %mul.i, %13, !dbg !112
  %16 = fmul double %14, 7.812500e-03, !dbg !121
  %17 = fmul double %15, 7.812500e-03, !dbg !121
  %18 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv15.i, i64 %indvars.iv12.i, i64 %index.next, !dbg !122
  %19 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv15.i, i64 %indvars.iv12.i, i64 %induction96137.1, !dbg !122
  store double %16, double* %18, align 8, !dbg !122, !tbaa !123
  store double %17, double* %19, align 8, !dbg !122, !tbaa !123
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !102
  %20 = icmp eq i64 %index.next.1, 128, !dbg !102
  br i1 %20, label %for.inc14.i, label %vector.body, !dbg !102, !llvm.loop !127

for.inc14.i:                                      ; preds = %vector.body
  %indvars.iv.next13.i = add nuw nsw i64 %indvars.iv12.i, 1, !dbg !118
  %exitcond14.i = icmp eq i64 %indvars.iv.next13.i, 128, !dbg !118
  br i1 %exitcond14.i, label %for.inc17.i, label %for.cond4.preheader.i, !dbg !118

for.inc17.i:                                      ; preds = %for.inc14.i
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1, !dbg !110
  %exitcond17.i = icmp eq i64 %indvars.iv.next16.i, 128, !dbg !110
  br i1 %exitcond17.i, label %for.cond24.preheader.i.preheader, label %for.cond1.preheader.i, !dbg !110

for.cond24.preheader.i.preheader:                 ; preds = %for.inc17.i
  %arraydecay3 = bitcast i8* %call2 to [128 x double]*, !dbg !130
  br label %for.cond24.preheader.i, !dbg !131

for.cond24.preheader.i:                           ; preds = %for.cond24.preheader.i.preheader, %for.inc40.i
  %indvars.iv6.i = phi i64 [ %indvars.iv.next7.i, %for.inc40.i ], [ 0, %for.cond24.preheader.i.preheader ], !dbg !102
  %21 = trunc i64 %indvars.iv6.i to i32, !dbg !131
  %conv28.i = sitofp i32 %21 to double, !dbg !131
  br label %vector.body102

vector.body102:                                   ; preds = %vector.body102, %for.cond24.preheader.i
  %index105 = phi i64 [ 0, %for.cond24.preheader.i ], [ %index.next112.1, %vector.body102 ], !dbg !102
  %induction114139 = or i64 %index105, 1, !dbg !102
  %22 = trunc i64 %index105 to i32, !dbg !136
  %induction116140 = or i32 %22, 1, !dbg !136
  %23 = sitofp i32 %22 to double, !dbg !136
  %24 = sitofp i32 %induction116140 to double, !dbg !136
  %25 = fmul double %conv28.i, %23, !dbg !131
  %26 = fmul double %conv28.i, %24, !dbg !131
  %27 = fmul double %25, 7.812500e-03, !dbg !137
  %28 = fmul double %26, 7.812500e-03, !dbg !137
  %29 = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %index105, !dbg !138
  %30 = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %induction114139, !dbg !138
  store double %27, double* %29, align 8, !dbg !138, !tbaa !123
  store double %28, double* %30, align 8, !dbg !138, !tbaa !123
  %index.next112 = add nuw nsw i64 %index105, 2, !dbg !102
  %induction114139.1 = or i64 %index.next112, 1, !dbg !102
  %31 = trunc i64 %index.next112 to i32, !dbg !136
  %induction116140.1 = or i32 %31, 1, !dbg !136
  %32 = sitofp i32 %31 to double, !dbg !136
  %33 = sitofp i32 %induction116140.1 to double, !dbg !136
  %34 = fmul double %conv28.i, %32, !dbg !131
  %35 = fmul double %conv28.i, %33, !dbg !131
  %36 = fmul double %34, 7.812500e-03, !dbg !137
  %37 = fmul double %35, 7.812500e-03, !dbg !137
  %38 = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %index.next112, !dbg !138
  %39 = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv6.i, i64 %induction114139.1, !dbg !138
  store double %36, double* %38, align 8, !dbg !138, !tbaa !123
  store double %37, double* %39, align 8, !dbg !138, !tbaa !123
  %index.next112.1 = add nuw nsw i64 %index.next112, 2, !dbg !102
  %40 = icmp eq i64 %index.next112.1, 128, !dbg !102
  br i1 %40, label %for.inc40.i, label %vector.body102, !dbg !102, !llvm.loop !139

for.inc40.i:                                      ; preds = %vector.body102
  %indvars.iv.next7.i = add nuw nsw i64 %indvars.iv6.i, 1, !dbg !140
  %exitcond8.i = icmp eq i64 %indvars.iv.next7.i, 128, !dbg !140
  br i1 %exitcond8.i, label %init_array.exit, label %for.cond24.preheader.i, !dbg !140

init_array.exit:                                  ; preds = %for.inc40.i
  %arraydecay6 = bitcast i8* %call1 to [128 x [128 x double]]*, !dbg !141
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !142, metadata !91), !dbg !144
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !145, metadata !91), !dbg !146
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !147, metadata !91), !dbg !148
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !149, metadata !91), !dbg !150
  br label %for.cond1.preheader.i81, !dbg !151

for.cond1.preheader.i81:                          ; preds = %for.inc60.i, %init_array.exit
  %indvars.iv19.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next20.i, %for.inc60.i ], !dbg !143
  %41 = shl i64 %indvars.iv19.i, 17, !dbg !153
  %42 = or i64 %41, 1016, !dbg !153
  br label %for.cond4.preheader.i82, !dbg !153

for.cond4.preheader.i82:                          ; preds = %for.inc57.i, %for.cond1.preheader.i81
  %indvars.iv16.i = phi i64 [ 0, %for.cond1.preheader.i81 ], [ %indvars.iv.next17.i, %for.inc57.i ], !dbg !143
  %43 = shl i64 %indvars.iv16.i, 10, !dbg !156
  %44 = add i64 %41, %43, !dbg !156
  %scevgep = getelementptr i8* %call, i64 %44
  %45 = add i64 %42, %43, !dbg !156
  %scevgep125 = getelementptr i8* %call, i64 %45
  %scevgep126 = getelementptr i8* %call1, i64 %44
  %scevgep127 = getelementptr i8* %call1, i64 %45
  br label %for.body6.i85, !dbg !156

for.body6.i85:                                    ; preds = %for.inc36.i, %for.cond4.preheader.i82
  %indvars.iv6.i83 = phi i64 [ 0, %for.cond4.preheader.i82 ], [ %indvars.iv.next7.i91, %for.inc36.i ], !dbg !143
  %arrayidx10.i84 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv6.i83, !dbg !160
  store double 0.000000e+00, double* %arrayidx10.i84, align 8, !dbg !160, !tbaa !123
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !163, metadata !91), !dbg !164
  br label %for.body13.i, !dbg !165

for.body13.i:                                     ; preds = %for.body13.i, %for.body6.i85
  %46 = phi double [ 0.000000e+00, %for.body6.i85 ], [ %add.i88.1, %for.body13.i ], !dbg !167
  %indvars.iv.i86 = phi i64 [ 0, %for.body6.i85 ], [ %indvars.iv.next.i89.1, %for.body13.i ], !dbg !143
  %arrayidx25.i = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.i86, !dbg !169
  %47 = load double* %arrayidx25.i, align 8, !dbg !169, !tbaa !123
  %arrayidx29.i = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv.i86, i64 %indvars.iv6.i83, !dbg !170
  %48 = load double* %arrayidx29.i, align 8, !dbg !170, !tbaa !123
  %mul.i87 = fmul double %47, %48, !dbg !169
  %add.i88 = fadd double %46, %mul.i87, !dbg !167
  store double %add.i88, double* %arrayidx10.i84, align 8, !dbg !171, !tbaa !123
  %indvars.iv.next.i89 = add nuw nsw i64 %indvars.iv.i86, 1, !dbg !165
  %arrayidx25.i.1 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next.i89, !dbg !169
  %49 = load double* %arrayidx25.i.1, align 8, !dbg !169, !tbaa !123
  %arrayidx29.i.1 = getelementptr inbounds [128 x double]* %arraydecay3, i64 %indvars.iv.next.i89, i64 %indvars.iv6.i83, !dbg !170
  %50 = load double* %arrayidx29.i.1, align 8, !dbg !170, !tbaa !123
  %mul.i87.1 = fmul double %49, %50, !dbg !169
  %add.i88.1 = fadd double %add.i88, %mul.i87.1, !dbg !167
  store double %add.i88.1, double* %arrayidx10.i84, align 8, !dbg !171, !tbaa !123
  %indvars.iv.next.i89.1 = add nuw nsw i64 %indvars.iv.next.i89, 1, !dbg !165
  %exitcond.i90.1 = icmp eq i64 %indvars.iv.next.i89.1, 128, !dbg !165
  br i1 %exitcond.i90.1, label %for.inc36.i, label %for.body13.i, !dbg !165

for.inc36.i:                                      ; preds = %for.body13.i
  %indvars.iv.next7.i91 = add nuw nsw i64 %indvars.iv6.i83, 1, !dbg !156
  %exitcond8.i92 = icmp eq i64 %indvars.iv.next7.i91, 128, !dbg !156
  br i1 %exitcond8.i92, label %vector.memcheck, label %for.body6.i85, !dbg !156

vector.memcheck:                                  ; preds = %for.inc36.i
  %bound0 = icmp ule i8* %scevgep, %scevgep127
  %bound1 = icmp ule i8* %scevgep126, %scevgep125
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block121, label %vector.body120.preheader

vector.body120.preheader:                         ; preds = %vector.memcheck
  br label %vector.body120, !dbg !172

vector.body120:                                   ; preds = %vector.body120, %vector.body120.preheader
  %index123 = phi i64 [ 0, %vector.body120.preheader ], [ %index.next133.1, %vector.body120 ], !dbg !143
  %51 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %index123, !dbg !172
  %52 = bitcast double* %51 to <2 x double>*, !dbg !172
  %wide.load = load <2 x double>* %52, align 8, !dbg !172, !tbaa !123
  %.sum141 = or i64 %index123, 2, !dbg !172
  %53 = getelementptr [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %.sum141, !dbg !172
  %54 = bitcast double* %53 to <2 x double>*, !dbg !172
  %wide.load136 = load <2 x double>* %54, align 8, !dbg !172, !tbaa !123
  %55 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %index123, !dbg !175
  %56 = bitcast double* %55 to <2 x double>*, !dbg !175
  store <2 x double> %wide.load, <2 x double>* %56, align 8, !dbg !175, !tbaa !123
  %.sum142 = or i64 %index123, 2, !dbg !175
  %57 = getelementptr [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %.sum142, !dbg !175
  %58 = bitcast double* %57 to <2 x double>*, !dbg !175
  store <2 x double> %wide.load136, <2 x double>* %58, align 8, !dbg !175, !tbaa !123
  %index.next133 = add nuw nsw i64 %index123, 4, !dbg !143
  %59 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %index.next133, !dbg !172
  %60 = bitcast double* %59 to <2 x double>*, !dbg !172
  %wide.load.1 = load <2 x double>* %60, align 8, !dbg !172, !tbaa !123
  %.sum141.1 = or i64 %index.next133, 2, !dbg !172
  %61 = getelementptr [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %.sum141.1, !dbg !172
  %62 = bitcast double* %61 to <2 x double>*, !dbg !172
  %wide.load136.1 = load <2 x double>* %62, align 8, !dbg !172, !tbaa !123
  %63 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %index.next133, !dbg !175
  %64 = bitcast double* %63 to <2 x double>*, !dbg !175
  store <2 x double> %wide.load.1, <2 x double>* %64, align 8, !dbg !175, !tbaa !123
  %.sum142.1 = or i64 %index.next133, 2, !dbg !175
  %65 = getelementptr [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %.sum142.1, !dbg !175
  %66 = bitcast double* %65 to <2 x double>*, !dbg !175
  store <2 x double> %wide.load136.1, <2 x double>* %66, align 8, !dbg !175, !tbaa !123
  %index.next133.1 = add nuw nsw i64 %index.next133, 4, !dbg !143
  %67 = icmp eq i64 %index.next133.1, 128, !dbg !143
  br i1 %67, label %middle.block121.loopexit, label %vector.body120, !dbg !143, !llvm.loop !176

middle.block121.loopexit:                         ; preds = %vector.body120
  br label %middle.block121

middle.block121:                                  ; preds = %middle.block121.loopexit, %vector.memcheck
  %resume.val128 = phi i1 [ false, %vector.memcheck ], [ true, %middle.block121.loopexit ]
  %trunc.resume.val129 = phi i64 [ 0, %vector.memcheck ], [ 128, %middle.block121.loopexit ]
  br i1 %resume.val128, label %for.inc57.i, label %for.body41.i.preheader

for.body41.i.preheader:                           ; preds = %middle.block121
  %68 = sub i64 128, %trunc.resume.val129
  %xtraiter = and i64 %68, 3
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %68, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body41.i.prol.preheader, label %for.body41.i.preheader.split

for.body41.i.prol.preheader:                      ; preds = %for.body41.i.preheader
  br label %for.body41.i.prol, !dbg !172

for.body41.i.prol:                                ; preds = %for.body41.i.prol.preheader, %for.body41.i.prol
  %indvars.iv12.i93.prol = phi i64 [ %indvars.iv.next13.i94.prol, %for.body41.i.prol ], [ %trunc.resume.val129, %for.body41.i.prol.preheader ], !dbg !143
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body41.i.prol ], [ %xtraiter, %for.body41.i.prol.preheader ]
  %arrayidx47.i.prol = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv12.i93.prol, !dbg !172
  %69 = load double* %arrayidx47.i.prol, align 8, !dbg !172, !tbaa !123
  %arrayidx53.i.prol = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv12.i93.prol, !dbg !175
  store double %69, double* %arrayidx53.i.prol, align 8, !dbg !175, !tbaa !123
  %indvars.iv.next13.i94.prol = add nuw nsw i64 %indvars.iv12.i93.prol, 1, !dbg !177
  %exitcond14.i95.prol = icmp eq i64 %indvars.iv.next13.i94.prol, 128, !dbg !177
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !177
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !177
  br i1 %prol.iter.cmp, label %for.body41.i.prol, label %for.body41.i.preheader.split.loopexit, !llvm.loop !178

for.body41.i.preheader.split.loopexit:            ; preds = %for.body41.i.prol
  %indvars.iv12.i93.unr.ph = phi i64 [ %indvars.iv.next13.i94.prol, %for.body41.i.prol ]
  br label %for.body41.i.preheader.split

for.body41.i.preheader.split:                     ; preds = %for.body41.i.preheader.split.loopexit, %for.body41.i.preheader
  %indvars.iv12.i93.unr = phi i64 [ %trunc.resume.val129, %for.body41.i.preheader ], [ %indvars.iv12.i93.unr.ph, %for.body41.i.preheader.split.loopexit ]
  %70 = icmp ult i64 %68, 4
  br i1 %70, label %for.inc57.i.loopexit, label %for.body41.i.preheader.split.split

for.body41.i.preheader.split.split:               ; preds = %for.body41.i.preheader.split
  br label %for.body41.i, !dbg !172

for.body41.i:                                     ; preds = %for.body41.i, %for.body41.i.preheader.split.split
  %indvars.iv12.i93 = phi i64 [ %indvars.iv12.i93.unr, %for.body41.i.preheader.split.split ], [ %indvars.iv.next13.i94.3, %for.body41.i ], !dbg !143
  %arrayidx47.i = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv12.i93, !dbg !172
  %71 = load double* %arrayidx47.i, align 8, !dbg !172, !tbaa !123
  %arrayidx53.i = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv12.i93, !dbg !175
  store double %71, double* %arrayidx53.i, align 8, !dbg !175, !tbaa !123
  %indvars.iv.next13.i94 = add nuw nsw i64 %indvars.iv12.i93, 1, !dbg !177
  %arrayidx47.i.1 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94, !dbg !172
  %72 = load double* %arrayidx47.i.1, align 8, !dbg !172, !tbaa !123
  %arrayidx53.i.1 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94, !dbg !175
  store double %72, double* %arrayidx53.i.1, align 8, !dbg !175, !tbaa !123
  %indvars.iv.next13.i94.1 = add nuw nsw i64 %indvars.iv.next13.i94, 1, !dbg !177
  %arrayidx47.i.2 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94.1, !dbg !172
  %73 = load double* %arrayidx47.i.2, align 8, !dbg !172, !tbaa !123
  %arrayidx53.i.2 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94.1, !dbg !175
  store double %73, double* %arrayidx53.i.2, align 8, !dbg !175, !tbaa !123
  %indvars.iv.next13.i94.2 = add nuw nsw i64 %indvars.iv.next13.i94.1, 1, !dbg !177
  %arrayidx47.i.3 = getelementptr inbounds [128 x [128 x double]]* %arraydecay6, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94.2, !dbg !172
  %74 = load double* %arrayidx47.i.3, align 8, !dbg !172, !tbaa !123
  %arrayidx53.i.3 = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv19.i, i64 %indvars.iv16.i, i64 %indvars.iv.next13.i94.2, !dbg !175
  store double %74, double* %arrayidx53.i.3, align 8, !dbg !175, !tbaa !123
  %indvars.iv.next13.i94.3 = add nuw nsw i64 %indvars.iv.next13.i94.2, 1, !dbg !177
  %exitcond14.i95.3 = icmp eq i64 %indvars.iv.next13.i94.3, 128, !dbg !177
  br i1 %exitcond14.i95.3, label %for.inc57.i.loopexit.unr-lcssa, label %for.body41.i, !dbg !177, !llvm.loop !180

for.inc57.i.loopexit.unr-lcssa:                   ; preds = %for.body41.i
  br label %for.inc57.i.loopexit

for.inc57.i.loopexit:                             ; preds = %for.body41.i.preheader.split, %for.inc57.i.loopexit.unr-lcssa
  br label %for.inc57.i

for.inc57.i:                                      ; preds = %for.inc57.i.loopexit, %middle.block121
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !153
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 128, !dbg !153
  br i1 %exitcond18.i, label %for.inc60.i, label %for.cond4.preheader.i82, !dbg !153

for.inc60.i:                                      ; preds = %for.inc57.i
  %indvars.iv.next20.i = add nuw nsw i64 %indvars.iv19.i, 1, !dbg !151
  %exitcond21.i = icmp eq i64 %indvars.iv.next20.i, 128, !dbg !151
  br i1 %exitcond21.i, label %kernel_doitgen.exit, label %for.cond1.preheader.i81, !dbg !151

kernel_doitgen.exit:                              ; preds = %for.inc60.i
  %cmp = icmp sgt i32 %argc, 42, !dbg !181
  br i1 %cmp, label %if.end43, label %if.end50, !dbg !182

if.end43:                                         ; preds = %kernel_doitgen.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !91), !dbg !183
  tail call void @llvm.dbg.value(metadata i8* %75, i64 0, metadata !45, metadata !91), !dbg !184
  %75 = load i8** %argv, align 8, !dbg !185, !tbaa !187
  %76 = load i8* %75, align 1, !dbg !185, !tbaa !189
  %phitmp = icmp eq i8 %76, 0, !dbg !183
  br i1 %phitmp, label %for.cond1.preheader.i75.preheader, label %if.end50, !dbg !182

for.cond1.preheader.i75.preheader:                ; preds = %if.end43
  br label %for.cond1.preheader.i75, !dbg !190

for.cond1.preheader.i75:                          ; preds = %for.cond1.preheader.i75.preheader, %for.inc16.i
  %indvars.iv10.i = phi i64 [ %indvars.iv.next11.i, %for.inc16.i ], [ 0, %for.cond1.preheader.i75.preheader ], !dbg !199
  %77 = trunc i64 %indvars.iv10.i to i32, !dbg !190
  %rem.i = srem i32 %77, 20, !dbg !190
  %cmp11.i = icmp eq i32 %rem.i, 0, !dbg !190
  br label %for.cond4.preheader.i76, !dbg !201

for.cond4.preheader.i76:                          ; preds = %for.inc13.i, %for.cond1.preheader.i75
  %indvars.iv7.i = phi i64 [ 0, %for.cond1.preheader.i75 ], [ %indvars.iv.next8.i, %for.inc13.i ], !dbg !199
  br label %for.body6.i78, !dbg !202

for.body6.i78:                                    ; preds = %for.inc.i, %for.cond4.preheader.i76
  %indvars.iv.i77 = phi i64 [ 0, %for.cond4.preheader.i76 ], [ %indvars.iv.next.i79, %for.inc.i ], !dbg !199
  %78 = load %struct._IO_FILE** @stderr, align 8, !dbg !203, !tbaa !187
  %arrayidx10.i = getelementptr inbounds [128 x [128 x double]]* %arraydecay, i64 %indvars.iv10.i, i64 %indvars.iv7.i, i64 %indvars.iv.i77, !dbg !204
  %79 = load double* %arrayidx10.i, align 8, !dbg !204, !tbaa !123
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %79) #5, !dbg !205
  br i1 %cmp11.i, label %if.then.i, label %for.inc.i, !dbg !206

if.then.i:                                        ; preds = %for.body6.i78
  %80 = load %struct._IO_FILE** @stderr, align 8, !dbg !207, !tbaa !187
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %80) #5, !dbg !209
  br label %for.inc.i, !dbg !209

for.inc.i:                                        ; preds = %if.then.i, %for.body6.i78
  %indvars.iv.next.i79 = add nuw nsw i64 %indvars.iv.i77, 1, !dbg !202
  %exitcond.i80 = icmp eq i64 %indvars.iv.next.i79, 128, !dbg !202
  br i1 %exitcond.i80, label %for.inc13.i, label %for.body6.i78, !dbg !202

for.inc13.i:                                      ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !201
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 128, !dbg !201
  br i1 %exitcond9.i, label %for.inc16.i, label %for.cond4.preheader.i76, !dbg !201

for.inc16.i:                                      ; preds = %for.inc13.i
  %indvars.iv.next11.i = add nuw nsw i64 %indvars.iv10.i, 1, !dbg !210
  %exitcond12.i = icmp eq i64 %indvars.iv.next11.i, 128, !dbg !210
  br i1 %exitcond12.i, label %print_array.exit, label %for.cond1.preheader.i75, !dbg !210

print_array.exit:                                 ; preds = %for.inc16.i
  %81 = load %struct._IO_FILE** @stderr, align 8, !dbg !211, !tbaa !187
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %81) #5, !dbg !212
  br label %if.end50, !dbg !199

if.end50:                                         ; preds = %if.end43, %print_array.exit, %kernel_doitgen.exit
  tail call void @free(i8* %call) #4, !dbg !213
  tail call void @free(i8* %call1) #4, !dbg !214
  tail call void @free(i8* %call2) #4, !dbg !215
  ret i32 0, !dbg !216
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
!llvm.module.flags = !{!88, !89}
!llvm.ident = !{!90}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c] [DW_LANG_C99]
!1 = !{!"doitgen.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen"}
!2 = !{}
!3 = !{!4, !9, !12, !15, !17, !20, !23, !6}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!5 = !{!"0x1\00\000\00134217728\0064\000\000\000", null, null, !6, !7, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 134217728, align 64, offset 0] [from double]
!6 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!7 = !{!8, !8, !8}
!8 = !{!"0x21\000\00128"}                         ; [ DW_TAG_subrange_type ] [0, 127]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x1\00\000\001048576\0064\000\000\000", null, null, !6, !11, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1048576, align 64, offset 0] [from double]
!11 = !{!8, !8}
!12 = !{!"0x16\00size_t\0062\000\000\000\000", !13, null, !14} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen"}
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
!24 = !{!25, !48, !59, !76}
!25 = !{!"0x2e\00main\00main\00\0083\000\001\000\000\00256\001\0084", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 83] [def] [scope 84] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !44, !45, !47}
!33 = !{!"0x101\00argc\0016777299\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 83]
!34 = !{!"0x101\00argv\0033554515\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 83]
!35 = !{!"0x100\00nr\0086\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nr] [line 86]
!36 = !{!"0x100\00nq\0087\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [nq] [line 87]
!37 = !{!"0x100\00np\0088\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [np] [line 88]
!38 = !{!"0x100\00A\0091\000", !25, !26, !4}      ; [ DW_TAG_auto_variable ] [A] [line 91]
!39 = !{!"0x100\00sum\0092\000", !25, !26, !4}    ; [ DW_TAG_auto_variable ] [sum] [line 92]
!40 = !{!"0x100\00C4\0093\000", !25, !26, !9}     ; [ DW_TAG_auto_variable ] [C4] [line 93]
!41 = !{!"0x100\00__s1_len\00115\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 115]
!42 = !{!"0xb\00115\003\001", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!43 = !{!"0xb\00115\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!44 = !{!"0x100\00__s2_len\00115\000", !42, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 115]
!45 = !{!"0x100\00__s2\00115\000", !46, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 115]
!46 = !{!"0xb\00115\003\002", !1, !42}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!47 = !{!"0x100\00__result\00115\000", !46, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 115]
!48 = !{!"0x2e\00print_array\00print_array\00\0042\001\001\000\000\00256\001\0044", !1, !26, !49, null, null, null, null, !51} ; [ DW_TAG_subprogram ] [line 42] [local] [def] [scope 44] [print_array]
!49 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !50, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = !{null, !29, !29, !29, !9}
!51 = !{!52, !53, !54, !55, !56, !57, !58}
!52 = !{!"0x101\00nr\0016777258\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 42]
!53 = !{!"0x101\00nq\0033554474\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 42]
!54 = !{!"0x101\00np\0050331690\000", !48, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 42]
!55 = !{!"0x101\00A\0067108907\000", !48, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 43]
!56 = !{!"0x100\00i\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!57 = !{!"0x100\00j\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!58 = !{!"0x100\00k\0045\000", !48, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 45]
!59 = !{!"0x2e\00kernel_doitgen\00kernel_doitgen\00\0060\001\001\000\000\00256\001\0064", !1, !26, !60, null, null, null, null, !65} ; [ DW_TAG_subprogram ] [line 60] [local] [def] [scope 64] [kernel_doitgen]
!60 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !61, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = !{null, !29, !29, !29, !9, !62, !9}
!62 = !{!"0xf\00\000\0064\0064\000\000", null, null, !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!63 = !{!"0x1\00\000\008192\0064\000\000\000", null, null, !6, !64, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8192, align 64, offset 0] [from double]
!64 = !{!8}
!65 = !{!66, !67, !68, !69, !70, !71, !72, !73, !74, !75}
!66 = !{!"0x101\00nr\0016777276\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 60]
!67 = !{!"0x101\00nq\0033554492\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 60]
!68 = !{!"0x101\00np\0050331708\000", !59, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 60]
!69 = !{!"0x101\00A\0067108925\000", !59, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 61]
!70 = !{!"0x101\00C4\0083886142\000", !59, !26, !62} ; [ DW_TAG_arg_variable ] [C4] [line 62]
!71 = !{!"0x101\00sum\00100663359\000", !59, !26, !9} ; [ DW_TAG_arg_variable ] [sum] [line 63]
!72 = !{!"0x100\00r\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [r] [line 65]
!73 = !{!"0x100\00q\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [q] [line 65]
!74 = !{!"0x100\00p\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [p] [line 65]
!75 = !{!"0x100\00s\0065\000", !59, !26, !29}     ; [ DW_TAG_auto_variable ] [s] [line 65]
!76 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0026", !1, !26, !77, null, null, null, null, !79} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 26] [init_array]
!77 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !78, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = !{null, !29, !29, !29, !9, !62}
!79 = !{!80, !81, !82, !83, !84, !85, !86, !87}
!80 = !{!"0x101\00nr\0016777239\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [nr] [line 23]
!81 = !{!"0x101\00nq\0033554455\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [nq] [line 23]
!82 = !{!"0x101\00np\0050331671\000", !76, !26, !29} ; [ DW_TAG_arg_variable ] [np] [line 23]
!83 = !{!"0x101\00A\0067108888\000", !76, !26, !9} ; [ DW_TAG_arg_variable ] [A] [line 24]
!84 = !{!"0x101\00C4\0083886105\000", !76, !26, !62} ; [ DW_TAG_arg_variable ] [C4] [line 25]
!85 = !{!"0x100\00i\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 27]
!86 = !{!"0x100\00j\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 27]
!87 = !{!"0x100\00k\0027\000", !76, !26, !29}     ; [ DW_TAG_auto_variable ] [k] [line 27]
!88 = !{i32 2, !"Dwarf Version", i32 4}
!89 = !{i32 2, !"Debug Info Version", i32 2}
!90 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!91 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!92 = !MDLocation(line: 83, column: 14, scope: !25)
!93 = !MDLocation(line: 83, column: 27, scope: !25)
!94 = !MDLocation(line: 86, column: 7, scope: !25)
!95 = !MDLocation(line: 87, column: 7, scope: !25)
!96 = !MDLocation(line: 88, column: 7, scope: !25)
!97 = !MDLocation(line: 91, column: 3, scope: !25)
!98 = !MDLocation(line: 92, column: 3, scope: !25)
!99 = !MDLocation(line: 93, column: 3, scope: !25)
!100 = !MDLocation(line: 97, column: 8, scope: !25)
!101 = !{!"0x101\00nr\0016777239\000", !76, !26, !29, !102} ; [ DW_TAG_arg_variable ] [nr] [line 23]
!102 = !MDLocation(line: 96, column: 3, scope: !25)
!103 = !MDLocation(line: 23, column: 21, scope: !76, inlinedAt: !102)
!104 = !{!"0x101\00nq\0033554455\000", !76, !26, !29, !102} ; [ DW_TAG_arg_variable ] [nq] [line 23]
!105 = !MDLocation(line: 23, column: 29, scope: !76, inlinedAt: !102)
!106 = !{!"0x101\00np\0050331671\000", !76, !26, !29, !102} ; [ DW_TAG_arg_variable ] [np] [line 23]
!107 = !MDLocation(line: 23, column: 37, scope: !76, inlinedAt: !102)
!108 = !{!"0x100\00i\0027\000", !76, !26, !29, !102} ; [ DW_TAG_auto_variable ] [i] [line 27]
!109 = !MDLocation(line: 27, column: 7, scope: !76, inlinedAt: !102)
!110 = !MDLocation(line: 29, column: 3, scope: !111, inlinedAt: !102)
!111 = !{!"0xb\0029\003\0028", !1, !76}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!112 = !MDLocation(line: 32, column: 16, scope: !113, inlinedAt: !102)
!113 = !{!"0xb\0031\007\0033", !1, !114}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!114 = !{!"0xb\0031\007\0032", !1, !115}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!115 = !{!"0xb\0030\005\0031", !1, !116}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!116 = !{!"0xb\0030\005\0030", !1, !117}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!117 = !{!"0xb\0029\003\0029", !1, !111}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!118 = !MDLocation(line: 30, column: 5, scope: !116, inlinedAt: !102)
!119 = !MDLocation(line: 32, column: 30, scope: !113, inlinedAt: !102)
!120 = !MDLocation(line: 32, column: 34, scope: !113, inlinedAt: !102)
!121 = !MDLocation(line: 32, column: 15, scope: !113, inlinedAt: !102)
!122 = !MDLocation(line: 32, column: 2, scope: !113, inlinedAt: !102)
!123 = !{!124, !124, i64 0}
!124 = !{!"double", !125, i64 0}
!125 = !{!"omnipotent char", !126, i64 0}
!126 = !{!"Simple C/C++ TBAA"}
!127 = distinct !{!127, !128, !129}
!128 = !{!"llvm.loop.vectorize.width", i32 1}
!129 = !{!"llvm.loop.interleave.count", i32 1}
!130 = !MDLocation(line: 98, column: 8, scope: !25)
!131 = !MDLocation(line: 35, column: 19, scope: !132, inlinedAt: !102)
!132 = !{!"0xb\0034\005\0037", !1, !133}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!133 = !{!"0xb\0034\005\0036", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!134 = !{!"0xb\0033\003\0035", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!135 = !{!"0xb\0033\003\0034", !1, !76}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!136 = !MDLocation(line: 35, column: 33, scope: !132, inlinedAt: !102)
!137 = !MDLocation(line: 35, column: 18, scope: !132, inlinedAt: !102)
!138 = !MDLocation(line: 35, column: 7, scope: !132, inlinedAt: !102)
!139 = distinct !{!139, !128, !129}
!140 = !MDLocation(line: 33, column: 3, scope: !135, inlinedAt: !102)
!141 = !MDLocation(line: 107, column: 5, scope: !25)
!142 = !{!"0x101\00nr\0016777276\000", !59, !26, !29, !143} ; [ DW_TAG_arg_variable ] [nr] [line 60]
!143 = !MDLocation(line: 104, column: 3, scope: !25)
!144 = !MDLocation(line: 60, column: 25, scope: !59, inlinedAt: !143)
!145 = !{!"0x101\00nq\0033554492\000", !59, !26, !29, !143} ; [ DW_TAG_arg_variable ] [nq] [line 60]
!146 = !MDLocation(line: 60, column: 33, scope: !59, inlinedAt: !143)
!147 = !{!"0x101\00np\0050331708\000", !59, !26, !29, !143} ; [ DW_TAG_arg_variable ] [np] [line 60]
!148 = !MDLocation(line: 60, column: 41, scope: !59, inlinedAt: !143)
!149 = !{!"0x100\00r\0065\000", !59, !26, !29, !143} ; [ DW_TAG_auto_variable ] [r] [line 65]
!150 = !MDLocation(line: 65, column: 7, scope: !59, inlinedAt: !143)
!151 = !MDLocation(line: 68, column: 3, scope: !152, inlinedAt: !143)
!152 = !{!"0xb\0068\003\0016", !1, !59}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!153 = !MDLocation(line: 69, column: 5, scope: !154, inlinedAt: !143)
!154 = !{!"0xb\0069\005\0018", !1, !155}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!155 = !{!"0xb\0068\003\0017", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!156 = !MDLocation(line: 70, column: 7, scope: !157, inlinedAt: !143)
!157 = !{!"0xb\0070\007\0021", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!158 = !{!"0xb\0069\0031\0020", !1, !159}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!159 = !{!"0xb\0069\005\0019", !1, !154}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!160 = !MDLocation(line: 71, column: 2, scope: !161, inlinedAt: !143)
!161 = !{!"0xb\0070\0033\0023", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!162 = !{!"0xb\0070\007\0022", !1, !157}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!163 = !{!"0x100\00s\0065\000", !59, !26, !29, !143} ; [ DW_TAG_auto_variable ] [s] [line 65]
!164 = !MDLocation(line: 65, column: 16, scope: !59, inlinedAt: !143)
!165 = !MDLocation(line: 72, column: 2, scope: !166, inlinedAt: !143)
!166 = !{!"0xb\0072\002\0024", !1, !161}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!167 = !MDLocation(line: 73, column: 19, scope: !168, inlinedAt: !143)
!168 = !{!"0xb\0072\002\0025", !1, !166}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!169 = !MDLocation(line: 73, column: 34, scope: !168, inlinedAt: !143)
!170 = !MDLocation(line: 73, column: 47, scope: !168, inlinedAt: !143)
!171 = !MDLocation(line: 73, column: 4, scope: !168, inlinedAt: !143)
!172 = !MDLocation(line: 76, column: 15, scope: !173, inlinedAt: !143)
!173 = !{!"0xb\0075\007\0027", !1, !174}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!174 = !{!"0xb\0075\007\0026", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!175 = !MDLocation(line: 76, column: 2, scope: !173, inlinedAt: !143)
!176 = distinct !{!176, !128, !129}
!177 = !MDLocation(line: 75, column: 7, scope: !174, inlinedAt: !143)
!178 = distinct !{!178, !179}
!179 = !{!"llvm.loop.unroll.disable"}
!180 = distinct !{!180, !128, !129}
!181 = !MDLocation(line: 115, column: 3, scope: !43)
!182 = !MDLocation(line: 115, column: 3, scope: !25)
!183 = !MDLocation(line: 115, column: 3, scope: !42)
!184 = !MDLocation(line: 115, column: 3, scope: !46)
!185 = !MDLocation(line: 115, column: 3, scope: !186)
!186 = !{!"0xb\004", !1, !46}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!187 = !{!188, !188, i64 0}
!188 = !{!"any pointer", !125, i64 0}
!189 = !{!125, !125, i64 0}
!190 = !MDLocation(line: 51, column: 6, scope: !191, inlinedAt: !199)
!191 = !{!"0xb\0051\006\0015", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!192 = !{!"0xb\0049\0032\0014", !1, !193}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!193 = !{!"0xb\0049\007\0013", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!194 = !{!"0xb\0049\007\0012", !1, !195}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!195 = !{!"0xb\0048\005\0011", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!196 = !{!"0xb\0048\005\0010", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!197 = !{!"0xb\0047\003\009", !1, !198}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!198 = !{!"0xb\0047\003\008", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!199 = !MDLocation(line: 115, column: 3, scope: !200)
!200 = !{!"0xb\0023", !1, !43}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!201 = !MDLocation(line: 48, column: 5, scope: !196, inlinedAt: !199)
!202 = !MDLocation(line: 49, column: 7, scope: !194, inlinedAt: !199)
!203 = !MDLocation(line: 50, column: 11, scope: !192, inlinedAt: !199)
!204 = !MDLocation(line: 50, column: 41, scope: !192, inlinedAt: !199)
!205 = !MDLocation(line: 50, column: 2, scope: !192, inlinedAt: !199)
!206 = !MDLocation(line: 51, column: 6, scope: !192, inlinedAt: !199)
!207 = !MDLocation(line: 51, column: 28, scope: !208, inlinedAt: !199)
!208 = !{!"0xb\001", !1, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/linear-algebra/kernels/doitgen/doitgen.c]
!209 = !MDLocation(line: 51, column: 19, scope: !191, inlinedAt: !199)
!210 = !MDLocation(line: 47, column: 3, scope: !198, inlinedAt: !199)
!211 = !MDLocation(line: 53, column: 12, scope: !48, inlinedAt: !199)
!212 = !MDLocation(line: 53, column: 3, scope: !48, inlinedAt: !199)
!213 = !MDLocation(line: 118, column: 3, scope: !25)
!214 = !MDLocation(line: 119, column: 3, scope: !25)
!215 = !MDLocation(line: 120, column: 3, scope: !25)
!216 = !MDLocation(line: 122, column: 3, scope: !25)
