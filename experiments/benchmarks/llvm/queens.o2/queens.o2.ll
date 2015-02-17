; ModuleID = 'queens.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, %struct.node*, i32 }
%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = common global i64 0, align 8
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
@z = common global [257 x %struct.complex] zeroinitializer, align 16
@w = common global [257 x %struct.complex] zeroinitializer, align 16
@e = common global [130 x %struct.complex] zeroinitializer, align 16
@zr = common global float 0.000000e+00, align 4
@zi = common global float 0.000000e+00, align 4
@str = private unnamed_addr constant [18 x i8] c" Error in Queens.\00"

; Function Attrs: nounwind uwtable
define void @Initrand() #0 {
entry:
  store i64 74755, i64* @seed, align 8, !dbg !134, !tbaa !135
  ret void, !dbg !139
}

; Function Attrs: nounwind uwtable
define i32 @Rand() #0 {
entry:
  %0 = load i64* @seed, align 8, !dbg !140, !tbaa !135
  %mul = mul nsw i64 %0, 1309, !dbg !140
  %add = add nsw i64 %mul, 13849, !dbg !140
  %and = and i64 %add, 65535, !dbg !141
  store i64 %and, i64* @seed, align 8, !dbg !142, !tbaa !135
  %conv = trunc i64 %and to i32, !dbg !143
  ret i32 %conv, !dbg !144
}

; Function Attrs: nounwind uwtable
define void @Try(i32 %i, i32* nocapture %q, i32* nocapture %a, i32* nocapture %b, i32* nocapture %c, i32* nocapture %x) #0 {
while.body.lr.ph:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !17, metadata !145), !dbg !146
  tail call void @llvm.dbg.value(metadata i32* %q, i64 0, metadata !18, metadata !145), !dbg !147
  tail call void @llvm.dbg.value(metadata i32* %a, i64 0, metadata !19, metadata !145), !dbg !148
  tail call void @llvm.dbg.value(metadata i32* %b, i64 0, metadata !20, metadata !145), !dbg !149
  tail call void @llvm.dbg.value(metadata i32* %c, i64 0, metadata !21, metadata !145), !dbg !150
  tail call void @llvm.dbg.value(metadata i32* %x, i64 0, metadata !22, metadata !145), !dbg !151
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !145), !dbg !152
  store i32 0, i32* %q, align 4, !dbg !153, !tbaa !154
  %sub = add i32 %i, 7, !dbg !156
  %idxprom11 = sext i32 %i to i64, !dbg !159
  %arrayidx12 = getelementptr inbounds i32* %x, i64 %idxprom11, !dbg !159
  %cmp22 = icmp slt i32 %i, 8, !dbg !161
  %add24 = add nsw i32 %i, 1, !dbg !163
  br label %while.body, !dbg !165

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %indvars.iv = phi i64 [ 0, %while.body.lr.ph ], [ %indvars.iv.next, %while.cond.backedge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !165
  store i32 0, i32* %q, align 4, !dbg !166, !tbaa !154
  %arrayidx = getelementptr inbounds i32* %b, i64 %indvars.iv.next, !dbg !167
  %0 = load i32* %arrayidx, align 4, !dbg !167, !tbaa !154
  %tobool1 = icmp eq i32 %0, 0, !dbg !168
  br i1 %tobool1, label %while.cond.backedge, label %land.lhs.true, !dbg !168

land.lhs.true:                                    ; preds = %while.body
  %1 = add nsw i64 %indvars.iv.next, %idxprom11, !dbg !169
  %arrayidx4 = getelementptr inbounds i32* %a, i64 %1, !dbg !170
  %2 = load i32* %arrayidx4, align 4, !dbg !170, !tbaa !154
  %tobool5 = icmp eq i32 %2, 0, !dbg !168
  br i1 %tobool5, label %while.cond.backedge, label %land.lhs.true6, !dbg !168

land.lhs.true6:                                   ; preds = %land.lhs.true
  %3 = xor i64 %indvars.iv, 4294967295
  %4 = trunc i64 %3 to i32, !dbg !156
  %add7 = add i32 %sub, %4, !dbg !156
  %idxprom8 = sext i32 %add7 to i64, !dbg !171
  %arrayidx9 = getelementptr inbounds i32* %c, i64 %idxprom8, !dbg !171
  %5 = load i32* %arrayidx9, align 4, !dbg !171, !tbaa !154
  %tobool10 = icmp eq i32 %5, 0, !dbg !168
  br i1 %tobool10, label %while.cond.backedge, label %if.then, !dbg !168

if.then:                                          ; preds = %land.lhs.true6
  %6 = trunc i64 %indvars.iv.next to i32, !dbg !159
  store i32 %6, i32* %arrayidx12, align 4, !dbg !159, !tbaa !154
  store i32 0, i32* %arrayidx, align 4, !dbg !172, !tbaa !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !173, !tbaa !154
  store i32 0, i32* %arrayidx9, align 4, !dbg !174, !tbaa !154
  br i1 %cmp22, label %if.then23, label %if.else, !dbg !175

if.then23:                                        ; preds = %if.then
  tail call void @Try(i32 %add24, i32* %q, i32* %a, i32* %b, i32* %c, i32* %x), !dbg !176
  %7 = load i32* %q, align 4, !dbg !177, !tbaa !154
  %tobool25 = icmp eq i32 %7, 0, !dbg !179
  br i1 %tobool25, label %if.then26, label %while.end.loopexit, !dbg !179

if.then26:                                        ; preds = %if.then23
  store i32 1, i32* %arrayidx, align 4, !dbg !180, !tbaa !154
  store i32 1, i32* %arrayidx4, align 4, !dbg !182, !tbaa !154
  store i32 1, i32* %arrayidx9, align 4, !dbg !183, !tbaa !154
  %.pre = load i32* %q, align 4, !dbg !184, !tbaa !154
  br label %while.cond.backedge, !dbg !185

if.else:                                          ; preds = %if.then
  store i32 1, i32* %q, align 4, !dbg !186, !tbaa !154
  br label %while.end

while.cond.backedge:                              ; preds = %if.then26, %while.body, %land.lhs.true, %land.lhs.true6
  %8 = phi i32 [ %.pre, %if.then26 ], [ 0, %while.body ], [ 0, %land.lhs.true ], [ 0, %land.lhs.true6 ]
  %tobool = icmp eq i32 %8, 0, !dbg !165
  %9 = trunc i64 %indvars.iv.next to i32, !dbg !187
  %cmp = icmp ne i32 %9, 8, !dbg !187
  %or.cond = and i1 %cmp, %tobool, !dbg !165
  br i1 %or.cond, label %while.body, label %while.end.loopexit, !dbg !165

while.end.loopexit:                               ; preds = %while.cond.backedge, %if.then23
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.else
  ret void, !dbg !189
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @Doit() #0 {
entry:
  %q = alloca i32, align 4
  %a = alloca [9 x i32], align 16
  %b = alloca [17 x i32], align 16
  %c = alloca [15 x i32], align 16
  %x = alloca [9 x i32], align 16
  %0 = bitcast [9 x i32]* %a to i8*, !dbg !190
  call void @llvm.lifetime.start(i64 36, i8* %0) #2, !dbg !190
  tail call void @llvm.dbg.declare(metadata [9 x i32]* %a, metadata !28, metadata !145), !dbg !191
  %1 = bitcast [17 x i32]* %b to i8*, !dbg !190
  call void @llvm.lifetime.start(i64 68, i8* %1) #2, !dbg !190
  tail call void @llvm.dbg.declare(metadata [17 x i32]* %b, metadata !32, metadata !145), !dbg !192
  %2 = bitcast [15 x i32]* %c to i8*, !dbg !190
  call void @llvm.lifetime.start(i64 60, i8* %2) #2, !dbg !190
  tail call void @llvm.dbg.declare(metadata [15 x i32]* %c, metadata !36, metadata !145), !dbg !193
  %3 = bitcast [9 x i32]* %x to i8*, !dbg !190
  call void @llvm.lifetime.start(i64 36, i8* %3) #2, !dbg !190
  tail call void @llvm.dbg.declare(metadata [9 x i32]* %x, metadata !40, metadata !145), !dbg !194
  tail call void @llvm.dbg.value(metadata i32 -7, i64 0, metadata !26, metadata !145), !dbg !195
  br label %while.body, !dbg !196

while.body:                                       ; preds = %if.end12, %entry
  %indvars.iv = phi i64 [ -7, %entry ], [ %indvars.iv.next, %if.end12 ]
  %4 = add i64 %indvars.iv, 4294967295, !dbg !197
  %5 = trunc i64 %4 to i32, !dbg !197
  %6 = icmp ult i32 %5, 8, !dbg !197
  br i1 %6, label %if.then, label %if.end, !dbg !197

if.then:                                          ; preds = %while.body
  %arrayidx = getelementptr inbounds [9 x i32]* %a, i64 0, i64 %indvars.iv, !dbg !199
  store i32 1, i32* %arrayidx, align 4, !dbg !199, !tbaa !154
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %while.body
  %cmp3 = icmp sgt i64 %indvars.iv, 1, !dbg !201
  br i1 %cmp3, label %if.end7, label %if.then9, !dbg !203

if.end7:                                          ; preds = %if.end
  %arrayidx6 = getelementptr inbounds [17 x i32]* %b, i64 0, i64 %indvars.iv, !dbg !204
  store i32 1, i32* %arrayidx6, align 4, !dbg !204, !tbaa !154
  %cmp8 = icmp slt i64 %indvars.iv, 8, !dbg !205
  br i1 %cmp8, label %if.then9, label %if.end12, !dbg !207

if.then9:                                         ; preds = %if.end, %if.end7
  %7 = add nsw i64 %indvars.iv, 7, !dbg !208
  %arrayidx11 = getelementptr inbounds [15 x i32]* %c, i64 0, i64 %7, !dbg !210
  store i32 1, i32* %arrayidx11, align 4, !dbg !210, !tbaa !154
  br label %if.end12, !dbg !210

if.end12:                                         ; preds = %if.then9, %if.end7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !196
  %exitcond = icmp eq i64 %indvars.iv.next, 17, !dbg !196
  br i1 %exitcond, label %while.end, label %while.body, !dbg !196

while.end:                                        ; preds = %if.end12
  %arraydecay = getelementptr inbounds [17 x i32]* %b, i64 0, i64 0, !dbg !211
  %arraydecay14 = getelementptr inbounds [9 x i32]* %a, i64 0, i64 0, !dbg !212
  %arraydecay15 = getelementptr inbounds [15 x i32]* %c, i64 0, i64 0, !dbg !213
  %arraydecay16 = getelementptr inbounds [9 x i32]* %x, i64 0, i64 0, !dbg !214
  tail call void @llvm.dbg.value(metadata i32* %q, i64 0, metadata !27, metadata !145), !dbg !215
  call void @Try(i32 1, i32* %q, i32* %arraydecay, i32* %arraydecay14, i32* %arraydecay15, i32* %arraydecay16), !dbg !216
  tail call void @llvm.dbg.value(metadata i32* %q, i64 0, metadata !27, metadata !145), !dbg !215
  %8 = load i32* %q, align 4, !dbg !217, !tbaa !154
  %tobool = icmp eq i32 %8, 0, !dbg !219
  br i1 %tobool, label %if.then17, label %if.end18, !dbg !219

if.then17:                                        ; preds = %while.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !220
  br label %if.end18, !dbg !220

if.end18:                                         ; preds = %while.end, %if.then17
  call void @llvm.lifetime.end(i64 36, i8* %3) #2, !dbg !222
  call void @llvm.lifetime.end(i64 60, i8* %2) #2, !dbg !222
  call void @llvm.lifetime.end(i64 68, i8* %1) #2, !dbg !222
  call void @llvm.lifetime.end(i64 36, i8* %0) #2, !dbg !222
  ret void, !dbg !222
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @Queens(i32 %run) #0 {
entry:
  %q.i = alloca i32, align 4
  %a.i = alloca [9 x i32], align 16
  %b.i = alloca [17 x i32], align 16
  %c.i = alloca [15 x i32], align 16
  %x.i = alloca [9 x i32], align 16
  tail call void @llvm.dbg.value(metadata i32 %run, i64 0, metadata !45, metadata !145), !dbg !223
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !46, metadata !145), !dbg !224
  %0 = bitcast i32* %q.i to i8*, !dbg !225
  %1 = bitcast [9 x i32]* %a.i to i8*, !dbg !225
  %2 = bitcast [17 x i32]* %b.i to i8*, !dbg !225
  %3 = bitcast [15 x i32]* %c.i to i8*, !dbg !225
  %4 = bitcast [9 x i32]* %x.i to i8*, !dbg !225
  %arraydecay.i = getelementptr inbounds [17 x i32]* %b.i, i64 0, i64 0, !dbg !230
  %arraydecay14.i = getelementptr inbounds [9 x i32]* %a.i, i64 0, i64 0, !dbg !231
  %arraydecay15.i = getelementptr inbounds [15 x i32]* %c.i, i64 0, i64 0, !dbg !232
  %arraydecay16.i = getelementptr inbounds [9 x i32]* %x.i, i64 0, i64 0, !dbg !233
  br label %for.body, !dbg !234

for.body:                                         ; preds = %Doit.exit, %entry
  %i.02 = phi i32 [ 1, %entry ], [ %inc, %Doit.exit ]
  call void @llvm.lifetime.start(i64 4, i8* %0), !dbg !225
  call void @llvm.lifetime.start(i64 36, i8* %1) #2, !dbg !225
  tail call void @llvm.dbg.declare(metadata [9 x i32]* %a.i, metadata !235, metadata !145) #2, !dbg !236
  call void @llvm.lifetime.start(i64 68, i8* %2) #2, !dbg !225
  tail call void @llvm.dbg.declare(metadata [17 x i32]* %b.i, metadata !237, metadata !145) #2, !dbg !238
  call void @llvm.lifetime.start(i64 60, i8* %3) #2, !dbg !225
  tail call void @llvm.dbg.declare(metadata [15 x i32]* %c.i, metadata !239, metadata !145) #2, !dbg !240
  call void @llvm.lifetime.start(i64 36, i8* %4) #2, !dbg !225
  tail call void @llvm.dbg.declare(metadata [9 x i32]* %x.i, metadata !241, metadata !145) #2, !dbg !242
  tail call void @llvm.dbg.value(metadata i32 -7, i64 0, metadata !243, metadata !145) #2, !dbg !244
  br label %while.body.i, !dbg !245

while.body.i:                                     ; preds = %if.end12.i, %for.body
  %indvars.iv.i = phi i64 [ -7, %for.body ], [ %indvars.iv.next.i, %if.end12.i ], !dbg !226
  %5 = add nsw i64 %indvars.iv.i, 4294967295, !dbg !246
  %6 = trunc i64 %5 to i32, !dbg !246
  %7 = icmp ult i32 %6, 8, !dbg !246
  br i1 %7, label %if.then.i, label %if.end.i, !dbg !246

if.then.i:                                        ; preds = %while.body.i
  %arrayidx.i = getelementptr inbounds [9 x i32]* %a.i, i64 0, i64 %indvars.iv.i, !dbg !247
  store i32 1, i32* %arrayidx.i, align 4, !dbg !247, !tbaa !154
  br label %if.end.i, !dbg !247

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %cmp3.i = icmp sgt i64 %indvars.iv.i, 1, !dbg !248
  br i1 %cmp3.i, label %if.end7.i, label %if.then9.i, !dbg !249

if.end7.i:                                        ; preds = %if.end.i
  %arrayidx6.i = getelementptr inbounds [17 x i32]* %b.i, i64 0, i64 %indvars.iv.i, !dbg !250
  store i32 1, i32* %arrayidx6.i, align 4, !dbg !250, !tbaa !154
  %cmp8.i = icmp slt i64 %indvars.iv.i, 8, !dbg !251
  br i1 %cmp8.i, label %if.then9.i, label %if.end12.i, !dbg !252

if.then9.i:                                       ; preds = %if.end7.i, %if.end.i
  %8 = add nsw i64 %indvars.iv.i, 7, !dbg !253
  %arrayidx11.i = getelementptr inbounds [15 x i32]* %c.i, i64 0, i64 %8, !dbg !254
  store i32 1, i32* %arrayidx11.i, align 4, !dbg !254, !tbaa !154
  br label %if.end12.i, !dbg !254

if.end12.i:                                       ; preds = %if.then9.i, %if.end7.i
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, 1, !dbg !245
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 17, !dbg !245
  br i1 %exitcond.i, label %while.end.i, label %while.body.i, !dbg !245

while.end.i:                                      ; preds = %if.end12.i
  tail call void @llvm.dbg.value(metadata i32* %q.i, i64 0, metadata !255, metadata !145) #2, !dbg !256
  call void @Try(i32 1, i32* %q.i, i32* %arraydecay.i, i32* %arraydecay14.i, i32* %arraydecay15.i, i32* %arraydecay16.i) #2, !dbg !257
  tail call void @llvm.dbg.value(metadata i32* %q.i, i64 0, metadata !255, metadata !145) #2, !dbg !256
  %9 = load i32* %q.i, align 4, !dbg !258, !tbaa !154
  %tobool.i = icmp eq i32 %9, 0, !dbg !259
  br i1 %tobool.i, label %if.then17.i, label %Doit.exit, !dbg !259

if.then17.i:                                      ; preds = %while.end.i
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)) #2, !dbg !260
  br label %Doit.exit, !dbg !260

Doit.exit:                                        ; preds = %while.end.i, %if.then17.i
  call void @llvm.lifetime.end(i64 36, i8* %4) #2, !dbg !261
  call void @llvm.lifetime.end(i64 60, i8* %3) #2, !dbg !261
  call void @llvm.lifetime.end(i64 68, i8* %2) #2, !dbg !261
  call void @llvm.lifetime.end(i64 36, i8* %1) #2, !dbg !261
  call void @llvm.lifetime.end(i64 4, i8* %0), !dbg !261
  %inc = add nuw nsw i32 %i.02, 1, !dbg !262
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !46, metadata !145), !dbg !224
  %exitcond = icmp eq i32 %inc, 51, !dbg !234
  br i1 %exitcond, label %for.end, label %for.body, !dbg !234

for.end:                                          ; preds = %Doit.exit
  %add = add nsw i32 %run, 1, !dbg !264
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %add) #2, !dbg !265
  ret void, !dbg !266
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !49, metadata !145), !dbg !267
  br label %for.body, !dbg !268

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @Queens(i32 %i.03), !dbg !270
  %inc = add nuw nsw i32 %i.03, 1, !dbg !272
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !49, metadata !145), !dbg !267
  %exitcond = icmp eq i32 %inc, 100, !dbg !268
  br i1 %exitcond, label %for.end, label %for.body, !dbg !268

for.end:                                          ; preds = %for.body
  ret i32 0, !dbg !274
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!131, !132}
!llvm.ident = !{!133}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !5, !50, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c] [DW_LANG_C99]
!1 = !{!"queens.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!6, !10, !12, !24, !41, !47}
!6 = !{!"0x2e\00Initrand\00Initrand\00\00115\000\001\000\000\000\001\00115", !1, !7, !8, null, void ()* @Initrand, null, null, !2} ; [ DW_TAG_subprogram ] [line 115] [def] [Initrand]
!7 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!8 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !9, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = !{null}
!10 = !{!"0x2e\00Rand\00Rand\00\00119\000\001\000\000\000\001\00119", !1, !7, !11, null, i32 ()* @Rand, null, null, !2} ; [ DW_TAG_subprogram ] [line 119] [def] [Rand]
!11 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !3, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = !{!"0x2e\00Try\00Try\00\00137\000\001\000\000\00256\001\00137", !1, !7, !13, null, void (i32, i32*, i32*, i32*, i32*, i32*)* @Try, null, null, !16} ; [ DW_TAG_subprogram ] [line 137] [def] [Try]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !4, !15, !15, !15, !15, !15}
!15 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = !{!17, !18, !19, !20, !21, !22, !23}
!17 = !{!"0x101\00i\0016777353\000", !12, !7, !4} ; [ DW_TAG_arg_variable ] [i] [line 137]
!18 = !{!"0x101\00q\0033554569\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [q] [line 137]
!19 = !{!"0x101\00a\0050331785\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [a] [line 137]
!20 = !{!"0x101\00b\0067109001\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [b] [line 137]
!21 = !{!"0x101\00c\0083886217\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [c] [line 137]
!22 = !{!"0x101\00x\00100663433\000", !12, !7, !15} ; [ DW_TAG_arg_variable ] [x] [line 137]
!23 = !{!"0x100\00j\00138\000", !12, !7, !4}      ; [ DW_TAG_auto_variable ] [j] [line 138]
!24 = !{!"0x2e\00Doit\00Doit\00\00162\000\001\000\000\000\001\00162", !1, !7, !8, null, void ()* @Doit, null, null, !25} ; [ DW_TAG_subprogram ] [line 162] [def] [Doit]
!25 = !{!26, !27, !28, !32, !36, !40}
!26 = !{!"0x100\00i\00163\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 163]
!27 = !{!"0x100\00q\00163\000", !24, !7, !4}      ; [ DW_TAG_auto_variable ] [q] [line 163]
!28 = !{!"0x100\00a\00164\000", !24, !7, !29}     ; [ DW_TAG_auto_variable ] [a] [line 164]
!29 = !{!"0x1\00\000\00288\0032\000\000\000", null, null, !4, !30, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from int]
!30 = !{!31}
!31 = !{!"0x21\000\009"}                          ; [ DW_TAG_subrange_type ] [0, 8]
!32 = !{!"0x100\00b\00164\000", !24, !7, !33}     ; [ DW_TAG_auto_variable ] [b] [line 164]
!33 = !{!"0x1\00\000\00544\0032\000\000\000", null, null, !4, !34, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 544, align 32, offset 0] [from int]
!34 = !{!35}
!35 = !{!"0x21\000\0017"}                         ; [ DW_TAG_subrange_type ] [0, 16]
!36 = !{!"0x100\00c\00164\000", !24, !7, !37}     ; [ DW_TAG_auto_variable ] [c] [line 164]
!37 = !{!"0x1\00\000\00480\0032\000\000\000", null, null, !4, !38, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 480, align 32, offset 0] [from int]
!38 = !{!39}
!39 = !{!"0x21\000\0015"}                         ; [ DW_TAG_subrange_type ] [0, 14]
!40 = !{!"0x100\00x\00164\000", !24, !7, !29}     ; [ DW_TAG_auto_variable ] [x] [line 164]
!41 = !{!"0x2e\00Queens\00Queens\00\00177\000\001\000\000\00256\001\00177", !1, !7, !42, null, void (i32)* @Queens, null, null, !44} ; [ DW_TAG_subprogram ] [line 177] [def] [Queens]
!42 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !43, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = !{null, !4}
!44 = !{!45, !46}
!45 = !{!"0x101\00run\0016777393\000", !41, !7, !4} ; [ DW_TAG_arg_variable ] [run] [line 177]
!46 = !{!"0x100\00i\00178\000", !41, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 178]
!47 = !{!"0x2e\00main\00main\00\00183\000\001\000\000\000\001\00184", !1, !7, !11, null, i32 ()* @main, null, null, !48} ; [ DW_TAG_subprogram ] [line 183] [def] [scope 184] [main]
!48 = !{!49}
!49 = !{!"0x100\00i\00185\000", !47, !7, !4}      ; [ DW_TAG_auto_variable ] [i] [line 185]
!50 = !{!51, !53, !54, !55, !57, !61, !63, !70, !74, !82, !83, !84, !88, !89, !90, !92, !93, !94, !95, !99, !100, !104, !107, !108, !109, !113, !114, !115, !116, !124, !125, !129, !130}
!51 = !{!"0x34\00value\00value\00\0081\000\001", null, !7, !52, float* @value, null} ; [ DW_TAG_variable ] [value] [line 81] [def]
!52 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!53 = !{!"0x34\00fixed\00fixed\00\0081\000\001", null, !7, !52, float* @fixed, null} ; [ DW_TAG_variable ] [fixed] [line 81] [def]
!54 = !{!"0x34\00floated\00floated\00\0081\000\001", null, !7, !52, float* @floated, null} ; [ DW_TAG_variable ] [floated] [line 81] [def]
!55 = !{!"0x34\00seed\00seed\00\0084\000\001", null, !7, !56, i64* @seed, null} ; [ DW_TAG_variable ] [seed] [line 84] [def]
!56 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!57 = !{!"0x34\00permarray\00permarray\00\0087\000\001", null, !7, !58, [11 x i32]* @permarray, null} ; [ DW_TAG_variable ] [permarray] [line 87] [def]
!58 = !{!"0x1\00\000\00352\0032\000\000\000", null, null, !4, !59, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 352, align 32, offset 0] [from int]
!59 = !{!60}
!60 = !{!"0x21\000\0011"}                         ; [ DW_TAG_subrange_type ] [0, 10]
!61 = !{!"0x34\00pctr\00pctr\00\0089\000\001", null, !7, !62, i32* @pctr, null} ; [ DW_TAG_variable ] [pctr] [line 89] [def]
!62 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!63 = !{!"0x34\00tree\00tree\00\0092\000\001", null, !7, !64, %struct.node** @tree, null} ; [ DW_TAG_variable ] [tree] [line 92] [def]
!64 = !{!"0xf\00\000\0064\0064\000\000", null, null, !65} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from node]
!65 = !{!"0x13\00node\0045\00192\0064\000\000\000", !1, null, null, !66, null, null, null} ; [ DW_TAG_structure_type ] [node] [line 45, size 192, align 64, offset 0] [def] [from ]
!66 = !{!67, !68, !69}
!67 = !{!"0xd\00left\0046\0064\0064\000\000", !1, !65, !64} ; [ DW_TAG_member ] [left] [line 46, size 64, align 64, offset 0] [from ]
!68 = !{!"0xd\00right\0046\0064\0064\0064\000", !1, !65, !64} ; [ DW_TAG_member ] [right] [line 46, size 64, align 64, offset 64] [from ]
!69 = !{!"0xd\00val\0047\0032\0032\00128\000", !1, !65, !4} ; [ DW_TAG_member ] [val] [line 47, size 32, align 32, offset 128] [from int]
!70 = !{!"0x34\00stack\00stack\00\0095\000\001", null, !7, !71, [4 x i32]* @stack, null} ; [ DW_TAG_variable ] [stack] [line 95] [def]
!71 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !4, !72, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from int]
!72 = !{!73}
!73 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!74 = !{!"0x34\00cellspace\00cellspace\00\0096\000\001", null, !7, !75, [19 x %struct.element]* @cellspace, null} ; [ DW_TAG_variable ] [cellspace] [line 96] [def]
!75 = !{!"0x1\00\000\001216\0032\000\000\000", null, null, !76, !80, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1216, align 32, offset 0] [from element]
!76 = !{!"0x13\00element\0054\0064\0032\000\000\000", !1, null, null, !77, null, null, null} ; [ DW_TAG_structure_type ] [element] [line 54, size 64, align 32, offset 0] [def] [from ]
!77 = !{!78, !79}
!78 = !{!"0xd\00discsize\0055\0032\0032\000\000", !1, !76, !4} ; [ DW_TAG_member ] [discsize] [line 55, size 32, align 32, offset 0] [from int]
!79 = !{!"0xd\00next\0056\0032\0032\0032\000", !1, !76, !4} ; [ DW_TAG_member ] [next] [line 56, size 32, align 32, offset 32] [from int]
!80 = !{!81}
!81 = !{!"0x21\000\0019"}                         ; [ DW_TAG_subrange_type ] [0, 18]
!82 = !{!"0x34\00freelist\00freelist\00\0097\000\001", null, !7, !4, i32* @freelist, null} ; [ DW_TAG_variable ] [freelist] [line 97] [def]
!83 = !{!"0x34\00movesdone\00movesdone\00\0097\000\001", null, !7, !4, i32* @movesdone, null} ; [ DW_TAG_variable ] [movesdone] [line 97] [def]
!84 = !{!"0x34\00ima\00ima\00\00101\000\001", null, !7, !85, [41 x [41 x i32]]* @ima, null} ; [ DW_TAG_variable ] [ima] [line 101] [def]
!85 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !4, !86, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from int]
!86 = !{!87, !87}
!87 = !{!"0x21\000\0041"}                         ; [ DW_TAG_subrange_type ] [0, 40]
!88 = !{!"0x34\00imb\00imb\00\00101\000\001", null, !7, !85, [41 x [41 x i32]]* @imb, null} ; [ DW_TAG_variable ] [imb] [line 101] [def]
!89 = !{!"0x34\00imr\00imr\00\00101\000\001", null, !7, !85, [41 x [41 x i32]]* @imr, null} ; [ DW_TAG_variable ] [imr] [line 101] [def]
!90 = !{!"0x34\00rma\00rma\00\00102\000\001", null, !7, !91, [41 x [41 x float]]* @rma, null} ; [ DW_TAG_variable ] [rma] [line 102] [def]
!91 = !{!"0x1\00\000\0053792\0032\000\000\000", null, null, !52, !86, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 53792, align 32, offset 0] [from float]
!92 = !{!"0x34\00rmb\00rmb\00\00102\000\001", null, !7, !91, [41 x [41 x float]]* @rmb, null} ; [ DW_TAG_variable ] [rmb] [line 102] [def]
!93 = !{!"0x34\00rmr\00rmr\00\00102\000\001", null, !7, !91, [41 x [41 x float]]* @rmr, null} ; [ DW_TAG_variable ] [rmr] [line 102] [def]
!94 = !{!"0x34\00piececount\00piececount\00\00105\000\001", null, !7, !71, [4 x i32]* @piececount, null} ; [ DW_TAG_variable ] [piececount] [line 105] [def]
!95 = !{!"0x34\00class\00class\00\00105\000\001", null, !7, !96, [13 x i32]* @class, null} ; [ DW_TAG_variable ] [class] [line 105] [def]
!96 = !{!"0x1\00\000\00416\0032\000\000\000", null, null, !4, !97, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 416, align 32, offset 0] [from int]
!97 = !{!98}
!98 = !{!"0x21\000\0013"}                         ; [ DW_TAG_subrange_type ] [0, 12]
!99 = !{!"0x34\00piecemax\00piecemax\00\00105\000\001", null, !7, !96, [13 x i32]* @piecemax, null} ; [ DW_TAG_variable ] [piecemax] [line 105] [def]
!100 = !{!"0x34\00puzzl\00puzzl\00\00106\000\001", null, !7, !101, [512 x i32]* @puzzl, null} ; [ DW_TAG_variable ] [puzzl] [line 106] [def]
!101 = !{!"0x1\00\000\0016384\0032\000\000\000", null, null, !4, !102, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from int]
!102 = !{!103}
!103 = !{!"0x21\000\00512"}                       ; [ DW_TAG_subrange_type ] [0, 511]
!104 = !{!"0x34\00p\00p\00\00106\000\001", null, !7, !105, [13 x [512 x i32]]* @p, null} ; [ DW_TAG_variable ] [p] [line 106] [def]
!105 = !{!"0x1\00\000\00212992\0032\000\000\000", null, null, !4, !106, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 212992, align 32, offset 0] [from int]
!106 = !{!98, !103}
!107 = !{!"0x34\00n\00n\00\00106\000\001", null, !7, !4, i32* @n, null} ; [ DW_TAG_variable ] [n] [line 106] [def]
!108 = !{!"0x34\00kount\00kount\00\00106\000\001", null, !7, !4, i32* @kount, null} ; [ DW_TAG_variable ] [kount] [line 106] [def]
!109 = !{!"0x34\00sortlist\00sortlist\00\00109\000\001", null, !7, !110, [5001 x i32]* @sortlist, null} ; [ DW_TAG_variable ] [sortlist] [line 109] [def]
!110 = !{!"0x1\00\000\00160032\0032\000\000\000", null, null, !4, !111, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160032, align 32, offset 0] [from int]
!111 = !{!112}
!112 = !{!"0x21\000\005001"}                      ; [ DW_TAG_subrange_type ] [0, 5000]
!113 = !{!"0x34\00biggest\00biggest\00\00109\000\001", null, !7, !4, i32* @biggest, null} ; [ DW_TAG_variable ] [biggest] [line 109] [def]
!114 = !{!"0x34\00littlest\00littlest\00\00109\000\001", null, !7, !4, i32* @littlest, null} ; [ DW_TAG_variable ] [littlest] [line 109] [def]
!115 = !{!"0x34\00top\00top\00\00109\000\001", null, !7, !4, i32* @top, null} ; [ DW_TAG_variable ] [top] [line 109] [def]
!116 = !{!"0x34\00z\00z\00\00112\000\001", null, !7, !117, [257 x %struct.complex]* @z, null} ; [ DW_TAG_variable ] [z] [line 112] [def]
!117 = !{!"0x1\00\000\0016448\0032\000\000\000", null, null, !118, !122, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16448, align 32, offset 0] [from complex]
!118 = !{!"0x13\00complex\0075\0064\0032\000\000\000", !1, null, null, !119, null, null, null} ; [ DW_TAG_structure_type ] [complex] [line 75, size 64, align 32, offset 0] [def] [from ]
!119 = !{!120, !121}
!120 = !{!"0xd\00rp\0075\0032\0032\000\000", !1, !118, !52} ; [ DW_TAG_member ] [rp] [line 75, size 32, align 32, offset 0] [from float]
!121 = !{!"0xd\00ip\0075\0032\0032\0032\000", !1, !118, !52} ; [ DW_TAG_member ] [ip] [line 75, size 32, align 32, offset 32] [from float]
!122 = !{!123}
!123 = !{!"0x21\000\00257"}                       ; [ DW_TAG_subrange_type ] [0, 256]
!124 = !{!"0x34\00w\00w\00\00112\000\001", null, !7, !117, [257 x %struct.complex]* @w, null} ; [ DW_TAG_variable ] [w] [line 112] [def]
!125 = !{!"0x34\00e\00e\00\00112\000\001", null, !7, !126, [130 x %struct.complex]* @e, null} ; [ DW_TAG_variable ] [e] [line 112] [def]
!126 = !{!"0x1\00\000\008320\0032\000\000\000", null, null, !118, !127, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8320, align 32, offset 0] [from complex]
!127 = !{!128}
!128 = !{!"0x21\000\00130"}                       ; [ DW_TAG_subrange_type ] [0, 129]
!129 = !{!"0x34\00zr\00zr\00\00113\000\001", null, !7, !52, float* @zr, null} ; [ DW_TAG_variable ] [zr] [line 113] [def]
!130 = !{!"0x34\00zi\00zi\00\00113\000\001", null, !7, !52, float* @zi, null} ; [ DW_TAG_variable ] [zi] [line 113] [def]
!131 = !{i32 2, !"Dwarf Version", i32 4}
!132 = !{i32 2, !"Debug Info Version", i32 2}
!133 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!134 = !MDLocation(line: 116, column: 5, scope: !6)
!135 = !{!136, !136, i64 0}
!136 = !{!"long", !137, i64 0}
!137 = !{!"omnipotent char", !138, i64 0}
!138 = !{!"Simple C/C++ TBAA"}
!139 = !MDLocation(line: 117, column: 1, scope: !6)
!140 = !MDLocation(line: 120, column: 13, scope: !10)
!141 = !MDLocation(line: 120, column: 12, scope: !10)
!142 = !MDLocation(line: 120, column: 5, scope: !10)
!143 = !MDLocation(line: 121, column: 13, scope: !10)
!144 = !MDLocation(line: 121, column: 5, scope: !10)
!145 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!146 = !MDLocation(line: 137, column: 14, scope: !12)
!147 = !MDLocation(line: 137, column: 22, scope: !12)
!148 = !MDLocation(line: 137, column: 29, scope: !12)
!149 = !MDLocation(line: 137, column: 38, scope: !12)
!150 = !MDLocation(line: 137, column: 47, scope: !12)
!151 = !MDLocation(line: 137, column: 56, scope: !12)
!152 = !MDLocation(line: 138, column: 10, scope: !12)
!153 = !MDLocation(line: 140, column: 2, scope: !12)
!154 = !{!155, !155, i64 0}
!155 = !{!"int", !137, i64 0}
!156 = !MDLocation(line: 144, column: 28, scope: !157)
!157 = !{!"0xb\00144\008\001", !1, !158}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!158 = !{!"0xb\00141\0031\000", !1, !12}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!159 = !MDLocation(line: 145, column: 4, scope: !160)
!160 = !{!"0xb\00144\0037\002", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!161 = !MDLocation(line: 149, column: 12, scope: !162)
!162 = !{!"0xb\00149\0012\003", !1, !160}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!163 = !MDLocation(line: 150, column: 12, scope: !164)
!164 = !{!"0xb\00149\0020\004", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!165 = !MDLocation(line: 141, column: 10, scope: !12)
!166 = !MDLocation(line: 143, column: 3, scope: !158)
!167 = !MDLocation(line: 144, column: 8, scope: !157)
!168 = !MDLocation(line: 144, column: 8, scope: !158)
!169 = !MDLocation(line: 144, column: 18, scope: !157)
!170 = !MDLocation(line: 144, column: 16, scope: !157)
!171 = !MDLocation(line: 144, column: 26, scope: !157)
!172 = !MDLocation(line: 146, column: 7, scope: !160)
!173 = !MDLocation(line: 147, column: 7, scope: !160)
!174 = !MDLocation(line: 148, column: 7, scope: !160)
!175 = !MDLocation(line: 149, column: 12, scope: !160)
!176 = !MDLocation(line: 150, column: 8, scope: !164)
!177 = !MDLocation(line: 151, column: 12, scope: !178)
!178 = !{!"0xb\00151\0010\005", !1, !164}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!179 = !MDLocation(line: 151, column: 10, scope: !164)
!180 = !MDLocation(line: 152, column: 6, scope: !181)
!181 = !{!"0xb\00151\0017\006", !1, !178}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!182 = !MDLocation(line: 153, column: 9, scope: !181)
!183 = !MDLocation(line: 154, column: 9, scope: !181)
!184 = !MDLocation(line: 141, column: 13, scope: !12)
!185 = !MDLocation(line: 155, column: 5, scope: !181)
!186 = !MDLocation(line: 157, column: 12, scope: !162)
!187 = !MDLocation(line: 141, column: 21, scope: !188)
!188 = !{!"0xb\003", !1, !12}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!189 = !MDLocation(line: 160, column: 1, scope: !12)
!190 = !MDLocation(line: 164, column: 2, scope: !24)
!191 = !MDLocation(line: 164, column: 6, scope: !24)
!192 = !MDLocation(line: 164, column: 12, scope: !24)
!193 = !MDLocation(line: 164, column: 19, scope: !24)
!194 = !MDLocation(line: 164, column: 26, scope: !24)
!195 = !MDLocation(line: 163, column: 6, scope: !24)
!196 = !MDLocation(line: 166, column: 2, scope: !24)
!197 = !MDLocation(line: 167, column: 8, scope: !198)
!198 = !{!"0xb\00166\0020\007", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!199 = !MDLocation(line: 167, column: 31, scope: !200)
!200 = !{!"0xb\00167\008\008", !1, !198}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!201 = !MDLocation(line: 168, column: 11, scope: !202)
!202 = !{!"0xb\00168\0011\009", !1, !198}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!203 = !MDLocation(line: 168, column: 11, scope: !198)
!204 = !MDLocation(line: 168, column: 20, scope: !202)
!205 = !MDLocation(line: 169, column: 11, scope: !206)
!206 = !{!"0xb\00169\0011\0010", !1, !198}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!207 = !MDLocation(line: 169, column: 11, scope: !198)
!208 = !MDLocation(line: 169, column: 22, scope: !209)
!209 = !{!"0xb\001", !1, !206}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!210 = !MDLocation(line: 169, column: 20, scope: !206)
!211 = !MDLocation(line: 173, column: 13, scope: !24)
!212 = !MDLocation(line: 173, column: 16, scope: !24)
!213 = !MDLocation(line: 173, column: 19, scope: !24)
!214 = !MDLocation(line: 173, column: 22, scope: !24)
!215 = !MDLocation(line: 163, column: 8, scope: !24)
!216 = !MDLocation(line: 173, column: 2, scope: !24)
!217 = !MDLocation(line: 174, column: 8, scope: !218)
!218 = !{!"0xb\00174\007\0011", !1, !24}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!219 = !MDLocation(line: 174, column: 7, scope: !24)
!220 = !MDLocation(line: 174, column: 12, scope: !221)
!221 = !{!"0xb\001", !1, !218}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!222 = !MDLocation(line: 175, column: 1, scope: !24)
!223 = !MDLocation(line: 177, column: 18, scope: !41)
!224 = !MDLocation(line: 178, column: 9, scope: !41)
!225 = !MDLocation(line: 164, column: 2, scope: !24, inlinedAt: !226)
!226 = !MDLocation(line: 179, column: 33, scope: !227)
!227 = !{!"0xb\002", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!228 = !{!"0xb\00179\005\0013", !1, !229}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!229 = !{!"0xb\00179\005\0012", !1, !41}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!230 = !MDLocation(line: 173, column: 13, scope: !24, inlinedAt: !226)
!231 = !MDLocation(line: 173, column: 16, scope: !24, inlinedAt: !226)
!232 = !MDLocation(line: 173, column: 19, scope: !24, inlinedAt: !226)
!233 = !MDLocation(line: 173, column: 22, scope: !24, inlinedAt: !226)
!234 = !MDLocation(line: 179, column: 5, scope: !229)
!235 = !{!"0x100\00a\00164\000", !24, !7, !29, !226} ; [ DW_TAG_auto_variable ] [a] [line 164]
!236 = !MDLocation(line: 164, column: 6, scope: !24, inlinedAt: !226)
!237 = !{!"0x100\00b\00164\000", !24, !7, !33, !226} ; [ DW_TAG_auto_variable ] [b] [line 164]
!238 = !MDLocation(line: 164, column: 12, scope: !24, inlinedAt: !226)
!239 = !{!"0x100\00c\00164\000", !24, !7, !37, !226} ; [ DW_TAG_auto_variable ] [c] [line 164]
!240 = !MDLocation(line: 164, column: 19, scope: !24, inlinedAt: !226)
!241 = !{!"0x100\00x\00164\000", !24, !7, !29, !226} ; [ DW_TAG_auto_variable ] [x] [line 164]
!242 = !MDLocation(line: 164, column: 26, scope: !24, inlinedAt: !226)
!243 = !{!"0x100\00i\00163\000", !24, !7, !4, !226} ; [ DW_TAG_auto_variable ] [i] [line 163]
!244 = !MDLocation(line: 163, column: 6, scope: !24, inlinedAt: !226)
!245 = !MDLocation(line: 166, column: 2, scope: !24, inlinedAt: !226)
!246 = !MDLocation(line: 167, column: 8, scope: !198, inlinedAt: !226)
!247 = !MDLocation(line: 167, column: 31, scope: !200, inlinedAt: !226)
!248 = !MDLocation(line: 168, column: 11, scope: !202, inlinedAt: !226)
!249 = !MDLocation(line: 168, column: 11, scope: !198, inlinedAt: !226)
!250 = !MDLocation(line: 168, column: 20, scope: !202, inlinedAt: !226)
!251 = !MDLocation(line: 169, column: 11, scope: !206, inlinedAt: !226)
!252 = !MDLocation(line: 169, column: 11, scope: !198, inlinedAt: !226)
!253 = !MDLocation(line: 169, column: 22, scope: !209, inlinedAt: !226)
!254 = !MDLocation(line: 169, column: 20, scope: !206, inlinedAt: !226)
!255 = !{!"0x100\00q\00163\000", !24, !7, !4, !226} ; [ DW_TAG_auto_variable ] [q] [line 163]
!256 = !MDLocation(line: 163, column: 8, scope: !24, inlinedAt: !226)
!257 = !MDLocation(line: 173, column: 2, scope: !24, inlinedAt: !226)
!258 = !MDLocation(line: 174, column: 8, scope: !218, inlinedAt: !226)
!259 = !MDLocation(line: 174, column: 7, scope: !24, inlinedAt: !226)
!260 = !MDLocation(line: 174, column: 12, scope: !221, inlinedAt: !226)
!261 = !MDLocation(line: 175, column: 1, scope: !24, inlinedAt: !226)
!262 = !MDLocation(line: 179, column: 27, scope: !263)
!263 = !{!"0xb\003", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!264 = !MDLocation(line: 180, column: 18, scope: !41)
!265 = !MDLocation(line: 180, column: 3, scope: !41)
!266 = !MDLocation(line: 181, column: 1, scope: !41)
!267 = !MDLocation(line: 185, column: 6, scope: !47)
!268 = !MDLocation(line: 186, column: 2, scope: !269)
!269 = !{!"0xb\00186\002\0014", !1, !47}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!270 = !MDLocation(line: 186, column: 28, scope: !271)
!271 = !{!"0xb\00186\002\0015", !1, !269}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!272 = !MDLocation(line: 186, column: 23, scope: !273)
!273 = !{!"0xb\003", !1, !271}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/queens.c]
!274 = !MDLocation(line: 187, column: 2, scope: !47)
