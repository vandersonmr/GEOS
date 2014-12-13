; ModuleID = 'oourafft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: nounwind optsize uwtable
define i32 @main() #0 {
  %tv.i13 = alloca %struct.timeval, align 8
  %tv.i2 = alloca %struct.timeval, align 8
  %tv.i1 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !23), !dbg !217
  %1 = bitcast %struct.timeval* %tv.i to i8*, !dbg !218
  call void @llvm.lifetime.start(i64 16, i8* %1) #6, !dbg !218
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i}, metadata !59) #6, !dbg !218
  %2 = call i32 @gettimeofday(%struct.timeval* %tv.i, %struct.timezone* null) #8, !dbg !220
  call void @llvm.lifetime.end(i64 16, i8* %1) #6, !dbg !221
  %3 = bitcast %struct.timeval* %tv.i1 to i8*, !dbg !222
  call void @llvm.lifetime.start(i64 16, i8* %3) #6, !dbg !222
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i1}, metadata !59) #6, !dbg !222
  %4 = call i32 @gettimeofday(%struct.timeval* %tv.i1, %struct.timezone* null) #8, !dbg !224
  call void @llvm.lifetime.end(i64 16, i8* %3) #6, !dbg !225
  %5 = tail call noalias i8* @memalign(i64 16, i64 128) #8, !dbg !226
  %6 = bitcast i8* %5 to i32*, !dbg !226
  tail call void @llvm.dbg.value(metadata !{i32* %6}, i64 0, metadata !12), !dbg !226
  %7 = tail call noalias i8* @memalign(i64 16, i64 20480) #8, !dbg !227
  %8 = bitcast i8* %7 to double*, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !19), !dbg !227
  tail call void @makewt(i32 512, i32* %6, double* %8) #9, !dbg !228
  %9 = tail call noalias i8* @memalign(i64 16, i64 16384) #8, !dbg !229
  %10 = bitcast i8* %9 to double*, !dbg !229
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !14), !dbg !229
  %11 = tail call noalias i8* @memalign(i64 16, i64 16384) #8, !dbg !230
  tail call void @llvm.dbg.value(metadata !{double* %20}, i64 0, metadata !17), !dbg !230
  %12 = tail call noalias i8* @memalign(i64 16, i64 16384) #8, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double* %21}, i64 0, metadata !18), !dbg !231
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !233), !dbg !235
  tail call void @llvm.dbg.value(metadata !236, i64 0, metadata !237), !dbg !235
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !238), !dbg !235
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !239), !dbg !240
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !241), !dbg !242
  br label %13, !dbg !242

; <label>:13                                      ; preds = %13, %0
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %13 ], [ 0, %0 ]
  %seed.02.i = phi i32 [ %16, %13 ], [ 0, %0 ]
  %14 = mul nsw i32 %seed.02.i, 7141, !dbg !244
  %15 = add nsw i32 %14, 54773, !dbg !244
  %16 = srem i32 %15, 259200, !dbg !244
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !239), !dbg !244
  %17 = sitofp i32 %16 to double, !dbg !244
  %18 = fmul double %17, 0x3ED02E85C0898B71, !dbg !244
  %19 = getelementptr inbounds double* %10, i64 %indvars.iv.i, !dbg !244
  store double %18, double* %19, align 8, !dbg !244, !tbaa !245
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1, !dbg !242
  %exitcond28 = icmp eq i64 %indvars.iv.next.i, 2048, !dbg !242
  br i1 %exitcond28, label %putdata.exit, label %13, !dbg !242

putdata.exit:                                     ; preds = %13
  %20 = bitcast i8* %11 to double*, !dbg !230
  %21 = bitcast i8* %12 to double*, !dbg !231
  tail call void @llvm.dbg.value(metadata !249, i64 0, metadata !250) #6, !dbg !252
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !254) #6, !dbg !252
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !255) #6, !dbg !252
  tail call void @llvm.dbg.value(metadata !{i32* %6}, i64 0, metadata !256) #6, !dbg !252
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !257) #6, !dbg !252
  tail call fastcc void @bitrv2(i32 2048, i32* %6, double* %10) #8, !dbg !258
  tail call fastcc void @cftfsub(i32 2048, double* %10, double* %8) #8, !dbg !263
  tail call void @cdft(i32 2048, i32 -1, double* %10, i32* %6, double* %8) #9, !dbg !264
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !265) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata !236, i64 0, metadata !268) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata !269, i64 0, metadata !270) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !271) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !272) #6, !dbg !273
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !274) #6, !dbg !275
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !276) #6, !dbg !277
  br label %22, !dbg !277

; <label>:22                                      ; preds = %22, %putdata.exit
  %indvars.iv.i3 = phi i64 [ %indvars.iv.next.i4, %22 ], [ 0, %putdata.exit ]
  %err.04.i = phi double [ %err.0..i, %22 ], [ 0.000000e+00, %putdata.exit ]
  %seed.03.i = phi i32 [ %phitmp2.i, %22 ], [ 54773, %putdata.exit ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03.i}, i64 0, metadata !272) #6, !dbg !279
  %23 = sitofp i32 %seed.03.i to double, !dbg !279
  %24 = fmul double %23, 0x3ED02E85C0898B71, !dbg !279
  %25 = getelementptr inbounds double* %10, i64 %indvars.iv.i3, !dbg !279
  %26 = load double* %25, align 8, !dbg !279, !tbaa !245
  %27 = fmul double %26, 9.765625e-04, !dbg !279
  %28 = fsub double %24, %27, !dbg !279
  tail call void @llvm.dbg.value(metadata !{double %28}, i64 0, metadata !281) #6, !dbg !279
  %29 = tail call double @fabs(double %28) #10, !dbg !282
  %30 = fcmp ogt double %err.04.i, %29, !dbg !282
  %err.0..i = select i1 %30, double %err.04.i, double %29, !dbg !282
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !274) #6, !dbg !282
  %indvars.iv.next.i4 = add nsw i64 %indvars.iv.i3, 1, !dbg !277
  %phitmp.i = mul i32 %seed.03.i, 7141, !dbg !277
  %phitmp1.i = add i32 %phitmp.i, 54773, !dbg !277
  %phitmp2.i = srem i32 %phitmp1.i, 259200, !dbg !277
  %exitcond27 = icmp eq i64 %indvars.iv.next.i4, 2048, !dbg !277
  br i1 %exitcond27, label %errorcheck.exit, label %22, !dbg !277

errorcheck.exit:                                  ; preds = %22
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !24), !dbg !266
  %31 = tail call double @fabs(double %err.0..i) #10, !dbg !283
  %32 = fcmp ogt double %31, 1.000000e-10, !dbg !283
  br i1 %32, label %33, label %35, !dbg !283

; <label>:33                                      ; preds = %errorcheck.exit
  %34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i64 0, i64 0), double %err.0..i) #8, !dbg !285
  tail call void @abort() #11, !dbg !287
  unreachable, !dbg !287

; <label>:35                                      ; preds = %errorcheck.exit
  tail call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 16384, i32 8, i1 false), !dbg !288
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !289), !dbg !291
  tail call void @llvm.dbg.value(metadata !292, i64 0, metadata !293), !dbg !291
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !294), !dbg !291
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !295), !dbg !296
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !297), !dbg !298
  br label %36, !dbg !298

; <label>:36                                      ; preds = %36, %35
  %indvars.iv.i5 = phi i64 [ %indvars.iv.next.i7, %36 ], [ 0, %35 ]
  %seed.02.i6 = phi i32 [ %39, %36 ], [ 0, %35 ]
  %37 = mul nsw i32 %seed.02.i6, 7141, !dbg !299
  %38 = add nsw i32 %37, 54773, !dbg !299
  %39 = srem i32 %38, 259200, !dbg !299
  tail call void @llvm.dbg.value(metadata !{i32 %39}, i64 0, metadata !295), !dbg !299
  %40 = sitofp i32 %39 to double, !dbg !299
  %41 = fmul double %40, 0x3ED02E85C0898B71, !dbg !299
  %42 = getelementptr inbounds double* %10, i64 %indvars.iv.i5, !dbg !299
  store double %41, double* %42, align 8, !dbg !299, !tbaa !245
  %indvars.iv.next.i7 = add nsw i64 %indvars.iv.i5, 1, !dbg !298
  %exitcond26 = icmp eq i64 %indvars.iv.next.i7, 1024, !dbg !298
  br i1 %exitcond26, label %putdata.exit8, label %36, !dbg !298

putdata.exit8:                                    ; preds = %36
  tail call void @llvm.dbg.value(metadata !249, i64 0, metadata !300) #6, !dbg !302
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !303) #6, !dbg !302
  tail call void @llvm.dbg.value(metadata !{double* %10}, i64 0, metadata !304) #6, !dbg !302
  tail call void @llvm.dbg.value(metadata !{i32* %6}, i64 0, metadata !305) #6, !dbg !302
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !306) #6, !dbg !302
  tail call fastcc void @bitrv2(i32 2048, i32* %6, double* %10) #8, !dbg !307
  tail call fastcc void @cftfsub(i32 2048, double* %10, double* %8) #8, !dbg !308
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !11), !dbg !309
  br label %43, !dbg !309

; <label>:43                                      ; preds = %43, %putdata.exit8
  %indvars.iv23 = phi i64 [ 0, %putdata.exit8 ], [ %indvars.iv.next24, %43 ]
  %44 = shl nsw i64 %indvars.iv23, 1, !dbg !311
  %45 = or i64 %44, 1, !dbg !311
  %46 = getelementptr inbounds double* %10, i64 %45, !dbg !311
  %47 = load double* %46, align 8, !dbg !311, !tbaa !245
  %48 = fsub double -0.000000e+00, %47, !dbg !311
  store double %48, double* %46, align 8, !dbg !311, !tbaa !245
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !309
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1024, !dbg !309
  br i1 %exitcond25, label %49, label %43, !dbg !309

; <label>:49                                      ; preds = %43
  tail call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 16384, i32 8, i1 false), !dbg !312
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !313), !dbg !315
  tail call void @llvm.dbg.value(metadata !292, i64 0, metadata !316), !dbg !315
  tail call void @llvm.dbg.value(metadata !{double* %21}, i64 0, metadata !317), !dbg !315
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !318), !dbg !319
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !320), !dbg !321
  br label %50, !dbg !321

; <label>:50                                      ; preds = %50, %49
  %indvars.iv.i9 = phi i64 [ %indvars.iv.next.i11, %50 ], [ 0, %49 ]
  %seed.02.i10 = phi i32 [ %53, %50 ], [ 0, %49 ]
  %51 = mul nsw i32 %seed.02.i10, 7141, !dbg !322
  %52 = add nsw i32 %51, 54773, !dbg !322
  %53 = srem i32 %52, 259200, !dbg !322
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !318), !dbg !322
  %54 = sitofp i32 %53 to double, !dbg !322
  %55 = fmul double %54, 0x3ED02E85C0898B71, !dbg !322
  %56 = getelementptr inbounds double* %21, i64 %indvars.iv.i9, !dbg !322
  store double %55, double* %56, align 8, !dbg !322, !tbaa !245
  %indvars.iv.next.i11 = add nsw i64 %indvars.iv.i9, 1, !dbg !321
  %exitcond22 = icmp eq i64 %indvars.iv.next.i11, 1024, !dbg !321
  br i1 %exitcond22, label %putdata.exit12, label %50, !dbg !321

putdata.exit12:                                   ; preds = %50
  %57 = bitcast %struct.timeval* %tv.i13 to i8*, !dbg !323
  call void @llvm.lifetime.start(i64 16, i8* %57) #6, !dbg !323
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i13}, metadata !59) #6, !dbg !323
  %58 = call i32 @gettimeofday(%struct.timeval* %tv.i13, %struct.timezone* null) #8, !dbg !325
  call void @llvm.lifetime.end(i64 16, i8* %57) #6, !dbg !326
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !10), !dbg !327
  br label %59, !dbg !327

; <label>:59                                      ; preds = %77, %putdata.exit12
  %i.016 = phi i32 [ 0, %putdata.exit12 ], [ %78, %77 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 16384, i32 8, i1 false), !dbg !328
  tail call void @llvm.dbg.value(metadata !249, i64 0, metadata !329) #6, !dbg !331
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !332) #6, !dbg !331
  tail call void @llvm.dbg.value(metadata !{double* %20}, i64 0, metadata !333) #6, !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32* %6}, i64 0, metadata !334) #6, !dbg !331
  tail call void @llvm.dbg.value(metadata !{double* %8}, i64 0, metadata !335) #6, !dbg !331
  tail call fastcc void @bitrv2(i32 2048, i32* %6, double* %20) #8, !dbg !336
  tail call fastcc void @cftfsub(i32 2048, double* %20, double* %8) #8, !dbg !337
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !25), !dbg !338
  br label %60, !dbg !338

; <label>:60                                      ; preds = %60, %59
  %indvars.iv18 = phi i64 [ 0, %59 ], [ %indvars.iv.next19, %60 ]
  %61 = shl nsw i64 %indvars.iv18, 1, !dbg !339
  %62 = getelementptr inbounds double* %20, i64 %61, !dbg !339
  %63 = load double* %62, align 8, !dbg !339, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !28), !dbg !339
  %64 = getelementptr inbounds double* %10, i64 %61, !dbg !340
  %65 = load double* %64, align 8, !dbg !340, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %65}, i64 0, metadata !31), !dbg !340
  %66 = or i64 %61, 1, !dbg !341
  %67 = getelementptr inbounds double* %20, i64 %66, !dbg !341
  %68 = load double* %67, align 8, !dbg !341, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !32), !dbg !341
  %69 = getelementptr inbounds double* %10, i64 %66, !dbg !342
  %70 = load double* %69, align 8, !dbg !342, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !33), !dbg !342
  %71 = fmul double %63, %65, !dbg !343
  %72 = fmul double %68, %70, !dbg !343
  %73 = fsub double %71, %72, !dbg !343
  store double %73, double* %62, align 8, !dbg !343, !tbaa !245
  %74 = fmul double %63, %70, !dbg !344
  %75 = fmul double %65, %68, !dbg !344
  %76 = fadd double %75, %74, !dbg !344
  store double %76, double* %67, align 8, !dbg !344, !tbaa !245
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1, !dbg !338
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1024, !dbg !338
  br i1 %exitcond20, label %77, label %60, !dbg !338

; <label>:77                                      ; preds = %60
  tail call void @cdft(i32 2048, i32 -1, double* %20, i32* %6, double* %8) #9, !dbg !345
  %78 = add nsw i32 %i.016, 1, !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !10), !dbg !327
  %exitcond21 = icmp eq i32 %78, 150000, !dbg !327
  br i1 %exitcond21, label %79, label %59, !dbg !327

; <label>:79                                      ; preds = %77
  %80 = bitcast %struct.timeval* %tv.i2 to i8*, !dbg !346
  call void @llvm.lifetime.start(i64 16, i8* %80) #6, !dbg !346
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i2}, metadata !59) #6, !dbg !346
  %81 = call i32 @gettimeofday(%struct.timeval* %tv.i2, %struct.timezone* null) #8, !dbg !348
  call void @llvm.lifetime.end(i64 16, i8* %80) #6, !dbg !349
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !11), !dbg !350
  br label %82, !dbg !350

; <label>:82                                      ; preds = %82, %79
  %indvars.iv = phi i64 [ 0, %79 ], [ %indvars.iv.next, %82 ]
  %83 = shl nsw i64 %indvars.iv, 1, !dbg !352
  %84 = getelementptr inbounds double* %20, i64 %83, !dbg !352
  %85 = load double* %84, align 8, !dbg !352, !tbaa !245
  %86 = tail call double @fabs(double %85) #10, !dbg !352
  %87 = fcmp ogt double %86, 1.000000e-09, !dbg !352
  %88 = select i1 %87, double %85, double 0.000000e+00, !dbg !352
  %89 = or i64 %83, 1, !dbg !354
  %90 = getelementptr inbounds double* %20, i64 %89, !dbg !354
  %91 = load double* %90, align 8, !dbg !354, !tbaa !245
  %92 = tail call double @fabs(double %91) #10, !dbg !354
  %93 = fcmp ogt double %92, 1.000000e-09, !dbg !354
  %94 = select i1 %93, double %91, double 0.000000e+00, !dbg !354
  %95 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), double %88, double %94) #8, !dbg !355
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !350
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !350
  br i1 %exitcond, label %96, label %82, !dbg !350

; <label>:96                                      ; preds = %82
  tail call void @free(i8* %9) #8, !dbg !356
  tail call void @free(i8* %7) #8, !dbg !357
  tail call void @free(i8* %5) #8, !dbg !358
  tail call void @free(i8* %11) #8, !dbg !359
  tail call void @free(i8* %12) #8, !dbg !360
  ret i32 0, !dbg !361
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind optsize uwtable
define double @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !59), !dbg !362
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #8, !dbg !363
  %2 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0, !dbg !364
  %3 = load i64* %2, align 8, !dbg !364, !tbaa !365
  %4 = sitofp i64 %3 to double, !dbg !364
  %5 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1, !dbg !364
  %6 = load i64* %5, align 8, !dbg !364, !tbaa !368
  %7 = sitofp i64 %6 to double, !dbg !364
  %8 = fmul double %7, 1.000000e-06, !dbg !364
  %9 = fadd double %4, %8, !dbg !364
  ret double %9, !dbg !364
}

; Function Attrs: nounwind optsize
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: nounwind optsize uwtable
define void @makewt(i32 %nw, i32* nocapture %ip, double* %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nw}, i64 0, metadata !82), !dbg !369
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !83), !dbg !369
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !84), !dbg !369
  %1 = icmp sgt i32 %nw, 2, !dbg !370
  br i1 %1, label %2, label %31, !dbg !370

; <label>:2                                       ; preds = %0
  %3 = ashr i32 %nw, 1, !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !86), !dbg !372
  %4 = sitofp i32 %3 to double, !dbg !374
  %5 = fdiv double 0x3FE921FB54442D18, %4, !dbg !374
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !87), !dbg !374
  store double 1.000000e+00, double* %w, align 8, !dbg !375, !tbaa !245
  %6 = getelementptr inbounds double* %w, i64 1, !dbg !376
  store double 0.000000e+00, double* %6, align 8, !dbg !376, !tbaa !245
  %7 = fmul double %4, %5, !dbg !377
  %8 = tail call double @cos(double %7) #8, !dbg !377
  %9 = sext i32 %3 to i64, !dbg !377
  %10 = getelementptr inbounds double* %w, i64 %9, !dbg !377
  store double %8, double* %10, align 8, !dbg !377, !tbaa !245
  %11 = add nsw i32 %3, 1, !dbg !378
  %12 = sext i32 %11 to i64, !dbg !378
  %13 = getelementptr inbounds double* %w, i64 %12, !dbg !378
  store double %8, double* %13, align 8, !dbg !378, !tbaa !245
  %14 = icmp sgt i32 %3, 2, !dbg !379
  br i1 %14, label %.lr.ph, label %31, !dbg !379

.lr.ph:                                           ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 2, %2 ]
  %15 = trunc i64 %indvars.iv to i32, !dbg !381
  %16 = sitofp i32 %15 to double, !dbg !381
  %17 = fmul double %5, %16, !dbg !381
  %18 = tail call double @cos(double %17) #8, !dbg !381
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !88), !dbg !381
  %19 = tail call double @sin(double %17) #8, !dbg !385
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !89), !dbg !385
  %20 = getelementptr inbounds double* %w, i64 %indvars.iv, !dbg !386
  store double %18, double* %20, align 8, !dbg !386, !tbaa !245
  %21 = or i64 %indvars.iv, 1, !dbg !387
  %22 = getelementptr inbounds double* %w, i64 %21, !dbg !387
  store double %19, double* %22, align 8, !dbg !387, !tbaa !245
  %23 = sub nsw i32 %nw, %15, !dbg !388
  %24 = sext i32 %23 to i64, !dbg !388
  %25 = getelementptr inbounds double* %w, i64 %24, !dbg !388
  store double %19, double* %25, align 8, !dbg !388, !tbaa !245
  %26 = add nsw i32 %23, 1, !dbg !389
  %27 = sext i32 %26 to i64, !dbg !389
  %28 = getelementptr inbounds double* %w, i64 %27, !dbg !389
  store double %18, double* %28, align 8, !dbg !389, !tbaa !245
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !390
  %29 = trunc i64 %indvars.iv.next to i32, !dbg !390
  %30 = icmp slt i32 %29, %3, !dbg !390
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !390

._crit_edge:                                      ; preds = %.lr.ph
  tail call fastcc void @bitrv2(i32 %nw, i32* %ip, double* %w) #9, !dbg !391
  br label %31, !dbg !392

; <label>:31                                      ; preds = %2, %._crit_edge, %0
  ret void, !dbg !393
}

; Function Attrs: nounwind optsize uwtable
define void @putdata(i32 %nini, i32 %nend, double* nocapture %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !38), !dbg !394
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !39), !dbg !394
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !40), !dbg !394
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !42), !dbg !395
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !41), !dbg !396
  %1 = icmp sgt i32 %nini, %nend, !dbg !396
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !396

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !396

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %seed.02 = phi i32 [ %6, %3 ], [ 0, %.lr.ph ]
  %4 = mul nsw i32 %seed.02, 7141, !dbg !397
  %5 = add nsw i32 %4, 54773, !dbg !397
  %6 = srem i32 %5, 259200, !dbg !397
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !42), !dbg !397
  %7 = sitofp i32 %6 to double, !dbg !397
  %8 = fmul double %7, 0x3ED02E85C0898B71, !dbg !397
  %9 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !397
  store double %8, double* %9, align 8, !dbg !397, !tbaa !245
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !396
  %10 = trunc i64 %indvars.iv to i32, !dbg !396
  %11 = icmp slt i32 %10, %nend, !dbg !396
  br i1 %11, label %3, label %._crit_edge, !dbg !396

._crit_edge:                                      ; preds = %3, %0
  ret void, !dbg !398
}

; Function Attrs: nounwind optsize uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* nocapture %ip, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !73), !dbg !399
  tail call void @llvm.dbg.value(metadata !{i32 %isgn}, i64 0, metadata !74), !dbg !399
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !75), !dbg !399
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !76), !dbg !399
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !77), !dbg !399
  %1 = icmp sgt i32 %n, 4, !dbg !400
  br i1 %1, label %2, label %283, !dbg !400

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %isgn, -1, !dbg !401
  br i1 %3, label %4, label %5, !dbg !401

; <label>:4                                       ; preds = %2
  tail call fastcc void @bitrv2(i32 %n, i32* %ip, double* %a) #9, !dbg !402
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w) #9, !dbg !403
  br label %cftbsub.exit, !dbg !404

; <label>:5                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !405), !dbg !408
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !409), !dbg !408
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !410), !dbg !408
  store i32 0, i32* %ip, align 4, !dbg !411, !tbaa !412
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !414), !dbg !415
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !416), !dbg !417
  %6 = icmp sgt i32 %n, 8, !dbg !418
  br i1 %6, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !418

.lr.ph18.i:                                       ; preds = %5, %._crit_edge13.i
  %m.015.i = phi i32 [ %16, %._crit_edge13.i ], [ 1, %5 ]
  %l.014.i = phi i32 [ %7, %._crit_edge13.i ], [ %n, %5 ]
  %7 = ashr i32 %l.014.i, 1, !dbg !419
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !414), !dbg !419
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !421), !dbg !422
  %8 = icmp sgt i32 %m.015.i, 0, !dbg !422
  br i1 %8, label %.lr.ph12.i, label %._crit_edge13.i, !dbg !422

.lr.ph12.i:                                       ; preds = %.lr.ph18.i
  %9 = sext i32 %m.015.i to i64, !dbg !422
  br label %10, !dbg !422

; <label>:10                                      ; preds = %10, %.lr.ph12.i
  %indvars.iv41.i = phi i64 [ 0, %.lr.ph12.i ], [ %indvars.iv.next42.i, %10 ]
  %11 = getelementptr inbounds i32* %ip, i64 %indvars.iv41.i, !dbg !424
  %12 = load i32* %11, align 4, !dbg !424, !tbaa !412
  %13 = add nsw i32 %12, %7, !dbg !424
  %14 = add nsw i64 %indvars.iv41.i, %9, !dbg !424
  %15 = getelementptr inbounds i32* %ip, i64 %14, !dbg !424
  store i32 %13, i32* %15, align 4, !dbg !424, !tbaa !412
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !422
  %lftr.wideiv22 = trunc i64 %indvars.iv.next42.i to i32, !dbg !422
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %m.015.i, !dbg !422
  br i1 %exitcond23, label %._crit_edge13.i, label %10, !dbg !422

._crit_edge13.i:                                  ; preds = %10, %.lr.ph18.i
  %16 = shl i32 %m.015.i, 1, !dbg !426
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !416), !dbg !426
  %17 = shl i32 %m.015.i, 4, !dbg !418
  %18 = icmp slt i32 %17, %7, !dbg !418
  br i1 %18, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !418

._crit_edge19.i:                                  ; preds = %._crit_edge13.i, %5
  %.lcssa.i = phi i32 [ 8, %5 ], [ %17, %._crit_edge13.i ]
  %m.0.lcssa.i = phi i32 [ 1, %5 ], [ %16, %._crit_edge13.i ]
  %l.0.lcssa.i = phi i32 [ %n, %5 ], [ %7, %._crit_edge13.i ]
  %19 = shl nsw i32 %m.0.lcssa.i, 1, !dbg !427
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !428), !dbg !427
  %20 = icmp eq i32 %.lcssa.i, %l.0.lcssa.i, !dbg !429
  br i1 %20, label %.preheader1.i, label %134, !dbg !429

.preheader1.i:                                    ; preds = %._crit_edge19.i
  %21 = icmp sgt i32 %m.0.lcssa.i, 0, !dbg !431
  br i1 %21, label %.preheader.lr.ph.i, label %bitrv2conj.exit, !dbg !431

.preheader.lr.ph.i:                               ; preds = %.preheader1.i
  %22 = or i32 %19, 1, !dbg !434
  %23 = shl i32 %m.0.lcssa.i, 2, !dbg !436
  br label %.preheader.i, !dbg !431

.preheader.i:                                     ; preds = %._crit_edge.i, %.preheader.lr.ph.i
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %24 = trunc i64 %indvars.iv27.i to i32, !dbg !439
  %25 = icmp sgt i32 %24, 0, !dbg !439
  %26 = getelementptr inbounds i32* %ip, i64 %indvars.iv27.i, !dbg !440
  %27 = load i32* %26, align 4, !dbg !440, !tbaa !412
  %28 = shl nsw i32 %24, 1, !dbg !441
  br i1 %25, label %.lr.ph.i, label %._crit_edge.i, !dbg !439

.lr.ph.i:                                         ; preds = %.preheader.i, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.preheader.i ]
  %29 = trunc i64 %indvars.iv.i to i32, !dbg !440
  %30 = shl nsw i32 %29, 1, !dbg !440
  %31 = add nsw i32 %30, %27, !dbg !440
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !442), !dbg !440
  %32 = getelementptr inbounds i32* %ip, i64 %indvars.iv.i, !dbg !441
  %33 = load i32* %32, align 4, !dbg !441, !tbaa !412
  %34 = add nsw i32 %33, %28, !dbg !441
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !443), !dbg !441
  %35 = sext i32 %31 to i64, !dbg !444
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !444
  %37 = load double* %36, align 8, !dbg !444, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !445), !dbg !444
  %38 = add nsw i32 %31, 1, !dbg !446
  %39 = sext i32 %38 to i64, !dbg !446
  %40 = getelementptr inbounds double* %a, i64 %39, !dbg !446
  %41 = load double* %40, align 8, !dbg !446, !tbaa !245
  %42 = fsub double -0.000000e+00, %41, !dbg !446
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !447), !dbg !446
  %43 = sext i32 %34 to i64, !dbg !448
  %44 = getelementptr inbounds double* %a, i64 %43, !dbg !448
  %45 = load double* %44, align 8, !dbg !448, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !449), !dbg !448
  %46 = add nsw i32 %34, 1, !dbg !450
  %47 = sext i32 %46 to i64, !dbg !450
  %48 = getelementptr inbounds double* %a, i64 %47, !dbg !450
  %49 = load double* %48, align 8, !dbg !450, !tbaa !245
  %50 = fsub double -0.000000e+00, %49, !dbg !450
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !451), !dbg !450
  store double %45, double* %36, align 8, !dbg !452, !tbaa !245
  store double %50, double* %40, align 8, !dbg !453, !tbaa !245
  store double %37, double* %44, align 8, !dbg !454, !tbaa !245
  store double %42, double* %48, align 8, !dbg !455, !tbaa !245
  %51 = add nsw i32 %31, %19, !dbg !456
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !442), !dbg !456
  %52 = add nsw i32 %34, %23, !dbg !436
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !443), !dbg !436
  %53 = sext i32 %51 to i64, !dbg !457
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !457
  %55 = load double* %54, align 8, !dbg !457, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !445), !dbg !457
  %56 = add nsw i32 %51, 1, !dbg !458
  %57 = sext i32 %56 to i64, !dbg !458
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !458
  %59 = load double* %58, align 8, !dbg !458, !tbaa !245
  %60 = fsub double -0.000000e+00, %59, !dbg !458
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !447), !dbg !458
  %61 = sext i32 %52 to i64, !dbg !459
  %62 = getelementptr inbounds double* %a, i64 %61, !dbg !459
  %63 = load double* %62, align 8, !dbg !459, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !449), !dbg !459
  %64 = add nsw i32 %52, 1, !dbg !460
  %65 = sext i32 %64 to i64, !dbg !460
  %66 = getelementptr inbounds double* %a, i64 %65, !dbg !460
  %67 = load double* %66, align 8, !dbg !460, !tbaa !245
  %68 = fsub double -0.000000e+00, %67, !dbg !460
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !451), !dbg !460
  store double %63, double* %54, align 8, !dbg !461, !tbaa !245
  store double %68, double* %58, align 8, !dbg !462, !tbaa !245
  store double %55, double* %62, align 8, !dbg !463, !tbaa !245
  store double %60, double* %66, align 8, !dbg !464, !tbaa !245
  %69 = add nsw i32 %51, %19, !dbg !465
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !442), !dbg !465
  %70 = sub nsw i32 %52, %19, !dbg !466
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !443), !dbg !466
  %71 = sext i32 %69 to i64, !dbg !467
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !467
  %73 = load double* %72, align 8, !dbg !467, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !445), !dbg !467
  %74 = add nsw i32 %69, 1, !dbg !468
  %75 = sext i32 %74 to i64, !dbg !468
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !468
  %77 = load double* %76, align 8, !dbg !468, !tbaa !245
  %78 = fsub double -0.000000e+00, %77, !dbg !468
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !447), !dbg !468
  %79 = sext i32 %70 to i64, !dbg !469
  %80 = getelementptr inbounds double* %a, i64 %79, !dbg !469
  %81 = load double* %80, align 8, !dbg !469, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !449), !dbg !469
  %82 = add nsw i32 %70, 1, !dbg !470
  %83 = sext i32 %82 to i64, !dbg !470
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !470
  %85 = load double* %84, align 8, !dbg !470, !tbaa !245
  %86 = fsub double -0.000000e+00, %85, !dbg !470
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !451), !dbg !470
  store double %81, double* %72, align 8, !dbg !471, !tbaa !245
  store double %86, double* %76, align 8, !dbg !472, !tbaa !245
  store double %73, double* %80, align 8, !dbg !473, !tbaa !245
  store double %78, double* %84, align 8, !dbg !474, !tbaa !245
  %87 = add nsw i32 %69, %19, !dbg !475
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !442), !dbg !475
  %88 = add nsw i32 %70, %23, !dbg !476
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !443), !dbg !476
  %89 = sext i32 %87 to i64, !dbg !477
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !477
  %91 = load double* %90, align 8, !dbg !477, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !445), !dbg !477
  %92 = add nsw i32 %87, 1, !dbg !478
  %93 = sext i32 %92 to i64, !dbg !478
  %94 = getelementptr inbounds double* %a, i64 %93, !dbg !478
  %95 = load double* %94, align 8, !dbg !478, !tbaa !245
  %96 = fsub double -0.000000e+00, %95, !dbg !478
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !447), !dbg !478
  %97 = sext i32 %88 to i64, !dbg !479
  %98 = getelementptr inbounds double* %a, i64 %97, !dbg !479
  %99 = load double* %98, align 8, !dbg !479, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !449), !dbg !479
  %100 = add nsw i32 %88, 1, !dbg !480
  %101 = sext i32 %100 to i64, !dbg !480
  %102 = getelementptr inbounds double* %a, i64 %101, !dbg !480
  %103 = load double* %102, align 8, !dbg !480, !tbaa !245
  %104 = fsub double -0.000000e+00, %103, !dbg !480
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !451), !dbg !480
  store double %99, double* %90, align 8, !dbg !481, !tbaa !245
  store double %104, double* %94, align 8, !dbg !482, !tbaa !245
  store double %91, double* %98, align 8, !dbg !483, !tbaa !245
  store double %96, double* %102, align 8, !dbg !484, !tbaa !245
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !439
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !439
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !439
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i, !dbg !439

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.preheader.i
  %105 = add nsw i32 %27, %28, !dbg !485
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !443), !dbg !485
  %106 = add nsw i32 %105, 1, !dbg !486
  %107 = sext i32 %106 to i64, !dbg !486
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !486
  %109 = load double* %108, align 8, !dbg !486, !tbaa !245
  %110 = fsub double -0.000000e+00, %109, !dbg !486
  store double %110, double* %108, align 8, !dbg !486, !tbaa !245
  %111 = add nsw i32 %105, %19, !dbg !487
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !442), !dbg !487
  %112 = add nsw i32 %111, %19, !dbg !488
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !443), !dbg !488
  %113 = sext i32 %111 to i64, !dbg !489
  %114 = getelementptr inbounds double* %a, i64 %113, !dbg !489
  %115 = load double* %114, align 8, !dbg !489, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %115}, i64 0, metadata !445), !dbg !489
  %116 = add nsw i32 %111, 1, !dbg !490
  %117 = sext i32 %116 to i64, !dbg !490
  %118 = getelementptr inbounds double* %a, i64 %117, !dbg !490
  %119 = load double* %118, align 8, !dbg !490, !tbaa !245
  %120 = fsub double -0.000000e+00, %119, !dbg !490
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !447), !dbg !490
  %121 = sext i32 %112 to i64, !dbg !491
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !491
  %123 = load double* %122, align 8, !dbg !491, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %123}, i64 0, metadata !449), !dbg !491
  %124 = add nsw i32 %112, 1, !dbg !492
  %125 = sext i32 %124 to i64, !dbg !492
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !492
  %127 = load double* %126, align 8, !dbg !492, !tbaa !245
  %128 = fsub double -0.000000e+00, %127, !dbg !492
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !451), !dbg !492
  store double %123, double* %114, align 8, !dbg !493, !tbaa !245
  store double %128, double* %118, align 8, !dbg !494, !tbaa !245
  store double %115, double* %122, align 8, !dbg !495, !tbaa !245
  store double %120, double* %126, align 8, !dbg !496, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !443), !dbg !434
  %129 = add i32 %112, %22, !dbg !497
  %130 = sext i32 %129 to i64, !dbg !497
  %131 = getelementptr inbounds double* %a, i64 %130, !dbg !497
  %132 = load double* %131, align 8, !dbg !497, !tbaa !245
  %133 = fsub double -0.000000e+00, %132, !dbg !497
  store double %133, double* %131, align 8, !dbg !497, !tbaa !245
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !431
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !431
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !498), !dbg !431
  %lftr.wideiv14 = trunc i64 %indvars.iv.next28.i to i32, !dbg !431
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %m.0.lcssa.i, !dbg !431
  br i1 %exitcond15, label %bitrv2conj.exit, label %.preheader.i, !dbg !431

; <label>:134                                     ; preds = %._crit_edge19.i
  %135 = getelementptr inbounds double* %a, i64 1, !dbg !499
  %136 = load double* %135, align 8, !dbg !499, !tbaa !245
  %137 = fsub double -0.000000e+00, %136, !dbg !499
  store double %137, double* %135, align 8, !dbg !499, !tbaa !245
  %138 = or i32 %19, 1, !dbg !501
  %139 = sext i32 %138 to i64, !dbg !501
  %140 = getelementptr inbounds double* %a, i64 %139, !dbg !501
  %141 = load double* %140, align 8, !dbg !501, !tbaa !245
  %142 = fsub double -0.000000e+00, %141, !dbg !501
  store double %142, double* %140, align 8, !dbg !501, !tbaa !245
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !498), !dbg !502
  %143 = icmp sgt i32 %m.0.lcssa.i, 1, !dbg !502
  br i1 %143, label %.lr.ph7.i, label %bitrv2conj.exit, !dbg !502

.lr.ph7.i:                                        ; preds = %134, %._crit_edge8.i
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %._crit_edge8.i ], [ 1, %134 ]
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %._crit_edge8.i ], [ 1, %134 ]
  %144 = getelementptr inbounds i32* %ip, i64 %indvars.iv37.i, !dbg !504
  %145 = load i32* %144, align 4, !dbg !504, !tbaa !412
  %146 = trunc i64 %indvars.iv37.i to i32, !dbg !508
  %147 = shl nsw i32 %146, 1, !dbg !508
  br label %148, !dbg !509

; <label>:148                                     ; preds = %148, %.lr.ph7.i
  %indvars.iv31.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next32.i, %148 ]
  %149 = trunc i64 %indvars.iv31.i to i32, !dbg !504
  %150 = shl nsw i32 %149, 1, !dbg !504
  %151 = add nsw i32 %150, %145, !dbg !504
  tail call void @llvm.dbg.value(metadata !{i32 %151}, i64 0, metadata !442), !dbg !504
  %152 = getelementptr inbounds i32* %ip, i64 %indvars.iv31.i, !dbg !508
  %153 = load i32* %152, align 4, !dbg !508, !tbaa !412
  %154 = add nsw i32 %153, %147, !dbg !508
  tail call void @llvm.dbg.value(metadata !{i32 %154}, i64 0, metadata !443), !dbg !508
  %155 = sext i32 %151 to i64, !dbg !510
  %156 = getelementptr inbounds double* %a, i64 %155, !dbg !510
  %157 = load double* %156, align 8, !dbg !510, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %157}, i64 0, metadata !445), !dbg !510
  %158 = add nsw i32 %151, 1, !dbg !511
  %159 = sext i32 %158 to i64, !dbg !511
  %160 = getelementptr inbounds double* %a, i64 %159, !dbg !511
  %161 = load double* %160, align 8, !dbg !511, !tbaa !245
  %162 = fsub double -0.000000e+00, %161, !dbg !511
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !447), !dbg !511
  %163 = sext i32 %154 to i64, !dbg !512
  %164 = getelementptr inbounds double* %a, i64 %163, !dbg !512
  %165 = load double* %164, align 8, !dbg !512, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %165}, i64 0, metadata !449), !dbg !512
  %166 = add nsw i32 %154, 1, !dbg !513
  %167 = sext i32 %166 to i64, !dbg !513
  %168 = getelementptr inbounds double* %a, i64 %167, !dbg !513
  %169 = load double* %168, align 8, !dbg !513, !tbaa !245
  %170 = fsub double -0.000000e+00, %169, !dbg !513
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !451), !dbg !513
  store double %165, double* %156, align 8, !dbg !514, !tbaa !245
  store double %170, double* %160, align 8, !dbg !515, !tbaa !245
  store double %157, double* %164, align 8, !dbg !516, !tbaa !245
  store double %162, double* %168, align 8, !dbg !517, !tbaa !245
  %171 = add nsw i32 %151, %19, !dbg !518
  tail call void @llvm.dbg.value(metadata !{i32 %171}, i64 0, metadata !442), !dbg !518
  %172 = add nsw i32 %154, %19, !dbg !519
  tail call void @llvm.dbg.value(metadata !{i32 %172}, i64 0, metadata !443), !dbg !519
  %173 = sext i32 %171 to i64, !dbg !520
  %174 = getelementptr inbounds double* %a, i64 %173, !dbg !520
  %175 = load double* %174, align 8, !dbg !520, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !445), !dbg !520
  %176 = add nsw i32 %171, 1, !dbg !521
  %177 = sext i32 %176 to i64, !dbg !521
  %178 = getelementptr inbounds double* %a, i64 %177, !dbg !521
  %179 = load double* %178, align 8, !dbg !521, !tbaa !245
  %180 = fsub double -0.000000e+00, %179, !dbg !521
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !447), !dbg !521
  %181 = sext i32 %172 to i64, !dbg !522
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !522
  %183 = load double* %182, align 8, !dbg !522, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !449), !dbg !522
  %184 = add nsw i32 %172, 1, !dbg !523
  %185 = sext i32 %184 to i64, !dbg !523
  %186 = getelementptr inbounds double* %a, i64 %185, !dbg !523
  %187 = load double* %186, align 8, !dbg !523, !tbaa !245
  %188 = fsub double -0.000000e+00, %187, !dbg !523
  tail call void @llvm.dbg.value(metadata !{double %188}, i64 0, metadata !451), !dbg !523
  store double %183, double* %174, align 8, !dbg !524, !tbaa !245
  store double %188, double* %178, align 8, !dbg !525, !tbaa !245
  store double %175, double* %182, align 8, !dbg !526, !tbaa !245
  store double %180, double* %186, align 8, !dbg !527, !tbaa !245
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !509
  %lftr.wideiv18 = trunc i64 %indvars.iv.next32.i to i32, !dbg !509
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %indvars.iv16, !dbg !509
  br i1 %exitcond19, label %._crit_edge8.i, label %148, !dbg !509

._crit_edge8.i:                                   ; preds = %148
  %189 = add nsw i32 %145, %147, !dbg !528
  tail call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !443), !dbg !528
  %190 = add nsw i32 %189, 1, !dbg !529
  %191 = sext i32 %190 to i64, !dbg !529
  %192 = getelementptr inbounds double* %a, i64 %191, !dbg !529
  %193 = load double* %192, align 8, !dbg !529, !tbaa !245
  %194 = fsub double -0.000000e+00, %193, !dbg !529
  store double %194, double* %192, align 8, !dbg !529, !tbaa !245
  %195 = add i32 %189, %138, !dbg !530
  %196 = sext i32 %195 to i64, !dbg !530
  %197 = getelementptr inbounds double* %a, i64 %196, !dbg !530
  %198 = load double* %197, align 8, !dbg !530, !tbaa !245
  %199 = fsub double -0.000000e+00, %198, !dbg !530
  store double %199, double* %197, align 8, !dbg !530, !tbaa !245
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1, !dbg !502
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, 1, !dbg !502
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next17}, i64 0, metadata !498), !dbg !502
  %lftr.wideiv20 = trunc i64 %indvars.iv.next38.i to i32, !dbg !502
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %m.0.lcssa.i, !dbg !502
  br i1 %exitcond21, label %bitrv2conj.exit, label %.lr.ph7.i, !dbg !502

bitrv2conj.exit:                                  ; preds = %._crit_edge8.i, %._crit_edge.i, %.preheader1.i, %134
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !531) #6, !dbg !533
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !534) #6, !dbg !533
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !535) #6, !dbg !533
  tail call void @llvm.dbg.value(metadata !536, i64 0, metadata !537) #6, !dbg !538
  br i1 %6, label %200, label %.loopexit3.i, !dbg !539

; <label>:200                                     ; preds = %bitrv2conj.exit
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #8, !dbg !541
  tail call void @llvm.dbg.value(metadata !543, i64 0, metadata !537) #6, !dbg !544
  %201 = icmp sgt i32 %n, 32, !dbg !545
  br i1 %201, label %.lr.ph8.i, label %.loopexit3.i, !dbg !545

.lr.ph8.i:                                        ; preds = %200, %.lr.ph8.i
  %202 = phi i32 [ %203, %.lr.ph8.i ], [ 32, %200 ]
  %l.07.i = phi i32 [ %202, %.lr.ph8.i ], [ 8, %200 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07.i, double* %a, double* %w) #8, !dbg !546
  tail call void @llvm.dbg.value(metadata !{i32 %202}, i64 0, metadata !537) #6, !dbg !548
  %203 = shl i32 %202, 2, !dbg !545
  %204 = icmp slt i32 %203, %n, !dbg !545
  br i1 %204, label %.lr.ph8.i, label %.loopexit3.i, !dbg !545

.loopexit3.i:                                     ; preds = %.lr.ph8.i, %200, %bitrv2conj.exit
  %l.1.i = phi i32 [ 2, %bitrv2conj.exit ], [ 8, %200 ], [ %202, %.lr.ph8.i ]
  %205 = shl i32 %l.1.i, 2, !dbg !549
  %206 = icmp eq i32 %205, %n, !dbg !549
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !551) #6, !dbg !552
  %207 = icmp sgt i32 %l.1.i, 0, !dbg !552
  br i1 %206, label %.preheader.i2, label %.preheader1.i1, !dbg !549

.preheader1.i1:                                   ; preds = %.loopexit3.i
  br i1 %207, label %.lr.ph6.i, label %cftbsub.exit, !dbg !555

.lr.ph6.i:                                        ; preds = %.preheader1.i1
  %208 = sext i32 %l.1.i to i64, !dbg !555
  br label %259, !dbg !555

.preheader.i2:                                    ; preds = %.loopexit3.i
  br i1 %207, label %.lr.ph.i3, label %cftbsub.exit, !dbg !552

.lr.ph.i3:                                        ; preds = %.preheader.i2
  %209 = sext i32 %l.1.i to i64, !dbg !552
  br label %210, !dbg !552

; <label>:210                                     ; preds = %210, %.lr.ph.i3
  %indvars.iv.i4 = phi i64 [ 0, %.lr.ph.i3 ], [ %indvars.iv.next.i5, %210 ]
  %211 = add nsw i64 %indvars.iv.i4, %209, !dbg !558
  %212 = add nsw i64 %211, %209, !dbg !560
  %213 = add nsw i64 %212, %209, !dbg !561
  %214 = getelementptr inbounds double* %a, i64 %indvars.iv.i4, !dbg !562
  %215 = load double* %214, align 8, !dbg !562, !tbaa !245
  %216 = getelementptr inbounds double* %a, i64 %211, !dbg !562
  %217 = load double* %216, align 8, !dbg !562, !tbaa !245
  %218 = fadd double %215, %217, !dbg !562
  tail call void @llvm.dbg.value(metadata !{double %218}, i64 0, metadata !563) #6, !dbg !562
  %219 = or i64 %indvars.iv.i4, 1, !dbg !564
  %220 = getelementptr inbounds double* %a, i64 %219, !dbg !564
  %221 = load double* %220, align 8, !dbg !564, !tbaa !245
  %222 = fsub double -0.000000e+00, %221, !dbg !564
  %223 = add nsw i64 %211, 1, !dbg !564
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !564
  %225 = load double* %224, align 8, !dbg !564, !tbaa !245
  %226 = fsub double %222, %225, !dbg !564
  tail call void @llvm.dbg.value(metadata !{double %226}, i64 0, metadata !565) #6, !dbg !564
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !567) #6, !dbg !568
  %227 = insertelement <2 x double> undef, double %215, i32 0, !dbg !568
  %228 = insertelement <2 x double> %227, double %225, i32 1, !dbg !568
  %229 = insertelement <2 x double> undef, double %217, i32 0, !dbg !568
  %230 = insertelement <2 x double> %229, double %221, i32 1, !dbg !568
  %231 = fsub <2 x double> %228, %230, !dbg !568
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !569) #6, !dbg !570
  %232 = getelementptr inbounds double* %a, i64 %212, !dbg !571
  %233 = load double* %232, align 8, !dbg !571, !tbaa !245
  %234 = getelementptr inbounds double* %a, i64 %213, !dbg !571
  %235 = load double* %234, align 8, !dbg !571, !tbaa !245
  %236 = fadd double %233, %235, !dbg !571
  tail call void @llvm.dbg.value(metadata !{double %236}, i64 0, metadata !572) #6, !dbg !571
  %237 = add nsw i64 %212, 1, !dbg !573
  %238 = getelementptr inbounds double* %a, i64 %237, !dbg !573
  %239 = load double* %238, align 8, !dbg !573, !tbaa !245
  %240 = add nsw i64 %213, 1, !dbg !573
  %241 = getelementptr inbounds double* %a, i64 %240, !dbg !573
  %242 = load double* %241, align 8, !dbg !573, !tbaa !245
  %243 = fadd double %239, %242, !dbg !573
  tail call void @llvm.dbg.value(metadata !{double %243}, i64 0, metadata !574) #6, !dbg !573
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !575) #6, !dbg !576
  %244 = insertelement <2 x double> undef, double %239, i32 0, !dbg !577
  %245 = insertelement <2 x double> %244, double %233, i32 1, !dbg !577
  %246 = insertelement <2 x double> undef, double %242, i32 0, !dbg !577
  %247 = insertelement <2 x double> %246, double %235, i32 1, !dbg !577
  %248 = fsub <2 x double> %245, %247, !dbg !577
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !578) #6, !dbg !577
  %249 = fadd double %218, %236, !dbg !579
  store double %249, double* %214, align 8, !dbg !579, !tbaa !245
  %250 = fsub double %226, %243, !dbg !580
  store double %250, double* %220, align 8, !dbg !580, !tbaa !245
  %251 = fsub double %218, %236, !dbg !581
  store double %251, double* %232, align 8, !dbg !581, !tbaa !245
  %252 = fadd double %226, %243, !dbg !582
  store double %252, double* %238, align 8, !dbg !582, !tbaa !245
  %253 = fsub <2 x double> %231, %248, !dbg !583
  %254 = bitcast double* %216 to <2 x double>*, !dbg !583
  store <2 x double> %253, <2 x double>* %254, align 8, !dbg !583, !tbaa !245
  %255 = fadd <2 x double> %231, %248, !dbg !584
  %256 = bitcast double* %234 to <2 x double>*, !dbg !584
  store <2 x double> %255, <2 x double>* %256, align 8, !dbg !584, !tbaa !245
  %indvars.iv.next.i5 = add nuw nsw i64 %indvars.iv.i4, 2, !dbg !552
  %257 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !552
  %258 = icmp slt i32 %257, %l.1.i, !dbg !552
  br i1 %258, label %210, label %cftbsub.exit, !dbg !552

; <label>:259                                     ; preds = %259, %.lr.ph6.i
  %indvars.iv9.i = phi i64 [ 0, %.lr.ph6.i ], [ %indvars.iv.next10.i, %259 ]
  %260 = add nsw i64 %indvars.iv9.i, %208, !dbg !585
  %261 = getelementptr inbounds double* %a, i64 %indvars.iv9.i, !dbg !587
  %262 = load double* %261, align 8, !dbg !587, !tbaa !245
  %263 = getelementptr inbounds double* %a, i64 %260, !dbg !587
  %264 = load double* %263, align 8, !dbg !587, !tbaa !245
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !563) #6, !dbg !587
  %265 = or i64 %indvars.iv9.i, 1, !dbg !588
  %266 = getelementptr inbounds double* %a, i64 %265, !dbg !588
  %267 = load double* %266, align 8, !dbg !588, !tbaa !245
  %268 = add nsw i64 %260, 1, !dbg !588
  %269 = getelementptr inbounds double* %a, i64 %268, !dbg !588
  %270 = load double* %269, align 8, !dbg !588, !tbaa !245
  %271 = insertelement <2 x double> undef, double %262, i32 0, !dbg !587
  %272 = insertelement <2 x double> %271, double %270, i32 1, !dbg !587
  %273 = insertelement <2 x double> undef, double %264, i32 0, !dbg !587
  %274 = insertelement <2 x double> %273, double %267, i32 1, !dbg !587
  %275 = fsub <2 x double> %272, %274, !dbg !587
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !565) #6, !dbg !588
  %276 = fadd double %262, %264, !dbg !589
  store double %276, double* %261, align 8, !dbg !589, !tbaa !245
  %277 = fsub double -0.000000e+00, %267, !dbg !590
  %278 = load double* %269, align 8, !dbg !590, !tbaa !245
  %279 = fsub double %277, %278, !dbg !590
  store double %279, double* %266, align 8, !dbg !590, !tbaa !245
  %280 = bitcast double* %263 to <2 x double>*, !dbg !591
  store <2 x double> %275, <2 x double>* %280, align 8, !dbg !591, !tbaa !245
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 2, !dbg !555
  %281 = trunc i64 %indvars.iv.next10.i to i32, !dbg !555
  %282 = icmp slt i32 %281, %l.1.i, !dbg !555
  br i1 %282, label %259, label %cftbsub.exit, !dbg !555

; <label>:283                                     ; preds = %0
  %284 = icmp eq i32 %n, 4, !dbg !592
  br i1 %284, label %285, label %cftbsub.exit, !dbg !592

; <label>:285                                     ; preds = %283
  tail call fastcc void @cftfsub(i32 4, double* %a, double* %w) #9, !dbg !594
  br label %cftbsub.exit, !dbg !596

cftbsub.exit:                                     ; preds = %259, %210, %.preheader.i2, %.preheader1.i1, %283, %285, %4
  ret void, !dbg !597
}

; Function Attrs: nounwind optsize readonly uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* nocapture readonly %a) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !47), !dbg !598
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !48), !dbg !598
  tail call void @llvm.dbg.value(metadata !{double %scale}, i64 0, metadata !49), !dbg !598
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !50), !dbg !598
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !52), !dbg !599
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !53), !dbg !600
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !51), !dbg !601
  %1 = icmp sgt i32 %nini, %nend, !dbg !601
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !601

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !601

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %err.04 = phi double [ %err.0., %3 ], [ 0.000000e+00, %.lr.ph ]
  %seed.03 = phi i32 [ %phitmp2, %3 ], [ 54773, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03}, i64 0, metadata !52), !dbg !602
  %4 = sitofp i32 %seed.03 to double, !dbg !602
  %5 = fmul double %4, 0x3ED02E85C0898B71, !dbg !602
  %6 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !602
  %7 = load double* %6, align 8, !dbg !602, !tbaa !245
  %8 = fmul double %7, %scale, !dbg !602
  %9 = fsub double %5, %8, !dbg !602
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !54), !dbg !602
  %10 = tail call double @fabs(double %9) #10, !dbg !603
  %11 = fcmp ogt double %err.04, %10, !dbg !603
  %err.0. = select i1 %11, double %err.04, double %10, !dbg !603
  tail call void @llvm.dbg.value(metadata !{double %err.0.}, i64 0, metadata !53), !dbg !603
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !601
  %phitmp = mul i32 %seed.03, 7141, !dbg !601
  %phitmp1 = add i32 %phitmp, 54773, !dbg !601
  %phitmp2 = srem i32 %phitmp1, 259200, !dbg !601
  %12 = trunc i64 %indvars.iv to i32, !dbg !601
  %13 = icmp slt i32 %12, %nend, !dbg !601
  br i1 %13, label %3, label %._crit_edge, !dbg !601

._crit_edge:                                      ; preds = %3, %0
  %err.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %err.0., %3 ]
  ret double %err.0.lcssa, !dbg !604
}

; Function Attrs: nounwind optsize readnone
declare double @fabs(double) #4

; Function Attrs: nounwind optsize
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind optsize
declare void @abort() #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind optsize
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind optsize
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind optsize uwtable
define internal fastcc void @bitrv2(i32 %n, i32* nocapture %ip, double* %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !199), !dbg !605
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !200), !dbg !605
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !201), !dbg !605
  store i32 0, i32* %ip, align 4, !dbg !606, !tbaa !412
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !206), !dbg !607
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !207), !dbg !608
  %1 = icmp sgt i32 %n, 8, !dbg !609
  br i1 %1, label %.lr.ph19, label %._crit_edge20, !dbg !609

.lr.ph19:                                         ; preds = %0, %._crit_edge14
  %m.016 = phi i32 [ %11, %._crit_edge14 ], [ 1, %0 ]
  %l.015 = phi i32 [ %2, %._crit_edge14 ], [ %n, %0 ]
  %2 = ashr i32 %l.015, 1, !dbg !610
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !206), !dbg !610
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !202), !dbg !612
  %3 = icmp sgt i32 %m.016, 0, !dbg !612
  br i1 %3, label %.lr.ph13, label %._crit_edge14, !dbg !612

.lr.ph13:                                         ; preds = %.lr.ph19
  %4 = sext i32 %m.016 to i64, !dbg !612
  br label %5, !dbg !612

; <label>:5                                       ; preds = %5, %.lr.ph13
  %indvars.iv42 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next43, %5 ]
  %6 = getelementptr inbounds i32* %ip, i64 %indvars.iv42, !dbg !614
  %7 = load i32* %6, align 4, !dbg !614, !tbaa !412
  %8 = add nsw i32 %7, %2, !dbg !614
  %9 = add nsw i64 %indvars.iv42, %4, !dbg !614
  %10 = getelementptr inbounds i32* %ip, i64 %9, !dbg !614
  store i32 %8, i32* %10, align 4, !dbg !614, !tbaa !412
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !612
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !612
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %m.016, !dbg !612
  br i1 %exitcond45, label %._crit_edge14, label %5, !dbg !612

._crit_edge14:                                    ; preds = %5, %.lr.ph19
  %11 = shl i32 %m.016, 1, !dbg !616
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !207), !dbg !616
  %12 = shl i32 %m.016, 4, !dbg !609
  %13 = icmp slt i32 %12, %2, !dbg !609
  br i1 %13, label %.lr.ph19, label %._crit_edge20, !dbg !609

._crit_edge20:                                    ; preds = %._crit_edge14, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %12, %._crit_edge14 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %11, %._crit_edge14 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge14 ]
  %14 = shl nsw i32 %m.0.lcssa, 1, !dbg !617
  tail call void @llvm.dbg.value(metadata !{i32 %14}, i64 0, metadata !208), !dbg !617
  %15 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !618
  br i1 %15, label %.preheader1, label %.preheader3, !dbg !618

.preheader3:                                      ; preds = %._crit_edge20
  %16 = icmp sgt i32 %m.0.lcssa, 1, !dbg !620
  br i1 %16, label %.lr.ph8, label %.loopexit, !dbg !620

.preheader1:                                      ; preds = %._crit_edge20
  %17 = icmp sgt i32 %m.0.lcssa, 0, !dbg !623
  br i1 %17, label %.preheader.lr.ph, label %.loopexit, !dbg !623

.preheader.lr.ph:                                 ; preds = %.preheader1
  %18 = shl i32 %m.0.lcssa, 2, !dbg !626
  br label %.preheader, !dbg !623

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %19 = trunc i64 %indvars.iv28 to i32, !dbg !630
  %20 = icmp sgt i32 %19, 0, !dbg !630
  %21 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !631
  %22 = load i32* %21, align 4, !dbg !631, !tbaa !412
  %23 = shl i32 %19, 1, !dbg !632
  br i1 %20, label %.lr.ph, label %._crit_edge, !dbg !630

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %24 = trunc i64 %indvars.iv to i32, !dbg !631
  %25 = shl nsw i32 %24, 1, !dbg !631
  %26 = add nsw i32 %22, %25, !dbg !631
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !203), !dbg !631
  %27 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !632
  %28 = load i32* %27, align 4, !dbg !632, !tbaa !412
  %29 = add nsw i32 %28, %23, !dbg !632
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !205), !dbg !632
  %30 = sext i32 %26 to i64, !dbg !633
  %31 = getelementptr inbounds double* %a, i64 %30, !dbg !633
  %32 = load double* %31, align 8, !dbg !633, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %32}, i64 0, metadata !209), !dbg !633
  %33 = add nsw i32 %26, 1, !dbg !634
  %34 = sext i32 %33 to i64, !dbg !634
  %35 = getelementptr inbounds double* %a, i64 %34, !dbg !634
  %36 = load double* %35, align 8, !dbg !634, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %36}, i64 0, metadata !210), !dbg !634
  %37 = sext i32 %29 to i64, !dbg !635
  %38 = getelementptr inbounds double* %a, i64 %37, !dbg !635
  %39 = load double* %38, align 8, !dbg !635, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %39}, i64 0, metadata !211), !dbg !635
  %40 = add nsw i32 %29, 1, !dbg !636
  %41 = sext i32 %40 to i64, !dbg !636
  %42 = getelementptr inbounds double* %a, i64 %41, !dbg !636
  %43 = load double* %42, align 8, !dbg !636, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %43}, i64 0, metadata !212), !dbg !636
  store double %39, double* %31, align 8, !dbg !637, !tbaa !245
  store double %43, double* %35, align 8, !dbg !638, !tbaa !245
  store double %32, double* %38, align 8, !dbg !639, !tbaa !245
  store double %36, double* %42, align 8, !dbg !640, !tbaa !245
  %44 = add nsw i32 %26, %14, !dbg !641
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !203), !dbg !641
  %45 = add nsw i32 %29, %18, !dbg !626
  tail call void @llvm.dbg.value(metadata !{i32 %45}, i64 0, metadata !205), !dbg !626
  %46 = sext i32 %44 to i64, !dbg !642
  %47 = getelementptr inbounds double* %a, i64 %46, !dbg !642
  %48 = load double* %47, align 8, !dbg !642, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %48}, i64 0, metadata !209), !dbg !642
  %49 = add nsw i32 %44, 1, !dbg !643
  %50 = sext i32 %49 to i64, !dbg !643
  %51 = getelementptr inbounds double* %a, i64 %50, !dbg !643
  %52 = load double* %51, align 8, !dbg !643, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %52}, i64 0, metadata !210), !dbg !643
  %53 = sext i32 %45 to i64, !dbg !644
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !644
  %55 = load double* %54, align 8, !dbg !644, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !211), !dbg !644
  %56 = add nsw i32 %45, 1, !dbg !645
  %57 = sext i32 %56 to i64, !dbg !645
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !645
  %59 = load double* %58, align 8, !dbg !645, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %59}, i64 0, metadata !212), !dbg !645
  store double %55, double* %47, align 8, !dbg !646, !tbaa !245
  store double %59, double* %51, align 8, !dbg !647, !tbaa !245
  store double %48, double* %54, align 8, !dbg !648, !tbaa !245
  store double %52, double* %58, align 8, !dbg !649, !tbaa !245
  %60 = add nsw i32 %44, %14, !dbg !650
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !203), !dbg !650
  %61 = sub nsw i32 %45, %14, !dbg !651
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !205), !dbg !651
  %62 = sext i32 %60 to i64, !dbg !652
  %63 = getelementptr inbounds double* %a, i64 %62, !dbg !652
  %64 = load double* %63, align 8, !dbg !652, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !209), !dbg !652
  %65 = add nsw i32 %60, 1, !dbg !653
  %66 = sext i32 %65 to i64, !dbg !653
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !653
  %68 = load double* %67, align 8, !dbg !653, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !210), !dbg !653
  %69 = sext i32 %61 to i64, !dbg !654
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !654
  %71 = load double* %70, align 8, !dbg !654, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !211), !dbg !654
  %72 = add nsw i32 %61, 1, !dbg !655
  %73 = sext i32 %72 to i64, !dbg !655
  %74 = getelementptr inbounds double* %a, i64 %73, !dbg !655
  %75 = load double* %74, align 8, !dbg !655, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %75}, i64 0, metadata !212), !dbg !655
  store double %71, double* %63, align 8, !dbg !656, !tbaa !245
  store double %75, double* %67, align 8, !dbg !657, !tbaa !245
  store double %64, double* %70, align 8, !dbg !658, !tbaa !245
  store double %68, double* %74, align 8, !dbg !659, !tbaa !245
  %76 = add nsw i32 %60, %14, !dbg !660
  tail call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !203), !dbg !660
  %77 = add nsw i32 %61, %18, !dbg !661
  tail call void @llvm.dbg.value(metadata !{i32 %77}, i64 0, metadata !205), !dbg !661
  %78 = sext i32 %76 to i64, !dbg !662
  %79 = getelementptr inbounds double* %a, i64 %78, !dbg !662
  %80 = load double* %79, align 8, !dbg !662, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !209), !dbg !662
  %81 = add nsw i32 %76, 1, !dbg !663
  %82 = sext i32 %81 to i64, !dbg !663
  %83 = getelementptr inbounds double* %a, i64 %82, !dbg !663
  %84 = load double* %83, align 8, !dbg !663, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %84}, i64 0, metadata !210), !dbg !663
  %85 = sext i32 %77 to i64, !dbg !664
  %86 = getelementptr inbounds double* %a, i64 %85, !dbg !664
  %87 = load double* %86, align 8, !dbg !664, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !211), !dbg !664
  %88 = add nsw i32 %77, 1, !dbg !665
  %89 = sext i32 %88 to i64, !dbg !665
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !665
  %91 = load double* %90, align 8, !dbg !665, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !212), !dbg !665
  store double %87, double* %79, align 8, !dbg !666, !tbaa !245
  store double %91, double* %83, align 8, !dbg !667, !tbaa !245
  store double %80, double* %86, align 8, !dbg !668, !tbaa !245
  store double %84, double* %90, align 8, !dbg !669, !tbaa !245
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !630
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !630
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv26, !dbg !630
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !630

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %92 = add nsw i32 %23, %14, !dbg !670
  %93 = add nsw i32 %92, %22, !dbg !670
  tail call void @llvm.dbg.value(metadata !{i32 %93}, i64 0, metadata !203), !dbg !670
  %94 = add nsw i32 %93, %14, !dbg !671
  tail call void @llvm.dbg.value(metadata !{i32 %94}, i64 0, metadata !205), !dbg !671
  %95 = sext i32 %93 to i64, !dbg !672
  %96 = getelementptr inbounds double* %a, i64 %95, !dbg !672
  %97 = load double* %96, align 8, !dbg !672, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %97}, i64 0, metadata !209), !dbg !672
  %98 = add nsw i32 %93, 1, !dbg !673
  %99 = sext i32 %98 to i64, !dbg !673
  %100 = getelementptr inbounds double* %a, i64 %99, !dbg !673
  %101 = load double* %100, align 8, !dbg !673, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !210), !dbg !673
  %102 = sext i32 %94 to i64, !dbg !674
  %103 = getelementptr inbounds double* %a, i64 %102, !dbg !674
  %104 = load double* %103, align 8, !dbg !674, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !211), !dbg !674
  %105 = add nsw i32 %94, 1, !dbg !675
  %106 = sext i32 %105 to i64, !dbg !675
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !675
  %108 = load double* %107, align 8, !dbg !675, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %108}, i64 0, metadata !212), !dbg !675
  store double %104, double* %96, align 8, !dbg !676, !tbaa !245
  store double %108, double* %100, align 8, !dbg !677, !tbaa !245
  store double %97, double* %103, align 8, !dbg !678, !tbaa !245
  store double %101, double* %107, align 8, !dbg !679, !tbaa !245
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !623
  %indvars.iv.next27 = add nuw nsw i32 %indvars.iv26, 1, !dbg !623
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next27}, i64 0, metadata !204), !dbg !623
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !623
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %m.0.lcssa, !dbg !623
  br i1 %exitcond31, label %.loopexit, label %.preheader, !dbg !623

.lr.ph8:                                          ; preds = %.preheader3, %._crit_edge9
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge9 ], [ 1, %.preheader3 ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge9 ], [ 1, %.preheader3 ]
  %109 = getelementptr inbounds i32* %ip, i64 %indvars.iv38, !dbg !680
  %110 = load i32* %109, align 4, !dbg !680, !tbaa !412
  %111 = trunc i64 %indvars.iv38 to i32, !dbg !684
  %112 = shl nsw i32 %111, 1, !dbg !684
  br label %113, !dbg !685

; <label>:113                                     ; preds = %113, %.lr.ph8
  %indvars.iv32 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next33, %113 ]
  %114 = trunc i64 %indvars.iv32 to i32, !dbg !680
  %115 = shl nsw i32 %114, 1, !dbg !680
  %116 = add nsw i32 %110, %115, !dbg !680
  tail call void @llvm.dbg.value(metadata !{i32 %116}, i64 0, metadata !203), !dbg !680
  %117 = getelementptr inbounds i32* %ip, i64 %indvars.iv32, !dbg !684
  %118 = load i32* %117, align 4, !dbg !684, !tbaa !412
  %119 = add nsw i32 %118, %112, !dbg !684
  tail call void @llvm.dbg.value(metadata !{i32 %119}, i64 0, metadata !205), !dbg !684
  %120 = sext i32 %116 to i64, !dbg !686
  %121 = getelementptr inbounds double* %a, i64 %120, !dbg !686
  %122 = load double* %121, align 8, !dbg !686, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !209), !dbg !686
  %123 = add nsw i32 %116, 1, !dbg !687
  %124 = sext i32 %123 to i64, !dbg !687
  %125 = getelementptr inbounds double* %a, i64 %124, !dbg !687
  %126 = load double* %125, align 8, !dbg !687, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !210), !dbg !687
  %127 = sext i32 %119 to i64, !dbg !688
  %128 = getelementptr inbounds double* %a, i64 %127, !dbg !688
  %129 = load double* %128, align 8, !dbg !688, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %129}, i64 0, metadata !211), !dbg !688
  %130 = add nsw i32 %119, 1, !dbg !689
  %131 = sext i32 %130 to i64, !dbg !689
  %132 = getelementptr inbounds double* %a, i64 %131, !dbg !689
  %133 = load double* %132, align 8, !dbg !689, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %133}, i64 0, metadata !212), !dbg !689
  store double %129, double* %121, align 8, !dbg !690, !tbaa !245
  store double %133, double* %125, align 8, !dbg !691, !tbaa !245
  store double %122, double* %128, align 8, !dbg !692, !tbaa !245
  store double %126, double* %132, align 8, !dbg !693, !tbaa !245
  %134 = add nsw i32 %116, %14, !dbg !694
  tail call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !203), !dbg !694
  %135 = add nsw i32 %119, %14, !dbg !695
  tail call void @llvm.dbg.value(metadata !{i32 %135}, i64 0, metadata !205), !dbg !695
  %136 = sext i32 %134 to i64, !dbg !696
  %137 = getelementptr inbounds double* %a, i64 %136, !dbg !696
  %138 = load double* %137, align 8, !dbg !696, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !209), !dbg !696
  %139 = add nsw i32 %134, 1, !dbg !697
  %140 = sext i32 %139 to i64, !dbg !697
  %141 = getelementptr inbounds double* %a, i64 %140, !dbg !697
  %142 = load double* %141, align 8, !dbg !697, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %142}, i64 0, metadata !210), !dbg !697
  %143 = sext i32 %135 to i64, !dbg !698
  %144 = getelementptr inbounds double* %a, i64 %143, !dbg !698
  %145 = load double* %144, align 8, !dbg !698, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %145}, i64 0, metadata !211), !dbg !698
  %146 = add nsw i32 %135, 1, !dbg !699
  %147 = sext i32 %146 to i64, !dbg !699
  %148 = getelementptr inbounds double* %a, i64 %147, !dbg !699
  %149 = load double* %148, align 8, !dbg !699, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %149}, i64 0, metadata !212), !dbg !699
  store double %145, double* %137, align 8, !dbg !700, !tbaa !245
  store double %149, double* %141, align 8, !dbg !701, !tbaa !245
  store double %138, double* %144, align 8, !dbg !702, !tbaa !245
  store double %142, double* %148, align 8, !dbg !703, !tbaa !245
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !685
  %lftr.wideiv36 = trunc i64 %indvars.iv.next33 to i32, !dbg !685
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %indvars.iv34, !dbg !685
  br i1 %exitcond37, label %._crit_edge9, label %113, !dbg !685

._crit_edge9:                                     ; preds = %113
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !620
  %indvars.iv.next35 = add nuw nsw i32 %indvars.iv34, 1, !dbg !620
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next35}, i64 0, metadata !204), !dbg !620
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !620
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %m.0.lcssa, !dbg !620
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8, !dbg !620

.loopexit:                                        ; preds = %._crit_edge9, %._crit_edge, %.preheader3, %.preheader1
  ret void, !dbg !704
}

; Function Attrs: nounwind optsize uwtable
define internal fastcc void @cftfsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !165), !dbg !705
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !166), !dbg !705
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !167), !dbg !705
  tail call void @llvm.dbg.value(metadata !536, i64 0, metadata !172), !dbg !706
  %1 = icmp sgt i32 %n, 8, !dbg !707
  br i1 %1, label %2, label %.loopexit3, !dbg !707

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #9, !dbg !709
  tail call void @llvm.dbg.value(metadata !543, i64 0, metadata !172), !dbg !711
  %3 = icmp sgt i32 %n, 32, !dbg !712
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !712

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w) #9, !dbg !713
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !172), !dbg !715
  %5 = shl i32 %4, 2, !dbg !712
  %6 = icmp slt i32 %5, %n, !dbg !712
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !712

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !716
  %8 = icmp eq i32 %7, %n, !dbg !716
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !168), !dbg !718
  %9 = icmp sgt i32 %l.1, 0, !dbg !718
  br i1 %8, label %.preheader, label %.preheader1, !dbg !716

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !721

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !721
  br label %56, !dbg !721

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !718

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !718
  br label %12, !dbg !718

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = add nsw i64 %indvars.iv, %11, !dbg !724
  %14 = add nsw i64 %13, %11, !dbg !726
  %15 = add nsw i64 %14, %11, !dbg !727
  %16 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !728
  %17 = getelementptr inbounds double* %a, i64 %13, !dbg !728
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !173), !dbg !728
  %18 = bitcast double* %16 to <2 x double>*, !dbg !728
  %19 = load <2 x double>* %18, align 8, !dbg !728, !tbaa !245
  %20 = add nsw i64 %13, 1, !dbg !729
  %21 = getelementptr inbounds double* %a, i64 %20, !dbg !729
  %22 = bitcast double* %17 to <2 x double>*, !dbg !728
  %23 = load <2 x double>* %22, align 8, !dbg !728, !tbaa !245
  %24 = fadd <2 x double> %19, %23, !dbg !728
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !174), !dbg !729
  %25 = extractelement <2 x double> %19, i32 0, !dbg !730
  %26 = extractelement <2 x double> %23, i32 0, !dbg !730
  %27 = fsub double %25, %26, !dbg !730
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !175), !dbg !730
  %28 = extractelement <2 x double> %19, i32 1, !dbg !731
  %29 = extractelement <2 x double> %23, i32 1, !dbg !731
  %30 = fsub double %28, %29, !dbg !731
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !176), !dbg !731
  %31 = getelementptr inbounds double* %a, i64 %14, !dbg !732
  %32 = getelementptr inbounds double* %a, i64 %15, !dbg !732
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !177), !dbg !732
  %33 = bitcast double* %31 to <2 x double>*, !dbg !732
  %34 = load <2 x double>* %33, align 8, !dbg !732, !tbaa !245
  %35 = add nsw i64 %15, 1, !dbg !733
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !733
  %37 = bitcast double* %32 to <2 x double>*, !dbg !732
  %38 = load <2 x double>* %37, align 8, !dbg !732, !tbaa !245
  %39 = fadd <2 x double> %34, %38, !dbg !732
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !178), !dbg !733
  %40 = extractelement <2 x double> %34, i32 0, !dbg !734
  %41 = extractelement <2 x double> %38, i32 0, !dbg !734
  %42 = fsub double %40, %41, !dbg !734
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !179), !dbg !734
  %43 = extractelement <2 x double> %34, i32 1, !dbg !735
  %44 = extractelement <2 x double> %38, i32 1, !dbg !735
  %45 = fsub double %43, %44, !dbg !735
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !180), !dbg !735
  %46 = fadd <2 x double> %24, %39, !dbg !736
  %47 = bitcast double* %16 to <2 x double>*, !dbg !736
  store <2 x double> %46, <2 x double>* %47, align 8, !dbg !736, !tbaa !245
  %48 = fsub <2 x double> %24, %39, !dbg !737
  %49 = bitcast double* %31 to <2 x double>*, !dbg !737
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !737, !tbaa !245
  %50 = fsub double %27, %45, !dbg !738
  store double %50, double* %17, align 8, !dbg !738, !tbaa !245
  %51 = fadd double %30, %42, !dbg !739
  store double %51, double* %21, align 8, !dbg !739, !tbaa !245
  %52 = fadd double %27, %45, !dbg !740
  store double %52, double* %32, align 8, !dbg !740, !tbaa !245
  %53 = fsub double %30, %42, !dbg !741
  store double %53, double* %36, align 8, !dbg !741, !tbaa !245
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !718
  %54 = trunc i64 %indvars.iv.next to i32, !dbg !718
  %55 = icmp slt i32 %54, %l.1, !dbg !718
  br i1 %55, label %12, label %.loopexit, !dbg !718

; <label>:56                                      ; preds = %.lr.ph6, %56
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %56 ]
  %57 = add nsw i64 %indvars.iv9, %10, !dbg !742
  %58 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !744
  %59 = getelementptr inbounds double* %a, i64 %57, !dbg !744
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !173), !dbg !744
  %60 = or i64 %indvars.iv9, 1, !dbg !745
  %61 = getelementptr inbounds double* %a, i64 %60, !dbg !745
  %62 = bitcast double* %58 to <2 x double>*, !dbg !744
  %63 = load <2 x double>* %62, align 8, !dbg !744, !tbaa !245
  %64 = add nsw i64 %57, 1, !dbg !745
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !745
  %66 = bitcast double* %59 to <2 x double>*, !dbg !744
  %67 = load <2 x double>* %66, align 8, !dbg !744, !tbaa !245
  %68 = fsub <2 x double> %63, %67, !dbg !744
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !174), !dbg !745
  %69 = extractelement <2 x double> %63, i32 0, !dbg !746
  %70 = extractelement <2 x double> %67, i32 0, !dbg !746
  %71 = fadd double %69, %70, !dbg !746
  store double %71, double* %58, align 8, !dbg !746, !tbaa !245
  %72 = load double* %65, align 8, !dbg !747, !tbaa !245
  %73 = extractelement <2 x double> %63, i32 1, !dbg !747
  %74 = fadd double %72, %73, !dbg !747
  store double %74, double* %61, align 8, !dbg !747, !tbaa !245
  %75 = bitcast double* %59 to <2 x double>*, !dbg !748
  store <2 x double> %68, <2 x double>* %75, align 8, !dbg !748, !tbaa !245
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !721
  %76 = trunc i64 %indvars.iv.next10 to i32, !dbg !721
  %77 = icmp slt i32 %76, %l.1, !dbg !721
  br i1 %77, label %56, label %.loopexit, !dbg !721

.loopexit:                                        ; preds = %56, %12, %.preheader1, %.preheader
  ret void, !dbg !749
}

; Function Attrs: nounwind optsize
declare double @cos(double) #2

; Function Attrs: nounwind optsize
declare double @sin(double) #2

; Function Attrs: inlinehint nounwind optsize uwtable
define internal fastcc void @cft1st(i32 %n, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !143), !dbg !750
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !144), !dbg !750
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !145), !dbg !750
  %1 = getelementptr inbounds double* %a, i64 2, !dbg !751
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !155), !dbg !751
  %2 = bitcast double* %a to <2 x double>*, !dbg !751
  %3 = load <2 x double>* %2, align 8, !dbg !751, !tbaa !245
  %4 = getelementptr inbounds double* %a, i64 3, !dbg !752
  %5 = bitcast double* %1 to <2 x double>*, !dbg !751
  %6 = load <2 x double>* %5, align 8, !dbg !751, !tbaa !245
  %7 = fadd <2 x double> %3, %6, !dbg !751
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !156), !dbg !752
  %8 = extractelement <2 x double> %3, i32 0, !dbg !753
  %9 = extractelement <2 x double> %6, i32 0, !dbg !753
  %10 = fsub double %8, %9, !dbg !753
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !157), !dbg !753
  %11 = extractelement <2 x double> %3, i32 1, !dbg !754
  %12 = extractelement <2 x double> %6, i32 1, !dbg !754
  %13 = fsub double %11, %12, !dbg !754
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !158), !dbg !754
  %14 = getelementptr inbounds double* %a, i64 4, !dbg !755
  %15 = getelementptr inbounds double* %a, i64 6, !dbg !755
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !159), !dbg !755
  %16 = bitcast double* %14 to <2 x double>*, !dbg !755
  %17 = load <2 x double>* %16, align 8, !dbg !755, !tbaa !245
  %18 = getelementptr inbounds double* %a, i64 7, !dbg !756
  %19 = bitcast double* %15 to <2 x double>*, !dbg !755
  %20 = load <2 x double>* %19, align 8, !dbg !755, !tbaa !245
  %21 = fadd <2 x double> %17, %20, !dbg !755
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !160), !dbg !756
  %22 = extractelement <2 x double> %17, i32 0, !dbg !757
  %23 = extractelement <2 x double> %20, i32 0, !dbg !757
  %24 = fsub double %22, %23, !dbg !757
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !161), !dbg !757
  %25 = extractelement <2 x double> %17, i32 1, !dbg !758
  %26 = extractelement <2 x double> %20, i32 1, !dbg !758
  %27 = fsub double %25, %26, !dbg !758
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !162), !dbg !758
  %28 = fadd <2 x double> %7, %21, !dbg !759
  %29 = bitcast double* %a to <2 x double>*, !dbg !759
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !759, !tbaa !245
  %30 = fsub <2 x double> %7, %21, !dbg !760
  %31 = bitcast double* %14 to <2 x double>*, !dbg !760
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !760, !tbaa !245
  %32 = fsub double %10, %27, !dbg !761
  store double %32, double* %1, align 8, !dbg !761, !tbaa !245
  %33 = fadd double %13, %24, !dbg !762
  store double %33, double* %4, align 8, !dbg !762, !tbaa !245
  %34 = fadd double %10, %27, !dbg !763
  store double %34, double* %15, align 8, !dbg !763, !tbaa !245
  %35 = fsub double %13, %24, !dbg !764
  store double %35, double* %18, align 8, !dbg !764, !tbaa !245
  %36 = getelementptr inbounds double* %w, i64 2, !dbg !765
  %37 = load double* %36, align 8, !dbg !765, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !149), !dbg !765
  %38 = getelementptr inbounds double* %a, i64 8, !dbg !766
  %39 = getelementptr inbounds double* %a, i64 10, !dbg !766
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !155), !dbg !766
  %40 = bitcast double* %38 to <2 x double>*, !dbg !766
  %41 = load <2 x double>* %40, align 8, !dbg !766, !tbaa !245
  %42 = bitcast double* %39 to <2 x double>*, !dbg !766
  %43 = load <2 x double>* %42, align 8, !dbg !766, !tbaa !245
  %44 = fadd <2 x double> %41, %43, !dbg !766
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !156), !dbg !767
  %45 = extractelement <2 x double> %41, i32 0, !dbg !768
  %46 = extractelement <2 x double> %43, i32 0, !dbg !768
  %47 = fsub double %45, %46, !dbg !768
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !157), !dbg !768
  %48 = extractelement <2 x double> %41, i32 1, !dbg !769
  %49 = extractelement <2 x double> %43, i32 1, !dbg !769
  %50 = fsub double %48, %49, !dbg !769
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !158), !dbg !769
  %51 = getelementptr inbounds double* %a, i64 12, !dbg !770
  %52 = getelementptr inbounds double* %a, i64 14, !dbg !770
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !159), !dbg !770
  %53 = bitcast double* %51 to <2 x double>*, !dbg !770
  %54 = load <2 x double>* %53, align 8, !dbg !770, !tbaa !245
  %55 = bitcast double* %52 to <2 x double>*, !dbg !770
  %56 = load <2 x double>* %55, align 8, !dbg !770, !tbaa !245
  %57 = fadd <2 x double> %54, %56, !dbg !770
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !160), !dbg !771
  %58 = extractelement <2 x double> %54, i32 0, !dbg !772
  %59 = extractelement <2 x double> %56, i32 0, !dbg !772
  %60 = fsub double %58, %59, !dbg !772
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !161), !dbg !772
  %61 = extractelement <2 x double> %54, i32 1, !dbg !773
  %62 = extractelement <2 x double> %56, i32 1, !dbg !773
  %63 = fsub double %61, %62, !dbg !773
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !162), !dbg !773
  %64 = fadd <2 x double> %44, %57, !dbg !774
  %65 = bitcast double* %38 to <2 x double>*, !dbg !774
  store <2 x double> %64, <2 x double>* %65, align 8, !dbg !774, !tbaa !245
  %66 = shufflevector <2 x double> %57, <2 x double> %44, <2 x i32> <i32 1, i32 2>, !dbg !775
  %67 = shufflevector <2 x double> %44, <2 x double> %57, <2 x i32> <i32 1, i32 2>, !dbg !775
  %68 = fsub <2 x double> %66, %67, !dbg !775
  %69 = bitcast double* %51 to <2 x double>*, !dbg !775
  store <2 x double> %68, <2 x double>* %69, align 8, !dbg !775, !tbaa !245
  %70 = fsub double %47, %63, !dbg !776
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !155), !dbg !776
  %71 = fadd double %50, %60, !dbg !777
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !156), !dbg !777
  %72 = fsub double %70, %71, !dbg !778
  %73 = fadd double %71, %70, !dbg !779
  %74 = insertelement <2 x double> undef, double %72, i32 0, !dbg !778
  %75 = insertelement <2 x double> %74, double %73, i32 1, !dbg !778
  %76 = insertelement <2 x double> undef, double %37, i32 0, !dbg !778
  %77 = insertelement <2 x double> %76, double %37, i32 1, !dbg !778
  %78 = fmul <2 x double> %75, %77, !dbg !778
  %79 = bitcast double* %39 to <2 x double>*, !dbg !778
  store <2 x double> %78, <2 x double>* %79, align 8, !dbg !778, !tbaa !245
  %80 = fadd double %47, %63, !dbg !780
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !155), !dbg !780
  %81 = fsub double %60, %50, !dbg !781
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !156), !dbg !781
  %82 = fsub double %81, %80, !dbg !782
  %83 = fadd double %81, %80, !dbg !783
  %84 = insertelement <2 x double> undef, double %82, i32 0, !dbg !782
  %85 = insertelement <2 x double> %84, double %83, i32 1, !dbg !782
  %86 = fmul <2 x double> %85, %77, !dbg !782
  %87 = bitcast double* %52 to <2 x double>*, !dbg !782
  store <2 x double> %86, <2 x double>* %87, align 8, !dbg !782, !tbaa !245
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !147), !dbg !784
  tail call void @llvm.dbg.value(metadata !785, i64 0, metadata !146), !dbg !786
  %88 = icmp sgt i32 %n, 16, !dbg !786
  br i1 %88, label %.lr.ph, label %._crit_edge, !dbg !786

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 16, %0 ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 2, !dbg !786
  %89 = shl nsw i64 %indvars.iv.next4, 1, !dbg !788
  %90 = getelementptr inbounds double* %w, i64 %indvars.iv.next4, !dbg !790
  %91 = load double* %90, align 8, !dbg !790, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !151), !dbg !790
  %92 = add nsw i64 %indvars.iv3, 3, !dbg !791
  %93 = getelementptr inbounds double* %w, i64 %92, !dbg !791
  %94 = load double* %93, align 8, !dbg !791, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !152), !dbg !791
  %95 = getelementptr inbounds double* %w, i64 %89, !dbg !792
  %96 = load double* %95, align 8, !dbg !792, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !149), !dbg !792
  %97 = or i64 %89, 1, !dbg !793
  %98 = getelementptr inbounds double* %w, i64 %97, !dbg !793
  %99 = load double* %98, align 8, !dbg !793, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !150), !dbg !793
  %100 = fmul double %94, 2.000000e+00, !dbg !794
  %101 = fmul double %100, %99, !dbg !794
  %102 = fsub double %96, %101, !dbg !794
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !153), !dbg !794
  %103 = fmul double %100, %96, !dbg !795
  %104 = fsub double %103, %99, !dbg !795
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !154), !dbg !795
  %105 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !796
  %106 = or i64 %indvars.iv, 2, !dbg !796
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !796
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !155), !dbg !796
  %108 = bitcast double* %105 to <2 x double>*, !dbg !796
  %109 = load <2 x double>* %108, align 8, !dbg !796, !tbaa !245
  %110 = or i64 %indvars.iv, 3, !dbg !797
  %111 = getelementptr inbounds double* %a, i64 %110, !dbg !797
  %112 = bitcast double* %107 to <2 x double>*, !dbg !796
  %113 = load <2 x double>* %112, align 8, !dbg !796, !tbaa !245
  %114 = fadd <2 x double> %109, %113, !dbg !796
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !156), !dbg !797
  %115 = extractelement <2 x double> %109, i32 0, !dbg !798
  %116 = extractelement <2 x double> %113, i32 0, !dbg !798
  %117 = fsub double %115, %116, !dbg !798
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !157), !dbg !798
  %118 = extractelement <2 x double> %109, i32 1, !dbg !799
  %119 = extractelement <2 x double> %113, i32 1, !dbg !799
  %120 = fsub double %118, %119, !dbg !799
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !158), !dbg !799
  %121 = or i64 %indvars.iv, 4, !dbg !800
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !800
  %123 = or i64 %indvars.iv, 6, !dbg !800
  %124 = getelementptr inbounds double* %a, i64 %123, !dbg !800
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !159), !dbg !800
  %125 = or i64 %indvars.iv, 5, !dbg !801
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !801
  %127 = bitcast double* %122 to <2 x double>*, !dbg !800
  %128 = load <2 x double>* %127, align 8, !dbg !800, !tbaa !245
  %129 = or i64 %indvars.iv, 7, !dbg !801
  %130 = getelementptr inbounds double* %a, i64 %129, !dbg !801
  %131 = bitcast double* %124 to <2 x double>*, !dbg !800
  %132 = load <2 x double>* %131, align 8, !dbg !800, !tbaa !245
  %133 = fadd <2 x double> %128, %132, !dbg !800
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !160), !dbg !801
  %134 = extractelement <2 x double> %128, i32 0, !dbg !802
  %135 = extractelement <2 x double> %132, i32 0, !dbg !802
  %136 = fsub double %134, %135, !dbg !802
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !161), !dbg !802
  %137 = extractelement <2 x double> %128, i32 1, !dbg !803
  %138 = extractelement <2 x double> %132, i32 1, !dbg !803
  %139 = fsub double %137, %138, !dbg !803
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !162), !dbg !803
  %140 = fadd <2 x double> %114, %133, !dbg !804
  %141 = bitcast double* %105 to <2 x double>*, !dbg !804
  store <2 x double> %140, <2 x double>* %141, align 8, !dbg !804, !tbaa !245
  %142 = extractelement <2 x double> %114, i32 0, !dbg !805
  %143 = extractelement <2 x double> %133, i32 0, !dbg !805
  %144 = fsub double %142, %143, !dbg !805
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !155), !dbg !805
  %145 = extractelement <2 x double> %114, i32 1, !dbg !806
  %146 = extractelement <2 x double> %133, i32 1, !dbg !806
  %147 = fsub double %145, %146, !dbg !806
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !156), !dbg !806
  %148 = fmul double %91, %144, !dbg !807
  %149 = fmul double %94, %147, !dbg !807
  %150 = fsub double %148, %149, !dbg !807
  store double %150, double* %122, align 8, !dbg !807, !tbaa !245
  %151 = fmul double %91, %147, !dbg !808
  %152 = fmul double %94, %144, !dbg !808
  %153 = fadd double %152, %151, !dbg !808
  store double %153, double* %126, align 8, !dbg !808, !tbaa !245
  %154 = fsub double %117, %139, !dbg !809
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !155), !dbg !809
  %155 = fadd double %120, %136, !dbg !810
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !156), !dbg !810
  %156 = fmul double %96, %154, !dbg !811
  %157 = fmul double %99, %155, !dbg !811
  %158 = fsub double %156, %157, !dbg !811
  store double %158, double* %107, align 8, !dbg !811, !tbaa !245
  %159 = fmul double %96, %155, !dbg !812
  %160 = fmul double %99, %154, !dbg !812
  %161 = fadd double %159, %160, !dbg !812
  store double %161, double* %111, align 8, !dbg !812, !tbaa !245
  %162 = fadd double %117, %139, !dbg !813
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !155), !dbg !813
  %163 = fsub double %120, %136, !dbg !814
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !156), !dbg !814
  %164 = fmul double %102, %162, !dbg !815
  %165 = fmul double %104, %163, !dbg !815
  %166 = fsub double %164, %165, !dbg !815
  store double %166, double* %124, align 8, !dbg !815, !tbaa !245
  %167 = fmul double %102, %163, !dbg !816
  %168 = fmul double %104, %162, !dbg !816
  %169 = fadd double %167, %168, !dbg !816
  store double %169, double* %130, align 8, !dbg !816, !tbaa !245
  %170 = or i64 %89, 2, !dbg !817
  %171 = getelementptr inbounds double* %w, i64 %170, !dbg !817
  %172 = load double* %171, align 8, !dbg !817, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !149), !dbg !817
  %173 = or i64 %89, 3, !dbg !818
  %174 = getelementptr inbounds double* %w, i64 %173, !dbg !818
  %175 = load double* %174, align 8, !dbg !818, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !150), !dbg !818
  %176 = fmul double %91, 2.000000e+00, !dbg !819
  %177 = fmul double %176, %175, !dbg !819
  %178 = fsub double %172, %177, !dbg !819
  tail call void @llvm.dbg.value(metadata !{double %178}, i64 0, metadata !153), !dbg !819
  %179 = fmul double %176, %172, !dbg !820
  %180 = fsub double %179, %175, !dbg !820
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !154), !dbg !820
  %181 = or i64 %indvars.iv, 8, !dbg !821
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !821
  %183 = or i64 %indvars.iv, 10, !dbg !821
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !821
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !155), !dbg !821
  %185 = bitcast double* %182 to <2 x double>*, !dbg !821
  %186 = load <2 x double>* %185, align 8, !dbg !821, !tbaa !245
  %187 = or i64 %indvars.iv, 11, !dbg !822
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !822
  %189 = bitcast double* %184 to <2 x double>*, !dbg !821
  %190 = load <2 x double>* %189, align 8, !dbg !821, !tbaa !245
  %191 = fadd <2 x double> %186, %190, !dbg !821
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !156), !dbg !822
  %192 = extractelement <2 x double> %186, i32 0, !dbg !823
  %193 = extractelement <2 x double> %190, i32 0, !dbg !823
  %194 = fsub double %192, %193, !dbg !823
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !157), !dbg !823
  %195 = extractelement <2 x double> %186, i32 1, !dbg !824
  %196 = extractelement <2 x double> %190, i32 1, !dbg !824
  %197 = fsub double %195, %196, !dbg !824
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !158), !dbg !824
  %198 = or i64 %indvars.iv, 12, !dbg !825
  %199 = getelementptr inbounds double* %a, i64 %198, !dbg !825
  %200 = or i64 %indvars.iv, 14, !dbg !825
  %201 = getelementptr inbounds double* %a, i64 %200, !dbg !825
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !159), !dbg !825
  %202 = or i64 %indvars.iv, 13, !dbg !826
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !826
  %204 = bitcast double* %199 to <2 x double>*, !dbg !825
  %205 = load <2 x double>* %204, align 8, !dbg !825, !tbaa !245
  %206 = or i64 %indvars.iv, 15, !dbg !826
  %207 = getelementptr inbounds double* %a, i64 %206, !dbg !826
  %208 = bitcast double* %201 to <2 x double>*, !dbg !825
  %209 = load <2 x double>* %208, align 8, !dbg !825, !tbaa !245
  %210 = fadd <2 x double> %205, %209, !dbg !825
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !160), !dbg !826
  %211 = extractelement <2 x double> %205, i32 0, !dbg !827
  %212 = extractelement <2 x double> %209, i32 0, !dbg !827
  %213 = fsub double %211, %212, !dbg !827
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !161), !dbg !827
  %214 = extractelement <2 x double> %205, i32 1, !dbg !828
  %215 = extractelement <2 x double> %209, i32 1, !dbg !828
  %216 = fsub double %214, %215, !dbg !828
  tail call void @llvm.dbg.value(metadata !{double %216}, i64 0, metadata !162), !dbg !828
  %217 = fadd <2 x double> %191, %210, !dbg !829
  %218 = bitcast double* %182 to <2 x double>*, !dbg !829
  store <2 x double> %217, <2 x double>* %218, align 8, !dbg !829, !tbaa !245
  %219 = extractelement <2 x double> %191, i32 0, !dbg !830
  %220 = extractelement <2 x double> %210, i32 0, !dbg !830
  %221 = fsub double %219, %220, !dbg !830
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !155), !dbg !830
  %222 = extractelement <2 x double> %191, i32 1, !dbg !831
  %223 = extractelement <2 x double> %210, i32 1, !dbg !831
  %224 = fsub double %222, %223, !dbg !831
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !156), !dbg !831
  %225 = fsub double -0.000000e+00, %94, !dbg !832
  %226 = fmul double %221, %225, !dbg !832
  %227 = fmul double %91, %224, !dbg !832
  %228 = fsub double %226, %227, !dbg !832
  store double %228, double* %199, align 8, !dbg !832, !tbaa !245
  %229 = fmul double %224, %225, !dbg !833
  %230 = fmul double %91, %221, !dbg !833
  %231 = fadd double %230, %229, !dbg !833
  store double %231, double* %203, align 8, !dbg !833, !tbaa !245
  %232 = fsub double %194, %216, !dbg !834
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !155), !dbg !834
  %233 = fadd double %197, %213, !dbg !835
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !156), !dbg !835
  %234 = fmul double %172, %232, !dbg !836
  %235 = fmul double %175, %233, !dbg !836
  %236 = fsub double %234, %235, !dbg !836
  store double %236, double* %184, align 8, !dbg !836, !tbaa !245
  %237 = fmul double %172, %233, !dbg !837
  %238 = fmul double %175, %232, !dbg !837
  %239 = fadd double %237, %238, !dbg !837
  store double %239, double* %188, align 8, !dbg !837, !tbaa !245
  %240 = fadd double %194, %216, !dbg !838
  tail call void @llvm.dbg.value(metadata !{double %240}, i64 0, metadata !155), !dbg !838
  %241 = fsub double %197, %213, !dbg !839
  tail call void @llvm.dbg.value(metadata !{double %241}, i64 0, metadata !156), !dbg !839
  %242 = fmul double %178, %240, !dbg !840
  %243 = fmul double %180, %241, !dbg !840
  %244 = fsub double %242, %243, !dbg !840
  store double %244, double* %201, align 8, !dbg !840, !tbaa !245
  %245 = fmul double %178, %241, !dbg !841
  %246 = fmul double %180, %240, !dbg !841
  %247 = fadd double %245, %246, !dbg !841
  store double %247, double* %207, align 8, !dbg !841, !tbaa !245
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16, !dbg !786
  %248 = trunc i64 %indvars.iv.next to i32, !dbg !786
  %249 = icmp slt i32 %248, %n, !dbg !786
  br i1 %249, label %.lr.ph, label %._crit_edge, !dbg !786

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !842
}

; Function Attrs: inlinehint nounwind optsize uwtable
define internal fastcc void @cftmdl(i32 %n, i32 %l, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !843
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !115), !dbg !843
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !116), !dbg !843
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !117), !dbg !843
  %1 = shl i32 %l, 2, !dbg !844
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !125), !dbg !844
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !118), !dbg !845
  %2 = icmp sgt i32 %l, 0, !dbg !845
  br i1 %2, label %.lr.ph17, label %._crit_edge14, !dbg !845

.lr.ph17:                                         ; preds = %0
  %3 = sext i32 %l to i64, !dbg !845
  br label %4, !dbg !845

; <label>:4                                       ; preds = %.lr.ph17, %4
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next28, %4 ]
  %5 = add nsw i64 %indvars.iv27, %3, !dbg !847
  %6 = add nsw i64 %5, %3, !dbg !849
  %7 = add nsw i64 %6, %3, !dbg !850
  %8 = getelementptr inbounds double* %a, i64 %indvars.iv27, !dbg !851
  %9 = getelementptr inbounds double* %a, i64 %5, !dbg !851
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !133), !dbg !851
  %10 = bitcast double* %8 to <2 x double>*, !dbg !851
  %11 = load <2 x double>* %10, align 8, !dbg !851, !tbaa !245
  %12 = add nsw i64 %5, 1, !dbg !852
  %13 = getelementptr inbounds double* %a, i64 %12, !dbg !852
  %14 = bitcast double* %9 to <2 x double>*, !dbg !851
  %15 = load <2 x double>* %14, align 8, !dbg !851, !tbaa !245
  %16 = fadd <2 x double> %11, %15, !dbg !851
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !134), !dbg !852
  %17 = extractelement <2 x double> %11, i32 0, !dbg !853
  %18 = extractelement <2 x double> %15, i32 0, !dbg !853
  %19 = fsub double %17, %18, !dbg !853
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !135), !dbg !853
  %20 = extractelement <2 x double> %11, i32 1, !dbg !854
  %21 = extractelement <2 x double> %15, i32 1, !dbg !854
  %22 = fsub double %20, %21, !dbg !854
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !136), !dbg !854
  %23 = getelementptr inbounds double* %a, i64 %6, !dbg !855
  %24 = getelementptr inbounds double* %a, i64 %7, !dbg !855
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !137), !dbg !855
  %25 = bitcast double* %23 to <2 x double>*, !dbg !855
  %26 = load <2 x double>* %25, align 8, !dbg !855, !tbaa !245
  %27 = add nsw i64 %7, 1, !dbg !856
  %28 = getelementptr inbounds double* %a, i64 %27, !dbg !856
  %29 = bitcast double* %24 to <2 x double>*, !dbg !855
  %30 = load <2 x double>* %29, align 8, !dbg !855, !tbaa !245
  %31 = fadd <2 x double> %26, %30, !dbg !855
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !138), !dbg !856
  %32 = extractelement <2 x double> %26, i32 0, !dbg !857
  %33 = extractelement <2 x double> %30, i32 0, !dbg !857
  %34 = fsub double %32, %33, !dbg !857
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !139), !dbg !857
  %35 = extractelement <2 x double> %26, i32 1, !dbg !858
  %36 = extractelement <2 x double> %30, i32 1, !dbg !858
  %37 = fsub double %35, %36, !dbg !858
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !140), !dbg !858
  %38 = fadd <2 x double> %16, %31, !dbg !859
  %39 = bitcast double* %8 to <2 x double>*, !dbg !859
  store <2 x double> %38, <2 x double>* %39, align 8, !dbg !859, !tbaa !245
  %40 = fsub <2 x double> %16, %31, !dbg !860
  %41 = bitcast double* %23 to <2 x double>*, !dbg !860
  store <2 x double> %40, <2 x double>* %41, align 8, !dbg !860, !tbaa !245
  %42 = fsub double %19, %37, !dbg !861
  store double %42, double* %9, align 8, !dbg !861, !tbaa !245
  %43 = fadd double %22, %34, !dbg !862
  store double %43, double* %13, align 8, !dbg !862, !tbaa !245
  %44 = fadd double %19, %37, !dbg !863
  store double %44, double* %24, align 8, !dbg !863, !tbaa !245
  %45 = fsub double %22, %34, !dbg !864
  store double %45, double* %28, align 8, !dbg !864, !tbaa !245
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 2, !dbg !845
  %46 = trunc i64 %indvars.iv.next28 to i32, !dbg !845
  %47 = icmp slt i32 %46, %l, !dbg !845
  br i1 %47, label %4, label %._crit_edge18, !dbg !845

._crit_edge18:                                    ; preds = %4
  %48 = getelementptr inbounds double* %w, i64 2, !dbg !865
  %49 = load double* %48, align 8, !dbg !865, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !127), !dbg !865
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !866
  %50 = add nsw i32 %1, %l, !dbg !866
  br i1 %2, label %.lr.ph13, label %._crit_edge14, !dbg !866

.lr.ph13:                                         ; preds = %._crit_edge18
  %51 = shl i32 %l, 2, !dbg !866
  %52 = sext i32 %51 to i64
  %53 = sext i32 %l to i64, !dbg !866
  %54 = insertelement <2 x double> undef, double %49, i32 0, !dbg !868
  %55 = insertelement <2 x double> %54, double %49, i32 1, !dbg !868
  br label %56, !dbg !866

; <label>:56                                      ; preds = %.lr.ph13, %56
  %indvars.iv25 = phi i64 [ %52, %.lr.ph13 ], [ %indvars.iv.next26, %56 ]
  %j.111 = phi i32 [ %1, %.lr.ph13 ], [ %107, %56 ]
  %57 = add nsw i64 %indvars.iv25, %53, !dbg !870
  %58 = add nsw i64 %57, %53, !dbg !871
  %59 = add nsw i64 %58, %53, !dbg !872
  %60 = getelementptr inbounds double* %a, i64 %indvars.iv25, !dbg !873
  %61 = load double* %60, align 8, !dbg !873, !tbaa !245
  %62 = getelementptr inbounds double* %a, i64 %57, !dbg !873
  %63 = load double* %62, align 8, !dbg !873, !tbaa !245
  %64 = fadd double %61, %63, !dbg !873
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !133), !dbg !873
  %65 = or i32 %j.111, 1, !dbg !874
  %66 = sext i32 %65 to i64, !dbg !874
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !874
  %68 = load double* %67, align 8, !dbg !874, !tbaa !245
  %69 = add nsw i64 %57, 1, !dbg !874
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !874
  %71 = load double* %70, align 8, !dbg !874, !tbaa !245
  %72 = fadd double %68, %71, !dbg !874
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !134), !dbg !874
  %73 = fsub double %61, %63, !dbg !875
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !135), !dbg !875
  %74 = fsub double %68, %71, !dbg !876
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !136), !dbg !876
  %75 = getelementptr inbounds double* %a, i64 %58, !dbg !877
  %76 = load double* %75, align 8, !dbg !877, !tbaa !245
  %77 = getelementptr inbounds double* %a, i64 %59, !dbg !877
  %78 = load double* %77, align 8, !dbg !877, !tbaa !245
  %79 = fadd double %76, %78, !dbg !877
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !137), !dbg !877
  %80 = add nsw i64 %58, 1, !dbg !878
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !878
  %82 = load double* %81, align 8, !dbg !878, !tbaa !245
  %83 = add nsw i64 %59, 1, !dbg !878
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !878
  %85 = load double* %84, align 8, !dbg !878, !tbaa !245
  %86 = fadd double %82, %85, !dbg !878
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !138), !dbg !878
  %87 = fsub double %76, %78, !dbg !879
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !139), !dbg !879
  %88 = fsub double %82, %85, !dbg !880
  tail call void @llvm.dbg.value(metadata !{double %88}, i64 0, metadata !140), !dbg !880
  %89 = fadd double %64, %79, !dbg !881
  store double %89, double* %60, align 8, !dbg !881, !tbaa !245
  %90 = fadd double %72, %86, !dbg !882
  store double %90, double* %67, align 8, !dbg !882, !tbaa !245
  %91 = fsub double %86, %72, !dbg !883
  store double %91, double* %75, align 8, !dbg !883, !tbaa !245
  %92 = fsub double %64, %79, !dbg !884
  store double %92, double* %81, align 8, !dbg !884, !tbaa !245
  %93 = fsub double %73, %88, !dbg !885
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !133), !dbg !885
  %94 = fadd double %74, %87, !dbg !886
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !134), !dbg !886
  %95 = fsub double %93, %94, !dbg !868
  %96 = fadd double %94, %93, !dbg !887
  %97 = insertelement <2 x double> undef, double %95, i32 0, !dbg !868
  %98 = insertelement <2 x double> %97, double %96, i32 1, !dbg !868
  %99 = fmul <2 x double> %98, %55, !dbg !868
  %100 = bitcast double* %62 to <2 x double>*, !dbg !868
  store <2 x double> %99, <2 x double>* %100, align 8, !dbg !868, !tbaa !245
  %101 = fadd double %73, %88, !dbg !888
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !133), !dbg !888
  %102 = fsub double %87, %74, !dbg !889
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !134), !dbg !889
  %103 = fsub double %102, %101, !dbg !890
  %104 = fmul double %49, %103, !dbg !890
  store double %104, double* %77, align 8, !dbg !890, !tbaa !245
  %105 = fadd double %102, %101, !dbg !891
  %106 = fmul double %49, %105, !dbg !891
  store double %106, double* %84, align 8, !dbg !891, !tbaa !245
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 2, !dbg !866
  %107 = add nsw i32 %j.111, 2, !dbg !866
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !118), !dbg !866
  %108 = trunc i64 %indvars.iv.next26 to i32, !dbg !866
  %109 = icmp slt i32 %108, %50, !dbg !866
  br i1 %109, label %56, label %._crit_edge14, !dbg !866

._crit_edge14:                                    ; preds = %56, %0, %._crit_edge18
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !123), !dbg !892
  %110 = shl i32 %l, 3, !dbg !893
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !126), !dbg !893
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !122), !dbg !894
  %111 = icmp slt i32 %110, %n, !dbg !894
  br i1 %111, label %.lr.ph9, label %._crit_edge10, !dbg !894

.lr.ph9:                                          ; preds = %._crit_edge14
  %112 = shl i32 %l, 3, !dbg !894
  %113 = sext i32 %112 to i64
  %114 = sext i32 %l to i64, !dbg !894
  %115 = mul i32 %l, 12, !dbg !894
  br label %116, !dbg !894

; <label>:116                                     ; preds = %.lr.ph9, %._crit_edge5
  %indvars.iv21 = phi i32 [ %115, %.lr.ph9 ], [ %indvars.iv.next22, %._crit_edge5 ]
  %indvars.iv = phi i64 [ %113, %.lr.ph9 ], [ %indvars.iv.next, %._crit_edge5 ]
  %k.07 = phi i32 [ %110, %.lr.ph9 ], [ %283, %._crit_edge5 ]
  %k1.06 = phi i32 [ 2, %.lr.ph9 ], [ %phitmp, %._crit_edge5 ]
  tail call void @llvm.dbg.value(metadata !{i32 %k1.06}, i64 0, metadata !123), !dbg !896
  %117 = sext i32 %indvars.iv21 to i64
  %118 = shl nsw i32 %k1.06, 1, !dbg !898
  tail call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !124), !dbg !898
  %119 = sext i32 %k1.06 to i64, !dbg !899
  %120 = getelementptr inbounds double* %w, i64 %119, !dbg !899
  %121 = load double* %120, align 8, !dbg !899, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %121}, i64 0, metadata !129), !dbg !899
  %122 = or i32 %k1.06, 1, !dbg !900
  %123 = sext i32 %122 to i64, !dbg !900
  %124 = getelementptr inbounds double* %w, i64 %123, !dbg !900
  %125 = load double* %124, align 8, !dbg !900, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !130), !dbg !900
  %126 = sext i32 %118 to i64, !dbg !901
  %127 = getelementptr inbounds double* %w, i64 %126, !dbg !901
  %128 = load double* %127, align 8, !dbg !901, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !127), !dbg !901
  %129 = or i32 %118, 1, !dbg !902
  %130 = sext i32 %129 to i64, !dbg !902
  %131 = getelementptr inbounds double* %w, i64 %130, !dbg !902
  %132 = load double* %131, align 8, !dbg !902, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %132}, i64 0, metadata !128), !dbg !902
  %133 = fmul double %125, 2.000000e+00, !dbg !903
  %134 = fmul double %133, %132, !dbg !903
  %135 = fsub double %128, %134, !dbg !903
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !131), !dbg !903
  %136 = fmul double %133, %128, !dbg !904
  %137 = fsub double %136, %132, !dbg !904
  tail call void @llvm.dbg.value(metadata !{double %137}, i64 0, metadata !132), !dbg !904
  tail call void @llvm.dbg.value(metadata !{i32 %k.07}, i64 0, metadata !118), !dbg !905
  %138 = add nsw i32 %k.07, %l, !dbg !905
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !905

.lr.ph:                                           ; preds = %116, %.lr.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.lr.ph ], [ %indvars.iv, %116 ]
  %j.21 = phi i32 [ %197, %.lr.ph ], [ %k.07, %116 ]
  %139 = add nsw i64 %indvars.iv19, %114, !dbg !907
  %140 = add nsw i64 %139, %114, !dbg !909
  %141 = add nsw i64 %140, %114, !dbg !910
  %142 = getelementptr inbounds double* %a, i64 %indvars.iv19, !dbg !911
  %143 = load double* %142, align 8, !dbg !911, !tbaa !245
  %144 = getelementptr inbounds double* %a, i64 %139, !dbg !911
  %145 = load double* %144, align 8, !dbg !911, !tbaa !245
  %146 = fadd double %143, %145, !dbg !911
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !133), !dbg !911
  %147 = or i32 %j.21, 1, !dbg !912
  %148 = sext i32 %147 to i64, !dbg !912
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !912
  %150 = load double* %149, align 8, !dbg !912, !tbaa !245
  %151 = add nsw i64 %139, 1, !dbg !912
  %152 = getelementptr inbounds double* %a, i64 %151, !dbg !912
  %153 = load double* %152, align 8, !dbg !912, !tbaa !245
  %154 = fadd double %150, %153, !dbg !912
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !134), !dbg !912
  %155 = fsub double %143, %145, !dbg !913
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !135), !dbg !913
  %156 = fsub double %150, %153, !dbg !914
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !136), !dbg !914
  %157 = getelementptr inbounds double* %a, i64 %140, !dbg !915
  %158 = load double* %157, align 8, !dbg !915, !tbaa !245
  %159 = getelementptr inbounds double* %a, i64 %141, !dbg !915
  %160 = load double* %159, align 8, !dbg !915, !tbaa !245
  %161 = fadd double %158, %160, !dbg !915
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !137), !dbg !915
  %162 = add nsw i64 %140, 1, !dbg !916
  %163 = getelementptr inbounds double* %a, i64 %162, !dbg !916
  %164 = load double* %163, align 8, !dbg !916, !tbaa !245
  %165 = add nsw i64 %141, 1, !dbg !916
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !916
  %167 = load double* %166, align 8, !dbg !916, !tbaa !245
  %168 = fadd double %164, %167, !dbg !916
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !138), !dbg !916
  %169 = fsub double %158, %160, !dbg !917
  tail call void @llvm.dbg.value(metadata !{double %169}, i64 0, metadata !139), !dbg !917
  %170 = fsub double %164, %167, !dbg !918
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !140), !dbg !918
  %171 = fadd double %146, %161, !dbg !919
  store double %171, double* %142, align 8, !dbg !919, !tbaa !245
  %172 = fadd double %154, %168, !dbg !920
  store double %172, double* %149, align 8, !dbg !920, !tbaa !245
  %173 = fsub double %146, %161, !dbg !921
  tail call void @llvm.dbg.value(metadata !{double %173}, i64 0, metadata !133), !dbg !921
  %174 = fsub double %154, %168, !dbg !922
  tail call void @llvm.dbg.value(metadata !{double %174}, i64 0, metadata !134), !dbg !922
  %175 = fmul double %121, %173, !dbg !923
  %176 = fmul double %125, %174, !dbg !923
  %177 = fsub double %175, %176, !dbg !923
  store double %177, double* %157, align 8, !dbg !923, !tbaa !245
  %178 = fmul double %121, %174, !dbg !924
  %179 = fmul double %125, %173, !dbg !924
  %180 = fadd double %179, %178, !dbg !924
  store double %180, double* %163, align 8, !dbg !924, !tbaa !245
  %181 = fsub double %155, %170, !dbg !925
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !133), !dbg !925
  %182 = fadd double %156, %169, !dbg !926
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !134), !dbg !926
  %183 = fmul double %128, %181, !dbg !927
  %184 = fmul double %132, %182, !dbg !927
  %185 = fsub double %183, %184, !dbg !927
  store double %185, double* %144, align 8, !dbg !927, !tbaa !245
  %186 = fmul double %128, %182, !dbg !928
  %187 = fmul double %132, %181, !dbg !928
  %188 = fadd double %186, %187, !dbg !928
  store double %188, double* %152, align 8, !dbg !928, !tbaa !245
  %189 = fadd double %155, %170, !dbg !929
  tail call void @llvm.dbg.value(metadata !{double %189}, i64 0, metadata !133), !dbg !929
  %190 = fsub double %156, %169, !dbg !930
  tail call void @llvm.dbg.value(metadata !{double %190}, i64 0, metadata !134), !dbg !930
  %191 = fmul double %135, %189, !dbg !931
  %192 = fmul double %137, %190, !dbg !931
  %193 = fsub double %191, %192, !dbg !931
  store double %193, double* %159, align 8, !dbg !931, !tbaa !245
  %194 = fmul double %135, %190, !dbg !932
  %195 = fmul double %137, %189, !dbg !932
  %196 = fadd double %194, %195, !dbg !932
  store double %196, double* %166, align 8, !dbg !932, !tbaa !245
  %197 = add nsw i32 %j.21, 2, !dbg !905
  tail call void @llvm.dbg.value(metadata !{i32 %197}, i64 0, metadata !118), !dbg !905
  %198 = icmp slt i32 %197, %138, !dbg !905
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 2, !dbg !905
  br i1 %198, label %.lr.ph, label %._crit_edge, !dbg !905

._crit_edge:                                      ; preds = %.lr.ph, %116
  %199 = or i32 %118, 2, !dbg !933
  %200 = sext i32 %199 to i64, !dbg !933
  %201 = getelementptr inbounds double* %w, i64 %200, !dbg !933
  %202 = load double* %201, align 8, !dbg !933, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %202}, i64 0, metadata !127), !dbg !933
  %203 = or i32 %118, 3, !dbg !934
  %204 = sext i32 %203 to i64, !dbg !934
  %205 = getelementptr inbounds double* %w, i64 %204, !dbg !934
  %206 = load double* %205, align 8, !dbg !934, !tbaa !245
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !128), !dbg !934
  %207 = fmul double %121, 2.000000e+00, !dbg !935
  %208 = fmul double %207, %206, !dbg !935
  %209 = fsub double %202, %208, !dbg !935
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !131), !dbg !935
  %210 = fmul double %207, %202, !dbg !936
  %211 = fsub double %210, %206, !dbg !936
  tail call void @llvm.dbg.value(metadata !{double %211}, i64 0, metadata !132), !dbg !936
  %212 = add nsw i32 %k.07, %1, !dbg !937
  tail call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !118), !dbg !937
  %213 = add nsw i32 %212, %l, !dbg !937
  br i1 %2, label %.lr.ph4, label %._crit_edge5, !dbg !937

.lr.ph4:                                          ; preds = %._crit_edge
  %214 = fsub double -0.000000e+00, %125, !dbg !939
  br label %215, !dbg !937

; <label>:215                                     ; preds = %.lr.ph4, %215
  %indvars.iv23 = phi i64 [ %117, %.lr.ph4 ], [ %indvars.iv.next24, %215 ]
  %j.32 = phi i32 [ %212, %.lr.ph4 ], [ %281, %215 ]
  %216 = add nsw i64 %indvars.iv23, %114, !dbg !941
  %217 = add nsw i64 %216, %114, !dbg !942
  %218 = add nsw i64 %217, %114, !dbg !943
  %219 = getelementptr inbounds double* %a, i64 %indvars.iv23, !dbg !944
  %220 = getelementptr inbounds double* %a, i64 %216, !dbg !944
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !133), !dbg !944
  %221 = bitcast double* %219 to <2 x double>*, !dbg !944
  %222 = load <2 x double>* %221, align 8, !dbg !944, !tbaa !245
  %223 = add nsw i64 %216, 1, !dbg !945
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !945
  %225 = bitcast double* %220 to <2 x double>*, !dbg !944
  %226 = load <2 x double>* %225, align 8, !dbg !944, !tbaa !245
  %227 = fadd <2 x double> %222, %226, !dbg !944
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !134), !dbg !945
  %228 = extractelement <2 x double> %222, i32 0, !dbg !946
  %229 = extractelement <2 x double> %226, i32 0, !dbg !946
  %230 = fsub double %228, %229, !dbg !946
  tail call void @llvm.dbg.value(metadata !{double %230}, i64 0, metadata !135), !dbg !946
  %231 = extractelement <2 x double> %222, i32 1, !dbg !947
  %232 = extractelement <2 x double> %226, i32 1, !dbg !947
  %233 = fsub double %231, %232, !dbg !947
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !136), !dbg !947
  %234 = getelementptr inbounds double* %a, i64 %217, !dbg !948
  %235 = load double* %234, align 8, !dbg !948, !tbaa !245
  %236 = getelementptr inbounds double* %a, i64 %218, !dbg !948
  %237 = load double* %236, align 8, !dbg !948, !tbaa !245
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !137), !dbg !948
  %238 = add nsw i64 %217, 1, !dbg !949
  %239 = getelementptr inbounds double* %a, i64 %238, !dbg !949
  %240 = load double* %239, align 8, !dbg !949, !tbaa !245
  %241 = add nsw i64 %218, 1, !dbg !949
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !949
  %243 = load double* %242, align 8, !dbg !949, !tbaa !245
  %244 = insertelement <2 x double> undef, double %235, i32 0, !dbg !948
  %245 = insertelement <2 x double> %244, double %240, i32 1, !dbg !948
  %246 = insertelement <2 x double> undef, double %237, i32 0, !dbg !948
  %247 = insertelement <2 x double> %246, double %243, i32 1, !dbg !948
  %248 = fadd <2 x double> %245, %247, !dbg !948
  tail call void @llvm.dbg.value(metadata !566, i64 0, metadata !138), !dbg !949
  %249 = fsub double %235, %237, !dbg !950
  tail call void @llvm.dbg.value(metadata !{double %249}, i64 0, metadata !139), !dbg !950
  %250 = fsub double %240, %243, !dbg !951
  tail call void @llvm.dbg.value(metadata !{double %250}, i64 0, metadata !140), !dbg !951
  %251 = fadd <2 x double> %227, %248, !dbg !952
  %252 = bitcast double* %219 to <2 x double>*, !dbg !952
  store <2 x double> %251, <2 x double>* %252, align 8, !dbg !952, !tbaa !245
  %253 = extractelement <2 x double> %227, i32 0, !dbg !953
  %254 = extractelement <2 x double> %248, i32 0, !dbg !953
  %255 = fsub double %253, %254, !dbg !953
  tail call void @llvm.dbg.value(metadata !{double %255}, i64 0, metadata !133), !dbg !953
  %256 = extractelement <2 x double> %227, i32 1, !dbg !954
  %257 = extractelement <2 x double> %248, i32 1, !dbg !954
  %258 = fsub double %256, %257, !dbg !954
  tail call void @llvm.dbg.value(metadata !{double %258}, i64 0, metadata !134), !dbg !954
  %259 = fmul double %255, %214, !dbg !939
  %260 = fmul double %121, %258, !dbg !939
  %261 = fsub double %259, %260, !dbg !939
  store double %261, double* %234, align 8, !dbg !939, !tbaa !245
  %262 = fmul double %258, %214, !dbg !955
  %263 = fmul double %121, %255, !dbg !955
  %264 = fadd double %263, %262, !dbg !955
  store double %264, double* %239, align 8, !dbg !955, !tbaa !245
  %265 = fsub double %230, %250, !dbg !956
  tail call void @llvm.dbg.value(metadata !{double %265}, i64 0, metadata !133), !dbg !956
  %266 = fadd double %233, %249, !dbg !957
  tail call void @llvm.dbg.value(metadata !{double %266}, i64 0, metadata !134), !dbg !957
  %267 = fmul double %202, %265, !dbg !958
  %268 = fmul double %206, %266, !dbg !958
  %269 = fsub double %267, %268, !dbg !958
  store double %269, double* %220, align 8, !dbg !958, !tbaa !245
  %270 = fmul double %202, %266, !dbg !959
  %271 = fmul double %206, %265, !dbg !959
  %272 = fadd double %270, %271, !dbg !959
  store double %272, double* %224, align 8, !dbg !959, !tbaa !245
  %273 = fadd double %230, %250, !dbg !960
  tail call void @llvm.dbg.value(metadata !{double %273}, i64 0, metadata !133), !dbg !960
  %274 = fsub double %233, %249, !dbg !961
  tail call void @llvm.dbg.value(metadata !{double %274}, i64 0, metadata !134), !dbg !961
  %275 = fmul double %209, %273, !dbg !962
  %276 = fmul double %211, %274, !dbg !962
  %277 = fsub double %275, %276, !dbg !962
  store double %277, double* %236, align 8, !dbg !962, !tbaa !245
  %278 = fmul double %209, %274, !dbg !963
  %279 = fmul double %211, %273, !dbg !963
  %280 = fadd double %278, %279, !dbg !963
  store double %280, double* %242, align 8, !dbg !963, !tbaa !245
  %281 = add nsw i32 %j.32, 2, !dbg !937
  tail call void @llvm.dbg.value(metadata !{i32 %281}, i64 0, metadata !118), !dbg !937
  %282 = icmp slt i32 %281, %213, !dbg !937
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 2, !dbg !937
  br i1 %282, label %215, label %._crit_edge5, !dbg !937

._crit_edge5:                                     ; preds = %215, %._crit_edge
  %283 = add nsw i32 %k.07, %110, !dbg !894
  tail call void @llvm.dbg.value(metadata !{i32 %283}, i64 0, metadata !122), !dbg !894
  %phitmp = add i32 %k1.06, 2, !dbg !894
  %284 = icmp slt i32 %283, %n, !dbg !894
  %indvars.iv.next = add nsw i64 %indvars.iv, %113, !dbg !894
  %indvars.iv.next22 = add i32 %indvars.iv21, %112, !dbg !894
  br i1 %284, label %116, label %._crit_edge10, !dbg !894

._crit_edge10:                                    ; preds = %._crit_edge5, %._crit_edge14
  ret void, !dbg !964
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

attributes #0 = { nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind optsize readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind optsize readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind optsize "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { inlinehint nounwind optsize uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind optsize }
attributes #9 = { optsize }
attributes #10 = { nounwind optsize readnone }
attributes #11 = { noreturn nounwind optsize }

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
!218 = metadata !{i32 158, i32 0, metadata !55, metadata !219}
!219 = metadata !{i32 35, i32 0, metadata !4, null}
!220 = metadata !{i32 160, i32 0, metadata !55, metadata !219}
!221 = metadata !{i32 161, i32 0, metadata !55, metadata !219}
!222 = metadata !{i32 158, i32 0, metadata !55, metadata !223}
!223 = metadata !{i32 36, i32 0, metadata !4, null}
!224 = metadata !{i32 160, i32 0, metadata !55, metadata !223}
!225 = metadata !{i32 161, i32 0, metadata !55, metadata !223}
!226 = metadata !{i32 41, i32 0, metadata !4, null}
!227 = metadata !{i32 42, i32 0, metadata !4, null}
!228 = metadata !{i32 47, i32 0, metadata !4, null}
!229 = metadata !{i32 51, i32 0, metadata !4, null}
!230 = metadata !{i32 52, i32 0, metadata !4, null}
!231 = metadata !{i32 53, i32 0, metadata !4, null}
!232 = metadata !{i32 0}
!233 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !234} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!234 = metadata !{i32 61, i32 0, metadata !4, null}
!235 = metadata !{i32 119, i32 0, metadata !34, metadata !234}
!236 = metadata !{i32 2047}
!237 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !234} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!238 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !234} ; [ DW_TAG_arg_variable ] [a] [line 119]
!239 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !234} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!240 = metadata !{i32 121, i32 0, metadata !34, metadata !234}
!241 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !234} ; [ DW_TAG_auto_variable ] [j] [line 121]
!242 = metadata !{i32 123, i32 0, metadata !243, metadata !234}
!243 = metadata !{i32 786443, metadata !1, metadata !34, i32 123, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!244 = metadata !{i32 124, i32 0, metadata !243, metadata !234}
!245 = metadata !{metadata !246, metadata !246, i64 0}
!246 = metadata !{metadata !"double", metadata !247, i64 0}
!247 = metadata !{metadata !"omnipotent char", metadata !248, i64 0}
!248 = metadata !{metadata !"Simple C/C++ TBAA"}
!249 = metadata !{i32 2048}
!250 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [n] [line 174]
!251 = metadata !{i32 62, i32 0, metadata !4, null}
!252 = metadata !{i32 174, i32 0, metadata !69, metadata !251}
!253 = metadata !{i32 1}
!254 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!255 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [a] [line 174]
!256 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!257 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [w] [line 174]
!258 = metadata !{i32 178, i32 0, metadata !259, metadata !251}
!259 = metadata !{i32 786443, metadata !1, metadata !260, i32 177, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!260 = metadata !{i32 786443, metadata !1, metadata !261, i32 177, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!261 = metadata !{i32 786443, metadata !1, metadata !262, i32 176, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!262 = metadata !{i32 786443, metadata !1, metadata !69, i32 176, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!263 = metadata !{i32 179, i32 0, metadata !259, metadata !251}
!264 = metadata !{i32 63, i32 0, metadata !4, null}
!265 = metadata !{i32 786689, metadata !43, metadata !"nini", metadata !5, i32 16777343, metadata !8, i32 0, metadata !266} ; [ DW_TAG_arg_variable ] [nini] [line 127]
!266 = metadata !{i32 64, i32 0, metadata !4, null}
!267 = metadata !{i32 127, i32 0, metadata !43, metadata !266}
!268 = metadata !{i32 786689, metadata !43, metadata !"nend", metadata !5, i32 33554559, metadata !8, i32 0, metadata !266} ; [ DW_TAG_arg_variable ] [nend] [line 127]
!269 = metadata !{double 9.765625e-04}
!270 = metadata !{i32 786689, metadata !43, metadata !"scale", metadata !5, i32 50331775, metadata !16, i32 0, metadata !266} ; [ DW_TAG_arg_variable ] [scale] [line 127]
!271 = metadata !{i32 786689, metadata !43, metadata !"a", metadata !5, i32 67108991, metadata !15, i32 0, metadata !266} ; [ DW_TAG_arg_variable ] [a] [line 127]
!272 = metadata !{i32 786688, metadata !43, metadata !"seed", metadata !5, i32 129, metadata !8, i32 0, metadata !266} ; [ DW_TAG_auto_variable ] [seed] [line 129]
!273 = metadata !{i32 129, i32 0, metadata !43, metadata !266}
!274 = metadata !{i32 786688, metadata !43, metadata !"err", metadata !5, i32 130, metadata !16, i32 0, metadata !266} ; [ DW_TAG_auto_variable ] [err] [line 130]
!275 = metadata !{i32 130, i32 0, metadata !43, metadata !266}
!276 = metadata !{i32 786688, metadata !43, metadata !"j", metadata !5, i32 129, metadata !8, i32 0, metadata !266} ; [ DW_TAG_auto_variable ] [j] [line 129]
!277 = metadata !{i32 132, i32 0, metadata !278, metadata !266}
!278 = metadata !{i32 786443, metadata !1, metadata !43, i32 132, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!279 = metadata !{i32 133, i32 0, metadata !280, metadata !266}
!280 = metadata !{i32 786443, metadata !1, metadata !278, i32 132, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!281 = metadata !{i32 786688, metadata !43, metadata !"e", metadata !5, i32 130, metadata !16, i32 0, metadata !266} ; [ DW_TAG_auto_variable ] [e] [line 130]
!282 = metadata !{i32 134, i32 0, metadata !280, metadata !266}
!283 = metadata !{i32 65, i32 0, metadata !284, null}
!284 = metadata !{i32 786443, metadata !1, metadata !4, i32 65, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!285 = metadata !{i32 66, i32 0, metadata !286, null}
!286 = metadata !{i32 786443, metadata !1, metadata !284, i32 65, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!287 = metadata !{i32 67, i32 0, metadata !286, null}
!288 = metadata !{i32 71, i32 0, metadata !4, null}
!289 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !290} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!290 = metadata !{i32 72, i32 0, metadata !4, null}
!291 = metadata !{i32 119, i32 0, metadata !34, metadata !290}
!292 = metadata !{i32 1023}
!293 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !290} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!294 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !290} ; [ DW_TAG_arg_variable ] [a] [line 119]
!295 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !290} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!296 = metadata !{i32 121, i32 0, metadata !34, metadata !290}
!297 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !290} ; [ DW_TAG_auto_variable ] [j] [line 121]
!298 = metadata !{i32 123, i32 0, metadata !243, metadata !290}
!299 = metadata !{i32 124, i32 0, metadata !243, metadata !290}
!300 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [n] [line 174]
!301 = metadata !{i32 73, i32 0, metadata !4, null}
!302 = metadata !{i32 174, i32 0, metadata !69, metadata !301}
!303 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!304 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [a] [line 174]
!305 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!306 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !301} ; [ DW_TAG_arg_variable ] [w] [line 174]
!307 = metadata !{i32 178, i32 0, metadata !259, metadata !301}
!308 = metadata !{i32 179, i32 0, metadata !259, metadata !301}
!309 = metadata !{i32 74, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !4, i32 74, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!311 = metadata !{i32 75, i32 0, metadata !310, null}
!312 = metadata !{i32 78, i32 0, metadata !4, null}
!313 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!314 = metadata !{i32 79, i32 0, metadata !4, null}
!315 = metadata !{i32 119, i32 0, metadata !34, metadata !314}
!316 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!317 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !314} ; [ DW_TAG_arg_variable ] [a] [line 119]
!318 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !314} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!319 = metadata !{i32 121, i32 0, metadata !34, metadata !314}
!320 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !314} ; [ DW_TAG_auto_variable ] [j] [line 121]
!321 = metadata !{i32 123, i32 0, metadata !243, metadata !314}
!322 = metadata !{i32 124, i32 0, metadata !243, metadata !314}
!323 = metadata !{i32 158, i32 0, metadata !55, metadata !324}
!324 = metadata !{i32 81, i32 0, metadata !4, null}
!325 = metadata !{i32 160, i32 0, metadata !55, metadata !324}
!326 = metadata !{i32 161, i32 0, metadata !55, metadata !324}
!327 = metadata !{i32 82, i32 0, metadata !27, null}
!328 = metadata !{i32 85, i32 0, metadata !26, null}
!329 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [n] [line 174]
!330 = metadata !{i32 86, i32 0, metadata !26, null}
!331 = metadata !{i32 174, i32 0, metadata !69, metadata !330}
!332 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!333 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [a] [line 174]
!334 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!335 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [w] [line 174]
!336 = metadata !{i32 178, i32 0, metadata !259, metadata !330}
!337 = metadata !{i32 179, i32 0, metadata !259, metadata !330}
!338 = metadata !{i32 88, i32 0, metadata !30, null}
!339 = metadata !{i32 89, i32 0, metadata !29, null}
!340 = metadata !{i32 90, i32 0, metadata !29, null}
!341 = metadata !{i32 91, i32 0, metadata !29, null}
!342 = metadata !{i32 92, i32 0, metadata !29, null}
!343 = metadata !{i32 93, i32 0, metadata !29, null}
!344 = metadata !{i32 94, i32 0, metadata !29, null}
!345 = metadata !{i32 97, i32 0, metadata !26, null}
!346 = metadata !{i32 158, i32 0, metadata !55, metadata !347}
!347 = metadata !{i32 99, i32 0, metadata !4, null}
!348 = metadata !{i32 160, i32 0, metadata !55, metadata !347}
!349 = metadata !{i32 161, i32 0, metadata !55, metadata !347}
!350 = metadata !{i32 102, i32 0, metadata !351, null}
!351 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!352 = metadata !{i32 104, i32 0, metadata !353, null}
!353 = metadata !{i32 786443, metadata !1, metadata !351, i32 102, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!354 = metadata !{i32 105, i32 0, metadata !353, null}
!355 = metadata !{i32 103, i32 0, metadata !353, null}
!356 = metadata !{i32 109, i32 0, metadata !4, null}
!357 = metadata !{i32 110, i32 0, metadata !4, null}
!358 = metadata !{i32 111, i32 0, metadata !4, null}
!359 = metadata !{i32 113, i32 0, metadata !4, null}
!360 = metadata !{i32 114, i32 0, metadata !4, null}
!361 = metadata !{i32 116, i32 0, metadata !4, null}
!362 = metadata !{i32 158, i32 0, metadata !55, null}
!363 = metadata !{i32 160, i32 0, metadata !55, null}
!364 = metadata !{i32 161, i32 0, metadata !55, null}
!365 = metadata !{metadata !366, metadata !367, i64 0}
!366 = metadata !{metadata !"timeval", metadata !367, i64 0, metadata !367, i64 8}
!367 = metadata !{metadata !"long", metadata !247, i64 0}
!368 = metadata !{metadata !366, metadata !367, i64 8}
!369 = metadata !{i32 193, i32 0, metadata !78, null}
!370 = metadata !{i32 198, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !78, i32 198, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!372 = metadata !{i32 199, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !371, i32 198, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!374 = metadata !{i32 200, i32 0, metadata !373, null}
!375 = metadata !{i32 201, i32 0, metadata !373, null}
!376 = metadata !{i32 202, i32 0, metadata !373, null}
!377 = metadata !{i32 203, i32 0, metadata !373, null}
!378 = metadata !{i32 204, i32 0, metadata !373, null}
!379 = metadata !{i32 205, i32 0, metadata !380, null}
!380 = metadata !{i32 786443, metadata !1, metadata !373, i32 205, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!381 = metadata !{i32 207, i32 0, metadata !382, null}
!382 = metadata !{i32 786443, metadata !1, metadata !383, i32 206, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!383 = metadata !{i32 786443, metadata !1, metadata !384, i32 206, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!384 = metadata !{i32 786443, metadata !1, metadata !380, i32 205, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!385 = metadata !{i32 208, i32 0, metadata !382, null}
!386 = metadata !{i32 209, i32 0, metadata !382, null}
!387 = metadata !{i32 210, i32 0, metadata !382, null}
!388 = metadata !{i32 211, i32 0, metadata !382, null}
!389 = metadata !{i32 212, i32 0, metadata !382, null}
!390 = metadata !{i32 206, i32 0, metadata !383, null}
!391 = metadata !{i32 214, i32 0, metadata !384, null}
!392 = metadata !{i32 215, i32 0, metadata !384, null}
!393 = metadata !{i32 217, i32 0, metadata !78, null}
!394 = metadata !{i32 119, i32 0, metadata !34, null}
!395 = metadata !{i32 121, i32 0, metadata !34, null}
!396 = metadata !{i32 123, i32 0, metadata !243, null}
!397 = metadata !{i32 124, i32 0, metadata !243, null}
!398 = metadata !{i32 125, i32 0, metadata !34, null}
!399 = metadata !{i32 174, i32 0, metadata !69, null}
!400 = metadata !{i32 176, i32 0, metadata !262, null}
!401 = metadata !{i32 177, i32 0, metadata !260, null}
!402 = metadata !{i32 178, i32 0, metadata !259, null}
!403 = metadata !{i32 179, i32 0, metadata !259, null}
!404 = metadata !{i32 180, i32 0, metadata !259, null}
!405 = metadata !{i32 786689, metadata !181, metadata !"n", metadata !5, i32 16777537, metadata !8, i32 0, metadata !406} ; [ DW_TAG_arg_variable ] [n] [line 321]
!406 = metadata !{i32 181, i32 0, metadata !407, null}
!407 = metadata !{i32 786443, metadata !1, metadata !260, i32 180, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!408 = metadata !{i32 321, i32 0, metadata !181, metadata !406}
!409 = metadata !{i32 786689, metadata !181, metadata !"ip", metadata !5, i32 33554753, metadata !13, i32 0, metadata !406} ; [ DW_TAG_arg_variable ] [ip] [line 321]
!410 = metadata !{i32 786689, metadata !181, metadata !"a", metadata !5, i32 50331969, metadata !15, i32 0, metadata !406} ; [ DW_TAG_arg_variable ] [a] [line 321]
!411 = metadata !{i32 326, i32 0, metadata !181, metadata !406}
!412 = metadata !{metadata !413, metadata !413, i64 0}
!413 = metadata !{metadata !"int", metadata !247, i64 0}
!414 = metadata !{i32 786688, metadata !181, metadata !"l", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [l] [line 323]
!415 = metadata !{i32 327, i32 0, metadata !181, metadata !406}
!416 = metadata !{i32 786688, metadata !181, metadata !"m", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [m] [line 323]
!417 = metadata !{i32 328, i32 0, metadata !181, metadata !406}
!418 = metadata !{i32 329, i32 0, metadata !181, metadata !406}
!419 = metadata !{i32 330, i32 0, metadata !420, metadata !406}
!420 = metadata !{i32 786443, metadata !1, metadata !181, i32 329, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!421 = metadata !{i32 786688, metadata !181, metadata !"j", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [j] [line 323]
!422 = metadata !{i32 331, i32 0, metadata !423, metadata !406}
!423 = metadata !{i32 786443, metadata !1, metadata !420, i32 331, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!424 = metadata !{i32 332, i32 0, metadata !425, metadata !406}
!425 = metadata !{i32 786443, metadata !1, metadata !423, i32 331, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!426 = metadata !{i32 334, i32 0, metadata !420, metadata !406}
!427 = metadata !{i32 336, i32 0, metadata !181, metadata !406}
!428 = metadata !{i32 786688, metadata !181, metadata !"m2", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [m2] [line 323]
!429 = metadata !{i32 337, i32 0, metadata !430, metadata !406}
!430 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!431 = metadata !{i32 338, i32 0, metadata !432, metadata !406}
!432 = metadata !{i32 786443, metadata !1, metadata !433, i32 338, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!433 = metadata !{i32 786443, metadata !1, metadata !430, i32 337, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!434 = metadata !{i32 393, i32 0, metadata !435, metadata !406}
!435 = metadata !{i32 786443, metadata !1, metadata !432, i32 338, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!436 = metadata !{i32 351, i32 0, metadata !437, metadata !406}
!437 = metadata !{i32 786443, metadata !1, metadata !438, i32 339, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!438 = metadata !{i32 786443, metadata !1, metadata !435, i32 339, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!439 = metadata !{i32 339, i32 0, metadata !438, metadata !406}
!440 = metadata !{i32 340, i32 0, metadata !437, metadata !406}
!441 = metadata !{i32 341, i32 0, metadata !437, metadata !406}
!442 = metadata !{i32 786688, metadata !181, metadata !"j1", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [j1] [line 323]
!443 = metadata !{i32 786688, metadata !181, metadata !"k1", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [k1] [line 323]
!444 = metadata !{i32 342, i32 0, metadata !437, metadata !406}
!445 = metadata !{i32 786688, metadata !181, metadata !"xr", metadata !5, i32 324, metadata !16, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [xr] [line 324]
!446 = metadata !{i32 343, i32 0, metadata !437, metadata !406}
!447 = metadata !{i32 786688, metadata !181, metadata !"xi", metadata !5, i32 324, metadata !16, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [xi] [line 324]
!448 = metadata !{i32 344, i32 0, metadata !437, metadata !406}
!449 = metadata !{i32 786688, metadata !181, metadata !"yr", metadata !5, i32 324, metadata !16, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [yr] [line 324]
!450 = metadata !{i32 345, i32 0, metadata !437, metadata !406}
!451 = metadata !{i32 786688, metadata !181, metadata !"yi", metadata !5, i32 324, metadata !16, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [yi] [line 324]
!452 = metadata !{i32 346, i32 0, metadata !437, metadata !406}
!453 = metadata !{i32 347, i32 0, metadata !437, metadata !406}
!454 = metadata !{i32 348, i32 0, metadata !437, metadata !406}
!455 = metadata !{i32 349, i32 0, metadata !437, metadata !406}
!456 = metadata !{i32 350, i32 0, metadata !437, metadata !406}
!457 = metadata !{i32 352, i32 0, metadata !437, metadata !406}
!458 = metadata !{i32 353, i32 0, metadata !437, metadata !406}
!459 = metadata !{i32 354, i32 0, metadata !437, metadata !406}
!460 = metadata !{i32 355, i32 0, metadata !437, metadata !406}
!461 = metadata !{i32 356, i32 0, metadata !437, metadata !406}
!462 = metadata !{i32 357, i32 0, metadata !437, metadata !406}
!463 = metadata !{i32 358, i32 0, metadata !437, metadata !406}
!464 = metadata !{i32 359, i32 0, metadata !437, metadata !406}
!465 = metadata !{i32 360, i32 0, metadata !437, metadata !406}
!466 = metadata !{i32 361, i32 0, metadata !437, metadata !406}
!467 = metadata !{i32 362, i32 0, metadata !437, metadata !406}
!468 = metadata !{i32 363, i32 0, metadata !437, metadata !406}
!469 = metadata !{i32 364, i32 0, metadata !437, metadata !406}
!470 = metadata !{i32 365, i32 0, metadata !437, metadata !406}
!471 = metadata !{i32 366, i32 0, metadata !437, metadata !406}
!472 = metadata !{i32 367, i32 0, metadata !437, metadata !406}
!473 = metadata !{i32 368, i32 0, metadata !437, metadata !406}
!474 = metadata !{i32 369, i32 0, metadata !437, metadata !406}
!475 = metadata !{i32 370, i32 0, metadata !437, metadata !406}
!476 = metadata !{i32 371, i32 0, metadata !437, metadata !406}
!477 = metadata !{i32 372, i32 0, metadata !437, metadata !406}
!478 = metadata !{i32 373, i32 0, metadata !437, metadata !406}
!479 = metadata !{i32 374, i32 0, metadata !437, metadata !406}
!480 = metadata !{i32 375, i32 0, metadata !437, metadata !406}
!481 = metadata !{i32 376, i32 0, metadata !437, metadata !406}
!482 = metadata !{i32 377, i32 0, metadata !437, metadata !406}
!483 = metadata !{i32 378, i32 0, metadata !437, metadata !406}
!484 = metadata !{i32 379, i32 0, metadata !437, metadata !406}
!485 = metadata !{i32 381, i32 0, metadata !435, metadata !406}
!486 = metadata !{i32 382, i32 0, metadata !435, metadata !406}
!487 = metadata !{i32 383, i32 0, metadata !435, metadata !406}
!488 = metadata !{i32 384, i32 0, metadata !435, metadata !406}
!489 = metadata !{i32 385, i32 0, metadata !435, metadata !406}
!490 = metadata !{i32 386, i32 0, metadata !435, metadata !406}
!491 = metadata !{i32 387, i32 0, metadata !435, metadata !406}
!492 = metadata !{i32 388, i32 0, metadata !435, metadata !406}
!493 = metadata !{i32 389, i32 0, metadata !435, metadata !406}
!494 = metadata !{i32 390, i32 0, metadata !435, metadata !406}
!495 = metadata !{i32 391, i32 0, metadata !435, metadata !406}
!496 = metadata !{i32 392, i32 0, metadata !435, metadata !406}
!497 = metadata !{i32 394, i32 0, metadata !435, metadata !406}
!498 = metadata !{i32 786688, metadata !181, metadata !"k", metadata !5, i32 323, metadata !8, i32 0, metadata !406} ; [ DW_TAG_auto_variable ] [k] [line 323]
!499 = metadata !{i32 397, i32 0, metadata !500, metadata !406}
!500 = metadata !{i32 786443, metadata !1, metadata !430, i32 396, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!501 = metadata !{i32 398, i32 0, metadata !500, metadata !406}
!502 = metadata !{i32 399, i32 0, metadata !503, metadata !406}
!503 = metadata !{i32 786443, metadata !1, metadata !500, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!504 = metadata !{i32 401, i32 0, metadata !505, metadata !406}
!505 = metadata !{i32 786443, metadata !1, metadata !506, i32 400, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!506 = metadata !{i32 786443, metadata !1, metadata !507, i32 400, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!507 = metadata !{i32 786443, metadata !1, metadata !503, i32 399, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!508 = metadata !{i32 402, i32 0, metadata !505, metadata !406}
!509 = metadata !{i32 400, i32 0, metadata !506, metadata !406}
!510 = metadata !{i32 403, i32 0, metadata !505, metadata !406}
!511 = metadata !{i32 404, i32 0, metadata !505, metadata !406}
!512 = metadata !{i32 405, i32 0, metadata !505, metadata !406}
!513 = metadata !{i32 406, i32 0, metadata !505, metadata !406}
!514 = metadata !{i32 407, i32 0, metadata !505, metadata !406}
!515 = metadata !{i32 408, i32 0, metadata !505, metadata !406}
!516 = metadata !{i32 409, i32 0, metadata !505, metadata !406}
!517 = metadata !{i32 410, i32 0, metadata !505, metadata !406}
!518 = metadata !{i32 411, i32 0, metadata !505, metadata !406}
!519 = metadata !{i32 412, i32 0, metadata !505, metadata !406}
!520 = metadata !{i32 413, i32 0, metadata !505, metadata !406}
!521 = metadata !{i32 414, i32 0, metadata !505, metadata !406}
!522 = metadata !{i32 415, i32 0, metadata !505, metadata !406}
!523 = metadata !{i32 416, i32 0, metadata !505, metadata !406}
!524 = metadata !{i32 417, i32 0, metadata !505, metadata !406}
!525 = metadata !{i32 418, i32 0, metadata !505, metadata !406}
!526 = metadata !{i32 419, i32 0, metadata !505, metadata !406}
!527 = metadata !{i32 420, i32 0, metadata !505, metadata !406}
!528 = metadata !{i32 422, i32 0, metadata !507, metadata !406}
!529 = metadata !{i32 423, i32 0, metadata !507, metadata !406}
!530 = metadata !{i32 424, i32 0, metadata !507, metadata !406}
!531 = metadata !{i32 786689, metadata !90, metadata !"n", metadata !5, i32 16777696, metadata !8, i32 0, metadata !532} ; [ DW_TAG_arg_variable ] [n] [line 480]
!532 = metadata !{i32 182, i32 0, metadata !407, null}
!533 = metadata !{i32 480, i32 0, metadata !90, metadata !532}
!534 = metadata !{i32 786689, metadata !90, metadata !"a", metadata !5, i32 33554912, metadata !15, i32 0, metadata !532} ; [ DW_TAG_arg_variable ] [a] [line 480]
!535 = metadata !{i32 786689, metadata !90, metadata !"w", metadata !5, i32 50332128, metadata !15, i32 0, metadata !532} ; [ DW_TAG_arg_variable ] [w] [line 480]
!536 = metadata !{i32 2}
!537 = metadata !{i32 786688, metadata !90, metadata !"l", metadata !5, i32 482, metadata !8, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [l] [line 482]
!538 = metadata !{i32 485, i32 0, metadata !90, metadata !532}
!539 = metadata !{i32 486, i32 0, metadata !540, metadata !532}
!540 = metadata !{i32 786443, metadata !1, metadata !90, i32 486, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!541 = metadata !{i32 487, i32 0, metadata !542, metadata !532}
!542 = metadata !{i32 786443, metadata !1, metadata !540, i32 486, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!543 = metadata !{i32 8}
!544 = metadata !{i32 488, i32 0, metadata !542, metadata !532}
!545 = metadata !{i32 489, i32 0, metadata !542, metadata !532}
!546 = metadata !{i32 490, i32 0, metadata !547, metadata !532}
!547 = metadata !{i32 786443, metadata !1, metadata !542, i32 489, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!548 = metadata !{i32 491, i32 0, metadata !547, metadata !532}
!549 = metadata !{i32 494, i32 0, metadata !550, metadata !532}
!550 = metadata !{i32 786443, metadata !1, metadata !90, i32 494, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!551 = metadata !{i32 786688, metadata !90, metadata !"j", metadata !5, i32 482, metadata !8, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [j] [line 482]
!552 = metadata !{i32 495, i32 0, metadata !553, metadata !532}
!553 = metadata !{i32 786443, metadata !1, metadata !554, i32 495, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!554 = metadata !{i32 786443, metadata !1, metadata !550, i32 494, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!555 = metadata !{i32 517, i32 0, metadata !556, metadata !532}
!556 = metadata !{i32 786443, metadata !1, metadata !557, i32 517, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!557 = metadata !{i32 786443, metadata !1, metadata !550, i32 516, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!558 = metadata !{i32 496, i32 0, metadata !559, metadata !532}
!559 = metadata !{i32 786443, metadata !1, metadata !553, i32 495, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!560 = metadata !{i32 497, i32 0, metadata !559, metadata !532}
!561 = metadata !{i32 498, i32 0, metadata !559, metadata !532}
!562 = metadata !{i32 499, i32 0, metadata !559, metadata !532}
!563 = metadata !{i32 786688, metadata !90, metadata !"x0r", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x0r] [line 483]
!564 = metadata !{i32 500, i32 0, metadata !559, metadata !532}
!565 = metadata !{i32 786688, metadata !90, metadata !"x0i", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x0i] [line 483]
!566 = metadata !{double undef}
!567 = metadata !{i32 786688, metadata !90, metadata !"x1r", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x1r] [line 483]
!568 = metadata !{i32 501, i32 0, metadata !559, metadata !532}
!569 = metadata !{i32 786688, metadata !90, metadata !"x1i", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x1i] [line 483]
!570 = metadata !{i32 502, i32 0, metadata !559, metadata !532}
!571 = metadata !{i32 503, i32 0, metadata !559, metadata !532}
!572 = metadata !{i32 786688, metadata !90, metadata !"x2r", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x2r] [line 483]
!573 = metadata !{i32 504, i32 0, metadata !559, metadata !532}
!574 = metadata !{i32 786688, metadata !90, metadata !"x2i", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x2i] [line 483]
!575 = metadata !{i32 786688, metadata !90, metadata !"x3r", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x3r] [line 483]
!576 = metadata !{i32 505, i32 0, metadata !559, metadata !532}
!577 = metadata !{i32 506, i32 0, metadata !559, metadata !532}
!578 = metadata !{i32 786688, metadata !90, metadata !"x3i", metadata !5, i32 483, metadata !16, i32 0, metadata !532} ; [ DW_TAG_auto_variable ] [x3i] [line 483]
!579 = metadata !{i32 507, i32 0, metadata !559, metadata !532}
!580 = metadata !{i32 508, i32 0, metadata !559, metadata !532}
!581 = metadata !{i32 509, i32 0, metadata !559, metadata !532}
!582 = metadata !{i32 510, i32 0, metadata !559, metadata !532}
!583 = metadata !{i32 511, i32 0, metadata !559, metadata !532}
!584 = metadata !{i32 513, i32 0, metadata !559, metadata !532}
!585 = metadata !{i32 518, i32 0, metadata !586, metadata !532}
!586 = metadata !{i32 786443, metadata !1, metadata !556, i32 517, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!587 = metadata !{i32 519, i32 0, metadata !586, metadata !532}
!588 = metadata !{i32 520, i32 0, metadata !586, metadata !532}
!589 = metadata !{i32 521, i32 0, metadata !586, metadata !532}
!590 = metadata !{i32 522, i32 0, metadata !586, metadata !532}
!591 = metadata !{i32 523, i32 0, metadata !586, metadata !532}
!592 = metadata !{i32 184, i32 0, metadata !593, null}
!593 = metadata !{i32 786443, metadata !1, metadata !262, i32 184, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!594 = metadata !{i32 185, i32 0, metadata !595, null}
!595 = metadata !{i32 786443, metadata !1, metadata !593, i32 184, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!596 = metadata !{i32 186, i32 0, metadata !595, null}
!597 = metadata !{i32 187, i32 0, metadata !69, null}
!598 = metadata !{i32 127, i32 0, metadata !43, null}
!599 = metadata !{i32 129, i32 0, metadata !43, null}
!600 = metadata !{i32 130, i32 0, metadata !43, null}
!601 = metadata !{i32 132, i32 0, metadata !278, null}
!602 = metadata !{i32 133, i32 0, metadata !280, null}
!603 = metadata !{i32 134, i32 0, metadata !280, null}
!604 = metadata !{i32 136, i32 0, metadata !43, null}
!605 = metadata !{i32 221, i32 0, metadata !197, null}
!606 = metadata !{i32 226, i32 0, metadata !197, null}
!607 = metadata !{i32 227, i32 0, metadata !197, null}
!608 = metadata !{i32 228, i32 0, metadata !197, null}
!609 = metadata !{i32 229, i32 0, metadata !197, null}
!610 = metadata !{i32 230, i32 0, metadata !611, null}
!611 = metadata !{i32 786443, metadata !1, metadata !197, i32 229, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!612 = metadata !{i32 231, i32 0, metadata !613, null}
!613 = metadata !{i32 786443, metadata !1, metadata !611, i32 231, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!614 = metadata !{i32 232, i32 0, metadata !615, null}
!615 = metadata !{i32 786443, metadata !1, metadata !613, i32 231, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!616 = metadata !{i32 234, i32 0, metadata !611, null}
!617 = metadata !{i32 236, i32 0, metadata !197, null}
!618 = metadata !{i32 237, i32 0, metadata !619, null}
!619 = metadata !{i32 786443, metadata !1, metadata !197, i32 237, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!620 = metadata !{i32 293, i32 0, metadata !621, null}
!621 = metadata !{i32 786443, metadata !1, metadata !622, i32 293, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!622 = metadata !{i32 786443, metadata !1, metadata !619, i32 292, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!623 = metadata !{i32 238, i32 0, metadata !624, null}
!624 = metadata !{i32 786443, metadata !1, metadata !625, i32 238, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!625 = metadata !{i32 786443, metadata !1, metadata !619, i32 237, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!626 = metadata !{i32 251, i32 0, metadata !627, null}
!627 = metadata !{i32 786443, metadata !1, metadata !628, i32 239, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!628 = metadata !{i32 786443, metadata !1, metadata !629, i32 239, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!629 = metadata !{i32 786443, metadata !1, metadata !624, i32 238, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!630 = metadata !{i32 239, i32 0, metadata !628, null}
!631 = metadata !{i32 240, i32 0, metadata !627, null}
!632 = metadata !{i32 241, i32 0, metadata !627, null}
!633 = metadata !{i32 242, i32 0, metadata !627, null}
!634 = metadata !{i32 243, i32 0, metadata !627, null}
!635 = metadata !{i32 244, i32 0, metadata !627, null}
!636 = metadata !{i32 245, i32 0, metadata !627, null}
!637 = metadata !{i32 246, i32 0, metadata !627, null}
!638 = metadata !{i32 247, i32 0, metadata !627, null}
!639 = metadata !{i32 248, i32 0, metadata !627, null}
!640 = metadata !{i32 249, i32 0, metadata !627, null}
!641 = metadata !{i32 250, i32 0, metadata !627, null}
!642 = metadata !{i32 252, i32 0, metadata !627, null}
!643 = metadata !{i32 253, i32 0, metadata !627, null}
!644 = metadata !{i32 254, i32 0, metadata !627, null}
!645 = metadata !{i32 255, i32 0, metadata !627, null}
!646 = metadata !{i32 256, i32 0, metadata !627, null}
!647 = metadata !{i32 257, i32 0, metadata !627, null}
!648 = metadata !{i32 258, i32 0, metadata !627, null}
!649 = metadata !{i32 259, i32 0, metadata !627, null}
!650 = metadata !{i32 260, i32 0, metadata !627, null}
!651 = metadata !{i32 261, i32 0, metadata !627, null}
!652 = metadata !{i32 262, i32 0, metadata !627, null}
!653 = metadata !{i32 263, i32 0, metadata !627, null}
!654 = metadata !{i32 264, i32 0, metadata !627, null}
!655 = metadata !{i32 265, i32 0, metadata !627, null}
!656 = metadata !{i32 266, i32 0, metadata !627, null}
!657 = metadata !{i32 267, i32 0, metadata !627, null}
!658 = metadata !{i32 268, i32 0, metadata !627, null}
!659 = metadata !{i32 269, i32 0, metadata !627, null}
!660 = metadata !{i32 270, i32 0, metadata !627, null}
!661 = metadata !{i32 271, i32 0, metadata !627, null}
!662 = metadata !{i32 272, i32 0, metadata !627, null}
!663 = metadata !{i32 273, i32 0, metadata !627, null}
!664 = metadata !{i32 274, i32 0, metadata !627, null}
!665 = metadata !{i32 275, i32 0, metadata !627, null}
!666 = metadata !{i32 276, i32 0, metadata !627, null}
!667 = metadata !{i32 277, i32 0, metadata !627, null}
!668 = metadata !{i32 278, i32 0, metadata !627, null}
!669 = metadata !{i32 279, i32 0, metadata !627, null}
!670 = metadata !{i32 281, i32 0, metadata !629, null}
!671 = metadata !{i32 282, i32 0, metadata !629, null}
!672 = metadata !{i32 283, i32 0, metadata !629, null}
!673 = metadata !{i32 284, i32 0, metadata !629, null}
!674 = metadata !{i32 285, i32 0, metadata !629, null}
!675 = metadata !{i32 286, i32 0, metadata !629, null}
!676 = metadata !{i32 287, i32 0, metadata !629, null}
!677 = metadata !{i32 288, i32 0, metadata !629, null}
!678 = metadata !{i32 289, i32 0, metadata !629, null}
!679 = metadata !{i32 290, i32 0, metadata !629, null}
!680 = metadata !{i32 295, i32 0, metadata !681, null}
!681 = metadata !{i32 786443, metadata !1, metadata !682, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!682 = metadata !{i32 786443, metadata !1, metadata !683, i32 294, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!683 = metadata !{i32 786443, metadata !1, metadata !621, i32 293, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!684 = metadata !{i32 296, i32 0, metadata !681, null}
!685 = metadata !{i32 294, i32 0, metadata !682, null}
!686 = metadata !{i32 297, i32 0, metadata !681, null}
!687 = metadata !{i32 298, i32 0, metadata !681, null}
!688 = metadata !{i32 299, i32 0, metadata !681, null}
!689 = metadata !{i32 300, i32 0, metadata !681, null}
!690 = metadata !{i32 301, i32 0, metadata !681, null}
!691 = metadata !{i32 302, i32 0, metadata !681, null}
!692 = metadata !{i32 303, i32 0, metadata !681, null}
!693 = metadata !{i32 304, i32 0, metadata !681, null}
!694 = metadata !{i32 305, i32 0, metadata !681, null}
!695 = metadata !{i32 306, i32 0, metadata !681, null}
!696 = metadata !{i32 307, i32 0, metadata !681, null}
!697 = metadata !{i32 308, i32 0, metadata !681, null}
!698 = metadata !{i32 309, i32 0, metadata !681, null}
!699 = metadata !{i32 310, i32 0, metadata !681, null}
!700 = metadata !{i32 311, i32 0, metadata !681, null}
!701 = metadata !{i32 312, i32 0, metadata !681, null}
!702 = metadata !{i32 313, i32 0, metadata !681, null}
!703 = metadata !{i32 314, i32 0, metadata !681, null}
!704 = metadata !{i32 318, i32 0, metadata !197, null}
!705 = metadata !{i32 430, i32 0, metadata !163, null}
!706 = metadata !{i32 435, i32 0, metadata !163, null}
!707 = metadata !{i32 436, i32 0, metadata !708, null}
!708 = metadata !{i32 786443, metadata !1, metadata !163, i32 436, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!709 = metadata !{i32 437, i32 0, metadata !710, null}
!710 = metadata !{i32 786443, metadata !1, metadata !708, i32 436, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!711 = metadata !{i32 438, i32 0, metadata !710, null}
!712 = metadata !{i32 439, i32 0, metadata !710, null}
!713 = metadata !{i32 440, i32 0, metadata !714, null}
!714 = metadata !{i32 786443, metadata !1, metadata !710, i32 439, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!715 = metadata !{i32 441, i32 0, metadata !714, null}
!716 = metadata !{i32 444, i32 0, metadata !717, null}
!717 = metadata !{i32 786443, metadata !1, metadata !163, i32 444, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!718 = metadata !{i32 445, i32 0, metadata !719, null}
!719 = metadata !{i32 786443, metadata !1, metadata !720, i32 445, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!720 = metadata !{i32 786443, metadata !1, metadata !717, i32 444, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!721 = metadata !{i32 467, i32 0, metadata !722, null}
!722 = metadata !{i32 786443, metadata !1, metadata !723, i32 467, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!723 = metadata !{i32 786443, metadata !1, metadata !717, i32 466, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!724 = metadata !{i32 446, i32 0, metadata !725, null}
!725 = metadata !{i32 786443, metadata !1, metadata !719, i32 445, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!726 = metadata !{i32 447, i32 0, metadata !725, null}
!727 = metadata !{i32 448, i32 0, metadata !725, null}
!728 = metadata !{i32 449, i32 0, metadata !725, null}
!729 = metadata !{i32 450, i32 0, metadata !725, null}
!730 = metadata !{i32 451, i32 0, metadata !725, null}
!731 = metadata !{i32 452, i32 0, metadata !725, null}
!732 = metadata !{i32 453, i32 0, metadata !725, null}
!733 = metadata !{i32 454, i32 0, metadata !725, null}
!734 = metadata !{i32 455, i32 0, metadata !725, null}
!735 = metadata !{i32 456, i32 0, metadata !725, null}
!736 = metadata !{i32 457, i32 0, metadata !725, null}
!737 = metadata !{i32 459, i32 0, metadata !725, null}
!738 = metadata !{i32 461, i32 0, metadata !725, null}
!739 = metadata !{i32 462, i32 0, metadata !725, null}
!740 = metadata !{i32 463, i32 0, metadata !725, null}
!741 = metadata !{i32 464, i32 0, metadata !725, null}
!742 = metadata !{i32 468, i32 0, metadata !743, null}
!743 = metadata !{i32 786443, metadata !1, metadata !722, i32 467, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!744 = metadata !{i32 469, i32 0, metadata !743, null}
!745 = metadata !{i32 470, i32 0, metadata !743, null}
!746 = metadata !{i32 471, i32 0, metadata !743, null}
!747 = metadata !{i32 472, i32 0, metadata !743, null}
!748 = metadata !{i32 473, i32 0, metadata !743, null}
!749 = metadata !{i32 477, i32 0, metadata !163, null}
!750 = metadata !{i32 530, i32 0, metadata !141, null}
!751 = metadata !{i32 536, i32 0, metadata !141, null}
!752 = metadata !{i32 537, i32 0, metadata !141, null}
!753 = metadata !{i32 538, i32 0, metadata !141, null}
!754 = metadata !{i32 539, i32 0, metadata !141, null}
!755 = metadata !{i32 540, i32 0, metadata !141, null}
!756 = metadata !{i32 541, i32 0, metadata !141, null}
!757 = metadata !{i32 542, i32 0, metadata !141, null}
!758 = metadata !{i32 543, i32 0, metadata !141, null}
!759 = metadata !{i32 544, i32 0, metadata !141, null}
!760 = metadata !{i32 546, i32 0, metadata !141, null}
!761 = metadata !{i32 548, i32 0, metadata !141, null}
!762 = metadata !{i32 549, i32 0, metadata !141, null}
!763 = metadata !{i32 550, i32 0, metadata !141, null}
!764 = metadata !{i32 551, i32 0, metadata !141, null}
!765 = metadata !{i32 552, i32 0, metadata !141, null}
!766 = metadata !{i32 553, i32 0, metadata !141, null}
!767 = metadata !{i32 554, i32 0, metadata !141, null}
!768 = metadata !{i32 555, i32 0, metadata !141, null}
!769 = metadata !{i32 556, i32 0, metadata !141, null}
!770 = metadata !{i32 557, i32 0, metadata !141, null}
!771 = metadata !{i32 558, i32 0, metadata !141, null}
!772 = metadata !{i32 559, i32 0, metadata !141, null}
!773 = metadata !{i32 560, i32 0, metadata !141, null}
!774 = metadata !{i32 561, i32 0, metadata !141, null}
!775 = metadata !{i32 563, i32 0, metadata !141, null}
!776 = metadata !{i32 565, i32 0, metadata !141, null}
!777 = metadata !{i32 566, i32 0, metadata !141, null}
!778 = metadata !{i32 567, i32 0, metadata !141, null}
!779 = metadata !{i32 568, i32 0, metadata !141, null}
!780 = metadata !{i32 569, i32 0, metadata !141, null}
!781 = metadata !{i32 570, i32 0, metadata !141, null}
!782 = metadata !{i32 571, i32 0, metadata !141, null}
!783 = metadata !{i32 572, i32 0, metadata !141, null}
!784 = metadata !{i32 573, i32 0, metadata !141, null}
!785 = metadata !{i32 16}
!786 = metadata !{i32 574, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !1, metadata !141, i32 574, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!788 = metadata !{i32 576, i32 0, metadata !789, null}
!789 = metadata !{i32 786443, metadata !1, metadata !787, i32 574, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!790 = metadata !{i32 577, i32 0, metadata !789, null}
!791 = metadata !{i32 578, i32 0, metadata !789, null}
!792 = metadata !{i32 579, i32 0, metadata !789, null}
!793 = metadata !{i32 580, i32 0, metadata !789, null}
!794 = metadata !{i32 581, i32 0, metadata !789, null}
!795 = metadata !{i32 582, i32 0, metadata !789, null}
!796 = metadata !{i32 583, i32 0, metadata !789, null}
!797 = metadata !{i32 584, i32 0, metadata !789, null}
!798 = metadata !{i32 585, i32 0, metadata !789, null}
!799 = metadata !{i32 586, i32 0, metadata !789, null}
!800 = metadata !{i32 587, i32 0, metadata !789, null}
!801 = metadata !{i32 588, i32 0, metadata !789, null}
!802 = metadata !{i32 589, i32 0, metadata !789, null}
!803 = metadata !{i32 590, i32 0, metadata !789, null}
!804 = metadata !{i32 591, i32 0, metadata !789, null}
!805 = metadata !{i32 593, i32 0, metadata !789, null}
!806 = metadata !{i32 594, i32 0, metadata !789, null}
!807 = metadata !{i32 595, i32 0, metadata !789, null}
!808 = metadata !{i32 596, i32 0, metadata !789, null}
!809 = metadata !{i32 597, i32 0, metadata !789, null}
!810 = metadata !{i32 598, i32 0, metadata !789, null}
!811 = metadata !{i32 599, i32 0, metadata !789, null}
!812 = metadata !{i32 600, i32 0, metadata !789, null}
!813 = metadata !{i32 601, i32 0, metadata !789, null}
!814 = metadata !{i32 602, i32 0, metadata !789, null}
!815 = metadata !{i32 603, i32 0, metadata !789, null}
!816 = metadata !{i32 604, i32 0, metadata !789, null}
!817 = metadata !{i32 605, i32 0, metadata !789, null}
!818 = metadata !{i32 606, i32 0, metadata !789, null}
!819 = metadata !{i32 607, i32 0, metadata !789, null}
!820 = metadata !{i32 608, i32 0, metadata !789, null}
!821 = metadata !{i32 609, i32 0, metadata !789, null}
!822 = metadata !{i32 610, i32 0, metadata !789, null}
!823 = metadata !{i32 611, i32 0, metadata !789, null}
!824 = metadata !{i32 612, i32 0, metadata !789, null}
!825 = metadata !{i32 613, i32 0, metadata !789, null}
!826 = metadata !{i32 614, i32 0, metadata !789, null}
!827 = metadata !{i32 615, i32 0, metadata !789, null}
!828 = metadata !{i32 616, i32 0, metadata !789, null}
!829 = metadata !{i32 617, i32 0, metadata !789, null}
!830 = metadata !{i32 619, i32 0, metadata !789, null}
!831 = metadata !{i32 620, i32 0, metadata !789, null}
!832 = metadata !{i32 621, i32 0, metadata !789, null}
!833 = metadata !{i32 622, i32 0, metadata !789, null}
!834 = metadata !{i32 623, i32 0, metadata !789, null}
!835 = metadata !{i32 624, i32 0, metadata !789, null}
!836 = metadata !{i32 625, i32 0, metadata !789, null}
!837 = metadata !{i32 626, i32 0, metadata !789, null}
!838 = metadata !{i32 627, i32 0, metadata !789, null}
!839 = metadata !{i32 628, i32 0, metadata !789, null}
!840 = metadata !{i32 629, i32 0, metadata !789, null}
!841 = metadata !{i32 630, i32 0, metadata !789, null}
!842 = metadata !{i32 632, i32 0, metadata !141, null}
!843 = metadata !{i32 635, i32 0, metadata !110, null}
!844 = metadata !{i32 641, i32 0, metadata !110, null}
!845 = metadata !{i32 642, i32 0, metadata !846, null}
!846 = metadata !{i32 786443, metadata !1, metadata !110, i32 642, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!847 = metadata !{i32 643, i32 0, metadata !848, null}
!848 = metadata !{i32 786443, metadata !1, metadata !846, i32 642, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!849 = metadata !{i32 644, i32 0, metadata !848, null}
!850 = metadata !{i32 645, i32 0, metadata !848, null}
!851 = metadata !{i32 646, i32 0, metadata !848, null}
!852 = metadata !{i32 647, i32 0, metadata !848, null}
!853 = metadata !{i32 648, i32 0, metadata !848, null}
!854 = metadata !{i32 649, i32 0, metadata !848, null}
!855 = metadata !{i32 650, i32 0, metadata !848, null}
!856 = metadata !{i32 651, i32 0, metadata !848, null}
!857 = metadata !{i32 652, i32 0, metadata !848, null}
!858 = metadata !{i32 653, i32 0, metadata !848, null}
!859 = metadata !{i32 654, i32 0, metadata !848, null}
!860 = metadata !{i32 656, i32 0, metadata !848, null}
!861 = metadata !{i32 658, i32 0, metadata !848, null}
!862 = metadata !{i32 659, i32 0, metadata !848, null}
!863 = metadata !{i32 660, i32 0, metadata !848, null}
!864 = metadata !{i32 661, i32 0, metadata !848, null}
!865 = metadata !{i32 663, i32 0, metadata !110, null}
!866 = metadata !{i32 664, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !1, metadata !110, i32 664, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!868 = metadata !{i32 682, i32 0, metadata !869, null}
!869 = metadata !{i32 786443, metadata !1, metadata !867, i32 664, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!870 = metadata !{i32 665, i32 0, metadata !869, null}
!871 = metadata !{i32 666, i32 0, metadata !869, null}
!872 = metadata !{i32 667, i32 0, metadata !869, null}
!873 = metadata !{i32 668, i32 0, metadata !869, null}
!874 = metadata !{i32 669, i32 0, metadata !869, null}
!875 = metadata !{i32 670, i32 0, metadata !869, null}
!876 = metadata !{i32 671, i32 0, metadata !869, null}
!877 = metadata !{i32 672, i32 0, metadata !869, null}
!878 = metadata !{i32 673, i32 0, metadata !869, null}
!879 = metadata !{i32 674, i32 0, metadata !869, null}
!880 = metadata !{i32 675, i32 0, metadata !869, null}
!881 = metadata !{i32 676, i32 0, metadata !869, null}
!882 = metadata !{i32 677, i32 0, metadata !869, null}
!883 = metadata !{i32 678, i32 0, metadata !869, null}
!884 = metadata !{i32 679, i32 0, metadata !869, null}
!885 = metadata !{i32 680, i32 0, metadata !869, null}
!886 = metadata !{i32 681, i32 0, metadata !869, null}
!887 = metadata !{i32 683, i32 0, metadata !869, null}
!888 = metadata !{i32 684, i32 0, metadata !869, null}
!889 = metadata !{i32 685, i32 0, metadata !869, null}
!890 = metadata !{i32 686, i32 0, metadata !869, null}
!891 = metadata !{i32 687, i32 0, metadata !869, null}
!892 = metadata !{i32 689, i32 0, metadata !110, null}
!893 = metadata !{i32 690, i32 0, metadata !110, null}
!894 = metadata !{i32 691, i32 0, metadata !895, null}
!895 = metadata !{i32 786443, metadata !1, metadata !110, i32 691, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!896 = metadata !{i32 692, i32 0, metadata !897, null}
!897 = metadata !{i32 786443, metadata !1, metadata !895, i32 691, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!898 = metadata !{i32 693, i32 0, metadata !897, null}
!899 = metadata !{i32 694, i32 0, metadata !897, null}
!900 = metadata !{i32 695, i32 0, metadata !897, null}
!901 = metadata !{i32 696, i32 0, metadata !897, null}
!902 = metadata !{i32 697, i32 0, metadata !897, null}
!903 = metadata !{i32 698, i32 0, metadata !897, null}
!904 = metadata !{i32 699, i32 0, metadata !897, null}
!905 = metadata !{i32 700, i32 0, metadata !906, null}
!906 = metadata !{i32 786443, metadata !1, metadata !897, i32 700, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!907 = metadata !{i32 701, i32 0, metadata !908, null}
!908 = metadata !{i32 786443, metadata !1, metadata !906, i32 700, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!909 = metadata !{i32 702, i32 0, metadata !908, null}
!910 = metadata !{i32 703, i32 0, metadata !908, null}
!911 = metadata !{i32 704, i32 0, metadata !908, null}
!912 = metadata !{i32 705, i32 0, metadata !908, null}
!913 = metadata !{i32 706, i32 0, metadata !908, null}
!914 = metadata !{i32 707, i32 0, metadata !908, null}
!915 = metadata !{i32 708, i32 0, metadata !908, null}
!916 = metadata !{i32 709, i32 0, metadata !908, null}
!917 = metadata !{i32 710, i32 0, metadata !908, null}
!918 = metadata !{i32 711, i32 0, metadata !908, null}
!919 = metadata !{i32 712, i32 0, metadata !908, null}
!920 = metadata !{i32 713, i32 0, metadata !908, null}
!921 = metadata !{i32 714, i32 0, metadata !908, null}
!922 = metadata !{i32 715, i32 0, metadata !908, null}
!923 = metadata !{i32 716, i32 0, metadata !908, null}
!924 = metadata !{i32 717, i32 0, metadata !908, null}
!925 = metadata !{i32 718, i32 0, metadata !908, null}
!926 = metadata !{i32 719, i32 0, metadata !908, null}
!927 = metadata !{i32 720, i32 0, metadata !908, null}
!928 = metadata !{i32 721, i32 0, metadata !908, null}
!929 = metadata !{i32 722, i32 0, metadata !908, null}
!930 = metadata !{i32 723, i32 0, metadata !908, null}
!931 = metadata !{i32 724, i32 0, metadata !908, null}
!932 = metadata !{i32 725, i32 0, metadata !908, null}
!933 = metadata !{i32 727, i32 0, metadata !897, null}
!934 = metadata !{i32 728, i32 0, metadata !897, null}
!935 = metadata !{i32 729, i32 0, metadata !897, null}
!936 = metadata !{i32 730, i32 0, metadata !897, null}
!937 = metadata !{i32 731, i32 0, metadata !938, null}
!938 = metadata !{i32 786443, metadata !1, metadata !897, i32 731, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!939 = metadata !{i32 747, i32 0, metadata !940, null}
!940 = metadata !{i32 786443, metadata !1, metadata !938, i32 731, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!941 = metadata !{i32 732, i32 0, metadata !940, null}
!942 = metadata !{i32 733, i32 0, metadata !940, null}
!943 = metadata !{i32 734, i32 0, metadata !940, null}
!944 = metadata !{i32 735, i32 0, metadata !940, null}
!945 = metadata !{i32 736, i32 0, metadata !940, null}
!946 = metadata !{i32 737, i32 0, metadata !940, null}
!947 = metadata !{i32 738, i32 0, metadata !940, null}
!948 = metadata !{i32 739, i32 0, metadata !940, null}
!949 = metadata !{i32 740, i32 0, metadata !940, null}
!950 = metadata !{i32 741, i32 0, metadata !940, null}
!951 = metadata !{i32 742, i32 0, metadata !940, null}
!952 = metadata !{i32 743, i32 0, metadata !940, null}
!953 = metadata !{i32 745, i32 0, metadata !940, null}
!954 = metadata !{i32 746, i32 0, metadata !940, null}
!955 = metadata !{i32 748, i32 0, metadata !940, null}
!956 = metadata !{i32 749, i32 0, metadata !940, null}
!957 = metadata !{i32 750, i32 0, metadata !940, null}
!958 = metadata !{i32 751, i32 0, metadata !940, null}
!959 = metadata !{i32 752, i32 0, metadata !940, null}
!960 = metadata !{i32 753, i32 0, metadata !940, null}
!961 = metadata !{i32 754, i32 0, metadata !940, null}
!962 = metadata !{i32 755, i32 0, metadata !940, null}
!963 = metadata !{i32 756, i32 0, metadata !940, null}
!964 = metadata !{i32 759, i32 0, metadata !110, null}
