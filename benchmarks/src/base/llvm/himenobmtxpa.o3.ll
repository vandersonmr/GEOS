; ModuleID = 'himenobmtxpa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
.preheader.lr.ph.us.i.preheader:
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !13), !dbg !150
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !14), !dbg !150
  tail call void @llvm.dbg.declare(metadata !151, metadata !25), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !22), !dbg !154
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !23), !dbg !155
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !24), !dbg !157
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !19), !dbg !159
  tail call void @llvm.dbg.value(metadata !158, i64 0, metadata !20), !dbg !160
  tail call void @llvm.dbg.value(metadata !161, i64 0, metadata !21), !dbg !162
  %0 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0), i32 64, i32 64, i32 128) #6, !dbg !163
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 63, i32 63, i32 127) #6, !dbg !164
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !166) #6, !dbg !168
  tail call void @llvm.dbg.value(metadata !169, i64 0, metadata !170) #6, !dbg !168
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !171) #6, !dbg !168
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !172) #6, !dbg !168
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !173) #6, !dbg !168
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 1), align 8, !dbg !174, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 2), align 4, !dbg !181, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 3), align 8, !dbg !183, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @p, i64 0, i32 4), align 4, !dbg !185, !tbaa !186
  %2 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !187
  %3 = bitcast i8* %2 to float*, !dbg !187
  store float* %3, float** getelementptr inbounds (%struct.Mat* @p, i64 0, i32 0), align 8, !dbg !187, !tbaa !188
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !190) #6, !dbg !192
  tail call void @llvm.dbg.value(metadata !169, i64 0, metadata !193) #6, !dbg !192
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !194) #6, !dbg !192
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !195) #6, !dbg !192
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !196) #6, !dbg !192
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 1), align 8, !dbg !197, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 2), align 4, !dbg !198, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 3), align 8, !dbg !199, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 4), align 4, !dbg !200, !tbaa !186
  %4 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !201
  %5 = bitcast i8* %4 to float*, !dbg !201
  store float* %5, float** getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 0), align 8, !dbg !201, !tbaa !188
  tail call void @llvm.dbg.value(metadata !202, i64 0, metadata !203) #6, !dbg !205
  tail call void @llvm.dbg.value(metadata !169, i64 0, metadata !206) #6, !dbg !205
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !207) #6, !dbg !205
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !208) #6, !dbg !205
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !209) #6, !dbg !205
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 1), align 8, !dbg !210, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 2), align 4, !dbg !211, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 3), align 8, !dbg !212, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 4), align 4, !dbg !213, !tbaa !186
  %6 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !214
  %7 = bitcast i8* %6 to float*, !dbg !214
  store float* %7, float** getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 0), align 8, !dbg !214, !tbaa !188
  tail call void @llvm.dbg.value(metadata !215, i64 0, metadata !216) #6, !dbg !218
  tail call void @llvm.dbg.value(metadata !169, i64 0, metadata !219) #6, !dbg !218
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !220) #6, !dbg !218
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !221) #6, !dbg !218
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !222) #6, !dbg !218
  store i32 1, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 1), align 8, !dbg !223, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 2), align 4, !dbg !224, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 3), align 8, !dbg !225, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 4), align 4, !dbg !226, !tbaa !186
  %8 = tail call noalias i8* @malloc(i64 2097152) #6, !dbg !227
  %9 = bitcast i8* %8 to float*, !dbg !227
  store float* %9, float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !227, !tbaa !188
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !229) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !232, i64 0, metadata !233) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !234) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !235) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !236) #6, !dbg !231
  store i32 4, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 1), align 8, !dbg !237, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 2), align 4, !dbg !238, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 3), align 8, !dbg !239, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @a, i64 0, i32 4), align 4, !dbg !240, !tbaa !186
  %10 = tail call noalias i8* @malloc(i64 8388608) #6, !dbg !241
  %11 = bitcast i8* %10 to float*, !dbg !241
  store float* %11, float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !241, !tbaa !188
  tail call void @llvm.dbg.value(metadata !242, i64 0, metadata !243) #6, !dbg !245
  tail call void @llvm.dbg.value(metadata !246, i64 0, metadata !247) #6, !dbg !245
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !248) #6, !dbg !245
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !249) #6, !dbg !245
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !250) #6, !dbg !245
  store i32 3, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 1), align 8, !dbg !251, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 2), align 4, !dbg !252, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 3), align 8, !dbg !253, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @b, i64 0, i32 4), align 4, !dbg !254, !tbaa !186
  %12 = tail call noalias i8* @malloc(i64 6291456) #6, !dbg !255
  %13 = bitcast i8* %12 to float*, !dbg !255
  store float* %13, float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !255, !tbaa !188
  tail call void @llvm.dbg.value(metadata !256, i64 0, metadata !257) #6, !dbg !259
  tail call void @llvm.dbg.value(metadata !246, i64 0, metadata !260) #6, !dbg !259
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !261) #6, !dbg !259
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !262) #6, !dbg !259
  tail call void @llvm.dbg.value(metadata !156, i64 0, metadata !263) #6, !dbg !259
  store i32 3, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 1), align 8, !dbg !264, !tbaa !175
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 2), align 4, !dbg !265, !tbaa !182
  store i32 64, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 3), align 8, !dbg !266, !tbaa !184
  store i32 128, i32* getelementptr inbounds (%struct.Mat* @c, i64 0, i32 4), align 4, !dbg !267, !tbaa !186
  %14 = tail call noalias i8* @malloc(i64 6291456) #6, !dbg !268
  %15 = bitcast i8* %14 to float*, !dbg !268
  store float* %15, float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !268, !tbaa !188
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !269), !dbg !271
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !273), !dbg !274
  br label %.lr.ph.us.us.i.preheader, !dbg !276

._crit_edge4.us-lcssa.us15.i:                     ; preds = %middle.block
  %16 = add nsw i32 %i.05.us.i, 1, !dbg !274
  tail call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !273), !dbg !274
  %exitcond281 = icmp eq i32 %16, 64, !dbg !274
  br i1 %exitcond281, label %.preheader.lr.ph.i, label %.lr.ph.us.us.i.preheader, !dbg !274

.lr.ph.us.us.i.preheader:                         ; preds = %.preheader.lr.ph.us.i.preheader, %._crit_edge4.us-lcssa.us15.i
  %i.05.us.i = phi i32 [ %16, %._crit_edge4.us-lcssa.us15.i ], [ 0, %.preheader.lr.ph.us.i.preheader ]
  %17 = mul nsw i32 %i.05.us.i, %i.05.us.i, !dbg !279
  %18 = sitofp i32 %17 to float, !dbg !279
  %19 = fdiv float %18, 3.969000e+03, !dbg !279
  %20 = shl nsw i32 %i.05.us.i, 6, !dbg !279
  br label %.lr.ph.us.us.i, !dbg !279

.lr.ph.us.us.i:                                   ; preds = %middle.block, %.lr.ph.us.us.i.preheader
  %indvars.iv277 = phi i64 [ 0, %.lr.ph.us.us.i.preheader ], [ %indvars.iv.next278, %middle.block ]
  %21 = trunc i64 %indvars.iv277 to i32, !dbg !279
  %22 = add i32 %21, %20, !dbg !279
  %23 = shl i32 %22, 7, !dbg !279
  %24 = sext i32 %23 to i64, !dbg !276
  %broadcast.splatinsert286 = insertelement <4 x float> undef, float %19, i32 0
  %broadcast.splat287 = shufflevector <4 x float> %broadcast.splatinsert286, <4 x float> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.us.us.i
  %index = phi i64 [ 0, %.lr.ph.us.us.i ], [ %index.next, %vector.body ], !dbg !276
  %25 = add i64 %index, %24, !dbg !279
  %26 = getelementptr inbounds float* %3, i64 %25, !dbg !279
  %27 = bitcast float* %26 to <4 x float>*, !dbg !279
  store <4 x float> %broadcast.splat287, <4 x float>* %27, align 4, !dbg !279
  %.sum416 = or i64 %25, 4, !dbg !279
  %28 = getelementptr float* %3, i64 %.sum416, !dbg !279
  %29 = bitcast float* %28 to <4 x float>*, !dbg !279
  store <4 x float> %broadcast.splat287, <4 x float>* %29, align 4, !dbg !279
  %index.next = add i64 %index, 8, !dbg !276
  %30 = icmp eq i64 %index.next, 128, !dbg !276
  br i1 %30, label %middle.block, label %vector.body, !dbg !276, !llvm.loop !280

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next278 = add nuw nsw i64 %indvars.iv277, 1, !dbg !283
  %lftr.wideiv279 = trunc i64 %indvars.iv.next278 to i32, !dbg !283
  %exitcond280 = icmp eq i32 %lftr.wideiv279, 64, !dbg !283
  br i1 %exitcond280, label %._crit_edge4.us-lcssa.us15.i, label %.lr.ph.us.us.i, !dbg !283

.preheader.lr.ph.i:                               ; preds = %._crit_edge4.us-lcssa.us15.i, %._crit_edge4.i
  %i.05.i2 = phi i32 [ %42, %._crit_edge4.i ], [ 0, %._crit_edge4.us-lcssa.us15.i ]
  %31 = shl i32 %i.05.i2, 6, !dbg !284
  br label %.lr.ph.i, !dbg !289

.lr.ph.i:                                         ; preds = %.preheader.lr.ph.i, %._crit_edge.i
  %indvars.iv267 = phi i64 [ %indvars.iv.next268, %._crit_edge.i ], [ 0, %.preheader.lr.ph.i ]
  %32 = trunc i64 %indvars.iv267 to i32, !dbg !284
  %33 = add i32 %32, %31, !dbg !284
  %34 = shl i32 %33, 7, !dbg !284
  %35 = sext i32 %34 to i64, !dbg !290
  br label %vector.body289

vector.body289:                                   ; preds = %vector.body289, %.lr.ph.i
  %index292 = phi i64 [ 0, %.lr.ph.i ], [ %index.next296, %vector.body289 ], !dbg !290
  %36 = add i64 %index292, %35, !dbg !284
  %37 = getelementptr inbounds float* %5, i64 %36, !dbg !284
  %38 = bitcast float* %37 to <4 x float>*, !dbg !284
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %38, align 4, !dbg !284
  %.sum408417 = or i64 %36, 4, !dbg !284
  %39 = getelementptr float* %5, i64 %.sum408417, !dbg !284
  %40 = bitcast float* %39 to <4 x float>*, !dbg !284
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %40, align 4, !dbg !284
  %index.next296 = add i64 %index292, 8, !dbg !290
  %41 = icmp eq i64 %index.next296, 128, !dbg !290
  br i1 %41, label %._crit_edge.i, label %vector.body289, !dbg !290, !llvm.loop !291

._crit_edge.i:                                    ; preds = %vector.body289
  %indvars.iv.next268 = add nuw nsw i64 %indvars.iv267, 1, !dbg !289
  %lftr.wideiv269 = trunc i64 %indvars.iv.next268 to i32, !dbg !289
  %exitcond270 = icmp eq i32 %lftr.wideiv269, 64, !dbg !289
  br i1 %exitcond270, label %._crit_edge4.i, label %.lr.ph.i, !dbg !289

._crit_edge4.i:                                   ; preds = %._crit_edge.i
  %42 = add nsw i32 %i.05.i2, 1, !dbg !292
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !293), !dbg !292
  %exitcond271 = icmp eq i32 %42, 64, !dbg !292
  br i1 %exitcond271, label %.preheader.lr.ph.i7, label %.preheader.lr.ph.i, !dbg !292

.preheader.lr.ph.i7:                              ; preds = %._crit_edge4.i, %._crit_edge4.i13
  %i.05.i5 = phi i32 [ %48, %._crit_edge4.i13 ], [ 0, %._crit_edge4.i ]
  %43 = shl i32 %i.05.i5, 13, !dbg !294
  br label %._crit_edge.i12, !dbg !294

._crit_edge.i12:                                  ; preds = %._crit_edge.i12, %.preheader.lr.ph.i7
  %indvars.iv258 = phi i64 [ %indvars.iv.next259, %._crit_edge.i12 ], [ 0, %.preheader.lr.ph.i7 ]
  %44 = trunc i64 %indvars.iv258 to i32, !dbg !296
  %45 = shl i32 %44, 7, !dbg !296
  %46 = add i32 %43, %45, !dbg !296
  %47 = sext i32 %46 to i64
  %scevgep256 = getelementptr float* %7, i64 %47
  %scevgep256257 = bitcast float* %scevgep256 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep256257, i8 0, i64 512, i32 4, i1 false), !dbg !297
  %indvars.iv.next259 = add nuw nsw i64 %indvars.iv258, 1, !dbg !294
  %lftr.wideiv260 = trunc i64 %indvars.iv.next259 to i32, !dbg !294
  %exitcond261 = icmp eq i32 %lftr.wideiv260, 64, !dbg !294
  br i1 %exitcond261, label %._crit_edge4.i13, label %._crit_edge.i12, !dbg !294

._crit_edge4.i13:                                 ; preds = %._crit_edge.i12
  %48 = add nsw i32 %i.05.i5, 1, !dbg !298
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !299), !dbg !298
  %exitcond262 = icmp eq i32 %48, 64, !dbg !298
  br i1 %exitcond262, label %.preheader.lr.ph.i19, label %.preheader.lr.ph.i7, !dbg !298

.preheader.lr.ph.i19:                             ; preds = %._crit_edge4.i13, %._crit_edge4.i25
  %i.05.i17 = phi i32 [ %54, %._crit_edge4.i25 ], [ 0, %._crit_edge4.i13 ]
  %49 = shl i32 %i.05.i17, 13, !dbg !300
  br label %._crit_edge.i24, !dbg !300

._crit_edge.i24:                                  ; preds = %._crit_edge.i24, %.preheader.lr.ph.i19
  %indvars.iv247 = phi i64 [ %indvars.iv.next248, %._crit_edge.i24 ], [ 0, %.preheader.lr.ph.i19 ]
  %50 = trunc i64 %indvars.iv247 to i32, !dbg !302
  %51 = shl i32 %50, 7, !dbg !302
  %52 = add i32 %49, %51, !dbg !302
  %53 = sext i32 %52 to i64
  %scevgep245 = getelementptr float* %9, i64 %53
  %scevgep245246 = bitcast float* %scevgep245 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep245246, i8 0, i64 512, i32 4, i1 false), !dbg !303
  %indvars.iv.next248 = add nuw nsw i64 %indvars.iv247, 1, !dbg !300
  %lftr.wideiv249 = trunc i64 %indvars.iv.next248 to i32, !dbg !300
  %exitcond250 = icmp eq i32 %lftr.wideiv249, 64, !dbg !300
  br i1 %exitcond250, label %._crit_edge4.i25, label %._crit_edge.i24, !dbg !300

._crit_edge4.i25:                                 ; preds = %._crit_edge.i24
  %54 = add nsw i32 %i.05.i17, 1, !dbg !304
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !305), !dbg !304
  %exitcond251 = icmp eq i32 %54, 64, !dbg !304
  br i1 %exitcond251, label %.preheader.lr.ph.i31, label %.preheader.lr.ph.i19, !dbg !304

.preheader.lr.ph.i31:                             ; preds = %._crit_edge4.i25, %._crit_edge4.i37
  %i.05.i29 = phi i32 [ %66, %._crit_edge4.i37 ], [ 0, %._crit_edge4.i25 ]
  %55 = shl i32 %i.05.i29, 6, !dbg !306
  br label %.lr.ph.i34, !dbg !308

.lr.ph.i34:                                       ; preds = %.preheader.lr.ph.i31, %._crit_edge.i36
  %indvars.iv236 = phi i64 [ %indvars.iv.next237, %._crit_edge.i36 ], [ 0, %.preheader.lr.ph.i31 ]
  %56 = trunc i64 %indvars.iv236 to i32, !dbg !306
  %57 = add i32 %56, %55, !dbg !306
  %58 = shl i32 %57, 7, !dbg !306
  %59 = sext i32 %58 to i64, !dbg !309
  br label %vector.body304

vector.body304:                                   ; preds = %vector.body304, %.lr.ph.i34
  %index307 = phi i64 [ 0, %.lr.ph.i34 ], [ %index.next311, %vector.body304 ], !dbg !309
  %60 = add i64 %index307, %59, !dbg !306
  %61 = getelementptr inbounds float* %11, i64 %60, !dbg !306
  %62 = bitcast float* %61 to <4 x float>*, !dbg !306
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %62, align 4, !dbg !306
  %.sum409418 = or i64 %60, 4, !dbg !306
  %63 = getelementptr float* %11, i64 %.sum409418, !dbg !306
  %64 = bitcast float* %63 to <4 x float>*, !dbg !306
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %64, align 4, !dbg !306
  %index.next311 = add i64 %index307, 8, !dbg !309
  %65 = icmp eq i64 %index.next311, 128, !dbg !309
  br i1 %65, label %._crit_edge.i36, label %vector.body304, !dbg !309, !llvm.loop !310

._crit_edge.i36:                                  ; preds = %vector.body304
  %indvars.iv.next237 = add nuw nsw i64 %indvars.iv236, 1, !dbg !308
  %lftr.wideiv238 = trunc i64 %indvars.iv.next237 to i32, !dbg !308
  %exitcond239 = icmp eq i32 %lftr.wideiv238, 64, !dbg !308
  br i1 %exitcond239, label %._crit_edge4.i37, label %.lr.ph.i34, !dbg !308

._crit_edge4.i37:                                 ; preds = %._crit_edge.i36
  %66 = add nsw i32 %i.05.i29, 1, !dbg !311
  tail call void @llvm.dbg.value(metadata !{i32 %66}, i64 0, metadata !312), !dbg !311
  %exitcond240 = icmp eq i32 %66, 64, !dbg !311
  br i1 %exitcond240, label %.preheader.lr.ph.i43, label %.preheader.lr.ph.i31, !dbg !311

.preheader.lr.ph.i43:                             ; preds = %._crit_edge4.i37, %._crit_edge4.i49
  %i.05.i41 = phi i32 [ %79, %._crit_edge4.i49 ], [ 0, %._crit_edge4.i37 ]
  %67 = shl i32 %i.05.i41, 6, !dbg !313
  %68 = add i32 %67, 4096, !dbg !313
  br label %.lr.ph.i46, !dbg !315

.lr.ph.i46:                                       ; preds = %.preheader.lr.ph.i43, %._crit_edge.i48
  %indvars.iv227 = phi i64 [ %indvars.iv.next228, %._crit_edge.i48 ], [ 0, %.preheader.lr.ph.i43 ]
  %69 = trunc i64 %indvars.iv227 to i32, !dbg !313
  %70 = add i32 %69, %68, !dbg !313
  %71 = shl i32 %70, 7, !dbg !313
  %72 = sext i32 %71 to i64, !dbg !316
  br label %vector.body319

vector.body319:                                   ; preds = %vector.body319, %.lr.ph.i46
  %index322 = phi i64 [ 0, %.lr.ph.i46 ], [ %index.next326, %vector.body319 ], !dbg !316
  %73 = add i64 %index322, %72, !dbg !313
  %74 = getelementptr inbounds float* %11, i64 %73, !dbg !313
  %75 = bitcast float* %74 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %75, align 4, !dbg !313
  %.sum410419 = or i64 %73, 4, !dbg !313
  %76 = getelementptr float* %11, i64 %.sum410419, !dbg !313
  %77 = bitcast float* %76 to <4 x float>*, !dbg !313
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %77, align 4, !dbg !313
  %index.next326 = add i64 %index322, 8, !dbg !316
  %78 = icmp eq i64 %index.next326, 128, !dbg !316
  br i1 %78, label %._crit_edge.i48, label %vector.body319, !dbg !316, !llvm.loop !317

._crit_edge.i48:                                  ; preds = %vector.body319
  %indvars.iv.next228 = add nuw nsw i64 %indvars.iv227, 1, !dbg !315
  %lftr.wideiv229 = trunc i64 %indvars.iv.next228 to i32, !dbg !315
  %exitcond230 = icmp eq i32 %lftr.wideiv229, 64, !dbg !315
  br i1 %exitcond230, label %._crit_edge4.i49, label %.lr.ph.i46, !dbg !315

._crit_edge4.i49:                                 ; preds = %._crit_edge.i48
  %79 = add nsw i32 %i.05.i41, 1, !dbg !318
  tail call void @llvm.dbg.value(metadata !{i32 %79}, i64 0, metadata !319), !dbg !318
  %exitcond231 = icmp eq i32 %79, 64, !dbg !318
  br i1 %exitcond231, label %.preheader.lr.ph.i55, label %.preheader.lr.ph.i43, !dbg !318

.preheader.lr.ph.i55:                             ; preds = %._crit_edge4.i49, %._crit_edge4.i61
  %i.05.i53 = phi i32 [ %92, %._crit_edge4.i61 ], [ 0, %._crit_edge4.i49 ]
  %80 = shl i32 %i.05.i53, 6, !dbg !320
  %81 = add i32 %80, 8192, !dbg !320
  br label %.lr.ph.i58, !dbg !322

.lr.ph.i58:                                       ; preds = %.preheader.lr.ph.i55, %._crit_edge.i60
  %indvars.iv218 = phi i64 [ %indvars.iv.next219, %._crit_edge.i60 ], [ 0, %.preheader.lr.ph.i55 ]
  %82 = trunc i64 %indvars.iv218 to i32, !dbg !320
  %83 = add i32 %82, %81, !dbg !320
  %84 = shl i32 %83, 7, !dbg !320
  %85 = sext i32 %84 to i64, !dbg !323
  br label %vector.body334

vector.body334:                                   ; preds = %vector.body334, %.lr.ph.i58
  %index337 = phi i64 [ 0, %.lr.ph.i58 ], [ %index.next341, %vector.body334 ], !dbg !323
  %86 = add i64 %index337, %85, !dbg !320
  %87 = getelementptr inbounds float* %11, i64 %86, !dbg !320
  %88 = bitcast float* %87 to <4 x float>*, !dbg !320
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %88, align 4, !dbg !320
  %.sum411420 = or i64 %86, 4, !dbg !320
  %89 = getelementptr float* %11, i64 %.sum411420, !dbg !320
  %90 = bitcast float* %89 to <4 x float>*, !dbg !320
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %90, align 4, !dbg !320
  %index.next341 = add i64 %index337, 8, !dbg !323
  %91 = icmp eq i64 %index.next341, 128, !dbg !323
  br i1 %91, label %._crit_edge.i60, label %vector.body334, !dbg !323, !llvm.loop !324

._crit_edge.i60:                                  ; preds = %vector.body334
  %indvars.iv.next219 = add nuw nsw i64 %indvars.iv218, 1, !dbg !322
  %lftr.wideiv220 = trunc i64 %indvars.iv.next219 to i32, !dbg !322
  %exitcond221 = icmp eq i32 %lftr.wideiv220, 64, !dbg !322
  br i1 %exitcond221, label %._crit_edge4.i61, label %.lr.ph.i58, !dbg !322

._crit_edge4.i61:                                 ; preds = %._crit_edge.i60
  %92 = add nsw i32 %i.05.i53, 1, !dbg !325
  tail call void @llvm.dbg.value(metadata !{i32 %92}, i64 0, metadata !326), !dbg !325
  %exitcond222 = icmp eq i32 %92, 64, !dbg !325
  br i1 %exitcond222, label %.preheader.lr.ph.i67, label %.preheader.lr.ph.i55, !dbg !325

.preheader.lr.ph.i67:                             ; preds = %._crit_edge4.i61, %._crit_edge4.i73
  %i.05.i65 = phi i32 [ %105, %._crit_edge4.i73 ], [ 0, %._crit_edge4.i61 ]
  %93 = shl i32 %i.05.i65, 6, !dbg !327
  %94 = add i32 %93, 12288, !dbg !327
  br label %.lr.ph.i70, !dbg !329

.lr.ph.i70:                                       ; preds = %.preheader.lr.ph.i67, %._crit_edge.i72
  %indvars.iv209 = phi i64 [ %indvars.iv.next210, %._crit_edge.i72 ], [ 0, %.preheader.lr.ph.i67 ]
  %95 = trunc i64 %indvars.iv209 to i32, !dbg !327
  %96 = add i32 %95, %94, !dbg !327
  %97 = shl i32 %96, 7, !dbg !327
  %98 = sext i32 %97 to i64, !dbg !330
  br label %vector.body349

vector.body349:                                   ; preds = %vector.body349, %.lr.ph.i70
  %index352 = phi i64 [ 0, %.lr.ph.i70 ], [ %index.next356, %vector.body349 ], !dbg !330
  %99 = add i64 %index352, %98, !dbg !327
  %100 = getelementptr inbounds float* %11, i64 %99, !dbg !327
  %101 = bitcast float* %100 to <4 x float>*, !dbg !327
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %101, align 4, !dbg !327
  %.sum412421 = or i64 %99, 4, !dbg !327
  %102 = getelementptr float* %11, i64 %.sum412421, !dbg !327
  %103 = bitcast float* %102 to <4 x float>*, !dbg !327
  store <4 x float> <float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000, float 0x3FC5555560000000>, <4 x float>* %103, align 4, !dbg !327
  %index.next356 = add i64 %index352, 8, !dbg !330
  %104 = icmp eq i64 %index.next356, 128, !dbg !330
  br i1 %104, label %._crit_edge.i72, label %vector.body349, !dbg !330, !llvm.loop !331

._crit_edge.i72:                                  ; preds = %vector.body349
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1, !dbg !329
  %lftr.wideiv211 = trunc i64 %indvars.iv.next210 to i32, !dbg !329
  %exitcond212 = icmp eq i32 %lftr.wideiv211, 64, !dbg !329
  br i1 %exitcond212, label %._crit_edge4.i73, label %.lr.ph.i70, !dbg !329

._crit_edge4.i73:                                 ; preds = %._crit_edge.i72
  %105 = add nsw i32 %i.05.i65, 1, !dbg !332
  tail call void @llvm.dbg.value(metadata !{i32 %105}, i64 0, metadata !333), !dbg !332
  %exitcond213 = icmp eq i32 %105, 64, !dbg !332
  br i1 %exitcond213, label %.preheader.lr.ph.i78, label %.preheader.lr.ph.i67, !dbg !332

.preheader.lr.ph.i78:                             ; preds = %._crit_edge4.i73, %._crit_edge4.i84
  %i.05.i76 = phi i32 [ %111, %._crit_edge4.i84 ], [ 0, %._crit_edge4.i73 ]
  %106 = shl i32 %i.05.i76, 13, !dbg !334
  br label %._crit_edge.i83, !dbg !334

._crit_edge.i83:                                  ; preds = %._crit_edge.i83, %.preheader.lr.ph.i78
  %indvars.iv200 = phi i64 [ %indvars.iv.next201, %._crit_edge.i83 ], [ 0, %.preheader.lr.ph.i78 ]
  %107 = trunc i64 %indvars.iv200 to i32, !dbg !336
  %108 = shl i32 %107, 7, !dbg !336
  %109 = add i32 %106, %108, !dbg !336
  %110 = sext i32 %109 to i64
  %scevgep198 = getelementptr float* %13, i64 %110
  %scevgep198199 = bitcast float* %scevgep198 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep198199, i8 0, i64 512, i32 4, i1 false), !dbg !337
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1, !dbg !334
  %lftr.wideiv202 = trunc i64 %indvars.iv.next201 to i32, !dbg !334
  %exitcond203 = icmp eq i32 %lftr.wideiv202, 64, !dbg !334
  br i1 %exitcond203, label %._crit_edge4.i84, label %._crit_edge.i83, !dbg !334

._crit_edge4.i84:                                 ; preds = %._crit_edge.i83
  %111 = add nsw i32 %i.05.i76, 1, !dbg !338
  tail call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !339), !dbg !338
  %exitcond204 = icmp eq i32 %111, 64, !dbg !338
  br i1 %exitcond204, label %.preheader.lr.ph.i133, label %.preheader.lr.ph.i78, !dbg !338

.preheader.lr.ph.i133:                            ; preds = %._crit_edge4.i84, %._crit_edge4.i139
  %i.05.i131 = phi i32 [ %118, %._crit_edge4.i139 ], [ 0, %._crit_edge4.i84 ]
  %112 = shl i32 %i.05.i131, 13, !dbg !340
  %113 = add i32 %112, 524288, !dbg !340
  br label %._crit_edge.i138, !dbg !340

._crit_edge.i138:                                 ; preds = %._crit_edge.i138, %.preheader.lr.ph.i133
  %indvars.iv189 = phi i64 [ %indvars.iv.next190, %._crit_edge.i138 ], [ 0, %.preheader.lr.ph.i133 ]
  %114 = trunc i64 %indvars.iv189 to i32, !dbg !342
  %115 = shl i32 %114, 7, !dbg !342
  %116 = add i32 %113, %115, !dbg !342
  %117 = sext i32 %116 to i64
  %scevgep187 = getelementptr float* %13, i64 %117
  %scevgep187188 = bitcast float* %scevgep187 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep187188, i8 0, i64 512, i32 4, i1 false), !dbg !343
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1, !dbg !340
  %lftr.wideiv191 = trunc i64 %indvars.iv.next190 to i32, !dbg !340
  %exitcond192 = icmp eq i32 %lftr.wideiv191, 64, !dbg !340
  br i1 %exitcond192, label %._crit_edge4.i139, label %._crit_edge.i138, !dbg !340

._crit_edge4.i139:                                ; preds = %._crit_edge.i138
  %118 = add nsw i32 %i.05.i131, 1, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !345), !dbg !344
  %exitcond193 = icmp eq i32 %118, 64, !dbg !344
  br i1 %exitcond193, label %.preheader.lr.ph.i122, label %.preheader.lr.ph.i133, !dbg !344

.preheader.lr.ph.i122:                            ; preds = %._crit_edge4.i139, %._crit_edge4.i128
  %i.05.i120 = phi i32 [ %125, %._crit_edge4.i128 ], [ 0, %._crit_edge4.i139 ]
  %119 = shl i32 %i.05.i120, 13, !dbg !346
  %120 = add i32 %119, 1048576, !dbg !346
  br label %._crit_edge.i127, !dbg !346

._crit_edge.i127:                                 ; preds = %._crit_edge.i127, %.preheader.lr.ph.i122
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge.i127 ], [ 0, %.preheader.lr.ph.i122 ]
  %121 = trunc i64 %indvars.iv178 to i32, !dbg !348
  %122 = shl i32 %121, 7, !dbg !348
  %123 = add i32 %120, %122, !dbg !348
  %124 = sext i32 %123 to i64
  %scevgep = getelementptr float* %13, i64 %124
  %scevgep177 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep177, i8 0, i64 512, i32 4, i1 false), !dbg !349
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1, !dbg !346
  %lftr.wideiv180 = trunc i64 %indvars.iv.next179 to i32, !dbg !346
  %exitcond181 = icmp eq i32 %lftr.wideiv180, 64, !dbg !346
  br i1 %exitcond181, label %._crit_edge4.i128, label %._crit_edge.i127, !dbg !346

._crit_edge4.i128:                                ; preds = %._crit_edge.i127
  %125 = add nsw i32 %i.05.i120, 1, !dbg !350
  tail call void @llvm.dbg.value(metadata !{i32 %125}, i64 0, metadata !351), !dbg !350
  %exitcond182 = icmp eq i32 %125, 64, !dbg !350
  br i1 %exitcond182, label %.preheader.lr.ph.i111, label %.preheader.lr.ph.i122, !dbg !350

.preheader.lr.ph.i111:                            ; preds = %._crit_edge4.i128, %._crit_edge4.i117
  %i.05.i109 = phi i32 [ %137, %._crit_edge4.i117 ], [ 0, %._crit_edge4.i128 ]
  %126 = shl i32 %i.05.i109, 6, !dbg !352
  br label %.lr.ph.i114, !dbg !354

.lr.ph.i114:                                      ; preds = %.preheader.lr.ph.i111, %._crit_edge.i116
  %indvars.iv168 = phi i64 [ %indvars.iv.next169, %._crit_edge.i116 ], [ 0, %.preheader.lr.ph.i111 ]
  %127 = trunc i64 %indvars.iv168 to i32, !dbg !352
  %128 = add i32 %127, %126, !dbg !352
  %129 = shl i32 %128, 7, !dbg !352
  %130 = sext i32 %129 to i64, !dbg !355
  br label %vector.body364

vector.body364:                                   ; preds = %vector.body364, %.lr.ph.i114
  %index367 = phi i64 [ 0, %.lr.ph.i114 ], [ %index.next371, %vector.body364 ], !dbg !355
  %131 = add i64 %index367, %130, !dbg !352
  %132 = getelementptr inbounds float* %15, i64 %131, !dbg !352
  %133 = bitcast float* %132 to <4 x float>*, !dbg !352
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %133, align 4, !dbg !352
  %.sum413422 = or i64 %131, 4, !dbg !352
  %134 = getelementptr float* %15, i64 %.sum413422, !dbg !352
  %135 = bitcast float* %134 to <4 x float>*, !dbg !352
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %135, align 4, !dbg !352
  %index.next371 = add i64 %index367, 8, !dbg !355
  %136 = icmp eq i64 %index.next371, 128, !dbg !355
  br i1 %136, label %._crit_edge.i116, label %vector.body364, !dbg !355, !llvm.loop !356

._crit_edge.i116:                                 ; preds = %vector.body364
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1, !dbg !354
  %lftr.wideiv170 = trunc i64 %indvars.iv.next169 to i32, !dbg !354
  %exitcond171 = icmp eq i32 %lftr.wideiv170, 64, !dbg !354
  br i1 %exitcond171, label %._crit_edge4.i117, label %.lr.ph.i114, !dbg !354

._crit_edge4.i117:                                ; preds = %._crit_edge.i116
  %137 = add nsw i32 %i.05.i109, 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !358), !dbg !357
  %exitcond172 = icmp eq i32 %137, 64, !dbg !357
  br i1 %exitcond172, label %.preheader.lr.ph.i100, label %.preheader.lr.ph.i111, !dbg !357

.preheader.lr.ph.i100:                            ; preds = %._crit_edge4.i117, %._crit_edge4.i106
  %i.05.i98 = phi i32 [ %150, %._crit_edge4.i106 ], [ 0, %._crit_edge4.i117 ]
  %138 = shl i32 %i.05.i98, 6, !dbg !359
  %139 = add i32 %138, 4096, !dbg !359
  br label %.lr.ph.i103, !dbg !361

.lr.ph.i103:                                      ; preds = %.preheader.lr.ph.i100, %._crit_edge.i105
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %._crit_edge.i105 ], [ 0, %.preheader.lr.ph.i100 ]
  %140 = trunc i64 %indvars.iv159 to i32, !dbg !359
  %141 = add i32 %140, %139, !dbg !359
  %142 = shl i32 %141, 7, !dbg !359
  %143 = sext i32 %142 to i64, !dbg !362
  br label %vector.body379

vector.body379:                                   ; preds = %vector.body379, %.lr.ph.i103
  %index382 = phi i64 [ 0, %.lr.ph.i103 ], [ %index.next386, %vector.body379 ], !dbg !362
  %144 = add i64 %index382, %143, !dbg !359
  %145 = getelementptr inbounds float* %15, i64 %144, !dbg !359
  %146 = bitcast float* %145 to <4 x float>*, !dbg !359
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %146, align 4, !dbg !359
  %.sum414423 = or i64 %144, 4, !dbg !359
  %147 = getelementptr float* %15, i64 %.sum414423, !dbg !359
  %148 = bitcast float* %147 to <4 x float>*, !dbg !359
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %148, align 4, !dbg !359
  %index.next386 = add i64 %index382, 8, !dbg !362
  %149 = icmp eq i64 %index.next386, 128, !dbg !362
  br i1 %149, label %._crit_edge.i105, label %vector.body379, !dbg !362, !llvm.loop !363

._crit_edge.i105:                                 ; preds = %vector.body379
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1, !dbg !361
  %lftr.wideiv161 = trunc i64 %indvars.iv.next160 to i32, !dbg !361
  %exitcond162 = icmp eq i32 %lftr.wideiv161, 64, !dbg !361
  br i1 %exitcond162, label %._crit_edge4.i106, label %.lr.ph.i103, !dbg !361

._crit_edge4.i106:                                ; preds = %._crit_edge.i105
  %150 = add nsw i32 %i.05.i98, 1, !dbg !364
  tail call void @llvm.dbg.value(metadata !{i32 %150}, i64 0, metadata !365), !dbg !364
  %exitcond163 = icmp eq i32 %150, 64, !dbg !364
  br i1 %exitcond163, label %.preheader.lr.ph.i89, label %.preheader.lr.ph.i100, !dbg !364

.preheader.lr.ph.i89:                             ; preds = %._crit_edge4.i106, %._crit_edge4.i95
  %i.05.i87 = phi i32 [ %163, %._crit_edge4.i95 ], [ 0, %._crit_edge4.i106 ]
  %151 = shl i32 %i.05.i87, 6, !dbg !366
  %152 = add i32 %151, 8192, !dbg !366
  br label %.lr.ph.i92, !dbg !368

.lr.ph.i92:                                       ; preds = %.preheader.lr.ph.i89, %._crit_edge.i94
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge.i94 ], [ 0, %.preheader.lr.ph.i89 ]
  %153 = trunc i64 %indvars.iv150 to i32, !dbg !366
  %154 = add i32 %153, %152, !dbg !366
  %155 = shl i32 %154, 7, !dbg !366
  %156 = sext i32 %155 to i64, !dbg !369
  br label %vector.body394

vector.body394:                                   ; preds = %vector.body394, %.lr.ph.i92
  %index397 = phi i64 [ 0, %.lr.ph.i92 ], [ %index.next401, %vector.body394 ], !dbg !369
  %157 = add i64 %index397, %156, !dbg !366
  %158 = getelementptr inbounds float* %15, i64 %157, !dbg !366
  %159 = bitcast float* %158 to <4 x float>*, !dbg !366
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %159, align 4, !dbg !366
  %.sum415424 = or i64 %157, 4, !dbg !366
  %160 = getelementptr float* %15, i64 %.sum415424, !dbg !366
  %161 = bitcast float* %160 to <4 x float>*, !dbg !366
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %161, align 4, !dbg !366
  %index.next401 = add i64 %index397, 8, !dbg !369
  %162 = icmp eq i64 %index.next401, 128, !dbg !369
  br i1 %162, label %._crit_edge.i94, label %vector.body394, !dbg !369, !llvm.loop !370

._crit_edge.i94:                                  ; preds = %vector.body394
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1, !dbg !368
  %lftr.wideiv152 = trunc i64 %indvars.iv.next151 to i32, !dbg !368
  %exitcond153 = icmp eq i32 %lftr.wideiv152, 64, !dbg !368
  br i1 %exitcond153, label %._crit_edge4.i95, label %.lr.ph.i92, !dbg !368

._crit_edge4.i95:                                 ; preds = %._crit_edge.i94
  %163 = add nsw i32 %i.05.i87, 1, !dbg !371
  tail call void @llvm.dbg.value(metadata !{i32 %163}, i64 0, metadata !372), !dbg !371
  %exitcond154 = icmp eq i32 %163, 64, !dbg !371
  br i1 %exitcond154, label %mat_set.exit96, label %.preheader.lr.ph.i89, !dbg !371

mat_set.exit96:                                   ; preds = %._crit_edge4.i95
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !18), !dbg !373
  %164 = tail call float @jacobi(i32 64, %struct.Mat* @a, %struct.Mat* @b, %struct.Mat* @c, %struct.Mat* @p, %struct.Mat* @bnd, %struct.Mat* @wrk1, %struct.Mat* @wrk2), !dbg !374
  tail call void @llvm.dbg.value(metadata !{float %164}, i64 0, metadata !29), !dbg !374
  %165 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 64) #6, !dbg !375
  %166 = fpext float %164 to double, !dbg !376
  %167 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), double %166) #6, !dbg !376
  tail call void @llvm.dbg.value(metadata !165, i64 0, metadata !377) #6, !dbg !379
  %168 = load float** getelementptr inbounds (%struct.Mat* @p, i64 0, i32 0), align 8, !dbg !380, !tbaa !188
  %169 = icmp eq float* %168, null, !dbg !380
  br i1 %169, label %clearMat.exit63, label %170, !dbg !380

; <label>:170                                     ; preds = %mat_set.exit96
  %171 = bitcast float* %168 to i8*, !dbg !382
  tail call void @free(i8* %171) #6, !dbg !382
  br label %clearMat.exit63, !dbg !382

clearMat.exit63:                                  ; preds = %mat_set.exit96, %170
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @p to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !383
  tail call void @llvm.dbg.value(metadata !189, i64 0, metadata !384) #6, !dbg !386
  %172 = load float** getelementptr inbounds (%struct.Mat* @bnd, i64 0, i32 0), align 8, !dbg !387, !tbaa !188
  %173 = icmp eq float* %172, null, !dbg !387
  br i1 %173, label %clearMat.exit51, label %174, !dbg !387

; <label>:174                                     ; preds = %clearMat.exit63
  %175 = bitcast float* %172 to i8*, !dbg !388
  tail call void @free(i8* %175) #6, !dbg !388
  br label %clearMat.exit51, !dbg !388

clearMat.exit51:                                  ; preds = %clearMat.exit63, %174
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @bnd to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !389
  tail call void @llvm.dbg.value(metadata !202, i64 0, metadata !390) #6, !dbg !392
  %176 = load float** getelementptr inbounds (%struct.Mat* @wrk1, i64 0, i32 0), align 8, !dbg !393, !tbaa !188
  %177 = icmp eq float* %176, null, !dbg !393
  br i1 %177, label %clearMat.exit39, label %178, !dbg !393

; <label>:178                                     ; preds = %clearMat.exit51
  %179 = bitcast float* %176 to i8*, !dbg !394
  tail call void @free(i8* %179) #6, !dbg !394
  br label %clearMat.exit39, !dbg !394

clearMat.exit39:                                  ; preds = %clearMat.exit51, %178
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk1 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !395
  tail call void @llvm.dbg.value(metadata !215, i64 0, metadata !396) #6, !dbg !398
  %180 = load float** getelementptr inbounds (%struct.Mat* @wrk2, i64 0, i32 0), align 8, !dbg !399, !tbaa !188
  %181 = icmp eq float* %180, null, !dbg !399
  br i1 %181, label %clearMat.exit27, label %182, !dbg !399

; <label>:182                                     ; preds = %clearMat.exit39
  %183 = bitcast float* %180 to i8*, !dbg !400
  tail call void @free(i8* %183) #6, !dbg !400
  br label %clearMat.exit27, !dbg !400

clearMat.exit27:                                  ; preds = %clearMat.exit39, %182
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @wrk2 to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !401
  tail call void @llvm.dbg.value(metadata !228, i64 0, metadata !402) #6, !dbg !404
  %184 = load float** getelementptr inbounds (%struct.Mat* @a, i64 0, i32 0), align 8, !dbg !405, !tbaa !188
  %185 = icmp eq float* %184, null, !dbg !405
  br i1 %185, label %clearMat.exit15, label %186, !dbg !405

; <label>:186                                     ; preds = %clearMat.exit27
  %187 = bitcast float* %184 to i8*, !dbg !406
  tail call void @free(i8* %187) #6, !dbg !406
  br label %clearMat.exit15, !dbg !406

clearMat.exit15:                                  ; preds = %clearMat.exit27, %186
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @a to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !407
  tail call void @llvm.dbg.value(metadata !242, i64 0, metadata !408) #6, !dbg !410
  %188 = load float** getelementptr inbounds (%struct.Mat* @b, i64 0, i32 0), align 8, !dbg !411, !tbaa !188
  %189 = icmp eq float* %188, null, !dbg !411
  br i1 %189, label %clearMat.exit3, label %190, !dbg !411

; <label>:190                                     ; preds = %clearMat.exit15
  %191 = bitcast float* %188 to i8*, !dbg !412
  tail call void @free(i8* %191) #6, !dbg !412
  br label %clearMat.exit3, !dbg !412

clearMat.exit3:                                   ; preds = %clearMat.exit15, %190
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @b to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !413
  tail call void @llvm.dbg.value(metadata !256, i64 0, metadata !414) #6, !dbg !416
  %192 = load float** getelementptr inbounds (%struct.Mat* @c, i64 0, i32 0), align 8, !dbg !417, !tbaa !188
  %193 = icmp eq float* %192, null, !dbg !417
  br i1 %193, label %clearMat.exit, label %194, !dbg !417

; <label>:194                                     ; preds = %clearMat.exit3
  %195 = bitcast float* %192 to i8*, !dbg !418
  tail call void @free(i8* %195) #6, !dbg !418
  br label %clearMat.exit, !dbg !418

clearMat.exit:                                    ; preds = %clearMat.exit3, %194
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.Mat* @c to i8*), i8 0, i64 24, i32 8, i1 false) #6, !dbg !419
  ret i32 0, !dbg !420
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @newMat(%struct.Mat* nocapture %Mat, i32 %mnums, i32 %mrows, i32 %mcols, i32 %mdeps) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !71), !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %mnums}, i64 0, metadata !72), !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %mrows}, i64 0, metadata !73), !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %mcols}, i64 0, metadata !74), !dbg !421
  tail call void @llvm.dbg.value(metadata !{i32 %mdeps}, i64 0, metadata !75), !dbg !421
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 1, !dbg !422
  store i32 %mnums, i32* %1, align 4, !dbg !422, !tbaa !175
  %2 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !423
  store i32 %mrows, i32* %2, align 4, !dbg !423, !tbaa !182
  %3 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !424
  store i32 %mcols, i32* %3, align 4, !dbg !424, !tbaa !184
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !425
  store i32 %mdeps, i32* %4, align 4, !dbg !425, !tbaa !186
  %5 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !426
  %6 = mul nsw i32 %mrows, %mnums, !dbg !427
  %7 = mul nsw i32 %6, %mcols, !dbg !427
  %8 = mul nsw i32 %7, %mdeps, !dbg !427
  %9 = sext i32 %8 to i64, !dbg !427
  %10 = shl nsw i64 %9, 2, !dbg !427
  %11 = tail call noalias i8* @malloc(i64 %10) #6, !dbg !427
  %12 = bitcast i8* %11 to float*, !dbg !427
  store float* %12, float** %5, align 8, !dbg !427, !tbaa !188
  %13 = icmp ne i8* %11, null, !dbg !428
  %14 = zext i1 %13 to i32, !dbg !428
  ret i32 %14, !dbg !428
}

; Function Attrs: nounwind uwtable
define void @mat_set_init(%struct.Mat* nocapture readonly %Mat) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !93), !dbg !429
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !94), !dbg !430
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !430
  %2 = load i32* %1, align 4, !dbg !430, !tbaa !182
  %3 = icmp sgt i32 %2, 0, !dbg !430
  br i1 %3, label %.preheader1.lr.ph, label %._crit_edge8, !dbg !430

.preheader1.lr.ph:                                ; preds = %0
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !431
  %5 = load i32* %4, align 4, !dbg !431, !tbaa !184
  %6 = icmp sgt i32 %5, 0, !dbg !431
  %7 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !432
  %8 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !433
  br i1 %6, label %.preheader.lr.ph.us, label %.preheader17

.preheader17:                                     ; preds = %.preheader1.lr.ph
  %n.vec = and i32 %2, -32, !dbg !430
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !430
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.preheader17, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %.preheader17 ], !dbg !430
  %index.next = add i32 %index, 32, !dbg !430
  %9 = icmp eq i32 %index.next, %n.vec, !dbg !430
  br i1 %9, label %middle.block, label %vector.body, !dbg !430, !llvm.loop !434

middle.block:                                     ; preds = %vector.body, %.preheader17
  %resume.val = phi i32 [ 0, %.preheader17 ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i32 %2, %resume.val
  br i1 %cmp.n, label %._crit_edge8, label %scalar.ph

._crit_edge4.us-lcssa.us15:                       ; preds = %scalar.ph41, %middle.block40, %19
  %10 = add nsw i32 %i.05.us, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !94), !dbg !430
  %11 = icmp slt i32 %10, %2, !dbg !430
  br i1 %11, label %.preheader.lr.ph.us, label %._crit_edge8, !dbg !430

scalar.ph41:                                      ; preds = %middle.block40, %scalar.ph41
  %j.03.us11 = phi i32 [ %12, %scalar.ph41 ], [ %resume.val48, %middle.block40 ]
  %12 = add nsw i32 %j.03.us11, 1, !dbg !431
  tail call void @llvm.dbg.value(metadata !{i32 %12}, i64 0, metadata !95), !dbg !431
  %13 = icmp slt i32 %12, %5, !dbg !431
  br i1 %13, label %scalar.ph41, label %._crit_edge4.us-lcssa.us15, !dbg !431, !llvm.loop !435

.preheader.lr.ph.us:                              ; preds = %.preheader1.lr.ph, %._crit_edge4.us-lcssa.us15
  %i.05.us = phi i32 [ %10, %._crit_edge4.us-lcssa.us15 ], [ 0, %.preheader1.lr.ph ]
  %14 = load i32* %7, align 4, !dbg !432, !tbaa !186
  %15 = icmp sgt i32 %14, 0, !dbg !432
  %16 = mul nsw i32 %i.05.us, %i.05.us, !dbg !433
  %17 = sitofp i32 %16 to float, !dbg !433
  br i1 %15, label %.lr.ph.us.us, label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph.us
  %n.vec45 = and i32 %5, -32, !dbg !431
  %cmp.zero47 = icmp eq i32 %n.vec45, 0, !dbg !431
  br i1 %cmp.zero47, label %middle.block40, label %vector.body39

vector.body39:                                    ; preds = %.preheader, %vector.body39
  %index42 = phi i32 [ %index.next51, %vector.body39 ], [ 0, %.preheader ], !dbg !431
  %index.next51 = add i32 %index42, 32, !dbg !431
  %18 = icmp eq i32 %index.next51, %n.vec45, !dbg !431
  br i1 %18, label %middle.block40, label %vector.body39, !dbg !431, !llvm.loop !436

middle.block40:                                   ; preds = %vector.body39, %.preheader
  %resume.val48 = phi i32 [ 0, %.preheader ], [ %n.vec45, %vector.body39 ]
  %cmp.n50 = icmp eq i32 %5, %resume.val48
  br i1 %cmp.n50, label %._crit_edge4.us-lcssa.us15, label %scalar.ph41

; <label>:19                                      ; preds = %middle.block24, %scalar.ph25
  %20 = add nsw i32 %j.03.us.us, 1, !dbg !431
  tail call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !95), !dbg !431
  %21 = icmp slt i32 %20, %5, !dbg !431
  br i1 %21, label %.lr.ph.us.us, label %._crit_edge4.us-lcssa.us15, !dbg !431

.lr.ph.us.us:                                     ; preds = %.preheader.lr.ph.us, %19
  %j.03.us.us = phi i32 [ %20, %19 ], [ 0, %.preheader.lr.ph.us ]
  %22 = add nsw i32 %2, -1, !dbg !433
  %23 = mul nsw i32 %22, %22, !dbg !433
  %24 = sitofp i32 %23 to float, !dbg !433
  %25 = fdiv float %17, %24, !dbg !433
  %26 = mul nsw i32 %5, %i.05.us, !dbg !433
  %27 = add i32 %26, %j.03.us.us, !dbg !433
  %28 = load float** %8, align 8, !dbg !433, !tbaa !188
  %n.vec29 = and i32 %14, -2, !dbg !432
  %cmp.zero31 = icmp eq i32 %n.vec29, 0, !dbg !432
  br i1 %cmp.zero31, label %middle.block24, label %vector.body23

vector.body23:                                    ; preds = %.lr.ph.us.us, %vector.body23
  %index26 = phi i32 [ %index.next35, %vector.body23 ], [ 0, %.lr.ph.us.us ], !dbg !432
  %induction3758 = or i32 %index26, 1
  %29 = mul i32 %27, %14, !dbg !433
  %30 = mul i32 %27, %14, !dbg !433
  %31 = add nsw i32 %29, %index26, !dbg !433
  %32 = add nsw i32 %30, %induction3758, !dbg !433
  %33 = sext i32 %31 to i64, !dbg !433
  %34 = sext i32 %32 to i64, !dbg !433
  %35 = getelementptr inbounds float* %28, i64 %33, !dbg !433
  %36 = getelementptr inbounds float* %28, i64 %34, !dbg !433
  store float %25, float* %35, align 4, !dbg !433, !tbaa !437
  store float %25, float* %36, align 4, !dbg !433, !tbaa !437
  %index.next35 = add i32 %index26, 2, !dbg !432
  %37 = icmp eq i32 %index.next35, %n.vec29, !dbg !432
  br i1 %37, label %middle.block24, label %vector.body23, !dbg !432, !llvm.loop !439

middle.block24:                                   ; preds = %vector.body23, %.lr.ph.us.us
  %resume.val32 = phi i32 [ 0, %.lr.ph.us.us ], [ %n.vec29, %vector.body23 ]
  %cmp.n34 = icmp eq i32 %14, %resume.val32
  br i1 %cmp.n34, label %19, label %scalar.ph25

scalar.ph25:                                      ; preds = %middle.block24, %scalar.ph25
  %k.02.us.us = phi i32 [ %42, %scalar.ph25 ], [ %resume.val32, %middle.block24 ]
  %38 = mul i32 %27, %14, !dbg !433
  %39 = add nsw i32 %38, %k.02.us.us, !dbg !433
  %40 = sext i32 %39 to i64, !dbg !433
  %41 = getelementptr inbounds float* %28, i64 %40, !dbg !433
  store float %25, float* %41, align 4, !dbg !433, !tbaa !437
  %42 = add nsw i32 %k.02.us.us, 1, !dbg !432
  tail call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !96), !dbg !432
  %43 = icmp slt i32 %42, %14, !dbg !432
  br i1 %43, label %scalar.ph25, label %19, !dbg !432, !llvm.loop !440

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %i.05 = phi i32 [ %44, %scalar.ph ], [ %resume.val, %middle.block ]
  %44 = add nsw i32 %i.05, 1, !dbg !430
  tail call void @llvm.dbg.value(metadata !{i32 %44}, i64 0, metadata !94), !dbg !430
  %45 = icmp slt i32 %44, %2, !dbg !430
  br i1 %45, label %scalar.ph, label %._crit_edge8, !dbg !430, !llvm.loop !441

._crit_edge8:                                     ; preds = %scalar.ph, %middle.block, %._crit_edge4.us-lcssa.us15, %0
  ret void, !dbg !442
}

; Function Attrs: nounwind uwtable
define void @mat_set(%struct.Mat* nocapture readonly %Mat, i32 %l, float %val) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !85), !dbg !443
  tail call void @llvm.dbg.value(metadata !{i32 %l}, i64 0, metadata !86), !dbg !443
  tail call void @llvm.dbg.value(metadata !{float %val}, i64 0, metadata !87), !dbg !443
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !88), !dbg !444
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 2, !dbg !444
  %2 = load i32* %1, align 4, !dbg !444, !tbaa !182
  %3 = icmp sgt i32 %2, 0, !dbg !444
  br i1 %3, label %.preheader1.lr.ph, label %._crit_edge7, !dbg !444

.preheader1.lr.ph:                                ; preds = %0
  %4 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 3, !dbg !445
  %5 = load i32* %4, align 4, !dbg !445, !tbaa !184
  %6 = icmp sgt i32 %5, 0, !dbg !445
  %7 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 4, !dbg !446
  %8 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !447
  br label %.preheader1, !dbg !444

.preheader1:                                      ; preds = %.preheader1.lr.ph, %._crit_edge4
  %i.05 = phi i32 [ 0, %.preheader1.lr.ph ], [ %33, %._crit_edge4 ]
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge4, !dbg !445

.preheader.lr.ph:                                 ; preds = %.preheader1
  %9 = load i32* %7, align 4, !dbg !446, !tbaa !186
  %10 = icmp sgt i32 %9, 0, !dbg !446
  br label %.preheader, !dbg !445

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %j.03 = phi i32 [ 0, %.preheader.lr.ph ], [ %31, %._crit_edge ]
  br i1 %10, label %.lr.ph, label %._crit_edge, !dbg !446

.lr.ph:                                           ; preds = %.preheader
  %11 = mul nsw i32 %2, %l, !dbg !447
  %12 = add i32 %11, %i.05, !dbg !447
  %13 = mul i32 %12, %5, !dbg !447
  %14 = add i32 %13, %j.03, !dbg !447
  %15 = load float** %8, align 8, !dbg !447, !tbaa !188
  %n.vec = and i32 %9, -2, !dbg !446
  %cmp.zero = icmp eq i32 %n.vec, 0, !dbg !446
  br i1 %cmp.zero, label %middle.block, label %vector.body

vector.body:                                      ; preds = %.lr.ph, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %.lr.ph ], !dbg !446
  %induction89 = or i32 %index, 1
  %16 = mul i32 %14, %9, !dbg !447
  %17 = mul i32 %14, %9, !dbg !447
  %18 = add nsw i32 %16, %index, !dbg !447
  %19 = add nsw i32 %17, %induction89, !dbg !447
  %20 = sext i32 %18 to i64, !dbg !447
  %21 = sext i32 %19 to i64, !dbg !447
  %22 = getelementptr inbounds float* %15, i64 %20, !dbg !447
  %23 = getelementptr inbounds float* %15, i64 %21, !dbg !447
  store float %val, float* %22, align 4, !dbg !447, !tbaa !437
  store float %val, float* %23, align 4, !dbg !447, !tbaa !437
  %index.next = add i32 %index, 2, !dbg !446
  %24 = icmp eq i32 %index.next, %n.vec, !dbg !446
  br i1 %24, label %middle.block, label %vector.body, !dbg !446, !llvm.loop !448

middle.block:                                     ; preds = %vector.body, %.lr.ph
  %resume.val = phi i32 [ 0, %.lr.ph ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i32 %9, %resume.val
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %k.02 = phi i32 [ %29, %scalar.ph ], [ %resume.val, %middle.block ]
  %25 = mul i32 %14, %9, !dbg !447
  %26 = add nsw i32 %25, %k.02, !dbg !447
  %27 = sext i32 %26 to i64, !dbg !447
  %28 = getelementptr inbounds float* %15, i64 %27, !dbg !447
  store float %val, float* %28, align 4, !dbg !447, !tbaa !437
  %29 = add nsw i32 %k.02, 1, !dbg !446
  tail call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !90), !dbg !446
  %30 = icmp slt i32 %29, %9, !dbg !446
  br i1 %30, label %scalar.ph, label %._crit_edge, !dbg !446, !llvm.loop !449

._crit_edge:                                      ; preds = %scalar.ph, %middle.block, %.preheader
  %31 = add nsw i32 %j.03, 1, !dbg !445
  tail call void @llvm.dbg.value(metadata !{i32 %31}, i64 0, metadata !89), !dbg !445
  %32 = icmp slt i32 %31, %5, !dbg !445
  br i1 %32, label %.preheader, label %._crit_edge4, !dbg !445

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader1
  %33 = add nsw i32 %i.05, 1, !dbg !444
  tail call void @llvm.dbg.value(metadata !{i32 %33}, i64 0, metadata !88), !dbg !444
  %34 = icmp slt i32 %33, %2, !dbg !444
  br i1 %34, label %.preheader1, label %._crit_edge7, !dbg !444

._crit_edge7:                                     ; preds = %._crit_edge4, %0
  ret void, !dbg !450
}

; Function Attrs: nounwind uwtable
define float @jacobi(i32 %nn, %struct.Mat* nocapture readonly %a, %struct.Mat* nocapture readonly %b, %struct.Mat* nocapture readonly %c, %struct.Mat* nocapture readonly %p, %struct.Mat* nocapture readonly %bnd, %struct.Mat* nocapture readonly %wrk1, %struct.Mat* nocapture readonly %wrk2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %nn}, i64 0, metadata !103), !dbg !451
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %a}, i64 0, metadata !104), !dbg !451
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %b}, i64 0, metadata !105), !dbg !451
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %c}, i64 0, metadata !106), !dbg !451
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %p}, i64 0, metadata !107), !dbg !452
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %bnd}, i64 0, metadata !108), !dbg !452
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %wrk1}, i64 0, metadata !109), !dbg !452
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %wrk2}, i64 0, metadata !110), !dbg !452
  %1 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 2, !dbg !453
  %2 = load i32* %1, align 4, !dbg !453, !tbaa !182
  %3 = add i32 %2, -1, !dbg !453
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !115), !dbg !453
  %4 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 3, !dbg !454
  %5 = load i32* %4, align 4, !dbg !454, !tbaa !184
  %6 = add i32 %5, -1, !dbg !454
  tail call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !116), !dbg !454
  %7 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 4, !dbg !455
  %8 = load i32* %7, align 4, !dbg !455, !tbaa !186
  %9 = add i32 %8, -1, !dbg !455
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !117), !dbg !455
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !114), !dbg !456
  %10 = icmp sgt i32 %nn, 0, !dbg !456
  br i1 %10, label %.preheader5.lr.ph, label %._crit_edge25, !dbg !456

.preheader5.lr.ph:                                ; preds = %0
  %11 = icmp sgt i32 %3, 1, !dbg !458
  %12 = icmp sgt i32 %6, 1, !dbg !461
  %13 = icmp sgt i32 %9, 1, !dbg !464
  %14 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 3, !dbg !466
  %15 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 4, !dbg !466
  %16 = getelementptr inbounds %struct.Mat* %wrk2, i64 0, i32 0, !dbg !466
  %17 = getelementptr inbounds %struct.Mat* %p, i64 0, i32 0, !dbg !466
  %18 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 2, !dbg !467
  %19 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 3, !dbg !467
  %20 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 4, !dbg !467
  %21 = getelementptr inbounds %struct.Mat* %a, i64 0, i32 0, !dbg !467
  %22 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 2, !dbg !467
  %23 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 3, !dbg !467
  %24 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 4, !dbg !467
  %25 = getelementptr inbounds %struct.Mat* %b, i64 0, i32 0, !dbg !467
  %26 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 2, !dbg !467
  %27 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 3, !dbg !467
  %28 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 4, !dbg !467
  %29 = getelementptr inbounds %struct.Mat* %c, i64 0, i32 0, !dbg !467
  %30 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 3, !dbg !467
  %31 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 4, !dbg !467
  %32 = getelementptr inbounds %struct.Mat* %wrk1, i64 0, i32 0, !dbg !467
  %33 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 3, !dbg !471
  %34 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 4, !dbg !471
  %35 = getelementptr inbounds %struct.Mat* %bnd, i64 0, i32 0, !dbg !471
  %36 = add i32 %8, -3, !dbg !456
  %37 = zext i32 %36 to i64
  %38 = add i64 %37, 1, !dbg !456
  %39 = zext i32 %36 to i64
  %40 = add i64 %39, 1, !dbg !456
  br label %.preheader5, !dbg !456

.preheader5:                                      ; preds = %._crit_edge23, %.preheader5.lr.ph
  %n.024 = phi i32 [ 0, %.preheader5.lr.ph ], [ %336, %._crit_edge23 ]
  br i1 %11, label %.preheader3, label %._crit_edge23, !dbg !458

.preheader4:                                      ; preds = %._crit_edge10
  br i1 %11, label %.preheader2, label %._crit_edge23, !dbg !472

.preheader3:                                      ; preds = %.preheader5, %._crit_edge10
  %i.013 = phi i32 [ %41, %._crit_edge10 ], [ 1, %.preheader5 ]
  %gosa.112 = phi float [ %gosa.2.lcssa, %._crit_edge10 ], [ 0.000000e+00, %.preheader5 ]
  %41 = add nsw i32 %i.013, 1, !dbg !467
  br i1 %12, label %.preheader1.lr.ph, label %._crit_edge10, !dbg !473

.preheader1.lr.ph:                                ; preds = %.preheader3
  %42 = add nsw i32 %i.013, -1, !dbg !467
  br label %.preheader1, !dbg !473

.preheader1:                                      ; preds = %._crit_edge, %.preheader1.lr.ph
  %j.09 = phi i32 [ 1, %.preheader1.lr.ph ], [ %.pre-phi, %._crit_edge ]
  %gosa.28 = phi float [ %gosa.112, %.preheader1.lr.ph ], [ %gosa.3.lcssa, %._crit_edge ]
  br i1 %13, label %.lr.ph, label %.preheader1._crit_edge, !dbg !474

.preheader1._crit_edge:                           ; preds = %.preheader1
  %.pre = add nsw i32 %j.09, 1, !dbg !473
  br label %._crit_edge, !dbg !474

.lr.ph:                                           ; preds = %.preheader1
  %43 = load i32* %18, align 4, !dbg !467, !tbaa !182
  %44 = load i32* %19, align 4, !dbg !467, !tbaa !184
  %45 = load i32* %20, align 4, !dbg !467, !tbaa !186
  %46 = mul nsw i32 %44, %i.013, !dbg !467
  %47 = add i32 %46, %j.09, !dbg !467
  %48 = mul i32 %47, %45, !dbg !467
  %49 = load float** %21, align 8, !dbg !467, !tbaa !188
  %50 = load i32* %4, align 4, !dbg !467, !tbaa !184
  %51 = load i32* %7, align 4, !dbg !467, !tbaa !186
  %52 = mul nsw i32 %50, %41, !dbg !467
  %53 = add i32 %52, %j.09, !dbg !467
  %54 = mul i32 %53, %51, !dbg !467
  %55 = load float** %17, align 8, !dbg !467, !tbaa !188
  %56 = add i32 %43, %i.013, !dbg !467
  %57 = mul i32 %44, %56, !dbg !467
  %58 = add i32 %57, %j.09, !dbg !467
  %59 = mul i32 %58, %45, !dbg !467
  %60 = mul nsw i32 %50, %i.013, !dbg !467
  %61 = add nsw i32 %j.09, 1, !dbg !467
  %62 = add i32 %60, %61, !dbg !467
  %63 = mul i32 %62, %51, !dbg !467
  %64 = shl i32 %43, 1, !dbg !467
  %65 = add i32 %64, %i.013, !dbg !467
  %66 = mul i32 %65, %44, !dbg !467
  %67 = add i32 %66, %j.09, !dbg !467
  %68 = mul i32 %67, %45, !dbg !467
  %69 = add i32 %60, %j.09, !dbg !467
  %70 = mul i32 %69, %51, !dbg !467
  %71 = load i32* %22, align 4, !dbg !467, !tbaa !182
  %72 = load i32* %23, align 4, !dbg !467, !tbaa !184
  %73 = load i32* %24, align 4, !dbg !467, !tbaa !186
  %74 = mul nsw i32 %72, %i.013, !dbg !467
  %75 = add i32 %74, %j.09, !dbg !467
  %76 = mul i32 %75, %73, !dbg !467
  %77 = load float** %25, align 8, !dbg !467, !tbaa !188
  %78 = add i32 %52, %61, !dbg !467
  %79 = mul i32 %78, %51, !dbg !467
  %80 = add nsw i32 %j.09, -1, !dbg !467
  %81 = add i32 %52, %80, !dbg !467
  %82 = mul i32 %81, %51, !dbg !467
  %83 = mul nsw i32 %50, %42, !dbg !467
  %84 = add i32 %83, %61, !dbg !467
  %85 = mul i32 %84, %51, !dbg !467
  %86 = add i32 %83, %80, !dbg !467
  %87 = mul i32 %86, %51, !dbg !467
  %88 = add i32 %71, %i.013, !dbg !467
  %89 = mul i32 %72, %88, !dbg !467
  %90 = add i32 %89, %j.09, !dbg !467
  %91 = mul i32 %90, %73, !dbg !467
  %92 = add i32 %60, %80, !dbg !467
  %93 = mul i32 %92, %51, !dbg !467
  %94 = shl i32 %71, 1, !dbg !467
  %95 = add i32 %94, %i.013, !dbg !467
  %96 = mul i32 %95, %72, !dbg !467
  %97 = add i32 %96, %j.09, !dbg !467
  %98 = mul i32 %97, %73, !dbg !467
  %99 = add i32 %83, %j.09, !dbg !467
  %100 = mul i32 %99, %51, !dbg !467
  %101 = load i32* %26, align 4, !dbg !467, !tbaa !182
  %102 = load i32* %27, align 4, !dbg !467, !tbaa !184
  %103 = load i32* %28, align 4, !dbg !467, !tbaa !186
  %104 = mul nsw i32 %102, %i.013, !dbg !467
  %105 = add i32 %104, %j.09, !dbg !467
  %106 = mul i32 %105, %103, !dbg !467
  %107 = load float** %29, align 8, !dbg !467, !tbaa !188
  %108 = add i32 %101, %i.013, !dbg !467
  %109 = mul i32 %102, %108, !dbg !467
  %110 = add i32 %109, %j.09, !dbg !467
  %111 = mul i32 %110, %103, !dbg !467
  %112 = shl i32 %101, 1, !dbg !467
  %113 = add i32 %112, %i.013, !dbg !467
  %114 = mul i32 %113, %102, !dbg !467
  %115 = add i32 %114, %j.09, !dbg !467
  %116 = mul i32 %115, %103, !dbg !467
  %117 = load i32* %30, align 4, !dbg !467, !tbaa !184
  %118 = load i32* %31, align 4, !dbg !467, !tbaa !186
  %119 = mul nsw i32 %117, %i.013, !dbg !467
  %120 = add i32 %119, %j.09, !dbg !467
  %121 = mul i32 %120, %118, !dbg !467
  %122 = load float** %32, align 8, !dbg !467, !tbaa !188
  %123 = mul nsw i32 %43, 3, !dbg !471
  %124 = add i32 %123, %i.013, !dbg !471
  %125 = mul i32 %124, %44, !dbg !471
  %126 = add i32 %125, %j.09, !dbg !471
  %127 = mul i32 %126, %45, !dbg !471
  %128 = load i32* %33, align 4, !dbg !471, !tbaa !184
  %129 = load i32* %34, align 4, !dbg !471, !tbaa !186
  %130 = mul nsw i32 %128, %i.013, !dbg !471
  %131 = add i32 %130, %j.09, !dbg !471
  %132 = mul i32 %131, %129, !dbg !471
  %133 = load float** %35, align 8, !dbg !471, !tbaa !188
  %134 = load i32* %14, align 4, !dbg !475, !tbaa !184
  %135 = load i32* %15, align 4, !dbg !475, !tbaa !186
  %136 = mul nsw i32 %134, %i.013, !dbg !475
  %137 = add i32 %136, %j.09, !dbg !475
  %138 = mul i32 %137, %135, !dbg !475
  %139 = load float** %16, align 8, !dbg !475, !tbaa !188
  %140 = sext i32 %70 to i64, !dbg !474
  %141 = sext i32 %100 to i64, !dbg !474
  %142 = sext i32 %54 to i64, !dbg !474
  %143 = sext i32 %93 to i64, !dbg !474
  %144 = sext i32 %63 to i64, !dbg !474
  %145 = sext i32 %138 to i64, !dbg !474
  %146 = sext i32 %132 to i64, !dbg !474
  %147 = sext i32 %127 to i64, !dbg !474
  %148 = sext i32 %121 to i64, !dbg !474
  %149 = sext i32 %116 to i64, !dbg !474
  %150 = sext i32 %111 to i64, !dbg !474
  %151 = sext i32 %106 to i64, !dbg !474
  %152 = sext i32 %98 to i64, !dbg !474
  %153 = sext i32 %91 to i64, !dbg !474
  %154 = sext i32 %87 to i64, !dbg !474
  %155 = sext i32 %85 to i64, !dbg !474
  %156 = sext i32 %82 to i64, !dbg !474
  %157 = sext i32 %79 to i64, !dbg !474
  %158 = sext i32 %76 to i64, !dbg !474
  %159 = sext i32 %68 to i64, !dbg !474
  %160 = sext i32 %59 to i64, !dbg !474
  %161 = sext i32 %48 to i64, !dbg !474
  br label %162, !dbg !474

; <label>:162                                     ; preds = %162, %.lr.ph
  %indvars.iv = phi i64 [ 1, %.lr.ph ], [ %indvars.iv.next, %162 ]
  %gosa.37 = phi float [ %gosa.28, %.lr.ph ], [ %288, %162 ]
  %163 = add nsw i64 %161, %indvars.iv, !dbg !467
  %164 = getelementptr inbounds float* %49, i64 %163, !dbg !467
  %165 = load float* %164, align 4, !dbg !467, !tbaa !437
  %166 = add nsw i64 %142, %indvars.iv, !dbg !467
  %167 = getelementptr inbounds float* %55, i64 %166, !dbg !467
  %168 = load float* %167, align 4, !dbg !467, !tbaa !437
  %169 = fmul float %165, %168, !dbg !467
  %170 = add nsw i64 %160, %indvars.iv, !dbg !467
  %171 = getelementptr inbounds float* %49, i64 %170, !dbg !467
  %172 = load float* %171, align 4, !dbg !467, !tbaa !437
  %173 = add nsw i64 %144, %indvars.iv, !dbg !467
  %174 = getelementptr inbounds float* %55, i64 %173, !dbg !467
  %175 = load float* %174, align 4, !dbg !467, !tbaa !437
  %176 = fmul float %172, %175, !dbg !467
  %177 = fadd float %169, %176, !dbg !467
  %178 = add nsw i64 %159, %indvars.iv, !dbg !467
  %179 = getelementptr inbounds float* %49, i64 %178, !dbg !467
  %180 = load float* %179, align 4, !dbg !467, !tbaa !437
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !474
  %181 = add nsw i64 %140, %indvars.iv.next, !dbg !467
  %182 = getelementptr inbounds float* %55, i64 %181, !dbg !467
  %183 = load float* %182, align 4, !dbg !467, !tbaa !437
  %184 = fmul float %180, %183, !dbg !467
  %185 = fadd float %177, %184, !dbg !467
  %186 = add nsw i64 %158, %indvars.iv, !dbg !467
  %187 = getelementptr inbounds float* %77, i64 %186, !dbg !467
  %188 = load float* %187, align 4, !dbg !467, !tbaa !437
  %189 = add nsw i64 %157, %indvars.iv, !dbg !467
  %190 = getelementptr inbounds float* %55, i64 %189, !dbg !467
  %191 = load float* %190, align 4, !dbg !467, !tbaa !437
  %192 = add nsw i64 %156, %indvars.iv, !dbg !467
  %193 = getelementptr inbounds float* %55, i64 %192, !dbg !467
  %194 = load float* %193, align 4, !dbg !467, !tbaa !437
  %195 = fsub float %191, %194, !dbg !467
  %196 = add nsw i64 %155, %indvars.iv, !dbg !467
  %197 = getelementptr inbounds float* %55, i64 %196, !dbg !467
  %198 = load float* %197, align 4, !dbg !467, !tbaa !437
  %199 = fsub float %195, %198, !dbg !467
  %200 = add nsw i64 %154, %indvars.iv, !dbg !467
  %201 = getelementptr inbounds float* %55, i64 %200, !dbg !467
  %202 = load float* %201, align 4, !dbg !467, !tbaa !437
  %203 = fadd float %199, %202, !dbg !467
  %204 = fmul float %188, %203, !dbg !467
  %205 = fadd float %185, %204, !dbg !467
  %206 = add nsw i64 %153, %indvars.iv, !dbg !467
  %207 = getelementptr inbounds float* %77, i64 %206, !dbg !467
  %208 = load float* %207, align 4, !dbg !467, !tbaa !437
  %209 = add nsw i64 %144, %indvars.iv.next, !dbg !467
  %210 = getelementptr inbounds float* %55, i64 %209, !dbg !467
  %211 = load float* %210, align 4, !dbg !467, !tbaa !437
  %212 = add nsw i64 %143, %indvars.iv.next, !dbg !467
  %213 = getelementptr inbounds float* %55, i64 %212, !dbg !467
  %214 = load float* %213, align 4, !dbg !467, !tbaa !437
  %215 = fsub float %211, %214, !dbg !467
  %216 = add nsw i64 %indvars.iv, -1, !dbg !467
  %217 = add nsw i64 %144, %216, !dbg !467
  %218 = getelementptr inbounds float* %55, i64 %217, !dbg !467
  %219 = load float* %218, align 4, !dbg !467, !tbaa !437
  %220 = fsub float %215, %219, !dbg !467
  %221 = add nsw i64 %143, %216, !dbg !467
  %222 = getelementptr inbounds float* %55, i64 %221, !dbg !467
  %223 = load float* %222, align 4, !dbg !467, !tbaa !437
  %224 = fadd float %220, %223, !dbg !467
  %225 = fmul float %208, %224, !dbg !467
  %226 = fadd float %205, %225, !dbg !467
  %227 = add nsw i64 %152, %indvars.iv, !dbg !467
  %228 = getelementptr inbounds float* %77, i64 %227, !dbg !467
  %229 = load float* %228, align 4, !dbg !467, !tbaa !437
  %230 = add nsw i64 %142, %indvars.iv.next, !dbg !467
  %231 = getelementptr inbounds float* %55, i64 %230, !dbg !467
  %232 = load float* %231, align 4, !dbg !467, !tbaa !437
  %233 = add nsw i64 %141, %indvars.iv.next, !dbg !467
  %234 = getelementptr inbounds float* %55, i64 %233, !dbg !467
  %235 = load float* %234, align 4, !dbg !467, !tbaa !437
  %236 = fsub float %232, %235, !dbg !467
  %237 = add nsw i64 %142, %216, !dbg !467
  %238 = getelementptr inbounds float* %55, i64 %237, !dbg !467
  %239 = load float* %238, align 4, !dbg !467, !tbaa !437
  %240 = fsub float %236, %239, !dbg !467
  %241 = add nsw i64 %141, %216, !dbg !467
  %242 = getelementptr inbounds float* %55, i64 %241, !dbg !467
  %243 = load float* %242, align 4, !dbg !467, !tbaa !437
  %244 = fadd float %240, %243, !dbg !467
  %245 = fmul float %229, %244, !dbg !467
  %246 = fadd float %226, %245, !dbg !467
  %247 = add nsw i64 %151, %indvars.iv, !dbg !467
  %248 = getelementptr inbounds float* %107, i64 %247, !dbg !467
  %249 = load float* %248, align 4, !dbg !467, !tbaa !437
  %250 = add nsw i64 %141, %indvars.iv, !dbg !467
  %251 = getelementptr inbounds float* %55, i64 %250, !dbg !467
  %252 = load float* %251, align 4, !dbg !467, !tbaa !437
  %253 = fmul float %249, %252, !dbg !467
  %254 = fadd float %246, %253, !dbg !467
  %255 = add nsw i64 %150, %indvars.iv, !dbg !467
  %256 = getelementptr inbounds float* %107, i64 %255, !dbg !467
  %257 = load float* %256, align 4, !dbg !467, !tbaa !437
  %258 = add nsw i64 %143, %indvars.iv, !dbg !467
  %259 = getelementptr inbounds float* %55, i64 %258, !dbg !467
  %260 = load float* %259, align 4, !dbg !467, !tbaa !437
  %261 = fmul float %257, %260, !dbg !467
  %262 = fadd float %254, %261, !dbg !467
  %263 = add nsw i64 %149, %indvars.iv, !dbg !467
  %264 = getelementptr inbounds float* %107, i64 %263, !dbg !467
  %265 = load float* %264, align 4, !dbg !467, !tbaa !437
  %266 = add nsw i64 %140, %216, !dbg !467
  %267 = getelementptr inbounds float* %55, i64 %266, !dbg !467
  %268 = load float* %267, align 4, !dbg !467, !tbaa !437
  %269 = fmul float %265, %268, !dbg !467
  %270 = fadd float %262, %269, !dbg !467
  %271 = add nsw i64 %148, %indvars.iv, !dbg !467
  %272 = getelementptr inbounds float* %122, i64 %271, !dbg !467
  %273 = load float* %272, align 4, !dbg !467, !tbaa !437
  %274 = fadd float %270, %273, !dbg !467
  tail call void @llvm.dbg.value(metadata !{float %274}, i64 0, metadata !119), !dbg !467
  %275 = add nsw i64 %147, %indvars.iv, !dbg !471
  %276 = getelementptr inbounds float* %49, i64 %275, !dbg !471
  %277 = load float* %276, align 4, !dbg !471, !tbaa !437
  %278 = fmul float %274, %277, !dbg !471
  %279 = add nsw i64 %140, %indvars.iv, !dbg !471
  %280 = getelementptr inbounds float* %55, i64 %279, !dbg !471
  %281 = load float* %280, align 4, !dbg !471, !tbaa !437
  %282 = fsub float %278, %281, !dbg !471
  %283 = add nsw i64 %146, %indvars.iv, !dbg !471
  %284 = getelementptr inbounds float* %133, i64 %283, !dbg !471
  %285 = load float* %284, align 4, !dbg !471, !tbaa !437
  %286 = fmul float %282, %285, !dbg !471
  tail call void @llvm.dbg.value(metadata !{float %286}, i64 0, metadata !120), !dbg !471
  %287 = fmul float %286, %286, !dbg !476
  %288 = fadd float %gosa.37, %287, !dbg !476
  tail call void @llvm.dbg.value(metadata !{float %288}, i64 0, metadata !118), !dbg !476
  %289 = load float* @omega, align 4, !dbg !475, !tbaa !437
  %290 = fmul float %289, %286, !dbg !475
  %291 = fadd float %281, %290, !dbg !475
  %292 = add nsw i64 %145, %indvars.iv, !dbg !475
  %293 = getelementptr inbounds float* %139, i64 %292, !dbg !475
  store float %291, float* %293, align 4, !dbg !475, !tbaa !437
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !474
  %exitcond = icmp eq i32 %lftr.wideiv, %9, !dbg !474
  br i1 %exitcond, label %._crit_edge, label %162, !dbg !474

._crit_edge:                                      ; preds = %162, %.preheader1._crit_edge
  %.pre-phi = phi i32 [ %.pre, %.preheader1._crit_edge ], [ %61, %162 ], !dbg !473
  %gosa.3.lcssa = phi float [ %gosa.28, %.preheader1._crit_edge ], [ %288, %162 ]
  tail call void @llvm.dbg.value(metadata !{i32 %.pre-phi}, i64 0, metadata !112), !dbg !473
  %exitcond27 = icmp eq i32 %.pre-phi, %6, !dbg !473
  br i1 %exitcond27, label %._crit_edge10, label %.preheader1, !dbg !473

._crit_edge10:                                    ; preds = %._crit_edge, %.preheader3
  %gosa.2.lcssa = phi float [ %gosa.112, %.preheader3 ], [ %gosa.3.lcssa, %._crit_edge ]
  tail call void @llvm.dbg.value(metadata !{i32 %41}, i64 0, metadata !111), !dbg !458
  %exitcond28 = icmp eq i32 %41, %3, !dbg !458
  br i1 %exitcond28, label %.preheader4, label %.preheader3, !dbg !458

.preheader2:                                      ; preds = %.preheader4, %._crit_edge20
  %indvar43 = phi i32 [ %indvar.next44, %._crit_edge20 ], [ 0, %.preheader4 ]
  %i.121 = phi i32 [ %335, %._crit_edge20 ], [ 1, %.preheader4 ]
  %294 = add i32 %indvar43, 1, !dbg !461
  br i1 %12, label %.preheader, label %._crit_edge20, !dbg !461

.preheader:                                       ; preds = %.preheader2, %._crit_edge18
  %indvar = phi i32 [ %indvar.next, %._crit_edge18 ], [ 0, %.preheader2 ]
  %j.119 = phi i32 [ %334, %._crit_edge18 ], [ 1, %.preheader2 ]
  %295 = add i32 %indvar, 1, !dbg !464
  br i1 %13, label %.lr.ph17, label %._crit_edge18, !dbg !464

.lr.ph17:                                         ; preds = %.preheader
  %296 = load i32* %14, align 4, !dbg !466, !tbaa !184
  %297 = load i32* %15, align 4, !dbg !466, !tbaa !186
  %298 = mul nsw i32 %296, %i.121, !dbg !466
  %299 = add i32 %298, %j.119, !dbg !466
  %300 = mul i32 %299, %297, !dbg !466
  %301 = load float** %16, align 8, !dbg !466, !tbaa !188
  %302 = load i32* %4, align 4, !dbg !466, !tbaa !184
  %303 = load i32* %7, align 4, !dbg !466, !tbaa !186
  %304 = mul nsw i32 %302, %i.121, !dbg !466
  %305 = add i32 %304, %j.119, !dbg !466
  %306 = mul i32 %305, %303, !dbg !466
  %307 = load float** %17, align 8, !dbg !466, !tbaa !188
  %308 = sext i32 %306 to i64, !dbg !464
  %309 = sext i32 %300 to i64, !dbg !464
  %end.idx = add i64 %37, 2, !dbg !464
  %n.vec = and i64 %38, 8589934588, !dbg !464
  %end.idx.rnd.down64 = or i64 %n.vec, 1, !dbg !464
  %cmp.zero = icmp eq i64 %end.idx.rnd.down64, 1, !dbg !464
  %310 = mul i32 %294, %302
  %311 = add i32 %295, %310
  %312 = mul i32 %303, %311
  %313 = sext i32 %312 to i64
  %314 = mul i32 %294, %296
  %315 = add i32 %295, %314
  %316 = mul i32 %297, %315
  %317 = sext i32 %316 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph17
  %scevgep53.sum = add i64 %40, %317
  %scevgep50.sum = add i64 %317, 1
  %scevgep47.sum = add i64 %40, %313
  %scevgep.sum = add i64 %313, 1
  %scevgep54 = getelementptr float* %301, i64 %scevgep53.sum
  %scevgep51 = getelementptr float* %301, i64 %scevgep50.sum
  %scevgep48 = getelementptr float* %307, i64 %scevgep47.sum
  %scevgep45 = getelementptr float* %307, i64 %scevgep.sum
  %bound1 = icmp ule float* %scevgep51, %scevgep48
  %bound0 = icmp ule float* %scevgep45, %scevgep54
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 1, %vector.memcheck ], !dbg !464
  %318 = add i64 %309, %index, !dbg !466
  %319 = getelementptr inbounds float* %301, i64 %318, !dbg !466
  %320 = bitcast float* %319 to <2 x float>*, !dbg !466
  %wide.load = load <2 x float>* %320, align 4, !dbg !466
  %.sum = add i64 %318, 2, !dbg !466
  %321 = getelementptr float* %301, i64 %.sum, !dbg !466
  %322 = bitcast float* %321 to <2 x float>*, !dbg !466
  %wide.load59 = load <2 x float>* %322, align 4, !dbg !466
  %323 = add i64 %308, %index, !dbg !466
  %324 = getelementptr inbounds float* %307, i64 %323, !dbg !466
  %325 = bitcast float* %324 to <2 x float>*, !dbg !466
  store <2 x float> %wide.load, <2 x float>* %325, align 4, !dbg !466
  %.sum65 = add i64 %323, 2, !dbg !466
  %326 = getelementptr float* %307, i64 %.sum65, !dbg !466
  %327 = bitcast float* %326 to <2 x float>*, !dbg !466
  store <2 x float> %wide.load59, <2 x float>* %327, align 4, !dbg !466
  %index.next = add i64 %index, 4, !dbg !464
  %328 = icmp eq i64 %index.next, %end.idx.rnd.down64, !dbg !464
  br i1 %328, label %middle.block, label %vector.body, !dbg !464, !llvm.loop !477

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph17
  %resume.val = phi i64 [ 1, %.lr.ph17 ], [ 1, %vector.memcheck ], [ %end.idx.rnd.down64, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %._crit_edge18, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %scalar.ph ], [ %resume.val, %middle.block ]
  %329 = add nsw i64 %309, %indvars.iv29, !dbg !466
  %330 = getelementptr inbounds float* %301, i64 %329, !dbg !466
  %331 = load float* %330, align 4, !dbg !466, !tbaa !437
  %332 = add nsw i64 %308, %indvars.iv29, !dbg !466
  %333 = getelementptr inbounds float* %307, i64 %332, !dbg !466
  store float %331, float* %333, align 4, !dbg !466, !tbaa !437
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1, !dbg !464
  %lftr.wideiv31 = trunc i64 %indvars.iv.next30 to i32, !dbg !464
  %exitcond32 = icmp eq i32 %lftr.wideiv31, %9, !dbg !464
  br i1 %exitcond32, label %._crit_edge18, label %scalar.ph, !dbg !464, !llvm.loop !478

._crit_edge18:                                    ; preds = %scalar.ph, %middle.block, %.preheader
  %334 = add nsw i32 %j.119, 1, !dbg !461
  tail call void @llvm.dbg.value(metadata !{i32 %334}, i64 0, metadata !112), !dbg !461
  %exitcond37 = icmp eq i32 %334, %6, !dbg !461
  %indvar.next = add i32 %indvar, 1, !dbg !461
  br i1 %exitcond37, label %._crit_edge20, label %.preheader, !dbg !461

._crit_edge20:                                    ; preds = %._crit_edge18, %.preheader2
  %335 = add nsw i32 %i.121, 1, !dbg !472
  tail call void @llvm.dbg.value(metadata !{i32 %335}, i64 0, metadata !111), !dbg !472
  %exitcond38 = icmp eq i32 %335, %3, !dbg !472
  %indvar.next44 = add i32 %indvar43, 1, !dbg !472
  br i1 %exitcond38, label %._crit_edge23, label %.preheader2, !dbg !472

._crit_edge23:                                    ; preds = %._crit_edge20, %.preheader5, %.preheader4
  %gosa.1.lcssa42 = phi float [ %gosa.2.lcssa, %.preheader4 ], [ 0.000000e+00, %.preheader5 ], [ %gosa.2.lcssa, %._crit_edge20 ]
  %336 = add nsw i32 %n.024, 1, !dbg !456
  tail call void @llvm.dbg.value(metadata !{i32 %336}, i64 0, metadata !114), !dbg !456
  %exitcond39 = icmp eq i32 %336, %nn, !dbg !456
  br i1 %exitcond39, label %._crit_edge25, label %.preheader5, !dbg !456

._crit_edge25:                                    ; preds = %._crit_edge23, %0
  %gosa.0.lcssa = phi float [ undef, %0 ], [ %gosa.1.lcssa42, %._crit_edge23 ]
  ret float %gosa.0.lcssa, !dbg !479
}

; Function Attrs: nounwind uwtable
define void @clearMat(%struct.Mat* nocapture %Mat) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Mat* %Mat}, i64 0, metadata !80), !dbg !480
  %1 = getelementptr inbounds %struct.Mat* %Mat, i64 0, i32 0, !dbg !481
  %2 = load float** %1, align 8, !dbg !481, !tbaa !188
  %3 = icmp eq float* %2, null, !dbg !481
  br i1 %3, label %6, label %4, !dbg !481

; <label>:4                                       ; preds = %0
  %5 = bitcast float* %2 to i8*, !dbg !482
  tail call void @free(i8* %5) #6, !dbg !482
  br label %6, !dbg !482

; <label>:6                                       ; preds = %0, %4
  %7 = bitcast %struct.Mat* %Mat to i8*, !dbg !483
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 24, i32 8, i1 false), !dbg !484
  ret void, !dbg !483
}

; Function Attrs: nounwind readnone uwtable
define double @fflop(i32 %mx, i32 %my, i32 %mz) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %mx}, i64 0, metadata !40), !dbg !485
  tail call void @llvm.dbg.value(metadata !{i32 %my}, i64 0, metadata !41), !dbg !485
  tail call void @llvm.dbg.value(metadata !{i32 %mz}, i64 0, metadata !42), !dbg !485
  %1 = add nsw i32 %mz, -2, !dbg !486
  %2 = sitofp i32 %1 to double, !dbg !486
  %3 = add nsw i32 %my, -2, !dbg !486
  %4 = sitofp i32 %3 to double, !dbg !486
  %5 = fmul double %4, %2, !dbg !486
  %6 = add nsw i32 %mx, -2, !dbg !486
  %7 = sitofp i32 %6 to double, !dbg !486
  %8 = fmul double %7, %5, !dbg !486
  %9 = fmul double %8, 3.400000e+01, !dbg !486
  ret double %9, !dbg !486
}

; Function Attrs: nounwind readnone uwtable
define double @mflops(i32 %nn, double %cpu, double %flop) #3 {
  tail call void @llvm.dbg.value(metadata !{i32 %nn}, i64 0, metadata !47), !dbg !487
  tail call void @llvm.dbg.value(metadata !{double %cpu}, i64 0, metadata !48), !dbg !487
  tail call void @llvm.dbg.value(metadata !{double %flop}, i64 0, metadata !49), !dbg !487
  %1 = fdiv double %flop, %cpu, !dbg !488
  %2 = fmul double %1, 1.000000e-06, !dbg !488
  %3 = sitofp i32 %nn to double, !dbg !488
  %4 = fmul double %3, %2, !dbg !488
  ret double %4, !dbg !488
}

; Function Attrs: nounwind uwtable
define void @set_param(i32* nocapture %is, i8* nocapture readonly %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %is}, i64 0, metadata !55), !dbg !489
  tail call void @llvm.dbg.value(metadata !{i8* %size}, i64 0, metadata !56), !dbg !489
  %1 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str4, i64 0, i64 0)) #6, !dbg !490
  %2 = icmp eq i32 %1, 0, !dbg !490
  br i1 %2, label %6, label %3, !dbg !490

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0)) #6, !dbg !490
  %5 = icmp eq i32 %4, 0, !dbg !490
  br i1 %5, label %6, label %9, !dbg !490

; <label>:6                                       ; preds = %3, %0
  store i32 32, i32* %is, align 4, !dbg !492, !tbaa !494
  %7 = getelementptr inbounds i32* %is, i64 1, !dbg !495
  store i32 32, i32* %7, align 4, !dbg !495, !tbaa !494
  %8 = getelementptr inbounds i32* %is, i64 2, !dbg !496
  store i32 64, i32* %8, align 4, !dbg !496, !tbaa !494
  br label %46, !dbg !497

; <label>:9                                       ; preds = %3
  %10 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)) #6, !dbg !498
  %11 = icmp eq i32 %10, 0, !dbg !498
  br i1 %11, label %15, label %12, !dbg !498

; <label>:12                                      ; preds = %9
  %13 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str7, i64 0, i64 0)) #6, !dbg !498
  %14 = icmp eq i32 %13, 0, !dbg !498
  br i1 %14, label %15, label %18, !dbg !498

; <label>:15                                      ; preds = %12, %9
  store i32 64, i32* %is, align 4, !dbg !500, !tbaa !494
  %16 = getelementptr inbounds i32* %is, i64 1, !dbg !502
  store i32 64, i32* %16, align 4, !dbg !502, !tbaa !494
  %17 = getelementptr inbounds i32* %is, i64 2, !dbg !503
  store i32 128, i32* %17, align 4, !dbg !503, !tbaa !494
  br label %46, !dbg !504

; <label>:18                                      ; preds = %12
  %19 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str8, i64 0, i64 0)) #6, !dbg !505
  %20 = icmp eq i32 %19, 0, !dbg !505
  br i1 %20, label %24, label %21, !dbg !505

; <label>:21                                      ; preds = %18
  %22 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str9, i64 0, i64 0)) #6, !dbg !505
  %23 = icmp eq i32 %22, 0, !dbg !505
  br i1 %23, label %24, label %27, !dbg !505

; <label>:24                                      ; preds = %21, %18
  store i32 128, i32* %is, align 4, !dbg !507, !tbaa !494
  %25 = getelementptr inbounds i32* %is, i64 1, !dbg !509
  store i32 128, i32* %25, align 4, !dbg !509, !tbaa !494
  %26 = getelementptr inbounds i32* %is, i64 2, !dbg !510
  store i32 256, i32* %26, align 4, !dbg !510, !tbaa !494
  br label %46, !dbg !511

; <label>:27                                      ; preds = %21
  %28 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str10, i64 0, i64 0)) #6, !dbg !512
  %29 = icmp eq i32 %28, 0, !dbg !512
  br i1 %29, label %33, label %30, !dbg !512

; <label>:30                                      ; preds = %27
  %31 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([2 x i8]* @.str11, i64 0, i64 0)) #6, !dbg !512
  %32 = icmp eq i32 %31, 0, !dbg !512
  br i1 %32, label %33, label %36, !dbg !512

; <label>:33                                      ; preds = %30, %27
  store i32 256, i32* %is, align 4, !dbg !514, !tbaa !494
  %34 = getelementptr inbounds i32* %is, i64 1, !dbg !516
  store i32 256, i32* %34, align 4, !dbg !516, !tbaa !494
  %35 = getelementptr inbounds i32* %is, i64 2, !dbg !517
  store i32 512, i32* %35, align 4, !dbg !517, !tbaa !494
  br label %46, !dbg !518

; <label>:36                                      ; preds = %30
  %37 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str12, i64 0, i64 0)) #6, !dbg !519
  %38 = icmp eq i32 %37, 0, !dbg !519
  br i1 %38, label %42, label %39, !dbg !519

; <label>:39                                      ; preds = %36
  %40 = tail call i32 @strcmp(i8* %size, i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0)) #6, !dbg !519
  %41 = icmp eq i32 %40, 0, !dbg !519
  br i1 %41, label %42, label %45, !dbg !519

; <label>:42                                      ; preds = %39, %36
  store i32 512, i32* %is, align 4, !dbg !521, !tbaa !494
  %43 = getelementptr inbounds i32* %is, i64 1, !dbg !523
  store i32 512, i32* %43, align 4, !dbg !523, !tbaa !494
  %44 = getelementptr inbounds i32* %is, i64 2, !dbg !524
  store i32 1024, i32* %44, align 4, !dbg !524, !tbaa !494
  br label %46, !dbg !525

; <label>:45                                      ; preds = %39
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str, i64 0, i64 0)), !dbg !526
  tail call void @exit(i32 6) #7, !dbg !528
  unreachable, !dbg !528

; <label>:46                                      ; preds = %42, %33, %24, %15, %6
  ret void, !dbg !529
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
  %tm = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.declare(metadata !{%struct.timeval* %tm}, metadata !125), !dbg !530
  %1 = call i32 @gettimeofday(%struct.timeval* %tm, %struct.timezone* null) #6, !dbg !531
  %2 = load i32* @second.base_sec, align 4, !dbg !532, !tbaa !494
  %3 = load i32* @second.base_usec, align 4
  %4 = or i32 %3, %2, !dbg !532
  %5 = icmp eq i32 %4, 0, !dbg !532
  %6 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 0, !dbg !534
  %7 = load i64* %6, align 8, !dbg !534, !tbaa !536
  br i1 %5, label %8, label %13, !dbg !532

; <label>:8                                       ; preds = %0
  %9 = trunc i64 %7 to i32, !dbg !534
  store i32 %9, i32* @second.base_sec, align 4, !dbg !534, !tbaa !494
  %10 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1, !dbg !539
  %11 = load i64* %10, align 8, !dbg !539, !tbaa !540
  %12 = trunc i64 %11 to i32, !dbg !539
  store i32 %12, i32* @second.base_usec, align 4, !dbg !539, !tbaa !494
  tail call void @llvm.dbg.value(metadata !541, i64 0, metadata !135), !dbg !542
  br label %24, !dbg !543

; <label>:13                                      ; preds = %0
  %14 = sext i32 %2 to i64, !dbg !544
  %15 = sub nsw i64 %7, %14, !dbg !544
  %16 = sitofp i64 %15 to double, !dbg !544
  %17 = getelementptr inbounds %struct.timeval* %tm, i64 0, i32 1, !dbg !544
  %18 = load i64* %17, align 8, !dbg !544, !tbaa !540
  %19 = sext i32 %3 to i64, !dbg !544
  %20 = sub nsw i64 %18, %19, !dbg !544
  %21 = sitofp i64 %20 to double, !dbg !544
  %22 = fdiv double %21, 1.000000e+06, !dbg !544
  %23 = fadd double %16, %22, !dbg !544
  tail call void @llvm.dbg.value(metadata !{double %23}, i64 0, metadata !135), !dbg !544
  br label %24

; <label>:24                                      ; preds = %13, %8
  %t.0 = phi double [ 0.000000e+00, %8 ], [ %23, %13 ]
  ret double %t.0, !dbg !546
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

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
!llvm.module.flags = !{!147, !148}
!llvm.ident = !{!149}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !136, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c] [DW_LANG_C99]
!1 = metadata !{metadata !"himenobmtxpa.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !36, metadata !43, metadata !50, metadata !57, metadata !76, metadata !81, metadata !91, metadata !99, metadata !121}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 71, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !12, i32 72} ; [ DW_TAG_subprogram ] [line 71] [def] [scope 72] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !29, metadata !31, metadata !33, metadata !34, metadata !35}
!13 = metadata !{i32 786689, metadata !4, metadata !"argc", metadata !5, i32 16777287, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 71]
!14 = metadata !{i32 786689, metadata !4, metadata !"argv", metadata !5, i32 33554503, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 71]
!15 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 73]
!16 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 73]
!17 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 73]
!18 = metadata !{i32 786688, metadata !4, metadata !"nn", metadata !5, i32 73, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nn] [line 73]
!19 = metadata !{i32 786688, metadata !4, metadata !"imax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 74]
!20 = metadata !{i32 786688, metadata !4, metadata !"jmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 74]
!21 = metadata !{i32 786688, metadata !4, metadata !"kmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 74]
!22 = metadata !{i32 786688, metadata !4, metadata !"mimax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mimax] [line 74]
!23 = metadata !{i32 786688, metadata !4, metadata !"mjmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mjmax] [line 74]
!24 = metadata !{i32 786688, metadata !4, metadata !"mkmax", metadata !5, i32 74, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mkmax] [line 74]
!25 = metadata !{i32 786688, metadata !4, metadata !"msize", metadata !5, i32 74, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msize] [line 74]
!26 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !8, metadata !27, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!29 = metadata !{i32 786688, metadata !4, metadata !"gosa", metadata !5, i32 75, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 75]
!30 = metadata !{i32 786468, null, null, metadata !"float", i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!31 = metadata !{i32 786688, metadata !4, metadata !"cpu0", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu0] [line 76]
!32 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!33 = metadata !{i32 786688, metadata !4, metadata !"cpu1", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu1] [line 76]
!34 = metadata !{i32 786688, metadata !4, metadata !"cpu", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpu] [line 76]
!35 = metadata !{i32 786688, metadata !4, metadata !"flop", metadata !5, i32 76, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flop] [line 76]
!36 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fflop", metadata !"fflop", metadata !"", i32 144, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, i32, i32)* @fflop, null, null, metadata !39, i32 145} ; [ DW_TAG_subprogram ] [line 144] [def] [scope 145] [fflop]
!37 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!38 = metadata !{metadata !32, metadata !8, metadata !8, metadata !8}
!39 = metadata !{metadata !40, metadata !41, metadata !42}
!40 = metadata !{i32 786689, metadata !36, metadata !"mx", metadata !5, i32 16777360, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mx] [line 144]
!41 = metadata !{i32 786689, metadata !36, metadata !"my", metadata !5, i32 33554576, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [my] [line 144]
!42 = metadata !{i32 786689, metadata !36, metadata !"mz", metadata !5, i32 50331792, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mz] [line 144]
!43 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mflops", metadata !"mflops", metadata !"", i32 150, metadata !44, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, double (i32, double, double)* @mflops, null, null, metadata !46, i32 151} ; [ DW_TAG_subprogram ] [line 150] [def] [scope 151] [mflops]
!44 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !45, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!45 = metadata !{metadata !32, metadata !8, metadata !32, metadata !32}
!46 = metadata !{metadata !47, metadata !48, metadata !49}
!47 = metadata !{i32 786689, metadata !43, metadata !"nn", metadata !5, i32 16777366, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 150]
!48 = metadata !{i32 786689, metadata !43, metadata !"cpu", metadata !5, i32 33554582, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cpu] [line 150]
!49 = metadata !{i32 786689, metadata !43, metadata !"flop", metadata !5, i32 50331798, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flop] [line 150]
!50 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"set_param", metadata !"set_param", metadata !"", i32 156, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8*)* @set_param, null, null, metadata !54, i32 157} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [set_param]
!51 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!52 = metadata !{null, metadata !53, metadata !10}
!53 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!54 = metadata !{metadata !55, metadata !56}
!55 = metadata !{i32 786689, metadata !50, metadata !"is", metadata !5, i32 16777372, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [is] [line 156]
!56 = metadata !{i32 786689, metadata !50, metadata !"size", metadata !5, i32 33554588, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 156]
!57 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"newMat", metadata !"newMat", metadata !"", i32 194, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.Mat*, i32, i32, i32, i32)* @newMat, null, null, metadata !70, i32 195} ; [ DW_TAG_subprogram ] [line 194] [def] [scope 195] [newMat]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !8, metadata !60, metadata !8, metadata !8, metadata !8, metadata !8}
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Matrix]
!61 = metadata !{i32 786454, metadata !1, null, metadata !"Matrix", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ] [Matrix] [line 54, size 0, align 0, offset 0] [from Mat]
!62 = metadata !{i32 786451, metadata !1, null, metadata !"Mat", i32 45, i64 192, i64 64, i32 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Mat] [line 45, size 192, align 64, offset 0] [def] [from ]
!63 = metadata !{metadata !64, metadata !66, metadata !67, metadata !68, metadata !69}
!64 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"m", i32 46, i64 64, i64 64, i64 0, i32 0, metadata !65} ; [ DW_TAG_member ] [m] [line 46, size 64, align 64, offset 0] [from ]
!65 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!66 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mnums", i32 47, i64 32, i64 32, i64 64, i32 0, metadata !8} ; [ DW_TAG_member ] [mnums] [line 47, size 32, align 32, offset 64] [from int]
!67 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mrows", i32 48, i64 32, i64 32, i64 96, i32 0, metadata !8} ; [ DW_TAG_member ] [mrows] [line 48, size 32, align 32, offset 96] [from int]
!68 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mcols", i32 49, i64 32, i64 32, i64 128, i32 0, metadata !8} ; [ DW_TAG_member ] [mcols] [line 49, size 32, align 32, offset 128] [from int]
!69 = metadata !{i32 786445, metadata !1, metadata !62, metadata !"mdeps", i32 50, i64 32, i64 32, i64 160, i32 0, metadata !8} ; [ DW_TAG_member ] [mdeps] [line 50, size 32, align 32, offset 160] [from int]
!70 = metadata !{metadata !71, metadata !72, metadata !73, metadata !74, metadata !75}
!71 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!72 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!73 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!74 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!75 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!76 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"clearMat", metadata !"clearMat", metadata !"", i32 208, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*)* @clearMat, null, null, metadata !79, i32 209} ; [ DW_TAG_subprogram ] [line 208] [def] [scope 209] [clearMat]
!77 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{null, metadata !60}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!81 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set", metadata !"mat_set", metadata !"", i32 220, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*, i32, float)* @mat_set, null, null, metadata !84, i32 221} ; [ DW_TAG_subprogram ] [line 220] [def] [scope 221] [mat_set]
!82 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!83 = metadata !{null, metadata !60, metadata !8, metadata !30}
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90}
!85 = metadata !{i32 786689, metadata !81, metadata !"Mat", metadata !5, i32 16777436, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 220]
!86 = metadata !{i32 786689, metadata !81, metadata !"l", metadata !5, i32 33554652, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [l] [line 220]
!87 = metadata !{i32 786689, metadata !81, metadata !"val", metadata !5, i32 50331868, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 220]
!88 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 222]
!89 = metadata !{i32 786688, metadata !81, metadata !"j", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 222]
!90 = metadata !{i32 786688, metadata !81, metadata !"k", metadata !5, i32 222, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 222]
!91 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"mat_set_init", metadata !"mat_set_init", metadata !"", i32 231, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.Mat*)* @mat_set_init, null, null, metadata !92, i32 232} ; [ DW_TAG_subprogram ] [line 231] [def] [scope 232] [mat_set_init]
!92 = metadata !{metadata !93, metadata !94, metadata !95, metadata !96, metadata !97, metadata !98}
!93 = metadata !{i32 786689, metadata !91, metadata !"Mat", metadata !5, i32 16777447, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!94 = metadata !{i32 786688, metadata !91, metadata !"i", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 233]
!95 = metadata !{i32 786688, metadata !91, metadata !"j", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 233]
!96 = metadata !{i32 786688, metadata !91, metadata !"k", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 233]
!97 = metadata !{i32 786688, metadata !91, metadata !"l", metadata !5, i32 233, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 233]
!98 = metadata !{i32 786688, metadata !91, metadata !"tt", metadata !5, i32 234, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tt] [line 234]
!99 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"jacobi", metadata !"jacobi", metadata !"", i32 244, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (i32, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*, %struct.Mat*)* @jacobi, null, null, metadata !102, i32 246} ; [ DW_TAG_subprogram ] [line 244] [def] [scope 246] [jacobi]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !30, metadata !8, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60, metadata !60}
!102 = metadata !{metadata !103, metadata !104, metadata !105, metadata !106, metadata !107, metadata !108, metadata !109, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119, metadata !120}
!103 = metadata !{i32 786689, metadata !99, metadata !"nn", metadata !5, i32 16777460, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 244]
!104 = metadata !{i32 786689, metadata !99, metadata !"a", metadata !5, i32 33554676, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 244]
!105 = metadata !{i32 786689, metadata !99, metadata !"b", metadata !5, i32 50331892, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 244]
!106 = metadata !{i32 786689, metadata !99, metadata !"c", metadata !5, i32 67109108, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 244]
!107 = metadata !{i32 786689, metadata !99, metadata !"p", metadata !5, i32 83886325, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 245]
!108 = metadata !{i32 786689, metadata !99, metadata !"bnd", metadata !5, i32 100663541, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bnd] [line 245]
!109 = metadata !{i32 786689, metadata !99, metadata !"wrk1", metadata !5, i32 117440757, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk1] [line 245]
!110 = metadata !{i32 786689, metadata !99, metadata !"wrk2", metadata !5, i32 134217973, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wrk2] [line 245]
!111 = metadata !{i32 786688, metadata !99, metadata !"i", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 247]
!112 = metadata !{i32 786688, metadata !99, metadata !"j", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 247]
!113 = metadata !{i32 786688, metadata !99, metadata !"k", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 247]
!114 = metadata !{i32 786688, metadata !99, metadata !"n", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 247]
!115 = metadata !{i32 786688, metadata !99, metadata !"imax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 247]
!116 = metadata !{i32 786688, metadata !99, metadata !"jmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [jmax] [line 247]
!117 = metadata !{i32 786688, metadata !99, metadata !"kmax", metadata !5, i32 247, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kmax] [line 247]
!118 = metadata !{i32 786688, metadata !99, metadata !"gosa", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gosa] [line 248]
!119 = metadata !{i32 786688, metadata !99, metadata !"s0", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s0] [line 248]
!120 = metadata !{i32 786688, metadata !99, metadata !"ss", metadata !5, i32 248, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ss] [line 248]
!121 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"second", metadata !"second", metadata !"", i32 294, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, double ()* @second, null, null, metadata !124, i32 295} ; [ DW_TAG_subprogram ] [line 294] [def] [scope 295] [second]
!122 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !123, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = metadata !{metadata !32}
!124 = metadata !{metadata !125, metadata !135}
!125 = metadata !{i32 786688, metadata !121, metadata !"tm", metadata !5, i32 297, metadata !126, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tm] [line 297]
!126 = metadata !{i32 786451, metadata !127, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !128, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!127 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!128 = metadata !{metadata !129, metadata !133}
!129 = metadata !{i32 786445, metadata !127, metadata !126, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!130 = metadata !{i32 786454, metadata !131, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !132} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!131 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!132 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!133 = metadata !{i32 786445, metadata !127, metadata !126, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !134} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!134 = metadata !{i32 786454, metadata !131, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !132} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!135 = metadata !{i32 786688, metadata !121, metadata !"t", metadata !5, i32 298, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 298]
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146}
!137 = metadata !{i32 786484, i32 0, null, metadata !"omega", metadata !"omega", metadata !"", metadata !5, i32 67, metadata !30, i32 0, i32 1, float* @omega, null} ; [ DW_TAG_variable ] [omega] [line 67] [def]
!138 = metadata !{i32 786484, i32 0, metadata !121, metadata !"base_sec", metadata !"base_sec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_sec, null} ; [ DW_TAG_variable ] [base_sec] [line 300] [local] [def]
!139 = metadata !{i32 786484, i32 0, metadata !121, metadata !"base_usec", metadata !"base_usec", metadata !"", metadata !5, i32 300, metadata !8, i32 1, i32 1, i32* @second.base_usec, null} ; [ DW_TAG_variable ] [base_usec] [line 300] [local] [def]
!140 = metadata !{i32 786484, i32 0, null, metadata !"a", metadata !"a", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @a, null} ; [ DW_TAG_variable ] [a] [line 68] [def]
!141 = metadata !{i32 786484, i32 0, null, metadata !"b", metadata !"b", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @b, null} ; [ DW_TAG_variable ] [b] [line 68] [def]
!142 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @c, null} ; [ DW_TAG_variable ] [c] [line 68] [def]
!143 = metadata !{i32 786484, i32 0, null, metadata !"p", metadata !"p", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @p, null} ; [ DW_TAG_variable ] [p] [line 68] [def]
!144 = metadata !{i32 786484, i32 0, null, metadata !"bnd", metadata !"bnd", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @bnd, null} ; [ DW_TAG_variable ] [bnd] [line 68] [def]
!145 = metadata !{i32 786484, i32 0, null, metadata !"wrk1", metadata !"wrk1", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @wrk1, null} ; [ DW_TAG_variable ] [wrk1] [line 68] [def]
!146 = metadata !{i32 786484, i32 0, null, metadata !"wrk2", metadata !"wrk2", metadata !"", metadata !5, i32 68, metadata !61, i32 0, i32 1, %struct.Mat* @wrk2, null} ; [ DW_TAG_variable ] [wrk2] [line 68] [def]
!147 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!148 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!149 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!150 = metadata !{i32 71, i32 0, metadata !4, null}
!151 = metadata !{[3 x i32]* undef}
!152 = metadata !{i32 74, i32 0, metadata !4, null}
!153 = metadata !{i32 64}
!154 = metadata !{i32 83, i32 0, metadata !4, null}
!155 = metadata !{i32 84, i32 0, metadata !4, null}
!156 = metadata !{i32 128}
!157 = metadata !{i32 85, i32 0, metadata !4, null}
!158 = metadata !{i32 63}
!159 = metadata !{i32 86, i32 0, metadata !4, null}
!160 = metadata !{i32 87, i32 0, metadata !4, null}
!161 = metadata !{i32 127}
!162 = metadata !{i32 88, i32 0, metadata !4, null}
!163 = metadata !{i32 90, i32 0, metadata !4, null}
!164 = metadata !{i32 91, i32 0, metadata !4, null}
!165 = metadata !{%struct.Mat* @p}
!166 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !167} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!167 = metadata !{i32 96, i32 0, metadata !4, null}
!168 = metadata !{i32 194, i32 0, metadata !57, metadata !167}
!169 = metadata !{i32 1}
!170 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !167} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!171 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !167} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!172 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !167} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!173 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !167} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!174 = metadata !{i32 196, i32 0, metadata !57, metadata !167}
!175 = metadata !{metadata !176, metadata !180, i64 8}
!176 = metadata !{metadata !"Mat", metadata !177, i64 0, metadata !180, i64 8, metadata !180, i64 12, metadata !180, i64 16, metadata !180, i64 20}
!177 = metadata !{metadata !"any pointer", metadata !178, i64 0}
!178 = metadata !{metadata !"omnipotent char", metadata !179, i64 0}
!179 = metadata !{metadata !"Simple C/C++ TBAA"}
!180 = metadata !{metadata !"int", metadata !178, i64 0}
!181 = metadata !{i32 197, i32 0, metadata !57, metadata !167}
!182 = metadata !{metadata !176, metadata !180, i64 12}
!183 = metadata !{i32 198, i32 0, metadata !57, metadata !167}
!184 = metadata !{metadata !176, metadata !180, i64 16}
!185 = metadata !{i32 199, i32 0, metadata !57, metadata !167}
!186 = metadata !{metadata !176, metadata !180, i64 20}
!187 = metadata !{i32 202, i32 0, metadata !57, metadata !167}
!188 = metadata !{metadata !176, metadata !177, i64 0}
!189 = metadata !{%struct.Mat* @bnd}
!190 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !191} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!191 = metadata !{i32 97, i32 0, metadata !4, null}
!192 = metadata !{i32 194, i32 0, metadata !57, metadata !191}
!193 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !191} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!194 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !191} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!195 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !191} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!196 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !191} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!197 = metadata !{i32 196, i32 0, metadata !57, metadata !191}
!198 = metadata !{i32 197, i32 0, metadata !57, metadata !191}
!199 = metadata !{i32 198, i32 0, metadata !57, metadata !191}
!200 = metadata !{i32 199, i32 0, metadata !57, metadata !191}
!201 = metadata !{i32 202, i32 0, metadata !57, metadata !191}
!202 = metadata !{%struct.Mat* @wrk1}
!203 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!204 = metadata !{i32 98, i32 0, metadata !4, null}
!205 = metadata !{i32 194, i32 0, metadata !57, metadata !204}
!206 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!207 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!208 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!209 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!210 = metadata !{i32 196, i32 0, metadata !57, metadata !204}
!211 = metadata !{i32 197, i32 0, metadata !57, metadata !204}
!212 = metadata !{i32 198, i32 0, metadata !57, metadata !204}
!213 = metadata !{i32 199, i32 0, metadata !57, metadata !204}
!214 = metadata !{i32 202, i32 0, metadata !57, metadata !204}
!215 = metadata !{%struct.Mat* @wrk2}
!216 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !217} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!217 = metadata !{i32 99, i32 0, metadata !4, null}
!218 = metadata !{i32 194, i32 0, metadata !57, metadata !217}
!219 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !217} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!220 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !217} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!221 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !217} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!222 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !217} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!223 = metadata !{i32 196, i32 0, metadata !57, metadata !217}
!224 = metadata !{i32 197, i32 0, metadata !57, metadata !217}
!225 = metadata !{i32 198, i32 0, metadata !57, metadata !217}
!226 = metadata !{i32 199, i32 0, metadata !57, metadata !217}
!227 = metadata !{i32 202, i32 0, metadata !57, metadata !217}
!228 = metadata !{%struct.Mat* @a}
!229 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!230 = metadata !{i32 100, i32 0, metadata !4, null}
!231 = metadata !{i32 194, i32 0, metadata !57, metadata !230}
!232 = metadata !{i32 4}
!233 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!234 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!235 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!236 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !230} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!237 = metadata !{i32 196, i32 0, metadata !57, metadata !230}
!238 = metadata !{i32 197, i32 0, metadata !57, metadata !230}
!239 = metadata !{i32 198, i32 0, metadata !57, metadata !230}
!240 = metadata !{i32 199, i32 0, metadata !57, metadata !230}
!241 = metadata !{i32 202, i32 0, metadata !57, metadata !230}
!242 = metadata !{%struct.Mat* @b}
!243 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !244} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!244 = metadata !{i32 101, i32 0, metadata !4, null}
!245 = metadata !{i32 194, i32 0, metadata !57, metadata !244}
!246 = metadata !{i32 3}
!247 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !244} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!248 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !244} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!249 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !244} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!250 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !244} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!251 = metadata !{i32 196, i32 0, metadata !57, metadata !244}
!252 = metadata !{i32 197, i32 0, metadata !57, metadata !244}
!253 = metadata !{i32 198, i32 0, metadata !57, metadata !244}
!254 = metadata !{i32 199, i32 0, metadata !57, metadata !244}
!255 = metadata !{i32 202, i32 0, metadata !57, metadata !244}
!256 = metadata !{%struct.Mat* @c}
!257 = metadata !{i32 786689, metadata !57, metadata !"Mat", metadata !5, i32 16777410, metadata !60, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [Mat] [line 194]
!258 = metadata !{i32 102, i32 0, metadata !4, null}
!259 = metadata !{i32 194, i32 0, metadata !57, metadata !258}
!260 = metadata !{i32 786689, metadata !57, metadata !"mnums", metadata !5, i32 33554626, metadata !8, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [mnums] [line 194]
!261 = metadata !{i32 786689, metadata !57, metadata !"mrows", metadata !5, i32 50331842, metadata !8, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [mrows] [line 194]
!262 = metadata !{i32 786689, metadata !57, metadata !"mcols", metadata !5, i32 67109058, metadata !8, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [mcols] [line 194]
!263 = metadata !{i32 786689, metadata !57, metadata !"mdeps", metadata !5, i32 83886274, metadata !8, i32 0, metadata !258} ; [ DW_TAG_arg_variable ] [mdeps] [line 194]
!264 = metadata !{i32 196, i32 0, metadata !57, metadata !258}
!265 = metadata !{i32 197, i32 0, metadata !57, metadata !258}
!266 = metadata !{i32 198, i32 0, metadata !57, metadata !258}
!267 = metadata !{i32 199, i32 0, metadata !57, metadata !258}
!268 = metadata !{i32 202, i32 0, metadata !57, metadata !258}
!269 = metadata !{i32 786689, metadata !91, metadata !"Mat", metadata !5, i32 16777447, metadata !60, i32 0, metadata !270} ; [ DW_TAG_arg_variable ] [Mat] [line 231]
!270 = metadata !{i32 104, i32 0, metadata !4, null}
!271 = metadata !{i32 231, i32 0, metadata !91, metadata !270}
!272 = metadata !{i32 0}
!273 = metadata !{i32 786688, metadata !91, metadata !"i", metadata !5, i32 233, metadata !8, i32 0, metadata !270} ; [ DW_TAG_auto_variable ] [i] [line 233]
!274 = metadata !{i32 236, i32 0, metadata !275, metadata !270}
!275 = metadata !{i32 786443, metadata !1, metadata !91, i32 236, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!276 = metadata !{i32 238, i32 0, metadata !277, metadata !270}
!277 = metadata !{i32 786443, metadata !1, metadata !278, i32 238, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!278 = metadata !{i32 786443, metadata !1, metadata !275, i32 237, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!279 = metadata !{i32 239, i32 0, metadata !277, metadata !270}
!280 = metadata !{metadata !280, metadata !281, metadata !282}
!281 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!282 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!283 = metadata !{i32 237, i32 0, metadata !278, metadata !270}
!284 = metadata !{i32 227, i32 0, metadata !285, metadata !288}
!285 = metadata !{i32 786443, metadata !1, metadata !286, i32 226, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!286 = metadata !{i32 786443, metadata !1, metadata !287, i32 225, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!287 = metadata !{i32 786443, metadata !1, metadata !81, i32 224, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!288 = metadata !{i32 105, i32 0, metadata !4, null}
!289 = metadata !{i32 225, i32 0, metadata !286, metadata !288}
!290 = metadata !{i32 226, i32 0, metadata !285, metadata !288}
!291 = metadata !{metadata !291, metadata !281, metadata !282}
!292 = metadata !{i32 224, i32 0, metadata !287, metadata !288}
!293 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !288} ; [ DW_TAG_auto_variable ] [i] [line 222]
!294 = metadata !{i32 225, i32 0, metadata !286, metadata !295}
!295 = metadata !{i32 106, i32 0, metadata !4, null}
!296 = metadata !{i32 226, i32 0, metadata !285, metadata !295}
!297 = metadata !{i32 227, i32 0, metadata !285, metadata !295}
!298 = metadata !{i32 224, i32 0, metadata !287, metadata !295}
!299 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !295} ; [ DW_TAG_auto_variable ] [i] [line 222]
!300 = metadata !{i32 225, i32 0, metadata !286, metadata !301}
!301 = metadata !{i32 107, i32 0, metadata !4, null}
!302 = metadata !{i32 226, i32 0, metadata !285, metadata !301}
!303 = metadata !{i32 227, i32 0, metadata !285, metadata !301}
!304 = metadata !{i32 224, i32 0, metadata !287, metadata !301}
!305 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !301} ; [ DW_TAG_auto_variable ] [i] [line 222]
!306 = metadata !{i32 227, i32 0, metadata !285, metadata !307}
!307 = metadata !{i32 108, i32 0, metadata !4, null}
!308 = metadata !{i32 225, i32 0, metadata !286, metadata !307}
!309 = metadata !{i32 226, i32 0, metadata !285, metadata !307}
!310 = metadata !{metadata !310, metadata !281, metadata !282}
!311 = metadata !{i32 224, i32 0, metadata !287, metadata !307}
!312 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !307} ; [ DW_TAG_auto_variable ] [i] [line 222]
!313 = metadata !{i32 227, i32 0, metadata !285, metadata !314}
!314 = metadata !{i32 109, i32 0, metadata !4, null}
!315 = metadata !{i32 225, i32 0, metadata !286, metadata !314}
!316 = metadata !{i32 226, i32 0, metadata !285, metadata !314}
!317 = metadata !{metadata !317, metadata !281, metadata !282}
!318 = metadata !{i32 224, i32 0, metadata !287, metadata !314}
!319 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !314} ; [ DW_TAG_auto_variable ] [i] [line 222]
!320 = metadata !{i32 227, i32 0, metadata !285, metadata !321}
!321 = metadata !{i32 110, i32 0, metadata !4, null}
!322 = metadata !{i32 225, i32 0, metadata !286, metadata !321}
!323 = metadata !{i32 226, i32 0, metadata !285, metadata !321}
!324 = metadata !{metadata !324, metadata !281, metadata !282}
!325 = metadata !{i32 224, i32 0, metadata !287, metadata !321}
!326 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !321} ; [ DW_TAG_auto_variable ] [i] [line 222]
!327 = metadata !{i32 227, i32 0, metadata !285, metadata !328}
!328 = metadata !{i32 111, i32 0, metadata !4, null}
!329 = metadata !{i32 225, i32 0, metadata !286, metadata !328}
!330 = metadata !{i32 226, i32 0, metadata !285, metadata !328}
!331 = metadata !{metadata !331, metadata !281, metadata !282}
!332 = metadata !{i32 224, i32 0, metadata !287, metadata !328}
!333 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !328} ; [ DW_TAG_auto_variable ] [i] [line 222]
!334 = metadata !{i32 225, i32 0, metadata !286, metadata !335}
!335 = metadata !{i32 112, i32 0, metadata !4, null}
!336 = metadata !{i32 226, i32 0, metadata !285, metadata !335}
!337 = metadata !{i32 227, i32 0, metadata !285, metadata !335}
!338 = metadata !{i32 224, i32 0, metadata !287, metadata !335}
!339 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !335} ; [ DW_TAG_auto_variable ] [i] [line 222]
!340 = metadata !{i32 225, i32 0, metadata !286, metadata !341}
!341 = metadata !{i32 113, i32 0, metadata !4, null}
!342 = metadata !{i32 226, i32 0, metadata !285, metadata !341}
!343 = metadata !{i32 227, i32 0, metadata !285, metadata !341}
!344 = metadata !{i32 224, i32 0, metadata !287, metadata !341}
!345 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !341} ; [ DW_TAG_auto_variable ] [i] [line 222]
!346 = metadata !{i32 225, i32 0, metadata !286, metadata !347}
!347 = metadata !{i32 114, i32 0, metadata !4, null}
!348 = metadata !{i32 226, i32 0, metadata !285, metadata !347}
!349 = metadata !{i32 227, i32 0, metadata !285, metadata !347}
!350 = metadata !{i32 224, i32 0, metadata !287, metadata !347}
!351 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !347} ; [ DW_TAG_auto_variable ] [i] [line 222]
!352 = metadata !{i32 227, i32 0, metadata !285, metadata !353}
!353 = metadata !{i32 115, i32 0, metadata !4, null}
!354 = metadata !{i32 225, i32 0, metadata !286, metadata !353}
!355 = metadata !{i32 226, i32 0, metadata !285, metadata !353}
!356 = metadata !{metadata !356, metadata !281, metadata !282}
!357 = metadata !{i32 224, i32 0, metadata !287, metadata !353}
!358 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !353} ; [ DW_TAG_auto_variable ] [i] [line 222]
!359 = metadata !{i32 227, i32 0, metadata !285, metadata !360}
!360 = metadata !{i32 116, i32 0, metadata !4, null}
!361 = metadata !{i32 225, i32 0, metadata !286, metadata !360}
!362 = metadata !{i32 226, i32 0, metadata !285, metadata !360}
!363 = metadata !{metadata !363, metadata !281, metadata !282}
!364 = metadata !{i32 224, i32 0, metadata !287, metadata !360}
!365 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !360} ; [ DW_TAG_auto_variable ] [i] [line 222]
!366 = metadata !{i32 227, i32 0, metadata !285, metadata !367}
!367 = metadata !{i32 117, i32 0, metadata !4, null}
!368 = metadata !{i32 225, i32 0, metadata !286, metadata !367}
!369 = metadata !{i32 226, i32 0, metadata !285, metadata !367}
!370 = metadata !{metadata !370, metadata !281, metadata !282}
!371 = metadata !{i32 224, i32 0, metadata !287, metadata !367}
!372 = metadata !{i32 786688, metadata !81, metadata !"i", metadata !5, i32 222, metadata !8, i32 0, metadata !367} ; [ DW_TAG_auto_variable ] [i] [line 222]
!373 = metadata !{i32 122, i32 0, metadata !4, null}
!374 = metadata !{i32 124, i32 0, metadata !4, null}
!375 = metadata !{i32 126, i32 0, metadata !4, null}
!376 = metadata !{i32 127, i32 0, metadata !4, null}
!377 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !378} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!378 = metadata !{i32 132, i32 0, metadata !4, null}
!379 = metadata !{i32 208, i32 0, metadata !76, metadata !378}
!380 = metadata !{i32 210, i32 0, metadata !381, metadata !378}
!381 = metadata !{i32 786443, metadata !1, metadata !76, i32 210, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!382 = metadata !{i32 211, i32 0, metadata !381, metadata !378}
!383 = metadata !{i32 213, i32 0, metadata !76, metadata !378}
!384 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !385} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!385 = metadata !{i32 133, i32 0, metadata !4, null}
!386 = metadata !{i32 208, i32 0, metadata !76, metadata !385}
!387 = metadata !{i32 210, i32 0, metadata !381, metadata !385}
!388 = metadata !{i32 211, i32 0, metadata !381, metadata !385}
!389 = metadata !{i32 213, i32 0, metadata !76, metadata !385}
!390 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !391} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!391 = metadata !{i32 134, i32 0, metadata !4, null}
!392 = metadata !{i32 208, i32 0, metadata !76, metadata !391}
!393 = metadata !{i32 210, i32 0, metadata !381, metadata !391}
!394 = metadata !{i32 211, i32 0, metadata !381, metadata !391}
!395 = metadata !{i32 213, i32 0, metadata !76, metadata !391}
!396 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !397} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!397 = metadata !{i32 135, i32 0, metadata !4, null}
!398 = metadata !{i32 208, i32 0, metadata !76, metadata !397}
!399 = metadata !{i32 210, i32 0, metadata !381, metadata !397}
!400 = metadata !{i32 211, i32 0, metadata !381, metadata !397}
!401 = metadata !{i32 213, i32 0, metadata !76, metadata !397}
!402 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !403} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!403 = metadata !{i32 136, i32 0, metadata !4, null}
!404 = metadata !{i32 208, i32 0, metadata !76, metadata !403}
!405 = metadata !{i32 210, i32 0, metadata !381, metadata !403}
!406 = metadata !{i32 211, i32 0, metadata !381, metadata !403}
!407 = metadata !{i32 213, i32 0, metadata !76, metadata !403}
!408 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !409} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!409 = metadata !{i32 137, i32 0, metadata !4, null}
!410 = metadata !{i32 208, i32 0, metadata !76, metadata !409}
!411 = metadata !{i32 210, i32 0, metadata !381, metadata !409}
!412 = metadata !{i32 211, i32 0, metadata !381, metadata !409}
!413 = metadata !{i32 213, i32 0, metadata !76, metadata !409}
!414 = metadata !{i32 786689, metadata !76, metadata !"Mat", metadata !5, i32 16777424, metadata !60, i32 0, metadata !415} ; [ DW_TAG_arg_variable ] [Mat] [line 208]
!415 = metadata !{i32 138, i32 0, metadata !4, null}
!416 = metadata !{i32 208, i32 0, metadata !76, metadata !415}
!417 = metadata !{i32 210, i32 0, metadata !381, metadata !415}
!418 = metadata !{i32 211, i32 0, metadata !381, metadata !415}
!419 = metadata !{i32 213, i32 0, metadata !76, metadata !415}
!420 = metadata !{i32 140, i32 0, metadata !4, null}
!421 = metadata !{i32 194, i32 0, metadata !57, null}
!422 = metadata !{i32 196, i32 0, metadata !57, null}
!423 = metadata !{i32 197, i32 0, metadata !57, null}
!424 = metadata !{i32 198, i32 0, metadata !57, null}
!425 = metadata !{i32 199, i32 0, metadata !57, null}
!426 = metadata !{i32 200, i32 0, metadata !57, null}
!427 = metadata !{i32 202, i32 0, metadata !57, null}
!428 = metadata !{i32 204, i32 0, metadata !57, null}
!429 = metadata !{i32 231, i32 0, metadata !91, null}
!430 = metadata !{i32 236, i32 0, metadata !275, null}
!431 = metadata !{i32 237, i32 0, metadata !278, null}
!432 = metadata !{i32 238, i32 0, metadata !277, null}
!433 = metadata !{i32 239, i32 0, metadata !277, null}
!434 = metadata !{metadata !434, metadata !281, metadata !282}
!435 = metadata !{metadata !435, metadata !281, metadata !282}
!436 = metadata !{metadata !436, metadata !281, metadata !282}
!437 = metadata !{metadata !438, metadata !438, i64 0}
!438 = metadata !{metadata !"float", metadata !178, i64 0}
!439 = metadata !{metadata !439, metadata !281, metadata !282}
!440 = metadata !{metadata !440, metadata !281, metadata !282}
!441 = metadata !{metadata !441, metadata !281, metadata !282}
!442 = metadata !{i32 241, i32 0, metadata !91, null}
!443 = metadata !{i32 220, i32 0, metadata !81, null}
!444 = metadata !{i32 224, i32 0, metadata !287, null}
!445 = metadata !{i32 225, i32 0, metadata !286, null}
!446 = metadata !{i32 226, i32 0, metadata !285, null}
!447 = metadata !{i32 227, i32 0, metadata !285, null}
!448 = metadata !{metadata !448, metadata !281, metadata !282}
!449 = metadata !{metadata !449, metadata !281, metadata !282}
!450 = metadata !{i32 228, i32 0, metadata !81, null}
!451 = metadata !{i32 244, i32 0, metadata !99, null}
!452 = metadata !{i32 245, i32 0, metadata !99, null}
!453 = metadata !{i32 250, i32 0, metadata !99, null}
!454 = metadata !{i32 251, i32 0, metadata !99, null}
!455 = metadata !{i32 252, i32 0, metadata !99, null}
!456 = metadata !{i32 254, i32 0, metadata !457, null}
!457 = metadata !{i32 786443, metadata !1, metadata !99, i32 254, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!458 = metadata !{i32 257, i32 0, metadata !459, null}
!459 = metadata !{i32 786443, metadata !1, metadata !460, i32 257, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!460 = metadata !{i32 786443, metadata !1, metadata !457, i32 254, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!461 = metadata !{i32 284, i32 0, metadata !462, null}
!462 = metadata !{i32 786443, metadata !1, metadata !463, i32 284, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!463 = metadata !{i32 786443, metadata !1, metadata !460, i32 283, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!464 = metadata !{i32 285, i32 0, metadata !465, null}
!465 = metadata !{i32 786443, metadata !1, metadata !462, i32 285, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!466 = metadata !{i32 286, i32 0, metadata !465, null}
!467 = metadata !{i32 260, i32 0, metadata !468, null}
!468 = metadata !{i32 786443, metadata !1, metadata !469, i32 259, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!469 = metadata !{i32 786443, metadata !1, metadata !470, i32 259, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!470 = metadata !{i32 786443, metadata !1, metadata !459, i32 258, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!471 = metadata !{i32 277, i32 0, metadata !468, null}
!472 = metadata !{i32 283, i32 0, metadata !463, null}
!473 = metadata !{i32 258, i32 0, metadata !470, null}
!474 = metadata !{i32 259, i32 0, metadata !469, null}
!475 = metadata !{i32 280, i32 0, metadata !468, null}
!476 = metadata !{i32 279, i32 0, metadata !468, null}
!477 = metadata !{metadata !477, metadata !281, metadata !282}
!478 = metadata !{metadata !478, metadata !281, metadata !282}
!479 = metadata !{i32 290, i32 0, metadata !99, null}
!480 = metadata !{i32 208, i32 0, metadata !76, null}
!481 = metadata !{i32 210, i32 0, metadata !381, null}
!482 = metadata !{i32 211, i32 0, metadata !381, null}
!483 = metadata !{i32 217, i32 0, metadata !76, null}
!484 = metadata !{i32 213, i32 0, metadata !76, null}
!485 = metadata !{i32 144, i32 0, metadata !36, null}
!486 = metadata !{i32 146, i32 0, metadata !36, null}
!487 = metadata !{i32 150, i32 0, metadata !43, null}
!488 = metadata !{i32 152, i32 0, metadata !43, null}
!489 = metadata !{i32 156, i32 0, metadata !50, null}
!490 = metadata !{i32 158, i32 0, metadata !491, null}
!491 = metadata !{i32 786443, metadata !1, metadata !50, i32 158, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!492 = metadata !{i32 159, i32 0, metadata !493, null}
!493 = metadata !{i32 786443, metadata !1, metadata !491, i32 158, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!494 = metadata !{metadata !180, metadata !180, i64 0}
!495 = metadata !{i32 160, i32 0, metadata !493, null}
!496 = metadata !{i32 161, i32 0, metadata !493, null}
!497 = metadata !{i32 162, i32 0, metadata !493, null}
!498 = metadata !{i32 164, i32 0, metadata !499, null}
!499 = metadata !{i32 786443, metadata !1, metadata !50, i32 164, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!500 = metadata !{i32 165, i32 0, metadata !501, null}
!501 = metadata !{i32 786443, metadata !1, metadata !499, i32 164, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!502 = metadata !{i32 166, i32 0, metadata !501, null}
!503 = metadata !{i32 167, i32 0, metadata !501, null}
!504 = metadata !{i32 168, i32 0, metadata !501, null}
!505 = metadata !{i32 170, i32 0, metadata !506, null}
!506 = metadata !{i32 786443, metadata !1, metadata !50, i32 170, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!507 = metadata !{i32 171, i32 0, metadata !508, null}
!508 = metadata !{i32 786443, metadata !1, metadata !506, i32 170, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!509 = metadata !{i32 172, i32 0, metadata !508, null}
!510 = metadata !{i32 173, i32 0, metadata !508, null}
!511 = metadata !{i32 174, i32 0, metadata !508, null}
!512 = metadata !{i32 176, i32 0, metadata !513, null}
!513 = metadata !{i32 786443, metadata !1, metadata !50, i32 176, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!514 = metadata !{i32 177, i32 0, metadata !515, null}
!515 = metadata !{i32 786443, metadata !1, metadata !513, i32 176, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!516 = metadata !{i32 178, i32 0, metadata !515, null}
!517 = metadata !{i32 179, i32 0, metadata !515, null}
!518 = metadata !{i32 180, i32 0, metadata !515, null}
!519 = metadata !{i32 182, i32 0, metadata !520, null}
!520 = metadata !{i32 786443, metadata !1, metadata !50, i32 182, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!521 = metadata !{i32 183, i32 0, metadata !522, null}
!522 = metadata !{i32 786443, metadata !1, metadata !520, i32 182, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!523 = metadata !{i32 184, i32 0, metadata !522, null}
!524 = metadata !{i32 185, i32 0, metadata !522, null}
!525 = metadata !{i32 186, i32 0, metadata !522, null}
!526 = metadata !{i32 188, i32 0, metadata !527, null}
!527 = metadata !{i32 786443, metadata !1, metadata !520, i32 187, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!528 = metadata !{i32 189, i32 0, metadata !527, null}
!529 = metadata !{i32 191, i32 0, metadata !50, null}
!530 = metadata !{i32 297, i32 0, metadata !121, null}
!531 = metadata !{i32 302, i32 0, metadata !121, null}
!532 = metadata !{i32 304, i32 0, metadata !533, null}
!533 = metadata !{i32 786443, metadata !1, metadata !121, i32 304, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!534 = metadata !{i32 306, i32 0, metadata !535, null}
!535 = metadata !{i32 786443, metadata !1, metadata !533, i32 305, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!536 = metadata !{metadata !537, metadata !538, i64 0}
!537 = metadata !{metadata !"timeval", metadata !538, i64 0, metadata !538, i64 8}
!538 = metadata !{metadata !"long", metadata !178, i64 0}
!539 = metadata !{i32 307, i32 0, metadata !535, null}
!540 = metadata !{metadata !537, metadata !538, i64 8}
!541 = metadata !{double 0.000000e+00}
!542 = metadata !{i32 308, i32 0, metadata !535, null}
!543 = metadata !{i32 309, i32 0, metadata !535, null}
!544 = metadata !{i32 310, i32 0, metadata !545, null}
!545 = metadata !{i32 786443, metadata !1, metadata !533, i32 309, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/himenobmtxpa.c]
!546 = metadata !{i32 314, i32 0, metadata !121, null}
