; ModuleID = 'dry.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Record = type { %struct.Record*, i32, i32, i32, [31 x i8] }

@Version = global [4 x i8] c"1.1\00", align 1
@PtrGlbNext = common global %struct.Record* null, align 8
@PtrGlb = common global %struct.Record* null, align 8
@.str = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 1'ST STRING\00", align 16
@Array2Glob = common global [51 x [51 x i32]] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 16
@BoolGlob = common global i32 0, align 4
@Array1Glob = common global [51 x i32] zeroinitializer, align 16
@Char2Glob = common global i8 0, align 1
@Char1Glob = common global i8 0, align 1
@IntGlob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %call = tail call i32 @Proc0(), !dbg !161
  ret i32 0, !dbg !162
}

; Function Attrs: nounwind uwtable
define i32 @Proc0() #0 {
for.end:
  %IntLoc1 = alloca i32, align 4
  %IntLoc3 = alloca i32, align 4
  %EnumLoc = alloca i32, align 4
  tail call void @llvm.dbg.declare(metadata [31 x i8]* @.str1, metadata !45, metadata !163), !dbg !164
  tail call void @llvm.dbg.declare(metadata [31 x i8]* @.str2, metadata !46, metadata !163), !dbg !165
  %call = tail call i32 (...)* @clock() #7, !dbg !166
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !163), !dbg !167
  %call2 = tail call i32 (...)* @clock() #7, !dbg !168
  %call4 = tail call noalias i8* @malloc(i64 56) #7, !dbg !169
  store i8* %call4, i8** bitcast (%struct.Record** @PtrGlbNext to i8**), align 8, !dbg !170, !tbaa !171
  %call5 = tail call noalias i8* @malloc(i64 56) #7, !dbg !175
  store i8* %call5, i8** bitcast (%struct.Record** @PtrGlb to i8**), align 8, !dbg !176, !tbaa !171
  %0 = load %struct.Record** @PtrGlbNext, align 8, !dbg !177, !tbaa !171
  %PtrComp = bitcast i8* %call5 to %struct.Record**, !dbg !178
  store %struct.Record* %0, %struct.Record** %PtrComp, align 8, !dbg !178, !tbaa !179
  %1 = load %struct.Record** @PtrGlb, align 8, !dbg !182, !tbaa !171
  %Discr = getelementptr inbounds %struct.Record* %1, i64 0, i32 1, !dbg !182
  store i32 0, i32* %Discr, align 4, !dbg !182, !tbaa !183
  %2 = load %struct.Record** @PtrGlb, align 8, !dbg !184, !tbaa !171
  %EnumComp = getelementptr inbounds %struct.Record* %2, i64 0, i32 2, !dbg !184
  store i32 10001, i32* %EnumComp, align 4, !dbg !184, !tbaa !185
  %3 = load %struct.Record** @PtrGlb, align 8, !dbg !186, !tbaa !171
  %IntComp = getelementptr inbounds %struct.Record* %3, i64 0, i32 3, !dbg !186
  store i32 40, i32* %IntComp, align 4, !dbg !186, !tbaa !187
  %4 = load %struct.Record** @PtrGlb, align 8, !dbg !188, !tbaa !171
  %arraydecay = getelementptr inbounds %struct.Record* %4, i64 0, i32 4, i64 0, !dbg !188
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arraydecay, i8* getelementptr inbounds ([31 x i8]* @.str, i64 0, i64 0), i64 31, i32 1, i1 false), !dbg !189
  store i32 10, i32* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 8, i64 7), align 4, !dbg !190, !tbaa !191
  %call9 = tail call i32 (...)* @clock() #7, !dbg !192
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !47, metadata !163), !dbg !167
  br label %while.end, !dbg !193

while.end:                                        ; preds = %for.end42, %for.end
  %i.163 = phi i32 [ 0, %for.end ], [ %inc49, %for.end42 ]
  %call15 = tail call i32 @Proc5(), !dbg !195
  %call16 = tail call i32 @Proc4(), !dbg !198
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !40, metadata !163), !dbg !200
  tail call void @llvm.dbg.value(metadata i32 10000, i64 0, metadata !44, metadata !163), !dbg !201
  store i32 10000, i32* %EnumLoc, align 4, !dbg !202, !tbaa !203
  %call21 = tail call i32 @Func2(i8* getelementptr inbounds ([31 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8]* @.str2, i64 0, i64 0)), !dbg !204
  %lnot = icmp eq i32 %call21, 0, !dbg !205
  %lnot.ext = zext i1 %lnot to i32, !dbg !205
  store i32 %lnot.ext, i32* @BoolGlob, align 4, !dbg !206, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32 7, i64 0, metadata !41, metadata !163), !dbg !207
  store i32 7, i32* %IntLoc3, align 4, !dbg !208, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32* %IntLoc3, i64 0, metadata !41, metadata !163), !dbg !207
  %call25 = call i32 @Proc7(i32 2, i32 3, i32* %IntLoc3), !dbg !210
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  store i32 3, i32* %IntLoc1, align 4, !dbg !211, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32* %IntLoc3, i64 0, metadata !41, metadata !163), !dbg !207
  %5 = load i32* %IntLoc3, align 4, !dbg !212, !tbaa !191
  %call27 = tail call i32 @Proc8(i32* getelementptr inbounds ([51 x i32]* @Array1Glob, i64 0, i64 0), [51 x i32]* getelementptr inbounds ([51 x [51 x i32]]* @Array2Glob, i64 0, i64 0), i32 3, i32 %5), !dbg !213
  %6 = load %struct.Record** @PtrGlb, align 8, !dbg !214, !tbaa !171
  %call28 = tail call i32 @Proc1(%struct.Record* %6), !dbg !215
  tail call void @llvm.dbg.value(metadata i8 65, i64 0, metadata !43, metadata !163), !dbg !216
  %7 = load i8* @Char2Glob, align 1, !dbg !217, !tbaa !203
  %cmp3261 = icmp slt i8 %7, 65, !dbg !220
  br i1 %cmp3261, label %for.end42, label %for.body34, !dbg !221

for.body34:                                       ; preds = %while.end, %for.inc40
  %CharIndex.062 = phi i8 [ %inc41, %for.inc40 ], [ 65, %while.end ]
  %conv30 = sext i8 %CharIndex.062 to i32, !dbg !222
  tail call void @llvm.dbg.value(metadata i32* %EnumLoc, i64 0, metadata !44, metadata !163), !dbg !201
  %8 = load i32* %EnumLoc, align 4, !dbg !225, !tbaa !203
  %call36 = tail call i32 @Func1(i32 %conv30, i32 67), !dbg !227
  %cmp37 = icmp eq i32 %8, %call36, !dbg !225
  br i1 %cmp37, label %if.then, label %for.inc40, !dbg !228

if.then:                                          ; preds = %for.body34
  tail call void @llvm.dbg.value(metadata i32* %EnumLoc, i64 0, metadata !44, metadata !163), !dbg !201
  %call39 = call i32 @Proc6(i32 0, i32* %EnumLoc), !dbg !229
  br label %for.inc40, !dbg !229

for.inc40:                                        ; preds = %for.body34, %if.then
  %inc41 = add i8 %CharIndex.062, 1, !dbg !230
  tail call void @llvm.dbg.value(metadata i8 %inc41, i64 0, metadata !43, metadata !163), !dbg !216
  %9 = load i8* @Char2Glob, align 1, !dbg !217, !tbaa !203
  %cmp32 = icmp sgt i8 %inc41, %9, !dbg !220
  br i1 %cmp32, label %for.end42, label %for.body34, !dbg !221

for.end42:                                        ; preds = %for.inc40, %while.end
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  %10 = load i32* %IntLoc1, align 4, !dbg !231, !tbaa !191
  %mul43 = mul nsw i32 %10, 3, !dbg !232
  tail call void @llvm.dbg.value(metadata i32 %mul43, i64 0, metadata !41, metadata !163), !dbg !207
  store i32 %mul43, i32* %IntLoc3, align 4, !dbg !233, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  tail call void @llvm.dbg.value(metadata i32 3, i64 0, metadata !40, metadata !163), !dbg !200
  tail call void @llvm.dbg.value(metadata i32* %IntLoc1, i64 0, metadata !39, metadata !163), !dbg !199
  %call47 = call i32 @Proc2(i32* %IntLoc1), !dbg !234
  %inc49 = add nuw nsw i32 %i.163, 1, !dbg !235
  tail call void @llvm.dbg.value(metadata i32 %inc49, i64 0, metadata !47, metadata !163), !dbg !167
  %exitcond = icmp eq i32 %inc49, 100000000, !dbg !193
  br i1 %exitcond, label %for.end50, label %while.end, !dbg !193

for.end50:                                        ; preds = %for.end42
  ret i32 undef, !dbg !236
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @clock(...) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define i32 @Proc1(%struct.Record* nocapture %PtrParIn) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Record* %PtrParIn, i64 0, metadata !57, metadata !163), !dbg !237
  %IntComp = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 3, !dbg !238
  store i32 5, i32* %IntComp, align 4, !dbg !238, !tbaa !187
  %PtrComp = getelementptr inbounds %struct.Record* %PtrParIn, i64 0, i32 0, !dbg !239
  %0 = load %struct.Record** %PtrComp, align 8, !dbg !239, !tbaa !179
  %IntComp2 = getelementptr inbounds %struct.Record* %0, i64 0, i32 3, !dbg !239
  store i32 5, i32* %IntComp2, align 4, !dbg !239, !tbaa !187
  %1 = load %struct.Record** %PtrComp, align 8, !dbg !240, !tbaa !179
  %PtrComp5 = getelementptr inbounds %struct.Record* %1, i64 0, i32 0, !dbg !241
  store %struct.Record* %1, %struct.Record** %PtrComp5, align 8, !dbg !241, !tbaa !179
  ret i32 undef, !dbg !242
}

; Function Attrs: nounwind uwtable
define i32 @Proc2(i32* nocapture %IntParIO) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %IntParIO, i64 0, metadata !63, metadata !163), !dbg !243
  %0 = load i8* @Char1Glob, align 1, !dbg !244, !tbaa !203
  %cmp = icmp eq i8 %0, 65, !dbg !244
  br i1 %cmp, label %if.then, label %for.end, !dbg !249

if.then:                                          ; preds = %entry
  %1 = load i32* %IntParIO, align 4, !dbg !250, !tbaa !191
  %dec = add nsw i32 %1, 9, !dbg !251
  tail call void @llvm.dbg.value(metadata i32 %dec, i64 0, metadata !64, metadata !163), !dbg !253
  %2 = load i32* @IntGlob, align 4, !dbg !254, !tbaa !191
  %sub = sub i32 %dec, %2, !dbg !255
  store i32 %sub, i32* %IntParIO, align 4, !dbg !256, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !65, metadata !163), !dbg !257
  br label %for.end, !dbg !258

for.end:                                          ; preds = %entry, %if.then
  ret i32 undef, !dbg !259
}

; Function Attrs: nounwind uwtable
define i32 @Proc3(%struct.Record** nocapture %PtrParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Record** %PtrParOut, i64 0, metadata !71, metadata !163), !dbg !260
  %0 = load %struct.Record** @PtrGlb, align 8, !dbg !261, !tbaa !171
  %cmp = icmp eq %struct.Record* %0, null, !dbg !261
  br i1 %cmp, label %if.else, label %if.then, !dbg !263

if.then:                                          ; preds = %entry
  %PtrComp = getelementptr inbounds %struct.Record* %0, i64 0, i32 0, !dbg !264
  %1 = load %struct.Record** %PtrComp, align 8, !dbg !264, !tbaa !179
  store %struct.Record* %1, %struct.Record** %PtrParOut, align 8, !dbg !265, !tbaa !171
  br label %if.end, !dbg !265

if.else:                                          ; preds = %entry
  store i32 100, i32* @IntGlob, align 4, !dbg !266, !tbaa !191
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32* @IntGlob, align 4, !dbg !267, !tbaa !191
  %3 = load %struct.Record** @PtrGlb, align 8, !dbg !268, !tbaa !171
  %IntComp = getelementptr inbounds %struct.Record* %3, i64 0, i32 3, !dbg !269
  %call = tail call i32 @Proc7(i32 10, i32 %2, i32* %IntComp), !dbg !270
  ret i32 undef, !dbg !271
}

; Function Attrs: nounwind uwtable
define i32 @Proc4() #0 {
entry:
  store i8 66, i8* @Char2Glob, align 1, !dbg !272, !tbaa !203
  ret i32 undef, !dbg !273
}

; Function Attrs: nounwind uwtable
define i32 @Proc5() #0 {
entry:
  store i8 65, i8* @Char1Glob, align 1, !dbg !274, !tbaa !203
  store i32 0, i32* @BoolGlob, align 4, !dbg !275, !tbaa !191
  ret i32 undef, !dbg !276
}

; Function Attrs: nounwind uwtable
define i32 @Proc6(i32 %EnumParIn, i32* nocapture %EnumParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !82, metadata !163), !dbg !277
  tail call void @llvm.dbg.value(metadata i32* %EnumParOut, i64 0, metadata !83, metadata !163), !dbg !278
  %call = tail call i32 @Func3(i32 %EnumParIn), !dbg !279
  %tobool = icmp eq i32 %call, 0, !dbg !281
  %.EnumParIn = select i1 %tobool, i32 10002, i32 %EnumParIn, !dbg !281
  store i32 %.EnumParIn, i32* %EnumParOut, align 4, !dbg !282, !tbaa !203
  switch i32 %EnumParIn, label %sw.epilog [
    i32 0, label %sw.bb
    i32 10000, label %sw.bb1
    i32 10001, label %sw.bb4
    i32 10003, label %sw.bb5
  ], !dbg !283

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %EnumParOut, align 4, !dbg !284, !tbaa !203
  br label %sw.epilog, !dbg !286

sw.bb1:                                           ; preds = %entry
  %0 = load i32* @IntGlob, align 4, !dbg !287, !tbaa !191
  %cmp = icmp sgt i32 %0, 100, !dbg !287
  br i1 %cmp, label %if.then2, label %if.else, !dbg !289

if.then2:                                         ; preds = %sw.bb1
  store i32 0, i32* %EnumParOut, align 4, !dbg !290, !tbaa !203
  br label %sw.epilog, !dbg !290

if.else:                                          ; preds = %sw.bb1
  store i32 10002, i32* %EnumParOut, align 4, !dbg !291, !tbaa !203
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store i32 10000, i32* %EnumParOut, align 4, !dbg !292, !tbaa !203
  br label %sw.epilog, !dbg !293

sw.bb5:                                           ; preds = %entry
  store i32 10001, i32* %EnumParOut, align 4, !dbg !294, !tbaa !203
  br label %sw.epilog, !dbg !295

sw.epilog:                                        ; preds = %if.then2, %if.else, %sw.bb5, %entry, %sw.bb4, %sw.bb
  ret i32 undef, !dbg !296
}

; Function Attrs: nounwind uwtable
define i32 @Proc7(i32 %IntParI1, i32 %IntParI2, i32* nocapture %IntParOut) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %IntParI1, i64 0, metadata !88, metadata !163), !dbg !297
  tail call void @llvm.dbg.value(metadata i32 %IntParI2, i64 0, metadata !89, metadata !163), !dbg !298
  tail call void @llvm.dbg.value(metadata i32* %IntParOut, i64 0, metadata !90, metadata !163), !dbg !299
  %add = add nsw i32 %IntParI1, 2, !dbg !300
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !91, metadata !163), !dbg !301
  %add1 = add nsw i32 %add, %IntParI2, !dbg !302
  store i32 %add1, i32* %IntParOut, align 4, !dbg !303, !tbaa !191
  ret i32 undef, !dbg !304
}

; Function Attrs: nounwind uwtable
define i32 @Proc8(i32* nocapture %Array1Par, [51 x i32]* nocapture %Array2Par, i32 %IntParI1, i32 %IntParI2) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32* %Array1Par, i64 0, metadata !101, metadata !163), !dbg !305
  tail call void @llvm.dbg.value(metadata [51 x i32]* %Array2Par, i64 0, metadata !102, metadata !163), !dbg !306
  tail call void @llvm.dbg.value(metadata i32 %IntParI1, i64 0, metadata !103, metadata !163), !dbg !307
  tail call void @llvm.dbg.value(metadata i32 %IntParI2, i64 0, metadata !104, metadata !163), !dbg !308
  %add = add nsw i32 %IntParI1, 5, !dbg !309
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !105, metadata !163), !dbg !310
  %idxprom = sext i32 %add to i64, !dbg !311
  %arrayidx = getelementptr inbounds i32* %Array1Par, i64 %idxprom, !dbg !311
  store i32 %IntParI2, i32* %arrayidx, align 4, !dbg !311, !tbaa !191
  %add3 = add nsw i32 %IntParI1, 6, !dbg !312
  %idxprom4 = sext i32 %add3 to i64, !dbg !313
  %arrayidx5 = getelementptr inbounds i32* %Array1Par, i64 %idxprom4, !dbg !313
  store i32 %IntParI2, i32* %arrayidx5, align 4, !dbg !313, !tbaa !191
  %add6 = add nsw i32 %IntParI1, 35, !dbg !314
  %idxprom7 = sext i32 %add6 to i64, !dbg !315
  %arrayidx8 = getelementptr inbounds i32* %Array1Par, i64 %idxprom7, !dbg !315
  store i32 %add, i32* %arrayidx8, align 4, !dbg !315, !tbaa !191
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !106, metadata !163), !dbg !316
  %0 = add i32 %IntParI1, 5, !dbg !317
  %1 = sext i32 %0 to i64
  %2 = sext i32 %add3 to i64, !dbg !317
  br label %for.body, !dbg !317

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %1, %entry ]
  %arrayidx13 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom, i64 %indvars.iv, !dbg !319
  store i32 %add, i32* %arrayidx13, align 4, !dbg !319, !tbaa !191
  %cmp = icmp slt i64 %indvars.iv, %2, !dbg !321
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !317
  br i1 %cmp, label %for.body, label %for.end, !dbg !317

for.end:                                          ; preds = %for.body
  %sub = add nsw i32 %IntParI1, 4, !dbg !322
  %idxprom14 = sext i32 %sub to i64, !dbg !323
  %arrayidx17 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom, i64 %idxprom14, !dbg !323
  %3 = load i32* %arrayidx17, align 4, !dbg !323, !tbaa !191
  %inc18 = add nsw i32 %3, 1, !dbg !323
  store i32 %inc18, i32* %arrayidx17, align 4, !dbg !323, !tbaa !191
  %4 = load i32* %arrayidx, align 4, !dbg !324, !tbaa !191
  %add22 = add nsw i32 %IntParI1, 25, !dbg !325
  %idxprom23 = sext i32 %add22 to i64, !dbg !326
  %arrayidx25 = getelementptr inbounds [51 x i32]* %Array2Par, i64 %idxprom23, i64 %idxprom, !dbg !326
  store i32 %4, i32* %arrayidx25, align 4, !dbg !326, !tbaa !191
  store i32 5, i32* @IntGlob, align 4, !dbg !327, !tbaa !191
  ret i32 undef, !dbg !328
}

; Function Attrs: nounwind readnone uwtable
define i32 @Func1(i32, i32) #4 {
entry:
  %sext = shl i32 %0, 24, !dbg !329
  %sext4 = shl i32 %1, 24, !dbg !331
  %cmp = icmp eq i32 %sext, %sext4, !dbg !329
  %. = select i1 %cmp, i32 10000, i32 0, !dbg !332
  ret i32 %., !dbg !333
}

; Function Attrs: nounwind readonly uwtable
define i32 @Func2(i8* nocapture readonly %StrParI1, i8* nocapture readonly %StrParI2) #5 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %StrParI1, i64 0, metadata !121, metadata !163), !dbg !334
  tail call void @llvm.dbg.value(metadata i8* %StrParI2, i64 0, metadata !122, metadata !163), !dbg !335
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !123, metadata !163), !dbg !336
  br label %while.body, !dbg !337

while.body:                                       ; preds = %entry, %while.body
  %IntLoc.032 = phi i32 [ 1, %entry ], [ %add.IntLoc.0, %while.body ]
  %idxprom = sext i32 %IntLoc.032 to i64, !dbg !338
  %arrayidx = getelementptr inbounds i8* %StrParI1, i64 %idxprom, !dbg !338
  %0 = load i8* %arrayidx, align 1, !dbg !338, !tbaa !203
  %conv = sext i8 %0 to i32, !dbg !338
  %add = add nsw i32 %IntLoc.032, 1, !dbg !340
  %idxprom1 = sext i32 %add to i64, !dbg !341
  %arrayidx2 = getelementptr inbounds i8* %StrParI2, i64 %idxprom1, !dbg !341
  %1 = load i8* %arrayidx2, align 1, !dbg !341, !tbaa !203
  %conv3 = sext i8 %1 to i32, !dbg !341
  %call = tail call i32 @Func1(i32 %conv, i32 %conv3), !dbg !342
  %cmp4 = icmp eq i32 %call, 0, !dbg !342
  tail call void @llvm.dbg.value(metadata i8 65, i64 0, metadata !125, metadata !163), !dbg !343
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !123, metadata !163), !dbg !336
  %add.IntLoc.0 = select i1 %cmp4, i32 %add, i32 %IntLoc.032
  %cmp = icmp slt i32 %add.IntLoc.0, 2, !dbg !344
  br i1 %cmp, label %while.body, label %if.else, !dbg !337

if.else:                                          ; preds = %while.body
  %call18 = tail call i32 @strcmp(i8* %StrParI1, i8* %StrParI2) #7, !dbg !347
  %cmp19 = icmp sgt i32 %call18, 0, !dbg !348
  %. = zext i1 %cmp19 to i32, !dbg !349
  ret i32 %., !dbg !351
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind readnone uwtable
define i32 @Func3(i32 %EnumParIn) #4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !139, metadata !163), !dbg !352
  tail call void @llvm.dbg.value(metadata i32 %EnumParIn, i64 0, metadata !140, metadata !163), !dbg !353
  %cmp = icmp eq i32 %EnumParIn, 10001, !dbg !354
  %. = zext i1 %cmp to i32, !dbg !356
  ret i32 %., !dbg !358
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!llvm.module.flags = !{!158, !159}
!llvm.ident = !{!160}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !10, !31, !141, !36} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c] [DW_LANG_C99]
!1 = !{!"dry.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\00133\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 133, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6, !7, !8, !9}
!5 = !{!"0x28\00Ident1\000"}                      ; [ DW_TAG_enumerator ] [Ident1 :: 0]
!6 = !{!"0x28\00Ident2\0010000"}                  ; [ DW_TAG_enumerator ] [Ident2 :: 10000]
!7 = !{!"0x28\00Ident3\0010001"}                  ; [ DW_TAG_enumerator ] [Ident3 :: 10001]
!8 = !{!"0x28\00Ident4\0010002"}                  ; [ DW_TAG_enumerator ] [Ident4 :: 10002]
!9 = !{!"0x28\00Ident5\0010003"}                  ; [ DW_TAG_enumerator ] [Ident5 :: 10003]
!10 = !{!11, !30}
!11 = !{!"0x16\00RecordPtr\00153\000\000\000\000", !1, null, !12} ; [ DW_TAG_typedef ] [RecordPtr] [line 153, size 0, align 0, offset 0] [from ]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordType]
!13 = !{!"0x16\00RecordType\00152\000\000\000\000", !1, null, !14} ; [ DW_TAG_typedef ] [RecordType] [line 152, size 0, align 0, offset 0] [from Record]
!14 = !{!"0x13\00Record\00143\00448\0064\000\000\000", !1, null, null, !15, null, null, null} ; [ DW_TAG_structure_type ] [Record] [line 143, size 448, align 64, offset 0] [def] [from ]
!15 = !{!16, !18, !20, !21, !24}
!16 = !{!"0xd\00PtrComp\00145\0064\0064\000\000", !1, !14, !17} ; [ DW_TAG_member ] [PtrComp] [line 145, size 64, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Record]
!18 = !{!"0xd\00Discr\00146\0032\0032\0064\000", !1, !14, !19} ; [ DW_TAG_member ] [Discr] [line 146, size 32, align 32, offset 64] [from Enumeration]
!19 = !{!"0x16\00Enumeration\00133\000\000\000\000", !1, null, !3} ; [ DW_TAG_typedef ] [Enumeration] [line 133, size 0, align 0, offset 0] [from ]
!20 = !{!"0xd\00EnumComp\00147\0032\0032\0096\000", !1, !14, !19} ; [ DW_TAG_member ] [EnumComp] [line 147, size 32, align 32, offset 96] [from Enumeration]
!21 = !{!"0xd\00IntComp\00148\0032\0032\00128\000", !1, !14, !22} ; [ DW_TAG_member ] [IntComp] [line 148, size 32, align 32, offset 128] [from OneToFifty]
!22 = !{!"0x16\00OneToFifty\00137\000\000\000\000", !1, null, !23} ; [ DW_TAG_typedef ] [OneToFifty] [line 137, size 0, align 0, offset 0] [from int]
!23 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!24 = !{!"0xd\00StringComp\00149\00248\008\00160\000", !1, !14, !25} ; [ DW_TAG_member ] [StringComp] [line 149, size 248, align 8, offset 160] [from String30]
!25 = !{!"0x16\00String30\00139\000\000\000\000", !1, null, !26} ; [ DW_TAG_typedef ] [String30] [line 139, size 0, align 0, offset 0] [from ]
!26 = !{!"0x1\00\000\00248\008\000\000\000", null, null, !27, !28, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 248, align 8, offset 0] [from char]
!27 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!28 = !{!29}
!29 = !{!"0x21\000\0031"}                         ; [ DW_TAG_subrange_type ] [0, 30]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!32, !37, !53, !58, !66, !72, !76, !77, !84, !92, !107, !116, !135}
!32 = !{!"0x2e\00main\00main\00\00173\000\001\000\000\000\001\00174", !1, !33, !34, null, i32 ()* @main, null, null, !36} ; [ DW_TAG_subprogram ] [line 173] [def] [scope 174] [main]
!33 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!34 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !35, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = !{!23}
!36 = !{}
!37 = !{!"0x2e\00Proc0\00Proc0\00\00191\000\001\000\000\000\001\00192", !1, !33, !34, null, i32 ()* @Proc0, null, null, !38} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [Proc0]
!38 = !{!39, !40, !41, !42, !43, !44, !45, !46, !47, !49, !51, !52}
!39 = !{!"0x100\00IntLoc1\00193\000", !37, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc1] [line 193]
!40 = !{!"0x100\00IntLoc2\00194\000", !37, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc2] [line 194]
!41 = !{!"0x100\00IntLoc3\00195\000", !37, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc3] [line 195]
!42 = !{!"0x100\00CharLoc\00196\000", !37, !33, !27} ; [ DW_TAG_auto_variable ] [CharLoc] [line 196]
!43 = !{!"0x100\00CharIndex\00197\000", !37, !33, !27} ; [ DW_TAG_auto_variable ] [CharIndex] [line 197]
!44 = !{!"0x100\00EnumLoc\00198\000", !37, !33, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 198]
!45 = !{!"0x100\00String1Loc\00199\000", !37, !33, !25} ; [ DW_TAG_auto_variable ] [String1Loc] [line 199]
!46 = !{!"0x100\00String2Loc\00200\000", !37, !33, !25} ; [ DW_TAG_auto_variable ] [String2Loc] [line 200]
!47 = !{!"0x100\00i\00201\000", !37, !33, !48}    ; [ DW_TAG_auto_variable ] [i] [line 201]
!48 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!49 = !{!"0x100\00starttime\00204\000", !37, !33, !50} ; [ DW_TAG_auto_variable ] [starttime] [line 204]
!50 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!51 = !{!"0x100\00benchtime\00205\000", !37, !33, !50} ; [ DW_TAG_auto_variable ] [benchtime] [line 205]
!52 = !{!"0x100\00nulltime\00206\000", !37, !33, !50} ; [ DW_TAG_auto_variable ] [nulltime] [line 206]
!53 = !{!"0x2e\00Proc1\00Proc1\00\00318\000\001\000\000\000\001\00320", !1, !33, !54, null, i32 (%struct.Record*)* @Proc1, null, null, !56} ; [ DW_TAG_subprogram ] [line 318] [def] [scope 320] [Proc1]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{!23, !11}
!56 = !{!57}
!57 = !{!"0x101\00PtrParIn\0016777535\000", !53, !33, !11} ; [ DW_TAG_arg_variable ] [PtrParIn] [line 319]
!58 = !{!"0x2e\00Proc2\00Proc2\00\00342\000\001\000\000\000\001\00344", !1, !33, !59, null, i32 (i32*)* @Proc2, null, null, !62} ; [ DW_TAG_subprogram ] [line 342] [def] [scope 344] [Proc2]
!59 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !60, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = !{!23, !61}
!61 = !{!"0xf\00\000\0064\0064\000\000", null, null, !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from OneToFifty]
!62 = !{!63, !64, !65}
!63 = !{!"0x101\00IntParIO\0016777559\000", !58, !33, !61} ; [ DW_TAG_arg_variable ] [IntParIO] [line 343]
!64 = !{!"0x100\00IntLoc\00345\000", !58, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 345]
!65 = !{!"0x100\00EnumLoc\00346\000", !58, !33, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 346]
!66 = !{!"0x2e\00Proc3\00Proc3\00\00362\000\001\000\000\000\001\00364", !1, !33, !67, null, i32 (%struct.Record**)* @Proc3, null, null, !70} ; [ DW_TAG_subprogram ] [line 362] [def] [scope 364] [Proc3]
!67 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !68, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = !{!23, !69}
!69 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from RecordPtr]
!70 = !{!71}
!71 = !{!"0x101\00PtrParOut\0016777579\000", !66, !33, !69} ; [ DW_TAG_arg_variable ] [PtrParOut] [line 363]
!72 = !{!"0x2e\00Proc4\00Proc4\00\00372\000\001\000\000\000\001\00373", !1, !33, !34, null, i32 ()* @Proc4, null, null, !73} ; [ DW_TAG_subprogram ] [line 372] [def] [scope 373] [Proc4]
!73 = !{!74}
!74 = !{!"0x100\00BoolLoc\00374\000", !72, !33, !75} ; [ DW_TAG_auto_variable ] [BoolLoc] [line 374]
!75 = !{!"0x16\00boolean\00154\000\000\000\000", !1, null, !23} ; [ DW_TAG_typedef ] [boolean] [line 154, size 0, align 0, offset 0] [from int]
!76 = !{!"0x2e\00Proc5\00Proc5\00\00381\000\001\000\000\000\001\00382", !1, !33, !34, null, i32 ()* @Proc5, null, null, !36} ; [ DW_TAG_subprogram ] [line 381] [def] [scope 382] [Proc5]
!77 = !{!"0x2e\00Proc6\00Proc6\00\00389\000\001\000\000\000\001\00392", !1, !33, !78, null, i32 (i32, i32*)* @Proc6, null, null, !81} ; [ DW_TAG_subprogram ] [line 389] [def] [scope 392] [Proc6]
!78 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !79, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = !{!23, !19, !80}
!80 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from Enumeration]
!81 = !{!82, !83}
!82 = !{!"0x101\00EnumParIn\0016777606\000", !77, !33, !19} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 390]
!83 = !{!"0x101\00EnumParOut\0033554823\000", !77, !33, !80} ; [ DW_TAG_arg_variable ] [EnumParOut] [line 391]
!84 = !{!"0x2e\00Proc7\00Proc7\00\00408\000\001\000\000\000\001\00412", !1, !33, !85, null, i32 (i32, i32, i32*)* @Proc7, null, null, !87} ; [ DW_TAG_subprogram ] [line 408] [def] [scope 412] [Proc7]
!85 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !86, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = !{!23, !22, !22, !61}
!87 = !{!88, !89, !90, !91}
!88 = !{!"0x101\00IntParI1\0016777625\000", !84, !33, !22} ; [ DW_TAG_arg_variable ] [IntParI1] [line 409]
!89 = !{!"0x101\00IntParI2\0033554842\000", !84, !33, !22} ; [ DW_TAG_arg_variable ] [IntParI2] [line 410]
!90 = !{!"0x101\00IntParOut\0050332059\000", !84, !33, !61} ; [ DW_TAG_arg_variable ] [IntParOut] [line 411]
!91 = !{!"0x100\00IntLoc\00413\000", !84, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 413]
!92 = !{!"0x2e\00Proc8\00Proc8\00\00419\000\001\000\000\000\001\00424", !1, !33, !93, null, i32 (i32*, [51 x i32]*, i32, i32)* @Proc8, null, null, !100} ; [ DW_TAG_subprogram ] [line 419] [def] [scope 424] [Proc8]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{!23, !95, !96, !22, !22}
!95 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!96 = !{!"0xf\00\000\0064\0064\000\000", null, null, !97} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = !{!"0x1\00\000\001632\0032\000\000\000", null, null, !23, !98, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1632, align 32, offset 0] [from int]
!98 = !{!99}
!99 = !{!"0x21\000\0051"}                         ; [ DW_TAG_subrange_type ] [0, 50]
!100 = !{!101, !102, !103, !104, !105, !106}
!101 = !{!"0x101\00Array1Par\0016777636\000", !92, !33, !95} ; [ DW_TAG_arg_variable ] [Array1Par] [line 420]
!102 = !{!"0x101\00Array2Par\0033554853\000", !92, !33, !96} ; [ DW_TAG_arg_variable ] [Array2Par] [line 421]
!103 = !{!"0x101\00IntParI1\0050332070\000", !92, !33, !22} ; [ DW_TAG_arg_variable ] [IntParI1] [line 422]
!104 = !{!"0x101\00IntParI2\0067109287\000", !92, !33, !22} ; [ DW_TAG_arg_variable ] [IntParI2] [line 423]
!105 = !{!"0x100\00IntLoc\00425\000", !92, !33, !22} ; [ DW_TAG_auto_variable ] [IntLoc] [line 425]
!106 = !{!"0x100\00IntIndex\00426\000", !92, !33, !22} ; [ DW_TAG_auto_variable ] [IntIndex] [line 426]
!107 = !{!"0x2e\00Func1\00Func1\00\00439\000\001\000\000\000\001\00442", !1, !33, !108, null, i32 (i32, i32)* @Func1, null, null, !111} ; [ DW_TAG_subprogram ] [line 439] [def] [scope 442] [Func1]
!108 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !109, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = !{!19, !110, !110}
!110 = !{!"0x16\00CapitalLetter\00138\000\000\000\000", !1, null, !27} ; [ DW_TAG_typedef ] [CapitalLetter] [line 138, size 0, align 0, offset 0] [from char]
!111 = !{!112, !113, !114, !115}
!112 = !{!"0x101\00CharPar1\0016777656\000", !107, !33, !110} ; [ DW_TAG_arg_variable ] [CharPar1] [line 440]
!113 = !{!"0x101\00CharPar2\0033554873\000", !107, !33, !110} ; [ DW_TAG_arg_variable ] [CharPar2] [line 441]
!114 = !{!"0x100\00CharLoc1\00443\000", !107, !33, !110} ; [ DW_TAG_auto_variable ] [CharLoc1] [line 443]
!115 = !{!"0x100\00CharLoc2\00444\000", !107, !33, !110} ; [ DW_TAG_auto_variable ] [CharLoc2] [line 444]
!116 = !{!"0x2e\00Func2\00Func2\00\00454\000\001\000\000\000\001\00457", !1, !33, !117, null, i32 (i8*, i8*)* @Func2, null, null, !120} ; [ DW_TAG_subprogram ] [line 454] [def] [scope 457] [Func2]
!117 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !118, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = !{!75, !119, !119}
!119 = !{!"0xf\00\000\0064\0064\000\000", null, null, !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!120 = !{!121, !122, !123, !125, !126, !134}
!121 = !{!"0x101\00StrParI1\0016777671\000", !116, !33, !119} ; [ DW_TAG_arg_variable ] [StrParI1] [line 455]
!122 = !{!"0x101\00StrParI2\0033554888\000", !116, !33, !119} ; [ DW_TAG_arg_variable ] [StrParI2] [line 456]
!123 = !{!"0x100\00IntLoc\00458\000", !116, !33, !124} ; [ DW_TAG_auto_variable ] [IntLoc] [line 458]
!124 = !{!"0x16\00OneToThirty\00136\000\000\000\000", !1, null, !23} ; [ DW_TAG_typedef ] [OneToThirty] [line 136, size 0, align 0, offset 0] [from int]
!125 = !{!"0x100\00CharLoc\00459\000", !116, !33, !110} ; [ DW_TAG_auto_variable ] [CharLoc] [line 459]
!126 = !{!"0x100\00__s1_len\00474\000", !127, !33, !131} ; [ DW_TAG_auto_variable ] [__s1_len] [line 474]
!127 = !{!"0xb\00474\007\0028", !1, !128}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!128 = !{!"0xb\00474\007\0027", !1, !129}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!129 = !{!"0xb\00473\002\0026", !1, !130}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!130 = !{!"0xb\00470\006\0025", !1, !116}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!131 = !{!"0x16\00size_t\0062\000\000\000\000", !132, null, !133} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!132 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!133 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!134 = !{!"0x100\00__s2_len\00474\000", !127, !33, !131} ; [ DW_TAG_auto_variable ] [__s2_len] [line 474]
!135 = !{!"0x2e\00Func3\00Func3\00\00484\000\001\000\000\000\001\00486", !1, !33, !136, null, i32 (i32)* @Func3, null, null, !138} ; [ DW_TAG_subprogram ] [line 484] [def] [scope 486] [Func3]
!136 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !137, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!137 = !{!75, !19}
!138 = !{!139, !140}
!139 = !{!"0x101\00EnumParIn\0016777701\000", !135, !33, !19} ; [ DW_TAG_arg_variable ] [EnumParIn] [line 485]
!140 = !{!"0x100\00EnumLoc\00487\000", !135, !33, !19} ; [ DW_TAG_auto_variable ] [EnumLoc] [line 487]
!141 = !{!142, !146, !147, !148, !149, !150, !152, !156, !157}
!142 = !{!"0x34\00Version\00Version\00\00116\000\001", null, !33, !143, [4 x i8]* @Version, null} ; [ DW_TAG_variable ] [Version] [line 116] [def]
!143 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !27, !144, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!144 = !{!145}
!145 = !{!"0x21\000\004"}                         ; [ DW_TAG_subrange_type ] [0, 3]
!146 = !{!"0x34\00IntGlob\00IntGlob\00\00182\000\001", null, !33, !23, i32* @IntGlob, null} ; [ DW_TAG_variable ] [IntGlob] [line 182] [def]
!147 = !{!"0x34\00BoolGlob\00BoolGlob\00\00183\000\001", null, !33, !75, i32* @BoolGlob, null} ; [ DW_TAG_variable ] [BoolGlob] [line 183] [def]
!148 = !{!"0x34\00Char1Glob\00Char1Glob\00\00184\000\001", null, !33, !27, i8* @Char1Glob, null} ; [ DW_TAG_variable ] [Char1Glob] [line 184] [def]
!149 = !{!"0x34\00Char2Glob\00Char2Glob\00\00185\000\001", null, !33, !27, i8* @Char2Glob, null} ; [ DW_TAG_variable ] [Char2Glob] [line 185] [def]
!150 = !{!"0x34\00Array1Glob\00Array1Glob\00\00186\000\001", null, !33, !151, [51 x i32]* @Array1Glob, null} ; [ DW_TAG_variable ] [Array1Glob] [line 186] [def]
!151 = !{!"0x16\00Array1Dim\00140\000\000\000\000", !1, null, !97} ; [ DW_TAG_typedef ] [Array1Dim] [line 140, size 0, align 0, offset 0] [from ]
!152 = !{!"0x34\00Array2Glob\00Array2Glob\00\00187\000\001", null, !33, !153, [51 x [51 x i32]]* @Array2Glob, null} ; [ DW_TAG_variable ] [Array2Glob] [line 187] [def]
!153 = !{!"0x16\00Array2Dim\00141\000\000\000\000", !1, null, !154} ; [ DW_TAG_typedef ] [Array2Dim] [line 141, size 0, align 0, offset 0] [from ]
!154 = !{!"0x1\00\000\0083232\0032\000\000\000", null, null, !23, !155, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 83232, align 32, offset 0] [from int]
!155 = !{!99, !99}
!156 = !{!"0x34\00PtrGlb\00PtrGlb\00\00188\000\001", null, !33, !11, %struct.Record** @PtrGlb, null} ; [ DW_TAG_variable ] [PtrGlb] [line 188] [def]
!157 = !{!"0x34\00PtrGlbNext\00PtrGlbNext\00\00189\000\001", null, !33, !11, %struct.Record** @PtrGlbNext, null} ; [ DW_TAG_variable ] [PtrGlbNext] [line 189] [def]
!158 = !{i32 2, !"Dwarf Version", i32 4}
!159 = !{i32 2, !"Debug Info Version", i32 2}
!160 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!161 = !MDLocation(line: 175, column: 2, scope: !32)
!162 = !MDLocation(line: 176, column: 9, scope: !32)
!163 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!164 = !MDLocation(line: 199, column: 12, scope: !37)
!165 = !MDLocation(line: 200, column: 12, scope: !37)
!166 = !MDLocation(line: 208, column: 14, scope: !37)
!167 = !MDLocation(line: 201, column: 24, scope: !37)
!168 = !MDLocation(line: 210, column: 13, scope: !37)
!169 = !MDLocation(line: 234, column: 27, scope: !37)
!170 = !MDLocation(line: 234, column: 2, scope: !37)
!171 = !{!172, !172, i64 0}
!172 = !{!"any pointer", !173, i64 0}
!173 = !{!"omnipotent char", !174, i64 0}
!174 = !{!"Simple C/C++ TBAA"}
!175 = !MDLocation(line: 235, column: 23, scope: !37)
!176 = !MDLocation(line: 235, column: 2, scope: !37)
!177 = !MDLocation(line: 236, column: 20, scope: !37)
!178 = !MDLocation(line: 236, column: 2, scope: !37)
!179 = !{!180, !172, i64 0}
!180 = !{!"Record", !172, i64 0, !173, i64 8, !173, i64 12, !181, i64 16, !173, i64 20}
!181 = !{!"int", !173, i64 0}
!182 = !MDLocation(line: 237, column: 2, scope: !37)
!183 = !{!180, !173, i64 8}
!184 = !MDLocation(line: 238, column: 2, scope: !37)
!185 = !{!180, !173, i64 12}
!186 = !MDLocation(line: 239, column: 2, scope: !37)
!187 = !{!180, !181, i64 16}
!188 = !MDLocation(line: 240, column: 9, scope: !37)
!189 = !MDLocation(line: 240, column: 2, scope: !37)
!190 = !MDLocation(line: 244, column: 2, scope: !37)
!191 = !{!181, !181, i64 0}
!192 = !MDLocation(line: 250, column: 14, scope: !37)
!193 = !MDLocation(line: 258, column: 2, scope: !194)
!194 = !{!"0xb\00258\002\002", !1, !37}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!195 = !MDLocation(line: 260, column: 3, scope: !196)
!196 = !{!"0xb\00259\002\004", !1, !197}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!197 = !{!"0xb\00258\002\003", !1, !194}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!198 = !MDLocation(line: 261, column: 3, scope: !196)
!199 = !MDLocation(line: 193, column: 14, scope: !37)
!200 = !MDLocation(line: 194, column: 18, scope: !37)
!201 = !MDLocation(line: 198, column: 16, scope: !37)
!202 = !MDLocation(line: 265, column: 3, scope: !196)
!203 = !{!173, !173, i64 0}
!204 = !MDLocation(line: 266, column: 16, scope: !196)
!205 = !MDLocation(line: 266, column: 14, scope: !196)
!206 = !MDLocation(line: 266, column: 3, scope: !196)
!207 = !MDLocation(line: 195, column: 14, scope: !37)
!208 = !MDLocation(line: 269, column: 4, scope: !209)
!209 = !{!"0xb\00268\003\005", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!210 = !MDLocation(line: 270, column: 4, scope: !209)
!211 = !MDLocation(line: 271, column: 4, scope: !209)
!212 = !MDLocation(line: 273, column: 42, scope: !196)
!213 = !MDLocation(line: 273, column: 3, scope: !196)
!214 = !MDLocation(line: 274, column: 9, scope: !196)
!215 = !MDLocation(line: 274, column: 3, scope: !196)
!216 = !MDLocation(line: 197, column: 12, scope: !37)
!217 = !MDLocation(line: 275, column: 38, scope: !218)
!218 = !{!"0xb\00275\003\007", !1, !219}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!219 = !{!"0xb\00275\003\006", !1, !196}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!220 = !MDLocation(line: 275, column: 25, scope: !218)
!221 = !MDLocation(line: 275, column: 3, scope: !219)
!222 = !MDLocation(line: 275, column: 25, scope: !223)
!223 = !{!"0xb\002", !1, !224}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!224 = !{!"0xb\001", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!225 = !MDLocation(line: 276, column: 8, scope: !226)
!226 = !{!"0xb\00276\008\008", !1, !218}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!227 = !MDLocation(line: 276, column: 19, scope: !226)
!228 = !MDLocation(line: 276, column: 8, scope: !218)
!229 = !MDLocation(line: 277, column: 5, scope: !226)
!230 = !MDLocation(line: 275, column: 49, scope: !218)
!231 = !MDLocation(line: 278, column: 23, scope: !196)
!232 = !MDLocation(line: 278, column: 13, scope: !196)
!233 = !MDLocation(line: 278, column: 3, scope: !196)
!234 = !MDLocation(line: 281, column: 3, scope: !196)
!235 = !MDLocation(line: 258, column: 25, scope: !197)
!236 = !MDLocation(line: 316, column: 1, scope: !37)
!237 = !MDLocation(line: 319, column: 15, scope: !53)
!238 = !MDLocation(line: 324, column: 2, scope: !53)
!239 = !MDLocation(line: 325, column: 2, scope: !53)
!240 = !MDLocation(line: 326, column: 23, scope: !53)
!241 = !MDLocation(line: 326, column: 2, scope: !53)
!242 = !MDLocation(line: 340, column: 1, scope: !53)
!243 = !MDLocation(line: 343, column: 13, scope: !58)
!244 = !MDLocation(line: 351, column: 7, scope: !245)
!245 = !{!"0xb\00351\007\0012", !1, !246}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!246 = !{!"0xb\00350\002\0011", !1, !247}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!247 = !{!"0xb\00349\002\0010", !1, !248}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!248 = !{!"0xb\00349\002\009", !1, !58}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!249 = !MDLocation(line: 351, column: 7, scope: !246)
!250 = !MDLocation(line: 348, column: 11, scope: !58)
!251 = !MDLocation(line: 353, column: 4, scope: !252)
!252 = !{!"0xb\00352\003\0013", !1, !245}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!253 = !MDLocation(line: 345, column: 18, scope: !58)
!254 = !MDLocation(line: 354, column: 25, scope: !252)
!255 = !MDLocation(line: 354, column: 16, scope: !252)
!256 = !MDLocation(line: 354, column: 4, scope: !252)
!257 = !MDLocation(line: 346, column: 19, scope: !58)
!258 = !MDLocation(line: 356, column: 3, scope: !252)
!259 = !MDLocation(line: 360, column: 1, scope: !58)
!260 = !MDLocation(line: 363, column: 12, scope: !66)
!261 = !MDLocation(line: 365, column: 6, scope: !262)
!262 = !{!"0xb\00365\006\0015", !1, !66}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!263 = !MDLocation(line: 365, column: 6, scope: !66)
!264 = !MDLocation(line: 366, column: 16, scope: !262)
!265 = !MDLocation(line: 366, column: 3, scope: !262)
!266 = !MDLocation(line: 368, column: 3, scope: !262)
!267 = !MDLocation(line: 369, column: 12, scope: !66)
!268 = !MDLocation(line: 369, column: 22, scope: !66)
!269 = !MDLocation(line: 369, column: 21, scope: !66)
!270 = !MDLocation(line: 369, column: 2, scope: !66)
!271 = !MDLocation(line: 370, column: 1, scope: !66)
!272 = !MDLocation(line: 378, column: 2, scope: !72)
!273 = !MDLocation(line: 379, column: 1, scope: !72)
!274 = !MDLocation(line: 383, column: 2, scope: !76)
!275 = !MDLocation(line: 384, column: 2, scope: !76)
!276 = !MDLocation(line: 385, column: 1, scope: !76)
!277 = !MDLocation(line: 390, column: 17, scope: !77)
!278 = !MDLocation(line: 391, column: 18, scope: !77)
!279 = !MDLocation(line: 394, column: 8, scope: !280)
!280 = !{!"0xb\00394\006\0016", !1, !77}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!281 = !MDLocation(line: 394, column: 6, scope: !77)
!282 = !MDLocation(line: 395, column: 3, scope: !280)
!283 = !MDLocation(line: 396, column: 2, scope: !77)
!284 = !MDLocation(line: 398, column: 15, scope: !285)
!285 = !{!"0xb\00397\002\0017", !1, !77}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!286 = !MDLocation(line: 398, column: 37, scope: !285)
!287 = !MDLocation(line: 399, column: 19, scope: !288)
!288 = !{!"0xb\00399\0019\0018", !1, !285}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!289 = !MDLocation(line: 399, column: 19, scope: !285)
!290 = !MDLocation(line: 399, column: 34, scope: !288)
!291 = !MDLocation(line: 400, column: 9, scope: !288)
!292 = !MDLocation(line: 402, column: 15, scope: !285)
!293 = !MDLocation(line: 402, column: 37, scope: !285)
!294 = !MDLocation(line: 404, column: 15, scope: !285)
!295 = !MDLocation(line: 405, column: 2, scope: !285)
!296 = !MDLocation(line: 406, column: 1, scope: !77)
!297 = !MDLocation(line: 409, column: 12, scope: !84)
!298 = !MDLocation(line: 410, column: 12, scope: !84)
!299 = !MDLocation(line: 411, column: 13, scope: !84)
!300 = !MDLocation(line: 415, column: 11, scope: !84)
!301 = !MDLocation(line: 413, column: 17, scope: !84)
!302 = !MDLocation(line: 416, column: 15, scope: !84)
!303 = !MDLocation(line: 416, column: 2, scope: !84)
!304 = !MDLocation(line: 417, column: 1, scope: !84)
!305 = !MDLocation(line: 420, column: 11, scope: !92)
!306 = !MDLocation(line: 421, column: 11, scope: !92)
!307 = !MDLocation(line: 422, column: 12, scope: !92)
!308 = !MDLocation(line: 423, column: 12, scope: !92)
!309 = !MDLocation(line: 428, column: 11, scope: !92)
!310 = !MDLocation(line: 425, column: 17, scope: !92)
!311 = !MDLocation(line: 429, column: 2, scope: !92)
!312 = !MDLocation(line: 430, column: 12, scope: !92)
!313 = !MDLocation(line: 430, column: 2, scope: !92)
!314 = !MDLocation(line: 431, column: 12, scope: !92)
!315 = !MDLocation(line: 431, column: 2, scope: !92)
!316 = !MDLocation(line: 426, column: 17, scope: !92)
!317 = !MDLocation(line: 432, column: 2, scope: !318)
!318 = !{!"0xb\00432\002\0019", !1, !92}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!319 = !MDLocation(line: 433, column: 3, scope: !320)
!320 = !{!"0xb\00432\002\0020", !1, !318}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!321 = !MDLocation(line: 432, column: 26, scope: !320)
!322 = !MDLocation(line: 434, column: 22, scope: !92)
!323 = !MDLocation(line: 434, column: 2, scope: !92)
!324 = !MDLocation(line: 435, column: 33, scope: !92)
!325 = !MDLocation(line: 435, column: 12, scope: !92)
!326 = !MDLocation(line: 435, column: 2, scope: !92)
!327 = !MDLocation(line: 436, column: 2, scope: !92)
!328 = !MDLocation(line: 437, column: 1, scope: !92)
!329 = !MDLocation(line: 448, column: 6, scope: !330)
!330 = !{!"0xb\00448\006\0021", !1, !107}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!331 = !MDLocation(line: 448, column: 18, scope: !330)
!332 = !MDLocation(line: 451, column: 3, scope: !330)
!333 = !MDLocation(line: 452, column: 1, scope: !107)
!334 = !MDLocation(line: 455, column: 10, scope: !116)
!335 = !MDLocation(line: 456, column: 10, scope: !116)
!336 = !MDLocation(line: 458, column: 19, scope: !116)
!337 = !MDLocation(line: 462, column: 2, scope: !116)
!338 = !MDLocation(line: 463, column: 13, scope: !339)
!339 = !{!"0xb\00463\007\0022", !1, !116}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!340 = !MDLocation(line: 463, column: 40, scope: !339)
!341 = !MDLocation(line: 463, column: 31, scope: !339)
!342 = !MDLocation(line: 463, column: 7, scope: !339)
!343 = !MDLocation(line: 459, column: 20, scope: !116)
!344 = !MDLocation(line: 462, column: 9, scope: !345)
!345 = !{!"0xb\002", !1, !346}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!346 = !{!"0xb\001", !1, !116}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!347 = !MDLocation(line: 474, column: 7, scope: !127)
!348 = !MDLocation(line: 474, column: 7, scope: !128)
!349 = !MDLocation(line: 477, column: 4, scope: !350)
!350 = !{!"0xb\00475\003\0029", !1, !128}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!351 = !MDLocation(line: 482, column: 1, scope: !116)
!352 = !MDLocation(line: 485, column: 17, scope: !135)
!353 = !MDLocation(line: 487, column: 18, scope: !135)
!354 = !MDLocation(line: 490, column: 6, scope: !355)
!355 = !{!"0xb\00490\006\0030", !1, !135}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!356 = !MDLocation(line: 490, column: 25, scope: !357)
!357 = !{!"0xb\001", !1, !355}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dry.c]
!358 = !MDLocation(line: 492, column: 1, scope: !135)
