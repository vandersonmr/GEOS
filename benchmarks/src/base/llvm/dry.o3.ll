; ModuleID = 'dry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, i32, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@Array2Glob = common global [51 x [51 x i32]] zeroinitializer, align 16
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x i32] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = tail call i32 @Proc0(), !dbg !159
  ret i32 0, !dbg !160
}

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
  tail call void @llvm.dbg.declare(metadata !161, metadata !28), !dbg !162
  tail call void @llvm.dbg.declare(metadata !163, metadata !33), !dbg !164
  %1 = tail call i32 (...)* @clock() #7, !dbg !165
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !34), !dbg !167
  %2 = tail call i32 (...)* @clock() #7, !dbg !169
  %3 = tail call noalias i8* @malloc(i64 56) #7, !dbg !170
  %4 = bitcast i8* %3 to %struct.Record*, !dbg !170
  store %struct.Record* %4, %struct.Record** @PtrGlbNext, align 8, !dbg !170, !tbaa !171
  %5 = tail call noalias i8* @malloc(i64 56) #7, !dbg !175
  %6 = bitcast i8* %5 to %struct.Record*, !dbg !175
  store %struct.Record* %6, %struct.Record** @PtrGlb, align 8, !dbg !175, !tbaa !171
  %7 = bitcast i8* %5 to %struct.Record**, !dbg !176
  store %struct.Record* %4, %struct.Record** %7, align 8, !dbg !176, !tbaa !177
  %8 = getelementptr inbounds i8* %5, i64 8, !dbg !180
  %9 = bitcast i8* %8 to i32*, !dbg !180
  store i32 0, i32* %9, align 4, !dbg !180, !tbaa !181
  %10 = getelementptr inbounds i8* %5, i64 12, !dbg !182
  %11 = bitcast i8* %10 to i32*, !dbg !182
  store i32 10001, i32* %11, align 4, !dbg !182, !tbaa !183
  %12 = getelementptr inbounds i8* %5, i64 16, !dbg !184
  %13 = bitcast i8* %12 to i32*, !dbg !184
  store i32 40, i32* %13, align 4, !dbg !184, !tbaa !185
  %14 = getelementptr inbounds i8* %5, i64 20, !dbg !186
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* getelementptr inbounds ([31 x i8]* @.str, i64 0, i64 0), i64 31, i32 1, i1 false), !dbg !186
  store i32 10, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 7), align 4, !dbg !187, !tbaa !188
  %15 = tail call i32 (...)* @clock() #7, !dbg !189
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !34), !dbg !190
  br label %Func2.exit, !dbg !190

Func2.exit:                                       ; preds = %Proc2.exit, %0
  %i.15 = phi i32 [ 0, %0 ], [ %28, %Proc2.exit ]
  store i8 65, i8* @Char1Glob, align 1, !dbg !192, !tbaa !195
  store i8 66, i8* @Char2Glob, align 1, !dbg !196, !tbaa !195
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !199
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !200), !dbg !202
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !203
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !204
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !206
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !207
  tail call void @llvm.dbg.value(metadata !198, i64 0, metadata !19), !dbg !208
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !21), !dbg !210
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !26), !dbg !212
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !213), !dbg !217
  tail call void @llvm.dbg.value(metadata !211, i64 0, metadata !26), !dbg !218
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !220) #7, !dbg !222
  tail call void @llvm.dbg.value(metadata !223, i64 0, metadata !224) #7, !dbg !225
  tail call void @llvm.dbg.value(metadata !226, i64 0, metadata !227) #7, !dbg !228
  store i32 1, i32* @BoolGlob, align 4, !dbg !221, !tbaa !188
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !229), !dbg !230
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !231), !dbg !232
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !22), !dbg !234
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !235), !dbg !236
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !22), !dbg !237
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !206
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !200), !dbg !202
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !203
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !204
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !206
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !207
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !208
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !229), !dbg !230
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !231), !dbg !232
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !22), !dbg !234
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !235), !dbg !236
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !22), !dbg !237
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !206
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !200), !dbg !202
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !203
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !204
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !206
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !207
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !19), !dbg !208
  tail call void @llvm.dbg.value(metadata !238, i64 0, metadata !239), !dbg !240
  tail call void @llvm.dbg.value(metadata !241, i64 0, metadata !242), !dbg !243
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !244), !dbg !245
  tail call void @llvm.dbg.value(metadata !246, i64 0, metadata !247), !dbg !248
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !249), !dbg !250
  store i32 7, i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i64 0, i64 8), align 16, !dbg !251, !tbaa !188
  store i32 7, i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i64 0, i64 9), align 4, !dbg !252, !tbaa !188
  store i32 8, i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i64 0, i64 38), align 8, !dbg !253, !tbaa !188
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !254), !dbg !255
  store i32 8, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 8), align 16, !dbg !257, !tbaa !188
  store i32 8, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 9), align 4, !dbg !257, !tbaa !188
  %16 = load i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 7), align 4, !dbg !258, !tbaa !188
  %17 = add nsw i32 %16, 1, !dbg !258
  store i32 %17, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 7), align 4, !dbg !258, !tbaa !188
  store i32 7, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 28, i64 8), align 16, !dbg !259, !tbaa !188
  store i32 5, i32* @IntGlob, align 4, !dbg !260, !tbaa !188
  %18 = load %struct.Record** @PtrGlb, align 8, !dbg !261, !tbaa !171
  tail call void @llvm.dbg.value(metadata !{%struct.Record* %18}, i64 0, metadata !262), !dbg !263
  %19 = getelementptr inbounds %struct.Record* %18, i64 0, i32 3, !dbg !264
  store i32 5, i32* %19, align 4, !dbg !264, !tbaa !185
  %20 = getelementptr inbounds %struct.Record* %18, i64 0, i32 0, !dbg !265
  %21 = load %struct.Record** %20, align 8, !dbg !265, !tbaa !177
  %22 = getelementptr inbounds %struct.Record* %21, i64 0, i32 3, !dbg !265
  store i32 5, i32* %22, align 4, !dbg !265, !tbaa !185
  %23 = getelementptr inbounds %struct.Record* %21, i64 0, i32 0, !dbg !266
  store %struct.Record* %21, %struct.Record** %23, align 8, !dbg !266, !tbaa !177
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !25), !dbg !268
  %24 = load i8* @Char2Glob, align 1, !dbg !268, !tbaa !195
  %25 = icmp slt i8 %24, 65, !dbg !268
  br i1 %25, label %Proc2.exit, label %.lr.ph, !dbg !268

.lr.ph:                                           ; preds = %Func2.exit, %.lr.ph
  %CharIndex.04 = phi i8 [ %26, %.lr.ph ], [ 65, %Func2.exit ]
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !269), !dbg !270
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !271), !dbg !274
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !275), !dbg !276
  tail call void @llvm.dbg.value(metadata !277, i64 0, metadata !26), !dbg !278
  tail call void @llvm.dbg.value(metadata !277, i64 0, metadata !213), !dbg !217
  tail call void @llvm.dbg.value(metadata !277, i64 0, metadata !26), !dbg !218
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !26), !dbg !279
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !213), !dbg !217
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !26), !dbg !218
  %26 = add i8 %CharIndex.04, 1, !dbg !268
  tail call void @llvm.dbg.value(metadata !{i8 %26}, i64 0, metadata !25), !dbg !268
  %27 = icmp sgt i8 %26, %24, !dbg !268
  br i1 %27, label %Proc2.exit, label %.lr.ph, !dbg !268

Proc2.exit:                                       ; preds = %.lr.ph, %Func2.exit
  tail call void @llvm.dbg.value(metadata !209, i64 0, metadata !21), !dbg !208
  %28 = add i32 %i.15, 1, !dbg !190
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !34), !dbg !190
  %exitcond = icmp eq i32 %28, 100000000, !dbg !190
  br i1 %exitcond, label %29, label %Func2.exit, !dbg !190

; <label>:29                                      ; preds = %Proc2.exit
  ret i32 undef, !dbg !281
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @clock(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* nocapture %PtrParIn) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Record* %PtrParIn}, i64 0, metadata !55), !dbg !282
  %1 = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 3, !dbg !283
  store i32 5, i32* %1, align 4, !dbg !283, !tbaa !185
  %2 = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 0, !dbg !284
  %3 = load %struct.Record** %2, align 8, !dbg !284, !tbaa !177
  %4 = getelementptr inbounds %struct.Record* %3, i64 0, i32 3, !dbg !284
  store i32 5, i32* %4, align 4, !dbg !284, !tbaa !185
  %5 = getelementptr inbounds %struct.Record* %3, i64 0, i32 0, !dbg !285
  store %struct.Record* %3, %struct.Record** %5, align 8, !dbg !285, !tbaa !177
  ret i32 undef, !dbg !286
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(i32* nocapture %IntParIO) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %IntParIO}, i64 0, metadata !61), !dbg !287
  %1 = load i8* @Char1Glob, align 1, !dbg !288, !tbaa !195
  %2 = icmp eq i8 %1, 65, !dbg !288
  br i1 %2, label %3, label %8, !dbg !288

; <label>:3                                       ; preds = %0
  %4 = load i32* %IntParIO, align 4, !dbg !292, !tbaa !188
  %5 = add nsw i32 %4, 9, !dbg !293
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !62), !dbg !293
  %6 = load i32* @IntGlob, align 4, !dbg !295, !tbaa !188
  %7 = sub i32 %5, %6, !dbg !295
  store i32 %7, i32* %IntParIO, align 4, !dbg !295, !tbaa !188
  tail call void @llvm.dbg.value(metadata !166, i64 0, metadata !63), !dbg !296
  br label %8, !dbg !297

; <label>:8                                       ; preds = %0, %3
  ret i32 undef, !dbg !298
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** nocapture %PtrParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Record** %PtrParOut}, i64 0, metadata !69), !dbg !299
  %1 = load %struct.Record** @PtrGlb, align 8, !dbg !300, !tbaa !171
  %2 = getelementptr inbounds %struct.Record* %1, i64 0, i32 0, !dbg !302
  %3 = load %struct.Record** %2, align 8, !dbg !302, !tbaa !177
  store %struct.Record* %3, %struct.Record** %PtrParOut, align 8, !dbg !302, !tbaa !171
  %.pre = load i32* @IntGlob, align 4, !dbg !303, !tbaa !188
  %.pre1 = load %struct.Record** @PtrGlb, align 8, !dbg !303, !tbaa !171
  %phitmp = add i32 %.pre, 12, !dbg !302
  %4 = getelementptr inbounds %struct.Record* %.pre1, i64 0, i32 3, !dbg !303
  tail call void @llvm.dbg.value(metadata !304, i64 0, metadata !305), !dbg !306
  tail call void @llvm.dbg.value(metadata !{i32* %4}, i64 0, metadata !307), !dbg !308
  tail call void @llvm.dbg.value(metadata !309, i64 0, metadata !310), !dbg !311
  store i32 %phitmp, i32* %4, align 4, !dbg !312, !tbaa !188
  ret i32 undef, !dbg !313
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
  store i8 66, i8* @Char2Glob, align 1, !dbg !314, !tbaa !195
  ret i32 undef, !dbg !315
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
  store i8 65, i8* @Char1Glob, align 1, !dbg !316, !tbaa !195
  store i32 0, i32* @BoolGlob, align 4, !dbg !317, !tbaa !188
  ret i32 undef, !dbg !318
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* nocapture %EnumParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !80), !dbg !319
  tail call void @llvm.dbg.value(metadata !{i32* %EnumParOut}, i64 0, metadata !81), !dbg !320
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !321), !dbg !323
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !324), !dbg !325
  %1 = icmp eq i32 %EnumParIn, 10001, !dbg !326
  %.EnumParIn = select i1 %1, i32 10001, i32 10002, !dbg !322
  store i32 %.EnumParIn, i32* %EnumParOut, align 4, !dbg !328, !tbaa !195
  switch i32 %EnumParIn, label %10 [
    i32 0, label %2
    i32 10000, label %3
    i32 10001, label %8
    i32 10003, label %9
  ], !dbg !329

; <label>:2                                       ; preds = %0
  store i32 0, i32* %EnumParOut, align 4, !dbg !330, !tbaa !195
  br label %10, !dbg !330

; <label>:3                                       ; preds = %0
  %4 = load i32* @IntGlob, align 4, !dbg !331, !tbaa !188
  %5 = icmp sgt i32 %4, 100, !dbg !331
  br i1 %5, label %6, label %7, !dbg !331

; <label>:6                                       ; preds = %3
  store i32 0, i32* %EnumParOut, align 4, !dbg !331, !tbaa !195
  br label %10, !dbg !331

; <label>:7                                       ; preds = %3
  store i32 10002, i32* %EnumParOut, align 4, !dbg !333, !tbaa !195
  br label %10

; <label>:8                                       ; preds = %0
  store i32 10000, i32* %EnumParOut, align 4, !dbg !334, !tbaa !195
  br label %10, !dbg !334

; <label>:9                                       ; preds = %0
  store i32 10001, i32* %EnumParOut, align 4, !dbg !335, !tbaa !195
  br label %10, !dbg !336

; <label>:10                                      ; preds = %6, %7, %9, %0, %8, %2
  ret i32 undef, !dbg !337
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(i32 %IntParI1, i32 %IntParI2, i32* nocapture %IntParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %IntParI1}, i64 0, metadata !86), !dbg !338
  tail call void @llvm.dbg.value(metadata !{i32 %IntParI2}, i64 0, metadata !87), !dbg !339
  tail call void @llvm.dbg.value(metadata !{i32* %IntParOut}, i64 0, metadata !88), !dbg !340
  %1 = add nsw i32 %IntParI1, 2, !dbg !341
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !89), !dbg !341
  %2 = add nsw i32 %1, %IntParI2, !dbg !342
  store i32 %2, i32* %IntParOut, align 4, !dbg !342, !tbaa !188
  ret i32 undef, !dbg !343
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(i32* nocapture %Array1Par, [51 x i32]* nocapture %Array2Par, i32 %IntParI1, i32 %IntParI2) #0 {
  tail call void @llvm.dbg.value(metadata !{i32* %Array1Par}, i64 0, metadata !99), !dbg !344
  tail call void @llvm.dbg.value(metadata !{[51 x i32]* %Array2Par}, i64 0, metadata !100), !dbg !345
  tail call void @llvm.dbg.value(metadata !{i32 %IntParI1}, i64 0, metadata !101), !dbg !346
  tail call void @llvm.dbg.value(metadata !{i32 %IntParI2}, i64 0, metadata !102), !dbg !347
  %1 = add i32 %IntParI1, 5, !dbg !348
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !103), !dbg !348
  %2 = sext i32 %1 to i64, !dbg !349
  %3 = getelementptr inbounds i32* %Array1Par, i64 %2, !dbg !349
  store i32 %IntParI2, i32* %3, align 4, !dbg !349, !tbaa !188
  %4 = add nsw i32 %IntParI1, 6, !dbg !350
  %5 = sext i32 %4 to i64, !dbg !350
  %6 = getelementptr inbounds i32* %Array1Par, i64 %5, !dbg !350
  store i32 %IntParI2, i32* %6, align 4, !dbg !350, !tbaa !188
  %7 = add nsw i32 %IntParI1, 35, !dbg !351
  %8 = sext i32 %7 to i64, !dbg !351
  %9 = getelementptr inbounds i32* %Array1Par, i64 %8, !dbg !351
  store i32 %1, i32* %9, align 4, !dbg !351, !tbaa !188
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !104), !dbg !352
  %10 = add i32 %IntParI1, 6, !dbg !352
  %11 = add i32 %IntParI1, 5, !dbg !352
  %12 = icmp sgt i32 %10, %11
  %smax = select i1 %12, i32 %10, i32 %11
  %13 = add i32 %smax, -5, !dbg !352
  %14 = sub i32 %13, %IntParI1, !dbg !352
  %15 = zext i32 %14 to i64
  %16 = add i64 %15, 1, !dbg !352
  %end.idx = add i64 %16, %2, !dbg !352
  %n.vec = and i64 %16, -4, !dbg !352
  %end.idx.rnd.down = add i64 %n.vec, %2, !dbg !352
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !352
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %0
  %broadcast.splatinsert3 = insertelement <2 x i32> undef, i32 %1, i32 0
  %broadcast.splat4 = shufflevector <2 x i32> %broadcast.splatinsert3, <2 x i32> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ %2, %vector.ph ], [ %index.next, %vector.body ], !dbg !352
  %17 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %2, i64 %index, !dbg !353
  %18 = bitcast i32* %17 to <2 x i32>*, !dbg !353
  store <2 x i32> %broadcast.splat4, <2 x i32>* %18, align 4, !dbg !353
  %.sum = add i64 %index, 2, !dbg !353
  %19 = getelementptr [51 x i32]* %Array2Par, i64 %2, i64 %.sum, !dbg !353
  %20 = bitcast i32* %19 to <2 x i32>*, !dbg !353
  store <2 x i32> %broadcast.splat4, <2 x i32>* %20, align 4, !dbg !353
  %index.next = add i64 %index, 4, !dbg !352
  %21 = icmp eq i64 %index.next, %end.idx.rnd.down, !dbg !352
  br i1 %21, label %middle.block, label %vector.body, !dbg !352, !llvm.loop !354

middle.block:                                     ; preds = %vector.body, %0
  %resume.val = phi i64 [ %2, %0 ], [ %end.idx.rnd.down, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %25, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %resume.val, %middle.block ]
  %22 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %2, i64 %indvars.iv, !dbg !353
  store i32 %1, i32* %22, align 4, !dbg !353, !tbaa !188
  %23 = trunc i64 %indvars.iv to i32, !dbg !352
  %24 = icmp slt i32 %23, %4, !dbg !352
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !352
  br i1 %24, label %scalar.ph, label %25, !dbg !352, !llvm.loop !357

; <label>:25                                      ; preds = %middle.block, %scalar.ph
  %26 = add nsw i32 %IntParI1, 4, !dbg !358
  %27 = sext i32 %26 to i64, !dbg !358
  %28 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %2, i64 %27, !dbg !358
  %29 = load i32* %28, align 4, !dbg !358, !tbaa !188
  %30 = add nsw i32 %29, 1, !dbg !358
  store i32 %30, i32* %28, align 4, !dbg !358, !tbaa !188
  %31 = load i32* %3, align 4, !dbg !359, !tbaa !188
  %32 = add nsw i32 %IntParI1, 25, !dbg !359
  %33 = sext i32 %32 to i64, !dbg !359
  %34 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %33, i64 %2, !dbg !359
  store i32 %31, i32* %34, align 4, !dbg !359, !tbaa !188
  store i32 5, i32* @IntGlob, align 4, !dbg !360, !tbaa !188
  ret i32 undef, !dbg !361
}

; Function Attrs: nounwind readnone uwtable
define i32 @Func1(i32, i32) #4 {
  %sext = shl i32 %0, 24, !dbg !362
  %sext1 = shl i32 %1, 24, !dbg !362
  %3 = icmp eq i32 %sext, %sext1, !dbg !362
  %. = select i1 %3, i32 10000, i32 0, !dbg !364
  ret i32 %., !dbg !365
}

; Function Attrs: nounwind readonly uwtable
define i32 @Func2(i8* nocapture readonly %StrParI1, i8* nocapture readonly %StrParI2) #5 {
  tail call void @llvm.dbg.value(metadata !{i8* %StrParI1}, i64 0, metadata !119), !dbg !366
  tail call void @llvm.dbg.value(metadata !{i8* %StrParI2}, i64 0, metadata !120), !dbg !367
  tail call void @llvm.dbg.value(metadata !226, i64 0, metadata !121), !dbg !368
  br label %1, !dbg !369

; <label>:1                                       ; preds = %0, %1
  %IntLoc.01 = phi i32 [ 1, %0 ], [ %.IntLoc.0, %1 ]
  %2 = sext i32 %IntLoc.01 to i64, !dbg !370
  %3 = getelementptr inbounds i8* %StrParI1, i64 %2, !dbg !370
  %4 = load i8* %3, align 1, !dbg !370, !tbaa !195
  %5 = add nsw i32 %IntLoc.01, 1, !dbg !370
  %6 = sext i32 %5 to i64, !dbg !370
  %7 = getelementptr inbounds i8* %StrParI2, i64 %6, !dbg !370
  %8 = load i8* %7, align 1, !dbg !370, !tbaa !195
  %not. = icmp ne i8 %4, %8, !dbg !370
  tail call void @llvm.dbg.value(metadata !267, i64 0, metadata !123), !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %5}, i64 0, metadata !121), !dbg !374
  %.IntLoc.0 = select i1 %not., i32 %5, i32 %IntLoc.01, !dbg !370
  %9 = icmp slt i32 %.IntLoc.0, 2, !dbg !369
  br i1 %9, label %1, label %10, !dbg !369

; <label>:10                                      ; preds = %1
  %11 = tail call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #7, !dbg !375
  %12 = icmp sgt i32 %11, 0, !dbg !375
  %. = zext i1 %12 to i32, !dbg !376
  ret i32 %., !dbg !378
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind readnone uwtable
define i32 @Func3(i32 %EnumParIn) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !137), !dbg !379
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !138), !dbg !380
  %1 = icmp eq i32 %EnumParIn, 10001, !dbg !381
  %. = zext i1 %1 to i32, !dbg !381
  ret i32 %., !dbg !382
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!156, !157}
!llvm.ident = !{!158}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !10, metadata !11, metadata !139, metadata !10, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c] [DW_LANG_C99]
!1 = metadata !{metadata !"dry.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 133, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 133, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !8, metadata !9}
!5 = metadata !{i32 786472, metadata !"Ident1", i64 0} ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = metadata !{i32 786472, metadata !"Ident2", i64 10000} ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = metadata !{i32 786472, metadata !"Ident3", i64 10001} ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = metadata !{i32 786472, metadata !"Ident4", i64 10002} ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = metadata !{i32 786472, metadata !"Ident5", i64 10003} ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = metadata !{}
!11 = metadata !{metadata !12, metadata !17, metadata !40, metadata !56, metadata !64, metadata !70, metadata !74, metadata !75, metadata !82, metadata !90, metadata !105, metadata !114, metadata !133}
!12 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"main", metadata !"main", metadata !"", i32 173, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !10, i32 174} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!13 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc0", metadata !"Proc0", metadata !"", i32 191, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc0, null, null, metadata !18, i32 192} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [Proc0]
!18 = metadata !{metadata !19, metadata !21, metadata !22, metadata !23, metadata !25, metadata !26, metadata !28, metadata !33, metadata !34, metadata !36, metadata !38, metadata !39}
!19 = metadata !{i32 786688, metadata !17, metadata !"IntLoc1", metadata !13, i32 193, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 193]
!20 = metadata !{i32 786454, metadata !1, null, metadata !"OneToFifty", i32 137, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [OneToFifty] [line 137, size 0, align 0, offset 0] [from int]
!21 = metadata !{i32 786688, metadata !17, metadata !"IntLoc2", metadata !13, i32 194, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 194]
!22 = metadata !{i32 786688, metadata !17, metadata !"IntLoc3", metadata !13, i32 195, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 195]
!23 = metadata !{i32 786688, metadata !17, metadata !"CharLoc", metadata !13, i32 196, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 196]
!24 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!25 = metadata !{i32 786688, metadata !17, metadata !"CharIndex", metadata !13, i32 197, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharIndex] [line 197]
!26 = metadata !{i32 786688, metadata !17, metadata !"EnumLoc", metadata !13, i32 198, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 198]
!27 = metadata !{i32 786454, metadata !1, null, metadata !"Enumeration", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ] [Enumeration] [line 133, size 0, align 0, offset 0] [from ]
!28 = metadata !{i32 786688, metadata !17, metadata !"String1Loc", metadata !13, i32 199, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String1Loc] [line 199]
!29 = metadata !{i32 786454, metadata !1, null, metadata !"String30", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [String30] [line 139, size 0, align 0, offset 0] [from ]
!30 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 248, i64 8, i32 0, i32 0, metadata !24, metadata !31, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 31}       ; [ DW_TAG_subrange_type ] [0, 30]
!33 = metadata !{i32 786688, metadata !17, metadata !"String2Loc", metadata !13, i32 200, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String2Loc] [line 200]
!34 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !13, i32 201, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 201]
!35 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{i32 786688, metadata !17, metadata !"starttime", metadata !13, i32 204, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [starttime] [line 204]
!37 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!38 = metadata !{i32 786688, metadata !17, metadata !"benchtime", metadata !13, i32 205, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [benchtime] [line 205]
!39 = metadata !{i32 786688, metadata !17, metadata !"nulltime", metadata !13, i32 206, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nulltime] [line 206]
!40 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc1", metadata !"Proc1", metadata !"", i32 318, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.Record*)* @Proc1, null, null, metadata !54, i32 320} ; [ DW_TAG_subprogram ] [line 318] [def] [scope 320] [Proc1]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !16, metadata !43}
!43 = metadata !{i32 786454, metadata !1, null, metadata !"RecordPtr", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [RecordPtr] [line 153, size 0, align 0, offset 0] [from ]
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!45 = metadata !{i32 786454, metadata !1, null, metadata !"RecordType", i32 152, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ] [RecordType] [line 152, size 0, align 0, offset 0] [from Record]
!46 = metadata !{i32 786451, metadata !1, null, metadata !"Record", i32 143, i64 448, i64 64, i32 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 143, size 448, align 64, offset 0] [def] [from ]
!47 = metadata !{metadata !48, metadata !50, metadata !51, metadata !52, metadata !53}
!48 = metadata !{i32 786445, metadata !1, metadata !46, metadata !"PtrComp", i32 145, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_member ] [PtrComp] [line 145, size 64, align 64, offset 0] [from ]
!49 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!50 = metadata !{i32 786445, metadata !1, metadata !46, metadata !"Discr", i32 146, i64 32, i64 32, i64 64, i32 0, metadata !27} ; [ DW_TAG_member ] [Discr] [line 146, size 32, align 32, offset 64] [from Enumeration]
!51 = metadata !{i32 786445, metadata !1, metadata !46, metadata !"EnumComp", i32 147, i64 32, i64 32, i64 96, i32 0, metadata !27} ; [ DW_TAG_member ] [EnumComp] [line 147, size 32, align 32, offset 96] [from Enumeration]
!52 = metadata !{i32 786445, metadata !1, metadata !46, metadata !"IntComp", i32 148, i64 32, i64 32, i64 128, i32 0, metadata !20} ; [ DW_TAG_member ] [IntComp] [line 148, size 32, align 32, offset 128] [from OneToFifty]
!53 = metadata !{i32 786445, metadata !1, metadata !46, metadata !"StringComp", i32 149, i64 248, i64 8, i64 160, i32 0, metadata !29} ; [ DW_TAG_member ] [StringComp] [line 149, size 248, align 8, offset 160] [from String30]
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786689, metadata !40, metadata !"PtrParIn", metadata !13, i32 16777535, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 319]
!56 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc2", metadata !"Proc2", metadata !"", i32 342, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32*)* @Proc2, null, null, metadata !60, i32 344} ; [ DW_TAG_subprogram ] [line 342] [def] [scope 344] [Proc2]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !16, metadata !59}
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!60 = metadata !{metadata !61, metadata !62, metadata !63}
!61 = metadata !{i32 786689, metadata !56, metadata !"IntParIO", metadata !13, i32 16777559, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParIO] [line 343]
!62 = metadata !{i32 786688, metadata !56, metadata !"IntLoc", metadata !13, i32 345, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 345]
!63 = metadata !{i32 786688, metadata !56, metadata !"EnumLoc", metadata !13, i32 346, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 346]
!64 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc3", metadata !"Proc3", metadata !"", i32 362, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.Record**)* @Proc3, null, null, metadata !68, i32 364} ; [ DW_TAG_subprogram ] [line 362] [def] [scope 364] [Proc3]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !16, metadata !67}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786689, metadata !64, metadata !"PtrParOut", metadata !13, i32 16777579, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 363]
!70 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc4", metadata !"Proc4", metadata !"", i32 372, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc4, null, null, metadata !71, i32 373} ; [ DW_TAG_subprogram ] [line 372] [def] [scope 373] [Proc4]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 786688, metadata !70, metadata !"BoolLoc", metadata !13, i32 374, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 374]
!73 = metadata !{i32 786454, metadata !1, null, metadata !"boolean", i32 154, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [boolean] [line 154, size 0, align 0, offset 0] [from int]
!74 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc5", metadata !"Proc5", metadata !"", i32 381, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc5, null, null, metadata !10, i32 382} ; [ DW_TAG_subprogram ] [line 381] [def] [scope 382] [Proc5]
!75 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc6", metadata !"Proc6", metadata !"", i32 389, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32*)* @Proc6, null, null, metadata !79, i32 392} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 392] [Proc6]
!76 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = metadata !{metadata !16, metadata !27, metadata !78}
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!79 = metadata !{metadata !80, metadata !81}
!80 = metadata !{i32 786689, metadata !75, metadata !"EnumParIn", metadata !13, i32 16777606, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 390]
!81 = metadata !{i32 786689, metadata !75, metadata !"EnumParOut", metadata !13, i32 33554823, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 391]
!82 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc7", metadata !"Proc7", metadata !"", i32 408, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32, i32*)* @Proc7, null, null, metadata !85, i32 412} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 412] [Proc7]
!83 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !16, metadata !20, metadata !20, metadata !59}
!85 = metadata !{metadata !86, metadata !87, metadata !88, metadata !89}
!86 = metadata !{i32 786689, metadata !82, metadata !"IntParI1", metadata !13, i32 16777625, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 409]
!87 = metadata !{i32 786689, metadata !82, metadata !"IntParI2", metadata !13, i32 33554842, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 410]
!88 = metadata !{i32 786689, metadata !82, metadata !"IntParOut", metadata !13, i32 50332059, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParOut] [line 411]
!89 = metadata !{i32 786688, metadata !82, metadata !"IntLoc", metadata !13, i32 413, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 413]
!90 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc8", metadata !"Proc8", metadata !"", i32 419, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32*, [51 x i32]*, i32, i32)* @Proc8, null, null, metadata !98, i32 424} ; [ DW_TAG_subprogram ] [line 419] [def] [scope 424] [Proc8]
!91 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{metadata !16, metadata !93, metadata !94, metadata !20, metadata !20}
!93 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!94 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!95 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1632, i64 32, i32 0, i32 0, metadata !16, metadata !96, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1632, align 32, offset 0] [from int]
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786465, i64 0, i64 51}       ; [ DW_TAG_subrange_type ] [0, 50]
!98 = metadata !{metadata !99, metadata !100, metadata !101, metadata !102, metadata !103, metadata !104}
!99 = metadata !{i32 786689, metadata !90, metadata !"Array1Par", metadata !13, i32 16777636, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array1Par] [line 420]
!100 = metadata !{i32 786689, metadata !90, metadata !"Array2Par", metadata !13, i32 33554853, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array2Par] [line 421]
!101 = metadata !{i32 786689, metadata !90, metadata !"IntParI1", metadata !13, i32 50332070, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 422]
!102 = metadata !{i32 786689, metadata !90, metadata !"IntParI2", metadata !13, i32 67109287, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 423]
!103 = metadata !{i32 786688, metadata !90, metadata !"IntLoc", metadata !13, i32 425, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 425]
!104 = metadata !{i32 786688, metadata !90, metadata !"IntIndex", metadata !13, i32 426, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntIndex] [line 426]
!105 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func1", metadata !"Func1", metadata !"", i32 439, metadata !106, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32)* @Func1, null, null, metadata !109, i32 442} ; [ DW_TAG_subprogram ] [line 439] [def] [scope 442] [Func1]
!106 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !107, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!107 = metadata !{metadata !27, metadata !108, metadata !108}
!108 = metadata !{i32 786454, metadata !1, null, metadata !"CapitalLetter", i32 138, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [CapitalLetter] [line 138, size 0, align 0, offset 0] [from char]
!109 = metadata !{metadata !110, metadata !111, metadata !112, metadata !113}
!110 = metadata !{i32 786689, metadata !105, metadata !"CharPar1", metadata !13, i32 16777656, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar1] [line 440]
!111 = metadata !{i32 786689, metadata !105, metadata !"CharPar2", metadata !13, i32 33554873, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar2] [line 441]
!112 = metadata !{i32 786688, metadata !105, metadata !"CharLoc1", metadata !13, i32 443, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 443]
!113 = metadata !{i32 786688, metadata !105, metadata !"CharLoc2", metadata !13, i32 444, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 444]
!114 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func2", metadata !"Func2", metadata !"", i32 454, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i8*, i8*)* @Func2, null, null, metadata !118, i32 457} ; [ DW_TAG_subprogram ] [line 454] [def] [scope 457] [Func2]
!115 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!116 = metadata !{metadata !73, metadata !117, metadata !117}
!117 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!118 = metadata !{metadata !119, metadata !120, metadata !121, metadata !123, metadata !124, metadata !132}
!119 = metadata !{i32 786689, metadata !114, metadata !"StrParI1", metadata !13, i32 16777671, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI1] [line 455]
!120 = metadata !{i32 786689, metadata !114, metadata !"StrParI2", metadata !13, i32 33554888, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI2] [line 456]
!121 = metadata !{i32 786688, metadata !114, metadata !"IntLoc", metadata !13, i32 458, metadata !122, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 458]
!122 = metadata !{i32 786454, metadata !1, null, metadata !"OneToThirty", i32 136, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [OneToThirty] [line 136, size 0, align 0, offset 0] [from int]
!123 = metadata !{i32 786688, metadata !114, metadata !"CharLoc", metadata !13, i32 459, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 459]
!124 = metadata !{i32 786688, metadata !125, metadata !"__s1_len", metadata !13, i32 474, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 474]
!125 = metadata !{i32 786443, metadata !1, metadata !126, i32 474, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!126 = metadata !{i32 786443, metadata !1, metadata !127, i32 474, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!127 = metadata !{i32 786443, metadata !1, metadata !128, i32 473, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!128 = metadata !{i32 786443, metadata !1, metadata !114, i32 470, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!129 = metadata !{i32 786454, metadata !130, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !131} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!130 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!131 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!132 = metadata !{i32 786688, metadata !125, metadata !"__s2_len", metadata !13, i32 474, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 474]
!133 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func3", metadata !"Func3", metadata !"", i32 484, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32)* @Func3, null, null, metadata !136, i32 486} ; [ DW_TAG_subprogram ] [line 484] [def] [scope 486] [Func3]
!134 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !73, metadata !27}
!136 = metadata !{metadata !137, metadata !138}
!137 = metadata !{i32 786689, metadata !133, metadata !"EnumParIn", metadata !13, i32 16777701, metadata !27, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 485]
!138 = metadata !{i32 786688, metadata !133, metadata !"EnumLoc", metadata !13, i32 487, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 487]
!139 = metadata !{metadata !140, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !150, metadata !154, metadata !155}
!140 = metadata !{i32 786484, i32 0, null, metadata !"Version", metadata !"Version", metadata !"", metadata !13, i32 116, metadata !141, i32 0, i32 1, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 116] [def]
!141 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !24, metadata !142, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!144 = metadata !{i32 786484, i32 0, null, metadata !"IntGlob", metadata !"IntGlob", metadata !"", metadata !13, i32 182, metadata !16, i32 0, i32 1, i32* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 182] [def]
!145 = metadata !{i32 786484, i32 0, null, metadata !"BoolGlob", metadata !"BoolGlob", metadata !"", metadata !13, i32 183, metadata !73, i32 0, i32 1, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 183] [def]
!146 = metadata !{i32 786484, i32 0, null, metadata !"Char1Glob", metadata !"Char1Glob", metadata !"", metadata !13, i32 184, metadata !24, i32 0, i32 1, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 184] [def]
!147 = metadata !{i32 786484, i32 0, null, metadata !"Char2Glob", metadata !"Char2Glob", metadata !"", metadata !13, i32 185, metadata !24, i32 0, i32 1, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 185] [def]
!148 = metadata !{i32 786484, i32 0, null, metadata !"Array1Glob", metadata !"Array1Glob", metadata !"", metadata !13, i32 186, metadata !149, i32 0, i32 1, [51 x i32]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 186] [def]
!149 = metadata !{i32 786454, metadata !1, null, metadata !"Array1Dim", i32 140, i64 0, i64 0, i64 0, i32 0, metadata !95} ; [ DW_TAG_typedef ] [Array1Dim] [line 140, size 0, align 0, offset 0] [from ]
!150 = metadata !{i32 786484, i32 0, null, metadata !"Array2Glob", metadata !"Array2Glob", metadata !"", metadata !13, i32 187, metadata !151, i32 0, i32 1, [51 x [51 x i32]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 187] [def]
!151 = metadata !{i32 786454, metadata !1, null, metadata !"Array2Dim", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !152} ; [ DW_TAG_typedef ] [Array2Dim] [line 141, size 0, align 0, offset 0] [from ]
!152 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 83232, i64 32, i32 0, i32 0, metadata !16, metadata !153, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 83232, align 32, offset 0] [from int]
!153 = metadata !{metadata !97, metadata !97}
!154 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlb", metadata !"PtrGlb", metadata !"", metadata !13, i32 188, metadata !43, i32 0, i32 1, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 188] [def]
!155 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlbNext", metadata !"PtrGlbNext", metadata !"", metadata !13, i32 189, metadata !43, i32 0, i32 1, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 189] [def]
!156 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!157 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!158 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!159 = metadata !{i32 175, i32 0, metadata !12, null}
!160 = metadata !{i32 176, i32 0, metadata !12, null}
!161 = metadata !{null}
!162 = metadata !{i32 199, i32 0, metadata !17, null}
!163 = metadata !{null}
!164 = metadata !{i32 200, i32 0, metadata !17, null}
!165 = metadata !{i32 208, i32 0, metadata !17, null}
!166 = metadata !{i32 0}
!167 = metadata !{i32 209, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !17, i32 209, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!169 = metadata !{i32 210, i32 0, metadata !17, null}
!170 = metadata !{i32 234, i32 0, metadata !17, null}
!171 = metadata !{metadata !172, metadata !172, i64 0}
!172 = metadata !{metadata !"any pointer", metadata !173, i64 0}
!173 = metadata !{metadata !"omnipotent char", metadata !174, i64 0}
!174 = metadata !{metadata !"Simple C/C++ TBAA"}
!175 = metadata !{i32 235, i32 0, metadata !17, null}
!176 = metadata !{i32 236, i32 0, metadata !17, null}
!177 = metadata !{metadata !178, metadata !172, i64 0}
!178 = metadata !{metadata !"Record", metadata !172, i64 0, metadata !173, i64 8, metadata !173, i64 12, metadata !179, i64 16, metadata !173, i64 20}
!179 = metadata !{metadata !"int", metadata !173, i64 0}
!180 = metadata !{i32 237, i32 0, metadata !17, null}
!181 = metadata !{metadata !178, metadata !173, i64 8}
!182 = metadata !{i32 238, i32 0, metadata !17, null}
!183 = metadata !{metadata !178, metadata !173, i64 12}
!184 = metadata !{i32 239, i32 0, metadata !17, null}
!185 = metadata !{metadata !178, metadata !179, i64 16}
!186 = metadata !{i32 240, i32 0, metadata !17, null}
!187 = metadata !{i32 244, i32 0, metadata !17, null}
!188 = metadata !{metadata !179, metadata !179, i64 0}
!189 = metadata !{i32 250, i32 0, metadata !17, null}
!190 = metadata !{i32 258, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !1, metadata !17, i32 258, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!192 = metadata !{i32 383, i32 0, metadata !74, metadata !193}
!193 = metadata !{i32 260, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !1, metadata !191, i32 259, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!195 = metadata !{metadata !173, metadata !173, i64 0}
!196 = metadata !{i32 378, i32 0, metadata !70, metadata !197}
!197 = metadata !{i32 261, i32 0, metadata !194, null}
!198 = metadata !{i32 2}
!199 = metadata !{i32 262, i32 0, metadata !194, null}
!200 = metadata !{i32 786689, metadata !56, metadata !"IntParIO", metadata !13, i32 16777559, metadata !59, i32 0, metadata !201} ; [ DW_TAG_arg_variable ] [IntParIO] [line 343]
!201 = metadata !{i32 281, i32 0, metadata !194, null}
!202 = metadata !{i32 343, i32 0, metadata !56, metadata !201}
!203 = metadata !{i32 267, i32 0, metadata !194, null}
!204 = metadata !{i32 270, i32 0, metadata !205, null}
!205 = metadata !{i32 786443, metadata !1, metadata !194, i32 268, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!206 = metadata !{i32 271, i32 0, metadata !205, null}
!207 = metadata !{i32 278, i32 0, metadata !194, null}
!208 = metadata !{i32 279, i32 0, metadata !194, null}
!209 = metadata !{i32 3}
!210 = metadata !{i32 263, i32 0, metadata !194, null}
!211 = metadata !{i32 10000}
!212 = metadata !{i32 265, i32 0, metadata !194, null}
!213 = metadata !{i32 786689, metadata !75, metadata !"EnumParOut", metadata !13, i32 33554823, metadata !78, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 391]
!214 = metadata !{i32 277, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !216, i32 276, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!216 = metadata !{i32 786443, metadata !1, metadata !194, i32 275, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!217 = metadata !{i32 391, i32 0, metadata !75, metadata !214}
!218 = metadata !{i32 276, i32 0, metadata !215, null}
!219 = metadata !{null}
!220 = metadata !{i32 786689, metadata !114, metadata !"StrParI1", metadata !13, i32 16777671, metadata !117, i32 0, metadata !221} ; [ DW_TAG_arg_variable ] [StrParI1] [line 455]
!221 = metadata !{i32 266, i32 0, metadata !194, null}
!222 = metadata !{i32 455, i32 0, metadata !114, metadata !221}
!223 = metadata !{null}
!224 = metadata !{i32 786689, metadata !114, metadata !"StrParI2", metadata !13, i32 33554888, metadata !117, i32 0, metadata !221} ; [ DW_TAG_arg_variable ] [StrParI2] [line 456]
!225 = metadata !{i32 456, i32 0, metadata !114, metadata !221}
!226 = metadata !{i32 1}
!227 = metadata !{i32 786688, metadata !114, metadata !"IntLoc", metadata !13, i32 458, metadata !122, i32 0, metadata !221} ; [ DW_TAG_auto_variable ] [IntLoc] [line 458]
!228 = metadata !{i32 461, i32 0, metadata !114, metadata !221}
!229 = metadata !{i32 786689, metadata !82, metadata !"IntParI1", metadata !13, i32 16777625, metadata !20, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [IntParI1] [line 409]
!230 = metadata !{i32 409, i32 0, metadata !82, metadata !204}
!231 = metadata !{i32 786689, metadata !82, metadata !"IntParI2", metadata !13, i32 33554842, metadata !20, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [IntParI2] [line 410]
!232 = metadata !{i32 410, i32 0, metadata !82, metadata !204}
!233 = metadata !{i32 8}
!234 = metadata !{i32 416, i32 0, metadata !82, metadata !204}
!235 = metadata !{i32 786689, metadata !82, metadata !"IntParOut", metadata !13, i32 50332059, metadata !59, i32 0, metadata !204} ; [ DW_TAG_arg_variable ] [IntParOut] [line 411]
!236 = metadata !{i32 411, i32 0, metadata !82, metadata !204}
!237 = metadata !{i32 273, i32 0, metadata !194, null}
!238 = metadata !{null}
!239 = metadata !{i32 786689, metadata !90, metadata !"Array1Par", metadata !13, i32 16777636, metadata !93, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [Array1Par] [line 420]
!240 = metadata !{i32 420, i32 0, metadata !90, metadata !237}
!241 = metadata !{null}
!242 = metadata !{i32 786689, metadata !90, metadata !"Array2Par", metadata !13, i32 33554853, metadata !94, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [Array2Par] [line 421]
!243 = metadata !{i32 421, i32 0, metadata !90, metadata !237}
!244 = metadata !{i32 786689, metadata !90, metadata !"IntParI1", metadata !13, i32 50332070, metadata !20, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [IntParI1] [line 422]
!245 = metadata !{i32 422, i32 0, metadata !90, metadata !237}
!246 = metadata !{i32 7}
!247 = metadata !{i32 786689, metadata !90, metadata !"IntParI2", metadata !13, i32 67109287, metadata !20, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [IntParI2] [line 423]
!248 = metadata !{i32 423, i32 0, metadata !90, metadata !237}
!249 = metadata !{i32 786688, metadata !90, metadata !"IntLoc", metadata !13, i32 425, metadata !20, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [IntLoc] [line 425]
!250 = metadata !{i32 428, i32 0, metadata !90, metadata !237}
!251 = metadata !{i32 429, i32 0, metadata !90, metadata !237}
!252 = metadata !{i32 430, i32 0, metadata !90, metadata !237}
!253 = metadata !{i32 431, i32 0, metadata !90, metadata !237}
!254 = metadata !{i32 786688, metadata !90, metadata !"IntIndex", metadata !13, i32 426, metadata !20, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [IntIndex] [line 426]
!255 = metadata !{i32 432, i32 0, metadata !256, metadata !237}
!256 = metadata !{i32 786443, metadata !1, metadata !90, i32 432, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!257 = metadata !{i32 433, i32 0, metadata !256, metadata !237}
!258 = metadata !{i32 434, i32 0, metadata !90, metadata !237}
!259 = metadata !{i32 435, i32 0, metadata !90, metadata !237}
!260 = metadata !{i32 436, i32 0, metadata !90, metadata !237}
!261 = metadata !{i32 274, i32 0, metadata !194, null}
!262 = metadata !{i32 786689, metadata !40, metadata !"PtrParIn", metadata !13, i32 16777535, metadata !43, i32 0, metadata !261} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 319]
!263 = metadata !{i32 319, i32 0, metadata !40, metadata !261}
!264 = metadata !{i32 324, i32 0, metadata !40, metadata !261}
!265 = metadata !{i32 325, i32 0, metadata !40, metadata !261}
!266 = metadata !{i32 326, i32 0, metadata !40, metadata !261}
!267 = metadata !{i8 65}
!268 = metadata !{i32 275, i32 0, metadata !216, null}
!269 = metadata !{i32 786689, metadata !75, metadata !"EnumParIn", metadata !13, i32 16777606, metadata !27, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 390]
!270 = metadata !{i32 390, i32 0, metadata !75, metadata !214}
!271 = metadata !{i32 786689, metadata !133, metadata !"EnumParIn", metadata !13, i32 16777701, metadata !27, i32 0, metadata !272} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 485]
!272 = metadata !{i32 394, i32 0, metadata !273, metadata !214}
!273 = metadata !{i32 786443, metadata !1, metadata !75, i32 394, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!274 = metadata !{i32 485, i32 0, metadata !133, metadata !272}
!275 = metadata !{i32 786688, metadata !133, metadata !"EnumLoc", metadata !13, i32 487, metadata !27, i32 0, metadata !272} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 487]
!276 = metadata !{i32 489, i32 0, metadata !133, metadata !272}
!277 = metadata !{i32 10002}
!278 = metadata !{i32 395, i32 0, metadata !273, metadata !214}
!279 = metadata !{i32 398, i32 0, metadata !280, metadata !214}
!280 = metadata !{i32 786443, metadata !1, metadata !75, i32 397, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!281 = metadata !{i32 316, i32 0, metadata !17, null}
!282 = metadata !{i32 319, i32 0, metadata !40, null}
!283 = metadata !{i32 324, i32 0, metadata !40, null}
!284 = metadata !{i32 325, i32 0, metadata !40, null}
!285 = metadata !{i32 326, i32 0, metadata !40, null}
!286 = metadata !{i32 340, i32 0, metadata !40, null}
!287 = metadata !{i32 343, i32 0, metadata !56, null}
!288 = metadata !{i32 351, i32 0, metadata !289, null}
!289 = metadata !{i32 786443, metadata !1, metadata !290, i32 351, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!290 = metadata !{i32 786443, metadata !1, metadata !291, i32 350, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!291 = metadata !{i32 786443, metadata !1, metadata !56, i32 349, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!292 = metadata !{i32 348, i32 0, metadata !56, null}
!293 = metadata !{i32 353, i32 0, metadata !294, null}
!294 = metadata !{i32 786443, metadata !1, metadata !289, i32 352, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!295 = metadata !{i32 354, i32 0, metadata !294, null}
!296 = metadata !{i32 355, i32 0, metadata !294, null}
!297 = metadata !{i32 356, i32 0, metadata !294, null}
!298 = metadata !{i32 360, i32 0, metadata !56, null}
!299 = metadata !{i32 363, i32 0, metadata !64, null}
!300 = metadata !{i32 365, i32 0, metadata !301, null}
!301 = metadata !{i32 786443, metadata !1, metadata !64, i32 365, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!302 = metadata !{i32 366, i32 0, metadata !301, null}
!303 = metadata !{i32 369, i32 0, metadata !64, null}
!304 = metadata !{i32 10}
!305 = metadata !{i32 786689, metadata !82, metadata !"IntParI1", metadata !13, i32 16777625, metadata !20, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [IntParI1] [line 409]
!306 = metadata !{i32 409, i32 0, metadata !82, metadata !303}
!307 = metadata !{i32 786689, metadata !82, metadata !"IntParOut", metadata !13, i32 50332059, metadata !59, i32 0, metadata !303} ; [ DW_TAG_arg_variable ] [IntParOut] [line 411]
!308 = metadata !{i32 411, i32 0, metadata !82, metadata !303}
!309 = metadata !{i32 12}
!310 = metadata !{i32 786688, metadata !82, metadata !"IntLoc", metadata !13, i32 413, metadata !20, i32 0, metadata !303} ; [ DW_TAG_auto_variable ] [IntLoc] [line 413]
!311 = metadata !{i32 415, i32 0, metadata !82, metadata !303}
!312 = metadata !{i32 416, i32 0, metadata !82, metadata !303}
!313 = metadata !{i32 370, i32 0, metadata !64, null}
!314 = metadata !{i32 378, i32 0, metadata !70, null}
!315 = metadata !{i32 379, i32 0, metadata !70, null}
!316 = metadata !{i32 383, i32 0, metadata !74, null}
!317 = metadata !{i32 384, i32 0, metadata !74, null}
!318 = metadata !{i32 385, i32 0, metadata !74, null}
!319 = metadata !{i32 390, i32 0, metadata !75, null}
!320 = metadata !{i32 391, i32 0, metadata !75, null}
!321 = metadata !{i32 786689, metadata !133, metadata !"EnumParIn", metadata !13, i32 16777701, metadata !27, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 485]
!322 = metadata !{i32 394, i32 0, metadata !273, null}
!323 = metadata !{i32 485, i32 0, metadata !133, metadata !322}
!324 = metadata !{i32 786688, metadata !133, metadata !"EnumLoc", metadata !13, i32 487, metadata !27, i32 0, metadata !322} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 487]
!325 = metadata !{i32 489, i32 0, metadata !133, metadata !322}
!326 = metadata !{i32 490, i32 0, metadata !327, metadata !322}
!327 = metadata !{i32 786443, metadata !1, metadata !133, i32 490, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!328 = metadata !{i32 395, i32 0, metadata !273, null}
!329 = metadata !{i32 396, i32 0, metadata !75, null}
!330 = metadata !{i32 398, i32 0, metadata !280, null}
!331 = metadata !{i32 399, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !280, i32 399, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!333 = metadata !{i32 400, i32 0, metadata !332, null}
!334 = metadata !{i32 402, i32 0, metadata !280, null}
!335 = metadata !{i32 404, i32 0, metadata !280, null}
!336 = metadata !{i32 405, i32 0, metadata !280, null}
!337 = metadata !{i32 406, i32 0, metadata !75, null}
!338 = metadata !{i32 409, i32 0, metadata !82, null}
!339 = metadata !{i32 410, i32 0, metadata !82, null}
!340 = metadata !{i32 411, i32 0, metadata !82, null}
!341 = metadata !{i32 415, i32 0, metadata !82, null}
!342 = metadata !{i32 416, i32 0, metadata !82, null}
!343 = metadata !{i32 417, i32 0, metadata !82, null}
!344 = metadata !{i32 420, i32 0, metadata !90, null}
!345 = metadata !{i32 421, i32 0, metadata !90, null}
!346 = metadata !{i32 422, i32 0, metadata !90, null}
!347 = metadata !{i32 423, i32 0, metadata !90, null}
!348 = metadata !{i32 428, i32 0, metadata !90, null}
!349 = metadata !{i32 429, i32 0, metadata !90, null}
!350 = metadata !{i32 430, i32 0, metadata !90, null}
!351 = metadata !{i32 431, i32 0, metadata !90, null}
!352 = metadata !{i32 432, i32 0, metadata !256, null}
!353 = metadata !{i32 433, i32 0, metadata !256, null}
!354 = metadata !{metadata !354, metadata !355, metadata !356}
!355 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!356 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!357 = metadata !{metadata !357, metadata !355, metadata !356}
!358 = metadata !{i32 434, i32 0, metadata !90, null}
!359 = metadata !{i32 435, i32 0, metadata !90, null}
!360 = metadata !{i32 436, i32 0, metadata !90, null}
!361 = metadata !{i32 437, i32 0, metadata !90, null}
!362 = metadata !{i32 448, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !1, metadata !105, i32 448, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!364 = metadata !{i32 451, i32 0, metadata !363, null}
!365 = metadata !{i32 452, i32 0, metadata !105, null}
!366 = metadata !{i32 455, i32 0, metadata !114, null}
!367 = metadata !{i32 456, i32 0, metadata !114, null}
!368 = metadata !{i32 461, i32 0, metadata !114, null}
!369 = metadata !{i32 462, i32 0, metadata !114, null}
!370 = metadata !{i32 463, i32 0, metadata !371, null}
!371 = metadata !{i32 786443, metadata !1, metadata !114, i32 463, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!372 = metadata !{i32 465, i32 0, metadata !373, null}
!373 = metadata !{i32 786443, metadata !1, metadata !371, i32 464, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!374 = metadata !{i32 466, i32 0, metadata !373, null}
!375 = metadata !{i32 474, i32 0, metadata !125, null}
!376 = metadata !{i32 477, i32 0, metadata !377, null}
!377 = metadata !{i32 786443, metadata !1, metadata !126, i32 475, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/dry.c]
!378 = metadata !{i32 482, i32 0, metadata !114, null}
!379 = metadata !{i32 485, i32 0, metadata !133, null}
!380 = metadata !{i32 489, i32 0, metadata !133, null}
!381 = metadata !{i32 490, i32 0, metadata !327, null}
!382 = metadata !{i32 492, i32 0, metadata !133, null}
