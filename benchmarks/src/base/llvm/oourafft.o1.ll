; ModuleID = 'oourafft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !23), !dbg !217
  %1 = tail call double @get_time(), !dbg !218
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !20), !dbg !218
  %2 = tail call double @get_time(), !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !21), !dbg !219
  %3 = tail call noalias i8* @memalign(i64 16, i64 128) #6, !dbg !220
  %4 = bitcast i8* %3 to i32*, !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !12), !dbg !220
  %5 = tail call noalias i8* @memalign(i64 16, i64 20480) #6, !dbg !221
  %6 = bitcast i8* %5 to double*, !dbg !221
  tail call void @llvm.dbg.value(metadata !{double* %6}, i64 0, metadata !19), !dbg !221
  tail call void @makewt(i32 512, i32* %4, double* %6), !dbg !222
  %7 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !223
  %8 = bitcast i8* %7 to double*, !dbg !223
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !14), !dbg !223
  %9 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !224
  %10 = bitcast i8* %9 to double*, !dbg !224
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !17), !dbg !224
  %11 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !225
  %12 = bitcast i8* %11 to double*, !dbg !225
  tail call void @llvm.dbg.value(metadata !{double* %12}, i64 0, metadata !18), !dbg !225
  tail call void @putdata(i32 0, i32 2047, double* %8), !dbg !226
  tail call void @cdft(i32 2048, i32 1, double* %8, i32* %4, double* %6), !dbg !227
  tail call void @cdft(i32 2048, i32 -1, double* %8, i32* %4, double* %6), !dbg !228
  %13 = tail call double @errorcheck(i32 0, i32 2047, double 9.765625e-04, double* %8), !dbg !229
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !24), !dbg !229
  %14 = tail call double @fabs(double %13) #1, !dbg !230
  %15 = fcmp ogt double %14, 1.000000e-10, !dbg !230
  br i1 %15, label %16, label %18, !dbg !230

; <label>:16                                      ; preds = %0
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i64 0, i64 0), double %13) #6, !dbg !232
  tail call void @abort() #8, !dbg !234
  unreachable, !dbg !234

; <label>:18                                      ; preds = %0
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16384, i32 8, i1 false), !dbg !235
  tail call void @putdata(i32 0, i32 1023, double* %8), !dbg !236
  tail call void @cdft(i32 2048, i32 1, double* %8, i32* %4, double* %6), !dbg !237
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !11), !dbg !239
  br label %19, !dbg !239

; <label>:19                                      ; preds = %19, %18
  %indvars.iv9 = phi i64 [ 0, %18 ], [ %indvars.iv.next10, %19 ]
  %20 = shl nsw i64 %indvars.iv9, 1, !dbg !241
  %21 = or i64 %20, 1, !dbg !241
  %22 = getelementptr inbounds double* %8, i64 %21, !dbg !241
  %23 = load double* %22, align 8, !dbg !241, !tbaa !242
  %24 = fsub double -0.000000e+00, %23, !dbg !241
  store double %24, double* %22, align 8, !dbg !241, !tbaa !242
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !239
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1024, !dbg !239
  br i1 %exitcond11, label %25, label %19, !dbg !239

; <label>:25                                      ; preds = %19
  tail call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 16384, i32 8, i1 false), !dbg !246
  tail call void @putdata(i32 0, i32 1023, double* %12), !dbg !247
  %26 = tail call double @get_time(), !dbg !248
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !20), !dbg !248
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !10), !dbg !249
  br label %27, !dbg !249

; <label>:27                                      ; preds = %45, %25
  %i.03 = phi i32 [ 0, %25 ], [ %46, %45 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %11, i64 16384, i32 8, i1 false), !dbg !250
  tail call void @cdft(i32 2048, i32 1, double* %10, i32* %4, double* %6), !dbg !251
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !25), !dbg !252
  br label %28, !dbg !252

; <label>:28                                      ; preds = %28, %27
  %indvars.iv5 = phi i64 [ 0, %27 ], [ %indvars.iv.next6, %28 ]
  %29 = shl nsw i64 %indvars.iv5, 1, !dbg !253
  %30 = getelementptr inbounds double* %10, i64 %29, !dbg !253
  %31 = load double* %30, align 8, !dbg !253, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %31}, i64 0, metadata !28), !dbg !253
  %32 = getelementptr inbounds double* %8, i64 %29, !dbg !254
  %33 = load double* %32, align 8, !dbg !254, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %33}, i64 0, metadata !31), !dbg !254
  %34 = or i64 %29, 1, !dbg !255
  %35 = getelementptr inbounds double* %10, i64 %34, !dbg !255
  %36 = load double* %35, align 8, !dbg !255, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %36}, i64 0, metadata !32), !dbg !255
  %37 = getelementptr inbounds double* %8, i64 %34, !dbg !256
  %38 = load double* %37, align 8, !dbg !256, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !33), !dbg !256
  %39 = fmul double %31, %33, !dbg !257
  %40 = fmul double %36, %38, !dbg !257
  %41 = fsub double %39, %40, !dbg !257
  store double %41, double* %30, align 8, !dbg !257, !tbaa !242
  %42 = fmul double %31, %38, !dbg !258
  %43 = fmul double %33, %36, !dbg !258
  %44 = fadd double %43, %42, !dbg !258
  store double %44, double* %35, align 8, !dbg !258, !tbaa !242
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !252
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1024, !dbg !252
  br i1 %exitcond7, label %45, label %28, !dbg !252

; <label>:45                                      ; preds = %28
  tail call void @cdft(i32 2048, i32 -1, double* %10, i32* %4, double* %6), !dbg !259
  %46 = add nsw i32 %i.03, 1, !dbg !249
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !10), !dbg !249
  %exitcond8 = icmp eq i32 %46, 150000, !dbg !249
  br i1 %exitcond8, label %47, label %27, !dbg !249

; <label>:47                                      ; preds = %45
  %48 = tail call double @get_time(), !dbg !260
  tail call void @llvm.dbg.value(metadata !{double %48}, i64 0, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !11), !dbg !261
  br label %49, !dbg !261

; <label>:49                                      ; preds = %49, %47
  %indvars.iv = phi i64 [ 0, %47 ], [ %indvars.iv.next, %49 ]
  %50 = shl nsw i64 %indvars.iv, 1, !dbg !263
  %51 = getelementptr inbounds double* %10, i64 %50, !dbg !263
  %52 = load double* %51, align 8, !dbg !263, !tbaa !242
  %53 = tail call double @fabs(double %52) #1, !dbg !263
  %54 = fcmp ogt double %53, 1.000000e-09, !dbg !263
  %55 = select i1 %54, double %52, double 0.000000e+00, !dbg !263
  %56 = or i64 %50, 1, !dbg !265
  %57 = getelementptr inbounds double* %10, i64 %56, !dbg !265
  %58 = load double* %57, align 8, !dbg !265, !tbaa !242
  %59 = tail call double @fabs(double %58) #1, !dbg !265
  %60 = fcmp ogt double %59, 1.000000e-09, !dbg !265
  %61 = select i1 %60, double %58, double 0.000000e+00, !dbg !265
  %62 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), double %55, double %61) #6, !dbg !266
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !261
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !261
  br i1 %exitcond, label %63, label %49, !dbg !261

; <label>:63                                      ; preds = %49
  tail call void @free(i8* %7) #6, !dbg !267
  tail call void @free(i8* %5) #6, !dbg !268
  tail call void @free(i8* %3) #6, !dbg !269
  tail call void @free(i8* %9) #6, !dbg !270
  tail call void @free(i8* %11) #6, !dbg !271
  ret i32 0, !dbg !272
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !59), !dbg !273
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6, !dbg !274
  %2 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0, !dbg !275
  %3 = load i64* %2, align 8, !dbg !275, !tbaa !276
  %4 = sitofp i64 %3 to double, !dbg !275
  %5 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1, !dbg !275
  %6 = load i64* %5, align 8, !dbg !275, !tbaa !279
  %7 = sitofp i64 %6 to double, !dbg !275
  %8 = fmul double %7, 1.000000e-06, !dbg !275
  %9 = fadd double %4, %8, !dbg !275
  ret double %9, !dbg !275
}

; Function Attrs: nounwind
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @makewt(i32 %nw, i32* nocapture %ip, double* %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nw}, i64 0, metadata !82), !dbg !280
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !83), !dbg !280
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !84), !dbg !280
  %1 = icmp sgt i32 %nw, 2, !dbg !281
  br i1 %1, label %2, label %32, !dbg !281

; <label>:2                                       ; preds = %0
  %3 = ashr i32 %nw, 1, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !86), !dbg !283
  %4 = sitofp i32 %3 to double, !dbg !285
  %5 = fdiv double 0x3FE921FB54442D18, %4, !dbg !285
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !87), !dbg !285
  store double 1.000000e+00, double* %w, align 8, !dbg !286, !tbaa !242
  %6 = getelementptr inbounds double* %w, i64 1, !dbg !287
  store double 0.000000e+00, double* %6, align 8, !dbg !287, !tbaa !242
  %7 = fmul double %4, %5, !dbg !288
  %8 = tail call double @cos(double %7) #6, !dbg !288
  %9 = sext i32 %3 to i64, !dbg !288
  %10 = getelementptr inbounds double* %w, i64 %9, !dbg !288
  store double %8, double* %10, align 8, !dbg !288, !tbaa !242
  %11 = add nsw i32 %3, 1, !dbg !289
  %12 = sext i32 %11 to i64, !dbg !289
  %13 = getelementptr inbounds double* %w, i64 %12, !dbg !289
  store double %8, double* %13, align 8, !dbg !289, !tbaa !242
  %14 = icmp sgt i32 %3, 2, !dbg !290
  br i1 %14, label %.lr.ph, label %32, !dbg !290

.lr.ph:                                           ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 2, %2 ]
  %15 = trunc i64 %indvars.iv to i32, !dbg !292
  %16 = sitofp i32 %15 to double, !dbg !292
  %17 = fmul double %5, %16, !dbg !292
  %18 = tail call double @cos(double %17) #6, !dbg !292
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !88), !dbg !292
  %19 = tail call double @sin(double %17) #6, !dbg !296
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !89), !dbg !296
  %20 = getelementptr inbounds double* %w, i64 %indvars.iv, !dbg !297
  store double %18, double* %20, align 8, !dbg !297, !tbaa !242
  %21 = or i64 %indvars.iv, 1, !dbg !298
  %22 = getelementptr inbounds double* %w, i64 %21, !dbg !298
  store double %19, double* %22, align 8, !dbg !298, !tbaa !242
  %23 = trunc i64 %indvars.iv to i32, !dbg !299
  %24 = sub nsw i32 %nw, %23, !dbg !299
  %25 = sext i32 %24 to i64, !dbg !299
  %26 = getelementptr inbounds double* %w, i64 %25, !dbg !299
  store double %19, double* %26, align 8, !dbg !299, !tbaa !242
  %27 = add nsw i32 %24, 1, !dbg !300
  %28 = sext i32 %27 to i64, !dbg !300
  %29 = getelementptr inbounds double* %w, i64 %28, !dbg !300
  store double %18, double* %29, align 8, !dbg !300, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !301
  %30 = trunc i64 %indvars.iv.next to i32, !dbg !301
  %31 = icmp slt i32 %30, %3, !dbg !301
  br i1 %31, label %.lr.ph, label %._crit_edge, !dbg !301

._crit_edge:                                      ; preds = %.lr.ph
  tail call fastcc void @bitrv2(i32 %nw, i32* %ip, double* %w), !dbg !302
  br label %32, !dbg !303

; <label>:32                                      ; preds = %2, %._crit_edge, %0
  ret void, !dbg !304
}

; Function Attrs: nounwind uwtable
define void @putdata(i32 %nini, i32 %nend, double* nocapture %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !38), !dbg !305
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !39), !dbg !305
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !40), !dbg !305
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !42), !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !41), !dbg !307
  %1 = icmp sgt i32 %nini, %nend, !dbg !307
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !307

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !307

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %seed.02 = phi i32 [ %6, %3 ], [ 0, %.lr.ph ]
  %4 = mul nsw i32 %seed.02, 7141, !dbg !309
  %5 = add nsw i32 %4, 54773, !dbg !309
  %6 = srem i32 %5, 259200, !dbg !309
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !42), !dbg !309
  %7 = sitofp i32 %6 to double, !dbg !309
  %8 = fmul double %7, 0x3ED02E85C0898B71, !dbg !309
  %9 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !309
  store double %8, double* %9, align 8, !dbg !309, !tbaa !242
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !307
  %10 = trunc i64 %indvars.iv to i32, !dbg !307
  %11 = icmp slt i32 %10, %nend, !dbg !307
  br i1 %11, label %3, label %._crit_edge, !dbg !307

._crit_edge:                                      ; preds = %3, %0
  ret void, !dbg !310
}

; Function Attrs: nounwind uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* nocapture %ip, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !73), !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32 %isgn}, i64 0, metadata !74), !dbg !311
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !75), !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !76), !dbg !311
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !77), !dbg !311
  %1 = icmp sgt i32 %n, 4, !dbg !312
  br i1 %1, label %2, label %6, !dbg !312

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %isgn, -1, !dbg !314
  br i1 %3, label %4, label %5, !dbg !314

; <label>:4                                       ; preds = %2
  tail call fastcc void @bitrv2(i32 %n, i32* %ip, double* %a), !dbg !317
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w), !dbg !319
  br label %9, !dbg !320

; <label>:5                                       ; preds = %2
  tail call fastcc void @bitrv2conj(i32 %n, i32* %ip, double* %a), !dbg !321
  tail call fastcc void @cftbsub(i32 %n, double* %a, double* %w), !dbg !323
  br label %9

; <label>:6                                       ; preds = %0
  %7 = icmp eq i32 %n, 4, !dbg !324
  br i1 %7, label %8, label %9, !dbg !324

; <label>:8                                       ; preds = %6
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w), !dbg !326
  br label %9, !dbg !328

; <label>:9                                       ; preds = %6, %8, %4, %5
  ret void, !dbg !329
}

; Function Attrs: nounwind readonly uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* nocapture readonly %a) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !47), !dbg !330
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !48), !dbg !330
  tail call void @llvm.dbg.value(metadata !{double %scale}, i64 0, metadata !49), !dbg !330
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !50), !dbg !330
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !52), !dbg !331
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !53), !dbg !332
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !51), !dbg !333
  %1 = icmp sgt i32 %nini, %nend, !dbg !333
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !333

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !333

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %err.04 = phi double [ %err.0., %3 ], [ 0.000000e+00, %.lr.ph ]
  %seed.03 = phi i32 [ %phitmp2, %3 ], [ 54773, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03}, i64 0, metadata !52), !dbg !335
  %4 = sitofp i32 %seed.03 to double, !dbg !335
  %5 = fmul double %4, 0x3ED02E85C0898B71, !dbg !335
  %6 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !335
  %7 = load double* %6, align 8, !dbg !335, !tbaa !242
  %8 = fmul double %7, %scale, !dbg !335
  %9 = fsub double %5, %8, !dbg !335
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !54), !dbg !335
  %10 = tail call double @fabs(double %9) #1, !dbg !337
  %11 = fcmp ogt double %err.04, %10, !dbg !337
  %err.0. = select i1 %11, double %err.04, double %10, !dbg !337
  tail call void @llvm.dbg.value(metadata !{double %err.0.}, i64 0, metadata !53), !dbg !337
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !333
  %phitmp = mul i32 %seed.03, 7141, !dbg !333
  %phitmp1 = add i32 %phitmp, 54773, !dbg !333
  %phitmp2 = srem i32 %phitmp1, 259200, !dbg !333
  %12 = trunc i64 %indvars.iv to i32, !dbg !333
  %13 = icmp slt i32 %12, %nend, !dbg !333
  br i1 %13, label %3, label %._crit_edge, !dbg !333

._crit_edge:                                      ; preds = %3, %0
  %err.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %err.0., %3 ]
  ret double %err.0.lcssa, !dbg !338
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind
declare void @abort() #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind uwtable
define internal fastcc void @bitrv2(i32 %n, i32* nocapture %ip, double* %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !199), !dbg !339
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !200), !dbg !339
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !201), !dbg !339
  store i32 0, i32* %ip, align 4, !dbg !340, !tbaa !341
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !206), !dbg !343
  tail call void @llvm.dbg.value(metadata !344, i64 0, metadata !207), !dbg !345
  %1 = icmp sgt i32 %n, 8, !dbg !346
  br i1 %1, label %.lr.ph19, label %._crit_edge20, !dbg !346

.lr.ph19:                                         ; preds = %0, %._crit_edge14
  %m.016 = phi i32 [ %11, %._crit_edge14 ], [ 1, %0 ]
  %l.015 = phi i32 [ %2, %._crit_edge14 ], [ %n, %0 ]
  %2 = ashr i32 %l.015, 1, !dbg !347
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !206), !dbg !347
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !202), !dbg !349
  %3 = icmp sgt i32 %m.016, 0, !dbg !349
  br i1 %3, label %.lr.ph13, label %._crit_edge14, !dbg !349

.lr.ph13:                                         ; preds = %.lr.ph19
  %4 = sext i32 %m.016 to i64, !dbg !349
  br label %5, !dbg !349

; <label>:5                                       ; preds = %5, %.lr.ph13
  %indvars.iv42 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next43, %5 ]
  %6 = getelementptr inbounds i32* %ip, i64 %indvars.iv42, !dbg !351
  %7 = load i32* %6, align 4, !dbg !351, !tbaa !341
  %8 = add nsw i32 %7, %2, !dbg !351
  %9 = add nsw i64 %indvars.iv42, %4, !dbg !351
  %10 = getelementptr inbounds i32* %ip, i64 %9, !dbg !351
  store i32 %8, i32* %10, align 4, !dbg !351, !tbaa !341
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !349
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !349
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %m.016, !dbg !349
  br i1 %exitcond45, label %._crit_edge14, label %5, !dbg !349

._crit_edge14:                                    ; preds = %5, %.lr.ph19
  %11 = shl i32 %m.016, 1, !dbg !353
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !207), !dbg !353
  %12 = shl i32 %m.016, 4, !dbg !346
  %13 = icmp slt i32 %12, %2, !dbg !346
  br i1 %13, label %.lr.ph19, label %._crit_edge20, !dbg !346

._crit_edge20:                                    ; preds = %._crit_edge14, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %12, %._crit_edge14 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %11, %._crit_edge14 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge14 ]
  %14 = shl nsw i32 %m.0.lcssa, 1, !dbg !354
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !208), !dbg !354
  %15 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !355
  br i1 %15, label %.preheader1, label %.preheader3, !dbg !355

.preheader3:                                      ; preds = %._crit_edge20
  %16 = icmp sgt i32 %m.0.lcssa, 1, !dbg !357
  br i1 %16, label %.lr.ph8, label %.loopexit, !dbg !357

.preheader1:                                      ; preds = %._crit_edge20
  %17 = icmp sgt i32 %m.0.lcssa, 0, !dbg !360
  br i1 %17, label %.preheader.lr.ph, label %.loopexit, !dbg !360

.preheader.lr.ph:                                 ; preds = %.preheader1
  %18 = shl i32 %m.0.lcssa, 2, !dbg !363
  br label %.preheader, !dbg !360

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %19 = trunc i64 %indvars.iv28 to i32, !dbg !367
  %20 = icmp sgt i32 %19, 0, !dbg !367
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !367

.lr.ph:                                           ; preds = %.preheader
  %21 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !368
  %22 = load i32* %21, align 4, !dbg !368, !tbaa !341
  %23 = trunc i64 %indvars.iv28 to i32, !dbg !369
  %24 = shl nsw i32 %23, 1, !dbg !369
  br label %25, !dbg !367

; <label>:25                                      ; preds = %25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %25 ]
  %26 = trunc i64 %indvars.iv to i32, !dbg !368
  %27 = shl nsw i32 %26, 1, !dbg !368
  %28 = add nsw i32 %22, %27, !dbg !368
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !203), !dbg !368
  %29 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !369
  %30 = load i32* %29, align 4, !dbg !369, !tbaa !341
  %31 = add nsw i32 %30, %24, !dbg !369
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !205), !dbg !369
  %32 = sext i32 %28 to i64, !dbg !370
  %33 = getelementptr inbounds double* %a, i64 %32, !dbg !370
  %34 = load double* %33, align 8, !dbg !370, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !209), !dbg !370
  %35 = add nsw i32 %28, 1, !dbg !371
  %36 = sext i32 %35 to i64, !dbg !371
  %37 = getelementptr inbounds double* %a, i64 %36, !dbg !371
  %38 = load double* %37, align 8, !dbg !371, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %38}, i64 0, metadata !210), !dbg !371
  %39 = sext i32 %31 to i64, !dbg !372
  %40 = getelementptr inbounds double* %a, i64 %39, !dbg !372
  %41 = load double* %40, align 8, !dbg !372, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %41}, i64 0, metadata !211), !dbg !372
  %42 = add nsw i32 %31, 1, !dbg !373
  %43 = sext i32 %42 to i64, !dbg !373
  %44 = getelementptr inbounds double* %a, i64 %43, !dbg !373
  %45 = load double* %44, align 8, !dbg !373, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !212), !dbg !373
  store double %41, double* %33, align 8, !dbg !374, !tbaa !242
  store double %45, double* %37, align 8, !dbg !375, !tbaa !242
  store double %34, double* %40, align 8, !dbg !376, !tbaa !242
  store double %38, double* %44, align 8, !dbg !377, !tbaa !242
  %46 = add nsw i32 %28, %14, !dbg !378
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !203), !dbg !378
  %47 = add nsw i32 %31, %18, !dbg !363
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !205), !dbg !363
  %48 = sext i32 %46 to i64, !dbg !379
  %49 = getelementptr inbounds double* %a, i64 %48, !dbg !379
  %50 = load double* %49, align 8, !dbg !379, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !209), !dbg !379
  %51 = add nsw i32 %46, 1, !dbg !380
  %52 = sext i32 %51 to i64, !dbg !380
  %53 = getelementptr inbounds double* %a, i64 %52, !dbg !380
  %54 = load double* %53, align 8, !dbg !380, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %54}, i64 0, metadata !210), !dbg !380
  %55 = sext i32 %47 to i64, !dbg !381
  %56 = getelementptr inbounds double* %a, i64 %55, !dbg !381
  %57 = load double* %56, align 8, !dbg !381, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %57}, i64 0, metadata !211), !dbg !381
  %58 = add nsw i32 %47, 1, !dbg !382
  %59 = sext i32 %58 to i64, !dbg !382
  %60 = getelementptr inbounds double* %a, i64 %59, !dbg !382
  %61 = load double* %60, align 8, !dbg !382, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !212), !dbg !382
  store double %57, double* %49, align 8, !dbg !383, !tbaa !242
  store double %61, double* %53, align 8, !dbg !384, !tbaa !242
  store double %50, double* %56, align 8, !dbg !385, !tbaa !242
  store double %54, double* %60, align 8, !dbg !386, !tbaa !242
  %62 = add nsw i32 %46, %14, !dbg !387
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !203), !dbg !387
  %63 = sub nsw i32 %47, %14, !dbg !388
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !205), !dbg !388
  %64 = sext i32 %62 to i64, !dbg !389
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !389
  %66 = load double* %65, align 8, !dbg !389, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !209), !dbg !389
  %67 = add nsw i32 %62, 1, !dbg !390
  %68 = sext i32 %67 to i64, !dbg !390
  %69 = getelementptr inbounds double* %a, i64 %68, !dbg !390
  %70 = load double* %69, align 8, !dbg !390, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !210), !dbg !390
  %71 = sext i32 %63 to i64, !dbg !391
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !391
  %73 = load double* %72, align 8, !dbg !391, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !211), !dbg !391
  %74 = add nsw i32 %63, 1, !dbg !392
  %75 = sext i32 %74 to i64, !dbg !392
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !392
  %77 = load double* %76, align 8, !dbg !392, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !212), !dbg !392
  store double %73, double* %65, align 8, !dbg !393, !tbaa !242
  store double %77, double* %69, align 8, !dbg !394, !tbaa !242
  store double %66, double* %72, align 8, !dbg !395, !tbaa !242
  store double %70, double* %76, align 8, !dbg !396, !tbaa !242
  %78 = add nsw i32 %62, %14, !dbg !397
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !203), !dbg !397
  %79 = add nsw i32 %63, %18, !dbg !398
  tail call void @llvm.dbg.value(metadata !{i32 %79}, i64 0, metadata !205), !dbg !398
  %80 = sext i32 %78 to i64, !dbg !399
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !399
  %82 = load double* %81, align 8, !dbg !399, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !209), !dbg !399
  %83 = add nsw i32 %78, 1, !dbg !400
  %84 = sext i32 %83 to i64, !dbg !400
  %85 = getelementptr inbounds double* %a, i64 %84, !dbg !400
  %86 = load double* %85, align 8, !dbg !400, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !210), !dbg !400
  %87 = sext i32 %79 to i64, !dbg !401
  %88 = getelementptr inbounds double* %a, i64 %87, !dbg !401
  %89 = load double* %88, align 8, !dbg !401, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %89}, i64 0, metadata !211), !dbg !401
  %90 = add nsw i32 %79, 1, !dbg !402
  %91 = sext i32 %90 to i64, !dbg !402
  %92 = getelementptr inbounds double* %a, i64 %91, !dbg !402
  %93 = load double* %92, align 8, !dbg !402, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !212), !dbg !402
  store double %89, double* %81, align 8, !dbg !403, !tbaa !242
  store double %93, double* %85, align 8, !dbg !404, !tbaa !242
  store double %82, double* %88, align 8, !dbg !405, !tbaa !242
  store double %86, double* %92, align 8, !dbg !406, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !367
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !367
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv26, !dbg !367
  br i1 %exitcond, label %._crit_edge, label %25, !dbg !367

._crit_edge:                                      ; preds = %25, %.preheader
  %94 = trunc i64 %indvars.iv28 to i32, !dbg !407
  %95 = shl i32 %94, 1, !dbg !407
  %96 = add nsw i32 %95, %14, !dbg !407
  %97 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !407
  %98 = load i32* %97, align 4, !dbg !407, !tbaa !341
  %99 = add nsw i32 %96, %98, !dbg !407
  tail call void @llvm.dbg.value(metadata !{i32 %99}, i64 0, metadata !203), !dbg !407
  %100 = add nsw i32 %99, %14, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !205), !dbg !408
  %101 = sext i32 %99 to i64, !dbg !409
  %102 = getelementptr inbounds double* %a, i64 %101, !dbg !409
  %103 = load double* %102, align 8, !dbg !409, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %103}, i64 0, metadata !209), !dbg !409
  %104 = add nsw i32 %99, 1, !dbg !410
  %105 = sext i32 %104 to i64, !dbg !410
  %106 = getelementptr inbounds double* %a, i64 %105, !dbg !410
  %107 = load double* %106, align 8, !dbg !410, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %107}, i64 0, metadata !210), !dbg !410
  %108 = sext i32 %100 to i64, !dbg !411
  %109 = getelementptr inbounds double* %a, i64 %108, !dbg !411
  %110 = load double* %109, align 8, !dbg !411, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %110}, i64 0, metadata !211), !dbg !411
  %111 = add nsw i32 %100, 1, !dbg !412
  %112 = sext i32 %111 to i64, !dbg !412
  %113 = getelementptr inbounds double* %a, i64 %112, !dbg !412
  %114 = load double* %113, align 8, !dbg !412, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !212), !dbg !412
  store double %110, double* %102, align 8, !dbg !413, !tbaa !242
  store double %114, double* %106, align 8, !dbg !414, !tbaa !242
  store double %103, double* %109, align 8, !dbg !415, !tbaa !242
  store double %107, double* %113, align 8, !dbg !416, !tbaa !242
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !360
  %indvars.iv.next27 = add nuw nsw i32 %indvars.iv26, 1, !dbg !360
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next27}, i64 0, metadata !204), !dbg !360
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !360
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %m.0.lcssa, !dbg !360
  br i1 %exitcond31, label %.loopexit, label %.preheader, !dbg !360

.lr.ph8:                                          ; preds = %.preheader3, %._crit_edge9
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge9 ], [ 1, %.preheader3 ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge9 ], [ 1, %.preheader3 ]
  %115 = getelementptr inbounds i32* %ip, i64 %indvars.iv38, !dbg !417
  %116 = load i32* %115, align 4, !dbg !417, !tbaa !341
  %117 = trunc i64 %indvars.iv38 to i32, !dbg !421
  %118 = shl nsw i32 %117, 1, !dbg !421
  br label %119, !dbg !422

; <label>:119                                     ; preds = %119, %.lr.ph8
  %indvars.iv32 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next33, %119 ]
  %120 = trunc i64 %indvars.iv32 to i32, !dbg !417
  %121 = shl nsw i32 %120, 1, !dbg !417
  %122 = add nsw i32 %116, %121, !dbg !417
  tail call void @llvm.dbg.value(metadata !{i32 %122}, i64 0, metadata !203), !dbg !417
  %123 = getelementptr inbounds i32* %ip, i64 %indvars.iv32, !dbg !421
  %124 = load i32* %123, align 4, !dbg !421, !tbaa !341
  %125 = add nsw i32 %124, %118, !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %125}, i64 0, metadata !205), !dbg !421
  %126 = sext i32 %122 to i64, !dbg !423
  %127 = getelementptr inbounds double* %a, i64 %126, !dbg !423
  %128 = load double* %127, align 8, !dbg !423, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !209), !dbg !423
  %129 = add nsw i32 %122, 1, !dbg !424
  %130 = sext i32 %129 to i64, !dbg !424
  %131 = getelementptr inbounds double* %a, i64 %130, !dbg !424
  %132 = load double* %131, align 8, !dbg !424, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %132}, i64 0, metadata !210), !dbg !424
  %133 = sext i32 %125 to i64, !dbg !425
  %134 = getelementptr inbounds double* %a, i64 %133, !dbg !425
  %135 = load double* %134, align 8, !dbg !425, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !211), !dbg !425
  %136 = add nsw i32 %125, 1, !dbg !426
  %137 = sext i32 %136 to i64, !dbg !426
  %138 = getelementptr inbounds double* %a, i64 %137, !dbg !426
  %139 = load double* %138, align 8, !dbg !426, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !212), !dbg !426
  store double %135, double* %127, align 8, !dbg !427, !tbaa !242
  store double %139, double* %131, align 8, !dbg !428, !tbaa !242
  store double %128, double* %134, align 8, !dbg !429, !tbaa !242
  store double %132, double* %138, align 8, !dbg !430, !tbaa !242
  %140 = add nsw i32 %122, %14, !dbg !431
  tail call void @llvm.dbg.value(metadata !{i32 %140}, i64 0, metadata !203), !dbg !431
  %141 = add nsw i32 %125, %14, !dbg !432
  tail call void @llvm.dbg.value(metadata !{i32 %141}, i64 0, metadata !205), !dbg !432
  %142 = sext i32 %140 to i64, !dbg !433
  %143 = getelementptr inbounds double* %a, i64 %142, !dbg !433
  %144 = load double* %143, align 8, !dbg !433, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !209), !dbg !433
  %145 = add nsw i32 %140, 1, !dbg !434
  %146 = sext i32 %145 to i64, !dbg !434
  %147 = getelementptr inbounds double* %a, i64 %146, !dbg !434
  %148 = load double* %147, align 8, !dbg !434, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %148}, i64 0, metadata !210), !dbg !434
  %149 = sext i32 %141 to i64, !dbg !435
  %150 = getelementptr inbounds double* %a, i64 %149, !dbg !435
  %151 = load double* %150, align 8, !dbg !435, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %151}, i64 0, metadata !211), !dbg !435
  %152 = add nsw i32 %141, 1, !dbg !436
  %153 = sext i32 %152 to i64, !dbg !436
  %154 = getelementptr inbounds double* %a, i64 %153, !dbg !436
  %155 = load double* %154, align 8, !dbg !436, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !212), !dbg !436
  store double %151, double* %143, align 8, !dbg !437, !tbaa !242
  store double %155, double* %147, align 8, !dbg !438, !tbaa !242
  store double %144, double* %150, align 8, !dbg !439, !tbaa !242
  store double %148, double* %154, align 8, !dbg !440, !tbaa !242
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !422
  %lftr.wideiv36 = trunc i64 %indvars.iv.next33 to i32, !dbg !422
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %indvars.iv34, !dbg !422
  br i1 %exitcond37, label %._crit_edge9, label %119, !dbg !422

._crit_edge9:                                     ; preds = %119
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !357
  %indvars.iv.next35 = add nuw nsw i32 %indvars.iv34, 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next35}, i64 0, metadata !204), !dbg !357
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !357
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %m.0.lcssa, !dbg !357
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8, !dbg !357

.loopexit:                                        ; preds = %._crit_edge9, %._crit_edge, %.preheader3, %.preheader1
  ret void, !dbg !441
}

; Function Attrs: nounwind uwtable
define internal fastcc void @cftfsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !165), !dbg !442
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !166), !dbg !442
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !167), !dbg !442
  tail call void @llvm.dbg.value(metadata !443, i64 0, metadata !172), !dbg !444
  %1 = icmp sgt i32 %n, 8, !dbg !445
  br i1 %1, label %2, label %.loopexit3, !dbg !445

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w), !dbg !447
  tail call void @llvm.dbg.value(metadata !449, i64 0, metadata !172), !dbg !450
  %3 = icmp sgt i32 %n, 32, !dbg !451
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !451

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w), !dbg !452
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !172), !dbg !454
  %5 = shl i32 %4, 2, !dbg !451
  %6 = icmp slt i32 %5, %n, !dbg !451
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !451

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !455
  %8 = icmp eq i32 %7, %n, !dbg !455
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !168), !dbg !457
  %9 = icmp sgt i32 %l.1, 0, !dbg !457
  br i1 %8, label %.preheader, label %.preheader1, !dbg !455

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !460

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !460
  br label %58, !dbg !460

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !457

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !457
  %12 = sext i32 %l.1 to i64, !dbg !457
  %13 = sext i32 %l.1 to i64, !dbg !457
  br label %14, !dbg !457

; <label>:14                                      ; preds = %.lr.ph, %14
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %14 ]
  %15 = add nsw i64 %indvars.iv, %11, !dbg !463
  %16 = add nsw i64 %15, %12, !dbg !465
  %17 = add nsw i64 %16, %13, !dbg !466
  %18 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !467
  %19 = getelementptr inbounds double* %a, i64 %15, !dbg !467
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !173), !dbg !467
  %20 = bitcast double* %18 to <2 x double>*, !dbg !467
  %21 = load <2 x double>* %20, align 8, !dbg !467, !tbaa !242
  %22 = add nsw i64 %15, 1, !dbg !469
  %23 = getelementptr inbounds double* %a, i64 %22, !dbg !469
  %24 = bitcast double* %19 to <2 x double>*, !dbg !467
  %25 = load <2 x double>* %24, align 8, !dbg !467, !tbaa !242
  %26 = fadd <2 x double> %21, %25, !dbg !467
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !174), !dbg !469
  %27 = extractelement <2 x double> %21, i32 0, !dbg !470
  %28 = extractelement <2 x double> %25, i32 0, !dbg !470
  %29 = fsub double %27, %28, !dbg !470
  tail call void @llvm.dbg.value(metadata !{double %29}, i64 0, metadata !175), !dbg !470
  %30 = extractelement <2 x double> %21, i32 1, !dbg !471
  %31 = extractelement <2 x double> %25, i32 1, !dbg !471
  %32 = fsub double %30, %31, !dbg !471
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !176), !dbg !471
  %33 = getelementptr inbounds double* %a, i64 %16, !dbg !472
  %34 = getelementptr inbounds double* %a, i64 %17, !dbg !472
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !177), !dbg !472
  %35 = bitcast double* %33 to <2 x double>*, !dbg !472
  %36 = load <2 x double>* %35, align 8, !dbg !472, !tbaa !242
  %37 = add nsw i64 %17, 1, !dbg !473
  %38 = getelementptr inbounds double* %a, i64 %37, !dbg !473
  %39 = bitcast double* %34 to <2 x double>*, !dbg !472
  %40 = load <2 x double>* %39, align 8, !dbg !472, !tbaa !242
  %41 = fadd <2 x double> %36, %40, !dbg !472
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !178), !dbg !473
  %42 = extractelement <2 x double> %36, i32 0, !dbg !474
  %43 = extractelement <2 x double> %40, i32 0, !dbg !474
  %44 = fsub double %42, %43, !dbg !474
  tail call void @llvm.dbg.value(metadata !{double %44}, i64 0, metadata !179), !dbg !474
  %45 = extractelement <2 x double> %36, i32 1, !dbg !475
  %46 = extractelement <2 x double> %40, i32 1, !dbg !475
  %47 = fsub double %45, %46, !dbg !475
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !180), !dbg !475
  %48 = fadd <2 x double> %26, %41, !dbg !476
  %49 = bitcast double* %18 to <2 x double>*, !dbg !476
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !476, !tbaa !242
  %50 = fsub <2 x double> %26, %41, !dbg !477
  %51 = bitcast double* %33 to <2 x double>*, !dbg !477
  store <2 x double> %50, <2 x double>* %51, align 8, !dbg !477, !tbaa !242
  %52 = fsub double %29, %47, !dbg !478
  store double %52, double* %19, align 8, !dbg !478, !tbaa !242
  %53 = fadd double %32, %44, !dbg !479
  store double %53, double* %23, align 8, !dbg !479, !tbaa !242
  %54 = fadd double %29, %47, !dbg !480
  store double %54, double* %34, align 8, !dbg !480, !tbaa !242
  %55 = fsub double %32, %44, !dbg !481
  store double %55, double* %38, align 8, !dbg !481, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !457
  %56 = trunc i64 %indvars.iv.next to i32, !dbg !457
  %57 = icmp slt i32 %56, %l.1, !dbg !457
  br i1 %57, label %14, label %.loopexit, !dbg !457

; <label>:58                                      ; preds = %.lr.ph6, %58
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %58 ]
  %59 = add nsw i64 %indvars.iv9, %10, !dbg !482
  %60 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !484
  %61 = getelementptr inbounds double* %a, i64 %59, !dbg !484
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !173), !dbg !484
  %62 = or i64 %indvars.iv9, 1, !dbg !485
  %63 = getelementptr inbounds double* %a, i64 %62, !dbg !485
  %64 = bitcast double* %60 to <2 x double>*, !dbg !484
  %65 = load <2 x double>* %64, align 8, !dbg !484, !tbaa !242
  %66 = add nsw i64 %59, 1, !dbg !485
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !485
  %68 = bitcast double* %61 to <2 x double>*, !dbg !484
  %69 = load <2 x double>* %68, align 8, !dbg !484, !tbaa !242
  %70 = fsub <2 x double> %65, %69, !dbg !484
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !174), !dbg !485
  %71 = extractelement <2 x double> %65, i32 0, !dbg !486
  %72 = extractelement <2 x double> %69, i32 0, !dbg !486
  %73 = fadd double %71, %72, !dbg !486
  store double %73, double* %60, align 8, !dbg !486, !tbaa !242
  %74 = load double* %67, align 8, !dbg !487, !tbaa !242
  %75 = load double* %63, align 8, !dbg !487, !tbaa !242
  %76 = fadd double %74, %75, !dbg !487
  store double %76, double* %63, align 8, !dbg !487, !tbaa !242
  %77 = bitcast double* %61 to <2 x double>*, !dbg !488
  store <2 x double> %70, <2 x double>* %77, align 8, !dbg !488, !tbaa !242
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !460
  %78 = trunc i64 %indvars.iv.next10 to i32, !dbg !460
  %79 = icmp slt i32 %78, %l.1, !dbg !460
  br i1 %79, label %58, label %.loopexit, !dbg !460

.loopexit:                                        ; preds = %58, %14, %.preheader1, %.preheader
  ret void, !dbg !489
}

; Function Attrs: nounwind uwtable
define internal fastcc void @bitrv2conj(i32 %n, i32* nocapture %ip, double* %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !183), !dbg !490
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !184), !dbg !490
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !185), !dbg !490
  store i32 0, i32* %ip, align 4, !dbg !491, !tbaa !341
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !190), !dbg !492
  tail call void @llvm.dbg.value(metadata !344, i64 0, metadata !191), !dbg !493
  %1 = icmp sgt i32 %n, 8, !dbg !494
  br i1 %1, label %.lr.ph18, label %._crit_edge19, !dbg !494

.lr.ph18:                                         ; preds = %0, %._crit_edge13
  %m.015 = phi i32 [ %11, %._crit_edge13 ], [ 1, %0 ]
  %l.014 = phi i32 [ %2, %._crit_edge13 ], [ %n, %0 ]
  %2 = ashr i32 %l.014, 1, !dbg !495
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !190), !dbg !495
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !186), !dbg !497
  %3 = icmp sgt i32 %m.015, 0, !dbg !497
  br i1 %3, label %.lr.ph12, label %._crit_edge13, !dbg !497

.lr.ph12:                                         ; preds = %.lr.ph18
  %4 = sext i32 %m.015 to i64, !dbg !497
  br label %5, !dbg !497

; <label>:5                                       ; preds = %5, %.lr.ph12
  %indvars.iv41 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next42, %5 ]
  %6 = getelementptr inbounds i32* %ip, i64 %indvars.iv41, !dbg !499
  %7 = load i32* %6, align 4, !dbg !499, !tbaa !341
  %8 = add nsw i32 %7, %2, !dbg !499
  %9 = add nsw i64 %indvars.iv41, %4, !dbg !499
  %10 = getelementptr inbounds i32* %ip, i64 %9, !dbg !499
  store i32 %8, i32* %10, align 4, !dbg !499, !tbaa !341
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !497
  %lftr.wideiv43 = trunc i64 %indvars.iv.next42 to i32, !dbg !497
  %exitcond44 = icmp eq i32 %lftr.wideiv43, %m.015, !dbg !497
  br i1 %exitcond44, label %._crit_edge13, label %5, !dbg !497

._crit_edge13:                                    ; preds = %5, %.lr.ph18
  %11 = shl i32 %m.015, 1, !dbg !501
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !191), !dbg !501
  %12 = shl i32 %m.015, 4, !dbg !494
  %13 = icmp slt i32 %12, %2, !dbg !494
  br i1 %13, label %.lr.ph18, label %._crit_edge19, !dbg !494

._crit_edge19:                                    ; preds = %._crit_edge13, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %12, %._crit_edge13 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %11, %._crit_edge13 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge13 ]
  %14 = shl nsw i32 %m.0.lcssa, 1, !dbg !502
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !192), !dbg !502
  %15 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !503
  br i1 %15, label %.preheader1, label %135, !dbg !503

.preheader1:                                      ; preds = %._crit_edge19
  %16 = icmp sgt i32 %m.0.lcssa, 0, !dbg !505
  br i1 %16, label %.preheader.lr.ph, label %.loopexit, !dbg !505

.preheader.lr.ph:                                 ; preds = %.preheader1
  %17 = or i32 %14, 1, !dbg !508
  %18 = shl i32 %m.0.lcssa, 2, !dbg !510
  br label %.preheader, !dbg !505

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv27 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next28, %._crit_edge ]
  %indvars.iv25 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next26, %._crit_edge ]
  %19 = trunc i64 %indvars.iv27 to i32, !dbg !513
  %20 = icmp sgt i32 %19, 0, !dbg !513
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !513

.lr.ph:                                           ; preds = %.preheader
  %21 = getelementptr inbounds i32* %ip, i64 %indvars.iv27, !dbg !514
  %22 = load i32* %21, align 4, !dbg !514, !tbaa !341
  %23 = trunc i64 %indvars.iv27 to i32, !dbg !515
  %24 = shl nsw i32 %23, 1, !dbg !515
  br label %25, !dbg !513

; <label>:25                                      ; preds = %25, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %25 ]
  %26 = trunc i64 %indvars.iv to i32, !dbg !514
  %27 = shl nsw i32 %26, 1, !dbg !514
  %28 = add nsw i32 %22, %27, !dbg !514
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !187), !dbg !514
  %29 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !515
  %30 = load i32* %29, align 4, !dbg !515, !tbaa !341
  %31 = add nsw i32 %30, %24, !dbg !515
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !189), !dbg !515
  %32 = sext i32 %28 to i64, !dbg !516
  %33 = getelementptr inbounds double* %a, i64 %32, !dbg !516
  %34 = load double* %33, align 8, !dbg !516, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !193), !dbg !516
  %35 = add nsw i32 %28, 1, !dbg !517
  %36 = sext i32 %35 to i64, !dbg !517
  %37 = getelementptr inbounds double* %a, i64 %36, !dbg !517
  %38 = load double* %37, align 8, !dbg !517, !tbaa !242
  %39 = fsub double -0.000000e+00, %38, !dbg !517
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !194), !dbg !517
  %40 = sext i32 %31 to i64, !dbg !518
  %41 = getelementptr inbounds double* %a, i64 %40, !dbg !518
  %42 = load double* %41, align 8, !dbg !518, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !195), !dbg !518
  %43 = add nsw i32 %31, 1, !dbg !519
  %44 = sext i32 %43 to i64, !dbg !519
  %45 = getelementptr inbounds double* %a, i64 %44, !dbg !519
  %46 = load double* %45, align 8, !dbg !519, !tbaa !242
  %47 = fsub double -0.000000e+00, %46, !dbg !519
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !196), !dbg !519
  store double %42, double* %33, align 8, !dbg !520, !tbaa !242
  store double %47, double* %37, align 8, !dbg !521, !tbaa !242
  store double %34, double* %41, align 8, !dbg !522, !tbaa !242
  store double %39, double* %45, align 8, !dbg !523, !tbaa !242
  %48 = add nsw i32 %28, %14, !dbg !524
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !187), !dbg !524
  %49 = add nsw i32 %31, %18, !dbg !510
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !189), !dbg !510
  %50 = sext i32 %48 to i64, !dbg !525
  %51 = getelementptr inbounds double* %a, i64 %50, !dbg !525
  %52 = load double* %51, align 8, !dbg !525, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %52}, i64 0, metadata !193), !dbg !525
  %53 = add nsw i32 %48, 1, !dbg !526
  %54 = sext i32 %53 to i64, !dbg !526
  %55 = getelementptr inbounds double* %a, i64 %54, !dbg !526
  %56 = load double* %55, align 8, !dbg !526, !tbaa !242
  %57 = fsub double -0.000000e+00, %56, !dbg !526
  tail call void @llvm.dbg.value(metadata !{double %57}, i64 0, metadata !194), !dbg !526
  %58 = sext i32 %49 to i64, !dbg !527
  %59 = getelementptr inbounds double* %a, i64 %58, !dbg !527
  %60 = load double* %59, align 8, !dbg !527, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !195), !dbg !527
  %61 = add nsw i32 %49, 1, !dbg !528
  %62 = sext i32 %61 to i64, !dbg !528
  %63 = getelementptr inbounds double* %a, i64 %62, !dbg !528
  %64 = load double* %63, align 8, !dbg !528, !tbaa !242
  %65 = fsub double -0.000000e+00, %64, !dbg !528
  tail call void @llvm.dbg.value(metadata !{double %65}, i64 0, metadata !196), !dbg !528
  store double %60, double* %51, align 8, !dbg !529, !tbaa !242
  store double %65, double* %55, align 8, !dbg !530, !tbaa !242
  store double %52, double* %59, align 8, !dbg !531, !tbaa !242
  store double %57, double* %63, align 8, !dbg !532, !tbaa !242
  %66 = add nsw i32 %48, %14, !dbg !533
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !187), !dbg !533
  %67 = sub nsw i32 %49, %14, !dbg !534
  tail call void @llvm.dbg.value(metadata !{i32 %67}, i64 0, metadata !189), !dbg !534
  %68 = sext i32 %66 to i64, !dbg !535
  %69 = getelementptr inbounds double* %a, i64 %68, !dbg !535
  %70 = load double* %69, align 8, !dbg !535, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !193), !dbg !535
  %71 = add nsw i32 %66, 1, !dbg !536
  %72 = sext i32 %71 to i64, !dbg !536
  %73 = getelementptr inbounds double* %a, i64 %72, !dbg !536
  %74 = load double* %73, align 8, !dbg !536, !tbaa !242
  %75 = fsub double -0.000000e+00, %74, !dbg !536
  tail call void @llvm.dbg.value(metadata !{double %75}, i64 0, metadata !194), !dbg !536
  %76 = sext i32 %67 to i64, !dbg !537
  %77 = getelementptr inbounds double* %a, i64 %76, !dbg !537
  %78 = load double* %77, align 8, !dbg !537, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !195), !dbg !537
  %79 = add nsw i32 %67, 1, !dbg !538
  %80 = sext i32 %79 to i64, !dbg !538
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !538
  %82 = load double* %81, align 8, !dbg !538, !tbaa !242
  %83 = fsub double -0.000000e+00, %82, !dbg !538
  tail call void @llvm.dbg.value(metadata !{double %83}, i64 0, metadata !196), !dbg !538
  store double %78, double* %69, align 8, !dbg !539, !tbaa !242
  store double %83, double* %73, align 8, !dbg !540, !tbaa !242
  store double %70, double* %77, align 8, !dbg !541, !tbaa !242
  store double %75, double* %81, align 8, !dbg !542, !tbaa !242
  %84 = add nsw i32 %66, %14, !dbg !543
  tail call void @llvm.dbg.value(metadata !{i32 %84}, i64 0, metadata !187), !dbg !543
  %85 = add nsw i32 %67, %18, !dbg !544
  tail call void @llvm.dbg.value(metadata !{i32 %85}, i64 0, metadata !189), !dbg !544
  %86 = sext i32 %84 to i64, !dbg !545
  %87 = getelementptr inbounds double* %a, i64 %86, !dbg !545
  %88 = load double* %87, align 8, !dbg !545, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %88}, i64 0, metadata !193), !dbg !545
  %89 = add nsw i32 %84, 1, !dbg !546
  %90 = sext i32 %89 to i64, !dbg !546
  %91 = getelementptr inbounds double* %a, i64 %90, !dbg !546
  %92 = load double* %91, align 8, !dbg !546, !tbaa !242
  %93 = fsub double -0.000000e+00, %92, !dbg !546
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !194), !dbg !546
  %94 = sext i32 %85 to i64, !dbg !547
  %95 = getelementptr inbounds double* %a, i64 %94, !dbg !547
  %96 = load double* %95, align 8, !dbg !547, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !195), !dbg !547
  %97 = add nsw i32 %85, 1, !dbg !548
  %98 = sext i32 %97 to i64, !dbg !548
  %99 = getelementptr inbounds double* %a, i64 %98, !dbg !548
  %100 = load double* %99, align 8, !dbg !548, !tbaa !242
  %101 = fsub double -0.000000e+00, %100, !dbg !548
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !196), !dbg !548
  store double %96, double* %87, align 8, !dbg !549, !tbaa !242
  store double %101, double* %91, align 8, !dbg !550, !tbaa !242
  store double %88, double* %95, align 8, !dbg !551, !tbaa !242
  store double %93, double* %99, align 8, !dbg !552, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !513
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !513
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv25, !dbg !513
  br i1 %exitcond, label %._crit_edge, label %25, !dbg !513

._crit_edge:                                      ; preds = %25, %.preheader
  %102 = trunc i64 %indvars.iv27 to i32, !dbg !553
  %103 = shl nsw i32 %102, 1, !dbg !553
  %104 = getelementptr inbounds i32* %ip, i64 %indvars.iv27, !dbg !553
  %105 = load i32* %104, align 4, !dbg !553, !tbaa !341
  %106 = add nsw i32 %105, %103, !dbg !553
  tail call void @llvm.dbg.value(metadata !{i32 %106}, i64 0, metadata !189), !dbg !553
  %107 = add nsw i32 %106, 1, !dbg !554
  %108 = sext i32 %107 to i64, !dbg !554
  %109 = getelementptr inbounds double* %a, i64 %108, !dbg !554
  %110 = load double* %109, align 8, !dbg !554, !tbaa !242
  %111 = fsub double -0.000000e+00, %110, !dbg !554
  store double %111, double* %109, align 8, !dbg !554, !tbaa !242
  %112 = add nsw i32 %106, %14, !dbg !555
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !187), !dbg !555
  %113 = add nsw i32 %112, %14, !dbg !556
  tail call void @llvm.dbg.value(metadata !{i32 %113}, i64 0, metadata !189), !dbg !556
  %114 = sext i32 %112 to i64, !dbg !557
  %115 = getelementptr inbounds double* %a, i64 %114, !dbg !557
  %116 = load double* %115, align 8, !dbg !557, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %116}, i64 0, metadata !193), !dbg !557
  %117 = add nsw i32 %112, 1, !dbg !558
  %118 = sext i32 %117 to i64, !dbg !558
  %119 = getelementptr inbounds double* %a, i64 %118, !dbg !558
  %120 = load double* %119, align 8, !dbg !558, !tbaa !242
  %121 = fsub double -0.000000e+00, %120, !dbg !558
  tail call void @llvm.dbg.value(metadata !{double %121}, i64 0, metadata !194), !dbg !558
  %122 = sext i32 %113 to i64, !dbg !559
  %123 = getelementptr inbounds double* %a, i64 %122, !dbg !559
  %124 = load double* %123, align 8, !dbg !559, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %124}, i64 0, metadata !195), !dbg !559
  %125 = add nsw i32 %113, 1, !dbg !560
  %126 = sext i32 %125 to i64, !dbg !560
  %127 = getelementptr inbounds double* %a, i64 %126, !dbg !560
  %128 = load double* %127, align 8, !dbg !560, !tbaa !242
  %129 = fsub double -0.000000e+00, %128, !dbg !560
  tail call void @llvm.dbg.value(metadata !{double %129}, i64 0, metadata !196), !dbg !560
  store double %124, double* %115, align 8, !dbg !561, !tbaa !242
  store double %129, double* %119, align 8, !dbg !562, !tbaa !242
  store double %116, double* %123, align 8, !dbg !563, !tbaa !242
  store double %121, double* %127, align 8, !dbg !564, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{i32 %17}, i64 0, metadata !189), !dbg !508
  %130 = add i32 %17, %113, !dbg !565
  %131 = sext i32 %130 to i64, !dbg !565
  %132 = getelementptr inbounds double* %a, i64 %131, !dbg !565
  %133 = load double* %132, align 8, !dbg !565, !tbaa !242
  %134 = fsub double -0.000000e+00, %133, !dbg !565
  store double %134, double* %132, align 8, !dbg !565, !tbaa !242
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1, !dbg !505
  %indvars.iv.next26 = add nuw nsw i32 %indvars.iv25, 1, !dbg !505
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next26}, i64 0, metadata !188), !dbg !505
  %lftr.wideiv29 = trunc i64 %indvars.iv.next28 to i32, !dbg !505
  %exitcond30 = icmp eq i32 %lftr.wideiv29, %m.0.lcssa, !dbg !505
  br i1 %exitcond30, label %.loopexit, label %.preheader, !dbg !505

; <label>:135                                     ; preds = %._crit_edge19
  %136 = getelementptr inbounds double* %a, i64 1, !dbg !566
  %137 = load double* %136, align 8, !dbg !566, !tbaa !242
  %138 = fsub double -0.000000e+00, %137, !dbg !566
  store double %138, double* %136, align 8, !dbg !566, !tbaa !242
  %139 = or i32 %14, 1, !dbg !568
  %140 = sext i32 %139 to i64, !dbg !568
  %141 = getelementptr inbounds double* %a, i64 %140, !dbg !568
  %142 = load double* %141, align 8, !dbg !568, !tbaa !242
  %143 = fsub double -0.000000e+00, %142, !dbg !568
  store double %143, double* %141, align 8, !dbg !568, !tbaa !242
  tail call void @llvm.dbg.value(metadata !344, i64 0, metadata !188), !dbg !569
  %144 = icmp sgt i32 %m.0.lcssa, 1, !dbg !569
  br i1 %144, label %.preheader2.lr.ph, label %.loopexit, !dbg !569

.preheader2.lr.ph:                                ; preds = %135
  %145 = or i32 %14, 1, !dbg !571
  br label %.lr.ph7, !dbg !569

.lr.ph7:                                          ; preds = %.preheader2.lr.ph, %._crit_edge8
  %indvars.iv37 = phi i64 [ 1, %.preheader2.lr.ph ], [ %indvars.iv.next38, %._crit_edge8 ]
  %indvars.iv33 = phi i32 [ 1, %.preheader2.lr.ph ], [ %indvars.iv.next34, %._crit_edge8 ]
  %146 = getelementptr inbounds i32* %ip, i64 %indvars.iv37, !dbg !573
  %147 = load i32* %146, align 4, !dbg !573, !tbaa !341
  %148 = trunc i64 %indvars.iv37 to i32, !dbg !576
  %149 = shl nsw i32 %148, 1, !dbg !576
  br label %150, !dbg !577

; <label>:150                                     ; preds = %150, %.lr.ph7
  %indvars.iv31 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next32, %150 ]
  %151 = trunc i64 %indvars.iv31 to i32, !dbg !573
  %152 = shl nsw i32 %151, 1, !dbg !573
  %153 = add nsw i32 %147, %152, !dbg !573
  tail call void @llvm.dbg.value(metadata !{i32 %153}, i64 0, metadata !187), !dbg !573
  %154 = getelementptr inbounds i32* %ip, i64 %indvars.iv31, !dbg !576
  %155 = load i32* %154, align 4, !dbg !576, !tbaa !341
  %156 = add nsw i32 %155, %149, !dbg !576
  tail call void @llvm.dbg.value(metadata !{i32 %156}, i64 0, metadata !189), !dbg !576
  %157 = sext i32 %153 to i64, !dbg !578
  %158 = getelementptr inbounds double* %a, i64 %157, !dbg !578
  %159 = load double* %158, align 8, !dbg !578, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %159}, i64 0, metadata !193), !dbg !578
  %160 = add nsw i32 %153, 1, !dbg !579
  %161 = sext i32 %160 to i64, !dbg !579
  %162 = getelementptr inbounds double* %a, i64 %161, !dbg !579
  %163 = load double* %162, align 8, !dbg !579, !tbaa !242
  %164 = fsub double -0.000000e+00, %163, !dbg !579
  tail call void @llvm.dbg.value(metadata !{double %164}, i64 0, metadata !194), !dbg !579
  %165 = sext i32 %156 to i64, !dbg !580
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !580
  %167 = load double* %166, align 8, !dbg !580, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %167}, i64 0, metadata !195), !dbg !580
  %168 = add nsw i32 %156, 1, !dbg !581
  %169 = sext i32 %168 to i64, !dbg !581
  %170 = getelementptr inbounds double* %a, i64 %169, !dbg !581
  %171 = load double* %170, align 8, !dbg !581, !tbaa !242
  %172 = fsub double -0.000000e+00, %171, !dbg !581
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !196), !dbg !581
  store double %167, double* %158, align 8, !dbg !582, !tbaa !242
  store double %172, double* %162, align 8, !dbg !583, !tbaa !242
  store double %159, double* %166, align 8, !dbg !584, !tbaa !242
  store double %164, double* %170, align 8, !dbg !585, !tbaa !242
  %173 = add nsw i32 %153, %14, !dbg !586
  tail call void @llvm.dbg.value(metadata !{i32 %173}, i64 0, metadata !187), !dbg !586
  %174 = add nsw i32 %156, %14, !dbg !587
  tail call void @llvm.dbg.value(metadata !{i32 %174}, i64 0, metadata !189), !dbg !587
  %175 = sext i32 %173 to i64, !dbg !588
  %176 = getelementptr inbounds double* %a, i64 %175, !dbg !588
  %177 = load double* %176, align 8, !dbg !588, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %177}, i64 0, metadata !193), !dbg !588
  %178 = add nsw i32 %173, 1, !dbg !589
  %179 = sext i32 %178 to i64, !dbg !589
  %180 = getelementptr inbounds double* %a, i64 %179, !dbg !589
  %181 = load double* %180, align 8, !dbg !589, !tbaa !242
  %182 = fsub double -0.000000e+00, %181, !dbg !589
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !194), !dbg !589
  %183 = sext i32 %174 to i64, !dbg !590
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !590
  %185 = load double* %184, align 8, !dbg !590, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %185}, i64 0, metadata !195), !dbg !590
  %186 = add nsw i32 %174, 1, !dbg !591
  %187 = sext i32 %186 to i64, !dbg !591
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !591
  %189 = load double* %188, align 8, !dbg !591, !tbaa !242
  %190 = fsub double -0.000000e+00, %189, !dbg !591
  tail call void @llvm.dbg.value(metadata !{double %190}, i64 0, metadata !196), !dbg !591
  store double %185, double* %176, align 8, !dbg !592, !tbaa !242
  store double %190, double* %180, align 8, !dbg !593, !tbaa !242
  store double %177, double* %184, align 8, !dbg !594, !tbaa !242
  store double %182, double* %188, align 8, !dbg !595, !tbaa !242
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !577
  %lftr.wideiv35 = trunc i64 %indvars.iv.next32 to i32, !dbg !577
  %exitcond36 = icmp eq i32 %lftr.wideiv35, %indvars.iv33, !dbg !577
  br i1 %exitcond36, label %._crit_edge8, label %150, !dbg !577

._crit_edge8:                                     ; preds = %150
  %191 = trunc i64 %indvars.iv37 to i32, !dbg !596
  %192 = shl nsw i32 %191, 1, !dbg !596
  %193 = getelementptr inbounds i32* %ip, i64 %indvars.iv37, !dbg !596
  %194 = load i32* %193, align 4, !dbg !596, !tbaa !341
  %195 = add nsw i32 %194, %192, !dbg !596
  tail call void @llvm.dbg.value(metadata !{i32 %195}, i64 0, metadata !189), !dbg !596
  %196 = add nsw i32 %195, 1, !dbg !597
  %197 = sext i32 %196 to i64, !dbg !597
  %198 = getelementptr inbounds double* %a, i64 %197, !dbg !597
  %199 = load double* %198, align 8, !dbg !597, !tbaa !242
  %200 = fsub double -0.000000e+00, %199, !dbg !597
  store double %200, double* %198, align 8, !dbg !597, !tbaa !242
  %201 = add i32 %145, %195, !dbg !571
  %202 = sext i32 %201 to i64, !dbg !571
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !571
  %204 = load double* %203, align 8, !dbg !571, !tbaa !242
  %205 = fsub double -0.000000e+00, %204, !dbg !571
  store double %205, double* %203, align 8, !dbg !571, !tbaa !242
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1, !dbg !569
  %indvars.iv.next34 = add nuw nsw i32 %indvars.iv33, 1, !dbg !569
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next34}, i64 0, metadata !188), !dbg !569
  %lftr.wideiv39 = trunc i64 %indvars.iv.next38 to i32, !dbg !569
  %exitcond40 = icmp eq i32 %lftr.wideiv39, %m.0.lcssa, !dbg !569
  br i1 %exitcond40, label %.loopexit, label %.lr.ph7, !dbg !569

.loopexit:                                        ; preds = %._crit_edge8, %._crit_edge, %135, %.preheader1
  ret void, !dbg !598
}

; Function Attrs: nounwind uwtable
define internal fastcc void @cftbsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !94), !dbg !599
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !95), !dbg !599
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !96), !dbg !599
  tail call void @llvm.dbg.value(metadata !443, i64 0, metadata !101), !dbg !600
  %1 = icmp sgt i32 %n, 8, !dbg !601
  br i1 %1, label %2, label %.loopexit3, !dbg !601

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w), !dbg !603
  tail call void @llvm.dbg.value(metadata !449, i64 0, metadata !101), !dbg !605
  %3 = icmp sgt i32 %n, 32, !dbg !606
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !606

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w), !dbg !607
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !101), !dbg !609
  %5 = shl i32 %4, 2, !dbg !606
  %6 = icmp slt i32 %5, %n, !dbg !606
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !606

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !610
  %8 = icmp eq i32 %7, %n, !dbg !610
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !97), !dbg !612
  %9 = icmp sgt i32 %l.1, 0, !dbg !612
  br i1 %8, label %.preheader, label %.preheader1, !dbg !610

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !615

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !615
  br label %63, !dbg !615

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !612

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !612
  %12 = sext i32 %l.1 to i64, !dbg !612
  %13 = sext i32 %l.1 to i64, !dbg !612
  br label %14, !dbg !612

; <label>:14                                      ; preds = %.lr.ph, %14
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %14 ]
  %15 = add nsw i64 %indvars.iv, %11, !dbg !618
  %16 = add nsw i64 %15, %12, !dbg !620
  %17 = add nsw i64 %16, %13, !dbg !621
  %18 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !622
  %19 = load double* %18, align 8, !dbg !622, !tbaa !242
  %20 = getelementptr inbounds double* %a, i64 %15, !dbg !622
  %21 = load double* %20, align 8, !dbg !622, !tbaa !242
  %22 = fadd double %19, %21, !dbg !622
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !102), !dbg !622
  %23 = or i64 %indvars.iv, 1, !dbg !623
  %24 = getelementptr inbounds double* %a, i64 %23, !dbg !623
  %25 = load double* %24, align 8, !dbg !623, !tbaa !242
  %26 = fsub double -0.000000e+00, %25, !dbg !623
  %27 = add nsw i64 %15, 1, !dbg !623
  %28 = getelementptr inbounds double* %a, i64 %27, !dbg !623
  %29 = load double* %28, align 8, !dbg !623, !tbaa !242
  %30 = fsub double %26, %29, !dbg !623
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !103), !dbg !623
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !104), !dbg !624
  %31 = insertelement <2 x double> undef, double %19, i32 0, !dbg !624
  %32 = insertelement <2 x double> %31, double %29, i32 1, !dbg !624
  %33 = insertelement <2 x double> undef, double %21, i32 0, !dbg !624
  %34 = insertelement <2 x double> %33, double %25, i32 1, !dbg !624
  %35 = fsub <2 x double> %32, %34, !dbg !624
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !105), !dbg !625
  %36 = getelementptr inbounds double* %a, i64 %16, !dbg !626
  %37 = load double* %36, align 8, !dbg !626, !tbaa !242
  %38 = getelementptr inbounds double* %a, i64 %17, !dbg !626
  %39 = load double* %38, align 8, !dbg !626, !tbaa !242
  %40 = fadd double %37, %39, !dbg !626
  tail call void @llvm.dbg.value(metadata !{double %40}, i64 0, metadata !106), !dbg !626
  %41 = add nsw i64 %16, 1, !dbg !627
  %42 = getelementptr inbounds double* %a, i64 %41, !dbg !627
  %43 = load double* %42, align 8, !dbg !627, !tbaa !242
  %44 = add nsw i64 %17, 1, !dbg !627
  %45 = getelementptr inbounds double* %a, i64 %44, !dbg !627
  %46 = load double* %45, align 8, !dbg !627, !tbaa !242
  %47 = fadd double %43, %46, !dbg !627
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !107), !dbg !627
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !108), !dbg !628
  %48 = insertelement <2 x double> undef, double %43, i32 0, !dbg !629
  %49 = insertelement <2 x double> %48, double %37, i32 1, !dbg !629
  %50 = insertelement <2 x double> undef, double %46, i32 0, !dbg !629
  %51 = insertelement <2 x double> %50, double %39, i32 1, !dbg !629
  %52 = fsub <2 x double> %49, %51, !dbg !629
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !109), !dbg !629
  %53 = fadd double %22, %40, !dbg !630
  store double %53, double* %18, align 8, !dbg !630, !tbaa !242
  %54 = fsub double %30, %47, !dbg !631
  store double %54, double* %24, align 8, !dbg !631, !tbaa !242
  %55 = fsub double %22, %40, !dbg !632
  store double %55, double* %36, align 8, !dbg !632, !tbaa !242
  %56 = fadd double %30, %47, !dbg !633
  store double %56, double* %42, align 8, !dbg !633, !tbaa !242
  %57 = fsub <2 x double> %35, %52, !dbg !634
  %58 = bitcast double* %20 to <2 x double>*, !dbg !634
  store <2 x double> %57, <2 x double>* %58, align 8, !dbg !634, !tbaa !242
  %59 = fadd <2 x double> %35, %52, !dbg !635
  %60 = bitcast double* %38 to <2 x double>*, !dbg !635
  store <2 x double> %59, <2 x double>* %60, align 8, !dbg !635, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !612
  %61 = trunc i64 %indvars.iv.next to i32, !dbg !612
  %62 = icmp slt i32 %61, %l.1, !dbg !612
  br i1 %62, label %14, label %.loopexit, !dbg !612

; <label>:63                                      ; preds = %.lr.ph6, %63
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %63 ]
  %64 = add nsw i64 %indvars.iv9, %10, !dbg !636
  %65 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !638
  %66 = load double* %65, align 8, !dbg !638, !tbaa !242
  %67 = getelementptr inbounds double* %a, i64 %64, !dbg !638
  %68 = load double* %67, align 8, !dbg !638, !tbaa !242
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !102), !dbg !638
  %69 = or i64 %indvars.iv9, 1, !dbg !639
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !639
  %71 = load double* %70, align 8, !dbg !639, !tbaa !242
  %72 = add nsw i64 %64, 1, !dbg !639
  %73 = getelementptr inbounds double* %a, i64 %72, !dbg !639
  %74 = load double* %73, align 8, !dbg !639, !tbaa !242
  %75 = insertelement <2 x double> undef, double %66, i32 0, !dbg !638
  %76 = insertelement <2 x double> %75, double %74, i32 1, !dbg !638
  %77 = insertelement <2 x double> undef, double %68, i32 0, !dbg !638
  %78 = insertelement <2 x double> %77, double %71, i32 1, !dbg !638
  %79 = fsub <2 x double> %76, %78, !dbg !638
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !103), !dbg !639
  %80 = fadd double %66, %68, !dbg !640
  store double %80, double* %65, align 8, !dbg !640, !tbaa !242
  %81 = load double* %70, align 8, !dbg !641, !tbaa !242
  %82 = fsub double -0.000000e+00, %81, !dbg !641
  %83 = load double* %73, align 8, !dbg !641, !tbaa !242
  %84 = fsub double %82, %83, !dbg !641
  store double %84, double* %70, align 8, !dbg !641, !tbaa !242
  %85 = bitcast double* %67 to <2 x double>*, !dbg !642
  store <2 x double> %79, <2 x double>* %85, align 8, !dbg !642, !tbaa !242
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !615
  %86 = trunc i64 %indvars.iv.next10 to i32, !dbg !615
  %87 = icmp slt i32 %86, %l.1, !dbg !615
  br i1 %87, label %63, label %.loopexit, !dbg !615

.loopexit:                                        ; preds = %63, %14, %.preheader1, %.preheader
  ret void, !dbg !643
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cft1st(i32 %n, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !143), !dbg !644
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !144), !dbg !644
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !145), !dbg !644
  %1 = getelementptr inbounds double* %a, i64 2, !dbg !645
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !155), !dbg !645
  %2 = bitcast double* %a to <2 x double>*, !dbg !645
  %3 = load <2 x double>* %2, align 8, !dbg !645, !tbaa !242
  %4 = getelementptr inbounds double* %a, i64 3, !dbg !646
  %5 = bitcast double* %1 to <2 x double>*, !dbg !645
  %6 = load <2 x double>* %5, align 8, !dbg !645, !tbaa !242
  %7 = fadd <2 x double> %3, %6, !dbg !645
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !156), !dbg !646
  %8 = extractelement <2 x double> %3, i32 0, !dbg !647
  %9 = extractelement <2 x double> %6, i32 0, !dbg !647
  %10 = fsub double %8, %9, !dbg !647
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !157), !dbg !647
  %11 = extractelement <2 x double> %3, i32 1, !dbg !648
  %12 = extractelement <2 x double> %6, i32 1, !dbg !648
  %13 = fsub double %11, %12, !dbg !648
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !158), !dbg !648
  %14 = getelementptr inbounds double* %a, i64 4, !dbg !649
  %15 = getelementptr inbounds double* %a, i64 6, !dbg !649
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !159), !dbg !649
  %16 = bitcast double* %14 to <2 x double>*, !dbg !649
  %17 = load <2 x double>* %16, align 8, !dbg !649, !tbaa !242
  %18 = getelementptr inbounds double* %a, i64 7, !dbg !650
  %19 = bitcast double* %15 to <2 x double>*, !dbg !649
  %20 = load <2 x double>* %19, align 8, !dbg !649, !tbaa !242
  %21 = fadd <2 x double> %17, %20, !dbg !649
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !160), !dbg !650
  %22 = extractelement <2 x double> %17, i32 0, !dbg !651
  %23 = extractelement <2 x double> %20, i32 0, !dbg !651
  %24 = fsub double %22, %23, !dbg !651
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !161), !dbg !651
  %25 = extractelement <2 x double> %17, i32 1, !dbg !652
  %26 = extractelement <2 x double> %20, i32 1, !dbg !652
  %27 = fsub double %25, %26, !dbg !652
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !162), !dbg !652
  %28 = fadd <2 x double> %7, %21, !dbg !653
  %29 = bitcast double* %a to <2 x double>*, !dbg !653
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !653, !tbaa !242
  %30 = fsub <2 x double> %7, %21, !dbg !654
  %31 = bitcast double* %14 to <2 x double>*, !dbg !654
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !654, !tbaa !242
  %32 = fsub double %10, %27, !dbg !655
  store double %32, double* %1, align 8, !dbg !655, !tbaa !242
  %33 = fadd double %13, %24, !dbg !656
  store double %33, double* %4, align 8, !dbg !656, !tbaa !242
  %34 = fadd double %10, %27, !dbg !657
  store double %34, double* %15, align 8, !dbg !657, !tbaa !242
  %35 = fsub double %13, %24, !dbg !658
  store double %35, double* %18, align 8, !dbg !658, !tbaa !242
  %36 = getelementptr inbounds double* %w, i64 2, !dbg !659
  %37 = load double* %36, align 8, !dbg !659, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !149), !dbg !659
  %38 = getelementptr inbounds double* %a, i64 8, !dbg !660
  %39 = getelementptr inbounds double* %a, i64 10, !dbg !660
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !155), !dbg !660
  %40 = bitcast double* %38 to <2 x double>*, !dbg !660
  %41 = load <2 x double>* %40, align 8, !dbg !660, !tbaa !242
  %42 = bitcast double* %39 to <2 x double>*, !dbg !660
  %43 = load <2 x double>* %42, align 8, !dbg !660, !tbaa !242
  %44 = fadd <2 x double> %41, %43, !dbg !660
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !156), !dbg !661
  %45 = extractelement <2 x double> %41, i32 0, !dbg !662
  %46 = extractelement <2 x double> %43, i32 0, !dbg !662
  %47 = fsub double %45, %46, !dbg !662
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !157), !dbg !662
  %48 = extractelement <2 x double> %41, i32 1, !dbg !663
  %49 = extractelement <2 x double> %43, i32 1, !dbg !663
  %50 = fsub double %48, %49, !dbg !663
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !158), !dbg !663
  %51 = getelementptr inbounds double* %a, i64 12, !dbg !664
  %52 = getelementptr inbounds double* %a, i64 14, !dbg !664
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !159), !dbg !664
  %53 = bitcast double* %51 to <2 x double>*, !dbg !664
  %54 = load <2 x double>* %53, align 8, !dbg !664, !tbaa !242
  %55 = bitcast double* %52 to <2 x double>*, !dbg !664
  %56 = load <2 x double>* %55, align 8, !dbg !664, !tbaa !242
  %57 = fadd <2 x double> %54, %56, !dbg !664
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !160), !dbg !665
  %58 = extractelement <2 x double> %54, i32 0, !dbg !666
  %59 = extractelement <2 x double> %56, i32 0, !dbg !666
  %60 = fsub double %58, %59, !dbg !666
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !161), !dbg !666
  %61 = extractelement <2 x double> %54, i32 1, !dbg !667
  %62 = extractelement <2 x double> %56, i32 1, !dbg !667
  %63 = fsub double %61, %62, !dbg !667
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !162), !dbg !667
  %64 = fadd <2 x double> %44, %57, !dbg !668
  %65 = bitcast double* %38 to <2 x double>*, !dbg !668
  store <2 x double> %64, <2 x double>* %65, align 8, !dbg !668, !tbaa !242
  %66 = shufflevector <2 x double> %57, <2 x double> %44, <2 x i32> <i32 1, i32 2>, !dbg !669
  %67 = shufflevector <2 x double> %44, <2 x double> %57, <2 x i32> <i32 1, i32 2>, !dbg !669
  %68 = fsub <2 x double> %66, %67, !dbg !669
  %69 = bitcast double* %51 to <2 x double>*, !dbg !669
  store <2 x double> %68, <2 x double>* %69, align 8, !dbg !669, !tbaa !242
  %70 = fsub double %47, %63, !dbg !670
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !155), !dbg !670
  %71 = fadd double %50, %60, !dbg !671
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !156), !dbg !671
  %72 = fsub double %70, %71, !dbg !672
  %73 = fadd double %71, %70, !dbg !673
  %74 = insertelement <2 x double> undef, double %72, i32 0, !dbg !672
  %75 = insertelement <2 x double> %74, double %73, i32 1, !dbg !672
  %76 = insertelement <2 x double> undef, double %37, i32 0, !dbg !672
  %77 = insertelement <2 x double> %76, double %37, i32 1, !dbg !672
  %78 = fmul <2 x double> %75, %77, !dbg !672
  %79 = bitcast double* %39 to <2 x double>*, !dbg !672
  store <2 x double> %78, <2 x double>* %79, align 8, !dbg !672, !tbaa !242
  %80 = fadd double %47, %63, !dbg !674
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !155), !dbg !674
  %81 = fsub double %60, %50, !dbg !675
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !156), !dbg !675
  %82 = fsub double %81, %80, !dbg !676
  %83 = fadd double %81, %80, !dbg !677
  %84 = insertelement <2 x double> undef, double %82, i32 0, !dbg !676
  %85 = insertelement <2 x double> %84, double %83, i32 1, !dbg !676
  %86 = fmul <2 x double> %85, %77, !dbg !676
  %87 = bitcast double* %52 to <2 x double>*, !dbg !676
  store <2 x double> %86, <2 x double>* %87, align 8, !dbg !676, !tbaa !242
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !147), !dbg !678
  tail call void @llvm.dbg.value(metadata !679, i64 0, metadata !146), !dbg !680
  %88 = icmp sgt i32 %n, 16, !dbg !680
  br i1 %88, label %.lr.ph, label %._crit_edge, !dbg !680

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 16, %0 ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 2, !dbg !680
  %89 = shl nsw i64 %indvars.iv.next4, 1, !dbg !682
  %90 = getelementptr inbounds double* %w, i64 %indvars.iv.next4, !dbg !684
  %91 = load double* %90, align 8, !dbg !684, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !151), !dbg !684
  %92 = add nsw i64 %indvars.iv3, 3, !dbg !685
  %93 = getelementptr inbounds double* %w, i64 %92, !dbg !685
  %94 = load double* %93, align 8, !dbg !685, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !152), !dbg !685
  %95 = getelementptr inbounds double* %w, i64 %89, !dbg !686
  %96 = load double* %95, align 8, !dbg !686, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !149), !dbg !686
  %97 = or i64 %89, 1, !dbg !687
  %98 = getelementptr inbounds double* %w, i64 %97, !dbg !687
  %99 = load double* %98, align 8, !dbg !687, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !150), !dbg !687
  %100 = fmul double %94, 2.000000e+00, !dbg !688
  %101 = fmul double %100, %99, !dbg !688
  %102 = fsub double %96, %101, !dbg !688
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !153), !dbg !688
  %103 = fmul double %100, %96, !dbg !689
  %104 = fsub double %103, %99, !dbg !689
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !154), !dbg !689
  %105 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !690
  %106 = or i64 %indvars.iv, 2, !dbg !690
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !690
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !155), !dbg !690
  %108 = bitcast double* %105 to <2 x double>*, !dbg !690
  %109 = load <2 x double>* %108, align 8, !dbg !690, !tbaa !242
  %110 = or i64 %indvars.iv, 3, !dbg !691
  %111 = getelementptr inbounds double* %a, i64 %110, !dbg !691
  %112 = bitcast double* %107 to <2 x double>*, !dbg !690
  %113 = load <2 x double>* %112, align 8, !dbg !690, !tbaa !242
  %114 = fadd <2 x double> %109, %113, !dbg !690
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !156), !dbg !691
  %115 = extractelement <2 x double> %109, i32 0, !dbg !692
  %116 = extractelement <2 x double> %113, i32 0, !dbg !692
  %117 = fsub double %115, %116, !dbg !692
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !157), !dbg !692
  %118 = extractelement <2 x double> %109, i32 1, !dbg !693
  %119 = extractelement <2 x double> %113, i32 1, !dbg !693
  %120 = fsub double %118, %119, !dbg !693
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !158), !dbg !693
  %121 = or i64 %indvars.iv, 4, !dbg !694
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !694
  %123 = or i64 %indvars.iv, 6, !dbg !694
  %124 = getelementptr inbounds double* %a, i64 %123, !dbg !694
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !159), !dbg !694
  %125 = or i64 %indvars.iv, 5, !dbg !695
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !695
  %127 = bitcast double* %122 to <2 x double>*, !dbg !694
  %128 = load <2 x double>* %127, align 8, !dbg !694, !tbaa !242
  %129 = or i64 %indvars.iv, 7, !dbg !695
  %130 = getelementptr inbounds double* %a, i64 %129, !dbg !695
  %131 = bitcast double* %124 to <2 x double>*, !dbg !694
  %132 = load <2 x double>* %131, align 8, !dbg !694, !tbaa !242
  %133 = fadd <2 x double> %128, %132, !dbg !694
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !160), !dbg !695
  %134 = extractelement <2 x double> %128, i32 0, !dbg !696
  %135 = extractelement <2 x double> %132, i32 0, !dbg !696
  %136 = fsub double %134, %135, !dbg !696
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !161), !dbg !696
  %137 = extractelement <2 x double> %128, i32 1, !dbg !697
  %138 = extractelement <2 x double> %132, i32 1, !dbg !697
  %139 = fsub double %137, %138, !dbg !697
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !162), !dbg !697
  %140 = fadd <2 x double> %114, %133, !dbg !698
  %141 = bitcast double* %105 to <2 x double>*, !dbg !698
  store <2 x double> %140, <2 x double>* %141, align 8, !dbg !698, !tbaa !242
  %142 = extractelement <2 x double> %114, i32 0, !dbg !699
  %143 = extractelement <2 x double> %133, i32 0, !dbg !699
  %144 = fsub double %142, %143, !dbg !699
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !155), !dbg !699
  %145 = extractelement <2 x double> %114, i32 1, !dbg !700
  %146 = extractelement <2 x double> %133, i32 1, !dbg !700
  %147 = fsub double %145, %146, !dbg !700
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !156), !dbg !700
  %148 = fmul double %91, %144, !dbg !701
  %149 = fmul double %94, %147, !dbg !701
  %150 = fsub double %148, %149, !dbg !701
  store double %150, double* %122, align 8, !dbg !701, !tbaa !242
  %151 = fmul double %91, %147, !dbg !702
  %152 = fmul double %94, %144, !dbg !702
  %153 = fadd double %152, %151, !dbg !702
  store double %153, double* %126, align 8, !dbg !702, !tbaa !242
  %154 = fsub double %117, %139, !dbg !703
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !155), !dbg !703
  %155 = fadd double %120, %136, !dbg !704
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !156), !dbg !704
  %156 = fmul double %96, %154, !dbg !705
  %157 = fmul double %99, %155, !dbg !705
  %158 = fsub double %156, %157, !dbg !705
  store double %158, double* %107, align 8, !dbg !705, !tbaa !242
  %159 = fmul double %96, %155, !dbg !706
  %160 = fmul double %99, %154, !dbg !706
  %161 = fadd double %159, %160, !dbg !706
  store double %161, double* %111, align 8, !dbg !706, !tbaa !242
  %162 = fadd double %117, %139, !dbg !707
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !155), !dbg !707
  %163 = fsub double %120, %136, !dbg !708
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !156), !dbg !708
  %164 = fmul double %102, %162, !dbg !709
  %165 = fmul double %104, %163, !dbg !709
  %166 = fsub double %164, %165, !dbg !709
  store double %166, double* %124, align 8, !dbg !709, !tbaa !242
  %167 = fmul double %102, %163, !dbg !710
  %168 = fmul double %104, %162, !dbg !710
  %169 = fadd double %167, %168, !dbg !710
  store double %169, double* %130, align 8, !dbg !710, !tbaa !242
  %170 = or i64 %89, 2, !dbg !711
  %171 = getelementptr inbounds double* %w, i64 %170, !dbg !711
  %172 = load double* %171, align 8, !dbg !711, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !149), !dbg !711
  %173 = or i64 %89, 3, !dbg !712
  %174 = getelementptr inbounds double* %w, i64 %173, !dbg !712
  %175 = load double* %174, align 8, !dbg !712, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !150), !dbg !712
  %176 = fmul double %91, 2.000000e+00, !dbg !713
  %177 = fmul double %176, %175, !dbg !713
  %178 = fsub double %172, %177, !dbg !713
  tail call void @llvm.dbg.value(metadata !{double %178}, i64 0, metadata !153), !dbg !713
  %179 = fmul double %176, %172, !dbg !714
  %180 = fsub double %179, %175, !dbg !714
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !154), !dbg !714
  %181 = or i64 %indvars.iv, 8, !dbg !715
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !715
  %183 = or i64 %indvars.iv, 10, !dbg !715
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !715
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !155), !dbg !715
  %185 = bitcast double* %182 to <2 x double>*, !dbg !715
  %186 = load <2 x double>* %185, align 8, !dbg !715, !tbaa !242
  %187 = or i64 %indvars.iv, 11, !dbg !716
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !716
  %189 = bitcast double* %184 to <2 x double>*, !dbg !715
  %190 = load <2 x double>* %189, align 8, !dbg !715, !tbaa !242
  %191 = fadd <2 x double> %186, %190, !dbg !715
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !156), !dbg !716
  %192 = extractelement <2 x double> %186, i32 0, !dbg !717
  %193 = extractelement <2 x double> %190, i32 0, !dbg !717
  %194 = fsub double %192, %193, !dbg !717
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !157), !dbg !717
  %195 = extractelement <2 x double> %186, i32 1, !dbg !718
  %196 = extractelement <2 x double> %190, i32 1, !dbg !718
  %197 = fsub double %195, %196, !dbg !718
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !158), !dbg !718
  %198 = or i64 %indvars.iv, 12, !dbg !719
  %199 = getelementptr inbounds double* %a, i64 %198, !dbg !719
  %200 = or i64 %indvars.iv, 14, !dbg !719
  %201 = getelementptr inbounds double* %a, i64 %200, !dbg !719
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !159), !dbg !719
  %202 = or i64 %indvars.iv, 13, !dbg !720
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !720
  %204 = bitcast double* %199 to <2 x double>*, !dbg !719
  %205 = load <2 x double>* %204, align 8, !dbg !719, !tbaa !242
  %206 = or i64 %indvars.iv, 15, !dbg !720
  %207 = getelementptr inbounds double* %a, i64 %206, !dbg !720
  %208 = bitcast double* %201 to <2 x double>*, !dbg !719
  %209 = load <2 x double>* %208, align 8, !dbg !719, !tbaa !242
  %210 = fadd <2 x double> %205, %209, !dbg !719
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !160), !dbg !720
  %211 = extractelement <2 x double> %205, i32 0, !dbg !721
  %212 = extractelement <2 x double> %209, i32 0, !dbg !721
  %213 = fsub double %211, %212, !dbg !721
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !161), !dbg !721
  %214 = extractelement <2 x double> %205, i32 1, !dbg !722
  %215 = extractelement <2 x double> %209, i32 1, !dbg !722
  %216 = fsub double %214, %215, !dbg !722
  tail call void @llvm.dbg.value(metadata !{double %216}, i64 0, metadata !162), !dbg !722
  %217 = fadd <2 x double> %191, %210, !dbg !723
  %218 = bitcast double* %182 to <2 x double>*, !dbg !723
  store <2 x double> %217, <2 x double>* %218, align 8, !dbg !723, !tbaa !242
  %219 = extractelement <2 x double> %191, i32 0, !dbg !724
  %220 = extractelement <2 x double> %210, i32 0, !dbg !724
  %221 = fsub double %219, %220, !dbg !724
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !155), !dbg !724
  %222 = extractelement <2 x double> %191, i32 1, !dbg !725
  %223 = extractelement <2 x double> %210, i32 1, !dbg !725
  %224 = fsub double %222, %223, !dbg !725
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !156), !dbg !725
  %225 = fsub double -0.000000e+00, %94, !dbg !726
  %226 = fmul double %221, %225, !dbg !726
  %227 = fmul double %91, %224, !dbg !726
  %228 = fsub double %226, %227, !dbg !726
  store double %228, double* %199, align 8, !dbg !726, !tbaa !242
  %229 = fmul double %224, %225, !dbg !727
  %230 = fmul double %91, %221, !dbg !727
  %231 = fadd double %230, %229, !dbg !727
  store double %231, double* %203, align 8, !dbg !727, !tbaa !242
  %232 = fsub double %194, %216, !dbg !728
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !155), !dbg !728
  %233 = fadd double %197, %213, !dbg !729
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !156), !dbg !729
  %234 = fmul double %172, %232, !dbg !730
  %235 = fmul double %175, %233, !dbg !730
  %236 = fsub double %234, %235, !dbg !730
  store double %236, double* %184, align 8, !dbg !730, !tbaa !242
  %237 = fmul double %172, %233, !dbg !731
  %238 = fmul double %175, %232, !dbg !731
  %239 = fadd double %237, %238, !dbg !731
  store double %239, double* %188, align 8, !dbg !731, !tbaa !242
  %240 = fadd double %194, %216, !dbg !732
  tail call void @llvm.dbg.value(metadata !{double %240}, i64 0, metadata !155), !dbg !732
  %241 = fsub double %197, %213, !dbg !733
  tail call void @llvm.dbg.value(metadata !{double %241}, i64 0, metadata !156), !dbg !733
  %242 = fmul double %178, %240, !dbg !734
  %243 = fmul double %180, %241, !dbg !734
  %244 = fsub double %242, %243, !dbg !734
  store double %244, double* %201, align 8, !dbg !734, !tbaa !242
  %245 = fmul double %178, %241, !dbg !735
  %246 = fmul double %180, %240, !dbg !735
  %247 = fadd double %245, %246, !dbg !735
  store double %247, double* %207, align 8, !dbg !735, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16, !dbg !680
  %248 = trunc i64 %indvars.iv.next to i32, !dbg !680
  %249 = icmp slt i32 %248, %n, !dbg !680
  br i1 %249, label %.lr.ph, label %._crit_edge, !dbg !680

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !736
}

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cftmdl(i32 %n, i32 %l, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !737
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !115), !dbg !737
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !116), !dbg !737
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !117), !dbg !737
  %1 = shl i32 %l, 2, !dbg !738
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !125), !dbg !738
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !118), !dbg !739
  %2 = icmp sgt i32 %l, 0, !dbg !739
  br i1 %2, label %.lr.ph17, label %._crit_edge14, !dbg !739

.lr.ph17:                                         ; preds = %0
  %3 = sext i32 %l to i64, !dbg !739
  %4 = sext i32 %l to i64, !dbg !739
  %5 = sext i32 %l to i64, !dbg !739
  br label %6, !dbg !739

; <label>:6                                       ; preds = %.lr.ph17, %6
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next28, %6 ]
  %7 = add nsw i64 %indvars.iv27, %3, !dbg !741
  %8 = add nsw i64 %7, %4, !dbg !743
  %9 = add nsw i64 %8, %5, !dbg !744
  %10 = getelementptr inbounds double* %a, i64 %indvars.iv27, !dbg !745
  %11 = getelementptr inbounds double* %a, i64 %7, !dbg !745
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !133), !dbg !745
  %12 = bitcast double* %10 to <2 x double>*, !dbg !745
  %13 = load <2 x double>* %12, align 8, !dbg !745, !tbaa !242
  %14 = add nsw i64 %7, 1, !dbg !746
  %15 = getelementptr inbounds double* %a, i64 %14, !dbg !746
  %16 = bitcast double* %11 to <2 x double>*, !dbg !745
  %17 = load <2 x double>* %16, align 8, !dbg !745, !tbaa !242
  %18 = fadd <2 x double> %13, %17, !dbg !745
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !134), !dbg !746
  %19 = extractelement <2 x double> %13, i32 0, !dbg !747
  %20 = extractelement <2 x double> %17, i32 0, !dbg !747
  %21 = fsub double %19, %20, !dbg !747
  tail call void @llvm.dbg.value(metadata !{double %21}, i64 0, metadata !135), !dbg !747
  %22 = extractelement <2 x double> %13, i32 1, !dbg !748
  %23 = extractelement <2 x double> %17, i32 1, !dbg !748
  %24 = fsub double %22, %23, !dbg !748
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !136), !dbg !748
  %25 = getelementptr inbounds double* %a, i64 %8, !dbg !749
  %26 = getelementptr inbounds double* %a, i64 %9, !dbg !749
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !137), !dbg !749
  %27 = bitcast double* %25 to <2 x double>*, !dbg !749
  %28 = load <2 x double>* %27, align 8, !dbg !749, !tbaa !242
  %29 = add nsw i64 %9, 1, !dbg !750
  %30 = getelementptr inbounds double* %a, i64 %29, !dbg !750
  %31 = bitcast double* %26 to <2 x double>*, !dbg !749
  %32 = load <2 x double>* %31, align 8, !dbg !749, !tbaa !242
  %33 = fadd <2 x double> %28, %32, !dbg !749
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !138), !dbg !750
  %34 = extractelement <2 x double> %28, i32 0, !dbg !751
  %35 = extractelement <2 x double> %32, i32 0, !dbg !751
  %36 = fsub double %34, %35, !dbg !751
  tail call void @llvm.dbg.value(metadata !{double %36}, i64 0, metadata !139), !dbg !751
  %37 = extractelement <2 x double> %28, i32 1, !dbg !752
  %38 = extractelement <2 x double> %32, i32 1, !dbg !752
  %39 = fsub double %37, %38, !dbg !752
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !140), !dbg !752
  %40 = fadd <2 x double> %18, %33, !dbg !753
  %41 = bitcast double* %10 to <2 x double>*, !dbg !753
  store <2 x double> %40, <2 x double>* %41, align 8, !dbg !753, !tbaa !242
  %42 = fsub <2 x double> %18, %33, !dbg !754
  %43 = bitcast double* %25 to <2 x double>*, !dbg !754
  store <2 x double> %42, <2 x double>* %43, align 8, !dbg !754, !tbaa !242
  %44 = fsub double %21, %39, !dbg !755
  store double %44, double* %11, align 8, !dbg !755, !tbaa !242
  %45 = fadd double %24, %36, !dbg !756
  store double %45, double* %15, align 8, !dbg !756, !tbaa !242
  %46 = fadd double %21, %39, !dbg !757
  store double %46, double* %26, align 8, !dbg !757, !tbaa !242
  %47 = fsub double %24, %36, !dbg !758
  store double %47, double* %30, align 8, !dbg !758, !tbaa !242
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 2, !dbg !739
  %48 = trunc i64 %indvars.iv.next28 to i32, !dbg !739
  %49 = icmp slt i32 %48, %l, !dbg !739
  br i1 %49, label %6, label %._crit_edge18, !dbg !739

._crit_edge18:                                    ; preds = %6
  %50 = getelementptr inbounds double* %w, i64 2, !dbg !759
  %51 = load double* %50, align 8, !dbg !759, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %51}, i64 0, metadata !127), !dbg !759
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !760
  %52 = add nsw i32 %1, %l, !dbg !760
  %53 = icmp sgt i32 %l, 0, !dbg !760
  br i1 %53, label %.lr.ph13, label %._crit_edge14, !dbg !760

.lr.ph13:                                         ; preds = %._crit_edge18
  %54 = shl i32 %l, 2, !dbg !760
  %55 = sext i32 %54 to i64
  %56 = sext i32 %l to i64, !dbg !760
  %57 = sext i32 %l to i64, !dbg !760
  %58 = sext i32 %l to i64, !dbg !760
  %59 = insertelement <2 x double> undef, double %51, i32 0, !dbg !762
  %60 = insertelement <2 x double> %59, double %51, i32 1, !dbg !762
  br label %61, !dbg !760

; <label>:61                                      ; preds = %.lr.ph13, %61
  %indvars.iv25 = phi i64 [ %55, %.lr.ph13 ], [ %indvars.iv.next26, %61 ]
  %j.111 = phi i32 [ %1, %.lr.ph13 ], [ %112, %61 ]
  %62 = add nsw i64 %indvars.iv25, %56, !dbg !764
  %63 = add nsw i64 %62, %57, !dbg !765
  %64 = add nsw i64 %63, %58, !dbg !766
  %65 = getelementptr inbounds double* %a, i64 %indvars.iv25, !dbg !767
  %66 = load double* %65, align 8, !dbg !767, !tbaa !242
  %67 = getelementptr inbounds double* %a, i64 %62, !dbg !767
  %68 = load double* %67, align 8, !dbg !767, !tbaa !242
  %69 = fadd double %66, %68, !dbg !767
  tail call void @llvm.dbg.value(metadata !{double %69}, i64 0, metadata !133), !dbg !767
  %70 = or i32 %j.111, 1, !dbg !768
  %71 = sext i32 %70 to i64, !dbg !768
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !768
  %73 = load double* %72, align 8, !dbg !768, !tbaa !242
  %74 = add nsw i64 %62, 1, !dbg !768
  %75 = getelementptr inbounds double* %a, i64 %74, !dbg !768
  %76 = load double* %75, align 8, !dbg !768, !tbaa !242
  %77 = fadd double %73, %76, !dbg !768
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !134), !dbg !768
  %78 = fsub double %66, %68, !dbg !769
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !135), !dbg !769
  %79 = fsub double %73, %76, !dbg !770
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !136), !dbg !770
  %80 = getelementptr inbounds double* %a, i64 %63, !dbg !771
  %81 = load double* %80, align 8, !dbg !771, !tbaa !242
  %82 = getelementptr inbounds double* %a, i64 %64, !dbg !771
  %83 = load double* %82, align 8, !dbg !771, !tbaa !242
  %84 = fadd double %81, %83, !dbg !771
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !137), !dbg !771
  %85 = add nsw i64 %63, 1, !dbg !772
  %86 = getelementptr inbounds double* %a, i64 %85, !dbg !772
  %87 = load double* %86, align 8, !dbg !772, !tbaa !242
  %88 = add nsw i64 %64, 1, !dbg !772
  %89 = getelementptr inbounds double* %a, i64 %88, !dbg !772
  %90 = load double* %89, align 8, !dbg !772, !tbaa !242
  %91 = fadd double %87, %90, !dbg !772
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !138), !dbg !772
  %92 = fsub double %81, %83, !dbg !773
  tail call void @llvm.dbg.value(metadata !{double %92}, i64 0, metadata !139), !dbg !773
  %93 = fsub double %87, %90, !dbg !774
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !140), !dbg !774
  %94 = fadd double %69, %84, !dbg !775
  store double %94, double* %65, align 8, !dbg !775, !tbaa !242
  %95 = fadd double %77, %91, !dbg !776
  store double %95, double* %72, align 8, !dbg !776, !tbaa !242
  %96 = fsub double %91, %77, !dbg !777
  store double %96, double* %80, align 8, !dbg !777, !tbaa !242
  %97 = fsub double %69, %84, !dbg !778
  store double %97, double* %86, align 8, !dbg !778, !tbaa !242
  %98 = fsub double %78, %93, !dbg !779
  tail call void @llvm.dbg.value(metadata !{double %98}, i64 0, metadata !133), !dbg !779
  %99 = fadd double %79, %92, !dbg !780
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !134), !dbg !780
  %100 = fsub double %98, %99, !dbg !762
  %101 = fadd double %99, %98, !dbg !781
  %102 = insertelement <2 x double> undef, double %100, i32 0, !dbg !762
  %103 = insertelement <2 x double> %102, double %101, i32 1, !dbg !762
  %104 = fmul <2 x double> %103, %60, !dbg !762
  %105 = bitcast double* %67 to <2 x double>*, !dbg !762
  store <2 x double> %104, <2 x double>* %105, align 8, !dbg !762, !tbaa !242
  %106 = fadd double %78, %93, !dbg !782
  tail call void @llvm.dbg.value(metadata !{double %106}, i64 0, metadata !133), !dbg !782
  %107 = fsub double %92, %79, !dbg !783
  tail call void @llvm.dbg.value(metadata !{double %107}, i64 0, metadata !134), !dbg !783
  %108 = fsub double %107, %106, !dbg !784
  %109 = fmul double %51, %108, !dbg !784
  store double %109, double* %82, align 8, !dbg !784, !tbaa !242
  %110 = fadd double %107, %106, !dbg !785
  %111 = fmul double %51, %110, !dbg !785
  store double %111, double* %89, align 8, !dbg !785, !tbaa !242
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 2, !dbg !760
  %112 = add nsw i32 %j.111, 2, !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !118), !dbg !760
  %113 = trunc i64 %indvars.iv.next26 to i32, !dbg !760
  %114 = icmp slt i32 %113, %52, !dbg !760
  br i1 %114, label %61, label %._crit_edge14, !dbg !760

._crit_edge14:                                    ; preds = %61, %0, %._crit_edge18
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !123), !dbg !786
  %115 = shl i32 %l, 3, !dbg !787
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !126), !dbg !787
  tail call void @llvm.dbg.value(metadata !{i32 %115}, i64 0, metadata !122), !dbg !788
  %116 = icmp slt i32 %115, %n, !dbg !788
  br i1 %116, label %.lr.ph9, label %._crit_edge10, !dbg !788

.lr.ph9:                                          ; preds = %._crit_edge14
  %117 = shl i32 %l, 3, !dbg !788
  %118 = sext i32 %117 to i64
  %119 = sext i32 %l to i64, !dbg !788
  %120 = sext i32 %l to i64, !dbg !788
  %121 = sext i32 %l to i64, !dbg !788
  %122 = mul i32 %l, 12, !dbg !788
  %123 = sext i32 %l to i64, !dbg !788
  %124 = sext i32 %l to i64, !dbg !788
  %125 = sext i32 %l to i64, !dbg !788
  br label %126, !dbg !788

; <label>:126                                     ; preds = %.lr.ph9, %._crit_edge5
  %indvars.iv21 = phi i32 [ %122, %.lr.ph9 ], [ %indvars.iv.next22, %._crit_edge5 ]
  %indvars.iv = phi i64 [ %118, %.lr.ph9 ], [ %indvars.iv.next, %._crit_edge5 ]
  %k.07 = phi i32 [ %115, %.lr.ph9 ], [ %295, %._crit_edge5 ]
  %k1.06 = phi i32 [ 2, %.lr.ph9 ], [ %phitmp, %._crit_edge5 ]
  tail call void @llvm.dbg.value(metadata !{i32 %k1.06}, i64 0, metadata !123), !dbg !790
  %127 = sext i32 %indvars.iv21 to i64
  %128 = shl nsw i32 %k1.06, 1, !dbg !792
  tail call void @llvm.dbg.value(metadata !{i32 %128}, i64 0, metadata !124), !dbg !792
  %129 = sext i32 %k1.06 to i64, !dbg !793
  %130 = getelementptr inbounds double* %w, i64 %129, !dbg !793
  %131 = load double* %130, align 8, !dbg !793, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %131}, i64 0, metadata !129), !dbg !793
  %132 = or i32 %k1.06, 1, !dbg !794
  %133 = sext i32 %132 to i64, !dbg !794
  %134 = getelementptr inbounds double* %w, i64 %133, !dbg !794
  %135 = load double* %134, align 8, !dbg !794, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !130), !dbg !794
  %136 = sext i32 %128 to i64, !dbg !795
  %137 = getelementptr inbounds double* %w, i64 %136, !dbg !795
  %138 = load double* %137, align 8, !dbg !795, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !127), !dbg !795
  %139 = or i32 %128, 1, !dbg !796
  %140 = sext i32 %139 to i64, !dbg !796
  %141 = getelementptr inbounds double* %w, i64 %140, !dbg !796
  %142 = load double* %141, align 8, !dbg !796, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %142}, i64 0, metadata !128), !dbg !796
  %143 = fmul double %135, 2.000000e+00, !dbg !797
  %144 = fmul double %143, %142, !dbg !797
  %145 = fsub double %138, %144, !dbg !797
  tail call void @llvm.dbg.value(metadata !{double %145}, i64 0, metadata !131), !dbg !797
  %146 = fmul double %143, %138, !dbg !798
  %147 = fsub double %146, %142, !dbg !798
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !132), !dbg !798
  tail call void @llvm.dbg.value(metadata !{i32 %k.07}, i64 0, metadata !118), !dbg !799
  %148 = add nsw i32 %k.07, %l, !dbg !799
  %149 = icmp sgt i32 %l, 0, !dbg !799
  br i1 %149, label %.lr.ph, label %._crit_edge, !dbg !799

.lr.ph:                                           ; preds = %126, %.lr.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.lr.ph ], [ %indvars.iv, %126 ]
  %j.21 = phi i32 [ %208, %.lr.ph ], [ %k.07, %126 ]
  %150 = add nsw i64 %indvars.iv19, %119, !dbg !801
  %151 = add nsw i64 %150, %120, !dbg !803
  %152 = add nsw i64 %151, %121, !dbg !804
  %153 = getelementptr inbounds double* %a, i64 %indvars.iv19, !dbg !805
  %154 = load double* %153, align 8, !dbg !805, !tbaa !242
  %155 = getelementptr inbounds double* %a, i64 %150, !dbg !805
  %156 = load double* %155, align 8, !dbg !805, !tbaa !242
  %157 = fadd double %154, %156, !dbg !805
  tail call void @llvm.dbg.value(metadata !{double %157}, i64 0, metadata !133), !dbg !805
  %158 = or i32 %j.21, 1, !dbg !806
  %159 = sext i32 %158 to i64, !dbg !806
  %160 = getelementptr inbounds double* %a, i64 %159, !dbg !806
  %161 = load double* %160, align 8, !dbg !806, !tbaa !242
  %162 = add nsw i64 %150, 1, !dbg !806
  %163 = getelementptr inbounds double* %a, i64 %162, !dbg !806
  %164 = load double* %163, align 8, !dbg !806, !tbaa !242
  %165 = fadd double %161, %164, !dbg !806
  tail call void @llvm.dbg.value(metadata !{double %165}, i64 0, metadata !134), !dbg !806
  %166 = fsub double %154, %156, !dbg !807
  tail call void @llvm.dbg.value(metadata !{double %166}, i64 0, metadata !135), !dbg !807
  %167 = fsub double %161, %164, !dbg !808
  tail call void @llvm.dbg.value(metadata !{double %167}, i64 0, metadata !136), !dbg !808
  %168 = getelementptr inbounds double* %a, i64 %151, !dbg !809
  %169 = load double* %168, align 8, !dbg !809, !tbaa !242
  %170 = getelementptr inbounds double* %a, i64 %152, !dbg !809
  %171 = load double* %170, align 8, !dbg !809, !tbaa !242
  %172 = fadd double %169, %171, !dbg !809
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !137), !dbg !809
  %173 = add nsw i64 %151, 1, !dbg !810
  %174 = getelementptr inbounds double* %a, i64 %173, !dbg !810
  %175 = load double* %174, align 8, !dbg !810, !tbaa !242
  %176 = add nsw i64 %152, 1, !dbg !810
  %177 = getelementptr inbounds double* %a, i64 %176, !dbg !810
  %178 = load double* %177, align 8, !dbg !810, !tbaa !242
  %179 = fadd double %175, %178, !dbg !810
  tail call void @llvm.dbg.value(metadata !{double %179}, i64 0, metadata !138), !dbg !810
  %180 = fsub double %169, %171, !dbg !811
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !139), !dbg !811
  %181 = fsub double %175, %178, !dbg !812
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !140), !dbg !812
  %182 = fadd double %157, %172, !dbg !813
  store double %182, double* %153, align 8, !dbg !813, !tbaa !242
  %183 = fadd double %165, %179, !dbg !814
  store double %183, double* %160, align 8, !dbg !814, !tbaa !242
  %184 = fsub double %157, %172, !dbg !815
  tail call void @llvm.dbg.value(metadata !{double %184}, i64 0, metadata !133), !dbg !815
  %185 = fsub double %165, %179, !dbg !816
  tail call void @llvm.dbg.value(metadata !{double %185}, i64 0, metadata !134), !dbg !816
  %186 = fmul double %131, %184, !dbg !817
  %187 = fmul double %135, %185, !dbg !817
  %188 = fsub double %186, %187, !dbg !817
  store double %188, double* %168, align 8, !dbg !817, !tbaa !242
  %189 = fmul double %131, %185, !dbg !818
  %190 = fmul double %135, %184, !dbg !818
  %191 = fadd double %190, %189, !dbg !818
  store double %191, double* %174, align 8, !dbg !818, !tbaa !242
  %192 = fsub double %166, %181, !dbg !819
  tail call void @llvm.dbg.value(metadata !{double %192}, i64 0, metadata !133), !dbg !819
  %193 = fadd double %167, %180, !dbg !820
  tail call void @llvm.dbg.value(metadata !{double %193}, i64 0, metadata !134), !dbg !820
  %194 = fmul double %138, %192, !dbg !821
  %195 = fmul double %142, %193, !dbg !821
  %196 = fsub double %194, %195, !dbg !821
  store double %196, double* %155, align 8, !dbg !821, !tbaa !242
  %197 = fmul double %138, %193, !dbg !822
  %198 = fmul double %142, %192, !dbg !822
  %199 = fadd double %197, %198, !dbg !822
  store double %199, double* %163, align 8, !dbg !822, !tbaa !242
  %200 = fadd double %166, %181, !dbg !823
  tail call void @llvm.dbg.value(metadata !{double %200}, i64 0, metadata !133), !dbg !823
  %201 = fsub double %167, %180, !dbg !824
  tail call void @llvm.dbg.value(metadata !{double %201}, i64 0, metadata !134), !dbg !824
  %202 = fmul double %145, %200, !dbg !825
  %203 = fmul double %147, %201, !dbg !825
  %204 = fsub double %202, %203, !dbg !825
  store double %204, double* %170, align 8, !dbg !825, !tbaa !242
  %205 = fmul double %145, %201, !dbg !826
  %206 = fmul double %147, %200, !dbg !826
  %207 = fadd double %205, %206, !dbg !826
  store double %207, double* %177, align 8, !dbg !826, !tbaa !242
  %208 = add nsw i32 %j.21, 2, !dbg !799
  tail call void @llvm.dbg.value(metadata !{i32 %208}, i64 0, metadata !118), !dbg !799
  %209 = icmp slt i32 %208, %148, !dbg !799
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 2, !dbg !799
  br i1 %209, label %.lr.ph, label %._crit_edge, !dbg !799

._crit_edge:                                      ; preds = %.lr.ph, %126
  %210 = or i32 %128, 2, !dbg !827
  %211 = sext i32 %210 to i64, !dbg !827
  %212 = getelementptr inbounds double* %w, i64 %211, !dbg !827
  %213 = load double* %212, align 8, !dbg !827, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !127), !dbg !827
  %214 = or i32 %128, 3, !dbg !828
  %215 = sext i32 %214 to i64, !dbg !828
  %216 = getelementptr inbounds double* %w, i64 %215, !dbg !828
  %217 = load double* %216, align 8, !dbg !828, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %217}, i64 0, metadata !128), !dbg !828
  %218 = fmul double %131, 2.000000e+00, !dbg !829
  %219 = fmul double %218, %217, !dbg !829
  %220 = fsub double %213, %219, !dbg !829
  tail call void @llvm.dbg.value(metadata !{double %220}, i64 0, metadata !131), !dbg !829
  %221 = fmul double %218, %213, !dbg !830
  %222 = fsub double %221, %217, !dbg !830
  tail call void @llvm.dbg.value(metadata !{double %222}, i64 0, metadata !132), !dbg !830
  %223 = add nsw i32 %k.07, %1, !dbg !831
  tail call void @llvm.dbg.value(metadata !{i32 %223}, i64 0, metadata !118), !dbg !831
  %224 = add nsw i32 %223, %l, !dbg !831
  %225 = icmp sgt i32 %l, 0, !dbg !831
  br i1 %225, label %.lr.ph4, label %._crit_edge5, !dbg !831

.lr.ph4:                                          ; preds = %._crit_edge
  %226 = fsub double -0.000000e+00, %135, !dbg !833
  br label %227, !dbg !831

; <label>:227                                     ; preds = %.lr.ph4, %227
  %indvars.iv23 = phi i64 [ %127, %.lr.ph4 ], [ %indvars.iv.next24, %227 ]
  %j.32 = phi i32 [ %223, %.lr.ph4 ], [ %293, %227 ]
  %228 = add nsw i64 %indvars.iv23, %123, !dbg !835
  %229 = add nsw i64 %228, %124, !dbg !836
  %230 = add nsw i64 %229, %125, !dbg !837
  %231 = getelementptr inbounds double* %a, i64 %indvars.iv23, !dbg !838
  %232 = getelementptr inbounds double* %a, i64 %228, !dbg !838
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !133), !dbg !838
  %233 = bitcast double* %231 to <2 x double>*, !dbg !838
  %234 = load <2 x double>* %233, align 8, !dbg !838, !tbaa !242
  %235 = add nsw i64 %228, 1, !dbg !839
  %236 = getelementptr inbounds double* %a, i64 %235, !dbg !839
  %237 = bitcast double* %232 to <2 x double>*, !dbg !838
  %238 = load <2 x double>* %237, align 8, !dbg !838, !tbaa !242
  %239 = fadd <2 x double> %234, %238, !dbg !838
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !134), !dbg !839
  %240 = extractelement <2 x double> %234, i32 0, !dbg !840
  %241 = extractelement <2 x double> %238, i32 0, !dbg !840
  %242 = fsub double %240, %241, !dbg !840
  tail call void @llvm.dbg.value(metadata !{double %242}, i64 0, metadata !135), !dbg !840
  %243 = extractelement <2 x double> %234, i32 1, !dbg !841
  %244 = extractelement <2 x double> %238, i32 1, !dbg !841
  %245 = fsub double %243, %244, !dbg !841
  tail call void @llvm.dbg.value(metadata !{double %245}, i64 0, metadata !136), !dbg !841
  %246 = getelementptr inbounds double* %a, i64 %229, !dbg !842
  %247 = load double* %246, align 8, !dbg !842, !tbaa !242
  %248 = getelementptr inbounds double* %a, i64 %230, !dbg !842
  %249 = load double* %248, align 8, !dbg !842, !tbaa !242
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !137), !dbg !842
  %250 = add nsw i64 %229, 1, !dbg !843
  %251 = getelementptr inbounds double* %a, i64 %250, !dbg !843
  %252 = load double* %251, align 8, !dbg !843, !tbaa !242
  %253 = add nsw i64 %230, 1, !dbg !843
  %254 = getelementptr inbounds double* %a, i64 %253, !dbg !843
  %255 = load double* %254, align 8, !dbg !843, !tbaa !242
  %256 = insertelement <2 x double> undef, double %247, i32 0, !dbg !842
  %257 = insertelement <2 x double> %256, double %252, i32 1, !dbg !842
  %258 = insertelement <2 x double> undef, double %249, i32 0, !dbg !842
  %259 = insertelement <2 x double> %258, double %255, i32 1, !dbg !842
  %260 = fadd <2 x double> %257, %259, !dbg !842
  tail call void @llvm.dbg.value(metadata !468, i64 0, metadata !138), !dbg !843
  %261 = fsub double %247, %249, !dbg !844
  tail call void @llvm.dbg.value(metadata !{double %261}, i64 0, metadata !139), !dbg !844
  %262 = fsub double %252, %255, !dbg !845
  tail call void @llvm.dbg.value(metadata !{double %262}, i64 0, metadata !140), !dbg !845
  %263 = fadd <2 x double> %239, %260, !dbg !846
  %264 = bitcast double* %231 to <2 x double>*, !dbg !846
  store <2 x double> %263, <2 x double>* %264, align 8, !dbg !846, !tbaa !242
  %265 = extractelement <2 x double> %239, i32 0, !dbg !847
  %266 = extractelement <2 x double> %260, i32 0, !dbg !847
  %267 = fsub double %265, %266, !dbg !847
  tail call void @llvm.dbg.value(metadata !{double %267}, i64 0, metadata !133), !dbg !847
  %268 = extractelement <2 x double> %239, i32 1, !dbg !848
  %269 = extractelement <2 x double> %260, i32 1, !dbg !848
  %270 = fsub double %268, %269, !dbg !848
  tail call void @llvm.dbg.value(metadata !{double %270}, i64 0, metadata !134), !dbg !848
  %271 = fmul double %267, %226, !dbg !833
  %272 = fmul double %131, %270, !dbg !833
  %273 = fsub double %271, %272, !dbg !833
  store double %273, double* %246, align 8, !dbg !833, !tbaa !242
  %274 = fmul double %270, %226, !dbg !849
  %275 = fmul double %131, %267, !dbg !849
  %276 = fadd double %275, %274, !dbg !849
  store double %276, double* %251, align 8, !dbg !849, !tbaa !242
  %277 = fsub double %242, %262, !dbg !850
  tail call void @llvm.dbg.value(metadata !{double %277}, i64 0, metadata !133), !dbg !850
  %278 = fadd double %245, %261, !dbg !851
  tail call void @llvm.dbg.value(metadata !{double %278}, i64 0, metadata !134), !dbg !851
  %279 = fmul double %213, %277, !dbg !852
  %280 = fmul double %217, %278, !dbg !852
  %281 = fsub double %279, %280, !dbg !852
  store double %281, double* %232, align 8, !dbg !852, !tbaa !242
  %282 = fmul double %213, %278, !dbg !853
  %283 = fmul double %217, %277, !dbg !853
  %284 = fadd double %282, %283, !dbg !853
  store double %284, double* %236, align 8, !dbg !853, !tbaa !242
  %285 = fadd double %242, %262, !dbg !854
  tail call void @llvm.dbg.value(metadata !{double %285}, i64 0, metadata !133), !dbg !854
  %286 = fsub double %245, %261, !dbg !855
  tail call void @llvm.dbg.value(metadata !{double %286}, i64 0, metadata !134), !dbg !855
  %287 = fmul double %220, %285, !dbg !856
  %288 = fmul double %222, %286, !dbg !856
  %289 = fsub double %287, %288, !dbg !856
  store double %289, double* %248, align 8, !dbg !856, !tbaa !242
  %290 = fmul double %220, %286, !dbg !857
  %291 = fmul double %222, %285, !dbg !857
  %292 = fadd double %290, %291, !dbg !857
  store double %292, double* %254, align 8, !dbg !857, !tbaa !242
  %293 = add nsw i32 %j.32, 2, !dbg !831
  tail call void @llvm.dbg.value(metadata !{i32 %293}, i64 0, metadata !118), !dbg !831
  %294 = icmp slt i32 %293, %224, !dbg !831
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 2, !dbg !831
  br i1 %294, label %227, label %._crit_edge5, !dbg !831

._crit_edge5:                                     ; preds = %227, %._crit_edge
  %295 = add nsw i32 %k.07, %115, !dbg !788
  tail call void @llvm.dbg.value(metadata !{i32 %295}, i64 0, metadata !122), !dbg !788
  %phitmp = add i32 %k1.06, 2, !dbg !788
  %296 = icmp slt i32 %295, %n, !dbg !788
  %indvars.iv.next = add nsw i64 %indvars.iv, %118, !dbg !788
  %indvars.iv.next22 = add i32 %indvars.iv21, %117, !dbg !788
  br i1 %296, label %126, label %._crit_edge10, !dbg !788

._crit_edge10:                                    ; preds = %._crit_edge5, %._crit_edge14
  ret void, !dbg !858
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!213, !214}
!llvm.ident = !{!215}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c] [DW_LANG_C99]
!1 = metadata !{metadata !"oourafft.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !34, metadata !43, metadata !55, metadata !69, metadata !78, metadata !90, metadata !110, metadata !141, metadata !163, metadata !181, metadata !197}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 27, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !9, i32 28} ; [ DW_TAG_subprogram ] [line 27] [def] [scope 28] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10, metadata !11, metadata !12, metadata !14, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !28, metadata !31, metadata !32, metadata !33}
!10 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 29]
!11 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 29, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 29]
!12 = metadata !{i32 786688, metadata !4, metadata !"ip", metadata !5, i32 30, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip] [line 30]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!14 = metadata !{i32 786688, metadata !4, metadata !"ref", metadata !5, i32 31, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ref] [line 31]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!16 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!17 = metadata !{i32 786688, metadata !4, metadata !"cmp", metadata !5, i32 31, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cmp] [line 31]
!18 = metadata !{i32 786688, metadata !4, metadata !"src", metadata !5, i32 31, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 31]
!19 = metadata !{i32 786688, metadata !4, metadata !"w", metadata !5, i32 31, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 31]
!20 = metadata !{i32 786688, metadata !4, metadata !"t_start", metadata !5, i32 32, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_start] [line 32]
!21 = metadata !{i32 786688, metadata !4, metadata !"t_end", metadata !5, i32 32, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_end] [line 32]
!22 = metadata !{i32 786688, metadata !4, metadata !"t_overhead", metadata !5, i32 32, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_overhead] [line 32]
!23 = metadata !{i32 786688, metadata !4, metadata !"t_total", metadata !5, i32 32, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_total] [line 32]
!24 = metadata !{i32 786688, metadata !4, metadata !"err_val", metadata !5, i32 32, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err_val] [line 32]
!25 = metadata !{i32 786688, metadata !26, metadata !"k", metadata !5, i32 83, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 83]
!26 = metadata !{i32 786443, metadata !1, metadata !27, i32 82, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!27 = metadata !{i32 786443, metadata !1, metadata !4, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!28 = metadata !{i32 786688, metadata !29, metadata !"re1", metadata !5, i32 89, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [re1] [line 89]
!29 = metadata !{i32 786443, metadata !1, metadata !30, i32 88, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!30 = metadata !{i32 786443, metadata !1, metadata !26, i32 88, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!31 = metadata !{i32 786688, metadata !29, metadata !"re2", metadata !5, i32 90, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [re2] [line 90]
!32 = metadata !{i32 786688, metadata !29, metadata !"im1", metadata !5, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [im1] [line 91]
!33 = metadata !{i32 786688, metadata !29, metadata !"im2", metadata !5, i32 92, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [im2] [line 92]
!34 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"putdata", metadata !"putdata", metadata !"", i32 119, metadata !35, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double*)* @putdata, null, null, metadata !37, i32 120} ; [ DW_TAG_subprogram ] [line 119] [def] [scope 120] [putdata]
!35 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !36, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = metadata !{null, metadata !8, metadata !8, metadata !15}
!37 = metadata !{metadata !38, metadata !39, metadata !40, metadata !41, metadata !42}
!38 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!39 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!40 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 119]
!41 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 121]
!42 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"errorcheck", metadata !"errorcheck", metadata !"", i32 127, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, double, double*)* @errorcheck, null, null, metadata !46, i32 128} ; [ DW_TAG_subprogram ] [line 127] [def] [scope 128] [errorcheck]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !16, metadata !8, metadata !8, metadata !16, metadata !15}
!46 = metadata !{metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54}
!47 = metadata !{i32 786689, metadata !43, metadata !"nini", metadata !5, i32 16777343, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nini] [line 127]
!48 = metadata !{i32 786689, metadata !43, metadata !"nend", metadata !5, i32 33554559, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nend] [line 127]
!49 = metadata !{i32 786689, metadata !43, metadata !"scale", metadata !5, i32 50331775, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [scale] [line 127]
!50 = metadata !{i32 786689, metadata !43, metadata !"a", metadata !5, i32 67108991, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 127]
!51 = metadata !{i32 786688, metadata !43, metadata !"j", metadata !5, i32 129, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 129]
!52 = metadata !{i32 786688, metadata !43, metadata !"seed", metadata !5, i32 129, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [seed] [line 129]
!53 = metadata !{i32 786688, metadata !43, metadata !"err", metadata !5, i32 130, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 130]
!54 = metadata !{i32 786688, metadata !43, metadata !"e", metadata !5, i32 130, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [e] [line 130]
!55 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_time", metadata !"get_time", metadata !"", i32 156, metadata !56, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double ()* @get_time, null, null, metadata !58, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [get_time]
!56 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !57, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!57 = metadata !{metadata !16}
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786688, metadata !55, metadata !"tv", metadata !5, i32 158, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 158]
!60 = metadata !{i32 786451, metadata !61, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !62, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!61 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!62 = metadata !{metadata !63, metadata !67}
!63 = metadata !{i32 786445, metadata !61, metadata !60, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !64} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!64 = metadata !{i32 786454, metadata !65, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!65 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!66 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!67 = metadata !{i32 786445, metadata !61, metadata !60, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !68} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!68 = metadata !{i32 786454, metadata !65, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !66} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!69 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cdft", metadata !"cdft", metadata !"", i32 174, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double*, i32*, double*)* @cdft, null, null, metadata !72, i32 175} ; [ DW_TAG_subprogram ] [line 174] [def] [scope 175] [cdft]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{null, metadata !8, metadata !8, metadata !15, metadata !13, metadata !15}
!72 = metadata !{metadata !73, metadata !74, metadata !75, metadata !76, metadata !77}
!73 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 174]
!74 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!75 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 174]
!76 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!77 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 174]
!78 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"makewt", metadata !"makewt", metadata !"", i32 193, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32*, double*)* @makewt, null, null, metadata !81, i32 194} ; [ DW_TAG_subprogram ] [line 193] [def] [scope 194] [makewt]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{null, metadata !8, metadata !13, metadata !15}
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !87, metadata !88, metadata !89}
!82 = metadata !{i32 786689, metadata !78, metadata !"nw", metadata !5, i32 16777409, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nw] [line 193]
!83 = metadata !{i32 786689, metadata !78, metadata !"ip", metadata !5, i32 33554625, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ip] [line 193]
!84 = metadata !{i32 786689, metadata !78, metadata !"w", metadata !5, i32 50331841, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 193]
!85 = metadata !{i32 786688, metadata !78, metadata !"j", metadata !5, i32 195, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 195]
!86 = metadata !{i32 786688, metadata !78, metadata !"nwh", metadata !5, i32 195, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nwh] [line 195]
!87 = metadata !{i32 786688, metadata !78, metadata !"delta", metadata !5, i32 196, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [delta] [line 196]
!88 = metadata !{i32 786688, metadata !78, metadata !"x", metadata !5, i32 196, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 196]
!89 = metadata !{i32 786688, metadata !78, metadata !"y", metadata !5, i32 196, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 196]
!90 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cftbsub", metadata !"cftbsub", metadata !"", i32 480, metadata !91, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @cftbsub, null, null, metadata !93, i32 481} ; [ DW_TAG_subprogram ] [line 480] [local] [def] [scope 481] [cftbsub]
!91 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{null, metadata !8, metadata !15, metadata !15}
!93 = metadata !{metadata !94, metadata !95, metadata !96, metadata !97, metadata !98, metadata !99, metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !109}
!94 = metadata !{i32 786689, metadata !90, metadata !"n", metadata !5, i32 16777696, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 480]
!95 = metadata !{i32 786689, metadata !90, metadata !"a", metadata !5, i32 33554912, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 480]
!96 = metadata !{i32 786689, metadata !90, metadata !"w", metadata !5, i32 50332128, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 480]
!97 = metadata !{i32 786688, metadata !90, metadata !"j", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 482]
!98 = metadata !{i32 786688, metadata !90, metadata !"j1", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 482]
!99 = metadata !{i32 786688, metadata !90, metadata !"j2", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j2] [line 482]
!100 = metadata !{i32 786688, metadata !90, metadata !"j3", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j3] [line 482]
!101 = metadata !{i32 786688, metadata !90, metadata !"l", metadata !5, i32 482, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 482]
!102 = metadata !{i32 786688, metadata !90, metadata !"x0r", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0r] [line 483]
!103 = metadata !{i32 786688, metadata !90, metadata !"x0i", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0i] [line 483]
!104 = metadata !{i32 786688, metadata !90, metadata !"x1r", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1r] [line 483]
!105 = metadata !{i32 786688, metadata !90, metadata !"x1i", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1i] [line 483]
!106 = metadata !{i32 786688, metadata !90, metadata !"x2r", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2r] [line 483]
!107 = metadata !{i32 786688, metadata !90, metadata !"x2i", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2i] [line 483]
!108 = metadata !{i32 786688, metadata !90, metadata !"x3r", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3r] [line 483]
!109 = metadata !{i32 786688, metadata !90, metadata !"x3i", metadata !5, i32 483, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3i] [line 483]
!110 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cftmdl", metadata !"cftmdl", metadata !"", i32 635, metadata !111, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, double*, double*)* @cftmdl, null, null, metadata !113, i32 636} ; [ DW_TAG_subprogram ] [line 635] [local] [def] [scope 636] [cftmdl]
!111 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !112, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = metadata !{null, metadata !8, metadata !8, metadata !15, metadata !15}
!113 = metadata !{metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119, metadata !120, metadata !121, metadata !122, metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !137, metadata !138, metadata !139, metadata !140}
!114 = metadata !{i32 786689, metadata !110, metadata !"n", metadata !5, i32 16777851, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 635]
!115 = metadata !{i32 786689, metadata !110, metadata !"l", metadata !5, i32 33555067, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 635]
!116 = metadata !{i32 786689, metadata !110, metadata !"a", metadata !5, i32 50332283, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 635]
!117 = metadata !{i32 786689, metadata !110, metadata !"w", metadata !5, i32 67109499, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 635]
!118 = metadata !{i32 786688, metadata !110, metadata !"j", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 637]
!119 = metadata !{i32 786688, metadata !110, metadata !"j1", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 637]
!120 = metadata !{i32 786688, metadata !110, metadata !"j2", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j2] [line 637]
!121 = metadata !{i32 786688, metadata !110, metadata !"j3", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j3] [line 637]
!122 = metadata !{i32 786688, metadata !110, metadata !"k", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 637]
!123 = metadata !{i32 786688, metadata !110, metadata !"k1", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 637]
!124 = metadata !{i32 786688, metadata !110, metadata !"k2", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k2] [line 637]
!125 = metadata !{i32 786688, metadata !110, metadata !"m", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 637]
!126 = metadata !{i32 786688, metadata !110, metadata !"m2", metadata !5, i32 637, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 637]
!127 = metadata !{i32 786688, metadata !110, metadata !"wk1r", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk1r] [line 638]
!128 = metadata !{i32 786688, metadata !110, metadata !"wk1i", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk1i] [line 638]
!129 = metadata !{i32 786688, metadata !110, metadata !"wk2r", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk2r] [line 638]
!130 = metadata !{i32 786688, metadata !110, metadata !"wk2i", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk2i] [line 638]
!131 = metadata !{i32 786688, metadata !110, metadata !"wk3r", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk3r] [line 638]
!132 = metadata !{i32 786688, metadata !110, metadata !"wk3i", metadata !5, i32 638, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk3i] [line 638]
!133 = metadata !{i32 786688, metadata !110, metadata !"x0r", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0r] [line 639]
!134 = metadata !{i32 786688, metadata !110, metadata !"x0i", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0i] [line 639]
!135 = metadata !{i32 786688, metadata !110, metadata !"x1r", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1r] [line 639]
!136 = metadata !{i32 786688, metadata !110, metadata !"x1i", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1i] [line 639]
!137 = metadata !{i32 786688, metadata !110, metadata !"x2r", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2r] [line 639]
!138 = metadata !{i32 786688, metadata !110, metadata !"x2i", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2i] [line 639]
!139 = metadata !{i32 786688, metadata !110, metadata !"x3r", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3r] [line 639]
!140 = metadata !{i32 786688, metadata !110, metadata !"x3i", metadata !5, i32 639, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3i] [line 639]
!141 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cft1st", metadata !"cft1st", metadata !"", i32 530, metadata !91, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @cft1st, null, null, metadata !142, i32 531} ; [ DW_TAG_subprogram ] [line 530] [local] [def] [scope 531] [cft1st]
!142 = metadata !{metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159, metadata !160, metadata !161, metadata !162}
!143 = metadata !{i32 786689, metadata !141, metadata !"n", metadata !5, i32 16777746, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 530]
!144 = metadata !{i32 786689, metadata !141, metadata !"a", metadata !5, i32 33554962, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 530]
!145 = metadata !{i32 786689, metadata !141, metadata !"w", metadata !5, i32 50332178, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 530]
!146 = metadata !{i32 786688, metadata !141, metadata !"j", metadata !5, i32 532, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 532]
!147 = metadata !{i32 786688, metadata !141, metadata !"k1", metadata !5, i32 532, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 532]
!148 = metadata !{i32 786688, metadata !141, metadata !"k2", metadata !5, i32 532, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k2] [line 532]
!149 = metadata !{i32 786688, metadata !141, metadata !"wk1r", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk1r] [line 533]
!150 = metadata !{i32 786688, metadata !141, metadata !"wk1i", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk1i] [line 533]
!151 = metadata !{i32 786688, metadata !141, metadata !"wk2r", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk2r] [line 533]
!152 = metadata !{i32 786688, metadata !141, metadata !"wk2i", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk2i] [line 533]
!153 = metadata !{i32 786688, metadata !141, metadata !"wk3r", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk3r] [line 533]
!154 = metadata !{i32 786688, metadata !141, metadata !"wk3i", metadata !5, i32 533, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wk3i] [line 533]
!155 = metadata !{i32 786688, metadata !141, metadata !"x0r", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0r] [line 534]
!156 = metadata !{i32 786688, metadata !141, metadata !"x0i", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0i] [line 534]
!157 = metadata !{i32 786688, metadata !141, metadata !"x1r", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1r] [line 534]
!158 = metadata !{i32 786688, metadata !141, metadata !"x1i", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1i] [line 534]
!159 = metadata !{i32 786688, metadata !141, metadata !"x2r", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2r] [line 534]
!160 = metadata !{i32 786688, metadata !141, metadata !"x2i", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2i] [line 534]
!161 = metadata !{i32 786688, metadata !141, metadata !"x3r", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3r] [line 534]
!162 = metadata !{i32 786688, metadata !141, metadata !"x3i", metadata !5, i32 534, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3i] [line 534]
!163 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cftfsub", metadata !"cftfsub", metadata !"", i32 430, metadata !91, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, double*, double*)* @cftfsub, null, null, metadata !164, i32 431} ; [ DW_TAG_subprogram ] [line 430] [local] [def] [scope 431] [cftfsub]
!164 = metadata !{metadata !165, metadata !166, metadata !167, metadata !168, metadata !169, metadata !170, metadata !171, metadata !172, metadata !173, metadata !174, metadata !175, metadata !176, metadata !177, metadata !178, metadata !179, metadata !180}
!165 = metadata !{i32 786689, metadata !163, metadata !"n", metadata !5, i32 16777646, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 430]
!166 = metadata !{i32 786689, metadata !163, metadata !"a", metadata !5, i32 33554862, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 430]
!167 = metadata !{i32 786689, metadata !163, metadata !"w", metadata !5, i32 50332078, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 430]
!168 = metadata !{i32 786688, metadata !163, metadata !"j", metadata !5, i32 432, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 432]
!169 = metadata !{i32 786688, metadata !163, metadata !"j1", metadata !5, i32 432, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 432]
!170 = metadata !{i32 786688, metadata !163, metadata !"j2", metadata !5, i32 432, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j2] [line 432]
!171 = metadata !{i32 786688, metadata !163, metadata !"j3", metadata !5, i32 432, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j3] [line 432]
!172 = metadata !{i32 786688, metadata !163, metadata !"l", metadata !5, i32 432, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 432]
!173 = metadata !{i32 786688, metadata !163, metadata !"x0r", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0r] [line 433]
!174 = metadata !{i32 786688, metadata !163, metadata !"x0i", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0i] [line 433]
!175 = metadata !{i32 786688, metadata !163, metadata !"x1r", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1r] [line 433]
!176 = metadata !{i32 786688, metadata !163, metadata !"x1i", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x1i] [line 433]
!177 = metadata !{i32 786688, metadata !163, metadata !"x2r", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2r] [line 433]
!178 = metadata !{i32 786688, metadata !163, metadata !"x2i", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x2i] [line 433]
!179 = metadata !{i32 786688, metadata !163, metadata !"x3r", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3r] [line 433]
!180 = metadata !{i32 786688, metadata !163, metadata !"x3i", metadata !5, i32 433, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x3i] [line 433]
!181 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bitrv2conj", metadata !"bitrv2conj", metadata !"", i32 321, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32*, double*)* @bitrv2conj, null, null, metadata !182, i32 322} ; [ DW_TAG_subprogram ] [line 321] [local] [def] [scope 322] [bitrv2conj]
!182 = metadata !{metadata !183, metadata !184, metadata !185, metadata !186, metadata !187, metadata !188, metadata !189, metadata !190, metadata !191, metadata !192, metadata !193, metadata !194, metadata !195, metadata !196}
!183 = metadata !{i32 786689, metadata !181, metadata !"n", metadata !5, i32 16777537, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 321]
!184 = metadata !{i32 786689, metadata !181, metadata !"ip", metadata !5, i32 33554753, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ip] [line 321]
!185 = metadata !{i32 786689, metadata !181, metadata !"a", metadata !5, i32 50331969, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 321]
!186 = metadata !{i32 786688, metadata !181, metadata !"j", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 323]
!187 = metadata !{i32 786688, metadata !181, metadata !"j1", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 323]
!188 = metadata !{i32 786688, metadata !181, metadata !"k", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 323]
!189 = metadata !{i32 786688, metadata !181, metadata !"k1", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 323]
!190 = metadata !{i32 786688, metadata !181, metadata !"l", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 323]
!191 = metadata !{i32 786688, metadata !181, metadata !"m", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 323]
!192 = metadata !{i32 786688, metadata !181, metadata !"m2", metadata !5, i32 323, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 323]
!193 = metadata !{i32 786688, metadata !181, metadata !"xr", metadata !5, i32 324, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xr] [line 324]
!194 = metadata !{i32 786688, metadata !181, metadata !"xi", metadata !5, i32 324, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xi] [line 324]
!195 = metadata !{i32 786688, metadata !181, metadata !"yr", metadata !5, i32 324, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yr] [line 324]
!196 = metadata !{i32 786688, metadata !181, metadata !"yi", metadata !5, i32 324, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yi] [line 324]
!197 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bitrv2", metadata !"bitrv2", metadata !"", i32 221, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32*, double*)* @bitrv2, null, null, metadata !198, i32 222} ; [ DW_TAG_subprogram ] [line 221] [local] [def] [scope 222] [bitrv2]
!198 = metadata !{metadata !199, metadata !200, metadata !201, metadata !202, metadata !203, metadata !204, metadata !205, metadata !206, metadata !207, metadata !208, metadata !209, metadata !210, metadata !211, metadata !212}
!199 = metadata !{i32 786689, metadata !197, metadata !"n", metadata !5, i32 16777437, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 221]
!200 = metadata !{i32 786689, metadata !197, metadata !"ip", metadata !5, i32 33554653, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ip] [line 221]
!201 = metadata !{i32 786689, metadata !197, metadata !"a", metadata !5, i32 50331869, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 221]
!202 = metadata !{i32 786688, metadata !197, metadata !"j", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 223]
!203 = metadata !{i32 786688, metadata !197, metadata !"j1", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j1] [line 223]
!204 = metadata !{i32 786688, metadata !197, metadata !"k", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 223]
!205 = metadata !{i32 786688, metadata !197, metadata !"k1", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 223]
!206 = metadata !{i32 786688, metadata !197, metadata !"l", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 223]
!207 = metadata !{i32 786688, metadata !197, metadata !"m", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 223]
!208 = metadata !{i32 786688, metadata !197, metadata !"m2", metadata !5, i32 223, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m2] [line 223]
!209 = metadata !{i32 786688, metadata !197, metadata !"xr", metadata !5, i32 224, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xr] [line 224]
!210 = metadata !{i32 786688, metadata !197, metadata !"xi", metadata !5, i32 224, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xi] [line 224]
!211 = metadata !{i32 786688, metadata !197, metadata !"yr", metadata !5, i32 224, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yr] [line 224]
!212 = metadata !{i32 786688, metadata !197, metadata !"yi", metadata !5, i32 224, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yi] [line 224]
!213 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!214 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!215 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!216 = metadata !{double 0.000000e+00}
!217 = metadata !{i32 32, i32 0, metadata !4, null}
!218 = metadata !{i32 35, i32 0, metadata !4, null}
!219 = metadata !{i32 36, i32 0, metadata !4, null}
!220 = metadata !{i32 41, i32 0, metadata !4, null}
!221 = metadata !{i32 42, i32 0, metadata !4, null}
!222 = metadata !{i32 47, i32 0, metadata !4, null}
!223 = metadata !{i32 51, i32 0, metadata !4, null}
!224 = metadata !{i32 52, i32 0, metadata !4, null}
!225 = metadata !{i32 53, i32 0, metadata !4, null}
!226 = metadata !{i32 61, i32 0, metadata !4, null}
!227 = metadata !{i32 62, i32 0, metadata !4, null}
!228 = metadata !{i32 63, i32 0, metadata !4, null}
!229 = metadata !{i32 64, i32 0, metadata !4, null}
!230 = metadata !{i32 65, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !1, metadata !4, i32 65, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!232 = metadata !{i32 66, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !1, metadata !231, i32 65, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!234 = metadata !{i32 67, i32 0, metadata !233, null}
!235 = metadata !{i32 71, i32 0, metadata !4, null}
!236 = metadata !{i32 72, i32 0, metadata !4, null}
!237 = metadata !{i32 73, i32 0, metadata !4, null}
!238 = metadata !{i32 0}
!239 = metadata !{i32 74, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !1, metadata !4, i32 74, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!241 = metadata !{i32 75, i32 0, metadata !240, null}
!242 = metadata !{metadata !243, metadata !243, i64 0}
!243 = metadata !{metadata !"double", metadata !244, i64 0}
!244 = metadata !{metadata !"omnipotent char", metadata !245, i64 0}
!245 = metadata !{metadata !"Simple C/C++ TBAA"}
!246 = metadata !{i32 78, i32 0, metadata !4, null}
!247 = metadata !{i32 79, i32 0, metadata !4, null}
!248 = metadata !{i32 81, i32 0, metadata !4, null}
!249 = metadata !{i32 82, i32 0, metadata !27, null}
!250 = metadata !{i32 85, i32 0, metadata !26, null}
!251 = metadata !{i32 86, i32 0, metadata !26, null}
!252 = metadata !{i32 88, i32 0, metadata !30, null}
!253 = metadata !{i32 89, i32 0, metadata !29, null}
!254 = metadata !{i32 90, i32 0, metadata !29, null}
!255 = metadata !{i32 91, i32 0, metadata !29, null}
!256 = metadata !{i32 92, i32 0, metadata !29, null}
!257 = metadata !{i32 93, i32 0, metadata !29, null}
!258 = metadata !{i32 94, i32 0, metadata !29, null}
!259 = metadata !{i32 97, i32 0, metadata !26, null}
!260 = metadata !{i32 99, i32 0, metadata !4, null}
!261 = metadata !{i32 102, i32 0, metadata !262, null}
!262 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!263 = metadata !{i32 104, i32 0, metadata !264, null}
!264 = metadata !{i32 786443, metadata !1, metadata !262, i32 102, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!265 = metadata !{i32 105, i32 0, metadata !264, null}
!266 = metadata !{i32 103, i32 0, metadata !264, null}
!267 = metadata !{i32 109, i32 0, metadata !4, null}
!268 = metadata !{i32 110, i32 0, metadata !4, null}
!269 = metadata !{i32 111, i32 0, metadata !4, null}
!270 = metadata !{i32 113, i32 0, metadata !4, null}
!271 = metadata !{i32 114, i32 0, metadata !4, null}
!272 = metadata !{i32 116, i32 0, metadata !4, null}
!273 = metadata !{i32 158, i32 0, metadata !55, null}
!274 = metadata !{i32 160, i32 0, metadata !55, null}
!275 = metadata !{i32 161, i32 0, metadata !55, null}
!276 = metadata !{metadata !277, metadata !278, i64 0}
!277 = metadata !{metadata !"timeval", metadata !278, i64 0, metadata !278, i64 8}
!278 = metadata !{metadata !"long", metadata !244, i64 0}
!279 = metadata !{metadata !277, metadata !278, i64 8}
!280 = metadata !{i32 193, i32 0, metadata !78, null}
!281 = metadata !{i32 198, i32 0, metadata !282, null}
!282 = metadata !{i32 786443, metadata !1, metadata !78, i32 198, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!283 = metadata !{i32 199, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !282, i32 198, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!285 = metadata !{i32 200, i32 0, metadata !284, null}
!286 = metadata !{i32 201, i32 0, metadata !284, null}
!287 = metadata !{i32 202, i32 0, metadata !284, null}
!288 = metadata !{i32 203, i32 0, metadata !284, null}
!289 = metadata !{i32 204, i32 0, metadata !284, null}
!290 = metadata !{i32 205, i32 0, metadata !291, null}
!291 = metadata !{i32 786443, metadata !1, metadata !284, i32 205, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!292 = metadata !{i32 207, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !294, i32 206, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!294 = metadata !{i32 786443, metadata !1, metadata !295, i32 206, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!295 = metadata !{i32 786443, metadata !1, metadata !291, i32 205, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!296 = metadata !{i32 208, i32 0, metadata !293, null}
!297 = metadata !{i32 209, i32 0, metadata !293, null}
!298 = metadata !{i32 210, i32 0, metadata !293, null}
!299 = metadata !{i32 211, i32 0, metadata !293, null}
!300 = metadata !{i32 212, i32 0, metadata !293, null}
!301 = metadata !{i32 206, i32 0, metadata !294, null}
!302 = metadata !{i32 214, i32 0, metadata !295, null}
!303 = metadata !{i32 215, i32 0, metadata !295, null}
!304 = metadata !{i32 217, i32 0, metadata !78, null}
!305 = metadata !{i32 119, i32 0, metadata !34, null}
!306 = metadata !{i32 121, i32 0, metadata !34, null}
!307 = metadata !{i32 123, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !34, i32 123, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!309 = metadata !{i32 124, i32 0, metadata !308, null}
!310 = metadata !{i32 125, i32 0, metadata !34, null}
!311 = metadata !{i32 174, i32 0, metadata !69, null}
!312 = metadata !{i32 176, i32 0, metadata !313, null}
!313 = metadata !{i32 786443, metadata !1, metadata !69, i32 176, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!314 = metadata !{i32 177, i32 0, metadata !315, null}
!315 = metadata !{i32 786443, metadata !1, metadata !316, i32 177, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!316 = metadata !{i32 786443, metadata !1, metadata !313, i32 176, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!317 = metadata !{i32 178, i32 0, metadata !318, null}
!318 = metadata !{i32 786443, metadata !1, metadata !315, i32 177, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!319 = metadata !{i32 179, i32 0, metadata !318, null}
!320 = metadata !{i32 180, i32 0, metadata !318, null}
!321 = metadata !{i32 181, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !315, i32 180, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!323 = metadata !{i32 182, i32 0, metadata !322, null}
!324 = metadata !{i32 184, i32 0, metadata !325, null}
!325 = metadata !{i32 786443, metadata !1, metadata !313, i32 184, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!326 = metadata !{i32 185, i32 0, metadata !327, null}
!327 = metadata !{i32 786443, metadata !1, metadata !325, i32 184, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!328 = metadata !{i32 186, i32 0, metadata !327, null}
!329 = metadata !{i32 187, i32 0, metadata !69, null}
!330 = metadata !{i32 127, i32 0, metadata !43, null}
!331 = metadata !{i32 129, i32 0, metadata !43, null}
!332 = metadata !{i32 130, i32 0, metadata !43, null}
!333 = metadata !{i32 132, i32 0, metadata !334, null}
!334 = metadata !{i32 786443, metadata !1, metadata !43, i32 132, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!335 = metadata !{i32 133, i32 0, metadata !336, null}
!336 = metadata !{i32 786443, metadata !1, metadata !334, i32 132, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!337 = metadata !{i32 134, i32 0, metadata !336, null}
!338 = metadata !{i32 136, i32 0, metadata !43, null}
!339 = metadata !{i32 221, i32 0, metadata !197, null}
!340 = metadata !{i32 226, i32 0, metadata !197, null}
!341 = metadata !{metadata !342, metadata !342, i64 0}
!342 = metadata !{metadata !"int", metadata !244, i64 0}
!343 = metadata !{i32 227, i32 0, metadata !197, null}
!344 = metadata !{i32 1}
!345 = metadata !{i32 228, i32 0, metadata !197, null}
!346 = metadata !{i32 229, i32 0, metadata !197, null}
!347 = metadata !{i32 230, i32 0, metadata !348, null}
!348 = metadata !{i32 786443, metadata !1, metadata !197, i32 229, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!349 = metadata !{i32 231, i32 0, metadata !350, null}
!350 = metadata !{i32 786443, metadata !1, metadata !348, i32 231, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!351 = metadata !{i32 232, i32 0, metadata !352, null}
!352 = metadata !{i32 786443, metadata !1, metadata !350, i32 231, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!353 = metadata !{i32 234, i32 0, metadata !348, null}
!354 = metadata !{i32 236, i32 0, metadata !197, null}
!355 = metadata !{i32 237, i32 0, metadata !356, null}
!356 = metadata !{i32 786443, metadata !1, metadata !197, i32 237, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!357 = metadata !{i32 293, i32 0, metadata !358, null}
!358 = metadata !{i32 786443, metadata !1, metadata !359, i32 293, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!359 = metadata !{i32 786443, metadata !1, metadata !356, i32 292, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!360 = metadata !{i32 238, i32 0, metadata !361, null}
!361 = metadata !{i32 786443, metadata !1, metadata !362, i32 238, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!362 = metadata !{i32 786443, metadata !1, metadata !356, i32 237, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!363 = metadata !{i32 251, i32 0, metadata !364, null}
!364 = metadata !{i32 786443, metadata !1, metadata !365, i32 239, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!365 = metadata !{i32 786443, metadata !1, metadata !366, i32 239, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!366 = metadata !{i32 786443, metadata !1, metadata !361, i32 238, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!367 = metadata !{i32 239, i32 0, metadata !365, null}
!368 = metadata !{i32 240, i32 0, metadata !364, null}
!369 = metadata !{i32 241, i32 0, metadata !364, null}
!370 = metadata !{i32 242, i32 0, metadata !364, null}
!371 = metadata !{i32 243, i32 0, metadata !364, null}
!372 = metadata !{i32 244, i32 0, metadata !364, null}
!373 = metadata !{i32 245, i32 0, metadata !364, null}
!374 = metadata !{i32 246, i32 0, metadata !364, null}
!375 = metadata !{i32 247, i32 0, metadata !364, null}
!376 = metadata !{i32 248, i32 0, metadata !364, null}
!377 = metadata !{i32 249, i32 0, metadata !364, null}
!378 = metadata !{i32 250, i32 0, metadata !364, null}
!379 = metadata !{i32 252, i32 0, metadata !364, null}
!380 = metadata !{i32 253, i32 0, metadata !364, null}
!381 = metadata !{i32 254, i32 0, metadata !364, null}
!382 = metadata !{i32 255, i32 0, metadata !364, null}
!383 = metadata !{i32 256, i32 0, metadata !364, null}
!384 = metadata !{i32 257, i32 0, metadata !364, null}
!385 = metadata !{i32 258, i32 0, metadata !364, null}
!386 = metadata !{i32 259, i32 0, metadata !364, null}
!387 = metadata !{i32 260, i32 0, metadata !364, null}
!388 = metadata !{i32 261, i32 0, metadata !364, null}
!389 = metadata !{i32 262, i32 0, metadata !364, null}
!390 = metadata !{i32 263, i32 0, metadata !364, null}
!391 = metadata !{i32 264, i32 0, metadata !364, null}
!392 = metadata !{i32 265, i32 0, metadata !364, null}
!393 = metadata !{i32 266, i32 0, metadata !364, null}
!394 = metadata !{i32 267, i32 0, metadata !364, null}
!395 = metadata !{i32 268, i32 0, metadata !364, null}
!396 = metadata !{i32 269, i32 0, metadata !364, null}
!397 = metadata !{i32 270, i32 0, metadata !364, null}
!398 = metadata !{i32 271, i32 0, metadata !364, null}
!399 = metadata !{i32 272, i32 0, metadata !364, null}
!400 = metadata !{i32 273, i32 0, metadata !364, null}
!401 = metadata !{i32 274, i32 0, metadata !364, null}
!402 = metadata !{i32 275, i32 0, metadata !364, null}
!403 = metadata !{i32 276, i32 0, metadata !364, null}
!404 = metadata !{i32 277, i32 0, metadata !364, null}
!405 = metadata !{i32 278, i32 0, metadata !364, null}
!406 = metadata !{i32 279, i32 0, metadata !364, null}
!407 = metadata !{i32 281, i32 0, metadata !366, null}
!408 = metadata !{i32 282, i32 0, metadata !366, null}
!409 = metadata !{i32 283, i32 0, metadata !366, null}
!410 = metadata !{i32 284, i32 0, metadata !366, null}
!411 = metadata !{i32 285, i32 0, metadata !366, null}
!412 = metadata !{i32 286, i32 0, metadata !366, null}
!413 = metadata !{i32 287, i32 0, metadata !366, null}
!414 = metadata !{i32 288, i32 0, metadata !366, null}
!415 = metadata !{i32 289, i32 0, metadata !366, null}
!416 = metadata !{i32 290, i32 0, metadata !366, null}
!417 = metadata !{i32 295, i32 0, metadata !418, null}
!418 = metadata !{i32 786443, metadata !1, metadata !419, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!419 = metadata !{i32 786443, metadata !1, metadata !420, i32 294, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!420 = metadata !{i32 786443, metadata !1, metadata !358, i32 293, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!421 = metadata !{i32 296, i32 0, metadata !418, null}
!422 = metadata !{i32 294, i32 0, metadata !419, null}
!423 = metadata !{i32 297, i32 0, metadata !418, null}
!424 = metadata !{i32 298, i32 0, metadata !418, null}
!425 = metadata !{i32 299, i32 0, metadata !418, null}
!426 = metadata !{i32 300, i32 0, metadata !418, null}
!427 = metadata !{i32 301, i32 0, metadata !418, null}
!428 = metadata !{i32 302, i32 0, metadata !418, null}
!429 = metadata !{i32 303, i32 0, metadata !418, null}
!430 = metadata !{i32 304, i32 0, metadata !418, null}
!431 = metadata !{i32 305, i32 0, metadata !418, null}
!432 = metadata !{i32 306, i32 0, metadata !418, null}
!433 = metadata !{i32 307, i32 0, metadata !418, null}
!434 = metadata !{i32 308, i32 0, metadata !418, null}
!435 = metadata !{i32 309, i32 0, metadata !418, null}
!436 = metadata !{i32 310, i32 0, metadata !418, null}
!437 = metadata !{i32 311, i32 0, metadata !418, null}
!438 = metadata !{i32 312, i32 0, metadata !418, null}
!439 = metadata !{i32 313, i32 0, metadata !418, null}
!440 = metadata !{i32 314, i32 0, metadata !418, null}
!441 = metadata !{i32 318, i32 0, metadata !197, null}
!442 = metadata !{i32 430, i32 0, metadata !163, null}
!443 = metadata !{i32 2}
!444 = metadata !{i32 435, i32 0, metadata !163, null}
!445 = metadata !{i32 436, i32 0, metadata !446, null}
!446 = metadata !{i32 786443, metadata !1, metadata !163, i32 436, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!447 = metadata !{i32 437, i32 0, metadata !448, null}
!448 = metadata !{i32 786443, metadata !1, metadata !446, i32 436, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!449 = metadata !{i32 8}
!450 = metadata !{i32 438, i32 0, metadata !448, null}
!451 = metadata !{i32 439, i32 0, metadata !448, null}
!452 = metadata !{i32 440, i32 0, metadata !453, null}
!453 = metadata !{i32 786443, metadata !1, metadata !448, i32 439, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!454 = metadata !{i32 441, i32 0, metadata !453, null}
!455 = metadata !{i32 444, i32 0, metadata !456, null}
!456 = metadata !{i32 786443, metadata !1, metadata !163, i32 444, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!457 = metadata !{i32 445, i32 0, metadata !458, null}
!458 = metadata !{i32 786443, metadata !1, metadata !459, i32 445, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!459 = metadata !{i32 786443, metadata !1, metadata !456, i32 444, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!460 = metadata !{i32 467, i32 0, metadata !461, null}
!461 = metadata !{i32 786443, metadata !1, metadata !462, i32 467, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!462 = metadata !{i32 786443, metadata !1, metadata !456, i32 466, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!463 = metadata !{i32 446, i32 0, metadata !464, null}
!464 = metadata !{i32 786443, metadata !1, metadata !458, i32 445, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!465 = metadata !{i32 447, i32 0, metadata !464, null}
!466 = metadata !{i32 448, i32 0, metadata !464, null}
!467 = metadata !{i32 449, i32 0, metadata !464, null}
!468 = metadata !{double undef}
!469 = metadata !{i32 450, i32 0, metadata !464, null}
!470 = metadata !{i32 451, i32 0, metadata !464, null}
!471 = metadata !{i32 452, i32 0, metadata !464, null}
!472 = metadata !{i32 453, i32 0, metadata !464, null}
!473 = metadata !{i32 454, i32 0, metadata !464, null}
!474 = metadata !{i32 455, i32 0, metadata !464, null}
!475 = metadata !{i32 456, i32 0, metadata !464, null}
!476 = metadata !{i32 457, i32 0, metadata !464, null}
!477 = metadata !{i32 459, i32 0, metadata !464, null}
!478 = metadata !{i32 461, i32 0, metadata !464, null}
!479 = metadata !{i32 462, i32 0, metadata !464, null}
!480 = metadata !{i32 463, i32 0, metadata !464, null}
!481 = metadata !{i32 464, i32 0, metadata !464, null}
!482 = metadata !{i32 468, i32 0, metadata !483, null}
!483 = metadata !{i32 786443, metadata !1, metadata !461, i32 467, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!484 = metadata !{i32 469, i32 0, metadata !483, null}
!485 = metadata !{i32 470, i32 0, metadata !483, null}
!486 = metadata !{i32 471, i32 0, metadata !483, null}
!487 = metadata !{i32 472, i32 0, metadata !483, null}
!488 = metadata !{i32 473, i32 0, metadata !483, null}
!489 = metadata !{i32 477, i32 0, metadata !163, null}
!490 = metadata !{i32 321, i32 0, metadata !181, null}
!491 = metadata !{i32 326, i32 0, metadata !181, null}
!492 = metadata !{i32 327, i32 0, metadata !181, null}
!493 = metadata !{i32 328, i32 0, metadata !181, null}
!494 = metadata !{i32 329, i32 0, metadata !181, null}
!495 = metadata !{i32 330, i32 0, metadata !496, null}
!496 = metadata !{i32 786443, metadata !1, metadata !181, i32 329, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!497 = metadata !{i32 331, i32 0, metadata !498, null}
!498 = metadata !{i32 786443, metadata !1, metadata !496, i32 331, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!499 = metadata !{i32 332, i32 0, metadata !500, null}
!500 = metadata !{i32 786443, metadata !1, metadata !498, i32 331, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!501 = metadata !{i32 334, i32 0, metadata !496, null}
!502 = metadata !{i32 336, i32 0, metadata !181, null}
!503 = metadata !{i32 337, i32 0, metadata !504, null}
!504 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!505 = metadata !{i32 338, i32 0, metadata !506, null}
!506 = metadata !{i32 786443, metadata !1, metadata !507, i32 338, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!507 = metadata !{i32 786443, metadata !1, metadata !504, i32 337, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!508 = metadata !{i32 393, i32 0, metadata !509, null}
!509 = metadata !{i32 786443, metadata !1, metadata !506, i32 338, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!510 = metadata !{i32 351, i32 0, metadata !511, null}
!511 = metadata !{i32 786443, metadata !1, metadata !512, i32 339, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!512 = metadata !{i32 786443, metadata !1, metadata !509, i32 339, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!513 = metadata !{i32 339, i32 0, metadata !512, null}
!514 = metadata !{i32 340, i32 0, metadata !511, null}
!515 = metadata !{i32 341, i32 0, metadata !511, null}
!516 = metadata !{i32 342, i32 0, metadata !511, null}
!517 = metadata !{i32 343, i32 0, metadata !511, null}
!518 = metadata !{i32 344, i32 0, metadata !511, null}
!519 = metadata !{i32 345, i32 0, metadata !511, null}
!520 = metadata !{i32 346, i32 0, metadata !511, null}
!521 = metadata !{i32 347, i32 0, metadata !511, null}
!522 = metadata !{i32 348, i32 0, metadata !511, null}
!523 = metadata !{i32 349, i32 0, metadata !511, null}
!524 = metadata !{i32 350, i32 0, metadata !511, null}
!525 = metadata !{i32 352, i32 0, metadata !511, null}
!526 = metadata !{i32 353, i32 0, metadata !511, null}
!527 = metadata !{i32 354, i32 0, metadata !511, null}
!528 = metadata !{i32 355, i32 0, metadata !511, null}
!529 = metadata !{i32 356, i32 0, metadata !511, null}
!530 = metadata !{i32 357, i32 0, metadata !511, null}
!531 = metadata !{i32 358, i32 0, metadata !511, null}
!532 = metadata !{i32 359, i32 0, metadata !511, null}
!533 = metadata !{i32 360, i32 0, metadata !511, null}
!534 = metadata !{i32 361, i32 0, metadata !511, null}
!535 = metadata !{i32 362, i32 0, metadata !511, null}
!536 = metadata !{i32 363, i32 0, metadata !511, null}
!537 = metadata !{i32 364, i32 0, metadata !511, null}
!538 = metadata !{i32 365, i32 0, metadata !511, null}
!539 = metadata !{i32 366, i32 0, metadata !511, null}
!540 = metadata !{i32 367, i32 0, metadata !511, null}
!541 = metadata !{i32 368, i32 0, metadata !511, null}
!542 = metadata !{i32 369, i32 0, metadata !511, null}
!543 = metadata !{i32 370, i32 0, metadata !511, null}
!544 = metadata !{i32 371, i32 0, metadata !511, null}
!545 = metadata !{i32 372, i32 0, metadata !511, null}
!546 = metadata !{i32 373, i32 0, metadata !511, null}
!547 = metadata !{i32 374, i32 0, metadata !511, null}
!548 = metadata !{i32 375, i32 0, metadata !511, null}
!549 = metadata !{i32 376, i32 0, metadata !511, null}
!550 = metadata !{i32 377, i32 0, metadata !511, null}
!551 = metadata !{i32 378, i32 0, metadata !511, null}
!552 = metadata !{i32 379, i32 0, metadata !511, null}
!553 = metadata !{i32 381, i32 0, metadata !509, null}
!554 = metadata !{i32 382, i32 0, metadata !509, null}
!555 = metadata !{i32 383, i32 0, metadata !509, null}
!556 = metadata !{i32 384, i32 0, metadata !509, null}
!557 = metadata !{i32 385, i32 0, metadata !509, null}
!558 = metadata !{i32 386, i32 0, metadata !509, null}
!559 = metadata !{i32 387, i32 0, metadata !509, null}
!560 = metadata !{i32 388, i32 0, metadata !509, null}
!561 = metadata !{i32 389, i32 0, metadata !509, null}
!562 = metadata !{i32 390, i32 0, metadata !509, null}
!563 = metadata !{i32 391, i32 0, metadata !509, null}
!564 = metadata !{i32 392, i32 0, metadata !509, null}
!565 = metadata !{i32 394, i32 0, metadata !509, null}
!566 = metadata !{i32 397, i32 0, metadata !567, null}
!567 = metadata !{i32 786443, metadata !1, metadata !504, i32 396, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!568 = metadata !{i32 398, i32 0, metadata !567, null}
!569 = metadata !{i32 399, i32 0, metadata !570, null}
!570 = metadata !{i32 786443, metadata !1, metadata !567, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!571 = metadata !{i32 424, i32 0, metadata !572, null}
!572 = metadata !{i32 786443, metadata !1, metadata !570, i32 399, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!573 = metadata !{i32 401, i32 0, metadata !574, null}
!574 = metadata !{i32 786443, metadata !1, metadata !575, i32 400, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!575 = metadata !{i32 786443, metadata !1, metadata !572, i32 400, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!576 = metadata !{i32 402, i32 0, metadata !574, null}
!577 = metadata !{i32 400, i32 0, metadata !575, null}
!578 = metadata !{i32 403, i32 0, metadata !574, null}
!579 = metadata !{i32 404, i32 0, metadata !574, null}
!580 = metadata !{i32 405, i32 0, metadata !574, null}
!581 = metadata !{i32 406, i32 0, metadata !574, null}
!582 = metadata !{i32 407, i32 0, metadata !574, null}
!583 = metadata !{i32 408, i32 0, metadata !574, null}
!584 = metadata !{i32 409, i32 0, metadata !574, null}
!585 = metadata !{i32 410, i32 0, metadata !574, null}
!586 = metadata !{i32 411, i32 0, metadata !574, null}
!587 = metadata !{i32 412, i32 0, metadata !574, null}
!588 = metadata !{i32 413, i32 0, metadata !574, null}
!589 = metadata !{i32 414, i32 0, metadata !574, null}
!590 = metadata !{i32 415, i32 0, metadata !574, null}
!591 = metadata !{i32 416, i32 0, metadata !574, null}
!592 = metadata !{i32 417, i32 0, metadata !574, null}
!593 = metadata !{i32 418, i32 0, metadata !574, null}
!594 = metadata !{i32 419, i32 0, metadata !574, null}
!595 = metadata !{i32 420, i32 0, metadata !574, null}
!596 = metadata !{i32 422, i32 0, metadata !572, null}
!597 = metadata !{i32 423, i32 0, metadata !572, null}
!598 = metadata !{i32 427, i32 0, metadata !181, null}
!599 = metadata !{i32 480, i32 0, metadata !90, null}
!600 = metadata !{i32 485, i32 0, metadata !90, null}
!601 = metadata !{i32 486, i32 0, metadata !602, null}
!602 = metadata !{i32 786443, metadata !1, metadata !90, i32 486, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!603 = metadata !{i32 487, i32 0, metadata !604, null}
!604 = metadata !{i32 786443, metadata !1, metadata !602, i32 486, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!605 = metadata !{i32 488, i32 0, metadata !604, null}
!606 = metadata !{i32 489, i32 0, metadata !604, null}
!607 = metadata !{i32 490, i32 0, metadata !608, null}
!608 = metadata !{i32 786443, metadata !1, metadata !604, i32 489, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!609 = metadata !{i32 491, i32 0, metadata !608, null}
!610 = metadata !{i32 494, i32 0, metadata !611, null}
!611 = metadata !{i32 786443, metadata !1, metadata !90, i32 494, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!612 = metadata !{i32 495, i32 0, metadata !613, null}
!613 = metadata !{i32 786443, metadata !1, metadata !614, i32 495, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!614 = metadata !{i32 786443, metadata !1, metadata !611, i32 494, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!615 = metadata !{i32 517, i32 0, metadata !616, null}
!616 = metadata !{i32 786443, metadata !1, metadata !617, i32 517, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!617 = metadata !{i32 786443, metadata !1, metadata !611, i32 516, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!618 = metadata !{i32 496, i32 0, metadata !619, null}
!619 = metadata !{i32 786443, metadata !1, metadata !613, i32 495, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!620 = metadata !{i32 497, i32 0, metadata !619, null}
!621 = metadata !{i32 498, i32 0, metadata !619, null}
!622 = metadata !{i32 499, i32 0, metadata !619, null}
!623 = metadata !{i32 500, i32 0, metadata !619, null}
!624 = metadata !{i32 501, i32 0, metadata !619, null}
!625 = metadata !{i32 502, i32 0, metadata !619, null}
!626 = metadata !{i32 503, i32 0, metadata !619, null}
!627 = metadata !{i32 504, i32 0, metadata !619, null}
!628 = metadata !{i32 505, i32 0, metadata !619, null}
!629 = metadata !{i32 506, i32 0, metadata !619, null}
!630 = metadata !{i32 507, i32 0, metadata !619, null}
!631 = metadata !{i32 508, i32 0, metadata !619, null}
!632 = metadata !{i32 509, i32 0, metadata !619, null}
!633 = metadata !{i32 510, i32 0, metadata !619, null}
!634 = metadata !{i32 511, i32 0, metadata !619, null}
!635 = metadata !{i32 513, i32 0, metadata !619, null}
!636 = metadata !{i32 518, i32 0, metadata !637, null}
!637 = metadata !{i32 786443, metadata !1, metadata !616, i32 517, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!638 = metadata !{i32 519, i32 0, metadata !637, null}
!639 = metadata !{i32 520, i32 0, metadata !637, null}
!640 = metadata !{i32 521, i32 0, metadata !637, null}
!641 = metadata !{i32 522, i32 0, metadata !637, null}
!642 = metadata !{i32 523, i32 0, metadata !637, null}
!643 = metadata !{i32 527, i32 0, metadata !90, null}
!644 = metadata !{i32 530, i32 0, metadata !141, null}
!645 = metadata !{i32 536, i32 0, metadata !141, null}
!646 = metadata !{i32 537, i32 0, metadata !141, null}
!647 = metadata !{i32 538, i32 0, metadata !141, null}
!648 = metadata !{i32 539, i32 0, metadata !141, null}
!649 = metadata !{i32 540, i32 0, metadata !141, null}
!650 = metadata !{i32 541, i32 0, metadata !141, null}
!651 = metadata !{i32 542, i32 0, metadata !141, null}
!652 = metadata !{i32 543, i32 0, metadata !141, null}
!653 = metadata !{i32 544, i32 0, metadata !141, null}
!654 = metadata !{i32 546, i32 0, metadata !141, null}
!655 = metadata !{i32 548, i32 0, metadata !141, null}
!656 = metadata !{i32 549, i32 0, metadata !141, null}
!657 = metadata !{i32 550, i32 0, metadata !141, null}
!658 = metadata !{i32 551, i32 0, metadata !141, null}
!659 = metadata !{i32 552, i32 0, metadata !141, null}
!660 = metadata !{i32 553, i32 0, metadata !141, null}
!661 = metadata !{i32 554, i32 0, metadata !141, null}
!662 = metadata !{i32 555, i32 0, metadata !141, null}
!663 = metadata !{i32 556, i32 0, metadata !141, null}
!664 = metadata !{i32 557, i32 0, metadata !141, null}
!665 = metadata !{i32 558, i32 0, metadata !141, null}
!666 = metadata !{i32 559, i32 0, metadata !141, null}
!667 = metadata !{i32 560, i32 0, metadata !141, null}
!668 = metadata !{i32 561, i32 0, metadata !141, null}
!669 = metadata !{i32 563, i32 0, metadata !141, null}
!670 = metadata !{i32 565, i32 0, metadata !141, null}
!671 = metadata !{i32 566, i32 0, metadata !141, null}
!672 = metadata !{i32 567, i32 0, metadata !141, null}
!673 = metadata !{i32 568, i32 0, metadata !141, null}
!674 = metadata !{i32 569, i32 0, metadata !141, null}
!675 = metadata !{i32 570, i32 0, metadata !141, null}
!676 = metadata !{i32 571, i32 0, metadata !141, null}
!677 = metadata !{i32 572, i32 0, metadata !141, null}
!678 = metadata !{i32 573, i32 0, metadata !141, null}
!679 = metadata !{i32 16}
!680 = metadata !{i32 574, i32 0, metadata !681, null}
!681 = metadata !{i32 786443, metadata !1, metadata !141, i32 574, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!682 = metadata !{i32 576, i32 0, metadata !683, null}
!683 = metadata !{i32 786443, metadata !1, metadata !681, i32 574, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!684 = metadata !{i32 577, i32 0, metadata !683, null}
!685 = metadata !{i32 578, i32 0, metadata !683, null}
!686 = metadata !{i32 579, i32 0, metadata !683, null}
!687 = metadata !{i32 580, i32 0, metadata !683, null}
!688 = metadata !{i32 581, i32 0, metadata !683, null}
!689 = metadata !{i32 582, i32 0, metadata !683, null}
!690 = metadata !{i32 583, i32 0, metadata !683, null}
!691 = metadata !{i32 584, i32 0, metadata !683, null}
!692 = metadata !{i32 585, i32 0, metadata !683, null}
!693 = metadata !{i32 586, i32 0, metadata !683, null}
!694 = metadata !{i32 587, i32 0, metadata !683, null}
!695 = metadata !{i32 588, i32 0, metadata !683, null}
!696 = metadata !{i32 589, i32 0, metadata !683, null}
!697 = metadata !{i32 590, i32 0, metadata !683, null}
!698 = metadata !{i32 591, i32 0, metadata !683, null}
!699 = metadata !{i32 593, i32 0, metadata !683, null}
!700 = metadata !{i32 594, i32 0, metadata !683, null}
!701 = metadata !{i32 595, i32 0, metadata !683, null}
!702 = metadata !{i32 596, i32 0, metadata !683, null}
!703 = metadata !{i32 597, i32 0, metadata !683, null}
!704 = metadata !{i32 598, i32 0, metadata !683, null}
!705 = metadata !{i32 599, i32 0, metadata !683, null}
!706 = metadata !{i32 600, i32 0, metadata !683, null}
!707 = metadata !{i32 601, i32 0, metadata !683, null}
!708 = metadata !{i32 602, i32 0, metadata !683, null}
!709 = metadata !{i32 603, i32 0, metadata !683, null}
!710 = metadata !{i32 604, i32 0, metadata !683, null}
!711 = metadata !{i32 605, i32 0, metadata !683, null}
!712 = metadata !{i32 606, i32 0, metadata !683, null}
!713 = metadata !{i32 607, i32 0, metadata !683, null}
!714 = metadata !{i32 608, i32 0, metadata !683, null}
!715 = metadata !{i32 609, i32 0, metadata !683, null}
!716 = metadata !{i32 610, i32 0, metadata !683, null}
!717 = metadata !{i32 611, i32 0, metadata !683, null}
!718 = metadata !{i32 612, i32 0, metadata !683, null}
!719 = metadata !{i32 613, i32 0, metadata !683, null}
!720 = metadata !{i32 614, i32 0, metadata !683, null}
!721 = metadata !{i32 615, i32 0, metadata !683, null}
!722 = metadata !{i32 616, i32 0, metadata !683, null}
!723 = metadata !{i32 617, i32 0, metadata !683, null}
!724 = metadata !{i32 619, i32 0, metadata !683, null}
!725 = metadata !{i32 620, i32 0, metadata !683, null}
!726 = metadata !{i32 621, i32 0, metadata !683, null}
!727 = metadata !{i32 622, i32 0, metadata !683, null}
!728 = metadata !{i32 623, i32 0, metadata !683, null}
!729 = metadata !{i32 624, i32 0, metadata !683, null}
!730 = metadata !{i32 625, i32 0, metadata !683, null}
!731 = metadata !{i32 626, i32 0, metadata !683, null}
!732 = metadata !{i32 627, i32 0, metadata !683, null}
!733 = metadata !{i32 628, i32 0, metadata !683, null}
!734 = metadata !{i32 629, i32 0, metadata !683, null}
!735 = metadata !{i32 630, i32 0, metadata !683, null}
!736 = metadata !{i32 632, i32 0, metadata !141, null}
!737 = metadata !{i32 635, i32 0, metadata !110, null}
!738 = metadata !{i32 641, i32 0, metadata !110, null}
!739 = metadata !{i32 642, i32 0, metadata !740, null}
!740 = metadata !{i32 786443, metadata !1, metadata !110, i32 642, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!741 = metadata !{i32 643, i32 0, metadata !742, null}
!742 = metadata !{i32 786443, metadata !1, metadata !740, i32 642, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!743 = metadata !{i32 644, i32 0, metadata !742, null}
!744 = metadata !{i32 645, i32 0, metadata !742, null}
!745 = metadata !{i32 646, i32 0, metadata !742, null}
!746 = metadata !{i32 647, i32 0, metadata !742, null}
!747 = metadata !{i32 648, i32 0, metadata !742, null}
!748 = metadata !{i32 649, i32 0, metadata !742, null}
!749 = metadata !{i32 650, i32 0, metadata !742, null}
!750 = metadata !{i32 651, i32 0, metadata !742, null}
!751 = metadata !{i32 652, i32 0, metadata !742, null}
!752 = metadata !{i32 653, i32 0, metadata !742, null}
!753 = metadata !{i32 654, i32 0, metadata !742, null}
!754 = metadata !{i32 656, i32 0, metadata !742, null}
!755 = metadata !{i32 658, i32 0, metadata !742, null}
!756 = metadata !{i32 659, i32 0, metadata !742, null}
!757 = metadata !{i32 660, i32 0, metadata !742, null}
!758 = metadata !{i32 661, i32 0, metadata !742, null}
!759 = metadata !{i32 663, i32 0, metadata !110, null}
!760 = metadata !{i32 664, i32 0, metadata !761, null}
!761 = metadata !{i32 786443, metadata !1, metadata !110, i32 664, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!762 = metadata !{i32 682, i32 0, metadata !763, null}
!763 = metadata !{i32 786443, metadata !1, metadata !761, i32 664, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!764 = metadata !{i32 665, i32 0, metadata !763, null}
!765 = metadata !{i32 666, i32 0, metadata !763, null}
!766 = metadata !{i32 667, i32 0, metadata !763, null}
!767 = metadata !{i32 668, i32 0, metadata !763, null}
!768 = metadata !{i32 669, i32 0, metadata !763, null}
!769 = metadata !{i32 670, i32 0, metadata !763, null}
!770 = metadata !{i32 671, i32 0, metadata !763, null}
!771 = metadata !{i32 672, i32 0, metadata !763, null}
!772 = metadata !{i32 673, i32 0, metadata !763, null}
!773 = metadata !{i32 674, i32 0, metadata !763, null}
!774 = metadata !{i32 675, i32 0, metadata !763, null}
!775 = metadata !{i32 676, i32 0, metadata !763, null}
!776 = metadata !{i32 677, i32 0, metadata !763, null}
!777 = metadata !{i32 678, i32 0, metadata !763, null}
!778 = metadata !{i32 679, i32 0, metadata !763, null}
!779 = metadata !{i32 680, i32 0, metadata !763, null}
!780 = metadata !{i32 681, i32 0, metadata !763, null}
!781 = metadata !{i32 683, i32 0, metadata !763, null}
!782 = metadata !{i32 684, i32 0, metadata !763, null}
!783 = metadata !{i32 685, i32 0, metadata !763, null}
!784 = metadata !{i32 686, i32 0, metadata !763, null}
!785 = metadata !{i32 687, i32 0, metadata !763, null}
!786 = metadata !{i32 689, i32 0, metadata !110, null}
!787 = metadata !{i32 690, i32 0, metadata !110, null}
!788 = metadata !{i32 691, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !1, metadata !110, i32 691, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!790 = metadata !{i32 692, i32 0, metadata !791, null}
!791 = metadata !{i32 786443, metadata !1, metadata !789, i32 691, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!792 = metadata !{i32 693, i32 0, metadata !791, null}
!793 = metadata !{i32 694, i32 0, metadata !791, null}
!794 = metadata !{i32 695, i32 0, metadata !791, null}
!795 = metadata !{i32 696, i32 0, metadata !791, null}
!796 = metadata !{i32 697, i32 0, metadata !791, null}
!797 = metadata !{i32 698, i32 0, metadata !791, null}
!798 = metadata !{i32 699, i32 0, metadata !791, null}
!799 = metadata !{i32 700, i32 0, metadata !800, null}
!800 = metadata !{i32 786443, metadata !1, metadata !791, i32 700, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!801 = metadata !{i32 701, i32 0, metadata !802, null}
!802 = metadata !{i32 786443, metadata !1, metadata !800, i32 700, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!803 = metadata !{i32 702, i32 0, metadata !802, null}
!804 = metadata !{i32 703, i32 0, metadata !802, null}
!805 = metadata !{i32 704, i32 0, metadata !802, null}
!806 = metadata !{i32 705, i32 0, metadata !802, null}
!807 = metadata !{i32 706, i32 0, metadata !802, null}
!808 = metadata !{i32 707, i32 0, metadata !802, null}
!809 = metadata !{i32 708, i32 0, metadata !802, null}
!810 = metadata !{i32 709, i32 0, metadata !802, null}
!811 = metadata !{i32 710, i32 0, metadata !802, null}
!812 = metadata !{i32 711, i32 0, metadata !802, null}
!813 = metadata !{i32 712, i32 0, metadata !802, null}
!814 = metadata !{i32 713, i32 0, metadata !802, null}
!815 = metadata !{i32 714, i32 0, metadata !802, null}
!816 = metadata !{i32 715, i32 0, metadata !802, null}
!817 = metadata !{i32 716, i32 0, metadata !802, null}
!818 = metadata !{i32 717, i32 0, metadata !802, null}
!819 = metadata !{i32 718, i32 0, metadata !802, null}
!820 = metadata !{i32 719, i32 0, metadata !802, null}
!821 = metadata !{i32 720, i32 0, metadata !802, null}
!822 = metadata !{i32 721, i32 0, metadata !802, null}
!823 = metadata !{i32 722, i32 0, metadata !802, null}
!824 = metadata !{i32 723, i32 0, metadata !802, null}
!825 = metadata !{i32 724, i32 0, metadata !802, null}
!826 = metadata !{i32 725, i32 0, metadata !802, null}
!827 = metadata !{i32 727, i32 0, metadata !791, null}
!828 = metadata !{i32 728, i32 0, metadata !791, null}
!829 = metadata !{i32 729, i32 0, metadata !791, null}
!830 = metadata !{i32 730, i32 0, metadata !791, null}
!831 = metadata !{i32 731, i32 0, metadata !832, null}
!832 = metadata !{i32 786443, metadata !1, metadata !791, i32 731, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!833 = metadata !{i32 747, i32 0, metadata !834, null}
!834 = metadata !{i32 786443, metadata !1, metadata !832, i32 731, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!835 = metadata !{i32 732, i32 0, metadata !834, null}
!836 = metadata !{i32 733, i32 0, metadata !834, null}
!837 = metadata !{i32 734, i32 0, metadata !834, null}
!838 = metadata !{i32 735, i32 0, metadata !834, null}
!839 = metadata !{i32 736, i32 0, metadata !834, null}
!840 = metadata !{i32 737, i32 0, metadata !834, null}
!841 = metadata !{i32 738, i32 0, metadata !834, null}
!842 = metadata !{i32 739, i32 0, metadata !834, null}
!843 = metadata !{i32 740, i32 0, metadata !834, null}
!844 = metadata !{i32 741, i32 0, metadata !834, null}
!845 = metadata !{i32 742, i32 0, metadata !834, null}
!846 = metadata !{i32 743, i32 0, metadata !834, null}
!847 = metadata !{i32 745, i32 0, metadata !834, null}
!848 = metadata !{i32 746, i32 0, metadata !834, null}
!849 = metadata !{i32 748, i32 0, metadata !834, null}
!850 = metadata !{i32 749, i32 0, metadata !834, null}
!851 = metadata !{i32 750, i32 0, metadata !834, null}
!852 = metadata !{i32 751, i32 0, metadata !834, null}
!853 = metadata !{i32 752, i32 0, metadata !834, null}
!854 = metadata !{i32 753, i32 0, metadata !834, null}
!855 = metadata !{i32 754, i32 0, metadata !834, null}
!856 = metadata !{i32 755, i32 0, metadata !834, null}
!857 = metadata !{i32 756, i32 0, metadata !834, null}
!858 = metadata !{i32 759, i32 0, metadata !110, null}
