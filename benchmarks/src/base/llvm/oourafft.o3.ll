; ModuleID = 'oourafft.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"FFT sanity check failed! Difference is: %le\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"%e %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %tv.i46 = alloca %struct.timeval, align 8
  %tv.i33 = alloca %struct.timeval, align 8
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
  %exitcond74 = icmp eq i64 %indvars.iv.next.i4, 2048, !dbg !277
  br i1 %exitcond74, label %.lr.ph.i5, label %35, !dbg !277

.lr.ph.i5:                                        ; preds = %35
  %42 = bitcast i8* %33 to double*, !dbg !265
  %43 = bitcast i8* %34 to double*, !dbg !266
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !281) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !285) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !286) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !287) #6, !dbg !283
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !288) #6, !dbg !283
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %32) #6, !dbg !289
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !294) #6, !dbg !296
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !297) #6, !dbg !296
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !298) #6, !dbg !296
  tail call void @llvm.dbg.value(metadata !299, i64 0, metadata !300) #6, !dbg !301
  tail call fastcc void @cft1st(i32 2048, double* %32, double* %7) #6, !dbg !302
  tail call void @llvm.dbg.value(metadata !305, i64 0, metadata !300) #6, !dbg !306
  tail call fastcc void @cftmdl(i32 2048, i32 8, double* %32, double* %7) #6, !dbg !307
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !300) #6, !dbg !309
  tail call fastcc void @cftmdl(i32 2048, i32 32, double* %32, double* %7) #6, !dbg !307
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !300) #6, !dbg !309
  tail call fastcc void @cftmdl(i32 2048, i32 128, double* %32, double* %7) #6, !dbg !307
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !300) #6, !dbg !309
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !310) #6, !dbg !311
  br label %44, !dbg !311

; <label>:44                                      ; preds = %44, %.lr.ph.i5
  %indvars.iv.i6 = phi i64 [ 0, %.lr.ph.i5 ], [ %indvars.iv.next.i7, %44 ]
  %45 = add nsw i64 %indvars.iv.i6, 512, !dbg !315
  %46 = add nsw i64 %indvars.iv.i6, 1024, !dbg !317
  %47 = add nsw i64 %indvars.iv.i6, 1536, !dbg !318
  %48 = getelementptr inbounds double* %32, i64 %indvars.iv.i6, !dbg !319
  %49 = getelementptr inbounds double* %32, i64 %45, !dbg !319
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !321) #6, !dbg !319
  %50 = bitcast double* %48 to <2 x double>*, !dbg !319
  %51 = load <2 x double>* %50, align 8, !dbg !319, !tbaa !243
  %52 = or i64 %45, 1, !dbg !322
  %53 = getelementptr inbounds double* %32, i64 %52, !dbg !322
  %54 = bitcast double* %49 to <2 x double>*, !dbg !319
  %55 = load <2 x double>* %54, align 8, !dbg !319, !tbaa !243
  %56 = fadd <2 x double> %51, %55, !dbg !319
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !323) #6, !dbg !322
  %57 = extractelement <2 x double> %51, i32 0, !dbg !324
  %58 = extractelement <2 x double> %55, i32 0, !dbg !324
  %59 = fsub double %57, %58, !dbg !324
  tail call void @llvm.dbg.value(metadata !{double %59}, i64 0, metadata !325) #6, !dbg !324
  %60 = extractelement <2 x double> %51, i32 1, !dbg !326
  %61 = extractelement <2 x double> %55, i32 1, !dbg !326
  %62 = fsub double %60, %61, !dbg !326
  tail call void @llvm.dbg.value(metadata !{double %62}, i64 0, metadata !327) #6, !dbg !326
  %63 = getelementptr inbounds double* %32, i64 %46, !dbg !328
  %64 = getelementptr inbounds double* %32, i64 %47, !dbg !328
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !329) #6, !dbg !328
  %65 = bitcast double* %63 to <2 x double>*, !dbg !328
  %66 = load <2 x double>* %65, align 8, !dbg !328, !tbaa !243
  %67 = or i64 %47, 1, !dbg !330
  %68 = getelementptr inbounds double* %32, i64 %67, !dbg !330
  %69 = bitcast double* %64 to <2 x double>*, !dbg !328
  %70 = load <2 x double>* %69, align 8, !dbg !328, !tbaa !243
  %71 = fadd <2 x double> %66, %70, !dbg !328
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !331) #6, !dbg !330
  %72 = extractelement <2 x double> %66, i32 0, !dbg !332
  %73 = extractelement <2 x double> %70, i32 0, !dbg !332
  %74 = fsub double %72, %73, !dbg !332
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !333) #6, !dbg !332
  %75 = extractelement <2 x double> %66, i32 1, !dbg !334
  %76 = extractelement <2 x double> %70, i32 1, !dbg !334
  %77 = fsub double %75, %76, !dbg !334
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !335) #6, !dbg !334
  %78 = fadd <2 x double> %56, %71, !dbg !336
  store <2 x double> %78, <2 x double>* %50, align 8, !dbg !336, !tbaa !243
  %79 = fsub <2 x double> %56, %71, !dbg !337
  store <2 x double> %79, <2 x double>* %65, align 8, !dbg !337, !tbaa !243
  %80 = fsub double %59, %77, !dbg !338
  store double %80, double* %49, align 8, !dbg !338, !tbaa !243
  %81 = fadd double %62, %74, !dbg !339
  store double %81, double* %53, align 8, !dbg !339, !tbaa !243
  %82 = fadd double %59, %77, !dbg !340
  store double %82, double* %64, align 8, !dbg !340, !tbaa !243
  %83 = fsub double %62, %74, !dbg !341
  store double %83, double* %68, align 8, !dbg !341, !tbaa !243
  %indvars.iv.next.i7 = add nuw nsw i64 %indvars.iv.i6, 2, !dbg !311
  %84 = trunc i64 %indvars.iv.next.i7 to i32, !dbg !311
  %85 = icmp slt i32 %84, 512, !dbg !311
  br i1 %85, label %44, label %cftfsub.exit, !dbg !311

cftfsub.exit:                                     ; preds = %44
  tail call void @cdft(i32 2048, i32 -1, double* %32, i32* %30, double* %7), !dbg !342
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !343) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !346) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata !347, i64 0, metadata !348) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !349) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !350) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !352) #6, !dbg !353
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !354) #6, !dbg !355
  br label %86, !dbg !355

; <label>:86                                      ; preds = %86, %cftfsub.exit
  %indvars.iv.i9 = phi i64 [ %indvars.iv.next.i10, %86 ], [ 0, %cftfsub.exit ]
  %err.04.i = phi double [ %err.0..i, %86 ], [ 0.000000e+00, %cftfsub.exit ]
  %seed.03.i = phi i32 [ %phitmp2.i, %86 ], [ 54773, %cftfsub.exit ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03.i}, i64 0, metadata !350) #6, !dbg !357
  %87 = sitofp i32 %seed.03.i to double, !dbg !357
  %88 = fmul double %87, 0x3ED02E85C0898B71, !dbg !357
  %89 = getelementptr inbounds double* %32, i64 %indvars.iv.i9, !dbg !357
  %90 = load double* %89, align 8, !dbg !357, !tbaa !243
  %91 = fmul double %90, 9.765625e-04, !dbg !357
  %92 = fsub double %88, %91, !dbg !357
  tail call void @llvm.dbg.value(metadata !{double %92}, i64 0, metadata !359) #6, !dbg !357
  %93 = tail call double @fabs(double %92) #1, !dbg !360
  %94 = fcmp ogt double %err.04.i, %93, !dbg !360
  %err.0..i = select i1 %94, double %err.04.i, double %93, !dbg !360
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !352) #6, !dbg !360
  %indvars.iv.next.i10 = add nsw i64 %indvars.iv.i9, 1, !dbg !355
  %phitmp.i = mul i32 %seed.03.i, 7141, !dbg !355
  %phitmp1.i = add i32 %phitmp.i, 54773, !dbg !355
  %phitmp2.i = srem i32 %phitmp1.i, 259200, !dbg !355
  %exitcond73 = icmp eq i64 %indvars.iv.next.i10, 2048, !dbg !355
  br i1 %exitcond73, label %errorcheck.exit, label %86, !dbg !355

errorcheck.exit:                                  ; preds = %86
  tail call void @llvm.dbg.value(metadata !{double %err.0..i}, i64 0, metadata !24), !dbg !344
  %95 = tail call double @fabs(double %err.0..i) #1, !dbg !361
  %96 = fcmp ogt double %95, 1.000000e-10, !dbg !361
  br i1 %96, label %97, label %99, !dbg !361

; <label>:97                                      ; preds = %errorcheck.exit
  %98 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str, i64 0, i64 0), double %err.0..i) #6, !dbg !363
  tail call void @abort() #8, !dbg !365
  unreachable, !dbg !365

; <label>:99                                      ; preds = %errorcheck.exit
  tail call void @llvm.memset.p0i8.i64(i8* %31, i8 0, i64 16384, i32 8, i1 false), !dbg !366
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !367), !dbg !369
  tail call void @llvm.dbg.value(metadata !370, i64 0, metadata !371), !dbg !369
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !372), !dbg !369
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !373), !dbg !374
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !375), !dbg !376
  br label %100, !dbg !376

; <label>:100                                     ; preds = %100, %99
  %indvars.iv.i12 = phi i64 [ %indvars.iv.next.i14, %100 ], [ 0, %99 ]
  %seed.02.i13 = phi i32 [ %103, %100 ], [ 0, %99 ]
  %101 = mul nsw i32 %seed.02.i13, 7141, !dbg !377
  %102 = add nsw i32 %101, 54773, !dbg !377
  %103 = srem i32 %102, 259200, !dbg !377
  tail call void @llvm.dbg.value(metadata !{i32 %103}, i64 0, metadata !373), !dbg !377
  %104 = sitofp i32 %103 to double, !dbg !377
  %105 = fmul double %104, 0x3ED02E85C0898B71, !dbg !377
  %106 = getelementptr inbounds double* %32, i64 %indvars.iv.i12, !dbg !377
  store double %105, double* %106, align 8, !dbg !377, !tbaa !243
  %indvars.iv.next.i14 = add nsw i64 %indvars.iv.i12, 1, !dbg !376
  %exitcond72 = icmp eq i64 %indvars.iv.next.i14, 1024, !dbg !376
  br i1 %exitcond72, label %.lr.ph.i22, label %100, !dbg !376

.lr.ph.i22:                                       ; preds = %100
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !378) #6, !dbg !380
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !381) #6, !dbg !380
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !382) #6, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !383) #6, !dbg !380
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !384) #6, !dbg !380
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %32) #6, !dbg !385
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !386) #6, !dbg !388
  tail call void @llvm.dbg.value(metadata !{double* %32}, i64 0, metadata !389) #6, !dbg !388
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !390) #6, !dbg !388
  tail call void @llvm.dbg.value(metadata !299, i64 0, metadata !391) #6, !dbg !392
  tail call fastcc void @cft1st(i32 2048, double* %32, double* %7) #6, !dbg !393
  tail call void @llvm.dbg.value(metadata !305, i64 0, metadata !391) #6, !dbg !394
  tail call fastcc void @cftmdl(i32 2048, i32 8, double* %32, double* %7) #6, !dbg !395
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !391) #6, !dbg !396
  tail call fastcc void @cftmdl(i32 2048, i32 32, double* %32, double* %7) #6, !dbg !395
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !391) #6, !dbg !396
  tail call fastcc void @cftmdl(i32 2048, i32 128, double* %32, double* %7) #6, !dbg !395
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !391) #6, !dbg !396
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !397) #6, !dbg !398
  br label %107, !dbg !398

; <label>:107                                     ; preds = %107, %.lr.ph.i22
  %indvars.iv.i23 = phi i64 [ 0, %.lr.ph.i22 ], [ %indvars.iv.next.i24, %107 ]
  %108 = add nsw i64 %indvars.iv.i23, 512, !dbg !399
  %109 = add nsw i64 %indvars.iv.i23, 1024, !dbg !400
  %110 = add nsw i64 %indvars.iv.i23, 1536, !dbg !401
  %111 = getelementptr inbounds double* %32, i64 %indvars.iv.i23, !dbg !402
  %112 = getelementptr inbounds double* %32, i64 %108, !dbg !402
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !403) #6, !dbg !402
  %113 = bitcast double* %111 to <2 x double>*, !dbg !402
  %114 = load <2 x double>* %113, align 8, !dbg !402, !tbaa !243
  %115 = or i64 %108, 1, !dbg !404
  %116 = getelementptr inbounds double* %32, i64 %115, !dbg !404
  %117 = bitcast double* %112 to <2 x double>*, !dbg !402
  %118 = load <2 x double>* %117, align 8, !dbg !402, !tbaa !243
  %119 = fadd <2 x double> %114, %118, !dbg !402
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !405) #6, !dbg !404
  %120 = extractelement <2 x double> %114, i32 0, !dbg !406
  %121 = extractelement <2 x double> %118, i32 0, !dbg !406
  %122 = fsub double %120, %121, !dbg !406
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !407) #6, !dbg !406
  %123 = extractelement <2 x double> %114, i32 1, !dbg !408
  %124 = extractelement <2 x double> %118, i32 1, !dbg !408
  %125 = fsub double %123, %124, !dbg !408
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !409) #6, !dbg !408
  %126 = getelementptr inbounds double* %32, i64 %109, !dbg !410
  %127 = getelementptr inbounds double* %32, i64 %110, !dbg !410
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !411) #6, !dbg !410
  %128 = bitcast double* %126 to <2 x double>*, !dbg !410
  %129 = load <2 x double>* %128, align 8, !dbg !410, !tbaa !243
  %130 = or i64 %110, 1, !dbg !412
  %131 = getelementptr inbounds double* %32, i64 %130, !dbg !412
  %132 = bitcast double* %127 to <2 x double>*, !dbg !410
  %133 = load <2 x double>* %132, align 8, !dbg !410, !tbaa !243
  %134 = fadd <2 x double> %129, %133, !dbg !410
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !413) #6, !dbg !412
  %135 = extractelement <2 x double> %129, i32 0, !dbg !414
  %136 = extractelement <2 x double> %133, i32 0, !dbg !414
  %137 = fsub double %135, %136, !dbg !414
  tail call void @llvm.dbg.value(metadata !{double %137}, i64 0, metadata !415) #6, !dbg !414
  %138 = extractelement <2 x double> %129, i32 1, !dbg !416
  %139 = extractelement <2 x double> %133, i32 1, !dbg !416
  %140 = fsub double %138, %139, !dbg !416
  tail call void @llvm.dbg.value(metadata !{double %140}, i64 0, metadata !417) #6, !dbg !416
  %141 = fadd <2 x double> %119, %134, !dbg !418
  store <2 x double> %141, <2 x double>* %113, align 8, !dbg !418, !tbaa !243
  %142 = fsub <2 x double> %119, %134, !dbg !419
  store <2 x double> %142, <2 x double>* %128, align 8, !dbg !419, !tbaa !243
  %143 = fsub double %122, %140, !dbg !420
  store double %143, double* %112, align 8, !dbg !420, !tbaa !243
  %144 = fadd double %125, %137, !dbg !421
  store double %144, double* %116, align 8, !dbg !421, !tbaa !243
  %145 = fadd double %122, %140, !dbg !422
  store double %145, double* %127, align 8, !dbg !422, !tbaa !243
  %146 = fsub double %125, %137, !dbg !423
  store double %146, double* %131, align 8, !dbg !423, !tbaa !243
  %indvars.iv.next.i24 = add nuw nsw i64 %indvars.iv.i23, 2, !dbg !398
  %147 = trunc i64 %indvars.iv.next.i24 to i32, !dbg !398
  %148 = icmp slt i32 %147, 512, !dbg !398
  br i1 %148, label %107, label %cftfsub.exit27, !dbg !398

cftfsub.exit27:                                   ; preds = %107, %cftfsub.exit27
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %cftfsub.exit27 ], [ 0, %107 ]
  %149 = shl nsw i64 %indvars.iv69, 1, !dbg !424
  %150 = or i64 %149, 1, !dbg !424
  %151 = getelementptr inbounds double* %32, i64 %150, !dbg !424
  %152 = load double* %151, align 8, !dbg !424, !tbaa !243
  %153 = fsub double -0.000000e+00, %152, !dbg !424
  store double %153, double* %151, align 8, !dbg !424, !tbaa !243
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1, !dbg !426
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 1024, !dbg !426
  br i1 %exitcond71, label %154, label %cftfsub.exit27, !dbg !426

; <label>:154                                     ; preds = %cftfsub.exit27
  tail call void @llvm.memset.p0i8.i64(i8* %34, i8 0, i64 16384, i32 8, i1 false), !dbg !427
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !428), !dbg !430
  tail call void @llvm.dbg.value(metadata !370, i64 0, metadata !431), !dbg !430
  tail call void @llvm.dbg.value(metadata !{double* %43}, i64 0, metadata !432), !dbg !430
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !433), !dbg !434
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !435), !dbg !436
  br label %155, !dbg !436

; <label>:155                                     ; preds = %155, %154
  %indvars.iv.i29 = phi i64 [ %indvars.iv.next.i31, %155 ], [ 0, %154 ]
  %seed.02.i30 = phi i32 [ %158, %155 ], [ 0, %154 ]
  %156 = mul nsw i32 %seed.02.i30, 7141, !dbg !437
  %157 = add nsw i32 %156, 54773, !dbg !437
  %158 = srem i32 %157, 259200, !dbg !437
  tail call void @llvm.dbg.value(metadata !{i32 %158}, i64 0, metadata !433), !dbg !437
  %159 = sitofp i32 %158 to double, !dbg !437
  %160 = fmul double %159, 0x3ED02E85C0898B71, !dbg !437
  %161 = getelementptr inbounds double* %43, i64 %indvars.iv.i29, !dbg !437
  store double %160, double* %161, align 8, !dbg !437, !tbaa !243
  %indvars.iv.next.i31 = add nsw i64 %indvars.iv.i29, 1, !dbg !436
  %exitcond68 = icmp eq i64 %indvars.iv.next.i31, 1024, !dbg !436
  br i1 %exitcond68, label %putdata.exit32, label %155, !dbg !436

putdata.exit32:                                   ; preds = %155
  %162 = bitcast %struct.timeval* %tv.i33 to i8*, !dbg !438
  call void @llvm.lifetime.start(i64 16, i8* %162) #6, !dbg !438
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i33}, metadata !59) #6, !dbg !438
  %163 = call i32 @gettimeofday(%struct.timeval* %tv.i33, %struct.timezone* null) #6, !dbg !440
  call void @llvm.lifetime.end(i64 16, i8* %162) #6, !dbg !441
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !10), !dbg !442
  br label %.lr.ph.i40, !dbg !442

.lr.ph.i40:                                       ; preds = %222, %putdata.exit32
  %i.057 = phi i32 [ 0, %putdata.exit32 ], [ %223, %222 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %34, i64 16384, i32 8, i1 false), !dbg !443
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !444) #6, !dbg !446
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !447) #6, !dbg !446
  tail call void @llvm.dbg.value(metadata !{double* %42}, i64 0, metadata !448) #6, !dbg !446
  tail call void @llvm.dbg.value(metadata !{i32* %30}, i64 0, metadata !449) #6, !dbg !446
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !450) #6, !dbg !446
  tail call fastcc void @bitrv2(i32 2048, i32* %30, double* %42) #6, !dbg !451
  tail call void @llvm.dbg.value(metadata !280, i64 0, metadata !452) #6, !dbg !454
  tail call void @llvm.dbg.value(metadata !{double* %42}, i64 0, metadata !455) #6, !dbg !454
  tail call void @llvm.dbg.value(metadata !{double* %7}, i64 0, metadata !456) #6, !dbg !454
  tail call void @llvm.dbg.value(metadata !299, i64 0, metadata !457) #6, !dbg !458
  tail call fastcc void @cft1st(i32 2048, double* %42, double* %7) #6, !dbg !459
  tail call void @llvm.dbg.value(metadata !305, i64 0, metadata !457) #6, !dbg !460
  tail call fastcc void @cftmdl(i32 2048, i32 8, double* %42, double* %7) #6, !dbg !461
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !457) #6, !dbg !462
  tail call fastcc void @cftmdl(i32 2048, i32 32, double* %42, double* %7) #6, !dbg !461
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !457) #6, !dbg !462
  tail call fastcc void @cftmdl(i32 2048, i32 128, double* %42, double* %7) #6, !dbg !461
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !457) #6, !dbg !462
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !463) #6, !dbg !464
  br label %164, !dbg !464

; <label>:164                                     ; preds = %164, %.lr.ph.i40
  %indvars.iv.i41 = phi i64 [ 0, %.lr.ph.i40 ], [ %indvars.iv.next.i42, %164 ]
  %165 = add nsw i64 %indvars.iv.i41, 512, !dbg !465
  %166 = add nsw i64 %indvars.iv.i41, 1024, !dbg !466
  %167 = add nsw i64 %indvars.iv.i41, 1536, !dbg !467
  %168 = getelementptr inbounds double* %42, i64 %indvars.iv.i41, !dbg !468
  %169 = getelementptr inbounds double* %42, i64 %165, !dbg !468
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !469) #6, !dbg !468
  %170 = bitcast double* %168 to <2 x double>*, !dbg !468
  %171 = load <2 x double>* %170, align 8, !dbg !468, !tbaa !243
  %172 = or i64 %165, 1, !dbg !470
  %173 = getelementptr inbounds double* %42, i64 %172, !dbg !470
  %174 = bitcast double* %169 to <2 x double>*, !dbg !468
  %175 = load <2 x double>* %174, align 8, !dbg !468, !tbaa !243
  %176 = fadd <2 x double> %171, %175, !dbg !468
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !471) #6, !dbg !470
  %177 = extractelement <2 x double> %171, i32 0, !dbg !472
  %178 = extractelement <2 x double> %175, i32 0, !dbg !472
  %179 = fsub double %177, %178, !dbg !472
  tail call void @llvm.dbg.value(metadata !{double %179}, i64 0, metadata !473) #6, !dbg !472
  %180 = extractelement <2 x double> %171, i32 1, !dbg !474
  %181 = extractelement <2 x double> %175, i32 1, !dbg !474
  %182 = fsub double %180, %181, !dbg !474
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !475) #6, !dbg !474
  %183 = getelementptr inbounds double* %42, i64 %166, !dbg !476
  %184 = getelementptr inbounds double* %42, i64 %167, !dbg !476
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !477) #6, !dbg !476
  %185 = bitcast double* %183 to <2 x double>*, !dbg !476
  %186 = load <2 x double>* %185, align 8, !dbg !476, !tbaa !243
  %187 = or i64 %167, 1, !dbg !478
  %188 = getelementptr inbounds double* %42, i64 %187, !dbg !478
  %189 = bitcast double* %184 to <2 x double>*, !dbg !476
  %190 = load <2 x double>* %189, align 8, !dbg !476, !tbaa !243
  %191 = fadd <2 x double> %186, %190, !dbg !476
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !479) #6, !dbg !478
  %192 = extractelement <2 x double> %186, i32 0, !dbg !480
  %193 = extractelement <2 x double> %190, i32 0, !dbg !480
  %194 = fsub double %192, %193, !dbg !480
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !481) #6, !dbg !480
  %195 = extractelement <2 x double> %186, i32 1, !dbg !482
  %196 = extractelement <2 x double> %190, i32 1, !dbg !482
  %197 = fsub double %195, %196, !dbg !482
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !483) #6, !dbg !482
  %198 = fadd <2 x double> %176, %191, !dbg !484
  store <2 x double> %198, <2 x double>* %170, align 8, !dbg !484, !tbaa !243
  %199 = fsub <2 x double> %176, %191, !dbg !485
  store <2 x double> %199, <2 x double>* %185, align 8, !dbg !485, !tbaa !243
  %200 = fsub double %179, %197, !dbg !486
  store double %200, double* %169, align 8, !dbg !486, !tbaa !243
  %201 = fadd double %182, %194, !dbg !487
  store double %201, double* %173, align 8, !dbg !487, !tbaa !243
  %202 = fadd double %179, %197, !dbg !488
  store double %202, double* %184, align 8, !dbg !488, !tbaa !243
  %203 = fsub double %182, %194, !dbg !489
  store double %203, double* %188, align 8, !dbg !489, !tbaa !243
  %indvars.iv.next.i42 = add nuw nsw i64 %indvars.iv.i41, 2, !dbg !464
  %204 = trunc i64 %indvars.iv.next.i42 to i32, !dbg !464
  %205 = icmp slt i32 %204, 512, !dbg !464
  br i1 %205, label %164, label %cftfsub.exit45, !dbg !464

cftfsub.exit45:                                   ; preds = %164, %cftfsub.exit45
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %cftfsub.exit45 ], [ 0, %164 ]
  %206 = shl nsw i64 %indvars.iv64, 1, !dbg !490
  %207 = getelementptr inbounds double* %42, i64 %206, !dbg !490
  %208 = load double* %207, align 8, !dbg !490, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %208}, i64 0, metadata !28), !dbg !490
  %209 = getelementptr inbounds double* %32, i64 %206, !dbg !491
  %210 = load double* %209, align 8, !dbg !491, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %210}, i64 0, metadata !31), !dbg !491
  %211 = or i64 %206, 1, !dbg !492
  %212 = getelementptr inbounds double* %42, i64 %211, !dbg !492
  %213 = load double* %212, align 8, !dbg !492, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !32), !dbg !492
  %214 = getelementptr inbounds double* %32, i64 %211, !dbg !493
  %215 = load double* %214, align 8, !dbg !493, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %215}, i64 0, metadata !33), !dbg !493
  %216 = fmul double %208, %210, !dbg !494
  %217 = fmul double %213, %215, !dbg !494
  %218 = fsub double %216, %217, !dbg !494
  store double %218, double* %207, align 8, !dbg !494, !tbaa !243
  %219 = fmul double %208, %215, !dbg !495
  %220 = fmul double %210, %213, !dbg !495
  %221 = fadd double %220, %219, !dbg !495
  store double %221, double* %212, align 8, !dbg !495, !tbaa !243
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1, !dbg !496
  %exitcond66 = icmp eq i64 %indvars.iv.next65, 1024, !dbg !496
  br i1 %exitcond66, label %222, label %cftfsub.exit45, !dbg !496

; <label>:222                                     ; preds = %cftfsub.exit45
  tail call void @cdft(i32 2048, i32 -1, double* %42, i32* %30, double* %7), !dbg !497
  %223 = add nsw i32 %i.057, 1, !dbg !442
  tail call void @llvm.dbg.value(metadata !{i32 %223}, i64 0, metadata !10), !dbg !442
  %exitcond67 = icmp eq i32 %223, 150000, !dbg !442
  br i1 %exitcond67, label %224, label %.lr.ph.i40, !dbg !442

; <label>:224                                     ; preds = %222
  %225 = bitcast %struct.timeval* %tv.i46 to i8*, !dbg !498
  call void @llvm.lifetime.start(i64 16, i8* %225) #6, !dbg !498
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv.i46}, metadata !59) #6, !dbg !498
  %226 = call i32 @gettimeofday(%struct.timeval* %tv.i46, %struct.timezone* null) #6, !dbg !500
  call void @llvm.lifetime.end(i64 16, i8* %225) #6, !dbg !501
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !11), !dbg !502
  br label %227, !dbg !502

; <label>:227                                     ; preds = %227, %224
  %indvars.iv = phi i64 [ 0, %224 ], [ %indvars.iv.next, %227 ]
  %228 = shl nsw i64 %indvars.iv, 1, !dbg !504
  %229 = getelementptr inbounds double* %42, i64 %228, !dbg !504
  %230 = load double* %229, align 8, !dbg !504, !tbaa !243
  %231 = tail call double @fabs(double %230) #1, !dbg !504
  %232 = fcmp ogt double %231, 1.000000e-09, !dbg !504
  %233 = select i1 %232, double %230, double 0.000000e+00, !dbg !504
  %234 = or i64 %228, 1, !dbg !506
  %235 = getelementptr inbounds double* %42, i64 %234, !dbg !506
  %236 = load double* %235, align 8, !dbg !506, !tbaa !243
  %237 = tail call double @fabs(double %236) #1, !dbg !506
  %238 = fcmp ogt double %237, 1.000000e-09, !dbg !506
  %239 = select i1 %238, double %236, double 0.000000e+00, !dbg !506
  %240 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i64 0, i64 0), double %233, double %239) #6, !dbg !507
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !502
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !502
  br i1 %exitcond, label %241, label %227, !dbg !502

; <label>:241                                     ; preds = %227
  tail call void @free(i8* %31) #6, !dbg !508
  tail call void @free(i8* %6) #6, !dbg !509
  tail call void @free(i8* %5) #6, !dbg !510
  tail call void @free(i8* %33) #6, !dbg !511
  tail call void @free(i8* %34) #6, !dbg !512
  ret i32 0, !dbg !513
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define double @get_time() #0 {
  %tv = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !59), !dbg !514
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6, !dbg !515
  %2 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0, !dbg !516
  %3 = load i64* %2, align 8, !dbg !516, !tbaa !517
  %4 = sitofp i64 %3 to double, !dbg !516
  %5 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1, !dbg !516
  %6 = load i64* %5, align 8, !dbg !516, !tbaa !520
  %7 = sitofp i64 %6 to double, !dbg !516
  %8 = fmul double %7, 1.000000e-06, !dbg !516
  %9 = fadd double %4, %8, !dbg !516
  ret double %9, !dbg !516
}

; Function Attrs: nounwind
declare noalias i8* @memalign(i64, i64) #2

; Function Attrs: nounwind uwtable
define void @makewt(i32 %nw, i32* nocapture %ip, double* %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nw}, i64 0, metadata !82), !dbg !521
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !83), !dbg !521
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !84), !dbg !521
  %1 = icmp sgt i32 %nw, 2, !dbg !522
  br i1 %1, label %2, label %31, !dbg !522

; <label>:2                                       ; preds = %0
  %3 = ashr i32 %nw, 1, !dbg !523
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !86), !dbg !523
  %4 = sitofp i32 %3 to double, !dbg !524
  %5 = fdiv double 0x3FE921FB54442D18, %4, !dbg !524
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !87), !dbg !524
  store double 1.000000e+00, double* %w, align 8, !dbg !525, !tbaa !243
  %6 = getelementptr inbounds double* %w, i64 1, !dbg !526
  store double 0.000000e+00, double* %6, align 8, !dbg !526, !tbaa !243
  %7 = fmul double %4, %5, !dbg !527
  %8 = tail call double @cos(double %7) #6, !dbg !527
  %9 = sext i32 %3 to i64, !dbg !527
  %10 = getelementptr inbounds double* %w, i64 %9, !dbg !527
  store double %8, double* %10, align 8, !dbg !527, !tbaa !243
  %11 = add nsw i32 %3, 1, !dbg !528
  %12 = sext i32 %11 to i64, !dbg !528
  %13 = getelementptr inbounds double* %w, i64 %12, !dbg !528
  store double %8, double* %13, align 8, !dbg !528, !tbaa !243
  %14 = icmp sgt i32 %3, 2, !dbg !529
  br i1 %14, label %.lr.ph, label %31, !dbg !529

.lr.ph:                                           ; preds = %2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 2, %2 ]
  %15 = trunc i64 %indvars.iv to i32, !dbg !530
  %16 = sitofp i32 %15 to double, !dbg !530
  %17 = fmul double %5, %16, !dbg !530
  %18 = tail call double @cos(double %17) #6, !dbg !530
  tail call void @llvm.dbg.value(metadata !{double %18}, i64 0, metadata !88), !dbg !530
  %19 = tail call double @sin(double %17) #6, !dbg !531
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !89), !dbg !531
  %20 = getelementptr inbounds double* %w, i64 %indvars.iv, !dbg !532
  store double %18, double* %20, align 8, !dbg !532, !tbaa !243
  %21 = or i64 %indvars.iv, 1, !dbg !533
  %22 = getelementptr inbounds double* %w, i64 %21, !dbg !533
  store double %19, double* %22, align 8, !dbg !533, !tbaa !243
  %23 = sub nsw i32 %nw, %15, !dbg !534
  %24 = sext i32 %23 to i64, !dbg !534
  %25 = getelementptr inbounds double* %w, i64 %24, !dbg !534
  store double %19, double* %25, align 8, !dbg !534, !tbaa !243
  %26 = add nsw i32 %23, 1, !dbg !535
  %27 = sext i32 %26 to i64, !dbg !535
  %28 = getelementptr inbounds double* %w, i64 %27, !dbg !535
  store double %18, double* %28, align 8, !dbg !535, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !536
  %29 = trunc i64 %indvars.iv.next to i32, !dbg !536
  %30 = icmp slt i32 %29, %3, !dbg !536
  br i1 %30, label %.lr.ph, label %._crit_edge, !dbg !536

._crit_edge:                                      ; preds = %.lr.ph
  tail call fastcc void @bitrv2(i32 %nw, i32* %ip, double* %w), !dbg !537
  br label %31, !dbg !538

; <label>:31                                      ; preds = %2, %._crit_edge, %0
  ret void, !dbg !539
}

; Function Attrs: nounwind uwtable
define void @putdata(i32 %nini, i32 %nend, double* nocapture %a) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !38), !dbg !540
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !39), !dbg !540
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !40), !dbg !540
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !42), !dbg !541
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !41), !dbg !542
  %1 = icmp sgt i32 %nini, %nend, !dbg !542
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !542

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !542

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %seed.02 = phi i32 [ %6, %3 ], [ 0, %.lr.ph ]
  %4 = mul nsw i32 %seed.02, 7141, !dbg !543
  %5 = add nsw i32 %4, 54773, !dbg !543
  %6 = srem i32 %5, 259200, !dbg !543
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !42), !dbg !543
  %7 = sitofp i32 %6 to double, !dbg !543
  %8 = fmul double %7, 0x3ED02E85C0898B71, !dbg !543
  %9 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !543
  store double %8, double* %9, align 8, !dbg !543, !tbaa !243
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !542
  %10 = trunc i64 %indvars.iv to i32, !dbg !542
  %11 = icmp slt i32 %10, %nend, !dbg !542
  br i1 %11, label %3, label %._crit_edge, !dbg !542

._crit_edge:                                      ; preds = %3, %0
  ret void, !dbg !544
}

; Function Attrs: nounwind uwtable
define void @cdft(i32 %n, i32 %isgn, double* %a, i32* nocapture %ip, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !73), !dbg !545
  tail call void @llvm.dbg.value(metadata !{i32 %isgn}, i64 0, metadata !74), !dbg !545
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !75), !dbg !545
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !76), !dbg !545
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !77), !dbg !545
  %1 = icmp sgt i32 %n, 4, !dbg !546
  br i1 %1, label %2, label %301, !dbg !546

; <label>:2                                       ; preds = %0
  %3 = icmp sgt i32 %isgn, -1, !dbg !547
  br i1 %3, label %4, label %5, !dbg !547

; <label>:4                                       ; preds = %2
  tail call fastcc void @bitrv2(i32 %n, i32* %ip, double* %a), !dbg !548
  tail call fastcc void @cftfsub(i32 %n, double* %a, double* %w), !dbg !549
  br label %cftbsub.exit, !dbg !550

; <label>:5                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !551), !dbg !554
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !555), !dbg !554
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !556), !dbg !554
  store i32 0, i32* %ip, align 4, !dbg !557, !tbaa !558
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !560), !dbg !561
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !562), !dbg !563
  %6 = icmp sgt i32 %n, 8, !dbg !564
  br i1 %6, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !564

.lr.ph18.i:                                       ; preds = %5, %._crit_edge13.i
  %m.015.i = phi i32 [ %34, %._crit_edge13.i ], [ 1, %5 ]
  %l.014.i = phi i32 [ %7, %._crit_edge13.i ], [ %n, %5 ]
  %7 = ashr i32 %l.014.i, 1, !dbg !565
  tail call void @llvm.dbg.value(metadata !{i32 %7}, i64 0, metadata !560), !dbg !565
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !567), !dbg !568
  %8 = icmp sgt i32 %m.015.i, 0, !dbg !568
  br i1 %8, label %.lr.ph12.i, label %._crit_edge13.i, !dbg !568

.lr.ph12.i:                                       ; preds = %.lr.ph18.i
  %9 = sext i32 %m.015.i to i64, !dbg !568
  %10 = add i32 %m.015.i, -1, !dbg !568
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, 1, !dbg !568
  %end.idx = add i64 %11, 1, !dbg !568
  %n.vec = and i64 %12, 8589934584, !dbg !568
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !568
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
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !568
  %17 = getelementptr inbounds i32* %ip, i64 %index, !dbg !570
  %18 = bitcast i32* %17 to <4 x i32>*, !dbg !570
  %wide.load = load <4 x i32>* %18, align 4, !dbg !570
  %.sum43 = or i64 %index, 4, !dbg !570
  %19 = getelementptr i32* %ip, i64 %.sum43, !dbg !570
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !570
  %wide.load36 = load <4 x i32>* %20, align 4, !dbg !570
  %21 = add nsw <4 x i32> %wide.load, %broadcast.splat38, !dbg !570
  %22 = add nsw <4 x i32> %wide.load36, %broadcast.splat38, !dbg !570
  %23 = add i64 %index, %9, !dbg !570
  %24 = getelementptr inbounds i32* %ip, i64 %23, !dbg !570
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !570
  store <4 x i32> %21, <4 x i32>* %25, align 4, !dbg !570
  %.sum = add i64 %23, 4, !dbg !570
  %26 = getelementptr i32* %ip, i64 %.sum, !dbg !570
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !570
  store <4 x i32> %22, <4 x i32>* %27, align 4, !dbg !570
  %index.next = add i64 %index, 8, !dbg !568
  %28 = icmp eq i64 %index.next, %n.vec, !dbg !568
  br i1 %28, label %middle.block, label %vector.body, !dbg !568, !llvm.loop !572

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph12.i
  %resume.val = phi i64 [ 0, %.lr.ph12.i ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge13.i, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv41.i = phi i64 [ %indvars.iv.next42.i, %scalar.ph ], [ %resume.val, %middle.block ]
  %29 = getelementptr inbounds i32* %ip, i64 %indvars.iv41.i, !dbg !570
  %30 = load i32* %29, align 4, !dbg !570, !tbaa !558
  %31 = add nsw i32 %30, %7, !dbg !570
  %32 = add nsw i64 %indvars.iv41.i, %9, !dbg !570
  %33 = getelementptr inbounds i32* %ip, i64 %32, !dbg !570
  store i32 %31, i32* %33, align 4, !dbg !570, !tbaa !558
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !568
  %lftr.wideiv22 = trunc i64 %indvars.iv.next42.i to i32, !dbg !568
  %exitcond23 = icmp eq i32 %lftr.wideiv22, %m.015.i, !dbg !568
  br i1 %exitcond23, label %._crit_edge13.i, label %scalar.ph, !dbg !568, !llvm.loop !575

._crit_edge13.i:                                  ; preds = %scalar.ph, %middle.block, %.lr.ph18.i
  %34 = shl i32 %m.015.i, 1, !dbg !576
  tail call void @llvm.dbg.value(metadata !{i32 %34}, i64 0, metadata !562), !dbg !576
  %35 = shl i32 %m.015.i, 4, !dbg !564
  %36 = icmp slt i32 %35, %7, !dbg !564
  br i1 %36, label %.lr.ph18.i, label %._crit_edge19.i, !dbg !564

._crit_edge19.i:                                  ; preds = %._crit_edge13.i, %5
  %.lcssa.i = phi i32 [ 8, %5 ], [ %35, %._crit_edge13.i ]
  %m.0.lcssa.i = phi i32 [ 1, %5 ], [ %34, %._crit_edge13.i ]
  %l.0.lcssa.i = phi i32 [ %n, %5 ], [ %7, %._crit_edge13.i ]
  %37 = shl nsw i32 %m.0.lcssa.i, 1, !dbg !577
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !578), !dbg !577
  %38 = icmp eq i32 %.lcssa.i, %l.0.lcssa.i, !dbg !579
  br i1 %38, label %.preheader1.i, label %152, !dbg !579

.preheader1.i:                                    ; preds = %._crit_edge19.i
  %39 = icmp sgt i32 %m.0.lcssa.i, 0, !dbg !581
  br i1 %39, label %.preheader.lr.ph.i, label %bitrv2conj.exit, !dbg !581

.preheader.lr.ph.i:                               ; preds = %.preheader1.i
  %40 = or i32 %37, 1, !dbg !584
  %41 = shl i32 %m.0.lcssa.i, 2, !dbg !586
  br label %.preheader.i, !dbg !581

.preheader.i:                                     ; preds = %._crit_edge.i, %.preheader.lr.ph.i
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %42 = trunc i64 %indvars.iv27.i to i32, !dbg !589
  %43 = icmp sgt i32 %42, 0, !dbg !589
  %44 = getelementptr inbounds i32* %ip, i64 %indvars.iv27.i, !dbg !590
  %45 = load i32* %44, align 4, !dbg !590, !tbaa !558
  %46 = shl nsw i32 %42, 1, !dbg !591
  br i1 %43, label %.lr.ph.i, label %._crit_edge.i, !dbg !589

.lr.ph.i:                                         ; preds = %.preheader.i, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.preheader.i ]
  %47 = trunc i64 %indvars.iv.i to i32, !dbg !590
  %48 = shl nsw i32 %47, 1, !dbg !590
  %49 = add nsw i32 %48, %45, !dbg !590
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !592), !dbg !590
  %50 = getelementptr inbounds i32* %ip, i64 %indvars.iv.i, !dbg !591
  %51 = load i32* %50, align 4, !dbg !591, !tbaa !558
  %52 = add nsw i32 %51, %46, !dbg !591
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !593), !dbg !591
  %53 = sext i32 %49 to i64, !dbg !594
  %54 = getelementptr inbounds double* %a, i64 %53, !dbg !594
  %55 = load double* %54, align 8, !dbg !594, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %55}, i64 0, metadata !595), !dbg !594
  %56 = add nsw i32 %49, 1, !dbg !596
  %57 = sext i32 %56 to i64, !dbg !596
  %58 = getelementptr inbounds double* %a, i64 %57, !dbg !596
  %59 = load double* %58, align 8, !dbg !596, !tbaa !243
  %60 = fsub double -0.000000e+00, %59, !dbg !596
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !597), !dbg !596
  %61 = sext i32 %52 to i64, !dbg !598
  %62 = getelementptr inbounds double* %a, i64 %61, !dbg !598
  %63 = load double* %62, align 8, !dbg !598, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !599), !dbg !598
  %64 = add nsw i32 %52, 1, !dbg !600
  %65 = sext i32 %64 to i64, !dbg !600
  %66 = getelementptr inbounds double* %a, i64 %65, !dbg !600
  %67 = load double* %66, align 8, !dbg !600, !tbaa !243
  %68 = fsub double -0.000000e+00, %67, !dbg !600
  tail call void @llvm.dbg.value(metadata !{double %68}, i64 0, metadata !601), !dbg !600
  store double %63, double* %54, align 8, !dbg !602, !tbaa !243
  store double %68, double* %58, align 8, !dbg !603, !tbaa !243
  store double %55, double* %62, align 8, !dbg !604, !tbaa !243
  store double %60, double* %66, align 8, !dbg !605, !tbaa !243
  %69 = add nsw i32 %49, %37, !dbg !606
  tail call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !592), !dbg !606
  %70 = add nsw i32 %52, %41, !dbg !586
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !593), !dbg !586
  %71 = sext i32 %69 to i64, !dbg !607
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !607
  %73 = load double* %72, align 8, !dbg !607, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !595), !dbg !607
  %74 = add nsw i32 %69, 1, !dbg !608
  %75 = sext i32 %74 to i64, !dbg !608
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !608
  %77 = load double* %76, align 8, !dbg !608, !tbaa !243
  %78 = fsub double -0.000000e+00, %77, !dbg !608
  tail call void @llvm.dbg.value(metadata !{double %78}, i64 0, metadata !597), !dbg !608
  %79 = sext i32 %70 to i64, !dbg !609
  %80 = getelementptr inbounds double* %a, i64 %79, !dbg !609
  %81 = load double* %80, align 8, !dbg !609, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !599), !dbg !609
  %82 = add nsw i32 %70, 1, !dbg !610
  %83 = sext i32 %82 to i64, !dbg !610
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !610
  %85 = load double* %84, align 8, !dbg !610, !tbaa !243
  %86 = fsub double -0.000000e+00, %85, !dbg !610
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !601), !dbg !610
  store double %81, double* %72, align 8, !dbg !611, !tbaa !243
  store double %86, double* %76, align 8, !dbg !612, !tbaa !243
  store double %73, double* %80, align 8, !dbg !613, !tbaa !243
  store double %78, double* %84, align 8, !dbg !614, !tbaa !243
  %87 = add nsw i32 %69, %37, !dbg !615
  tail call void @llvm.dbg.value(metadata !{i32 %87}, i64 0, metadata !592), !dbg !615
  %88 = sub nsw i32 %70, %37, !dbg !616
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !593), !dbg !616
  %89 = sext i32 %87 to i64, !dbg !617
  %90 = getelementptr inbounds double* %a, i64 %89, !dbg !617
  %91 = load double* %90, align 8, !dbg !617, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !595), !dbg !617
  %92 = add nsw i32 %87, 1, !dbg !618
  %93 = sext i32 %92 to i64, !dbg !618
  %94 = getelementptr inbounds double* %a, i64 %93, !dbg !618
  %95 = load double* %94, align 8, !dbg !618, !tbaa !243
  %96 = fsub double -0.000000e+00, %95, !dbg !618
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !597), !dbg !618
  %97 = sext i32 %88 to i64, !dbg !619
  %98 = getelementptr inbounds double* %a, i64 %97, !dbg !619
  %99 = load double* %98, align 8, !dbg !619, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !599), !dbg !619
  %100 = add nsw i32 %88, 1, !dbg !620
  %101 = sext i32 %100 to i64, !dbg !620
  %102 = getelementptr inbounds double* %a, i64 %101, !dbg !620
  %103 = load double* %102, align 8, !dbg !620, !tbaa !243
  %104 = fsub double -0.000000e+00, %103, !dbg !620
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !601), !dbg !620
  store double %99, double* %90, align 8, !dbg !621, !tbaa !243
  store double %104, double* %94, align 8, !dbg !622, !tbaa !243
  store double %91, double* %98, align 8, !dbg !623, !tbaa !243
  store double %96, double* %102, align 8, !dbg !624, !tbaa !243
  %105 = add nsw i32 %87, %37, !dbg !625
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !592), !dbg !625
  %106 = add nsw i32 %88, %41, !dbg !626
  tail call void @llvm.dbg.value(metadata !{i32 %106}, i64 0, metadata !593), !dbg !626
  %107 = sext i32 %105 to i64, !dbg !627
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !627
  %109 = load double* %108, align 8, !dbg !627, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !595), !dbg !627
  %110 = add nsw i32 %105, 1, !dbg !628
  %111 = sext i32 %110 to i64, !dbg !628
  %112 = getelementptr inbounds double* %a, i64 %111, !dbg !628
  %113 = load double* %112, align 8, !dbg !628, !tbaa !243
  %114 = fsub double -0.000000e+00, %113, !dbg !628
  tail call void @llvm.dbg.value(metadata !{double %114}, i64 0, metadata !597), !dbg !628
  %115 = sext i32 %106 to i64, !dbg !629
  %116 = getelementptr inbounds double* %a, i64 %115, !dbg !629
  %117 = load double* %116, align 8, !dbg !629, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !599), !dbg !629
  %118 = add nsw i32 %106, 1, !dbg !630
  %119 = sext i32 %118 to i64, !dbg !630
  %120 = getelementptr inbounds double* %a, i64 %119, !dbg !630
  %121 = load double* %120, align 8, !dbg !630, !tbaa !243
  %122 = fsub double -0.000000e+00, %121, !dbg !630
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !601), !dbg !630
  store double %117, double* %108, align 8, !dbg !631, !tbaa !243
  store double %122, double* %112, align 8, !dbg !632, !tbaa !243
  store double %109, double* %116, align 8, !dbg !633, !tbaa !243
  store double %114, double* %120, align 8, !dbg !634, !tbaa !243
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !589
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32, !dbg !589
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv, !dbg !589
  br i1 %exitcond, label %._crit_edge.i, label %.lr.ph.i, !dbg !589

._crit_edge.i:                                    ; preds = %.lr.ph.i, %.preheader.i
  %123 = add nsw i32 %45, %46, !dbg !635
  tail call void @llvm.dbg.value(metadata !{i32 %123}, i64 0, metadata !593), !dbg !635
  %124 = add nsw i32 %123, 1, !dbg !636
  %125 = sext i32 %124 to i64, !dbg !636
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !636
  %127 = load double* %126, align 8, !dbg !636, !tbaa !243
  %128 = fsub double -0.000000e+00, %127, !dbg !636
  store double %128, double* %126, align 8, !dbg !636, !tbaa !243
  %129 = add nsw i32 %123, %37, !dbg !637
  tail call void @llvm.dbg.value(metadata !{i32 %129}, i64 0, metadata !592), !dbg !637
  %130 = add nsw i32 %129, %37, !dbg !638
  tail call void @llvm.dbg.value(metadata !{i32 %130}, i64 0, metadata !593), !dbg !638
  %131 = sext i32 %129 to i64, !dbg !639
  %132 = getelementptr inbounds double* %a, i64 %131, !dbg !639
  %133 = load double* %132, align 8, !dbg !639, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %133}, i64 0, metadata !595), !dbg !639
  %134 = add nsw i32 %129, 1, !dbg !640
  %135 = sext i32 %134 to i64, !dbg !640
  %136 = getelementptr inbounds double* %a, i64 %135, !dbg !640
  %137 = load double* %136, align 8, !dbg !640, !tbaa !243
  %138 = fsub double -0.000000e+00, %137, !dbg !640
  tail call void @llvm.dbg.value(metadata !{double %138}, i64 0, metadata !597), !dbg !640
  %139 = sext i32 %130 to i64, !dbg !641
  %140 = getelementptr inbounds double* %a, i64 %139, !dbg !641
  %141 = load double* %140, align 8, !dbg !641, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %141}, i64 0, metadata !599), !dbg !641
  %142 = add nsw i32 %130, 1, !dbg !642
  %143 = sext i32 %142 to i64, !dbg !642
  %144 = getelementptr inbounds double* %a, i64 %143, !dbg !642
  %145 = load double* %144, align 8, !dbg !642, !tbaa !243
  %146 = fsub double -0.000000e+00, %145, !dbg !642
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !601), !dbg !642
  store double %141, double* %132, align 8, !dbg !643, !tbaa !243
  store double %146, double* %136, align 8, !dbg !644, !tbaa !243
  store double %133, double* %140, align 8, !dbg !645, !tbaa !243
  store double %138, double* %144, align 8, !dbg !646, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !593), !dbg !584
  %147 = add i32 %130, %40, !dbg !647
  %148 = sext i32 %147 to i64, !dbg !647
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !647
  %150 = load double* %149, align 8, !dbg !647, !tbaa !243
  %151 = fsub double -0.000000e+00, %150, !dbg !647
  store double %151, double* %149, align 8, !dbg !647, !tbaa !243
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 1, !dbg !581
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1, !dbg !581
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next}, i64 0, metadata !648), !dbg !581
  %lftr.wideiv14 = trunc i64 %indvars.iv.next28.i to i32, !dbg !581
  %exitcond15 = icmp eq i32 %lftr.wideiv14, %m.0.lcssa.i, !dbg !581
  br i1 %exitcond15, label %bitrv2conj.exit, label %.preheader.i, !dbg !581

; <label>:152                                     ; preds = %._crit_edge19.i
  %153 = getelementptr inbounds double* %a, i64 1, !dbg !649
  %154 = load double* %153, align 8, !dbg !649, !tbaa !243
  %155 = fsub double -0.000000e+00, %154, !dbg !649
  store double %155, double* %153, align 8, !dbg !649, !tbaa !243
  %156 = or i32 %37, 1, !dbg !651
  %157 = sext i32 %156 to i64, !dbg !651
  %158 = getelementptr inbounds double* %a, i64 %157, !dbg !651
  %159 = load double* %158, align 8, !dbg !651, !tbaa !243
  %160 = fsub double -0.000000e+00, %159, !dbg !651
  store double %160, double* %158, align 8, !dbg !651, !tbaa !243
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !648), !dbg !652
  %161 = icmp sgt i32 %m.0.lcssa.i, 1, !dbg !652
  br i1 %161, label %.lr.ph7.i, label %bitrv2conj.exit, !dbg !652

.lr.ph7.i:                                        ; preds = %152, %._crit_edge8.i
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %._crit_edge8.i ], [ 1, %152 ]
  %indvars.iv37.i = phi i64 [ %indvars.iv.next38.i, %._crit_edge8.i ], [ 1, %152 ]
  %162 = getelementptr inbounds i32* %ip, i64 %indvars.iv37.i, !dbg !654
  %163 = load i32* %162, align 4, !dbg !654, !tbaa !558
  %164 = trunc i64 %indvars.iv37.i to i32, !dbg !658
  %165 = shl nsw i32 %164, 1, !dbg !658
  br label %166, !dbg !659

; <label>:166                                     ; preds = %166, %.lr.ph7.i
  %indvars.iv31.i = phi i64 [ 0, %.lr.ph7.i ], [ %indvars.iv.next32.i, %166 ]
  %167 = trunc i64 %indvars.iv31.i to i32, !dbg !654
  %168 = shl nsw i32 %167, 1, !dbg !654
  %169 = add nsw i32 %168, %163, !dbg !654
  tail call void @llvm.dbg.value(metadata !{i32 %169}, i64 0, metadata !592), !dbg !654
  %170 = getelementptr inbounds i32* %ip, i64 %indvars.iv31.i, !dbg !658
  %171 = load i32* %170, align 4, !dbg !658, !tbaa !558
  %172 = add nsw i32 %171, %165, !dbg !658
  tail call void @llvm.dbg.value(metadata !{i32 %172}, i64 0, metadata !593), !dbg !658
  %173 = sext i32 %169 to i64, !dbg !660
  %174 = getelementptr inbounds double* %a, i64 %173, !dbg !660
  %175 = load double* %174, align 8, !dbg !660, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !595), !dbg !660
  %176 = add nsw i32 %169, 1, !dbg !661
  %177 = sext i32 %176 to i64, !dbg !661
  %178 = getelementptr inbounds double* %a, i64 %177, !dbg !661
  %179 = load double* %178, align 8, !dbg !661, !tbaa !243
  %180 = fsub double -0.000000e+00, %179, !dbg !661
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !597), !dbg !661
  %181 = sext i32 %172 to i64, !dbg !662
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !662
  %183 = load double* %182, align 8, !dbg !662, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %183}, i64 0, metadata !599), !dbg !662
  %184 = add nsw i32 %172, 1, !dbg !663
  %185 = sext i32 %184 to i64, !dbg !663
  %186 = getelementptr inbounds double* %a, i64 %185, !dbg !663
  %187 = load double* %186, align 8, !dbg !663, !tbaa !243
  %188 = fsub double -0.000000e+00, %187, !dbg !663
  tail call void @llvm.dbg.value(metadata !{double %188}, i64 0, metadata !601), !dbg !663
  store double %183, double* %174, align 8, !dbg !664, !tbaa !243
  store double %188, double* %178, align 8, !dbg !665, !tbaa !243
  store double %175, double* %182, align 8, !dbg !666, !tbaa !243
  store double %180, double* %186, align 8, !dbg !667, !tbaa !243
  %189 = add nsw i32 %169, %37, !dbg !668
  tail call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !592), !dbg !668
  %190 = add nsw i32 %172, %37, !dbg !669
  tail call void @llvm.dbg.value(metadata !{i32 %190}, i64 0, metadata !593), !dbg !669
  %191 = sext i32 %189 to i64, !dbg !670
  %192 = getelementptr inbounds double* %a, i64 %191, !dbg !670
  %193 = load double* %192, align 8, !dbg !670, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %193}, i64 0, metadata !595), !dbg !670
  %194 = add nsw i32 %189, 1, !dbg !671
  %195 = sext i32 %194 to i64, !dbg !671
  %196 = getelementptr inbounds double* %a, i64 %195, !dbg !671
  %197 = load double* %196, align 8, !dbg !671, !tbaa !243
  %198 = fsub double -0.000000e+00, %197, !dbg !671
  tail call void @llvm.dbg.value(metadata !{double %198}, i64 0, metadata !597), !dbg !671
  %199 = sext i32 %190 to i64, !dbg !672
  %200 = getelementptr inbounds double* %a, i64 %199, !dbg !672
  %201 = load double* %200, align 8, !dbg !672, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %201}, i64 0, metadata !599), !dbg !672
  %202 = add nsw i32 %190, 1, !dbg !673
  %203 = sext i32 %202 to i64, !dbg !673
  %204 = getelementptr inbounds double* %a, i64 %203, !dbg !673
  %205 = load double* %204, align 8, !dbg !673, !tbaa !243
  %206 = fsub double -0.000000e+00, %205, !dbg !673
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !601), !dbg !673
  store double %201, double* %192, align 8, !dbg !674, !tbaa !243
  store double %206, double* %196, align 8, !dbg !675, !tbaa !243
  store double %193, double* %200, align 8, !dbg !676, !tbaa !243
  store double %198, double* %204, align 8, !dbg !677, !tbaa !243
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !659
  %lftr.wideiv18 = trunc i64 %indvars.iv.next32.i to i32, !dbg !659
  %exitcond19 = icmp eq i32 %lftr.wideiv18, %indvars.iv16, !dbg !659
  br i1 %exitcond19, label %._crit_edge8.i, label %166, !dbg !659

._crit_edge8.i:                                   ; preds = %166
  %207 = add nsw i32 %163, %165, !dbg !678
  tail call void @llvm.dbg.value(metadata !{i32 %207}, i64 0, metadata !593), !dbg !678
  %208 = add nsw i32 %207, 1, !dbg !679
  %209 = sext i32 %208 to i64, !dbg !679
  %210 = getelementptr inbounds double* %a, i64 %209, !dbg !679
  %211 = load double* %210, align 8, !dbg !679, !tbaa !243
  %212 = fsub double -0.000000e+00, %211, !dbg !679
  store double %212, double* %210, align 8, !dbg !679, !tbaa !243
  %213 = add i32 %207, %156, !dbg !680
  %214 = sext i32 %213 to i64, !dbg !680
  %215 = getelementptr inbounds double* %a, i64 %214, !dbg !680
  %216 = load double* %215, align 8, !dbg !680, !tbaa !243
  %217 = fsub double -0.000000e+00, %216, !dbg !680
  store double %217, double* %215, align 8, !dbg !680, !tbaa !243
  %indvars.iv.next38.i = add nuw nsw i64 %indvars.iv37.i, 1, !dbg !652
  %indvars.iv.next17 = add nuw nsw i32 %indvars.iv16, 1, !dbg !652
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next17}, i64 0, metadata !648), !dbg !652
  %lftr.wideiv20 = trunc i64 %indvars.iv.next38.i to i32, !dbg !652
  %exitcond21 = icmp eq i32 %lftr.wideiv20, %m.0.lcssa.i, !dbg !652
  br i1 %exitcond21, label %bitrv2conj.exit, label %.lr.ph7.i, !dbg !652

bitrv2conj.exit:                                  ; preds = %._crit_edge8.i, %._crit_edge.i, %.preheader1.i, %152
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !681) #6, !dbg !683
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !684) #6, !dbg !683
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !685) #6, !dbg !683
  tail call void @llvm.dbg.value(metadata !299, i64 0, metadata !686) #6, !dbg !687
  br i1 %6, label %218, label %.loopexit3.i, !dbg !688

; <label>:218                                     ; preds = %bitrv2conj.exit
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w) #6, !dbg !690
  tail call void @llvm.dbg.value(metadata !305, i64 0, metadata !686) #6, !dbg !692
  %219 = icmp sgt i32 %n, 32, !dbg !693
  br i1 %219, label %.lr.ph8.i, label %.loopexit3.i, !dbg !693

.lr.ph8.i:                                        ; preds = %218, %.lr.ph8.i
  %220 = phi i32 [ %221, %.lr.ph8.i ], [ 32, %218 ]
  %l.07.i = phi i32 [ %220, %.lr.ph8.i ], [ 8, %218 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07.i, double* %a, double* %w) #6, !dbg !694
  tail call void @llvm.dbg.value(metadata !{i32 %220}, i64 0, metadata !686) #6, !dbg !696
  %221 = shl i32 %220, 2, !dbg !693
  %222 = icmp slt i32 %221, %n, !dbg !693
  br i1 %222, label %.lr.ph8.i, label %.loopexit3.i, !dbg !693

.loopexit3.i:                                     ; preds = %.lr.ph8.i, %218, %bitrv2conj.exit
  %l.1.i = phi i32 [ 2, %bitrv2conj.exit ], [ 8, %218 ], [ %220, %.lr.ph8.i ]
  %223 = shl i32 %l.1.i, 2, !dbg !697
  %224 = icmp eq i32 %223, %n, !dbg !697
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !699) #6, !dbg !700
  %225 = icmp sgt i32 %l.1.i, 0, !dbg !700
  br i1 %224, label %.preheader.i2, label %.preheader1.i1, !dbg !697

.preheader1.i1:                                   ; preds = %.loopexit3.i
  br i1 %225, label %.lr.ph6.i, label %cftbsub.exit, !dbg !703

.lr.ph6.i:                                        ; preds = %.preheader1.i1
  %226 = sext i32 %l.1.i to i64, !dbg !703
  br label %277, !dbg !703

.preheader.i2:                                    ; preds = %.loopexit3.i
  br i1 %225, label %.lr.ph.i3, label %cftbsub.exit, !dbg !700

.lr.ph.i3:                                        ; preds = %.preheader.i2
  %227 = sext i32 %l.1.i to i64, !dbg !700
  br label %228, !dbg !700

; <label>:228                                     ; preds = %228, %.lr.ph.i3
  %indvars.iv.i4 = phi i64 [ 0, %.lr.ph.i3 ], [ %indvars.iv.next.i5, %228 ]
  %229 = add nsw i64 %indvars.iv.i4, %227, !dbg !706
  %230 = add nsw i64 %229, %227, !dbg !708
  %231 = add nsw i64 %230, %227, !dbg !709
  %232 = getelementptr inbounds double* %a, i64 %indvars.iv.i4, !dbg !710
  %233 = load double* %232, align 8, !dbg !710, !tbaa !243
  %234 = getelementptr inbounds double* %a, i64 %229, !dbg !710
  %235 = load double* %234, align 8, !dbg !710, !tbaa !243
  %236 = fadd double %233, %235, !dbg !710
  tail call void @llvm.dbg.value(metadata !{double %236}, i64 0, metadata !711) #6, !dbg !710
  %237 = or i64 %indvars.iv.i4, 1, !dbg !712
  %238 = getelementptr inbounds double* %a, i64 %237, !dbg !712
  %239 = load double* %238, align 8, !dbg !712, !tbaa !243
  %240 = fsub double -0.000000e+00, %239, !dbg !712
  %241 = add nsw i64 %229, 1, !dbg !712
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !712
  %243 = load double* %242, align 8, !dbg !712, !tbaa !243
  %244 = fsub double %240, %243, !dbg !712
  tail call void @llvm.dbg.value(metadata !{double %244}, i64 0, metadata !713) #6, !dbg !712
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !714) #6, !dbg !715
  %245 = insertelement <2 x double> undef, double %233, i32 0, !dbg !715
  %246 = insertelement <2 x double> %245, double %243, i32 1, !dbg !715
  %247 = insertelement <2 x double> undef, double %235, i32 0, !dbg !715
  %248 = insertelement <2 x double> %247, double %239, i32 1, !dbg !715
  %249 = fsub <2 x double> %246, %248, !dbg !715
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !716) #6, !dbg !717
  %250 = getelementptr inbounds double* %a, i64 %230, !dbg !718
  %251 = load double* %250, align 8, !dbg !718, !tbaa !243
  %252 = getelementptr inbounds double* %a, i64 %231, !dbg !718
  %253 = load double* %252, align 8, !dbg !718, !tbaa !243
  %254 = fadd double %251, %253, !dbg !718
  tail call void @llvm.dbg.value(metadata !{double %254}, i64 0, metadata !719) #6, !dbg !718
  %255 = add nsw i64 %230, 1, !dbg !720
  %256 = getelementptr inbounds double* %a, i64 %255, !dbg !720
  %257 = load double* %256, align 8, !dbg !720, !tbaa !243
  %258 = add nsw i64 %231, 1, !dbg !720
  %259 = getelementptr inbounds double* %a, i64 %258, !dbg !720
  %260 = load double* %259, align 8, !dbg !720, !tbaa !243
  %261 = fadd double %257, %260, !dbg !720
  tail call void @llvm.dbg.value(metadata !{double %261}, i64 0, metadata !721) #6, !dbg !720
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !722) #6, !dbg !723
  %262 = insertelement <2 x double> undef, double %257, i32 0, !dbg !724
  %263 = insertelement <2 x double> %262, double %251, i32 1, !dbg !724
  %264 = insertelement <2 x double> undef, double %260, i32 0, !dbg !724
  %265 = insertelement <2 x double> %264, double %253, i32 1, !dbg !724
  %266 = fsub <2 x double> %263, %265, !dbg !724
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !725) #6, !dbg !724
  %267 = fadd double %236, %254, !dbg !726
  store double %267, double* %232, align 8, !dbg !726, !tbaa !243
  %268 = fsub double %244, %261, !dbg !727
  store double %268, double* %238, align 8, !dbg !727, !tbaa !243
  %269 = fsub double %236, %254, !dbg !728
  store double %269, double* %250, align 8, !dbg !728, !tbaa !243
  %270 = fadd double %244, %261, !dbg !729
  store double %270, double* %256, align 8, !dbg !729, !tbaa !243
  %271 = fsub <2 x double> %249, %266, !dbg !730
  %272 = bitcast double* %234 to <2 x double>*, !dbg !730
  store <2 x double> %271, <2 x double>* %272, align 8, !dbg !730, !tbaa !243
  %273 = fadd <2 x double> %249, %266, !dbg !731
  %274 = bitcast double* %252 to <2 x double>*, !dbg !731
  store <2 x double> %273, <2 x double>* %274, align 8, !dbg !731, !tbaa !243
  %indvars.iv.next.i5 = add nuw nsw i64 %indvars.iv.i4, 2, !dbg !700
  %275 = trunc i64 %indvars.iv.next.i5 to i32, !dbg !700
  %276 = icmp slt i32 %275, %l.1.i, !dbg !700
  br i1 %276, label %228, label %cftbsub.exit, !dbg !700

; <label>:277                                     ; preds = %277, %.lr.ph6.i
  %indvars.iv9.i = phi i64 [ 0, %.lr.ph6.i ], [ %indvars.iv.next10.i, %277 ]
  %278 = add nsw i64 %indvars.iv9.i, %226, !dbg !732
  %279 = getelementptr inbounds double* %a, i64 %indvars.iv9.i, !dbg !734
  %280 = load double* %279, align 8, !dbg !734, !tbaa !243
  %281 = getelementptr inbounds double* %a, i64 %278, !dbg !734
  %282 = load double* %281, align 8, !dbg !734, !tbaa !243
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !711) #6, !dbg !734
  %283 = or i64 %indvars.iv9.i, 1, !dbg !735
  %284 = getelementptr inbounds double* %a, i64 %283, !dbg !735
  %285 = load double* %284, align 8, !dbg !735, !tbaa !243
  %286 = add nsw i64 %278, 1, !dbg !735
  %287 = getelementptr inbounds double* %a, i64 %286, !dbg !735
  %288 = load double* %287, align 8, !dbg !735, !tbaa !243
  %289 = insertelement <2 x double> undef, double %280, i32 0, !dbg !734
  %290 = insertelement <2 x double> %289, double %288, i32 1, !dbg !734
  %291 = insertelement <2 x double> undef, double %282, i32 0, !dbg !734
  %292 = insertelement <2 x double> %291, double %285, i32 1, !dbg !734
  %293 = fsub <2 x double> %290, %292, !dbg !734
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !713) #6, !dbg !735
  %294 = fadd double %280, %282, !dbg !736
  store double %294, double* %279, align 8, !dbg !736, !tbaa !243
  %295 = fsub double -0.000000e+00, %285, !dbg !737
  %296 = load double* %287, align 8, !dbg !737, !tbaa !243
  %297 = fsub double %295, %296, !dbg !737
  store double %297, double* %284, align 8, !dbg !737, !tbaa !243
  %298 = bitcast double* %281 to <2 x double>*, !dbg !738
  store <2 x double> %293, <2 x double>* %298, align 8, !dbg !738, !tbaa !243
  %indvars.iv.next10.i = add nuw nsw i64 %indvars.iv9.i, 2, !dbg !703
  %299 = trunc i64 %indvars.iv.next10.i to i32, !dbg !703
  %300 = icmp slt i32 %299, %l.1.i, !dbg !703
  br i1 %300, label %277, label %cftbsub.exit, !dbg !703

; <label>:301                                     ; preds = %0
  %302 = icmp eq i32 %n, 4, !dbg !739
  br i1 %302, label %303, label %cftbsub.exit, !dbg !739

; <label>:303                                     ; preds = %301
  tail call fastcc void @cftfsub(i32 4, double* %a, double* %w), !dbg !741
  br label %cftbsub.exit, !dbg !743

cftbsub.exit:                                     ; preds = %277, %228, %.preheader.i2, %.preheader1.i1, %301, %303, %4
  ret void, !dbg !744
}

; Function Attrs: nounwind readonly uwtable
define double @errorcheck(i32 %nini, i32 %nend, double %scale, double* nocapture readonly %a) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !47), !dbg !745
  tail call void @llvm.dbg.value(metadata !{i32 %nend}, i64 0, metadata !48), !dbg !745
  tail call void @llvm.dbg.value(metadata !{double %scale}, i64 0, metadata !49), !dbg !745
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !50), !dbg !745
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !52), !dbg !746
  tail call void @llvm.dbg.value(metadata !216, i64 0, metadata !53), !dbg !747
  tail call void @llvm.dbg.value(metadata !{i32 %nini}, i64 0, metadata !51), !dbg !748
  %1 = icmp sgt i32 %nini, %nend, !dbg !748
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !748

.lr.ph:                                           ; preds = %0
  %2 = sext i32 %nini to i64
  br label %3, !dbg !748

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %3 ], [ %2, %.lr.ph ]
  %err.04 = phi double [ %err.0., %3 ], [ 0.000000e+00, %.lr.ph ]
  %seed.03 = phi i32 [ %phitmp2, %3 ], [ 54773, %.lr.ph ]
  tail call void @llvm.dbg.value(metadata !{i32 %seed.03}, i64 0, metadata !52), !dbg !749
  %4 = sitofp i32 %seed.03 to double, !dbg !749
  %5 = fmul double %4, 0x3ED02E85C0898B71, !dbg !749
  %6 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !749
  %7 = load double* %6, align 8, !dbg !749, !tbaa !243
  %8 = fmul double %7, %scale, !dbg !749
  %9 = fsub double %5, %8, !dbg !749
  tail call void @llvm.dbg.value(metadata !{double %9}, i64 0, metadata !54), !dbg !749
  %10 = tail call double @fabs(double %9) #1, !dbg !750
  %11 = fcmp ogt double %err.04, %10, !dbg !750
  %err.0. = select i1 %11, double %err.04, double %10, !dbg !750
  tail call void @llvm.dbg.value(metadata !{double %err.0.}, i64 0, metadata !53), !dbg !750
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !748
  %phitmp = mul i32 %seed.03, 7141, !dbg !748
  %phitmp1 = add i32 %phitmp, 54773, !dbg !748
  %phitmp2 = srem i32 %phitmp1, 259200, !dbg !748
  %12 = trunc i64 %indvars.iv to i32, !dbg !748
  %13 = icmp slt i32 %12, %nend, !dbg !748
  br i1 %13, label %3, label %._crit_edge, !dbg !748

._crit_edge:                                      ; preds = %3, %0
  %err.0.lcssa = phi double [ 0.000000e+00, %0 ], [ %err.0., %3 ]
  ret double %err.0.lcssa, !dbg !751
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
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !199), !dbg !752
  tail call void @llvm.dbg.value(metadata !{i32* %ip}, i64 0, metadata !200), !dbg !752
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !201), !dbg !752
  store i32 0, i32* %ip, align 4, !dbg !753, !tbaa !558
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !206), !dbg !754
  tail call void @llvm.dbg.value(metadata !284, i64 0, metadata !207), !dbg !755
  %1 = icmp sgt i32 %n, 8, !dbg !756
  br i1 %1, label %.lr.ph19, label %._crit_edge20, !dbg !756

.lr.ph19:                                         ; preds = %0, %._crit_edge14
  %m.016 = phi i32 [ %29, %._crit_edge14 ], [ 1, %0 ]
  %l.015 = phi i32 [ %2, %._crit_edge14 ], [ %n, %0 ]
  %2 = ashr i32 %l.015, 1, !dbg !757
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !206), !dbg !757
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !202), !dbg !759
  %3 = icmp sgt i32 %m.016, 0, !dbg !759
  br i1 %3, label %.lr.ph13, label %._crit_edge14, !dbg !759

.lr.ph13:                                         ; preds = %.lr.ph19
  %4 = sext i32 %m.016 to i64, !dbg !759
  %5 = add i32 %m.016, -1, !dbg !759
  %6 = zext i32 %5 to i64
  %7 = add i64 %6, 1, !dbg !759
  %end.idx = add i64 %6, 1, !dbg !759
  %n.vec = and i64 %7, 8589934584, !dbg !759
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !759
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
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !759
  %12 = getelementptr inbounds i32* %ip, i64 %index, !dbg !761
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !761
  %wide.load = load <4 x i32>* %13, align 4, !dbg !761
  %.sum65 = or i64 %index, 4, !dbg !761
  %14 = getelementptr i32* %ip, i64 %.sum65, !dbg !761
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !761
  %wide.load58 = load <4 x i32>* %15, align 4, !dbg !761
  %16 = add nsw <4 x i32> %wide.load, %broadcast.splat60, !dbg !761
  %17 = add nsw <4 x i32> %wide.load58, %broadcast.splat60, !dbg !761
  %18 = add i64 %index, %4, !dbg !761
  %19 = getelementptr inbounds i32* %ip, i64 %18, !dbg !761
  %20 = bitcast i32* %19 to <4 x i32>*, !dbg !761
  store <4 x i32> %16, <4 x i32>* %20, align 4, !dbg !761
  %.sum = add i64 %18, 4, !dbg !761
  %21 = getelementptr i32* %ip, i64 %.sum, !dbg !761
  %22 = bitcast i32* %21 to <4 x i32>*, !dbg !761
  store <4 x i32> %17, <4 x i32>* %22, align 4, !dbg !761
  %index.next = add i64 %index, 8, !dbg !759
  %23 = icmp eq i64 %index.next, %n.vec, !dbg !759
  br i1 %23, label %middle.block, label %vector.body, !dbg !759, !llvm.loop !763

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph13
  %resume.val = phi i64 [ 0, %.lr.ph13 ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge14, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %scalar.ph ], [ %resume.val, %middle.block ]
  %24 = getelementptr inbounds i32* %ip, i64 %indvars.iv42, !dbg !761
  %25 = load i32* %24, align 4, !dbg !761, !tbaa !558
  %26 = add nsw i32 %25, %2, !dbg !761
  %27 = add nsw i64 %indvars.iv42, %4, !dbg !761
  %28 = getelementptr inbounds i32* %ip, i64 %27, !dbg !761
  store i32 %26, i32* %28, align 4, !dbg !761, !tbaa !558
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1, !dbg !759
  %lftr.wideiv44 = trunc i64 %indvars.iv.next43 to i32, !dbg !759
  %exitcond45 = icmp eq i32 %lftr.wideiv44, %m.016, !dbg !759
  br i1 %exitcond45, label %._crit_edge14, label %scalar.ph, !dbg !759, !llvm.loop !764

._crit_edge14:                                    ; preds = %scalar.ph, %middle.block, %.lr.ph19
  %29 = shl i32 %m.016, 1, !dbg !765
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !207), !dbg !765
  %30 = shl i32 %m.016, 4, !dbg !756
  %31 = icmp slt i32 %30, %2, !dbg !756
  br i1 %31, label %.lr.ph19, label %._crit_edge20, !dbg !756

._crit_edge20:                                    ; preds = %._crit_edge14, %0
  %.lcssa = phi i32 [ 8, %0 ], [ %30, %._crit_edge14 ]
  %m.0.lcssa = phi i32 [ 1, %0 ], [ %29, %._crit_edge14 ]
  %l.0.lcssa = phi i32 [ %n, %0 ], [ %2, %._crit_edge14 ]
  %32 = shl nsw i32 %m.0.lcssa, 1, !dbg !766
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !208), !dbg !766
  %33 = icmp eq i32 %.lcssa, %l.0.lcssa, !dbg !767
  br i1 %33, label %.preheader1, label %.preheader3, !dbg !767

.preheader3:                                      ; preds = %._crit_edge20
  %34 = icmp sgt i32 %m.0.lcssa, 1, !dbg !769
  br i1 %34, label %.lr.ph8, label %.loopexit, !dbg !769

.preheader1:                                      ; preds = %._crit_edge20
  %35 = icmp sgt i32 %m.0.lcssa, 0, !dbg !772
  br i1 %35, label %.preheader.lr.ph, label %.loopexit, !dbg !772

.preheader.lr.ph:                                 ; preds = %.preheader1
  %36 = shl i32 %m.0.lcssa, 2, !dbg !775
  br label %.preheader, !dbg !772

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv26 = phi i32 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge ]
  %37 = trunc i64 %indvars.iv28 to i32, !dbg !779
  %38 = icmp sgt i32 %37, 0, !dbg !779
  %39 = getelementptr inbounds i32* %ip, i64 %indvars.iv28, !dbg !780
  %40 = load i32* %39, align 4, !dbg !780, !tbaa !558
  %41 = shl i32 %37, 1, !dbg !781
  br i1 %38, label %.lr.ph, label %._crit_edge, !dbg !779

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %.preheader ]
  %42 = trunc i64 %indvars.iv to i32, !dbg !780
  %43 = shl nsw i32 %42, 1, !dbg !780
  %44 = add nsw i32 %40, %43, !dbg !780
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !203), !dbg !780
  %45 = getelementptr inbounds i32* %ip, i64 %indvars.iv, !dbg !781
  %46 = load i32* %45, align 4, !dbg !781, !tbaa !558
  %47 = add nsw i32 %46, %41, !dbg !781
  tail call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !205), !dbg !781
  %48 = sext i32 %44 to i64, !dbg !782
  %49 = getelementptr inbounds double* %a, i64 %48, !dbg !782
  %50 = load double* %49, align 8, !dbg !782, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !209), !dbg !782
  %51 = add nsw i32 %44, 1, !dbg !783
  %52 = sext i32 %51 to i64, !dbg !783
  %53 = getelementptr inbounds double* %a, i64 %52, !dbg !783
  %54 = load double* %53, align 8, !dbg !783, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %54}, i64 0, metadata !210), !dbg !783
  %55 = sext i32 %47 to i64, !dbg !784
  %56 = getelementptr inbounds double* %a, i64 %55, !dbg !784
  %57 = load double* %56, align 8, !dbg !784, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %57}, i64 0, metadata !211), !dbg !784
  %58 = add nsw i32 %47, 1, !dbg !785
  %59 = sext i32 %58 to i64, !dbg !785
  %60 = getelementptr inbounds double* %a, i64 %59, !dbg !785
  %61 = load double* %60, align 8, !dbg !785, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %61}, i64 0, metadata !212), !dbg !785
  store double %57, double* %49, align 8, !dbg !786, !tbaa !243
  store double %61, double* %53, align 8, !dbg !787, !tbaa !243
  store double %50, double* %56, align 8, !dbg !788, !tbaa !243
  store double %54, double* %60, align 8, !dbg !789, !tbaa !243
  %62 = add nsw i32 %44, %32, !dbg !790
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !203), !dbg !790
  %63 = add nsw i32 %47, %36, !dbg !775
  tail call void @llvm.dbg.value(metadata !{i32 %63}, i64 0, metadata !205), !dbg !775
  %64 = sext i32 %62 to i64, !dbg !791
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !791
  %66 = load double* %65, align 8, !dbg !791, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %66}, i64 0, metadata !209), !dbg !791
  %67 = add nsw i32 %62, 1, !dbg !792
  %68 = sext i32 %67 to i64, !dbg !792
  %69 = getelementptr inbounds double* %a, i64 %68, !dbg !792
  %70 = load double* %69, align 8, !dbg !792, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !210), !dbg !792
  %71 = sext i32 %63 to i64, !dbg !793
  %72 = getelementptr inbounds double* %a, i64 %71, !dbg !793
  %73 = load double* %72, align 8, !dbg !793, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !211), !dbg !793
  %74 = add nsw i32 %63, 1, !dbg !794
  %75 = sext i32 %74 to i64, !dbg !794
  %76 = getelementptr inbounds double* %a, i64 %75, !dbg !794
  %77 = load double* %76, align 8, !dbg !794, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %77}, i64 0, metadata !212), !dbg !794
  store double %73, double* %65, align 8, !dbg !795, !tbaa !243
  store double %77, double* %69, align 8, !dbg !796, !tbaa !243
  store double %66, double* %72, align 8, !dbg !797, !tbaa !243
  store double %70, double* %76, align 8, !dbg !798, !tbaa !243
  %78 = add nsw i32 %62, %32, !dbg !799
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !203), !dbg !799
  %79 = sub nsw i32 %63, %32, !dbg !800
  tail call void @llvm.dbg.value(metadata !{i32 %79}, i64 0, metadata !205), !dbg !800
  %80 = sext i32 %78 to i64, !dbg !801
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !801
  %82 = load double* %81, align 8, !dbg !801, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %82}, i64 0, metadata !209), !dbg !801
  %83 = add nsw i32 %78, 1, !dbg !802
  %84 = sext i32 %83 to i64, !dbg !802
  %85 = getelementptr inbounds double* %a, i64 %84, !dbg !802
  %86 = load double* %85, align 8, !dbg !802, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !210), !dbg !802
  %87 = sext i32 %79 to i64, !dbg !803
  %88 = getelementptr inbounds double* %a, i64 %87, !dbg !803
  %89 = load double* %88, align 8, !dbg !803, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %89}, i64 0, metadata !211), !dbg !803
  %90 = add nsw i32 %79, 1, !dbg !804
  %91 = sext i32 %90 to i64, !dbg !804
  %92 = getelementptr inbounds double* %a, i64 %91, !dbg !804
  %93 = load double* %92, align 8, !dbg !804, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !212), !dbg !804
  store double %89, double* %81, align 8, !dbg !805, !tbaa !243
  store double %93, double* %85, align 8, !dbg !806, !tbaa !243
  store double %82, double* %88, align 8, !dbg !807, !tbaa !243
  store double %86, double* %92, align 8, !dbg !808, !tbaa !243
  %94 = add nsw i32 %78, %32, !dbg !809
  tail call void @llvm.dbg.value(metadata !{i32 %94}, i64 0, metadata !203), !dbg !809
  %95 = add nsw i32 %79, %36, !dbg !810
  tail call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !205), !dbg !810
  %96 = sext i32 %94 to i64, !dbg !811
  %97 = getelementptr inbounds double* %a, i64 %96, !dbg !811
  %98 = load double* %97, align 8, !dbg !811, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %98}, i64 0, metadata !209), !dbg !811
  %99 = add nsw i32 %94, 1, !dbg !812
  %100 = sext i32 %99 to i64, !dbg !812
  %101 = getelementptr inbounds double* %a, i64 %100, !dbg !812
  %102 = load double* %101, align 8, !dbg !812, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !210), !dbg !812
  %103 = sext i32 %95 to i64, !dbg !813
  %104 = getelementptr inbounds double* %a, i64 %103, !dbg !813
  %105 = load double* %104, align 8, !dbg !813, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %105}, i64 0, metadata !211), !dbg !813
  %106 = add nsw i32 %95, 1, !dbg !814
  %107 = sext i32 %106 to i64, !dbg !814
  %108 = getelementptr inbounds double* %a, i64 %107, !dbg !814
  %109 = load double* %108, align 8, !dbg !814, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %109}, i64 0, metadata !212), !dbg !814
  store double %105, double* %97, align 8, !dbg !815, !tbaa !243
  store double %109, double* %101, align 8, !dbg !816, !tbaa !243
  store double %98, double* %104, align 8, !dbg !817, !tbaa !243
  store double %102, double* %108, align 8, !dbg !818, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !779
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !779
  %exitcond = icmp eq i32 %lftr.wideiv, %indvars.iv26, !dbg !779
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !779

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %110 = add nsw i32 %41, %32, !dbg !819
  %111 = add nsw i32 %110, %40, !dbg !819
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !203), !dbg !819
  %112 = add nsw i32 %111, %32, !dbg !820
  tail call void @llvm.dbg.value(metadata !{i32 %112}, i64 0, metadata !205), !dbg !820
  %113 = sext i32 %111 to i64, !dbg !821
  %114 = getelementptr inbounds double* %a, i64 %113, !dbg !821
  %115 = load double* %114, align 8, !dbg !821, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %115}, i64 0, metadata !209), !dbg !821
  %116 = add nsw i32 %111, 1, !dbg !822
  %117 = sext i32 %116 to i64, !dbg !822
  %118 = getelementptr inbounds double* %a, i64 %117, !dbg !822
  %119 = load double* %118, align 8, !dbg !822, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %119}, i64 0, metadata !210), !dbg !822
  %120 = sext i32 %112 to i64, !dbg !823
  %121 = getelementptr inbounds double* %a, i64 %120, !dbg !823
  %122 = load double* %121, align 8, !dbg !823, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %122}, i64 0, metadata !211), !dbg !823
  %123 = add nsw i32 %112, 1, !dbg !824
  %124 = sext i32 %123 to i64, !dbg !824
  %125 = getelementptr inbounds double* %a, i64 %124, !dbg !824
  %126 = load double* %125, align 8, !dbg !824, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %126}, i64 0, metadata !212), !dbg !824
  store double %122, double* %114, align 8, !dbg !825, !tbaa !243
  store double %126, double* %118, align 8, !dbg !826, !tbaa !243
  store double %115, double* %121, align 8, !dbg !827, !tbaa !243
  store double %119, double* %125, align 8, !dbg !828, !tbaa !243
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !772
  %indvars.iv.next27 = add nuw nsw i32 %indvars.iv26, 1, !dbg !772
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next27}, i64 0, metadata !204), !dbg !772
  %lftr.wideiv30 = trunc i64 %indvars.iv.next29 to i32, !dbg !772
  %exitcond31 = icmp eq i32 %lftr.wideiv30, %m.0.lcssa, !dbg !772
  br i1 %exitcond31, label %.loopexit, label %.preheader, !dbg !772

.lr.ph8:                                          ; preds = %.preheader3, %._crit_edge9
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge9 ], [ 1, %.preheader3 ]
  %indvars.iv34 = phi i32 [ %indvars.iv.next35, %._crit_edge9 ], [ 1, %.preheader3 ]
  %127 = getelementptr inbounds i32* %ip, i64 %indvars.iv38, !dbg !829
  %128 = load i32* %127, align 4, !dbg !829, !tbaa !558
  %129 = trunc i64 %indvars.iv38 to i32, !dbg !833
  %130 = shl nsw i32 %129, 1, !dbg !833
  br label %131, !dbg !834

; <label>:131                                     ; preds = %131, %.lr.ph8
  %indvars.iv32 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next33, %131 ]
  %132 = trunc i64 %indvars.iv32 to i32, !dbg !829
  %133 = shl nsw i32 %132, 1, !dbg !829
  %134 = add nsw i32 %128, %133, !dbg !829
  tail call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !203), !dbg !829
  %135 = getelementptr inbounds i32* %ip, i64 %indvars.iv32, !dbg !833
  %136 = load i32* %135, align 4, !dbg !833, !tbaa !558
  %137 = add nsw i32 %136, %130, !dbg !833
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !205), !dbg !833
  %138 = sext i32 %134 to i64, !dbg !835
  %139 = getelementptr inbounds double* %a, i64 %138, !dbg !835
  %140 = load double* %139, align 8, !dbg !835, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %140}, i64 0, metadata !209), !dbg !835
  %141 = add nsw i32 %134, 1, !dbg !836
  %142 = sext i32 %141 to i64, !dbg !836
  %143 = getelementptr inbounds double* %a, i64 %142, !dbg !836
  %144 = load double* %143, align 8, !dbg !836, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !210), !dbg !836
  %145 = sext i32 %137 to i64, !dbg !837
  %146 = getelementptr inbounds double* %a, i64 %145, !dbg !837
  %147 = load double* %146, align 8, !dbg !837, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !211), !dbg !837
  %148 = add nsw i32 %137, 1, !dbg !838
  %149 = sext i32 %148 to i64, !dbg !838
  %150 = getelementptr inbounds double* %a, i64 %149, !dbg !838
  %151 = load double* %150, align 8, !dbg !838, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %151}, i64 0, metadata !212), !dbg !838
  store double %147, double* %139, align 8, !dbg !839, !tbaa !243
  store double %151, double* %143, align 8, !dbg !840, !tbaa !243
  store double %140, double* %146, align 8, !dbg !841, !tbaa !243
  store double %144, double* %150, align 8, !dbg !842, !tbaa !243
  %152 = add nsw i32 %134, %32, !dbg !843
  tail call void @llvm.dbg.value(metadata !{i32 %152}, i64 0, metadata !203), !dbg !843
  %153 = add nsw i32 %137, %32, !dbg !844
  tail call void @llvm.dbg.value(metadata !{i32 %153}, i64 0, metadata !205), !dbg !844
  %154 = sext i32 %152 to i64, !dbg !845
  %155 = getelementptr inbounds double* %a, i64 %154, !dbg !845
  %156 = load double* %155, align 8, !dbg !845, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !209), !dbg !845
  %157 = add nsw i32 %152, 1, !dbg !846
  %158 = sext i32 %157 to i64, !dbg !846
  %159 = getelementptr inbounds double* %a, i64 %158, !dbg !846
  %160 = load double* %159, align 8, !dbg !846, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %160}, i64 0, metadata !210), !dbg !846
  %161 = sext i32 %153 to i64, !dbg !847
  %162 = getelementptr inbounds double* %a, i64 %161, !dbg !847
  %163 = load double* %162, align 8, !dbg !847, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !211), !dbg !847
  %164 = add nsw i32 %153, 1, !dbg !848
  %165 = sext i32 %164 to i64, !dbg !848
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !848
  %167 = load double* %166, align 8, !dbg !848, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %167}, i64 0, metadata !212), !dbg !848
  store double %163, double* %155, align 8, !dbg !849, !tbaa !243
  store double %167, double* %159, align 8, !dbg !850, !tbaa !243
  store double %156, double* %162, align 8, !dbg !851, !tbaa !243
  store double %160, double* %166, align 8, !dbg !852, !tbaa !243
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !834
  %lftr.wideiv36 = trunc i64 %indvars.iv.next33 to i32, !dbg !834
  %exitcond37 = icmp eq i32 %lftr.wideiv36, %indvars.iv34, !dbg !834
  br i1 %exitcond37, label %._crit_edge9, label %131, !dbg !834

._crit_edge9:                                     ; preds = %131
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1, !dbg !769
  %indvars.iv.next35 = add nuw nsw i32 %indvars.iv34, 1, !dbg !769
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next35}, i64 0, metadata !204), !dbg !769
  %lftr.wideiv40 = trunc i64 %indvars.iv.next39 to i32, !dbg !769
  %exitcond41 = icmp eq i32 %lftr.wideiv40, %m.0.lcssa, !dbg !769
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8, !dbg !769

.loopexit:                                        ; preds = %._crit_edge9, %._crit_edge, %.preheader3, %.preheader1
  ret void, !dbg !853
}

; Function Attrs: nounwind uwtable
define internal fastcc void @cftfsub(i32 %n, double* %a, double* nocapture readonly %w) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !165), !dbg !854
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !166), !dbg !854
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !167), !dbg !854
  tail call void @llvm.dbg.value(metadata !299, i64 0, metadata !172), !dbg !855
  %1 = icmp sgt i32 %n, 8, !dbg !856
  br i1 %1, label %2, label %.loopexit3, !dbg !856

; <label>:2                                       ; preds = %0
  tail call fastcc void @cft1st(i32 %n, double* %a, double* %w), !dbg !857
  tail call void @llvm.dbg.value(metadata !305, i64 0, metadata !172), !dbg !858
  %3 = icmp sgt i32 %n, 32, !dbg !859
  br i1 %3, label %.lr.ph8, label %.loopexit3, !dbg !859

.lr.ph8:                                          ; preds = %2, %.lr.ph8
  %4 = phi i32 [ %5, %.lr.ph8 ], [ 32, %2 ]
  %l.07 = phi i32 [ %4, %.lr.ph8 ], [ 8, %2 ]
  tail call fastcc void @cftmdl(i32 %n, i32 %l.07, double* %a, double* %w), !dbg !860
  tail call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !172), !dbg !861
  %5 = shl i32 %4, 2, !dbg !859
  %6 = icmp slt i32 %5, %n, !dbg !859
  br i1 %6, label %.lr.ph8, label %.loopexit3, !dbg !859

.loopexit3:                                       ; preds = %.lr.ph8, %2, %0
  %l.1 = phi i32 [ 2, %0 ], [ 8, %2 ], [ %4, %.lr.ph8 ]
  %7 = shl i32 %l.1, 2, !dbg !862
  %8 = icmp eq i32 %7, %n, !dbg !862
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !168), !dbg !863
  %9 = icmp sgt i32 %l.1, 0, !dbg !863
  br i1 %8, label %.preheader, label %.preheader1, !dbg !862

.preheader1:                                      ; preds = %.loopexit3
  br i1 %9, label %.lr.ph6, label %.loopexit, !dbg !864

.lr.ph6:                                          ; preds = %.preheader1
  %10 = sext i32 %l.1 to i64, !dbg !864
  br label %56, !dbg !864

.preheader:                                       ; preds = %.loopexit3
  br i1 %9, label %.lr.ph, label %.loopexit, !dbg !863

.lr.ph:                                           ; preds = %.preheader
  %11 = sext i32 %l.1 to i64, !dbg !863
  br label %12, !dbg !863

; <label>:12                                      ; preds = %.lr.ph, %12
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %12 ]
  %13 = add nsw i64 %indvars.iv, %11, !dbg !867
  %14 = add nsw i64 %13, %11, !dbg !868
  %15 = add nsw i64 %14, %11, !dbg !869
  %16 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !870
  %17 = getelementptr inbounds double* %a, i64 %13, !dbg !870
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !173), !dbg !870
  %18 = bitcast double* %16 to <2 x double>*, !dbg !870
  %19 = load <2 x double>* %18, align 8, !dbg !870, !tbaa !243
  %20 = add nsw i64 %13, 1, !dbg !871
  %21 = getelementptr inbounds double* %a, i64 %20, !dbg !871
  %22 = bitcast double* %17 to <2 x double>*, !dbg !870
  %23 = load <2 x double>* %22, align 8, !dbg !870, !tbaa !243
  %24 = fadd <2 x double> %19, %23, !dbg !870
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !174), !dbg !871
  %25 = extractelement <2 x double> %19, i32 0, !dbg !872
  %26 = extractelement <2 x double> %23, i32 0, !dbg !872
  %27 = fsub double %25, %26, !dbg !872
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !175), !dbg !872
  %28 = extractelement <2 x double> %19, i32 1, !dbg !873
  %29 = extractelement <2 x double> %23, i32 1, !dbg !873
  %30 = fsub double %28, %29, !dbg !873
  tail call void @llvm.dbg.value(metadata !{double %30}, i64 0, metadata !176), !dbg !873
  %31 = getelementptr inbounds double* %a, i64 %14, !dbg !874
  %32 = getelementptr inbounds double* %a, i64 %15, !dbg !874
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !177), !dbg !874
  %33 = bitcast double* %31 to <2 x double>*, !dbg !874
  %34 = load <2 x double>* %33, align 8, !dbg !874, !tbaa !243
  %35 = add nsw i64 %15, 1, !dbg !875
  %36 = getelementptr inbounds double* %a, i64 %35, !dbg !875
  %37 = bitcast double* %32 to <2 x double>*, !dbg !874
  %38 = load <2 x double>* %37, align 8, !dbg !874, !tbaa !243
  %39 = fadd <2 x double> %34, %38, !dbg !874
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !178), !dbg !875
  %40 = extractelement <2 x double> %34, i32 0, !dbg !876
  %41 = extractelement <2 x double> %38, i32 0, !dbg !876
  %42 = fsub double %40, %41, !dbg !876
  tail call void @llvm.dbg.value(metadata !{double %42}, i64 0, metadata !179), !dbg !876
  %43 = extractelement <2 x double> %34, i32 1, !dbg !877
  %44 = extractelement <2 x double> %38, i32 1, !dbg !877
  %45 = fsub double %43, %44, !dbg !877
  tail call void @llvm.dbg.value(metadata !{double %45}, i64 0, metadata !180), !dbg !877
  %46 = fadd <2 x double> %24, %39, !dbg !878
  %47 = bitcast double* %16 to <2 x double>*, !dbg !878
  store <2 x double> %46, <2 x double>* %47, align 8, !dbg !878, !tbaa !243
  %48 = fsub <2 x double> %24, %39, !dbg !879
  %49 = bitcast double* %31 to <2 x double>*, !dbg !879
  store <2 x double> %48, <2 x double>* %49, align 8, !dbg !879, !tbaa !243
  %50 = fsub double %27, %45, !dbg !880
  store double %50, double* %17, align 8, !dbg !880, !tbaa !243
  %51 = fadd double %30, %42, !dbg !881
  store double %51, double* %21, align 8, !dbg !881, !tbaa !243
  %52 = fadd double %27, %45, !dbg !882
  store double %52, double* %32, align 8, !dbg !882, !tbaa !243
  %53 = fsub double %30, %42, !dbg !883
  store double %53, double* %36, align 8, !dbg !883, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !863
  %54 = trunc i64 %indvars.iv.next to i32, !dbg !863
  %55 = icmp slt i32 %54, %l.1, !dbg !863
  br i1 %55, label %12, label %.loopexit, !dbg !863

; <label>:56                                      ; preds = %.lr.ph6, %56
  %indvars.iv9 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next10, %56 ]
  %57 = add nsw i64 %indvars.iv9, %10, !dbg !884
  %58 = getelementptr inbounds double* %a, i64 %indvars.iv9, !dbg !886
  %59 = getelementptr inbounds double* %a, i64 %57, !dbg !886
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !173), !dbg !886
  %60 = or i64 %indvars.iv9, 1, !dbg !887
  %61 = getelementptr inbounds double* %a, i64 %60, !dbg !887
  %62 = bitcast double* %58 to <2 x double>*, !dbg !886
  %63 = load <2 x double>* %62, align 8, !dbg !886, !tbaa !243
  %64 = add nsw i64 %57, 1, !dbg !887
  %65 = getelementptr inbounds double* %a, i64 %64, !dbg !887
  %66 = bitcast double* %59 to <2 x double>*, !dbg !886
  %67 = load <2 x double>* %66, align 8, !dbg !886, !tbaa !243
  %68 = fsub <2 x double> %63, %67, !dbg !886
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !174), !dbg !887
  %69 = extractelement <2 x double> %63, i32 0, !dbg !888
  %70 = extractelement <2 x double> %67, i32 0, !dbg !888
  %71 = fadd double %69, %70, !dbg !888
  store double %71, double* %58, align 8, !dbg !888, !tbaa !243
  %72 = load double* %65, align 8, !dbg !889, !tbaa !243
  %73 = extractelement <2 x double> %63, i32 1, !dbg !889
  %74 = fadd double %72, %73, !dbg !889
  store double %74, double* %61, align 8, !dbg !889, !tbaa !243
  %75 = bitcast double* %59 to <2 x double>*, !dbg !890
  store <2 x double> %68, <2 x double>* %75, align 8, !dbg !890, !tbaa !243
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 2, !dbg !864
  %76 = trunc i64 %indvars.iv.next10 to i32, !dbg !864
  %77 = icmp slt i32 %76, %l.1, !dbg !864
  br i1 %77, label %56, label %.loopexit, !dbg !864

.loopexit:                                        ; preds = %56, %12, %.preheader1, %.preheader
  ret void, !dbg !891
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cft1st(i32 %n, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !143), !dbg !892
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !144), !dbg !892
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !145), !dbg !892
  %1 = getelementptr inbounds double* %a, i64 2, !dbg !893
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !155), !dbg !893
  %2 = bitcast double* %a to <2 x double>*, !dbg !893
  %3 = load <2 x double>* %2, align 8, !dbg !893, !tbaa !243
  %4 = getelementptr inbounds double* %a, i64 3, !dbg !894
  %5 = bitcast double* %1 to <2 x double>*, !dbg !893
  %6 = load <2 x double>* %5, align 8, !dbg !893, !tbaa !243
  %7 = fadd <2 x double> %3, %6, !dbg !893
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !156), !dbg !894
  %8 = extractelement <2 x double> %3, i32 0, !dbg !895
  %9 = extractelement <2 x double> %6, i32 0, !dbg !895
  %10 = fsub double %8, %9, !dbg !895
  tail call void @llvm.dbg.value(metadata !{double %10}, i64 0, metadata !157), !dbg !895
  %11 = extractelement <2 x double> %3, i32 1, !dbg !896
  %12 = extractelement <2 x double> %6, i32 1, !dbg !896
  %13 = fsub double %11, %12, !dbg !896
  tail call void @llvm.dbg.value(metadata !{double %13}, i64 0, metadata !158), !dbg !896
  %14 = getelementptr inbounds double* %a, i64 4, !dbg !897
  %15 = getelementptr inbounds double* %a, i64 6, !dbg !897
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !159), !dbg !897
  %16 = bitcast double* %14 to <2 x double>*, !dbg !897
  %17 = load <2 x double>* %16, align 8, !dbg !897, !tbaa !243
  %18 = getelementptr inbounds double* %a, i64 7, !dbg !898
  %19 = bitcast double* %15 to <2 x double>*, !dbg !897
  %20 = load <2 x double>* %19, align 8, !dbg !897, !tbaa !243
  %21 = fadd <2 x double> %17, %20, !dbg !897
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !160), !dbg !898
  %22 = extractelement <2 x double> %17, i32 0, !dbg !899
  %23 = extractelement <2 x double> %20, i32 0, !dbg !899
  %24 = fsub double %22, %23, !dbg !899
  tail call void @llvm.dbg.value(metadata !{double %24}, i64 0, metadata !161), !dbg !899
  %25 = extractelement <2 x double> %17, i32 1, !dbg !900
  %26 = extractelement <2 x double> %20, i32 1, !dbg !900
  %27 = fsub double %25, %26, !dbg !900
  tail call void @llvm.dbg.value(metadata !{double %27}, i64 0, metadata !162), !dbg !900
  %28 = fadd <2 x double> %7, %21, !dbg !901
  %29 = bitcast double* %a to <2 x double>*, !dbg !901
  store <2 x double> %28, <2 x double>* %29, align 8, !dbg !901, !tbaa !243
  %30 = fsub <2 x double> %7, %21, !dbg !902
  %31 = bitcast double* %14 to <2 x double>*, !dbg !902
  store <2 x double> %30, <2 x double>* %31, align 8, !dbg !902, !tbaa !243
  %32 = fsub double %10, %27, !dbg !903
  store double %32, double* %1, align 8, !dbg !903, !tbaa !243
  %33 = fadd double %13, %24, !dbg !904
  store double %33, double* %4, align 8, !dbg !904, !tbaa !243
  %34 = fadd double %10, %27, !dbg !905
  store double %34, double* %15, align 8, !dbg !905, !tbaa !243
  %35 = fsub double %13, %24, !dbg !906
  store double %35, double* %18, align 8, !dbg !906, !tbaa !243
  %36 = getelementptr inbounds double* %w, i64 2, !dbg !907
  %37 = load double* %36, align 8, !dbg !907, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !149), !dbg !907
  %38 = getelementptr inbounds double* %a, i64 8, !dbg !908
  %39 = getelementptr inbounds double* %a, i64 10, !dbg !908
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !155), !dbg !908
  %40 = bitcast double* %38 to <2 x double>*, !dbg !908
  %41 = load <2 x double>* %40, align 8, !dbg !908, !tbaa !243
  %42 = bitcast double* %39 to <2 x double>*, !dbg !908
  %43 = load <2 x double>* %42, align 8, !dbg !908, !tbaa !243
  %44 = fadd <2 x double> %41, %43, !dbg !908
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !156), !dbg !909
  %45 = extractelement <2 x double> %41, i32 0, !dbg !910
  %46 = extractelement <2 x double> %43, i32 0, !dbg !910
  %47 = fsub double %45, %46, !dbg !910
  tail call void @llvm.dbg.value(metadata !{double %47}, i64 0, metadata !157), !dbg !910
  %48 = extractelement <2 x double> %41, i32 1, !dbg !911
  %49 = extractelement <2 x double> %43, i32 1, !dbg !911
  %50 = fsub double %48, %49, !dbg !911
  tail call void @llvm.dbg.value(metadata !{double %50}, i64 0, metadata !158), !dbg !911
  %51 = getelementptr inbounds double* %a, i64 12, !dbg !912
  %52 = getelementptr inbounds double* %a, i64 14, !dbg !912
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !159), !dbg !912
  %53 = bitcast double* %51 to <2 x double>*, !dbg !912
  %54 = load <2 x double>* %53, align 8, !dbg !912, !tbaa !243
  %55 = bitcast double* %52 to <2 x double>*, !dbg !912
  %56 = load <2 x double>* %55, align 8, !dbg !912, !tbaa !243
  %57 = fadd <2 x double> %54, %56, !dbg !912
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !160), !dbg !913
  %58 = extractelement <2 x double> %54, i32 0, !dbg !914
  %59 = extractelement <2 x double> %56, i32 0, !dbg !914
  %60 = fsub double %58, %59, !dbg !914
  tail call void @llvm.dbg.value(metadata !{double %60}, i64 0, metadata !161), !dbg !914
  %61 = extractelement <2 x double> %54, i32 1, !dbg !915
  %62 = extractelement <2 x double> %56, i32 1, !dbg !915
  %63 = fsub double %61, %62, !dbg !915
  tail call void @llvm.dbg.value(metadata !{double %63}, i64 0, metadata !162), !dbg !915
  %64 = fadd <2 x double> %44, %57, !dbg !916
  %65 = bitcast double* %38 to <2 x double>*, !dbg !916
  store <2 x double> %64, <2 x double>* %65, align 8, !dbg !916, !tbaa !243
  %66 = shufflevector <2 x double> %57, <2 x double> %44, <2 x i32> <i32 1, i32 2>, !dbg !917
  %67 = shufflevector <2 x double> %44, <2 x double> %57, <2 x i32> <i32 1, i32 2>, !dbg !917
  %68 = fsub <2 x double> %66, %67, !dbg !917
  %69 = bitcast double* %51 to <2 x double>*, !dbg !917
  store <2 x double> %68, <2 x double>* %69, align 8, !dbg !917, !tbaa !243
  %70 = fsub double %47, %63, !dbg !918
  tail call void @llvm.dbg.value(metadata !{double %70}, i64 0, metadata !155), !dbg !918
  %71 = fadd double %50, %60, !dbg !919
  tail call void @llvm.dbg.value(metadata !{double %71}, i64 0, metadata !156), !dbg !919
  %72 = fsub double %70, %71, !dbg !920
  %73 = fadd double %71, %70, !dbg !921
  %74 = insertelement <2 x double> undef, double %72, i32 0, !dbg !920
  %75 = insertelement <2 x double> %74, double %73, i32 1, !dbg !920
  %76 = insertelement <2 x double> undef, double %37, i32 0, !dbg !920
  %77 = insertelement <2 x double> %76, double %37, i32 1, !dbg !920
  %78 = fmul <2 x double> %75, %77, !dbg !920
  %79 = bitcast double* %39 to <2 x double>*, !dbg !920
  store <2 x double> %78, <2 x double>* %79, align 8, !dbg !920, !tbaa !243
  %80 = fadd double %47, %63, !dbg !922
  tail call void @llvm.dbg.value(metadata !{double %80}, i64 0, metadata !155), !dbg !922
  %81 = fsub double %60, %50, !dbg !923
  tail call void @llvm.dbg.value(metadata !{double %81}, i64 0, metadata !156), !dbg !923
  %82 = fsub double %81, %80, !dbg !924
  %83 = fadd double %81, %80, !dbg !925
  %84 = insertelement <2 x double> undef, double %82, i32 0, !dbg !924
  %85 = insertelement <2 x double> %84, double %83, i32 1, !dbg !924
  %86 = fmul <2 x double> %85, %77, !dbg !924
  %87 = bitcast double* %52 to <2 x double>*, !dbg !924
  store <2 x double> %86, <2 x double>* %87, align 8, !dbg !924, !tbaa !243
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !147), !dbg !926
  tail call void @llvm.dbg.value(metadata !927, i64 0, metadata !146), !dbg !928
  %88 = icmp sgt i32 %n, 16, !dbg !928
  br i1 %88, label %.lr.ph, label %._crit_edge, !dbg !928

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.lr.ph ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 16, %0 ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 2, !dbg !928
  %89 = shl nsw i64 %indvars.iv.next4, 1, !dbg !930
  %90 = getelementptr inbounds double* %w, i64 %indvars.iv.next4, !dbg !932
  %91 = load double* %90, align 8, !dbg !932, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %91}, i64 0, metadata !151), !dbg !932
  %92 = add nsw i64 %indvars.iv3, 3, !dbg !933
  %93 = getelementptr inbounds double* %w, i64 %92, !dbg !933
  %94 = load double* %93, align 8, !dbg !933, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !152), !dbg !933
  %95 = getelementptr inbounds double* %w, i64 %89, !dbg !934
  %96 = load double* %95, align 8, !dbg !934, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %96}, i64 0, metadata !149), !dbg !934
  %97 = or i64 %89, 1, !dbg !935
  %98 = getelementptr inbounds double* %w, i64 %97, !dbg !935
  %99 = load double* %98, align 8, !dbg !935, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %99}, i64 0, metadata !150), !dbg !935
  %100 = fmul double %94, 2.000000e+00, !dbg !936
  %101 = fmul double %100, %99, !dbg !936
  %102 = fsub double %96, %101, !dbg !936
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !153), !dbg !936
  %103 = fmul double %100, %96, !dbg !937
  %104 = fsub double %103, %99, !dbg !937
  tail call void @llvm.dbg.value(metadata !{double %104}, i64 0, metadata !154), !dbg !937
  %105 = getelementptr inbounds double* %a, i64 %indvars.iv, !dbg !938
  %106 = or i64 %indvars.iv, 2, !dbg !938
  %107 = getelementptr inbounds double* %a, i64 %106, !dbg !938
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !155), !dbg !938
  %108 = bitcast double* %105 to <2 x double>*, !dbg !938
  %109 = load <2 x double>* %108, align 8, !dbg !938, !tbaa !243
  %110 = or i64 %indvars.iv, 3, !dbg !939
  %111 = getelementptr inbounds double* %a, i64 %110, !dbg !939
  %112 = bitcast double* %107 to <2 x double>*, !dbg !938
  %113 = load <2 x double>* %112, align 8, !dbg !938, !tbaa !243
  %114 = fadd <2 x double> %109, %113, !dbg !938
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !156), !dbg !939
  %115 = extractelement <2 x double> %109, i32 0, !dbg !940
  %116 = extractelement <2 x double> %113, i32 0, !dbg !940
  %117 = fsub double %115, %116, !dbg !940
  tail call void @llvm.dbg.value(metadata !{double %117}, i64 0, metadata !157), !dbg !940
  %118 = extractelement <2 x double> %109, i32 1, !dbg !941
  %119 = extractelement <2 x double> %113, i32 1, !dbg !941
  %120 = fsub double %118, %119, !dbg !941
  tail call void @llvm.dbg.value(metadata !{double %120}, i64 0, metadata !158), !dbg !941
  %121 = or i64 %indvars.iv, 4, !dbg !942
  %122 = getelementptr inbounds double* %a, i64 %121, !dbg !942
  %123 = or i64 %indvars.iv, 6, !dbg !942
  %124 = getelementptr inbounds double* %a, i64 %123, !dbg !942
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !159), !dbg !942
  %125 = or i64 %indvars.iv, 5, !dbg !943
  %126 = getelementptr inbounds double* %a, i64 %125, !dbg !943
  %127 = bitcast double* %122 to <2 x double>*, !dbg !942
  %128 = load <2 x double>* %127, align 8, !dbg !942, !tbaa !243
  %129 = or i64 %indvars.iv, 7, !dbg !943
  %130 = getelementptr inbounds double* %a, i64 %129, !dbg !943
  %131 = bitcast double* %124 to <2 x double>*, !dbg !942
  %132 = load <2 x double>* %131, align 8, !dbg !942, !tbaa !243
  %133 = fadd <2 x double> %128, %132, !dbg !942
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !160), !dbg !943
  %134 = extractelement <2 x double> %128, i32 0, !dbg !944
  %135 = extractelement <2 x double> %132, i32 0, !dbg !944
  %136 = fsub double %134, %135, !dbg !944
  tail call void @llvm.dbg.value(metadata !{double %136}, i64 0, metadata !161), !dbg !944
  %137 = extractelement <2 x double> %128, i32 1, !dbg !945
  %138 = extractelement <2 x double> %132, i32 1, !dbg !945
  %139 = fsub double %137, %138, !dbg !945
  tail call void @llvm.dbg.value(metadata !{double %139}, i64 0, metadata !162), !dbg !945
  %140 = fadd <2 x double> %114, %133, !dbg !946
  %141 = bitcast double* %105 to <2 x double>*, !dbg !946
  store <2 x double> %140, <2 x double>* %141, align 8, !dbg !946, !tbaa !243
  %142 = extractelement <2 x double> %114, i32 0, !dbg !947
  %143 = extractelement <2 x double> %133, i32 0, !dbg !947
  %144 = fsub double %142, %143, !dbg !947
  tail call void @llvm.dbg.value(metadata !{double %144}, i64 0, metadata !155), !dbg !947
  %145 = extractelement <2 x double> %114, i32 1, !dbg !948
  %146 = extractelement <2 x double> %133, i32 1, !dbg !948
  %147 = fsub double %145, %146, !dbg !948
  tail call void @llvm.dbg.value(metadata !{double %147}, i64 0, metadata !156), !dbg !948
  %148 = fmul double %91, %144, !dbg !949
  %149 = fmul double %94, %147, !dbg !949
  %150 = fsub double %148, %149, !dbg !949
  store double %150, double* %122, align 8, !dbg !949, !tbaa !243
  %151 = fmul double %91, %147, !dbg !950
  %152 = fmul double %94, %144, !dbg !950
  %153 = fadd double %152, %151, !dbg !950
  store double %153, double* %126, align 8, !dbg !950, !tbaa !243
  %154 = fsub double %117, %139, !dbg !951
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !155), !dbg !951
  %155 = fadd double %120, %136, !dbg !952
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !156), !dbg !952
  %156 = fmul double %96, %154, !dbg !953
  %157 = fmul double %99, %155, !dbg !953
  %158 = fsub double %156, %157, !dbg !953
  store double %158, double* %107, align 8, !dbg !953, !tbaa !243
  %159 = fmul double %96, %155, !dbg !954
  %160 = fmul double %99, %154, !dbg !954
  %161 = fadd double %159, %160, !dbg !954
  store double %161, double* %111, align 8, !dbg !954, !tbaa !243
  %162 = fadd double %117, %139, !dbg !955
  tail call void @llvm.dbg.value(metadata !{double %162}, i64 0, metadata !155), !dbg !955
  %163 = fsub double %120, %136, !dbg !956
  tail call void @llvm.dbg.value(metadata !{double %163}, i64 0, metadata !156), !dbg !956
  %164 = fmul double %102, %162, !dbg !957
  %165 = fmul double %104, %163, !dbg !957
  %166 = fsub double %164, %165, !dbg !957
  store double %166, double* %124, align 8, !dbg !957, !tbaa !243
  %167 = fmul double %102, %163, !dbg !958
  %168 = fmul double %104, %162, !dbg !958
  %169 = fadd double %167, %168, !dbg !958
  store double %169, double* %130, align 8, !dbg !958, !tbaa !243
  %170 = or i64 %89, 2, !dbg !959
  %171 = getelementptr inbounds double* %w, i64 %170, !dbg !959
  %172 = load double* %171, align 8, !dbg !959, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %172}, i64 0, metadata !149), !dbg !959
  %173 = or i64 %89, 3, !dbg !960
  %174 = getelementptr inbounds double* %w, i64 %173, !dbg !960
  %175 = load double* %174, align 8, !dbg !960, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %175}, i64 0, metadata !150), !dbg !960
  %176 = fmul double %91, 2.000000e+00, !dbg !961
  %177 = fmul double %176, %175, !dbg !961
  %178 = fsub double %172, %177, !dbg !961
  tail call void @llvm.dbg.value(metadata !{double %178}, i64 0, metadata !153), !dbg !961
  %179 = fmul double %176, %172, !dbg !962
  %180 = fsub double %179, %175, !dbg !962
  tail call void @llvm.dbg.value(metadata !{double %180}, i64 0, metadata !154), !dbg !962
  %181 = or i64 %indvars.iv, 8, !dbg !963
  %182 = getelementptr inbounds double* %a, i64 %181, !dbg !963
  %183 = or i64 %indvars.iv, 10, !dbg !963
  %184 = getelementptr inbounds double* %a, i64 %183, !dbg !963
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !155), !dbg !963
  %185 = bitcast double* %182 to <2 x double>*, !dbg !963
  %186 = load <2 x double>* %185, align 8, !dbg !963, !tbaa !243
  %187 = or i64 %indvars.iv, 11, !dbg !964
  %188 = getelementptr inbounds double* %a, i64 %187, !dbg !964
  %189 = bitcast double* %184 to <2 x double>*, !dbg !963
  %190 = load <2 x double>* %189, align 8, !dbg !963, !tbaa !243
  %191 = fadd <2 x double> %186, %190, !dbg !963
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !156), !dbg !964
  %192 = extractelement <2 x double> %186, i32 0, !dbg !965
  %193 = extractelement <2 x double> %190, i32 0, !dbg !965
  %194 = fsub double %192, %193, !dbg !965
  tail call void @llvm.dbg.value(metadata !{double %194}, i64 0, metadata !157), !dbg !965
  %195 = extractelement <2 x double> %186, i32 1, !dbg !966
  %196 = extractelement <2 x double> %190, i32 1, !dbg !966
  %197 = fsub double %195, %196, !dbg !966
  tail call void @llvm.dbg.value(metadata !{double %197}, i64 0, metadata !158), !dbg !966
  %198 = or i64 %indvars.iv, 12, !dbg !967
  %199 = getelementptr inbounds double* %a, i64 %198, !dbg !967
  %200 = or i64 %indvars.iv, 14, !dbg !967
  %201 = getelementptr inbounds double* %a, i64 %200, !dbg !967
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !159), !dbg !967
  %202 = or i64 %indvars.iv, 13, !dbg !968
  %203 = getelementptr inbounds double* %a, i64 %202, !dbg !968
  %204 = bitcast double* %199 to <2 x double>*, !dbg !967
  %205 = load <2 x double>* %204, align 8, !dbg !967, !tbaa !243
  %206 = or i64 %indvars.iv, 15, !dbg !968
  %207 = getelementptr inbounds double* %a, i64 %206, !dbg !968
  %208 = bitcast double* %201 to <2 x double>*, !dbg !967
  %209 = load <2 x double>* %208, align 8, !dbg !967, !tbaa !243
  %210 = fadd <2 x double> %205, %209, !dbg !967
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !160), !dbg !968
  %211 = extractelement <2 x double> %205, i32 0, !dbg !969
  %212 = extractelement <2 x double> %209, i32 0, !dbg !969
  %213 = fsub double %211, %212, !dbg !969
  tail call void @llvm.dbg.value(metadata !{double %213}, i64 0, metadata !161), !dbg !969
  %214 = extractelement <2 x double> %205, i32 1, !dbg !970
  %215 = extractelement <2 x double> %209, i32 1, !dbg !970
  %216 = fsub double %214, %215, !dbg !970
  tail call void @llvm.dbg.value(metadata !{double %216}, i64 0, metadata !162), !dbg !970
  %217 = fadd <2 x double> %191, %210, !dbg !971
  %218 = bitcast double* %182 to <2 x double>*, !dbg !971
  store <2 x double> %217, <2 x double>* %218, align 8, !dbg !971, !tbaa !243
  %219 = extractelement <2 x double> %191, i32 0, !dbg !972
  %220 = extractelement <2 x double> %210, i32 0, !dbg !972
  %221 = fsub double %219, %220, !dbg !972
  tail call void @llvm.dbg.value(metadata !{double %221}, i64 0, metadata !155), !dbg !972
  %222 = extractelement <2 x double> %191, i32 1, !dbg !973
  %223 = extractelement <2 x double> %210, i32 1, !dbg !973
  %224 = fsub double %222, %223, !dbg !973
  tail call void @llvm.dbg.value(metadata !{double %224}, i64 0, metadata !156), !dbg !973
  %225 = fsub double -0.000000e+00, %94, !dbg !974
  %226 = fmul double %221, %225, !dbg !974
  %227 = fmul double %91, %224, !dbg !974
  %228 = fsub double %226, %227, !dbg !974
  store double %228, double* %199, align 8, !dbg !974, !tbaa !243
  %229 = fmul double %224, %225, !dbg !975
  %230 = fmul double %91, %221, !dbg !975
  %231 = fadd double %230, %229, !dbg !975
  store double %231, double* %203, align 8, !dbg !975, !tbaa !243
  %232 = fsub double %194, %216, !dbg !976
  tail call void @llvm.dbg.value(metadata !{double %232}, i64 0, metadata !155), !dbg !976
  %233 = fadd double %197, %213, !dbg !977
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !156), !dbg !977
  %234 = fmul double %172, %232, !dbg !978
  %235 = fmul double %175, %233, !dbg !978
  %236 = fsub double %234, %235, !dbg !978
  store double %236, double* %184, align 8, !dbg !978, !tbaa !243
  %237 = fmul double %172, %233, !dbg !979
  %238 = fmul double %175, %232, !dbg !979
  %239 = fadd double %237, %238, !dbg !979
  store double %239, double* %188, align 8, !dbg !979, !tbaa !243
  %240 = fadd double %194, %216, !dbg !980
  tail call void @llvm.dbg.value(metadata !{double %240}, i64 0, metadata !155), !dbg !980
  %241 = fsub double %197, %213, !dbg !981
  tail call void @llvm.dbg.value(metadata !{double %241}, i64 0, metadata !156), !dbg !981
  %242 = fmul double %178, %240, !dbg !982
  %243 = fmul double %180, %241, !dbg !982
  %244 = fsub double %242, %243, !dbg !982
  store double %244, double* %201, align 8, !dbg !982, !tbaa !243
  %245 = fmul double %178, %241, !dbg !983
  %246 = fmul double %180, %240, !dbg !983
  %247 = fadd double %245, %246, !dbg !983
  store double %247, double* %207, align 8, !dbg !983, !tbaa !243
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 16, !dbg !928
  %248 = trunc i64 %indvars.iv.next to i32, !dbg !928
  %249 = icmp slt i32 %248, %n, !dbg !928
  br i1 %249, label %.lr.ph, label %._crit_edge, !dbg !928

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret void, !dbg !984
}

; Function Attrs: inlinehint nounwind uwtable
define internal fastcc void @cftmdl(i32 %n, i32 %l, double* %a, double* nocapture readonly %w) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !114), !dbg !985
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !115), !dbg !985
  tail call void @llvm.dbg.value(metadata !{double* %a}, i64 0, metadata !116), !dbg !985
  tail call void @llvm.dbg.value(metadata !{double* %w}, i64 0, metadata !117), !dbg !985
  %1 = shl i32 %l, 2, !dbg !986
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !125), !dbg !986
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !118), !dbg !987
  %2 = icmp sgt i32 %l, 0, !dbg !987
  br i1 %2, label %.lr.ph17, label %._crit_edge14, !dbg !987

.lr.ph17:                                         ; preds = %0
  %3 = sext i32 %l to i64, !dbg !987
  br label %4, !dbg !987

; <label>:4                                       ; preds = %.lr.ph17, %4
  %indvars.iv27 = phi i64 [ 0, %.lr.ph17 ], [ %indvars.iv.next28, %4 ]
  %5 = add nsw i64 %indvars.iv27, %3, !dbg !989
  %6 = add nsw i64 %5, %3, !dbg !991
  %7 = add nsw i64 %6, %3, !dbg !992
  %8 = getelementptr inbounds double* %a, i64 %indvars.iv27, !dbg !993
  %9 = getelementptr inbounds double* %a, i64 %5, !dbg !993
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !133), !dbg !993
  %10 = bitcast double* %8 to <2 x double>*, !dbg !993
  %11 = load <2 x double>* %10, align 8, !dbg !993, !tbaa !243
  %12 = add nsw i64 %5, 1, !dbg !994
  %13 = getelementptr inbounds double* %a, i64 %12, !dbg !994
  %14 = bitcast double* %9 to <2 x double>*, !dbg !993
  %15 = load <2 x double>* %14, align 8, !dbg !993, !tbaa !243
  %16 = fadd <2 x double> %11, %15, !dbg !993
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !134), !dbg !994
  %17 = extractelement <2 x double> %11, i32 0, !dbg !995
  %18 = extractelement <2 x double> %15, i32 0, !dbg !995
  %19 = fsub double %17, %18, !dbg !995
  tail call void @llvm.dbg.value(metadata !{double %19}, i64 0, metadata !135), !dbg !995
  %20 = extractelement <2 x double> %11, i32 1, !dbg !996
  %21 = extractelement <2 x double> %15, i32 1, !dbg !996
  %22 = fsub double %20, %21, !dbg !996
  tail call void @llvm.dbg.value(metadata !{double %22}, i64 0, metadata !136), !dbg !996
  %23 = getelementptr inbounds double* %a, i64 %6, !dbg !997
  %24 = getelementptr inbounds double* %a, i64 %7, !dbg !997
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !137), !dbg !997
  %25 = bitcast double* %23 to <2 x double>*, !dbg !997
  %26 = load <2 x double>* %25, align 8, !dbg !997, !tbaa !243
  %27 = add nsw i64 %7, 1, !dbg !998
  %28 = getelementptr inbounds double* %a, i64 %27, !dbg !998
  %29 = bitcast double* %24 to <2 x double>*, !dbg !997
  %30 = load <2 x double>* %29, align 8, !dbg !997, !tbaa !243
  %31 = fadd <2 x double> %26, %30, !dbg !997
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !138), !dbg !998
  %32 = extractelement <2 x double> %26, i32 0, !dbg !999
  %33 = extractelement <2 x double> %30, i32 0, !dbg !999
  %34 = fsub double %32, %33, !dbg !999
  tail call void @llvm.dbg.value(metadata !{double %34}, i64 0, metadata !139), !dbg !999
  %35 = extractelement <2 x double> %26, i32 1, !dbg !1000
  %36 = extractelement <2 x double> %30, i32 1, !dbg !1000
  %37 = fsub double %35, %36, !dbg !1000
  tail call void @llvm.dbg.value(metadata !{double %37}, i64 0, metadata !140), !dbg !1000
  %38 = fadd <2 x double> %16, %31, !dbg !1001
  %39 = bitcast double* %8 to <2 x double>*, !dbg !1001
  store <2 x double> %38, <2 x double>* %39, align 8, !dbg !1001, !tbaa !243
  %40 = fsub <2 x double> %16, %31, !dbg !1002
  %41 = bitcast double* %23 to <2 x double>*, !dbg !1002
  store <2 x double> %40, <2 x double>* %41, align 8, !dbg !1002, !tbaa !243
  %42 = fsub double %19, %37, !dbg !1003
  store double %42, double* %9, align 8, !dbg !1003, !tbaa !243
  %43 = fadd double %22, %34, !dbg !1004
  store double %43, double* %13, align 8, !dbg !1004, !tbaa !243
  %44 = fadd double %19, %37, !dbg !1005
  store double %44, double* %24, align 8, !dbg !1005, !tbaa !243
  %45 = fsub double %22, %34, !dbg !1006
  store double %45, double* %28, align 8, !dbg !1006, !tbaa !243
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 2, !dbg !987
  %46 = trunc i64 %indvars.iv.next28 to i32, !dbg !987
  %47 = icmp slt i32 %46, %l, !dbg !987
  br i1 %47, label %4, label %._crit_edge18, !dbg !987

._crit_edge18:                                    ; preds = %4
  %48 = getelementptr inbounds double* %w, i64 2, !dbg !1007
  %49 = load double* %48, align 8, !dbg !1007, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %49}, i64 0, metadata !127), !dbg !1007
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !118), !dbg !1008
  %50 = add nsw i32 %1, %l, !dbg !1008
  br i1 %2, label %.lr.ph13, label %._crit_edge14, !dbg !1008

.lr.ph13:                                         ; preds = %._crit_edge18
  %51 = shl i32 %l, 2, !dbg !1008
  %52 = sext i32 %51 to i64
  %53 = sext i32 %l to i64, !dbg !1008
  %54 = insertelement <2 x double> undef, double %49, i32 0, !dbg !1010
  %55 = insertelement <2 x double> %54, double %49, i32 1, !dbg !1010
  br label %56, !dbg !1008

; <label>:56                                      ; preds = %.lr.ph13, %56
  %indvars.iv25 = phi i64 [ %52, %.lr.ph13 ], [ %indvars.iv.next26, %56 ]
  %j.111 = phi i32 [ %1, %.lr.ph13 ], [ %107, %56 ]
  %57 = add nsw i64 %indvars.iv25, %53, !dbg !1012
  %58 = add nsw i64 %57, %53, !dbg !1013
  %59 = add nsw i64 %58, %53, !dbg !1014
  %60 = getelementptr inbounds double* %a, i64 %indvars.iv25, !dbg !1015
  %61 = load double* %60, align 8, !dbg !1015, !tbaa !243
  %62 = getelementptr inbounds double* %a, i64 %57, !dbg !1015
  %63 = load double* %62, align 8, !dbg !1015, !tbaa !243
  %64 = fadd double %61, %63, !dbg !1015
  tail call void @llvm.dbg.value(metadata !{double %64}, i64 0, metadata !133), !dbg !1015
  %65 = or i32 %j.111, 1, !dbg !1016
  %66 = sext i32 %65 to i64, !dbg !1016
  %67 = getelementptr inbounds double* %a, i64 %66, !dbg !1016
  %68 = load double* %67, align 8, !dbg !1016, !tbaa !243
  %69 = add nsw i64 %57, 1, !dbg !1016
  %70 = getelementptr inbounds double* %a, i64 %69, !dbg !1016
  %71 = load double* %70, align 8, !dbg !1016, !tbaa !243
  %72 = fadd double %68, %71, !dbg !1016
  tail call void @llvm.dbg.value(metadata !{double %72}, i64 0, metadata !134), !dbg !1016
  %73 = fsub double %61, %63, !dbg !1017
  tail call void @llvm.dbg.value(metadata !{double %73}, i64 0, metadata !135), !dbg !1017
  %74 = fsub double %68, %71, !dbg !1018
  tail call void @llvm.dbg.value(metadata !{double %74}, i64 0, metadata !136), !dbg !1018
  %75 = getelementptr inbounds double* %a, i64 %58, !dbg !1019
  %76 = load double* %75, align 8, !dbg !1019, !tbaa !243
  %77 = getelementptr inbounds double* %a, i64 %59, !dbg !1019
  %78 = load double* %77, align 8, !dbg !1019, !tbaa !243
  %79 = fadd double %76, %78, !dbg !1019
  tail call void @llvm.dbg.value(metadata !{double %79}, i64 0, metadata !137), !dbg !1019
  %80 = add nsw i64 %58, 1, !dbg !1020
  %81 = getelementptr inbounds double* %a, i64 %80, !dbg !1020
  %82 = load double* %81, align 8, !dbg !1020, !tbaa !243
  %83 = add nsw i64 %59, 1, !dbg !1020
  %84 = getelementptr inbounds double* %a, i64 %83, !dbg !1020
  %85 = load double* %84, align 8, !dbg !1020, !tbaa !243
  %86 = fadd double %82, %85, !dbg !1020
  tail call void @llvm.dbg.value(metadata !{double %86}, i64 0, metadata !138), !dbg !1020
  %87 = fsub double %76, %78, !dbg !1021
  tail call void @llvm.dbg.value(metadata !{double %87}, i64 0, metadata !139), !dbg !1021
  %88 = fsub double %82, %85, !dbg !1022
  tail call void @llvm.dbg.value(metadata !{double %88}, i64 0, metadata !140), !dbg !1022
  %89 = fadd double %64, %79, !dbg !1023
  store double %89, double* %60, align 8, !dbg !1023, !tbaa !243
  %90 = fadd double %72, %86, !dbg !1024
  store double %90, double* %67, align 8, !dbg !1024, !tbaa !243
  %91 = fsub double %86, %72, !dbg !1025
  store double %91, double* %75, align 8, !dbg !1025, !tbaa !243
  %92 = fsub double %64, %79, !dbg !1026
  store double %92, double* %81, align 8, !dbg !1026, !tbaa !243
  %93 = fsub double %73, %88, !dbg !1027
  tail call void @llvm.dbg.value(metadata !{double %93}, i64 0, metadata !133), !dbg !1027
  %94 = fadd double %74, %87, !dbg !1028
  tail call void @llvm.dbg.value(metadata !{double %94}, i64 0, metadata !134), !dbg !1028
  %95 = fsub double %93, %94, !dbg !1010
  %96 = fadd double %94, %93, !dbg !1029
  %97 = insertelement <2 x double> undef, double %95, i32 0, !dbg !1010
  %98 = insertelement <2 x double> %97, double %96, i32 1, !dbg !1010
  %99 = fmul <2 x double> %98, %55, !dbg !1010
  %100 = bitcast double* %62 to <2 x double>*, !dbg !1010
  store <2 x double> %99, <2 x double>* %100, align 8, !dbg !1010, !tbaa !243
  %101 = fadd double %73, %88, !dbg !1030
  tail call void @llvm.dbg.value(metadata !{double %101}, i64 0, metadata !133), !dbg !1030
  %102 = fsub double %87, %74, !dbg !1031
  tail call void @llvm.dbg.value(metadata !{double %102}, i64 0, metadata !134), !dbg !1031
  %103 = fsub double %102, %101, !dbg !1032
  %104 = fmul double %49, %103, !dbg !1032
  store double %104, double* %77, align 8, !dbg !1032, !tbaa !243
  %105 = fadd double %102, %101, !dbg !1033
  %106 = fmul double %49, %105, !dbg !1033
  store double %106, double* %84, align 8, !dbg !1033, !tbaa !243
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 2, !dbg !1008
  %107 = add nsw i32 %j.111, 2, !dbg !1008
  tail call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !118), !dbg !1008
  %108 = trunc i64 %indvars.iv.next26 to i32, !dbg !1008
  %109 = icmp slt i32 %108, %50, !dbg !1008
  br i1 %109, label %56, label %._crit_edge14, !dbg !1008

._crit_edge14:                                    ; preds = %56, %0, %._crit_edge18
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !123), !dbg !1034
  %110 = shl i32 %l, 3, !dbg !1035
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !126), !dbg !1035
  tail call void @llvm.dbg.value(metadata !{i32 %110}, i64 0, metadata !122), !dbg !1036
  %111 = icmp slt i32 %110, %n, !dbg !1036
  br i1 %111, label %.lr.ph9, label %._crit_edge10, !dbg !1036

.lr.ph9:                                          ; preds = %._crit_edge14
  %112 = shl i32 %l, 3, !dbg !1036
  %113 = sext i32 %112 to i64
  %114 = sext i32 %l to i64, !dbg !1036
  %115 = mul i32 %l, 12, !dbg !1036
  br label %116, !dbg !1036

; <label>:116                                     ; preds = %.lr.ph9, %._crit_edge5
  %indvars.iv21 = phi i32 [ %115, %.lr.ph9 ], [ %indvars.iv.next22, %._crit_edge5 ]
  %indvars.iv = phi i64 [ %113, %.lr.ph9 ], [ %indvars.iv.next, %._crit_edge5 ]
  %k.07 = phi i32 [ %110, %.lr.ph9 ], [ %283, %._crit_edge5 ]
  %k1.06 = phi i32 [ 2, %.lr.ph9 ], [ %phitmp, %._crit_edge5 ]
  tail call void @llvm.dbg.value(metadata !{i32 %k1.06}, i64 0, metadata !123), !dbg !1038
  %117 = sext i32 %indvars.iv21 to i64
  %118 = shl nsw i32 %k1.06, 1, !dbg !1040
  tail call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !124), !dbg !1040
  %119 = sext i32 %k1.06 to i64, !dbg !1041
  %120 = getelementptr inbounds double* %w, i64 %119, !dbg !1041
  %121 = load double* %120, align 8, !dbg !1041, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %121}, i64 0, metadata !129), !dbg !1041
  %122 = or i32 %k1.06, 1, !dbg !1042
  %123 = sext i32 %122 to i64, !dbg !1042
  %124 = getelementptr inbounds double* %w, i64 %123, !dbg !1042
  %125 = load double* %124, align 8, !dbg !1042, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %125}, i64 0, metadata !130), !dbg !1042
  %126 = sext i32 %118 to i64, !dbg !1043
  %127 = getelementptr inbounds double* %w, i64 %126, !dbg !1043
  %128 = load double* %127, align 8, !dbg !1043, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %128}, i64 0, metadata !127), !dbg !1043
  %129 = or i32 %118, 1, !dbg !1044
  %130 = sext i32 %129 to i64, !dbg !1044
  %131 = getelementptr inbounds double* %w, i64 %130, !dbg !1044
  %132 = load double* %131, align 8, !dbg !1044, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %132}, i64 0, metadata !128), !dbg !1044
  %133 = fmul double %125, 2.000000e+00, !dbg !1045
  %134 = fmul double %133, %132, !dbg !1045
  %135 = fsub double %128, %134, !dbg !1045
  tail call void @llvm.dbg.value(metadata !{double %135}, i64 0, metadata !131), !dbg !1045
  %136 = fmul double %133, %128, !dbg !1046
  %137 = fsub double %136, %132, !dbg !1046
  tail call void @llvm.dbg.value(metadata !{double %137}, i64 0, metadata !132), !dbg !1046
  tail call void @llvm.dbg.value(metadata !{i32 %k.07}, i64 0, metadata !118), !dbg !1047
  %138 = add nsw i32 %k.07, %l, !dbg !1047
  br i1 %2, label %.lr.ph, label %._crit_edge, !dbg !1047

.lr.ph:                                           ; preds = %116, %.lr.ph
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.lr.ph ], [ %indvars.iv, %116 ]
  %j.21 = phi i32 [ %197, %.lr.ph ], [ %k.07, %116 ]
  %139 = add nsw i64 %indvars.iv19, %114, !dbg !1049
  %140 = add nsw i64 %139, %114, !dbg !1051
  %141 = add nsw i64 %140, %114, !dbg !1052
  %142 = getelementptr inbounds double* %a, i64 %indvars.iv19, !dbg !1053
  %143 = load double* %142, align 8, !dbg !1053, !tbaa !243
  %144 = getelementptr inbounds double* %a, i64 %139, !dbg !1053
  %145 = load double* %144, align 8, !dbg !1053, !tbaa !243
  %146 = fadd double %143, %145, !dbg !1053
  tail call void @llvm.dbg.value(metadata !{double %146}, i64 0, metadata !133), !dbg !1053
  %147 = or i32 %j.21, 1, !dbg !1054
  %148 = sext i32 %147 to i64, !dbg !1054
  %149 = getelementptr inbounds double* %a, i64 %148, !dbg !1054
  %150 = load double* %149, align 8, !dbg !1054, !tbaa !243
  %151 = add nsw i64 %139, 1, !dbg !1054
  %152 = getelementptr inbounds double* %a, i64 %151, !dbg !1054
  %153 = load double* %152, align 8, !dbg !1054, !tbaa !243
  %154 = fadd double %150, %153, !dbg !1054
  tail call void @llvm.dbg.value(metadata !{double %154}, i64 0, metadata !134), !dbg !1054
  %155 = fsub double %143, %145, !dbg !1055
  tail call void @llvm.dbg.value(metadata !{double %155}, i64 0, metadata !135), !dbg !1055
  %156 = fsub double %150, %153, !dbg !1056
  tail call void @llvm.dbg.value(metadata !{double %156}, i64 0, metadata !136), !dbg !1056
  %157 = getelementptr inbounds double* %a, i64 %140, !dbg !1057
  %158 = load double* %157, align 8, !dbg !1057, !tbaa !243
  %159 = getelementptr inbounds double* %a, i64 %141, !dbg !1057
  %160 = load double* %159, align 8, !dbg !1057, !tbaa !243
  %161 = fadd double %158, %160, !dbg !1057
  tail call void @llvm.dbg.value(metadata !{double %161}, i64 0, metadata !137), !dbg !1057
  %162 = add nsw i64 %140, 1, !dbg !1058
  %163 = getelementptr inbounds double* %a, i64 %162, !dbg !1058
  %164 = load double* %163, align 8, !dbg !1058, !tbaa !243
  %165 = add nsw i64 %141, 1, !dbg !1058
  %166 = getelementptr inbounds double* %a, i64 %165, !dbg !1058
  %167 = load double* %166, align 8, !dbg !1058, !tbaa !243
  %168 = fadd double %164, %167, !dbg !1058
  tail call void @llvm.dbg.value(metadata !{double %168}, i64 0, metadata !138), !dbg !1058
  %169 = fsub double %158, %160, !dbg !1059
  tail call void @llvm.dbg.value(metadata !{double %169}, i64 0, metadata !139), !dbg !1059
  %170 = fsub double %164, %167, !dbg !1060
  tail call void @llvm.dbg.value(metadata !{double %170}, i64 0, metadata !140), !dbg !1060
  %171 = fadd double %146, %161, !dbg !1061
  store double %171, double* %142, align 8, !dbg !1061, !tbaa !243
  %172 = fadd double %154, %168, !dbg !1062
  store double %172, double* %149, align 8, !dbg !1062, !tbaa !243
  %173 = fsub double %146, %161, !dbg !1063
  tail call void @llvm.dbg.value(metadata !{double %173}, i64 0, metadata !133), !dbg !1063
  %174 = fsub double %154, %168, !dbg !1064
  tail call void @llvm.dbg.value(metadata !{double %174}, i64 0, metadata !134), !dbg !1064
  %175 = fmul double %121, %173, !dbg !1065
  %176 = fmul double %125, %174, !dbg !1065
  %177 = fsub double %175, %176, !dbg !1065
  store double %177, double* %157, align 8, !dbg !1065, !tbaa !243
  %178 = fmul double %121, %174, !dbg !1066
  %179 = fmul double %125, %173, !dbg !1066
  %180 = fadd double %179, %178, !dbg !1066
  store double %180, double* %163, align 8, !dbg !1066, !tbaa !243
  %181 = fsub double %155, %170, !dbg !1067
  tail call void @llvm.dbg.value(metadata !{double %181}, i64 0, metadata !133), !dbg !1067
  %182 = fadd double %156, %169, !dbg !1068
  tail call void @llvm.dbg.value(metadata !{double %182}, i64 0, metadata !134), !dbg !1068
  %183 = fmul double %128, %181, !dbg !1069
  %184 = fmul double %132, %182, !dbg !1069
  %185 = fsub double %183, %184, !dbg !1069
  store double %185, double* %144, align 8, !dbg !1069, !tbaa !243
  %186 = fmul double %128, %182, !dbg !1070
  %187 = fmul double %132, %181, !dbg !1070
  %188 = fadd double %186, %187, !dbg !1070
  store double %188, double* %152, align 8, !dbg !1070, !tbaa !243
  %189 = fadd double %155, %170, !dbg !1071
  tail call void @llvm.dbg.value(metadata !{double %189}, i64 0, metadata !133), !dbg !1071
  %190 = fsub double %156, %169, !dbg !1072
  tail call void @llvm.dbg.value(metadata !{double %190}, i64 0, metadata !134), !dbg !1072
  %191 = fmul double %135, %189, !dbg !1073
  %192 = fmul double %137, %190, !dbg !1073
  %193 = fsub double %191, %192, !dbg !1073
  store double %193, double* %159, align 8, !dbg !1073, !tbaa !243
  %194 = fmul double %135, %190, !dbg !1074
  %195 = fmul double %137, %189, !dbg !1074
  %196 = fadd double %194, %195, !dbg !1074
  store double %196, double* %166, align 8, !dbg !1074, !tbaa !243
  %197 = add nsw i32 %j.21, 2, !dbg !1047
  tail call void @llvm.dbg.value(metadata !{i32 %197}, i64 0, metadata !118), !dbg !1047
  %198 = icmp slt i32 %197, %138, !dbg !1047
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 2, !dbg !1047
  br i1 %198, label %.lr.ph, label %._crit_edge, !dbg !1047

._crit_edge:                                      ; preds = %.lr.ph, %116
  %199 = or i32 %118, 2, !dbg !1075
  %200 = sext i32 %199 to i64, !dbg !1075
  %201 = getelementptr inbounds double* %w, i64 %200, !dbg !1075
  %202 = load double* %201, align 8, !dbg !1075, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %202}, i64 0, metadata !127), !dbg !1075
  %203 = or i32 %118, 3, !dbg !1076
  %204 = sext i32 %203 to i64, !dbg !1076
  %205 = getelementptr inbounds double* %w, i64 %204, !dbg !1076
  %206 = load double* %205, align 8, !dbg !1076, !tbaa !243
  tail call void @llvm.dbg.value(metadata !{double %206}, i64 0, metadata !128), !dbg !1076
  %207 = fmul double %121, 2.000000e+00, !dbg !1077
  %208 = fmul double %207, %206, !dbg !1077
  %209 = fsub double %202, %208, !dbg !1077
  tail call void @llvm.dbg.value(metadata !{double %209}, i64 0, metadata !131), !dbg !1077
  %210 = fmul double %207, %202, !dbg !1078
  %211 = fsub double %210, %206, !dbg !1078
  tail call void @llvm.dbg.value(metadata !{double %211}, i64 0, metadata !132), !dbg !1078
  %212 = add nsw i32 %k.07, %1, !dbg !1079
  tail call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !118), !dbg !1079
  %213 = add nsw i32 %212, %l, !dbg !1079
  br i1 %2, label %.lr.ph4, label %._crit_edge5, !dbg !1079

.lr.ph4:                                          ; preds = %._crit_edge
  %214 = fsub double -0.000000e+00, %125, !dbg !1081
  br label %215, !dbg !1079

; <label>:215                                     ; preds = %.lr.ph4, %215
  %indvars.iv23 = phi i64 [ %117, %.lr.ph4 ], [ %indvars.iv.next24, %215 ]
  %j.32 = phi i32 [ %212, %.lr.ph4 ], [ %281, %215 ]
  %216 = add nsw i64 %indvars.iv23, %114, !dbg !1083
  %217 = add nsw i64 %216, %114, !dbg !1084
  %218 = add nsw i64 %217, %114, !dbg !1085
  %219 = getelementptr inbounds double* %a, i64 %indvars.iv23, !dbg !1086
  %220 = getelementptr inbounds double* %a, i64 %216, !dbg !1086
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !133), !dbg !1086
  %221 = bitcast double* %219 to <2 x double>*, !dbg !1086
  %222 = load <2 x double>* %221, align 8, !dbg !1086, !tbaa !243
  %223 = add nsw i64 %216, 1, !dbg !1087
  %224 = getelementptr inbounds double* %a, i64 %223, !dbg !1087
  %225 = bitcast double* %220 to <2 x double>*, !dbg !1086
  %226 = load <2 x double>* %225, align 8, !dbg !1086, !tbaa !243
  %227 = fadd <2 x double> %222, %226, !dbg !1086
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !134), !dbg !1087
  %228 = extractelement <2 x double> %222, i32 0, !dbg !1088
  %229 = extractelement <2 x double> %226, i32 0, !dbg !1088
  %230 = fsub double %228, %229, !dbg !1088
  tail call void @llvm.dbg.value(metadata !{double %230}, i64 0, metadata !135), !dbg !1088
  %231 = extractelement <2 x double> %222, i32 1, !dbg !1089
  %232 = extractelement <2 x double> %226, i32 1, !dbg !1089
  %233 = fsub double %231, %232, !dbg !1089
  tail call void @llvm.dbg.value(metadata !{double %233}, i64 0, metadata !136), !dbg !1089
  %234 = getelementptr inbounds double* %a, i64 %217, !dbg !1090
  %235 = load double* %234, align 8, !dbg !1090, !tbaa !243
  %236 = getelementptr inbounds double* %a, i64 %218, !dbg !1090
  %237 = load double* %236, align 8, !dbg !1090, !tbaa !243
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !137), !dbg !1090
  %238 = add nsw i64 %217, 1, !dbg !1091
  %239 = getelementptr inbounds double* %a, i64 %238, !dbg !1091
  %240 = load double* %239, align 8, !dbg !1091, !tbaa !243
  %241 = add nsw i64 %218, 1, !dbg !1091
  %242 = getelementptr inbounds double* %a, i64 %241, !dbg !1091
  %243 = load double* %242, align 8, !dbg !1091, !tbaa !243
  %244 = insertelement <2 x double> undef, double %235, i32 0, !dbg !1090
  %245 = insertelement <2 x double> %244, double %240, i32 1, !dbg !1090
  %246 = insertelement <2 x double> undef, double %237, i32 0, !dbg !1090
  %247 = insertelement <2 x double> %246, double %243, i32 1, !dbg !1090
  %248 = fadd <2 x double> %245, %247, !dbg !1090
  tail call void @llvm.dbg.value(metadata !320, i64 0, metadata !138), !dbg !1091
  %249 = fsub double %235, %237, !dbg !1092
  tail call void @llvm.dbg.value(metadata !{double %249}, i64 0, metadata !139), !dbg !1092
  %250 = fsub double %240, %243, !dbg !1093
  tail call void @llvm.dbg.value(metadata !{double %250}, i64 0, metadata !140), !dbg !1093
  %251 = fadd <2 x double> %227, %248, !dbg !1094
  %252 = bitcast double* %219 to <2 x double>*, !dbg !1094
  store <2 x double> %251, <2 x double>* %252, align 8, !dbg !1094, !tbaa !243
  %253 = extractelement <2 x double> %227, i32 0, !dbg !1095
  %254 = extractelement <2 x double> %248, i32 0, !dbg !1095
  %255 = fsub double %253, %254, !dbg !1095
  tail call void @llvm.dbg.value(metadata !{double %255}, i64 0, metadata !133), !dbg !1095
  %256 = extractelement <2 x double> %227, i32 1, !dbg !1096
  %257 = extractelement <2 x double> %248, i32 1, !dbg !1096
  %258 = fsub double %256, %257, !dbg !1096
  tail call void @llvm.dbg.value(metadata !{double %258}, i64 0, metadata !134), !dbg !1096
  %259 = fmul double %255, %214, !dbg !1081
  %260 = fmul double %121, %258, !dbg !1081
  %261 = fsub double %259, %260, !dbg !1081
  store double %261, double* %234, align 8, !dbg !1081, !tbaa !243
  %262 = fmul double %258, %214, !dbg !1097
  %263 = fmul double %121, %255, !dbg !1097
  %264 = fadd double %263, %262, !dbg !1097
  store double %264, double* %239, align 8, !dbg !1097, !tbaa !243
  %265 = fsub double %230, %250, !dbg !1098
  tail call void @llvm.dbg.value(metadata !{double %265}, i64 0, metadata !133), !dbg !1098
  %266 = fadd double %233, %249, !dbg !1099
  tail call void @llvm.dbg.value(metadata !{double %266}, i64 0, metadata !134), !dbg !1099
  %267 = fmul double %202, %265, !dbg !1100
  %268 = fmul double %206, %266, !dbg !1100
  %269 = fsub double %267, %268, !dbg !1100
  store double %269, double* %220, align 8, !dbg !1100, !tbaa !243
  %270 = fmul double %202, %266, !dbg !1101
  %271 = fmul double %206, %265, !dbg !1101
  %272 = fadd double %270, %271, !dbg !1101
  store double %272, double* %224, align 8, !dbg !1101, !tbaa !243
  %273 = fadd double %230, %250, !dbg !1102
  tail call void @llvm.dbg.value(metadata !{double %273}, i64 0, metadata !133), !dbg !1102
  %274 = fsub double %233, %249, !dbg !1103
  tail call void @llvm.dbg.value(metadata !{double %274}, i64 0, metadata !134), !dbg !1103
  %275 = fmul double %209, %273, !dbg !1104
  %276 = fmul double %211, %274, !dbg !1104
  %277 = fsub double %275, %276, !dbg !1104
  store double %277, double* %236, align 8, !dbg !1104, !tbaa !243
  %278 = fmul double %209, %274, !dbg !1105
  %279 = fmul double %211, %273, !dbg !1105
  %280 = fadd double %278, %279, !dbg !1105
  store double %280, double* %242, align 8, !dbg !1105, !tbaa !243
  %281 = add nsw i32 %j.32, 2, !dbg !1079
  tail call void @llvm.dbg.value(metadata !{i32 %281}, i64 0, metadata !118), !dbg !1079
  %282 = icmp slt i32 %281, %213, !dbg !1079
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 2, !dbg !1079
  br i1 %282, label %215, label %._crit_edge5, !dbg !1079

._crit_edge5:                                     ; preds = %215, %._crit_edge
  %283 = add nsw i32 %k.07, %110, !dbg !1036
  tail call void @llvm.dbg.value(metadata !{i32 %283}, i64 0, metadata !122), !dbg !1036
  %phitmp = add i32 %k1.06, 2, !dbg !1036
  %284 = icmp slt i32 %283, %n, !dbg !1036
  %indvars.iv.next = add nsw i64 %indvars.iv, %113, !dbg !1036
  %indvars.iv.next22 = add i32 %indvars.iv21, %112, !dbg !1036
  br i1 %284, label %116, label %._crit_edge10, !dbg !1036

._crit_edge10:                                    ; preds = %._crit_edge5, %._crit_edge14
  ret void, !dbg !1106
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
!294 = metadata !{i32 786689, metadata !163, metadata !"n", metadata !5, i32 16777646, metadata !8, i32 0, metadata !295} ; [ DW_TAG_arg_variable ] [n] [line 430]
!295 = metadata !{i32 179, i32 0, metadata !290, metadata !282}
!296 = metadata !{i32 430, i32 0, metadata !163, metadata !295}
!297 = metadata !{i32 786689, metadata !163, metadata !"a", metadata !5, i32 33554862, metadata !15, i32 0, metadata !295} ; [ DW_TAG_arg_variable ] [a] [line 430]
!298 = metadata !{i32 786689, metadata !163, metadata !"w", metadata !5, i32 50332078, metadata !15, i32 0, metadata !295} ; [ DW_TAG_arg_variable ] [w] [line 430]
!299 = metadata !{i32 2}
!300 = metadata !{i32 786688, metadata !163, metadata !"l", metadata !5, i32 432, metadata !8, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [l] [line 432]
!301 = metadata !{i32 435, i32 0, metadata !163, metadata !295}
!302 = metadata !{i32 437, i32 0, metadata !303, metadata !295}
!303 = metadata !{i32 786443, metadata !1, metadata !304, i32 436, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!304 = metadata !{i32 786443, metadata !1, metadata !163, i32 436, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!305 = metadata !{i32 8}
!306 = metadata !{i32 438, i32 0, metadata !303, metadata !295}
!307 = metadata !{i32 440, i32 0, metadata !308, metadata !295}
!308 = metadata !{i32 786443, metadata !1, metadata !303, i32 439, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!309 = metadata !{i32 441, i32 0, metadata !308, metadata !295}
!310 = metadata !{i32 786688, metadata !163, metadata !"j", metadata !5, i32 432, metadata !8, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [j] [line 432]
!311 = metadata !{i32 445, i32 0, metadata !312, metadata !295}
!312 = metadata !{i32 786443, metadata !1, metadata !313, i32 445, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!313 = metadata !{i32 786443, metadata !1, metadata !314, i32 444, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!314 = metadata !{i32 786443, metadata !1, metadata !163, i32 444, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!315 = metadata !{i32 446, i32 0, metadata !316, metadata !295}
!316 = metadata !{i32 786443, metadata !1, metadata !312, i32 445, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!317 = metadata !{i32 447, i32 0, metadata !316, metadata !295}
!318 = metadata !{i32 448, i32 0, metadata !316, metadata !295}
!319 = metadata !{i32 449, i32 0, metadata !316, metadata !295}
!320 = metadata !{double undef}
!321 = metadata !{i32 786688, metadata !163, metadata !"x0r", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x0r] [line 433]
!322 = metadata !{i32 450, i32 0, metadata !316, metadata !295}
!323 = metadata !{i32 786688, metadata !163, metadata !"x0i", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x0i] [line 433]
!324 = metadata !{i32 451, i32 0, metadata !316, metadata !295}
!325 = metadata !{i32 786688, metadata !163, metadata !"x1r", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x1r] [line 433]
!326 = metadata !{i32 452, i32 0, metadata !316, metadata !295}
!327 = metadata !{i32 786688, metadata !163, metadata !"x1i", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x1i] [line 433]
!328 = metadata !{i32 453, i32 0, metadata !316, metadata !295}
!329 = metadata !{i32 786688, metadata !163, metadata !"x2r", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x2r] [line 433]
!330 = metadata !{i32 454, i32 0, metadata !316, metadata !295}
!331 = metadata !{i32 786688, metadata !163, metadata !"x2i", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x2i] [line 433]
!332 = metadata !{i32 455, i32 0, metadata !316, metadata !295}
!333 = metadata !{i32 786688, metadata !163, metadata !"x3r", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x3r] [line 433]
!334 = metadata !{i32 456, i32 0, metadata !316, metadata !295}
!335 = metadata !{i32 786688, metadata !163, metadata !"x3i", metadata !5, i32 433, metadata !16, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [x3i] [line 433]
!336 = metadata !{i32 457, i32 0, metadata !316, metadata !295}
!337 = metadata !{i32 459, i32 0, metadata !316, metadata !295}
!338 = metadata !{i32 461, i32 0, metadata !316, metadata !295}
!339 = metadata !{i32 462, i32 0, metadata !316, metadata !295}
!340 = metadata !{i32 463, i32 0, metadata !316, metadata !295}
!341 = metadata !{i32 464, i32 0, metadata !316, metadata !295}
!342 = metadata !{i32 63, i32 0, metadata !4, null}
!343 = metadata !{i32 786689, metadata !43, metadata !"nini", metadata !5, i32 16777343, metadata !8, i32 0, metadata !344} ; [ DW_TAG_arg_variable ] [nini] [line 127]
!344 = metadata !{i32 64, i32 0, metadata !4, null}
!345 = metadata !{i32 127, i32 0, metadata !43, metadata !344}
!346 = metadata !{i32 786689, metadata !43, metadata !"nend", metadata !5, i32 33554559, metadata !8, i32 0, metadata !344} ; [ DW_TAG_arg_variable ] [nend] [line 127]
!347 = metadata !{double 9.765625e-04}
!348 = metadata !{i32 786689, metadata !43, metadata !"scale", metadata !5, i32 50331775, metadata !16, i32 0, metadata !344} ; [ DW_TAG_arg_variable ] [scale] [line 127]
!349 = metadata !{i32 786689, metadata !43, metadata !"a", metadata !5, i32 67108991, metadata !15, i32 0, metadata !344} ; [ DW_TAG_arg_variable ] [a] [line 127]
!350 = metadata !{i32 786688, metadata !43, metadata !"seed", metadata !5, i32 129, metadata !8, i32 0, metadata !344} ; [ DW_TAG_auto_variable ] [seed] [line 129]
!351 = metadata !{i32 129, i32 0, metadata !43, metadata !344}
!352 = metadata !{i32 786688, metadata !43, metadata !"err", metadata !5, i32 130, metadata !16, i32 0, metadata !344} ; [ DW_TAG_auto_variable ] [err] [line 130]
!353 = metadata !{i32 130, i32 0, metadata !43, metadata !344}
!354 = metadata !{i32 786688, metadata !43, metadata !"j", metadata !5, i32 129, metadata !8, i32 0, metadata !344} ; [ DW_TAG_auto_variable ] [j] [line 129]
!355 = metadata !{i32 132, i32 0, metadata !356, metadata !344}
!356 = metadata !{i32 786443, metadata !1, metadata !43, i32 132, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!357 = metadata !{i32 133, i32 0, metadata !358, metadata !344}
!358 = metadata !{i32 786443, metadata !1, metadata !356, i32 132, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!359 = metadata !{i32 786688, metadata !43, metadata !"e", metadata !5, i32 130, metadata !16, i32 0, metadata !344} ; [ DW_TAG_auto_variable ] [e] [line 130]
!360 = metadata !{i32 134, i32 0, metadata !358, metadata !344}
!361 = metadata !{i32 65, i32 0, metadata !362, null}
!362 = metadata !{i32 786443, metadata !1, metadata !4, i32 65, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!363 = metadata !{i32 66, i32 0, metadata !364, null}
!364 = metadata !{i32 786443, metadata !1, metadata !362, i32 65, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!365 = metadata !{i32 67, i32 0, metadata !364, null}
!366 = metadata !{i32 71, i32 0, metadata !4, null}
!367 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!368 = metadata !{i32 72, i32 0, metadata !4, null}
!369 = metadata !{i32 119, i32 0, metadata !34, metadata !368}
!370 = metadata !{i32 1023}
!371 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!372 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !368} ; [ DW_TAG_arg_variable ] [a] [line 119]
!373 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !368} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!374 = metadata !{i32 121, i32 0, metadata !34, metadata !368}
!375 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !368} ; [ DW_TAG_auto_variable ] [j] [line 121]
!376 = metadata !{i32 123, i32 0, metadata !278, metadata !368}
!377 = metadata !{i32 124, i32 0, metadata !278, metadata !368}
!378 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [n] [line 174]
!379 = metadata !{i32 73, i32 0, metadata !4, null}
!380 = metadata !{i32 174, i32 0, metadata !69, metadata !379}
!381 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!382 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [a] [line 174]
!383 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!384 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !379} ; [ DW_TAG_arg_variable ] [w] [line 174]
!385 = metadata !{i32 178, i32 0, metadata !290, metadata !379}
!386 = metadata !{i32 786689, metadata !163, metadata !"n", metadata !5, i32 16777646, metadata !8, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [n] [line 430]
!387 = metadata !{i32 179, i32 0, metadata !290, metadata !379}
!388 = metadata !{i32 430, i32 0, metadata !163, metadata !387}
!389 = metadata !{i32 786689, metadata !163, metadata !"a", metadata !5, i32 33554862, metadata !15, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [a] [line 430]
!390 = metadata !{i32 786689, metadata !163, metadata !"w", metadata !5, i32 50332078, metadata !15, i32 0, metadata !387} ; [ DW_TAG_arg_variable ] [w] [line 430]
!391 = metadata !{i32 786688, metadata !163, metadata !"l", metadata !5, i32 432, metadata !8, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [l] [line 432]
!392 = metadata !{i32 435, i32 0, metadata !163, metadata !387}
!393 = metadata !{i32 437, i32 0, metadata !303, metadata !387}
!394 = metadata !{i32 438, i32 0, metadata !303, metadata !387}
!395 = metadata !{i32 440, i32 0, metadata !308, metadata !387}
!396 = metadata !{i32 441, i32 0, metadata !308, metadata !387}
!397 = metadata !{i32 786688, metadata !163, metadata !"j", metadata !5, i32 432, metadata !8, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [j] [line 432]
!398 = metadata !{i32 445, i32 0, metadata !312, metadata !387}
!399 = metadata !{i32 446, i32 0, metadata !316, metadata !387}
!400 = metadata !{i32 447, i32 0, metadata !316, metadata !387}
!401 = metadata !{i32 448, i32 0, metadata !316, metadata !387}
!402 = metadata !{i32 449, i32 0, metadata !316, metadata !387}
!403 = metadata !{i32 786688, metadata !163, metadata !"x0r", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x0r] [line 433]
!404 = metadata !{i32 450, i32 0, metadata !316, metadata !387}
!405 = metadata !{i32 786688, metadata !163, metadata !"x0i", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x0i] [line 433]
!406 = metadata !{i32 451, i32 0, metadata !316, metadata !387}
!407 = metadata !{i32 786688, metadata !163, metadata !"x1r", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x1r] [line 433]
!408 = metadata !{i32 452, i32 0, metadata !316, metadata !387}
!409 = metadata !{i32 786688, metadata !163, metadata !"x1i", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x1i] [line 433]
!410 = metadata !{i32 453, i32 0, metadata !316, metadata !387}
!411 = metadata !{i32 786688, metadata !163, metadata !"x2r", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x2r] [line 433]
!412 = metadata !{i32 454, i32 0, metadata !316, metadata !387}
!413 = metadata !{i32 786688, metadata !163, metadata !"x2i", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x2i] [line 433]
!414 = metadata !{i32 455, i32 0, metadata !316, metadata !387}
!415 = metadata !{i32 786688, metadata !163, metadata !"x3r", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x3r] [line 433]
!416 = metadata !{i32 456, i32 0, metadata !316, metadata !387}
!417 = metadata !{i32 786688, metadata !163, metadata !"x3i", metadata !5, i32 433, metadata !16, i32 0, metadata !387} ; [ DW_TAG_auto_variable ] [x3i] [line 433]
!418 = metadata !{i32 457, i32 0, metadata !316, metadata !387}
!419 = metadata !{i32 459, i32 0, metadata !316, metadata !387}
!420 = metadata !{i32 461, i32 0, metadata !316, metadata !387}
!421 = metadata !{i32 462, i32 0, metadata !316, metadata !387}
!422 = metadata !{i32 463, i32 0, metadata !316, metadata !387}
!423 = metadata !{i32 464, i32 0, metadata !316, metadata !387}
!424 = metadata !{i32 75, i32 0, metadata !425, null}
!425 = metadata !{i32 786443, metadata !1, metadata !4, i32 74, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!426 = metadata !{i32 74, i32 0, metadata !425, null}
!427 = metadata !{i32 78, i32 0, metadata !4, null}
!428 = metadata !{i32 786689, metadata !34, metadata !"nini", metadata !5, i32 16777335, metadata !8, i32 0, metadata !429} ; [ DW_TAG_arg_variable ] [nini] [line 119]
!429 = metadata !{i32 79, i32 0, metadata !4, null}
!430 = metadata !{i32 119, i32 0, metadata !34, metadata !429}
!431 = metadata !{i32 786689, metadata !34, metadata !"nend", metadata !5, i32 33554551, metadata !8, i32 0, metadata !429} ; [ DW_TAG_arg_variable ] [nend] [line 119]
!432 = metadata !{i32 786689, metadata !34, metadata !"a", metadata !5, i32 50331767, metadata !15, i32 0, metadata !429} ; [ DW_TAG_arg_variable ] [a] [line 119]
!433 = metadata !{i32 786688, metadata !34, metadata !"seed", metadata !5, i32 121, metadata !8, i32 0, metadata !429} ; [ DW_TAG_auto_variable ] [seed] [line 121]
!434 = metadata !{i32 121, i32 0, metadata !34, metadata !429}
!435 = metadata !{i32 786688, metadata !34, metadata !"j", metadata !5, i32 121, metadata !8, i32 0, metadata !429} ; [ DW_TAG_auto_variable ] [j] [line 121]
!436 = metadata !{i32 123, i32 0, metadata !278, metadata !429}
!437 = metadata !{i32 124, i32 0, metadata !278, metadata !429}
!438 = metadata !{i32 158, i32 0, metadata !55, metadata !439}
!439 = metadata !{i32 81, i32 0, metadata !4, null}
!440 = metadata !{i32 160, i32 0, metadata !55, metadata !439}
!441 = metadata !{i32 161, i32 0, metadata !55, metadata !439}
!442 = metadata !{i32 82, i32 0, metadata !27, null}
!443 = metadata !{i32 85, i32 0, metadata !26, null}
!444 = metadata !{i32 786689, metadata !69, metadata !"n", metadata !5, i32 16777390, metadata !8, i32 0, metadata !445} ; [ DW_TAG_arg_variable ] [n] [line 174]
!445 = metadata !{i32 86, i32 0, metadata !26, null}
!446 = metadata !{i32 174, i32 0, metadata !69, metadata !445}
!447 = metadata !{i32 786689, metadata !69, metadata !"isgn", metadata !5, i32 33554606, metadata !8, i32 0, metadata !445} ; [ DW_TAG_arg_variable ] [isgn] [line 174]
!448 = metadata !{i32 786689, metadata !69, metadata !"a", metadata !5, i32 50331822, metadata !15, i32 0, metadata !445} ; [ DW_TAG_arg_variable ] [a] [line 174]
!449 = metadata !{i32 786689, metadata !69, metadata !"ip", metadata !5, i32 67109038, metadata !13, i32 0, metadata !445} ; [ DW_TAG_arg_variable ] [ip] [line 174]
!450 = metadata !{i32 786689, metadata !69, metadata !"w", metadata !5, i32 83886254, metadata !15, i32 0, metadata !445} ; [ DW_TAG_arg_variable ] [w] [line 174]
!451 = metadata !{i32 178, i32 0, metadata !290, metadata !445}
!452 = metadata !{i32 786689, metadata !163, metadata !"n", metadata !5, i32 16777646, metadata !8, i32 0, metadata !453} ; [ DW_TAG_arg_variable ] [n] [line 430]
!453 = metadata !{i32 179, i32 0, metadata !290, metadata !445}
!454 = metadata !{i32 430, i32 0, metadata !163, metadata !453}
!455 = metadata !{i32 786689, metadata !163, metadata !"a", metadata !5, i32 33554862, metadata !15, i32 0, metadata !453} ; [ DW_TAG_arg_variable ] [a] [line 430]
!456 = metadata !{i32 786689, metadata !163, metadata !"w", metadata !5, i32 50332078, metadata !15, i32 0, metadata !453} ; [ DW_TAG_arg_variable ] [w] [line 430]
!457 = metadata !{i32 786688, metadata !163, metadata !"l", metadata !5, i32 432, metadata !8, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [l] [line 432]
!458 = metadata !{i32 435, i32 0, metadata !163, metadata !453}
!459 = metadata !{i32 437, i32 0, metadata !303, metadata !453}
!460 = metadata !{i32 438, i32 0, metadata !303, metadata !453}
!461 = metadata !{i32 440, i32 0, metadata !308, metadata !453}
!462 = metadata !{i32 441, i32 0, metadata !308, metadata !453}
!463 = metadata !{i32 786688, metadata !163, metadata !"j", metadata !5, i32 432, metadata !8, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [j] [line 432]
!464 = metadata !{i32 445, i32 0, metadata !312, metadata !453}
!465 = metadata !{i32 446, i32 0, metadata !316, metadata !453}
!466 = metadata !{i32 447, i32 0, metadata !316, metadata !453}
!467 = metadata !{i32 448, i32 0, metadata !316, metadata !453}
!468 = metadata !{i32 449, i32 0, metadata !316, metadata !453}
!469 = metadata !{i32 786688, metadata !163, metadata !"x0r", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x0r] [line 433]
!470 = metadata !{i32 450, i32 0, metadata !316, metadata !453}
!471 = metadata !{i32 786688, metadata !163, metadata !"x0i", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x0i] [line 433]
!472 = metadata !{i32 451, i32 0, metadata !316, metadata !453}
!473 = metadata !{i32 786688, metadata !163, metadata !"x1r", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x1r] [line 433]
!474 = metadata !{i32 452, i32 0, metadata !316, metadata !453}
!475 = metadata !{i32 786688, metadata !163, metadata !"x1i", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x1i] [line 433]
!476 = metadata !{i32 453, i32 0, metadata !316, metadata !453}
!477 = metadata !{i32 786688, metadata !163, metadata !"x2r", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x2r] [line 433]
!478 = metadata !{i32 454, i32 0, metadata !316, metadata !453}
!479 = metadata !{i32 786688, metadata !163, metadata !"x2i", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x2i] [line 433]
!480 = metadata !{i32 455, i32 0, metadata !316, metadata !453}
!481 = metadata !{i32 786688, metadata !163, metadata !"x3r", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x3r] [line 433]
!482 = metadata !{i32 456, i32 0, metadata !316, metadata !453}
!483 = metadata !{i32 786688, metadata !163, metadata !"x3i", metadata !5, i32 433, metadata !16, i32 0, metadata !453} ; [ DW_TAG_auto_variable ] [x3i] [line 433]
!484 = metadata !{i32 457, i32 0, metadata !316, metadata !453}
!485 = metadata !{i32 459, i32 0, metadata !316, metadata !453}
!486 = metadata !{i32 461, i32 0, metadata !316, metadata !453}
!487 = metadata !{i32 462, i32 0, metadata !316, metadata !453}
!488 = metadata !{i32 463, i32 0, metadata !316, metadata !453}
!489 = metadata !{i32 464, i32 0, metadata !316, metadata !453}
!490 = metadata !{i32 89, i32 0, metadata !29, null}
!491 = metadata !{i32 90, i32 0, metadata !29, null}
!492 = metadata !{i32 91, i32 0, metadata !29, null}
!493 = metadata !{i32 92, i32 0, metadata !29, null}
!494 = metadata !{i32 93, i32 0, metadata !29, null}
!495 = metadata !{i32 94, i32 0, metadata !29, null}
!496 = metadata !{i32 88, i32 0, metadata !30, null}
!497 = metadata !{i32 97, i32 0, metadata !26, null}
!498 = metadata !{i32 158, i32 0, metadata !55, metadata !499}
!499 = metadata !{i32 99, i32 0, metadata !4, null}
!500 = metadata !{i32 160, i32 0, metadata !55, metadata !499}
!501 = metadata !{i32 161, i32 0, metadata !55, metadata !499}
!502 = metadata !{i32 102, i32 0, metadata !503, null}
!503 = metadata !{i32 786443, metadata !1, metadata !4, i32 102, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!504 = metadata !{i32 104, i32 0, metadata !505, null}
!505 = metadata !{i32 786443, metadata !1, metadata !503, i32 102, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!506 = metadata !{i32 105, i32 0, metadata !505, null}
!507 = metadata !{i32 103, i32 0, metadata !505, null}
!508 = metadata !{i32 109, i32 0, metadata !4, null}
!509 = metadata !{i32 110, i32 0, metadata !4, null}
!510 = metadata !{i32 111, i32 0, metadata !4, null}
!511 = metadata !{i32 113, i32 0, metadata !4, null}
!512 = metadata !{i32 114, i32 0, metadata !4, null}
!513 = metadata !{i32 116, i32 0, metadata !4, null}
!514 = metadata !{i32 158, i32 0, metadata !55, null}
!515 = metadata !{i32 160, i32 0, metadata !55, null}
!516 = metadata !{i32 161, i32 0, metadata !55, null}
!517 = metadata !{metadata !518, metadata !519, i64 0}
!518 = metadata !{metadata !"timeval", metadata !519, i64 0, metadata !519, i64 8}
!519 = metadata !{metadata !"long", metadata !245, i64 0}
!520 = metadata !{metadata !518, metadata !519, i64 8}
!521 = metadata !{i32 193, i32 0, metadata !78, null}
!522 = metadata !{i32 198, i32 0, metadata !238, null}
!523 = metadata !{i32 199, i32 0, metadata !237, null}
!524 = metadata !{i32 200, i32 0, metadata !237, null}
!525 = metadata !{i32 201, i32 0, metadata !237, null}
!526 = metadata !{i32 202, i32 0, metadata !237, null}
!527 = metadata !{i32 203, i32 0, metadata !237, null}
!528 = metadata !{i32 204, i32 0, metadata !237, null}
!529 = metadata !{i32 205, i32 0, metadata !254, null}
!530 = metadata !{i32 207, i32 0, metadata !251, null}
!531 = metadata !{i32 208, i32 0, metadata !251, null}
!532 = metadata !{i32 209, i32 0, metadata !251, null}
!533 = metadata !{i32 210, i32 0, metadata !251, null}
!534 = metadata !{i32 211, i32 0, metadata !251, null}
!535 = metadata !{i32 212, i32 0, metadata !251, null}
!536 = metadata !{i32 206, i32 0, metadata !252, null}
!537 = metadata !{i32 214, i32 0, metadata !253, null}
!538 = metadata !{i32 215, i32 0, metadata !253, null}
!539 = metadata !{i32 217, i32 0, metadata !78, null}
!540 = metadata !{i32 119, i32 0, metadata !34, null}
!541 = metadata !{i32 121, i32 0, metadata !34, null}
!542 = metadata !{i32 123, i32 0, metadata !278, null}
!543 = metadata !{i32 124, i32 0, metadata !278, null}
!544 = metadata !{i32 125, i32 0, metadata !34, null}
!545 = metadata !{i32 174, i32 0, metadata !69, null}
!546 = metadata !{i32 176, i32 0, metadata !293, null}
!547 = metadata !{i32 177, i32 0, metadata !291, null}
!548 = metadata !{i32 178, i32 0, metadata !290, null}
!549 = metadata !{i32 179, i32 0, metadata !290, null}
!550 = metadata !{i32 180, i32 0, metadata !290, null}
!551 = metadata !{i32 786689, metadata !181, metadata !"n", metadata !5, i32 16777537, metadata !8, i32 0, metadata !552} ; [ DW_TAG_arg_variable ] [n] [line 321]
!552 = metadata !{i32 181, i32 0, metadata !553, null}
!553 = metadata !{i32 786443, metadata !1, metadata !291, i32 180, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!554 = metadata !{i32 321, i32 0, metadata !181, metadata !552}
!555 = metadata !{i32 786689, metadata !181, metadata !"ip", metadata !5, i32 33554753, metadata !13, i32 0, metadata !552} ; [ DW_TAG_arg_variable ] [ip] [line 321]
!556 = metadata !{i32 786689, metadata !181, metadata !"a", metadata !5, i32 50331969, metadata !15, i32 0, metadata !552} ; [ DW_TAG_arg_variable ] [a] [line 321]
!557 = metadata !{i32 326, i32 0, metadata !181, metadata !552}
!558 = metadata !{metadata !559, metadata !559, i64 0}
!559 = metadata !{metadata !"int", metadata !245, i64 0}
!560 = metadata !{i32 786688, metadata !181, metadata !"l", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [l] [line 323]
!561 = metadata !{i32 327, i32 0, metadata !181, metadata !552}
!562 = metadata !{i32 786688, metadata !181, metadata !"m", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [m] [line 323]
!563 = metadata !{i32 328, i32 0, metadata !181, metadata !552}
!564 = metadata !{i32 329, i32 0, metadata !181, metadata !552}
!565 = metadata !{i32 330, i32 0, metadata !566, metadata !552}
!566 = metadata !{i32 786443, metadata !1, metadata !181, i32 329, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!567 = metadata !{i32 786688, metadata !181, metadata !"j", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [j] [line 323]
!568 = metadata !{i32 331, i32 0, metadata !569, metadata !552}
!569 = metadata !{i32 786443, metadata !1, metadata !566, i32 331, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!570 = metadata !{i32 332, i32 0, metadata !571, metadata !552}
!571 = metadata !{i32 786443, metadata !1, metadata !569, i32 331, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!572 = metadata !{metadata !572, metadata !573, metadata !574}
!573 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!574 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!575 = metadata !{metadata !575, metadata !573, metadata !574}
!576 = metadata !{i32 334, i32 0, metadata !566, metadata !552}
!577 = metadata !{i32 336, i32 0, metadata !181, metadata !552}
!578 = metadata !{i32 786688, metadata !181, metadata !"m2", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [m2] [line 323]
!579 = metadata !{i32 337, i32 0, metadata !580, metadata !552}
!580 = metadata !{i32 786443, metadata !1, metadata !181, i32 337, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!581 = metadata !{i32 338, i32 0, metadata !582, metadata !552}
!582 = metadata !{i32 786443, metadata !1, metadata !583, i32 338, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!583 = metadata !{i32 786443, metadata !1, metadata !580, i32 337, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!584 = metadata !{i32 393, i32 0, metadata !585, metadata !552}
!585 = metadata !{i32 786443, metadata !1, metadata !582, i32 338, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!586 = metadata !{i32 351, i32 0, metadata !587, metadata !552}
!587 = metadata !{i32 786443, metadata !1, metadata !588, i32 339, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!588 = metadata !{i32 786443, metadata !1, metadata !585, i32 339, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!589 = metadata !{i32 339, i32 0, metadata !588, metadata !552}
!590 = metadata !{i32 340, i32 0, metadata !587, metadata !552}
!591 = metadata !{i32 341, i32 0, metadata !587, metadata !552}
!592 = metadata !{i32 786688, metadata !181, metadata !"j1", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [j1] [line 323]
!593 = metadata !{i32 786688, metadata !181, metadata !"k1", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [k1] [line 323]
!594 = metadata !{i32 342, i32 0, metadata !587, metadata !552}
!595 = metadata !{i32 786688, metadata !181, metadata !"xr", metadata !5, i32 324, metadata !16, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [xr] [line 324]
!596 = metadata !{i32 343, i32 0, metadata !587, metadata !552}
!597 = metadata !{i32 786688, metadata !181, metadata !"xi", metadata !5, i32 324, metadata !16, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [xi] [line 324]
!598 = metadata !{i32 344, i32 0, metadata !587, metadata !552}
!599 = metadata !{i32 786688, metadata !181, metadata !"yr", metadata !5, i32 324, metadata !16, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [yr] [line 324]
!600 = metadata !{i32 345, i32 0, metadata !587, metadata !552}
!601 = metadata !{i32 786688, metadata !181, metadata !"yi", metadata !5, i32 324, metadata !16, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [yi] [line 324]
!602 = metadata !{i32 346, i32 0, metadata !587, metadata !552}
!603 = metadata !{i32 347, i32 0, metadata !587, metadata !552}
!604 = metadata !{i32 348, i32 0, metadata !587, metadata !552}
!605 = metadata !{i32 349, i32 0, metadata !587, metadata !552}
!606 = metadata !{i32 350, i32 0, metadata !587, metadata !552}
!607 = metadata !{i32 352, i32 0, metadata !587, metadata !552}
!608 = metadata !{i32 353, i32 0, metadata !587, metadata !552}
!609 = metadata !{i32 354, i32 0, metadata !587, metadata !552}
!610 = metadata !{i32 355, i32 0, metadata !587, metadata !552}
!611 = metadata !{i32 356, i32 0, metadata !587, metadata !552}
!612 = metadata !{i32 357, i32 0, metadata !587, metadata !552}
!613 = metadata !{i32 358, i32 0, metadata !587, metadata !552}
!614 = metadata !{i32 359, i32 0, metadata !587, metadata !552}
!615 = metadata !{i32 360, i32 0, metadata !587, metadata !552}
!616 = metadata !{i32 361, i32 0, metadata !587, metadata !552}
!617 = metadata !{i32 362, i32 0, metadata !587, metadata !552}
!618 = metadata !{i32 363, i32 0, metadata !587, metadata !552}
!619 = metadata !{i32 364, i32 0, metadata !587, metadata !552}
!620 = metadata !{i32 365, i32 0, metadata !587, metadata !552}
!621 = metadata !{i32 366, i32 0, metadata !587, metadata !552}
!622 = metadata !{i32 367, i32 0, metadata !587, metadata !552}
!623 = metadata !{i32 368, i32 0, metadata !587, metadata !552}
!624 = metadata !{i32 369, i32 0, metadata !587, metadata !552}
!625 = metadata !{i32 370, i32 0, metadata !587, metadata !552}
!626 = metadata !{i32 371, i32 0, metadata !587, metadata !552}
!627 = metadata !{i32 372, i32 0, metadata !587, metadata !552}
!628 = metadata !{i32 373, i32 0, metadata !587, metadata !552}
!629 = metadata !{i32 374, i32 0, metadata !587, metadata !552}
!630 = metadata !{i32 375, i32 0, metadata !587, metadata !552}
!631 = metadata !{i32 376, i32 0, metadata !587, metadata !552}
!632 = metadata !{i32 377, i32 0, metadata !587, metadata !552}
!633 = metadata !{i32 378, i32 0, metadata !587, metadata !552}
!634 = metadata !{i32 379, i32 0, metadata !587, metadata !552}
!635 = metadata !{i32 381, i32 0, metadata !585, metadata !552}
!636 = metadata !{i32 382, i32 0, metadata !585, metadata !552}
!637 = metadata !{i32 383, i32 0, metadata !585, metadata !552}
!638 = metadata !{i32 384, i32 0, metadata !585, metadata !552}
!639 = metadata !{i32 385, i32 0, metadata !585, metadata !552}
!640 = metadata !{i32 386, i32 0, metadata !585, metadata !552}
!641 = metadata !{i32 387, i32 0, metadata !585, metadata !552}
!642 = metadata !{i32 388, i32 0, metadata !585, metadata !552}
!643 = metadata !{i32 389, i32 0, metadata !585, metadata !552}
!644 = metadata !{i32 390, i32 0, metadata !585, metadata !552}
!645 = metadata !{i32 391, i32 0, metadata !585, metadata !552}
!646 = metadata !{i32 392, i32 0, metadata !585, metadata !552}
!647 = metadata !{i32 394, i32 0, metadata !585, metadata !552}
!648 = metadata !{i32 786688, metadata !181, metadata !"k", metadata !5, i32 323, metadata !8, i32 0, metadata !552} ; [ DW_TAG_auto_variable ] [k] [line 323]
!649 = metadata !{i32 397, i32 0, metadata !650, metadata !552}
!650 = metadata !{i32 786443, metadata !1, metadata !580, i32 396, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!651 = metadata !{i32 398, i32 0, metadata !650, metadata !552}
!652 = metadata !{i32 399, i32 0, metadata !653, metadata !552}
!653 = metadata !{i32 786443, metadata !1, metadata !650, i32 399, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!654 = metadata !{i32 401, i32 0, metadata !655, metadata !552}
!655 = metadata !{i32 786443, metadata !1, metadata !656, i32 400, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!656 = metadata !{i32 786443, metadata !1, metadata !657, i32 400, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!657 = metadata !{i32 786443, metadata !1, metadata !653, i32 399, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!658 = metadata !{i32 402, i32 0, metadata !655, metadata !552}
!659 = metadata !{i32 400, i32 0, metadata !656, metadata !552}
!660 = metadata !{i32 403, i32 0, metadata !655, metadata !552}
!661 = metadata !{i32 404, i32 0, metadata !655, metadata !552}
!662 = metadata !{i32 405, i32 0, metadata !655, metadata !552}
!663 = metadata !{i32 406, i32 0, metadata !655, metadata !552}
!664 = metadata !{i32 407, i32 0, metadata !655, metadata !552}
!665 = metadata !{i32 408, i32 0, metadata !655, metadata !552}
!666 = metadata !{i32 409, i32 0, metadata !655, metadata !552}
!667 = metadata !{i32 410, i32 0, metadata !655, metadata !552}
!668 = metadata !{i32 411, i32 0, metadata !655, metadata !552}
!669 = metadata !{i32 412, i32 0, metadata !655, metadata !552}
!670 = metadata !{i32 413, i32 0, metadata !655, metadata !552}
!671 = metadata !{i32 414, i32 0, metadata !655, metadata !552}
!672 = metadata !{i32 415, i32 0, metadata !655, metadata !552}
!673 = metadata !{i32 416, i32 0, metadata !655, metadata !552}
!674 = metadata !{i32 417, i32 0, metadata !655, metadata !552}
!675 = metadata !{i32 418, i32 0, metadata !655, metadata !552}
!676 = metadata !{i32 419, i32 0, metadata !655, metadata !552}
!677 = metadata !{i32 420, i32 0, metadata !655, metadata !552}
!678 = metadata !{i32 422, i32 0, metadata !657, metadata !552}
!679 = metadata !{i32 423, i32 0, metadata !657, metadata !552}
!680 = metadata !{i32 424, i32 0, metadata !657, metadata !552}
!681 = metadata !{i32 786689, metadata !90, metadata !"n", metadata !5, i32 16777696, metadata !8, i32 0, metadata !682} ; [ DW_TAG_arg_variable ] [n] [line 480]
!682 = metadata !{i32 182, i32 0, metadata !553, null}
!683 = metadata !{i32 480, i32 0, metadata !90, metadata !682}
!684 = metadata !{i32 786689, metadata !90, metadata !"a", metadata !5, i32 33554912, metadata !15, i32 0, metadata !682} ; [ DW_TAG_arg_variable ] [a] [line 480]
!685 = metadata !{i32 786689, metadata !90, metadata !"w", metadata !5, i32 50332128, metadata !15, i32 0, metadata !682} ; [ DW_TAG_arg_variable ] [w] [line 480]
!686 = metadata !{i32 786688, metadata !90, metadata !"l", metadata !5, i32 482, metadata !8, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [l] [line 482]
!687 = metadata !{i32 485, i32 0, metadata !90, metadata !682}
!688 = metadata !{i32 486, i32 0, metadata !689, metadata !682}
!689 = metadata !{i32 786443, metadata !1, metadata !90, i32 486, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!690 = metadata !{i32 487, i32 0, metadata !691, metadata !682}
!691 = metadata !{i32 786443, metadata !1, metadata !689, i32 486, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!692 = metadata !{i32 488, i32 0, metadata !691, metadata !682}
!693 = metadata !{i32 489, i32 0, metadata !691, metadata !682}
!694 = metadata !{i32 490, i32 0, metadata !695, metadata !682}
!695 = metadata !{i32 786443, metadata !1, metadata !691, i32 489, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!696 = metadata !{i32 491, i32 0, metadata !695, metadata !682}
!697 = metadata !{i32 494, i32 0, metadata !698, metadata !682}
!698 = metadata !{i32 786443, metadata !1, metadata !90, i32 494, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!699 = metadata !{i32 786688, metadata !90, metadata !"j", metadata !5, i32 482, metadata !8, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [j] [line 482]
!700 = metadata !{i32 495, i32 0, metadata !701, metadata !682}
!701 = metadata !{i32 786443, metadata !1, metadata !702, i32 495, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!702 = metadata !{i32 786443, metadata !1, metadata !698, i32 494, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!703 = metadata !{i32 517, i32 0, metadata !704, metadata !682}
!704 = metadata !{i32 786443, metadata !1, metadata !705, i32 517, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!705 = metadata !{i32 786443, metadata !1, metadata !698, i32 516, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!706 = metadata !{i32 496, i32 0, metadata !707, metadata !682}
!707 = metadata !{i32 786443, metadata !1, metadata !701, i32 495, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!708 = metadata !{i32 497, i32 0, metadata !707, metadata !682}
!709 = metadata !{i32 498, i32 0, metadata !707, metadata !682}
!710 = metadata !{i32 499, i32 0, metadata !707, metadata !682}
!711 = metadata !{i32 786688, metadata !90, metadata !"x0r", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x0r] [line 483]
!712 = metadata !{i32 500, i32 0, metadata !707, metadata !682}
!713 = metadata !{i32 786688, metadata !90, metadata !"x0i", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x0i] [line 483]
!714 = metadata !{i32 786688, metadata !90, metadata !"x1r", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x1r] [line 483]
!715 = metadata !{i32 501, i32 0, metadata !707, metadata !682}
!716 = metadata !{i32 786688, metadata !90, metadata !"x1i", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x1i] [line 483]
!717 = metadata !{i32 502, i32 0, metadata !707, metadata !682}
!718 = metadata !{i32 503, i32 0, metadata !707, metadata !682}
!719 = metadata !{i32 786688, metadata !90, metadata !"x2r", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x2r] [line 483]
!720 = metadata !{i32 504, i32 0, metadata !707, metadata !682}
!721 = metadata !{i32 786688, metadata !90, metadata !"x2i", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x2i] [line 483]
!722 = metadata !{i32 786688, metadata !90, metadata !"x3r", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x3r] [line 483]
!723 = metadata !{i32 505, i32 0, metadata !707, metadata !682}
!724 = metadata !{i32 506, i32 0, metadata !707, metadata !682}
!725 = metadata !{i32 786688, metadata !90, metadata !"x3i", metadata !5, i32 483, metadata !16, i32 0, metadata !682} ; [ DW_TAG_auto_variable ] [x3i] [line 483]
!726 = metadata !{i32 507, i32 0, metadata !707, metadata !682}
!727 = metadata !{i32 508, i32 0, metadata !707, metadata !682}
!728 = metadata !{i32 509, i32 0, metadata !707, metadata !682}
!729 = metadata !{i32 510, i32 0, metadata !707, metadata !682}
!730 = metadata !{i32 511, i32 0, metadata !707, metadata !682}
!731 = metadata !{i32 513, i32 0, metadata !707, metadata !682}
!732 = metadata !{i32 518, i32 0, metadata !733, metadata !682}
!733 = metadata !{i32 786443, metadata !1, metadata !704, i32 517, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!734 = metadata !{i32 519, i32 0, metadata !733, metadata !682}
!735 = metadata !{i32 520, i32 0, metadata !733, metadata !682}
!736 = metadata !{i32 521, i32 0, metadata !733, metadata !682}
!737 = metadata !{i32 522, i32 0, metadata !733, metadata !682}
!738 = metadata !{i32 523, i32 0, metadata !733, metadata !682}
!739 = metadata !{i32 184, i32 0, metadata !740, null}
!740 = metadata !{i32 786443, metadata !1, metadata !293, i32 184, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!741 = metadata !{i32 185, i32 0, metadata !742, null}
!742 = metadata !{i32 786443, metadata !1, metadata !740, i32 184, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!743 = metadata !{i32 186, i32 0, metadata !742, null}
!744 = metadata !{i32 187, i32 0, metadata !69, null}
!745 = metadata !{i32 127, i32 0, metadata !43, null}
!746 = metadata !{i32 129, i32 0, metadata !43, null}
!747 = metadata !{i32 130, i32 0, metadata !43, null}
!748 = metadata !{i32 132, i32 0, metadata !356, null}
!749 = metadata !{i32 133, i32 0, metadata !358, null}
!750 = metadata !{i32 134, i32 0, metadata !358, null}
!751 = metadata !{i32 136, i32 0, metadata !43, null}
!752 = metadata !{i32 221, i32 0, metadata !197, null}
!753 = metadata !{i32 226, i32 0, metadata !197, null}
!754 = metadata !{i32 227, i32 0, metadata !197, null}
!755 = metadata !{i32 228, i32 0, metadata !197, null}
!756 = metadata !{i32 229, i32 0, metadata !197, null}
!757 = metadata !{i32 230, i32 0, metadata !758, null}
!758 = metadata !{i32 786443, metadata !1, metadata !197, i32 229, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!759 = metadata !{i32 231, i32 0, metadata !760, null}
!760 = metadata !{i32 786443, metadata !1, metadata !758, i32 231, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!761 = metadata !{i32 232, i32 0, metadata !762, null}
!762 = metadata !{i32 786443, metadata !1, metadata !760, i32 231, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!763 = metadata !{metadata !763, metadata !573, metadata !574}
!764 = metadata !{metadata !764, metadata !573, metadata !574}
!765 = metadata !{i32 234, i32 0, metadata !758, null}
!766 = metadata !{i32 236, i32 0, metadata !197, null}
!767 = metadata !{i32 237, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !1, metadata !197, i32 237, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!769 = metadata !{i32 293, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !1, metadata !771, i32 293, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!771 = metadata !{i32 786443, metadata !1, metadata !768, i32 292, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!772 = metadata !{i32 238, i32 0, metadata !773, null}
!773 = metadata !{i32 786443, metadata !1, metadata !774, i32 238, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!774 = metadata !{i32 786443, metadata !1, metadata !768, i32 237, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!775 = metadata !{i32 251, i32 0, metadata !776, null}
!776 = metadata !{i32 786443, metadata !1, metadata !777, i32 239, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!777 = metadata !{i32 786443, metadata !1, metadata !778, i32 239, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!778 = metadata !{i32 786443, metadata !1, metadata !773, i32 238, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!779 = metadata !{i32 239, i32 0, metadata !777, null}
!780 = metadata !{i32 240, i32 0, metadata !776, null}
!781 = metadata !{i32 241, i32 0, metadata !776, null}
!782 = metadata !{i32 242, i32 0, metadata !776, null}
!783 = metadata !{i32 243, i32 0, metadata !776, null}
!784 = metadata !{i32 244, i32 0, metadata !776, null}
!785 = metadata !{i32 245, i32 0, metadata !776, null}
!786 = metadata !{i32 246, i32 0, metadata !776, null}
!787 = metadata !{i32 247, i32 0, metadata !776, null}
!788 = metadata !{i32 248, i32 0, metadata !776, null}
!789 = metadata !{i32 249, i32 0, metadata !776, null}
!790 = metadata !{i32 250, i32 0, metadata !776, null}
!791 = metadata !{i32 252, i32 0, metadata !776, null}
!792 = metadata !{i32 253, i32 0, metadata !776, null}
!793 = metadata !{i32 254, i32 0, metadata !776, null}
!794 = metadata !{i32 255, i32 0, metadata !776, null}
!795 = metadata !{i32 256, i32 0, metadata !776, null}
!796 = metadata !{i32 257, i32 0, metadata !776, null}
!797 = metadata !{i32 258, i32 0, metadata !776, null}
!798 = metadata !{i32 259, i32 0, metadata !776, null}
!799 = metadata !{i32 260, i32 0, metadata !776, null}
!800 = metadata !{i32 261, i32 0, metadata !776, null}
!801 = metadata !{i32 262, i32 0, metadata !776, null}
!802 = metadata !{i32 263, i32 0, metadata !776, null}
!803 = metadata !{i32 264, i32 0, metadata !776, null}
!804 = metadata !{i32 265, i32 0, metadata !776, null}
!805 = metadata !{i32 266, i32 0, metadata !776, null}
!806 = metadata !{i32 267, i32 0, metadata !776, null}
!807 = metadata !{i32 268, i32 0, metadata !776, null}
!808 = metadata !{i32 269, i32 0, metadata !776, null}
!809 = metadata !{i32 270, i32 0, metadata !776, null}
!810 = metadata !{i32 271, i32 0, metadata !776, null}
!811 = metadata !{i32 272, i32 0, metadata !776, null}
!812 = metadata !{i32 273, i32 0, metadata !776, null}
!813 = metadata !{i32 274, i32 0, metadata !776, null}
!814 = metadata !{i32 275, i32 0, metadata !776, null}
!815 = metadata !{i32 276, i32 0, metadata !776, null}
!816 = metadata !{i32 277, i32 0, metadata !776, null}
!817 = metadata !{i32 278, i32 0, metadata !776, null}
!818 = metadata !{i32 279, i32 0, metadata !776, null}
!819 = metadata !{i32 281, i32 0, metadata !778, null}
!820 = metadata !{i32 282, i32 0, metadata !778, null}
!821 = metadata !{i32 283, i32 0, metadata !778, null}
!822 = metadata !{i32 284, i32 0, metadata !778, null}
!823 = metadata !{i32 285, i32 0, metadata !778, null}
!824 = metadata !{i32 286, i32 0, metadata !778, null}
!825 = metadata !{i32 287, i32 0, metadata !778, null}
!826 = metadata !{i32 288, i32 0, metadata !778, null}
!827 = metadata !{i32 289, i32 0, metadata !778, null}
!828 = metadata !{i32 290, i32 0, metadata !778, null}
!829 = metadata !{i32 295, i32 0, metadata !830, null}
!830 = metadata !{i32 786443, metadata !1, metadata !831, i32 294, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!831 = metadata !{i32 786443, metadata !1, metadata !832, i32 294, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!832 = metadata !{i32 786443, metadata !1, metadata !770, i32 293, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!833 = metadata !{i32 296, i32 0, metadata !830, null}
!834 = metadata !{i32 294, i32 0, metadata !831, null}
!835 = metadata !{i32 297, i32 0, metadata !830, null}
!836 = metadata !{i32 298, i32 0, metadata !830, null}
!837 = metadata !{i32 299, i32 0, metadata !830, null}
!838 = metadata !{i32 300, i32 0, metadata !830, null}
!839 = metadata !{i32 301, i32 0, metadata !830, null}
!840 = metadata !{i32 302, i32 0, metadata !830, null}
!841 = metadata !{i32 303, i32 0, metadata !830, null}
!842 = metadata !{i32 304, i32 0, metadata !830, null}
!843 = metadata !{i32 305, i32 0, metadata !830, null}
!844 = metadata !{i32 306, i32 0, metadata !830, null}
!845 = metadata !{i32 307, i32 0, metadata !830, null}
!846 = metadata !{i32 308, i32 0, metadata !830, null}
!847 = metadata !{i32 309, i32 0, metadata !830, null}
!848 = metadata !{i32 310, i32 0, metadata !830, null}
!849 = metadata !{i32 311, i32 0, metadata !830, null}
!850 = metadata !{i32 312, i32 0, metadata !830, null}
!851 = metadata !{i32 313, i32 0, metadata !830, null}
!852 = metadata !{i32 314, i32 0, metadata !830, null}
!853 = metadata !{i32 318, i32 0, metadata !197, null}
!854 = metadata !{i32 430, i32 0, metadata !163, null}
!855 = metadata !{i32 435, i32 0, metadata !163, null}
!856 = metadata !{i32 436, i32 0, metadata !304, null}
!857 = metadata !{i32 437, i32 0, metadata !303, null}
!858 = metadata !{i32 438, i32 0, metadata !303, null}
!859 = metadata !{i32 439, i32 0, metadata !303, null}
!860 = metadata !{i32 440, i32 0, metadata !308, null}
!861 = metadata !{i32 441, i32 0, metadata !308, null}
!862 = metadata !{i32 444, i32 0, metadata !314, null}
!863 = metadata !{i32 445, i32 0, metadata !312, null}
!864 = metadata !{i32 467, i32 0, metadata !865, null}
!865 = metadata !{i32 786443, metadata !1, metadata !866, i32 467, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!866 = metadata !{i32 786443, metadata !1, metadata !314, i32 466, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!867 = metadata !{i32 446, i32 0, metadata !316, null}
!868 = metadata !{i32 447, i32 0, metadata !316, null}
!869 = metadata !{i32 448, i32 0, metadata !316, null}
!870 = metadata !{i32 449, i32 0, metadata !316, null}
!871 = metadata !{i32 450, i32 0, metadata !316, null}
!872 = metadata !{i32 451, i32 0, metadata !316, null}
!873 = metadata !{i32 452, i32 0, metadata !316, null}
!874 = metadata !{i32 453, i32 0, metadata !316, null}
!875 = metadata !{i32 454, i32 0, metadata !316, null}
!876 = metadata !{i32 455, i32 0, metadata !316, null}
!877 = metadata !{i32 456, i32 0, metadata !316, null}
!878 = metadata !{i32 457, i32 0, metadata !316, null}
!879 = metadata !{i32 459, i32 0, metadata !316, null}
!880 = metadata !{i32 461, i32 0, metadata !316, null}
!881 = metadata !{i32 462, i32 0, metadata !316, null}
!882 = metadata !{i32 463, i32 0, metadata !316, null}
!883 = metadata !{i32 464, i32 0, metadata !316, null}
!884 = metadata !{i32 468, i32 0, metadata !885, null}
!885 = metadata !{i32 786443, metadata !1, metadata !865, i32 467, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!886 = metadata !{i32 469, i32 0, metadata !885, null}
!887 = metadata !{i32 470, i32 0, metadata !885, null}
!888 = metadata !{i32 471, i32 0, metadata !885, null}
!889 = metadata !{i32 472, i32 0, metadata !885, null}
!890 = metadata !{i32 473, i32 0, metadata !885, null}
!891 = metadata !{i32 477, i32 0, metadata !163, null}
!892 = metadata !{i32 530, i32 0, metadata !141, null}
!893 = metadata !{i32 536, i32 0, metadata !141, null}
!894 = metadata !{i32 537, i32 0, metadata !141, null}
!895 = metadata !{i32 538, i32 0, metadata !141, null}
!896 = metadata !{i32 539, i32 0, metadata !141, null}
!897 = metadata !{i32 540, i32 0, metadata !141, null}
!898 = metadata !{i32 541, i32 0, metadata !141, null}
!899 = metadata !{i32 542, i32 0, metadata !141, null}
!900 = metadata !{i32 543, i32 0, metadata !141, null}
!901 = metadata !{i32 544, i32 0, metadata !141, null}
!902 = metadata !{i32 546, i32 0, metadata !141, null}
!903 = metadata !{i32 548, i32 0, metadata !141, null}
!904 = metadata !{i32 549, i32 0, metadata !141, null}
!905 = metadata !{i32 550, i32 0, metadata !141, null}
!906 = metadata !{i32 551, i32 0, metadata !141, null}
!907 = metadata !{i32 552, i32 0, metadata !141, null}
!908 = metadata !{i32 553, i32 0, metadata !141, null}
!909 = metadata !{i32 554, i32 0, metadata !141, null}
!910 = metadata !{i32 555, i32 0, metadata !141, null}
!911 = metadata !{i32 556, i32 0, metadata !141, null}
!912 = metadata !{i32 557, i32 0, metadata !141, null}
!913 = metadata !{i32 558, i32 0, metadata !141, null}
!914 = metadata !{i32 559, i32 0, metadata !141, null}
!915 = metadata !{i32 560, i32 0, metadata !141, null}
!916 = metadata !{i32 561, i32 0, metadata !141, null}
!917 = metadata !{i32 563, i32 0, metadata !141, null}
!918 = metadata !{i32 565, i32 0, metadata !141, null}
!919 = metadata !{i32 566, i32 0, metadata !141, null}
!920 = metadata !{i32 567, i32 0, metadata !141, null}
!921 = metadata !{i32 568, i32 0, metadata !141, null}
!922 = metadata !{i32 569, i32 0, metadata !141, null}
!923 = metadata !{i32 570, i32 0, metadata !141, null}
!924 = metadata !{i32 571, i32 0, metadata !141, null}
!925 = metadata !{i32 572, i32 0, metadata !141, null}
!926 = metadata !{i32 573, i32 0, metadata !141, null}
!927 = metadata !{i32 16}
!928 = metadata !{i32 574, i32 0, metadata !929, null}
!929 = metadata !{i32 786443, metadata !1, metadata !141, i32 574, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!930 = metadata !{i32 576, i32 0, metadata !931, null}
!931 = metadata !{i32 786443, metadata !1, metadata !929, i32 574, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!932 = metadata !{i32 577, i32 0, metadata !931, null}
!933 = metadata !{i32 578, i32 0, metadata !931, null}
!934 = metadata !{i32 579, i32 0, metadata !931, null}
!935 = metadata !{i32 580, i32 0, metadata !931, null}
!936 = metadata !{i32 581, i32 0, metadata !931, null}
!937 = metadata !{i32 582, i32 0, metadata !931, null}
!938 = metadata !{i32 583, i32 0, metadata !931, null}
!939 = metadata !{i32 584, i32 0, metadata !931, null}
!940 = metadata !{i32 585, i32 0, metadata !931, null}
!941 = metadata !{i32 586, i32 0, metadata !931, null}
!942 = metadata !{i32 587, i32 0, metadata !931, null}
!943 = metadata !{i32 588, i32 0, metadata !931, null}
!944 = metadata !{i32 589, i32 0, metadata !931, null}
!945 = metadata !{i32 590, i32 0, metadata !931, null}
!946 = metadata !{i32 591, i32 0, metadata !931, null}
!947 = metadata !{i32 593, i32 0, metadata !931, null}
!948 = metadata !{i32 594, i32 0, metadata !931, null}
!949 = metadata !{i32 595, i32 0, metadata !931, null}
!950 = metadata !{i32 596, i32 0, metadata !931, null}
!951 = metadata !{i32 597, i32 0, metadata !931, null}
!952 = metadata !{i32 598, i32 0, metadata !931, null}
!953 = metadata !{i32 599, i32 0, metadata !931, null}
!954 = metadata !{i32 600, i32 0, metadata !931, null}
!955 = metadata !{i32 601, i32 0, metadata !931, null}
!956 = metadata !{i32 602, i32 0, metadata !931, null}
!957 = metadata !{i32 603, i32 0, metadata !931, null}
!958 = metadata !{i32 604, i32 0, metadata !931, null}
!959 = metadata !{i32 605, i32 0, metadata !931, null}
!960 = metadata !{i32 606, i32 0, metadata !931, null}
!961 = metadata !{i32 607, i32 0, metadata !931, null}
!962 = metadata !{i32 608, i32 0, metadata !931, null}
!963 = metadata !{i32 609, i32 0, metadata !931, null}
!964 = metadata !{i32 610, i32 0, metadata !931, null}
!965 = metadata !{i32 611, i32 0, metadata !931, null}
!966 = metadata !{i32 612, i32 0, metadata !931, null}
!967 = metadata !{i32 613, i32 0, metadata !931, null}
!968 = metadata !{i32 614, i32 0, metadata !931, null}
!969 = metadata !{i32 615, i32 0, metadata !931, null}
!970 = metadata !{i32 616, i32 0, metadata !931, null}
!971 = metadata !{i32 617, i32 0, metadata !931, null}
!972 = metadata !{i32 619, i32 0, metadata !931, null}
!973 = metadata !{i32 620, i32 0, metadata !931, null}
!974 = metadata !{i32 621, i32 0, metadata !931, null}
!975 = metadata !{i32 622, i32 0, metadata !931, null}
!976 = metadata !{i32 623, i32 0, metadata !931, null}
!977 = metadata !{i32 624, i32 0, metadata !931, null}
!978 = metadata !{i32 625, i32 0, metadata !931, null}
!979 = metadata !{i32 626, i32 0, metadata !931, null}
!980 = metadata !{i32 627, i32 0, metadata !931, null}
!981 = metadata !{i32 628, i32 0, metadata !931, null}
!982 = metadata !{i32 629, i32 0, metadata !931, null}
!983 = metadata !{i32 630, i32 0, metadata !931, null}
!984 = metadata !{i32 632, i32 0, metadata !141, null}
!985 = metadata !{i32 635, i32 0, metadata !110, null}
!986 = metadata !{i32 641, i32 0, metadata !110, null}
!987 = metadata !{i32 642, i32 0, metadata !988, null}
!988 = metadata !{i32 786443, metadata !1, metadata !110, i32 642, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!989 = metadata !{i32 643, i32 0, metadata !990, null}
!990 = metadata !{i32 786443, metadata !1, metadata !988, i32 642, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!991 = metadata !{i32 644, i32 0, metadata !990, null}
!992 = metadata !{i32 645, i32 0, metadata !990, null}
!993 = metadata !{i32 646, i32 0, metadata !990, null}
!994 = metadata !{i32 647, i32 0, metadata !990, null}
!995 = metadata !{i32 648, i32 0, metadata !990, null}
!996 = metadata !{i32 649, i32 0, metadata !990, null}
!997 = metadata !{i32 650, i32 0, metadata !990, null}
!998 = metadata !{i32 651, i32 0, metadata !990, null}
!999 = metadata !{i32 652, i32 0, metadata !990, null}
!1000 = metadata !{i32 653, i32 0, metadata !990, null}
!1001 = metadata !{i32 654, i32 0, metadata !990, null}
!1002 = metadata !{i32 656, i32 0, metadata !990, null}
!1003 = metadata !{i32 658, i32 0, metadata !990, null}
!1004 = metadata !{i32 659, i32 0, metadata !990, null}
!1005 = metadata !{i32 660, i32 0, metadata !990, null}
!1006 = metadata !{i32 661, i32 0, metadata !990, null}
!1007 = metadata !{i32 663, i32 0, metadata !110, null}
!1008 = metadata !{i32 664, i32 0, metadata !1009, null}
!1009 = metadata !{i32 786443, metadata !1, metadata !110, i32 664, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1010 = metadata !{i32 682, i32 0, metadata !1011, null}
!1011 = metadata !{i32 786443, metadata !1, metadata !1009, i32 664, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1012 = metadata !{i32 665, i32 0, metadata !1011, null}
!1013 = metadata !{i32 666, i32 0, metadata !1011, null}
!1014 = metadata !{i32 667, i32 0, metadata !1011, null}
!1015 = metadata !{i32 668, i32 0, metadata !1011, null}
!1016 = metadata !{i32 669, i32 0, metadata !1011, null}
!1017 = metadata !{i32 670, i32 0, metadata !1011, null}
!1018 = metadata !{i32 671, i32 0, metadata !1011, null}
!1019 = metadata !{i32 672, i32 0, metadata !1011, null}
!1020 = metadata !{i32 673, i32 0, metadata !1011, null}
!1021 = metadata !{i32 674, i32 0, metadata !1011, null}
!1022 = metadata !{i32 675, i32 0, metadata !1011, null}
!1023 = metadata !{i32 676, i32 0, metadata !1011, null}
!1024 = metadata !{i32 677, i32 0, metadata !1011, null}
!1025 = metadata !{i32 678, i32 0, metadata !1011, null}
!1026 = metadata !{i32 679, i32 0, metadata !1011, null}
!1027 = metadata !{i32 680, i32 0, metadata !1011, null}
!1028 = metadata !{i32 681, i32 0, metadata !1011, null}
!1029 = metadata !{i32 683, i32 0, metadata !1011, null}
!1030 = metadata !{i32 684, i32 0, metadata !1011, null}
!1031 = metadata !{i32 685, i32 0, metadata !1011, null}
!1032 = metadata !{i32 686, i32 0, metadata !1011, null}
!1033 = metadata !{i32 687, i32 0, metadata !1011, null}
!1034 = metadata !{i32 689, i32 0, metadata !110, null}
!1035 = metadata !{i32 690, i32 0, metadata !110, null}
!1036 = metadata !{i32 691, i32 0, metadata !1037, null}
!1037 = metadata !{i32 786443, metadata !1, metadata !110, i32 691, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1038 = metadata !{i32 692, i32 0, metadata !1039, null}
!1039 = metadata !{i32 786443, metadata !1, metadata !1037, i32 691, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1040 = metadata !{i32 693, i32 0, metadata !1039, null}
!1041 = metadata !{i32 694, i32 0, metadata !1039, null}
!1042 = metadata !{i32 695, i32 0, metadata !1039, null}
!1043 = metadata !{i32 696, i32 0, metadata !1039, null}
!1044 = metadata !{i32 697, i32 0, metadata !1039, null}
!1045 = metadata !{i32 698, i32 0, metadata !1039, null}
!1046 = metadata !{i32 699, i32 0, metadata !1039, null}
!1047 = metadata !{i32 700, i32 0, metadata !1048, null}
!1048 = metadata !{i32 786443, metadata !1, metadata !1039, i32 700, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1049 = metadata !{i32 701, i32 0, metadata !1050, null}
!1050 = metadata !{i32 786443, metadata !1, metadata !1048, i32 700, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1051 = metadata !{i32 702, i32 0, metadata !1050, null}
!1052 = metadata !{i32 703, i32 0, metadata !1050, null}
!1053 = metadata !{i32 704, i32 0, metadata !1050, null}
!1054 = metadata !{i32 705, i32 0, metadata !1050, null}
!1055 = metadata !{i32 706, i32 0, metadata !1050, null}
!1056 = metadata !{i32 707, i32 0, metadata !1050, null}
!1057 = metadata !{i32 708, i32 0, metadata !1050, null}
!1058 = metadata !{i32 709, i32 0, metadata !1050, null}
!1059 = metadata !{i32 710, i32 0, metadata !1050, null}
!1060 = metadata !{i32 711, i32 0, metadata !1050, null}
!1061 = metadata !{i32 712, i32 0, metadata !1050, null}
!1062 = metadata !{i32 713, i32 0, metadata !1050, null}
!1063 = metadata !{i32 714, i32 0, metadata !1050, null}
!1064 = metadata !{i32 715, i32 0, metadata !1050, null}
!1065 = metadata !{i32 716, i32 0, metadata !1050, null}
!1066 = metadata !{i32 717, i32 0, metadata !1050, null}
!1067 = metadata !{i32 718, i32 0, metadata !1050, null}
!1068 = metadata !{i32 719, i32 0, metadata !1050, null}
!1069 = metadata !{i32 720, i32 0, metadata !1050, null}
!1070 = metadata !{i32 721, i32 0, metadata !1050, null}
!1071 = metadata !{i32 722, i32 0, metadata !1050, null}
!1072 = metadata !{i32 723, i32 0, metadata !1050, null}
!1073 = metadata !{i32 724, i32 0, metadata !1050, null}
!1074 = metadata !{i32 725, i32 0, metadata !1050, null}
!1075 = metadata !{i32 727, i32 0, metadata !1039, null}
!1076 = metadata !{i32 728, i32 0, metadata !1039, null}
!1077 = metadata !{i32 729, i32 0, metadata !1039, null}
!1078 = metadata !{i32 730, i32 0, metadata !1039, null}
!1079 = metadata !{i32 731, i32 0, metadata !1080, null}
!1080 = metadata !{i32 786443, metadata !1, metadata !1039, i32 731, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1081 = metadata !{i32 747, i32 0, metadata !1082, null}
!1082 = metadata !{i32 786443, metadata !1, metadata !1080, i32 731, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oourafft.c]
!1083 = metadata !{i32 732, i32 0, metadata !1082, null}
!1084 = metadata !{i32 733, i32 0, metadata !1082, null}
!1085 = metadata !{i32 734, i32 0, metadata !1082, null}
!1086 = metadata !{i32 735, i32 0, metadata !1082, null}
!1087 = metadata !{i32 736, i32 0, metadata !1082, null}
!1088 = metadata !{i32 737, i32 0, metadata !1082, null}
!1089 = metadata !{i32 738, i32 0, metadata !1082, null}
!1090 = metadata !{i32 739, i32 0, metadata !1082, null}
!1091 = metadata !{i32 740, i32 0, metadata !1082, null}
!1092 = metadata !{i32 741, i32 0, metadata !1082, null}
!1093 = metadata !{i32 742, i32 0, metadata !1082, null}
!1094 = metadata !{i32 743, i32 0, metadata !1082, null}
!1095 = metadata !{i32 745, i32 0, metadata !1082, null}
!1096 = metadata !{i32 746, i32 0, metadata !1082, null}
!1097 = metadata !{i32 748, i32 0, metadata !1082, null}
!1098 = metadata !{i32 749, i32 0, metadata !1082, null}
!1099 = metadata !{i32 750, i32 0, metadata !1082, null}
!1100 = metadata !{i32 751, i32 0, metadata !1082, null}
!1101 = metadata !{i32 752, i32 0, metadata !1082, null}
!1102 = metadata !{i32 753, i32 0, metadata !1082, null}
!1103 = metadata !{i32 754, i32 0, metadata !1082, null}
!1104 = metadata !{i32 755, i32 0, metadata !1082, null}
!1105 = metadata !{i32 756, i32 0, metadata !1082, null}
!1106 = metadata !{i32 759, i32 0, metadata !110, null}
