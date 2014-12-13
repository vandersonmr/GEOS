; ModuleID = 'oourafft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %tv.i19 = alloca %struct.timeval, align 8
  %tv.i18 = alloca %struct.timeval, align 8
  %tv.i1 = alloca %struct.timeval, align 8
  %tv.i = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !23), !dbg !217
  %1 = bitcast %struct.timeval* %tv.i to i8*, !dbg !218
  call void @llvm.lifetime.start(i64 16, i8* %1) #6, !dbg !218
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i}, metadata !59) #6, !dbg !218
  %2 = call i32 @gettimeofday(%struct.timeval* %tv.i, %struct.timezone* null) #6, !dbg !220
  call void @llvm.lifetime.end(i64 16, i8* %1) #6, !dbg !221
  %3 = bitcast %struct.timeval* %tv.i1 to i8*, !dbg !222
  call void @llvm.lifetime.start(i64 16, i8* %3) #6, !dbg !222
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i1}, metadata !59) #6, !dbg !222
  %4 = call i32 @gettimeofday(%struct.timeval* %tv.i1, %struct.timezone* null) #6, !dbg !224
  call void @llvm.lifetime.end(i64 16, i8* %3) #6, !dbg !225
  %5 = tail call noalias i8* @memalign(i64 16, i64 128) #6, !dbg !226
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !12), !dbg !226
  %6 = tail call noalias i8* @memalign(i64 16, i64 20480) #6, !dbg !227
  %7 = bitcast i8* %6 to double*, !dbg !227
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !19), !dbg !227
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !229) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !232) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !233) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !234, i64 0, metadata !235) #6, !dbg !236
  tail call void @llvm.dbg.value(metadata !239, i64 0, metadata !240) #6, !dbg !241
  store double 1.000000e+00, double* %7, align 8, !dbg !242, !tbaa !243
  %8 = getelementptr inbounds i8* %6, i64 8, !dbg !247
  %9 = bitcast i8* %8 to double*, !dbg !247
  store double 0.000000e+00, double* %9, align 8, !dbg !247, !tbaa !243
  %10 = getelementptr inbounds i8* %6, i64 2048, !dbg !248
  %11 = bitcast i8* %10 to double*, !dbg !248
  store double 0x3FE6A09E667F3BCD, double* %11, align 8, !dbg !248, !tbaa !243
  %12 = getelementptr inbounds i8* %6, i64 2056, !dbg !249
  %13 = bitcast i8* %12 to double*, !dbg !249
  store double 0x3FE6A09E667F3BCD, double* %13, align 8, !dbg !249, !tbaa !243
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i, %0
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 2, %0 ]
  %14 = trunc i64 %indvars.iv.i to i32, !dbg !250
  %15 = sitofp i32 %14 to double, !dbg !250
  %16 = fmul double %15, 0x3F6921FB54442D18, !dbg !250
  %17 = tail call double @cos(double %16) #6, !dbg !250
  tail call void @llvm.dbg.value(metadata !{double %17}, i64 0, metadata !255) #6, !dbg !250
  %18 = tail call double @sin(double %16) #6, !dbg !256
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !257) #6, !dbg !256
  %19 = getelementptr inbounds double* %7, i64 %indvars.iv.i, !dbg !258
  store double %17, double* %19, align 8, !dbg !258, !tbaa !243
  %20 = or i64 %indvars.iv.i, 1, !dbg !259
  %21 = getelementptr inbounds double* %7, i64 %20, !dbg !259
  store double %18, double* %21, align 8, !dbg !259, !tbaa !243
  %22 = sub nsw i32 512, %14, !dbg !260
  %23 = sext i32 %22 to i64, !dbg !260
  %24 = getelementptr inbounds double* %7, i64 %23, !dbg !260
  store double %18, double* %24, align 8, !dbg !260, !tbaa !243
  %25 = or i32 %22, 1, !dbg !261
  %26 = sext i32 %25 to i64, !dbg !261
  %27 = getelementptr inbounds double* %7, i64 %26, !dbg !261
  store double %17, double* %27, align 8, !dbg !261, !tbaa !243
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 2, !dbg !262
  %28 = trunc i64 %indvars.iv.next.i to i32, !dbg !262
  %29 = icmp slt i32 %28, 256, !dbg !262
  br i1 %29, label %.lr.ph.i, label %makewt.exit, !dbg !262

makewt.exit:                                      ; preds = %.lr.ph.i
  %30 = bitcast i8* %5 to i32*, !dbg !226
  tail call fastcc void @bitrv2(i32 512, i32* %30, double* %7) #6, !dbg !263
  %31 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !264
  %32 = bitcast i8* %31 to double*, !dbg !264
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !14), !dbg !264
  %33 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !265
  tail call void @llvm.dbg.value(metadata !{double* %42}, i64 0, metadata !17), !dbg !265
  %34 = tail call noalias i8* @memalign(i64 16, i64 16384) #6, !dbg !266
  tail call void @llvm.dbg.value(metadata !{double* %43}, i64 0, metadata !18), !dbg !266
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !268), !dbg !270
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !272), !dbg !270
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !273), !dbg !270
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !274), !dbg !275
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !276), !dbg !277
  br label %35, !dbg !277

; <label>:35                                      ; preds = %35, %makewt.exit
  %indvars.iv.i3 = phi i64 [ %indvars.iv.next.i4, %35 ], [ 0, %makewt.exit ]
  %seed.02.i = phi i32 [ %38, %35 ], [ 0, %makewt.exit ]
  %36 = mul nsw i32 %seed.02.i, 7141, !dbg !279
  %37 = add nsw i32 %36, 54773, !dbg !279
  %38 = srem i32 %37, 259200, !dbg !279
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !274), !dbg !279
  %39 = sitofp i32 %38 to double, !dbg !279
  %40 = fmul double %39, 0x3ED02E85C0898B71, !dbg !279
  %41 = getelementptr inbounds double* %32, i64 %indvars.iv.i3, !dbg !279
  store double %40, double* %41, align 8, !dbg !279, !tbaa !243
  %indvars.iv.next.i4 = add nsw i64 %indvars.iv.i3, 1, !dbg !277
  %exitcond34 = icmp eq i64 %indvars.iv.next.i4, 2048, !dbg !277
  br i1 %exitcond34, label %putdata.exit, label %35, !dbg !277

putdata.exit:                                     ; preds = %35
  %42 = bitcast i8* %33 to double*, !dbg !265
  %43 = bitcast i8* %34 to double*, !dbg !266
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !281) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !285) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !286) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !287) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !288) #6, !dbg !283
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %32) #6, !dbg !289
  tail call fastcc void @cftfsub(i32 2048, double* %32, double* %7) #6, !dbg !294
  tail call void @cdft(i32 2048, i32 -1, double* %32, i32* %30, double* %7), !dbg !295
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !296) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !299) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata !300, i64 0, metadata !301) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !302) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !303) #6, !dbg !304
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !305) #6, !dbg !306
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !307) #6, !dbg !308
  br label %44, !dbg !308

; <label>:44                                      ; preds = %44, %putdata.exit
  %indvars.iv.i6 = phi i64 [ %indvars.iv.next.i7, %44 ], [ 0, %putdata.exit ]
  %err.04.i = phi double [ %err.0..i, %44 ], [ 0.000000e+00, %putdata.exit ]
  %seed.03.i = phi i32 [ %phitmp2.i, %44 ], [ 54773, %putdata.exit ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03.i}, i64 0, metadata !303) #6, !dbg !310
  %45 = sitofp i32 %seed.03.i to double, !dbg !310
  %46 = fmul double %45, 0x3ED02E85C0898B71, !dbg !310
  %47 = getelementptr inbounds double* %32, i64 %indvars.iv.i6, !dbg !310
  %48 = load double* %47, align 8, !dbg !310, !tbaa !243
  %49 = fmul double %48, 9.765625e-04, !dbg !310
  %50 = fsub double %46, %49, !dbg !310
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !312) #6, !dbg !310
  %51 = tail call double @fabs(double %50) #1, !dbg !313
  %52 = fcmp ogt double %err.04.i, %51, !dbg !313
  %err.0..i = select i1 %52, double %err.04.i, double %51, !dbg !313
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !305) #6, !dbg !313
  %indvars.iv.next.i7 = add nsw i64 %indvars.iv.i6, 1, !dbg !308
  %phitmp.i = mul i32 %seed.03.i, 7141, !dbg !308
  %phitmp1.i = add i32 %phitmp.i, 54773, !dbg !308
  %phitmp2.i = srem i32 %phitmp1.i, 259200, !dbg !308
  %exitcond33 = icmp eq i64 %indvars.iv.next.i7, 2048, !dbg !308
  br i1 %exitcond33, label %errorcheck.exit, label %44, !dbg !308

errorcheck.exit:                                  ; preds = %44
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !24), !dbg !297
  %53 = tail call double @fabs(double %err.0..i) #1, !dbg !314
  %54 = fcmp ogt double %53, 1.000000e-10, !dbg !314
  br i1 %54, label %55, label %57, !dbg !314

; <label>:55                                      ; preds = %errorcheck.exit
  %56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i64 0, i64 0), double %err.0..i) #6, !dbg !316
  tail call void @abort() #8, !dbg !318
  unreachable, !dbg !318

; <label>:57                                      ; preds = %errorcheck.exit
  tail call void @llvm.memset.p0i8.i64(i8* %31, i8 0, i64 16384, i32 8, i1 false), !dbg !319
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !320), !dbg !322
  tail call void @llvm.dbg.value(metadata !323, i64 0, metadata !324), !dbg !322
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !325), !dbg !322
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !326), !dbg !327
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !328), !dbg !329
  br label %58, !dbg !329

; <label>:58                                      ; preds = %58, %57
  %indvars.iv.i9 = phi i64 [ %indvars.iv.next.i11, %58 ], [ 0, %57 ]
  %seed.02.i10 = phi i32 [ %61, %58 ], [ 0, %57 ]
  %59 = mul nsw i32 %seed.02.i10, 7141, !dbg !330
  %60 = add nsw i32 %59, 54773, !dbg !330
  %61 = srem i32 %60, 259200, !dbg !330
  tail call void @llvm.dbg.value(metadata !{i32 %61}, i64 0, metadata !326), !dbg !330
  %62 = sitofp i32 %61 to double, !dbg !330
  %63 = fmul double %62, 0x3ED02E85C0898B71, !dbg !330
  %64 = getelementptr inbounds double* %32, i64 %indvars.iv.i9, !dbg !330
  store double %63, double* %64, align 8, !dbg !330, !tbaa !243
  %indvars.iv.next.i11 = add nsw i64 %indvars.iv.i9, 1, !dbg !329
  %exitcond32 = icmp eq i64 %indvars.iv.next.i11, 1024, !dbg !329
  br i1 %exitcond32, label %putdata.exit12, label %58, !dbg !329

putdata.exit12:                                   ; preds = %58
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !331) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !334) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !335) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !336) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !337) #6, !dbg !333
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %32) #6, !dbg !338
  tail call fastcc void @cftfsub(i32 2048, double* %32, double* %7) #6, !dbg !339
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !11), !dbg !340
  br label %65, !dbg !340

; <label>:65                                      ; preds = %65, %putdata.exit12
  %indvars.iv29 = phi i64 [ 0, %putdata.exit12 ], [ %indvars.iv.next30, %65 ]
  %66 = shl nsw i64 %indvars.iv29, 1, !dbg !342
  %67 = or i64 %66, 1, !dbg !342
  %68 = getelementptr inbounds double* %32, i64 %67, !dbg !342
  %69 = load double* %68, align 8, !dbg !342, !tbaa !243
  %70 = fsub double -0.000000e+00, %69, !dbg !342
  store double %70, double* %68, align 8, !dbg !342, !tbaa !243
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !340
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1024, !dbg !340
  br i1 %exitcond31, label %71, label %65, !dbg !340

; <label>:71                                      ; preds = %65
  tail call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 16384, i32 8, i1 false), !dbg !343
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !344), !dbg !346
  tail call void @llvm.dbg.value(metadata !323, i64 0, metadata !347), !dbg !346
  tail call void @llvm.dbg.value(metadata !{double* %43}, i64 0, metadata !348), !dbg !346
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !349), !dbg !350
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !351), !dbg !352
  br label %72, !dbg !352

; <label>:72                                      ; preds = %72, %71
  %indvars.iv.i14 = phi i64 [ %indvars.iv.next.i16, %72 ], [ 0, %71 ]
  %seed.02.i15 = phi i32 [ %75, %72 ], [ 0, %71 ]
  %73 = mul nsw i32 %seed.02.i15, 7141, !dbg !353
  %74 = add nsw i32 %73, 54773, !dbg !353
  %75 = srem i32 %74, 259200, !dbg !353
  tail call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !349), !dbg !353
  %76 = sitofp i32 %75 to double, !dbg !353
  %77 = fmul double %76, 0x3ED02E85C0898B71, !dbg !353
  %78 = getelementptr inbounds double* %43, i64 %indvars.iv.i14, !dbg !353
  store double %77, double* %78, align 8, !dbg !353, !tbaa !243
  %indvars.iv.next.i16 = add nsw i64 %indvars.iv.i14, 1, !dbg !352
  %exitcond28 = icmp eq i64 %indvars.iv.next.i16, 1024, !dbg !352
  br i1 %exitcond28, label %putdata.exit17, label %72, !dbg !352

putdata.exit17:                                   ; preds = %72
  %79 = bitcast %struct.timeval* %tv.i18 to i8*, !dbg !354
  call void @llvm.lifetime.start(i64 16, i8* %79) #6, !dbg !354
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i18}, metadata !59) #6, !dbg !354
  %80 = call i32 @gettimeofday(%struct.timeval* %tv.i18, %struct.timezone* null) #6, !dbg !356
  call void @llvm.lifetime.end(i64 16, i8* %79) #6, !dbg !357
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !10), !dbg !358
  br label %81, !dbg !358

; <label>:81                                      ; preds = %99, %putdata.exit17
  %i.022 = phi i32 [ 0, %putdata.exit17 ], [ %100, %99 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %34, i64 16384, i32 8, i1 false), !dbg !359
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !360) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !363) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata !{double* %42}, i64 0, metadata !364) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !365) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !366) #6, !dbg !362
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %42) #6, !dbg !367
  tail call fastcc void @cftfsub(i32 2048, double* %42, double* %7) #6, !dbg !368
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !25), !dbg !369
  br label %82, !dbg !369

; <label>:82                                      ; preds = %82, %81
  %indvars.iv24 = phi i64 [ 0, %81 ], [ %indvars.iv.next25, %82 ]
  %83 = shl nsw i64 %indvars.iv24, 1, !dbg !370
  %84 = getelementptr inbounds double* %42, i64 %83, !dbg !370
  %85 = load double* %84, align 8, !dbg !370, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %85}, i64 0, metadata !28), !dbg !370
  %86 = getelementptr inbounds double* %32, i64 %83, !dbg !371
  %87 = load double* %86, align 8, !dbg !371, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !31), !dbg !371
  %88 = or i64 %83, 1, !dbg !372
  %89 = getelementptr inbounds double* %42, i64 %88, !dbg !372
  %90 = load double* %89, align 8, !dbg !372, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %90}, i64 0, metadata !32), !dbg !372
  %91 = getelementptr inbounds double* %32, i64 %88, !dbg !373
  %92 = load double* %91, align 8, !dbg !373, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %92}, i64 0, metadata !33), !dbg !373
  %93 = fmul double %85, %87, !dbg !374
  %94 = fmul double %90, %92, !dbg !374
  %95 = fsub double %93, %94, !dbg !374
  store double %95, double* %84, align 8, !dbg !374, !tbaa !243
  %96 = fmul double %85, %92, !dbg !375
  %97 = fmul double %87, %90, !dbg !375
  %98 = fadd double %97, %96, !dbg !375
  store double %98, double* %89, align 8, !dbg !375, !tbaa !243
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !369
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1024, !dbg !369
  br i1 %exitcond26, label %99, label %82, !dbg !369

; <label>:99                                      ; preds = %82
  tail call void @cdft(i32 2048, i32 -1, double* %42, i32* %30, double* %7), !dbg !376
  %100 = add nsw i32 %i.022, 1, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !10), !dbg !358
  %exitcond27 = icmp eq i32 %100, 150000, !dbg !358
  br i1 %exitcond27, label %101, label %81, !dbg !358

; <label>:101                                     ; preds = %99
  %102 = bitcast %struct.timeval* %tv.i19 to i8*, !dbg !377
  call void @llvm.lifetime.start(i64 16, i8* %102) #6, !dbg !377
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i19}, metadata !59) #6, !dbg !377
  %103 = call i32 @gettimeofday(%struct.timeval* %tv.i19, %struct.timezone* null) #6, !dbg !379
  call void @llvm.lifetime.end(i64 16, i8* %102) #6, !dbg !380
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !11), !dbg !381
  br label %104, !dbg !381

; <label>:104                                     ; preds = %104, %101
  %indvars.iv = phi i64 [ 0, %101 ], [ %indvars.iv.next, %104 ]
  %105 = shl nsw i64 %indvars.iv, 1, !dbg !383
  %106 = getelementptr inbounds double* %42, i64 %105, !dbg !383
  %107 = load double* %106, align 8, !dbg !383, !tbaa !243
  %108 = tail call double @fabs(double %107) #1, !dbg !383
  %109 = fcmp ogt double %108, 1.000000e-09, !dbg !383
  %110 = select i1 %109, double %107, double 0.000000e+00, !dbg !383
  %111 = or i64 %105, 1, !dbg !385
  %112 = getelementptr inbounds double* %42, i64 %111, !dbg !385
  %113 = load double* %112, align 8, !dbg !385, !tbaa !243
  %114 = tail call double @fabs(double %113) #1, !dbg !385
  %115 = fcmp ogt double %114, 1.000000e-09, !dbg !385
  %116 = select i1 %115, double %113, double 0.000000e+00, !dbg !385
  %117 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), double %110, double %116) #6, !dbg !386
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !381
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !381
  br i1 %exitcond, label %118, label %104, !dbg !381

; <label>:118                                     ; preds = %104
  tail call void @free(i8* %31) #6, !dbg !387
  tail call void @free(i8* %6) #6, !dbg !388
  tail call void @free(i8* %5) #6, !dbg !389
  tail call void @free(i8* %33) #6, !dbg !390
  tail call void @free(i8* %34) #6, !dbg !391
  ret i32 0, !dbg !392
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !59), !dbg !393
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6, !dbg !394
  %2 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0, !dbg !395
  %3 = load i64* %2, align 8, !dbg !395, !tbaa !396
  %4 = sitofp i64 %3 to double, !dbg !395
  %5 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1, !dbg !395
  %6 = load i64* %5, align 8, !dbg !395, !tbaa !399
  %7 = sitofp i64 %6 to double, !dbg !395
  %8 = fmul double %7, 1.000000e-06, !dbg !395
  %9 = fadd double %4, %8, !dbg !395
  ret double %9, !dbg !395
}

; Function Attrs: nounwind
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @makewt(i32 %nw, i32* nocapture %ip, double* %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nw}, i64 0, metadata !82), !dbg !400
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !83), !dbg !400
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !84), !dbg !400
  %1 = icmp sgt i32 %nw, 2, !dbg !401
  br i1 %1, label %2, label %31, !dbg !401

; <label>:2                                       ; preds = %0
  %3 = ashr i32 %nw, 1, !dbg !402
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !86), !dbg !402
  %4 = sitofp i32 %3 to double, !dbg !403
  %5 = fdiv double 0x3FE921FB54442D18, %4, !dbg !403
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !87), !dbg !403
  store double 1.000000e+00, double* %w, align 8, !dbg !404, !tbaa !243
  %6 = getelementptr inbounds double* %w, i64 1, !dbg !405
  store double 0.000000e+00, double* %6, align 8, !dbg !405, !tbaa !243
  %7 = fmul double %4, %5, !dbg !406
  %8 = tail call double @cos(double %7) #6, !dbg !406
  %9 = sext i32 %3 to i64, !dbg !406
  %10 = getelementptr inbounds double* %w, i64 %9, !dbg !406
  store double %8, double* %10, align 8, !dbg !406, !tbaa !243
  %11 = add nsw i32 %3, 1, !dbg !407
  %12 = sext i32 %11 to i64, !dbg !407
  %13 = getelementptr inbounds double* %w, i64 %12, !dbg !407
  store double %8, double* %13, align 8, !dbg !407, !tbaa !243
  %14 = icmp sgt i32 %3, 2, !dbg !408
  br i1 %14, label %.lr.ph, label %31, !dbg !408

.lr.ph:                                           ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 2, %2 ]
  %15 = trunc i64 %indvars.iv to i32, !dbg !409
  %16 = sitofp i32 %15 to double, !dbg !409
  %17 = fmul double %5, %16, !dbg !409
  %18 = tail call double @cos(double %17) #6, !dbg !409
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !88), !dbg !409
  %19 = tail call double @sin(double %17) #6, !dbg !410
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !89), !dbg !410
  %20 = getelementptr inbounds double* %w, i64 %indvars.iv, !dbg !411
  store double %18, double* %20, align 8, !dbg !411, !tbaa !243
  %21 = or i64 %indvars.iv, 1, !dbg !412
  %22 = getelementptr inbounds double* %w, i64 %21, !dbg !412
  store double %19, double* %22, align 8, !dbg !412, !tbaa !243
  %23 = sub nsw i32 %nw, %15, !dbg !413
  %24 = sext i32 %23 to i64, !dbg !413
  %25 = getelementptr inbounds double* %w, i64 %24, !dbg !413
  store double %19, double* %25, align 8, !dbg !413, !tbaa !243
  %26 = add nsw i32 %23, 1, !dbg !414
  %27 = sext i32 %26 to i64, !dbg !414
  %28 = getelementptr inbounds double* %w, i64 %27, !dbg !414
  store double %18, double* %28, align 8, !dbg !414, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !415
  %29 = trunc i64 %indvars.iv.next to i32, !dbg !415
  %30 = icmp slt i32 %29, %3, !dbg !415
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !415

._crit_edge:                                      ; preds = %.lr.ph
  tail call fastcc void @bitrv2(i32 %nw, i32* %ip, double* %w), !dbg !416
  br label %31, !dbg !417

; <label>:31                                      ; preds = %2, %._crit_edge, %0
  ret void, !dbg !418
}

; Function Attrs: nounwind uwtable
define void @putdata(i32 %nini, i32 %nend, double* nocapture %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !38), !dbg !419
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !39), !dbg !419
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !40), !dbg !419
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !42), !dbg !420
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !41), !dbg !421
  %1 = icmp sgt i32 %nini, %nend, !dbg !421
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !421

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !421

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %seed.02 = phi i32 [ %6, %3 ], [ 0, %.lr.ph ]
  %4 = mul nsw i32 %seed.02, 7141, !dbg !422
  %5 = add nsw i32 %4, 54773, !dbg !422
  %6 = srem i32 %5, 259200, !dbg !422
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !42), !dbg !422
  %7 = sitofp i32 %6 to double, !dbg !422
  %8 = fmul double %7, 0x3ED02E85C0898B71, !dbg !422
  %9 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !422
  store double %8, double* %9, align 8, !dbg !422, !tbaa !243
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !421
  %10 = trunc i64 %indvars.iv to i32, !dbg !421
  %11 = icmp slt i32 %10, %nend, !dbg !421
  br i1 %11, label %3, label %._crit_edge, !dbg !421

._crit_edge:                                      ; preds = %3, %0
  ret void, !dbg !423
}

; Function Attrs: nounwind uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* nocapture %ip, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !73), !dbg !424
  tail call void @llvm.dbg.value(metadata !{i32 %isgn}, i64 0, metadata !74), !dbg !424
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !75), !dbg !424
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !76), !dbg !424
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !77), !dbg !424
  %1 = icmp sgt i32 %n, 4, !dbg !425
  br i1 %1, label %2, label %301, !dbg !425

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %isgn, -1, !dbg !426
  br i1 %3, label %4, label %5, !dbg !426

; <label>:4                                       ; preds = %2
  tail call fastcc void @bitrv2(i32 %n, i32* %ip, double* %a), !dbg !427
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w), !dbg !428
  br label %cftbsub.exit, !dbg !429

; <label>:5                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !430), !dbg !433
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !434), !dbg !433
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !435), !dbg !433
  store i32 0, i32* %ip, align 4, !dbg !436, !tbaa !437
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !439), !dbg !440
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !441), !dbg !442
  %6 = icmp sgt i32 %n, 8, !dbg !443
  br i1 %6, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !443

.lr.ph18.i:                                       ; preds = %5, %._crit_edge13.i
  %m.015.i = phi i32 [ %34, %._crit_edge13.i ], [ 1, %5 ]
  %l.014.i = phi i32 [ %7, %._crit_edge13.i ], [ %n, %5 ]
  %7 = ashr i32 %l.014.i, 1, !dbg !444
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !439), !dbg !444
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !446), !dbg !447
  %8 = icmp sgt i32 %m.015.i, 0, !dbg !447
  br i1 %8, label %.lr.ph12.i, label %._crit_edge13.i, !dbg !447

.lr.ph12.i:                                       ; preds = %.lr.ph18.i
  %9 = sext i32 %m.015.i to i64, !dbg !447
  %10 = add i32 %m.015.i, -1, !dbg !447
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, 1, !dbg !447
  %end.idx = add i64 %11, 1, !dbg !447
  %n.vec = and i64 %12, 8589934584, !dbg !447
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !447
  %13 = sext i32 %m.015.i to i64
  %14 = add i32 %m.015.i, -1
  %15 = zext i32 %14 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph12.i
  %16 = add i64 %13, %15
  %scevgep33 = getelementptr i32* %ip, i64 %15
  %scevgep30 = getelementptr i32* %ip, i64 %16
  %scevgep = getelementptr i32* %ip, i64 %13
  %bound1 = icmp uge i32* %scevgep30, %ip
  %bound0 = icmp ule i32* %scevgep, %scevgep33
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert37 = insertelement <4 x i32> undef, i32 %7, i32 0
  %broadcast.splat38 = shufflevector <4 x i32> %broadcast.splatinsert37, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !447
  %17 = getelementptr inbounds i32* %ip, i64 %index, !dbg !449
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !449
  %wide.load = load <4 x i32>* %18, align 4, !dbg !449
  %.sum43 = or i64 %index, 4, !dbg !449
  %19 = getelementptr i32* %ip, i64 %.sum43, !dbg !449
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !449
  %wide.load36 = load <4 x i32>* %20, align 4, !dbg !449
  %21 = add nsw <4 x i32> %wide.load, %broadcast.splat38, !dbg !449
  %22 = add nsw <4 x i32> %wide.load36, %broadcast.splat38, !dbg !449
  %23 = add i64 %index, %9, !dbg !449
  %24 = getelementptr inbounds i32* %ip, i64 %23, !dbg !449
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !449
  store <4 x i32> %21, <4 x i32>* %25, align 4, !dbg !449
  %.sum = add i64 %23, 4, !dbg !449
  %26 = getelementptr i32* %ip, i64 %.sum, !dbg !449
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !449
  store <4 x i32> %22, <4 x i32>* %27, align 4, !dbg !449
  %index.next = add i64 %index, 8, !dbg !447
  %28 = icmp eq i64 %index.next, %n.vec, !dbg !447
  br i1 %28, label %middle.block, label %vector.body, !dbg !447, !llvm.loop !451

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph12.i
  %resume.val = phi i64 [ 0, %.lr.ph12.i ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge13.i, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv41.i = phi i64 [ %indvars.iv.next42.i, %scalar.ph ], [ %resume.val, %middle.block ]
  %29 = getelementptr inbounds i32* %ip, i64 %indvars.iv41.i, !dbg !449
  %30 = load i32* %29, align 4, !dbg !449, !tbaa !437
  %31 = add nsw i32 %30, %7, !dbg !449
  %32 = add nsw i64 %indvars.iv41.i, %9, !dbg !449
  %33 = getelementptr inbounds i32* %ip, i64 %32, !dbg !449
  store i32 %31, i32* %33, align 4, !dbg !449, !tbaa !437
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !447
  %lftr.wideiv22 = trunc i64 %indvars.iv.next42.i to i32, !dbg !447
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %m.015.i, !dbg !447
  br i1 %exitcond23, label %._crit_edge13.i, label %scalar.ph, !dbg !447, !llvm.loop !454

._crit_edge13.i:                                  ; preds = %scalar.ph, %middle.block, %.lr.ph18.i
  %34 = shl i32 %m.015.i, 1, !dbg !455
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !441), !dbg !455
  %35 = shl i32 %m.015.i, 4, !dbg !443
  %36 = icmp slt i32 %35, %7, !dbg !443
  br i1 %36, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !443

._crit_edge19.i:                                  ; preds = %._crit_edge13.i, %5
  %.lcssa.i = phi i32 [ 8, %5 ], [ %35, %._crit_edge13.i ]
  %m.0.lcssa.i = phi i32 [ 1, %5 ], [ %34, %._crit_edge13.i ]
  %l.0.lcssa.i = phi i32 [ %n, %5 ], [ %7, %._crit_edge13.i ]
  %37 = shl nsw i32 %m.0.lcssa.i, 1, !dbg !456
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !457), !dbg !456
  %38 = icmp eq i32 %.lcssa.i, %l.0.lcssa.i, !dbg !458
  br i1 %38, label %.preheader1.i, label %152, !dbg !458

.preheader1.i:                                    ; preds = %._crit_edge19.i
  %39 = icmp sgt i32 %m.0.lcssa.i, 0, !dbg !460
  br i1 %39, label %.preheader.lr.ph.i, label %bitrv2conj.exit, !dbg !460

.preheader.lr.ph.i:                               ; preds = %.preheader1.i
  %40 = or i32 %37, 1, !dbg !463
  %41 = shl i32 %m.0.lcssa.i, 2, !dbg !465
  br label %.preheader.i, !dbg !460

.preheader.i:                                     ; preds = %._crit_edge.i, %.preheader.lr.ph.i
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %42 = trunc i64 %indvars.iv27.i to i32, !dbg !468
  %43 = icmp sgt i32 %42, 0, !dbg !468
  %44 = getelementptr inbounds i32* %ip, i64 %indvars.iv27.i, !dbg !469
  %45 = load i32* %44, align 4, !dbg !469, !tbaa !437
  %46 = shl nsw i32 %42, 1, !dbg !470
  br i1 %43, label %.lr.ph.i, label %._crit_edge.i, !dbg !468

.lr.ph.i:                                         ; preds = %.preheader.i, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.preheader.i ]
  %47 = trunc i64 %indvars.iv.i to i32, !dbg !469
  %48 = shl nsw i32 %47, 1, !dbg !469
  %49 = add nsw i32 %48, %45, !dbg !469
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !471), !dbg !469
  %50 = getelementptr inbounds i32* %ip, i64 %indvars.iv.i, !dbg !470
  %51 = load i32* %50, align 4, !dbg !470, !tbaa !437
  %52 = add nsw i32 %51, %46, !dbg !470
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !472), !dbg !470
  %53 = sext i32 %49 to i64, !dbg !473
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !473
  %55 = load double* %54, align 8, !dbg !473, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !474), !dbg !473
  %56 = add nsw i32 %49, 1, !dbg !475
  %57 = sext i32 %56 to i64, !dbg !475
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !475
  %59 = load double* %58, align 8, !dbg !475, !tbaa !243
  %60 = fsub double -0.000000e+00, %59, !dbg !475
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !476), !dbg !475
  %61 = sext i32 %52 to i64, !dbg !477
  %62 = getelementptr inbounds double* %a, i64 %61, !dbg !477
  %63 = load double* %62, align 8, !dbg !477, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !478), !dbg !477
  %64 = add nsw i32 %52, 1, !dbg !479
  %65 = sext i32 %64 to i64, !dbg !479
  %66 = getelementptr inbounds double* %a, i64 %65, !dbg !479
  %67 = load double* %66, align 8, !dbg !479, !tbaa !243
  %68 = fsub double -0.000000e+00, %67, !dbg !479
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !480), !dbg !479
  store double %63, double* %54, align 8, !dbg !481, !tbaa !243
  store double %68, double* %58, align 8, !dbg !482, !tbaa !243
  store double %55, double* %62, align 8, !dbg !483, !tbaa !243
  store double %60, double* %66, align 8, !dbg !484, !tbaa !243
  %69 = add nsw i32 %49, %37, !dbg !485
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !471), !dbg !485
  %70 = add nsw i32 %52, %41, !dbg !465
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !472), !dbg !465
  %71 = sext i32 %69 to i64, !dbg !486
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !486
  %73 = load double* %72, align 8, !dbg !486, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !474), !dbg !486
  %74 = add nsw i32 %69, 1, !dbg !487
  %75 = sext i32 %74 to i64, !dbg !487
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !487
  %77 = load double* %76, align 8, !dbg !487, !tbaa !243
  %78 = fsub double -0.000000e+00, %77, !dbg !487
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !476), !dbg !487
  %79 = sext i32 %70 to i64, !dbg !488
  %80 = getelementptr inbounds double* %a, i64 %79, !dbg !488
  %81 = load double* %80, align 8, !dbg !488, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !478), !dbg !488
  %82 = add nsw i32 %70, 1, !dbg !489
  %83 = sext i32 %82 to i64, !dbg !489
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !489
  %85 = load double* %84, align 8, !dbg !489, !tbaa !243
  %86 = fsub double -0.000000e+00, %85, !dbg !489
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !480), !dbg !489
  store double %81, double* %72, align 8, !dbg !490, !tbaa !243
  store double %86, double* %76, align 8, !dbg !491, !tbaa !243
  store double %73, double* %80, align 8, !dbg !492, !tbaa !243
  store double %78, double* %84, align 8, !dbg !493, !tbaa !243
  %87 = add nsw i32 %69, %37, !dbg !494
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !471), !dbg !494
  %88 = sub nsw i32 %70, %37, !dbg !495
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !472), !dbg !495
  %89 = sext i32 %87 to i64, !dbg !496
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !496
  %91 = load double* %90, align 8, !dbg !496, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !474), !dbg !496
  %92 = add nsw i32 %87, 1, !dbg !497
  %93 = sext i32 %92 to i64, !dbg !497
  %94 = getelementptr inbounds double* %a, i64 %93, !dbg !497
  %95 = load double* %94, align 8, !dbg !497, !tbaa !243
  %96 = fsub double -0.000000e+00, %95, !dbg !497
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !476), !dbg !497
  %97 = sext i32 %88 to i64, !dbg !498
  %98 = getelementptr inbounds double* %a, i64 %97, !dbg !498
  %99 = load double* %98, align 8, !dbg !498, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !478), !dbg !498
  %100 = add nsw i32 %88, 1, !dbg !499
  %101 = sext i32 %100 to i64, !dbg !499
  %102 = getelementptr inbounds double* %a, i64 %101, !dbg !499
  %103 = load double* %102, align 8, !dbg !499, !tbaa !243
  %104 = fsub double -0.000000e+00, %103, !dbg !499
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !480), !dbg !499
  store double %99, double* %90, align 8, !dbg !500, !tbaa !243
  store double %104, double* %94, align 8, !dbg !501, !tbaa !243
  store double %91, double* %98, align 8, !dbg !502, !tbaa !243
  store double %96, double* %102, align 8, !dbg !503, !tbaa !243
  %105 = add nsw i32 %87, %37, !dbg !504
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !471), !dbg !504
  %106 = add nsw i32 %88, %41, !dbg !505
  tail call void @llvm.dbg.value(metadata !{i32 %106}, i64 0, metadata !472), !dbg !505
  %107 = sext i32 %105 to i64, !dbg !506
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !506
  %109 = load double* %108, align 8, !dbg !506, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !474), !dbg !506
  %110 = add nsw i32 %105, 1, !dbg !507
  %111 = sext i32 %110 to i64, !dbg !507
  %112 = getelementptr inbounds double* %a, i64 %111, !dbg !507
  %113 = load double* %112, align 8, !dbg !507, !tbaa !243
  %114 = fsub double -0.000000e+00, %113, !dbg !507
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !476), !dbg !507
  %115 = sext i32 %106 to i64, !dbg !508
  %116 = getelementptr inbounds double* %a, i64 %115, !dbg !508
  %117 = load double* %116, align 8, !dbg !508, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !478), !dbg !508
  %118 = add nsw i32 %106, 1, !dbg !509
  %119 = sext i32 %118 to i64, !dbg !509
  %120 = getelementptr inbounds double* %a, i64 %119, !dbg !509
  %121 = load double* %120, align 8, !dbg !509, !tbaa !243
  %122 = fsub double -0.000000e+00, %121, !dbg !509
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !480), !dbg !509
  store double %117, double* %108, align 8, !dbg !510, !tbaa !243
  store double %122, double* %112, align 8, !dbg !511, !tbaa !243
  store double %109, double* %116, align 8, !dbg !512, !tbaa !243
  store double %114, double* %120, align 8, !dbg !513, !tbaa !243
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !468
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !468
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !468
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i, !dbg !468

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.preheader.i
  %123 = add nsw i32 %45, %46, !dbg !514
  tail call void @llvm.dbg.value(metadata !{i32 %123}, i64 0, metadata !472), !dbg !514
  %124 = add nsw i32 %123, 1, !dbg !515
  %125 = sext i32 %124 to i64, !dbg !515
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !515
  %127 = load double* %126, align 8, !dbg !515, !tbaa !243
  %128 = fsub double -0.000000e+00, %127, !dbg !515
  store double %128, double* %126, align 8, !dbg !515, !tbaa !243
  %129 = add nsw i32 %123, %37, !dbg !516
  tail call void @llvm.dbg.value(metadata !{i32 %129}, i64 0, metadata !471), !dbg !516
  %130 = add nsw i32 %129, %37, !dbg !517
  tail call void @llvm.dbg.value(metadata !{i32 %130}, i64 0, metadata !472), !dbg !517
  %131 = sext i32 %129 to i64, !dbg !518
  %132 = getelementptr inbounds double* %a, i64 %131, !dbg !518
  %133 = load double* %132, align 8, !dbg !518, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %133}, i64 0, metadata !474), !dbg !518
  %134 = add nsw i32 %129, 1, !dbg !519
  %135 = sext i32 %134 to i64, !dbg !519
  %136 = getelementptr inbounds double* %a, i64 %135, !dbg !519
  %137 = load double* %136, align 8, !dbg !519, !tbaa !243
  %138 = fsub double -0.000000e+00, %137, !dbg !519
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !476), !dbg !519
  %139 = sext i32 %130 to i64, !dbg !520
  %140 = getelementptr inbounds double* %a, i64 %139, !dbg !520
  %141 = load double* %140, align 8, !dbg !520, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %141}, i64 0, metadata !478), !dbg !520
  %142 = add nsw i32 %130, 1, !dbg !521
  %143 = sext i32 %142 to i64, !dbg !521
  %144 = getelementptr inbounds double* %a, i64 %143, !dbg !521
  %145 = load double* %144, align 8, !dbg !521, !tbaa !243
  %146 = fsub double -0.000000e+00, %145, !dbg !521
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !480), !dbg !521
  store double %141, double* %132, align 8, !dbg !522, !tbaa !243
  store double %146, double* %136, align 8, !dbg !523, !tbaa !243
  store double %133, double* %140, align 8, !dbg !524, !tbaa !243
  store double %138, double* %144, align 8, !dbg !525, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !472), !dbg !463
  %147 = add i32 %130, %40, !dbg !526
  %148 = sext i32 %147 to i64, !dbg !526
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !526
  %150 = load double* %149, align 8, !dbg !526, !tbaa !243
  %151 = fsub double -0.000000e+00, %150, !dbg !526
  store double %151, double* %149, align 8, !dbg !526, !tbaa !243
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !460
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !460
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !527), !dbg !460
  %lftr.wideiv14 = trunc i64 %indvars.iv.next28.i to i32, !dbg !460
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %m.0.lcssa.i, !dbg !460
  br i1 %exitcond15, label %bitrv2conj.exit, label %.preheader.i, !dbg !460

; <label>:152                                     ; preds = %._crit_edge19.i
  %153 = getelementptr inbounds double* %a, i64 1, !dbg !528
  %154 = load double* %153, align 8, !dbg !528, !tbaa !243
  %155 = fsub double -0.000000e+00, %154, !dbg !528
  store double %155, double* %153, align 8, !dbg !528, !tbaa !243
  %156 = or i32 %37, 1, !dbg !530
  %157 = sext i32 %156 to i64, !dbg !530
  %158 = getelementptr inbounds double* %a, i64 %157, !dbg !530
  %159 = load double* %158, align 8, !dbg !530, !tbaa !243
  %160 = fsub double -0.000000e+00, %159, !dbg !530
  store double %160, double* %158, align 8, !dbg !530, !tbaa !243
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !527), !dbg !531
  %161 = icmp sgt i32 %m.0.lcssa.i, 1, !dbg !531
  br i1 %161, label %.lr.ph7.i, label %bitrv2conj.exit, !dbg !531

.lr.ph7.i:                                        ; preds = %152, %._crit_edge8.i
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %._crit_edge8.i ], [ 1, %152 ]
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %._crit_edge8.i ], [ 1, %152 ]
  %162 = getelementptr inbounds i32* %ip, i64 %indvars.iv37.i, !dbg !533
  %163 = load i32* %162, align 4, !dbg !533, !tbaa !437
  %164 = trunc i64 %indvars.iv37.i to i32, !dbg !537
  %165 = shl nsw i32 %164, 1, !dbg !537
  br label %166, !dbg !538

; <label>:166                                     ; preds = %166, %.lr.ph7.i
  %indvars.iv31.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next32.i, %166 ]
  %167 = trunc i64 %indvars.iv31.i to i32, !dbg !533
  %168 = shl nsw i32 %167, 1, !dbg !533
  %169 = add nsw i32 %168, %163, !dbg !533
  tail call void @llvm.dbg.value(metadata !{i32 %169}, i64 0, metadata !471), !dbg !533
  %170 = getelementptr inbounds i32* %ip, i64 %indvars.iv31.i, !dbg !537
  %171 = load i32* %170, align 4, !dbg !537, !tbaa !437
  %172 = add nsw i32 %171, %165, !dbg !537
  tail call void @llvm.dbg.value(metadata !{i32 %172}, i64 0, metadata !472), !dbg !537
  %173 = sext i32 %169 to i64, !dbg !539
  %174 = getelementptr inbounds double* %a, i64 %173, !dbg !539
  %175 = load double* %174, align 8, !dbg !539, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !474), !dbg !539
  %176 = add nsw i32 %169, 1, !dbg !540
  %177 = sext i32 %176 to i64, !dbg !540
  %178 = getelementptr inbounds double* %a, i64 %177, !dbg !540
  %179 = load double* %178, align 8, !dbg !540, !tbaa !243
  %180 = fsub double -0.000000e+00, %179, !dbg !540
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !476), !dbg !540
  %181 = sext i32 %172 to i64, !dbg !541
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !541
  %183 = load double* %182, align 8, !dbg !541, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !478), !dbg !541
  %184 = add nsw i32 %172, 1, !dbg !542
  %185 = sext i32 %184 to i64, !dbg !542
  %186 = getelementptr inbounds double* %a, i64 %185, !dbg !542
  %187 = load double* %186, align 8, !dbg !542, !tbaa !243
  %188 = fsub double -0.000000e+00, %187, !dbg !542
  tail call void @llvm.dbg.value(metadata !{double %188}, i64 0, metadata !480), !dbg !542
  store double %183, double* %174, align 8, !dbg !543, !tbaa !243
  store double %188, double* %178, align 8, !dbg !544, !tbaa !243
  store double %175, double* %182, align 8, !dbg !545, !tbaa !243
  store double %180, double* %186, align 8, !dbg !546, !tbaa !243
  %189 = add nsw i32 %169, %37, !dbg !547
  tail call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !471), !dbg !547
  %190 = add nsw i32 %172, %37, !dbg !548
  tail call void @llvm.dbg.value(metadata !{i32 %190}, i64 0, metadata !472), !dbg !548
  %191 = sext i32 %189 to i64, !dbg !549
  %192 = getelementptr inbounds double* %a, i64 %191, !dbg !549
  %193 = load double* %192, align 8, !dbg !549, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %193}, i64 0, metadata !474), !dbg !549
  %194 = add nsw i32 %189, 1, !dbg !550
  %195 = sext i32 %194 to i64, !dbg !550
  %196 = getelementptr inbounds double* %a, i64 %195, !dbg !550
  %197 = load double* %196, align 8, !dbg !550, !tbaa !243
  %198 = fsub double -0.000000e+00, %197, !dbg !550
  tail call void @llvm.dbg.value(metadata !{double %198}, i64 0, metadata !476), !dbg !550
  %199 = sext i32 %190 to i64, !dbg !551
  %200 = getelementptr inbounds double* %a, i64 %199, !dbg !551
  %201 = load double* %200, align 8, !dbg !551, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %201}, i64 0, metadata !478), !dbg !551
  %202 = add nsw i32 %190, 1, !dbg !552
  %203 = sext i32 %202 to i64, !dbg !552
  %204 = getelementptr inbounds double* %a, i64 %203, !dbg !552
  %205 = load double* %204, align 8, !dbg !552, !tbaa !243
  %206 = fsub double -0.000000e+00, %205, !dbg !552
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !480), !dbg !552
  store double %201, double* %192, align 8, !dbg !553, !tbaa !243
  store double %206, double* %196, align 8, !dbg !554, !tbaa !243
  store double %193, double* %200, align 8, !dbg !555, !tbaa !243
  store double %198, double* %204, align 8, !dbg !556, !tbaa !243
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !538
  %lftr.wideiv18 = trunc i64 %indvars.iv.next32.i to i32, !dbg !538
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %indvars.iv16, !dbg !538
  br i1 %exitcond19, label %._crit_edge8.i, label %166, !dbg !538

._crit_edge8.i:                                   ; preds = %166
  %207 = add nsw i32 %163, %165, !dbg !557
  tail call void @llvm.dbg.value(metadata !{i32 %207}, i64 0, metadata !472), !dbg !557
  %208 = add nsw i32 %207, 1, !dbg !558
  %209 = sext i32 %208 to i64, !dbg !558
  %210 = getelementptr inbounds double* %a, i64 %209, !dbg !558
  %211 = load double* %210, align 8, !dbg !558, !tbaa !243
  %212 = fsub double -0.000000e+00, %211, !dbg !558
  store double %212, double* %210, align 8, !dbg !558, !tbaa !243
  %213 = add i32 %207, %156, !dbg !559
  %214 = sext i32 %213 to i64, !dbg !559
  %215 = getelementptr inbounds double* %a, i64 %214, !dbg !559
  %216 = load double* %215, align 8, !dbg !559, !tbaa !243
  %217 = fsub double -0.000000e+00, %216, !dbg !559
  store double %217, double* %215, align 8, !dbg !559, !tbaa !243
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1, !dbg !531
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, 1, !dbg !531
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next17}, i64 0, metadata !527), !dbg !531
  %lftr.wideiv20 = trunc i64 %indvars.iv.next38.i to i32, !dbg !531
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %m.0.lcssa.i, !dbg !531
  br i1 %exitcond21, label %bitrv2conj.exit, label %.lr.ph7.i, !dbg !531

bitrv2conj.exit:                                  ; preds = %._crit_edge8.i, %._crit_edge.i, %.preheader1.i, %152
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !560) #6, !dbg !562
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !563) #6, !dbg !562
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !564) #6, !dbg !562
  tail call void @llvm.dbg.value(metadata !565, i64 0, metadata !566) #6, !dbg !567
  br i1 %6, label %218, label %.loopexit3.i, !dbg !568

; <label>:218                                     ; preds = %bitrv2conj.exit
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #6, !dbg !570
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !566) #6, !dbg !573
  %219 = icmp sgt i32 %n, 32, !dbg !574
  br i1 %219, label %.lr.ph8.i, label %.loopexit3.i, !dbg !574

.lr.ph8.i:                                        ; preds = %218, %.lr.ph8.i
  %220 = phi i32 [ %221, %.lr.ph8.i ], [ 32, %218 ]
  %l.07.i = phi i32 [ %220, %.lr.ph8.i ], [ 8, %218 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07.i, double* %a, double* %w) #6, !dbg !575
  tail call void @llvm.dbg.value(metadata !{i32 %220}, i64 0, metadata !566) #6, !dbg !577
  %221 = shl i32 %220, 2, !dbg !574
  %222 = icmp slt i32 %221, %n, !dbg !574
  br i1 %222, label %.lr.ph8.i, label %.loopexit3.i, !dbg !574

.loopexit3.i:                                     ; preds = %.lr.ph8.i, %218, %bitrv2conj.exit
  %l.1.i = phi i32 [ 2, %bitrv2conj.exit ], [ 8, %218 ], [ %220, %.lr.ph8.i ]
  %223 = shl i32 %l.1.i, 2, !dbg !578
  %224 = icmp eq i32 %223, %n, !dbg !578
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !580) #6, !dbg !581
  %225 = icmp sgt i32 %l.1.i, 0, !dbg !581
  br i1 %224, label %.preheader.i2, label %.preheader1.i1, !dbg !578

.preheader1.i1:                                   ; preds = %.loopexit3.i
  br i1 %225, label %.lr.ph6.i, label %cftbsub.exit, !dbg !584

.lr.ph6.i:                                        ; preds = %.preheader1.i1
  %226 = sext i32 %l.1.i to i64, !dbg !584
  br label %277, !dbg !584

.preheader.i2:                                    ; preds = %.loopexit3.i
  br i1 %225, label %.lr.ph.i3, label %cftbsub.exit, !dbg !581

.lr.ph.i3:                                        ; preds = %.preheader.i2
  %227 = sext i32 %l.1.i to i64, !dbg !581
  br label %228, !dbg !581

; <label>:228                                     ; preds = %228, %.lr.ph.i3
  %indvars.iv.i4 = phi i64 [ 0, %.lr.ph.i3 ], [ %indvars.iv.next.i5, %228 ]
  %229 = add nsw i64 %indvars.iv.i4, %227, !dbg !587
  %230 = add nsw i64 %229, %227, !dbg !589
  %231 = add nsw i64 %230, %227, !dbg !590
  %232 = getelementptr inbounds double* %a, i64 %indvars.iv.i4, !dbg !591
  %233 = load double* %232, align 8, !dbg !591, !tbaa !243
  %234 = getelementptr inbounds double* %a, i64 %229, !dbg !591
  %235 = load double* %234, align 8, !dbg !591, !tbaa !243
  %236 = fadd double %233, %235, !dbg !591
  tail call void @llvm.dbg.value(metadata !{double %236}, i64 0, metadata !592) #6, !dbg !591
  %237 = or i64 %indvars.iv.i4, 1, !dbg !593
  %238 = getelementptr inbounds double* %a, i64 %237, !dbg !593
  %239 = load double* %238, align 8, !dbg !593, !tbaa !243
  %240 = fsub double -0.000000e+00, %239, !dbg !593
  %241 = add nsw i64 %229, 1, !dbg !593
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !593
  %243 = load double* %242, align 8, !dbg !593, !tbaa !243
  %244 = fsub double %240, %243, !dbg !593
  tail call void @llvm.dbg.value(metadata !{double %244}, i64 0, metadata !594) #6, !dbg !593
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !596) #6, !dbg !597
  %245 = insertelement <2 x double> undef, double %233, i32 0, !dbg !597
  %246 = insertelement <2 x double> %245, double %243, i32 1, !dbg !597
  %247 = insertelement <2 x double> undef, double %235, i32 0, !dbg !597
  %248 = insertelement <2 x double> %247, double %239, i32 1, !dbg !597
  %249 = fsub <2 x double> %246, %248, !dbg !597
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !598) #6, !dbg !599
  %250 = getelementptr inbounds double* %a, i64 %230, !dbg !600
  %251 = load double* %250, align 8, !dbg !600, !tbaa !243
  %252 = getelementptr inbounds double* %a, i64 %231, !dbg !600
  %253 = load double* %252, align 8, !dbg !600, !tbaa !243
  %254 = fadd double %251, %253, !dbg !600
  tail call void @llvm.dbg.value(metadata !{double %254}, i64 0, metadata !601) #6, !dbg !600
  %255 = add nsw i64 %230, 1, !dbg !602
  %256 = getelementptr inbounds double* %a, i64 %255, !dbg !602
  %257 = load double* %256, align 8, !dbg !602, !tbaa !243
  %258 = add nsw i64 %231, 1, !dbg !602
  %259 = getelementptr inbounds double* %a, i64 %258, !dbg !602
  %260 = load double* %259, align 8, !dbg !602, !tbaa !243
  %261 = fadd double %257, %260, !dbg !602
  tail call void @llvm.dbg.value(metadata !{double %261}, i64 0, metadata !603) #6, !dbg !602
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !604) #6, !dbg !605
  %262 = insertelement <2 x double> undef, double %257, i32 0, !dbg !606
  %263 = insertelement <2 x double> %262, double %251, i32 1, !dbg !606
  %264 = insertelement <2 x double> undef, double %260, i32 0, !dbg !606
  %265 = insertelement <2 x double> %264, double %253, i32 1, !dbg !606
  %266 = fsub <2 x double> %263, %265, !dbg !606
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !607) #6, !dbg !606
  %267 = fadd double %236, %254, !dbg !608
  store double %267, double* %232, align 8, !dbg !608, !tbaa !243
  %268 = fsub double %244, %261, !dbg !609
  store double %268, double* %238, align 8, !dbg !609, !tbaa !243
  %269 = fsub double %236, %254, !dbg !610
  store double %269, double* %250, align 8, !dbg !610, !tbaa !243
  %270 = fadd double %244, %261, !dbg !611
  store double %270, double* %256, align 8, !dbg !611, !tbaa !243
  %271 = fsub <2 x double> %249, %266, !dbg !612
  %272 = bitcast double* %234 to <2 x double>*, !dbg !612
  store <2 x double> %271, <2 x double>* %272, align 8, !dbg !612, !tbaa !243
  %273 = fadd <2 x double> %249, %266, !dbg !613
  %274 = bitcast double* %252 to <2 x double>*, !dbg !613
  store <2 x double> %273, <2 x double>* %274, align 8, !dbg !613, !tbaa !243
  %indvars.iv.next.i5 = add nuw nsw i64 %indvars.iv.i4, 2, !dbg !581
  %275 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !581
  %276 = icmp slt i32 %275, %l.1.i, !dbg !581
  br i1 %276, label %228, label %cftbsub.exit, !dbg !581

; <label>:277                                     ; preds = %277, %.lr.ph6.i
  %indvars.iv9.i = phi i64 [ 0, %.lr.ph6.i ], [ %indvars.iv.next10.i, %277 ]
  %278 = add nsw i64 %indvars.iv9.i, %226, !dbg !614
  %279 = getelementptr inbounds double* %a, i64 %indvars.iv9.i, !dbg !616
  %280 = load double* %279, align 8, !dbg !616, !tbaa !243
  %281 = getelementptr inbounds double* %a, i64 %278, !dbg !616
  %282 = load double* %281, align 8, !dbg !616, !tbaa !243
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !592) #6, !dbg !616
  %283 = or i64 %indvars.iv9.i, 1, !dbg !617
  %284 = getelementptr inbounds double* %a, i64 %283, !dbg !617
  %285 = load double* %284, align 8, !dbg !617, !tbaa !243
  %286 = add nsw i64 %278, 1, !dbg !617
  %287 = getelementptr inbounds double* %a, i64 %286, !dbg !617
  %288 = load double* %287, align 8, !dbg !617, !tbaa !243
  %289 = insertelement <2 x double> undef, double %280, i32 0, !dbg !616
  %290 = insertelement <2 x double> %289, double %288, i32 1, !dbg !616
  %291 = insertelement <2 x double> undef, double %282, i32 0, !dbg !616
  %292 = insertelement <2 x double> %291, double %285, i32 1, !dbg !616
  %293 = fsub <2 x double> %290, %292, !dbg !616
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !594) #6, !dbg !617
  %294 = fadd double %280, %282, !dbg !618
  store double %294, double* %279, align 8, !dbg !618, !tbaa !243
  %295 = fsub double -0.000000e+00, %285, !dbg !619
  %296 = load double* %287, align 8, !dbg !619, !tbaa !243
  %297 = fsub double %295, %296, !dbg !619
  store double %297, double* %284, align 8, !dbg !619, !tbaa !243
  %298 = bitcast double* %281 to <2 x double>*, !dbg !620
  store <2 x double> %293, <2 x double>* %298, align 8, !dbg !620, !tbaa !243
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 2, !dbg !584
  %299 = trunc i64 %indvars.iv.next10.i to i32, !dbg !584
  %300 = icmp slt i32 %299, %l.1.i, !dbg !584
  br i1 %300, label %277, label %cftbsub.exit, !dbg !584

; <label>:301                                     ; preds = %0
  %302 = icmp eq i32 %n, 4, !dbg !621
  br i1 %302, label %303, label %cftbsub.exit, !dbg !621

; <label>:303                                     ; preds = %301
  tail call fastcc void @cftfsub(i32 4, double* %a, double* %w), !dbg !623
  br label %cftbsub.exit, !dbg !625

cftbsub.exit:                                     ; preds = %277, %228, %.preheader.i2, %.preheader1.i1, %301, %303, %4
  ret void, !dbg !626
}

; Function Attrs: nounwind readonly uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* nocapture readonly %a) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !47), !dbg !627
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !48), !dbg !627
  tail call void @llvm.dbg.value(metadata !{double %scale}, i64 0, metadata !49), !dbg !627
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !50), !dbg !627
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !52), !dbg !628
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !53), !dbg !629
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !51), !dbg !630
  %1 = icmp sgt i32 %nini, %nend, !dbg !630
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !630

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !630

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %err.04 = phi double [ %err.0., %3 ], [ 0.000000e+00, %.lr.ph ]
  %seed.03 = phi i32 [ %phitmp2, %3 ], [ 54773, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03}, i64 0, metadata !52), !dbg !631
  %4 = sitofp i32 %seed.03 to double, !dbg !631
  %5 = fmul double %4, 0x3ED02E85C0898B71, !dbg !631
  %6 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !631
  %7 = load double* %6, align 8, !dbg !631, !tbaa !243
  %8 = fmul double %7, %scale, !dbg !631
  %9 = fsub double %5, %8, !dbg !631
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !54), !dbg !631
  %10 = tail call double @fabs(double %9) #1, !dbg !632
  %11 = fcmp ogt double %err.04, %10, !dbg !632
  %err.0. = select i1 %11, double %err.04, double %10, !dbg !632
  tail call void @llvm.dbg.value(metadata !{double %err.0.}, i64 0, metadata !53), !dbg !632
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !630
  %phitmp = mul i32 %seed.03, 7141, !dbg !630
  %phitmp1 = add i32 %phitmp, 54773, !dbg !630
  %phitmp2 = srem i32 %phitmp1, 259200, !dbg !630
  %12 = trunc i64 %indvars.iv to i32, !dbg !630
  %13 = icmp slt i32 %12, %nend, !dbg !630
  br i1 %13, label %3, label %._crit_edge, !dbg !630

._crit_edge:                                      ; preds = %3, %0
  %err.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %err.0., %3 ]
  ret double %err.0.lcssa, !dbg !633
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
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !199), !dbg !634
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !200), !dbg !634
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !201), !dbg !634
  store i32 0, i32* %ip, align 4, !dbg !635, !tbaa !437
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !206), !dbg !636
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !207), !dbg !637
  %1 = icmp sgt i32 %n, 8, !dbg !638
  br i1 %1, label %.lr.ph19, label %._crit_edge20, !dbg !638

.lr.ph19:                                         ; preds = %0, %._crit_edge14
  %m.016 = phi i32 [ %29, %._crit_edge14 ], [ 1, %0 ]
  %l.015 = phi i32 [ %2, %._crit_edge14 ], [ %n, %0 ]
  %2 = ashr i32 %l.015, 1, !dbg !639
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !206), !dbg !639
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !202), !dbg !641
  %3 = icmp sgt i32 %m.016, 0, !dbg !641
  br i1 %3, label %.lr.ph13, label %._crit_edge14, !dbg !641

.lr.ph13:                                         ; preds = %.lr.ph19
  %4 = sext i32 %m.016 to i64, !dbg !641
  %5 = add i32 %m.016, -1, !dbg !641
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !641
  %end.idx = add i64 %6, 1, !dbg !641
  %n.vec = and i64 %7, 8589934584, !dbg !641
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !641
  %8 = sext i32 %m.016 to i64
  %9 = add i32 %m.016, -1
  %10 = zext i32 %9 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph13
  %11 = add i64 %8, %10
  %scevgep55 = getelementptr i32* %ip, i64 %10
  %scevgep52 = getelementptr i32* %ip, i64 %11
  %scevgep = getelementptr i32* %ip, i64 %8
  %bound1 = icmp uge i32* %scevgep52, %ip
  %bound0 = icmp ule i32* %scevgep, %scevgep55
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert59 = insertelement <4 x i32> undef, i32 %2, i32 0
  %broadcast.splat60 = shufflevector <4 x i32> %broadcast.splatinsert59, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !641
  %12 = getelementptr inbounds i32* %ip, i64 %index, !dbg !643
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !643
  %wide.load = load <4 x i32>* %13, align 4, !dbg !643
  %.sum65 = or i64 %index, 4, !dbg !643
  %14 = getelementptr i32* %ip, i64 %.sum65, !dbg !643
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !643
  %wide.load58 = load <4 x i32>* %15, align 4, !dbg !643
  %16 = add nsw <4 x i32> %wide.load, %broadcast.splat60, !dbg !643
  %17 = add nsw <4 x i32> %wide.load58, %broadcast.splat60, !dbg !643
  %18 = add i64 %index, %4, !dbg !643
  %19 = getelementptr inbounds i32* %ip, i64 %18, !dbg !643
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !643
  store <4 x i32> %16, <4 x i32>* %20, align 4, !dbg !643
  %.sum = add i64 %18, 4, !dbg !643
  %21 = getelementptr i32* %ip, i64 %.sum, !dbg !643
  %22 = bitcast i32* %21 to <4 x i32>*, !dbg !643
  store <4 x i32> %17, <4 x i32>* %22, align 4, !dbg !643
  %index.next = add i64 %index, 8, !dbg !641
  %23 = icmp eq i64 %index.next, %n.vec, !dbg !641
  br i1 %23, label %middle.block, label %vector.body, !dbg !641, !llvm.loop !645

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph13
  %resume.val = phi i64 [ 0, %.lr.ph13 ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge14, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %resume.val, %middle.block ]
  %24 = getelementptr inbounds i32* %ip, i64 %indvars.iv42, !dbg !643
  %25 = load i32* %24, align 4, !dbg !643, !tbaa !437
  %26 = add nsw i32 %25, %2, !dbg !643
  %27 = add nsw i64 %indvars.iv42, %4, !dbg !643
  %28 = getelementptr inbounds i32* %ip, i64 %27, !dbg !643
  store i32 %26, i32* %28, align 4, !dbg !643, !tbaa !437
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !641
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !641
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %m.016, !dbg !641
  br i1 %exitcond45, label %._crit_edge14, label %scalar.ph, !dbg !641, !llvm.loop !646

._crit_edge14:                                    ; preds = %scalar.ph, %middle.block, %.lr.ph19
  %29 = shl i32 %m.016, 1, !dbg !647
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !207), !dbg !647
  %30 = shl i32 %m.016, 4, !dbg !638
  %31 = icmp slt i32 %30, %2, !dbg !638
  br i1 %31, label %.lr.ph19, label %._crit_edge20, !dbg !638

._crit_edge20:                                    ; preds = %._crit_edge14, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %30, %._crit_edge14 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %29, %._crit_edge14 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge14 ]
  %32 = shl nsw i32 %m.0.lcssa, 1, !dbg !648
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !208), !dbg !648
  %33 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !649
  br i1 %33, label %.preheader1, label %.preheader3, !dbg !649

.preheader3:                                      ; preds = %._crit_edge20
  %34 = icmp sgt i32 %m.0.lcssa, 1, !dbg !651
  br i1 %34, label %.lr.ph8, label %.loopexit, !dbg !651

.preheader1:                                      ; preds = %._crit_edge20
  %35 = icmp sgt i32 %m.0.lcssa, 0, !dbg !654
  br i1 %35, label %.preheader.lr.ph, label %.loopexit, !dbg !654

.preheader.lr.ph:                                 ; preds = %.preheader1
  %36 = shl i32 %m.0.lcssa, 2, !dbg !657
  br label %.preheader, !dbg !654

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %37 = trunc i64 %indvars.iv28 to i32, !dbg !661
  %38 = icmp sgt i32 %37, 0, !dbg !661
  %39 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !662
  %40 = load i32* %39, align 4, !dbg !662, !tbaa !437
  %41 = shl i32 %37, 1, !dbg !663
  br i1 %38, label %.lr.ph, label %._crit_edge, !dbg !661

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %42 = trunc i64 %indvars.iv to i32, !dbg !662
  %43 = shl nsw i32 %42, 1, !dbg !662
  %44 = add nsw i32 %40, %43, !dbg !662
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !203), !dbg !662
  %45 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !663
  %46 = load i32* %45, align 4, !dbg !663, !tbaa !437
  %47 = add nsw i32 %46, %41, !dbg !663
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !205), !dbg !663
  %48 = sext i32 %44 to i64, !dbg !664
  %49 = getelementptr inbounds double* %a, i64 %48, !dbg !664
  %50 = load double* %49, align 8, !dbg !664, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !209), !dbg !664
  %51 = add nsw i32 %44, 1, !dbg !665
  %52 = sext i32 %51 to i64, !dbg !665
  %53 = getelementptr inbounds double* %a, i64 %52, !dbg !665
  %54 = load double* %53, align 8, !dbg !665, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %54}, i64 0, metadata !210), !dbg !665
  %55 = sext i32 %47 to i64, !dbg !666
  %56 = getelementptr inbounds double* %a, i64 %55, !dbg !666
  %57 = load double* %56, align 8, !dbg !666, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %57}, i64 0, metadata !211), !dbg !666
  %58 = add nsw i32 %47, 1, !dbg !667
  %59 = sext i32 %58 to i64, !dbg !667
  %60 = getelementptr inbounds double* %a, i64 %59, !dbg !667
  %61 = load double* %60, align 8, !dbg !667, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !212), !dbg !667
  store double %57, double* %49, align 8, !dbg !668, !tbaa !243
  store double %61, double* %53, align 8, !dbg !669, !tbaa !243
  store double %50, double* %56, align 8, !dbg !670, !tbaa !243
  store double %54, double* %60, align 8, !dbg !671, !tbaa !243
  %62 = add nsw i32 %44, %32, !dbg !672
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !203), !dbg !672
  %63 = add nsw i32 %47, %36, !dbg !657
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !205), !dbg !657
  %64 = sext i32 %62 to i64, !dbg !673
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !673
  %66 = load double* %65, align 8, !dbg !673, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !209), !dbg !673
  %67 = add nsw i32 %62, 1, !dbg !674
  %68 = sext i32 %67 to i64, !dbg !674
  %69 = getelementptr inbounds double* %a, i64 %68, !dbg !674
  %70 = load double* %69, align 8, !dbg !674, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !210), !dbg !674
  %71 = sext i32 %63 to i64, !dbg !675
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !675
  %73 = load double* %72, align 8, !dbg !675, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !211), !dbg !675
  %74 = add nsw i32 %63, 1, !dbg !676
  %75 = sext i32 %74 to i64, !dbg !676
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !676
  %77 = load double* %76, align 8, !dbg !676, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !212), !dbg !676
  store double %73, double* %65, align 8, !dbg !677, !tbaa !243
  store double %77, double* %69, align 8, !dbg !678, !tbaa !243
  store double %66, double* %72, align 8, !dbg !679, !tbaa !243
  store double %70, double* %76, align 8, !dbg !680, !tbaa !243
  %78 = add nsw i32 %62, %32, !dbg !681
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !203), !dbg !681
  %79 = sub nsw i32 %63, %32, !dbg !682
  tail call void @llvm.dbg.value(metadata !{i32 %79}, i64 0, metadata !205), !dbg !682
  %80 = sext i32 %78 to i64, !dbg !683
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !683
  %82 = load double* %81, align 8, !dbg !683, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !209), !dbg !683
  %83 = add nsw i32 %78, 1, !dbg !684
  %84 = sext i32 %83 to i64, !dbg !684
  %85 = getelementptr inbounds double* %a, i64 %84, !dbg !684
  %86 = load double* %85, align 8, !dbg !684, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !210), !dbg !684
  %87 = sext i32 %79 to i64, !dbg !685
  %88 = getelementptr inbounds double* %a, i64 %87, !dbg !685
  %89 = load double* %88, align 8, !dbg !685, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %89}, i64 0, metadata !211), !dbg !685
  %90 = add nsw i32 %79, 1, !dbg !686
  %91 = sext i32 %90 to i64, !dbg !686
  %92 = getelementptr inbounds double* %a, i64 %91, !dbg !686
  %93 = load double* %92, align 8, !dbg !686, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !212), !dbg !686
  store double %89, double* %81, align 8, !dbg !687, !tbaa !243
  store double %93, double* %85, align 8, !dbg !688, !tbaa !243
  store double %82, double* %88, align 8, !dbg !689, !tbaa !243
  store double %86, double* %92, align 8, !dbg !690, !tbaa !243
  %94 = add nsw i32 %78, %32, !dbg !691
  tail call void @llvm.dbg.value(metadata !{i32 %94}, i64 0, metadata !203), !dbg !691
  %95 = add nsw i32 %79, %36, !dbg !692
  tail call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !205), !dbg !692
  %96 = sext i32 %94 to i64, !dbg !693
  %97 = getelementptr inbounds double* %a, i64 %96, !dbg !693
  %98 = load double* %97, align 8, !dbg !693, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %98}, i64 0, metadata !209), !dbg !693
  %99 = add nsw i32 %94, 1, !dbg !694
  %100 = sext i32 %99 to i64, !dbg !694
  %101 = getelementptr inbounds double* %a, i64 %100, !dbg !694
  %102 = load double* %101, align 8, !dbg !694, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !210), !dbg !694
  %103 = sext i32 %95 to i64, !dbg !695
  %104 = getelementptr inbounds double* %a, i64 %103, !dbg !695
  %105 = load double* %104, align 8, !dbg !695, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %105}, i64 0, metadata !211), !dbg !695
  %106 = add nsw i32 %95, 1, !dbg !696
  %107 = sext i32 %106 to i64, !dbg !696
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !696
  %109 = load double* %108, align 8, !dbg !696, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !212), !dbg !696
  store double %105, double* %97, align 8, !dbg !697, !tbaa !243
  store double %109, double* %101, align 8, !dbg !698, !tbaa !243
  store double %98, double* %104, align 8, !dbg !699, !tbaa !243
  store double %102, double* %108, align 8, !dbg !700, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !661
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !661
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv26, !dbg !661
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !661

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %110 = add nsw i32 %41, %32, !dbg !701
  %111 = add nsw i32 %110, %40, !dbg !701
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !203), !dbg !701
  %112 = add nsw i32 %111, %32, !dbg !702
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !205), !dbg !702
  %113 = sext i32 %111 to i64, !dbg !703
  %114 = getelementptr inbounds double* %a, i64 %113, !dbg !703
  %115 = load double* %114, align 8, !dbg !703, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %115}, i64 0, metadata !209), !dbg !703
  %116 = add nsw i32 %111, 1, !dbg !704
  %117 = sext i32 %116 to i64, !dbg !704
  %118 = getelementptr inbounds double* %a, i64 %117, !dbg !704
  %119 = load double* %118, align 8, !dbg !704, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %119}, i64 0, metadata !210), !dbg !704
  %120 = sext i32 %112 to i64, !dbg !705
  %121 = getelementptr inbounds double* %a, i64 %120, !dbg !705
  %122 = load double* %121, align 8, !dbg !705, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !211), !dbg !705
  %123 = add nsw i32 %112, 1, !dbg !706
  %124 = sext i32 %123 to i64, !dbg !706
  %125 = getelementptr inbounds double* %a, i64 %124, !dbg !706
  %126 = load double* %125, align 8, !dbg !706, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !212), !dbg !706
  store double %122, double* %114, align 8, !dbg !707, !tbaa !243
  store double %126, double* %118, align 8, !dbg !708, !tbaa !243
  store double %115, double* %121, align 8, !dbg !709, !tbaa !243
  store double %119, double* %125, align 8, !dbg !710, !tbaa !243
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !654
  %indvars.iv.next27 = add nuw nsw i32 %indvars.iv26, 1, !dbg !654
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next27}, i64 0, metadata !204), !dbg !654
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !654
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %m.0.lcssa, !dbg !654
  br i1 %exitcond31, label %.loopexit, label %.preheader, !dbg !654

.lr.ph8:                                          ; preds = %.preheader3, %._crit_edge9
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge9 ], [ 1, %.preheader3 ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge9 ], [ 1, %.preheader3 ]
  %127 = getelementptr inbounds i32* %ip, i64 %indvars.iv38, !dbg !711
  %128 = load i32* %127, align 4, !dbg !711, !tbaa !437
  %129 = trunc i64 %indvars.iv38 to i32, !dbg !715
  %130 = shl nsw i32 %129, 1, !dbg !715
  br label %131, !dbg !716

; <label>:131                                     ; preds = %131, %.lr.ph8
  %indvars.iv32 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next33, %131 ]
  %132 = trunc i64 %indvars.iv32 to i32, !dbg !711
  %133 = shl nsw i32 %132, 1, !dbg !711
  %134 = add nsw i32 %128, %133, !dbg !711
  tail call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !203), !dbg !711
  %135 = getelementptr inbounds i32* %ip, i64 %indvars.iv32, !dbg !715
  %136 = load i32* %135, align 4, !dbg !715, !tbaa !437
  %137 = add nsw i32 %136, %130, !dbg !715
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !205), !dbg !715
  %138 = sext i32 %134 to i64, !dbg !717
  %139 = getelementptr inbounds double* %a, i64 %138, !dbg !717
  %140 = load double* %139, align 8, !dbg !717, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %140}, i64 0, metadata !209), !dbg !717
  %141 = add nsw i32 %134, 1, !dbg !718
  %142 = sext i32 %141 to i64, !dbg !718
  %143 = getelementptr inbounds double* %a, i64 %142, !dbg !718
  %144 = load double* %143, align 8, !dbg !718, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !210), !dbg !718
  %145 = sext i32 %137 to i64, !dbg !719
  %146 = getelementptr inbounds double* %a, i64 %145, !dbg !719
  %147 = load double* %146, align 8, !dbg !719, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !211), !dbg !719
  %148 = add nsw i32 %137, 1, !dbg !720
  %149 = sext i32 %148 to i64, !dbg !720
  %150 = getelementptr inbounds double* %a, i64 %149, !dbg !720
  %151 = load double* %150, align 8, !dbg !720, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %151}, i64 0, metadata !212), !dbg !720
  store double %147, double* %139, align 8, !dbg !721, !tbaa !243
  store double %151, double* %143, align 8, !dbg !722, !tbaa !243
  store double %140, double* %146, align 8, !dbg !723, !tbaa !243
  store double %144, double* %150, align 8, !dbg !724, !tbaa !243
  %152 = add nsw i32 %134, %32, !dbg !725
  tail call void @llvm.dbg.value(metadata !{i32 %152}, i64 0, metadata !203), !dbg !725
  %153 = add nsw i32 %137, %32, !dbg !726
  tail call void @llvm.dbg.value(metadata !{i32 %153}, i64 0, metadata !205), !dbg !726
  %154 = sext i32 %152 to i64, !dbg !727
  %155 = getelementptr inbounds double* %a, i64 %154, !dbg !727
  %156 = load double* %155, align 8, !dbg !727, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !209), !dbg !727
  %157 = add nsw i32 %152, 1, !dbg !728
  %158 = sext i32 %157 to i64, !dbg !728
  %159 = getelementptr inbounds double* %a, i64 %158, !dbg !728
  %160 = load double* %159, align 8, !dbg !728, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %160}, i64 0, metadata !210), !dbg !728
  %161 = sext i32 %153 to i64, !dbg !729
  %162 = getelementptr inbounds double* %a, i64 %161, !dbg !729
  %163 = load double* %162, align 8, !dbg !729, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !211), !dbg !729
  %164 = add nsw i32 %153, 1, !dbg !730
  %165 = sext i32 %164 to i64, !dbg !730
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !730
  %167 = load double* %166, align 8, !dbg !730, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %167}, i64 0, metadata !212), !dbg !730
  store double %163, double* %155, align 8, !dbg !731, !tbaa !243
  store double %167, double* %159, align 8, !dbg !732, !tbaa !243
  store double %156, double* %162, align 8, !dbg !733, !tbaa !243
  store double %160, double* %166, align 8, !dbg !734, !tbaa !243
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !716
  %lftr.wideiv36 = trunc i64 %indvars.iv.next33 to i32, !dbg !716
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %indvars.iv34, !dbg !716
  br i1 %exitcond37, label %._crit_edge9, label %131, !dbg !716

._crit_edge9:                                     ; preds = %131
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !651
  %indvars.iv.next35 = add nuw nsw i32 %indvars.iv34, 1, !dbg !651
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next35}, i64 0, metadata !204), !dbg !651
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !651
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %m.0.lcssa, !dbg !651
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8, !dbg !651

.loopexit:                                        ; preds = %._crit_edge9, %._crit_edge, %.preheader3, %.preheader1
  ret void, !dbg !735
}

; Function Attrs: nounwind uwtable
define internal fastcc void @cftfsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !165), !dbg !736
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !166), !dbg !736
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !167), !dbg !736
  tail call void @llvm.dbg.value(metadata !565, i64 0, metadata !172), !dbg !737
  %1 = icmp sgt i32 %n, 8, !dbg !738
  br i1 %1, label %2, label %.loopexit3, !dbg !738

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w), !dbg !740
  tail call void @llvm.dbg.value(metadata !572, i64 0, metadata !172), !dbg !742
  %3 = icmp sgt i32 %n, 32, !dbg !743
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !743

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w), !dbg !744
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !172), !dbg !746
  %5 = shl i32 %4, 2, !dbg !743
  %6 = icmp slt i32 %5, %n, !dbg !743
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !743

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !747
  %8 = icmp eq i32 %7, %n, !dbg !747
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !168), !dbg !749
  %9 = icmp sgt i32 %l.1, 0, !dbg !749
  br i1 %8, label %.preheader, label %.preheader1, !dbg !747

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !752

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !752
  br label %56, !dbg !752

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !749

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !749
  br label %12, !dbg !749

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = add nsw i64 %indvars.iv, %11, !dbg !755
  %14 = add nsw i64 %13, %11, !dbg !757
  %15 = add nsw i64 %14, %11, !dbg !758
  %16 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !759
  %17 = getelementptr inbounds double* %a, i64 %13, !dbg !759
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !173), !dbg !759
  %18 = bitcast double* %16 to <2 x double>*, !dbg !759
  %19 = load <2 x double>* %18, align 8, !dbg !759, !tbaa !243
  %20 = add nsw i64 %13, 1, !dbg !760
  %21 = getelementptr inbounds double* %a, i64 %20, !dbg !760
  %22 = bitcast double* %17 to <2 x double>*, !dbg !759
  %23 = load <2 x double>* %22, align 8, !dbg !759, !tbaa !243
  %24 = fadd <2 x double> %19, %23, !dbg !759
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !174), !dbg !760
  %25 = extractelement <2 x double> %19, i32 0, !dbg !761
  %26 = extractelement <2 x double> %23, i32 0, !dbg !761
  %27 = fsub double %25, %26, !dbg !761
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !175), !dbg !761
  %28 = extractelement <2 x double> %19, i32 1, !dbg !762
  %29 = extractelement <2 x double> %23, i32 1, !dbg !762
  %30 = fsub double %28, %29, !dbg !762
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !176), !dbg !762
  %31 = getelementptr inbounds double* %a, i64 %14, !dbg !763
  %32 = getelementptr inbounds double* %a, i64 %15, !dbg !763
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !177), !dbg !763
  %33 = bitcast double* %31 to <2 x double>*, !dbg !763
  %34 = load <2 x double>* %33, align 8, !dbg !763, !tbaa !243
  %35 = add nsw i64 %15, 1, !dbg !764
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !764
  %37 = bitcast double* %32 to <2 x double>*, !dbg !763
  %38 = load <2 x double>* %37, align 8, !dbg !763, !tbaa !243
  %39 = fadd <2 x double> %34, %38, !dbg !763
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !178), !dbg !764
  %40 = extractelement <2 x double> %34, i32 0, !dbg !765
  %41 = extractelement <2 x double> %38, i32 0, !dbg !765
  %42 = fsub double %40, %41, !dbg !765
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !179), !dbg !765
  %43 = extractelement <2 x double> %34, i32 1, !dbg !766
  %44 = extractelement <2 x double> %38, i32 1, !dbg !766
  %45 = fsub double %43, %44, !dbg !766
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !180), !dbg !766
  %46 = fadd <2 x double> %24, %39, !dbg !767
  %47 = bitcast double* %16 to <2 x double>*, !dbg !767
  store <2 x double> %46, <2 x double>* %47, align 8, !dbg !767, !tbaa !243
  %48 = fsub <2 x double> %24, %39, !dbg !768
  %49 = bitcast double* %31 to <2 x double>*, !dbg !768
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !768, !tbaa !243
  %50 = fsub double %27, %45, !dbg !769
  store double %50, double* %17, align 8, !dbg !769, !tbaa !243
  %51 = fadd double %30, %42, !dbg !770
  store double %51, double* %21, align 8, !dbg !770, !tbaa !243
  %52 = fadd double %27, %45, !dbg !771
  store double %52, double* %32, align 8, !dbg !771, !tbaa !243
  %53 = fsub double %30, %42, !dbg !772
  store double %53, double* %36, align 8, !dbg !772, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !749
  %54 = trunc i64 %indvars.iv.next to i32, !dbg !749
  %55 = icmp slt i32 %54, %l.1, !dbg !749
  br i1 %55, label %12, label %.loopexit, !dbg !749

; <label>:56                                      ; preds = %.lr.ph6, %56
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %56 ]
  %57 = add nsw i64 %indvars.iv9, %10, !dbg !773
  %58 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !775
  %59 = getelementptr inbounds double* %a, i64 %57, !dbg !775
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !173), !dbg !775
  %60 = or i64 %indvars.iv9, 1, !dbg !776
  %61 = getelementptr inbounds double* %a, i64 %60, !dbg !776
  %62 = bitcast double* %58 to <2 x double>*, !dbg !775
  %63 = load <2 x double>* %62, align 8, !dbg !775, !tbaa !243
  %64 = add nsw i64 %57, 1, !dbg !776
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !776
  %66 = bitcast double* %59 to <2 x double>*, !dbg !775
  %67 = load <2 x double>* %66, align 8, !dbg !775, !tbaa !243
  %68 = fsub <2 x double> %63, %67, !dbg !775
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !174), !dbg !776
  %69 = extractelement <2 x double> %63, i32 0, !dbg !777
  %70 = extractelement <2 x double> %67, i32 0, !dbg !777
  %71 = fadd double %69, %70, !dbg !777
  store double %71, double* %58, align 8, !dbg !777, !tbaa !243
  %72 = load double* %65, align 8, !dbg !778, !tbaa !243
  %73 = extractelement <2 x double> %63, i32 1, !dbg !778
  %74 = fadd double %72, %73, !dbg !778
  store double %74, double* %61, align 8, !dbg !778, !tbaa !243
  %75 = bitcast double* %59 to <2 x double>*, !dbg !779
  store <2 x double> %68, <2 x double>* %75, align 8, !dbg !779, !tbaa !243
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !752
  %76 = trunc i64 %indvars.iv.next10 to i32, !dbg !752
  %77 = icmp slt i32 %76, %l.1, !dbg !752
  br i1 %77, label %56, label %.loopexit, !dbg !752

.loopexit:                                        ; preds = %56, %12, %.preheader1, %.preheader
  ret void, !dbg !780
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cft1st(i32 %n, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !143), !dbg !781
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !144), !dbg !781
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !145), !dbg !781
  %1 = getelementptr inbounds double* %a, i64 2, !dbg !782
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !155), !dbg !782
  %2 = bitcast double* %a to <2 x double>*, !dbg !782
  %3 = load <2 x double>* %2, align 8, !dbg !782, !tbaa !243
  %4 = getelementptr inbounds double* %a, i64 3, !dbg !783
  %5 = bitcast double* %1 to <2 x double>*, !dbg !782
  %6 = load <2 x double>* %5, align 8, !dbg !782, !tbaa !243
  %7 = fadd <2 x double> %3, %6, !dbg !782
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !156), !dbg !783
  %8 = extractelement <2 x double> %3, i32 0, !dbg !784
  %9 = extractelement <2 x double> %6, i32 0, !dbg !784
  %10 = fsub double %8, %9, !dbg !784
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !157), !dbg !784
  %11 = extractelement <2 x double> %3, i32 1, !dbg !785
  %12 = extractelement <2 x double> %6, i32 1, !dbg !785
  %13 = fsub double %11, %12, !dbg !785
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !158), !dbg !785
  %14 = getelementptr inbounds double* %a, i64 4, !dbg !786
  %15 = getelementptr inbounds double* %a, i64 6, !dbg !786
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !159), !dbg !786
  %16 = bitcast double* %14 to <2 x double>*, !dbg !786
  %17 = load <2 x double>* %16, align 8, !dbg !786, !tbaa !243
  %18 = getelementptr inbounds double* %a, i64 7, !dbg !787
  %19 = bitcast double* %15 to <2 x double>*, !dbg !786
  %20 = load <2 x double>* %19, align 8, !dbg !786, !tbaa !243
  %21 = fadd <2 x double> %17, %20, !dbg !786
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !160), !dbg !787
  %22 = extractelement <2 x double> %17, i32 0, !dbg !788
  %23 = extractelement <2 x double> %20, i32 0, !dbg !788
  %24 = fsub double %22, %23, !dbg !788
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !161), !dbg !788
  %25 = extractelement <2 x double> %17, i32 1, !dbg !789
  %26 = extractelement <2 x double> %20, i32 1, !dbg !789
  %27 = fsub double %25, %26, !dbg !789
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !162), !dbg !789
  %28 = fadd <2 x double> %7, %21, !dbg !790
  %29 = bitcast double* %a to <2 x double>*, !dbg !790
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !790, !tbaa !243
  %30 = fsub <2 x double> %7, %21, !dbg !791
  %31 = bitcast double* %14 to <2 x double>*, !dbg !791
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !791, !tbaa !243
  %32 = fsub double %10, %27, !dbg !792
  store double %32, double* %1, align 8, !dbg !792, !tbaa !243
  %33 = fadd double %13, %24, !dbg !793
  store double %33, double* %4, align 8, !dbg !793, !tbaa !243
  %34 = fadd double %10, %27, !dbg !794
  store double %34, double* %15, align 8, !dbg !794, !tbaa !243
  %35 = fsub double %13, %24, !dbg !795
  store double %35, double* %18, align 8, !dbg !795, !tbaa !243
  %36 = getelementptr inbounds double* %w, i64 2, !dbg !796
  %37 = load double* %36, align 8, !dbg !796, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !149), !dbg !796
  %38 = getelementptr inbounds double* %a, i64 8, !dbg !797
  %39 = getelementptr inbounds double* %a, i64 10, !dbg !797
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !155), !dbg !797
  %40 = bitcast double* %38 to <2 x double>*, !dbg !797
  %41 = load <2 x double>* %40, align 8, !dbg !797, !tbaa !243
  %42 = bitcast double* %39 to <2 x double>*, !dbg !797
  %43 = load <2 x double>* %42, align 8, !dbg !797, !tbaa !243
  %44 = fadd <2 x double> %41, %43, !dbg !797
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !156), !dbg !798
  %45 = extractelement <2 x double> %41, i32 0, !dbg !799
  %46 = extractelement <2 x double> %43, i32 0, !dbg !799
  %47 = fsub double %45, %46, !dbg !799
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !157), !dbg !799
  %48 = extractelement <2 x double> %41, i32 1, !dbg !800
  %49 = extractelement <2 x double> %43, i32 1, !dbg !800
  %50 = fsub double %48, %49, !dbg !800
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !158), !dbg !800
  %51 = getelementptr inbounds double* %a, i64 12, !dbg !801
  %52 = getelementptr inbounds double* %a, i64 14, !dbg !801
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !159), !dbg !801
  %53 = bitcast double* %51 to <2 x double>*, !dbg !801
  %54 = load <2 x double>* %53, align 8, !dbg !801, !tbaa !243
  %55 = bitcast double* %52 to <2 x double>*, !dbg !801
  %56 = load <2 x double>* %55, align 8, !dbg !801, !tbaa !243
  %57 = fadd <2 x double> %54, %56, !dbg !801
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !160), !dbg !802
  %58 = extractelement <2 x double> %54, i32 0, !dbg !803
  %59 = extractelement <2 x double> %56, i32 0, !dbg !803
  %60 = fsub double %58, %59, !dbg !803
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !161), !dbg !803
  %61 = extractelement <2 x double> %54, i32 1, !dbg !804
  %62 = extractelement <2 x double> %56, i32 1, !dbg !804
  %63 = fsub double %61, %62, !dbg !804
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !162), !dbg !804
  %64 = fadd <2 x double> %44, %57, !dbg !805
  %65 = bitcast double* %38 to <2 x double>*, !dbg !805
  store <2 x double> %64, <2 x double>* %65, align 8, !dbg !805, !tbaa !243
  %66 = shufflevector <2 x double> %57, <2 x double> %44, <2 x i32> <i32 1, i32 2>, !dbg !806
  %67 = shufflevector <2 x double> %44, <2 x double> %57, <2 x i32> <i32 1, i32 2>, !dbg !806
  %68 = fsub <2 x double> %66, %67, !dbg !806
  %69 = bitcast double* %51 to <2 x double>*, !dbg !806
  store <2 x double> %68, <2 x double>* %69, align 8, !dbg !806, !tbaa !243
  %70 = fsub double %47, %63, !dbg !807
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !155), !dbg !807
  %71 = fadd double %50, %60, !dbg !808
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !156), !dbg !808
  %72 = fsub double %70, %71, !dbg !809
  %73 = fadd double %71, %70, !dbg !810
  %74 = insertelement <2 x double> undef, double %72, i32 0, !dbg !809
  %75 = insertelement <2 x double> %74, double %73, i32 1, !dbg !809
  %76 = insertelement <2 x double> undef, double %37, i32 0, !dbg !809
  %77 = insertelement <2 x double> %76, double %37, i32 1, !dbg !809
  %78 = fmul <2 x double> %75, %77, !dbg !809
  %79 = bitcast double* %39 to <2 x double>*, !dbg !809
  store <2 x double> %78, <2 x double>* %79, align 8, !dbg !809, !tbaa !243
  %80 = fadd double %47, %63, !dbg !811
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !155), !dbg !811
  %81 = fsub double %60, %50, !dbg !812
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !156), !dbg !812
  %82 = fsub double %81, %80, !dbg !813
  %83 = fadd double %81, %80, !dbg !814
  %84 = insertelement <2 x double> undef, double %82, i32 0, !dbg !813
  %85 = insertelement <2 x double> %84, double %83, i32 1, !dbg !813
  %86 = fmul <2 x double> %85, %77, !dbg !813
  %87 = bitcast double* %52 to <2 x double>*, !dbg !813
  store <2 x double> %86, <2 x double>* %87, align 8, !dbg !813, !tbaa !243
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !147), !dbg !815
  tail call void @llvm.dbg.value(metadata !816, i64 0, metadata !146), !dbg !817
  %88 = icmp sgt i32 %n, 16, !dbg !817
  br i1 %88, label %.lr.ph, label %._crit_edge, !dbg !817

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 16, %0 ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 2, !dbg !817
  %89 = shl nsw i64 %indvars.iv.next4, 1, !dbg !819
  %90 = getelementptr inbounds double* %w, i64 %indvars.iv.next4, !dbg !821
  %91 = load double* %90, align 8, !dbg !821, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !151), !dbg !821
  %92 = add nsw i64 %indvars.iv3, 3, !dbg !822
  %93 = getelementptr inbounds double* %w, i64 %92, !dbg !822
  %94 = load double* %93, align 8, !dbg !822, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !152), !dbg !822
  %95 = getelementptr inbounds double* %w, i64 %89, !dbg !823
  %96 = load double* %95, align 8, !dbg !823, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !149), !dbg !823
  %97 = or i64 %89, 1, !dbg !824
  %98 = getelementptr inbounds double* %w, i64 %97, !dbg !824
  %99 = load double* %98, align 8, !dbg !824, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !150), !dbg !824
  %100 = fmul double %94, 2.000000e+00, !dbg !825
  %101 = fmul double %100, %99, !dbg !825
  %102 = fsub double %96, %101, !dbg !825
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !153), !dbg !825
  %103 = fmul double %100, %96, !dbg !826
  %104 = fsub double %103, %99, !dbg !826
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !154), !dbg !826
  %105 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !827
  %106 = or i64 %indvars.iv, 2, !dbg !827
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !827
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !155), !dbg !827
  %108 = bitcast double* %105 to <2 x double>*, !dbg !827
  %109 = load <2 x double>* %108, align 8, !dbg !827, !tbaa !243
  %110 = or i64 %indvars.iv, 3, !dbg !828
  %111 = getelementptr inbounds double* %a, i64 %110, !dbg !828
  %112 = bitcast double* %107 to <2 x double>*, !dbg !827
  %113 = load <2 x double>* %112, align 8, !dbg !827, !tbaa !243
  %114 = fadd <2 x double> %109, %113, !dbg !827
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !156), !dbg !828
  %115 = extractelement <2 x double> %109, i32 0, !dbg !829
  %116 = extractelement <2 x double> %113, i32 0, !dbg !829
  %117 = fsub double %115, %116, !dbg !829
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !157), !dbg !829
  %118 = extractelement <2 x double> %109, i32 1, !dbg !830
  %119 = extractelement <2 x double> %113, i32 1, !dbg !830
  %120 = fsub double %118, %119, !dbg !830
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !158), !dbg !830
  %121 = or i64 %indvars.iv, 4, !dbg !831
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !831
  %123 = or i64 %indvars.iv, 6, !dbg !831
  %124 = getelementptr inbounds double* %a, i64 %123, !dbg !831
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !159), !dbg !831
  %125 = or i64 %indvars.iv, 5, !dbg !832
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !832
  %127 = bitcast double* %122 to <2 x double>*, !dbg !831
  %128 = load <2 x double>* %127, align 8, !dbg !831, !tbaa !243
  %129 = or i64 %indvars.iv, 7, !dbg !832
  %130 = getelementptr inbounds double* %a, i64 %129, !dbg !832
  %131 = bitcast double* %124 to <2 x double>*, !dbg !831
  %132 = load <2 x double>* %131, align 8, !dbg !831, !tbaa !243
  %133 = fadd <2 x double> %128, %132, !dbg !831
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !160), !dbg !832
  %134 = extractelement <2 x double> %128, i32 0, !dbg !833
  %135 = extractelement <2 x double> %132, i32 0, !dbg !833
  %136 = fsub double %134, %135, !dbg !833
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !161), !dbg !833
  %137 = extractelement <2 x double> %128, i32 1, !dbg !834
  %138 = extractelement <2 x double> %132, i32 1, !dbg !834
  %139 = fsub double %137, %138, !dbg !834
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !162), !dbg !834
  %140 = fadd <2 x double> %114, %133, !dbg !835
  %141 = bitcast double* %105 to <2 x double>*, !dbg !835
  store <2 x double> %140, <2 x double>* %141, align 8, !dbg !835, !tbaa !243
  %142 = extractelement <2 x double> %114, i32 0, !dbg !836
  %143 = extractelement <2 x double> %133, i32 0, !dbg !836
  %144 = fsub double %142, %143, !dbg !836
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !155), !dbg !836
  %145 = extractelement <2 x double> %114, i32 1, !dbg !837
  %146 = extractelement <2 x double> %133, i32 1, !dbg !837
  %147 = fsub double %145, %146, !dbg !837
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !156), !dbg !837
  %148 = fmul double %91, %144, !dbg !838
  %149 = fmul double %94, %147, !dbg !838
  %150 = fsub double %148, %149, !dbg !838
  store double %150, double* %122, align 8, !dbg !838, !tbaa !243
  %151 = fmul double %91, %147, !dbg !839
  %152 = fmul double %94, %144, !dbg !839
  %153 = fadd double %152, %151, !dbg !839
  store double %153, double* %126, align 8, !dbg !839, !tbaa !243
  %154 = fsub double %117, %139, !dbg !840
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !155), !dbg !840
  %155 = fadd double %120, %136, !dbg !841
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !156), !dbg !841
  %156 = fmul double %96, %154, !dbg !842
  %157 = fmul double %99, %155, !dbg !842
  %158 = fsub double %156, %157, !dbg !842
  store double %158, double* %107, align 8, !dbg !842, !tbaa !243
  %159 = fmul double %96, %155, !dbg !843
  %160 = fmul double %99, %154, !dbg !843
  %161 = fadd double %159, %160, !dbg !843
  store double %161, double* %111, align 8, !dbg !843, !tbaa !243
  %162 = fadd double %117, %139, !dbg !844
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !155), !dbg !844
  %163 = fsub double %120, %136, !dbg !845
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !156), !dbg !845
  %164 = fmul double %102, %162, !dbg !846
  %165 = fmul double %104, %163, !dbg !846
  %166 = fsub double %164, %165, !dbg !846
  store double %166, double* %124, align 8, !dbg !846, !tbaa !243
  %167 = fmul double %102, %163, !dbg !847
  %168 = fmul double %104, %162, !dbg !847
  %169 = fadd double %167, %168, !dbg !847
  store double %169, double* %130, align 8, !dbg !847, !tbaa !243
  %170 = or i64 %89, 2, !dbg !848
  %171 = getelementptr inbounds double* %w, i64 %170, !dbg !848
  %172 = load double* %171, align 8, !dbg !848, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !149), !dbg !848
  %173 = or i64 %89, 3, !dbg !849
  %174 = getelementptr inbounds double* %w, i64 %173, !dbg !849
  %175 = load double* %174, align 8, !dbg !849, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !150), !dbg !849
  %176 = fmul double %91, 2.000000e+00, !dbg !850
  %177 = fmul double %176, %175, !dbg !850
  %178 = fsub double %172, %177, !dbg !850
  tail call void @llvm.dbg.value(metadata !{double %178}, i64 0, metadata !153), !dbg !850
  %179 = fmul double %176, %172, !dbg !851
  %180 = fsub double %179, %175, !dbg !851
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !154), !dbg !851
  %181 = or i64 %indvars.iv, 8, !dbg !852
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !852
  %183 = or i64 %indvars.iv, 10, !dbg !852
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !852
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !155), !dbg !852
  %185 = bitcast double* %182 to <2 x double>*, !dbg !852
  %186 = load <2 x double>* %185, align 8, !dbg !852, !tbaa !243
  %187 = or i64 %indvars.iv, 11, !dbg !853
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !853
  %189 = bitcast double* %184 to <2 x double>*, !dbg !852
  %190 = load <2 x double>* %189, align 8, !dbg !852, !tbaa !243
  %191 = fadd <2 x double> %186, %190, !dbg !852
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !156), !dbg !853
  %192 = extractelement <2 x double> %186, i32 0, !dbg !854
  %193 = extractelement <2 x double> %190, i32 0, !dbg !854
  %194 = fsub double %192, %193, !dbg !854
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !157), !dbg !854
  %195 = extractelement <2 x double> %186, i32 1, !dbg !855
  %196 = extractelement <2 x double> %190, i32 1, !dbg !855
  %197 = fsub double %195, %196, !dbg !855
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !158), !dbg !855
  %198 = or i64 %indvars.iv, 12, !dbg !856
  %199 = getelementptr inbounds double* %a, i64 %198, !dbg !856
  %200 = or i64 %indvars.iv, 14, !dbg !856
  %201 = getelementptr inbounds double* %a, i64 %200, !dbg !856
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !159), !dbg !856
  %202 = or i64 %indvars.iv, 13, !dbg !857
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !857
  %204 = bitcast double* %199 to <2 x double>*, !dbg !856
  %205 = load <2 x double>* %204, align 8, !dbg !856, !tbaa !243
  %206 = or i64 %indvars.iv, 15, !dbg !857
  %207 = getelementptr inbounds double* %a, i64 %206, !dbg !857
  %208 = bitcast double* %201 to <2 x double>*, !dbg !856
  %209 = load <2 x double>* %208, align 8, !dbg !856, !tbaa !243
  %210 = fadd <2 x double> %205, %209, !dbg !856
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !160), !dbg !857
  %211 = extractelement <2 x double> %205, i32 0, !dbg !858
  %212 = extractelement <2 x double> %209, i32 0, !dbg !858
  %213 = fsub double %211, %212, !dbg !858
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !161), !dbg !858
  %214 = extractelement <2 x double> %205, i32 1, !dbg !859
  %215 = extractelement <2 x double> %209, i32 1, !dbg !859
  %216 = fsub double %214, %215, !dbg !859
  tail call void @llvm.dbg.value(metadata !{double %216}, i64 0, metadata !162), !dbg !859
  %217 = fadd <2 x double> %191, %210, !dbg !860
  %218 = bitcast double* %182 to <2 x double>*, !dbg !860
  store <2 x double> %217, <2 x double>* %218, align 8, !dbg !860, !tbaa !243
  %219 = extractelement <2 x double> %191, i32 0, !dbg !861
  %220 = extractelement <2 x double> %210, i32 0, !dbg !861
  %221 = fsub double %219, %220, !dbg !861
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !155), !dbg !861
  %222 = extractelement <2 x double> %191, i32 1, !dbg !862
  %223 = extractelement <2 x double> %210, i32 1, !dbg !862
  %224 = fsub double %222, %223, !dbg !862
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !156), !dbg !862
  %225 = fsub double -0.000000e+00, %94, !dbg !863
  %226 = fmul double %221, %225, !dbg !863
  %227 = fmul double %91, %224, !dbg !863
  %228 = fsub double %226, %227, !dbg !863
  store double %228, double* %199, align 8, !dbg !863, !tbaa !243
  %229 = fmul double %224, %225, !dbg !864
  %230 = fmul double %91, %221, !dbg !864
  %231 = fadd double %230, %229, !dbg !864
  store double %231, double* %203, align 8, !dbg !864, !tbaa !243
  %232 = fsub double %194, %216, !dbg !865
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !155), !dbg !865
  %233 = fadd double %197, %213, !dbg !866
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !156), !dbg !866
  %234 = fmul double %172, %232, !dbg !867
  %235 = fmul double %175, %233, !dbg !867
  %236 = fsub double %234, %235, !dbg !867
  store double %236, double* %184, align 8, !dbg !867, !tbaa !243
  %237 = fmul double %172, %233, !dbg !868
  %238 = fmul double %175, %232, !dbg !868
  %239 = fadd double %237, %238, !dbg !868
  store double %239, double* %188, align 8, !dbg !868, !tbaa !243
  %240 = fadd double %194, %216, !dbg !869
  tail call void @llvm.dbg.value(metadata !{double %240}, i64 0, metadata !155), !dbg !869
  %241 = fsub double %197, %213, !dbg !870
  tail call void @llvm.dbg.value(metadata !{double %241}, i64 0, metadata !156), !dbg !870
  %242 = fmul double %178, %240, !dbg !871
  %243 = fmul double %180, %241, !dbg !871
  %244 = fsub double %242, %243, !dbg !871
  store double %244, double* %201, align 8, !dbg !871, !tbaa !243
  %245 = fmul double %178, %241, !dbg !872
  %246 = fmul double %180, %240, !dbg !872
  %247 = fadd double %245, %246, !dbg !872
  store double %247, double* %207, align 8, !dbg !872, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16, !dbg !817
  %248 = trunc i64 %indvars.iv.next to i32, !dbg !817
  %249 = icmp slt i32 %248, %n, !dbg !817
  br i1 %249, label %.lr.ph, label %._crit_edge, !dbg !817

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !873
}

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cftmdl(i32 %n, i32 %l, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !874
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !115), !dbg !874
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !116), !dbg !874
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !117), !dbg !874
  %1 = shl i32 %l, 2, !dbg !875
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !125), !dbg !875
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !118), !dbg !876
  %2 = icmp sgt i32 %l, 0, !dbg !876
  br i1 %2, label %.lr.ph17, label %._crit_edge14, !dbg !876

.lr.ph17:                                         ; preds = %0
  %3 = sext i32 %l to i64, !dbg !876
  br label %4, !dbg !876

; <label>:4                                       ; preds = %.lr.ph17, %4
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next28, %4 ]
  %5 = add nsw i64 %indvars.iv27, %3, !dbg !878
  %6 = add nsw i64 %5, %3, !dbg !880
  %7 = add nsw i64 %6, %3, !dbg !881
  %8 = getelementptr inbounds double* %a, i64 %indvars.iv27, !dbg !882
  %9 = getelementptr inbounds double* %a, i64 %5, !dbg !882
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !133), !dbg !882
  %10 = bitcast double* %8 to <2 x double>*, !dbg !882
  %11 = load <2 x double>* %10, align 8, !dbg !882, !tbaa !243
  %12 = add nsw i64 %5, 1, !dbg !883
  %13 = getelementptr inbounds double* %a, i64 %12, !dbg !883
  %14 = bitcast double* %9 to <2 x double>*, !dbg !882
  %15 = load <2 x double>* %14, align 8, !dbg !882, !tbaa !243
  %16 = fadd <2 x double> %11, %15, !dbg !882
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !134), !dbg !883
  %17 = extractelement <2 x double> %11, i32 0, !dbg !884
  %18 = extractelement <2 x double> %15, i32 0, !dbg !884
  %19 = fsub double %17, %18, !dbg !884
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !135), !dbg !884
  %20 = extractelement <2 x double> %11, i32 1, !dbg !885
  %21 = extractelement <2 x double> %15, i32 1, !dbg !885
  %22 = fsub double %20, %21, !dbg !885
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !136), !dbg !885
  %23 = getelementptr inbounds double* %a, i64 %6, !dbg !886
  %24 = getelementptr inbounds double* %a, i64 %7, !dbg !886
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !137), !dbg !886
  %25 = bitcast double* %23 to <2 x double>*, !dbg !886
  %26 = load <2 x double>* %25, align 8, !dbg !886, !tbaa !243
  %27 = add nsw i64 %7, 1, !dbg !887
  %28 = getelementptr inbounds double* %a, i64 %27, !dbg !887
  %29 = bitcast double* %24 to <2 x double>*, !dbg !886
  %30 = load <2 x double>* %29, align 8, !dbg !886, !tbaa !243
  %31 = fadd <2 x double> %26, %30, !dbg !886
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !138), !dbg !887
  %32 = extractelement <2 x double> %26, i32 0, !dbg !888
  %33 = extractelement <2 x double> %30, i32 0, !dbg !888
  %34 = fsub double %32, %33, !dbg !888
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !139), !dbg !888
  %35 = extractelement <2 x double> %26, i32 1, !dbg !889
  %36 = extractelement <2 x double> %30, i32 1, !dbg !889
  %37 = fsub double %35, %36, !dbg !889
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !140), !dbg !889
  %38 = fadd <2 x double> %16, %31, !dbg !890
  %39 = bitcast double* %8 to <2 x double>*, !dbg !890
  store <2 x double> %38, <2 x double>* %39, align 8, !dbg !890, !tbaa !243
  %40 = fsub <2 x double> %16, %31, !dbg !891
  %41 = bitcast double* %23 to <2 x double>*, !dbg !891
  store <2 x double> %40, <2 x double>* %41, align 8, !dbg !891, !tbaa !243
  %42 = fsub double %19, %37, !dbg !892
  store double %42, double* %9, align 8, !dbg !892, !tbaa !243
  %43 = fadd double %22, %34, !dbg !893
  store double %43, double* %13, align 8, !dbg !893, !tbaa !243
  %44 = fadd double %19, %37, !dbg !894
  store double %44, double* %24, align 8, !dbg !894, !tbaa !243
  %45 = fsub double %22, %34, !dbg !895
  store double %45, double* %28, align 8, !dbg !895, !tbaa !243
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 2, !dbg !876
  %46 = trunc i64 %indvars.iv.next28 to i32, !dbg !876
  %47 = icmp slt i32 %46, %l, !dbg !876
  br i1 %47, label %4, label %._crit_edge18, !dbg !876

._crit_edge18:                                    ; preds = %4
  %48 = getelementptr inbounds double* %w, i64 2, !dbg !896
  %49 = load double* %48, align 8, !dbg !896, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !127), !dbg !896
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !897
  %50 = add nsw i32 %1, %l, !dbg !897
  br i1 %2, label %.lr.ph13, label %._crit_edge14, !dbg !897

.lr.ph13:                                         ; preds = %._crit_edge18
  %51 = shl i32 %l, 2, !dbg !897
  %52 = sext i32 %51 to i64
  %53 = sext i32 %l to i64, !dbg !897
  %54 = insertelement <2 x double> undef, double %49, i32 0, !dbg !899
  %55 = insertelement <2 x double> %54, double %49, i32 1, !dbg !899
  br label %56, !dbg !897

; <label>:56                                      ; preds = %.lr.ph13, %56
  %indvars.iv25 = phi i64 [ %52, %.lr.ph13 ], [ %indvars.iv.next26, %56 ]
  %j.111 = phi i32 [ %1, %.lr.ph13 ], [ %107, %56 ]
  %57 = add nsw i64 %indvars.iv25, %53, !dbg !901
  %58 = add nsw i64 %57, %53, !dbg !902
  %59 = add nsw i64 %58, %53, !dbg !903
  %60 = getelementptr inbounds double* %a, i64 %indvars.iv25, !dbg !904
  %61 = load double* %60, align 8, !dbg !904, !tbaa !243
  %62 = getelementptr inbounds double* %a, i64 %57, !dbg !904
  %63 = load double* %62, align 8, !dbg !904, !tbaa !243
  %64 = fadd double %61, %63, !dbg !904
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !133), !dbg !904
  %65 = or i32 %j.111, 1, !dbg !905
  %66 = sext i32 %65 to i64, !dbg !905
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !905
  %68 = load double* %67, align 8, !dbg !905, !tbaa !243
  %69 = add nsw i64 %57, 1, !dbg !905
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !905
  %71 = load double* %70, align 8, !dbg !905, !tbaa !243
  %72 = fadd double %68, %71, !dbg !905
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !134), !dbg !905
  %73 = fsub double %61, %63, !dbg !906
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !135), !dbg !906
  %74 = fsub double %68, %71, !dbg !907
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !136), !dbg !907
  %75 = getelementptr inbounds double* %a, i64 %58, !dbg !908
  %76 = load double* %75, align 8, !dbg !908, !tbaa !243
  %77 = getelementptr inbounds double* %a, i64 %59, !dbg !908
  %78 = load double* %77, align 8, !dbg !908, !tbaa !243
  %79 = fadd double %76, %78, !dbg !908
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !137), !dbg !908
  %80 = add nsw i64 %58, 1, !dbg !909
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !909
  %82 = load double* %81, align 8, !dbg !909, !tbaa !243
  %83 = add nsw i64 %59, 1, !dbg !909
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !909
  %85 = load double* %84, align 8, !dbg !909, !tbaa !243
  %86 = fadd double %82, %85, !dbg !909
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !138), !dbg !909
  %87 = fsub double %76, %78, !dbg !910
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !139), !dbg !910
  %88 = fsub double %82, %85, !dbg !911
  tail call void @llvm.dbg.value(metadata !{double %88}, i64 0, metadata !140), !dbg !911
  %89 = fadd double %64, %79, !dbg !912
  store double %89, double* %60, align 8, !dbg !912, !tbaa !243
  %90 = fadd double %72, %86, !dbg !913
  store double %90, double* %67, align 8, !dbg !913, !tbaa !243
  %91 = fsub double %86, %72, !dbg !914
  store double %91, double* %75, align 8, !dbg !914, !tbaa !243
  %92 = fsub double %64, %79, !dbg !915
  store double %92, double* %81, align 8, !dbg !915, !tbaa !243
  %93 = fsub double %73, %88, !dbg !916
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !133), !dbg !916
  %94 = fadd double %74, %87, !dbg !917
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !134), !dbg !917
  %95 = fsub double %93, %94, !dbg !899
  %96 = fadd double %94, %93, !dbg !918
  %97 = insertelement <2 x double> undef, double %95, i32 0, !dbg !899
  %98 = insertelement <2 x double> %97, double %96, i32 1, !dbg !899
  %99 = fmul <2 x double> %98, %55, !dbg !899
  %100 = bitcast double* %62 to <2 x double>*, !dbg !899
  store <2 x double> %99, <2 x double>* %100, align 8, !dbg !899, !tbaa !243
  %101 = fadd double %73, %88, !dbg !919
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !133), !dbg !919
  %102 = fsub double %87, %74, !dbg !920
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !134), !dbg !920
  %103 = fsub double %102, %101, !dbg !921
  %104 = fmul double %49, %103, !dbg !921
  store double %104, double* %77, align 8, !dbg !921, !tbaa !243
  %105 = fadd double %102, %101, !dbg !922
  %106 = fmul double %49, %105, !dbg !922
  store double %106, double* %84, align 8, !dbg !922, !tbaa !243
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 2, !dbg !897
  %107 = add nsw i32 %j.111, 2, !dbg !897
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !118), !dbg !897
  %108 = trunc i64 %indvars.iv.next26 to i32, !dbg !897
  %109 = icmp slt i32 %108, %50, !dbg !897
  br i1 %109, label %56, label %._crit_edge14, !dbg !897

._crit_edge14:                                    ; preds = %56, %0, %._crit_edge18
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !123), !dbg !923
  %110 = shl i32 %l, 3, !dbg !924
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !126), !dbg !924
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !122), !dbg !925
  %111 = icmp slt i32 %110, %n, !dbg !925
  br i1 %111, label %.lr.ph9, label %._crit_edge10, !dbg !925

.lr.ph9:                                          ; preds = %._crit_edge14
  %112 = shl i32 %l, 3, !dbg !925
  %113 = sext i32 %112 to i64
  %114 = sext i32 %l to i64, !dbg !925
  %115 = mul i32 %l, 12, !dbg !925
  br label %116, !dbg !925

; <label>:116                                     ; preds = %.lr.ph9, %._crit_edge5
  %indvars.iv21 = phi i32 [ %115, %.lr.ph9 ], [ %indvars.iv.next22, %._crit_edge5 ]
  %indvars.iv = phi i64 [ %113, %.lr.ph9 ], [ %indvars.iv.next, %._crit_edge5 ]
  %k.07 = phi i32 [ %110, %.lr.ph9 ], [ %283, %._crit_edge5 ]
  %k1.06 = phi i32 [ 2, %.lr.ph9 ], [ %phitmp, %._crit_edge5 ]
  tail call void @llvm.dbg.value(metadata !{i32 %k1.06}, i64 0, metadata !123), !dbg !927
  %117 = sext i32 %indvars.iv21 to i64
  %118 = shl nsw i32 %k1.06, 1, !dbg !929
  tail call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !124), !dbg !929
  %119 = sext i32 %k1.06 to i64, !dbg !930
  %120 = getelementptr inbounds double* %w, i64 %119, !dbg !930
  %121 = load double* %120, align 8, !dbg !930, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %121}, i64 0, metadata !129), !dbg !930
  %122 = or i32 %k1.06, 1, !dbg !931
  %123 = sext i32 %122 to i64, !dbg !931
  %124 = getelementptr inbounds double* %w, i64 %123, !dbg !931
  %125 = load double* %124, align 8, !dbg !931, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !130), !dbg !931
  %126 = sext i32 %118 to i64, !dbg !932
  %127 = getelementptr inbounds double* %w, i64 %126, !dbg !932
  %128 = load double* %127, align 8, !dbg !932, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !127), !dbg !932
  %129 = or i32 %118, 1, !dbg !933
  %130 = sext i32 %129 to i64, !dbg !933
  %131 = getelementptr inbounds double* %w, i64 %130, !dbg !933
  %132 = load double* %131, align 8, !dbg !933, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %132}, i64 0, metadata !128), !dbg !933
  %133 = fmul double %125, 2.000000e+00, !dbg !934
  %134 = fmul double %133, %132, !dbg !934
  %135 = fsub double %128, %134, !dbg !934
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !131), !dbg !934
  %136 = fmul double %133, %128, !dbg !935
  %137 = fsub double %136, %132, !dbg !935
  tail call void @llvm.dbg.value(metadata !{double %137}, i64 0, metadata !132), !dbg !935
  tail call void @llvm.dbg.value(metadata !{i32 %k.07}, i64 0, metadata !118), !dbg !936
  %138 = add nsw i32 %k.07, %l, !dbg !936
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !936

.lr.ph:                                           ; preds = %116, %.lr.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.lr.ph ], [ %indvars.iv, %116 ]
  %j.21 = phi i32 [ %197, %.lr.ph ], [ %k.07, %116 ]
  %139 = add nsw i64 %indvars.iv19, %114, !dbg !938
  %140 = add nsw i64 %139, %114, !dbg !940
  %141 = add nsw i64 %140, %114, !dbg !941
  %142 = getelementptr inbounds double* %a, i64 %indvars.iv19, !dbg !942
  %143 = load double* %142, align 8, !dbg !942, !tbaa !243
  %144 = getelementptr inbounds double* %a, i64 %139, !dbg !942
  %145 = load double* %144, align 8, !dbg !942, !tbaa !243
  %146 = fadd double %143, %145, !dbg !942
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !133), !dbg !942
  %147 = or i32 %j.21, 1, !dbg !943
  %148 = sext i32 %147 to i64, !dbg !943
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !943
  %150 = load double* %149, align 8, !dbg !943, !tbaa !243
  %151 = add nsw i64 %139, 1, !dbg !943
  %152 = getelementptr inbounds double* %a, i64 %151, !dbg !943
  %153 = load double* %152, align 8, !dbg !943, !tbaa !243
  %154 = fadd double %150, %153, !dbg !943
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !134), !dbg !943
  %155 = fsub double %143, %145, !dbg !944
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !135), !dbg !944
  %156 = fsub double %150, %153, !dbg !945
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !136), !dbg !945
  %157 = getelementptr inbounds double* %a, i64 %140, !dbg !946
  %158 = load double* %157, align 8, !dbg !946, !tbaa !243
  %159 = getelementptr inbounds double* %a, i64 %141, !dbg !946
  %160 = load double* %159, align 8, !dbg !946, !tbaa !243
  %161 = fadd double %158, %160, !dbg !946
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !137), !dbg !946
  %162 = add nsw i64 %140, 1, !dbg !947
  %163 = getelementptr inbounds double* %a, i64 %162, !dbg !947
  %164 = load double* %163, align 8, !dbg !947, !tbaa !243
  %165 = add nsw i64 %141, 1, !dbg !947
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !947
  %167 = load double* %166, align 8, !dbg !947, !tbaa !243
  %168 = fadd double %164, %167, !dbg !947
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !138), !dbg !947
  %169 = fsub double %158, %160, !dbg !948
  tail call void @llvm.dbg.value(metadata !{double %169}, i64 0, metadata !139), !dbg !948
  %170 = fsub double %164, %167, !dbg !949
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !140), !dbg !949
  %171 = fadd double %146, %161, !dbg !950
  store double %171, double* %142, align 8, !dbg !950, !tbaa !243
  %172 = fadd double %154, %168, !dbg !951
  store double %172, double* %149, align 8, !dbg !951, !tbaa !243
  %173 = fsub double %146, %161, !dbg !952
  tail call void @llvm.dbg.value(metadata !{double %173}, i64 0, metadata !133), !dbg !952
  %174 = fsub double %154, %168, !dbg !953
  tail call void @llvm.dbg.value(metadata !{double %174}, i64 0, metadata !134), !dbg !953
  %175 = fmul double %121, %173, !dbg !954
  %176 = fmul double %125, %174, !dbg !954
  %177 = fsub double %175, %176, !dbg !954
  store double %177, double* %157, align 8, !dbg !954, !tbaa !243
  %178 = fmul double %121, %174, !dbg !955
  %179 = fmul double %125, %173, !dbg !955
  %180 = fadd double %179, %178, !dbg !955
  store double %180, double* %163, align 8, !dbg !955, !tbaa !243
  %181 = fsub double %155, %170, !dbg !956
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !133), !dbg !956
  %182 = fadd double %156, %169, !dbg !957
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !134), !dbg !957
  %183 = fmul double %128, %181, !dbg !958
  %184 = fmul double %132, %182, !dbg !958
  %185 = fsub double %183, %184, !dbg !958
  store double %185, double* %144, align 8, !dbg !958, !tbaa !243
  %186 = fmul double %128, %182, !dbg !959
  %187 = fmul double %132, %181, !dbg !959
  %188 = fadd double %186, %187, !dbg !959
  store double %188, double* %152, align 8, !dbg !959, !tbaa !243
  %189 = fadd double %155, %170, !dbg !960
  tail call void @llvm.dbg.value(metadata !{double %189}, i64 0, metadata !133), !dbg !960
  %190 = fsub double %156, %169, !dbg !961
  tail call void @llvm.dbg.value(metadata !{double %190}, i64 0, metadata !134), !dbg !961
  %191 = fmul double %135, %189, !dbg !962
  %192 = fmul double %137, %190, !dbg !962
  %193 = fsub double %191, %192, !dbg !962
  store double %193, double* %159, align 8, !dbg !962, !tbaa !243
  %194 = fmul double %135, %190, !dbg !963
  %195 = fmul double %137, %189, !dbg !963
  %196 = fadd double %194, %195, !dbg !963
  store double %196, double* %166, align 8, !dbg !963, !tbaa !243
  %197 = add nsw i32 %j.21, 2, !dbg !936
  tail call void @llvm.dbg.value(metadata !{i32 %197}, i64 0, metadata !118), !dbg !936
  %198 = icmp slt i32 %197, %138, !dbg !936
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 2, !dbg !936
  br i1 %198, label %.lr.ph, label %._crit_edge, !dbg !936

._crit_edge:                                      ; preds = %.lr.ph, %116
  %199 = or i32 %118, 2, !dbg !964
  %200 = sext i32 %199 to i64, !dbg !964
  %201 = getelementptr inbounds double* %w, i64 %200, !dbg !964
  %202 = load double* %201, align 8, !dbg !964, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %202}, i64 0, metadata !127), !dbg !964
  %203 = or i32 %118, 3, !dbg !965
  %204 = sext i32 %203 to i64, !dbg !965
  %205 = getelementptr inbounds double* %w, i64 %204, !dbg !965
  %206 = load double* %205, align 8, !dbg !965, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !128), !dbg !965
  %207 = fmul double %121, 2.000000e+00, !dbg !966
  %208 = fmul double %207, %206, !dbg !966
  %209 = fsub double %202, %208, !dbg !966
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !131), !dbg !966
  %210 = fmul double %207, %202, !dbg !967
  %211 = fsub double %210, %206, !dbg !967
  tail call void @llvm.dbg.value(metadata !{double %211}, i64 0, metadata !132), !dbg !967
  %212 = add nsw i32 %k.07, %1, !dbg !968
  tail call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !118), !dbg !968
  %213 = add nsw i32 %212, %l, !dbg !968
  br i1 %2, label %.lr.ph4, label %._crit_edge5, !dbg !968

.lr.ph4:                                          ; preds = %._crit_edge
  %214 = fsub double -0.000000e+00, %125, !dbg !970
  br label %215, !dbg !968

; <label>:215                                     ; preds = %.lr.ph4, %215
  %indvars.iv23 = phi i64 [ %117, %.lr.ph4 ], [ %indvars.iv.next24, %215 ]
  %j.32 = phi i32 [ %212, %.lr.ph4 ], [ %281, %215 ]
  %216 = add nsw i64 %indvars.iv23, %114, !dbg !972
  %217 = add nsw i64 %216, %114, !dbg !973
  %218 = add nsw i64 %217, %114, !dbg !974
  %219 = getelementptr inbounds double* %a, i64 %indvars.iv23, !dbg !975
  %220 = getelementptr inbounds double* %a, i64 %216, !dbg !975
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !133), !dbg !975
  %221 = bitcast double* %219 to <2 x double>*, !dbg !975
  %222 = load <2 x double>* %221, align 8, !dbg !975, !tbaa !243
  %223 = add nsw i64 %216, 1, !dbg !976
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !976
  %225 = bitcast double* %220 to <2 x double>*, !dbg !975
  %226 = load <2 x double>* %225, align 8, !dbg !975, !tbaa !243
  %227 = fadd <2 x double> %222, %226, !dbg !975
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !134), !dbg !976
  %228 = extractelement <2 x double> %222, i32 0, !dbg !977
  %229 = extractelement <2 x double> %226, i32 0, !dbg !977
  %230 = fsub double %228, %229, !dbg !977
  tail call void @llvm.dbg.value(metadata !{double %230}, i64 0, metadata !135), !dbg !977
  %231 = extractelement <2 x double> %222, i32 1, !dbg !978
  %232 = extractelement <2 x double> %226, i32 1, !dbg !978
  %233 = fsub double %231, %232, !dbg !978
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !136), !dbg !978
  %234 = getelementptr inbounds double* %a, i64 %217, !dbg !979
  %235 = load double* %234, align 8, !dbg !979, !tbaa !243
  %236 = getelementptr inbounds double* %a, i64 %218, !dbg !979
  %237 = load double* %236, align 8, !dbg !979, !tbaa !243
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !137), !dbg !979
  %238 = add nsw i64 %217, 1, !dbg !980
  %239 = getelementptr inbounds double* %a, i64 %238, !dbg !980
  %240 = load double* %239, align 8, !dbg !980, !tbaa !243
  %241 = add nsw i64 %218, 1, !dbg !980
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !980
  %243 = load double* %242, align 8, !dbg !980, !tbaa !243
  %244 = insertelement <2 x double> undef, double %235, i32 0, !dbg !979
  %245 = insertelement <2 x double> %244, double %240, i32 1, !dbg !979
  %246 = insertelement <2 x double> undef, double %237, i32 0, !dbg !979
  %247 = insertelement <2 x double> %246, double %243, i32 1, !dbg !979
  %248 = fadd <2 x double> %245, %247, !dbg !979
  tail call void @llvm.dbg.value(metadata !595, i64 0, metadata !138), !dbg !980
  %249 = fsub double %235, %237, !dbg !981
  tail call void @llvm.dbg.value(metadata !{double %249}, i64 0, metadata !139), !dbg !981
  %250 = fsub double %240, %243, !dbg !982
  tail call void @llvm.dbg.value(metadata !{double %250}, i64 0, metadata !140), !dbg !982
  %251 = fadd <2 x double> %227, %248, !dbg !983
  %252 = bitcast double* %219 to <2 x double>*, !dbg !983
  store <2 x double> %251, <2 x double>* %252, align 8, !dbg !983, !tbaa !243
  %253 = extractelement <2 x double> %227, i32 0, !dbg !984
  %254 = extractelement <2 x double> %248, i32 0, !dbg !984
  %255 = fsub double %253, %254, !dbg !984
  tail call void @llvm.dbg.value(metadata !{double %255}, i64 0, metadata !133), !dbg !984
  %256 = extractelement <2 x double> %227, i32 1, !dbg !985
  %257 = extractelement <2 x double> %248, i32 1, !dbg !985
  %258 = fsub double %256, %257, !dbg !985
  tail call void @llvm.dbg.value(metadata !{double %258}, i64 0, metadata !134), !dbg !985
  %259 = fmul double %255, %214, !dbg !970
  %260 = fmul double %121, %258, !dbg !970
  %261 = fsub double %259, %260, !dbg !970
  store double %261, double* %234, align 8, !dbg !970, !tbaa !243
  %262 = fmul double %258, %214, !dbg !986
  %263 = fmul double %121, %255, !dbg !986
  %264 = fadd double %263, %262, !dbg !986
  store double %264, double* %239, align 8, !dbg !986, !tbaa !243
  %265 = fsub double %230, %250, !dbg !987
  tail call void @llvm.dbg.value(metadata !{double %265}, i64 0, metadata !133), !dbg !987
  %266 = fadd double %233, %249, !dbg !988
  tail call void @llvm.dbg.value(metadata !{double %266}, i64 0, metadata !134), !dbg !988
  %267 = fmul double %202, %265, !dbg !989
  %268 = fmul double %206, %266, !dbg !989
  %269 = fsub double %267, %268, !dbg !989
  store double %269, double* %220, align 8, !dbg !989, !tbaa !243
  %270 = fmul double %202, %266, !dbg !990
  %271 = fmul double %206, %265, !dbg !990
  %272 = fadd double %270, %271, !dbg !990
  store double %272, double* %224, align 8, !dbg !990, !tbaa !243
  %273 = fadd double %230, %250, !dbg !991
  tail call void @llvm.dbg.value(metadata !{double %273}, i64 0, metadata !133), !dbg !991
  %274 = fsub double %233, %249, !dbg !992
  tail call void @llvm.dbg.value(metadata !{double %274}, i64 0, metadata !134), !dbg !992
  %275 = fmul double %209, %273, !dbg !993
  %276 = fmul double %211, %274, !dbg !993
  %277 = fsub double %275, %276, !dbg !993
  store double %277, double* %236, align 8, !dbg !993, !tbaa !243
  %278 = fmul double %209, %274, !dbg !994
  %279 = fmul double %211, %273, !dbg !994
  %280 = fadd double %278, %279, !dbg !994
  store double %280, double* %242, align 8, !dbg !994, !tbaa !243
  %281 = add nsw i32 %j.32, 2, !dbg !968
  tail call void @llvm.dbg.value(metadata !{i32 %281}, i64 0, metadata !118), !dbg !968
  %282 = icmp slt i32 %281, %213, !dbg !968
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 2, !dbg !968
  br i1 %282, label %215, label %._crit_edge5, !dbg !968

._crit_edge5:                                     ; preds = %215, %._crit_edge
  %283 = add nsw i32 %k.07, %110, !dbg !925
  tail call void @llvm.dbg.value(metadata !{i32 %283}, i64 0, metadata !122), !dbg !925
  %phitmp = add i32 %k1.06, 2, !dbg !925
  %284 = icmp slt i32 %283, %n, !dbg !925
  %indvars.iv.next = add nsw i64 %indvars.iv, %113, !dbg !925
  %indvars.iv.next22 = add i32 %indvars.iv21, %112, !dbg !925
  br i1 %284, label %116, label %._crit_edge10, !dbg !925

._crit_edge10:                                    ; preds = %._crit_edge5, %._crit_edge14
  ret void, !dbg !995
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

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
!228 = metadata !{i32 512}
!229 = metadata !{i32 786689, metadata !78, metadata !"nw", metadata !5, i32 16777409, metadata !8, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [nw] [line 193]
!230 = metadata !{i32 47, i32 0, metadata !4, null}
!231 = metadata !{i32 193, i32 0, metadata !78, metadata !230}
!232 = metadata !{i32 786689, metadata !78, metadata !"ip", metadata !5, i32 33554625, metadata !13, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [ip] [line 193]
!233 = metadata !{i32 786689, metadata !78, metadata !"w", metadata !5, i32 50331841, metadata !15, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [w] [line 193]
!234 = metadata !{i32 256}
!235 = metadata !{i32 786688, metadata !78, metadata !"nwh", metadata !5, i32 195, metadata !8, i32 0, metadata !230} ; [ DW_TAG_auto_variable ] [nwh] [line 195]
!236 = metadata !{i32 199, i32 0, metadata !237, metadata !230}
!237 = metadata !{i32 786443, metadata !1, metadata !238, i32 198, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!238 = metadata !{i32 786443, metadata !1, metadata !78, i32 198, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!239 = metadata !{double 0x3F6921FB54442D18}
!240 = metadata !{i32 786688, metadata !78, metadata !"delta", metadata !5, i32 196, metadata !16, i32 0, metadata !230} ; [ DW_TAG_auto_variable ] [delta] [line 196]
!241 = metadata !{i32 200, i32 0, metadata !237, metadata !230}
!242 = metadata !{i32 201, i32 0, metadata !237, metadata !230}
!243 = metadata !{metadata !244, metadata !244, i64 0}
!244 = metadata !{metadata !"double", metadata !245, i64 0}
!245 = metadata !{metadata !"omnipotent char", metadata !246, i64 0}
!246 = metadata !{metadata !"Simple C/C++ TBAA"}
!247 = metadata !{i32 202, i32 0, metadata !237, metadata !230}
!248 = metadata !{i32 203, i32 0, metadata !237, metadata !230}
!249 = metadata !{i32 204, i32 0, metadata !237, metadata !230}
!250 = metadata !{i32 207, i32 0, metadata !251, metadata !230}
!251 = metadata !{i32 786443, metadata !1, metadata !252, i32 206, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!252 = metadata !{i32 786443, metadata !1, metadata !253, i32 206, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!253 = metadata !{i32 786443, metadata !1, metadata !254, i32 205, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!254 = metadata !{i32 786443, metadata !1, metadata !237, i32 205, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!255 = metadata !{i32 786688, metadata !78, metadata !"x", metadata !5, i32 196, metadata !16, i32 0, metadata !230} ; [ DW_TAG_auto_variable ] [x] [line 196]
!256 = metadata !{i32 208, i32 0, metadata !251, metadata !230}
!257 = metadata !{i32 786688, metadata !78, metadata !"y", metadata !5, i32 196, metadata !16, i32 0, metadata !230} ; [ DW_TAG_auto_variable ] [y] [line 196]
!258 = metadata !{i32 209, i32 0, metadata !251, metadata !230}
!259 = metadata !{i32 210, i32 0, metadata !251, metadata !230}
!260 = metadata !{i32 211, i32 0, metadata !251, metadata !230}
!261 = metadata !{i32 212, i32 0, metadata !251, metadata !230}
!262 = metadata !{i32 206, i32 0, metadata !252, metadata !230}
!263 = metadata !{i32 214, i32 0, metadata !253, metadata !230}
!264 = metadata !{i32 51, i32 0, metadata !4, null}
!265 = metadata !{i32 52, i32 0, metadata !4, null}
!266 = metadata !{i32 53, i32 0, metadata !4, null}
!267 = metadata !{i32 0}
!268 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!269 = metadata !{i32 61, i32 0, metadata !4, null}
!270 = metadata !{i32 119, i32 0, metadata !34, metadata !269}
!271 = metadata !{i32 2047}
!272 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!273 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [a] [line 119]
!274 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !269} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!275 = metadata !{i32 121, i32 0, metadata !34, metadata !269}
!276 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !269} ; [ DW_TAG_auto_variable ] [j] [line 121]
!277 = metadata !{i32 123, i32 0, metadata !278, metadata !269}
!278 = metadata !{i32 786443, metadata !1, metadata !34, i32 123, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!279 = metadata !{i32 124, i32 0, metadata !278, metadata !269}
!280 = metadata !{i32 2048}
!281 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !282} ; [ DW_TAG_arg_variable ] [n] [line 174]
!282 = metadata !{i32 62, i32 0, metadata !4, null}
!283 = metadata !{i32 174, i32 0, metadata !69, metadata !282}
!284 = metadata !{i32 1}
!285 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !282} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!286 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !282} ; [ DW_TAG_arg_variable ] [a] [line 174]
!287 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !282} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!288 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !282} ; [ DW_TAG_arg_variable ] [w] [line 174]
!289 = metadata !{i32 178, i32 0, metadata !290, metadata !282}
!290 = metadata !{i32 786443, metadata !1, metadata !291, i32 177, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!291 = metadata !{i32 786443, metadata !1, metadata !292, i32 177, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!292 = metadata !{i32 786443, metadata !1, metadata !293, i32 176, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!293 = metadata !{i32 786443, metadata !1, metadata !69, i32 176, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!294 = metadata !{i32 179, i32 0, metadata !290, metadata !282}
!295 = metadata !{i32 63, i32 0, metadata !4, null}
!296 = metadata !{i32 786689, metadata !43, metadata !"nini", metadata !5, i32 16777343, metadata !8, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [nini] [line 127]
!297 = metadata !{i32 64, i32 0, metadata !4, null}
!298 = metadata !{i32 127, i32 0, metadata !43, metadata !297}
!299 = metadata !{i32 786689, metadata !43, metadata !"nend", metadata !5, i32 33554559, metadata !8, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [nend] [line 127]
!300 = metadata !{double 9.765625e-04}
!301 = metadata !{i32 786689, metadata !43, metadata !"scale", metadata !5, i32 50331775, metadata !16, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [scale] [line 127]
!302 = metadata !{i32 786689, metadata !43, metadata !"a", metadata !5, i32 67108991, metadata !15, i32 0, metadata !297} ; [ DW_TAG_arg_variable ] [a] [line 127]
!303 = metadata !{i32 786688, metadata !43, metadata !"seed", metadata !5, i32 129, metadata !8, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [seed] [line 129]
!304 = metadata !{i32 129, i32 0, metadata !43, metadata !297}
!305 = metadata !{i32 786688, metadata !43, metadata !"err", metadata !5, i32 130, metadata !16, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [err] [line 130]
!306 = metadata !{i32 130, i32 0, metadata !43, metadata !297}
!307 = metadata !{i32 786688, metadata !43, metadata !"j", metadata !5, i32 129, metadata !8, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [j] [line 129]
!308 = metadata !{i32 132, i32 0, metadata !309, metadata !297}
!309 = metadata !{i32 786443, metadata !1, metadata !43, i32 132, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!310 = metadata !{i32 133, i32 0, metadata !311, metadata !297}
!311 = metadata !{i32 786443, metadata !1, metadata !309, i32 132, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!312 = metadata !{i32 786688, metadata !43, metadata !"e", metadata !5, i32 130, metadata !16, i32 0, metadata !297} ; [ DW_TAG_auto_variable ] [e] [line 130]
!313 = metadata !{i32 134, i32 0, metadata !311, metadata !297}
!314 = metadata !{i32 65, i32 0, metadata !315, null}
!315 = metadata !{i32 786443, metadata !1, metadata !4, i32 65, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!316 = metadata !{i32 66, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !315, i32 65, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!318 = metadata !{i32 67, i32 0, metadata !317, null}
!319 = metadata !{i32 71, i32 0, metadata !4, null}
!320 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!321 = metadata !{i32 72, i32 0, metadata !4, null}
!322 = metadata !{i32 119, i32 0, metadata !34, metadata !321}
!323 = metadata !{i32 1023}
!324 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!325 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !321} ; [ DW_TAG_arg_variable ] [a] [line 119]
!326 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !321} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!327 = metadata !{i32 121, i32 0, metadata !34, metadata !321}
!328 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !321} ; [ DW_TAG_auto_variable ] [j] [line 121]
!329 = metadata !{i32 123, i32 0, metadata !278, metadata !321}
!330 = metadata !{i32 124, i32 0, metadata !278, metadata !321}
!331 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [n] [line 174]
!332 = metadata !{i32 73, i32 0, metadata !4, null}
!333 = metadata !{i32 174, i32 0, metadata !69, metadata !332}
!334 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!335 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [a] [line 174]
!336 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!337 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !332} ; [ DW_TAG_arg_variable ] [w] [line 174]
!338 = metadata !{i32 178, i32 0, metadata !290, metadata !332}
!339 = metadata !{i32 179, i32 0, metadata !290, metadata !332}
!340 = metadata !{i32 74, i32 0, metadata !341, null}
!341 = metadata !{i32 786443, metadata !1, metadata !4, i32 74, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!342 = metadata !{i32 75, i32 0, metadata !341, null}
!343 = metadata !{i32 78, i32 0, metadata !4, null}
!344 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!345 = metadata !{i32 79, i32 0, metadata !4, null}
!346 = metadata !{i32 119, i32 0, metadata !34, metadata !345}
!347 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!348 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !345} ; [ DW_TAG_arg_variable ] [a] [line 119]
!349 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!350 = metadata !{i32 121, i32 0, metadata !34, metadata !345}
!351 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !345} ; [ DW_TAG_auto_variable ] [j] [line 121]
!352 = metadata !{i32 123, i32 0, metadata !278, metadata !345}
!353 = metadata !{i32 124, i32 0, metadata !278, metadata !345}
!354 = metadata !{i32 158, i32 0, metadata !55, metadata !355}
!355 = metadata !{i32 81, i32 0, metadata !4, null}
!356 = metadata !{i32 160, i32 0, metadata !55, metadata !355}
!357 = metadata !{i32 161, i32 0, metadata !55, metadata !355}
!358 = metadata !{i32 82, i32 0, metadata !27, null}
!359 = metadata !{i32 85, i32 0, metadata !26, null}
!360 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !361} ; [ DW_TAG_arg_variable ] [n] [line 174]
!361 = metadata !{i32 86, i32 0, metadata !26, null}
!362 = metadata !{i32 174, i32 0, metadata !69, metadata !361}
!363 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !361} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!364 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !361} ; [ DW_TAG_arg_variable ] [a] [line 174]
!365 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !361} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!366 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !361} ; [ DW_TAG_arg_variable ] [w] [line 174]
!367 = metadata !{i32 178, i32 0, metadata !290, metadata !361}
!368 = metadata !{i32 179, i32 0, metadata !290, metadata !361}
!369 = metadata !{i32 88, i32 0, metadata !30, null}
!370 = metadata !{i32 89, i32 0, metadata !29, null}
!371 = metadata !{i32 90, i32 0, metadata !29, null}
!372 = metadata !{i32 91, i32 0, metadata !29, null}
!373 = metadata !{i32 92, i32 0, metadata !29, null}
!374 = metadata !{i32 93, i32 0, metadata !29, null}
!375 = metadata !{i32 94, i32 0, metadata !29, null}
!376 = metadata !{i32 97, i32 0, metadata !26, null}
!377 = metadata !{i32 158, i32 0, metadata !55, metadata !378}
!378 = metadata !{i32 99, i32 0, metadata !4, null}
!379 = metadata !{i32 160, i32 0, metadata !55, metadata !378}
!380 = metadata !{i32 161, i32 0, metadata !55, metadata !378}
!381 = metadata !{i32 102, i32 0, metadata !382, null}
!382 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!383 = metadata !{i32 104, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !1, metadata !382, i32 102, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!385 = metadata !{i32 105, i32 0, metadata !384, null}
!386 = metadata !{i32 103, i32 0, metadata !384, null}
!387 = metadata !{i32 109, i32 0, metadata !4, null}
!388 = metadata !{i32 110, i32 0, metadata !4, null}
!389 = metadata !{i32 111, i32 0, metadata !4, null}
!390 = metadata !{i32 113, i32 0, metadata !4, null}
!391 = metadata !{i32 114, i32 0, metadata !4, null}
!392 = metadata !{i32 116, i32 0, metadata !4, null}
!393 = metadata !{i32 158, i32 0, metadata !55, null}
!394 = metadata !{i32 160, i32 0, metadata !55, null}
!395 = metadata !{i32 161, i32 0, metadata !55, null}
!396 = metadata !{metadata !397, metadata !398, i64 0}
!397 = metadata !{metadata !"timeval", metadata !398, i64 0, metadata !398, i64 8}
!398 = metadata !{metadata !"long", metadata !245, i64 0}
!399 = metadata !{metadata !397, metadata !398, i64 8}
!400 = metadata !{i32 193, i32 0, metadata !78, null}
!401 = metadata !{i32 198, i32 0, metadata !238, null}
!402 = metadata !{i32 199, i32 0, metadata !237, null}
!403 = metadata !{i32 200, i32 0, metadata !237, null}
!404 = metadata !{i32 201, i32 0, metadata !237, null}
!405 = metadata !{i32 202, i32 0, metadata !237, null}
!406 = metadata !{i32 203, i32 0, metadata !237, null}
!407 = metadata !{i32 204, i32 0, metadata !237, null}
!408 = metadata !{i32 205, i32 0, metadata !254, null}
!409 = metadata !{i32 207, i32 0, metadata !251, null}
!410 = metadata !{i32 208, i32 0, metadata !251, null}
!411 = metadata !{i32 209, i32 0, metadata !251, null}
!412 = metadata !{i32 210, i32 0, metadata !251, null}
!413 = metadata !{i32 211, i32 0, metadata !251, null}
!414 = metadata !{i32 212, i32 0, metadata !251, null}
!415 = metadata !{i32 206, i32 0, metadata !252, null}
!416 = metadata !{i32 214, i32 0, metadata !253, null}
!417 = metadata !{i32 215, i32 0, metadata !253, null}
!418 = metadata !{i32 217, i32 0, metadata !78, null}
!419 = metadata !{i32 119, i32 0, metadata !34, null}
!420 = metadata !{i32 121, i32 0, metadata !34, null}
!421 = metadata !{i32 123, i32 0, metadata !278, null}
!422 = metadata !{i32 124, i32 0, metadata !278, null}
!423 = metadata !{i32 125, i32 0, metadata !34, null}
!424 = metadata !{i32 174, i32 0, metadata !69, null}
!425 = metadata !{i32 176, i32 0, metadata !293, null}
!426 = metadata !{i32 177, i32 0, metadata !291, null}
!427 = metadata !{i32 178, i32 0, metadata !290, null}
!428 = metadata !{i32 179, i32 0, metadata !290, null}
!429 = metadata !{i32 180, i32 0, metadata !290, null}
!430 = metadata !{i32 786689, metadata !181, metadata !"n", metadata !5, i32 16777537, metadata !8, i32 0, metadata !431} ; [ DW_TAG_arg_variable ] [n] [line 321]
!431 = metadata !{i32 181, i32 0, metadata !432, null}
!432 = metadata !{i32 786443, metadata !1, metadata !291, i32 180, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!433 = metadata !{i32 321, i32 0, metadata !181, metadata !431}
!434 = metadata !{i32 786689, metadata !181, metadata !"ip", metadata !5, i32 33554753, metadata !13, i32 0, metadata !431} ; [ DW_TAG_arg_variable ] [ip] [line 321]
!435 = metadata !{i32 786689, metadata !181, metadata !"a", metadata !5, i32 50331969, metadata !15, i32 0, metadata !431} ; [ DW_TAG_arg_variable ] [a] [line 321]
!436 = metadata !{i32 326, i32 0, metadata !181, metadata !431}
!437 = metadata !{metadata !438, metadata !438, i64 0}
!438 = metadata !{metadata !"int", metadata !245, i64 0}
!439 = metadata !{i32 786688, metadata !181, metadata !"l", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [l] [line 323]
!440 = metadata !{i32 327, i32 0, metadata !181, metadata !431}
!441 = metadata !{i32 786688, metadata !181, metadata !"m", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [m] [line 323]
!442 = metadata !{i32 328, i32 0, metadata !181, metadata !431}
!443 = metadata !{i32 329, i32 0, metadata !181, metadata !431}
!444 = metadata !{i32 330, i32 0, metadata !445, metadata !431}
!445 = metadata !{i32 786443, metadata !1, metadata !181, i32 329, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!446 = metadata !{i32 786688, metadata !181, metadata !"j", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [j] [line 323]
!447 = metadata !{i32 331, i32 0, metadata !448, metadata !431}
!448 = metadata !{i32 786443, metadata !1, metadata !445, i32 331, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!449 = metadata !{i32 332, i32 0, metadata !450, metadata !431}
!450 = metadata !{i32 786443, metadata !1, metadata !448, i32 331, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!451 = metadata !{metadata !451, metadata !452, metadata !453}
!452 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!453 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!454 = metadata !{metadata !454, metadata !452, metadata !453}
!455 = metadata !{i32 334, i32 0, metadata !445, metadata !431}
!456 = metadata !{i32 336, i32 0, metadata !181, metadata !431}
!457 = metadata !{i32 786688, metadata !181, metadata !"m2", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [m2] [line 323]
!458 = metadata !{i32 337, i32 0, metadata !459, metadata !431}
!459 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!460 = metadata !{i32 338, i32 0, metadata !461, metadata !431}
!461 = metadata !{i32 786443, metadata !1, metadata !462, i32 338, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!462 = metadata !{i32 786443, metadata !1, metadata !459, i32 337, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!463 = metadata !{i32 393, i32 0, metadata !464, metadata !431}
!464 = metadata !{i32 786443, metadata !1, metadata !461, i32 338, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!465 = metadata !{i32 351, i32 0, metadata !466, metadata !431}
!466 = metadata !{i32 786443, metadata !1, metadata !467, i32 339, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!467 = metadata !{i32 786443, metadata !1, metadata !464, i32 339, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!468 = metadata !{i32 339, i32 0, metadata !467, metadata !431}
!469 = metadata !{i32 340, i32 0, metadata !466, metadata !431}
!470 = metadata !{i32 341, i32 0, metadata !466, metadata !431}
!471 = metadata !{i32 786688, metadata !181, metadata !"j1", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [j1] [line 323]
!472 = metadata !{i32 786688, metadata !181, metadata !"k1", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [k1] [line 323]
!473 = metadata !{i32 342, i32 0, metadata !466, metadata !431}
!474 = metadata !{i32 786688, metadata !181, metadata !"xr", metadata !5, i32 324, metadata !16, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [xr] [line 324]
!475 = metadata !{i32 343, i32 0, metadata !466, metadata !431}
!476 = metadata !{i32 786688, metadata !181, metadata !"xi", metadata !5, i32 324, metadata !16, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [xi] [line 324]
!477 = metadata !{i32 344, i32 0, metadata !466, metadata !431}
!478 = metadata !{i32 786688, metadata !181, metadata !"yr", metadata !5, i32 324, metadata !16, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [yr] [line 324]
!479 = metadata !{i32 345, i32 0, metadata !466, metadata !431}
!480 = metadata !{i32 786688, metadata !181, metadata !"yi", metadata !5, i32 324, metadata !16, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [yi] [line 324]
!481 = metadata !{i32 346, i32 0, metadata !466, metadata !431}
!482 = metadata !{i32 347, i32 0, metadata !466, metadata !431}
!483 = metadata !{i32 348, i32 0, metadata !466, metadata !431}
!484 = metadata !{i32 349, i32 0, metadata !466, metadata !431}
!485 = metadata !{i32 350, i32 0, metadata !466, metadata !431}
!486 = metadata !{i32 352, i32 0, metadata !466, metadata !431}
!487 = metadata !{i32 353, i32 0, metadata !466, metadata !431}
!488 = metadata !{i32 354, i32 0, metadata !466, metadata !431}
!489 = metadata !{i32 355, i32 0, metadata !466, metadata !431}
!490 = metadata !{i32 356, i32 0, metadata !466, metadata !431}
!491 = metadata !{i32 357, i32 0, metadata !466, metadata !431}
!492 = metadata !{i32 358, i32 0, metadata !466, metadata !431}
!493 = metadata !{i32 359, i32 0, metadata !466, metadata !431}
!494 = metadata !{i32 360, i32 0, metadata !466, metadata !431}
!495 = metadata !{i32 361, i32 0, metadata !466, metadata !431}
!496 = metadata !{i32 362, i32 0, metadata !466, metadata !431}
!497 = metadata !{i32 363, i32 0, metadata !466, metadata !431}
!498 = metadata !{i32 364, i32 0, metadata !466, metadata !431}
!499 = metadata !{i32 365, i32 0, metadata !466, metadata !431}
!500 = metadata !{i32 366, i32 0, metadata !466, metadata !431}
!501 = metadata !{i32 367, i32 0, metadata !466, metadata !431}
!502 = metadata !{i32 368, i32 0, metadata !466, metadata !431}
!503 = metadata !{i32 369, i32 0, metadata !466, metadata !431}
!504 = metadata !{i32 370, i32 0, metadata !466, metadata !431}
!505 = metadata !{i32 371, i32 0, metadata !466, metadata !431}
!506 = metadata !{i32 372, i32 0, metadata !466, metadata !431}
!507 = metadata !{i32 373, i32 0, metadata !466, metadata !431}
!508 = metadata !{i32 374, i32 0, metadata !466, metadata !431}
!509 = metadata !{i32 375, i32 0, metadata !466, metadata !431}
!510 = metadata !{i32 376, i32 0, metadata !466, metadata !431}
!511 = metadata !{i32 377, i32 0, metadata !466, metadata !431}
!512 = metadata !{i32 378, i32 0, metadata !466, metadata !431}
!513 = metadata !{i32 379, i32 0, metadata !466, metadata !431}
!514 = metadata !{i32 381, i32 0, metadata !464, metadata !431}
!515 = metadata !{i32 382, i32 0, metadata !464, metadata !431}
!516 = metadata !{i32 383, i32 0, metadata !464, metadata !431}
!517 = metadata !{i32 384, i32 0, metadata !464, metadata !431}
!518 = metadata !{i32 385, i32 0, metadata !464, metadata !431}
!519 = metadata !{i32 386, i32 0, metadata !464, metadata !431}
!520 = metadata !{i32 387, i32 0, metadata !464, metadata !431}
!521 = metadata !{i32 388, i32 0, metadata !464, metadata !431}
!522 = metadata !{i32 389, i32 0, metadata !464, metadata !431}
!523 = metadata !{i32 390, i32 0, metadata !464, metadata !431}
!524 = metadata !{i32 391, i32 0, metadata !464, metadata !431}
!525 = metadata !{i32 392, i32 0, metadata !464, metadata !431}
!526 = metadata !{i32 394, i32 0, metadata !464, metadata !431}
!527 = metadata !{i32 786688, metadata !181, metadata !"k", metadata !5, i32 323, metadata !8, i32 0, metadata !431} ; [ DW_TAG_auto_variable ] [k] [line 323]
!528 = metadata !{i32 397, i32 0, metadata !529, metadata !431}
!529 = metadata !{i32 786443, metadata !1, metadata !459, i32 396, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!530 = metadata !{i32 398, i32 0, metadata !529, metadata !431}
!531 = metadata !{i32 399, i32 0, metadata !532, metadata !431}
!532 = metadata !{i32 786443, metadata !1, metadata !529, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!533 = metadata !{i32 401, i32 0, metadata !534, metadata !431}
!534 = metadata !{i32 786443, metadata !1, metadata !535, i32 400, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!535 = metadata !{i32 786443, metadata !1, metadata !536, i32 400, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!536 = metadata !{i32 786443, metadata !1, metadata !532, i32 399, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!537 = metadata !{i32 402, i32 0, metadata !534, metadata !431}
!538 = metadata !{i32 400, i32 0, metadata !535, metadata !431}
!539 = metadata !{i32 403, i32 0, metadata !534, metadata !431}
!540 = metadata !{i32 404, i32 0, metadata !534, metadata !431}
!541 = metadata !{i32 405, i32 0, metadata !534, metadata !431}
!542 = metadata !{i32 406, i32 0, metadata !534, metadata !431}
!543 = metadata !{i32 407, i32 0, metadata !534, metadata !431}
!544 = metadata !{i32 408, i32 0, metadata !534, metadata !431}
!545 = metadata !{i32 409, i32 0, metadata !534, metadata !431}
!546 = metadata !{i32 410, i32 0, metadata !534, metadata !431}
!547 = metadata !{i32 411, i32 0, metadata !534, metadata !431}
!548 = metadata !{i32 412, i32 0, metadata !534, metadata !431}
!549 = metadata !{i32 413, i32 0, metadata !534, metadata !431}
!550 = metadata !{i32 414, i32 0, metadata !534, metadata !431}
!551 = metadata !{i32 415, i32 0, metadata !534, metadata !431}
!552 = metadata !{i32 416, i32 0, metadata !534, metadata !431}
!553 = metadata !{i32 417, i32 0, metadata !534, metadata !431}
!554 = metadata !{i32 418, i32 0, metadata !534, metadata !431}
!555 = metadata !{i32 419, i32 0, metadata !534, metadata !431}
!556 = metadata !{i32 420, i32 0, metadata !534, metadata !431}
!557 = metadata !{i32 422, i32 0, metadata !536, metadata !431}
!558 = metadata !{i32 423, i32 0, metadata !536, metadata !431}
!559 = metadata !{i32 424, i32 0, metadata !536, metadata !431}
!560 = metadata !{i32 786689, metadata !90, metadata !"n", metadata !5, i32 16777696, metadata !8, i32 0, metadata !561} ; [ DW_TAG_arg_variable ] [n] [line 480]
!561 = metadata !{i32 182, i32 0, metadata !432, null}
!562 = metadata !{i32 480, i32 0, metadata !90, metadata !561}
!563 = metadata !{i32 786689, metadata !90, metadata !"a", metadata !5, i32 33554912, metadata !15, i32 0, metadata !561} ; [ DW_TAG_arg_variable ] [a] [line 480]
!564 = metadata !{i32 786689, metadata !90, metadata !"w", metadata !5, i32 50332128, metadata !15, i32 0, metadata !561} ; [ DW_TAG_arg_variable ] [w] [line 480]
!565 = metadata !{i32 2}
!566 = metadata !{i32 786688, metadata !90, metadata !"l", metadata !5, i32 482, metadata !8, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [l] [line 482]
!567 = metadata !{i32 485, i32 0, metadata !90, metadata !561}
!568 = metadata !{i32 486, i32 0, metadata !569, metadata !561}
!569 = metadata !{i32 786443, metadata !1, metadata !90, i32 486, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!570 = metadata !{i32 487, i32 0, metadata !571, metadata !561}
!571 = metadata !{i32 786443, metadata !1, metadata !569, i32 486, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!572 = metadata !{i32 8}
!573 = metadata !{i32 488, i32 0, metadata !571, metadata !561}
!574 = metadata !{i32 489, i32 0, metadata !571, metadata !561}
!575 = metadata !{i32 490, i32 0, metadata !576, metadata !561}
!576 = metadata !{i32 786443, metadata !1, metadata !571, i32 489, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!577 = metadata !{i32 491, i32 0, metadata !576, metadata !561}
!578 = metadata !{i32 494, i32 0, metadata !579, metadata !561}
!579 = metadata !{i32 786443, metadata !1, metadata !90, i32 494, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!580 = metadata !{i32 786688, metadata !90, metadata !"j", metadata !5, i32 482, metadata !8, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [j] [line 482]
!581 = metadata !{i32 495, i32 0, metadata !582, metadata !561}
!582 = metadata !{i32 786443, metadata !1, metadata !583, i32 495, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!583 = metadata !{i32 786443, metadata !1, metadata !579, i32 494, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!584 = metadata !{i32 517, i32 0, metadata !585, metadata !561}
!585 = metadata !{i32 786443, metadata !1, metadata !586, i32 517, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!586 = metadata !{i32 786443, metadata !1, metadata !579, i32 516, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!587 = metadata !{i32 496, i32 0, metadata !588, metadata !561}
!588 = metadata !{i32 786443, metadata !1, metadata !582, i32 495, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!589 = metadata !{i32 497, i32 0, metadata !588, metadata !561}
!590 = metadata !{i32 498, i32 0, metadata !588, metadata !561}
!591 = metadata !{i32 499, i32 0, metadata !588, metadata !561}
!592 = metadata !{i32 786688, metadata !90, metadata !"x0r", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x0r] [line 483]
!593 = metadata !{i32 500, i32 0, metadata !588, metadata !561}
!594 = metadata !{i32 786688, metadata !90, metadata !"x0i", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x0i] [line 483]
!595 = metadata !{double undef}
!596 = metadata !{i32 786688, metadata !90, metadata !"x1r", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x1r] [line 483]
!597 = metadata !{i32 501, i32 0, metadata !588, metadata !561}
!598 = metadata !{i32 786688, metadata !90, metadata !"x1i", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x1i] [line 483]
!599 = metadata !{i32 502, i32 0, metadata !588, metadata !561}
!600 = metadata !{i32 503, i32 0, metadata !588, metadata !561}
!601 = metadata !{i32 786688, metadata !90, metadata !"x2r", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x2r] [line 483]
!602 = metadata !{i32 504, i32 0, metadata !588, metadata !561}
!603 = metadata !{i32 786688, metadata !90, metadata !"x2i", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x2i] [line 483]
!604 = metadata !{i32 786688, metadata !90, metadata !"x3r", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x3r] [line 483]
!605 = metadata !{i32 505, i32 0, metadata !588, metadata !561}
!606 = metadata !{i32 506, i32 0, metadata !588, metadata !561}
!607 = metadata !{i32 786688, metadata !90, metadata !"x3i", metadata !5, i32 483, metadata !16, i32 0, metadata !561} ; [ DW_TAG_auto_variable ] [x3i] [line 483]
!608 = metadata !{i32 507, i32 0, metadata !588, metadata !561}
!609 = metadata !{i32 508, i32 0, metadata !588, metadata !561}
!610 = metadata !{i32 509, i32 0, metadata !588, metadata !561}
!611 = metadata !{i32 510, i32 0, metadata !588, metadata !561}
!612 = metadata !{i32 511, i32 0, metadata !588, metadata !561}
!613 = metadata !{i32 513, i32 0, metadata !588, metadata !561}
!614 = metadata !{i32 518, i32 0, metadata !615, metadata !561}
!615 = metadata !{i32 786443, metadata !1, metadata !585, i32 517, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!616 = metadata !{i32 519, i32 0, metadata !615, metadata !561}
!617 = metadata !{i32 520, i32 0, metadata !615, metadata !561}
!618 = metadata !{i32 521, i32 0, metadata !615, metadata !561}
!619 = metadata !{i32 522, i32 0, metadata !615, metadata !561}
!620 = metadata !{i32 523, i32 0, metadata !615, metadata !561}
!621 = metadata !{i32 184, i32 0, metadata !622, null}
!622 = metadata !{i32 786443, metadata !1, metadata !293, i32 184, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!623 = metadata !{i32 185, i32 0, metadata !624, null}
!624 = metadata !{i32 786443, metadata !1, metadata !622, i32 184, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!625 = metadata !{i32 186, i32 0, metadata !624, null}
!626 = metadata !{i32 187, i32 0, metadata !69, null}
!627 = metadata !{i32 127, i32 0, metadata !43, null}
!628 = metadata !{i32 129, i32 0, metadata !43, null}
!629 = metadata !{i32 130, i32 0, metadata !43, null}
!630 = metadata !{i32 132, i32 0, metadata !309, null}
!631 = metadata !{i32 133, i32 0, metadata !311, null}
!632 = metadata !{i32 134, i32 0, metadata !311, null}
!633 = metadata !{i32 136, i32 0, metadata !43, null}
!634 = metadata !{i32 221, i32 0, metadata !197, null}
!635 = metadata !{i32 226, i32 0, metadata !197, null}
!636 = metadata !{i32 227, i32 0, metadata !197, null}
!637 = metadata !{i32 228, i32 0, metadata !197, null}
!638 = metadata !{i32 229, i32 0, metadata !197, null}
!639 = metadata !{i32 230, i32 0, metadata !640, null}
!640 = metadata !{i32 786443, metadata !1, metadata !197, i32 229, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!641 = metadata !{i32 231, i32 0, metadata !642, null}
!642 = metadata !{i32 786443, metadata !1, metadata !640, i32 231, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!643 = metadata !{i32 232, i32 0, metadata !644, null}
!644 = metadata !{i32 786443, metadata !1, metadata !642, i32 231, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!645 = metadata !{metadata !645, metadata !452, metadata !453}
!646 = metadata !{metadata !646, metadata !452, metadata !453}
!647 = metadata !{i32 234, i32 0, metadata !640, null}
!648 = metadata !{i32 236, i32 0, metadata !197, null}
!649 = metadata !{i32 237, i32 0, metadata !650, null}
!650 = metadata !{i32 786443, metadata !1, metadata !197, i32 237, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!651 = metadata !{i32 293, i32 0, metadata !652, null}
!652 = metadata !{i32 786443, metadata !1, metadata !653, i32 293, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!653 = metadata !{i32 786443, metadata !1, metadata !650, i32 292, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!654 = metadata !{i32 238, i32 0, metadata !655, null}
!655 = metadata !{i32 786443, metadata !1, metadata !656, i32 238, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!656 = metadata !{i32 786443, metadata !1, metadata !650, i32 237, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!657 = metadata !{i32 251, i32 0, metadata !658, null}
!658 = metadata !{i32 786443, metadata !1, metadata !659, i32 239, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!659 = metadata !{i32 786443, metadata !1, metadata !660, i32 239, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!660 = metadata !{i32 786443, metadata !1, metadata !655, i32 238, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!661 = metadata !{i32 239, i32 0, metadata !659, null}
!662 = metadata !{i32 240, i32 0, metadata !658, null}
!663 = metadata !{i32 241, i32 0, metadata !658, null}
!664 = metadata !{i32 242, i32 0, metadata !658, null}
!665 = metadata !{i32 243, i32 0, metadata !658, null}
!666 = metadata !{i32 244, i32 0, metadata !658, null}
!667 = metadata !{i32 245, i32 0, metadata !658, null}
!668 = metadata !{i32 246, i32 0, metadata !658, null}
!669 = metadata !{i32 247, i32 0, metadata !658, null}
!670 = metadata !{i32 248, i32 0, metadata !658, null}
!671 = metadata !{i32 249, i32 0, metadata !658, null}
!672 = metadata !{i32 250, i32 0, metadata !658, null}
!673 = metadata !{i32 252, i32 0, metadata !658, null}
!674 = metadata !{i32 253, i32 0, metadata !658, null}
!675 = metadata !{i32 254, i32 0, metadata !658, null}
!676 = metadata !{i32 255, i32 0, metadata !658, null}
!677 = metadata !{i32 256, i32 0, metadata !658, null}
!678 = metadata !{i32 257, i32 0, metadata !658, null}
!679 = metadata !{i32 258, i32 0, metadata !658, null}
!680 = metadata !{i32 259, i32 0, metadata !658, null}
!681 = metadata !{i32 260, i32 0, metadata !658, null}
!682 = metadata !{i32 261, i32 0, metadata !658, null}
!683 = metadata !{i32 262, i32 0, metadata !658, null}
!684 = metadata !{i32 263, i32 0, metadata !658, null}
!685 = metadata !{i32 264, i32 0, metadata !658, null}
!686 = metadata !{i32 265, i32 0, metadata !658, null}
!687 = metadata !{i32 266, i32 0, metadata !658, null}
!688 = metadata !{i32 267, i32 0, metadata !658, null}
!689 = metadata !{i32 268, i32 0, metadata !658, null}
!690 = metadata !{i32 269, i32 0, metadata !658, null}
!691 = metadata !{i32 270, i32 0, metadata !658, null}
!692 = metadata !{i32 271, i32 0, metadata !658, null}
!693 = metadata !{i32 272, i32 0, metadata !658, null}
!694 = metadata !{i32 273, i32 0, metadata !658, null}
!695 = metadata !{i32 274, i32 0, metadata !658, null}
!696 = metadata !{i32 275, i32 0, metadata !658, null}
!697 = metadata !{i32 276, i32 0, metadata !658, null}
!698 = metadata !{i32 277, i32 0, metadata !658, null}
!699 = metadata !{i32 278, i32 0, metadata !658, null}
!700 = metadata !{i32 279, i32 0, metadata !658, null}
!701 = metadata !{i32 281, i32 0, metadata !660, null}
!702 = metadata !{i32 282, i32 0, metadata !660, null}
!703 = metadata !{i32 283, i32 0, metadata !660, null}
!704 = metadata !{i32 284, i32 0, metadata !660, null}
!705 = metadata !{i32 285, i32 0, metadata !660, null}
!706 = metadata !{i32 286, i32 0, metadata !660, null}
!707 = metadata !{i32 287, i32 0, metadata !660, null}
!708 = metadata !{i32 288, i32 0, metadata !660, null}
!709 = metadata !{i32 289, i32 0, metadata !660, null}
!710 = metadata !{i32 290, i32 0, metadata !660, null}
!711 = metadata !{i32 295, i32 0, metadata !712, null}
!712 = metadata !{i32 786443, metadata !1, metadata !713, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!713 = metadata !{i32 786443, metadata !1, metadata !714, i32 294, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!714 = metadata !{i32 786443, metadata !1, metadata !652, i32 293, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!715 = metadata !{i32 296, i32 0, metadata !712, null}
!716 = metadata !{i32 294, i32 0, metadata !713, null}
!717 = metadata !{i32 297, i32 0, metadata !712, null}
!718 = metadata !{i32 298, i32 0, metadata !712, null}
!719 = metadata !{i32 299, i32 0, metadata !712, null}
!720 = metadata !{i32 300, i32 0, metadata !712, null}
!721 = metadata !{i32 301, i32 0, metadata !712, null}
!722 = metadata !{i32 302, i32 0, metadata !712, null}
!723 = metadata !{i32 303, i32 0, metadata !712, null}
!724 = metadata !{i32 304, i32 0, metadata !712, null}
!725 = metadata !{i32 305, i32 0, metadata !712, null}
!726 = metadata !{i32 306, i32 0, metadata !712, null}
!727 = metadata !{i32 307, i32 0, metadata !712, null}
!728 = metadata !{i32 308, i32 0, metadata !712, null}
!729 = metadata !{i32 309, i32 0, metadata !712, null}
!730 = metadata !{i32 310, i32 0, metadata !712, null}
!731 = metadata !{i32 311, i32 0, metadata !712, null}
!732 = metadata !{i32 312, i32 0, metadata !712, null}
!733 = metadata !{i32 313, i32 0, metadata !712, null}
!734 = metadata !{i32 314, i32 0, metadata !712, null}
!735 = metadata !{i32 318, i32 0, metadata !197, null}
!736 = metadata !{i32 430, i32 0, metadata !163, null}
!737 = metadata !{i32 435, i32 0, metadata !163, null}
!738 = metadata !{i32 436, i32 0, metadata !739, null}
!739 = metadata !{i32 786443, metadata !1, metadata !163, i32 436, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!740 = metadata !{i32 437, i32 0, metadata !741, null}
!741 = metadata !{i32 786443, metadata !1, metadata !739, i32 436, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!742 = metadata !{i32 438, i32 0, metadata !741, null}
!743 = metadata !{i32 439, i32 0, metadata !741, null}
!744 = metadata !{i32 440, i32 0, metadata !745, null}
!745 = metadata !{i32 786443, metadata !1, metadata !741, i32 439, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!746 = metadata !{i32 441, i32 0, metadata !745, null}
!747 = metadata !{i32 444, i32 0, metadata !748, null}
!748 = metadata !{i32 786443, metadata !1, metadata !163, i32 444, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!749 = metadata !{i32 445, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !1, metadata !751, i32 445, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!751 = metadata !{i32 786443, metadata !1, metadata !748, i32 444, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!752 = metadata !{i32 467, i32 0, metadata !753, null}
!753 = metadata !{i32 786443, metadata !1, metadata !754, i32 467, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!754 = metadata !{i32 786443, metadata !1, metadata !748, i32 466, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!755 = metadata !{i32 446, i32 0, metadata !756, null}
!756 = metadata !{i32 786443, metadata !1, metadata !750, i32 445, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!757 = metadata !{i32 447, i32 0, metadata !756, null}
!758 = metadata !{i32 448, i32 0, metadata !756, null}
!759 = metadata !{i32 449, i32 0, metadata !756, null}
!760 = metadata !{i32 450, i32 0, metadata !756, null}
!761 = metadata !{i32 451, i32 0, metadata !756, null}
!762 = metadata !{i32 452, i32 0, metadata !756, null}
!763 = metadata !{i32 453, i32 0, metadata !756, null}
!764 = metadata !{i32 454, i32 0, metadata !756, null}
!765 = metadata !{i32 455, i32 0, metadata !756, null}
!766 = metadata !{i32 456, i32 0, metadata !756, null}
!767 = metadata !{i32 457, i32 0, metadata !756, null}
!768 = metadata !{i32 459, i32 0, metadata !756, null}
!769 = metadata !{i32 461, i32 0, metadata !756, null}
!770 = metadata !{i32 462, i32 0, metadata !756, null}
!771 = metadata !{i32 463, i32 0, metadata !756, null}
!772 = metadata !{i32 464, i32 0, metadata !756, null}
!773 = metadata !{i32 468, i32 0, metadata !774, null}
!774 = metadata !{i32 786443, metadata !1, metadata !753, i32 467, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!775 = metadata !{i32 469, i32 0, metadata !774, null}
!776 = metadata !{i32 470, i32 0, metadata !774, null}
!777 = metadata !{i32 471, i32 0, metadata !774, null}
!778 = metadata !{i32 472, i32 0, metadata !774, null}
!779 = metadata !{i32 473, i32 0, metadata !774, null}
!780 = metadata !{i32 477, i32 0, metadata !163, null}
!781 = metadata !{i32 530, i32 0, metadata !141, null}
!782 = metadata !{i32 536, i32 0, metadata !141, null}
!783 = metadata !{i32 537, i32 0, metadata !141, null}
!784 = metadata !{i32 538, i32 0, metadata !141, null}
!785 = metadata !{i32 539, i32 0, metadata !141, null}
!786 = metadata !{i32 540, i32 0, metadata !141, null}
!787 = metadata !{i32 541, i32 0, metadata !141, null}
!788 = metadata !{i32 542, i32 0, metadata !141, null}
!789 = metadata !{i32 543, i32 0, metadata !141, null}
!790 = metadata !{i32 544, i32 0, metadata !141, null}
!791 = metadata !{i32 546, i32 0, metadata !141, null}
!792 = metadata !{i32 548, i32 0, metadata !141, null}
!793 = metadata !{i32 549, i32 0, metadata !141, null}
!794 = metadata !{i32 550, i32 0, metadata !141, null}
!795 = metadata !{i32 551, i32 0, metadata !141, null}
!796 = metadata !{i32 552, i32 0, metadata !141, null}
!797 = metadata !{i32 553, i32 0, metadata !141, null}
!798 = metadata !{i32 554, i32 0, metadata !141, null}
!799 = metadata !{i32 555, i32 0, metadata !141, null}
!800 = metadata !{i32 556, i32 0, metadata !141, null}
!801 = metadata !{i32 557, i32 0, metadata !141, null}
!802 = metadata !{i32 558, i32 0, metadata !141, null}
!803 = metadata !{i32 559, i32 0, metadata !141, null}
!804 = metadata !{i32 560, i32 0, metadata !141, null}
!805 = metadata !{i32 561, i32 0, metadata !141, null}
!806 = metadata !{i32 563, i32 0, metadata !141, null}
!807 = metadata !{i32 565, i32 0, metadata !141, null}
!808 = metadata !{i32 566, i32 0, metadata !141, null}
!809 = metadata !{i32 567, i32 0, metadata !141, null}
!810 = metadata !{i32 568, i32 0, metadata !141, null}
!811 = metadata !{i32 569, i32 0, metadata !141, null}
!812 = metadata !{i32 570, i32 0, metadata !141, null}
!813 = metadata !{i32 571, i32 0, metadata !141, null}
!814 = metadata !{i32 572, i32 0, metadata !141, null}
!815 = metadata !{i32 573, i32 0, metadata !141, null}
!816 = metadata !{i32 16}
!817 = metadata !{i32 574, i32 0, metadata !818, null}
!818 = metadata !{i32 786443, metadata !1, metadata !141, i32 574, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!819 = metadata !{i32 576, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !1, metadata !818, i32 574, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!821 = metadata !{i32 577, i32 0, metadata !820, null}
!822 = metadata !{i32 578, i32 0, metadata !820, null}
!823 = metadata !{i32 579, i32 0, metadata !820, null}
!824 = metadata !{i32 580, i32 0, metadata !820, null}
!825 = metadata !{i32 581, i32 0, metadata !820, null}
!826 = metadata !{i32 582, i32 0, metadata !820, null}
!827 = metadata !{i32 583, i32 0, metadata !820, null}
!828 = metadata !{i32 584, i32 0, metadata !820, null}
!829 = metadata !{i32 585, i32 0, metadata !820, null}
!830 = metadata !{i32 586, i32 0, metadata !820, null}
!831 = metadata !{i32 587, i32 0, metadata !820, null}
!832 = metadata !{i32 588, i32 0, metadata !820, null}
!833 = metadata !{i32 589, i32 0, metadata !820, null}
!834 = metadata !{i32 590, i32 0, metadata !820, null}
!835 = metadata !{i32 591, i32 0, metadata !820, null}
!836 = metadata !{i32 593, i32 0, metadata !820, null}
!837 = metadata !{i32 594, i32 0, metadata !820, null}
!838 = metadata !{i32 595, i32 0, metadata !820, null}
!839 = metadata !{i32 596, i32 0, metadata !820, null}
!840 = metadata !{i32 597, i32 0, metadata !820, null}
!841 = metadata !{i32 598, i32 0, metadata !820, null}
!842 = metadata !{i32 599, i32 0, metadata !820, null}
!843 = metadata !{i32 600, i32 0, metadata !820, null}
!844 = metadata !{i32 601, i32 0, metadata !820, null}
!845 = metadata !{i32 602, i32 0, metadata !820, null}
!846 = metadata !{i32 603, i32 0, metadata !820, null}
!847 = metadata !{i32 604, i32 0, metadata !820, null}
!848 = metadata !{i32 605, i32 0, metadata !820, null}
!849 = metadata !{i32 606, i32 0, metadata !820, null}
!850 = metadata !{i32 607, i32 0, metadata !820, null}
!851 = metadata !{i32 608, i32 0, metadata !820, null}
!852 = metadata !{i32 609, i32 0, metadata !820, null}
!853 = metadata !{i32 610, i32 0, metadata !820, null}
!854 = metadata !{i32 611, i32 0, metadata !820, null}
!855 = metadata !{i32 612, i32 0, metadata !820, null}
!856 = metadata !{i32 613, i32 0, metadata !820, null}
!857 = metadata !{i32 614, i32 0, metadata !820, null}
!858 = metadata !{i32 615, i32 0, metadata !820, null}
!859 = metadata !{i32 616, i32 0, metadata !820, null}
!860 = metadata !{i32 617, i32 0, metadata !820, null}
!861 = metadata !{i32 619, i32 0, metadata !820, null}
!862 = metadata !{i32 620, i32 0, metadata !820, null}
!863 = metadata !{i32 621, i32 0, metadata !820, null}
!864 = metadata !{i32 622, i32 0, metadata !820, null}
!865 = metadata !{i32 623, i32 0, metadata !820, null}
!866 = metadata !{i32 624, i32 0, metadata !820, null}
!867 = metadata !{i32 625, i32 0, metadata !820, null}
!868 = metadata !{i32 626, i32 0, metadata !820, null}
!869 = metadata !{i32 627, i32 0, metadata !820, null}
!870 = metadata !{i32 628, i32 0, metadata !820, null}
!871 = metadata !{i32 629, i32 0, metadata !820, null}
!872 = metadata !{i32 630, i32 0, metadata !820, null}
!873 = metadata !{i32 632, i32 0, metadata !141, null}
!874 = metadata !{i32 635, i32 0, metadata !110, null}
!875 = metadata !{i32 641, i32 0, metadata !110, null}
!876 = metadata !{i32 642, i32 0, metadata !877, null}
!877 = metadata !{i32 786443, metadata !1, metadata !110, i32 642, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!878 = metadata !{i32 643, i32 0, metadata !879, null}
!879 = metadata !{i32 786443, metadata !1, metadata !877, i32 642, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!880 = metadata !{i32 644, i32 0, metadata !879, null}
!881 = metadata !{i32 645, i32 0, metadata !879, null}
!882 = metadata !{i32 646, i32 0, metadata !879, null}
!883 = metadata !{i32 647, i32 0, metadata !879, null}
!884 = metadata !{i32 648, i32 0, metadata !879, null}
!885 = metadata !{i32 649, i32 0, metadata !879, null}
!886 = metadata !{i32 650, i32 0, metadata !879, null}
!887 = metadata !{i32 651, i32 0, metadata !879, null}
!888 = metadata !{i32 652, i32 0, metadata !879, null}
!889 = metadata !{i32 653, i32 0, metadata !879, null}
!890 = metadata !{i32 654, i32 0, metadata !879, null}
!891 = metadata !{i32 656, i32 0, metadata !879, null}
!892 = metadata !{i32 658, i32 0, metadata !879, null}
!893 = metadata !{i32 659, i32 0, metadata !879, null}
!894 = metadata !{i32 660, i32 0, metadata !879, null}
!895 = metadata !{i32 661, i32 0, metadata !879, null}
!896 = metadata !{i32 663, i32 0, metadata !110, null}
!897 = metadata !{i32 664, i32 0, metadata !898, null}
!898 = metadata !{i32 786443, metadata !1, metadata !110, i32 664, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!899 = metadata !{i32 682, i32 0, metadata !900, null}
!900 = metadata !{i32 786443, metadata !1, metadata !898, i32 664, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!901 = metadata !{i32 665, i32 0, metadata !900, null}
!902 = metadata !{i32 666, i32 0, metadata !900, null}
!903 = metadata !{i32 667, i32 0, metadata !900, null}
!904 = metadata !{i32 668, i32 0, metadata !900, null}
!905 = metadata !{i32 669, i32 0, metadata !900, null}
!906 = metadata !{i32 670, i32 0, metadata !900, null}
!907 = metadata !{i32 671, i32 0, metadata !900, null}
!908 = metadata !{i32 672, i32 0, metadata !900, null}
!909 = metadata !{i32 673, i32 0, metadata !900, null}
!910 = metadata !{i32 674, i32 0, metadata !900, null}
!911 = metadata !{i32 675, i32 0, metadata !900, null}
!912 = metadata !{i32 676, i32 0, metadata !900, null}
!913 = metadata !{i32 677, i32 0, metadata !900, null}
!914 = metadata !{i32 678, i32 0, metadata !900, null}
!915 = metadata !{i32 679, i32 0, metadata !900, null}
!916 = metadata !{i32 680, i32 0, metadata !900, null}
!917 = metadata !{i32 681, i32 0, metadata !900, null}
!918 = metadata !{i32 683, i32 0, metadata !900, null}
!919 = metadata !{i32 684, i32 0, metadata !900, null}
!920 = metadata !{i32 685, i32 0, metadata !900, null}
!921 = metadata !{i32 686, i32 0, metadata !900, null}
!922 = metadata !{i32 687, i32 0, metadata !900, null}
!923 = metadata !{i32 689, i32 0, metadata !110, null}
!924 = metadata !{i32 690, i32 0, metadata !110, null}
!925 = metadata !{i32 691, i32 0, metadata !926, null}
!926 = metadata !{i32 786443, metadata !1, metadata !110, i32 691, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!927 = metadata !{i32 692, i32 0, metadata !928, null}
!928 = metadata !{i32 786443, metadata !1, metadata !926, i32 691, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!929 = metadata !{i32 693, i32 0, metadata !928, null}
!930 = metadata !{i32 694, i32 0, metadata !928, null}
!931 = metadata !{i32 695, i32 0, metadata !928, null}
!932 = metadata !{i32 696, i32 0, metadata !928, null}
!933 = metadata !{i32 697, i32 0, metadata !928, null}
!934 = metadata !{i32 698, i32 0, metadata !928, null}
!935 = metadata !{i32 699, i32 0, metadata !928, null}
!936 = metadata !{i32 700, i32 0, metadata !937, null}
!937 = metadata !{i32 786443, metadata !1, metadata !928, i32 700, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!938 = metadata !{i32 701, i32 0, metadata !939, null}
!939 = metadata !{i32 786443, metadata !1, metadata !937, i32 700, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!940 = metadata !{i32 702, i32 0, metadata !939, null}
!941 = metadata !{i32 703, i32 0, metadata !939, null}
!942 = metadata !{i32 704, i32 0, metadata !939, null}
!943 = metadata !{i32 705, i32 0, metadata !939, null}
!944 = metadata !{i32 706, i32 0, metadata !939, null}
!945 = metadata !{i32 707, i32 0, metadata !939, null}
!946 = metadata !{i32 708, i32 0, metadata !939, null}
!947 = metadata !{i32 709, i32 0, metadata !939, null}
!948 = metadata !{i32 710, i32 0, metadata !939, null}
!949 = metadata !{i32 711, i32 0, metadata !939, null}
!950 = metadata !{i32 712, i32 0, metadata !939, null}
!951 = metadata !{i32 713, i32 0, metadata !939, null}
!952 = metadata !{i32 714, i32 0, metadata !939, null}
!953 = metadata !{i32 715, i32 0, metadata !939, null}
!954 = metadata !{i32 716, i32 0, metadata !939, null}
!955 = metadata !{i32 717, i32 0, metadata !939, null}
!956 = metadata !{i32 718, i32 0, metadata !939, null}
!957 = metadata !{i32 719, i32 0, metadata !939, null}
!958 = metadata !{i32 720, i32 0, metadata !939, null}
!959 = metadata !{i32 721, i32 0, metadata !939, null}
!960 = metadata !{i32 722, i32 0, metadata !939, null}
!961 = metadata !{i32 723, i32 0, metadata !939, null}
!962 = metadata !{i32 724, i32 0, metadata !939, null}
!963 = metadata !{i32 725, i32 0, metadata !939, null}
!964 = metadata !{i32 727, i32 0, metadata !928, null}
!965 = metadata !{i32 728, i32 0, metadata !928, null}
!966 = metadata !{i32 729, i32 0, metadata !928, null}
!967 = metadata !{i32 730, i32 0, metadata !928, null}
!968 = metadata !{i32 731, i32 0, metadata !969, null}
!969 = metadata !{i32 786443, metadata !1, metadata !928, i32 731, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!970 = metadata !{i32 747, i32 0, metadata !971, null}
!971 = metadata !{i32 786443, metadata !1, metadata !969, i32 731, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!972 = metadata !{i32 732, i32 0, metadata !971, null}
!973 = metadata !{i32 733, i32 0, metadata !971, null}
!974 = metadata !{i32 734, i32 0, metadata !971, null}
!975 = metadata !{i32 735, i32 0, metadata !971, null}
!976 = metadata !{i32 736, i32 0, metadata !971, null}
!977 = metadata !{i32 737, i32 0, metadata !971, null}
!978 = metadata !{i32 738, i32 0, metadata !971, null}
!979 = metadata !{i32 739, i32 0, metadata !971, null}
!980 = metadata !{i32 740, i32 0, metadata !971, null}
!981 = metadata !{i32 741, i32 0, metadata !971, null}
!982 = metadata !{i32 742, i32 0, metadata !971, null}
!983 = metadata !{i32 743, i32 0, metadata !971, null}
!984 = metadata !{i32 745, i32 0, metadata !971, null}
!985 = metadata !{i32 746, i32 0, metadata !971, null}
!986 = metadata !{i32 748, i32 0, metadata !971, null}
!987 = metadata !{i32 749, i32 0, metadata !971, null}
!988 = metadata !{i32 750, i32 0, metadata !971, null}
!989 = metadata !{i32 751, i32 0, metadata !971, null}
!990 = metadata !{i32 752, i32 0, metadata !971, null}
!991 = metadata !{i32 753, i32 0, metadata !971, null}
!992 = metadata !{i32 754, i32 0, metadata !971, null}
!993 = metadata !{i32 755, i32 0, metadata !971, null}
!994 = metadata !{i32 756, i32 0, metadata !971, null}
!995 = metadata !{i32 759, i32 0, metadata !110, null}
