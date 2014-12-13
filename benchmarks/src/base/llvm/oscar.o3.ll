; ModuleID = 'oscar.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.complex = type { float, float }
%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }

@seed = common global i64 0, align 8
@.str1 = private unnamed_addr constant [15 x i8] c"  %15.3f%15.3f\00", align 1
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@value = common global float 0.000000e+00, align 4
@fixed = common global float 0.000000e+00, align 4
@floated = common global float 0.000000e+00, align 4
@permarray = common global [11 x i32] zeroinitializer, align 16
@pctr = common global i32 0, align 4
@tree = common global %struct.node* null, align 8
@stack = common global [4 x i32] zeroinitializer, align 16
@cellspace = common global [19 x %struct.element] zeroinitializer, align 16
@freelist = common global i32 0, align 4
@movesdone = common global i32 0, align 4
@ima = common global [41 x [41 x i32]] zeroinitializer, align 16
@imb = common global [41 x [41 x i32]] zeroinitializer, align 16
@imr = common global [41 x [41 x i32]] zeroinitializer, align 16
@rma = common global [41 x [41 x float]] zeroinitializer, align 16
@rmb = common global [41 x [41 x float]] zeroinitializer, align 16
@rmr = common global [41 x [41 x float]] zeroinitializer, align 16
@piececount = common global [4 x i32] zeroinitializer, align 16
@class = common global [13 x i32] zeroinitializer, align 16
@piecemax = common global [13 x i32] zeroinitializer, align 16
@puzzl = common global [512 x i32] zeroinitializer, align 16
@p = common global [13 x [512 x i32]] zeroinitializer, align 16
@n = common global i32 0, align 4
@kount = common global i32 0, align 4
@sortlist = common global [5001 x i32] zeroinitializer, align 16
@biggest = common global i32 0, align 4
@littlest = common global i32 0, align 4
@top = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
  store i64 74755, i64* @seed, align 8, !dbg !170, !tbaa !171
  ret void, !dbg !175
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
  %1 = load i64* @seed, align 8, !dbg !176, !tbaa !171
  %2 = mul nsw i64 %1, 1309, !dbg !176
  %3 = add nsw i64 %2, 13849, !dbg !176
  %4 = and i64 %3, 65535, !dbg !176
  store i64 %4, i64* @seed, align 8, !dbg !176, !tbaa !171
  %5 = trunc i64 %4 to i32, !dbg !177
  ret i32 %5, !dbg !177
}

; Function Attrs: nounwind readnone uwtable
define float @Cos(float %x) #1 {
  tail call void @llvm.dbg.value(metadata !{float %x}, i64 0, metadata !17), !dbg !178
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !20), !dbg !180
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !19), !dbg !182
  tail call void @llvm.dbg.value(metadata !{float %x}, i64 0, metadata !21), !dbg !183
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !18), !dbg !185
  br label %1, !dbg !185

; <label>:1                                       ; preds = %15, %0
  %power.04 = phi float [ %x, %0 ], [ %3, %15 ]
  %result.03 = phi float [ 1.000000e+00, %0 ], [ %result.1, %15 ]
  %factor.02 = phi i32 [ 1, %0 ], [ %2, %15 ]
  %i.01 = phi i32 [ 2, %0 ], [ %16, %15 ]
  %2 = mul nsw i32 %factor.02, %i.01, !dbg !187
  tail call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !19), !dbg !187
  %3 = fmul float %power.04, %x, !dbg !189
  tail call void @llvm.dbg.value(metadata !{float %3}, i64 0, metadata !21), !dbg !189
  %4 = and i32 %i.01, 1, !dbg !190
  %5 = icmp eq i32 %4, 0, !dbg !190
  br i1 %5, label %6, label %15, !dbg !190

; <label>:6                                       ; preds = %1
  %7 = and i32 %i.01, 3, !dbg !192
  %8 = icmp eq i32 %7, 0, !dbg !192
  %9 = sitofp i32 %2 to float, !dbg !195
  %10 = fdiv float %3, %9, !dbg !195
  br i1 %8, label %11, label %13, !dbg !192

; <label>:11                                      ; preds = %6
  %12 = fadd float %result.03, %10, !dbg !195
  tail call void @llvm.dbg.value(metadata !{float %12}, i64 0, metadata !20), !dbg !195
  br label %15, !dbg !195

; <label>:13                                      ; preds = %6
  %14 = fsub float %result.03, %10, !dbg !196
  tail call void @llvm.dbg.value(metadata !{float %14}, i64 0, metadata !20), !dbg !196
  br label %15

; <label>:15                                      ; preds = %1, %13, %11
  %result.1 = phi float [ %12, %11 ], [ %14, %13 ], [ %result.03, %1 ]
  %16 = add nsw i32 %i.01, 1, !dbg !185
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !18), !dbg !185
  %exitcond = icmp eq i32 %16, 11, !dbg !185
  br i1 %exitcond, label %17, label %1, !dbg !185

; <label>:17                                      ; preds = %15
  ret float %result.1, !dbg !197
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #2

; Function Attrs: nounwind readnone uwtable
define i32 @Min0(i32 %arg1, i32 %arg2) #1 {
  tail call void @llvm.dbg.value(metadata !{i32 %arg1}, i64 0, metadata !26), !dbg !198
  tail call void @llvm.dbg.value(metadata !{i32 %arg2}, i64 0, metadata !27), !dbg !198
  %1 = icmp slt i32 %arg1, %arg2, !dbg !199
  %arg1.arg2 = select i1 %1, i32 %arg1, i32 %arg2, !dbg !201
  ret i32 %arg1.arg2, !dbg !202
}

; Function Attrs: nounwind uwtable
define void @Printcomplex(%struct.complex* nocapture readonly %zarray, i32 %start, i32 %finish, i32 %increment) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.complex* %zarray}, i64 0, metadata !37), !dbg !203
  tail call void @llvm.dbg.value(metadata !{i32 %start}, i64 0, metadata !38), !dbg !203
  tail call void @llvm.dbg.value(metadata !{i32 %finish}, i64 0, metadata !39), !dbg !203
  tail call void @llvm.dbg.value(metadata !{i32 %increment}, i64 0, metadata !40), !dbg !203
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !204
  tail call void @llvm.dbg.value(metadata !{i32 %start}, i64 0, metadata !41), !dbg !205
  %1 = sext i32 %start to i64
  %2 = shl i32 %increment, 1, !dbg !206
  %3 = sext i32 %2 to i64
  %4 = sext i32 %increment to i64, !dbg !206
  br label %5, !dbg !206

; <label>:5                                       ; preds = %5, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %5 ], [ %1, %0 ]
  %6 = getelementptr inbounds %struct.complex* %zarray, i64 %indvars.iv, i32 0, !dbg !207
  %7 = load float* %6, align 4, !dbg !207, !tbaa !209
  %8 = fpext float %7 to double, !dbg !207
  %9 = getelementptr inbounds %struct.complex* %zarray, i64 %indvars.iv, i32 1, !dbg !207
  %10 = load float* %9, align 4, !dbg !207, !tbaa !212
  %11 = fpext float %10 to double, !dbg !207
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), double %8, double %11) #4, !dbg !207
  %13 = add nsw i64 %indvars.iv, %4, !dbg !213
  %14 = getelementptr inbounds %struct.complex* %zarray, i64 %13, i32 0, !dbg !214
  %15 = load float* %14, align 4, !dbg !214, !tbaa !209
  %16 = fpext float %15 to double, !dbg !214
  %17 = getelementptr inbounds %struct.complex* %zarray, i64 %13, i32 1, !dbg !214
  %18 = load float* %17, align 4, !dbg !214, !tbaa !212
  %19 = fpext float %18 to double, !dbg !214
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), double %16, double %19) #4, !dbg !214
  %putchar1 = tail call i32 @putchar(i32 10) #4, !dbg !215
  %indvars.iv.next = add nsw i64 %indvars.iv, %3, !dbg !216
  %21 = trunc i64 %indvars.iv.next to i32, !dbg !216
  %22 = icmp sgt i32 %21, %finish, !dbg !216
  br i1 %22, label %23, label %5, !dbg !216

; <label>:23                                      ; preds = %5
  ret void, !dbg !217
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind uwtable
define void @Uniform11(i32* nocapture %iy, float* nocapture %yfl) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %iy}, i64 0, metadata !48), !dbg !218
  tail call void @llvm.dbg.value(metadata !{float* %yfl}, i64 0, metadata !49), !dbg !218
  %1 = load i32* %iy, align 4, !dbg !219, !tbaa !220
  %2 = mul nsw i32 %1, 4855, !dbg !219
  %3 = add nsw i32 %2, 1731, !dbg !219
  %4 = and i32 %3, 8191, !dbg !219
  store i32 %4, i32* %iy, align 4, !dbg !219, !tbaa !220
  %5 = sitofp i32 %4 to float, !dbg !222
  %6 = fmul float %5, 0x3F20000000000000, !dbg !222
  store float %6, float* %yfl, align 4, !dbg !222, !tbaa !223
  ret void, !dbg !224
}

; Function Attrs: nounwind uwtable
define void @Exptab(i32 %n, %struct.complex* nocapture %e) #0 {
  %h = alloca [26 x float], align 16
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !54), !dbg !225
  tail call void @llvm.dbg.value(metadata !{%struct.complex* %e}, i64 0, metadata !55), !dbg !225
  %1 = bitcast [26 x float]* %h to i8*, !dbg !226
  call void @llvm.lifetime.start(i64 104, i8* %1) #4, !dbg !226
  tail call void @llvm.dbg.declare(metadata !{[26 x float]* %h}, metadata !58), !dbg !226
  tail call void @llvm.dbg.value(metadata !227, i64 0, metadata !56), !dbg !228
  tail call void @llvm.dbg.value(metadata !229, i64 0, metadata !57), !dbg !230
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !62), !dbg !231
  br label %2, !dbg !231

; <label>:2                                       ; preds = %Cos.exit, %0
  %indvars.iv3 = phi i64 [ 1, %0 ], [ %indvars.iv.next4, %Cos.exit ]
  %divisor.02 = phi float [ 4.000000e+00, %0 ], [ %23, %Cos.exit ]
  %3 = fdiv float 0x400921FB60000000, %divisor.02, !dbg !233
  tail call void @llvm.dbg.value(metadata !{float %3}, i64 0, metadata !235), !dbg !236
  tail call void @llvm.dbg.value(metadata !179, i64 0, metadata !237), !dbg !238
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !239), !dbg !240
  tail call void @llvm.dbg.value(metadata !{float %3}, i64 0, metadata !241), !dbg !242
  tail call void @llvm.dbg.value(metadata !184, i64 0, metadata !243), !dbg !244
  br label %4, !dbg !244

; <label>:4                                       ; preds = %18, %2
  %power.04.i = phi float [ %3, %2 ], [ %6, %18 ]
  %result.03.i = phi float [ 1.000000e+00, %2 ], [ %result.1.i, %18 ]
  %factor.02.i = phi i32 [ 1, %2 ], [ %5, %18 ]
  %i.01.i = phi i32 [ 2, %2 ], [ %19, %18 ]
  %5 = mul nsw i32 %i.01.i, %factor.02.i, !dbg !245
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !239), !dbg !245
  %6 = fmul float %3, %power.04.i, !dbg !246
  tail call void @llvm.dbg.value(metadata !{float %6}, i64 0, metadata !241), !dbg !246
  %7 = and i32 %i.01.i, 1, !dbg !247
  %8 = icmp eq i32 %7, 0, !dbg !247
  br i1 %8, label %9, label %18, !dbg !247

; <label>:9                                       ; preds = %4
  %10 = and i32 %i.01.i, 3, !dbg !248
  %11 = icmp eq i32 %10, 0, !dbg !248
  %12 = sitofp i32 %5 to float, !dbg !249
  %13 = fdiv float %6, %12, !dbg !249
  br i1 %11, label %14, label %16, !dbg !248

; <label>:14                                      ; preds = %9
  %15 = fadd float %result.03.i, %13, !dbg !249
  tail call void @llvm.dbg.value(metadata !{float %15}, i64 0, metadata !237), !dbg !249
  br label %18, !dbg !249

; <label>:16                                      ; preds = %9
  %17 = fsub float %result.03.i, %13, !dbg !250
  tail call void @llvm.dbg.value(metadata !{float %17}, i64 0, metadata !237), !dbg !250
  br label %18

; <label>:18                                      ; preds = %16, %14, %4
  %result.1.i = phi float [ %15, %14 ], [ %17, %16 ], [ %result.03.i, %4 ]
  %19 = add nsw i32 %i.01.i, 1, !dbg !244
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !243), !dbg !244
  %exitcond.i = icmp eq i32 %19, 11, !dbg !244
  br i1 %exitcond.i, label %Cos.exit, label %4, !dbg !244

Cos.exit:                                         ; preds = %18
  %20 = fmul float %result.1.i, 2.000000e+00, !dbg !233
  %21 = fdiv float 1.000000e+00, %20, !dbg !233
  %22 = getelementptr inbounds [26 x float]* %h, i64 0, i64 %indvars.iv3, !dbg !233
  store float %21, float* %22, align 4, !dbg !233, !tbaa !223
  %23 = fadd float %divisor.02, %divisor.02, !dbg !251
  tail call void @llvm.dbg.value(metadata !{float %23}, i64 0, metadata !57), !dbg !251
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !231
  %exitcond = icmp eq i64 %indvars.iv.next4, 26, !dbg !231
  br i1 %exitcond, label %24, label %2, !dbg !231

; <label>:24                                      ; preds = %Cos.exit
  %25 = sdiv i32 %n, 2, !dbg !252
  tail call void @llvm.dbg.value(metadata !{i32 %25}, i64 0, metadata !66), !dbg !252
  %26 = sdiv i32 %n, 4, !dbg !253
  tail call void @llvm.dbg.value(metadata !{i32 %26}, i64 0, metadata !65), !dbg !253
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !63), !dbg !254
  %27 = getelementptr inbounds %struct.complex* %e, i64 1, i32 0, !dbg !255
  store float 1.000000e+00, float* %27, align 4, !dbg !255, !tbaa !209
  %28 = getelementptr inbounds %struct.complex* %e, i64 1, i32 1, !dbg !256
  store float 0.000000e+00, float* %28, align 4, !dbg !256, !tbaa !212
  %29 = add nsw i32 %26, 1, !dbg !257
  %30 = sext i32 %29 to i64, !dbg !257
  %31 = getelementptr inbounds %struct.complex* %e, i64 %30, i32 0, !dbg !257
  store float 0.000000e+00, float* %31, align 4, !dbg !257, !tbaa !209
  %32 = getelementptr inbounds %struct.complex* %e, i64 %30, i32 1, !dbg !258
  store float 1.000000e+00, float* %32, align 4, !dbg !258, !tbaa !212
  %33 = add nsw i32 %25, 1, !dbg !259
  %34 = sext i32 %33 to i64, !dbg !259
  %35 = getelementptr inbounds %struct.complex* %e, i64 %34, i32 0, !dbg !259
  store float -1.000000e+00, float* %35, align 4, !dbg !259, !tbaa !209
  %36 = getelementptr inbounds %struct.complex* %e, i64 %34, i32 1, !dbg !260
  store float 0.000000e+00, float* %36, align 4, !dbg !260, !tbaa !212
  br label %37, !dbg !261

; <label>:37                                      ; preds = %69, %24
  %j.0 = phi i32 [ 1, %24 ], [ %arg1.arg2.i, %69 ]
  %l.0 = phi i32 [ %26, %24 ], [ %38, %69 ]
  %38 = sdiv i32 %l.0, 2, !dbg !262
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !62), !dbg !262
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !64), !dbg !264
  %39 = sext i32 %j.0 to i64, !dbg !265
  %40 = getelementptr inbounds [26 x float]* %h, i64 0, i64 %39, !dbg !265
  %41 = load float* %40, align 4, !dbg !265, !tbaa !223
  %42 = add i32 %38, 1, !dbg !265
  %43 = sub i32 1, %38, !dbg !265
  %44 = sext i32 %38 to i64
  %45 = sext i32 %l.0 to i64
  br label %46, !dbg !267

; <label>:46                                      ; preds = %46, %37
  %indvars.iv = phi i64 [ %indvars.iv.next, %46 ], [ %44, %37 ]
  %47 = trunc i64 %indvars.iv to i32, !dbg !265
  %48 = add i32 %42, %47, !dbg !265
  %49 = sext i32 %48 to i64, !dbg !265
  %50 = getelementptr inbounds %struct.complex* %e, i64 %49, i32 0, !dbg !265
  %51 = load float* %50, align 4, !dbg !265, !tbaa !209
  %52 = add i32 %43, %47, !dbg !265
  %53 = sext i32 %52 to i64, !dbg !265
  %54 = getelementptr inbounds %struct.complex* %e, i64 %53, i32 0, !dbg !265
  %55 = load float* %54, align 4, !dbg !265, !tbaa !209
  %56 = fadd float %51, %55, !dbg !265
  %57 = fmul float %41, %56, !dbg !265
  %58 = add nsw i64 %indvars.iv, 1, !dbg !265
  %59 = getelementptr inbounds %struct.complex* %e, i64 %58, i32 0, !dbg !265
  store float %57, float* %59, align 4, !dbg !265, !tbaa !209
  %60 = getelementptr inbounds %struct.complex* %e, i64 %49, i32 1, !dbg !268
  %61 = load float* %60, align 4, !dbg !268, !tbaa !212
  %62 = getelementptr inbounds %struct.complex* %e, i64 %53, i32 1, !dbg !268
  %63 = load float* %62, align 4, !dbg !268, !tbaa !212
  %64 = fadd float %61, %63, !dbg !268
  %65 = fmul float %41, %64, !dbg !268
  %66 = getelementptr inbounds %struct.complex* %e, i64 %58, i32 1, !dbg !268
  store float %65, float* %66, align 4, !dbg !268, !tbaa !212
  %indvars.iv.next = add nsw i64 %indvars.iv, %45, !dbg !269
  %67 = trunc i64 %indvars.iv.next to i32, !dbg !269
  %68 = icmp sgt i32 %67, %25, !dbg !269
  br i1 %68, label %69, label %46, !dbg !269

; <label>:69                                      ; preds = %46
  %70 = add nsw i32 %j.0, 1, !dbg !270
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !271), !dbg !272
  tail call void @llvm.dbg.value(metadata !273, i64 0, metadata !274), !dbg !272
  %71 = icmp slt i32 %70, 25, !dbg !275
  %arg1.arg2.i = select i1 %71, i32 %70, i32 25, !dbg !276
  tail call void @llvm.dbg.value(metadata !{i32 %arg1.arg2.i}, i64 0, metadata !63), !dbg !270
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !65), !dbg !277
  %72 = icmp sgt i32 %l.0, 3, !dbg !278
  br i1 %72, label %37, label %73, !dbg !278

; <label>:73                                      ; preds = %69
  call void @llvm.lifetime.end(i64 104, i8* %1) #4, !dbg !279
  ret void, !dbg !279
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

; Function Attrs: nounwind uwtable
define void @Fft(i32 %n, %struct.complex* nocapture %z, %struct.complex* nocapture %w, %struct.complex* nocapture readonly %e, float %sqrinv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %n}, i64 0, metadata !71), !dbg !280
  tail call void @llvm.dbg.value(metadata !{%struct.complex* %z}, i64 0, metadata !72), !dbg !280
  tail call void @llvm.dbg.value(metadata !{%struct.complex* %w}, i64 0, metadata !73), !dbg !280
  tail call void @llvm.dbg.value(metadata !{%struct.complex* %e}, i64 0, metadata !74), !dbg !280
  tail call void @llvm.dbg.value(metadata !{float %sqrinv}, i64 0, metadata !75), !dbg !281
  %1 = sdiv i32 %n, 2, !dbg !282
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !80), !dbg !282
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !79), !dbg !283
  %2 = sext i32 %1 to i64, !dbg !284
  br label %3, !dbg !284

; <label>:3                                       ; preds = %61, %0
  %l.0 = phi i32 [ 1, %0 ], [ %62, %61 ]
  tail call void @llvm.dbg.value(metadata !285, i64 0, metadata !78), !dbg !286
  tail call void @llvm.dbg.value(metadata !{i32 %l.0}, i64 0, metadata !77), !dbg !288
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !76), !dbg !289
  %4 = sext i32 %l.0 to i64
  br label %.outer, !dbg !290

.outer:                                           ; preds = %51, %3
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %51 ], [ %4, %3 ]
  %indvars.iv5 = phi i32 [ %indvars.iv.next6, %51 ], [ %l.0, %3 ]
  %k.0.ph = phi i32 [ %49, %51 ], [ 0, %3 ]
  %i.0.ph = phi i32 [ %52, %51 ], [ 1, %3 ]
  %5 = add nsw i32 %k.0.ph, 1, !dbg !291
  %6 = sext i32 %5 to i64, !dbg !291
  %7 = getelementptr inbounds %struct.complex* %e, i64 %6, i32 0, !dbg !291
  %8 = getelementptr inbounds %struct.complex* %e, i64 %6, i32 1, !dbg !291
  %9 = sext i32 %i.0.ph to i64
  %10 = sext i32 %k.0.ph to i64
  %11 = icmp sgt i32 %i.0.ph, %indvars.iv5
  %smax = select i1 %11, i32 %i.0.ph, i32 %indvars.iv5
  br label %12

; <label>:12                                      ; preds = %.outer, %12
  %indvars.iv3 = phi i64 [ %9, %.outer ], [ %indvars.iv.next4, %12 ]
  %13 = getelementptr inbounds %struct.complex* %z, i64 %indvars.iv3, i32 0, !dbg !294
  %14 = load float* %13, align 4, !dbg !294, !tbaa !209
  %15 = add nsw i64 %indvars.iv3, %2, !dbg !294
  %16 = getelementptr inbounds %struct.complex* %z, i64 %15, i32 0, !dbg !294
  %17 = load float* %16, align 4, !dbg !294, !tbaa !209
  %18 = fadd float %14, %17, !dbg !294
  %19 = add nsw i64 %indvars.iv3, %10, !dbg !294
  %20 = getelementptr inbounds %struct.complex* %w, i64 %19, i32 0, !dbg !294
  store float %18, float* %20, align 4, !dbg !294, !tbaa !209
  %21 = getelementptr inbounds %struct.complex* %z, i64 %indvars.iv3, i32 1, !dbg !295
  %22 = load float* %21, align 4, !dbg !295, !tbaa !212
  %23 = getelementptr inbounds %struct.complex* %z, i64 %15, i32 1, !dbg !295
  %24 = load float* %23, align 4, !dbg !295, !tbaa !212
  %25 = fadd float %22, %24, !dbg !295
  %26 = getelementptr inbounds %struct.complex* %w, i64 %19, i32 1, !dbg !295
  store float %25, float* %26, align 4, !dbg !295, !tbaa !212
  %27 = load float* %7, align 4, !dbg !291, !tbaa !209
  %28 = load float* %13, align 4, !dbg !291, !tbaa !209
  %29 = load float* %16, align 4, !dbg !291, !tbaa !209
  %30 = fsub float %28, %29, !dbg !291
  %31 = fmul float %27, %30, !dbg !291
  %32 = load float* %8, align 4, !dbg !291, !tbaa !212
  %33 = load float* %21, align 4, !dbg !291, !tbaa !212
  %34 = load float* %23, align 4, !dbg !291, !tbaa !212
  %35 = fsub float %33, %34, !dbg !291
  %36 = fmul float %32, %35, !dbg !291
  %37 = fsub float %31, %36, !dbg !291
  %38 = add nsw i64 %indvars.iv3, %indvars.iv7, !dbg !291
  %39 = getelementptr inbounds %struct.complex* %w, i64 %38, i32 0, !dbg !291
  store float %37, float* %39, align 4, !dbg !291, !tbaa !209
  %40 = load float* %7, align 4, !dbg !296, !tbaa !209
  %41 = fmul float %40, %35, !dbg !296
  %42 = load float* %13, align 4, !dbg !296, !tbaa !209
  %43 = load float* %16, align 4, !dbg !296, !tbaa !209
  %44 = fsub float %42, %43, !dbg !296
  %45 = fmul float %32, %44, !dbg !296
  %46 = fadd float %41, %45, !dbg !296
  %47 = getelementptr inbounds %struct.complex* %w, i64 %38, i32 1, !dbg !296
  store float %46, float* %47, align 4, !dbg !296, !tbaa !212
  %indvars.iv.next4 = add nsw i64 %indvars.iv3, 1, !dbg !297
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !76), !dbg !298
  %48 = trunc i64 %indvars.iv3 to i32, !dbg !297
  %49 = trunc i64 %indvars.iv7 to i32, !dbg !297
  %50 = icmp slt i32 %48, %49, !dbg !297
  br i1 %50, label %12, label %51, !dbg !297

; <label>:51                                      ; preds = %12
  %52 = add i32 %smax, 1
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv5}, i64 0, metadata !78), !dbg !299
  %indvars.iv.next6 = add nsw i32 %indvars.iv5, %l.0, !dbg !300
  tail call void @llvm.dbg.value(metadata !{i32 %indvars.iv.next6}, i64 0, metadata !77), !dbg !301
  %53 = icmp sgt i32 %indvars.iv.next6, %1, !dbg !300
  %indvars.iv.next8 = add nsw i64 %indvars.iv7, %4, !dbg !300
  br i1 %53, label %.preheader1, label %.outer, !dbg !300

.preheader1:                                      ; preds = %51, %.preheader1
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.preheader1 ], [ 1, %51 ]
  %54 = getelementptr inbounds %struct.complex* %z, i64 %indvars.iv9, !dbg !302
  %55 = getelementptr inbounds %struct.complex* %w, i64 %indvars.iv9, !dbg !302
  %56 = bitcast %struct.complex* %55 to i64*, !dbg !302
  %57 = bitcast %struct.complex* %54 to i64*, !dbg !302
  %58 = load i64* %56, align 4, !dbg !302
  store i64 %58, i64* %57, align 4, !dbg !302
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !304
  %59 = trunc i64 %indvars.iv9 to i32, !dbg !304
  %60 = icmp slt i32 %59, %n, !dbg !304
  br i1 %60, label %.preheader1, label %61, !dbg !304

; <label>:61                                      ; preds = %.preheader1
  %62 = shl nsw i32 %l.0, 1, !dbg !305
  tail call void @llvm.dbg.value(metadata !{i32 %62}, i64 0, metadata !79), !dbg !305
  %63 = icmp sgt i32 %62, %1, !dbg !306
  br i1 %63, label %.preheader, label %3, !dbg !306

.preheader:                                       ; preds = %61
  %64 = icmp slt i32 %n, 1, !dbg !307
  br i1 %64, label %._crit_edge, label %.lr.ph, !dbg !307

.lr.ph:                                           ; preds = %.preheader
  %65 = add i32 %n, 1, !dbg !307
  br label %66, !dbg !307

; <label>:66                                      ; preds = %66, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %66 ], [ 1, %.lr.ph ]
  %67 = getelementptr inbounds %struct.complex* %z, i64 %indvars.iv, i32 0, !dbg !309
  %68 = load float* %67, align 4, !dbg !309, !tbaa !209
  %69 = fmul float %68, %sqrinv, !dbg !309
  store float %69, float* %67, align 4, !dbg !309, !tbaa !209
  %70 = getelementptr inbounds %struct.complex* %z, i64 %indvars.iv, i32 1, !dbg !311
  %71 = load float* %70, align 4, !dbg !311, !tbaa !212
  %72 = fmul float %71, %sqrinv, !dbg !311
  %73 = fsub float -0.000000e+00, %72, !dbg !311
  store float %73, float* %70, align 4, !dbg !311, !tbaa !212
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !307
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !307
  %exitcond = icmp eq i32 %lftr.wideiv, %65, !dbg !307
  br i1 %exitcond, label %._crit_edge, label %66, !dbg !307

._crit_edge:                                      ; preds = %66, %.preheader
  ret void, !dbg !312
}

; Function Attrs: nounwind uwtable
define void @Oscar() #0 {
  tail call void @Exptab(i32 256, %struct.complex* getelementptr inbounds ([130 x %struct.complex]* @e, i64 0, i64 0)), !dbg !313
  store i64 5767, i64* @seed, align 8, !dbg !314, !tbaa !171
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !84), !dbg !315
  br label %2, !dbg !315

.preheader:                                       ; preds = %2
  %1 = zext i32 %11 to i64, !dbg !316
  store i64 %1, i64* @seed, align 8, !dbg !316, !tbaa !171
  store float %8, float* @zr, align 4, !dbg !317, !tbaa !223
  store float %13, float* @zi, align 4, !dbg !319, !tbaa !223
  br label %20, !dbg !321

; <label>:2                                       ; preds = %2, %0
  %indvars.iv = phi i64 [ 1, %0 ], [ %indvars.iv.next, %2 ]
  %3 = phi i32 [ 5767, %0 ], [ %11, %2 ], !dbg !323
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !85), !dbg !323
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !324), !dbg !325
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !326), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !85), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !85), !dbg !316
  tail call void @llvm.dbg.value(metadata !329, i64 0, metadata !330), !dbg !327
  %4 = mul nsw i32 %3, 4855, !dbg !331
  %5 = add nsw i32 %4, 1731, !dbg !331
  %6 = and i32 %5, 8191, !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !85), !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !324), !dbg !325
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !326), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !85), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !85), !dbg !316
  %7 = sitofp i32 %6 to float, !dbg !317
  %8 = fmul float %7, 0x3F20000000000000, !dbg !317
  tail call void @llvm.dbg.value(metadata !332, i64 0, metadata !333), !dbg !325
  %9 = mul nsw i32 %6, 4855, !dbg !334
  %10 = add nsw i32 %9, 1731, !dbg !334
  %11 = and i32 %10, 8191, !dbg !334
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !85), !dbg !334
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !324), !dbg !325
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !326), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !85), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %11}, i64 0, metadata !85), !dbg !316
  %12 = sitofp i32 %11 to float, !dbg !319
  %13 = fmul float %12, 0x3F20000000000000, !dbg !319
  %14 = fmul float %8, 2.000000e+01, !dbg !335
  %15 = fadd float %14, -1.000000e+01, !dbg !335
  %16 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %indvars.iv, i32 0, !dbg !335
  store float %15, float* %16, align 8, !dbg !335, !tbaa !209
  %17 = fmul float %13, 2.000000e+01, !dbg !336
  %18 = fadd float %17, -1.000000e+01, !dbg !336
  %19 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %indvars.iv, i32 1, !dbg !336
  store float %18, float* %19, align 4, !dbg !336, !tbaa !212
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !315
  %exitcond7 = icmp eq i64 %indvars.iv.next, 257, !dbg !315
  br i1 %exitcond7, label %.preheader, label %2, !dbg !315

; <label>:20                                      ; preds = %20, %.preheader
  %i.11 = phi i32 [ 1, %.preheader ], [ %21, %20 ]
  tail call void @Fft(i32 256, %struct.complex* getelementptr inbounds ([257 x %struct.complex]* @z, i64 0, i64 0), %struct.complex* getelementptr inbounds ([257 x %struct.complex]* @w, i64 0, i64 0), %struct.complex* getelementptr inbounds ([130 x %struct.complex]* @e, i64 0, i64 0), float 6.250000e-02), !dbg !337
  %21 = add nsw i32 %i.11, 1, !dbg !321
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !84), !dbg !321
  %exitcond = icmp eq i32 %21, 21, !dbg !321
  br i1 %exitcond, label %22, label %20, !dbg !321

; <label>:22                                      ; preds = %20
  tail call void @llvm.dbg.value(metadata !339, i64 0, metadata !340) #4, !dbg !342
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !343) #4, !dbg !342
  tail call void @llvm.dbg.value(metadata !344, i64 0, metadata !345) #4, !dbg !342
  tail call void @llvm.dbg.value(metadata !346, i64 0, metadata !347) #4, !dbg !342
  %putchar.i = tail call i32 @putchar(i32 10) #4, !dbg !348
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !349) #4, !dbg !350
  br label %23, !dbg !351

; <label>:23                                      ; preds = %23, %22
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %23 ], [ 1, %22 ]
  %24 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %indvars.iv.i, i32 0, !dbg !352
  %25 = load float* %24, align 8, !dbg !352, !tbaa !209
  %26 = fpext float %25 to double, !dbg !352
  %27 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %indvars.iv.i, i32 1, !dbg !352
  %28 = load float* %27, align 4, !dbg !352, !tbaa !212
  %29 = fpext float %28 to double, !dbg !352
  %30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), double %26, double %29) #4, !dbg !352
  %31 = add nsw i64 %indvars.iv.i, 17, !dbg !353
  %32 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %31, i32 0, !dbg !354
  %33 = load float* %32, align 8, !dbg !354, !tbaa !209
  %34 = fpext float %33 to double, !dbg !354
  %35 = getelementptr inbounds [257 x %struct.complex]* @z, i64 0, i64 %31, i32 1, !dbg !354
  %36 = load float* %35, align 4, !dbg !354, !tbaa !212
  %37 = fpext float %36 to double, !dbg !354
  %38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), double %34, double %37) #4, !dbg !354
  %putchar1.i = tail call i32 @putchar(i32 10) #4, !dbg !355
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 34, !dbg !356
  %39 = trunc i64 %indvars.iv.next.i to i32, !dbg !356
  %40 = icmp sgt i32 %39, 256, !dbg !356
  br i1 %40, label %Printcomplex.exit, label %23, !dbg !356

Printcomplex.exit:                                ; preds = %23
  ret void, !dbg !357
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  tail call void @llvm.dbg.value(metadata !285, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  tail call void @Oscar(), !dbg !360
  tail call void @llvm.dbg.value(metadata !181, i64 0, metadata !90), !dbg !358
  ret i32 0, !dbg !361
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nounwind
declare i32 @putchar(i32) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!167, !168}
!llvm.ident = !{!169}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !91, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c] [DW_LANG_C99]
!1 = metadata !{metadata !"oscar.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !8, metadata !12, metadata !22, metadata !28, metadata !42, metadata !50, metadata !67, metadata !82, metadata !88}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Initrand", metadata !"Initrand", metadata !"", i32 123, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Initrand, null, null, metadata !2, i32 124} ; [ DW_TAG_subprogram ] [line 123] [def] [scope 124] [Initrand]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null}
!8 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Rand", metadata !"Rand", metadata !"", i32 129, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Rand, null, null, metadata !2, i32 130} ; [ DW_TAG_subprogram ] [line 129] [def] [scope 130] [Rand]
!9 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Cos", metadata !"Cos", metadata !"", i32 137, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @Cos, null, null, metadata !16, i32 138} ; [ DW_TAG_subprogram ] [line 137] [def] [scope 138] [Cos]
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !15, metadata !15}
!15 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!16 = metadata !{metadata !17, metadata !18, metadata !19, metadata !20, metadata !21}
!17 = metadata !{i32 786689, metadata !12, metadata !"x", metadata !5, i32 16777353, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 137]
!18 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 140, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 140]
!19 = metadata !{i32 786688, metadata !12, metadata !"factor", metadata !5, i32 140, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [factor] [line 140]
!20 = metadata !{i32 786688, metadata !12, metadata !"result", metadata !5, i32 141, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 141]
!21 = metadata !{i32 786688, metadata !12, metadata !"power", metadata !5, i32 141, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [power] [line 141]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Min0", metadata !"Min0", metadata !"", i32 162, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @Min0, null, null, metadata !25, i32 163} ; [ DW_TAG_subprogram ] [line 162] [def] [scope 163] [Min0]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !11, metadata !11, metadata !11}
!25 = metadata !{metadata !26, metadata !27}
!26 = metadata !{i32 786689, metadata !22, metadata !"arg1", metadata !5, i32 16777378, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg1] [line 162]
!27 = metadata !{i32 786689, metadata !22, metadata !"arg2", metadata !5, i32 33554594, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg2] [line 162]
!28 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Printcomplex", metadata !"Printcomplex", metadata !"", i32 171, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.complex*, i32, i32, i32)* @Printcomplex, null, null, metadata !36, i32 172} ; [ DW_TAG_subprogram ] [line 171] [def] [scope 172] [Printcomplex]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31, metadata !11, metadata !11, metadata !11}
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from complex]
!32 = metadata !{i32 786451, metadata !1, null, metadata !"complex", i32 77, i64 64, i64 32, i32 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 77, size 64, align 32, offset 0] [def] [from ]
!33 = metadata !{metadata !34, metadata !35}
!34 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"rp", i32 79, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [rp] [line 79, size 32, align 32, offset 0] [from float]
!35 = metadata !{i32 786445, metadata !1, metadata !32, metadata !"ip", i32 79, i64 32, i64 32, i64 32, i32 0, metadata !15} ; [ DW_TAG_member ] [ip] [line 79, size 32, align 32, offset 32] [from float]
!36 = metadata !{metadata !37, metadata !38, metadata !39, metadata !40, metadata !41}
!37 = metadata !{i32 786689, metadata !28, metadata !"zarray", metadata !5, i32 16777387, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [zarray] [line 171]
!38 = metadata !{i32 786689, metadata !28, metadata !"start", metadata !5, i32 33554603, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 171]
!39 = metadata !{i32 786689, metadata !28, metadata !"finish", metadata !5, i32 50331819, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [finish] [line 171]
!40 = metadata !{i32 786689, metadata !28, metadata !"increment", metadata !5, i32 67109035, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [increment] [line 171]
!41 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !5, i32 173, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 173]
!42 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Uniform11", metadata !"Uniform11", metadata !"", i32 190, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, float*)* @Uniform11, null, null, metadata !47, i32 191} ; [ DW_TAG_subprogram ] [line 190] [def] [scope 191] [Uniform11]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null, metadata !45, metadata !46}
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!47 = metadata !{metadata !48, metadata !49}
!48 = metadata !{i32 786689, metadata !42, metadata !"iy", metadata !5, i32 16777406, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [iy] [line 190]
!49 = metadata !{i32 786689, metadata !42, metadata !"yfl", metadata !5, i32 33554622, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [yfl] [line 190]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Exptab", metadata !"Exptab", metadata !"", i32 197, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struct.complex*)* @Exptab, null, null, metadata !53, i32 198} ; [ DW_TAG_subprogram ] [line 197] [def] [scope 198] [Exptab]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !11, metadata !31}
!53 = metadata !{metadata !54, metadata !55, metadata !56, metadata !57, metadata !58, metadata !62, metadata !63, metadata !64, metadata !65, metadata !66}
!54 = metadata !{i32 786689, metadata !50, metadata !"n", metadata !5, i32 16777413, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 197]
!55 = metadata !{i32 786689, metadata !50, metadata !"e", metadata !5, i32 33554629, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [e] [line 197]
!56 = metadata !{i32 786688, metadata !50, metadata !"theta", metadata !5, i32 199, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 199]
!57 = metadata !{i32 786688, metadata !50, metadata !"divisor", metadata !5, i32 199, metadata !15, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [divisor] [line 199]
!58 = metadata !{i32 786688, metadata !50, metadata !"h", metadata !5, i32 199, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h] [line 199]
!59 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 832, i64 32, i32 0, i32 0, metadata !15, metadata !60, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 832, align 32, offset 0] [from float]
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786465, i64 0, i64 26}       ; [ DW_TAG_subrange_type ] [0, 25]
!62 = metadata !{i32 786688, metadata !50, metadata !"i", metadata !5, i32 200, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 200]
!63 = metadata !{i32 786688, metadata !50, metadata !"j", metadata !5, i32 200, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 200]
!64 = metadata !{i32 786688, metadata !50, metadata !"k", metadata !5, i32 200, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 200]
!65 = metadata !{i32 786688, metadata !50, metadata !"l", metadata !5, i32 200, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 200]
!66 = metadata !{i32 786688, metadata !50, metadata !"m", metadata !5, i32 200, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 200]
!67 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Fft", metadata !"Fft", metadata !"", i32 241, metadata !68, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struct.complex*, %struct.complex*, %struct.complex*, float)* @Fft, null, null, metadata !70, i32 243} ; [ DW_TAG_subprogram ] [line 241] [def] [scope 243] [Fft]
!68 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{null, metadata !11, metadata !31, metadata !31, metadata !31, metadata !15}
!70 = metadata !{metadata !71, metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!71 = metadata !{i32 786689, metadata !67, metadata !"n", metadata !5, i32 16777457, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 241]
!72 = metadata !{i32 786689, metadata !67, metadata !"z", metadata !5, i32 33554673, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 241]
!73 = metadata !{i32 786689, metadata !67, metadata !"w", metadata !5, i32 50331889, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [w] [line 241]
!74 = metadata !{i32 786689, metadata !67, metadata !"e", metadata !5, i32 67109105, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [e] [line 241]
!75 = metadata !{i32 786689, metadata !67, metadata !"sqrinv", metadata !5, i32 83886322, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sqrinv] [line 242]
!76 = metadata !{i32 786688, metadata !67, metadata !"i", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 244]
!77 = metadata !{i32 786688, metadata !67, metadata !"j", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 244]
!78 = metadata !{i32 786688, metadata !67, metadata !"k", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 244]
!79 = metadata !{i32 786688, metadata !67, metadata !"l", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 244]
!80 = metadata !{i32 786688, metadata !67, metadata !"m", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 244]
!81 = metadata !{i32 786688, metadata !67, metadata !"index", metadata !5, i32 244, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [index] [line 244]
!82 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Oscar", metadata !"Oscar", metadata !"", i32 294, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, void ()* @Oscar, null, null, metadata !83, i32 295} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [Oscar]
!83 = metadata !{metadata !84, metadata !85}
!84 = metadata !{i32 786688, metadata !82, metadata !"i", metadata !5, i32 296, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 296]
!85 = metadata !{i32 786688, metadata !86, metadata !"s", metadata !5, i32 301, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 301]
!86 = metadata !{i32 786443, metadata !1, metadata !87, i32 300, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!87 = metadata !{i32 786443, metadata !1, metadata !82, i32 299, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!88 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 317, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !89, i32 318} ; [ DW_TAG_subprogram ] [line 317] [def] [scope 318] [main]
!89 = metadata !{metadata !90}
!90 = metadata !{i32 786688, metadata !88, metadata !"i", metadata !5, i32 319, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 319]
!91 = metadata !{metadata !92, metadata !93, metadata !94, metadata !95, metadata !97, metadata !101, metadata !103, metadata !110, metadata !114, metadata !122, metadata !123, metadata !124, metadata !128, metadata !129, metadata !130, metadata !132, metadata !133, metadata !134, metadata !135, metadata !139, metadata !140, metadata !144, metadata !147, metadata !148, metadata !149, metadata !153, metadata !154, metadata !155, metadata !156, metadata !160, metadata !161, metadata !165, metadata !166}
!92 = metadata !{i32 786484, i32 0, null, metadata !"value", metadata !"value", metadata !"", metadata !5, i32 86, metadata !15, i32 0, i32 1, float* @value, null} ; [ DW_TAG_variable ] [value] [line 86] [def]
!93 = metadata !{i32 786484, i32 0, null, metadata !"fixed", metadata !"fixed", metadata !"", metadata !5, i32 86, metadata !15, i32 0, i32 1, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 86] [def]
!94 = metadata !{i32 786484, i32 0, null, metadata !"floated", metadata !"floated", metadata !"", metadata !5, i32 86, metadata !15, i32 0, i32 1, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 86] [def]
!95 = metadata !{i32 786484, i32 0, null, metadata !"seed", metadata !"seed", metadata !"", metadata !5, i32 89, metadata !96, i32 0, i32 1, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 89] [def]
!96 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!97 = metadata !{i32 786484, i32 0, null, metadata !"permarray", metadata !"permarray", metadata !"", metadata !5, i32 92, metadata !98, i32 0, i32 1, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 92] [def]
!98 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 352, i64 32, i32 0, i32 0, metadata !11, metadata !99, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!99 = metadata !{metadata !100}
!100 = metadata !{i32 786465, i64 0, i64 11}      ; [ DW_TAG_subrange_type ] [0, 10]
!101 = metadata !{i32 786484, i32 0, null, metadata !"pctr", metadata !"pctr", metadata !"", metadata !5, i32 94, metadata !102, i32 0, i32 1, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 94] [def]
!102 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!103 = metadata !{i32 786484, i32 0, null, metadata !"tree", metadata !"tree", metadata !"", metadata !5, i32 97, metadata !104, i32 0, i32 1, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 97] [def]
!104 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!105 = metadata !{i32 786451, metadata !1, null, metadata !"node", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !106, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!106 = metadata !{metadata !107, metadata !108, metadata !109}
!107 = metadata !{i32 786445, metadata !1, metadata !105, metadata !"left", i32 47, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_member ] [left] [line 47, size 64, align 64, offset 0] [from ]
!108 = metadata !{i32 786445, metadata !1, metadata !105, metadata !"right", i32 47, i64 64, i64 64, i64 64, i32 0, metadata !104} ; [ DW_TAG_member ] [right] [line 47, size 64, align 64, offset 64] [from ]
!109 = metadata !{i32 786445, metadata !1, metadata !105, metadata !"val", i32 48, i64 32, i64 32, i64 128, i32 0, metadata !11} ; [ DW_TAG_member ] [val] [line 48, size 32, align 32, offset 128] [from int]
!110 = metadata !{i32 786484, i32 0, null, metadata !"stack", metadata !"stack", metadata !"", metadata !5, i32 100, metadata !111, i32 0, i32 1, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 100] [def]
!111 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 128, i64 32, i32 0, i32 0, metadata !11, metadata !112, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!112 = metadata !{metadata !113}
!113 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!114 = metadata !{i32 786484, i32 0, null, metadata !"cellspace", metadata !"cellspace", metadata !"", metadata !5, i32 101, metadata !115, i32 0, i32 1, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 101] [def]
!115 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1216, i64 32, i32 0, i32 0, metadata !116, metadata !120, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!116 = metadata !{i32 786451, metadata !1, null, metadata !"element", i32 55, i64 64, i64 32, i32 0, i32 0, null, metadata !117, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 55, size 64, align 32, offset 0] [def] [from ]
!117 = metadata !{metadata !118, metadata !119}
!118 = metadata !{i32 786445, metadata !1, metadata !116, metadata !"discsize", i32 57, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [discsize] [line 57, size 32, align 32, offset 0] [from int]
!119 = metadata !{i32 786445, metadata !1, metadata !116, metadata !"next", i32 58, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [next] [line 58, size 32, align 32, offset 32] [from int]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ] [0, 18]
!122 = metadata !{i32 786484, i32 0, null, metadata !"freelist", metadata !"freelist", metadata !"", metadata !5, i32 102, metadata !11, i32 0, i32 1, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 102] [def]
!123 = metadata !{i32 786484, i32 0, null, metadata !"movesdone", metadata !"movesdone", metadata !"", metadata !5, i32 102, metadata !11, i32 0, i32 1, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 102] [def]
!124 = metadata !{i32 786484, i32 0, null, metadata !"ima", metadata !"ima", metadata !"", metadata !5, i32 106, metadata !125, i32 0, i32 1, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 106] [def]
!125 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !11, metadata !126, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!126 = metadata !{metadata !127, metadata !127}
!127 = metadata !{i32 786465, i64 0, i64 41}      ; [ DW_TAG_subrange_type ] [0, 40]
!128 = metadata !{i32 786484, i32 0, null, metadata !"imb", metadata !"imb", metadata !"", metadata !5, i32 106, metadata !125, i32 0, i32 1, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 106] [def]
!129 = metadata !{i32 786484, i32 0, null, metadata !"imr", metadata !"imr", metadata !"", metadata !5, i32 107, metadata !125, i32 0, i32 1, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 107] [def]
!130 = metadata !{i32 786484, i32 0, null, metadata !"rma", metadata !"rma", metadata !"", metadata !5, i32 108, metadata !131, i32 0, i32 1, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 108] [def]
!131 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 53792, i64 32, i32 0, i32 0, metadata !15, metadata !126, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!132 = metadata !{i32 786484, i32 0, null, metadata !"rmb", metadata !"rmb", metadata !"", metadata !5, i32 108, metadata !131, i32 0, i32 1, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 108] [def]
!133 = metadata !{i32 786484, i32 0, null, metadata !"rmr", metadata !"rmr", metadata !"", metadata !5, i32 109, metadata !131, i32 0, i32 1, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 109] [def]
!134 = metadata !{i32 786484, i32 0, null, metadata !"piececount", metadata !"piececount", metadata !"", metadata !5, i32 112, metadata !111, i32 0, i32 1, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 112] [def]
!135 = metadata !{i32 786484, i32 0, null, metadata !"class", metadata !"class", metadata !"", metadata !5, i32 112, metadata !136, i32 0, i32 1, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 112] [def]
!136 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 416, i64 32, i32 0, i32 0, metadata !11, metadata !137, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!137 = metadata !{metadata !138}
!138 = metadata !{i32 786465, i64 0, i64 13}      ; [ DW_TAG_subrange_type ] [0, 12]
!139 = metadata !{i32 786484, i32 0, null, metadata !"piecemax", metadata !"piecemax", metadata !"", metadata !5, i32 112, metadata !136, i32 0, i32 1, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 112] [def]
!140 = metadata !{i32 786484, i32 0, null, metadata !"puzzl", metadata !"puzzl", metadata !"", metadata !5, i32 113, metadata !141, i32 0, i32 1, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 113] [def]
!141 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !11, metadata !142, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786465, i64 0, i64 512}     ; [ DW_TAG_subrange_type ] [0, 511]
!144 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 113, metadata !145, i32 0, i32 1, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 113] [def]
!145 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 212992, i64 32, i32 0, i32 0, metadata !11, metadata !146, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!146 = metadata !{metadata !138, metadata !143}
!147 = metadata !{i32 786484, i32 0, null, metadata !"n", metadata !"n", metadata !"", metadata !5, i32 113, metadata !11, i32 0, i32 1, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 113] [def]
!148 = metadata !{i32 786484, i32 0, null, metadata !"kount", metadata !"kount", metadata !"", metadata !5, i32 113, metadata !11, i32 0, i32 1, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 113] [def]
!149 = metadata !{i32 786484, i32 0, null, metadata !"sortlist", metadata !"sortlist", metadata !"", metadata !5, i32 116, metadata !150, i32 0, i32 1, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 116] [def]
!150 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160032, i64 32, i32 0, i32 0, metadata !11, metadata !151, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!151 = metadata !{metadata !152}
!152 = metadata !{i32 786465, i64 0, i64 5001}    ; [ DW_TAG_subrange_type ] [0, 5000]
!153 = metadata !{i32 786484, i32 0, null, metadata !"biggest", metadata !"biggest", metadata !"", metadata !5, i32 116, metadata !11, i32 0, i32 1, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 116] [def]
!154 = metadata !{i32 786484, i32 0, null, metadata !"littlest", metadata !"littlest", metadata !"", metadata !5, i32 116, metadata !11, i32 0, i32 1, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 116] [def]
!155 = metadata !{i32 786484, i32 0, null, metadata !"top", metadata !"top", metadata !"", metadata !5, i32 116, metadata !11, i32 0, i32 1, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 116] [def]
!156 = metadata !{i32 786484, i32 0, null, metadata !"z", metadata !"z", metadata !"", metadata !5, i32 119, metadata !157, i32 0, i32 1, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 119] [def]
!157 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16448, i64 32, i32 0, i32 0, metadata !32, metadata !158, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786465, i64 0, i64 257}     ; [ DW_TAG_subrange_type ] [0, 256]
!160 = metadata !{i32 786484, i32 0, null, metadata !"w", metadata !"w", metadata !"", metadata !5, i32 119, metadata !157, i32 0, i32 1, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 119] [def]
!161 = metadata !{i32 786484, i32 0, null, metadata !"e", metadata !"e", metadata !"", metadata !5, i32 119, metadata !162, i32 0, i32 1, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 119] [def]
!162 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8320, i64 32, i32 0, i32 0, metadata !32, metadata !163, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!163 = metadata !{metadata !164}
!164 = metadata !{i32 786465, i64 0, i64 130}     ; [ DW_TAG_subrange_type ] [0, 129]
!165 = metadata !{i32 786484, i32 0, null, metadata !"zr", metadata !"zr", metadata !"", metadata !5, i32 120, metadata !15, i32 0, i32 1, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 120] [def]
!166 = metadata !{i32 786484, i32 0, null, metadata !"zi", metadata !"zi", metadata !"", metadata !5, i32 120, metadata !15, i32 0, i32 1, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 120] [def]
!167 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!168 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!169 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!170 = metadata !{i32 125, i32 0, metadata !4, null}
!171 = metadata !{metadata !172, metadata !172, i64 0}
!172 = metadata !{metadata !"long", metadata !173, i64 0}
!173 = metadata !{metadata !"omnipotent char", metadata !174, i64 0}
!174 = metadata !{metadata !"Simple C/C++ TBAA"}
!175 = metadata !{i32 126, i32 0, metadata !4, null}
!176 = metadata !{i32 131, i32 0, metadata !8, null}
!177 = metadata !{i32 132, i32 0, metadata !8, null}
!178 = metadata !{i32 137, i32 0, metadata !12, null}
!179 = metadata !{float 1.000000e+00}
!180 = metadata !{i32 143, i32 0, metadata !12, null}
!181 = metadata !{i32 1}
!182 = metadata !{i32 144, i32 0, metadata !12, null}
!183 = metadata !{i32 145, i32 0, metadata !12, null}
!184 = metadata !{i32 2}
!185 = metadata !{i32 146, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !12, i32 146, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!187 = metadata !{i32 148, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !1, metadata !186, i32 147, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!189 = metadata !{i32 149, i32 0, metadata !188, null}
!190 = metadata !{i32 150, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !188, i32 150, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!192 = metadata !{i32 152, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !194, i32 152, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!194 = metadata !{i32 786443, metadata !1, metadata !191, i32 151, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!195 = metadata !{i32 153, i32 0, metadata !193, null}
!196 = metadata !{i32 155, i32 0, metadata !193, null}
!197 = metadata !{i32 158, i32 0, metadata !12, null}
!198 = metadata !{i32 162, i32 0, metadata !22, null}
!199 = metadata !{i32 164, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !1, metadata !22, i32 164, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!201 = metadata !{i32 165, i32 0, metadata !200, null}
!202 = metadata !{i32 168, i32 0, metadata !22, null}
!203 = metadata !{i32 171, i32 0, metadata !28, null}
!204 = metadata !{i32 174, i32 0, metadata !28, null}
!205 = metadata !{i32 176, i32 0, metadata !28, null}
!206 = metadata !{i32 177, i32 0, metadata !28, null}
!207 = metadata !{i32 179, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !1, metadata !28, i32 178, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!209 = metadata !{metadata !210, metadata !211, i64 0}
!210 = metadata !{metadata !"complex", metadata !211, i64 0, metadata !211, i64 4}
!211 = metadata !{metadata !"float", metadata !173, i64 0}
!212 = metadata !{metadata !210, metadata !211, i64 4}
!213 = metadata !{i32 180, i32 0, metadata !208, null}
!214 = metadata !{i32 181, i32 0, metadata !208, null}
!215 = metadata !{i32 182, i32 0, metadata !208, null}
!216 = metadata !{i32 184, i32 0, metadata !208, null}
!217 = metadata !{i32 187, i32 0, metadata !28, null}
!218 = metadata !{i32 190, i32 0, metadata !42, null}
!219 = metadata !{i32 192, i32 0, metadata !42, null}
!220 = metadata !{metadata !221, metadata !221, i64 0}
!221 = metadata !{metadata !"int", metadata !173, i64 0}
!222 = metadata !{i32 193, i32 0, metadata !42, null}
!223 = metadata !{metadata !211, metadata !211, i64 0}
!224 = metadata !{i32 194, i32 0, metadata !42, null}
!225 = metadata !{i32 197, i32 0, metadata !50, null}
!226 = metadata !{i32 199, i32 0, metadata !50, null}
!227 = metadata !{float 0x400921FB60000000}
!228 = metadata !{i32 202, i32 0, metadata !50, null}
!229 = metadata !{float 4.000000e+00}
!230 = metadata !{i32 203, i32 0, metadata !50, null}
!231 = metadata !{i32 204, i32 0, metadata !232, null}
!232 = metadata !{i32 786443, metadata !1, metadata !50, i32 204, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!233 = metadata !{i32 206, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !232, i32 205, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!235 = metadata !{i32 786689, metadata !12, metadata !"x", metadata !5, i32 16777353, metadata !15, i32 0, metadata !233} ; [ DW_TAG_arg_variable ] [x] [line 137]
!236 = metadata !{i32 137, i32 0, metadata !12, metadata !233}
!237 = metadata !{i32 786688, metadata !12, metadata !"result", metadata !5, i32 141, metadata !15, i32 0, metadata !233} ; [ DW_TAG_auto_variable ] [result] [line 141]
!238 = metadata !{i32 143, i32 0, metadata !12, metadata !233}
!239 = metadata !{i32 786688, metadata !12, metadata !"factor", metadata !5, i32 140, metadata !11, i32 0, metadata !233} ; [ DW_TAG_auto_variable ] [factor] [line 140]
!240 = metadata !{i32 144, i32 0, metadata !12, metadata !233}
!241 = metadata !{i32 786688, metadata !12, metadata !"power", metadata !5, i32 141, metadata !15, i32 0, metadata !233} ; [ DW_TAG_auto_variable ] [power] [line 141]
!242 = metadata !{i32 145, i32 0, metadata !12, metadata !233}
!243 = metadata !{i32 786688, metadata !12, metadata !"i", metadata !5, i32 140, metadata !11, i32 0, metadata !233} ; [ DW_TAG_auto_variable ] [i] [line 140]
!244 = metadata !{i32 146, i32 0, metadata !186, metadata !233}
!245 = metadata !{i32 148, i32 0, metadata !188, metadata !233}
!246 = metadata !{i32 149, i32 0, metadata !188, metadata !233}
!247 = metadata !{i32 150, i32 0, metadata !191, metadata !233}
!248 = metadata !{i32 152, i32 0, metadata !193, metadata !233}
!249 = metadata !{i32 153, i32 0, metadata !193, metadata !233}
!250 = metadata !{i32 155, i32 0, metadata !193, metadata !233}
!251 = metadata !{i32 207, i32 0, metadata !234, null}
!252 = metadata !{i32 210, i32 0, metadata !50, null}
!253 = metadata !{i32 211, i32 0, metadata !50, null}
!254 = metadata !{i32 212, i32 0, metadata !50, null}
!255 = metadata !{i32 213, i32 0, metadata !50, null}
!256 = metadata !{i32 214, i32 0, metadata !50, null}
!257 = metadata !{i32 215, i32 0, metadata !50, null}
!258 = metadata !{i32 216, i32 0, metadata !50, null}
!259 = metadata !{i32 217, i32 0, metadata !50, null}
!260 = metadata !{i32 218, i32 0, metadata !50, null}
!261 = metadata !{i32 220, i32 0, metadata !50, null}
!262 = metadata !{i32 222, i32 0, metadata !263, null}
!263 = metadata !{i32 786443, metadata !1, metadata !50, i32 221, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!264 = metadata !{i32 223, i32 0, metadata !263, null}
!265 = metadata !{i32 227, i32 0, metadata !266, null}
!266 = metadata !{i32 786443, metadata !1, metadata !263, i32 226, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!267 = metadata !{i32 225, i32 0, metadata !263, null}
!268 = metadata !{i32 228, i32 0, metadata !266, null}
!269 = metadata !{i32 230, i32 0, metadata !266, null}
!270 = metadata !{i32 233, i32 0, metadata !263, null}
!271 = metadata !{i32 786689, metadata !22, metadata !"arg1", metadata !5, i32 16777378, metadata !11, i32 0, metadata !270} ; [ DW_TAG_arg_variable ] [arg1] [line 162]
!272 = metadata !{i32 162, i32 0, metadata !22, metadata !270}
!273 = metadata !{i32 25}
!274 = metadata !{i32 786689, metadata !22, metadata !"arg2", metadata !5, i32 33554594, metadata !11, i32 0, metadata !270} ; [ DW_TAG_arg_variable ] [arg2] [line 162]
!275 = metadata !{i32 164, i32 0, metadata !200, metadata !270}
!276 = metadata !{i32 165, i32 0, metadata !200, metadata !270}
!277 = metadata !{i32 234, i32 0, metadata !263, null}
!278 = metadata !{i32 235, i32 0, metadata !263, null}
!279 = metadata !{i32 238, i32 0, metadata !50, null}
!280 = metadata !{i32 241, i32 0, metadata !67, null}
!281 = metadata !{i32 242, i32 0, metadata !67, null}
!282 = metadata !{i32 245, i32 0, metadata !67, null}
!283 = metadata !{i32 246, i32 0, metadata !67, null}
!284 = metadata !{i32 248, i32 0, metadata !67, null}
!285 = metadata !{i32 0}
!286 = metadata !{i32 250, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !67, i32 249, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!288 = metadata !{i32 251, i32 0, metadata !287, null}
!289 = metadata !{i32 252, i32 0, metadata !287, null}
!290 = metadata !{i32 254, i32 0, metadata !287, null}
!291 = metadata !{i32 261, i32 0, metadata !292, null}
!292 = metadata !{i32 786443, metadata !1, metadata !293, i32 258, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!293 = metadata !{i32 786443, metadata !1, metadata !287, i32 255, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!294 = metadata !{i32 259, i32 0, metadata !292, null}
!295 = metadata !{i32 260, i32 0, metadata !292, null}
!296 = metadata !{i32 263, i32 0, metadata !292, null}
!297 = metadata !{i32 266, i32 0, metadata !292, null}
!298 = metadata !{i32 265, i32 0, metadata !292, null}
!299 = metadata !{i32 269, i32 0, metadata !293, null}
!300 = metadata !{i32 271, i32 0, metadata !293, null}
!301 = metadata !{i32 270, i32 0, metadata !293, null}
!302 = metadata !{i32 277, i32 0, metadata !303, null}
!303 = metadata !{i32 786443, metadata !1, metadata !287, i32 276, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!304 = metadata !{i32 279, i32 0, metadata !303, null}
!305 = metadata !{i32 281, i32 0, metadata !287, null}
!306 = metadata !{i32 282, i32 0, metadata !287, null}
!307 = metadata !{i32 285, i32 0, metadata !308, null}
!308 = metadata !{i32 786443, metadata !1, metadata !67, i32 285, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!309 = metadata !{i32 287, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !308, i32 286, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!311 = metadata !{i32 288, i32 0, metadata !310, null}
!312 = metadata !{i32 291, i32 0, metadata !67, null}
!313 = metadata !{i32 297, i32 0, metadata !82, null}
!314 = metadata !{i32 298, i32 0, metadata !82, null}
!315 = metadata !{i32 299, i32 0, metadata !87, null}
!316 = metadata !{i32 305, i32 0, metadata !86, null}
!317 = metadata !{i32 193, i32 0, metadata !42, metadata !318}
!318 = metadata !{i32 302, i32 0, metadata !86, null}
!319 = metadata !{i32 193, i32 0, metadata !42, metadata !320}
!320 = metadata !{i32 304, i32 0, metadata !86, null}
!321 = metadata !{i32 309, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !82, i32 309, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!323 = metadata !{i32 301, i32 0, metadata !86, null}
!324 = metadata !{i32 786689, metadata !42, metadata !"iy", metadata !5, i32 16777406, metadata !45, i32 0, metadata !320} ; [ DW_TAG_arg_variable ] [iy] [line 190]
!325 = metadata !{i32 190, i32 0, metadata !42, metadata !320}
!326 = metadata !{i32 786689, metadata !42, metadata !"iy", metadata !5, i32 16777406, metadata !45, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [iy] [line 190]
!327 = metadata !{i32 190, i32 0, metadata !42, metadata !318}
!328 = metadata !{i32 303, i32 0, metadata !86, null}
!329 = metadata !{float* @zr}
!330 = metadata !{i32 786689, metadata !42, metadata !"yfl", metadata !5, i32 33554622, metadata !46, i32 0, metadata !318} ; [ DW_TAG_arg_variable ] [yfl] [line 190]
!331 = metadata !{i32 192, i32 0, metadata !42, metadata !318}
!332 = metadata !{float* @zi}
!333 = metadata !{i32 786689, metadata !42, metadata !"yfl", metadata !5, i32 33554622, metadata !46, i32 0, metadata !320} ; [ DW_TAG_arg_variable ] [yfl] [line 190]
!334 = metadata !{i32 192, i32 0, metadata !42, metadata !320}
!335 = metadata !{i32 306, i32 0, metadata !86, null}
!336 = metadata !{i32 307, i32 0, metadata !86, null}
!337 = metadata !{i32 311, i32 0, metadata !338, null}
!338 = metadata !{i32 786443, metadata !1, metadata !322, i32 310, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!339 = metadata !{%struct.complex* getelementptr inbounds ([257 x %struct.complex]* @z, i64 0, i64 0)}
!340 = metadata !{i32 786689, metadata !28, metadata !"zarray", metadata !5, i32 16777387, metadata !31, i32 0, metadata !341} ; [ DW_TAG_arg_variable ] [zarray] [line 171]
!341 = metadata !{i32 313, i32 0, metadata !82, null}
!342 = metadata !{i32 171, i32 0, metadata !28, metadata !341}
!343 = metadata !{i32 786689, metadata !28, metadata !"start", metadata !5, i32 33554603, metadata !11, i32 0, metadata !341} ; [ DW_TAG_arg_variable ] [start] [line 171]
!344 = metadata !{i32 256}
!345 = metadata !{i32 786689, metadata !28, metadata !"finish", metadata !5, i32 50331819, metadata !11, i32 0, metadata !341} ; [ DW_TAG_arg_variable ] [finish] [line 171]
!346 = metadata !{i32 17}
!347 = metadata !{i32 786689, metadata !28, metadata !"increment", metadata !5, i32 67109035, metadata !11, i32 0, metadata !341} ; [ DW_TAG_arg_variable ] [increment] [line 171]
!348 = metadata !{i32 174, i32 0, metadata !28, metadata !341}
!349 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !5, i32 173, metadata !11, i32 0, metadata !341} ; [ DW_TAG_auto_variable ] [i] [line 173]
!350 = metadata !{i32 176, i32 0, metadata !28, metadata !341}
!351 = metadata !{i32 177, i32 0, metadata !28, metadata !341}
!352 = metadata !{i32 179, i32 0, metadata !208, metadata !341}
!353 = metadata !{i32 180, i32 0, metadata !208, metadata !341}
!354 = metadata !{i32 181, i32 0, metadata !208, metadata !341}
!355 = metadata !{i32 182, i32 0, metadata !208, metadata !341}
!356 = metadata !{i32 184, i32 0, metadata !208, metadata !341}
!357 = metadata !{i32 314, i32 0, metadata !82, null}
!358 = metadata !{i32 320, i32 0, metadata !359, null}
!359 = metadata !{i32 786443, metadata !1, metadata !88, i32 320, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/oscar.c]
!360 = metadata !{i32 321, i32 0, metadata !359, null}
!361 = metadata !{i32 322, i32 0, metadata !88, null}
