; ModuleID = 'himenobmtxpa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Mat = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@omega = global float 0x3FE99999A0000000, align 4
@.str = private unnamed_addr constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1
@p = common global %struct.Mat zeroinitializer, align 8
@bnd = common global %struct.Mat zeroinitializer, align 8
@wrk1 = common global %struct.Mat zeroinitializer, align 8
@wrk2 = common global %struct.Mat zeroinitializer, align 8
@a = common global %struct.Mat zeroinitializer, align 8
@b = common global %struct.Mat zeroinitializer, align 8
@c = common global %struct.Mat zeroinitializer, align 8
@.str2 = private unnamed_addr constant [29 x i8] c" Loop executed for %d times\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c" Gosa : %e \0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"XS\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"xs\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str9 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"XL\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"xl\00", align 1
@second.base_sec = internal unnamed_addr global i32 0, align 4
@second.base_usec = internal unnamed_addr global i32 0, align 4
@str = private unnamed_addr constant [27 x i8] c"Invalid input character !!\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
for.cond4.preheader.lr.ph.us.i.preheader:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !18, metadata !152), !dbg !153
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !19, metadata !152), !dbg !154
  tail call void @llvm.dbg.declare(metadata [3 x i32]* undef, metadata !30, metadata !152), !dbg !155
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !27, metadata !152), !dbg !156
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !28, metadata !152), !dbg !157
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !29, metadata !152), !dbg !158
  tail call void @llvm.dbg.value(metadata i32 63, i64 0, metadata !24, metadata !152), !dbg !159
  tail call void @llvm.dbg.value(metadata i32 63, i64 0, metadata !25, metadata !152), !dbg !160
  tail call void @llvm.dbg.value(metadata i32 127, i64 0, metadata !26, metadata !152), !dbg !161
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0), i32 64, i32 64, i32 128) #6, !dbg !162
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 63, i32 63, i32 127) #6, !dbg !163
  tail call void @llvm.dbg.value(metadata %struct.Mat* @p, i64 0, metadata !164, metadata !152) #6, !dbg !166
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !167, metadata !152) #6, !dbg !168
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !169, metadata !152) #6, !dbg !170
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !171, metadata !152) #6, !dbg !172
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !173, metadata !152) #6, !dbg !174
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 1), align 8, !dbg !175, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 2), align 4, !dbg !182, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 3), align 8, !dbg !184, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 4), align 4, !dbg !186, !tbaa !187
  %call.i = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !188
  store i8* %call.i, i8** bitcast (%struct.Mat* @p to i8**), align 8, !dbg !189, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @bnd, i64 0, metadata !191, metadata !152) #6, !dbg !193
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !194, metadata !152) #6, !dbg !195
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !196, metadata !152) #6, !dbg !197
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !198, metadata !152) #6, !dbg !199
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !200, metadata !152) #6, !dbg !201
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 1), align 8, !dbg !202, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 2), align 4, !dbg !203, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 3), align 8, !dbg !204, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 4), align 4, !dbg !205, !tbaa !187
  %call.i44 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !206
  store i8* %call.i44, i8** bitcast (%struct.Mat* @bnd to i8**), align 8, !dbg !207, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk1, i64 0, metadata !208, metadata !152) #6, !dbg !210
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !211, metadata !152) #6, !dbg !212
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !213, metadata !152) #6, !dbg !214
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !215, metadata !152) #6, !dbg !216
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !217, metadata !152) #6, !dbg !218
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 1), align 8, !dbg !219, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 2), align 4, !dbg !220, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 3), align 8, !dbg !221, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 4), align 4, !dbg !222, !tbaa !187
  %call.i47 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !223
  store i8* %call.i47, i8** bitcast (%struct.Mat* @wrk1 to i8**), align 8, !dbg !224, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk2, i64 0, metadata !225, metadata !152) #6, !dbg !227
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !228, metadata !152) #6, !dbg !229
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !230, metadata !152) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !232, metadata !152) #6, !dbg !233
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !234, metadata !152) #6, !dbg !235
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 1), align 8, !dbg !236, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 2), align 4, !dbg !237, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 3), align 8, !dbg !238, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 4), align 4, !dbg !239, !tbaa !187
  %call.i50 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !240
  store i8* %call.i50, i8** bitcast (%struct.Mat* @wrk2 to i8**), align 8, !dbg !241, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !242, metadata !152) #6, !dbg !244
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !245, metadata !152) #6, !dbg !246
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !247, metadata !152) #6, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !249, metadata !152) #6, !dbg !250
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !251, metadata !152) #6, !dbg !252
  store i32 4, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 1), align 8, !dbg !253, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 2), align 4, !dbg !254, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 3), align 8, !dbg !255, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 4), align 4, !dbg !256, !tbaa !187
  %call.i53 = tail call noalias i8* @malloc(i64 8388608) #6, !dbg !257
  store i8* %call.i53, i8** bitcast (%struct.Mat* @a to i8**), align 8, !dbg !258, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !259, metadata !152) #6, !dbg !261
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !262, metadata !152) #6, !dbg !263
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !264, metadata !152) #6, !dbg !265
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !266, metadata !152) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !268, metadata !152) #6, !dbg !269
  store i32 3, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 1), align 8, !dbg !270, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !271, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3), align 8, !dbg !272, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 4), align 4, !dbg !273, !tbaa !187
  %call.i56 = tail call noalias i8* @malloc(i64 6291456) #6, !dbg !274
  store i8* %call.i56, i8** bitcast (%struct.Mat* @b to i8**), align 8, !dbg !275, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !276, metadata !152) #6, !dbg !278
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !279, metadata !152) #6, !dbg !280
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !281, metadata !152) #6, !dbg !282
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !283, metadata !152) #6, !dbg !284
  tail call void @llvm.dbg.value(metadata i32 128, i64 0, metadata !285, metadata !152) #6, !dbg !286
  store i32 3, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 1), align 8, !dbg !287, !tbaa !176
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 2), align 4, !dbg !288, !tbaa !183
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 3), align 8, !dbg !289, !tbaa !185
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 4), align 4, !dbg !290, !tbaa !187
  %call.i59 = tail call noalias i8* @malloc(i64 6291456) #6, !dbg !291
  store i8* %call.i59, i8** bitcast (%struct.Mat* @c to i8**), align 8, !dbg !292, !tbaa !190
  tail call void @llvm.dbg.value(metadata %struct.Mat* @p, i64 0, metadata !293, metadata !152), !dbg !295
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !296, metadata !152), !dbg !297
  %0 = bitcast i8* %call.i to float*
  %1 = bitcast i8* %call.i44 to float*
  %2 = bitcast i8* %call.i47 to float*
  br label %for.body6.lr.ph.us.us.i.preheader, !dbg !298

for.inc29.us.i:                                   ; preds = %vector.body
  %inc30.us.i = add nuw nsw i32 %i.057.us.i, 1, !dbg !305
  tail call void @llvm.dbg.value(metadata i32 %inc30.us.i, i64 0, metadata !296, metadata !152), !dbg !297
  %exitcond576 = icmp eq i32 %i.057.us.i, 63, !dbg !306
  br i1 %exitcond576, label %for.cond4.preheader.lr.ph.i.preheader, label %for.body6.lr.ph.us.us.i.preheader, !dbg !306

for.cond4.preheader.lr.ph.i.preheader:            ; preds = %for.inc29.us.i
  br label %for.cond4.preheader.lr.ph.i, !dbg !307

for.body6.lr.ph.us.us.i.preheader:                ; preds = %for.cond4.preheader.lr.ph.us.i.preheader, %for.inc29.us.i
  %i.057.us.i = phi i32 [ %inc30.us.i, %for.inc29.us.i ], [ 0, %for.cond4.preheader.lr.ph.us.i.preheader ], !dbg !294
  %mul.us.i = mul nsw i32 %i.057.us.i, %i.057.us.i, !dbg !315
  %conv.us.i = sitofp i32 %mul.us.i to float, !dbg !316
  %div.us.us.i = fdiv float %conv.us.i, 3.969000e+03, !dbg !316
  %mul19.us.us.i = shl nsw i32 %i.057.us.i, 6, !dbg !317
  br label %for.body6.lr.ph.us.us.i, !dbg !318

for.body6.lr.ph.us.us.i:                          ; preds = %vector.body, %for.body6.lr.ph.us.us.i.preheader
  %indvars.iv572 = phi i64 [ 0, %for.body6.lr.ph.us.us.i.preheader ], [ %indvars.iv.next573, %vector.body ]
  %3 = trunc i64 %indvars.iv572 to i32, !dbg !317
  %mul2151.us.us.i = add i32 %3, %mul19.us.us.i, !dbg !317
  %add24.us.us.i = shl nsw i32 %mul2151.us.us.i, 7, !dbg !317
  %4 = sext i32 %add24.us.us.i to i64, !dbg !319
  %broadcast.splatinsert580 = insertelement <4 x float> undef, float %div.us.us.i, i32 0
  %broadcast.splat581 = shufflevector <4 x float> %broadcast.splatinsert580, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %for.body6.lr.ph.us.us.i
  %5 = getelementptr inbounds float* %0, i64 %4, !dbg !317
  %6 = bitcast float* %5 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %6, align 4, !dbg !317, !tbaa !320
  %.sum846 = or i64 %4, 4, !dbg !317
  %7 = getelementptr float* %0, i64 %.sum846, !dbg !317
  %8 = bitcast float* %7 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %8, align 4, !dbg !317, !tbaa !320
  %9 = add i64 8, %4, !dbg !317
  %10 = getelementptr inbounds float* %0, i64 %9, !dbg !317
  %11 = bitcast float* %10 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %11, align 4, !dbg !317, !tbaa !320
  %.sum846.1 = or i64 %9, 4, !dbg !317
  %12 = getelementptr float* %0, i64 %.sum846.1, !dbg !317
  %13 = bitcast float* %12 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %13, align 4, !dbg !317, !tbaa !320
  %14 = add i64 16, %4, !dbg !317
  %15 = getelementptr inbounds float* %0, i64 %14, !dbg !317
  %16 = bitcast float* %15 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %16, align 4, !dbg !317, !tbaa !320
  %.sum846.2 = or i64 %14, 4, !dbg !317
  %17 = getelementptr float* %0, i64 %.sum846.2, !dbg !317
  %18 = bitcast float* %17 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %18, align 4, !dbg !317, !tbaa !320
  %19 = add i64 24, %4, !dbg !317
  %20 = getelementptr inbounds float* %0, i64 %19, !dbg !317
  %21 = bitcast float* %20 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %21, align 4, !dbg !317, !tbaa !320
  %.sum846.3 = or i64 %19, 4, !dbg !317
  %22 = getelementptr float* %0, i64 %.sum846.3, !dbg !317
  %23 = bitcast float* %22 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %23, align 4, !dbg !317, !tbaa !320
  %24 = add i64 32, %4, !dbg !317
  %25 = getelementptr inbounds float* %0, i64 %24, !dbg !317
  %26 = bitcast float* %25 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %26, align 4, !dbg !317, !tbaa !320
  %.sum846.4 = or i64 %24, 4, !dbg !317
  %27 = getelementptr float* %0, i64 %.sum846.4, !dbg !317
  %28 = bitcast float* %27 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %28, align 4, !dbg !317, !tbaa !320
  %29 = add i64 40, %4, !dbg !317
  %30 = getelementptr inbounds float* %0, i64 %29, !dbg !317
  %31 = bitcast float* %30 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %31, align 4, !dbg !317, !tbaa !320
  %.sum846.5 = or i64 %29, 4, !dbg !317
  %32 = getelementptr float* %0, i64 %.sum846.5, !dbg !317
  %33 = bitcast float* %32 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %33, align 4, !dbg !317, !tbaa !320
  %34 = add i64 48, %4, !dbg !317
  %35 = getelementptr inbounds float* %0, i64 %34, !dbg !317
  %36 = bitcast float* %35 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %36, align 4, !dbg !317, !tbaa !320
  %.sum846.6 = or i64 %34, 4, !dbg !317
  %37 = getelementptr float* %0, i64 %.sum846.6, !dbg !317
  %38 = bitcast float* %37 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %38, align 4, !dbg !317, !tbaa !320
  %39 = add i64 56, %4, !dbg !317
  %40 = getelementptr inbounds float* %0, i64 %39, !dbg !317
  %41 = bitcast float* %40 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %41, align 4, !dbg !317, !tbaa !320
  %.sum846.7 = or i64 %39, 4, !dbg !317
  %42 = getelementptr float* %0, i64 %.sum846.7, !dbg !317
  %43 = bitcast float* %42 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %43, align 4, !dbg !317, !tbaa !320
  %44 = add i64 64, %4, !dbg !317
  %45 = getelementptr inbounds float* %0, i64 %44, !dbg !317
  %46 = bitcast float* %45 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %46, align 4, !dbg !317, !tbaa !320
  %.sum846.8 = or i64 %44, 4, !dbg !317
  %47 = getelementptr float* %0, i64 %.sum846.8, !dbg !317
  %48 = bitcast float* %47 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %48, align 4, !dbg !317, !tbaa !320
  %49 = add i64 72, %4, !dbg !317
  %50 = getelementptr inbounds float* %0, i64 %49, !dbg !317
  %51 = bitcast float* %50 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %51, align 4, !dbg !317, !tbaa !320
  %.sum846.9 = or i64 %49, 4, !dbg !317
  %52 = getelementptr float* %0, i64 %.sum846.9, !dbg !317
  %53 = bitcast float* %52 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %53, align 4, !dbg !317, !tbaa !320
  %54 = add i64 80, %4, !dbg !317
  %55 = getelementptr inbounds float* %0, i64 %54, !dbg !317
  %56 = bitcast float* %55 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %56, align 4, !dbg !317, !tbaa !320
  %.sum846.10 = or i64 %54, 4, !dbg !317
  %57 = getelementptr float* %0, i64 %.sum846.10, !dbg !317
  %58 = bitcast float* %57 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %58, align 4, !dbg !317, !tbaa !320
  %59 = add i64 88, %4, !dbg !317
  %60 = getelementptr inbounds float* %0, i64 %59, !dbg !317
  %61 = bitcast float* %60 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %61, align 4, !dbg !317, !tbaa !320
  %.sum846.11 = or i64 %59, 4, !dbg !317
  %62 = getelementptr float* %0, i64 %.sum846.11, !dbg !317
  %63 = bitcast float* %62 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %63, align 4, !dbg !317, !tbaa !320
  %64 = add i64 96, %4, !dbg !317
  %65 = getelementptr inbounds float* %0, i64 %64, !dbg !317
  %66 = bitcast float* %65 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %66, align 4, !dbg !317, !tbaa !320
  %.sum846.12 = or i64 %64, 4, !dbg !317
  %67 = getelementptr float* %0, i64 %.sum846.12, !dbg !317
  %68 = bitcast float* %67 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %68, align 4, !dbg !317, !tbaa !320
  %69 = add i64 104, %4, !dbg !317
  %70 = getelementptr inbounds float* %0, i64 %69, !dbg !317
  %71 = bitcast float* %70 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %71, align 4, !dbg !317, !tbaa !320
  %.sum846.13 = or i64 %69, 4, !dbg !317
  %72 = getelementptr float* %0, i64 %.sum846.13, !dbg !317
  %73 = bitcast float* %72 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %73, align 4, !dbg !317, !tbaa !320
  %74 = add i64 112, %4, !dbg !317
  %75 = getelementptr inbounds float* %0, i64 %74, !dbg !317
  %76 = bitcast float* %75 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %76, align 4, !dbg !317, !tbaa !320
  %.sum846.14 = or i64 %74, 4, !dbg !317
  %77 = getelementptr float* %0, i64 %.sum846.14, !dbg !317
  %78 = bitcast float* %77 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %78, align 4, !dbg !317, !tbaa !320
  %79 = add i64 120, %4, !dbg !317
  %80 = getelementptr inbounds float* %0, i64 %79, !dbg !317
  %81 = bitcast float* %80 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %81, align 4, !dbg !317, !tbaa !320
  %.sum846.15 = or i64 %79, 4, !dbg !317
  %82 = getelementptr float* %0, i64 %.sum846.15, !dbg !317
  %83 = bitcast float* %82 to <4 x float>*, !dbg !317
  store <4 x float> %broadcast.splat581, <4 x float>* %83, align 4, !dbg !317, !tbaa !320
  %indvars.iv.next573 = add nuw nsw i64 %indvars.iv572, 1, !dbg !322
  %exitcond575 = icmp eq i32 %3, 63, !dbg !322
  br i1 %exitcond575, label %for.inc29.us.i, label %for.body6.lr.ph.us.us.i, !dbg !322

for.cond4.preheader.lr.ph.i:                      ; preds = %for.cond4.preheader.lr.ph.i.preheader, %for.inc23.i
  %i.049.i = phi i32 [ %inc24.i, %for.inc23.i ], [ 0, %for.cond4.preheader.lr.ph.i.preheader ], !dbg !314
  %mul1141.i = shl i32 %i.049.i, 6, !dbg !307
  br label %for.body6.lr.ph.i, !dbg !323

for.body6.lr.ph.i:                                ; preds = %for.cond4.preheader.lr.ph.i, %vector.body589
  %indvars.iv562 = phi i64 [ %indvars.iv.next563, %vector.body589 ], [ 0, %for.cond4.preheader.lr.ph.i ]
  %84 = trunc i64 %indvars.iv562 to i32, !dbg !307
  %add43.i = add i32 %84, %mul1141.i, !dbg !307
  %add18.i = shl nsw i32 %add43.i, 7, !dbg !307
  %85 = sext i32 %add18.i to i64, !dbg !324
  br label %vector.body589

vector.body589:                                   ; preds = %for.body6.lr.ph.i
  %86 = getelementptr inbounds float* %1, i64 %85, !dbg !307
  %87 = bitcast float* %86 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %87, align 4, !dbg !307, !tbaa !320
  %.sum824847 = or i64 %85, 4, !dbg !307
  %88 = getelementptr float* %1, i64 %.sum824847, !dbg !307
  %89 = bitcast float* %88 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %89, align 4, !dbg !307, !tbaa !320
  %90 = add i64 8, %85, !dbg !307
  %91 = getelementptr inbounds float* %1, i64 %90, !dbg !307
  %92 = bitcast float* %91 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %92, align 4, !dbg !307, !tbaa !320
  %.sum824847.1 = or i64 %90, 4, !dbg !307
  %93 = getelementptr float* %1, i64 %.sum824847.1, !dbg !307
  %94 = bitcast float* %93 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %94, align 4, !dbg !307, !tbaa !320
  %95 = add i64 16, %85, !dbg !307
  %96 = getelementptr inbounds float* %1, i64 %95, !dbg !307
  %97 = bitcast float* %96 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %97, align 4, !dbg !307, !tbaa !320
  %.sum824847.2 = or i64 %95, 4, !dbg !307
  %98 = getelementptr float* %1, i64 %.sum824847.2, !dbg !307
  %99 = bitcast float* %98 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %99, align 4, !dbg !307, !tbaa !320
  %100 = add i64 24, %85, !dbg !307
  %101 = getelementptr inbounds float* %1, i64 %100, !dbg !307
  %102 = bitcast float* %101 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %102, align 4, !dbg !307, !tbaa !320
  %.sum824847.3 = or i64 %100, 4, !dbg !307
  %103 = getelementptr float* %1, i64 %.sum824847.3, !dbg !307
  %104 = bitcast float* %103 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %104, align 4, !dbg !307, !tbaa !320
  %105 = add i64 32, %85, !dbg !307
  %106 = getelementptr inbounds float* %1, i64 %105, !dbg !307
  %107 = bitcast float* %106 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %107, align 4, !dbg !307, !tbaa !320
  %.sum824847.4 = or i64 %105, 4, !dbg !307
  %108 = getelementptr float* %1, i64 %.sum824847.4, !dbg !307
  %109 = bitcast float* %108 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %109, align 4, !dbg !307, !tbaa !320
  %110 = add i64 40, %85, !dbg !307
  %111 = getelementptr inbounds float* %1, i64 %110, !dbg !307
  %112 = bitcast float* %111 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %112, align 4, !dbg !307, !tbaa !320
  %.sum824847.5 = or i64 %110, 4, !dbg !307
  %113 = getelementptr float* %1, i64 %.sum824847.5, !dbg !307
  %114 = bitcast float* %113 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %114, align 4, !dbg !307, !tbaa !320
  %115 = add i64 48, %85, !dbg !307
  %116 = getelementptr inbounds float* %1, i64 %115, !dbg !307
  %117 = bitcast float* %116 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %117, align 4, !dbg !307, !tbaa !320
  %.sum824847.6 = or i64 %115, 4, !dbg !307
  %118 = getelementptr float* %1, i64 %.sum824847.6, !dbg !307
  %119 = bitcast float* %118 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %119, align 4, !dbg !307, !tbaa !320
  %120 = add i64 56, %85, !dbg !307
  %121 = getelementptr inbounds float* %1, i64 %120, !dbg !307
  %122 = bitcast float* %121 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %122, align 4, !dbg !307, !tbaa !320
  %.sum824847.7 = or i64 %120, 4, !dbg !307
  %123 = getelementptr float* %1, i64 %.sum824847.7, !dbg !307
  %124 = bitcast float* %123 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %124, align 4, !dbg !307, !tbaa !320
  %125 = add i64 64, %85, !dbg !307
  %126 = getelementptr inbounds float* %1, i64 %125, !dbg !307
  %127 = bitcast float* %126 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %127, align 4, !dbg !307, !tbaa !320
  %.sum824847.8 = or i64 %125, 4, !dbg !307
  %128 = getelementptr float* %1, i64 %.sum824847.8, !dbg !307
  %129 = bitcast float* %128 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %129, align 4, !dbg !307, !tbaa !320
  %130 = add i64 72, %85, !dbg !307
  %131 = getelementptr inbounds float* %1, i64 %130, !dbg !307
  %132 = bitcast float* %131 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %132, align 4, !dbg !307, !tbaa !320
  %.sum824847.9 = or i64 %130, 4, !dbg !307
  %133 = getelementptr float* %1, i64 %.sum824847.9, !dbg !307
  %134 = bitcast float* %133 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %134, align 4, !dbg !307, !tbaa !320
  %135 = add i64 80, %85, !dbg !307
  %136 = getelementptr inbounds float* %1, i64 %135, !dbg !307
  %137 = bitcast float* %136 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %137, align 4, !dbg !307, !tbaa !320
  %.sum824847.10 = or i64 %135, 4, !dbg !307
  %138 = getelementptr float* %1, i64 %.sum824847.10, !dbg !307
  %139 = bitcast float* %138 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %139, align 4, !dbg !307, !tbaa !320
  %140 = add i64 88, %85, !dbg !307
  %141 = getelementptr inbounds float* %1, i64 %140, !dbg !307
  %142 = bitcast float* %141 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %142, align 4, !dbg !307, !tbaa !320
  %.sum824847.11 = or i64 %140, 4, !dbg !307
  %143 = getelementptr float* %1, i64 %.sum824847.11, !dbg !307
  %144 = bitcast float* %143 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %144, align 4, !dbg !307, !tbaa !320
  %145 = add i64 96, %85, !dbg !307
  %146 = getelementptr inbounds float* %1, i64 %145, !dbg !307
  %147 = bitcast float* %146 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %147, align 4, !dbg !307, !tbaa !320
  %.sum824847.12 = or i64 %145, 4, !dbg !307
  %148 = getelementptr float* %1, i64 %.sum824847.12, !dbg !307
  %149 = bitcast float* %148 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %149, align 4, !dbg !307, !tbaa !320
  %150 = add i64 104, %85, !dbg !307
  %151 = getelementptr inbounds float* %1, i64 %150, !dbg !307
  %152 = bitcast float* %151 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %152, align 4, !dbg !307, !tbaa !320
  %.sum824847.13 = or i64 %150, 4, !dbg !307
  %153 = getelementptr float* %1, i64 %.sum824847.13, !dbg !307
  %154 = bitcast float* %153 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %154, align 4, !dbg !307, !tbaa !320
  %155 = add i64 112, %85, !dbg !307
  %156 = getelementptr inbounds float* %1, i64 %155, !dbg !307
  %157 = bitcast float* %156 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %157, align 4, !dbg !307, !tbaa !320
  %.sum824847.14 = or i64 %155, 4, !dbg !307
  %158 = getelementptr float* %1, i64 %.sum824847.14, !dbg !307
  %159 = bitcast float* %158 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %159, align 4, !dbg !307, !tbaa !320
  %160 = add i64 120, %85, !dbg !307
  %161 = getelementptr inbounds float* %1, i64 %160, !dbg !307
  %162 = bitcast float* %161 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %162, align 4, !dbg !307, !tbaa !320
  %.sum824847.15 = or i64 %160, 4, !dbg !307
  %163 = getelementptr float* %1, i64 %.sum824847.15, !dbg !307
  %164 = bitcast float* %163 to <4 x float>*, !dbg !307
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %164, align 4, !dbg !307, !tbaa !320
  %indvars.iv.next563 = add nuw nsw i64 %indvars.iv562, 1, !dbg !323
  %exitcond565 = icmp eq i32 %84, 63, !dbg !323
  br i1 %exitcond565, label %for.inc23.i, label %for.body6.lr.ph.i, !dbg !323

for.inc23.i:                                      ; preds = %vector.body589
  %inc24.i = add nuw nsw i32 %i.049.i, 1, !dbg !325
  tail call void @llvm.dbg.value(metadata i32 %inc24.i, i64 0, metadata !326, metadata !152), !dbg !327
  %exitcond566 = icmp eq i32 %i.049.i, 63, !dbg !328
  br i1 %exitcond566, label %for.cond4.preheader.lr.ph.i73.preheader, label %for.cond4.preheader.lr.ph.i, !dbg !328

for.cond4.preheader.lr.ph.i73.preheader:          ; preds = %for.inc23.i
  br label %for.cond4.preheader.lr.ph.i73, !dbg !329

for.cond4.preheader.lr.ph.i73:                    ; preds = %for.cond4.preheader.lr.ph.i73.preheader, %for.inc23.i92
  %i.049.i70 = phi i32 [ %inc24.i90, %for.inc23.i92 ], [ 0, %for.cond4.preheader.lr.ph.i73.preheader ], !dbg !330
  %165 = shl i32 %i.049.i70, 13, !dbg !329
  br label %for.inc20.i89, !dbg !329

for.inc20.i89:                                    ; preds = %for.inc20.i89, %for.cond4.preheader.lr.ph.i73
  %indvars.iv552 = phi i64 [ 0, %for.cond4.preheader.lr.ph.i73 ], [ %indvars.iv.next553.3, %for.inc20.i89 ]
  %166 = trunc i64 %indvars.iv552 to i32, !dbg !331
  %167 = shl i32 %166, 7, !dbg !331
  %168 = add nuw nsw i32 %165, %167, !dbg !331
  %169 = sext i32 %168 to i64
  %scevgep550 = getelementptr float* %2, i64 %169
  %scevgep550551 = bitcast float* %scevgep550 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551, i8 0, i64 512, i32 4, i1 false), !dbg !332
  %indvars.iv.next553 = add nuw nsw i64 %indvars.iv552, 1, !dbg !329
  %170 = trunc i64 %indvars.iv.next553 to i32, !dbg !331
  %171 = shl i32 %170, 7, !dbg !331
  %172 = add nuw nsw i32 %165, %171, !dbg !331
  %173 = sext i32 %172 to i64
  %scevgep550.1 = getelementptr float* %2, i64 %173
  %scevgep550551.1 = bitcast float* %scevgep550.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551.1, i8 0, i64 512, i32 4, i1 false), !dbg !332
  %indvars.iv.next553.1 = add nuw nsw i64 %indvars.iv.next553, 1, !dbg !329
  %174 = trunc i64 %indvars.iv.next553.1 to i32, !dbg !331
  %175 = shl i32 %174, 7, !dbg !331
  %176 = add nuw nsw i32 %165, %175, !dbg !331
  %177 = sext i32 %176 to i64
  %scevgep550.2 = getelementptr float* %2, i64 %177
  %scevgep550551.2 = bitcast float* %scevgep550.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551.2, i8 0, i64 512, i32 4, i1 false), !dbg !332
  %indvars.iv.next553.2 = add nuw nsw i64 %indvars.iv.next553.1, 1, !dbg !329
  %178 = trunc i64 %indvars.iv.next553.2 to i32, !dbg !331
  %179 = shl i32 %178, 7, !dbg !331
  %180 = add nuw nsw i32 %165, %179, !dbg !331
  %181 = sext i32 %180 to i64
  %scevgep550.3 = getelementptr float* %2, i64 %181
  %scevgep550551.3 = bitcast float* %scevgep550.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551.3, i8 0, i64 512, i32 4, i1 false), !dbg !332
  %indvars.iv.next553.3 = add nuw nsw i64 %indvars.iv.next553.2, 1, !dbg !329
  %exitcond555.3 = icmp eq i32 %178, 63, !dbg !329
  br i1 %exitcond555.3, label %for.inc23.i92, label %for.inc20.i89, !dbg !329

for.inc23.i92:                                    ; preds = %for.inc20.i89
  %inc24.i90 = add nuw nsw i32 %i.049.i70, 1, !dbg !333
  tail call void @llvm.dbg.value(metadata i32 %inc24.i90, i64 0, metadata !334, metadata !152), !dbg !335
  %exitcond556 = icmp eq i32 %i.049.i70, 63, !dbg !336
  br i1 %exitcond556, label %mat_set.exit93, label %for.cond4.preheader.lr.ph.i73, !dbg !336

mat_set.exit93:                                   ; preds = %for.inc23.i92
  %.pre = load i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 2), align 4, !dbg !337, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk2, i64 0, metadata !339, metadata !152), !dbg !340
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !341, metadata !152), !dbg !342
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !343, metadata !152), !dbg !344
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !345, metadata !152), !dbg !346
  %cmp48.i97 = icmp sgt i32 %.pre, 0, !dbg !347
  br i1 %cmp48.i97, label %for.cond1.preheader.lr.ph.i99, label %mat_set.exit123, !dbg !348

for.cond1.preheader.lr.ph.i99:                    ; preds = %mat_set.exit93
  %182 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 3) to i64*), align 8, !dbg !349
  %183 = trunc i64 %182 to i32, !dbg !349
  %cmp246.i98 = icmp sgt i32 %183, 0, !dbg !350
  %184 = lshr i64 %182, 32
  %185 = trunc i64 %184 to i32
  %cmp544.i102 = icmp sgt i32 %185, 0, !dbg !351
  %186 = load float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !352, !tbaa !190
  %187 = mul i32 %183, %185, !dbg !353
  %188 = shl nuw nsw i64 %184, 2, !dbg !348
  %189 = add nuw nsw i64 %188, 17179869180, !dbg !348
  %190 = and i64 %189, 17179869180, !dbg !348
  %191 = add nuw nsw i64 %190, 4, !dbg !348
  %192 = add i32 %183, -1, !dbg !348
  %193 = add i32 %.pre, -1, !dbg !348
  %194 = trunc i64 %182 to i32
  br label %for.cond1.preheader.i101, !dbg !348

for.cond1.preheader.i101:                         ; preds = %for.inc23.i122, %for.cond1.preheader.lr.ph.i99
  %i.049.i100 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i99 ], [ %inc24.i120, %for.inc23.i122 ], !dbg !338
  %195 = mul i32 %187, %i.049.i100, !dbg !353
  br i1 %cmp246.i98, label %for.cond4.preheader.i105.preheader, label %for.inc23.i122, !dbg !353

for.cond4.preheader.i105.preheader:               ; preds = %for.cond1.preheader.i101
  %xtraiter893 = and i32 %194, 1
  %lcmp.mod894 = icmp ne i32 %xtraiter893, 0
  %lcmp.overflow895 = icmp eq i32 %194, 0
  %lcmp.or896 = or i1 %lcmp.overflow895, %lcmp.mod894
  br i1 %lcmp.or896, label %for.cond4.preheader.i105.prol.preheader, label %for.cond4.preheader.i105.preheader.split

for.cond4.preheader.i105.prol.preheader:          ; preds = %for.cond4.preheader.i105.preheader
  br label %for.cond4.preheader.i105.prol, !dbg !354

for.cond4.preheader.i105.prol:                    ; preds = %for.cond4.preheader.i105.prol.preheader, %for.inc20.i119.prol
  %indvars.iv540.prol = phi i64 [ %indvars.iv.next541.prol, %for.inc20.i119.prol ], [ 0, %for.cond4.preheader.i105.prol.preheader ]
  %prol.iter897 = phi i32 [ %prol.iter897.sub, %for.inc20.i119.prol ], [ %xtraiter893, %for.cond4.preheader.i105.prol.preheader ]
  %196 = trunc i64 %indvars.iv540.prol to i32, !dbg !354
  br i1 %cmp544.i102, label %for.body6.lr.ph.i108.prol, label %for.inc20.i119.prol, !dbg !354

for.body6.lr.ph.i108.prol:                        ; preds = %for.cond4.preheader.i105.prol
  %197 = mul i32 %185, %196, !dbg !354
  %198 = add i32 %195, %197, !dbg !354
  %199 = sext i32 %198 to i64
  %scevgep538.prol = getelementptr float* %186, i64 %199
  %scevgep538539.prol = bitcast float* %scevgep538.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep538539.prol, i8 0, i64 %191, i32 4, i1 false), !dbg !352
  br label %for.inc20.i119.prol

for.inc20.i119.prol:                              ; preds = %for.body6.lr.ph.i108.prol, %for.cond4.preheader.i105.prol
  %indvars.iv.next541.prol = add nuw nsw i64 %indvars.iv540.prol, 1, !dbg !353
  %exitcond543.prol = icmp eq i32 %196, %192, !dbg !353
  %prol.iter897.sub = sub i32 %prol.iter897, 1, !dbg !353
  %prol.iter897.cmp = icmp ne i32 %prol.iter897.sub, 0, !dbg !353
  br i1 %prol.iter897.cmp, label %for.cond4.preheader.i105.prol, label %for.cond4.preheader.i105.preheader.split.loopexit, !llvm.loop !355

for.cond4.preheader.i105.preheader.split.loopexit: ; preds = %for.inc20.i119.prol
  %indvars.iv540.unr.ph = phi i64 [ %indvars.iv.next541.prol, %for.inc20.i119.prol ]
  br label %for.cond4.preheader.i105.preheader.split

for.cond4.preheader.i105.preheader.split:         ; preds = %for.cond4.preheader.i105.preheader.split.loopexit, %for.cond4.preheader.i105.preheader
  %indvars.iv540.unr = phi i64 [ 0, %for.cond4.preheader.i105.preheader ], [ %indvars.iv540.unr.ph, %for.cond4.preheader.i105.preheader.split.loopexit ]
  %200 = icmp ult i32 %194, 2
  br i1 %200, label %for.inc23.i122.loopexit, label %for.cond4.preheader.i105.preheader.split.split

for.cond4.preheader.i105.preheader.split.split:   ; preds = %for.cond4.preheader.i105.preheader.split
  br label %for.cond4.preheader.i105, !dbg !354

for.cond4.preheader.i105:                         ; preds = %for.inc20.i119.1, %for.cond4.preheader.i105.preheader.split.split
  %indvars.iv540 = phi i64 [ %indvars.iv540.unr, %for.cond4.preheader.i105.preheader.split.split ], [ %indvars.iv.next541.1, %for.inc20.i119.1 ]
  %201 = trunc i64 %indvars.iv540 to i32, !dbg !354
  br i1 %cmp544.i102, label %for.body6.lr.ph.i108, label %for.inc20.i119, !dbg !354

for.body6.lr.ph.i108:                             ; preds = %for.cond4.preheader.i105
  %202 = mul i32 %185, %201, !dbg !354
  %203 = add i32 %195, %202, !dbg !354
  %204 = sext i32 %203 to i64
  %scevgep538 = getelementptr float* %186, i64 %204
  %scevgep538539 = bitcast float* %scevgep538 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep538539, i8 0, i64 %191, i32 4, i1 false), !dbg !352
  br label %for.inc20.i119

for.inc20.i119:                                   ; preds = %for.body6.lr.ph.i108, %for.cond4.preheader.i105
  %indvars.iv.next541 = add nuw nsw i64 %indvars.iv540, 1, !dbg !353
  %205 = trunc i64 %indvars.iv.next541 to i32, !dbg !354
  br i1 %cmp544.i102, label %for.body6.lr.ph.i108.1, label %for.inc20.i119.1, !dbg !354

for.inc23.i122.loopexit.unr-lcssa:                ; preds = %for.inc20.i119.1
  br label %for.inc23.i122.loopexit

for.inc23.i122.loopexit:                          ; preds = %for.cond4.preheader.i105.preheader.split, %for.inc23.i122.loopexit.unr-lcssa
  br label %for.inc23.i122

for.inc23.i122:                                   ; preds = %for.inc23.i122.loopexit, %for.cond1.preheader.i101
  %inc24.i120 = add nuw nsw i32 %i.049.i100, 1, !dbg !357
  tail call void @llvm.dbg.value(metadata i32 %inc24.i120, i64 0, metadata !345, metadata !152), !dbg !346
  %exitcond544 = icmp eq i32 %i.049.i100, %193, !dbg !348
  br i1 %exitcond544, label %mat_set.exit123.loopexit, label %for.cond1.preheader.i101, !dbg !348

mat_set.exit123.loopexit:                         ; preds = %for.inc23.i122
  br label %mat_set.exit123

mat_set.exit123:                                  ; preds = %mat_set.exit123.loopexit, %mat_set.exit93
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !358, metadata !152), !dbg !360
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !361, metadata !152), !dbg !362
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !363, metadata !152), !dbg !364
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !365, metadata !152), !dbg !366
  %206 = load i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 2), align 4, !dbg !367, !tbaa !183
  %cmp48.i127 = icmp sgt i32 %206, 0, !dbg !368
  br i1 %cmp48.i127, label %for.cond1.preheader.lr.ph.i129, label %mat_set.exit246, !dbg !369

for.cond1.preheader.lr.ph.i129:                   ; preds = %mat_set.exit123
  %207 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 3) to i64*), align 8, !dbg !370
  %208 = trunc i64 %207 to i32, !dbg !370
  %cmp246.i128 = icmp sgt i32 %208, 0, !dbg !371
  %209 = lshr i64 %207, 32
  %210 = trunc i64 %209 to i32
  %cmp544.i132 = icmp sgt i32 %210, 0, !dbg !372
  %211 = load float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !373, !tbaa !190
  %212 = add i32 %210, -1, !dbg !369
  %213 = add i32 %208, -1, !dbg !369
  %214 = add i32 %206, -1, !dbg !369
  %215 = lshr i64 %207, 32, !dbg !369
  %216 = add nuw nsw i64 %215, 4294967295, !dbg !369
  %217 = and i64 %216, 4294967295
  %218 = add nuw nsw i64 %217, 1, !dbg !369
  %219 = trunc i64 %215 to i32
  br label %for.cond1.preheader.i131, !dbg !369

for.cond1.preheader.i131:                         ; preds = %for.inc23.i152, %for.cond1.preheader.lr.ph.i129
  %i.049.i130 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i129 ], [ %inc24.i150, %for.inc23.i152 ], !dbg !359
  br i1 %cmp246.i128, label %for.cond4.preheader.lr.ph.i133, label %for.inc23.i152, !dbg !374

for.cond4.preheader.lr.ph.i133:                   ; preds = %for.cond1.preheader.i131
  %mul1141.i136 = mul i32 %i.049.i130, %208, !dbg !373
  br label %for.cond4.preheader.i135, !dbg !374

for.cond4.preheader.i135:                         ; preds = %for.inc20.i149, %for.cond4.preheader.lr.ph.i133
  %indvars.iv528 = phi i64 [ %indvars.iv.next529, %for.inc20.i149 ], [ 0, %for.cond4.preheader.lr.ph.i133 ]
  %220 = trunc i64 %indvars.iv528 to i32, !dbg !373
  br i1 %cmp544.i132, label %for.body6.lr.ph.i138, label %for.inc20.i149, !dbg !375

for.body6.lr.ph.i138:                             ; preds = %for.cond4.preheader.i135
  %add43.i137 = add i32 %220, %mul1141.i136, !dbg !373
  %add18.i140 = mul nsw i32 %add43.i137, %210, !dbg !373
  %221 = sext i32 %add18.i140 to i64, !dbg !375
  %end.idx = add nuw nsw i64 %217, 1, !dbg !375
  %n.mod.vf = and i64 %215, 7, !dbg !375
  %n.vec = sub nsw i64 %218, %n.mod.vf, !dbg !375
  %cmp.zero = icmp eq i64 %218, %n.mod.vf, !dbg !375
  br i1 %cmp.zero, label %middle.block614, label %vector.body613.preheader

vector.body613.preheader:                         ; preds = %for.body6.lr.ph.i138
  br label %vector.body613, !dbg !373

vector.body613:                                   ; preds = %vector.body613.preheader, %vector.body613
  %index616 = phi i64 [ %index.next623, %vector.body613 ], [ 0, %vector.body613.preheader ], !dbg !375
  %222 = add i64 %index616, %221, !dbg !373
  %223 = getelementptr inbounds float* %211, i64 %222, !dbg !373
  %224 = bitcast float* %223 to <4 x float>*, !dbg !373
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %224, align 4, !dbg !373, !tbaa !320
  %.sum845 = add i64 %222, 4, !dbg !373
  %225 = getelementptr float* %211, i64 %.sum845, !dbg !373
  %226 = bitcast float* %225 to <4 x float>*, !dbg !373
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %226, align 4, !dbg !373, !tbaa !320
  %index.next623 = add i64 %index616, 8, !dbg !375
  %227 = icmp eq i64 %index.next623, %n.vec, !dbg !375
  br i1 %227, label %middle.block614.loopexit, label %vector.body613, !dbg !375, !llvm.loop !376

middle.block614.loopexit:                         ; preds = %vector.body613
  br label %middle.block614

middle.block614:                                  ; preds = %middle.block614.loopexit, %for.body6.lr.ph.i138
  %resume.val618 = phi i64 [ 0, %for.body6.lr.ph.i138 ], [ %n.vec, %middle.block614.loopexit ]
  %cmp.n622 = icmp eq i64 %end.idx, %resume.val618
  br i1 %cmp.n622, label %for.inc20.i149, label %for.body6.i146.preheader

for.body6.i146.preheader:                         ; preds = %middle.block614
  %228 = trunc i64 %resume.val618 to i32
  %229 = sub i32 %219, %228
  %xtraiter888 = and i32 %229, 3
  %lcmp.mod889 = icmp ne i32 %xtraiter888, 0
  %lcmp.overflow890 = icmp eq i32 %229, 0
  %lcmp.or891 = or i1 %lcmp.overflow890, %lcmp.mod889
  br i1 %lcmp.or891, label %for.body6.i146.prol.preheader, label %for.body6.i146.preheader.split

for.body6.i146.prol.preheader:                    ; preds = %for.body6.i146.preheader
  br label %for.body6.i146.prol, !dbg !373

for.body6.i146.prol:                              ; preds = %for.body6.i146.prol.preheader, %for.body6.i146.prol
  %indvars.iv523.prol = phi i64 [ %indvars.iv.next524.prol, %for.body6.i146.prol ], [ %resume.val618, %for.body6.i146.prol.preheader ]
  %prol.iter892 = phi i32 [ %prol.iter892.sub, %for.body6.i146.prol ], [ %xtraiter888, %for.body6.i146.prol.preheader ]
  %230 = add nsw i64 %indvars.iv523.prol, %221, !dbg !373
  %arrayidx.i143.prol = getelementptr inbounds float* %211, i64 %230, !dbg !373
  store float 1.000000e+00, float* %arrayidx.i143.prol, align 4, !dbg !373, !tbaa !320
  %indvars.iv.next524.prol = add nuw nsw i64 %indvars.iv523.prol, 1, !dbg !375
  %lftr.wideiv526.prol = trunc i64 %indvars.iv523.prol to i32, !dbg !375
  %exitcond527.prol = icmp eq i32 %lftr.wideiv526.prol, %212, !dbg !375
  %prol.iter892.sub = sub i32 %prol.iter892, 1, !dbg !375
  %prol.iter892.cmp = icmp ne i32 %prol.iter892.sub, 0, !dbg !375
  br i1 %prol.iter892.cmp, label %for.body6.i146.prol, label %for.body6.i146.preheader.split.loopexit, !llvm.loop !379

for.body6.i146.preheader.split.loopexit:          ; preds = %for.body6.i146.prol
  %indvars.iv523.unr.ph = phi i64 [ %indvars.iv.next524.prol, %for.body6.i146.prol ]
  br label %for.body6.i146.preheader.split

for.body6.i146.preheader.split:                   ; preds = %for.body6.i146.preheader.split.loopexit, %for.body6.i146.preheader
  %indvars.iv523.unr = phi i64 [ %resume.val618, %for.body6.i146.preheader ], [ %indvars.iv523.unr.ph, %for.body6.i146.preheader.split.loopexit ]
  %231 = icmp ult i32 %229, 4
  br i1 %231, label %for.inc20.i149.loopexit, label %for.body6.i146.preheader.split.split

for.body6.i146.preheader.split.split:             ; preds = %for.body6.i146.preheader.split
  br label %for.body6.i146, !dbg !373

for.body6.i146:                                   ; preds = %for.body6.i146, %for.body6.i146.preheader.split.split
  %indvars.iv523 = phi i64 [ %indvars.iv523.unr, %for.body6.i146.preheader.split.split ], [ %indvars.iv.next524.3, %for.body6.i146 ]
  %232 = add nsw i64 %indvars.iv523, %221, !dbg !373
  %arrayidx.i143 = getelementptr inbounds float* %211, i64 %232, !dbg !373
  store float 1.000000e+00, float* %arrayidx.i143, align 4, !dbg !373, !tbaa !320
  %indvars.iv.next524 = add nuw nsw i64 %indvars.iv523, 1, !dbg !375
  %lftr.wideiv526 = trunc i64 %indvars.iv523 to i32, !dbg !375
  %233 = add nsw i64 %indvars.iv.next524, %221, !dbg !373
  %arrayidx.i143.1 = getelementptr inbounds float* %211, i64 %233, !dbg !373
  store float 1.000000e+00, float* %arrayidx.i143.1, align 4, !dbg !373, !tbaa !320
  %indvars.iv.next524.1 = add nuw nsw i64 %indvars.iv.next524, 1, !dbg !375
  %lftr.wideiv526.1 = trunc i64 %indvars.iv.next524 to i32, !dbg !375
  %234 = add nsw i64 %indvars.iv.next524.1, %221, !dbg !373
  %arrayidx.i143.2 = getelementptr inbounds float* %211, i64 %234, !dbg !373
  store float 1.000000e+00, float* %arrayidx.i143.2, align 4, !dbg !373, !tbaa !320
  %indvars.iv.next524.2 = add nuw nsw i64 %indvars.iv.next524.1, 1, !dbg !375
  %lftr.wideiv526.2 = trunc i64 %indvars.iv.next524.1 to i32, !dbg !375
  %235 = add nsw i64 %indvars.iv.next524.2, %221, !dbg !373
  %arrayidx.i143.3 = getelementptr inbounds float* %211, i64 %235, !dbg !373
  store float 1.000000e+00, float* %arrayidx.i143.3, align 4, !dbg !373, !tbaa !320
  %indvars.iv.next524.3 = add nuw nsw i64 %indvars.iv.next524.2, 1, !dbg !375
  %lftr.wideiv526.3 = trunc i64 %indvars.iv.next524.2 to i32, !dbg !375
  %exitcond527.3 = icmp eq i32 %lftr.wideiv526.3, %212, !dbg !375
  br i1 %exitcond527.3, label %for.inc20.i149.loopexit.unr-lcssa, label %for.body6.i146, !dbg !375, !llvm.loop !380

for.inc20.i149.loopexit.unr-lcssa:                ; preds = %for.body6.i146
  br label %for.inc20.i149.loopexit

for.inc20.i149.loopexit:                          ; preds = %for.body6.i146.preheader.split, %for.inc20.i149.loopexit.unr-lcssa
  br label %for.inc20.i149

for.inc20.i149:                                   ; preds = %for.inc20.i149.loopexit, %middle.block614, %for.cond4.preheader.i135
  %indvars.iv.next529 = add nuw nsw i64 %indvars.iv528, 1, !dbg !374
  %exitcond531 = icmp eq i32 %220, %213, !dbg !374
  br i1 %exitcond531, label %for.inc23.i152.loopexit, label %for.cond4.preheader.i135, !dbg !374

for.inc23.i152.loopexit:                          ; preds = %for.inc20.i149
  br label %for.inc23.i152

for.inc23.i152:                                   ; preds = %for.inc23.i152.loopexit, %for.cond1.preheader.i131
  %inc24.i150 = add nuw nsw i32 %i.049.i130, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i32 %inc24.i150, i64 0, metadata !365, metadata !152), !dbg !366
  %exitcond532 = icmp eq i32 %i.049.i130, %214, !dbg !369
  br i1 %exitcond532, label %for.cond1.preheader.i161.preheader, label %for.cond1.preheader.i131, !dbg !369

for.cond1.preheader.i161.preheader:               ; preds = %for.inc23.i152
  %236 = lshr i64 %207, 32, !dbg !382
  %237 = add nuw nsw i64 %236, 4294967295, !dbg !382
  %238 = and i64 %237, 4294967295
  %239 = add nuw nsw i64 %238, 1, !dbg !382
  %240 = trunc i64 %236 to i32
  br label %for.cond1.preheader.i161, !dbg !382

for.cond1.preheader.i161:                         ; preds = %for.cond1.preheader.i161.preheader, %for.inc23.i182
  %i.049.i160 = phi i32 [ %inc24.i180, %for.inc23.i182 ], [ 0, %for.cond1.preheader.i161.preheader ], !dbg !383
  br i1 %cmp246.i128, label %for.cond4.preheader.lr.ph.i163, label %for.inc23.i182, !dbg !382

for.cond4.preheader.lr.ph.i163:                   ; preds = %for.cond1.preheader.i161
  %mul942.i = add i32 %i.049.i160, %206, !dbg !384
  %mul1141.i166 = mul i32 %mul942.i, %208, !dbg !384
  br label %for.cond4.preheader.i165, !dbg !382

for.cond4.preheader.i165:                         ; preds = %for.inc20.i179, %for.cond4.preheader.lr.ph.i163
  %indvars.iv518 = phi i64 [ %indvars.iv.next519, %for.inc20.i179 ], [ 0, %for.cond4.preheader.lr.ph.i163 ]
  %241 = trunc i64 %indvars.iv518 to i32, !dbg !384
  br i1 %cmp544.i132, label %for.body6.lr.ph.i168, label %for.inc20.i179, !dbg !385

for.body6.lr.ph.i168:                             ; preds = %for.cond4.preheader.i165
  %add43.i167 = add i32 %241, %mul1141.i166, !dbg !384
  %add18.i170 = mul nsw i32 %add43.i167, %210, !dbg !384
  %242 = sext i32 %add18.i170 to i64, !dbg !385
  %end.idx643 = add nuw nsw i64 %238, 1, !dbg !385
  %n.mod.vf644 = and i64 %236, 7, !dbg !385
  %n.vec645 = sub nsw i64 %239, %n.mod.vf644, !dbg !385
  %cmp.zero647 = icmp eq i64 %239, %n.mod.vf644, !dbg !385
  br i1 %cmp.zero647, label %middle.block640, label %vector.body639.preheader

vector.body639.preheader:                         ; preds = %for.body6.lr.ph.i168
  br label %vector.body639, !dbg !384

vector.body639:                                   ; preds = %vector.body639.preheader, %vector.body639
  %index642 = phi i64 [ %index.next654, %vector.body639 ], [ 0, %vector.body639.preheader ], !dbg !385
  %243 = add i64 %index642, %242, !dbg !384
  %244 = getelementptr inbounds float* %211, i64 %243, !dbg !384
  %245 = bitcast float* %244 to <4 x float>*, !dbg !384
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %245, align 4, !dbg !384, !tbaa !320
  %.sum842 = add i64 %243, 4, !dbg !384
  %246 = getelementptr float* %211, i64 %.sum842, !dbg !384
  %247 = bitcast float* %246 to <4 x float>*, !dbg !384
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %247, align 4, !dbg !384, !tbaa !320
  %index.next654 = add i64 %index642, 8, !dbg !385
  %248 = icmp eq i64 %index.next654, %n.vec645, !dbg !385
  br i1 %248, label %middle.block640.loopexit, label %vector.body639, !dbg !385, !llvm.loop !386

middle.block640.loopexit:                         ; preds = %vector.body639
  br label %middle.block640

middle.block640:                                  ; preds = %middle.block640.loopexit, %for.body6.lr.ph.i168
  %resume.val649 = phi i64 [ 0, %for.body6.lr.ph.i168 ], [ %n.vec645, %middle.block640.loopexit ]
  %cmp.n653 = icmp eq i64 %end.idx643, %resume.val649
  br i1 %cmp.n653, label %for.inc20.i179, label %for.body6.i176.preheader

for.body6.i176.preheader:                         ; preds = %middle.block640
  %249 = trunc i64 %resume.val649 to i32
  %250 = sub i32 %240, %249
  %xtraiter883 = and i32 %250, 3
  %lcmp.mod884 = icmp ne i32 %xtraiter883, 0
  %lcmp.overflow885 = icmp eq i32 %250, 0
  %lcmp.or886 = or i1 %lcmp.overflow885, %lcmp.mod884
  br i1 %lcmp.or886, label %for.body6.i176.prol.preheader, label %for.body6.i176.preheader.split

for.body6.i176.prol.preheader:                    ; preds = %for.body6.i176.preheader
  br label %for.body6.i176.prol, !dbg !384

for.body6.i176.prol:                              ; preds = %for.body6.i176.prol.preheader, %for.body6.i176.prol
  %indvars.iv513.prol = phi i64 [ %indvars.iv.next514.prol, %for.body6.i176.prol ], [ %resume.val649, %for.body6.i176.prol.preheader ]
  %prol.iter887 = phi i32 [ %prol.iter887.sub, %for.body6.i176.prol ], [ %xtraiter883, %for.body6.i176.prol.preheader ]
  %251 = add nsw i64 %indvars.iv513.prol, %242, !dbg !384
  %arrayidx.i173.prol = getelementptr inbounds float* %211, i64 %251, !dbg !384
  store float 1.000000e+00, float* %arrayidx.i173.prol, align 4, !dbg !384, !tbaa !320
  %indvars.iv.next514.prol = add nuw nsw i64 %indvars.iv513.prol, 1, !dbg !385
  %lftr.wideiv516.prol = trunc i64 %indvars.iv513.prol to i32, !dbg !385
  %exitcond517.prol = icmp eq i32 %lftr.wideiv516.prol, %212, !dbg !385
  %prol.iter887.sub = sub i32 %prol.iter887, 1, !dbg !385
  %prol.iter887.cmp = icmp ne i32 %prol.iter887.sub, 0, !dbg !385
  br i1 %prol.iter887.cmp, label %for.body6.i176.prol, label %for.body6.i176.preheader.split.loopexit, !llvm.loop !387

for.body6.i176.preheader.split.loopexit:          ; preds = %for.body6.i176.prol
  %indvars.iv513.unr.ph = phi i64 [ %indvars.iv.next514.prol, %for.body6.i176.prol ]
  br label %for.body6.i176.preheader.split

for.body6.i176.preheader.split:                   ; preds = %for.body6.i176.preheader.split.loopexit, %for.body6.i176.preheader
  %indvars.iv513.unr = phi i64 [ %resume.val649, %for.body6.i176.preheader ], [ %indvars.iv513.unr.ph, %for.body6.i176.preheader.split.loopexit ]
  %252 = icmp ult i32 %250, 4
  br i1 %252, label %for.inc20.i179.loopexit, label %for.body6.i176.preheader.split.split

for.body6.i176.preheader.split.split:             ; preds = %for.body6.i176.preheader.split
  br label %for.body6.i176, !dbg !384

for.body6.i176:                                   ; preds = %for.body6.i176, %for.body6.i176.preheader.split.split
  %indvars.iv513 = phi i64 [ %indvars.iv513.unr, %for.body6.i176.preheader.split.split ], [ %indvars.iv.next514.3, %for.body6.i176 ]
  %253 = add nsw i64 %indvars.iv513, %242, !dbg !384
  %arrayidx.i173 = getelementptr inbounds float* %211, i64 %253, !dbg !384
  store float 1.000000e+00, float* %arrayidx.i173, align 4, !dbg !384, !tbaa !320
  %indvars.iv.next514 = add nuw nsw i64 %indvars.iv513, 1, !dbg !385
  %lftr.wideiv516 = trunc i64 %indvars.iv513 to i32, !dbg !385
  %254 = add nsw i64 %indvars.iv.next514, %242, !dbg !384
  %arrayidx.i173.1 = getelementptr inbounds float* %211, i64 %254, !dbg !384
  store float 1.000000e+00, float* %arrayidx.i173.1, align 4, !dbg !384, !tbaa !320
  %indvars.iv.next514.1 = add nuw nsw i64 %indvars.iv.next514, 1, !dbg !385
  %lftr.wideiv516.1 = trunc i64 %indvars.iv.next514 to i32, !dbg !385
  %255 = add nsw i64 %indvars.iv.next514.1, %242, !dbg !384
  %arrayidx.i173.2 = getelementptr inbounds float* %211, i64 %255, !dbg !384
  store float 1.000000e+00, float* %arrayidx.i173.2, align 4, !dbg !384, !tbaa !320
  %indvars.iv.next514.2 = add nuw nsw i64 %indvars.iv.next514.1, 1, !dbg !385
  %lftr.wideiv516.2 = trunc i64 %indvars.iv.next514.1 to i32, !dbg !385
  %256 = add nsw i64 %indvars.iv.next514.2, %242, !dbg !384
  %arrayidx.i173.3 = getelementptr inbounds float* %211, i64 %256, !dbg !384
  store float 1.000000e+00, float* %arrayidx.i173.3, align 4, !dbg !384, !tbaa !320
  %indvars.iv.next514.3 = add nuw nsw i64 %indvars.iv.next514.2, 1, !dbg !385
  %lftr.wideiv516.3 = trunc i64 %indvars.iv.next514.2 to i32, !dbg !385
  %exitcond517.3 = icmp eq i32 %lftr.wideiv516.3, %212, !dbg !385
  br i1 %exitcond517.3, label %for.inc20.i179.loopexit.unr-lcssa, label %for.body6.i176, !dbg !385, !llvm.loop !388

for.inc20.i179.loopexit.unr-lcssa:                ; preds = %for.body6.i176
  br label %for.inc20.i179.loopexit

for.inc20.i179.loopexit:                          ; preds = %for.body6.i176.preheader.split, %for.inc20.i179.loopexit.unr-lcssa
  br label %for.inc20.i179

for.inc20.i179:                                   ; preds = %for.inc20.i179.loopexit, %middle.block640, %for.cond4.preheader.i165
  %indvars.iv.next519 = add nuw nsw i64 %indvars.iv518, 1, !dbg !382
  %exitcond521 = icmp eq i32 %241, %213, !dbg !382
  br i1 %exitcond521, label %for.inc23.i182.loopexit, label %for.cond4.preheader.i165, !dbg !382

for.inc23.i182.loopexit:                          ; preds = %for.inc20.i179
  br label %for.inc23.i182

for.inc23.i182:                                   ; preds = %for.inc23.i182.loopexit, %for.cond1.preheader.i161
  %inc24.i180 = add nuw nsw i32 %i.049.i160, 1, !dbg !389
  tail call void @llvm.dbg.value(metadata i32 %inc24.i180, i64 0, metadata !390, metadata !152), !dbg !391
  %exitcond522 = icmp eq i32 %i.049.i160, %214, !dbg !392
  br i1 %exitcond522, label %for.cond1.preheader.lr.ph.i189, label %for.cond1.preheader.i161, !dbg !392

for.cond1.preheader.lr.ph.i189:                   ; preds = %for.inc23.i182
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !393, metadata !152), !dbg !395
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !396, metadata !152), !dbg !397
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !398, metadata !152), !dbg !399
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !400, metadata !152), !dbg !401
  %mul.i = shl i32 %206, 1, !dbg !402
  %257 = lshr i64 %207, 32, !dbg !403
  %258 = add nuw nsw i64 %257, 4294967295, !dbg !403
  %259 = and i64 %258, 4294967295
  %260 = add nuw nsw i64 %259, 1, !dbg !403
  %261 = trunc i64 %257 to i32
  br label %for.cond1.preheader.i191, !dbg !403

for.cond1.preheader.i191:                         ; preds = %for.inc23.i213, %for.cond1.preheader.lr.ph.i189
  %i.049.i190 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i189 ], [ %inc24.i211, %for.inc23.i213 ], !dbg !394
  br i1 %cmp246.i128, label %for.cond4.preheader.lr.ph.i193, label %for.inc23.i213, !dbg !404

for.cond4.preheader.lr.ph.i193:                   ; preds = %for.cond1.preheader.i191
  %mul942.i196 = add i32 %i.049.i190, %mul.i, !dbg !402
  %mul1141.i197 = mul i32 %mul942.i196, %208, !dbg !402
  br label %for.cond4.preheader.i195, !dbg !404

for.cond4.preheader.i195:                         ; preds = %for.inc20.i210, %for.cond4.preheader.lr.ph.i193
  %indvars.iv508 = phi i64 [ %indvars.iv.next509, %for.inc20.i210 ], [ 0, %for.cond4.preheader.lr.ph.i193 ]
  %262 = trunc i64 %indvars.iv508 to i32, !dbg !402
  br i1 %cmp544.i132, label %for.body6.lr.ph.i199, label %for.inc20.i210, !dbg !405

for.body6.lr.ph.i199:                             ; preds = %for.cond4.preheader.i195
  %add43.i198 = add i32 %262, %mul1141.i197, !dbg !402
  %add18.i201 = mul nsw i32 %add43.i198, %210, !dbg !402
  %263 = sext i32 %add18.i201 to i64, !dbg !405
  %end.idx674 = add nuw nsw i64 %259, 1, !dbg !405
  %n.mod.vf675 = and i64 %257, 7, !dbg !405
  %n.vec676 = sub nsw i64 %260, %n.mod.vf675, !dbg !405
  %cmp.zero678 = icmp eq i64 %260, %n.mod.vf675, !dbg !405
  br i1 %cmp.zero678, label %middle.block671, label %vector.body670.preheader

vector.body670.preheader:                         ; preds = %for.body6.lr.ph.i199
  br label %vector.body670, !dbg !402

vector.body670:                                   ; preds = %vector.body670.preheader, %vector.body670
  %index673 = phi i64 [ %index.next685, %vector.body670 ], [ 0, %vector.body670.preheader ], !dbg !405
  %264 = add i64 %index673, %263, !dbg !402
  %265 = getelementptr inbounds float* %211, i64 %264, !dbg !402
  %266 = bitcast float* %265 to <4 x float>*, !dbg !402
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %266, align 4, !dbg !402, !tbaa !320
  %.sum839 = add i64 %264, 4, !dbg !402
  %267 = getelementptr float* %211, i64 %.sum839, !dbg !402
  %268 = bitcast float* %267 to <4 x float>*, !dbg !402
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %268, align 4, !dbg !402, !tbaa !320
  %index.next685 = add i64 %index673, 8, !dbg !405
  %269 = icmp eq i64 %index.next685, %n.vec676, !dbg !405
  br i1 %269, label %middle.block671.loopexit, label %vector.body670, !dbg !405, !llvm.loop !406

middle.block671.loopexit:                         ; preds = %vector.body670
  br label %middle.block671

middle.block671:                                  ; preds = %middle.block671.loopexit, %for.body6.lr.ph.i199
  %resume.val680 = phi i64 [ 0, %for.body6.lr.ph.i199 ], [ %n.vec676, %middle.block671.loopexit ]
  %cmp.n684 = icmp eq i64 %end.idx674, %resume.val680
  br i1 %cmp.n684, label %for.inc20.i210, label %for.body6.i207.preheader

for.body6.i207.preheader:                         ; preds = %middle.block671
  %270 = trunc i64 %resume.val680 to i32
  %271 = sub i32 %261, %270
  %xtraiter878 = and i32 %271, 3
  %lcmp.mod879 = icmp ne i32 %xtraiter878, 0
  %lcmp.overflow880 = icmp eq i32 %271, 0
  %lcmp.or881 = or i1 %lcmp.overflow880, %lcmp.mod879
  br i1 %lcmp.or881, label %for.body6.i207.prol.preheader, label %for.body6.i207.preheader.split

for.body6.i207.prol.preheader:                    ; preds = %for.body6.i207.preheader
  br label %for.body6.i207.prol, !dbg !402

for.body6.i207.prol:                              ; preds = %for.body6.i207.prol.preheader, %for.body6.i207.prol
  %indvars.iv503.prol = phi i64 [ %indvars.iv.next504.prol, %for.body6.i207.prol ], [ %resume.val680, %for.body6.i207.prol.preheader ]
  %prol.iter882 = phi i32 [ %prol.iter882.sub, %for.body6.i207.prol ], [ %xtraiter878, %for.body6.i207.prol.preheader ]
  %272 = add nsw i64 %indvars.iv503.prol, %263, !dbg !402
  %arrayidx.i204.prol = getelementptr inbounds float* %211, i64 %272, !dbg !402
  store float 1.000000e+00, float* %arrayidx.i204.prol, align 4, !dbg !402, !tbaa !320
  %indvars.iv.next504.prol = add nuw nsw i64 %indvars.iv503.prol, 1, !dbg !405
  %lftr.wideiv506.prol = trunc i64 %indvars.iv503.prol to i32, !dbg !405
  %exitcond507.prol = icmp eq i32 %lftr.wideiv506.prol, %212, !dbg !405
  %prol.iter882.sub = sub i32 %prol.iter882, 1, !dbg !405
  %prol.iter882.cmp = icmp ne i32 %prol.iter882.sub, 0, !dbg !405
  br i1 %prol.iter882.cmp, label %for.body6.i207.prol, label %for.body6.i207.preheader.split.loopexit, !llvm.loop !407

for.body6.i207.preheader.split.loopexit:          ; preds = %for.body6.i207.prol
  %indvars.iv503.unr.ph = phi i64 [ %indvars.iv.next504.prol, %for.body6.i207.prol ]
  br label %for.body6.i207.preheader.split

for.body6.i207.preheader.split:                   ; preds = %for.body6.i207.preheader.split.loopexit, %for.body6.i207.preheader
  %indvars.iv503.unr = phi i64 [ %resume.val680, %for.body6.i207.preheader ], [ %indvars.iv503.unr.ph, %for.body6.i207.preheader.split.loopexit ]
  %273 = icmp ult i32 %271, 4
  br i1 %273, label %for.inc20.i210.loopexit, label %for.body6.i207.preheader.split.split

for.body6.i207.preheader.split.split:             ; preds = %for.body6.i207.preheader.split
  br label %for.body6.i207, !dbg !402

for.body6.i207:                                   ; preds = %for.body6.i207, %for.body6.i207.preheader.split.split
  %indvars.iv503 = phi i64 [ %indvars.iv503.unr, %for.body6.i207.preheader.split.split ], [ %indvars.iv.next504.3, %for.body6.i207 ]
  %274 = add nsw i64 %indvars.iv503, %263, !dbg !402
  %arrayidx.i204 = getelementptr inbounds float* %211, i64 %274, !dbg !402
  store float 1.000000e+00, float* %arrayidx.i204, align 4, !dbg !402, !tbaa !320
  %indvars.iv.next504 = add nuw nsw i64 %indvars.iv503, 1, !dbg !405
  %lftr.wideiv506 = trunc i64 %indvars.iv503 to i32, !dbg !405
  %275 = add nsw i64 %indvars.iv.next504, %263, !dbg !402
  %arrayidx.i204.1 = getelementptr inbounds float* %211, i64 %275, !dbg !402
  store float 1.000000e+00, float* %arrayidx.i204.1, align 4, !dbg !402, !tbaa !320
  %indvars.iv.next504.1 = add nuw nsw i64 %indvars.iv.next504, 1, !dbg !405
  %lftr.wideiv506.1 = trunc i64 %indvars.iv.next504 to i32, !dbg !405
  %276 = add nsw i64 %indvars.iv.next504.1, %263, !dbg !402
  %arrayidx.i204.2 = getelementptr inbounds float* %211, i64 %276, !dbg !402
  store float 1.000000e+00, float* %arrayidx.i204.2, align 4, !dbg !402, !tbaa !320
  %indvars.iv.next504.2 = add nuw nsw i64 %indvars.iv.next504.1, 1, !dbg !405
  %lftr.wideiv506.2 = trunc i64 %indvars.iv.next504.1 to i32, !dbg !405
  %277 = add nsw i64 %indvars.iv.next504.2, %263, !dbg !402
  %arrayidx.i204.3 = getelementptr inbounds float* %211, i64 %277, !dbg !402
  store float 1.000000e+00, float* %arrayidx.i204.3, align 4, !dbg !402, !tbaa !320
  %indvars.iv.next504.3 = add nuw nsw i64 %indvars.iv.next504.2, 1, !dbg !405
  %lftr.wideiv506.3 = trunc i64 %indvars.iv.next504.2 to i32, !dbg !405
  %exitcond507.3 = icmp eq i32 %lftr.wideiv506.3, %212, !dbg !405
  br i1 %exitcond507.3, label %for.inc20.i210.loopexit.unr-lcssa, label %for.body6.i207, !dbg !405, !llvm.loop !408

for.inc20.i210.loopexit.unr-lcssa:                ; preds = %for.body6.i207
  br label %for.inc20.i210.loopexit

for.inc20.i210.loopexit:                          ; preds = %for.body6.i207.preheader.split, %for.inc20.i210.loopexit.unr-lcssa
  br label %for.inc20.i210

for.inc20.i210:                                   ; preds = %for.inc20.i210.loopexit, %middle.block671, %for.cond4.preheader.i195
  %indvars.iv.next509 = add nuw nsw i64 %indvars.iv508, 1, !dbg !404
  %exitcond511 = icmp eq i32 %262, %213, !dbg !404
  br i1 %exitcond511, label %for.inc23.i213.loopexit, label %for.cond4.preheader.i195, !dbg !404

for.inc23.i213.loopexit:                          ; preds = %for.inc20.i210
  br label %for.inc23.i213

for.inc23.i213:                                   ; preds = %for.inc23.i213.loopexit, %for.cond1.preheader.i191
  %inc24.i211 = add nuw nsw i32 %i.049.i190, 1, !dbg !409
  tail call void @llvm.dbg.value(metadata i32 %inc24.i211, i64 0, metadata !400, metadata !152), !dbg !401
  %exitcond512 = icmp eq i32 %i.049.i190, %214, !dbg !403
  br i1 %exitcond512, label %for.cond1.preheader.lr.ph.i220, label %for.cond1.preheader.i191, !dbg !403

for.cond1.preheader.lr.ph.i220:                   ; preds = %for.inc23.i213
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !410, metadata !152), !dbg !412
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !413, metadata !152), !dbg !414
  tail call void @llvm.dbg.value(metadata float 0x3FC5555560000000, i64 0, metadata !415, metadata !152), !dbg !416
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !417, metadata !152), !dbg !418
  %mul.i227 = mul nsw i32 %206, 3, !dbg !419
  %278 = lshr i64 %207, 32, !dbg !420
  %279 = add nuw nsw i64 %278, 4294967295, !dbg !420
  %280 = and i64 %279, 4294967295
  %281 = add nuw nsw i64 %280, 1, !dbg !420
  %282 = trunc i64 %278 to i32
  br label %for.cond1.preheader.i222, !dbg !420

for.cond1.preheader.i222:                         ; preds = %for.inc23.i245, %for.cond1.preheader.lr.ph.i220
  %i.049.i221 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i220 ], [ %inc24.i243, %for.inc23.i245 ], !dbg !411
  br i1 %cmp246.i128, label %for.cond4.preheader.lr.ph.i224, label %for.inc23.i245, !dbg !421

for.cond4.preheader.lr.ph.i224:                   ; preds = %for.cond1.preheader.i222
  %mul942.i228 = add i32 %i.049.i221, %mul.i227, !dbg !419
  %mul1141.i229 = mul i32 %mul942.i228, %208, !dbg !419
  br label %for.cond4.preheader.i226, !dbg !421

for.cond4.preheader.i226:                         ; preds = %for.inc20.i242, %for.cond4.preheader.lr.ph.i224
  %indvars.iv498 = phi i64 [ %indvars.iv.next499, %for.inc20.i242 ], [ 0, %for.cond4.preheader.lr.ph.i224 ]
  %283 = trunc i64 %indvars.iv498 to i32, !dbg !419
  br i1 %cmp544.i132, label %for.body6.lr.ph.i231, label %for.inc20.i242, !dbg !422

for.body6.lr.ph.i231:                             ; preds = %for.cond4.preheader.i226
  %add43.i230 = add i32 %283, %mul1141.i229, !dbg !419
  %add18.i233 = mul nsw i32 %add43.i230, %210, !dbg !419
  %284 = sext i32 %add18.i233 to i64, !dbg !422
  %end.idx705 = add nuw nsw i64 %280, 1, !dbg !422
  %n.mod.vf706 = and i64 %278, 7, !dbg !422
  %n.vec707 = sub nsw i64 %281, %n.mod.vf706, !dbg !422
  %cmp.zero709 = icmp eq i64 %281, %n.mod.vf706, !dbg !422
  br i1 %cmp.zero709, label %middle.block702, label %vector.body701.preheader

vector.body701.preheader:                         ; preds = %for.body6.lr.ph.i231
  br label %vector.body701, !dbg !419

vector.body701:                                   ; preds = %vector.body701.preheader, %vector.body701
  %index704 = phi i64 [ %index.next716, %vector.body701 ], [ 0, %vector.body701.preheader ], !dbg !422
  %285 = add i64 %index704, %284, !dbg !419
  %286 = getelementptr inbounds float* %211, i64 %285, !dbg !419
  %287 = bitcast float* %286 to <4 x float>*, !dbg !419
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %287, align 4, !dbg !419, !tbaa !320
  %.sum836 = add i64 %285, 4, !dbg !419
  %288 = getelementptr float* %211, i64 %.sum836, !dbg !419
  %289 = bitcast float* %288 to <4 x float>*, !dbg !419
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %289, align 4, !dbg !419, !tbaa !320
  %index.next716 = add i64 %index704, 8, !dbg !422
  %290 = icmp eq i64 %index.next716, %n.vec707, !dbg !422
  br i1 %290, label %middle.block702.loopexit, label %vector.body701, !dbg !422, !llvm.loop !423

middle.block702.loopexit:                         ; preds = %vector.body701
  br label %middle.block702

middle.block702:                                  ; preds = %middle.block702.loopexit, %for.body6.lr.ph.i231
  %resume.val711 = phi i64 [ 0, %for.body6.lr.ph.i231 ], [ %n.vec707, %middle.block702.loopexit ]
  %cmp.n715 = icmp eq i64 %end.idx705, %resume.val711
  br i1 %cmp.n715, label %for.inc20.i242, label %for.body6.i239.preheader

for.body6.i239.preheader:                         ; preds = %middle.block702
  %291 = trunc i64 %resume.val711 to i32
  %292 = sub i32 %282, %291
  %xtraiter873 = and i32 %292, 3
  %lcmp.mod874 = icmp ne i32 %xtraiter873, 0
  %lcmp.overflow875 = icmp eq i32 %292, 0
  %lcmp.or876 = or i1 %lcmp.overflow875, %lcmp.mod874
  br i1 %lcmp.or876, label %for.body6.i239.prol.preheader, label %for.body6.i239.preheader.split

for.body6.i239.prol.preheader:                    ; preds = %for.body6.i239.preheader
  br label %for.body6.i239.prol, !dbg !419

for.body6.i239.prol:                              ; preds = %for.body6.i239.prol.preheader, %for.body6.i239.prol
  %indvars.iv493.prol = phi i64 [ %indvars.iv.next494.prol, %for.body6.i239.prol ], [ %resume.val711, %for.body6.i239.prol.preheader ]
  %prol.iter877 = phi i32 [ %prol.iter877.sub, %for.body6.i239.prol ], [ %xtraiter873, %for.body6.i239.prol.preheader ]
  %293 = add nsw i64 %indvars.iv493.prol, %284, !dbg !419
  %arrayidx.i236.prol = getelementptr inbounds float* %211, i64 %293, !dbg !419
  store float 0x3FC5555560000000, float* %arrayidx.i236.prol, align 4, !dbg !419, !tbaa !320
  %indvars.iv.next494.prol = add nuw nsw i64 %indvars.iv493.prol, 1, !dbg !422
  %lftr.wideiv496.prol = trunc i64 %indvars.iv493.prol to i32, !dbg !422
  %exitcond497.prol = icmp eq i32 %lftr.wideiv496.prol, %212, !dbg !422
  %prol.iter877.sub = sub i32 %prol.iter877, 1, !dbg !422
  %prol.iter877.cmp = icmp ne i32 %prol.iter877.sub, 0, !dbg !422
  br i1 %prol.iter877.cmp, label %for.body6.i239.prol, label %for.body6.i239.preheader.split.loopexit, !llvm.loop !424

for.body6.i239.preheader.split.loopexit:          ; preds = %for.body6.i239.prol
  %indvars.iv493.unr.ph = phi i64 [ %indvars.iv.next494.prol, %for.body6.i239.prol ]
  br label %for.body6.i239.preheader.split

for.body6.i239.preheader.split:                   ; preds = %for.body6.i239.preheader.split.loopexit, %for.body6.i239.preheader
  %indvars.iv493.unr = phi i64 [ %resume.val711, %for.body6.i239.preheader ], [ %indvars.iv493.unr.ph, %for.body6.i239.preheader.split.loopexit ]
  %294 = icmp ult i32 %292, 4
  br i1 %294, label %for.inc20.i242.loopexit, label %for.body6.i239.preheader.split.split

for.body6.i239.preheader.split.split:             ; preds = %for.body6.i239.preheader.split
  br label %for.body6.i239, !dbg !419

for.body6.i239:                                   ; preds = %for.body6.i239, %for.body6.i239.preheader.split.split
  %indvars.iv493 = phi i64 [ %indvars.iv493.unr, %for.body6.i239.preheader.split.split ], [ %indvars.iv.next494.3, %for.body6.i239 ]
  %295 = add nsw i64 %indvars.iv493, %284, !dbg !419
  %arrayidx.i236 = getelementptr inbounds float* %211, i64 %295, !dbg !419
  store float 0x3FC5555560000000, float* %arrayidx.i236, align 4, !dbg !419, !tbaa !320
  %indvars.iv.next494 = add nuw nsw i64 %indvars.iv493, 1, !dbg !422
  %lftr.wideiv496 = trunc i64 %indvars.iv493 to i32, !dbg !422
  %296 = add nsw i64 %indvars.iv.next494, %284, !dbg !419
  %arrayidx.i236.1 = getelementptr inbounds float* %211, i64 %296, !dbg !419
  store float 0x3FC5555560000000, float* %arrayidx.i236.1, align 4, !dbg !419, !tbaa !320
  %indvars.iv.next494.1 = add nuw nsw i64 %indvars.iv.next494, 1, !dbg !422
  %lftr.wideiv496.1 = trunc i64 %indvars.iv.next494 to i32, !dbg !422
  %297 = add nsw i64 %indvars.iv.next494.1, %284, !dbg !419
  %arrayidx.i236.2 = getelementptr inbounds float* %211, i64 %297, !dbg !419
  store float 0x3FC5555560000000, float* %arrayidx.i236.2, align 4, !dbg !419, !tbaa !320
  %indvars.iv.next494.2 = add nuw nsw i64 %indvars.iv.next494.1, 1, !dbg !422
  %lftr.wideiv496.2 = trunc i64 %indvars.iv.next494.1 to i32, !dbg !422
  %298 = add nsw i64 %indvars.iv.next494.2, %284, !dbg !419
  %arrayidx.i236.3 = getelementptr inbounds float* %211, i64 %298, !dbg !419
  store float 0x3FC5555560000000, float* %arrayidx.i236.3, align 4, !dbg !419, !tbaa !320
  %indvars.iv.next494.3 = add nuw nsw i64 %indvars.iv.next494.2, 1, !dbg !422
  %lftr.wideiv496.3 = trunc i64 %indvars.iv.next494.2 to i32, !dbg !422
  %exitcond497.3 = icmp eq i32 %lftr.wideiv496.3, %212, !dbg !422
  br i1 %exitcond497.3, label %for.inc20.i242.loopexit.unr-lcssa, label %for.body6.i239, !dbg !422, !llvm.loop !425

for.inc20.i242.loopexit.unr-lcssa:                ; preds = %for.body6.i239
  br label %for.inc20.i242.loopexit

for.inc20.i242.loopexit:                          ; preds = %for.body6.i239.preheader.split, %for.inc20.i242.loopexit.unr-lcssa
  br label %for.inc20.i242

for.inc20.i242:                                   ; preds = %for.inc20.i242.loopexit, %middle.block702, %for.cond4.preheader.i226
  %indvars.iv.next499 = add nuw nsw i64 %indvars.iv498, 1, !dbg !421
  %exitcond501 = icmp eq i32 %283, %213, !dbg !421
  br i1 %exitcond501, label %for.inc23.i245.loopexit, label %for.cond4.preheader.i226, !dbg !421

for.inc23.i245.loopexit:                          ; preds = %for.inc20.i242
  br label %for.inc23.i245

for.inc23.i245:                                   ; preds = %for.inc23.i245.loopexit, %for.cond1.preheader.i222
  %inc24.i243 = add nuw nsw i32 %i.049.i221, 1, !dbg !426
  tail call void @llvm.dbg.value(metadata i32 %inc24.i243, i64 0, metadata !417, metadata !152), !dbg !418
  %exitcond502 = icmp eq i32 %i.049.i221, %214, !dbg !420
  br i1 %exitcond502, label %mat_set.exit246.loopexit, label %for.cond1.preheader.i222, !dbg !420

mat_set.exit246.loopexit:                         ; preds = %for.inc23.i245
  br label %mat_set.exit246

mat_set.exit246:                                  ; preds = %mat_set.exit246.loopexit, %mat_set.exit123
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !427, metadata !152), !dbg !429
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !430, metadata !152), !dbg !431
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !432, metadata !152), !dbg !433
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !434, metadata !152), !dbg !435
  %299 = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !436, !tbaa !183
  %cmp48.i247 = icmp sgt i32 %299, 0, !dbg !437
  br i1 %cmp48.i247, label %for.cond1.preheader.lr.ph.i249, label %mat_set.exit386, !dbg !438

for.cond1.preheader.lr.ph.i249:                   ; preds = %mat_set.exit246
  %300 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !439
  %301 = trunc i64 %300 to i32, !dbg !439
  %cmp246.i248 = icmp sgt i32 %301, 0, !dbg !440
  %302 = lshr i64 %300, 32
  %303 = trunc i64 %302 to i32
  %cmp544.i252 = icmp sgt i32 %303, 0, !dbg !441
  %304 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !442, !tbaa !190
  %305 = mul i32 %301, %303, !dbg !443
  %306 = shl nuw nsw i64 %302, 2, !dbg !438
  %307 = add nuw nsw i64 %306, 17179869180, !dbg !438
  %308 = and i64 %307, 17179869180, !dbg !438
  %309 = add nuw nsw i64 %308, 4, !dbg !438
  %310 = add i32 %301, -1, !dbg !438
  %311 = add i32 %299, -1, !dbg !438
  %312 = trunc i64 %300 to i32
  br label %for.cond1.preheader.i251, !dbg !438

for.cond1.preheader.i251:                         ; preds = %for.inc23.i272, %for.cond1.preheader.lr.ph.i249
  %i.049.i250 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i249 ], [ %inc24.i270, %for.inc23.i272 ], !dbg !428
  %313 = mul i32 %305, %i.049.i250, !dbg !443
  br i1 %cmp246.i248, label %for.cond4.preheader.i255.preheader, label %for.inc23.i272, !dbg !443

for.cond4.preheader.i255.preheader:               ; preds = %for.cond1.preheader.i251
  %xtraiter868 = and i32 %312, 1
  %lcmp.mod869 = icmp ne i32 %xtraiter868, 0
  %lcmp.overflow870 = icmp eq i32 %312, 0
  %lcmp.or871 = or i1 %lcmp.overflow870, %lcmp.mod869
  br i1 %lcmp.or871, label %for.cond4.preheader.i255.prol.preheader, label %for.cond4.preheader.i255.preheader.split

for.cond4.preheader.i255.prol.preheader:          ; preds = %for.cond4.preheader.i255.preheader
  br label %for.cond4.preheader.i255.prol, !dbg !444

for.cond4.preheader.i255.prol:                    ; preds = %for.cond4.preheader.i255.prol.preheader, %for.inc20.i269.prol
  %indvars.iv488.prol = phi i64 [ %indvars.iv.next489.prol, %for.inc20.i269.prol ], [ 0, %for.cond4.preheader.i255.prol.preheader ]
  %prol.iter872 = phi i32 [ %prol.iter872.sub, %for.inc20.i269.prol ], [ %xtraiter868, %for.cond4.preheader.i255.prol.preheader ]
  %314 = trunc i64 %indvars.iv488.prol to i32, !dbg !444
  br i1 %cmp544.i252, label %for.body6.lr.ph.i258.prol, label %for.inc20.i269.prol, !dbg !444

for.body6.lr.ph.i258.prol:                        ; preds = %for.cond4.preheader.i255.prol
  %315 = mul i32 %303, %314, !dbg !444
  %316 = add i32 %313, %315, !dbg !444
  %317 = sext i32 %316 to i64
  %scevgep486.prol = getelementptr float* %304, i64 %317
  %scevgep486487.prol = bitcast float* %scevgep486.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487.prol, i8 0, i64 %309, i32 4, i1 false), !dbg !442
  br label %for.inc20.i269.prol

for.inc20.i269.prol:                              ; preds = %for.body6.lr.ph.i258.prol, %for.cond4.preheader.i255.prol
  %indvars.iv.next489.prol = add nuw nsw i64 %indvars.iv488.prol, 1, !dbg !443
  %exitcond491.prol = icmp eq i32 %314, %310, !dbg !443
  %prol.iter872.sub = sub i32 %prol.iter872, 1, !dbg !443
  %prol.iter872.cmp = icmp ne i32 %prol.iter872.sub, 0, !dbg !443
  br i1 %prol.iter872.cmp, label %for.cond4.preheader.i255.prol, label %for.cond4.preheader.i255.preheader.split.loopexit, !llvm.loop !445

for.cond4.preheader.i255.preheader.split.loopexit: ; preds = %for.inc20.i269.prol
  %indvars.iv488.unr.ph = phi i64 [ %indvars.iv.next489.prol, %for.inc20.i269.prol ]
  br label %for.cond4.preheader.i255.preheader.split

for.cond4.preheader.i255.preheader.split:         ; preds = %for.cond4.preheader.i255.preheader.split.loopexit, %for.cond4.preheader.i255.preheader
  %indvars.iv488.unr = phi i64 [ 0, %for.cond4.preheader.i255.preheader ], [ %indvars.iv488.unr.ph, %for.cond4.preheader.i255.preheader.split.loopexit ]
  %318 = icmp ult i32 %312, 2
  br i1 %318, label %for.inc23.i272.loopexit, label %for.cond4.preheader.i255.preheader.split.split

for.cond4.preheader.i255.preheader.split.split:   ; preds = %for.cond4.preheader.i255.preheader.split
  br label %for.cond4.preheader.i255, !dbg !444

for.cond4.preheader.i255:                         ; preds = %for.inc20.i269.1, %for.cond4.preheader.i255.preheader.split.split
  %indvars.iv488 = phi i64 [ %indvars.iv488.unr, %for.cond4.preheader.i255.preheader.split.split ], [ %indvars.iv.next489.1, %for.inc20.i269.1 ]
  %319 = trunc i64 %indvars.iv488 to i32, !dbg !444
  br i1 %cmp544.i252, label %for.body6.lr.ph.i258, label %for.inc20.i269, !dbg !444

for.body6.lr.ph.i258:                             ; preds = %for.cond4.preheader.i255
  %320 = mul i32 %303, %319, !dbg !444
  %321 = add i32 %313, %320, !dbg !444
  %322 = sext i32 %321 to i64
  %scevgep486 = getelementptr float* %304, i64 %322
  %scevgep486487 = bitcast float* %scevgep486 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487, i8 0, i64 %309, i32 4, i1 false), !dbg !442
  br label %for.inc20.i269

for.inc20.i269:                                   ; preds = %for.body6.lr.ph.i258, %for.cond4.preheader.i255
  %indvars.iv.next489 = add nuw nsw i64 %indvars.iv488, 1, !dbg !443
  %323 = trunc i64 %indvars.iv.next489 to i32, !dbg !444
  br i1 %cmp544.i252, label %for.body6.lr.ph.i258.1, label %for.inc20.i269.1, !dbg !444

for.inc23.i272.loopexit.unr-lcssa:                ; preds = %for.inc20.i269.1
  br label %for.inc23.i272.loopexit

for.inc23.i272.loopexit:                          ; preds = %for.cond4.preheader.i255.preheader.split, %for.inc23.i272.loopexit.unr-lcssa
  br label %for.inc23.i272

for.inc23.i272:                                   ; preds = %for.inc23.i272.loopexit, %for.cond1.preheader.i251
  %inc24.i270 = add nuw nsw i32 %i.049.i250, 1, !dbg !446
  tail call void @llvm.dbg.value(metadata i32 %inc24.i270, i64 0, metadata !434, metadata !152), !dbg !435
  %exitcond492 = icmp eq i32 %i.049.i250, %311, !dbg !438
  br i1 %exitcond492, label %mat_set.exit273, label %for.cond1.preheader.i251, !dbg !438

mat_set.exit273:                                  ; preds = %for.inc23.i272
  %.pr420 = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !447, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !449, metadata !152), !dbg !450
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !451, metadata !152), !dbg !452
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !453, metadata !152), !dbg !454
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !455, metadata !152), !dbg !456
  %cmp48.i387 = icmp sgt i32 %.pr420, 0, !dbg !457
  br i1 %cmp48.i387, label %for.cond1.preheader.lr.ph.i389, label %mat_set.exit386, !dbg !458

for.cond1.preheader.lr.ph.i389:                   ; preds = %mat_set.exit273
  %324 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !459
  %325 = trunc i64 %324 to i32, !dbg !459
  %cmp246.i388 = icmp sgt i32 %325, 0, !dbg !460
  %326 = lshr i64 %324, 32
  %327 = trunc i64 %326 to i32
  %cmp544.i392 = icmp sgt i32 %327, 0, !dbg !461
  %328 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !462, !tbaa !190
  %329 = mul i32 %325, %327, !dbg !463
  %330 = mul i32 %.pr420, %325, !dbg !458
  %331 = mul i32 %330, %327, !dbg !458
  %332 = shl nuw nsw i64 %326, 2, !dbg !458
  %333 = add nuw nsw i64 %332, 17179869180, !dbg !458
  %334 = and i64 %333, 17179869180, !dbg !458
  %335 = add nuw nsw i64 %334, 4, !dbg !458
  %336 = add i32 %325, -1, !dbg !458
  %337 = add i32 %.pr420, -1, !dbg !458
  %338 = trunc i64 %324 to i32
  br label %for.cond1.preheader.i391, !dbg !458

for.cond1.preheader.i391:                         ; preds = %for.inc23.i413, %for.cond1.preheader.lr.ph.i389
  %i.049.i390 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i389 ], [ %inc24.i411, %for.inc23.i413 ], !dbg !448
  %339 = mul i32 %329, %i.049.i390, !dbg !463
  %340 = add i32 %331, %339, !dbg !463
  br i1 %cmp246.i388, label %for.cond4.preheader.i395.preheader, label %for.inc23.i413, !dbg !463

for.cond4.preheader.i395.preheader:               ; preds = %for.cond1.preheader.i391
  %xtraiter863 = and i32 %338, 1
  %lcmp.mod864 = icmp ne i32 %xtraiter863, 0
  %lcmp.overflow865 = icmp eq i32 %338, 0
  %lcmp.or866 = or i1 %lcmp.overflow865, %lcmp.mod864
  br i1 %lcmp.or866, label %for.cond4.preheader.i395.prol.preheader, label %for.cond4.preheader.i395.preheader.split

for.cond4.preheader.i395.prol.preheader:          ; preds = %for.cond4.preheader.i395.preheader
  br label %for.cond4.preheader.i395.prol, !dbg !464

for.cond4.preheader.i395.prol:                    ; preds = %for.cond4.preheader.i395.prol.preheader, %for.inc20.i410.prol
  %indvars.iv476.prol = phi i64 [ %indvars.iv.next477.prol, %for.inc20.i410.prol ], [ 0, %for.cond4.preheader.i395.prol.preheader ]
  %prol.iter867 = phi i32 [ %prol.iter867.sub, %for.inc20.i410.prol ], [ %xtraiter863, %for.cond4.preheader.i395.prol.preheader ]
  %341 = trunc i64 %indvars.iv476.prol to i32, !dbg !464
  br i1 %cmp544.i392, label %for.body6.lr.ph.i399.prol, label %for.inc20.i410.prol, !dbg !464

for.body6.lr.ph.i399.prol:                        ; preds = %for.cond4.preheader.i395.prol
  %342 = mul i32 %327, %341, !dbg !464
  %343 = add i32 %340, %342, !dbg !464
  %344 = sext i32 %343 to i64
  %scevgep474.prol = getelementptr float* %328, i64 %344
  %scevgep474475.prol = bitcast float* %scevgep474.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep474475.prol, i8 0, i64 %335, i32 4, i1 false), !dbg !462
  br label %for.inc20.i410.prol

for.inc20.i410.prol:                              ; preds = %for.body6.lr.ph.i399.prol, %for.cond4.preheader.i395.prol
  %indvars.iv.next477.prol = add nuw nsw i64 %indvars.iv476.prol, 1, !dbg !463
  %exitcond479.prol = icmp eq i32 %341, %336, !dbg !463
  %prol.iter867.sub = sub i32 %prol.iter867, 1, !dbg !463
  %prol.iter867.cmp = icmp ne i32 %prol.iter867.sub, 0, !dbg !463
  br i1 %prol.iter867.cmp, label %for.cond4.preheader.i395.prol, label %for.cond4.preheader.i395.preheader.split.loopexit, !llvm.loop !465

for.cond4.preheader.i395.preheader.split.loopexit: ; preds = %for.inc20.i410.prol
  %indvars.iv476.unr.ph = phi i64 [ %indvars.iv.next477.prol, %for.inc20.i410.prol ]
  br label %for.cond4.preheader.i395.preheader.split

for.cond4.preheader.i395.preheader.split:         ; preds = %for.cond4.preheader.i395.preheader.split.loopexit, %for.cond4.preheader.i395.preheader
  %indvars.iv476.unr = phi i64 [ 0, %for.cond4.preheader.i395.preheader ], [ %indvars.iv476.unr.ph, %for.cond4.preheader.i395.preheader.split.loopexit ]
  %345 = icmp ult i32 %338, 2
  br i1 %345, label %for.inc23.i413.loopexit, label %for.cond4.preheader.i395.preheader.split.split

for.cond4.preheader.i395.preheader.split.split:   ; preds = %for.cond4.preheader.i395.preheader.split
  br label %for.cond4.preheader.i395, !dbg !464

for.cond4.preheader.i395:                         ; preds = %for.inc20.i410.1, %for.cond4.preheader.i395.preheader.split.split
  %indvars.iv476 = phi i64 [ %indvars.iv476.unr, %for.cond4.preheader.i395.preheader.split.split ], [ %indvars.iv.next477.1, %for.inc20.i410.1 ]
  %346 = trunc i64 %indvars.iv476 to i32, !dbg !464
  br i1 %cmp544.i392, label %for.body6.lr.ph.i399, label %for.inc20.i410, !dbg !464

for.body6.lr.ph.i399:                             ; preds = %for.cond4.preheader.i395
  %347 = mul i32 %327, %346, !dbg !464
  %348 = add i32 %340, %347, !dbg !464
  %349 = sext i32 %348 to i64
  %scevgep474 = getelementptr float* %328, i64 %349
  %scevgep474475 = bitcast float* %scevgep474 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep474475, i8 0, i64 %335, i32 4, i1 false), !dbg !462
  br label %for.inc20.i410

for.inc20.i410:                                   ; preds = %for.body6.lr.ph.i399, %for.cond4.preheader.i395
  %indvars.iv.next477 = add nuw nsw i64 %indvars.iv476, 1, !dbg !463
  %350 = trunc i64 %indvars.iv.next477 to i32, !dbg !464
  br i1 %cmp544.i392, label %for.body6.lr.ph.i399.1, label %for.inc20.i410.1, !dbg !464

for.inc23.i413.loopexit.unr-lcssa:                ; preds = %for.inc20.i410.1
  br label %for.inc23.i413.loopexit

for.inc23.i413.loopexit:                          ; preds = %for.cond4.preheader.i395.preheader.split, %for.inc23.i413.loopexit.unr-lcssa
  br label %for.inc23.i413

for.inc23.i413:                                   ; preds = %for.inc23.i413.loopexit, %for.cond1.preheader.i391
  %inc24.i411 = add nuw nsw i32 %i.049.i390, 1, !dbg !466
  tail call void @llvm.dbg.value(metadata i32 %inc24.i411, i64 0, metadata !455, metadata !152), !dbg !456
  %exitcond480 = icmp eq i32 %i.049.i390, %337, !dbg !458
  br i1 %exitcond480, label %mat_set.exit414, label %for.cond1.preheader.i391, !dbg !458

mat_set.exit414:                                  ; preds = %for.inc23.i413
  %.pr422.pr = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !467, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !469, metadata !152), !dbg !470
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !471, metadata !152), !dbg !472
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !473, metadata !152), !dbg !474
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !475, metadata !152), !dbg !476
  %cmp48.i358 = icmp sgt i32 %.pr422.pr, 0, !dbg !477
  br i1 %cmp48.i358, label %for.cond1.preheader.lr.ph.i360, label %mat_set.exit386, !dbg !478

for.cond1.preheader.lr.ph.i360:                   ; preds = %mat_set.exit414
  %351 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !479
  %352 = trunc i64 %351 to i32, !dbg !479
  %cmp246.i359 = icmp sgt i32 %352, 0, !dbg !480
  %353 = lshr i64 %351, 32
  %354 = trunc i64 %353 to i32
  %cmp544.i363 = icmp sgt i32 %354, 0, !dbg !481
  %355 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !482, !tbaa !190
  %356 = mul i32 %352, %354, !dbg !483
  %357 = mul i32 %.pr422.pr, %352, !dbg !478
  %358 = mul i32 %357, %354, !dbg !478
  %359 = shl i32 %358, 1, !dbg !478
  %360 = shl nuw nsw i64 %353, 2, !dbg !478
  %361 = add nuw nsw i64 %360, 17179869180, !dbg !478
  %362 = and i64 %361, 17179869180, !dbg !478
  %363 = add nuw nsw i64 %362, 4, !dbg !478
  %364 = add i32 %352, -1, !dbg !478
  %365 = add i32 %.pr422.pr, -1, !dbg !478
  %366 = trunc i64 %351 to i32
  br label %for.cond1.preheader.i362, !dbg !478

for.cond1.preheader.i362:                         ; preds = %for.inc23.i385, %for.cond1.preheader.lr.ph.i360
  %i.049.i361 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i360 ], [ %inc24.i383, %for.inc23.i385 ], !dbg !468
  %367 = mul i32 %356, %i.049.i361, !dbg !483
  %368 = add i32 %359, %367, !dbg !483
  br i1 %cmp246.i359, label %for.cond4.preheader.i366.preheader, label %for.inc23.i385, !dbg !483

for.cond4.preheader.i366.preheader:               ; preds = %for.cond1.preheader.i362
  %xtraiter858 = and i32 %366, 1
  %lcmp.mod859 = icmp ne i32 %xtraiter858, 0
  %lcmp.overflow860 = icmp eq i32 %366, 0
  %lcmp.or861 = or i1 %lcmp.overflow860, %lcmp.mod859
  br i1 %lcmp.or861, label %for.cond4.preheader.i366.prol.preheader, label %for.cond4.preheader.i366.preheader.split

for.cond4.preheader.i366.prol.preheader:          ; preds = %for.cond4.preheader.i366.preheader
  br label %for.cond4.preheader.i366.prol, !dbg !484

for.cond4.preheader.i366.prol:                    ; preds = %for.cond4.preheader.i366.prol.preheader, %for.inc20.i382.prol
  %indvars.iv464.prol = phi i64 [ %indvars.iv.next465.prol, %for.inc20.i382.prol ], [ 0, %for.cond4.preheader.i366.prol.preheader ]
  %prol.iter862 = phi i32 [ %prol.iter862.sub, %for.inc20.i382.prol ], [ %xtraiter858, %for.cond4.preheader.i366.prol.preheader ]
  %369 = trunc i64 %indvars.iv464.prol to i32, !dbg !484
  br i1 %cmp544.i363, label %for.body6.lr.ph.i371.prol, label %for.inc20.i382.prol, !dbg !484

for.body6.lr.ph.i371.prol:                        ; preds = %for.cond4.preheader.i366.prol
  %370 = mul i32 %354, %369, !dbg !484
  %371 = add i32 %368, %370, !dbg !484
  %372 = sext i32 %371 to i64
  %scevgep.prol = getelementptr float* %355, i64 %372
  %scevgep463.prol = bitcast float* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep463.prol, i8 0, i64 %363, i32 4, i1 false), !dbg !482
  br label %for.inc20.i382.prol

for.inc20.i382.prol:                              ; preds = %for.body6.lr.ph.i371.prol, %for.cond4.preheader.i366.prol
  %indvars.iv.next465.prol = add nuw nsw i64 %indvars.iv464.prol, 1, !dbg !483
  %exitcond467.prol = icmp eq i32 %369, %364, !dbg !483
  %prol.iter862.sub = sub i32 %prol.iter862, 1, !dbg !483
  %prol.iter862.cmp = icmp ne i32 %prol.iter862.sub, 0, !dbg !483
  br i1 %prol.iter862.cmp, label %for.cond4.preheader.i366.prol, label %for.cond4.preheader.i366.preheader.split.loopexit, !llvm.loop !485

for.cond4.preheader.i366.preheader.split.loopexit: ; preds = %for.inc20.i382.prol
  %indvars.iv464.unr.ph = phi i64 [ %indvars.iv.next465.prol, %for.inc20.i382.prol ]
  br label %for.cond4.preheader.i366.preheader.split

for.cond4.preheader.i366.preheader.split:         ; preds = %for.cond4.preheader.i366.preheader.split.loopexit, %for.cond4.preheader.i366.preheader
  %indvars.iv464.unr = phi i64 [ 0, %for.cond4.preheader.i366.preheader ], [ %indvars.iv464.unr.ph, %for.cond4.preheader.i366.preheader.split.loopexit ]
  %373 = icmp ult i32 %366, 2
  br i1 %373, label %for.inc23.i385.loopexit, label %for.cond4.preheader.i366.preheader.split.split

for.cond4.preheader.i366.preheader.split.split:   ; preds = %for.cond4.preheader.i366.preheader.split
  br label %for.cond4.preheader.i366, !dbg !484

for.cond4.preheader.i366:                         ; preds = %for.inc20.i382.1, %for.cond4.preheader.i366.preheader.split.split
  %indvars.iv464 = phi i64 [ %indvars.iv464.unr, %for.cond4.preheader.i366.preheader.split.split ], [ %indvars.iv.next465.1, %for.inc20.i382.1 ]
  %374 = trunc i64 %indvars.iv464 to i32, !dbg !484
  br i1 %cmp544.i363, label %for.body6.lr.ph.i371, label %for.inc20.i382, !dbg !484

for.body6.lr.ph.i371:                             ; preds = %for.cond4.preheader.i366
  %375 = mul i32 %354, %374, !dbg !484
  %376 = add i32 %368, %375, !dbg !484
  %377 = sext i32 %376 to i64
  %scevgep = getelementptr float* %355, i64 %377
  %scevgep463 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep463, i8 0, i64 %363, i32 4, i1 false), !dbg !482
  br label %for.inc20.i382

for.inc20.i382:                                   ; preds = %for.body6.lr.ph.i371, %for.cond4.preheader.i366
  %indvars.iv.next465 = add nuw nsw i64 %indvars.iv464, 1, !dbg !483
  %378 = trunc i64 %indvars.iv.next465 to i32, !dbg !484
  br i1 %cmp544.i363, label %for.body6.lr.ph.i371.1, label %for.inc20.i382.1, !dbg !484

for.inc23.i385.loopexit.unr-lcssa:                ; preds = %for.inc20.i382.1
  br label %for.inc23.i385.loopexit

for.inc23.i385.loopexit:                          ; preds = %for.cond4.preheader.i366.preheader.split, %for.inc23.i385.loopexit.unr-lcssa
  br label %for.inc23.i385

for.inc23.i385:                                   ; preds = %for.inc23.i385.loopexit, %for.cond1.preheader.i362
  %inc24.i383 = add nuw nsw i32 %i.049.i361, 1, !dbg !486
  tail call void @llvm.dbg.value(metadata i32 %inc24.i383, i64 0, metadata !475, metadata !152), !dbg !476
  %exitcond468 = icmp eq i32 %i.049.i361, %365, !dbg !478
  br i1 %exitcond468, label %mat_set.exit386.loopexit, label %for.cond1.preheader.i362, !dbg !478

mat_set.exit386.loopexit:                         ; preds = %for.inc23.i385
  br label %mat_set.exit386

mat_set.exit386:                                  ; preds = %mat_set.exit386.loopexit, %mat_set.exit246, %mat_set.exit273, %mat_set.exit414
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !487, metadata !152), !dbg !489
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !490, metadata !152), !dbg !491
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !492, metadata !152), !dbg !493
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !494, metadata !152), !dbg !495
  %379 = load i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 2), align 4, !dbg !496, !tbaa !183
  %cmp48.i331 = icmp sgt i32 %379, 0, !dbg !497
  br i1 %cmp48.i331, label %for.cond1.preheader.lr.ph.i333, label %mat_set.exit302, !dbg !498

for.cond1.preheader.lr.ph.i333:                   ; preds = %mat_set.exit386
  %380 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 3) to i64*), align 8, !dbg !499
  %381 = trunc i64 %380 to i32, !dbg !499
  %cmp246.i332 = icmp sgt i32 %381, 0, !dbg !500
  %382 = lshr i64 %380, 32
  %383 = trunc i64 %382 to i32
  %cmp544.i336 = icmp sgt i32 %383, 0, !dbg !501
  %384 = load float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !502, !tbaa !190
  %385 = add i32 %383, -1, !dbg !498
  %386 = add i32 %381, -1, !dbg !498
  %387 = add i32 %379, -1, !dbg !498
  %388 = lshr i64 %380, 32, !dbg !498
  %389 = add nuw nsw i64 %388, 4294967295, !dbg !498
  %390 = and i64 %389, 4294967295
  %391 = add nuw nsw i64 %390, 1, !dbg !498
  %392 = trunc i64 %388 to i32
  br label %for.cond1.preheader.i335, !dbg !498

for.cond1.preheader.i335:                         ; preds = %for.inc23.i356, %for.cond1.preheader.lr.ph.i333
  %i.049.i334 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i333 ], [ %inc24.i354, %for.inc23.i356 ], !dbg !488
  br i1 %cmp246.i332, label %for.cond4.preheader.lr.ph.i337, label %for.inc23.i356, !dbg !503

for.cond4.preheader.lr.ph.i337:                   ; preds = %for.cond1.preheader.i335
  %mul1141.i340 = mul i32 %i.049.i334, %381, !dbg !502
  br label %for.cond4.preheader.i339, !dbg !503

for.cond4.preheader.i339:                         ; preds = %for.inc20.i353, %for.cond4.preheader.lr.ph.i337
  %indvars.iv453 = phi i64 [ %indvars.iv.next454, %for.inc20.i353 ], [ 0, %for.cond4.preheader.lr.ph.i337 ]
  %393 = trunc i64 %indvars.iv453 to i32, !dbg !502
  br i1 %cmp544.i336, label %for.body6.lr.ph.i342, label %for.inc20.i353, !dbg !504

for.body6.lr.ph.i342:                             ; preds = %for.cond4.preheader.i339
  %add43.i341 = add i32 %393, %mul1141.i340, !dbg !502
  %add18.i344 = mul nsw i32 %add43.i341, %383, !dbg !502
  %394 = sext i32 %add18.i344 to i64, !dbg !504
  %end.idx736 = add nuw nsw i64 %390, 1, !dbg !504
  %n.mod.vf737 = and i64 %388, 7, !dbg !504
  %n.vec738 = sub nsw i64 %391, %n.mod.vf737, !dbg !504
  %cmp.zero740 = icmp eq i64 %391, %n.mod.vf737, !dbg !504
  br i1 %cmp.zero740, label %middle.block733, label %vector.body732.preheader

vector.body732.preheader:                         ; preds = %for.body6.lr.ph.i342
  br label %vector.body732, !dbg !502

vector.body732:                                   ; preds = %vector.body732.preheader, %vector.body732
  %index735 = phi i64 [ %index.next747, %vector.body732 ], [ 0, %vector.body732.preheader ], !dbg !504
  %395 = add i64 %index735, %394, !dbg !502
  %396 = getelementptr inbounds float* %384, i64 %395, !dbg !502
  %397 = bitcast float* %396 to <4 x float>*, !dbg !502
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %397, align 4, !dbg !502, !tbaa !320
  %.sum833 = add i64 %395, 4, !dbg !502
  %398 = getelementptr float* %384, i64 %.sum833, !dbg !502
  %399 = bitcast float* %398 to <4 x float>*, !dbg !502
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %399, align 4, !dbg !502, !tbaa !320
  %index.next747 = add i64 %index735, 8, !dbg !504
  %400 = icmp eq i64 %index.next747, %n.vec738, !dbg !504
  br i1 %400, label %middle.block733.loopexit, label %vector.body732, !dbg !504, !llvm.loop !505

middle.block733.loopexit:                         ; preds = %vector.body732
  br label %middle.block733

middle.block733:                                  ; preds = %middle.block733.loopexit, %for.body6.lr.ph.i342
  %resume.val742 = phi i64 [ 0, %for.body6.lr.ph.i342 ], [ %n.vec738, %middle.block733.loopexit ]
  %cmp.n746 = icmp eq i64 %end.idx736, %resume.val742
  br i1 %cmp.n746, label %for.inc20.i353, label %for.body6.i350.preheader

for.body6.i350.preheader:                         ; preds = %middle.block733
  %401 = trunc i64 %resume.val742 to i32
  %402 = sub i32 %392, %401
  %xtraiter853 = and i32 %402, 3
  %lcmp.mod854 = icmp ne i32 %xtraiter853, 0
  %lcmp.overflow855 = icmp eq i32 %402, 0
  %lcmp.or856 = or i1 %lcmp.overflow855, %lcmp.mod854
  br i1 %lcmp.or856, label %for.body6.i350.prol.preheader, label %for.body6.i350.preheader.split

for.body6.i350.prol.preheader:                    ; preds = %for.body6.i350.preheader
  br label %for.body6.i350.prol, !dbg !502

for.body6.i350.prol:                              ; preds = %for.body6.i350.prol.preheader, %for.body6.i350.prol
  %indvars.iv448.prol = phi i64 [ %indvars.iv.next449.prol, %for.body6.i350.prol ], [ %resume.val742, %for.body6.i350.prol.preheader ]
  %prol.iter857 = phi i32 [ %prol.iter857.sub, %for.body6.i350.prol ], [ %xtraiter853, %for.body6.i350.prol.preheader ]
  %403 = add nsw i64 %indvars.iv448.prol, %394, !dbg !502
  %arrayidx.i347.prol = getelementptr inbounds float* %384, i64 %403, !dbg !502
  store float 1.000000e+00, float* %arrayidx.i347.prol, align 4, !dbg !502, !tbaa !320
  %indvars.iv.next449.prol = add nuw nsw i64 %indvars.iv448.prol, 1, !dbg !504
  %lftr.wideiv451.prol = trunc i64 %indvars.iv448.prol to i32, !dbg !504
  %exitcond452.prol = icmp eq i32 %lftr.wideiv451.prol, %385, !dbg !504
  %prol.iter857.sub = sub i32 %prol.iter857, 1, !dbg !504
  %prol.iter857.cmp = icmp ne i32 %prol.iter857.sub, 0, !dbg !504
  br i1 %prol.iter857.cmp, label %for.body6.i350.prol, label %for.body6.i350.preheader.split.loopexit, !llvm.loop !506

for.body6.i350.preheader.split.loopexit:          ; preds = %for.body6.i350.prol
  %indvars.iv448.unr.ph = phi i64 [ %indvars.iv.next449.prol, %for.body6.i350.prol ]
  br label %for.body6.i350.preheader.split

for.body6.i350.preheader.split:                   ; preds = %for.body6.i350.preheader.split.loopexit, %for.body6.i350.preheader
  %indvars.iv448.unr = phi i64 [ %resume.val742, %for.body6.i350.preheader ], [ %indvars.iv448.unr.ph, %for.body6.i350.preheader.split.loopexit ]
  %404 = icmp ult i32 %402, 4
  br i1 %404, label %for.inc20.i353.loopexit, label %for.body6.i350.preheader.split.split

for.body6.i350.preheader.split.split:             ; preds = %for.body6.i350.preheader.split
  br label %for.body6.i350, !dbg !502

for.body6.i350:                                   ; preds = %for.body6.i350, %for.body6.i350.preheader.split.split
  %indvars.iv448 = phi i64 [ %indvars.iv448.unr, %for.body6.i350.preheader.split.split ], [ %indvars.iv.next449.3, %for.body6.i350 ]
  %405 = add nsw i64 %indvars.iv448, %394, !dbg !502
  %arrayidx.i347 = getelementptr inbounds float* %384, i64 %405, !dbg !502
  store float 1.000000e+00, float* %arrayidx.i347, align 4, !dbg !502, !tbaa !320
  %indvars.iv.next449 = add nuw nsw i64 %indvars.iv448, 1, !dbg !504
  %lftr.wideiv451 = trunc i64 %indvars.iv448 to i32, !dbg !504
  %406 = add nsw i64 %indvars.iv.next449, %394, !dbg !502
  %arrayidx.i347.1 = getelementptr inbounds float* %384, i64 %406, !dbg !502
  store float 1.000000e+00, float* %arrayidx.i347.1, align 4, !dbg !502, !tbaa !320
  %indvars.iv.next449.1 = add nuw nsw i64 %indvars.iv.next449, 1, !dbg !504
  %lftr.wideiv451.1 = trunc i64 %indvars.iv.next449 to i32, !dbg !504
  %407 = add nsw i64 %indvars.iv.next449.1, %394, !dbg !502
  %arrayidx.i347.2 = getelementptr inbounds float* %384, i64 %407, !dbg !502
  store float 1.000000e+00, float* %arrayidx.i347.2, align 4, !dbg !502, !tbaa !320
  %indvars.iv.next449.2 = add nuw nsw i64 %indvars.iv.next449.1, 1, !dbg !504
  %lftr.wideiv451.2 = trunc i64 %indvars.iv.next449.1 to i32, !dbg !504
  %408 = add nsw i64 %indvars.iv.next449.2, %394, !dbg !502
  %arrayidx.i347.3 = getelementptr inbounds float* %384, i64 %408, !dbg !502
  store float 1.000000e+00, float* %arrayidx.i347.3, align 4, !dbg !502, !tbaa !320
  %indvars.iv.next449.3 = add nuw nsw i64 %indvars.iv.next449.2, 1, !dbg !504
  %lftr.wideiv451.3 = trunc i64 %indvars.iv.next449.2 to i32, !dbg !504
  %exitcond452.3 = icmp eq i32 %lftr.wideiv451.3, %385, !dbg !504
  br i1 %exitcond452.3, label %for.inc20.i353.loopexit.unr-lcssa, label %for.body6.i350, !dbg !504, !llvm.loop !507

for.inc20.i353.loopexit.unr-lcssa:                ; preds = %for.body6.i350
  br label %for.inc20.i353.loopexit

for.inc20.i353.loopexit:                          ; preds = %for.body6.i350.preheader.split, %for.inc20.i353.loopexit.unr-lcssa
  br label %for.inc20.i353

for.inc20.i353:                                   ; preds = %for.inc20.i353.loopexit, %middle.block733, %for.cond4.preheader.i339
  %indvars.iv.next454 = add nuw nsw i64 %indvars.iv453, 1, !dbg !503
  %exitcond456 = icmp eq i32 %393, %386, !dbg !503
  br i1 %exitcond456, label %for.inc23.i356.loopexit, label %for.cond4.preheader.i339, !dbg !503

for.inc23.i356.loopexit:                          ; preds = %for.inc20.i353
  br label %for.inc23.i356

for.inc23.i356:                                   ; preds = %for.inc23.i356.loopexit, %for.cond1.preheader.i335
  %inc24.i354 = add nuw nsw i32 %i.049.i334, 1, !dbg !508
  tail call void @llvm.dbg.value(metadata i32 %inc24.i354, i64 0, metadata !494, metadata !152), !dbg !495
  %exitcond457 = icmp eq i32 %i.049.i334, %387, !dbg !498
  br i1 %exitcond457, label %for.cond1.preheader.i307.preheader, label %for.cond1.preheader.i335, !dbg !498

for.cond1.preheader.i307.preheader:               ; preds = %for.inc23.i356
  %409 = lshr i64 %380, 32, !dbg !509
  %410 = add nuw nsw i64 %409, 4294967295, !dbg !509
  %411 = and i64 %410, 4294967295
  %412 = add nuw nsw i64 %411, 1, !dbg !509
  %413 = trunc i64 %409 to i32
  br label %for.cond1.preheader.i307, !dbg !509

for.cond1.preheader.i307:                         ; preds = %for.cond1.preheader.i307.preheader, %for.inc23.i329
  %i.049.i306 = phi i32 [ %inc24.i327, %for.inc23.i329 ], [ 0, %for.cond1.preheader.i307.preheader ], !dbg !510
  br i1 %cmp246.i332, label %for.cond4.preheader.lr.ph.i309, label %for.inc23.i329, !dbg !509

for.cond4.preheader.lr.ph.i309:                   ; preds = %for.cond1.preheader.i307
  %mul942.i312 = add i32 %i.049.i306, %379, !dbg !511
  %mul1141.i313 = mul i32 %mul942.i312, %381, !dbg !511
  br label %for.cond4.preheader.i311, !dbg !509

for.cond4.preheader.i311:                         ; preds = %for.inc20.i326, %for.cond4.preheader.lr.ph.i309
  %indvars.iv443 = phi i64 [ %indvars.iv.next444, %for.inc20.i326 ], [ 0, %for.cond4.preheader.lr.ph.i309 ]
  %414 = trunc i64 %indvars.iv443 to i32, !dbg !511
  br i1 %cmp544.i336, label %for.body6.lr.ph.i315, label %for.inc20.i326, !dbg !512

for.body6.lr.ph.i315:                             ; preds = %for.cond4.preheader.i311
  %add43.i314 = add i32 %414, %mul1141.i313, !dbg !511
  %add18.i317 = mul nsw i32 %add43.i314, %383, !dbg !511
  %415 = sext i32 %add18.i317 to i64, !dbg !512
  %end.idx767 = add nuw nsw i64 %411, 1, !dbg !512
  %n.mod.vf768 = and i64 %409, 7, !dbg !512
  %n.vec769 = sub nsw i64 %412, %n.mod.vf768, !dbg !512
  %cmp.zero771 = icmp eq i64 %412, %n.mod.vf768, !dbg !512
  br i1 %cmp.zero771, label %middle.block764, label %vector.body763.preheader

vector.body763.preheader:                         ; preds = %for.body6.lr.ph.i315
  br label %vector.body763, !dbg !511

vector.body763:                                   ; preds = %vector.body763.preheader, %vector.body763
  %index766 = phi i64 [ %index.next778, %vector.body763 ], [ 0, %vector.body763.preheader ], !dbg !512
  %416 = add i64 %index766, %415, !dbg !511
  %417 = getelementptr inbounds float* %384, i64 %416, !dbg !511
  %418 = bitcast float* %417 to <4 x float>*, !dbg !511
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %418, align 4, !dbg !511, !tbaa !320
  %.sum830 = add i64 %416, 4, !dbg !511
  %419 = getelementptr float* %384, i64 %.sum830, !dbg !511
  %420 = bitcast float* %419 to <4 x float>*, !dbg !511
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %420, align 4, !dbg !511, !tbaa !320
  %index.next778 = add i64 %index766, 8, !dbg !512
  %421 = icmp eq i64 %index.next778, %n.vec769, !dbg !512
  br i1 %421, label %middle.block764.loopexit, label %vector.body763, !dbg !512, !llvm.loop !513

middle.block764.loopexit:                         ; preds = %vector.body763
  br label %middle.block764

middle.block764:                                  ; preds = %middle.block764.loopexit, %for.body6.lr.ph.i315
  %resume.val773 = phi i64 [ 0, %for.body6.lr.ph.i315 ], [ %n.vec769, %middle.block764.loopexit ]
  %cmp.n777 = icmp eq i64 %end.idx767, %resume.val773
  br i1 %cmp.n777, label %for.inc20.i326, label %for.body6.i323.preheader

for.body6.i323.preheader:                         ; preds = %middle.block764
  %422 = trunc i64 %resume.val773 to i32
  %423 = sub i32 %413, %422
  %xtraiter848 = and i32 %423, 3
  %lcmp.mod849 = icmp ne i32 %xtraiter848, 0
  %lcmp.overflow850 = icmp eq i32 %423, 0
  %lcmp.or851 = or i1 %lcmp.overflow850, %lcmp.mod849
  br i1 %lcmp.or851, label %for.body6.i323.prol.preheader, label %for.body6.i323.preheader.split

for.body6.i323.prol.preheader:                    ; preds = %for.body6.i323.preheader
  br label %for.body6.i323.prol, !dbg !511

for.body6.i323.prol:                              ; preds = %for.body6.i323.prol.preheader, %for.body6.i323.prol
  %indvars.iv438.prol = phi i64 [ %indvars.iv.next439.prol, %for.body6.i323.prol ], [ %resume.val773, %for.body6.i323.prol.preheader ]
  %prol.iter852 = phi i32 [ %prol.iter852.sub, %for.body6.i323.prol ], [ %xtraiter848, %for.body6.i323.prol.preheader ]
  %424 = add nsw i64 %indvars.iv438.prol, %415, !dbg !511
  %arrayidx.i320.prol = getelementptr inbounds float* %384, i64 %424, !dbg !511
  store float 1.000000e+00, float* %arrayidx.i320.prol, align 4, !dbg !511, !tbaa !320
  %indvars.iv.next439.prol = add nuw nsw i64 %indvars.iv438.prol, 1, !dbg !512
  %lftr.wideiv441.prol = trunc i64 %indvars.iv438.prol to i32, !dbg !512
  %exitcond442.prol = icmp eq i32 %lftr.wideiv441.prol, %385, !dbg !512
  %prol.iter852.sub = sub i32 %prol.iter852, 1, !dbg !512
  %prol.iter852.cmp = icmp ne i32 %prol.iter852.sub, 0, !dbg !512
  br i1 %prol.iter852.cmp, label %for.body6.i323.prol, label %for.body6.i323.preheader.split.loopexit, !llvm.loop !514

for.body6.i323.preheader.split.loopexit:          ; preds = %for.body6.i323.prol
  %indvars.iv438.unr.ph = phi i64 [ %indvars.iv.next439.prol, %for.body6.i323.prol ]
  br label %for.body6.i323.preheader.split

for.body6.i323.preheader.split:                   ; preds = %for.body6.i323.preheader.split.loopexit, %for.body6.i323.preheader
  %indvars.iv438.unr = phi i64 [ %resume.val773, %for.body6.i323.preheader ], [ %indvars.iv438.unr.ph, %for.body6.i323.preheader.split.loopexit ]
  %425 = icmp ult i32 %423, 4
  br i1 %425, label %for.inc20.i326.loopexit, label %for.body6.i323.preheader.split.split

for.body6.i323.preheader.split.split:             ; preds = %for.body6.i323.preheader.split
  br label %for.body6.i323, !dbg !511

for.body6.i323:                                   ; preds = %for.body6.i323, %for.body6.i323.preheader.split.split
  %indvars.iv438 = phi i64 [ %indvars.iv438.unr, %for.body6.i323.preheader.split.split ], [ %indvars.iv.next439.3, %for.body6.i323 ]
  %426 = add nsw i64 %indvars.iv438, %415, !dbg !511
  %arrayidx.i320 = getelementptr inbounds float* %384, i64 %426, !dbg !511
  store float 1.000000e+00, float* %arrayidx.i320, align 4, !dbg !511, !tbaa !320
  %indvars.iv.next439 = add nuw nsw i64 %indvars.iv438, 1, !dbg !512
  %lftr.wideiv441 = trunc i64 %indvars.iv438 to i32, !dbg !512
  %427 = add nsw i64 %indvars.iv.next439, %415, !dbg !511
  %arrayidx.i320.1 = getelementptr inbounds float* %384, i64 %427, !dbg !511
  store float 1.000000e+00, float* %arrayidx.i320.1, align 4, !dbg !511, !tbaa !320
  %indvars.iv.next439.1 = add nuw nsw i64 %indvars.iv.next439, 1, !dbg !512
  %lftr.wideiv441.1 = trunc i64 %indvars.iv.next439 to i32, !dbg !512
  %428 = add nsw i64 %indvars.iv.next439.1, %415, !dbg !511
  %arrayidx.i320.2 = getelementptr inbounds float* %384, i64 %428, !dbg !511
  store float 1.000000e+00, float* %arrayidx.i320.2, align 4, !dbg !511, !tbaa !320
  %indvars.iv.next439.2 = add nuw nsw i64 %indvars.iv.next439.1, 1, !dbg !512
  %lftr.wideiv441.2 = trunc i64 %indvars.iv.next439.1 to i32, !dbg !512
  %429 = add nsw i64 %indvars.iv.next439.2, %415, !dbg !511
  %arrayidx.i320.3 = getelementptr inbounds float* %384, i64 %429, !dbg !511
  store float 1.000000e+00, float* %arrayidx.i320.3, align 4, !dbg !511, !tbaa !320
  %indvars.iv.next439.3 = add nuw nsw i64 %indvars.iv.next439.2, 1, !dbg !512
  %lftr.wideiv441.3 = trunc i64 %indvars.iv.next439.2 to i32, !dbg !512
  %exitcond442.3 = icmp eq i32 %lftr.wideiv441.3, %385, !dbg !512
  br i1 %exitcond442.3, label %for.inc20.i326.loopexit.unr-lcssa, label %for.body6.i323, !dbg !512, !llvm.loop !515

for.inc20.i326.loopexit.unr-lcssa:                ; preds = %for.body6.i323
  br label %for.inc20.i326.loopexit

for.inc20.i326.loopexit:                          ; preds = %for.body6.i323.preheader.split, %for.inc20.i326.loopexit.unr-lcssa
  br label %for.inc20.i326

for.inc20.i326:                                   ; preds = %for.inc20.i326.loopexit, %middle.block764, %for.cond4.preheader.i311
  %indvars.iv.next444 = add nuw nsw i64 %indvars.iv443, 1, !dbg !509
  %exitcond446 = icmp eq i32 %414, %386, !dbg !509
  br i1 %exitcond446, label %for.inc23.i329.loopexit, label %for.cond4.preheader.i311, !dbg !509

for.inc23.i329.loopexit:                          ; preds = %for.inc20.i326
  br label %for.inc23.i329

for.inc23.i329:                                   ; preds = %for.inc23.i329.loopexit, %for.cond1.preheader.i307
  %inc24.i327 = add nuw nsw i32 %i.049.i306, 1, !dbg !516
  tail call void @llvm.dbg.value(metadata i32 %inc24.i327, i64 0, metadata !517, metadata !152), !dbg !518
  %exitcond447 = icmp eq i32 %i.049.i306, %387, !dbg !519
  br i1 %exitcond447, label %for.cond1.preheader.lr.ph.i276, label %for.cond1.preheader.i307, !dbg !519

for.cond1.preheader.lr.ph.i276:                   ; preds = %for.inc23.i329
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !520, metadata !152), !dbg !522
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !523, metadata !152), !dbg !524
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !525, metadata !152), !dbg !526
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !527, metadata !152), !dbg !528
  %mul.i283 = shl i32 %379, 1, !dbg !529
  %430 = lshr i64 %380, 32, !dbg !530
  %431 = add nuw nsw i64 %430, 4294967295, !dbg !530
  %432 = and i64 %431, 4294967295
  %433 = add nuw nsw i64 %432, 1, !dbg !530
  %434 = trunc i64 %430 to i32
  br label %for.cond1.preheader.i278, !dbg !530

for.cond1.preheader.i278:                         ; preds = %for.inc23.i301, %for.cond1.preheader.lr.ph.i276
  %i.049.i277 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i276 ], [ %inc24.i299, %for.inc23.i301 ], !dbg !521
  br i1 %cmp246.i332, label %for.cond4.preheader.lr.ph.i280, label %for.inc23.i301, !dbg !531

for.cond4.preheader.lr.ph.i280:                   ; preds = %for.cond1.preheader.i278
  %mul942.i284 = add i32 %i.049.i277, %mul.i283, !dbg !529
  %mul1141.i285 = mul i32 %mul942.i284, %381, !dbg !529
  br label %for.cond4.preheader.i282, !dbg !531

for.cond4.preheader.i282:                         ; preds = %for.inc20.i298, %for.cond4.preheader.lr.ph.i280
  %indvars.iv433 = phi i64 [ %indvars.iv.next434, %for.inc20.i298 ], [ 0, %for.cond4.preheader.lr.ph.i280 ]
  %435 = trunc i64 %indvars.iv433 to i32, !dbg !529
  br i1 %cmp544.i336, label %for.body6.lr.ph.i287, label %for.inc20.i298, !dbg !532

for.body6.lr.ph.i287:                             ; preds = %for.cond4.preheader.i282
  %add43.i286 = add i32 %435, %mul1141.i285, !dbg !529
  %add18.i289 = mul nsw i32 %add43.i286, %383, !dbg !529
  %436 = sext i32 %add18.i289 to i64, !dbg !532
  %end.idx798 = add nuw nsw i64 %432, 1, !dbg !532
  %n.mod.vf799 = and i64 %430, 7, !dbg !532
  %n.vec800 = sub nsw i64 %433, %n.mod.vf799, !dbg !532
  %cmp.zero802 = icmp eq i64 %433, %n.mod.vf799, !dbg !532
  br i1 %cmp.zero802, label %middle.block795, label %vector.body794.preheader

vector.body794.preheader:                         ; preds = %for.body6.lr.ph.i287
  br label %vector.body794, !dbg !529

vector.body794:                                   ; preds = %vector.body794.preheader, %vector.body794
  %index797 = phi i64 [ %index.next809, %vector.body794 ], [ 0, %vector.body794.preheader ], !dbg !532
  %437 = add i64 %index797, %436, !dbg !529
  %438 = getelementptr inbounds float* %384, i64 %437, !dbg !529
  %439 = bitcast float* %438 to <4 x float>*, !dbg !529
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %439, align 4, !dbg !529, !tbaa !320
  %.sum827 = add i64 %437, 4, !dbg !529
  %440 = getelementptr float* %384, i64 %.sum827, !dbg !529
  %441 = bitcast float* %440 to <4 x float>*, !dbg !529
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %441, align 4, !dbg !529, !tbaa !320
  %index.next809 = add i64 %index797, 8, !dbg !532
  %442 = icmp eq i64 %index.next809, %n.vec800, !dbg !532
  br i1 %442, label %middle.block795.loopexit, label %vector.body794, !dbg !532, !llvm.loop !533

middle.block795.loopexit:                         ; preds = %vector.body794
  br label %middle.block795

middle.block795:                                  ; preds = %middle.block795.loopexit, %for.body6.lr.ph.i287
  %resume.val804 = phi i64 [ 0, %for.body6.lr.ph.i287 ], [ %n.vec800, %middle.block795.loopexit ]
  %cmp.n808 = icmp eq i64 %end.idx798, %resume.val804
  br i1 %cmp.n808, label %for.inc20.i298, label %for.body6.i295.preheader

for.body6.i295.preheader:                         ; preds = %middle.block795
  %443 = trunc i64 %resume.val804 to i32
  %444 = sub i32 %434, %443
  %xtraiter = and i32 %444, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %444, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.i295.prol.preheader, label %for.body6.i295.preheader.split

for.body6.i295.prol.preheader:                    ; preds = %for.body6.i295.preheader
  br label %for.body6.i295.prol, !dbg !529

for.body6.i295.prol:                              ; preds = %for.body6.i295.prol.preheader, %for.body6.i295.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body6.i295.prol ], [ %resume.val804, %for.body6.i295.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.i295.prol ], [ %xtraiter, %for.body6.i295.prol.preheader ]
  %445 = add nsw i64 %indvars.iv.prol, %436, !dbg !529
  %arrayidx.i292.prol = getelementptr inbounds float* %384, i64 %445, !dbg !529
  store float 1.000000e+00, float* %arrayidx.i292.prol, align 4, !dbg !529, !tbaa !320
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !532
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !532
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %385, !dbg !532
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !532
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !532
  br i1 %prol.iter.cmp, label %for.body6.i295.prol, label %for.body6.i295.preheader.split.loopexit, !llvm.loop !534

for.body6.i295.preheader.split.loopexit:          ; preds = %for.body6.i295.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body6.i295.prol ]
  br label %for.body6.i295.preheader.split

for.body6.i295.preheader.split:                   ; preds = %for.body6.i295.preheader.split.loopexit, %for.body6.i295.preheader
  %indvars.iv.unr = phi i64 [ %resume.val804, %for.body6.i295.preheader ], [ %indvars.iv.unr.ph, %for.body6.i295.preheader.split.loopexit ]
  %446 = icmp ult i32 %444, 4
  br i1 %446, label %for.inc20.i298.loopexit, label %for.body6.i295.preheader.split.split

for.body6.i295.preheader.split.split:             ; preds = %for.body6.i295.preheader.split
  br label %for.body6.i295, !dbg !529

for.body6.i295:                                   ; preds = %for.body6.i295, %for.body6.i295.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body6.i295.preheader.split.split ], [ %indvars.iv.next.3, %for.body6.i295 ]
  %447 = add nsw i64 %indvars.iv, %436, !dbg !529
  %arrayidx.i292 = getelementptr inbounds float* %384, i64 %447, !dbg !529
  store float 1.000000e+00, float* %arrayidx.i292, align 4, !dbg !529, !tbaa !320
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !532
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !532
  %448 = add nsw i64 %indvars.iv.next, %436, !dbg !529
  %arrayidx.i292.1 = getelementptr inbounds float* %384, i64 %448, !dbg !529
  store float 1.000000e+00, float* %arrayidx.i292.1, align 4, !dbg !529, !tbaa !320
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !532
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !532
  %449 = add nsw i64 %indvars.iv.next.1, %436, !dbg !529
  %arrayidx.i292.2 = getelementptr inbounds float* %384, i64 %449, !dbg !529
  store float 1.000000e+00, float* %arrayidx.i292.2, align 4, !dbg !529, !tbaa !320
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !532
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !532
  %450 = add nsw i64 %indvars.iv.next.2, %436, !dbg !529
  %arrayidx.i292.3 = getelementptr inbounds float* %384, i64 %450, !dbg !529
  store float 1.000000e+00, float* %arrayidx.i292.3, align 4, !dbg !529, !tbaa !320
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !532
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !532
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %385, !dbg !532
  br i1 %exitcond.3, label %for.inc20.i298.loopexit.unr-lcssa, label %for.body6.i295, !dbg !532, !llvm.loop !535

for.inc20.i298.loopexit.unr-lcssa:                ; preds = %for.body6.i295
  br label %for.inc20.i298.loopexit

for.inc20.i298.loopexit:                          ; preds = %for.body6.i295.preheader.split, %for.inc20.i298.loopexit.unr-lcssa
  br label %for.inc20.i298

for.inc20.i298:                                   ; preds = %for.inc20.i298.loopexit, %middle.block795, %for.cond4.preheader.i282
  %indvars.iv.next434 = add nuw nsw i64 %indvars.iv433, 1, !dbg !531
  %exitcond436 = icmp eq i32 %435, %386, !dbg !531
  br i1 %exitcond436, label %for.inc23.i301.loopexit, label %for.cond4.preheader.i282, !dbg !531

for.inc23.i301.loopexit:                          ; preds = %for.inc20.i298
  br label %for.inc23.i301

for.inc23.i301:                                   ; preds = %for.inc23.i301.loopexit, %for.cond1.preheader.i278
  %inc24.i299 = add nuw nsw i32 %i.049.i277, 1, !dbg !536
  tail call void @llvm.dbg.value(metadata i32 %inc24.i299, i64 0, metadata !527, metadata !152), !dbg !528
  %exitcond437 = icmp eq i32 %i.049.i277, %387, !dbg !530
  br i1 %exitcond437, label %mat_set.exit302.loopexit, label %for.cond1.preheader.i278, !dbg !530

mat_set.exit302.loopexit:                         ; preds = %for.inc23.i301
  br label %mat_set.exit302

mat_set.exit302:                                  ; preds = %mat_set.exit302.loopexit, %mat_set.exit386
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !23, metadata !152), !dbg !537
  %call16 = tail call float @jacobi(i32 64, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2), !dbg !538
  tail call void @llvm.dbg.value(metadata float %call16, i64 0, metadata !34, metadata !152), !dbg !539
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 64) #6, !dbg !540
  %conv = fpext float %call16 to double, !dbg !541
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), double %conv) #6, !dbg !542
  tail call void @llvm.dbg.value(metadata %struct.Mat* @p, i64 0, metadata !543, metadata !152) #6, !dbg !545
  %451 = load float** getelementptr inbounds (%struct.Mat* @p, i64 0, i32 0), align 8, !dbg !546, !tbaa !190
  %tobool.i215 = icmp eq float* %451, null, !dbg !548
  br i1 %tobool.i215, label %clearMat.exit217, label %if.then.i216, !dbg !548

if.then.i216:                                     ; preds = %mat_set.exit302
  %452 = bitcast float* %451 to i8*, !dbg !549
  tail call void @free(i8* %452) #6, !dbg !550
  br label %clearMat.exit217, !dbg !550

clearMat.exit217:                                 ; preds = %mat_set.exit302, %if.then.i216
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @p to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !551
  tail call void @llvm.dbg.value(metadata %struct.Mat* @bnd, i64 0, metadata !552, metadata !152) #6, !dbg !554
  %453 = load float** getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 0), align 8, !dbg !555, !tbaa !190
  %tobool.i184 = icmp eq float* %453, null, !dbg !556
  br i1 %tobool.i184, label %clearMat.exit186, label %if.then.i185, !dbg !556

if.then.i185:                                     ; preds = %clearMat.exit217
  %454 = bitcast float* %453 to i8*, !dbg !557
  tail call void @free(i8* %454) #6, !dbg !558
  br label %clearMat.exit186, !dbg !558

clearMat.exit186:                                 ; preds = %clearMat.exit217, %if.then.i185
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @bnd to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !559
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk1, i64 0, metadata !560, metadata !152) #6, !dbg !562
  %455 = load float** getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 0), align 8, !dbg !563, !tbaa !190
  %tobool.i154 = icmp eq float* %455, null, !dbg !564
  br i1 %tobool.i154, label %clearMat.exit156, label %if.then.i155, !dbg !564

if.then.i155:                                     ; preds = %clearMat.exit186
  %456 = bitcast float* %455 to i8*, !dbg !565
  tail call void @free(i8* %456) #6, !dbg !566
  br label %clearMat.exit156, !dbg !566

clearMat.exit156:                                 ; preds = %clearMat.exit186, %if.then.i155
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk1 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !567
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk2, i64 0, metadata !568, metadata !152) #6, !dbg !570
  %457 = load float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !571, !tbaa !190
  %tobool.i124 = icmp eq float* %457, null, !dbg !572
  br i1 %tobool.i124, label %clearMat.exit126, label %if.then.i125, !dbg !572

if.then.i125:                                     ; preds = %clearMat.exit156
  %458 = bitcast float* %457 to i8*, !dbg !573
  tail call void @free(i8* %458) #6, !dbg !574
  br label %clearMat.exit126, !dbg !574

clearMat.exit126:                                 ; preds = %clearMat.exit156, %if.then.i125
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk2 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !575
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !576, metadata !152) #6, !dbg !578
  %459 = load float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !579, !tbaa !190
  %tobool.i94 = icmp eq float* %459, null, !dbg !580
  br i1 %tobool.i94, label %clearMat.exit96, label %if.then.i95, !dbg !580

if.then.i95:                                      ; preds = %clearMat.exit126
  %460 = bitcast float* %459 to i8*, !dbg !581
  tail call void @free(i8* %460) #6, !dbg !582
  br label %clearMat.exit96, !dbg !582

clearMat.exit96:                                  ; preds = %clearMat.exit126, %if.then.i95
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @a to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !583
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !584, metadata !152) #6, !dbg !586
  %461 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !587, !tbaa !190
  %tobool.i64 = icmp eq float* %461, null, !dbg !588
  br i1 %tobool.i64, label %clearMat.exit66, label %if.then.i65, !dbg !588

if.then.i65:                                      ; preds = %clearMat.exit96
  %462 = bitcast float* %461 to i8*, !dbg !589
  tail call void @free(i8* %462) #6, !dbg !590
  br label %clearMat.exit66, !dbg !590

clearMat.exit66:                                  ; preds = %clearMat.exit96, %if.then.i65
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @b to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !591
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !592, metadata !152) #6, !dbg !594
  %463 = load float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !595, !tbaa !190
  %tobool.i = icmp eq float* %463, null, !dbg !596
  br i1 %tobool.i, label %clearMat.exit, label %if.then.i, !dbg !596

if.then.i:                                        ; preds = %clearMat.exit66
  %464 = bitcast float* %463 to i8*, !dbg !597
  tail call void @free(i8* %464) #6, !dbg !598
  br label %clearMat.exit, !dbg !598

clearMat.exit:                                    ; preds = %clearMat.exit66, %if.then.i
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @c to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !599
  ret i32 0, !dbg !600

for.body6.lr.ph.i371.1:                           ; preds = %for.inc20.i382
  %465 = mul i32 %354, %378, !dbg !484
  %466 = add i32 %368, %465, !dbg !484
  %467 = sext i32 %466 to i64
  %scevgep.1 = getelementptr float* %355, i64 %467
  %scevgep463.1 = bitcast float* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep463.1, i8 0, i64 %363, i32 4, i1 false), !dbg !482
  br label %for.inc20.i382.1

for.inc20.i382.1:                                 ; preds = %for.body6.lr.ph.i371.1, %for.inc20.i382
  %indvars.iv.next465.1 = add nuw nsw i64 %indvars.iv.next465, 1, !dbg !483
  %exitcond467.1 = icmp eq i32 %378, %364, !dbg !483
  br i1 %exitcond467.1, label %for.inc23.i385.loopexit.unr-lcssa, label %for.cond4.preheader.i366, !dbg !483

for.body6.lr.ph.i399.1:                           ; preds = %for.inc20.i410
  %468 = mul i32 %327, %350, !dbg !464
  %469 = add i32 %340, %468, !dbg !464
  %470 = sext i32 %469 to i64
  %scevgep474.1 = getelementptr float* %328, i64 %470
  %scevgep474475.1 = bitcast float* %scevgep474.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep474475.1, i8 0, i64 %335, i32 4, i1 false), !dbg !462
  br label %for.inc20.i410.1

for.inc20.i410.1:                                 ; preds = %for.body6.lr.ph.i399.1, %for.inc20.i410
  %indvars.iv.next477.1 = add nuw nsw i64 %indvars.iv.next477, 1, !dbg !463
  %exitcond479.1 = icmp eq i32 %350, %336, !dbg !463
  br i1 %exitcond479.1, label %for.inc23.i413.loopexit.unr-lcssa, label %for.cond4.preheader.i395, !dbg !463

for.body6.lr.ph.i258.1:                           ; preds = %for.inc20.i269
  %471 = mul i32 %303, %323, !dbg !444
  %472 = add i32 %313, %471, !dbg !444
  %473 = sext i32 %472 to i64
  %scevgep486.1 = getelementptr float* %304, i64 %473
  %scevgep486487.1 = bitcast float* %scevgep486.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487.1, i8 0, i64 %309, i32 4, i1 false), !dbg !442
  br label %for.inc20.i269.1

for.inc20.i269.1:                                 ; preds = %for.body6.lr.ph.i258.1, %for.inc20.i269
  %indvars.iv.next489.1 = add nuw nsw i64 %indvars.iv.next489, 1, !dbg !443
  %exitcond491.1 = icmp eq i32 %323, %310, !dbg !443
  br i1 %exitcond491.1, label %for.inc23.i272.loopexit.unr-lcssa, label %for.cond4.preheader.i255, !dbg !443

for.body6.lr.ph.i108.1:                           ; preds = %for.inc20.i119
  %474 = mul i32 %185, %205, !dbg !354
  %475 = add i32 %195, %474, !dbg !354
  %476 = sext i32 %475 to i64
  %scevgep538.1 = getelementptr float* %186, i64 %476
  %scevgep538539.1 = bitcast float* %scevgep538.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep538539.1, i8 0, i64 %191, i32 4, i1 false), !dbg !352
  br label %for.inc20.i119.1

for.inc20.i119.1:                                 ; preds = %for.body6.lr.ph.i108.1, %for.inc20.i119
  %indvars.iv.next541.1 = add nuw nsw i64 %indvars.iv.next541, 1, !dbg !353
  %exitcond543.1 = icmp eq i32 %205, %192, !dbg !353
  br i1 %exitcond543.1, label %for.inc23.i122.loopexit.unr-lcssa, label %for.cond4.preheader.i105, !dbg !353
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* nocapture %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !73, metadata !152), !dbg !601
  tail call void @llvm.dbg.value(metadata i32 %mnums, i64 0, metadata !74, metadata !152), !dbg !602
  tail call void @llvm.dbg.value(metadata i32 %mrows, i64 0, metadata !75, metadata !152), !dbg !603
  tail call void @llvm.dbg.value(metadata i32 %mcols, i64 0, metadata !76, metadata !152), !dbg !604
  tail call void @llvm.dbg.value(metadata i32 %mdeps, i64 0, metadata !77, metadata !152), !dbg !605
  %mnums1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 1, !dbg !606
  store i32 %mnums, i32* %mnums1, align 4, !dbg !606, !tbaa !176
  %mrows2 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !607
  store i32 %mrows, i32* %mrows2, align 4, !dbg !607, !tbaa !183
  %mcols3 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !608
  store i32 %mcols, i32* %mcols3, align 4, !dbg !608, !tbaa !185
  %mdeps4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !609
  store i32 %mdeps, i32* %mdeps4, align 4, !dbg !609, !tbaa !187
  %mul = mul nsw i32 %mrows, %mnums, !dbg !610
  %mul5 = mul nsw i32 %mul, %mcols, !dbg !610
  %mul6 = mul nsw i32 %mul5, %mdeps, !dbg !610
  %conv = sext i32 %mul6 to i64, !dbg !610
  %mul7 = shl nsw i64 %conv, 2, !dbg !610
  %call = tail call noalias i8* @malloc(i64 %mul7) #6, !dbg !611
  %0 = bitcast %struct.Mat* %Mat to i8**, !dbg !612
  store i8* %call, i8** %0, align 8, !dbg !612, !tbaa !190
  %cmp = icmp ne i8* %call, null, !dbg !613
  %cond = zext i1 %cmp to i32, !dbg !614
  ret i32 %cond, !dbg !615
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* nocapture readonly %Mat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !95, metadata !152), !dbg !616
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !152), !dbg !617
  %mrows = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !618
  %0 = load i32* %mrows, align 4, !dbg !618, !tbaa !183
  %cmp56 = icmp sgt i32 %0, 0, !dbg !619
  br i1 %cmp56, label %for.cond1.preheader.lr.ph, label %for.end31, !dbg !620

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %mcols = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !621
  %1 = load i32* %mcols, align 4, !dbg !621, !tbaa !185
  %cmp254 = icmp sgt i32 %1, 0, !dbg !622
  %mdeps = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !623
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !624
  br i1 %cmp254, label %for.cond4.preheader.lr.ph.us.preheader, label %for.end31

for.cond4.preheader.lr.ph.us.preheader:           ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond4.preheader.lr.ph.us, !dbg !623

for.inc29.us.loopexit:                            ; preds = %for.inc26.us.us
  br label %for.inc29.us

for.inc29.us:                                     ; preds = %for.inc29.us.loopexit, %for.cond4.preheader.lr.ph.us
  %inc30.us = add nuw nsw i32 %i.057.us, 1, !dbg !625
  tail call void @llvm.dbg.value(metadata i32 %inc30.us, i64 0, metadata !96, metadata !152), !dbg !617
  %cmp.us = icmp slt i32 %inc30.us, %0, !dbg !619
  br i1 %cmp.us, label %for.cond4.preheader.lr.ph.us, label %for.end31.loopexit, !dbg !620

for.cond4.preheader.lr.ph.us:                     ; preds = %for.cond4.preheader.lr.ph.us.preheader, %for.inc29.us
  %i.057.us = phi i32 [ %inc30.us, %for.inc29.us ], [ 0, %for.cond4.preheader.lr.ph.us.preheader ]
  %2 = load i32* %mdeps, align 4, !dbg !623, !tbaa !187
  %cmp552.us = icmp sgt i32 %2, 0, !dbg !626
  %mul.us = mul nsw i32 %i.057.us, %i.057.us, !dbg !627
  %conv.us = sitofp i32 %mul.us to float, !dbg !628
  br i1 %cmp552.us, label %for.body6.lr.ph.us.us.preheader, label %for.inc29.us

for.body6.lr.ph.us.us.preheader:                  ; preds = %for.cond4.preheader.lr.ph.us
  %3 = lshr i32 %2, 1, !dbg !629
  %4 = mul i32 %3, 2, !dbg !629
  %5 = add i32 %4, -2, !dbg !629
  %6 = lshr i32 %5, 1, !dbg !629
  %7 = add i32 %6, 1, !dbg !629
  br label %for.body6.lr.ph.us.us, !dbg !629

for.inc26.us.us.loopexit.unr-lcssa:               ; preds = %for.body6.us.us
  br label %for.inc26.us.us.loopexit

for.inc26.us.us.loopexit:                         ; preds = %for.body6.us.us.preheader.split, %for.inc26.us.us.loopexit.unr-lcssa
  br label %for.inc26.us.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us.loopexit, %middle.block
  %inc27.us.us = add nuw nsw i32 %j.055.us.us, 1, !dbg !630
  tail call void @llvm.dbg.value(metadata i32 %inc27.us.us, i64 0, metadata !97, metadata !152), !dbg !631
  %cmp2.us.us = icmp slt i32 %inc27.us.us, %1, !dbg !622
  br i1 %cmp2.us.us, label %for.body6.lr.ph.us.us, label %for.inc29.us.loopexit, !dbg !632

for.body6.lr.ph.us.us:                            ; preds = %for.body6.lr.ph.us.us.preheader, %for.inc26.us.us
  %j.055.us.us = phi i32 [ %inc27.us.us, %for.inc26.us.us ], [ 0, %for.body6.lr.ph.us.us.preheader ]
  %sub.us.us = add nsw i32 %0, -1, !dbg !629
  %mul10.us.us = mul nsw i32 %sub.us.us, %sub.us.us, !dbg !633
  %conv11.us.us = sitofp i32 %mul10.us.us to float, !dbg !634
  %div.us.us = fdiv float %conv.us, %conv11.us.us, !dbg !628
  %mul19.us.us = mul nsw i32 %1, %i.057.us, !dbg !624
  %mul2151.us.us = add i32 %mul19.us.us, %j.055.us.us, !dbg !624
  %8 = load float** %m, align 8, !dbg !624, !tbaa !190
  %backedge.overflow = icmp eq i32 %2, 0
  br i1 %backedge.overflow, label %for.body6.us.us.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body6.lr.ph.us.us
  %n.vec = and i32 %2, -2, !dbg !635
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !635
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %xtraiter = and i32 %7, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %7, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !635
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %induction8384.prol = or i32 %index.prol, 1
  %9 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %10 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %11 = add nsw i32 %9, %index.prol, !dbg !624
  %12 = add nsw i32 %10, %induction8384.prol, !dbg !624
  %13 = sext i32 %11 to i64, !dbg !624
  %14 = sext i32 %12 to i64, !dbg !624
  %15 = getelementptr inbounds float* %8, i64 %13, !dbg !624
  %16 = getelementptr inbounds float* %8, i64 %14, !dbg !624
  store float %div.us.us, float* %15, align 4, !dbg !624, !tbaa !320
  store float %div.us.us, float* %16, align 4, !dbg !624, !tbaa !320
  %index.next.prol = add i32 %index.prol, 2, !dbg !635
  %17 = icmp eq i32 %index.next.prol, %n.vec, !dbg !635
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !635
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !635
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !636

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i32 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i32 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %18 = icmp ult i32 %7, 2
  br i1 %18, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i32 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !635
  %induction8384 = or i32 %index, 1
  %19 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %20 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %21 = add nsw i32 %19, %index, !dbg !624
  %22 = add nsw i32 %20, %induction8384, !dbg !624
  %23 = sext i32 %21 to i64, !dbg !624
  %24 = sext i32 %22 to i64, !dbg !624
  %25 = getelementptr inbounds float* %8, i64 %23, !dbg !624
  %26 = getelementptr inbounds float* %8, i64 %24, !dbg !624
  store float %div.us.us, float* %25, align 4, !dbg !624, !tbaa !320
  store float %div.us.us, float* %26, align 4, !dbg !624, !tbaa !320
  %index.next = add i32 %index, 2, !dbg !635
  %induction8384.1 = or i32 %index.next, 1
  %27 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %28 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %29 = add nsw i32 %27, %index.next, !dbg !624
  %30 = add nsw i32 %28, %induction8384.1, !dbg !624
  %31 = sext i32 %29 to i64, !dbg !624
  %32 = sext i32 %30 to i64, !dbg !624
  %33 = getelementptr inbounds float* %8, i64 %31, !dbg !624
  %34 = getelementptr inbounds float* %8, i64 %32, !dbg !624
  store float %div.us.us, float* %33, align 4, !dbg !624, !tbaa !320
  store float %div.us.us, float* %34, align 4, !dbg !624, !tbaa !320
  %index.next.1 = add i32 %index.next, 2, !dbg !635
  %35 = icmp eq i32 %index.next.1, %n.vec, !dbg !635
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !635, !llvm.loop !637

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %2, %resume.val
  br i1 %cmp.n, label %for.inc26.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %middle.block, %for.body6.lr.ph.us.us
  %k.053.us.us.ph = phi i32 [ 0, %for.body6.lr.ph.us.us ], [ %resume.val, %middle.block ]
  %36 = add i32 %k.053.us.us.ph, 1
  %37 = icmp sgt i32 %2, %36
  %smax = select i1 %37, i32 %2, i32 %36
  %38 = sub i32 %smax, %k.053.us.us.ph
  %xtraiter85 = and i32 %38, 3
  %lcmp.mod86 = icmp ne i32 %xtraiter85, 0
  %lcmp.overflow87 = icmp eq i32 %38, 0
  %lcmp.or88 = or i1 %lcmp.overflow87, %lcmp.mod86
  br i1 %lcmp.or88, label %for.body6.us.us.prol.preheader, label %for.body6.us.us.preheader.split

for.body6.us.us.prol.preheader:                   ; preds = %for.body6.us.us.preheader
  br label %for.body6.us.us.prol, !dbg !624

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader, %for.body6.us.us.prol
  %k.053.us.us.prol = phi i32 [ %inc.us.us.prol, %for.body6.us.us.prol ], [ %k.053.us.us.ph, %for.body6.us.us.prol.preheader ]
  %prol.iter89 = phi i32 [ %prol.iter89.sub, %for.body6.us.us.prol ], [ %xtraiter85, %for.body6.us.us.prol.preheader ]
  %add24.us.us.prol = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %add25.us.us.prol = add nsw i32 %add24.us.us.prol, %k.053.us.us.prol, !dbg !624
  %idxprom.us.us.prol = sext i32 %add25.us.us.prol to i64, !dbg !624
  %arrayidx.us.us.prol = getelementptr inbounds float* %8, i64 %idxprom.us.us.prol, !dbg !624
  store float %div.us.us, float* %arrayidx.us.us.prol, align 4, !dbg !624, !tbaa !320
  %inc.us.us.prol = add nuw nsw i32 %k.053.us.us.prol, 1, !dbg !635
  tail call void @llvm.dbg.value(metadata i32 %inc.us.us.prol, i64 0, metadata !98, metadata !152), !dbg !638
  %cmp5.us.us.prol = icmp slt i32 %inc.us.us.prol, %2, !dbg !626
  %prol.iter89.sub = sub i32 %prol.iter89, 1, !dbg !639
  %prol.iter89.cmp = icmp ne i32 %prol.iter89.sub, 0, !dbg !639
  br i1 %prol.iter89.cmp, label %for.body6.us.us.prol, label %for.body6.us.us.preheader.split.loopexit, !llvm.loop !640

for.body6.us.us.preheader.split.loopexit:         ; preds = %for.body6.us.us.prol
  %k.053.us.us.unr.ph = phi i32 [ %inc.us.us.prol, %for.body6.us.us.prol ]
  br label %for.body6.us.us.preheader.split

for.body6.us.us.preheader.split:                  ; preds = %for.body6.us.us.preheader.split.loopexit, %for.body6.us.us.preheader
  %k.053.us.us.unr = phi i32 [ %k.053.us.us.ph, %for.body6.us.us.preheader ], [ %k.053.us.us.unr.ph, %for.body6.us.us.preheader.split.loopexit ]
  %39 = icmp ult i32 %38, 4
  br i1 %39, label %for.inc26.us.us.loopexit, label %for.body6.us.us.preheader.split.split

for.body6.us.us.preheader.split.split:            ; preds = %for.body6.us.us.preheader.split
  br label %for.body6.us.us, !dbg !624

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body6.us.us.preheader.split.split
  %k.053.us.us = phi i32 [ %k.053.us.us.unr, %for.body6.us.us.preheader.split.split ], [ %inc.us.us.3, %for.body6.us.us ]
  %add24.us.us = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %add25.us.us = add nsw i32 %add24.us.us, %k.053.us.us, !dbg !624
  %idxprom.us.us = sext i32 %add25.us.us to i64, !dbg !624
  %arrayidx.us.us = getelementptr inbounds float* %8, i64 %idxprom.us.us, !dbg !624
  store float %div.us.us, float* %arrayidx.us.us, align 4, !dbg !624, !tbaa !320
  %inc.us.us = add nuw nsw i32 %k.053.us.us, 1, !dbg !635
  tail call void @llvm.dbg.value(metadata i32 %inc.us.us, i64 0, metadata !98, metadata !152), !dbg !638
  %add24.us.us.1 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %add25.us.us.1 = add nsw i32 %add24.us.us.1, %inc.us.us, !dbg !624
  %idxprom.us.us.1 = sext i32 %add25.us.us.1 to i64, !dbg !624
  %arrayidx.us.us.1 = getelementptr inbounds float* %8, i64 %idxprom.us.us.1, !dbg !624
  store float %div.us.us, float* %arrayidx.us.us.1, align 4, !dbg !624, !tbaa !320
  %inc.us.us.1 = add nuw nsw i32 %inc.us.us, 1, !dbg !635
  tail call void @llvm.dbg.value(metadata i32 %inc.us.us, i64 0, metadata !98, metadata !152), !dbg !638
  %add24.us.us.2 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %add25.us.us.2 = add nsw i32 %add24.us.us.2, %inc.us.us.1, !dbg !624
  %idxprom.us.us.2 = sext i32 %add25.us.us.2 to i64, !dbg !624
  %arrayidx.us.us.2 = getelementptr inbounds float* %8, i64 %idxprom.us.us.2, !dbg !624
  store float %div.us.us, float* %arrayidx.us.us.2, align 4, !dbg !624, !tbaa !320
  %inc.us.us.2 = add nuw nsw i32 %inc.us.us.1, 1, !dbg !635
  tail call void @llvm.dbg.value(metadata i32 %inc.us.us, i64 0, metadata !98, metadata !152), !dbg !638
  %add24.us.us.3 = mul nsw i32 %mul2151.us.us, %2, !dbg !624
  %add25.us.us.3 = add nsw i32 %add24.us.us.3, %inc.us.us.2, !dbg !624
  %idxprom.us.us.3 = sext i32 %add25.us.us.3 to i64, !dbg !624
  %arrayidx.us.us.3 = getelementptr inbounds float* %8, i64 %idxprom.us.us.3, !dbg !624
  store float %div.us.us, float* %arrayidx.us.us.3, align 4, !dbg !624, !tbaa !320
  %inc.us.us.3 = add nuw nsw i32 %inc.us.us.2, 1, !dbg !635
  tail call void @llvm.dbg.value(metadata i32 %inc.us.us, i64 0, metadata !98, metadata !152), !dbg !638
  %cmp5.us.us.3 = icmp slt i32 %inc.us.us.3, %2, !dbg !626
  br i1 %cmp5.us.us.3, label %for.body6.us.us, label %for.inc26.us.us.loopexit.unr-lcssa, !dbg !639, !llvm.loop !641

for.end31.loopexit:                               ; preds = %for.inc29.us
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.cond1.preheader.lr.ph, %entry
  ret void, !dbg !642
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* nocapture readonly %Mat, i32 %l, float %val) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !87, metadata !152), !dbg !643
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !88, metadata !152), !dbg !644
  tail call void @llvm.dbg.value(metadata float %val, i64 0, metadata !89, metadata !152), !dbg !645
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !90, metadata !152), !dbg !646
  %mrows = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !647
  %0 = load i32* %mrows, align 4, !dbg !647, !tbaa !183
  %cmp48 = icmp sgt i32 %0, 0, !dbg !648
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end25, !dbg !649

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %mcols = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !650
  %1 = load i32* %mcols, align 4, !dbg !650, !tbaa !185
  %cmp246 = icmp sgt i32 %1, 0, !dbg !651
  %mdeps = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !652
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !653
  br label %for.cond1.preheader, !dbg !649

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc23
  %i.049 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc24, %for.inc23 ]
  br i1 %cmp246, label %for.cond4.preheader.lr.ph, label %for.inc23, !dbg !654

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %2 = load i32* %mdeps, align 4, !dbg !652, !tbaa !187
  %cmp544 = icmp sgt i32 %2, 0, !dbg !655
  %3 = lshr i32 %2, 1, !dbg !654
  %4 = mul i32 %3, 2, !dbg !654
  %5 = add i32 %4, -2, !dbg !654
  %6 = lshr i32 %5, 1, !dbg !654
  %7 = add i32 %6, 1, !dbg !654
  br label %for.cond4.preheader, !dbg !654

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc20
  %j.047 = phi i32 [ 0, %for.cond4.preheader.lr.ph ], [ %inc21, %for.inc20 ]
  br i1 %cmp544, label %for.body6.lr.ph, label %for.inc20, !dbg !656

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %mul = mul nsw i32 %0, %l, !dbg !653
  %mul942 = add i32 %mul, %i.049, !dbg !653
  %mul1141 = mul i32 %mul942, %1, !dbg !653
  %add43 = add i32 %mul1141, %j.047, !dbg !653
  %8 = load float** %m, align 8, !dbg !653, !tbaa !190
  %backedge.overflow = icmp eq i32 %2, 0
  br i1 %backedge.overflow, label %for.body6.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body6.lr.ph
  %n.vec = and i32 %2, -2, !dbg !657
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !657
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  %xtraiter = and i32 %7, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %7, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !657
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %induction5152.prol = or i32 %index.prol, 1
  %9 = mul nsw i32 %add43, %2, !dbg !653
  %10 = mul nsw i32 %add43, %2, !dbg !653
  %11 = add nsw i32 %9, %index.prol, !dbg !653
  %12 = add nsw i32 %10, %induction5152.prol, !dbg !653
  %13 = sext i32 %11 to i64, !dbg !653
  %14 = sext i32 %12 to i64, !dbg !653
  %15 = getelementptr inbounds float* %8, i64 %13, !dbg !653
  %16 = getelementptr inbounds float* %8, i64 %14, !dbg !653
  store float %val, float* %15, align 4, !dbg !653, !tbaa !320
  store float %val, float* %16, align 4, !dbg !653, !tbaa !320
  %index.next.prol = add i32 %index.prol, 2, !dbg !657
  %17 = icmp eq i32 %index.next.prol, %n.vec, !dbg !657
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !657
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !657
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !658

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i32 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i32 [ 0, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %18 = icmp ult i32 %7, 2
  br i1 %18, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i32 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !657
  %induction5152 = or i32 %index, 1
  %19 = mul nsw i32 %add43, %2, !dbg !653
  %20 = mul nsw i32 %add43, %2, !dbg !653
  %21 = add nsw i32 %19, %index, !dbg !653
  %22 = add nsw i32 %20, %induction5152, !dbg !653
  %23 = sext i32 %21 to i64, !dbg !653
  %24 = sext i32 %22 to i64, !dbg !653
  %25 = getelementptr inbounds float* %8, i64 %23, !dbg !653
  %26 = getelementptr inbounds float* %8, i64 %24, !dbg !653
  store float %val, float* %25, align 4, !dbg !653, !tbaa !320
  store float %val, float* %26, align 4, !dbg !653, !tbaa !320
  %index.next = add i32 %index, 2, !dbg !657
  %induction5152.1 = or i32 %index.next, 1
  %27 = mul nsw i32 %add43, %2, !dbg !653
  %28 = mul nsw i32 %add43, %2, !dbg !653
  %29 = add nsw i32 %27, %index.next, !dbg !653
  %30 = add nsw i32 %28, %induction5152.1, !dbg !653
  %31 = sext i32 %29 to i64, !dbg !653
  %32 = sext i32 %30 to i64, !dbg !653
  %33 = getelementptr inbounds float* %8, i64 %31, !dbg !653
  %34 = getelementptr inbounds float* %8, i64 %32, !dbg !653
  store float %val, float* %33, align 4, !dbg !653, !tbaa !320
  store float %val, float* %34, align 4, !dbg !653, !tbaa !320
  %index.next.1 = add i32 %index.next, 2, !dbg !657
  %35 = icmp eq i32 %index.next.1, %n.vec, !dbg !657
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !657, !llvm.loop !659

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %2, %resume.val
  br i1 %cmp.n, label %for.inc20, label %for.body6.preheader

for.body6.preheader:                              ; preds = %middle.block, %for.body6.lr.ph
  %k.045.ph = phi i32 [ 0, %for.body6.lr.ph ], [ %resume.val, %middle.block ]
  %36 = add i32 %k.045.ph, 1
  %37 = icmp sgt i32 %2, %36
  %smax = select i1 %37, i32 %2, i32 %36
  %38 = sub i32 %smax, %k.045.ph
  %xtraiter53 = and i32 %38, 3
  %lcmp.mod54 = icmp ne i32 %xtraiter53, 0
  %lcmp.overflow55 = icmp eq i32 %38, 0
  %lcmp.or56 = or i1 %lcmp.overflow55, %lcmp.mod54
  br i1 %lcmp.or56, label %for.body6.prol.preheader, label %for.body6.preheader.split

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol, !dbg !653

for.body6.prol:                                   ; preds = %for.body6.prol.preheader, %for.body6.prol
  %k.045.prol = phi i32 [ %inc.prol, %for.body6.prol ], [ %k.045.ph, %for.body6.prol.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %for.body6.prol ], [ %xtraiter53, %for.body6.prol.preheader ]
  %add18.prol = mul nsw i32 %add43, %2, !dbg !653
  %add19.prol = add nsw i32 %add18.prol, %k.045.prol, !dbg !653
  %idxprom.prol = sext i32 %add19.prol to i64, !dbg !653
  %arrayidx.prol = getelementptr inbounds float* %8, i64 %idxprom.prol, !dbg !653
  store float %val, float* %arrayidx.prol, align 4, !dbg !653, !tbaa !320
  %inc.prol = add nuw nsw i32 %k.045.prol, 1, !dbg !657
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !92, metadata !152), !dbg !660
  %cmp5.prol = icmp slt i32 %inc.prol, %2, !dbg !655
  %prol.iter57.sub = sub i32 %prol.iter57, 1, !dbg !656
  %prol.iter57.cmp = icmp ne i32 %prol.iter57.sub, 0, !dbg !656
  br i1 %prol.iter57.cmp, label %for.body6.prol, label %for.body6.preheader.split.loopexit, !llvm.loop !661

for.body6.preheader.split.loopexit:               ; preds = %for.body6.prol
  %k.045.unr.ph = phi i32 [ %inc.prol, %for.body6.prol ]
  br label %for.body6.preheader.split

for.body6.preheader.split:                        ; preds = %for.body6.preheader.split.loopexit, %for.body6.preheader
  %k.045.unr = phi i32 [ %k.045.ph, %for.body6.preheader ], [ %k.045.unr.ph, %for.body6.preheader.split.loopexit ]
  %39 = icmp ult i32 %38, 4
  br i1 %39, label %for.inc20.loopexit, label %for.body6.preheader.split.split

for.body6.preheader.split.split:                  ; preds = %for.body6.preheader.split
  br label %for.body6, !dbg !653

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.split.split
  %k.045 = phi i32 [ %k.045.unr, %for.body6.preheader.split.split ], [ %inc.3, %for.body6 ]
  %add18 = mul nsw i32 %add43, %2, !dbg !653
  %add19 = add nsw i32 %add18, %k.045, !dbg !653
  %idxprom = sext i32 %add19 to i64, !dbg !653
  %arrayidx = getelementptr inbounds float* %8, i64 %idxprom, !dbg !653
  store float %val, float* %arrayidx, align 4, !dbg !653, !tbaa !320
  %inc = add nuw nsw i32 %k.045, 1, !dbg !657
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !660
  %add18.1 = mul nsw i32 %add43, %2, !dbg !653
  %add19.1 = add nsw i32 %add18.1, %inc, !dbg !653
  %idxprom.1 = sext i32 %add19.1 to i64, !dbg !653
  %arrayidx.1 = getelementptr inbounds float* %8, i64 %idxprom.1, !dbg !653
  store float %val, float* %arrayidx.1, align 4, !dbg !653, !tbaa !320
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !657
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !660
  %add18.2 = mul nsw i32 %add43, %2, !dbg !653
  %add19.2 = add nsw i32 %add18.2, %inc.1, !dbg !653
  %idxprom.2 = sext i32 %add19.2 to i64, !dbg !653
  %arrayidx.2 = getelementptr inbounds float* %8, i64 %idxprom.2, !dbg !653
  store float %val, float* %arrayidx.2, align 4, !dbg !653, !tbaa !320
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !657
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !660
  %add18.3 = mul nsw i32 %add43, %2, !dbg !653
  %add19.3 = add nsw i32 %add18.3, %inc.2, !dbg !653
  %idxprom.3 = sext i32 %add19.3 to i64, !dbg !653
  %arrayidx.3 = getelementptr inbounds float* %8, i64 %idxprom.3, !dbg !653
  store float %val, float* %arrayidx.3, align 4, !dbg !653, !tbaa !320
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !657
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !660
  %cmp5.3 = icmp slt i32 %inc.3, %2, !dbg !655
  br i1 %cmp5.3, label %for.body6, label %for.inc20.loopexit.unr-lcssa, !dbg !656, !llvm.loop !662

for.inc20.loopexit.unr-lcssa:                     ; preds = %for.body6
  br label %for.inc20.loopexit

for.inc20.loopexit:                               ; preds = %for.body6.preheader.split, %for.inc20.loopexit.unr-lcssa
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit, %middle.block, %for.cond4.preheader
  %inc21 = add nuw nsw i32 %j.047, 1, !dbg !663
  tail call void @llvm.dbg.value(metadata i32 %inc21, i64 0, metadata !91, metadata !152), !dbg !664
  %cmp2 = icmp slt i32 %inc21, %1, !dbg !651
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc23.loopexit, !dbg !654

for.inc23.loopexit:                               ; preds = %for.inc20
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond1.preheader
  %inc24 = add nuw nsw i32 %i.049, 1, !dbg !665
  tail call void @llvm.dbg.value(metadata i32 %inc24, i64 0, metadata !90, metadata !152), !dbg !646
  %cmp = icmp slt i32 %inc24, %0, !dbg !648
  br i1 %cmp, label %for.cond1.preheader, label %for.end25.loopexit, !dbg !649

for.end25.loopexit:                               ; preds = %for.inc23
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %entry
  ret void, !dbg !666
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* nocapture readonly %a, %struct.Mat* nocapture readonly %b, %struct.Mat* nocapture readonly %c, %struct.Mat* nocapture readonly %p, %struct.Mat* nocapture readonly %bnd, %struct.Mat* nocapture readonly %wrk1, %struct.Mat* nocapture readonly %wrk2) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nn, i64 0, metadata !105, metadata !152), !dbg !667
  tail call void @llvm.dbg.value(metadata %struct.Mat* %a, i64 0, metadata !106, metadata !152), !dbg !668
  tail call void @llvm.dbg.value(metadata %struct.Mat* %b, i64 0, metadata !107, metadata !152), !dbg !669
  tail call void @llvm.dbg.value(metadata %struct.Mat* %c, i64 0, metadata !108, metadata !152), !dbg !670
  tail call void @llvm.dbg.value(metadata %struct.Mat* %p, i64 0, metadata !109, metadata !152), !dbg !671
  tail call void @llvm.dbg.value(metadata %struct.Mat* %bnd, i64 0, metadata !110, metadata !152), !dbg !672
  tail call void @llvm.dbg.value(metadata %struct.Mat* %wrk1, i64 0, metadata !111, metadata !152), !dbg !673
  tail call void @llvm.dbg.value(metadata %struct.Mat* %wrk2, i64 0, metadata !112, metadata !152), !dbg !674
  %mrows = getelementptr inbounds %struct.Mat* %p, i64 0, i32 2, !dbg !675
  %0 = load i32* %mrows, align 4, !dbg !675, !tbaa !183
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !117, metadata !152), !dbg !676
  %mcols = getelementptr inbounds %struct.Mat* %p, i64 0, i32 3, !dbg !677
  %1 = load i32* %mcols, align 4, !dbg !677, !tbaa !185
  tail call void @llvm.dbg.value(metadata i32 %sub1, i64 0, metadata !118, metadata !152), !dbg !678
  %mdeps = getelementptr inbounds %struct.Mat* %p, i64 0, i32 4, !dbg !679
  %2 = load i32* %mdeps, align 4, !dbg !679, !tbaa !187
  tail call void @llvm.dbg.value(metadata i32 %sub2, i64 0, metadata !119, metadata !152), !dbg !680
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !116, metadata !152), !dbg !681
  %cmp1114 = icmp sgt i32 %nn, 0, !dbg !682
  br i1 %cmp1114, label %for.cond3.preheader.lr.ph, label %for.end727, !dbg !685

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %sub2 = add nsw i32 %2, -1, !dbg !679
  %sub1 = add nsw i32 %1, -1, !dbg !677
  %sub = add nsw i32 %0, -1, !dbg !675
  %cmp41102 = icmp sgt i32 %sub, 1, !dbg !686
  %cmp6751109 = icmp sgt i32 %sub1, 1, !dbg !690
  %cmp6781107 = icmp sgt i32 %sub2, 1, !dbg !695
  %mcols682 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 3, !dbg !698
  %mdeps684 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 4, !dbg !698
  %m696 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 0, !dbg !698
  %m714 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 0, !dbg !699
  %mrows12 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 2, !dbg !700
  %mcols13 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 3, !dbg !700
  %mdeps15 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 4, !dbg !700
  %m = getelementptr inbounds %struct.Mat* %a, i64 0, i32 0, !dbg !700
  %mrows123 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 2, !dbg !706
  %mcols125 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 3, !dbg !706
  %mdeps127 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 4, !dbg !706
  %m139 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 0, !dbg !706
  %mrows432 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 2, !dbg !707
  %mcols434 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 3, !dbg !707
  %mdeps436 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 4, !dbg !707
  %m448 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 0, !dbg !707
  %mcols551 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 3, !dbg !708
  %mdeps553 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 4, !dbg !708
  %m565 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 0, !dbg !708
  %mcols608 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 3, !dbg !709
  %mdeps610 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 4, !dbg !709
  %m622 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 0, !dbg !709
  %3 = add i32 %2, -2, !dbg !685
  %4 = add i32 %1, -2, !dbg !685
  %5 = add i32 %0, -2, !dbg !685
  %6 = add i32 %nn, -1, !dbg !685
  %7 = add i32 %2, -3, !dbg !685
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, 1, !dbg !685
  %10 = zext i32 %7 to i64
  %11 = add nuw nsw i64 %10, 1, !dbg !685
  %12 = zext i32 %7 to i64
  %13 = add i64 %12, 1, !dbg !685
  %14 = lshr i64 %13, 3, !dbg !685
  %15 = mul i64 %14, 8, !dbg !685
  %16 = add i64 %15, -8, !dbg !685
  %17 = lshr i64 %16, 3, !dbg !685
  %18 = add i64 %17, 1, !dbg !685
  %19 = add i32 %2, -1
  br label %for.cond3.preheader, !dbg !685

for.cond3.preheader:                              ; preds = %for.inc725, %for.cond3.preheader.lr.ph
  %n.01115 = phi i32 [ 0, %for.cond3.preheader.lr.ph ], [ %inc726, %for.inc725 ]
  br i1 %cmp41102, label %for.cond6.preheader.preheader, label %for.inc725, !dbg !710

for.cond6.preheader.preheader:                    ; preds = %for.cond3.preheader
  br label %for.cond6.preheader, !dbg !711

for.cond671.preheader:                            ; preds = %for.inc668
  %gosa.2.lcssa.lcssa = phi float [ %gosa.2.lcssa, %for.inc668 ]
  br i1 %cmp41102, label %for.cond674.preheader.preheader, label %for.inc725, !dbg !712

for.cond674.preheader.preheader:                  ; preds = %for.cond671.preheader
  br label %for.cond674.preheader, !dbg !713

for.cond6.preheader:                              ; preds = %for.cond6.preheader.preheader, %for.inc668
  %i.01104 = phi i32 [ %add31, %for.inc668 ], [ 1, %for.cond6.preheader.preheader ]
  %gosa.11103 = phi float [ %gosa.2.lcssa, %for.inc668 ], [ 0.000000e+00, %for.cond6.preheader.preheader ]
  %add31 = add nuw nsw i32 %i.01104, 1, !dbg !711
  br i1 %cmp6751109, label %for.cond9.preheader.lr.ph, label %for.inc668, !dbg !714

for.cond9.preheader.lr.ph:                        ; preds = %for.cond6.preheader
  %sub188 = add nsw i32 %i.01104, -1, !dbg !715
  br label %for.cond9.preheader, !dbg !714

for.cond9.preheader:                              ; preds = %for.inc665, %for.cond9.preheader.lr.ph
  %j.01100 = phi i32 [ 1, %for.cond9.preheader.lr.ph ], [ %inc666.pre-phi, %for.inc665 ]
  %gosa.21099 = phi float [ %gosa.11103, %for.cond9.preheader.lr.ph ], [ %gosa.3.lcssa, %for.inc665 ]
  br i1 %cmp6781107, label %for.body11.lr.ph, label %for.cond9.preheader.for.inc665_crit_edge, !dbg !716

for.cond9.preheader.for.inc665_crit_edge:         ; preds = %for.cond9.preheader
  %inc666.pre = add nuw nsw i32 %j.01100, 1, !dbg !717
  br label %for.inc665, !dbg !716

for.body11.lr.ph:                                 ; preds = %for.cond9.preheader
  %20 = load i32* %mrows12, align 4, !dbg !700, !tbaa !183
  %21 = load i32* %mcols13, align 4, !dbg !700, !tbaa !185
  %22 = load i32* %mdeps15, align 4, !dbg !700, !tbaa !187
  %mul18 = mul nsw i32 %21, %i.01104, !dbg !700
  %mul20 = mul nsw i32 %mul18, %22, !dbg !700
  %mul22 = mul nsw i32 %22, %j.01100, !dbg !700
  %23 = load float** %m, align 8, !dbg !700, !tbaa !190
  %24 = load i32* %mcols, align 4, !dbg !711, !tbaa !185
  %25 = load i32* %mdeps, align 4, !dbg !711, !tbaa !187
  %mul33 = mul nsw i32 %24, %add31, !dbg !711
  %mul35 = mul nsw i32 %mul33, %25, !dbg !711
  %mul38 = mul nsw i32 %25, %j.01100, !dbg !711
  %add39 = add nsw i32 %mul35, %mul38, !dbg !711
  %26 = load float** %m714, align 8, !dbg !711, !tbaa !190
  %mul48 = mul nsw i32 %21, %20, !dbg !718
  %mul50 = mul nsw i32 %mul48, %22, !dbg !718
  %mul70 = mul nsw i32 %24, %i.01104, !dbg !719
  %mul72 = mul nsw i32 %mul70, %25, !dbg !719
  %add74 = add nuw nsw i32 %j.01100, 1, !dbg !719
  %mul76 = mul nsw i32 %25, %add74, !dbg !719
  %add77 = add nsw i32 %mul72, %mul76, !dbg !719
  %mul85 = shl i32 %20, 1, !dbg !720
  %mul87 = mul nsw i32 %mul85, %21, !dbg !720
  %mul89 = mul nsw i32 %mul87, %22, !dbg !720
  %add115 = add nsw i32 %mul72, %mul38, !dbg !721
  %27 = load i32* %mrows123, align 4, !dbg !706, !tbaa !183
  %28 = load i32* %mcols125, align 4, !dbg !706, !tbaa !185
  %29 = load i32* %mdeps127, align 4, !dbg !706, !tbaa !187
  %mul130 = mul nsw i32 %28, %i.01104, !dbg !706
  %mul132 = mul nsw i32 %mul130, %29, !dbg !706
  %mul135 = mul nsw i32 %29, %j.01100, !dbg !706
  %30 = load float** %m139, align 8, !dbg !706, !tbaa !190
  %sub173 = add nsw i32 %j.01100, -1, !dbg !722
  %mul175 = mul nsw i32 %25, %sub173, !dbg !722
  %mul190 = mul nsw i32 %24, %sub188, !dbg !715
  %mul192 = mul nsw i32 %mul190, %25, !dbg !715
  %mul229 = mul nsw i32 %28, %27, !dbg !723
  %mul231 = mul nsw i32 %mul229, %29, !dbg !723
  %add278 = add nsw i32 %mul72, %mul175, !dbg !724
  %mul330 = shl i32 %27, 1, !dbg !725
  %mul332 = mul nsw i32 %mul330, %28, !dbg !725
  %mul334 = mul nsw i32 %mul332, %29, !dbg !725
  %add381 = add nsw i32 %mul192, %mul38, !dbg !726
  %31 = load i32* %mrows432, align 4, !dbg !707, !tbaa !183
  %32 = load i32* %mcols434, align 4, !dbg !707, !tbaa !185
  %33 = load i32* %mdeps436, align 4, !dbg !707, !tbaa !187
  %mul439 = mul nsw i32 %32, %i.01104, !dbg !707
  %mul441 = mul nsw i32 %mul439, %33, !dbg !707
  %mul444 = mul nsw i32 %33, %j.01100, !dbg !707
  %34 = load float** %m448, align 8, !dbg !707, !tbaa !190
  %mul474 = mul nsw i32 %32, %31, !dbg !727
  %mul476 = mul nsw i32 %mul474, %33, !dbg !727
  %mul511 = shl i32 %31, 1, !dbg !728
  %mul513 = mul nsw i32 %mul511, %32, !dbg !728
  %mul515 = mul nsw i32 %mul513, %33, !dbg !728
  %35 = load i32* %mcols551, align 4, !dbg !708, !tbaa !185
  %36 = load i32* %mdeps553, align 4, !dbg !708, !tbaa !187
  %mul556 = mul nsw i32 %35, %i.01104, !dbg !708
  %mul5581092 = add i32 %mul556, %j.01100, !dbg !708
  %add562 = mul nsw i32 %mul5581092, %36, !dbg !708
  %37 = load float** %m565, align 8, !dbg !708, !tbaa !190
  %mul569 = mul nsw i32 %20, 3, !dbg !729
  %mul571 = mul nsw i32 %mul569, %21, !dbg !729
  %mul573 = mul nsw i32 %mul571, %22, !dbg !729
  %38 = load i32* %mcols608, align 4, !dbg !709, !tbaa !185
  %39 = load i32* %mdeps610, align 4, !dbg !709, !tbaa !187
  %mul613 = mul nsw i32 %38, %i.01104, !dbg !709
  %mul6151093 = add i32 %mul613, %j.01100, !dbg !709
  %add619 = mul nsw i32 %mul6151093, %39, !dbg !709
  %40 = load float** %m622, align 8, !dbg !709, !tbaa !190
  %41 = load i32* %mcols682, align 4, !dbg !730, !tbaa !185
  %42 = load i32* %mdeps684, align 4, !dbg !730, !tbaa !187
  %mul654 = mul nsw i32 %41, %i.01104, !dbg !730
  %mul6561094 = add i32 %mul654, %j.01100, !dbg !730
  %add660 = mul nsw i32 %mul6561094, %42, !dbg !730
  %43 = load float** %m696, align 8, !dbg !730, !tbaa !190
  %44 = sext i32 %add660 to i64, !dbg !716
  %45 = sext i32 %add619 to i64, !dbg !716
  %46 = sext i32 %add115 to i64, !dbg !716
  %47 = sext i32 %add562 to i64, !dbg !716
  %48 = sext i32 %add278 to i64, !dbg !716
  %49 = sext i32 %add381 to i64, !dbg !716
  %50 = sext i32 %add77 to i64, !dbg !716
  %51 = sext i32 %add39 to i64, !dbg !716
  br label %for.body11, !dbg !716

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %indvars.iv = phi i64 [ 1, %for.body11.lr.ph ], [ %indvars.iv.next, %for.body11 ]
  %gosa.31097 = phi float [ %gosa.21099, %for.body11.lr.ph ], [ %add626, %for.body11 ]
  %52 = trunc i64 %indvars.iv to i32, !dbg !700
  %add23 = add i32 %mul22, %52, !dbg !700
  %add24 = add i32 %add23, %mul20, !dbg !700
  %idxprom = sext i32 %add24 to i64, !dbg !700
  %arrayidx = getelementptr inbounds float* %23, i64 %idxprom, !dbg !700
  %53 = load float* %arrayidx, align 4, !dbg !700, !tbaa !320
  %54 = add nsw i64 %51, %indvars.iv, !dbg !711
  %arrayidx43 = getelementptr inbounds float* %26, i64 %54, !dbg !711
  %55 = load float* %arrayidx43, align 4, !dbg !711, !tbaa !320
  %mul44 = fmul float %53, %55, !dbg !700
  %add55 = add i32 %mul20, %52, !dbg !718
  %add58 = add i32 %add55, %mul50, !dbg !718
  %add59 = add i32 %add58, %mul22, !dbg !718
  %idxprom60 = sext i32 %add59 to i64, !dbg !718
  %arrayidx62 = getelementptr inbounds float* %23, i64 %idxprom60, !dbg !718
  %56 = load float* %arrayidx62, align 4, !dbg !718, !tbaa !320
  %57 = add nsw i64 %50, %indvars.iv, !dbg !719
  %arrayidx81 = getelementptr inbounds float* %26, i64 %57, !dbg !719
  %58 = load float* %arrayidx81, align 4, !dbg !719, !tbaa !320
  %mul82 = fmul float %56, %58, !dbg !718
  %add83 = fadd float %mul44, %mul82, !dbg !700
  %add97 = add i32 %add55, %mul89, !dbg !720
  %add98 = add i32 %add97, %mul22, !dbg !720
  %idxprom99 = sext i32 %add98 to i64, !dbg !720
  %arrayidx101 = getelementptr inbounds float* %23, i64 %idxprom99, !dbg !720
  %59 = load float* %arrayidx101, align 4, !dbg !720, !tbaa !320
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !716
  %60 = add nsw i64 %46, %indvars.iv.next, !dbg !721
  %arrayidx120 = getelementptr inbounds float* %26, i64 %60, !dbg !721
  %61 = load float* %arrayidx120, align 4, !dbg !721, !tbaa !320
  %mul121 = fmul float %59, %61, !dbg !720
  %add122 = fadd float %add83, %mul121, !dbg !700
  %add136 = add i32 %mul135, %52, !dbg !706
  %add137 = add i32 %add136, %mul132, !dbg !706
  %idxprom138 = sext i32 %add137 to i64, !dbg !706
  %arrayidx140 = getelementptr inbounds float* %30, i64 %idxprom138, !dbg !706
  %62 = load float* %arrayidx140, align 4, !dbg !706, !tbaa !320
  %add156 = add i32 %mul76, %52, !dbg !731
  %add157 = add i32 %add156, %mul35, !dbg !731
  %idxprom158 = sext i32 %add157 to i64, !dbg !731
  %arrayidx160 = getelementptr inbounds float* %26, i64 %idxprom158, !dbg !731
  %63 = load float* %arrayidx160, align 4, !dbg !731, !tbaa !320
  %add176 = add i32 %mul175, %52, !dbg !722
  %add177 = add i32 %add176, %mul35, !dbg !722
  %idxprom178 = sext i32 %add177 to i64, !dbg !722
  %arrayidx180 = getelementptr inbounds float* %26, i64 %idxprom178, !dbg !722
  %64 = load float* %arrayidx180, align 4, !dbg !722, !tbaa !320
  %sub181 = fsub float %63, %64, !dbg !731
  %add198 = add i32 %add156, %mul192, !dbg !715
  %idxprom199 = sext i32 %add198 to i64, !dbg !715
  %arrayidx201 = getelementptr inbounds float* %26, i64 %idxprom199, !dbg !715
  %65 = load float* %arrayidx201, align 4, !dbg !715, !tbaa !320
  %sub202 = fsub float %sub181, %65, !dbg !731
  %add219 = add i32 %add176, %mul192, !dbg !732
  %idxprom220 = sext i32 %add219 to i64, !dbg !732
  %arrayidx222 = getelementptr inbounds float* %26, i64 %idxprom220, !dbg !732
  %66 = load float* %arrayidx222, align 4, !dbg !732, !tbaa !320
  %add223 = fadd float %sub202, %66, !dbg !731
  %mul224 = fmul float %62, %add223, !dbg !706
  %add225 = fadd float %add122, %mul224, !dbg !700
  %add236 = add i32 %mul132, %52, !dbg !723
  %add239 = add i32 %add236, %mul231, !dbg !723
  %add240 = add i32 %add239, %mul135, !dbg !723
  %idxprom241 = sext i32 %add240 to i64, !dbg !723
  %arrayidx243 = getelementptr inbounds float* %30, i64 %idxprom241, !dbg !723
  %67 = load float* %arrayidx243, align 4, !dbg !723, !tbaa !320
  %68 = add nsw i64 %50, %indvars.iv.next, !dbg !733
  %arrayidx263 = getelementptr inbounds float* %26, i64 %68, !dbg !733
  %69 = load float* %arrayidx263, align 4, !dbg !733, !tbaa !320
  %70 = add nsw i64 %48, %indvars.iv.next, !dbg !724
  %arrayidx283 = getelementptr inbounds float* %26, i64 %70, !dbg !724
  %71 = load float* %arrayidx283, align 4, !dbg !724, !tbaa !320
  %sub284 = fsub float %69, %71, !dbg !733
  %72 = add nsw i64 %indvars.iv, -1, !dbg !734
  %73 = add nsw i64 %50, %72, !dbg !734
  %arrayidx304 = getelementptr inbounds float* %26, i64 %73, !dbg !734
  %74 = load float* %arrayidx304, align 4, !dbg !734, !tbaa !320
  %sub305 = fsub float %sub284, %74, !dbg !733
  %75 = add nsw i64 %48, %72, !dbg !735
  %arrayidx325 = getelementptr inbounds float* %26, i64 %75, !dbg !735
  %76 = load float* %arrayidx325, align 4, !dbg !735, !tbaa !320
  %add326 = fadd float %sub305, %76, !dbg !733
  %mul327 = fmul float %67, %add326, !dbg !723
  %add328 = fadd float %add225, %mul327, !dbg !700
  %add342 = add i32 %add236, %mul334, !dbg !725
  %add343 = add i32 %add342, %mul135, !dbg !725
  %idxprom344 = sext i32 %add343 to i64, !dbg !725
  %arrayidx346 = getelementptr inbounds float* %30, i64 %idxprom344, !dbg !725
  %77 = load float* %arrayidx346, align 4, !dbg !725, !tbaa !320
  %78 = add nsw i64 %51, %indvars.iv.next, !dbg !736
  %arrayidx366 = getelementptr inbounds float* %26, i64 %78, !dbg !736
  %79 = load float* %arrayidx366, align 4, !dbg !736, !tbaa !320
  %80 = add nsw i64 %49, %indvars.iv.next, !dbg !726
  %arrayidx386 = getelementptr inbounds float* %26, i64 %80, !dbg !726
  %81 = load float* %arrayidx386, align 4, !dbg !726, !tbaa !320
  %sub387 = fsub float %79, %81, !dbg !736
  %82 = add nsw i64 %51, %72, !dbg !737
  %arrayidx407 = getelementptr inbounds float* %26, i64 %82, !dbg !737
  %83 = load float* %arrayidx407, align 4, !dbg !737, !tbaa !320
  %sub408 = fsub float %sub387, %83, !dbg !736
  %84 = add nsw i64 %49, %72, !dbg !738
  %arrayidx428 = getelementptr inbounds float* %26, i64 %84, !dbg !738
  %85 = load float* %arrayidx428, align 4, !dbg !738, !tbaa !320
  %add429 = fadd float %sub408, %85, !dbg !736
  %mul430 = fmul float %77, %add429, !dbg !725
  %add431 = fadd float %add328, %mul430, !dbg !700
  %add445 = add i32 %mul444, %52, !dbg !707
  %add446 = add i32 %add445, %mul441, !dbg !707
  %idxprom447 = sext i32 %add446 to i64, !dbg !707
  %arrayidx449 = getelementptr inbounds float* %34, i64 %idxprom447, !dbg !707
  %86 = load float* %arrayidx449, align 4, !dbg !707, !tbaa !320
  %87 = add nsw i64 %49, %indvars.iv, !dbg !739
  %arrayidx468 = getelementptr inbounds float* %26, i64 %87, !dbg !739
  %88 = load float* %arrayidx468, align 4, !dbg !739, !tbaa !320
  %mul469 = fmul float %86, %88, !dbg !707
  %add470 = fadd float %add431, %mul469, !dbg !700
  %add481 = add i32 %mul441, %52, !dbg !727
  %add484 = add i32 %add481, %mul476, !dbg !727
  %add485 = add i32 %add484, %mul444, !dbg !727
  %idxprom486 = sext i32 %add485 to i64, !dbg !727
  %arrayidx488 = getelementptr inbounds float* %34, i64 %idxprom486, !dbg !727
  %89 = load float* %arrayidx488, align 4, !dbg !727, !tbaa !320
  %90 = add nsw i64 %48, %indvars.iv, !dbg !740
  %arrayidx507 = getelementptr inbounds float* %26, i64 %90, !dbg !740
  %91 = load float* %arrayidx507, align 4, !dbg !740, !tbaa !320
  %mul508 = fmul float %89, %91, !dbg !727
  %add509 = fadd float %add470, %mul508, !dbg !700
  %add523 = add i32 %add481, %mul515, !dbg !728
  %add524 = add i32 %add523, %mul444, !dbg !728
  %idxprom525 = sext i32 %add524 to i64, !dbg !728
  %arrayidx527 = getelementptr inbounds float* %34, i64 %idxprom525, !dbg !728
  %92 = load float* %arrayidx527, align 4, !dbg !728, !tbaa !320
  %93 = add nsw i64 %46, %72, !dbg !741
  %arrayidx546 = getelementptr inbounds float* %26, i64 %93, !dbg !741
  %94 = load float* %arrayidx546, align 4, !dbg !741, !tbaa !320
  %mul547 = fmul float %92, %94, !dbg !728
  %add548 = fadd float %add509, %mul547, !dbg !700
  %95 = add nsw i64 %47, %indvars.iv, !dbg !708
  %arrayidx566 = getelementptr inbounds float* %37, i64 %95, !dbg !708
  %96 = load float* %arrayidx566, align 4, !dbg !708, !tbaa !320
  %add567 = fadd float %add548, %96, !dbg !700
  tail call void @llvm.dbg.value(metadata float %add567, i64 0, metadata !121, metadata !152), !dbg !742
  %add581 = add i32 %add55, %mul573, !dbg !729
  %add582 = add i32 %add581, %mul22, !dbg !729
  %idxprom583 = sext i32 %add582 to i64, !dbg !729
  %arrayidx585 = getelementptr inbounds float* %23, i64 %idxprom583, !dbg !729
  %97 = load float* %arrayidx585, align 4, !dbg !729, !tbaa !320
  %mul586 = fmul float %add567, %97, !dbg !743
  %98 = add nsw i64 %46, %indvars.iv, !dbg !744
  %arrayidx604 = getelementptr inbounds float* %26, i64 %98, !dbg !744
  %99 = load float* %arrayidx604, align 4, !dbg !744, !tbaa !320
  %sub605 = fsub float %mul586, %99, !dbg !743
  %100 = add nsw i64 %45, %indvars.iv, !dbg !709
  %arrayidx623 = getelementptr inbounds float* %40, i64 %100, !dbg !709
  %101 = load float* %arrayidx623, align 4, !dbg !709, !tbaa !320
  %mul624 = fmul float %sub605, %101, !dbg !745
  tail call void @llvm.dbg.value(metadata float %mul624, i64 0, metadata !122, metadata !152), !dbg !746
  %mul625 = fmul float %mul624, %mul624, !dbg !747
  %add626 = fadd float %gosa.31097, %mul625, !dbg !748
  tail call void @llvm.dbg.value(metadata float %add626, i64 0, metadata !120, metadata !152), !dbg !749
  %102 = load float* @omega, align 4, !dbg !750, !tbaa !320
  %mul645 = fmul float %102, %mul624, !dbg !750
  %add646 = fadd float %99, %mul645, !dbg !751
  %103 = add nsw i64 %44, %indvars.iv, !dbg !730
  %arrayidx664 = getelementptr inbounds float* %43, i64 %103, !dbg !730
  store float %add646, float* %arrayidx664, align 4, !dbg !730, !tbaa !320
  %exitcond = icmp eq i32 %52, %3, !dbg !716
  br i1 %exitcond, label %for.inc665.loopexit, label %for.body11, !dbg !716

for.inc665.loopexit:                              ; preds = %for.body11
  %add626.lcssa = phi float [ %add626, %for.body11 ]
  br label %for.inc665

for.inc665:                                       ; preds = %for.inc665.loopexit, %for.cond9.preheader.for.inc665_crit_edge
  %inc666.pre-phi = phi i32 [ %inc666.pre, %for.cond9.preheader.for.inc665_crit_edge ], [ %add74, %for.inc665.loopexit ], !dbg !717
  %gosa.3.lcssa = phi float [ %gosa.21099, %for.cond9.preheader.for.inc665_crit_edge ], [ %add626.lcssa, %for.inc665.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %inc666.pre-phi, i64 0, metadata !114, metadata !152), !dbg !752
  %exitcond1136 = icmp eq i32 %j.01100, %4, !dbg !714
  br i1 %exitcond1136, label %for.inc668.loopexit, label %for.cond9.preheader, !dbg !714

for.inc668.loopexit:                              ; preds = %for.inc665
  %gosa.3.lcssa.lcssa = phi float [ %gosa.3.lcssa, %for.inc665 ]
  br label %for.inc668

for.inc668:                                       ; preds = %for.inc668.loopexit, %for.cond6.preheader
  %gosa.2.lcssa = phi float [ %gosa.11103, %for.cond6.preheader ], [ %gosa.3.lcssa.lcssa, %for.inc668.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %add31, i64 0, metadata !113, metadata !152), !dbg !753
  %exitcond1137 = icmp eq i32 %i.01104, %5, !dbg !710
  br i1 %exitcond1137, label %for.cond671.preheader, label %for.cond6.preheader, !dbg !710

for.cond674.preheader:                            ; preds = %for.cond674.preheader.preheader, %for.inc722
  %indvar1152 = phi i32 [ %indvar.next1153, %for.inc722 ], [ 0, %for.cond674.preheader.preheader ]
  %i.11112 = phi i32 [ %inc723, %for.inc722 ], [ 1, %for.cond674.preheader.preheader ]
  %104 = add i32 %indvar1152, 1, !dbg !713
  br i1 %cmp6751109, label %for.cond677.preheader.preheader, label %for.inc722, !dbg !713

for.cond677.preheader.preheader:                  ; preds = %for.cond674.preheader
  br label %for.cond677.preheader, !dbg !754

for.cond677.preheader:                            ; preds = %for.cond677.preheader.preheader, %for.inc719
  %indvar = phi i32 [ %indvar.next, %for.inc719 ], [ 0, %for.cond677.preheader.preheader ]
  %j.11110 = phi i32 [ %inc720, %for.inc719 ], [ 1, %for.cond677.preheader.preheader ]
  %105 = add i32 %indvar, 1, !dbg !754
  br i1 %cmp6781107, label %for.body679.lr.ph, label %for.inc719, !dbg !754

for.body679.lr.ph:                                ; preds = %for.cond677.preheader
  %106 = load i32* %mcols682, align 4, !dbg !698, !tbaa !185
  %107 = load i32* %mdeps684, align 4, !dbg !698, !tbaa !187
  %mul687 = mul nsw i32 %106, %i.11112, !dbg !698
  %mul6891090 = add i32 %mul687, %j.11110, !dbg !698
  %add693 = mul nsw i32 %mul6891090, %107, !dbg !698
  %108 = load float** %m696, align 8, !dbg !698, !tbaa !190
  %109 = load i32* %mcols, align 4, !dbg !699, !tbaa !185
  %110 = load i32* %mdeps, align 4, !dbg !699, !tbaa !187
  %mul705 = mul nsw i32 %109, %i.11112, !dbg !699
  %mul7071091 = add i32 %mul705, %j.11110, !dbg !699
  %add711 = mul nsw i32 %mul7071091, %110, !dbg !699
  %111 = load float** %m714, align 8, !dbg !699, !tbaa !190
  %112 = sext i32 %add711 to i64, !dbg !754
  %113 = sext i32 %add693 to i64, !dbg !754
  %end.idx = add nuw nsw i64 %8, 2, !dbg !754
  %n.vec = and i64 %9, 8589934584, !dbg !754
  %end.idx.rnd.down1177 = or i64 %n.vec, 1, !dbg !754
  %cmp.zero = icmp eq i64 %end.idx.rnd.down1177, 1, !dbg !754
  %114 = mul i32 %104, %109
  %115 = add i32 %105, %114
  %116 = mul i32 %110, %115
  %117 = sext i32 %116 to i64
  %118 = mul i32 %104, %106
  %119 = add i32 %105, %118
  %120 = mul i32 %107, %119
  %121 = sext i32 %120 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body679.lr.ph
  %scevgep.sum = add nsw i64 %117, 1
  %scevgep1154 = getelementptr float* %111, i64 %scevgep.sum
  %scevgep1162.sum = add nsw i64 %11, %121
  %scevgep1163 = getelementptr float* %108, i64 %scevgep1162.sum
  %bound0 = icmp ule float* %scevgep1154, %scevgep1163
  %scevgep1159.sum = add nsw i64 %121, 1
  %scevgep1160 = getelementptr float* %108, i64 %scevgep1159.sum
  %scevgep1156.sum = add nsw i64 %11, %117
  %scevgep1157 = getelementptr float* %111, i64 %scevgep1156.sum
  %bound1 = icmp ule float* %scevgep1160, %scevgep1157
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %18, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %vector.body.prol.preheader, label %vector.body.preheader.split

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !698

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 1, %vector.body.prol.preheader ], !dbg !754
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %122 = add i64 %113, %index.prol, !dbg !698
  %123 = getelementptr inbounds float* %108, i64 %122, !dbg !698
  %124 = bitcast float* %123 to <4 x float>*, !dbg !698
  %wide.load.prol = load <4 x float>* %124, align 4, !dbg !698, !tbaa !320
  %.sum.prol = add i64 %122, 4, !dbg !698
  %125 = getelementptr float* %108, i64 %.sum.prol, !dbg !698
  %126 = bitcast float* %125 to <4 x float>*, !dbg !698
  %wide.load1168.prol = load <4 x float>* %126, align 4, !dbg !698, !tbaa !320
  %127 = add i64 %112, %index.prol, !dbg !699
  %128 = getelementptr inbounds float* %111, i64 %127, !dbg !699
  %129 = bitcast float* %128 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load.prol, <4 x float>* %129, align 4, !dbg !699, !tbaa !320
  %.sum1178.prol = add i64 %127, 4, !dbg !699
  %130 = getelementptr float* %111, i64 %.sum1178.prol, !dbg !699
  %131 = bitcast float* %130 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load1168.prol, <4 x float>* %131, align 4, !dbg !699, !tbaa !320
  %index.next.prol = add i64 %index.prol, 8, !dbg !754
  %132 = icmp eq i64 %index.next.prol, %end.idx.rnd.down1177, !dbg !754
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !754
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !754
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !755

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 1, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %133 = icmp ult i64 %18, 2
  br i1 %133, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !698

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !754
  %134 = add i64 %113, %index, !dbg !698
  %135 = getelementptr inbounds float* %108, i64 %134, !dbg !698
  %136 = bitcast float* %135 to <4 x float>*, !dbg !698
  %wide.load = load <4 x float>* %136, align 4, !dbg !698, !tbaa !320
  %.sum = add i64 %134, 4, !dbg !698
  %137 = getelementptr float* %108, i64 %.sum, !dbg !698
  %138 = bitcast float* %137 to <4 x float>*, !dbg !698
  %wide.load1168 = load <4 x float>* %138, align 4, !dbg !698, !tbaa !320
  %139 = add i64 %112, %index, !dbg !699
  %140 = getelementptr inbounds float* %111, i64 %139, !dbg !699
  %141 = bitcast float* %140 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load, <4 x float>* %141, align 4, !dbg !699, !tbaa !320
  %.sum1178 = add i64 %139, 4, !dbg !699
  %142 = getelementptr float* %111, i64 %.sum1178, !dbg !699
  %143 = bitcast float* %142 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load1168, <4 x float>* %143, align 4, !dbg !699, !tbaa !320
  %index.next = add i64 %index, 8, !dbg !754
  %144 = add i64 %113, %index.next, !dbg !698
  %145 = getelementptr inbounds float* %108, i64 %144, !dbg !698
  %146 = bitcast float* %145 to <4 x float>*, !dbg !698
  %wide.load.1 = load <4 x float>* %146, align 4, !dbg !698, !tbaa !320
  %.sum.1 = add i64 %144, 4, !dbg !698
  %147 = getelementptr float* %108, i64 %.sum.1, !dbg !698
  %148 = bitcast float* %147 to <4 x float>*, !dbg !698
  %wide.load1168.1 = load <4 x float>* %148, align 4, !dbg !698, !tbaa !320
  %149 = add i64 %112, %index.next, !dbg !699
  %150 = getelementptr inbounds float* %111, i64 %149, !dbg !699
  %151 = bitcast float* %150 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load.1, <4 x float>* %151, align 4, !dbg !699, !tbaa !320
  %.sum1178.1 = add i64 %149, 4, !dbg !699
  %152 = getelementptr float* %111, i64 %.sum1178.1, !dbg !699
  %153 = bitcast float* %152 to <4 x float>*, !dbg !699
  store <4 x float> %wide.load1168.1, <4 x float>* %153, align 4, !dbg !699, !tbaa !320
  %index.next.1 = add i64 %index.next, 8, !dbg !754
  %154 = icmp eq i64 %index.next.1, %end.idx.rnd.down1177, !dbg !754
  br i1 %154, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !754, !llvm.loop !756

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %for.body679.lr.ph
  %resume.val = phi i64 [ 1, %for.body679.lr.ph ], [ 1, %vector.memcheck ], [ %end.idx.rnd.down1177, %middle.block.loopexit ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %for.inc719, label %for.body679.preheader

for.body679.preheader:                            ; preds = %middle.block
  %155 = trunc i64 %resume.val to i32
  %156 = sub i32 %19, %155
  %xtraiter1179 = and i32 %156, 1
  %lcmp.mod1180 = icmp ne i32 %xtraiter1179, 0
  %lcmp.overflow1181 = icmp eq i32 %156, 0
  %lcmp.or1182 = or i1 %lcmp.overflow1181, %lcmp.mod1180
  br i1 %lcmp.or1182, label %for.body679.prol.preheader, label %for.body679.preheader.split

for.body679.prol.preheader:                       ; preds = %for.body679.preheader
  br label %for.body679.prol, !dbg !698

for.body679.prol:                                 ; preds = %for.body679.prol.preheader, %for.body679.prol
  %indvars.iv1138.prol = phi i64 [ %indvars.iv.next1139.prol, %for.body679.prol ], [ %resume.val, %for.body679.prol.preheader ]
  %prol.iter1183 = phi i32 [ %prol.iter1183.sub, %for.body679.prol ], [ %xtraiter1179, %for.body679.prol.preheader ]
  %157 = add nsw i64 %113, %indvars.iv1138.prol, !dbg !698
  %arrayidx697.prol = getelementptr inbounds float* %108, i64 %157, !dbg !698
  %158 = load float* %arrayidx697.prol, align 4, !dbg !698, !tbaa !320
  %159 = add nsw i64 %112, %indvars.iv1138.prol, !dbg !699
  %arrayidx715.prol = getelementptr inbounds float* %111, i64 %159, !dbg !699
  store float %158, float* %arrayidx715.prol, align 4, !dbg !699, !tbaa !320
  %indvars.iv.next1139.prol = add nuw nsw i64 %indvars.iv1138.prol, 1, !dbg !754
  %lftr.wideiv1142.prol = trunc i64 %indvars.iv1138.prol to i32, !dbg !754
  %exitcond1143.prol = icmp eq i32 %lftr.wideiv1142.prol, %3, !dbg !754
  %prol.iter1183.sub = sub i32 %prol.iter1183, 1, !dbg !754
  %prol.iter1183.cmp = icmp ne i32 %prol.iter1183.sub, 0, !dbg !754
  br i1 %prol.iter1183.cmp, label %for.body679.prol, label %for.body679.preheader.split.loopexit, !llvm.loop !757

for.body679.preheader.split.loopexit:             ; preds = %for.body679.prol
  %indvars.iv1138.unr.ph = phi i64 [ %indvars.iv.next1139.prol, %for.body679.prol ]
  br label %for.body679.preheader.split

for.body679.preheader.split:                      ; preds = %for.body679.preheader.split.loopexit, %for.body679.preheader
  %indvars.iv1138.unr = phi i64 [ %resume.val, %for.body679.preheader ], [ %indvars.iv1138.unr.ph, %for.body679.preheader.split.loopexit ]
  %160 = icmp ult i32 %156, 2
  br i1 %160, label %for.inc719.loopexit, label %for.body679.preheader.split.split

for.body679.preheader.split.split:                ; preds = %for.body679.preheader.split
  br label %for.body679, !dbg !698

for.body679:                                      ; preds = %for.body679, %for.body679.preheader.split.split
  %indvars.iv1138 = phi i64 [ %indvars.iv1138.unr, %for.body679.preheader.split.split ], [ %indvars.iv.next1139.1, %for.body679 ]
  %161 = add nsw i64 %113, %indvars.iv1138, !dbg !698
  %arrayidx697 = getelementptr inbounds float* %108, i64 %161, !dbg !698
  %162 = load float* %arrayidx697, align 4, !dbg !698, !tbaa !320
  %163 = add nsw i64 %112, %indvars.iv1138, !dbg !699
  %arrayidx715 = getelementptr inbounds float* %111, i64 %163, !dbg !699
  store float %162, float* %arrayidx715, align 4, !dbg !699, !tbaa !320
  %indvars.iv.next1139 = add nuw nsw i64 %indvars.iv1138, 1, !dbg !754
  %lftr.wideiv1142 = trunc i64 %indvars.iv1138 to i32, !dbg !754
  %164 = add nsw i64 %113, %indvars.iv.next1139, !dbg !698
  %arrayidx697.1 = getelementptr inbounds float* %108, i64 %164, !dbg !698
  %165 = load float* %arrayidx697.1, align 4, !dbg !698, !tbaa !320
  %166 = add nsw i64 %112, %indvars.iv.next1139, !dbg !699
  %arrayidx715.1 = getelementptr inbounds float* %111, i64 %166, !dbg !699
  store float %165, float* %arrayidx715.1, align 4, !dbg !699, !tbaa !320
  %indvars.iv.next1139.1 = add nuw nsw i64 %indvars.iv.next1139, 1, !dbg !754
  %lftr.wideiv1142.1 = trunc i64 %indvars.iv.next1139 to i32, !dbg !754
  %exitcond1143.1 = icmp eq i32 %lftr.wideiv1142.1, %3, !dbg !754
  br i1 %exitcond1143.1, label %for.inc719.loopexit.unr-lcssa, label %for.body679, !dbg !754, !llvm.loop !758

for.inc719.loopexit.unr-lcssa:                    ; preds = %for.body679
  br label %for.inc719.loopexit

for.inc719.loopexit:                              ; preds = %for.body679.preheader.split, %for.inc719.loopexit.unr-lcssa
  br label %for.inc719

for.inc719:                                       ; preds = %for.inc719.loopexit, %middle.block, %for.cond677.preheader
  %inc720 = add nuw nsw i32 %j.11110, 1, !dbg !759
  tail call void @llvm.dbg.value(metadata i32 %inc720, i64 0, metadata !114, metadata !152), !dbg !752
  %exitcond1148 = icmp eq i32 %j.11110, %4, !dbg !713
  %indvar.next = add i32 %indvar, 1, !dbg !713
  br i1 %exitcond1148, label %for.inc722.loopexit, label %for.cond677.preheader, !dbg !713

for.inc722.loopexit:                              ; preds = %for.inc719
  br label %for.inc722

for.inc722:                                       ; preds = %for.inc722.loopexit, %for.cond674.preheader
  %inc723 = add nuw nsw i32 %i.11112, 1, !dbg !760
  tail call void @llvm.dbg.value(metadata i32 %inc723, i64 0, metadata !113, metadata !152), !dbg !753
  %exitcond1149 = icmp eq i32 %i.11112, %5, !dbg !712
  %indvar.next1153 = add i32 %indvar1152, 1, !dbg !712
  br i1 %exitcond1149, label %for.inc725.loopexit, label %for.cond674.preheader, !dbg !712

for.inc725.loopexit:                              ; preds = %for.inc722
  br label %for.inc725

for.inc725:                                       ; preds = %for.inc725.loopexit, %for.cond3.preheader, %for.cond671.preheader
  %gosa.1.lcssa1151 = phi float [ %gosa.2.lcssa.lcssa, %for.cond671.preheader ], [ 0.000000e+00, %for.cond3.preheader ], [ %gosa.2.lcssa.lcssa, %for.inc725.loopexit ]
  %inc726 = add nuw nsw i32 %n.01115, 1, !dbg !761
  tail call void @llvm.dbg.value(metadata i32 %inc726, i64 0, metadata !116, metadata !152), !dbg !681
  %exitcond1150 = icmp eq i32 %n.01115, %6, !dbg !685
  br i1 %exitcond1150, label %for.end727.loopexit, label %for.cond3.preheader, !dbg !685

for.end727.loopexit:                              ; preds = %for.inc725
  %gosa.1.lcssa1151.lcssa = phi float [ %gosa.1.lcssa1151, %for.inc725 ]
  br label %for.end727

for.end727:                                       ; preds = %for.end727.loopexit, %entry
  %gosa.0.lcssa = phi float [ undef, %entry ], [ %gosa.1.lcssa1151.lcssa, %for.end727.loopexit ]
  ret float %gosa.0.lcssa, !dbg !762
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* nocapture %Mat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !82, metadata !152), !dbg !763
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !764
  %0 = load float** %m, align 8, !dbg !764, !tbaa !190
  %tobool = icmp eq float* %0, null, !dbg !765
  br i1 %tobool, label %if.end, label %if.then, !dbg !765

if.then:                                          ; preds = %entry
  %1 = bitcast float* %0 to i8*, !dbg !766
  tail call void @free(i8* %1) #6, !dbg !767
  br label %if.end, !dbg !767

if.end:                                           ; preds = %entry, %if.then
  %2 = bitcast %struct.Mat* %Mat to i8*, !dbg !768
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false), !dbg !769
  ret void, !dbg !768
}

; Function Attrs: nounwind readnone uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %mx, i64 0, metadata !43, metadata !152), !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %my, i64 0, metadata !44, metadata !152), !dbg !771
  tail call void @llvm.dbg.value(metadata i32 %mz, i64 0, metadata !45, metadata !152), !dbg !772
  %sub = add nsw i32 %mz, -2, !dbg !773
  %conv = sitofp i32 %sub to double, !dbg !774
  %sub1 = add nsw i32 %my, -2, !dbg !775
  %conv2 = sitofp i32 %sub1 to double, !dbg !776
  %mul = fmul double %conv2, %conv, !dbg !774
  %sub3 = add nsw i32 %mx, -2, !dbg !777
  %conv4 = sitofp i32 %sub3 to double, !dbg !778
  %mul5 = fmul double %conv4, %mul, !dbg !774
  %mul6 = fmul double %mul5, 3.400000e+01, !dbg !774
  ret double %mul6, !dbg !779
}

; Function Attrs: nounwind readnone uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nn, i64 0, metadata !50, metadata !152), !dbg !780
  tail call void @llvm.dbg.value(metadata double %cpu, i64 0, metadata !51, metadata !152), !dbg !781
  tail call void @llvm.dbg.value(metadata double %flop, i64 0, metadata !52, metadata !152), !dbg !782
  %div = fdiv double %flop, %cpu, !dbg !783
  %mul = fmul double %div, 1.000000e-06, !dbg !783
  %conv = sitofp i32 %nn to double, !dbg !784
  %mul1 = fmul double %conv, %mul, !dbg !783
  ret double %mul1, !dbg !785
}

; Function Attrs: nounwind uwtable
define void @set_param(i32* nocapture %is, i8* nocapture readonly %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %is, i64 0, metadata !58, metadata !152), !dbg !786
  tail call void @llvm.dbg.value(metadata i8* %size, i64 0, metadata !59, metadata !152), !dbg !787
  %call = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #6, !dbg !788
  %tobool = icmp eq i32 %call, 0, !dbg !790
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !790

lor.lhs.false:                                    ; preds = %entry
  %call1 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0)) #6, !dbg !791
  %tobool2 = icmp eq i32 %call1, 0, !dbg !790
  br i1 %tobool2, label %if.then, label %if.end, !dbg !790

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 32, i32* %is, align 4, !dbg !792, !tbaa !794
  %arrayidx3 = getelementptr inbounds i32* %is, i64 1, !dbg !795
  store i32 32, i32* %arrayidx3, align 4, !dbg !795, !tbaa !794
  %arrayidx4 = getelementptr inbounds i32* %is, i64 2, !dbg !796
  store i32 64, i32* %arrayidx4, align 4, !dbg !796, !tbaa !794
  br label %return, !dbg !797

if.end:                                           ; preds = %lor.lhs.false
  %call5 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)) #6, !dbg !798
  %tobool6 = icmp eq i32 %call5, 0, !dbg !800
  br i1 %tobool6, label %if.then10, label %lor.lhs.false7, !dbg !800

lor.lhs.false7:                                   ; preds = %if.end
  %call8 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str7, i64 0, i64 0)) #6, !dbg !801
  %tobool9 = icmp eq i32 %call8, 0, !dbg !800
  br i1 %tobool9, label %if.then10, label %if.end14, !dbg !800

if.then10:                                        ; preds = %lor.lhs.false7, %if.end
  store i32 64, i32* %is, align 4, !dbg !802, !tbaa !794
  %arrayidx12 = getelementptr inbounds i32* %is, i64 1, !dbg !804
  store i32 64, i32* %arrayidx12, align 4, !dbg !804, !tbaa !794
  %arrayidx13 = getelementptr inbounds i32* %is, i64 2, !dbg !805
  store i32 128, i32* %arrayidx13, align 4, !dbg !805, !tbaa !794
  br label %return, !dbg !806

if.end14:                                         ; preds = %lor.lhs.false7
  %call15 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) #6, !dbg !807
  %tobool16 = icmp eq i32 %call15, 0, !dbg !809
  br i1 %tobool16, label %if.then20, label %lor.lhs.false17, !dbg !809

lor.lhs.false17:                                  ; preds = %if.end14
  %call18 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str9, i64 0, i64 0)) #6, !dbg !810
  %tobool19 = icmp eq i32 %call18, 0, !dbg !809
  br i1 %tobool19, label %if.then20, label %if.end24, !dbg !809

if.then20:                                        ; preds = %lor.lhs.false17, %if.end14
  store i32 128, i32* %is, align 4, !dbg !811, !tbaa !794
  %arrayidx22 = getelementptr inbounds i32* %is, i64 1, !dbg !813
  store i32 128, i32* %arrayidx22, align 4, !dbg !813, !tbaa !794
  %arrayidx23 = getelementptr inbounds i32* %is, i64 2, !dbg !814
  store i32 256, i32* %arrayidx23, align 4, !dbg !814, !tbaa !794
  br label %return, !dbg !815

if.end24:                                         ; preds = %lor.lhs.false17
  %call25 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str10, i64 0, i64 0)) #6, !dbg !816
  %tobool26 = icmp eq i32 %call25, 0, !dbg !818
  br i1 %tobool26, label %if.then30, label %lor.lhs.false27, !dbg !818

lor.lhs.false27:                                  ; preds = %if.end24
  %call28 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str11, i64 0, i64 0)) #6, !dbg !819
  %tobool29 = icmp eq i32 %call28, 0, !dbg !818
  br i1 %tobool29, label %if.then30, label %if.end34, !dbg !818

if.then30:                                        ; preds = %lor.lhs.false27, %if.end24
  store i32 256, i32* %is, align 4, !dbg !820, !tbaa !794
  %arrayidx32 = getelementptr inbounds i32* %is, i64 1, !dbg !822
  store i32 256, i32* %arrayidx32, align 4, !dbg !822, !tbaa !794
  %arrayidx33 = getelementptr inbounds i32* %is, i64 2, !dbg !823
  store i32 512, i32* %arrayidx33, align 4, !dbg !823, !tbaa !794
  br label %return, !dbg !824

if.end34:                                         ; preds = %lor.lhs.false27
  %call35 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str12, i64 0, i64 0)) #6, !dbg !825
  %tobool36 = icmp eq i32 %call35, 0, !dbg !827
  br i1 %tobool36, label %if.then40, label %lor.lhs.false37, !dbg !827

lor.lhs.false37:                                  ; preds = %if.end34
  %call38 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) #6, !dbg !828
  %tobool39 = icmp eq i32 %call38, 0, !dbg !827
  br i1 %tobool39, label %if.then40, label %if.else, !dbg !827

if.then40:                                        ; preds = %lor.lhs.false37, %if.end34
  store i32 512, i32* %is, align 4, !dbg !829, !tbaa !794
  %arrayidx42 = getelementptr inbounds i32* %is, i64 1, !dbg !831
  store i32 512, i32* %arrayidx42, align 4, !dbg !831, !tbaa !794
  %arrayidx43 = getelementptr inbounds i32* %is, i64 2, !dbg !832
  store i32 1024, i32* %arrayidx43, align 4, !dbg !832, !tbaa !794
  br label %return, !dbg !833

if.else:                                          ; preds = %lor.lhs.false37
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0)), !dbg !834
  tail call void @exit(i32 6) #7, !dbg !836
  unreachable, !dbg !836

return:                                           ; preds = %if.then40, %if.then30, %if.then20, %if.then10, %if.then
  ret void, !dbg !837
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define double @second() #0 {
entry:
  %tm = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.value(metadata %struct.timeval* %tm, i64 0, metadata !127, metadata !152), !dbg !838
  %call = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #6, !dbg !839
  %0 = load i32* @second.base_sec, align 4, !dbg !840, !tbaa !794
  %1 = load i32* @second.base_usec, align 4
  %2 = or i32 %1, %0, !dbg !842
  %3 = icmp eq i32 %2, 0, !dbg !842
  %tv_sec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0, !dbg !843
  %4 = load i64* %tv_sec, align 8, !dbg !843, !tbaa !845
  %5 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %6 = load i64* %5, align 8
  br i1 %3, label %if.then, label %if.else, !dbg !842

if.then:                                          ; preds = %entry
  %conv = trunc i64 %4 to i32, !dbg !843
  store i32 %conv, i32* @second.base_sec, align 4, !dbg !848, !tbaa !794
  %conv2 = trunc i64 %6 to i32, !dbg !849
  store i32 %conv2, i32* @second.base_usec, align 4, !dbg !850, !tbaa !794
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !137, metadata !152), !dbg !851
  br label %if.end, !dbg !852

if.else:                                          ; preds = %entry
  %conv4 = sext i32 %0 to i64, !dbg !853
  %sub = sub nsw i64 %4, %conv4, !dbg !855
  %conv5 = sitofp i64 %sub to double, !dbg !856
  %conv7 = sext i32 %1 to i64, !dbg !857
  %sub8 = sub nsw i64 %6, %conv7, !dbg !858
  %conv9 = sitofp i64 %sub8 to double, !dbg !859
  %div = fdiv double %conv9, 1.000000e+06, !dbg !860
  %add = fadd double %conv5, %div, !dbg !856
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !137, metadata !152), !dbg !851
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %t.0 = phi double [ 0.000000e+00, %if.then ], [ %add, %if.else ]
  ret double %t.0, !dbg !861
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!149, !150}
!llvm.ident = !{!151}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !8, !138, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c] [DW_LANG_C99]
!1 = !{!"himenobmtxpa.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !7, !6}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!6 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!7 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!8 = !{!9, !39, !46, !53, !60, !78, !83, !93, !101, !123}
!9 = !{!"0x2e\00main\00main\00\0071\000\001\000\000\00256\001\0072", !1, !10, !11, null, i32 (i32, i8**)* @main, null, null, !17} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [main]
!10 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !12, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!13, !13, !14}
!13 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!16 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !34, !35, !36, !37, !38}
!18 = !{!"0x101\00argc\0016777287\000", !9, !10, !13} ; [ DW_TAG_arg_variable ] [argc] [line 71]
!19 = !{!"0x101\00argv\0033554503\000", !9, !10, !14} ; [ DW_TAG_arg_variable ] [argv] [line 71]
!20 = !{!"0x100\00i\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [i] [line 73]
!21 = !{!"0x100\00j\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [j] [line 73]
!22 = !{!"0x100\00k\0073\000", !9, !10, !13}      ; [ DW_TAG_auto_variable ] [k] [line 73]
!23 = !{!"0x100\00nn\0073\000", !9, !10, !13}     ; [ DW_TAG_auto_variable ] [nn] [line 73]
!24 = !{!"0x100\00imax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [imax] [line 74]
!25 = !{!"0x100\00jmax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [jmax] [line 74]
!26 = !{!"0x100\00kmax\0074\000", !9, !10, !13}   ; [ DW_TAG_auto_variable ] [kmax] [line 74]
!27 = !{!"0x100\00mimax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mimax] [line 74]
!28 = !{!"0x100\00mjmax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mjmax] [line 74]
!29 = !{!"0x100\00mkmax\0074\000", !9, !10, !13}  ; [ DW_TAG_auto_variable ] [mkmax] [line 74]
!30 = !{!"0x100\00msize\0074\000", !9, !10, !31}  ; [ DW_TAG_auto_variable ] [msize] [line 74]
!31 = !{!"0x1\00\000\0096\0032\000\000\000", null, null, !13, !32, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!32 = !{!33}
!33 = !{!"0x21\000\003"}                          ; [ DW_TAG_subrange_type ] [0, 2]
!34 = !{!"0x100\00gosa\0075\000", !9, !10, !6}    ; [ DW_TAG_auto_variable ] [gosa] [line 75]
!35 = !{!"0x100\00cpu0\0076\000", !9, !10, !4}    ; [ DW_TAG_auto_variable ] [cpu0] [line 76]
!36 = !{!"0x100\00cpu1\0076\000", !9, !10, !4}    ; [ DW_TAG_auto_variable ] [cpu1] [line 76]
!37 = !{!"0x100\00cpu\0076\000", !9, !10, !4}     ; [ DW_TAG_auto_variable ] [cpu] [line 76]
!38 = !{!"0x100\00flop\0076\000", !9, !10, !4}    ; [ DW_TAG_auto_variable ] [flop] [line 76]
!39 = !{!"0x2e\00fflop\00fflop\00\00144\000\001\000\000\00256\001\00145", !1, !10, !40, null, double (i32, i32, i32)* @fflop, null, null, !42} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [fflop]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{!4, !13, !13, !13}
!42 = !{!43, !44, !45}
!43 = !{!"0x101\00mx\0016777360\000", !39, !10, !13} ; [ DW_TAG_arg_variable ] [mx] [line 144]
!44 = !{!"0x101\00my\0033554576\000", !39, !10, !13} ; [ DW_TAG_arg_variable ] [my] [line 144]
!45 = !{!"0x101\00mz\0050331792\000", !39, !10, !13} ; [ DW_TAG_arg_variable ] [mz] [line 144]
!46 = !{!"0x2e\00mflops\00mflops\00\00150\000\001\000\000\00256\001\00151", !1, !10, !47, null, double (i32, double, double)* @mflops, null, null, !49} ; [ DW_TAG_subprogram ] [line 150] [def] [scope 151] [mflops]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!4, !13, !4, !4}
!49 = !{!50, !51, !52}
!50 = !{!"0x101\00nn\0016777366\000", !46, !10, !13} ; [ DW_TAG_arg_variable ] [nn] [line 150]
!51 = !{!"0x101\00cpu\0033554582\000", !46, !10, !4} ; [ DW_TAG_arg_variable ] [cpu] [line 150]
!52 = !{!"0x101\00flop\0050331798\000", !46, !10, !4} ; [ DW_TAG_arg_variable ] [flop] [line 150]
!53 = !{!"0x2e\00set_param\00set_param\00\00156\000\001\000\000\00256\001\00157", !1, !10, !54, null, void (i32*, i8*)* @set_param, null, null, !57} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [set_param]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{null, !56, !15}
!56 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!57 = !{!58, !59}
!58 = !{!"0x101\00is\0016777372\000", !53, !10, !56} ; [ DW_TAG_arg_variable ] [is] [line 156]
!59 = !{!"0x101\00size\0033554588\000", !53, !10, !15} ; [ DW_TAG_arg_variable ] [size] [line 156]
!60 = !{!"0x2e\00newMat\00newMat\00\00194\000\001\000\000\00256\001\00195", !1, !10, !61, null, i32 (%struct.Mat*, i32, i32, i32, i32)* @newMat, null, null, !72} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [newMat]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{!13, !63, !13, !13, !13, !13}
!63 = !{!"0xf\00\000\0064\0064\000\000", null, null, !64} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Matrix]
!64 = !{!"0x16\00Matrix\0054\000\000\000\000", !1, null, !65} ; [ DW_TAG_typedef ] [Matrix] [line 54, size 0, align 0, offset 0] [from Mat]
!65 = !{!"0x13\00Mat\0045\00192\0064\000\000\000", !1, null, null, !66, null, null, null} ; [ DW_TAG_structure_type ] [Mat] [line 45, size 192, align 64, offset 0] [def] [from ]
!66 = !{!67, !68, !69, !70, !71}
!67 = !{!"0xd\00m\0046\0064\0064\000\000", !1, !65, !5} ; [ DW_TAG_member ] [m] [line 46, size 64, align 64, offset 0] [from ]
!68 = !{!"0xd\00mnums\0047\0032\0032\0064\000", !1, !65, !13} ; [ DW_TAG_member ] [mnums] [line 47, size 32, align 32, offset 64] [from int]
!69 = !{!"0xd\00mrows\0048\0032\0032\0096\000", !1, !65, !13} ; [ DW_TAG_member ] [mrows] [line 48, size 32, align 32, offset 96] [from int]
!70 = !{!"0xd\00mcols\0049\0032\0032\00128\000", !1, !65, !13} ; [ DW_TAG_member ] [mcols] [line 49, size 32, align 32, offset 128] [from int]
!71 = !{!"0xd\00mdeps\0050\0032\0032\00160\000", !1, !65, !13} ; [ DW_TAG_member ] [mdeps] [line 50, size 32, align 32, offset 160] [from int]
!72 = !{!73, !74, !75, !76, !77}
!73 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!74 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!75 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!76 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!77 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!78 = !{!"0x2e\00clearMat\00clearMat\00\00208\000\001\000\000\00256\001\00209", !1, !10, !79, null, void (%struct.Mat*)* @clearMat, null, null, !81} ; [ DW_TAG_subprogram ] [line 208] [def] [scope 209] [clearMat]
!79 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !80, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = !{null, !63}
!81 = !{!82}
!82 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!83 = !{!"0x2e\00mat_set\00mat_set\00\00220\000\001\000\000\00256\001\00221", !1, !10, !84, null, void (%struct.Mat*, i32, float)* @mat_set, null, null, !86} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [mat_set]
!84 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !85, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = !{null, !63, !13, !6}
!86 = !{!87, !88, !89, !90, !91, !92}
!87 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!88 = !{!"0x101\00l\0033554652\000", !83, !10, !13} ; [ DW_TAG_arg_variable ] [l] [line 220]
!89 = !{!"0x101\00val\0050331868\000", !83, !10, !6} ; [ DW_TAG_arg_variable ] [val] [line 220]
!90 = !{!"0x100\00i\00222\000", !83, !10, !13}    ; [ DW_TAG_auto_variable ] [i] [line 222]
!91 = !{!"0x100\00j\00222\000", !83, !10, !13}    ; [ DW_TAG_auto_variable ] [j] [line 222]
!92 = !{!"0x100\00k\00222\000", !83, !10, !13}    ; [ DW_TAG_auto_variable ] [k] [line 222]
!93 = !{!"0x2e\00mat_set_init\00mat_set_init\00\00231\000\001\000\000\00256\001\00232", !1, !10, !79, null, void (%struct.Mat*)* @mat_set_init, null, null, !94} ; [ DW_TAG_subprogram ] [line 231] [def] [scope 232] [mat_set_init]
!94 = !{!95, !96, !97, !98, !99, !100}
!95 = !{!"0x101\00Mat\0016777447\000", !93, !10, !63} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!96 = !{!"0x100\00i\00233\000", !93, !10, !13}    ; [ DW_TAG_auto_variable ] [i] [line 233]
!97 = !{!"0x100\00j\00233\000", !93, !10, !13}    ; [ DW_TAG_auto_variable ] [j] [line 233]
!98 = !{!"0x100\00k\00233\000", !93, !10, !13}    ; [ DW_TAG_auto_variable ] [k] [line 233]
!99 = !{!"0x100\00l\00233\000", !93, !10, !13}    ; [ DW_TAG_auto_variable ] [l] [line 233]
!100 = !{!"0x100\00tt\00234\000", !93, !10, !6}   ; [ DW_TAG_auto_variable ] [tt] [line 234]
!101 = !{!"0x2e\00jacobi\00jacobi\00\00244\000\001\000\000\00256\001\00246", !1, !10, !102, null, float (i32, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*)* @jacobi, null, null, !104} ; [ DW_TAG_subprogram ] [line 244] [def] [scope 246] [jacobi]
!102 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !103, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = !{!6, !13, !63, !63, !63, !63, !63, !63, !63}
!104 = !{!105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122}
!105 = !{!"0x101\00nn\0016777460\000", !101, !10, !13} ; [ DW_TAG_arg_variable ] [nn] [line 244]
!106 = !{!"0x101\00a\0033554676\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [a] [line 244]
!107 = !{!"0x101\00b\0050331892\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [b] [line 244]
!108 = !{!"0x101\00c\0067109108\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [c] [line 244]
!109 = !{!"0x101\00p\0083886325\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [p] [line 245]
!110 = !{!"0x101\00bnd\00100663541\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [bnd] [line 245]
!111 = !{!"0x101\00wrk1\00117440757\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [wrk1] [line 245]
!112 = !{!"0x101\00wrk2\00134217973\000", !101, !10, !63} ; [ DW_TAG_arg_variable ] [wrk2] [line 245]
!113 = !{!"0x100\00i\00247\000", !101, !10, !13}  ; [ DW_TAG_auto_variable ] [i] [line 247]
!114 = !{!"0x100\00j\00247\000", !101, !10, !13}  ; [ DW_TAG_auto_variable ] [j] [line 247]
!115 = !{!"0x100\00k\00247\000", !101, !10, !13}  ; [ DW_TAG_auto_variable ] [k] [line 247]
!116 = !{!"0x100\00n\00247\000", !101, !10, !13}  ; [ DW_TAG_auto_variable ] [n] [line 247]
!117 = !{!"0x100\00imax\00247\000", !101, !10, !13} ; [ DW_TAG_auto_variable ] [imax] [line 247]
!118 = !{!"0x100\00jmax\00247\000", !101, !10, !13} ; [ DW_TAG_auto_variable ] [jmax] [line 247]
!119 = !{!"0x100\00kmax\00247\000", !101, !10, !13} ; [ DW_TAG_auto_variable ] [kmax] [line 247]
!120 = !{!"0x100\00gosa\00248\000", !101, !10, !6} ; [ DW_TAG_auto_variable ] [gosa] [line 248]
!121 = !{!"0x100\00s0\00248\000", !101, !10, !6}  ; [ DW_TAG_auto_variable ] [s0] [line 248]
!122 = !{!"0x100\00ss\00248\000", !101, !10, !6}  ; [ DW_TAG_auto_variable ] [ss] [line 248]
!123 = !{!"0x2e\00second\00second\00\00294\000\001\000\000\000\001\00295", !1, !10, !124, null, double ()* @second, null, null, !126} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [second]
!124 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !125, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!125 = !{!4}
!126 = !{!127, !137}
!127 = !{!"0x100\00tm\00297\000", !123, !10, !128} ; [ DW_TAG_auto_variable ] [tm] [line 297]
!128 = !{!"0x13\00timeval\0030\00128\0064\000\000\000", !129, null, null, !130, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!129 = !{!"/usr/include/x86_64-linux-gnu/bits/time.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!130 = !{!131, !135}
!131 = !{!"0xd\00tv_sec\0032\0064\0064\000\000", !129, !128, !132} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!132 = !{!"0x16\00__time_t\00139\000\000\000\000", !133, null, !134} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!133 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!134 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!135 = !{!"0xd\00tv_usec\0033\0064\0064\0064\000", !129, !128, !136} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!136 = !{!"0x16\00__suseconds_t\00141\000\000\000\000", !133, null, !134} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!137 = !{!"0x100\00t\00298\000", !123, !10, !4}   ; [ DW_TAG_auto_variable ] [t] [line 298]
!138 = !{!139, !140, !141, !142, !143, !144, !145, !146, !147, !148}
!139 = !{!"0x34\00omega\00omega\00\0067\000\001", null, !10, !6, float* @omega, null} ; [ DW_TAG_variable ] [omega] [line 67] [def]
!140 = !{!"0x34\00base_sec\00base_sec\00\00300\001\001", !123, !10, !13, i32* @second.base_sec, null} ; [ DW_TAG_variable ] [base_sec] [line 300] [local] [def]
!141 = !{!"0x34\00base_usec\00base_usec\00\00300\001\001", !123, !10, !13, i32* @second.base_usec, null} ; [ DW_TAG_variable ] [base_usec] [line 300] [local] [def]
!142 = !{!"0x34\00a\00a\00\0068\000\001", null, !10, !64, %struct.Mat* @a, null} ; [ DW_TAG_variable ] [a] [line 68] [def]
!143 = !{!"0x34\00b\00b\00\0068\000\001", null, !10, !64, %struct.Mat* @b, null} ; [ DW_TAG_variable ] [b] [line 68] [def]
!144 = !{!"0x34\00c\00c\00\0068\000\001", null, !10, !64, %struct.Mat* @c, null} ; [ DW_TAG_variable ] [c] [line 68] [def]
!145 = !{!"0x34\00p\00p\00\0068\000\001", null, !10, !64, %struct.Mat* @p, null} ; [ DW_TAG_variable ] [p] [line 68] [def]
!146 = !{!"0x34\00bnd\00bnd\00\0068\000\001", null, !10, !64, %struct.Mat* @bnd, null} ; [ DW_TAG_variable ] [bnd] [line 68] [def]
!147 = !{!"0x34\00wrk1\00wrk1\00\0068\000\001", null, !10, !64, %struct.Mat* @wrk1, null} ; [ DW_TAG_variable ] [wrk1] [line 68] [def]
!148 = !{!"0x34\00wrk2\00wrk2\00\0068\000\001", null, !10, !64, %struct.Mat* @wrk2, null} ; [ DW_TAG_variable ] [wrk2] [line 68] [def]
!149 = !{i32 2, !"Dwarf Version", i32 4}
!150 = !{i32 2, !"Debug Info Version", i32 2}
!151 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!152 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!153 = !MDLocation(line: 71, column: 10, scope: !9)
!154 = !MDLocation(line: 71, column: 22, scope: !9)
!155 = !MDLocation(line: 74, column: 43, scope: !9)
!156 = !MDLocation(line: 74, column: 25, scope: !9)
!157 = !MDLocation(line: 74, column: 31, scope: !9)
!158 = !MDLocation(line: 74, column: 37, scope: !9)
!159 = !MDLocation(line: 74, column: 10, scope: !9)
!160 = !MDLocation(line: 74, column: 15, scope: !9)
!161 = !MDLocation(line: 74, column: 20, scope: !9)
!162 = !MDLocation(line: 90, column: 3, scope: !9)
!163 = !MDLocation(line: 91, column: 3, scope: !9)
!164 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !165} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!165 = !MDLocation(line: 96, column: 3, scope: !9)
!166 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !165)
!167 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !165} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!168 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !165)
!169 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !165} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!170 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !165)
!171 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !165} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!172 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !165)
!173 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !165} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!174 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !165)
!175 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !165)
!176 = !{!177, !181, i64 8}
!177 = !{!"Mat", !178, i64 0, !181, i64 8, !181, i64 12, !181, i64 16, !181, i64 20}
!178 = !{!"any pointer", !179, i64 0}
!179 = !{!"omnipotent char", !180, i64 0}
!180 = !{!"Simple C/C++ TBAA"}
!181 = !{!"int", !179, i64 0}
!182 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !165)
!183 = !{!177, !181, i64 12}
!184 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !165)
!185 = !{!177, !181, i64 16}
!186 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !165)
!187 = !{!177, !181, i64 20}
!188 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !165)
!189 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !165)
!190 = !{!177, !178, i64 0}
!191 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !192} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!192 = !MDLocation(line: 97, column: 3, scope: !9)
!193 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !192)
!194 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !192} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!195 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !192)
!196 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !192} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!197 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !192)
!198 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !192} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!199 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !192)
!200 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !192} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!201 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !192)
!202 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !192)
!203 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !192)
!204 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !192)
!205 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !192)
!206 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !192)
!207 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !192)
!208 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !209} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!209 = !MDLocation(line: 98, column: 3, scope: !9)
!210 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !209)
!211 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !209} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!212 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !209)
!213 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !209} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!214 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !209)
!215 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !209} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!216 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !209)
!217 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !209} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!218 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !209)
!219 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !209)
!220 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !209)
!221 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !209)
!222 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !209)
!223 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !209)
!224 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !209)
!225 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !226} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!226 = !MDLocation(line: 99, column: 3, scope: !9)
!227 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !226)
!228 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !226} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!229 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !226)
!230 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !226} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!231 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !226)
!232 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !226} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!233 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !226)
!234 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !226} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!235 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !226)
!236 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !226)
!237 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !226)
!238 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !226)
!239 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !226)
!240 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !226)
!241 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !226)
!242 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !243} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!243 = !MDLocation(line: 100, column: 3, scope: !9)
!244 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !243)
!245 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !243} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!246 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !243)
!247 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !243} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!248 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !243)
!249 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !243} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!250 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !243)
!251 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !243} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!252 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !243)
!253 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !243)
!254 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !243)
!255 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !243)
!256 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !243)
!257 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !243)
!258 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !243)
!259 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !260} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!260 = !MDLocation(line: 101, column: 3, scope: !9)
!261 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !260)
!262 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !260} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!263 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !260)
!264 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !260} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!265 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !260)
!266 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !260} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!267 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !260)
!268 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !260} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!269 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !260)
!270 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !260)
!271 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !260)
!272 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !260)
!273 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !260)
!274 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !260)
!275 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !260)
!276 = !{!"0x101\00Mat\0016777410\000", !60, !10, !63, !277} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!277 = !MDLocation(line: 102, column: 3, scope: !9)
!278 = !MDLocation(line: 194, column: 16, scope: !60, inlinedAt: !277)
!279 = !{!"0x101\00mnums\0033554626\000", !60, !10, !13, !277} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!280 = !MDLocation(line: 194, column: 25, scope: !60, inlinedAt: !277)
!281 = !{!"0x101\00mrows\0050331842\000", !60, !10, !13, !277} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!282 = !MDLocation(line: 194, column: 35, scope: !60, inlinedAt: !277)
!283 = !{!"0x101\00mcols\0067109058\000", !60, !10, !13, !277} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!284 = !MDLocation(line: 194, column: 46, scope: !60, inlinedAt: !277)
!285 = !{!"0x101\00mdeps\0083886274\000", !60, !10, !13, !277} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!286 = !MDLocation(line: 194, column: 57, scope: !60, inlinedAt: !277)
!287 = !MDLocation(line: 196, column: 3, scope: !60, inlinedAt: !277)
!288 = !MDLocation(line: 197, column: 3, scope: !60, inlinedAt: !277)
!289 = !MDLocation(line: 198, column: 3, scope: !60, inlinedAt: !277)
!290 = !MDLocation(line: 199, column: 3, scope: !60, inlinedAt: !277)
!291 = !MDLocation(line: 202, column: 5, scope: !60, inlinedAt: !277)
!292 = !MDLocation(line: 201, column: 3, scope: !60, inlinedAt: !277)
!293 = !{!"0x101\00Mat\0016777447\000", !93, !10, !63, !294} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!294 = !MDLocation(line: 104, column: 3, scope: !9)
!295 = !MDLocation(line: 231, column: 22, scope: !93, inlinedAt: !294)
!296 = !{!"0x100\00i\00233\000", !93, !10, !13, !294} ; [ DW_TAG_auto_variable ] [i] [line 233]
!297 = !MDLocation(line: 233, column: 8, scope: !93, inlinedAt: !294)
!298 = !MDLocation(line: 238, column: 18, scope: !299, inlinedAt: !294)
!299 = !{!"0xb\00238\007\0023", !1, !300}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!300 = !{!"0xb\00238\007\0022", !1, !301}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!301 = !{!"0xb\00237\005\0021", !1, !302}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!302 = !{!"0xb\00237\005\0020", !1, !303}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!303 = !{!"0xb\00236\003\0019", !1, !304}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!304 = !{!"0xb\00236\003\0018", !1, !93}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!305 = !MDLocation(line: 236, column: 26, scope: !303, inlinedAt: !294)
!306 = !MDLocation(line: 236, column: 3, scope: !304, inlinedAt: !294)
!307 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !314)
!308 = !{!"0xb\00226\009\0017", !1, !309}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!309 = !{!"0xb\00226\009\0016", !1, !310}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!310 = !{!"0xb\00225\007\0015", !1, !311}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!311 = !{!"0xb\00225\007\0014", !1, !312}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!312 = !{!"0xb\00224\005\0013", !1, !313}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!313 = !{!"0xb\00224\005\0012", !1, !83}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!314 = !MDLocation(line: 105, column: 3, scope: !9)
!315 = !MDLocation(line: 239, column: 34, scope: !299, inlinedAt: !294)
!316 = !MDLocation(line: 239, column: 26, scope: !299, inlinedAt: !294)
!317 = !MDLocation(line: 239, column: 9, scope: !299, inlinedAt: !294)
!318 = !MDLocation(line: 240, column: 21, scope: !299, inlinedAt: !294)
!319 = !MDLocation(line: 238, column: 7, scope: !300, inlinedAt: !294)
!320 = !{!321, !321, i64 0}
!321 = !{!"float", !179, i64 0}
!322 = !MDLocation(line: 237, column: 5, scope: !302, inlinedAt: !294)
!323 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !314)
!324 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !314)
!325 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !314)
!326 = !{!"0x100\00i\00222\000", !83, !10, !13, !314} ; [ DW_TAG_auto_variable ] [i] [line 222]
!327 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !314)
!328 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !314)
!329 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !330)
!330 = !MDLocation(line: 106, column: 3, scope: !9)
!331 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !330)
!332 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !330)
!333 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !330)
!334 = !{!"0x100\00i\00222\000", !83, !10, !13, !330} ; [ DW_TAG_auto_variable ] [i] [line 222]
!335 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !330)
!336 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !330)
!337 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !338)
!338 = !MDLocation(line: 107, column: 3, scope: !9)
!339 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !338} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!340 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !338)
!341 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !338} ; [ DW_TAG_arg_variable ] [l] [line 220]
!342 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !338)
!343 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !338} ; [ DW_TAG_arg_variable ] [val] [line 220]
!344 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !338)
!345 = !{!"0x100\00i\00222\000", !83, !10, !13, !338} ; [ DW_TAG_auto_variable ] [i] [line 222]
!346 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !338)
!347 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !338)
!348 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !338)
!349 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !338)
!350 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !338)
!351 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !338)
!352 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !338)
!353 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !338)
!354 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !338)
!355 = distinct !{!355, !356}
!356 = !{!"llvm.loop.unroll.disable"}
!357 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !338)
!358 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !359} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!359 = !MDLocation(line: 108, column: 3, scope: !9)
!360 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !359)
!361 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !359} ; [ DW_TAG_arg_variable ] [l] [line 220]
!362 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !359)
!363 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !359} ; [ DW_TAG_arg_variable ] [val] [line 220]
!364 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !359)
!365 = !{!"0x100\00i\00222\000", !83, !10, !13, !359} ; [ DW_TAG_auto_variable ] [i] [line 222]
!366 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !359)
!367 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !359)
!368 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !359)
!369 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !359)
!370 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !359)
!371 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !359)
!372 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !359)
!373 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !359)
!374 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !359)
!375 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !359)
!376 = distinct !{!376, !377, !378}
!377 = !{!"llvm.loop.vectorize.width", i32 1}
!378 = !{!"llvm.loop.interleave.count", i32 1}
!379 = distinct !{!379, !356}
!380 = distinct !{!380, !377, !378}
!381 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !359)
!382 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !383)
!383 = !MDLocation(line: 109, column: 3, scope: !9)
!384 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !383)
!385 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !383)
!386 = distinct !{!386, !377, !378}
!387 = distinct !{!387, !356}
!388 = distinct !{!388, !377, !378}
!389 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !383)
!390 = !{!"0x100\00i\00222\000", !83, !10, !13, !383} ; [ DW_TAG_auto_variable ] [i] [line 222]
!391 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !383)
!392 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !383)
!393 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !394} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!394 = !MDLocation(line: 110, column: 3, scope: !9)
!395 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !394)
!396 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !394} ; [ DW_TAG_arg_variable ] [l] [line 220]
!397 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !394)
!398 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !394} ; [ DW_TAG_arg_variable ] [val] [line 220]
!399 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !394)
!400 = !{!"0x100\00i\00222\000", !83, !10, !13, !394} ; [ DW_TAG_auto_variable ] [i] [line 222]
!401 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !394)
!402 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !394)
!403 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !394)
!404 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !394)
!405 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !394)
!406 = distinct !{!406, !377, !378}
!407 = distinct !{!407, !356}
!408 = distinct !{!408, !377, !378}
!409 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !394)
!410 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !411} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!411 = !MDLocation(line: 111, column: 3, scope: !9)
!412 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !411)
!413 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !411} ; [ DW_TAG_arg_variable ] [l] [line 220]
!414 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !411)
!415 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !411} ; [ DW_TAG_arg_variable ] [val] [line 220]
!416 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !411)
!417 = !{!"0x100\00i\00222\000", !83, !10, !13, !411} ; [ DW_TAG_auto_variable ] [i] [line 222]
!418 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !411)
!419 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !411)
!420 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !411)
!421 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !411)
!422 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !411)
!423 = distinct !{!423, !377, !378}
!424 = distinct !{!424, !356}
!425 = distinct !{!425, !377, !378}
!426 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !411)
!427 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !428} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!428 = !MDLocation(line: 112, column: 3, scope: !9)
!429 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !428)
!430 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !428} ; [ DW_TAG_arg_variable ] [l] [line 220]
!431 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !428)
!432 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !428} ; [ DW_TAG_arg_variable ] [val] [line 220]
!433 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !428)
!434 = !{!"0x100\00i\00222\000", !83, !10, !13, !428} ; [ DW_TAG_auto_variable ] [i] [line 222]
!435 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !428)
!436 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !428)
!437 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !428)
!438 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !428)
!439 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !428)
!440 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !428)
!441 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !428)
!442 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !428)
!443 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !428)
!444 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !428)
!445 = distinct !{!445, !356}
!446 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !428)
!447 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !448)
!448 = !MDLocation(line: 113, column: 3, scope: !9)
!449 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !448} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!450 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !448)
!451 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !448} ; [ DW_TAG_arg_variable ] [l] [line 220]
!452 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !448)
!453 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !448} ; [ DW_TAG_arg_variable ] [val] [line 220]
!454 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !448)
!455 = !{!"0x100\00i\00222\000", !83, !10, !13, !448} ; [ DW_TAG_auto_variable ] [i] [line 222]
!456 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !448)
!457 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !448)
!458 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !448)
!459 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !448)
!460 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !448)
!461 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !448)
!462 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !448)
!463 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !448)
!464 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !448)
!465 = distinct !{!465, !356}
!466 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !448)
!467 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !468)
!468 = !MDLocation(line: 114, column: 3, scope: !9)
!469 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !468} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!470 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !468)
!471 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !468} ; [ DW_TAG_arg_variable ] [l] [line 220]
!472 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !468)
!473 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !468} ; [ DW_TAG_arg_variable ] [val] [line 220]
!474 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !468)
!475 = !{!"0x100\00i\00222\000", !83, !10, !13, !468} ; [ DW_TAG_auto_variable ] [i] [line 222]
!476 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !468)
!477 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !468)
!478 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !468)
!479 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !468)
!480 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !468)
!481 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !468)
!482 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !468)
!483 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !468)
!484 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !468)
!485 = distinct !{!485, !356}
!486 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !468)
!487 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !488} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!488 = !MDLocation(line: 115, column: 3, scope: !9)
!489 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !488)
!490 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !488} ; [ DW_TAG_arg_variable ] [l] [line 220]
!491 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !488)
!492 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !488} ; [ DW_TAG_arg_variable ] [val] [line 220]
!493 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !488)
!494 = !{!"0x100\00i\00222\000", !83, !10, !13, !488} ; [ DW_TAG_auto_variable ] [i] [line 222]
!495 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !488)
!496 = !MDLocation(line: 224, column: 16, scope: !312, inlinedAt: !488)
!497 = !MDLocation(line: 224, column: 14, scope: !312, inlinedAt: !488)
!498 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !488)
!499 = !MDLocation(line: 225, column: 18, scope: !310, inlinedAt: !488)
!500 = !MDLocation(line: 225, column: 16, scope: !310, inlinedAt: !488)
!501 = !MDLocation(line: 226, column: 18, scope: !308, inlinedAt: !488)
!502 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !488)
!503 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !488)
!504 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !488)
!505 = distinct !{!505, !377, !378}
!506 = distinct !{!506, !356}
!507 = distinct !{!507, !377, !378}
!508 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !488)
!509 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !510)
!510 = !MDLocation(line: 116, column: 3, scope: !9)
!511 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !510)
!512 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !510)
!513 = distinct !{!513, !377, !378}
!514 = distinct !{!514, !356}
!515 = distinct !{!515, !377, !378}
!516 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !510)
!517 = !{!"0x100\00i\00222\000", !83, !10, !13, !510} ; [ DW_TAG_auto_variable ] [i] [line 222]
!518 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !510)
!519 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !510)
!520 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !521} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!521 = !MDLocation(line: 117, column: 3, scope: !9)
!522 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !521)
!523 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !521} ; [ DW_TAG_arg_variable ] [l] [line 220]
!524 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !521)
!525 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !521} ; [ DW_TAG_arg_variable ] [val] [line 220]
!526 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !521)
!527 = !{!"0x100\00i\00222\000", !83, !10, !13, !521} ; [ DW_TAG_auto_variable ] [i] [line 222]
!528 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !521)
!529 = !MDLocation(line: 227, column: 11, scope: !308, inlinedAt: !521)
!530 = !MDLocation(line: 224, column: 5, scope: !313, inlinedAt: !521)
!531 = !MDLocation(line: 225, column: 7, scope: !311, inlinedAt: !521)
!532 = !MDLocation(line: 226, column: 9, scope: !309, inlinedAt: !521)
!533 = distinct !{!533, !377, !378}
!534 = distinct !{!534, !356}
!535 = distinct !{!535, !377, !378}
!536 = !MDLocation(line: 224, column: 28, scope: !312, inlinedAt: !521)
!537 = !MDLocation(line: 73, column: 16, scope: !9)
!538 = !MDLocation(line: 124, column: 10, scope: !9)
!539 = !MDLocation(line: 75, column: 10, scope: !9)
!540 = !MDLocation(line: 126, column: 3, scope: !9)
!541 = !MDLocation(line: 127, column: 26, scope: !9)
!542 = !MDLocation(line: 127, column: 3, scope: !9)
!543 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !544} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!544 = !MDLocation(line: 132, column: 3, scope: !9)
!545 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !544)
!546 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !544)
!547 = !{!"0xb\00210\006\0011", !1, !78}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!548 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !544)
!549 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !544)
!550 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !544)
!551 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !544)
!552 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !553} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!553 = !MDLocation(line: 133, column: 3, scope: !9)
!554 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !553)
!555 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !553)
!556 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !553)
!557 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !553)
!558 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !553)
!559 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !553)
!560 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !561} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!561 = !MDLocation(line: 134, column: 3, scope: !9)
!562 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !561)
!563 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !561)
!564 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !561)
!565 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !561)
!566 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !561)
!567 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !561)
!568 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !569} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!569 = !MDLocation(line: 135, column: 3, scope: !9)
!570 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !569)
!571 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !569)
!572 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !569)
!573 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !569)
!574 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !569)
!575 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !569)
!576 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !577} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!577 = !MDLocation(line: 136, column: 3, scope: !9)
!578 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !577)
!579 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !577)
!580 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !577)
!581 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !577)
!582 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !577)
!583 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !577)
!584 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !585} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!585 = !MDLocation(line: 137, column: 3, scope: !9)
!586 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !585)
!587 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !585)
!588 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !585)
!589 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !585)
!590 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !585)
!591 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !585)
!592 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !593} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!593 = !MDLocation(line: 138, column: 3, scope: !9)
!594 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !593)
!595 = !MDLocation(line: 210, column: 6, scope: !547, inlinedAt: !593)
!596 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !593)
!597 = !MDLocation(line: 211, column: 10, scope: !547, inlinedAt: !593)
!598 = !MDLocation(line: 211, column: 5, scope: !547, inlinedAt: !593)
!599 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !593)
!600 = !MDLocation(line: 140, column: 3, scope: !9)
!601 = !MDLocation(line: 194, column: 16, scope: !60)
!602 = !MDLocation(line: 194, column: 25, scope: !60)
!603 = !MDLocation(line: 194, column: 35, scope: !60)
!604 = !MDLocation(line: 194, column: 46, scope: !60)
!605 = !MDLocation(line: 194, column: 57, scope: !60)
!606 = !MDLocation(line: 196, column: 3, scope: !60)
!607 = !MDLocation(line: 197, column: 3, scope: !60)
!608 = !MDLocation(line: 198, column: 3, scope: !60)
!609 = !MDLocation(line: 199, column: 3, scope: !60)
!610 = !MDLocation(line: 202, column: 12, scope: !60)
!611 = !MDLocation(line: 202, column: 5, scope: !60)
!612 = !MDLocation(line: 201, column: 3, scope: !60)
!613 = !MDLocation(line: 204, column: 10, scope: !60)
!614 = !MDLocation(line: 204, column: 9, scope: !60)
!615 = !MDLocation(line: 204, column: 3, scope: !60)
!616 = !MDLocation(line: 231, column: 22, scope: !93)
!617 = !MDLocation(line: 233, column: 8, scope: !93)
!618 = !MDLocation(line: 236, column: 14, scope: !303)
!619 = !MDLocation(line: 236, column: 12, scope: !303)
!620 = !MDLocation(line: 236, column: 3, scope: !304)
!621 = !MDLocation(line: 237, column: 16, scope: !301)
!622 = !MDLocation(line: 237, column: 14, scope: !301)
!623 = !MDLocation(line: 238, column: 18, scope: !299)
!624 = !MDLocation(line: 239, column: 9, scope: !299)
!625 = !MDLocation(line: 236, column: 26, scope: !303)
!626 = !MDLocation(line: 238, column: 16, scope: !299)
!627 = !MDLocation(line: 239, column: 34, scope: !299)
!628 = !MDLocation(line: 239, column: 26, scope: !299)
!629 = !MDLocation(line: 240, column: 21, scope: !299)
!630 = !MDLocation(line: 237, column: 28, scope: !301)
!631 = !MDLocation(line: 233, column: 10, scope: !93)
!632 = !MDLocation(line: 237, column: 5, scope: !302)
!633 = !MDLocation(line: 240, column: 20, scope: !299)
!634 = !MDLocation(line: 240, column: 12, scope: !299)
!635 = !MDLocation(line: 238, column: 30, scope: !299)
!636 = distinct !{!636, !356}
!637 = distinct !{!637, !377, !378}
!638 = !MDLocation(line: 233, column: 12, scope: !93)
!639 = !MDLocation(line: 238, column: 7, scope: !300)
!640 = distinct !{!640, !356}
!641 = distinct !{!641, !377, !378}
!642 = !MDLocation(line: 241, column: 1, scope: !93)
!643 = !MDLocation(line: 220, column: 17, scope: !83)
!644 = !MDLocation(line: 220, column: 26, scope: !83)
!645 = !MDLocation(line: 220, column: 35, scope: !83)
!646 = !MDLocation(line: 222, column: 7, scope: !83)
!647 = !MDLocation(line: 224, column: 16, scope: !312)
!648 = !MDLocation(line: 224, column: 14, scope: !312)
!649 = !MDLocation(line: 224, column: 5, scope: !313)
!650 = !MDLocation(line: 225, column: 18, scope: !310)
!651 = !MDLocation(line: 225, column: 16, scope: !310)
!652 = !MDLocation(line: 226, column: 20, scope: !308)
!653 = !MDLocation(line: 227, column: 11, scope: !308)
!654 = !MDLocation(line: 225, column: 7, scope: !311)
!655 = !MDLocation(line: 226, column: 18, scope: !308)
!656 = !MDLocation(line: 226, column: 9, scope: !309)
!657 = !MDLocation(line: 226, column: 32, scope: !308)
!658 = distinct !{!658, !356}
!659 = distinct !{!659, !377, !378}
!660 = !MDLocation(line: 222, column: 11, scope: !83)
!661 = distinct !{!661, !356}
!662 = distinct !{!662, !377, !378}
!663 = !MDLocation(line: 225, column: 30, scope: !310)
!664 = !MDLocation(line: 222, column: 9, scope: !83)
!665 = !MDLocation(line: 224, column: 28, scope: !312)
!666 = !MDLocation(line: 228, column: 1, scope: !83)
!667 = !MDLocation(line: 244, column: 12, scope: !101)
!668 = !MDLocation(line: 244, column: 24, scope: !101)
!669 = !MDLocation(line: 244, column: 34, scope: !101)
!670 = !MDLocation(line: 244, column: 44, scope: !101)
!671 = !MDLocation(line: 245, column: 16, scope: !101)
!672 = !MDLocation(line: 245, column: 26, scope: !101)
!673 = !MDLocation(line: 245, column: 38, scope: !101)
!674 = !MDLocation(line: 245, column: 51, scope: !101)
!675 = !MDLocation(line: 250, column: 9, scope: !101)
!676 = !MDLocation(line: 247, column: 18, scope: !101)
!677 = !MDLocation(line: 251, column: 9, scope: !101)
!678 = !MDLocation(line: 247, column: 23, scope: !101)
!679 = !MDLocation(line: 252, column: 9, scope: !101)
!680 = !MDLocation(line: 247, column: 28, scope: !101)
!681 = !MDLocation(line: 247, column: 16, scope: !101)
!682 = !MDLocation(line: 254, column: 13, scope: !683)
!683 = !{!"0xb\00254\003\0025", !1, !684}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!684 = !{!"0xb\00254\003\0024", !1, !101}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!685 = !MDLocation(line: 254, column: 3, scope: !684)
!686 = !MDLocation(line: 257, column: 15, scope: !687)
!687 = !{!"0xb\00257\005\0028", !1, !688}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!688 = !{!"0xb\00257\005\0027", !1, !689}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!689 = !{!"0xb\00254\0024\0026", !1, !683}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!690 = !MDLocation(line: 284, column: 17, scope: !691)
!691 = !{!"0xb\00284\007\0037", !1, !692}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!692 = !{!"0xb\00284\007\0036", !1, !693}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!693 = !{!"0xb\00283\005\0035", !1, !694}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!694 = !{!"0xb\00283\005\0034", !1, !689}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!695 = !MDLocation(line: 285, column: 19, scope: !696)
!696 = !{!"0xb\00285\009\0039", !1, !697}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!697 = !{!"0xb\00285\009\0038", !1, !691}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!698 = !MDLocation(line: 286, column: 26, scope: !696)
!699 = !MDLocation(line: 286, column: 11, scope: !696)
!700 = !MDLocation(line: 260, column: 15, scope: !701)
!701 = !{!"0xb\00259\0032\0033", !1, !702}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!702 = !{!"0xb\00259\009\0032", !1, !703}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!703 = !{!"0xb\00259\009\0031", !1, !704}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!704 = !{!"0xb\00258\007\0030", !1, !705}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!705 = !{!"0xb\00258\007\0029", !1, !687}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!706 = !MDLocation(line: 263, column: 15, scope: !701)
!707 = !MDLocation(line: 272, column: 15, scope: !701)
!708 = !MDLocation(line: 275, column: 15, scope: !701)
!709 = !MDLocation(line: 277, column: 50, scope: !701)
!710 = !MDLocation(line: 257, column: 5, scope: !688)
!711 = !MDLocation(line: 260, column: 29, scope: !701)
!712 = !MDLocation(line: 283, column: 5, scope: !694)
!713 = !MDLocation(line: 284, column: 7, scope: !692)
!714 = !MDLocation(line: 258, column: 7, scope: !705)
!715 = !MDLocation(line: 265, column: 17, scope: !701)
!716 = !MDLocation(line: 259, column: 9, scope: !703)
!717 = !MDLocation(line: 258, column: 26, scope: !704)
!718 = !MDLocation(line: 261, column: 15, scope: !701)
!719 = !MDLocation(line: 261, column: 29, scope: !701)
!720 = !MDLocation(line: 262, column: 15, scope: !701)
!721 = !MDLocation(line: 262, column: 29, scope: !701)
!722 = !MDLocation(line: 264, column: 37, scope: !701)
!723 = !MDLocation(line: 266, column: 15, scope: !701)
!724 = !MDLocation(line: 267, column: 37, scope: !701)
!725 = !MDLocation(line: 269, column: 15, scope: !701)
!726 = !MDLocation(line: 270, column: 37, scope: !701)
!727 = !MDLocation(line: 273, column: 15, scope: !701)
!728 = !MDLocation(line: 274, column: 15, scope: !701)
!729 = !MDLocation(line: 277, column: 19, scope: !701)
!730 = !MDLocation(line: 280, column: 11, scope: !701)
!731 = !MDLocation(line: 264, column: 17, scope: !701)
!732 = !MDLocation(line: 265, column: 37, scope: !701)
!733 = !MDLocation(line: 267, column: 17, scope: !701)
!734 = !MDLocation(line: 268, column: 17, scope: !701)
!735 = !MDLocation(line: 268, column: 37, scope: !701)
!736 = !MDLocation(line: 270, column: 17, scope: !701)
!737 = !MDLocation(line: 271, column: 17, scope: !701)
!738 = !MDLocation(line: 271, column: 37, scope: !701)
!739 = !MDLocation(line: 272, column: 31, scope: !701)
!740 = !MDLocation(line: 273, column: 31, scope: !701)
!741 = !MDLocation(line: 274, column: 31, scope: !701)
!742 = !MDLocation(line: 248, column: 15, scope: !101)
!743 = !MDLocation(line: 277, column: 16, scope: !701)
!744 = !MDLocation(line: 277, column: 35, scope: !701)
!745 = !MDLocation(line: 277, column: 15, scope: !701)
!746 = !MDLocation(line: 248, column: 18, scope: !101)
!747 = !MDLocation(line: 279, column: 18, scope: !701)
!748 = !MDLocation(line: 279, column: 11, scope: !701)
!749 = !MDLocation(line: 248, column: 10, scope: !101)
!750 = !MDLocation(line: 280, column: 45, scope: !701)
!751 = !MDLocation(line: 280, column: 29, scope: !701)
!752 = !MDLocation(line: 247, column: 12, scope: !101)
!753 = !MDLocation(line: 247, column: 10, scope: !101)
!754 = !MDLocation(line: 285, column: 9, scope: !697)
!755 = distinct !{!755, !356}
!756 = distinct !{!756, !377, !378}
!757 = distinct !{!757, !356}
!758 = distinct !{!758, !377, !378}
!759 = !MDLocation(line: 284, column: 26, scope: !691)
!760 = !MDLocation(line: 283, column: 24, scope: !693)
!761 = !MDLocation(line: 254, column: 20, scope: !683)
!762 = !MDLocation(line: 290, column: 3, scope: !101)
!763 = !MDLocation(line: 208, column: 18, scope: !78)
!764 = !MDLocation(line: 210, column: 6, scope: !547)
!765 = !MDLocation(line: 210, column: 6, scope: !78)
!766 = !MDLocation(line: 211, column: 10, scope: !547)
!767 = !MDLocation(line: 211, column: 5, scope: !547)
!768 = !MDLocation(line: 217, column: 1, scope: !78)
!769 = !MDLocation(line: 213, column: 3, scope: !78)
!770 = !MDLocation(line: 144, column: 11, scope: !39)
!771 = !MDLocation(line: 144, column: 18, scope: !39)
!772 = !MDLocation(line: 144, column: 26, scope: !39)
!773 = !MDLocation(line: 146, column: 19, scope: !39)
!774 = !MDLocation(line: 146, column: 10, scope: !39)
!775 = !MDLocation(line: 146, column: 34, scope: !39)
!776 = !MDLocation(line: 146, column: 25, scope: !39)
!777 = !MDLocation(line: 146, column: 49, scope: !39)
!778 = !MDLocation(line: 146, column: 40, scope: !39)
!779 = !MDLocation(line: 146, column: 3, scope: !39)
!780 = !MDLocation(line: 150, column: 12, scope: !46)
!781 = !MDLocation(line: 150, column: 22, scope: !46)
!782 = !MDLocation(line: 150, column: 33, scope: !46)
!783 = !MDLocation(line: 152, column: 10, scope: !46)
!784 = !MDLocation(line: 152, column: 25, scope: !46)
!785 = !MDLocation(line: 152, column: 3, scope: !46)
!786 = !MDLocation(line: 156, column: 15, scope: !53)
!787 = !MDLocation(line: 156, column: 26, scope: !53)
!788 = !MDLocation(line: 158, column: 7, scope: !789)
!789 = !{!"0xb\00158\006\000", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!790 = !MDLocation(line: 158, column: 6, scope: !53)
!791 = !MDLocation(line: 158, column: 29, scope: !789)
!792 = !MDLocation(line: 159, column: 5, scope: !793)
!793 = !{!"0xb\00158\0047\001", !1, !789}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!794 = !{!181, !181, i64 0}
!795 = !MDLocation(line: 160, column: 5, scope: !793)
!796 = !MDLocation(line: 161, column: 5, scope: !793)
!797 = !MDLocation(line: 162, column: 5, scope: !793)
!798 = !MDLocation(line: 164, column: 7, scope: !799)
!799 = !{!"0xb\00164\006\002", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!800 = !MDLocation(line: 164, column: 6, scope: !53)
!801 = !MDLocation(line: 164, column: 28, scope: !799)
!802 = !MDLocation(line: 165, column: 5, scope: !803)
!803 = !{!"0xb\00164\0045\003", !1, !799}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!804 = !MDLocation(line: 166, column: 5, scope: !803)
!805 = !MDLocation(line: 167, column: 5, scope: !803)
!806 = !MDLocation(line: 168, column: 5, scope: !803)
!807 = !MDLocation(line: 170, column: 7, scope: !808)
!808 = !{!"0xb\00170\006\004", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!809 = !MDLocation(line: 170, column: 6, scope: !53)
!810 = !MDLocation(line: 170, column: 28, scope: !808)
!811 = !MDLocation(line: 171, column: 5, scope: !812)
!812 = !{!"0xb\00170\0045\005", !1, !808}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!813 = !MDLocation(line: 172, column: 5, scope: !812)
!814 = !MDLocation(line: 173, column: 5, scope: !812)
!815 = !MDLocation(line: 174, column: 5, scope: !812)
!816 = !MDLocation(line: 176, column: 7, scope: !817)
!817 = !{!"0xb\00176\006\006", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!818 = !MDLocation(line: 176, column: 6, scope: !53)
!819 = !MDLocation(line: 176, column: 28, scope: !817)
!820 = !MDLocation(line: 177, column: 5, scope: !821)
!821 = !{!"0xb\00176\0045\007", !1, !817}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!822 = !MDLocation(line: 178, column: 5, scope: !821)
!823 = !MDLocation(line: 179, column: 5, scope: !821)
!824 = !MDLocation(line: 180, column: 5, scope: !821)
!825 = !MDLocation(line: 182, column: 7, scope: !826)
!826 = !{!"0xb\00182\006\008", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!827 = !MDLocation(line: 182, column: 6, scope: !53)
!828 = !MDLocation(line: 182, column: 29, scope: !826)
!829 = !MDLocation(line: 183, column: 5, scope: !830)
!830 = !{!"0xb\00182\0047\009", !1, !826}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!831 = !MDLocation(line: 184, column: 5, scope: !830)
!832 = !MDLocation(line: 185, column: 5, scope: !830)
!833 = !MDLocation(line: 186, column: 5, scope: !830)
!834 = !MDLocation(line: 188, column: 5, scope: !835)
!835 = !{!"0xb\00187\0010\0010", !1, !826}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!836 = !MDLocation(line: 189, column: 5, scope: !835)
!837 = !MDLocation(line: 191, column: 1, scope: !53)
!838 = !MDLocation(line: 297, column: 18, scope: !123)
!839 = !MDLocation(line: 302, column: 3, scope: !123)
!840 = !MDLocation(line: 304, column: 6, scope: !841)
!841 = !{!"0xb\00304\006\0040", !1, !123}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!842 = !MDLocation(line: 304, column: 6, scope: !123)
!843 = !MDLocation(line: 306, column: 18, scope: !844)
!844 = !{!"0xb\00305\005\0041", !1, !841}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!845 = !{!846, !847, i64 0}
!846 = !{!"timeval", !847, i64 0, !847, i64 8}
!847 = !{!"long", !179, i64 0}
!848 = !MDLocation(line: 306, column: 7, scope: !844)
!849 = !MDLocation(line: 307, column: 19, scope: !844)
!850 = !MDLocation(line: 307, column: 7, scope: !844)
!851 = !MDLocation(line: 298, column: 10, scope: !123)
!852 = !MDLocation(line: 309, column: 3, scope: !844)
!853 = !MDLocation(line: 310, column: 29, scope: !854)
!854 = !{!"0xb\00309\0010\0042", !1, !841}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!855 = !MDLocation(line: 310, column: 19, scope: !854)
!856 = !MDLocation(line: 310, column: 9, scope: !854)
!857 = !MDLocation(line: 311, column: 29, scope: !854)
!858 = !MDLocation(line: 311, column: 18, scope: !854)
!859 = !MDLocation(line: 311, column: 8, scope: !854)
!860 = !MDLocation(line: 311, column: 7, scope: !854)
!861 = !MDLocation(line: 314, column: 3, scope: !123)
