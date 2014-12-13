; ModuleID = 'lpbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind optsize uwtable
define void @matgen(double** nocapture readonly %a, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !12), !dbg !140
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !13), !dbg !140
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !14), !dbg !142
  %seed.promoted9 = load i64* @seed, align 8, !dbg !144, !tbaa !147
  br label %.preheader3, !dbg !142

.preheader3:                                      ; preds = %18, %0
  %indvars.iv21 = phi i64 [ 0, %0 ], [ %indvars.iv.next22, %18 ]
  %.lcssa10 = phi i64 [ %seed.promoted9, %0 ], [ %14, %18 ]
  br label %1, !dbg !151

.preheader2:                                      ; preds = %18
  %b17 = bitcast double* %b to i8*
  store i64 %14, i64* @seed, align 8, !dbg !144, !tbaa !147
  call void @llvm.memset.p0i8.i64(i8* %b17, i8 0, i64 16000, i32 8, i1 false), !dbg !152
  br label %.preheader, !dbg !154

; <label>:1                                       ; preds = %1, %.preheader3
  %indvars.iv18 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next19, %1 ]
  %2 = phi i64 [ %.lcssa10, %.preheader3 ], [ %14, %1 ], !dbg !156
  %3 = xor i64 %2, 123459876, !dbg !156
  %4 = sdiv i64 %3, 127773, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i64 %4}, i64 0, metadata !158), !dbg !157
  %5 = mul i64 %4, -127773, !dbg !159
  %6 = add i64 %5, %3, !dbg !159
  %7 = mul nsw i64 %6, 16807, !dbg !159
  %8 = mul i64 %4, -2836, !dbg !159
  %9 = add i64 %7, %8, !dbg !159
  %10 = icmp slt i64 %9, 0, !dbg !160
  %11 = add nsw i64 %9, 2147483647, !dbg !162
  %..i = select i1 %10, i64 %11, i64 %9, !dbg !160
  %12 = sitofp i64 %..i to double, !dbg !163
  %13 = fmul double %12, 0x3E00000000200FE1, !dbg !163
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !164), !dbg !163
  %14 = xor i64 %..i, 123459876, !dbg !144
  %15 = getelementptr inbounds double** %a, i64 %indvars.iv18, !dbg !145
  %16 = load double** %15, align 8, !dbg !145, !tbaa !165
  %17 = getelementptr inbounds double* %16, i64 %indvars.iv21, !dbg !145
  store double %13, double* %17, align 8, !dbg !145, !tbaa !167
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !151
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000, !dbg !151
  br i1 %exitcond20, label %18, label %1, !dbg !151

; <label>:18                                      ; preds = %1
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !dbg !142
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000, !dbg !142
  br i1 %exitcond23, label %.preheader2, label %.preheader3, !dbg !142

.preheader:                                       ; preds = %27, %.preheader2
  %indvars.iv11 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next12, %27 ]
  %19 = getelementptr inbounds double** %a, i64 %indvars.iv11, !dbg !169
  %20 = load double** %19, align 8, !dbg !169, !tbaa !165
  br label %21, !dbg !171

; <label>:21                                      ; preds = %21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %21 ]
  %22 = getelementptr inbounds double* %20, i64 %indvars.iv, !dbg !169
  %23 = load double* %22, align 8, !dbg !169, !tbaa !167
  %24 = getelementptr inbounds double* %b, i64 %indvars.iv, !dbg !169
  %25 = load double* %24, align 8, !dbg !169, !tbaa !167
  %26 = fadd double %23, %25, !dbg !169
  store double %26, double* %24, align 8, !dbg !169, !tbaa !167
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !171
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !171
  br i1 %exitcond, label %27, label %21, !dbg !171

; <label>:27                                      ; preds = %21
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !154
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000, !dbg !154
  br i1 %exitcond13, label %28, label %.preheader, !dbg !154

; <label>:28                                      ; preds = %27
  ret void, !dbg !172
}

; Function Attrs: nounwind optsize readonly uwtable
define i32 @idamax(i32 %n, double* nocapture readonly %dx, i32 %dx_off, i32 %incx) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !21), !dbg !173
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !22), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !23), !dbg !173
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !24), !dbg !173
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !29), !dbg !174
  %1 = icmp slt i32 %n, 1, !dbg !175
  br i1 %1, label %.loopexit, label %2, !dbg !175

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %n, 1, !dbg !177
  br i1 %3, label %.loopexit, label %4, !dbg !177

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !180
  %6 = sext i32 %dx_off to i64, !dbg !183
  %7 = getelementptr inbounds double* %dx, i64 %6, !dbg !183
  %8 = load double* %7, align 8, !dbg !183, !tbaa !167
  %9 = tail call double @fabs(double %8) #7, !dbg !183
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !25), !dbg !183
  %10 = icmp sgt i32 %n, 1, !dbg !185
  br i1 %5, label %.preheader, label %11, !dbg !180

.preheader:                                       ; preds = %4
  br i1 %10, label %.lr.ph, label %.loopexit, !dbg !185

; <label>:11                                      ; preds = %4
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !28), !dbg !187
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !27), !dbg !190
  br i1 %10, label %.lr.ph9, label %.loopexit, !dbg !190

.lr.ph9:                                          ; preds = %11
  %12 = add nsw i32 %incx, 1, !dbg !187
  %13 = sext i32 %12 to i64
  %14 = sext i32 %incx to i64
  br label %15, !dbg !190

; <label>:15                                      ; preds = %15, %.lr.ph9
  %indvars.iv11 = phi i64 [ %13, %.lr.ph9 ], [ %indvars.iv.next12, %15 ]
  %itemp.08 = phi i32 [ 0, %.lr.ph9 ], [ %itemp.1, %15 ]
  %i.06 = phi i32 [ 1, %.lr.ph9 ], [ %21, %15 ]
  %dmax.05 = phi double [ %9, %.lr.ph9 ], [ %dmax.1, %15 ]
  %16 = add nsw i64 %indvars.iv11, %6, !dbg !192
  %17 = getelementptr inbounds double* %dx, i64 %16, !dbg !192
  %18 = load double* %17, align 8, !dbg !192, !tbaa !167
  %19 = tail call double @fabs(double %18) #7, !dbg !192
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !26), !dbg !192
  %20 = fcmp ogt double %19, %dmax.05, !dbg !194
  tail call void @llvm.dbg.value(metadata !{i32 %i.06}, i64 0, metadata !29), !dbg !196
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !25), !dbg !198
  %dmax.1 = select i1 %20, double %19, double %dmax.05, !dbg !194
  %itemp.1 = select i1 %20, i32 %i.06, i32 %itemp.08, !dbg !194
  %21 = add nsw i32 %i.06, 1, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !27), !dbg !190
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %14, !dbg !190
  %exitcond13 = icmp eq i32 %21, %n, !dbg !190
  br i1 %exitcond13, label %.loopexit, label %15, !dbg !190

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 1, %.preheader ]
  %itemp.24 = phi i32 [ %itemp.3, %.lr.ph ], [ 0, %.preheader ]
  %dmax.22 = phi double [ %dmax.3, %.lr.ph ], [ %9, %.preheader ]
  %22 = add nsw i64 %indvars.iv, %6, !dbg !199
  %23 = getelementptr inbounds double* %dx, i64 %22, !dbg !199
  %24 = load double* %23, align 8, !dbg !199, !tbaa !167
  %25 = tail call double @fabs(double %24) #7, !dbg !199
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !26), !dbg !199
  %26 = fcmp ogt double %25, %dmax.22, !dbg !201
  tail call void @llvm.dbg.value(metadata !203, i64 0, metadata !29), !dbg !204
  tail call void @llvm.dbg.value(metadata !{double %25}, i64 0, metadata !25), !dbg !206
  %dmax.3 = select i1 %26, double %25, double %dmax.22, !dbg !201
  %27 = trunc i64 %indvars.iv to i32, !dbg !201
  %itemp.3 = select i1 %26, i32 %27, i32 %itemp.24, !dbg !201
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !185
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !185
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !185
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !185

.loopexit:                                        ; preds = %15, %.lr.ph, %11, %.preheader, %2, %0
  %itemp.4 = phi i32 [ -1, %0 ], [ 0, %2 ], [ 0, %.preheader ], [ 0, %11 ], [ %itemp.3, %.lr.ph ], [ %itemp.1, %15 ]
  ret i32 %itemp.4, !dbg !207
}

; Function Attrs: nounwind optsize readnone
declare double @fabs(double) #2

; Function Attrs: nounwind optsize uwtable
define void @dscal(i32 %n, double %da, double* nocapture %dx, i32 %dx_off, i32 %incx) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !34), !dbg !208
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !35), !dbg !208
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !36), !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !37), !dbg !208
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !38), !dbg !208
  %1 = icmp sgt i32 %n, 0, !dbg !209
  br i1 %1, label %2, label %.loopexit, !dbg !209

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, 1, !dbg !210
  br i1 %3, label %.lr.ph, label %5, !dbg !210

.lr.ph:                                           ; preds = %2
  %4 = sext i32 %dx_off to i64, !dbg !211
  br label %17, !dbg !211

; <label>:5                                       ; preds = %2
  %6 = mul nsw i32 %incx, %n, !dbg !214
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !40), !dbg !214
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !39), !dbg !215
  %7 = icmp sgt i32 %6, 0, !dbg !215
  br i1 %7, label %.lr.ph4, label %.loopexit, !dbg !215

.lr.ph4:                                          ; preds = %5
  %8 = sext i32 %incx to i64
  %9 = sext i32 %dx_off to i64, !dbg !215
  br label %10, !dbg !215

; <label>:10                                      ; preds = %.lr.ph4, %10
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %10 ]
  %11 = add nsw i64 %indvars.iv5, %9, !dbg !217
  %12 = getelementptr inbounds double* %dx, i64 %11, !dbg !217
  %13 = load double* %12, align 8, !dbg !217, !tbaa !167
  %14 = fmul double %13, %da, !dbg !217
  store double %14, double* %12, align 8, !dbg !217, !tbaa !167
  %indvars.iv.next6 = add nsw i64 %indvars.iv5, %8, !dbg !215
  %15 = trunc i64 %indvars.iv.next6 to i32, !dbg !215
  %16 = icmp slt i32 %15, %6, !dbg !215
  br i1 %16, label %10, label %.loopexit, !dbg !215

; <label>:17                                      ; preds = %17, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %17 ]
  %18 = add nsw i64 %indvars.iv, %4, !dbg !218
  %19 = getelementptr inbounds double* %dx, i64 %18, !dbg !218
  %20 = load double* %19, align 8, !dbg !218, !tbaa !167
  %21 = fmul double %20, %da, !dbg !218
  store double %21, double* %19, align 8, !dbg !218, !tbaa !167
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !211
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !211
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !211
  br i1 %exitcond, label %.loopexit, label %17, !dbg !211

.loopexit:                                        ; preds = %10, %17, %5, %0
  ret void, !dbg !219
}

; Function Attrs: nounwind optsize uwtable
define void @daxpy(i32 %n, double %da, double* nocapture readonly %dx, i32 %dx_off, i32 %incx, double* nocapture %dy, i32 %dy_off, i32 %incy) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !49), !dbg !220
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !50), !dbg !220
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !51), !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !52), !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !53), !dbg !220
  tail call void @llvm.dbg.value(metadata !{double* %dy}, i64 0, metadata !54), !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %dy_off}, i64 0, metadata !55), !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !56), !dbg !220
  %1 = icmp sgt i32 %n, 0, !dbg !221
  %2 = fcmp une double %da, 0.000000e+00, !dbg !221
  %or.cond = and i1 %1, %2, !dbg !221
  br i1 %or.cond, label %3, label %.loopexit, !dbg !221

; <label>:3                                       ; preds = %0
  %4 = icmp ne i32 %incx, 1, !dbg !222
  %5 = icmp ne i32 %incy, 1, !dbg !222
  %or.cond3 = or i1 %4, %5, !dbg !222
  br i1 %or.cond3, label %8, label %.lr.ph10, !dbg !222

.lr.ph10:                                         ; preds = %3
  %6 = sext i32 %dy_off to i64, !dbg !223
  %7 = sext i32 %dx_off to i64, !dbg !223
  br label %32, !dbg !223

; <label>:8                                       ; preds = %3
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !58), !dbg !226
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !63), !dbg !227
  %9 = icmp slt i32 %incx, 0, !dbg !228
  br i1 %9, label %10, label %13, !dbg !228

; <label>:10                                      ; preds = %8
  %11 = sub nsw i32 1, %n, !dbg !230
  %12 = mul nsw i32 %11, %incx, !dbg !230
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !58), !dbg !230
  %phitmp16 = sext i32 %12 to i64, !dbg !230
  br label %13, !dbg !230

; <label>:13                                      ; preds = %10, %8
  %ix.0 = phi i64 [ %phitmp16, %10 ], [ 0, %8 ]
  %14 = icmp slt i32 %incy, 0, !dbg !231
  br i1 %14, label %15, label %.lr.ph, !dbg !231

; <label>:15                                      ; preds = %13
  %16 = sub nsw i32 1, %n, !dbg !233
  %17 = mul nsw i32 %16, %incy, !dbg !233
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !63), !dbg !233
  %phitmp = sext i32 %17 to i64, !dbg !233
  br label %.lr.ph, !dbg !233

.lr.ph:                                           ; preds = %13, %15
  %iy.1.ph = phi i64 [ 0, %13 ], [ %phitmp, %15 ]
  %18 = sext i32 %incy to i64
  %19 = sext i32 %dy_off to i64, !dbg !234
  %20 = sext i32 %incx to i64
  %21 = sext i32 %dx_off to i64, !dbg !234
  br label %22, !dbg !234

; <label>:22                                      ; preds = %22, %.lr.ph
  %indvars.iv11 = phi i64 [ %ix.0, %.lr.ph ], [ %indvars.iv.next12, %22 ]
  %indvars.iv = phi i64 [ %iy.1.ph, %.lr.ph ], [ %indvars.iv.next, %22 ]
  %i.06 = phi i32 [ 0, %.lr.ph ], [ %31, %22 ]
  %23 = add nsw i64 %indvars.iv11, %21, !dbg !236
  %24 = getelementptr inbounds double* %dx, i64 %23, !dbg !236
  %25 = load double* %24, align 8, !dbg !236, !tbaa !167
  %26 = fmul double %25, %da, !dbg !236
  %27 = add nsw i64 %indvars.iv, %19, !dbg !236
  %28 = getelementptr inbounds double* %dy, i64 %27, !dbg !236
  %29 = load double* %28, align 8, !dbg !236, !tbaa !167
  %30 = fadd double %29, %26, !dbg !236
  store double %30, double* %28, align 8, !dbg !236, !tbaa !167
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %20, !dbg !234
  %indvars.iv.next = add nsw i64 %indvars.iv, %18, !dbg !234
  %31 = add nsw i32 %i.06, 1, !dbg !234
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !57), !dbg !234
  %exitcond = icmp eq i32 %31, %n, !dbg !234
  br i1 %exitcond, label %.loopexit, label %22, !dbg !234

; <label>:32                                      ; preds = %32, %.lr.ph10
  %indvars.iv13 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next14, %32 ]
  %33 = add nsw i64 %indvars.iv13, %7, !dbg !238
  %34 = getelementptr inbounds double* %dx, i64 %33, !dbg !238
  %35 = load double* %34, align 8, !dbg !238, !tbaa !167
  %36 = fmul double %35, %da, !dbg !238
  %37 = add nsw i64 %indvars.iv13, %6, !dbg !238
  %38 = getelementptr inbounds double* %dy, i64 %37, !dbg !238
  %39 = load double* %38, align 8, !dbg !238, !tbaa !167
  %40 = fadd double %39, %36, !dbg !238
  store double %40, double* %38, align 8, !dbg !238, !tbaa !167
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !223
  %lftr.wideiv = trunc i64 %indvars.iv.next14 to i32, !dbg !223
  %exitcond15 = icmp eq i32 %lftr.wideiv, %n, !dbg !223
  br i1 %exitcond15, label %.loopexit, label %32, !dbg !223

.loopexit:                                        ; preds = %32, %22, %0
  ret void, !dbg !239
}

; Function Attrs: nounwind optsize uwtable
define void @dgefa(double** nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !69), !dbg !240
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !70), !dbg !240
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !72), !dbg !241
  br label %1, !dbg !241

; <label>:1                                       ; preds = %.backedge, %0
  %indvars.iv14 = phi i64 [ 0, %0 ], [ %indvars.iv.next15, %.backedge ]
  %indvars.iv8 = phi i64 [ 1, %0 ], [ %indvars.iv.next9, %.backedge ]
  %indvars.iv4 = phi i32 [ 1999, %0 ], [ %indvars.iv.next5, %.backedge ]
  %k.03 = phi i32 [ 0, %0 ], [ %4, %.backedge ]
  %2 = getelementptr inbounds double** %a, i64 %indvars.iv14, !dbg !242
  %3 = load double** %2, align 8, !dbg !242, !tbaa !165
  tail call void @llvm.dbg.value(metadata !{double* %3}, i64 0, metadata !74), !dbg !242
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !241
  %4 = add nsw i32 %k.03, 1, !dbg !243
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !77), !dbg !243
  %5 = sub nsw i32 2000, %k.03, !dbg !244
  %6 = trunc i64 %indvars.iv14 to i32, !dbg !244
  %7 = tail call i32 @idamax(i32 %5, double* %3, i32 %6, i32 1) #8, !dbg !244
  %8 = add nsw i32 %7, %6, !dbg !244
  tail call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !78), !dbg !244
  %9 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv14, !dbg !245
  store i32 %8, i32* %9, align 4, !dbg !245, !tbaa !246
  %10 = sext i32 %8 to i64, !dbg !248
  %11 = getelementptr inbounds double* %3, i64 %10, !dbg !248
  %12 = load double* %11, align 8, !dbg !248, !tbaa !167
  %13 = fcmp une double %12, 0.000000e+00, !dbg !248
  br i1 %13, label %14, label %.backedge, !dbg !248

.backedge:                                        ; preds = %daxpy.exit, %1
  %indvars.iv.next5 = add i32 %indvars.iv4, -1, !dbg !241
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !241
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1999, !dbg !241
  br i1 %exitcond16, label %42, label %1, !dbg !241

; <label>:14                                      ; preds = %1
  %15 = icmp ne i32 %7, 0, !dbg !249
  %16 = getelementptr inbounds double* %3, i64 %indvars.iv14, !dbg !251
  %17 = load double* %16, align 8, !dbg !251, !tbaa !167
  br i1 %15, label %18, label %._crit_edge, !dbg !249

; <label>:18                                      ; preds = %14
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !71), !dbg !253
  store double %17, double* %11, align 8, !dbg !251, !tbaa !167
  store double %12, double* %16, align 8, !dbg !254, !tbaa !167
  br label %._crit_edge, !dbg !255

._crit_edge:                                      ; preds = %14, %18
  %19 = phi double [ %12, %18 ], [ %17, %14 ]
  %20 = fdiv double -1.000000e+00, %19, !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !71), !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %20}, i64 0, metadata !257), !dbg !259
  tail call void @llvm.dbg.value(metadata !{double* %3}, i64 0, metadata !260), !dbg !259
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !261), !dbg !259
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !262), !dbg !259
  br label %21, !dbg !263

; <label>:21                                      ; preds = %21, %._crit_edge
  %indvars.iv.i = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.i, %21 ]
  %22 = add nsw i64 %indvars.iv.i, %indvars.iv.next15, !dbg !264
  %23 = getelementptr inbounds double* %3, i64 %22, !dbg !264
  %24 = load double* %23, align 8, !dbg !264, !tbaa !167
  %25 = fmul double %20, %24, !dbg !264
  store double %25, double* %23, align 8, !dbg !264, !tbaa !167
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !263
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !263
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv4, !dbg !263
  br i1 %exitcond, label %.lr.ph, label %21, !dbg !263

.lr.ph:                                           ; preds = %21, %daxpy.exit
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %daxpy.exit ], [ %indvars.iv8, %21 ]
  %26 = getelementptr inbounds double** %a, i64 %indvars.iv10, !dbg !265
  %27 = load double** %26, align 8, !dbg !265, !tbaa !165
  tail call void @llvm.dbg.value(metadata !{double* %27}, i64 0, metadata !79), !dbg !265
  %28 = getelementptr inbounds double* %27, i64 %10, !dbg !266
  %29 = load double* %28, align 8, !dbg !266, !tbaa !167
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !71), !dbg !266
  br i1 %15, label %30, label %33, !dbg !267

; <label>:30                                      ; preds = %.lr.ph
  %31 = getelementptr inbounds double* %27, i64 %indvars.iv14, !dbg !269
  %32 = load double* %31, align 8, !dbg !269, !tbaa !167
  store double %32, double* %28, align 8, !dbg !269, !tbaa !167
  store double %29, double* %31, align 8, !dbg !271, !tbaa !167
  br label %33, !dbg !272

; <label>:33                                      ; preds = %30, %.lr.ph
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !273), !dbg !275
  tail call void @llvm.dbg.value(metadata !{double* %3}, i64 0, metadata !276), !dbg !275
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !277), !dbg !275
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !278), !dbg !275
  tail call void @llvm.dbg.value(metadata !{double* %27}, i64 0, metadata !279), !dbg !275
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !280), !dbg !275
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !281), !dbg !275
  %34 = fcmp une double %29, 0.000000e+00, !dbg !282
  br i1 %34, label %.preheader, label %daxpy.exit, !dbg !282

.preheader:                                       ; preds = %33, %.preheader
  %indvars.iv13.i = phi i64 [ %indvars.iv.next14.i, %.preheader ], [ 0, %33 ]
  %35 = add nsw i64 %indvars.iv13.i, %indvars.iv.next15, !dbg !283
  %36 = getelementptr inbounds double* %3, i64 %35, !dbg !283
  %37 = load double* %36, align 8, !dbg !283, !tbaa !167
  %38 = fmul double %29, %37, !dbg !283
  %39 = getelementptr inbounds double* %27, i64 %35, !dbg !283
  %40 = load double* %39, align 8, !dbg !283, !tbaa !167
  %41 = fadd double %40, %38, !dbg !283
  store double %41, double* %39, align 8, !dbg !283, !tbaa !167
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !284
  %lftr.wideiv6 = trunc i64 %indvars.iv.next14.i to i32, !dbg !284
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %indvars.iv4, !dbg !284
  br i1 %exitcond7, label %daxpy.exit, label %.preheader, !dbg !284

daxpy.exit:                                       ; preds = %.preheader, %33
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !285
  %lftr.wideiv12 = trunc i64 %indvars.iv.next11 to i32, !dbg !285
  %exitcond13 = icmp eq i32 %lftr.wideiv12, 2000, !dbg !285
  br i1 %exitcond13, label %.backedge, label %.lr.ph, !dbg !285

; <label>:42                                      ; preds = %.backedge
  %43 = getelementptr inbounds i32* %ipvt, i64 1999, !dbg !286
  store i32 1999, i32* %43, align 4, !dbg !286, !tbaa !246
  ret void, !dbg !287
}

; Function Attrs: nounwind optsize uwtable
define void @dgesl(double** nocapture readonly %a, i32* nocapture readonly %ipvt, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !88), !dbg !288
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !89), !dbg !288
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !90), !dbg !288
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !92), !dbg !289
  br label %1, !dbg !289

; <label>:1                                       ; preds = %daxpy.exit.backedge, %0
  %indvars.iv16 = phi i64 [ 0, %0 ], [ %indvars.iv.next17, %daxpy.exit.backedge ]
  %indvars.iv12 = phi i32 [ 1999, %0 ], [ %indvars.iv.next13, %daxpy.exit.backedge ]
  %2 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv16, !dbg !290
  %3 = load i32* %2, align 4, !dbg !290, !tbaa !246
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !94), !dbg !290
  %4 = sext i32 %3 to i64, !dbg !291
  %5 = getelementptr inbounds double* %b, i64 %4, !dbg !291
  %6 = load double* %5, align 8, !dbg !291, !tbaa !167
  tail call void @llvm.dbg.value(metadata !{double %6}, i64 0, metadata !91), !dbg !291
  %7 = trunc i64 %indvars.iv16 to i32, !dbg !292
  %8 = icmp eq i32 %3, %7, !dbg !292
  br i1 %8, label %12, label %9, !dbg !292

; <label>:9                                       ; preds = %1
  %10 = getelementptr inbounds double* %b, i64 %indvars.iv16, !dbg !294
  %11 = load double* %10, align 8, !dbg !294, !tbaa !167
  store double %11, double* %5, align 8, !dbg !294, !tbaa !167
  store double %6, double* %10, align 8, !dbg !296, !tbaa !167
  br label %12, !dbg !297

; <label>:12                                      ; preds = %1, %9
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !289
  %13 = getelementptr inbounds double** %a, i64 %indvars.iv16, !dbg !298
  %14 = load double** %13, align 8, !dbg !298, !tbaa !165
  tail call void @llvm.dbg.value(metadata !{double %6}, i64 0, metadata !299), !dbg !300
  tail call void @llvm.dbg.value(metadata !{double* %14}, i64 0, metadata !301), !dbg !300
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !302), !dbg !300
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !303), !dbg !300
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !304), !dbg !300
  %15 = fcmp une double %6, 0.000000e+00, !dbg !305
  br i1 %15, label %.preheader19, label %daxpy.exit.backedge, !dbg !305

daxpy.exit.backedge:                              ; preds = %.preheader19, %12
  %indvars.iv.next13 = add i32 %indvars.iv12, -1, !dbg !289
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1999, !dbg !289
  br i1 %exitcond18, label %daxpy.exit6.preheader, label %1, !dbg !289

.preheader19:                                     ; preds = %12, %.preheader19
  %indvars.iv13.i = phi i64 [ %indvars.iv.next14.i, %.preheader19 ], [ 0, %12 ]
  %16 = add nsw i64 %indvars.iv13.i, %indvars.iv.next17, !dbg !306
  %17 = getelementptr inbounds double* %14, i64 %16, !dbg !306
  %18 = load double* %17, align 8, !dbg !306, !tbaa !167
  %19 = fmul double %6, %18, !dbg !306
  %20 = getelementptr inbounds double* %b, i64 %16, !dbg !306
  %21 = load double* %20, align 8, !dbg !306, !tbaa !167
  %22 = fadd double %21, %19, !dbg !306
  store double %22, double* %20, align 8, !dbg !306, !tbaa !167
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1, !dbg !307
  %lftr.wideiv14 = trunc i64 %indvars.iv.next14.i to i32, !dbg !307
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %indvars.iv12, !dbg !307
  br i1 %exitcond15, label %daxpy.exit.backedge, label %.preheader19, !dbg !307

daxpy.exit6.preheader:                            ; preds = %daxpy.exit.backedge, %daxpy.exit6.backedge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %daxpy.exit6.backedge ], [ 0, %daxpy.exit.backedge ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %daxpy.exit6.backedge ], [ 1999, %daxpy.exit.backedge ]
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !308
  %23 = sub i64 1999, %indvars.iv9, !dbg !310
  %24 = getelementptr inbounds double** %a, i64 %23, !dbg !312
  %25 = load double** %24, align 8, !dbg !312, !tbaa !165
  %26 = getelementptr inbounds double* %25, i64 %23, !dbg !312
  %27 = load double* %26, align 8, !dbg !312, !tbaa !167
  %28 = getelementptr inbounds double* %b, i64 %23, !dbg !312
  %29 = load double* %28, align 8, !dbg !312, !tbaa !167
  %30 = fdiv double %29, %27, !dbg !312
  store double %30, double* %28, align 8, !dbg !312, !tbaa !167
  tail call void @llvm.dbg.value(metadata !{double* %25}, i64 0, metadata !313), !dbg !315
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !316), !dbg !315
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !317), !dbg !315
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !318), !dbg !315
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !319), !dbg !315
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !320), !dbg !315
  %31 = trunc i64 %23 to i32, !dbg !321
  %32 = icmp sgt i32 %31, 0, !dbg !321
  %33 = fcmp une double %30, -0.000000e+00, !dbg !321
  %or.cond.i1 = and i1 %32, %33, !dbg !321
  br i1 %or.cond.i1, label %.preheader, label %daxpy.exit6.backedge, !dbg !321

daxpy.exit6.backedge:                             ; preds = %.preheader, %daxpy.exit6.preheader
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !308
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000, !dbg !308
  br i1 %exitcond11, label %40, label %daxpy.exit6.preheader, !dbg !308

.preheader:                                       ; preds = %daxpy.exit6.preheader, %.preheader
  %indvars.iv13.i2 = phi i64 [ %indvars.iv.next14.i3, %.preheader ], [ 0, %daxpy.exit6.preheader ]
  %34 = getelementptr inbounds double* %25, i64 %indvars.iv13.i2, !dbg !322
  %35 = load double* %34, align 8, !dbg !322, !tbaa !167
  %36 = fmul double %30, %35, !dbg !322
  %37 = getelementptr inbounds double* %b, i64 %indvars.iv13.i2, !dbg !322
  %38 = load double* %37, align 8, !dbg !322, !tbaa !167
  %39 = fsub double %38, %36, !dbg !322
  store double %39, double* %37, align 8, !dbg !322, !tbaa !167
  %indvars.iv.next14.i3 = add nuw nsw i64 %indvars.iv13.i2, 1, !dbg !323
  %lftr.wideiv = trunc i64 %indvars.iv.next14.i3 to i32, !dbg !323
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !323
  br i1 %exitcond, label %daxpy.exit6.backedge, label %.preheader, !dbg !323

; <label>:40                                      ; preds = %daxpy.exit6.backedge
  ret void, !dbg !324
}

; Function Attrs: nounwind optsize uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !105), !dbg !325
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !106), !dbg !325
  tail call void @llvm.dbg.value(metadata !326, i64 0, metadata !108), !dbg !327
  %1 = icmp sgt i32 %argc, 1, !dbg !328
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !328

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !330
  %3 = load i8** %2, align 8, !dbg !330, !tbaa !165
  %4 = tail call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0)) #9, !dbg !330
  %5 = icmp eq i32 %4, 0, !dbg !330
  br label %8, !dbg !335

; <label>:6                                       ; preds = %8
  %7 = icmp slt i32 %9, %argc, !dbg !335
  br i1 %7, label %8, label %.loopexit, !dbg !335

; <label>:8                                       ; preds = %.lr.ph, %6
  %i.03 = phi i32 [ 1, %.lr.ph ], [ %9, %6 ]
  %9 = add nsw i32 %i.03, 1, !dbg !335
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !107), !dbg !335
  br i1 %5, label %.loopexit, label %6, !dbg !330

.loopexit:                                        ; preds = %6, %8, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %6 ], [ true, %8 ]
  %10 = tail call noalias i8* @malloc(i64 16000) #10, !dbg !336
  %11 = bitcast i8* %10 to double**, !dbg !336
  tail call void @llvm.dbg.value(metadata !{double** %11}, i64 0, metadata !110), !dbg !336
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !107), !dbg !337
  br label %12, !dbg !337

; <label>:12                                      ; preds = %12, %.loopexit
  %indvars.iv6 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next7, %12 ]
  %13 = tail call noalias i8* @malloc(i64 16008) #10, !dbg !339
  %14 = bitcast i8* %13 to double*, !dbg !339
  %15 = getelementptr inbounds double** %11, i64 %indvars.iv6, !dbg !339
  store double* %14, double** %15, align 8, !dbg !339, !tbaa !165
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !337
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000, !dbg !337
  br i1 %exitcond8, label %16, label %12, !dbg !337

; <label>:16                                      ; preds = %12
  %17 = tail call noalias i8* @malloc(i64 16000) #10, !dbg !340
  %18 = bitcast i8* %17 to double*, !dbg !340
  tail call void @llvm.dbg.value(metadata !{double* %18}, i64 0, metadata !111), !dbg !340
  tail call void @llvm.dbg.value(metadata !341, i64 0, metadata !112), !dbg !342
  %19 = tail call noalias i8* @malloc(i64 8000) #10, !dbg !343
  %20 = bitcast i8* %19 to i32*, !dbg !343
  tail call void @llvm.dbg.value(metadata !{i32* %20}, i64 0, metadata !113), !dbg !343
  tail call void @llvm.dbg.value(metadata !344, i64 0, metadata !114), !dbg !345
  tail call void @matgen(double** %11, double* %18) #8, !dbg !346
  tail call void @dgefa(double** %11, i32* %20) #8, !dbg !347
  tail call void @dgesl(double** %11, i32* %20, double* %18) #8, !dbg !348
  tail call void @llvm.dbg.value(metadata !349, i64 0, metadata !115), !dbg !350
  tail call void @free(i8* %19) #10, !dbg !351
  tail call void @free(i8* %17) #10, !dbg !352
  tail call void @llvm.dbg.value(metadata !141, i64 0, metadata !107), !dbg !353
  br label %21, !dbg !353

; <label>:21                                      ; preds = %21, %16
  %indvars.iv = phi i64 [ 0, %16 ], [ %indvars.iv.next, %21 ]
  %22 = getelementptr inbounds double** %11, i64 %indvars.iv, !dbg !355
  %23 = load double** %22, align 8, !dbg !355, !tbaa !165
  %24 = bitcast double* %23 to i8*, !dbg !355
  tail call void @free(i8* %24) #10, !dbg !355
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !353
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !353
  br i1 %exitcond, label %25, label %21, !dbg !353

; <label>:25                                      ; preds = %21
  tail call void @free(i8* %10) #10, !dbg !356
  %26 = load %struct._IO_FILE** @stdout, align 8, !dbg !357, !tbaa !165
  br i1 %ga_testing.0, label %27, label %29, !dbg !359

; <label>:27                                      ; preds = %25
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), double 0.000000e+00) #10, !dbg !357
  br label %31, !dbg !357

; <label>:29                                      ; preds = %25
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), double 0.000000e+00) #10, !dbg !360
  br label %31

; <label>:31                                      ; preds = %29, %27
  %32 = load %struct._IO_FILE** @stdout, align 8, !dbg !361, !tbaa !165
  %33 = tail call i32 @fflush(%struct._IO_FILE* %32) #10, !dbg !361
  ret i32 0, !dbg !362
}

; Function Attrs: nounwind optsize readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #3

; Function Attrs: nounwind optsize
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #4

; Function Attrs: nounwind optsize
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #4

; Function Attrs: nounwind optsize
declare i32 @fflush(%struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind optsize readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { nounwind optsize readnone }
attributes #8 = { optsize }
attributes #9 = { nounwind optsize readonly }
attributes #10 = { nounwind optsize }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!137, !138}
!llvm.ident = !{!139}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !123, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"lpbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !17, metadata !30, metadata !45, metadata !64, metadata !84, metadata !98, metadata !116}
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
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !108, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115}
!105 = metadata !{i32 786689, metadata !98, metadata !"argc", metadata !5, i32 16777564, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 348]
!106 = metadata !{i32 786689, metadata !98, metadata !"argv", metadata !5, i32 33554780, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 348]
!107 = metadata !{i32 786688, metadata !98, metadata !"i", metadata !5, i32 350, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 350]
!108 = metadata !{i32 786688, metadata !98, metadata !"ga_testing", metadata !5, i32 353, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ga_testing] [line 353]
!109 = metadata !{i32 786468, null, null, metadata !"_Bool", i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!110 = metadata !{i32 786688, metadata !98, metadata !"a", metadata !5, i32 367, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 367]
!111 = metadata !{i32 786688, metadata !98, metadata !"b", metadata !5, i32 372, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 372]
!112 = metadata !{i32 786688, metadata !98, metadata !"x", metadata !5, i32 373, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 373]
!113 = metadata !{i32 786688, metadata !98, metadata !"ipvt", metadata !5, i32 374, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ipvt] [line 374]
!114 = metadata !{i32 786688, metadata !98, metadata !"ops", metadata !5, i32 377, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ops] [line 377]
!115 = metadata !{i32 786688, metadata !98, metadata !"run_time", metadata !5, i32 392, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [run_time] [line 392]
!116 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random_double", metadata !"random_double", metadata !"", i32 52, metadata !117, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, null, null, null, metadata !119, i32 53} ; [ DW_TAG_subprogram ] [line 52] [local] [def] [scope 53] [random_double]
!117 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !118, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = metadata !{metadata !10}
!119 = metadata !{metadata !120, metadata !122}
!120 = metadata !{i32 786688, metadata !116, metadata !"k", metadata !5, i32 54, metadata !121, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 54]
!121 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!122 = metadata !{i32 786688, metadata !116, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 55]
!123 = metadata !{metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !126, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !126, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !127, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !124, metadata !128, metadata !130, metadata !131, metadata !130, metadata !132, metadata !133, metadata !134, metadata !128, metadata !136}
!124 = metadata !{i32 786484, i32 0, metadata !5, metadata !"N", metadata !"N", metadata !"N", metadata !5, i32 86, metadata !125, i32 1, i32 1, i32 2000, null} ; [ DW_TAG_variable ] [N] [line 86] [local] [def]
!125 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!126 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NM1", metadata !"NM1", metadata !"NM1", metadata !5, i32 87, metadata !125, i32 1, i32 1, i32 1999, null} ; [ DW_TAG_variable ] [NM1] [line 87] [local] [def]
!127 = metadata !{i32 786484, i32 0, metadata !5, metadata !"NP1", metadata !"NP1", metadata !"NP1", metadata !5, i32 88, metadata !125, i32 1, i32 1, i32 2001, null} ; [ DW_TAG_variable ] [NP1] [line 88] [local] [def]
!128 = metadata !{i32 786484, i32 0, metadata !5, metadata !"MASK", metadata !"MASK", metadata !"MASK", metadata !5, i32 50, metadata !129, i32 1, i32 1, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 50] [local] [def]
!129 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!130 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IQ", metadata !"IQ", metadata !"IQ", metadata !5, i32 48, metadata !129, i32 1, i32 1, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 48] [local] [def]
!131 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IA", metadata !"IA", metadata !"IA", metadata !5, i32 45, metadata !129, i32 1, i32 1, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 45] [local] [def]
!132 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IR", metadata !"IR", metadata !"IR", metadata !5, i32 49, metadata !129, i32 1, i32 1, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 49] [local] [def]
!133 = metadata !{i32 786484, i32 0, metadata !5, metadata !"IM", metadata !"IM", metadata !"IM", metadata !5, i32 46, metadata !129, i32 1, i32 1, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 46] [local] [def]
!134 = metadata !{i32 786484, i32 0, metadata !5, metadata !"AM", metadata !"AM", metadata !"AM", metadata !5, i32 47, metadata !135, i32 1, i32 1, double 0x3E00000000200FE1, null} ; [ DW_TAG_variable ] [AM] [line 47] [local] [def]
!135 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from double]
!136 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 44, metadata !121, i32 1, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 44] [local] [def]
!137 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!138 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!139 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!140 = metadata !{i32 93, i32 0, metadata !4, null}
!141 = metadata !{i32 0}
!142 = metadata !{i32 98, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !4, i32 98, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!144 = metadata !{i32 65, i32 0, metadata !116, metadata !145}
!145 = metadata !{i32 100, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !143, i32 99, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!147 = metadata !{metadata !148, metadata !148, i64 0}
!148 = metadata !{metadata !"long", metadata !149, i64 0}
!149 = metadata !{metadata !"omnipotent char", metadata !150, i64 0}
!150 = metadata !{metadata !"Simple C/C++ TBAA"}
!151 = metadata !{i32 99, i32 0, metadata !146, null}
!152 = metadata !{i32 103, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!154 = metadata !{i32 105, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!156 = metadata !{i32 57, i32 0, metadata !116, metadata !145}
!157 = metadata !{i32 58, i32 0, metadata !116, metadata !145} ; [ DW_TAG_imported_module ]
!158 = metadata !{i32 786688, metadata !116, metadata !"k", metadata !5, i32 54, metadata !121, i32 0, metadata !145} ; [ DW_TAG_auto_variable ] [k] [line 54]
!159 = metadata !{i32 59, i32 0, metadata !116, metadata !145}
!160 = metadata !{i32 61, i32 0, metadata !161, metadata !145}
!161 = metadata !{i32 786443, metadata !1, metadata !116, i32 61, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!162 = metadata !{i32 62, i32 0, metadata !161, metadata !145}
!163 = metadata !{i32 64, i32 0, metadata !116, metadata !145}
!164 = metadata !{i32 786688, metadata !116, metadata !"result", metadata !5, i32 55, metadata !10, i32 0, metadata !145} ; [ DW_TAG_auto_variable ] [result] [line 55]
!165 = metadata !{metadata !166, metadata !166, i64 0}
!166 = metadata !{metadata !"any pointer", metadata !149, i64 0}
!167 = metadata !{metadata !168, metadata !168, i64 0}
!168 = metadata !{metadata !"double", metadata !149, i64 0}
!169 = metadata !{i32 107, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !155, i32 106, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!171 = metadata !{i32 106, i32 0, metadata !170, null}
!172 = metadata !{i32 108, i32 0, metadata !4, null}
!173 = metadata !{i32 111, i32 0, metadata !17, null}
!174 = metadata !{i32 114, i32 0, metadata !17, null}
!175 = metadata !{i32 116, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !1, metadata !17, i32 116, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!177 = metadata !{i32 120, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !179, i32 120, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!179 = metadata !{i32 786443, metadata !1, metadata !176, i32 119, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!180 = metadata !{i32 124, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !182, i32 124, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!182 = metadata !{i32 786443, metadata !1, metadata !178, i32 123, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!183 = metadata !{i32 147, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !181, i32 144, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!185 = metadata !{i32 149, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !184, i32 149, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!187 = metadata !{i32 128, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !181, i32 125, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!189 = metadata !{i32 1}
!190 = metadata !{i32 130, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !188, i32 130, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!192 = metadata !{i32 132, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !191, i32 131, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!194 = metadata !{i32 134, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !193, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!196 = metadata !{i32 136, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !1, metadata !195, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!198 = metadata !{i32 137, i32 0, metadata !197, null}
!199 = metadata !{i32 151, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !186, i32 150, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!201 = metadata !{i32 153, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 153, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!203 = metadata !{i32 undef}
!204 = metadata !{i32 155, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !202, i32 154, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!206 = metadata !{i32 156, i32 0, metadata !205, null}
!207 = metadata !{i32 163, i32 0, metadata !17, null}
!208 = metadata !{i32 205, i32 0, metadata !30, null}
!209 = metadata !{i32 209, i32 0, metadata !44, null}
!210 = metadata !{i32 211, i32 0, metadata !42, null}
!211 = metadata !{i32 222, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !1, metadata !213, i32 222, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!213 = metadata !{i32 786443, metadata !1, metadata !42, i32 220, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!214 = metadata !{i32 214, i32 0, metadata !41, null}
!215 = metadata !{i32 216, i32 0, metadata !216, null}
!216 = metadata !{i32 786443, metadata !1, metadata !41, i32 216, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!217 = metadata !{i32 217, i32 0, metadata !216, null}
!218 = metadata !{i32 223, i32 0, metadata !212, null}
!219 = metadata !{i32 226, i32 0, metadata !30, null}
!220 = metadata !{i32 229, i32 0, metadata !45, null}
!221 = metadata !{i32 233, i32 0, metadata !62, null}
!222 = metadata !{i32 235, i32 0, metadata !60, null}
!223 = metadata !{i32 259, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !1, metadata !225, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!225 = metadata !{i32 786443, metadata !1, metadata !60, i32 257, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!226 = metadata !{i32 238, i32 0, metadata !59, null}
!227 = metadata !{i32 239, i32 0, metadata !59, null}
!228 = metadata !{i32 241, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !59, i32 241, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!230 = metadata !{i32 242, i32 0, metadata !229, null}
!231 = metadata !{i32 244, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !59, i32 244, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!233 = metadata !{i32 245, i32 0, metadata !232, null}
!234 = metadata !{i32 247, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !1, metadata !59, i32 247, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!236 = metadata !{i32 249, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !1, metadata !235, i32 248, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!238 = metadata !{i32 260, i32 0, metadata !224, null}
!239 = metadata !{i32 263, i32 0, metadata !45, null}
!240 = metadata !{i32 266, i32 0, metadata !64, null}
!241 = metadata !{i32 271, i32 0, metadata !76, null}
!242 = metadata !{i32 273, i32 0, metadata !75, null}
!243 = metadata !{i32 274, i32 0, metadata !75, null}
!244 = metadata !{i32 277, i32 0, metadata !75, null}
!245 = metadata !{i32 278, i32 0, metadata !75, null}
!246 = metadata !{metadata !247, metadata !247, i64 0}
!247 = metadata !{metadata !"int", metadata !149, i64 0}
!248 = metadata !{i32 281, i32 0, metadata !83, null}
!249 = metadata !{i32 284, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !1, metadata !82, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!251 = metadata !{i32 287, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !1, metadata !250, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!253 = metadata !{i32 286, i32 0, metadata !252, null}
!254 = metadata !{i32 288, i32 0, metadata !252, null}
!255 = metadata !{i32 289, i32 0, metadata !252, null}
!256 = metadata !{i32 292, i32 0, metadata !82, null}
!257 = metadata !{i32 786689, metadata !30, metadata !"da", metadata !5, i32 33554637, metadata !10, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [da] [line 205]
!258 = metadata !{i32 293, i32 0, metadata !82, null}
!259 = metadata !{i32 205, i32 0, metadata !30, metadata !258}
!260 = metadata !{i32 786689, metadata !30, metadata !"dx", metadata !5, i32 50331853, metadata !9, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [dx] [line 205]
!261 = metadata !{i32 786689, metadata !30, metadata !"dx_off", metadata !5, i32 67109069, metadata !15, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [dx_off] [line 205]
!262 = metadata !{i32 786689, metadata !30, metadata !"incx", metadata !5, i32 83886285, metadata !15, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [incx] [line 205]
!263 = metadata !{i32 222, i32 0, metadata !212, metadata !258}
!264 = metadata !{i32 223, i32 0, metadata !212, metadata !258}
!265 = metadata !{i32 298, i32 0, metadata !80, null}
!266 = metadata !{i32 299, i32 0, metadata !80, null}
!267 = metadata !{i32 301, i32 0, metadata !268, null}
!268 = metadata !{i32 786443, metadata !1, metadata !80, i32 301, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!269 = metadata !{i32 303, i32 0, metadata !270, null}
!270 = metadata !{i32 786443, metadata !1, metadata !268, i32 302, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!271 = metadata !{i32 304, i32 0, metadata !270, null}
!272 = metadata !{i32 305, i32 0, metadata !270, null}
!273 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [da] [line 229]
!274 = metadata !{i32 307, i32 0, metadata !80, null}
!275 = metadata !{i32 229, i32 0, metadata !45, metadata !274}
!276 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!277 = metadata !{i32 786689, metadata !45, metadata !"dx_off", metadata !5, i32 67109093, metadata !15, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!278 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!279 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!280 = metadata !{i32 786689, metadata !45, metadata !"dy_off", metadata !5, i32 117440741, metadata !15, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!281 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !274} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!282 = metadata !{i32 233, i32 0, metadata !62, metadata !274}
!283 = metadata !{i32 260, i32 0, metadata !224, metadata !274}
!284 = metadata !{i32 259, i32 0, metadata !224, metadata !274}
!285 = metadata !{i32 296, i32 0, metadata !81, null}
!286 = metadata !{i32 312, i32 0, metadata !64, null}
!287 = metadata !{i32 313, i32 0, metadata !64, null}
!288 = metadata !{i32 317, i32 0, metadata !84, null}
!289 = metadata !{i32 323, i32 0, metadata !96, null}
!290 = metadata !{i32 325, i32 0, metadata !95, null}
!291 = metadata !{i32 326, i32 0, metadata !95, null}
!292 = metadata !{i32 328, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !95, i32 328, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!294 = metadata !{i32 330, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !293, i32 329, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!296 = metadata !{i32 331, i32 0, metadata !295, null}
!297 = metadata !{i32 332, i32 0, metadata !295, null}
!298 = metadata !{i32 335, i32 0, metadata !95, null}
!299 = metadata !{i32 786689, metadata !45, metadata !"da", metadata !5, i32 33554661, metadata !10, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [da] [line 229]
!300 = metadata !{i32 229, i32 0, metadata !45, metadata !298}
!301 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!302 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!303 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!304 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!305 = metadata !{i32 233, i32 0, metadata !62, metadata !298}
!306 = metadata !{i32 260, i32 0, metadata !224, metadata !298}
!307 = metadata !{i32 259, i32 0, metadata !224, metadata !298}
!308 = metadata !{i32 339, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !84, i32 339, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!310 = metadata !{i32 341, i32 0, metadata !311, null}
!311 = metadata !{i32 786443, metadata !1, metadata !309, i32 340, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!312 = metadata !{i32 342, i32 0, metadata !311, null}
!313 = metadata !{i32 786689, metadata !45, metadata !"dx", metadata !5, i32 50331877, metadata !9, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [dx] [line 229]
!314 = metadata !{i32 344, i32 0, metadata !311, null}
!315 = metadata !{i32 229, i32 0, metadata !45, metadata !314}
!316 = metadata !{i32 786689, metadata !45, metadata !"dx_off", metadata !5, i32 67109093, metadata !15, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [dx_off] [line 229]
!317 = metadata !{i32 786689, metadata !45, metadata !"incx", metadata !5, i32 83886309, metadata !15, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [incx] [line 229]
!318 = metadata !{i32 786689, metadata !45, metadata !"dy", metadata !5, i32 100663525, metadata !9, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [dy] [line 229]
!319 = metadata !{i32 786689, metadata !45, metadata !"dy_off", metadata !5, i32 117440741, metadata !15, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [dy_off] [line 229]
!320 = metadata !{i32 786689, metadata !45, metadata !"incy", metadata !5, i32 134217957, metadata !15, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [incy] [line 229]
!321 = metadata !{i32 233, i32 0, metadata !62, metadata !314}
!322 = metadata !{i32 260, i32 0, metadata !224, metadata !314}
!323 = metadata !{i32 259, i32 0, metadata !224, metadata !314}
!324 = metadata !{i32 346, i32 0, metadata !84, null}
!325 = metadata !{i32 348, i32 0, metadata !98, null}
!326 = metadata !{i8 0}
!327 = metadata !{i32 353, i32 0, metadata !98, null}
!328 = metadata !{i32 355, i32 0, metadata !329, null}
!329 = metadata !{i32 786443, metadata !1, metadata !98, i32 355, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!330 = metadata !{i32 359, i32 0, metadata !331, null}
!331 = metadata !{i32 786443, metadata !1, metadata !332, i32 359, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!332 = metadata !{i32 786443, metadata !1, metadata !333, i32 358, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!333 = metadata !{i32 786443, metadata !1, metadata !334, i32 357, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!334 = metadata !{i32 786443, metadata !1, metadata !329, i32 356, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!335 = metadata !{i32 357, i32 0, metadata !333, null}
!336 = metadata !{i32 367, i32 0, metadata !98, null}
!337 = metadata !{i32 369, i32 0, metadata !338, null}
!338 = metadata !{i32 786443, metadata !1, metadata !98, i32 369, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!339 = metadata !{i32 370, i32 0, metadata !338, null}
!340 = metadata !{i32 372, i32 0, metadata !98, null}
!341 = metadata !{double* undef}
!342 = metadata !{i32 373, i32 0, metadata !98, null}
!343 = metadata !{i32 374, i32 0, metadata !98, null}
!344 = metadata !{double 0x41F3E5E475555555}
!345 = metadata !{i32 377, i32 0, metadata !98, null}
!346 = metadata !{i32 380, i32 0, metadata !98, null}
!347 = metadata !{i32 387, i32 0, metadata !98, null}
!348 = metadata !{i32 388, i32 0, metadata !98, null}
!349 = metadata !{double 0.000000e+00}
!350 = metadata !{i32 392, i32 0, metadata !98, null}
!351 = metadata !{i32 395, i32 0, metadata !98, null}
!352 = metadata !{i32 397, i32 0, metadata !98, null}
!353 = metadata !{i32 399, i32 0, metadata !354, null}
!354 = metadata !{i32 786443, metadata !1, metadata !98, i32 399, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!355 = metadata !{i32 400, i32 0, metadata !354, null}
!356 = metadata !{i32 402, i32 0, metadata !98, null}
!357 = metadata !{i32 406, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !98, i32 405, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!359 = metadata !{i32 405, i32 0, metadata !358, null}
!360 = metadata !{i32 408, i32 0, metadata !358, null}
!361 = metadata !{i32 410, i32 0, metadata !98, null}
!362 = metadata !{i32 413, i32 0, metadata !98, null}
