; ModuleID = 'fldry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !40, metadata !168), !dbg !169
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !41, metadata !168), !dbg !170
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str, i64 0, i64 0), i64 8) #7, !dbg !171
  %call1 = tail call i32 @Proc0(), !dbg !172
  ret i32 0, !dbg !173
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
entry:
  tail call void @llvm.dbg.declare(metadata !84, metadata !52, metadata !168), !dbg !174
  tail call void @llvm.dbg.declare(metadata !84, metadata !53, metadata !168), !dbg !175
  %call = tail call i32 (...)* @clock() #7, !dbg !176
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !168), !dbg !177
  %call2 = tail call i32 (...)* @clock() #7, !dbg !178
  %call4 = tail call noalias i8* @malloc(i64 56) #7, !dbg !179
  store i8* %call4, i8** bitcast (%struct.Record** @PtrGlbNext to i8**), align 8, !dbg !180, !tbaa !181
  %call5 = tail call noalias i8* @malloc(i64 56) #7, !dbg !185
  store i8* %call5, i8** bitcast (%struct.Record** @PtrGlb to i8**), align 8, !dbg !186, !tbaa !181
  %0 = bitcast i8* %call5 to i8**, !dbg !187
  store i8* %call4, i8** %0, align 8, !dbg !187, !tbaa !188
  %Discr = getelementptr inbounds i8* %call5, i64 8, !dbg !191
  %1 = bitcast i8* %Discr to i32*, !dbg !191
  store i32 0, i32* %1, align 4, !dbg !191, !tbaa !192
  %EnumComp = getelementptr inbounds i8* %call5, i64 12, !dbg !193
  %2 = bitcast i8* %EnumComp to i32*, !dbg !193
  store i32 10001, i32* %2, align 4, !dbg !193, !tbaa !194
  %IntComp = getelementptr inbounds i8* %call5, i64 16, !dbg !195
  %3 = bitcast i8* %IntComp to double*, !dbg !195
  store double 4.000000e+01, double* %3, align 8, !dbg !195, !tbaa !196
  %4 = getelementptr inbounds i8* %call5, i64 24, !dbg !197
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([31 x i8]* @.str1, i64 0, i64 0), i64 31, i32 1, i1 false), !dbg !198
  store double 1.000000e+01, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !199, !tbaa !200
  %call9 = tail call i32 (...)* @clock() #7, !dbg !201
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !54, metadata !168), !dbg !177
  br label %Proc8.exit, !dbg !202

Proc8.exit:                                       ; preds = %for.end42, %entry
  %i.177 = phi i32 [ 0, %entry ], [ %inc49, %for.end42 ]
  store i8 65, i8* @Char1Glob, align 1, !dbg !204, !tbaa !208
  store i8 66, i8* @Char2Glob, align 1, !dbg !209, !tbaa !208
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !212, metadata !168), !dbg !214
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !47, metadata !168), !dbg !215
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !217, metadata !168), !dbg !222
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata !84, i64 0, metadata !223, metadata !168) #7, !dbg !225
  tail call void @llvm.dbg.value(metadata !84, i64 0, metadata !226, metadata !168) #7, !dbg !227
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !228, metadata !168) #7, !dbg !229
  tail call void @llvm.dbg.value(metadata i8 65, i64 0, metadata !230, metadata !168) #7, !dbg !231
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !228, metadata !168) #7, !dbg !229
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !232, metadata !168), !dbg !235
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !236, metadata !168), !dbg !237
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !212, metadata !168), !dbg !214
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !46, metadata !168), !dbg !211
  tail call void @llvm.dbg.value(metadata !84, i64 0, metadata !238, metadata !168), !dbg !240
  tail call void @llvm.dbg.value(metadata !84, i64 0, metadata !241, metadata !168), !dbg !242
  tail call void @llvm.dbg.value(metadata double 3.000000e+00, i64 0, metadata !243, metadata !168), !dbg !244
  tail call void @llvm.dbg.value(metadata double 8.000000e+00, i64 0, metadata !245, metadata !168), !dbg !246
  store <2 x double> <double 7.000000e+00, double 7.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([51 x double]* @Array1Glob, i64 0, i64 8) to <2 x double>*), align 16, !dbg !247, !tbaa !200
  store double 8.000000e+00, double* getelementptr inbounds ([51 x double]* @Array1Glob, i64 0, i64 38), align 16, !dbg !248, !tbaa !200
  tail call void @llvm.dbg.value(metadata double 8.000000e+00, i64 0, metadata !249, metadata !168), !dbg !250
  tail call void @llvm.dbg.value(metadata double 9.000000e+00, i64 0, metadata !249, metadata !168), !dbg !250
  store <2 x double> <double 8.000000e+00, double 8.000000e+00>, <2 x double>* bitcast (double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 8) to <2 x double>*), align 16, !dbg !251, !tbaa !200
  tail call void @llvm.dbg.value(metadata double 9.000000e+00, i64 0, metadata !249, metadata !168), !dbg !250
  %5 = load double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !254, !tbaa !200
  %inc26.i = fadd double %5, 1.000000e+00, !dbg !254
  store double %inc26.i, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 8, i64 7), align 8, !dbg !254, !tbaa !200
  store double 7.000000e+00, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i64 0, i64 28, i64 8), align 16, !dbg !255, !tbaa !200
  store double 5.000000e+00, double* @IntGlob, align 8, !dbg !256, !tbaa !200
  %6 = load %struct.Record** @PtrGlb, align 8, !dbg !257, !tbaa !181
  tail call void @llvm.dbg.value(metadata %struct.Record* %6, i64 0, metadata !258, metadata !168), !dbg !260
  %IntComp.i = getelementptr inbounds %struct.Record* %6, i64 0, i32 3, !dbg !261
  store double 5.000000e+00, double* %IntComp.i, align 8, !dbg !261, !tbaa !196
  %PtrComp.i = getelementptr inbounds %struct.Record* %6, i64 0, i32 0, !dbg !262
  %7 = load %struct.Record** %PtrComp.i, align 8, !dbg !262, !tbaa !188
  %IntComp2.i = getelementptr inbounds %struct.Record* %7, i64 0, i32 3, !dbg !262
  store double 5.000000e+00, double* %IntComp2.i, align 8, !dbg !262, !tbaa !196
  %PtrComp5.i = getelementptr inbounds %struct.Record* %7, i64 0, i32 0, !dbg !263
  store %struct.Record* %7, %struct.Record** %PtrComp5.i, align 8, !dbg !263, !tbaa !188
  tail call void @llvm.dbg.value(metadata i8 65, i64 0, metadata !50, metadata !168), !dbg !264
  %8 = load i8* @Char2Glob, align 1, !dbg !265, !tbaa !208
  %cmp3275 = icmp slt i8 %8, 65, !dbg !266
  br i1 %cmp3275, label %for.end42, label %for.body34.preheader, !dbg !267

for.body34.preheader:                             ; preds = %Proc8.exit
  br label %for.body34, !dbg !268

for.body34:                                       ; preds = %for.body34.preheader, %for.body34
  %CharIndex.076 = phi i8 [ %inc41, %for.body34 ], [ 65, %for.body34.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !269, metadata !168), !dbg !268
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !270, metadata !168), !dbg !273
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !274, metadata !168), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 10002, i64 0, metadata !217, metadata !168), !dbg !222
  tail call void @llvm.dbg.value(metadata i32 10002, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 10002, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !217, metadata !168), !dbg !222
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !51, metadata !168), !dbg !216
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !51, metadata !168), !dbg !216
  %inc41 = add i8 %CharIndex.076, 1, !dbg !276
  tail call void @llvm.dbg.value(metadata i8 %inc41, i64 0, metadata !50, metadata !168), !dbg !264
  %cmp32 = icmp sgt i8 %inc41, %8, !dbg !266
  br i1 %cmp32, label %for.end42.loopexit, label %for.body34, !dbg !267

for.end42.loopexit:                               ; preds = %for.body34
  br label %for.end42

for.end42:                                        ; preds = %for.end42.loopexit, %Proc8.exit
  %inc49 = add nuw nsw i32 %i.177, 1, !dbg !277
  tail call void @llvm.dbg.value(metadata i32 %inc49, i64 0, metadata !54, metadata !168), !dbg !177
  %exitcond = icmp eq i32 %inc49, 100000000, !dbg !202
  br i1 %exitcond, label %for.end50, label %Proc8.exit, !dbg !202

for.end50:                                        ; preds = %for.end42
  store i32 1, i32* @BoolGlob, align 4, !dbg !278, !tbaa !279
  ret i32 undef, !dbg !281
}

declare i32 @clock(...) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* nocapture %PtrParIn) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Record* %PtrParIn, i64 0, metadata !64, metadata !168), !dbg !282
  %IntComp = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 3, !dbg !283
  store double 5.000000e+00, double* %IntComp, align 8, !dbg !283, !tbaa !196
  %PtrComp = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 0, !dbg !284
  %0 = load %struct.Record** %PtrComp, align 8, !dbg !284, !tbaa !188
  %IntComp2 = getelementptr inbounds %struct.Record* %0, i64 0, i32 3, !dbg !284
  store double 5.000000e+00, double* %IntComp2, align 8, !dbg !284, !tbaa !196
  %PtrComp5 = getelementptr inbounds %struct.Record* %0, i64 0, i32 0, !dbg !285
  store %struct.Record* %0, %struct.Record** %PtrComp5, align 8, !dbg !285, !tbaa !188
  ret i32 undef, !dbg !286
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(double* nocapture %IntParIO) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %IntParIO, i64 0, metadata !70, metadata !168), !dbg !287
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !71, metadata !168), !dbg !288
  %0 = load i8* @Char1Glob, align 1, !dbg !289, !tbaa !208
  %cmp = icmp eq i8 %0, 65, !dbg !289
  br i1 %cmp, label %if.then, label %for.end, !dbg !294

if.then:                                          ; preds = %entry
  %1 = load double* %IntParIO, align 8, !dbg !295, !tbaa !200
  %add = fadd double %1, 1.000000e+01, !dbg !295
  %dec = fadd double %add, -1.000000e+00, !dbg !296
  tail call void @llvm.dbg.value(metadata double %dec, i64 0, metadata !71, metadata !168), !dbg !288
  %2 = load double* @IntGlob, align 8, !dbg !298, !tbaa !200
  %sub = fsub double %dec, %2, !dbg !299
  store double %sub, double* %IntParIO, align 8, !dbg !300, !tbaa !200
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !168), !dbg !301
  br label %for.end, !dbg !302

for.end:                                          ; preds = %entry, %if.then
  ret i32 undef, !dbg !303
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** nocapture %PtrParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Record** %PtrParOut, i64 0, metadata !78, metadata !168), !dbg !304
  %0 = load %struct.Record** @PtrGlb, align 8, !dbg !305, !tbaa !181
  %cmp = icmp eq %struct.Record* %0, null, !dbg !305
  br i1 %cmp, label %if.else, label %if.then, !dbg !307

if.then:                                          ; preds = %entry
  %PtrComp = getelementptr inbounds %struct.Record* %0, i64 0, i32 0, !dbg !308
  %1 = load %struct.Record** %PtrComp, align 8, !dbg !308, !tbaa !188
  store %struct.Record* %1, %struct.Record** %PtrParOut, align 8, !dbg !309, !tbaa !181
  %.pre = load double* @IntGlob, align 8, !dbg !310, !tbaa !200
  %.pre1 = load %struct.Record** @PtrGlb, align 8, !dbg !311, !tbaa !181
  br label %if.end, !dbg !309

if.else:                                          ; preds = %entry
  store double 1.000000e+02, double* @IntGlob, align 8, !dbg !312, !tbaa !200
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = phi %struct.Record* [ null, %if.else ], [ %.pre1, %if.then ]
  %3 = phi double [ 1.000000e+02, %if.else ], [ %.pre, %if.then ]
  %IntComp = getelementptr inbounds %struct.Record* %2, i64 0, i32 3, !dbg !313
  %call = tail call i32 (i32, double, double*, ...)* bitcast (i32 (double, double, double*)* @Proc7 to i32 (i32, double, double*, ...)*)(i32 10, double %3, double* %IntComp) #7, !dbg !314
  ret i32 undef, !dbg !315
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
entry:
  store i8 66, i8* @Char2Glob, align 1, !dbg !316, !tbaa !208
  ret i32 undef, !dbg !317
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
entry:
  store i8 65, i8* @Char1Glob, align 1, !dbg !318, !tbaa !208
  store i32 0, i32* @BoolGlob, align 4, !dbg !319, !tbaa !279
  ret i32 undef, !dbg !320
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* nocapture %EnumParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !90, metadata !168), !dbg !321
  tail call void @llvm.dbg.value(metadata i32* %EnumParOut, i64 0, metadata !91, metadata !168), !dbg !322
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !323, metadata !168), !dbg !325
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !326, metadata !168), !dbg !327
  %cmp.i = icmp eq i32 %EnumParIn, 10001, !dbg !328
  %.EnumParIn = select i1 %cmp.i, i32 10001, i32 10002, !dbg !330
  store i32 %.EnumParIn, i32* %EnumParOut, align 4, !dbg !331, !tbaa !208
  switch i32 %EnumParIn, label %sw.epilog [
    i32 0, label %sw.bb
    i32 10000, label %sw.bb1
    i32 10001, label %sw.bb4
    i32 10003, label %sw.bb5
  ], !dbg !332

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %EnumParOut, align 4, !dbg !333, !tbaa !208
  br label %sw.epilog, !dbg !335

sw.bb1:                                           ; preds = %entry
  %0 = load double* @IntGlob, align 8, !dbg !336, !tbaa !200
  %cmp = fcmp ogt double %0, 1.000000e+02, !dbg !336
  br i1 %cmp, label %if.then2, label %if.else, !dbg !338

if.then2:                                         ; preds = %sw.bb1
  store i32 0, i32* %EnumParOut, align 4, !dbg !339, !tbaa !208
  br label %sw.epilog, !dbg !339

if.else:                                          ; preds = %sw.bb1
  store i32 10002, i32* %EnumParOut, align 4, !dbg !340, !tbaa !208
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store i32 10000, i32* %EnumParOut, align 4, !dbg !341, !tbaa !208
  br label %sw.epilog, !dbg !342

sw.bb5:                                           ; preds = %entry
  store i32 10001, i32* %EnumParOut, align 4, !dbg !343, !tbaa !208
  br label %sw.epilog, !dbg !344

sw.epilog:                                        ; preds = %if.then2, %if.else, %sw.bb5, %entry, %sw.bb4, %sw.bb
  ret i32 undef, !dbg !345
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(double %IntParI1, double %IntParI2, double* nocapture %IntParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %IntParI1, i64 0, metadata !96, metadata !168), !dbg !346
  tail call void @llvm.dbg.value(metadata double %IntParI2, i64 0, metadata !97, metadata !168), !dbg !347
  tail call void @llvm.dbg.value(metadata double* %IntParOut, i64 0, metadata !98, metadata !168), !dbg !348
  %add = fadd double %IntParI1, 2.000000e+00, !dbg !349
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !99, metadata !168), !dbg !350
  %add1 = fadd double %add, %IntParI2, !dbg !351
  store double %add1, double* %IntParOut, align 8, !dbg !352, !tbaa !200
  ret i32 undef, !dbg !353
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(double* nocapture %Array1Par, [51 x double]* nocapture %Array2Par, double %IntParI1, double %IntParI2) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double* %Array1Par, i64 0, metadata !109, metadata !168), !dbg !354
  tail call void @llvm.dbg.value(metadata [51 x double]* %Array2Par, i64 0, metadata !110, metadata !168), !dbg !355
  tail call void @llvm.dbg.value(metadata double %IntParI1, i64 0, metadata !111, metadata !168), !dbg !356
  tail call void @llvm.dbg.value(metadata double %IntParI2, i64 0, metadata !112, metadata !168), !dbg !357
  %add = fadd double %IntParI1, 5.000000e+00, !dbg !358
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !113, metadata !168), !dbg !359
  %conv = fptosi double %add to i32, !dbg !360
  %idxprom = sext i32 %conv to i64, !dbg !361
  %arrayidx = getelementptr inbounds double* %Array1Par, i64 %idxprom, !dbg !361
  store double %IntParI2, double* %arrayidx, align 8, !dbg !361, !tbaa !200
  %add5 = add nsw i32 %conv, 1, !dbg !362
  %idxprom6 = sext i32 %add5 to i64, !dbg !363
  %arrayidx7 = getelementptr inbounds double* %Array1Par, i64 %idxprom6, !dbg !363
  store double %IntParI2, double* %arrayidx7, align 8, !dbg !363, !tbaa !200
  %add9 = add nsw i32 %conv, 30, !dbg !364
  %idxprom10 = sext i32 %add9 to i64, !dbg !365
  %arrayidx11 = getelementptr inbounds double* %Array1Par, i64 %idxprom10, !dbg !365
  store double %add, double* %arrayidx11, align 8, !dbg !365, !tbaa !200
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !114, metadata !168), !dbg !366
  %add12 = fadd double %add, 1.000000e+00, !dbg !367
  %cmp57 = fcmp ugt double %add, %add12, !dbg !368
  br i1 %cmp57, label %for.end, label %for.body.preheader, !dbg !369

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !370

for.body:                                         ; preds = %for.body.preheader, %for.body
  %IntIndex.058 = phi double [ %inc, %for.body ], [ %add, %for.body.preheader ]
  %conv14 = fptosi double %IntIndex.058 to i32, !dbg !370
  %idxprom15 = sext i32 %conv14 to i64, !dbg !371
  %arrayidx19 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom, i64 %idxprom15, !dbg !371
  store double %add, double* %arrayidx19, align 8, !dbg !371, !tbaa !200
  %inc = fadd double %IntIndex.058, 1.000000e+00, !dbg !372
  tail call void @llvm.dbg.value(metadata double %inc, i64 0, metadata !114, metadata !168), !dbg !366
  %cmp = fcmp ugt double %inc, %add12, !dbg !368
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !369

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %sub = add nsw i32 %conv, -1, !dbg !373
  %idxprom21 = sext i32 %sub to i64, !dbg !374
  %arrayidx25 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom, i64 %idxprom21, !dbg !374
  %0 = load double* %arrayidx25, align 8, !dbg !374, !tbaa !200
  %inc26 = fadd double %0, 1.000000e+00, !dbg !374
  store double %inc26, double* %arrayidx25, align 8, !dbg !374, !tbaa !200
  %1 = load double* %arrayidx, align 8, !dbg !375, !tbaa !200
  %add33 = add nsw i32 %conv, 20, !dbg !376
  %idxprom34 = sext i32 %add33 to i64, !dbg !377
  %arrayidx36 = getelementptr inbounds [51 x double]* %Array2Par, i64 %idxprom34, i64 %idxprom, !dbg !377
  store double %1, double* %arrayidx36, align 8, !dbg !377, !tbaa !200
  store double 5.000000e+00, double* @IntGlob, align 8, !dbg !378, !tbaa !200
  ret i32 undef, !dbg !379
}

; Function Attrs: nounwind readnone uwtable
define i32 @Func1(i32, i32) #4 {
entry:
  %sext = shl i32 %0, 24, !dbg !380
  %sext4 = shl i32 %1, 24, !dbg !382
  %cmp = icmp eq i32 %sext, %sext4, !dbg !380
  %. = select i1 %cmp, i32 10000, i32 0, !dbg !383
  ret i32 %., !dbg !384
}

; Function Attrs: nounwind readonly uwtable
define i32 @Func2(i8* nocapture readonly %StrParI1, i8* nocapture readonly %StrParI2) #5 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %StrParI1, i64 0, metadata !128, metadata !168), !dbg !385
  tail call void @llvm.dbg.value(metadata i8* %StrParI2, i64 0, metadata !129, metadata !168), !dbg !386
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !130, metadata !168), !dbg !387
  %arrayidx36 = getelementptr inbounds i8* %StrParI1, i64 1, !dbg !388
  %arrayidx437 = getelementptr inbounds i8* %StrParI2, i64 2, !dbg !390
  br label %while.body

while.body:                                       ; preds = %while.body, %entry
  %0 = load i8* %arrayidx36, align 1, !dbg !388, !tbaa !208
  %1 = load i8* %arrayidx437, align 1, !dbg !390, !tbaa !208
  %not.cmp.i = icmp eq i8 %0, %1, !dbg !391
  br i1 %not.cmp.i, label %while.body, label %if.else.split, !dbg !392

if.else.split:                                    ; preds = %while.body
  tail call void @llvm.dbg.value(metadata i8 65, i64 0, metadata !132, metadata !168), !dbg !393
  tail call void @llvm.dbg.value(metadata double 2.000000e+00, i64 0, metadata !130, metadata !168), !dbg !387
  %call20 = tail call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #7, !dbg !394
  %cmp21 = icmp sgt i32 %call20, 0, !dbg !395
  %. = zext i1 %cmp21 to i32, !dbg !396
  ret i32 %., !dbg !398
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind readnone uwtable
define i32 @Func3(i32 %EnumParIn) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !146, metadata !168), !dbg !399
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !147, metadata !168), !dbg !400
  %cmp = icmp eq i32 %EnumParIn, 10001, !dbg !401
  %. = zext i1 %cmp to i32, !dbg !402
  ret i32 %., !dbg !404
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!llvm.module.flags = !{!165, !166}
!llvm.ident = !{!167}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !10, !32, !148, !84} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c] [DW_LANG_C99]
!1 = !{!"fldry.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\00134\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 134, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6, !7, !8, !9}
!5 = !{!"0x28\00Ident1\000"}                      ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = !{!"0x28\00Ident2\0010000"}                  ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = !{!"0x28\00Ident3\0010001"}                  ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = !{!"0x28\00Ident4\0010002"}                  ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = !{!"0x28\00Ident5\0010003"}                  ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = !{!11, !30, !31}
!11 = !{!"0x16\00RecordPtr\00154\000\000\000\000", !1, null, !12} ; [ DW_TAG_typedef ] [RecordPtr] [line 154, size 0, align 0, offset 0] [from ]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!13 = !{!"0x16\00RecordType\00153\000\000\000\000", !1, null, !14} ; [ DW_TAG_typedef ] [RecordType] [line 153, size 0, align 0, offset 0] [from Record]
!14 = !{!"0x13\00Record\00144\00448\0064\000\000\000", !1, null, null, !15, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 144, size 448, align 64, offset 0] [def] [from ]
!15 = !{!16, !18, !20, !21, !24}
!16 = !{!"0xd\00PtrComp\00146\0064\0064\000\000", !1, !14, !17} ; [ DW_TAG_member ] [PtrComp] [line 146, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!18 = !{!"0xd\00Discr\00147\0032\0032\0064\000", !1, !14, !19} ; [ DW_TAG_member ] [Discr] [line 147, size 32, align 32, offset 64] [from Enumeration]
!19 = !{!"0x16\00Enumeration\00134\000\000\000\000", !1, null, !3} ; [ DW_TAG_typedef ] [Enumeration] [line 134, size 0, align 0, offset 0] [from ]
!20 = !{!"0xd\00EnumComp\00148\0032\0032\0096\000", !1, !14, !19} ; [ DW_TAG_member ] [EnumComp] [line 148, size 32, align 32, offset 96] [from Enumeration]
!21 = !{!"0xd\00IntComp\00149\0064\0064\00128\000", !1, !14, !22} ; [ DW_TAG_member ] [IntComp] [line 149, size 64, align 64, offset 128] [from OneToFifty]
!22 = !{!"0x16\00OneToFifty\00138\000\000\000\000", !1, null, !23} ; [ DW_TAG_typedef ] [OneToFifty] [line 138, size 0, align 0, offset 0] [from double]
!23 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!24 = !{!"0xd\00StringComp\00150\00248\008\00192\000", !1, !14, !25} ; [ DW_TAG_member ] [StringComp] [line 150, size 248, align 8, offset 192] [from String30]
!25 = !{!"0x16\00String30\00140\000\000\000\000", !1, null, !26} ; [ DW_TAG_typedef ] [String30] [line 140, size 0, align 0, offset 0] [from ]
!26 = !{!"0x1\00\000\00248\008\000\000\000", null, null, !27, !28, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!27 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = !{!29}
!29 = !{!"0x21\000\0031"}                         ; [ DW_TAG_subrange_type ] [0, 30]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!32 = !{!33, !42, !60, !65, !73, !79, !83, !85, !92, !100, !115, !124, !142}
!33 = !{!"0x2e\00main\00main\00\00176\000\001\000\000\000\001\00179", !1, !34, !35, null, i32 (i32, i8**)* @main, null, null, !39} ; [ DW_TAG_subprogram ] [line 176] [def] [scope 179] [main]
!34 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!35 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !36, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!36 = !{!31, !31, !37}
!37 = !{!"0xf\00\000\0064\0064\000\000", null, null, !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!38 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!39 = !{!40, !41}
!40 = !{!"0x101\00argc\0016777393\000", !33, !34, !31} ; [ DW_TAG_arg_variable ] [argc] [line 177]
!41 = !{!"0x101\00argv\0033554610\000", !33, !34, !37} ; [ DW_TAG_arg_variable ] [argv] [line 178]
!42 = !{!"0x2e\00Proc0\00Proc0\00\00199\000\001\000\000\000\001\00200", !1, !34, !43, null, i32 ()* @Proc0, null, null, !45} ; [ DW_TAG_subprogram ] [line 199] [def] [scope 200] [Proc0]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{!31}
!45 = !{!46, !47, !48, !49, !50, !51, !52, !53, !54, !56, !58, !59}
!46 = !{!"0x100\00IntLoc1\00201\000", !42, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 201]
!47 = !{!"0x100\00IntLoc2\00202\000", !42, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 202]
!48 = !{!"0x100\00IntLoc3\00203\000", !42, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 203]
!49 = !{!"0x100\00CharLoc\00204\000", !42, !34, !27} ; [ DW_TAG_auto_variable ] [CharLoc] [line 204]
!50 = !{!"0x100\00CharIndex\00205\000", !42, !34, !27} ; [ DW_TAG_auto_variable ] [CharIndex] [line 205]
!51 = !{!"0x100\00EnumLoc\00206\000", !42, !34, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 206]
!52 = !{!"0x100\00String1Loc\00207\000", !42, !34, !25} ; [ DW_TAG_auto_variable ] [String1Loc] [line 207]
!53 = !{!"0x100\00String2Loc\00208\000", !42, !34, !25} ; [ DW_TAG_auto_variable ] [String2Loc] [line 208]
!54 = !{!"0x100\00i\00209\000", !42, !34, !55}    ; [ DW_TAG_auto_variable ] [i] [line 209]
!55 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!56 = !{!"0x100\00starttime\00212\000", !42, !34, !57} ; [ DW_TAG_auto_variable ] [starttime] [line 212]
!57 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!58 = !{!"0x100\00benchtime\00213\000", !42, !34, !57} ; [ DW_TAG_auto_variable ] [benchtime] [line 213]
!59 = !{!"0x100\00nulltime\00214\000", !42, !34, !57} ; [ DW_TAG_auto_variable ] [nulltime] [line 214]
!60 = !{!"0x2e\00Proc1\00Proc1\00\00326\000\001\000\000\000\001\00328", !1, !34, !61, null, i32 (%struct.Record*)* @Proc1, null, null, !63} ; [ DW_TAG_subprogram ] [line 326] [def] [scope 328] [Proc1]
!61 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !62, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = !{!31, !11}
!63 = !{!64}
!64 = !{!"0x101\00PtrParIn\0016777543\000", !60, !34, !11} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 327]
!65 = !{!"0x2e\00Proc2\00Proc2\00\00350\000\001\000\000\000\001\00352", !1, !34, !66, null, i32 (double*)* @Proc2, null, null, !69} ; [ DW_TAG_subprogram ] [line 350] [def] [scope 352] [Proc2]
!66 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !67, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = !{!31, !68}
!68 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!69 = !{!70, !71, !72}
!70 = !{!"0x101\00IntParIO\0016777567\000", !65, !34, !68} ; [ DW_TAG_arg_variable ] [IntParIO] [line 351]
!71 = !{!"0x100\00IntLoc\00353\000", !65, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 353]
!72 = !{!"0x100\00EnumLoc\00354\000", !65, !34, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 354]
!73 = !{!"0x2e\00Proc3\00Proc3\00\00370\000\001\000\000\000\001\00372", !1, !34, !74, null, i32 (%struct.Record**)* @Proc3, null, null, !77} ; [ DW_TAG_subprogram ] [line 370] [def] [scope 372] [Proc3]
!74 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !75, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = !{!31, !76}
!76 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!77 = !{!78}
!78 = !{!"0x101\00PtrParOut\0016777587\000", !73, !34, !76} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 371]
!79 = !{!"0x2e\00Proc4\00Proc4\00\00380\000\001\000\000\000\001\00381", !1, !34, !43, null, i32 ()* @Proc4, null, null, !80} ; [ DW_TAG_subprogram ] [line 380] [def] [scope 381] [Proc4]
!80 = !{!81}
!81 = !{!"0x100\00BoolLoc\00382\000", !79, !34, !82} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 382]
!82 = !{!"0x16\00boolean\00155\000\000\000\000", !1, null, !31} ; [ DW_TAG_typedef ] [boolean] [line 155, size 0, align 0, offset 0] [from int]
!83 = !{!"0x2e\00Proc5\00Proc5\00\00389\000\001\000\000\000\001\00390", !1, !34, !43, null, i32 ()* @Proc5, null, null, !84} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 390] [Proc5]
!84 = !{}
!85 = !{!"0x2e\00Proc6\00Proc6\00\00397\000\001\000\000\000\001\00400", !1, !34, !86, null, i32 (i32, i32*)* @Proc6, null, null, !89} ; [ DW_TAG_subprogram ] [line 397] [def] [scope 400] [Proc6]
!86 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !87, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = !{!31, !19, !88}
!88 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!89 = !{!90, !91}
!90 = !{!"0x101\00EnumParIn\0016777614\000", !85, !34, !19} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 398]
!91 = !{!"0x101\00EnumParOut\0033554831\000", !85, !34, !88} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 399]
!92 = !{!"0x2e\00Proc7\00Proc7\00\00416\000\001\000\000\000\001\00420", !1, !34, !93, null, i32 (double, double, double*)* @Proc7, null, null, !95} ; [ DW_TAG_subprogram ] [line 416] [def] [scope 420] [Proc7]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{!31, !22, !22, !68}
!95 = !{!96, !97, !98, !99}
!96 = !{!"0x101\00IntParI1\0016777633\000", !92, !34, !22} ; [ DW_TAG_arg_variable ] [IntParI1] [line 417]
!97 = !{!"0x101\00IntParI2\0033554850\000", !92, !34, !22} ; [ DW_TAG_arg_variable ] [IntParI2] [line 418]
!98 = !{!"0x101\00IntParOut\0050332067\000", !92, !34, !68} ; [ DW_TAG_arg_variable ] [IntParOut] [line 419]
!99 = !{!"0x100\00IntLoc\00421\000", !92, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 421]
!100 = !{!"0x2e\00Proc8\00Proc8\00\00427\000\001\000\000\000\001\00432", !1, !34, !101, null, i32 (double*, [51 x double]*, double, double)* @Proc8, null, null, !108} ; [ DW_TAG_subprogram ] [line 427] [def] [scope 432] [Proc8]
!101 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !102, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!102 = !{!31, !103, !104, !22, !22}
!103 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!104 = !{!"0xf\00\000\0064\0064\000\000", null, null, !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!105 = !{!"0x1\00\000\003264\0064\000\000\000", null, null, !23, !106, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 3264, align 64, offset 0] [from double]
!106 = !{!107}
!107 = !{!"0x21\000\0051"}                        ; [ DW_TAG_subrange_type ] [0, 50]
!108 = !{!109, !110, !111, !112, !113, !114}
!109 = !{!"0x101\00Array1Par\0016777644\000", !100, !34, !103} ; [ DW_TAG_arg_variable ] [Array1Par] [line 428]
!110 = !{!"0x101\00Array2Par\0033554861\000", !100, !34, !104} ; [ DW_TAG_arg_variable ] [Array2Par] [line 429]
!111 = !{!"0x101\00IntParI1\0050332078\000", !100, !34, !22} ; [ DW_TAG_arg_variable ] [IntParI1] [line 430]
!112 = !{!"0x101\00IntParI2\0067109295\000", !100, !34, !22} ; [ DW_TAG_arg_variable ] [IntParI2] [line 431]
!113 = !{!"0x100\00IntLoc\00433\000", !100, !34, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 433]
!114 = !{!"0x100\00IntIndex\00434\000", !100, !34, !22} ; [ DW_TAG_auto_variable ] [IntIndex] [line 434]
!115 = !{!"0x2e\00Func1\00Func1\00\00447\000\001\000\000\000\001\00450", !1, !34, !116, null, i32 (i32, i32)* @Func1, null, null, !119} ; [ DW_TAG_subprogram ] [line 447] [def] [scope 450] [Func1]
!116 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !117, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = !{!19, !118, !118}
!118 = !{!"0x16\00CapitalLetter\00139\000\000\000\000", !1, null, !27} ; [ DW_TAG_typedef ] [CapitalLetter] [line 139, size 0, align 0, offset 0] [from char]
!119 = !{!120, !121, !122, !123}
!120 = !{!"0x101\00CharPar1\0016777664\000", !115, !34, !118} ; [ DW_TAG_arg_variable ] [CharPar1] [line 448]
!121 = !{!"0x101\00CharPar2\0033554881\000", !115, !34, !118} ; [ DW_TAG_arg_variable ] [CharPar2] [line 449]
!122 = !{!"0x100\00CharLoc1\00451\000", !115, !34, !118} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 451]
!123 = !{!"0x100\00CharLoc2\00452\000", !115, !34, !118} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 452]
!124 = !{!"0x2e\00Func2\00Func2\00\00462\000\001\000\000\000\001\00465", !1, !34, !125, null, i32 (i8*, i8*)* @Func2, null, null, !127} ; [ DW_TAG_subprogram ] [line 462] [def] [scope 465] [Func2]
!125 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !126, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!126 = !{!82, !38, !38}
!127 = !{!128, !129, !130, !132, !133, !141}
!128 = !{!"0x101\00StrParI1\0016777679\000", !124, !34, !38} ; [ DW_TAG_arg_variable ] [StrParI1] [line 463]
!129 = !{!"0x101\00StrParI2\0033554896\000", !124, !34, !38} ; [ DW_TAG_arg_variable ] [StrParI2] [line 464]
!130 = !{!"0x100\00IntLoc\00466\000", !124, !34, !131} ; [ DW_TAG_auto_variable ] [IntLoc] [line 466]
!131 = !{!"0x16\00OneToThirty\00137\000\000\000\000", !1, null, !23} ; [ DW_TAG_typedef ] [OneToThirty] [line 137, size 0, align 0, offset 0] [from double]
!132 = !{!"0x100\00CharLoc\00467\000", !124, !34, !118} ; [ DW_TAG_auto_variable ] [CharLoc] [line 467]
!133 = !{!"0x100\00__s1_len\00482\000", !134, !34, !138} ; [ DW_TAG_auto_variable ] [__s1_len] [line 482]
!134 = !{!"0xb\00482\007\0028", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!135 = !{!"0xb\00482\007\0027", !1, !136}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!136 = !{!"0xb\00481\002\0026", !1, !137}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!137 = !{!"0xb\00478\006\0025", !1, !124}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!138 = !{!"0x16\00size_t\0062\000\000\000\000", !139, null, !140} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!139 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!140 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!141 = !{!"0x100\00__s2_len\00482\000", !134, !34, !138} ; [ DW_TAG_auto_variable ] [__s2_len] [line 482]
!142 = !{!"0x2e\00Func3\00Func3\00\00492\000\001\000\000\000\001\00494", !1, !34, !143, null, i32 (i32)* @Func3, null, null, !145} ; [ DW_TAG_subprogram ] [line 492] [def] [scope 494] [Func3]
!143 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !144, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!144 = !{!82, !19}
!145 = !{!146, !147}
!146 = !{!"0x101\00EnumParIn\0016777709\000", !142, !34, !19} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!147 = !{!"0x100\00EnumLoc\00495\000", !142, !34, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!148 = !{!149, !153, !154, !155, !156, !157, !159, !163, !164}
!149 = !{!"0x34\00Version\00Version\00\00117\000\001", null, !34, !150, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 117] [def]
!150 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !27, !151, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!151 = !{!152}
!152 = !{!"0x21\000\004"}                         ; [ DW_TAG_subrange_type ] [0, 3]
!153 = !{!"0x34\00IntGlob\00IntGlob\00\00190\000\001", null, !34, !23, double* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 190] [def]
!154 = !{!"0x34\00BoolGlob\00BoolGlob\00\00191\000\001", null, !34, !82, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 191] [def]
!155 = !{!"0x34\00Char1Glob\00Char1Glob\00\00192\000\001", null, !34, !27, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 192] [def]
!156 = !{!"0x34\00Char2Glob\00Char2Glob\00\00193\000\001", null, !34, !27, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 193] [def]
!157 = !{!"0x34\00Array1Glob\00Array1Glob\00\00194\000\001", null, !34, !158, [51 x double]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 194] [def]
!158 = !{!"0x16\00Array1Dim\00141\000\000\000\000", !1, null, !105} ; [ DW_TAG_typedef ] [Array1Dim] [line 141, size 0, align 0, offset 0] [from ]
!159 = !{!"0x34\00Array2Glob\00Array2Glob\00\00195\000\001", null, !34, !160, [51 x [51 x double]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 195] [def]
!160 = !{!"0x16\00Array2Dim\00142\000\000\000\000", !1, null, !161} ; [ DW_TAG_typedef ] [Array2Dim] [line 142, size 0, align 0, offset 0] [from ]
!161 = !{!"0x1\00\000\00166464\0064\000\000\000", null, null, !23, !162, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 166464, align 64, offset 0] [from double]
!162 = !{!107, !107}
!163 = !{!"0x34\00PtrGlb\00PtrGlb\00\00196\000\001", null, !34, !11, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 196] [def]
!164 = !{!"0x34\00PtrGlbNext\00PtrGlbNext\00\00197\000\001", null, !34, !11, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 197] [def]
!165 = !{i32 2, !"Dwarf Version", i32 4}
!166 = !{i32 2, !"Debug Info Version", i32 2}
!167 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!168 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!169 = !MDLocation(line: 177, column: 5, scope: !33)
!170 = !MDLocation(line: 178, column: 8, scope: !33)
!171 = !MDLocation(line: 180, column: 3, scope: !33)
!172 = !MDLocation(line: 183, column: 2, scope: !33)
!173 = !MDLocation(line: 184, column: 9, scope: !33)
!174 = !MDLocation(line: 207, column: 12, scope: !42)
!175 = !MDLocation(line: 208, column: 12, scope: !42)
!176 = !MDLocation(line: 216, column: 14, scope: !42)
!177 = !MDLocation(line: 209, column: 24, scope: !42)
!178 = !MDLocation(line: 218, column: 13, scope: !42)
!179 = !MDLocation(line: 242, column: 27, scope: !42)
!180 = !MDLocation(line: 242, column: 2, scope: !42)
!181 = !{!182, !182, i64 0}
!182 = !{!"any pointer", !183, i64 0}
!183 = !{!"omnipotent char", !184, i64 0}
!184 = !{!"Simple C/C++ TBAA"}
!185 = !MDLocation(line: 243, column: 23, scope: !42)
!186 = !MDLocation(line: 243, column: 2, scope: !42)
!187 = !MDLocation(line: 244, column: 2, scope: !42)
!188 = !{!189, !182, i64 0}
!189 = !{!"Record", !182, i64 0, !183, i64 8, !183, i64 12, !190, i64 16, !183, i64 24}
!190 = !{!"double", !183, i64 0}
!191 = !MDLocation(line: 245, column: 2, scope: !42)
!192 = !{!189, !183, i64 8}
!193 = !MDLocation(line: 246, column: 2, scope: !42)
!194 = !{!189, !183, i64 12}
!195 = !MDLocation(line: 247, column: 2, scope: !42)
!196 = !{!189, !190, i64 16}
!197 = !MDLocation(line: 248, column: 9, scope: !42)
!198 = !MDLocation(line: 248, column: 2, scope: !42)
!199 = !MDLocation(line: 252, column: 2, scope: !42)
!200 = !{!190, !190, i64 0}
!201 = !MDLocation(line: 258, column: 14, scope: !42)
!202 = !MDLocation(line: 266, column: 2, scope: !203)
!203 = !{!"0xb\00266\002\002", !1, !42}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!204 = !MDLocation(line: 391, column: 2, scope: !83, inlinedAt: !205)
!205 = !MDLocation(line: 268, column: 3, scope: !206)
!206 = !{!"0xb\00267\002\004", !1, !207}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!207 = !{!"0xb\00266\002\003", !1, !203}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!208 = !{!183, !183, i64 0}
!209 = !MDLocation(line: 386, column: 2, scope: !79, inlinedAt: !210)
!210 = !MDLocation(line: 269, column: 3, scope: !206)
!211 = !MDLocation(line: 201, column: 14, scope: !42)
!212 = !{!"0x101\00IntParIO\0016777567\000", !65, !34, !68, !213} ; [ DW_TAG_arg_variable ] [IntParIO] [line 351]
!213 = !MDLocation(line: 289, column: 3, scope: !206)
!214 = !MDLocation(line: 351, column: 13, scope: !65, inlinedAt: !213)
!215 = !MDLocation(line: 202, column: 18, scope: !42)
!216 = !MDLocation(line: 206, column: 16, scope: !42)
!217 = !{!"0x101\00EnumParOut\0033554831\000", !85, !34, !88, !218} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 399]
!218 = !MDLocation(line: 285, column: 5, scope: !219)
!219 = !{!"0xb\00284\008\008", !1, !220}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!220 = !{!"0xb\00283\003\007", !1, !221}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!221 = !{!"0xb\00283\003\006", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!222 = !MDLocation(line: 399, column: 18, scope: !85, inlinedAt: !218)
!223 = !{!"0x101\00StrParI1\0016777679\000", !124, !34, !38, !224} ; [ DW_TAG_arg_variable ] [StrParI1] [line 463]
!224 = !MDLocation(line: 274, column: 16, scope: !206)
!225 = !MDLocation(line: 463, column: 10, scope: !124, inlinedAt: !224)
!226 = !{!"0x101\00StrParI2\0033554896\000", !124, !34, !38, !224} ; [ DW_TAG_arg_variable ] [StrParI2] [line 464]
!227 = !MDLocation(line: 464, column: 10, scope: !124, inlinedAt: !224)
!228 = !{!"0x100\00IntLoc\00466\000", !124, !34, !131, !224} ; [ DW_TAG_auto_variable ] [IntLoc] [line 466]
!229 = !MDLocation(line: 466, column: 19, scope: !124, inlinedAt: !224)
!230 = !{!"0x100\00CharLoc\00467\000", !124, !34, !118, !224} ; [ DW_TAG_auto_variable ] [CharLoc] [line 467]
!231 = !MDLocation(line: 467, column: 20, scope: !124, inlinedAt: !224)
!232 = !{!"0x101\00IntParI1\0016777633\000", !92, !34, !22, !233} ; [ DW_TAG_arg_variable ] [IntParI1] [line 417]
!233 = !MDLocation(line: 278, column: 4, scope: !234)
!234 = !{!"0xb\00276\003\005", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!235 = !MDLocation(line: 417, column: 12, scope: !92, inlinedAt: !233)
!236 = !{!"0x101\00IntParI2\0033554850\000", !92, !34, !22, !233} ; [ DW_TAG_arg_variable ] [IntParI2] [line 418]
!237 = !MDLocation(line: 418, column: 12, scope: !92, inlinedAt: !233)
!238 = !{!"0x101\00Array1Par\0016777644\000", !100, !34, !103, !239} ; [ DW_TAG_arg_variable ] [Array1Par] [line 428]
!239 = !MDLocation(line: 281, column: 3, scope: !206)
!240 = !MDLocation(line: 428, column: 11, scope: !100, inlinedAt: !239)
!241 = !{!"0x101\00Array2Par\0033554861\000", !100, !34, !104, !239} ; [ DW_TAG_arg_variable ] [Array2Par] [line 429]
!242 = !MDLocation(line: 429, column: 11, scope: !100, inlinedAt: !239)
!243 = !{!"0x101\00IntParI1\0050332078\000", !100, !34, !22, !239} ; [ DW_TAG_arg_variable ] [IntParI1] [line 430]
!244 = !MDLocation(line: 430, column: 12, scope: !100, inlinedAt: !239)
!245 = !{!"0x100\00IntLoc\00433\000", !100, !34, !22, !239} ; [ DW_TAG_auto_variable ] [IntLoc] [line 433]
!246 = !MDLocation(line: 433, column: 17, scope: !100, inlinedAt: !239)
!247 = !MDLocation(line: 437, column: 2, scope: !100, inlinedAt: !239)
!248 = !MDLocation(line: 439, column: 2, scope: !100, inlinedAt: !239)
!249 = !{!"0x100\00IntIndex\00434\000", !100, !34, !22, !239} ; [ DW_TAG_auto_variable ] [IntIndex] [line 434]
!250 = !MDLocation(line: 434, column: 17, scope: !100, inlinedAt: !239)
!251 = !MDLocation(line: 441, column: 3, scope: !252, inlinedAt: !239)
!252 = !{!"0xb\00440\002\0020", !1, !253}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!253 = !{!"0xb\00440\002\0019", !1, !100}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!254 = !MDLocation(line: 442, column: 2, scope: !100, inlinedAt: !239)
!255 = !MDLocation(line: 443, column: 2, scope: !100, inlinedAt: !239)
!256 = !MDLocation(line: 444, column: 2, scope: !100, inlinedAt: !239)
!257 = !MDLocation(line: 282, column: 9, scope: !206)
!258 = !{!"0x101\00PtrParIn\0016777543\000", !60, !34, !11, !259} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 327]
!259 = !MDLocation(line: 282, column: 3, scope: !206)
!260 = !MDLocation(line: 327, column: 15, scope: !60, inlinedAt: !259)
!261 = !MDLocation(line: 332, column: 2, scope: !60, inlinedAt: !259)
!262 = !MDLocation(line: 333, column: 2, scope: !60, inlinedAt: !259)
!263 = !MDLocation(line: 334, column: 2, scope: !60, inlinedAt: !259)
!264 = !MDLocation(line: 205, column: 12, scope: !42)
!265 = !MDLocation(line: 283, column: 38, scope: !220)
!266 = !MDLocation(line: 283, column: 25, scope: !220)
!267 = !MDLocation(line: 283, column: 3, scope: !221)
!268 = !MDLocation(line: 398, column: 17, scope: !85, inlinedAt: !218)
!269 = !{!"0x101\00EnumParIn\0016777614\000", !85, !34, !19, !218} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 398]
!270 = !{!"0x101\00EnumParIn\0016777709\000", !142, !34, !19, !271} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!271 = !MDLocation(line: 402, column: 8, scope: !272, inlinedAt: !218)
!272 = !{!"0xb\00402\006\0016", !1, !85}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!273 = !MDLocation(line: 493, column: 17, scope: !142, inlinedAt: !271)
!274 = !{!"0x100\00EnumLoc\00495\000", !142, !34, !19, !271} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!275 = !MDLocation(line: 495, column: 18, scope: !142, inlinedAt: !271)
!276 = !MDLocation(line: 283, column: 49, scope: !220)
!277 = !MDLocation(line: 266, column: 25, scope: !207)
!278 = !MDLocation(line: 392, column: 2, scope: !83, inlinedAt: !205)
!279 = !{!280, !280, i64 0}
!280 = !{!"int", !183, i64 0}
!281 = !MDLocation(line: 324, column: 1, scope: !42)
!282 = !MDLocation(line: 327, column: 15, scope: !60)
!283 = !MDLocation(line: 332, column: 2, scope: !60)
!284 = !MDLocation(line: 333, column: 2, scope: !60)
!285 = !MDLocation(line: 334, column: 2, scope: !60)
!286 = !MDLocation(line: 348, column: 1, scope: !60)
!287 = !MDLocation(line: 351, column: 13, scope: !65)
!288 = !MDLocation(line: 353, column: 18, scope: !65)
!289 = !MDLocation(line: 359, column: 7, scope: !290)
!290 = !{!"0xb\00359\007\0012", !1, !291}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!291 = !{!"0xb\00358\002\0011", !1, !292}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!292 = !{!"0xb\00357\002\0010", !1, !293}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!293 = !{!"0xb\00357\002\009", !1, !65}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!294 = !MDLocation(line: 359, column: 7, scope: !291)
!295 = !MDLocation(line: 356, column: 11, scope: !65)
!296 = !MDLocation(line: 361, column: 4, scope: !297)
!297 = !{!"0xb\00360\003\0013", !1, !290}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!298 = !MDLocation(line: 362, column: 25, scope: !297)
!299 = !MDLocation(line: 362, column: 16, scope: !297)
!300 = !MDLocation(line: 362, column: 4, scope: !297)
!301 = !MDLocation(line: 354, column: 19, scope: !65)
!302 = !MDLocation(line: 364, column: 3, scope: !297)
!303 = !MDLocation(line: 368, column: 1, scope: !65)
!304 = !MDLocation(line: 371, column: 12, scope: !73)
!305 = !MDLocation(line: 373, column: 6, scope: !306)
!306 = !{!"0xb\00373\006\0015", !1, !73}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!307 = !MDLocation(line: 373, column: 6, scope: !73)
!308 = !MDLocation(line: 374, column: 16, scope: !306)
!309 = !MDLocation(line: 374, column: 3, scope: !306)
!310 = !MDLocation(line: 377, column: 12, scope: !73)
!311 = !MDLocation(line: 377, column: 22, scope: !73)
!312 = !MDLocation(line: 376, column: 3, scope: !306)
!313 = !MDLocation(line: 377, column: 21, scope: !73)
!314 = !MDLocation(line: 377, column: 2, scope: !73)
!315 = !MDLocation(line: 378, column: 1, scope: !73)
!316 = !MDLocation(line: 386, column: 2, scope: !79)
!317 = !MDLocation(line: 387, column: 1, scope: !79)
!318 = !MDLocation(line: 391, column: 2, scope: !83)
!319 = !MDLocation(line: 392, column: 2, scope: !83)
!320 = !MDLocation(line: 393, column: 1, scope: !83)
!321 = !MDLocation(line: 398, column: 17, scope: !85)
!322 = !MDLocation(line: 399, column: 18, scope: !85)
!323 = !{!"0x101\00EnumParIn\0016777709\000", !142, !34, !19, !324} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 493]
!324 = !MDLocation(line: 402, column: 8, scope: !272)
!325 = !MDLocation(line: 493, column: 17, scope: !142, inlinedAt: !324)
!326 = !{!"0x100\00EnumLoc\00495\000", !142, !34, !19, !324} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 495]
!327 = !MDLocation(line: 495, column: 18, scope: !142, inlinedAt: !324)
!328 = !MDLocation(line: 498, column: 6, scope: !329, inlinedAt: !324)
!329 = !{!"0xb\00498\006\0030", !1, !142}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!330 = !MDLocation(line: 402, column: 6, scope: !85)
!331 = !MDLocation(line: 403, column: 3, scope: !272)
!332 = !MDLocation(line: 404, column: 2, scope: !85)
!333 = !MDLocation(line: 406, column: 15, scope: !334)
!334 = !{!"0xb\00405\002\0017", !1, !85}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!335 = !MDLocation(line: 406, column: 37, scope: !334)
!336 = !MDLocation(line: 407, column: 19, scope: !337)
!337 = !{!"0xb\00407\0019\0018", !1, !334}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!338 = !MDLocation(line: 407, column: 19, scope: !334)
!339 = !MDLocation(line: 407, column: 34, scope: !337)
!340 = !MDLocation(line: 408, column: 9, scope: !337)
!341 = !MDLocation(line: 410, column: 15, scope: !334)
!342 = !MDLocation(line: 410, column: 37, scope: !334)
!343 = !MDLocation(line: 412, column: 15, scope: !334)
!344 = !MDLocation(line: 413, column: 2, scope: !334)
!345 = !MDLocation(line: 414, column: 1, scope: !85)
!346 = !MDLocation(line: 417, column: 12, scope: !92)
!347 = !MDLocation(line: 418, column: 12, scope: !92)
!348 = !MDLocation(line: 419, column: 13, scope: !92)
!349 = !MDLocation(line: 423, column: 11, scope: !92)
!350 = !MDLocation(line: 421, column: 17, scope: !92)
!351 = !MDLocation(line: 424, column: 15, scope: !92)
!352 = !MDLocation(line: 424, column: 2, scope: !92)
!353 = !MDLocation(line: 425, column: 1, scope: !92)
!354 = !MDLocation(line: 428, column: 11, scope: !100)
!355 = !MDLocation(line: 429, column: 11, scope: !100)
!356 = !MDLocation(line: 430, column: 12, scope: !100)
!357 = !MDLocation(line: 431, column: 12, scope: !100)
!358 = !MDLocation(line: 436, column: 11, scope: !100)
!359 = !MDLocation(line: 433, column: 17, scope: !100)
!360 = !MDLocation(line: 437, column: 12, scope: !100)
!361 = !MDLocation(line: 437, column: 2, scope: !100)
!362 = !MDLocation(line: 438, column: 12, scope: !100)
!363 = !MDLocation(line: 438, column: 2, scope: !100)
!364 = !MDLocation(line: 439, column: 12, scope: !100)
!365 = !MDLocation(line: 439, column: 2, scope: !100)
!366 = !MDLocation(line: 434, column: 17, scope: !100)
!367 = !MDLocation(line: 440, column: 39, scope: !252)
!368 = !MDLocation(line: 440, column: 26, scope: !252)
!369 = !MDLocation(line: 440, column: 2, scope: !253)
!370 = !MDLocation(line: 441, column: 26, scope: !252)
!371 = !MDLocation(line: 441, column: 3, scope: !252)
!372 = !MDLocation(line: 440, column: 50, scope: !252)
!373 = !MDLocation(line: 442, column: 27, scope: !100)
!374 = !MDLocation(line: 442, column: 2, scope: !100)
!375 = !MDLocation(line: 443, column: 43, scope: !100)
!376 = !MDLocation(line: 443, column: 12, scope: !100)
!377 = !MDLocation(line: 443, column: 2, scope: !100)
!378 = !MDLocation(line: 444, column: 2, scope: !100)
!379 = !MDLocation(line: 445, column: 1, scope: !100)
!380 = !MDLocation(line: 456, column: 6, scope: !381)
!381 = !{!"0xb\00456\006\0021", !1, !115}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!382 = !MDLocation(line: 456, column: 18, scope: !381)
!383 = !MDLocation(line: 459, column: 3, scope: !381)
!384 = !MDLocation(line: 460, column: 1, scope: !115)
!385 = !MDLocation(line: 463, column: 10, scope: !124)
!386 = !MDLocation(line: 464, column: 10, scope: !124)
!387 = !MDLocation(line: 466, column: 19, scope: !124)
!388 = !MDLocation(line: 471, column: 13, scope: !389)
!389 = !{!"0xb\00471\007\0022", !1, !124}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!390 = !MDLocation(line: 471, column: 36, scope: !389)
!391 = !MDLocation(line: 471, column: 7, scope: !389)
!392 = !MDLocation(line: 471, column: 7, scope: !124)
!393 = !MDLocation(line: 467, column: 20, scope: !124)
!394 = !MDLocation(line: 482, column: 7, scope: !134)
!395 = !MDLocation(line: 482, column: 7, scope: !135)
!396 = !MDLocation(line: 485, column: 4, scope: !397)
!397 = !{!"0xb\00483\003\0029", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!398 = !MDLocation(line: 490, column: 1, scope: !124)
!399 = !MDLocation(line: 493, column: 17, scope: !142)
!400 = !MDLocation(line: 495, column: 18, scope: !142)
!401 = !MDLocation(line: 498, column: 6, scope: !329)
!402 = !MDLocation(line: 498, column: 25, scope: !403)
!403 = !{!"0xb\001", !1, !329}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fldry.c]
!404 = !MDLocation(line: 500, column: 1, scope: !142)
