; ModuleID = 'fldry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, double, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@.str = private unnamed_addr constant [53 x i8] c"calculate floating dhrystones using doubles size %d\0A\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@Array2Glob = common global [51 x [51 x double]] zeroinitializer, align 16
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x double] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !21), !dbg !166
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !22), !dbg !167
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str, i64 0, i64 0), i64 8) #7, !dbg !168
  %2 = tail call i32 @Proc0(), !dbg !169
  ret i32 0, !dbg !170
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
  tail call void @llvm.dbg.declare(metadata !171, metadata !36), !dbg !172
  tail call void @llvm.dbg.declare(metadata !173, metadata !41), !dbg !174
  %1 = tail call i32 (...)* @clock() #7, !dbg !175
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !42), !dbg !177
  %2 = tail call i32 (...)* @clock() #7, !dbg !179
  %3 = tail call noalias i8* @malloc(i64 56) #7, !dbg !180
  %4 = bitcast i8* %3 to %struct.Record*, !dbg !180
  store %struct.Record* %4, %struct.Record** @PtrGlbNext, align 8, !dbg !180, !tbaa !181
  %5 = tail call noalias i8* @malloc(i64 56) #7, !dbg !185
  %6 = bitcast i8* %5 to %struct.Record*, !dbg !185
  store %struct.Record* %6, %struct.Record** @PtrGlb, align 8, !dbg !185, !tbaa !181
  %7 = bitcast i8* %5 to %struct.Record**, !dbg !186
  store %struct.Record* %4, %struct.Record** %7, align 8, !dbg !186, !tbaa !187
  %8 = getelementptr inbounds i8* %5, i64 8, !dbg !190
  %9 = bitcast i8* %8 to i32*, !dbg !190
  store i32 0, i32* %9, align 4, !dbg !190, !tbaa !191
  %10 = getelementptr inbounds i8* %5, i64 12, !dbg !192
  %11 = bitcast i8* %10 to i32*, !dbg !192
  store i32 10001, i32* %11, align 4, !dbg !192, !tbaa !193
  %12 = getelementptr inbounds i8* %5, i64 16, !dbg !194
  %13 = bitcast i8* %12 to double*, !dbg !194
  store double 4.000000e+01, double* %13, align 8, !dbg !194, !tbaa !195
  %14 = getelementptr inbounds i8* %5, i64 24, !dbg !196
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* getelementptr inbounds ([31 x i8]* @.str1, i64 0, i64 0), i64 31, i32 1, i1 false), !dbg !196
  store double 1.000000e+01, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !197, !tbaa !198
  %15 = tail call i32 (...)* @clock() #7, !dbg !199
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !42), !dbg !200
  br label %Proc8.exit, !dbg !200

Proc8.exit:                                       ; preds = %Proc2.exit, %0
  %i.16 = phi i32 [ 0, %0 ], [ %28, %Proc2.exit ]
  store i8 65, i8* @Char1Glob, align 1, !dbg !202, !tbaa !205
  store i8 66, i8* @Char2Glob, align 1, !dbg !206, !tbaa !205
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !209
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !210), !dbg !212
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !213
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !214
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !216
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !217
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !27), !dbg !218
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !30), !dbg !220
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !34), !dbg !222
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !223), !dbg !227
  tail call void @llvm.dbg.value(metadata !221, i64 0, metadata !34), !dbg !228
  tail call void @llvm.dbg.value(metadata !229, i64 0, metadata !230) #7, !dbg !232
  tail call void @llvm.dbg.value(metadata !233, i64 0, metadata !234) #7, !dbg !235
  tail call void @llvm.dbg.value(metadata !236, i64 0, metadata !237) #7, !dbg !238
  tail call void @llvm.dbg.value(metadata !239, i64 0, metadata !240) #7, !dbg !241
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !237) #7, !dbg !244
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !245), !dbg !246
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !247), !dbg !248
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !216
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !210), !dbg !212
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !213
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !214
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !216
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !217
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !27), !dbg !218
  tail call void @llvm.dbg.value(metadata !249, i64 0, metadata !250), !dbg !252
  tail call void @llvm.dbg.value(metadata !253, i64 0, metadata !254), !dbg !255
  tail call void @llvm.dbg.value(metadata !219, i64 0, metadata !256), !dbg !257
  tail call void @llvm.dbg.value(metadata !258, i64 0, metadata !259), !dbg !260
  tail call void @llvm.dbg.value(metadata !261, i64 0, metadata !262), !dbg !263
  store double 7.000000e+00, double* getelementptr inbounds ([51 x double]* @Array1Glob, i64 0, i64 8), align 16, !dbg !264, !tbaa !198
  store double 7.000000e+00, double* getelementptr inbounds ([51 x double]* @Array1Glob, i64 0, i64 9), align 8, !dbg !265, !tbaa !198
  store double 8.000000e+00, double* getelementptr inbounds ([51 x double]* @Array1Glob, i64 0, i64 38), align 16, !dbg !266, !tbaa !198
  tail call void @llvm.dbg.value(metadata !261, i64 0, metadata !267), !dbg !268
  store double 8.000000e+00, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 8), align 16, !dbg !270, !tbaa !198
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !267), !dbg !268
  store double 8.000000e+00, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 9), align 8, !dbg !270, !tbaa !198
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !267), !dbg !268
  %16 = load double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !272, !tbaa !198
  %17 = fadd double %16, 1.000000e+00, !dbg !272
  store double %17, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !272, !tbaa !198
  store double 7.000000e+00, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 28, i64 8), align 16, !dbg !273, !tbaa !198
  store double 5.000000e+00, double* @IntGlob, align 8, !dbg !274, !tbaa !198
  %18 = load %struct.Record** @PtrGlb, align 8, !dbg !275, !tbaa !181
  tail call void @llvm.dbg.value(metadata !{%struct.Record* %18}, i64 0, metadata !276), !dbg !277
  %19 = getelementptr inbounds %struct.Record* %18, i64 0, i32 3, !dbg !278
  store double 5.000000e+00, double* %19, align 8, !dbg !278, !tbaa !195
  %20 = getelementptr inbounds %struct.Record* %18, i64 0, i32 0, !dbg !279
  %21 = load %struct.Record** %20, align 8, !dbg !279, !tbaa !187
  %22 = getelementptr inbounds %struct.Record* %21, i64 0, i32 3, !dbg !279
  store double 5.000000e+00, double* %22, align 8, !dbg !279, !tbaa !195
  %23 = getelementptr inbounds %struct.Record* %21, i64 0, i32 0, !dbg !280
  store %struct.Record* %21, %struct.Record** %23, align 8, !dbg !280, !tbaa !187
  tail call void @llvm.dbg.value(metadata !239, i64 0, metadata !33), !dbg !281
  %24 = load i8* @Char2Glob, align 1, !dbg !281, !tbaa !205
  %25 = icmp slt i8 %24, 65, !dbg !281
  br i1 %25, label %Proc2.exit, label %.lr.ph, !dbg !281

.lr.ph:                                           ; preds = %Proc8.exit, %.lr.ph
  %CharIndex.05 = phi i8 [ %26, %.lr.ph ], [ 65, %Proc8.exit ]
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !282), !dbg !283
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !284), !dbg !287
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !288), !dbg !289
  tail call void @llvm.dbg.value(metadata !290, i64 0, metadata !34), !dbg !291
  tail call void @llvm.dbg.value(metadata !290, i64 0, metadata !223), !dbg !227
  tail call void @llvm.dbg.value(metadata !290, i64 0, metadata !34), !dbg !228
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !34), !dbg !292
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !223), !dbg !227
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !34), !dbg !228
  %26 = add i8 %CharIndex.05, 1, !dbg !281
  tail call void @llvm.dbg.value(metadata !{i8 %26}, i64 0, metadata !33), !dbg !281
  %27 = icmp sgt i8 %26, %24, !dbg !281
  br i1 %27, label %Proc2.exit, label %.lr.ph, !dbg !281

Proc2.exit:                                       ; preds = %.lr.ph, %Proc8.exit
  %28 = add i32 %i.16, 1, !dbg !200
  tail call void @llvm.dbg.value(metadata !{i32 %28}, i64 0, metadata !42), !dbg !200
  %exitcond = icmp eq i32 %28, 100000000, !dbg !200
  br i1 %exitcond, label %29, label %Proc8.exit, !dbg !200

; <label>:29                                      ; preds = %Proc2.exit
  store i32 1, i32* @BoolGlob, align 4, !dbg !294, !tbaa !295
  ret i32 undef, !dbg !297
}

declare i32 @clock(...) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* nocapture %PtrParIn) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Record* %PtrParIn}, i64 0, metadata !63), !dbg !298
  %1 = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 3, !dbg !299
  store double 5.000000e+00, double* %1, align 8, !dbg !299, !tbaa !195
  %2 = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 0, !dbg !300
  %3 = load %struct.Record** %2, align 8, !dbg !300, !tbaa !187
  %4 = getelementptr inbounds %struct.Record* %3, i64 0, i32 3, !dbg !300
  store double 5.000000e+00, double* %4, align 8, !dbg !300, !tbaa !195
  %5 = getelementptr inbounds %struct.Record* %3, i64 0, i32 0, !dbg !301
  store %struct.Record* %3, %struct.Record** %5, align 8, !dbg !301, !tbaa !187
  ret i32 undef, !dbg !302
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(double* nocapture %IntParIO) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %IntParIO}, i64 0, metadata !69), !dbg !303
  tail call void @llvm.dbg.value(metadata !{double %5}, i64 0, metadata !70), !dbg !304
  %1 = load i8* @Char1Glob, align 1, !dbg !305, !tbaa !205
  %2 = icmp eq i8 %1, 65, !dbg !305
  br i1 %2, label %3, label %9, !dbg !305

; <label>:3                                       ; preds = %0
  %4 = load double* %IntParIO, align 8, !dbg !304, !tbaa !198
  %5 = fadd double %4, 1.000000e+01, !dbg !304
  %6 = fadd double %5, -1.000000e+00, !dbg !309
  tail call void @llvm.dbg.value(metadata !{double %6}, i64 0, metadata !70), !dbg !309
  %7 = load double* @IntGlob, align 8, !dbg !311, !tbaa !198
  %8 = fsub double %6, %7, !dbg !311
  store double %8, double* %IntParIO, align 8, !dbg !311, !tbaa !198
  tail call void @llvm.dbg.value(metadata !176, i64 0, metadata !71), !dbg !312
  br label %9, !dbg !313

; <label>:9                                       ; preds = %0, %3
  ret i32 undef, !dbg !314
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** nocapture %PtrParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{%struct.Record** %PtrParOut}, i64 0, metadata !77), !dbg !315
  %1 = load %struct.Record** @PtrGlb, align 8, !dbg !316, !tbaa !181
  %2 = icmp eq %struct.Record* %1, null, !dbg !316
  br i1 %2, label %6, label %3, !dbg !316

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.Record* %1, i64 0, i32 0, !dbg !318
  %5 = load %struct.Record** %4, align 8, !dbg !318, !tbaa !187
  store %struct.Record* %5, %struct.Record** %PtrParOut, align 8, !dbg !318, !tbaa !181
  %.pre = load double* @IntGlob, align 8, !dbg !319, !tbaa !198
  %.pre1 = load %struct.Record** @PtrGlb, align 8, !dbg !319, !tbaa !181
  br label %7, !dbg !318

; <label>:6                                       ; preds = %0
  store double 1.000000e+02, double* @IntGlob, align 8, !dbg !320, !tbaa !198
  br label %7

; <label>:7                                       ; preds = %6, %3
  %8 = phi %struct.Record* [ null, %6 ], [ %.pre1, %3 ]
  %9 = phi double [ 1.000000e+02, %6 ], [ %.pre, %3 ]
  %10 = getelementptr inbounds %struct.Record* %8, i64 0, i32 3, !dbg !319
  %11 = tail call i32 (i32, double, double*, ...)* bitcast (i32 (double, double, double*)* @Proc7 to i32 (i32, double, double*, ...)*)(i32 10, double %9, double* %10) #7, !dbg !319
  ret i32 undef, !dbg !321
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
  store i8 66, i8* @Char2Glob, align 1, !dbg !322, !tbaa !205
  ret i32 undef, !dbg !323
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
  store i8 65, i8* @Char1Glob, align 1, !dbg !324, !tbaa !205
  store i32 0, i32* @BoolGlob, align 4, !dbg !325, !tbaa !295
  ret i32 undef, !dbg !326
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* nocapture %EnumParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !88), !dbg !327
  tail call void @llvm.dbg.value(metadata !{i32* %EnumParOut}, i64 0, metadata !89), !dbg !328
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !329), !dbg !331
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !332), !dbg !333
  %1 = icmp eq i32 %EnumParIn, 10001, !dbg !334
  %.EnumParIn = select i1 %1, i32 10001, i32 10002, !dbg !330
  store i32 %.EnumParIn, i32* %EnumParOut, align 4, !dbg !336, !tbaa !205
  switch i32 %EnumParIn, label %10 [
    i32 0, label %2
    i32 10000, label %3
    i32 10001, label %8
    i32 10003, label %9
  ], !dbg !337

; <label>:2                                       ; preds = %0
  store i32 0, i32* %EnumParOut, align 4, !dbg !338, !tbaa !205
  br label %10, !dbg !338

; <label>:3                                       ; preds = %0
  %4 = load double* @IntGlob, align 8, !dbg !339, !tbaa !198
  %5 = fcmp ogt double %4, 1.000000e+02, !dbg !339
  br i1 %5, label %6, label %7, !dbg !339

; <label>:6                                       ; preds = %3
  store i32 0, i32* %EnumParOut, align 4, !dbg !339, !tbaa !205
  br label %10, !dbg !339

; <label>:7                                       ; preds = %3
  store i32 10002, i32* %EnumParOut, align 4, !dbg !341, !tbaa !205
  br label %10

; <label>:8                                       ; preds = %0
  store i32 10000, i32* %EnumParOut, align 4, !dbg !342, !tbaa !205
  br label %10, !dbg !342

; <label>:9                                       ; preds = %0
  store i32 10001, i32* %EnumParOut, align 4, !dbg !343, !tbaa !205
  br label %10, !dbg !344

; <label>:10                                      ; preds = %6, %7, %9, %0, %8, %2
  ret i32 undef, !dbg !345
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(double %IntParI1, double %IntParI2, double* nocapture %IntParOut) #0 {
  tail call void @llvm.dbg.value(metadata !{double %IntParI1}, i64 0, metadata !94), !dbg !346
  tail call void @llvm.dbg.value(metadata !{double %IntParI2}, i64 0, metadata !95), !dbg !347
  tail call void @llvm.dbg.value(metadata !{double* %IntParOut}, i64 0, metadata !96), !dbg !348
  %1 = fadd double %IntParI1, 2.000000e+00, !dbg !349
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !97), !dbg !349
  %2 = fadd double %1, %IntParI2, !dbg !350
  store double %2, double* %IntParOut, align 8, !dbg !350, !tbaa !198
  ret i32 undef, !dbg !351
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(double* nocapture %Array1Par, [51 x double]* nocapture %Array2Par, double %IntParI1, double %IntParI2) #0 {
  tail call void @llvm.dbg.value(metadata !{double* %Array1Par}, i64 0, metadata !107), !dbg !352
  tail call void @llvm.dbg.value(metadata !{[51 x double]* %Array2Par}, i64 0, metadata !108), !dbg !353
  tail call void @llvm.dbg.value(metadata !{double %IntParI1}, i64 0, metadata !109), !dbg !354
  tail call void @llvm.dbg.value(metadata !{double %IntParI2}, i64 0, metadata !110), !dbg !355
  %1 = fadd double %IntParI1, 5.000000e+00, !dbg !356
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !111), !dbg !356
  %2 = fptosi double %1 to i32, !dbg !357
  %3 = sext i32 %2 to i64, !dbg !357
  %4 = getelementptr inbounds double* %Array1Par, i64 %3, !dbg !357
  store double %IntParI2, double* %4, align 8, !dbg !357, !tbaa !198
  %5 = add nsw i32 %2, 1, !dbg !358
  %6 = sext i32 %5 to i64, !dbg !358
  %7 = getelementptr inbounds double* %Array1Par, i64 %6, !dbg !358
  store double %IntParI2, double* %7, align 8, !dbg !358, !tbaa !198
  %8 = add nsw i32 %2, 30, !dbg !359
  %9 = sext i32 %8 to i64, !dbg !359
  %10 = getelementptr inbounds double* %Array1Par, i64 %9, !dbg !359
  store double %1, double* %10, align 8, !dbg !359, !tbaa !198
  tail call void @llvm.dbg.value(metadata !{double %1}, i64 0, metadata !112), !dbg !360
  %11 = fadd double %1, 1.000000e+00, !dbg !360
  %12 = fcmp ugt double %1, %11, !dbg !360
  br i1 %12, label %._crit_edge, label %.lr.ph, !dbg !360

.lr.ph:                                           ; preds = %0, %.lr.ph
  %IntIndex.01 = phi double [ %16, %.lr.ph ], [ %1, %0 ]
  %13 = fptosi double %IntIndex.01 to i32, !dbg !361
  %14 = sext i32 %13 to i64, !dbg !361
  %15 = getelementptr inbounds [51 x double]* %Array2Par, i64 %3, i64 %14, !dbg !361
  store double %1, double* %15, align 8, !dbg !361, !tbaa !198
  %16 = fadd double %IntIndex.01, 1.000000e+00, !dbg !360
  tail call void @llvm.dbg.value(metadata !{double %16}, i64 0, metadata !112), !dbg !360
  %17 = fcmp ugt double %16, %11, !dbg !360
  br i1 %17, label %._crit_edge, label %.lr.ph, !dbg !360

._crit_edge:                                      ; preds = %.lr.ph, %0
  %18 = add nsw i32 %2, -1, !dbg !362
  %19 = sext i32 %18 to i64, !dbg !362
  %20 = getelementptr inbounds [51 x double]* %Array2Par, i64 %3, i64 %19, !dbg !362
  %21 = load double* %20, align 8, !dbg !362, !tbaa !198
  %22 = fadd double %21, 1.000000e+00, !dbg !362
  store double %22, double* %20, align 8, !dbg !362, !tbaa !198
  %23 = load double* %4, align 8, !dbg !363, !tbaa !198
  %24 = add nsw i32 %2, 20, !dbg !363
  %25 = sext i32 %24 to i64, !dbg !363
  %26 = getelementptr inbounds [51 x double]* %Array2Par, i64 %25, i64 %3, !dbg !363
  store double %23, double* %26, align 8, !dbg !363, !tbaa !198
  store double 5.000000e+00, double* @IntGlob, align 8, !dbg !364, !tbaa !198
  ret i32 undef, !dbg !365
}

; Function Attrs: nounwind readnone uwtable
define i32 @Func1(i32, i32) #4 {
  %sext = shl i32 %0, 24, !dbg !366
  %sext1 = shl i32 %1, 24, !dbg !366
  %3 = icmp eq i32 %sext, %sext1, !dbg !366
  %. = select i1 %3, i32 10000, i32 0, !dbg !368
  ret i32 %., !dbg !369
}

; Function Attrs: nounwind readonly uwtable
define i32 @Func2(i8* nocapture readonly %StrParI1, i8* nocapture readonly %StrParI2) #5 {
.outer..outer.split_crit_edge:
  tail call void @llvm.dbg.value(metadata !{i8* %StrParI1}, i64 0, metadata !126), !dbg !370
  tail call void @llvm.dbg.value(metadata !{i8* %StrParI2}, i64 0, metadata !127), !dbg !371
  tail call void @llvm.dbg.value(metadata !236, i64 0, metadata !128), !dbg !372
  %0 = getelementptr inbounds i8* %StrParI1, i64 1, !dbg !373
  %1 = getelementptr inbounds i8* %StrParI2, i64 2, !dbg !373
  br label %2

; <label>:2                                       ; preds = %2, %.outer..outer.split_crit_edge
  %3 = load i8* %0, align 1, !dbg !373, !tbaa !205
  %4 = load i8* %1, align 1, !dbg !373, !tbaa !205
  %not. = icmp eq i8 %3, %4, !dbg !373
  br i1 %not., label %2, label %.split, !dbg !373

.split:                                           ; preds = %2
  tail call void @llvm.dbg.value(metadata !239, i64 0, metadata !130), !dbg !374
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !128), !dbg !375
  %5 = tail call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #7, !dbg !376
  %6 = icmp sgt i32 %5, 0, !dbg !376
  %. = zext i1 %6 to i32, !dbg !377
  ret i32 %., !dbg !379
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind readnone uwtable
define i32 @Func3(i32 %EnumParIn) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !144), !dbg !380
  tail call void @llvm.dbg.value(metadata !{i32 %EnumParIn}, i64 0, metadata !145), !dbg !381
  %1 = icmp eq i32 %EnumParIn, 10001, !dbg !382
  %. = zext i1 %1 to i32, !dbg !382
  ret i32 %., !dbg !383
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!163, !164}
!llvm.ident = !{!165}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 true, metadata !"", i32 0, metadata !2, metadata !10, metadata !11, metadata !146, metadata !10, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fldry.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"", i32 134, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 134, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !8, metadata !9}
!5 = metadata !{i32 786472, metadata !"Ident1", i64 0} ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = metadata !{i32 786472, metadata !"Ident2", i64 10000} ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = metadata !{i32 786472, metadata !"Ident3", i64 10001} ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = metadata !{i32 786472, metadata !"Ident4", i64 10002} ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = metadata !{i32 786472, metadata !"Ident5", i64 10003} ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = metadata !{}
!11 = metadata !{metadata !12, metadata !23, metadata !48, metadata !64, metadata !72, metadata !78, metadata !82, metadata !83, metadata !90, metadata !98, metadata !113, metadata !122, metadata !140}
!12 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"main", metadata !"main", metadata !"", i32 176, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i8**)* @main, null, null, metadata !20, i32 179} ; [ DW_TAG_subprogram ] [line 176] [def] [scope 179] [main]
!13 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !16, metadata !17}
!16 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{metadata !21, metadata !22}
!21 = metadata !{i32 786689, metadata !12, metadata !"argc", metadata !13, i32 16777393, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 177]
!22 = metadata !{i32 786689, metadata !12, metadata !"argv", metadata !13, i32 33554610, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 178]
!23 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc0", metadata !"Proc0", metadata !"", i32 199, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc0, null, null, metadata !26, i32 200} ; [ DW_TAG_subprogram ] [line 199] [def] [scope 200] [Proc0]
!24 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{metadata !16}
!26 = metadata !{metadata !27, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !36, metadata !41, metadata !42, metadata !44, metadata !46, metadata !47}
!27 = metadata !{i32 786688, metadata !23, metadata !"IntLoc1", metadata !13, i32 201, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 201]
!28 = metadata !{i32 786454, metadata !1, null, metadata !"OneToFifty", i32 138, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [OneToFifty] [line 138, size 0, align 0, offset 0] [from double]
!29 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!30 = metadata !{i32 786688, metadata !23, metadata !"IntLoc2", metadata !13, i32 202, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 202]
!31 = metadata !{i32 786688, metadata !23, metadata !"IntLoc3", metadata !13, i32 203, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 203]
!32 = metadata !{i32 786688, metadata !23, metadata !"CharLoc", metadata !13, i32 204, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 204]
!33 = metadata !{i32 786688, metadata !23, metadata !"CharIndex", metadata !13, i32 205, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharIndex] [line 205]
!34 = metadata !{i32 786688, metadata !23, metadata !"EnumLoc", metadata !13, i32 206, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 206]
!35 = metadata !{i32 786454, metadata !1, null, metadata !"Enumeration", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ] [Enumeration] [line 134, size 0, align 0, offset 0] [from ]
!36 = metadata !{i32 786688, metadata !23, metadata !"String1Loc", metadata !13, i32 207, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String1Loc] [line 207]
!37 = metadata !{i32 786454, metadata !1, null, metadata !"String30", i32 140, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [String30] [line 140, size 0, align 0, offset 0] [from ]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 248, i64 8, i32 0, i32 0, metadata !19, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 31}       ; [ DW_TAG_subrange_type ] [0, 30]
!41 = metadata !{i32 786688, metadata !23, metadata !"String2Loc", metadata !13, i32 208, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [String2Loc] [line 208]
!42 = metadata !{i32 786688, metadata !23, metadata !"i", metadata !13, i32 209, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 209]
!43 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!44 = metadata !{i32 786688, metadata !23, metadata !"starttime", metadata !13, i32 212, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [starttime] [line 212]
!45 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!46 = metadata !{i32 786688, metadata !23, metadata !"benchtime", metadata !13, i32 213, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [benchtime] [line 213]
!47 = metadata !{i32 786688, metadata !23, metadata !"nulltime", metadata !13, i32 214, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nulltime] [line 214]
!48 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc1", metadata !"Proc1", metadata !"", i32 326, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.Record*)* @Proc1, null, null, metadata !62, i32 328} ; [ DW_TAG_subprogram ] [line 326] [def] [scope 328] [Proc1]
!49 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{metadata !16, metadata !51}
!51 = metadata !{i32 786454, metadata !1, null, metadata !"RecordPtr", i32 154, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [RecordPtr] [line 154, size 0, align 0, offset 0] [from ]
!52 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!53 = metadata !{i32 786454, metadata !1, null, metadata !"RecordType", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ] [RecordType] [line 153, size 0, align 0, offset 0] [from Record]
!54 = metadata !{i32 786451, metadata !1, null, metadata !"Record", i32 144, i64 448, i64 64, i32 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 144, size 448, align 64, offset 0] [def] [from ]
!55 = metadata !{metadata !56, metadata !58, metadata !59, metadata !60, metadata !61}
!56 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"PtrComp", i32 146, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ] [PtrComp] [line 146, size 64, align 64, offset 0] [from ]
!57 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!58 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"Discr", i32 147, i64 32, i64 32, i64 64, i32 0, metadata !35} ; [ DW_TAG_member ] [Discr] [line 147, size 32, align 32, offset 64] [from Enumeration]
!59 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"EnumComp", i32 148, i64 32, i64 32, i64 96, i32 0, metadata !35} ; [ DW_TAG_member ] [EnumComp] [line 148, size 32, align 32, offset 96] [from Enumeration]
!60 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"IntComp", i32 149, i64 64, i64 64, i64 128, i32 0, metadata !28} ; [ DW_TAG_member ] [IntComp] [line 149, size 64, align 64, offset 128] [from OneToFifty]
!61 = metadata !{i32 786445, metadata !1, metadata !54, metadata !"StringComp", i32 150, i64 248, i64 8, i64 192, i32 0, metadata !37} ; [ DW_TAG_member ] [StringComp] [line 150, size 248, align 8, offset 192] [from String30]
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786689, metadata !48, metadata !"PtrParIn", metadata !13, i32 16777543, metadata !51, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 327]
!64 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc2", metadata !"Proc2", metadata !"", i32 350, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (double*)* @Proc2, null, null, metadata !68, i32 352} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 352] [Proc2]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !16, metadata !67}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!68 = metadata !{metadata !69, metadata !70, metadata !71}
!69 = metadata !{i32 786689, metadata !64, metadata !"IntParIO", metadata !13, i32 16777567, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParIO] [line 351]
!70 = metadata !{i32 786688, metadata !64, metadata !"IntLoc", metadata !13, i32 353, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 353]
!71 = metadata !{i32 786688, metadata !64, metadata !"EnumLoc", metadata !13, i32 354, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 354]
!72 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc3", metadata !"Proc3", metadata !"", i32 370, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (%struct.Record**)* @Proc3, null, null, metadata !76, i32 372} ; [ DW_TAG_subprogram ] [line 370] [def] [scope 372] [Proc3]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !16, metadata !75}
!75 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786689, metadata !72, metadata !"PtrParOut", metadata !13, i32 16777587, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 371]
!78 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc4", metadata !"Proc4", metadata !"", i32 380, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc4, null, null, metadata !79, i32 381} ; [ DW_TAG_subprogram ] [line 380] [def] [scope 381] [Proc4]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786688, metadata !78, metadata !"BoolLoc", metadata !13, i32 382, metadata !81, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 382]
!81 = metadata !{i32 786454, metadata !1, null, metadata !"boolean", i32 155, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ] [boolean] [line 155, size 0, align 0, offset 0] [from int]
!82 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc5", metadata !"Proc5", metadata !"", i32 389, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @Proc5, null, null, metadata !10, i32 390} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 390] [Proc5]
!83 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc6", metadata !"Proc6", metadata !"", i32 397, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32*)* @Proc6, null, null, metadata !87, i32 400} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 400] [Proc6]
!84 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = metadata !{metadata !16, metadata !35, metadata !86}
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!87 = metadata !{metadata !88, metadata !89}
!88 = metadata !{i32 786689, metadata !83, metadata !"EnumParIn", metadata !13, i32 16777614, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 398]
!89 = metadata !{i32 786689, metadata !83, metadata !"EnumParOut", metadata !13, i32 33554831, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 399]
!90 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc7", metadata !"Proc7", metadata !"", i32 416, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (double, double, double*)* @Proc7, null, null, metadata !93, i32 420} ; [ DW_TAG_subprogram ] [line 416] [def] [scope 420] [Proc7]
!91 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{metadata !16, metadata !28, metadata !28, metadata !67}
!93 = metadata !{metadata !94, metadata !95, metadata !96, metadata !97}
!94 = metadata !{i32 786689, metadata !90, metadata !"IntParI1", metadata !13, i32 16777633, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 417]
!95 = metadata !{i32 786689, metadata !90, metadata !"IntParI2", metadata !13, i32 33554850, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 418]
!96 = metadata !{i32 786689, metadata !90, metadata !"IntParOut", metadata !13, i32 50332067, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParOut] [line 419]
!97 = metadata !{i32 786688, metadata !90, metadata !"IntLoc", metadata !13, i32 421, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 421]
!98 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Proc8", metadata !"Proc8", metadata !"", i32 427, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (double*, [51 x double]*, double, double)* @Proc8, null, null, metadata !106, i32 432} ; [ DW_TAG_subprogram ] [line 427] [def] [scope 432] [Proc8]
!99 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = metadata !{metadata !16, metadata !101, metadata !102, metadata !28, metadata !28}
!101 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!102 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!103 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 3264, i64 64, i32 0, i32 0, metadata !29, metadata !104, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3264, align 64, offset 0] [from double]
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786465, i64 0, i64 51}      ; [ DW_TAG_subrange_type ] [0, 50]
!106 = metadata !{metadata !107, metadata !108, metadata !109, metadata !110, metadata !111, metadata !112}
!107 = metadata !{i32 786689, metadata !98, metadata !"Array1Par", metadata !13, i32 16777644, metadata !101, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array1Par] [line 428]
!108 = metadata !{i32 786689, metadata !98, metadata !"Array2Par", metadata !13, i32 33554861, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [Array2Par] [line 429]
!109 = metadata !{i32 786689, metadata !98, metadata !"IntParI1", metadata !13, i32 50332078, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI1] [line 430]
!110 = metadata !{i32 786689, metadata !98, metadata !"IntParI2", metadata !13, i32 67109295, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [IntParI2] [line 431]
!111 = metadata !{i32 786688, metadata !98, metadata !"IntLoc", metadata !13, i32 433, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 433]
!112 = metadata !{i32 786688, metadata !98, metadata !"IntIndex", metadata !13, i32 434, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntIndex] [line 434]
!113 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func1", metadata !"Func1", metadata !"", i32 447, metadata !114, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32)* @Func1, null, null, metadata !117, i32 450} ; [ DW_TAG_subprogram ] [line 447] [def] [scope 450] [Func1]
!114 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = metadata !{metadata !35, metadata !116, metadata !116}
!116 = metadata !{i32 786454, metadata !1, null, metadata !"CapitalLetter", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [CapitalLetter] [line 139, size 0, align 0, offset 0] [from char]
!117 = metadata !{metadata !118, metadata !119, metadata !120, metadata !121}
!118 = metadata !{i32 786689, metadata !113, metadata !"CharPar1", metadata !13, i32 16777664, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar1] [line 448]
!119 = metadata !{i32 786689, metadata !113, metadata !"CharPar2", metadata !13, i32 33554881, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [CharPar2] [line 449]
!120 = metadata !{i32 786688, metadata !113, metadata !"CharLoc1", metadata !13, i32 451, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 451]
!121 = metadata !{i32 786688, metadata !113, metadata !"CharLoc2", metadata !13, i32 452, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 452]
!122 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func2", metadata !"Func2", metadata !"", i32 462, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i8*, i8*)* @Func2, null, null, metadata !125, i32 465} ; [ DW_TAG_subprogram ] [line 462] [def] [scope 465] [Func2]
!123 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = metadata !{metadata !81, metadata !18, metadata !18}
!125 = metadata !{metadata !126, metadata !127, metadata !128, metadata !130, metadata !131, metadata !139}
!126 = metadata !{i32 786689, metadata !122, metadata !"StrParI1", metadata !13, i32 16777679, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI1] [line 463]
!127 = metadata !{i32 786689, metadata !122, metadata !"StrParI2", metadata !13, i32 33554896, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [StrParI2] [line 464]
!128 = metadata !{i32 786688, metadata !122, metadata !"IntLoc", metadata !13, i32 466, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [IntLoc] [line 466]
!129 = metadata !{i32 786454, metadata !1, null, metadata !"OneToThirty", i32 137, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [OneToThirty] [line 137, size 0, align 0, offset 0] [from double]
!130 = metadata !{i32 786688, metadata !122, metadata !"CharLoc", metadata !13, i32 467, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CharLoc] [line 467]
!131 = metadata !{i32 786688, metadata !132, metadata !"__s1_len", metadata !13, i32 482, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 482]
!132 = metadata !{i32 786443, metadata !1, metadata !133, i32 482, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!133 = metadata !{i32 786443, metadata !1, metadata !134, i32 482, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!134 = metadata !{i32 786443, metadata !1, metadata !135, i32 481, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!135 = metadata !{i32 786443, metadata !1, metadata !122, i32 478, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!136 = metadata !{i32 786454, metadata !137, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!137 = metadata !{metadata !"/usr/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!138 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!139 = metadata !{i32 786688, metadata !132, metadata !"__s2_len", metadata !13, i32 482, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 482]
!140 = metadata !{i32 786478, metadata !1, metadata !13, metadata !"Func3", metadata !"Func3", metadata !"", i32 492, metadata !141, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32)* @Func3, null, null, metadata !143, i32 494} ; [ DW_TAG_subprogram ] [line 492] [def] [scope 494] [Func3]
!141 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !142, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!142 = metadata !{metadata !81, metadata !35}
!143 = metadata !{metadata !144, metadata !145}
!144 = metadata !{i32 786689, metadata !140, metadata !"EnumParIn", metadata !13, i32 16777709, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!145 = metadata !{i32 786688, metadata !140, metadata !"EnumLoc", metadata !13, i32 495, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!146 = metadata !{metadata !147, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !157, metadata !161, metadata !162}
!147 = metadata !{i32 786484, i32 0, null, metadata !"Version", metadata !"Version", metadata !"", metadata !13, i32 117, metadata !148, i32 0, i32 1, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 117] [def]
!148 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 32, i64 8, i32 0, i32 0, metadata !19, metadata !149, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!149 = metadata !{metadata !150}
!150 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!151 = metadata !{i32 786484, i32 0, null, metadata !"IntGlob", metadata !"IntGlob", metadata !"", metadata !13, i32 190, metadata !29, i32 0, i32 1, double* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 190] [def]
!152 = metadata !{i32 786484, i32 0, null, metadata !"BoolGlob", metadata !"BoolGlob", metadata !"", metadata !13, i32 191, metadata !81, i32 0, i32 1, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 191] [def]
!153 = metadata !{i32 786484, i32 0, null, metadata !"Char1Glob", metadata !"Char1Glob", metadata !"", metadata !13, i32 192, metadata !19, i32 0, i32 1, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 192] [def]
!154 = metadata !{i32 786484, i32 0, null, metadata !"Char2Glob", metadata !"Char2Glob", metadata !"", metadata !13, i32 193, metadata !19, i32 0, i32 1, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 193] [def]
!155 = metadata !{i32 786484, i32 0, null, metadata !"Array1Glob", metadata !"Array1Glob", metadata !"", metadata !13, i32 194, metadata !156, i32 0, i32 1, [51 x double]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 194] [def]
!156 = metadata !{i32 786454, metadata !1, null, metadata !"Array1Dim", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !103} ; [ DW_TAG_typedef ] [Array1Dim] [line 141, size 0, align 0, offset 0] [from ]
!157 = metadata !{i32 786484, i32 0, null, metadata !"Array2Glob", metadata !"Array2Glob", metadata !"", metadata !13, i32 195, metadata !158, i32 0, i32 1, [51 x [51 x double]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 195] [def]
!158 = metadata !{i32 786454, metadata !1, null, metadata !"Array2Dim", i32 142, i64 0, i64 0, i64 0, i32 0, metadata !159} ; [ DW_TAG_typedef ] [Array2Dim] [line 142, size 0, align 0, offset 0] [from ]
!159 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 166464, i64 64, i32 0, i32 0, metadata !29, metadata !160, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 166464, align 64, offset 0] [from double]
!160 = metadata !{metadata !105, metadata !105}
!161 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlb", metadata !"PtrGlb", metadata !"", metadata !13, i32 196, metadata !51, i32 0, i32 1, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 196] [def]
!162 = metadata !{i32 786484, i32 0, null, metadata !"PtrGlbNext", metadata !"PtrGlbNext", metadata !"", metadata !13, i32 197, metadata !51, i32 0, i32 1, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 197] [def]
!163 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!164 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!165 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!166 = metadata !{i32 177, i32 0, metadata !12, null}
!167 = metadata !{i32 178, i32 0, metadata !12, null}
!168 = metadata !{i32 180, i32 0, metadata !12, null}
!169 = metadata !{i32 183, i32 0, metadata !12, null}
!170 = metadata !{i32 184, i32 0, metadata !12, null}
!171 = metadata !{null}
!172 = metadata !{i32 207, i32 0, metadata !23, null}
!173 = metadata !{null}
!174 = metadata !{i32 208, i32 0, metadata !23, null}
!175 = metadata !{i32 216, i32 0, metadata !23, null}
!176 = metadata !{i32 0}
!177 = metadata !{i32 217, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !23, i32 217, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!179 = metadata !{i32 218, i32 0, metadata !23, null}
!180 = metadata !{i32 242, i32 0, metadata !23, null}
!181 = metadata !{metadata !182, metadata !182, i64 0}
!182 = metadata !{metadata !"any pointer", metadata !183, i64 0}
!183 = metadata !{metadata !"omnipotent char", metadata !184, i64 0}
!184 = metadata !{metadata !"Simple C/C++ TBAA"}
!185 = metadata !{i32 243, i32 0, metadata !23, null}
!186 = metadata !{i32 244, i32 0, metadata !23, null}
!187 = metadata !{metadata !188, metadata !182, i64 0}
!188 = metadata !{metadata !"Record", metadata !182, i64 0, metadata !183, i64 8, metadata !183, i64 12, metadata !189, i64 16, metadata !183, i64 24}
!189 = metadata !{metadata !"double", metadata !183, i64 0}
!190 = metadata !{i32 245, i32 0, metadata !23, null}
!191 = metadata !{metadata !188, metadata !183, i64 8}
!192 = metadata !{i32 246, i32 0, metadata !23, null}
!193 = metadata !{metadata !188, metadata !183, i64 12}
!194 = metadata !{i32 247, i32 0, metadata !23, null}
!195 = metadata !{metadata !188, metadata !189, i64 16}
!196 = metadata !{i32 248, i32 0, metadata !23, null}
!197 = metadata !{i32 252, i32 0, metadata !23, null}
!198 = metadata !{metadata !189, metadata !189, i64 0}
!199 = metadata !{i32 258, i32 0, metadata !23, null}
!200 = metadata !{i32 266, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !1, metadata !23, i32 266, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!202 = metadata !{i32 391, i32 0, metadata !82, metadata !203}
!203 = metadata !{i32 268, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !1, metadata !201, i32 267, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!205 = metadata !{metadata !183, metadata !183, i64 0}
!206 = metadata !{i32 386, i32 0, metadata !78, metadata !207}
!207 = metadata !{i32 269, i32 0, metadata !204, null}
!208 = metadata !{double 2.000000e+00}
!209 = metadata !{i32 270, i32 0, metadata !204, null}
!210 = metadata !{i32 786689, metadata !64, metadata !"IntParIO", metadata !13, i32 16777567, metadata !67, i32 0, metadata !211} ; [ DW_TAG_arg_variable ] [IntParIO] [line 351]
!211 = metadata !{i32 289, i32 0, metadata !204, null}
!212 = metadata !{i32 351, i32 0, metadata !64, metadata !211}
!213 = metadata !{i32 275, i32 0, metadata !204, null}
!214 = metadata !{i32 278, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !1, metadata !204, i32 276, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!216 = metadata !{i32 279, i32 0, metadata !215, null}
!217 = metadata !{i32 286, i32 0, metadata !204, null}
!218 = metadata !{i32 287, i32 0, metadata !204, null}
!219 = metadata !{double 3.000000e+00}
!220 = metadata !{i32 271, i32 0, metadata !204, null}
!221 = metadata !{i32 10000}
!222 = metadata !{i32 273, i32 0, metadata !204, null}
!223 = metadata !{i32 786689, metadata !83, metadata !"EnumParOut", metadata !13, i32 33554831, metadata !86, i32 0, metadata !224} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 399]
!224 = metadata !{i32 285, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !1, metadata !226, i32 284, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!226 = metadata !{i32 786443, metadata !1, metadata !204, i32 283, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!227 = metadata !{i32 399, i32 0, metadata !83, metadata !224}
!228 = metadata !{i32 284, i32 0, metadata !225, null}
!229 = metadata !{null}
!230 = metadata !{i32 786689, metadata !122, metadata !"StrParI1", metadata !13, i32 16777679, metadata !18, i32 0, metadata !231} ; [ DW_TAG_arg_variable ] [StrParI1] [line 463]
!231 = metadata !{i32 274, i32 0, metadata !204, null}
!232 = metadata !{i32 463, i32 0, metadata !122, metadata !231}
!233 = metadata !{null}
!234 = metadata !{i32 786689, metadata !122, metadata !"StrParI2", metadata !13, i32 33554896, metadata !18, i32 0, metadata !231} ; [ DW_TAG_arg_variable ] [StrParI2] [line 464]
!235 = metadata !{i32 464, i32 0, metadata !122, metadata !231}
!236 = metadata !{double 1.000000e+00}
!237 = metadata !{i32 786688, metadata !122, metadata !"IntLoc", metadata !13, i32 466, metadata !129, i32 0, metadata !231} ; [ DW_TAG_auto_variable ] [IntLoc] [line 466]
!238 = metadata !{i32 469, i32 0, metadata !122, metadata !231}
!239 = metadata !{i8 65}
!240 = metadata !{i32 786688, metadata !122, metadata !"CharLoc", metadata !13, i32 467, metadata !116, i32 0, metadata !231} ; [ DW_TAG_auto_variable ] [CharLoc] [line 467]
!241 = metadata !{i32 473, i32 0, metadata !242, metadata !231}
!242 = metadata !{i32 786443, metadata !1, metadata !243, i32 472, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!243 = metadata !{i32 786443, metadata !1, metadata !122, i32 471, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!244 = metadata !{i32 474, i32 0, metadata !242, metadata !231}
!245 = metadata !{i32 786689, metadata !90, metadata !"IntParI1", metadata !13, i32 16777633, metadata !28, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [IntParI1] [line 417]
!246 = metadata !{i32 417, i32 0, metadata !90, metadata !214}
!247 = metadata !{i32 786689, metadata !90, metadata !"IntParI2", metadata !13, i32 33554850, metadata !28, i32 0, metadata !214} ; [ DW_TAG_arg_variable ] [IntParI2] [line 418]
!248 = metadata !{i32 418, i32 0, metadata !90, metadata !214}
!249 = metadata !{null}
!250 = metadata !{i32 786689, metadata !98, metadata !"Array1Par", metadata !13, i32 16777644, metadata !101, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [Array1Par] [line 428]
!251 = metadata !{i32 281, i32 0, metadata !204, null}
!252 = metadata !{i32 428, i32 0, metadata !98, metadata !251}
!253 = metadata !{null}
!254 = metadata !{i32 786689, metadata !98, metadata !"Array2Par", metadata !13, i32 33554861, metadata !102, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [Array2Par] [line 429]
!255 = metadata !{i32 429, i32 0, metadata !98, metadata !251}
!256 = metadata !{i32 786689, metadata !98, metadata !"IntParI1", metadata !13, i32 50332078, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [IntParI1] [line 430]
!257 = metadata !{i32 430, i32 0, metadata !98, metadata !251}
!258 = metadata !{double 7.000000e+00}
!259 = metadata !{i32 786689, metadata !98, metadata !"IntParI2", metadata !13, i32 67109295, metadata !28, i32 0, metadata !251} ; [ DW_TAG_arg_variable ] [IntParI2] [line 431]
!260 = metadata !{i32 431, i32 0, metadata !98, metadata !251}
!261 = metadata !{double 8.000000e+00}
!262 = metadata !{i32 786688, metadata !98, metadata !"IntLoc", metadata !13, i32 433, metadata !28, i32 0, metadata !251} ; [ DW_TAG_auto_variable ] [IntLoc] [line 433]
!263 = metadata !{i32 436, i32 0, metadata !98, metadata !251}
!264 = metadata !{i32 437, i32 0, metadata !98, metadata !251}
!265 = metadata !{i32 438, i32 0, metadata !98, metadata !251}
!266 = metadata !{i32 439, i32 0, metadata !98, metadata !251}
!267 = metadata !{i32 786688, metadata !98, metadata !"IntIndex", metadata !13, i32 434, metadata !28, i32 0, metadata !251} ; [ DW_TAG_auto_variable ] [IntIndex] [line 434]
!268 = metadata !{i32 440, i32 0, metadata !269, metadata !251}
!269 = metadata !{i32 786443, metadata !1, metadata !98, i32 440, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!270 = metadata !{i32 441, i32 0, metadata !269, metadata !251}
!271 = metadata !{double undef}
!272 = metadata !{i32 442, i32 0, metadata !98, metadata !251}
!273 = metadata !{i32 443, i32 0, metadata !98, metadata !251}
!274 = metadata !{i32 444, i32 0, metadata !98, metadata !251}
!275 = metadata !{i32 282, i32 0, metadata !204, null}
!276 = metadata !{i32 786689, metadata !48, metadata !"PtrParIn", metadata !13, i32 16777543, metadata !51, i32 0, metadata !275} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 327]
!277 = metadata !{i32 327, i32 0, metadata !48, metadata !275}
!278 = metadata !{i32 332, i32 0, metadata !48, metadata !275}
!279 = metadata !{i32 333, i32 0, metadata !48, metadata !275}
!280 = metadata !{i32 334, i32 0, metadata !48, metadata !275}
!281 = metadata !{i32 283, i32 0, metadata !226, null}
!282 = metadata !{i32 786689, metadata !83, metadata !"EnumParIn", metadata !13, i32 16777614, metadata !35, i32 0, metadata !224} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 398]
!283 = metadata !{i32 398, i32 0, metadata !83, metadata !224}
!284 = metadata !{i32 786689, metadata !140, metadata !"EnumParIn", metadata !13, i32 16777709, metadata !35, i32 0, metadata !285} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!285 = metadata !{i32 402, i32 0, metadata !286, metadata !224}
!286 = metadata !{i32 786443, metadata !1, metadata !83, i32 402, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!287 = metadata !{i32 493, i32 0, metadata !140, metadata !285}
!288 = metadata !{i32 786688, metadata !140, metadata !"EnumLoc", metadata !13, i32 495, metadata !35, i32 0, metadata !285} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!289 = metadata !{i32 497, i32 0, metadata !140, metadata !285}
!290 = metadata !{i32 10002}
!291 = metadata !{i32 403, i32 0, metadata !286, metadata !224}
!292 = metadata !{i32 406, i32 0, metadata !293, metadata !224}
!293 = metadata !{i32 786443, metadata !1, metadata !83, i32 405, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!294 = metadata !{i32 392, i32 0, metadata !82, metadata !203}
!295 = metadata !{metadata !296, metadata !296, i64 0}
!296 = metadata !{metadata !"int", metadata !183, i64 0}
!297 = metadata !{i32 324, i32 0, metadata !23, null}
!298 = metadata !{i32 327, i32 0, metadata !48, null}
!299 = metadata !{i32 332, i32 0, metadata !48, null}
!300 = metadata !{i32 333, i32 0, metadata !48, null}
!301 = metadata !{i32 334, i32 0, metadata !48, null}
!302 = metadata !{i32 348, i32 0, metadata !48, null}
!303 = metadata !{i32 351, i32 0, metadata !64, null}
!304 = metadata !{i32 356, i32 0, metadata !64, null}
!305 = metadata !{i32 359, i32 0, metadata !306, null}
!306 = metadata !{i32 786443, metadata !1, metadata !307, i32 359, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!307 = metadata !{i32 786443, metadata !1, metadata !308, i32 358, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!308 = metadata !{i32 786443, metadata !1, metadata !64, i32 357, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!309 = metadata !{i32 361, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !306, i32 360, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!311 = metadata !{i32 362, i32 0, metadata !310, null}
!312 = metadata !{i32 363, i32 0, metadata !310, null}
!313 = metadata !{i32 364, i32 0, metadata !310, null}
!314 = metadata !{i32 368, i32 0, metadata !64, null}
!315 = metadata !{i32 371, i32 0, metadata !72, null}
!316 = metadata !{i32 373, i32 0, metadata !317, null}
!317 = metadata !{i32 786443, metadata !1, metadata !72, i32 373, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!318 = metadata !{i32 374, i32 0, metadata !317, null}
!319 = metadata !{i32 377, i32 0, metadata !72, null}
!320 = metadata !{i32 376, i32 0, metadata !317, null}
!321 = metadata !{i32 378, i32 0, metadata !72, null}
!322 = metadata !{i32 386, i32 0, metadata !78, null}
!323 = metadata !{i32 387, i32 0, metadata !78, null}
!324 = metadata !{i32 391, i32 0, metadata !82, null}
!325 = metadata !{i32 392, i32 0, metadata !82, null}
!326 = metadata !{i32 393, i32 0, metadata !82, null}
!327 = metadata !{i32 398, i32 0, metadata !83, null}
!328 = metadata !{i32 399, i32 0, metadata !83, null}
!329 = metadata !{i32 786689, metadata !140, metadata !"EnumParIn", metadata !13, i32 16777709, metadata !35, i32 0, metadata !330} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!330 = metadata !{i32 402, i32 0, metadata !286, null}
!331 = metadata !{i32 493, i32 0, metadata !140, metadata !330}
!332 = metadata !{i32 786688, metadata !140, metadata !"EnumLoc", metadata !13, i32 495, metadata !35, i32 0, metadata !330} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!333 = metadata !{i32 497, i32 0, metadata !140, metadata !330}
!334 = metadata !{i32 498, i32 0, metadata !335, metadata !330}
!335 = metadata !{i32 786443, metadata !1, metadata !140, i32 498, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!336 = metadata !{i32 403, i32 0, metadata !286, null}
!337 = metadata !{i32 404, i32 0, metadata !83, null}
!338 = metadata !{i32 406, i32 0, metadata !293, null}
!339 = metadata !{i32 407, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !293, i32 407, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!341 = metadata !{i32 408, i32 0, metadata !340, null}
!342 = metadata !{i32 410, i32 0, metadata !293, null}
!343 = metadata !{i32 412, i32 0, metadata !293, null}
!344 = metadata !{i32 413, i32 0, metadata !293, null}
!345 = metadata !{i32 414, i32 0, metadata !83, null}
!346 = metadata !{i32 417, i32 0, metadata !90, null}
!347 = metadata !{i32 418, i32 0, metadata !90, null}
!348 = metadata !{i32 419, i32 0, metadata !90, null}
!349 = metadata !{i32 423, i32 0, metadata !90, null}
!350 = metadata !{i32 424, i32 0, metadata !90, null}
!351 = metadata !{i32 425, i32 0, metadata !90, null}
!352 = metadata !{i32 428, i32 0, metadata !98, null}
!353 = metadata !{i32 429, i32 0, metadata !98, null}
!354 = metadata !{i32 430, i32 0, metadata !98, null}
!355 = metadata !{i32 431, i32 0, metadata !98, null}
!356 = metadata !{i32 436, i32 0, metadata !98, null}
!357 = metadata !{i32 437, i32 0, metadata !98, null}
!358 = metadata !{i32 438, i32 0, metadata !98, null}
!359 = metadata !{i32 439, i32 0, metadata !98, null}
!360 = metadata !{i32 440, i32 0, metadata !269, null}
!361 = metadata !{i32 441, i32 0, metadata !269, null}
!362 = metadata !{i32 442, i32 0, metadata !98, null}
!363 = metadata !{i32 443, i32 0, metadata !98, null}
!364 = metadata !{i32 444, i32 0, metadata !98, null}
!365 = metadata !{i32 445, i32 0, metadata !98, null}
!366 = metadata !{i32 456, i32 0, metadata !367, null}
!367 = metadata !{i32 786443, metadata !1, metadata !113, i32 456, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!368 = metadata !{i32 459, i32 0, metadata !367, null}
!369 = metadata !{i32 460, i32 0, metadata !113, null}
!370 = metadata !{i32 463, i32 0, metadata !122, null}
!371 = metadata !{i32 464, i32 0, metadata !122, null}
!372 = metadata !{i32 469, i32 0, metadata !122, null}
!373 = metadata !{i32 471, i32 0, metadata !243, null}
!374 = metadata !{i32 473, i32 0, metadata !242, null}
!375 = metadata !{i32 474, i32 0, metadata !242, null}
!376 = metadata !{i32 482, i32 0, metadata !132, null}
!377 = metadata !{i32 485, i32 0, metadata !378, null}
!378 = metadata !{i32 786443, metadata !1, metadata !133, i32 483, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/fldry.c]
!379 = metadata !{i32 490, i32 0, metadata !122, null}
!380 = metadata !{i32 493, i32 0, metadata !140, null}
!381 = metadata !{i32 497, i32 0, metadata !140, null}
!382 = metadata !{i32 498, i32 0, metadata !335, null}
!383 = metadata !{i32 500, i32 0, metadata !140, null}
