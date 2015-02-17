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
for.cond1.preheader.lr.ph.i:
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
  br label %for.cond4.preheader.lr.ph.i, !dbg !298

for.cond4.preheader.lr.ph.i:                      ; preds = %for.cond1.preheader.lr.ph.i, %for.inc29.i
  %i.057.i = phi i32 [ 0, %for.cond1.preheader.lr.ph.i ], [ %inc30.i, %for.inc29.i ], !dbg !294
  %mul.i = mul nsw i32 %i.057.i, %i.057.i, !dbg !300
  %conv.i = sitofp i32 %mul.i to float, !dbg !306
  %div.i = fdiv float %conv.i, 3.969000e+03, !dbg !306
  %mul19.i = shl nsw i32 %i.057.i, 6, !dbg !307
  br label %for.body6.lr.ph.i, !dbg !308

for.body6.lr.ph.i:                                ; preds = %for.cond4.preheader.lr.ph.i, %vector.body
  %indvars.iv584 = phi i64 [ %indvars.iv.next585, %vector.body ], [ 0, %for.cond4.preheader.lr.ph.i ]
  %3 = trunc i64 %indvars.iv584 to i32, !dbg !307
  %mul2151.i = add i32 %3, %mul19.i, !dbg !307
  %add24.i = shl nsw i32 %mul2151.i, 7, !dbg !307
  %4 = sext i32 %add24.i to i64, !dbg !309
  %broadcast.splatinsert592 = insertelement <4 x float> undef, float %div.i, i32 0
  %broadcast.splat593 = shufflevector <4 x float> %broadcast.splatinsert592, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %for.body6.lr.ph.i
  %5 = getelementptr inbounds float* %0, i64 %4, !dbg !307
  %6 = bitcast float* %5 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %6, align 4, !dbg !307, !tbaa !310
  %.sum858 = or i64 %4, 4, !dbg !307
  %7 = getelementptr float* %0, i64 %.sum858, !dbg !307
  %8 = bitcast float* %7 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %8, align 4, !dbg !307, !tbaa !310
  %9 = add i64 8, %4, !dbg !307
  %10 = getelementptr inbounds float* %0, i64 %9, !dbg !307
  %11 = bitcast float* %10 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %11, align 4, !dbg !307, !tbaa !310
  %.sum858.1 = or i64 %9, 4, !dbg !307
  %12 = getelementptr float* %0, i64 %.sum858.1, !dbg !307
  %13 = bitcast float* %12 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %13, align 4, !dbg !307, !tbaa !310
  %14 = add i64 16, %4, !dbg !307
  %15 = getelementptr inbounds float* %0, i64 %14, !dbg !307
  %16 = bitcast float* %15 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %16, align 4, !dbg !307, !tbaa !310
  %.sum858.2 = or i64 %14, 4, !dbg !307
  %17 = getelementptr float* %0, i64 %.sum858.2, !dbg !307
  %18 = bitcast float* %17 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %18, align 4, !dbg !307, !tbaa !310
  %19 = add i64 24, %4, !dbg !307
  %20 = getelementptr inbounds float* %0, i64 %19, !dbg !307
  %21 = bitcast float* %20 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %21, align 4, !dbg !307, !tbaa !310
  %.sum858.3 = or i64 %19, 4, !dbg !307
  %22 = getelementptr float* %0, i64 %.sum858.3, !dbg !307
  %23 = bitcast float* %22 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %23, align 4, !dbg !307, !tbaa !310
  %24 = add i64 32, %4, !dbg !307
  %25 = getelementptr inbounds float* %0, i64 %24, !dbg !307
  %26 = bitcast float* %25 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %26, align 4, !dbg !307, !tbaa !310
  %.sum858.4 = or i64 %24, 4, !dbg !307
  %27 = getelementptr float* %0, i64 %.sum858.4, !dbg !307
  %28 = bitcast float* %27 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %28, align 4, !dbg !307, !tbaa !310
  %29 = add i64 40, %4, !dbg !307
  %30 = getelementptr inbounds float* %0, i64 %29, !dbg !307
  %31 = bitcast float* %30 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %31, align 4, !dbg !307, !tbaa !310
  %.sum858.5 = or i64 %29, 4, !dbg !307
  %32 = getelementptr float* %0, i64 %.sum858.5, !dbg !307
  %33 = bitcast float* %32 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %33, align 4, !dbg !307, !tbaa !310
  %34 = add i64 48, %4, !dbg !307
  %35 = getelementptr inbounds float* %0, i64 %34, !dbg !307
  %36 = bitcast float* %35 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %36, align 4, !dbg !307, !tbaa !310
  %.sum858.6 = or i64 %34, 4, !dbg !307
  %37 = getelementptr float* %0, i64 %.sum858.6, !dbg !307
  %38 = bitcast float* %37 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %38, align 4, !dbg !307, !tbaa !310
  %39 = add i64 56, %4, !dbg !307
  %40 = getelementptr inbounds float* %0, i64 %39, !dbg !307
  %41 = bitcast float* %40 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %41, align 4, !dbg !307, !tbaa !310
  %.sum858.7 = or i64 %39, 4, !dbg !307
  %42 = getelementptr float* %0, i64 %.sum858.7, !dbg !307
  %43 = bitcast float* %42 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %43, align 4, !dbg !307, !tbaa !310
  %44 = add i64 64, %4, !dbg !307
  %45 = getelementptr inbounds float* %0, i64 %44, !dbg !307
  %46 = bitcast float* %45 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %46, align 4, !dbg !307, !tbaa !310
  %.sum858.8 = or i64 %44, 4, !dbg !307
  %47 = getelementptr float* %0, i64 %.sum858.8, !dbg !307
  %48 = bitcast float* %47 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %48, align 4, !dbg !307, !tbaa !310
  %49 = add i64 72, %4, !dbg !307
  %50 = getelementptr inbounds float* %0, i64 %49, !dbg !307
  %51 = bitcast float* %50 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %51, align 4, !dbg !307, !tbaa !310
  %.sum858.9 = or i64 %49, 4, !dbg !307
  %52 = getelementptr float* %0, i64 %.sum858.9, !dbg !307
  %53 = bitcast float* %52 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %53, align 4, !dbg !307, !tbaa !310
  %54 = add i64 80, %4, !dbg !307
  %55 = getelementptr inbounds float* %0, i64 %54, !dbg !307
  %56 = bitcast float* %55 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %56, align 4, !dbg !307, !tbaa !310
  %.sum858.10 = or i64 %54, 4, !dbg !307
  %57 = getelementptr float* %0, i64 %.sum858.10, !dbg !307
  %58 = bitcast float* %57 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %58, align 4, !dbg !307, !tbaa !310
  %59 = add i64 88, %4, !dbg !307
  %60 = getelementptr inbounds float* %0, i64 %59, !dbg !307
  %61 = bitcast float* %60 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %61, align 4, !dbg !307, !tbaa !310
  %.sum858.11 = or i64 %59, 4, !dbg !307
  %62 = getelementptr float* %0, i64 %.sum858.11, !dbg !307
  %63 = bitcast float* %62 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %63, align 4, !dbg !307, !tbaa !310
  %64 = add i64 96, %4, !dbg !307
  %65 = getelementptr inbounds float* %0, i64 %64, !dbg !307
  %66 = bitcast float* %65 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %66, align 4, !dbg !307, !tbaa !310
  %.sum858.12 = or i64 %64, 4, !dbg !307
  %67 = getelementptr float* %0, i64 %.sum858.12, !dbg !307
  %68 = bitcast float* %67 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %68, align 4, !dbg !307, !tbaa !310
  %69 = add i64 104, %4, !dbg !307
  %70 = getelementptr inbounds float* %0, i64 %69, !dbg !307
  %71 = bitcast float* %70 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %71, align 4, !dbg !307, !tbaa !310
  %.sum858.13 = or i64 %69, 4, !dbg !307
  %72 = getelementptr float* %0, i64 %.sum858.13, !dbg !307
  %73 = bitcast float* %72 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %73, align 4, !dbg !307, !tbaa !310
  %74 = add i64 112, %4, !dbg !307
  %75 = getelementptr inbounds float* %0, i64 %74, !dbg !307
  %76 = bitcast float* %75 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %76, align 4, !dbg !307, !tbaa !310
  %.sum858.14 = or i64 %74, 4, !dbg !307
  %77 = getelementptr float* %0, i64 %.sum858.14, !dbg !307
  %78 = bitcast float* %77 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %78, align 4, !dbg !307, !tbaa !310
  %79 = add i64 120, %4, !dbg !307
  %80 = getelementptr inbounds float* %0, i64 %79, !dbg !307
  %81 = bitcast float* %80 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %81, align 4, !dbg !307, !tbaa !310
  %.sum858.15 = or i64 %79, 4, !dbg !307
  %82 = getelementptr float* %0, i64 %.sum858.15, !dbg !307
  %83 = bitcast float* %82 to <4 x float>*, !dbg !307
  store <4 x float> %broadcast.splat593, <4 x float>* %83, align 4, !dbg !307, !tbaa !310
  %indvars.iv.next585 = add nuw nsw i64 %indvars.iv584, 1, !dbg !308
  %exitcond587 = icmp eq i32 %3, 63, !dbg !308
  br i1 %exitcond587, label %for.inc29.i, label %for.body6.lr.ph.i, !dbg !308

for.inc29.i:                                      ; preds = %vector.body
  %inc30.i = add nuw nsw i32 %i.057.i, 1, !dbg !312
  tail call void @llvm.dbg.value(metadata i32 %inc30.i, i64 0, metadata !296, metadata !152), !dbg !297
  %exitcond588 = icmp eq i32 %i.057.i, 63, !dbg !298
  br i1 %exitcond588, label %for.cond4.preheader.lr.ph.i65.preheader, label %for.cond4.preheader.lr.ph.i, !dbg !298

for.cond4.preheader.lr.ph.i65.preheader:          ; preds = %for.inc29.i
  br label %for.cond4.preheader.lr.ph.i65, !dbg !313

for.cond4.preheader.lr.ph.i65:                    ; preds = %for.cond4.preheader.lr.ph.i65.preheader, %for.inc23.i
  %i.049.i = phi i32 [ %inc24.i, %for.inc23.i ], [ 0, %for.cond4.preheader.lr.ph.i65.preheader ], !dbg !320
  %mul1141.i = shl i32 %i.049.i, 6, !dbg !313
  br label %for.body6.lr.ph.i67, !dbg !321

for.body6.lr.ph.i67:                              ; preds = %for.cond4.preheader.lr.ph.i65, %vector.body601
  %indvars.iv574 = phi i64 [ %indvars.iv.next575, %vector.body601 ], [ 0, %for.cond4.preheader.lr.ph.i65 ]
  %84 = trunc i64 %indvars.iv574 to i32, !dbg !313
  %add43.i = add i32 %84, %mul1141.i, !dbg !313
  %add18.i = shl nsw i32 %add43.i, 7, !dbg !313
  %85 = sext i32 %add18.i to i64, !dbg !322
  br label %vector.body601

vector.body601:                                   ; preds = %for.body6.lr.ph.i67
  %86 = getelementptr inbounds float* %1, i64 %85, !dbg !313
  %87 = bitcast float* %86 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %87, align 4, !dbg !313, !tbaa !310
  %.sum836859 = or i64 %85, 4, !dbg !313
  %88 = getelementptr float* %1, i64 %.sum836859, !dbg !313
  %89 = bitcast float* %88 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %89, align 4, !dbg !313, !tbaa !310
  %90 = add i64 8, %85, !dbg !313
  %91 = getelementptr inbounds float* %1, i64 %90, !dbg !313
  %92 = bitcast float* %91 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %92, align 4, !dbg !313, !tbaa !310
  %.sum836859.1 = or i64 %90, 4, !dbg !313
  %93 = getelementptr float* %1, i64 %.sum836859.1, !dbg !313
  %94 = bitcast float* %93 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %94, align 4, !dbg !313, !tbaa !310
  %95 = add i64 16, %85, !dbg !313
  %96 = getelementptr inbounds float* %1, i64 %95, !dbg !313
  %97 = bitcast float* %96 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %97, align 4, !dbg !313, !tbaa !310
  %.sum836859.2 = or i64 %95, 4, !dbg !313
  %98 = getelementptr float* %1, i64 %.sum836859.2, !dbg !313
  %99 = bitcast float* %98 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %99, align 4, !dbg !313, !tbaa !310
  %100 = add i64 24, %85, !dbg !313
  %101 = getelementptr inbounds float* %1, i64 %100, !dbg !313
  %102 = bitcast float* %101 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %102, align 4, !dbg !313, !tbaa !310
  %.sum836859.3 = or i64 %100, 4, !dbg !313
  %103 = getelementptr float* %1, i64 %.sum836859.3, !dbg !313
  %104 = bitcast float* %103 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %104, align 4, !dbg !313, !tbaa !310
  %105 = add i64 32, %85, !dbg !313
  %106 = getelementptr inbounds float* %1, i64 %105, !dbg !313
  %107 = bitcast float* %106 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %107, align 4, !dbg !313, !tbaa !310
  %.sum836859.4 = or i64 %105, 4, !dbg !313
  %108 = getelementptr float* %1, i64 %.sum836859.4, !dbg !313
  %109 = bitcast float* %108 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %109, align 4, !dbg !313, !tbaa !310
  %110 = add i64 40, %85, !dbg !313
  %111 = getelementptr inbounds float* %1, i64 %110, !dbg !313
  %112 = bitcast float* %111 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %112, align 4, !dbg !313, !tbaa !310
  %.sum836859.5 = or i64 %110, 4, !dbg !313
  %113 = getelementptr float* %1, i64 %.sum836859.5, !dbg !313
  %114 = bitcast float* %113 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %114, align 4, !dbg !313, !tbaa !310
  %115 = add i64 48, %85, !dbg !313
  %116 = getelementptr inbounds float* %1, i64 %115, !dbg !313
  %117 = bitcast float* %116 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %117, align 4, !dbg !313, !tbaa !310
  %.sum836859.6 = or i64 %115, 4, !dbg !313
  %118 = getelementptr float* %1, i64 %.sum836859.6, !dbg !313
  %119 = bitcast float* %118 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %119, align 4, !dbg !313, !tbaa !310
  %120 = add i64 56, %85, !dbg !313
  %121 = getelementptr inbounds float* %1, i64 %120, !dbg !313
  %122 = bitcast float* %121 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %122, align 4, !dbg !313, !tbaa !310
  %.sum836859.7 = or i64 %120, 4, !dbg !313
  %123 = getelementptr float* %1, i64 %.sum836859.7, !dbg !313
  %124 = bitcast float* %123 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %124, align 4, !dbg !313, !tbaa !310
  %125 = add i64 64, %85, !dbg !313
  %126 = getelementptr inbounds float* %1, i64 %125, !dbg !313
  %127 = bitcast float* %126 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %127, align 4, !dbg !313, !tbaa !310
  %.sum836859.8 = or i64 %125, 4, !dbg !313
  %128 = getelementptr float* %1, i64 %.sum836859.8, !dbg !313
  %129 = bitcast float* %128 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %129, align 4, !dbg !313, !tbaa !310
  %130 = add i64 72, %85, !dbg !313
  %131 = getelementptr inbounds float* %1, i64 %130, !dbg !313
  %132 = bitcast float* %131 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %132, align 4, !dbg !313, !tbaa !310
  %.sum836859.9 = or i64 %130, 4, !dbg !313
  %133 = getelementptr float* %1, i64 %.sum836859.9, !dbg !313
  %134 = bitcast float* %133 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %134, align 4, !dbg !313, !tbaa !310
  %135 = add i64 80, %85, !dbg !313
  %136 = getelementptr inbounds float* %1, i64 %135, !dbg !313
  %137 = bitcast float* %136 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %137, align 4, !dbg !313, !tbaa !310
  %.sum836859.10 = or i64 %135, 4, !dbg !313
  %138 = getelementptr float* %1, i64 %.sum836859.10, !dbg !313
  %139 = bitcast float* %138 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %139, align 4, !dbg !313, !tbaa !310
  %140 = add i64 88, %85, !dbg !313
  %141 = getelementptr inbounds float* %1, i64 %140, !dbg !313
  %142 = bitcast float* %141 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %142, align 4, !dbg !313, !tbaa !310
  %.sum836859.11 = or i64 %140, 4, !dbg !313
  %143 = getelementptr float* %1, i64 %.sum836859.11, !dbg !313
  %144 = bitcast float* %143 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %144, align 4, !dbg !313, !tbaa !310
  %145 = add i64 96, %85, !dbg !313
  %146 = getelementptr inbounds float* %1, i64 %145, !dbg !313
  %147 = bitcast float* %146 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %147, align 4, !dbg !313, !tbaa !310
  %.sum836859.12 = or i64 %145, 4, !dbg !313
  %148 = getelementptr float* %1, i64 %.sum836859.12, !dbg !313
  %149 = bitcast float* %148 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %149, align 4, !dbg !313, !tbaa !310
  %150 = add i64 104, %85, !dbg !313
  %151 = getelementptr inbounds float* %1, i64 %150, !dbg !313
  %152 = bitcast float* %151 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %152, align 4, !dbg !313, !tbaa !310
  %.sum836859.13 = or i64 %150, 4, !dbg !313
  %153 = getelementptr float* %1, i64 %.sum836859.13, !dbg !313
  %154 = bitcast float* %153 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %154, align 4, !dbg !313, !tbaa !310
  %155 = add i64 112, %85, !dbg !313
  %156 = getelementptr inbounds float* %1, i64 %155, !dbg !313
  %157 = bitcast float* %156 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %157, align 4, !dbg !313, !tbaa !310
  %.sum836859.14 = or i64 %155, 4, !dbg !313
  %158 = getelementptr float* %1, i64 %.sum836859.14, !dbg !313
  %159 = bitcast float* %158 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %159, align 4, !dbg !313, !tbaa !310
  %160 = add i64 120, %85, !dbg !313
  %161 = getelementptr inbounds float* %1, i64 %160, !dbg !313
  %162 = bitcast float* %161 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %162, align 4, !dbg !313, !tbaa !310
  %.sum836859.15 = or i64 %160, 4, !dbg !313
  %163 = getelementptr float* %1, i64 %.sum836859.15, !dbg !313
  %164 = bitcast float* %163 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %164, align 4, !dbg !313, !tbaa !310
  %indvars.iv.next575 = add nuw nsw i64 %indvars.iv574, 1, !dbg !321
  %exitcond577 = icmp eq i32 %84, 63, !dbg !321
  br i1 %exitcond577, label %for.inc23.i, label %for.body6.lr.ph.i67, !dbg !321

for.inc23.i:                                      ; preds = %vector.body601
  %inc24.i = add nuw nsw i32 %i.049.i, 1, !dbg !323
  tail call void @llvm.dbg.value(metadata i32 %inc24.i, i64 0, metadata !324, metadata !152), !dbg !325
  %exitcond578 = icmp eq i32 %i.049.i, 63, !dbg !326
  br i1 %exitcond578, label %for.cond4.preheader.lr.ph.i84.preheader, label %for.cond4.preheader.lr.ph.i65, !dbg !326

for.cond4.preheader.lr.ph.i84.preheader:          ; preds = %for.inc23.i
  br label %for.cond4.preheader.lr.ph.i84, !dbg !327

for.cond4.preheader.lr.ph.i84:                    ; preds = %for.cond4.preheader.lr.ph.i84.preheader, %for.inc23.i103
  %i.049.i81 = phi i32 [ %inc24.i101, %for.inc23.i103 ], [ 0, %for.cond4.preheader.lr.ph.i84.preheader ], !dbg !328
  %165 = shl i32 %i.049.i81, 13, !dbg !327
  br label %for.inc20.i100, !dbg !327

for.inc20.i100:                                   ; preds = %for.inc20.i100, %for.cond4.preheader.lr.ph.i84
  %indvars.iv564 = phi i64 [ 0, %for.cond4.preheader.lr.ph.i84 ], [ %indvars.iv.next565.3, %for.inc20.i100 ]
  %166 = trunc i64 %indvars.iv564 to i32, !dbg !329
  %167 = shl i32 %166, 7, !dbg !329
  %168 = add nuw nsw i32 %165, %167, !dbg !329
  %169 = sext i32 %168 to i64
  %scevgep562 = getelementptr float* %2, i64 %169
  %scevgep562563 = bitcast float* %scevgep562 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep562563, i8 0, i64 512, i32 4, i1 false), !dbg !330
  %indvars.iv.next565 = add nuw nsw i64 %indvars.iv564, 1, !dbg !327
  %170 = trunc i64 %indvars.iv.next565 to i32, !dbg !329
  %171 = shl i32 %170, 7, !dbg !329
  %172 = add nuw nsw i32 %165, %171, !dbg !329
  %173 = sext i32 %172 to i64
  %scevgep562.1 = getelementptr float* %2, i64 %173
  %scevgep562563.1 = bitcast float* %scevgep562.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep562563.1, i8 0, i64 512, i32 4, i1 false), !dbg !330
  %indvars.iv.next565.1 = add nuw nsw i64 %indvars.iv.next565, 1, !dbg !327
  %174 = trunc i64 %indvars.iv.next565.1 to i32, !dbg !329
  %175 = shl i32 %174, 7, !dbg !329
  %176 = add nuw nsw i32 %165, %175, !dbg !329
  %177 = sext i32 %176 to i64
  %scevgep562.2 = getelementptr float* %2, i64 %177
  %scevgep562563.2 = bitcast float* %scevgep562.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep562563.2, i8 0, i64 512, i32 4, i1 false), !dbg !330
  %indvars.iv.next565.2 = add nuw nsw i64 %indvars.iv.next565.1, 1, !dbg !327
  %178 = trunc i64 %indvars.iv.next565.2 to i32, !dbg !329
  %179 = shl i32 %178, 7, !dbg !329
  %180 = add nuw nsw i32 %165, %179, !dbg !329
  %181 = sext i32 %180 to i64
  %scevgep562.3 = getelementptr float* %2, i64 %181
  %scevgep562563.3 = bitcast float* %scevgep562.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep562563.3, i8 0, i64 512, i32 4, i1 false), !dbg !330
  %indvars.iv.next565.3 = add nuw nsw i64 %indvars.iv.next565.2, 1, !dbg !327
  %exitcond567.3 = icmp eq i32 %178, 63, !dbg !327
  br i1 %exitcond567.3, label %for.inc23.i103, label %for.inc20.i100, !dbg !327

for.inc23.i103:                                   ; preds = %for.inc20.i100
  %inc24.i101 = add nuw nsw i32 %i.049.i81, 1, !dbg !331
  tail call void @llvm.dbg.value(metadata i32 %inc24.i101, i64 0, metadata !332, metadata !152), !dbg !333
  %exitcond568 = icmp eq i32 %i.049.i81, 63, !dbg !334
  br i1 %exitcond568, label %mat_set.exit104, label %for.cond4.preheader.lr.ph.i84, !dbg !334

mat_set.exit104:                                  ; preds = %for.inc23.i103
  %.pre = load i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 2), align 4, !dbg !335, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk2, i64 0, metadata !337, metadata !152), !dbg !338
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !339, metadata !152), !dbg !340
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !341, metadata !152), !dbg !342
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !343, metadata !152), !dbg !344
  %cmp48.i108 = icmp sgt i32 %.pre, 0, !dbg !345
  br i1 %cmp48.i108, label %for.cond1.preheader.lr.ph.i110, label %mat_set.exit134, !dbg !346

for.cond1.preheader.lr.ph.i110:                   ; preds = %mat_set.exit104
  %182 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 3) to i64*), align 8, !dbg !347
  %183 = trunc i64 %182 to i32, !dbg !347
  %cmp246.i109 = icmp sgt i32 %183, 0, !dbg !348
  %184 = lshr i64 %182, 32
  %185 = trunc i64 %184 to i32
  %cmp544.i113 = icmp sgt i32 %185, 0, !dbg !349
  %186 = load float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !350, !tbaa !190
  %187 = mul i32 %183, %185, !dbg !351
  %188 = shl nuw nsw i64 %184, 2, !dbg !346
  %189 = add nuw nsw i64 %188, 17179869180, !dbg !346
  %190 = and i64 %189, 17179869180, !dbg !346
  %191 = add nuw nsw i64 %190, 4, !dbg !346
  %192 = add i32 %183, -1, !dbg !346
  %193 = add i32 %.pre, -1, !dbg !346
  %194 = trunc i64 %182 to i32
  br label %for.cond1.preheader.i112, !dbg !346

for.cond1.preheader.i112:                         ; preds = %for.inc23.i133, %for.cond1.preheader.lr.ph.i110
  %i.049.i111 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i110 ], [ %inc24.i131, %for.inc23.i133 ], !dbg !336
  %195 = mul i32 %187, %i.049.i111, !dbg !351
  br i1 %cmp246.i109, label %for.cond4.preheader.i116.preheader, label %for.inc23.i133, !dbg !351

for.cond4.preheader.i116.preheader:               ; preds = %for.cond1.preheader.i112
  %xtraiter905 = and i32 %194, 1
  %lcmp.mod906 = icmp ne i32 %xtraiter905, 0
  %lcmp.overflow907 = icmp eq i32 %194, 0
  %lcmp.or908 = or i1 %lcmp.overflow907, %lcmp.mod906
  br i1 %lcmp.or908, label %for.cond4.preheader.i116.prol.preheader, label %for.cond4.preheader.i116.preheader.split

for.cond4.preheader.i116.prol.preheader:          ; preds = %for.cond4.preheader.i116.preheader
  br label %for.cond4.preheader.i116.prol, !dbg !352

for.cond4.preheader.i116.prol:                    ; preds = %for.cond4.preheader.i116.prol.preheader, %for.inc20.i130.prol
  %indvars.iv552.prol = phi i64 [ %indvars.iv.next553.prol, %for.inc20.i130.prol ], [ 0, %for.cond4.preheader.i116.prol.preheader ]
  %prol.iter909 = phi i32 [ %prol.iter909.sub, %for.inc20.i130.prol ], [ %xtraiter905, %for.cond4.preheader.i116.prol.preheader ]
  %196 = trunc i64 %indvars.iv552.prol to i32, !dbg !352
  br i1 %cmp544.i113, label %for.body6.lr.ph.i119.prol, label %for.inc20.i130.prol, !dbg !352

for.body6.lr.ph.i119.prol:                        ; preds = %for.cond4.preheader.i116.prol
  %197 = mul i32 %185, %196, !dbg !352
  %198 = add i32 %195, %197, !dbg !352
  %199 = sext i32 %198 to i64
  %scevgep550.prol = getelementptr float* %186, i64 %199
  %scevgep550551.prol = bitcast float* %scevgep550.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551.prol, i8 0, i64 %191, i32 4, i1 false), !dbg !350
  br label %for.inc20.i130.prol

for.inc20.i130.prol:                              ; preds = %for.body6.lr.ph.i119.prol, %for.cond4.preheader.i116.prol
  %indvars.iv.next553.prol = add nuw nsw i64 %indvars.iv552.prol, 1, !dbg !351
  %exitcond555.prol = icmp eq i32 %196, %192, !dbg !351
  %prol.iter909.sub = sub i32 %prol.iter909, 1, !dbg !351
  %prol.iter909.cmp = icmp ne i32 %prol.iter909.sub, 0, !dbg !351
  br i1 %prol.iter909.cmp, label %for.cond4.preheader.i116.prol, label %for.cond4.preheader.i116.preheader.split.loopexit, !llvm.loop !353

for.cond4.preheader.i116.preheader.split.loopexit: ; preds = %for.inc20.i130.prol
  %indvars.iv552.unr.ph = phi i64 [ %indvars.iv.next553.prol, %for.inc20.i130.prol ]
  br label %for.cond4.preheader.i116.preheader.split

for.cond4.preheader.i116.preheader.split:         ; preds = %for.cond4.preheader.i116.preheader.split.loopexit, %for.cond4.preheader.i116.preheader
  %indvars.iv552.unr = phi i64 [ 0, %for.cond4.preheader.i116.preheader ], [ %indvars.iv552.unr.ph, %for.cond4.preheader.i116.preheader.split.loopexit ]
  %200 = icmp ult i32 %194, 2
  br i1 %200, label %for.inc23.i133.loopexit, label %for.cond4.preheader.i116.preheader.split.split

for.cond4.preheader.i116.preheader.split.split:   ; preds = %for.cond4.preheader.i116.preheader.split
  br label %for.cond4.preheader.i116, !dbg !352

for.cond4.preheader.i116:                         ; preds = %for.inc20.i130.1, %for.cond4.preheader.i116.preheader.split.split
  %indvars.iv552 = phi i64 [ %indvars.iv552.unr, %for.cond4.preheader.i116.preheader.split.split ], [ %indvars.iv.next553.1, %for.inc20.i130.1 ]
  %201 = trunc i64 %indvars.iv552 to i32, !dbg !352
  br i1 %cmp544.i113, label %for.body6.lr.ph.i119, label %for.inc20.i130, !dbg !352

for.body6.lr.ph.i119:                             ; preds = %for.cond4.preheader.i116
  %202 = mul i32 %185, %201, !dbg !352
  %203 = add i32 %195, %202, !dbg !352
  %204 = sext i32 %203 to i64
  %scevgep550 = getelementptr float* %186, i64 %204
  %scevgep550551 = bitcast float* %scevgep550 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551, i8 0, i64 %191, i32 4, i1 false), !dbg !350
  br label %for.inc20.i130

for.inc20.i130:                                   ; preds = %for.body6.lr.ph.i119, %for.cond4.preheader.i116
  %indvars.iv.next553 = add nuw nsw i64 %indvars.iv552, 1, !dbg !351
  %205 = trunc i64 %indvars.iv.next553 to i32, !dbg !352
  br i1 %cmp544.i113, label %for.body6.lr.ph.i119.1, label %for.inc20.i130.1, !dbg !352

for.inc23.i133.loopexit.unr-lcssa:                ; preds = %for.inc20.i130.1
  br label %for.inc23.i133.loopexit

for.inc23.i133.loopexit:                          ; preds = %for.cond4.preheader.i116.preheader.split, %for.inc23.i133.loopexit.unr-lcssa
  br label %for.inc23.i133

for.inc23.i133:                                   ; preds = %for.inc23.i133.loopexit, %for.cond1.preheader.i112
  %inc24.i131 = add nuw nsw i32 %i.049.i111, 1, !dbg !355
  tail call void @llvm.dbg.value(metadata i32 %inc24.i131, i64 0, metadata !343, metadata !152), !dbg !344
  %exitcond556 = icmp eq i32 %i.049.i111, %193, !dbg !346
  br i1 %exitcond556, label %mat_set.exit134.loopexit, label %for.cond1.preheader.i112, !dbg !346

mat_set.exit134.loopexit:                         ; preds = %for.inc23.i133
  br label %mat_set.exit134

mat_set.exit134:                                  ; preds = %mat_set.exit134.loopexit, %mat_set.exit104
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !356, metadata !152), !dbg !358
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !359, metadata !152), !dbg !360
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !361, metadata !152), !dbg !362
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !363, metadata !152), !dbg !364
  %206 = load i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 2), align 4, !dbg !365, !tbaa !183
  %cmp48.i138 = icmp sgt i32 %206, 0, !dbg !366
  br i1 %cmp48.i138, label %for.cond1.preheader.lr.ph.i140, label %mat_set.exit258, !dbg !367

for.cond1.preheader.lr.ph.i140:                   ; preds = %mat_set.exit134
  %207 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 3) to i64*), align 8, !dbg !368
  %208 = trunc i64 %207 to i32, !dbg !368
  %cmp246.i139 = icmp sgt i32 %208, 0, !dbg !369
  %209 = lshr i64 %207, 32
  %210 = trunc i64 %209 to i32
  %cmp544.i143 = icmp sgt i32 %210, 0, !dbg !370
  %211 = load float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !371, !tbaa !190
  %212 = add i32 %210, -1, !dbg !367
  %213 = add i32 %208, -1, !dbg !367
  %214 = add i32 %206, -1, !dbg !367
  %215 = lshr i64 %207, 32, !dbg !367
  %216 = add nuw nsw i64 %215, 4294967295, !dbg !367
  %217 = and i64 %216, 4294967295
  %218 = add nuw nsw i64 %217, 1, !dbg !367
  %219 = trunc i64 %215 to i32
  br label %for.cond1.preheader.i142, !dbg !367

for.cond1.preheader.i142:                         ; preds = %for.inc23.i163, %for.cond1.preheader.lr.ph.i140
  %i.049.i141 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i140 ], [ %inc24.i161, %for.inc23.i163 ], !dbg !357
  br i1 %cmp246.i139, label %for.cond4.preheader.lr.ph.i144, label %for.inc23.i163, !dbg !372

for.cond4.preheader.lr.ph.i144:                   ; preds = %for.cond1.preheader.i142
  %mul1141.i147 = mul i32 %i.049.i141, %208, !dbg !371
  br label %for.cond4.preheader.i146, !dbg !372

for.cond4.preheader.i146:                         ; preds = %for.inc20.i160, %for.cond4.preheader.lr.ph.i144
  %indvars.iv540 = phi i64 [ %indvars.iv.next541, %for.inc20.i160 ], [ 0, %for.cond4.preheader.lr.ph.i144 ]
  %220 = trunc i64 %indvars.iv540 to i32, !dbg !371
  br i1 %cmp544.i143, label %for.body6.lr.ph.i149, label %for.inc20.i160, !dbg !373

for.body6.lr.ph.i149:                             ; preds = %for.cond4.preheader.i146
  %add43.i148 = add i32 %220, %mul1141.i147, !dbg !371
  %add18.i151 = mul nsw i32 %add43.i148, %210, !dbg !371
  %221 = sext i32 %add18.i151 to i64, !dbg !373
  %end.idx = add nuw nsw i64 %217, 1, !dbg !373
  %n.mod.vf = and i64 %215, 7, !dbg !373
  %n.vec = sub nsw i64 %218, %n.mod.vf, !dbg !373
  %cmp.zero = icmp eq i64 %218, %n.mod.vf, !dbg !373
  br i1 %cmp.zero, label %middle.block626, label %vector.body625.preheader

vector.body625.preheader:                         ; preds = %for.body6.lr.ph.i149
  br label %vector.body625, !dbg !371

vector.body625:                                   ; preds = %vector.body625.preheader, %vector.body625
  %index628 = phi i64 [ %index.next635, %vector.body625 ], [ 0, %vector.body625.preheader ], !dbg !373
  %222 = add i64 %index628, %221, !dbg !371
  %223 = getelementptr inbounds float* %211, i64 %222, !dbg !371
  %224 = bitcast float* %223 to <4 x float>*, !dbg !371
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %224, align 4, !dbg !371, !tbaa !310
  %.sum857 = add i64 %222, 4, !dbg !371
  %225 = getelementptr float* %211, i64 %.sum857, !dbg !371
  %226 = bitcast float* %225 to <4 x float>*, !dbg !371
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %226, align 4, !dbg !371, !tbaa !310
  %index.next635 = add i64 %index628, 8, !dbg !373
  %227 = icmp eq i64 %index.next635, %n.vec, !dbg !373
  br i1 %227, label %middle.block626.loopexit, label %vector.body625, !dbg !373, !llvm.loop !374

middle.block626.loopexit:                         ; preds = %vector.body625
  br label %middle.block626

middle.block626:                                  ; preds = %middle.block626.loopexit, %for.body6.lr.ph.i149
  %resume.val630 = phi i64 [ 0, %for.body6.lr.ph.i149 ], [ %n.vec, %middle.block626.loopexit ]
  %cmp.n634 = icmp eq i64 %end.idx, %resume.val630
  br i1 %cmp.n634, label %for.inc20.i160, label %for.body6.i157.preheader

for.body6.i157.preheader:                         ; preds = %middle.block626
  %228 = trunc i64 %resume.val630 to i32
  %229 = sub i32 %219, %228
  %xtraiter900 = and i32 %229, 3
  %lcmp.mod901 = icmp ne i32 %xtraiter900, 0
  %lcmp.overflow902 = icmp eq i32 %229, 0
  %lcmp.or903 = or i1 %lcmp.overflow902, %lcmp.mod901
  br i1 %lcmp.or903, label %for.body6.i157.prol.preheader, label %for.body6.i157.preheader.split

for.body6.i157.prol.preheader:                    ; preds = %for.body6.i157.preheader
  br label %for.body6.i157.prol, !dbg !371

for.body6.i157.prol:                              ; preds = %for.body6.i157.prol.preheader, %for.body6.i157.prol
  %indvars.iv535.prol = phi i64 [ %indvars.iv.next536.prol, %for.body6.i157.prol ], [ %resume.val630, %for.body6.i157.prol.preheader ]
  %prol.iter904 = phi i32 [ %prol.iter904.sub, %for.body6.i157.prol ], [ %xtraiter900, %for.body6.i157.prol.preheader ]
  %230 = add nsw i64 %indvars.iv535.prol, %221, !dbg !371
  %arrayidx.i154.prol = getelementptr inbounds float* %211, i64 %230, !dbg !371
  store float 1.000000e+00, float* %arrayidx.i154.prol, align 4, !dbg !371, !tbaa !310
  %indvars.iv.next536.prol = add nuw nsw i64 %indvars.iv535.prol, 1, !dbg !373
  %lftr.wideiv538.prol = trunc i64 %indvars.iv535.prol to i32, !dbg !373
  %exitcond539.prol = icmp eq i32 %lftr.wideiv538.prol, %212, !dbg !373
  %prol.iter904.sub = sub i32 %prol.iter904, 1, !dbg !373
  %prol.iter904.cmp = icmp ne i32 %prol.iter904.sub, 0, !dbg !373
  br i1 %prol.iter904.cmp, label %for.body6.i157.prol, label %for.body6.i157.preheader.split.loopexit, !llvm.loop !377

for.body6.i157.preheader.split.loopexit:          ; preds = %for.body6.i157.prol
  %indvars.iv535.unr.ph = phi i64 [ %indvars.iv.next536.prol, %for.body6.i157.prol ]
  br label %for.body6.i157.preheader.split

for.body6.i157.preheader.split:                   ; preds = %for.body6.i157.preheader.split.loopexit, %for.body6.i157.preheader
  %indvars.iv535.unr = phi i64 [ %resume.val630, %for.body6.i157.preheader ], [ %indvars.iv535.unr.ph, %for.body6.i157.preheader.split.loopexit ]
  %231 = icmp ult i32 %229, 4
  br i1 %231, label %for.inc20.i160.loopexit, label %for.body6.i157.preheader.split.split

for.body6.i157.preheader.split.split:             ; preds = %for.body6.i157.preheader.split
  br label %for.body6.i157, !dbg !371

for.body6.i157:                                   ; preds = %for.body6.i157, %for.body6.i157.preheader.split.split
  %indvars.iv535 = phi i64 [ %indvars.iv535.unr, %for.body6.i157.preheader.split.split ], [ %indvars.iv.next536.3, %for.body6.i157 ]
  %232 = add nsw i64 %indvars.iv535, %221, !dbg !371
  %arrayidx.i154 = getelementptr inbounds float* %211, i64 %232, !dbg !371
  store float 1.000000e+00, float* %arrayidx.i154, align 4, !dbg !371, !tbaa !310
  %indvars.iv.next536 = add nuw nsw i64 %indvars.iv535, 1, !dbg !373
  %lftr.wideiv538 = trunc i64 %indvars.iv535 to i32, !dbg !373
  %233 = add nsw i64 %indvars.iv.next536, %221, !dbg !371
  %arrayidx.i154.1 = getelementptr inbounds float* %211, i64 %233, !dbg !371
  store float 1.000000e+00, float* %arrayidx.i154.1, align 4, !dbg !371, !tbaa !310
  %indvars.iv.next536.1 = add nuw nsw i64 %indvars.iv.next536, 1, !dbg !373
  %lftr.wideiv538.1 = trunc i64 %indvars.iv.next536 to i32, !dbg !373
  %234 = add nsw i64 %indvars.iv.next536.1, %221, !dbg !371
  %arrayidx.i154.2 = getelementptr inbounds float* %211, i64 %234, !dbg !371
  store float 1.000000e+00, float* %arrayidx.i154.2, align 4, !dbg !371, !tbaa !310
  %indvars.iv.next536.2 = add nuw nsw i64 %indvars.iv.next536.1, 1, !dbg !373
  %lftr.wideiv538.2 = trunc i64 %indvars.iv.next536.1 to i32, !dbg !373
  %235 = add nsw i64 %indvars.iv.next536.2, %221, !dbg !371
  %arrayidx.i154.3 = getelementptr inbounds float* %211, i64 %235, !dbg !371
  store float 1.000000e+00, float* %arrayidx.i154.3, align 4, !dbg !371, !tbaa !310
  %indvars.iv.next536.3 = add nuw nsw i64 %indvars.iv.next536.2, 1, !dbg !373
  %lftr.wideiv538.3 = trunc i64 %indvars.iv.next536.2 to i32, !dbg !373
  %exitcond539.3 = icmp eq i32 %lftr.wideiv538.3, %212, !dbg !373
  br i1 %exitcond539.3, label %for.inc20.i160.loopexit.unr-lcssa, label %for.body6.i157, !dbg !373, !llvm.loop !378

for.inc20.i160.loopexit.unr-lcssa:                ; preds = %for.body6.i157
  br label %for.inc20.i160.loopexit

for.inc20.i160.loopexit:                          ; preds = %for.body6.i157.preheader.split, %for.inc20.i160.loopexit.unr-lcssa
  br label %for.inc20.i160

for.inc20.i160:                                   ; preds = %for.inc20.i160.loopexit, %middle.block626, %for.cond4.preheader.i146
  %indvars.iv.next541 = add nuw nsw i64 %indvars.iv540, 1, !dbg !372
  %exitcond543 = icmp eq i32 %220, %213, !dbg !372
  br i1 %exitcond543, label %for.inc23.i163.loopexit, label %for.cond4.preheader.i146, !dbg !372

for.inc23.i163.loopexit:                          ; preds = %for.inc20.i160
  br label %for.inc23.i163

for.inc23.i163:                                   ; preds = %for.inc23.i163.loopexit, %for.cond1.preheader.i142
  %inc24.i161 = add nuw nsw i32 %i.049.i141, 1, !dbg !379
  tail call void @llvm.dbg.value(metadata i32 %inc24.i161, i64 0, metadata !363, metadata !152), !dbg !364
  %exitcond544 = icmp eq i32 %i.049.i141, %214, !dbg !367
  br i1 %exitcond544, label %for.cond1.preheader.i172.preheader, label %for.cond1.preheader.i142, !dbg !367

for.cond1.preheader.i172.preheader:               ; preds = %for.inc23.i163
  %236 = lshr i64 %207, 32, !dbg !380
  %237 = add nuw nsw i64 %236, 4294967295, !dbg !380
  %238 = and i64 %237, 4294967295
  %239 = add nuw nsw i64 %238, 1, !dbg !380
  %240 = trunc i64 %236 to i32
  br label %for.cond1.preheader.i172, !dbg !380

for.cond1.preheader.i172:                         ; preds = %for.cond1.preheader.i172.preheader, %for.inc23.i193
  %i.049.i171 = phi i32 [ %inc24.i191, %for.inc23.i193 ], [ 0, %for.cond1.preheader.i172.preheader ], !dbg !381
  br i1 %cmp246.i139, label %for.cond4.preheader.lr.ph.i174, label %for.inc23.i193, !dbg !380

for.cond4.preheader.lr.ph.i174:                   ; preds = %for.cond1.preheader.i172
  %mul942.i = add i32 %i.049.i171, %206, !dbg !382
  %mul1141.i177 = mul i32 %mul942.i, %208, !dbg !382
  br label %for.cond4.preheader.i176, !dbg !380

for.cond4.preheader.i176:                         ; preds = %for.inc20.i190, %for.cond4.preheader.lr.ph.i174
  %indvars.iv530 = phi i64 [ %indvars.iv.next531, %for.inc20.i190 ], [ 0, %for.cond4.preheader.lr.ph.i174 ]
  %241 = trunc i64 %indvars.iv530 to i32, !dbg !382
  br i1 %cmp544.i143, label %for.body6.lr.ph.i179, label %for.inc20.i190, !dbg !383

for.body6.lr.ph.i179:                             ; preds = %for.cond4.preheader.i176
  %add43.i178 = add i32 %241, %mul1141.i177, !dbg !382
  %add18.i181 = mul nsw i32 %add43.i178, %210, !dbg !382
  %242 = sext i32 %add18.i181 to i64, !dbg !383
  %end.idx655 = add nuw nsw i64 %238, 1, !dbg !383
  %n.mod.vf656 = and i64 %236, 7, !dbg !383
  %n.vec657 = sub nsw i64 %239, %n.mod.vf656, !dbg !383
  %cmp.zero659 = icmp eq i64 %239, %n.mod.vf656, !dbg !383
  br i1 %cmp.zero659, label %middle.block652, label %vector.body651.preheader

vector.body651.preheader:                         ; preds = %for.body6.lr.ph.i179
  br label %vector.body651, !dbg !382

vector.body651:                                   ; preds = %vector.body651.preheader, %vector.body651
  %index654 = phi i64 [ %index.next666, %vector.body651 ], [ 0, %vector.body651.preheader ], !dbg !383
  %243 = add i64 %index654, %242, !dbg !382
  %244 = getelementptr inbounds float* %211, i64 %243, !dbg !382
  %245 = bitcast float* %244 to <4 x float>*, !dbg !382
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %245, align 4, !dbg !382, !tbaa !310
  %.sum854 = add i64 %243, 4, !dbg !382
  %246 = getelementptr float* %211, i64 %.sum854, !dbg !382
  %247 = bitcast float* %246 to <4 x float>*, !dbg !382
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %247, align 4, !dbg !382, !tbaa !310
  %index.next666 = add i64 %index654, 8, !dbg !383
  %248 = icmp eq i64 %index.next666, %n.vec657, !dbg !383
  br i1 %248, label %middle.block652.loopexit, label %vector.body651, !dbg !383, !llvm.loop !384

middle.block652.loopexit:                         ; preds = %vector.body651
  br label %middle.block652

middle.block652:                                  ; preds = %middle.block652.loopexit, %for.body6.lr.ph.i179
  %resume.val661 = phi i64 [ 0, %for.body6.lr.ph.i179 ], [ %n.vec657, %middle.block652.loopexit ]
  %cmp.n665 = icmp eq i64 %end.idx655, %resume.val661
  br i1 %cmp.n665, label %for.inc20.i190, label %for.body6.i187.preheader

for.body6.i187.preheader:                         ; preds = %middle.block652
  %249 = trunc i64 %resume.val661 to i32
  %250 = sub i32 %240, %249
  %xtraiter895 = and i32 %250, 3
  %lcmp.mod896 = icmp ne i32 %xtraiter895, 0
  %lcmp.overflow897 = icmp eq i32 %250, 0
  %lcmp.or898 = or i1 %lcmp.overflow897, %lcmp.mod896
  br i1 %lcmp.or898, label %for.body6.i187.prol.preheader, label %for.body6.i187.preheader.split

for.body6.i187.prol.preheader:                    ; preds = %for.body6.i187.preheader
  br label %for.body6.i187.prol, !dbg !382

for.body6.i187.prol:                              ; preds = %for.body6.i187.prol.preheader, %for.body6.i187.prol
  %indvars.iv525.prol = phi i64 [ %indvars.iv.next526.prol, %for.body6.i187.prol ], [ %resume.val661, %for.body6.i187.prol.preheader ]
  %prol.iter899 = phi i32 [ %prol.iter899.sub, %for.body6.i187.prol ], [ %xtraiter895, %for.body6.i187.prol.preheader ]
  %251 = add nsw i64 %indvars.iv525.prol, %242, !dbg !382
  %arrayidx.i184.prol = getelementptr inbounds float* %211, i64 %251, !dbg !382
  store float 1.000000e+00, float* %arrayidx.i184.prol, align 4, !dbg !382, !tbaa !310
  %indvars.iv.next526.prol = add nuw nsw i64 %indvars.iv525.prol, 1, !dbg !383
  %lftr.wideiv528.prol = trunc i64 %indvars.iv525.prol to i32, !dbg !383
  %exitcond529.prol = icmp eq i32 %lftr.wideiv528.prol, %212, !dbg !383
  %prol.iter899.sub = sub i32 %prol.iter899, 1, !dbg !383
  %prol.iter899.cmp = icmp ne i32 %prol.iter899.sub, 0, !dbg !383
  br i1 %prol.iter899.cmp, label %for.body6.i187.prol, label %for.body6.i187.preheader.split.loopexit, !llvm.loop !385

for.body6.i187.preheader.split.loopexit:          ; preds = %for.body6.i187.prol
  %indvars.iv525.unr.ph = phi i64 [ %indvars.iv.next526.prol, %for.body6.i187.prol ]
  br label %for.body6.i187.preheader.split

for.body6.i187.preheader.split:                   ; preds = %for.body6.i187.preheader.split.loopexit, %for.body6.i187.preheader
  %indvars.iv525.unr = phi i64 [ %resume.val661, %for.body6.i187.preheader ], [ %indvars.iv525.unr.ph, %for.body6.i187.preheader.split.loopexit ]
  %252 = icmp ult i32 %250, 4
  br i1 %252, label %for.inc20.i190.loopexit, label %for.body6.i187.preheader.split.split

for.body6.i187.preheader.split.split:             ; preds = %for.body6.i187.preheader.split
  br label %for.body6.i187, !dbg !382

for.body6.i187:                                   ; preds = %for.body6.i187, %for.body6.i187.preheader.split.split
  %indvars.iv525 = phi i64 [ %indvars.iv525.unr, %for.body6.i187.preheader.split.split ], [ %indvars.iv.next526.3, %for.body6.i187 ]
  %253 = add nsw i64 %indvars.iv525, %242, !dbg !382
  %arrayidx.i184 = getelementptr inbounds float* %211, i64 %253, !dbg !382
  store float 1.000000e+00, float* %arrayidx.i184, align 4, !dbg !382, !tbaa !310
  %indvars.iv.next526 = add nuw nsw i64 %indvars.iv525, 1, !dbg !383
  %lftr.wideiv528 = trunc i64 %indvars.iv525 to i32, !dbg !383
  %254 = add nsw i64 %indvars.iv.next526, %242, !dbg !382
  %arrayidx.i184.1 = getelementptr inbounds float* %211, i64 %254, !dbg !382
  store float 1.000000e+00, float* %arrayidx.i184.1, align 4, !dbg !382, !tbaa !310
  %indvars.iv.next526.1 = add nuw nsw i64 %indvars.iv.next526, 1, !dbg !383
  %lftr.wideiv528.1 = trunc i64 %indvars.iv.next526 to i32, !dbg !383
  %255 = add nsw i64 %indvars.iv.next526.1, %242, !dbg !382
  %arrayidx.i184.2 = getelementptr inbounds float* %211, i64 %255, !dbg !382
  store float 1.000000e+00, float* %arrayidx.i184.2, align 4, !dbg !382, !tbaa !310
  %indvars.iv.next526.2 = add nuw nsw i64 %indvars.iv.next526.1, 1, !dbg !383
  %lftr.wideiv528.2 = trunc i64 %indvars.iv.next526.1 to i32, !dbg !383
  %256 = add nsw i64 %indvars.iv.next526.2, %242, !dbg !382
  %arrayidx.i184.3 = getelementptr inbounds float* %211, i64 %256, !dbg !382
  store float 1.000000e+00, float* %arrayidx.i184.3, align 4, !dbg !382, !tbaa !310
  %indvars.iv.next526.3 = add nuw nsw i64 %indvars.iv.next526.2, 1, !dbg !383
  %lftr.wideiv528.3 = trunc i64 %indvars.iv.next526.2 to i32, !dbg !383
  %exitcond529.3 = icmp eq i32 %lftr.wideiv528.3, %212, !dbg !383
  br i1 %exitcond529.3, label %for.inc20.i190.loopexit.unr-lcssa, label %for.body6.i187, !dbg !383, !llvm.loop !386

for.inc20.i190.loopexit.unr-lcssa:                ; preds = %for.body6.i187
  br label %for.inc20.i190.loopexit

for.inc20.i190.loopexit:                          ; preds = %for.body6.i187.preheader.split, %for.inc20.i190.loopexit.unr-lcssa
  br label %for.inc20.i190

for.inc20.i190:                                   ; preds = %for.inc20.i190.loopexit, %middle.block652, %for.cond4.preheader.i176
  %indvars.iv.next531 = add nuw nsw i64 %indvars.iv530, 1, !dbg !380
  %exitcond533 = icmp eq i32 %241, %213, !dbg !380
  br i1 %exitcond533, label %for.inc23.i193.loopexit, label %for.cond4.preheader.i176, !dbg !380

for.inc23.i193.loopexit:                          ; preds = %for.inc20.i190
  br label %for.inc23.i193

for.inc23.i193:                                   ; preds = %for.inc23.i193.loopexit, %for.cond1.preheader.i172
  %inc24.i191 = add nuw nsw i32 %i.049.i171, 1, !dbg !387
  tail call void @llvm.dbg.value(metadata i32 %inc24.i191, i64 0, metadata !388, metadata !152), !dbg !389
  %exitcond534 = icmp eq i32 %i.049.i171, %214, !dbg !390
  br i1 %exitcond534, label %for.cond1.preheader.lr.ph.i200, label %for.cond1.preheader.i172, !dbg !390

for.cond1.preheader.lr.ph.i200:                   ; preds = %for.inc23.i193
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !391, metadata !152), !dbg !393
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !394, metadata !152), !dbg !395
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !396, metadata !152), !dbg !397
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !398, metadata !152), !dbg !399
  %mul.i207 = shl i32 %206, 1, !dbg !400
  %257 = lshr i64 %207, 32, !dbg !401
  %258 = add nuw nsw i64 %257, 4294967295, !dbg !401
  %259 = and i64 %258, 4294967295
  %260 = add nuw nsw i64 %259, 1, !dbg !401
  %261 = trunc i64 %257 to i32
  br label %for.cond1.preheader.i202, !dbg !401

for.cond1.preheader.i202:                         ; preds = %for.inc23.i225, %for.cond1.preheader.lr.ph.i200
  %i.049.i201 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i200 ], [ %inc24.i223, %for.inc23.i225 ], !dbg !392
  br i1 %cmp246.i139, label %for.cond4.preheader.lr.ph.i204, label %for.inc23.i225, !dbg !402

for.cond4.preheader.lr.ph.i204:                   ; preds = %for.cond1.preheader.i202
  %mul942.i208 = add i32 %i.049.i201, %mul.i207, !dbg !400
  %mul1141.i209 = mul i32 %mul942.i208, %208, !dbg !400
  br label %for.cond4.preheader.i206, !dbg !402

for.cond4.preheader.i206:                         ; preds = %for.inc20.i222, %for.cond4.preheader.lr.ph.i204
  %indvars.iv520 = phi i64 [ %indvars.iv.next521, %for.inc20.i222 ], [ 0, %for.cond4.preheader.lr.ph.i204 ]
  %262 = trunc i64 %indvars.iv520 to i32, !dbg !400
  br i1 %cmp544.i143, label %for.body6.lr.ph.i211, label %for.inc20.i222, !dbg !403

for.body6.lr.ph.i211:                             ; preds = %for.cond4.preheader.i206
  %add43.i210 = add i32 %262, %mul1141.i209, !dbg !400
  %add18.i213 = mul nsw i32 %add43.i210, %210, !dbg !400
  %263 = sext i32 %add18.i213 to i64, !dbg !403
  %end.idx686 = add nuw nsw i64 %259, 1, !dbg !403
  %n.mod.vf687 = and i64 %257, 7, !dbg !403
  %n.vec688 = sub nsw i64 %260, %n.mod.vf687, !dbg !403
  %cmp.zero690 = icmp eq i64 %260, %n.mod.vf687, !dbg !403
  br i1 %cmp.zero690, label %middle.block683, label %vector.body682.preheader

vector.body682.preheader:                         ; preds = %for.body6.lr.ph.i211
  br label %vector.body682, !dbg !400

vector.body682:                                   ; preds = %vector.body682.preheader, %vector.body682
  %index685 = phi i64 [ %index.next697, %vector.body682 ], [ 0, %vector.body682.preheader ], !dbg !403
  %264 = add i64 %index685, %263, !dbg !400
  %265 = getelementptr inbounds float* %211, i64 %264, !dbg !400
  %266 = bitcast float* %265 to <4 x float>*, !dbg !400
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %266, align 4, !dbg !400, !tbaa !310
  %.sum851 = add i64 %264, 4, !dbg !400
  %267 = getelementptr float* %211, i64 %.sum851, !dbg !400
  %268 = bitcast float* %267 to <4 x float>*, !dbg !400
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %268, align 4, !dbg !400, !tbaa !310
  %index.next697 = add i64 %index685, 8, !dbg !403
  %269 = icmp eq i64 %index.next697, %n.vec688, !dbg !403
  br i1 %269, label %middle.block683.loopexit, label %vector.body682, !dbg !403, !llvm.loop !404

middle.block683.loopexit:                         ; preds = %vector.body682
  br label %middle.block683

middle.block683:                                  ; preds = %middle.block683.loopexit, %for.body6.lr.ph.i211
  %resume.val692 = phi i64 [ 0, %for.body6.lr.ph.i211 ], [ %n.vec688, %middle.block683.loopexit ]
  %cmp.n696 = icmp eq i64 %end.idx686, %resume.val692
  br i1 %cmp.n696, label %for.inc20.i222, label %for.body6.i219.preheader

for.body6.i219.preheader:                         ; preds = %middle.block683
  %270 = trunc i64 %resume.val692 to i32
  %271 = sub i32 %261, %270
  %xtraiter890 = and i32 %271, 3
  %lcmp.mod891 = icmp ne i32 %xtraiter890, 0
  %lcmp.overflow892 = icmp eq i32 %271, 0
  %lcmp.or893 = or i1 %lcmp.overflow892, %lcmp.mod891
  br i1 %lcmp.or893, label %for.body6.i219.prol.preheader, label %for.body6.i219.preheader.split

for.body6.i219.prol.preheader:                    ; preds = %for.body6.i219.preheader
  br label %for.body6.i219.prol, !dbg !400

for.body6.i219.prol:                              ; preds = %for.body6.i219.prol.preheader, %for.body6.i219.prol
  %indvars.iv515.prol = phi i64 [ %indvars.iv.next516.prol, %for.body6.i219.prol ], [ %resume.val692, %for.body6.i219.prol.preheader ]
  %prol.iter894 = phi i32 [ %prol.iter894.sub, %for.body6.i219.prol ], [ %xtraiter890, %for.body6.i219.prol.preheader ]
  %272 = add nsw i64 %indvars.iv515.prol, %263, !dbg !400
  %arrayidx.i216.prol = getelementptr inbounds float* %211, i64 %272, !dbg !400
  store float 1.000000e+00, float* %arrayidx.i216.prol, align 4, !dbg !400, !tbaa !310
  %indvars.iv.next516.prol = add nuw nsw i64 %indvars.iv515.prol, 1, !dbg !403
  %lftr.wideiv518.prol = trunc i64 %indvars.iv515.prol to i32, !dbg !403
  %exitcond519.prol = icmp eq i32 %lftr.wideiv518.prol, %212, !dbg !403
  %prol.iter894.sub = sub i32 %prol.iter894, 1, !dbg !403
  %prol.iter894.cmp = icmp ne i32 %prol.iter894.sub, 0, !dbg !403
  br i1 %prol.iter894.cmp, label %for.body6.i219.prol, label %for.body6.i219.preheader.split.loopexit, !llvm.loop !405

for.body6.i219.preheader.split.loopexit:          ; preds = %for.body6.i219.prol
  %indvars.iv515.unr.ph = phi i64 [ %indvars.iv.next516.prol, %for.body6.i219.prol ]
  br label %for.body6.i219.preheader.split

for.body6.i219.preheader.split:                   ; preds = %for.body6.i219.preheader.split.loopexit, %for.body6.i219.preheader
  %indvars.iv515.unr = phi i64 [ %resume.val692, %for.body6.i219.preheader ], [ %indvars.iv515.unr.ph, %for.body6.i219.preheader.split.loopexit ]
  %273 = icmp ult i32 %271, 4
  br i1 %273, label %for.inc20.i222.loopexit, label %for.body6.i219.preheader.split.split

for.body6.i219.preheader.split.split:             ; preds = %for.body6.i219.preheader.split
  br label %for.body6.i219, !dbg !400

for.body6.i219:                                   ; preds = %for.body6.i219, %for.body6.i219.preheader.split.split
  %indvars.iv515 = phi i64 [ %indvars.iv515.unr, %for.body6.i219.preheader.split.split ], [ %indvars.iv.next516.3, %for.body6.i219 ]
  %274 = add nsw i64 %indvars.iv515, %263, !dbg !400
  %arrayidx.i216 = getelementptr inbounds float* %211, i64 %274, !dbg !400
  store float 1.000000e+00, float* %arrayidx.i216, align 4, !dbg !400, !tbaa !310
  %indvars.iv.next516 = add nuw nsw i64 %indvars.iv515, 1, !dbg !403
  %lftr.wideiv518 = trunc i64 %indvars.iv515 to i32, !dbg !403
  %275 = add nsw i64 %indvars.iv.next516, %263, !dbg !400
  %arrayidx.i216.1 = getelementptr inbounds float* %211, i64 %275, !dbg !400
  store float 1.000000e+00, float* %arrayidx.i216.1, align 4, !dbg !400, !tbaa !310
  %indvars.iv.next516.1 = add nuw nsw i64 %indvars.iv.next516, 1, !dbg !403
  %lftr.wideiv518.1 = trunc i64 %indvars.iv.next516 to i32, !dbg !403
  %276 = add nsw i64 %indvars.iv.next516.1, %263, !dbg !400
  %arrayidx.i216.2 = getelementptr inbounds float* %211, i64 %276, !dbg !400
  store float 1.000000e+00, float* %arrayidx.i216.2, align 4, !dbg !400, !tbaa !310
  %indvars.iv.next516.2 = add nuw nsw i64 %indvars.iv.next516.1, 1, !dbg !403
  %lftr.wideiv518.2 = trunc i64 %indvars.iv.next516.1 to i32, !dbg !403
  %277 = add nsw i64 %indvars.iv.next516.2, %263, !dbg !400
  %arrayidx.i216.3 = getelementptr inbounds float* %211, i64 %277, !dbg !400
  store float 1.000000e+00, float* %arrayidx.i216.3, align 4, !dbg !400, !tbaa !310
  %indvars.iv.next516.3 = add nuw nsw i64 %indvars.iv.next516.2, 1, !dbg !403
  %lftr.wideiv518.3 = trunc i64 %indvars.iv.next516.2 to i32, !dbg !403
  %exitcond519.3 = icmp eq i32 %lftr.wideiv518.3, %212, !dbg !403
  br i1 %exitcond519.3, label %for.inc20.i222.loopexit.unr-lcssa, label %for.body6.i219, !dbg !403, !llvm.loop !406

for.inc20.i222.loopexit.unr-lcssa:                ; preds = %for.body6.i219
  br label %for.inc20.i222.loopexit

for.inc20.i222.loopexit:                          ; preds = %for.body6.i219.preheader.split, %for.inc20.i222.loopexit.unr-lcssa
  br label %for.inc20.i222

for.inc20.i222:                                   ; preds = %for.inc20.i222.loopexit, %middle.block683, %for.cond4.preheader.i206
  %indvars.iv.next521 = add nuw nsw i64 %indvars.iv520, 1, !dbg !402
  %exitcond523 = icmp eq i32 %262, %213, !dbg !402
  br i1 %exitcond523, label %for.inc23.i225.loopexit, label %for.cond4.preheader.i206, !dbg !402

for.inc23.i225.loopexit:                          ; preds = %for.inc20.i222
  br label %for.inc23.i225

for.inc23.i225:                                   ; preds = %for.inc23.i225.loopexit, %for.cond1.preheader.i202
  %inc24.i223 = add nuw nsw i32 %i.049.i201, 1, !dbg !407
  tail call void @llvm.dbg.value(metadata i32 %inc24.i223, i64 0, metadata !398, metadata !152), !dbg !399
  %exitcond524 = icmp eq i32 %i.049.i201, %214, !dbg !401
  br i1 %exitcond524, label %for.cond1.preheader.lr.ph.i232, label %for.cond1.preheader.i202, !dbg !401

for.cond1.preheader.lr.ph.i232:                   ; preds = %for.inc23.i225
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !408, metadata !152), !dbg !410
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !411, metadata !152), !dbg !412
  tail call void @llvm.dbg.value(metadata float 0x3FC5555560000000, i64 0, metadata !413, metadata !152), !dbg !414
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !415, metadata !152), !dbg !416
  %mul.i239 = mul nsw i32 %206, 3, !dbg !417
  %278 = lshr i64 %207, 32, !dbg !418
  %279 = add nuw nsw i64 %278, 4294967295, !dbg !418
  %280 = and i64 %279, 4294967295
  %281 = add nuw nsw i64 %280, 1, !dbg !418
  %282 = trunc i64 %278 to i32
  br label %for.cond1.preheader.i234, !dbg !418

for.cond1.preheader.i234:                         ; preds = %for.inc23.i257, %for.cond1.preheader.lr.ph.i232
  %i.049.i233 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i232 ], [ %inc24.i255, %for.inc23.i257 ], !dbg !409
  br i1 %cmp246.i139, label %for.cond4.preheader.lr.ph.i236, label %for.inc23.i257, !dbg !419

for.cond4.preheader.lr.ph.i236:                   ; preds = %for.cond1.preheader.i234
  %mul942.i240 = add i32 %i.049.i233, %mul.i239, !dbg !417
  %mul1141.i241 = mul i32 %mul942.i240, %208, !dbg !417
  br label %for.cond4.preheader.i238, !dbg !419

for.cond4.preheader.i238:                         ; preds = %for.inc20.i254, %for.cond4.preheader.lr.ph.i236
  %indvars.iv510 = phi i64 [ %indvars.iv.next511, %for.inc20.i254 ], [ 0, %for.cond4.preheader.lr.ph.i236 ]
  %283 = trunc i64 %indvars.iv510 to i32, !dbg !417
  br i1 %cmp544.i143, label %for.body6.lr.ph.i243, label %for.inc20.i254, !dbg !420

for.body6.lr.ph.i243:                             ; preds = %for.cond4.preheader.i238
  %add43.i242 = add i32 %283, %mul1141.i241, !dbg !417
  %add18.i245 = mul nsw i32 %add43.i242, %210, !dbg !417
  %284 = sext i32 %add18.i245 to i64, !dbg !420
  %end.idx717 = add nuw nsw i64 %280, 1, !dbg !420
  %n.mod.vf718 = and i64 %278, 7, !dbg !420
  %n.vec719 = sub nsw i64 %281, %n.mod.vf718, !dbg !420
  %cmp.zero721 = icmp eq i64 %281, %n.mod.vf718, !dbg !420
  br i1 %cmp.zero721, label %middle.block714, label %vector.body713.preheader

vector.body713.preheader:                         ; preds = %for.body6.lr.ph.i243
  br label %vector.body713, !dbg !417

vector.body713:                                   ; preds = %vector.body713.preheader, %vector.body713
  %index716 = phi i64 [ %index.next728, %vector.body713 ], [ 0, %vector.body713.preheader ], !dbg !420
  %285 = add i64 %index716, %284, !dbg !417
  %286 = getelementptr inbounds float* %211, i64 %285, !dbg !417
  %287 = bitcast float* %286 to <4 x float>*, !dbg !417
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %287, align 4, !dbg !417, !tbaa !310
  %.sum848 = add i64 %285, 4, !dbg !417
  %288 = getelementptr float* %211, i64 %.sum848, !dbg !417
  %289 = bitcast float* %288 to <4 x float>*, !dbg !417
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %289, align 4, !dbg !417, !tbaa !310
  %index.next728 = add i64 %index716, 8, !dbg !420
  %290 = icmp eq i64 %index.next728, %n.vec719, !dbg !420
  br i1 %290, label %middle.block714.loopexit, label %vector.body713, !dbg !420, !llvm.loop !421

middle.block714.loopexit:                         ; preds = %vector.body713
  br label %middle.block714

middle.block714:                                  ; preds = %middle.block714.loopexit, %for.body6.lr.ph.i243
  %resume.val723 = phi i64 [ 0, %for.body6.lr.ph.i243 ], [ %n.vec719, %middle.block714.loopexit ]
  %cmp.n727 = icmp eq i64 %end.idx717, %resume.val723
  br i1 %cmp.n727, label %for.inc20.i254, label %for.body6.i251.preheader

for.body6.i251.preheader:                         ; preds = %middle.block714
  %291 = trunc i64 %resume.val723 to i32
  %292 = sub i32 %282, %291
  %xtraiter885 = and i32 %292, 3
  %lcmp.mod886 = icmp ne i32 %xtraiter885, 0
  %lcmp.overflow887 = icmp eq i32 %292, 0
  %lcmp.or888 = or i1 %lcmp.overflow887, %lcmp.mod886
  br i1 %lcmp.or888, label %for.body6.i251.prol.preheader, label %for.body6.i251.preheader.split

for.body6.i251.prol.preheader:                    ; preds = %for.body6.i251.preheader
  br label %for.body6.i251.prol, !dbg !417

for.body6.i251.prol:                              ; preds = %for.body6.i251.prol.preheader, %for.body6.i251.prol
  %indvars.iv505.prol = phi i64 [ %indvars.iv.next506.prol, %for.body6.i251.prol ], [ %resume.val723, %for.body6.i251.prol.preheader ]
  %prol.iter889 = phi i32 [ %prol.iter889.sub, %for.body6.i251.prol ], [ %xtraiter885, %for.body6.i251.prol.preheader ]
  %293 = add nsw i64 %indvars.iv505.prol, %284, !dbg !417
  %arrayidx.i248.prol = getelementptr inbounds float* %211, i64 %293, !dbg !417
  store float 0x3FC5555560000000, float* %arrayidx.i248.prol, align 4, !dbg !417, !tbaa !310
  %indvars.iv.next506.prol = add nuw nsw i64 %indvars.iv505.prol, 1, !dbg !420
  %lftr.wideiv508.prol = trunc i64 %indvars.iv505.prol to i32, !dbg !420
  %exitcond509.prol = icmp eq i32 %lftr.wideiv508.prol, %212, !dbg !420
  %prol.iter889.sub = sub i32 %prol.iter889, 1, !dbg !420
  %prol.iter889.cmp = icmp ne i32 %prol.iter889.sub, 0, !dbg !420
  br i1 %prol.iter889.cmp, label %for.body6.i251.prol, label %for.body6.i251.preheader.split.loopexit, !llvm.loop !422

for.body6.i251.preheader.split.loopexit:          ; preds = %for.body6.i251.prol
  %indvars.iv505.unr.ph = phi i64 [ %indvars.iv.next506.prol, %for.body6.i251.prol ]
  br label %for.body6.i251.preheader.split

for.body6.i251.preheader.split:                   ; preds = %for.body6.i251.preheader.split.loopexit, %for.body6.i251.preheader
  %indvars.iv505.unr = phi i64 [ %resume.val723, %for.body6.i251.preheader ], [ %indvars.iv505.unr.ph, %for.body6.i251.preheader.split.loopexit ]
  %294 = icmp ult i32 %292, 4
  br i1 %294, label %for.inc20.i254.loopexit, label %for.body6.i251.preheader.split.split

for.body6.i251.preheader.split.split:             ; preds = %for.body6.i251.preheader.split
  br label %for.body6.i251, !dbg !417

for.body6.i251:                                   ; preds = %for.body6.i251, %for.body6.i251.preheader.split.split
  %indvars.iv505 = phi i64 [ %indvars.iv505.unr, %for.body6.i251.preheader.split.split ], [ %indvars.iv.next506.3, %for.body6.i251 ]
  %295 = add nsw i64 %indvars.iv505, %284, !dbg !417
  %arrayidx.i248 = getelementptr inbounds float* %211, i64 %295, !dbg !417
  store float 0x3FC5555560000000, float* %arrayidx.i248, align 4, !dbg !417, !tbaa !310
  %indvars.iv.next506 = add nuw nsw i64 %indvars.iv505, 1, !dbg !420
  %lftr.wideiv508 = trunc i64 %indvars.iv505 to i32, !dbg !420
  %296 = add nsw i64 %indvars.iv.next506, %284, !dbg !417
  %arrayidx.i248.1 = getelementptr inbounds float* %211, i64 %296, !dbg !417
  store float 0x3FC5555560000000, float* %arrayidx.i248.1, align 4, !dbg !417, !tbaa !310
  %indvars.iv.next506.1 = add nuw nsw i64 %indvars.iv.next506, 1, !dbg !420
  %lftr.wideiv508.1 = trunc i64 %indvars.iv.next506 to i32, !dbg !420
  %297 = add nsw i64 %indvars.iv.next506.1, %284, !dbg !417
  %arrayidx.i248.2 = getelementptr inbounds float* %211, i64 %297, !dbg !417
  store float 0x3FC5555560000000, float* %arrayidx.i248.2, align 4, !dbg !417, !tbaa !310
  %indvars.iv.next506.2 = add nuw nsw i64 %indvars.iv.next506.1, 1, !dbg !420
  %lftr.wideiv508.2 = trunc i64 %indvars.iv.next506.1 to i32, !dbg !420
  %298 = add nsw i64 %indvars.iv.next506.2, %284, !dbg !417
  %arrayidx.i248.3 = getelementptr inbounds float* %211, i64 %298, !dbg !417
  store float 0x3FC5555560000000, float* %arrayidx.i248.3, align 4, !dbg !417, !tbaa !310
  %indvars.iv.next506.3 = add nuw nsw i64 %indvars.iv.next506.2, 1, !dbg !420
  %lftr.wideiv508.3 = trunc i64 %indvars.iv.next506.2 to i32, !dbg !420
  %exitcond509.3 = icmp eq i32 %lftr.wideiv508.3, %212, !dbg !420
  br i1 %exitcond509.3, label %for.inc20.i254.loopexit.unr-lcssa, label %for.body6.i251, !dbg !420, !llvm.loop !423

for.inc20.i254.loopexit.unr-lcssa:                ; preds = %for.body6.i251
  br label %for.inc20.i254.loopexit

for.inc20.i254.loopexit:                          ; preds = %for.body6.i251.preheader.split, %for.inc20.i254.loopexit.unr-lcssa
  br label %for.inc20.i254

for.inc20.i254:                                   ; preds = %for.inc20.i254.loopexit, %middle.block714, %for.cond4.preheader.i238
  %indvars.iv.next511 = add nuw nsw i64 %indvars.iv510, 1, !dbg !419
  %exitcond513 = icmp eq i32 %283, %213, !dbg !419
  br i1 %exitcond513, label %for.inc23.i257.loopexit, label %for.cond4.preheader.i238, !dbg !419

for.inc23.i257.loopexit:                          ; preds = %for.inc20.i254
  br label %for.inc23.i257

for.inc23.i257:                                   ; preds = %for.inc23.i257.loopexit, %for.cond1.preheader.i234
  %inc24.i255 = add nuw nsw i32 %i.049.i233, 1, !dbg !424
  tail call void @llvm.dbg.value(metadata i32 %inc24.i255, i64 0, metadata !415, metadata !152), !dbg !416
  %exitcond514 = icmp eq i32 %i.049.i233, %214, !dbg !418
  br i1 %exitcond514, label %mat_set.exit258.loopexit, label %for.cond1.preheader.i234, !dbg !418

mat_set.exit258.loopexit:                         ; preds = %for.inc23.i257
  br label %mat_set.exit258

mat_set.exit258:                                  ; preds = %mat_set.exit258.loopexit, %mat_set.exit134
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !425, metadata !152), !dbg !427
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !428, metadata !152), !dbg !429
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !430, metadata !152), !dbg !431
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !432, metadata !152), !dbg !433
  %299 = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !434, !tbaa !183
  %cmp48.i259 = icmp sgt i32 %299, 0, !dbg !435
  br i1 %cmp48.i259, label %for.cond1.preheader.lr.ph.i261, label %mat_set.exit398, !dbg !436

for.cond1.preheader.lr.ph.i261:                   ; preds = %mat_set.exit258
  %300 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !437
  %301 = trunc i64 %300 to i32, !dbg !437
  %cmp246.i260 = icmp sgt i32 %301, 0, !dbg !438
  %302 = lshr i64 %300, 32
  %303 = trunc i64 %302 to i32
  %cmp544.i264 = icmp sgt i32 %303, 0, !dbg !439
  %304 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !440, !tbaa !190
  %305 = mul i32 %301, %303, !dbg !441
  %306 = shl nuw nsw i64 %302, 2, !dbg !436
  %307 = add nuw nsw i64 %306, 17179869180, !dbg !436
  %308 = and i64 %307, 17179869180, !dbg !436
  %309 = add nuw nsw i64 %308, 4, !dbg !436
  %310 = add i32 %301, -1, !dbg !436
  %311 = add i32 %299, -1, !dbg !436
  %312 = trunc i64 %300 to i32
  br label %for.cond1.preheader.i263, !dbg !436

for.cond1.preheader.i263:                         ; preds = %for.inc23.i284, %for.cond1.preheader.lr.ph.i261
  %i.049.i262 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i261 ], [ %inc24.i282, %for.inc23.i284 ], !dbg !426
  %313 = mul i32 %305, %i.049.i262, !dbg !441
  br i1 %cmp246.i260, label %for.cond4.preheader.i267.preheader, label %for.inc23.i284, !dbg !441

for.cond4.preheader.i267.preheader:               ; preds = %for.cond1.preheader.i263
  %xtraiter880 = and i32 %312, 1
  %lcmp.mod881 = icmp ne i32 %xtraiter880, 0
  %lcmp.overflow882 = icmp eq i32 %312, 0
  %lcmp.or883 = or i1 %lcmp.overflow882, %lcmp.mod881
  br i1 %lcmp.or883, label %for.cond4.preheader.i267.prol.preheader, label %for.cond4.preheader.i267.preheader.split

for.cond4.preheader.i267.prol.preheader:          ; preds = %for.cond4.preheader.i267.preheader
  br label %for.cond4.preheader.i267.prol, !dbg !442

for.cond4.preheader.i267.prol:                    ; preds = %for.cond4.preheader.i267.prol.preheader, %for.inc20.i281.prol
  %indvars.iv500.prol = phi i64 [ %indvars.iv.next501.prol, %for.inc20.i281.prol ], [ 0, %for.cond4.preheader.i267.prol.preheader ]
  %prol.iter884 = phi i32 [ %prol.iter884.sub, %for.inc20.i281.prol ], [ %xtraiter880, %for.cond4.preheader.i267.prol.preheader ]
  %314 = trunc i64 %indvars.iv500.prol to i32, !dbg !442
  br i1 %cmp544.i264, label %for.body6.lr.ph.i270.prol, label %for.inc20.i281.prol, !dbg !442

for.body6.lr.ph.i270.prol:                        ; preds = %for.cond4.preheader.i267.prol
  %315 = mul i32 %303, %314, !dbg !442
  %316 = add i32 %313, %315, !dbg !442
  %317 = sext i32 %316 to i64
  %scevgep498.prol = getelementptr float* %304, i64 %317
  %scevgep498499.prol = bitcast float* %scevgep498.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep498499.prol, i8 0, i64 %309, i32 4, i1 false), !dbg !440
  br label %for.inc20.i281.prol

for.inc20.i281.prol:                              ; preds = %for.body6.lr.ph.i270.prol, %for.cond4.preheader.i267.prol
  %indvars.iv.next501.prol = add nuw nsw i64 %indvars.iv500.prol, 1, !dbg !441
  %exitcond503.prol = icmp eq i32 %314, %310, !dbg !441
  %prol.iter884.sub = sub i32 %prol.iter884, 1, !dbg !441
  %prol.iter884.cmp = icmp ne i32 %prol.iter884.sub, 0, !dbg !441
  br i1 %prol.iter884.cmp, label %for.cond4.preheader.i267.prol, label %for.cond4.preheader.i267.preheader.split.loopexit, !llvm.loop !443

for.cond4.preheader.i267.preheader.split.loopexit: ; preds = %for.inc20.i281.prol
  %indvars.iv500.unr.ph = phi i64 [ %indvars.iv.next501.prol, %for.inc20.i281.prol ]
  br label %for.cond4.preheader.i267.preheader.split

for.cond4.preheader.i267.preheader.split:         ; preds = %for.cond4.preheader.i267.preheader.split.loopexit, %for.cond4.preheader.i267.preheader
  %indvars.iv500.unr = phi i64 [ 0, %for.cond4.preheader.i267.preheader ], [ %indvars.iv500.unr.ph, %for.cond4.preheader.i267.preheader.split.loopexit ]
  %318 = icmp ult i32 %312, 2
  br i1 %318, label %for.inc23.i284.loopexit, label %for.cond4.preheader.i267.preheader.split.split

for.cond4.preheader.i267.preheader.split.split:   ; preds = %for.cond4.preheader.i267.preheader.split
  br label %for.cond4.preheader.i267, !dbg !442

for.cond4.preheader.i267:                         ; preds = %for.inc20.i281.1, %for.cond4.preheader.i267.preheader.split.split
  %indvars.iv500 = phi i64 [ %indvars.iv500.unr, %for.cond4.preheader.i267.preheader.split.split ], [ %indvars.iv.next501.1, %for.inc20.i281.1 ]
  %319 = trunc i64 %indvars.iv500 to i32, !dbg !442
  br i1 %cmp544.i264, label %for.body6.lr.ph.i270, label %for.inc20.i281, !dbg !442

for.body6.lr.ph.i270:                             ; preds = %for.cond4.preheader.i267
  %320 = mul i32 %303, %319, !dbg !442
  %321 = add i32 %313, %320, !dbg !442
  %322 = sext i32 %321 to i64
  %scevgep498 = getelementptr float* %304, i64 %322
  %scevgep498499 = bitcast float* %scevgep498 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep498499, i8 0, i64 %309, i32 4, i1 false), !dbg !440
  br label %for.inc20.i281

for.inc20.i281:                                   ; preds = %for.body6.lr.ph.i270, %for.cond4.preheader.i267
  %indvars.iv.next501 = add nuw nsw i64 %indvars.iv500, 1, !dbg !441
  %323 = trunc i64 %indvars.iv.next501 to i32, !dbg !442
  br i1 %cmp544.i264, label %for.body6.lr.ph.i270.1, label %for.inc20.i281.1, !dbg !442

for.inc23.i284.loopexit.unr-lcssa:                ; preds = %for.inc20.i281.1
  br label %for.inc23.i284.loopexit

for.inc23.i284.loopexit:                          ; preds = %for.cond4.preheader.i267.preheader.split, %for.inc23.i284.loopexit.unr-lcssa
  br label %for.inc23.i284

for.inc23.i284:                                   ; preds = %for.inc23.i284.loopexit, %for.cond1.preheader.i263
  %inc24.i282 = add nuw nsw i32 %i.049.i262, 1, !dbg !444
  tail call void @llvm.dbg.value(metadata i32 %inc24.i282, i64 0, metadata !432, metadata !152), !dbg !433
  %exitcond504 = icmp eq i32 %i.049.i262, %311, !dbg !436
  br i1 %exitcond504, label %mat_set.exit285, label %for.cond1.preheader.i263, !dbg !436

mat_set.exit285:                                  ; preds = %for.inc23.i284
  %.pr432 = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !445, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !447, metadata !152), !dbg !448
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !449, metadata !152), !dbg !450
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !451, metadata !152), !dbg !452
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !453, metadata !152), !dbg !454
  %cmp48.i399 = icmp sgt i32 %.pr432, 0, !dbg !455
  br i1 %cmp48.i399, label %for.cond1.preheader.lr.ph.i401, label %mat_set.exit398, !dbg !456

for.cond1.preheader.lr.ph.i401:                   ; preds = %mat_set.exit285
  %324 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !457
  %325 = trunc i64 %324 to i32, !dbg !457
  %cmp246.i400 = icmp sgt i32 %325, 0, !dbg !458
  %326 = lshr i64 %324, 32
  %327 = trunc i64 %326 to i32
  %cmp544.i404 = icmp sgt i32 %327, 0, !dbg !459
  %328 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !460, !tbaa !190
  %329 = mul i32 %325, %327, !dbg !461
  %330 = mul i32 %.pr432, %325, !dbg !456
  %331 = mul i32 %330, %327, !dbg !456
  %332 = shl nuw nsw i64 %326, 2, !dbg !456
  %333 = add nuw nsw i64 %332, 17179869180, !dbg !456
  %334 = and i64 %333, 17179869180, !dbg !456
  %335 = add nuw nsw i64 %334, 4, !dbg !456
  %336 = add i32 %325, -1, !dbg !456
  %337 = add i32 %.pr432, -1, !dbg !456
  %338 = trunc i64 %324 to i32
  br label %for.cond1.preheader.i403, !dbg !456

for.cond1.preheader.i403:                         ; preds = %for.inc23.i425, %for.cond1.preheader.lr.ph.i401
  %i.049.i402 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i401 ], [ %inc24.i423, %for.inc23.i425 ], !dbg !446
  %339 = mul i32 %329, %i.049.i402, !dbg !461
  %340 = add i32 %331, %339, !dbg !461
  br i1 %cmp246.i400, label %for.cond4.preheader.i407.preheader, label %for.inc23.i425, !dbg !461

for.cond4.preheader.i407.preheader:               ; preds = %for.cond1.preheader.i403
  %xtraiter875 = and i32 %338, 1
  %lcmp.mod876 = icmp ne i32 %xtraiter875, 0
  %lcmp.overflow877 = icmp eq i32 %338, 0
  %lcmp.or878 = or i1 %lcmp.overflow877, %lcmp.mod876
  br i1 %lcmp.or878, label %for.cond4.preheader.i407.prol.preheader, label %for.cond4.preheader.i407.preheader.split

for.cond4.preheader.i407.prol.preheader:          ; preds = %for.cond4.preheader.i407.preheader
  br label %for.cond4.preheader.i407.prol, !dbg !462

for.cond4.preheader.i407.prol:                    ; preds = %for.cond4.preheader.i407.prol.preheader, %for.inc20.i422.prol
  %indvars.iv488.prol = phi i64 [ %indvars.iv.next489.prol, %for.inc20.i422.prol ], [ 0, %for.cond4.preheader.i407.prol.preheader ]
  %prol.iter879 = phi i32 [ %prol.iter879.sub, %for.inc20.i422.prol ], [ %xtraiter875, %for.cond4.preheader.i407.prol.preheader ]
  %341 = trunc i64 %indvars.iv488.prol to i32, !dbg !462
  br i1 %cmp544.i404, label %for.body6.lr.ph.i411.prol, label %for.inc20.i422.prol, !dbg !462

for.body6.lr.ph.i411.prol:                        ; preds = %for.cond4.preheader.i407.prol
  %342 = mul i32 %327, %341, !dbg !462
  %343 = add i32 %340, %342, !dbg !462
  %344 = sext i32 %343 to i64
  %scevgep486.prol = getelementptr float* %328, i64 %344
  %scevgep486487.prol = bitcast float* %scevgep486.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487.prol, i8 0, i64 %335, i32 4, i1 false), !dbg !460
  br label %for.inc20.i422.prol

for.inc20.i422.prol:                              ; preds = %for.body6.lr.ph.i411.prol, %for.cond4.preheader.i407.prol
  %indvars.iv.next489.prol = add nuw nsw i64 %indvars.iv488.prol, 1, !dbg !461
  %exitcond491.prol = icmp eq i32 %341, %336, !dbg !461
  %prol.iter879.sub = sub i32 %prol.iter879, 1, !dbg !461
  %prol.iter879.cmp = icmp ne i32 %prol.iter879.sub, 0, !dbg !461
  br i1 %prol.iter879.cmp, label %for.cond4.preheader.i407.prol, label %for.cond4.preheader.i407.preheader.split.loopexit, !llvm.loop !463

for.cond4.preheader.i407.preheader.split.loopexit: ; preds = %for.inc20.i422.prol
  %indvars.iv488.unr.ph = phi i64 [ %indvars.iv.next489.prol, %for.inc20.i422.prol ]
  br label %for.cond4.preheader.i407.preheader.split

for.cond4.preheader.i407.preheader.split:         ; preds = %for.cond4.preheader.i407.preheader.split.loopexit, %for.cond4.preheader.i407.preheader
  %indvars.iv488.unr = phi i64 [ 0, %for.cond4.preheader.i407.preheader ], [ %indvars.iv488.unr.ph, %for.cond4.preheader.i407.preheader.split.loopexit ]
  %345 = icmp ult i32 %338, 2
  br i1 %345, label %for.inc23.i425.loopexit, label %for.cond4.preheader.i407.preheader.split.split

for.cond4.preheader.i407.preheader.split.split:   ; preds = %for.cond4.preheader.i407.preheader.split
  br label %for.cond4.preheader.i407, !dbg !462

for.cond4.preheader.i407:                         ; preds = %for.inc20.i422.1, %for.cond4.preheader.i407.preheader.split.split
  %indvars.iv488 = phi i64 [ %indvars.iv488.unr, %for.cond4.preheader.i407.preheader.split.split ], [ %indvars.iv.next489.1, %for.inc20.i422.1 ]
  %346 = trunc i64 %indvars.iv488 to i32, !dbg !462
  br i1 %cmp544.i404, label %for.body6.lr.ph.i411, label %for.inc20.i422, !dbg !462

for.body6.lr.ph.i411:                             ; preds = %for.cond4.preheader.i407
  %347 = mul i32 %327, %346, !dbg !462
  %348 = add i32 %340, %347, !dbg !462
  %349 = sext i32 %348 to i64
  %scevgep486 = getelementptr float* %328, i64 %349
  %scevgep486487 = bitcast float* %scevgep486 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487, i8 0, i64 %335, i32 4, i1 false), !dbg !460
  br label %for.inc20.i422

for.inc20.i422:                                   ; preds = %for.body6.lr.ph.i411, %for.cond4.preheader.i407
  %indvars.iv.next489 = add nuw nsw i64 %indvars.iv488, 1, !dbg !461
  %350 = trunc i64 %indvars.iv.next489 to i32, !dbg !462
  br i1 %cmp544.i404, label %for.body6.lr.ph.i411.1, label %for.inc20.i422.1, !dbg !462

for.inc23.i425.loopexit.unr-lcssa:                ; preds = %for.inc20.i422.1
  br label %for.inc23.i425.loopexit

for.inc23.i425.loopexit:                          ; preds = %for.cond4.preheader.i407.preheader.split, %for.inc23.i425.loopexit.unr-lcssa
  br label %for.inc23.i425

for.inc23.i425:                                   ; preds = %for.inc23.i425.loopexit, %for.cond1.preheader.i403
  %inc24.i423 = add nuw nsw i32 %i.049.i402, 1, !dbg !464
  tail call void @llvm.dbg.value(metadata i32 %inc24.i423, i64 0, metadata !453, metadata !152), !dbg !454
  %exitcond492 = icmp eq i32 %i.049.i402, %337, !dbg !456
  br i1 %exitcond492, label %mat_set.exit426, label %for.cond1.preheader.i403, !dbg !456

mat_set.exit426:                                  ; preds = %for.inc23.i425
  %.pr434.pr = load i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !465, !tbaa !183
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !467, metadata !152), !dbg !468
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !469, metadata !152), !dbg !470
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !471, metadata !152), !dbg !472
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !473, metadata !152), !dbg !474
  %cmp48.i370 = icmp sgt i32 %.pr434.pr, 0, !dbg !475
  br i1 %cmp48.i370, label %for.cond1.preheader.lr.ph.i372, label %mat_set.exit398, !dbg !476

for.cond1.preheader.lr.ph.i372:                   ; preds = %mat_set.exit426
  %351 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3) to i64*), align 8, !dbg !477
  %352 = trunc i64 %351 to i32, !dbg !477
  %cmp246.i371 = icmp sgt i32 %352, 0, !dbg !478
  %353 = lshr i64 %351, 32
  %354 = trunc i64 %353 to i32
  %cmp544.i375 = icmp sgt i32 %354, 0, !dbg !479
  %355 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !480, !tbaa !190
  %356 = mul i32 %352, %354, !dbg !481
  %357 = mul i32 %.pr434.pr, %352, !dbg !476
  %358 = mul i32 %357, %354, !dbg !476
  %359 = shl i32 %358, 1, !dbg !476
  %360 = shl nuw nsw i64 %353, 2, !dbg !476
  %361 = add nuw nsw i64 %360, 17179869180, !dbg !476
  %362 = and i64 %361, 17179869180, !dbg !476
  %363 = add nuw nsw i64 %362, 4, !dbg !476
  %364 = add i32 %352, -1, !dbg !476
  %365 = add i32 %.pr434.pr, -1, !dbg !476
  %366 = trunc i64 %351 to i32
  br label %for.cond1.preheader.i374, !dbg !476

for.cond1.preheader.i374:                         ; preds = %for.inc23.i397, %for.cond1.preheader.lr.ph.i372
  %i.049.i373 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i372 ], [ %inc24.i395, %for.inc23.i397 ], !dbg !466
  %367 = mul i32 %356, %i.049.i373, !dbg !481
  %368 = add i32 %359, %367, !dbg !481
  br i1 %cmp246.i371, label %for.cond4.preheader.i378.preheader, label %for.inc23.i397, !dbg !481

for.cond4.preheader.i378.preheader:               ; preds = %for.cond1.preheader.i374
  %xtraiter870 = and i32 %366, 1
  %lcmp.mod871 = icmp ne i32 %xtraiter870, 0
  %lcmp.overflow872 = icmp eq i32 %366, 0
  %lcmp.or873 = or i1 %lcmp.overflow872, %lcmp.mod871
  br i1 %lcmp.or873, label %for.cond4.preheader.i378.prol.preheader, label %for.cond4.preheader.i378.preheader.split

for.cond4.preheader.i378.prol.preheader:          ; preds = %for.cond4.preheader.i378.preheader
  br label %for.cond4.preheader.i378.prol, !dbg !482

for.cond4.preheader.i378.prol:                    ; preds = %for.cond4.preheader.i378.prol.preheader, %for.inc20.i394.prol
  %indvars.iv476.prol = phi i64 [ %indvars.iv.next477.prol, %for.inc20.i394.prol ], [ 0, %for.cond4.preheader.i378.prol.preheader ]
  %prol.iter874 = phi i32 [ %prol.iter874.sub, %for.inc20.i394.prol ], [ %xtraiter870, %for.cond4.preheader.i378.prol.preheader ]
  %369 = trunc i64 %indvars.iv476.prol to i32, !dbg !482
  br i1 %cmp544.i375, label %for.body6.lr.ph.i383.prol, label %for.inc20.i394.prol, !dbg !482

for.body6.lr.ph.i383.prol:                        ; preds = %for.cond4.preheader.i378.prol
  %370 = mul i32 %354, %369, !dbg !482
  %371 = add i32 %368, %370, !dbg !482
  %372 = sext i32 %371 to i64
  %scevgep.prol = getelementptr float* %355, i64 %372
  %scevgep475.prol = bitcast float* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep475.prol, i8 0, i64 %363, i32 4, i1 false), !dbg !480
  br label %for.inc20.i394.prol

for.inc20.i394.prol:                              ; preds = %for.body6.lr.ph.i383.prol, %for.cond4.preheader.i378.prol
  %indvars.iv.next477.prol = add nuw nsw i64 %indvars.iv476.prol, 1, !dbg !481
  %exitcond479.prol = icmp eq i32 %369, %364, !dbg !481
  %prol.iter874.sub = sub i32 %prol.iter874, 1, !dbg !481
  %prol.iter874.cmp = icmp ne i32 %prol.iter874.sub, 0, !dbg !481
  br i1 %prol.iter874.cmp, label %for.cond4.preheader.i378.prol, label %for.cond4.preheader.i378.preheader.split.loopexit, !llvm.loop !483

for.cond4.preheader.i378.preheader.split.loopexit: ; preds = %for.inc20.i394.prol
  %indvars.iv476.unr.ph = phi i64 [ %indvars.iv.next477.prol, %for.inc20.i394.prol ]
  br label %for.cond4.preheader.i378.preheader.split

for.cond4.preheader.i378.preheader.split:         ; preds = %for.cond4.preheader.i378.preheader.split.loopexit, %for.cond4.preheader.i378.preheader
  %indvars.iv476.unr = phi i64 [ 0, %for.cond4.preheader.i378.preheader ], [ %indvars.iv476.unr.ph, %for.cond4.preheader.i378.preheader.split.loopexit ]
  %373 = icmp ult i32 %366, 2
  br i1 %373, label %for.inc23.i397.loopexit, label %for.cond4.preheader.i378.preheader.split.split

for.cond4.preheader.i378.preheader.split.split:   ; preds = %for.cond4.preheader.i378.preheader.split
  br label %for.cond4.preheader.i378, !dbg !482

for.cond4.preheader.i378:                         ; preds = %for.inc20.i394.1, %for.cond4.preheader.i378.preheader.split.split
  %indvars.iv476 = phi i64 [ %indvars.iv476.unr, %for.cond4.preheader.i378.preheader.split.split ], [ %indvars.iv.next477.1, %for.inc20.i394.1 ]
  %374 = trunc i64 %indvars.iv476 to i32, !dbg !482
  br i1 %cmp544.i375, label %for.body6.lr.ph.i383, label %for.inc20.i394, !dbg !482

for.body6.lr.ph.i383:                             ; preds = %for.cond4.preheader.i378
  %375 = mul i32 %354, %374, !dbg !482
  %376 = add i32 %368, %375, !dbg !482
  %377 = sext i32 %376 to i64
  %scevgep = getelementptr float* %355, i64 %377
  %scevgep475 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep475, i8 0, i64 %363, i32 4, i1 false), !dbg !480
  br label %for.inc20.i394

for.inc20.i394:                                   ; preds = %for.body6.lr.ph.i383, %for.cond4.preheader.i378
  %indvars.iv.next477 = add nuw nsw i64 %indvars.iv476, 1, !dbg !481
  %378 = trunc i64 %indvars.iv.next477 to i32, !dbg !482
  br i1 %cmp544.i375, label %for.body6.lr.ph.i383.1, label %for.inc20.i394.1, !dbg !482

for.inc23.i397.loopexit.unr-lcssa:                ; preds = %for.inc20.i394.1
  br label %for.inc23.i397.loopexit

for.inc23.i397.loopexit:                          ; preds = %for.cond4.preheader.i378.preheader.split, %for.inc23.i397.loopexit.unr-lcssa
  br label %for.inc23.i397

for.inc23.i397:                                   ; preds = %for.inc23.i397.loopexit, %for.cond1.preheader.i374
  %inc24.i395 = add nuw nsw i32 %i.049.i373, 1, !dbg !484
  tail call void @llvm.dbg.value(metadata i32 %inc24.i395, i64 0, metadata !473, metadata !152), !dbg !474
  %exitcond480 = icmp eq i32 %i.049.i373, %365, !dbg !476
  br i1 %exitcond480, label %mat_set.exit398.loopexit, label %for.cond1.preheader.i374, !dbg !476

mat_set.exit398.loopexit:                         ; preds = %for.inc23.i397
  br label %mat_set.exit398

mat_set.exit398:                                  ; preds = %mat_set.exit398.loopexit, %mat_set.exit258, %mat_set.exit285, %mat_set.exit426
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !485, metadata !152), !dbg !487
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !488, metadata !152), !dbg !489
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !490, metadata !152), !dbg !491
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !492, metadata !152), !dbg !493
  %379 = load i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 2), align 4, !dbg !494, !tbaa !183
  %cmp48.i343 = icmp sgt i32 %379, 0, !dbg !495
  br i1 %cmp48.i343, label %for.cond1.preheader.lr.ph.i345, label %mat_set.exit314, !dbg !496

for.cond1.preheader.lr.ph.i345:                   ; preds = %mat_set.exit398
  %380 = load i64* bitcast (i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 3) to i64*), align 8, !dbg !497
  %381 = trunc i64 %380 to i32, !dbg !497
  %cmp246.i344 = icmp sgt i32 %381, 0, !dbg !498
  %382 = lshr i64 %380, 32
  %383 = trunc i64 %382 to i32
  %cmp544.i348 = icmp sgt i32 %383, 0, !dbg !499
  %384 = load float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !500, !tbaa !190
  %385 = add i32 %383, -1, !dbg !496
  %386 = add i32 %381, -1, !dbg !496
  %387 = add i32 %379, -1, !dbg !496
  %388 = lshr i64 %380, 32, !dbg !496
  %389 = add nuw nsw i64 %388, 4294967295, !dbg !496
  %390 = and i64 %389, 4294967295
  %391 = add nuw nsw i64 %390, 1, !dbg !496
  %392 = trunc i64 %388 to i32
  br label %for.cond1.preheader.i347, !dbg !496

for.cond1.preheader.i347:                         ; preds = %for.inc23.i368, %for.cond1.preheader.lr.ph.i345
  %i.049.i346 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i345 ], [ %inc24.i366, %for.inc23.i368 ], !dbg !486
  br i1 %cmp246.i344, label %for.cond4.preheader.lr.ph.i349, label %for.inc23.i368, !dbg !501

for.cond4.preheader.lr.ph.i349:                   ; preds = %for.cond1.preheader.i347
  %mul1141.i352 = mul i32 %i.049.i346, %381, !dbg !500
  br label %for.cond4.preheader.i351, !dbg !501

for.cond4.preheader.i351:                         ; preds = %for.inc20.i365, %for.cond4.preheader.lr.ph.i349
  %indvars.iv465 = phi i64 [ %indvars.iv.next466, %for.inc20.i365 ], [ 0, %for.cond4.preheader.lr.ph.i349 ]
  %393 = trunc i64 %indvars.iv465 to i32, !dbg !500
  br i1 %cmp544.i348, label %for.body6.lr.ph.i354, label %for.inc20.i365, !dbg !502

for.body6.lr.ph.i354:                             ; preds = %for.cond4.preheader.i351
  %add43.i353 = add i32 %393, %mul1141.i352, !dbg !500
  %add18.i356 = mul nsw i32 %add43.i353, %383, !dbg !500
  %394 = sext i32 %add18.i356 to i64, !dbg !502
  %end.idx748 = add nuw nsw i64 %390, 1, !dbg !502
  %n.mod.vf749 = and i64 %388, 7, !dbg !502
  %n.vec750 = sub nsw i64 %391, %n.mod.vf749, !dbg !502
  %cmp.zero752 = icmp eq i64 %391, %n.mod.vf749, !dbg !502
  br i1 %cmp.zero752, label %middle.block745, label %vector.body744.preheader

vector.body744.preheader:                         ; preds = %for.body6.lr.ph.i354
  br label %vector.body744, !dbg !500

vector.body744:                                   ; preds = %vector.body744.preheader, %vector.body744
  %index747 = phi i64 [ %index.next759, %vector.body744 ], [ 0, %vector.body744.preheader ], !dbg !502
  %395 = add i64 %index747, %394, !dbg !500
  %396 = getelementptr inbounds float* %384, i64 %395, !dbg !500
  %397 = bitcast float* %396 to <4 x float>*, !dbg !500
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %397, align 4, !dbg !500, !tbaa !310
  %.sum845 = add i64 %395, 4, !dbg !500
  %398 = getelementptr float* %384, i64 %.sum845, !dbg !500
  %399 = bitcast float* %398 to <4 x float>*, !dbg !500
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %399, align 4, !dbg !500, !tbaa !310
  %index.next759 = add i64 %index747, 8, !dbg !502
  %400 = icmp eq i64 %index.next759, %n.vec750, !dbg !502
  br i1 %400, label %middle.block745.loopexit, label %vector.body744, !dbg !502, !llvm.loop !503

middle.block745.loopexit:                         ; preds = %vector.body744
  br label %middle.block745

middle.block745:                                  ; preds = %middle.block745.loopexit, %for.body6.lr.ph.i354
  %resume.val754 = phi i64 [ 0, %for.body6.lr.ph.i354 ], [ %n.vec750, %middle.block745.loopexit ]
  %cmp.n758 = icmp eq i64 %end.idx748, %resume.val754
  br i1 %cmp.n758, label %for.inc20.i365, label %for.body6.i362.preheader

for.body6.i362.preheader:                         ; preds = %middle.block745
  %401 = trunc i64 %resume.val754 to i32
  %402 = sub i32 %392, %401
  %xtraiter865 = and i32 %402, 3
  %lcmp.mod866 = icmp ne i32 %xtraiter865, 0
  %lcmp.overflow867 = icmp eq i32 %402, 0
  %lcmp.or868 = or i1 %lcmp.overflow867, %lcmp.mod866
  br i1 %lcmp.or868, label %for.body6.i362.prol.preheader, label %for.body6.i362.preheader.split

for.body6.i362.prol.preheader:                    ; preds = %for.body6.i362.preheader
  br label %for.body6.i362.prol, !dbg !500

for.body6.i362.prol:                              ; preds = %for.body6.i362.prol.preheader, %for.body6.i362.prol
  %indvars.iv460.prol = phi i64 [ %indvars.iv.next461.prol, %for.body6.i362.prol ], [ %resume.val754, %for.body6.i362.prol.preheader ]
  %prol.iter869 = phi i32 [ %prol.iter869.sub, %for.body6.i362.prol ], [ %xtraiter865, %for.body6.i362.prol.preheader ]
  %403 = add nsw i64 %indvars.iv460.prol, %394, !dbg !500
  %arrayidx.i359.prol = getelementptr inbounds float* %384, i64 %403, !dbg !500
  store float 1.000000e+00, float* %arrayidx.i359.prol, align 4, !dbg !500, !tbaa !310
  %indvars.iv.next461.prol = add nuw nsw i64 %indvars.iv460.prol, 1, !dbg !502
  %lftr.wideiv463.prol = trunc i64 %indvars.iv460.prol to i32, !dbg !502
  %exitcond464.prol = icmp eq i32 %lftr.wideiv463.prol, %385, !dbg !502
  %prol.iter869.sub = sub i32 %prol.iter869, 1, !dbg !502
  %prol.iter869.cmp = icmp ne i32 %prol.iter869.sub, 0, !dbg !502
  br i1 %prol.iter869.cmp, label %for.body6.i362.prol, label %for.body6.i362.preheader.split.loopexit, !llvm.loop !504

for.body6.i362.preheader.split.loopexit:          ; preds = %for.body6.i362.prol
  %indvars.iv460.unr.ph = phi i64 [ %indvars.iv.next461.prol, %for.body6.i362.prol ]
  br label %for.body6.i362.preheader.split

for.body6.i362.preheader.split:                   ; preds = %for.body6.i362.preheader.split.loopexit, %for.body6.i362.preheader
  %indvars.iv460.unr = phi i64 [ %resume.val754, %for.body6.i362.preheader ], [ %indvars.iv460.unr.ph, %for.body6.i362.preheader.split.loopexit ]
  %404 = icmp ult i32 %402, 4
  br i1 %404, label %for.inc20.i365.loopexit, label %for.body6.i362.preheader.split.split

for.body6.i362.preheader.split.split:             ; preds = %for.body6.i362.preheader.split
  br label %for.body6.i362, !dbg !500

for.body6.i362:                                   ; preds = %for.body6.i362, %for.body6.i362.preheader.split.split
  %indvars.iv460 = phi i64 [ %indvars.iv460.unr, %for.body6.i362.preheader.split.split ], [ %indvars.iv.next461.3, %for.body6.i362 ]
  %405 = add nsw i64 %indvars.iv460, %394, !dbg !500
  %arrayidx.i359 = getelementptr inbounds float* %384, i64 %405, !dbg !500
  store float 1.000000e+00, float* %arrayidx.i359, align 4, !dbg !500, !tbaa !310
  %indvars.iv.next461 = add nuw nsw i64 %indvars.iv460, 1, !dbg !502
  %lftr.wideiv463 = trunc i64 %indvars.iv460 to i32, !dbg !502
  %406 = add nsw i64 %indvars.iv.next461, %394, !dbg !500
  %arrayidx.i359.1 = getelementptr inbounds float* %384, i64 %406, !dbg !500
  store float 1.000000e+00, float* %arrayidx.i359.1, align 4, !dbg !500, !tbaa !310
  %indvars.iv.next461.1 = add nuw nsw i64 %indvars.iv.next461, 1, !dbg !502
  %lftr.wideiv463.1 = trunc i64 %indvars.iv.next461 to i32, !dbg !502
  %407 = add nsw i64 %indvars.iv.next461.1, %394, !dbg !500
  %arrayidx.i359.2 = getelementptr inbounds float* %384, i64 %407, !dbg !500
  store float 1.000000e+00, float* %arrayidx.i359.2, align 4, !dbg !500, !tbaa !310
  %indvars.iv.next461.2 = add nuw nsw i64 %indvars.iv.next461.1, 1, !dbg !502
  %lftr.wideiv463.2 = trunc i64 %indvars.iv.next461.1 to i32, !dbg !502
  %408 = add nsw i64 %indvars.iv.next461.2, %394, !dbg !500
  %arrayidx.i359.3 = getelementptr inbounds float* %384, i64 %408, !dbg !500
  store float 1.000000e+00, float* %arrayidx.i359.3, align 4, !dbg !500, !tbaa !310
  %indvars.iv.next461.3 = add nuw nsw i64 %indvars.iv.next461.2, 1, !dbg !502
  %lftr.wideiv463.3 = trunc i64 %indvars.iv.next461.2 to i32, !dbg !502
  %exitcond464.3 = icmp eq i32 %lftr.wideiv463.3, %385, !dbg !502
  br i1 %exitcond464.3, label %for.inc20.i365.loopexit.unr-lcssa, label %for.body6.i362, !dbg !502, !llvm.loop !505

for.inc20.i365.loopexit.unr-lcssa:                ; preds = %for.body6.i362
  br label %for.inc20.i365.loopexit

for.inc20.i365.loopexit:                          ; preds = %for.body6.i362.preheader.split, %for.inc20.i365.loopexit.unr-lcssa
  br label %for.inc20.i365

for.inc20.i365:                                   ; preds = %for.inc20.i365.loopexit, %middle.block745, %for.cond4.preheader.i351
  %indvars.iv.next466 = add nuw nsw i64 %indvars.iv465, 1, !dbg !501
  %exitcond468 = icmp eq i32 %393, %386, !dbg !501
  br i1 %exitcond468, label %for.inc23.i368.loopexit, label %for.cond4.preheader.i351, !dbg !501

for.inc23.i368.loopexit:                          ; preds = %for.inc20.i365
  br label %for.inc23.i368

for.inc23.i368:                                   ; preds = %for.inc23.i368.loopexit, %for.cond1.preheader.i347
  %inc24.i366 = add nuw nsw i32 %i.049.i346, 1, !dbg !506
  tail call void @llvm.dbg.value(metadata i32 %inc24.i366, i64 0, metadata !492, metadata !152), !dbg !493
  %exitcond469 = icmp eq i32 %i.049.i346, %387, !dbg !496
  br i1 %exitcond469, label %for.cond1.preheader.i319.preheader, label %for.cond1.preheader.i347, !dbg !496

for.cond1.preheader.i319.preheader:               ; preds = %for.inc23.i368
  %409 = lshr i64 %380, 32, !dbg !507
  %410 = add nuw nsw i64 %409, 4294967295, !dbg !507
  %411 = and i64 %410, 4294967295
  %412 = add nuw nsw i64 %411, 1, !dbg !507
  %413 = trunc i64 %409 to i32
  br label %for.cond1.preheader.i319, !dbg !507

for.cond1.preheader.i319:                         ; preds = %for.cond1.preheader.i319.preheader, %for.inc23.i341
  %i.049.i318 = phi i32 [ %inc24.i339, %for.inc23.i341 ], [ 0, %for.cond1.preheader.i319.preheader ], !dbg !508
  br i1 %cmp246.i344, label %for.cond4.preheader.lr.ph.i321, label %for.inc23.i341, !dbg !507

for.cond4.preheader.lr.ph.i321:                   ; preds = %for.cond1.preheader.i319
  %mul942.i324 = add i32 %i.049.i318, %379, !dbg !509
  %mul1141.i325 = mul i32 %mul942.i324, %381, !dbg !509
  br label %for.cond4.preheader.i323, !dbg !507

for.cond4.preheader.i323:                         ; preds = %for.inc20.i338, %for.cond4.preheader.lr.ph.i321
  %indvars.iv455 = phi i64 [ %indvars.iv.next456, %for.inc20.i338 ], [ 0, %for.cond4.preheader.lr.ph.i321 ]
  %414 = trunc i64 %indvars.iv455 to i32, !dbg !509
  br i1 %cmp544.i348, label %for.body6.lr.ph.i327, label %for.inc20.i338, !dbg !510

for.body6.lr.ph.i327:                             ; preds = %for.cond4.preheader.i323
  %add43.i326 = add i32 %414, %mul1141.i325, !dbg !509
  %add18.i329 = mul nsw i32 %add43.i326, %383, !dbg !509
  %415 = sext i32 %add18.i329 to i64, !dbg !510
  %end.idx779 = add nuw nsw i64 %411, 1, !dbg !510
  %n.mod.vf780 = and i64 %409, 7, !dbg !510
  %n.vec781 = sub nsw i64 %412, %n.mod.vf780, !dbg !510
  %cmp.zero783 = icmp eq i64 %412, %n.mod.vf780, !dbg !510
  br i1 %cmp.zero783, label %middle.block776, label %vector.body775.preheader

vector.body775.preheader:                         ; preds = %for.body6.lr.ph.i327
  br label %vector.body775, !dbg !509

vector.body775:                                   ; preds = %vector.body775.preheader, %vector.body775
  %index778 = phi i64 [ %index.next790, %vector.body775 ], [ 0, %vector.body775.preheader ], !dbg !510
  %416 = add i64 %index778, %415, !dbg !509
  %417 = getelementptr inbounds float* %384, i64 %416, !dbg !509
  %418 = bitcast float* %417 to <4 x float>*, !dbg !509
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %418, align 4, !dbg !509, !tbaa !310
  %.sum842 = add i64 %416, 4, !dbg !509
  %419 = getelementptr float* %384, i64 %.sum842, !dbg !509
  %420 = bitcast float* %419 to <4 x float>*, !dbg !509
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %420, align 4, !dbg !509, !tbaa !310
  %index.next790 = add i64 %index778, 8, !dbg !510
  %421 = icmp eq i64 %index.next790, %n.vec781, !dbg !510
  br i1 %421, label %middle.block776.loopexit, label %vector.body775, !dbg !510, !llvm.loop !511

middle.block776.loopexit:                         ; preds = %vector.body775
  br label %middle.block776

middle.block776:                                  ; preds = %middle.block776.loopexit, %for.body6.lr.ph.i327
  %resume.val785 = phi i64 [ 0, %for.body6.lr.ph.i327 ], [ %n.vec781, %middle.block776.loopexit ]
  %cmp.n789 = icmp eq i64 %end.idx779, %resume.val785
  br i1 %cmp.n789, label %for.inc20.i338, label %for.body6.i335.preheader

for.body6.i335.preheader:                         ; preds = %middle.block776
  %422 = trunc i64 %resume.val785 to i32
  %423 = sub i32 %413, %422
  %xtraiter860 = and i32 %423, 3
  %lcmp.mod861 = icmp ne i32 %xtraiter860, 0
  %lcmp.overflow862 = icmp eq i32 %423, 0
  %lcmp.or863 = or i1 %lcmp.overflow862, %lcmp.mod861
  br i1 %lcmp.or863, label %for.body6.i335.prol.preheader, label %for.body6.i335.preheader.split

for.body6.i335.prol.preheader:                    ; preds = %for.body6.i335.preheader
  br label %for.body6.i335.prol, !dbg !509

for.body6.i335.prol:                              ; preds = %for.body6.i335.prol.preheader, %for.body6.i335.prol
  %indvars.iv450.prol = phi i64 [ %indvars.iv.next451.prol, %for.body6.i335.prol ], [ %resume.val785, %for.body6.i335.prol.preheader ]
  %prol.iter864 = phi i32 [ %prol.iter864.sub, %for.body6.i335.prol ], [ %xtraiter860, %for.body6.i335.prol.preheader ]
  %424 = add nsw i64 %indvars.iv450.prol, %415, !dbg !509
  %arrayidx.i332.prol = getelementptr inbounds float* %384, i64 %424, !dbg !509
  store float 1.000000e+00, float* %arrayidx.i332.prol, align 4, !dbg !509, !tbaa !310
  %indvars.iv.next451.prol = add nuw nsw i64 %indvars.iv450.prol, 1, !dbg !510
  %lftr.wideiv453.prol = trunc i64 %indvars.iv450.prol to i32, !dbg !510
  %exitcond454.prol = icmp eq i32 %lftr.wideiv453.prol, %385, !dbg !510
  %prol.iter864.sub = sub i32 %prol.iter864, 1, !dbg !510
  %prol.iter864.cmp = icmp ne i32 %prol.iter864.sub, 0, !dbg !510
  br i1 %prol.iter864.cmp, label %for.body6.i335.prol, label %for.body6.i335.preheader.split.loopexit, !llvm.loop !512

for.body6.i335.preheader.split.loopexit:          ; preds = %for.body6.i335.prol
  %indvars.iv450.unr.ph = phi i64 [ %indvars.iv.next451.prol, %for.body6.i335.prol ]
  br label %for.body6.i335.preheader.split

for.body6.i335.preheader.split:                   ; preds = %for.body6.i335.preheader.split.loopexit, %for.body6.i335.preheader
  %indvars.iv450.unr = phi i64 [ %resume.val785, %for.body6.i335.preheader ], [ %indvars.iv450.unr.ph, %for.body6.i335.preheader.split.loopexit ]
  %425 = icmp ult i32 %423, 4
  br i1 %425, label %for.inc20.i338.loopexit, label %for.body6.i335.preheader.split.split

for.body6.i335.preheader.split.split:             ; preds = %for.body6.i335.preheader.split
  br label %for.body6.i335, !dbg !509

for.body6.i335:                                   ; preds = %for.body6.i335, %for.body6.i335.preheader.split.split
  %indvars.iv450 = phi i64 [ %indvars.iv450.unr, %for.body6.i335.preheader.split.split ], [ %indvars.iv.next451.3, %for.body6.i335 ]
  %426 = add nsw i64 %indvars.iv450, %415, !dbg !509
  %arrayidx.i332 = getelementptr inbounds float* %384, i64 %426, !dbg !509
  store float 1.000000e+00, float* %arrayidx.i332, align 4, !dbg !509, !tbaa !310
  %indvars.iv.next451 = add nuw nsw i64 %indvars.iv450, 1, !dbg !510
  %lftr.wideiv453 = trunc i64 %indvars.iv450 to i32, !dbg !510
  %427 = add nsw i64 %indvars.iv.next451, %415, !dbg !509
  %arrayidx.i332.1 = getelementptr inbounds float* %384, i64 %427, !dbg !509
  store float 1.000000e+00, float* %arrayidx.i332.1, align 4, !dbg !509, !tbaa !310
  %indvars.iv.next451.1 = add nuw nsw i64 %indvars.iv.next451, 1, !dbg !510
  %lftr.wideiv453.1 = trunc i64 %indvars.iv.next451 to i32, !dbg !510
  %428 = add nsw i64 %indvars.iv.next451.1, %415, !dbg !509
  %arrayidx.i332.2 = getelementptr inbounds float* %384, i64 %428, !dbg !509
  store float 1.000000e+00, float* %arrayidx.i332.2, align 4, !dbg !509, !tbaa !310
  %indvars.iv.next451.2 = add nuw nsw i64 %indvars.iv.next451.1, 1, !dbg !510
  %lftr.wideiv453.2 = trunc i64 %indvars.iv.next451.1 to i32, !dbg !510
  %429 = add nsw i64 %indvars.iv.next451.2, %415, !dbg !509
  %arrayidx.i332.3 = getelementptr inbounds float* %384, i64 %429, !dbg !509
  store float 1.000000e+00, float* %arrayidx.i332.3, align 4, !dbg !509, !tbaa !310
  %indvars.iv.next451.3 = add nuw nsw i64 %indvars.iv.next451.2, 1, !dbg !510
  %lftr.wideiv453.3 = trunc i64 %indvars.iv.next451.2 to i32, !dbg !510
  %exitcond454.3 = icmp eq i32 %lftr.wideiv453.3, %385, !dbg !510
  br i1 %exitcond454.3, label %for.inc20.i338.loopexit.unr-lcssa, label %for.body6.i335, !dbg !510, !llvm.loop !513

for.inc20.i338.loopexit.unr-lcssa:                ; preds = %for.body6.i335
  br label %for.inc20.i338.loopexit

for.inc20.i338.loopexit:                          ; preds = %for.body6.i335.preheader.split, %for.inc20.i338.loopexit.unr-lcssa
  br label %for.inc20.i338

for.inc20.i338:                                   ; preds = %for.inc20.i338.loopexit, %middle.block776, %for.cond4.preheader.i323
  %indvars.iv.next456 = add nuw nsw i64 %indvars.iv455, 1, !dbg !507
  %exitcond458 = icmp eq i32 %414, %386, !dbg !507
  br i1 %exitcond458, label %for.inc23.i341.loopexit, label %for.cond4.preheader.i323, !dbg !507

for.inc23.i341.loopexit:                          ; preds = %for.inc20.i338
  br label %for.inc23.i341

for.inc23.i341:                                   ; preds = %for.inc23.i341.loopexit, %for.cond1.preheader.i319
  %inc24.i339 = add nuw nsw i32 %i.049.i318, 1, !dbg !514
  tail call void @llvm.dbg.value(metadata i32 %inc24.i339, i64 0, metadata !515, metadata !152), !dbg !516
  %exitcond459 = icmp eq i32 %i.049.i318, %387, !dbg !517
  br i1 %exitcond459, label %for.cond1.preheader.lr.ph.i288, label %for.cond1.preheader.i319, !dbg !517

for.cond1.preheader.lr.ph.i288:                   ; preds = %for.inc23.i341
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !518, metadata !152), !dbg !520
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !521, metadata !152), !dbg !522
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !523, metadata !152), !dbg !524
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !525, metadata !152), !dbg !526
  %mul.i295 = shl i32 %379, 1, !dbg !527
  %430 = lshr i64 %380, 32, !dbg !528
  %431 = add nuw nsw i64 %430, 4294967295, !dbg !528
  %432 = and i64 %431, 4294967295
  %433 = add nuw nsw i64 %432, 1, !dbg !528
  %434 = trunc i64 %430 to i32
  br label %for.cond1.preheader.i290, !dbg !528

for.cond1.preheader.i290:                         ; preds = %for.inc23.i313, %for.cond1.preheader.lr.ph.i288
  %i.049.i289 = phi i32 [ 0, %for.cond1.preheader.lr.ph.i288 ], [ %inc24.i311, %for.inc23.i313 ], !dbg !519
  br i1 %cmp246.i344, label %for.cond4.preheader.lr.ph.i292, label %for.inc23.i313, !dbg !529

for.cond4.preheader.lr.ph.i292:                   ; preds = %for.cond1.preheader.i290
  %mul942.i296 = add i32 %i.049.i289, %mul.i295, !dbg !527
  %mul1141.i297 = mul i32 %mul942.i296, %381, !dbg !527
  br label %for.cond4.preheader.i294, !dbg !529

for.cond4.preheader.i294:                         ; preds = %for.inc20.i310, %for.cond4.preheader.lr.ph.i292
  %indvars.iv445 = phi i64 [ %indvars.iv.next446, %for.inc20.i310 ], [ 0, %for.cond4.preheader.lr.ph.i292 ]
  %435 = trunc i64 %indvars.iv445 to i32, !dbg !527
  br i1 %cmp544.i348, label %for.body6.lr.ph.i299, label %for.inc20.i310, !dbg !530

for.body6.lr.ph.i299:                             ; preds = %for.cond4.preheader.i294
  %add43.i298 = add i32 %435, %mul1141.i297, !dbg !527
  %add18.i301 = mul nsw i32 %add43.i298, %383, !dbg !527
  %436 = sext i32 %add18.i301 to i64, !dbg !530
  %end.idx810 = add nuw nsw i64 %432, 1, !dbg !530
  %n.mod.vf811 = and i64 %430, 7, !dbg !530
  %n.vec812 = sub nsw i64 %433, %n.mod.vf811, !dbg !530
  %cmp.zero814 = icmp eq i64 %433, %n.mod.vf811, !dbg !530
  br i1 %cmp.zero814, label %middle.block807, label %vector.body806.preheader

vector.body806.preheader:                         ; preds = %for.body6.lr.ph.i299
  br label %vector.body806, !dbg !527

vector.body806:                                   ; preds = %vector.body806.preheader, %vector.body806
  %index809 = phi i64 [ %index.next821, %vector.body806 ], [ 0, %vector.body806.preheader ], !dbg !530
  %437 = add i64 %index809, %436, !dbg !527
  %438 = getelementptr inbounds float* %384, i64 %437, !dbg !527
  %439 = bitcast float* %438 to <4 x float>*, !dbg !527
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %439, align 4, !dbg !527, !tbaa !310
  %.sum839 = add i64 %437, 4, !dbg !527
  %440 = getelementptr float* %384, i64 %.sum839, !dbg !527
  %441 = bitcast float* %440 to <4 x float>*, !dbg !527
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %441, align 4, !dbg !527, !tbaa !310
  %index.next821 = add i64 %index809, 8, !dbg !530
  %442 = icmp eq i64 %index.next821, %n.vec812, !dbg !530
  br i1 %442, label %middle.block807.loopexit, label %vector.body806, !dbg !530, !llvm.loop !531

middle.block807.loopexit:                         ; preds = %vector.body806
  br label %middle.block807

middle.block807:                                  ; preds = %middle.block807.loopexit, %for.body6.lr.ph.i299
  %resume.val816 = phi i64 [ 0, %for.body6.lr.ph.i299 ], [ %n.vec812, %middle.block807.loopexit ]
  %cmp.n820 = icmp eq i64 %end.idx810, %resume.val816
  br i1 %cmp.n820, label %for.inc20.i310, label %for.body6.i307.preheader

for.body6.i307.preheader:                         ; preds = %middle.block807
  %443 = trunc i64 %resume.val816 to i32
  %444 = sub i32 %434, %443
  %xtraiter = and i32 %444, 3
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %444, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body6.i307.prol.preheader, label %for.body6.i307.preheader.split

for.body6.i307.prol.preheader:                    ; preds = %for.body6.i307.preheader
  br label %for.body6.i307.prol, !dbg !527

for.body6.i307.prol:                              ; preds = %for.body6.i307.prol.preheader, %for.body6.i307.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body6.i307.prol ], [ %resume.val816, %for.body6.i307.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body6.i307.prol ], [ %xtraiter, %for.body6.i307.prol.preheader ]
  %445 = add nsw i64 %indvars.iv.prol, %436, !dbg !527
  %arrayidx.i304.prol = getelementptr inbounds float* %384, i64 %445, !dbg !527
  store float 1.000000e+00, float* %arrayidx.i304.prol, align 4, !dbg !527, !tbaa !310
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !530
  %lftr.wideiv.prol = trunc i64 %indvars.iv.prol to i32, !dbg !530
  %exitcond.prol = icmp eq i32 %lftr.wideiv.prol, %385, !dbg !530
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !530
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !530
  br i1 %prol.iter.cmp, label %for.body6.i307.prol, label %for.body6.i307.preheader.split.loopexit, !llvm.loop !532

for.body6.i307.preheader.split.loopexit:          ; preds = %for.body6.i307.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body6.i307.prol ]
  br label %for.body6.i307.preheader.split

for.body6.i307.preheader.split:                   ; preds = %for.body6.i307.preheader.split.loopexit, %for.body6.i307.preheader
  %indvars.iv.unr = phi i64 [ %resume.val816, %for.body6.i307.preheader ], [ %indvars.iv.unr.ph, %for.body6.i307.preheader.split.loopexit ]
  %446 = icmp ult i32 %444, 4
  br i1 %446, label %for.inc20.i310.loopexit, label %for.body6.i307.preheader.split.split

for.body6.i307.preheader.split.split:             ; preds = %for.body6.i307.preheader.split
  br label %for.body6.i307, !dbg !527

for.body6.i307:                                   ; preds = %for.body6.i307, %for.body6.i307.preheader.split.split
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body6.i307.preheader.split.split ], [ %indvars.iv.next.3, %for.body6.i307 ]
  %447 = add nsw i64 %indvars.iv, %436, !dbg !527
  %arrayidx.i304 = getelementptr inbounds float* %384, i64 %447, !dbg !527
  store float 1.000000e+00, float* %arrayidx.i304, align 4, !dbg !527, !tbaa !310
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !530
  %lftr.wideiv = trunc i64 %indvars.iv to i32, !dbg !530
  %448 = add nsw i64 %indvars.iv.next, %436, !dbg !527
  %arrayidx.i304.1 = getelementptr inbounds float* %384, i64 %448, !dbg !527
  store float 1.000000e+00, float* %arrayidx.i304.1, align 4, !dbg !527, !tbaa !310
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1, !dbg !530
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next to i32, !dbg !530
  %449 = add nsw i64 %indvars.iv.next.1, %436, !dbg !527
  %arrayidx.i304.2 = getelementptr inbounds float* %384, i64 %449, !dbg !527
  store float 1.000000e+00, float* %arrayidx.i304.2, align 4, !dbg !527, !tbaa !310
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.next.1, 1, !dbg !530
  %lftr.wideiv.2 = trunc i64 %indvars.iv.next.1 to i32, !dbg !530
  %450 = add nsw i64 %indvars.iv.next.2, %436, !dbg !527
  %arrayidx.i304.3 = getelementptr inbounds float* %384, i64 %450, !dbg !527
  store float 1.000000e+00, float* %arrayidx.i304.3, align 4, !dbg !527, !tbaa !310
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.next.2, 1, !dbg !530
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next.2 to i32, !dbg !530
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %385, !dbg !530
  br i1 %exitcond.3, label %for.inc20.i310.loopexit.unr-lcssa, label %for.body6.i307, !dbg !530, !llvm.loop !533

for.inc20.i310.loopexit.unr-lcssa:                ; preds = %for.body6.i307
  br label %for.inc20.i310.loopexit

for.inc20.i310.loopexit:                          ; preds = %for.body6.i307.preheader.split, %for.inc20.i310.loopexit.unr-lcssa
  br label %for.inc20.i310

for.inc20.i310:                                   ; preds = %for.inc20.i310.loopexit, %middle.block807, %for.cond4.preheader.i294
  %indvars.iv.next446 = add nuw nsw i64 %indvars.iv445, 1, !dbg !529
  %exitcond448 = icmp eq i32 %435, %386, !dbg !529
  br i1 %exitcond448, label %for.inc23.i313.loopexit, label %for.cond4.preheader.i294, !dbg !529

for.inc23.i313.loopexit:                          ; preds = %for.inc20.i310
  br label %for.inc23.i313

for.inc23.i313:                                   ; preds = %for.inc23.i313.loopexit, %for.cond1.preheader.i290
  %inc24.i311 = add nuw nsw i32 %i.049.i289, 1, !dbg !534
  tail call void @llvm.dbg.value(metadata i32 %inc24.i311, i64 0, metadata !525, metadata !152), !dbg !526
  %exitcond449 = icmp eq i32 %i.049.i289, %387, !dbg !528
  br i1 %exitcond449, label %mat_set.exit314.loopexit, label %for.cond1.preheader.i290, !dbg !528

mat_set.exit314.loopexit:                         ; preds = %for.inc23.i313
  br label %mat_set.exit314

mat_set.exit314:                                  ; preds = %mat_set.exit314.loopexit, %mat_set.exit398
  tail call void @llvm.dbg.value(metadata i32 64, i64 0, metadata !23, metadata !152), !dbg !535
  %call16 = tail call float @jacobi(i32 64, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2), !dbg !536
  tail call void @llvm.dbg.value(metadata float %call16, i64 0, metadata !34, metadata !152), !dbg !537
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 64) #6, !dbg !538
  %conv = fpext float %call16 to double, !dbg !539
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), double %conv) #6, !dbg !540
  tail call void @llvm.dbg.value(metadata %struct.Mat* @p, i64 0, metadata !541, metadata !152) #6, !dbg !543
  %451 = load float** getelementptr inbounds (%struct.Mat* @p, i64 0, i32 0), align 8, !dbg !544, !tbaa !190
  %tobool.i227 = icmp eq float* %451, null, !dbg !546
  br i1 %tobool.i227, label %clearMat.exit229, label %if.then.i228, !dbg !546

if.then.i228:                                     ; preds = %mat_set.exit314
  %452 = bitcast float* %451 to i8*, !dbg !547
  tail call void @free(i8* %452) #6, !dbg !548
  br label %clearMat.exit229, !dbg !548

clearMat.exit229:                                 ; preds = %mat_set.exit314, %if.then.i228
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @p to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !549
  tail call void @llvm.dbg.value(metadata %struct.Mat* @bnd, i64 0, metadata !550, metadata !152) #6, !dbg !552
  %453 = load float** getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 0), align 8, !dbg !553, !tbaa !190
  %tobool.i195 = icmp eq float* %453, null, !dbg !554
  br i1 %tobool.i195, label %clearMat.exit197, label %if.then.i196, !dbg !554

if.then.i196:                                     ; preds = %clearMat.exit229
  %454 = bitcast float* %453 to i8*, !dbg !555
  tail call void @free(i8* %454) #6, !dbg !556
  br label %clearMat.exit197, !dbg !556

clearMat.exit197:                                 ; preds = %clearMat.exit229, %if.then.i196
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @bnd to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !557
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk1, i64 0, metadata !558, metadata !152) #6, !dbg !560
  %455 = load float** getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 0), align 8, !dbg !561, !tbaa !190
  %tobool.i165 = icmp eq float* %455, null, !dbg !562
  br i1 %tobool.i165, label %clearMat.exit167, label %if.then.i166, !dbg !562

if.then.i166:                                     ; preds = %clearMat.exit197
  %456 = bitcast float* %455 to i8*, !dbg !563
  tail call void @free(i8* %456) #6, !dbg !564
  br label %clearMat.exit167, !dbg !564

clearMat.exit167:                                 ; preds = %clearMat.exit197, %if.then.i166
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk1 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !565
  tail call void @llvm.dbg.value(metadata %struct.Mat* @wrk2, i64 0, metadata !566, metadata !152) #6, !dbg !568
  %457 = load float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !569, !tbaa !190
  %tobool.i135 = icmp eq float* %457, null, !dbg !570
  br i1 %tobool.i135, label %clearMat.exit137, label %if.then.i136, !dbg !570

if.then.i136:                                     ; preds = %clearMat.exit167
  %458 = bitcast float* %457 to i8*, !dbg !571
  tail call void @free(i8* %458) #6, !dbg !572
  br label %clearMat.exit137, !dbg !572

clearMat.exit137:                                 ; preds = %clearMat.exit167, %if.then.i136
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk2 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !573
  tail call void @llvm.dbg.value(metadata %struct.Mat* @a, i64 0, metadata !574, metadata !152) #6, !dbg !576
  %459 = load float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !577, !tbaa !190
  %tobool.i105 = icmp eq float* %459, null, !dbg !578
  br i1 %tobool.i105, label %clearMat.exit107, label %if.then.i106, !dbg !578

if.then.i106:                                     ; preds = %clearMat.exit137
  %460 = bitcast float* %459 to i8*, !dbg !579
  tail call void @free(i8* %460) #6, !dbg !580
  br label %clearMat.exit107, !dbg !580

clearMat.exit107:                                 ; preds = %clearMat.exit137, %if.then.i106
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @a to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !581
  tail call void @llvm.dbg.value(metadata %struct.Mat* @b, i64 0, metadata !582, metadata !152) #6, !dbg !584
  %461 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !585, !tbaa !190
  %tobool.i75 = icmp eq float* %461, null, !dbg !586
  br i1 %tobool.i75, label %clearMat.exit77, label %if.then.i76, !dbg !586

if.then.i76:                                      ; preds = %clearMat.exit107
  %462 = bitcast float* %461 to i8*, !dbg !587
  tail call void @free(i8* %462) #6, !dbg !588
  br label %clearMat.exit77, !dbg !588

clearMat.exit77:                                  ; preds = %clearMat.exit107, %if.then.i76
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @b to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !589
  tail call void @llvm.dbg.value(metadata %struct.Mat* @c, i64 0, metadata !590, metadata !152) #6, !dbg !592
  %463 = load float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !593, !tbaa !190
  %tobool.i = icmp eq float* %463, null, !dbg !594
  br i1 %tobool.i, label %clearMat.exit, label %if.then.i, !dbg !594

if.then.i:                                        ; preds = %clearMat.exit77
  %464 = bitcast float* %463 to i8*, !dbg !595
  tail call void @free(i8* %464) #6, !dbg !596
  br label %clearMat.exit, !dbg !596

clearMat.exit:                                    ; preds = %clearMat.exit77, %if.then.i
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @c to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !597
  ret i32 0, !dbg !598

for.body6.lr.ph.i383.1:                           ; preds = %for.inc20.i394
  %465 = mul i32 %354, %378, !dbg !482
  %466 = add i32 %368, %465, !dbg !482
  %467 = sext i32 %466 to i64
  %scevgep.1 = getelementptr float* %355, i64 %467
  %scevgep475.1 = bitcast float* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep475.1, i8 0, i64 %363, i32 4, i1 false), !dbg !480
  br label %for.inc20.i394.1

for.inc20.i394.1:                                 ; preds = %for.body6.lr.ph.i383.1, %for.inc20.i394
  %indvars.iv.next477.1 = add nuw nsw i64 %indvars.iv.next477, 1, !dbg !481
  %exitcond479.1 = icmp eq i32 %378, %364, !dbg !481
  br i1 %exitcond479.1, label %for.inc23.i397.loopexit.unr-lcssa, label %for.cond4.preheader.i378, !dbg !481

for.body6.lr.ph.i411.1:                           ; preds = %for.inc20.i422
  %468 = mul i32 %327, %350, !dbg !462
  %469 = add i32 %340, %468, !dbg !462
  %470 = sext i32 %469 to i64
  %scevgep486.1 = getelementptr float* %328, i64 %470
  %scevgep486487.1 = bitcast float* %scevgep486.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep486487.1, i8 0, i64 %335, i32 4, i1 false), !dbg !460
  br label %for.inc20.i422.1

for.inc20.i422.1:                                 ; preds = %for.body6.lr.ph.i411.1, %for.inc20.i422
  %indvars.iv.next489.1 = add nuw nsw i64 %indvars.iv.next489, 1, !dbg !461
  %exitcond491.1 = icmp eq i32 %350, %336, !dbg !461
  br i1 %exitcond491.1, label %for.inc23.i425.loopexit.unr-lcssa, label %for.cond4.preheader.i407, !dbg !461

for.body6.lr.ph.i270.1:                           ; preds = %for.inc20.i281
  %471 = mul i32 %303, %323, !dbg !442
  %472 = add i32 %313, %471, !dbg !442
  %473 = sext i32 %472 to i64
  %scevgep498.1 = getelementptr float* %304, i64 %473
  %scevgep498499.1 = bitcast float* %scevgep498.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep498499.1, i8 0, i64 %309, i32 4, i1 false), !dbg !440
  br label %for.inc20.i281.1

for.inc20.i281.1:                                 ; preds = %for.body6.lr.ph.i270.1, %for.inc20.i281
  %indvars.iv.next501.1 = add nuw nsw i64 %indvars.iv.next501, 1, !dbg !441
  %exitcond503.1 = icmp eq i32 %323, %310, !dbg !441
  br i1 %exitcond503.1, label %for.inc23.i284.loopexit.unr-lcssa, label %for.cond4.preheader.i267, !dbg !441

for.body6.lr.ph.i119.1:                           ; preds = %for.inc20.i130
  %474 = mul i32 %185, %205, !dbg !352
  %475 = add i32 %195, %474, !dbg !352
  %476 = sext i32 %475 to i64
  %scevgep550.1 = getelementptr float* %186, i64 %476
  %scevgep550551.1 = bitcast float* %scevgep550.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep550551.1, i8 0, i64 %191, i32 4, i1 false), !dbg !350
  br label %for.inc20.i130.1

for.inc20.i130.1:                                 ; preds = %for.body6.lr.ph.i119.1, %for.inc20.i130
  %indvars.iv.next553.1 = add nuw nsw i64 %indvars.iv.next553, 1, !dbg !351
  %exitcond555.1 = icmp eq i32 %205, %192, !dbg !351
  br i1 %exitcond555.1, label %for.inc23.i133.loopexit.unr-lcssa, label %for.cond4.preheader.i116, !dbg !351
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* nocapture %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !73, metadata !152), !dbg !599
  tail call void @llvm.dbg.value(metadata i32 %mnums, i64 0, metadata !74, metadata !152), !dbg !600
  tail call void @llvm.dbg.value(metadata i32 %mrows, i64 0, metadata !75, metadata !152), !dbg !601
  tail call void @llvm.dbg.value(metadata i32 %mcols, i64 0, metadata !76, metadata !152), !dbg !602
  tail call void @llvm.dbg.value(metadata i32 %mdeps, i64 0, metadata !77, metadata !152), !dbg !603
  %mnums1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 1, !dbg !604
  store i32 %mnums, i32* %mnums1, align 4, !dbg !604, !tbaa !176
  %mrows2 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !605
  store i32 %mrows, i32* %mrows2, align 4, !dbg !605, !tbaa !183
  %mcols3 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !606
  store i32 %mcols, i32* %mcols3, align 4, !dbg !606, !tbaa !185
  %mdeps4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !607
  store i32 %mdeps, i32* %mdeps4, align 4, !dbg !607, !tbaa !187
  %mul = mul nsw i32 %mrows, %mnums, !dbg !608
  %mul5 = mul nsw i32 %mul, %mcols, !dbg !608
  %mul6 = mul nsw i32 %mul5, %mdeps, !dbg !608
  %conv = sext i32 %mul6 to i64, !dbg !608
  %mul7 = shl nsw i64 %conv, 2, !dbg !608
  %call = tail call noalias i8* @malloc(i64 %mul7) #6, !dbg !609
  %0 = bitcast %struct.Mat* %Mat to i8**, !dbg !610
  store i8* %call, i8** %0, align 8, !dbg !610, !tbaa !190
  %cmp = icmp ne i8* %call, null, !dbg !611
  %cond = zext i1 %cmp to i32, !dbg !612
  ret i32 %cond, !dbg !613
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* nocapture readonly %Mat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !95, metadata !152), !dbg !614
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !152), !dbg !615
  %mrows = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !616
  %0 = load i32* %mrows, align 4, !dbg !616, !tbaa !183
  %cmp56 = icmp sgt i32 %0, 0, !dbg !617
  br i1 %cmp56, label %for.cond1.preheader.lr.ph, label %for.end31, !dbg !618

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %mcols = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !619
  %1 = load i32* %mcols, align 4, !dbg !619, !tbaa !185
  %cmp254 = icmp sgt i32 %1, 0, !dbg !620
  %mdeps = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !621
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !622
  br label %for.cond1.preheader, !dbg !618

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc29
  %i.057 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc30, %for.inc29 ]
  br i1 %cmp254, label %for.cond4.preheader.lr.ph, label %for.inc29, !dbg !623

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %2 = load i32* %mdeps, align 4, !dbg !621, !tbaa !187
  %cmp552 = icmp sgt i32 %2, 0, !dbg !624
  %mul = mul nsw i32 %i.057, %i.057, !dbg !625
  %conv = sitofp i32 %mul to float, !dbg !626
  %3 = lshr i32 %2, 1, !dbg !623
  %4 = mul i32 %3, 2, !dbg !623
  %5 = add i32 %4, -2, !dbg !623
  %6 = lshr i32 %5, 1, !dbg !623
  %7 = add i32 %6, 1, !dbg !623
  br label %for.cond4.preheader, !dbg !623

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc26
  %j.055 = phi i32 [ 0, %for.cond4.preheader.lr.ph ], [ %inc27, %for.inc26 ]
  br i1 %cmp552, label %for.body6.lr.ph, label %for.inc26, !dbg !627

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %sub = add nsw i32 %0, -1, !dbg !628
  %mul10 = mul nsw i32 %sub, %sub, !dbg !629
  %conv11 = sitofp i32 %mul10 to float, !dbg !630
  %div = fdiv float %conv, %conv11, !dbg !626
  %mul19 = mul nsw i32 %1, %i.057, !dbg !622
  %mul2151 = add i32 %mul19, %j.055, !dbg !622
  %8 = load float** %m, align 8, !dbg !622, !tbaa !190
  %backedge.overflow = icmp eq i32 %2, 0
  br i1 %backedge.overflow, label %for.body6.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body6.lr.ph
  %n.vec = and i32 %2, -2, !dbg !631
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !631
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
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !631
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %induction5960.prol = or i32 %index.prol, 1
  %9 = mul nsw i32 %mul2151, %2, !dbg !622
  %10 = mul nsw i32 %mul2151, %2, !dbg !622
  %11 = add nsw i32 %9, %index.prol, !dbg !622
  %12 = add nsw i32 %10, %induction5960.prol, !dbg !622
  %13 = sext i32 %11 to i64, !dbg !622
  %14 = sext i32 %12 to i64, !dbg !622
  %15 = getelementptr inbounds float* %8, i64 %13, !dbg !622
  %16 = getelementptr inbounds float* %8, i64 %14, !dbg !622
  store float %div, float* %15, align 4, !dbg !622, !tbaa !310
  store float %div, float* %16, align 4, !dbg !622, !tbaa !310
  %index.next.prol = add i32 %index.prol, 2, !dbg !631
  %17 = icmp eq i32 %index.next.prol, %n.vec, !dbg !631
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !631
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !631
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !632

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
  %index = phi i32 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !631
  %induction5960 = or i32 %index, 1
  %19 = mul nsw i32 %mul2151, %2, !dbg !622
  %20 = mul nsw i32 %mul2151, %2, !dbg !622
  %21 = add nsw i32 %19, %index, !dbg !622
  %22 = add nsw i32 %20, %induction5960, !dbg !622
  %23 = sext i32 %21 to i64, !dbg !622
  %24 = sext i32 %22 to i64, !dbg !622
  %25 = getelementptr inbounds float* %8, i64 %23, !dbg !622
  %26 = getelementptr inbounds float* %8, i64 %24, !dbg !622
  store float %div, float* %25, align 4, !dbg !622, !tbaa !310
  store float %div, float* %26, align 4, !dbg !622, !tbaa !310
  %index.next = add i32 %index, 2, !dbg !631
  %induction5960.1 = or i32 %index.next, 1
  %27 = mul nsw i32 %mul2151, %2, !dbg !622
  %28 = mul nsw i32 %mul2151, %2, !dbg !622
  %29 = add nsw i32 %27, %index.next, !dbg !622
  %30 = add nsw i32 %28, %induction5960.1, !dbg !622
  %31 = sext i32 %29 to i64, !dbg !622
  %32 = sext i32 %30 to i64, !dbg !622
  %33 = getelementptr inbounds float* %8, i64 %31, !dbg !622
  %34 = getelementptr inbounds float* %8, i64 %32, !dbg !622
  store float %div, float* %33, align 4, !dbg !622, !tbaa !310
  store float %div, float* %34, align 4, !dbg !622, !tbaa !310
  %index.next.1 = add i32 %index.next, 2, !dbg !631
  %35 = icmp eq i32 %index.next.1, %n.vec, !dbg !631
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !631, !llvm.loop !633

middle.block.loopexit.unr-lcssa:                  ; preds = %vector.body
  br label %middle.block.loopexit

middle.block.loopexit:                            ; preds = %vector.body.preheader.split, %middle.block.loopexit.unr-lcssa
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %2, %resume.val
  br i1 %cmp.n, label %for.inc26, label %for.body6.preheader

for.body6.preheader:                              ; preds = %middle.block, %for.body6.lr.ph
  %k.053.ph = phi i32 [ 0, %for.body6.lr.ph ], [ %resume.val, %middle.block ]
  %36 = add i32 %k.053.ph, 1
  %37 = icmp sgt i32 %2, %36
  %smax = select i1 %37, i32 %2, i32 %36
  %38 = sub i32 %smax, %k.053.ph
  %xtraiter61 = and i32 %38, 3
  %lcmp.mod62 = icmp ne i32 %xtraiter61, 0
  %lcmp.overflow63 = icmp eq i32 %38, 0
  %lcmp.or64 = or i1 %lcmp.overflow63, %lcmp.mod62
  br i1 %lcmp.or64, label %for.body6.prol.preheader, label %for.body6.preheader.split

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol, !dbg !622

for.body6.prol:                                   ; preds = %for.body6.prol.preheader, %for.body6.prol
  %k.053.prol = phi i32 [ %inc.prol, %for.body6.prol ], [ %k.053.ph, %for.body6.prol.preheader ]
  %prol.iter65 = phi i32 [ %prol.iter65.sub, %for.body6.prol ], [ %xtraiter61, %for.body6.prol.preheader ]
  %add24.prol = mul nsw i32 %mul2151, %2, !dbg !622
  %add25.prol = add nsw i32 %add24.prol, %k.053.prol, !dbg !622
  %idxprom.prol = sext i32 %add25.prol to i64, !dbg !622
  %arrayidx.prol = getelementptr inbounds float* %8, i64 %idxprom.prol, !dbg !622
  store float %div, float* %arrayidx.prol, align 4, !dbg !622, !tbaa !310
  %inc.prol = add nuw nsw i32 %k.053.prol, 1, !dbg !631
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !98, metadata !152), !dbg !634
  %cmp5.prol = icmp slt i32 %inc.prol, %2, !dbg !624
  %prol.iter65.sub = sub i32 %prol.iter65, 1, !dbg !627
  %prol.iter65.cmp = icmp ne i32 %prol.iter65.sub, 0, !dbg !627
  br i1 %prol.iter65.cmp, label %for.body6.prol, label %for.body6.preheader.split.loopexit, !llvm.loop !635

for.body6.preheader.split.loopexit:               ; preds = %for.body6.prol
  %k.053.unr.ph = phi i32 [ %inc.prol, %for.body6.prol ]
  br label %for.body6.preheader.split

for.body6.preheader.split:                        ; preds = %for.body6.preheader.split.loopexit, %for.body6.preheader
  %k.053.unr = phi i32 [ %k.053.ph, %for.body6.preheader ], [ %k.053.unr.ph, %for.body6.preheader.split.loopexit ]
  %39 = icmp ult i32 %38, 4
  br i1 %39, label %for.inc26.loopexit, label %for.body6.preheader.split.split

for.body6.preheader.split.split:                  ; preds = %for.body6.preheader.split
  br label %for.body6, !dbg !622

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.split.split
  %k.053 = phi i32 [ %k.053.unr, %for.body6.preheader.split.split ], [ %inc.3, %for.body6 ]
  %add24 = mul nsw i32 %mul2151, %2, !dbg !622
  %add25 = add nsw i32 %add24, %k.053, !dbg !622
  %idxprom = sext i32 %add25 to i64, !dbg !622
  %arrayidx = getelementptr inbounds float* %8, i64 %idxprom, !dbg !622
  store float %div, float* %arrayidx, align 4, !dbg !622, !tbaa !310
  %inc = add nuw nsw i32 %k.053, 1, !dbg !631
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !98, metadata !152), !dbg !634
  %add24.1 = mul nsw i32 %mul2151, %2, !dbg !622
  %add25.1 = add nsw i32 %add24.1, %inc, !dbg !622
  %idxprom.1 = sext i32 %add25.1 to i64, !dbg !622
  %arrayidx.1 = getelementptr inbounds float* %8, i64 %idxprom.1, !dbg !622
  store float %div, float* %arrayidx.1, align 4, !dbg !622, !tbaa !310
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !631
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !98, metadata !152), !dbg !634
  %add24.2 = mul nsw i32 %mul2151, %2, !dbg !622
  %add25.2 = add nsw i32 %add24.2, %inc.1, !dbg !622
  %idxprom.2 = sext i32 %add25.2 to i64, !dbg !622
  %arrayidx.2 = getelementptr inbounds float* %8, i64 %idxprom.2, !dbg !622
  store float %div, float* %arrayidx.2, align 4, !dbg !622, !tbaa !310
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !631
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !98, metadata !152), !dbg !634
  %add24.3 = mul nsw i32 %mul2151, %2, !dbg !622
  %add25.3 = add nsw i32 %add24.3, %inc.2, !dbg !622
  %idxprom.3 = sext i32 %add25.3 to i64, !dbg !622
  %arrayidx.3 = getelementptr inbounds float* %8, i64 %idxprom.3, !dbg !622
  store float %div, float* %arrayidx.3, align 4, !dbg !622, !tbaa !310
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !631
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !98, metadata !152), !dbg !634
  %cmp5.3 = icmp slt i32 %inc.3, %2, !dbg !624
  br i1 %cmp5.3, label %for.body6, label %for.inc26.loopexit.unr-lcssa, !dbg !627, !llvm.loop !636

for.inc26.loopexit.unr-lcssa:                     ; preds = %for.body6
  br label %for.inc26.loopexit

for.inc26.loopexit:                               ; preds = %for.body6.preheader.split, %for.inc26.loopexit.unr-lcssa
  br label %for.inc26

for.inc26:                                        ; preds = %for.inc26.loopexit, %middle.block, %for.cond4.preheader
  %inc27 = add nuw nsw i32 %j.055, 1, !dbg !637
  tail call void @llvm.dbg.value(metadata i32 %inc27, i64 0, metadata !97, metadata !152), !dbg !638
  %cmp2 = icmp slt i32 %inc27, %1, !dbg !620
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc29.loopexit, !dbg !623

for.inc29.loopexit:                               ; preds = %for.inc26
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit, %for.cond1.preheader
  %inc30 = add nuw nsw i32 %i.057, 1, !dbg !639
  tail call void @llvm.dbg.value(metadata i32 %inc30, i64 0, metadata !96, metadata !152), !dbg !615
  %cmp = icmp slt i32 %inc30, %0, !dbg !617
  br i1 %cmp, label %for.cond1.preheader, label %for.end31.loopexit, !dbg !618

for.end31.loopexit:                               ; preds = %for.inc29
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %entry
  ret void, !dbg !640
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* nocapture readonly %Mat, i32 %l, float %val) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !87, metadata !152), !dbg !641
  tail call void @llvm.dbg.value(metadata i32 %l, i64 0, metadata !88, metadata !152), !dbg !642
  tail call void @llvm.dbg.value(metadata float %val, i64 0, metadata !89, metadata !152), !dbg !643
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !90, metadata !152), !dbg !644
  %mrows = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !645
  %0 = load i32* %mrows, align 4, !dbg !645, !tbaa !183
  %cmp48 = icmp sgt i32 %0, 0, !dbg !646
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end25, !dbg !647

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %mcols = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !648
  %1 = load i32* %mcols, align 4, !dbg !648, !tbaa !185
  %cmp246 = icmp sgt i32 %1, 0, !dbg !649
  %mdeps = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !650
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !651
  br label %for.cond1.preheader, !dbg !647

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc23
  %i.049 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc24, %for.inc23 ]
  br i1 %cmp246, label %for.cond4.preheader.lr.ph, label %for.inc23, !dbg !652

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %2 = load i32* %mdeps, align 4, !dbg !650, !tbaa !187
  %cmp544 = icmp sgt i32 %2, 0, !dbg !653
  %3 = lshr i32 %2, 1, !dbg !652
  %4 = mul i32 %3, 2, !dbg !652
  %5 = add i32 %4, -2, !dbg !652
  %6 = lshr i32 %5, 1, !dbg !652
  %7 = add i32 %6, 1, !dbg !652
  br label %for.cond4.preheader, !dbg !652

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc20
  %j.047 = phi i32 [ 0, %for.cond4.preheader.lr.ph ], [ %inc21, %for.inc20 ]
  br i1 %cmp544, label %for.body6.lr.ph, label %for.inc20, !dbg !654

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %mul = mul nsw i32 %0, %l, !dbg !651
  %mul942 = add i32 %mul, %i.049, !dbg !651
  %mul1141 = mul i32 %mul942, %1, !dbg !651
  %add43 = add i32 %mul1141, %j.047, !dbg !651
  %8 = load float** %m, align 8, !dbg !651, !tbaa !190
  %backedge.overflow = icmp eq i32 %2, 0
  br i1 %backedge.overflow, label %for.body6.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body6.lr.ph
  %n.vec = and i32 %2, -2, !dbg !655
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !655
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
  %index.prol = phi i32 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !655
  %prol.iter = phi i32 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %induction5152.prol = or i32 %index.prol, 1
  %9 = mul nsw i32 %add43, %2, !dbg !651
  %10 = mul nsw i32 %add43, %2, !dbg !651
  %11 = add nsw i32 %9, %index.prol, !dbg !651
  %12 = add nsw i32 %10, %induction5152.prol, !dbg !651
  %13 = sext i32 %11 to i64, !dbg !651
  %14 = sext i32 %12 to i64, !dbg !651
  %15 = getelementptr inbounds float* %8, i64 %13, !dbg !651
  %16 = getelementptr inbounds float* %8, i64 %14, !dbg !651
  store float %val, float* %15, align 4, !dbg !651, !tbaa !310
  store float %val, float* %16, align 4, !dbg !651, !tbaa !310
  %index.next.prol = add i32 %index.prol, 2, !dbg !655
  %17 = icmp eq i32 %index.next.prol, %n.vec, !dbg !655
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !655
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !655
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !656

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
  %index = phi i32 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !655
  %induction5152 = or i32 %index, 1
  %19 = mul nsw i32 %add43, %2, !dbg !651
  %20 = mul nsw i32 %add43, %2, !dbg !651
  %21 = add nsw i32 %19, %index, !dbg !651
  %22 = add nsw i32 %20, %induction5152, !dbg !651
  %23 = sext i32 %21 to i64, !dbg !651
  %24 = sext i32 %22 to i64, !dbg !651
  %25 = getelementptr inbounds float* %8, i64 %23, !dbg !651
  %26 = getelementptr inbounds float* %8, i64 %24, !dbg !651
  store float %val, float* %25, align 4, !dbg !651, !tbaa !310
  store float %val, float* %26, align 4, !dbg !651, !tbaa !310
  %index.next = add i32 %index, 2, !dbg !655
  %induction5152.1 = or i32 %index.next, 1
  %27 = mul nsw i32 %add43, %2, !dbg !651
  %28 = mul nsw i32 %add43, %2, !dbg !651
  %29 = add nsw i32 %27, %index.next, !dbg !651
  %30 = add nsw i32 %28, %induction5152.1, !dbg !651
  %31 = sext i32 %29 to i64, !dbg !651
  %32 = sext i32 %30 to i64, !dbg !651
  %33 = getelementptr inbounds float* %8, i64 %31, !dbg !651
  %34 = getelementptr inbounds float* %8, i64 %32, !dbg !651
  store float %val, float* %33, align 4, !dbg !651, !tbaa !310
  store float %val, float* %34, align 4, !dbg !651, !tbaa !310
  %index.next.1 = add i32 %index.next, 2, !dbg !655
  %35 = icmp eq i32 %index.next.1, %n.vec, !dbg !655
  br i1 %35, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !655, !llvm.loop !657

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
  br label %for.body6.prol, !dbg !651

for.body6.prol:                                   ; preds = %for.body6.prol.preheader, %for.body6.prol
  %k.045.prol = phi i32 [ %inc.prol, %for.body6.prol ], [ %k.045.ph, %for.body6.prol.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %for.body6.prol ], [ %xtraiter53, %for.body6.prol.preheader ]
  %add18.prol = mul nsw i32 %add43, %2, !dbg !651
  %add19.prol = add nsw i32 %add18.prol, %k.045.prol, !dbg !651
  %idxprom.prol = sext i32 %add19.prol to i64, !dbg !651
  %arrayidx.prol = getelementptr inbounds float* %8, i64 %idxprom.prol, !dbg !651
  store float %val, float* %arrayidx.prol, align 4, !dbg !651, !tbaa !310
  %inc.prol = add nuw nsw i32 %k.045.prol, 1, !dbg !655
  tail call void @llvm.dbg.value(metadata i32 %inc.prol, i64 0, metadata !92, metadata !152), !dbg !658
  %cmp5.prol = icmp slt i32 %inc.prol, %2, !dbg !653
  %prol.iter57.sub = sub i32 %prol.iter57, 1, !dbg !654
  %prol.iter57.cmp = icmp ne i32 %prol.iter57.sub, 0, !dbg !654
  br i1 %prol.iter57.cmp, label %for.body6.prol, label %for.body6.preheader.split.loopexit, !llvm.loop !659

for.body6.preheader.split.loopexit:               ; preds = %for.body6.prol
  %k.045.unr.ph = phi i32 [ %inc.prol, %for.body6.prol ]
  br label %for.body6.preheader.split

for.body6.preheader.split:                        ; preds = %for.body6.preheader.split.loopexit, %for.body6.preheader
  %k.045.unr = phi i32 [ %k.045.ph, %for.body6.preheader ], [ %k.045.unr.ph, %for.body6.preheader.split.loopexit ]
  %39 = icmp ult i32 %38, 4
  br i1 %39, label %for.inc20.loopexit, label %for.body6.preheader.split.split

for.body6.preheader.split.split:                  ; preds = %for.body6.preheader.split
  br label %for.body6, !dbg !651

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.split.split
  %k.045 = phi i32 [ %k.045.unr, %for.body6.preheader.split.split ], [ %inc.3, %for.body6 ]
  %add18 = mul nsw i32 %add43, %2, !dbg !651
  %add19 = add nsw i32 %add18, %k.045, !dbg !651
  %idxprom = sext i32 %add19 to i64, !dbg !651
  %arrayidx = getelementptr inbounds float* %8, i64 %idxprom, !dbg !651
  store float %val, float* %arrayidx, align 4, !dbg !651, !tbaa !310
  %inc = add nuw nsw i32 %k.045, 1, !dbg !655
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !658
  %add18.1 = mul nsw i32 %add43, %2, !dbg !651
  %add19.1 = add nsw i32 %add18.1, %inc, !dbg !651
  %idxprom.1 = sext i32 %add19.1 to i64, !dbg !651
  %arrayidx.1 = getelementptr inbounds float* %8, i64 %idxprom.1, !dbg !651
  store float %val, float* %arrayidx.1, align 4, !dbg !651, !tbaa !310
  %inc.1 = add nuw nsw i32 %inc, 1, !dbg !655
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !658
  %add18.2 = mul nsw i32 %add43, %2, !dbg !651
  %add19.2 = add nsw i32 %add18.2, %inc.1, !dbg !651
  %idxprom.2 = sext i32 %add19.2 to i64, !dbg !651
  %arrayidx.2 = getelementptr inbounds float* %8, i64 %idxprom.2, !dbg !651
  store float %val, float* %arrayidx.2, align 4, !dbg !651, !tbaa !310
  %inc.2 = add nuw nsw i32 %inc.1, 1, !dbg !655
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !658
  %add18.3 = mul nsw i32 %add43, %2, !dbg !651
  %add19.3 = add nsw i32 %add18.3, %inc.2, !dbg !651
  %idxprom.3 = sext i32 %add19.3 to i64, !dbg !651
  %arrayidx.3 = getelementptr inbounds float* %8, i64 %idxprom.3, !dbg !651
  store float %val, float* %arrayidx.3, align 4, !dbg !651, !tbaa !310
  %inc.3 = add nuw nsw i32 %inc.2, 1, !dbg !655
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !92, metadata !152), !dbg !658
  %cmp5.3 = icmp slt i32 %inc.3, %2, !dbg !653
  br i1 %cmp5.3, label %for.body6, label %for.inc20.loopexit.unr-lcssa, !dbg !654, !llvm.loop !660

for.inc20.loopexit.unr-lcssa:                     ; preds = %for.body6
  br label %for.inc20.loopexit

for.inc20.loopexit:                               ; preds = %for.body6.preheader.split, %for.inc20.loopexit.unr-lcssa
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit, %middle.block, %for.cond4.preheader
  %inc21 = add nuw nsw i32 %j.047, 1, !dbg !661
  tail call void @llvm.dbg.value(metadata i32 %inc21, i64 0, metadata !91, metadata !152), !dbg !662
  %cmp2 = icmp slt i32 %inc21, %1, !dbg !649
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc23.loopexit, !dbg !652

for.inc23.loopexit:                               ; preds = %for.inc20
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond1.preheader
  %inc24 = add nuw nsw i32 %i.049, 1, !dbg !663
  tail call void @llvm.dbg.value(metadata i32 %inc24, i64 0, metadata !90, metadata !152), !dbg !644
  %cmp = icmp slt i32 %inc24, %0, !dbg !646
  br i1 %cmp, label %for.cond1.preheader, label %for.end25.loopexit, !dbg !647

for.end25.loopexit:                               ; preds = %for.inc23
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %entry
  ret void, !dbg !664
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* nocapture readonly %a, %struct.Mat* nocapture readonly %b, %struct.Mat* nocapture readonly %c, %struct.Mat* nocapture readonly %p, %struct.Mat* nocapture readonly %bnd, %struct.Mat* nocapture readonly %wrk1, %struct.Mat* nocapture readonly %wrk2) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nn, i64 0, metadata !105, metadata !152), !dbg !665
  tail call void @llvm.dbg.value(metadata %struct.Mat* %a, i64 0, metadata !106, metadata !152), !dbg !666
  tail call void @llvm.dbg.value(metadata %struct.Mat* %b, i64 0, metadata !107, metadata !152), !dbg !667
  tail call void @llvm.dbg.value(metadata %struct.Mat* %c, i64 0, metadata !108, metadata !152), !dbg !668
  tail call void @llvm.dbg.value(metadata %struct.Mat* %p, i64 0, metadata !109, metadata !152), !dbg !669
  tail call void @llvm.dbg.value(metadata %struct.Mat* %bnd, i64 0, metadata !110, metadata !152), !dbg !670
  tail call void @llvm.dbg.value(metadata %struct.Mat* %wrk1, i64 0, metadata !111, metadata !152), !dbg !671
  tail call void @llvm.dbg.value(metadata %struct.Mat* %wrk2, i64 0, metadata !112, metadata !152), !dbg !672
  %mrows = getelementptr inbounds %struct.Mat* %p, i64 0, i32 2, !dbg !673
  %0 = load i32* %mrows, align 4, !dbg !673, !tbaa !183
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !117, metadata !152), !dbg !674
  %mcols = getelementptr inbounds %struct.Mat* %p, i64 0, i32 3, !dbg !675
  %1 = load i32* %mcols, align 4, !dbg !675, !tbaa !185
  tail call void @llvm.dbg.value(metadata i32 %sub1, i64 0, metadata !118, metadata !152), !dbg !676
  %mdeps = getelementptr inbounds %struct.Mat* %p, i64 0, i32 4, !dbg !677
  %2 = load i32* %mdeps, align 4, !dbg !677, !tbaa !187
  tail call void @llvm.dbg.value(metadata i32 %sub2, i64 0, metadata !119, metadata !152), !dbg !678
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !116, metadata !152), !dbg !679
  %cmp1114 = icmp sgt i32 %nn, 0, !dbg !680
  br i1 %cmp1114, label %for.cond3.preheader.lr.ph, label %for.end727, !dbg !683

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %sub2 = add nsw i32 %2, -1, !dbg !677
  %sub1 = add nsw i32 %1, -1, !dbg !675
  %sub = add nsw i32 %0, -1, !dbg !673
  %cmp41102 = icmp sgt i32 %sub, 1, !dbg !684
  %cmp6751109 = icmp sgt i32 %sub1, 1, !dbg !688
  %cmp6781107 = icmp sgt i32 %sub2, 1, !dbg !693
  %mcols682 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 3, !dbg !696
  %mdeps684 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 4, !dbg !696
  %m696 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 0, !dbg !696
  %m714 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 0, !dbg !697
  %mrows12 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 2, !dbg !698
  %mcols13 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 3, !dbg !698
  %mdeps15 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 4, !dbg !698
  %m = getelementptr inbounds %struct.Mat* %a, i64 0, i32 0, !dbg !698
  %mrows123 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 2, !dbg !704
  %mcols125 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 3, !dbg !704
  %mdeps127 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 4, !dbg !704
  %m139 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 0, !dbg !704
  %mrows432 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 2, !dbg !705
  %mcols434 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 3, !dbg !705
  %mdeps436 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 4, !dbg !705
  %m448 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 0, !dbg !705
  %mcols551 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 3, !dbg !706
  %mdeps553 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 4, !dbg !706
  %m565 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 0, !dbg !706
  %mcols608 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 3, !dbg !707
  %mdeps610 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 4, !dbg !707
  %m622 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 0, !dbg !707
  %3 = add i32 %2, -2, !dbg !683
  %4 = add i32 %1, -2, !dbg !683
  %5 = add i32 %0, -2, !dbg !683
  %6 = add i32 %nn, -1, !dbg !683
  %7 = add i32 %2, -3, !dbg !683
  %8 = zext i32 %7 to i64
  %9 = add nuw nsw i64 %8, 1, !dbg !683
  %10 = zext i32 %7 to i64
  %11 = add nuw nsw i64 %10, 1, !dbg !683
  %12 = zext i32 %7 to i64
  %13 = add i64 %12, 1, !dbg !683
  %14 = lshr i64 %13, 3, !dbg !683
  %15 = mul i64 %14, 8, !dbg !683
  %16 = add i64 %15, -8, !dbg !683
  %17 = lshr i64 %16, 3, !dbg !683
  %18 = add i64 %17, 1, !dbg !683
  %19 = add i32 %2, -1
  br label %for.cond3.preheader, !dbg !683

for.cond3.preheader:                              ; preds = %for.inc725, %for.cond3.preheader.lr.ph
  %n.01115 = phi i32 [ 0, %for.cond3.preheader.lr.ph ], [ %inc726, %for.inc725 ]
  br i1 %cmp41102, label %for.cond6.preheader.preheader, label %for.inc725, !dbg !708

for.cond6.preheader.preheader:                    ; preds = %for.cond3.preheader
  br label %for.cond6.preheader, !dbg !709

for.cond671.preheader:                            ; preds = %for.inc668
  %gosa.2.lcssa.lcssa = phi float [ %gosa.2.lcssa, %for.inc668 ]
  br i1 %cmp41102, label %for.cond674.preheader.preheader, label %for.inc725, !dbg !710

for.cond674.preheader.preheader:                  ; preds = %for.cond671.preheader
  br label %for.cond674.preheader, !dbg !711

for.cond6.preheader:                              ; preds = %for.cond6.preheader.preheader, %for.inc668
  %i.01104 = phi i32 [ %add31, %for.inc668 ], [ 1, %for.cond6.preheader.preheader ]
  %gosa.11103 = phi float [ %gosa.2.lcssa, %for.inc668 ], [ 0.000000e+00, %for.cond6.preheader.preheader ]
  %add31 = add nuw nsw i32 %i.01104, 1, !dbg !709
  br i1 %cmp6751109, label %for.cond9.preheader.lr.ph, label %for.inc668, !dbg !712

for.cond9.preheader.lr.ph:                        ; preds = %for.cond6.preheader
  %sub188 = add nsw i32 %i.01104, -1, !dbg !713
  br label %for.cond9.preheader, !dbg !712

for.cond9.preheader:                              ; preds = %for.inc665, %for.cond9.preheader.lr.ph
  %j.01100 = phi i32 [ 1, %for.cond9.preheader.lr.ph ], [ %inc666.pre-phi, %for.inc665 ]
  %gosa.21099 = phi float [ %gosa.11103, %for.cond9.preheader.lr.ph ], [ %gosa.3.lcssa, %for.inc665 ]
  br i1 %cmp6781107, label %for.body11.lr.ph, label %for.cond9.preheader.for.inc665_crit_edge, !dbg !714

for.cond9.preheader.for.inc665_crit_edge:         ; preds = %for.cond9.preheader
  %inc666.pre = add nuw nsw i32 %j.01100, 1, !dbg !715
  br label %for.inc665, !dbg !714

for.body11.lr.ph:                                 ; preds = %for.cond9.preheader
  %20 = load i32* %mrows12, align 4, !dbg !698, !tbaa !183
  %21 = load i32* %mcols13, align 4, !dbg !698, !tbaa !185
  %22 = load i32* %mdeps15, align 4, !dbg !698, !tbaa !187
  %mul18 = mul nsw i32 %21, %i.01104, !dbg !698
  %mul20 = mul nsw i32 %mul18, %22, !dbg !698
  %mul22 = mul nsw i32 %22, %j.01100, !dbg !698
  %23 = load float** %m, align 8, !dbg !698, !tbaa !190
  %24 = load i32* %mcols, align 4, !dbg !709, !tbaa !185
  %25 = load i32* %mdeps, align 4, !dbg !709, !tbaa !187
  %mul33 = mul nsw i32 %24, %add31, !dbg !709
  %mul35 = mul nsw i32 %mul33, %25, !dbg !709
  %mul38 = mul nsw i32 %25, %j.01100, !dbg !709
  %add39 = add nsw i32 %mul35, %mul38, !dbg !709
  %26 = load float** %m714, align 8, !dbg !709, !tbaa !190
  %mul48 = mul nsw i32 %21, %20, !dbg !716
  %mul50 = mul nsw i32 %mul48, %22, !dbg !716
  %mul70 = mul nsw i32 %24, %i.01104, !dbg !717
  %mul72 = mul nsw i32 %mul70, %25, !dbg !717
  %add74 = add nuw nsw i32 %j.01100, 1, !dbg !717
  %mul76 = mul nsw i32 %25, %add74, !dbg !717
  %add77 = add nsw i32 %mul72, %mul76, !dbg !717
  %mul85 = shl i32 %20, 1, !dbg !718
  %mul87 = mul nsw i32 %mul85, %21, !dbg !718
  %mul89 = mul nsw i32 %mul87, %22, !dbg !718
  %add115 = add nsw i32 %mul72, %mul38, !dbg !719
  %27 = load i32* %mrows123, align 4, !dbg !704, !tbaa !183
  %28 = load i32* %mcols125, align 4, !dbg !704, !tbaa !185
  %29 = load i32* %mdeps127, align 4, !dbg !704, !tbaa !187
  %mul130 = mul nsw i32 %28, %i.01104, !dbg !704
  %mul132 = mul nsw i32 %mul130, %29, !dbg !704
  %mul135 = mul nsw i32 %29, %j.01100, !dbg !704
  %30 = load float** %m139, align 8, !dbg !704, !tbaa !190
  %sub173 = add nsw i32 %j.01100, -1, !dbg !720
  %mul175 = mul nsw i32 %25, %sub173, !dbg !720
  %mul190 = mul nsw i32 %24, %sub188, !dbg !713
  %mul192 = mul nsw i32 %mul190, %25, !dbg !713
  %mul229 = mul nsw i32 %28, %27, !dbg !721
  %mul231 = mul nsw i32 %mul229, %29, !dbg !721
  %add278 = add nsw i32 %mul72, %mul175, !dbg !722
  %mul330 = shl i32 %27, 1, !dbg !723
  %mul332 = mul nsw i32 %mul330, %28, !dbg !723
  %mul334 = mul nsw i32 %mul332, %29, !dbg !723
  %add381 = add nsw i32 %mul192, %mul38, !dbg !724
  %31 = load i32* %mrows432, align 4, !dbg !705, !tbaa !183
  %32 = load i32* %mcols434, align 4, !dbg !705, !tbaa !185
  %33 = load i32* %mdeps436, align 4, !dbg !705, !tbaa !187
  %mul439 = mul nsw i32 %32, %i.01104, !dbg !705
  %mul441 = mul nsw i32 %mul439, %33, !dbg !705
  %mul444 = mul nsw i32 %33, %j.01100, !dbg !705
  %34 = load float** %m448, align 8, !dbg !705, !tbaa !190
  %mul474 = mul nsw i32 %32, %31, !dbg !725
  %mul476 = mul nsw i32 %mul474, %33, !dbg !725
  %mul511 = shl i32 %31, 1, !dbg !726
  %mul513 = mul nsw i32 %mul511, %32, !dbg !726
  %mul515 = mul nsw i32 %mul513, %33, !dbg !726
  %35 = load i32* %mcols551, align 4, !dbg !706, !tbaa !185
  %36 = load i32* %mdeps553, align 4, !dbg !706, !tbaa !187
  %mul556 = mul nsw i32 %35, %i.01104, !dbg !706
  %mul5581092 = add i32 %mul556, %j.01100, !dbg !706
  %add562 = mul nsw i32 %mul5581092, %36, !dbg !706
  %37 = load float** %m565, align 8, !dbg !706, !tbaa !190
  %mul569 = mul nsw i32 %20, 3, !dbg !727
  %mul571 = mul nsw i32 %mul569, %21, !dbg !727
  %mul573 = mul nsw i32 %mul571, %22, !dbg !727
  %38 = load i32* %mcols608, align 4, !dbg !707, !tbaa !185
  %39 = load i32* %mdeps610, align 4, !dbg !707, !tbaa !187
  %mul613 = mul nsw i32 %38, %i.01104, !dbg !707
  %mul6151093 = add i32 %mul613, %j.01100, !dbg !707
  %add619 = mul nsw i32 %mul6151093, %39, !dbg !707
  %40 = load float** %m622, align 8, !dbg !707, !tbaa !190
  %41 = load i32* %mcols682, align 4, !dbg !728, !tbaa !185
  %42 = load i32* %mdeps684, align 4, !dbg !728, !tbaa !187
  %mul654 = mul nsw i32 %41, %i.01104, !dbg !728
  %mul6561094 = add i32 %mul654, %j.01100, !dbg !728
  %add660 = mul nsw i32 %mul6561094, %42, !dbg !728
  %43 = load float** %m696, align 8, !dbg !728, !tbaa !190
  %44 = sext i32 %add660 to i64, !dbg !714
  %45 = sext i32 %add619 to i64, !dbg !714
  %46 = sext i32 %add115 to i64, !dbg !714
  %47 = sext i32 %add562 to i64, !dbg !714
  %48 = sext i32 %add278 to i64, !dbg !714
  %49 = sext i32 %add381 to i64, !dbg !714
  %50 = sext i32 %add77 to i64, !dbg !714
  %51 = sext i32 %add39 to i64, !dbg !714
  br label %for.body11, !dbg !714

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph
  %indvars.iv = phi i64 [ 1, %for.body11.lr.ph ], [ %indvars.iv.next, %for.body11 ]
  %gosa.31097 = phi float [ %gosa.21099, %for.body11.lr.ph ], [ %add626, %for.body11 ]
  %52 = trunc i64 %indvars.iv to i32, !dbg !698
  %add23 = add i32 %mul22, %52, !dbg !698
  %add24 = add i32 %add23, %mul20, !dbg !698
  %idxprom = sext i32 %add24 to i64, !dbg !698
  %arrayidx = getelementptr inbounds float* %23, i64 %idxprom, !dbg !698
  %53 = load float* %arrayidx, align 4, !dbg !698, !tbaa !310
  %54 = add nsw i64 %51, %indvars.iv, !dbg !709
  %arrayidx43 = getelementptr inbounds float* %26, i64 %54, !dbg !709
  %55 = load float* %arrayidx43, align 4, !dbg !709, !tbaa !310
  %mul44 = fmul float %53, %55, !dbg !698
  %add55 = add i32 %mul20, %52, !dbg !716
  %add58 = add i32 %add55, %mul50, !dbg !716
  %add59 = add i32 %add58, %mul22, !dbg !716
  %idxprom60 = sext i32 %add59 to i64, !dbg !716
  %arrayidx62 = getelementptr inbounds float* %23, i64 %idxprom60, !dbg !716
  %56 = load float* %arrayidx62, align 4, !dbg !716, !tbaa !310
  %57 = add nsw i64 %50, %indvars.iv, !dbg !717
  %arrayidx81 = getelementptr inbounds float* %26, i64 %57, !dbg !717
  %58 = load float* %arrayidx81, align 4, !dbg !717, !tbaa !310
  %mul82 = fmul float %56, %58, !dbg !716
  %add83 = fadd float %mul44, %mul82, !dbg !698
  %add97 = add i32 %add55, %mul89, !dbg !718
  %add98 = add i32 %add97, %mul22, !dbg !718
  %idxprom99 = sext i32 %add98 to i64, !dbg !718
  %arrayidx101 = getelementptr inbounds float* %23, i64 %idxprom99, !dbg !718
  %59 = load float* %arrayidx101, align 4, !dbg !718, !tbaa !310
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !714
  %60 = add nsw i64 %46, %indvars.iv.next, !dbg !719
  %arrayidx120 = getelementptr inbounds float* %26, i64 %60, !dbg !719
  %61 = load float* %arrayidx120, align 4, !dbg !719, !tbaa !310
  %mul121 = fmul float %59, %61, !dbg !718
  %add122 = fadd float %add83, %mul121, !dbg !698
  %add136 = add i32 %mul135, %52, !dbg !704
  %add137 = add i32 %add136, %mul132, !dbg !704
  %idxprom138 = sext i32 %add137 to i64, !dbg !704
  %arrayidx140 = getelementptr inbounds float* %30, i64 %idxprom138, !dbg !704
  %62 = load float* %arrayidx140, align 4, !dbg !704, !tbaa !310
  %add156 = add i32 %mul76, %52, !dbg !729
  %add157 = add i32 %add156, %mul35, !dbg !729
  %idxprom158 = sext i32 %add157 to i64, !dbg !729
  %arrayidx160 = getelementptr inbounds float* %26, i64 %idxprom158, !dbg !729
  %63 = load float* %arrayidx160, align 4, !dbg !729, !tbaa !310
  %add176 = add i32 %mul175, %52, !dbg !720
  %add177 = add i32 %add176, %mul35, !dbg !720
  %idxprom178 = sext i32 %add177 to i64, !dbg !720
  %arrayidx180 = getelementptr inbounds float* %26, i64 %idxprom178, !dbg !720
  %64 = load float* %arrayidx180, align 4, !dbg !720, !tbaa !310
  %sub181 = fsub float %63, %64, !dbg !729
  %add198 = add i32 %add156, %mul192, !dbg !713
  %idxprom199 = sext i32 %add198 to i64, !dbg !713
  %arrayidx201 = getelementptr inbounds float* %26, i64 %idxprom199, !dbg !713
  %65 = load float* %arrayidx201, align 4, !dbg !713, !tbaa !310
  %sub202 = fsub float %sub181, %65, !dbg !729
  %add219 = add i32 %add176, %mul192, !dbg !730
  %idxprom220 = sext i32 %add219 to i64, !dbg !730
  %arrayidx222 = getelementptr inbounds float* %26, i64 %idxprom220, !dbg !730
  %66 = load float* %arrayidx222, align 4, !dbg !730, !tbaa !310
  %add223 = fadd float %sub202, %66, !dbg !729
  %mul224 = fmul float %62, %add223, !dbg !704
  %add225 = fadd float %add122, %mul224, !dbg !698
  %add236 = add i32 %mul132, %52, !dbg !721
  %add239 = add i32 %add236, %mul231, !dbg !721
  %add240 = add i32 %add239, %mul135, !dbg !721
  %idxprom241 = sext i32 %add240 to i64, !dbg !721
  %arrayidx243 = getelementptr inbounds float* %30, i64 %idxprom241, !dbg !721
  %67 = load float* %arrayidx243, align 4, !dbg !721, !tbaa !310
  %68 = add nsw i64 %50, %indvars.iv.next, !dbg !731
  %arrayidx263 = getelementptr inbounds float* %26, i64 %68, !dbg !731
  %69 = load float* %arrayidx263, align 4, !dbg !731, !tbaa !310
  %70 = add nsw i64 %48, %indvars.iv.next, !dbg !722
  %arrayidx283 = getelementptr inbounds float* %26, i64 %70, !dbg !722
  %71 = load float* %arrayidx283, align 4, !dbg !722, !tbaa !310
  %sub284 = fsub float %69, %71, !dbg !731
  %72 = add nsw i64 %indvars.iv, -1, !dbg !732
  %73 = add nsw i64 %50, %72, !dbg !732
  %arrayidx304 = getelementptr inbounds float* %26, i64 %73, !dbg !732
  %74 = load float* %arrayidx304, align 4, !dbg !732, !tbaa !310
  %sub305 = fsub float %sub284, %74, !dbg !731
  %75 = add nsw i64 %48, %72, !dbg !733
  %arrayidx325 = getelementptr inbounds float* %26, i64 %75, !dbg !733
  %76 = load float* %arrayidx325, align 4, !dbg !733, !tbaa !310
  %add326 = fadd float %sub305, %76, !dbg !731
  %mul327 = fmul float %67, %add326, !dbg !721
  %add328 = fadd float %add225, %mul327, !dbg !698
  %add342 = add i32 %add236, %mul334, !dbg !723
  %add343 = add i32 %add342, %mul135, !dbg !723
  %idxprom344 = sext i32 %add343 to i64, !dbg !723
  %arrayidx346 = getelementptr inbounds float* %30, i64 %idxprom344, !dbg !723
  %77 = load float* %arrayidx346, align 4, !dbg !723, !tbaa !310
  %78 = add nsw i64 %51, %indvars.iv.next, !dbg !734
  %arrayidx366 = getelementptr inbounds float* %26, i64 %78, !dbg !734
  %79 = load float* %arrayidx366, align 4, !dbg !734, !tbaa !310
  %80 = add nsw i64 %49, %indvars.iv.next, !dbg !724
  %arrayidx386 = getelementptr inbounds float* %26, i64 %80, !dbg !724
  %81 = load float* %arrayidx386, align 4, !dbg !724, !tbaa !310
  %sub387 = fsub float %79, %81, !dbg !734
  %82 = add nsw i64 %51, %72, !dbg !735
  %arrayidx407 = getelementptr inbounds float* %26, i64 %82, !dbg !735
  %83 = load float* %arrayidx407, align 4, !dbg !735, !tbaa !310
  %sub408 = fsub float %sub387, %83, !dbg !734
  %84 = add nsw i64 %49, %72, !dbg !736
  %arrayidx428 = getelementptr inbounds float* %26, i64 %84, !dbg !736
  %85 = load float* %arrayidx428, align 4, !dbg !736, !tbaa !310
  %add429 = fadd float %sub408, %85, !dbg !734
  %mul430 = fmul float %77, %add429, !dbg !723
  %add431 = fadd float %add328, %mul430, !dbg !698
  %add445 = add i32 %mul444, %52, !dbg !705
  %add446 = add i32 %add445, %mul441, !dbg !705
  %idxprom447 = sext i32 %add446 to i64, !dbg !705
  %arrayidx449 = getelementptr inbounds float* %34, i64 %idxprom447, !dbg !705
  %86 = load float* %arrayidx449, align 4, !dbg !705, !tbaa !310
  %87 = add nsw i64 %49, %indvars.iv, !dbg !737
  %arrayidx468 = getelementptr inbounds float* %26, i64 %87, !dbg !737
  %88 = load float* %arrayidx468, align 4, !dbg !737, !tbaa !310
  %mul469 = fmul float %86, %88, !dbg !705
  %add470 = fadd float %add431, %mul469, !dbg !698
  %add481 = add i32 %mul441, %52, !dbg !725
  %add484 = add i32 %add481, %mul476, !dbg !725
  %add485 = add i32 %add484, %mul444, !dbg !725
  %idxprom486 = sext i32 %add485 to i64, !dbg !725
  %arrayidx488 = getelementptr inbounds float* %34, i64 %idxprom486, !dbg !725
  %89 = load float* %arrayidx488, align 4, !dbg !725, !tbaa !310
  %90 = add nsw i64 %48, %indvars.iv, !dbg !738
  %arrayidx507 = getelementptr inbounds float* %26, i64 %90, !dbg !738
  %91 = load float* %arrayidx507, align 4, !dbg !738, !tbaa !310
  %mul508 = fmul float %89, %91, !dbg !725
  %add509 = fadd float %add470, %mul508, !dbg !698
  %add523 = add i32 %add481, %mul515, !dbg !726
  %add524 = add i32 %add523, %mul444, !dbg !726
  %idxprom525 = sext i32 %add524 to i64, !dbg !726
  %arrayidx527 = getelementptr inbounds float* %34, i64 %idxprom525, !dbg !726
  %92 = load float* %arrayidx527, align 4, !dbg !726, !tbaa !310
  %93 = add nsw i64 %46, %72, !dbg !739
  %arrayidx546 = getelementptr inbounds float* %26, i64 %93, !dbg !739
  %94 = load float* %arrayidx546, align 4, !dbg !739, !tbaa !310
  %mul547 = fmul float %92, %94, !dbg !726
  %add548 = fadd float %add509, %mul547, !dbg !698
  %95 = add nsw i64 %47, %indvars.iv, !dbg !706
  %arrayidx566 = getelementptr inbounds float* %37, i64 %95, !dbg !706
  %96 = load float* %arrayidx566, align 4, !dbg !706, !tbaa !310
  %add567 = fadd float %add548, %96, !dbg !698
  tail call void @llvm.dbg.value(metadata float %add567, i64 0, metadata !121, metadata !152), !dbg !740
  %add581 = add i32 %add55, %mul573, !dbg !727
  %add582 = add i32 %add581, %mul22, !dbg !727
  %idxprom583 = sext i32 %add582 to i64, !dbg !727
  %arrayidx585 = getelementptr inbounds float* %23, i64 %idxprom583, !dbg !727
  %97 = load float* %arrayidx585, align 4, !dbg !727, !tbaa !310
  %mul586 = fmul float %add567, %97, !dbg !741
  %98 = add nsw i64 %46, %indvars.iv, !dbg !742
  %arrayidx604 = getelementptr inbounds float* %26, i64 %98, !dbg !742
  %99 = load float* %arrayidx604, align 4, !dbg !742, !tbaa !310
  %sub605 = fsub float %mul586, %99, !dbg !741
  %100 = add nsw i64 %45, %indvars.iv, !dbg !707
  %arrayidx623 = getelementptr inbounds float* %40, i64 %100, !dbg !707
  %101 = load float* %arrayidx623, align 4, !dbg !707, !tbaa !310
  %mul624 = fmul float %sub605, %101, !dbg !743
  tail call void @llvm.dbg.value(metadata float %mul624, i64 0, metadata !122, metadata !152), !dbg !744
  %mul625 = fmul float %mul624, %mul624, !dbg !745
  %add626 = fadd float %gosa.31097, %mul625, !dbg !746
  tail call void @llvm.dbg.value(metadata float %add626, i64 0, metadata !120, metadata !152), !dbg !747
  %102 = load float* @omega, align 4, !dbg !748, !tbaa !310
  %mul645 = fmul float %102, %mul624, !dbg !748
  %add646 = fadd float %99, %mul645, !dbg !749
  %103 = add nsw i64 %44, %indvars.iv, !dbg !728
  %arrayidx664 = getelementptr inbounds float* %43, i64 %103, !dbg !728
  store float %add646, float* %arrayidx664, align 4, !dbg !728, !tbaa !310
  %exitcond = icmp eq i32 %52, %3, !dbg !714
  br i1 %exitcond, label %for.inc665.loopexit, label %for.body11, !dbg !714

for.inc665.loopexit:                              ; preds = %for.body11
  %add626.lcssa = phi float [ %add626, %for.body11 ]
  br label %for.inc665

for.inc665:                                       ; preds = %for.inc665.loopexit, %for.cond9.preheader.for.inc665_crit_edge
  %inc666.pre-phi = phi i32 [ %inc666.pre, %for.cond9.preheader.for.inc665_crit_edge ], [ %add74, %for.inc665.loopexit ], !dbg !715
  %gosa.3.lcssa = phi float [ %gosa.21099, %for.cond9.preheader.for.inc665_crit_edge ], [ %add626.lcssa, %for.inc665.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %inc666.pre-phi, i64 0, metadata !114, metadata !152), !dbg !750
  %exitcond1136 = icmp eq i32 %j.01100, %4, !dbg !712
  br i1 %exitcond1136, label %for.inc668.loopexit, label %for.cond9.preheader, !dbg !712

for.inc668.loopexit:                              ; preds = %for.inc665
  %gosa.3.lcssa.lcssa = phi float [ %gosa.3.lcssa, %for.inc665 ]
  br label %for.inc668

for.inc668:                                       ; preds = %for.inc668.loopexit, %for.cond6.preheader
  %gosa.2.lcssa = phi float [ %gosa.11103, %for.cond6.preheader ], [ %gosa.3.lcssa.lcssa, %for.inc668.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %add31, i64 0, metadata !113, metadata !152), !dbg !751
  %exitcond1137 = icmp eq i32 %i.01104, %5, !dbg !708
  br i1 %exitcond1137, label %for.cond671.preheader, label %for.cond6.preheader, !dbg !708

for.cond674.preheader:                            ; preds = %for.cond674.preheader.preheader, %for.inc722
  %indvar1152 = phi i32 [ %indvar.next1153, %for.inc722 ], [ 0, %for.cond674.preheader.preheader ]
  %i.11112 = phi i32 [ %inc723, %for.inc722 ], [ 1, %for.cond674.preheader.preheader ]
  %104 = add i32 %indvar1152, 1, !dbg !711
  br i1 %cmp6751109, label %for.cond677.preheader.preheader, label %for.inc722, !dbg !711

for.cond677.preheader.preheader:                  ; preds = %for.cond674.preheader
  br label %for.cond677.preheader, !dbg !752

for.cond677.preheader:                            ; preds = %for.cond677.preheader.preheader, %for.inc719
  %indvar = phi i32 [ %indvar.next, %for.inc719 ], [ 0, %for.cond677.preheader.preheader ]
  %j.11110 = phi i32 [ %inc720, %for.inc719 ], [ 1, %for.cond677.preheader.preheader ]
  %105 = add i32 %indvar, 1, !dbg !752
  br i1 %cmp6781107, label %for.body679.lr.ph, label %for.inc719, !dbg !752

for.body679.lr.ph:                                ; preds = %for.cond677.preheader
  %106 = load i32* %mcols682, align 4, !dbg !696, !tbaa !185
  %107 = load i32* %mdeps684, align 4, !dbg !696, !tbaa !187
  %mul687 = mul nsw i32 %106, %i.11112, !dbg !696
  %mul6891090 = add i32 %mul687, %j.11110, !dbg !696
  %add693 = mul nsw i32 %mul6891090, %107, !dbg !696
  %108 = load float** %m696, align 8, !dbg !696, !tbaa !190
  %109 = load i32* %mcols, align 4, !dbg !697, !tbaa !185
  %110 = load i32* %mdeps, align 4, !dbg !697, !tbaa !187
  %mul705 = mul nsw i32 %109, %i.11112, !dbg !697
  %mul7071091 = add i32 %mul705, %j.11110, !dbg !697
  %add711 = mul nsw i32 %mul7071091, %110, !dbg !697
  %111 = load float** %m714, align 8, !dbg !697, !tbaa !190
  %112 = sext i32 %add711 to i64, !dbg !752
  %113 = sext i32 %add693 to i64, !dbg !752
  %end.idx = add nuw nsw i64 %8, 2, !dbg !752
  %n.vec = and i64 %9, 8589934584, !dbg !752
  %end.idx.rnd.down1177 = or i64 %n.vec, 1, !dbg !752
  %cmp.zero = icmp eq i64 %end.idx.rnd.down1177, 1, !dbg !752
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
  br label %vector.body.prol, !dbg !696

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 1, %vector.body.prol.preheader ], !dbg !752
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %122 = add i64 %113, %index.prol, !dbg !696
  %123 = getelementptr inbounds float* %108, i64 %122, !dbg !696
  %124 = bitcast float* %123 to <4 x float>*, !dbg !696
  %wide.load.prol = load <4 x float>* %124, align 4, !dbg !696, !tbaa !310
  %.sum.prol = add i64 %122, 4, !dbg !696
  %125 = getelementptr float* %108, i64 %.sum.prol, !dbg !696
  %126 = bitcast float* %125 to <4 x float>*, !dbg !696
  %wide.load1168.prol = load <4 x float>* %126, align 4, !dbg !696, !tbaa !310
  %127 = add i64 %112, %index.prol, !dbg !697
  %128 = getelementptr inbounds float* %111, i64 %127, !dbg !697
  %129 = bitcast float* %128 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load.prol, <4 x float>* %129, align 4, !dbg !697, !tbaa !310
  %.sum1178.prol = add i64 %127, 4, !dbg !697
  %130 = getelementptr float* %111, i64 %.sum1178.prol, !dbg !697
  %131 = bitcast float* %130 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load1168.prol, <4 x float>* %131, align 4, !dbg !697, !tbaa !310
  %index.next.prol = add i64 %index.prol, 8, !dbg !752
  %132 = icmp eq i64 %index.next.prol, %end.idx.rnd.down1177, !dbg !752
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !752
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !752
  br i1 %prol.iter.cmp, label %vector.body.prol, label %vector.body.preheader.split.loopexit, !llvm.loop !753

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.unr.ph = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 1, %vector.body.preheader ], [ %index.unr.ph, %vector.body.preheader.split.loopexit ]
  %133 = icmp ult i64 %18, 2
  br i1 %133, label %middle.block.loopexit, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !696

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !752
  %134 = add i64 %113, %index, !dbg !696
  %135 = getelementptr inbounds float* %108, i64 %134, !dbg !696
  %136 = bitcast float* %135 to <4 x float>*, !dbg !696
  %wide.load = load <4 x float>* %136, align 4, !dbg !696, !tbaa !310
  %.sum = add i64 %134, 4, !dbg !696
  %137 = getelementptr float* %108, i64 %.sum, !dbg !696
  %138 = bitcast float* %137 to <4 x float>*, !dbg !696
  %wide.load1168 = load <4 x float>* %138, align 4, !dbg !696, !tbaa !310
  %139 = add i64 %112, %index, !dbg !697
  %140 = getelementptr inbounds float* %111, i64 %139, !dbg !697
  %141 = bitcast float* %140 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load, <4 x float>* %141, align 4, !dbg !697, !tbaa !310
  %.sum1178 = add i64 %139, 4, !dbg !697
  %142 = getelementptr float* %111, i64 %.sum1178, !dbg !697
  %143 = bitcast float* %142 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load1168, <4 x float>* %143, align 4, !dbg !697, !tbaa !310
  %index.next = add i64 %index, 8, !dbg !752
  %144 = add i64 %113, %index.next, !dbg !696
  %145 = getelementptr inbounds float* %108, i64 %144, !dbg !696
  %146 = bitcast float* %145 to <4 x float>*, !dbg !696
  %wide.load.1 = load <4 x float>* %146, align 4, !dbg !696, !tbaa !310
  %.sum.1 = add i64 %144, 4, !dbg !696
  %147 = getelementptr float* %108, i64 %.sum.1, !dbg !696
  %148 = bitcast float* %147 to <4 x float>*, !dbg !696
  %wide.load1168.1 = load <4 x float>* %148, align 4, !dbg !696, !tbaa !310
  %149 = add i64 %112, %index.next, !dbg !697
  %150 = getelementptr inbounds float* %111, i64 %149, !dbg !697
  %151 = bitcast float* %150 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load.1, <4 x float>* %151, align 4, !dbg !697, !tbaa !310
  %.sum1178.1 = add i64 %149, 4, !dbg !697
  %152 = getelementptr float* %111, i64 %.sum1178.1, !dbg !697
  %153 = bitcast float* %152 to <4 x float>*, !dbg !697
  store <4 x float> %wide.load1168.1, <4 x float>* %153, align 4, !dbg !697, !tbaa !310
  %index.next.1 = add i64 %index.next, 8, !dbg !752
  %154 = icmp eq i64 %index.next.1, %end.idx.rnd.down1177, !dbg !752
  br i1 %154, label %middle.block.loopexit.unr-lcssa, label %vector.body, !dbg !752, !llvm.loop !754

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
  br label %for.body679.prol, !dbg !696

for.body679.prol:                                 ; preds = %for.body679.prol.preheader, %for.body679.prol
  %indvars.iv1138.prol = phi i64 [ %indvars.iv.next1139.prol, %for.body679.prol ], [ %resume.val, %for.body679.prol.preheader ]
  %prol.iter1183 = phi i32 [ %prol.iter1183.sub, %for.body679.prol ], [ %xtraiter1179, %for.body679.prol.preheader ]
  %157 = add nsw i64 %113, %indvars.iv1138.prol, !dbg !696
  %arrayidx697.prol = getelementptr inbounds float* %108, i64 %157, !dbg !696
  %158 = load float* %arrayidx697.prol, align 4, !dbg !696, !tbaa !310
  %159 = add nsw i64 %112, %indvars.iv1138.prol, !dbg !697
  %arrayidx715.prol = getelementptr inbounds float* %111, i64 %159, !dbg !697
  store float %158, float* %arrayidx715.prol, align 4, !dbg !697, !tbaa !310
  %indvars.iv.next1139.prol = add nuw nsw i64 %indvars.iv1138.prol, 1, !dbg !752
  %lftr.wideiv1142.prol = trunc i64 %indvars.iv1138.prol to i32, !dbg !752
  %exitcond1143.prol = icmp eq i32 %lftr.wideiv1142.prol, %3, !dbg !752
  %prol.iter1183.sub = sub i32 %prol.iter1183, 1, !dbg !752
  %prol.iter1183.cmp = icmp ne i32 %prol.iter1183.sub, 0, !dbg !752
  br i1 %prol.iter1183.cmp, label %for.body679.prol, label %for.body679.preheader.split.loopexit, !llvm.loop !755

for.body679.preheader.split.loopexit:             ; preds = %for.body679.prol
  %indvars.iv1138.unr.ph = phi i64 [ %indvars.iv.next1139.prol, %for.body679.prol ]
  br label %for.body679.preheader.split

for.body679.preheader.split:                      ; preds = %for.body679.preheader.split.loopexit, %for.body679.preheader
  %indvars.iv1138.unr = phi i64 [ %resume.val, %for.body679.preheader ], [ %indvars.iv1138.unr.ph, %for.body679.preheader.split.loopexit ]
  %160 = icmp ult i32 %156, 2
  br i1 %160, label %for.inc719.loopexit, label %for.body679.preheader.split.split

for.body679.preheader.split.split:                ; preds = %for.body679.preheader.split
  br label %for.body679, !dbg !696

for.body679:                                      ; preds = %for.body679, %for.body679.preheader.split.split
  %indvars.iv1138 = phi i64 [ %indvars.iv1138.unr, %for.body679.preheader.split.split ], [ %indvars.iv.next1139.1, %for.body679 ]
  %161 = add nsw i64 %113, %indvars.iv1138, !dbg !696
  %arrayidx697 = getelementptr inbounds float* %108, i64 %161, !dbg !696
  %162 = load float* %arrayidx697, align 4, !dbg !696, !tbaa !310
  %163 = add nsw i64 %112, %indvars.iv1138, !dbg !697
  %arrayidx715 = getelementptr inbounds float* %111, i64 %163, !dbg !697
  store float %162, float* %arrayidx715, align 4, !dbg !697, !tbaa !310
  %indvars.iv.next1139 = add nuw nsw i64 %indvars.iv1138, 1, !dbg !752
  %lftr.wideiv1142 = trunc i64 %indvars.iv1138 to i32, !dbg !752
  %164 = add nsw i64 %113, %indvars.iv.next1139, !dbg !696
  %arrayidx697.1 = getelementptr inbounds float* %108, i64 %164, !dbg !696
  %165 = load float* %arrayidx697.1, align 4, !dbg !696, !tbaa !310
  %166 = add nsw i64 %112, %indvars.iv.next1139, !dbg !697
  %arrayidx715.1 = getelementptr inbounds float* %111, i64 %166, !dbg !697
  store float %165, float* %arrayidx715.1, align 4, !dbg !697, !tbaa !310
  %indvars.iv.next1139.1 = add nuw nsw i64 %indvars.iv.next1139, 1, !dbg !752
  %lftr.wideiv1142.1 = trunc i64 %indvars.iv.next1139 to i32, !dbg !752
  %exitcond1143.1 = icmp eq i32 %lftr.wideiv1142.1, %3, !dbg !752
  br i1 %exitcond1143.1, label %for.inc719.loopexit.unr-lcssa, label %for.body679, !dbg !752, !llvm.loop !756

for.inc719.loopexit.unr-lcssa:                    ; preds = %for.body679
  br label %for.inc719.loopexit

for.inc719.loopexit:                              ; preds = %for.body679.preheader.split, %for.inc719.loopexit.unr-lcssa
  br label %for.inc719

for.inc719:                                       ; preds = %for.inc719.loopexit, %middle.block, %for.cond677.preheader
  %inc720 = add nuw nsw i32 %j.11110, 1, !dbg !757
  tail call void @llvm.dbg.value(metadata i32 %inc720, i64 0, metadata !114, metadata !152), !dbg !750
  %exitcond1148 = icmp eq i32 %j.11110, %4, !dbg !711
  %indvar.next = add i32 %indvar, 1, !dbg !711
  br i1 %exitcond1148, label %for.inc722.loopexit, label %for.cond677.preheader, !dbg !711

for.inc722.loopexit:                              ; preds = %for.inc719
  br label %for.inc722

for.inc722:                                       ; preds = %for.inc722.loopexit, %for.cond674.preheader
  %inc723 = add nuw nsw i32 %i.11112, 1, !dbg !758
  tail call void @llvm.dbg.value(metadata i32 %inc723, i64 0, metadata !113, metadata !152), !dbg !751
  %exitcond1149 = icmp eq i32 %i.11112, %5, !dbg !710
  %indvar.next1153 = add i32 %indvar1152, 1, !dbg !710
  br i1 %exitcond1149, label %for.inc725.loopexit, label %for.cond674.preheader, !dbg !710

for.inc725.loopexit:                              ; preds = %for.inc722
  br label %for.inc725

for.inc725:                                       ; preds = %for.inc725.loopexit, %for.cond3.preheader, %for.cond671.preheader
  %gosa.1.lcssa1151 = phi float [ %gosa.2.lcssa.lcssa, %for.cond671.preheader ], [ 0.000000e+00, %for.cond3.preheader ], [ %gosa.2.lcssa.lcssa, %for.inc725.loopexit ]
  %inc726 = add nuw nsw i32 %n.01115, 1, !dbg !759
  tail call void @llvm.dbg.value(metadata i32 %inc726, i64 0, metadata !116, metadata !152), !dbg !679
  %exitcond1150 = icmp eq i32 %n.01115, %6, !dbg !683
  br i1 %exitcond1150, label %for.end727.loopexit, label %for.cond3.preheader, !dbg !683

for.end727.loopexit:                              ; preds = %for.inc725
  %gosa.1.lcssa1151.lcssa = phi float [ %gosa.1.lcssa1151, %for.inc725 ]
  br label %for.end727

for.end727:                                       ; preds = %for.end727.loopexit, %entry
  %gosa.0.lcssa = phi float [ undef, %entry ], [ %gosa.1.lcssa1151.lcssa, %for.end727.loopexit ]
  ret float %gosa.0.lcssa, !dbg !760
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* nocapture %Mat) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Mat* %Mat, i64 0, metadata !82, metadata !152), !dbg !761
  %m = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !762
  %0 = load float** %m, align 8, !dbg !762, !tbaa !190
  %tobool = icmp eq float* %0, null, !dbg !763
  br i1 %tobool, label %if.end, label %if.then, !dbg !763

if.then:                                          ; preds = %entry
  %1 = bitcast float* %0 to i8*, !dbg !764
  tail call void @free(i8* %1) #6, !dbg !765
  br label %if.end, !dbg !765

if.end:                                           ; preds = %entry, %if.then
  %2 = bitcast %struct.Mat* %Mat to i8*, !dbg !766
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false), !dbg !767
  ret void, !dbg !766
}

; Function Attrs: nounwind readnone uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %mx, i64 0, metadata !43, metadata !152), !dbg !768
  tail call void @llvm.dbg.value(metadata i32 %my, i64 0, metadata !44, metadata !152), !dbg !769
  tail call void @llvm.dbg.value(metadata i32 %mz, i64 0, metadata !45, metadata !152), !dbg !770
  %sub = add nsw i32 %mz, -2, !dbg !771
  %conv = sitofp i32 %sub to double, !dbg !772
  %sub1 = add nsw i32 %my, -2, !dbg !773
  %conv2 = sitofp i32 %sub1 to double, !dbg !774
  %mul = fmul double %conv2, %conv, !dbg !772
  %sub3 = add nsw i32 %mx, -2, !dbg !775
  %conv4 = sitofp i32 %sub3 to double, !dbg !776
  %mul5 = fmul double %conv4, %mul, !dbg !772
  %mul6 = fmul double %mul5, 3.400000e+01, !dbg !772
  ret double %mul6, !dbg !777
}

; Function Attrs: nounwind readnone uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #3 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %nn, i64 0, metadata !50, metadata !152), !dbg !778
  tail call void @llvm.dbg.value(metadata double %cpu, i64 0, metadata !51, metadata !152), !dbg !779
  tail call void @llvm.dbg.value(metadata double %flop, i64 0, metadata !52, metadata !152), !dbg !780
  %div = fdiv double %flop, %cpu, !dbg !781
  %mul = fmul double %div, 1.000000e-06, !dbg !781
  %conv = sitofp i32 %nn to double, !dbg !782
  %mul1 = fmul double %conv, %mul, !dbg !781
  ret double %mul1, !dbg !783
}

; Function Attrs: nounwind uwtable
define void @set_param(i32* nocapture %is, i8* nocapture readonly %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %is, i64 0, metadata !58, metadata !152), !dbg !784
  tail call void @llvm.dbg.value(metadata i8* %size, i64 0, metadata !59, metadata !152), !dbg !785
  %call = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #6, !dbg !786
  %tobool = icmp eq i32 %call, 0, !dbg !788
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !788

lor.lhs.false:                                    ; preds = %entry
  %call1 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0)) #6, !dbg !789
  %tobool2 = icmp eq i32 %call1, 0, !dbg !788
  br i1 %tobool2, label %if.then, label %if.end, !dbg !788

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 32, i32* %is, align 4, !dbg !790, !tbaa !792
  %arrayidx3 = getelementptr inbounds i32* %is, i64 1, !dbg !793
  store i32 32, i32* %arrayidx3, align 4, !dbg !793, !tbaa !792
  %arrayidx4 = getelementptr inbounds i32* %is, i64 2, !dbg !794
  store i32 64, i32* %arrayidx4, align 4, !dbg !794, !tbaa !792
  br label %return, !dbg !795

if.end:                                           ; preds = %lor.lhs.false
  %call5 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)) #6, !dbg !796
  %tobool6 = icmp eq i32 %call5, 0, !dbg !798
  br i1 %tobool6, label %if.then10, label %lor.lhs.false7, !dbg !798

lor.lhs.false7:                                   ; preds = %if.end
  %call8 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str7, i64 0, i64 0)) #6, !dbg !799
  %tobool9 = icmp eq i32 %call8, 0, !dbg !798
  br i1 %tobool9, label %if.then10, label %if.end14, !dbg !798

if.then10:                                        ; preds = %lor.lhs.false7, %if.end
  store i32 64, i32* %is, align 4, !dbg !800, !tbaa !792
  %arrayidx12 = getelementptr inbounds i32* %is, i64 1, !dbg !802
  store i32 64, i32* %arrayidx12, align 4, !dbg !802, !tbaa !792
  %arrayidx13 = getelementptr inbounds i32* %is, i64 2, !dbg !803
  store i32 128, i32* %arrayidx13, align 4, !dbg !803, !tbaa !792
  br label %return, !dbg !804

if.end14:                                         ; preds = %lor.lhs.false7
  %call15 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) #6, !dbg !805
  %tobool16 = icmp eq i32 %call15, 0, !dbg !807
  br i1 %tobool16, label %if.then20, label %lor.lhs.false17, !dbg !807

lor.lhs.false17:                                  ; preds = %if.end14
  %call18 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str9, i64 0, i64 0)) #6, !dbg !808
  %tobool19 = icmp eq i32 %call18, 0, !dbg !807
  br i1 %tobool19, label %if.then20, label %if.end24, !dbg !807

if.then20:                                        ; preds = %lor.lhs.false17, %if.end14
  store i32 128, i32* %is, align 4, !dbg !809, !tbaa !792
  %arrayidx22 = getelementptr inbounds i32* %is, i64 1, !dbg !811
  store i32 128, i32* %arrayidx22, align 4, !dbg !811, !tbaa !792
  %arrayidx23 = getelementptr inbounds i32* %is, i64 2, !dbg !812
  store i32 256, i32* %arrayidx23, align 4, !dbg !812, !tbaa !792
  br label %return, !dbg !813

if.end24:                                         ; preds = %lor.lhs.false17
  %call25 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str10, i64 0, i64 0)) #6, !dbg !814
  %tobool26 = icmp eq i32 %call25, 0, !dbg !816
  br i1 %tobool26, label %if.then30, label %lor.lhs.false27, !dbg !816

lor.lhs.false27:                                  ; preds = %if.end24
  %call28 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str11, i64 0, i64 0)) #6, !dbg !817
  %tobool29 = icmp eq i32 %call28, 0, !dbg !816
  br i1 %tobool29, label %if.then30, label %if.end34, !dbg !816

if.then30:                                        ; preds = %lor.lhs.false27, %if.end24
  store i32 256, i32* %is, align 4, !dbg !818, !tbaa !792
  %arrayidx32 = getelementptr inbounds i32* %is, i64 1, !dbg !820
  store i32 256, i32* %arrayidx32, align 4, !dbg !820, !tbaa !792
  %arrayidx33 = getelementptr inbounds i32* %is, i64 2, !dbg !821
  store i32 512, i32* %arrayidx33, align 4, !dbg !821, !tbaa !792
  br label %return, !dbg !822

if.end34:                                         ; preds = %lor.lhs.false27
  %call35 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str12, i64 0, i64 0)) #6, !dbg !823
  %tobool36 = icmp eq i32 %call35, 0, !dbg !825
  br i1 %tobool36, label %if.then40, label %lor.lhs.false37, !dbg !825

lor.lhs.false37:                                  ; preds = %if.end34
  %call38 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) #6, !dbg !826
  %tobool39 = icmp eq i32 %call38, 0, !dbg !825
  br i1 %tobool39, label %if.then40, label %if.else, !dbg !825

if.then40:                                        ; preds = %lor.lhs.false37, %if.end34
  store i32 512, i32* %is, align 4, !dbg !827, !tbaa !792
  %arrayidx42 = getelementptr inbounds i32* %is, i64 1, !dbg !829
  store i32 512, i32* %arrayidx42, align 4, !dbg !829, !tbaa !792
  %arrayidx43 = getelementptr inbounds i32* %is, i64 2, !dbg !830
  store i32 1024, i32* %arrayidx43, align 4, !dbg !830, !tbaa !792
  br label %return, !dbg !831

if.else:                                          ; preds = %lor.lhs.false37
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0)), !dbg !832
  tail call void @exit(i32 6) #7, !dbg !834
  unreachable, !dbg !834

return:                                           ; preds = %if.then40, %if.then30, %if.then20, %if.then10, %if.then
  ret void, !dbg !835
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
  tail call void @llvm.dbg.value(metadata %struct.timeval* %tm, i64 0, metadata !127, metadata !152), !dbg !836
  %call = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #6, !dbg !837
  %0 = load i32* @second.base_sec, align 4, !dbg !838, !tbaa !792
  %1 = load i32* @second.base_usec, align 4
  %2 = or i32 %1, %0, !dbg !840
  %3 = icmp eq i32 %2, 0, !dbg !840
  %tv_sec = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0, !dbg !841
  %4 = load i64* %tv_sec, align 8, !dbg !841, !tbaa !843
  %5 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1
  %6 = load i64* %5, align 8
  br i1 %3, label %if.then, label %if.else, !dbg !840

if.then:                                          ; preds = %entry
  %conv = trunc i64 %4 to i32, !dbg !841
  store i32 %conv, i32* @second.base_sec, align 4, !dbg !846, !tbaa !792
  %conv2 = trunc i64 %6 to i32, !dbg !847
  store i32 %conv2, i32* @second.base_usec, align 4, !dbg !848, !tbaa !792
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !137, metadata !152), !dbg !849
  br label %if.end, !dbg !850

if.else:                                          ; preds = %entry
  %conv4 = sext i32 %0 to i64, !dbg !851
  %sub = sub nsw i64 %4, %conv4, !dbg !853
  %conv5 = sitofp i64 %sub to double, !dbg !854
  %conv7 = sext i32 %1 to i64, !dbg !855
  %sub8 = sub nsw i64 %6, %conv7, !dbg !856
  %conv9 = sitofp i64 %sub8 to double, !dbg !857
  %div = fdiv double %conv9, 1.000000e+06, !dbg !858
  %add = fadd double %conv5, %div, !dbg !854
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !137, metadata !152), !dbg !849
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %t.0 = phi double [ 0.000000e+00, %if.then ], [ %add, %if.else ]
  ret double %t.0, !dbg !859
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
!298 = !MDLocation(line: 236, column: 3, scope: !299, inlinedAt: !294)
!299 = !{!"0xb\00236\003\0018", !1, !93}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!300 = !MDLocation(line: 239, column: 34, scope: !301, inlinedAt: !294)
!301 = !{!"0xb\00238\007\0023", !1, !302}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!302 = !{!"0xb\00238\007\0022", !1, !303}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!303 = !{!"0xb\00237\005\0021", !1, !304}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!304 = !{!"0xb\00237\005\0020", !1, !305}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!305 = !{!"0xb\00236\003\0019", !1, !299}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!306 = !MDLocation(line: 239, column: 26, scope: !301, inlinedAt: !294)
!307 = !MDLocation(line: 239, column: 9, scope: !301, inlinedAt: !294)
!308 = !MDLocation(line: 237, column: 5, scope: !304, inlinedAt: !294)
!309 = !MDLocation(line: 238, column: 7, scope: !302, inlinedAt: !294)
!310 = !{!311, !311, i64 0}
!311 = !{!"float", !179, i64 0}
!312 = !MDLocation(line: 236, column: 26, scope: !305, inlinedAt: !294)
!313 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !320)
!314 = !{!"0xb\00226\009\0017", !1, !315}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!315 = !{!"0xb\00226\009\0016", !1, !316}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!316 = !{!"0xb\00225\007\0015", !1, !317}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!317 = !{!"0xb\00225\007\0014", !1, !318}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!318 = !{!"0xb\00224\005\0013", !1, !319}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!319 = !{!"0xb\00224\005\0012", !1, !83}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!320 = !MDLocation(line: 105, column: 3, scope: !9)
!321 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !320)
!322 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !320)
!323 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !320)
!324 = !{!"0x100\00i\00222\000", !83, !10, !13, !320} ; [ DW_TAG_auto_variable ] [i] [line 222]
!325 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !320)
!326 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !320)
!327 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !328)
!328 = !MDLocation(line: 106, column: 3, scope: !9)
!329 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !328)
!330 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !328)
!331 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !328)
!332 = !{!"0x100\00i\00222\000", !83, !10, !13, !328} ; [ DW_TAG_auto_variable ] [i] [line 222]
!333 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !328)
!334 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !328)
!335 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !336)
!336 = !MDLocation(line: 107, column: 3, scope: !9)
!337 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !336} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!338 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !336)
!339 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !336} ; [ DW_TAG_arg_variable ] [l] [line 220]
!340 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !336)
!341 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !336} ; [ DW_TAG_arg_variable ] [val] [line 220]
!342 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !336)
!343 = !{!"0x100\00i\00222\000", !83, !10, !13, !336} ; [ DW_TAG_auto_variable ] [i] [line 222]
!344 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !336)
!345 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !336)
!346 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !336)
!347 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !336)
!348 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !336)
!349 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !336)
!350 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !336)
!351 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !336)
!352 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !336)
!353 = distinct !{!353, !354}
!354 = !{!"llvm.loop.unroll.disable"}
!355 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !336)
!356 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !357} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!357 = !MDLocation(line: 108, column: 3, scope: !9)
!358 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !357)
!359 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !357} ; [ DW_TAG_arg_variable ] [l] [line 220]
!360 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !357)
!361 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !357} ; [ DW_TAG_arg_variable ] [val] [line 220]
!362 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !357)
!363 = !{!"0x100\00i\00222\000", !83, !10, !13, !357} ; [ DW_TAG_auto_variable ] [i] [line 222]
!364 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !357)
!365 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !357)
!366 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !357)
!367 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !357)
!368 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !357)
!369 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !357)
!370 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !357)
!371 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !357)
!372 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !357)
!373 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !357)
!374 = distinct !{!374, !375, !376}
!375 = !{!"llvm.loop.vectorize.width", i32 1}
!376 = !{!"llvm.loop.interleave.count", i32 1}
!377 = distinct !{!377, !354}
!378 = distinct !{!378, !375, !376}
!379 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !357)
!380 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !381)
!381 = !MDLocation(line: 109, column: 3, scope: !9)
!382 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !381)
!383 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !381)
!384 = distinct !{!384, !375, !376}
!385 = distinct !{!385, !354}
!386 = distinct !{!386, !375, !376}
!387 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !381)
!388 = !{!"0x100\00i\00222\000", !83, !10, !13, !381} ; [ DW_TAG_auto_variable ] [i] [line 222]
!389 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !381)
!390 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !381)
!391 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !392} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!392 = !MDLocation(line: 110, column: 3, scope: !9)
!393 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !392)
!394 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !392} ; [ DW_TAG_arg_variable ] [l] [line 220]
!395 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !392)
!396 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !392} ; [ DW_TAG_arg_variable ] [val] [line 220]
!397 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !392)
!398 = !{!"0x100\00i\00222\000", !83, !10, !13, !392} ; [ DW_TAG_auto_variable ] [i] [line 222]
!399 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !392)
!400 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !392)
!401 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !392)
!402 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !392)
!403 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !392)
!404 = distinct !{!404, !375, !376}
!405 = distinct !{!405, !354}
!406 = distinct !{!406, !375, !376}
!407 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !392)
!408 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !409} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!409 = !MDLocation(line: 111, column: 3, scope: !9)
!410 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !409)
!411 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !409} ; [ DW_TAG_arg_variable ] [l] [line 220]
!412 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !409)
!413 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !409} ; [ DW_TAG_arg_variable ] [val] [line 220]
!414 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !409)
!415 = !{!"0x100\00i\00222\000", !83, !10, !13, !409} ; [ DW_TAG_auto_variable ] [i] [line 222]
!416 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !409)
!417 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !409)
!418 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !409)
!419 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !409)
!420 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !409)
!421 = distinct !{!421, !375, !376}
!422 = distinct !{!422, !354}
!423 = distinct !{!423, !375, !376}
!424 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !409)
!425 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !426} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!426 = !MDLocation(line: 112, column: 3, scope: !9)
!427 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !426)
!428 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !426} ; [ DW_TAG_arg_variable ] [l] [line 220]
!429 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !426)
!430 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !426} ; [ DW_TAG_arg_variable ] [val] [line 220]
!431 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !426)
!432 = !{!"0x100\00i\00222\000", !83, !10, !13, !426} ; [ DW_TAG_auto_variable ] [i] [line 222]
!433 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !426)
!434 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !426)
!435 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !426)
!436 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !426)
!437 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !426)
!438 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !426)
!439 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !426)
!440 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !426)
!441 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !426)
!442 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !426)
!443 = distinct !{!443, !354}
!444 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !426)
!445 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !446)
!446 = !MDLocation(line: 113, column: 3, scope: !9)
!447 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !446} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!448 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !446)
!449 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !446} ; [ DW_TAG_arg_variable ] [l] [line 220]
!450 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !446)
!451 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !446} ; [ DW_TAG_arg_variable ] [val] [line 220]
!452 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !446)
!453 = !{!"0x100\00i\00222\000", !83, !10, !13, !446} ; [ DW_TAG_auto_variable ] [i] [line 222]
!454 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !446)
!455 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !446)
!456 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !446)
!457 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !446)
!458 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !446)
!459 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !446)
!460 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !446)
!461 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !446)
!462 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !446)
!463 = distinct !{!463, !354}
!464 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !446)
!465 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !466)
!466 = !MDLocation(line: 114, column: 3, scope: !9)
!467 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !466} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!468 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !466)
!469 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !466} ; [ DW_TAG_arg_variable ] [l] [line 220]
!470 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !466)
!471 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !466} ; [ DW_TAG_arg_variable ] [val] [line 220]
!472 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !466)
!473 = !{!"0x100\00i\00222\000", !83, !10, !13, !466} ; [ DW_TAG_auto_variable ] [i] [line 222]
!474 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !466)
!475 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !466)
!476 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !466)
!477 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !466)
!478 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !466)
!479 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !466)
!480 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !466)
!481 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !466)
!482 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !466)
!483 = distinct !{!483, !354}
!484 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !466)
!485 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !486} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!486 = !MDLocation(line: 115, column: 3, scope: !9)
!487 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !486)
!488 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !486} ; [ DW_TAG_arg_variable ] [l] [line 220]
!489 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !486)
!490 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !486} ; [ DW_TAG_arg_variable ] [val] [line 220]
!491 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !486)
!492 = !{!"0x100\00i\00222\000", !83, !10, !13, !486} ; [ DW_TAG_auto_variable ] [i] [line 222]
!493 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !486)
!494 = !MDLocation(line: 224, column: 16, scope: !318, inlinedAt: !486)
!495 = !MDLocation(line: 224, column: 14, scope: !318, inlinedAt: !486)
!496 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !486)
!497 = !MDLocation(line: 225, column: 18, scope: !316, inlinedAt: !486)
!498 = !MDLocation(line: 225, column: 16, scope: !316, inlinedAt: !486)
!499 = !MDLocation(line: 226, column: 18, scope: !314, inlinedAt: !486)
!500 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !486)
!501 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !486)
!502 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !486)
!503 = distinct !{!503, !375, !376}
!504 = distinct !{!504, !354}
!505 = distinct !{!505, !375, !376}
!506 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !486)
!507 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !508)
!508 = !MDLocation(line: 116, column: 3, scope: !9)
!509 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !508)
!510 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !508)
!511 = distinct !{!511, !375, !376}
!512 = distinct !{!512, !354}
!513 = distinct !{!513, !375, !376}
!514 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !508)
!515 = !{!"0x100\00i\00222\000", !83, !10, !13, !508} ; [ DW_TAG_auto_variable ] [i] [line 222]
!516 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !508)
!517 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !508)
!518 = !{!"0x101\00Mat\0016777436\000", !83, !10, !63, !519} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!519 = !MDLocation(line: 117, column: 3, scope: !9)
!520 = !MDLocation(line: 220, column: 17, scope: !83, inlinedAt: !519)
!521 = !{!"0x101\00l\0033554652\000", !83, !10, !13, !519} ; [ DW_TAG_arg_variable ] [l] [line 220]
!522 = !MDLocation(line: 220, column: 26, scope: !83, inlinedAt: !519)
!523 = !{!"0x101\00val\0050331868\000", !83, !10, !6, !519} ; [ DW_TAG_arg_variable ] [val] [line 220]
!524 = !MDLocation(line: 220, column: 35, scope: !83, inlinedAt: !519)
!525 = !{!"0x100\00i\00222\000", !83, !10, !13, !519} ; [ DW_TAG_auto_variable ] [i] [line 222]
!526 = !MDLocation(line: 222, column: 7, scope: !83, inlinedAt: !519)
!527 = !MDLocation(line: 227, column: 11, scope: !314, inlinedAt: !519)
!528 = !MDLocation(line: 224, column: 5, scope: !319, inlinedAt: !519)
!529 = !MDLocation(line: 225, column: 7, scope: !317, inlinedAt: !519)
!530 = !MDLocation(line: 226, column: 9, scope: !315, inlinedAt: !519)
!531 = distinct !{!531, !375, !376}
!532 = distinct !{!532, !354}
!533 = distinct !{!533, !375, !376}
!534 = !MDLocation(line: 224, column: 28, scope: !318, inlinedAt: !519)
!535 = !MDLocation(line: 73, column: 16, scope: !9)
!536 = !MDLocation(line: 124, column: 10, scope: !9)
!537 = !MDLocation(line: 75, column: 10, scope: !9)
!538 = !MDLocation(line: 126, column: 3, scope: !9)
!539 = !MDLocation(line: 127, column: 26, scope: !9)
!540 = !MDLocation(line: 127, column: 3, scope: !9)
!541 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !542} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!542 = !MDLocation(line: 132, column: 3, scope: !9)
!543 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !542)
!544 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !542)
!545 = !{!"0xb\00210\006\0011", !1, !78}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!546 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !542)
!547 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !542)
!548 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !542)
!549 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !542)
!550 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !551} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!551 = !MDLocation(line: 133, column: 3, scope: !9)
!552 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !551)
!553 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !551)
!554 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !551)
!555 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !551)
!556 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !551)
!557 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !551)
!558 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !559} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!559 = !MDLocation(line: 134, column: 3, scope: !9)
!560 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !559)
!561 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !559)
!562 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !559)
!563 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !559)
!564 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !559)
!565 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !559)
!566 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !567} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!567 = !MDLocation(line: 135, column: 3, scope: !9)
!568 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !567)
!569 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !567)
!570 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !567)
!571 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !567)
!572 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !567)
!573 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !567)
!574 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !575} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!575 = !MDLocation(line: 136, column: 3, scope: !9)
!576 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !575)
!577 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !575)
!578 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !575)
!579 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !575)
!580 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !575)
!581 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !575)
!582 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !583} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!583 = !MDLocation(line: 137, column: 3, scope: !9)
!584 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !583)
!585 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !583)
!586 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !583)
!587 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !583)
!588 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !583)
!589 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !583)
!590 = !{!"0x101\00Mat\0016777424\000", !78, !10, !63, !591} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!591 = !MDLocation(line: 138, column: 3, scope: !9)
!592 = !MDLocation(line: 208, column: 18, scope: !78, inlinedAt: !591)
!593 = !MDLocation(line: 210, column: 6, scope: !545, inlinedAt: !591)
!594 = !MDLocation(line: 210, column: 6, scope: !78, inlinedAt: !591)
!595 = !MDLocation(line: 211, column: 10, scope: !545, inlinedAt: !591)
!596 = !MDLocation(line: 211, column: 5, scope: !545, inlinedAt: !591)
!597 = !MDLocation(line: 213, column: 3, scope: !78, inlinedAt: !591)
!598 = !MDLocation(line: 140, column: 3, scope: !9)
!599 = !MDLocation(line: 194, column: 16, scope: !60)
!600 = !MDLocation(line: 194, column: 25, scope: !60)
!601 = !MDLocation(line: 194, column: 35, scope: !60)
!602 = !MDLocation(line: 194, column: 46, scope: !60)
!603 = !MDLocation(line: 194, column: 57, scope: !60)
!604 = !MDLocation(line: 196, column: 3, scope: !60)
!605 = !MDLocation(line: 197, column: 3, scope: !60)
!606 = !MDLocation(line: 198, column: 3, scope: !60)
!607 = !MDLocation(line: 199, column: 3, scope: !60)
!608 = !MDLocation(line: 202, column: 12, scope: !60)
!609 = !MDLocation(line: 202, column: 5, scope: !60)
!610 = !MDLocation(line: 201, column: 3, scope: !60)
!611 = !MDLocation(line: 204, column: 10, scope: !60)
!612 = !MDLocation(line: 204, column: 9, scope: !60)
!613 = !MDLocation(line: 204, column: 3, scope: !60)
!614 = !MDLocation(line: 231, column: 22, scope: !93)
!615 = !MDLocation(line: 233, column: 8, scope: !93)
!616 = !MDLocation(line: 236, column: 14, scope: !305)
!617 = !MDLocation(line: 236, column: 12, scope: !305)
!618 = !MDLocation(line: 236, column: 3, scope: !299)
!619 = !MDLocation(line: 237, column: 16, scope: !303)
!620 = !MDLocation(line: 237, column: 14, scope: !303)
!621 = !MDLocation(line: 238, column: 18, scope: !301)
!622 = !MDLocation(line: 239, column: 9, scope: !301)
!623 = !MDLocation(line: 237, column: 5, scope: !304)
!624 = !MDLocation(line: 238, column: 16, scope: !301)
!625 = !MDLocation(line: 239, column: 34, scope: !301)
!626 = !MDLocation(line: 239, column: 26, scope: !301)
!627 = !MDLocation(line: 238, column: 7, scope: !302)
!628 = !MDLocation(line: 240, column: 21, scope: !301)
!629 = !MDLocation(line: 240, column: 20, scope: !301)
!630 = !MDLocation(line: 240, column: 12, scope: !301)
!631 = !MDLocation(line: 238, column: 30, scope: !301)
!632 = distinct !{!632, !354}
!633 = distinct !{!633, !375, !376}
!634 = !MDLocation(line: 233, column: 12, scope: !93)
!635 = distinct !{!635, !354}
!636 = distinct !{!636, !375, !376}
!637 = !MDLocation(line: 237, column: 28, scope: !303)
!638 = !MDLocation(line: 233, column: 10, scope: !93)
!639 = !MDLocation(line: 236, column: 26, scope: !305)
!640 = !MDLocation(line: 241, column: 1, scope: !93)
!641 = !MDLocation(line: 220, column: 17, scope: !83)
!642 = !MDLocation(line: 220, column: 26, scope: !83)
!643 = !MDLocation(line: 220, column: 35, scope: !83)
!644 = !MDLocation(line: 222, column: 7, scope: !83)
!645 = !MDLocation(line: 224, column: 16, scope: !318)
!646 = !MDLocation(line: 224, column: 14, scope: !318)
!647 = !MDLocation(line: 224, column: 5, scope: !319)
!648 = !MDLocation(line: 225, column: 18, scope: !316)
!649 = !MDLocation(line: 225, column: 16, scope: !316)
!650 = !MDLocation(line: 226, column: 20, scope: !314)
!651 = !MDLocation(line: 227, column: 11, scope: !314)
!652 = !MDLocation(line: 225, column: 7, scope: !317)
!653 = !MDLocation(line: 226, column: 18, scope: !314)
!654 = !MDLocation(line: 226, column: 9, scope: !315)
!655 = !MDLocation(line: 226, column: 32, scope: !314)
!656 = distinct !{!656, !354}
!657 = distinct !{!657, !375, !376}
!658 = !MDLocation(line: 222, column: 11, scope: !83)
!659 = distinct !{!659, !354}
!660 = distinct !{!660, !375, !376}
!661 = !MDLocation(line: 225, column: 30, scope: !316)
!662 = !MDLocation(line: 222, column: 9, scope: !83)
!663 = !MDLocation(line: 224, column: 28, scope: !318)
!664 = !MDLocation(line: 228, column: 1, scope: !83)
!665 = !MDLocation(line: 244, column: 12, scope: !101)
!666 = !MDLocation(line: 244, column: 24, scope: !101)
!667 = !MDLocation(line: 244, column: 34, scope: !101)
!668 = !MDLocation(line: 244, column: 44, scope: !101)
!669 = !MDLocation(line: 245, column: 16, scope: !101)
!670 = !MDLocation(line: 245, column: 26, scope: !101)
!671 = !MDLocation(line: 245, column: 38, scope: !101)
!672 = !MDLocation(line: 245, column: 51, scope: !101)
!673 = !MDLocation(line: 250, column: 9, scope: !101)
!674 = !MDLocation(line: 247, column: 18, scope: !101)
!675 = !MDLocation(line: 251, column: 9, scope: !101)
!676 = !MDLocation(line: 247, column: 23, scope: !101)
!677 = !MDLocation(line: 252, column: 9, scope: !101)
!678 = !MDLocation(line: 247, column: 28, scope: !101)
!679 = !MDLocation(line: 247, column: 16, scope: !101)
!680 = !MDLocation(line: 254, column: 13, scope: !681)
!681 = !{!"0xb\00254\003\0025", !1, !682}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!682 = !{!"0xb\00254\003\0024", !1, !101}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!683 = !MDLocation(line: 254, column: 3, scope: !682)
!684 = !MDLocation(line: 257, column: 15, scope: !685)
!685 = !{!"0xb\00257\005\0028", !1, !686}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!686 = !{!"0xb\00257\005\0027", !1, !687}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!687 = !{!"0xb\00254\0024\0026", !1, !681}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!688 = !MDLocation(line: 284, column: 17, scope: !689)
!689 = !{!"0xb\00284\007\0037", !1, !690}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!690 = !{!"0xb\00284\007\0036", !1, !691}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!691 = !{!"0xb\00283\005\0035", !1, !692}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!692 = !{!"0xb\00283\005\0034", !1, !687}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!693 = !MDLocation(line: 285, column: 19, scope: !694)
!694 = !{!"0xb\00285\009\0039", !1, !695}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!695 = !{!"0xb\00285\009\0038", !1, !689}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!696 = !MDLocation(line: 286, column: 26, scope: !694)
!697 = !MDLocation(line: 286, column: 11, scope: !694)
!698 = !MDLocation(line: 260, column: 15, scope: !699)
!699 = !{!"0xb\00259\0032\0033", !1, !700}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!700 = !{!"0xb\00259\009\0032", !1, !701}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!701 = !{!"0xb\00259\009\0031", !1, !702}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!702 = !{!"0xb\00258\007\0030", !1, !703}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!703 = !{!"0xb\00258\007\0029", !1, !685}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!704 = !MDLocation(line: 263, column: 15, scope: !699)
!705 = !MDLocation(line: 272, column: 15, scope: !699)
!706 = !MDLocation(line: 275, column: 15, scope: !699)
!707 = !MDLocation(line: 277, column: 50, scope: !699)
!708 = !MDLocation(line: 257, column: 5, scope: !686)
!709 = !MDLocation(line: 260, column: 29, scope: !699)
!710 = !MDLocation(line: 283, column: 5, scope: !692)
!711 = !MDLocation(line: 284, column: 7, scope: !690)
!712 = !MDLocation(line: 258, column: 7, scope: !703)
!713 = !MDLocation(line: 265, column: 17, scope: !699)
!714 = !MDLocation(line: 259, column: 9, scope: !701)
!715 = !MDLocation(line: 258, column: 26, scope: !702)
!716 = !MDLocation(line: 261, column: 15, scope: !699)
!717 = !MDLocation(line: 261, column: 29, scope: !699)
!718 = !MDLocation(line: 262, column: 15, scope: !699)
!719 = !MDLocation(line: 262, column: 29, scope: !699)
!720 = !MDLocation(line: 264, column: 37, scope: !699)
!721 = !MDLocation(line: 266, column: 15, scope: !699)
!722 = !MDLocation(line: 267, column: 37, scope: !699)
!723 = !MDLocation(line: 269, column: 15, scope: !699)
!724 = !MDLocation(line: 270, column: 37, scope: !699)
!725 = !MDLocation(line: 273, column: 15, scope: !699)
!726 = !MDLocation(line: 274, column: 15, scope: !699)
!727 = !MDLocation(line: 277, column: 19, scope: !699)
!728 = !MDLocation(line: 280, column: 11, scope: !699)
!729 = !MDLocation(line: 264, column: 17, scope: !699)
!730 = !MDLocation(line: 265, column: 37, scope: !699)
!731 = !MDLocation(line: 267, column: 17, scope: !699)
!732 = !MDLocation(line: 268, column: 17, scope: !699)
!733 = !MDLocation(line: 268, column: 37, scope: !699)
!734 = !MDLocation(line: 270, column: 17, scope: !699)
!735 = !MDLocation(line: 271, column: 17, scope: !699)
!736 = !MDLocation(line: 271, column: 37, scope: !699)
!737 = !MDLocation(line: 272, column: 31, scope: !699)
!738 = !MDLocation(line: 273, column: 31, scope: !699)
!739 = !MDLocation(line: 274, column: 31, scope: !699)
!740 = !MDLocation(line: 248, column: 15, scope: !101)
!741 = !MDLocation(line: 277, column: 16, scope: !699)
!742 = !MDLocation(line: 277, column: 35, scope: !699)
!743 = !MDLocation(line: 277, column: 15, scope: !699)
!744 = !MDLocation(line: 248, column: 18, scope: !101)
!745 = !MDLocation(line: 279, column: 18, scope: !699)
!746 = !MDLocation(line: 279, column: 11, scope: !699)
!747 = !MDLocation(line: 248, column: 10, scope: !101)
!748 = !MDLocation(line: 280, column: 45, scope: !699)
!749 = !MDLocation(line: 280, column: 29, scope: !699)
!750 = !MDLocation(line: 247, column: 12, scope: !101)
!751 = !MDLocation(line: 247, column: 10, scope: !101)
!752 = !MDLocation(line: 285, column: 9, scope: !695)
!753 = distinct !{!753, !354}
!754 = distinct !{!754, !375, !376}
!755 = distinct !{!755, !354}
!756 = distinct !{!756, !375, !376}
!757 = !MDLocation(line: 284, column: 26, scope: !689)
!758 = !MDLocation(line: 283, column: 24, scope: !691)
!759 = !MDLocation(line: 254, column: 20, scope: !681)
!760 = !MDLocation(line: 290, column: 3, scope: !101)
!761 = !MDLocation(line: 208, column: 18, scope: !78)
!762 = !MDLocation(line: 210, column: 6, scope: !545)
!763 = !MDLocation(line: 210, column: 6, scope: !78)
!764 = !MDLocation(line: 211, column: 10, scope: !545)
!765 = !MDLocation(line: 211, column: 5, scope: !545)
!766 = !MDLocation(line: 217, column: 1, scope: !78)
!767 = !MDLocation(line: 213, column: 3, scope: !78)
!768 = !MDLocation(line: 144, column: 11, scope: !39)
!769 = !MDLocation(line: 144, column: 18, scope: !39)
!770 = !MDLocation(line: 144, column: 26, scope: !39)
!771 = !MDLocation(line: 146, column: 19, scope: !39)
!772 = !MDLocation(line: 146, column: 10, scope: !39)
!773 = !MDLocation(line: 146, column: 34, scope: !39)
!774 = !MDLocation(line: 146, column: 25, scope: !39)
!775 = !MDLocation(line: 146, column: 49, scope: !39)
!776 = !MDLocation(line: 146, column: 40, scope: !39)
!777 = !MDLocation(line: 146, column: 3, scope: !39)
!778 = !MDLocation(line: 150, column: 12, scope: !46)
!779 = !MDLocation(line: 150, column: 22, scope: !46)
!780 = !MDLocation(line: 150, column: 33, scope: !46)
!781 = !MDLocation(line: 152, column: 10, scope: !46)
!782 = !MDLocation(line: 152, column: 25, scope: !46)
!783 = !MDLocation(line: 152, column: 3, scope: !46)
!784 = !MDLocation(line: 156, column: 15, scope: !53)
!785 = !MDLocation(line: 156, column: 26, scope: !53)
!786 = !MDLocation(line: 158, column: 7, scope: !787)
!787 = !{!"0xb\00158\006\000", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!788 = !MDLocation(line: 158, column: 6, scope: !53)
!789 = !MDLocation(line: 158, column: 29, scope: !787)
!790 = !MDLocation(line: 159, column: 5, scope: !791)
!791 = !{!"0xb\00158\0047\001", !1, !787}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!792 = !{!181, !181, i64 0}
!793 = !MDLocation(line: 160, column: 5, scope: !791)
!794 = !MDLocation(line: 161, column: 5, scope: !791)
!795 = !MDLocation(line: 162, column: 5, scope: !791)
!796 = !MDLocation(line: 164, column: 7, scope: !797)
!797 = !{!"0xb\00164\006\002", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!798 = !MDLocation(line: 164, column: 6, scope: !53)
!799 = !MDLocation(line: 164, column: 28, scope: !797)
!800 = !MDLocation(line: 165, column: 5, scope: !801)
!801 = !{!"0xb\00164\0045\003", !1, !797}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!802 = !MDLocation(line: 166, column: 5, scope: !801)
!803 = !MDLocation(line: 167, column: 5, scope: !801)
!804 = !MDLocation(line: 168, column: 5, scope: !801)
!805 = !MDLocation(line: 170, column: 7, scope: !806)
!806 = !{!"0xb\00170\006\004", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!807 = !MDLocation(line: 170, column: 6, scope: !53)
!808 = !MDLocation(line: 170, column: 28, scope: !806)
!809 = !MDLocation(line: 171, column: 5, scope: !810)
!810 = !{!"0xb\00170\0045\005", !1, !806}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!811 = !MDLocation(line: 172, column: 5, scope: !810)
!812 = !MDLocation(line: 173, column: 5, scope: !810)
!813 = !MDLocation(line: 174, column: 5, scope: !810)
!814 = !MDLocation(line: 176, column: 7, scope: !815)
!815 = !{!"0xb\00176\006\006", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!816 = !MDLocation(line: 176, column: 6, scope: !53)
!817 = !MDLocation(line: 176, column: 28, scope: !815)
!818 = !MDLocation(line: 177, column: 5, scope: !819)
!819 = !{!"0xb\00176\0045\007", !1, !815}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!820 = !MDLocation(line: 178, column: 5, scope: !819)
!821 = !MDLocation(line: 179, column: 5, scope: !819)
!822 = !MDLocation(line: 180, column: 5, scope: !819)
!823 = !MDLocation(line: 182, column: 7, scope: !824)
!824 = !{!"0xb\00182\006\008", !1, !53}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!825 = !MDLocation(line: 182, column: 6, scope: !53)
!826 = !MDLocation(line: 182, column: 29, scope: !824)
!827 = !MDLocation(line: 183, column: 5, scope: !828)
!828 = !{!"0xb\00182\0047\009", !1, !824}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!829 = !MDLocation(line: 184, column: 5, scope: !828)
!830 = !MDLocation(line: 185, column: 5, scope: !828)
!831 = !MDLocation(line: 186, column: 5, scope: !828)
!832 = !MDLocation(line: 188, column: 5, scope: !833)
!833 = !{!"0xb\00187\0010\0010", !1, !824}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!834 = !MDLocation(line: 189, column: 5, scope: !833)
!835 = !MDLocation(line: 191, column: 1, scope: !53)
!836 = !MDLocation(line: 297, column: 18, scope: !123)
!837 = !MDLocation(line: 302, column: 3, scope: !123)
!838 = !MDLocation(line: 304, column: 6, scope: !839)
!839 = !{!"0xb\00304\006\0040", !1, !123}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!840 = !MDLocation(line: 304, column: 6, scope: !123)
!841 = !MDLocation(line: 306, column: 18, scope: !842)
!842 = !{!"0xb\00305\005\0041", !1, !839}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!843 = !{!844, !845, i64 0}
!844 = !{!"timeval", !845, i64 0, !845, i64 8}
!845 = !{!"long", !179, i64 0}
!846 = !MDLocation(line: 306, column: 7, scope: !842)
!847 = !MDLocation(line: 307, column: 19, scope: !842)
!848 = !MDLocation(line: 307, column: 7, scope: !842)
!849 = !MDLocation(line: 298, column: 10, scope: !123)
!850 = !MDLocation(line: 309, column: 3, scope: !842)
!851 = !MDLocation(line: 310, column: 29, scope: !852)
!852 = !{!"0xb\00309\0010\0042", !1, !839}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/himenobmtxpa.c]
!853 = !MDLocation(line: 310, column: 19, scope: !852)
!854 = !MDLocation(line: 310, column: 9, scope: !852)
!855 = !MDLocation(line: 311, column: 29, scope: !852)
!856 = !MDLocation(line: 311, column: 18, scope: !852)
!857 = !MDLocation(line: 311, column: 8, scope: !852)
!858 = !MDLocation(line: 311, column: 7, scope: !852)
!859 = !MDLocation(line: 314, column: 3, scope: !123)
