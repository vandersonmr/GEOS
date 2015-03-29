; ModuleID = 'correlation.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !33, metadata !87), !dbg !88
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !34, metadata !87), !dbg !89
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !35, metadata !87), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !36, metadata !87), !dbg !91
  %call = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !92
  %call1 = tail call i8* @polybench_alloc_data(i32 1000000, i32 8) #4, !dbg !93
  %call2 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !94
  %call3 = tail call i8* @polybench_alloc_data(i32 1000, i32 8) #4, !dbg !95
  %arraydecay = bitcast i8* %call to [1000 x double]*, !dbg !96
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !97, metadata !87), !dbg !99
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !100, metadata !87), !dbg !101
  tail call void @llvm.dbg.value(metadata double 1.200000e+00, i64 0, metadata !37, metadata !87), !dbg !102
  tail call void @llvm.dbg.value(metadata double 1.200000e+00, i64 0, metadata !37, metadata !87), !dbg !102
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !103, metadata !87), !dbg !104
  br label %for.cond1.preheader.i, !dbg !105

for.cond1.preheader.i:                            ; preds = %for.inc7.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc7.i ], !dbg !98
  %0 = trunc i64 %indvars.iv3.i to i32, !dbg !107
  %conv.i = sitofp i32 %0 to double, !dbg !107
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ], !dbg !98
  %induction85111 = or i64 %index, 1, !dbg !98
  %1 = trunc i64 %index to i32, !dbg !111
  %induction87112 = or i32 %1, 1, !dbg !111
  %2 = sitofp i32 %1 to double, !dbg !111
  %3 = sitofp i32 %induction87112 to double, !dbg !111
  %4 = fmul double %conv.i, %2, !dbg !107
  %5 = fmul double %conv.i, %3, !dbg !107
  %6 = fdiv double %4, 1.000000e+03, !dbg !112
  %7 = fdiv double %5, 1.000000e+03, !dbg !112
  %8 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index, !dbg !113
  %9 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction85111, !dbg !113
  store double %6, double* %8, align 8, !dbg !113, !tbaa !114
  store double %7, double* %9, align 8, !dbg !113, !tbaa !114
  %index.next = add nuw nsw i64 %index, 2, !dbg !98
  %induction85111.1 = or i64 %index.next, 1, !dbg !98
  %10 = trunc i64 %index.next to i32, !dbg !111
  %induction87112.1 = or i32 %10, 1, !dbg !111
  %11 = sitofp i32 %10 to double, !dbg !111
  %12 = sitofp i32 %induction87112.1 to double, !dbg !111
  %13 = fmul double %conv.i, %11, !dbg !107
  %14 = fmul double %conv.i, %12, !dbg !107
  %15 = fdiv double %13, 1.000000e+03, !dbg !112
  %16 = fdiv double %14, 1.000000e+03, !dbg !112
  %17 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %index.next, !dbg !113
  %18 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv3.i, i64 %induction85111.1, !dbg !113
  store double %15, double* %17, align 8, !dbg !113, !tbaa !114
  store double %16, double* %18, align 8, !dbg !113, !tbaa !114
  %index.next.1 = add nuw nsw i64 %index.next, 2, !dbg !98
  %19 = icmp eq i64 %index.next.1, 1000, !dbg !98
  br i1 %19, label %for.inc7.i, label %vector.body, !dbg !98, !llvm.loop !118

for.inc7.i:                                       ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !105
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1000, !dbg !105
  br i1 %exitcond5.i, label %init_array.exit, label %for.cond1.preheader.i, !dbg !105

init_array.exit:                                  ; preds = %for.inc7.i
  %arraydecay6 = bitcast i8* %call2 to double*, !dbg !121
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !122, metadata !87) #4, !dbg !124
  tail call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !125, metadata !87) #4, !dbg !126
  tail call void @llvm.dbg.value(metadata double 0x3FB99999A0000000, i64 0, metadata !127, metadata !87) #4, !dbg !128
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !129, metadata !87) #4, !dbg !130
  br label %for.body.i, !dbg !131

for.body.i:                                       ; preds = %for.end.i, %init_array.exit
  %indvars.iv36.i = phi i64 [ 0, %init_array.exit ], [ %indvars.iv.next37.i, %for.end.i ], !dbg !123
  %arrayidx.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv36.i, !dbg !133
  store double 0.000000e+00, double* %arrayidx.i, align 8, !dbg !133, !tbaa !114
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !87) #4, !dbg !137
  br label %for.body3.i78, !dbg !138

for.body3.i78:                                    ; preds = %for.body3.i78, %for.body.i
  %20 = phi double [ 0.000000e+00, %for.body.i ], [ %add.i.4, %for.body3.i78 ], !dbg !140
  %indvars.iv33.i = phi i64 [ 0, %for.body.i ], [ %indvars.iv.next34.i.4, %for.body3.i78 ], !dbg !123
  %arrayidx7.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv33.i, i64 %indvars.iv36.i, !dbg !140
  %21 = load double* %arrayidx7.i, align 8, !dbg !140, !tbaa !114
  %add.i = fadd double %20, %21, !dbg !142
  store double %add.i, double* %arrayidx.i, align 8, !dbg !142, !tbaa !114
  %indvars.iv.next34.i = add nuw nsw i64 %indvars.iv33.i, 1, !dbg !138
  %arrayidx7.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next34.i, i64 %indvars.iv36.i, !dbg !140
  %22 = load double* %arrayidx7.i.1, align 8, !dbg !140, !tbaa !114
  %add.i.1 = fadd double %add.i, %22, !dbg !142
  store double %add.i.1, double* %arrayidx.i, align 8, !dbg !142, !tbaa !114
  %indvars.iv.next34.i.1 = add nuw nsw i64 %indvars.iv.next34.i, 1, !dbg !138
  %arrayidx7.i.2 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next34.i.1, i64 %indvars.iv36.i, !dbg !140
  %23 = load double* %arrayidx7.i.2, align 8, !dbg !140, !tbaa !114
  %add.i.2 = fadd double %add.i.1, %23, !dbg !142
  store double %add.i.2, double* %arrayidx.i, align 8, !dbg !142, !tbaa !114
  %indvars.iv.next34.i.2 = add nuw nsw i64 %indvars.iv.next34.i.1, 1, !dbg !138
  %arrayidx7.i.3 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next34.i.2, i64 %indvars.iv36.i, !dbg !140
  %24 = load double* %arrayidx7.i.3, align 8, !dbg !140, !tbaa !114
  %add.i.3 = fadd double %add.i.2, %24, !dbg !142
  store double %add.i.3, double* %arrayidx.i, align 8, !dbg !142, !tbaa !114
  %indvars.iv.next34.i.3 = add nuw nsw i64 %indvars.iv.next34.i.2, 1, !dbg !138
  %arrayidx7.i.4 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next34.i.3, i64 %indvars.iv36.i, !dbg !140
  %25 = load double* %arrayidx7.i.4, align 8, !dbg !140, !tbaa !114
  %add.i.4 = fadd double %add.i.3, %25, !dbg !142
  store double %add.i.4, double* %arrayidx.i, align 8, !dbg !142, !tbaa !114
  %indvars.iv.next34.i.4 = add nuw nsw i64 %indvars.iv.next34.i.3, 1, !dbg !138
  %exitcond35.i.4 = icmp eq i64 %indvars.iv.next34.i.4, 1000, !dbg !138
  br i1 %exitcond35.i.4, label %for.end.i, label %for.body3.i78, !dbg !138

for.end.i:                                        ; preds = %for.body3.i78
  %add.i.lcssa = phi double [ %add.i.4, %for.body3.i78 ]
  %div.i79 = fdiv double %add.i.lcssa, 1.200000e+00, !dbg !143
  store double %div.i79, double* %arrayidx.i, align 8, !dbg !143, !tbaa !114
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1, !dbg !131
  %exitcond38.i = icmp eq i64 %indvars.iv.next37.i, 1000, !dbg !131
  br i1 %exitcond38.i, label %for.body17.i.preheader, label %for.body.i, !dbg !131

for.body17.i.preheader:                           ; preds = %for.end.i
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*, !dbg !144
  %arraydecay7 = bitcast i8* %call3 to double*, !dbg !145
  br label %for.body17.i, !dbg !146

for.body17.i:                                     ; preds = %for.body17.i.preheader, %for.end41.i
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %for.end41.i ], [ 0, %for.body17.i.preheader ], !dbg !123
  %arrayidx19.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv29.i, !dbg !146
  store double 0.000000e+00, double* %arrayidx19.i, align 8, !dbg !146, !tbaa !114
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !87) #4, !dbg !137
  %arrayidx28.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv29.i, !dbg !150
  br label %for.body22.i, !dbg !153

for.body22.i:                                     ; preds = %for.body22.i, %for.body17.i
  %26 = phi double [ 0.000000e+00, %for.body17.i ], [ %add38.i.1, %for.body22.i ], !dbg !154
  %indvars.iv26.i = phi i64 [ 0, %for.body17.i ], [ %indvars.iv.next27.i.1, %for.body22.i ], !dbg !123
  %arrayidx26.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv26.i, i64 %indvars.iv29.i, !dbg !154
  %27 = load double* %arrayidx26.i, align 8, !dbg !154, !tbaa !114
  %28 = load double* %arrayidx28.i, align 8, !dbg !150, !tbaa !114
  %sub.i = fsub double %27, %28, !dbg !154
  %mul.i80 = fmul double %sub.i, %sub.i, !dbg !155
  %add38.i = fadd double %26, %mul.i80, !dbg !156
  store double %add38.i, double* %arrayidx19.i, align 8, !dbg !156, !tbaa !114
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1, !dbg !153
  %arrayidx26.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next27.i, i64 %indvars.iv29.i, !dbg !154
  %29 = load double* %arrayidx26.i.1, align 8, !dbg !154, !tbaa !114
  %30 = load double* %arrayidx28.i, align 8, !dbg !150, !tbaa !114
  %sub.i.1 = fsub double %29, %30, !dbg !154
  %mul.i80.1 = fmul double %sub.i.1, %sub.i.1, !dbg !155
  %add38.i.1 = fadd double %add38.i, %mul.i80.1, !dbg !156
  store double %add38.i.1, double* %arrayidx19.i, align 8, !dbg !156, !tbaa !114
  %indvars.iv.next27.i.1 = add nuw nsw i64 %indvars.iv.next27.i, 1, !dbg !153
  %exitcond28.i.1 = icmp eq i64 %indvars.iv.next27.i.1, 1000, !dbg !153
  br i1 %exitcond28.i.1, label %for.end41.i, label %for.body22.i, !dbg !153

for.end41.i:                                      ; preds = %for.body22.i
  %add38.i.lcssa = phi double [ %add38.i.1, %for.body22.i ]
  %div44.i = fdiv double %add38.i.lcssa, 1.200000e+00, !dbg !157
  store double %div44.i, double* %arrayidx19.i, align 8, !dbg !157, !tbaa !114
  %call.i81 = tail call double @sqrt(double %div44.i) #4, !dbg !158
  %cmp51.i = fcmp ugt double %call.i81, 0x3FB99999A0000000, !dbg !159
  %cond.i = select i1 %cmp51.i, double %call.i81, double 1.000000e+00, !dbg !159
  store double %cond.i, double* %arrayidx19.i, align 8, !dbg !160, !tbaa !114
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1, !dbg !161
  %exitcond31.i = icmp eq i64 %indvars.iv.next30.i, 1000, !dbg !161
  br i1 %exitcond31.i, label %for.cond62.preheader.i.preheader, label %for.body17.i, !dbg !161

for.cond62.preheader.i.preheader:                 ; preds = %for.end41.i
  %scevgep97 = getelementptr i8* %call2, i64 7992
  %scevgep98 = getelementptr i8* %call3, i64 7992
  br label %for.cond62.preheader.i, !dbg !162

for.cond62.preheader.i:                           ; preds = %for.cond62.preheader.i.preheader, %for.inc84.i
  %indvars.iv23.i = phi i64 [ %indvars.iv.next24.i, %for.inc84.i ], [ 0, %for.cond62.preheader.i.preheader ], !dbg !123
  %31 = mul i64 %indvars.iv23.i, 8000
  %scevgep = getelementptr i8* %call, i64 %31
  %32 = add i64 %31, 7992
  %scevgep96 = getelementptr i8* %call, i64 %32
  %bound0 = icmp ule i8* %scevgep, %scevgep97
  %bound1 = icmp ule i8* %call2, %scevgep96
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ule i8* %scevgep, %scevgep98
  %bound1100 = icmp ule i8* %call3, %scevgep96
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  br i1 %conflict.rdx, label %middle.block92, label %vector.body91.preheader

vector.body91.preheader:                          ; preds = %for.cond62.preheader.i
  br label %vector.body91, !dbg !166

vector.body91:                                    ; preds = %vector.body91, %vector.body91.preheader
  %index94 = phi i64 [ 0, %vector.body91.preheader ], [ %index.next107.1, %vector.body91 ], !dbg !123
  %33 = getelementptr inbounds double* %arraydecay6, i64 %index94, !dbg !166
  %34 = bitcast double* %33 to <2 x double>*, !dbg !166
  %wide.load = load <2 x double>* %34, align 8, !dbg !166, !tbaa !114
  %35 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %index94, !dbg !169
  %36 = bitcast double* %35 to <2 x double>*, !dbg !169
  %wide.load109 = load <2 x double>* %36, align 8, !dbg !169, !tbaa !114
  %37 = fsub <2 x double> %wide.load109, %wide.load, !dbg !169
  %38 = bitcast double* %35 to <2 x double>*, !dbg !169
  store <2 x double> %37, <2 x double>* %38, align 8, !dbg !169, !tbaa !114
  %39 = getelementptr inbounds double* %arraydecay7, i64 %index94, !dbg !170
  %40 = bitcast double* %39 to <2 x double>*, !dbg !170
  %wide.load110 = load <2 x double>* %40, align 8, !dbg !170, !tbaa !114
  %41 = fmul <2 x double> %wide.load110, <double 0x3FF186F174F88472, double 0x3FF186F174F88472>, !dbg !171
  %42 = fdiv <2 x double> %37, %41, !dbg !172
  %43 = bitcast double* %35 to <2 x double>*, !dbg !172
  store <2 x double> %42, <2 x double>* %43, align 8, !dbg !172, !tbaa !114
  %index.next107 = add nuw nsw i64 %index94, 2, !dbg !123
  %44 = getelementptr inbounds double* %arraydecay6, i64 %index.next107, !dbg !166
  %45 = bitcast double* %44 to <2 x double>*, !dbg !166
  %wide.load.1 = load <2 x double>* %45, align 8, !dbg !166, !tbaa !114
  %46 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %index.next107, !dbg !169
  %47 = bitcast double* %46 to <2 x double>*, !dbg !169
  %wide.load109.1 = load <2 x double>* %47, align 8, !dbg !169, !tbaa !114
  %48 = fsub <2 x double> %wide.load109.1, %wide.load.1, !dbg !169
  %49 = bitcast double* %46 to <2 x double>*, !dbg !169
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !169, !tbaa !114
  %50 = getelementptr inbounds double* %arraydecay7, i64 %index.next107, !dbg !170
  %51 = bitcast double* %50 to <2 x double>*, !dbg !170
  %wide.load110.1 = load <2 x double>* %51, align 8, !dbg !170, !tbaa !114
  %52 = fmul <2 x double> %wide.load110.1, <double 0x3FF186F174F88472, double 0x3FF186F174F88472>, !dbg !171
  %53 = fdiv <2 x double> %48, %52, !dbg !172
  %54 = bitcast double* %46 to <2 x double>*, !dbg !172
  store <2 x double> %53, <2 x double>* %54, align 8, !dbg !172, !tbaa !114
  %index.next107.1 = add nuw nsw i64 %index.next107, 2, !dbg !123
  %55 = icmp eq i64 %index.next107.1, 1000, !dbg !123
  br i1 %55, label %middle.block92.loopexit, label %vector.body91, !dbg !123, !llvm.loop !173

middle.block92.loopexit:                          ; preds = %vector.body91
  br label %middle.block92

middle.block92:                                   ; preds = %middle.block92.loopexit, %for.cond62.preheader.i
  %resume.val102 = phi i1 [ false, %for.cond62.preheader.i ], [ true, %middle.block92.loopexit ]
  %trunc.resume.val103 = phi i64 [ 0, %for.cond62.preheader.i ], [ 1000, %middle.block92.loopexit ]
  br i1 %resume.val102, label %for.inc84.i, label %for.body64.i.preheader

for.body64.i.preheader:                           ; preds = %middle.block92
  %56 = sub i64 1000, %trunc.resume.val103
  %xtraiter = and i64 %56, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %56, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body64.i.prol.preheader, label %for.body64.i.preheader.split

for.body64.i.prol.preheader:                      ; preds = %for.body64.i.preheader
  br label %for.body64.i.prol, !dbg !166

for.body64.i.prol:                                ; preds = %for.body64.i.prol.preheader, %for.body64.i.prol
  %indvars.iv20.i.prol = phi i64 [ %indvars.iv.next21.i.prol, %for.body64.i.prol ], [ %trunc.resume.val103, %for.body64.i.prol.preheader ], !dbg !123
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body64.i.prol ], [ %xtraiter, %for.body64.i.prol.preheader ]
  %arrayidx66.i.prol = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv20.i.prol, !dbg !166
  %57 = load double* %arrayidx66.i.prol, align 8, !dbg !166, !tbaa !114
  %arrayidx70.i.prol = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv20.i.prol, !dbg !169
  %58 = load double* %arrayidx70.i.prol, align 8, !dbg !169, !tbaa !114
  %sub71.i.prol = fsub double %58, %57, !dbg !169
  store double %sub71.i.prol, double* %arrayidx70.i.prol, align 8, !dbg !169, !tbaa !114
  %arrayidx74.i.prol = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv20.i.prol, !dbg !170
  %59 = load double* %arrayidx74.i.prol, align 8, !dbg !170, !tbaa !114
  %mul75.i.prol = fmul double %59, 0x3FF186F174F88472, !dbg !171
  %div80.i.prol = fdiv double %sub71.i.prol, %mul75.i.prol, !dbg !172
  store double %div80.i.prol, double* %arrayidx70.i.prol, align 8, !dbg !172, !tbaa !114
  %indvars.iv.next21.i.prol = add nuw nsw i64 %indvars.iv20.i.prol, 1, !dbg !162
  %exitcond22.i.prol = icmp eq i64 %indvars.iv.next21.i.prol, 1000, !dbg !162
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !162
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !162
  br i1 %prol.iter.cmp, label %for.body64.i.prol, label %for.body64.i.preheader.split.loopexit, !llvm.loop !174

for.body64.i.preheader.split.loopexit:            ; preds = %for.body64.i.prol
  %indvars.iv20.i.unr.ph = phi i64 [ %indvars.iv.next21.i.prol, %for.body64.i.prol ]
  br label %for.body64.i.preheader.split

for.body64.i.preheader.split:                     ; preds = %for.body64.i.preheader.split.loopexit, %for.body64.i.preheader
  %indvars.iv20.i.unr = phi i64 [ %trunc.resume.val103, %for.body64.i.preheader ], [ %indvars.iv20.i.unr.ph, %for.body64.i.preheader.split.loopexit ]
  %60 = icmp ult i64 %56, 2
  br i1 %60, label %for.inc84.i.loopexit, label %for.body64.i.preheader.split.split

for.body64.i.preheader.split.split:               ; preds = %for.body64.i.preheader.split
  br label %for.body64.i, !dbg !166

for.body64.i:                                     ; preds = %for.body64.i, %for.body64.i.preheader.split.split
  %indvars.iv20.i = phi i64 [ %indvars.iv20.i.unr, %for.body64.i.preheader.split.split ], [ %indvars.iv.next21.i.1, %for.body64.i ], !dbg !123
  %arrayidx66.i = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv20.i, !dbg !166
  %61 = load double* %arrayidx66.i, align 8, !dbg !166, !tbaa !114
  %arrayidx70.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv20.i, !dbg !169
  %62 = load double* %arrayidx70.i, align 8, !dbg !169, !tbaa !114
  %sub71.i = fsub double %62, %61, !dbg !169
  store double %sub71.i, double* %arrayidx70.i, align 8, !dbg !169, !tbaa !114
  %arrayidx74.i = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv20.i, !dbg !170
  %63 = load double* %arrayidx74.i, align 8, !dbg !170, !tbaa !114
  %mul75.i = fmul double %63, 0x3FF186F174F88472, !dbg !171
  %div80.i = fdiv double %sub71.i, %mul75.i, !dbg !172
  store double %div80.i, double* %arrayidx70.i, align 8, !dbg !172, !tbaa !114
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !162
  %arrayidx66.i.1 = getelementptr inbounds double* %arraydecay6, i64 %indvars.iv.next21.i, !dbg !166
  %64 = load double* %arrayidx66.i.1, align 8, !dbg !166, !tbaa !114
  %arrayidx70.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv23.i, i64 %indvars.iv.next21.i, !dbg !169
  %65 = load double* %arrayidx70.i.1, align 8, !dbg !169, !tbaa !114
  %sub71.i.1 = fsub double %65, %64, !dbg !169
  store double %sub71.i.1, double* %arrayidx70.i.1, align 8, !dbg !169, !tbaa !114
  %arrayidx74.i.1 = getelementptr inbounds double* %arraydecay7, i64 %indvars.iv.next21.i, !dbg !170
  %66 = load double* %arrayidx74.i.1, align 8, !dbg !170, !tbaa !114
  %mul75.i.1 = fmul double %66, 0x3FF186F174F88472, !dbg !171
  %div80.i.1 = fdiv double %sub71.i.1, %mul75.i.1, !dbg !172
  store double %div80.i.1, double* %arrayidx70.i.1, align 8, !dbg !172, !tbaa !114
  %indvars.iv.next21.i.1 = add nuw nsw i64 %indvars.iv.next21.i, 1, !dbg !162
  %exitcond22.i.1 = icmp eq i64 %indvars.iv.next21.i.1, 1000, !dbg !162
  br i1 %exitcond22.i.1, label %for.inc84.i.loopexit.unr-lcssa, label %for.body64.i, !dbg !162, !llvm.loop !176

for.inc84.i.loopexit.unr-lcssa:                   ; preds = %for.body64.i
  br label %for.inc84.i.loopexit

for.inc84.i.loopexit:                             ; preds = %for.body64.i.preheader.split, %for.inc84.i.loopexit.unr-lcssa
  br label %for.inc84.i

for.inc84.i:                                      ; preds = %for.inc84.i.loopexit, %middle.block92
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1, !dbg !177
  %exitcond25.i = icmp eq i64 %indvars.iv.next24.i, 1000, !dbg !177
  br i1 %exitcond25.i, label %for.body98.lr.ph.i.preheader, label %for.cond62.preheader.i, !dbg !177

for.body98.lr.ph.i.preheader:                     ; preds = %for.inc84.i
  br label %for.body98.lr.ph.i, !dbg !178

for.cond87.loopexit.i:                            ; preds = %for.end122.i
  %indvars.iv.next18.i = add nuw nsw i64 %indvars.iv17.i, 1, !dbg !182
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !182
  %exitcond19.i = icmp eq i64 %indvars.iv.next18.i, 999, !dbg !182
  br i1 %exitcond19.i, label %kernel_correlation.exit, label %for.body98.lr.ph.i, !dbg !182

for.body98.lr.ph.i:                               ; preds = %for.body98.lr.ph.i.preheader, %for.cond87.loopexit.i
  %indvars.iv17.i = phi i64 [ %indvars.iv.next18.i, %for.cond87.loopexit.i ], [ 0, %for.body98.lr.ph.i.preheader ], !dbg !123
  %indvars.iv11.i = phi i64 [ %indvars.iv.next12.i, %for.cond87.loopexit.i ], [ 1, %for.body98.lr.ph.i.preheader ], !dbg !123
  %arrayidx94.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv17.i, i64 %indvars.iv17.i, !dbg !178
  store double 1.000000e+00, double* %arrayidx94.i, align 8, !dbg !178, !tbaa !114
  br label %for.body98.i, !dbg !183

for.body98.i:                                     ; preds = %for.end122.i, %for.body98.lr.ph.i
  %indvars.iv13.i = phi i64 [ %indvars.iv11.i, %for.body98.lr.ph.i ], [ %indvars.iv.next14.i, %for.end122.i ], !dbg !123
  %arrayidx102.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv17.i, i64 %indvars.iv13.i, !dbg !185
  store double 0.000000e+00, double* %arrayidx102.i, align 8, !dbg !185, !tbaa !114
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !136, metadata !87) #4, !dbg !137
  br label %for.body105.i, !dbg !188

for.body105.i:                                    ; preds = %for.body105.i, %for.body98.i
  %67 = phi double [ 0.000000e+00, %for.body98.i ], [ %add119.i.1, %for.body105.i ], !dbg !190
  %indvars.iv.i82 = phi i64 [ 0, %for.body98.i ], [ %indvars.iv.next.i83.1, %for.body105.i ], !dbg !123
  %arrayidx109.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.i82, i64 %indvars.iv17.i, !dbg !190
  %68 = load double* %arrayidx109.i, align 8, !dbg !190, !tbaa !114
  %arrayidx113.i = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.i82, i64 %indvars.iv13.i, !dbg !192
  %69 = load double* %arrayidx113.i, align 8, !dbg !192, !tbaa !114
  %mul114.i = fmul double %68, %69, !dbg !190
  %add119.i = fadd double %67, %mul114.i, !dbg !193
  store double %add119.i, double* %arrayidx102.i, align 8, !dbg !193, !tbaa !114
  %indvars.iv.next.i83 = add nuw nsw i64 %indvars.iv.i82, 1, !dbg !188
  %arrayidx109.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next.i83, i64 %indvars.iv17.i, !dbg !190
  %70 = load double* %arrayidx109.i.1, align 8, !dbg !190, !tbaa !114
  %arrayidx113.i.1 = getelementptr inbounds [1000 x double]* %arraydecay, i64 %indvars.iv.next.i83, i64 %indvars.iv13.i, !dbg !192
  %71 = load double* %arrayidx113.i.1, align 8, !dbg !192, !tbaa !114
  %mul114.i.1 = fmul double %70, %71, !dbg !190
  %add119.i.1 = fadd double %add119.i, %mul114.i.1, !dbg !193
  store double %add119.i.1, double* %arrayidx102.i, align 8, !dbg !193, !tbaa !114
  %indvars.iv.next.i83.1 = add nuw nsw i64 %indvars.iv.next.i83, 1, !dbg !188
  %exitcond.i84.1 = icmp eq i64 %indvars.iv.next.i83.1, 1000, !dbg !188
  br i1 %exitcond.i84.1, label %for.end122.i, label %for.body105.i, !dbg !188

for.end122.i:                                     ; preds = %for.body105.i
  %add119.i.lcssa = phi double [ %add119.i.1, %for.body105.i ]
  %arrayidx130.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv13.i, i64 %indvars.iv17.i, !dbg !194
  store double %add119.i.lcssa, double* %arrayidx130.i, align 8, !dbg !194, !tbaa !114
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !183
  %lftr.wideiv = trunc i64 %indvars.iv.next14.i to i32, !dbg !183
  %exitcond = icmp eq i32 %lftr.wideiv, 1000, !dbg !183
  br i1 %exitcond, label %for.cond87.loopexit.i, label %for.body98.i, !dbg !183

kernel_correlation.exit:                          ; preds = %for.cond87.loopexit.i
  %arrayidx140.i = getelementptr inbounds i8* %call1, i64 8008000, !dbg !195
  %72 = bitcast i8* %arrayidx140.i to double*, !dbg !195
  store double 1.000000e+00, double* %72, align 8, !dbg !195, !tbaa !114
  %cmp = icmp sgt i32 %argc, 42, !dbg !196
  br i1 %cmp, label %if.end44, label %if.end51, !dbg !197

if.end44:                                         ; preds = %kernel_correlation.exit
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !87), !dbg !198
  tail call void @llvm.dbg.value(metadata i8* %73, i64 0, metadata !46, metadata !87), !dbg !199
  %73 = load i8** %argv, align 8, !dbg !200, !tbaa !202
  %74 = load i8* %73, align 1, !dbg !200, !tbaa !204
  %phitmp = icmp eq i8 %74, 0, !dbg !198
  br i1 %phitmp, label %for.cond1.preheader.i73.preheader, label %if.end51, !dbg !197

for.cond1.preheader.i73.preheader:                ; preds = %if.end44
  br label %for.cond1.preheader.i73, !dbg !205

for.cond1.preheader.i73:                          ; preds = %for.cond1.preheader.i73.preheader, %for.inc8.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc8.i ], [ 0, %for.cond1.preheader.i73.preheader ], !dbg !212
  %75 = mul nsw i64 %indvars.iv7.i, 1000, !dbg !205
  br label %for.body3.i75, !dbg !214

for.body3.i75:                                    ; preds = %for.inc.i, %for.cond1.preheader.i73
  %indvars.iv.i74 = phi i64 [ 0, %for.cond1.preheader.i73 ], [ %indvars.iv.next.i76, %for.inc.i ], !dbg !212
  %76 = load %struct._IO_FILE** @stderr, align 8, !dbg !215, !tbaa !202
  %arrayidx5.i = getelementptr inbounds [1000 x double]* %arraydecay5, i64 %indvars.iv7.i, i64 %indvars.iv.i74, !dbg !216
  %77 = load double* %arrayidx5.i, align 8, !dbg !216, !tbaa !114
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), double %77) #5, !dbg !217
  %78 = add nuw nsw i64 %indvars.iv.i74, %75, !dbg !205
  %79 = trunc i64 %78 to i32, !dbg !218
  %rem.i = srem i32 %79, 20, !dbg !218
  %cmp6.i = icmp eq i32 %rem.i, 0, !dbg !218
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i, !dbg !219

if.then.i:                                        ; preds = %for.body3.i75
  %80 = load %struct._IO_FILE** @stderr, align 8, !dbg !220, !tbaa !202
  %fputc3.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %80) #5, !dbg !222
  br label %for.inc.i, !dbg !222

for.inc.i:                                        ; preds = %if.then.i, %for.body3.i75
  %indvars.iv.next.i76 = add nuw nsw i64 %indvars.iv.i74, 1, !dbg !214
  %exitcond.i77 = icmp eq i64 %indvars.iv.next.i76, 1000, !dbg !214
  br i1 %exitcond.i77, label %for.inc8.i, label %for.body3.i75, !dbg !214

for.inc8.i:                                       ; preds = %for.inc.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !223
  %exitcond10.i = icmp eq i64 %indvars.iv.next8.i, 1000, !dbg !223
  br i1 %exitcond10.i, label %print_array.exit, label %for.cond1.preheader.i73, !dbg !223

print_array.exit:                                 ; preds = %for.inc8.i
  %81 = load %struct._IO_FILE** @stderr, align 8, !dbg !224, !tbaa !202
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %81) #5, !dbg !225
  br label %if.end51, !dbg !212

if.end51:                                         ; preds = %if.end44, %print_array.exit, %kernel_correlation.exit
  tail call void @free(i8* %call) #4, !dbg !226
  tail call void @free(i8* %call1) #4, !dbg !227
  tail call void @free(i8* %call2) #4, !dbg !228
  tail call void @free(i8* %call3) #4, !dbg !229
  ret i32 0, !dbg !230
}

declare i8* @polybench_alloc_data(i32, i32) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

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
!llvm.module.flags = !{!84, !85}
!llvm.ident = !{!86}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !24, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c] [DW_LANG_C99]
!1 = !{!"correlation.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation"}
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
!13 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation"}
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
!24 = !{!25, !49, !57, !74}
!25 = !{!"0x2e\00main\00main\00\00122\000\001\000\000\00256\001\00123", !1, !26, !27, null, i32 (i32, i8**)* @main, null, null, !32} ; [ DW_TAG_subprogram ] [line 122] [def] [scope 123] [main]
!26 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !46, !48}
!33 = !{!"0x101\00argc\0016777338\000", !25, !26, !29} ; [ DW_TAG_arg_variable ] [argc] [line 122]
!34 = !{!"0x101\00argv\0033554554\000", !25, !26, !30} ; [ DW_TAG_arg_variable ] [argv] [line 122]
!35 = !{!"0x100\00n\00125\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [n] [line 125]
!36 = !{!"0x100\00m\00126\000", !25, !26, !29}    ; [ DW_TAG_auto_variable ] [m] [line 126]
!37 = !{!"0x100\00float_n\00129\000", !25, !26, !6} ; [ DW_TAG_auto_variable ] [float_n] [line 129]
!38 = !{!"0x100\00data\00130\000", !25, !26, !4}  ; [ DW_TAG_auto_variable ] [data] [line 130]
!39 = !{!"0x100\00symmat\00131\000", !25, !26, !4} ; [ DW_TAG_auto_variable ] [symmat] [line 131]
!40 = !{!"0x100\00mean\00132\000", !25, !26, !9}  ; [ DW_TAG_auto_variable ] [mean] [line 132]
!41 = !{!"0x100\00stddev\00133\000", !25, !26, !9} ; [ DW_TAG_auto_variable ] [stddev] [line 133]
!42 = !{!"0x100\00__s1_len\00154\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s1_len] [line 154]
!43 = !{!"0xb\00154\003\001", !1, !44}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!44 = !{!"0xb\00154\003\000", !1, !25}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!45 = !{!"0x100\00__s2_len\00154\000", !43, !26, !12} ; [ DW_TAG_auto_variable ] [__s2_len] [line 154]
!46 = !{!"0x100\00__s2\00154\000", !47, !26, !17} ; [ DW_TAG_auto_variable ] [__s2] [line 154]
!47 = !{!"0xb\00154\003\002", !1, !43}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!48 = !{!"0x100\00__result\00154\000", !47, !26, !29} ; [ DW_TAG_auto_variable ] [__result] [line 154]
!49 = !{!"0x2e\00print_array\00print_array\00\0041\001\001\000\000\00256\001\0044", !1, !26, !50, null, null, null, null, !52} ; [ DW_TAG_subprogram ] [line 41] [local] [def] [scope 44] [print_array]
!50 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !51, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = !{null, !29, !9}
!52 = !{!53, !54, !55, !56}
!53 = !{!"0x101\00m\0016777257\000", !49, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 41]
!54 = !{!"0x101\00symmat\0033554474\000", !49, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 42]
!55 = !{!"0x100\00i\0045\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 45]
!56 = !{!"0x100\00j\0045\000", !49, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 45]
!57 = !{!"0x2e\00kernel_correlation\00kernel_correlation\00\0059\001\001\000\000\00256\001\0065", !1, !26, !58, null, null, null, null, !61} ; [ DW_TAG_subprogram ] [line 59] [local] [def] [scope 65] [kernel_correlation]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !29, !29, !6, !9, !9, !60, !60}
!60 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!61 = !{!62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!62 = !{!"0x101\00m\0016777275\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 59]
!63 = !{!"0x101\00n\0033554491\000", !57, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 59]
!64 = !{!"0x101\00float_n\0050331708\000", !57, !26, !6} ; [ DW_TAG_arg_variable ] [float_n] [line 60]
!65 = !{!"0x101\00data\0067108925\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 61]
!66 = !{!"0x101\00symmat\0083886142\000", !57, !26, !9} ; [ DW_TAG_arg_variable ] [symmat] [line 62]
!67 = !{!"0x101\00mean\00100663359\000", !57, !26, !60} ; [ DW_TAG_arg_variable ] [mean] [line 63]
!68 = !{!"0x101\00stddev\00117440576\000", !57, !26, !60} ; [ DW_TAG_arg_variable ] [stddev] [line 64]
!69 = !{!"0x100\00i\0066\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 66]
!70 = !{!"0x100\00j\0066\000", !57, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 66]
!71 = !{!"0x100\00j1\0066\000", !57, !26, !29}    ; [ DW_TAG_auto_variable ] [j1] [line 66]
!72 = !{!"0x100\00j2\0066\000", !57, !26, !29}    ; [ DW_TAG_auto_variable ] [j2] [line 66]
!73 = !{!"0x100\00eps\0068\000", !57, !26, !6}    ; [ DW_TAG_auto_variable ] [eps] [line 68]
!74 = !{!"0x2e\00init_array\00init_array\00\0023\001\001\000\000\00256\001\0027", !1, !26, !75, null, null, null, null, !77} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [scope 27] [init_array]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{null, !29, !29, !60, !9}
!77 = !{!78, !79, !80, !81, !82, !83}
!78 = !{!"0x101\00m\0016777239\000", !74, !26, !29} ; [ DW_TAG_arg_variable ] [m] [line 23]
!79 = !{!"0x101\00n\0033554456\000", !74, !26, !29} ; [ DW_TAG_arg_variable ] [n] [line 24]
!80 = !{!"0x101\00float_n\0050331673\000", !74, !26, !60} ; [ DW_TAG_arg_variable ] [float_n] [line 25]
!81 = !{!"0x101\00data\0067108890\000", !74, !26, !9} ; [ DW_TAG_arg_variable ] [data] [line 26]
!82 = !{!"0x100\00i\0028\000", !74, !26, !29}     ; [ DW_TAG_auto_variable ] [i] [line 28]
!83 = !{!"0x100\00j\0028\000", !74, !26, !29}     ; [ DW_TAG_auto_variable ] [j] [line 28]
!84 = !{i32 2, !"Dwarf Version", i32 4}
!85 = !{i32 2, !"Debug Info Version", i32 2}
!86 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!87 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!88 = !MDLocation(line: 122, column: 14, scope: !25)
!89 = !MDLocation(line: 122, column: 27, scope: !25)
!90 = !MDLocation(line: 125, column: 7, scope: !25)
!91 = !MDLocation(line: 126, column: 7, scope: !25)
!92 = !MDLocation(line: 130, column: 3, scope: !25)
!93 = !MDLocation(line: 131, column: 3, scope: !25)
!94 = !MDLocation(line: 132, column: 3, scope: !25)
!95 = !MDLocation(line: 133, column: 3, scope: !25)
!96 = !MDLocation(line: 136, column: 31, scope: !25)
!97 = !{!"0x101\00m\0016777239\000", !74, !26, !29, !98} ; [ DW_TAG_arg_variable ] [m] [line 23]
!98 = !MDLocation(line: 136, column: 3, scope: !25)
!99 = !MDLocation(line: 23, column: 22, scope: !74, inlinedAt: !98)
!100 = !{!"0x101\00n\0033554456\000", !74, !26, !29, !98} ; [ DW_TAG_arg_variable ] [n] [line 24]
!101 = !MDLocation(line: 24, column: 8, scope: !74, inlinedAt: !98)
!102 = !MDLocation(line: 129, column: 13, scope: !25)
!103 = !{!"0x100\00i\0028\000", !74, !26, !29, !98} ; [ DW_TAG_auto_variable ] [i] [line 28]
!104 = !MDLocation(line: 28, column: 7, scope: !74, inlinedAt: !98)
!105 = !MDLocation(line: 32, column: 3, scope: !106, inlinedAt: !98)
!106 = !{!"0xb\0032\003\0037", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!107 = !MDLocation(line: 34, column: 21, scope: !108, inlinedAt: !98)
!108 = !{!"0xb\0033\005\0040", !1, !109}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!109 = !{!"0xb\0033\005\0039", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!110 = !{!"0xb\0032\003\0038", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!111 = !MDLocation(line: 34, column: 35, scope: !108, inlinedAt: !98)
!112 = !MDLocation(line: 34, column: 20, scope: !108, inlinedAt: !98)
!113 = !MDLocation(line: 34, column: 7, scope: !108, inlinedAt: !98)
!114 = !{!115, !115, i64 0}
!115 = !{!"double", !116, i64 0}
!116 = !{!"omnipotent char", !117, i64 0}
!117 = !{!"Simple C/C++ TBAA"}
!118 = distinct !{!118, !119, !120}
!119 = !{!"llvm.loop.vectorize.width", i32 1}
!120 = !{!"llvm.loop.interleave.count", i32 1}
!121 = !MDLocation(line: 145, column: 9, scope: !25)
!122 = !{!"0x101\00m\0016777275\000", !57, !26, !29, !123} ; [ DW_TAG_arg_variable ] [m] [line 59]
!123 = !MDLocation(line: 142, column: 3, scope: !25)
!124 = !MDLocation(line: 59, column: 29, scope: !57, inlinedAt: !123)
!125 = !{!"0x101\00n\0033554491\000", !57, !26, !29, !123} ; [ DW_TAG_arg_variable ] [n] [line 59]
!126 = !MDLocation(line: 59, column: 36, scope: !57, inlinedAt: !123)
!127 = !{!"0x100\00eps\0068\000", !57, !26, !6, !123} ; [ DW_TAG_auto_variable ] [eps] [line 68]
!128 = !MDLocation(line: 68, column: 13, scope: !57, inlinedAt: !123)
!129 = !{!"0x100\00j\0066\000", !57, !26, !29, !123} ; [ DW_TAG_auto_variable ] [j] [line 66]
!130 = !MDLocation(line: 66, column: 10, scope: !57, inlinedAt: !123)
!131 = !MDLocation(line: 74, column: 3, scope: !132, inlinedAt: !123)
!132 = !{!"0xb\0074\003\0014", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!133 = !MDLocation(line: 76, column: 7, scope: !134, inlinedAt: !123)
!134 = !{!"0xb\0075\005\0016", !1, !135}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!135 = !{!"0xb\0074\003\0015", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!136 = !{!"0x100\00i\0066\000", !57, !26, !29, !123} ; [ DW_TAG_auto_variable ] [i] [line 66]
!137 = !MDLocation(line: 66, column: 7, scope: !57, inlinedAt: !123)
!138 = !MDLocation(line: 77, column: 7, scope: !139, inlinedAt: !123)
!139 = !{!"0xb\0077\007\0017", !1, !134}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!140 = !MDLocation(line: 78, column: 13, scope: !141, inlinedAt: !123)
!141 = !{!"0xb\0077\007\0018", !1, !139}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!142 = !MDLocation(line: 78, column: 2, scope: !141, inlinedAt: !123)
!143 = !MDLocation(line: 79, column: 7, scope: !134, inlinedAt: !123)
!144 = !MDLocation(line: 144, column: 9, scope: !25)
!145 = !MDLocation(line: 146, column: 9, scope: !25)
!146 = !MDLocation(line: 85, column: 7, scope: !147, inlinedAt: !123)
!147 = !{!"0xb\0084\005\0021", !1, !148}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!148 = !{!"0xb\0083\003\0020", !1, !149}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!149 = !{!"0xb\0083\003\0019", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!150 = !MDLocation(line: 87, column: 29, scope: !151, inlinedAt: !123)
!151 = !{!"0xb\0086\007\0023", !1, !152}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!152 = !{!"0xb\0086\007\0022", !1, !147}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!153 = !MDLocation(line: 86, column: 7, scope: !152, inlinedAt: !123)
!154 = !MDLocation(line: 87, column: 16, scope: !151, inlinedAt: !123)
!155 = !MDLocation(line: 87, column: 15, scope: !151, inlinedAt: !123)
!156 = !MDLocation(line: 87, column: 2, scope: !151, inlinedAt: !123)
!157 = !MDLocation(line: 88, column: 7, scope: !147, inlinedAt: !123)
!158 = !MDLocation(line: 89, column: 19, scope: !147, inlinedAt: !123)
!159 = !MDLocation(line: 93, column: 19, scope: !147, inlinedAt: !123)
!160 = !MDLocation(line: 93, column: 7, scope: !147, inlinedAt: !123)
!161 = !MDLocation(line: 83, column: 3, scope: !149, inlinedAt: !123)
!162 = !MDLocation(line: 98, column: 5, scope: !163, inlinedAt: !123)
!163 = !{!"0xb\0098\005\0026", !1, !164}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!164 = !{!"0xb\0097\003\0025", !1, !165}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!165 = !{!"0xb\0097\003\0024", !1, !57}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!166 = !MDLocation(line: 100, column: 16, scope: !167, inlinedAt: !123)
!167 = !{!"0xb\0099\007\0028", !1, !168}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!168 = !{!"0xb\0098\005\0027", !1, !163}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!169 = !MDLocation(line: 100, column: 2, scope: !167, inlinedAt: !123)
!170 = !MDLocation(line: 101, column: 32, scope: !167, inlinedAt: !123)
!171 = !MDLocation(line: 101, column: 16, scope: !167, inlinedAt: !123)
!172 = !MDLocation(line: 101, column: 2, scope: !167, inlinedAt: !123)
!173 = distinct !{!173, !119, !120}
!174 = distinct !{!174, !175}
!175 = !{!"llvm.loop.unroll.disable"}
!176 = distinct !{!176, !119, !120}
!177 = !MDLocation(line: 97, column: 3, scope: !165, inlinedAt: !123)
!178 = !MDLocation(line: 107, column: 7, scope: !179, inlinedAt: !123)
!179 = !{!"0xb\00106\005\0031", !1, !180}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!180 = !{!"0xb\00105\003\0030", !1, !181}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!181 = !{!"0xb\00105\003\0029", !1, !57}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!182 = !MDLocation(line: 105, column: 3, scope: !181, inlinedAt: !123)
!183 = !MDLocation(line: 108, column: 7, scope: !184, inlinedAt: !123)
!184 = !{!"0xb\00108\007\0032", !1, !179}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!185 = !MDLocation(line: 110, column: 4, scope: !186, inlinedAt: !123)
!186 = !{!"0xb\00109\002\0034", !1, !187}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!187 = !{!"0xb\00108\007\0033", !1, !184}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!188 = !MDLocation(line: 111, column: 4, scope: !189, inlinedAt: !123)
!189 = !{!"0xb\00111\004\0035", !1, !186}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!190 = !MDLocation(line: 112, column: 25, scope: !191, inlinedAt: !123)
!191 = !{!"0xb\00111\004\0036", !1, !189}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!192 = !MDLocation(line: 112, column: 39, scope: !191, inlinedAt: !123)
!193 = !MDLocation(line: 112, column: 6, scope: !191, inlinedAt: !123)
!194 = !MDLocation(line: 113, column: 4, scope: !186, inlinedAt: !123)
!195 = !MDLocation(line: 116, column: 3, scope: !57, inlinedAt: !123)
!196 = !MDLocation(line: 154, column: 3, scope: !44)
!197 = !MDLocation(line: 154, column: 3, scope: !25)
!198 = !MDLocation(line: 154, column: 3, scope: !43)
!199 = !MDLocation(line: 154, column: 3, scope: !47)
!200 = !MDLocation(line: 154, column: 3, scope: !201)
!201 = !{!"0xb\004", !1, !47}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!202 = !{!203, !203, i64 0}
!203 = !{!"any pointer", !116, i64 0}
!204 = !{!116, !116, i64 0}
!205 = !MDLocation(line: 50, column: 12, scope: !206, inlinedAt: !212)
!206 = !{!"0xb\0050\0011\0013", !1, !207}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!207 = !{!"0xb\0048\0029\0012", !1, !208}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!208 = !{!"0xb\0048\005\0011", !1, !209}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!209 = !{!"0xb\0048\005\0010", !1, !210}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!210 = !{!"0xb\0047\003\009", !1, !211}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!211 = !{!"0xb\0047\003\008", !1, !49}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!212 = !MDLocation(line: 154, column: 3, scope: !213)
!213 = !{!"0xb\0023", !1, !44}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!214 = !MDLocation(line: 48, column: 5, scope: !209, inlinedAt: !212)
!215 = !MDLocation(line: 49, column: 16, scope: !207, inlinedAt: !212)
!216 = !MDLocation(line: 49, column: 46, scope: !207, inlinedAt: !212)
!217 = !MDLocation(line: 49, column: 7, scope: !207, inlinedAt: !212)
!218 = !MDLocation(line: 50, column: 11, scope: !206, inlinedAt: !212)
!219 = !MDLocation(line: 50, column: 11, scope: !207, inlinedAt: !212)
!220 = !MDLocation(line: 50, column: 43, scope: !221, inlinedAt: !212)
!221 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/polybench/datamining/correlation/correlation.c]
!222 = !MDLocation(line: 50, column: 34, scope: !206, inlinedAt: !212)
!223 = !MDLocation(line: 47, column: 3, scope: !211, inlinedAt: !212)
!224 = !MDLocation(line: 52, column: 12, scope: !49, inlinedAt: !212)
!225 = !MDLocation(line: 52, column: 3, scope: !49, inlinedAt: !212)
!226 = !MDLocation(line: 157, column: 3, scope: !25)
!227 = !MDLocation(line: 158, column: 3, scope: !25)
!228 = !MDLocation(line: 159, column: 3, scope: !25)
!229 = !MDLocation(line: 160, column: 3, scope: !25)
!230 = !MDLocation(line: 162, column: 3, scope: !25)
