; ModuleID = 'huffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@.str5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal unnamed_addr global i64 1325, align 8

; Function Attrs: nounwind uwtable
define noalias i8* @generate_test_data(i64 %n) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !23, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !24, metadata !131), !dbg !133
  %call = tail call noalias i8* @malloc(i64 %n) #3, !dbg !134
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !26, metadata !131), !dbg !135
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !27, metadata !131), !dbg !136
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !131), !dbg !137
  %cmp9 = icmp eq i64 %n, 0, !dbg !138
  br i1 %cmp9, label %for.end, label %for.body.lr.ph, !dbg !141

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %n, -1, !dbg !141
  br label %for.body, !dbg !141

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ptr.010 = phi i8* [ %call, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %1 = load i64* @seed, align 8, !dbg !142, !tbaa !145
  %xor.i = xor i64 %1, 123459876, !dbg !142
  %div.i = sdiv i64 %xor.i, 127773, !dbg !149
  tail call void @llvm.dbg.value(metadata i64 %div.i, i64 0, metadata !150, metadata !131), !dbg !151
  %2 = mul i64 %div.i, -127773, !dbg !152
  %sub6.i7 = add i64 %xor.i, %2, !dbg !152
  %mul1.i = mul nsw i64 %sub6.i7, 16807, !dbg !153
  %3 = mul i64 %div.i, -2836, !dbg !153
  %sub37.i8 = add i64 %mul1.i, %3, !dbg !153
  %cmp.i = icmp slt i64 %sub37.i8, 0, !dbg !154
  %add.i = add nsw i64 %sub37.i8, 2147483647, !dbg !156
  %add.sub3.i = select i1 %cmp.i, i64 %add.i, i64 %sub37.i8, !dbg !157
  %rem.i = srem i64 %add.sub3.i, 32, !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %rem.i, i64 0, metadata !159, metadata !131), !dbg !160
  %xor4.i = xor i64 %add.sub3.i, 123459876, !dbg !161
  store i64 %xor4.i, i64* @seed, align 8, !dbg !161, !tbaa !145
  %arrayidx = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %rem.i, !dbg !162
  %4 = load i8* %arrayidx, align 1, !dbg !162, !tbaa !163
  store i8 %4, i8* %ptr.010, align 1, !dbg !164, !tbaa !163
  %incdec.ptr = getelementptr inbounds i8* %ptr.010, i64 1, !dbg !165
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !27, metadata !131), !dbg !136
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !141
  %exitcond = icmp eq i64 %indvars.iv, %0, !dbg !141
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !dbg !141

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret i8* %call, !dbg !166
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @compdecomp(i8* nocapture %data, i64 %data_len) #0 {
entry:
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !34, metadata !131), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 %data_len, i64 0, metadata !35, metadata !131), !dbg !168
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !45, metadata !131), !dbg !169
  %add = add i64 %data_len, 1, !dbg !170
  %call = tail call noalias i8* @malloc(i64 %add) #3, !dbg !171
  tail call void @llvm.dbg.value(metadata i8* %call, i64 0, metadata !46, metadata !131), !dbg !172
  %0 = bitcast [512 x i64]* %freq to i8*, !dbg !173
  call void @llvm.lifetime.start(i64 4096, i8* %0) #3, !dbg !173
  tail call void @llvm.dbg.declare(metadata [512 x i64]* %freq, metadata !47, metadata !131), !dbg !174
  %1 = bitcast [256 x i64]* %heap to i8*, !dbg !175
  call void @llvm.lifetime.start(i64 2048, i8* %1) #3, !dbg !175
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %heap, metadata !51, metadata !131), !dbg !176
  %2 = bitcast [512 x i32]* %link to i8*, !dbg !177
  call void @llvm.lifetime.start(i64 2048, i8* %2) #3, !dbg !177
  tail call void @llvm.dbg.declare(metadata [512 x i32]* %link, metadata !55, metadata !131), !dbg !178
  %3 = bitcast [256 x i64]* %code to i8*, !dbg !179
  call void @llvm.lifetime.start(i64 2048, i8* %3) #3, !dbg !179
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %code, metadata !57, metadata !131), !dbg !180
  %4 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 0, !dbg !181
  call void @llvm.lifetime.start(i64 256, i8* %4) #3, !dbg !181
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %clen, metadata !59, metadata !131), !dbg !182
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %add, i32 1, i1 false), !dbg !183
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 4096, i32 16, i1 false), !dbg !184
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 2048, i32 16, i1 false), !dbg !185
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 2048, i32 16, i1 false), !dbg !186
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 2048, i32 16, i1 false), !dbg !187
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 256, i32 16, i1 false), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !189
  %cmp533 = icmp eq i64 %data_len, 0, !dbg !190
  br i1 %cmp533, label %for.body6.preheader, label %for.body.preheader, !dbg !193

for.body.preheader:                               ; preds = %entry
  %xtraiter557 = and i64 %data_len, 1
  %lcmp.mod558 = icmp ne i64 %xtraiter557, 0
  %lcmp.overflow559 = icmp eq i64 %data_len, 0
  %lcmp.or560 = or i1 %lcmp.overflow559, %lcmp.mod558
  br i1 %lcmp.or560, label %for.body.prol, label %for.body.preheader.split

for.body.prol:                                    ; preds = %for.body.prol, %for.body.preheader
  %i.0535.prol = phi i64 [ %inc2.prol, %for.body.prol ], [ 0, %for.body.preheader ]
  %dptr.0534.prol = phi i8* [ %incdec.ptr.prol, %for.body.prol ], [ %data, %for.body.preheader ]
  %prol.iter561 = phi i64 [ %xtraiter557, %for.body.preheader ], [ %prol.iter561.sub, %for.body.prol ]
  %5 = load i8* %dptr.0534.prol, align 1, !dbg !194, !tbaa !163
  %conv.prol = zext i8 %5 to i64, !dbg !196
  %arrayidx.prol = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv.prol, !dbg !197
  %6 = load i64* %arrayidx.prol, align 8, !dbg !197, !tbaa !145
  %inc.prol = add i64 %6, 1, !dbg !197
  store i64 %inc.prol, i64* %arrayidx.prol, align 8, !dbg !197, !tbaa !145
  %incdec.ptr.prol = getelementptr inbounds i8* %dptr.0534.prol, i64 1, !dbg !198
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr.prol, i64 0, metadata !45, metadata !131), !dbg !169
  %inc2.prol = add nuw i64 %i.0535.prol, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %inc2.prol, i64 0, metadata !36, metadata !131), !dbg !189
  %exitcond545.prol = icmp eq i64 %inc2.prol, %data_len, !dbg !193
  %prol.iter561.sub = sub i64 %prol.iter561, 1, !dbg !193
  %prol.iter561.cmp = icmp ne i64 %prol.iter561.sub, 0, !dbg !193
  br i1 %prol.iter561.cmp, label %for.body.prol, label %for.body.preheader.split, !llvm.loop !200

for.body.preheader.split:                         ; preds = %for.body.prol, %for.body.preheader
  %i.0535.unr = phi i64 [ 0, %for.body.preheader ], [ %inc2.prol, %for.body.prol ]
  %dptr.0534.unr = phi i8* [ %data, %for.body.preheader ], [ %incdec.ptr.prol, %for.body.prol ]
  %7 = icmp ult i64 %data_len, 2
  br i1 %7, label %for.body6.preheader.loopexit, label %for.body.preheader.split.split

for.body.preheader.split.split:                   ; preds = %for.body.preheader.split
  br label %for.body, !dbg !194

for.body6.preheader.loopexit.unr-lcssa:           ; preds = %for.body
  br label %for.body6.preheader.loopexit

for.body6.preheader.loopexit:                     ; preds = %for.body.preheader.split, %for.body6.preheader.loopexit.unr-lcssa
  br label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.preheader.loopexit, %entry
  br label %for.body6, !dbg !202

for.body:                                         ; preds = %for.body, %for.body.preheader.split.split
  %i.0535 = phi i64 [ %i.0535.unr, %for.body.preheader.split.split ], [ %inc2.1, %for.body ]
  %dptr.0534 = phi i8* [ %dptr.0534.unr, %for.body.preheader.split.split ], [ %incdec.ptr.1, %for.body ]
  %8 = load i8* %dptr.0534, align 1, !dbg !194, !tbaa !163
  %conv = zext i8 %8 to i64, !dbg !196
  %arrayidx = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv, !dbg !197
  %9 = load i64* %arrayidx, align 8, !dbg !197, !tbaa !145
  %inc = add i64 %9, 1, !dbg !197
  store i64 %inc, i64* %arrayidx, align 8, !dbg !197, !tbaa !145
  %incdec.ptr = getelementptr inbounds i8* %dptr.0534, i64 1, !dbg !198
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !169
  %inc2 = add nuw i64 %i.0535, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %inc2, i64 0, metadata !36, metadata !131), !dbg !189
  %10 = load i8* %incdec.ptr, align 1, !dbg !194, !tbaa !163
  %conv.1 = zext i8 %10 to i64, !dbg !196
  %arrayidx.1 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv.1, !dbg !197
  %11 = load i64* %arrayidx.1, align 8, !dbg !197, !tbaa !145
  %inc.1 = add i64 %11, 1, !dbg !197
  store i64 %inc.1, i64* %arrayidx.1, align 8, !dbg !197, !tbaa !145
  %incdec.ptr.1 = getelementptr inbounds i8* %incdec.ptr, i64 1, !dbg !198
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr, i64 0, metadata !45, metadata !131), !dbg !169
  %inc2.1 = add nuw i64 %inc2, 1, !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %inc2, i64 0, metadata !36, metadata !131), !dbg !189
  %exitcond545.1 = icmp eq i64 %inc2.1, %data_len, !dbg !193
  br i1 %exitcond545.1, label %for.body6.preheader.loopexit.unr-lcssa, label %for.body, !dbg !193

for.cond13.preheader:                             ; preds = %for.inc10.1
  %n.1.lcssa = phi i64 [ %n.1.1, %for.inc10.1 ]
  %cmp14529 = icmp eq i64 %n.1.lcssa, 0, !dbg !207
  br i1 %cmp14529, label %while.end, label %for.body16.lr.ph, !dbg !212

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  %conv18 = trunc i64 %n.1.lcssa to i32, !dbg !213
  %div.i = sdiv i32 %conv18, 2, !dbg !214
  br label %for.body16, !dbg !212

for.body6:                                        ; preds = %for.inc10.1, %for.body6.preheader
  %i.1532 = phi i64 [ 0, %for.body6.preheader ], [ %inc11.1, %for.inc10.1 ]
  %n.0531 = phi i64 [ 0, %for.body6.preheader ], [ %n.1.1, %for.inc10.1 ]
  %arrayidx7 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %i.1532, !dbg !202
  %12 = load i64* %arrayidx7, align 8, !dbg !202, !tbaa !145
  %tobool = icmp eq i64 %12, 0, !dbg !216
  br i1 %tobool, label %for.inc10, label %if.then, !dbg !216

if.then:                                          ; preds = %for.body6
  %arrayidx8 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.0531, !dbg !217
  store i64 %i.1532, i64* %arrayidx8, align 8, !dbg !217, !tbaa !145
  %inc9 = add i64 %n.0531, 1, !dbg !219
  tail call void @llvm.dbg.value(metadata i64 %inc9, i64 0, metadata !38, metadata !131), !dbg !220
  br label %for.inc10, !dbg !221

for.inc10:                                        ; preds = %for.body6, %if.then
  %n.1 = phi i64 [ %inc9, %if.then ], [ %n.0531, %for.body6 ]
  %inc11 = add nuw nsw i64 %i.1532, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !36, metadata !131), !dbg !189
  %arrayidx7.1 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %inc11, !dbg !202
  %13 = load i64* %arrayidx7.1, align 8, !dbg !202, !tbaa !145
  %tobool.1 = icmp eq i64 %13, 0, !dbg !216
  br i1 %tobool.1, label %for.inc10.1, label %if.then.1, !dbg !216

while.cond.preheader:                             ; preds = %heap_adjust.exit
  %cmp22526 = icmp ugt i64 %n.1.lcssa, 1, !dbg !223
  br i1 %cmp22526, label %while.body.lr.ph, label %while.end, !dbg !226

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  %arrayidx25 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 0, !dbg !227
  br label %while.body, !dbg !226

for.body16:                                       ; preds = %for.body16.lr.ph, %heap_adjust.exit
  %i.2530 = phi i64 [ %n.1.lcssa, %for.body16.lr.ph ], [ %dec, %heap_adjust.exit ]
  %conv19 = trunc i64 %i.2530 to i32, !dbg !229
  tail call void @llvm.dbg.value(metadata i32 %conv18, i64 0, metadata !230, metadata !131), !dbg !231
  tail call void @llvm.dbg.value(metadata i32 %conv19, i64 0, metadata !232, metadata !131), !dbg !233
  %sext = shl i64 %i.2530, 32, !dbg !234
  %idxprom.i = ashr exact i64 %sext, 32, !dbg !234
  %incdec.ptr.sum.i = add nsw i64 %idxprom.i, -1, !dbg !234
  %arrayidx.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum.i, !dbg !234
  %14 = load i64* %arrayidx.i, align 8, !dbg !234, !tbaa !145
  %cmp59.i = icmp slt i32 %div.i, %conv19, !dbg !235
  %sext.pre.i = shl i64 %14, 32, !dbg !236
  %conv26.pre.i = ashr exact i64 %sext.pre.i, 32, !dbg !236
  br i1 %cmp59.i, label %heap_adjust.exit, label %while.body.lr.ph.i, !dbg !237

while.body.lr.ph.i:                               ; preds = %for.body16
  %arrayidx14.i = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv26.pre.i, !dbg !238
  %15 = load i64* %arrayidx14.i, align 8, !dbg !238, !tbaa !145
  br label %while.body.i, !dbg !237

while.body.i:                                     ; preds = %if.end21.i, %while.body.lr.ph.i
  %k.addr.060.i = phi i32 [ %conv19, %while.body.lr.ph.i ], [ %j.0.i, %if.end21.i ], !dbg !215
  %add.i = shl nsw i32 %k.addr.060.i, 1, !dbg !241
  tail call void @llvm.dbg.value(metadata i32 %add.i, i64 0, metadata !242, metadata !131), !dbg !243
  %cmp2.i = icmp slt i32 %add.i, %conv18, !dbg !244
  br i1 %cmp2.i, label %land.lhs.true.i, label %if.end.i, !dbg !246

land.lhs.true.i:                                  ; preds = %while.body.i
  %idxprom4.i = sext i32 %add.i to i64, !dbg !247
  %incdec.ptr.sum56.i = add nsw i64 %idxprom4.i, -1, !dbg !247
  %arrayidx5.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum56.i, !dbg !247
  %16 = load i64* %arrayidx5.i, align 8, !dbg !247, !tbaa !145
  %arrayidx6.i = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %16, !dbg !248
  %17 = load i64* %arrayidx6.i, align 8, !dbg !248, !tbaa !145
  %add757.i = or i32 %add.i, 1, !dbg !249
  %idxprom8.i = sext i32 %add757.i to i64, !dbg !250
  %incdec.ptr.sum58.i = add nsw i64 %idxprom8.i, -1, !dbg !250
  %arrayidx9.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum58.i, !dbg !250
  %18 = load i64* %arrayidx9.i, align 16, !dbg !250, !tbaa !145
  %arrayidx10.i = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %18, !dbg !251
  %19 = load i64* %arrayidx10.i, align 8, !dbg !251, !tbaa !145
  %cmp11.i = icmp ugt i64 %17, %19, !dbg !248
  tail call void @llvm.dbg.value(metadata i32 %add757.i, i64 0, metadata !242, metadata !131), !dbg !243
  %add757.add.i = select i1 %cmp11.i, i32 %add757.i, i32 %add.i, !dbg !246
  br label %if.end.i, !dbg !246

if.end.i:                                         ; preds = %land.lhs.true.i, %while.body.i
  %j.0.i = phi i32 [ %add.i, %while.body.i ], [ %add757.add.i, %land.lhs.true.i ], !dbg !215
  %idxprom15.i = sext i32 %j.0.i to i64, !dbg !252
  %incdec.ptr.sum54.i = add nsw i64 %idxprom15.i, -1, !dbg !252
  %arrayidx16.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum54.i, !dbg !252
  %20 = load i64* %arrayidx16.i, align 8, !dbg !252, !tbaa !145
  %arrayidx17.i = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %20, !dbg !253
  %21 = load i64* %arrayidx17.i, align 8, !dbg !253, !tbaa !145
  %cmp18.i = icmp ult i64 %15, %21, !dbg !238
  br i1 %cmp18.i, label %heap_adjust.exit.loopexit, label %if.end21.i, !dbg !254

if.end21.i:                                       ; preds = %if.end.i
  %idxprom24.i = sext i32 %k.addr.060.i to i64, !dbg !255
  %incdec.ptr.sum55.i = add nsw i64 %idxprom24.i, -1, !dbg !255
  %arrayidx25.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum55.i, !dbg !255
  store i64 %20, i64* %arrayidx25.i, align 8, !dbg !255, !tbaa !145
  tail call void @llvm.dbg.value(metadata i32 %j.0.i, i64 0, metadata !232, metadata !131), !dbg !233
  %cmp.i = icmp sgt i32 %j.0.i, %div.i, !dbg !235
  br i1 %cmp.i, label %heap_adjust.exit.loopexit, label %while.body.i, !dbg !237

heap_adjust.exit.loopexit:                        ; preds = %if.end21.i, %if.end.i
  %k.addr.0.lcssa.i.ph = phi i32 [ %k.addr.060.i, %if.end.i ], [ %j.0.i, %if.end21.i ]
  br label %heap_adjust.exit

heap_adjust.exit:                                 ; preds = %heap_adjust.exit.loopexit, %for.body16
  %k.addr.0.lcssa.i = phi i32 [ %conv19, %for.body16 ], [ %k.addr.0.lcssa.i.ph, %heap_adjust.exit.loopexit ], !dbg !215
  %idxprom27.i = sext i32 %k.addr.0.lcssa.i to i64, !dbg !256
  %incdec.ptr.sum52.i = add nsw i64 %idxprom27.i, -1, !dbg !256
  %arrayidx28.i = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum52.i, !dbg !256
  store i64 %conv26.pre.i, i64* %arrayidx28.i, align 8, !dbg !256, !tbaa !145
  %dec = add i64 %i.2530, -1, !dbg !257
  tail call void @llvm.dbg.value(metadata i64 %dec, i64 0, metadata !36, metadata !131), !dbg !189
  %cmp14 = icmp eq i64 %dec, 0, !dbg !207
  br i1 %cmp14, label %while.cond.preheader, label %for.body16, !dbg !212

while.body:                                       ; preds = %while.body.lr.ph, %heap_adjust.exit423
  %n.2527 = phi i64 [ %n.1.lcssa, %while.body.lr.ph ], [ %dec24, %heap_adjust.exit423 ]
  %dec24 = add i64 %n.2527, -1, !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %dec24, i64 0, metadata !38, metadata !131), !dbg !220
  %22 = load i64* %arrayidx25, align 16, !dbg !227, !tbaa !145
  %arrayidx26 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %dec24, !dbg !259
  %23 = load i64* %arrayidx26, align 8, !dbg !259, !tbaa !145
  store i64 %23, i64* %arrayidx25, align 16, !dbg !260, !tbaa !145
  %conv30 = trunc i64 %dec24 to i32, !dbg !261
  tail call void @llvm.dbg.value(metadata i64* %arrayidx25, i64 0, metadata !262, metadata !131), !dbg !264
  tail call void @llvm.dbg.value(metadata i32 %conv30, i64 0, metadata !265, metadata !131), !dbg !266
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !267, metadata !131), !dbg !268
  %div.i424 = sdiv i32 %conv30, 2, !dbg !269
  %cmp59.i425 = icmp slt i32 %conv30, 2, !dbg !270
  %sext.pre.i426 = shl i64 %23, 32, !dbg !271
  %conv26.pre.i427 = ashr exact i64 %sext.pre.i426, 32, !dbg !271
  br i1 %cmp59.i425, label %heap_adjust.exit462, label %while.body.lr.ph.i429, !dbg !272

while.body.lr.ph.i429:                            ; preds = %while.body
  %arrayidx14.i428 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv26.pre.i427, !dbg !273
  %24 = load i64* %arrayidx14.i428, align 8, !dbg !273, !tbaa !145
  br label %while.body.i433, !dbg !272

while.body.i433:                                  ; preds = %if.end21.i457, %while.body.lr.ph.i429
  %k.addr.060.i430 = phi i32 [ 1, %while.body.lr.ph.i429 ], [ %j.0.i446, %if.end21.i457 ], !dbg !263
  %add.i431 = shl nsw i32 %k.addr.060.i430, 1, !dbg !274
  tail call void @llvm.dbg.value(metadata i32 %add.i431, i64 0, metadata !275, metadata !131), !dbg !276
  %cmp2.i432 = icmp slt i32 %add.i431, %conv30, !dbg !277
  br i1 %cmp2.i432, label %land.lhs.true.i445, label %if.end.i452, !dbg !278

land.lhs.true.i445:                               ; preds = %while.body.i433
  %idxprom4.i434 = sext i32 %add.i431 to i64, !dbg !279
  %incdec.ptr.sum56.i435 = add nsw i64 %idxprom4.i434, -1, !dbg !279
  %arrayidx5.i436 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum56.i435, !dbg !279
  %25 = load i64* %arrayidx5.i436, align 8, !dbg !279, !tbaa !145
  %arrayidx6.i437 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %25, !dbg !280
  %26 = load i64* %arrayidx6.i437, align 8, !dbg !280, !tbaa !145
  %add757.i438 = or i32 %add.i431, 1, !dbg !281
  %idxprom8.i439 = sext i32 %add757.i438 to i64, !dbg !282
  %incdec.ptr.sum58.i440 = add nsw i64 %idxprom8.i439, -1, !dbg !282
  %arrayidx9.i441 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum58.i440, !dbg !282
  %27 = load i64* %arrayidx9.i441, align 16, !dbg !282, !tbaa !145
  %arrayidx10.i442 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %27, !dbg !283
  %28 = load i64* %arrayidx10.i442, align 8, !dbg !283, !tbaa !145
  %cmp11.i443 = icmp ugt i64 %26, %28, !dbg !280
  tail call void @llvm.dbg.value(metadata i32 %add757.i438, i64 0, metadata !275, metadata !131), !dbg !276
  %add757.add.i444 = select i1 %cmp11.i443, i32 %add757.i438, i32 %add.i431, !dbg !278
  br label %if.end.i452, !dbg !278

if.end.i452:                                      ; preds = %land.lhs.true.i445, %while.body.i433
  %j.0.i446 = phi i32 [ %add.i431, %while.body.i433 ], [ %add757.add.i444, %land.lhs.true.i445 ], !dbg !263
  %idxprom15.i447 = sext i32 %j.0.i446 to i64, !dbg !284
  %incdec.ptr.sum54.i448 = add nsw i64 %idxprom15.i447, -1, !dbg !284
  %arrayidx16.i449 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum54.i448, !dbg !284
  %29 = load i64* %arrayidx16.i449, align 8, !dbg !284, !tbaa !145
  %arrayidx17.i450 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %29, !dbg !285
  %30 = load i64* %arrayidx17.i450, align 8, !dbg !285, !tbaa !145
  %cmp18.i451 = icmp ult i64 %24, %30, !dbg !273
  br i1 %cmp18.i451, label %heap_adjust.exit462.loopexit, label %if.end21.i457, !dbg !286

if.end21.i457:                                    ; preds = %if.end.i452
  %idxprom24.i453 = sext i32 %k.addr.060.i430 to i64, !dbg !287
  %incdec.ptr.sum55.i454 = add nsw i64 %idxprom24.i453, -1, !dbg !287
  %arrayidx25.i455 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum55.i454, !dbg !287
  store i64 %29, i64* %arrayidx25.i455, align 8, !dbg !287, !tbaa !145
  tail call void @llvm.dbg.value(metadata i32 %j.0.i446, i64 0, metadata !267, metadata !131), !dbg !268
  %cmp.i456 = icmp sgt i32 %j.0.i446, %div.i424, !dbg !270
  br i1 %cmp.i456, label %heap_adjust.exit462.loopexit, label %while.body.i433, !dbg !272

heap_adjust.exit462.loopexit:                     ; preds = %if.end21.i457, %if.end.i452
  %k.addr.0.lcssa.i458.ph = phi i32 [ %k.addr.060.i430, %if.end.i452 ], [ %j.0.i446, %if.end21.i457 ]
  br label %heap_adjust.exit462

heap_adjust.exit462:                              ; preds = %heap_adjust.exit462.loopexit, %while.body
  %k.addr.0.lcssa.i458 = phi i32 [ 1, %while.body ], [ %k.addr.0.lcssa.i458.ph, %heap_adjust.exit462.loopexit ], !dbg !263
  %idxprom27.i459 = sext i32 %k.addr.0.lcssa.i458 to i64, !dbg !288
  %incdec.ptr.sum52.i460 = add nsw i64 %idxprom27.i459, -1, !dbg !288
  %arrayidx28.i461 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum52.i460, !dbg !288
  store i64 %conv26.pre.i427, i64* %arrayidx28.i461, align 8, !dbg !288, !tbaa !145
  %31 = load i64* %arrayidx25, align 16, !dbg !289, !tbaa !145
  %arrayidx32 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %31, !dbg !290
  %32 = load i64* %arrayidx32, align 8, !dbg !290, !tbaa !145
  %arrayidx33 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %22, !dbg !291
  %33 = load i64* %arrayidx33, align 8, !dbg !291, !tbaa !145
  %add34 = add i64 %33, %32, !dbg !290
  %add35 = add i64 %n.2527, 255, !dbg !292
  %arrayidx36 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %add35, !dbg !293
  store i64 %add34, i64* %arrayidx36, align 8, !dbg !293, !tbaa !145
  %conv38 = trunc i64 %add35 to i32, !dbg !294
  %arrayidx39 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %22, !dbg !295
  store i32 %conv38, i32* %arrayidx39, align 4, !dbg !295, !tbaa !296
  %sub = sub i64 -255, %n.2527, !dbg !298
  %conv40 = trunc i64 %sub to i32, !dbg !298
  %arrayidx42 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %31, !dbg !299
  store i32 %conv40, i32* %arrayidx42, align 4, !dbg !299, !tbaa !296
  store i64 %add35, i64* %arrayidx25, align 16, !dbg !300, !tbaa !145
  tail call void @llvm.dbg.value(metadata i64* %arrayidx25, i64 0, metadata !301, metadata !131), !dbg !303
  tail call void @llvm.dbg.value(metadata i32 %conv30, i64 0, metadata !304, metadata !131), !dbg !305
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !306, metadata !131), !dbg !307
  %sext.pre.i387 = shl i64 %add35, 32, !dbg !308
  %conv26.pre.i388 = ashr exact i64 %sext.pre.i387, 32, !dbg !308
  br i1 %cmp59.i425, label %heap_adjust.exit423, label %while.body.lr.ph.i390, !dbg !309

while.body.lr.ph.i390:                            ; preds = %heap_adjust.exit462
  %arrayidx14.i389 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %conv26.pre.i388, !dbg !310
  %34 = load i64* %arrayidx14.i389, align 8, !dbg !310, !tbaa !145
  br label %while.body.i394, !dbg !309

while.body.i394:                                  ; preds = %if.end21.i418, %while.body.lr.ph.i390
  %k.addr.060.i391 = phi i32 [ 1, %while.body.lr.ph.i390 ], [ %j.0.i407, %if.end21.i418 ], !dbg !302
  %add.i392 = shl nsw i32 %k.addr.060.i391, 1, !dbg !311
  tail call void @llvm.dbg.value(metadata i32 %add.i392, i64 0, metadata !312, metadata !131), !dbg !313
  %cmp2.i393 = icmp slt i32 %add.i392, %conv30, !dbg !314
  br i1 %cmp2.i393, label %land.lhs.true.i406, label %if.end.i413, !dbg !315

land.lhs.true.i406:                               ; preds = %while.body.i394
  %idxprom4.i395 = sext i32 %add.i392 to i64, !dbg !316
  %incdec.ptr.sum56.i396 = add nsw i64 %idxprom4.i395, -1, !dbg !316
  %arrayidx5.i397 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum56.i396, !dbg !316
  %35 = load i64* %arrayidx5.i397, align 8, !dbg !316, !tbaa !145
  %arrayidx6.i398 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %35, !dbg !317
  %36 = load i64* %arrayidx6.i398, align 8, !dbg !317, !tbaa !145
  %add757.i399 = or i32 %add.i392, 1, !dbg !318
  %idxprom8.i400 = sext i32 %add757.i399 to i64, !dbg !319
  %incdec.ptr.sum58.i401 = add nsw i64 %idxprom8.i400, -1, !dbg !319
  %arrayidx9.i402 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum58.i401, !dbg !319
  %37 = load i64* %arrayidx9.i402, align 16, !dbg !319, !tbaa !145
  %arrayidx10.i403 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %37, !dbg !320
  %38 = load i64* %arrayidx10.i403, align 8, !dbg !320, !tbaa !145
  %cmp11.i404 = icmp ugt i64 %36, %38, !dbg !317
  tail call void @llvm.dbg.value(metadata i32 %add757.i399, i64 0, metadata !312, metadata !131), !dbg !313
  %add757.add.i405 = select i1 %cmp11.i404, i32 %add757.i399, i32 %add.i392, !dbg !315
  br label %if.end.i413, !dbg !315

if.end.i413:                                      ; preds = %land.lhs.true.i406, %while.body.i394
  %j.0.i407 = phi i32 [ %add.i392, %while.body.i394 ], [ %add757.add.i405, %land.lhs.true.i406 ], !dbg !302
  %idxprom15.i408 = sext i32 %j.0.i407 to i64, !dbg !321
  %incdec.ptr.sum54.i409 = add nsw i64 %idxprom15.i408, -1, !dbg !321
  %arrayidx16.i410 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum54.i409, !dbg !321
  %39 = load i64* %arrayidx16.i410, align 8, !dbg !321, !tbaa !145
  %arrayidx17.i411 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %39, !dbg !322
  %40 = load i64* %arrayidx17.i411, align 8, !dbg !322, !tbaa !145
  %cmp18.i412 = icmp ult i64 %34, %40, !dbg !310
  br i1 %cmp18.i412, label %heap_adjust.exit423.loopexit, label %if.end21.i418, !dbg !323

if.end21.i418:                                    ; preds = %if.end.i413
  %idxprom24.i414 = sext i32 %k.addr.060.i391 to i64, !dbg !324
  %incdec.ptr.sum55.i415 = add nsw i64 %idxprom24.i414, -1, !dbg !324
  %arrayidx25.i416 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum55.i415, !dbg !324
  store i64 %39, i64* %arrayidx25.i416, align 8, !dbg !324, !tbaa !145
  tail call void @llvm.dbg.value(metadata i32 %j.0.i407, i64 0, metadata !306, metadata !131), !dbg !307
  %cmp.i417 = icmp sgt i32 %j.0.i407, %div.i424, !dbg !325
  br i1 %cmp.i417, label %heap_adjust.exit423.loopexit, label %while.body.i394, !dbg !309

heap_adjust.exit423.loopexit:                     ; preds = %if.end21.i418, %if.end.i413
  %k.addr.0.lcssa.i419.ph = phi i32 [ %k.addr.060.i391, %if.end.i413 ], [ %j.0.i407, %if.end21.i418 ]
  br label %heap_adjust.exit423

heap_adjust.exit423:                              ; preds = %heap_adjust.exit423.loopexit, %heap_adjust.exit462
  %k.addr.0.lcssa.i419 = phi i32 [ 1, %heap_adjust.exit462 ], [ %k.addr.0.lcssa.i419.ph, %heap_adjust.exit423.loopexit ], !dbg !302
  %idxprom27.i420 = sext i32 %k.addr.0.lcssa.i419 to i64, !dbg !326
  %incdec.ptr.sum52.i421 = add nsw i64 %idxprom27.i420, -1, !dbg !326
  %arrayidx28.i422 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %incdec.ptr.sum52.i421, !dbg !326
  store i64 %conv26.pre.i388, i64* %arrayidx28.i422, align 8, !dbg !326, !tbaa !145
  %cmp22 = icmp ugt i64 %dec24, 1, !dbg !223
  br i1 %cmp22, label %while.body, label %while.end.loopexit, !dbg !226

while.end.loopexit:                               ; preds = %heap_adjust.exit423
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %for.cond13.preheader, %while.cond.preheader
  %n.2.lcssa = phi i64 [ %n.1.lcssa, %while.cond.preheader ], [ 0, %for.cond13.preheader ], [ 1, %while.end.loopexit ]
  %add48 = add i64 %n.2.lcssa, 256, !dbg !327
  %arrayidx49 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %add48, !dbg !328
  store i32 0, i32* %arrayidx49, align 4, !dbg !328, !tbaa !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !131), !dbg !329
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !131), !dbg !330
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !131), !dbg !331
  br label %for.body53, !dbg !332

for.body53:                                       ; preds = %for.inc84, %while.end
  %maxi.0525 = phi i64 [ 0, %while.end ], [ %maxi.1, %for.inc84 ]
  %maxx.0524 = phi i64 [ 0, %while.end ], [ %maxx.2, %for.inc84 ]
  %m.0523 = phi i64 [ 0, %while.end ], [ %inc85, %for.inc84 ]
  %arrayidx54 = getelementptr inbounds [512 x i64]* %freq, i64 0, i64 %m.0523, !dbg !334
  %41 = load i64* %arrayidx54, align 8, !dbg !334, !tbaa !145
  %tobool55 = icmp eq i64 %41, 0, !dbg !338
  br i1 %tobool55, label %if.then56, label %while.cond60.preheader, !dbg !338

while.cond60.preheader:                           ; preds = %for.body53
  %l.0.in514 = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %m.0523, !dbg !339
  %l.0515 = load i32* %l.0.in514, align 4, !dbg !339
  %tobool61516 = icmp eq i32 %l.0515, 0, !dbg !341
  br i1 %tobool61516, label %while.end71, label %while.body62.preheader, !dbg !341

while.body62.preheader:                           ; preds = %while.cond60.preheader
  br label %while.body62, !dbg !342

if.then56:                                        ; preds = %for.body53
  %arrayidx57 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.0523, !dbg !345
  store i64 0, i64* %arrayidx57, align 8, !dbg !345, !tbaa !145
  %arrayidx58 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.0523, !dbg !347
  store i8 0, i8* %arrayidx58, align 1, !dbg !347, !tbaa !163
  br label %for.inc84, !dbg !348

while.body62:                                     ; preds = %while.body62.preheader, %if.end68
  %l.0520 = phi i32 [ %l.0, %if.end68 ], [ %l.0515, %while.body62.preheader ]
  %x.0519 = phi i64 [ %x.1, %if.end68 ], [ 0, %while.body62.preheader ]
  %i.3518 = phi i64 [ %inc70, %if.end68 ], [ 0, %while.body62.preheader ]
  %j.0517 = phi i64 [ %shl, %if.end68 ], [ 1, %while.body62.preheader ]
  %cmp63 = icmp slt i32 %l.0520, 0, !dbg !342
  br i1 %cmp63, label %if.then65, label %if.end68, !dbg !349

if.then65:                                        ; preds = %while.body62
  %add66 = add i64 %x.0519, %j.0517, !dbg !350
  tail call void @llvm.dbg.value(metadata i64 %add66, i64 0, metadata !63, metadata !131), !dbg !352
  %sub67 = sub nsw i32 0, %l.0520, !dbg !353
  tail call void @llvm.dbg.value(metadata i32 %sub67, i64 0, metadata !66, metadata !131), !dbg !354
  br label %if.end68, !dbg !355

if.end68:                                         ; preds = %if.then65, %while.body62
  %x.1 = phi i64 [ %add66, %if.then65 ], [ %x.0519, %while.body62 ]
  %l.1 = phi i32 [ %sub67, %if.then65 ], [ %l.0520, %while.body62 ]
  %idxprom = sext i32 %l.1 to i64, !dbg !356
  %shl = shl i64 %j.0517, 1, !dbg !357
  tail call void @llvm.dbg.value(metadata i64 %shl, i64 0, metadata !37, metadata !131), !dbg !358
  %inc70 = add i64 %i.3518, 1, !dbg !359
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !36, metadata !131), !dbg !189
  %l.0.in = getelementptr inbounds [512 x i32]* %link, i64 0, i64 %idxprom, !dbg !339
  %l.0 = load i32* %l.0.in, align 4, !dbg !339
  %tobool61 = icmp eq i32 %l.0, 0, !dbg !341
  br i1 %tobool61, label %while.end71.loopexit, label %while.body62, !dbg !341

while.end71.loopexit:                             ; preds = %if.end68
  %inc70.lcssa = phi i64 [ %inc70, %if.end68 ]
  %x.1.lcssa = phi i64 [ %x.1, %if.end68 ]
  br label %while.end71

while.end71:                                      ; preds = %while.end71.loopexit, %while.cond60.preheader
  %x.0.lcssa = phi i64 [ 0, %while.cond60.preheader ], [ %x.1.lcssa, %while.end71.loopexit ]
  %i.3.lcssa = phi i64 [ 0, %while.cond60.preheader ], [ %inc70.lcssa, %while.end71.loopexit ]
  %arrayidx72 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %m.0523, !dbg !360
  store i64 %x.0.lcssa, i64* %arrayidx72, align 8, !dbg !360, !tbaa !145
  %conv73 = trunc i64 %i.3.lcssa to i8, !dbg !361
  %arrayidx74 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %m.0523, !dbg !362
  store i8 %conv73, i8* %arrayidx74, align 1, !dbg !362, !tbaa !163
  %cmp75 = icmp ugt i64 %x.0.lcssa, %maxx.0524, !dbg !363
  tail call void @llvm.dbg.value(metadata i64 %x.1, i64 0, metadata !64, metadata !131), !dbg !329
  %x.0.maxx.0 = select i1 %cmp75, i64 %x.0.lcssa, i64 %maxx.0524, !dbg !365
  %cmp79 = icmp ugt i64 %i.3.lcssa, %maxi.0525, !dbg !366
  tail call void @llvm.dbg.value(metadata i64 %inc70, i64 0, metadata !65, metadata !131), !dbg !330
  %i.3.maxi.0 = select i1 %cmp79, i64 %i.3.lcssa, i64 %maxi.0525, !dbg !368
  br label %for.inc84, !dbg !368

for.inc84:                                        ; preds = %while.end71, %if.then56
  %maxx.2 = phi i64 [ %maxx.0524, %if.then56 ], [ %x.0.maxx.0, %while.end71 ]
  %maxi.1 = phi i64 [ %maxi.0525, %if.then56 ], [ %i.3.maxi.0, %while.end71 ]
  %inc85 = add nuw nsw i64 %m.0523, 1, !dbg !369
  tail call void @llvm.dbg.value(metadata i64 %inc85, i64 0, metadata !62, metadata !131), !dbg !331
  %exitcond543 = icmp eq i64 %inc85, 256, !dbg !332
  br i1 %exitcond543, label %for.end86, label %for.body53, !dbg !332

for.end86:                                        ; preds = %for.inc84
  %maxi.1.lcssa = phi i64 [ %maxi.1, %for.inc84 ]
  %maxx.2.lcssa = phi i64 [ %maxx.2, %for.inc84 ]
  %cmp87 = icmp ugt i64 %maxi.1.lcssa, 64, !dbg !370
  br i1 %cmp87, label %if.then89, label %if.end91, !dbg !372

if.then89:                                        ; preds = %for.end86
  %42 = load %struct._IO_FILE** @stderr, align 8, !dbg !373, !tbaa !375
  %43 = tail call i64 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i64 25, i64 1, %struct._IO_FILE* %42) #5, !dbg !377
  tail call void @exit(i32 1) #6, !dbg !378
  unreachable, !dbg !378

if.end91:                                         ; preds = %for.end86
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !131), !dbg !379
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !68, metadata !131), !dbg !380
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !69, metadata !131), !dbg !381
  tail call void @llvm.dbg.value(metadata i8* %data, i64 0, metadata !45, metadata !131), !dbg !169
  %cmp92 = icmp eq i64 %maxx.2.lcssa, 0, !dbg !382
  br i1 %cmp92, label %if.then94, label %for.cond97.preheader, !dbg !384

for.cond97.preheader:                             ; preds = %if.end91
  br i1 %cmp533, label %for.end143, label %for.body100.preheader, !dbg !385

for.body100.preheader:                            ; preds = %for.cond97.preheader
  br label %for.body100, !dbg !387

if.then94:                                        ; preds = %if.end91
  %44 = load %struct._IO_FILE** @stderr, align 8, !dbg !388, !tbaa !375
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %44) #5, !dbg !390
  tail call void @exit(i32 1) #6, !dbg !391
  unreachable, !dbg !391

for.body100:                                      ; preds = %for.body100.preheader, %for.end139
  %bit.0510 = phi i32 [ %bit.1.lcssa, %for.end139 ], [ -1, %for.body100.preheader ]
  %bout.0509 = phi i8 [ %bout.1.lcssa, %for.end139 ], [ 0, %for.body100.preheader ]
  %comp_len.0508 = phi i64 [ %comp_len.1.lcssa, %for.end139 ], [ 0, %for.body100.preheader ]
  %j.1507 = phi i64 [ %inc142, %for.end139 ], [ 0, %for.body100.preheader ]
  %dptr.1506 = phi i8* [ %incdec.ptr140, %for.end139 ], [ %data, %for.body100.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %conv106, i64 0, metadata !39, metadata !131), !dbg !387
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !189
  %46 = load i8* %dptr.1506, align 1, !dbg !392, !tbaa !163
  %idxprom108493 = zext i8 %46 to i64, !dbg !397
  %arrayidx109494 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %idxprom108493, !dbg !397
  %47 = load i8* %arrayidx109494, align 1, !dbg !397, !tbaa !163
  %cmp111496 = icmp eq i8 %47, 0, !dbg !398
  br i1 %cmp111496, label %for.end139, label %for.body113.lr.ph, !dbg !399

for.body113.lr.ph:                                ; preds = %for.body100
  %conv103 = zext i8 %47 to i32, !dbg !400
  %sub104 = add nsw i32 %conv103, -1, !dbg !400
  %shl105 = shl i32 1, %sub104, !dbg !401
  %conv106 = sext i32 %shl105 to i64, !dbg !401
  br label %for.body113, !dbg !399

for.body113:                                      ; preds = %for.body113.lr.ph, %if.end129
  %48 = phi i8 [ %46, %for.body113.lr.ph ], [ %51, %if.end129 ]
  %bit.1501 = phi i32 [ %bit.0510, %for.body113.lr.ph ], [ %bit.2, %if.end129 ]
  %bout.1500 = phi i8 [ %bout.0509, %for.body113.lr.ph ], [ %bout.2.or, %if.end129 ]
  %comp_len.1499 = phi i64 [ %comp_len.0508, %for.body113.lr.ph ], [ %comp_len.2, %if.end129 ]
  %i.4498 = phi i64 [ 0, %for.body113.lr.ph ], [ %inc138, %if.end129 ]
  %mask.0497 = phi i64 [ %conv106, %for.body113.lr.ph ], [ %shr, %if.end129 ]
  %cmp114 = icmp eq i32 %bit.1501, 7, !dbg !402
  br i1 %cmp114, label %if.then116, label %if.else124, !dbg !405

if.then116:                                       ; preds = %for.body113
  %arrayidx117 = getelementptr inbounds i8* %call, i64 %comp_len.1499, !dbg !406
  store i8 %bout.1500, i8* %arrayidx117, align 1, !dbg !406, !tbaa !163
  %inc118 = add i64 %comp_len.1499, 1, !dbg !408
  tail call void @llvm.dbg.value(metadata i64 %inc118, i64 0, metadata !67, metadata !131), !dbg !379
  %cmp119 = icmp eq i64 %inc118, %data_len, !dbg !409
  br i1 %cmp119, label %if.then121, label %if.then116.if.end129_crit_edge, !dbg !411

if.then116.if.end129_crit_edge:                   ; preds = %if.then116
  %.pre = load i8* %dptr.1506, align 1, !dbg !412, !tbaa !163
  br label %if.end129, !dbg !411

if.then121:                                       ; preds = %if.then116
  %49 = load %struct._IO_FILE** @stderr, align 8, !dbg !414, !tbaa !375
  %50 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %49) #5, !dbg !416
  tail call void @exit(i32 1) #6, !dbg !417
  unreachable, !dbg !417

if.else124:                                       ; preds = %for.body113
  %inc125 = add nsw i32 %bit.1501, 1, !dbg !418
  tail call void @llvm.dbg.value(metadata i32 %inc125, i64 0, metadata !69, metadata !131), !dbg !381
  %shl127 = shl i8 %bout.1500, 1, !dbg !420
  tail call void @llvm.dbg.value(metadata i8 %shl127, i64 0, metadata !68, metadata !131), !dbg !380
  br label %if.end129

if.end129:                                        ; preds = %if.then116.if.end129_crit_edge, %if.else124
  %51 = phi i8 [ %48, %if.else124 ], [ %.pre, %if.then116.if.end129_crit_edge ], !dbg !412
  %comp_len.2 = phi i64 [ %comp_len.1499, %if.else124 ], [ %inc118, %if.then116.if.end129_crit_edge ]
  %bout.2 = phi i8 [ %shl127, %if.else124 ], [ 0, %if.then116.if.end129_crit_edge ]
  %bit.2 = phi i32 [ %inc125, %if.else124 ], [ 0, %if.then116.if.end129_crit_edge ]
  %idxprom130 = zext i8 %51 to i64, !dbg !421
  %arrayidx131 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %idxprom130, !dbg !421
  %52 = load i64* %arrayidx131, align 8, !dbg !421, !tbaa !145
  %and = and i64 %52, %mask.0497, !dbg !421
  %not.tobool132 = icmp ne i64 %and, 0, !dbg !422
  %or = zext i1 %not.tobool132 to i8, !dbg !422
  %bout.2.or = or i8 %or, %bout.2, !dbg !422
  %shr = lshr i64 %mask.0497, 1, !dbg !423
  tail call void @llvm.dbg.value(metadata i64 %shr, i64 0, metadata !39, metadata !131), !dbg !387
  %inc138 = add nuw nsw i64 %i.4498, 1, !dbg !424
  tail call void @llvm.dbg.value(metadata i64 %inc138, i64 0, metadata !36, metadata !131), !dbg !189
  %arrayidx109 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %idxprom130, !dbg !397
  %53 = load i8* %arrayidx109, align 1, !dbg !397, !tbaa !163
  %conv110 = zext i8 %53 to i64, !dbg !397
  %cmp111 = icmp ult i64 %inc138, %conv110, !dbg !398
  br i1 %cmp111, label %for.body113, label %for.end139.loopexit, !dbg !399

for.end139.loopexit:                              ; preds = %if.end129
  %bout.2.or.lcssa = phi i8 [ %bout.2.or, %if.end129 ]
  %bit.2.lcssa = phi i32 [ %bit.2, %if.end129 ]
  %comp_len.2.lcssa = phi i64 [ %comp_len.2, %if.end129 ]
  br label %for.end139

for.end139:                                       ; preds = %for.end139.loopexit, %for.body100
  %bit.1.lcssa = phi i32 [ %bit.0510, %for.body100 ], [ %bit.2.lcssa, %for.end139.loopexit ]
  %bout.1.lcssa = phi i8 [ %bout.0509, %for.body100 ], [ %bout.2.or.lcssa, %for.end139.loopexit ]
  %comp_len.1.lcssa = phi i64 [ %comp_len.0508, %for.body100 ], [ %comp_len.2.lcssa, %for.end139.loopexit ]
  %incdec.ptr140 = getelementptr inbounds i8* %dptr.1506, i64 1, !dbg !425
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr140, i64 0, metadata !45, metadata !131), !dbg !169
  %inc142 = add nuw i64 %j.1507, 1, !dbg !426
  tail call void @llvm.dbg.value(metadata i64 %inc142, i64 0, metadata !37, metadata !131), !dbg !358
  %cmp98 = icmp ult i64 %inc142, %data_len, !dbg !427
  br i1 %cmp98, label %for.body100, label %for.end143.loopexit, !dbg !385

for.end143.loopexit:                              ; preds = %for.end139
  %comp_len.1.lcssa.lcssa = phi i64 [ %comp_len.1.lcssa, %for.end139 ]
  %bout.1.lcssa.lcssa = phi i8 [ %bout.1.lcssa, %for.end139 ]
  %bit.1.lcssa.lcssa = phi i32 [ %bit.1.lcssa, %for.end139 ]
  br label %for.end143

for.end143:                                       ; preds = %for.end143.loopexit, %for.cond97.preheader
  %bit.0.lcssa = phi i32 [ -1, %for.cond97.preheader ], [ %bit.1.lcssa.lcssa, %for.end143.loopexit ]
  %bout.0.lcssa = phi i8 [ 0, %for.cond97.preheader ], [ %bout.1.lcssa.lcssa, %for.end143.loopexit ]
  %comp_len.0.lcssa = phi i64 [ 0, %for.cond97.preheader ], [ %comp_len.1.lcssa.lcssa, %for.end143.loopexit ]
  %sub144 = sub nsw i32 7, %bit.0.lcssa, !dbg !428
  %conv145 = sext i8 %bout.0.lcssa to i32, !dbg !429
  %shl146 = shl i32 %conv145, %sub144, !dbg !429
  %conv147 = trunc i32 %shl146 to i8, !dbg !429
  tail call void @llvm.dbg.value(metadata i8 %conv147, i64 0, metadata !68, metadata !131), !dbg !380
  %arrayidx148 = getelementptr inbounds i8* %call, i64 %comp_len.0.lcssa, !dbg !430
  store i8 %conv147, i8* %arrayidx148, align 1, !dbg !430, !tbaa !163
  %54 = bitcast [256 x i64]* %heap2 to i8*, !dbg !431
  call void @llvm.lifetime.start(i64 2048, i8* %54) #3, !dbg !431
  tail call void @llvm.dbg.declare(metadata [256 x i64]* %heap2, metadata !70, metadata !131), !dbg !432
  %55 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 0, !dbg !433
  call void @llvm.lifetime.start(i64 256, i8* %55) #3, !dbg !433
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %outc, metadata !71, metadata !131), !dbg !434
  call void @llvm.memset.p0i8.i64(i8* %54, i8 0, i64 2048, i32 16, i1 false), !dbg !435
  tail call void @llvm.dbg.value(metadata i8* %55, i64 0, metadata !73, metadata !131), !dbg !436
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !131), !dbg !358
  br label %for.body154, !dbg !437

for.body154:                                      ; preds = %for.inc188, %for.end143
  %optr.0492 = phi i8* [ %55, %for.end143 ], [ %incdec.ptr156, %for.inc188 ]
  %j.2491 = phi i64 [ 0, %for.end143 ], [ %inc189, %for.inc188 ]
  %conv155 = trunc i64 %j.2491 to i8, !dbg !439
  store i8 %conv155, i8* %optr.0492, align 1, !dbg !442, !tbaa !163
  %incdec.ptr156 = getelementptr inbounds i8* %optr.0492, i64 1, !dbg !443
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr156, i64 0, metadata !73, metadata !131), !dbg !436
  %arrayidx157 = getelementptr inbounds [256 x i64]* %code, i64 0, i64 %j.2491, !dbg !444
  %56 = load i64* %arrayidx157, align 8, !dbg !444, !tbaa !145
  %arrayidx158 = getelementptr inbounds [256 x i8]* %clen, i64 0, i64 %j.2491, !dbg !446
  %57 = load i8* %arrayidx158, align 1, !dbg !446, !tbaa !163
  %conv159 = zext i8 %57 to i64, !dbg !446
  %or160 = or i64 %conv159, %56, !dbg !444
  %tobool161 = icmp eq i64 %or160, 0, !dbg !447
  br i1 %tobool161, label %for.inc188, label %if.then162, !dbg !447

if.then162:                                       ; preds = %for.body154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !131), !dbg !448
  tail call void @llvm.dbg.value(metadata i64 %conv167, i64 0, metadata !39, metadata !131), !dbg !387
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !189
  %cmp171486 = icmp eq i8 %57, 0, !dbg !449
  br i1 %cmp171486, label %for.end185, label %for.body173.lr.ph, !dbg !453

for.body173.lr.ph:                                ; preds = %if.then162
  %conv164 = zext i8 %57 to i32, !dbg !454
  %sub165 = add nsw i32 %conv164, -1, !dbg !454
  %shl166 = shl i32 1, %sub165, !dbg !455
  %conv167 = sext i32 %shl166 to i64, !dbg !455
  %58 = zext i8 %57 to i64
  %xtraiter = and i64 %58, 1
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  %lcmp.overflow = icmp eq i64 %58, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body173.prol.preheader, label %for.body173.lr.ph.split

for.body173.prol.preheader:                       ; preds = %for.body173.lr.ph
  br label %for.body173.prol, !dbg !456

for.body173.prol:                                 ; preds = %for.body173.prol.preheader, %for.body173.prol
  %i.5489.prol = phi i64 [ %inc184.prol, %for.body173.prol ], [ 0, %for.body173.prol.preheader ]
  %mask.1488.prol = phi i64 [ %shr182.prol, %for.body173.prol ], [ %conv167, %for.body173.prol.preheader ]
  %k.0487.prol = phi i64 [ %add175383.inc180.prol, %for.body173.prol ], [ 0, %for.body173.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body173.prol ], [ %xtraiter, %for.body173.prol.preheader ]
  %mul174.prol = shl i64 %k.0487.prol, 1, !dbg !456
  %add175383.prol = or i64 %mul174.prol, 1, !dbg !456
  tail call void @llvm.dbg.value(metadata i64 %add175383.prol, i64 0, metadata !40, metadata !131), !dbg !448
  %and177.prol = and i64 %56, %mask.1488.prol, !dbg !458
  %not.tobool178.prol = icmp ne i64 %and177.prol, 0, !dbg !460
  %inc180.prol = zext i1 %not.tobool178.prol to i64, !dbg !460
  %add175383.inc180.prol = add i64 %inc180.prol, %add175383.prol, !dbg !460
  %shr182.prol = lshr i64 %mask.1488.prol, 1, !dbg !461
  tail call void @llvm.dbg.value(metadata i64 %shr182.prol, i64 0, metadata !39, metadata !131), !dbg !387
  %inc184.prol = add nuw nsw i64 %i.5489.prol, 1, !dbg !462
  tail call void @llvm.dbg.value(metadata i64 %inc184.prol, i64 0, metadata !36, metadata !131), !dbg !189
  %cmp171.prol = icmp ult i64 %inc184.prol, %conv159, !dbg !449
  %prol.iter.sub = sub i64 %prol.iter, 1, !dbg !453
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0, !dbg !453
  br i1 %prol.iter.cmp, label %for.body173.prol, label %for.body173.lr.ph.split.loopexit, !llvm.loop !463

for.body173.lr.ph.split.loopexit:                 ; preds = %for.body173.prol
  %i.5489.unr.ph = phi i64 [ %inc184.prol, %for.body173.prol ]
  %mask.1488.unr.ph = phi i64 [ %shr182.prol, %for.body173.prol ]
  %k.0487.unr.ph = phi i64 [ %add175383.inc180.prol, %for.body173.prol ]
  %add175383.inc180.lcssa.unr.ph = phi i64 [ %add175383.inc180.prol, %for.body173.prol ]
  br label %for.body173.lr.ph.split

for.body173.lr.ph.split:                          ; preds = %for.body173.lr.ph.split.loopexit, %for.body173.lr.ph
  %i.5489.unr = phi i64 [ 0, %for.body173.lr.ph ], [ %i.5489.unr.ph, %for.body173.lr.ph.split.loopexit ]
  %mask.1488.unr = phi i64 [ %conv167, %for.body173.lr.ph ], [ %mask.1488.unr.ph, %for.body173.lr.ph.split.loopexit ]
  %k.0487.unr = phi i64 [ 0, %for.body173.lr.ph ], [ %k.0487.unr.ph, %for.body173.lr.ph.split.loopexit ]
  %add175383.inc180.lcssa.unr = phi i64 [ 0, %for.body173.lr.ph ], [ %add175383.inc180.lcssa.unr.ph, %for.body173.lr.ph.split.loopexit ]
  %59 = icmp ult i64 %58, 2
  br i1 %59, label %for.end185.loopexit, label %for.body173.lr.ph.split.split

for.body173.lr.ph.split.split:                    ; preds = %for.body173.lr.ph.split
  br label %for.body173, !dbg !453

for.body173:                                      ; preds = %for.body173, %for.body173.lr.ph.split.split
  %i.5489 = phi i64 [ %i.5489.unr, %for.body173.lr.ph.split.split ], [ %inc184.1, %for.body173 ]
  %mask.1488 = phi i64 [ %mask.1488.unr, %for.body173.lr.ph.split.split ], [ %shr182.1, %for.body173 ]
  %k.0487 = phi i64 [ %k.0487.unr, %for.body173.lr.ph.split.split ], [ %add175383.inc180.1, %for.body173 ]
  %mul174 = shl i64 %k.0487, 1, !dbg !456
  %add175383 = or i64 %mul174, 1, !dbg !456
  tail call void @llvm.dbg.value(metadata i64 %add175383, i64 0, metadata !40, metadata !131), !dbg !448
  %and177 = and i64 %56, %mask.1488, !dbg !458
  %not.tobool178 = icmp ne i64 %and177, 0, !dbg !460
  %inc180 = zext i1 %not.tobool178 to i64, !dbg !460
  %add175383.inc180 = add i64 %inc180, %add175383, !dbg !460
  %shr182 = lshr i64 %mask.1488, 1, !dbg !461
  tail call void @llvm.dbg.value(metadata i64 %shr182, i64 0, metadata !39, metadata !131), !dbg !387
  %inc184 = add nuw nsw i64 %i.5489, 1, !dbg !462
  tail call void @llvm.dbg.value(metadata i64 %inc184, i64 0, metadata !36, metadata !131), !dbg !189
  %mul174.1 = shl i64 %add175383.inc180, 1, !dbg !456
  %add175383.1 = or i64 %mul174.1, 1, !dbg !456
  tail call void @llvm.dbg.value(metadata i64 %add175383, i64 0, metadata !40, metadata !131), !dbg !448
  %and177.1 = and i64 %56, %shr182, !dbg !458
  %not.tobool178.1 = icmp ne i64 %and177.1, 0, !dbg !460
  %inc180.1 = zext i1 %not.tobool178.1 to i64, !dbg !460
  %add175383.inc180.1 = add i64 %inc180.1, %add175383.1, !dbg !460
  %shr182.1 = lshr i64 %shr182, 1, !dbg !461
  tail call void @llvm.dbg.value(metadata i64 %shr182, i64 0, metadata !39, metadata !131), !dbg !387
  %inc184.1 = add nuw nsw i64 %inc184, 1, !dbg !462
  tail call void @llvm.dbg.value(metadata i64 %inc184, i64 0, metadata !36, metadata !131), !dbg !189
  %cmp171.1 = icmp ult i64 %inc184.1, %conv159, !dbg !449
  br i1 %cmp171.1, label %for.body173, label %for.end185.loopexit.unr-lcssa, !dbg !453

for.end185.loopexit.unr-lcssa:                    ; preds = %for.body173
  %add175383.inc180.lcssa.ph = phi i64 [ %add175383.inc180.1, %for.body173 ]
  br label %for.end185.loopexit

for.end185.loopexit:                              ; preds = %for.body173.lr.ph.split, %for.end185.loopexit.unr-lcssa
  %add175383.inc180.lcssa = phi i64 [ %add175383.inc180.lcssa.unr, %for.body173.lr.ph.split ], [ %add175383.inc180.lcssa.ph, %for.end185.loopexit.unr-lcssa ]
  br label %for.end185

for.end185:                                       ; preds = %for.end185.loopexit, %if.then162
  %k.0.lcssa = phi i64 [ 0, %if.then162 ], [ %add175383.inc180.lcssa, %for.end185.loopexit ]
  %arrayidx186 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.2491, !dbg !464
  store i64 %k.0.lcssa, i64* %arrayidx186, align 8, !dbg !464, !tbaa !145
  br label %for.inc188, !dbg !465

for.inc188:                                       ; preds = %for.body154, %for.end185
  %inc189 = add nuw nsw i64 %j.2491, 1, !dbg !466
  tail call void @llvm.dbg.value(metadata i64 %inc189, i64 0, metadata !37, metadata !131), !dbg !358
  %exitcond542 = icmp eq i64 %inc189, 256, !dbg !437
  br i1 %exitcond542, label %land.rhs.lr.ph.preheader, label %for.body154, !dbg !437

land.rhs.lr.ph.preheader:                         ; preds = %for.inc188
  br label %land.rhs.lr.ph, !dbg !467

land.rhs.lr.ph:                                   ; preds = %land.rhs.lr.ph.preheader, %while.end211
  %i.6484 = phi i64 [ %inc215, %while.end211 ], [ 1, %land.rhs.lr.ph.preheader ]
  %arrayidx195 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.6484, !dbg !467
  %60 = load i64* %arrayidx195, align 8, !dbg !467, !tbaa !145
  tail call void @llvm.dbg.value(metadata i64 %60, i64 0, metadata !42, metadata !131), !dbg !471
  %arrayidx196 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.6484, !dbg !472
  %61 = load i8* %arrayidx196, align 1, !dbg !472, !tbaa !163
  tail call void @llvm.dbg.value(metadata i8 %61, i64 0, metadata !43, metadata !131), !dbg !473
  tail call void @llvm.dbg.value(metadata i64 %inc215, i64 0, metadata !37, metadata !131), !dbg !358
  br label %land.rhs, !dbg !474

land.rhs:                                         ; preds = %land.rhs.lr.ph, %while.body203
  %j.3482 = phi i64 [ %i.6484, %land.rhs.lr.ph ], [ %sub199, %while.body203 ]
  %sub199 = add nsw i64 %j.3482, -1, !dbg !475
  %arrayidx200 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %sub199, !dbg !477
  %62 = load i64* %arrayidx200, align 8, !dbg !477, !tbaa !145
  %cmp201 = icmp ugt i64 %62, %60, !dbg !477
  br i1 %cmp201, label %while.body203, label %while.end211, !dbg !478

while.body203:                                    ; preds = %land.rhs
  %arrayidx206 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3482, !dbg !480
  store i64 %62, i64* %arrayidx206, align 8, !dbg !480, !tbaa !145
  %arrayidx208 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %sub199, !dbg !482
  %63 = load i8* %arrayidx208, align 1, !dbg !482, !tbaa !163
  %arrayidx209 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3482, !dbg !483
  store i8 %63, i8* %arrayidx209, align 1, !dbg !483, !tbaa !163
  tail call void @llvm.dbg.value(metadata i64 %sub199, i64 0, metadata !37, metadata !131), !dbg !358
  %tobool198 = icmp eq i64 %sub199, 0, !dbg !474
  br i1 %tobool198, label %while.end211, label %land.rhs, !dbg !474

while.end211:                                     ; preds = %land.rhs, %while.body203
  %j.3.lcssa = phi i64 [ 0, %while.body203 ], [ %j.3482, %land.rhs ]
  %arrayidx212 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.3.lcssa, !dbg !484
  store i64 %60, i64* %arrayidx212, align 8, !dbg !484, !tbaa !145
  %arrayidx213 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %j.3.lcssa, !dbg !485
  store i8 %61, i8* %arrayidx213, align 1, !dbg !485, !tbaa !163
  %inc215 = add nuw nsw i64 %i.6484, 1, !dbg !486
  tail call void @llvm.dbg.value(metadata i64 %inc215, i64 0, metadata !36, metadata !131), !dbg !189
  %exitcond = icmp eq i64 %inc215, 256, !dbg !487
  br i1 %exitcond, label %for.cond217.preheader, label %land.rhs.lr.ph, !dbg !487

for.cond217.preheader:                            ; preds = %while.end211
  br label %for.cond217, !dbg !488

for.cond217:                                      ; preds = %for.cond217.preheader, %for.cond217
  %j.4 = phi i64 [ %inc223, %for.cond217 ], [ 0, %for.cond217.preheader ]
  %arrayidx218 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %j.4, !dbg !488
  %64 = load i64* %arrayidx218, align 8, !dbg !488, !tbaa !145
  %cmp219 = icmp eq i64 %64, 0, !dbg !488
  %inc223 = add i64 %j.4, 1, !dbg !491
  tail call void @llvm.dbg.value(metadata i64 %inc223, i64 0, metadata !37, metadata !131), !dbg !358
  br i1 %cmp219, label %for.cond217, label %while.cond225.preheader, !dbg !493

while.cond225.preheader:                          ; preds = %for.cond217
  %j.4.lcssa = phi i64 [ %j.4, %for.cond217 ]
  br i1 %cmp533, label %while.end259, label %while.body228.lr.ph.preheader, !dbg !494

while.body228.lr.ph.preheader:                    ; preds = %while.cond225.preheader
  br label %while.body228.lr.ph, !dbg !494

while.cond225:                                    ; preds = %if.end251
  %shr255 = lshr i64 %mask.2471, 1, !dbg !495
  %cmp226 = icmp ult i64 %n.4, %data_len, !dbg !498
  br i1 %cmp226, label %while.body228, label %while.end259.loopexit, !dbg !494

while.body228:                                    ; preds = %while.body228.lr.ph, %while.cond225
  %i.7474 = phi i64 [ %i.7.ph480, %while.body228.lr.ph ], [ %i.9, %while.cond225 ]
  %dptr.2473 = phi i8* [ %dptr.2.ph479, %while.body228.lr.ph ], [ %dptr.3, %while.cond225 ]
  %n.3472 = phi i64 [ %n.3.ph477, %while.body228.lr.ph ], [ %n.4, %while.cond225 ]
  %mask.2471 = phi i64 [ 128, %while.body228.lr.ph ], [ %shr255, %while.cond225 ]
  %k.2470 = phi i64 [ %k.2.ph476, %while.body228.lr.ph ], [ %k.4, %while.cond225 ]
  %mul229 = shl i64 %k.2470, 1, !dbg !499
  %add230382 = or i64 %mul229, 1, !dbg !499
  tail call void @llvm.dbg.value(metadata i64 %add230382, i64 0, metadata !40, metadata !131), !dbg !448
  %65 = load i8* %cptr.0.ph478, align 1, !dbg !500, !tbaa !163
  %conv231 = zext i8 %65 to i64, !dbg !502
  %and232 = and i64 %conv231, %mask.2471, !dbg !502
  %not.tobool233 = icmp ne i64 %and232, 0, !dbg !503
  %inc235 = zext i1 %not.tobool233 to i64, !dbg !503
  %add230382.inc235 = add i64 %inc235, %add230382, !dbg !503
  br label %while.cond237, !dbg !503

while.cond237:                                    ; preds = %while.cond237, %while.body228
  %i.8 = phi i64 [ %inc242, %while.cond237 ], [ %i.7474, %while.body228 ]
  %arrayidx238 = getelementptr inbounds [256 x i64]* %heap2, i64 0, i64 %i.8, !dbg !504
  %66 = load i64* %arrayidx238, align 8, !dbg !504, !tbaa !145
  %cmp239 = icmp ult i64 %66, %add230382.inc235, !dbg !504
  %inc242 = add i64 %i.8, 1, !dbg !505
  tail call void @llvm.dbg.value(metadata i64 %inc242, i64 0, metadata !36, metadata !131), !dbg !189
  br i1 %cmp239, label %while.cond237, label %while.end243, !dbg !506

while.end243:                                     ; preds = %while.cond237
  %.lcssa = phi i64 [ %66, %while.cond237 ]
  %i.8.lcssa = phi i64 [ %i.8, %while.cond237 ]
  %cmp245 = icmp eq i64 %add230382.inc235, %.lcssa, !dbg !507
  br i1 %cmp245, label %if.then247, label %if.end251, !dbg !509

if.then247:                                       ; preds = %while.end243
  %arrayidx248 = getelementptr inbounds [256 x i8]* %outc, i64 0, i64 %i.8.lcssa, !dbg !510
  %67 = load i8* %arrayidx248, align 1, !dbg !510, !tbaa !163
  store i8 %67, i8* %dptr.2473, align 1, !dbg !512, !tbaa !163
  %incdec.ptr249 = getelementptr inbounds i8* %dptr.2473, i64 1, !dbg !513
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr249, i64 0, metadata !45, metadata !131), !dbg !169
  %inc250 = add i64 %n.3472, 1, !dbg !514
  tail call void @llvm.dbg.value(metadata i64 %inc250, i64 0, metadata !38, metadata !131), !dbg !220
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !131), !dbg !448
  tail call void @llvm.dbg.value(metadata i64 %j.4, i64 0, metadata !36, metadata !131), !dbg !189
  br label %if.end251, !dbg !515

if.end251:                                        ; preds = %if.then247, %while.end243
  %k.4 = phi i64 [ 0, %if.then247 ], [ %add230382.inc235, %while.end243 ]
  %n.4 = phi i64 [ %inc250, %if.then247 ], [ %n.3472, %while.end243 ]
  %dptr.3 = phi i8* [ %incdec.ptr249, %if.then247 ], [ %dptr.2473, %while.end243 ]
  %i.9 = phi i64 [ %j.4.lcssa, %if.then247 ], [ %i.8.lcssa, %while.end243 ]
  %cmp252 = icmp ugt i64 %mask.2471, 1, !dbg !516
  tail call void @llvm.dbg.value(metadata i64 %shr255, i64 0, metadata !39, metadata !131), !dbg !387
  br i1 %cmp252, label %while.cond225, label %if.else256, !dbg !517

if.else256:                                       ; preds = %if.end251
  %i.9.lcssa = phi i64 [ %i.9, %if.end251 ]
  %dptr.3.lcssa = phi i8* [ %dptr.3, %if.end251 ]
  %n.4.lcssa = phi i64 [ %n.4, %if.end251 ]
  %k.4.lcssa = phi i64 [ %k.4, %if.end251 ]
  tail call void @llvm.dbg.value(metadata i64 128, i64 0, metadata !39, metadata !131), !dbg !387
  %incdec.ptr257 = getelementptr inbounds i8* %cptr.0.ph478, i64 1, !dbg !518
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr257, i64 0, metadata !44, metadata !131), !dbg !520
  %cmp226469 = icmp ult i64 %n.4.lcssa, %data_len, !dbg !498
  br i1 %cmp226469, label %while.body228.lr.ph, label %while.end259.loopexit552, !dbg !494

while.body228.lr.ph:                              ; preds = %while.body228.lr.ph.preheader, %if.else256
  %i.7.ph480 = phi i64 [ %i.9.lcssa, %if.else256 ], [ %j.4.lcssa, %while.body228.lr.ph.preheader ]
  %dptr.2.ph479 = phi i8* [ %dptr.3.lcssa, %if.else256 ], [ %data, %while.body228.lr.ph.preheader ]
  %cptr.0.ph478 = phi i8* [ %incdec.ptr257, %if.else256 ], [ %call, %while.body228.lr.ph.preheader ]
  %n.3.ph477 = phi i64 [ %n.4.lcssa, %if.else256 ], [ 0, %while.body228.lr.ph.preheader ]
  %k.2.ph476 = phi i64 [ %k.4.lcssa, %if.else256 ], [ 0, %while.body228.lr.ph.preheader ]
  br label %while.body228, !dbg !494

while.end259.loopexit:                            ; preds = %while.cond225
  br label %while.end259

while.end259.loopexit552:                         ; preds = %if.else256
  br label %while.end259

while.end259:                                     ; preds = %while.end259.loopexit552, %while.end259.loopexit, %while.cond225.preheader
  tail call void @free(i8* %call) #3, !dbg !521
  call void @llvm.lifetime.end(i64 256, i8* %55) #3, !dbg !522
  call void @llvm.lifetime.end(i64 2048, i8* %54) #3, !dbg !522
  call void @llvm.lifetime.end(i64 256, i8* %4) #3, !dbg !522
  call void @llvm.lifetime.end(i64 2048, i8* %3) #3, !dbg !522
  call void @llvm.lifetime.end(i64 2048, i8* %2) #3, !dbg !522
  call void @llvm.lifetime.end(i64 2048, i8* %1) #3, !dbg !522
  call void @llvm.lifetime.end(i64 4096, i8* %0) #3, !dbg !522
  ret void, !dbg !522

if.then.1:                                        ; preds = %for.inc10
  %arrayidx8.1 = getelementptr inbounds [256 x i64]* %heap, i64 0, i64 %n.1, !dbg !217
  store i64 %inc11, i64* %arrayidx8.1, align 8, !dbg !217, !tbaa !145
  %inc9.1 = add i64 %n.1, 1, !dbg !219
  tail call void @llvm.dbg.value(metadata i64 %inc9, i64 0, metadata !38, metadata !131), !dbg !220
  br label %for.inc10.1, !dbg !221

for.inc10.1:                                      ; preds = %if.then.1, %for.inc10
  %n.1.1 = phi i64 [ %inc9.1, %if.then.1 ], [ %n.1, %for.inc10 ]
  %inc11.1 = add nuw nsw i64 %inc11, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !36, metadata !131), !dbg !189
  %exitcond544.1 = icmp eq i64 %inc11.1, 256, !dbg !523
  br i1 %exitcond544.1, label %for.cond13.preheader, label %for.body6, !dbg !523
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !79, metadata !131), !dbg !524
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !80, metadata !131), !dbg !525
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !82, metadata !131), !dbg !526
  %cmp = icmp sgt i32 %argc, 1, !dbg !527
  br i1 %cmp, label %cond.true.lr.ph, label %if.end44, !dbg !528

cond.true.lr.ph:                                  ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1, !dbg !529
  %0 = load i8** %arrayidx, align 8, !dbg !529, !tbaa !375
  %1 = load i8* %0, align 1, !dbg !529, !tbaa !163
  %cmp10 = icmp eq i8 %1, 45, !dbg !531
  %arrayidx14 = getelementptr inbounds i8* %0, i64 1, !dbg !534
  %arrayidx24 = getelementptr inbounds i8* %0, i64 2, !dbg !537
  %arrayidx34 = getelementptr inbounds i8* %0, i64 3, !dbg !541
  br label %cond.true, !dbg !544

for.cond:                                         ; preds = %cond.true, %if.then12, %if.then22, %if.end38
  %inc86 = add nuw nsw i32 %i.082, 1, !dbg !545
  %cmp1 = icmp slt i32 %inc86, %argc, !dbg !546
  br i1 %cmp1, label %cond.true, label %if.end44.loopexit, !dbg !544

cond.true:                                        ; preds = %cond.true.lr.ph, %for.cond
  %i.082 = phi i32 [ 1, %cond.true.lr.ph ], [ %inc86, %for.cond ]
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !92, metadata !131), !dbg !547
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !93, metadata !131), !dbg !548
  br i1 %cmp10, label %if.then12, label %for.cond, !dbg !548

if.then12:                                        ; preds = %cond.true
  %2 = load i8* %arrayidx14, align 1, !dbg !534, !tbaa !163
  %cmp20 = icmp eq i8 %2, 103, !dbg !549
  br i1 %cmp20, label %if.then22, label %for.cond, !dbg !551

if.then22:                                        ; preds = %if.then12
  %3 = load i8* %arrayidx24, align 1, !dbg !537, !tbaa !163
  %cmp30 = icmp eq i8 %3, 97, !dbg !552
  br i1 %cmp30, label %if.end38, label %for.cond, !dbg !554

if.end38:                                         ; preds = %if.then22
  %4 = load i8* %arrayidx34, align 1, !dbg !541, !tbaa !163
  %tobool = icmp eq i8 %4, 0, !dbg !555
  br i1 %tobool, label %if.end44.loopexit, label %for.cond, !dbg !555

if.end44.loopexit:                                ; preds = %if.end38, %for.cond
  %ga_testing.0.ph = phi i1 [ false, %for.cond ], [ true, %if.end38 ]
  br label %if.end44

if.end44:                                         ; preds = %if.end44.loopexit, %entry
  %ga_testing.0 = phi i1 [ false, %entry ], [ %ga_testing.0.ph, %if.end44.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 10000000, i64 0, metadata !556, metadata !131) #3, !dbg !558
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !559, metadata !131) #3, !dbg !560
  %call.i = tail call noalias i8* @malloc(i64 10000000) #3, !dbg !561
  tail call void @llvm.dbg.value(metadata i8* %call.i, i64 0, metadata !562, metadata !131) #3, !dbg !563
  tail call void @llvm.dbg.value(metadata i8* %call.i, i64 0, metadata !564, metadata !131) #3, !dbg !565
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !566, metadata !131) #3, !dbg !567
  br label %for.body.i, !dbg !568

for.body.i:                                       ; preds = %for.body.i, %if.end44
  %indvars.iv.i = phi i64 [ 0, %if.end44 ], [ %indvars.iv.next.i, %for.body.i ], !dbg !557
  %ptr.010.i = phi i8* [ %call.i, %if.end44 ], [ %incdec.ptr.i, %for.body.i ], !dbg !557
  %5 = load i64* @seed, align 8, !dbg !569, !tbaa !145
  %xor.i.i = xor i64 %5, 123459876, !dbg !569
  %div.i.i = sdiv i64 %xor.i.i, 127773, !dbg !571
  tail call void @llvm.dbg.value(metadata i64 %div.i.i, i64 0, metadata !572, metadata !131) #3, !dbg !573
  %6 = mul i64 %div.i.i, -127773, !dbg !574
  %sub6.i7.i78 = add i64 %xor.i.i, %6, !dbg !574
  %mul1.i.i = mul nsw i64 %sub6.i7.i78, 16807, !dbg !575
  %7 = mul i64 %div.i.i, -2836, !dbg !575
  %sub37.i8.i79 = add i64 %mul1.i.i, %7, !dbg !575
  %cmp.i.i = icmp slt i64 %sub37.i8.i79, 0, !dbg !576
  %add.i.i = add nsw i64 %sub37.i8.i79, 2147483647, !dbg !577
  %add.sub3.i.i = select i1 %cmp.i.i, i64 %add.i.i, i64 %sub37.i8.i79, !dbg !578
  %rem.i.i = srem i64 %add.sub3.i.i, 32, !dbg !579
  tail call void @llvm.dbg.value(metadata i64 %rem.i.i, i64 0, metadata !580, metadata !131) #3, !dbg !581
  %xor4.i.i = xor i64 %add.sub3.i.i, 123459876, !dbg !582
  store i64 %xor4.i.i, i64* @seed, align 8, !dbg !582, !tbaa !145
  %arrayidx.i = getelementptr inbounds [33 x i8]* @.str, i64 0, i64 %rem.i.i, !dbg !583
  %8 = load i8* %arrayidx.i, align 1, !dbg !583, !tbaa !163
  store i8 %8, i8* %ptr.010.i, align 1, !dbg !584, !tbaa !163
  %incdec.ptr.i = getelementptr inbounds i8* %ptr.010.i, i64 1, !dbg !585
  tail call void @llvm.dbg.value(metadata i8* %incdec.ptr.i, i64 0, metadata !564, metadata !131) #3, !dbg !565
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !568
  %exitcond.i = icmp eq i64 %indvars.iv.i, 9999999, !dbg !568
  br i1 %exitcond.i, label %for.cond47.preheader, label %for.body.i, !dbg !568

for.cond47.preheader:                             ; preds = %for.body.i
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @compdecomp(i8* %call.i, i64 10000000), !dbg !586
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !81, metadata !131), !dbg !589
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !97, metadata !131), !dbg !590
  tail call void @free(i8* %call.i) #3, !dbg !591
  %9 = load %struct._IO_FILE** @stdout, align 8, !dbg !592, !tbaa !375
  br i1 %ga_testing.0, label %if.then56, label %if.else, !dbg !594

if.then56:                                        ; preds = %for.cond47.preheader
  %call57 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), double 0.000000e+00) #3, !dbg !595
  br label %if.end59, !dbg !595

if.else:                                          ; preds = %for.cond47.preheader
  %call58 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([35 x i8]* @.str6, i64 0, i64 0), double 0.000000e+00) #3, !dbg !596
  br label %if.end59

if.end59:                                         ; preds = %if.else, %if.then56
  %10 = load %struct._IO_FILE** @stdout, align 8, !dbg !597, !tbaa !375
  %call60 = tail call i32 @fflush(%struct._IO_FILE* %10) #3, !dbg !598
  ret i32 0, !dbg !599
}

; Function Attrs: nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !17, !117, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c] [DW_LANG_C99]
!1 = !{!"huffbench.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !7, !9, !6, !10, !11, !13, !15}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from byte]
!5 = !{!"0x16\00byte\0084\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [byte] [line 84, size 0, align 0, offset 0] [from unsigned char]
!6 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!7 = !{!"0x16\00size_t\0062\000\000\000\000", !8, null, !9} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!8 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!9 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!10 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = !{!"0x26\00\000\000\000\000\000", null, null, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0x26\00\000\000\000\000\000", null, null, !6} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = !{!"0x26\00\000\000\000\000\000", null, null, !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!17 = !{!18, !30, !74, !99, !110}
!18 = !{!"0x2e\00generate_test_data\00generate_test_data\00\0088\000\001\000\000\00256\001\0089", !1, !19, !20, null, i8* (i64)* @generate_test_data, null, null, !22} ; [ DW_TAG_subprogram ] [line 88] [def] [scope 89] [generate_test_data]
!19 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!4, !7}
!22 = !{!23, !24, !26, !27, !28}
!23 = !{!"0x101\00n\0016777304\000", !18, !19, !7} ; [ DW_TAG_arg_variable ] [n] [line 88]
!24 = !{!"0x100\00codes\0090\000", !18, !19, !25} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!25 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!26 = !{!"0x100\00result\0092\000", !18, !19, !4} ; [ DW_TAG_auto_variable ] [result] [line 92]
!27 = !{!"0x100\00ptr\0093\000", !18, !19, !4}    ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!28 = !{!"0x100\00i\0095\000", !18, !19, !29}     ; [ DW_TAG_auto_variable ] [i] [line 95]
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0x2e\00compdecomp\00compdecomp\00\00136\000\001\000\000\00256\001\00137", !1, !19, !31, null, void (i8*, i64)* @compdecomp, null, null, !33} ; [ DW_TAG_subprogram ] [line 136] [def] [scope 137] [compdecomp]
!31 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !32, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = !{null, !4, !7}
!33 = !{!34, !35, !36, !37, !38, !39, !40, !42, !43, !44, !45, !46, !47, !51, !55, !57, !59, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !73}
!34 = !{!"0x101\00data\0016777352\000", !30, !19, !4} ; [ DW_TAG_arg_variable ] [data] [line 136]
!35 = !{!"0x101\00data_len\0033554568\000", !30, !19, !7} ; [ DW_TAG_arg_variable ] [data_len] [line 136]
!36 = !{!"0x100\00i\00138\000", !30, !19, !7}     ; [ DW_TAG_auto_variable ] [i] [line 138]
!37 = !{!"0x100\00j\00138\000", !30, !19, !7}     ; [ DW_TAG_auto_variable ] [j] [line 138]
!38 = !{!"0x100\00n\00138\000", !30, !19, !7}     ; [ DW_TAG_auto_variable ] [n] [line 138]
!39 = !{!"0x100\00mask\00138\000", !30, !19, !7}  ; [ DW_TAG_auto_variable ] [mask] [line 138]
!40 = !{!"0x100\00k\00139\000", !30, !19, !41}    ; [ DW_TAG_auto_variable ] [k] [line 139]
!41 = !{!"0x16\00bits32\0083\000\000\000\000", !1, null, !9} ; [ DW_TAG_typedef ] [bits32] [line 83, size 0, align 0, offset 0] [from long unsigned int]
!42 = !{!"0x100\00t\00139\000", !30, !19, !41}    ; [ DW_TAG_auto_variable ] [t] [line 139]
!43 = !{!"0x100\00c\00140\000", !30, !19, !5}     ; [ DW_TAG_auto_variable ] [c] [line 140]
!44 = !{!"0x100\00cptr\00141\000", !30, !19, !4}  ; [ DW_TAG_auto_variable ] [cptr] [line 141]
!45 = !{!"0x100\00dptr\00142\000", !30, !19, !4}  ; [ DW_TAG_auto_variable ] [dptr] [line 142]
!46 = !{!"0x100\00comp\00149\000", !30, !19, !4}  ; [ DW_TAG_auto_variable ] [comp] [line 149]
!47 = !{!"0x100\00freq\00151\000", !30, !19, !48} ; [ DW_TAG_auto_variable ] [freq] [line 151]
!48 = !{!"0x1\00\000\0032768\0064\000\000\000", null, null, !7, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32768, align 64, offset 0] [from size_t]
!49 = !{!50}
!50 = !{!"0x21\000\00512"}                        ; [ DW_TAG_subrange_type ] [0, 511]
!51 = !{!"0x100\00heap\00152\000", !30, !19, !52} ; [ DW_TAG_auto_variable ] [heap] [line 152]
!52 = !{!"0x1\00\000\0016384\0064\000\000\000", null, null, !7, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from size_t]
!53 = !{!54}
!54 = !{!"0x21\000\00256"}                        ; [ DW_TAG_subrange_type ] [0, 255]
!55 = !{!"0x100\00link\00153\000", !30, !19, !56} ; [ DW_TAG_auto_variable ] [link] [line 153]
!56 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !29, !49, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!57 = !{!"0x100\00code\00154\000", !30, !19, !58} ; [ DW_TAG_auto_variable ] [code] [line 154]
!58 = !{!"0x1\00\000\0016384\0064\000\000\000", null, null, !41, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 64, offset 0] [from bits32]
!59 = !{!"0x100\00clen\00155\000", !30, !19, !60} ; [ DW_TAG_auto_variable ] [clen] [line 155]
!60 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !5, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from byte]
!61 = !{!"0x100\00temp\00187\000", !30, !19, !7}  ; [ DW_TAG_auto_variable ] [temp] [line 187]
!62 = !{!"0x100\00m\00215\000", !30, !19, !7}     ; [ DW_TAG_auto_variable ] [m] [line 215]
!63 = !{!"0x100\00x\00215\000", !30, !19, !7}     ; [ DW_TAG_auto_variable ] [x] [line 215]
!64 = !{!"0x100\00maxx\00215\000", !30, !19, !7}  ; [ DW_TAG_auto_variable ] [maxx] [line 215]
!65 = !{!"0x100\00maxi\00215\000", !30, !19, !7}  ; [ DW_TAG_auto_variable ] [maxi] [line 215]
!66 = !{!"0x100\00l\00216\000", !30, !19, !29}    ; [ DW_TAG_auto_variable ] [l] [line 216]
!67 = !{!"0x100\00comp_len\00266\000", !30, !19, !7} ; [ DW_TAG_auto_variable ] [comp_len] [line 266]
!68 = !{!"0x100\00bout\00267\000", !30, !19, !10} ; [ DW_TAG_auto_variable ] [bout] [line 267]
!69 = !{!"0x100\00bit\00268\000", !30, !19, !29}  ; [ DW_TAG_auto_variable ] [bit] [line 268]
!70 = !{!"0x100\00heap2\00331\000", !30, !19, !58} ; [ DW_TAG_auto_variable ] [heap2] [line 331]
!71 = !{!"0x100\00outc\00334\000", !30, !19, !72} ; [ DW_TAG_auto_variable ] [outc] [line 334]
!72 = !{!"0x1\00\000\002048\008\000\000\000", null, null, !10, !53, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!73 = !{!"0x100\00optr\00340\000", !30, !19, !25} ; [ DW_TAG_auto_variable ] [optr] [line 340]
!74 = !{!"0x2e\00main\00main\00\00434\000\001\000\000\00256\001\00435", !1, !19, !75, null, i32 (i32, i8**)* @main, null, null, !78} ; [ DW_TAG_subprogram ] [line 434] [def] [scope 435] [main]
!75 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !76, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = !{!29, !29, !77}
!77 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = !{!79, !80, !81, !82, !84, !92, !93, !95, !96, !97}
!79 = !{!"0x101\00argc\0016777650\000", !74, !19, !29} ; [ DW_TAG_arg_variable ] [argc] [line 434]
!80 = !{!"0x101\00argv\0033554866\000", !74, !19, !77} ; [ DW_TAG_arg_variable ] [argv] [line 434]
!81 = !{!"0x100\00i\00436\000", !74, !19, !29}    ; [ DW_TAG_auto_variable ] [i] [line 436]
!82 = !{!"0x100\00ga_testing\00439\000", !74, !19, !83} ; [ DW_TAG_auto_variable ] [ga_testing] [line 439]
!83 = !{!"0x24\00_Bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [_Bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!84 = !{!"0x100\00__s1_len\00445\000", !85, !19, !7} ; [ DW_TAG_auto_variable ] [__s1_len] [line 445]
!85 = !{!"0xb\00445\0018\0068", !1, !86}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!86 = !{!"0xb\00445\0017\0067", !1, !87}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!87 = !{!"0xb\00444\009\0066", !1, !88}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!88 = !{!"0xb\00443\009\0065", !1, !89}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!89 = !{!"0xb\00443\009\0064", !1, !90}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!90 = !{!"0xb\00442\005\0063", !1, !91}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!91 = !{!"0xb\00441\009\0062", !1, !74}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!92 = !{!"0x100\00__s2_len\00445\000", !85, !19, !7} ; [ DW_TAG_auto_variable ] [__s2_len] [line 445]
!93 = !{!"0x100\00__s2\00445\000", !94, !19, !13} ; [ DW_TAG_auto_variable ] [__s2] [line 445]
!94 = !{!"0xb\00445\0018\0069", !1, !85}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!95 = !{!"0x100\00__result\00445\000", !94, !19, !29} ; [ DW_TAG_auto_variable ] [__result] [line 445]
!96 = !{!"0x100\00test_data\00454\000", !74, !19, !4} ; [ DW_TAG_auto_variable ] [test_data] [line 454]
!97 = !{!"0x100\00run_time\00472\000", !74, !19, !98} ; [ DW_TAG_auto_variable ] [run_time] [line 472]
!98 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!99 = !{!"0x2e\00heap_adjust\00heap_adjust\00\00106\001\001\000\000\00256\001\00107", !1, !19, !100, null, null, null, null, !103} ; [ DW_TAG_subprogram ] [line 106] [local] [def] [scope 107] [heap_adjust]
!100 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !101, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = !{null, !102, !102, !29, !29}
!102 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!103 = !{!104, !105, !106, !107, !108, !109}
!104 = !{!"0x101\00freq\0016777322\000", !99, !19, !102} ; [ DW_TAG_arg_variable ] [freq] [line 106]
!105 = !{!"0x101\00heap\0033554538\000", !99, !19, !102} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!106 = !{!"0x101\00n\0050331754\000", !99, !19, !29} ; [ DW_TAG_arg_variable ] [n] [line 106]
!107 = !{!"0x101\00k\0067108970\000", !99, !19, !29} ; [ DW_TAG_arg_variable ] [k] [line 106]
!108 = !{!"0x100\00j\00112\000", !99, !19, !29}   ; [ DW_TAG_auto_variable ] [j] [line 112]
!109 = !{!"0x100\00v\00116\000", !99, !19, !29}   ; [ DW_TAG_auto_variable ] [v] [line 116]
!110 = !{!"0x2e\00random4\00random4\00\0047\001\001\000\000\000\001\0048", !1, !19, !111, null, null, null, null, !113} ; [ DW_TAG_subprogram ] [line 47] [local] [def] [scope 48] [random4]
!111 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !112, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = !{!7}
!113 = !{!114, !116}
!114 = !{!"0x100\00k\0049\000", !110, !19, !115}  ; [ DW_TAG_auto_variable ] [k] [line 49]
!115 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!116 = !{!"0x100\00result\0050\000", !110, !19, !7} ; [ DW_TAG_auto_variable ] [result] [line 50]
!117 = !{!118, !120, !121, !123, !124, !125, !126, !127}
!118 = !{!"0x34\00TEST_SIZE\00TEST_SIZE\00\0079\001\001", null, !19, !119, i32 10000000, null} ; [ DW_TAG_variable ] [TEST_SIZE] [line 79] [local] [def]
!119 = !{!"0x26\00\000\000\000\000\000", null, null, !29} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!120 = !{!"0x34\00NUM_LOOPS\00NUM_LOOPS\00\0078\001\001", null, !19, !119, i32 30, null} ; [ DW_TAG_variable ] [NUM_LOOPS] [line 78] [local] [def]
!121 = !{!"0x34\00MASK\00MASK\00\0044\001\001", null, !19, !122, i64 123459876, null} ; [ DW_TAG_variable ] [MASK] [line 44] [local] [def]
!122 = !{!"0x26\00\000\000\000\000\000", null, null, !115} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from long int]
!123 = !{!"0x34\00IQ\00IQ\00\0042\001\001", null, !19, !122, i64 127773, null} ; [ DW_TAG_variable ] [IQ] [line 42] [local] [def]
!124 = !{!"0x34\00IA\00IA\00\0040\001\001", null, !19, !122, i64 16807, null} ; [ DW_TAG_variable ] [IA] [line 40] [local] [def]
!125 = !{!"0x34\00IR\00IR\00\0043\001\001", null, !19, !122, i64 2836, null} ; [ DW_TAG_variable ] [IR] [line 43] [local] [def]
!126 = !{!"0x34\00IM\00IM\00\0041\001\001", null, !19, !122, i64 2147483647, null} ; [ DW_TAG_variable ] [IM] [line 41] [local] [def]
!127 = !{!"0x34\00seed\00seed\00\0039\001\001", null, !19, !115, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 39] [local] [def]
!128 = !{i32 2, !"Dwarf Version", i32 4}
!129 = !{i32 2, !"Debug Info Version", i32 2}
!130 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!131 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!132 = !MDLocation(line: 88, column: 34, scope: !18)
!133 = !MDLocation(line: 90, column: 12, scope: !18)
!134 = !MDLocation(line: 92, column: 29, scope: !18)
!135 = !MDLocation(line: 92, column: 12, scope: !18)
!136 = !MDLocation(line: 93, column: 12, scope: !18)
!137 = !MDLocation(line: 95, column: 9, scope: !18)
!138 = !MDLocation(line: 96, column: 17, scope: !139)
!139 = !{!"0xb\0096\005\001", !1, !140}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!140 = !{!"0xb\0096\005\000", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!141 = !MDLocation(line: 96, column: 5, scope: !140)
!142 = !MDLocation(line: 52, column: 5, scope: !110, inlinedAt: !143)
!143 = !MDLocation(line: 98, column: 28, scope: !144)
!144 = !{!"0xb\0097\005\002", !1, !139}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!145 = !{!146, !146, i64 0}
!146 = !{!"long", !147, i64 0}
!147 = !{!"omnipotent char", !148, i64 0}
!148 = !{!"Simple C/C++ TBAA"}
!149 = !MDLocation(line: 53, column: 9, scope: !110, inlinedAt: !143)
!150 = !{!"0x100\00k\0049\000", !110, !19, !115, !143} ; [ DW_TAG_auto_variable ] [k] [line 49]
!151 = !MDLocation(line: 49, column: 10, scope: !110, inlinedAt: !143)
!152 = !MDLocation(line: 54, column: 18, scope: !110, inlinedAt: !143)
!153 = !MDLocation(line: 54, column: 12, scope: !110, inlinedAt: !143)
!154 = !MDLocation(line: 56, column: 9, scope: !155, inlinedAt: !143)
!155 = !{!"0xb\0056\009\0082", !1, !110}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!156 = !MDLocation(line: 57, column: 9, scope: !155, inlinedAt: !143)
!157 = !MDLocation(line: 56, column: 9, scope: !110, inlinedAt: !143)
!158 = !MDLocation(line: 59, column: 23, scope: !110, inlinedAt: !143)
!159 = !{!"0x100\00result\0050\000", !110, !19, !7, !143} ; [ DW_TAG_auto_variable ] [result] [line 50]
!160 = !MDLocation(line: 50, column: 12, scope: !110, inlinedAt: !143)
!161 = !MDLocation(line: 60, column: 5, scope: !110, inlinedAt: !143)
!162 = !MDLocation(line: 98, column: 22, scope: !144)
!163 = !{!147, !147, i64 0}
!164 = !MDLocation(line: 98, column: 9, scope: !144)
!165 = !MDLocation(line: 99, column: 9, scope: !144)
!166 = !MDLocation(line: 102, column: 5, scope: !18)
!167 = !MDLocation(line: 136, column: 24, scope: !30)
!168 = !MDLocation(line: 136, column: 37, scope: !30)
!169 = !MDLocation(line: 142, column: 12, scope: !30)
!170 = !MDLocation(line: 149, column: 34, scope: !30)
!171 = !MDLocation(line: 149, column: 27, scope: !30)
!172 = !MDLocation(line: 149, column: 12, scope: !30)
!173 = !MDLocation(line: 151, column: 5, scope: !30)
!174 = !MDLocation(line: 151, column: 12, scope: !30)
!175 = !MDLocation(line: 152, column: 5, scope: !30)
!176 = !MDLocation(line: 152, column: 12, scope: !30)
!177 = !MDLocation(line: 153, column: 5, scope: !30)
!178 = !MDLocation(line: 153, column: 12, scope: !30)
!179 = !MDLocation(line: 154, column: 5, scope: !30)
!180 = !MDLocation(line: 154, column: 12, scope: !30)
!181 = !MDLocation(line: 155, column: 5, scope: !30)
!182 = !MDLocation(line: 155, column: 12, scope: !30)
!183 = !MDLocation(line: 157, column: 5, scope: !30)
!184 = !MDLocation(line: 158, column: 5, scope: !30)
!185 = !MDLocation(line: 159, column: 5, scope: !30)
!186 = !MDLocation(line: 160, column: 5, scope: !30)
!187 = !MDLocation(line: 161, column: 5, scope: !30)
!188 = !MDLocation(line: 162, column: 5, scope: !30)
!189 = !MDLocation(line: 138, column: 12, scope: !30)
!190 = !MDLocation(line: 165, column: 17, scope: !191)
!191 = !{!"0xb\00165\005\004", !1, !192}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!192 = !{!"0xb\00165\005\003", !1, !30}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!193 = !MDLocation(line: 165, column: 5, scope: !192)
!194 = !MDLocation(line: 167, column: 25, scope: !195)
!195 = !{!"0xb\00166\005\005", !1, !191}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!196 = !MDLocation(line: 167, column: 16, scope: !195)
!197 = !MDLocation(line: 167, column: 9, scope: !195)
!198 = !MDLocation(line: 168, column: 9, scope: !195)
!199 = !MDLocation(line: 165, column: 31, scope: !191)
!200 = distinct !{!200, !201}
!201 = !{!"llvm.loop.unroll.disable"}
!202 = !MDLocation(line: 176, column: 13, scope: !203)
!203 = !{!"0xb\00176\0013\009", !1, !204}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!204 = !{!"0xb\00175\005\008", !1, !205}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!205 = !{!"0xb\00174\005\007", !1, !206}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!206 = !{!"0xb\00174\005\006", !1, !30}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!207 = !MDLocation(line: 183, column: 17, scope: !208)
!208 = !{!"0xb\002", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!209 = !{!"0xb\001", !1, !210}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!210 = !{!"0xb\00183\005\0012", !1, !211}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!211 = !{!"0xb\00183\005\0011", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!212 = !MDLocation(line: 183, column: 5, scope: !211)
!213 = !MDLocation(line: 184, column: 31, scope: !210)
!214 = !MDLocation(line: 118, column: 18, scope: !99, inlinedAt: !215)
!215 = !MDLocation(line: 184, column: 9, scope: !210)
!216 = !MDLocation(line: 176, column: 13, scope: !204)
!217 = !MDLocation(line: 178, column: 13, scope: !218)
!218 = !{!"0xb\00177\009\0010", !1, !203}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!219 = !MDLocation(line: 179, column: 13, scope: !218)
!220 = !MDLocation(line: 138, column: 18, scope: !30)
!221 = !MDLocation(line: 180, column: 9, scope: !218)
!222 = !MDLocation(line: 174, column: 26, scope: !205)
!223 = !MDLocation(line: 191, column: 12, scope: !224)
!224 = !{!"0xb\002", !1, !225}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!225 = !{!"0xb\001", !1, !30}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!226 = !MDLocation(line: 191, column: 5, scope: !30)
!227 = !MDLocation(line: 195, column: 19, scope: !228)
!228 = !{!"0xb\00192\005\0013", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!229 = !MDLocation(line: 184, column: 33, scope: !210)
!230 = !{!"0x101\00n\0050331754\000", !99, !19, !29, !215} ; [ DW_TAG_arg_variable ] [n] [line 106]
!231 = !MDLocation(line: 106, column: 59, scope: !99, inlinedAt: !215)
!232 = !{!"0x101\00k\0067108970\000", !99, !19, !29, !215} ; [ DW_TAG_arg_variable ] [k] [line 106]
!233 = !MDLocation(line: 106, column: 66, scope: !99, inlinedAt: !215)
!234 = !MDLocation(line: 116, column: 13, scope: !99, inlinedAt: !215)
!235 = !MDLocation(line: 118, column: 12, scope: !99, inlinedAt: !215)
!236 = !MDLocation(line: 132, column: 15, scope: !99, inlinedAt: !215)
!237 = !MDLocation(line: 118, column: 5, scope: !99, inlinedAt: !215)
!238 = !MDLocation(line: 125, column: 13, scope: !239, inlinedAt: !215)
!239 = !{!"0xb\00125\0013\0081", !1, !240}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!240 = !{!"0xb\00119\005\0079", !1, !99}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!241 = !MDLocation(line: 120, column: 13, scope: !240, inlinedAt: !215)
!242 = !{!"0x100\00j\00112\000", !99, !19, !29, !215} ; [ DW_TAG_auto_variable ] [j] [line 112]
!243 = !MDLocation(line: 112, column: 9, scope: !99, inlinedAt: !215)
!244 = !MDLocation(line: 122, column: 14, scope: !245, inlinedAt: !215)
!245 = !{!"0xb\00122\0013\0080", !1, !240}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!246 = !MDLocation(line: 122, column: 13, scope: !240, inlinedAt: !215)
!247 = !MDLocation(line: 122, column: 30, scope: !245, inlinedAt: !215)
!248 = !MDLocation(line: 122, column: 25, scope: !245, inlinedAt: !215)
!249 = !MDLocation(line: 122, column: 51, scope: !245, inlinedAt: !215)
!250 = !MDLocation(line: 122, column: 46, scope: !245, inlinedAt: !215)
!251 = !MDLocation(line: 122, column: 41, scope: !245, inlinedAt: !215)
!252 = !MDLocation(line: 125, column: 28, scope: !239, inlinedAt: !215)
!253 = !MDLocation(line: 125, column: 23, scope: !239, inlinedAt: !215)
!254 = !MDLocation(line: 125, column: 13, scope: !240, inlinedAt: !215)
!255 = !MDLocation(line: 128, column: 9, scope: !240, inlinedAt: !215)
!256 = !MDLocation(line: 132, column: 5, scope: !99, inlinedAt: !215)
!257 = !MDLocation(line: 183, column: 24, scope: !210)
!258 = !MDLocation(line: 194, column: 9, scope: !228)
!259 = !MDLocation(line: 196, column: 19, scope: !228)
!260 = !MDLocation(line: 196, column: 9, scope: !228)
!261 = !MDLocation(line: 199, column: 31, scope: !228)
!262 = !{!"0x101\00heap\0033554538\000", !99, !19, !102, !263} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!263 = !MDLocation(line: 199, column: 9, scope: !228)
!264 = !MDLocation(line: 106, column: 49, scope: !99, inlinedAt: !263)
!265 = !{!"0x101\00n\0050331754\000", !99, !19, !29, !263} ; [ DW_TAG_arg_variable ] [n] [line 106]
!266 = !MDLocation(line: 106, column: 59, scope: !99, inlinedAt: !263)
!267 = !{!"0x101\00k\0067108970\000", !99, !19, !29, !263} ; [ DW_TAG_arg_variable ] [k] [line 106]
!268 = !MDLocation(line: 106, column: 66, scope: !99, inlinedAt: !263)
!269 = !MDLocation(line: 118, column: 18, scope: !99, inlinedAt: !263)
!270 = !MDLocation(line: 118, column: 12, scope: !99, inlinedAt: !263)
!271 = !MDLocation(line: 132, column: 15, scope: !99, inlinedAt: !263)
!272 = !MDLocation(line: 118, column: 5, scope: !99, inlinedAt: !263)
!273 = !MDLocation(line: 125, column: 13, scope: !239, inlinedAt: !263)
!274 = !MDLocation(line: 120, column: 13, scope: !240, inlinedAt: !263)
!275 = !{!"0x100\00j\00112\000", !99, !19, !29, !263} ; [ DW_TAG_auto_variable ] [j] [line 112]
!276 = !MDLocation(line: 112, column: 9, scope: !99, inlinedAt: !263)
!277 = !MDLocation(line: 122, column: 14, scope: !245, inlinedAt: !263)
!278 = !MDLocation(line: 122, column: 13, scope: !240, inlinedAt: !263)
!279 = !MDLocation(line: 122, column: 30, scope: !245, inlinedAt: !263)
!280 = !MDLocation(line: 122, column: 25, scope: !245, inlinedAt: !263)
!281 = !MDLocation(line: 122, column: 51, scope: !245, inlinedAt: !263)
!282 = !MDLocation(line: 122, column: 46, scope: !245, inlinedAt: !263)
!283 = !MDLocation(line: 122, column: 41, scope: !245, inlinedAt: !263)
!284 = !MDLocation(line: 125, column: 28, scope: !239, inlinedAt: !263)
!285 = !MDLocation(line: 125, column: 23, scope: !239, inlinedAt: !263)
!286 = !MDLocation(line: 125, column: 13, scope: !240, inlinedAt: !263)
!287 = !MDLocation(line: 128, column: 9, scope: !240, inlinedAt: !263)
!288 = !MDLocation(line: 132, column: 5, scope: !99, inlinedAt: !263)
!289 = !MDLocation(line: 203, column: 30, scope: !228)
!290 = !MDLocation(line: 203, column: 25, scope: !228)
!291 = !MDLocation(line: 203, column: 41, scope: !228)
!292 = !MDLocation(line: 203, column: 14, scope: !228)
!293 = !MDLocation(line: 203, column: 9, scope: !228)
!294 = !MDLocation(line: 204, column: 26, scope: !228)
!295 = !MDLocation(line: 204, column: 9, scope: !228)
!296 = !{!297, !297, i64 0}
!297 = !{!"int", !147, i64 0}
!298 = !MDLocation(line: 205, column: 25, scope: !228)
!299 = !MDLocation(line: 205, column: 9, scope: !228)
!300 = !MDLocation(line: 206, column: 9, scope: !228)
!301 = !{!"0x101\00heap\0033554538\000", !99, !19, !102, !302} ; [ DW_TAG_arg_variable ] [heap] [line 106]
!302 = !MDLocation(line: 209, column: 9, scope: !228)
!303 = !MDLocation(line: 106, column: 49, scope: !99, inlinedAt: !302)
!304 = !{!"0x101\00n\0050331754\000", !99, !19, !29, !302} ; [ DW_TAG_arg_variable ] [n] [line 106]
!305 = !MDLocation(line: 106, column: 59, scope: !99, inlinedAt: !302)
!306 = !{!"0x101\00k\0067108970\000", !99, !19, !29, !302} ; [ DW_TAG_arg_variable ] [k] [line 106]
!307 = !MDLocation(line: 106, column: 66, scope: !99, inlinedAt: !302)
!308 = !MDLocation(line: 132, column: 15, scope: !99, inlinedAt: !302)
!309 = !MDLocation(line: 118, column: 5, scope: !99, inlinedAt: !302)
!310 = !MDLocation(line: 125, column: 13, scope: !239, inlinedAt: !302)
!311 = !MDLocation(line: 120, column: 13, scope: !240, inlinedAt: !302)
!312 = !{!"0x100\00j\00112\000", !99, !19, !29, !302} ; [ DW_TAG_auto_variable ] [j] [line 112]
!313 = !MDLocation(line: 112, column: 9, scope: !99, inlinedAt: !302)
!314 = !MDLocation(line: 122, column: 14, scope: !245, inlinedAt: !302)
!315 = !MDLocation(line: 122, column: 13, scope: !240, inlinedAt: !302)
!316 = !MDLocation(line: 122, column: 30, scope: !245, inlinedAt: !302)
!317 = !MDLocation(line: 122, column: 25, scope: !245, inlinedAt: !302)
!318 = !MDLocation(line: 122, column: 51, scope: !245, inlinedAt: !302)
!319 = !MDLocation(line: 122, column: 46, scope: !245, inlinedAt: !302)
!320 = !MDLocation(line: 122, column: 41, scope: !245, inlinedAt: !302)
!321 = !MDLocation(line: 125, column: 28, scope: !239, inlinedAt: !302)
!322 = !MDLocation(line: 125, column: 23, scope: !239, inlinedAt: !302)
!323 = !MDLocation(line: 125, column: 13, scope: !240, inlinedAt: !302)
!324 = !MDLocation(line: 128, column: 9, scope: !240, inlinedAt: !302)
!325 = !MDLocation(line: 118, column: 12, scope: !99, inlinedAt: !302)
!326 = !MDLocation(line: 132, column: 5, scope: !99, inlinedAt: !302)
!327 = !MDLocation(line: 212, column: 10, scope: !30)
!328 = !MDLocation(line: 212, column: 5, scope: !30)
!329 = !MDLocation(line: 215, column: 18, scope: !30)
!330 = !MDLocation(line: 215, column: 28, scope: !30)
!331 = !MDLocation(line: 215, column: 12, scope: !30)
!332 = !MDLocation(line: 218, column: 5, scope: !333)
!333 = !{!"0xb\00218\005\0014", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!334 = !MDLocation(line: 220, column: 14, scope: !335)
!335 = !{!"0xb\00220\0013\0017", !1, !336}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!336 = !{!"0xb\00219\005\0016", !1, !337}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!337 = !{!"0xb\00218\005\0015", !1, !333}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!338 = !MDLocation(line: 220, column: 13, scope: !336)
!339 = !MDLocation(line: 230, column: 17, scope: !340)
!340 = !{!"0xb\00226\009\0019", !1, !335}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!341 = !MDLocation(line: 232, column: 13, scope: !340)
!342 = !MDLocation(line: 234, column: 21, scope: !343)
!343 = !{!"0xb\00234\0021\0021", !1, !344}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!344 = !{!"0xb\00233\0013\0020", !1, !340}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!345 = !MDLocation(line: 222, column: 13, scope: !346)
!346 = !{!"0xb\00221\009\0018", !1, !335}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!347 = !MDLocation(line: 223, column: 13, scope: !346)
!348 = !MDLocation(line: 224, column: 9, scope: !346)
!349 = !MDLocation(line: 234, column: 21, scope: !344)
!350 = !MDLocation(line: 236, column: 21, scope: !351)
!351 = !{!"0xb\00235\0017\0022", !1, !343}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!352 = !MDLocation(line: 215, column: 15, scope: !30)
!353 = !MDLocation(line: 237, column: 26, scope: !351)
!354 = !MDLocation(line: 216, column: 9, scope: !30)
!355 = !MDLocation(line: 238, column: 17, scope: !351)
!356 = !MDLocation(line: 240, column: 22, scope: !344)
!357 = !MDLocation(line: 241, column: 17, scope: !344)
!358 = !MDLocation(line: 138, column: 15, scope: !30)
!359 = !MDLocation(line: 242, column: 17, scope: !344)
!360 = !MDLocation(line: 245, column: 13, scope: !340)
!361 = !MDLocation(line: 246, column: 23, scope: !340)
!362 = !MDLocation(line: 246, column: 13, scope: !340)
!363 = !MDLocation(line: 249, column: 17, scope: !364)
!364 = !{!"0xb\00249\0017\0023", !1, !340}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!365 = !MDLocation(line: 249, column: 17, scope: !340)
!366 = !MDLocation(line: 253, column: 17, scope: !367)
!367 = !{!"0xb\00253\0017\0024", !1, !340}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!368 = !MDLocation(line: 253, column: 17, scope: !340)
!369 = !MDLocation(line: 218, column: 26, scope: !337)
!370 = !MDLocation(line: 259, column: 9, scope: !371)
!371 = !{!"0xb\00259\009\0025", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!372 = !MDLocation(line: 259, column: 9, scope: !30)
!373 = !MDLocation(line: 261, column: 17, scope: !374)
!374 = !{!"0xb\00260\005\0026", !1, !371}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!375 = !{!376, !376, i64 0}
!376 = !{!"any pointer", !147, i64 0}
!377 = !MDLocation(line: 261, column: 9, scope: !374)
!378 = !MDLocation(line: 262, column: 9, scope: !374)
!379 = !MDLocation(line: 266, column: 12, scope: !30)
!380 = !MDLocation(line: 267, column: 12, scope: !30)
!381 = !MDLocation(line: 268, column: 12, scope: !30)
!382 = !MDLocation(line: 272, column: 9, scope: !383)
!383 = !{!"0xb\00272\009\0027", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!384 = !MDLocation(line: 272, column: 9, scope: !30)
!385 = !MDLocation(line: 278, column: 5, scope: !386)
!386 = !{!"0xb\00278\005\0029", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!387 = !MDLocation(line: 138, column: 21, scope: !30)
!388 = !MDLocation(line: 274, column: 17, scope: !389)
!389 = !{!"0xb\00273\005\0028", !1, !383}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!390 = !MDLocation(line: 274, column: 9, scope: !389)
!391 = !MDLocation(line: 275, column: 9, scope: !389)
!392 = !MDLocation(line: 284, column: 31, scope: !393)
!393 = !{!"0xb\00284\009\0033", !1, !394}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!394 = !{!"0xb\00284\009\0032", !1, !395}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!395 = !{!"0xb\00279\005\0031", !1, !396}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!396 = !{!"0xb\00278\005\0030", !1, !386}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!397 = !MDLocation(line: 284, column: 25, scope: !393)
!398 = !MDLocation(line: 284, column: 21, scope: !393)
!399 = !MDLocation(line: 284, column: 9, scope: !394)
!400 = !MDLocation(line: 281, column: 22, scope: !395)
!401 = !MDLocation(line: 281, column: 16, scope: !395)
!402 = !MDLocation(line: 286, column: 17, scope: !403)
!403 = !{!"0xb\00286\0017\0035", !1, !404}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!404 = !{!"0xb\00285\009\0034", !1, !393}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!405 = !MDLocation(line: 286, column: 17, scope: !404)
!406 = !MDLocation(line: 289, column: 17, scope: !407)
!407 = !{!"0xb\00287\0013\0036", !1, !403}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!408 = !MDLocation(line: 290, column: 17, scope: !407)
!409 = !MDLocation(line: 293, column: 21, scope: !410)
!410 = !{!"0xb\00293\0021\0037", !1, !407}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!411 = !MDLocation(line: 293, column: 21, scope: !407)
!412 = !MDLocation(line: 309, column: 23, scope: !413)
!413 = !{!"0xb\00309\0017\0040", !1, !404}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!414 = !MDLocation(line: 295, column: 29, scope: !415)
!415 = !{!"0xb\00294\0017\0038", !1, !410}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!416 = !MDLocation(line: 295, column: 21, scope: !415)
!417 = !MDLocation(line: 296, column: 21, scope: !415)
!418 = !MDLocation(line: 305, column: 17, scope: !419)
!419 = !{!"0xb\00303\0013\0039", !1, !403}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!420 = !MDLocation(line: 306, column: 17, scope: !419)
!421 = !MDLocation(line: 309, column: 17, scope: !413)
!422 = !MDLocation(line: 309, column: 17, scope: !404)
!423 = !MDLocation(line: 312, column: 13, scope: !404)
!424 = !MDLocation(line: 284, column: 40, scope: !393)
!425 = !MDLocation(line: 315, column: 9, scope: !395)
!426 = !MDLocation(line: 278, column: 31, scope: !396)
!427 = !MDLocation(line: 278, column: 17, scope: !396)
!428 = !MDLocation(line: 319, column: 15, scope: !30)
!429 = !MDLocation(line: 319, column: 5, scope: !30)
!430 = !MDLocation(line: 320, column: 5, scope: !30)
!431 = !MDLocation(line: 331, column: 5, scope: !30)
!432 = !MDLocation(line: 331, column: 12, scope: !30)
!433 = !MDLocation(line: 334, column: 5, scope: !30)
!434 = !MDLocation(line: 334, column: 10, scope: !30)
!435 = !MDLocation(line: 337, column: 5, scope: !30)
!436 = !MDLocation(line: 340, column: 12, scope: !30)
!437 = !MDLocation(line: 342, column: 5, scope: !438)
!438 = !{!"0xb\00342\005\0041", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!439 = !MDLocation(line: 344, column: 19, scope: !440)
!440 = !{!"0xb\00343\005\0043", !1, !441}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!441 = !{!"0xb\00342\005\0042", !1, !438}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!442 = !MDLocation(line: 344, column: 9, scope: !440)
!443 = !MDLocation(line: 345, column: 9, scope: !440)
!444 = !MDLocation(line: 348, column: 13, scope: !445)
!445 = !{!"0xb\00348\0013\0044", !1, !440}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!446 = !MDLocation(line: 348, column: 23, scope: !445)
!447 = !MDLocation(line: 348, column: 13, scope: !440)
!448 = !MDLocation(line: 139, column: 12, scope: !30)
!449 = !MDLocation(line: 356, column: 25, scope: !450)
!450 = !{!"0xb\00356\0013\0047", !1, !451}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!451 = !{!"0xb\00356\0013\0046", !1, !452}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!452 = !{!"0xb\00349\009\0045", !1, !445}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!453 = !MDLocation(line: 356, column: 13, scope: !451)
!454 = !MDLocation(line: 352, column: 26, scope: !452)
!455 = !MDLocation(line: 352, column: 20, scope: !452)
!456 = !MDLocation(line: 358, column: 21, scope: !457)
!457 = !{!"0xb\00357\0013\0048", !1, !450}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!458 = !MDLocation(line: 360, column: 21, scope: !459)
!459 = !{!"0xb\00360\0021\0049", !1, !457}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!460 = !MDLocation(line: 360, column: 21, scope: !457)
!461 = !MDLocation(line: 363, column: 17, scope: !457)
!462 = !MDLocation(line: 356, column: 38, scope: !450)
!463 = distinct !{!463, !201}
!464 = !MDLocation(line: 366, column: 13, scope: !452)
!465 = !MDLocation(line: 367, column: 9, scope: !452)
!466 = !MDLocation(line: 342, column: 26, scope: !441)
!467 = !MDLocation(line: 373, column: 13, scope: !468)
!468 = !{!"0xb\00372\005\0052", !1, !469}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!469 = !{!"0xb\00371\005\0051", !1, !470}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!470 = !{!"0xb\00371\005\0050", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!471 = !MDLocation(line: 139, column: 15, scope: !30)
!472 = !MDLocation(line: 374, column: 13, scope: !468)
!473 = !MDLocation(line: 140, column: 12, scope: !30)
!474 = !MDLocation(line: 377, column: 16, scope: !468)
!475 = !MDLocation(line: 377, column: 30, scope: !476)
!476 = !{!"0xb\002", !1, !468}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!477 = !MDLocation(line: 377, column: 24, scope: !468)
!478 = !MDLocation(line: 377, column: 9, scope: !479)
!479 = !{!"0xb\003", !1, !468}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!480 = !MDLocation(line: 379, column: 13, scope: !481)
!481 = !{!"0xb\00378\009\0053", !1, !468}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!482 = !MDLocation(line: 380, column: 23, scope: !481)
!483 = !MDLocation(line: 380, column: 13, scope: !481)
!484 = !MDLocation(line: 384, column: 9, scope: !468)
!485 = !MDLocation(line: 385, column: 9, scope: !468)
!486 = !MDLocation(line: 371, column: 26, scope: !469)
!487 = !MDLocation(line: 371, column: 5, scope: !470)
!488 = !MDLocation(line: 389, column: 17, scope: !489)
!489 = !{!"0xb\00389\005\0055", !1, !490}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!490 = !{!"0xb\00389\005\0054", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!491 = !MDLocation(line: 389, column: 32, scope: !492)
!492 = !{!"0xb\003", !1, !489}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!493 = !MDLocation(line: 389, column: 5, scope: !490)
!494 = !MDLocation(line: 399, column: 5, scope: !30)
!495 = !MDLocation(line: 422, column: 13, scope: !496)
!496 = !{!"0xb\00421\0013\0060", !1, !497}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!497 = !{!"0xb\00400\005\0056", !1, !30}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!498 = !MDLocation(line: 399, column: 12, scope: !30)
!499 = !MDLocation(line: 401, column: 13, scope: !497)
!500 = !MDLocation(line: 403, column: 14, scope: !501)
!501 = !{!"0xb\00403\0013\0057", !1, !497}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!502 = !MDLocation(line: 403, column: 13, scope: !501)
!503 = !MDLocation(line: 403, column: 13, scope: !497)
!504 = !MDLocation(line: 407, column: 16, scope: !497)
!505 = !MDLocation(line: 408, column: 13, scope: !497)
!506 = !MDLocation(line: 407, column: 9, scope: !497)
!507 = !MDLocation(line: 411, column: 13, scope: !508)
!508 = !{!"0xb\00411\0013\0058", !1, !497}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!509 = !MDLocation(line: 411, column: 13, scope: !497)
!510 = !MDLocation(line: 413, column: 23, scope: !511)
!511 = !{!"0xb\00412\009\0059", !1, !508}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!512 = !MDLocation(line: 413, column: 13, scope: !511)
!513 = !MDLocation(line: 414, column: 13, scope: !511)
!514 = !MDLocation(line: 415, column: 13, scope: !511)
!515 = !MDLocation(line: 418, column: 9, scope: !511)
!516 = !MDLocation(line: 421, column: 13, scope: !496)
!517 = !MDLocation(line: 421, column: 13, scope: !497)
!518 = !MDLocation(line: 426, column: 13, scope: !519)
!519 = !{!"0xb\00424\009\0061", !1, !496}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!520 = !MDLocation(line: 141, column: 12, scope: !30)
!521 = !MDLocation(line: 431, column: 5, scope: !30)
!522 = !MDLocation(line: 432, column: 1, scope: !30)
!523 = !MDLocation(line: 174, column: 5, scope: !206)
!524 = !MDLocation(line: 434, column: 14, scope: !74)
!525 = !MDLocation(line: 434, column: 28, scope: !74)
!526 = !MDLocation(line: 439, column: 10, scope: !74)
!527 = !MDLocation(line: 441, column: 9, scope: !91)
!528 = !MDLocation(line: 441, column: 9, scope: !74)
!529 = !MDLocation(line: 445, column: 18, scope: !530)
!530 = !{!"0xb\003", !1, !94}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!531 = !MDLocation(line: 445, column: 18, scope: !532)
!532 = !{!"0xb\005", !1, !533}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!533 = !{!"0xb\00445\0018\0070", !1, !94}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!534 = !MDLocation(line: 445, column: 18, scope: !535)
!535 = !{!"0xb\007", !1, !536}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!536 = !{!"0xb\00445\0018\0071", !1, !533}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!537 = !MDLocation(line: 445, column: 18, scope: !538)
!538 = !{!"0xb\0011", !1, !539}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!539 = !{!"0xb\00445\0018\0073", !1, !540}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!540 = !{!"0xb\00445\0018\0072", !1, !536}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!541 = !MDLocation(line: 445, column: 18, scope: !542)
!542 = !{!"0xb\0015", !1, !543}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!543 = !{!"0xb\00445\0018\0074", !1, !539}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!544 = !MDLocation(line: 443, column: 9, scope: !89)
!545 = !MDLocation(line: 443, column: 31, scope: !88)
!546 = !MDLocation(line: 443, column: 21, scope: !88)
!547 = !MDLocation(line: 445, column: 18, scope: !85)
!548 = !MDLocation(line: 445, column: 18, scope: !94)
!549 = !MDLocation(line: 445, column: 18, scope: !550)
!550 = !{!"0xb\009", !1, !540}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!551 = !MDLocation(line: 445, column: 18, scope: !536)
!552 = !MDLocation(line: 445, column: 18, scope: !553)
!553 = !{!"0xb\0013", !1, !543}                   ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!554 = !MDLocation(line: 445, column: 18, scope: !539)
!555 = !MDLocation(line: 445, column: 17, scope: !87)
!556 = !{!"0x101\00n\0016777304\000", !18, !19, !7, !557} ; [ DW_TAG_arg_variable ] [n] [line 88]
!557 = !MDLocation(line: 454, column: 24, scope: !74)
!558 = !MDLocation(line: 88, column: 34, scope: !18, inlinedAt: !557)
!559 = !{!"0x100\00codes\0090\000", !18, !19, !25, !557} ; [ DW_TAG_auto_variable ] [codes] [line 90]
!560 = !MDLocation(line: 90, column: 12, scope: !18, inlinedAt: !557)
!561 = !MDLocation(line: 92, column: 29, scope: !18, inlinedAt: !557)
!562 = !{!"0x100\00result\0092\000", !18, !19, !4, !557} ; [ DW_TAG_auto_variable ] [result] [line 92]
!563 = !MDLocation(line: 92, column: 12, scope: !18, inlinedAt: !557)
!564 = !{!"0x100\00ptr\0093\000", !18, !19, !4, !557} ; [ DW_TAG_auto_variable ] [ptr] [line 93]
!565 = !MDLocation(line: 93, column: 12, scope: !18, inlinedAt: !557)
!566 = !{!"0x100\00i\0095\000", !18, !19, !29, !557} ; [ DW_TAG_auto_variable ] [i] [line 95]
!567 = !MDLocation(line: 95, column: 9, scope: !18, inlinedAt: !557)
!568 = !MDLocation(line: 96, column: 5, scope: !140, inlinedAt: !557)
!569 = !MDLocation(line: 52, column: 5, scope: !110, inlinedAt: !570)
!570 = !MDLocation(line: 98, column: 28, scope: !144, inlinedAt: !557)
!571 = !MDLocation(line: 53, column: 9, scope: !110, inlinedAt: !570)
!572 = !{!"0x100\00k\0049\000", !110, !19, !115, !570} ; [ DW_TAG_auto_variable ] [k] [line 49]
!573 = !MDLocation(line: 49, column: 10, scope: !110, inlinedAt: !570)
!574 = !MDLocation(line: 54, column: 18, scope: !110, inlinedAt: !570)
!575 = !MDLocation(line: 54, column: 12, scope: !110, inlinedAt: !570)
!576 = !MDLocation(line: 56, column: 9, scope: !155, inlinedAt: !570)
!577 = !MDLocation(line: 57, column: 9, scope: !155, inlinedAt: !570)
!578 = !MDLocation(line: 56, column: 9, scope: !110, inlinedAt: !570)
!579 = !MDLocation(line: 59, column: 23, scope: !110, inlinedAt: !570)
!580 = !{!"0x100\00result\0050\000", !110, !19, !7, !570} ; [ DW_TAG_auto_variable ] [result] [line 50]
!581 = !MDLocation(line: 50, column: 12, scope: !110, inlinedAt: !570)
!582 = !MDLocation(line: 60, column: 5, scope: !110, inlinedAt: !570)
!583 = !MDLocation(line: 98, column: 22, scope: !144, inlinedAt: !557)
!584 = !MDLocation(line: 98, column: 9, scope: !144, inlinedAt: !557)
!585 = !MDLocation(line: 99, column: 9, scope: !144, inlinedAt: !557)
!586 = !MDLocation(line: 468, column: 9, scope: !587)
!587 = !{!"0xb\00467\005\0077", !1, !588}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!588 = !{!"0xb\00467\005\0076", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!589 = !MDLocation(line: 436, column: 9, scope: !74)
!590 = !MDLocation(line: 472, column: 12, scope: !74)
!591 = !MDLocation(line: 481, column: 5, scope: !74)
!592 = !MDLocation(line: 485, column: 17, scope: !593)
!593 = !{!"0xb\00484\009\0078", !1, !74}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/huffbench.c]
!594 = !MDLocation(line: 484, column: 9, scope: !74)
!595 = !MDLocation(line: 485, column: 9, scope: !593)
!596 = !MDLocation(line: 487, column: 9, scope: !593)
!597 = !MDLocation(line: 489, column: 12, scope: !74)
!598 = !MDLocation(line: 489, column: 5, scope: !74)
!599 = !MDLocation(line: 492, column: 5, scope: !74)
