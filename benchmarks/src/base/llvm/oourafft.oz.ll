; ModuleID = 'oourafft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !23), !dbg !217
  %1 = tail call double @get_time() #8, !dbg !218
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !20), !dbg !218
  %2 = tail call double @get_time() #8, !dbg !219
  tail call void @llvm.dbg.value(metadata !{double %2}, i64 0, metadata !21), !dbg !219
  %3 = tail call noalias i8* @memalign(i64 16, i64 128) #9, !dbg !220
  %4 = bitcast i8* %3 to i32*, !dbg !220
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !12), !dbg !220
  %5 = tail call noalias i8* @memalign(i64 16, i64 20480) #9, !dbg !221
  %6 = bitcast i8* %5 to double*, !dbg !221
  tail call void @llvm.dbg.value(metadata !{double* %6}, i64 0, metadata !19), !dbg !221
  tail call void @makewt(i32 512, i32* %4, double* %6) #8, !dbg !222
  %7 = tail call noalias i8* @memalign(i64 16, i64 16384) #9, !dbg !223
  %8 = bitcast i8* %7 to double*, !dbg !223
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !14), !dbg !223
  %9 = tail call noalias i8* @memalign(i64 16, i64 16384) #9, !dbg !224
  %10 = bitcast i8* %9 to double*, !dbg !224
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !17), !dbg !224
  %11 = tail call noalias i8* @memalign(i64 16, i64 16384) #9, !dbg !225
  %12 = bitcast i8* %11 to double*, !dbg !225
  tail call void @llvm.dbg.value(metadata !{double* %12}, i64 0, metadata !18), !dbg !225
  tail call void @putdata(i32 0, i32 2047, double* %8) #8, !dbg !226
  tail call void @cdft(i32 2048, i32 1, double* %8, i32* %4, double* %6) #8, !dbg !227
  tail call void @cdft(i32 2048, i32 -1, double* %8, i32* %4, double* %6) #8, !dbg !228
  %13 = tail call double @errorcheck(i32 0, i32 2047, double 9.765625e-04, double* %8) #8, !dbg !229
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !24), !dbg !229
  %14 = tail call double @fabs(double %13) #10, !dbg !230
  %15 = fcmp ogt double %14, 1.000000e-10, !dbg !230
  br i1 %15, label %16, label %18, !dbg !230

; <label>:16                                      ; preds = %0
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i64 0, i64 0), double %13) #9, !dbg !232
  tail call void @abort() #11, !dbg !234
  unreachable, !dbg !234

; <label>:18                                      ; preds = %0
  tail call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16384, i32 8, i1 false), !dbg !235
  tail call void @putdata(i32 0, i32 1023, double* %8) #8, !dbg !236
  tail call void @cdft(i32 2048, i32 1, double* %8, i32* %4, double* %6) #8, !dbg !237
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
  tail call void @putdata(i32 0, i32 1023, double* %12) #8, !dbg !247
  %26 = tail call double @get_time() #8, !dbg !248
  tail call void @llvm.dbg.value(metadata !{double %26}, i64 0, metadata !20), !dbg !248
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !10), !dbg !249
  br label %27, !dbg !249

; <label>:27                                      ; preds = %45, %25
  %i.03 = phi i32 [ 0, %25 ], [ %46, %45 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %11, i64 16384, i32 8, i1 false), !dbg !250
  tail call void @cdft(i32 2048, i32 1, double* %10, i32* %4, double* %6) #8, !dbg !251
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
  tail call void @cdft(i32 2048, i32 -1, double* %10, i32* %4, double* %6) #8, !dbg !259
  %46 = add nsw i32 %i.03, 1, !dbg !249
  tail call void @llvm.dbg.value(metadata !{i32 %46}, i64 0, metadata !10), !dbg !249
  %exitcond8 = icmp eq i32 %46, 150000, !dbg !249
  br i1 %exitcond8, label %47, label %27, !dbg !249

; <label>:47                                      ; preds = %45
  %48 = tail call double @get_time() #8, !dbg !260
  tail call void @llvm.dbg.value(metadata !{double %48}, i64 0, metadata !21), !dbg !260
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !11), !dbg !261
  br label %49, !dbg !261

; <label>:49                                      ; preds = %49, %47
  %indvars.iv = phi i64 [ 0, %47 ], [ %indvars.iv.next, %49 ]
  %50 = shl nsw i64 %indvars.iv, 1, !dbg !263
  %51 = getelementptr inbounds double* %10, i64 %50, !dbg !263
  %52 = load double* %51, align 8, !dbg !263, !tbaa !242
  %53 = tail call double @fabs(double %52) #10, !dbg !263
  %54 = fcmp ogt double %53, 1.000000e-09, !dbg !263
  %55 = select i1 %54, double %52, double 0.000000e+00, !dbg !263
  %56 = or i64 %50, 1, !dbg !265
  %57 = getelementptr inbounds double* %10, i64 %56, !dbg !265
  %58 = load double* %57, align 8, !dbg !265, !tbaa !242
  %59 = tail call double @fabs(double %58) #10, !dbg !265
  %60 = fcmp ogt double %59, 1.000000e-09, !dbg !265
  %61 = select i1 %60, double %58, double 0.000000e+00, !dbg !265
  %62 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), double %55, double %61) #9, !dbg !266
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !261
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !261
  br i1 %exitcond, label %63, label %49, !dbg !261

; <label>:63                                      ; preds = %49
  tail call void @free(i8* %7) #9, !dbg !267
  tail call void @free(i8* %5) #9, !dbg !268
  tail call void @free(i8* %3) #9, !dbg !269
  tail call void @free(i8* %9) #9, !dbg !270
  tail call void @free(i8* %11) #9, !dbg !271
  ret i32 0, !dbg !272
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: minsize nounwind optsize uwtable
define double @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !59), !dbg !273
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #9, !dbg !274
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

; Function Attrs: minsize nounwind optsize
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: minsize nounwind optsize uwtable
define void @makewt(i32 %nw, i32* nocapture %ip, double* %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nw}, i64 0, metadata !82), !dbg !280
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !83), !dbg !280
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !84), !dbg !280
  %1 = icmp sgt i32 %nw, 2, !dbg !281
  br i1 %1, label %2, label %31, !dbg !281

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
  %8 = tail call double @cos(double %7) #9, !dbg !288
  %9 = sext i32 %3 to i64, !dbg !288
  %10 = getelementptr inbounds double* %w, i64 %9, !dbg !288
  store double %8, double* %10, align 8, !dbg !288, !tbaa !242
  %11 = add nsw i32 %3, 1, !dbg !289
  %12 = sext i32 %11 to i64, !dbg !289
  %13 = getelementptr inbounds double* %w, i64 %12, !dbg !289
  store double %8, double* %13, align 8, !dbg !289, !tbaa !242
  %14 = icmp sgt i32 %3, 2, !dbg !290
  br i1 %14, label %.lr.ph, label %31, !dbg !290

.lr.ph:                                           ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 2, %2 ]
  %15 = trunc i64 %indvars.iv to i32, !dbg !292
  %16 = sitofp i32 %15 to double, !dbg !292
  %17 = fmul double %5, %16, !dbg !292
  %18 = tail call double @cos(double %17) #9, !dbg !292
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !88), !dbg !292
  %19 = tail call double @sin(double %17) #9, !dbg !296
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !89), !dbg !296
  %20 = getelementptr inbounds double* %w, i64 %indvars.iv, !dbg !297
  store double %18, double* %20, align 8, !dbg !297, !tbaa !242
  %21 = or i64 %indvars.iv, 1, !dbg !298
  %22 = getelementptr inbounds double* %w, i64 %21, !dbg !298
  store double %19, double* %22, align 8, !dbg !298, !tbaa !242
  %23 = sub nsw i32 %nw, %15, !dbg !299
  %24 = sext i32 %23 to i64, !dbg !299
  %25 = getelementptr inbounds double* %w, i64 %24, !dbg !299
  store double %19, double* %25, align 8, !dbg !299, !tbaa !242
  %26 = add nsw i32 %23, 1, !dbg !300
  %27 = sext i32 %26 to i64, !dbg !300
  %28 = getelementptr inbounds double* %w, i64 %27, !dbg !300
  store double %18, double* %28, align 8, !dbg !300, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !301
  %29 = trunc i64 %indvars.iv.next to i32, !dbg !301
  %30 = icmp slt i32 %29, %3, !dbg !301
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !301

._crit_edge:                                      ; preds = %.lr.ph
  tail call fastcc void @bitrv2(i32 %nw, i32* %ip, double* %w) #8, !dbg !302
  br label %31, !dbg !303

; <label>:31                                      ; preds = %2, %._crit_edge, %0
  ret void, !dbg !304
}

; Function Attrs: minsize nounwind optsize uwtable
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

; Function Attrs: minsize nounwind optsize uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* nocapture %ip, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !73), !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32 %isgn}, i64 0, metadata !74), !dbg !311
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !75), !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !76), !dbg !311
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !77), !dbg !311
  %1 = icmp sgt i32 %n, 4, !dbg !312
  br i1 %1, label %2, label %283, !dbg !312

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %isgn, -1, !dbg !314
  br i1 %3, label %4, label %5, !dbg !314

; <label>:4                                       ; preds = %2
  tail call fastcc void @bitrv2(i32 %n, i32* %ip, double* %a) #8, !dbg !317
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w) #8, !dbg !319
  br label %cftbsub.exit, !dbg !320

; <label>:5                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !321), !dbg !324
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !325), !dbg !324
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !326), !dbg !324
  store i32 0, i32* %ip, align 4, !dbg !327, !tbaa !328
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !330), !dbg !331
  tail call void @llvm.dbg.value(metadata !332, i64 0, metadata !333), !dbg !334
  %6 = icmp sgt i32 %n, 8, !dbg !335
  br i1 %6, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !335

.lr.ph18.i:                                       ; preds = %5, %._crit_edge13.i
  %m.015.i = phi i32 [ %16, %._crit_edge13.i ], [ 1, %5 ]
  %l.014.i = phi i32 [ %7, %._crit_edge13.i ], [ %n, %5 ]
  %7 = ashr i32 %l.014.i, 1, !dbg !336
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !330), !dbg !336
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !338), !dbg !339
  %8 = icmp sgt i32 %m.015.i, 0, !dbg !339
  br i1 %8, label %.lr.ph12.i, label %._crit_edge13.i, !dbg !339

.lr.ph12.i:                                       ; preds = %.lr.ph18.i
  %9 = sext i32 %m.015.i to i64, !dbg !339
  br label %10, !dbg !339

; <label>:10                                      ; preds = %10, %.lr.ph12.i
  %indvars.iv41.i = phi i64 [ 0, %.lr.ph12.i ], [ %indvars.iv.next42.i, %10 ]
  %11 = getelementptr inbounds i32* %ip, i64 %indvars.iv41.i, !dbg !341
  %12 = load i32* %11, align 4, !dbg !341, !tbaa !328
  %13 = add nsw i32 %12, %7, !dbg !341
  %14 = add nsw i64 %indvars.iv41.i, %9, !dbg !341
  %15 = getelementptr inbounds i32* %ip, i64 %14, !dbg !341
  store i32 %13, i32* %15, align 4, !dbg !341, !tbaa !328
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !339
  %lftr.wideiv22 = trunc i64 %indvars.iv.next42.i to i32, !dbg !339
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %m.015.i, !dbg !339
  br i1 %exitcond23, label %._crit_edge13.i, label %10, !dbg !339

._crit_edge13.i:                                  ; preds = %10, %.lr.ph18.i
  %16 = shl i32 %m.015.i, 1, !dbg !343
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !333), !dbg !343
  %17 = shl i32 %m.015.i, 4, !dbg !335
  %18 = icmp slt i32 %17, %7, !dbg !335
  br i1 %18, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !335

._crit_edge19.i:                                  ; preds = %._crit_edge13.i, %5
  %.lcssa.i = phi i32 [ 8, %5 ], [ %17, %._crit_edge13.i ]
  %m.0.lcssa.i = phi i32 [ 1, %5 ], [ %16, %._crit_edge13.i ]
  %l.0.lcssa.i = phi i32 [ %n, %5 ], [ %7, %._crit_edge13.i ]
  %19 = shl nsw i32 %m.0.lcssa.i, 1, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !345), !dbg !344
  %20 = icmp eq i32 %.lcssa.i, %l.0.lcssa.i, !dbg !346
  br i1 %20, label %.preheader1.i, label %134, !dbg !346

.preheader1.i:                                    ; preds = %._crit_edge19.i
  %21 = icmp sgt i32 %m.0.lcssa.i, 0, !dbg !348
  br i1 %21, label %.preheader.lr.ph.i, label %bitrv2conj.exit, !dbg !348

.preheader.lr.ph.i:                               ; preds = %.preheader1.i
  %22 = or i32 %19, 1, !dbg !351
  %23 = shl i32 %m.0.lcssa.i, 2, !dbg !353
  br label %.preheader.i, !dbg !348

.preheader.i:                                     ; preds = %._crit_edge.i, %.preheader.lr.ph.i
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %24 = trunc i64 %indvars.iv27.i to i32, !dbg !356
  %25 = icmp sgt i32 %24, 0, !dbg !356
  %26 = getelementptr inbounds i32* %ip, i64 %indvars.iv27.i, !dbg !357
  %27 = load i32* %26, align 4, !dbg !357, !tbaa !328
  %28 = shl nsw i32 %24, 1, !dbg !358
  br i1 %25, label %.lr.ph.i, label %._crit_edge.i, !dbg !356

.lr.ph.i:                                         ; preds = %.preheader.i, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.preheader.i ]
  %29 = trunc i64 %indvars.iv.i to i32, !dbg !357
  %30 = shl nsw i32 %29, 1, !dbg !357
  %31 = add nsw i32 %30, %27, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !359), !dbg !357
  %32 = getelementptr inbounds i32* %ip, i64 %indvars.iv.i, !dbg !358
  %33 = load i32* %32, align 4, !dbg !358, !tbaa !328
  %34 = add nsw i32 %33, %28, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !360), !dbg !358
  %35 = sext i32 %31 to i64, !dbg !361
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !361
  %37 = load double* %36, align 8, !dbg !361, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !362), !dbg !361
  %38 = add nsw i32 %31, 1, !dbg !363
  %39 = sext i32 %38 to i64, !dbg !363
  %40 = getelementptr inbounds double* %a, i64 %39, !dbg !363
  %41 = load double* %40, align 8, !dbg !363, !tbaa !242
  %42 = fsub double -0.000000e+00, %41, !dbg !363
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !364), !dbg !363
  %43 = sext i32 %34 to i64, !dbg !365
  %44 = getelementptr inbounds double* %a, i64 %43, !dbg !365
  %45 = load double* %44, align 8, !dbg !365, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !366), !dbg !365
  %46 = add nsw i32 %34, 1, !dbg !367
  %47 = sext i32 %46 to i64, !dbg !367
  %48 = getelementptr inbounds double* %a, i64 %47, !dbg !367
  %49 = load double* %48, align 8, !dbg !367, !tbaa !242
  %50 = fsub double -0.000000e+00, %49, !dbg !367
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !368), !dbg !367
  store double %45, double* %36, align 8, !dbg !369, !tbaa !242
  store double %50, double* %40, align 8, !dbg !370, !tbaa !242
  store double %37, double* %44, align 8, !dbg !371, !tbaa !242
  store double %42, double* %48, align 8, !dbg !372, !tbaa !242
  %51 = add nsw i32 %31, %19, !dbg !373
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !359), !dbg !373
  %52 = add nsw i32 %34, %23, !dbg !353
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !360), !dbg !353
  %53 = sext i32 %51 to i64, !dbg !374
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !374
  %55 = load double* %54, align 8, !dbg !374, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !362), !dbg !374
  %56 = add nsw i32 %51, 1, !dbg !375
  %57 = sext i32 %56 to i64, !dbg !375
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !375
  %59 = load double* %58, align 8, !dbg !375, !tbaa !242
  %60 = fsub double -0.000000e+00, %59, !dbg !375
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !364), !dbg !375
  %61 = sext i32 %52 to i64, !dbg !376
  %62 = getelementptr inbounds double* %a, i64 %61, !dbg !376
  %63 = load double* %62, align 8, !dbg !376, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !366), !dbg !376
  %64 = add nsw i32 %52, 1, !dbg !377
  %65 = sext i32 %64 to i64, !dbg !377
  %66 = getelementptr inbounds double* %a, i64 %65, !dbg !377
  %67 = load double* %66, align 8, !dbg !377, !tbaa !242
  %68 = fsub double -0.000000e+00, %67, !dbg !377
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !368), !dbg !377
  store double %63, double* %54, align 8, !dbg !378, !tbaa !242
  store double %68, double* %58, align 8, !dbg !379, !tbaa !242
  store double %55, double* %62, align 8, !dbg !380, !tbaa !242
  store double %60, double* %66, align 8, !dbg !381, !tbaa !242
  %69 = add nsw i32 %51, %19, !dbg !382
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !359), !dbg !382
  %70 = sub nsw i32 %52, %19, !dbg !383
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !360), !dbg !383
  %71 = sext i32 %69 to i64, !dbg !384
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !384
  %73 = load double* %72, align 8, !dbg !384, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !362), !dbg !384
  %74 = add nsw i32 %69, 1, !dbg !385
  %75 = sext i32 %74 to i64, !dbg !385
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !385
  %77 = load double* %76, align 8, !dbg !385, !tbaa !242
  %78 = fsub double -0.000000e+00, %77, !dbg !385
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !364), !dbg !385
  %79 = sext i32 %70 to i64, !dbg !386
  %80 = getelementptr inbounds double* %a, i64 %79, !dbg !386
  %81 = load double* %80, align 8, !dbg !386, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !366), !dbg !386
  %82 = add nsw i32 %70, 1, !dbg !387
  %83 = sext i32 %82 to i64, !dbg !387
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !387
  %85 = load double* %84, align 8, !dbg !387, !tbaa !242
  %86 = fsub double -0.000000e+00, %85, !dbg !387
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !368), !dbg !387
  store double %81, double* %72, align 8, !dbg !388, !tbaa !242
  store double %86, double* %76, align 8, !dbg !389, !tbaa !242
  store double %73, double* %80, align 8, !dbg !390, !tbaa !242
  store double %78, double* %84, align 8, !dbg !391, !tbaa !242
  %87 = add nsw i32 %69, %19, !dbg !392
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !359), !dbg !392
  %88 = add nsw i32 %70, %23, !dbg !393
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !360), !dbg !393
  %89 = sext i32 %87 to i64, !dbg !394
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !394
  %91 = load double* %90, align 8, !dbg !394, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !362), !dbg !394
  %92 = add nsw i32 %87, 1, !dbg !395
  %93 = sext i32 %92 to i64, !dbg !395
  %94 = getelementptr inbounds double* %a, i64 %93, !dbg !395
  %95 = load double* %94, align 8, !dbg !395, !tbaa !242
  %96 = fsub double -0.000000e+00, %95, !dbg !395
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !364), !dbg !395
  %97 = sext i32 %88 to i64, !dbg !396
  %98 = getelementptr inbounds double* %a, i64 %97, !dbg !396
  %99 = load double* %98, align 8, !dbg !396, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !366), !dbg !396
  %100 = add nsw i32 %88, 1, !dbg !397
  %101 = sext i32 %100 to i64, !dbg !397
  %102 = getelementptr inbounds double* %a, i64 %101, !dbg !397
  %103 = load double* %102, align 8, !dbg !397, !tbaa !242
  %104 = fsub double -0.000000e+00, %103, !dbg !397
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !368), !dbg !397
  store double %99, double* %90, align 8, !dbg !398, !tbaa !242
  store double %104, double* %94, align 8, !dbg !399, !tbaa !242
  store double %91, double* %98, align 8, !dbg !400, !tbaa !242
  store double %96, double* %102, align 8, !dbg !401, !tbaa !242
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !356
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !356
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !356
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i, !dbg !356

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.preheader.i
  %105 = add nsw i32 %27, %28, !dbg !402
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !360), !dbg !402
  %106 = add nsw i32 %105, 1, !dbg !403
  %107 = sext i32 %106 to i64, !dbg !403
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !403
  %109 = load double* %108, align 8, !dbg !403, !tbaa !242
  %110 = fsub double -0.000000e+00, %109, !dbg !403
  store double %110, double* %108, align 8, !dbg !403, !tbaa !242
  %111 = add nsw i32 %105, %19, !dbg !404
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !359), !dbg !404
  %112 = add nsw i32 %111, %19, !dbg !405
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !360), !dbg !405
  %113 = sext i32 %111 to i64, !dbg !406
  %114 = getelementptr inbounds double* %a, i64 %113, !dbg !406
  %115 = load double* %114, align 8, !dbg !406, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %115}, i64 0, metadata !362), !dbg !406
  %116 = add nsw i32 %111, 1, !dbg !407
  %117 = sext i32 %116 to i64, !dbg !407
  %118 = getelementptr inbounds double* %a, i64 %117, !dbg !407
  %119 = load double* %118, align 8, !dbg !407, !tbaa !242
  %120 = fsub double -0.000000e+00, %119, !dbg !407
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !364), !dbg !407
  %121 = sext i32 %112 to i64, !dbg !408
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !408
  %123 = load double* %122, align 8, !dbg !408, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %123}, i64 0, metadata !366), !dbg !408
  %124 = add nsw i32 %112, 1, !dbg !409
  %125 = sext i32 %124 to i64, !dbg !409
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !409
  %127 = load double* %126, align 8, !dbg !409, !tbaa !242
  %128 = fsub double -0.000000e+00, %127, !dbg !409
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !368), !dbg !409
  store double %123, double* %114, align 8, !dbg !410, !tbaa !242
  store double %128, double* %118, align 8, !dbg !411, !tbaa !242
  store double %115, double* %122, align 8, !dbg !412, !tbaa !242
  store double %120, double* %126, align 8, !dbg !413, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !360), !dbg !351
  %129 = add i32 %112, %22, !dbg !414
  %130 = sext i32 %129 to i64, !dbg !414
  %131 = getelementptr inbounds double* %a, i64 %130, !dbg !414
  %132 = load double* %131, align 8, !dbg !414, !tbaa !242
  %133 = fsub double -0.000000e+00, %132, !dbg !414
  store double %133, double* %131, align 8, !dbg !414, !tbaa !242
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !348
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !348
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !415), !dbg !348
  %lftr.wideiv14 = trunc i64 %indvars.iv.next28.i to i32, !dbg !348
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %m.0.lcssa.i, !dbg !348
  br i1 %exitcond15, label %bitrv2conj.exit, label %.preheader.i, !dbg !348

; <label>:134                                     ; preds = %._crit_edge19.i
  %135 = getelementptr inbounds double* %a, i64 1, !dbg !416
  %136 = load double* %135, align 8, !dbg !416, !tbaa !242
  %137 = fsub double -0.000000e+00, %136, !dbg !416
  store double %137, double* %135, align 8, !dbg !416, !tbaa !242
  %138 = or i32 %19, 1, !dbg !418
  %139 = sext i32 %138 to i64, !dbg !418
  %140 = getelementptr inbounds double* %a, i64 %139, !dbg !418
  %141 = load double* %140, align 8, !dbg !418, !tbaa !242
  %142 = fsub double -0.000000e+00, %141, !dbg !418
  store double %142, double* %140, align 8, !dbg !418, !tbaa !242
  tail call void @llvm.dbg.value(metadata !332, i64 0, metadata !415), !dbg !419
  %143 = icmp sgt i32 %m.0.lcssa.i, 1, !dbg !419
  br i1 %143, label %.lr.ph7.i, label %bitrv2conj.exit, !dbg !419

.lr.ph7.i:                                        ; preds = %134, %._crit_edge8.i
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %._crit_edge8.i ], [ 1, %134 ]
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %._crit_edge8.i ], [ 1, %134 ]
  %144 = getelementptr inbounds i32* %ip, i64 %indvars.iv37.i, !dbg !421
  %145 = load i32* %144, align 4, !dbg !421, !tbaa !328
  %146 = trunc i64 %indvars.iv37.i to i32, !dbg !425
  %147 = shl nsw i32 %146, 1, !dbg !425
  br label %148, !dbg !426

; <label>:148                                     ; preds = %148, %.lr.ph7.i
  %indvars.iv31.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next32.i, %148 ]
  %149 = trunc i64 %indvars.iv31.i to i32, !dbg !421
  %150 = shl nsw i32 %149, 1, !dbg !421
  %151 = add nsw i32 %150, %145, !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %151}, i64 0, metadata !359), !dbg !421
  %152 = getelementptr inbounds i32* %ip, i64 %indvars.iv31.i, !dbg !425
  %153 = load i32* %152, align 4, !dbg !425, !tbaa !328
  %154 = add nsw i32 %153, %147, !dbg !425
  tail call void @llvm.dbg.value(metadata !{i32 %154}, i64 0, metadata !360), !dbg !425
  %155 = sext i32 %151 to i64, !dbg !427
  %156 = getelementptr inbounds double* %a, i64 %155, !dbg !427
  %157 = load double* %156, align 8, !dbg !427, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %157}, i64 0, metadata !362), !dbg !427
  %158 = add nsw i32 %151, 1, !dbg !428
  %159 = sext i32 %158 to i64, !dbg !428
  %160 = getelementptr inbounds double* %a, i64 %159, !dbg !428
  %161 = load double* %160, align 8, !dbg !428, !tbaa !242
  %162 = fsub double -0.000000e+00, %161, !dbg !428
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !364), !dbg !428
  %163 = sext i32 %154 to i64, !dbg !429
  %164 = getelementptr inbounds double* %a, i64 %163, !dbg !429
  %165 = load double* %164, align 8, !dbg !429, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %165}, i64 0, metadata !366), !dbg !429
  %166 = add nsw i32 %154, 1, !dbg !430
  %167 = sext i32 %166 to i64, !dbg !430
  %168 = getelementptr inbounds double* %a, i64 %167, !dbg !430
  %169 = load double* %168, align 8, !dbg !430, !tbaa !242
  %170 = fsub double -0.000000e+00, %169, !dbg !430
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !368), !dbg !430
  store double %165, double* %156, align 8, !dbg !431, !tbaa !242
  store double %170, double* %160, align 8, !dbg !432, !tbaa !242
  store double %157, double* %164, align 8, !dbg !433, !tbaa !242
  store double %162, double* %168, align 8, !dbg !434, !tbaa !242
  %171 = add nsw i32 %151, %19, !dbg !435
  tail call void @llvm.dbg.value(metadata !{i32 %171}, i64 0, metadata !359), !dbg !435
  %172 = add nsw i32 %154, %19, !dbg !436
  tail call void @llvm.dbg.value(metadata !{i32 %172}, i64 0, metadata !360), !dbg !436
  %173 = sext i32 %171 to i64, !dbg !437
  %174 = getelementptr inbounds double* %a, i64 %173, !dbg !437
  %175 = load double* %174, align 8, !dbg !437, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !362), !dbg !437
  %176 = add nsw i32 %171, 1, !dbg !438
  %177 = sext i32 %176 to i64, !dbg !438
  %178 = getelementptr inbounds double* %a, i64 %177, !dbg !438
  %179 = load double* %178, align 8, !dbg !438, !tbaa !242
  %180 = fsub double -0.000000e+00, %179, !dbg !438
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !364), !dbg !438
  %181 = sext i32 %172 to i64, !dbg !439
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !439
  %183 = load double* %182, align 8, !dbg !439, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !366), !dbg !439
  %184 = add nsw i32 %172, 1, !dbg !440
  %185 = sext i32 %184 to i64, !dbg !440
  %186 = getelementptr inbounds double* %a, i64 %185, !dbg !440
  %187 = load double* %186, align 8, !dbg !440, !tbaa !242
  %188 = fsub double -0.000000e+00, %187, !dbg !440
  tail call void @llvm.dbg.value(metadata !{double %188}, i64 0, metadata !368), !dbg !440
  store double %183, double* %174, align 8, !dbg !441, !tbaa !242
  store double %188, double* %178, align 8, !dbg !442, !tbaa !242
  store double %175, double* %182, align 8, !dbg !443, !tbaa !242
  store double %180, double* %186, align 8, !dbg !444, !tbaa !242
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !426
  %lftr.wideiv18 = trunc i64 %indvars.iv.next32.i to i32, !dbg !426
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %indvars.iv16, !dbg !426
  br i1 %exitcond19, label %._crit_edge8.i, label %148, !dbg !426

._crit_edge8.i:                                   ; preds = %148
  %189 = add nsw i32 %145, %147, !dbg !445
  tail call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !360), !dbg !445
  %190 = add nsw i32 %189, 1, !dbg !446
  %191 = sext i32 %190 to i64, !dbg !446
  %192 = getelementptr inbounds double* %a, i64 %191, !dbg !446
  %193 = load double* %192, align 8, !dbg !446, !tbaa !242
  %194 = fsub double -0.000000e+00, %193, !dbg !446
  store double %194, double* %192, align 8, !dbg !446, !tbaa !242
  %195 = add i32 %189, %138, !dbg !447
  %196 = sext i32 %195 to i64, !dbg !447
  %197 = getelementptr inbounds double* %a, i64 %196, !dbg !447
  %198 = load double* %197, align 8, !dbg !447, !tbaa !242
  %199 = fsub double -0.000000e+00, %198, !dbg !447
  store double %199, double* %197, align 8, !dbg !447, !tbaa !242
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1, !dbg !419
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, 1, !dbg !419
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next17}, i64 0, metadata !415), !dbg !419
  %lftr.wideiv20 = trunc i64 %indvars.iv.next38.i to i32, !dbg !419
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %m.0.lcssa.i, !dbg !419
  br i1 %exitcond21, label %bitrv2conj.exit, label %.lr.ph7.i, !dbg !419

bitrv2conj.exit:                                  ; preds = %._crit_edge8.i, %._crit_edge.i, %.preheader1.i, %134
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !448) #6, !dbg !450
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !451) #6, !dbg !450
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !452) #6, !dbg !450
  tail call void @llvm.dbg.value(metadata !453, i64 0, metadata !454) #6, !dbg !455
  br i1 %6, label %200, label %.loopexit3.i, !dbg !456

; <label>:200                                     ; preds = %bitrv2conj.exit
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #9, !dbg !458
  tail call void @llvm.dbg.value(metadata !460, i64 0, metadata !454) #6, !dbg !461
  %201 = icmp sgt i32 %n, 32, !dbg !462
  br i1 %201, label %.lr.ph8.i, label %.loopexit3.i, !dbg !462

.lr.ph8.i:                                        ; preds = %200, %.lr.ph8.i
  %202 = phi i32 [ %203, %.lr.ph8.i ], [ 32, %200 ]
  %l.07.i = phi i32 [ %202, %.lr.ph8.i ], [ 8, %200 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07.i, double* %a, double* %w) #9, !dbg !463
  tail call void @llvm.dbg.value(metadata !{i32 %202}, i64 0, metadata !454) #6, !dbg !465
  %203 = shl i32 %202, 2, !dbg !462
  %204 = icmp slt i32 %203, %n, !dbg !462
  br i1 %204, label %.lr.ph8.i, label %.loopexit3.i, !dbg !462

.loopexit3.i:                                     ; preds = %.lr.ph8.i, %200, %bitrv2conj.exit
  %l.1.i = phi i32 [ 2, %bitrv2conj.exit ], [ 8, %200 ], [ %202, %.lr.ph8.i ]
  %205 = shl i32 %l.1.i, 2, !dbg !466
  %206 = icmp eq i32 %205, %n, !dbg !466
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !468) #6, !dbg !469
  %207 = icmp sgt i32 %l.1.i, 0, !dbg !469
  br i1 %206, label %.preheader.i2, label %.preheader1.i1, !dbg !466

.preheader1.i1:                                   ; preds = %.loopexit3.i
  br i1 %207, label %.lr.ph6.i, label %cftbsub.exit, !dbg !472

.lr.ph6.i:                                        ; preds = %.preheader1.i1
  %208 = sext i32 %l.1.i to i64, !dbg !472
  br label %259, !dbg !472

.preheader.i2:                                    ; preds = %.loopexit3.i
  br i1 %207, label %.lr.ph.i3, label %cftbsub.exit, !dbg !469

.lr.ph.i3:                                        ; preds = %.preheader.i2
  %209 = sext i32 %l.1.i to i64, !dbg !469
  br label %210, !dbg !469

; <label>:210                                     ; preds = %210, %.lr.ph.i3
  %indvars.iv.i4 = phi i64 [ 0, %.lr.ph.i3 ], [ %indvars.iv.next.i5, %210 ]
  %211 = add nsw i64 %indvars.iv.i4, %209, !dbg !475
  %212 = add nsw i64 %211, %209, !dbg !477
  %213 = add nsw i64 %212, %209, !dbg !478
  %214 = getelementptr inbounds double* %a, i64 %indvars.iv.i4, !dbg !479
  %215 = load double* %214, align 8, !dbg !479, !tbaa !242
  %216 = getelementptr inbounds double* %a, i64 %211, !dbg !479
  %217 = load double* %216, align 8, !dbg !479, !tbaa !242
  %218 = fadd double %215, %217, !dbg !479
  tail call void @llvm.dbg.value(metadata !{double %218}, i64 0, metadata !480) #6, !dbg !479
  %219 = or i64 %indvars.iv.i4, 1, !dbg !481
  %220 = getelementptr inbounds double* %a, i64 %219, !dbg !481
  %221 = load double* %220, align 8, !dbg !481, !tbaa !242
  %222 = fsub double -0.000000e+00, %221, !dbg !481
  %223 = add nsw i64 %211, 1, !dbg !481
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !481
  %225 = load double* %224, align 8, !dbg !481, !tbaa !242
  %226 = fsub double %222, %225, !dbg !481
  tail call void @llvm.dbg.value(metadata !{double %226}, i64 0, metadata !482) #6, !dbg !481
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !484) #6, !dbg !485
  %227 = insertelement <2 x double> undef, double %215, i32 0, !dbg !485
  %228 = insertelement <2 x double> %227, double %225, i32 1, !dbg !485
  %229 = insertelement <2 x double> undef, double %217, i32 0, !dbg !485
  %230 = insertelement <2 x double> %229, double %221, i32 1, !dbg !485
  %231 = fsub <2 x double> %228, %230, !dbg !485
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !486) #6, !dbg !487
  %232 = getelementptr inbounds double* %a, i64 %212, !dbg !488
  %233 = load double* %232, align 8, !dbg !488, !tbaa !242
  %234 = getelementptr inbounds double* %a, i64 %213, !dbg !488
  %235 = load double* %234, align 8, !dbg !488, !tbaa !242
  %236 = fadd double %233, %235, !dbg !488
  tail call void @llvm.dbg.value(metadata !{double %236}, i64 0, metadata !489) #6, !dbg !488
  %237 = add nsw i64 %212, 1, !dbg !490
  %238 = getelementptr inbounds double* %a, i64 %237, !dbg !490
  %239 = load double* %238, align 8, !dbg !490, !tbaa !242
  %240 = add nsw i64 %213, 1, !dbg !490
  %241 = getelementptr inbounds double* %a, i64 %240, !dbg !490
  %242 = load double* %241, align 8, !dbg !490, !tbaa !242
  %243 = fadd double %239, %242, !dbg !490
  tail call void @llvm.dbg.value(metadata !{double %243}, i64 0, metadata !491) #6, !dbg !490
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !492) #6, !dbg !493
  %244 = insertelement <2 x double> undef, double %239, i32 0, !dbg !494
  %245 = insertelement <2 x double> %244, double %233, i32 1, !dbg !494
  %246 = insertelement <2 x double> undef, double %242, i32 0, !dbg !494
  %247 = insertelement <2 x double> %246, double %235, i32 1, !dbg !494
  %248 = fsub <2 x double> %245, %247, !dbg !494
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !495) #6, !dbg !494
  %249 = fadd double %218, %236, !dbg !496
  store double %249, double* %214, align 8, !dbg !496, !tbaa !242
  %250 = fsub double %226, %243, !dbg !497
  store double %250, double* %220, align 8, !dbg !497, !tbaa !242
  %251 = fsub double %218, %236, !dbg !498
  store double %251, double* %232, align 8, !dbg !498, !tbaa !242
  %252 = fadd double %226, %243, !dbg !499
  store double %252, double* %238, align 8, !dbg !499, !tbaa !242
  %253 = fsub <2 x double> %231, %248, !dbg !500
  %254 = bitcast double* %216 to <2 x double>*, !dbg !500
  store <2 x double> %253, <2 x double>* %254, align 8, !dbg !500, !tbaa !242
  %255 = fadd <2 x double> %231, %248, !dbg !501
  %256 = bitcast double* %234 to <2 x double>*, !dbg !501
  store <2 x double> %255, <2 x double>* %256, align 8, !dbg !501, !tbaa !242
  %indvars.iv.next.i5 = add nuw nsw i64 %indvars.iv.i4, 2, !dbg !469
  %257 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !469
  %258 = icmp slt i32 %257, %l.1.i, !dbg !469
  br i1 %258, label %210, label %cftbsub.exit, !dbg !469

; <label>:259                                     ; preds = %259, %.lr.ph6.i
  %indvars.iv9.i = phi i64 [ 0, %.lr.ph6.i ], [ %indvars.iv.next10.i, %259 ]
  %260 = add nsw i64 %indvars.iv9.i, %208, !dbg !502
  %261 = getelementptr inbounds double* %a, i64 %indvars.iv9.i, !dbg !504
  %262 = load double* %261, align 8, !dbg !504, !tbaa !242
  %263 = getelementptr inbounds double* %a, i64 %260, !dbg !504
  %264 = load double* %263, align 8, !dbg !504, !tbaa !242
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !480) #6, !dbg !504
  %265 = or i64 %indvars.iv9.i, 1, !dbg !505
  %266 = getelementptr inbounds double* %a, i64 %265, !dbg !505
  %267 = load double* %266, align 8, !dbg !505, !tbaa !242
  %268 = add nsw i64 %260, 1, !dbg !505
  %269 = getelementptr inbounds double* %a, i64 %268, !dbg !505
  %270 = load double* %269, align 8, !dbg !505, !tbaa !242
  %271 = insertelement <2 x double> undef, double %262, i32 0, !dbg !504
  %272 = insertelement <2 x double> %271, double %270, i32 1, !dbg !504
  %273 = insertelement <2 x double> undef, double %264, i32 0, !dbg !504
  %274 = insertelement <2 x double> %273, double %267, i32 1, !dbg !504
  %275 = fsub <2 x double> %272, %274, !dbg !504
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !482) #6, !dbg !505
  %276 = fadd double %262, %264, !dbg !506
  store double %276, double* %261, align 8, !dbg !506, !tbaa !242
  %277 = fsub double -0.000000e+00, %267, !dbg !507
  %278 = load double* %269, align 8, !dbg !507, !tbaa !242
  %279 = fsub double %277, %278, !dbg !507
  store double %279, double* %266, align 8, !dbg !507, !tbaa !242
  %280 = bitcast double* %263 to <2 x double>*, !dbg !508
  store <2 x double> %275, <2 x double>* %280, align 8, !dbg !508, !tbaa !242
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 2, !dbg !472
  %281 = trunc i64 %indvars.iv.next10.i to i32, !dbg !472
  %282 = icmp slt i32 %281, %l.1.i, !dbg !472
  br i1 %282, label %259, label %cftbsub.exit, !dbg !472

; <label>:283                                     ; preds = %0
  %284 = icmp eq i32 %n, 4, !dbg !509
  br i1 %284, label %285, label %cftbsub.exit, !dbg !509

; <label>:285                                     ; preds = %283
  tail call fastcc void @cftfsub(i32 4, double* %a, double* %w) #8, !dbg !511
  br label %cftbsub.exit, !dbg !513

cftbsub.exit:                                     ; preds = %259, %210, %.preheader.i2, %.preheader1.i1, %283, %285, %4
  ret void, !dbg !514
}

; Function Attrs: minsize nounwind optsize readonly uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* nocapture readonly %a) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !47), !dbg !515
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !48), !dbg !515
  tail call void @llvm.dbg.value(metadata !{double %scale}, i64 0, metadata !49), !dbg !515
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !50), !dbg !515
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !52), !dbg !516
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !53), !dbg !517
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !51), !dbg !518
  %1 = icmp sgt i32 %nini, %nend, !dbg !518
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !518

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !518

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %err.04 = phi double [ %err.0., %3 ], [ 0.000000e+00, %.lr.ph ]
  %seed.03 = phi i32 [ %phitmp2, %3 ], [ 54773, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03}, i64 0, metadata !52), !dbg !520
  %4 = sitofp i32 %seed.03 to double, !dbg !520
  %5 = fmul double %4, 0x3ED02E85C0898B71, !dbg !520
  %6 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !520
  %7 = load double* %6, align 8, !dbg !520, !tbaa !242
  %8 = fmul double %7, %scale, !dbg !520
  %9 = fsub double %5, %8, !dbg !520
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !54), !dbg !520
  %10 = tail call double @fabs(double %9) #10, !dbg !522
  %11 = fcmp ogt double %err.04, %10, !dbg !522
  %err.0. = select i1 %11, double %err.04, double %10, !dbg !522
  tail call void @llvm.dbg.value(metadata !{double %err.0.}, i64 0, metadata !53), !dbg !522
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !518
  %phitmp = mul i32 %seed.03, 7141, !dbg !518
  %phitmp1 = add i32 %phitmp, 54773, !dbg !518
  %phitmp2 = srem i32 %phitmp1, 259200, !dbg !518
  %12 = trunc i64 %indvars.iv to i32, !dbg !518
  %13 = icmp slt i32 %12, %nend, !dbg !518
  br i1 %13, label %3, label %._crit_edge, !dbg !518

._crit_edge:                                      ; preds = %3, %0
  %err.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %err.0., %3 ]
  ret double %err.0.lcssa, !dbg !523
}

; Function Attrs: minsize nounwind optsize readnone
declare double @fabs(double) #4

; Function Attrs: minsize nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: minsize noreturn nounwind optsize
declare void @abort() #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: minsize nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: minsize nounwind optsize
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define internal fastcc void @bitrv2(i32 %n, i32* nocapture %ip, double* %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !199), !dbg !524
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !200), !dbg !524
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !201), !dbg !524
  store i32 0, i32* %ip, align 4, !dbg !525, !tbaa !328
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !206), !dbg !526
  tail call void @llvm.dbg.value(metadata !332, i64 0, metadata !207), !dbg !527
  %1 = icmp sgt i32 %n, 8, !dbg !528
  br i1 %1, label %.lr.ph19, label %._crit_edge20, !dbg !528

.lr.ph19:                                         ; preds = %0, %._crit_edge14
  %m.016 = phi i32 [ %11, %._crit_edge14 ], [ 1, %0 ]
  %l.015 = phi i32 [ %2, %._crit_edge14 ], [ %n, %0 ]
  %2 = ashr i32 %l.015, 1, !dbg !529
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !206), !dbg !529
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !202), !dbg !531
  %3 = icmp sgt i32 %m.016, 0, !dbg !531
  br i1 %3, label %.lr.ph13, label %._crit_edge14, !dbg !531

.lr.ph13:                                         ; preds = %.lr.ph19
  %4 = sext i32 %m.016 to i64, !dbg !531
  br label %5, !dbg !531

; <label>:5                                       ; preds = %5, %.lr.ph13
  %indvars.iv42 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next43, %5 ]
  %6 = getelementptr inbounds i32* %ip, i64 %indvars.iv42, !dbg !533
  %7 = load i32* %6, align 4, !dbg !533, !tbaa !328
  %8 = add nsw i32 %7, %2, !dbg !533
  %9 = add nsw i64 %indvars.iv42, %4, !dbg !533
  %10 = getelementptr inbounds i32* %ip, i64 %9, !dbg !533
  store i32 %8, i32* %10, align 4, !dbg !533, !tbaa !328
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !531
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !531
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %m.016, !dbg !531
  br i1 %exitcond45, label %._crit_edge14, label %5, !dbg !531

._crit_edge14:                                    ; preds = %5, %.lr.ph19
  %11 = shl i32 %m.016, 1, !dbg !535
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !207), !dbg !535
  %12 = shl i32 %m.016, 4, !dbg !528
  %13 = icmp slt i32 %12, %2, !dbg !528
  br i1 %13, label %.lr.ph19, label %._crit_edge20, !dbg !528

._crit_edge20:                                    ; preds = %._crit_edge14, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %12, %._crit_edge14 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %11, %._crit_edge14 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge14 ]
  %14 = shl nsw i32 %m.0.lcssa, 1, !dbg !536
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !208), !dbg !536
  %15 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !537
  br i1 %15, label %.preheader1, label %.preheader3, !dbg !537

.preheader3:                                      ; preds = %._crit_edge20
  %16 = icmp sgt i32 %m.0.lcssa, 1, !dbg !539
  br i1 %16, label %.lr.ph8, label %.loopexit, !dbg !539

.preheader1:                                      ; preds = %._crit_edge20
  %17 = icmp sgt i32 %m.0.lcssa, 0, !dbg !542
  br i1 %17, label %.preheader.lr.ph, label %.loopexit, !dbg !542

.preheader.lr.ph:                                 ; preds = %.preheader1
  %18 = shl i32 %m.0.lcssa, 2, !dbg !545
  br label %.preheader, !dbg !542

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %19 = trunc i64 %indvars.iv28 to i32, !dbg !549
  %20 = icmp sgt i32 %19, 0, !dbg !549
  %21 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !550
  %22 = load i32* %21, align 4, !dbg !550, !tbaa !328
  %23 = shl i32 %19, 1, !dbg !551
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !549

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %24 = trunc i64 %indvars.iv to i32, !dbg !550
  %25 = shl nsw i32 %24, 1, !dbg !550
  %26 = add nsw i32 %22, %25, !dbg !550
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !203), !dbg !550
  %27 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !551
  %28 = load i32* %27, align 4, !dbg !551, !tbaa !328
  %29 = add nsw i32 %28, %23, !dbg !551
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !205), !dbg !551
  %30 = sext i32 %26 to i64, !dbg !552
  %31 = getelementptr inbounds double* %a, i64 %30, !dbg !552
  %32 = load double* %31, align 8, !dbg !552, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !209), !dbg !552
  %33 = add nsw i32 %26, 1, !dbg !553
  %34 = sext i32 %33 to i64, !dbg !553
  %35 = getelementptr inbounds double* %a, i64 %34, !dbg !553
  %36 = load double* %35, align 8, !dbg !553, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %36}, i64 0, metadata !210), !dbg !553
  %37 = sext i32 %29 to i64, !dbg !554
  %38 = getelementptr inbounds double* %a, i64 %37, !dbg !554
  %39 = load double* %38, align 8, !dbg !554, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !211), !dbg !554
  %40 = add nsw i32 %29, 1, !dbg !555
  %41 = sext i32 %40 to i64, !dbg !555
  %42 = getelementptr inbounds double* %a, i64 %41, !dbg !555
  %43 = load double* %42, align 8, !dbg !555, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %43}, i64 0, metadata !212), !dbg !555
  store double %39, double* %31, align 8, !dbg !556, !tbaa !242
  store double %43, double* %35, align 8, !dbg !557, !tbaa !242
  store double %32, double* %38, align 8, !dbg !558, !tbaa !242
  store double %36, double* %42, align 8, !dbg !559, !tbaa !242
  %44 = add nsw i32 %26, %14, !dbg !560
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !203), !dbg !560
  %45 = add nsw i32 %29, %18, !dbg !545
  tail call void @llvm.dbg.value(metadata !{i32 %45}, i64 0, metadata !205), !dbg !545
  %46 = sext i32 %44 to i64, !dbg !561
  %47 = getelementptr inbounds double* %a, i64 %46, !dbg !561
  %48 = load double* %47, align 8, !dbg !561, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %48}, i64 0, metadata !209), !dbg !561
  %49 = add nsw i32 %44, 1, !dbg !562
  %50 = sext i32 %49 to i64, !dbg !562
  %51 = getelementptr inbounds double* %a, i64 %50, !dbg !562
  %52 = load double* %51, align 8, !dbg !562, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %52}, i64 0, metadata !210), !dbg !562
  %53 = sext i32 %45 to i64, !dbg !563
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !563
  %55 = load double* %54, align 8, !dbg !563, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !211), !dbg !563
  %56 = add nsw i32 %45, 1, !dbg !564
  %57 = sext i32 %56 to i64, !dbg !564
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !564
  %59 = load double* %58, align 8, !dbg !564, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %59}, i64 0, metadata !212), !dbg !564
  store double %55, double* %47, align 8, !dbg !565, !tbaa !242
  store double %59, double* %51, align 8, !dbg !566, !tbaa !242
  store double %48, double* %54, align 8, !dbg !567, !tbaa !242
  store double %52, double* %58, align 8, !dbg !568, !tbaa !242
  %60 = add nsw i32 %44, %14, !dbg !569
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !203), !dbg !569
  %61 = sub nsw i32 %45, %14, !dbg !570
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !205), !dbg !570
  %62 = sext i32 %60 to i64, !dbg !571
  %63 = getelementptr inbounds double* %a, i64 %62, !dbg !571
  %64 = load double* %63, align 8, !dbg !571, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !209), !dbg !571
  %65 = add nsw i32 %60, 1, !dbg !572
  %66 = sext i32 %65 to i64, !dbg !572
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !572
  %68 = load double* %67, align 8, !dbg !572, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !210), !dbg !572
  %69 = sext i32 %61 to i64, !dbg !573
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !573
  %71 = load double* %70, align 8, !dbg !573, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !211), !dbg !573
  %72 = add nsw i32 %61, 1, !dbg !574
  %73 = sext i32 %72 to i64, !dbg !574
  %74 = getelementptr inbounds double* %a, i64 %73, !dbg !574
  %75 = load double* %74, align 8, !dbg !574, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %75}, i64 0, metadata !212), !dbg !574
  store double %71, double* %63, align 8, !dbg !575, !tbaa !242
  store double %75, double* %67, align 8, !dbg !576, !tbaa !242
  store double %64, double* %70, align 8, !dbg !577, !tbaa !242
  store double %68, double* %74, align 8, !dbg !578, !tbaa !242
  %76 = add nsw i32 %60, %14, !dbg !579
  tail call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !203), !dbg !579
  %77 = add nsw i32 %61, %18, !dbg !580
  tail call void @llvm.dbg.value(metadata !{i32 %77}, i64 0, metadata !205), !dbg !580
  %78 = sext i32 %76 to i64, !dbg !581
  %79 = getelementptr inbounds double* %a, i64 %78, !dbg !581
  %80 = load double* %79, align 8, !dbg !581, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !209), !dbg !581
  %81 = add nsw i32 %76, 1, !dbg !582
  %82 = sext i32 %81 to i64, !dbg !582
  %83 = getelementptr inbounds double* %a, i64 %82, !dbg !582
  %84 = load double* %83, align 8, !dbg !582, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !210), !dbg !582
  %85 = sext i32 %77 to i64, !dbg !583
  %86 = getelementptr inbounds double* %a, i64 %85, !dbg !583
  %87 = load double* %86, align 8, !dbg !583, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !211), !dbg !583
  %88 = add nsw i32 %77, 1, !dbg !584
  %89 = sext i32 %88 to i64, !dbg !584
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !584
  %91 = load double* %90, align 8, !dbg !584, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !212), !dbg !584
  store double %87, double* %79, align 8, !dbg !585, !tbaa !242
  store double %91, double* %83, align 8, !dbg !586, !tbaa !242
  store double %80, double* %86, align 8, !dbg !587, !tbaa !242
  store double %84, double* %90, align 8, !dbg !588, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !549
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !549
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv26, !dbg !549
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !549

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %92 = add nsw i32 %23, %14, !dbg !589
  %93 = add nsw i32 %92, %22, !dbg !589
  tail call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !203), !dbg !589
  %94 = add nsw i32 %93, %14, !dbg !590
  tail call void @llvm.dbg.value(metadata !{i32 %94}, i64 0, metadata !205), !dbg !590
  %95 = sext i32 %93 to i64, !dbg !591
  %96 = getelementptr inbounds double* %a, i64 %95, !dbg !591
  %97 = load double* %96, align 8, !dbg !591, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %97}, i64 0, metadata !209), !dbg !591
  %98 = add nsw i32 %93, 1, !dbg !592
  %99 = sext i32 %98 to i64, !dbg !592
  %100 = getelementptr inbounds double* %a, i64 %99, !dbg !592
  %101 = load double* %100, align 8, !dbg !592, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !210), !dbg !592
  %102 = sext i32 %94 to i64, !dbg !593
  %103 = getelementptr inbounds double* %a, i64 %102, !dbg !593
  %104 = load double* %103, align 8, !dbg !593, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !211), !dbg !593
  %105 = add nsw i32 %94, 1, !dbg !594
  %106 = sext i32 %105 to i64, !dbg !594
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !594
  %108 = load double* %107, align 8, !dbg !594, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %108}, i64 0, metadata !212), !dbg !594
  store double %104, double* %96, align 8, !dbg !595, !tbaa !242
  store double %108, double* %100, align 8, !dbg !596, !tbaa !242
  store double %97, double* %103, align 8, !dbg !597, !tbaa !242
  store double %101, double* %107, align 8, !dbg !598, !tbaa !242
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !542
  %indvars.iv.next27 = add nuw nsw i32 %indvars.iv26, 1, !dbg !542
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next27}, i64 0, metadata !204), !dbg !542
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !542
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %m.0.lcssa, !dbg !542
  br i1 %exitcond31, label %.loopexit, label %.preheader, !dbg !542

.lr.ph8:                                          ; preds = %.preheader3, %._crit_edge9
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge9 ], [ 1, %.preheader3 ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge9 ], [ 1, %.preheader3 ]
  %109 = getelementptr inbounds i32* %ip, i64 %indvars.iv38, !dbg !599
  %110 = load i32* %109, align 4, !dbg !599, !tbaa !328
  %111 = trunc i64 %indvars.iv38 to i32, !dbg !603
  %112 = shl nsw i32 %111, 1, !dbg !603
  br label %113, !dbg !604

; <label>:113                                     ; preds = %113, %.lr.ph8
  %indvars.iv32 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next33, %113 ]
  %114 = trunc i64 %indvars.iv32 to i32, !dbg !599
  %115 = shl nsw i32 %114, 1, !dbg !599
  %116 = add nsw i32 %110, %115, !dbg !599
  tail call void @llvm.dbg.value(metadata !{i32 %116}, i64 0, metadata !203), !dbg !599
  %117 = getelementptr inbounds i32* %ip, i64 %indvars.iv32, !dbg !603
  %118 = load i32* %117, align 4, !dbg !603, !tbaa !328
  %119 = add nsw i32 %118, %112, !dbg !603
  tail call void @llvm.dbg.value(metadata !{i32 %119}, i64 0, metadata !205), !dbg !603
  %120 = sext i32 %116 to i64, !dbg !605
  %121 = getelementptr inbounds double* %a, i64 %120, !dbg !605
  %122 = load double* %121, align 8, !dbg !605, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !209), !dbg !605
  %123 = add nsw i32 %116, 1, !dbg !606
  %124 = sext i32 %123 to i64, !dbg !606
  %125 = getelementptr inbounds double* %a, i64 %124, !dbg !606
  %126 = load double* %125, align 8, !dbg !606, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !210), !dbg !606
  %127 = sext i32 %119 to i64, !dbg !607
  %128 = getelementptr inbounds double* %a, i64 %127, !dbg !607
  %129 = load double* %128, align 8, !dbg !607, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %129}, i64 0, metadata !211), !dbg !607
  %130 = add nsw i32 %119, 1, !dbg !608
  %131 = sext i32 %130 to i64, !dbg !608
  %132 = getelementptr inbounds double* %a, i64 %131, !dbg !608
  %133 = load double* %132, align 8, !dbg !608, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %133}, i64 0, metadata !212), !dbg !608
  store double %129, double* %121, align 8, !dbg !609, !tbaa !242
  store double %133, double* %125, align 8, !dbg !610, !tbaa !242
  store double %122, double* %128, align 8, !dbg !611, !tbaa !242
  store double %126, double* %132, align 8, !dbg !612, !tbaa !242
  %134 = add nsw i32 %116, %14, !dbg !613
  tail call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !203), !dbg !613
  %135 = add nsw i32 %119, %14, !dbg !614
  tail call void @llvm.dbg.value(metadata !{i32 %135}, i64 0, metadata !205), !dbg !614
  %136 = sext i32 %134 to i64, !dbg !615
  %137 = getelementptr inbounds double* %a, i64 %136, !dbg !615
  %138 = load double* %137, align 8, !dbg !615, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !209), !dbg !615
  %139 = add nsw i32 %134, 1, !dbg !616
  %140 = sext i32 %139 to i64, !dbg !616
  %141 = getelementptr inbounds double* %a, i64 %140, !dbg !616
  %142 = load double* %141, align 8, !dbg !616, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %142}, i64 0, metadata !210), !dbg !616
  %143 = sext i32 %135 to i64, !dbg !617
  %144 = getelementptr inbounds double* %a, i64 %143, !dbg !617
  %145 = load double* %144, align 8, !dbg !617, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %145}, i64 0, metadata !211), !dbg !617
  %146 = add nsw i32 %135, 1, !dbg !618
  %147 = sext i32 %146 to i64, !dbg !618
  %148 = getelementptr inbounds double* %a, i64 %147, !dbg !618
  %149 = load double* %148, align 8, !dbg !618, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %149}, i64 0, metadata !212), !dbg !618
  store double %145, double* %137, align 8, !dbg !619, !tbaa !242
  store double %149, double* %141, align 8, !dbg !620, !tbaa !242
  store double %138, double* %144, align 8, !dbg !621, !tbaa !242
  store double %142, double* %148, align 8, !dbg !622, !tbaa !242
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !604
  %lftr.wideiv36 = trunc i64 %indvars.iv.next33 to i32, !dbg !604
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %indvars.iv34, !dbg !604
  br i1 %exitcond37, label %._crit_edge9, label %113, !dbg !604

._crit_edge9:                                     ; preds = %113
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !539
  %indvars.iv.next35 = add nuw nsw i32 %indvars.iv34, 1, !dbg !539
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next35}, i64 0, metadata !204), !dbg !539
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !539
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %m.0.lcssa, !dbg !539
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8, !dbg !539

.loopexit:                                        ; preds = %._crit_edge9, %._crit_edge, %.preheader3, %.preheader1
  ret void, !dbg !623
}

; Function Attrs: minsize nounwind optsize uwtable
define internal fastcc void @cftfsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !165), !dbg !624
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !166), !dbg !624
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !167), !dbg !624
  tail call void @llvm.dbg.value(metadata !453, i64 0, metadata !172), !dbg !625
  %1 = icmp sgt i32 %n, 8, !dbg !626
  br i1 %1, label %2, label %.loopexit3, !dbg !626

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #8, !dbg !628
  tail call void @llvm.dbg.value(metadata !460, i64 0, metadata !172), !dbg !630
  %3 = icmp sgt i32 %n, 32, !dbg !631
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !631

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w) #8, !dbg !632
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !172), !dbg !634
  %5 = shl i32 %4, 2, !dbg !631
  %6 = icmp slt i32 %5, %n, !dbg !631
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !631

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !635
  %8 = icmp eq i32 %7, %n, !dbg !635
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !168), !dbg !637
  %9 = icmp sgt i32 %l.1, 0, !dbg !637
  br i1 %8, label %.preheader, label %.preheader1, !dbg !635

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !640

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !640
  br label %56, !dbg !640

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !637

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !637
  br label %12, !dbg !637

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = add nsw i64 %indvars.iv, %11, !dbg !643
  %14 = add nsw i64 %13, %11, !dbg !645
  %15 = add nsw i64 %14, %11, !dbg !646
  %16 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !647
  %17 = getelementptr inbounds double* %a, i64 %13, !dbg !647
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !173), !dbg !647
  %18 = bitcast double* %16 to <2 x double>*, !dbg !647
  %19 = load <2 x double>* %18, align 8, !dbg !647, !tbaa !242
  %20 = add nsw i64 %13, 1, !dbg !648
  %21 = getelementptr inbounds double* %a, i64 %20, !dbg !648
  %22 = bitcast double* %17 to <2 x double>*, !dbg !647
  %23 = load <2 x double>* %22, align 8, !dbg !647, !tbaa !242
  %24 = fadd <2 x double> %19, %23, !dbg !647
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !174), !dbg !648
  %25 = extractelement <2 x double> %19, i32 0, !dbg !649
  %26 = extractelement <2 x double> %23, i32 0, !dbg !649
  %27 = fsub double %25, %26, !dbg !649
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !175), !dbg !649
  %28 = extractelement <2 x double> %19, i32 1, !dbg !650
  %29 = extractelement <2 x double> %23, i32 1, !dbg !650
  %30 = fsub double %28, %29, !dbg !650
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !176), !dbg !650
  %31 = getelementptr inbounds double* %a, i64 %14, !dbg !651
  %32 = getelementptr inbounds double* %a, i64 %15, !dbg !651
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !177), !dbg !651
  %33 = bitcast double* %31 to <2 x double>*, !dbg !651
  %34 = load <2 x double>* %33, align 8, !dbg !651, !tbaa !242
  %35 = add nsw i64 %15, 1, !dbg !652
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !652
  %37 = bitcast double* %32 to <2 x double>*, !dbg !651
  %38 = load <2 x double>* %37, align 8, !dbg !651, !tbaa !242
  %39 = fadd <2 x double> %34, %38, !dbg !651
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !178), !dbg !652
  %40 = extractelement <2 x double> %34, i32 0, !dbg !653
  %41 = extractelement <2 x double> %38, i32 0, !dbg !653
  %42 = fsub double %40, %41, !dbg !653
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !179), !dbg !653
  %43 = extractelement <2 x double> %34, i32 1, !dbg !654
  %44 = extractelement <2 x double> %38, i32 1, !dbg !654
  %45 = fsub double %43, %44, !dbg !654
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !180), !dbg !654
  %46 = fadd <2 x double> %24, %39, !dbg !655
  %47 = bitcast double* %16 to <2 x double>*, !dbg !655
  store <2 x double> %46, <2 x double>* %47, align 8, !dbg !655, !tbaa !242
  %48 = fsub <2 x double> %24, %39, !dbg !656
  %49 = bitcast double* %31 to <2 x double>*, !dbg !656
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !656, !tbaa !242
  %50 = fsub double %27, %45, !dbg !657
  store double %50, double* %17, align 8, !dbg !657, !tbaa !242
  %51 = fadd double %30, %42, !dbg !658
  store double %51, double* %21, align 8, !dbg !658, !tbaa !242
  %52 = fadd double %27, %45, !dbg !659
  store double %52, double* %32, align 8, !dbg !659, !tbaa !242
  %53 = fsub double %30, %42, !dbg !660
  store double %53, double* %36, align 8, !dbg !660, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !637
  %54 = trunc i64 %indvars.iv.next to i32, !dbg !637
  %55 = icmp slt i32 %54, %l.1, !dbg !637
  br i1 %55, label %12, label %.loopexit, !dbg !637

; <label>:56                                      ; preds = %.lr.ph6, %56
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %56 ]
  %57 = add nsw i64 %indvars.iv9, %10, !dbg !661
  %58 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !663
  %59 = getelementptr inbounds double* %a, i64 %57, !dbg !663
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !173), !dbg !663
  %60 = or i64 %indvars.iv9, 1, !dbg !664
  %61 = getelementptr inbounds double* %a, i64 %60, !dbg !664
  %62 = bitcast double* %58 to <2 x double>*, !dbg !663
  %63 = load <2 x double>* %62, align 8, !dbg !663, !tbaa !242
  %64 = add nsw i64 %57, 1, !dbg !664
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !664
  %66 = bitcast double* %59 to <2 x double>*, !dbg !663
  %67 = load <2 x double>* %66, align 8, !dbg !663, !tbaa !242
  %68 = fsub <2 x double> %63, %67, !dbg !663
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !174), !dbg !664
  %69 = extractelement <2 x double> %63, i32 0, !dbg !665
  %70 = extractelement <2 x double> %67, i32 0, !dbg !665
  %71 = fadd double %69, %70, !dbg !665
  store double %71, double* %58, align 8, !dbg !665, !tbaa !242
  %72 = load double* %65, align 8, !dbg !666, !tbaa !242
  %73 = extractelement <2 x double> %63, i32 1, !dbg !666
  %74 = fadd double %72, %73, !dbg !666
  store double %74, double* %61, align 8, !dbg !666, !tbaa !242
  %75 = bitcast double* %59 to <2 x double>*, !dbg !667
  store <2 x double> %68, <2 x double>* %75, align 8, !dbg !667, !tbaa !242
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !640
  %76 = trunc i64 %indvars.iv.next10 to i32, !dbg !640
  %77 = icmp slt i32 %76, %l.1, !dbg !640
  br i1 %77, label %56, label %.loopexit, !dbg !640

.loopexit:                                        ; preds = %56, %12, %.preheader1, %.preheader
  ret void, !dbg !668
}

; Function Attrs: minsize nounwind optsize
declare double @cos(double) #2

; Function Attrs: minsize nounwind optsize
declare double @sin(double) #2

; Function Attrs: inlinehint minsize nounwind optsize uwtable
define internal fastcc void @cft1st(i32 %n, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !143), !dbg !669
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !144), !dbg !669
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !145), !dbg !669
  %1 = getelementptr inbounds double* %a, i64 2, !dbg !670
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !155), !dbg !670
  %2 = bitcast double* %a to <2 x double>*, !dbg !670
  %3 = load <2 x double>* %2, align 8, !dbg !670, !tbaa !242
  %4 = getelementptr inbounds double* %a, i64 3, !dbg !671
  %5 = bitcast double* %1 to <2 x double>*, !dbg !670
  %6 = load <2 x double>* %5, align 8, !dbg !670, !tbaa !242
  %7 = fadd <2 x double> %3, %6, !dbg !670
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !156), !dbg !671
  %8 = extractelement <2 x double> %3, i32 0, !dbg !672
  %9 = extractelement <2 x double> %6, i32 0, !dbg !672
  %10 = fsub double %8, %9, !dbg !672
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !157), !dbg !672
  %11 = extractelement <2 x double> %3, i32 1, !dbg !673
  %12 = extractelement <2 x double> %6, i32 1, !dbg !673
  %13 = fsub double %11, %12, !dbg !673
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !158), !dbg !673
  %14 = getelementptr inbounds double* %a, i64 4, !dbg !674
  %15 = getelementptr inbounds double* %a, i64 6, !dbg !674
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !159), !dbg !674
  %16 = bitcast double* %14 to <2 x double>*, !dbg !674
  %17 = load <2 x double>* %16, align 8, !dbg !674, !tbaa !242
  %18 = getelementptr inbounds double* %a, i64 7, !dbg !675
  %19 = bitcast double* %15 to <2 x double>*, !dbg !674
  %20 = load <2 x double>* %19, align 8, !dbg !674, !tbaa !242
  %21 = fadd <2 x double> %17, %20, !dbg !674
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !160), !dbg !675
  %22 = extractelement <2 x double> %17, i32 0, !dbg !676
  %23 = extractelement <2 x double> %20, i32 0, !dbg !676
  %24 = fsub double %22, %23, !dbg !676
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !161), !dbg !676
  %25 = extractelement <2 x double> %17, i32 1, !dbg !677
  %26 = extractelement <2 x double> %20, i32 1, !dbg !677
  %27 = fsub double %25, %26, !dbg !677
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !162), !dbg !677
  %28 = fadd <2 x double> %7, %21, !dbg !678
  %29 = bitcast double* %a to <2 x double>*, !dbg !678
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !678, !tbaa !242
  %30 = fsub <2 x double> %7, %21, !dbg !679
  %31 = bitcast double* %14 to <2 x double>*, !dbg !679
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !679, !tbaa !242
  %32 = fsub double %10, %27, !dbg !680
  store double %32, double* %1, align 8, !dbg !680, !tbaa !242
  %33 = fadd double %13, %24, !dbg !681
  store double %33, double* %4, align 8, !dbg !681, !tbaa !242
  %34 = fadd double %10, %27, !dbg !682
  store double %34, double* %15, align 8, !dbg !682, !tbaa !242
  %35 = fsub double %13, %24, !dbg !683
  store double %35, double* %18, align 8, !dbg !683, !tbaa !242
  %36 = getelementptr inbounds double* %w, i64 2, !dbg !684
  %37 = load double* %36, align 8, !dbg !684, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !149), !dbg !684
  %38 = getelementptr inbounds double* %a, i64 8, !dbg !685
  %39 = getelementptr inbounds double* %a, i64 10, !dbg !685
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !155), !dbg !685
  %40 = bitcast double* %38 to <2 x double>*, !dbg !685
  %41 = load <2 x double>* %40, align 8, !dbg !685, !tbaa !242
  %42 = bitcast double* %39 to <2 x double>*, !dbg !685
  %43 = load <2 x double>* %42, align 8, !dbg !685, !tbaa !242
  %44 = fadd <2 x double> %41, %43, !dbg !685
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !156), !dbg !686
  %45 = extractelement <2 x double> %41, i32 0, !dbg !687
  %46 = extractelement <2 x double> %43, i32 0, !dbg !687
  %47 = fsub double %45, %46, !dbg !687
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !157), !dbg !687
  %48 = extractelement <2 x double> %41, i32 1, !dbg !688
  %49 = extractelement <2 x double> %43, i32 1, !dbg !688
  %50 = fsub double %48, %49, !dbg !688
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !158), !dbg !688
  %51 = getelementptr inbounds double* %a, i64 12, !dbg !689
  %52 = getelementptr inbounds double* %a, i64 14, !dbg !689
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !159), !dbg !689
  %53 = bitcast double* %51 to <2 x double>*, !dbg !689
  %54 = load <2 x double>* %53, align 8, !dbg !689, !tbaa !242
  %55 = bitcast double* %52 to <2 x double>*, !dbg !689
  %56 = load <2 x double>* %55, align 8, !dbg !689, !tbaa !242
  %57 = fadd <2 x double> %54, %56, !dbg !689
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !160), !dbg !690
  %58 = extractelement <2 x double> %54, i32 0, !dbg !691
  %59 = extractelement <2 x double> %56, i32 0, !dbg !691
  %60 = fsub double %58, %59, !dbg !691
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !161), !dbg !691
  %61 = extractelement <2 x double> %54, i32 1, !dbg !692
  %62 = extractelement <2 x double> %56, i32 1, !dbg !692
  %63 = fsub double %61, %62, !dbg !692
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !162), !dbg !692
  %64 = fadd <2 x double> %44, %57, !dbg !693
  %65 = bitcast double* %38 to <2 x double>*, !dbg !693
  store <2 x double> %64, <2 x double>* %65, align 8, !dbg !693, !tbaa !242
  %66 = shufflevector <2 x double> %57, <2 x double> %44, <2 x i32> <i32 1, i32 2>, !dbg !694
  %67 = shufflevector <2 x double> %44, <2 x double> %57, <2 x i32> <i32 1, i32 2>, !dbg !694
  %68 = fsub <2 x double> %66, %67, !dbg !694
  %69 = bitcast double* %51 to <2 x double>*, !dbg !694
  store <2 x double> %68, <2 x double>* %69, align 8, !dbg !694, !tbaa !242
  %70 = fsub double %47, %63, !dbg !695
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !155), !dbg !695
  %71 = fadd double %50, %60, !dbg !696
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !156), !dbg !696
  %72 = fsub double %70, %71, !dbg !697
  %73 = fadd double %71, %70, !dbg !698
  %74 = insertelement <2 x double> undef, double %72, i32 0, !dbg !697
  %75 = insertelement <2 x double> %74, double %73, i32 1, !dbg !697
  %76 = insertelement <2 x double> undef, double %37, i32 0, !dbg !697
  %77 = insertelement <2 x double> %76, double %37, i32 1, !dbg !697
  %78 = fmul <2 x double> %75, %77, !dbg !697
  %79 = bitcast double* %39 to <2 x double>*, !dbg !697
  store <2 x double> %78, <2 x double>* %79, align 8, !dbg !697, !tbaa !242
  %80 = fadd double %47, %63, !dbg !699
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !155), !dbg !699
  %81 = fsub double %60, %50, !dbg !700
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !156), !dbg !700
  %82 = fsub double %81, %80, !dbg !701
  %83 = fadd double %81, %80, !dbg !702
  %84 = insertelement <2 x double> undef, double %82, i32 0, !dbg !701
  %85 = insertelement <2 x double> %84, double %83, i32 1, !dbg !701
  %86 = fmul <2 x double> %85, %77, !dbg !701
  %87 = bitcast double* %52 to <2 x double>*, !dbg !701
  store <2 x double> %86, <2 x double>* %87, align 8, !dbg !701, !tbaa !242
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !147), !dbg !703
  tail call void @llvm.dbg.value(metadata !704, i64 0, metadata !146), !dbg !705
  %88 = icmp sgt i32 %n, 16, !dbg !705
  br i1 %88, label %.lr.ph, label %._crit_edge, !dbg !705

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 16, %0 ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 2, !dbg !705
  %89 = shl nsw i64 %indvars.iv.next4, 1, !dbg !707
  %90 = getelementptr inbounds double* %w, i64 %indvars.iv.next4, !dbg !709
  %91 = load double* %90, align 8, !dbg !709, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !151), !dbg !709
  %92 = add nsw i64 %indvars.iv3, 3, !dbg !710
  %93 = getelementptr inbounds double* %w, i64 %92, !dbg !710
  %94 = load double* %93, align 8, !dbg !710, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !152), !dbg !710
  %95 = getelementptr inbounds double* %w, i64 %89, !dbg !711
  %96 = load double* %95, align 8, !dbg !711, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !149), !dbg !711
  %97 = or i64 %89, 1, !dbg !712
  %98 = getelementptr inbounds double* %w, i64 %97, !dbg !712
  %99 = load double* %98, align 8, !dbg !712, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !150), !dbg !712
  %100 = fmul double %94, 2.000000e+00, !dbg !713
  %101 = fmul double %100, %99, !dbg !713
  %102 = fsub double %96, %101, !dbg !713
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !153), !dbg !713
  %103 = fmul double %100, %96, !dbg !714
  %104 = fsub double %103, %99, !dbg !714
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !154), !dbg !714
  %105 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !715
  %106 = or i64 %indvars.iv, 2, !dbg !715
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !715
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !155), !dbg !715
  %108 = bitcast double* %105 to <2 x double>*, !dbg !715
  %109 = load <2 x double>* %108, align 8, !dbg !715, !tbaa !242
  %110 = or i64 %indvars.iv, 3, !dbg !716
  %111 = getelementptr inbounds double* %a, i64 %110, !dbg !716
  %112 = bitcast double* %107 to <2 x double>*, !dbg !715
  %113 = load <2 x double>* %112, align 8, !dbg !715, !tbaa !242
  %114 = fadd <2 x double> %109, %113, !dbg !715
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !156), !dbg !716
  %115 = extractelement <2 x double> %109, i32 0, !dbg !717
  %116 = extractelement <2 x double> %113, i32 0, !dbg !717
  %117 = fsub double %115, %116, !dbg !717
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !157), !dbg !717
  %118 = extractelement <2 x double> %109, i32 1, !dbg !718
  %119 = extractelement <2 x double> %113, i32 1, !dbg !718
  %120 = fsub double %118, %119, !dbg !718
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !158), !dbg !718
  %121 = or i64 %indvars.iv, 4, !dbg !719
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !719
  %123 = or i64 %indvars.iv, 6, !dbg !719
  %124 = getelementptr inbounds double* %a, i64 %123, !dbg !719
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !159), !dbg !719
  %125 = or i64 %indvars.iv, 5, !dbg !720
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !720
  %127 = bitcast double* %122 to <2 x double>*, !dbg !719
  %128 = load <2 x double>* %127, align 8, !dbg !719, !tbaa !242
  %129 = or i64 %indvars.iv, 7, !dbg !720
  %130 = getelementptr inbounds double* %a, i64 %129, !dbg !720
  %131 = bitcast double* %124 to <2 x double>*, !dbg !719
  %132 = load <2 x double>* %131, align 8, !dbg !719, !tbaa !242
  %133 = fadd <2 x double> %128, %132, !dbg !719
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !160), !dbg !720
  %134 = extractelement <2 x double> %128, i32 0, !dbg !721
  %135 = extractelement <2 x double> %132, i32 0, !dbg !721
  %136 = fsub double %134, %135, !dbg !721
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !161), !dbg !721
  %137 = extractelement <2 x double> %128, i32 1, !dbg !722
  %138 = extractelement <2 x double> %132, i32 1, !dbg !722
  %139 = fsub double %137, %138, !dbg !722
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !162), !dbg !722
  %140 = fadd <2 x double> %114, %133, !dbg !723
  %141 = bitcast double* %105 to <2 x double>*, !dbg !723
  store <2 x double> %140, <2 x double>* %141, align 8, !dbg !723, !tbaa !242
  %142 = extractelement <2 x double> %114, i32 0, !dbg !724
  %143 = extractelement <2 x double> %133, i32 0, !dbg !724
  %144 = fsub double %142, %143, !dbg !724
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !155), !dbg !724
  %145 = extractelement <2 x double> %114, i32 1, !dbg !725
  %146 = extractelement <2 x double> %133, i32 1, !dbg !725
  %147 = fsub double %145, %146, !dbg !725
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !156), !dbg !725
  %148 = fmul double %91, %144, !dbg !726
  %149 = fmul double %94, %147, !dbg !726
  %150 = fsub double %148, %149, !dbg !726
  store double %150, double* %122, align 8, !dbg !726, !tbaa !242
  %151 = fmul double %91, %147, !dbg !727
  %152 = fmul double %94, %144, !dbg !727
  %153 = fadd double %152, %151, !dbg !727
  store double %153, double* %126, align 8, !dbg !727, !tbaa !242
  %154 = fsub double %117, %139, !dbg !728
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !155), !dbg !728
  %155 = fadd double %120, %136, !dbg !729
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !156), !dbg !729
  %156 = fmul double %96, %154, !dbg !730
  %157 = fmul double %99, %155, !dbg !730
  %158 = fsub double %156, %157, !dbg !730
  store double %158, double* %107, align 8, !dbg !730, !tbaa !242
  %159 = fmul double %96, %155, !dbg !731
  %160 = fmul double %99, %154, !dbg !731
  %161 = fadd double %159, %160, !dbg !731
  store double %161, double* %111, align 8, !dbg !731, !tbaa !242
  %162 = fadd double %117, %139, !dbg !732
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !155), !dbg !732
  %163 = fsub double %120, %136, !dbg !733
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !156), !dbg !733
  %164 = fmul double %102, %162, !dbg !734
  %165 = fmul double %104, %163, !dbg !734
  %166 = fsub double %164, %165, !dbg !734
  store double %166, double* %124, align 8, !dbg !734, !tbaa !242
  %167 = fmul double %102, %163, !dbg !735
  %168 = fmul double %104, %162, !dbg !735
  %169 = fadd double %167, %168, !dbg !735
  store double %169, double* %130, align 8, !dbg !735, !tbaa !242
  %170 = or i64 %89, 2, !dbg !736
  %171 = getelementptr inbounds double* %w, i64 %170, !dbg !736
  %172 = load double* %171, align 8, !dbg !736, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !149), !dbg !736
  %173 = or i64 %89, 3, !dbg !737
  %174 = getelementptr inbounds double* %w, i64 %173, !dbg !737
  %175 = load double* %174, align 8, !dbg !737, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !150), !dbg !737
  %176 = fmul double %91, 2.000000e+00, !dbg !738
  %177 = fmul double %176, %175, !dbg !738
  %178 = fsub double %172, %177, !dbg !738
  tail call void @llvm.dbg.value(metadata !{double %178}, i64 0, metadata !153), !dbg !738
  %179 = fmul double %176, %172, !dbg !739
  %180 = fsub double %179, %175, !dbg !739
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !154), !dbg !739
  %181 = or i64 %indvars.iv, 8, !dbg !740
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !740
  %183 = or i64 %indvars.iv, 10, !dbg !740
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !740
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !155), !dbg !740
  %185 = bitcast double* %182 to <2 x double>*, !dbg !740
  %186 = load <2 x double>* %185, align 8, !dbg !740, !tbaa !242
  %187 = or i64 %indvars.iv, 11, !dbg !741
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !741
  %189 = bitcast double* %184 to <2 x double>*, !dbg !740
  %190 = load <2 x double>* %189, align 8, !dbg !740, !tbaa !242
  %191 = fadd <2 x double> %186, %190, !dbg !740
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !156), !dbg !741
  %192 = extractelement <2 x double> %186, i32 0, !dbg !742
  %193 = extractelement <2 x double> %190, i32 0, !dbg !742
  %194 = fsub double %192, %193, !dbg !742
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !157), !dbg !742
  %195 = extractelement <2 x double> %186, i32 1, !dbg !743
  %196 = extractelement <2 x double> %190, i32 1, !dbg !743
  %197 = fsub double %195, %196, !dbg !743
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !158), !dbg !743
  %198 = or i64 %indvars.iv, 12, !dbg !744
  %199 = getelementptr inbounds double* %a, i64 %198, !dbg !744
  %200 = or i64 %indvars.iv, 14, !dbg !744
  %201 = getelementptr inbounds double* %a, i64 %200, !dbg !744
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !159), !dbg !744
  %202 = or i64 %indvars.iv, 13, !dbg !745
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !745
  %204 = bitcast double* %199 to <2 x double>*, !dbg !744
  %205 = load <2 x double>* %204, align 8, !dbg !744, !tbaa !242
  %206 = or i64 %indvars.iv, 15, !dbg !745
  %207 = getelementptr inbounds double* %a, i64 %206, !dbg !745
  %208 = bitcast double* %201 to <2 x double>*, !dbg !744
  %209 = load <2 x double>* %208, align 8, !dbg !744, !tbaa !242
  %210 = fadd <2 x double> %205, %209, !dbg !744
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !160), !dbg !745
  %211 = extractelement <2 x double> %205, i32 0, !dbg !746
  %212 = extractelement <2 x double> %209, i32 0, !dbg !746
  %213 = fsub double %211, %212, !dbg !746
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !161), !dbg !746
  %214 = extractelement <2 x double> %205, i32 1, !dbg !747
  %215 = extractelement <2 x double> %209, i32 1, !dbg !747
  %216 = fsub double %214, %215, !dbg !747
  tail call void @llvm.dbg.value(metadata !{double %216}, i64 0, metadata !162), !dbg !747
  %217 = fadd <2 x double> %191, %210, !dbg !748
  %218 = bitcast double* %182 to <2 x double>*, !dbg !748
  store <2 x double> %217, <2 x double>* %218, align 8, !dbg !748, !tbaa !242
  %219 = extractelement <2 x double> %191, i32 0, !dbg !749
  %220 = extractelement <2 x double> %210, i32 0, !dbg !749
  %221 = fsub double %219, %220, !dbg !749
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !155), !dbg !749
  %222 = extractelement <2 x double> %191, i32 1, !dbg !750
  %223 = extractelement <2 x double> %210, i32 1, !dbg !750
  %224 = fsub double %222, %223, !dbg !750
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !156), !dbg !750
  %225 = fsub double -0.000000e+00, %94, !dbg !751
  %226 = fmul double %221, %225, !dbg !751
  %227 = fmul double %91, %224, !dbg !751
  %228 = fsub double %226, %227, !dbg !751
  store double %228, double* %199, align 8, !dbg !751, !tbaa !242
  %229 = fmul double %224, %225, !dbg !752
  %230 = fmul double %91, %221, !dbg !752
  %231 = fadd double %230, %229, !dbg !752
  store double %231, double* %203, align 8, !dbg !752, !tbaa !242
  %232 = fsub double %194, %216, !dbg !753
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !155), !dbg !753
  %233 = fadd double %197, %213, !dbg !754
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !156), !dbg !754
  %234 = fmul double %172, %232, !dbg !755
  %235 = fmul double %175, %233, !dbg !755
  %236 = fsub double %234, %235, !dbg !755
  store double %236, double* %184, align 8, !dbg !755, !tbaa !242
  %237 = fmul double %172, %233, !dbg !756
  %238 = fmul double %175, %232, !dbg !756
  %239 = fadd double %237, %238, !dbg !756
  store double %239, double* %188, align 8, !dbg !756, !tbaa !242
  %240 = fadd double %194, %216, !dbg !757
  tail call void @llvm.dbg.value(metadata !{double %240}, i64 0, metadata !155), !dbg !757
  %241 = fsub double %197, %213, !dbg !758
  tail call void @llvm.dbg.value(metadata !{double %241}, i64 0, metadata !156), !dbg !758
  %242 = fmul double %178, %240, !dbg !759
  %243 = fmul double %180, %241, !dbg !759
  %244 = fsub double %242, %243, !dbg !759
  store double %244, double* %201, align 8, !dbg !759, !tbaa !242
  %245 = fmul double %178, %241, !dbg !760
  %246 = fmul double %180, %240, !dbg !760
  %247 = fadd double %245, %246, !dbg !760
  store double %247, double* %207, align 8, !dbg !760, !tbaa !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16, !dbg !705
  %248 = trunc i64 %indvars.iv.next to i32, !dbg !705
  %249 = icmp slt i32 %248, %n, !dbg !705
  br i1 %249, label %.lr.ph, label %._crit_edge, !dbg !705

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !761
}

; Function Attrs: inlinehint minsize nounwind optsize uwtable
define internal fastcc void @cftmdl(i32 %n, i32 %l, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !762
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !115), !dbg !762
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !116), !dbg !762
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !117), !dbg !762
  %1 = shl i32 %l, 2, !dbg !763
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !125), !dbg !763
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !118), !dbg !764
  %2 = icmp sgt i32 %l, 0, !dbg !764
  br i1 %2, label %.lr.ph17, label %._crit_edge14, !dbg !764

.lr.ph17:                                         ; preds = %0
  %3 = sext i32 %l to i64, !dbg !764
  br label %4, !dbg !764

; <label>:4                                       ; preds = %.lr.ph17, %4
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next28, %4 ]
  %5 = add nsw i64 %indvars.iv27, %3, !dbg !766
  %6 = add nsw i64 %5, %3, !dbg !768
  %7 = add nsw i64 %6, %3, !dbg !769
  %8 = getelementptr inbounds double* %a, i64 %indvars.iv27, !dbg !770
  %9 = getelementptr inbounds double* %a, i64 %5, !dbg !770
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !133), !dbg !770
  %10 = bitcast double* %8 to <2 x double>*, !dbg !770
  %11 = load <2 x double>* %10, align 8, !dbg !770, !tbaa !242
  %12 = add nsw i64 %5, 1, !dbg !771
  %13 = getelementptr inbounds double* %a, i64 %12, !dbg !771
  %14 = bitcast double* %9 to <2 x double>*, !dbg !770
  %15 = load <2 x double>* %14, align 8, !dbg !770, !tbaa !242
  %16 = fadd <2 x double> %11, %15, !dbg !770
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !134), !dbg !771
  %17 = extractelement <2 x double> %11, i32 0, !dbg !772
  %18 = extractelement <2 x double> %15, i32 0, !dbg !772
  %19 = fsub double %17, %18, !dbg !772
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !135), !dbg !772
  %20 = extractelement <2 x double> %11, i32 1, !dbg !773
  %21 = extractelement <2 x double> %15, i32 1, !dbg !773
  %22 = fsub double %20, %21, !dbg !773
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !136), !dbg !773
  %23 = getelementptr inbounds double* %a, i64 %6, !dbg !774
  %24 = getelementptr inbounds double* %a, i64 %7, !dbg !774
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !137), !dbg !774
  %25 = bitcast double* %23 to <2 x double>*, !dbg !774
  %26 = load <2 x double>* %25, align 8, !dbg !774, !tbaa !242
  %27 = add nsw i64 %7, 1, !dbg !775
  %28 = getelementptr inbounds double* %a, i64 %27, !dbg !775
  %29 = bitcast double* %24 to <2 x double>*, !dbg !774
  %30 = load <2 x double>* %29, align 8, !dbg !774, !tbaa !242
  %31 = fadd <2 x double> %26, %30, !dbg !774
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !138), !dbg !775
  %32 = extractelement <2 x double> %26, i32 0, !dbg !776
  %33 = extractelement <2 x double> %30, i32 0, !dbg !776
  %34 = fsub double %32, %33, !dbg !776
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !139), !dbg !776
  %35 = extractelement <2 x double> %26, i32 1, !dbg !777
  %36 = extractelement <2 x double> %30, i32 1, !dbg !777
  %37 = fsub double %35, %36, !dbg !777
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !140), !dbg !777
  %38 = fadd <2 x double> %16, %31, !dbg !778
  %39 = bitcast double* %8 to <2 x double>*, !dbg !778
  store <2 x double> %38, <2 x double>* %39, align 8, !dbg !778, !tbaa !242
  %40 = fsub <2 x double> %16, %31, !dbg !779
  %41 = bitcast double* %23 to <2 x double>*, !dbg !779
  store <2 x double> %40, <2 x double>* %41, align 8, !dbg !779, !tbaa !242
  %42 = fsub double %19, %37, !dbg !780
  store double %42, double* %9, align 8, !dbg !780, !tbaa !242
  %43 = fadd double %22, %34, !dbg !781
  store double %43, double* %13, align 8, !dbg !781, !tbaa !242
  %44 = fadd double %19, %37, !dbg !782
  store double %44, double* %24, align 8, !dbg !782, !tbaa !242
  %45 = fsub double %22, %34, !dbg !783
  store double %45, double* %28, align 8, !dbg !783, !tbaa !242
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 2, !dbg !764
  %46 = trunc i64 %indvars.iv.next28 to i32, !dbg !764
  %47 = icmp slt i32 %46, %l, !dbg !764
  br i1 %47, label %4, label %._crit_edge18, !dbg !764

._crit_edge18:                                    ; preds = %4
  %48 = getelementptr inbounds double* %w, i64 2, !dbg !784
  %49 = load double* %48, align 8, !dbg !784, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !127), !dbg !784
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !785
  %50 = add nsw i32 %1, %l, !dbg !785
  br i1 %2, label %.lr.ph13, label %._crit_edge14, !dbg !785

.lr.ph13:                                         ; preds = %._crit_edge18
  %51 = shl i32 %l, 2, !dbg !785
  %52 = sext i32 %51 to i64
  %53 = sext i32 %l to i64, !dbg !785
  %54 = insertelement <2 x double> undef, double %49, i32 0, !dbg !787
  %55 = insertelement <2 x double> %54, double %49, i32 1, !dbg !787
  br label %56, !dbg !785

; <label>:56                                      ; preds = %.lr.ph13, %56
  %indvars.iv25 = phi i64 [ %52, %.lr.ph13 ], [ %indvars.iv.next26, %56 ]
  %j.111 = phi i32 [ %1, %.lr.ph13 ], [ %107, %56 ]
  %57 = add nsw i64 %indvars.iv25, %53, !dbg !789
  %58 = add nsw i64 %57, %53, !dbg !790
  %59 = add nsw i64 %58, %53, !dbg !791
  %60 = getelementptr inbounds double* %a, i64 %indvars.iv25, !dbg !792
  %61 = load double* %60, align 8, !dbg !792, !tbaa !242
  %62 = getelementptr inbounds double* %a, i64 %57, !dbg !792
  %63 = load double* %62, align 8, !dbg !792, !tbaa !242
  %64 = fadd double %61, %63, !dbg !792
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !133), !dbg !792
  %65 = or i32 %j.111, 1, !dbg !793
  %66 = sext i32 %65 to i64, !dbg !793
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !793
  %68 = load double* %67, align 8, !dbg !793, !tbaa !242
  %69 = add nsw i64 %57, 1, !dbg !793
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !793
  %71 = load double* %70, align 8, !dbg !793, !tbaa !242
  %72 = fadd double %68, %71, !dbg !793
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !134), !dbg !793
  %73 = fsub double %61, %63, !dbg !794
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !135), !dbg !794
  %74 = fsub double %68, %71, !dbg !795
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !136), !dbg !795
  %75 = getelementptr inbounds double* %a, i64 %58, !dbg !796
  %76 = load double* %75, align 8, !dbg !796, !tbaa !242
  %77 = getelementptr inbounds double* %a, i64 %59, !dbg !796
  %78 = load double* %77, align 8, !dbg !796, !tbaa !242
  %79 = fadd double %76, %78, !dbg !796
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !137), !dbg !796
  %80 = add nsw i64 %58, 1, !dbg !797
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !797
  %82 = load double* %81, align 8, !dbg !797, !tbaa !242
  %83 = add nsw i64 %59, 1, !dbg !797
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !797
  %85 = load double* %84, align 8, !dbg !797, !tbaa !242
  %86 = fadd double %82, %85, !dbg !797
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !138), !dbg !797
  %87 = fsub double %76, %78, !dbg !798
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !139), !dbg !798
  %88 = fsub double %82, %85, !dbg !799
  tail call void @llvm.dbg.value(metadata !{double %88}, i64 0, metadata !140), !dbg !799
  %89 = fadd double %64, %79, !dbg !800
  store double %89, double* %60, align 8, !dbg !800, !tbaa !242
  %90 = fadd double %72, %86, !dbg !801
  store double %90, double* %67, align 8, !dbg !801, !tbaa !242
  %91 = fsub double %86, %72, !dbg !802
  store double %91, double* %75, align 8, !dbg !802, !tbaa !242
  %92 = fsub double %64, %79, !dbg !803
  store double %92, double* %81, align 8, !dbg !803, !tbaa !242
  %93 = fsub double %73, %88, !dbg !804
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !133), !dbg !804
  %94 = fadd double %74, %87, !dbg !805
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !134), !dbg !805
  %95 = fsub double %93, %94, !dbg !787
  %96 = fadd double %94, %93, !dbg !806
  %97 = insertelement <2 x double> undef, double %95, i32 0, !dbg !787
  %98 = insertelement <2 x double> %97, double %96, i32 1, !dbg !787
  %99 = fmul <2 x double> %98, %55, !dbg !787
  %100 = bitcast double* %62 to <2 x double>*, !dbg !787
  store <2 x double> %99, <2 x double>* %100, align 8, !dbg !787, !tbaa !242
  %101 = fadd double %73, %88, !dbg !807
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !133), !dbg !807
  %102 = fsub double %87, %74, !dbg !808
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !134), !dbg !808
  %103 = fsub double %102, %101, !dbg !809
  %104 = fmul double %49, %103, !dbg !809
  store double %104, double* %77, align 8, !dbg !809, !tbaa !242
  %105 = fadd double %102, %101, !dbg !810
  %106 = fmul double %49, %105, !dbg !810
  store double %106, double* %84, align 8, !dbg !810, !tbaa !242
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 2, !dbg !785
  %107 = add nsw i32 %j.111, 2, !dbg !785
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !118), !dbg !785
  %108 = trunc i64 %indvars.iv.next26 to i32, !dbg !785
  %109 = icmp slt i32 %108, %50, !dbg !785
  br i1 %109, label %56, label %._crit_edge14, !dbg !785

._crit_edge14:                                    ; preds = %56, %0, %._crit_edge18
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !123), !dbg !811
  %110 = shl i32 %l, 3, !dbg !812
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !126), !dbg !812
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !122), !dbg !813
  %111 = icmp slt i32 %110, %n, !dbg !813
  br i1 %111, label %.lr.ph9, label %._crit_edge10, !dbg !813

.lr.ph9:                                          ; preds = %._crit_edge14
  %112 = shl i32 %l, 3, !dbg !813
  %113 = sext i32 %112 to i64
  %114 = sext i32 %l to i64, !dbg !813
  %115 = mul i32 %l, 12, !dbg !813
  br label %116, !dbg !813

; <label>:116                                     ; preds = %.lr.ph9, %._crit_edge5
  %indvars.iv21 = phi i32 [ %115, %.lr.ph9 ], [ %indvars.iv.next22, %._crit_edge5 ]
  %indvars.iv = phi i64 [ %113, %.lr.ph9 ], [ %indvars.iv.next, %._crit_edge5 ]
  %k.07 = phi i32 [ %110, %.lr.ph9 ], [ %283, %._crit_edge5 ]
  %k1.06 = phi i32 [ 2, %.lr.ph9 ], [ %phitmp, %._crit_edge5 ]
  tail call void @llvm.dbg.value(metadata !{i32 %k1.06}, i64 0, metadata !123), !dbg !815
  %117 = sext i32 %indvars.iv21 to i64
  %118 = shl nsw i32 %k1.06, 1, !dbg !817
  tail call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !124), !dbg !817
  %119 = sext i32 %k1.06 to i64, !dbg !818
  %120 = getelementptr inbounds double* %w, i64 %119, !dbg !818
  %121 = load double* %120, align 8, !dbg !818, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %121}, i64 0, metadata !129), !dbg !818
  %122 = or i32 %k1.06, 1, !dbg !819
  %123 = sext i32 %122 to i64, !dbg !819
  %124 = getelementptr inbounds double* %w, i64 %123, !dbg !819
  %125 = load double* %124, align 8, !dbg !819, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !130), !dbg !819
  %126 = sext i32 %118 to i64, !dbg !820
  %127 = getelementptr inbounds double* %w, i64 %126, !dbg !820
  %128 = load double* %127, align 8, !dbg !820, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !127), !dbg !820
  %129 = or i32 %118, 1, !dbg !821
  %130 = sext i32 %129 to i64, !dbg !821
  %131 = getelementptr inbounds double* %w, i64 %130, !dbg !821
  %132 = load double* %131, align 8, !dbg !821, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %132}, i64 0, metadata !128), !dbg !821
  %133 = fmul double %125, 2.000000e+00, !dbg !822
  %134 = fmul double %133, %132, !dbg !822
  %135 = fsub double %128, %134, !dbg !822
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !131), !dbg !822
  %136 = fmul double %133, %128, !dbg !823
  %137 = fsub double %136, %132, !dbg !823
  tail call void @llvm.dbg.value(metadata !{double %137}, i64 0, metadata !132), !dbg !823
  tail call void @llvm.dbg.value(metadata !{i32 %k.07}, i64 0, metadata !118), !dbg !824
  %138 = add nsw i32 %k.07, %l, !dbg !824
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !824

.lr.ph:                                           ; preds = %116, %.lr.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.lr.ph ], [ %indvars.iv, %116 ]
  %j.21 = phi i32 [ %197, %.lr.ph ], [ %k.07, %116 ]
  %139 = add nsw i64 %indvars.iv19, %114, !dbg !826
  %140 = add nsw i64 %139, %114, !dbg !828
  %141 = add nsw i64 %140, %114, !dbg !829
  %142 = getelementptr inbounds double* %a, i64 %indvars.iv19, !dbg !830
  %143 = load double* %142, align 8, !dbg !830, !tbaa !242
  %144 = getelementptr inbounds double* %a, i64 %139, !dbg !830
  %145 = load double* %144, align 8, !dbg !830, !tbaa !242
  %146 = fadd double %143, %145, !dbg !830
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !133), !dbg !830
  %147 = or i32 %j.21, 1, !dbg !831
  %148 = sext i32 %147 to i64, !dbg !831
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !831
  %150 = load double* %149, align 8, !dbg !831, !tbaa !242
  %151 = add nsw i64 %139, 1, !dbg !831
  %152 = getelementptr inbounds double* %a, i64 %151, !dbg !831
  %153 = load double* %152, align 8, !dbg !831, !tbaa !242
  %154 = fadd double %150, %153, !dbg !831
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !134), !dbg !831
  %155 = fsub double %143, %145, !dbg !832
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !135), !dbg !832
  %156 = fsub double %150, %153, !dbg !833
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !136), !dbg !833
  %157 = getelementptr inbounds double* %a, i64 %140, !dbg !834
  %158 = load double* %157, align 8, !dbg !834, !tbaa !242
  %159 = getelementptr inbounds double* %a, i64 %141, !dbg !834
  %160 = load double* %159, align 8, !dbg !834, !tbaa !242
  %161 = fadd double %158, %160, !dbg !834
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !137), !dbg !834
  %162 = add nsw i64 %140, 1, !dbg !835
  %163 = getelementptr inbounds double* %a, i64 %162, !dbg !835
  %164 = load double* %163, align 8, !dbg !835, !tbaa !242
  %165 = add nsw i64 %141, 1, !dbg !835
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !835
  %167 = load double* %166, align 8, !dbg !835, !tbaa !242
  %168 = fadd double %164, %167, !dbg !835
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !138), !dbg !835
  %169 = fsub double %158, %160, !dbg !836
  tail call void @llvm.dbg.value(metadata !{double %169}, i64 0, metadata !139), !dbg !836
  %170 = fsub double %164, %167, !dbg !837
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !140), !dbg !837
  %171 = fadd double %146, %161, !dbg !838
  store double %171, double* %142, align 8, !dbg !838, !tbaa !242
  %172 = fadd double %154, %168, !dbg !839
  store double %172, double* %149, align 8, !dbg !839, !tbaa !242
  %173 = fsub double %146, %161, !dbg !840
  tail call void @llvm.dbg.value(metadata !{double %173}, i64 0, metadata !133), !dbg !840
  %174 = fsub double %154, %168, !dbg !841
  tail call void @llvm.dbg.value(metadata !{double %174}, i64 0, metadata !134), !dbg !841
  %175 = fmul double %121, %173, !dbg !842
  %176 = fmul double %125, %174, !dbg !842
  %177 = fsub double %175, %176, !dbg !842
  store double %177, double* %157, align 8, !dbg !842, !tbaa !242
  %178 = fmul double %121, %174, !dbg !843
  %179 = fmul double %125, %173, !dbg !843
  %180 = fadd double %179, %178, !dbg !843
  store double %180, double* %163, align 8, !dbg !843, !tbaa !242
  %181 = fsub double %155, %170, !dbg !844
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !133), !dbg !844
  %182 = fadd double %156, %169, !dbg !845
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !134), !dbg !845
  %183 = fmul double %128, %181, !dbg !846
  %184 = fmul double %132, %182, !dbg !846
  %185 = fsub double %183, %184, !dbg !846
  store double %185, double* %144, align 8, !dbg !846, !tbaa !242
  %186 = fmul double %128, %182, !dbg !847
  %187 = fmul double %132, %181, !dbg !847
  %188 = fadd double %186, %187, !dbg !847
  store double %188, double* %152, align 8, !dbg !847, !tbaa !242
  %189 = fadd double %155, %170, !dbg !848
  tail call void @llvm.dbg.value(metadata !{double %189}, i64 0, metadata !133), !dbg !848
  %190 = fsub double %156, %169, !dbg !849
  tail call void @llvm.dbg.value(metadata !{double %190}, i64 0, metadata !134), !dbg !849
  %191 = fmul double %135, %189, !dbg !850
  %192 = fmul double %137, %190, !dbg !850
  %193 = fsub double %191, %192, !dbg !850
  store double %193, double* %159, align 8, !dbg !850, !tbaa !242
  %194 = fmul double %135, %190, !dbg !851
  %195 = fmul double %137, %189, !dbg !851
  %196 = fadd double %194, %195, !dbg !851
  store double %196, double* %166, align 8, !dbg !851, !tbaa !242
  %197 = add nsw i32 %j.21, 2, !dbg !824
  tail call void @llvm.dbg.value(metadata !{i32 %197}, i64 0, metadata !118), !dbg !824
  %198 = icmp slt i32 %197, %138, !dbg !824
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 2, !dbg !824
  br i1 %198, label %.lr.ph, label %._crit_edge, !dbg !824

._crit_edge:                                      ; preds = %.lr.ph, %116
  %199 = or i32 %118, 2, !dbg !852
  %200 = sext i32 %199 to i64, !dbg !852
  %201 = getelementptr inbounds double* %w, i64 %200, !dbg !852
  %202 = load double* %201, align 8, !dbg !852, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %202}, i64 0, metadata !127), !dbg !852
  %203 = or i32 %118, 3, !dbg !853
  %204 = sext i32 %203 to i64, !dbg !853
  %205 = getelementptr inbounds double* %w, i64 %204, !dbg !853
  %206 = load double* %205, align 8, !dbg !853, !tbaa !242
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !128), !dbg !853
  %207 = fmul double %121, 2.000000e+00, !dbg !854
  %208 = fmul double %207, %206, !dbg !854
  %209 = fsub double %202, %208, !dbg !854
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !131), !dbg !854
  %210 = fmul double %207, %202, !dbg !855
  %211 = fsub double %210, %206, !dbg !855
  tail call void @llvm.dbg.value(metadata !{double %211}, i64 0, metadata !132), !dbg !855
  %212 = add nsw i32 %k.07, %1, !dbg !856
  tail call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !118), !dbg !856
  %213 = add nsw i32 %212, %l, !dbg !856
  br i1 %2, label %.lr.ph4, label %._crit_edge5, !dbg !856

.lr.ph4:                                          ; preds = %._crit_edge
  %214 = fsub double -0.000000e+00, %125, !dbg !858
  br label %215, !dbg !856

; <label>:215                                     ; preds = %.lr.ph4, %215
  %indvars.iv23 = phi i64 [ %117, %.lr.ph4 ], [ %indvars.iv.next24, %215 ]
  %j.32 = phi i32 [ %212, %.lr.ph4 ], [ %281, %215 ]
  %216 = add nsw i64 %indvars.iv23, %114, !dbg !860
  %217 = add nsw i64 %216, %114, !dbg !861
  %218 = add nsw i64 %217, %114, !dbg !862
  %219 = getelementptr inbounds double* %a, i64 %indvars.iv23, !dbg !863
  %220 = getelementptr inbounds double* %a, i64 %216, !dbg !863
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !133), !dbg !863
  %221 = bitcast double* %219 to <2 x double>*, !dbg !863
  %222 = load <2 x double>* %221, align 8, !dbg !863, !tbaa !242
  %223 = add nsw i64 %216, 1, !dbg !864
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !864
  %225 = bitcast double* %220 to <2 x double>*, !dbg !863
  %226 = load <2 x double>* %225, align 8, !dbg !863, !tbaa !242
  %227 = fadd <2 x double> %222, %226, !dbg !863
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !134), !dbg !864
  %228 = extractelement <2 x double> %222, i32 0, !dbg !865
  %229 = extractelement <2 x double> %226, i32 0, !dbg !865
  %230 = fsub double %228, %229, !dbg !865
  tail call void @llvm.dbg.value(metadata !{double %230}, i64 0, metadata !135), !dbg !865
  %231 = extractelement <2 x double> %222, i32 1, !dbg !866
  %232 = extractelement <2 x double> %226, i32 1, !dbg !866
  %233 = fsub double %231, %232, !dbg !866
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !136), !dbg !866
  %234 = getelementptr inbounds double* %a, i64 %217, !dbg !867
  %235 = load double* %234, align 8, !dbg !867, !tbaa !242
  %236 = getelementptr inbounds double* %a, i64 %218, !dbg !867
  %237 = load double* %236, align 8, !dbg !867, !tbaa !242
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !137), !dbg !867
  %238 = add nsw i64 %217, 1, !dbg !868
  %239 = getelementptr inbounds double* %a, i64 %238, !dbg !868
  %240 = load double* %239, align 8, !dbg !868, !tbaa !242
  %241 = add nsw i64 %218, 1, !dbg !868
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !868
  %243 = load double* %242, align 8, !dbg !868, !tbaa !242
  %244 = insertelement <2 x double> undef, double %235, i32 0, !dbg !867
  %245 = insertelement <2 x double> %244, double %240, i32 1, !dbg !867
  %246 = insertelement <2 x double> undef, double %237, i32 0, !dbg !867
  %247 = insertelement <2 x double> %246, double %243, i32 1, !dbg !867
  %248 = fadd <2 x double> %245, %247, !dbg !867
  tail call void @llvm.dbg.value(metadata !483, i64 0, metadata !138), !dbg !868
  %249 = fsub double %235, %237, !dbg !869
  tail call void @llvm.dbg.value(metadata !{double %249}, i64 0, metadata !139), !dbg !869
  %250 = fsub double %240, %243, !dbg !870
  tail call void @llvm.dbg.value(metadata !{double %250}, i64 0, metadata !140), !dbg !870
  %251 = fadd <2 x double> %227, %248, !dbg !871
  %252 = bitcast double* %219 to <2 x double>*, !dbg !871
  store <2 x double> %251, <2 x double>* %252, align 8, !dbg !871, !tbaa !242
  %253 = extractelement <2 x double> %227, i32 0, !dbg !872
  %254 = extractelement <2 x double> %248, i32 0, !dbg !872
  %255 = fsub double %253, %254, !dbg !872
  tail call void @llvm.dbg.value(metadata !{double %255}, i64 0, metadata !133), !dbg !872
  %256 = extractelement <2 x double> %227, i32 1, !dbg !873
  %257 = extractelement <2 x double> %248, i32 1, !dbg !873
  %258 = fsub double %256, %257, !dbg !873
  tail call void @llvm.dbg.value(metadata !{double %258}, i64 0, metadata !134), !dbg !873
  %259 = fmul double %255, %214, !dbg !858
  %260 = fmul double %121, %258, !dbg !858
  %261 = fsub double %259, %260, !dbg !858
  store double %261, double* %234, align 8, !dbg !858, !tbaa !242
  %262 = fmul double %258, %214, !dbg !874
  %263 = fmul double %121, %255, !dbg !874
  %264 = fadd double %263, %262, !dbg !874
  store double %264, double* %239, align 8, !dbg !874, !tbaa !242
  %265 = fsub double %230, %250, !dbg !875
  tail call void @llvm.dbg.value(metadata !{double %265}, i64 0, metadata !133), !dbg !875
  %266 = fadd double %233, %249, !dbg !876
  tail call void @llvm.dbg.value(metadata !{double %266}, i64 0, metadata !134), !dbg !876
  %267 = fmul double %202, %265, !dbg !877
  %268 = fmul double %206, %266, !dbg !877
  %269 = fsub double %267, %268, !dbg !877
  store double %269, double* %220, align 8, !dbg !877, !tbaa !242
  %270 = fmul double %202, %266, !dbg !878
  %271 = fmul double %206, %265, !dbg !878
  %272 = fadd double %270, %271, !dbg !878
  store double %272, double* %224, align 8, !dbg !878, !tbaa !242
  %273 = fadd double %230, %250, !dbg !879
  tail call void @llvm.dbg.value(metadata !{double %273}, i64 0, metadata !133), !dbg !879
  %274 = fsub double %233, %249, !dbg !880
  tail call void @llvm.dbg.value(metadata !{double %274}, i64 0, metadata !134), !dbg !880
  %275 = fmul double %209, %273, !dbg !881
  %276 = fmul double %211, %274, !dbg !881
  %277 = fsub double %275, %276, !dbg !881
  store double %277, double* %236, align 8, !dbg !881, !tbaa !242
  %278 = fmul double %209, %274, !dbg !882
  %279 = fmul double %211, %273, !dbg !882
  %280 = fadd double %278, %279, !dbg !882
  store double %280, double* %242, align 8, !dbg !882, !tbaa !242
  %281 = add nsw i32 %j.32, 2, !dbg !856
  tail call void @llvm.dbg.value(metadata !{i32 %281}, i64 0, metadata !118), !dbg !856
  %282 = icmp slt i32 %281, %213, !dbg !856
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 2, !dbg !856
  br i1 %282, label %215, label %._crit_edge5, !dbg !856

._crit_edge5:                                     ; preds = %215, %._crit_edge
  %283 = add nsw i32 %k.07, %110, !dbg !813
  tail call void @llvm.dbg.value(metadata !{i32 %283}, i64 0, metadata !122), !dbg !813
  %phitmp = add i32 %k1.06, 2, !dbg !813
  %284 = icmp slt i32 %283, %n, !dbg !813
  %indvars.iv.next = add nsw i64 %indvars.iv, %113, !dbg !813
  %indvars.iv.next22 = add i32 %indvars.iv21, %112, !dbg !813
  br i1 %284, label %116, label %._crit_edge10, !dbg !813

._crit_edge10:                                    ; preds = %._crit_edge5, %._crit_edge14
  ret void, !dbg !883
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { minsize nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { minsize nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { minsize nounwind optsize readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { minsize noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { inlinehint minsize nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { minsize optsize }
attributes #9 = { minsize nounwind optsize }
attributes #10 = { minsize nounwind optsize readnone }
attributes #11 = { minsize noreturn nounwind optsize }

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
!90 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"cftbsub", metadata !"cftbsub", metadata !"", i32 480, metadata !91, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !93, i32 481} ; [ DW_TAG_subprogram ] [line 480] [local] [def] [scope 481] [cftbsub]
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
!181 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bitrv2conj", metadata !"bitrv2conj", metadata !"", i32 321, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !182, i32 322} ; [ DW_TAG_subprogram ] [line 321] [local] [def] [scope 322] [bitrv2conj]
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
!321 = metadata !{i32 786689, metadata !181, metadata !"n", metadata !5, i32 16777537, metadata !8, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [n] [line 321]
!322 = metadata !{i32 181, i32 0, metadata !323, null}
!323 = metadata !{i32 786443, metadata !1, metadata !315, i32 180, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!324 = metadata !{i32 321, i32 0, metadata !181, metadata !322}
!325 = metadata !{i32 786689, metadata !181, metadata !"ip", metadata !5, i32 33554753, metadata !13, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [ip] [line 321]
!326 = metadata !{i32 786689, metadata !181, metadata !"a", metadata !5, i32 50331969, metadata !15, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [a] [line 321]
!327 = metadata !{i32 326, i32 0, metadata !181, metadata !322}
!328 = metadata !{metadata !329, metadata !329, i64 0}
!329 = metadata !{metadata !"int", metadata !244, i64 0}
!330 = metadata !{i32 786688, metadata !181, metadata !"l", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [l] [line 323]
!331 = metadata !{i32 327, i32 0, metadata !181, metadata !322}
!332 = metadata !{i32 1}
!333 = metadata !{i32 786688, metadata !181, metadata !"m", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [m] [line 323]
!334 = metadata !{i32 328, i32 0, metadata !181, metadata !322}
!335 = metadata !{i32 329, i32 0, metadata !181, metadata !322}
!336 = metadata !{i32 330, i32 0, metadata !337, metadata !322}
!337 = metadata !{i32 786443, metadata !1, metadata !181, i32 329, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!338 = metadata !{i32 786688, metadata !181, metadata !"j", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [j] [line 323]
!339 = metadata !{i32 331, i32 0, metadata !340, metadata !322}
!340 = metadata !{i32 786443, metadata !1, metadata !337, i32 331, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!341 = metadata !{i32 332, i32 0, metadata !342, metadata !322}
!342 = metadata !{i32 786443, metadata !1, metadata !340, i32 331, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!343 = metadata !{i32 334, i32 0, metadata !337, metadata !322}
!344 = metadata !{i32 336, i32 0, metadata !181, metadata !322}
!345 = metadata !{i32 786688, metadata !181, metadata !"m2", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [m2] [line 323]
!346 = metadata !{i32 337, i32 0, metadata !347, metadata !322}
!347 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!348 = metadata !{i32 338, i32 0, metadata !349, metadata !322}
!349 = metadata !{i32 786443, metadata !1, metadata !350, i32 338, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!350 = metadata !{i32 786443, metadata !1, metadata !347, i32 337, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!351 = metadata !{i32 393, i32 0, metadata !352, metadata !322}
!352 = metadata !{i32 786443, metadata !1, metadata !349, i32 338, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!353 = metadata !{i32 351, i32 0, metadata !354, metadata !322}
!354 = metadata !{i32 786443, metadata !1, metadata !355, i32 339, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!355 = metadata !{i32 786443, metadata !1, metadata !352, i32 339, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!356 = metadata !{i32 339, i32 0, metadata !355, metadata !322}
!357 = metadata !{i32 340, i32 0, metadata !354, metadata !322}
!358 = metadata !{i32 341, i32 0, metadata !354, metadata !322}
!359 = metadata !{i32 786688, metadata !181, metadata !"j1", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [j1] [line 323]
!360 = metadata !{i32 786688, metadata !181, metadata !"k1", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [k1] [line 323]
!361 = metadata !{i32 342, i32 0, metadata !354, metadata !322}
!362 = metadata !{i32 786688, metadata !181, metadata !"xr", metadata !5, i32 324, metadata !16, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [xr] [line 324]
!363 = metadata !{i32 343, i32 0, metadata !354, metadata !322}
!364 = metadata !{i32 786688, metadata !181, metadata !"xi", metadata !5, i32 324, metadata !16, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [xi] [line 324]
!365 = metadata !{i32 344, i32 0, metadata !354, metadata !322}
!366 = metadata !{i32 786688, metadata !181, metadata !"yr", metadata !5, i32 324, metadata !16, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [yr] [line 324]
!367 = metadata !{i32 345, i32 0, metadata !354, metadata !322}
!368 = metadata !{i32 786688, metadata !181, metadata !"yi", metadata !5, i32 324, metadata !16, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [yi] [line 324]
!369 = metadata !{i32 346, i32 0, metadata !354, metadata !322}
!370 = metadata !{i32 347, i32 0, metadata !354, metadata !322}
!371 = metadata !{i32 348, i32 0, metadata !354, metadata !322}
!372 = metadata !{i32 349, i32 0, metadata !354, metadata !322}
!373 = metadata !{i32 350, i32 0, metadata !354, metadata !322}
!374 = metadata !{i32 352, i32 0, metadata !354, metadata !322}
!375 = metadata !{i32 353, i32 0, metadata !354, metadata !322}
!376 = metadata !{i32 354, i32 0, metadata !354, metadata !322}
!377 = metadata !{i32 355, i32 0, metadata !354, metadata !322}
!378 = metadata !{i32 356, i32 0, metadata !354, metadata !322}
!379 = metadata !{i32 357, i32 0, metadata !354, metadata !322}
!380 = metadata !{i32 358, i32 0, metadata !354, metadata !322}
!381 = metadata !{i32 359, i32 0, metadata !354, metadata !322}
!382 = metadata !{i32 360, i32 0, metadata !354, metadata !322}
!383 = metadata !{i32 361, i32 0, metadata !354, metadata !322}
!384 = metadata !{i32 362, i32 0, metadata !354, metadata !322}
!385 = metadata !{i32 363, i32 0, metadata !354, metadata !322}
!386 = metadata !{i32 364, i32 0, metadata !354, metadata !322}
!387 = metadata !{i32 365, i32 0, metadata !354, metadata !322}
!388 = metadata !{i32 366, i32 0, metadata !354, metadata !322}
!389 = metadata !{i32 367, i32 0, metadata !354, metadata !322}
!390 = metadata !{i32 368, i32 0, metadata !354, metadata !322}
!391 = metadata !{i32 369, i32 0, metadata !354, metadata !322}
!392 = metadata !{i32 370, i32 0, metadata !354, metadata !322}
!393 = metadata !{i32 371, i32 0, metadata !354, metadata !322}
!394 = metadata !{i32 372, i32 0, metadata !354, metadata !322}
!395 = metadata !{i32 373, i32 0, metadata !354, metadata !322}
!396 = metadata !{i32 374, i32 0, metadata !354, metadata !322}
!397 = metadata !{i32 375, i32 0, metadata !354, metadata !322}
!398 = metadata !{i32 376, i32 0, metadata !354, metadata !322}
!399 = metadata !{i32 377, i32 0, metadata !354, metadata !322}
!400 = metadata !{i32 378, i32 0, metadata !354, metadata !322}
!401 = metadata !{i32 379, i32 0, metadata !354, metadata !322}
!402 = metadata !{i32 381, i32 0, metadata !352, metadata !322}
!403 = metadata !{i32 382, i32 0, metadata !352, metadata !322}
!404 = metadata !{i32 383, i32 0, metadata !352, metadata !322}
!405 = metadata !{i32 384, i32 0, metadata !352, metadata !322}
!406 = metadata !{i32 385, i32 0, metadata !352, metadata !322}
!407 = metadata !{i32 386, i32 0, metadata !352, metadata !322}
!408 = metadata !{i32 387, i32 0, metadata !352, metadata !322}
!409 = metadata !{i32 388, i32 0, metadata !352, metadata !322}
!410 = metadata !{i32 389, i32 0, metadata !352, metadata !322}
!411 = metadata !{i32 390, i32 0, metadata !352, metadata !322}
!412 = metadata !{i32 391, i32 0, metadata !352, metadata !322}
!413 = metadata !{i32 392, i32 0, metadata !352, metadata !322}
!414 = metadata !{i32 394, i32 0, metadata !352, metadata !322}
!415 = metadata !{i32 786688, metadata !181, metadata !"k", metadata !5, i32 323, metadata !8, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [k] [line 323]
!416 = metadata !{i32 397, i32 0, metadata !417, metadata !322}
!417 = metadata !{i32 786443, metadata !1, metadata !347, i32 396, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!418 = metadata !{i32 398, i32 0, metadata !417, metadata !322}
!419 = metadata !{i32 399, i32 0, metadata !420, metadata !322}
!420 = metadata !{i32 786443, metadata !1, metadata !417, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!421 = metadata !{i32 401, i32 0, metadata !422, metadata !322}
!422 = metadata !{i32 786443, metadata !1, metadata !423, i32 400, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!423 = metadata !{i32 786443, metadata !1, metadata !424, i32 400, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!424 = metadata !{i32 786443, metadata !1, metadata !420, i32 399, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!425 = metadata !{i32 402, i32 0, metadata !422, metadata !322}
!426 = metadata !{i32 400, i32 0, metadata !423, metadata !322}
!427 = metadata !{i32 403, i32 0, metadata !422, metadata !322}
!428 = metadata !{i32 404, i32 0, metadata !422, metadata !322}
!429 = metadata !{i32 405, i32 0, metadata !422, metadata !322}
!430 = metadata !{i32 406, i32 0, metadata !422, metadata !322}
!431 = metadata !{i32 407, i32 0, metadata !422, metadata !322}
!432 = metadata !{i32 408, i32 0, metadata !422, metadata !322}
!433 = metadata !{i32 409, i32 0, metadata !422, metadata !322}
!434 = metadata !{i32 410, i32 0, metadata !422, metadata !322}
!435 = metadata !{i32 411, i32 0, metadata !422, metadata !322}
!436 = metadata !{i32 412, i32 0, metadata !422, metadata !322}
!437 = metadata !{i32 413, i32 0, metadata !422, metadata !322}
!438 = metadata !{i32 414, i32 0, metadata !422, metadata !322}
!439 = metadata !{i32 415, i32 0, metadata !422, metadata !322}
!440 = metadata !{i32 416, i32 0, metadata !422, metadata !322}
!441 = metadata !{i32 417, i32 0, metadata !422, metadata !322}
!442 = metadata !{i32 418, i32 0, metadata !422, metadata !322}
!443 = metadata !{i32 419, i32 0, metadata !422, metadata !322}
!444 = metadata !{i32 420, i32 0, metadata !422, metadata !322}
!445 = metadata !{i32 422, i32 0, metadata !424, metadata !322}
!446 = metadata !{i32 423, i32 0, metadata !424, metadata !322}
!447 = metadata !{i32 424, i32 0, metadata !424, metadata !322}
!448 = metadata !{i32 786689, metadata !90, metadata !"n", metadata !5, i32 16777696, metadata !8, i32 0, metadata !449} ; [ DW_TAG_arg_variable ] [n] [line 480]
!449 = metadata !{i32 182, i32 0, metadata !323, null}
!450 = metadata !{i32 480, i32 0, metadata !90, metadata !449}
!451 = metadata !{i32 786689, metadata !90, metadata !"a", metadata !5, i32 33554912, metadata !15, i32 0, metadata !449} ; [ DW_TAG_arg_variable ] [a] [line 480]
!452 = metadata !{i32 786689, metadata !90, metadata !"w", metadata !5, i32 50332128, metadata !15, i32 0, metadata !449} ; [ DW_TAG_arg_variable ] [w] [line 480]
!453 = metadata !{i32 2}
!454 = metadata !{i32 786688, metadata !90, metadata !"l", metadata !5, i32 482, metadata !8, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [l] [line 482]
!455 = metadata !{i32 485, i32 0, metadata !90, metadata !449}
!456 = metadata !{i32 486, i32 0, metadata !457, metadata !449}
!457 = metadata !{i32 786443, metadata !1, metadata !90, i32 486, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!458 = metadata !{i32 487, i32 0, metadata !459, metadata !449}
!459 = metadata !{i32 786443, metadata !1, metadata !457, i32 486, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!460 = metadata !{i32 8}
!461 = metadata !{i32 488, i32 0, metadata !459, metadata !449}
!462 = metadata !{i32 489, i32 0, metadata !459, metadata !449}
!463 = metadata !{i32 490, i32 0, metadata !464, metadata !449}
!464 = metadata !{i32 786443, metadata !1, metadata !459, i32 489, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!465 = metadata !{i32 491, i32 0, metadata !464, metadata !449}
!466 = metadata !{i32 494, i32 0, metadata !467, metadata !449}
!467 = metadata !{i32 786443, metadata !1, metadata !90, i32 494, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!468 = metadata !{i32 786688, metadata !90, metadata !"j", metadata !5, i32 482, metadata !8, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [j] [line 482]
!469 = metadata !{i32 495, i32 0, metadata !470, metadata !449}
!470 = metadata !{i32 786443, metadata !1, metadata !471, i32 495, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!471 = metadata !{i32 786443, metadata !1, metadata !467, i32 494, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!472 = metadata !{i32 517, i32 0, metadata !473, metadata !449}
!473 = metadata !{i32 786443, metadata !1, metadata !474, i32 517, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!474 = metadata !{i32 786443, metadata !1, metadata !467, i32 516, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!475 = metadata !{i32 496, i32 0, metadata !476, metadata !449}
!476 = metadata !{i32 786443, metadata !1, metadata !470, i32 495, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!477 = metadata !{i32 497, i32 0, metadata !476, metadata !449}
!478 = metadata !{i32 498, i32 0, metadata !476, metadata !449}
!479 = metadata !{i32 499, i32 0, metadata !476, metadata !449}
!480 = metadata !{i32 786688, metadata !90, metadata !"x0r", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x0r] [line 483]
!481 = metadata !{i32 500, i32 0, metadata !476, metadata !449}
!482 = metadata !{i32 786688, metadata !90, metadata !"x0i", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x0i] [line 483]
!483 = metadata !{double undef}
!484 = metadata !{i32 786688, metadata !90, metadata !"x1r", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x1r] [line 483]
!485 = metadata !{i32 501, i32 0, metadata !476, metadata !449}
!486 = metadata !{i32 786688, metadata !90, metadata !"x1i", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x1i] [line 483]
!487 = metadata !{i32 502, i32 0, metadata !476, metadata !449}
!488 = metadata !{i32 503, i32 0, metadata !476, metadata !449}
!489 = metadata !{i32 786688, metadata !90, metadata !"x2r", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x2r] [line 483]
!490 = metadata !{i32 504, i32 0, metadata !476, metadata !449}
!491 = metadata !{i32 786688, metadata !90, metadata !"x2i", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x2i] [line 483]
!492 = metadata !{i32 786688, metadata !90, metadata !"x3r", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x3r] [line 483]
!493 = metadata !{i32 505, i32 0, metadata !476, metadata !449}
!494 = metadata !{i32 506, i32 0, metadata !476, metadata !449}
!495 = metadata !{i32 786688, metadata !90, metadata !"x3i", metadata !5, i32 483, metadata !16, i32 0, metadata !449} ; [ DW_TAG_auto_variable ] [x3i] [line 483]
!496 = metadata !{i32 507, i32 0, metadata !476, metadata !449}
!497 = metadata !{i32 508, i32 0, metadata !476, metadata !449}
!498 = metadata !{i32 509, i32 0, metadata !476, metadata !449}
!499 = metadata !{i32 510, i32 0, metadata !476, metadata !449}
!500 = metadata !{i32 511, i32 0, metadata !476, metadata !449}
!501 = metadata !{i32 513, i32 0, metadata !476, metadata !449}
!502 = metadata !{i32 518, i32 0, metadata !503, metadata !449}
!503 = metadata !{i32 786443, metadata !1, metadata !473, i32 517, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!504 = metadata !{i32 519, i32 0, metadata !503, metadata !449}
!505 = metadata !{i32 520, i32 0, metadata !503, metadata !449}
!506 = metadata !{i32 521, i32 0, metadata !503, metadata !449}
!507 = metadata !{i32 522, i32 0, metadata !503, metadata !449}
!508 = metadata !{i32 523, i32 0, metadata !503, metadata !449}
!509 = metadata !{i32 184, i32 0, metadata !510, null}
!510 = metadata !{i32 786443, metadata !1, metadata !313, i32 184, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!511 = metadata !{i32 185, i32 0, metadata !512, null}
!512 = metadata !{i32 786443, metadata !1, metadata !510, i32 184, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!513 = metadata !{i32 186, i32 0, metadata !512, null}
!514 = metadata !{i32 187, i32 0, metadata !69, null}
!515 = metadata !{i32 127, i32 0, metadata !43, null}
!516 = metadata !{i32 129, i32 0, metadata !43, null}
!517 = metadata !{i32 130, i32 0, metadata !43, null}
!518 = metadata !{i32 132, i32 0, metadata !519, null}
!519 = metadata !{i32 786443, metadata !1, metadata !43, i32 132, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!520 = metadata !{i32 133, i32 0, metadata !521, null}
!521 = metadata !{i32 786443, metadata !1, metadata !519, i32 132, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!522 = metadata !{i32 134, i32 0, metadata !521, null}
!523 = metadata !{i32 136, i32 0, metadata !43, null}
!524 = metadata !{i32 221, i32 0, metadata !197, null}
!525 = metadata !{i32 226, i32 0, metadata !197, null}
!526 = metadata !{i32 227, i32 0, metadata !197, null}
!527 = metadata !{i32 228, i32 0, metadata !197, null}
!528 = metadata !{i32 229, i32 0, metadata !197, null}
!529 = metadata !{i32 230, i32 0, metadata !530, null}
!530 = metadata !{i32 786443, metadata !1, metadata !197, i32 229, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!531 = metadata !{i32 231, i32 0, metadata !532, null}
!532 = metadata !{i32 786443, metadata !1, metadata !530, i32 231, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!533 = metadata !{i32 232, i32 0, metadata !534, null}
!534 = metadata !{i32 786443, metadata !1, metadata !532, i32 231, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!535 = metadata !{i32 234, i32 0, metadata !530, null}
!536 = metadata !{i32 236, i32 0, metadata !197, null}
!537 = metadata !{i32 237, i32 0, metadata !538, null}
!538 = metadata !{i32 786443, metadata !1, metadata !197, i32 237, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!539 = metadata !{i32 293, i32 0, metadata !540, null}
!540 = metadata !{i32 786443, metadata !1, metadata !541, i32 293, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!541 = metadata !{i32 786443, metadata !1, metadata !538, i32 292, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!542 = metadata !{i32 238, i32 0, metadata !543, null}
!543 = metadata !{i32 786443, metadata !1, metadata !544, i32 238, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!544 = metadata !{i32 786443, metadata !1, metadata !538, i32 237, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!545 = metadata !{i32 251, i32 0, metadata !546, null}
!546 = metadata !{i32 786443, metadata !1, metadata !547, i32 239, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!547 = metadata !{i32 786443, metadata !1, metadata !548, i32 239, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!548 = metadata !{i32 786443, metadata !1, metadata !543, i32 238, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!549 = metadata !{i32 239, i32 0, metadata !547, null}
!550 = metadata !{i32 240, i32 0, metadata !546, null}
!551 = metadata !{i32 241, i32 0, metadata !546, null}
!552 = metadata !{i32 242, i32 0, metadata !546, null}
!553 = metadata !{i32 243, i32 0, metadata !546, null}
!554 = metadata !{i32 244, i32 0, metadata !546, null}
!555 = metadata !{i32 245, i32 0, metadata !546, null}
!556 = metadata !{i32 246, i32 0, metadata !546, null}
!557 = metadata !{i32 247, i32 0, metadata !546, null}
!558 = metadata !{i32 248, i32 0, metadata !546, null}
!559 = metadata !{i32 249, i32 0, metadata !546, null}
!560 = metadata !{i32 250, i32 0, metadata !546, null}
!561 = metadata !{i32 252, i32 0, metadata !546, null}
!562 = metadata !{i32 253, i32 0, metadata !546, null}
!563 = metadata !{i32 254, i32 0, metadata !546, null}
!564 = metadata !{i32 255, i32 0, metadata !546, null}
!565 = metadata !{i32 256, i32 0, metadata !546, null}
!566 = metadata !{i32 257, i32 0, metadata !546, null}
!567 = metadata !{i32 258, i32 0, metadata !546, null}
!568 = metadata !{i32 259, i32 0, metadata !546, null}
!569 = metadata !{i32 260, i32 0, metadata !546, null}
!570 = metadata !{i32 261, i32 0, metadata !546, null}
!571 = metadata !{i32 262, i32 0, metadata !546, null}
!572 = metadata !{i32 263, i32 0, metadata !546, null}
!573 = metadata !{i32 264, i32 0, metadata !546, null}
!574 = metadata !{i32 265, i32 0, metadata !546, null}
!575 = metadata !{i32 266, i32 0, metadata !546, null}
!576 = metadata !{i32 267, i32 0, metadata !546, null}
!577 = metadata !{i32 268, i32 0, metadata !546, null}
!578 = metadata !{i32 269, i32 0, metadata !546, null}
!579 = metadata !{i32 270, i32 0, metadata !546, null}
!580 = metadata !{i32 271, i32 0, metadata !546, null}
!581 = metadata !{i32 272, i32 0, metadata !546, null}
!582 = metadata !{i32 273, i32 0, metadata !546, null}
!583 = metadata !{i32 274, i32 0, metadata !546, null}
!584 = metadata !{i32 275, i32 0, metadata !546, null}
!585 = metadata !{i32 276, i32 0, metadata !546, null}
!586 = metadata !{i32 277, i32 0, metadata !546, null}
!587 = metadata !{i32 278, i32 0, metadata !546, null}
!588 = metadata !{i32 279, i32 0, metadata !546, null}
!589 = metadata !{i32 281, i32 0, metadata !548, null}
!590 = metadata !{i32 282, i32 0, metadata !548, null}
!591 = metadata !{i32 283, i32 0, metadata !548, null}
!592 = metadata !{i32 284, i32 0, metadata !548, null}
!593 = metadata !{i32 285, i32 0, metadata !548, null}
!594 = metadata !{i32 286, i32 0, metadata !548, null}
!595 = metadata !{i32 287, i32 0, metadata !548, null}
!596 = metadata !{i32 288, i32 0, metadata !548, null}
!597 = metadata !{i32 289, i32 0, metadata !548, null}
!598 = metadata !{i32 290, i32 0, metadata !548, null}
!599 = metadata !{i32 295, i32 0, metadata !600, null}
!600 = metadata !{i32 786443, metadata !1, metadata !601, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!601 = metadata !{i32 786443, metadata !1, metadata !602, i32 294, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!602 = metadata !{i32 786443, metadata !1, metadata !540, i32 293, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!603 = metadata !{i32 296, i32 0, metadata !600, null}
!604 = metadata !{i32 294, i32 0, metadata !601, null}
!605 = metadata !{i32 297, i32 0, metadata !600, null}
!606 = metadata !{i32 298, i32 0, metadata !600, null}
!607 = metadata !{i32 299, i32 0, metadata !600, null}
!608 = metadata !{i32 300, i32 0, metadata !600, null}
!609 = metadata !{i32 301, i32 0, metadata !600, null}
!610 = metadata !{i32 302, i32 0, metadata !600, null}
!611 = metadata !{i32 303, i32 0, metadata !600, null}
!612 = metadata !{i32 304, i32 0, metadata !600, null}
!613 = metadata !{i32 305, i32 0, metadata !600, null}
!614 = metadata !{i32 306, i32 0, metadata !600, null}
!615 = metadata !{i32 307, i32 0, metadata !600, null}
!616 = metadata !{i32 308, i32 0, metadata !600, null}
!617 = metadata !{i32 309, i32 0, metadata !600, null}
!618 = metadata !{i32 310, i32 0, metadata !600, null}
!619 = metadata !{i32 311, i32 0, metadata !600, null}
!620 = metadata !{i32 312, i32 0, metadata !600, null}
!621 = metadata !{i32 313, i32 0, metadata !600, null}
!622 = metadata !{i32 314, i32 0, metadata !600, null}
!623 = metadata !{i32 318, i32 0, metadata !197, null}
!624 = metadata !{i32 430, i32 0, metadata !163, null}
!625 = metadata !{i32 435, i32 0, metadata !163, null}
!626 = metadata !{i32 436, i32 0, metadata !627, null}
!627 = metadata !{i32 786443, metadata !1, metadata !163, i32 436, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!628 = metadata !{i32 437, i32 0, metadata !629, null}
!629 = metadata !{i32 786443, metadata !1, metadata !627, i32 436, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!630 = metadata !{i32 438, i32 0, metadata !629, null}
!631 = metadata !{i32 439, i32 0, metadata !629, null}
!632 = metadata !{i32 440, i32 0, metadata !633, null}
!633 = metadata !{i32 786443, metadata !1, metadata !629, i32 439, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!634 = metadata !{i32 441, i32 0, metadata !633, null}
!635 = metadata !{i32 444, i32 0, metadata !636, null}
!636 = metadata !{i32 786443, metadata !1, metadata !163, i32 444, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!637 = metadata !{i32 445, i32 0, metadata !638, null}
!638 = metadata !{i32 786443, metadata !1, metadata !639, i32 445, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!639 = metadata !{i32 786443, metadata !1, metadata !636, i32 444, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!640 = metadata !{i32 467, i32 0, metadata !641, null}
!641 = metadata !{i32 786443, metadata !1, metadata !642, i32 467, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!642 = metadata !{i32 786443, metadata !1, metadata !636, i32 466, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!643 = metadata !{i32 446, i32 0, metadata !644, null}
!644 = metadata !{i32 786443, metadata !1, metadata !638, i32 445, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!645 = metadata !{i32 447, i32 0, metadata !644, null}
!646 = metadata !{i32 448, i32 0, metadata !644, null}
!647 = metadata !{i32 449, i32 0, metadata !644, null}
!648 = metadata !{i32 450, i32 0, metadata !644, null}
!649 = metadata !{i32 451, i32 0, metadata !644, null}
!650 = metadata !{i32 452, i32 0, metadata !644, null}
!651 = metadata !{i32 453, i32 0, metadata !644, null}
!652 = metadata !{i32 454, i32 0, metadata !644, null}
!653 = metadata !{i32 455, i32 0, metadata !644, null}
!654 = metadata !{i32 456, i32 0, metadata !644, null}
!655 = metadata !{i32 457, i32 0, metadata !644, null}
!656 = metadata !{i32 459, i32 0, metadata !644, null}
!657 = metadata !{i32 461, i32 0, metadata !644, null}
!658 = metadata !{i32 462, i32 0, metadata !644, null}
!659 = metadata !{i32 463, i32 0, metadata !644, null}
!660 = metadata !{i32 464, i32 0, metadata !644, null}
!661 = metadata !{i32 468, i32 0, metadata !662, null}
!662 = metadata !{i32 786443, metadata !1, metadata !641, i32 467, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!663 = metadata !{i32 469, i32 0, metadata !662, null}
!664 = metadata !{i32 470, i32 0, metadata !662, null}
!665 = metadata !{i32 471, i32 0, metadata !662, null}
!666 = metadata !{i32 472, i32 0, metadata !662, null}
!667 = metadata !{i32 473, i32 0, metadata !662, null}
!668 = metadata !{i32 477, i32 0, metadata !163, null}
!669 = metadata !{i32 530, i32 0, metadata !141, null}
!670 = metadata !{i32 536, i32 0, metadata !141, null}
!671 = metadata !{i32 537, i32 0, metadata !141, null}
!672 = metadata !{i32 538, i32 0, metadata !141, null}
!673 = metadata !{i32 539, i32 0, metadata !141, null}
!674 = metadata !{i32 540, i32 0, metadata !141, null}
!675 = metadata !{i32 541, i32 0, metadata !141, null}
!676 = metadata !{i32 542, i32 0, metadata !141, null}
!677 = metadata !{i32 543, i32 0, metadata !141, null}
!678 = metadata !{i32 544, i32 0, metadata !141, null}
!679 = metadata !{i32 546, i32 0, metadata !141, null}
!680 = metadata !{i32 548, i32 0, metadata !141, null}
!681 = metadata !{i32 549, i32 0, metadata !141, null}
!682 = metadata !{i32 550, i32 0, metadata !141, null}
!683 = metadata !{i32 551, i32 0, metadata !141, null}
!684 = metadata !{i32 552, i32 0, metadata !141, null}
!685 = metadata !{i32 553, i32 0, metadata !141, null}
!686 = metadata !{i32 554, i32 0, metadata !141, null}
!687 = metadata !{i32 555, i32 0, metadata !141, null}
!688 = metadata !{i32 556, i32 0, metadata !141, null}
!689 = metadata !{i32 557, i32 0, metadata !141, null}
!690 = metadata !{i32 558, i32 0, metadata !141, null}
!691 = metadata !{i32 559, i32 0, metadata !141, null}
!692 = metadata !{i32 560, i32 0, metadata !141, null}
!693 = metadata !{i32 561, i32 0, metadata !141, null}
!694 = metadata !{i32 563, i32 0, metadata !141, null}
!695 = metadata !{i32 565, i32 0, metadata !141, null}
!696 = metadata !{i32 566, i32 0, metadata !141, null}
!697 = metadata !{i32 567, i32 0, metadata !141, null}
!698 = metadata !{i32 568, i32 0, metadata !141, null}
!699 = metadata !{i32 569, i32 0, metadata !141, null}
!700 = metadata !{i32 570, i32 0, metadata !141, null}
!701 = metadata !{i32 571, i32 0, metadata !141, null}
!702 = metadata !{i32 572, i32 0, metadata !141, null}
!703 = metadata !{i32 573, i32 0, metadata !141, null}
!704 = metadata !{i32 16}
!705 = metadata !{i32 574, i32 0, metadata !706, null}
!706 = metadata !{i32 786443, metadata !1, metadata !141, i32 574, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!707 = metadata !{i32 576, i32 0, metadata !708, null}
!708 = metadata !{i32 786443, metadata !1, metadata !706, i32 574, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!709 = metadata !{i32 577, i32 0, metadata !708, null}
!710 = metadata !{i32 578, i32 0, metadata !708, null}
!711 = metadata !{i32 579, i32 0, metadata !708, null}
!712 = metadata !{i32 580, i32 0, metadata !708, null}
!713 = metadata !{i32 581, i32 0, metadata !708, null}
!714 = metadata !{i32 582, i32 0, metadata !708, null}
!715 = metadata !{i32 583, i32 0, metadata !708, null}
!716 = metadata !{i32 584, i32 0, metadata !708, null}
!717 = metadata !{i32 585, i32 0, metadata !708, null}
!718 = metadata !{i32 586, i32 0, metadata !708, null}
!719 = metadata !{i32 587, i32 0, metadata !708, null}
!720 = metadata !{i32 588, i32 0, metadata !708, null}
!721 = metadata !{i32 589, i32 0, metadata !708, null}
!722 = metadata !{i32 590, i32 0, metadata !708, null}
!723 = metadata !{i32 591, i32 0, metadata !708, null}
!724 = metadata !{i32 593, i32 0, metadata !708, null}
!725 = metadata !{i32 594, i32 0, metadata !708, null}
!726 = metadata !{i32 595, i32 0, metadata !708, null}
!727 = metadata !{i32 596, i32 0, metadata !708, null}
!728 = metadata !{i32 597, i32 0, metadata !708, null}
!729 = metadata !{i32 598, i32 0, metadata !708, null}
!730 = metadata !{i32 599, i32 0, metadata !708, null}
!731 = metadata !{i32 600, i32 0, metadata !708, null}
!732 = metadata !{i32 601, i32 0, metadata !708, null}
!733 = metadata !{i32 602, i32 0, metadata !708, null}
!734 = metadata !{i32 603, i32 0, metadata !708, null}
!735 = metadata !{i32 604, i32 0, metadata !708, null}
!736 = metadata !{i32 605, i32 0, metadata !708, null}
!737 = metadata !{i32 606, i32 0, metadata !708, null}
!738 = metadata !{i32 607, i32 0, metadata !708, null}
!739 = metadata !{i32 608, i32 0, metadata !708, null}
!740 = metadata !{i32 609, i32 0, metadata !708, null}
!741 = metadata !{i32 610, i32 0, metadata !708, null}
!742 = metadata !{i32 611, i32 0, metadata !708, null}
!743 = metadata !{i32 612, i32 0, metadata !708, null}
!744 = metadata !{i32 613, i32 0, metadata !708, null}
!745 = metadata !{i32 614, i32 0, metadata !708, null}
!746 = metadata !{i32 615, i32 0, metadata !708, null}
!747 = metadata !{i32 616, i32 0, metadata !708, null}
!748 = metadata !{i32 617, i32 0, metadata !708, null}
!749 = metadata !{i32 619, i32 0, metadata !708, null}
!750 = metadata !{i32 620, i32 0, metadata !708, null}
!751 = metadata !{i32 621, i32 0, metadata !708, null}
!752 = metadata !{i32 622, i32 0, metadata !708, null}
!753 = metadata !{i32 623, i32 0, metadata !708, null}
!754 = metadata !{i32 624, i32 0, metadata !708, null}
!755 = metadata !{i32 625, i32 0, metadata !708, null}
!756 = metadata !{i32 626, i32 0, metadata !708, null}
!757 = metadata !{i32 627, i32 0, metadata !708, null}
!758 = metadata !{i32 628, i32 0, metadata !708, null}
!759 = metadata !{i32 629, i32 0, metadata !708, null}
!760 = metadata !{i32 630, i32 0, metadata !708, null}
!761 = metadata !{i32 632, i32 0, metadata !141, null}
!762 = metadata !{i32 635, i32 0, metadata !110, null}
!763 = metadata !{i32 641, i32 0, metadata !110, null}
!764 = metadata !{i32 642, i32 0, metadata !765, null}
!765 = metadata !{i32 786443, metadata !1, metadata !110, i32 642, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!766 = metadata !{i32 643, i32 0, metadata !767, null}
!767 = metadata !{i32 786443, metadata !1, metadata !765, i32 642, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!768 = metadata !{i32 644, i32 0, metadata !767, null}
!769 = metadata !{i32 645, i32 0, metadata !767, null}
!770 = metadata !{i32 646, i32 0, metadata !767, null}
!771 = metadata !{i32 647, i32 0, metadata !767, null}
!772 = metadata !{i32 648, i32 0, metadata !767, null}
!773 = metadata !{i32 649, i32 0, metadata !767, null}
!774 = metadata !{i32 650, i32 0, metadata !767, null}
!775 = metadata !{i32 651, i32 0, metadata !767, null}
!776 = metadata !{i32 652, i32 0, metadata !767, null}
!777 = metadata !{i32 653, i32 0, metadata !767, null}
!778 = metadata !{i32 654, i32 0, metadata !767, null}
!779 = metadata !{i32 656, i32 0, metadata !767, null}
!780 = metadata !{i32 658, i32 0, metadata !767, null}
!781 = metadata !{i32 659, i32 0, metadata !767, null}
!782 = metadata !{i32 660, i32 0, metadata !767, null}
!783 = metadata !{i32 661, i32 0, metadata !767, null}
!784 = metadata !{i32 663, i32 0, metadata !110, null}
!785 = metadata !{i32 664, i32 0, metadata !786, null}
!786 = metadata !{i32 786443, metadata !1, metadata !110, i32 664, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!787 = metadata !{i32 682, i32 0, metadata !788, null}
!788 = metadata !{i32 786443, metadata !1, metadata !786, i32 664, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!789 = metadata !{i32 665, i32 0, metadata !788, null}
!790 = metadata !{i32 666, i32 0, metadata !788, null}
!791 = metadata !{i32 667, i32 0, metadata !788, null}
!792 = metadata !{i32 668, i32 0, metadata !788, null}
!793 = metadata !{i32 669, i32 0, metadata !788, null}
!794 = metadata !{i32 670, i32 0, metadata !788, null}
!795 = metadata !{i32 671, i32 0, metadata !788, null}
!796 = metadata !{i32 672, i32 0, metadata !788, null}
!797 = metadata !{i32 673, i32 0, metadata !788, null}
!798 = metadata !{i32 674, i32 0, metadata !788, null}
!799 = metadata !{i32 675, i32 0, metadata !788, null}
!800 = metadata !{i32 676, i32 0, metadata !788, null}
!801 = metadata !{i32 677, i32 0, metadata !788, null}
!802 = metadata !{i32 678, i32 0, metadata !788, null}
!803 = metadata !{i32 679, i32 0, metadata !788, null}
!804 = metadata !{i32 680, i32 0, metadata !788, null}
!805 = metadata !{i32 681, i32 0, metadata !788, null}
!806 = metadata !{i32 683, i32 0, metadata !788, null}
!807 = metadata !{i32 684, i32 0, metadata !788, null}
!808 = metadata !{i32 685, i32 0, metadata !788, null}
!809 = metadata !{i32 686, i32 0, metadata !788, null}
!810 = metadata !{i32 687, i32 0, metadata !788, null}
!811 = metadata !{i32 689, i32 0, metadata !110, null}
!812 = metadata !{i32 690, i32 0, metadata !110, null}
!813 = metadata !{i32 691, i32 0, metadata !814, null}
!814 = metadata !{i32 786443, metadata !1, metadata !110, i32 691, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!815 = metadata !{i32 692, i32 0, metadata !816, null}
!816 = metadata !{i32 786443, metadata !1, metadata !814, i32 691, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!817 = metadata !{i32 693, i32 0, metadata !816, null}
!818 = metadata !{i32 694, i32 0, metadata !816, null}
!819 = metadata !{i32 695, i32 0, metadata !816, null}
!820 = metadata !{i32 696, i32 0, metadata !816, null}
!821 = metadata !{i32 697, i32 0, metadata !816, null}
!822 = metadata !{i32 698, i32 0, metadata !816, null}
!823 = metadata !{i32 699, i32 0, metadata !816, null}
!824 = metadata !{i32 700, i32 0, metadata !825, null}
!825 = metadata !{i32 786443, metadata !1, metadata !816, i32 700, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!826 = metadata !{i32 701, i32 0, metadata !827, null}
!827 = metadata !{i32 786443, metadata !1, metadata !825, i32 700, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!828 = metadata !{i32 702, i32 0, metadata !827, null}
!829 = metadata !{i32 703, i32 0, metadata !827, null}
!830 = metadata !{i32 704, i32 0, metadata !827, null}
!831 = metadata !{i32 705, i32 0, metadata !827, null}
!832 = metadata !{i32 706, i32 0, metadata !827, null}
!833 = metadata !{i32 707, i32 0, metadata !827, null}
!834 = metadata !{i32 708, i32 0, metadata !827, null}
!835 = metadata !{i32 709, i32 0, metadata !827, null}
!836 = metadata !{i32 710, i32 0, metadata !827, null}
!837 = metadata !{i32 711, i32 0, metadata !827, null}
!838 = metadata !{i32 712, i32 0, metadata !827, null}
!839 = metadata !{i32 713, i32 0, metadata !827, null}
!840 = metadata !{i32 714, i32 0, metadata !827, null}
!841 = metadata !{i32 715, i32 0, metadata !827, null}
!842 = metadata !{i32 716, i32 0, metadata !827, null}
!843 = metadata !{i32 717, i32 0, metadata !827, null}
!844 = metadata !{i32 718, i32 0, metadata !827, null}
!845 = metadata !{i32 719, i32 0, metadata !827, null}
!846 = metadata !{i32 720, i32 0, metadata !827, null}
!847 = metadata !{i32 721, i32 0, metadata !827, null}
!848 = metadata !{i32 722, i32 0, metadata !827, null}
!849 = metadata !{i32 723, i32 0, metadata !827, null}
!850 = metadata !{i32 724, i32 0, metadata !827, null}
!851 = metadata !{i32 725, i32 0, metadata !827, null}
!852 = metadata !{i32 727, i32 0, metadata !816, null}
!853 = metadata !{i32 728, i32 0, metadata !816, null}
!854 = metadata !{i32 729, i32 0, metadata !816, null}
!855 = metadata !{i32 730, i32 0, metadata !816, null}
!856 = metadata !{i32 731, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !1, metadata !816, i32 731, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!858 = metadata !{i32 747, i32 0, metadata !859, null}
!859 = metadata !{i32 786443, metadata !1, metadata !857, i32 731, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!860 = metadata !{i32 732, i32 0, metadata !859, null}
!861 = metadata !{i32 733, i32 0, metadata !859, null}
!862 = metadata !{i32 734, i32 0, metadata !859, null}
!863 = metadata !{i32 735, i32 0, metadata !859, null}
!864 = metadata !{i32 736, i32 0, metadata !859, null}
!865 = metadata !{i32 737, i32 0, metadata !859, null}
!866 = metadata !{i32 738, i32 0, metadata !859, null}
!867 = metadata !{i32 739, i32 0, metadata !859, null}
!868 = metadata !{i32 740, i32 0, metadata !859, null}
!869 = metadata !{i32 741, i32 0, metadata !859, null}
!870 = metadata !{i32 742, i32 0, metadata !859, null}
!871 = metadata !{i32 743, i32 0, metadata !859, null}
!872 = metadata !{i32 745, i32 0, metadata !859, null}
!873 = metadata !{i32 746, i32 0, metadata !859, null}
!874 = metadata !{i32 748, i32 0, metadata !859, null}
!875 = metadata !{i32 749, i32 0, metadata !859, null}
!876 = metadata !{i32 750, i32 0, metadata !859, null}
!877 = metadata !{i32 751, i32 0, metadata !859, null}
!878 = metadata !{i32 752, i32 0, metadata !859, null}
!879 = metadata !{i32 753, i32 0, metadata !859, null}
!880 = metadata !{i32 754, i32 0, metadata !859, null}
!881 = metadata !{i32 755, i32 0, metadata !859, null}
!882 = metadata !{i32 756, i32 0, metadata !859, null}
!883 = metadata !{i32 759, i32 0, metadata !110, null}
