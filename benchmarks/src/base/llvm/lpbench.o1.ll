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

; Function Attrs: nounwind uwtable
define void @matgen(double** nocapture readonly %a, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !12), !dbg !157
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !13), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !14), !dbg !159
  br label %.preheader3, !dbg !159

.preheader3:                                      ; preds = %6, %0
  %indvars.iv19 = phi i64 [ 0, %0 ], [ %indvars.iv.next20, %6 ]
  br label %1, !dbg !161

; <label>:1                                       ; preds = %1, %.preheader3
  %indvars.iv16 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next17, %1 ]
  %2 = tail call fastcc double @random_double(), !dbg !163
  %3 = getelementptr inbounds double** %a, i64 %indvars.iv16, !dbg !163
  %4 = load double** %3, align 8, !dbg !163, !tbaa !164
  %5 = getelementptr inbounds double* %4, i64 %indvars.iv19, !dbg !163
  store double %2, double* %5, align 8, !dbg !163, !tbaa !168
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1, !dbg !161
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000, !dbg !161
  br i1 %exitcond18, label %6, label %1, !dbg !161

; <label>:6                                       ; preds = %1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1, !dbg !159
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000, !dbg !159
  br i1 %exitcond21, label %.preheader1, label %.preheader3, !dbg !159

.preheader1:                                      ; preds = %6
  %b15 = bitcast double* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %b15, i8 0, i64 16000, i32 8, i1 false), !dbg !170
  br label %.preheader, !dbg !172

.preheader:                                       ; preds = %15, %.preheader1
  %indvars.iv9 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next10, %15 ]
  %7 = getelementptr inbounds double** %a, i64 %indvars.iv9, !dbg !174
  %8 = load double** %7, align 8, !dbg !174, !tbaa !164
  br label %9, !dbg !176

; <label>:9                                       ; preds = %9, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %9 ]
  %10 = getelementptr inbounds double* %8, i64 %indvars.iv, !dbg !174
  %11 = load double* %10, align 8, !dbg !174, !tbaa !168
  %12 = getelementptr inbounds double* %b, i64 %indvars.iv, !dbg !174
  %13 = load double* %12, align 8, !dbg !174, !tbaa !168
  %14 = fadd double %11, %13, !dbg !174
  store double %14, double* %12, align 8, !dbg !174, !tbaa !168
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !176
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !176
  br i1 %exitcond, label %15, label %9, !dbg !176

; <label>:15                                      ; preds = %9
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !172
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 2000, !dbg !172
  br i1 %exitcond11, label %16, label %.preheader, !dbg !172

; <label>:16                                      ; preds = %15
  ret void, !dbg !177
}

; Function Attrs: nounwind readonly uwtable
define i32 @idamax(i32 %n, double* nocapture readonly %dx, i32 %dx_off, i32 %incx) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !21), !dbg !178
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !22), !dbg !178
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !23), !dbg !178
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !24), !dbg !178
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !29), !dbg !179
  %1 = icmp slt i32 %n, 1, !dbg !180
  br i1 %1, label %.loopexit, label %2, !dbg !180

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %n, 1, !dbg !182
  br i1 %3, label %.loopexit, label %4, !dbg !182

; <label>:4                                       ; preds = %2
  %5 = icmp eq i32 %incx, 1, !dbg !185
  %6 = sext i32 %dx_off to i64, !dbg !188
  %7 = getelementptr inbounds double* %dx, i64 %6, !dbg !188
  %8 = load double* %7, align 8, !dbg !188, !tbaa !168
  %9 = tail call double @fabs(double %8) #4, !dbg !188
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !25), !dbg !188
  %10 = icmp sgt i32 %n, 1, !dbg !190
  br i1 %5, label %.preheader, label %12, !dbg !185

.preheader:                                       ; preds = %4
  br i1 %10, label %.lr.ph, label %.loopexit, !dbg !190

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %dx_off to i64, !dbg !190
  br label %24, !dbg !190

; <label>:12                                      ; preds = %4
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !28), !dbg !192
  tail call void @llvm.dbg.value(metadata !194, i64 0, metadata !27), !dbg !195
  br i1 %10, label %.lr.ph9, label %.loopexit, !dbg !195

.lr.ph9:                                          ; preds = %12
  %13 = add nsw i32 %incx, 1, !dbg !192
  %14 = sext i32 %13 to i64
  %15 = sext i32 %incx to i64
  %16 = sext i32 %dx_off to i64, !dbg !195
  br label %17, !dbg !195

; <label>:17                                      ; preds = %17, %.lr.ph9
  %indvars.iv11 = phi i64 [ %14, %.lr.ph9 ], [ %indvars.iv.next12, %17 ]
  %itemp.08 = phi i32 [ 0, %.lr.ph9 ], [ %itemp.1, %17 ]
  %i.06 = phi i32 [ 1, %.lr.ph9 ], [ %23, %17 ]
  %dmax.05 = phi double [ %9, %.lr.ph9 ], [ %dmax.1, %17 ]
  %18 = add nsw i64 %indvars.iv11, %16, !dbg !197
  %19 = getelementptr inbounds double* %dx, i64 %18, !dbg !197
  %20 = load double* %19, align 8, !dbg !197, !tbaa !168
  %21 = tail call double @fabs(double %20) #4, !dbg !197
  tail call void @llvm.dbg.value(metadata !{double %21}, i64 0, metadata !26), !dbg !197
  %22 = fcmp ogt double %21, %dmax.05, !dbg !199
  tail call void @llvm.dbg.value(metadata !{i32 %i.06}, i64 0, metadata !29), !dbg !201
  tail call void @llvm.dbg.value(metadata !{double %21}, i64 0, metadata !25), !dbg !203
  %dmax.1 = select i1 %22, double %21, double %dmax.05, !dbg !199
  %itemp.1 = select i1 %22, i32 %i.06, i32 %itemp.08, !dbg !199
  %23 = add nsw i32 %i.06, 1, !dbg !195
  tail call void @llvm.dbg.value(metadata !{i32 %23}, i64 0, metadata !27), !dbg !195
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %15, !dbg !195
  %exitcond13 = icmp eq i32 %23, %n, !dbg !195
  br i1 %exitcond13, label %.loopexit, label %17, !dbg !195

; <label>:24                                      ; preds = %24, %.lr.ph
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %24 ]
  %itemp.24 = phi i32 [ 0, %.lr.ph ], [ %itemp.3, %24 ]
  %dmax.22 = phi double [ %9, %.lr.ph ], [ %dmax.3, %24 ]
  %25 = add nsw i64 %indvars.iv, %11, !dbg !204
  %26 = getelementptr inbounds double* %dx, i64 %25, !dbg !204
  %27 = load double* %26, align 8, !dbg !204, !tbaa !168
  %28 = tail call double @fabs(double %27) #4, !dbg !204
  tail call void @llvm.dbg.value(metadata !{double %28}, i64 0, metadata !26), !dbg !204
  %29 = fcmp ogt double %28, %dmax.22, !dbg !206
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !29), !dbg !209
  tail call void @llvm.dbg.value(metadata !{double %28}, i64 0, metadata !25), !dbg !211
  %dmax.3 = select i1 %29, double %28, double %dmax.22, !dbg !206
  %30 = trunc i64 %indvars.iv to i32, !dbg !206
  %itemp.3 = select i1 %29, i32 %30, i32 %itemp.24, !dbg !206
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !190
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !190
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !190
  br i1 %exitcond, label %.loopexit, label %24, !dbg !190

.loopexit:                                        ; preds = %17, %24, %12, %.preheader, %2, %0
  %itemp.4 = phi i32 [ -1, %0 ], [ 0, %2 ], [ 0, %.preheader ], [ 0, %12 ], [ %itemp.3, %24 ], [ %itemp.1, %17 ]
  ret i32 %itemp.4, !dbg !212
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #2

; Function Attrs: nounwind uwtable
define void @dscal(i32 %n, double %da, double* nocapture %dx, i32 %dx_off, i32 %incx) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !34), !dbg !213
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !35), !dbg !213
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !36), !dbg !213
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !37), !dbg !213
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !38), !dbg !213
  %1 = icmp sgt i32 %n, 0, !dbg !214
  br i1 %1, label %2, label %.loopexit, !dbg !214

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %incx, 1, !dbg !215
  br i1 %3, label %.preheader, label %6, !dbg !215

.preheader:                                       ; preds = %2
  %4 = icmp sgt i32 %n, 0, !dbg !216
  br i1 %4, label %.lr.ph, label %.loopexit, !dbg !216

.lr.ph:                                           ; preds = %.preheader
  %5 = sext i32 %dx_off to i64, !dbg !216
  br label %18, !dbg !216

; <label>:6                                       ; preds = %2
  %7 = mul nsw i32 %incx, %n, !dbg !219
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !40), !dbg !219
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !39), !dbg !220
  %8 = icmp sgt i32 %7, 0, !dbg !220
  br i1 %8, label %.lr.ph4, label %.loopexit, !dbg !220

.lr.ph4:                                          ; preds = %6
  %9 = sext i32 %incx to i64
  %10 = sext i32 %dx_off to i64, !dbg !220
  br label %11, !dbg !220

; <label>:11                                      ; preds = %.lr.ph4, %11
  %indvars.iv5 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next6, %11 ]
  %12 = add nsw i64 %indvars.iv5, %10, !dbg !222
  %13 = getelementptr inbounds double* %dx, i64 %12, !dbg !222
  %14 = load double* %13, align 8, !dbg !222, !tbaa !168
  %15 = fmul double %14, %da, !dbg !222
  store double %15, double* %13, align 8, !dbg !222, !tbaa !168
  %indvars.iv.next6 = add nsw i64 %indvars.iv5, %9, !dbg !220
  %16 = trunc i64 %indvars.iv.next6 to i32, !dbg !220
  %17 = icmp slt i32 %16, %7, !dbg !220
  br i1 %17, label %11, label %.loopexit, !dbg !220

; <label>:18                                      ; preds = %18, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %18 ]
  %19 = add nsw i64 %indvars.iv, %5, !dbg !223
  %20 = getelementptr inbounds double* %dx, i64 %19, !dbg !223
  %21 = load double* %20, align 8, !dbg !223, !tbaa !168
  %22 = fmul double %21, %da, !dbg !223
  store double %22, double* %20, align 8, !dbg !223, !tbaa !168
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !216
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !216
  %exitcond = icmp eq i32 %lftr.wideiv, %n, !dbg !216
  br i1 %exitcond, label %.loopexit, label %18, !dbg !216

.loopexit:                                        ; preds = %11, %18, %6, %.preheader, %0
  ret void, !dbg !224
}

; Function Attrs: nounwind uwtable
define void @daxpy(i32 %n, double %da, double* nocapture readonly %dx, i32 %dx_off, i32 %incx, double* nocapture %dy, i32 %dy_off, i32 %incy) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !49), !dbg !225
  tail call void @llvm.dbg.value(metadata !{double %da}, i64 0, metadata !50), !dbg !225
  tail call void @llvm.dbg.value(metadata !{double* %dx}, i64 0, metadata !51), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %dx_off}, i64 0, metadata !52), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %incx}, i64 0, metadata !53), !dbg !225
  tail call void @llvm.dbg.value(metadata !{double* %dy}, i64 0, metadata !54), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %dy_off}, i64 0, metadata !55), !dbg !225
  tail call void @llvm.dbg.value(metadata !{i32 %incy}, i64 0, metadata !56), !dbg !225
  %1 = icmp sgt i32 %n, 0, !dbg !226
  %2 = fcmp une double %da, 0.000000e+00, !dbg !226
  %or.cond = and i1 %1, %2, !dbg !226
  br i1 %or.cond, label %3, label %.loopexit, !dbg !226

; <label>:3                                       ; preds = %0
  %4 = icmp ne i32 %incx, 1, !dbg !227
  %5 = icmp ne i32 %incy, 1, !dbg !227
  %or.cond3 = or i1 %4, %5, !dbg !227
  br i1 %or.cond3, label %9, label %.preheader4, !dbg !227

.preheader4:                                      ; preds = %3
  %6 = icmp sgt i32 %n, 0, !dbg !228
  br i1 %6, label %.lr.ph10, label %.loopexit, !dbg !228

.lr.ph10:                                         ; preds = %.preheader4
  %7 = sext i32 %dy_off to i64, !dbg !228
  %8 = sext i32 %dx_off to i64, !dbg !228
  br label %34, !dbg !228

; <label>:9                                       ; preds = %3
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !58), !dbg !231
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !63), !dbg !232
  %10 = icmp slt i32 %incx, 0, !dbg !233
  br i1 %10, label %11, label %14, !dbg !233

; <label>:11                                      ; preds = %9
  %12 = sub nsw i32 1, %n, !dbg !235
  %13 = mul nsw i32 %12, %incx, !dbg !235
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !58), !dbg !235
  %phitmp16 = sext i32 %13 to i64, !dbg !235
  br label %14, !dbg !235

; <label>:14                                      ; preds = %11, %9
  %ix.0 = phi i64 [ %phitmp16, %11 ], [ 0, %9 ]
  %15 = icmp slt i32 %incy, 0, !dbg !236
  br i1 %15, label %16, label %.preheader, !dbg !236

; <label>:16                                      ; preds = %14
  %17 = sub nsw i32 1, %n, !dbg !238
  %18 = mul nsw i32 %17, %incy, !dbg !238
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !63), !dbg !238
  %phitmp = sext i32 %18 to i64, !dbg !238
  br label %.preheader, !dbg !238

.preheader:                                       ; preds = %16, %14
  %iy.1.ph = phi i64 [ 0, %14 ], [ %phitmp, %16 ]
  %19 = icmp sgt i32 %n, 0, !dbg !239
  br i1 %19, label %.lr.ph, label %.loopexit, !dbg !239

.lr.ph:                                           ; preds = %.preheader
  %20 = sext i32 %incy to i64
  %21 = sext i32 %dy_off to i64, !dbg !239
  %22 = sext i32 %incx to i64
  %23 = sext i32 %dx_off to i64, !dbg !239
  br label %24, !dbg !239

; <label>:24                                      ; preds = %24, %.lr.ph
  %indvars.iv11 = phi i64 [ %ix.0, %.lr.ph ], [ %indvars.iv.next12, %24 ]
  %indvars.iv = phi i64 [ %iy.1.ph, %.lr.ph ], [ %indvars.iv.next, %24 ]
  %i.06 = phi i32 [ 0, %.lr.ph ], [ %33, %24 ]
  %25 = add nsw i64 %indvars.iv11, %23, !dbg !241
  %26 = getelementptr inbounds double* %dx, i64 %25, !dbg !241
  %27 = load double* %26, align 8, !dbg !241, !tbaa !168
  %28 = fmul double %27, %da, !dbg !241
  %29 = add nsw i64 %indvars.iv, %21, !dbg !241
  %30 = getelementptr inbounds double* %dy, i64 %29, !dbg !241
  %31 = load double* %30, align 8, !dbg !241, !tbaa !168
  %32 = fadd double %31, %28, !dbg !241
  store double %32, double* %30, align 8, !dbg !241, !tbaa !168
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, %22, !dbg !239
  %indvars.iv.next = add nsw i64 %indvars.iv, %20, !dbg !239
  %33 = add nsw i32 %i.06, 1, !dbg !239
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !57), !dbg !239
  %exitcond = icmp eq i32 %33, %n, !dbg !239
  br i1 %exitcond, label %.loopexit, label %24, !dbg !239

; <label>:34                                      ; preds = %34, %.lr.ph10
  %indvars.iv13 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next14, %34 ]
  %35 = add nsw i64 %indvars.iv13, %8, !dbg !243
  %36 = getelementptr inbounds double* %dx, i64 %35, !dbg !243
  %37 = load double* %36, align 8, !dbg !243, !tbaa !168
  %38 = fmul double %37, %da, !dbg !243
  %39 = add nsw i64 %indvars.iv13, %7, !dbg !243
  %40 = getelementptr inbounds double* %dy, i64 %39, !dbg !243
  %41 = load double* %40, align 8, !dbg !243, !tbaa !168
  %42 = fadd double %41, %38, !dbg !243
  store double %42, double* %40, align 8, !dbg !243, !tbaa !168
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1, !dbg !228
  %lftr.wideiv = trunc i64 %indvars.iv.next14 to i32, !dbg !228
  %exitcond15 = icmp eq i32 %lftr.wideiv, %n, !dbg !228
  br i1 %exitcond15, label %.loopexit, label %34, !dbg !228

.loopexit:                                        ; preds = %34, %24, %.preheader4, %.preheader, %0
  ret void, !dbg !244
}

; Function Attrs: nounwind uwtable
define void @dgefa(double** nocapture readonly %a, i32* nocapture %ipvt) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !69), !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !70), !dbg !245
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !72), !dbg !246
  br label %1, !dbg !246

; <label>:1                                       ; preds = %.backedge, %0
  %indvars.iv5 = phi i64 [ 0, %0 ], [ %indvars.iv.next6, %.backedge ]
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %.backedge ]
  %k.02 = phi i32 [ 0, %0 ], [ %4, %.backedge ]
  %2 = getelementptr inbounds double** %a, i64 %indvars.iv5, !dbg !247
  %3 = load double** %2, align 8, !dbg !247, !tbaa !164
  tail call void @llvm.dbg.value(metadata !{double* %3}, i64 0, metadata !74), !dbg !247
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !246
  %4 = add nsw i32 %k.02, 1, !dbg !248
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !77), !dbg !248
  %5 = sub nsw i32 2000, %k.02, !dbg !249
  %6 = trunc i64 %indvars.iv5 to i32, !dbg !249
  %7 = tail call i32 @idamax(i32 %5, double* %3, i32 %6, i32 1), !dbg !249
  %8 = trunc i64 %indvars.iv5 to i32, !dbg !249
  %9 = add nsw i32 %7, %8, !dbg !249
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !78), !dbg !249
  %10 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv5, !dbg !250
  store i32 %9, i32* %10, align 4, !dbg !250, !tbaa !251
  %11 = sext i32 %9 to i64, !dbg !253
  %12 = getelementptr inbounds double* %3, i64 %11, !dbg !253
  %13 = load double* %12, align 8, !dbg !253, !tbaa !168
  %14 = fcmp une double %13, 0.000000e+00, !dbg !253
  br i1 %14, label %15, label %.backedge, !dbg !253

.backedge:                                        ; preds = %33, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !246
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1999, !dbg !246
  br i1 %exitcond7, label %35, label %1, !dbg !246

; <label>:15                                      ; preds = %1
  %16 = icmp ne i32 %7, 0, !dbg !254
  br i1 %16, label %17, label %.lr.ph, !dbg !254

; <label>:17                                      ; preds = %15
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !71), !dbg !256
  %18 = getelementptr inbounds double* %3, i64 %indvars.iv5, !dbg !258
  %19 = load double* %18, align 8, !dbg !258, !tbaa !168
  store double %19, double* %12, align 8, !dbg !258, !tbaa !168
  store double %13, double* %18, align 8, !dbg !259, !tbaa !168
  br label %.lr.ph, !dbg !260

.lr.ph:                                           ; preds = %15, %17
  %20 = getelementptr inbounds double* %3, i64 %indvars.iv5, !dbg !261
  %21 = load double* %20, align 8, !dbg !261, !tbaa !168
  %22 = fdiv double -1.000000e+00, %21, !dbg !261
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !71), !dbg !261
  %23 = sub i64 1999, %indvars.iv5, !dbg !262
  %24 = trunc i64 %23 to i32, !dbg !262
  tail call void @dscal(i32 %24, double %22, double* %3, i32 %4, i32 1), !dbg !262
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !73), !dbg !263
  br label %25, !dbg !263

; <label>:25                                      ; preds = %33, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv, %.lr.ph ], [ %indvars.iv.next4, %33 ]
  %26 = getelementptr inbounds double** %a, i64 %indvars.iv3, !dbg !264
  %27 = load double** %26, align 8, !dbg !264, !tbaa !164
  tail call void @llvm.dbg.value(metadata !{double* %27}, i64 0, metadata !79), !dbg !264
  %28 = getelementptr inbounds double* %27, i64 %11, !dbg !265
  %29 = load double* %28, align 8, !dbg !265, !tbaa !168
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !71), !dbg !265
  br i1 %16, label %30, label %33, !dbg !266

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds double* %27, i64 %indvars.iv5, !dbg !268
  %32 = load double* %31, align 8, !dbg !268, !tbaa !168
  store double %32, double* %28, align 8, !dbg !268, !tbaa !168
  store double %29, double* %31, align 8, !dbg !270, !tbaa !168
  br label %33, !dbg !271

; <label>:33                                      ; preds = %30, %25
  %34 = trunc i64 %23 to i32, !dbg !272
  tail call void @daxpy(i32 %34, double %29, double* %3, i32 %4, i32 1, double* %27, i32 %4, i32 1), !dbg !272
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !263
  %lftr.wideiv = trunc i64 %indvars.iv.next4 to i32, !dbg !263
  %exitcond = icmp eq i32 %lftr.wideiv, 2000, !dbg !263
  br i1 %exitcond, label %.backedge, label %25, !dbg !263

; <label>:35                                      ; preds = %.backedge
  %36 = getelementptr inbounds i32* %ipvt, i64 1999, !dbg !273
  store i32 1999, i32* %36, align 4, !dbg !273, !tbaa !251
  ret void, !dbg !274
}

; Function Attrs: nounwind uwtable
define void @dgesl(double** nocapture readonly %a, i32* nocapture readonly %ipvt, double* nocapture %b) #0 {
  tail call void @llvm.dbg.value(metadata !{double** %a}, i64 0, metadata !88), !dbg !275
  tail call void @llvm.dbg.value(metadata !{i32* %ipvt}, i64 0, metadata !89), !dbg !275
  tail call void @llvm.dbg.value(metadata !{double* %b}, i64 0, metadata !90), !dbg !275
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !92), !dbg !276
  br label %1, !dbg !276

; <label>:1                                       ; preds = %12, %0
  %indvars.iv3 = phi i64 [ 0, %0 ], [ %indvars.iv.next4, %12 ]
  %k.02 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %2 = getelementptr inbounds i32* %ipvt, i64 %indvars.iv3, !dbg !277
  %3 = load i32* %2, align 4, !dbg !277, !tbaa !251
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !94), !dbg !277
  %4 = sext i32 %3 to i64, !dbg !278
  %5 = getelementptr inbounds double* %b, i64 %4, !dbg !278
  %6 = load double* %5, align 8, !dbg !278, !tbaa !168
  tail call void @llvm.dbg.value(metadata !{double %6}, i64 0, metadata !91), !dbg !278
  %7 = trunc i64 %indvars.iv3 to i32, !dbg !279
  %8 = icmp eq i32 %3, %7, !dbg !279
  br i1 %8, label %12, label %9, !dbg !279

; <label>:9                                       ; preds = %1
  %10 = getelementptr inbounds double* %b, i64 %indvars.iv3, !dbg !281
  %11 = load double* %10, align 8, !dbg !281, !tbaa !168
  store double %11, double* %5, align 8, !dbg !281, !tbaa !168
  store double %6, double* %10, align 8, !dbg !283, !tbaa !168
  br label %12, !dbg !284

; <label>:12                                      ; preds = %1, %9
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !276
  %13 = add nsw i32 %k.02, 1, !dbg !285
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !97), !dbg !285
  %14 = sub i64 1999, %indvars.iv3, !dbg !286
  %15 = getelementptr inbounds double** %a, i64 %indvars.iv3, !dbg !286
  %16 = load double** %15, align 8, !dbg !286, !tbaa !164
  %17 = trunc i64 %14 to i32, !dbg !286
  tail call void @daxpy(i32 %17, double %6, double* %16, i32 %13, i32 1, double* %b, i32 %13, i32 1), !dbg !286
  tail call void @llvm.dbg.value(metadata !{i32 %13}, i64 0, metadata !92), !dbg !276
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1999, !dbg !276
  br i1 %exitcond5, label %.preheader, label %1, !dbg !276

.preheader:                                       ; preds = %12, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %12 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !287
  %18 = sub i64 1999, %indvars.iv, !dbg !289
  %19 = getelementptr inbounds double** %a, i64 %18, !dbg !291
  %20 = load double** %19, align 8, !dbg !291, !tbaa !164
  %21 = getelementptr inbounds double* %20, i64 %18, !dbg !291
  %22 = load double* %21, align 8, !dbg !291, !tbaa !168
  %23 = getelementptr inbounds double* %b, i64 %18, !dbg !291
  %24 = load double* %23, align 8, !dbg !291, !tbaa !168
  %25 = fdiv double %24, %22, !dbg !291
  store double %25, double* %23, align 8, !dbg !291, !tbaa !168
  %26 = fsub double -0.000000e+00, %25, !dbg !292
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !91), !dbg !292
  %27 = load double** %19, align 8, !dbg !293, !tbaa !164
  %28 = trunc i64 %18 to i32, !dbg !293
  tail call void @daxpy(i32 %28, double %26, double* %27, i32 0, i32 1, double* %b, i32 0, i32 1), !dbg !293
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !287
  br i1 %exitcond, label %29, label %.preheader, !dbg !287

; <label>:29                                      ; preds = %.preheader
  ret void, !dbg !294
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !105), !dbg !295
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !106), !dbg !295
  tail call void @llvm.dbg.value(metadata !296, i64 0, metadata !108), !dbg !297
  %1 = icmp sgt i32 %argc, 1, !dbg !298
  br i1 %1, label %.lr.ph, label %.loopexit, !dbg !298

.lr.ph:                                           ; preds = %0
  %2 = getelementptr inbounds i8** %argv, i64 1, !dbg !299
  %3 = load i8** %2, align 8, !dbg !299, !tbaa !164
  %4 = load i8* %3, align 1, !dbg !299, !tbaa !300
  %5 = zext i8 %4 to i32, !dbg !299
  %6 = sub nsw i32 45, %5, !dbg !299
  %7 = icmp eq i8 %4, 45, !dbg !301
  %8 = getelementptr inbounds i8* %3, i64 1, !dbg !303
  %9 = getelementptr inbounds i8* %3, i64 2, !dbg !305
  %10 = getelementptr inbounds i8* %3, i64 3, !dbg !308
  br label %13, !dbg !310

; <label>:11                                      ; preds = %28
  %12 = icmp slt i32 %29, %argc, !dbg !310
  br i1 %12, label %13, label %.loopexit, !dbg !310

; <label>:13                                      ; preds = %.lr.ph, %11
  %i.08 = phi i32 [ 1, %.lr.ph ], [ %29, %11 ]
  tail call void @llvm.dbg.value(metadata !311, i64 0, metadata !120), !dbg !312
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !121), !dbg !299
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !126), !dbg !299
  br i1 %7, label %14, label %28, !dbg !301

; <label>:14                                      ; preds = %13
  %15 = load i8* %8, align 1, !dbg !303, !tbaa !300
  %16 = zext i8 %15 to i32, !dbg !303
  %17 = sub nsw i32 103, %16, !dbg !303
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !126), !dbg !303
  %18 = icmp eq i8 %15, 103, !dbg !313
  br i1 %18, label %19, label %28, !dbg !313

; <label>:19                                      ; preds = %14
  %20 = load i8* %9, align 1, !dbg !305, !tbaa !300
  %21 = zext i8 %20 to i32, !dbg !305
  %22 = sub nsw i32 97, %21, !dbg !305
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !126), !dbg !305
  %23 = icmp eq i8 %20, 97, !dbg !308
  br i1 %23, label %24, label %28, !dbg !308

; <label>:24                                      ; preds = %19
  %25 = load i8* %10, align 1, !dbg !308, !tbaa !300
  %26 = zext i8 %25 to i32, !dbg !308
  %27 = sub nsw i32 0, %26, !dbg !308
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !126), !dbg !308
  br label %28, !dbg !308

; <label>:28                                      ; preds = %14, %24, %19, %13
  %__result.0 = phi i32 [ %27, %24 ], [ %22, %19 ], [ %17, %14 ], [ %6, %13 ]
  %phitmp = icmp eq i32 %__result.0, 0, !dbg !299
  %29 = add nsw i32 %i.08, 1, !dbg !310
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !107), !dbg !310
  br i1 %phitmp, label %.loopexit, label %11, !dbg !312

.loopexit:                                        ; preds = %11, %28, %0
  %ga_testing.0 = phi i1 [ false, %0 ], [ false, %11 ], [ true, %28 ]
  %30 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !314
  %31 = bitcast i8* %30 to double**, !dbg !314
  tail call void @llvm.dbg.value(metadata !{double** %31}, i64 0, metadata !127), !dbg !314
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !107), !dbg !315
  br label %32, !dbg !315

; <label>:32                                      ; preds = %32, %.loopexit
  %indvars.iv11 = phi i64 [ 0, %.loopexit ], [ %indvars.iv.next12, %32 ]
  %33 = tail call noalias i8* @malloc(i64 16008) #5, !dbg !317
  %34 = bitcast i8* %33 to double*, !dbg !317
  %35 = getelementptr inbounds double** %31, i64 %indvars.iv11, !dbg !317
  store double* %34, double** %35, align 8, !dbg !317, !tbaa !164
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !315
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000, !dbg !315
  br i1 %exitcond13, label %36, label %32, !dbg !315

; <label>:36                                      ; preds = %32
  %37 = tail call noalias i8* @malloc(i64 16000) #5, !dbg !318
  %38 = bitcast i8* %37 to double*, !dbg !318
  tail call void @llvm.dbg.value(metadata !{double* %38}, i64 0, metadata !128), !dbg !318
  tail call void @llvm.dbg.value(metadata !319, i64 0, metadata !129), !dbg !320
  %39 = tail call noalias i8* @malloc(i64 8000) #5, !dbg !321
  %40 = bitcast i8* %39 to i32*, !dbg !321
  tail call void @llvm.dbg.value(metadata !{i32* %40}, i64 0, metadata !130), !dbg !321
  tail call void @llvm.dbg.value(metadata !322, i64 0, metadata !131), !dbg !323
  tail call void @matgen(double** %31, double* %38), !dbg !324
  tail call void @dgefa(double** %31, i32* %40), !dbg !325
  tail call void @dgesl(double** %31, i32* %40, double* %38), !dbg !326
  tail call void @llvm.dbg.value(metadata !327, i64 0, metadata !132), !dbg !328
  tail call void @free(i8* %39) #5, !dbg !329
  tail call void @free(i8* %37) #5, !dbg !330
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !107), !dbg !331
  br label %41, !dbg !331

; <label>:41                                      ; preds = %41, %36
  %indvars.iv = phi i64 [ 0, %36 ], [ %indvars.iv.next, %41 ]
  %42 = getelementptr inbounds double** %31, i64 %indvars.iv, !dbg !333
  %43 = load double** %42, align 8, !dbg !333, !tbaa !164
  %44 = bitcast double* %43 to i8*, !dbg !333
  tail call void @free(i8* %44) #5, !dbg !333
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !331
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !331
  br i1 %exitcond, label %45, label %41, !dbg !331

; <label>:45                                      ; preds = %41
  tail call void @free(i8* %30) #5, !dbg !334
  %46 = load %struct._IO_FILE** @stdout, align 8, !dbg !335, !tbaa !164
  br i1 %ga_testing.0, label %47, label %49, !dbg !337

; <label>:47                                      ; preds = %45
  %48 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), double 0.000000e+00) #5, !dbg !335
  br label %51, !dbg !335

; <label>:49                                      ; preds = %45
  %50 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), double 0.000000e+00) #5, !dbg !338
  br label %51

; <label>:51                                      ; preds = %49, %47
  %52 = load %struct._IO_FILE** @stdout, align 8, !dbg !339, !tbaa !164
  %53 = tail call i32 @fflush(%struct._IO_FILE* %52) #5, !dbg !339
  ret i32 0, !dbg !340
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind uwtable
define internal fastcc double @random_double() #0 {
  %1 = load i64* @seed, align 8, !dbg !341, !tbaa !342
  %2 = xor i64 %1, 123459876, !dbg !341
  %3 = sdiv i64 %2, 127773, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i64 %3}, i64 0, metadata !137), !dbg !344
  %4 = mul i64 %3, -127773, !dbg !345
  %5 = add i64 %4, %2, !dbg !345
  %6 = mul nsw i64 %5, 16807, !dbg !345
  %7 = mul i64 %3, -2836, !dbg !345
  %8 = add i64 %6, %7, !dbg !345
  %9 = icmp slt i64 %8, 0, !dbg !346
  %10 = add nsw i64 %8, 2147483647, !dbg !348
  %. = select i1 %9, i64 %10, i64 %8, !dbg !346
  %11 = sitofp i64 %. to double, !dbg !349
  %12 = fmul double %11, 0x3E00000000200FE1, !dbg !349
  tail call void @llvm.dbg.value(metadata !{double %12}, i64 0, metadata !139), !dbg !349
  %13 = xor i64 %., 123459876, !dbg !350
  store i64 %13, i64* @seed, align 8, !dbg !350, !tbaa !342
  ret double %12, !dbg !351
}

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
!133 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"random_double", metadata !"random_double", metadata !"", i32 52, metadata !134, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 true, double ()* @random_double, null, null, metadata !136, i32 53} ; [ DW_TAG_subprogram ] [line 52] [local] [def] [scope 53] [random_double]
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
!161 = metadata !{i32 99, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !160, i32 99, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!163 = metadata !{i32 100, i32 0, metadata !162, null}
!164 = metadata !{metadata !165, metadata !165, i64 0}
!165 = metadata !{metadata !"any pointer", metadata !166, i64 0}
!166 = metadata !{metadata !"omnipotent char", metadata !167, i64 0}
!167 = metadata !{metadata !"Simple C/C++ TBAA"}
!168 = metadata !{metadata !169, metadata !169, i64 0}
!169 = metadata !{metadata !"double", metadata !166, i64 0}
!170 = metadata !{i32 103, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!172 = metadata !{i32 105, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !4, i32 105, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!174 = metadata !{i32 107, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !173, i32 106, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!176 = metadata !{i32 106, i32 0, metadata !175, null}
!177 = metadata !{i32 108, i32 0, metadata !4, null}
!178 = metadata !{i32 111, i32 0, metadata !17, null}
!179 = metadata !{i32 114, i32 0, metadata !17, null}
!180 = metadata !{i32 116, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !17, i32 116, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!182 = metadata !{i32 120, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !184, i32 120, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!184 = metadata !{i32 786443, metadata !1, metadata !181, i32 119, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!185 = metadata !{i32 124, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !187, i32 124, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!187 = metadata !{i32 786443, metadata !1, metadata !183, i32 123, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!188 = metadata !{i32 147, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !1, metadata !186, i32 144, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!190 = metadata !{i32 149, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !189, i32 149, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!192 = metadata !{i32 128, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !186, i32 125, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!194 = metadata !{i32 1}
!195 = metadata !{i32 130, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !1, metadata !193, i32 130, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!197 = metadata !{i32 132, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !1, metadata !196, i32 131, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!199 = metadata !{i32 134, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !198, i32 134, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!201 = metadata !{i32 136, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !1, metadata !200, i32 135, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!203 = metadata !{i32 137, i32 0, metadata !202, null}
!204 = metadata !{i32 151, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !191, i32 150, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!206 = metadata !{i32 153, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !1, metadata !205, i32 153, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!208 = metadata !{i32 undef}
!209 = metadata !{i32 155, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !1, metadata !207, i32 154, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!211 = metadata !{i32 156, i32 0, metadata !210, null}
!212 = metadata !{i32 163, i32 0, metadata !17, null}
!213 = metadata !{i32 205, i32 0, metadata !30, null}
!214 = metadata !{i32 209, i32 0, metadata !44, null}
!215 = metadata !{i32 211, i32 0, metadata !42, null}
!216 = metadata !{i32 222, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !218, i32 222, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!218 = metadata !{i32 786443, metadata !1, metadata !42, i32 220, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!219 = metadata !{i32 214, i32 0, metadata !41, null}
!220 = metadata !{i32 216, i32 0, metadata !221, null}
!221 = metadata !{i32 786443, metadata !1, metadata !41, i32 216, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!222 = metadata !{i32 217, i32 0, metadata !221, null}
!223 = metadata !{i32 223, i32 0, metadata !217, null}
!224 = metadata !{i32 226, i32 0, metadata !30, null}
!225 = metadata !{i32 229, i32 0, metadata !45, null}
!226 = metadata !{i32 233, i32 0, metadata !62, null}
!227 = metadata !{i32 235, i32 0, metadata !60, null}
!228 = metadata !{i32 259, i32 0, metadata !229, null}
!229 = metadata !{i32 786443, metadata !1, metadata !230, i32 259, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!230 = metadata !{i32 786443, metadata !1, metadata !60, i32 257, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!231 = metadata !{i32 238, i32 0, metadata !59, null}
!232 = metadata !{i32 239, i32 0, metadata !59, null}
!233 = metadata !{i32 241, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !59, i32 241, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!235 = metadata !{i32 242, i32 0, metadata !234, null}
!236 = metadata !{i32 244, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !1, metadata !59, i32 244, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!238 = metadata !{i32 245, i32 0, metadata !237, null}
!239 = metadata !{i32 247, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !59, i32 247, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!241 = metadata !{i32 249, i32 0, metadata !242, null}
!242 = metadata !{i32 786443, metadata !1, metadata !240, i32 248, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!243 = metadata !{i32 260, i32 0, metadata !229, null}
!244 = metadata !{i32 263, i32 0, metadata !45, null}
!245 = metadata !{i32 266, i32 0, metadata !64, null}
!246 = metadata !{i32 271, i32 0, metadata !76, null}
!247 = metadata !{i32 273, i32 0, metadata !75, null}
!248 = metadata !{i32 274, i32 0, metadata !75, null}
!249 = metadata !{i32 277, i32 0, metadata !75, null}
!250 = metadata !{i32 278, i32 0, metadata !75, null}
!251 = metadata !{metadata !252, metadata !252, i64 0}
!252 = metadata !{metadata !"int", metadata !166, i64 0}
!253 = metadata !{i32 281, i32 0, metadata !83, null}
!254 = metadata !{i32 284, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !1, metadata !82, i32 284, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!256 = metadata !{i32 286, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !1, metadata !255, i32 285, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!258 = metadata !{i32 287, i32 0, metadata !257, null}
!259 = metadata !{i32 288, i32 0, metadata !257, null}
!260 = metadata !{i32 289, i32 0, metadata !257, null}
!261 = metadata !{i32 292, i32 0, metadata !82, null}
!262 = metadata !{i32 293, i32 0, metadata !82, null}
!263 = metadata !{i32 296, i32 0, metadata !81, null}
!264 = metadata !{i32 298, i32 0, metadata !80, null}
!265 = metadata !{i32 299, i32 0, metadata !80, null}
!266 = metadata !{i32 301, i32 0, metadata !267, null}
!267 = metadata !{i32 786443, metadata !1, metadata !80, i32 301, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!268 = metadata !{i32 303, i32 0, metadata !269, null}
!269 = metadata !{i32 786443, metadata !1, metadata !267, i32 302, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!270 = metadata !{i32 304, i32 0, metadata !269, null}
!271 = metadata !{i32 305, i32 0, metadata !269, null}
!272 = metadata !{i32 307, i32 0, metadata !80, null}
!273 = metadata !{i32 312, i32 0, metadata !64, null}
!274 = metadata !{i32 313, i32 0, metadata !64, null}
!275 = metadata !{i32 317, i32 0, metadata !84, null}
!276 = metadata !{i32 323, i32 0, metadata !96, null}
!277 = metadata !{i32 325, i32 0, metadata !95, null}
!278 = metadata !{i32 326, i32 0, metadata !95, null}
!279 = metadata !{i32 328, i32 0, metadata !280, null}
!280 = metadata !{i32 786443, metadata !1, metadata !95, i32 328, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!281 = metadata !{i32 330, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !280, i32 329, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!283 = metadata !{i32 331, i32 0, metadata !282, null}
!284 = metadata !{i32 332, i32 0, metadata !282, null}
!285 = metadata !{i32 334, i32 0, metadata !95, null}
!286 = metadata !{i32 335, i32 0, metadata !95, null}
!287 = metadata !{i32 339, i32 0, metadata !288, null}
!288 = metadata !{i32 786443, metadata !1, metadata !84, i32 339, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!289 = metadata !{i32 341, i32 0, metadata !290, null}
!290 = metadata !{i32 786443, metadata !1, metadata !288, i32 340, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!291 = metadata !{i32 342, i32 0, metadata !290, null}
!292 = metadata !{i32 343, i32 0, metadata !290, null}
!293 = metadata !{i32 344, i32 0, metadata !290, null}
!294 = metadata !{i32 346, i32 0, metadata !84, null}
!295 = metadata !{i32 348, i32 0, metadata !98, null}
!296 = metadata !{i8 0}
!297 = metadata !{i32 353, i32 0, metadata !98, null}
!298 = metadata !{i32 355, i32 0, metadata !116, null}
!299 = metadata !{i32 359, i32 0, metadata !122, null}
!300 = metadata !{metadata !166, metadata !166, i64 0}
!301 = metadata !{i32 359, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !122, i32 359, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!303 = metadata !{i32 359, i32 0, metadata !304, null}
!304 = metadata !{i32 786443, metadata !1, metadata !302, i32 359, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!305 = metadata !{i32 359, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !307, i32 359, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!307 = metadata !{i32 786443, metadata !1, metadata !304, i32 359, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!308 = metadata !{i32 359, i32 0, metadata !309, null}
!309 = metadata !{i32 786443, metadata !1, metadata !306, i32 359, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!310 = metadata !{i32 357, i32 0, metadata !114, null}
!311 = metadata !{i64 3}
!312 = metadata !{i32 359, i32 0, metadata !111, null}
!313 = metadata !{i32 359, i32 0, metadata !307, null}
!314 = metadata !{i32 367, i32 0, metadata !98, null}
!315 = metadata !{i32 369, i32 0, metadata !316, null}
!316 = metadata !{i32 786443, metadata !1, metadata !98, i32 369, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!317 = metadata !{i32 370, i32 0, metadata !316, null}
!318 = metadata !{i32 372, i32 0, metadata !98, null}
!319 = metadata !{double* undef}
!320 = metadata !{i32 373, i32 0, metadata !98, null}
!321 = metadata !{i32 374, i32 0, metadata !98, null}
!322 = metadata !{double 0x41F3E5E475555555}
!323 = metadata !{i32 377, i32 0, metadata !98, null}
!324 = metadata !{i32 380, i32 0, metadata !98, null}
!325 = metadata !{i32 387, i32 0, metadata !98, null}
!326 = metadata !{i32 388, i32 0, metadata !98, null}
!327 = metadata !{double 0.000000e+00}
!328 = metadata !{i32 392, i32 0, metadata !98, null}
!329 = metadata !{i32 395, i32 0, metadata !98, null}
!330 = metadata !{i32 397, i32 0, metadata !98, null}
!331 = metadata !{i32 399, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !98, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!333 = metadata !{i32 400, i32 0, metadata !332, null}
!334 = metadata !{i32 402, i32 0, metadata !98, null}
!335 = metadata !{i32 406, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !98, i32 405, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!337 = metadata !{i32 405, i32 0, metadata !336, null}
!338 = metadata !{i32 408, i32 0, metadata !336, null}
!339 = metadata !{i32 410, i32 0, metadata !98, null}
!340 = metadata !{i32 413, i32 0, metadata !98, null}
!341 = metadata !{i32 57, i32 0, metadata !133, null}
!342 = metadata !{metadata !343, metadata !343, i64 0}
!343 = metadata !{metadata !"long", metadata !166, i64 0}
!344 = metadata !{i32 58, i32 0, metadata !133, null} ; [ DW_TAG_imported_module ]
!345 = metadata !{i32 59, i32 0, metadata !133, null}
!346 = metadata !{i32 61, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !1, metadata !133, i32 61, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/lpbench.c]
!348 = metadata !{i32 62, i32 0, metadata !347, null}
!349 = metadata !{i32 64, i32 0, metadata !133, null}
!350 = metadata !{i32 65, i32 0, metadata !133, null}
!351 = metadata !{i32 67, i32 0, metadata !133, null}
