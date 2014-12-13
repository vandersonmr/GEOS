; ModuleID = 'lpbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind uwtable
define void @matgen(double** nocapture readonly %a, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !12), !dbg !157
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !13), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !14), !dbg !159
  %b17 = bitcast double* %b to i8*
  %seed.promoted9 = load i64* @seed, align 8, !dbg !161, !tbaa !164
  br label %.preheader3, !dbg !159

.preheader3:                                      ; preds = %18, %0
  %indvars.iv21 = phi i64 [ 0, %0 ], [ %indvars.iv.next22, %18 ]
  %.lcssa10 = phi i64 [ %seed.promoted9, %0 ], [ %14, %18 ]
  br label %1, !dbg !168

.preheader2:                                      ; preds = %18
  store i64 %14, i64* @seed, align 8, !dbg !161, !tbaa !164
  call void @llvm.memset.p0i8.i64(i8* %b17, i8 0, i64 16000, i32 8, i1 false), !dbg !169
  %scevgep = getelementptr double* %b, i64 1999
  br label %.preheader, !dbg !171

; <label>:1                                       ; preds = %1, %.preheader3
  %indvars.iv18 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next19, %1 ]
  %2 = phi i64 [ %.lcssa10, %.preheader3 ], [ %14, %1 ], !dbg !173
  %3 = xor i64 %2, 123459876, !dbg !173
  %4 = sdiv i64 %3, 127773, !dbg !174
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !175), !dbg !174
  %5 = mul i64 %4, -127773, !dbg !176
  %6 = add i64 %5, %3, !dbg !176
  %7 = mul nsw i64 %6, 16807, !dbg !176
  %8 = mul i64 %4, -2836, !dbg !176
  %9 = add i64 %7, %8, !dbg !176
  %10 = icmp slt i64 %9, 0, !dbg !177
  %11 = add nsw i64 %9, 2147483647, !dbg !179
  %..i = select i1 %10, i64 %11, i64 %9, !dbg !177
  %12 = sitofp i64 %..i to double, !dbg !180
  %13 = fmul double %12, 0x3E00000000200FE1, !dbg !180
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !181), !dbg !180
  %14 = xor i64 %..i, 123459876, !dbg !161
  %15 = getelementptr inbounds double** %a, i64 %indvars.iv18, !dbg !162
  %16 = load double** %15, align 8, !dbg !162, !tbaa !182
  %17 = getelementptr inbounds double* %16, i64 %indvars.iv21, !dbg !162
  store double %13, double* %17, align 8, !dbg !162, !tbaa !184
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !168
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000, !dbg !168
  br i1 %exitcond20, label %18, label %1, !dbg !168

; <label>:18                                      ; preds = %1
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !159
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000, !dbg !159
  br i1 %exitcond23, label %.preheader2, label %.preheader3, !dbg !159

.preheader:                                       ; preds = %39, %.preheader2
  %indvars.iv11 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next12, %39 ]
  %19 = getelementptr inbounds double** %a, i64 %indvars.iv11, !dbg !186
  %20 = load double** %19, align 8, !dbg !186, !tbaa !182
  %scevgep25 = getelementptr double* %20, i64 1999
  %bound1 = icmp ule double* %20, %scevgep
  %bound0 = icmp uge double* %scevgep25, %b
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ], !dbg !188
  %21 = getelementptr inbounds double* %20, i64 %index, !dbg !186
  %22 = bitcast double* %21 to <2 x double>*, !dbg !186
  %wide.load = load <2 x double>* %22, align 8, !dbg !186
  %.sum31 = or i64 %index, 2, !dbg !186
  %23 = getelementptr double* %20, i64 %.sum31, !dbg !186
  %24 = bitcast double* %23 to <2 x double>*, !dbg !186
  %wide.load28 = load <2 x double>* %24, align 8, !dbg !186
  %25 = getelementptr inbounds double* %b, i64 %index, !dbg !186
  %26 = bitcast double* %25 to <2 x double>*, !dbg !186
  %wide.load29 = load <2 x double>* %26, align 8, !dbg !186
  %.sum32 = or i64 %index, 2, !dbg !186
  %27 = getelementptr double* %b, i64 %.sum32, !dbg !186
  %28 = bitcast double* %27 to <2 x double>*, !dbg !186
  %wide.load30 = load <2 x double>* %28, align 8, !dbg !186
  %29 = fadd <2 x double> %wide.load, %wide.load29, !dbg !186
  %30 = fadd <2 x double> %wide.load28, %wide.load30, !dbg !186
  %31 = bitcast double* %25 to <2 x double>*, !dbg !186
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !186
  %32 = bitcast double* %27 to <2 x double>*, !dbg !186
  store <2 x double> %30, <2 x double>* %32, align 8, !dbg !186
  %index.next = add i64 %index, 4, !dbg !188
  %33 = icmp eq i64 %index.next, 2000, !dbg !188
  br i1 %33, label %middle.block, label %vector.body, !dbg !188, !llvm.loop !189

middle.block:                                     ; preds = %vector.body, %.preheader
  %resume.val = phi i1 [ false, %.preheader ], [ true, %vector.body ]
  %trunc.resume.val = phi i64 [ 0, %.preheader ], [ 2000, %vector.body ]
  br i1 %resume.val, label %39, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %34 = getelementptr inbounds double* %20, i64 %indvars.iv, !dbg !186
  %35 = load double* %34, align 8, !dbg !186, !tbaa !184
  %36 = getelementptr inbounds double* %b, i64 %indvars.iv, !dbg !186
  %37 = load double* %36, align 8, !dbg !186, !tbaa !184
  %38 = fadd double %35, %37, !dbg !186
  store double %38, double* %36, align 8, !dbg !186, !tbaa !184
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !188
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !188
  br i1 %exitcond, label %39, label %scalar.ph, !dbg !188, !llvm.loop !192

; <label>:39                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !171
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000, !dbg !171
  br i1 %exitcond13, label %40, label %.preheader, !dbg !171

; <label>:40                                      ; preds = %39
  ret void, !dbg !193
}

; Function Attrs: nounwind readonly uwtable
define i32 @idamax(i32 %n, double* nocapture readonly %dx, i32 %dx_off, i32 %incx) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !21), !dbg !194
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !22), !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !23), !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !24), !dbg !194
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !29), !dbg !195
  %1 = icmp slt i32 %n, 1, !dbg !196
  br i1 %1, label %.loopexit, label %2, !dbg !196

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %n, 1, !dbg !198
  br i1 %3, label %.loopexit, label %4, !dbg !198

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !201
  %6 = sext i32 %dx_off to i64, !dbg !204
  %7 = getelementptr inbounds double* %dx, i64 %6, !dbg !204
  %8 = load double* %7, align 8, !dbg !204, !tbaa !184
  %9 = tail call double @fabs(double %8) #4, !dbg !204
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !25), !dbg !204
  %10 = icmp sgt i32 %n, 1, !dbg !206
  br i1 %5, label %.preheader, label %11, !dbg !201

.preheader:                                       ; preds = %4
  br i1 %10, label %.lr.ph, label %.loopexit, !dbg !206

; <label>:11                                      ; preds = %4
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !28), !dbg !208
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !27), !dbg !211
  br i1 %10, label %.lr.ph9, label %.loopexit, !dbg !211

.lr.ph9:                                          ; preds = %11
  %12 = add nsw i32 %incx, 1, !dbg !208
  %13 = sext i32 %12 to i64
  %14 = sext i32 %incx to i64
  br label %15, !dbg !211

; <label>:15                                      ; preds = %15, %.lr.ph9
  %indvars.iv11 = phi i64 [ %13, %.lr.ph9 ], [ %indvars.iv.next12, %15 ]
  %itemp.08 = phi i32 [ 0, %.lr.ph9 ], [ %itemp.1, %15 ]
  %i.06 = phi i32 [ 1, %.lr.ph9 ], [ %21, %15 ]
  %dmax.05 = phi double [ %9, %.lr.ph9 ], [ %dmax.1, %15 ]
  %16 = add nsw i64 %indvars.iv11, %6, !dbg !213
  %17 = getelementptr inbounds double* %dx, i64 %16, !dbg !213
  %18 = load double* %17, align 8, !dbg !213, !tbaa !184
  %19 = tail call double @fabs(double %18) #4, !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !26), !dbg !213
  %20 = fcmp ogt double %19, %dmax.05, !dbg !215
  tail call void @llvm.dbg.value(metadata !{i32 %i.06}, i64 0, metadata !29), !dbg !217
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !25), !dbg !219
  %dmax.1 = select i1 %20, double %19, double %dmax.05, !dbg !215
  %itemp.1 = select i1 %20, i32 %i.06, i32 %itemp.08, !dbg !215
  %21 = add nsw i32 %i.06, 1, !dbg !211
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !27), !dbg !211
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %14, !dbg !211
  %exitcond13 = icmp eq i32 %21, %n, !dbg !211
  br i1 %exitcond13, label %.loopexit, label %15, !dbg !211

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 1, %.preheader ]
  %itemp.24 = phi i32 [ %itemp.3, %.lr.ph ], [ 0, %.preheader ]
  %dmax.22 = phi double [ %dmax.3, %.lr.ph ], [ %9, %.preheader ]
  %22 = add nsw i64 %indvars.iv, %6, !dbg !220
  %23 = getelementptr inbounds double* %dx, i64 %22, !dbg !220
  %24 = load double* %23, align 8, !dbg !220, !tbaa !184
  %25 = tail call double @fabs(double %24) #4, !dbg !220
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !26), !dbg !220
  %26 = fcmp ogt double %25, %dmax.22, !dbg !222
  tail call void @llvm.dbg.value(metadata !224, i64 0, metadata !29), !dbg !225
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !25), !dbg !227
  %dmax.3 = select i1 %26, double %25, double %dmax.22, !dbg !222
  %27 = trunc i64 %indvars.iv to i32, !dbg !222
  %itemp.3 = select i1 %26, i32 %27, i32 %itemp.24, !dbg !222
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !206
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !206
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !206
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !206

.loopexit:                                        ; preds = %15, %.lr.ph, %11, %.preheader, %2, %0
  %itemp.4 = phi i32 [ -1, %0 ], [ 0, %2 ], [ 0, %.preheader ], [ 0, %11 ], [ %itemp.3, %.lr.ph ], [ %itemp.1, %15 ]
  ret i32 %itemp.4, !dbg !228
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define void @dscal(i32 %n, double %da, double* nocapture %dx, i32 %dx_off, i32 %incx) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !34), !dbg !229
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !35), !dbg !229
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !36), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !37), !dbg !229
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !38), !dbg !229
  %1 = icmp sgt i32 %n, 0, !dbg !230
  br i1 %1, label %2, label %.loopexit, !dbg !230

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, 1, !dbg !231
  br i1 %3, label %.lr.ph, label %18, !dbg !231

.lr.ph:                                           ; preds = %2
  %4 = sext i32 %dx_off to i64, !dbg !232
  %5 = add i32 %n, -1, !dbg !232
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !232
  %end.idx = add i64 %6, 1, !dbg !232
  %n.vec = and i64 %7, 8589934588, !dbg !232
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !232
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %da, i32 0
  %broadcast.splat13 = shufflevector <2 x double> %broadcast.splatinsert12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !232
  %8 = add i64 %index, %4, !dbg !235
  %9 = getelementptr inbounds double* %dx, i64 %8, !dbg !235
  %10 = bitcast double* %9 to <2 x double>*, !dbg !235
  %wide.load = load <2 x double>* %10, align 8, !dbg !235
  %.sum = add i64 %8, 2, !dbg !235
  %11 = getelementptr double* %dx, i64 %.sum, !dbg !235
  %12 = bitcast double* %11 to <2 x double>*, !dbg !235
  %wide.load11 = load <2 x double>* %12, align 8, !dbg !235
  %13 = fmul <2 x double> %wide.load, %broadcast.splat13, !dbg !235
  %14 = fmul <2 x double> %wide.load11, %broadcast.splat13, !dbg !235
  %15 = bitcast double* %9 to <2 x double>*, !dbg !235
  store <2 x double> %13, <2 x double>* %15, align 8, !dbg !235
  %16 = bitcast double* %11 to <2 x double>*, !dbg !235
  store <2 x double> %14, <2 x double>* %16, align 8, !dbg !235
  %index.next = add i64 %index, 4, !dbg !232
  %17 = icmp eq i64 %index.next, %n.vec, !dbg !232
  br i1 %17, label %middle.block, label %vector.body, !dbg !232, !llvm.loop !236

middle.block:                                     ; preds = %vector.body, %.lr.ph
  %resume.val = phi i64 [ 0, %.lr.ph ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %scalar.ph

; <label>:18                                      ; preds = %2
  %19 = mul nsw i32 %incx, %n, !dbg !237
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !40), !dbg !237
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !39), !dbg !238
  %20 = icmp sgt i32 %19, 0, !dbg !238
  br i1 %20, label %.lr.ph4, label %.loopexit, !dbg !238

.lr.ph4:                                          ; preds = %18
  %21 = sext i32 %incx to i64
  %22 = sext i32 %dx_off to i64, !dbg !238
  br label %23, !dbg !238

; <label>:23                                      ; preds = %.lr.ph4, %23
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %23 ]
  %24 = add nsw i64 %indvars.iv5, %22, !dbg !240
  %25 = getelementptr inbounds double* %dx, i64 %24, !dbg !240
  %26 = load double* %25, align 8, !dbg !240, !tbaa !184
  %27 = fmul double %26, %da, !dbg !240
  store double %27, double* %25, align 8, !dbg !240, !tbaa !184
  %indvars.iv.next6 = add nsw i64 %indvars.iv5, %21, !dbg !238
  %28 = trunc i64 %indvars.iv.next6 to i32, !dbg !238
  %29 = icmp slt i32 %28, %19, !dbg !238
  br i1 %29, label %23, label %.loopexit, !dbg !238

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %resume.val, %middle.block ]
  %30 = add nsw i64 %indvars.iv, %4, !dbg !235
  %31 = getelementptr inbounds double* %dx, i64 %30, !dbg !235
  %32 = load double* %31, align 8, !dbg !235, !tbaa !184
  %33 = fmul double %32, %da, !dbg !235
  store double %33, double* %31, align 8, !dbg !235, !tbaa !184
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !232
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !232
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !232
  br i1 %exitcond, label %.loopexit, label %scalar.ph, !dbg !232, !llvm.loop !241

.loopexit:                                        ; preds = %23, %scalar.ph, %middle.block, %18, %0
  ret void, !dbg !242
}

; Function Attrs: nounwind uwtable
define void @daxpy(i32 %n, double %da, double* nocapture readonly %dx, i32 %dx_off, i32 %incx, double* nocapture %dy, i32 %dy_off, i32 %incy) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !49), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !50), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !51), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !52), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !53), !dbg !243
  tail call void @llvm.dbg.value(metadata !{double* %dy}, i64 0, metadata !54), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i32 %dy_off}, i64 0, metadata !55), !dbg !243
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !56), !dbg !243
  %1 = icmp sgt i32 %n, 0, !dbg !244
  %2 = fcmp une double %da, 0.000000e+00, !dbg !244
  %or.cond = and i1 %1, %2, !dbg !244
  br i1 %or.cond, label %3, label %.loopexit, !dbg !244

; <label>:3                                       ; preds = %0
  %4 = icmp ne i32 %incx, 1, !dbg !245
  %5 = icmp ne i32 %incy, 1, !dbg !245
  %or.cond3 = or i1 %4, %5, !dbg !245
  br i1 %or.cond3, label %34, label %.lr.ph10, !dbg !245

.lr.ph10:                                         ; preds = %3
  %6 = sext i32 %dy_off to i64, !dbg !246
  %7 = sext i32 %dx_off to i64, !dbg !246
  %8 = add i32 %n, -1, !dbg !246
  %9 = zext i32 %8 to i64
  %10 = add i64 %9, 1, !dbg !246
  %end.idx = add i64 %9, 1, !dbg !246
  %n.vec = and i64 %10, 8589934588, !dbg !246
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !246
  %11 = sext i32 %dy_off to i64
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = sext i32 %dx_off to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph10
  %15 = add i64 %14, %13
  %16 = add i64 %11, %13
  %scevgep23 = getelementptr double* %dx, i64 %15
  %scevgep21 = getelementptr double* %dx, i64 %14
  %scevgep19 = getelementptr double* %dy, i64 %16
  %scevgep = getelementptr double* %dy, i64 %11
  %bound1 = icmp ule double* %scevgep21, %scevgep19
  %bound0 = icmp ule double* %scevgep, %scevgep23
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert29 = insertelement <2 x double> undef, double %da, i32 0
  %broadcast.splat30 = shufflevector <2 x double> %broadcast.splatinsert29, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !246
  %17 = add i64 %index, %7, !dbg !249
  %18 = getelementptr inbounds double* %dx, i64 %17, !dbg !249
  %19 = bitcast double* %18 to <2 x double>*, !dbg !249
  %wide.load = load <2 x double>* %19, align 8, !dbg !249
  %.sum = add i64 %17, 2, !dbg !249
  %20 = getelementptr double* %dx, i64 %.sum, !dbg !249
  %21 = bitcast double* %20 to <2 x double>*, !dbg !249
  %wide.load28 = load <2 x double>* %21, align 8, !dbg !249
  %22 = fmul <2 x double> %wide.load, %broadcast.splat30, !dbg !249
  %23 = fmul <2 x double> %wide.load28, %broadcast.splat30, !dbg !249
  %24 = add i64 %index, %6, !dbg !249
  %25 = getelementptr inbounds double* %dy, i64 %24, !dbg !249
  %26 = bitcast double* %25 to <2 x double>*, !dbg !249
  %wide.load33 = load <2 x double>* %26, align 8, !dbg !249
  %.sum37 = add i64 %24, 2, !dbg !249
  %27 = getelementptr double* %dy, i64 %.sum37, !dbg !249
  %28 = bitcast double* %27 to <2 x double>*, !dbg !249
  %wide.load34 = load <2 x double>* %28, align 8, !dbg !249
  %29 = fadd <2 x double> %wide.load33, %22, !dbg !249
  %30 = fadd <2 x double> %wide.load34, %23, !dbg !249
  %31 = bitcast double* %25 to <2 x double>*, !dbg !249
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !249
  %32 = bitcast double* %27 to <2 x double>*, !dbg !249
  store <2 x double> %30, <2 x double>* %32, align 8, !dbg !249
  %index.next = add i64 %index, 4, !dbg !246
  %33 = icmp eq i64 %index.next, %n.vec, !dbg !246
  br i1 %33, label %middle.block, label %vector.body, !dbg !246, !llvm.loop !250

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph10
  %resume.val = phi i64 [ 0, %.lr.ph10 ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %scalar.ph

; <label>:34                                      ; preds = %3
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !58), !dbg !251
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !63), !dbg !252
  %35 = icmp slt i32 %incx, 0, !dbg !253
  br i1 %35, label %36, label %39, !dbg !253

; <label>:36                                      ; preds = %34
  %37 = sub nsw i32 1, %n, !dbg !255
  %38 = mul nsw i32 %37, %incx, !dbg !255
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !58), !dbg !255
  %phitmp16 = sext i32 %38 to i64, !dbg !255
  br label %39, !dbg !255

; <label>:39                                      ; preds = %36, %34
  %ix.0 = phi i64 [ %phitmp16, %36 ], [ 0, %34 ]
  %40 = icmp slt i32 %incy, 0, !dbg !256
  br i1 %40, label %41, label %.lr.ph, !dbg !256

; <label>:41                                      ; preds = %39
  %42 = sub nsw i32 1, %n, !dbg !258
  %43 = mul nsw i32 %42, %incy, !dbg !258
  tail call void @llvm.dbg.value(metadata !{i32 %43}, i64 0, metadata !63), !dbg !258
  %phitmp = sext i32 %43 to i64, !dbg !258
  br label %.lr.ph, !dbg !258

.lr.ph:                                           ; preds = %39, %41
  %iy.1.ph = phi i64 [ 0, %39 ], [ %phitmp, %41 ]
  %44 = sext i32 %incy to i64
  %45 = sext i32 %dy_off to i64, !dbg !259
  %46 = sext i32 %incx to i64
  %47 = sext i32 %dx_off to i64, !dbg !259
  br label %48, !dbg !259

; <label>:48                                      ; preds = %48, %.lr.ph
  %indvars.iv11 = phi i64 [ %ix.0, %.lr.ph ], [ %indvars.iv.next12, %48 ]
  %indvars.iv = phi i64 [ %iy.1.ph, %.lr.ph ], [ %indvars.iv.next, %48 ]
  %i.06 = phi i32 [ 0, %.lr.ph ], [ %57, %48 ]
  %49 = add nsw i64 %indvars.iv11, %47, !dbg !261
  %50 = getelementptr inbounds double* %dx, i64 %49, !dbg !261
  %51 = load double* %50, align 8, !dbg !261, !tbaa !184
  %52 = fmul double %51, %da, !dbg !261
  %53 = add nsw i64 %indvars.iv, %45, !dbg !261
  %54 = getelementptr inbounds double* %dy, i64 %53, !dbg !261
  %55 = load double* %54, align 8, !dbg !261, !tbaa !184
  %56 = fadd double %55, %52, !dbg !261
  store double %56, double* %54, align 8, !dbg !261, !tbaa !184
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %46, !dbg !259
  %indvars.iv.next = add nsw i64 %indvars.iv, %44, !dbg !259
  %57 = add nsw i32 %i.06, 1, !dbg !259
  tail call void @llvm.dbg.value(metadata !{i32 %57}, i64 0, metadata !57), !dbg !259
  %exitcond = icmp eq i32 %57, %n, !dbg !259
  br i1 %exitcond, label %.loopexit, label %48, !dbg !259

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %scalar.ph ], [ %resume.val, %middle.block ]
  %58 = add nsw i64 %indvars.iv13, %7, !dbg !249
  %59 = getelementptr inbounds double* %dx, i64 %58, !dbg !249
  %60 = load double* %59, align 8, !dbg !249, !tbaa !184
  %61 = fmul double %60, %da, !dbg !249
  %62 = add nsw i64 %indvars.iv13, %6, !dbg !249
  %63 = getelementptr inbounds double* %dy, i64 %62, !dbg !249
  %64 = load double* %63, align 8, !dbg !249, !tbaa !184
  %65 = fadd double %64, %61, !dbg !249
  store double %65, double* %63, align 8, !dbg !249, !tbaa !184
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !246
  %lftr.wideiv = trunc i64 %indvars.iv.next14 to i32, !dbg !246
  %exitcond15 = icmp eq i32 %lftr.wideiv, %n, !dbg !246
  br i1 %exitcond15, label %.loopexit, label %scalar.ph, !dbg !246, !llvm.loop !263

.loopexit:                                        ; preds = %scalar.ph, %middle.block, %48, %0
  ret void, !dbg !264
}

; Function Attrs: nounwind uwtable
define void @dgefa(double** nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !69), !dbg !265
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !70), !dbg !265
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !72), !dbg !266
  br label %1, !dbg !266

; <label>:1                                       ; preds = %.backedge, %0
  %indvars.iv48 = phi i64 [ 0, %0 ], [ %indvars.iv.next49, %.backedge ]
  %indvars.iv42 = phi i64 [ 1, %0 ], [ %indvars.iv.next43, %.backedge ]
  %indvars.iv38 = phi i32 [ 1999, %0 ], [ %indvars.iv.next39, %.backedge ]
  %indvars.iv = phi i32 [ 2000, %0 ], [ %indvars.iv.next, %.backedge ]
  %2 = sub i64 1999, %indvars.iv48, !dbg !267
  %3 = add i64 %indvars.iv48, 1, !dbg !267
  %4 = sub i64 1999, %indvars.iv48, !dbg !267
  %5 = add i64 %indvars.iv48, 1, !dbg !267
  %6 = sub i64 1999, %indvars.iv48, !dbg !267
  %7 = getelementptr inbounds double** %a, i64 %indvars.iv48, !dbg !267
  %8 = load double** %7, align 8, !dbg !267, !tbaa !182
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !74), !dbg !267
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1, !dbg !266
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !268) #5, !dbg !270
  tail call void @llvm.dbg.value(metadata !224, i64 0, metadata !271) #5, !dbg !270
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !272) #5, !dbg !270
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !273) #5, !dbg !274
  %9 = getelementptr inbounds double* %8, i64 %indvars.iv48, !dbg !275
  %10 = load double* %9, align 8, !dbg !275, !tbaa !184
  %11 = tail call double @fabs(double %10) #4, !dbg !275
  tail call void @llvm.dbg.value(metadata !{double %11}, i64 0, metadata !276) #5, !dbg !275
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %1, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 1, %1 ]
  %itemp.24.i = phi i32 [ %itemp.3.i, %.lr.ph.i ], [ 0, %1 ]
  %dmax.22.i = phi double [ %dmax.3.i, %.lr.ph.i ], [ %11, %1 ]
  %12 = add nsw i64 %indvars.iv.i, %indvars.iv48, !dbg !277
  %13 = getelementptr inbounds double* %8, i64 %12, !dbg !277
  %14 = load double* %13, align 8, !dbg !277, !tbaa !184
  %15 = tail call double @fabs(double %14) #4, !dbg !277
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !278) #5, !dbg !277
  %16 = fcmp ogt double %15, %dmax.22.i, !dbg !279
  tail call void @llvm.dbg.value(metadata !224, i64 0, metadata !273) #5, !dbg !280
  tail call void @llvm.dbg.value(metadata !{double %15}, i64 0, metadata !276) #5, !dbg !281
  %dmax.3.i = select i1 %16, double %15, double %dmax.22.i, !dbg !279
  %17 = trunc i64 %indvars.iv.i to i32, !dbg !279
  %itemp.3.i = select i1 %16, i32 %17, i32 %itemp.24.i, !dbg !279
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !282
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !282
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !282
  br i1 %exitcond, label %idamax.exit, label %.lr.ph.i, !dbg !282

idamax.exit:                                      ; preds = %.lr.ph.i
  %18 = trunc i64 %indvars.iv48 to i32, !dbg !269
  %19 = add nsw i32 %itemp.3.i, %18, !dbg !269
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !78), !dbg !269
  %20 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv48, !dbg !283
  store i32 %19, i32* %20, align 4, !dbg !283, !tbaa !284
  %21 = sext i32 %19 to i64, !dbg !286
  %22 = getelementptr inbounds double* %8, i64 %21, !dbg !286
  %23 = load double* %22, align 8, !dbg !286, !tbaa !184
  %24 = fcmp une double %23, 0.000000e+00, !dbg !286
  br i1 %24, label %25, label %.backedge, !dbg !286

.backedge:                                        ; preds = %daxpy.exit.us14, %daxpy.exit.us.us, %idamax.exit
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !266
  %indvars.iv.next39 = add i32 %indvars.iv38, -1, !dbg !266
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !266
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 1999, !dbg !266
  br i1 %exitcond50, label %106, label %1, !dbg !266

; <label>:25                                      ; preds = %idamax.exit
  %26 = icmp ne i32 %itemp.3.i, 0, !dbg !287
  %27 = getelementptr inbounds double* %8, i64 %indvars.iv48, !dbg !289
  %28 = load double* %27, align 8, !dbg !289, !tbaa !184
  br i1 %26, label %29, label %._crit_edge, !dbg !287

; <label>:29                                      ; preds = %25
  tail call void @llvm.dbg.value(metadata !{double %23}, i64 0, metadata !71), !dbg !291
  store double %28, double* %22, align 8, !dbg !289, !tbaa !184
  store double %23, double* %27, align 8, !dbg !292, !tbaa !184
  br label %._crit_edge, !dbg !293

._crit_edge:                                      ; preds = %25, %29
  %30 = phi double [ %23, %29 ], [ %28, %25 ]
  %31 = fdiv double -1.000000e+00, %30, !dbg !294
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !71), !dbg !294
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !295), !dbg !297
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !298), !dbg !297
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !299), !dbg !297
  %n.vec122 = and i64 %2, -4, !dbg !300
  %cmp.zero124 = icmp eq i64 %n.vec122, 0, !dbg !300
  br i1 %cmp.zero124, label %middle.block117, label %vector.ph115

vector.ph115:                                     ; preds = %._crit_edge
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %31, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body116

vector.body116:                                   ; preds = %vector.body116, %vector.ph115
  %index119 = phi i64 [ 0, %vector.ph115 ], [ %index.next128, %vector.body116 ], !dbg !300
  %32 = add i64 %index119, %indvars.iv.next49, !dbg !301
  %33 = getelementptr inbounds double* %8, i64 %32, !dbg !301
  %34 = bitcast double* %33 to <2 x double>*, !dbg !301
  %wide.load135 = load <2 x double>* %34, align 8, !dbg !301
  %.sum = add i64 %32, 2, !dbg !301
  %35 = getelementptr double* %8, i64 %.sum, !dbg !301
  %36 = bitcast double* %35 to <2 x double>*, !dbg !301
  %wide.load136 = load <2 x double>* %36, align 8, !dbg !301
  %37 = fmul <2 x double> %broadcast.splat138, %wide.load135, !dbg !301
  %38 = fmul <2 x double> %broadcast.splat138, %wide.load136, !dbg !301
  %39 = bitcast double* %33 to <2 x double>*, !dbg !301
  store <2 x double> %37, <2 x double>* %39, align 8, !dbg !301
  %40 = bitcast double* %35 to <2 x double>*, !dbg !301
  store <2 x double> %38, <2 x double>* %40, align 8, !dbg !301
  %index.next128 = add i64 %index119, 4, !dbg !300
  %41 = icmp eq i64 %index.next128, %n.vec122, !dbg !300
  br i1 %41, label %middle.block117, label %vector.body116, !dbg !300, !llvm.loop !302

middle.block117:                                  ; preds = %vector.body116, %._crit_edge
  %resume.val125 = phi i64 [ 0, %._crit_edge ], [ %n.vec122, %vector.body116 ]
  %cmp.n127 = icmp eq i64 %2, %resume.val125
  br i1 %cmp.n127, label %.lr.ph, label %scalar.ph118

scalar.ph118:                                     ; preds = %middle.block117, %scalar.ph118
  %indvars.iv.i2 = phi i64 [ %indvars.iv.next.i3, %scalar.ph118 ], [ %resume.val125, %middle.block117 ]
  %42 = add nsw i64 %indvars.iv.i2, %indvars.iv.next49, !dbg !301
  %43 = getelementptr inbounds double* %8, i64 %42, !dbg !301
  %44 = load double* %43, align 8, !dbg !301, !tbaa !184
  %45 = fmul double %31, %44, !dbg !301
  store double %45, double* %43, align 8, !dbg !301, !tbaa !184
  %indvars.iv.next.i3 = add nuw nsw i64 %indvars.iv.i2, 1, !dbg !300
  %lftr.wideiv19 = trunc i64 %indvars.iv.next.i3 to i32, !dbg !300
  %exitcond20 = icmp eq i32 %lftr.wideiv19, %indvars.iv38, !dbg !300
  br i1 %exitcond20, label %.lr.ph, label %scalar.ph118, !dbg !300, !llvm.loop !303

.lr.ph:                                           ; preds = %middle.block117, %scalar.ph118
  br i1 %26, label %.preheader54, label %.preheader55

.preheader55:                                     ; preds = %.lr.ph
  %scevgep88 = getelementptr double* %8, i64 %3
  %scevgep90 = getelementptr double* %8, i64 1999
  br label %77, !dbg !304

.preheader54:                                     ; preds = %.lr.ph
  %scevgep60 = getelementptr double* %8, i64 %5
  %scevgep62 = getelementptr double* %8, i64 1999
  br label %46, !dbg !304

; <label>:46                                      ; preds = %.preheader54, %daxpy.exit.us.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %daxpy.exit.us.us ], [ %indvars.iv42, %.preheader54 ]
  %47 = getelementptr inbounds double** %a, i64 %indvars.iv44, !dbg !304
  %48 = load double** %47, align 8, !dbg !304, !tbaa !182
  tail call void @llvm.dbg.value(metadata !{double* %48}, i64 0, metadata !79), !dbg !304
  %49 = getelementptr inbounds double* %48, i64 %21, !dbg !305
  %50 = load double* %49, align 8, !dbg !305, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !71), !dbg !305
  %51 = getelementptr inbounds double* %48, i64 %indvars.iv48, !dbg !306
  %52 = load double* %51, align 8, !dbg !306, !tbaa !184
  store double %52, double* %49, align 8, !dbg !306, !tbaa !184
  store double %50, double* %51, align 8, !dbg !309, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !310), !dbg !312
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !313), !dbg !312
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !314), !dbg !312
  tail call void @llvm.dbg.value(metadata !{double* %48}, i64 0, metadata !315), !dbg !312
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !316), !dbg !312
  %53 = fcmp une double %50, 0.000000e+00, !dbg !317
  br i1 %53, label %.preheader, label %daxpy.exit.us.us, !dbg !317

.preheader:                                       ; preds = %46
  %n.vec = and i64 %6, -4, !dbg !318
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !318
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.preheader
  %scevgep58 = getelementptr double* %48, i64 1999
  %scevgep = getelementptr double* %48, i64 %5
  %bound1 = icmp ule double* %scevgep60, %scevgep58
  %bound0 = icmp ule double* %scevgep, %scevgep62
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %50, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !318
  %54 = add i64 %index, %indvars.iv.next49, !dbg !319
  %55 = getelementptr inbounds double* %8, i64 %54, !dbg !319
  %56 = bitcast double* %55 to <2 x double>*, !dbg !319
  %wide.load = load <2 x double>* %56, align 8, !dbg !319
  %.sum143 = add i64 %54, 2, !dbg !319
  %57 = getelementptr double* %8, i64 %.sum143, !dbg !319
  %58 = bitcast double* %57 to <2 x double>*, !dbg !319
  %wide.load67 = load <2 x double>* %58, align 8, !dbg !319
  %59 = fmul <2 x double> %broadcast.splat69, %wide.load, !dbg !319
  %60 = fmul <2 x double> %broadcast.splat69, %wide.load67, !dbg !319
  %61 = getelementptr inbounds double* %48, i64 %54, !dbg !319
  %62 = bitcast double* %61 to <2 x double>*, !dbg !319
  %wide.load70 = load <2 x double>* %62, align 8, !dbg !319
  %.sum144 = add i64 %54, 2, !dbg !319
  %63 = getelementptr double* %48, i64 %.sum144, !dbg !319
  %64 = bitcast double* %63 to <2 x double>*, !dbg !319
  %wide.load71 = load <2 x double>* %64, align 8, !dbg !319
  %65 = fadd <2 x double> %wide.load70, %59, !dbg !319
  %66 = fadd <2 x double> %wide.load71, %60, !dbg !319
  %67 = bitcast double* %61 to <2 x double>*, !dbg !319
  store <2 x double> %65, <2 x double>* %67, align 8, !dbg !319
  %68 = bitcast double* %63 to <2 x double>*, !dbg !319
  store <2 x double> %66, <2 x double>* %68, align 8, !dbg !319
  %index.next = add i64 %index, 4, !dbg !318
  %69 = icmp eq i64 %index.next, %n.vec, !dbg !318
  br i1 %69, label %middle.block, label %vector.body, !dbg !318, !llvm.loop !320

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.preheader
  %resume.val = phi i64 [ 0, %.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %6, %resume.val
  br i1 %cmp.n, label %daxpy.exit.us.us, label %scalar.ph

daxpy.exit.us.us:                                 ; preds = %scalar.ph, %middle.block, %46
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1, !dbg !321
  %lftr.wideiv46 = trunc i64 %indvars.iv.next45 to i32, !dbg !321
  %exitcond47 = icmp eq i32 %lftr.wideiv46, 2000, !dbg !321
  br i1 %exitcond47, label %.backedge, label %46, !dbg !321

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv13.i.us.us = phi i64 [ %indvars.iv.next14.i.us.us, %scalar.ph ], [ %resume.val, %middle.block ]
  %70 = add nsw i64 %indvars.iv13.i.us.us, %indvars.iv.next49, !dbg !319
  %71 = getelementptr inbounds double* %8, i64 %70, !dbg !319
  %72 = load double* %71, align 8, !dbg !319, !tbaa !184
  %73 = fmul double %50, %72, !dbg !319
  %74 = getelementptr inbounds double* %48, i64 %70, !dbg !319
  %75 = load double* %74, align 8, !dbg !319, !tbaa !184
  %76 = fadd double %75, %73, !dbg !319
  store double %76, double* %74, align 8, !dbg !319, !tbaa !184
  %indvars.iv.next14.i.us.us = add nuw nsw i64 %indvars.iv13.i.us.us, 1, !dbg !318
  %lftr.wideiv40 = trunc i64 %indvars.iv.next14.i.us.us to i32, !dbg !318
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %indvars.iv38, !dbg !318
  br i1 %exitcond41, label %daxpy.exit.us.us, label %scalar.ph, !dbg !318, !llvm.loop !322

; <label>:77                                      ; preds = %.preheader55, %daxpy.exit.us14
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %daxpy.exit.us14 ], [ %indvars.iv42, %.preheader55 ]
  %78 = getelementptr inbounds double** %a, i64 %indvars.iv34, !dbg !304
  %79 = load double** %78, align 8, !dbg !304, !tbaa !182
  tail call void @llvm.dbg.value(metadata !{double* %79}, i64 0, metadata !79), !dbg !304
  %80 = getelementptr inbounds double* %79, i64 %21, !dbg !305
  %81 = load double* %80, align 8, !dbg !305, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !71), !dbg !305
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !310), !dbg !312
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !313), !dbg !312
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !314), !dbg !312
  tail call void @llvm.dbg.value(metadata !{double* %79}, i64 0, metadata !315), !dbg !312
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !316), !dbg !312
  %82 = fcmp une double %81, 0.000000e+00, !dbg !317
  br i1 %82, label %.preheader53, label %daxpy.exit.us14, !dbg !317

.preheader53:                                     ; preds = %77
  %n.vec81 = and i64 %4, -4, !dbg !318
  %cmp.zero83 = icmp eq i64 %n.vec81, 0, !dbg !318
  br i1 %cmp.zero83, label %middle.block76, label %vector.memcheck96

vector.memcheck96:                                ; preds = %.preheader53
  %scevgep86 = getelementptr double* %79, i64 1999
  %scevgep84 = getelementptr double* %79, i64 %3
  %bound193 = icmp ule double* %scevgep88, %scevgep86
  %bound092 = icmp ule double* %scevgep84, %scevgep90
  %memcheck.conflict95 = and i1 %bound092, %bound193
  br i1 %memcheck.conflict95, label %middle.block76, label %vector.ph74

vector.ph74:                                      ; preds = %vector.memcheck96
  %broadcast.splatinsert109 = insertelement <2 x double> undef, double %81, i32 0
  %broadcast.splat110 = shufflevector <2 x double> %broadcast.splatinsert109, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body75

vector.body75:                                    ; preds = %vector.body75, %vector.ph74
  %index78 = phi i64 [ 0, %vector.ph74 ], [ %index.next100, %vector.body75 ], !dbg !318
  %83 = add i64 %index78, %indvars.iv.next49, !dbg !319
  %84 = getelementptr inbounds double* %8, i64 %83, !dbg !319
  %85 = bitcast double* %84 to <2 x double>*, !dbg !319
  %wide.load107 = load <2 x double>* %85, align 8, !dbg !319
  %.sum141 = add i64 %83, 2, !dbg !319
  %86 = getelementptr double* %8, i64 %.sum141, !dbg !319
  %87 = bitcast double* %86 to <2 x double>*, !dbg !319
  %wide.load108 = load <2 x double>* %87, align 8, !dbg !319
  %88 = fmul <2 x double> %broadcast.splat110, %wide.load107, !dbg !319
  %89 = fmul <2 x double> %broadcast.splat110, %wide.load108, !dbg !319
  %90 = getelementptr inbounds double* %79, i64 %83, !dbg !319
  %91 = bitcast double* %90 to <2 x double>*, !dbg !319
  %wide.load111 = load <2 x double>* %91, align 8, !dbg !319
  %.sum142 = add i64 %83, 2, !dbg !319
  %92 = getelementptr double* %79, i64 %.sum142, !dbg !319
  %93 = bitcast double* %92 to <2 x double>*, !dbg !319
  %wide.load112 = load <2 x double>* %93, align 8, !dbg !319
  %94 = fadd <2 x double> %wide.load111, %88, !dbg !319
  %95 = fadd <2 x double> %wide.load112, %89, !dbg !319
  %96 = bitcast double* %90 to <2 x double>*, !dbg !319
  store <2 x double> %94, <2 x double>* %96, align 8, !dbg !319
  %97 = bitcast double* %92 to <2 x double>*, !dbg !319
  store <2 x double> %95, <2 x double>* %97, align 8, !dbg !319
  %index.next100 = add i64 %index78, 4, !dbg !318
  %98 = icmp eq i64 %index.next100, %n.vec81, !dbg !318
  br i1 %98, label %middle.block76, label %vector.body75, !dbg !318, !llvm.loop !323

middle.block76:                                   ; preds = %vector.body75, %vector.memcheck96, %.preheader53
  %resume.val97 = phi i64 [ 0, %.preheader53 ], [ 0, %vector.memcheck96 ], [ %n.vec81, %vector.body75 ]
  %cmp.n99 = icmp eq i64 %4, %resume.val97
  br i1 %cmp.n99, label %daxpy.exit.us14, label %scalar.ph77

scalar.ph77:                                      ; preds = %middle.block76, %scalar.ph77
  %indvars.iv13.i.us10 = phi i64 [ %indvars.iv.next14.i.us11, %scalar.ph77 ], [ %resume.val97, %middle.block76 ]
  %99 = add nsw i64 %indvars.iv13.i.us10, %indvars.iv.next49, !dbg !319
  %100 = getelementptr inbounds double* %8, i64 %99, !dbg !319
  %101 = load double* %100, align 8, !dbg !319, !tbaa !184
  %102 = fmul double %81, %101, !dbg !319
  %103 = getelementptr inbounds double* %79, i64 %99, !dbg !319
  %104 = load double* %103, align 8, !dbg !319, !tbaa !184
  %105 = fadd double %104, %102, !dbg !319
  store double %105, double* %103, align 8, !dbg !319, !tbaa !184
  %indvars.iv.next14.i.us11 = add nuw nsw i64 %indvars.iv13.i.us10, 1, !dbg !318
  %lftr.wideiv30 = trunc i64 %indvars.iv.next14.i.us11 to i32, !dbg !318
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %indvars.iv38, !dbg !318
  br i1 %exitcond31, label %daxpy.exit.us14, label %scalar.ph77, !dbg !318, !llvm.loop !324

daxpy.exit.us14:                                  ; preds = %scalar.ph77, %middle.block76, %77
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1, !dbg !321
  %lftr.wideiv36 = trunc i64 %indvars.iv.next35 to i32, !dbg !321
  %exitcond37 = icmp eq i32 %lftr.wideiv36, 2000, !dbg !321
  br i1 %exitcond37, label %.backedge, label %77, !dbg !321

; <label>:106                                     ; preds = %.backedge
  %107 = getelementptr inbounds i32* %ipvt, i64 1999, !dbg !325
  store i32 1999, i32* %107, align 4, !dbg !325, !tbaa !284
  ret void, !dbg !326
}

; Function Attrs: nounwind uwtable
define void @dgesl(double** nocapture readonly %a, i32* nocapture readonly %ipvt, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !88), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !89), !dbg !327
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !90), !dbg !327
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !92), !dbg !328
  %scevgep21 = getelementptr double* %b, i64 1999
  br label %1, !dbg !328

; <label>:1                                       ; preds = %daxpy.exit.backedge, %0
  %indvars.iv16 = phi i64 [ 0, %0 ], [ %indvars.iv.next17, %daxpy.exit.backedge ]
  %indvars.iv12 = phi i32 [ 1999, %0 ], [ %indvars.iv.next13, %daxpy.exit.backedge ]
  %2 = add i64 %indvars.iv16, 1, !dbg !329
  %scevgep = getelementptr double* %b, i64 %2
  %3 = sub i64 1999, %indvars.iv16, !dbg !329
  %4 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv16, !dbg !329
  %5 = load i32* %4, align 4, !dbg !329, !tbaa !284
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !94), !dbg !329
  %6 = sext i32 %5 to i64, !dbg !330
  %7 = getelementptr inbounds double* %b, i64 %6, !dbg !330
  %8 = load double* %7, align 8, !dbg !330, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double %8}, i64 0, metadata !91), !dbg !330
  %9 = trunc i64 %indvars.iv16 to i32, !dbg !331
  %10 = icmp eq i32 %5, %9, !dbg !331
  br i1 %10, label %14, label %11, !dbg !331

; <label>:11                                      ; preds = %1
  %12 = getelementptr inbounds double* %b, i64 %indvars.iv16, !dbg !333
  %13 = load double* %12, align 8, !dbg !333, !tbaa !184
  store double %13, double* %7, align 8, !dbg !333, !tbaa !184
  store double %8, double* %12, align 8, !dbg !335, !tbaa !184
  br label %14, !dbg !336

; <label>:14                                      ; preds = %1, %11
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !328
  %15 = getelementptr inbounds double** %a, i64 %indvars.iv16, !dbg !337
  %16 = load double** %15, align 8, !dbg !337, !tbaa !182
  tail call void @llvm.dbg.value(metadata !{double %8}, i64 0, metadata !338), !dbg !339
  tail call void @llvm.dbg.value(metadata !{double* %16}, i64 0, metadata !340), !dbg !339
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !341), !dbg !339
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !342), !dbg !339
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !343), !dbg !339
  %17 = fcmp une double %8, 0.000000e+00, !dbg !344
  br i1 %17, label %.preheader19, label %daxpy.exit.backedge, !dbg !344

.preheader19:                                     ; preds = %14
  %n.vec = and i64 %3, -4, !dbg !345
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !345
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.preheader19
  %scevgep25 = getelementptr double* %16, i64 1999
  %scevgep23 = getelementptr double* %16, i64 %2
  %bound1 = icmp ule double* %scevgep23, %scevgep21
  %bound0 = icmp ule double* %scevgep, %scevgep25
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert31 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat32 = shufflevector <2 x double> %broadcast.splatinsert31, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !345
  %18 = add i64 %index, %indvars.iv.next17, !dbg !346
  %19 = getelementptr inbounds double* %16, i64 %18, !dbg !346
  %20 = bitcast double* %19 to <2 x double>*, !dbg !346
  %wide.load = load <2 x double>* %20, align 8, !dbg !346
  %.sum = add i64 %18, 2, !dbg !346
  %21 = getelementptr double* %16, i64 %.sum, !dbg !346
  %22 = bitcast double* %21 to <2 x double>*, !dbg !346
  %wide.load30 = load <2 x double>* %22, align 8, !dbg !346
  %23 = fmul <2 x double> %broadcast.splat32, %wide.load, !dbg !346
  %24 = fmul <2 x double> %broadcast.splat32, %wide.load30, !dbg !346
  %25 = getelementptr inbounds double* %b, i64 %18, !dbg !346
  %26 = bitcast double* %25 to <2 x double>*, !dbg !346
  %wide.load33 = load <2 x double>* %26, align 8, !dbg !346
  %.sum75 = add i64 %18, 2, !dbg !346
  %27 = getelementptr double* %b, i64 %.sum75, !dbg !346
  %28 = bitcast double* %27 to <2 x double>*, !dbg !346
  %wide.load34 = load <2 x double>* %28, align 8, !dbg !346
  %29 = fadd <2 x double> %wide.load33, %23, !dbg !346
  %30 = fadd <2 x double> %wide.load34, %24, !dbg !346
  %31 = bitcast double* %25 to <2 x double>*, !dbg !346
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !346
  %32 = bitcast double* %27 to <2 x double>*, !dbg !346
  store <2 x double> %30, <2 x double>* %32, align 8, !dbg !346
  %index.next = add i64 %index, 4, !dbg !345
  %33 = icmp eq i64 %index.next, %n.vec, !dbg !345
  br i1 %33, label %middle.block, label %vector.body, !dbg !345, !llvm.loop !347

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.preheader19
  %resume.val = phi i64 [ 0, %.preheader19 ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %3, %resume.val
  br i1 %cmp.n, label %daxpy.exit.backedge, label %scalar.ph

daxpy.exit.backedge:                              ; preds = %scalar.ph, %middle.block, %14
  %indvars.iv.next13 = add i32 %indvars.iv12, -1, !dbg !328
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1999, !dbg !328
  br i1 %exitcond18, label %daxpy.exit6.preheader, label %1, !dbg !328

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv13.i = phi i64 [ %indvars.iv.next14.i, %scalar.ph ], [ %resume.val, %middle.block ]
  %34 = add nsw i64 %indvars.iv13.i, %indvars.iv.next17, !dbg !346
  %35 = getelementptr inbounds double* %16, i64 %34, !dbg !346
  %36 = load double* %35, align 8, !dbg !346, !tbaa !184
  %37 = fmul double %8, %36, !dbg !346
  %38 = getelementptr inbounds double* %b, i64 %34, !dbg !346
  %39 = load double* %38, align 8, !dbg !346, !tbaa !184
  %40 = fadd double %39, %37, !dbg !346
  store double %40, double* %38, align 8, !dbg !346, !tbaa !184
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !345
  %lftr.wideiv14 = trunc i64 %indvars.iv.next14.i to i32, !dbg !345
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %indvars.iv12, !dbg !345
  br i1 %exitcond15, label %daxpy.exit.backedge, label %scalar.ph, !dbg !345, !llvm.loop !348

daxpy.exit6.preheader:                            ; preds = %daxpy.exit.backedge, %daxpy.exit6.backedge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %daxpy.exit6.backedge ], [ 0, %daxpy.exit.backedge ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %daxpy.exit6.backedge ], [ 1999, %daxpy.exit.backedge ]
  %41 = sub i64 1998, %indvars.iv9, !dbg !349
  %42 = and i64 %41, 4294967295
  %43 = sub i64 1998, %indvars.iv9, !dbg !349
  %44 = and i64 %43, 4294967295
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !349
  %45 = sub i64 1999, %indvars.iv9, !dbg !351
  %46 = getelementptr inbounds double** %a, i64 %45, !dbg !353
  %47 = load double** %46, align 8, !dbg !353, !tbaa !182
  %48 = getelementptr inbounds double* %47, i64 %45, !dbg !353
  %49 = load double* %48, align 8, !dbg !353, !tbaa !184
  %50 = getelementptr inbounds double* %b, i64 %45, !dbg !353
  %51 = load double* %50, align 8, !dbg !353, !tbaa !184
  %52 = fdiv double %51, %49, !dbg !353
  store double %52, double* %50, align 8, !dbg !353, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double* %47}, i64 0, metadata !354), !dbg !356
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !357), !dbg !356
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !358), !dbg !356
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !359), !dbg !356
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !360), !dbg !356
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !361), !dbg !356
  %53 = trunc i64 %45 to i32, !dbg !362
  %54 = icmp sgt i32 %53, 0, !dbg !362
  %55 = fcmp une double %52, -0.000000e+00, !dbg !362
  %or.cond.i1 = and i1 %54, %55, !dbg !362
  br i1 %or.cond.i1, label %.preheader.preheader, label %daxpy.exit6.backedge, !dbg !362

.preheader.preheader:                             ; preds = %daxpy.exit6.preheader
  %56 = add i64 %44, 1, !dbg !349
  %end.idx42 = add i64 %44, 1, !dbg !363
  %fold = add i64 %43, 1, !dbg !363
  %n.mod.vf43 = and i64 %fold, 3, !dbg !363
  %n.vec44 = sub i64 %56, %n.mod.vf43, !dbg !363
  %cmp.zero46 = icmp eq i64 %56, %n.mod.vf43, !dbg !363
  br i1 %cmp.zero46, label %middle.block39, label %vector.memcheck56

vector.memcheck56:                                ; preds = %.preheader.preheader
  %scevgep50 = getelementptr double* %47, i64 %42
  %scevgep48 = getelementptr double* %b, i64 %42
  %bound153 = icmp ule double* %47, %scevgep48
  %bound052 = icmp uge double* %scevgep50, %b
  %memcheck.conflict55 = and i1 %bound052, %bound153
  br i1 %memcheck.conflict55, label %middle.block39, label %vector.ph37

vector.ph37:                                      ; preds = %vector.memcheck56
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %52, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38, %vector.ph37
  %index41 = phi i64 [ 0, %vector.ph37 ], [ %index.next60, %vector.body38 ], !dbg !363
  %57 = getelementptr inbounds double* %47, i64 %index41, !dbg !364
  %58 = bitcast double* %57 to <2 x double>*, !dbg !364
  %wide.load65 = load <2 x double>* %58, align 8, !dbg !364
  %.sum73 = or i64 %index41, 2, !dbg !364
  %59 = getelementptr double* %47, i64 %.sum73, !dbg !364
  %60 = bitcast double* %59 to <2 x double>*, !dbg !364
  %wide.load66 = load <2 x double>* %60, align 8, !dbg !364
  %61 = fmul <2 x double> %broadcast.splat68, %wide.load65, !dbg !364
  %62 = fmul <2 x double> %broadcast.splat68, %wide.load66, !dbg !364
  %63 = getelementptr inbounds double* %b, i64 %index41, !dbg !364
  %64 = bitcast double* %63 to <2 x double>*, !dbg !364
  %wide.load69 = load <2 x double>* %64, align 8, !dbg !364
  %.sum74 = or i64 %index41, 2, !dbg !364
  %65 = getelementptr double* %b, i64 %.sum74, !dbg !364
  %66 = bitcast double* %65 to <2 x double>*, !dbg !364
  %wide.load70 = load <2 x double>* %66, align 8, !dbg !364
  %67 = fsub <2 x double> %wide.load69, %61, !dbg !364
  %68 = fsub <2 x double> %wide.load70, %62, !dbg !364
  %69 = bitcast double* %63 to <2 x double>*, !dbg !364
  store <2 x double> %67, <2 x double>* %69, align 8, !dbg !364
  %70 = bitcast double* %65 to <2 x double>*, !dbg !364
  store <2 x double> %68, <2 x double>* %70, align 8, !dbg !364
  %index.next60 = add i64 %index41, 4, !dbg !363
  %71 = icmp eq i64 %index.next60, %n.vec44, !dbg !363
  br i1 %71, label %middle.block39, label %vector.body38, !dbg !363, !llvm.loop !365

middle.block39:                                   ; preds = %vector.body38, %vector.memcheck56, %.preheader.preheader
  %resume.val57 = phi i64 [ 0, %.preheader.preheader ], [ 0, %vector.memcheck56 ], [ %n.vec44, %vector.body38 ]
  %cmp.n59 = icmp eq i64 %end.idx42, %resume.val57
  br i1 %cmp.n59, label %daxpy.exit6.backedge, label %.preheader

daxpy.exit6.backedge:                             ; preds = %.preheader, %middle.block39, %daxpy.exit6.preheader
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !349
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000, !dbg !349
  br i1 %exitcond11, label %78, label %daxpy.exit6.preheader, !dbg !349

.preheader:                                       ; preds = %middle.block39, %.preheader
  %indvars.iv13.i2 = phi i64 [ %indvars.iv.next14.i3, %.preheader ], [ %resume.val57, %middle.block39 ]
  %72 = getelementptr inbounds double* %47, i64 %indvars.iv13.i2, !dbg !364
  %73 = load double* %72, align 8, !dbg !364, !tbaa !184
  %74 = fmul double %52, %73, !dbg !364
  %75 = getelementptr inbounds double* %b, i64 %indvars.iv13.i2, !dbg !364
  %76 = load double* %75, align 8, !dbg !364, !tbaa !184
  %77 = fsub double %76, %74, !dbg !364
  store double %77, double* %75, align 8, !dbg !364, !tbaa !184
  %indvars.iv.next14.i3 = add nuw nsw i64 %indvars.iv13.i2, 1, !dbg !363
  %lftr.wideiv = trunc i64 %indvars.iv.next14.i3 to i32, !dbg !363
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !363
  br i1 %exitcond, label %daxpy.exit6.backedge, label %.preheader, !dbg !363, !llvm.loop !366

; <label>:78                                      ; preds = %daxpy.exit6.backedge
  ret void, !dbg !367
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !105), !dbg !368
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !106), !dbg !368
  tail call void @llvm.dbg.value(metadata !369, i64 0, metadata !108), !dbg !370
  %1 = icmp sgt i32 %argc, 1, !dbg !371
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !371

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !372
  %3 = load i8** %2, align 8, !dbg !372, !tbaa !182
  %4 = load i8* %3, align 1, !dbg !372, !tbaa !373
  %5 = zext i8 %4 to i32, !dbg !372
  %6 = sub nsw i32 45, %5, !dbg !372
  %7 = icmp eq i8 %4, 45, !dbg !374
  %8 = getelementptr inbounds i8* %3, i64 1, !dbg !376
  %9 = getelementptr inbounds i8* %3, i64 2, !dbg !378
  %10 = getelementptr inbounds i8* %3, i64 3, !dbg !381
  br label %13, !dbg !383

; <label>:11                                      ; preds = %28
  %12 = icmp slt i32 %29, %argc, !dbg !383
  br i1 %12, label %13, label %.loopexit, !dbg !383

; <label>:13                                      ; preds = %.lr.ph, %11
  %i.013 = phi i32 [ 1, %.lr.ph ], [ %29, %11 ]
  tail call void @llvm.dbg.value(metadata !384, i64 0, metadata !120), !dbg !385
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !121), !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !126), !dbg !372
  br i1 %7, label %14, label %28, !dbg !374

; <label>:14                                      ; preds = %13
  %15 = load i8* %8, align 1, !dbg !376, !tbaa !373
  %16 = zext i8 %15 to i32, !dbg !376
  %17 = sub nsw i32 103, %16, !dbg !376
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !126), !dbg !376
  %18 = icmp eq i8 %15, 103, !dbg !386
  br i1 %18, label %19, label %28, !dbg !386

; <label>:19                                      ; preds = %14
  %20 = load i8* %9, align 1, !dbg !378, !tbaa !373
  %21 = zext i8 %20 to i32, !dbg !378
  %22 = sub nsw i32 97, %21, !dbg !378
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !126), !dbg !378
  %23 = icmp eq i8 %20, 97, !dbg !381
  br i1 %23, label %24, label %28, !dbg !381

; <label>:24                                      ; preds = %19
  %25 = load i8* %10, align 1, !dbg !381, !tbaa !373
  %26 = zext i8 %25 to i32, !dbg !381
  %27 = sub nsw i32 0, %26, !dbg !381
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !126), !dbg !381
  br label %28, !dbg !381

; <label>:28                                      ; preds = %14, %24, %19, %13
  %__result.0 = phi i32 [ %27, %24 ], [ %22, %19 ], [ %17, %14 ], [ %6, %13 ]
  %phitmp = icmp eq i32 %__result.0, 0, !dbg !372
  %29 = add nsw i32 %i.013, 1, !dbg !383
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !107), !dbg !383
  br i1 %phitmp, label %.loopexit, label %11, !dbg !385

.loopexit:                                        ; preds = %11, %28, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %11 ], [ true, %28 ]
  %30 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !387
  %31 = bitcast i8* %30 to double**, !dbg !387
  tail call void @llvm.dbg.value(metadata !{double** %31}, i64 0, metadata !127), !dbg !387
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !107), !dbg !388
  br label %32, !dbg !388

; <label>:32                                      ; preds = %32, %.loopexit
  %indvars.iv23 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next24, %32 ]
  %33 = tail call noalias i8* @malloc(i64 16008) #5, !dbg !390
  %34 = bitcast i8* %33 to double*, !dbg !390
  %35 = getelementptr inbounds double** %31, i64 %indvars.iv23, !dbg !390
  store double* %34, double** %35, align 8, !dbg !390, !tbaa !182
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !388
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 2000, !dbg !388
  br i1 %exitcond25, label %36, label %32, !dbg !388

; <label>:36                                      ; preds = %32
  %37 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !391
  tail call void @llvm.dbg.value(metadata !{double* %39}, i64 0, metadata !128), !dbg !391
  tail call void @llvm.dbg.value(metadata !392, i64 0, metadata !129), !dbg !393
  %38 = tail call noalias i8* @malloc(i64 8000) #5, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !130), !dbg !394
  tail call void @llvm.dbg.value(metadata !395, i64 0, metadata !131), !dbg !396
  tail call void @llvm.dbg.value(metadata !{double** %31}, i64 0, metadata !397) #5, !dbg !399
  tail call void @llvm.dbg.value(metadata !{double* %39}, i64 0, metadata !400) #5, !dbg !399
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !401) #5, !dbg !402
  %seed.promoted9.i = load i64* @seed, align 8, !dbg !403, !tbaa !164
  br label %.preheader3.i, !dbg !402

.preheader3.i:                                    ; preds = %58, %36
  %indvars.iv21.i = phi i64 [ 0, %36 ], [ %indvars.iv.next22.i, %58 ]
  %.lcssa10.i = phi i64 [ %seed.promoted9.i, %36 ], [ %54, %58 ]
  br label %41, !dbg !405

.preheader2.i:                                    ; preds = %58
  %39 = bitcast i8* %37 to double*, !dbg !391
  %40 = bitcast i8* %38 to i32*, !dbg !394
  store i64 %54, i64* @seed, align 8, !dbg !403, !tbaa !164
  tail call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 16000, i32 8, i1 false) #5, !dbg !406
  %scevgep = getelementptr i8* %37, i64 15992
  br label %.preheader.i, !dbg !407

; <label>:41                                      ; preds = %41, %.preheader3.i
  %indvars.iv18.i = phi i64 [ 0, %.preheader3.i ], [ %indvars.iv.next19.i, %41 ]
  %42 = phi i64 [ %.lcssa10.i, %.preheader3.i ], [ %54, %41 ], !dbg !408
  %43 = xor i64 %42, 123459876, !dbg !408
  %44 = sdiv i64 %43, 127773, !dbg !409
  tail call void @llvm.dbg.value(metadata !{i64 %44}, i64 0, metadata !410) #5, !dbg !409
  %45 = mul i64 %44, -127773, !dbg !411
  %46 = add i64 %45, %43, !dbg !411
  %47 = mul nsw i64 %46, 16807, !dbg !411
  %48 = mul i64 %44, -2836, !dbg !411
  %49 = add i64 %47, %48, !dbg !411
  %50 = icmp slt i64 %49, 0, !dbg !412
  %51 = add nsw i64 %49, 2147483647, !dbg !413
  %..i.i = select i1 %50, i64 %51, i64 %49, !dbg !412
  %52 = sitofp i64 %..i.i to double, !dbg !414
  %53 = fmul double %52, 0x3E00000000200FE1, !dbg !414
  tail call void @llvm.dbg.value(metadata !{double %53}, i64 0, metadata !415) #5, !dbg !414
  %54 = xor i64 %..i.i, 123459876, !dbg !403
  %55 = getelementptr inbounds double** %31, i64 %indvars.iv18.i, !dbg !404
  %56 = load double** %55, align 8, !dbg !404, !tbaa !182
  %57 = getelementptr inbounds double* %56, i64 %indvars.iv21.i, !dbg !404
  store double %53, double* %57, align 8, !dbg !404, !tbaa !184
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1, !dbg !405
  %exitcond20.i = icmp eq i64 %indvars.iv.next19.i, 2000, !dbg !405
  br i1 %exitcond20.i, label %58, label %41, !dbg !405

; <label>:58                                      ; preds = %41
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1, !dbg !402
  %exitcond23.i = icmp eq i64 %indvars.iv.next22.i, 2000, !dbg !402
  br i1 %exitcond23.i, label %.preheader2.i, label %.preheader3.i, !dbg !402

.preheader.i:                                     ; preds = %80, %.preheader2.i
  %indvars.iv11.i = phi i64 [ 0, %.preheader2.i ], [ %indvars.iv.next12.i, %80 ]
  %59 = getelementptr inbounds double** %31, i64 %indvars.iv11.i, !dbg !416
  %60 = load double** %59, align 8, !dbg !416, !tbaa !182
  %scevgep26 = getelementptr double* %60, i64 1999
  %scevgep2627 = bitcast double* %scevgep26 to i8*
  %61 = bitcast double* %60 to i8*
  %bound1 = icmp ule i8* %61, %scevgep
  %bound0 = icmp ule i8* %37, %scevgep2627
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader.i, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader.i ], !dbg !417
  %62 = getelementptr inbounds double* %60, i64 %index, !dbg !416
  %63 = bitcast double* %62 to <2 x double>*, !dbg !416
  %wide.load = load <2 x double>* %63, align 8, !dbg !416
  %.sum100 = or i64 %index, 2, !dbg !416
  %64 = getelementptr double* %60, i64 %.sum100, !dbg !416
  %65 = bitcast double* %64 to <2 x double>*, !dbg !416
  %wide.load29 = load <2 x double>* %65, align 8, !dbg !416
  %66 = getelementptr inbounds double* %39, i64 %index, !dbg !416
  %67 = bitcast double* %66 to <2 x double>*, !dbg !416
  %wide.load30 = load <2 x double>* %67, align 8, !dbg !416
  %.sum101 = or i64 %index, 2, !dbg !416
  %68 = getelementptr double* %39, i64 %.sum101, !dbg !416
  %69 = bitcast double* %68 to <2 x double>*, !dbg !416
  %wide.load31 = load <2 x double>* %69, align 8, !dbg !416
  %70 = fadd <2 x double> %wide.load, %wide.load30, !dbg !416
  %71 = fadd <2 x double> %wide.load29, %wide.load31, !dbg !416
  %72 = bitcast double* %66 to <2 x double>*, !dbg !416
  store <2 x double> %70, <2 x double>* %72, align 8, !dbg !416
  %73 = bitcast double* %68 to <2 x double>*, !dbg !416
  store <2 x double> %71, <2 x double>* %73, align 8, !dbg !416
  %index.next = add i64 %index, 4, !dbg !417
  %74 = icmp eq i64 %index.next, 2000, !dbg !417
  br i1 %74, label %middle.block, label %vector.body, !dbg !417, !llvm.loop !418

middle.block:                                     ; preds = %vector.body, %.preheader.i
  %resume.val = phi i1 [ false, %.preheader.i ], [ true, %vector.body ]
  %trunc.resume.val = phi i64 [ 0, %.preheader.i ], [ 2000, %vector.body ]
  br i1 %resume.val, label %80, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph ], [ %trunc.resume.val, %middle.block ]
  %75 = getelementptr inbounds double* %60, i64 %indvars.iv.i, !dbg !416
  %76 = load double* %75, align 8, !dbg !416, !tbaa !184
  %77 = getelementptr inbounds double* %39, i64 %indvars.iv.i, !dbg !416
  %78 = load double* %77, align 8, !dbg !416, !tbaa !184
  %79 = fadd double %76, %78, !dbg !416
  store double %79, double* %77, align 8, !dbg !416, !tbaa !184
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !417
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 2000, !dbg !417
  br i1 %exitcond.i, label %80, label %scalar.ph, !dbg !417, !llvm.loop !419

; <label>:80                                      ; preds = %middle.block, %scalar.ph
  %indvars.iv.next12.i = add nuw nsw i64 %indvars.iv11.i, 1, !dbg !407
  %exitcond13.i = icmp eq i64 %indvars.iv.next12.i, 2000, !dbg !407
  br i1 %exitcond13.i, label %matgen.exit, label %.preheader.i, !dbg !407

matgen.exit:                                      ; preds = %80
  tail call void @dgefa(double** %31, i32* %40), !dbg !420
  tail call void @llvm.dbg.value(metadata !{double** %31}, i64 0, metadata !421), !dbg !423
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !424), !dbg !423
  tail call void @llvm.dbg.value(metadata !{double* %39}, i64 0, metadata !425), !dbg !423
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !426), !dbg !427
  %scevgep38 = getelementptr i8* %37, i64 15992
  br label %81, !dbg !427

; <label>:81                                      ; preds = %daxpy.exit.backedge.i, %matgen.exit
  %indvars.iv19 = phi i32 [ %indvars.iv.next20, %daxpy.exit.backedge.i ], [ 1999, %matgen.exit ]
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %daxpy.exit.backedge.i ], [ 0, %matgen.exit ]
  %82 = shl i64 %indvars.iv16.i, 3, !dbg !428
  %83 = add i64 %82, 8, !dbg !428
  %scevgep37 = getelementptr i8* %37, i64 %83
  %84 = add i64 %indvars.iv16.i, 1, !dbg !428
  %85 = sub i64 1999, %indvars.iv16.i, !dbg !428
  %86 = getelementptr inbounds i32* %40, i64 %indvars.iv16.i, !dbg !428
  %87 = load i32* %86, align 4, !dbg !428, !tbaa !284
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !429), !dbg !428
  %88 = sext i32 %87 to i64, !dbg !430
  %89 = getelementptr inbounds double* %39, i64 %88, !dbg !430
  %90 = load double* %89, align 8, !dbg !430, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double %90}, i64 0, metadata !431), !dbg !430
  %91 = trunc i64 %indvars.iv16.i to i32, !dbg !432
  %92 = icmp eq i32 %87, %91, !dbg !432
  br i1 %92, label %96, label %93, !dbg !432

; <label>:93                                      ; preds = %81
  %94 = getelementptr inbounds double* %39, i64 %indvars.iv16.i, !dbg !433
  %95 = load double* %94, align 8, !dbg !433, !tbaa !184
  store double %95, double* %89, align 8, !dbg !433, !tbaa !184
  store double %90, double* %94, align 8, !dbg !434, !tbaa !184
  br label %96, !dbg !435

; <label>:96                                      ; preds = %93, %81
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1, !dbg !427
  %97 = getelementptr inbounds double** %31, i64 %indvars.iv16.i, !dbg !436
  %98 = load double** %97, align 8, !dbg !436, !tbaa !182
  tail call void @llvm.dbg.value(metadata !{double %90}, i64 0, metadata !437), !dbg !438
  tail call void @llvm.dbg.value(metadata !{double* %98}, i64 0, metadata !439), !dbg !438
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !440), !dbg !438
  tail call void @llvm.dbg.value(metadata !{double* %39}, i64 0, metadata !441), !dbg !438
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !442), !dbg !438
  %99 = fcmp une double %90, 0.000000e+00, !dbg !443
  br i1 %99, label %.preheader.preheader, label %daxpy.exit.backedge.i, !dbg !443

.preheader.preheader:                             ; preds = %96
  %n.vec = and i64 %85, -4, !dbg !444
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !444
  br i1 %cmp.zero, label %middle.block34, label %vector.memcheck47

vector.memcheck47:                                ; preds = %.preheader.preheader
  %scevgep41 = getelementptr double* %98, i64 1999
  %scevgep39 = getelementptr double* %98, i64 %84
  %scevgep4142 = bitcast double* %scevgep41 to i8*
  %scevgep3940 = bitcast double* %scevgep39 to i8*
  %bound144 = icmp ule i8* %scevgep3940, %scevgep38
  %bound043 = icmp ule i8* %scevgep37, %scevgep4142
  %memcheck.conflict46 = and i1 %bound043, %bound144
  br i1 %memcheck.conflict46, label %middle.block34, label %vector.ph32

vector.ph32:                                      ; preds = %vector.memcheck47
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %90, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body33

vector.body33:                                    ; preds = %vector.body33, %vector.ph32
  %index36 = phi i64 [ 0, %vector.ph32 ], [ %index.next51, %vector.body33 ], !dbg !444
  %100 = add i64 %index36, %indvars.iv.next17.i, !dbg !445
  %101 = getelementptr inbounds double* %98, i64 %100, !dbg !445
  %102 = bitcast double* %101 to <2 x double>*, !dbg !445
  %wide.load58 = load <2 x double>* %102, align 8, !dbg !445
  %.sum = add i64 %100, 2, !dbg !445
  %103 = getelementptr double* %98, i64 %.sum, !dbg !445
  %104 = bitcast double* %103 to <2 x double>*, !dbg !445
  %wide.load59 = load <2 x double>* %104, align 8, !dbg !445
  %105 = fmul <2 x double> %broadcast.splat61, %wide.load58, !dbg !445
  %106 = fmul <2 x double> %broadcast.splat61, %wide.load59, !dbg !445
  %107 = getelementptr inbounds double* %39, i64 %100, !dbg !445
  %108 = bitcast double* %107 to <2 x double>*, !dbg !445
  %wide.load62 = load <2 x double>* %108, align 8, !dbg !445
  %.sum104 = add i64 %100, 2, !dbg !445
  %109 = getelementptr double* %39, i64 %.sum104, !dbg !445
  %110 = bitcast double* %109 to <2 x double>*, !dbg !445
  %wide.load63 = load <2 x double>* %110, align 8, !dbg !445
  %111 = fadd <2 x double> %wide.load62, %105, !dbg !445
  %112 = fadd <2 x double> %wide.load63, %106, !dbg !445
  %113 = bitcast double* %107 to <2 x double>*, !dbg !445
  store <2 x double> %111, <2 x double>* %113, align 8, !dbg !445
  %114 = bitcast double* %109 to <2 x double>*, !dbg !445
  store <2 x double> %112, <2 x double>* %114, align 8, !dbg !445
  %index.next51 = add i64 %index36, 4, !dbg !444
  %115 = icmp eq i64 %index.next51, %n.vec, !dbg !444
  br i1 %115, label %middle.block34, label %vector.body33, !dbg !444, !llvm.loop !446

middle.block34:                                   ; preds = %vector.body33, %vector.memcheck47, %.preheader.preheader
  %resume.val48 = phi i64 [ 0, %.preheader.preheader ], [ 0, %vector.memcheck47 ], [ %n.vec, %vector.body33 ]
  %cmp.n50 = icmp eq i64 %85, %resume.val48
  br i1 %cmp.n50, label %daxpy.exit.backedge.i, label %.preheader

daxpy.exit.backedge.i:                            ; preds = %.preheader, %middle.block34, %96
  %indvars.iv.next20 = add i32 %indvars.iv19, -1, !dbg !427
  %exitcond18.i = icmp eq i64 %indvars.iv.next17.i, 1999, !dbg !427
  br i1 %exitcond18.i, label %daxpy.exit6.preheader.i, label %81, !dbg !427

.preheader:                                       ; preds = %middle.block34, %.preheader
  %indvars.iv13.i.i = phi i64 [ %indvars.iv.next14.i.i, %.preheader ], [ %resume.val48, %middle.block34 ]
  %116 = add nsw i64 %indvars.iv13.i.i, %indvars.iv.next17.i, !dbg !445
  %117 = getelementptr inbounds double* %98, i64 %116, !dbg !445
  %118 = load double* %117, align 8, !dbg !445, !tbaa !184
  %119 = fmul double %90, %118, !dbg !445
  %120 = getelementptr inbounds double* %39, i64 %116, !dbg !445
  %121 = load double* %120, align 8, !dbg !445, !tbaa !184
  %122 = fadd double %121, %119, !dbg !445
  store double %122, double* %120, align 8, !dbg !445, !tbaa !184
  %indvars.iv.next14.i.i = add nuw nsw i64 %indvars.iv13.i.i, 1, !dbg !444
  %lftr.wideiv21 = trunc i64 %indvars.iv.next14.i.i to i32, !dbg !444
  %exitcond22 = icmp eq i32 %lftr.wideiv21, %indvars.iv19, !dbg !444
  br i1 %exitcond22, label %daxpy.exit.backedge.i, label %.preheader, !dbg !444, !llvm.loop !447

daxpy.exit6.preheader.i:                          ; preds = %daxpy.exit.backedge.i, %daxpy.exit6.backedge.i
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %daxpy.exit6.backedge.i ], [ 1999, %daxpy.exit.backedge.i ]
  %indvars.iv9.i = phi i64 [ %indvars.iv.next10.i, %daxpy.exit6.backedge.i ], [ 0, %daxpy.exit.backedge.i ]
  %123 = sub i64 1998, %indvars.iv9.i, !dbg !448
  %124 = and i64 %123, 4294967295
  %125 = sub i64 1998, %indvars.iv9.i, !dbg !448
  %126 = and i64 %125, 4294967295
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 1, !dbg !448
  %127 = sub i64 1999, %indvars.iv9.i, !dbg !449
  %128 = getelementptr inbounds double** %31, i64 %127, !dbg !450
  %129 = load double** %128, align 8, !dbg !450, !tbaa !182
  %130 = getelementptr inbounds double* %129, i64 %127, !dbg !450
  %131 = load double* %130, align 8, !dbg !450, !tbaa !184
  %132 = getelementptr inbounds double* %39, i64 %127, !dbg !450
  %133 = load double* %132, align 8, !dbg !450, !tbaa !184
  %134 = fdiv double %133, %131, !dbg !450
  store double %134, double* %132, align 8, !dbg !450, !tbaa !184
  tail call void @llvm.dbg.value(metadata !{double* %129}, i64 0, metadata !451), !dbg !453
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !454), !dbg !453
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !455), !dbg !453
  tail call void @llvm.dbg.value(metadata !{double* %39}, i64 0, metadata !456), !dbg !453
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !457), !dbg !453
  tail call void @llvm.dbg.value(metadata !210, i64 0, metadata !458), !dbg !453
  %135 = trunc i64 %127 to i32, !dbg !459
  %136 = icmp sgt i32 %135, 0, !dbg !459
  %137 = fcmp une double %134, -0.000000e+00, !dbg !459
  %or.cond.i1.i = and i1 %136, %137, !dbg !459
  br i1 %or.cond.i1.i, label %.preheader.i9.preheader, label %daxpy.exit6.backedge.i, !dbg !459

.preheader.i9.preheader:                          ; preds = %daxpy.exit6.preheader.i
  %138 = add i64 %126, 1, !dbg !448
  %end.idx71 = add i64 %126, 1, !dbg !460
  %fold = add i64 %125, 1, !dbg !460
  %n.mod.vf72 = and i64 %fold, 3, !dbg !460
  %n.vec73 = sub i64 %138, %n.mod.vf72, !dbg !460
  %cmp.zero75 = icmp eq i64 %138, %n.mod.vf72, !dbg !460
  br i1 %cmp.zero75, label %middle.block68, label %vector.memcheck83

vector.memcheck83:                                ; preds = %.preheader.i9.preheader
  %scevgep77 = getelementptr double* %129, i64 %124
  %139 = shl nuw nsw i64 %124, 3, !dbg !448
  %scevgep7778 = bitcast double* %scevgep77 to i8*
  %scevgep76 = getelementptr i8* %37, i64 %139
  %140 = bitcast double* %129 to i8*
  %bound180 = icmp ule i8* %140, %scevgep76
  %bound079 = icmp ule i8* %37, %scevgep7778
  %memcheck.conflict82 = and i1 %bound079, %bound180
  br i1 %memcheck.conflict82, label %middle.block68, label %vector.ph66

vector.ph66:                                      ; preds = %vector.memcheck83
  %broadcast.splatinsert94 = insertelement <2 x double> undef, double %134, i32 0
  %broadcast.splat95 = shufflevector <2 x double> %broadcast.splatinsert94, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67, %vector.ph66
  %index70 = phi i64 [ 0, %vector.ph66 ], [ %index.next87, %vector.body67 ], !dbg !460
  %141 = getelementptr inbounds double* %129, i64 %index70, !dbg !461
  %142 = bitcast double* %141 to <2 x double>*, !dbg !461
  %wide.load92 = load <2 x double>* %142, align 8, !dbg !461
  %.sum102 = or i64 %index70, 2, !dbg !461
  %143 = getelementptr double* %129, i64 %.sum102, !dbg !461
  %144 = bitcast double* %143 to <2 x double>*, !dbg !461
  %wide.load93 = load <2 x double>* %144, align 8, !dbg !461
  %145 = fmul <2 x double> %broadcast.splat95, %wide.load92, !dbg !461
  %146 = fmul <2 x double> %broadcast.splat95, %wide.load93, !dbg !461
  %147 = getelementptr inbounds double* %39, i64 %index70, !dbg !461
  %148 = bitcast double* %147 to <2 x double>*, !dbg !461
  %wide.load96 = load <2 x double>* %148, align 8, !dbg !461
  %.sum103 = or i64 %index70, 2, !dbg !461
  %149 = getelementptr double* %39, i64 %.sum103, !dbg !461
  %150 = bitcast double* %149 to <2 x double>*, !dbg !461
  %wide.load97 = load <2 x double>* %150, align 8, !dbg !461
  %151 = fsub <2 x double> %wide.load96, %145, !dbg !461
  %152 = fsub <2 x double> %wide.load97, %146, !dbg !461
  %153 = bitcast double* %147 to <2 x double>*, !dbg !461
  store <2 x double> %151, <2 x double>* %153, align 8, !dbg !461
  %154 = bitcast double* %149 to <2 x double>*, !dbg !461
  store <2 x double> %152, <2 x double>* %154, align 8, !dbg !461
  %index.next87 = add i64 %index70, 4, !dbg !460
  %155 = icmp eq i64 %index.next87, %n.vec73, !dbg !460
  br i1 %155, label %middle.block68, label %vector.body67, !dbg !460, !llvm.loop !462

middle.block68:                                   ; preds = %vector.body67, %vector.memcheck83, %.preheader.i9.preheader
  %resume.val84 = phi i64 [ 0, %.preheader.i9.preheader ], [ 0, %vector.memcheck83 ], [ %n.vec73, %vector.body67 ]
  %cmp.n86 = icmp eq i64 %end.idx71, %resume.val84
  br i1 %cmp.n86, label %daxpy.exit6.backedge.i, label %.preheader.i9

daxpy.exit6.backedge.i:                           ; preds = %.preheader.i9, %middle.block68, %daxpy.exit6.preheader.i
  %indvars.iv.next17 = add i32 %indvars.iv16, -1, !dbg !448
  %exitcond11.i = icmp eq i64 %indvars.iv.next10.i, 2000, !dbg !448
  br i1 %exitcond11.i, label %dgesl.exit, label %daxpy.exit6.preheader.i, !dbg !448

.preheader.i9:                                    ; preds = %middle.block68, %.preheader.i9
  %indvars.iv13.i2.i = phi i64 [ %indvars.iv.next14.i3.i, %.preheader.i9 ], [ %resume.val84, %middle.block68 ]
  %156 = getelementptr inbounds double* %129, i64 %indvars.iv13.i2.i, !dbg !461
  %157 = load double* %156, align 8, !dbg !461, !tbaa !184
  %158 = fmul double %134, %157, !dbg !461
  %159 = getelementptr inbounds double* %39, i64 %indvars.iv13.i2.i, !dbg !461
  %160 = load double* %159, align 8, !dbg !461, !tbaa !184
  %161 = fsub double %160, %158, !dbg !461
  store double %161, double* %159, align 8, !dbg !461, !tbaa !184
  %indvars.iv.next14.i3.i = add nuw nsw i64 %indvars.iv13.i2.i, 1, !dbg !460
  %lftr.wideiv = trunc i64 %indvars.iv.next14.i3.i to i32, !dbg !460
  %exitcond18 = icmp eq i32 %lftr.wideiv, %indvars.iv16, !dbg !460
  br i1 %exitcond18, label %daxpy.exit6.backedge.i, label %.preheader.i9, !dbg !460, !llvm.loop !463

dgesl.exit:                                       ; preds = %daxpy.exit6.backedge.i
  tail call void @llvm.dbg.value(metadata !464, i64 0, metadata !132), !dbg !465
  tail call void @free(i8* %38) #5, !dbg !466
  tail call void @free(i8* %37) #5, !dbg !467
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !107), !dbg !468
  br label %162, !dbg !468

; <label>:162                                     ; preds = %162, %dgesl.exit
  %indvars.iv = phi i64 [ 0, %dgesl.exit ], [ %indvars.iv.next, %162 ]
  %163 = getelementptr inbounds double** %31, i64 %indvars.iv, !dbg !470
  %164 = load double** %163, align 8, !dbg !470, !tbaa !182
  %165 = bitcast double* %164 to i8*, !dbg !470
  tail call void @free(i8* %165) #5, !dbg !470
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !468
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !468
  br i1 %exitcond, label %166, label %162, !dbg !468

; <label>:166                                     ; preds = %162
  tail call void @free(i8* %30) #5, !dbg !471
  %167 = load %struct._IO_FILE** @stdout, align 8, !dbg !472, !tbaa !182
  br i1 %ga_testing.0, label %168, label %170, !dbg !474

; <label>:168                                     ; preds = %166
  %169 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), double 0.000000e+00) #5, !dbg !472
  br label %172, !dbg !472

; <label>:170                                     ; preds = %166
  %171 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), double 0.000000e+00) #5, !dbg !475
  br label %172

; <label>:172                                     ; preds = %170, %168
  %173 = load %struct._IO_FILE** @stdout, align 8, !dbg !476, !tbaa !182
  %174 = tail call i32 @fflush(%struct._IO_FILE* %173) #5, !dbg !476
  ret i32 0, !dbg !477
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!154, !155}
!llvm.ident = !{!156}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !140, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lpbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !17, metadata !30, metadata !45, metadata !64, metadata !84, metadata !98, metadata !133}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"matgen", metadata !"matgen", metadata !"", i32 93, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double**, double*)* @matgen, null, null, metadata !11, i32 94} ; [ DW_TAG_subprogram ] [line 93] [def] [scope 94] [matgen]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!10 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !16}
!12 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777309, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 93]
!13 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554525, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 93]
!14 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 96, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 96]
!15 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!16 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 96, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 96]
!17 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"idamax", metadata !"idamax", metadata !"", i32 111, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, double*, i32, i32)* @idamax, null, null, metadata !20, i32 112} ; [ DW_TAG_subprogram ] [line 111] [def] [scope 112] [idamax]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !15, metadata !15, metadata !9, metadata !15, metadata !15}
!20 = metadata !{metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29}
!21 = metadata !{i32 786689, metadata !17, metadata !"n", metadata !5, i32 16777327, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 111]
!22 = metadata !{i32 786689, metadata !17, metadata !"dx", metadata !5, i32 33554543, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 111]
!23 = metadata !{i32 786689, metadata !17, metadata !"dx_off", metadata !5, i32 50331759, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 111]
!24 = metadata !{i32 786689, metadata !17, metadata !"incx", metadata !5, i32 67108975, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 111]
!25 = metadata !{i32 786688, metadata !17, metadata !"dmax", metadata !5, i32 113, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dmax] [line 113]
!26 = metadata !{i32 786688, metadata !17, metadata !"dtemp", metadata !5, i32 113, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dtemp] [line 113]
!27 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 114, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 114]
!28 = metadata !{i32 786688, metadata !17, metadata !"ix", metadata !5, i32 114, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ix] [line 114]
!29 = metadata !{i32 786688, metadata !17, metadata !"itemp", metadata !5, i32 114, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [itemp] [line 114]
!30 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dscal", metadata !"dscal", metadata !"", i32 205, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double, double*, i32, i32)* @dscal, null, null, metadata !33, i32 206} ; [ DW_TAG_subprogram ] [line 205] [def] [scope 206] [dscal]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{null, metadata !15, metadata !10, metadata !9, metadata !15, metadata !15}
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40}
!34 = metadata !{i32 786689, metadata !30, metadata !"n", metadata !5, i32 16777421, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 205]
!35 = metadata !{i32 786689, metadata !30, metadata !"da", metadata !5, i32 33554637, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [da] [line 205]
!36 = metadata !{i32 786689, metadata !30, metadata !"dx", metadata !5, i32 50331853, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!37 = metadata !{i32 786689, metadata !30, metadata !"dx_off", metadata !5, i32 67109069, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 205]
!38 = metadata !{i32 786689, metadata !30, metadata !"incx", metadata !5, i32 83886285, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!39 = metadata !{i32 786688, metadata !30, metadata !"i", metadata !5, i32 207, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 207]
!40 = metadata !{i32 786688, metadata !41, metadata !"nincx", metadata !5, i32 214, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nincx] [line 214]
!41 = metadata !{i32 786443, metadata !1, metadata !42, i32 212, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!42 = metadata !{i32 786443, metadata !1, metadata !43, i32 211, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!43 = metadata !{i32 786443, metadata !1, metadata !44, i32 210, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!44 = metadata !{i32 786443, metadata !1, metadata !30, i32 209, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!45 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"daxpy", metadata !"daxpy", metadata !"", i32 229, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double, double*, i32, i32, double*, i32, i32)* @daxpy, null, null, metadata !48, i32 230} ; [ DW_TAG_subprogram ] [line 229] [def] [scope 230] [daxpy]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{null, metadata !15, metadata !10, metadata !9, metadata !15, metadata !15, metadata !9, metadata !15, metadata !15}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !63}
!49 = metadata !{i32 786689, metadata !45, metadata !"n", metadata !5, i32 16777445, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 229]
!50 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [da] [line 229]
!51 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!52 = metadata !{i32 786689, metadata !45, metadata !"dx_off", metadata !5, i32 67109093, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!53 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!54 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!55 = metadata !{i32 786689, metadata !45, metadata !"dy_off", metadata !5, i32 117440741, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!56 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!57 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !5, i32 231, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 231]
!58 = metadata !{i32 786688, metadata !59, metadata !"ix", metadata !5, i32 238, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ix] [line 238]
!59 = metadata !{i32 786443, metadata !1, metadata !60, i32 236, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!60 = metadata !{i32 786443, metadata !1, metadata !61, i32 235, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 234, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!62 = metadata !{i32 786443, metadata !1, metadata !45, i32 233, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!63 = metadata !{i32 786688, metadata !59, metadata !"iy", metadata !5, i32 239, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iy] [line 239]
!64 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dgefa", metadata !"dgefa", metadata !"", i32 266, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double**, i32*)* @dgefa, null, null, metadata !68, i32 267} ; [ DW_TAG_subprogram ] [line 266] [def] [scope 267] [dgefa]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{null, metadata !8, metadata !67}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!68 = metadata !{metadata !69, metadata !70, metadata !71, metadata !72, metadata !73, metadata !74, metadata !77, metadata !78, metadata !79}
!69 = metadata !{i32 786689, metadata !64, metadata !"a", metadata !5, i32 16777482, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 266]
!70 = metadata !{i32 786689, metadata !64, metadata !"ipvt", metadata !5, i32 33554698, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 266]
!71 = metadata !{i32 786688, metadata !64, metadata !"temp", metadata !5, i32 268, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 268]
!72 = metadata !{i32 786688, metadata !64, metadata !"k", metadata !5, i32 269, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 269]
!73 = metadata !{i32 786688, metadata !64, metadata !"j", metadata !5, i32 269, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 269]
!74 = metadata !{i32 786688, metadata !75, metadata !"col_k", metadata !5, i32 273, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col_k] [line 273]
!75 = metadata !{i32 786443, metadata !1, metadata !76, i32 272, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!76 = metadata !{i32 786443, metadata !1, metadata !64, i32 271, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!77 = metadata !{i32 786688, metadata !75, metadata !"kp1", metadata !5, i32 274, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kp1] [line 274]
!78 = metadata !{i32 786688, metadata !75, metadata !"l", metadata !5, i32 277, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 277]
!79 = metadata !{i32 786688, metadata !80, metadata !"col_j", metadata !5, i32 298, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [col_j] [line 298]
!80 = metadata !{i32 786443, metadata !1, metadata !81, i32 297, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!81 = metadata !{i32 786443, metadata !1, metadata !82, i32 296, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!82 = metadata !{i32 786443, metadata !1, metadata !83, i32 282, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!83 = metadata !{i32 786443, metadata !1, metadata !75, i32 281, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!84 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"dgesl", metadata !"dgesl", metadata !"", i32 317, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (double**, i32*, double*)* @dgesl, null, null, metadata !87, i32 318} ; [ DW_TAG_subprogram ] [line 317] [def] [scope 318] [dgesl]
!85 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = metadata !{null, metadata !8, metadata !67, metadata !9}
!87 = metadata !{metadata !88, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !94, metadata !97}
!88 = metadata !{i32 786689, metadata !84, metadata !"a", metadata !5, i32 16777533, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 317]
!89 = metadata !{i32 786689, metadata !84, metadata !"ipvt", metadata !5, i32 33554749, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ipvt] [line 317]
!90 = metadata !{i32 786689, metadata !84, metadata !"b", metadata !5, i32 50331965, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 317]
!91 = metadata !{i32 786688, metadata !84, metadata !"t", metadata !5, i32 319, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 319]
!92 = metadata !{i32 786688, metadata !84, metadata !"k", metadata !5, i32 320, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 320]
!93 = metadata !{i32 786688, metadata !84, metadata !"kb", metadata !5, i32 320, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kb] [line 320]
!94 = metadata !{i32 786688, metadata !95, metadata !"l", metadata !5, i32 325, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 325]
!95 = metadata !{i32 786443, metadata !1, metadata !96, i32 324, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!96 = metadata !{i32 786443, metadata !1, metadata !84, i32 323, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!97 = metadata !{i32 786688, metadata !95, metadata !"kp1", metadata !5, i32 334, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kp1] [line 334]
!98 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 348, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !104, i32 349} ; [ DW_TAG_subprogram ] [line 348] [def] [scope 349] [main]
!99 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = metadata !{metadata !15, metadata !15, metadata !101}
!101 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !102} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!102 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!103 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !108, metadata !110, metadata !120, metadata !121, metadata !126, metadata !127, metadata !128, metadata !129, metadata !130, metadata !131, metadata !132}
!105 = metadata !{i32 786689, metadata !98, metadata !"argc", metadata !5, i32 16777564, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 348]
!106 = metadata !{i32 786689, metadata !98, metadata !"argv", metadata !5, i32 33554780, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 348]
!107 = metadata !{i32 786688, metadata !98, metadata !"i", metadata !5, i32 350, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 350]
!108 = metadata !{i32 786688, metadata !98, metadata !"ga_testing", metadata !5, i32 353, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 353]
!109 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!110 = metadata !{i32 786688, metadata !111, metadata !"__s1_len", metadata !5, i32 359, metadata !117, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 359]
!111 = metadata !{i32 786443, metadata !1, metadata !112, i32 359, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!112 = metadata !{i32 786443, metadata !1, metadata !113, i32 359, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!113 = metadata !{i32 786443, metadata !1, metadata !114, i32 358, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!114 = metadata !{i32 786443, metadata !1, metadata !115, i32 357, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!115 = metadata !{i32 786443, metadata !1, metadata !116, i32 356, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!116 = metadata !{i32 786443, metadata !1, metadata !98, i32 355, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!117 = metadata !{i32 786454, metadata !118, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !119} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!118 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!119 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!120 = metadata !{i32 786688, metadata !111, metadata !"__s2_len", metadata !5, i32 359, metadata !117, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 359]
!121 = metadata !{i32 786688, metadata !122, metadata !"__s2", metadata !5, i32 359, metadata !123, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2] [line 359]
!122 = metadata !{i32 786443, metadata !1, metadata !111, i32 359, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!123 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!124 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !125} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!125 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!126 = metadata !{i32 786688, metadata !122, metadata !"__result", metadata !5, i32 359, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__result] [line 359]
!127 = metadata !{i32 786688, metadata !98, metadata !"a", metadata !5, i32 367, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 367]
!128 = metadata !{i32 786688, metadata !98, metadata !"b", metadata !5, i32 372, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 372]
!129 = metadata !{i32 786688, metadata !98, metadata !"x", metadata !5, i32 373, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 373]
!130 = metadata !{i32 786688, metadata !98, metadata !"ipvt", metadata !5, i32 374, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ipvt] [line 374]
!131 = metadata !{i32 786688, metadata !98, metadata !"ops", metadata !5, i32 377, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ops] [line 377]
!132 = metadata !{i32 786688, metadata !98, metadata !"run_time", metadata !5, i32 392, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 392]
!133 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random_double", metadata !"random_double", metadata !"", i32 52, metadata !134, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !136, i32 53} ; [ DW_TAG_subprogram ] [line 52] [local] [def] [scope 53] [random_double]
!134 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !10}
!136 = metadata !{metadata !137, metadata !139}
!137 = metadata !{i32 786688, metadata !133, metadata !"k", metadata !5, i32 54, metadata !138, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 54]
!138 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!139 = metadata !{i32 786688, metadata !133, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 55]
!140 = metadata !{metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !143, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !143, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !144, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !141, metadata !145, metadata !147, metadata !148, metadata !147, metadata !149, metadata !150, metadata !151, metadata !145, metadata !153}
!141 = metadata !{i32 786484, i32 0, metadata !5, metadata !"N", metadata !"N", metadata !"N", metadata !5, i32 86, metadata !142, i32 1, i32 1, i32 2000, null} ; [ DW_TAG_variable ] [N] [line 86] [local] [def]
!142 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!143 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NM1", metadata !"NM1", metadata !"NM1", metadata !5, i32 87, metadata !142, i32 1, i32 1, i32 1999, null} ; [ DW_TAG_variable ] [NM1] [line 87] [local] [def]
!144 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NP1", metadata !"NP1", metadata !"NP1", metadata !5, i32 88, metadata !142, i32 1, i32 1, i32 2001, null} ; [ DW_TAG_variable ] [NP1] [line 88] [local] [def]
!145 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 50, metadata !146, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 50] [local] [def]
!146 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!147 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 48, metadata !146, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 48] [local] [def]
!148 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 45, metadata !146, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 45] [local] [def]
!149 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 49, metadata !146, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 49] [local] [def]
!150 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 46, metadata !146, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 46] [local] [def]
!151 = metadata !{i32 786484, i32 0, metadata !5, metadata !"AM", metadata !"AM", metadata !"AM", metadata !5, i32 47, metadata !152, i32 1, i32 1, double 0x3E00000000200FE1, null} ; [ DW_TAG_variable ] [AM] [line 47] [local] [def]
!152 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!153 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 44, metadata !138, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 44] [local] [def]
!154 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!155 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!156 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!157 = metadata !{i32 93, i32 0, metadata !4, null}
!158 = metadata !{i32 0}
!159 = metadata !{i32 98, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !4, i32 98, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!161 = metadata !{i32 65, i32 0, metadata !133, metadata !162}
!162 = metadata !{i32 100, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !1, metadata !160, i32 99, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!164 = metadata !{metadata !165, metadata !165, i64 0}
!165 = metadata !{metadata !"long", metadata !166, i64 0}
!166 = metadata !{metadata !"omnipotent char", metadata !167, i64 0}
!167 = metadata !{metadata !"Simple C/C++ TBAA"}
!168 = metadata !{i32 99, i32 0, metadata !163, null}
!169 = metadata !{i32 103, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!171 = metadata !{i32 105, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!173 = metadata !{i32 57, i32 0, metadata !133, metadata !162}
!174 = metadata !{i32 58, i32 0, metadata !133, metadata !162} ; [ DW_TAG_imported_module ]
!175 = metadata !{i32 786688, metadata !133, metadata !"k", metadata !5, i32 54, metadata !138, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [k] [line 54]
!176 = metadata !{i32 59, i32 0, metadata !133, metadata !162}
!177 = metadata !{i32 61, i32 0, metadata !178, metadata !162}
!178 = metadata !{i32 786443, metadata !1, metadata !133, i32 61, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!179 = metadata !{i32 62, i32 0, metadata !178, metadata !162}
!180 = metadata !{i32 64, i32 0, metadata !133, metadata !162}
!181 = metadata !{i32 786688, metadata !133, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, metadata !162} ; [ DW_TAG_auto_variable ] [result] [line 55]
!182 = metadata !{metadata !183, metadata !183, i64 0}
!183 = metadata !{metadata !"any pointer", metadata !166, i64 0}
!184 = metadata !{metadata !185, metadata !185, i64 0}
!185 = metadata !{metadata !"double", metadata !166, i64 0}
!186 = metadata !{i32 107, i32 0, metadata !187, null}
!187 = metadata !{i32 786443, metadata !1, metadata !172, i32 106, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!188 = metadata !{i32 106, i32 0, metadata !187, null}
!189 = metadata !{metadata !189, metadata !190, metadata !191}
!190 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!191 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!192 = metadata !{metadata !192, metadata !190, metadata !191}
!193 = metadata !{i32 108, i32 0, metadata !4, null}
!194 = metadata !{i32 111, i32 0, metadata !17, null}
!195 = metadata !{i32 114, i32 0, metadata !17, null}
!196 = metadata !{i32 116, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !17, i32 116, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!198 = metadata !{i32 120, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !1, metadata !200, i32 120, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!200 = metadata !{i32 786443, metadata !1, metadata !197, i32 119, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!201 = metadata !{i32 124, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !203, i32 124, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!203 = metadata !{i32 786443, metadata !1, metadata !199, i32 123, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!204 = metadata !{i32 147, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !202, i32 144, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!206 = metadata !{i32 149, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 149, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!208 = metadata !{i32 128, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !202, i32 125, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!210 = metadata !{i32 1}
!211 = metadata !{i32 130, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !209, i32 130, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!213 = metadata !{i32 132, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !212, i32 131, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!215 = metadata !{i32 134, i32 0, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !214, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!217 = metadata !{i32 136, i32 0, metadata !218, null}
!218 = metadata !{i32 786443, metadata !1, metadata !216, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!219 = metadata !{i32 137, i32 0, metadata !218, null}
!220 = metadata !{i32 151, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !207, i32 150, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!222 = metadata !{i32 153, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !1, metadata !221, i32 153, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!224 = metadata !{i32 undef}
!225 = metadata !{i32 155, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !1, metadata !223, i32 154, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!227 = metadata !{i32 156, i32 0, metadata !226, null}
!228 = metadata !{i32 163, i32 0, metadata !17, null}
!229 = metadata !{i32 205, i32 0, metadata !30, null}
!230 = metadata !{i32 209, i32 0, metadata !44, null}
!231 = metadata !{i32 211, i32 0, metadata !42, null}
!232 = metadata !{i32 222, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !234, i32 222, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!234 = metadata !{i32 786443, metadata !1, metadata !42, i32 220, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!235 = metadata !{i32 223, i32 0, metadata !233, null}
!236 = metadata !{metadata !236, metadata !190, metadata !191}
!237 = metadata !{i32 214, i32 0, metadata !41, null}
!238 = metadata !{i32 216, i32 0, metadata !239, null}
!239 = metadata !{i32 786443, metadata !1, metadata !41, i32 216, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!240 = metadata !{i32 217, i32 0, metadata !239, null}
!241 = metadata !{metadata !241, metadata !190, metadata !191}
!242 = metadata !{i32 226, i32 0, metadata !30, null}
!243 = metadata !{i32 229, i32 0, metadata !45, null}
!244 = metadata !{i32 233, i32 0, metadata !62, null}
!245 = metadata !{i32 235, i32 0, metadata !60, null}
!246 = metadata !{i32 259, i32 0, metadata !247, null}
!247 = metadata !{i32 786443, metadata !1, metadata !248, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!248 = metadata !{i32 786443, metadata !1, metadata !60, i32 257, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!249 = metadata !{i32 260, i32 0, metadata !247, null}
!250 = metadata !{metadata !250, metadata !190, metadata !191}
!251 = metadata !{i32 238, i32 0, metadata !59, null}
!252 = metadata !{i32 239, i32 0, metadata !59, null}
!253 = metadata !{i32 241, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !1, metadata !59, i32 241, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!255 = metadata !{i32 242, i32 0, metadata !254, null}
!256 = metadata !{i32 244, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !59, i32 244, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!258 = metadata !{i32 245, i32 0, metadata !257, null}
!259 = metadata !{i32 247, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !59, i32 247, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!261 = metadata !{i32 249, i32 0, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !260, i32 248, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!263 = metadata !{metadata !263, metadata !190, metadata !191}
!264 = metadata !{i32 263, i32 0, metadata !45, null}
!265 = metadata !{i32 266, i32 0, metadata !64, null}
!266 = metadata !{i32 271, i32 0, metadata !76, null}
!267 = metadata !{i32 273, i32 0, metadata !75, null}
!268 = metadata !{i32 786689, metadata !17, metadata !"dx", metadata !5, i32 33554543, metadata !9, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [dx] [line 111]
!269 = metadata !{i32 277, i32 0, metadata !75, null}
!270 = metadata !{i32 111, i32 0, metadata !17, metadata !269}
!271 = metadata !{i32 786689, metadata !17, metadata !"dx_off", metadata !5, i32 50331759, metadata !15, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [dx_off] [line 111]
!272 = metadata !{i32 786689, metadata !17, metadata !"incx", metadata !5, i32 67108975, metadata !15, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [incx] [line 111]
!273 = metadata !{i32 786688, metadata !17, metadata !"itemp", metadata !5, i32 114, metadata !15, i32 0, metadata !269} ; [ DW_TAG_auto_variable ] [itemp] [line 114]
!274 = metadata !{i32 114, i32 0, metadata !17, metadata !269}
!275 = metadata !{i32 147, i32 0, metadata !205, metadata !269}
!276 = metadata !{i32 786688, metadata !17, metadata !"dmax", metadata !5, i32 113, metadata !10, i32 0, metadata !269} ; [ DW_TAG_auto_variable ] [dmax] [line 113]
!277 = metadata !{i32 151, i32 0, metadata !221, metadata !269}
!278 = metadata !{i32 786688, metadata !17, metadata !"dtemp", metadata !5, i32 113, metadata !10, i32 0, metadata !269} ; [ DW_TAG_auto_variable ] [dtemp] [line 113]
!279 = metadata !{i32 153, i32 0, metadata !223, metadata !269}
!280 = metadata !{i32 155, i32 0, metadata !226, metadata !269}
!281 = metadata !{i32 156, i32 0, metadata !226, metadata !269}
!282 = metadata !{i32 149, i32 0, metadata !207, metadata !269}
!283 = metadata !{i32 278, i32 0, metadata !75, null}
!284 = metadata !{metadata !285, metadata !285, i64 0}
!285 = metadata !{metadata !"int", metadata !166, i64 0}
!286 = metadata !{i32 281, i32 0, metadata !83, null}
!287 = metadata !{i32 284, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !82, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!289 = metadata !{i32 287, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !288, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!291 = metadata !{i32 286, i32 0, metadata !290, null}
!292 = metadata !{i32 288, i32 0, metadata !290, null}
!293 = metadata !{i32 289, i32 0, metadata !290, null}
!294 = metadata !{i32 292, i32 0, metadata !82, null}
!295 = metadata !{i32 786689, metadata !30, metadata !"da", metadata !5, i32 33554637, metadata !10, i32 0, metadata !296} ; [ DW_TAG_arg_variable ] [da] [line 205]
!296 = metadata !{i32 293, i32 0, metadata !82, null}
!297 = metadata !{i32 205, i32 0, metadata !30, metadata !296}
!298 = metadata !{i32 786689, metadata !30, metadata !"dx", metadata !5, i32 50331853, metadata !9, i32 0, metadata !296} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!299 = metadata !{i32 786689, metadata !30, metadata !"incx", metadata !5, i32 83886285, metadata !15, i32 0, metadata !296} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!300 = metadata !{i32 222, i32 0, metadata !233, metadata !296}
!301 = metadata !{i32 223, i32 0, metadata !233, metadata !296}
!302 = metadata !{metadata !302, metadata !190, metadata !191}
!303 = metadata !{metadata !303, metadata !190, metadata !191}
!304 = metadata !{i32 298, i32 0, metadata !80, null}
!305 = metadata !{i32 299, i32 0, metadata !80, null}
!306 = metadata !{i32 303, i32 0, metadata !307, null}
!307 = metadata !{i32 786443, metadata !1, metadata !308, i32 302, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!308 = metadata !{i32 786443, metadata !1, metadata !80, i32 301, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!309 = metadata !{i32 304, i32 0, metadata !307, null}
!310 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [da] [line 229]
!311 = metadata !{i32 307, i32 0, metadata !80, null}
!312 = metadata !{i32 229, i32 0, metadata !45, metadata !311}
!313 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!314 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!315 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!316 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !311} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!317 = metadata !{i32 233, i32 0, metadata !62, metadata !311}
!318 = metadata !{i32 259, i32 0, metadata !247, metadata !311}
!319 = metadata !{i32 260, i32 0, metadata !247, metadata !311}
!320 = metadata !{metadata !320, metadata !190, metadata !191}
!321 = metadata !{i32 296, i32 0, metadata !81, null}
!322 = metadata !{metadata !322, metadata !190, metadata !191}
!323 = metadata !{metadata !323, metadata !190, metadata !191}
!324 = metadata !{metadata !324, metadata !190, metadata !191}
!325 = metadata !{i32 312, i32 0, metadata !64, null}
!326 = metadata !{i32 313, i32 0, metadata !64, null}
!327 = metadata !{i32 317, i32 0, metadata !84, null}
!328 = metadata !{i32 323, i32 0, metadata !96, null}
!329 = metadata !{i32 325, i32 0, metadata !95, null}
!330 = metadata !{i32 326, i32 0, metadata !95, null}
!331 = metadata !{i32 328, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !95, i32 328, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!333 = metadata !{i32 330, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !332, i32 329, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!335 = metadata !{i32 331, i32 0, metadata !334, null}
!336 = metadata !{i32 332, i32 0, metadata !334, null}
!337 = metadata !{i32 335, i32 0, metadata !95, null}
!338 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [da] [line 229]
!339 = metadata !{i32 229, i32 0, metadata !45, metadata !337}
!340 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!341 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!342 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!343 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!344 = metadata !{i32 233, i32 0, metadata !62, metadata !337}
!345 = metadata !{i32 259, i32 0, metadata !247, metadata !337}
!346 = metadata !{i32 260, i32 0, metadata !247, metadata !337}
!347 = metadata !{metadata !347, metadata !190, metadata !191}
!348 = metadata !{metadata !348, metadata !190, metadata !191}
!349 = metadata !{i32 339, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !84, i32 339, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!351 = metadata !{i32 341, i32 0, metadata !352, null}
!352 = metadata !{i32 786443, metadata !1, metadata !350, i32 340, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!353 = metadata !{i32 342, i32 0, metadata !352, null}
!354 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!355 = metadata !{i32 344, i32 0, metadata !352, null}
!356 = metadata !{i32 229, i32 0, metadata !45, metadata !355}
!357 = metadata !{i32 786689, metadata !45, metadata !"dx_off", metadata !5, i32 67109093, metadata !15, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!358 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!359 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!360 = metadata !{i32 786689, metadata !45, metadata !"dy_off", metadata !5, i32 117440741, metadata !15, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!361 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !355} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!362 = metadata !{i32 233, i32 0, metadata !62, metadata !355}
!363 = metadata !{i32 259, i32 0, metadata !247, metadata !355}
!364 = metadata !{i32 260, i32 0, metadata !247, metadata !355}
!365 = metadata !{metadata !365, metadata !190, metadata !191}
!366 = metadata !{metadata !366, metadata !190, metadata !191}
!367 = metadata !{i32 346, i32 0, metadata !84, null}
!368 = metadata !{i32 348, i32 0, metadata !98, null}
!369 = metadata !{i8 0}
!370 = metadata !{i32 353, i32 0, metadata !98, null}
!371 = metadata !{i32 355, i32 0, metadata !116, null}
!372 = metadata !{i32 359, i32 0, metadata !122, null}
!373 = metadata !{metadata !166, metadata !166, i64 0}
!374 = metadata !{i32 359, i32 0, metadata !375, null}
!375 = metadata !{i32 786443, metadata !1, metadata !122, i32 359, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!376 = metadata !{i32 359, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !375, i32 359, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!378 = metadata !{i32 359, i32 0, metadata !379, null}
!379 = metadata !{i32 786443, metadata !1, metadata !380, i32 359, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!380 = metadata !{i32 786443, metadata !1, metadata !377, i32 359, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!381 = metadata !{i32 359, i32 0, metadata !382, null}
!382 = metadata !{i32 786443, metadata !1, metadata !379, i32 359, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!383 = metadata !{i32 357, i32 0, metadata !114, null}
!384 = metadata !{i64 3}
!385 = metadata !{i32 359, i32 0, metadata !111, null}
!386 = metadata !{i32 359, i32 0, metadata !380, null}
!387 = metadata !{i32 367, i32 0, metadata !98, null}
!388 = metadata !{i32 369, i32 0, metadata !389, null}
!389 = metadata !{i32 786443, metadata !1, metadata !98, i32 369, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!390 = metadata !{i32 370, i32 0, metadata !389, null}
!391 = metadata !{i32 372, i32 0, metadata !98, null}
!392 = metadata !{double* undef}
!393 = metadata !{i32 373, i32 0, metadata !98, null}
!394 = metadata !{i32 374, i32 0, metadata !98, null}
!395 = metadata !{double 0x41F3E5E475555555}
!396 = metadata !{i32 377, i32 0, metadata !98, null}
!397 = metadata !{i32 786689, metadata !4, metadata !"a", metadata !5, i32 16777309, metadata !8, i32 0, metadata !398} ; [ DW_TAG_arg_variable ] [a] [line 93]
!398 = metadata !{i32 380, i32 0, metadata !98, null}
!399 = metadata !{i32 93, i32 0, metadata !4, metadata !398}
!400 = metadata !{i32 786689, metadata !4, metadata !"b", metadata !5, i32 33554525, metadata !9, i32 0, metadata !398} ; [ DW_TAG_arg_variable ] [b] [line 93]
!401 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 96, metadata !15, i32 0, metadata !398} ; [ DW_TAG_auto_variable ] [i] [line 96]
!402 = metadata !{i32 98, i32 0, metadata !160, metadata !398}
!403 = metadata !{i32 65, i32 0, metadata !133, metadata !404}
!404 = metadata !{i32 100, i32 0, metadata !163, metadata !398}
!405 = metadata !{i32 99, i32 0, metadata !163, metadata !398}
!406 = metadata !{i32 103, i32 0, metadata !170, metadata !398}
!407 = metadata !{i32 105, i32 0, metadata !172, metadata !398}
!408 = metadata !{i32 57, i32 0, metadata !133, metadata !404}
!409 = metadata !{i32 58, i32 0, metadata !133, metadata !404} ; [ DW_TAG_imported_module ]
!410 = metadata !{i32 786688, metadata !133, metadata !"k", metadata !5, i32 54, metadata !138, i32 0, metadata !404} ; [ DW_TAG_auto_variable ] [k] [line 54]
!411 = metadata !{i32 59, i32 0, metadata !133, metadata !404}
!412 = metadata !{i32 61, i32 0, metadata !178, metadata !404}
!413 = metadata !{i32 62, i32 0, metadata !178, metadata !404}
!414 = metadata !{i32 64, i32 0, metadata !133, metadata !404}
!415 = metadata !{i32 786688, metadata !133, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, metadata !404} ; [ DW_TAG_auto_variable ] [result] [line 55]
!416 = metadata !{i32 107, i32 0, metadata !187, metadata !398}
!417 = metadata !{i32 106, i32 0, metadata !187, metadata !398}
!418 = metadata !{metadata !418, metadata !190, metadata !191}
!419 = metadata !{metadata !419, metadata !190, metadata !191}
!420 = metadata !{i32 387, i32 0, metadata !98, null}
!421 = metadata !{i32 786689, metadata !84, metadata !"a", metadata !5, i32 16777533, metadata !8, i32 0, metadata !422} ; [ DW_TAG_arg_variable ] [a] [line 317]
!422 = metadata !{i32 388, i32 0, metadata !98, null}
!423 = metadata !{i32 317, i32 0, metadata !84, metadata !422}
!424 = metadata !{i32 786689, metadata !84, metadata !"ipvt", metadata !5, i32 33554749, metadata !67, i32 0, metadata !422} ; [ DW_TAG_arg_variable ] [ipvt] [line 317]
!425 = metadata !{i32 786689, metadata !84, metadata !"b", metadata !5, i32 50331965, metadata !9, i32 0, metadata !422} ; [ DW_TAG_arg_variable ] [b] [line 317]
!426 = metadata !{i32 786688, metadata !84, metadata !"k", metadata !5, i32 320, metadata !15, i32 0, metadata !422} ; [ DW_TAG_auto_variable ] [k] [line 320]
!427 = metadata !{i32 323, i32 0, metadata !96, metadata !422}
!428 = metadata !{i32 325, i32 0, metadata !95, metadata !422}
!429 = metadata !{i32 786688, metadata !95, metadata !"l", metadata !5, i32 325, metadata !15, i32 0, metadata !422} ; [ DW_TAG_auto_variable ] [l] [line 325]
!430 = metadata !{i32 326, i32 0, metadata !95, metadata !422}
!431 = metadata !{i32 786688, metadata !84, metadata !"t", metadata !5, i32 319, metadata !10, i32 0, metadata !422} ; [ DW_TAG_auto_variable ] [t] [line 319]
!432 = metadata !{i32 328, i32 0, metadata !332, metadata !422}
!433 = metadata !{i32 330, i32 0, metadata !334, metadata !422}
!434 = metadata !{i32 331, i32 0, metadata !334, metadata !422}
!435 = metadata !{i32 332, i32 0, metadata !334, metadata !422}
!436 = metadata !{i32 335, i32 0, metadata !95, metadata !422}
!437 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, metadata !436} ; [ DW_TAG_arg_variable ] [da] [line 229]
!438 = metadata !{i32 229, i32 0, metadata !45, metadata !436}
!439 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !436} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!440 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !436} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!441 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !436} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!442 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !436} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!443 = metadata !{i32 233, i32 0, metadata !62, metadata !436}
!444 = metadata !{i32 259, i32 0, metadata !247, metadata !436}
!445 = metadata !{i32 260, i32 0, metadata !247, metadata !436}
!446 = metadata !{metadata !446, metadata !190, metadata !191}
!447 = metadata !{metadata !447, metadata !190, metadata !191}
!448 = metadata !{i32 339, i32 0, metadata !350, metadata !422}
!449 = metadata !{i32 341, i32 0, metadata !352, metadata !422}
!450 = metadata !{i32 342, i32 0, metadata !352, metadata !422}
!451 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!452 = metadata !{i32 344, i32 0, metadata !352, metadata !422}
!453 = metadata !{i32 229, i32 0, metadata !45, metadata !452}
!454 = metadata !{i32 786689, metadata !45, metadata !"dx_off", metadata !5, i32 67109093, metadata !15, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!455 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!456 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!457 = metadata !{i32 786689, metadata !45, metadata !"dy_off", metadata !5, i32 117440741, metadata !15, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!458 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !452} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!459 = metadata !{i32 233, i32 0, metadata !62, metadata !452}
!460 = metadata !{i32 259, i32 0, metadata !247, metadata !452}
!461 = metadata !{i32 260, i32 0, metadata !247, metadata !452}
!462 = metadata !{metadata !462, metadata !190, metadata !191}
!463 = metadata !{metadata !463, metadata !190, metadata !191}
!464 = metadata !{double 0.000000e+00}
!465 = metadata !{i32 392, i32 0, metadata !98, null}
!466 = metadata !{i32 395, i32 0, metadata !98, null}
!467 = metadata !{i32 397, i32 0, metadata !98, null}
!468 = metadata !{i32 399, i32 0, metadata !469, null}
!469 = metadata !{i32 786443, metadata !1, metadata !98, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!470 = metadata !{i32 400, i32 0, metadata !469, null}
!471 = metadata !{i32 402, i32 0, metadata !98, null}
!472 = metadata !{i32 406, i32 0, metadata !473, null}
!473 = metadata !{i32 786443, metadata !1, metadata !98, i32 405, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!474 = metadata !{i32 405, i32 0, metadata !473, null}
!475 = metadata !{i32 408, i32 0, metadata !473, null}
!476 = metadata !{i32 410, i32 0, metadata !98, null}
!477 = metadata !{i32 413, i32 0, metadata !98, null}
